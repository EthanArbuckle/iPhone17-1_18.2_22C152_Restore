@interface WebGeolocationCoreLocationProvider
- (WebGeolocationCoreLocationProvider)initWithListener:(id)a3;
- (id).cxx_construct;
- (void)createLocationManager;
- (void)dealloc;
- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)requestGeolocationAuthorization;
- (void)sendLocation:(id)a3;
- (void)setEnableHighAccuracy:(BOOL)a3;
- (void)start;
- (void)stop;
@end

@implementation WebGeolocationCoreLocationProvider

- (void)createLocationManager
{
  v3 = (void *)[objc_alloc((Class)getCLLocationManagerClass()) init];
  m_ptr = self->_locationManager.m_ptr;
  self->_locationManager.m_ptr = v3;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  self->_lastAuthorizationStatus = [(id)getCLLocationManagerClass() authorizationStatus];
  v5 = self->_locationManager.m_ptr;
  [v5 setDelegate:self];
}

- (WebGeolocationCoreLocationProvider)initWithListener:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WebGeolocationCoreLocationProvider;
  v4 = [(WebGeolocationCoreLocationProvider *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_positionListener = (WebGeolocationCoreLocationUpdateListener *)a3;
    [(WebGeolocationCoreLocationProvider *)v4 createLocationManager];
  }
  return v5;
}

- (void)dealloc
{
  [self->_locationManager.m_ptr setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)WebGeolocationCoreLocationProvider;
  [(WebGeolocationCoreLocationProvider *)&v3 dealloc];
}

- (void)requestGeolocationAuthorization
{
  if (([(id)getCLLocationManagerClass() locationServicesEnabled] & 1) != 0
    && (int v3 = [(id)getCLLocationManagerClass() authorizationStatus], (v3 - 1) >= 2))
  {
    if ((v3 - 3) >= 2)
    {
      if (!v3 && !self->_isWaitingForAuthorization)
      {
        self->_isWaitingForAuthorization = 1;
        m_ptr = self->_locationManager.m_ptr;
        [m_ptr requestWhenInUseAuthorization];
      }
    }
    else
    {
      positionListener = self->_positionListener;
      [(WebGeolocationCoreLocationUpdateListener *)positionListener geolocationAuthorizationGranted];
    }
  }
  else
  {
    v5 = self->_positionListener;
    [(WebGeolocationCoreLocationUpdateListener *)v5 geolocationAuthorizationDenied];
  }
}

- (void)start
{
  if ([(id)getCLLocationManagerClass() locationServicesEnabled]
    && [(id)getCLLocationManagerClass() authorizationStatus] - 3 < 2)
  {
    m_ptr = self->_locationManager.m_ptr;
    [m_ptr startUpdatingLocation];
  }
  else
  {
    [self->_locationManager.m_ptr stopUpdatingLocation];
    positionListener = self->_positionListener;
    [(WebGeolocationCoreLocationUpdateListener *)positionListener resetGeolocation];
  }
}

- (void)stop
{
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  if (self->_isWaitingForAuthorization)
  {
    if ((a4 - 3) >= 2)
    {
      if ((a4 - 1) <= 1)
      {
        self->_isWaitingForAuthorization = 0;
        [(WebGeolocationCoreLocationUpdateListener *)self->_positionListener geolocationAuthorizationDenied];
      }
      goto LABEL_5;
    }
    self->_isWaitingForAuthorization = 0;
    [(WebGeolocationCoreLocationUpdateListener *)self->_positionListener geolocationAuthorizationGranted];
    self->_lastAuthorizationStatus = a4;
  }
  else
  {
    if (((self->_lastAuthorizationStatus - 3) | (a4 - 3)) < 2)
    {
LABEL_5:
      self->_lastAuthorizationStatus = a4;
      return;
    }
    objc_msgSend(self->_locationManager.m_ptr, "stopUpdatingLocation", a3);
    [(WebGeolocationCoreLocationUpdateListener *)self->_positionListener resetGeolocation];
    self->_lastAuthorizationStatus = a4;
  }
}

- (void)sendLocation:(id)a3
{
  positionListener = self->_positionListener;
  MEMORY[0x1E4E47350](v4, a3);
  [(WebGeolocationCoreLocationUpdateListener *)positionListener positionChanged:v4];
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [a4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(a4);
        }
        [(WebGeolocationCoreLocationProvider *)self sendLocation:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [a4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  if (objc_msgSend(a4, "code", a3) != 1)
  {
    uint64_t v6 = [a4 localizedDescription];
    positionListener = self->_positionListener;
    [(WebGeolocationCoreLocationUpdateListener *)positionListener errorOccurred:v6];
  }
}

- (void)setEnableHighAccuracy:(BOOL)a3
{
  m_ptr = self->_locationManager.m_ptr;
  v4 = &_MergedGlobals_5;
  if (!a3) {
    v4 = &qword_1EB3A9640;
  }
  ((void (*)(void))*v4)();
  objc_msgSend(m_ptr, "setDesiredAccuracy:");
}

- (void).cxx_destruct
{
  m_ptr = self->_locationManager.m_ptr;
  self->_locationManager.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

@end