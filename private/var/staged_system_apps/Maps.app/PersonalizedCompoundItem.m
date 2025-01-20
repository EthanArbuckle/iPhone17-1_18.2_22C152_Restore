@interface PersonalizedCompoundItem
- (AddressBookAddress)address;
- (AutocompleteMatchInfo)matchInfo;
- (BOOL)containsPossiblePersonalizedItemSourceSubtype:(int64_t)a3;
- (BOOL)containsPossiblePersonalizedItemSourceType:(int64_t)a3;
- (BOOL)hasCachedAutocompleteItemWithHighestPriority;
- (BOOL)hasPriorityOverride;
- (BOOL)hasServerItemIndex;
- (BOOL)hidden;
- (BOOL)isCompoundPersonalizedAutocompleteItem;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRouteStartOrEnd;
- (BOOL)mustRefineMapItem;
- (BOOL)needsToPreserveSelection;
- (BOOL)shouldBeClustered;
- (BOOL)shouldBeHiddenFromMap;
- (BOOL)showsBalloonCallout;
- (BOOL)wantsDisplayedSearchResultsTypePoints;
- (CLLocationCoordinate2D)coordinate;
- (GEOEnhancedPlacement)enhancedPlacement;
- (GEOLabelGeometry)labelGeometry;
- (GEOServerResultScoreMetadata)serverResultScoreMetadata;
- (MKMapItem)mapItem;
- (MapsLocationOfInterest)locationOfInterest;
- (NSArray)autocompletionStrings;
- (NSArray)items;
- (NSArray)possiblePersonalizedItemSourceSubtypes;
- (NSArray)possiblePersonalizedItemSourceTypes;
- (NSArray)searchableStrings;
- (NSSet)keys;
- (NSString)description;
- (ParkedCar)parkedCar;
- (PersonalizedAutocompleteItem)autocompleteItemWithHighestPriority;
- (PersonalizedAutocompleteItem)cachedAutocompleteItemWithHighestPriority;
- (PersonalizedCompoundItem)init;
- (PersonalizedCompoundItem)initWithItems:(id)a3;
- (PersonalizedCompoundItem)itemWithHighestPriorityForFunction:(id)a3;
- (PersonalizedCompoundItemAutocompleteAnalytics)autocompleteAnalytics;
- (PersonalizedItemClientFeatureIDAdornment)clientFeatureID;
- (PersonalizedItemPrioritizedStringAdornment)prefix;
- (PersonalizedItemPrioritizedStringAdornment)subtitle;
- (PersonalizedItemPrioritizedStringAdornment)title;
- (PersonalizedItemPriorityFunction)priorityFunction;
- (PersonalizedItemSource)source;
- (PersonalizedItemStyleAttributesAdornment)styleAttributes;
- (SearchDotPlace)searchDotPlace;
- (SearchResult)searchResult;
- (TrafficIncidentReport)incidentReport;
- (VKLabelMarker)sourceLabelMarker;
- (id)autocompleteItemWithEarliestServerSectionAndIndexInSection;
- (id)autocompleteItemWithHighestObjectPriority;
- (id)autocompleteObject;
- (id)leafPersonalizedAutocompleteItems;
- (int64_t)priorityOverride;
- (int64_t)sourceSubtype;
- (int64_t)sourceType;
- (unint64_t)priority;
- (unint64_t)serverItemIndexInSection;
- (unint64_t)serverSectionIndex;
- (unint64_t)sortOrder;
- (void)setAutocompleteAnalytics:(id)a3;
- (void)setCachedAutocompleteItemWithHighestPriority:(id)a3;
- (void)setHasCachedAutocompleteItemWithHighestPriority:(BOOL)a3;
- (void)setPossiblePersonalizedItemSourceSubtypes:(id)a3;
- (void)setPossiblePersonalizedItemSourceTypes:(id)a3;
- (void)setPriorityFunction:(id)a3;
- (void)setSource:(id)a3;
@end

