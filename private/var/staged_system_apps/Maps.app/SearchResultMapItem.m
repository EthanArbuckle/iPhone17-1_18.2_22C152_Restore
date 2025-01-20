@interface SearchResultMapItem
- (BOOL)shouldBeClustered;
- (BOOL)showsBalloonCallout;
- (id)clientFeatureID;
- (id)createSubtitle;
- (id)style;
- (id)styleAttributes;
- (id)subtitle;
- (id)title;
@end

@implementation SearchResultMapItem

- (id)title
{
  v3 = [(SearchResultMapItemBase *)self searchResult];
  if ([v3 locationType] == 1)
  {
    v4 = [(SearchResultMapItemBase *)self searchResult];
    v5 = [v4 autocompletePerson];

    if (v5)
    {
      v6 = +[NSBundle mainBundle];
      v7 = v6;
      CFStringRef v8 = @"Contact's Home [SearchResultMapItem]";
LABEL_16:
      v18 = [v6 localizedStringForKey:v8 value:@"localized string not found" table:0];
      v19 = [(SearchResultMapItemBase *)self searchResult];
      v20 = [v19 title];
      v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v20);

      v22 = +[PersonalizedItemPrioritizedStringAdornment adornmentWithString:v21 priority:1];

      goto LABEL_19;
    }
  }
  else
  {
  }
  v9 = [(SearchResultMapItemBase *)self searchResult];
  if ([v9 locationType] == 2)
  {
    v10 = [(SearchResultMapItemBase *)self searchResult];
    v11 = [v10 autocompletePerson];

    if (v11)
    {
      v6 = +[NSBundle mainBundle];
      v7 = v6;
      CFStringRef v8 = @"Contact's Work [SearchResultMapItem]";
      goto LABEL_16;
    }
  }
  else
  {
  }
  v12 = [(SearchResultMapItemBase *)self searchResult];
  if ([v12 locationType] == 3)
  {
    v13 = [(SearchResultMapItemBase *)self searchResult];
    v14 = [v13 autocompletePerson];

    if (v14)
    {
      v6 = +[NSBundle mainBundle];
      v7 = v6;
      CFStringRef v8 = @"Contact's School [SearchResultMapItem]";
      goto LABEL_16;
    }
  }
  else
  {
  }
  v15 = [(SearchResultMapItemBase *)self searchResult];
  if ([v15 locationType] == 4)
  {
    v16 = [(SearchResultMapItemBase *)self searchResult];
    v17 = [v16 autocompletePerson];

    if (v17)
    {
      v6 = +[NSBundle mainBundle];
      v7 = v6;
      CFStringRef v8 = @"Contact's Location [SearchResultMapItem]";
      goto LABEL_16;
    }
  }
  else
  {
  }
  v24.receiver = self;
  v24.super_class = (Class)SearchResultMapItem;
  v22 = [(SearchResultMapItemBase *)&v24 title];
LABEL_19:

  return v22;
}

- (id)subtitle
{
  v3 = [(SearchResultMapItemBase *)self searchResult];
  v4 = [v3 address];

  if (v4)
  {
    v5 = [(SearchResultMapItemBase *)self searchResult];
    v6 = [v5 address];
    v7 = [v6 addressValue];

    CFStringRef v8 = [v7 identifier];
    v9 = +[CNContact _mapkit_sharedLocationContactIdentifer];
    unsigned int v10 = [v8 isEqualToString:v9];

    if (v10)
    {
      v11 = [(SearchResultMapItemBase *)self searchResult];
      v12 = [v11 autocompletePerson];
      [v12 locationTimestampString:1];
    }
    else
    {
      v11 = [v7 label];
      v12 = +[CNLabeledValue localizedStringForLabel:v11];
      [v12 capitalizedString];
    v13 = };
  }
  else
  {
    v13 = [(SearchResultMapItem *)self createSubtitle];
  }
  if (v13) {
    +[PersonalizedItemPrioritizedStringAdornment adornmentWithString:v13 priority:100];
  }
  else {
  v14 = +[PersonalizedItemPrioritizedStringAdornment defaultAdornment];
  }

  return v14;
}

- (id)createSubtitle
{
  int IsEnabled_RealTimeEVCharger = MapsFeature_IsEnabled_RealTimeEVCharger();
  v4 = [(SearchResultMapItemBase *)self searchResult];
  v5 = [v4 mapItem];
  v6 = v5;
  if (IsEnabled_RealTimeEVCharger)
  {
    v7 = [v5 _geoMapItem];
    unsigned int v8 = [v7 _hasEVCharger];

    if (v8)
    {
      v9 = [(SearchResultMapItemBase *)self searchResult];
      unsigned int v10 = [v9 mapItem];
      v4 = [v10 _realTimeAvailableEVCharger];

      v11 = +[EVChargerUtility realTimeEVChargerDisplayStringWithEvCharger:v4 mapDisplay:1];
    }
    else
    {
      v4 = [(SearchResultMapItem *)self styleAttributes];
      v14 = [v4 styleAttributes];
      [v14 poiType];

      v11 = &stru_101324E70;
    }
  }
  else
  {
    v12 = [v5 _firstLocalizedCategoryName];
    v13 = v12;
    if (v12)
    {
      v11 = v12;
    }
    else
    {
      v15 = [(SearchResultMapItemBase *)self searchResult];
      v11 = [v15 subtitle];
    }
  }

  return v11;
}

