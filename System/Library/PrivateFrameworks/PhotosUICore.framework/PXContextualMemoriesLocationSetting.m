@interface PXContextualMemoriesLocationSetting
+ (BOOL)automaticallyNotifiesObserversOfCoordinate;
+ (CLLocationCoordinate2D)_simulatedLocationCoordinate;
+ (id)keyPathsForValuesAffectingPlacemark;
+ (id)keyPathsForValuesAffectingSubtitle;
+ (id)keyPathsForValuesAffectingTitle;
+ (void)_setSimulatedLocationCoordinate:(CLLocationCoordinate2D)a3;
- (BOOL)monitorsCurrentLocation;
- (CLLocation)location;
- (CLLocationCoordinate2D)coordinate;
- (CLPlacemark)placemark;
- (NSString)headerTitle;
- (NSString)subtitle;
- (NSString)title;
- (PXContextualMemoriesLocationSetting)init;
- (PXLocationStream)locationStream;
- (_PXCompletionHandlerManager)completionHandlerManager;
- (id)_locationForCoordinate:(CLLocationCoordinate2D)a3;
- (unint64_t)locationState;
- (void)_handleLocationAcquisitionUpdate:(id)a3;
- (void)_initiateLocationAcquisitionWithAccuracy:(double)a3;
- (void)_setCoordinate:(CLLocationCoordinate2D)a3;
- (void)_updatePlacemarkForCoordinate:(CLLocationCoordinate2D)a3;
- (void)_updatePlacemarkWithPlacemarks:(id)a3 error:(id)a4;
- (void)didCallLastCompletionHandlerForCompletionHandlerManager:(id)a3;
- (void)requestLocationUpdateWithAccuracy:(double)a3 completionHandler:(id)a4;
- (void)resetToDefault;
- (void)setCompletionHandlerManager:(id)a3;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
- (void)setLocationState:(unint64_t)a3;
- (void)setLocationStream:(id)a3;
- (void)setMonitorsCurrentLocation:(BOOL)a3;
- (void)setPlacemark:(id)a3;
@end

@implementation PXContextualMemoriesLocationSetting

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlerManager, 0);
  objc_storeStrong((id *)&self->_locationStream, 0);
  objc_storeStrong((id *)&self->_placemark, 0);
}

- (BOOL)monitorsCurrentLocation
{
  return self->_monitorsCurrentLocation;
}

- (void)setCompletionHandlerManager:(id)a3
{
}

- (_PXCompletionHandlerManager)completionHandlerManager
{
  return self->_completionHandlerManager;
}

- (void)setLocationStream:(id)a3
{
}

- (PXLocationStream)locationStream
{
  return self->_locationStream;
}

- (void)setLocationState:(unint64_t)a3
{
  self->_locationState = a3;
}

- (unint64_t)locationState
{
  return self->_locationState;
}

- (void)setPlacemark:(id)a3
{
}

- (CLPlacemark)placemark
{
  return self->_placemark;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)requestLocationUpdateWithAccuracy:(double)a3 completionHandler:(id)a4
{
  v9 = (void (**)(void))a4;
  unint64_t v6 = [(PXContextualMemoriesLocationSetting *)self locationState];
  if (v6 - 2 < 2)
  {
    v9[2]();
  }
  else if (v6 == 1)
  {
    v8 = [(PXContextualMemoriesLocationSetting *)self completionHandlerManager];
    [v8 addCompletionHandler:v9];
  }
  else if (!v6)
  {
    v7 = [(PXContextualMemoriesLocationSetting *)self completionHandlerManager];
    [v7 addCompletionHandler:v9];

    [(PXContextualMemoriesLocationSetting *)self _initiateLocationAcquisitionWithAccuracy:a3];
  }
}

- (void)didCallLastCompletionHandlerForCompletionHandlerManager:(id)a3
{
  v4 = [(PXContextualMemoriesLocationSetting *)self locationStream];
  if (v4)
  {
    if ([(PXContextualMemoriesLocationSetting *)self monitorsCurrentLocation])
    {
      v5 = PLMemoriesGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)unint64_t v6 = 0;
        _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEBUG, "[Settings] Will keep monitoring for location changes...", v6, 2u);
      }
    }
    else
    {
      [(PXContextualMemoriesLocationSetting *)self setLocationState:0];
      [v4 setClosed:1];
      [(PXContextualMemoriesLocationSetting *)self setLocationStream:0];
    }
  }
}

