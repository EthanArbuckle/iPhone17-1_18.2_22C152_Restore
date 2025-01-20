@interface FCArticle
- (FCArticle)init;
- (FCArticle)initWithContext:(id)a3 articleID:(id)a4 forceArticleUpdate:(BOOL)a5 qualityOfService:(int64_t)a6 relativePriority:(int64_t)a7;
- (FCArticle)initWithContext:(id)a3 headline:(id)a4;
- (FCArticleContent)content;
- (FCFetchOperation)headlineFetchOperation;
- (FCHeadlineProviding)headline;
- (NSError)fetchError;
- (NSString)articleID;
- (OS_dispatch_group)fetchGroup;
- (void)dealloc;
- (void)performBlockWhenContentIsLoaded:(id)a3;
- (void)performBlockWhenFullyLoaded:(id)a3;
- (void)setContent:(id)a3;
- (void)setFetchError:(id)a3;
- (void)setFetchGroup:(id)a3;
- (void)setHeadline:(id)a3;
- (void)setHeadlineFetchOperation:(id)a3;
@end

@implementation FCArticle

- (FCHeadlineProviding)headline
{
  return self->_headline;
}

- (NSString)articleID
{
  return self->_articleID;
}

- (FCArticle)initWithContext:(id)a3 headline:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FCArticle;
  v8 = [(FCArticle *)&v16 init];
  if (v8)
  {
    uint64_t v9 = [v7 articleID];
    articleID = v8->_articleID;
    v8->_articleID = (NSString *)v9;

    objc_storeStrong((id *)&v8->_headline, a4);
    uint64_t v11 = [(FCHeadlineProviding *)v8->_headline contentWithContext:v6];
    content = v8->_content;
    v8->_content = (FCArticleContent *)v11;

    dispatch_group_t v13 = dispatch_group_create();
    fetchGroup = v8->_fetchGroup;
    v8->_fetchGroup = (OS_dispatch_group *)v13;
  }
  return v8;
}

- (void)performBlockWhenFullyLoaded:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "block != nil");
    *(_DWORD *)location = 136315906;
    *(void *)&location[4] = "-[FCArticle performBlockWhenFullyLoaded:]";
    __int16 v18 = 2080;
    v19 = "FCArticle.m";
    __int16 v20 = 1024;
    int v21 = 103;
    __int16 v22 = 2114;
    v23 = v10;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", location, 0x26u);
  }
  objc_initWeak((id *)location, self);
  v5 = [(FCArticle *)self fetchGroup];
  BOOL IsEmpty = FCDispatchGroupIsEmpty(v5);

  if (IsEmpty)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __41__FCArticle_performBlockWhenFullyLoaded___block_invoke;
    v14[3] = &unk_1E5B56D78;
    id v15 = v4;
    id v7 = &v16;
    objc_copyWeak(&v16, (id *)location);
    __41__FCArticle_performBlockWhenFullyLoaded___block_invoke((uint64_t)v14);
    v8 = &v15;
  }
  else
  {
    uint64_t v9 = [(FCArticle *)self fetchGroup];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__FCArticle_performBlockWhenFullyLoaded___block_invoke_2;
    block[3] = &unk_1E5B56D78;
    id v12 = v4;
    id v7 = &v13;
    objc_copyWeak(&v13, (id *)location);
    dispatch_group_notify(v9, MEMORY[0x1E4F14428], block);

    v8 = &v12;
  }
  objc_destroyWeak(v7);

  objc_destroyWeak((id *)location);
}

void __41__FCArticle_performBlockWhenFullyLoaded___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [v3 fetchError];
  (*(void (**)(uint64_t, id, void *))(v1 + 16))(v1, v3, v2);
}

- (OS_dispatch_group)fetchGroup
{
  return self->_fetchGroup;
}

- (NSError)fetchError
{
  return self->_fetchError;
}