@implementation PersonalizedCompoundItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possiblePersonalizedItemSourceSubtypes, 0);
  objc_storeStrong((id *)&self->_possiblePersonalizedItemSourceTypes, 0);
  objc_destroyWeak((id *)&self->_cachedAutocompleteItemWithHighestPriority);
  objc_storeStrong((id *)&self->_autocompleteAnalytics, 0);
  objc_storeStrong((id *)&self->_priorityFunction, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_keys, 0);

  objc_destroyWeak((id *)&self->source);
}

- (BOOL)wantsDisplayedSearchResultsTypePoints
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_items;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && (objc_msgSend(v6, "wantsDisplayedSearchResultsTypePoints", (void)v8) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return (char)v3;
}

- (NSArray)items
{
  return self->_items;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = kCLLocationCoordinate2DInvalid.latitude;
  double longitude = kCLLocationCoordinate2DInvalid.longitude;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = self->_items;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    char v8 = 1;
    do
    {
      long long v9 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * (void)v9) coordinate:v14];
        if (v8)
        {
          double longitude = v11;
          double latitude = v10;
        }
        long long v9 = (char *)v9 + 1;
        char v8 = 0;
      }
      while (v6 != v9);
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      char v8 = 0;
    }
    while (v6);
  }

  double v12 = latitude;
  double v13 = longitude;
  result.double longitude = v13;
  result.double latitude = v12;
  return result;
}

- (SearchResult)searchResult
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = self->_items;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = [*(id *)(*((void *)&v10 + 1) + 8 * i) searchResult:v10];
        if (v7)
        {
          char v8 = (void *)v7;
          goto LABEL_11;
        }
      }
      id v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  char v8 = 0;
LABEL_11:

  return (SearchResult *)v8;
}

- (PersonalizedItemPrioritizedStringAdornment)title
{
  id v3 = +[PersonalizedItemPrioritizedStringAdornment defaultAdornment];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_items;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      char v8 = 0;
      long long v9 = v3;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v10 = [*(id *)(*((void *)&v12 + 1) + 8 * (void)v8) title:(void)v12];
        id v3 = [v9 combineAdornment:v10];

        char v8 = (char *)v8 + 1;
        long long v9 = v3;
      }
      while (v6 != v8);
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return (PersonalizedItemPrioritizedStringAdornment *)v3;
}

- (PersonalizedItemPrioritizedStringAdornment)subtitle
{
  id v3 = +[PersonalizedItemPrioritizedStringAdornment defaultAdornment];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_items;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      char v8 = 0;
      long long v9 = v3;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v10 = [*(id *)(*((void *)&v12 + 1) + 8 * (void)v8) subtitle:v12];
        id v3 = [v9 combineAdornment:v10];

        char v8 = (char *)v8 + 1;
        long long v9 = v3;
      }
      while (v6 != v8);
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return (PersonalizedItemPrioritizedStringAdornment *)v3;
}

- (BOOL)isRouteStartOrEnd
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_items;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && (objc_msgSend(v6, "isRouteStartOrEnd", (void)v8) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return (char)v3;
}

- (unint64_t)sortOrder
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = self->_items;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      id v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = [*(id *)(*((void *)&v10 + 1) + 8 * (void)v6) sortOrder:(void)v10];
        if (v7)
        {
          unint64_t v8 = (unint64_t)v7;
          goto LABEL_11;
        }
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  unint64_t v8 = 0;
LABEL_11:

  return v8;
}

- (GEOLabelGeometry)labelGeometry
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_items;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        id v7 = [v6 labelGeometry:v9];

        if (v7)
        {
          id v3 = [v6 labelGeometry];
          goto LABEL_11;
        }
      }
      id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (GEOLabelGeometry *)v3;
}

