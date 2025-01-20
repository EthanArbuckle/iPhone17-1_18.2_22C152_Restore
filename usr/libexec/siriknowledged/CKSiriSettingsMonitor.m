@interface CKSiriSettingsMonitor
+ (id)sharedInstance;
- (CKSiriSettingsMonitor)init;
- (void)siriSettingsDidChange;
@end

@implementation CKSiriSettingsMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerSource, 0);

  objc_storeStrong((id *)&self->_processingQueue, 0);
}

- (void)siriSettingsDidChange
{
  v3 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[CKSiriSettingsMonitor siriSettingsDidChange]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  processingQueue = self->_processingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100001700;
  block[3] = &unk_100018538;
  objc_copyWeak(&v6, (id *)buf);
  dispatch_async((dispatch_queue_t)processingQueue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

- (CKSiriSettingsMonitor)init
{
  v8.receiver = self;
  v8.super_class = (Class)CKSiriSettingsMonitor;
  v2 = [(CKSiriSettingsMonitor *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.siriknowledged.monitor.settings.siri.queue", v3);
    processingQueue = v2->_processingQueue;
    v2->_processingQueue = (OS_dispatch_queue *)v4;

    timerSource = v2->_timerSource;
    v2->_timerSource = 0;
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100001E1C;
  block[3] = &unk_100018660;
  void block[4] = a1;
  if (qword_10001DE90 != -1) {
    dispatch_once(&qword_10001DE90, block);
  }
  v2 = (void *)qword_10001DE98;

  return v2;
}

@end