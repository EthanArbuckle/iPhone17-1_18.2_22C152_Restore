@interface FMDAccessoryLocationStore
+ (id)defaultStorageLocation;
- (BOOL)canRetrieveLockedRecords;
- (BOOL)shouldRetrieveLocationForAccessory:(id)a3;
- (FMDAccessoryLocationStore)init;
- (FMDAccessoryLocationStore)initWithSupportedAccessoryRegistry:(id)a3 accessoryRegistry:(id)a4;
- (FMDAccessoryRegistry)accessoryRegistry;
- (FMDSupportedAccessoryRegistry)supportedAccessoryRegistry;
- (FMDXPCJanitor)janitor;
- (FMDataArchiver)dataArchiver;
- (FMStateCapture)stateCapture;
- (NSDate)nextScheduledJanitorDate;
- (NSDictionary)recordsByAccessoryIdentifier;
- (OS_dispatch_queue)serialQueue;
- (id)contextKeyForAccessory:(id)a3 protectionClass:(int64_t)a4;
- (id)historicalLocationForAccessory:(id)a3;
- (id)saveLocationToDisk:(id)a3 accessory:(id)a4 protection:(unint64_t)a5;
- (void)accessoryDidDisconnect:(id)a3;
- (void)accessoryDidUnpair:(id)a3;
- (void)clearAccessoryLocationStore;
- (void)clearAllRecords;
- (void)expungeAccessoryLocationStore;
- (void)expungeRecordsForAccessory:(id)a3 allRecords:(BOOL)a4;
- (void)locationForAccessory:(id)a3 locator:(id)a4 completion:(id)a5;
- (void)readLocationsFromDisk;
- (void)removeOrphanedLocationFiles;
- (void)retreiveLocationForAccessory:(id)a3 forEvent:(int64_t)a4 locator:(id)a5 completion:(id)a6;
- (void)saveLocation:(id)a3 forAccessory:(id)a4;
- (void)scheduleJanitor:(id)a3;
- (void)setAccessoryRegistry:(id)a3;
- (void)setDataArchiver:(id)a3;
- (void)setJanitor:(id)a3;
- (void)setNextScheduledJanitorDate:(id)a3;
- (void)setRecordsByAccessoryIdentifier:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setStateCapture:(id)a3;
- (void)setSupportedAccessoryRegistry:(id)a3;
- (void)setup;
@end

@implementation FMDAccessoryLocationStore

+ (id)defaultStorageLocation
{
  id v2 = objc_alloc_init((Class)FMInternalFileContainer);
  v3 = [v2 url];
  v4 = [v3 fm_preferencesPathURLForDomain:@"com.apple.icloud.findmydeviced.accessories.locations"];

  return v4;
}

- (FMDAccessoryLocationStore)init
{
  v5.receiver = self;
  v5.super_class = (Class)FMDAccessoryLocationStore;
  id v2 = [(FMDAccessoryLocationStore *)&v5 init];
  v3 = v2;
  if (v2) {
    [(FMDAccessoryLocationStore *)v2 setup];
  }
  return v3;
}

- (FMDAccessoryLocationStore)initWithSupportedAccessoryRegistry:(id)a3 accessoryRegistry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FMDAccessoryLocationStore;
  v8 = [(FMDAccessoryLocationStore *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(FMDAccessoryLocationStore *)v8 setSupportedAccessoryRegistry:v6];
    [(FMDAccessoryLocationStore *)v9 setAccessoryRegistry:v7];
    [(FMDAccessoryLocationStore *)v9 setup];
  }

  return v9;
}