- (PersonalizedCompoundItem)initWithItems:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PersonalizedCompoundItem;
  uint64_t v5 = [(PersonalizedCompoundItem *)&v34 init];
  if (v5)
  {
    id v6 = (NSArray *)[v4 copy];
    items = v5->_items;
    v27 = v5;
    v5->_items = v6;

    unint64_t v8 = +[NSMutableSet set];
    v29 = objc_opt_new();
    v28 = objc_opt_new();
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v9 = v4;
    id v10 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v31;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v31 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          long long v15 = [v14 keys];
          [v8 unionSet:v15];

          if ([v14 conformsToProtocol:&OBJC_PROTOCOL___PersonalizedAutocompleteItem])
          {
            id v16 = v14;
            long long v17 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v16 sourceType]);
            [v29 addObject:v17];

            id v18 = [v16 sourceSubtype];
            v19 = +[NSNumber numberWithInteger:v18];
            [v28 addObject:v19];
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v11);
    }

    id v20 = [v29 copy];
    uint64_t v5 = v27;
    [(PersonalizedCompoundItem *)v27 setPossiblePersonalizedItemSourceTypes:v20];

    id v21 = [v28 copy];
    [(PersonalizedCompoundItem *)v27 setPossiblePersonalizedItemSourceSubtypes:v21];

    v22 = (NSSet *)[v8 copy];
    keys = v27->_keys;
    v27->_keys = v22;

    uint64_t v24 = +[PersonalizedItemPriorityFunction defaultPriorityFunctionForCompoundItemResolution];
    priorityFunction = v27->_priorityFunction;
    v27->_priorityFunction = (PersonalizedItemPriorityFunction *)v24;
  }
  return v5;
}

- (PersonalizedItemStyleAttributesAdornment)styleAttributes
{
  id v3 = +[PersonalizedItemStyleAttributesAdornment defaultAdornment];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_items;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      unint64_t v8 = 0;
      id v9 = v3;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v10 = [*(id *)(*((void *)&v12 + 1) + 8 * (void)v8) styleAttributes:(void)v12];
        id v3 = [v9 combineAdornment:v10];

        unint64_t v8 = (char *)v8 + 1;
        id v9 = v3;
      }
      while (v6 != v8);
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return (PersonalizedItemStyleAttributesAdornment *)v3;
}

- (void)setPossiblePersonalizedItemSourceTypes:(id)a3
{
}

- (void)setPossiblePersonalizedItemSourceSubtypes:(id)a3
{
}

- (BOOL)showsBalloonCallout
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_items;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "showsBalloonCallout", (void)v9))
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      id v4 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (PersonalizedItemPrioritizedStringAdornment)prefix
{
  id v3 = +[PersonalizedItemPrioritizedStringAdornment defaultAdornment];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_items;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      unint64_t v8 = 0;
      long long v9 = v3;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v10 = [*(id *)(*((void *)&v12 + 1) + 8 * (void)v8) prefix:(void)v12];
        id v3 = [v9 combineAdornment:v10];

        unint64_t v8 = (char *)v8 + 1;
        long long v9 = v3;
      }
      while (v6 != v8);
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return (PersonalizedItemPrioritizedStringAdornment *)v3;
}

