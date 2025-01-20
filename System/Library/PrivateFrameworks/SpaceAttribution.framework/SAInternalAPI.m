@interface SAInternalAPI
+ (void)addAppSizerHandler:(id)a3 reply:(id)a4;
+ (void)clearLastTelemetryData:(id)a3;
+ (void)computeSizeOfVolumeAtURL:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
+ (void)disableAppSizerResultsFilteringWithReply:(id)a3;
+ (void)getAppPaths:(id)a3 options:(int)a4 reply:(id)a5;
+ (void)getAppPathsWithReplyBlock:(id)a3;
+ (void)getLastTelemetryData:(id)a3;
+ (void)getPurgeableInfo:(id)a3 options:(unint64_t)a4 reply:(id)a5;
+ (void)importFromPlist:(id)a3 reply:(id)a4;
+ (void)removeAppSizerHandler:(id)a3 reply:(id)a4;
+ (void)runAppSizerWithReplyBlock:(id)a3;
+ (void)setAppSizerFilteringOptionsToDefaultWithReply:(id)a3;
+ (void)setAppSizerMaxRerunTimeout:(unsigned int)a3 reply:(id)a4;
+ (void)setEnableTTR:(BOOL)a3 reply:(id)a4;
+ (void)setForceTTR:(BOOL)a3 reply:(id)a4;
+ (void)setForceTelemetry:(id)a3;
@end

@implementation SAInternalAPI

+ (void)getAppPaths:(id)a3 options:(int)a4 reply:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  id v8 = a5;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  char v31 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__2;
  v28 = __Block_byref_object_dispose__2;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __43__SAInternalAPI_getAppPaths_options_reply___block_invoke;
  v21[3] = &unk_26551E870;
  v23 = v30;
  id v9 = v8;
  id v22 = v9;
  id v29 = +[SADaemonXPC newWithInvalidationHandler:v21];
  v10 = (void *)v25[5];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __43__SAInternalAPI_getAppPaths_options_reply___block_invoke_2;
  v17[3] = &unk_26551E898;
  v19 = v30;
  id v11 = v9;
  id v18 = v11;
  v20 = &v24;
  v12 = [v10 remoteObjectProxyWithErrorHandler:v17];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __43__SAInternalAPI_getAppPaths_options_reply___block_invoke_3;
  v14[3] = &unk_26551E8C0;
  id v13 = v11;
  id v15 = v13;
  v16 = &v24;
  [v12 getAppPaths:0 options:v6 reply:v14];

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(v30, 8);
}

uint64_t __43__SAInternalAPI_getAppPaths_options_reply___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t __43__SAInternalAPI_getAppPaths_options_reply___block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 24) = 1;
    (*(void (**)(void))(*(void *)(result + 32) + 16))();
    v3 = *(void **)(*(void *)(*(void *)(v2 + 48) + 8) + 40);
    return [v3 invalidate];
  }
  return result;
}

uint64_t __43__SAInternalAPI_getAppPaths_options_reply___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return [v2 invalidate];
}

+ (void)getAppPathsWithReplyBlock:(id)a3
{
  id v3 = a3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__2;
  uint64_t v24 = __Block_byref_object_dispose__2;
  id v25 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __43__SAInternalAPI_getAppPathsWithReplyBlock___block_invoke;
  v17[3] = &unk_26551E7D0;
  id v4 = v3;
  id v18 = v4;
  v19 = &v20;
  id v5 = +[SADaemonXPC newWithInvalidationHandler:v17];
  uint64_t v6 = (void *)v21[5];
  v21[5] = (uint64_t)v5;

  id v7 = (void *)v21[5];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __43__SAInternalAPI_getAppPathsWithReplyBlock___block_invoke_2;
  v14[3] = &unk_26551E7D0;
  id v8 = v4;
  id v15 = v8;
  v16 = &v20;
  id v9 = [v7 remoteObjectProxyWithErrorHandler:v14];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __43__SAInternalAPI_getAppPathsWithReplyBlock___block_invoke_3;
  v11[3] = &unk_26551E8C0;
  id v10 = v8;
  id v12 = v10;
  id v13 = &v20;
  [v9 getAppPaths:0 options:1 reply:v11];

  _Block_object_dispose(&v20, 8);
}

uint64_t __43__SAInternalAPI_getAppPathsWithReplyBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return [v2 invalidate];
}

uint64_t __43__SAInternalAPI_getAppPathsWithReplyBlock___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return [v2 invalidate];
}

