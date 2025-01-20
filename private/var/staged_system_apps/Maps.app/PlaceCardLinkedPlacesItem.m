@interface PlaceCardLinkedPlacesItem
- (AddressBookAddress)address;
- (BOOL)isChild;
- (BOOL)isParent;
- (BOOL)mustRefineMapItem;
- (BOOL)shouldBeClustered;
- (BOOL)shouldBeHiddenFromMap;
- (BOOL)showsBalloonCallout;
- (BOOL)wantsDisplayedSearchResultsTypePoints;
- (CLLocationCoordinate2D)coordinate;
- (GEOEnhancedPlacement)enhancedPlacement;
- (GEOLabelGeometry)labelGeometry;
- (MKMapItem)mapItem;
- (NSArray)searchableStrings;
- (NSSet)keys;
- (PersonalizedItemClientFeatureIDAdornment)clientFeatureID;
- (PersonalizedItemPrioritizedStringAdornment)prefix;
- (PersonalizedItemPrioritizedStringAdornment)subtitle;
- (PersonalizedItemPrioritizedStringAdornment)title;
- (PersonalizedItemSource)source;
- (PersonalizedItemStyleAttributesAdornment)styleAttributes;
- (PlaceCardLinkedPlacesItem)init;
- (PlaceCardLinkedPlacesItem)initWithGEOMapItem:(id)a3;
- (PlaceCardLinkedPlacesItem)initWithPersonalizedItem:(id)a3;
- (SearchDotPlace)searchDotPlace;
- (SearchResult)searchResult;
- (VKLabelMarker)sourceLabelMarker;
- (unint64_t)priority;
- (unint64_t)sortOrder;
- (void)setChild:(BOOL)a3;
- (void)setParent:(BOOL)a3;
- (void)setSortOrder:(unint64_t)a3;
- (void)setSource:(id)a3;
@end

@implementation PlaceCardLinkedPlacesItem

- (PlaceCardLinkedPlacesItem)init
{
  return 0;
}

- (PlaceCardLinkedPlacesItem)initWithPersonalizedItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PlaceCardLinkedPlacesItem;
  v6 = [(PlaceCardLinkedPlacesItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_personalizedItem, a3);
  }

  return v7;
}

- (PlaceCardLinkedPlacesItem)initWithGEOMapItem:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PlaceCardLinkedPlacesItem;
  v6 = [(PlaceCardLinkedPlacesItem *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_geoMapItem, a3);
    [v5 coordinate];
    v7->_coordinate = CLLocationCoordinate2DMake(v8, v9);
    v10 = [[PersonalizedMapItemKey alloc] initWithGeoMapItem:v5];
    key = v7->_key;
    v7->_key = (PersonalizedItemKey *)v10;

    v12 = (MKMapItem *)objc_msgSend(objc_alloc((Class)MKMapItem), "initWithGeoMapItem:isPlaceHolderPlace:", v5, objc_msgSend(v5, "_hasResolvablePartialInformation"));
    mapItem = v7->_mapItem;
    v7->_mapItem = v12;
  }
  return v7;
}

