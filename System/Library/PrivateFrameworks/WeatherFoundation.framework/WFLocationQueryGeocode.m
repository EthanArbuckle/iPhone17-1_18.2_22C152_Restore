@interface WFLocationQueryGeocode
+ (id)queryWithCoordinate:(CLLocationCoordinate2D)a3 resultHandler:(id)a4;
+ (id)queryWithDictionaryRepresentation:(id)a3 resultHandler:(id)a4;
+ (id)queryWithSearchCompletion:(id)a3 resultHandler:(id)a4;
+ (id)queryWithSearchString:(id)a3 resultHandler:(id)a4;
- (BOOL)isLocationValid:(id)a3;
- (CLGeocoder)reverseGeocoder;
- (CLLocationCoordinate2D)searchCoordinate;
- (CLLocationCoordinate2D)unshiftedCoordinate;
- (MKLocalSearch)search;
- (MKLocalSearchCompletion)searchCompletion;
- (NSString)searchString;
- (WFLocationQueryGeocode)initWithCoordinate:(CLLocationCoordinate2D)a3 resultHandler:(id)a4;
- (WFLocationQueryGeocode)initWithSearchCompletion:(id)a3 resultHandler:(id)a4;
- (WFLocationQueryGeocode)initWithSearchString:(id)a3 resultHandler:(id)a4;
- (WFResponse)response;
- (WFTaskIdentifier)identifier;
- (id)_mkLocalSearchRequest;
- (id)_reverseGeocoderLocation;
- (id)resultHandler;
- (void)_handleErrorResponse:(id)a3;
- (void)_startCLGeocoderReverseGeo;
- (void)_startMKLocalSearch;
- (void)cancel;
- (void)handleSearchResponseWithLocation:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setResponse:(id)a3;
- (void)setResultHandler:(id)a3;
- (void)setReverseGeocoder:(id)a3;
- (void)setSearch:(id)a3;
- (void)setSearchCoordinate:(CLLocationCoordinate2D)a3;
- (void)setUnshiftedCoordinate:(CLLocationCoordinate2D)a3;
- (void)start;
@end

@implementation WFLocationQueryGeocode

+ (id)queryWithDictionaryRepresentation:(id)a3 resultHandler:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v8 = @"Longitude";
  v33[0] = @"Latitude";
  v33[1] = @"Longitude";
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:2];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v30;
    v27 = @"Longitude";
    id v28 = a1;
    while (2)
    {
      id v13 = v7;
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        v16 = objc_msgSend(v6, "objectForKeyedSubscript:", v15, v27, v28);

        if (v16)
        {
          v17 = [v6 objectForKeyedSubscript:v15];
          char v18 = objc_opt_respondsToSelector();

          if (v18) {
            continue;
          }
        }

        v25 = 0;
        id v7 = v13;
        goto LABEL_12;
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
      id v7 = v13;
      v8 = v27;
      a1 = v28;
      if (v11) {
        continue;
      }
      break;
    }
  }

  v19 = [v6 objectForKeyedSubscript:@"Latitude"];
  [v19 doubleValue];
  double v21 = v20;

  v22 = [v6 objectForKeyedSubscript:v8];
  [v22 doubleValue];
  double v24 = v23;

  v25 = objc_msgSend(a1, "queryWithCoordinate:resultHandler:", v7, v21, v24);
LABEL_12:

  return v25;
}

+ (id)queryWithCoordinate:(CLLocationCoordinate2D)a3 resultHandler:(id)a4
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v6 = a4;
  id v7 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCoordinate:resultHandler:", v6, latitude, longitude);

  objc_msgSend(v7, "setUnshiftedCoordinate:", latitude, longitude);
  return v7;
}

+ (id)queryWithSearchCompletion:(id)a3 resultHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSearchCompletion:v6 resultHandler:v5];

  return v7;
}

