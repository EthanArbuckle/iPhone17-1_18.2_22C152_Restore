@interface MNLocationManager
+ (id)sharedLocationManager;
- (BOOL)_hasLocationAssertion;
- (BOOL)coarseModeEnabled;
- (BOOL)isHeadingServicesAvailable;
- (BOOL)locationProviderShouldPauseLocationUpdates:(id)a3;
- (CLHeading)heading;
- (MNLocation)lastLocation;
- (MNLocationManager)init;
- (MNLocationProvider)locationProvider;
- (MNLocationRecorder)locationRecorder;
- (NSBundle)effectiveBundle;
- (NSString)effectiveBundleIdentifier;
- (double)expectedGpsUpdateInterval;
- (double)timeScale;
- (id)locationCorrector;
- (int)headingOrientation;
- (unint64_t)locationProviderType;
- (void)_clearLocationAssertion;
- (void)_createLocationAssertion;
- (void)_reportLocationFailureWithError:(id)a3;
- (void)_reportLocationReset;
- (void)_reportLocationStatus:(SEL)a3;
- (void)_reportLocationSuccess;
- (void)_reset;
- (void)_setTrackingHeading:(BOOL)a3;
- (void)_setTrackingLocation:(BOOL)a3;
- (void)_shiftLocationIfNecessary:(id)a3 handler:(id)a4;
- (void)_updateForNewShiftedLocation:(id)a3 rawLocation:(id)a4;
- (void)addLocationListener:(id)a3;
- (void)dealloc;
- (void)locationProvider:(id)a3 didEnterRegion:(id)a4;
- (void)locationProvider:(id)a3 didExitRegion:(id)a4;
- (void)locationProvider:(id)a3 didReceiveError:(id)a4;
- (void)locationProvider:(id)a3 didUpdateHeading:(id)a4;
- (void)locationProvider:(id)a3 didUpdateLocation:(id)a4;
- (void)locationProvider:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5;
- (void)locationProviderDidChangeAuthorizationStatus:(id)a3;
- (void)locationProviderDidPauseLocationUpdates:(id)a3;
- (void)locationProviderDidResumeLocationUpdates:(id)a3;
- (void)pushLocation:(id)a3;
- (void)removeLocationAccessFor:(id)a3;
- (void)removeLocationAccessForAll;
- (void)removeLocationListener:(id)a3;
- (void)requestLocationAccessFor:(id)a3;
- (void)resourceManifestManager:(id)a3 didChangeActiveTileGroup:(id)a4 fromOldTileGroup:(id)a5;
- (void)setEffectiveBundle:(id)a3;
- (void)setEffectiveBundleIdentifier:(id)a3;
- (void)setHeadingOrientation:(int)a3;
- (void)setLastLocation:(id)a3;
- (void)setLocationCorrector:(id)a3;
- (void)setLocationProvider:(id)a3;
- (void)setLocationProviderType:(unint64_t)a3;
- (void)setLocationRecorder:(id)a3;
- (void)startHeadingUpdateWithObserver:(id)a3;
- (void)startLocationUpdateWithObserver:(id)a3;
- (void)startMonitoringForRegion:(id)a3;
- (void)stop;
- (void)stopHeadingUpdateWithObserver:(id)a3;
- (void)stopLocationUpdateWithObserver:(id)a3;
- (void)stopMonitoringForRegion:(id)a3;
- (void)useGPSLocationProviderWithCLParameters:(id)a3;
- (void)useHybridLocationProvider;
- (void)useSimulationLocationProvider:(id)a3;
- (void)useTraceLocationProvider:(id)a3;
@end

@implementation MNLocationManager

+ (id)sharedLocationManager
{
  if (qword_1EB59C1E0 != -1) {
    dispatch_once(&qword_1EB59C1E0, &__block_literal_global_30);
  }
  v2 = (void *)_MergedGlobals_35;
  return v2;
}

uint64_t __42__MNLocationManager_sharedLocationManager__block_invoke()
{
  v0 = objc_alloc_init(MNLocationManager);
  uint64_t v1 = _MergedGlobals_35;
  _MergedGlobals_35 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (MNLocationManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)MNLocationManager;
  v2 = [(MNLocationManager *)&v11 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    observersLock = v2->_observersLock;
    v2->_observersLock = v3;

    v5 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    lastLocationLock = v2->_lastLocationLock;
    v2->_lastLocationLock = v5;

    v7 = (GEOLocationShifter *)objc_alloc_init(MEMORY[0x1E4F64670]);
    locationShifter = v2->_locationShifter;
    v2->_locationShifter = v7;

    v2->_locationProviderType = 0;
    v9 = [MEMORY[0x1E4F64918] modernManager];
    [v9 addTileGroupObserver:v2 queue:MEMORY[0x1E4F14428]];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F64918] modernManager];
  [v3 removeTileGroupObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MNLocationManager;
  [(MNLocationManager *)&v4 dealloc];
}

