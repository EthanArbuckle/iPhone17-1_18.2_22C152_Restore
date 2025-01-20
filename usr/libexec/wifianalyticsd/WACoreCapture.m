@interface WACoreCapture
- (OS_dispatch_queue)ccQueue;
- (WACoreCapture)init;
- (void)__dumpCoreCaptureLogsWithReason:(id)a3;
- (void)setCcQueue:(id)a3;
@end

@implementation WACoreCapture

- (WACoreCapture)init
{
  v9.receiver = self;
  v9.super_class = (Class)WACoreCapture;
  v2 = [(WACoreCapture *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.wifi.analytics.ccQ", v3);
    ccQueue = v2->_ccQueue;
    v2->_ccQueue = (OS_dispatch_queue *)v4;

    v6 = v2;
  }
  else
  {
    v8 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v11 = "-[WACoreCapture init]";
      __int16 v12 = 1024;
      int v13 = 48;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error super init", buf, 0x12u);
    }
  }
  return v2;
}

- (void)__dumpCoreCaptureLogsWithReason:(id)a3
{
  id v4 = a3;
  v5 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v11 = "-[WACoreCapture __dumpCoreCaptureLogsWithReason:]";
    __int16 v12 = 1024;
    int v13 = 62;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Called into __dumpCoreCaptureLogsWithReason: %@", buf, 0x1Cu);
  }

  ccQueue = self->_ccQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100041930;
  block[3] = &unk_1000D0D98;
  id v9 = v4;
  id v7 = v4;
  dispatch_async((dispatch_queue_t)ccQueue, block);
}

- (OS_dispatch_queue)ccQueue
{
  return self->_ccQueue;
}

- (void)setCcQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end