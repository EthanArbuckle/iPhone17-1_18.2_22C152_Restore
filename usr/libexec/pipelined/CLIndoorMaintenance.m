@interface CLIndoorMaintenance
- (BOOL)withinQueueCanReinitializeRemoteState;
- (id)endpointName;
- (id)remoteObjectProtocol;
- (id)withinQueuePermanentShutdownReason;
- (void)doSynchronousXPC:(id)a3 description:(const char *)a4 waitForever:(BOOL)a5;
- (void)eraseEverything;
- (void)numFloors:(id)a3;
- (void)onQueueEraseEverything:(id)a3;
- (void)onQueueNumFloors:(id)a3;
- (void)onQueuePrefetch:(id)a3 callback:(id)a4 when:(unsigned __int8)a5;
- (void)onQueueShutdown;
- (void)prefetch:(id)a3;
- (void)prefetchSynchronous:(id)a3;
- (void)retrieveLocationRelevancyDurationWithCompletionHandler:(id)a3;
- (void)shutdown;
- (void)withinQueueReinitializeRemoteState;
@end

@implementation CLIndoorMaintenance

- (id)remoteObjectProtocol
{
  return &OBJC_PROTOCOL___CLIndoorMaintenanceProtocol;
}

- (id)endpointName
{
  return @"com.apple.pipelined.maintenance";
}

- (id)withinQueuePermanentShutdownReason
{
  return 0;
}

- (BOOL)withinQueueCanReinitializeRemoteState
{
  return 0;
}

- (void)withinQueueReinitializeRemoteState
{
  id v2 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"Cannot re-initialize remote state" userInfo:0];
  objc_exception_throw(v2);
}

- (void)retrieveLocationRelevancyDurationWithCompletionHandler:(id)a3
{
  frameworkQueue = self->super._frameworkQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3321888768;
  v8[2] = sub_1000B3C10;
  v8[3] = &unk_1004524E8;
  v5 = self;
  id v6 = objc_retainBlock(a3);
  v9 = v5;
  v7 = v5;
  id v10 = objc_retainBlock(v6);
  dispatch_async(frameworkQueue, v8);
}

- (void)prefetch:(id)a3
{
  id v4 = a3;
  if (qword_10047BEE8 != -1) {
    dispatch_once(&qword_10047BEE8, &stru_100452660);
  }
  v5 = (id)qword_10047BEF0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    id v14 = [v4 count];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Sending request to prefetch %{public}zu venues", buf, 0xCu);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3321888768;
  v10[2] = sub_1000B3F60;
  v10[3] = &unk_100452518;
  id v6 = self;
  id v7 = v4;
  v8 = v6;
  v11 = v8;
  id v12 = v7;
  [(CLIndoorMaintenance *)v8 doSynchronousXPC:v10 description:"prefetch:" waitForever:0];

  if (qword_10047BEE8 != -1)
  {
    dispatch_once(&qword_10047BEE8, &stru_100452660);
    v9 = qword_10047BEF0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  v9 = qword_10047BEF0;
  if (os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_DEBUG))
  {
LABEL_7:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Prefetch request finished", buf, 2u);
  }
LABEL_8:
}

- (void)onQueuePrefetch:(id)a3 callback:(id)a4 when:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  id v13 = a3;
  id v8 = a4;
  if (v5 == 1) {
    CFStringRef v9 = @"prefetchSynchronous:";
  }
  else {
    CFStringRef v9 = @"prefetch:";
  }
  connection = self->super._connection;
  v11 = [(CLIndoorXPCProvider *)self _defaultErrHandler:v8 forCaller:v9];
  id v12 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v11];
  [v12 prefetch:v13 callback:v8 when:v5];
}

- (void)prefetchSynchronous:(id)a3
{
  id v4 = a3;
  if (qword_10047BEE8 != -1) {
    dispatch_once(&qword_10047BEE8, &stru_100452660);
  }
  uint64_t v5 = (id)qword_10047BEF0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    id v14 = [v4 count];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Sending request to prefetch %zu venues synchronously", buf, 0xCu);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3321888768;
  v10[2] = sub_1000B431C;
  v10[3] = &unk_100452548;
  id v6 = self;
  id v7 = v4;
  id v8 = v6;
  v11 = v8;
  id v12 = v7;
  [(CLIndoorMaintenance *)v8 doSynchronousXPC:v10 description:"prefetch:" waitForever:1];

  if (qword_10047BEE8 != -1)
  {
    dispatch_once(&qword_10047BEE8, &stru_100452660);
    CFStringRef v9 = qword_10047BEF0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  CFStringRef v9 = qword_10047BEF0;
  if (os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_DEBUG))
  {
LABEL_7:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Synchronous prefetch request finished", buf, 2u);
  }
LABEL_8:
}