- (void)setLocationCorrector:(id)a3
{
  if (self->_locationCorrector != a3)
  {
    objc_super v4 = (void *)[a3 copy];
    id locationCorrector = self->_locationCorrector;
    self->_id locationCorrector = v4;

    v6 = [(MNLocationManager *)self lastLocation];
    if (v6)
    {
      v7 = (void (**)(id, void *))self->_locationCorrector;
      if (v7)
      {
        v8 = v7[2](v7, v6);
        [(MNLocationManager *)self setLastLocation:v8];
LABEL_7:

        goto LABEL_8;
      }
      if (([v6 isMemberOfClass:objc_opt_class()] & 1) == 0)
      {
        id v9 = objc_alloc(MEMORY[0x1E4F1E5F0]);
        [v6 clientLocation];
        v10 = [v6 coarseMetaData];
        v8 = (void *)[v9 initWithClientLocation:v12 coarseMetaData:v10];

        objc_super v11 = [[MNLocation alloc] initWithRawLocation:v8];
        [(MNLocationManager *)self setLastLocation:v11];

        goto LABEL_7;
      }
    }
LABEL_8:
  }
}

- (NSString)effectiveBundleIdentifier
{
  return (NSString *)[(MNLocationProvider *)self->_locationProvider effectiveBundleIdentifier];
}

- (void)setEffectiveBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_effectiveBundleIdentifier, a3);
  id v5 = a3;
  [(MNLocationProvider *)self->_locationProvider setEffectiveBundleIdentifier:v5];
}

- (NSBundle)effectiveBundle
{
  return (NSBundle *)[(MNLocationProvider *)self->_locationProvider effectiveBundle];
}

- (void)setEffectiveBundle:(id)a3
{
  objc_storeStrong((id *)&self->_effectiveBundle, a3);
  id v5 = a3;
  [(MNLocationProvider *)self->_locationProvider setEffectiveBundle:v5];
}

- (BOOL)isHeadingServicesAvailable
{
  return [MEMORY[0x1E4F1E600] headingAvailable];
}

- (MNLocation)lastLocation
{
  [(NSLock *)self->_lastLocationLock lock];
  v3 = self->_lastLocation;
  [(NSLock *)self->_lastLocationLock unlock];
  return v3;
}

- (void)setLastLocation:(id)a3
{
  id v5 = (MNLocation *)a3;
  [(NSLock *)self->_lastLocationLock lock];
  if (self->_lastLocation != v5)
  {
    objc_storeStrong((id *)&self->_lastLocation, a3);
    [(CLLocation *)self->_lastLocation _navigation_setGtLog:1];
  }
  [(NSLock *)self->_lastLocationLock unlock];
}

- (BOOL)coarseModeEnabled
{
  return [(MNLocationProvider *)self->_locationProvider coarseModeEnabled];
}

- (double)expectedGpsUpdateInterval
{
  return self->_expectedGpsUpdateInterval;
}

- (double)timeScale
{
  v2 = [(MNLocationManager *)self locationProvider];
  [v2 timeScale];
  double v4 = v3;

  return v4;
}

- (int)headingOrientation
{
  v2 = [(MNLocationManager *)self locationProvider];
  int v3 = [v2 headingOrientation];

  return v3;
}

- (void)setHeadingOrientation:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(MNLocationManager *)self locationProvider];
  [v4 setHeadingOrientation:v3];
}

- (void)addLocationListener:(id)a3
{
  id v7 = a3;
  [(NSLock *)self->_observersLock lock];
  locationListeners = self->_locationListeners;
  if (!locationListeners)
  {
    id v5 = (NSHashTable *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:514 capacity:5];
    v6 = self->_locationListeners;
    self->_locationListeners = v5;

    locationListeners = self->_locationListeners;
  }
  if (![(NSHashTable *)locationListeners containsObject:v7]) {
    [(NSHashTable *)self->_locationListeners addObject:v7];
  }
  [(NSLock *)self->_observersLock unlock];
}

- (void)removeLocationListener:(id)a3
{
  observersLock = self->_observersLock;
  id v5 = a3;
  [(NSLock *)observersLock lock];
  [(NSHashTable *)self->_locationListeners removeObject:v5];

  v6 = self->_observersLock;
  [(NSLock *)v6 unlock];
}

- (void)setLocationProviderType:(unint64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_locationProviderType != a3)
  {
    if (a3 > 4) {
      id v5 = 0;
    }
    else {
      id v5 = off_1E60FACE8[a3];
    }
    v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 138477827;
      v8 = v5;
      _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEBUG, "MNLocationManager setting provider type to [%{private}@]", (uint8_t *)&v7, 0xCu);
    }

    self->_locationProviderType = a3;
  }
}

