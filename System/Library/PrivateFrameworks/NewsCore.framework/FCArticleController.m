@interface FCArticleController
- (FCArticleController)init;
- (FCArticleController)initWithContext:(id)a3;
- (FCContentContext)context;
- (id)articleWithHeadline:(id)a3;
- (id)articleWithID:(id)a3;
- (id)articleWithID:(id)a3 forceArticleUpdate:(BOOL)a4 qualityOfService:(int64_t)a5 relativePriority:(int64_t)a6;
- (id)articleWithID:(id)a3 qualityOfService:(int64_t)a4 relativePriority:(int64_t)a5;
- (id)articleWithID:(id)a3 relativePriority:(int64_t)a4;
- (id)headlinesFetchOperationForArticleIDs:(id)a3;
- (id)headlinesFetchOperationForArticleIDs:(id)a3 ignoreCacheForArticleIDs:(id)a4;
- (void)setContext:(id)a3;
@end

@implementation FCArticleController

- (FCArticleController)initWithContext:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "context != nil");
    *(_DWORD *)buf = 136315906;
    v12 = "-[FCArticleController initWithContext:]";
    __int16 v13 = 2080;
    v14 = "FCArticleController.m";
    __int16 v15 = 1024;
    int v16 = 33;
    __int16 v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v10.receiver = self;
  v10.super_class = (Class)FCArticleController;
  v6 = [(FCArticleController *)&v10 init];
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->_context, a3);
    }
    else
    {

      v7 = 0;
    }
  }

  return v7;
}

- (id)articleWithHeadline:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [FCArticle alloc];
    v6 = [(FCArticleController *)self context];
    v7 = [(FCArticle *)v5 initWithContext:v6 headline:v4];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "headline != nil");
      *(_DWORD *)buf = 136315906;
      v11 = "-[FCArticleController articleWithHeadline:]";
      __int16 v12 = 2080;
      __int16 v13 = "FCArticleController.m";
      __int16 v14 = 1024;
      int v15 = 90;
      __int16 v16 = 2114;
      __int16 v17 = v9;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    v7 = 0;
  }

  return v7;
}

- (FCContentContext)context
{
  return self->_context;
}

- (FCArticleController)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCArticleController init]";
    __int16 v9 = 2080;
    objc_super v10 = "FCArticleController.m";
    __int16 v11 = 1024;
    int v12 = 28;
    __int16 v13 = 2114;
    __int16 v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCArticleController init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (id)articleWithID:(id)a3
{
  return [(FCArticleController *)self articleWithID:a3 qualityOfService:-1 relativePriority:0];
}

- (id)articleWithID:(id)a3 relativePriority:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = 25;
  if (!a4) {
    uint64_t v7 = 17;
  }
  if (a4 == -1) {
    uint64_t v8 = 9;
  }
  else {
    uint64_t v8 = v7;
  }
  __int16 v9 = [(FCArticleController *)self articleWithID:v6 forceArticleUpdate:0 qualityOfService:v8 relativePriority:a4];

  return v9;
}

- (id)articleWithID:(id)a3 qualityOfService:(int64_t)a4 relativePriority:(int64_t)a5
{
  return [(FCArticleController *)self articleWithID:a3 forceArticleUpdate:0 qualityOfService:a4 relativePriority:a5];
}

- (id)articleWithID:(id)a3 forceArticleUpdate:(BOOL)a4 qualityOfService:(int64_t)a5 relativePriority:(int64_t)a6
{
  BOOL v8 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (v10)
  {
    __int16 v11 = [FCArticle alloc];
    int v12 = [(FCArticleController *)self context];
    __int16 v13 = [(FCArticle *)v11 initWithContext:v12 articleID:v10 forceArticleUpdate:v8 qualityOfService:a5 relativePriority:a6];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "articleID != nil");
      *(_DWORD *)buf = 136315906;
      __int16 v17 = "-[FCArticleController articleWithID:forceArticleUpdate:qualityOfService:relativePriority:]";
      __int16 v18 = 2080;
      uint64_t v19 = "FCArticleController.m";
      __int16 v20 = 1024;
      int v21 = 72;
      __int16 v22 = 2114;
      v23 = v15;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    __int16 v13 = 0;
  }

  return v13;
}

- (id)headlinesFetchOperationForArticleIDs:(id)a3
{
  id v4 = a3;
  id v5 = [FCArticleHeadlinesFetchOperation alloc];
  id v6 = [(FCArticleController *)self context];
  uint64_t v7 = [(FCArticleHeadlinesFetchOperation *)v5 initWithContext:v6 articleIDs:v4 ignoreCacheForArticleIDs:0];

  return v7;
}

- (id)headlinesFetchOperationForArticleIDs:(id)a3 ignoreCacheForArticleIDs:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [FCArticleHeadlinesFetchOperation alloc];
  __int16 v9 = [(FCArticleController *)self context];
  id v10 = [(FCArticleHeadlinesFetchOperation *)v8 initWithContext:v9 articleIDs:v7 ignoreCacheForArticleIDs:v6];

  return v10;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end