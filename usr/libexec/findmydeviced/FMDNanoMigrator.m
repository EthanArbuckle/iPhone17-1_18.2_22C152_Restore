@interface FMDNanoMigrator
- (FMDCompanionRegistry)registry;
- (FMDNanoMigrator)initWithCompanionRegistry:(id)a3 unregisterTokenStore:(id)a4 serverInteractionController:(id)a5;
- (FMDServerInteractionController)serverInteractionController;
- (FMDUnregisterTokenStore)unregisterTokenStore;
- (FMDXPCJanitor)janitor;
- (id)deviceInfoForHostDevice;
- (id)lastScheduledJanitorDate;
- (id)unregisterDeviceInfoAdaptors;
- (void)addObservers;
- (void)scheduleJanitor:(double)a3;
- (void)setJanitor:(id)a3;
- (void)setJanitorScheduledDate:(id)a3;
- (void)setRegistry:(id)a3;
- (void)setServerInteractionController:(id)a3;
- (void)setUnregisterTokenStore:(id)a3;
- (void)unregisterAccessoriesIfNeeded;
@end

@implementation FMDNanoMigrator

- (FMDNanoMigrator)initWithCompanionRegistry:(id)a3 unregisterTokenStore:(id)a4 serverInteractionController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)FMDNanoMigrator;
  v11 = [(FMDNanoMigrator *)&v26 init];
  v12 = v11;
  if (v11)
  {
    [(FMDNanoMigrator *)v11 setRegistry:v8];
    [(FMDNanoMigrator *)v12 setUnregisterTokenStore:v9];
    [(FMDNanoMigrator *)v12 setServerInteractionController:v10];
    [(FMDNanoMigrator *)v12 addObservers];
    objc_initWeak(&location, v12);
    v13 = +[FMSystemInfo sharedInstance];
    unsigned int v14 = [v13 isInternalBuild];

    if (v14)
    {
      id v15 = +[FMPreferencesUtil integerForKey:@"NanoMigratorRetryInterval" inDomain:kFMDNotBackedUpPrefDomain];
      if ((uint64_t)v15 <= 0) {
        double v16 = 10800.0;
      }
      else {
        double v16 = (double)(uint64_t)v15;
      }
    }
    else
    {
      double v16 = 10800.0;
    }
    v17 = [FMDXPCJanitor alloc];
    v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    v22 = sub_100057C0C;
    v23 = &unk_1002D93C8;
    objc_copyWeak(&v24, &location);
    v18 = [(FMDXPCJanitor *)v17 initWithName:@"FMDNanoMigratorJanitor" gracePeriod:&v20 cleanupTask:v16];
    -[FMDNanoMigrator setJanitor:](v12, "setJanitor:", v18, v20, v21, v22, v23);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (void)unregisterAccessoriesIfNeeded
{
  v3 = +[FMSystemInfo sharedInstance];
  unsigned int v4 = [v3 isInternalBuild];

  if (v4)
  {
    id v5 = +[FMPreferencesUtil integerForKey:@"NanoMigratorRetryInterval" inDomain:kFMDNotBackedUpPrefDomain];
    if ((uint64_t)v5 <= 0) {
      double v6 = 3600.0;
    }
    else {
      double v6 = (double)(uint64_t)v5;
    }
  }
  else
  {
    double v6 = 3600.0;
  }
  [(FMDNanoMigrator *)self scheduleJanitor:v6];
  v7 = [(FMDNanoMigrator *)self unregisterDeviceInfoAdaptors];
  id v8 = [v7 count];
  if (v8)
  {
    id v9 = v8;
    id v10 = sub_100004238();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "FMDNanoMigrator will attempt to unregister %li", buf, 0xCu);
    }

    v11 = sub_100059DD0();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Watch Migration: Unregister device count %li", buf, 0xCu);
    }

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100057F7C;
    v14[3] = &unk_1002DB448;
    v14[4] = self;
    *(double *)&v14[5] = v6;
    [v7 enumerateObjectsUsingBlock:v14];
  }
  else
  {
    v12 = sub_100059DD0();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Watch Migration: There were no devices or no tokens to unregister.", buf, 2u);
    }

    v13 = sub_100004238();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "FMDNanoMigrator there were no devices or no tokens to unregister.", buf, 2u);
    }
  }
}

- (void)addObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"deviceDidPair:" name:@"nano.devicedidpair" object:0];
}

