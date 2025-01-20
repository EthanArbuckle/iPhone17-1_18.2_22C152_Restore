@interface NDTodayClientConnection
- (NDTodayClientConnection)init;
- (NDTodayClientConnection)initWithClient:(id)a3 contentContext:(id)a4 fetchQueue:(id)a5;
- (NTTodayContext)todayContext;
- (OS_dispatch_queue)accessQueue;
- (void)fetchLatestResultsWithParameters:(id)a3 completion:(id)a4;
- (void)fetchModuleDescriptorsWithCompletion:(id)a3;
- (void)fetchPlaceholderResultsWithOperationInfo:(id)a3 syncCompletion:(id)a4;
- (void)markAnalyticsElement:(id)a3 asReadAtDate:(id)a4 withCompletion:(id)a5;
- (void)markAnalyticsElements:(id)a3 asSeenAtDate:(id)a4 withCompletion:(id)a5;
@end

@implementation NDTodayClientConnection

- (NDTodayClientConnection)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v6 = "-[NDTodayClientConnection init]";
    __int16 v7 = 2080;
    v8 = "NDTodayClientConnection.m";
    __int16 v9 = 1024;
    int v10 = 27;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[NDTodayClientConnection init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (NDTodayClientConnection)initWithClient:(id)a3 contentContext:(id)a4 fetchQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000476F8();
    if (v9) {
      goto LABEL_6;
    }
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100047630();
  }
LABEL_6:
  if (!v10 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100047568();
  }
  v19.receiver = self;
  v19.super_class = (Class)NDTodayClientConnection;
  __int16 v11 = [(NDTodayClientConnection *)&v19 init];
  if (v11)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100007964;
    block[3] = &unk_1000618B8;
    id v17 = v9;
    id v18 = v10;
    if (qword_10006BCA0 != -1) {
      dispatch_once(&qword_10006BCA0, block);
    }
    objc_storeStrong((id *)&v11->_accessQueue, (id)qword_10006BC98);
    objc_initWeak(&location, v8);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100007A34;
    v13[3] = &unk_1000618E0;
    objc_copyWeak(&v14, &location);
    [(id)qword_10006BC90 setNewResultsHandler:v13];
    objc_storeStrong((id *)&v11->_todayContext, (id)qword_10006BC90);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v11;
}

- (void)fetchModuleDescriptorsWithCompletion:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000477C0();
  }
  v5 = [(NDTodayClientConnection *)self todayContext];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100007B40;
  v7[3] = &unk_100061908;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchModuleDescriptorsWithCompletion:v7];
}

- (void)fetchLatestResultsWithParameters:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100047948();
    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100047884();
  }
LABEL_6:
  id v8 = [(NDTodayClientConnection *)self todayContext];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100007C60;
  v10[3] = &unk_100061930;
  id v11 = v7;
  id v9 = v7;
  [v8 fetchLatestResultsWithOperationInfo:v6 completion:v10];
}

- (void)fetchPlaceholderResultsWithOperationInfo:(id)a3 syncCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100047AD0();
    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100047A0C();
  }
LABEL_6:
  id v8 = [(NDTodayClientConnection *)self todayContext];
  id v9 = [v8 placeholderResultsWithOperationInfo:v6];

  v7[2](v7, v9);
}

- (void)markAnalyticsElements:(id)a3 asSeenAtDate:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100047C58();
    if (v9) {
      goto LABEL_6;
    }
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100047B94();
  }
LABEL_6:
  id v11 = [(NDTodayClientConnection *)self accessQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100007F34;
  v15[3] = &unk_100061748;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)markAnalyticsElement:(id)a3 asReadAtDate:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100047DE0();
    if (v9) {
      goto LABEL_6;
    }
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100047D1C();
  }
LABEL_6:
  id v11 = [(NDTodayClientConnection *)self accessQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100008148;
  v15[3] = &unk_100061748;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (NTTodayContext)todayContext
{
  return self->_todayContext;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);

  objc_storeStrong((id *)&self->_todayContext, 0);
}

@end