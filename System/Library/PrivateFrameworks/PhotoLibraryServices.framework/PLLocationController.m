@interface PLLocationController
+ (BOOL)usesEffectiveBundleIdentifier;
+ (id)sharedInstance;
+ (void)setUsesEffectiveBundleIdentifier:(BOOL)a3;
- (BOOL)_addLocationToAsset:(id)a3;
- (PLLocationController)init;
- (id)location;
- (id)locationDictionaryForImageWithDeviceOrientation:(int)a3 rearFacingCamera:(BOOL)a4;
- (id)locationString;
- (id)photoLibrary;
- (void)_assetContainerChanged:(id)a3;
- (void)_startUpdating;
- (void)_stopUpdating;
- (void)_updateLocationRunState;
- (void)_updatePendingAssets;
- (void)addLocationToMediaWithAssetURLWhenAvailable:(id)a3 deviceOrientation:(int)a4 cameraWasRearFacing:(BOOL)a5;
- (void)dealloc;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)setEnabled:(BOOL)a3;
- (void)setHeadingEnabled:(BOOL)a3;
@end

@implementation PLLocationController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_locationStr, 0);
  objc_storeStrong((id *)&self->_exifDictionary, 0);
  objc_storeStrong((id *)&self->_locationPendingAssets, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
}

- (void)_assetContainerChanged:(id)a3
{
  if (self->_isUpdating) {
    [(PLLocationController *)self _updatePendingAssets];
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  exifDictionary = self->_exifDictionary;
  self->_exifDictionary = 0;

  locationStr = self->_locationStr;
  self->_locationStr = 0;

  if (self->_isUpdating)
  {
    [(PLLocationController *)self _updatePendingAssets];
  }
}

- (void)_updatePendingAssets
{
  uint64_t v3 = [(NSMutableArray *)self->_locationPendingAssets count];
  if (v3 >= 1)
  {
    uint64_t v4 = v3;
    v5 = [(PLLocationController *)self location];

    if (v5)
    {
      unint64_t v6 = v4 + 1;
      do
      {
        v7 = [(NSMutableArray *)self->_locationPendingAssets objectAtIndex:v6 - 2];
        v8 = [v7 objectForKey:@"PLLocationAssetTimestampKey"];
        [v8 timeIntervalSinceNow];
        if (v9 < -30.0 || [(PLLocationController *)self _addLocationToAsset:v7]) {
          [(NSMutableArray *)self->_locationPendingAssets removeObjectAtIndex:v6 - 2];
        }

        --v6;
      }
      while (v6 > 1);
    }
  }
}

- (void)addLocationToMediaWithAssetURLWhenAvailable:(id)a3 deviceOrientation:(int)a4 cameraWasRearFacing:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  id v18 = a3;
  if ([(id)objc_opt_class() usesEffectiveBundleIdentifier]) {
    int v8 = [MEMORY[0x1E4F1E600] authorizationStatusForBundleIdentifier:@"com.apple.camera"] == 3;
  }
  else {
    int v8 = [(CLLocationManager *)self->_locationManager locationServicesApproved];
  }
  if ([MEMORY[0x1E4F1E600] locationServicesEnabled]) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    v11 = [MEMORY[0x1E4F1C9C8] date];
    v12 = [NSNumber numberWithInt:v6];
    v13 = [NSNumber numberWithBool:v5];
    v14 = objc_msgSend(v10, "initWithObjectsAndKeys:", v18, @"PLLocationAssetURLKey", v11, @"PLLocationAssetTimestampKey", v12, @"PLLocationDeviceOrientationKey", v13, @"PLLocationCameraWasRearFacingKey", 0);

    if (![(PLLocationController *)self _addLocationToAsset:v14])
    {
      locationPendingAssets = self->_locationPendingAssets;
      if (!locationPendingAssets)
      {
        v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v17 = self->_locationPendingAssets;
        self->_locationPendingAssets = v16;

        locationPendingAssets = self->_locationPendingAssets;
      }
      [(NSMutableArray *)locationPendingAssets addObject:v14];
    }
  }
}

