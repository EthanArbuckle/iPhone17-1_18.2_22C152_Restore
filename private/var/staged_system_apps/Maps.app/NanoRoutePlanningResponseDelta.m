@interface NanoRoutePlanningResponseDelta
+ (id)everythingChanged;
- (BOOL)routeRevisionsChanged;
- (BOOL)routesChanged;
- (BOOL)selectedRideIndexesChanged;
- (BOOL)selectedRouteChanged;
- (NSArray)identifiersForChangedRoutes;
- (id)description;
- (void)setIdentifiersForChangedRoutes:(id)a3;
- (void)setRouteRevisionsChanged:(BOOL)a3;
- (void)setRoutesChanged:(BOOL)a3;
- (void)setSelectedRideIndexesChanged:(BOOL)a3;
- (void)setSelectedRouteChanged:(BOOL)a3;
@end

@implementation NanoRoutePlanningResponseDelta

+ (id)everythingChanged
{
  id v2 = objc_alloc_init((Class)a1);
  [v2 setRoutesChanged:1];
  [v2 setSelectedRouteChanged:1];
  [v2 setRouteRevisionsChanged:1];
  [v2 setSelectedRideIndexesChanged:1];

  return v2;
}

- (id)description
{
  v13.receiver = self;
  v13.super_class = (Class)NanoRoutePlanningResponseDelta;
  v3 = [(NanoRoutePlanningResponseDelta *)&v13 description];
  if ([(NanoRoutePlanningResponseDelta *)self routesChanged]) {
    v4 = @"YES";
  }
  else {
    v4 = @"NO";
  }
  v5 = v4;
  if ([(NanoRoutePlanningResponseDelta *)self selectedRouteChanged]) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  v7 = v6;
  if ([(NanoRoutePlanningResponseDelta *)self routeRevisionsChanged]) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  v9 = v8;
  if ([(NanoRoutePlanningResponseDelta *)self selectedRideIndexesChanged]) {
    CFStringRef v10 = @"YES";
  }
  else {
    CFStringRef v10 = @"NO";
  }
  v11 = +[NSString stringWithFormat:@"%@ <routesChanged: %@, selectedRouteChanged: %@, routeRevisionsChanged: %@, selectedRideIndexesChanged: %@>", v3, v5, v7, v9, v10];

  return v11;
}

- (BOOL)routesChanged
{
  return self->_routesChanged;
}

- (void)setRoutesChanged:(BOOL)a3
{
  self->_routesChanged = a3;
}

- (BOOL)selectedRouteChanged
{
  return self->_selectedRouteChanged;
}

- (void)setSelectedRouteChanged:(BOOL)a3
{
  self->_selectedRouteChanged = a3;
}

- (BOOL)routeRevisionsChanged
{
  return self->_routeRevisionsChanged;
}

- (void)setRouteRevisionsChanged:(BOOL)a3
{
  self->_routeRevisionsChanged = a3;
}

- (BOOL)selectedRideIndexesChanged
{
  return self->_selectedRideIndexesChanged;
}

- (void)setSelectedRideIndexesChanged:(BOOL)a3
{
  self->_selectedRideIndexesChanged = a3;
}

- (NSArray)identifiersForChangedRoutes
{
  return self->_identifiersForChangedRoutes;
}

- (void)setIdentifiersForChangedRoutes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end