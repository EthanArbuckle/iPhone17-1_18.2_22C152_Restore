@interface GEORouteInitializerData
@end

@implementation GEORouteInitializerData

MNActiveRouteInfo *__50__GEORouteInitializerData_MNExtras__allRouteInfos__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[MNActiveRouteInfo alloc] initWithRoute:v2];

  return v3;
}

MNActiveRouteInfo *__63__GEORouteInitializerData_MNExtras__allETAUAlternateRouteInfos__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [[MNActiveRouteInfo alloc] initWithRoute:v3];
  v5 = (void *)[*(id *)(a1 + 32) newWaypointRoutes];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    while (1)
    {
      v8 = (void *)[*(id *)(a1 + 32) newWaypointRoutes];
      v9 = [v8 objectAtIndexedSubscript:v7];

      v10 = [v3 geoWaypointRoute];

      if (v10 == v9) {
        break;
      }

      ++v7;
      v11 = (void *)[*(id *)(a1 + 32) newWaypointRoutes];
      unint64_t v12 = [v11 count];

      if (v7 >= v12) {
        goto LABEL_7;
      }
    }
    [(MNActiveRouteInfo *)v4 setAlternateRouteIndex:v7];
  }
LABEL_7:

  return v4;
}

@end