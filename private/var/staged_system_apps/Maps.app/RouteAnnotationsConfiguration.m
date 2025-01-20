@interface RouteAnnotationsConfiguration
- ($212C09783140BCCD23384160D545CE0D)originalRouteDivergenceCoordinate;
- (BOOL)alternateRoutesEnabled;
- (BOOL)routeTrafficFeaturesActive;
- (BOOL)selectsPolyline;
- (GEOComposedRoute)focusedRoute;
- (GEOComposedRoute)selectedRoute;
- (GEOComposedRouteAnchorPointList)anchorPoints;
- (GEOComposedWaypoint)currentNavigationWaypoint;
- (NSArray)routes;
- (NSArray)transitVehiclePositions;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)selectedRouteCustomText;
- (NSUUID)originalRouteID;
- (RouteAnnotationsConfiguration)init;
- (RouteAnnotationsConfiguration)initWithRoute:(id)a3;
- (RouteAnnotationsConfiguration)initWithRoutes:(id)a3 selectedRouteIndex:(unint64_t)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)focusedRouteIndex;
- (unint64_t)routeMarkerOptions;
- (unint64_t)selectedRouteIndex;
- (unint64_t)style;
- (unsigned)proximityToCurrentNavigationWaypoint;
- (void)_copyPropertiesTo:(id)a3;
- (void)_maps_buildDescriptionWithBlock:(id)a3;
- (void)_setRoutes:(id)a3 selectedRouteIndex:(unint64_t)a4;
- (void)setAlternateRoutesEnabled:(BOOL)a3;
- (void)setAnchorPoints:(id)a3;
- (void)setCurrentNavigationWaypoint:(id)a3;
- (void)setFocusedRouteIndex:(unint64_t)a3;
- (void)setOriginalRouteDivergenceCoordinate:(id)a3;
- (void)setOriginalRouteID:(id)a3;
- (void)setProximityToCurrentNavigationWaypoint:(unsigned __int8)a3;
- (void)setRouteMarkerOptions:(unint64_t)a3;
- (void)setRouteTrafficFeaturesActive:(BOOL)a3;
- (void)setRoutes:(id)a3;
- (void)setSelectPolyline:(BOOL)a3;
- (void)setSelectedRouteCustomText:(id)a3;
- (void)setSelectedRouteIndex:(unint64_t)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setTransitVehiclePositions:(id)a3;
@end

@implementation RouteAnnotationsConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentNavigationWaypoint, 0);
  objc_storeStrong((id *)&self->_anchorPoints, 0);
  objc_storeStrong((id *)&self->_selectedRouteCustomText, 0);
  objc_storeStrong((id *)&self->_transitVehiclePositions, 0);
  objc_storeStrong((id *)&self->_originalRouteID, 0);

  objc_storeStrong((id *)&self->_routes, 0);
}

- (NSString)description
{
  v2 = self;
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_100091C00;
  v17 = &unk_1012E9588;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v18 = v3;
  v4 = objc_retainBlock(&v14);
  [(RouteAnnotationsConfiguration *)v2 _maps_buildDescriptionWithBlock:v4];
  v5 = v2;
  if (v5)
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      v8 = [(RouteAnnotationsConfiguration *)v5 performSelector:"accessibilityIdentifier"];
      v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9, v14, v15, v16, v17];

        goto LABEL_7;
      }
    }
    v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_7:

    goto LABEL_9;
  }
  v10 = @"<nil>";
LABEL_9:

  v11 = [v3 componentsJoinedByString:@", "];
  v12 = +[NSString stringWithFormat:@"%@ (%@)", v10, v11];

  return (NSString *)v12;
}