- (MKMapItem)mapItem
{
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v3 = self->_items;
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (!v4)
  {

    id v8 = 0;
    goto LABEL_29;
  }
  id v5 = v4;
  obj = v3;
  v25 = self;
  id v6 = 0;
  unsigned __int8 v7 = 0;
  id v8 = 0;
  uint64_t v30 = *(void *)v32;
  do
  {
    long long v9 = 0;
    do
    {
      if (*(void *)v32 != v30) {
        objc_enumerationMutation(obj);
      }
      long long v10 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v9);
      long long v11 = [v10 mapItem:v25];
      id v12 = [v10 priority];
      if ([v11 _hasResolvablePartialInformation])
      {
        unsigned __int8 v13 = 1;
        if (!v8) {
          goto LABEL_20;
        }
      }
      else
      {
        long long v15 = [v11 _geoMapItem];
        if ([v15 hasExpiredComponents]) {
          unsigned __int8 v13 = 1;
        }
        else {
          unsigned __int8 v13 = [v10 mustRefineMapItem];
        }

        if (!v8)
        {
LABEL_20:
          id v8 = v11;
          id v6 = [v10 priority];
          unsigned __int8 v7 = v13;
          goto LABEL_21;
        }
      }
      if (v6 >= v12)
      {
        if (v6 <= v12)
        {
          if (v13 & 1 | ((v7 & 1) == 0))
          {
            if (v7 & 1 | ((v13 & 1) == 0))
            {
              id v16 = [v11 _geoMapItemStorageForPersistence];
              long long v17 = [v8 _geoMapItemStorageForPersistence];
              v28 = v16;
              id v18 = [v16 encodedData];
              id v26 = [v18 length];
              v27 = v17;
              v19 = [v17 encodedData];
              id v20 = [v19 length];

              if (v26 > v20)
              {
                id v21 = v11;

                id v6 = [v10 priority];
                id v8 = v21;
              }
            }
            else
            {
              unsigned __int8 v7 = 0;
            }
          }
          else
          {
            id v22 = v11;

            id v6 = [v10 priority];
            unsigned __int8 v7 = 0;
            id v8 = v22;
          }
        }
      }
      else
      {
        id v14 = v11;

        id v6 = [v10 priority];
        unsigned __int8 v7 = v13;
        id v8 = v14;
      }
LABEL_21:

      long long v9 = (char *)v9 + 1;
    }
    while (v5 != v9);
    id v23 = [(NSArray *)obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    id v5 = v23;
  }
  while (v23);

  if (v8) {
    [v8 setPersonalizedCompoundItem:v25];
  }
LABEL_29:

  return (MKMapItem *)v8;
}

- (GEOEnhancedPlacement)enhancedPlacement
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_items;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        unsigned __int8 v7 = [v6 enhancedPlacement];

        if (v7)
        {
          id v3 = [v6 enhancedPlacement];
          goto LABEL_11;
        }
      }
      id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (GEOEnhancedPlacement *)v3;
}

- (PersonalizedItemClientFeatureIDAdornment)clientFeatureID
{
  id v3 = +[PersonalizedItemClientFeatureIDAdornment defaultAdornment];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = self->_items;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      id v8 = 0;
      long long v9 = v3;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v10 = [*(id *)(*((void *)&v12 + 1) + 8 * (void)v8) clientFeatureID:(void)v12];
        id v3 = [v9 combineAdornment:v10];

        id v8 = (char *)v8 + 1;
        long long v9 = v3;
      }
      while (v6 != v8);
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return (PersonalizedItemClientFeatureIDAdornment *)v3;
}

- (BOOL)shouldBeClustered
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_items;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "shouldBeClustered", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (NSSet)keys
{
  return self->_keys;
}

- (BOOL)shouldBeHiddenFromMap
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_items;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "shouldBeHiddenFromMap", (void)v9))
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      id v4 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (PersonalizedCompoundItem)init
{
  return 0;
}

- (void)setPriorityFunction:(id)a3
{
  id v4 = (PersonalizedItemPriorityFunction *)a3;
  if (!v4)
  {
    id v4 = +[PersonalizedItemPriorityFunction defaultPriorityFunctionForCompoundItemResolution];
  }
  if (self->_priorityFunction != v4)
  {
    obj = v4;
    [(PersonalizedCompoundItem *)self setHasCachedAutocompleteItemWithHighestPriority:0];
    objc_storeStrong((id *)&self->_priorityFunction, obj);
    id v4 = obj;
  }
}

- (unint64_t)priority
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = self->_items;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        long long v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "priority", (void)v10) > v5) {
          id v5 = [v8 priority];
        }
      }
      id v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    id v5 = 0;
  }

  return (unint64_t)v5;
}

- (NSArray)searchableStrings
{
  id v3 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_items;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) searchableStrings:v12];
        if (v9) {
          [v3 addObjectsFromArray:v9];
        }
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = [v3 copy];

  return (NSArray *)v10;
}

