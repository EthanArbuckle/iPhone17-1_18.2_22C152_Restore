@interface NPSDeviceRegistry
+ (id)createDirectoryIfNeeded:(id)a3;
+ (id)idsDestinationIDForNRDevice:(id)a3 withIdsService:(id)a4;
+ (id)nrDeviceForIDSDevice:(id)a3;
- (BOOL)hasCheckedInWithNanoRegistry;
- (BOOL)isAltAccountDevice;
- (BOOL)isPaired;
- (NPSDomainAccessor)domainAccessor;
- (NRDevice)activeDevice;
- (NSDate)lastActiveDate;
- (NSString)databasePath;
- (NSString)filesBackupDirectoryPath;
- (NSString)filesBackupMetadataIndexPath;
- (NSString)globalCacheDirectoryPath;
- (NSString)pairingDataStore;
- (NSString)perGizmoCacheDirectoryPath;
- (NSString)userDefaultsBackupDirectoryPath;
- (NSUUID)activeDeviceID;
- (OS_dispatch_queue)queue;
- (id)pairingDevice;
- (id)pairingID;
- (void)_registryChanged:(id)a3;
- (void)checkForActiveDeviceChange;
- (void)setActiveDevice:(id)a3;
- (void)setActiveDeviceID:(id)a3;
- (void)setDatabasePath:(id)a3;
- (void)setDomainAccessor:(id)a3;
- (void)setFilesBackupDirectoryPath:(id)a3;
- (void)setFilesBackupMetadataIndexPath:(id)a3;
- (void)setGlobalCacheDirectoryPath:(id)a3;
- (void)setHasCheckedInWithNanoRegistry:(BOOL)a3;
- (void)setPairingDataStore:(id)a3;
- (void)setPerGizmoCacheDirectoryPath:(id)a3;
- (void)setUserDefaultsBackupDirectoryPath:(id)a3;
- (void)startMonitoringPairingEventsWithQueue:(id)a3;
@end

@implementation NPSDeviceRegistry

- (void)startMonitoringPairingEventsWithQueue:(id)a3
{
  v4 = (OS_dispatch_queue *)a3;
  if (!v4) {
    sub_100028FDC();
  }
  queue = self->_queue;
  self->_queue = v4;
  v6 = v4;

  v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"_registryChanged:" name:NRPairedDeviceRegistryDeviceDidPairNotification object:0];

  v8 = +[NSNotificationCenter defaultCenter];
  [v8 addObserver:self selector:"_registryChanged:" name:NRPairedDeviceRegistryDeviceDidUnpairNotification object:0];

  v9 = +[NSNotificationCenter defaultCenter];
  [v9 addObserver:self selector:"_registryChanged:" name:NRPairedDeviceRegistryDeviceDidBecomeInactive object:0];

  v10 = +[NSNotificationCenter defaultCenter];
  [v10 addObserver:self selector:"_registryChanged:" name:NRPairedDeviceRegistryDeviceDidBecomeActive object:0];

  v11 = +[NSNotificationCenter defaultCenter];
  [v11 addObserver:self selector:"_registryChanged:" name:NRPairedDeviceRegistryDeviceDidEnterCompatibilityStateNotification object:0];

  v12 = +[NSNotificationCenter defaultCenter];
  [v12 addObserver:self selector:"_registryChanged:" name:NRPairedDeviceRegistryDeviceIsSetupNotification object:0];

  [(NPSDeviceRegistry *)self checkForActiveDeviceChange];
}

- (BOOL)isPaired
{
  return self->_activeDevice && self->_activeDeviceID && self->_pairingDataStore != 0;
}

