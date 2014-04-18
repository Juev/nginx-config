server {
	server_name  juev.ru;
	rewrite ^(.*) http://www.juev.ru$1 permanent;
}

server {
	listen 80;
	server_name www.juev.ru;

	root /home/ubuntu/www/juevru;
	index index.html index.htm;
	autoindex off;

	charset utf-8;

	try_files $uri $uri/ =404;

	error_page 403 404 /articles.html;
	access_log  /home/ubuntu/logs/juevru/access.log;
	error_log   /home/ubuntu/logs/juevru/error.log;

	location ~ /\. {
		deny all;
		access_log      off;
		log_not_found   off;
	}

	location ~* ^.+\.(html|htm|php|xml|html.gz)$ {
		add_header Cache-Control "max-age=0, no-cache";
		add_header "X-UA-Compatible" "IE=Edge,chrome=1";
	}

	location ~* ^.+\.(css|js|jpg|jpeg|gif|png|ico|gz|svg|svgz|ttf|otf|woff|eot|mp4|ogg|ogv|webm)$ {
		access_log off;
		add_header Cache-Control  "public, max-age=2592000";
	}
}