- (ParkedCar)parkedCar
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = self->_items;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v8 = [v7 parkedCar:v11];
          if (v8)
          {
            long long v9 = (void *)v8;
            goto LABEL_12;
          }
        }
      }
      id v4 = [(NSArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  long long v9 = 0;
LABEL_12:

  return (ParkedCar *)v9;
}

- (TrafficIncidentReport)incidentReport
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = self->_items;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v8 = [v7 incidentReport];
          if (v8)
          {
            long long v9 = (void *)v8;
            goto LABEL_12;
          }
        }
      }
      id v4 = [(NSArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  long long v9 = 0;
LABEL_12:

  return (TrafficIncidentReport *)v9;
}

- (VKLabelMarker)sourceLabelMarker
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = self->_items;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = [*(id *)(*((void *)&v10 + 1) + 8 * i) sourceLabelMarker:(void)v10];
        if (v7)
        {
          uint64_t v8 = (void *)v7;
          goto LABEL_11;
        }
      }
      id v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  uint64_t v8 = 0;
LABEL_11:

  return (VKLabelMarker *)v8;
}

- (AddressBookAddress)address
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = self->_items;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = [*(id *)(*((void *)&v10 + 1) + 8 * i) address:v10];
        if (v7)
        {
          uint64_t v8 = (void *)v7;
          goto LABEL_11;
        }
      }
      id v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  uint64_t v8 = 0;
LABEL_11:

  return (AddressBookAddress *)v8;
}

- (SearchDotPlace)searchDotPlace
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = self->_items;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = [*(id *)(*((void *)&v10 + 1) + 8 * i) searchDotPlace:v10];
        if (v7)
        {
          uint64_t v8 = (void *)v7;
          goto LABEL_11;
        }
      }
      id v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  uint64_t v8 = 0;
LABEL_11:

  return (SearchDotPlace *)v8;
}

- (MapsLocationOfInterest)locationOfInterest
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = self->_items;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v8 = [v7 locationOfInterest:v11];
          if (v8)
          {
            long long v9 = (void *)v8;
            goto LABEL_12;
          }
        }
      }
      id v4 = [(NSArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  long long v9 = 0;
LABEL_12:

  return (MapsLocationOfInterest *)v9;
}

- (BOOL)mustRefineMapItem
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_items;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "mustRefineMapItem", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (BOOL)needsToPreserveSelection
{
  if (![(NSArray *)self->_items count]) {
    return 0;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = self->_items;
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) == 0
          || !objc_msgSend(v8, "needsToPreserveSelection", (void)v11))
        {
          BOOL v9 = 0;
          goto LABEL_15;
        }
      }
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      BOOL v9 = 1;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v9 = 1;
  }
LABEL_15:

  return v9;
}

- (PersonalizedCompoundItem)itemWithHighestPriorityForFunction:(id)a3
{
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = [(PersonalizedCompoundItem *)self items];
  id v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    id v7 = 0;
    long long v8 = 0;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(id *)(*((void *)&v19 + 1) + 8 * i);
        if ([v11 conformsToProtocol:&OBJC_PROTOCOL___PersonalizedAutocompleteItem]) {
          id v12 = v11;
        }
        else {
          id v12 = 0;
        }

        if (v12)
        {
          if ((id v13 = [v4 priorityForPersonalizedAutocompleteItem:v11], !v8)
            || [v8 hidden] && !objc_msgSend(v11, "hidden")
            || ((unsigned int v14 = [v8 hidden], v14 == objc_msgSend(v11, "hidden"))
              ? (BOOL v15 = (uint64_t)v13 <= (uint64_t)v7)
              : (BOOL v15 = 1),
                !v15))
          {
            id v16 = v11;

            id v7 = v13;
            long long v8 = v16;
          }
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }
  else
  {
    long long v8 = 0;
  }

  return (PersonalizedCompoundItem *)v8;
}

- (PersonalizedAutocompleteItem)autocompleteItemWithHighestPriority
{
  if ([(PersonalizedCompoundItem *)self hasCachedAutocompleteItemWithHighestPriority])
  {
    id v3 = [(PersonalizedCompoundItem *)self cachedAutocompleteItemWithHighestPriority];
  }
  else
  {
    id v4 = [(PersonalizedCompoundItem *)self priorityFunction];
    id v3 = [(PersonalizedCompoundItem *)self itemWithHighestPriorityForFunction:v4];

    [(PersonalizedCompoundItem *)self setCachedAutocompleteItemWithHighestPriority:v3];
    [(PersonalizedCompoundItem *)self setHasCachedAutocompleteItemWithHighestPriority:1];
  }

  return (PersonalizedAutocompleteItem *)v3;
}

