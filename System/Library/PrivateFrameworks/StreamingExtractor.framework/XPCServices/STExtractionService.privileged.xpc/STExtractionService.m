@interface STExtractionService
+ (void)addActiveExtractionService:(id)a3;
+ (void)removeExtractionService:(id)a3;
+ (void)setProcessTerminated;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)extractionPrepared;
- (BOOL)extractionValid;
- (BOOL)hasConnection;
- (NSString)sessionID;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)messageQueue;
- (STExtractionPlugin)plugin;
- (id)initForClient:(id)a3 connection:(id)a4;
- (int64_t)sandboxToken;
- (void)_checkProcessTerminated;
- (void)connectionInvalidated;
- (void)dealloc;
- (void)extractionCompleteAtArchivePath:(id)a3;
- (void)extractionEnteredPassthroughMode;
- (void)invalidate;
- (void)processTerminated;
- (void)remote_finishStreamWithCompletionBlock:(id)a3;
- (void)remote_prepareForExtractionToPath:(id)a3 sandboxExtensionToken:(id)a4 options:(id)a5 withCompletionBlock:(id)a6;
- (void)remote_supplyBytes:(id)a3 withCompletionBlock:(id)a4;
- (void)remote_suspendStreamWithCompletionBlock:(id)a3;
- (void)remote_terminateStreamWithError:(id)a3 completionBlock:(id)a4;
- (void)setExtractionProgress:(double)a3;
- (void)setPlugin:(id)a3;
- (void)setSandboxToken:(int64_t)a3;
- (void)setSessionID:(id)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation STExtractionService

+ (void)addActiveExtractionService:(id)a3
{
  id v4 = a3;
  v5 = sub_1000010CC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 sessionID];
    int v12 = 136446722;
    v13 = "+[STExtractionService addActiveExtractionService:]";
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: [%@] %@", (uint8_t *)&v12, 0x20u);
  }
  id v7 = a1;
  objc_sync_enter(v7);
  if (qword_10000D358)
  {
    [(id)qword_10000D358 addObject:v4];
  }
  else
  {
    uint64_t v8 = +[NSMutableSet setWithObject:v4];
    v9 = (void *)qword_10000D358;
    qword_10000D358 = v8;
  }
  v10 = sub_1000010CC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(id)qword_10000D358 count];
    int v12 = 136446466;
    v13 = "+[STExtractionService addActiveExtractionService:]";
    __int16 v14 = 2048;
    id v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s: %lu services", (uint8_t *)&v12, 0x16u);
  }

  objc_sync_exit(v7);
}

+ (void)removeExtractionService:(id)a3
{
  id v4 = a3;
  v5 = sub_1000010CC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 sessionID];
    int v10 = 136446722;
    id v11 = "+[STExtractionService removeExtractionService:]";
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: [%@] %@", (uint8_t *)&v10, 0x20u);
  }
  id v7 = a1;
  objc_sync_enter(v7);
  if (qword_10000D358)
  {
    [(id)qword_10000D358 removeObject:v4];
    uint64_t v8 = sub_1000010CC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [(id)qword_10000D358 count];
      int v10 = 136446466;
      id v11 = "+[STExtractionService removeExtractionService:]";
      __int16 v12 = 2048;
      id v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s: %lu services remaining", (uint8_t *)&v10, 0x16u);
    }
  }
  objc_sync_exit(v7);
}

+ (void)setProcessTerminated
{
  processTerminated = 1;
  id v2 = a1;
  objc_sync_enter(v2);
  if (qword_10000D358)
  {
    v3 = sub_1000010CC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136446466;
      v5 = "+[STExtractionService setProcessTerminated]";
      __int16 v6 = 2048;
      id v7 = [(id)qword_10000D358 count];
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s: suspending %lu extractions", (uint8_t *)&v4, 0x16u);
    }

    [(id)qword_10000D358 enumerateObjectsUsingBlock:&stru_1000083C8];
  }
  objc_sync_exit(v2);
}

- (id)initForClient:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)STExtractionService;
  uint64_t v8 = [(STExtractionService *)&v19 init];
  if (v8)
  {
    id v9 = +[NSString stringWithFormat:@"StreamingExtraction session on behalf of %@", v6];
    [v9 UTF8String];
    uint64_t v10 = os_transaction_create();
    id v11 = (void *)*((void *)v8 + 1);
    *((void *)v8 + 1) = v10;

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.StreamingExtractor.STExtractionServiceMessageQueue", 0);
    id v13 = (void *)*((void *)v8 + 5);
    *((void *)v8 + 5) = v12;

    if (*((void *)v8 + 5))
    {
      [v8 setSandboxToken:-1];
      *(_WORD *)(v8 + 17) = 1;
      if (v7)
      {
        objc_storeWeak((id *)v8 + 3, v7);
        v8[16] = 1;
        [v7 auditToken];
        *((_OWORD *)v8 + 4) = v17;
        *((_OWORD *)v8 + 5) = v18;
      }
      else
      {
        *(void *)&long long v14 = -1;
        *((void *)&v14 + 1) = -1;
        *((_OWORD *)v8 + 4) = v14;
        *((_OWORD *)v8 + 5) = v14;
      }
    }
    else
    {
      __int16 v16 = sub_1000010CC();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1000043DC();
      }

      uint64_t v8 = 0;
    }
  }
  return v8;
}

