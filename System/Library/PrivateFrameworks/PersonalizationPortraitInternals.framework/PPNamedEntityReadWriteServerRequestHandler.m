@interface PPNamedEntityReadWriteServerRequestHandler
- (void)clearWithCompletion:(id)a3;
- (void)cloudSyncWithCompletion:(id)a3;
- (void)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 completion:(id)a4;
- (void)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 completion:(id)a5;
- (void)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 groupId:(id)a4 olderThanDate:(id)a5 completion:(id)a6;
- (void)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 completion:(id)a5;
- (void)donateLocationNamedEntities:(id)a3 bundleId:(id)a4 groupId:(id)a5 completion:(id)a6;
- (void)donateMapItem:(id)a3 forPlaceName:(id)a4 completion:(id)a5;
- (void)donateNamedEntities:(id)a3 source:(id)a4 algorithm:(unint64_t)a5 cloudSync:(BOOL)a6 sentimentScore:(double)a7 completion:(id)a8;
- (void)flushDonationsWithCompletion:(id)a3;
- (void)removeMapItemForPlaceName:(id)a3 completion:(id)a4;
- (void)removeMapItemsBeforeCutoffDate:(id)a3 completion:(id)a4;
@end

@implementation PPNamedEntityReadWriteServerRequestHandler

- (void)donateLocationNamedEntities:(id)a3 bundleId:(id)a4 groupId:(id)a5 completion:(id)a6
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v10 = (void (**)(id, uint64_t, id))a6;
  id v11 = a5;
  id v12 = a4;
  v13 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v19 = [v9 count];
    _os_log_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_DEFAULT, "PPNamedEntityReadWriteServer: donateLocationNamedEntities: %tu entities", buf, 0xCu);
  }

  v14 = +[PPLocalNamedEntityStore defaultStore];
  id v17 = 0;
  uint64_t v15 = [v14 donateLocationNamedEntities:v9 bundleId:v12 groupId:v11 error:&v17];

  id v16 = v17;
  v10[2](v10, v15, v16);
}

- (void)removeMapItemsBeforeCutoffDate:(id)a3 completion:(id)a4
{
  v5 = (void (**)(id, uint64_t, id))a4;
  id v6 = a3;
  v7 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "PPNamedEntityReadWriteServer: removeMapItemsBeforeCutoffDate", buf, 2u);
  }

  v8 = +[PPLocalNamedEntityStore defaultStore];
  id v11 = 0;
  uint64_t v9 = [v8 removeMapItemsBeforeCutoffDate:v6 error:&v11];

  id v10 = v11;
  v5[2](v5, v9, v10);
}

- (void)removeMapItemForPlaceName:(id)a3 completion:(id)a4
{
  v5 = (void (**)(id, uint64_t, id))a4;
  id v6 = a3;
  v7 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "PPNamedEntityReadWriteServer: removeMapItemForPlaceName", buf, 2u);
  }

  v8 = +[PPLocalNamedEntityStore defaultStore];
  id v11 = 0;
  uint64_t v9 = [v8 removeMapItemForPlaceName:v6 error:&v11];

  id v10 = v11;
  v5[2](v5, v9, v10);
}

- (void)donateMapItem:(id)a3 forPlaceName:(id)a4 completion:(id)a5
{
  v7 = (void (**)(id, uint64_t, id))a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_DEFAULT, "PPNamedEntityReadWriteServer: donateMapItem", buf, 2u);
  }

  id v11 = +[PPLocalNamedEntityStore defaultStore];
  id v14 = 0;
  uint64_t v12 = [v11 donateMapItem:v9 forPlaceName:v8 error:&v14];

  id v13 = v14;
  v7[2](v7, v12, v13);
}

- (void)clearWithCompletion:(id)a3
{
  v3 = (void (**)(id, uint64_t, void, id))a3;
  v4 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEFAULT, "PPNamedEntityReadWriteServer: clear", buf, 2u);
  }

  *(void *)buf = 0;
  v5 = +[PPLocalNamedEntityStore defaultStore];
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
    _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEFAULT, "PPNamedEntityReadWriteServer: cloudSync", buf, 2u);
  }

  v5 = +[PPLocalNamedEntityStore defaultStore];
  id v8 = 0;
  uint64_t v6 = [v5 cloudSyncWithError:&v8];
  id v7 = v8;

  v3[2](v3, v6, v7);
}