- (id)autocompleteItemWithHighestObjectPriority
{
  id v3 = +[PersonalizedItemPriorityFunction defaultPriorityFunctionForAutocompleteObject];
  id v4 = [(PersonalizedCompoundItem *)self itemWithHighestPriorityForFunction:v3];

  return v4;
}

- (id)autocompleteItemWithEarliestServerSectionAndIndexInSection
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v2 = self->_items;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v3)
  {
    id v4 = v3;
    unint64_t v19 = 0;
    id v5 = 0;
    id v6 = 0;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v2);
        }
        id v9 = *(id *)(*((void *)&v20 + 1) + 8 * i);
        if ([v9 conformsToProtocol:&OBJC_PROTOCOL___PersonalizedAutocompleteItem]) {
          long long v10 = v9;
        }
        else {
          long long v10 = 0;
        }
        id v11 = v10;

        if (v11)
        {
          unsigned int v12 = [v9 hasServerItemIndex];

          if (v12)
          {
            if ((id v13 = [v9 serverSectionIndex],
                  id v14 = [v9 serverItemIndexInSection],
                  unint64_t v15 = (unint64_t)v14,
                  !v5)
              || v13 < v6
              || (v13 == v6 ? (BOOL v16 = (unint64_t)v14 >= v19) : (BOOL v16 = 1), !v16))
            {
              id v17 = v9;

              unint64_t v19 = v15;
              id v5 = v17;
              id v6 = v13;
            }
          }
        }
      }
      id v4 = [(NSArray *)v2 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v4);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (int64_t)sourceType
{
  v2 = [(PersonalizedCompoundItem *)self autocompleteItemWithHighestPriority];
  id v3 = v2;
  if (v2) {
    id v4 = [v2 sourceType];
  }
  else {
    id v4 = 0;
  }

  return (int64_t)v4;
}

- (int64_t)sourceSubtype
{
  v2 = [(PersonalizedCompoundItem *)self autocompleteItemWithHighestPriority];
  id v3 = v2;
  if (v2) {
    id v4 = [v2 sourceSubtype];
  }
  else {
    id v4 = 0;
  }

  return (int64_t)v4;
}

- (BOOL)hasPriorityOverride
{
  v2 = [(PersonalizedCompoundItem *)self autocompleteItemWithHighestPriority];
  id v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 hasPriorityOverride];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (int64_t)priorityOverride
{
  v2 = [(PersonalizedCompoundItem *)self autocompleteItemWithHighestPriority];
  id v3 = v2;
  if (v2) {
    id v4 = [v2 priorityOverride];
  }
  else {
    id v4 = 0;
  }

  return (int64_t)v4;
}

- (GEOServerResultScoreMetadata)serverResultScoreMetadata
{
  v2 = [(PersonalizedCompoundItem *)self autocompleteItemWithHighestPriority];
  id v3 = [v2 serverResultScoreMetadata];

  return (GEOServerResultScoreMetadata *)v3;
}

- (BOOL)hidden
{
  v2 = [(PersonalizedCompoundItem *)self autocompleteItemWithHighestPriority];
  id v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 hidden];
  }
  else {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

- (NSArray)autocompletionStrings
{
  id v3 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unsigned __int8 v4 = self->_items;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(id *)(*((void *)&v14 + 1) + 8 * i);
        if ([v9 conformsToProtocol:&OBJC_PROTOCOL___PersonalizedAutocompleteItem])id v10 = v9; {
        else
        }
          id v10 = 0;

        if (v10)
        {
          id v11 = [v9 autocompletionStrings];
          if (v11) {
            [v3 addObjectsFromArray:v11];
          }
        }
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  id v12 = [v3 copy];

  return (NSArray *)v12;
}

- (BOOL)hasServerItemIndex
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = self->_items;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(id *)(*((void *)&v11 + 1) + 8 * i);
        if ([v6 conformsToProtocol:&OBJC_PROTOCOL___PersonalizedAutocompleteItem])uint64_t v7 = v6; {
        else
        }
          uint64_t v7 = 0;
        id v8 = v7;

        if (v8)
        {
          unsigned __int8 v9 = [v6 hasServerItemIndex];

          if (v9)
          {
            LOBYTE(v3) = 1;
            goto LABEL_15;
          }
        }
      }
      id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  return (char)v3;
}