- (void)scheduleJanitor:(double)a3
{
  id v5 = [(FMDNanoMigrator *)self unregisterTokenStore];
  unsigned int v6 = [v5 accessoriesNeedUnregister];

  if (a3 <= 0.0 || v6 == 0)
  {
    id v8 = sub_100004238();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FMDNanoMigrator deactivating janitor", (uint8_t *)&v22, 2u);
    }

    id v9 = sub_100059DD0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Watch Migration: deactivating janitor", (uint8_t *)&v22, 2u);
    }

    [(FMDNanoMigrator *)self setJanitorScheduledDate:0];
    id v10 = [(FMDNanoMigrator *)self janitor];
    [v10 deactivate];
  }
  else
  {
    id v10 = [(FMDNanoMigrator *)self lastScheduledJanitorDate];
    [v10 timeIntervalSinceReferenceDate];
    double v12 = v11;
    v13 = +[NSDate date];
    [v13 timeIntervalSinceReferenceDate];
    double v15 = v12 - v14;

    id v16 = v10;
    if (v15 < 60.0)
    {
      v17 = sub_100004238();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "FMDNanoMigrator The last scheduled time is too short, rescheduling.", (uint8_t *)&v22, 2u);
      }

      id v16 = +[NSDate dateWithTimeIntervalSinceNow:a3];
    }
    v18 = sub_100004238();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412290;
      id v23 = v16;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "FMDNanoMigrator scheduling janitor to run %@", (uint8_t *)&v22, 0xCu);
    }

    v19 = sub_100059DD0();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = [v16 fm_epoch];
      int v22 = 134217984;
      id v23 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Watch Migration: scheduling janitor to run %lli", (uint8_t *)&v22, 0xCu);
    }

    [(FMDNanoMigrator *)self setJanitorScheduledDate:v16];
    uint64_t v21 = [(FMDNanoMigrator *)self janitor];
    [v21 schedule:v16 requireClass:1];
  }
}

- (id)deviceInfoForHostDevice
{
  v2 = objc_alloc_init(FMDFMIPUnregisterDeviceInfo);
  id v3 = +[FMDSystemConfig sharedInstance];
  unsigned int v4 = [v3 deviceUDID];
  [(FMDFMIPUnregisterDeviceInfo *)v2 setUdid:v4];

  id v5 = +[FMDSystemConfig sharedInstance];
  unsigned int v6 = [v5 internationalMobileEquipmentIdentity];
  [(FMDFMIPUnregisterDeviceInfo *)v2 setImei:v6];

  v7 = +[FMDSystemConfig sharedInstance];
  id v8 = [v7 mobileEquipmentIdentifier];
  [(FMDFMIPUnregisterDeviceInfo *)v2 setMeid:v8];

  id v9 = +[FMDSystemConfig sharedInstance];
  id v10 = [v9 serialNumber];
  [(FMDFMIPUnregisterDeviceInfo *)v2 setSerialNumber:v10];

  double v11 = +[FMDSystemConfig sharedInstance];
  double v12 = [v11 productType];
  [(FMDFMIPUnregisterDeviceInfo *)v2 setProductType:v12];

  v13 = +[FMDSystemConfig sharedInstance];
  double v14 = [v13 productVersion];
  [(FMDFMIPUnregisterDeviceInfo *)v2 setProductVersion:v14];

  double v15 = +[FMDSystemConfig sharedInstance];
  id v16 = [v15 buildVersion];
  [(FMDFMIPUnregisterDeviceInfo *)v2 setBuildVersion:v16];

  [(FMDFMIPUnregisterDeviceInfo *)v2 setDisableContext:7];

  return v2;
}

- (id)unregisterDeviceInfoAdaptors
{
  id v3 = +[NSMutableArray array];
  unsigned int v4 = [(FMDNanoMigrator *)self registry];
  id v5 = [v4 pairedAccessories];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100058BFC;
  v10[3] = &unk_1002DB470;
  v10[4] = self;
  id v6 = v3;
  id v11 = v6;
  [v5 enumerateObjectsUsingBlock:v10];
  v7 = v11;
  id v8 = v6;

  return v8;
}

- (id)lastScheduledJanitorDate
{
  v2 = +[FMDProtectedContextManager sharedManager];
  id v3 = [v2 contextForKey:@"FMDNanoMigratorLastScheduledJanitorDateKey" contextUUID:0 error:0];

  return v3;
}

- (void)setJanitorScheduledDate:(id)a3
{
  id v6 = a3;
  id v3 = +[FMDProtectedContextManager sharedManager];
  unsigned int v4 = v3;
  if (v6) {
    id v5 = [v3 saveContext:v6 forContextKey:@"FMDNanoMigratorLastScheduledJanitorDateKey" dataProtectionClass:4];
  }
  else {
    [v3 cleanupAllContextsForKey:@"FMDNanoMigratorLastScheduledJanitorDateKey"];
  }
}

- (FMDCompanionRegistry)registry
{
  return self->_registry;
}

- (void)setRegistry:(id)a3
{
}

- (FMDUnregisterTokenStore)unregisterTokenStore
{
  return self->_unregisterTokenStore;
}

- (void)setUnregisterTokenStore:(id)a3
{
}

- (FMDServerInteractionController)serverInteractionController
{
  return self->_serverInteractionController;
}

- (void)setServerInteractionController:(id)a3
{
}

- (FMDXPCJanitor)janitor
{
  return self->_janitor;
}

- (void)setJanitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_janitor, 0);
  objc_storeStrong((id *)&self->_serverInteractionController, 0);
  objc_storeStrong((id *)&self->_unregisterTokenStore, 0);

  objc_storeStrong((id *)&self->_registry, 0);
}

@end