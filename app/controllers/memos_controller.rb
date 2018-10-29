class MemosController < ApplicationController
    def index
        #トップページが呼ばれたときに動作するアクション
        @memos=Memo.all
    end
    
    def new
        #新規作成ページが呼ばれたときに動作するアクション
    end
    
    def create
        #新しいメモがフォームからPostされた時に動作するアクション
        Memo.create(title:params["memos"]["title"],body:params["memos"]["body"],category_id:params["memos"]["category_id"])
        redirect_to "/"
    end
    
    def destroy
        memo = Memo.find(params["id"])
        memo.destroy
        redirect_to "/"
    end
    
    def edit
        @memo = Memo.find(params["id"])
    end
    
    def update
         memo = Memo.find(params["id"])
         memo.title = params["memos"]["title"]
         memo.body = params["memos"]["body"]
         memo.category_id = params["memos"]["category_id"]
         memo.save
         redirect_to "/"
    end
end