- (void)setMonitorsCurrentLocation:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_monitorsCurrentLocation != a3)
  {
    BOOL v3 = a3;
    self->_monitorsCurrentLocation = a3;
    v5 = PLMemoriesGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v6 = @"Disable";
      if (v3) {
        unint64_t v6 = @"Enable";
      }
      int v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEBUG, "[Settings] %@ monitoring of the current location", (uint8_t *)&v9, 0xCu);
    }

    if ([(PXContextualMemoriesLocationSetting *)self locationState] != 3)
    {
      if (v3)
      {
        [(PXContextualMemoriesLocationSetting *)self _initiateLocationAcquisitionWithAccuracy:*MEMORY[0x1E4F1E718]];
      }
      else
      {
        v7 = [(PXContextualMemoriesLocationSetting *)self locationStream];

        if (v7)
        {
          [(PXContextualMemoriesLocationSetting *)self setLocationState:0];
          v8 = [(PXContextualMemoriesLocationSetting *)self completionHandlerManager];
          [v8 callCompletionHandlers];
        }
      }
    }
  }
}

- (void)_updatePlacemarkForCoordinate:(CLLocationCoordinate2D)a3
{
  v4 = -[PXContextualMemoriesLocationSetting _locationForCoordinate:](self, "_locationForCoordinate:", a3.latitude, a3.longitude);
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1E5C8]);
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __69__PXContextualMemoriesLocationSetting__updatePlacemarkForCoordinate___block_invoke;
    v6[3] = &unk_1E5DC1F90;
    objc_copyWeak(&v7, &location);
    [v5 reverseGeocodeLocation:v4 completionHandler:v6];
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __69__PXContextualMemoriesLocationSetting__updatePlacemarkForCoordinate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _updatePlacemarkWithPlacemarks:v6 error:v5];
}

- (void)_updatePlacemarkWithPlacemarks:(id)a3 error:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    v8 = [v6 objectAtIndexedSubscript:0];
    int v9 = PLMemoriesGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = [(CLPlacemark *)v8 px_title];
      uint64_t v11 = [(CLPlacemark *)v8 px_subtitle];
      int v15 = 138412546;
      v16 = v10;
      __int16 v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEBUG, "[Settings] Reverse geocode returned: \"%@\", \"%@\"", (uint8_t *)&v15, 0x16u);
    }
    [(PXContextualMemoriesLocationSetting *)self willChangeValueForKey:@"placemark"];
    placemark = self->_placemark;
    self->_placemark = v8;

    [(PXContextualMemoriesLocationSetting *)self didChangeValueForKey:@"placemark"];
  }
  else
  {
    v13 = PLMemoriesGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [v7 localizedDescription];
      int v15 = 138412290;
      v16 = v14;
      _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_DEFAULT, "[Settings] Reverse geocode failed: \"%@\"", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)resetToDefault
{
  objc_initWeak(&location, self);
  objc_copyWeak(&v2, &location);
  px_dispatch_on_main_queue();
}

void __53__PXContextualMemoriesLocationSetting_resetToDefault__block_invoke(uint64_t a1)
{
  objc_msgSend((id)objc_opt_class(), "_setSimulatedLocationCoordinate:", *MEMORY[0x1E4F1E750], *(double *)(MEMORY[0x1E4F1E750] + 8));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _initiateLocationAcquisitionWithAccuracy:*MEMORY[0x1E4F1E718]];
}

- (CLLocation)location
{
  [(PXContextualMemoriesLocationSetting *)self coordinate];
  return (CLLocation *)-[PXContextualMemoriesLocationSetting _locationForCoordinate:](self, "_locationForCoordinate:");
}

- (id)_locationForCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  if (CLLocationCoordinate2DIsValid(a3)) {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:latitude longitude:longitude];
  }
  else {
    id v5 = 0;
  }
  return v5;
}

- (void)_initiateLocationAcquisitionWithAccuracy:(double)a3
{
  id v5 = [(PXContextualMemoriesLocationSetting *)self locationStream];

  if (!v5)
  {
    -[PXContextualMemoriesLocationSetting _setCoordinate:](self, "_setCoordinate:", *MEMORY[0x1E4F1E750], *(double *)(MEMORY[0x1E4F1E750] + 8));
    id v6 = PLMemoriesGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEBUG, "[Settings] Will attempt to acquire the current location...", (uint8_t *)buf, 2u);
    }

    [(PXContextualMemoriesLocationSetting *)self setLocationState:1];
    objc_initWeak(buf, self);
    id v7 = [PXLocationStream alloc];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __80__PXContextualMemoriesLocationSetting__initiateLocationAcquisitionWithAccuracy___block_invoke;
    v9[3] = &unk_1E5DB1DD8;
    objc_copyWeak(&v10, buf);
    v8 = [(PXLocationStream *)v7 initWithAccuracy:v9 handler:a3];
    [(PXContextualMemoriesLocationSetting *)self setLocationStream:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(buf);
  }
}

