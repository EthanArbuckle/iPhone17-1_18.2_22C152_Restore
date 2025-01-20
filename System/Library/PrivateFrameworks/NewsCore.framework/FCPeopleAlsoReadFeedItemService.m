@interface FCPeopleAlsoReadFeedItemService
- (FCContentContext)contentContext;
- (FCNewsAppConfigurationManager)configurationManager;
- (FCPeopleAlsoReadFeedItemService)init;
- (FCPeopleAlsoReadFeedItemService)initWithConfigurationManager:(id)a3 contentContext:(id)a4 readingHistory:(id)a5;
- (FCReadingHistory)readingHistory;
- (void)fetchFeedItemsWithCursor:(id)a3 completion:(id)a4;
@end

@implementation FCPeopleAlsoReadFeedItemService

- (FCPeopleAlsoReadFeedItemService)initWithConfigurationManager:(id)a3 contentContext:(id)a4 readingHistory:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "configurationManager");
    *(_DWORD *)buf = 136315906;
    v20 = "-[FCPeopleAlsoReadFeedItemService initWithConfigurationManager:contentContext:readingHistory:]";
    __int16 v21 = 2080;
    v22 = "FCPeopleAlsoReadFeedItemService.m";
    __int16 v23 = 1024;
    int v24 = 38;
    __int16 v25 = 2114;
    v26 = v15;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v10) {
      goto LABEL_6;
    }
  }
  else if (v10)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "contentContext");
    *(_DWORD *)buf = 136315906;
    v20 = "-[FCPeopleAlsoReadFeedItemService initWithConfigurationManager:contentContext:readingHistory:]";
    __int16 v21 = 2080;
    v22 = "FCPeopleAlsoReadFeedItemService.m";
    __int16 v23 = 1024;
    int v24 = 39;
    __int16 v25 = 2114;
    v26 = v16;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  if (!v11 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "readingHistory");
    *(_DWORD *)buf = 136315906;
    v20 = "-[FCPeopleAlsoReadFeedItemService initWithConfigurationManager:contentContext:readingHistory:]";
    __int16 v21 = 2080;
    v22 = "FCPeopleAlsoReadFeedItemService.m";
    __int16 v23 = 1024;
    int v24 = 40;
    __int16 v25 = 2114;
    v26 = v17;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v18.receiver = self;
  v18.super_class = (Class)FCPeopleAlsoReadFeedItemService;
  v12 = [(FCPeopleAlsoReadFeedItemService *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_configurationManager, a3);
    objc_storeStrong((id *)&v13->_contentContext, a4);
    objc_storeStrong((id *)&v13->_readingHistory, a5);
  }

  return v13;
}

- (FCPeopleAlsoReadFeedItemService)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCPeopleAlsoReadFeedItemService init]";
    __int16 v9 = 2080;
    id v10 = "FCPeopleAlsoReadFeedItemService.m";
    __int16 v11 = 1024;
    int v12 = 31;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCPeopleAlsoReadFeedItemService init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void)fetchFeedItemsWithCursor:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(FCPeopleAlsoReadFeedItemService *)self configurationManager];
  __int16 v9 = [v8 possiblyUnfetchedAppConfiguration];

  if (objc_opt_respondsToSelector())
  {
    id v10 = [v9 peopleAlsoReadConfiguration];
    if (v10)
    {
      __int16 v11 = [FCPeopleAlsoReadArticlesOperation alloc];
      int v12 = [(FCPeopleAlsoReadFeedItemService *)self contentContext];
      __int16 v13 = [(FCPeopleAlsoReadFeedItemService *)self readingHistory];
      v14 = [(FCPeopleAlsoReadArticlesOperation *)v11 initWithContentContext:v12 configuration:v10 readingHistory:v13 cursor:v6];

      [(FCPeopleAlsoReadArticlesOperation *)v14 setCompletionHandler:v7];
      [(FCOperation *)v14 start];
    }
    else
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __71__FCPeopleAlsoReadFeedItemService_fetchFeedItemsWithCursor_completion___block_invoke_2;
      v15[3] = &unk_1E5B4CA88;
      id v16 = v7;
      __71__FCPeopleAlsoReadFeedItemService_fetchFeedItemsWithCursor_completion___block_invoke_2((uint64_t)v15);
    }
  }
  else
  {
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __71__FCPeopleAlsoReadFeedItemService_fetchFeedItemsWithCursor_completion___block_invoke;
    v20 = &unk_1E5B4CA88;
    id v21 = v7;
    (*((void (**)(id, void, void))v21 + 2))(v21, MEMORY[0x1E4F1CBF0], 0);
    id v10 = v21;
  }
}

uint64_t __71__FCPeopleAlsoReadFeedItemService_fetchFeedItemsWithCursor_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71__FCPeopleAlsoReadFeedItemService_fetchFeedItemsWithCursor_completion___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"FCErrorDomain" code:44 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (FCNewsAppConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

- (FCReadingHistory)readingHistory
{
  return self->_readingHistory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readingHistory, 0);
  objc_storeStrong((id *)&self->_contentContext, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
}

@end