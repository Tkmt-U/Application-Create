class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
    #Listモデルに対して.allメソッドを使い、Blogモデル内のすべての投稿記事データを取得
  end

  def show
    @blog = Blog.find(params[:id]) #params[:id]で記事のIDを取得
  end

  def new
    @blog = Blog.new #空のモデルを作成、インスタンス変数に渡す
  end

  def create
    blog = Blog.new(blog_params) #新規登録するインスタンス作成
    blog.save #データをDBに保存
    redirect_to blog_path(blog.id) #リダイレクト
  end

  def edit
    @blog = Blog.find(params[:id]) #findでDBから投稿データを探す
  end

  def update
    blog = Blog.find(params[:id])
    blog.update(blog_params)
    redirect_to blog_path(blog)
  end

  private # ストロングパラメータ
  def blog_params #blog_paramsの中にフォームで入力されたデータが格納
    params.require(:blog).permit(:title, :category, :body)
    #paramsは送られてきた値を受け取る
    #requireでデータのオブジェクト名(:blog)を指定
    #permitでキー（:title,:body）を指定
  end
end