- (void)setup
{
  id v3 = objc_alloc((Class)FMDataArchiver);
  v4 = [(id)objc_opt_class() defaultStorageLocation];
  id v5 = [v3 initWithFileURL:v4];
  [(FMDAccessoryLocationStore *)self setDataArchiver:v5];

  id v6 = [(FMDAccessoryLocationStore *)self dataArchiver];
  [v6 setDataProtectionClass:4];

  id v7 = [(FMDAccessoryLocationStore *)self dataArchiver];
  [v7 setBackedUp:0];

  v8 = [(FMDAccessoryLocationStore *)self dataArchiver];
  [v8 setCreateDirectories:1];

  dispatch_queue_t v9 = dispatch_queue_create("FMDAccessoryLocationStoreSerialQueue", 0);
  [(FMDAccessoryLocationStore *)self setSerialQueue:v9];

  [(FMDAccessoryLocationStore *)self readLocationsFromDisk];
  objc_initWeak(&location, self);
  v10 = [FMDXPCJanitor alloc];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10008BC78;
  v18[3] = &unk_1002D93C8;
  objc_copyWeak(&v19, &location);
  objc_super v11 = [(FMDXPCJanitor *)v10 initWithName:@"FMDAccessoryLocationStoreJanitor" gracePeriod:v18 cleanupTask:10800.0];
  [(FMDAccessoryLocationStore *)self setJanitor:v11];

  v12 = +[FMDSystemConfig sharedInstance];
  unsigned __int8 v13 = [v12 isLocationServicesEnabled];

  if (v13) {
    [(FMDAccessoryLocationStore *)self expungeAccessoryLocationStore];
  }
  else {
    [(FMDAccessoryLocationStore *)self clearAccessoryLocationStore];
  }
  id v14 = objc_alloc_init((Class)FMStateCapture);
  [(FMDAccessoryLocationStore *)self setStateCapture:v14];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10008BD7C;
  v16[3] = &unk_1002DC3B0;
  objc_copyWeak(&v17, &location);
  v15 = [(FMDAccessoryLocationStore *)self stateCapture];
  [v15 setStateCaptureBlock:v16];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)locationForAccessory:(id)a3 locator:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void *, void))a5;
  objc_super v11 = [(FMDAccessoryLocationStore *)self historicalLocationForAccessory:v8];
  if (v10) {
    v10[2](v10, v11, 0);
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10008C1E0;
  v13[3] = &unk_1002DC3D8;
  id v14 = v10;
  v12 = v10;
  [(FMDAccessoryLocationStore *)self retreiveLocationForAccessory:v8 forEvent:3 locator:v9 completion:v13];
}

- (id)historicalLocationForAccessory:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  unsigned __int8 v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_10008BF24;
  v16 = sub_10008BF34;
  id v17 = 0;
  id v5 = [(FMDAccessoryLocationStore *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008C3F4;
  block[3] = &unk_1002D9508;
  block[4] = self;
  id v10 = v4;
  objc_super v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)clearAccessoryLocationStore
{
  id v3 = [(FMDAccessoryLocationStore *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008C860;
  block[3] = &unk_1002D9378;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)expungeAccessoryLocationStore
{
  objc_initWeak(&location, self);
  id v3 = [(FMDAccessoryLocationStore *)self accessoryRegistry];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10008CA2C;
  v4[3] = &unk_1002DC468;
  v4[4] = self;
  objc_copyWeak(&v5, &location);
  [v3 accessories:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)removeOrphanedLocationFiles
{
  id v3 = sub_100004238();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "AccessoryLocationStore checking for orphaned files", buf, 2u);
  }

  id v4 = [(FMDAccessoryLocationStore *)self recordsByAccessoryIdentifier];
  id v5 = [v4 allValues];

  +[NSMutableSet set];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10008CE58;
  v15[3] = &unk_1002DC490;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = v6;
  [v5 enumerateObjectsUsingBlock:v15];
  id v7 = sub_100004238();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 count];
    *(_DWORD *)buf = 134217984;
    id v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "AccessoryLocationStore found %lu active location records", buf, 0xCu);
  }

  id v9 = +[FMDProtectedContextManager sharedManager];
  id v10 = [v9 contextKeysForType:@"AccessoryLocation" enumerationOption:1];

  objc_super v11 = [v10 allObjects];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10008CF3C;
  v13[3] = &unk_1002D9968;
  id v14 = v6;
  id v12 = v6;
  [v11 enumerateObjectsUsingBlock:v13];
}

- (void)retreiveLocationForAccessory:(id)a3 forEvent:(int64_t)a4 locator:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  unsigned __int8 v13 = sub_100004238();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "FMDAccessoryLocationStore retreiveLocationForAccessory %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v14 = [AccessoryCurrentLocationAction alloc];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10008D1F8;
  v21[3] = &unk_1002DC4B8;
  objc_copyWeak(&v24, (id *)buf);
  id v15 = v10;
  id v22 = v15;
  id v16 = v12;
  id v23 = v16;
  id v17 = [(AccessoryCurrentLocationAction *)v14 initWithAccessory:v15 locator:v11 event:a4 completion:v21];
  id v18 = [(FMDAccessoryLocationStore *)self accessoryRegistry];
  [v18 registerDelegate:v17];

  id v19 = +[ActionManager sharedManager];
  id v20 = [v19 enqueueAction:v17];

  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)buf);
}

