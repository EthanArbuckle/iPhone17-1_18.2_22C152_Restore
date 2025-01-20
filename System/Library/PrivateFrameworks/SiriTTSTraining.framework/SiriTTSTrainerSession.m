@interface SiriTTSTrainerSession
+ (BOOL)isDeviceSupported;
+ (id)getInstallingProgressBlockForAsset:(id)a3;
+ (void)setInstallingProgressBlock:(id)a3 forAsset:(id)a4;
- (SiriTTSTrainerSession)init;
- (id)getAllAvailableLocales;
- (id)getAllAvailableScriptNames:(id)a3;
- (id)installableTrainingAssetsForLanguage:(id)a3 name:(id)a4 type:(int64_t)a5;
- (id)installedTrainingAssetsForLanguage:(id)a3 name:(id)a4 type:(int64_t)a5;
- (void)cancelTask:(id)a3 reply:(id)a4;
- (void)cleanUpTaskQueue:(id)a3;
- (void)getAllTasks:(id)a3;
- (void)getCurrentAssetVersion:(id)a3 name:(id)a4 reply:(id)a5;
- (void)getRecordingMetadata:(id)a3 name:(id)a4 reply:(id)a5;
- (void)getTaskById:(id)a3 completion:(id)a4;
- (void)installTrainingAsset:(id)a3 progress:(id)a4 completion:(id)a5;
- (void)installingTrainingAsset:(id)a3 progress:(float)a4;
- (void)startRequest:(id)a3 completion:(id)a4;
- (void)uninstallTrainingAsset:(id)a3;
- (void)uninstallTrainingAsset:(id)a3 completion:(id)a4;
@end

@implementation SiriTTSTrainerSession

+ (id)getInstallingProgressBlockForAsset:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  v5 = static SiriTTSTrainerSession.getInstallingProgressBlock(for:)(v4);
  uint64_t v7 = v6;

  if (v5)
  {
    v9[4] = v5;
    v9[5] = v7;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 1107296256;
    v9[2] = sub_7970;
    v9[3] = &block_descriptor;
    v5 = _Block_copy(v9);
    swift_release();
  }

  return v5;
}

+ (void)setInstallingProgressBlock:(id)a3 forAsset:(id)a4
{
  v5 = _Block_copy(a3);
  if (v5)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v5 = sub_7B7C;
  }
  else
  {
    uint64_t v6 = 0;
  }
  swift_getObjCClassMetadata();
  id v7 = a4;
  static SiriTTSTrainerSession.set(installingProgressBlock:for:)((uint64_t)v5, v6, v7);
  sub_647C((uint64_t)v5);
}

- (SiriTTSTrainerSession)init
{
  v17.receiver = self;
  v17.super_class = (Class)SiriTTSTrainerSession;
  v2 = [(SiriTTSTrainerSession *)&v17 init];
  v3 = +[NSBundle mainBundle];
  uint64_t v4 = [v3 bundleIdentifier];
  appId = v2->_appId;
  v2->_appId = (NSString *)v4;

  uint64_t v6 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.SiriTTSTrainingAgent" options:0];
  connection = v2->_connection;
  v2->_connection = v6;

  v8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SiriTTSTrainerAgentProtocol];
  v20[0] = objc_opt_class();
  v20[1] = objc_opt_class();
  v9 = +[NSArray arrayWithObjects:v20 count:2];
  v10 = +[NSSet setWithArray:v9];

  [v8 setClasses:v10 forSelector:"installableTrainingAssetsForLanguage:name:type:reply:" argumentIndex:0 ofReply:1];
  [v8 setClasses:v10 forSelector:"installedTrainingAssetsForLanguage:name:type:reply:" argumentIndex:0 ofReply:1];
  v19[0] = objc_opt_class();
  v19[1] = objc_opt_class();
  v11 = +[NSArray arrayWithObjects:v19 count:2];
  v12 = +[NSSet setWithArray:v11];
  [v8 setClasses:v12 forSelector:"getAllTasksWithReply:" argumentIndex:0 ofReply:1];

  [(NSXPCConnection *)v2->_connection setRemoteObjectInterface:v8];
  [(NSXPCConnection *)v2->_connection setInvalidationHandler:&__block_literal_global_101];
  [(NSXPCConnection *)v2->_connection setInterruptionHandler:&__block_literal_global_104];
  v13 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SiriTTSTrainerAgentDelegate];
  uint64_t v18 = objc_opt_class();
  v14 = +[NSArray arrayWithObjects:&v18 count:1];
  v15 = +[NSSet setWithArray:v14];

  [v13 setClasses:v15 forSelector:"installingTrainingAsset:progress:" argumentIndex:0 ofReply:0];
  [(NSXPCConnection *)v2->_connection setExportedInterface:v13];
  [(NSXPCConnection *)v2->_connection setExportedObject:v2];
  [(NSXPCConnection *)v2->_connection resume];

  return v2;
}

