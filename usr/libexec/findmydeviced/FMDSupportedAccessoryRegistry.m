@interface FMDSupportedAccessoryRegistry
+ (id)defaultStorageLocation;
- (BOOL)defaultAccessoriesEnabled;
- (BOOL)isAccessorySupported:(id)a3;
- (FMDAssetRegistry)assetRegistry;
- (FMDSupportedAccessoryRegistry)initWithDelegate:(id)a3;
- (FMDSupportedAccessoryRegistryDelegate)delegate;
- (FMDataArchiver)dataArchiver;
- (NSDictionary)supportedAccessories;
- (OS_dispatch_queue)serialQueue;
- (double)locateDesiredAccuracyForAccessory:(id)a3;
- (double)locateTimeoutForAccessory:(id)a3;
- (double)locationThrottleTimeIntervalForAccessory:(id)a3 speed:(double)a4;
- (id)advertisementStatusKeyForProfile:(int64_t)a3;
- (id)assetForProfile:(int64_t)a3;
- (id)assetsForAccessory:(id)a3;
- (id)channelNamesForProfile:(int64_t)a3;
- (id)defaultSupportedAccessoriesIfEnabled:(BOOL)a3;
- (id)locatorForAccessory:(id)a3;
- (id)longTermLocationExpiryTimeIntervalForAccessory:(id)a3;
- (id)maximumHistoricalLocationsForAccessory:(id)a3;
- (id)playbackChannelNamesForAccessory:(id)a3 commandChannels:(id)a4;
- (id)shortTermLocationExpiryTimeIntervalForAccessory:(id)a3;
- (id)supportedAccessoriesVersion;
- (id)supportedAccessoryForAccessory:(id)a3;
- (id)supportedAccessoryForIdentifier:(id)a3;
- (int64_t)profileForAccessoryIdentifier:(id)a3;
- (unint64_t)defaultTimeoutAudioSafetyStatusForAccessory:(id)a3;
- (unint64_t)defaultTimeoutAudioSafetyStatusForProfile:(int64_t)a3;
- (void)clearSupportedAccessoryRegistry;
- (void)downloadAssetsIfNeededForAccessory:(id)a3;
- (void)readSupportedAccessoriesFromDisk;
- (void)resetSupportedAccessoriesVersion;
- (void)setAssetRegistry:(id)a3;
- (void)setDataArchiver:(id)a3;
- (void)setDefaultAccessoriesEnabled:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setSupportedAccessories:(id)a3;
- (void)updateSupportedAccessories:(id)a3 completion:(id)a4;
@end

@implementation FMDSupportedAccessoryRegistry

+ (id)defaultStorageLocation
{
  id v2 = objc_alloc_init((Class)FMInternalFileContainer);
  v3 = [v2 url];
  v4 = [v3 fm_preferencesPathURLForDomain:@"com.apple.icloud.findmydeviced.supportedaccessories"];

  return v4;
}

- (FMDSupportedAccessoryRegistry)initWithDelegate:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)FMDSupportedAccessoryRegistry;
  v5 = [(FMDSupportedAccessoryRegistry *)&v27 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("FMDSupportedAccessoryRegistry.serialQueue", 0);
    [(FMDSupportedAccessoryRegistry *)v5 setSerialQueue:v6];

    [(FMDSupportedAccessoryRegistry *)v5 setSupportedAccessories:&__NSDictionary0__struct];
    [(FMDSupportedAccessoryRegistry *)v5 setDelegate:v4];
    id v7 = objc_alloc((Class)FMDataArchiver);
    v8 = [(id)objc_opt_class() defaultStorageLocation];
    id v9 = [v7 initWithFileURL:v8];
    [(FMDSupportedAccessoryRegistry *)v5 setDataArchiver:v9];

    v10 = [(FMDSupportedAccessoryRegistry *)v5 dataArchiver];
    [v10 setDataProtectionClass:4];

    v11 = [(FMDSupportedAccessoryRegistry *)v5 dataArchiver];
    [v11 setBackedUp:0];

    v12 = [(FMDSupportedAccessoryRegistry *)v5 dataArchiver];
    [v12 setCreateDirectories:1];

    [(FMDSupportedAccessoryRegistry *)v5 setDefaultAccessoriesEnabled:1];
    [(FMDSupportedAccessoryRegistry *)v5 readSupportedAccessoriesFromDisk];
    v13 = [(FMDSupportedAccessoryRegistry *)v5 defaultSupportedAccessoriesIfEnabled:[(FMDSupportedAccessoryRegistry *)v5 defaultAccessoriesEnabled]];
    objc_initWeak(&location, v5);
    v14 = [(FMDSupportedAccessoryRegistry *)v5 serialQueue];
    v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    v21 = sub_1000C8F44;
    v22 = &unk_1002DA298;
    objc_copyWeak(&v25, &location);
    id v15 = v13;
    id v23 = v15;
    id v24 = v4;
    dispatch_async(v14, &v19);

    v16 = sub_100004238();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [(FMDSupportedAccessoryRegistry *)v5 supportedAccessories];
      *(_DWORD *)buf = 138412290;
      v29 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "FMDSupportedAccessoryRegistry initizlied %@", buf, 0xCu);
    }
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  return v5;
}

- (id)defaultSupportedAccessoriesIfEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  CFStringRef v30 = @"FMDSupportedAccessoryRegistryLocalVersionKey";
  CFStringRef v31 = @"2";
  dispatch_queue_t v6 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
  [v5 setDictionary:v6];

  if (v3)
  {
    id v25 = [[FMDSupportedAccessory alloc] initWithDeviceVendor:&off_1002F20E0 deviceProductId:&off_1002F20F8 profile:1];
    id v7 = [[FMDSupportedAccessory alloc] initWithDeviceVendor:&off_1002F20E0 deviceProductId:&off_1002F2110 profile:1];
    v8 = [(FMDSupportedAccessory *)v25 accessoryIdentifier];
    v28[0] = v8;
    v29[0] = v25;
    id v9 = [(FMDSupportedAccessory *)v7 accessoryIdentifier];
    v28[1] = v9;
    v28[2] = @"FMDSupportedAccessoryRegistryLocalVersionKey";
    v29[1] = v7;
    v29[2] = @"7";
    v10 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:3];
    [v5 addEntriesFromDictionary:v10];

    v11 = [[FMDSupportedAccessory alloc] initWithDeviceVendor:&off_1002F20E0 deviceProductId:&off_1002F2128 profile:1];
    v12 = [(FMDSupportedAccessory *)v11 accessoryIdentifier];
    [v5 setObject:v11 forKey:v12];

    [v5 setObject:@"8" forKey:@"FMDSupportedAccessoryRegistryLocalVersionKey"];
    v13 = [(FMDSupportedAccessoryRegistry *)self assetForProfile:2];
    v14 = [FMDSupportedAccessory alloc];
    objc_super v27 = v13;
    id v15 = +[NSArray arrayWithObjects:&v27 count:1];
    v16 = [(FMDSupportedAccessory *)v14 initWithDeviceVendor:&off_1002F20E0 deviceProductId:&off_1002F2140 profile:2 assets:v15];

    v17 = [(FMDSupportedAccessory *)v16 accessoryIdentifier];
    [v5 setObject:v16 forKey:v17];

    [v5 setObject:@"9" forKey:@"FMDSupportedAccessoryRegistryLocalVersionKey"];
    v18 = [(FMDSupportedAccessoryRegistry *)self assetForProfile:2];
    v19 = [FMDSupportedAccessory alloc];
    v26 = v18;
    uint64_t v20 = +[NSArray arrayWithObjects:&v26 count:1];
    v21 = [(FMDSupportedAccessory *)v19 initWithDeviceVendor:&off_1002F20E0 deviceProductId:&off_1002F2158 profile:2 assets:v20];

    v22 = [(FMDSupportedAccessory *)v21 accessoryIdentifier];
    [v5 setObject:v21 forKey:v22];

    [v5 setObject:@"9" forKey:@"FMDSupportedAccessoryRegistryLocalVersionKey"];
  }
  id v23 = [v5 copy];

  return v23;
}