- (void)dealloc
{
  sessionTransaction = self->_sessionTransaction;
  self->_sessionTransaction = 0;

  if ([(STExtractionService *)self sandboxToken] != -1)
  {
    [(STExtractionService *)self sandboxToken];
    sandbox_extension_release();
    [(STExtractionService *)self setSandboxToken:-1];
  }
  v4.receiver = self;
  v4.super_class = (Class)STExtractionService;
  [(STExtractionService *)&v4 dealloc];
}

- (void)connectionInvalidated
{
  v3 = [(STExtractionService *)self messageQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002430;
  block[3] = &unk_100008430;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)invalidate
{
  self->_extractionValid = 0;
  v3 = objc_opt_class();
  [v3 removeExtractionService:self];
}

- (void)processTerminated
{
  if (processTerminated)
  {
    v3 = [(STExtractionService *)self messageQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000025D0;
    block[3] = &unk_100008430;
    block[4] = self;
    dispatch_async(v3, block);
  }
}

- (void)_checkProcessTerminated
{
  if (processTerminated && [(STExtractionService *)self extractionValid])
  {
    v3 = [(STExtractionService *)self plugin];

    if (v3)
    {
      if ([(STExtractionService *)self extractionPrepared])
      {
        objc_super v4 = [(STExtractionService *)self plugin];
        [v4 suspendStreamWithCompletionBlock:&stru_100008450];
      }
      [(STExtractionService *)self invalidate];
    }
    else
    {
      v5 = sub_1000010CC();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_100004480();
      }
    }
  }
}

- (void)remote_prepareForExtractionToPath:(id)a3 sandboxExtensionToken:(id)a4 options:(id)a5 withCompletionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v14 = [(STExtractionService *)self messageQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000027C0;
  block[3] = &unk_1000084C8;
  id v22 = v10;
  id v23 = v13;
  block[4] = self;
  id v20 = v12;
  id v21 = v11;
  id v15 = v10;
  id v16 = v11;
  id v17 = v12;
  id v18 = v13;
  dispatch_async(v14, block);
}

- (void)remote_supplyBytes:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(STExtractionService *)self messageQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000372C;
  block[3] = &unk_100008518;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)remote_suspendStreamWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = [(STExtractionService *)self messageQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100003B0C;
  v7[3] = &unk_100008540;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)remote_finishStreamWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = [(STExtractionService *)self messageQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100003CE4;
  v7[3] = &unk_100008540;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)remote_terminateStreamWithError:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(STExtractionService *)self messageQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003EDC;
  block[3] = &unk_100008518;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)setExtractionProgress:(double)a3
{
  id v5 = [(STExtractionService *)self xpcConnection];
  id v4 = [v5 remoteObjectProxy];
  objc_msgSend(v4, "remote_setExtractionProgress:", a3);
}

- (void)extractionCompleteAtArchivePath:(id)a3
{
  id v4 = a3;
  id v6 = [(STExtractionService *)self xpcConnection];
  id v5 = [v6 remoteObjectProxy];
  objc_msgSend(v5, "remote_extractionCompleteAtArchivePath:", v4);
}

- (void)extractionEnteredPassthroughMode
{
  id v3 = [(STExtractionService *)self xpcConnection];
  id v2 = [v3 remoteObjectProxy];
  objc_msgSend(v2, "remote_extractionEnteredPassthroughMode");
}

- (NSXPCConnection)xpcConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  return (NSXPCConnection *)WeakRetained;
}

- (void)setXpcConnection:(id)a3
{
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (BOOL)hasConnection
{
  return self->_hasConnection;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  long long v3 = *(_OWORD *)&self[2].var0[4];
  *(_OWORD *)retstr->var0 = *(_OWORD *)self[2].var0;
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (OS_dispatch_queue)messageQueue
{
  return self->_messageQueue;
}

- (STExtractionPlugin)plugin
{
  return self->_plugin;
}

- (void)setPlugin:(id)a3
{
}

- (int64_t)sandboxToken
{
  return self->_sandboxToken;
}

- (void)setSandboxToken:(int64_t)a3
{
  self->_sandboxToken = a3;
}

- (BOOL)extractionValid
{
  return self->_extractionValid;
}

- (BOOL)extractionPrepared
{
  return self->_extractionPrepared;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plugin, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_destroyWeak((id *)&self->_xpcConnection);
  objc_storeStrong((id *)&self->_sessionTransaction, 0);
}

@end