void __29__SiriTTSTrainerSession_init__block_invoke(id a1)
{
  v1 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_error_impl(&def_5A5E8, v1, OS_LOG_TYPE_ERROR, "connection invalidated", v2, 2u);
  }
}

void __29__SiriTTSTrainerSession_init__block_invoke_102(id a1)
{
  v1 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_error_impl(&def_5A5E8, v1, OS_LOG_TYPE_ERROR, "connection interrupted", v2, 2u);
  }
}

- (void)startRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl(&def_5A5E8, v8, OS_LOG_TYPE_DEFAULT, "Sending request %@", buf, 0xCu);
  }

  [v6 setAppId:self->_appId];
  connection = self->_connection;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __49__SiriTTSTrainerSession_startRequest_completion___block_invoke;
  v12[3] = &unk_258550;
  id v13 = v7;
  id v10 = v7;
  v11 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v12];
  [v11 startRequest:v6 reply:v10];
}

void __49__SiriTTSTrainerSession_startRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_error_impl(&def_5A5E8, v4, OS_LOG_TYPE_ERROR, "Error %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cleanUpTaskQueue:(id)a3
{
  id v4 = a3;
  connection = self->_connection;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __42__SiriTTSTrainerSession_cleanUpTaskQueue___block_invoke;
  v8[3] = &unk_258550;
  id v9 = v4;
  id v6 = v4;
  id v7 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v8];
  [v7 cleanUpTaskQueue:v6];
}

void __42__SiriTTSTrainerSession_cleanUpTaskQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_error_impl(&def_5A5E8, v4, OS_LOG_TYPE_ERROR, "Error %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getTaskById:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl(&def_5A5E8, v8, OS_LOG_TYPE_DEFAULT, "TaskId %@", buf, 0xCu);
  }

  connection = self->_connection;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __48__SiriTTSTrainerSession_getTaskById_completion___block_invoke;
  v12[3] = &unk_258550;
  id v13 = v7;
  id v10 = v7;
  v11 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v12];
  [v11 getTaskById:v6 reply:v10];
}

void __48__SiriTTSTrainerSession_getTaskById_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_error_impl(&def_5A5E8, v4, OS_LOG_TYPE_ERROR, "Error %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getRecordingMetadata:(id)a3 name:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&def_5A5E8, v11, OS_LOG_TYPE_DEFAULT, "getRecordingMetadata", buf, 2u);
  }

  connection = self->_connection;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __57__SiriTTSTrainerSession_getRecordingMetadata_name_reply___block_invoke;
  v15[3] = &unk_258550;
  id v16 = v8;
  id v13 = v8;
  v14 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v15];
  [v14 getRecordingMetadata:v10 name:v9 reply:v13];
}

void __57__SiriTTSTrainerSession_getRecordingMetadata_name_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_error_impl(&def_5A5E8, v4, OS_LOG_TYPE_ERROR, "Error %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cancelTask:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl(&def_5A5E8, v8, OS_LOG_TYPE_DEFAULT, "cancel task %@", buf, 0xCu);
  }

  connection = self->_connection;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __42__SiriTTSTrainerSession_cancelTask_reply___block_invoke;
  v12[3] = &unk_258550;
  id v13 = v7;
  id v10 = v7;
  v11 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v12];
  [v11 cancelTask:v6 reply:v10];
}

