@interface PXLocationStream
- (BOOL)isClosed;
- (PXLocationStream)initWithAccuracy:(double)a3 handler:(id)a4;
- (void)_cleanup;
- (void)_closeStreamWithError;
- (void)_emitLocation:(id)a3;
- (void)_open;
- (void)_requestAuthorization;
- (void)_requestLocation;
- (void)dealloc;
- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)setClosed:(BOOL)a3;
@end

@implementation PXLocationStream

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong(&self->_handler, 0);
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = PLUIGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    if (a4 >= 5)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      v12 = [NSString stringWithUTF8String:"NSString *_DescriptionForAuthorizationStatus(CLAuthorizationStatus)"];
      [v11 handleFailureInFunction:v12 file:@"PXLocationStream.m" lineNumber:27 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    v8 = off_1E5DCF880[a4];
    int v13 = 138412546;
    v14 = self;
    __int16 v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEBUG, "%@ CLLocationManager did change authorization status: %@", (uint8_t *)&v13, 0x16u);
  }

  if ((a4 - 1) < 2)
  {
    v9 = PLUIGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = "denied";
      if (a4 == 1) {
        v10 = "restricted";
      }
      int v13 = 138412546;
      v14 = self;
      __int16 v15 = 2080;
      v16 = (void *)v10;
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "%@ Unrecoverable failure: Authorization status %s.", (uint8_t *)&v13, 0x16u);
    }

    [(PXLocationStream *)self _closeStreamWithError];
  }
  else if ((a4 - 3) >= 2)
  {
    if (!a4) {
      [(PXLocationStream *)self _requestAuthorization];
    }
  }
  else
  {
    [(PXLocationStream *)self _requestLocation];
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = PLUIGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [v5 localizedDescription];
    int v8 = 138412546;
    v9 = self;
    __int16 v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "%@ CLLocationManager did fail with error: \"%@\"", (uint8_t *)&v8, 0x16u);
  }
  [(PXLocationStream *)self _closeStreamWithError];
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = PLUIGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412546;
    v9 = self;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEBUG, "%@ CLLocationManager did update locations: %@", (uint8_t *)&v8, 0x16u);
  }

  v7 = [v5 lastObject];
  [(PXLocationStream *)self _emitLocation:v7];
}

- (void)_cleanup
{
  id handler = self->_handler;
  self->_id handler = 0;

  [(CLLocationManager *)self->_locationManager stopUpdatingLocation];
  [(CLLocationManager *)self->_locationManager setDelegate:0];
  locationManager = self->_locationManager;
  self->_locationManager = 0;
}

- (void)_closeStreamWithError
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([(PXLocationStream *)self isClosed])
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXLocationStream.m", 168, @"Invalid parameter not satisfying: %@", @"![self isClosed]" object file lineNumber description];
  }
  self->_state = 2;
  v4 = PLUIGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    int v8 = self;
    _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEBUG, "%@ Close with error.", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  (*((void (**)(void))self->_handler + 2))();
  id WeakRetained = objc_loadWeakRetained((id *)buf);
  [WeakRetained _cleanup];

  objc_destroyWeak((id *)buf);
}

- (void)_emitLocation:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self->_state != 1)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PXLocationStream.m", 160, @"Invalid parameter not satisfying: %@", @"PXLocationStreamStateOpen == _state" object file lineNumber description];
  }
  id v6 = PLUIGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v9 = self;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEBUG, "%@ Emit: %@", buf, 0x16u);
  }

  (*((void (**)(void))self->_handler + 2))();
}

- (void)_requestLocation
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_state)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"PXLocationStream.m", 146, @"Invalid parameter not satisfying: %@", @"PXLocationStreamStateInitial == _state" object file lineNumber description];
  }
  self->_state = 1;
  v3 = PLUIGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEBUG, "%@ Open.", buf, 0xCu);
  }

  [(CLLocationManager *)self->_locationManager startUpdatingLocation];
}

- (void)_requestAuthorization
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_state)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"PXLocationStream.m", 134, @"Invalid parameter not satisfying: %@", @"PXLocationStreamStateInitial == _state" object file lineNumber description];
  }
  v3 = PLUIGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEBUG, "%@ Requesting authorization...", buf, 0xCu);
  }

  [(CLLocationManager *)self->_locationManager requestWhenInUseAuthorization];
}