- (void)updateSupportedAccessories:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v8 = [(FMDSupportedAccessoryRegistry *)self serialQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000C95D0;
  v11[3] = &unk_1002DC610;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (id)supportedAccessoriesVersion
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000C9B04;
  v11 = sub_1000C9B14;
  id v12 = 0;
  BOOL v3 = [(FMDSupportedAccessoryRegistry *)self serialQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000C9B1C;
  v6[3] = &unk_1002D9210;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)resetSupportedAccessoriesVersion
{
  objc_initWeak(&location, self);
  BOOL v3 = [(FMDSupportedAccessoryRegistry *)self serialQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000C9C6C;
  v4[3] = &unk_1002D93C8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (BOOL)isAccessorySupported:(id)a3
{
  id v4 = a3;
  if ([v4 category] == (id)2 || objc_msgSend(v4, "category") == (id)3)
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = [(FMDSupportedAccessoryRegistry *)self supportedAccessoryForAccessory:v4];
    BOOL v5 = v6 != 0;
  }
  return v5;
}

- (int64_t)profileForAccessoryIdentifier:(id)a3
{
  BOOL v3 = [(FMDSupportedAccessoryRegistry *)self supportedAccessoryForIdentifier:a3];
  id v4 = [v3 profile];

  return (int64_t)v4;
}

- (id)maximumHistoricalLocationsForAccessory:(id)a3
{
  BOOL v3 = [(FMDSupportedAccessoryRegistry *)self supportedAccessoryForAccessory:a3];
  id v4 = [v3 maximumHistoricalLocations];

  return v4;
}

- (id)shortTermLocationExpiryTimeIntervalForAccessory:(id)a3
{
  BOOL v3 = [(FMDSupportedAccessoryRegistry *)self supportedAccessoryForAccessory:a3];
  id v4 = [v3 shortTermlocationExpiryTimeInterval];

  return v4;
}

- (id)longTermLocationExpiryTimeIntervalForAccessory:(id)a3
{
  BOOL v3 = [(FMDSupportedAccessoryRegistry *)self supportedAccessoryForAccessory:a3];
  id v4 = [v3 longTermlocationExpiryTimeInterval];

  return v4;
}

- (double)locateTimeoutForAccessory:(id)a3
{
  BOOL v3 = [(FMDSupportedAccessoryRegistry *)self supportedAccessoryForAccessory:a3];
  id v4 = [v3 locateTimeout];
  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (double)locateDesiredAccuracyForAccessory:(id)a3
{
  BOOL v3 = [(FMDSupportedAccessoryRegistry *)self supportedAccessoryForAccessory:a3];
  id v4 = [v3 desiredAccuracy];
  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (id)advertisementStatusKeyForProfile:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 2) {
    return &stru_1002E7428;
  }
  else {
    return @"hsStatus";
  }
}

- (unint64_t)defaultTimeoutAudioSafetyStatusForAccessory:(id)a3
{
  id v4 = [(FMDSupportedAccessoryRegistry *)self supportedAccessoryForAccessory:a3];
  double v5 = v4;
  if (v4) {
    unint64_t v6 = -[FMDSupportedAccessoryRegistry defaultTimeoutAudioSafetyStatusForProfile:](self, "defaultTimeoutAudioSafetyStatusForProfile:", [v4 profile]);
  }
  else {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)playbackChannelNamesForAccessory:(id)a3 commandChannels:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 category] == (id)3)
  {
    self = (FMDSupportedAccessoryRegistry *)v7;
    goto LABEL_10;
  }
  v8 = [(FMDSupportedAccessoryRegistry *)self supportedAccessoryForAccessory:v6];
  uint64_t v9 = v8;
  if (!v8)
  {
    v11 = [(FMDSupportedAccessoryRegistry *)self channelNamesForProfile:0];
    goto LABEL_8;
  }
  id v10 = [v8 profile];
  if (v10 == (id)2)
  {
    if (!v7 || ![v7 count])
    {
      self = (FMDSupportedAccessoryRegistry *)&__NSArray0__struct;
      goto LABEL_9;
    }
    CFStringRef v13 = @"monaural";
    v11 = +[NSArray arrayWithObjects:&v13 count:1];
    goto LABEL_8;
  }
  if ((unint64_t)v10 <= 1)
  {
    v11 = (FMDSupportedAccessoryRegistry *)v7;
LABEL_8:
    self = v11;
  }
LABEL_9:

LABEL_10:

  return self;
}