- (void)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 groupId:(id)a4 olderThanDate:(id)a5 completion:(id)a6
{
  id v9 = (void (**)(id, uint64_t, void, id))a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_DEFAULT, "PPNamedEntityReadWriteServer: deleteAllNamedEntitiesFromSourcesWithBundleId:groupId:olderThanDate", buf, 2u);
  }

  *(void *)buf = 0;
  id v14 = +[PPLocalNamedEntityStore defaultStore];
  id v17 = 0;
  uint64_t v15 = [v14 deleteAllNamedEntitiesFromSourcesWithBundleId:v12 groupId:v11 olderThan:v10 deletedCount:buf error:&v17];

  id v16 = v17;
  v9[2](v9, v15, *(void *)buf, v16);
}

- (void)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 completion:(id)a4
{
  v5 = (void (**)(id, uint64_t, void, id))a4;
  id v6 = a3;
  id v7 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "PPNamedEntityReadWriteServer: deleteAllNamedEntitiesFromSourcesWithBundleId", buf, 2u);
  }

  *(void *)buf = 0;
  id v8 = +[PPLocalNamedEntityStore defaultStore];
  id v11 = 0;
  uint64_t v9 = [v8 deleteAllNamedEntitiesFromSourcesWithBundleId:v6 deletedCount:buf error:&v11];

  id v10 = v11;
  v5[2](v5, v9, *(void *)buf, v10);
}

- (void)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 completion:(id)a5
{
  id v7 = (void (**)(id, uint64_t, void, id))a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_DEFAULT, "PPNamedEntityReadWriteServer: deleteAllNamedEntitiesFromSourcesWithBundleId:groupIds:", buf, 2u);
  }

  *(void *)buf = 0;
  id v11 = +[PPLocalNamedEntityStore defaultStore];
  id v14 = 0;
  uint64_t v12 = [v11 deleteAllNamedEntitiesFromSourcesWithBundleId:v9 groupIds:v8 deletedCount:buf error:&v14];

  id v13 = v14;
  v7[2](v7, v12, *(void *)buf, v13);
}

- (void)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 completion:(id)a5
{
  id v7 = (void (**)(id, uint64_t, void, id))a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_DEFAULT, "PPNamedEntityReadWriteServer: deleteAllNamedEntitiesFromSourcesWithBundleId:documentIds:", buf, 2u);
  }

  *(void *)buf = 0;
  id v11 = +[PPLocalNamedEntityStore defaultStore];
  id v14 = 0;
  uint64_t v12 = [v11 deleteAllNamedEntitiesFromSourcesWithBundleId:v9 documentIds:v8 deletedCount:buf error:&v14];

  id v13 = v14;
  v7[2](v7, v12, *(void *)buf, v13);
}

- (void)flushDonationsWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = (void (**)(void))a3;
  v4 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEFAULT, "PPNamedEntityReadWriteServer: flushDonations", buf, 2u);
  }

  v5 = +[PPLocalNamedEntityStore defaultStore];
  id v9 = 0;
  char v6 = [v5 flushDonationsWithError:&v9];
  id v7 = v9;

  if ((v6 & 1) == 0)
  {
    id v8 = pp_xpc_server_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v7;
      _os_log_error_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_ERROR, "flushDonationsWithError unexpectedly failed: %@", buf, 0xCu);
    }
  }
  v3[2](v3);
}

- (void)donateNamedEntities:(id)a3 source:(id)a4 algorithm:(unint64_t)a5 cloudSync:(BOOL)a6 sentimentScore:(double)a7 completion:(id)a8
{
  BOOL v10 = a6;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = (void (**)(id, uint64_t, id))a8;
  id v15 = a4;
  id v16 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v22 = [v13 count];
    _os_log_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEFAULT, "PPNamedEntityReadWriteServer: donateNamedEntities: %tu entities", buf, 0xCu);
  }

  id v17 = +[PPLocalNamedEntityStore defaultStore];
  id v20 = 0;
  uint64_t v18 = [v17 donateNamedEntities:v13 source:v15 algorithm:a5 cloudSync:v10 sentimentScore:&v20 error:a7];

  id v19 = v20;
  v14[2](v14, v18, v19);
}

@end