- (void)_open
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_state)
  {
    int v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXLocationStream.m", 100, @"Invalid parameter not satisfying: %@", @"PXLocationStreamStateInitial == _state" object file lineNumber description];
  }
  if (([MEMORY[0x1E4F1E600] locationServicesEnabled] & 1) == 0)
  {
    id v5 = PLUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v15 = self;
      v7 = "%@ Unrecoverable failure: Location services are disabled.";
      uint64_t v8 = v5;
      uint32_t v9 = 12;
LABEL_11:
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
    }
LABEL_12:

    [(PXLocationStream *)self _closeStreamWithError];
    return;
  }
  int v3 = [MEMORY[0x1E4F1E600] authorizationStatus];
  v4 = PLUIGetLog();
  id v5 = v4;
  if ((v3 - 1) <= 1)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = "denied";
      if (v3 == 1) {
        id v6 = "restricted";
      }
      *(_DWORD *)buf = 138412546;
      __int16 v15 = self;
      __int16 v16 = 2080;
      uint64_t v17 = v6;
      v7 = "%@ Unrecoverable failure: Authorization status %s.";
      uint64_t v8 = v5;
      uint32_t v9 = 22;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v15 = self;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEBUG, "%@ Opening...", buf, 0xCu);
  }

  __int16 v10 = (CLLocationManager *)objc_alloc_init(MEMORY[0x1E4F1E600]);
  locationManager = self->_locationManager;
  self->_locationManager = v10;

  [(CLLocationManager *)self->_locationManager setDistanceFilter:self->_accuracy];
  [(CLLocationManager *)self->_locationManager setDesiredAccuracy:self->_accuracy];
  [(CLLocationManager *)self->_locationManager setDelegate:self];
}

- (void)setClosed:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXLocationStream.m", 88, @"Invalid parameter not satisfying: %@", @"shouldClose" object file lineNumber description];
  }
  if (![(PXLocationStream *)self isClosed])
  {
    self->_state = 2;
    v4 = PLUIGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v8 = self;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEBUG, "%@ Close.", buf, 0xCu);
    }

    [(PXLocationStream *)self _cleanup];
  }
}

- (BOOL)isClosed
{
  return self->_state == 2;
}

- (void)dealloc
{
  [(PXLocationStream *)self setClosed:1];
  v3.receiver = self;
  v3.super_class = (Class)PXLocationStream;
  [(PXLocationStream *)&v3 dealloc];
}

- (PXLocationStream)initWithAccuracy:(double)a3 handler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = v7;
  if (a3 < 0.0)
  {
    __int16 v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXLocationStream.m", 49, @"Invalid parameter not satisfying: %@", @"accuracy >= 0.f" object file lineNumber description];

    if (v8) {
      goto LABEL_3;
    }
  }
  else if (v7)
  {
    goto LABEL_3;
  }
  __int16 v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"PXLocationStream.m", 50, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)PXLocationStream;
  uint64_t v9 = [(PXLocationStream *)&v19 init];
  __int16 v10 = v9;
  if (v9)
  {
    v9->_state = 0;
    v9->_accuracy = a3;
    uint64_t v11 = [v8 copy];
    id handler = v10->_handler;
    v10->_id handler = (id)v11;

    int v13 = PLUIGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v10;
      _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_DEBUG, "%@ Create.", buf, 0xCu);
    }

    if ([MEMORY[0x1E4F29060] isMainThread])
    {
      [(PXLocationStream *)v10 performSelector:sel__open withObject:0 afterDelay:0.0];
    }
    else
    {
      objc_initWeak((id *)buf, v10);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __45__PXLocationStream_initWithAccuracy_handler___block_invoke;
      block[3] = &unk_1E5DD32D0;
      objc_copyWeak(&v18, (id *)buf);
      dispatch_async(MEMORY[0x1E4F14428], block);
      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)buf);
    }
  }

  return v10;
}

void __45__PXLocationStream_initWithAccuracy_handler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _open];
}

@end