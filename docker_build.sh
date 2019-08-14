cd `dirname $0`
docker-compose build
docker-compose up -d
# laravelプロジェクトが存在しない場合
# docker-compose exec php composer create-project --prefer-dist laravel/laravel .
# laravelのデバッグに便利なツール
# docker-compose exec php composer require --dev barryvdh/laravel-debugbar
cp ./setting/.env_base ./src/.env
docker-compose exec php composer install
docker-compose exec php php artisan key:generate
docker-compose exec php php artisan migrate:refresh
docker-compose down