- (WFLocationQueryGeocode)initWithSearchCompletion:(id)a3 resultHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)WFLocationQueryGeocode;
  v9 = [(WFLocationQueryGeocode *)&v16 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    id resultHandler = v9->_resultHandler;
    v9->_id resultHandler = (id)v10;

    objc_storeStrong((id *)&v9->_searchCompletion, a3);
    double v12 = *MEMORY[0x263F00B58];
    double v13 = *(double *)(MEMORY[0x263F00B58] + 8);
    -[WFLocationQueryGeocode setSearchCoordinate:](v9, "setSearchCoordinate:", *MEMORY[0x263F00B58], v13);
    -[WFLocationQueryGeocode setUnshiftedCoordinate:](v9, "setUnshiftedCoordinate:", v12, v13);
    v14 = v9;
  }

  return v9;
}

+ (id)queryWithSearchString:(id)a3 resultHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSearchString:v6 resultHandler:v5];

  return v7;
}

- (WFLocationQueryGeocode)initWithSearchString:(id)a3 resultHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)WFLocationQueryGeocode;
  v9 = [(WFLocationQueryGeocode *)&v18 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_searchString, a3);
    uint64_t v11 = [v8 copy];
    id resultHandler = v10->_resultHandler;
    v10->_id resultHandler = (id)v11;

    double v13 = *MEMORY[0x263F00B58];
    double v14 = *(double *)(MEMORY[0x263F00B58] + 8);
    -[WFLocationQueryGeocode setUnshiftedCoordinate:](v10, "setUnshiftedCoordinate:", *MEMORY[0x263F00B58], v14);
    -[WFLocationQueryGeocode setSearchCoordinate:](v10, "setSearchCoordinate:", v13, v14);
    uint64_t v15 = WFLogForCategory(3uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[WFLocationQueryGeocode initWithSearchString:resultHandler:]();
    }

    objc_super v16 = v10;
  }

  return v10;
}

- (WFLocationQueryGeocode)initWithCoordinate:(CLLocationCoordinate2D)a3 resultHandler:(id)a4
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFLocationQueryGeocode;
  id v8 = [(WFLocationQueryGeocode *)&v15 init];
  v9 = v8;
  if (v8)
  {
    v8->_searchCoordinate.double latitude = latitude;
    v8->_searchCoordinate.double longitude = longitude;
    uint64_t v10 = [v7 copy];
    id resultHandler = v9->_resultHandler;
    v9->_id resultHandler = (id)v10;

    -[WFLocationQueryGeocode setUnshiftedCoordinate:](v9, "setUnshiftedCoordinate:", *MEMORY[0x263F00B58], *(double *)(MEMORY[0x263F00B58] + 8));
    double v12 = WFLogForCategory(3uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[WFLocationQueryGeocode initWithCoordinate:resultHandler:](v12, latitude, longitude);
    }

    double v13 = v9;
  }

  return v9;
}

- (void)start
{
  v3 = [(WFLocationQueryGeocode *)self _reverseGeocoderLocation];

  if (v3)
  {
    [(WFLocationQueryGeocode *)self _startCLGeocoderReverseGeo];
  }
  else
  {
    v4 = [(WFLocationQueryGeocode *)self _mkLocalSearchRequest];

    if (v4)
    {
      [(WFLocationQueryGeocode *)self _startMKLocalSearch];
    }
    else
    {
      objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:", 5);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      [(WFLocationQueryGeocode *)self _handleErrorResponse:v5];
    }
  }
}

- (void)cancel
{
  v3 = [(WFLocationQueryGeocode *)self reverseGeocoder];
  [v3 cancelGeocode];

  id v4 = [(WFLocationQueryGeocode *)self search];
  [v4 cancel];
}

