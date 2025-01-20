@interface NUArticlePage
- (BOOL)allowNeighboringAdvertising;
- (FCArticle)article;
- (FCAsyncOnceOperation)asyncOnceOperation;
- (FCOperationCanceling)asyncOnceCancelHandler;
- (NSString)identifier;
- (NUActivityProvider)activityProvider;
- (NUArticleActivityFactory)articleActivityFactory;
- (NUArticleHostViewControllerFactory)articleHostViewControllerFactory;
- (NUArticlePage)initWithArticle:(id)a3 articleHostViewControllerFactory:(id)a4 articleActivityFactory:(id)a5 pageNextAction:(unint64_t)a6;
- (NUPageStyle)pageStyle;
- (NUPageable)articleViewController;
- (id)asyncOnceLoadPageStyle:(id)a3;
- (id)viewController;
- (unint64_t)pageNextAction;
- (void)activityProvider:(id)a3;
- (void)pageStyling:(id)a3;
- (void)prepare;
- (void)setActivityProvider:(id)a3;
- (void)setArticleViewController:(id)a3;
- (void)setAsyncOnceCancelHandler:(id)a3;
- (void)setAsyncOnceOperation:(id)a3;
- (void)setPageNextAction:(unint64_t)a3;
- (void)setPageStyle:(id)a3;
- (void)unprepare;
@end

@implementation NUArticlePage

- (NUArticlePage)initWithArticle:(id)a3 articleHostViewControllerFactory:(id)a4 articleActivityFactory:(id)a5 pageNextAction:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)NUArticlePage;
  v14 = [(NUArticlePage *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_article, a3);
    objc_storeStrong((id *)&v15->_articleHostViewControllerFactory, a4);
    v15->_pageNextAction = a6;
    uint64_t v16 = [objc_alloc(MEMORY[0x263F59390]) initWithTarget:v15 selector:sel_asyncOnceLoadPageStyle_];
    asyncOnceOperation = v15->_asyncOnceOperation;
    v15->_asyncOnceOperation = (FCAsyncOnceOperation *)v16;

    objc_storeStrong((id *)&v15->_articleActivityFactory, a5);
  }

  return v15;
}

- (NSString)identifier
{
  v2 = [(NUArticlePage *)self article];
  v3 = [v2 articleID];

  return (NSString *)v3;
}

- (id)viewController
{
  v3 = [(NUArticlePage *)self articleViewController];

  if (!v3) {
    [(NUArticlePage *)self prepare];
  }

  return [(NUArticlePage *)self articleViewController];
}

- (void)prepare
{
  v3 = [(NUArticlePage *)self articleViewController];

  if (!v3)
  {
    v4 = [(NUArticlePage *)self articleHostViewControllerFactory];
    v5 = [(NUArticlePage *)self article];
    v6 = [v4 createArticleHostViewControllerForArticle:v5];
    [(NUArticlePage *)self setArticleViewController:v6];
  }
  v7 = [(NUArticlePage *)self pageStyle];

  if (!v7)
  {
    [(NUArticlePage *)self pageStyling:0];
  }
}

- (void)unprepare
{
  v3 = [(NUArticlePage *)self articleViewController];
  v4 = [v3 parentViewController];

  if (!v4) {
    [(NUArticlePage *)self setArticleViewController:0];
  }
  v5 = [(NUArticlePage *)self asyncOnceCancelHandler];
  [v5 cancel];

  v6 = [(NUArticlePage *)self pageStyle];

  if (!v6)
  {
    id v7 = (id)[objc_alloc(MEMORY[0x263F59390]) initWithTarget:self selector:sel_asyncOnceLoadPageStyle_];
    [(NUArticlePage *)self setAsyncOnceOperation:v7];
  }
}

- (BOOL)allowNeighboringAdvertising
{
  return 1;
}