- (void)setLocationProvider:(id)a3
{
  id v5 = (MNLocationProvider *)a3;
  p_locationProvider = (id *)&self->_locationProvider;
  locationProvider = self->_locationProvider;
  if (locationProvider != v5)
  {
    v10 = v5;
    if (locationProvider)
    {
      [(MNLocationManager *)self _setTrackingLocation:0];
      v8 = self->_locationProvider;
    }
    else
    {
      v8 = 0;
    }
    if (self->_trackingHeading)
    {
      [(MNLocationProvider *)v8 stopUpdatingHeading];
      v8 = (MNLocationProvider *)*p_locationProvider;
    }
    self->_expectedGpsUpdateInterval = 0.0;
    [(MNLocationProvider *)v8 setDelegate:0];
    uint64_t v9 = self->_locationProvider;
    self->_locationProvider = 0;

    [(MNLocationManager *)self setLastLocation:0];
    id v5 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&self->_locationProvider, a3);
      [(MNLocationProvider *)self->_locationProvider setEffectiveBundle:self->_effectiveBundle];
      [(MNLocationProvider *)self->_locationProvider setEffectiveBundleIdentifier:self->_effectiveBundleIdentifier];
      [(MNLocationProvider *)self->_locationProvider setDelegate:self];
      [(MNLocationManager *)self _setTrackingLocation:1];
      id v5 = v10;
      if (self->_trackingHeading)
      {
        [*p_locationProvider startUpdatingHeading];
        id v5 = v10;
      }
    }
  }
}

- (void)stop
{
  [(MNLocationManager *)self setLocationProviderType:0];
  [(MNLocationManager *)self setLocationProvider:0];
  [(MNLocationManager *)self setLastLocation:0];
  heading = self->_heading;
  self->_heading = 0;
}

- (void)useGPSLocationProviderWithCLParameters:(id)a3
{
  id v4 = a3;
  [(MNLocationManager *)self setLocationProviderType:1];
  id v5 = objc_alloc_init(MNCoreLocationProvider);
  [(MNLocationManager *)self setLocationProvider:v5];
  [(MNCoreLocationProvider *)v5 setCLParameters:v4];
}

- (void)useHybridLocationProvider
{
  [(MNLocationManager *)self setLocationProviderType:2];
  uint64_t v3 = objc_alloc_init(MNHybridLocationProvider);
  [(MNLocationManager *)self setLocationProvider:v3];
}

- (void)useTraceLocationProvider:(id)a3
{
  id v4 = a3;
  [(MNLocationManager *)self setLocationProviderType:3];
  [(MNLocationManager *)self setLocationProvider:v4];
}

- (void)useSimulationLocationProvider:(id)a3
{
  id v4 = a3;
  [(MNLocationManager *)self setLocationProviderType:4];
  [(MNLocationManager *)self setLocationProvider:v4];
}

- (void)startLocationUpdateWithObserver:(id)a3
{
  id v11 = a3;
  [(NSLock *)self->_observersLock lock];
  locationObservers = self->_locationObservers;
  if (locationObservers)
  {
    BOOL v5 = [(NSHashTable *)locationObservers containsObject:v11];
    v6 = self->_locationObservers;
    if (v6) {
      goto LABEL_6;
    }
  }
  else
  {
    BOOL v5 = 0;
  }
  int v7 = (NSHashTable *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:514 capacity:5];
  v8 = self->_locationObservers;
  self->_locationObservers = v7;

  v6 = self->_locationObservers;
LABEL_6:
  if (![(NSHashTable *)v6 containsObject:v11]) {
    [(NSHashTable *)self->_locationObservers addObject:v11];
  }
  [(NSLock *)self->_observersLock unlock];
  if (!v5)
  {
    if (self->_trackingLocation)
    {
      uint64_t v9 = [(MNLocationManager *)self lastLocation];

      if (v9) {
        [v11 locationManagerUpdatedLocation:self];
      }
    }
    else
    {
      [(MNLocationManager *)self _setTrackingLocation:1];
    }
  }
  if (([(MNLocationProvider *)self->_locationProvider isAuthorized] & 1) == 0)
  {
    v10 = objc_msgSend(MEMORY[0x1E4F28C58], "_navigation_errorWithCode:", 18);
    [(MNLocationManager *)self _reportLocationFailureWithError:v10];
  }
}

- (void)stopLocationUpdateWithObserver:(id)a3
{
  id v5 = a3;
  [(NSLock *)self->_observersLock lock];
  if ([(NSHashTable *)self->_locationObservers containsObject:v5])
  {
    [(NSHashTable *)self->_locationObservers removeObject:v5];
    NSUInteger v4 = [(NSHashTable *)self->_locationObservers count];
    [(NSLock *)self->_observersLock unlock];
    if (!v4) {
      [(MNLocationManager *)self _setTrackingLocation:0];
    }
  }
  else
  {
    [(NSLock *)self->_observersLock unlock];
  }
}

- (void)startHeadingUpdateWithObserver:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(MNLocationManager *)self isHeadingServicesAvailable])
  {
    v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315906;
      v10 = "-[MNLocationManager startHeadingUpdateWithObserver:]";
      __int16 v11 = 2080;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/MNLocationManager.m";
      __int16 v13 = 1024;
      int v14 = 353;
      __int16 v15 = 2080;
      v16 = "self.isHeadingServicesAvailable";
      _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", (uint8_t *)&v9, 0x26u);
    }
  }
  headingObservers = self->_headingObservers;
  if (!headingObservers)
  {
    v6 = (NSHashTable *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:514 capacity:5];
    int v7 = self->_headingObservers;
    self->_headingObservers = v6;

    headingObservers = self->_headingObservers;
  }
  if (![(NSHashTable *)headingObservers containsObject:v4])
  {
    [(NSHashTable *)self->_headingObservers addObject:v4];
    [(MNLocationManager *)self _setTrackingHeading:1];
  }
}

