@interface MagicSwitchEnabler
+ (BOOL)isMagicSwitchEnabled;
+ (id)sharedInstance;
+ (void)run;
- (BOOL)isSettingEnabled;
- (MagicSwitchEnabler)init;
- (OS_dispatch_queue)workQueue;
- (void)setWorkQueue:(id)a3;
@end

@implementation MagicSwitchEnabler

- (MagicSwitchEnabler)init
{
  v8.receiver = self;
  v8.super_class = (Class)MagicSwitchEnabler;
  v2 = [(MagicSwitchEnabler *)&v8 init];
  if (v2)
  {
    v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v10 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "MagicSwitchEnabler --- Initializing (%p)", buf, 0xCu);
    }
    objc_storeStrong((id *)&qword_100021A48, v2);
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.NanoRegistry.MagicSwitch", v4);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

+ (void)run
{
  sub_10000A8D8();
  v3 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "MagicSwitchEnabler --- Launching; \"MagicSwitch-38\" \"4520\"",
      buf,
      2u);
  }
  if (MGGetBoolAnswer() && (uint64_t v4 = objc_opt_new()) != 0)
  {
    dispatch_queue_t v5 = (void *)v4;
    v6 = +[MagicSwitchEnabler sharedInstance];
    v7 = [v6 workQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000BFB4;
    block[3] = &unk_100018538;
    id v13 = v5;
    dispatch_async(v7, block);
  }
  else
  {
    +[KeepAliveManager deleteMagicSwitchPathFile];
  }
  objc_super v8 = +[MagicSwitchEnabler sharedInstance];
  uint64_t v9 = [v8 workQueue];
  v10 = (void *)v9;
  if (v9) {
    v11 = v9;
  }
  else {
    v11 = &_dispatch_main_q;
  }
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v11, &stru_1000186F8);

  dispatch_main();
}

+ (id)sharedInstance
{
  return (id)qword_100021A48;
}

- (BOOL)isSettingEnabled
{
  v2 = objc_opt_class();

  return [v2 isMagicSwitchEnabled];
}

+ (BOOL)isMagicSwitchEnabled
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"EnableMagicSwitch", @"com.apple.NanoRegistry", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 0;
  }
  return !v3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end