- (BOOL)shouldRetrieveLocationForAccessory:(id)a3
{
  id v4 = a3;
  id v5 = [(FMDAccessoryLocationStore *)self historicalLocationForAccessory:v4];
  if (v5)
  {
    id v6 = [(FMDAccessoryLocationStore *)self supportedAccessoryRegistry];
    id v7 = [v5 location];
    id v8 = [v7 speed];
    [v8 doubleValue];
    [v6 locationThrottleTimeIntervalForAccessory:v4];
    double v10 = v9;

    id v11 = [v5 timeStamp];
    id v12 = [v11 dateByAddingTimeInterval:v10];

    if (v12)
    {
      unsigned __int8 v13 = sub_100004238();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        [v12 timeIntervalSinceNow];
        int v21 = 134217984;
        id v22 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "AccessoryLocationStore next allowed locate cycle in %f", (uint8_t *)&v21, 0xCu);
      }

      +[NSDate timeIntervalSinceReferenceDate];
      double v16 = v15;
      [v12 timeIntervalSinceReferenceDate];
      BOOL v18 = v16 > v17;
    }
    else
    {
      BOOL v18 = 0;
    }
  }
  else
  {
    BOOL v18 = 1;
  }
  id v19 = sub_100004238();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412546;
    id v22 = v4;
    __int16 v23 = 1024;
    BOOL v24 = v18;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "AccessoryLocationStore : Retrieve a location for accessory %@? %i", (uint8_t *)&v21, 0x12u);
  }

  return v18;
}

- (void)saveLocation:(id)a3 forAccessory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    objc_initWeak(location, self);
    id v8 = [(FMDAccessoryLocationStore *)self serialQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10008D5C0;
    block[3] = &unk_1002DA298;
    objc_copyWeak(&v13, location);
    id v11 = v7;
    id v12 = v6;
    dispatch_async(v8, block);

    objc_destroyWeak(&v13);
    objc_destroyWeak(location);
  }
  else
  {
    double v9 = sub_100004238();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Trying to save nil location to location store.", (uint8_t *)location, 2u);
    }
  }
}

- (id)saveLocationToDisk:(id)a3 accessory:(id)a4 protection:(unint64_t)a5
{
  id v8 = a4;
  unint64_t v30 = a5;
  if (a5 == 1) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 3;
  }
  id v10 = a3;
  id v11 = [(FMDAccessoryLocationStore *)self contextKeyForAccessory:v8 protectionClass:v9];
  id v12 = [(FMDAccessoryLocationStore *)self recordsByAccessoryIdentifier];
  id v13 = [v12 mutableCopy];

  id v14 = [v8 accessoryIdentifier];
  double v15 = [v13 objectForKeyedSubscript:v14];
  id v16 = [v15 mutableCopy];

  double v17 = +[NSPredicate predicateWithFormat:@"SELF.recordName contains[cd] %@", v11];
  BOOL v18 = [v16 filteredArrayUsingPredicate:v17];

  if (v18)
  {
    [v16 removeObjectsInArray:v18];
    id v19 = [v8 accessoryIdentifier];
    [v13 setObject:v16 forKeyedSubscript:v19];

    [(FMDAccessoryLocationStore *)self setRecordsByAccessoryIdentifier:v13];
  }
  id v20 = +[FMDProtectedContextManager sharedManager];
  [v20 cleanupContextsForKey:v11 contextUUID:0];

  if (+[FMDProtectedContext isUnittest]) {
    uint64_t v21 = 4;
  }
  else {
    uint64_t v21 = v9;
  }
  id v22 = +[FMDProtectedContextManager sharedManager];
  __int16 v23 = [v10 dictionaryValue];

  BOOL v24 = [v22 saveContext:v23 forContextKey:v11 dataProtectionClass:v21];

  v25 = sub_100004238();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v32 = v11;
    __int16 v33 = 2048;
    uint64_t v34 = v9;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "AccessoryLocationStore Saving location to disk %@ protection %li", buf, 0x16u);
  }

  id v26 = [FMDAccessoryLocationStoreRecord alloc];
  v27 = +[NSDate date];
  v28 = [(FMDAccessoryLocationStoreRecord *)v26 initWithRecordName:v11 contextUUID:v24 creationDate:v27 protection:v30];

  return v28;
}

