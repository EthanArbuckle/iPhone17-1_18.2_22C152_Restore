@interface SuggestionsItem
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
- (GEOEnhancedPlacement)enhancedPlacement;
- (GEOLabelGeometry)labelGeometry;
- (GEOServerResultScoreMetadata)serverResultScoreMetadata;
- (MKMapItem)mapItem;
- (NSArray)autocompletionStrings;
- (NSArray)searchableStrings;
- (NSDate)eventDate;
- (NSSet)keys;
- (ParkedCar)parkedCar;
- (PersonalizedItemClientFeatureIDAdornment)clientFeatureID;
- (PersonalizedItemPrioritizedStringAdornment)prefix;
- (PersonalizedItemPrioritizedStringAdornment)subtitle;
- (PersonalizedItemPrioritizedStringAdornment)title;
- (PersonalizedItemSource)source;
- (PersonalizedItemStyleAttributesAdornment)styleAttributes;
- (SearchDotPlace)searchDotPlace;
- (SearchResult)searchResult;
- (SuggestionsItem)initWithSuggestion:(id)a3 order:(unsigned __int16)a4 sourceType:(int64_t)a5 sourceSubtype:(int64_t)a6 hasPriorityOverride:(BOOL)a7 priorityOverride:(int64_t)a8;
- (VKLabelMarker)sourceLabelMarker;
- (id)autocompleteObject;
- (id)leafPersonalizedAutocompleteItems;
- (id)suggestion;
- (int64_t)priorityOverride;
- (int64_t)sourceSubtype;
- (int64_t)sourceType;
- (int64_t)suggestionType;
- (unint64_t)priority;
- (unint64_t)serverItemIndexInSection;
- (unint64_t)serverSectionIndex;
- (unint64_t)sortOrder;
- (void)setParkedCar:(id)a3;
- (void)setSource:(id)a3;
@end

@implementation SuggestionsItem