- (void)doSynchronousXPC:(id)a3 description:(const char *)a4 waitForever:(BOOL)a5
{
  id v8 = a3;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  frameworkQueue = self->super._frameworkQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000B4580;
  v15[3] = &unk_1004525B0;
  id v11 = v8;
  id v17 = v11;
  id v12 = v9;
  v16 = v12;
  dispatch_async(frameworkQueue, v15);
  if (a5)
  {
    if (!dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL)) {
      goto LABEL_8;
    }
  }
  else
  {
    dispatch_time_t v13 = dispatch_time(0, 3000000000);
    if (!dispatch_semaphore_wait(v12, v13)) {
      goto LABEL_8;
    }
  }
  if (qword_10047BEE8 != -1)
  {
    dispatch_once(&qword_10047BEE8, &stru_100452660);
    id v14 = qword_10047BEF0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  id v14 = qword_10047BEF0;
  if (os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_ERROR))
  {
LABEL_7:
    *(_DWORD *)buf = 136315138;
    v19 = a4;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Timeout trying to do XPC %{publci}s", buf, 0xCu);
  }
LABEL_8:
}

- (void)eraseEverything
{
  if (qword_10047BEE8 == -1)
  {
    v3 = qword_10047BEF0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_INFO)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&qword_10047BEE8, &stru_100452660);
  v3 = qword_10047BEF0;
  if (os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Erasing all indoor tiles", buf, 2u);
  }
LABEL_4:
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3321888768;
  v6[2] = sub_1000B4820;
  v6[3] = &unk_1004525D0;
  id v4 = self;
  id v7 = v4;
  [(CLIndoorMaintenance *)v4 doSynchronousXPC:v6 description:"eraseEverything" waitForever:0];

  if (qword_10047BEE8 != -1)
  {
    dispatch_once(&qword_10047BEE8, &stru_100452660);
    uint64_t v5 = qword_10047BEF0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v5 = qword_10047BEF0;
  if (os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_INFO))
  {
LABEL_6:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Erase all indoor tile request finished", buf, 2u);
  }
LABEL_7:
}

- (void)onQueueEraseEverything:(id)a3
{
  id v4 = a3;
  if (qword_10047BEE8 != -1)
  {
    dispatch_once(&qword_10047BEE8, &stru_100452660);
    uint64_t v5 = qword_10047BEF0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v5 = qword_10047BEF0;
  if (os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    *(_WORD *)dispatch_semaphore_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Sending request to erase all indoor tiles", v9, 2u);
  }
LABEL_4:
  connection = self->super._connection;
  id v7 = [(CLIndoorXPCProvider *)self _defaultErrHandlerForCaller:@"eraseAllData"];
  id v8 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v7];
  [v8 eraseAllData:v4];
}

- (void)shutdown
{
  if (qword_10047BEE8 != -1)
  {
    dispatch_once(&qword_10047BEE8, &stru_100452660);
    v3 = qword_10047BEF0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_INFO)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v3 = qword_10047BEF0;
  if (os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Requesting shutdown of daemon", buf, 2u);
  }
LABEL_4:
  frameworkQueue = self->super._frameworkQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_1000B4AC0;
  block[3] = &unk_100452600;
  id v7 = self;
  uint64_t v5 = v7;
  dispatch_sync(frameworkQueue, block);
}

- (void)onQueueShutdown
{
  if (qword_10047BEE8 != -1)
  {
    dispatch_once(&qword_10047BEE8, &stru_100452660);
    v3 = qword_10047BEF0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v3 = qword_10047BEF0;
  if (os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Sending shutdown request to daemon", v7, 2u);
  }
LABEL_4:
  connection = self->super._connection;
  uint64_t v5 = [(CLIndoorXPCProvider *)self _defaultErrHandlerForCaller:@"shutdown"];
  id v6 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v5];
  [v6 shutdown];
}

- (void)numFloors:(id)a3
{
  id v4 = a3;
  if (qword_10047BEE8 != -1)
  {
    dispatch_once(&qword_10047BEE8, &stru_100452660);
    uint64_t v5 = qword_10047BEF0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_INFO)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v5 = qword_10047BEF0;
  if (os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Requesting number of floors from daemon", buf, 2u);
  }
LABEL_4:
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3321888768;
  v9[2] = sub_1000B4D9C;
  v9[3] = &unk_100452630;
  id v6 = self;
  id v7 = objc_retainBlock(v4);
  id v8 = v6;
  id v10 = v8;
  id v11 = objc_retainBlock(v7);
  [(CLIndoorMaintenance *)v8 doSynchronousXPC:v9 description:"numFloors" waitForever:0];
}

- (void)onQueueNumFloors:(id)a3
{
  id v4 = a3;
  if (qword_10047BEE8 != -1)
  {
    dispatch_once(&qword_10047BEE8, &stru_100452660);
    uint64_t v5 = qword_10047BEF0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v5 = qword_10047BEF0;
  if (os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    *(_WORD *)dispatch_semaphore_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Sending request to find the number of floors in the Db", v9, 2u);
  }
LABEL_4:
  connection = self->super._connection;
  id v7 = [(CLIndoorXPCProvider *)self _defaultErrHandlerForCaller:@"numFloors"];
  id v8 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v7];
  [v8 numFloors:v4];
}

@end