@interface DownloadHandlerManager
+ (id)handlerManager;
- (BOOL)canOpenSessionWithProperties:(id)a3;
- (DownloadHandlerManager)init;
- (id)_clientForProperties:(id)a3;
- (id)_clientForSession:(id)a3;
- (id)_disconnectSessionsForHandlerID:(int64_t)a3;
- (id)_popDownloadSessionForSessionID:(int64_t)a3;
- (id)beginBackgroundTaskForSessionWithID:(int64_t)a3 reason:(unsigned int)a4 expirationBlock:(id)a5;
- (id)openSessionWithProperties:(id)a3;
- (id)sessionForSessionID:(int64_t)a3;
- (int64_t)_globalHandlerIDForClientID:(id)a3;
- (void)_clientDisconnectNotification:(id)a3;
- (void)_endDisconnectedSessionsForClientID:(id)a3;
- (void)_endSessionWithID:(int64_t)a3 state:(int64_t)a4;
- (void)_notifyObserversOfHandlersChange;
- (void)_notifyObserversOfSessionChange:(id)a3;
- (void)_notifyObserversOfSessionChanges:(id)a3;
- (void)_sendMessage:(int64_t)a3 forSessionID:(int64_t)a4 replyBlock:(id)a5;
- (void)addDownloadHandler:(id)a3;
- (void)addHandlerObserver:(id)a3;
- (void)beginSessionWithID:(int64_t)a3;
- (void)cancelAuthenticationSessionWithID:(int64_t)a3;
- (void)cancelSessionWithID:(int64_t)a3;
- (void)closeUnstartedSessionWithID:(int64_t)a3;
- (void)continueAuthenticationSessionWithID:(int64_t)a3;
- (void)dealloc;
- (void)disavowDownloadSessionWithID:(int64_t)a3 error:(id)a4;
- (void)disconnectDownloadSessionWithID:(int64_t)a3;
- (void)endBackgroundTaskForSessionWithID:(int64_t)a3 identifier:(id)a4;
- (void)failDownloadSessionWithID:(int64_t)a3 error:(id)a4;
- (void)finishDownloadSessionWithID:(int64_t)a3;
- (void)modifyDownloadHandlerWithID:(int64_t)a3 usingBlock:(id)a4;
- (void)pauseSessionWithID:(int64_t)a3;
- (void)performDefaultForAuthenticationSessionWithID:(int64_t)a3;
- (void)rejectSpaceForAuthenticationSessionWithID:(int64_t)a3;
- (void)releaseDownloadSessionWithID:(int64_t)a3;
- (void)removeHandlerObserver:(id)a3;
- (void)resetDisavowedSessionsForHandlerWithID:(int64_t)a3;
- (void)retrySessionWithID:(int64_t)a3;
- (void)setGlobalDownloadHandlerID:(int64_t)a3 forClientID:(id)a4;
- (void)setSessionProperties:(id)a3 forSessionWithID:(int64_t)a4;
- (void)useCredential:(id)a3 forAuthenticationSessionWithID:(int64_t)a4;
@end

@implementation DownloadHandlerManager

- (DownloadHandlerManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)DownloadHandlerManager;
  v2 = [(DownloadHandlerManager *)&v4 init];
  if (v2)
  {
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunesstored.DownloadHandlerManager", 0);
    v2->_observersQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunesstored.DownloadHandlerManager.observers", 0);
    v2->_clientsByHandlerID = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2->_disconnectedSessionsByClientID = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2->_globalHandlersByClientID = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2->_observers = +[NSHashTable weakObjectsHashTable];
    v2->_sessionsByID = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    [+[NSNotificationCenter defaultCenter] addObserver:v2 selector:"_clientDisconnectNotification:" name:@"XPCClientDisconnectNotification" object:0];
  }
  return v2;
}

- (void)dealloc
{
  [+[NSNotificationCenter defaultCenter] removeObserver:self name:@"XPCClientDisconnectNotification" object:0];
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }
  observersQueue = self->_observersQueue;
  if (observersQueue) {
    dispatch_release(observersQueue);
  }

  v5.receiver = self;
  v5.super_class = (Class)DownloadHandlerManager;
  [(DownloadHandlerManager *)&v5 dealloc];
}

