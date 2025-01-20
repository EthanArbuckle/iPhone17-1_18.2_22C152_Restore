@interface StartupRegisterManager
+ (id)sharedInstance;
- (BOOL)inTestingMode;
- (BOOL)shouldForceRegisterOnStartup;
- (NSDictionary)infoAtStartup;
- (NSMutableDictionary)info;
- (OS_dispatch_queue)infoChangeQueue;
- (StartupRegisterManager)init;
- (StartupRegisterManager)initWithDict:(id)a3;
- (id)_descriptionForEvent:(int64_t)a3;
- (id)description;
- (id)infoDictForTesting;
- (void)_clearAllInfo;
- (void)_clearQCPendingEpoch;
- (void)_removeInfoForKey:(id)a3;
- (void)_saveInfo;
- (void)_setInfo:(id)a3 forKey:(id)a4;
- (void)eventDidOccur:(int64_t)a3;
- (void)setInTestingMode:(BOOL)a3;
- (void)setInfo:(id)a3;
- (void)setInfoAtStartup:(id)a3;
- (void)setInfoChangeQueue:(id)a3;
@end

@implementation StartupRegisterManager

+ (id)sharedInstance
{
  if (qword_10006D610 != -1) {
    dispatch_once(&qword_10006D610, &stru_10005A3A0);
  }
  v2 = (void *)qword_10006D608;

  return v2;
}

- (StartupRegisterManager)init
{
  v3 = +[FMPreferencesUtil objectForKey:@"startupRegisterInfo" inDomain:@"com.apple.icloud.fmflocatord.notbackedup"];
  v4 = [(StartupRegisterManager *)self initWithDict:v3];

  return v4;
}

- (StartupRegisterManager)initWithDict:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)StartupRegisterManager;
  v5 = [(StartupRegisterManager *)&v13 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.icloud.fmflocatord.startup_reg.mod_queue", v6);
    [(StartupRegisterManager *)v5 setInfoChangeQueue:v7];

    if (v4)
    {
      id v8 = [v4 mutableCopy];
    }
    else
    {
      id v8 = +[NSMutableDictionary dictionary];
    }
    v9 = v8;
    [(StartupRegisterManager *)v5 setInfo:v8];

    v10 = [(StartupRegisterManager *)v5 info];
    id v11 = [v10 copy];
    [(StartupRegisterManager *)v5 setInfoAtStartup:v11];
  }
  return v5;
}

- (id)infoDictForTesting
{
  v2 = [(StartupRegisterManager *)self info];
  id v3 = [v2 copy];

  return v3;
}

- (BOOL)shouldForceRegisterOnStartup
{
  v2 = self;
  uint64_t v6 = 0;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(StartupRegisterManager *)self infoChangeQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000237E4;
  v5[3] = &unk_10005A3C8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)eventDidOccur:(int64_t)a3
{
  v5 = sub_10001B6D4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [(StartupRegisterManager *)self fm_logID];
    dispatch_queue_t v7 = [(StartupRegisterManager *)self _descriptionForEvent:a3];
    int v12 = 138412546;
    objc_super v13 = v6;
    __int16 v14 = 2112;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@ Event occurred : %@", (uint8_t *)&v12, 0x16u);
  }
  switch(a3)
  {
    case 0:
    case 1:
      [(StartupRegisterManager *)self _clearAllInfo];
      return;
    case 2:
    case 4:
      +[NSDate timeIntervalSinceReferenceDate];
      uint64_t v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      CFStringRef v9 = @"qcPendingEpoch";
      goto LABEL_12;
    case 3:
    case 6:
      [(StartupRegisterManager *)self _clearQCPendingEpoch];
      return;
    case 5:
      +[NSDate timeIntervalSinceReferenceDate];
      v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [(StartupRegisterManager *)self _setInfo:v10 forKey:@"qcPendingEpoch"];

      goto LABEL_9;
    case 7:
      [(StartupRegisterManager *)self _clearQCPendingEpoch];
LABEL_9:
      +[NSDate timeIntervalSinceReferenceDate];
      uint64_t v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      CFStringRef v9 = @"commandPendingEpoch";
      goto LABEL_12;
    case 8:
      CFStringRef v11 = @"commandPendingEpoch";
      goto LABEL_14;
    case 9:
      +[NSDate timeIntervalSinceReferenceDate];
      uint64_t v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      CFStringRef v9 = @"ackPendingEpoch";
LABEL_12:
      [(StartupRegisterManager *)self _setInfo:v8 forKey:v9];

      break;
    case 10:
      CFStringRef v11 = @"ackPendingEpoch";
LABEL_14:
      [(StartupRegisterManager *)self _removeInfoForKey:v11];
      break;
    default:
      return;
  }
}

- (id)description
{
  id v3 = [(StartupRegisterManager *)self fm_logID];
  id v4 = [(StartupRegisterManager *)self info];
  v5 = [v4 description];
  uint64_t v6 = +[NSString stringWithFormat:@"%@: %@", v3, v5];

  return v6;
}

- (void)_clearQCPendingEpoch
{
  id v3 = [(StartupRegisterManager *)self infoChangeQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023BD8;
  block[3] = &unk_100059350;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)_clearAllInfo
{
  id v3 = [(StartupRegisterManager *)self infoChangeQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023E34;
  block[3] = &unk_100059350;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)_setInfo:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(StartupRegisterManager *)self infoChangeQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023F64;
  block[3] = &unk_10005A3F0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

- (void)_removeInfoForKey:(id)a3
{
  id v4 = a3;
  v5 = [(StartupRegisterManager *)self infoChangeQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100024068;
  v7[3] = &unk_100059780;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)_saveInfo
{
  if (![(StartupRegisterManager *)self inTestingMode])
  {
    id v3 = [(StartupRegisterManager *)self info];
    +[FMPreferencesUtil setObject:v3 forKey:@"startupRegisterInfo" inDomain:@"com.apple.icloud.fmflocatord.notbackedup"];
  }
}

- (id)_descriptionForEvent:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 9) {
    return @"AccountAdded";
  }
  else {
    return off_10005A410[a3 - 1];
  }
}

- (NSDictionary)infoAtStartup
{
  return self->_infoAtStartup;
}

- (void)setInfoAtStartup:(id)a3
{
}

- (NSMutableDictionary)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
}

- (OS_dispatch_queue)infoChangeQueue
{
  return self->_infoChangeQueue;
}

- (void)setInfoChangeQueue:(id)a3
{
}

- (BOOL)inTestingMode
{
  return self->_inTestingMode;
}

- (void)setInTestingMode:(BOOL)a3
{
  self->_inTestingMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoChangeQueue, 0);
  objc_storeStrong((id *)&self->_info, 0);

  objc_storeStrong((id *)&self->_infoAtStartup, 0);
}

@end