@interface FMDDetachNotificationManager
+ (BOOL)supportsSecureCoding;
+ (id)defaultStorageLocation;
- (FMDAccessoryLocationStore)locationStore;
- (FMDDetachNotificationManager)init;
- (FMDDetachNotificationManager)initWithCoder:(id)a3;
- (FMDSupportedAccessoryRegistry)supportedAccessoryRegistry;
- (FMDataArchiver)dataArchiver;
- (NSDictionary)notificationIdbyAccessoryIds;
- (NSSet)notifyWhenDetachedAccessoryIds;
- (NSString)notifWhenDetachedListVersion;
- (OS_dispatch_queue)serialQueue;
- (id)_writeToDisk;
- (void)_loadFromDisk;
- (void)accessoryDidConnect:(id)a3;
- (void)accessoryDidDisconnect:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)getLocationFor:(id)a3 withCompletion:(id)a4;
- (void)setDataArchiver:(id)a3;
- (void)setLocationStore:(id)a3;
- (void)setNotifWhenDetachedListVersion:(id)a3;
- (void)setNotificationIdbyAccessoryIds:(id)a3;
- (void)setNotifyWhenDetachedAccessoryIds:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setSupportedAccessoryRegistry:(id)a3;
- (void)updateAccessoryIds:(id)a3 version:(id)a4 withCompletion:(id)a5;
@end

@implementation FMDDetachNotificationManager

+ (id)defaultStorageLocation
{
  id v2 = objc_alloc((Class)FMSharedFileContainer);
  id v3 = [v2 initWithIdentifier:off_10031CBE0];
  v4 = [v3 url];
  v5 = [v4 fm_preferencesPathURLForDomain:@"FMDDetachNotificationManager"];

  return v5;
}

- (FMDDetachNotificationManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)FMDDetachNotificationManager;
  id v2 = [(FMDDetachNotificationManager *)&v11 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("FMDDetachNotificationManager.serialQueue", 0);
    [(FMDDetachNotificationManager *)v2 setSerialQueue:v3];

    id v4 = objc_alloc((Class)FMDataArchiver);
    v5 = [(id)objc_opt_class() defaultStorageLocation];
    id v6 = [v4 initWithFileURL:v5];
    [(FMDDetachNotificationManager *)v2 setDataArchiver:v6];

    v7 = [(FMDDetachNotificationManager *)v2 dataArchiver];
    [v7 setDataProtectionClass:4];

    v8 = [(FMDDetachNotificationManager *)v2 dataArchiver];
    [v8 setBackedUp:0];

    v9 = [(FMDDetachNotificationManager *)v2 dataArchiver];
    [v9 setCreateDirectories:1];

    [(FMDDetachNotificationManager *)v2 _loadFromDisk];
  }
  return v2;
}

- (void)updateAccessoryIds:(id)a3 version:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = [(FMDDetachNotificationManager *)self serialQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000A1FD0;
  v15[3] = &unk_1002DCA08;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)_loadFromDisk
{
  dispatch_queue_t v3 = [(FMDDetachNotificationManager *)self dataArchiver];
  id v4 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
  id v18 = 0;
  v5 = [v3 readArrayAndClasses:v4 error:&v18];
  id v6 = v18;

  if ((objc_msgSend(v6, "fm_isFileNotFoundError") & 1) != 0 || (v5 ? (BOOL v7 = v6 == 0) : (BOOL v7 = 0), v7))
  {
    id v10 = [v5 firstObject];
    objc_super v11 = [v10 notifWhenDetachedListVersion];
    [(FMDDetachNotificationManager *)self setNotifWhenDetachedListVersion:v11];

    id v12 = [v10 notifyWhenDetachedAccessoryIds];
    [(FMDDetachNotificationManager *)self setNotifyWhenDetachedAccessoryIds:v12];

    id v13 = [v10 notificationIdbyAccessoryIds];
    [(FMDDetachNotificationManager *)self setNotificationIdbyAccessoryIds:v13];

    id v14 = sub_100059878();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [v10 notifWhenDetachedListVersion];
      id v16 = [v10 notifyWhenDetachedAccessoryIds];
      id v17 = [v16 count];
      *(_DWORD *)buf = 138412802;
      v20 = v10;
      __int16 v21 = 2112;
      v22 = v15;
      __int16 v23 = 2048;
      id v24 = v17;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Notification manager %@ loaded version = %@ accessories count = %lu", buf, 0x20u);
    }
  }
  else
  {

    [(FMDDetachNotificationManager *)self setNotifWhenDetachedListVersion:@"0"];
    id v8 = objc_alloc_init((Class)NSSet);
    [(FMDDetachNotificationManager *)self setNotifyWhenDetachedAccessoryIds:v8];

    id v9 = objc_alloc_init((Class)NSDictionary);
    [(FMDDetachNotificationManager *)self setNotificationIdbyAccessoryIds:v9];

    id v10 = sub_100004238();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100242338((uint64_t)v6, v10);
    }
    v5 = &__NSArray0__struct;
  }
}