- (id)channelNamesForProfile:(int64_t)a3
{
  if (a3 == 2)
  {
    CFStringRef v7 = @"monaural";
    BOOL v3 = &v7;
    uint64_t v4 = 1;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    CFStringRef v8 = @"left";
    CFStringRef v9 = @"right";
    BOOL v3 = &v8;
    uint64_t v4 = 2;
LABEL_5:
    double v5 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, v4, v7, v8, v9);
    goto LABEL_7;
  }
  double v5 = &__NSArray0__struct;
LABEL_7:

  return v5;
}

- (id)locatorForAccessory:(id)a3
{
  BOOL v3 = [(FMDSupportedAccessoryRegistry *)self supportedAccessoryForAccessory:a3];
  if (v3)
  {
    uint64_t v4 = [FMDLocator alloc];
    double v5 = +[FMDLocationManagerFactory sharedInstance];
    id v6 = [v5 newLocationManager];
    CFStringRef v7 = [(FMDLocator *)v4 initWithLocationManager:v6];

    CFStringRef v8 = [v3 desiredAccuracy];
    [v8 doubleValue];
    -[FMDLocator setDesiredAccuracy:](v7, "setDesiredAccuracy:");

    CFStringRef v9 = [v3 locateTimeout];
    [v9 doubleValue];
    -[FMDLocator setDuration:](v7, "setDuration:");

    id v10 = objc_alloc_init(FMDConservativeLocatorPublisher);
    v11 = [v3 startThreshold];
    [(FMDConservativeLocatorPublisher *)v10 setStartThreshold:v11];

    id v12 = [v3 endThreshold];
    [(FMDConservativeLocatorPublisher *)v10 setEndThreshold:v12];

    CFStringRef v13 = [v3 decayFactor];
    [(FMDConservativeLocatorPublisher *)v10 setDecayFactor:v13];

    id v14 = [v3 cachedLocValidityDuration];
    [(FMDConservativeLocatorPublisher *)v10 setCachedLocationValidityTimeInterval:v14];

    [(FMDLocator *)v7 setLocatorPublisher:v10];
  }
  else
  {
    CFStringRef v7 = 0;
  }

  return v7;
}

- (double)locationThrottleTimeIntervalForAccessory:(id)a3 speed:(double)a4
{
  double v5 = [(FMDSupportedAccessoryRegistry *)self supportedAccessoryForAccessory:a3];
  id v6 = [v5 locationThrottleRatio];
  [v6 doubleValue];
  double v8 = v7;

  double result = 0.0;
  if (v8 > 0.0) {
    return 60.0 / (fmax(a4, 1.0) * v8);
  }
  return result;
}

- (id)assetsForAccessory:(id)a3
{
  BOOL v3 = [(FMDSupportedAccessoryRegistry *)self supportedAccessoryForAccessory:a3];
  uint64_t v4 = [v3 assets];

  return v4;
}

