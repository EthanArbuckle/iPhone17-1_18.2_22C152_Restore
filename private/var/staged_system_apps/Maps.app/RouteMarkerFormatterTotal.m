@interface RouteMarkerFormatterTotal
- (NSArray)routes;
- (RouteMarkerFormatterTotal)initWithRoutes:(id)a3 selectedRouteIndex:(unint64_t)a4;
- (id)markerInfoForRoute:(id)a3;
- (id)markerInfosForLegsInRoute:(id)a3;
- (unint64_t)selectedRouteIndex;
- (void)setSelectedRouteIndex:(unint64_t)a3;
@end

@implementation RouteMarkerFormatterTotal

- (RouteMarkerFormatterTotal)initWithRoutes:(id)a3 selectedRouteIndex:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RouteMarkerFormatterTotal;
  v7 = [(RouteMarkerFormatterTotal *)&v11 init];
  if (v7)
  {
    v8 = (NSArray *)[v6 copy];
    routes = v7->_routes;
    v7->_routes = v8;

    v7->_selectedRouteIndex = a4;
  }

  return v7;
}

- (id)markerInfoForRoute:(id)a3
{
  id v4 = a3;
  [v4 travelAndChargingDuration];
  v5 = GEOStringForDuration();
  id v6 = [(RouteMarkerFormatterTotal *)self routes];
  id v7 = [v6 indexOfObject:v4];

  unint64_t selectedRouteIndex = self->_selectedRouteIndex;
  v9 = [v4 routeLabelAction];
  unsigned int v10 = [v9 detailTextAction];

  BOOL v12 = v7 != (id)selectedRouteIndex || v10 != 2;
  BOOL v13 = v10 != 1 && v12;
  v14 = [v4 routeLabelDescriptionString];
  v15 = [v14 stringWithDefaultOptions];

  if ([v15 length] && !v13)
  {
    uint64_t v16 = [v5 stringByAppendingFormat:@"\n%@", v15];

    v5 = (void *)v16;
  }
  v17 = [RouteMarkerFormatterInfo alloc];
  id v18 = [v4 tollCurrencyType];
  v19 = [v4 advisoriesStyleAttributes];
  v20 = [(RouteMarkerFormatterInfo *)v17 initWithRouteDescription:v5 etaComparison:0 tollCurrency:v18 styleAttributes:v19];

  return v20;
}

- (id)markerInfosForLegsInRoute:(id)a3
{
  id v3 = a3;
  id v4 = [v3 legs];
  id v5 = [v4 count];

  if (v5)
  {
    id v6 = [v3 legs];
    id v7 = sub_100099700(v6, &stru_1012FE6C8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (NSArray)routes
{
  return self->_routes;
}

- (unint64_t)selectedRouteIndex
{
  return self->_selectedRouteIndex;
}

- (void)setSelectedRouteIndex:(unint64_t)a3
{
  self->_unint64_t selectedRouteIndex = a3;
}

- (void).cxx_destruct
{
}

@end