@interface ReportASearchAutocompleteResult
+ (id)identifier;
- (CLLocationCoordinate2D)coordinate;
- (GEORPPlaceInfo)placeInfo;
- (MKMapItem)mapItem;
- (NSString)sourceApplication;
- (NSString)sourceURL;
- (NSString)userVisibleTitle;
- (ReportASearchAutocompleteResult)initWithTitle:(id)a3;
- (int64_t)source;
@end

@implementation ReportASearchAutocompleteResult

+ (id)identifier
{
  return @"ReportASearchAutocompleteResult";
}

- (ReportASearchAutocompleteResult)initWithTitle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ReportASearchAutocompleteResult;
  v6 = [(ReportASearchAutocompleteResult *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_userVisibleTitle, a3);
  }

  return v7;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = kCLLocationCoordinate2DInvalid.latitude;
  double longitude = kCLLocationCoordinate2DInvalid.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (int64_t)source
{
  return 7;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (GEORPPlaceInfo)placeInfo
{
  return self->_placeInfo;
}

- (NSString)sourceApplication
{
  return self->_sourceApplication;
}

- (NSString)sourceURL
{
  return self->_sourceURL;
}

- (NSString)userVisibleTitle
{
  return self->_userVisibleTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userVisibleTitle, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_sourceApplication, 0);
  objc_storeStrong((id *)&self->_placeInfo, 0);

  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end