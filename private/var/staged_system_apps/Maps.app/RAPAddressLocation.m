@interface RAPAddressLocation
- (CLLocationCoordinate2D)coordinate;
- (CLPlacemark)placemark;
- (RAPAddressLocation)initWithCoordinate:(CLLocationCoordinate2D)a3;
- (void)_invokeCompletionBlocksWithFinishedFlag:(BOOL)a3;
- (void)cancelProcessing;
- (void)processWithGeocoderIfNeededWithCompletion:(id)a3;
@end

@implementation RAPAddressLocation

- (RAPAddressLocation)initWithCoordinate:(CLLocationCoordinate2D)a3
{
  CLLocationDegrees longitude = a3.longitude;
  CLLocationDegrees latitude = a3.latitude;
  v6.receiver = self;
  v6.super_class = (Class)RAPAddressLocation;
  result = [(RAPAddressLocation *)&v6 init];
  if (result)
  {
    result->_coordinate.CLLocationDegrees latitude = latitude;
    result->_coordinate.CLLocationDegrees longitude = longitude;
  }
  return result;
}

- (void)processWithGeocoderIfNeededWithCompletion:(id)a3
{
  v4 = (void (**)(id, RAPAddressLocation *, uint64_t))a3;
  v5 = [(RAPAddressLocation *)self placemark];

  if (v5)
  {
    if (v4) {
      v4[2](v4, self, 1);
    }
  }
  else
  {
    if (!self->_completionBlocks)
    {
      objc_super v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      completionBlocks = self->_completionBlocks;
      self->_completionBlocks = v6;
    }
    if (v4)
    {
      v8 = self->_completionBlocks;
      id v9 = [v4 copy];
      [(NSMutableArray *)v8 addObject:v9];
    }
    if (!self->_geocoder)
    {
      v10 = (CLGeocoder *)objc_alloc_init((Class)CLGeocoder);
      geocoder = self->_geocoder;
      self->_geocoder = v10;

      v12 = self->_geocoder;
      id v13 = objc_alloc((Class)CLLocation);
      v14 = +[NSDate date];
      id v15 = [v13 initWithCoordinate:v14 lat:self->_coordinate.latitude lon:self->_coordinate.longitude alt:0.0 horizAcc:0.0 vertAcc:0.0 timestamp:0.0];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1003AC460;
      v16[3] = &unk_1012E7610;
      v16[4] = self;
      [(CLGeocoder *)v12 reverseGeocodeLocation:v15 completionHandler:v16];
    }
  }
}

- (void)cancelProcessing
{
  [(CLGeocoder *)self->_geocoder cancelGeocode];
  geocoder = self->_geocoder;
  self->_geocoder = 0;

  [(RAPAddressLocation *)self _invokeCompletionBlocksWithFinishedFlag:0];
}

- (void)_invokeCompletionBlocksWithFinishedFlag:(BOOL)a3
{
  id v4 = [(NSMutableArray *)self->_completionBlocks copy];
  completionBlocks = self->_completionBlocks;
  self->_completionBlocks = 0;

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * (void)v10) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * (void)v10));
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (CLPlacemark)placemark
{
  return self->_placemark;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placemark, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);

  objc_storeStrong((id *)&self->_geocoder, 0);
}

@end