- (SuggestionsItem)initWithSuggestion:(id)a3 order:(unsigned __int16)a4 sourceType:(int64_t)a5 sourceSubtype:(int64_t)a6 hasPriorityOverride:(BOOL)a7 priorityOverride:(int64_t)a8
{
  id v15 = a3;
  v16 = [v15 MKMapItem];
  if (v16)
  {
    v34.receiver = self;
    v34.super_class = (Class)SuggestionsItem;
    v17 = [(SuggestionsItem *)&v34 init];
    v18 = v17;
    if (v17)
    {
      objc_storeStrong((id *)&v17->_suggestion, a3);
      v18->_order = a4;
      v18->_sourceType = a5;
      v18->_sourceSubtype = a6;
      v18->_hasPriorityOverride = a7;
      v18->_priorityOverride = a8;
      v19 = [[PersonalizedMapItemKey alloc] initWithMapItem:v16];
      uint64_t v20 = +[NSSet setWithObject:v19];
      keys = v18->_keys;
      v18->_keys = (NSSet *)v20;

      v22 = [[MapsLocationOfInterest alloc] initWithMapsSuggestionEntry:v15];
      v23 = v22;
      if (v22)
      {
        v24 = [(MapsLocationOfInterest *)v22 mapItem];
      }
      else
      {
        v24 = v16;
      }
      mapItem = v18->_mapItem;
      v18->_mapItem = v24;

      if ([v15 type] == (id)7)
      {
        v27 = +[ParkedCar personalizedItemKey];
        uint64_t v28 = +[NSSet setWithObject:v27];
        v29 = v18->_keys;
        v18->_keys = (NSSet *)v28;

        v30 = +[ParkedCarManager sharedManager];
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_1003D228C;
        v32[3] = &unk_1012E8318;
        v33 = v18;
        [v30 fetchParkedCar:v32];
      }
    }
    self = v18;
    v25 = self;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (unint64_t)priority
{
  return 1;
}

- (GEOServerResultScoreMetadata)serverResultScoreMetadata
{
  return 0;
}

- (BOOL)hidden
{
  return 0;
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

- (SearchResult)searchResult
{
  if ([(MapsSuggestionsEntry *)self->_suggestion type] == (id)24
    && [(MapsSuggestionsEntry *)self->_suggestion containsKey:@"MapsSuggestionsContactLikelyAppleIDKey"])
  {
    double v3 = [(MapsSuggestionsEntry *)self->_suggestion findMyWaypoint];
    if (!v3)
    {
      v8 = sub_1005762E4();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v11 = 136315906;
        v12 = "-[SuggestionsItem searchResult]";
        __int16 v13 = 2080;
        v14 = "SuggestionsItemSource.m";
        __int16 v15 = 1024;
        int v16 = 143;
        __int16 v17 = 2080;
        v18 = "findMyWaypoint != nil";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v11, 0x26u);
      }

      if (sub_100BB36BC())
      {
        v9 = sub_1005762E4();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v10 = +[NSThread callStackSymbols];
          int v11 = 138412290;
          v12 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v11, 0xCu);
        }
      }
    }
    v4 = [[SearchResult alloc] initWithComposedWaypoint:v3];
  }
  else
  {
    double v3 = [[MapsLocationOfInterest alloc] initWithMapsSuggestionEntry:self->_suggestion];
    if (v3)
    {
      v5 = [SearchResult alloc];
      v6 = [(MapsLocationOfInterest *)v3 mapItem];
      v4 = [(SearchResult *)v5 initWithMapItem:v6];

      [(SearchResult *)v4 setLocationOfInterest:v3];
    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

- (VKLabelMarker)sourceLabelMarker
{
  return 0;
}

- (id)suggestion
{
  return self->_suggestion;
}

- (AddressBookAddress)address
{
  return 0;
}

- (unint64_t)sortOrder
{
  return self->_order;
}

- (PersonalizedItemPrioritizedStringAdornment)title
{
  double v3 = [(MapsSuggestionsEntry *)self->_suggestion poiTitle];
  id v4 = [(MapsSuggestionsEntry *)self->_suggestion type];
  if (v4 == (id)1)
  {
    uint64_t v5 = 901;
  }
  else if (v4 == (id)2)
  {
    uint64_t v5 = 1001;
  }
  else
  {
    uint64_t v5 = 900;
  }
  v6 = +[PersonalizedItemPrioritizedStringAdornment adornmentWithString:v3 priority:v5];

  return (PersonalizedItemPrioritizedStringAdornment *)v6;
}

- (PersonalizedItemPrioritizedStringAdornment)prefix
{
  return (PersonalizedItemPrioritizedStringAdornment *)+[PersonalizedItemPrioritizedStringAdornment defaultAdornment];
}

- (PersonalizedItemPrioritizedStringAdornment)subtitle
{
  unint64_t v3 = (unint64_t)[(MapsSuggestionsEntry *)self->_suggestion type];
  if (v3 > 0x18)
  {
    uint64_t v5 = 0;
  }
  else
  {
    if (((1 << v3) & 0x17E9EF7) != 0)
    {
      id v4 = +[PersonalizedItemPrioritizedStringAdornment defaultAdornment];
      goto LABEL_9;
    }
    if (((1 << v3) & 0x814100) != 0) {
      [(MapsSuggestionsEntry *)self->_suggestion undecoratedSubtitle];
    }
    else {
    uint64_t v5 = [(MapsSuggestionsEntry *)self->_suggestion stringForKey:@"MapsSuggestionsCalendarPersonalizedPOIAdornmentKey"];
    }
  }
  id v4 = +[PersonalizedItemPrioritizedStringAdornment adornmentWithString:v5 priority:700];

LABEL_9:

  return (PersonalizedItemPrioritizedStringAdornment *)v4;
}

- (PersonalizedItemStyleAttributesAdornment)styleAttributes
{
  unint64_t v3 = [(MapsSuggestionsEntry *)self->_suggestion styleAttributes];
  if (!v3)
  {
    unint64_t v3 = +[GEOFeatureStyleAttributes markerStyleAttributes];
  }
  uint64_t v15 = 0;
  int v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  suggestion = self->_suggestion;
  id v4 = +[NSArray arrayWithObjects:&suggestion count:1];
  MapsSuggestionsShortcutSplit();

  v19 = &off_1013A6DA8;
  uint64_t v20 = &off_1013A6DC0;
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  id v6 = [v5 mutableCopy];

  unint64_t v7 = (unint64_t)[(MapsSuggestionsEntry *)self->_suggestion type];
  unint64_t v8 = v7;
  if (v7 > 5 || ((1 << v7) & 0x26) == 0)
  {
    unsigned int v11 = +[LibraryUIUtilities isMyPlacesEnabled];
    int v12 = *((unsigned __int8 *)v16 + 24);
    if (*((unsigned char *)v16 + 24))
    {
      if (v11) {
        uint64_t v13 = 3;
      }
      else {
        uint64_t v13 = 0;
      }
      v14 = +[NSNumber numberWithUnsignedInteger:v13];
    }
    else
    {
      v14 = &off_1013A6DD8;
    }
    [v6 setObject:v14 forKeyedSubscript:&off_1013A6DF0];
    if (v12) {

    }
    if (v8 == 3)
    {
      [v6 setObject:&off_1013A6DC0 forKeyedSubscript:&off_1013A6E08];
      [v6 setObject:&off_1013A6DC0 forKeyedSubscript:&off_1013A6E20];
    }
  }
  v9 = +[PersonalizedItemStyleAttributesAdornment adornmentWithStyleAttributes:v3 additionalAttributes:v6];

  _Block_object_dispose(&v15, 8);

  return (PersonalizedItemStyleAttributesAdornment *)v9;
}

- (PersonalizedItemClientFeatureIDAdornment)clientFeatureID
{
  unint64_t v3 = [(SuggestionsItem *)self styleAttributes];
  id v4 = [v3 styleAttributes];
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

- (BOOL)showsBalloonCallout
{
  return 1;
}

- (BOOL)shouldBeClustered
{
  return 0;
}

- (BOOL)shouldBeHiddenFromMap
{
  return 0;
}

- (BOOL)mustRefineMapItem
{
  return (char *)[(MapsSuggestionsEntry *)self->_suggestion type] - 3 < (char *)0xFFFFFFFFFFFFFFFELL;
}

- (NSDate)eventDate
{
  return (NSDate *)[(MapsSuggestionsEntry *)self->_suggestion dateForKey:@"MapsSuggestionsScheduledTimeKey"];
}

- (NSArray)searchableStrings
{
  return 0;
}

- (id)autocompleteObject
{
  return self->_suggestion;
}

- (NSArray)autocompletionStrings
{
  unint64_t v3 = [(MapsSuggestionsEntry *)self->_suggestion undecoratedTitle];
  id v4 = v3;
  if (v3 && [v3 length])
  {
    if ([(MapsSuggestionsEntry *)self->_suggestion type] == (id)3) {
      uint64_t v5 = 16;
    }
    else {
      uint64_t v5 = 1;
    }
    double v6 = +[AutocompleteMatchInfo matchInfoWithType:v5];
    double v7 = [[AutocompleteStringMatcher alloc] initWithString:v4 requiredMatchLength:1 matchInfo:v6];
    unint64_t v10 = v7;
    long double v8 = +[NSArray arrayWithObjects:&v10 count:1];
  }
  else
  {
    long double v8 = &__NSArray0__struct;
  }

  return (NSArray *)v8;
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
  id v4 = self;
  double v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (SearchDotPlace)searchDotPlace
{
  return 0;
}

- (int64_t)suggestionType
{
  return (int64_t)[(MapsSuggestionsEntry *)self->_suggestion type];
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (int64_t)sourceSubtype
{
  return self->_sourceSubtype;
}

- (BOOL)hasPriorityOverride
{
  return self->_hasPriorityOverride;
}

- (int64_t)priorityOverride
{
  return self->_priorityOverride;
}

- (PersonalizedItemSource)source
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->source);

  return (PersonalizedItemSource *)WeakRetained;
}

- (void)setSource:(id)a3
{
}

- (ParkedCar)parkedCar
{
  return self->parkedCar;
}

- (void)setParkedCar:(id)a3
{
}

- (NSSet)keys
{
  return self->_keys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keys, 0);
  objc_storeStrong((id *)&self->parkedCar, 0);
  objc_destroyWeak((id *)&self->source);
  objc_storeStrong((id *)&self->_mapItem, 0);

  objc_storeStrong((id *)&self->_suggestion, 0);
}

@end