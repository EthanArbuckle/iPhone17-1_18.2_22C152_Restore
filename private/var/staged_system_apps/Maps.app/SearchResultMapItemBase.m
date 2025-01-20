@interface SearchResultMapItemBase
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
- (PersonalizedItemClientFeatureIDAdornment)clientFeatureID;
- (PersonalizedItemPrioritizedStringAdornment)prefix;
- (PersonalizedItemPrioritizedStringAdornment)subtitle;
- (PersonalizedItemPrioritizedStringAdornment)title;
- (PersonalizedItemSource)source;
- (PersonalizedItemStyleAttributesAdornment)styleAttributes;
- (SearchDotPlace)searchDotPlace;
- (SearchResult)searchResult;
- (SearchResultMapItemBase)init;
- (SearchResultMapItemBase)initWithSearchResult:(id)a3;
- (VKLabelMarker)sourceLabelMarker;
- (int64_t)preferredDisplayedSearchResultType;
- (unint64_t)priority;
- (unint64_t)sortOrder;
- (void)setPreferredDisplayedSearchResultType:(int64_t)a3;
- (void)setShouldBeHiddenFromMap:(BOOL)a3;
- (void)setSortOrder:(unint64_t)a3;
- (void)setSource:(id)a3;
@end

@implementation SearchResultMapItemBase

- (SearchResultMapItemBase)init
{
  return 0;
}

- (SearchResultMapItemBase)initWithSearchResult:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SearchResultMapItemBase;
  v6 = [(SearchResultMapItemBase *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_searchResult, a3);
    uint64_t v8 = [v5 personalizedItemKey];
    key = v7->_key;
    v7->_key = (PersonalizedItemKey *)v8;

    v7->_shouldBeHiddenFromMap = 0;
  }

  return v7;
}

- (NSSet)keys
{
  if (self->_key) {
    +[NSSet setWithObject:](NSSet, "setWithObject:");
  }
  else {
  v2 = +[NSSet set];
  }

  return (NSSet *)v2;
}

- (unint64_t)priority
{
  return 4;
}

- (CLLocationCoordinate2D)coordinate
{
  [(SearchResult *)self->_searchResult labelCoordinate];
  BOOL v3 = CLLocationCoordinate2DIsValid(v8);
  searchResult = self->_searchResult;
  if (v3)
  {
    [(SearchResult *)searchResult labelCoordinate];
  }
  else
  {
    [(SearchResult *)searchResult coordinate];
  }
  result.longitude = v6;
  result.latitude = v5;
  return result;
}

- (GEOEnhancedPlacement)enhancedPlacement
{
  v2 = [(SearchResultMapItemBase *)self mapItem];
  BOOL v3 = [v2 _enhancedPlacement];

  return (GEOEnhancedPlacement *)v3;
}

- (GEOLabelGeometry)labelGeometry
{
  v2 = [(SearchResultMapItemBase *)self mapItem];
  BOOL v3 = [v2 _labelGeometry];

  return (GEOLabelGeometry *)v3;
}

- (MKMapItem)mapItem
{
  return [(SearchResult *)self->_searchResult mapItem];
}

- (PersonalizedItemPrioritizedStringAdornment)title
{
  v2 = [(SearchResult *)self->_searchResult title];
  BOOL v3 = +[PersonalizedItemPrioritizedStringAdornment adornmentWithString:v2 priority:1];

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
  return (PersonalizedItemStyleAttributesAdornment *)+[PersonalizedItemStyleAttributesAdornment defaultAdornment];
}

- (PersonalizedItemClientFeatureIDAdornment)clientFeatureID
{
  return (PersonalizedItemClientFeatureIDAdornment *)+[PersonalizedItemClientFeatureIDAdornment defaultAdornment];
}

- (BOOL)shouldBeClustered
{
  return 0;
}

- (BOOL)showsBalloonCallout
{
  return 1;
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
  return [(SearchResult *)self->_searchResult address];
}

- (NSArray)searchableStrings
{
  return 0;
}

- (SearchDotPlace)searchDotPlace
{
  return 0;
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

- (SearchResult)searchResult
{
  return self->_searchResult;
}

- (BOOL)shouldBeHiddenFromMap
{
  return self->_shouldBeHiddenFromMap;
}

- (void)setShouldBeHiddenFromMap:(BOOL)a3
{
  self->_shouldBeHiddenFromMap = a3;
}

- (int64_t)preferredDisplayedSearchResultType
{
  return self->_preferredDisplayedSearchResultType;
}

- (void)setPreferredDisplayedSearchResultType:(int64_t)a3
{
  self->_preferredDisplayedSearchResultType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_destroyWeak((id *)&self->source);

  objc_storeStrong((id *)&self->_key, 0);
}

@end