void __43__SAInternalAPI_getAppPathsWithReplyBlock___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v6 = objc_opt_new();
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v15 = v5;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          id v13 = [v12 objectForKeyedSubscript:@"bundles"];
          v14 = [v12 objectForKeyedSubscript:@"path"];
          [v6 setObject:v13 forKeyedSubscript:v14];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v5 = v15;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) invalidate];
}

+ (void)runAppSizerWithReplyBlock:(id)a3
{
  id v3 = a3;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  char v26 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__2;
  v23 = __Block_byref_object_dispose__2;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __43__SAInternalAPI_runAppSizerWithReplyBlock___block_invoke;
  v16[3] = &unk_26551E870;
  long long v18 = v25;
  id v4 = v3;
  id v17 = v4;
  id v24 = +[SADaemonXPC newWithInvalidationHandler:v16];
  id v5 = (void *)v20[5];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __43__SAInternalAPI_runAppSizerWithReplyBlock___block_invoke_2;
  v12[3] = &unk_26551E898;
  v14 = v25;
  id v6 = v4;
  id v13 = v6;
  id v15 = &v19;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v12];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __43__SAInternalAPI_runAppSizerWithReplyBlock___block_invoke_3;
  v9[3] = &unk_26551E7D0;
  id v8 = v6;
  id v10 = v8;
  id v11 = &v19;
  [v7 runAppSizer:v9];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v25, 8);
}

uint64_t __43__SAInternalAPI_runAppSizerWithReplyBlock___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t __43__SAInternalAPI_runAppSizerWithReplyBlock___block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 24) = 1;
    (*(void (**)(void))(*(void *)(result + 32) + 16))();
    id v3 = *(void **)(*(void *)(*(void *)(v2 + 48) + 8) + 40);
    return [v3 invalidate];
  }
  return result;
}

uint64_t __43__SAInternalAPI_runAppSizerWithReplyBlock___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return [v2 invalidate];
}

+ (void)getPurgeableInfo:(id)a3 options:(unint64_t)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  char v31 = 0;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__2;
  v28 = __Block_byref_object_dispose__2;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __48__SAInternalAPI_getPurgeableInfo_options_reply___block_invoke;
  v21[3] = &unk_26551E870;
  v23 = v30;
  id v9 = v8;
  id v22 = v9;
  id v29 = +[SADaemonXPC newWithInvalidationHandler:v21];
  id v10 = (void *)v25[5];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __48__SAInternalAPI_getPurgeableInfo_options_reply___block_invoke_2;
  v17[3] = &unk_26551E898;
  uint64_t v19 = v30;
  id v11 = v9;
  id v18 = v11;
  uint64_t v20 = &v24;
  id v12 = [v10 remoteObjectProxyWithErrorHandler:v17];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __48__SAInternalAPI_getPurgeableInfo_options_reply___block_invoke_3;
  v14[3] = &unk_26551E8E8;
  id v13 = v11;
  id v15 = v13;
  long long v16 = &v24;
  [v12 getPurgeableInfo:v7 options:a4 reply:v14];

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(v30, 8);
}

uint64_t __48__SAInternalAPI_getPurgeableInfo_options_reply___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t __48__SAInternalAPI_getPurgeableInfo_options_reply___block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 24) = 1;
    (*(void (**)(void))(*(void *)(result + 32) + 16))();
    id v3 = *(void **)(*(void *)(*(void *)(v2 + 48) + 8) + 40);
    return [v3 invalidate];
  }
  return result;
}

uint64_t __48__SAInternalAPI_getPurgeableInfo_options_reply___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return [v2 invalidate];
}

+ (void)addAppSizerHandler:(id)a3 reply:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  char v22 = 0;
  id v7 = objc_opt_new();
  id v8 = objc_opt_new();
  [v8 setAppSizerUpdateHandler:v5];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __42__SAInternalAPI_addAppSizerHandler_reply___block_invoke;
  v17[3] = &unk_26551E910;
  uint64_t v20 = v21;
  id v9 = v6;
  id v19 = v9;
  id v10 = v7;
  id v18 = v10;
  id v11 = [v10 remoteObjectProxyWithErrorHandler:v17];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __42__SAInternalAPI_addAppSizerHandler_reply___block_invoke_2;
  v14[3] = &unk_26551E938;
  id v12 = v8;
  id v15 = v12;
  id v13 = v9;
  id v16 = v13;
  [v11 addAppSizerHandler:v12 reply:v14];

  _Block_object_dispose(v21, 8);
}