- (id)_writeToDisk
{
  dispatch_queue_t v3 = [(FMDDetachNotificationManager *)self dataArchiver];
  BOOL v7 = self;
  id v4 = +[NSArray arrayWithObjects:&v7 count:1];
  v5 = [v3 saveArray:v4];

  return v5;
}

- (void)getLocationFor:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void *))a4;
  id v8 = [(FMDDetachNotificationManager *)self locationStore];
  id v9 = [v8 historicalLocationForAccessory:v6];
  id v10 = v9;
  if (v9
    && ([v9 timeStamp],
        objc_super v11 = objc_claimAutoreleasedReturnValue(),
        [v11 timeIntervalSinceNow],
        double v13 = fabs(v12),
        v11,
        v13 <= 1.0))
  {
    id v17 = sub_100004238();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "using old location %@", buf, 0xCu);
    }

    v7[2](v7, v10);
  }
  else
  {
    id v14 = sub_100004238();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "fetching new location", buf, 2u);
    }

    v15 = [(FMDDetachNotificationManager *)self supportedAccessoryRegistry];
    id v16 = [v15 locatorForAccessory:v6];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000A2774;
    v18[3] = &unk_1002DC3D8;
    v19 = v7;
    [v8 retreiveLocationForAccessory:v6 forEvent:2 locator:v16 completion:v18];
  }
}

- (void)accessoryDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = [v4 accessoryIdentifier];
  id v6 = [v5 stringValue];

  BOOL v7 = [(FMDDetachNotificationManager *)self notifyWhenDetachedAccessoryIds];
  if ([v7 containsObject:v6])
  {
  }
  else
  {
    id v8 = +[FMPreferencesUtil stringForKey:@"notificationAccessoryId" inDomain:kFMDNotBackedUpPrefDomain];
    unsigned int v9 = [v6 isEqualToString:v8];

    if (!v9) {
      goto LABEL_9;
    }
  }
  id v10 = sub_100004238();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v11 = [v4 name];
    *(_DWORD *)buf = 138412290;
    v30 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "FMDDetachNotificationManager: Accessory %@ disconnected postig notificaiton", buf, 0xCu);
  }
  double v12 = +[NSDate now];
  id v13 = objc_alloc((Class)NSMutableDictionary);
  id v14 = [(FMDDetachNotificationManager *)self notificationIdbyAccessoryIds];
  id v15 = [v13 initWithDictionary:v14];

  id v16 = +[NSUUID UUID];
  id v17 = [v16 UUIDString];

  [v15 setObject:v17 forKeyedSubscript:v6];
  [(FMDDetachNotificationManager *)self setNotificationIdbyAccessoryIds:v15];
  id v18 = sub_100004238();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v12;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "FMDDetachNotificationManager: Accessory disconnected %@", buf, 0xCu);
  }

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000A2B34;
  v22[3] = &unk_1002DCA80;
  id v23 = v12;
  id v24 = v4;
  v25 = self;
  id v26 = v6;
  id v27 = v17;
  id v28 = v15;
  id v19 = v15;
  id v20 = v17;
  id v21 = v12;
  [(FMDDetachNotificationManager *)self getLocationFor:v24 withCompletion:v22];

LABEL_9:
}