- (BOOL)isAltAccountDevice
{
  v2 = [(NRDevice *)self->_activeDevice valueForProperty:NRDevicePropertyIsAltAccount];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (NSDate)lastActiveDate
{
  return (NSDate *)[(NRDevice *)self->_activeDevice valueForProperty:NRDevicePropertyLastActiveDate];
}

- (id)pairingID
{
  return self->_activeDeviceID;
}

- (NSString)pairingDataStore
{
  return self->_pairingDataStore;
}

- (id)pairingDevice
{
  return self->_activeDevice;
}

- (NSString)perGizmoCacheDirectoryPath
{
  perGizmoCacheDirectoryPath = self->_perGizmoCacheDirectoryPath;
  if (!perGizmoCacheDirectoryPath)
  {
    if (self->_activeDeviceID)
    {
      v4 = [(NSString *)self->_pairingDataStore stringByAppendingPathComponent:@"NanoPreferencesSync"];
      v5 = [v4 stringByAppendingPathComponent:@"Cache/"];

      v6 = [v5 stringByStandardizingPath];
      v7 = [v6 stringByAppendingString:@"/"];

      id v8 = [(id)objc_opt_class() createDirectoryIfNeeded:v7];
      v9 = self->_perGizmoCacheDirectoryPath;
      self->_perGizmoCacheDirectoryPath = v7;

      perGizmoCacheDirectoryPath = self->_perGizmoCacheDirectoryPath;
    }
    else
    {
      perGizmoCacheDirectoryPath = 0;
    }
  }
  return perGizmoCacheDirectoryPath;
}

- (NSString)globalCacheDirectoryPath
{
  globalCacheDirectoryPath = self->_globalCacheDirectoryPath;
  if (!globalCacheDirectoryPath)
  {
    if (self->_activeDeviceID)
    {
      v4 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
      v5 = [v4 objectAtIndexedSubscript:0];
      v6 = [v5 stringByAppendingPathComponent:@"NanoPreferencesSync"];

      v7 = [v6 stringByAppendingPathComponent:@"Cache/"];

      id v8 = [v7 stringByStandardizingPath];
      v9 = [v8 stringByAppendingString:@"/"];

      id v10 = [(id)objc_opt_class() createDirectoryIfNeeded:v9];
      v11 = self->_globalCacheDirectoryPath;
      self->_globalCacheDirectoryPath = v9;

      globalCacheDirectoryPath = self->_globalCacheDirectoryPath;
    }
    else
    {
      globalCacheDirectoryPath = 0;
    }
  }
  return globalCacheDirectoryPath;
}

- (NPSDomainAccessor)domainAccessor
{
  domainAccessor = self->_domainAccessor;
  if (!domainAccessor)
  {
    if (self->_activeDevice)
    {
      id v4 = objc_alloc((Class)NPSDomainAccessor);
      v5 = (NPSDomainAccessor *)[v4 initWithDomain:kNanoPreferencesSyncDomain pairingID:self->_activeDeviceID pairingDataStore:self->_pairingDataStore];
      v6 = self->_domainAccessor;
      self->_domainAccessor = v5;

      domainAccessor = self->_domainAccessor;
    }
    else
    {
      domainAccessor = 0;
    }
  }
  return domainAccessor;
}

- (NSString)userDefaultsBackupDirectoryPath
{
  userDefaultsBackupDirectoryPath = self->_userDefaultsBackupDirectoryPath;
  if (!userDefaultsBackupDirectoryPath)
  {
    if (self->_activeDeviceID)
    {
      id v4 = [(NSString *)self->_pairingDataStore stringByAppendingPathComponent:@"NanoPreferencesSync"];
      v5 = [v4 stringByAppendingPathComponent:@"Backup/UserDefaults/"];

      v6 = [v5 stringByStandardizingPath];
      v7 = [v6 stringByAppendingString:@"/"];

      id v8 = [(id)objc_opt_class() createDirectoryIfNeeded:v7];
      v9 = self->_userDefaultsBackupDirectoryPath;
      self->_userDefaultsBackupDirectoryPath = v7;

      userDefaultsBackupDirectoryPath = self->_userDefaultsBackupDirectoryPath;
    }
    else
    {
      userDefaultsBackupDirectoryPath = 0;
    }
  }
  return userDefaultsBackupDirectoryPath;
}

- (NSString)filesBackupDirectoryPath
{
  filesBackupDirectoryPath = self->_filesBackupDirectoryPath;
  if (!filesBackupDirectoryPath)
  {
    if (self->_activeDeviceID)
    {
      id v4 = [(NSString *)self->_pairingDataStore stringByAppendingPathComponent:@"NanoPreferencesSync"];
      v5 = [v4 stringByAppendingPathComponent:@"Backup/Files/"];

      v6 = [v5 stringByStandardizingPath];
      v7 = [v6 stringByAppendingString:@"/"];

      id v8 = [(id)objc_opt_class() createDirectoryIfNeeded:v7];
      v9 = self->_filesBackupDirectoryPath;
      self->_filesBackupDirectoryPath = v7;

      filesBackupDirectoryPath = self->_filesBackupDirectoryPath;
    }
    else
    {
      filesBackupDirectoryPath = 0;
    }
  }
  return filesBackupDirectoryPath;
}

- (NSString)filesBackupMetadataIndexPath
{
  filesBackupMetadataIndexPath = self->_filesBackupMetadataIndexPath;
  if (!filesBackupMetadataIndexPath)
  {
    if (self->_activeDeviceID)
    {
      id v4 = [(NPSDeviceRegistry *)self filesBackupDirectoryPath];
      v5 = [v4 stringByAppendingPathComponent:@"index"];

      v6 = [v5 stringByStandardizingPath];

      v7 = self->_filesBackupMetadataIndexPath;
      self->_filesBackupMetadataIndexPath = v6;

      filesBackupMetadataIndexPath = self->_filesBackupMetadataIndexPath;
    }
    else
    {
      filesBackupMetadataIndexPath = 0;
    }
  }
  return filesBackupMetadataIndexPath;
}

- (NSString)databasePath
{
  databasePath = self->_databasePath;
  if (!databasePath)
  {
    id v4 = [(NSString *)self->_pairingDataStore stringByAppendingPathComponent:@"NanoPreferencesSync"];
    id v5 = [(id)objc_opt_class() createDirectoryIfNeeded:v4];
    v6 = [v4 stringByAppendingPathComponent:@"database.db"];

    v7 = self->_databasePath;
    self->_databasePath = v6;

    databasePath = self->_databasePath;
  }
  return databasePath;
}

- (void)_registryChanged:(id)a3
{
  id v5 = (void *)nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = [a3 name];
    *(_DWORD *)buf = 138412290;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received notification: (%@)", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025004;
  block[3] = &unk_10003CC40;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)checkForActiveDeviceChange
{
  unsigned __int8 v3 = +[NRPairedDeviceRegistry sharedInstance];
  id v4 = +[NRPairedDeviceRegistry activeDeviceSelectorBlock];
  id v5 = [v3 getAllDevicesWithArchivedAltAccountDevicesMatching:v4];
  v6 = [v5 firstObject];

  v7 = [v6 valueForProperty:NRDevicePropertyIsArchived];
  LODWORD(v5) = [v7 BOOLValue];

  if (v5)
  {

    v6 = 0;
  }
  if ([v3 compatibilityState] != 3
    && [v3 compatibilityState] != 4
    && [v3 compatibilityState] != 5)
  {

    v6 = 0;
  }
  id v8 = [v6 valueForProperty:NRDevicePropertyPairingID];
  v9 = v8;
  if (v8 != self->_activeDeviceID && ([(NSUUID *)v8 isEqual:self->_activeDevice] & 1) == 0)
  {
    id v10 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      activeDeviceID = self->_activeDeviceID;
      int v21 = 138543618;
      v22 = activeDeviceID;
      __int16 v23 = 2114;
      v24 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Paired device changed from %{public}@ to %{public}@", (uint8_t *)&v21, 0x16u);
    }
    objc_storeStrong((id *)&self->_activeDeviceID, v9);
    [(NPSDeviceRegistry *)self setActiveDevice:v6];
    v12 = [(NRDevice *)self->_activeDevice valueForProperty:NRDevicePropertyLocalPairingDataStorePath];
    pairingDataStore = self->_pairingDataStore;
    self->_pairingDataStore = v12;

    databasePath = self->_databasePath;
    self->_databasePath = 0;

    globalCacheDirectoryPath = self->_globalCacheDirectoryPath;
    self->_globalCacheDirectoryPath = 0;

    perGizmoCacheDirectoryPath = self->_perGizmoCacheDirectoryPath;
    self->_perGizmoCacheDirectoryPath = 0;

    userDefaultsBackupDirectoryPath = self->_userDefaultsBackupDirectoryPath;
    self->_userDefaultsBackupDirectoryPath = 0;

    filesBackupDirectoryPath = self->_filesBackupDirectoryPath;
    self->_filesBackupDirectoryPath = 0;

    filesBackupMetadataIndexPath = self->_filesBackupMetadataIndexPath;
    self->_filesBackupMetadataIndexPath = 0;

    [(NPSDomainAccessor *)self->_domainAccessor invalidate];
    domainAccessor = self->_domainAccessor;
    self->_domainAccessor = 0;

    +[NPSServer setLaunchNotificationsEnabled:NPSShouldRun()];
  }
}