- (unint64_t)serverSectionIndex
{
  v2 = [(PersonalizedCompoundItem *)self autocompleteItemWithEarliestServerSectionAndIndexInSection];
  id v3 = [v2 serverSectionIndex];

  return (unint64_t)v3;
}

- (unint64_t)serverItemIndexInSection
{
  v2 = [(PersonalizedCompoundItem *)self autocompleteItemWithEarliestServerSectionAndIndexInSection];
  id v3 = [v2 serverItemIndexInSection];

  return (unint64_t)v3;
}

- (BOOL)isCompoundPersonalizedAutocompleteItem
{
  return 1;
}

- (id)leafPersonalizedAutocompleteItems
{
  id v3 = [(PersonalizedCompoundItem *)self items];
  id v4 = [v3 count];

  if (v4 != (id)1)
  {
    id v10 = [(PersonalizedCompoundItem *)self items];
    +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v10 count]);
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v11 = [(PersonalizedCompoundItem *)self items];
    id v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(id *)(*((void *)&v20 + 1) + 8 * i);
          if ([v16 conformsToProtocol:&OBJC_PROTOCOL___PersonalizedAutocompleteItem]) {
            id v17 = v16;
          }
          else {
            id v17 = 0;
          }

          if (v17) {
            [v7 addObject:v16];
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v13);
    }

    id v9 = [v7 copy];
    goto LABEL_20;
  }
  id v5 = [(PersonalizedCompoundItem *)self items];
  id v6 = [v5 firstObject];

  id v7 = v6;
  if ([v7 conformsToProtocol:&OBJC_PROTOCOL___PersonalizedAutocompleteItem]) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  if (v8)
  {
    id v25 = v7;
    id v9 = +[NSArray arrayWithObjects:&v25 count:1];
LABEL_20:
    id v18 = v9;
    goto LABEL_21;
  }
  id v18 = &__NSArray0__struct;
LABEL_21:

  return v18;
}

- (id)autocompleteObject
{
  v2 = [(PersonalizedCompoundItem *)self autocompleteItemWithHighestObjectPriority];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 autocompleteObject];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (NSString)description
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  NSUInteger v5 = [(NSArray *)self->_items count];
  id v6 = [(NSArray *)self->_items firstObject];
  id v7 = [v6 mapItem];
  id v8 = [v7 name];
  id v9 = +[NSString stringWithFormat:@"<%@: %p (%d items) name='%@'>", v4, self, v5, v8];

  return (NSString *)v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PersonalizedCompoundItem *)a3;
  NSUInteger v5 = v4;
  if (self == v4)
  {
    unsigned __int8 v28 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
    id v7 = [(PersonalizedCompoundItem *)self keys];
    id v8 = [(PersonalizedCompoundItem *)v6 keys];
    unsigned int v9 = [v7 isEqual:v8];

    if (v9
      && ([(PersonalizedCompoundItem *)self coordinate],
          double v11 = v10,
          double v13 = v12,
          [(PersonalizedCompoundItem *)v6 coordinate],
          vabdd_f64(v11, v15) < 0.00000000999999994)
      && vabdd_f64(v13, v14) < 0.00000000999999994)
    {
      id v16 = [(PersonalizedCompoundItem *)self title];
      id v17 = [v16 value];
      id v18 = [(PersonalizedCompoundItem *)v6 title];
      unint64_t v19 = [v18 value];
      if ([v17 isEqualToString:v19])
      {
        long long v20 = [(PersonalizedCompoundItem *)self subtitle];
        long long v21 = [v20 value];
        long long v22 = [(PersonalizedCompoundItem *)v6 subtitle];
        v37 = [v22 value];
        v38 = v21;
        if ([v21 isEqualToString:v37])
        {
          v36 = [(PersonalizedCompoundItem *)self prefix];
          long long v23 = [v36 value];
          long long v34 = [(PersonalizedCompoundItem *)v6 prefix];
          [v34 value];
          long long v33 = v35 = v23;
          unsigned int v24 = [v23 isEqualToString:];
          id v25 = v22;
          if (v24)
          {
            long long v31 = [(PersonalizedCompoundItem *)self styleAttributes];
            id v26 = [v31 styleAttributes];
            uint64_t v30 = [(PersonalizedCompoundItem *)v6 styleAttributes];
            [v30 styleAttributes];
            v27 = long long v32 = v20;
            unsigned __int8 v28 = [v26 isEqual:v27];

            long long v20 = v32;
          }
          else
          {
            unsigned __int8 v28 = 0;
          }
        }
        else
        {
          unsigned __int8 v28 = 0;
          id v25 = v22;
        }
      }
      else
      {
        unsigned __int8 v28 = 0;
      }
    }
    else
    {
      unsigned __int8 v28 = 0;
    }
  }
  else
  {
    unsigned __int8 v28 = 0;
  }

  return v28;
}