- (BOOL)_addLocationToAsset:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 objectForKey:@"PLLocationAssetURLKey"];
  uint64_t v6 = [v4 objectForKey:@"PLLocationDeviceOrientationKey"];
  uint64_t v7 = [v6 intValue];

  int v8 = [v4 objectForKey:@"PLLocationCameraWasRearFacingKey"];

  uint64_t v9 = [v8 BOOLValue];
  id v10 = [(PLLocationController *)self photoLibrary];
  v11 = [v10 photoFromAssetURL:v5];

  if (v11
    && ([v11 pathForOriginalFile],
        v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        v12))
  {
    if ([v11 isVideo])
    {
      v13 = [v11 pathForVideoFile];
      v14 = [(PLLocationController *)self locationString];
      if (v14) {
        BOOL v15 = v13 == 0;
      }
      else {
        BOOL v15 = 1;
      }
      BOOL v16 = !v15;
      if (!v15)
      {
        id v17 = objc_alloc_init(MEMORY[0x1E4F165A0]);
        [v17 setKeySpace:*MEMORY[0x1E4F15DE0]];
        [v17 setKey:*MEMORY[0x1E4F15CB0]];
        [v17 setValue:v14];
        id v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v17, 0);
        v19 = (void *)MEMORY[0x1E4F16468];
        v20 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v13 isDirectory:0];
        uint64_t v27 = 0;
        [v19 updateMovieMetadataInFile:v20 withMetadata:v18 error:&v27];
        uint64_t v21 = v27;

        if (v21) {
          NSLog(&cfstr_ErrorWritingLo.isa);
        }
      }
    }
    else
    {
      v13 = [v11 pathForOriginalFile];
      v22 = [(PLLocationController *)self locationDictionaryForImageWithDeviceOrientation:v7 rearFacingCamera:v9];
      BOOL v16 = v22 != 0;
      if (v22)
      {
        id v23 = objc_alloc(MEMORY[0x1E4F1C9E8]);
        v24 = objc_msgSend(v23, "initWithObjectsAndKeys:", v22, *MEMORY[0x1E4F2FA18], 0);
        if ((CGImageCopyFileWithGPSInformation() & 1) == 0) {
          NSLog(&cfstr_ErrorWritingLo.isa);
        }
        v25 = [(PLLocationController *)self photoLibrary];
        [v25 modifyDCIMEntryForPhoto:v11];
      }
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (id)photoLibrary
{
  v2 = self;
  objc_sync_enter(v2);
  photoLibrary = v2->_photoLibrary;
  if (!photoLibrary)
  {
    uint64_t v4 = +[PLPhotoLibrary cameraPhotoLibrary];
    BOOL v5 = v2->_photoLibrary;
    v2->_photoLibrary = (PLPhotoLibrary *)v4;

    photoLibrary = v2->_photoLibrary;
  }
  uint64_t v6 = photoLibrary;
  objc_sync_exit(v2);

  return v6;
}

- (id)locationString
{
  locationStr = self->_locationStr;
  if (!locationStr)
  {
    uint64_t v4 = [(PLLocationController *)self location];
    BOOL v5 = [v4 iso6709Notation];
    uint64_t v6 = self->_locationStr;
    self->_locationStr = v5;

    locationStr = self->_locationStr;
  }
  return locationStr;
}

- (id)locationDictionaryForImageWithDeviceOrientation:(int)a3 rearFacingCamera:(BOOL)a4
{
  uint64_t v7 = [(PLLocationController *)self location];
  if (!v7) {
    goto LABEL_27;
  }
  if (!self->_exifDictionary)
  {
    int v8 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v7 coordinate];
    float v10 = v9;
    [v7 coordinate];
    float v12 = v11;
    float v13 = fabsf(v10);
    if (v10 >= 0.0) {
      v14 = @"N";
    }
    else {
      v14 = @"S";
    }
    if (v10 < 0.0) {
      float v10 = v13;
    }
    float v15 = fabsf(v12);
    if (v12 >= 0.0) {
      BOOL v16 = @"E";
    }
    else {
      BOOL v16 = @"W";
    }
    if (v12 < 0.0) {
      float v12 = v15;
    }
    id v17 = [NSNumber numberWithDouble:v12];
    [(NSDictionary *)v8 setObject:v17 forKey:*MEMORY[0x1E4F2FA50]];

    id v18 = [NSNumber numberWithDouble:v10];
    [(NSDictionary *)v8 setObject:v18 forKey:*MEMORY[0x1E4F2FA40]];

    [(NSDictionary *)v8 setObject:v14 forKey:*MEMORY[0x1E4F2FA48]];
    [(NSDictionary *)v8 setObject:v16 forKey:*MEMORY[0x1E4F2FA58]];
    v19 = [v7 timestamp];
    if (v19)
    {
      id v20 = objc_alloc_init(MEMORY[0x1E4F28C10]);
      uint64_t v21 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
      [v20 setTimeZone:v21];

      [v20 setDateFormat:@"HH:mm:ss.SS"];
      v22 = [v20 stringFromDate:v19];
      [(NSDictionary *)v8 setObject:v22 forKey:*MEMORY[0x1E4F2FA98]];
    }
    [v7 verticalAccuracy];
    if (v23 >= 0.0)
    {
      [v7 altitude];
      BOOL v25 = v24 < 0.0;
      v26 = objc_msgSend(NSNumber, "numberWithDouble:");
      [(NSDictionary *)v8 setObject:v26 forKey:*MEMORY[0x1E4F2F9B0]];

      uint64_t v27 = [NSNumber numberWithInt:v25];
      [(NSDictionary *)v8 setObject:v27 forKey:*MEMORY[0x1E4F2F9B8]];
    }
    exifDictionary = self->_exifDictionary;
    self->_exifDictionary = v8;

    if (!self->_exifDictionary)
    {
LABEL_27:
      v29 = 0;
      goto LABEL_36;
    }
  }
  v29 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:");
  if ((a3 - 2) >= 3) {
    uint64_t v30 = 1;
  }
  else {
    uint64_t v30 = a3;
  }
  [(CLLocationManager *)self->_locationManager setHeadingOrientation:v30];
  v31 = [(CLLocationManager *)self->_locationManager heading];
  v32 = v31;
  if (v31)
  {
    [v31 headingAccuracy];
    if (v33 >= 0.0)
    {
      if (CFPreferencesGetAppBooleanValue(@"kMagneticNorth", @"com.apple.compass", 0)
        || ([v32 trueHeading], v34 < 0.0))
      {
        [v32 magneticHeading];
        v36 = @"M";
        if (a4) {
          goto LABEL_34;
        }
      }
      else
      {
        [v32 trueHeading];
        v36 = @"T";
        if (a4) {
          goto LABEL_34;
        }
      }
      double v35 = v35 + 180.0;
      double v37 = 360.0;
      if (v35 >= 360.0)
      {
        double v37 = -360.0;
      }
      else if (v35 >= 0.0)
      {
        goto LABEL_34;
      }
      double v35 = v35 + v37;
LABEL_34:
      v38 = [NSNumber numberWithDouble:v35];
      [v29 setObject:v38 forKey:*MEMORY[0x1E4F2FA30]];

      [v29 setObject:v36 forKey:*MEMORY[0x1E4F2FA38]];
    }
  }

LABEL_36:
  return v29;
}

