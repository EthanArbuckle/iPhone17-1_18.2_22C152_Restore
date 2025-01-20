@interface NavigationCustomFeatureItem
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
- (NSSet)keys;
- (NavigationCustomFeatureItem)initWithMapItem:(id)a3;
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

@implementation NavigationCustomFeatureItem

- (NavigationCustomFeatureItem)initWithMapItem:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NavigationCustomFeatureItem;
  v6 = [(NavigationCustomFeatureItem *)&v24 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mapItem, a3);
    v8 = [[SearchResult alloc] initWithMapItem:v5];
    searchResult = v7->_searchResult;
    v7->_searchResult = v8;

    v10 = [PersonalizedMapItemKey alloc];
    v11 = [(NavigationCustomFeatureItem *)v7 mapItem];
    v12 = [(PersonalizedMapItemKey *)v10 initWithMapItem:v11];
    uint64_t v13 = +[NSSet setWithObject:v12];
    keys = v7->_keys;
    v7->_keys = (NSSet *)v13;

    v15 = [(NavigationCustomFeatureItem *)v7 mapItem];
    v16 = [v15 _styleAttributes];
    id v17 = [v16 copy];
    v18 = v17;
    if (v17)
    {
      id v19 = v17;
    }
    else
    {
      id v19 = +[GEOFeatureStyleAttributes markerStyleAttributes];
    }
    v20 = v19;

    long long v25 = xmmword_100F73640;
    [v20 replaceAttributes:&v25 count:2];
    uint64_t v21 = +[PersonalizedItemStyleAttributesAdornment adornmentWithStyleAttributes:v20];
    styleAttributes = v7->_styleAttributes;
    v7->_styleAttributes = (PersonalizedItemStyleAttributesAdornment *)v21;
  }
  return v7;
}

- (unint64_t)priority
{
  return 0;
}

- (CLLocationCoordinate2D)coordinate
{
  v2 = [(NavigationCustomFeatureItem *)self mapItem];
  [v2 _coordinate];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.longitude = v8;
  result.latitude = v7;
  return result;
}

- (GEOEnhancedPlacement)enhancedPlacement
{
  v2 = [(NavigationCustomFeatureItem *)self mapItem];
  double v3 = [v2 _enhancedPlacement];

  return (GEOEnhancedPlacement *)v3;
}

- (GEOLabelGeometry)labelGeometry
{
  v2 = [(NavigationCustomFeatureItem *)self mapItem];
  double v3 = [v2 _labelGeometry];

  return (GEOLabelGeometry *)v3;
}

- (PersonalizedItemPrioritizedStringAdornment)prefix
{
  return (PersonalizedItemPrioritizedStringAdornment *)+[PersonalizedItemPrioritizedStringAdornment defaultAdornment];
}

- (PersonalizedItemPrioritizedStringAdornment)title
{
  v2 = [(NavigationCustomFeatureItem *)self mapItem];
  double v3 = [v2 name];
  double v4 = +[PersonalizedItemPrioritizedStringAdornment adornmentWithString:v3 priority:1];

  return (PersonalizedItemPrioritizedStringAdornment *)v4;
}

- (PersonalizedItemPrioritizedStringAdornment)subtitle
{
  v2 = [(NavigationCustomFeatureItem *)self mapItem];
  double v3 = [v2 _maps_detourTextForIdiom:0];

  double v4 = +[PersonalizedItemPrioritizedStringAdornment adornmentWithString:v3 priority:1];

  return (PersonalizedItemPrioritizedStringAdornment *)v4;
}

- (PersonalizedItemClientFeatureIDAdornment)clientFeatureID
{
  double v3 = [(NavigationCustomFeatureItem *)self styleAttributes];
  double v4 = [v3 styleAttributes];
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
  objc_super v24 = [v23 name];

  if (v24)
  {
    long long v25 = [(MKMapItem *)self->_mapItem _geoMapItem];
    v26 = [v25 name];
    v22 ^= (unint64_t)[v26 hash];
  }

  return +[PersonalizedItemClientFeatureIDAdornment adornmentWithClientFeatureID:v22];
}

- (unint64_t)sortOrder
{
  return 0;
}

- (BOOL)shouldBeClustered
{
  return 1;
}

- (BOOL)showsBalloonCallout
{
  return 1;
}

- (BOOL)shouldBeHiddenFromMap
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

- (SearchDotPlace)searchDotPlace
{
  return 0;
}

- (NSSet)keys
{
  return self->_keys;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (SearchResult)searchResult
{
  return self->_searchResult;
}

- (PersonalizedItemSource)source
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_source);

  return (PersonalizedItemSource *)WeakRetained;
}

- (void)setSource:(id)a3
{
}

- (PersonalizedItemStyleAttributesAdornment)styleAttributes
{
  return self->_styleAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_destroyWeak((id *)&self->_source);
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);

  objc_storeStrong((id *)&self->_keys, 0);
}

@end