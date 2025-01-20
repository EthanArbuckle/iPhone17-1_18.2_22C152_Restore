@interface RouteMarkerFormatterRouteName
- (NSArray)routes;
- (RouteMarkerFormatterRouteName)initWithRoutes:(id)a3 selectedRouteIndex:(unint64_t)a4;
- (id)markerInfoForRoute:(id)a3;
- (unint64_t)selectedRouteIndex;
@end

@implementation RouteMarkerFormatterRouteName

- (RouteMarkerFormatterRouteName)initWithRoutes:(id)a3 selectedRouteIndex:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RouteMarkerFormatterRouteName;
  v7 = [(RouteMarkerFormatterRouteName *)&v11 init];
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
  v5 = [v4 name];
  id v6 = [(RouteMarkerFormatterRouteName *)self routes];
  id v7 = [v6 indexOfObject:v4];

  v8 = 0;
  if (v7 != (id)0x7FFFFFFFFFFFFFFFLL && v7 == self->_selectedRouteIndex)
  {
    if ([v5 length])
    {
      v9 = [RouteMarkerFormatterInfo alloc];
      id v10 = [v4 tollCurrencyType];
      objc_super v11 = [v4 advisoriesStyleAttributes];
      v8 = [(RouteMarkerFormatterInfo *)v9 initWithRouteDescription:v5 etaType:4 etaComparison:0 tollCurrency:v10 styleAttributes:v11];
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (NSArray)routes
{
  return self->_routes;
}

- (unint64_t)selectedRouteIndex
{
  return self->_selectedRouteIndex;
}

- (void).cxx_destruct
{
}

@end