- (void)_startMKLocalSearch
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = [(WFLocationQueryGeocode *)self _mkLocalSearchRequest];
  id v4 = (void *)[objc_alloc(MEMORY[0x263F10910]) initWithRequest:v3];
  [(WFLocationQueryGeocode *)self setSearch:v4];

  id v5 = +[WFLocationQueryGeocodeCacheManager sharedManager];
  id v6 = [v3 naturalLanguageQuery];
  id v7 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  id v8 = [v6 stringByTrimmingCharactersInSet:v7];
  v9 = [v8 stringByAppendingString:@"-MKLocalSearch"];

  uint64_t v10 = WFLogForCategory(3uLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [(WFLocationQueryGeocode *)self searchString];
    *(_DWORD *)buf = 138412290;
    double v21 = v11;
    _os_log_impl(&dword_21C988000, v10, OS_LOG_TYPE_DEFAULT, "Executing WFLocationQueryGeocode for search string %@", buf, 0xCu);
  }
  double v12 = [v5 cachedLocationForKey:v9];
  if (v12)
  {
    double v13 = WFLogForCategory(3uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      double v14 = [(WFLocationQueryGeocode *)self searchString];
      *(_DWORD *)buf = 138412290;
      double v21 = v14;
      _os_log_impl(&dword_21C988000, v13, OS_LOG_TYPE_DEFAULT, "WFLocationQueryGeocode retrieved from cache for search string %@", buf, 0xCu);
    }
    [(WFLocationQueryGeocode *)self handleSearchResponseWithLocation:v12];
  }
  else
  {
    objc_super v15 = [(WFLocationQueryGeocode *)self search];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __45__WFLocationQueryGeocode__startMKLocalSearch__block_invoke;
    v16[3] = &unk_264430890;
    v16[4] = self;
    id v17 = v3;
    id v18 = v9;
    id v19 = v5;
    [v15 startWithCompletionHandler:v16];
  }
}

void __45__WFLocationQueryGeocode__startMKLocalSearch__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "_handleErrorResponse:");
  }
  else
  {
    id v5 = [a2 mapItems];
    id v6 = [v5 firstObject];

    id v7 = [[WFLocation alloc] initWithMapItem:v6];
    id v8 = WFLogForCategory(3uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [*(id *)(a1 + 40) naturalLanguageQuery];
      uint64_t v10 = *(void *)(a1 + 48);
      int v11 = 138412546;
      double v12 = v9;
      __int16 v13 = 2112;
      uint64_t v14 = v10;
      _os_log_impl(&dword_21C988000, v8, OS_LOG_TYPE_DEFAULT, "Caching location for search string '%@' within cacheKey '%@'", (uint8_t *)&v11, 0x16u);
    }
    [*(id *)(a1 + 56) updateCacheForKey:*(void *)(a1 + 48) withLocation:v7];
    [*(id *)(a1 + 32) handleSearchResponseWithLocation:v7];
  }
}

- (void)_startCLGeocoderReverseGeo
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_21C988000, v0, OS_LOG_TYPE_ERROR, "Retrieved an invalid location from the cache. key='%@'", v1, 0xCu);
}

void __52__WFLocationQueryGeocode__startCLGeocoderReverseGeo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = WFLogForCategory(3uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v6;
      _os_log_impl(&dword_21C988000, v7, OS_LOG_TYPE_DEFAULT, "Reverse Geocoder failed to obtain a location with error: %@", (uint8_t *)&v19, 0xCu);
    }

    [*(id *)(a1 + 32) _handleErrorResponse:v6];
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x263F10960]);
    id v9 = objc_alloc(MEMORY[0x263F109E0]);
    uint64_t v10 = [v5 firstObject];
    int v11 = (void *)[v9 initWithPlacemark:v10];
    double v12 = (void *)[v8 initWithPlacemark:v11];

    __int16 v13 = [[WFLocation alloc] initWithMapItem:v12];
    if (v13 && [*(id *)(a1 + 32) isLocationValid:v13])
    {
      uint64_t v14 = WFLogForCategory(3uLL);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *(void **)(a1 + 40);
        int v19 = 138412547;
        id v20 = v15;
        __int16 v21 = 2113;
        uint64_t v22 = v13;
        _os_log_impl(&dword_21C988000, v14, OS_LOG_TYPE_DEFAULT, "Caching location with cacheKey '%@'. location=%{private}@", (uint8_t *)&v19, 0x16u);
      }

      [*(id *)(a1 + 48) updateCacheForKey:*(void *)(a1 + 40) withLocation:v13];
      [*(id *)(a1 + 32) handleSearchResponseWithLocation:v13];
    }
    else
    {
      objc_super v16 = WFLogForCategory(3uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138412290;
        id v20 = v12;
        _os_log_impl(&dword_21C988000, v16, OS_LOG_TYPE_DEFAULT, "Failed to initialize location with mapItem: %@", (uint8_t *)&v19, 0xCu);
      }

      id v17 = *(void **)(a1 + 32);
      id v18 = objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:", 16);
      [v17 _handleErrorResponse:v18];
    }
  }
}

