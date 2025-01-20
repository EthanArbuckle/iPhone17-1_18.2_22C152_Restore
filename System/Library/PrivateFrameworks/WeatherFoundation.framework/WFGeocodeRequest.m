@interface WFGeocodeRequest
- (CLLocationCoordinate2D)coordinate;
- (MKLocalSearchCompletion)autocompleteSearchResult;
- (NSString)searchString;
- (WFGeocodeRequest)initWithCoordinate:(CLLocationCoordinate2D)a3 resultHandler:(id)a4;
- (WFGeocodeRequest)initWithSearchCompletion:(id)a3 resultHandler:(id)a4;
- (WFGeocodeRequest)initWithSearchString:(id)a3 resultHandler:(id)a4;
- (WFLocation)geocodedResult;
- (id)description;
- (id)resultHandler;
- (void)cleanup;
- (void)handleCancellation;
- (void)handleError:(id)a3 forResponseIdentifier:(id)a4;
- (void)handleResponse:(id)a3;
- (void)setAutocompleteSearchResult:(id)a3;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
- (void)setGeocodedResult:(id)a3;
- (void)setSearchString:(id)a3;
- (void)startWithService:(id)a3;
@end

@implementation WFGeocodeRequest

- (WFGeocodeRequest)initWithCoordinate:(CLLocationCoordinate2D)a3 resultHandler:(id)a4
{
  CLLocationDegrees longitude = a3.longitude;
  CLLocationDegrees latitude = a3.latitude;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WFGeocodeRequest;
  v8 = [(WFTask *)&v14 initWithResponseRequired:1];
  v9 = v8;
  if (v8)
  {
    v8->_coordinate.CLLocationDegrees latitude = latitude;
    v8->_coordinate.CLLocationDegrees longitude = longitude;
    uint64_t v10 = [v7 copy];
    id resultHandler = v9->_resultHandler;
    v9->_id resultHandler = (id)v10;

    v12 = v9;
  }

  return v9;
}

- (WFGeocodeRequest)initWithSearchString:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFGeocodeRequest;
  v8 = [(WFTask *)&v15 initWithResponseRequired:1];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    searchString = v8->_searchString;
    v8->_searchString = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    id resultHandler = v8->_resultHandler;
    v8->_id resultHandler = (id)v11;

    v13 = v8;
  }

  return v8;
}

- (WFGeocodeRequest)initWithSearchCompletion:(id)a3 resultHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFGeocodeRequest;
  uint64_t v9 = [(WFTask *)&v15 initWithResponseRequired:1];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_autocompleteSearchResult, a3);
    uint64_t v11 = [v8 copy];
    id resultHandler = v10->_resultHandler;
    v10->_id resultHandler = (id)v11;

    v13 = v10;
  }

  return v10;
}

- (id)description
{
  v3 = [(WFGeocodeRequest *)self autocompleteSearchResult];

  if (v3)
  {
    v4 = [(WFGeocodeRequest *)self autocompleteSearchResult];
    v5 = [v4 calloutTitle];

    goto LABEL_9;
  }
  id v6 = [(WFGeocodeRequest *)self searchString];

  if (v6)
  {
    uint64_t v7 = [(WFGeocodeRequest *)self searchString];
LABEL_7:
    v5 = (__CFString *)v7;
    goto LABEL_9;
  }
  [(WFGeocodeRequest *)self coordinate];
  if (CLLocationCoordinate2DIsValid(v16))
  {
    [(WFGeocodeRequest *)self coordinate];
    uint64_t v7 = NSStringFromCLLocationCoordinate2D(v8, v9);
    goto LABEL_7;
  }
  v5 = @"<none>";
LABEL_9:
  uint64_t v10 = NSString;
  uint64_t v11 = objc_opt_class();
  v12 = [(WFTask *)self identifier];
  v13 = [v10 stringWithFormat:@"<%@: %p, input = %@, identifier = %@>", v11, self, v5, v12];

  return v13;
}