uint64_t __42__SAInternalAPI_addAppSizerHandler_reply___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 48) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 24) = 1;
    (*(void (**)(void))(*(void *)(result + 40) + 16))();
    id v3 = *(void **)(v2 + 32);
    return [v3 invalidate];
  }
  return result;
}

void __42__SAInternalAPI_addAppSizerHandler_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setControllerID:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (void)removeAppSizerHandler:(id)a3 reply:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  char v16 = 0;
  id v7 = objc_opt_new();
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __45__SAInternalAPI_removeAppSizerHandler_reply___block_invoke;
  v11[3] = &unk_26551E910;
  v14 = v15;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v12 = v9;
  id v10 = [v9 remoteObjectProxyWithErrorHandler:v11];
  [v10 removeAppSizerHandler:v5];
  (*((void (**)(id, void))v8 + 2))(v8, 0);

  _Block_object_dispose(v15, 8);
}

uint64_t __45__SAInternalAPI_removeAppSizerHandler_reply___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 48) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 24) = 1;
    (*(void (**)(void))(*(void *)(result + 40) + 16))();
    id v3 = *(void **)(v2 + 32);
    return [v3 invalidate];
  }
  return result;
}

+ (void)computeSizeOfVolumeAtURL:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  char v31 = 0;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__2;
  v28 = __Block_byref_object_dispose__2;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __68__SAInternalAPI_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke;
  void v21[3] = &unk_26551E870;
  v23 = v30;
  id v9 = v8;
  id v22 = v9;
  id v29 = +[SADaemonXPC newWithInvalidationHandler:v21];
  id v10 = (void *)v25[5];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __68__SAInternalAPI_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke_2;
  v17[3] = &unk_26551E898;
  id v19 = v30;
  id v11 = v9;
  id v18 = v11;
  uint64_t v20 = &v24;
  id v12 = [v10 remoteObjectProxyWithErrorHandler:v17];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __68__SAInternalAPI_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke_3;
  v14[3] = &unk_26551E960;
  id v13 = v11;
  id v15 = v13;
  char v16 = &v24;
  [v12 computeSizeOfVolumeAtURL:v7 options:a4 completionHandler:v14];

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(v30, 8);
}

uint64_t __68__SAInternalAPI_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t __68__SAInternalAPI_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 24) = 1;
    (*(void (**)(void))(*(void *)(result + 32) + 16))();
    id v3 = *(void **)(*(void *)(*(void *)(v2 + 48) + 8) + 40);
    return [v3 invalidate];
  }
  return result;
}

uint64_t __68__SAInternalAPI_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = [v7 used];
  uint64_t v9 = [v7 capacity];
  uint64_t v10 = [v7 rawUsed];
  uint64_t v11 = [v7 purgeableSize];
  id v12 = [v7 mountedOn];

  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *, id))(v5 + 16))(v5, v8, v9, v10, v11, v12, v6);
  id v13 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return [v13 invalidate];
}

+ (void)disableAppSizerResultsFilteringWithReply:(id)a3
{
  id v3 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__2;
  id v18 = __Block_byref_object_dispose__2;
  id v19 = +[SADaemonXPC newWithInvalidationHandler:v3];
  id v4 = (void *)v15[5];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __58__SAInternalAPI_disableAppSizerResultsFilteringWithReply___block_invoke;
  v11[3] = &unk_26551E7D0;
  id v5 = v3;
  id v12 = v5;
  id v13 = &v14;
  id v6 = [v4 remoteObjectProxyWithErrorHandler:v11];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__SAInternalAPI_disableAppSizerResultsFilteringWithReply___block_invoke_2;
  v8[3] = &unk_26551E7D0;
  id v7 = v5;
  id v9 = v7;
  uint64_t v10 = &v14;
  [v6 disableAppSizerResultsFilteringWithReply:v8];

  _Block_object_dispose(&v14, 8);
}

uint64_t __58__SAInternalAPI_disableAppSizerResultsFilteringWithReply___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return [v2 invalidate];
}

uint64_t __58__SAInternalAPI_disableAppSizerResultsFilteringWithReply___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return [v2 invalidate];
}