void __80__PXContextualMemoriesLocationSetting__initiateLocationAcquisitionWithAccuracy___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleLocationAcquisitionUpdate:v3];
}

- (void)_handleLocationAcquisitionUpdate:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(PXContextualMemoriesLocationSetting *)self locationState] == 3)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXContextualMemoriesLocationSetting.m", 280, @"Invalid parameter not satisfying: %@", @"PXContextualMemoriesLocationStateSimulated != [self locationState]" object file lineNumber description];

    if (!v5) {
      goto LABEL_12;
    }
  }
  else if (!v5)
  {
    goto LABEL_12;
  }
  [v5 coordinate];
  -[PXContextualMemoriesLocationSetting _setCoordinate:](self, "_setCoordinate:");
  if ([(PXContextualMemoriesLocationSetting *)self locationState] == 1)
  {
    [v5 horizontalAccuracy];
    double v7 = v6;
    v8 = PLMemoriesGetLog();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
    if (v7 <= 0.0 || v7 >= 100.0)
    {
      if (v9)
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v5;
        _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEBUG, "[Settings] Did receive location not meeting accuracy goal: %@", buf, 0xCu);
      }
    }
    else
    {
      if (v9)
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v5;
        _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEBUG, "[Settings] Did acquire the current location: %@", buf, 0xCu);
      }

      [(PXContextualMemoriesLocationSetting *)self setLocationState:2];
      v8 = [(PXContextualMemoriesLocationSetting *)self completionHandlerManager];
      [v8 callCompletionHandlers];
    }
  }
LABEL_12:
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  double v6 = PLMemoriesGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    double v7 = objc_msgSend(NSString, "stringWithFormat:", @"<%+.8f,%+.8f>", *(void *)&latitude, *(void *)&longitude);
    *(_DWORD *)buf = 138477827;
    id v10 = v7;
    _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEBUG, "[Settings] Set simulated location coordinate: %{private}@", buf, 0xCu);
  }
  [(PXContextualMemoriesLocationSetting *)self setLocationState:3];
  objc_msgSend((id)objc_opt_class(), "_setSimulatedLocationCoordinate:", latitude, longitude);
  -[PXContextualMemoriesLocationSetting _setCoordinate:](self, "_setCoordinate:", latitude, longitude);
  v8 = [(PXContextualMemoriesLocationSetting *)self completionHandlerManager];
  [v8 callCompletionHandlers];
}

- (void)_setCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  if (self->_coordinate.latitude != a3.latitude || self->_coordinate.longitude != a3.longitude)
  {
    [(PXContextualMemoriesLocationSetting *)self willChangeValueForKey:@"coordinate"];
    self->_coordinate.double latitude = latitude;
    self->_coordinate.double longitude = longitude;
    placemark = self->_placemark;
    self->_placemark = 0;

    -[PXContextualMemoriesLocationSetting _updatePlacemarkForCoordinate:](self, "_updatePlacemarkForCoordinate:", latitude, longitude);
    [(PXContextualMemoriesLocationSetting *)self didChangeValueForKey:@"coordinate"];
  }
}

- (NSString)subtitle
{
  id v2 = [(PXContextualMemoriesLocationSetting *)self placemark];
  id v3 = objc_msgSend(v2, "px_subtitle");

  return (NSString *)v3;
}

- (NSString)title
{
  id v3 = [(PXContextualMemoriesLocationSetting *)self placemark];

  if (v3)
  {
    v4 = [(PXContextualMemoriesLocationSetting *)self placemark];
    uint64_t v5 = objc_msgSend(v4, "px_title");
  }
  else
  {
    if (CLLocationCoordinate2DIsValid(self->_coordinate))
    {
      double v6 = [NSString stringWithFormat:@"%.3f, %.3f", *(void *)&self->_coordinate.latitude, *(void *)&self->_coordinate.longitude];
      goto LABEL_7;
    }
    v4 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v5 = [v4 localizedStringForKey:@"No Location Available" value:&stru_1F00B0030 table:0];
  }
  double v6 = (void *)v5;

LABEL_7:
  return (NSString *)v6;
}

- (NSString)headerTitle
{
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  id v3 = [v2 localizedStringForKey:@"Location" value:&stru_1F00B0030 table:0];

  return (NSString *)v3;
}

