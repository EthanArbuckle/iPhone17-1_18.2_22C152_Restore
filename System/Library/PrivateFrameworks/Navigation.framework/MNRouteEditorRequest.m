@interface MNRouteEditorRequest
- (GEOCommonOptions)commonOptions;
- (GEOComposedGeometryRoutePersistentData)undoRedoRouteData;
- (GEOComposedRoute)currentRoute;
- (GEOComposedRouteAnchorPointList)anchorPoints;
- (GEODirectionsServiceRequest)directionsServiceRequest;
- (GEOMapItemClientAttributes)clientAttributes;
- (GEOMapServiceTraits)traits;
- (GEORouteAttributes)routeAttributes;
- (MNRouteEditorRequest)init;
- (NSArray)waypoints;
- (id)newAnchorPoints;
- (unint64_t)action;
- (void)setAction:(unint64_t)a3;
- (void)setAnchorPoints:(id)a3;
- (void)setClientAttributes:(id)a3;
- (void)setCommonOptions:(id)a3;
- (void)setCurrentRoute:(id)a3;
- (void)setDirectionsServiceRequest:(id)a3;
- (void)setRouteAttributes:(id)a3;
- (void)setTraits:(id)a3;
- (void)setUndoRedoRouteData:(id)a3;
- (void)setWaypoints:(id)a3;
@end

@implementation MNRouteEditorRequest

- (MNRouteEditorRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)MNRouteEditorRequest;
  v2 = [(MNRouteEditorRequest *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_action = 0;
    [(MNRouteEditorRequest *)v2 setTraits:0];
    v4 = v3;
  }

  return v3;
}

- (id)newAnchorPoints
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  v4 = [(MNRouteEditorRequest *)self currentRoute];
  v5 = [v4 anchorPoints];
  objc_super v6 = [v5 anchorPoints];
  v7 = [v3 setWithArray:v6];

  v8 = (void *)MEMORY[0x1E4F1CA80];
  v9 = [(MNRouteEditorRequest *)self anchorPoints];
  v10 = [v9 anchorPoints];
  v11 = [v8 setWithArray:v10];

  [v11 minusSet:v7];
  return v11;
}

- (void)setTraits:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v5 = [MEMORY[0x1E4F64710] sharedService];
    id v4 = [v5 defaultTraits];
  }
  [v4 useOnlineToOfflineFailoverRequestModeIfAllowed];
  traits = self->_traits;
  self->_traits = (GEOMapServiceTraits *)v4;
}

- (GEORouteAttributes)routeAttributes
{
  return self->_routeAttributes;
}

- (void)setRouteAttributes:(id)a3
{
}

- (GEOComposedRouteAnchorPointList)anchorPoints
{
  return self->_anchorPoints;
}

- (void)setAnchorPoints:(id)a3
{
}

- (unint64_t)action
{
  return self->_action;
}

- (void)setAction:(unint64_t)a3
{
  self->_action = a3;
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (GEOMapItemClientAttributes)clientAttributes
{
  return self->_clientAttributes;
}

- (void)setClientAttributes:(id)a3
{
}

- (GEOCommonOptions)commonOptions
{
  return self->_commonOptions;
}

- (void)setCommonOptions:(id)a3
{
}

- (NSArray)waypoints
{
  return self->_waypoints;
}

- (void)setWaypoints:(id)a3
{
}

- (GEOComposedRoute)currentRoute
{
  return self->_currentRoute;
}

- (void)setCurrentRoute:(id)a3
{
}

- (GEOComposedGeometryRoutePersistentData)undoRedoRouteData
{
  return self->_undoRedoRouteData;
}

- (void)setUndoRedoRouteData:(id)a3
{
}

- (GEODirectionsServiceRequest)directionsServiceRequest
{
  return self->_directionsServiceRequest;
}

- (void)setDirectionsServiceRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directionsServiceRequest, 0);
  objc_storeStrong((id *)&self->_undoRedoRouteData, 0);
  objc_storeStrong((id *)&self->_currentRoute, 0);
  objc_storeStrong((id *)&self->_waypoints, 0);
  objc_storeStrong((id *)&self->_commonOptions, 0);
  objc_storeStrong((id *)&self->_clientAttributes, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_anchorPoints, 0);
  objc_storeStrong((id *)&self->_routeAttributes, 0);
}

@end