- (void)stopHeadingUpdateWithObserver:(id)a3
{
  id v4 = a3;
  if (-[NSHashTable containsObject:](self->_headingObservers, "containsObject:"))
  {
    [(NSHashTable *)self->_headingObservers removeObject:v4];
    if (![(NSHashTable *)self->_headingObservers count]) {
      [(MNLocationManager *)self _setTrackingHeading:0];
    }
  }
}

- (void)pushLocation:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      id v10 = v4;
      _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "Pushing external location: %{private}@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __34__MNLocationManager_pushLocation___block_invoke;
    v6[3] = &unk_1E60FAC78;
    objc_copyWeak(&v8, (id *)buf);
    id v7 = v4;
    [(MNLocationManager *)self _shiftLocationIfNecessary:v7 handler:v6];

    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);
  }
}

void __34__MNLocationManager_pushLocation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _updateForNewShiftedLocation:v4 rawLocation:*(void *)(a1 + 32)];
}

- (void)_createLocationAssertion
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!self->_locationAssertion)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F1E5E8];
    id v4 = [NSString stringWithFormat:@"Location access requested for: %@", self->_accessRequesters];
    id v5 = (CLInUseAssertion *)[v3 newAssertionForBundleIdentifier:@"com.apple.Maps" withReason:v4];
    locationAssertion = self->_locationAssertion;
    self->_locationAssertion = v5;

    id v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v8 = self->_locationAssertion;
      *(_DWORD *)buf = 138477827;
      id v10 = v8;
      _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_DEBUG, "Creating location assertion. Assertion object: %{private}@", buf, 0xCu);
    }
  }
}

- (void)_clearLocationAssertion
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_locationAssertion)
  {
    uint64_t v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      locationAssertion = self->_locationAssertion;
      int v6 = 138477827;
      id v7 = locationAssertion;
      _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEBUG, "Invalidating location assertion: %{private}@", (uint8_t *)&v6, 0xCu);
    }

    [(CLInUseAssertion *)self->_locationAssertion invalidate];
    id v5 = self->_locationAssertion;
    self->_locationAssertion = 0;
  }
}

- (BOOL)_hasLocationAssertion
{
  return self->_locationAssertion != 0;
}

- (void)requestLocationAccessFor:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138477827;
      id v10 = v4;
      _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEBUG, "Location access requested by %{private}@", (uint8_t *)&v9, 0xCu);
    }

    accessRequesters = self->_accessRequesters;
    if (!accessRequesters)
    {
      id v7 = (NSHashTable *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:1];
      uint64_t v8 = self->_accessRequesters;
      self->_accessRequesters = v7;

      accessRequesters = self->_accessRequesters;
    }
    [(NSHashTable *)accessRequesters addObject:v4];
    [(MNLocationManager *)self _createLocationAssertion];
  }
}

- (void)removeLocationAccessFor:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    accessRequesters = self->_accessRequesters;
    if (accessRequesters)
    {
      if ([(NSHashTable *)accessRequesters containsObject:v4])
      {
        int v6 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          int v7 = 138477827;
          id v8 = v4;
          _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEBUG, "Location access released for %{private}@", (uint8_t *)&v7, 0xCu);
        }

        [(NSHashTable *)self->_accessRequesters removeObject:v4];
      }
      if (![(NSHashTable *)self->_accessRequesters count]) {
        [(MNLocationManager *)self _clearLocationAssertion];
      }
    }
  }
}

- (void)removeLocationAccessForAll
{
  uint64_t v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEBUG, "Location access released for all", v4, 2u);
  }

  [(NSHashTable *)self->_accessRequesters removeAllObjects];
  [(MNLocationManager *)self _clearLocationAssertion];
}

- (void)startMonitoringForRegion:(id)a3
{
}

- (void)stopMonitoringForRegion:(id)a3
{
}

- (void)_reset
{
  if (self->_trackingLocation)
  {
    [(MNLocationManager *)self setLastLocation:0];
    [(MNLocationManager *)self _reportLocationReset];
  }
}

- (void)_setTrackingLocation:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_trackingLocation != a3)
  {
    if (a3)
    {
      self->_trackingLocation = 1;
      [(MNLocationProvider *)self->_locationProvider startUpdatingLocation];
      [(MNLocationProvider *)self->_locationProvider expectedGpsUpdateInterval];
      self->_expectedGpsUpdateInterval = v4;
    }
    else
    {
      locationProvider = self->_locationProvider;
      if (!locationProvider)
      {
        int v6 = [NSString stringWithFormat:@"location provider should be non nil"];
        int v7 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          int v8 = 136316162;
          uint64_t v9 = "-[MNLocationManager _setTrackingLocation:]";
          __int16 v10 = 2080;
          uint64_t v11 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/MNLocationManager.m";
          __int16 v12 = 1024;
          int v13 = 489;
          __int16 v14 = 2080;
          __int16 v15 = "_locationProvider != NULL";
          __int16 v16 = 2112;
          uint64_t v17 = v6;
          _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v8, 0x30u);
        }

        locationProvider = self->_locationProvider;
      }
      self->_expectedGpsUpdateInterval = 0.0;
      [(MNLocationProvider *)locationProvider stopUpdatingLocation];
      self->_trackingLocation = 0;
    }
  }
}

