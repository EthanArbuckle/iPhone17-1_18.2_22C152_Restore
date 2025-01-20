@interface GEORouteInitializerData(MNExtras)
- (MNActiveRouteInfo)mainRouteInfo;
- (id)allETAUAlternateRouteInfos;
- (id)allRouteInfos;
@end

@implementation GEORouteInitializerData(MNExtras)

- (id)allRouteInfos
{
  v1 = [a1 allRoutes];
  v2 = objc_msgSend(v1, "_geo_map:", &__block_literal_global_15);

  return v2;
}

- (MNActiveRouteInfo)mainRouteInfo
{
  v1 = [a1 mainRoute];
  if (v1) {
    v2 = [[MNActiveRouteInfo alloc] initWithRoute:v1];
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (id)allETAUAlternateRouteInfos
{
  v2 = [a1 etaTrafficUpdateResponse];
  v3 = [v2 waypointRoute];

  if (v3 && (v4 = (void *)[v3 newWaypointRoutes], uint64_t v5 = objc_msgSend(v4, "count"), v4, v5))
  {
    v6 = [a1 allETAUAlternateRoutes];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __63__GEORouteInitializerData_MNExtras__allETAUAlternateRouteInfos__block_invoke;
    v9[3] = &unk_1E60F7898;
    id v10 = v3;
    v7 = objc_msgSend(v6, "_geo_map:", v9);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end