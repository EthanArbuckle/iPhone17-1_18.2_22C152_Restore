@interface NUArticlePageStyleOperation
- (BOOL)validateOperation;
- (FCArticle)article;
- (NUArticlePageStyleOperation)initWithArticle:(id)a3 pageNextAction:(unint64_t)a4 completion:(id)a5;
- (NUPageStyle)pageStyle;
- (id)completion;
- (unint64_t)pageNextAction;
- (void)operationDidFinishWithError:(id)a3;
- (void)performOperation;
- (void)setPageStyle:(id)a3;
@end

@implementation NUArticlePageStyleOperation

- (NUArticlePageStyleOperation)initWithArticle:(id)a3 pageNextAction:(unint64_t)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)NUArticlePageStyleOperation;
  v11 = [(FCOperation *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_article, a3);
    v12->_pageNextAction = a4;
    uint64_t v13 = MEMORY[0x223C968A0](v10);
    id completion = v12->_completion;
    v12->_id completion = (id)v13;
  }
  return v12;
}

- (BOOL)validateOperation
{
  v2 = [(NUArticlePageStyleOperation *)self article];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)performOperation
{
  BOOL v3 = [(NUArticlePageStyleOperation *)self article];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__NUArticlePageStyleOperation_performOperation__block_invoke;
  v4[3] = &unk_2645FFA18;
  v4[4] = self;
  [v3 performBlockWhenFullyLoaded:v4];
}

void __47__NUArticlePageStyleOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 headline];

  if (v4)
  {
    v5 = [v3 headline];
    v6 = [v5 sourceChannel];
    v7 = [v6 theme];

    v8 = [v7 nameImageAssetHandle];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __47__NUArticlePageStyleOperation_performOperation__block_invoke_2;
    v12[3] = &unk_2645FF500;
    uint64_t v9 = *(void *)(a1 + 32);
    id v13 = v8;
    uint64_t v14 = v9;
    id v15 = v3;
    id v10 = v8;
    id v11 = (id)[v10 downloadIfNeededWithCompletion:v12];
  }
  else
  {
    [*(id *)(a1 + 32) operationDidFinishWithError:0];
  }
}

void __47__NUArticlePageStyleOperation_performOperation__block_invoke_2(id *a1)
{
  v2 = [a1[4] filePath];

  if (v2)
  {
    id v3 = (void *)MEMORY[0x263F1C6B0];
    v4 = [a1[4] filePath];
    id v16 = [v3 imageWithContentsOfFile:v4];

    v5 = objc_alloc_init(NUPageStyle);
    [a1[5] setPageStyle:v5];

    v6 = [a1[5] pageStyle];
    [v6 setTitleImage:v16];

    v7 = [a1[6] headline];
    v8 = [v7 sourceName];
    uint64_t v9 = [a1[5] pageStyle];
    [v9 setTitle:v8];

    id v10 = NUBundle();
    id v11 = [v10 localizedStringForKey:@"Next Story" value:&stru_26D495918 table:0];
    v12 = [a1[5] pageStyle];
    [v12 setNextButtonTitle:v11];

    id v13 = a1[5];
    uint64_t v14 = 0;
  }
  else
  {
    id v15 = a1[5];
    uint64_t v14 = [a1[4] downloadError];
    id v13 = v15;
    id v16 = (id)v14;
  }
  [v13 operationDidFinishWithError:v14];
}

- (void)operationDidFinishWithError:(id)a3
{
  id v4 = a3;
  v6 = [(NUArticlePageStyleOperation *)self completion];
  v5 = [(NUArticlePageStyleOperation *)self pageStyle];
  v6[2](v6, v5, v4);
}

- (FCArticle)article
{
  return self->_article;
}

- (unint64_t)pageNextAction
{
  return self->_pageNextAction;
}

- (id)completion
{
  return self->_completion;
}

- (NUPageStyle)pageStyle
{
  return self->_pageStyle;
}

- (void)setPageStyle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageStyle, 0);
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong((id *)&self->_article, 0);
}

@end