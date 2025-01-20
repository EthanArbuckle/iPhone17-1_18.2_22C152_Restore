@interface FCNotificationPoolService
- (FCContentContext)context;
- (FCContentVariantProviding)contentVariantProvider;
- (FCNotificationPoolService)init;
- (FCNotificationPoolService)initWithContext:(id)a3 contentVariantProvider:(id)a4;
- (void)fetchPoolWithCompletionHandler:(id)a3;
@end

@implementation FCNotificationPoolService

- (FCNotificationPoolService)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCNotificationPoolService init]";
    __int16 v9 = 2080;
    v10 = "FCNotificationPoolService.m";
    __int16 v11 = 1024;
    int v12 = 26;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCNotificationPoolService init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCNotificationPoolService)initWithContext:(id)a3 contentVariantProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCNotificationPoolService;
  __int16 v9 = [(FCNotificationPoolService *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_contentVariantProvider, a4);
  }

  return v10;
}

- (void)fetchPoolWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [FCNotificationPoolOperation alloc];
  id v6 = [(FCNotificationPoolService *)self context];
  id v7 = [(FCNotificationPoolService *)self contentVariantProvider];
  id v8 = [(FCNotificationPoolOperation *)v5 initWithContext:v6 contentVariantProvider:v7];

  __int16 v9 = [MEMORY[0x1E4F1CA48] array];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __60__FCNotificationPoolService_fetchPoolWithCompletionHandler___block_invoke;
  v17[3] = &unk_1E5B56DA0;
  id v10 = v9;
  id v18 = v10;
  [(FCNotificationPoolOperation *)v8 setItemHandler:v17];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__FCNotificationPoolService_fetchPoolWithCompletionHandler___block_invoke_2;
  v14[3] = &unk_1E5B4E7A8;
  id v15 = v10;
  id v16 = v4;
  id v11 = v10;
  id v12 = v4;
  [(FCNotificationPoolOperation *)v8 setCompletionHandler:v14];
  __int16 v13 = objc_msgSend(MEMORY[0x1E4F28F08], "fc_sharedConcurrentQueue");
  [v13 addOperation:v8];
}

uint64_t __60__FCNotificationPoolService_fetchPoolWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __60__FCNotificationPoolService_fetchPoolWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v6 = (void (**)(id, void, id))*(id *)(a1 + 40);
    id v5 = v3;
    v6[2](v6, 0, v5);
  }
  else
  {
    id v4 = [[FCNotificationPool alloc] initWithItems:*(void *)(a1 + 32)];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __60__FCNotificationPoolService_fetchPoolWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (FCContentContext)context
{
  return self->_context;
}

- (FCContentVariantProviding)contentVariantProvider
{
  return self->_contentVariantProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentVariantProvider, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end