- (id)style
{
  style = self->_style;
  if (!style)
  {
    v4 = [(SearchResultMapItemBase *)self searchResult];
    v5 = +[GEOFeatureStyleAttributes styleAttributesForSearchResult:v4];
    v6 = self->_style;
    self->_style = v5;

    style = self->_style;
  }

  return style;
}

- (id)styleAttributes
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v40[0] = &off_1013AA5B8;
  v40[1] = &off_1013AA5E8;
  v41[0] = &off_1013AA5D0;
  v41[1] = &off_1013AA5D0;
  v40[2] = &off_1013AA600;
  v40[3] = &off_1013AA618;
  v41[2] = &off_1013AA5D0;
  v41[3] = &off_1013AA5D0;
  v4 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:4];
  [v3 addEntriesFromDictionary:v4];

  if (GEOConfigGetBOOL())
  {
    v5 = [(SearchResultMapItemBase *)self mapItem];
    if ([v5 _venueFeatureType] == (id)1)
    {

LABEL_5:
      v38 = &off_1013AA630;
      v39 = &off_1013AA5D0;
      unsigned int v8 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
      [v3 addEntriesFromDictionary:v8];

      goto LABEL_6;
    }
    v6 = [(SearchResultMapItemBase *)self mapItem];
    id v7 = [v6 _venueFeatureType];

    if (v7 == (id)2) {
      goto LABEL_5;
    }
  }
LABEL_6:
  v9 = [(SearchResultMapItem *)self style];
  if (MapsFeature_IsEnabled_RealTimeEVCharger() && [v9 poiType] == 335)
  {
    unsigned int v10 = [(SearchResultMapItemBase *)self mapItem];
    v11 = [v10 _realTimeAvailableEVCharger];

    unsigned int v12 = +[EVChargerUtility realTimeEVChargerStatusWithEvCharger:v11];
    if (v12 > 2) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = dword_100F735D8[v12];
    }
    v36 = &off_1013AA648;
    v14 = +[NSNumber numberWithInt:v13];
    v37 = v14;
    v15 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    [v3 addEntriesFromDictionary:v15];
  }
  v16 = [(SearchResultMapItemBase *)self searchResult];
  if ([v16 locationType] != 1)
  {

LABEL_16:
    v20 = [(SearchResultMapItemBase *)self searchResult];
    if ([v20 locationType] == 2)
    {
      v21 = [(SearchResultMapItemBase *)self searchResult];
      v22 = [v21 autocompletePerson];

      if (v22)
      {
        uint64_t v19 = +[GEOFeatureStyleAttributes workStyleAttributes];
        goto LABEL_33;
      }
    }
    else
    {
    }
    v23 = [(SearchResultMapItemBase *)self searchResult];
    if ([v23 locationType] == 3)
    {
      objc_super v24 = [(SearchResultMapItemBase *)self searchResult];
      v25 = [v24 autocompletePerson];

      if (v25)
      {
        uint64_t v19 = +[GEOFeatureStyleAttributes schoolStyleAttributes];
        goto LABEL_33;
      }
    }
    else
    {
    }
    v26 = [(SearchResultMapItemBase *)self searchResult];
    if ([v26 locationType] == 4)
    {
      v27 = [(SearchResultMapItemBase *)self searchResult];
      v28 = [v27 autocompletePerson];

      if (v28)
      {
        uint64_t v19 = +[GEOFeatureStyleAttributes sharedLocationStyleAttributes];
        goto LABEL_33;
      }
    }
    else
    {
    }
    v29 = [(SearchResultMapItemBase *)self searchResult];
    if ([v29 locationType])
    {
    }
    else
    {
      v32 = [(SearchResultMapItemBase *)self searchResult];
      v33 = [v32 autocompletePerson];

      if (v33)
      {
        uint64_t v19 = +[GEOFeatureStyleAttributes addressMarkerStyleAttributes];
        goto LABEL_33;
      }
    }
    id v30 = [v3 copy];
    v31 = +[PersonalizedItemStyleAttributesAdornment adornmentWithStyleAttributes:v9 additionalAttributes:v30];
    goto LABEL_34;
  }
  v17 = [(SearchResultMapItemBase *)self searchResult];
  v18 = [v17 autocompletePerson];

  if (!v18) {
    goto LABEL_16;
  }
  uint64_t v19 = +[GEOFeatureStyleAttributes homeStyleAttributes];
LABEL_33:
  id v30 = (id)v19;
  id v34 = [v3 copy];
  v31 = +[PersonalizedItemStyleAttributesAdornment adornmentWithStyleAttributes:v30 additionalAttributes:v34];

LABEL_34:

  return v31;
}

- (id)clientFeatureID
{
  id v3 = [(SearchResultMapItem *)self styleAttributes];
  v4 = [v3 styleAttributes];
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
    id v30 = [v29 name];
    v24 ^= (unint64_t)[v30 hash];
  }

  return +[PersonalizedItemClientFeatureIDAdornment adornmentWithClientFeatureID:v24];
}

- (BOOL)shouldBeClustered
{
  return 1;
}

- (BOOL)showsBalloonCallout
{
  v2 = [(SearchResultMapItem *)self style];
  unsigned __int8 v3 = [v2 isLabelPOI];

  return v3 ^ 1;
}

- (void).cxx_destruct
{
}

@end