- (void)expungeRecordsForAccessory:(id)a3 allRecords:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(FMDAccessoryLocationStore *)self supportedAccessoryRegistry];
  id v8 = v7;
  uint64_t v9 = 1;
  uint64_t v10 = 0x47EFFFFFE0000000;
  uint64_t v11 = 0x47EFFFFFE0000000;
  if (v7 && !a4)
  {
    id v12 = [v7 longTermLocationExpiryTimeIntervalForAccessory:v6];
    [v12 doubleValue];
    uint64_t v11 = v13;

    id v14 = [v8 shortTermLocationExpiryTimeIntervalForAccessory:v6];
    [v14 doubleValue];
    uint64_t v10 = v15;

    id v16 = [v8 maximumHistoricalLocationsForAccessory:v6];
    uint64_t v9 = (uint64_t)[v16 unsignedIntegerValue];
  }
  double v17 = +[FMSystemInfo sharedInstance];
  unsigned int v18 = [v17 isInternalBuild];

  if (v18)
  {
    id v19 = +[FMPreferencesUtil objectForKey:@"LocationStoreCleanup" inDomain:kFMDNotBackedUpPrefDomain];
    id v20 = v19;
    if (v19)
    {
      [v19 doubleValue];
      uint64_t v10 = v21;
    }
  }
  id v22 = sub_100004238();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2048;
    v65 = (uint64_t (*)(uint64_t, uint64_t))v9;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Expunging accessory locations older than (short) %f (long) %f, maxlocates %li", buf, 0x20u);
  }

  __int16 v23 = [(FMDAccessoryLocationStore *)self recordsByAccessoryIdentifier];
  BOOL v24 = [v6 accessoryIdentifier];
  v25 = [v23 objectForKeyedSubscript:v24];
  id v26 = [v25 copy];

  v27 = +[NSPredicate predicateWithFormat:@"class == %@", objc_opt_class()];
  v28 = [v26 filteredArrayUsingPredicate:v27];

  v29 = [v28 sortedArrayUsingComparator:&stru_1002DC4D8];

  unint64_t v30 = +[NSDate date];
  [v30 timeIntervalSinceReferenceDate];
  uint64_t v32 = v31;

  __int16 v33 = sub_100004238();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    id v34 = [v29 count];
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = v34;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v29;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "FMDAccessoryLocationStore found %lu records %@", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v65 = sub_10008BF24;
  v66 = sub_10008BF34;
  id v67 = +[NSMutableDictionary dictionary];
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x3032000000;
  v57 = sub_10008BF24;
  v58 = sub_10008BF34;
  id v59 = +[NSMutableArray array];
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x3032000000;
  v51 = sub_10008BF24;
  v52 = sub_10008BF34;
  id v53 = 0;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_10008E178;
  v46[3] = &unk_1002DC500;
  BOOL v47 = a4;
  v46[8] = v10;
  v46[9] = v32;
  v46[10] = v11;
  v46[4] = buf;
  v46[5] = &v54;
  v46[6] = &v48;
  v46[7] = v9;
  [v29 enumerateObjectsUsingBlock:v46];
  v35 = [(FMDAccessoryLocationStore *)self recordsByAccessoryIdentifier];
  id v36 = [v35 mutableCopy];

  v37 = sub_100004238();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    id v38 = [(id)v55[5] count];
    uint64_t v39 = v55[5];
    *(_DWORD *)v60 = 134218242;
    id v61 = v38;
    __int16 v62 = 2112;
    uint64_t v63 = v39;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "FMDAccessoryLocationStore keeping %lu records %@", v60, 0x16u);
  }

  uint64_t v40 = v55[5];
  v41 = [v6 accessoryIdentifier];
  [v36 setObject:v40 forKeyedSubscript:v41];

  [(FMDAccessoryLocationStore *)self setRecordsByAccessoryIdentifier:v36];
  v42 = [(FMDAccessoryLocationStore *)self dataArchiver];
  v43 = [(FMDAccessoryLocationStore *)self recordsByAccessoryIdentifier];
  v44 = [v42 saveDictionary:v43];

  if (v44)
  {
    v45 = sub_100004238();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      sub_10023EA80();
    }
  }
  [(FMDAccessoryLocationStore *)self scheduleJanitor:v49[5]];

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v54, 8);

  _Block_object_dispose(buf, 8);
}

- (void)clearAllRecords
{
  id v3 = sub_100004238();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Deleting all accessory locations stored on disk.", v7, 2u);
  }

  [(FMDAccessoryLocationStore *)self readLocationsFromDisk];
  id v4 = [(FMDAccessoryLocationStore *)self recordsByAccessoryIdentifier];
  id v5 = [v4 allValues];
  id v6 = [v5 copy];

  [v6 enumerateObjectsUsingBlock:&stru_1002DC540];
}

