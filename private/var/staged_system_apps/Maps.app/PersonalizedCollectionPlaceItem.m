@interface PersonalizedCollectionPlaceItem
- (AddressBookAddress)address;
- (BOOL)hasPriorityOverride;
- (BOOL)hasServerItemIndex;
- (BOOL)hidden;
- (BOOL)isCompoundPersonalizedAutocompleteItem;
- (BOOL)mustRefineMapItem;
- (BOOL)needsToPreserveSelection;
- (BOOL)shouldBeClustered;
- (BOOL)shouldBeHiddenFromMap;
- (BOOL)shows;
- (BOOL)showsBalloonCallout;
- (CLLocationCoordinate2D)coordinate;
- (GEOEnhancedPlacement)enhancedPlacement;
- (GEOLabelGeometry)labelGeometry;
- (GEOServerResultScoreMetadata)serverResultScoreMetadata;
- (MKMapItem)mapItem;
- (NSArray)autocompletionStrings;
- (NSArray)searchableStrings;
- (NSDate)eventDate;
- (NSSet)keys;
- (NSString)description;
- (PersonalizedCollectionPlaceItem)initWithMapItem:(id)a3 title:(id)a4 libraryBadgeType:(unint64_t)a5;
- (PersonalizedItemClientFeatureIDAdornment)clientFeatureID;
- (PersonalizedItemPrioritizedStringAdornment)prefix;
- (PersonalizedItemPrioritizedStringAdornment)subtitle;
- (PersonalizedItemPrioritizedStringAdornment)title;
- (PersonalizedItemSource)source;
- (PersonalizedItemStyleAttributesAdornment)styleAttributes;
- (SearchDotPlace)searchDotPlace;
- (SearchResult)searchResult;
- (VKLabelMarker)sourceLabelMarker;
- (id)autocompleteObject;
- (id)leafPersonalizedAutocompleteItems;
- (int64_t)priorityOverride;
- (int64_t)sourceSubtype;
- (int64_t)sourceType;
- (unint64_t)priority;
- (unint64_t)serverItemIndexInSection;
- (unint64_t)serverSectionIndex;
- (unint64_t)sortOrder;
- (void)setSource:(id)a3;
@end

@implementation PersonalizedCollectionPlaceItem

- (PersonalizedCollectionPlaceItem)initWithMapItem:(id)a3 title:(id)a4 libraryBadgeType:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PersonalizedCollectionPlaceItem;
  v11 = [(PersonalizedCollectionPlaceItem *)&v22 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mapItem, a3);
    if (v10)
    {
      v13 = (NSString *)v10;
    }
    else
    {
      v13 = [(MKMapItem *)v12->_mapItem name];
    }
    title = v12->_title;
    v12->_title = v13;

    v12->_libraryBadgeType = a5;
    v15 = +[NSMutableSet set];
    v16 = [[PersonalizedMapItemKey alloc] initWithMapItem:v9];
    if (v16) {
      [v15 addObject:v16];
    }
    id v17 = [v9 _muid];
    if (v17)
    {
      v18 = [[PersonalizedMapItemMUIDKey alloc] initWithMUID:v17];
      if (v18) {
        [v15 addObject:v18];
      }
    }
    v19 = (NSSet *)[v15 copy];
    keys = v12->_keys;
    v12->_keys = v19;
  }
  return v12;
}

- (CLLocationCoordinate2D)coordinate
{
  [(MKMapItem *)self->_mapItem _coordinate];
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (NSSet)keys
{
  return self->_keys;
}

- (NSDate)eventDate
{
  return 0;
}

- (SearchResult)searchResult
{
  return self->_searchResult;
}

- (PersonalizedItemPrioritizedStringAdornment)title
{
  return +[PersonalizedItemPrioritizedStringAdornment adornmentWithString:self->_title priority:5];
}

- (PersonalizedItemPrioritizedStringAdornment)subtitle
{
  return (PersonalizedItemPrioritizedStringAdornment *)+[PersonalizedItemPrioritizedStringAdornment defaultAdornment];
}

- (unint64_t)sortOrder
{
  return 0;
}

- (GEOLabelGeometry)labelGeometry
{
  return (GEOLabelGeometry *)[(MKMapItem *)self->_mapItem _labelGeometry];
}

- (PersonalizedItemStyleAttributesAdornment)styleAttributes
{
  double v3 = [(MKMapItem *)self->_mapItem _styleAttributes];
  v4 = v3;
  if (!v3 || ([v3 hasAttributes] & 1) == 0)
  {
    uint64_t v5 = +[GEOFeatureStyleAttributes markerStyleAttributes];

    v4 = (void *)v5;
  }
  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    if (self->_libraryBadgeType <= 1) {
      unint64_t libraryBadgeType = 1;
    }
    else {
      unint64_t libraryBadgeType = self->_libraryBadgeType;
    }
  }
  else
  {
    unint64_t libraryBadgeType = 1;
  }
  v11[0] = &off_1013A6D30;
  v7 = +[NSNumber numberWithUnsignedInteger:libraryBadgeType];
  v11[1] = &off_1013A6D48;
  v12[0] = v7;
  v12[1] = &off_1013A6D60;
  v8 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  id v9 = +[PersonalizedItemStyleAttributesAdornment adornmentWithStyleAttributes:v4 additionalAttributes:v8];

  return (PersonalizedItemStyleAttributesAdornment *)v9;
}

