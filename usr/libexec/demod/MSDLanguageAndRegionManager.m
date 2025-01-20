@interface MSDLanguageAndRegionManager
+ (id)sharedInstance;
- (BOOL)saveCurrentDeviceLanguageIdentifier;
- (BOOL)saveCuurentDeviceRegionCode;
- (BOOL)saveDeviceLanguageIdentifier:(id)a3;
- (BOOL)saveDeviceRegionCode:(id)a3;
- (BOOL)setDeviceLanguage:(id)a3 andRegion:(id)a4 sbRestartNeeded:(BOOL *)a5 sbRestartHandler:(id)a6;
- (MSDLanguageAndRegionManager)init;
- (OS_dispatch_queue)queue;
- (id)deviceLanguageIdentifier;
- (id)deviceRegionCode;
- (id)getCurrentDeviceLanguage;
- (id)getCurrentDeviceLocaleCode;
- (id)getCurrentDevicePreferredLanguage;
- (id)getCurrentDeviceRegion;
- (void)cancelNotifyToken:(int)a3;
- (void)restoreDeviceLanguageAndRegionIfNeeded;
- (void)setQueue:(id)a3;
@end

@implementation MSDLanguageAndRegionManager

+ (id)sharedInstance
{
  if (qword_100189B78 != -1) {
    dispatch_once(&qword_100189B78, &stru_100153488);
  }
  v2 = (void *)qword_100189B70;

  return v2;
}

- (MSDLanguageAndRegionManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)MSDLanguageAndRegionManager;
  v2 = [(MSDLanguageAndRegionManager *)&v5 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.msd_language_and_region", 0);
    [(MSDLanguageAndRegionManager *)v2 setQueue:v3];
  }
  return v2;
}

- (BOOL)setDeviceLanguage:(id)a3 andRegion:(id)a4 sbRestartNeeded:(BOOL *)a5 sbRestartHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v43 = 0;
  v44 = (int *)&v43;
  uint64_t v45 = 0x2020000000;
  int v46 = -1;
  v13 = +[MSDLanguageAndRegionHelper sharedInstance];
  unsigned int v14 = [v13 setDeviceLanguage:v10 andRegion:v11];

  if (v14 != 2)
  {
    dispatch_time_t v15 = dispatch_time(0, 60000000000);
    v16 = [(MSDLanguageAndRegionManager *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10007F3E4;
    block[3] = &unk_1001534B0;
    v42 = &v43;
    block[4] = self;
    id v17 = v12;
    id v41 = v17;
    dispatch_after(v15, v16, block);

    v18 = v44;
    v19 = [(MSDLanguageAndRegionManager *)self queue];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10007F490;
    handler[3] = &unk_1001534D8;
    handler[4] = self;
    v39 = &v43;
    id v38 = v17;
    notify_register_dispatch("com.apple.springboard.finishedstartup", v18 + 6, v19, handler);
  }
  if (![(MSDLanguageAndRegionManager *)self saveDeviceLanguageIdentifier:v10])
  {
    v22 = sub_100068600();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1000D45B0(v22, v23, v24, v25, v26, v27, v28, v29);
    }
LABEL_12:

    [(MSDLanguageAndRegionManager *)self cancelNotifyToken:v44[6]];
    BOOL v20 = 0;
    if (!a5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (![(MSDLanguageAndRegionManager *)self saveDeviceRegionCode:v11])
  {
    v22 = sub_100068600();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1000D4578(v22, v30, v31, v32, v33, v34, v35, v36);
    }
    goto LABEL_12;
  }
  BOOL v20 = 1;
  if (a5) {
LABEL_6:
  }
    *a5 = v14 != 2;
LABEL_7:
  _Block_object_dispose(&v43, 8);

  return v20;
}

- (void)restoreDeviceLanguageAndRegionIfNeeded
{
  dispatch_queue_t v3 = [(MSDLanguageAndRegionManager *)self deviceLanguageIdentifier];
  uint64_t v4 = [(MSDLanguageAndRegionManager *)self deviceRegionCode];
  objc_super v5 = (void *)v4;
  if (v3)
  {
    if (v4)
    {
      v6 = +[MSDLanguageAndRegionHelper sharedInstance];
      unsigned int v7 = [v6 setDeviceLanguage:v3 andRegion:v5];

      if (v7 == 1)
      {
        v8 = sub_100068600();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          sub_1000D45E8(v8, v9, v10, v11, v12, v13, v14, v15);
        }
      }
    }
  }
}

- (id)getCurrentDeviceLanguage
{
  v2 = +[MSDLanguageAndRegionHelper sharedInstance];
  dispatch_queue_t v3 = [v2 getCurrentDeviceLanguage];

  return v3;
}

- (id)getCurrentDevicePreferredLanguage
{
  v2 = +[MSDLanguageAndRegionHelper sharedInstance];
  dispatch_queue_t v3 = [v2 getCurrentDevicePreferredLanguage];

  return v3;
}

- (id)getCurrentDeviceRegion
{
  v2 = +[MSDLanguageAndRegionHelper sharedInstance];
  dispatch_queue_t v3 = [v2 getCurrentDeviceRegion];

  return v3;
}

- (id)getCurrentDeviceLocaleCode
{
  v2 = +[MSDLanguageAndRegionHelper sharedInstance];
  dispatch_queue_t v3 = [v2 getCurrentLocaleCode];

  return v3;
}

- (BOOL)saveCurrentDeviceLanguageIdentifier
{
  v2 = self;
  dispatch_queue_t v3 = [(MSDLanguageAndRegionManager *)self getCurrentDeviceLanguage];
  LOBYTE(v2) = [(MSDLanguageAndRegionManager *)v2 saveDeviceLanguageIdentifier:v3];

  return (char)v2;
}

- (BOOL)saveCuurentDeviceRegionCode
{
  v2 = self;
  dispatch_queue_t v3 = [(MSDLanguageAndRegionManager *)self getCurrentDeviceRegion];
  LOBYTE(v2) = [(MSDLanguageAndRegionManager *)v2 saveDeviceRegionCode:v3];

  return (char)v2;
}

- (BOOL)saveDeviceLanguageIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[MSDPreferencesFile sharedInstance];
  unsigned __int8 v5 = [v4 setObject:v3 forKey:@"DeviceLanguageIdentifier"];

  return v5;
}

- (id)deviceLanguageIdentifier
{
  v2 = +[MSDPreferencesFile sharedInstance];
  id v3 = [v2 objectForKey:@"DeviceLanguageIdentifier"];

  return v3;
}

- (BOOL)saveDeviceRegionCode:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[MSDPreferencesFile sharedInstance];
  unsigned __int8 v5 = [v4 setObject:v3 forKey:@"DeviceRegionCode"];

  return v5;
}

- (id)deviceRegionCode
{
  v2 = +[MSDPreferencesFile sharedInstance];
  id v3 = [v2 objectForKey:@"DeviceRegionCode"];

  return v3;
}

- (void)cancelNotifyToken:(int)a3
{
  if (a3 != -1) {
    notify_cancel(a3);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end