+ (id)handlerManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100163D6C;
  block[3] = &unk_1003A33A8;
  block[4] = a1;
  if (qword_100401F50 != -1) {
    dispatch_once(&qword_100401F50, block);
  }
  return (id)qword_100401F48;
}

- (void)addDownloadHandler:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100163E08;
  v4[3] = &unk_1003A3380;
  v4[4] = a3;
  v4[5] = self;
  dispatch_async(dispatchQueue, v4);
}

- (void)addHandlerObserver:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001640E8;
  v4[3] = &unk_1003A3380;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (id)beginBackgroundTaskForSessionWithID:(int64_t)a3 reason:(unsigned int)a4 expirationBlock:(id)a5
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3052000000;
  v13 = sub_1001641EC;
  v14 = sub_1001641FC;
  uint64_t v15 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100164208;
  block[3] = &unk_1003A8030;
  block[6] = &v10;
  block[7] = a3;
  unsigned int v9 = a4;
  block[4] = self;
  void block[5] = a5;
  dispatch_sync(dispatchQueue, block);
  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);
  return v6;
}

- (void)beginSessionWithID:(int64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100164318;
  v4[3] = &unk_1003A3838;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)cancelAuthenticationSessionWithID:(int64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001647E8;
  v4[3] = &unk_1003A3838;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)cancelSessionWithID:(int64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001649C8;
  v4[3] = &unk_1003A3838;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (BOOL)canOpenSessionWithProperties:(id)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100164BF4;
  block[3] = &unk_1003A7030;
  block[4] = self;
  void block[5] = a3;
  block[6] = &v7;
  dispatch_sync(dispatchQueue, block);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)closeUnstartedSessionWithID:(int64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100164CA8;
  v4[3] = &unk_1003A3838;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)continueAuthenticationSessionWithID:(int64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100164D80;
  v4[3] = &unk_1003A3838;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)disavowDownloadSessionWithID:(int64_t)a3 error:(id)a4
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100164F64;
  block[3] = &unk_1003A6488;
  void block[5] = a4;
  block[6] = a3;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)disconnectDownloadSessionWithID:(int64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001651A8;
  v4[3] = &unk_1003A3838;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)endBackgroundTaskForSessionWithID:(int64_t)a3 identifier:(id)a4
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016538C;
  block[3] = &unk_1003A6488;
  void block[5] = a4;
  block[6] = a3;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)failDownloadSessionWithID:(int64_t)a3 error:(id)a4
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001654E4;
  block[3] = &unk_1003A6488;
  void block[5] = a4;
  block[6] = a3;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)finishDownloadSessionWithID:(int64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100165704;
  v4[3] = &unk_1003A3838;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)modifyDownloadHandlerWithID:(int64_t)a3 usingBlock:(id)a4
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3052000000;
  v14 = sub_1001641EC;
  uint64_t v15 = sub_1001641FC;
  uint64_t v16 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001659D8;
  block[3] = &unk_1003A80A8;
  void block[5] = &v11;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
  (*((void (**)(id, uint64_t))a4 + 2))(a4, v12[5]);
  uint64_t v7 = (void *)v12[5];
  if (v7)
  {
    v8 = self->_dispatchQueue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100165A4C;
    v9[3] = &unk_1003A33A8;
    v9[4] = self;
    dispatch_sync(v8, v9);
    uint64_t v7 = (void *)v12[5];
  }

  _Block_object_dispose(&v11, 8);
}

