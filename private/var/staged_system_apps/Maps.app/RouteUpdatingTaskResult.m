@interface RouteUpdatingTaskResult
+ (id)resultWithRouteID:(id)a3 transitUpdate:(id)a4;
- (GEOTransitRouteUpdate)transitUpdate;
- (NSUUID)routeID;
- (void)setRouteID:(id)a3;
- (void)setTransitUpdate:(id)a3;
@end

@implementation RouteUpdatingTaskResult

+ (id)resultWithRouteID:(id)a3 transitUpdate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)a1);
  [v8 setRouteID:v7];

  [v8 setTransitUpdate:v6];

  return v8;
}

- (NSUUID)routeID
{
  return self->_routeID;
}

- (void)setRouteID:(id)a3
{
}

- (GEOTransitRouteUpdate)transitUpdate
{
  return self->_transitUpdate;
}

- (void)setTransitUpdate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitUpdate, 0);

  objc_storeStrong((id *)&self->_routeID, 0);
}

@end