- (void)_setTrackingHeading:(BOOL)a3
{
  if (self->_trackingHeading != a3)
  {
    BOOL v3 = a3;
    id v5 = [(MNLocationManager *)self locationProvider];
    int v6 = v5;
    if (v3)
    {
      [v5 startUpdatingHeading];
      LOBYTE(v3) = 1;
    }
    else
    {
      [v5 stopUpdatingHeading];
    }

    self->_trackingHeading = v3;
  }
}

- (void)_shiftLocationIfNecessary:(id)a3 handler:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    goto LABEL_22;
  }
  int v8 = MNGetPuckTrackingLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [v6 uuid];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_INFO, "[MN] [%@] - Processing - in MNLocationManager::_shiftLocationIfNecessary:handler:", (uint8_t *)&buf, 0xCu);
  }
  [v6 coordinate];
  double v11 = v10;
  double v13 = v12;
  [v6 rawCoordinate];
  double v15 = v14;
  double v17 = v16;
  if (![(MNLocationProvider *)self->_locationProvider isTracePlayer]
    || (unint64_t)[(MNLocationProvider *)self->_locationProvider traceVersion] > 0x30)
  {
    if ([v6 referenceFrame] == 2)
    {
      int v19 = 0;
      if (v6) {
        goto LABEL_9;
      }
    }
    else
    {
      int v19 = objc_msgSend(MEMORY[0x1E4F64670], "isLocationShiftRequiredForCoordinate:", v11, v13);
      if (v6)
      {
LABEL_9:
        [v6 clientLocation];
        if (v56[2] == 2)
        {
          [v6 rawCoordinate];
          objc_msgSend(v6, "setRawShiftedCoordinate:");
          int v18 = 0;
          goto LABEL_14;
        }
LABEL_13:
        int v18 = objc_msgSend(MEMORY[0x1E4F64670], "isLocationShiftRequiredForCoordinate:", v15, v17);
        goto LABEL_14;
      }
    }
    long long v55 = 0u;
    memset(v56, 0, sizeof(v56));
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v48 = 0u;
    goto LABEL_13;
  }
  int v18 = objc_msgSend(MEMORY[0x1E4F64670], "isLocationShiftRequiredForCoordinate:", v15, v17);
  int v19 = 0;
LABEL_14:
  if (v19 & 1) != 0 || (v18)
  {
    dispatch_group_t v20 = dispatch_group_create();
    v21 = v20;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v58 = 0x3010000000;
    v59 = &unk_1B5572251;
    double v60 = v11;
    double v61 = v13;
    if (v19)
    {
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __55__MNLocationManager__shiftLocationIfNecessary_handler___block_invoke_62;
      v45[3] = &unk_1E60FACA0;
      p_long long buf = &buf;
      v22 = v20;
      v46 = v22;
      v23 = (void *)MEMORY[0x1BA99B3A0](v45);
      dispatch_group_enter(v22);
      locationShifter = self->_locationShifter;
      [v6 horizontalAccuracy];
      double v26 = v25;
      uint64_t v27 = MEMORY[0x1E4F14428];
      id v28 = MEMORY[0x1E4F14428];
      -[GEOLocationShifter shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:](locationShifter, "shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v23, 0, &__block_literal_global_61_1, v27, v11, v13, v26);
    }
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x3010000000;
    v44[3] = &unk_1B5572251;
    *(double *)&v44[4] = v15;
    *(double *)&v44[5] = v17;
    if (v18)
    {
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __55__MNLocationManager__shiftLocationIfNecessary_handler___block_invoke_2;
      v41[3] = &unk_1E60FACA0;
      v43 = v44;
      v29 = v21;
      v42 = v29;
      v30 = (void *)MEMORY[0x1BA99B3A0](v41);
      dispatch_group_enter(v29);
      v31 = self->_locationShifter;
      [v6 horizontalAccuracy];
      double v33 = v32;
      uint64_t v34 = MEMORY[0x1E4F14428];
      id v35 = MEMORY[0x1E4F14428];
      -[GEOLocationShifter shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:](v31, "shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v30, 0, &__block_literal_global_61_1, v34, v15, v17, v33);
    }
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __55__MNLocationManager__shiftLocationIfNecessary_handler___block_invoke_3;
    v36[3] = &unk_1E60FACC8;
    id v37 = v6;
    v39 = &buf;
    v40 = v44;
    id v38 = v7;
    dispatch_group_notify(v21, MEMORY[0x1E4F14428], v36);

    _Block_object_dispose(v44, 8);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    (*((void (**)(id, id))v7 + 2))(v7, v6);
  }
LABEL_22:
}

void __55__MNLocationManager__shiftLocationIfNecessary_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_ERROR, "Unable to shift location with error: %@", (uint8_t *)&v4, 0xCu);
  }
}

