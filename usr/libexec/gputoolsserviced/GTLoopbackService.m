@interface GTLoopbackService
- (GTLoopbackService)init;
- (id)echo:(id)a3;
- (void)echo:(id)a3 completionHandler:(id)a4;
- (void)echo:(id)a3 repeat:(unint64_t)a4 callback:(id)a5;
- (void)echo:(id)a3 repeat:(unint64_t)a4 callback:(id)a5 complete:(id)a6;
@end

@implementation GTLoopbackService

- (GTLoopbackService)init
{
  v8.receiver = self;
  v8.super_class = (Class)GTLoopbackService;
  v2 = [(GTLoopbackService *)&v8 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.gputools.transport", "Loopback");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.gputools.loopback", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (id)echo:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v6 = log;
    id v7 = [v4 description];
    int v9 = 136315138;
    id v10 = [v7 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Sync: %s", (uint8_t *)&v9, 0xCu);
  }

  return v4;
}

- (void)echo:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    int v9 = log;
    id v10 = [v6 description];
    int v11 = 136315138;
    id v12 = [v10 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Async: %s", (uint8_t *)&v11, 0xCu);
  }
  v7[2](v7, v6);
}

- (void)echo:(id)a3 repeat:(unint64_t)a4 callback:(id)a5
{
  id v8 = a3;
  int v9 = (void (**)(id, id))a5;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    int v11 = log;
    id v12 = [v8 description];
    int v13 = 134218242;
    unint64_t v14 = a4;
    __int16 v15 = 2080;
    id v16 = [v12 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Repeat (%llu): %s", (uint8_t *)&v13, 0x16u);
  }
  for (; a4; --a4)
    v9[2](v9, v8);
}

- (void)echo:(id)a3 repeat:(unint64_t)a4 callback:(id)a5 complete:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    unint64_t v14 = log;
    id v15 = [v10 description];
    *(_DWORD *)buf = 134218242;
    unint64_t v26 = a4;
    __int16 v27 = 2080;
    id v28 = [v15 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Repeat (%llu): %s", buf, 0x16u);
  }
  serialQueue = self->_serialQueue;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000135D4;
  v20[3] = &unk_100034B80;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  unint64_t v24 = a4;
  id v17 = v12;
  id v18 = v10;
  id v19 = v11;
  dispatch_async(serialQueue, v20);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

@end