@interface RMXPCActivityScheduler
+ (id)sharedInstance;
+ (void)start;
- (NSBackgroundActivityScheduler)onRebootActivity;
- (NSBackgroundActivityScheduler)periodicSyncActivity;
- (RMXPCActivityScheduler)init;
- (void)_forceSyncWithCompletion:(id)a3;
- (void)_onRebootWithCompletion:(id)a3;
- (void)_scheduleOnReboot;
- (void)_schedulePeriodicSync;
- (void)_start;
- (void)dealloc;
- (void)setOnRebootActivity:(id)a3;
- (void)setPeriodicSyncActivity:(id)a3;
@end

@implementation RMXPCActivityScheduler

+ (id)sharedInstance
{
  if (qword_1000DB498 != -1) {
    dispatch_once(&qword_1000DB498, &stru_1000C71A8);
  }
  v2 = (void *)qword_1000DB490;

  return v2;
}

+ (void)start
{
  id v2 = +[RMXPCActivityScheduler sharedInstance];
}

- (RMXPCActivityScheduler)init
{
  v8.receiver = self;
  v8.super_class = (Class)RMXPCActivityScheduler;
  id v2 = [(RMXPCActivityScheduler *)&v8 init];
  if (v2)
  {
    v3 = (NSBackgroundActivityScheduler *)[objc_alloc((Class)NSBackgroundActivityScheduler) initWithIdentifier:@"com.apple.remotemanagement.periodic-sync"];
    periodicSyncActivity = v2->_periodicSyncActivity;
    v2->_periodicSyncActivity = v3;

    v5 = (NSBackgroundActivityScheduler *)[objc_alloc((Class)NSBackgroundActivityScheduler) initWithIdentifier:@"com.apple.remotemanagement.on-reboot"];
    onRebootActivity = v2->_onRebootActivity;
    v2->_onRebootActivity = v5;
  }
  return v2;
}

- (void)dealloc
{
  v3 = [(RMXPCActivityScheduler *)self periodicSyncActivity];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)RMXPCActivityScheduler;
  [(RMXPCActivityScheduler *)&v4 dealloc];
}

- (void)_start
{
  [(RMXPCActivityScheduler *)self _schedulePeriodicSync];

  [(RMXPCActivityScheduler *)self _scheduleOnReboot];
}

- (void)_schedulePeriodicSync
{
  v3 = +[RMLog xpcActivityScheduler];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100088A70(v3);
  }

  objc_super v4 = [(RMXPCActivityScheduler *)self periodicSyncActivity];
  [v4 setPreregistered:1];

  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v5, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
  v6 = [(RMXPCActivityScheduler *)self periodicSyncActivity];
  [v6 _setAdditionalXPCActivityProperties:v5];

  objc_initWeak(&location, self);
  v7 = [(RMXPCActivityScheduler *)self periodicSyncActivity];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000885AC;
  v8[3] = &unk_1000C71D0;
  objc_copyWeak(&v9, &location);
  [v7 scheduleWithBlock:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_scheduleOnReboot
{
  v3 = +[RMLog xpcActivityScheduler];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100088AB4(v3);
  }

  objc_super v4 = [(RMXPCActivityScheduler *)self onRebootActivity];
  [v4 setPreregistered:1];

  objc_initWeak(&location, self);
  xpc_object_t v5 = [(RMXPCActivityScheduler *)self onRebootActivity];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100088730;
  v6[3] = &unk_1000C71D0;
  objc_copyWeak(&v7, &location);
  [v5 scheduleWithBlock:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_forceSyncWithCompletion:(id)a3
{
  id v3 = a3;
  objc_super v4 = +[RMLog xpcActivityScheduler];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Triggered periodic sync", buf, 2u);
  }

  xpc_object_t v5 = +[RMClientController sharedController];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100088884;
  v7[3] = &unk_1000C6B58;
  id v8 = v3;
  id v6 = v3;
  [v5 syncAllManagementSourcesWithCompletionHandler:v7];
}

- (void)_onRebootWithCompletion:(id)a3
{
  objc_super v4 = (void (**)(id, uint64_t))a3;
  xpc_object_t v5 = +[RMLog xpcActivityScheduler];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Triggered on reboot", v7, 2u);
  }

  id v6 = [(RMXPCActivityScheduler *)self onRebootActivity];
  [v6 invalidate];

  [(RMXPCActivityScheduler *)self setOnRebootActivity:0];
  v4[2](v4, 1);
}

- (NSBackgroundActivityScheduler)periodicSyncActivity
{
  return self->_periodicSyncActivity;
}

- (void)setPeriodicSyncActivity:(id)a3
{
}

- (NSBackgroundActivityScheduler)onRebootActivity
{
  return self->_onRebootActivity;
}

- (void)setOnRebootActivity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onRebootActivity, 0);

  objc_storeStrong((id *)&self->_periodicSyncActivity, 0);
}

@end