void __42__SiriTTSTrainerSession_cancelTask_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_error_impl(&def_5A5E8, v4, OS_LOG_TYPE_ERROR, "Error %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getAllTasks:(id)a3
{
  id v4 = a3;
  int v5 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&def_5A5E8, v5, OS_LOG_TYPE_DEFAULT, "Get all tasks", buf, 2u);
  }

  connection = self->_connection;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __37__SiriTTSTrainerSession_getAllTasks___block_invoke;
  v9[3] = &unk_258550;
  id v10 = v4;
  id v7 = v4;
  id v8 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v9];
  [v8 getAllTasksWithReply:v7];
}

void __37__SiriTTSTrainerSession_getAllTasks___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_error_impl(&def_5A5E8, v4, OS_LOG_TYPE_ERROR, "Error %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getCurrentAssetVersion:(id)a3 name:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&def_5A5E8, v11, OS_LOG_TYPE_DEFAULT, "getCurrentAssetVersion", buf, 2u);
  }

  connection = self->_connection;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __59__SiriTTSTrainerSession_getCurrentAssetVersion_name_reply___block_invoke;
  v15[3] = &unk_258550;
  id v16 = v8;
  id v13 = v8;
  v14 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v15];
  [v14 getCurrentAssetVersion:v10 name:v9 reply:v13];
}

void __59__SiriTTSTrainerSession_getCurrentAssetVersion_name_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_error_impl(&def_5A5E8, v4, OS_LOG_TYPE_ERROR, "Error %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getAllAvailableLocales
{
  id v2 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", @"en-US", @"cmn-CN", 0);

  return v2;
}

- (id)getAllAvailableScriptNames:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", @"en-US", @"cmn-CN", 0);
  id v6 = objc_alloc_init((Class)NSArray);
  if ([v5 containsObject:v4])
  {
    id v7 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", @"default", @"threewords", 0);
  }
  else
  {
    id v8 = [(SiriTTSTrainerSession *)self getAllAvailableLocales];
    unsigned int v9 = [v8 containsObject:v4];

    if (!v9) {
      goto LABEL_6;
    }
    id v7 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", @"default", 0, v12);
  }
  id v10 = v7;

  id v6 = v10;
LABEL_6:

  return v6;
}

- (id)installableTrainingAssetsForLanguage:(id)a3 name:(id)a4 type:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    _os_log_impl(&def_5A5E8, v10, OS_LOG_TYPE_DEFAULT, "installableTrainingAssets for %@ %@", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  id v26 = 0;
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  connection = self->_connection;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = __72__SiriTTSTrainerSession_installableTrainingAssetsForLanguage_name_type___block_invoke;
  v21[3] = &unk_258578;
  id v13 = v11;
  v22 = v13;
  v14 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v21];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __72__SiriTTSTrainerSession_installableTrainingAssetsForLanguage_name_type___block_invoke_125;
  v18[3] = &unk_2585A0;
  v20 = buf;
  id v15 = v13;
  v19 = v15;
  [v14 installableTrainingAssetsForLanguage:v8 name:v9 type:a5 reply:v18];

  dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  id v16 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);

  return v16;
}

void __72__SiriTTSTrainerSession_installableTrainingAssetsForLanguage_name_type___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_error_impl(&def_5A5E8, v4, OS_LOG_TYPE_ERROR, "Error %@", (uint8_t *)&v5, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __72__SiriTTSTrainerSession_installableTrainingAssetsForLanguage_name_type___block_invoke_125(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)installedTrainingAssetsForLanguage:(id)a3 name:(id)a4 type:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    _os_log_impl(&def_5A5E8, v10, OS_LOG_TYPE_DEFAULT, "installedTrainingAssets for %@ %@", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  id v16 = __Block_byref_object_copy_;
  objc_super v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  dispatch_semaphore_t v11 = [(NSXPCConnection *)self->_connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_128];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __70__SiriTTSTrainerSession_installedTrainingAssetsForLanguage_name_type___block_invoke_129;
  v14[3] = &unk_2585C8;
  v14[4] = buf;
  [v11 installedTrainingAssetsForLanguage:v8 name:v9 type:a5 reply:v14];

  id v12 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v12;
}

void __70__SiriTTSTrainerSession_installedTrainingAssetsForLanguage_name_type___block_invoke(id a1, NSError *a2)
{
  id v2 = a2;
  id v3 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    int v5 = v2;
    _os_log_error_impl(&def_5A5E8, v3, OS_LOG_TYPE_ERROR, "Error %@", (uint8_t *)&v4, 0xCu);
  }
}

