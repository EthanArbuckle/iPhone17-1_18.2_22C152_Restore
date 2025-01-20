@interface SearchDotPlacePersonalizedItem
- (AddressBookAddress)address;
- (BOOL)mustRefineMapItem;
- (BOOL)shouldBeClustered;
- (BOOL)shouldBeHiddenFromMap;
- (BOOL)showsBalloonCallout;
- (CLLocationCoordinate2D)coordinate;
- (GEOEnhancedPlacement)enhancedPlacement;
- (GEOFeatureStyleAttributes)style;
- (GEOLabelGeometry)labelGeometry;
- (MKMapItem)mapItem;
- (NSArray)searchableStrings;
- (NSSet)keys;
- (NSString)name;
- (PersonalizedItemClientFeatureIDAdornment)clientFeatureID;
- (PersonalizedItemPrioritizedStringAdornment)prefix;
- (PersonalizedItemPrioritizedStringAdornment)subtitle;
- (PersonalizedItemPrioritizedStringAdornment)title;
- (PersonalizedItemSource)source;
- (PersonalizedItemStyleAttributesAdornment)styleAttributes;
- (SearchDotPlace)searchDotPlace;
- (SearchDotPlaceItemKey)key;
- (SearchDotPlacePersonalizedItem)initWithSearchDotPlace:(id)a3;
- (SearchResult)searchResult;
- (VKLabelMarker)sourceLabelMarker;
- (unint64_t)priority;
- (unint64_t)sortOrder;
- (void)setKey:(id)a3;
- (void)setName:(id)a3;
- (void)setShouldBeHiddenFromMap:(BOOL)a3;
- (void)setSource:(id)a3;
- (void)setStyle:(id)a3;
@end

@implementation SearchDotPlacePersonalizedItem

- (SearchDotPlacePersonalizedItem)initWithSearchDotPlace:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SearchDotPlacePersonalizedItem;
  v6 = [(SearchDotPlacePersonalizedItem *)&v20 init];
  if (v6)
  {
    v7 = [[SearchDotPlaceItemKey alloc] initWithSearchDotPlace:v5];
    key = v6->_key;
    v6->_key = v7;

    [v5 coordinate];
    v6->_coordinate.latitude = v9;
    v6->_coordinate.longitude = v10;
    uint64_t v11 = [v5 name];
    name = v6->_name;
    v6->_name = (NSString *)v11;

    id v13 = objc_alloc((Class)GEOFeatureStyleAttributes);
    v14 = [v5 styleAttributes];
    v15 = (GEOFeatureStyleAttributes *)[v13 initWithGEOStyleAttributes:v14];
    style = v6->_style;
    v6->_style = v15;

    uint64_t v17 = [v5 mapItem];
    mapItem = v6->_mapItem;
    v6->_mapItem = (MKMapItem *)v17;

    objc_storeStrong((id *)&v6->_searchDotPlace, a3);
  }

  return v6;
}

- (GEOEnhancedPlacement)enhancedPlacement
{
  return (GEOEnhancedPlacement *)[(MKMapItem *)self->_mapItem _enhancedPlacement];
}

- (GEOLabelGeometry)labelGeometry
{
  return (GEOLabelGeometry *)[(MKMapItem *)self->_mapItem _labelGeometry];
}

- (NSSet)keys
{
  id v3 = objc_alloc((Class)NSSet);
  v4 = [(SearchDotPlacePersonalizedItem *)self key];
  id v5 = [v3 initWithObjects:v4, 0];

  return (NSSet *)v5;
}

- (unint64_t)priority
{
  return 5;
}

