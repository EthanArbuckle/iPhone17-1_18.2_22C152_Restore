@interface RouteMarkerFormatterCustomText
- (NSArray)routes;
- (NSString)selectedRouteCustomText;
- (RouteMarkerFormatterCustomText)initWithRoutes:(id)a3 selectedRouteIndex:(unint64_t)a4 customSelectedRouteText:(id)a5;
- (id)markerInfoForRoute:(id)a3;
- (unint64_t)selectedRouteIndex;
@end

@implementation RouteMarkerFormatterCustomText

- (RouteMarkerFormatterCustomText)initWithRoutes:(id)a3 selectedRouteIndex:(unint64_t)a4 customSelectedRouteText:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)RouteMarkerFormatterCustomText;
  v10 = [(RouteMarkerFormatterCustomText *)&v16 init];
  if (v10)
  {
    v11 = (NSArray *)[v8 copy];
    routes = v10->_routes;
    v10->_routes = v11;

    v10->_selectedRouteIndex = a4;
    v13 = (NSString *)[v9 copy];
    selectedRouteCustomText = v10->_selectedRouteCustomText;
    v10->_selectedRouteCustomText = v13;
  }
  return v10;
}

- (id)markerInfoForRoute:(id)a3
{
  id v4 = a3;
  v5 = [(RouteMarkerFormatterCustomText *)self routes];
  id v6 = [v5 indexOfObject:v4];

  v7 = 0;
  if (v6 != (id)0x7FFFFFFFFFFFFFFFLL && v6 == self->_selectedRouteIndex)
  {
    id v8 = [RouteMarkerFormatterInfo alloc];
    selectedRouteCustomText = self->_selectedRouteCustomText;
    id v10 = [v4 tollCurrencyType];
    v11 = [v4 advisoriesStyleAttributes];
    v7 = [(RouteMarkerFormatterInfo *)v8 initWithRouteDescription:selectedRouteCustomText etaComparison:0 tollCurrency:v10 styleAttributes:v11];
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

- (NSString)selectedRouteCustomText
{
  return self->_selectedRouteCustomText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedRouteCustomText, 0);

  objc_storeStrong((id *)&self->_routes, 0);
}

@end