- (int64_t)sourceType
{
  return 3;
}

- (int64_t)sourceSubtype
{
  return 1;
}

- (unint64_t)priority
{
  return 0;
}

- (BOOL)showsBalloonCallout
{
  return 1;
}

- (PersonalizedItemPrioritizedStringAdornment)prefix
{
  return (PersonalizedItemPrioritizedStringAdornment *)+[PersonalizedItemPrioritizedStringAdornment defaultAdornment];
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (GEOEnhancedPlacement)enhancedPlacement
{
  return (GEOEnhancedPlacement *)[(MKMapItem *)self->_mapItem _enhancedPlacement];
}

- (PersonalizedItemClientFeatureIDAdornment)clientFeatureID
{
  double v3 = [(PersonalizedCollectionPlaceItem *)self styleAttributes];
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

- (BOOL)shouldBeHiddenFromMap
{
  return self->_shouldBeHiddenFromMap;
}

- (BOOL)mustRefineMapItem
{
  return 0;
}

- (BOOL)shows
{
  return 1;
}

- (BOOL)needsToPreserveSelection
{
  return 1;
}

- (AddressBookAddress)address
{
  return 0;
}

- (VKLabelMarker)sourceLabelMarker
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

- (NSString)description
{
  double v3 = [(MKMapItem *)self->_mapItem name];
  v4 = +[NSString stringWithFormat:@"<PersonalizedCollectionPlaceItem %p: %@>", self, v3];

  return (NSString *)v4;
}

- (PersonalizedItemSource)source
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_source);

  return (PersonalizedItemSource *)WeakRetained;
}

- (void)setSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_source);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_keys, 0);
  objc_storeStrong((id *)&self->_autocompletionStrings, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_searchResult, 0);
}

- (id)autocompleteObject
{
  searchResult = self->_searchResult;
  if (!searchResult)
  {
    v4 = [[SearchResult alloc] initWithMapItem:self->_mapItem];
    uint64_t v5 = self->_searchResult;
    self->_searchResult = v4;

    searchResult = self->_searchResult;
  }

  return searchResult;
}

- (BOOL)hasPriorityOverride
{
  return 0;
}

- (int64_t)priorityOverride
{
  return 0;
}

- (GEOServerResultScoreMetadata)serverResultScoreMetadata
{
  return 0;
}

- (BOOL)hidden
{
  return 0;
}

- (NSArray)autocompletionStrings
{
  autocompletionStrings = self->_autocompletionStrings;
  if (!autocompletionStrings)
  {
    v4 = self;
    objc_sync_enter(v4);
    if (!self->_autocompletionStrings)
    {
      uint64_t v5 = +[AutocompleteMatchInfo matchInfoWithType:1];
      double v6 = [[AutocompleteStringMatcher alloc] initWithPlaceName:v4->_title matchInfo:v5];
      unint64_t v10 = v6;
      double v7 = +[NSArray arrayWithObjects:&v10 count:1];
      long double v8 = self->_autocompletionStrings;
      self->_autocompletionStrings = v7;
    }
    objc_sync_exit(v4);

    autocompletionStrings = self->_autocompletionStrings;
  }

  return autocompletionStrings;
}

- (BOOL)hasServerItemIndex
{
  return 0;
}

- (unint64_t)serverSectionIndex
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)serverItemIndexInSection
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isCompoundPersonalizedAutocompleteItem
{
  return 0;
}

- (id)leafPersonalizedAutocompleteItems
{
  v4 = self;
  double v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

@end