@interface AssetAccessSessionController
- (AssetAccessSessionController)init;
- (AssetAccessSessionControllerDelegate)delegate;
- (NSMutableDictionary)clientSessionsByCompositionAVURL;
- (OS_dispatch_queue)serialQueue;
- (id)_onQueueActiveSessionWithAccessToken:(id)a3;
- (id)_onQueueActiveSessions;
- (id)_onQueueActiveSessionsWithWithCompositionAVURL:(id)a3;
- (id)_onQueueActiveSessionsWithXPCConnection:(id)a3;
- (id)_onQueueSessionsMatchingPredicate:(id)a3;
- (id)activeSessionWithAccessToken:(id)a3;
- (id)activeSessions;
- (id)activeSessionsWithWithCompositionAVURL:(id)a3;
- (id)activeSessionsWithXPCConnection:(id)a3;
- (id)openAccessSessionWithName:(id)a3 xpcConnection:(id)a4 compositionAVURL:(id)a5 accessIntent:(int64_t)a6 error:(id *)a7;
- (void)_onQueueEnumerateActiveSessionsWithBlock:(id)a3;
- (void)closeSession:(id)a3;
- (void)dumpState;
- (void)setDelegate:(id)a3;
- (void)setSerialQueue:(id)a3;
@end

@implementation AssetAccessSessionController

- (id)activeSessions
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_100007E78;
  v11 = sub_1000203E4;
  id v12 = (id)objc_opt_new();
  serialQueue = self->_serialQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100007E88;
  v6[3] = &unk_1000390C8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync((dispatch_queue_t)serialQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (AssetAccessSessionController)init
{
  v8.receiver = self;
  v8.super_class = (Class)AssetAccessSessionController;
  v2 = [(AssetAccessSessionController *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create(0, 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    clientSessionsByCompositionAVURL = v2->_clientSessionsByCompositionAVURL;
    v2->_clientSessionsByCompositionAVURL = v5;
  }
  return v2;
}

- (id)openAccessSessionWithName:(id)a3 xpcConnection:(id)a4 compositionAVURL:(id)a5 accessIntent:(int64_t)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x3032000000;
  v53 = sub_100007E78;
  v54 = sub_1000203E4;
  id v55 = 0;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = sub_100007E78;
  v48 = sub_1000203E4;
  id v49 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = sub_100007E78;
  v42 = sub_1000203E4;
  id v43 = +[NSSet set];
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = sub_100007E78;
  v36 = sub_1000203E4;
  id v37 = +[NSSet set];
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000203EC;
  block[3] = &unk_1000398F0;
  id v16 = v12;
  id v23 = v16;
  int64_t v31 = a6;
  id v17 = v14;
  id v24 = v17;
  v25 = self;
  v27 = &v44;
  id v18 = v13;
  id v26 = v18;
  v28 = &v38;
  v29 = &v50;
  v30 = &v32;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  if (([(id)v39[5] isEqual:v33[5]] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained assetAccessSessionController:self sessionDidChangedFromActiveSessions:v39[5] toActiveSessions:v33[5]];
  }
  if (a7) {
    *a7 = (id) v45[5];
  }
  id v20 = (id)v51[5];

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v50, 8);

  return v20;
}

- (void)closeSession:(id)a3
{
  id v4 = a3;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_100007E78;
  id v26 = sub_1000203E4;
  id v27 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_100007E78;
  id v20 = sub_1000203E4;
  id v21 = 0;
  serialQueue = self->_serialQueue;
  objc_super v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  v10 = sub_1000208B4;
  v11 = &unk_100039918;
  id v12 = self;
  id v6 = v4;
  id v13 = v6;
  id v14 = &v22;
  v15 = &v16;
  dispatch_sync((dispatch_queue_t)serialQueue, &v8);
  if ((objc_msgSend((id)v23[5], "isEqual:", v17[5], v8, v9, v10, v11, v12) & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained assetAccessSessionController:self sessionDidChangedFromActiveSessions:v23[5] toActiveSessions:v17[5]];
  }
  [v6 setXpcTransaction:0];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
}

- (id)activeSessionWithAccessToken:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_100007E78;
  uint64_t v16 = sub_1000203E4;
  id v17 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100020A80;
  block[3] = &unk_100038FB0;
  id v10 = v4;
  v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)activeSessionsWithWithCompositionAVURL:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_100007E78;
  uint64_t v16 = sub_1000203E4;
  id v17 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100020BE0;
  block[3] = &unk_100038FB0;
  id v10 = v4;
  v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)activeSessionsWithXPCConnection:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_100007E78;
  uint64_t v16 = sub_1000203E4;
  id v17 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100020D40;
  block[3] = &unk_100038FB0;
  id v10 = v4;
  v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)_onQueueActiveSessionWithAccessToken:(id)a3
{
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  clientSessionsByCompositionAVURL = self->_clientSessionsByCompositionAVURL;
  id v6 = objc_msgSend(v4, "compositionAVURL", 0);
  id v7 = [(NSMutableDictionary *)clientSessionsByCompositionAVURL objectForKey:v6];

  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = [v11 accessToken];
        unsigned __int8 v13 = [v12 isEqual:v4];

        if (v13)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (id)_onQueueActiveSessionsWithWithCompositionAVURL:(id)a3
{
  dispatch_queue_t v3 = [(NSMutableDictionary *)self->_clientSessionsByCompositionAVURL objectForKey:a3];
  id v4 = [v3 allObjects];

  return v4;
}

- (id)_onQueueActiveSessionsWithXPCConnection:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000210F4;
  v7[3] = &unk_100039968;
  id v8 = a3;
  id v4 = v8;
  v5 = [(AssetAccessSessionController *)self _onQueueSessionsMatchingPredicate:v7];

  return v5;
}