void __55__MNLocationManager__shiftLocationIfNecessary_handler___block_invoke_62(uint64_t a1, double a2, double a3)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  *(double *)(v3 + 32) = a2;
  *(double *)(v3 + 40) = a3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __55__MNLocationManager__shiftLocationIfNecessary_handler___block_invoke_2(uint64_t a1, double a2, double a3)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  *(double *)(v3 + 32) = a2;
  *(double *)(v3 + 40) = a3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __55__MNLocationManager__shiftLocationIfNecessary_handler___block_invoke_3(uint64_t a1)
{
  long long v24 = 0u;
  memset(v25, 0, 28);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  memset(&v18[2], 0, 32);
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    [v2 clientLocation];
    id v2 = *(void **)(a1 + 32);
  }
  *(_OWORD *)((char *)&v18[2] + 4) = *(_OWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 32);
  *(void *)((char *)v25 + 4) = 0x200000002;
  uint64_t v3 = [v2 matchInfo];

  int v4 = [MNLocation alloc];
  id v5 = *(void **)(a1 + 32);
  if (v3)
  {
    uint64_t v6 = [v5 matchInfo];
    long long v16 = v23;
    long long v17 = v24;
    v18[0] = v25[0];
    *(_OWORD *)((char *)v18 + 12) = *(_OWORD *)((char *)v25 + 12);
    long long v12 = v19;
    long long v13 = v20;
    long long v14 = v21;
    long long v15 = v22;
    long long v10 = v18[2];
    long long v11 = v18[3];
    uint64_t v7 = [(MNLocation *)v4 initWithClientLocation:&v10 matchInfo:v6];
  }
  else
  {
    uint64_t v6 = [v5 coarseMetaData];
    long long v16 = v23;
    long long v17 = v24;
    v18[0] = v25[0];
    *(_OWORD *)((char *)v18 + 12) = *(_OWORD *)((char *)v25 + 12);
    long long v12 = v19;
    long long v13 = v20;
    long long v14 = v21;
    long long v15 = v22;
    long long v10 = v18[2];
    long long v11 = v18[3];
    uint64_t v7 = [(MNLocation *)v4 initWithClientLocation:&v10 coarseMetaData:v6];
  }
  int v8 = (void *)v7;

  objc_msgSend(v8, "setRawShiftedCoordinate:", *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  if (GEOConfigGetBOOL())
  {
    uint64_t v9 = [*(id *)(a1 + 32) uuid];
    [v8 setUuid:v9];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_updateForNewShiftedLocation:(id)a3 rawLocation:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = MNGetPuckTrackingLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [v6 uuid];
    int v14 = 138412290;
    long long v15 = v9;
    _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_INFO, "[MN] [%@] - Processing - in MNLocationManager::_updateForNewShiftedLocation:rawLocation:", (uint8_t *)&v14, 0xCu);
  }
  id v10 = v6;
  long long v11 = v10;
  if (self->_locationCorrector)
  {
    long long v12 = MNGetPuckTrackingLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      long long v13 = [v10 uuid];
      int v14 = 138412290;
      long long v15 = v13;
      _os_log_impl(&dword_1B542B000, v12, OS_LOG_TYPE_INFO, "[MN] [%@] - Processing - calling _locationCorrector()", (uint8_t *)&v14, 0xCu);
    }
    long long v11 = (*((void (**)(void))self->_locationCorrector + 2))();
  }
  [(MNLocationRecorder *)self->_locationRecorder recordLocation:v11 rawLocation:v7];
  if (v11)
  {
    objc_msgSend(v11, "_navigation_setGtLog:", 1);
    [(MNLocationManager *)self setLastLocation:v11];
    [(MNLocationManager *)self _reportLocationSuccess];
  }
}

- (void)_reportLocationSuccess
{
}

- (void)_reportLocationFailureWithError:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSLock *)self->_observersLock lock];
  id v5 = [(NSHashTable *)self->_locationObservers allObjects];
  id v6 = (void *)[v5 copy];

  id v7 = [(NSHashTable *)self->_locationListeners allObjects];
  int v8 = (void *)[v7 copy];

  [(NSLock *)self->_observersLock unlock];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v23 + 1) + 8 * v13++) locationManagerFailedToUpdateLocation:self withError:v4];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v11);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v14 = v8;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v18++), "locationManagerFailedToUpdateLocation:withError:", self, v4, (void)v19);
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v16);
  }
}

- (void)_reportLocationReset
{
}

- (void)_reportLocationStatus:(SEL)a3
{
  [(NSLock *)self->_observersLock lock];
  id v5 = [(NSHashTable *)self->_locationObservers allObjects];
  id v8 = (id)[v5 copy];

  id v6 = [(NSHashTable *)self->_locationListeners allObjects];
  id v7 = (void *)[v6 copy];

  [(NSLock *)self->_observersLock unlock];
  [v8 makeObjectsPerformSelector:a3 withObject:self];
  [v7 makeObjectsPerformSelector:a3 withObject:self];
}

