@interface GEOComposedRoute
@end

@implementation GEOComposedRoute

uint64_t __122__GEOComposedRoute_MNExtras___pointsConverge_pointCount_otherPoints_pointCount_tolerance_outCoordinatesA_outCoordinatesB___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 point];
  double v7 = v6;
  [v5 point];
  if (v7 < v8) {
    goto LABEL_2;
  }
  if (v7 > v8)
  {
LABEL_4:
    uint64_t v9 = 1;
    goto LABEL_10;
  }
  if (![v4 isStartOfSegment] || (objc_msgSend(v5, "isStartOfSegment") & 1) != 0)
  {
    if (([v4 isStartOfSegment] & 1) != 0 || (objc_msgSend(v5, "isStartOfSegment") & 1) == 0)
    {
      uint64_t v9 = 0;
      goto LABEL_10;
    }
    goto LABEL_4;
  }
LABEL_2:
  uint64_t v9 = -1;
LABEL_10:

  return v9;
}

uint64_t __122__GEOComposedRoute_MNExtras___pointsConverge_pointCount_otherPoints_pointCount_tolerance_outCoordinatesA_outCoordinatesB___block_invoke_103(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 routeCoordinate];
  [v5 routeCoordinate];
  uint64_t v6 = GEOPolylineCoordinateCompare();

  return v6;
}

void __52__GEOComposedRoute_MNExtras__userRequestedWaypoints__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isServerProvidedWaypoint] & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

uint64_t __97__GEOComposedRoute_MNRouteDivergenceFinder___navigation_leafBoundingSectionContainingCoordinate___block_invoke(uint64_t a1, void *a2, BOOL *a3)
{
  id v6 = a2;
  id v7 = v6;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    uint64_t v9 = v6;
    id v6 = (id)[v6 isLeaf];
    id v7 = v9;
    if (v6)
    {
      id v6 = (id)objc_msgSend(v9, "containsCoordinate:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
      id v7 = v9;
      if (v6)
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
        id v7 = v9;
      }
    }
  }
  *a3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) == 0;
  return MEMORY[0x1F41817F8](v6, v7);
}

void __80__GEOComposedRoute_MNRouteDivergenceFinder___navigation_allLeafBoundingSections__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isLeaf]) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

@end