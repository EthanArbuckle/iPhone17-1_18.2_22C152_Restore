@interface SKUIProductReviewURLProvider
- (NSString)itemID;
- (NSURL)rateURL;
- (NSURL)writeReviewURL;
- (SKUIProductReviewURLProvider)init;
- (SKUIProductReviewURLProvider)initWithClientContext:(id)a3 itemID:(id)a4;
- (SSURLBag)urlBag;
- (id)_urlByAppendingItemId:(id)a3;
- (void)fetchURLsWithCompletion:(id)a3;
- (void)setItemID:(id)a3;
- (void)setRateURL:(id)a3;
- (void)setUrlBag:(id)a3;
- (void)setWriteReviewURL:(id)a3;
@end

@implementation SKUIProductReviewURLProvider

- (SKUIProductReviewURLProvider)init
{
  v3 = objc_alloc_init(SKUIClientContext);
  v4 = [(SKUIProductReviewURLProvider *)self initWithClientContext:v3 itemID:&stru_1F1C879E8];

  return v4;
}

- (SKUIProductReviewURLProvider)initWithClientContext:(id)a3 itemID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SKUIProductReviewURLProvider;
  v8 = [(SKUIProductReviewURLProvider *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_itemID, a4);
    uint64_t v10 = [v6 URLBag];
    urlBag = v9->_urlBag;
    v9->_urlBag = (SSURLBag *)v10;
  }
  return v9;
}

- (void)fetchURLsWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(SKUIProductReviewURLProvider *)self urlBag];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__SKUIProductReviewURLProvider_fetchURLsWithCompletion___block_invoke;
  v7[3] = &unk_1E6426670;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  v7[4] = self;
  id v8 = v6;
  [v5 loadValueForKey:@"p2-application-user-rate-content" completionBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __56__SKUIProductReviewURLProvider_fetchURLsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [WeakRetained _urlByAppendingItemId:v5];
      [WeakRetained setRateURL:v8];
    }
  }
  id v9 = [WeakRetained urlBag];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__SKUIProductReviewURLProvider_fetchURLsWithCompletion___block_invoke_2;
  v12[3] = &unk_1E6426648;
  v12[4] = WeakRetained;
  id v10 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v10;
  v12[5] = *(void *)(a1 + 32);
  id v11 = v6;
  [v9 loadValueForKey:@"p2-application-user-write-review" completionBlock:v12];
}

void __56__SKUIProductReviewURLProvider_fetchURLsWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  unint64_t v5 = a3;
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [*(id *)(a1 + 32) _urlByAppendingItemId:v8];
      [*(id *)(a1 + 32) setWriteReviewURL:v6];
    }
  }
  uint64_t v7 = *(void *)(a1 + 56);
  if (v7) {
    (*(void (**)(uint64_t, void, BOOL))(v7 + 16))(v7, *(void *)(a1 + 40), (v5 | *(void *)(a1 + 48)) == 0);
  }
}

- (id)_urlByAppendingItemId:(id)a3
{
  id v4 = [MEMORY[0x1E4F29088] componentsWithString:a3];
  unint64_t v5 = (void *)MEMORY[0x1E4F290C8];
  id v6 = [(SKUIProductReviewURLProvider *)self itemID];
  uint64_t v7 = [v5 queryItemWithName:@"id" value:v6];

  id v8 = [v4 queryItems];
  id v9 = [v8 arrayByAddingObject:v7];
  [v4 setQueryItems:v9];

  id v10 = [v4 URL];

  return v10;
}

- (NSURL)rateURL
{
  return self->_rateURL;
}

- (void)setRateURL:(id)a3
{
}

- (NSURL)writeReviewURL
{
  return self->_writeReviewURL;
}

- (void)setWriteReviewURL:(id)a3
{
}

- (NSString)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
}

- (SSURLBag)urlBag
{
  return self->_urlBag;
}

- (void)setUrlBag:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlBag, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_writeReviewURL, 0);

  objc_storeStrong((id *)&self->_rateURL, 0);
}

@end