- (void)clearSupportedAccessoryRegistry
{
  BOOL v3 = [(FMDSupportedAccessoryRegistry *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CA4C4;
  block[3] = &unk_1002D9378;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (id)assetForProfile:(int64_t)a3
{
  if (a3 == 2)
  {
    BOOL v3 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/FindMyDevice.framework"];
    uint64_t v4 = [v3 pathForResource:@"accessory_locateSound_lg-B515" ofType:@"wav"];
    if (v4)
    {
      id v5 = [objc_alloc((Class)NSURL) initFileURLWithPath:v4 isDirectory:0];
      id v6 = [[FMDStandardAsset alloc] initWithFileURL:v5 lastModified:&stru_1002E7428 etag:&stru_1002E7428 type:1 url:v5];
    }
    else
    {
      double v7 = sub_100004238();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CFStringRef v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FMDSupportedAccessoryRegistry did not find accessory_locateSound_lg.", v9, 2u);
      }

      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)downloadAssetsIfNeededForAccessory:(id)a3
{
  uint64_t v4 = [(FMDSupportedAccessoryRegistry *)self assetsForAccessory:a3];
  +[NSMutableArray array];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000CA7B0;
  v7[3] = &unk_1002DC218;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v8;
  [v4 enumerateObjectsUsingBlock:v7];
  id v6 = [(FMDSupportedAccessoryRegistry *)self assetRegistry];
  [v6 downloadAssets:v5];
}

- (id)supportedAccessoryForAccessory:(id)a3
{
  id v4 = a3;
  if ([v4 category] == (id)1)
  {
    if ([v4 conformsToProtocol:&OBJC_PROTOCOL___FMDDynamicAccessoryAdressable])
    {
      id v5 = v4;
      id v6 = objc_alloc((Class)FMDAccessoryIdentifier);
      double v7 = [v5 deviceVendor];
      id v8 = [v5 deviceProductId];

      id v9 = [v6 initWithDeviceVendor:v7 deviceProductId:v8];
LABEL_9:
      id v14 = [(FMDSupportedAccessoryRegistry *)self supportedAccessoryForIdentifier:v9];
      goto LABEL_10;
    }
LABEL_8:
    id v9 = 0;
    goto LABEL_9;
  }
  if ([v4 category] != (id)3) {
    goto LABEL_8;
  }
  id v9 = v4;
  id v10 = +[FMDExtConfigurationRegistry sharedInstance];
  v11 = [v9 accessoryType];
  id v12 = [v10 configForAccessoryType:v11];

  CFStringRef v13 = sub_100059878();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_1002444C4(v12, v13);
  }

  id v14 = [v12 supportedAccessory];

LABEL_10:

  return v14;
}

- (id)supportedAccessoryForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_1000C9B04;
  uint64_t v20 = sub_1000C9B14;
  id v21 = 0;
  id v5 = sub_100004238();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMDSupportedAccessoryRegistry supportedAccessoryForAccessory %@", buf, 0xCu);
  }

  id v6 = [(FMDSupportedAccessoryRegistry *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CAC58;
  block[3] = &unk_1002DBD48;
  id v7 = v4;
  id v14 = self;
  id v15 = &v16;
  id v13 = v7;
  dispatch_sync(v6, block);

  if (v17[5])
  {
    id v8 = sub_100004238();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 138412290;
    id v23 = v7;
    id v9 = "FMDSupportedAccessoryRegistry accessory is supported %@";
  }
  else
  {
    id v8 = sub_100004238();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 138412290;
    id v23 = v7;
    id v9 = "FMDSupportedAccessoryRegistry accessory is NOT supported %@";
  }
  _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
LABEL_9:

  id v10 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v10;
}

- (FMDAssetRegistry)assetRegistry
{
  assetRegistry = self->_assetRegistry;
  if (!assetRegistry)
  {
    id v4 = [FMDAssetRegistry alloc];
    id v5 = +[FMDAssetRegistry defaultStorageLocation];
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    id v8 = [(FMDAssetRegistry *)v4 initWithStorageLocation:v5 identifier:v7];
    id v9 = self->_assetRegistry;
    self->_assetRegistry = v8;

    assetRegistry = self->_assetRegistry;
  }

  return assetRegistry;
}

- (void)readSupportedAccessoriesFromDisk
{
  objc_initWeak(&location, self);
  BOOL v3 = [(FMDSupportedAccessoryRegistry *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CAE50;
  block[3] = &unk_1002D9238;
  objc_copyWeak(&v5, &location);
  void block[4] = self;
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (unint64_t)defaultTimeoutAudioSafetyStatusForProfile:(int64_t)a3
{
  unint64_t v3 = 5;
  if (a3 != 2) {
    unint64_t v3 = 0;
  }
  if (a3 == 1) {
    return 3;
  }
  else {
    return v3;
  }
}

- (FMDSupportedAccessoryRegistryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FMDSupportedAccessoryRegistryDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSDictionary)supportedAccessories
{
  return self->_supportedAccessories;
}

- (void)setSupportedAccessories:(id)a3
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

- (BOOL)defaultAccessoriesEnabled
{
  return self->_defaultAccessoriesEnabled;
}

- (void)setDefaultAccessoriesEnabled:(BOOL)a3
{
  self->_defaultAccessoriesEnabled = a3;
}

- (void)setAssetRegistry:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetRegistry, 0);
  objc_storeStrong((id *)&self->_dataArchiver, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_supportedAccessories, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end