- (PersonalizedItemPrioritizedStringAdornment)title
{
  v2 = [(SearchDotPlacePersonalizedItem *)self name];
  id v3 = +[PersonalizedItemPrioritizedStringAdornment adornmentWithString:v2 priority:0];

  return (PersonalizedItemPrioritizedStringAdornment *)v3;
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
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v9[0] = &off_1013AA450;
  v9[1] = &off_1013AA480;
  v10[0] = &off_1013AA468;
  v10[1] = &off_1013AA498;
  v9[2] = &off_1013AA4B0;
  v9[3] = &off_1013AA4C8;
  v10[2] = &off_1013AA498;
  v10[3] = &off_1013AA498;
  v9[4] = &off_1013AA4E0;
  v10[4] = &off_1013AA4F8;
  v4 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:5];
  [v3 addEntriesFromDictionary:v4];

  id v5 = [(SearchDotPlacePersonalizedItem *)self style];
  id v6 = [v3 copy];
  v7 = +[PersonalizedItemStyleAttributesAdornment adornmentWithStyleAttributes:v5 additionalAttributes:v6];

  return (PersonalizedItemStyleAttributesAdornment *)v7;
}

- (PersonalizedItemClientFeatureIDAdornment)clientFeatureID
{
  id v3 = [(SearchDotPlacePersonalizedItem *)self styleAttributes];
  v4 = [v3 styleAttributes];
  uint64_t v5 = (int)[v4 poiType];
  [(MKMapItem *)self->_mapItem _coordinate];
  double v7 = -v6;
  if (v6 >= 0.0) {
    double v7 = v6;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  unint64_t v11 = v10 + (unint64_t)v9;
  double v12 = fabs(v9);
  if (v9 <= 0.0) {
    unint64_t v11 = v10;
  }
  unint64_t v13 = v10 - (unint64_t)v12;
  if (v9 >= 0.0) {
    unint64_t v13 = v11;
  }
  unint64_t v14 = v13 ^ v5;
  [(MKMapItem *)self->_mapItem _coordinate];
  if (v15 < 0.0) {
    double v15 = -v15;
  }
  long double v16 = floor(v15 + 0.5);
  double v17 = (v15 - v16) * 1.84467441e19;
  double v18 = fmod(v16, 1.84467441e19);
  unint64_t v19 = 2654435761u * (unint64_t)v18;
  unint64_t v20 = v19 + (unint64_t)v17;
  if (v17 <= 0.0) {
    unint64_t v20 = 2654435761u * (unint64_t)v18;
  }
  unint64_t v21 = v19 - (unint64_t)fabs(v17);
  if (v17 >= 0.0) {
    unint64_t v21 = v20;
  }
  unint64_t v22 = v14 ^ v21;

  v23 = [(MKMapItem *)self->_mapItem _geoMapItem];
  v24 = [v23 name];

  if (v24)
  {
    v25 = [(MKMapItem *)self->_mapItem _geoMapItem];
    v26 = [v25 name];
    v22 ^= (unint64_t)[v26 hash];
  }

  return +[PersonalizedItemClientFeatureIDAdornment adornmentWithClientFeatureID:v22];
}

- (BOOL)shouldBeClustered
{
  return 0;
}

- (BOOL)showsBalloonCallout
{
  return 0;
}

- (BOOL)mustRefineMapItem
{
  return 0;
}

- (VKLabelMarker)sourceLabelMarker
{
  return 0;
}

- (AddressBookAddress)address
{
  return 0;
}

- (NSArray)searchableStrings
{
  return 0;
}

- (SearchResult)searchResult
{
  return 0;
}

- (unint64_t)sortOrder
{
  return 0;
}

- (PersonalizedItemSource)source
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_source);

  return (PersonalizedItemSource *)WeakRetained;
}

- (void)setSource:(id)a3
{
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

- (SearchDotPlaceItemKey)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BOOL)shouldBeHiddenFromMap
{
  return self->_shouldBeHiddenFromMap;
}

- (void)setShouldBeHiddenFromMap:(BOOL)a3
{
  self->_shouldBeHiddenFromMap = a3;
}

- (GEOFeatureStyleAttributes)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
}

- (SearchDotPlace)searchDotPlace
{
  return self->_searchDotPlace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchDotPlace, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);

  objc_destroyWeak((id *)&self->_source);
}

@end