- (void)pageStyling:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = [(NUArticlePage *)self pageStyle];

  if (v5)
  {
    if (v4)
    {
      v6 = [(NUArticlePage *)self pageStyle];
      v4[2](v4, v6);
    }
  }
  else
  {
    objc_initWeak(&location, self);
    id v7 = [(NUArticlePage *)self asyncOnceOperation];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __29__NUArticlePage_pageStyling___block_invoke;
    v9[3] = &unk_2645FE2E8;
    v10 = v4;
    objc_copyWeak(&v11, &location);
    v8 = [v7 executeWithCompletionHandler:v9];
    [(NUArticlePage *)self setAsyncOnceCancelHandler:v8];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __29__NUArticlePage_pageStyling___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v2 = [WeakRetained pageStyle];
    (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
  }
}

- (void)activityProvider:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = [(NUArticlePage *)self activityProvider];

  if (v5)
  {
    v6 = [(NUArticlePage *)self activityProvider];
    v4[2](v4, v6);
  }
  else
  {
    objc_initWeak(&location, self);
    article = self->_article;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __34__NUArticlePage_activityProvider___block_invoke;
    v8[3] = &unk_2645FE310;
    objc_copyWeak(&v10, &location);
    v9 = v4;
    [(FCArticle *)article performBlockWhenFullyLoaded:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __34__NUArticlePage_activityProvider___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  v5 = [WeakRetained articleActivityFactory];
  v6 = [v4 headline];

  id v7 = [v5 activityProviderForHeadline:v6 reportConcernViewPresenter:0 URLModifier:0];
  [WeakRetained setActivityProvider:v7];

  uint64_t v8 = *(void *)(a1 + 32);
  v9 = [WeakRetained activityProvider];
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
}

- (id)asyncOnceLoadPageStyle:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [NUArticlePageStyleOperation alloc];
  v6 = [(NUArticlePage *)self article];
  unint64_t v7 = [(NUArticlePage *)self pageNextAction];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __40__NUArticlePage_asyncOnceLoadPageStyle___block_invoke;
  v12[3] = &unk_2645FE360;
  objc_copyWeak(&v14, &location);
  id v8 = v4;
  id v13 = v8;
  v9 = [(NUArticlePageStyleOperation *)v5 initWithArticle:v6 pageNextAction:v7 completion:v12];

  id v10 = objc_msgSend(MEMORY[0x263F08A48], "fc_sharedConcurrentQueue");
  [v10 addOperation:v9];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v9;
}

void __40__NUArticlePage_asyncOnceLoadPageStyle___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__NUArticlePage_asyncOnceLoadPageStyle___block_invoke_2;
  block[3] = &unk_2645FE338;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v8);
}

uint64_t __40__NUArticlePage_asyncOnceLoadPageStyle___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setPageStyle:v2];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

- (FCArticle)article
{
  return self->_article;
}

- (NUArticleHostViewControllerFactory)articleHostViewControllerFactory
{
  return self->_articleHostViewControllerFactory;
}

- (NUArticleActivityFactory)articleActivityFactory
{
  return self->_articleActivityFactory;
}

- (NUPageStyle)pageStyle
{
  return self->_pageStyle;
}

- (void)setPageStyle:(id)a3
{
}

- (NUActivityProvider)activityProvider
{
  return self->_activityProvider;
}

- (void)setActivityProvider:(id)a3
{
}

- (FCAsyncOnceOperation)asyncOnceOperation
{
  return self->_asyncOnceOperation;
}

- (void)setAsyncOnceOperation:(id)a3
{
}

- (FCOperationCanceling)asyncOnceCancelHandler
{
  return self->_asyncOnceCancelHandler;
}

- (void)setAsyncOnceCancelHandler:(id)a3
{
}

- (NUPageable)articleViewController
{
  return self->_articleViewController;
}

- (void)setArticleViewController:(id)a3
{
}

- (unint64_t)pageNextAction
{
  return self->_pageNextAction;
}

- (void)setPageNextAction:(unint64_t)a3
{
  self->_pageNextAction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_articleViewController, 0);
  objc_storeStrong((id *)&self->_asyncOnceCancelHandler, 0);
  objc_storeStrong((id *)&self->_asyncOnceOperation, 0);
  objc_storeStrong((id *)&self->_activityProvider, 0);
  objc_storeStrong((id *)&self->_pageStyle, 0);
  objc_storeStrong((id *)&self->_articleActivityFactory, 0);
  objc_storeStrong((id *)&self->_articleHostViewControllerFactory, 0);

  objc_storeStrong((id *)&self->_article, 0);
}

@end