- (BOOL)containsPossiblePersonalizedItemSourceSubtype:(int64_t)a3
{
  id v4 = [(PersonalizedCompoundItem *)self possiblePersonalizedItemSourceSubtypes];
  NSUInteger v5 = +[NSNumber numberWithInteger:a3];
  unsigned __int8 v6 = [v4 containsObject:v5];

  return v6;
}

- (BOOL)containsPossiblePersonalizedItemSourceType:(int64_t)a3
{
  id v4 = [(PersonalizedCompoundItem *)self possiblePersonalizedItemSourceTypes];
  NSUInteger v5 = +[NSNumber numberWithInteger:a3];
  unsigned __int8 v6 = [v4 containsObject:v5];

  return v6;
}

- (PersonalizedItemSource)source
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->source);

  return (PersonalizedItemSource *)WeakRetained;
}

- (void)setSource:(id)a3
{
}

- (PersonalizedItemPriorityFunction)priorityFunction
{
  return self->_priorityFunction;
}

- (PersonalizedCompoundItemAutocompleteAnalytics)autocompleteAnalytics
{
  return self->_autocompleteAnalytics;
}

- (void)setAutocompleteAnalytics:(id)a3
{
}

- (BOOL)hasCachedAutocompleteItemWithHighestPriority
{
  return self->_hasCachedAutocompleteItemWithHighestPriority;
}

- (void)setHasCachedAutocompleteItemWithHighestPriority:(BOOL)a3
{
  self->_hasCachedAutocompleteItemWithHighestPriority = a3;
}

- (PersonalizedAutocompleteItem)cachedAutocompleteItemWithHighestPriority
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cachedAutocompleteItemWithHighestPriority);

  return (PersonalizedAutocompleteItem *)WeakRetained;
}

- (void)setCachedAutocompleteItemWithHighestPriority:(id)a3
{
}

- (NSArray)possiblePersonalizedItemSourceTypes
{
  return self->_possiblePersonalizedItemSourceTypes;
}

- (NSArray)possiblePersonalizedItemSourceSubtypes
{
  return self->_possiblePersonalizedItemSourceSubtypes;
}

- (AutocompleteMatchInfo)matchInfo
{
  v2 = [(PersonalizedCompoundItem *)self autocompleteItemWithHighestPriority];
  if ([v2 conformsToProtocol:&OBJC_PROTOCOL___AutocompleteItemWithMatchInfo])
  {
    id v3 = [v2 matchInfo];
  }
  else
  {
    id v3 = 0;
  }

  return (AutocompleteMatchInfo *)v3;
}

@end