+ (void)setAppSizerFilteringOptionsToDefaultWithReply:(id)a3
{
  id v3 = a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__2;
  uint64_t v21 = __Block_byref_object_dispose__2;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __63__SAInternalAPI_setAppSizerFilteringOptionsToDefaultWithReply___block_invoke;
  void v15[3] = &unk_26551E738;
  id v4 = v3;
  id v16 = v4;
  id v22 = +[SADaemonXPC newWithInvalidationHandler:v15];
  id v5 = (void *)v18[5];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __63__SAInternalAPI_setAppSizerFilteringOptionsToDefaultWithReply___block_invoke_2;
  v12[3] = &unk_26551E7D0;
  id v6 = v4;
  id v13 = v6;
  uint64_t v14 = &v17;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v12];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __63__SAInternalAPI_setAppSizerFilteringOptionsToDefaultWithReply___block_invoke_3;
  v9[3] = &unk_26551E7D0;
  id v8 = v6;
  id v10 = v8;
  uint64_t v11 = &v17;
  [v7 setAppSizerResultsFilteringOptionsToDefaultWithReply:v9];

  _Block_object_dispose(&v17, 8);
}

uint64_t __63__SAInternalAPI_setAppSizerFilteringOptionsToDefaultWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __63__SAInternalAPI_setAppSizerFilteringOptionsToDefaultWithReply___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return [v2 invalidate];
}

uint64_t __63__SAInternalAPI_setAppSizerFilteringOptionsToDefaultWithReply___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return [v2 invalidate];
}

+ (void)setForceTelemetry:(id)a3
{
  id v3 = a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__2;
  uint64_t v21 = __Block_byref_object_dispose__2;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __35__SAInternalAPI_setForceTelemetry___block_invoke;
  void v15[3] = &unk_26551E738;
  id v4 = v3;
  id v16 = v4;
  id v22 = +[SADaemonXPC newWithInvalidationHandler:v15];
  id v5 = (void *)v18[5];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __35__SAInternalAPI_setForceTelemetry___block_invoke_2;
  v12[3] = &unk_26551E7D0;
  id v6 = v4;
  id v13 = v6;
  uint64_t v14 = &v17;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v12];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __35__SAInternalAPI_setForceTelemetry___block_invoke_3;
  v9[3] = &unk_26551E7D0;
  id v8 = v6;
  id v10 = v8;
  uint64_t v11 = &v17;
  [v7 setForceTelemetry:v9];

  _Block_object_dispose(&v17, 8);
}

uint64_t __35__SAInternalAPI_setForceTelemetry___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __35__SAInternalAPI_setForceTelemetry___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return [v2 invalidate];
}

uint64_t __35__SAInternalAPI_setForceTelemetry___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return [v2 invalidate];
}

+ (void)setForceTTR:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__2;
  uint64_t v20 = __Block_byref_object_dispose__2;
  id v21 = +[SADaemonXPC newWithInvalidationHandler:v5];
  id v6 = (void *)v17[5];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __35__SAInternalAPI_setForceTTR_reply___block_invoke;
  v13[3] = &unk_26551E7D0;
  id v7 = v5;
  id v14 = v7;
  id v15 = &v16;
  id v8 = [v6 remoteObjectProxyWithErrorHandler:v13];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __35__SAInternalAPI_setForceTTR_reply___block_invoke_2;
  v10[3] = &unk_26551E7D0;
  id v9 = v7;
  id v11 = v9;
  id v12 = &v16;
  [v8 setForceTTR:v4 reply:v10];

  _Block_object_dispose(&v16, 8);
}

uint64_t __35__SAInternalAPI_setForceTTR_reply___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return [v2 invalidate];
}

uint64_t __35__SAInternalAPI_setForceTTR_reply___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return [v2 invalidate];
}

+ (void)setEnableTTR:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__2;
  uint64_t v20 = __Block_byref_object_dispose__2;
  id v21 = +[SADaemonXPC newWithInvalidationHandler:v5];
  id v6 = (void *)v17[5];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __36__SAInternalAPI_setEnableTTR_reply___block_invoke;
  v13[3] = &unk_26551E7D0;
  id v7 = v5;
  id v14 = v7;
  id v15 = &v16;
  id v8 = [v6 remoteObjectProxyWithErrorHandler:v13];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __36__SAInternalAPI_setEnableTTR_reply___block_invoke_2;
  v10[3] = &unk_26551E7D0;
  id v9 = v7;
  id v11 = v9;
  id v12 = &v16;
  [v8 setEnableTTR:v4 reply:v10];

  _Block_object_dispose(&v16, 8);
}

uint64_t __36__SAInternalAPI_setEnableTTR_reply___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return [v2 invalidate];
}

uint64_t __36__SAInternalAPI_setEnableTTR_reply___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return [v2 invalidate];
}