- (PXContextualMemoriesLocationSetting)init
{
  v8.receiver = self;
  v8.super_class = (Class)PXContextualMemoriesLocationSetting;
  id v2 = [(PXContextualMemoriesLocationSetting *)&v8 init];
  if (v2)
  {
    [(id)objc_opt_class() _simulatedLocationCoordinate];
    double latitude = v9.latitude;
    double longitude = v9.longitude;
    if (CLLocationCoordinate2DIsValid(v9))
    {
      v2->_coordinate.double latitude = latitude;
      v2->_coordinate.double longitude = longitude;
      v2->_locationState = 3;
      -[PXContextualMemoriesLocationSetting _updatePlacemarkForCoordinate:](v2, "_updatePlacemarkForCoordinate:", latitude, longitude);
    }
    else
    {
      v2->_coordinate = (CLLocationCoordinate2D)*MEMORY[0x1E4F1E750];
      v2->_locationState = 0;
    }
    uint64_t v5 = objc_alloc_init(_PXCompletionHandlerManager);
    completionHandlerManager = v2->_completionHandlerManager;
    v2->_completionHandlerManager = v5;

    [(_PXCompletionHandlerManager *)v2->_completionHandlerManager setDelegate:v2];
  }
  return v2;
}

+ (CLLocationCoordinate2D)_simulatedLocationCoordinate
{
  if (_simulatedLocationCoordinate_predicate != -1) {
    dispatch_once(&_simulatedLocationCoordinate_predicate, &__block_literal_global_28476);
  }
  double v3 = *((double *)&_simulatedLocationCoordinate + 1);
  double v2 = *(double *)&_simulatedLocationCoordinate;
  result.double longitude = v3;
  result.double latitude = v2;
  return result;
}

void __67__PXContextualMemoriesLocationSetting__simulatedLocationCoordinate__block_invoke()
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  _simulatedLocationCoordinate = *MEMORY[0x1E4F1E750];
  v0 = (void *)CFPreferencesCopyAppValue(@"SimulatedCoordinateDate", @"com.apple.mobileslideshow");
  if (v0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v0 doubleValue];
      double v2 = v1;
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      if (v3 - v2 >= 86400.0)
      {
        v4 = PLMemoriesGetLog();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEBUG, "[Settings] Ignoring old simulated location coordinate", buf, 2u);
        }
      }
      else
      {
        v4 = CFPreferencesCopyAppValue(@"SimulatedCoordinateLatitude", @"com.apple.mobileslideshow");
        uint64_t v5 = (void *)CFPreferencesCopyAppValue(@"SimulatedCoordinateLongitude", @"com.apple.mobileslideshow");
        if (v4)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (v5)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v4 doubleValue];
                CLLocationDegrees v7 = v6;
                [v5 doubleValue];
                _simulatedLocationCoordinate = (__int128)CLLocationCoordinate2DMake(v7, v8);
                CLLocationCoordinate2D v9 = PLMemoriesGetLog();
                if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
                {
                  id v10 = objc_msgSend(NSString, "stringWithFormat:", @"<%+.8f,%+.8f>", _simulatedLocationCoordinate);
                  *(_DWORD *)buf = 138477827;
                  id v12 = v10;
                  _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "[Settings] Restoring simulated location coordinate: %{private}@", buf, 0xCu);
                }
              }
            }
          }
        }
      }
    }
  }
}

+ (void)_setSimulatedLocationCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (*(double *)&_simulatedLocationCoordinate != a3.latitude
    || *((double *)&_simulatedLocationCoordinate + 1) != a3.longitude)
  {
    _simulatedLocationCoordinate = (__int128)a3;
    if (CLLocationCoordinate2DIsValid(a3))
    {
      double v6 = NSNumber;
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      CLLocationDegrees v7 = objc_msgSend(v6, "numberWithDouble:");
      CLLocationDegrees v8 = [NSNumber numberWithDouble:latitude];
      CLLocationCoordinate2D v9 = [NSNumber numberWithDouble:longitude];
      id v10 = PLMemoriesGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"<%+.8f,%+.8f>", *(void *)&latitude, *(void *)&longitude);
        *(_DWORD *)buf = 138477827;
        uint64_t v13 = v11;
        _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEBUG, "[Settings] Storing simulated location coordinate: %{private}@", buf, 0xCu);
      }
    }
    else
    {
      CLLocationCoordinate2D v9 = 0;
      CLLocationDegrees v8 = 0;
      CLLocationDegrees v7 = 0;
    }
    CFPreferencesSetAppValue(@"SimulatedCoordinateDate", v7, @"com.apple.mobileslideshow");
    CFPreferencesSetAppValue(@"SimulatedCoordinateLatitude", v8, @"com.apple.mobileslideshow");
    CFPreferencesSetAppValue(@"SimulatedCoordinateLongitude", v9, @"com.apple.mobileslideshow");
  }
}

+ (id)keyPathsForValuesAffectingSubtitle
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F02D35B0];
}

+ (id)keyPathsForValuesAffectingTitle
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F02D3598];
}

+ (id)keyPathsForValuesAffectingPlacemark
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F02D3580];
}

+ (BOOL)automaticallyNotifiesObserversOfCoordinate
{
  return 0;
}

@end