void __70__SiriTTSTrainerSession_installedTrainingAssetsForLanguage_name_type___block_invoke_129(uint64_t a1, void *a2)
{
}

- (void)installTrainingAsset:(id)a3 progress:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_semaphore_t v11 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v8 factor];
    *(_DWORD *)buf = 138412290;
    id v26 = v12;
    _os_log_impl(&def_5A5E8, v11, OS_LOG_TYPE_DEFAULT, "installTrainingAsset %@", buf, 0xCu);
  }
  if (v9) {
    +[SiriTTSTrainerSession setInstallingProgressBlock:v9 forAsset:v8];
  }
  connection = self->_connection;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = __66__SiriTTSTrainerSession_installTrainingAsset_progress_completion___block_invoke;
  v22[3] = &unk_2585F0;
  id v14 = v8;
  id v23 = v14;
  id v15 = v10;
  id v24 = v15;
  id v16 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v22];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  void v19[2] = __66__SiriTTSTrainerSession_installTrainingAsset_progress_completion___block_invoke_131;
  v19[3] = &unk_258618;
  id v20 = v14;
  id v21 = v15;
  id v17 = v15;
  id v18 = v14;
  [v16 installTrainingAsset:v18 reply:v19];
}

void __66__SiriTTSTrainerSession_installTrainingAsset_progress_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_error_impl(&def_5A5E8, v4, OS_LOG_TYPE_ERROR, "Error %@", (uint8_t *)&v6, 0xCu);
  }

  +[SiriTTSTrainerSession setInstallingProgressBlock:0 forAsset:*(void *)(a1 + 32)];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __66__SiriTTSTrainerSession_installTrainingAsset_progress_completion___block_invoke_131(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  +[SiriTTSTrainerSession setInstallingProgressBlock:0 forAsset:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
}

- (void)uninstallTrainingAsset:(id)a3
{
}

- (void)uninstallTrainingAsset:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 factor];
    *(_DWORD *)buf = 138412290;
    v19 = v9;
    _os_log_impl(&def_5A5E8, v8, OS_LOG_TYPE_DEFAULT, "uninstallTrainingAsset %@", buf, 0xCu);
  }
  connection = self->_connection;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __59__SiriTTSTrainerSession_uninstallTrainingAsset_completion___block_invoke;
  v16[3] = &unk_258550;
  id v11 = v7;
  id v17 = v11;
  id v12 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v16];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __59__SiriTTSTrainerSession_uninstallTrainingAsset_completion___block_invoke_133;
  v14[3] = &unk_258640;
  id v15 = v11;
  id v13 = v11;
  [v12 uninstallTrainingAsset:v6 reply:v14];
}

void __59__SiriTTSTrainerSession_uninstallTrainingAsset_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_error_impl(&def_5A5E8, v4, OS_LOG_TYPE_ERROR, "Error %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

uint64_t __59__SiriTTSTrainerSession_uninstallTrainingAsset_completion___block_invoke_133(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

- (void)installingTrainingAsset:(id)a3 progress:(float)a4
{
  uint64_t v5 = +[SiriTTSTrainerSession getInstallingProgressBlockForAsset:a3];
  if (v5)
  {
    int v6 = v5;
    v5[2](a4);
    uint64_t v5 = v6;
  }
}

+ (BOOL)isDeviceSupported
{
  return (_get_cpu_capabilities() & 0x70000000) != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_appId, 0);
}

@end