+ (void)setAppSizerMaxRerunTimeout:(unsigned int)a3 reply:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__2;
  uint64_t v20 = __Block_byref_object_dispose__2;
  id v21 = +[SADaemonXPC newWithInvalidationHandler:v5];
  id v6 = (void *)v17[5];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __50__SAInternalAPI_setAppSizerMaxRerunTimeout_reply___block_invoke;
  v13[3] = &unk_26551E7D0;
  id v7 = v5;
  id v14 = v7;
  id v15 = &v16;
  id v8 = [v6 remoteObjectProxyWithErrorHandler:v13];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __50__SAInternalAPI_setAppSizerMaxRerunTimeout_reply___block_invoke_2;
  v10[3] = &unk_26551E7D0;
  id v9 = v7;
  id v11 = v9;
  id v12 = &v16;
  [v8 setAppSizerMaxRerunTimeout:v4 reply:v10];

  _Block_object_dispose(&v16, 8);
}

uint64_t __50__SAInternalAPI_setAppSizerMaxRerunTimeout_reply___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return [v2 invalidate];
}

uint64_t __50__SAInternalAPI_setAppSizerMaxRerunTimeout_reply___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return [v2 invalidate];
}

+ (void)getLastTelemetryData:(id)a3
{
  id v3 = a3;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__2;
  id v21 = __Block_byref_object_dispose__2;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __38__SAInternalAPI_getLastTelemetryData___block_invoke;
  void v15[3] = &unk_26551E738;
  id v4 = v3;
  id v16 = v4;
  id v22 = +[SADaemonXPC newWithInvalidationHandler:v15];
  id v5 = (void *)v18[5];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __38__SAInternalAPI_getLastTelemetryData___block_invoke_2;
  v12[3] = &unk_26551E7D0;
  id v6 = v4;
  id v13 = v6;
  id v14 = &v17;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v12];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __38__SAInternalAPI_getLastTelemetryData___block_invoke_3;
  v9[3] = &unk_26551E8E8;
  id v8 = v6;
  id v10 = v8;
  id v11 = &v17;
  [v7 getLastTelemetryData:v9];

  _Block_object_dispose(&v17, 8);
}

uint64_t __38__SAInternalAPI_getLastTelemetryData___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __38__SAInternalAPI_getLastTelemetryData___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return [v2 invalidate];
}

uint64_t __38__SAInternalAPI_getLastTelemetryData___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return [v2 invalidate];
}

+ (void)importFromPlist:(id)a3 reply:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__2;
  uint64_t v24 = __Block_byref_object_dispose__2;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __39__SAInternalAPI_importFromPlist_reply___block_invoke;
  v18[3] = &unk_26551E738;
  id v7 = v6;
  id v19 = v7;
  id v25 = +[SADaemonXPC newWithInvalidationHandler:v18];
  id v8 = (void *)v21[5];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __39__SAInternalAPI_importFromPlist_reply___block_invoke_2;
  void v15[3] = &unk_26551E7D0;
  id v9 = v7;
  id v16 = v9;
  uint64_t v17 = &v20;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v15];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __39__SAInternalAPI_importFromPlist_reply___block_invoke_3;
  v12[3] = &unk_26551E7D0;
  id v11 = v9;
  id v13 = v11;
  id v14 = &v20;
  [v10 importFromPlist:v5 reply:v12];

  _Block_object_dispose(&v20, 8);
}

uint64_t __39__SAInternalAPI_importFromPlist_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __39__SAInternalAPI_importFromPlist_reply___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return [v2 invalidate];
}

uint64_t __39__SAInternalAPI_importFromPlist_reply___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return [v2 invalidate];
}

+ (void)clearLastTelemetryData:(id)a3
{
  id v3 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__2;
  uint64_t v18 = __Block_byref_object_dispose__2;
  id v19 = +[SADaemonXPC newWithInvalidationHandler:v3];
  id v4 = (void *)v15[5];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __40__SAInternalAPI_clearLastTelemetryData___block_invoke;
  v11[3] = &unk_26551E7D0;
  id v5 = v3;
  id v12 = v5;
  id v13 = &v14;
  id v6 = [v4 remoteObjectProxyWithErrorHandler:v11];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __40__SAInternalAPI_clearLastTelemetryData___block_invoke_2;
  v8[3] = &unk_26551E7D0;
  id v7 = v5;
  id v9 = v7;
  id v10 = &v14;
  [v6 clearLastTelemetryData:v8];

  _Block_object_dispose(&v14, 8);
}

uint64_t __40__SAInternalAPI_clearLastTelemetryData___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return [v2 invalidate];
}

uint64_t __40__SAInternalAPI_clearLastTelemetryData___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return [v2 invalidate];
}

@end