- (void)locationProvider:(id)a3 didUpdateLocation:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = MNGetPuckTrackingLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [v7 uuid];
    *(_DWORD *)long long buf = 138412290;
    id v25 = v9;
    _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_INFO, "[MN] [%@] - Processing - in MNLocationManager::didUpdateLocation:", buf, 0xCu);
  }
  uint64_t v10 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138477827;
    id v25 = v7;
    _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_DEFAULT, "Received location from location provider: %{private}@", buf, 0xCu);
  }

  if ([(MNLocationProvider *)self->_locationProvider isAuthorized])
  {
    if (v7)
    {
      [v7 coordinate];
      if (v11 == 0.0 && ([v7 coordinate], v12 == 0.0)
        || ([v7 rawCoordinate], v13 == 0.0) && (objc_msgSend(v7, "rawCoordinate"), v14 == 0.0))
      {
        [(MNLocationRecorder *)self->_locationRecorder recordLocation:v7 rawLocation:v7];
      }
      else
      {
        if (!self->_trackingLocation)
        {
          uint64_t v16 = [(MNLocationManager *)self locationProvider];
          [v16 stopUpdatingLocation];
        }
        [v7 course];
        if (v17 < 0.0)
        {
          uint64_t v18 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_1B542B000, v18, OS_LOG_TYPE_INFO, "Location quality: course is < 0", buf, 2u);
          }
        }
        [v7 speed];
        if (v19 < 0.0)
        {
          long long v20 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_1B542B000, v20, OS_LOG_TYPE_INFO, "Location quality: speed is < 0", buf, 2u);
          }
        }
        objc_initWeak((id *)buf, self);
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __56__MNLocationManager_locationProvider_didUpdateLocation___block_invoke;
        v21[3] = &unk_1E60FAC78;
        objc_copyWeak(&v23, (id *)buf);
        id v22 = v7;
        [(MNLocationManager *)self _shiftLocationIfNecessary:v22 handler:v21];

        objc_destroyWeak(&v23);
        objc_destroyWeak((id *)buf);
      }
    }
    else
    {
      uint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F1E6C8] code:0 userInfo:0];
      [(MNLocationManager *)self locationProvider:v6 didReceiveError:v15];
    }
  }
}

void __56__MNLocationManager_locationProvider_didUpdateLocation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _updateForNewShiftedLocation:v4 rawLocation:*(void *)(a1 + 32)];
}

- (void)locationProvider:(id)a3 didReceiveError:(id)a4
{
  id v6 = a4;
  id v5 = [(MNLocationManager *)self locationRecorder];
  [v5 recordError:v6];

  [(MNLocationManager *)self _reportLocationFailureWithError:v6];
}

- (void)locationProvider:(id)a3 didUpdateHeading:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(MNLocationManager *)self locationRecorder];
  [v6 trueHeading];
  double v9 = v8;
  [v6 magneticHeading];
  double v11 = v10;
  [v6 headingAccuracy];
  double v13 = v12;
  double v14 = [v6 timestamp];
  [v7 recordCompassHeading:v14 magneticHeading:v9 accuracy:v11 timestamp:v13];

  objc_storeStrong((id *)&self->_heading, a4);
  uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v16 = v15;
  if (!self->_lastUpdatedHeadingDate || (objc_msgSend(v15, "timeIntervalSinceDate:"), v17 > 0.05))
  {
    objc_storeStrong((id *)&self->_lastUpdatedHeadingDate, v16);
    uint64_t v18 = [(NSHashTable *)self->_headingObservers allObjects];
    double v19 = (void *)[v18 copy];

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v20 = v19;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v26;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v26 != v23) {
            objc_enumerationMutation(v20);
          }
          objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v24++), "locationManagerUpdatedHeading:", self, (void)v25);
        }
        while (v22 != v24);
        uint64_t v22 = [v20 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v22);
    }
  }
}

- (void)locationProviderDidChangeAuthorizationStatus:(id)a3
{
  if (([(MNLocationProvider *)self->_locationProvider isAuthorized] & 1) == 0)
  {
    [(MNLocationManager *)self _reset];
  }
}

- (BOOL)locationProviderShouldPauseLocationUpdates:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  [(NSLock *)self->_observersLock lock];
  id v4 = [(NSHashTable *)self->_locationObservers allObjects];
  id v5 = (void *)[v4 copy];

  id v6 = [(NSHashTable *)self->_locationListeners allObjects];
  id v7 = (void *)[v6 copy];

  [(NSLock *)self->_observersLock unlock];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        if (![*(id *)(*((void *)&v24 + 1) + 8 * i) locationManagerShouldPauseLocationUpdates:self])
        {
          BOOL v18 = 0;
          id v13 = v8;
          goto LABEL_21;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v13 = v7;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    while (2)
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * j), "locationManagerShouldPauseLocationUpdates:", self, (void)v20))
        {
          BOOL v18 = 0;
          goto LABEL_21;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
      BOOL v18 = 1;
      if (v15) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v18 = 1;
  }
LABEL_21:

  return v18;
}

- (void)locationProviderDidPauseLocationUpdates:(id)a3
{
  id v4 = [(MNLocationManager *)self locationRecorder];
  [v4 recordLocationUpdatePause];

  [(NSLock *)self->_observersLock lock];
  id v5 = [(NSHashTable *)self->_locationObservers allObjects];
  id v8 = (id)[v5 copy];

  id v6 = [(NSHashTable *)self->_locationListeners allObjects];
  id v7 = (void *)[v6 copy];

  [(NSLock *)self->_observersLock unlock];
  [v8 makeObjectsPerformSelector:sel_locationManagerDidPauseLocationUpdates_ withObject:self];
  [v7 makeObjectsPerformSelector:sel_locationManagerDidPauseLocationUpdates_ withObject:self];
}