- (id)location
{
  v2 = [(CLLocationManager *)self->_locationManager location];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 horizontalAccuracy];
    double v5 = v4;
    uint64_t v6 = [v3 timestamp];
    [v6 timeIntervalSinceNow];
    double v8 = v7;

    if (v8 < -60.0 || v5 < 0.0)
    {

      uint64_t v3 = 0;
    }
  }
  return v3;
}

- (void)_stopUpdating
{
  if (self->_isUpdating)
  {
    self->_isUpdating = 0;
    [(CLLocationManager *)self->_locationManager setDelegate:0];
    [(CLLocationManager *)self->_locationManager stopUpdatingLocation];
    [(CLLocationManager *)self->_locationManager stopUpdatingHeading];
    exifDictionary = self->_exifDictionary;
    self->_exifDictionary = 0;

    locationStr = self->_locationStr;
    self->_locationStr = 0;
  }
}

- (void)_startUpdating
{
  if (self->_isUpdating || !self->_isEnabled) {
    return;
  }
  self->_isUpdating = 1;
  locationManager = self->_locationManager;
  if (!locationManager)
  {
    if ([(id)objc_opt_class() usesEffectiveBundleIdentifier])
    {
      if ([MEMORY[0x1E4F1E600] authorizationStatusForBundleIdentifier:@"com.apple.camera"] != 3)
      {
LABEL_10:
        [(CLLocationManager *)self->_locationManager setDistanceFilter:*MEMORY[0x1E4F1E6C0]];
        [(CLLocationManager *)self->_locationManager setHeadingFilter:5.0];
        [(CLLocationManager *)self->_locationManager setDesiredAccuracy:*MEMORY[0x1E4F1E6D8]];
        locationManager = self->_locationManager;
        goto LABEL_11;
      }
      double v4 = (CLLocationManager *)[objc_alloc(MEMORY[0x1E4F1E600]) initWithEffectiveBundleIdentifier:@"com.apple.camera" delegate:0 onQueue:0];
    }
    else
    {
      double v4 = (CLLocationManager *)objc_alloc_init(MEMORY[0x1E4F1E600]);
    }
    double v5 = self->_locationManager;
    self->_locationManager = v4;

    goto LABEL_10;
  }
LABEL_11:
  [(CLLocationManager *)locationManager setDelegate:self];
  [(CLLocationManager *)self->_locationManager startUpdatingLocation];
  if (self->_isHeadingEnabled)
  {
    uint64_t v6 = self->_locationManager;
    [(CLLocationManager *)v6 startUpdatingHeading];
  }
}