- (BOOL)isLocationValid:(id)a3
{
  id v3 = a3;
  id v4 = [v3 countryAbbreviation];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    id v6 = [v3 geoLocation];
    [v6 coordinate];
    double v8 = v7;

    if (v8 == 0.0)
    {
      id v9 = WFLogForCategory(3uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[WFLocationQueryGeocode isLocationValid:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
    else
    {
      double v24 = [v3 geoLocation];
      [v24 coordinate];
      double v26 = v25;

      if (v26 != 0.0)
      {
        BOOL v34 = 1;
        goto LABEL_11;
      }
      id v9 = WFLogForCategory(3uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[WFLocationQueryGeocode isLocationValid:](v9, v27, v28, v29, v30, v31, v32, v33);
      }
    }
  }
  else
  {
    id v9 = WFLogForCategory(3uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[WFLocationQueryGeocode isLocationValid:](v9, v17, v18, v19, v20, v21, v22, v23);
    }
  }

  BOOL v34 = 0;
LABEL_11:

  return v34;
}

- (id)_mkLocalSearchRequest
{
  id v3 = [(WFLocationQueryGeocode *)self searchCompletion];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x263F10928];
    uint64_t v5 = [(WFLocationQueryGeocode *)self searchCompletion];
    id v6 = [v4 searchRequestWithCompletion:v5];
  }
  else
  {
    id v6 = [(WFLocationQueryGeocode *)self searchString];

    if (!v6) {
      goto LABEL_6;
    }
    id v6 = objc_alloc_init(MEMORY[0x263F10928]);
    uint64_t v5 = [(WFLocationQueryGeocode *)self searchString];
    [v6 setNaturalLanguageQuery:v5];
  }

LABEL_6:
  return v6;
}