- (void)startWithService:(id)a3
{
  id v16 = a3;
  v4 = [(WFGeocodeRequest *)self autocompleteSearchResult];

  if (v4)
  {
    v5 = [(WFGeocodeRequest *)self autocompleteSearchResult];
    id v6 = [(WFTask *)self identifier];
    [v16 locationForSearchCompletion:v5 taskIdentifier:v6];
LABEL_5:

    goto LABEL_6;
  }
  uint64_t v7 = [(WFGeocodeRequest *)self searchString];

  if (v7)
  {
    v5 = [(WFGeocodeRequest *)self searchString];
    id v6 = [(WFTask *)self identifier];
    [v16 locationForString:v5 taskIdentifier:v6];
    goto LABEL_5;
  }
  [(WFGeocodeRequest *)self coordinate];
  if (CLLocationCoordinate2DIsValid(v18))
  {
    [(WFGeocodeRequest *)self coordinate];
    double v9 = v8;
    double v11 = v10;
    v5 = [(WFTask *)self identifier];
    objc_msgSend(v16, "locationForCoordinate:taskIdentifier:", v5, v9, v11);
  }
  else
  {
    v12 = [WFGeocodeResponse alloc];
    v13 = [(WFTask *)self identifier];
    objc_super v14 = [v13 UUID];
    v5 = [(WFResponse *)v12 initWithIdentifier:v14];

    objc_super v15 = objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:", 5);
    [(WFResponse *)v5 setError:v15];

    [(WFGeocodeRequest *)self handleResponse:v5];
  }
LABEL_6:
}

- (void)handleResponse:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [v5 location];
    [(WFGeocodeRequest *)self setGeocodedResult:v6];

    uint64_t v7 = [(WFGeocodeRequest *)self resultHandler];

    if (v7)
    {
      double v8 = [(WFGeocodeRequest *)self resultHandler];
      double v9 = [(WFGeocodeRequest *)self geocodedResult];
      double v10 = [v5 error];
      ((void (**)(void, void *, void *))v8)[2](v8, v9, v10);
    }
    v11.receiver = self;
    v11.super_class = (Class)WFGeocodeRequest;
    [(WFTask *)&v11 handleResponse:v5];
  }
  else
  {
    [(WFGeocodeRequest *)self handleCancellation];
  }
}

- (void)handleError:(id)a3 forResponseIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(WFGeocodeRequest *)self resultHandler];
  ((void (**)(void, void, id))v8)[2](v8, 0, v7);

  v9.receiver = self;
  v9.super_class = (Class)WFGeocodeRequest;
  [(WFTask *)&v9 handleError:v7 forResponseIdentifier:v6];
}

- (void)handleCancellation
{
  v3 = [(WFGeocodeRequest *)self resultHandler];

  if (v3)
  {
    id v4 = [(WFGeocodeRequest *)self resultHandler];
    id v5 = objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:", 13);
    ((void (**)(void, void, void *))v4)[2](v4, 0, v5);
  }
  id resultHandler = self->_resultHandler;
  self->_id resultHandler = 0;

  v7.receiver = self;
  v7.super_class = (Class)WFGeocodeRequest;
  [(WFTask *)&v7 handleCancellation];
}

- (void)cleanup
{
  id resultHandler = self->_resultHandler;
  self->_id resultHandler = 0;

  v4.receiver = self;
  v4.super_class = (Class)WFGeocodeRequest;
  [(WFTask *)&v4 cleanup];
}

- (id)resultHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (CLLocationCoordinate2D)coordinate
{
  objc_copyStruct(v4, &self->_coordinate, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CLLocationDegrees longitude = v3;
  result.CLLocationDegrees latitude = v2;
  return result;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  CLLocationCoordinate2D v3 = a3;
  objc_copyStruct(&self->_coordinate, &v3, 16, 1, 0);
}

- (NSString)searchString
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSearchString:(id)a3
{
}

- (MKLocalSearchCompletion)autocompleteSearchResult
{
  return (MKLocalSearchCompletion *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAutocompleteSearchResult:(id)a3
{
}

- (WFLocation)geocodedResult
{
  return (WFLocation *)objc_getProperty(self, a2, 56, 1);
}

- (void)setGeocodedResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geocodedResult, 0);
  objc_storeStrong((id *)&self->_autocompleteSearchResult, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong(&self->_resultHandler, 0);
}

@end