- (CLLocationCoordinate2D)coordinate
{
  personalizedItem = self->_personalizedItem;
  if (personalizedItem)
  {
    [(PersonalizedItem *)personalizedItem coordinate];
  }
  else
  {
    double latitude = self->_coordinate.latitude;
    double longitude = self->_coordinate.longitude;
  }
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (GEOEnhancedPlacement)enhancedPlacement
{
  personalizedItem = self->_personalizedItem;
  if (personalizedItem)
  {
    v4 = [(PersonalizedItem *)personalizedItem enhancedPlacement];
  }
  else
  {
    id v5 = [(PlaceCardLinkedPlacesItem *)self mapItem];
    v4 = [v5 _enhancedPlacement];
  }

  return (GEOEnhancedPlacement *)v4;
}

- (GEOLabelGeometry)labelGeometry
{
  personalizedItem = self->_personalizedItem;
  if (personalizedItem)
  {
    v4 = [(PersonalizedItem *)personalizedItem labelGeometry];
  }
  else
  {
    id v5 = [(PlaceCardLinkedPlacesItem *)self mapItem];
    v4 = [v5 _labelGeometry];
  }

  return (GEOLabelGeometry *)v4;
}

- (NSSet)keys
{
  personalizedItem = self->_personalizedItem;
  if (personalizedItem)
  {
    v4 = [(PersonalizedItem *)personalizedItem keys];
  }
  else
  {
    if (self->_key) {
      +[NSSet setWithObject:](NSSet, "setWithObject:");
    }
    else {
    v4 = +[NSSet set];
    }
  }

  return (NSSet *)v4;
}

- (MKMapItem)mapItem
{
  personalizedItem = self->_personalizedItem;
  if (personalizedItem)
  {
    v4 = [(PersonalizedItem *)personalizedItem mapItem];
  }
  else
  {
    v4 = self->_mapItem;
  }

  return v4;
}

- (unint64_t)priority
{
  unint64_t result = (unint64_t)self->_personalizedItem;
  if (result) {
    return (unint64_t)[(id)result priority];
  }
  return result;
}

- (PersonalizedItemPrioritizedStringAdornment)title
{
  personalizedItem = self->_personalizedItem;
  if (personalizedItem)
  {
    v4 = [(PersonalizedItem *)personalizedItem title];
  }
  else
  {
    uint64_t v5 = [(GEOMapItem *)self->_geoMapItem name];
    v6 = (void *)v5;
    v7 = &stru_101324E70;
    if (v5) {
      v7 = (__CFString *)v5;
    }
    CLLocationDegrees v8 = v7;

    v4 = +[PersonalizedItemPrioritizedStringAdornment adornmentWithString:v8 priority:100];
  }

  return (PersonalizedItemPrioritizedStringAdornment *)v4;
}

- (PersonalizedItemPrioritizedStringAdornment)subtitle
{
  personalizedItem = self->_personalizedItem;
  if (personalizedItem) {
    [(PersonalizedItem *)personalizedItem subtitle];
  }
  else {
  v3 = +[PersonalizedItemPrioritizedStringAdornment defaultAdornment];
  }

  return (PersonalizedItemPrioritizedStringAdornment *)v3;
}

- (PersonalizedItemPrioritizedStringAdornment)prefix
{
  personalizedItem = self->_personalizedItem;
  if (personalizedItem) {
    [(PersonalizedItem *)personalizedItem prefix];
  }
  else {
  v3 = +[PersonalizedItemPrioritizedStringAdornment defaultAdornment];
  }

  return (PersonalizedItemPrioritizedStringAdornment *)v3;
}

- (PersonalizedItemStyleAttributesAdornment)styleAttributes
{
  styleAttributes = self->_styleAttributes;
  if (!styleAttributes)
  {
    personalizedItem = self->_personalizedItem;
    if (personalizedItem)
    {
      uint64_t v5 = [(PersonalizedItem *)personalizedItem styleAttributes];
      id v6 = [v5 styleAttributes];

      if (v6) {
        goto LABEL_5;
      }
    }
    else
    {
      id v6 = [(GEOMapItem *)self->_geoMapItem _styleAttributes];
      if (v6)
      {
LABEL_5:
        id v7 = [v6 copy];

        CLLocationDegrees v8 = +[NSUserDefaults standardUserDefaults];
        unsigned int v9 = [v8 BOOLForKey:@"__internalChinaAOIInjectPOIsAsSearchResults"];

        if (v9)
        {
          uint64_t v14 = 0x100010022;
          [v7 replaceAttributes:&v14 count:1];
        }
        if ([(PlaceCardLinkedPlacesItem *)self isParent])
        {
          uint64_t v10 = 0x200000022;
        }
        else
        {
          if (![(PlaceCardLinkedPlacesItem *)self isChild])
          {
LABEL_12:
            uint64_t v14 = 0x100010024;
            [v7 replaceAttributes:&v14 count:1];
            v11 = self->_styleAttributes;
            self->_styleAttributes = (GEOFeatureStyleAttributes *)v7;

            styleAttributes = self->_styleAttributes;
            goto LABEL_13;
          }
          uint64_t v10 = 0x100000022;
        }
        uint64_t v14 = v10;
        [v7 replaceAttributes:&v14 count:1];
        goto LABEL_12;
      }
    }
    id v6 = [objc_alloc((Class)GEOFeatureStyleAttributes) initWithAttributes:4, 226, 5, 3, 6, 348, 10, 2, 0];
    goto LABEL_5;
  }
LABEL_13:
  v12 = +[PersonalizedItemStyleAttributesAdornment adornmentWithStyleAttributes:styleAttributes];

  return (PersonalizedItemStyleAttributesAdornment *)v12;
}

- (PersonalizedItemClientFeatureIDAdornment)clientFeatureID
{
  v3 = [(PlaceCardLinkedPlacesItem *)self styleAttributes];
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
  personalizedItem = self->_personalizedItem;
  if (personalizedItem) {
    LOBYTE(personalizedItem) = [(PersonalizedItem *)personalizedItem shouldBeClustered];
  }
  return (char)personalizedItem;
}

- (BOOL)showsBalloonCallout
{
  if (self->_personalizedItem)
  {
    personalizedItem = self->_personalizedItem;
    return [(PersonalizedItem *)personalizedItem showsBalloonCallout];
  }
  else
  {
    v4 = [(PlaceCardLinkedPlacesItem *)self styleAttributes];
    uint64_t v5 = [v4 styleAttributes];
    unsigned __int8 v6 = [v5 isLabelPOI];

    return v6 ^ 1;
  }
}

- (SearchResult)searchResult
{
  personalizedItem = self->_personalizedItem;
  if (personalizedItem)
  {
    personalizedItem = [personalizedItem searchResult];
  }

  return (SearchResult *)personalizedItem;
}

- (VKLabelMarker)sourceLabelMarker
{
  personalizedItem = self->_personalizedItem;
  if (personalizedItem)
  {
    personalizedItem = [personalizedItem sourceLabelMarker];
  }

  return (VKLabelMarker *)personalizedItem;
}

- (AddressBookAddress)address
{
  personalizedItem = self->_personalizedItem;
  if (personalizedItem)
  {
    personalizedItem = [personalizedItem address];
  }

  return (AddressBookAddress *)personalizedItem;
}

- (NSArray)searchableStrings
{
  personalizedItem = self->_personalizedItem;
  if (personalizedItem)
  {
    personalizedItem = [personalizedItem searchableStrings];
  }

  return (NSArray *)personalizedItem;
}

- (BOOL)mustRefineMapItem
{
  personalizedItem = self->_personalizedItem;
  if (personalizedItem) {
    return [(PersonalizedItem *)personalizedItem mustRefineMapItem];
  }
  else {
    return 1;
  }
}

- (BOOL)shouldBeHiddenFromMap
{
  personalizedItem = self->_personalizedItem;
  if (personalizedItem) {
    LOBYTE(personalizedItem) = [(PersonalizedItem *)personalizedItem shouldBeHiddenFromMap];
  }
  return (char)personalizedItem;
}

- (BOOL)wantsDisplayedSearchResultsTypePoints
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"__internalChinaAOIInjectPOIsAsSearchResults"];

  return v3;
}

- (SearchDotPlace)searchDotPlace
{
  personalizedItem = self->_personalizedItem;
  if (personalizedItem)
  {
    personalizedItem = [personalizedItem searchDotPlace];
  }

  return (SearchDotPlace *)personalizedItem;
}

- (PersonalizedItemSource)source
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->source);

  return (PersonalizedItemSource *)WeakRetained;
}

- (void)setSource:(id)a3
{
}

- (unint64_t)sortOrder
{
  return self->sortOrder;
}

- (void)setSortOrder:(unint64_t)a3
{
  self->sortOrder = a3;
}

- (BOOL)isParent
{
  return self->_parent;
}

- (void)setParent:(BOOL)a3
{
  self->_parent = a3;
}

- (BOOL)isChild
{
  return self->_child;
}

- (void)setChild:(BOOL)a3
{
  self->_child = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->source);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_geoMapItem, 0);

  objc_storeStrong((id *)&self->_personalizedItem, 0);
}

@end