- (void)_maps_buildDescriptionWithBlock:(id)a3
{
  routes = self->_routes;
  v5 = (char *)a3;
  sub_100099700(routes, &stru_1012F90B0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if ([v6 count])
    {
      v8 = [v7 componentsJoinedByString:@", "];
      v9 = +[NSString stringWithFormat:@"<%p> [%@]", v7, v8];
    }
    else
    {
      v9 = +[NSString stringWithFormat:@"<%p> (empty)", v7];
    }
  }
  else
  {
    v9 = @"<nil>";
  }

  v10 = (void (**)(char *, const __CFString *, const __CFString *))(v5 + 16);
  (*((void (**)(char *, const __CFString *, __CFString *))v5 + 2))(v5, @"routes", v9);

  v11 = +[NSNumber numberWithUnsignedInteger:self->_selectedRouteIndex];
  (*((void (**)(char *, const __CFString *, void *))v5 + 2))(v5, @"selectedRouteIndex", v11);

  v12 = +[NSNumber numberWithUnsignedInteger:self->_focusedRouteIndex];
  (*((void (**)(char *, const __CFString *, void *))v5 + 2))(v5, @"focusedRouteIndex", v12);

  v13 = +[NSNumber numberWithUnsignedInteger:self->_style];
  (*((void (**)(char *, const __CFString *, void *))v5 + 2))(v5, @"style", v13);

  (*((void (**)(char *, const __CFString *, NSString *))v5 + 2))(v5, @"selectedRouteCustomText", self->_selectedRouteCustomText);
  v14 = +[NSNumber numberWithUnsignedInteger:self->_routeMarkerOptions];
  (*((void (**)(char *, const __CFString *, void *))v5 + 2))(v5, @"routeMarkerOptions", v14);

  if (self->_selectPolyline) {
    CFStringRef v15 = @"YES";
  }
  else {
    CFStringRef v15 = @"NO";
  }
  (*v10)(v5, @"selectPolyline", v15);
  if (self->_alternateRoutesEnabled) {
    CFStringRef v16 = @"YES";
  }
  else {
    CFStringRef v16 = @"NO";
  }
  (*v10)(v5, @"alternateRoutesEnabled", v16);
  if (self->_routeTrafficFeaturesActive) {
    CFStringRef v17 = @"YES";
  }
  else {
    CFStringRef v17 = @"NO";
  }
  (*v10)(v5, @"routeTrafficFeaturesActive", v17);
  id v18 = +[NSNumber numberWithUnsignedInteger:[(GEOComposedRouteAnchorPointList *)self->_anchorPoints count]];
  (*v10)(v5, @"anchorPoints", v18);

  (*v10)(v5, @"currentNavigationWaypoint", (const __CFString *)self->_currentNavigationWaypoint);
  v19 = +[NSNumber numberWithUnsignedChar:self->_proximityToCurrentNavigationWaypoint];
  (*v10)(v5, @"proximityToCurrentNavigationWaypoint", v19);
}

- (NSArray)routes
{
  return self->_routes;
}

- (GEOComposedRouteAnchorPointList)anchorPoints
{
  return self->_anchorPoints;
}

- (BOOL)selectsPolyline
{
  return self->_selectPolyline;
}

- (BOOL)routeTrafficFeaturesActive
{
  return self->_routeTrafficFeaturesActive;
}

- (BOOL)alternateRoutesEnabled
{
  return self->_alternateRoutesEnabled;
}

- (NSArray)transitVehiclePositions
{
  return self->_transitVehiclePositions;
}

- (unint64_t)style
{
  return self->_style;
}

- (unint64_t)selectedRouteIndex
{
  return self->_selectedRouteIndex;
}

- (NSString)selectedRouteCustomText
{
  return self->_selectedRouteCustomText;
}

- (unint64_t)routeMarkerOptions
{
  return self->_routeMarkerOptions;
}

- (unsigned)proximityToCurrentNavigationWaypoint
{
  return self->_proximityToCurrentNavigationWaypoint;
}

- (NSUUID)originalRouteID
{
  return self->_originalRouteID;
}

- (unint64_t)focusedRouteIndex
{
  return self->_focusedRouteIndex;
}

- (GEOComposedWaypoint)currentNavigationWaypoint
{
  return self->_currentNavigationWaypoint;
}

- (GEOComposedRoute)selectedRoute
{
  unint64_t selectedRouteIndex = self->_selectedRouteIndex;
  if (selectedRouteIndex >= [(NSArray *)self->_routes count])
  {
    v4 = 0;
  }
  else
  {
    v4 = [(NSArray *)self->_routes objectAtIndexedSubscript:self->_selectedRouteIndex];
  }

  return (GEOComposedRoute *)v4;
}

