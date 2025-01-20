@interface MNHybridLocationProvider
- (BOOL)coarseModeEnabled;
- (BOOL)isAuthorized;
- (BOOL)isTracePlayer;
- (BOOL)locationProviderShouldPauseLocationUpdates:(id)a3;
- (MNHybridLocationProvider)init;
- (MNHybridLocationProvider)initWithEffectiveBundle:(id)a3;
- (MNHybridLocationProvider)initWithEffectiveBundleIdentifier:(id)a3;
- (MNLocationProviderDelegate)delegate;
- (NSBundle)effectiveBundle;
- (NSString)effectiveBundleIdentifier;
- (double)desiredAccuracy;
- (double)distanceFilter;
- (double)expectedGpsUpdateInterval;
- (double)timeScale;
- (id)coreLocationProvider;
- (id)leechedLocationProvider;
- (int)headingOrientation;
- (unint64_t)mode;
- (unint64_t)traceVersion;
- (void)_setEffectiveAccuracy:(double)a3;
- (void)_sharedInit;
- (void)locationProvider:(id)a3 didChangeCoarseMode:(BOOL)a4;
- (void)locationProvider:(id)a3 didEnterRegion:(id)a4;
- (void)locationProvider:(id)a3 didExitRegion:(id)a4;
- (void)locationProvider:(id)a3 didReceiveError:(id)a4;
- (void)locationProvider:(id)a3 didUpdateHeading:(id)a4;
- (void)locationProvider:(id)a3 didUpdateLocation:(id)a4;
- (void)locationProvider:(id)a3 didUpdateVehicleHeading:(double)a4 timestamp:(id)a5;
- (void)locationProvider:(id)a3 didUpdateVehicleSpeed:(double)a4 timestamp:(id)a5;
- (void)locationProvider:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5;
- (void)locationProviderDidChangeAuthorizationStatus:(id)a3;
- (void)locationProviderDidPauseLocationUpdates:(id)a3;
- (void)locationProviderDidResumeLocationUpdates:(id)a3;
- (void)resetForActiveTileGroupChanged;
- (void)setDelegate:(id)a3;
- (void)setDesiredAccuracy:(double)a3;
- (void)setDistanceFilter:(double)a3;
- (void)setEffectiveBundle:(id)a3;
- (void)setEffectiveBundleIdentifier:(id)a3;
- (void)setHeadingOrientation:(int)a3;
- (void)setMode:(unint64_t)a3;
- (void)startMonitoringForRegion:(id)a3;
- (void)startUpdatingHeading;
- (void)startUpdatingLocation;
- (void)startUpdatingVehicleHeading;
- (void)startUpdatingVehicleSpeed;
- (void)stopMonitoringForRegion:(id)a3;
- (void)stopUpdatingHeading;
- (void)stopUpdatingLocation;
- (void)stopUpdatingVehicleHeading;
- (void)stopUpdatingVehicleSpeed;
@end

@implementation MNHybridLocationProvider

- (BOOL)coarseModeEnabled
{
  return [(MNCoreLocationProvider *)self->_coreLocationProvider coarseModeEnabled];
}

- (void)locationProvider:(id)a3 didUpdateLocation:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = MNGetPuckTrackingLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = [v5 uuid];
    int v12 = 138412290;
    v13 = v7;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_INFO, "[MN] [%@] - Processing - in MNHybridLocationProvider::locationProvider:didUpdateLocation:", (uint8_t *)&v12, 0xCu);
  }
  v8 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v9 = [(MNHybridLocationProvider *)self mode];
    v10 = @"Default";
    if (v9 == 1) {
      v10 = @"Leeching";
    }
    int v12 = 138412546;
    v13 = v10;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_DEBUG, "Received location while in %@ mode:%@", (uint8_t *)&v12, 0x16u);
  }

  [v5 setIsLeeched:self->_mode == 1];
  v11 = [(MNHybridLocationProvider *)self delegate];
  [v11 locationProvider:self didUpdateLocation:v5];
}

- (MNLocationProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MNLocationProviderDelegate *)WeakRetained;
}

- (MNHybridLocationProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)MNHybridLocationProvider;
  v2 = [(MNHybridLocationProvider *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(MNCoreLocationProvider);
    coreLocationProvider = v2->_coreLocationProvider;
    v2->_coreLocationProvider = v3;

    [(MNHybridLocationProvider *)v2 _sharedInit];
  }
  return v2;
}