- (id)_reverseGeocoderLocation
{
  [(WFLocationQueryGeocode *)self searchCoordinate];
  if (CLLocationCoordinate2DIsValid(v9))
  {
    id v3 = objc_alloc(MEMORY[0x263F00A50]);
    [(WFLocationQueryGeocode *)self searchCoordinate];
    double v5 = v4;
    [(WFLocationQueryGeocode *)self searchCoordinate];
    id v6 = objc_msgSend(v3, "initWithLatitude:longitude:", v5);
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)handleSearchResponseWithLocation:(id)a3
{
  id v4 = a3;
  [(WFLocationQueryGeocode *)self unshiftedCoordinate];
  double latitude = v15.latitude;
  double longitude = v15.longitude;
  if (CLLocationCoordinate2DIsValid(v15))
  {
    double v7 = (void *)[objc_alloc(MEMORY[0x263F00A50]) initWithLatitude:latitude longitude:longitude];
    [v4 setGeoLocation:v7];
  }
  double v8 = [WFGeocodeResponse alloc];
  CLLocationCoordinate2D v9 = [(WFLocationQueryGeocode *)self identifier];
  uint64_t v10 = [v9 UUID];
  uint64_t v11 = [(WFGeocodeResponse *)v8 initWithIdentifier:v10 location:v4];

  objc_storeStrong((id *)&self->_response, v11);
  uint64_t v12 = WFLogForCategory(3uLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[WFLocationQueryGeocode handleSearchResponseWithLocation:](self, v12);
  }

  uint64_t v13 = [(WFLocationQueryGeocode *)self resultHandler];

  if (v13)
  {
    uint64_t v14 = [(WFLocationQueryGeocode *)self resultHandler];
    ((void (**)(void, WFGeocodeResponse *))v14)[2](v14, v11);
  }
}

- (void)_handleErrorResponse:(id)a3
{
  id v4 = a3;
  double v5 = [WFGeocodeResponse alloc];
  id v6 = [(WFLocationQueryGeocode *)self identifier];
  double v7 = [v6 UUID];
  double v8 = [(WFGeocodeResponse *)v5 initWithIdentifier:v7 location:0];

  CLLocationCoordinate2D v9 = [v4 domain];
  if ([v9 isEqualToString:*MEMORY[0x263F00AF8]])
  {
    uint64_t v10 = [v4 code];

    if (v10 != 10) {
      goto LABEL_5;
    }
    objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:encapsulatedError:userInfo:", 13, v4, 0);
    CLLocationCoordinate2D v9 = v4;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_5:
  [(WFResponse *)v8 setError:v4];
  objc_storeStrong((id *)&self->_response, v8);
  uint64_t v11 = WFLogForCategory(3uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    [(WFLocationQueryGeocode *)self _handleErrorResponse:v11];
  }

  uint64_t v12 = [(WFLocationQueryGeocode *)self resultHandler];

  if (v12)
  {
    uint64_t v13 = [(WFLocationQueryGeocode *)self resultHandler];
    ((void (**)(void, WFGeocodeResponse *))v13)[2](v13, v8);
  }
}

- (WFTaskIdentifier)identifier
{
  return (WFTaskIdentifier *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (MKLocalSearchCompletion)searchCompletion
{
  return (MKLocalSearchCompletion *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)searchString
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (id)resultHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setResultHandler:(id)a3
{
}

- (WFResponse)response
{
  return (WFResponse *)objc_getProperty(self, a2, 48, 1);
}

- (void)setResponse:(id)a3
{
}

- (CLGeocoder)reverseGeocoder
{
  return self->_reverseGeocoder;
}

- (void)setReverseGeocoder:(id)a3
{
}

- (MKLocalSearch)search
{
  return self->_search;
}

- (void)setSearch:(id)a3
{
}

- (CLLocationCoordinate2D)searchCoordinate
{
  double latitude = self->_searchCoordinate.latitude;
  double longitude = self->_searchCoordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)setSearchCoordinate:(CLLocationCoordinate2D)a3
{
  self->_searchCoordinate = a3;
}

- (CLLocationCoordinate2D)unshiftedCoordinate
{
  double latitude = self->_unshiftedCoordinate.latitude;
  double longitude = self->_unshiftedCoordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)setUnshiftedCoordinate:(CLLocationCoordinate2D)a3
{
  self->_unshiftedCoordinate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_search, 0);
  objc_storeStrong((id *)&self->_reverseGeocoder, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_searchCompletion, 0);
  objc_storeStrong((id *)&self->identifier, 0);
}

- (void)initWithSearchString:resultHandler:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_21C988000, v0, v1, "Building WFLocationQueryGeocode for search string %@", v2);
}

- (void)initWithCoordinate:(double)a3 resultHandler:.cold.1(NSObject *a1, double a2, double a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v4 = NSStringFromCLLocationCoordinate2D(a2, a3);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_21C988000, a1, v5, "Building WFLocationQueryGeocode for coordinate %@", v6);
}

- (void)isLocationValid:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)isLocationValid:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)isLocationValid:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)handleSearchResponseWithLocation:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 _reverseGeocoderLocation];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [a1 _mkLocalSearchRequest];
  }
  int v7 = 138412290;
  double v8 = v6;
  OUTLINED_FUNCTION_2_0(&dword_21C988000, a2, v4, "WFLocationQueryGeocode w/ search '%@' succeeded.", (uint8_t *)&v7);
  if (!v5) {
}
  }

- (void)_handleErrorResponse:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 searchString];
  OUTLINED_FUNCTION_2();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_21C988000, a3, OS_LOG_TYPE_ERROR, "WFLocationQueryGeocode w/ search string '%@' failed with error  Error: %@", v6, 0x16u);
}

@end