@interface ICLocationContext
+ (id)sharedContext;
- (BOOL)canGetLocation;
- (BOOL)requestedAuthorization;
- (CLGeocoder)geocoder;
- (CLLocationManager)locationManager;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)lookupPlaceAtLatitude:(double)a3 longitude:(double)a4 handler:(id)a5;
- (void)requestAuthorizationIfNeeded;
- (void)setGeocoder:(id)a3;
- (void)setRequestedAuthorization:(BOOL)a3;
@end

@implementation ICLocationContext

+ (id)sharedContext
{
  if (sharedContext_once != -1) {
    dispatch_once(&sharedContext_once, &__block_literal_global_70);
  }
  v2 = (void *)sharedContext_defaultContext;
  return v2;
}

void __34__ICLocationContext_sharedContext__block_invoke()
{
  v0 = objc_alloc_init(ICLocationContext);
  v1 = (void *)sharedContext_defaultContext;
  sharedContext_defaultContext = (uint64_t)v0;
}

- (BOOL)canGetLocation
{
  int v3 = [MEMORY[0x1E4F1E600] locationServicesEnabled];
  if (v3)
  {
    v4 = [(ICLocationContext *)self locationManager];
    int v5 = [v4 authorizationStatus];

    [(ICLocationContext *)self requestAuthorizationIfNeeded];
    LOBYTE(v3) = v5 > 2;
  }
  return v3;
}

- (void)lookupPlaceAtLatitude:(double)a3 longitude:(double)a4 handler:(id)a5
{
  id v8 = a5;
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:a3 longitude:a4];
  v10 = [(ICLocationContext *)self geocoder];

  if (!v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1E5C8]);
    [(ICLocationContext *)self setGeocoder:v11];
  }
  v12 = [(ICLocationContext *)self geocoder];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__ICLocationContext_lookupPlaceAtLatitude_longitude_handler___block_invoke;
  v14[3] = &unk_1E64A9AC0;
  id v15 = v8;
  id v13 = v8;
  [v12 reverseGeocodeLocation:v9 completionHandler:v14];
}

void __61__ICLocationContext_lookupPlaceAtLatitude_longitude_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __61__ICLocationContext_lookupPlaceAtLatitude_longitude_handler___block_invoke_cold_1((uint64_t)v6, v7);
    }
  }
  if (*(void *)(a1 + 32))
  {
    id v8 = [v5 firstObject];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  [(ICLocationContext *)self setRequestedAuthorization:0];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"ICLocationContextAuthorizationStatusDidChange" object:0];
}

- (CLLocationManager)locationManager
{
  locationManager = self->_locationManager;
  if (!locationManager)
  {
    v4 = (CLLocationManager *)objc_alloc_init(MEMORY[0x1E4F1E600]);
    id v5 = self->_locationManager;
    self->_locationManager = v4;

    [(CLLocationManager *)self->_locationManager setDelegate:self];
    locationManager = self->_locationManager;
  }
  return locationManager;
}

- (void)requestAuthorizationIfNeeded
{
  if (![(ICLocationContext *)self requestedAuthorization])
  {
    id v3 = [(ICLocationContext *)self locationManager];
    int v4 = [v3 authorizationStatus];

    if (!v4)
    {
      id v5 = [(ICLocationContext *)self locationManager];
      [v5 requestWhenInUseAuthorization];

      [(ICLocationContext *)self setRequestedAuthorization:1];
    }
  }
}

- (CLGeocoder)geocoder
{
  return self->_geocoder;
}

- (void)setGeocoder:(id)a3
{
}

- (BOOL)requestedAuthorization
{
  return self->_requestedAuthorization;
}

- (void)setRequestedAuthorization:(BOOL)a3
{
  self->_requestedAuthorization = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geocoder, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
}

void __61__ICLocationContext_lookupPlaceAtLatitude_longitude_handler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_ERROR, "Error performing reverse geolocation %@", (uint8_t *)&v2, 0xCu);
}

@end