- (void)readLocationsFromDisk
{
  objc_initWeak(&location, self);
  id v3 = [(FMDAccessoryLocationStore *)self serialQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10008E714;
  v4[3] = &unk_1002D93C8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (BOOL)canRetrieveLockedRecords
{
  id v2 = +[FMDSystemConfig sharedInstance];
  char v3 = [v2 isLocked] ^ 1;

  return v3;
}

- (id)contextKeyForAccessory:(id)a3 protectionClass:(int64_t)a4
{
  id v5 = @"classC";
  if (a4 == 2) {
    id v5 = @"classB";
  }
  id v6 = v5;
  id v7 = [a3 accessoryIdentifier];
  id v8 = +[NSString stringWithFormat:@"%@:%@:%@", @"AccessoryLocation", v7, v6];

  return v8;
}

- (void)scheduleJanitor:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(FMDAccessoryLocationStore *)self nextScheduledJanitorDate];
    if (!v5) {
      goto LABEL_4;
    }
    id v6 = (void *)v5;
    id v7 = [(FMDAccessoryLocationStore *)self nextScheduledJanitorDate];
    [v7 timeIntervalSinceReferenceDate];
    double v9 = v8;
    [v4 timeIntervalSinceReferenceDate];
    double v11 = v10;

    if (v9 <= v11)
    {
      uint64_t v15 = [(FMDAccessoryLocationStore *)self nextScheduledJanitorDate];

      id v16 = sub_100004238();
      uint64_t v13 = v16;
      if (v15)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          sub_100241984(self, v13);
        }
      }
      else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        sub_100241940(v13);
      }
    }
    else
    {
LABEL_4:
      id v12 = sub_100004238();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_1002418CC();
      }

      [(FMDAccessoryLocationStore *)self setNextScheduledJanitorDate:v4];
      uint64_t v13 = [(FMDAccessoryLocationStore *)self janitor];
      [v13 schedule:v4];
    }
  }
  else
  {
    id v14 = sub_100004238();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_100241888(v14);
    }

    [(FMDAccessoryLocationStore *)self setNextScheduledJanitorDate:0];
    uint64_t v13 = [(FMDAccessoryLocationStore *)self janitor];
    [v13 deactivate];
  }
}

- (void)accessoryDidUnpair:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [(FMDAccessoryLocationStore *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008EBC8;
  block[3] = &unk_1002D9238;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)accessoryDidDisconnect:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_100004238();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "accesory disconnected storing last known location", (uint8_t *)&v10, 2u);
  }

  if ([(FMDAccessoryLocationStore *)self shouldRetrieveLocationForAccessory:v4])
  {
    id v6 = [(FMDAccessoryLocationStore *)self supportedAccessoryRegistry];
    id v7 = [v6 locatorForAccessory:v4];
    id v8 = sub_100004238();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v4 name];
      int v10 = 138412546;
      double v11 = v9;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "accesory = %@, locator = %@", (uint8_t *)&v10, 0x16u);
    }
    [(FMDAccessoryLocationStore *)self retreiveLocationForAccessory:v4 forEvent:2 locator:v7 completion:0];
  }
}

- (FMDSupportedAccessoryRegistry)supportedAccessoryRegistry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_supportedAccessoryRegistry);

  return (FMDSupportedAccessoryRegistry *)WeakRetained;
}

- (void)setSupportedAccessoryRegistry:(id)a3
{
}

- (FMDAccessoryRegistry)accessoryRegistry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessoryRegistry);

  return (FMDAccessoryRegistry *)WeakRetained;
}

- (void)setAccessoryRegistry:(id)a3
{
}

- (FMDXPCJanitor)janitor
{
  return self->_janitor;
}

- (void)setJanitor:(id)a3
{
}

- (NSDate)nextScheduledJanitorDate
{
  return self->_nextScheduledJanitorDate;
}

- (void)setNextScheduledJanitorDate:(id)a3
{
}

- (FMDataArchiver)dataArchiver
{
  return self->_dataArchiver;
}

- (void)setDataArchiver:(id)a3
{
}

- (NSDictionary)recordsByAccessoryIdentifier
{
  return self->_recordsByAccessoryIdentifier;
}

- (void)setRecordsByAccessoryIdentifier:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (FMStateCapture)stateCapture
{
  return self->_stateCapture;
}

- (void)setStateCapture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCapture, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_recordsByAccessoryIdentifier, 0);
  objc_storeStrong((id *)&self->_dataArchiver, 0);
  objc_storeStrong((id *)&self->_nextScheduledJanitorDate, 0);
  objc_storeStrong((id *)&self->_janitor, 0);
  objc_destroyWeak((id *)&self->_accessoryRegistry);

  objc_destroyWeak((id *)&self->_supportedAccessoryRegistry);
}

@end