- (MNHybridLocationProvider)initWithEffectiveBundle:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MNHybridLocationProvider;
  id v5 = [(MNHybridLocationProvider *)&v9 init];
  if (v5)
  {
    objc_super v6 = [[MNCoreLocationProvider alloc] initWithEffectiveBundle:v4];
    coreLocationProvider = v5->_coreLocationProvider;
    v5->_coreLocationProvider = v6;

    [(MNHybridLocationProvider *)v5 _sharedInit];
  }

  return v5;
}

- (MNHybridLocationProvider)initWithEffectiveBundleIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MNHybridLocationProvider;
  id v5 = [(MNHybridLocationProvider *)&v9 init];
  if (v5)
  {
    objc_super v6 = [[MNCoreLocationProvider alloc] initWithEffectiveBundleIdentifier:v4];
    coreLocationProvider = v5->_coreLocationProvider;
    v5->_coreLocationProvider = v6;

    [(MNHybridLocationProvider *)v5 _sharedInit];
  }

  return v5;
}

- (void)setMode:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_mode != a3)
  {
    p_nonLeechedDesiredAccuracy = &self->_nonLeechedDesiredAccuracy;
    if (a3 == 1) {
      p_nonLeechedDesiredAccuracy = (double *)MEMORY[0x1E4F1E710];
    }
    [(MNHybridLocationProvider *)self _setEffectiveAccuracy:*p_nonLeechedDesiredAccuracy];
    self->_mode = a3;
    objc_super v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = @"Default";
      if (a3 == 1) {
        v7 = @"Leeching";
      }
      int v8 = 138412290;
      objc_super v9 = v7;
      _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEBUG, "Switched to %@ mode", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (unint64_t)mode
{
  return self->_mode;
}

- (double)distanceFilter
{
  return self->_distanceFilter;
}

- (void)setDistanceFilter:(double)a3
{
  self->_distanceFilter = a3;
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__MNHybridLocationProvider_setDistanceFilter___block_invoke;
  v4[3] = &unk_1E60FB680;
  objc_copyWeak(v5, &location);
  v5[1] = *(id *)&a3;
  MNRunAsynchronouslyOnMainThread(v4);
  objc_destroyWeak(v5);
  objc_destroyWeak(&location);
}

void __46__MNHybridLocationProvider_setDistanceFilter___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[5] setDistanceFilter:*(double *)(a1 + 40)];
  }
  else
  {
    id v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      objc_super v6 = "-[MNHybridLocationProvider setDistanceFilter:]_block_invoke";
      _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_ERROR, "strongSelf went away in %s", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (double)desiredAccuracy
{
  return self->_effectiveAccuracy;
}

- (void)setDesiredAccuracy:(double)a3
{
  self->_nonLeechedDesiredAccuracy = a3;
  if (!self->_mode) {
    -[MNHybridLocationProvider _setEffectiveAccuracy:](self, "_setEffectiveAccuracy:");
  }
}

- (void)_sharedInit
{
  [(MNHybridLocationProvider *)self setDesiredAccuracy:*MEMORY[0x1E4F1E6E0]];
  [(MNHybridLocationProvider *)self setDistanceFilter:*MEMORY[0x1E4F1E6C0]];
  [(MNCoreLocationProvider *)self->_coreLocationProvider setDelegate:self];
  coreLocationProvider = self->_coreLocationProvider;
  [(MNCoreLocationProvider *)coreLocationProvider setMatchInfoEnabled:0];
}

- (void)_setEffectiveAccuracy:(double)a3
{
  self->_effectiveAccuracy = a3;
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__MNHybridLocationProvider__setEffectiveAccuracy___block_invoke;
  v4[3] = &unk_1E60FB680;
  objc_copyWeak(v5, &location);
  v5[1] = *(id *)&a3;
  MNRunAsynchronouslyOnMainThread(v4);
  objc_destroyWeak(v5);
  objc_destroyWeak(&location);
}

void __50__MNHybridLocationProvider__setEffectiveAccuracy___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[5] setDesiredAccuracy:*(double *)(a1 + 40)];
  }
  else
  {
    id v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      objc_super v6 = "-[MNHybridLocationProvider _setEffectiveAccuracy:]_block_invoke";
      _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_ERROR, "strongSelf went away in %s", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (id)coreLocationProvider
{
  return self->_coreLocationProvider;
}

- (id)leechedLocationProvider
{
  return self->_coreLocationProvider;
}

- (void)startUpdatingLocation
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __49__MNHybridLocationProvider_startUpdatingLocation__block_invoke;
  v2[3] = &unk_1E60F7760;
  objc_copyWeak(&v3, &location);
  MNRunAsynchronouslyOnMainThread(v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __49__MNHybridLocationProvider_startUpdatingLocation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained coreLocationProvider];
  [v1 startUpdatingLocation];
}