- (FCArticle)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCArticle init]";
    __int16 v9 = 2080;
    v10 = "FCArticle.m";
    __int16 v11 = 1024;
    int v12 = 37;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCArticle init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCArticle)initWithContext:(id)a3 articleID:(id)a4 forceArticleUpdate:(BOOL)a5 qualityOfService:(int64_t)a6 relativePriority:(int64_t)a7
{
  BOOL v9 = a5;
  v33[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  v32.receiver = self;
  v32.super_class = (Class)FCArticle;
  v14 = [(FCArticle *)&v32 init];
  if (v14)
  {
    uint64_t v15 = [v13 copy];
    articleID = v14->_articleID;
    v14->_articleID = (NSString *)v15;

    v17 = [v12 articleController];
    v33[0] = v13;
    __int16 v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
    v19 = [v17 headlinesFetchOperationForArticleIDs:v18];

    [v19 setQualityOfService:a6];
    [v19 setRelativePriority:a7];
    if (v9)
    {
      [v19 setOverrideArticleCachePolicy:1];
      [v19 setArticleCachePolicy:1];
      [v19 setArticleMaximumCachedAge:0.0];
    }
    objc_storeStrong((id *)&v14->_headlineFetchOperation, v19);
    __int16 v20 = dispatch_group_create();
    objc_initWeak(&location, v14);
    dispatch_group_enter(v20);
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    v26 = __92__FCArticle_initWithContext_articleID_forceArticleUpdate_qualityOfService_relativePriority___block_invoke;
    v27 = &unk_1E5B56D50;
    objc_copyWeak(&v30, &location);
    id v28 = v12;
    int v21 = v20;
    v29 = v21;
    [(FCFetchOperation *)v14->_headlineFetchOperation setFetchCompletionBlock:&v24];
    objc_storeStrong((id *)&v14->_fetchGroup, v20);
    __int16 v22 = objc_msgSend(MEMORY[0x1E4F28F08], "fc_sharedConcurrentQueue", v24, v25, v26, v27);
    [v22 addOperation:v14->_headlineFetchOperation];

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
  return v14;
}

void __92__FCArticle_initWithContext_articleID_forceArticleUpdate_qualityOfService_relativePriority___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 error];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setFetchError:v4];

  id v6 = [v3 fetchedObject];

  id v7 = [v6 firstObject];
  id v8 = objc_loadWeakRetained((id *)(a1 + 48));
  [v8 setHeadline:v7];

  id v9 = objc_loadWeakRetained((id *)(a1 + 48));
  v10 = [v9 headline];
  __int16 v11 = [v10 contentWithContext:*(void *)(a1 + 32)];
  id v12 = objc_loadWeakRetained((id *)(a1 + 48));
  [v12 setContent:v11];

  id v13 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v13);
}

- (void)dealloc
{
  [(FCFetchOperation *)self->_headlineFetchOperation cancel];
  v3.receiver = self;
  v3.super_class = (Class)FCArticle;
  [(FCArticle *)&v3 dealloc];
}

void __41__FCArticle_performBlockWhenFullyLoaded___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [v3 fetchError];
  (*(void (**)(uint64_t, id, void *))(v1 + 16))(v1, v3, v2);
}

- (void)performBlockWhenContentIsLoaded:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "block != nil");
    *(_DWORD *)id location = 136315906;
    *(void *)&location[4] = "-[FCArticle performBlockWhenContentIsLoaded:]";
    __int16 v18 = 2080;
    v19 = "FCArticle.m";
    __int16 v20 = 1024;
    int v21 = 113;
    __int16 v22 = 2114;
    v23 = v10;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", location, 0x26u);
  }
  objc_initWeak((id *)location, self);
  v5 = [(FCArticle *)self fetchGroup];
  BOOL IsEmpty = FCDispatchGroupIsEmpty(v5);

  if (IsEmpty)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __45__FCArticle_performBlockWhenContentIsLoaded___block_invoke;
    v14[3] = &unk_1E5B56D78;
    id v15 = v4;
    id v7 = &v16;
    objc_copyWeak(&v16, (id *)location);
    __45__FCArticle_performBlockWhenContentIsLoaded___block_invoke((uint64_t)v14);
    id v8 = &v15;
  }
  else
  {
    id v9 = [(FCArticle *)self fetchGroup];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__FCArticle_performBlockWhenContentIsLoaded___block_invoke_2;
    block[3] = &unk_1E5B56D78;
    id v12 = v4;
    id v7 = &v13;
    objc_copyWeak(&v13, (id *)location);
    dispatch_group_notify(v9, MEMORY[0x1E4F14428], block);

    id v8 = &v12;
  }
  objc_destroyWeak(v7);

  objc_destroyWeak((id *)location);
}

void __45__FCArticle_performBlockWhenContentIsLoaded___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained content];
  id v4 = objc_loadWeakRetained(v2);
  v5 = [v4 fetchError];
  (*(void (**)(uint64_t, void *, void *))(v1 + 16))(v1, v3, v5);
}

void __45__FCArticle_performBlockWhenContentIsLoaded___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained content];
  id v4 = objc_loadWeakRetained(v2);
  v5 = [v4 fetchError];
  (*(void (**)(uint64_t, void *, void *))(v1 + 16))(v1, v3, v5);
}

- (void)setHeadline:(id)a3
{
}

- (FCArticleContent)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
}

- (void)setFetchGroup:(id)a3
{
}

- (void)setFetchError:(id)a3
{
}

- (FCFetchOperation)headlineFetchOperation
{
  return self->_headlineFetchOperation;
}

- (void)setHeadlineFetchOperation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headlineFetchOperation, 0);
  objc_storeStrong((id *)&self->_fetchError, 0);
  objc_storeStrong((id *)&self->_fetchGroup, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_headline, 0);
  objc_storeStrong((id *)&self->_articleID, 0);
}

@end