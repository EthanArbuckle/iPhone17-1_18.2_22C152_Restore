@interface ParkedCarPersonalizedItem
- (AddressBookAddress)address;
- (BOOL)mustRefineMapItem;
- (BOOL)shouldBeClustered;
- (BOOL)shouldBeHiddenFromMap;
- (BOOL)showsBalloonCallout;
- (CLLocationCoordinate2D)coordinate;
- (GEOEnhancedPlacement)enhancedPlacement;
- (GEOLabelGeometry)labelGeometry;
- (MKMapItem)mapItem;
- (NSArray)searchableStrings;
- (NSDate)eventDate;
- (NSSet)keys;
- (ParkedCar)parkedCar;
- (ParkedCarPersonalizedItem)initWithParkedCar:(id)a3;
- (PersonalizedItemClientFeatureIDAdornment)clientFeatureID;
- (PersonalizedItemPrioritizedStringAdornment)prefix;
- (PersonalizedItemPrioritizedStringAdornment)subtitle;
- (PersonalizedItemPrioritizedStringAdornment)title;
- (PersonalizedItemSource)source;
- (PersonalizedItemStyleAttributesAdornment)styleAttributes;
- (SearchDotPlace)searchDotPlace;
- (SearchResult)searchResult;
- (VKLabelMarker)sourceLabelMarker;
- (unint64_t)priority;
- (unint64_t)sortOrder;
- (void)setSource:(id)a3;
@end

@implementation ParkedCarPersonalizedItem

- (ParkedCarPersonalizedItem)initWithParkedCar:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ParkedCarPersonalizedItem;
  v6 = [(ParkedCarPersonalizedItem *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_parkedCar, a3);
    uint64_t v8 = [v5 mapItem];
    mapItem = v7->_mapItem;
    v7->_mapItem = (MKMapItem *)v8;

    [v5 coordinate];
    v7->_coordinate.latitude = v10;
    v7->_coordinate.longitude = v11;
    uint64_t v12 = [v5 title];
    title = v7->_title;
    v7->_title = (NSString *)v12;
  }
  return v7;
}

- (GEOEnhancedPlacement)enhancedPlacement
{
  return (GEOEnhancedPlacement *)[(MKMapItem *)self->_mapItem _enhancedPlacement];
}

- (GEOLabelGeometry)labelGeometry
{
  return (GEOLabelGeometry *)[(MKMapItem *)self->_mapItem _labelGeometry];
}

- (unint64_t)priority
{
  return 0;
}

- (NSSet)keys
{
  v2 = +[ParkedCar personalizedItemKey];
  v3 = +[NSSet setWithObject:v2];

  return (NSSet *)v3;
}

- (PersonalizedItemPrioritizedStringAdornment)title
{
  return +[PersonalizedItemPrioritizedStringAdornment adornmentWithString:self->_title priority:1];
}

- (PersonalizedItemPrioritizedStringAdornment)prefix
{
  return (PersonalizedItemPrioritizedStringAdornment *)+[PersonalizedItemPrioritizedStringAdornment defaultAdornment];
}

- (PersonalizedItemPrioritizedStringAdornment)subtitle
{
  return (PersonalizedItemPrioritizedStringAdornment *)+[PersonalizedItemPrioritizedStringAdornment defaultAdornment];
}

- (PersonalizedItemStyleAttributesAdornment)styleAttributes
{
  v2 = +[GEOFeatureStyleAttributes parkedCarStyleAttributes];
  v3 = +[PersonalizedItemStyleAttributesAdornment adornmentWithStyleAttributes:v2];

  return (PersonalizedItemStyleAttributesAdornment *)v3;
}

- (PersonalizedItemClientFeatureIDAdornment)clientFeatureID
{
  v3 = [(ParkedCarPersonalizedItem *)self styleAttributes];
  v4 = [v3 styleAttributes];
  uint64_t v5 = (int)[v4 poiType];
  double latitude = self->_coordinate.latitude;
  double v7 = -latitude;
  if (latitude >= 0.0) {
    double v7 = self->_coordinate.latitude;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  double v10 = fmod(v8, 1.84467441e19);
  unint64_t v11 = 2654435761u * (unint64_t)v10;
  unint64_t v12 = v11 + (unint64_t)v9;
  if (v9 <= 0.0) {
    unint64_t v12 = 2654435761u * (unint64_t)v10;
  }
  unint64_t v13 = v11 - (unint64_t)fabs(v9);
  if (v9 >= 0.0) {
    unint64_t v13 = v12;
  }
  unint64_t v14 = v13 ^ v5;
  double longitude = self->_coordinate.longitude;
  double v16 = -longitude;
  if (longitude >= 0.0) {
    double v16 = self->_coordinate.longitude;
  }
  long double v17 = floor(v16 + 0.5);
  double v18 = (v16 - v17) * 1.84467441e19;
  double v19 = fmod(v17, 1.84467441e19);
  unint64_t v20 = 2654435761u * (unint64_t)v19;
  unint64_t v21 = v20 + (unint64_t)v18;
  if (v18 <= 0.0) {
    unint64_t v21 = 2654435761u * (unint64_t)v19;
  }
  unint64_t v22 = v20 - (unint64_t)fabs(v18);
  if (v18 >= 0.0) {
    unint64_t v22 = v21;
  }
  unint64_t v23 = v14 ^ v22;

  v24 = [(MKMapItem *)self->_mapItem _geoMapItem];
  v25 = [v24 name];

  if (v25)
  {
    v26 = [(MKMapItem *)self->_mapItem _geoMapItem];
    v27 = [v26 name];
    v23 ^= (unint64_t)[v27 hash];
  }

  return +[PersonalizedItemClientFeatureIDAdornment adornmentWithClientFeatureID:v23];
}

- (unint64_t)sortOrder
{
  return 0;
}

- (BOOL)shouldBeClustered
{
  return 0;
}

- (BOOL)showsBalloonCallout
{
  return 1;
}

- (BOOL)shouldBeHiddenFromMap
{
  return 0;
}

- (SearchResult)searchResult
{
  return 0;
}

- (VKLabelMarker)sourceLabelMarker
{
  return 0;
}

- (BOOL)mustRefineMapItem
{
  return 0;
}

- (NSDate)eventDate
{
  return 0;
}

- (AddressBookAddress)address
{
  return 0;
}

- (NSArray)searchableStrings
{
  return (NSArray *)&__NSArray0__struct;
}

- (SearchDotPlace)searchDotPlace
{
  return 0;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (PersonalizedItemSource)source
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_source);

  return (PersonalizedItemSource *)WeakRetained;
}

- (void)setSource:(id)a3
{
}

- (ParkedCar)parkedCar
{
  return self->_parkedCar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parkedCar, 0);
  objc_destroyWeak((id *)&self->_source);
  objc_storeStrong((id *)&self->_mapItem, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end