- (void)stopUpdatingLocation
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __48__MNHybridLocationProvider_stopUpdatingLocation__block_invoke;
  v2[3] = &unk_1E60F7760;
  objc_copyWeak(&v3, &location);
  MNRunAsynchronouslyOnMainThread(v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __48__MNHybridLocationProvider_stopUpdatingLocation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained coreLocationProvider];
  [v1 stopUpdatingLocation];
}

- (void)startUpdatingHeading
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __48__MNHybridLocationProvider_startUpdatingHeading__block_invoke;
  v2[3] = &unk_1E60F7760;
  objc_copyWeak(&v3, &location);
  MNRunAsynchronouslyOnMainThread(v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __48__MNHybridLocationProvider_startUpdatingHeading__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained coreLocationProvider];
  [v1 startUpdatingHeading];
}

- (void)stopUpdatingHeading
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __47__MNHybridLocationProvider_stopUpdatingHeading__block_invoke;
  v2[3] = &unk_1E60F7760;
  objc_copyWeak(&v3, &location);
  MNRunAsynchronouslyOnMainThread(v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __47__MNHybridLocationProvider_stopUpdatingHeading__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained coreLocationProvider];
  [v1 stopUpdatingHeading];
}

- (void)startUpdatingVehicleSpeed
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __53__MNHybridLocationProvider_startUpdatingVehicleSpeed__block_invoke;
  v2[3] = &unk_1E60F7760;
  objc_copyWeak(&v3, &location);
  MNRunAsynchronouslyOnMainThread(v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __53__MNHybridLocationProvider_startUpdatingVehicleSpeed__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained coreLocationProvider];
  [v1 startUpdatingVehicleSpeed];
}

- (void)stopUpdatingVehicleSpeed
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __52__MNHybridLocationProvider_stopUpdatingVehicleSpeed__block_invoke;
  v2[3] = &unk_1E60F7760;
  objc_copyWeak(&v3, &location);
  MNRunAsynchronouslyOnMainThread(v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __52__MNHybridLocationProvider_stopUpdatingVehicleSpeed__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained coreLocationProvider];
  [v1 stopUpdatingVehicleSpeed];
}

- (void)startUpdatingVehicleHeading
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __55__MNHybridLocationProvider_startUpdatingVehicleHeading__block_invoke;
  v2[3] = &unk_1E60F7760;
  objc_copyWeak(&v3, &location);
  MNRunAsynchronouslyOnMainThread(v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __55__MNHybridLocationProvider_startUpdatingVehicleHeading__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained coreLocationProvider];
  [v1 startUpdatingVehicleHeading];
}

- (void)stopUpdatingVehicleHeading
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __54__MNHybridLocationProvider_stopUpdatingVehicleHeading__block_invoke;
  v2[3] = &unk_1E60F7760;
  objc_copyWeak(&v3, &location);
  MNRunAsynchronouslyOnMainThread(v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __54__MNHybridLocationProvider_stopUpdatingVehicleHeading__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained coreLocationProvider];
  [v1 stopUpdatingVehicleHeading];
}

- (void)resetForActiveTileGroupChanged
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __58__MNHybridLocationProvider_resetForActiveTileGroupChanged__block_invoke;
  v2[3] = &unk_1E60F7760;
  objc_copyWeak(&v3, &location);
  MNRunAsynchronouslyOnMainThread(v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __58__MNHybridLocationProvider_resetForActiveTileGroupChanged__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained coreLocationProvider];
  [v1 resetForActiveTileGroupChanged];
}

- (NSBundle)effectiveBundle
{
  return [(MNCoreLocationProvider *)self->_coreLocationProvider effectiveBundle];
}

- (void)setEffectiveBundle:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__MNHybridLocationProvider_setEffectiveBundle___block_invoke;
  v6[3] = &unk_1E60F6460;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  MNRunAsynchronouslyOnMainThread(v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __47__MNHybridLocationProvider_setEffectiveBundle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained coreLocationProvider];
  [v2 setEffectiveBundle:*(void *)(a1 + 32)];
}

- (NSString)effectiveBundleIdentifier
{
  return [(MNCoreLocationProvider *)self->_coreLocationProvider effectiveBundleIdentifier];
}

- (void)setEffectiveBundleIdentifier:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__MNHybridLocationProvider_setEffectiveBundleIdentifier___block_invoke;
  v6[3] = &unk_1E60F6460;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  MNRunAsynchronouslyOnMainThread(v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __57__MNHybridLocationProvider_setEffectiveBundleIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained coreLocationProvider];
  [v2 setEffectiveBundleIdentifier:*(void *)(a1 + 32)];
}

