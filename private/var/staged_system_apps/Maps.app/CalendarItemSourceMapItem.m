@interface CalendarItemSourceMapItem
- (AddressBookAddress)address;
- (BOOL)hasPriorityOverride;
- (BOOL)hasServerItemIndex;
- (BOOL)hidden;
- (BOOL)isCompoundPersonalizedAutocompleteItem;
- (BOOL)mustRefineMapItem;
- (BOOL)shouldBeClustered;
- (BOOL)shouldBeHiddenFromMap;
- (BOOL)showsBalloonCallout;
- (CLLocationCoordinate2D)coordinate;
- (CalendarItemSourceMapItem)init;
- (CalendarItemSourceMapItem)initWithCalendarItem:(id)a3 mapItem:(id)a4;
- (GEOEnhancedPlacement)enhancedPlacement;
- (GEOLabelGeometry)labelGeometry;
- (GEOServerResultScoreMetadata)serverResultScoreMetadata;
- (MKMapItem)mapItem;
- (NSArray)autocompletionStrings;
- (NSArray)searchableStrings;
- (NSDate)eventDate;
- (NSSet)keys;
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
- (void)setShouldBeHiddenFromMap:(BOOL)a3;
- (void)setSource:(id)a3;
@end

@implementation CalendarItemSourceMapItem

- (CalendarItemSourceMapItem)init
{
  return 0;
}

- (CalendarItemSourceMapItem)initWithCalendarItem:(id)a3 mapItem:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v39.receiver = self;
  v39.super_class = (Class)CalendarItemSourceMapItem;
  v9 = [(CalendarItemSourceMapItem *)&v39 init];
  v10 = v9;
  if (!v9) {
    goto LABEL_25;
  }
  id v38 = v7;
  p_calendarItem = (id *)&v9->_calendarItem;
  objc_storeStrong((id *)&v9->_calendarItem, a3);
  objc_storeStrong((id *)&v10->_mapItem, a4);
  v12 = [[PersonalizedMapItemKey alloc] initWithMapItem:v8];
  key = v10->_key;
  v10->_key = (PersonalizedItemKey *)v12;

  v14 = [v8 name];
  unsigned int v15 = [v8 _hasMUID];
  v16 = v10->_calendarItem;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v17 = [(EKCalendarItem *)v16 title];
    v18 = +[CalendarItemSource sharedDateFormatter];
    v19 = [(EKCalendarItem *)v16 startDate];
    v20 = [v18 stringFromDate:v19];
  }
  else
  {
    v20 = 0;
    v17 = 0;
  }
  id v21 = *p_calendarItem;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v22 = [v21 title];

    v17 = (void *)v22;
  }
  p_title = (id *)&v10->_title;
  if (!v15)
  {
    objc_storeStrong(p_title, v17);
    id v26 = v14;
    if ([v26 length])
    {
      id v27 = +[NSString stringWithFormat:@"\b%@\b", v26];
    }
    else
    {
      id v27 = v26;
    }
    v28 = v27;

    id v29 = v20;
    if ([v29 length]) {
      goto LABEL_17;
    }
LABEL_18:
    id v30 = v29;
    goto LABEL_19;
  }
  objc_storeStrong(p_title, v14);
  id v24 = v17;
  if ([v24 length])
  {
    id v25 = +[NSString stringWithFormat:@"\b%@\b", v24];
  }
  else
  {
    id v25 = v24;
  }
  v28 = v25;

  id v29 = v20;
  if (![v29 length]) {
    goto LABEL_18;
  }
LABEL_17:
  id v30 = +[NSString stringWithFormat:@"\b%@\b", v29];
LABEL_19:
  v31 = v30;

  id v32 = v28;
  id v33 = v31;
  if ([v32 length])
  {
    if ([v33 length])
    {
      v34 = +[NSString stringWithFormat:@"%@\n%@", v32, v33];
    }
    else
    {
      v34 = (NSString *)v32;
    }
  }
  else
  {
    v34 = (NSString *)v33;
  }
  v35 = v34;

  subtitle = v10->_subtitle;
  v10->_subtitle = v35;

  id v7 = v38;
LABEL_25:

  return v10;
}

- (NSSet)keys
{
  return +[NSSet setWithObject:self->_key];
}

- (unint64_t)priority
{
  return 2;
}

