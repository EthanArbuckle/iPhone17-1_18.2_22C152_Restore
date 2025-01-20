@interface PPTopicReadWriteServerRequestHandler
- (void)clearWithCompletion:(id)a3;
- (void)cloudSyncWithCompletion:(id)a3;
- (void)computeAndCacheTopicScores:(id)a3;
- (void)deleteAllTopicsFromSourcesWithBundleId:(id)a3 completion:(id)a4;
- (void)deleteAllTopicsFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 completion:(id)a5;
- (void)deleteAllTopicsFromSourcesWithBundleId:(id)a3 groupId:(id)a4 olderThanDate:(id)a5 completion:(id)a6;
- (void)deleteAllTopicsFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 completion:(id)a5;
- (void)deleteAllTopicsWithTopicId:(id)a3 completion:(id)a4;
- (void)donateTopics:(id)a3 source:(id)a4 algorithm:(unint64_t)a5 cloudSync:(BOOL)a6 sentimentScore:(double)a7 exactMatchesInSourceText:(id)a8 completion:(id)a9;
@end

@implementation PPTopicReadWriteServerRequestHandler

- (void)computeAndCacheTopicScores:(id)a3
{
  v3 = (void (**)(id, uint64_t, id))a3;
  v4 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEFAULT, "PPTopicReadWriteServer: computeAndCacheTopicScores", buf, 2u);
  }

  v5 = +[PPLocalTopicStore defaultStore];
  id v8 = 0;
  uint64_t v6 = [v5 computeAndCacheTopicScores:&v8];
  id v7 = v8;

  v3[2](v3, v6, v7);
}

- (void)clearWithCompletion:(id)a3
{
  v3 = (void (**)(id, uint64_t, void, id))a3;
  v4 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEFAULT, "PPTopicReadWriteServer: clear", buf, 2u);
  }

  *(void *)buf = 0;
  v5 = +[PPLocalTopicStore defaultStore];
  id v8 = 0;
  uint64_t v6 = [v5 clearWithError:&v8 deletedCount:buf];
  id v7 = v8;

  v3[2](v3, v6, *(void *)buf, v7);
}

- (void)cloudSyncWithCompletion:(id)a3
{
  v3 = (void (**)(id, uint64_t, id))a3;
  v4 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEFAULT, "PPTopicReadWriteServer: cloudSync", buf, 2u);
  }

  v5 = +[PPLocalTopicStore defaultStore];
  id v8 = 0;
  uint64_t v6 = [v5 cloudSyncWithError:&v8];
  id v7 = v8;

  v3[2](v3, v6, v7);
}

- (void)deleteAllTopicsFromSourcesWithBundleId:(id)a3 groupId:(id)a4 olderThanDate:(id)a5 completion:(id)a6
{
  v9 = (void (**)(id, uint64_t, void, id))a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_DEFAULT, "PPTopicReadWriteServer: deleteAllTopicsFromSourcesWithBundleId:groupId:olderThanDate:", buf, 2u);
  }

  *(void *)buf = 0;
  v14 = +[PPLocalTopicStore defaultStore];
  id v17 = 0;
  uint64_t v15 = [v14 deleteAllTopicsFromSourcesWithBundleId:v12 groupId:v11 olderThan:v10 deletedCount:buf error:&v17];

  id v16 = v17;
  v9[2](v9, v15, *(void *)buf, v16);
}

- (void)deleteAllTopicsWithTopicId:(id)a3 completion:(id)a4
{
  v5 = (void (**)(id, uint64_t, void, id))a4;
  id v6 = a3;
  id v7 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "PPTopicReadWriteServer: deleteAllTopicsFromSourcesWithTopicId", buf, 2u);
  }

  *(void *)buf = 0;
  id v8 = +[PPLocalTopicStore defaultStore];
  id v11 = 0;
  uint64_t v9 = [v8 deleteAllTopicsWithTopicId:v6 deletedCount:buf error:&v11];

  id v10 = v11;
  v5[2](v5, v9, *(void *)buf, v10);
}

- (void)deleteAllTopicsFromSourcesWithBundleId:(id)a3 completion:(id)a4
{
  v5 = (void (**)(id, uint64_t, void, id))a4;
  id v6 = a3;
  id v7 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "PPTopicReadWriteServer: deleteAllTopicsFromSourcesWithBundleId:", buf, 2u);
  }

  *(void *)buf = 0;
  id v8 = +[PPLocalTopicStore defaultStore];
  id v11 = 0;
  uint64_t v9 = [v8 deleteAllTopicsFromSourcesWithBundleId:v6 deletedCount:buf error:&v11];

  id v10 = v11;
  v5[2](v5, v9, *(void *)buf, v10);
}

- (void)deleteAllTopicsFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 completion:(id)a5
{
  id v7 = (void (**)(id, uint64_t, void, id))a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_DEFAULT, "PPTopicReadWriteServer: deleteAllTopicsFromSourcesWithBundleId:groupIds:", buf, 2u);
  }

  *(void *)buf = 0;
  id v11 = +[PPLocalTopicStore defaultStore];
  id v14 = 0;
  uint64_t v12 = [v11 deleteAllTopicsFromSourcesWithBundleId:v9 groupIds:v8 deletedCount:buf error:&v14];

  id v13 = v14;
  v7[2](v7, v12, *(void *)buf, v13);
}

- (void)deleteAllTopicsFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 completion:(id)a5
{
  id v7 = (void (**)(id, uint64_t, void, id))a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_DEFAULT, "PPTopicReadWriteServer: deleteAllTopicsFromSourcesWithBundleId:documentIds:", buf, 2u);
  }

  *(void *)buf = 0;
  id v11 = +[PPLocalTopicStore defaultStore];
  id v14 = 0;
  uint64_t v12 = [v11 deleteAllTopicsFromSourcesWithBundleId:v9 documentIds:v8 deletedCount:buf error:&v14];

  id v13 = v14;
  v7[2](v7, v12, *(void *)buf, v13);
}

- (void)donateTopics:(id)a3 source:(id)a4 algorithm:(unint64_t)a5 cloudSync:(BOOL)a6 sentimentScore:(double)a7 exactMatchesInSourceText:(id)a8 completion:(id)a9
{
  BOOL v12 = a6;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = (void (**)(id, uint64_t, id))a9;
  id v17 = a8;
  id v18 = a4;
  v19 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v25 = [v15 count];
    _os_log_impl(&dword_1CA9A8000, v19, OS_LOG_TYPE_DEFAULT, "PPTopicReadWriteServer: donateTopics: %tu topics", buf, 0xCu);
  }

  v20 = +[PPLocalTopicStore defaultStore];
  id v23 = 0;
  uint64_t v21 = [v20 donateTopics:v15 source:v18 algorithm:a5 cloudSync:v12 sentimentScore:v17 exactMatchesInSourceText:&v23 error:a7];

  id v22 = v23;
  v16[2](v16, v21, v22);
}

@end