- (id)_onQueueActiveSessions
{
  dispatch_queue_t v3 = objc_opt_new();
  clientSessionsByCompositionAVURL = self->_clientSessionsByCompositionAVURL;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000211E8;
  v7[3] = &unk_100039990;
  id v5 = v3;
  id v8 = v5;
  [(NSMutableDictionary *)clientSessionsByCompositionAVURL enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

- (void)_onQueueEnumerateActiveSessionsWithBlock:(id)a3
{
  id v4 = a3;
  clientSessionsByCompositionAVURL = self->_clientSessionsByCompositionAVURL;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100021288;
  v7[3] = &unk_1000399B8;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)clientSessionsByCompositionAVURL enumerateKeysAndObjectsUsingBlock:v7];
}

- (id)_onQueueSessionsMatchingPredicate:(id)a3
{
  id v4 = a3;
  +[NSMutableArray array];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100021470;
  v10[3] = &unk_1000399E0;
  id v12 = v4;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = v5;
  id v6 = v4;
  [(AssetAccessSessionController *)self _onQueueEnumerateActiveSessionsWithBlock:v10];
  id v7 = v11;
  id v8 = v5;

  return v8;
}

- (void)dumpState
{
  dispatch_queue_t v3 = +[NSMutableDictionary dictionary];
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100021620;
  block[3] = &unk_100038D20;
  void block[4] = self;
  id v5 = v3;
  id v11 = v5;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  id v6 = [v5 count];
  id v7 = __stderrp;
  id v8 = [(AssetAccessSessionController *)self description];
  uint64_t v9 = (const char *)[v8 UTF8String];
  if (v6)
  {
    fprintf(v7, "[%s] *** Active Sessions (by compositionAVURL/URL) ***\n\n", v9);

    [v5 enumerateKeysAndObjectsUsingBlock:&stru_100039A48];
    fwrite("*****************************************\n", 0x2AuLL, 1uLL, __stderrp);
  }
  else
  {
    fprintf(v7, "[%s] *** No Active Sessions ***\n", v9);
  }
}

- (AssetAccessSessionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AssetAccessSessionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (NSMutableDictionary)clientSessionsByCompositionAVURL
{
  return self->_clientSessionsByCompositionAVURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientSessionsByCompositionAVURL, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end