+ (id)nrDeviceForIDSDevice:(id)a3
{
  id v3 = a3;
  id v4 = +[NRPairedDeviceRegistry sharedInstance];
  id v5 = [v4 deviceForIDSDevice:v3];

  return v5;
}

+ (id)createDirectoryIfNeeded:(id)a3
{
  id v3 = a3;
  id v4 = +[NSFileManager defaultManager];
  if ([v4 fileExistsAtPath:v3])
  {
    id v5 = 0;
  }
  else
  {
    NSFileAttributeKey v14 = NSFileProtectionKey;
    NSFileProtectionType v15 = NSFileProtectionNone;
    v6 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    id v9 = 0;
    [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:v6 error:&v9];
    id v5 = v9;

    if (v5)
    {
      v7 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v11 = v3;
        __int16 v12 = 2112;
        id v13 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed to create directory (%@) with error: (%@)", buf, 0x16u);
      }
    }
  }

  return v5;
}

+ (id)idsDestinationIDForNRDevice:(id)a3 withIdsService:(id)a4
{
  id v5 = a3;
  if (v5)
  {
    v6 = [a4 linkedDevicesWithRelationship:3];
    if (v6
      && (+[NRPairedDeviceRegistry sharedInstance],
          v7 = objc_claimAutoreleasedReturnValue(),
          [v7 deviceForNRDevice:v5 fromIDSDevices:v6],
          id v8 = objc_claimAutoreleasedReturnValue(),
          v7,
          v8))
    {
      id v9 = (void *)IDSCopyIDForDevice();
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSUUID)activeDeviceID
{
  return self->_activeDeviceID;
}

- (void)setActiveDeviceID:(id)a3
{
}

- (void)setPairingDataStore:(id)a3
{
}

- (NRDevice)activeDevice
{
  return self->_activeDevice;
}

- (void)setActiveDevice:(id)a3
{
}

- (void)setDomainAccessor:(id)a3
{
}

- (void)setPerGizmoCacheDirectoryPath:(id)a3
{
}

- (void)setGlobalCacheDirectoryPath:(id)a3
{
}

- (void)setUserDefaultsBackupDirectoryPath:(id)a3
{
}

- (void)setFilesBackupDirectoryPath:(id)a3
{
}

- (void)setFilesBackupMetadataIndexPath:(id)a3
{
}

- (void)setDatabasePath:(id)a3
{
}

- (BOOL)hasCheckedInWithNanoRegistry
{
  return self->_hasCheckedInWithNanoRegistry;
}

- (void)setHasCheckedInWithNanoRegistry:(BOOL)a3
{
  self->_hasCheckedInWithNanoRegistry = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databasePath, 0);
  objc_storeStrong((id *)&self->_filesBackupMetadataIndexPath, 0);
  objc_storeStrong((id *)&self->_filesBackupDirectoryPath, 0);
  objc_storeStrong((id *)&self->_userDefaultsBackupDirectoryPath, 0);
  objc_storeStrong((id *)&self->_globalCacheDirectoryPath, 0);
  objc_storeStrong((id *)&self->_perGizmoCacheDirectoryPath, 0);
  objc_storeStrong((id *)&self->_domainAccessor, 0);
  objc_storeStrong((id *)&self->_activeDevice, 0);
  objc_storeStrong((id *)&self->_pairingDataStore, 0);
  objc_storeStrong((id *)&self->_activeDeviceID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end