- (void)accessoryDidConnect:(id)a3
{
  id v4 = a3;
  v5 = [v4 accessoryIdentifier];
  id v6 = [v5 stringValue];

  BOOL v7 = [(FMDDetachNotificationManager *)self notificationIdbyAccessoryIds];
  id v8 = [v7 objectForKeyedSubscript:v6];

  if (v8)
  {
    unsigned int v9 = sub_100004238();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v4 name];
      int v15 = 138412290;
      id v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FMDDetachNotificationManager: removing notificaiton for %@", (uint8_t *)&v15, 0xCu);
    }
    id v11 = objc_alloc((Class)NSMutableDictionary);
    double v12 = [(FMDDetachNotificationManager *)self notificationIdbyAccessoryIds];
    id v13 = [v11 initWithDictionary:v12];

    [v13 setObject:0 forKeyedSubscript:v6];
    [(FMDDetachNotificationManager *)self setNotificationIdbyAccessoryIds:v13];
    id v14 = +[FMDFMIPManager sharedInstance];
    [v14 removeNotificationWithIdentifier:v8 completion:&stru_1002DCAA0];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(FMDDetachNotificationManager *)self notifyWhenDetachedAccessoryIds];
  [v4 encodeObject:v5 forKey:@"notifyWhenDetachedAccessoryIds"];

  id v6 = [(FMDDetachNotificationManager *)self notifWhenDetachedListVersion];
  [v4 encodeObject:v6 forKey:@"notifWhenDetachListVersion"];

  id v7 = [(FMDDetachNotificationManager *)self notificationIdbyAccessoryIds];
  [v4 encodeObject:v7 forKey:@"notificationIdbyAccessoryIds"];
}

- (FMDDetachNotificationManager)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FMDDetachNotificationManager;
  v5 = [(FMDDetachNotificationManager *)&v16 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    id v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"notifyWhenDetachedAccessoryIds"];
    notifyWhenDetachedAccessoryIds = v5->_notifyWhenDetachedAccessoryIds;
    v5->_notifyWhenDetachedAccessoryIds = (NSSet *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"notifWhenDetachListVersion"];
    notifWhenDetachedListVersion = v5->_notifWhenDetachedListVersion;
    v5->_notifWhenDetachedListVersion = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClasses:v8 forKey:@"notificationIdbyAccessoryIds"];
    notificationIdbyAccessoryIds = v5->_notificationIdbyAccessoryIds;
    v5->_notificationIdbyAccessoryIds = (NSDictionary *)v13;
  }
  return v5;
}

- (FMDAccessoryLocationStore)locationStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_locationStore);

  return (FMDAccessoryLocationStore *)WeakRetained;
}

- (void)setLocationStore:(id)a3
{
}

- (NSString)notifWhenDetachedListVersion
{
  return self->_notifWhenDetachedListVersion;
}

- (void)setNotifWhenDetachedListVersion:(id)a3
{
}

- (FMDSupportedAccessoryRegistry)supportedAccessoryRegistry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_supportedAccessoryRegistry);

  return (FMDSupportedAccessoryRegistry *)WeakRetained;
}

- (void)setSupportedAccessoryRegistry:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (FMDataArchiver)dataArchiver
{
  return self->_dataArchiver;
}

- (void)setDataArchiver:(id)a3
{
}

- (NSSet)notifyWhenDetachedAccessoryIds
{
  return self->_notifyWhenDetachedAccessoryIds;
}

- (void)setNotifyWhenDetachedAccessoryIds:(id)a3
{
}

- (NSDictionary)notificationIdbyAccessoryIds
{
  return self->_notificationIdbyAccessoryIds;
}

- (void)setNotificationIdbyAccessoryIds:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationIdbyAccessoryIds, 0);
  objc_storeStrong((id *)&self->_notifyWhenDetachedAccessoryIds, 0);
  objc_storeStrong((id *)&self->_dataArchiver, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_destroyWeak((id *)&self->_supportedAccessoryRegistry);
  objc_storeStrong((id *)&self->_notifWhenDetachedListVersion, 0);

  objc_destroyWeak((id *)&self->_locationStore);
}

@end