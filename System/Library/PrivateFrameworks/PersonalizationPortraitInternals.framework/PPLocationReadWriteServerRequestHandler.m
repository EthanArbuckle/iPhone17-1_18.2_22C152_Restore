@interface PPLocationReadWriteServerRequestHandler
- (void)clearWithCompletion:(id)a3;
- (void)cloudSyncWithCompletion:(id)a3;
- (void)donateLocations:(id)a3 source:(id)a4 contextualNamedEntities:(id)a5 algorithm:(unsigned __int16)a6 cloudSync:(BOOL)a7 decayRate:(double)a8 completion:(id)a9;
@end

@implementation PPLocationReadWriteServerRequestHandler

- (void)clearWithCompletion:(id)a3
{
  v3 = (void (**)(id, uint64_t, void, id))a3;
  v4 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEFAULT, "PPLocationReadWriteServer: clear", buf, 2u);
  }

  *(void *)buf = 0;
  v5 = +[PPLocalLocationStore defaultStore];
  id v8 = 0;
  uint64_t v6 = [v5 clearWithError:&v8 deletedCount:buf];
  id v7 = v8;

  v3[2](v3, v6, *(void *)buf, v7);
}

- (void)cloudSyncWithCompletion:(id)a3
{
  v3 = (void (**)(id, uint64_t, void))a3;
  v4 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEFAULT, "PPLocationReadWriteServer: cloudSync", v5, 2u);
  }

  v3[2](v3, 1, 0);
}

- (void)donateLocations:(id)a3 source:(id)a4 contextualNamedEntities:(id)a5 algorithm:(unsigned __int16)a6 cloudSync:(BOOL)a7 decayRate:(double)a8 completion:(id)a9
{
  BOOL v10 = a7;
  uint64_t v11 = a6;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  v15 = (void (**)(id, uint64_t, id))a9;
  id v16 = a5;
  id v17 = a4;
  v18 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v24 = [v14 count];
    _os_log_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_DEFAULT, "PPLocationReadWriteServer: donateLocations: %tu locations", buf, 0xCu);
  }

  v19 = +[PPLocalLocationStore defaultStore];
  id v22 = 0;
  uint64_t v20 = [v19 donateLocations:v14 source:v17 contextualNamedEntities:v16 algorithm:v11 cloudSync:v10 error:&v22];

  id v21 = v22;
  v15[2](v15, v20, v21);
}

@end