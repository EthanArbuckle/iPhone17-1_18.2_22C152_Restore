@interface RouteCreationEditState
+ (id)initialEditStateFromMapItems:(id)a3;
+ (id)initialEditStateFromRoute:(id)a3;
- (GEOComposedGeometryRoutePersistentData)routePersistentData;
- (GEOComposedRouteAnchorPointList)anchorPoints;
- (RouteCreationEditState)initWithReason:(unint64_t)a3 anchorPoints:(id)a4;
- (id)description;
- (id)instanceByAddingAnchorPoint:(id)a3;
- (id)instanceByClosingTheLoop;
- (id)instanceByFormingOutAndBackAnchors;
- (id)instanceByRemovingFirstAnchorPoint:(id)a3;
- (id)instanceByRemovingLastAnchorPoint:(id)a3;
- (id)instanceByReversingAnchorPoints;
- (unint64_t)reason;
- (void)updateWithSuccessfulRoute:(id)a3;
@end

@implementation RouteCreationEditState

- (RouteCreationEditState)initWithReason:(unint64_t)a3 anchorPoints:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RouteCreationEditState;
  v7 = [(RouteCreationEditState *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_reason = a3;
    v9 = (GEOComposedRouteAnchorPointList *)[v6 copy];
    anchorPoints = v8->_anchorPoints;
    v8->_anchorPoints = v9;
  }
  return v8;
}

- (id)instanceByAddingAnchorPoint:(id)a3
{
  id v4 = a3;
  v5 = [(RouteCreationEditState *)self anchorPoints];
  id v6 = [v5 copy];

  [v6 appendAnchorPoint:v4];
  id v7 = [objc_alloc((Class)objc_opt_class()) initWithReason:1 anchorPoints:v6];

  return v7;
}

- (id)instanceByRemovingFirstAnchorPoint:(id)a3
{
  id v4 = a3;
  v5 = [(RouteCreationEditState *)self anchorPoints];
  id v6 = [v5 copy];

  [v6 removeFirstAnchorSharingPositionWith:v4];
  id v7 = [objc_alloc((Class)objc_opt_class()) initWithReason:2 anchorPoints:v6];

  return v7;
}

- (id)instanceByRemovingLastAnchorPoint:(id)a3
{
  id v4 = a3;
  v5 = [(RouteCreationEditState *)self anchorPoints];
  id v6 = [v5 copy];

  [v6 removeLastAnchorSharingPositionWith:v4];
  id v7 = [objc_alloc((Class)objc_opt_class()) initWithReason:2 anchorPoints:v6];

  return v7;
}

- (id)instanceByReversingAnchorPoints
{
  v2 = [(RouteCreationEditState *)self anchorPoints];
  id v3 = [v2 copy];

  [v3 reverse];
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithReason:3 anchorPoints:v3];

  return v4;
}

- (id)instanceByFormingOutAndBackAnchors
{
  v2 = [(RouteCreationEditState *)self anchorPoints];
  id v3 = [v2 copy];

  [v3 createOutAndBack];
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithReason:4 anchorPoints:v3];

  return v4;
}

- (id)instanceByClosingTheLoop
{
  v2 = [(RouteCreationEditState *)self anchorPoints];
  id v3 = [v2 copy];

  [v3 closeLoop];
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithReason:5 anchorPoints:v3];

  return v4;
}

+ (id)initialEditStateFromRoute:(id)a3
{
  id v4 = [a3 anchorPoints];
  v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = (id)objc_opt_new();
  }
  id v7 = v6;

  id v8 = [objc_alloc((Class)a1) initWithReason:0 anchorPoints:v7];

  return v8;
}

+ (id)initialEditStateFromMapItems:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v10 isCurrentLocation])
        {
          [v10 _coordinate];
          double v12 = v11;
          [v10 _coordinate];
          double v14 = v13;
          v15 = [v10 _geoMapItem];
          v16 = [v15 name];
          +[GEOComposedRouteAnchorPoint anchorPointWithCoordinate:isCurrentLocation:name:](GEOComposedRouteAnchorPoint, "anchorPointWithCoordinate:isCurrentLocation:name:", 1, v16, v12, v14, 1.79769313e308);
          id v17 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v18 = objc_alloc((Class)GEOComposedRouteAnchorPoint);
          v15 = [v10 _geoMapItem];
          id v17 = [v18 initWithMapItem:v15];
        }

        [v4 appendAnchorPoint:v17];
      }
      id v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }

  id v19 = [objc_alloc((Class)a1) initWithReason:0 anchorPoints:v4];

  return v19;
}

- (void)updateWithSuccessfulRoute:(id)a3
{
  id v4 = a3;
  id v5 = [v4 anchorPoints];
  anchorPoints = self->_anchorPoints;
  self->_anchorPoints = v5;

  id v7 = [v4 persistentData];

  routePersistentData = self->_routePersistentData;
  self->_routePersistentData = v7;
}

- (id)description
{
  id v3 = [(RouteCreationEditState *)self anchorPoints];
  id v4 = [v3 anchorPoints];
  [v4 _geo_map:&stru_1012ECAE0];

  uint64_t v6 = objc_opt_class();
  unint64_t v7 = [(RouteCreationEditState *)self reason];
  uint64_t v8 = [v5 componentsJoinedByString:@"\n\t"];
  v9 = +[NSString stringWithFormat:@"<%@:%p reason: %lu, anchor points:\n\t%@\n>", v6, self, v7, v8];

  return v9;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (GEOComposedRouteAnchorPointList)anchorPoints
{
  return self->_anchorPoints;
}

- (GEOComposedGeometryRoutePersistentData)routePersistentData
{
  return self->_routePersistentData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routePersistentData, 0);

  objc_storeStrong((id *)&self->_anchorPoints, 0);
}

@end