- (CLLocationCoordinate2D)coordinate
{
  [(MKMapItem *)self->_mapItem _coordinate];
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (GEOEnhancedPlacement)enhancedPlacement
{
  return (GEOEnhancedPlacement *)[(MKMapItem *)self->_mapItem _enhancedPlacement];
}

- (GEOLabelGeometry)labelGeometry
{
  return (GEOLabelGeometry *)[(MKMapItem *)self->_mapItem _labelGeometry];
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (unint64_t)sortOrder
{
  return 0;
}

- (PersonalizedItemPrioritizedStringAdornment)prefix
{
  return (PersonalizedItemPrioritizedStringAdornment *)+[PersonalizedItemPrioritizedStringAdornment defaultAdornment];
}

- (PersonalizedItemPrioritizedStringAdornment)title
{
  if ([(NSString *)self->_title length]) {
    +[PersonalizedItemPrioritizedStringAdornment adornmentWithString:self->_title priority:800];
  }
  else {
  double v3 = +[PersonalizedItemPrioritizedStringAdornment defaultAdornment];
  }

  return (PersonalizedItemPrioritizedStringAdornment *)v3;
}

- (PersonalizedItemPrioritizedStringAdornment)subtitle
{
  if ([(NSString *)self->_subtitle length]) {
    +[PersonalizedItemPrioritizedStringAdornment adornmentWithString:self->_subtitle priority:800];
  }
  else {
  double v3 = +[PersonalizedItemPrioritizedStringAdornment defaultAdornment];
  }

  return (PersonalizedItemPrioritizedStringAdornment *)v3;
}

- (PersonalizedItemStyleAttributesAdornment)styleAttributes
{
  double v3 = +[NSMutableDictionary dictionary];
  [v3 setObject:&off_1013AA1E0 forKeyedSubscript:&off_1013AA1F8];
  [v3 setObject:&off_1013AA1E0 forKeyedSubscript:&off_1013AA210];
  v4 = self->_calendarItem;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 setObject:&off_1013AA1E0 forKeyedSubscript:&off_1013AA228];
  }
  v5 = self->_calendarItem;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 setObject:&off_1013AA240 forKeyedSubscript:&off_1013AA228];
  }
  id v6 = [(MKMapItem *)self->_mapItem _styleAttributes];
  if (!v6)
  {
    uint64_t v7 = [(MKMapItem *)self->_mapItem place];
    id v8 = (void *)v7;
    if (byte_101610759)
    {
      uint64_t v9 = 223;
      if (!v7) {
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v9 = 353;
      if (v4)
      {
        if (!v7)
        {
LABEL_16:
          NSLog(@"We have a search result that has no style attributes and is not a 'place'. What is it? How should we display it?");
          id v6 = 0;
          goto LABEL_17;
        }
      }
      else
      {
        if (v5) {
          uint64_t v9 = 353;
        }
        else {
          uint64_t v9 = 348;
        }
        if (!v7) {
          goto LABEL_16;
        }
      }
    }
    id v6 = [objc_alloc((Class)GEOFeatureStyleAttributes) initWithAttributes:4, 226, 5, 3, 6, v9, 10, 0, 0];
LABEL_17:
  }
  v10 = +[PersonalizedItemStyleAttributesAdornment adornmentWithStyleAttributes:v6 additionalAttributes:v3];

  return (PersonalizedItemStyleAttributesAdornment *)v10;
}

- (PersonalizedItemClientFeatureIDAdornment)clientFeatureID
{
  double v3 = [(CalendarItemSourceMapItem *)self styleAttributes];
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
  id v24 = [v23 name];

  if (v24)
  {
    id v25 = [(MKMapItem *)self->_mapItem _geoMapItem];
    id v26 = [v25 name];
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
  return 1;
}

- (BOOL)mustRefineMapItem
{
  return 0;
}

- (NSDate)eventDate
{
  double v2 = self->_calendarItem;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(EKCalendarItem *)v2 startDate];
  }
  else {
  double v3 = +[NSDate distantPast];
  }

  return (NSDate *)v3;
}

- (SearchResult)searchResult
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

- (int64_t)sourceType
{
  return 2;
}

- (int64_t)sourceSubtype
{
  return 0;
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
  double v3 = +[NSMutableArray array];
  v4 = [(CalendarItemSourceMapItem *)self title];
  uint64_t v5 = [v4 value];

  if ([v5 length])
  {
    double v6 = +[AutocompleteMatchInfo matchInfoWithType:1];
    double v7 = [[AutocompleteStringMatcher alloc] initWithString:v5 requiredMatchLength:1 matchInfo:v6];
    [v3 addObject:v7];
  }
  long double v8 = [(CalendarItemSourceMapItem *)self subtitle];
  double v9 = [v8 value];

  if ([v9 length])
  {
    unint64_t v10 = +[AutocompleteMatchInfo matchInfoWithType:4];
    unint64_t v11 = [[AutocompleteStringMatcher alloc] initWithString:v9 requiredMatchLength:3 matchInfo:v10];
    [v3 addObject:v11];
  }

  return (NSArray *)v3;
}

- (id)autocompleteObject
{
  double v2 = [[SearchResult alloc] initWithMapItem:self->_mapItem];

  return v2;
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

- (BOOL)shouldBeHiddenFromMap
{
  return self->_shouldBeHiddenFromMap;
}

- (void)setShouldBeHiddenFromMap:(BOOL)a3
{
  self->_shouldBeHiddenFromMap = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->source);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);

  objc_storeStrong((id *)&self->_calendarItem, 0);
}

@end