- (void)locationProviderDidResumeLocationUpdates:(id)a3
{
  id v4 = [(MNLocationManager *)self locationRecorder];
  [v4 recordLocationUpdateResume];

  [(NSLock *)self->_observersLock lock];
  id v5 = [(NSHashTable *)self->_locationObservers allObjects];
  id v8 = (id)[v5 copy];

  id v6 = [(NSHashTable *)self->_locationListeners allObjects];
  id v7 = (void *)[v6 copy];

  [(NSLock *)self->_observersLock unlock];
  [v8 makeObjectsPerformSelector:sel_locationManagerDidResumeLocationUpdates_ withObject:self];
  [v7 makeObjectsPerformSelector:sel_locationManagerDidResumeLocationUpdates_ withObject:self];
}

- (void)locationProvider:(id)a3 didEnterRegion:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  [(NSLock *)self->_observersLock lock];
  id v6 = [(NSHashTable *)self->_locationObservers allObjects];
  id v7 = (void *)[v6 copy];

  id v8 = [(NSHashTable *)self->_locationListeners allObjects];
  uint64_t v9 = (void *)[v8 copy];

  [(NSLock *)self->_observersLock unlock];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v26 + 1) + 8 * v14);
        if (objc_opt_respondsToSelector()) {
          [v15 locationManager:self didEnterRegion:v5];
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v12);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v16 = v7;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v23;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = *(void **)(*((void *)&v22 + 1) + 8 * v20);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v21, "locationManager:didEnterRegion:", self, v5, (void)v22);
        }
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v18);
  }
}

- (void)locationProvider:(id)a3 didExitRegion:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  [(NSLock *)self->_observersLock lock];
  id v6 = [(NSHashTable *)self->_locationObservers allObjects];
  id v7 = (void *)[v6 copy];

  id v8 = [(NSHashTable *)self->_locationListeners allObjects];
  uint64_t v9 = (void *)[v8 copy];

  [(NSLock *)self->_observersLock unlock];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v26 + 1) + 8 * v14);
        if (objc_opt_respondsToSelector()) {
          [v15 locationManager:self didExitRegion:v5];
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v12);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v16 = v7;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v23;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = *(void **)(*((void *)&v22 + 1) + 8 * v20);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v21, "locationManager:didExitRegion:", self, v5, (void)v22);
        }
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v18);
  }
}

- (void)locationProvider:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  [(NSLock *)self->_observersLock lock];
  uint64_t v9 = [(NSHashTable *)self->_locationObservers allObjects];
  id v10 = (void *)[v9 copy];

  uint64_t v11 = [(NSHashTable *)self->_locationListeners allObjects];
  uint64_t v12 = (void *)[v11 copy];

  [(NSLock *)self->_observersLock unlock];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v30;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v29 + 1) + 8 * v17);
        if (objc_opt_respondsToSelector()) {
          [v18 locationManager:self monitoringDidFailForRegion:v7 withError:v8];
        }
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v15);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v19 = v10;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v26;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v26 != v22) {
          objc_enumerationMutation(v19);
        }
        long long v24 = *(void **)(*((void *)&v25 + 1) + 8 * v23);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v24, "locationManager:monitoringDidFailForRegion:withError:", self, v7, v8, (void)v25);
        }
        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v21);
  }
}

- (void)resourceManifestManager:(id)a3 didChangeActiveTileGroup:(id)a4 fromOldTileGroup:(id)a5
{
  if (self->_trackingLocation)
  {
    id v5 = [(MNLocationManager *)self locationProvider];
    [v5 resetForActiveTileGroupChanged];
  }
}

- (id)locationCorrector
{
  return self->_locationCorrector;
}

- (CLHeading)heading
{
  return self->_heading;
}

- (MNLocationRecorder)locationRecorder
{
  return self->_locationRecorder;
}

- (void)setLocationRecorder:(id)a3
{
}

- (unint64_t)locationProviderType
{
  return self->_locationProviderType;
}

- (MNLocationProvider)locationProvider
{
  return self->_locationProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_locationCorrector, 0);
  objc_storeStrong((id *)&self->_lastUpdatedHeadingDate, 0);
  objc_storeStrong((id *)&self->_heading, 0);
  objc_storeStrong((id *)&self->_locationAssertion, 0);
  objc_storeStrong((id *)&self->_locationShifter, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong((id *)&self->_lastLocationLock, 0);
  objc_storeStrong((id *)&self->_observersLock, 0);
  objc_storeStrong((id *)&self->_headingObservers, 0);
  objc_storeStrong((id *)&self->_locationListeners, 0);
  objc_storeStrong((id *)&self->_locationObservers, 0);
  objc_storeStrong((id *)&self->_accessRequesters, 0);
  objc_storeStrong((id *)&self->_effectiveBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_effectiveBundle, 0);
  objc_storeStrong((id *)&self->_locationRecorder, 0);
  objc_storeStrong((id *)&self->_locationProvider, 0);
}

@end