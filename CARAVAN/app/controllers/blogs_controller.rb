class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
    #Listモデルに対して.allメソッドを使い、Blogモデル内のすべての投稿記事データを取得
  end

  def show
  end

  def new
    @blog = Blog.new #空のモデルを作成、インスタンス変数に渡す
  end

  def create
    blog = Blog.new(blog_params) #新規登録するインスタンス作成
    blog.save #データをDBに保存
    redirect_to blogs_path #リダイレクト
  end

  def edit
  end

  private # ストロングパラメータ
  def blog_params #blog_paramsの中にフォームで入力されたデータが格納
    params.require(:blog).permit(:title, :category, :body)
    #paramsは送られてきた値を受け取る
    #requireでデータのオブジェクト名(:blog)を指定
    #permitでキー（:title,:body）を指定
  end
end