- (id)openSessionWithProperties:(id)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3052000000;
  char v10 = sub_1001641EC;
  uint64_t v11 = sub_1001641FC;
  uint64_t v12 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100165B48;
  block[3] = &unk_1003A7030;
  block[4] = self;
  void block[5] = a3;
  block[6] = &v7;
  dispatch_sync(dispatchQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)pauseSessionWithID:(int64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100165CC4;
  v4[3] = &unk_1003A3838;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)performDefaultForAuthenticationSessionWithID:(int64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100165EA8;
  v4[3] = &unk_1003A3838;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)rejectSpaceForAuthenticationSessionWithID:(int64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100166088;
  v4[3] = &unk_1003A3838;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)releaseDownloadSessionWithID:(int64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100166268;
  v4[3] = &unk_1003A3838;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)removeHandlerObserver:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100166448;
  v4[3] = &unk_1003A3380;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)resetDisavowedSessionsForHandlerWithID:(int64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001664C8;
  v4[3] = &unk_1003A3838;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)retrySessionWithID:(int64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10016670C;
  v4[3] = &unk_1003A3838;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (id)sessionForSessionID:(int64_t)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3052000000;
  char v10 = sub_1001641EC;
  uint64_t v11 = sub_1001641FC;
  uint64_t v12 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016697C;
  block[3] = &unk_1003A80A8;
  void block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)setGlobalDownloadHandlerID:(int64_t)a3 forClientID:(id)a4
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100166A68;
  block[3] = &unk_1003A6488;
  block[4] = self;
  void block[5] = a4;
  block[6] = a3;
  dispatch_async(dispatchQueue, block);
}

- (void)setSessionProperties:(id)a3 forSessionWithID:(int64_t)a4
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100166DD8;
  block[3] = &unk_1003A6488;
  void block[5] = a3;
  block[6] = a4;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)useCredential:(id)a3 forAuthenticationSessionWithID:(int64_t)a4
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100166ED0;
  block[3] = &unk_1003A6488;
  void block[5] = a3;
  block[6] = a4;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_clientDisconnectNotification:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001670F0;
  v4[3] = &unk_1003A3380;
  v4[4] = a3;
  v4[5] = self;
  dispatch_async(dispatchQueue, v4);
}

- (id)_clientForProperties:(id)a3
{
  id v5 = [a3 clientIdentifier];
  id v6 = [a3 handlerIdentifier];
  if (v6)
  {
    id v7 = [objc_alloc((Class)NSNumber) initWithLongLong:v6];
    id v8 = [(NSMutableDictionary *)self->_clientsByHandlerID objectForKey:v7];
  }
  else if (v5 {
         && (id v9 = [(NSMutableDictionary *)self->_globalHandlersByClientID objectForKey:v5]) != 0)
  }
  {
    id v8 = [(NSMutableDictionary *)self->_clientsByHandlerID objectForKey:v9];
  }
  else
  {
    id v8 = 0;
  }
  id v10 = [a3 downloadPhase];
  if (v10 && objc_msgSend(objc_msgSend(v8, "downloadPhasesToIgnore"), "containsObject:", v10)) {
    return 0;
  }
  return v8;
}

- (id)_clientForSession:(id)a3
{
  id v4 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithLongLong:", objc_msgSend(a3, "activeHandlerIdentifier"));
  id v5 = [(NSMutableDictionary *)self->_clientsByHandlerID objectForKey:v4];

  return v5;
}

- (id)_disconnectSessionsForHandlerID:(int64_t)a3
{
  id v5 = +[NSMutableArray array];
  id v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  sessionsByID = self->_sessionsByID;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100167738;
  v9[3] = &unk_1003A80D0;
  void v9[5] = v5;
  v9[6] = a3;
  v9[4] = v6;
  [(NSMutableDictionary *)sessionsByID enumerateKeysAndObjectsUsingBlock:v9];

  self->_sessionsByID = v6;
  return v5;
}

- (void)_endDisconnectedSessionsForClientID:(id)a3
{
  id v5 = -[NSMutableDictionary objectForKey:](self->_disconnectedSessionsByClientID, "objectForKey:");
  if (v5)
  {
    id v6 = v5;
    if ([v5 count]) {
      [(DownloadHandlerManager *)self _notifyObserversOfSessionChanges:v6];
    }
    [(NSMutableDictionary *)self->_disconnectedSessionsByClientID removeObjectForKey:a3];
  }
}

- (void)_endSessionWithID:(int64_t)a3 state:(int64_t)a4
{
  id v6 = [(DownloadHandlerManager *)self _popDownloadSessionForSessionID:a3];
  if (v6)
  {
    id v7 = v6;
    [v6 setSessionState:a4];
    [(DownloadHandlerManager *)self _notifyObserversOfSessionChange:v7];
  }
}

