@interface RouteStartEndItem
- (BOOL)isEqual:(id)a3;
- (BOOL)isRouteStartOrEnd;
- (BOOL)shouldBeHiddenFromMap;
- (RouteStartEndItem)init;
- (RouteStartEndItem)initWithSearchResult:(id)a3;
- (RouteStartEndItem)initWithSearchResult:(id)a3 routeFeatureType:(int)a4;
- (id)clientFeatureID;
- (id)description;
- (id)enhancedPlacement;
- (id)styleAttributes;
- (id)title;
- (void)setShouldBeHiddenFromMap:(BOOL)a3;
@end

@implementation RouteStartEndItem

- (RouteStartEndItem)init
{
  return 0;
}

- (RouteStartEndItem)initWithSearchResult:(id)a3
{
  return 0;
}

- (RouteStartEndItem)initWithSearchResult:(id)a3 routeFeatureType:(int)a4
{
  v6.receiver = self;
  v6.super_class = (Class)RouteStartEndItem;
  result = [(SearchResultMapItemBase *)&v6 initWithSearchResult:a3];
  if (result) {
    result->_routeFeatureType = a4;
  }
  return result;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(RouteStartEndItem *)self title];
  v5 = [(SearchResultMapItemBase *)self searchResult];
  objc_super v6 = +[NSString stringWithFormat:@"<%@: %p %@ %@>", v3, self, v4, v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RouteStartEndItem *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      objc_super v6 = [(SearchResultMapItemBase *)self searchResult];
      v7 = [(SearchResultMapItemBase *)v5 searchResult];
      if ([v6 isEqual:v7]) {
        BOOL v8 = self->_routeFeatureType == v5->_routeFeatureType;
      }
      else {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (id)title
{
  v14.receiver = self;
  v14.super_class = (Class)RouteStartEndItem;
  v2 = [(SearchResultMapItemBase *)&v14 title];
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = sub_100103C0C;
  v12 = sub_100104690;
  id v13 = 0;
  uint64_t v3 = [v2 value];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1004518A4;
  v7[3] = &unk_1012EAA30;
  v7[4] = &v8;
  [v3 enumerateLinesUsingBlock:v7];

  if ([(id)v9[5] length])
  {
    +[PersonalizedItemPrioritizedStringAdornment adornmentWithString:priority:](PersonalizedItemPrioritizedStringAdornment, "adornmentWithString:priority:", v9[5], (char *)[v2 priority] + 1);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = v2;
  }
  v5 = v4;
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)styleAttributes
{
  uint64_t v3 = [(SearchResultMapItemBase *)self searchResult];
  id v4 = +[GEOFeatureStyleAttributes styleAttributesForSearchResult:v3];

  v9[0] = &off_1013A7108;
  v5 = +[NSNumber numberWithInt:self->_routeFeatureType];
  v9[1] = &off_1013A7120;
  v10[0] = v5;
  v10[1] = &off_1013A7138;
  objc_super v6 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  v7 = +[PersonalizedItemStyleAttributesAdornment adornmentWithStyleAttributes:v4 additionalAttributes:v6];

  return v7;
}

- (id)clientFeatureID
{
  uint64_t v3 = [(RouteStartEndItem *)self styleAttributes];
  id v4 = [v3 styleAttributes];
  uint64_t v5 = (int)[v4 poiType];
  objc_super v6 = [(SearchResultMapItemBase *)self mapItem];
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

- (BOOL)isRouteStartOrEnd
{
  return 1;
}

- (id)enhancedPlacement
{
  v2 = [(SearchResultMapItemBase *)self searchResult];
  uint64_t v3 = [v2 mapItem];
  id v4 = [v3 _enhancedPlacement];

  return v4;
}

- (BOOL)shouldBeHiddenFromMap
{
  return self->_shouldBeHiddenFromMap;
}

- (void)setShouldBeHiddenFromMap:(BOOL)a3
{
  self->_shouldBeHiddenFromMap = a3;
}

@end