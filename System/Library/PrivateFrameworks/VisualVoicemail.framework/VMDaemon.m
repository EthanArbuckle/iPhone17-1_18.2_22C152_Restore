@interface VMDaemon
+ (id)sharedDaemon;
- (BOOL)locked;
- (OS_dispatch_queue)queue;
- (VMDaemon)init;
- (VMTelephonyClient)telephonyClient;
- (VMTelephonyService)telephonyService;
- (VMVoicemailService)voicemailService;
- (id)unlock_if_needed:(BOOL *)a3;
- (void)executeHandlerForNotificationWithName:(id)a3 info:(id)a4;
- (void)handleVMDeviceUnlockedNotification:(id)a3;
- (void)setLocked:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setTelephonyClient:(id)a3;
- (void)setTelephonyService:(id)a3;
- (void)setVoicemailService:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation VMDaemon

+ (id)sharedDaemon
{
  if (qword_1000E08D0 != -1) {
    dispatch_once(&qword_1000E08D0, &stru_1000C1E70);
  }
  v2 = (void *)qword_1000E08C8;
  return v2;
}

- (VMDaemon)init
{
  v30.receiver = self;
  v30.super_class = (Class)VMDaemon;
  v2 = [(VMDaemon *)&v30 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.vmd.mainProcessingQueue", 0);
    [(VMDaemon *)v2 setQueue:v3];

    v4 = [VMTelephonyClient alloc];
    v5 = [(VMDaemon *)v2 queue];
    v6 = [(VMTelephonyClient *)v4 initWithQueue:v5];
    [(VMDaemon *)v2 setTelephonyClient:v6];

    initImapNetworkLayer();
    v7 = +[VMSharedProtectionObserver sharedProtectionObserver];
    -[VMDaemon setLocked:](v2, "setLocked:", [v7 hasDeviceBeenUnlockedSinceBoot] ^ 1);

    v8 = sub_10002F430();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v9 = [(VMDaemon *)v2 locked];
      CFStringRef v10 = @"NOT locked";
      *(_DWORD *)buf = 136315650;
      v32 = "";
      if (v9) {
        CFStringRef v10 = @"locked";
      }
      __int16 v33 = 2080;
      v34 = "";
      __int16 v35 = 2112;
      CFStringRef v36 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I %s%sDevice is %@", buf, 0x20u);
    }

    v11 = [VMVoicemailService alloc];
    v12 = [(VMDaemon *)v2 queue];
    v13 = [(VMDaemon *)v2 telephonyClient];
    v14 = [(VMVoicemailService *)v11 initWithTelephonyClient:v12 telephonyClient:v13];
    [(VMDaemon *)v2 setVoicemailService:v14];

    if ([(VMDaemon *)v2 locked])
    {
      v15 = [VMTelephonyService alloc];
      v16 = [(VMDaemon *)v2 queue];
      v17 = [(VMDaemon *)v2 telephonyClient];
      v18 = [(VMTelephonyService *)v15 initWithTelephonyClient:v16 telephonyClient:v17];
      [(VMDaemon *)v2 setTelephonyService:v18];
    }
    else
    {
      v19 = [(VMDaemon *)v2 queue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100031F84;
      block[3] = &unk_1000C12C0;
      v29 = v2;
      dispatch_async(v19, block);

      v16 = v29;
    }
  }
  v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  v25 = sub_100031FC8;
  v26 = &unk_1000C1E98;
  v20 = v2;
  v27 = v20;
  xpc_set_event_stream_handler("com.apple.CTTelephonyCenter", (dispatch_queue_t)&_dispatch_main_q, &v23);
  v21 = +[NSNotificationCenter defaultCenter];
  [v21 addObserver:v20 selector:"handleVMDeviceUnlockedNotification:" name:@"kVMDeviceUnlockedNotification" object:0];

  return v20;
}

- (void)start
{
  dispatch_queue_t v3 = [(VMDaemon *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000321BC;
  block[3] = &unk_1000C12C0;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)stop
{
}

- (id)unlock_if_needed:(BOOL *)a3
{
  v5 = [(VMDaemon *)self queue];
  dispatch_assert_queue_V2(v5);

  if (a3) {
    *a3 = [(VMDaemon *)self locked];
  }
  if (![(VMDaemon *)self locked]) {
    goto LABEL_8;
  }
  v6 = +[VMSharedProtectionObserver sharedProtectionObserver];
  unsigned int v7 = [v6 checkUnlockSinceBootState];

  if (v7)
  {
    v8 = sub_10002F430();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315394;
      v13 = "";
      __int16 v14 = 2080;
      v15 = "";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I %s%sDaemon was locked - starting", (uint8_t *)&v12, 0x16u);
    }

    [(VMDaemon *)self setLocked:0];
    unsigned int v9 = [(VMDaemon *)self voicemailService];
    objc_msgSend(v9, "full_start");

LABEL_8:
    CFStringRef v10 = 0;
    goto LABEL_10;
  }
  CFStringRef v10 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:35 userInfo:0];
LABEL_10:
  return v10;
}

- (void)executeHandlerForNotificationWithName:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(VMDaemon *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003251C;
  block[3] = &unk_1000C11E0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)handleVMDeviceUnlockedNotification:(id)a3
{
  id v4 = a3;
  v5 = sub_10002F430();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    id v10 = "";
    __int16 v11 = 2080;
    id v12 = "";
    __int16 v13 = 2112;
    id v14 = (id)objc_opt_class();
    __int16 v15 = 2112;
    id v16 = v4;
    id v6 = v14;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%s%@ is handling %@", buf, 0x2Au);
  }
  id v7 = [(VMDaemon *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000326E4;
  block[3] = &unk_1000C12C0;
  void block[4] = self;
  dispatch_async(v7, block);
}

- (BOOL)locked
{
  return self->_locked;
}

- (void)setLocked:(BOOL)a3
{
  self->_locked = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (VMTelephonyClient)telephonyClient
{
  return self->_telephonyClient;
}

- (void)setTelephonyClient:(id)a3
{
}

- (VMTelephonyService)telephonyService
{
  return self->_telephonyService;
}

- (void)setTelephonyService:(id)a3
{
}

- (VMVoicemailService)voicemailService
{
  return self->_voicemailService;
}

- (void)setVoicemailService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voicemailService, 0);
  objc_storeStrong((id *)&self->_telephonyService, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end