- (void)setHeadingEnabled:(BOOL)a3
{
  self->_isHeadingEnabled = a3;
  if (self->_isUpdating)
  {
    locationManager = self->_locationManager;
    if (a3) {
      [(CLLocationManager *)locationManager startUpdatingHeading];
    }
    else {
      [(CLLocationManager *)locationManager stopUpdatingHeading];
    }
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_isEnabled != a3)
  {
    self->_isEnabled = a3;
    [(PLLocationController *)self _updateLocationRunState];
  }
}

- (void)_updateLocationRunState
{
  if (self->_isEnabled && (DCIM_isApplicationSuspended() & 1) == 0)
  {
    if (!self->_isUpdating)
    {
      [(PLLocationController *)self _startUpdating];
    }
  }
  else if (self->_isUpdating)
  {
    [(PLLocationController *)self _stopUpdating];
  }
}

- (void)dealloc
{
  [(PLLocationController *)self _stopUpdating];
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PLLocationController;
  [(PLLocationController *)&v4 dealloc];
}

- (PLLocationController)init
{
  v8.receiver = self;
  v8.super_class = (Class)PLLocationController;
  v2 = [(PLLocationController *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    objc_super v4 = DCIM_applicationWillResignActiveNotificationName();
    [v3 addObserver:v2 selector:sel__applicationStateChanged_ name:v4 object:0];

    double v5 = DCIM_applicationDidBecomeActiveNotificationName();
    [v3 addObserver:v2 selector:sel__applicationStateChanged_ name:v5 object:0];

    uint64_t v6 = DCIM_applicationSuspendedEventsOnlyNotificationName();
    [v3 addObserver:v2 selector:sel__applicationStateChanged_ name:v6 object:0];

    [v3 addObserver:v2 selector:sel__assetContainerChanged_ name:@"PLAssetContainerDidChangeNotification" object:0];
    [(PLLocationController *)v2 performSelector:sel__updateLocationRunState withObject:0 afterDelay:0.0];
  }
  return v2;
}

+ (id)sharedInstance
{
  v2 = (void *)__sharedLocationController;
  if (!__sharedLocationController)
  {
    uint64_t v3 = objc_alloc_init(PLLocationController);
    objc_super v4 = (void *)__sharedLocationController;
    __sharedLocationController = (uint64_t)v3;

    v2 = (void *)__sharedLocationController;
  }
  return v2;
}

+ (void)setUsesEffectiveBundleIdentifier:(BOOL)a3
{
  __usesEffectiveBundleIdentifier = a3;
}

+ (BOOL)usesEffectiveBundleIdentifier
{
  return __usesEffectiveBundleIdentifier;
}

@end