- (RouteAnnotationsConfiguration)init
{
  return [(RouteAnnotationsConfiguration *)self initWithRoute:0];
}

- (RouteAnnotationsConfiguration)initWithRoute:(id)a3
{
  if (a3)
  {
    id v9 = a3;
    id v4 = a3;
    v5 = +[NSArray arrayWithObjects:&v9 count:1];

    uint64_t v6 = 0;
  }
  else
  {
    v5 = 0;
    uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v7 = -[RouteAnnotationsConfiguration initWithRoutes:selectedRouteIndex:](self, "initWithRoutes:selectedRouteIndex:", v5, v6, v9);

  return v7;
}

- (RouteAnnotationsConfiguration)initWithRoutes:(id)a3 selectedRouteIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [v6 count];
  v12.receiver = self;
  v12.super_class = (Class)RouteAnnotationsConfiguration;
  v8 = [(RouteAnnotationsConfiguration *)&v12 init];
  if (v8)
  {
    if ((unint64_t)v7 <= a4) {
      a4 = 0x7FFFFFFFFFFFFFFFLL;
    }
    id v9 = (NSArray *)[v6 copy];
    routes = v8->_routes;
    v8->_routes = v9;

    v8->_unint64_t selectedRouteIndex = a4;
    v8->_focusedRouteIndex = 0x7FFFFFFFFFFFFFFFLL;
    v8->_routeMarkerOptions = 3;
    *(_WORD *)&v8->_selectPolyline = 257;
  }

  return v8;
}

- (void)setRoutes:(id)a3
{
  id v5 = a3;
  if ([v5 count]) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  [(RouteAnnotationsConfiguration *)self _setRoutes:v5 selectedRouteIndex:v4];
}

- (void)_setRoutes:(id)a3 selectedRouteIndex:(unint64_t)a4
{
  id v6 = (NSArray *)a3;
  id v7 = v6;
  if (self->_routes == v6)
  {
    p_unint64_t selectedRouteIndex = &self->_selectedRouteIndex;
    if (self->_selectedRouteIndex == a4) {
      goto LABEL_13;
    }
  }
  else
  {
    v14 = v6;
    unsigned int v8 = -[NSArray isEqualToArray:](v6, "isEqualToArray:");
    id v7 = v14;
    p_unint64_t selectedRouteIndex = &self->_selectedRouteIndex;
    unint64_t selectedRouteIndex = self->_selectedRouteIndex;
    if (v8) {
      BOOL v11 = selectedRouteIndex == a4;
    }
    else {
      BOOL v11 = 0;
    }
    if (v11) {
      goto LABEL_13;
    }
    if ((v8 & 1) == 0)
    {
      objc_super v12 = (NSArray *)[(NSArray *)v14 copy];
      routes = self->_routes;
      self->_routes = v12;

      id v7 = v14;
    }
    if (selectedRouteIndex == a4) {
      goto LABEL_12;
    }
  }
  *p_unint64_t selectedRouteIndex = a4;
LABEL_12:
  self->_focusedRouteIndex = 0x7FFFFFFFFFFFFFFFLL;
LABEL_13:
}

- (GEOComposedRoute)focusedRoute
{
  unint64_t focusedRouteIndex = self->_focusedRouteIndex;
  if (focusedRouteIndex >= [(NSArray *)self->_routes count])
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = [(NSArray *)self->_routes objectAtIndexedSubscript:self->_focusedRouteIndex];
  }

  return (GEOComposedRoute *)v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(RouteAnnotationsConfiguration *)+[RouteAnnotationsMutableConfiguration allocWithZone:a3] initWithRoute:0];
  [(RouteAnnotationsConfiguration *)self _copyPropertiesTo:v4];
  return v4;
}