- (BOOL)isAuthorized
{
  return [(MNCoreLocationProvider *)self->_coreLocationProvider isAuthorized];
}

- (int)headingOrientation
{
  return [(MNCoreLocationProvider *)self->_coreLocationProvider headingOrientation];
}

- (void)setHeadingOrientation:(int)a3
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__MNHybridLocationProvider_setHeadingOrientation___block_invoke;
  v4[3] = &unk_1E60FB6A8;
  objc_copyWeak(&v5, &location);
  int v6 = a3;
  MNRunAsynchronouslyOnMainThread(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __50__MNHybridLocationProvider_setHeadingOrientation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained coreLocationProvider];
  [v2 setHeadingOrientation:*(unsigned int *)(a1 + 40)];
}

- (double)expectedGpsUpdateInterval
{
  [(MNCoreLocationProvider *)self->_coreLocationProvider expectedGpsUpdateInterval];
  return result;
}

- (BOOL)isTracePlayer
{
  return [(MNCoreLocationProvider *)self->_coreLocationProvider isTracePlayer];
}

- (unint64_t)traceVersion
{
  return 0;
}

- (double)timeScale
{
  [(MNCoreLocationProvider *)self->_coreLocationProvider timeScale];
  return result;
}

- (void)startMonitoringForRegion:(id)a3
{
}

- (void)stopMonitoringForRegion:(id)a3
{
}

- (void)locationProvider:(id)a3 didUpdateHeading:(id)a4
{
  id v5 = a4;
  id v6 = [(MNHybridLocationProvider *)self delegate];
  [v6 locationProvider:self didUpdateHeading:v5];
}

- (void)locationProvider:(id)a3 didReceiveError:(id)a4
{
  id v5 = a4;
  id v6 = [(MNHybridLocationProvider *)self delegate];
  [v6 locationProvider:self didReceiveError:v5];
}

- (void)locationProviderDidChangeAuthorizationStatus:(id)a3
{
  id v4 = [(MNHybridLocationProvider *)self delegate];
  [v4 locationProviderDidChangeAuthorizationStatus:self];
}

- (void)locationProvider:(id)a3 didChangeCoarseMode:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(MNHybridLocationProvider *)self delegate];
  [v6 locationProvider:self didChangeCoarseMode:v4];
}

- (BOOL)locationProviderShouldPauseLocationUpdates:(id)a3
{
  id v3 = self;
  BOOL v4 = [(MNHybridLocationProvider *)self delegate];
  LOBYTE(v3) = [v4 locationProviderShouldPauseLocationUpdates:v3];

  return (char)v3;
}

- (void)locationProviderDidPauseLocationUpdates:(id)a3
{
  id v4 = [(MNHybridLocationProvider *)self delegate];
  [v4 locationProviderDidPauseLocationUpdates:self];
}

- (void)locationProviderDidResumeLocationUpdates:(id)a3
{
  id v4 = [(MNHybridLocationProvider *)self delegate];
  [v4 locationProviderDidResumeLocationUpdates:self];
}

- (void)locationProvider:(id)a3 didUpdateVehicleSpeed:(double)a4 timestamp:(id)a5
{
  id v7 = a5;
  id v8 = [(MNHybridLocationProvider *)self delegate];
  [v8 locationProvider:self didUpdateVehicleSpeed:v7 timestamp:a4];
}

- (void)locationProvider:(id)a3 didUpdateVehicleHeading:(double)a4 timestamp:(id)a5
{
  id v7 = a5;
  id v8 = [(MNHybridLocationProvider *)self delegate];
  [v8 locationProvider:self didUpdateVehicleHeading:v7 timestamp:a4];
}

- (void)locationProvider:(id)a3 didEnterRegion:(id)a4
{
  id v8 = a4;
  id v5 = [(MNHybridLocationProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MNHybridLocationProvider *)self delegate];
    [v7 locationProvider:self didEnterRegion:v8];
  }
}

- (void)locationProvider:(id)a3 didExitRegion:(id)a4
{
  id v8 = a4;
  id v5 = [(MNHybridLocationProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MNHybridLocationProvider *)self delegate];
    [v7 locationProvider:self didExitRegion:v8];
  }
}

- (void)locationProvider:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  id v8 = [(MNHybridLocationProvider *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    uint64_t v10 = [(MNHybridLocationProvider *)self delegate];
    [v10 locationProvider:self monitoringDidFailForRegion:v11 withError:v7];
  }
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_coreLocationProvider, 0);
}

@end