- (int64_t)_globalHandlerIDForClientID:(id)a3
{
  int64_t result = (int64_t)[(NSMutableDictionary *)self->_globalHandlersByClientID objectForKey:a3];
  if (result)
  {
    return (int64_t)[(id)result longLongValue];
  }
  return result;
}

- (void)_notifyObserversOfHandlersChange
{
  id v3 = [(NSHashTable *)self->_observers copy];
  observersQueue = self->_observersQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100167978;
  v5[3] = &unk_1003A3380;
  v5[4] = v3;
  v5[5] = self;
  dispatch_async(observersQueue, v5);
}

- (void)_notifyObserversOfSessionChange:(id)a3
{
  id v4 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", a3, 0);
  [(DownloadHandlerManager *)self _notifyObserversOfSessionChanges:v4];
}

- (void)_notifyObserversOfSessionChanges:(id)a3
{
  id v5 = [(NSHashTable *)self->_observers allObjects];
  observersQueue = self->_observersQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100167B94;
  block[3] = &unk_1003A3410;
  block[4] = v5;
  void block[5] = self;
  block[6] = a3;
  dispatch_async(observersQueue, block);
}

- (id)_popDownloadSessionForSessionID:(int64_t)a3
{
  id v4 = [objc_alloc((Class)NSNumber) initWithLongLong:a3];
  id v5 = [(NSMutableDictionary *)self->_sessionsByID objectForKey:v4];
  if (v5) {
    [(NSMutableDictionary *)self->_sessionsByID removeObjectForKey:v4];
  }

  return v5;
}

- (void)_sendMessage:(int64_t)a3 forSessionID:(int64_t)a4 replyBlock:(id)a5
{
  id v9 = [objc_alloc((Class)NSNumber) initWithLongLong:a4];
  id v10 = [(NSMutableDictionary *)self->_sessionsByID objectForKey:v9];
  if (v10 && (v11 = v10, (id v12 = [(DownloadHandlerManager *)self _clientForSession:v10]) != 0))
  {
    uint64_t v13 = v12;
    id v14 = +[SSLogConfig sharedDaemonConfig];
    if (!v14) {
      id v14 = +[SSLogConfig sharedConfig];
    }
    unsigned int v15 = [v14 shouldLog];
    if ([v14 shouldLogToDisk]) {
      int v16 = v15 | 2;
    }
    else {
      int v16 = v15;
    }
    if (!os_log_type_enabled((os_log_t)[v14 OSLogObject], OS_LOG_TYPE_INFO)) {
      v16 &= 2u;
    }
    if (v16)
    {
      int v23 = 138412802;
      uint64_t v24 = objc_opt_class();
      __int16 v25 = 2048;
      int64_t v26 = a3;
      __int16 v27 = 2112;
      v28 = v13;
      LODWORD(v21) = 32;
      uint64_t v17 = _os_log_send_and_compose_impl();
      if (v17)
      {
        v18 = (void *)v17;
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4, &v23, v21);
        free(v18);
        SSFileLog();
      }
    }
    xpc_object_t v19 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v19, "0", a3);
    xpc_dictionary_set_int64(v19, "1", a4);
    id v20 = [v11 sessionProperties];
    xpc_dictionary_set_int64(v19, "2", (int64_t)[v20 downloadIdentifier]);
    xpc_dictionary_set_int64(v19, "3", (int64_t)[v20 assetIdentifier]);
    [v20 downloadPhase];
    SSXPCDictionarySetCFObject();
    [v20 duetBudget];
    SSXPCDictionarySetCFObject();
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100168034;
    v22[3] = &unk_1003A4338;
    v22[4] = a5;
    objc_msgSend(objc_msgSend(v13, "outputConnection"), "sendMessage:withReply:", v19, v22);
    xpc_release(v19);
  }
  else if (a5)
  {
    (*((void (**)(id, void))a5 + 2))(a5, 0);
  }
}

@end