@interface DroppedPinMapItem
- (BOOL)hasPriorityOverride;
- (BOOL)hasServerItemIndex;
- (BOOL)hidden;
- (BOOL)isCompoundPersonalizedAutocompleteItem;
- (DroppedPinMapItem)initWithSearchResult:(id)a3;
- (GEOServerResultScoreMetadata)serverResultScoreMetadata;
- (NSArray)autocompletionStrings;
- (id)clientFeatureID;
- (id)keys;
- (id)leafPersonalizedAutocompleteItems;
- (id)styleAttributes;
- (id)title;
- (int64_t)priorityOverride;
- (int64_t)sourceSubtype;
- (int64_t)sourceType;
- (unint64_t)serverItemIndexInSection;
- (unint64_t)serverSectionIndex;
@end

@implementation DroppedPinMapItem

- (DroppedPinMapItem)initWithSearchResult:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DroppedPinMapItem;
  v5 = [(SearchResultMapItemBase *)&v10 initWithSearchResult:v4];
  if (v5)
  {
    v6 = [DroppedPinMapItemKey alloc];
    [v4 coordinate];
    v7 = -[DroppedPinMapItemKey initWithCoordinate:](v6, "initWithCoordinate:");
    droppedPinKey = v5->_droppedPinKey;
    v5->_droppedPinKey = v7;
  }
  return v5;
}

- (id)keys
{
  return +[NSSet setWithObject:self->_droppedPinKey];
}

- (id)title
{
  v3 = [(SearchResultMapItemBase *)self searchResult];
  unsigned int v4 = [v3 isReverseGeocoded];

  if (v4)
  {
    v5 = [(SearchResultMapItemBase *)self searchResult];
    v6 = [v5 mapItem];
    v7 = [v6 _addressFormattedAsName];

    if (v7 && [v7 length])
    {
      uint64_t v8 = +[PersonalizedItemPrioritizedStringAdornment adornmentWithString:v7 priority:1];
      goto LABEL_7;
    }
  }
  else
  {
    v7 = 0;
  }
  uint64_t v8 = +[PersonalizedItemPrioritizedStringAdornment defaultAdornment];
LABEL_7:
  v9 = (void *)v8;

  return v9;
}

- (id)styleAttributes
{
  v2 = +[GEOFeatureStyleAttributes markerStyleAttributes];
  v6 = &off_1013AA5E8;
  v7 = &off_1013AA5D0;
  v3 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  unsigned int v4 = +[PersonalizedItemStyleAttributesAdornment adornmentWithStyleAttributes:v2 additionalAttributes:v3];

  return v4;
}

- (id)clientFeatureID
{
  v3 = [(DroppedPinMapItem *)self styleAttributes];
  unsigned int v4 = [v3 styleAttributes];
  uint64_t v5 = (int)[v4 poiType];
  v6 = [(SearchResultMapItemBase *)self mapItem];
  [v6 _coordinate];
  double v8 = -v7;
  if (v7 >= 0.0) {
    double v8 = v7;
  }
  long double v9 = floor(v8 + 0.5);
  double v10 = (v8 - v9) * 1.84467441e19;
  double v11 = fmod(v9, 1.84467441e19);
  unint64_t v12 = 2654435761u * (unint64_t)v11;
  unint64_t v13 = v12 + (unint64_t)v10;
  if (v10 <= 0.0) {
    unint64_t v13 = 2654435761u * (unint64_t)v11;
  }
  unint64_t v14 = v12 - (unint64_t)fabs(v10);
  if (v10 >= 0.0) {
    unint64_t v14 = v13;
  }
  unint64_t v15 = v14 ^ v5;
  v16 = [(SearchResultMapItemBase *)self mapItem];
  [v16 _coordinate];
  if (v17 < 0.0) {
    double v17 = -v17;
  }
  long double v18 = floor(v17 + 0.5);
  double v19 = (v17 - v18) * 1.84467441e19;
  double v20 = fmod(v18, 1.84467441e19);
  unint64_t v21 = 2654435761u * (unint64_t)v20;
  unint64_t v22 = v21 + (unint64_t)v19;
  if (v19 <= 0.0) {
    unint64_t v22 = 2654435761u * (unint64_t)v20;
  }
  unint64_t v23 = v21 - (unint64_t)fabs(v19);
  if (v19 >= 0.0) {
    unint64_t v23 = v22;
  }
  unint64_t v24 = v15 ^ v23;

  v25 = [(SearchResultMapItemBase *)self mapItem];
  v26 = [v25 _geoMapItem];
  v27 = [v26 name];

  if (v27)
  {
    v28 = [(SearchResultMapItemBase *)self mapItem];
    v29 = [v28 _geoMapItem];
    v30 = [v29 name];
    v24 ^= (unint64_t)[v30 hash];
  }

  return +[PersonalizedItemClientFeatureIDAdornment adornmentWithClientFeatureID:v24];
}

- (int64_t)sourceType
{
  return 3;
}

- (int64_t)sourceSubtype
{
  return 2;
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
    unsigned int v4 = self;
    objc_sync_enter(v4);
    if (!self->_autocompletionStrings)
    {
      +[NSMutableArray array];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100B0E748;
      v15[3] = &unk_101317FF8;
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      id v16 = v5;
      v6 = objc_retainBlock(v15);
      double v7 = [(SearchResultMapItemBase *)v4 searchResult];
      double v8 = [v7 name];
      ((void (*)(void *, void *, uint64_t, uint64_t))v6[2])(v6, v8, 1, 1);

      long double v9 = [(SearchResultMapItemBase *)v4 searchResult];
      double v10 = [v9 mapItem];
      double v11 = [v10 _addressFormattedAsName];
      ((void (*)(void *, void *, uint64_t, uint64_t))v6[2])(v6, v11, 3, 4);

      unint64_t v12 = (NSArray *)[v5 copy];
      unint64_t v13 = self->_autocompletionStrings;
      self->_autocompletionStrings = v12;
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
  unsigned int v4 = self;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_droppedPinKey, 0);

  objc_storeStrong((id *)&self->_autocompletionStrings, 0);
}

@end