- (void)_copyPropertiesTo:(id)a3
{
  id v11 = a3;
  uint64_t v4 = [(RouteAnnotationsConfiguration *)self routes];
  [v11 setRoutes:v4];

  [v11 setSelectedRouteIndex:[self selectedRouteIndex]];
  id v5 = [(RouteAnnotationsConfiguration *)self originalRouteID];
  [v11 setOriginalRouteID:v5];

  [v11 setOriginalRouteDivergenceCoordinate:[self originalRouteDivergenceCoordinate]];
  id v6 = [(RouteAnnotationsConfiguration *)self transitVehiclePositions];
  [v11 setTransitVehiclePositions:v6];

  [v11 setStyle:[self style]];
  id v7 = [(RouteAnnotationsConfiguration *)self selectedRouteCustomText];
  [v11 setSelectedRouteCustomText:v7];

  [v11 setRouteMarkerOptions:[self routeMarkerOptions]];
  [v11 setAlternateRoutesEnabled:[self alternateRoutesEnabled]];
  [v11 setSelectPolyline:[self selectsPolyline]];
  [v11 setFocusedRouteIndex:[self focusedRouteIndex]];
  [v11 setRouteTrafficFeaturesActive:[self routeTrafficFeaturesActive]];
  unsigned int v8 = [(RouteAnnotationsConfiguration *)self anchorPoints];
  id v9 = [v8 copy];
  [v11 setAnchorPoints:v9];

  v10 = [(RouteAnnotationsConfiguration *)self currentNavigationWaypoint];
  [v11 setCurrentNavigationWaypoint:v10];

  [v11 setProximityToCurrentNavigationWaypoint:[self proximityToCurrentNavigationWaypoint]];
}

- (NSString)debugDescription
{
  v2 = self;
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  CFStringRef v16 = sub_1007CC080;
  CFStringRef v17 = &unk_1012E9588;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v18 = v3;
  uint64_t v4 = objc_retainBlock(&v14);
  [(RouteAnnotationsConfiguration *)v2 _maps_buildDescriptionWithBlock:v4];
  id v5 = v2;
  if (v5)
  {
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      unsigned int v8 = [(RouteAnnotationsConfiguration *)v5 performSelector:"accessibilityIdentifier"];
      id v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9, v14, v15, v16, v17];

        goto LABEL_7;
      }
    }
    v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_7:

    goto LABEL_9;
  }
  v10 = @"<nil>";
LABEL_9:

  id v11 = [v3 componentsJoinedByString:@"\n"];
  objc_super v12 = +[NSString stringWithFormat:@"%@ {\n%@\n}", v10, v11];

  return (NSString *)v12;
}

- (void)setSelectedRouteIndex:(unint64_t)a3
{
  self->_unint64_t selectedRouteIndex = a3;
}

- (void)setFocusedRouteIndex:(unint64_t)a3
{
  self->_unint64_t focusedRouteIndex = a3;
}

- (void)setOriginalRouteID:(id)a3
{
}

- ($212C09783140BCCD23384160D545CE0D)originalRouteDivergenceCoordinate
{
  return ($212C09783140BCCD23384160D545CE0D)self->_originalRouteDivergenceCoordinate;
}

- (void)setOriginalRouteDivergenceCoordinate:(id)a3
{
  self->_originalRouteDivergenceCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)a3;
}

- (void)setTransitVehiclePositions:(id)a3
{
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (void)setSelectedRouteCustomText:(id)a3
{
}

- (void)setRouteMarkerOptions:(unint64_t)a3
{
  self->_routeMarkerOptions = a3;
}

- (void)setSelectPolyline:(BOOL)a3
{
  self->_selectPolyline = a3;
}

- (void)setAlternateRoutesEnabled:(BOOL)a3
{
  self->_alternateRoutesEnabled = a3;
}

- (void)setRouteTrafficFeaturesActive:(BOOL)a3
{
  self->_routeTrafficFeaturesActive = a3;
}

- (void)setAnchorPoints:(id)a3
{
}

- (void)setCurrentNavigationWaypoint:(id)a3
{
}

- (void)setProximityToCurrentNavigationWaypoint:(unsigned __int8)a3
{
  self->_proximityToCurrentNavigationWaypoint = a3;
}

@end