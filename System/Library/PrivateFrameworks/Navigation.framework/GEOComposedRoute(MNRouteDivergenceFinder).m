@interface GEOComposedRoute(MNRouteDivergenceFinder)
- (MNRouteDivergenceFinderBoundingSection)_navigation_boundingSectionForRange:()MNRouteDivergenceFinder leafIndex:;
- (id)_navigation_allLeafBoundingSections;
- (id)_navigation_leafBoundingSectionContainingCoordinate:()MNRouteDivergenceFinder;
- (id)_navigation_leafBoundingSectionForRouteCoordinate:()MNRouteDivergenceFinder;
- (id)_navigation_leafBoundingSectionsIntersectingSection:()MNRouteDivergenceFinder;
- (id)_navigation_leafBoundingSectionsIntersectingSection:()MNRouteDivergenceFinder paddingMapPoints:;
- (id)_navigation_rootBoundingSection;
@end

@implementation GEOComposedRoute(MNRouteDivergenceFinder)

- (id)_navigation_rootBoundingSection
{
  v4 = objc_getAssociatedObject(a1, a2);
  if (!v4)
  {
    uint64_t v6 = 0;
    v4 = objc_msgSend(a1, "_navigation_boundingSectionForRange:leafIndex:", 0, objc_msgSend(a1, "endRouteCoordinate"), &v6);
    objc_setAssociatedObject(a1, a2, v4, (void *)1);
  }
  return v4;
}

- (MNRouteDivergenceFinderBoundingSection)_navigation_boundingSectionForRange:()MNRouteDivergenceFinder leafIndex:
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (GEOPolylineCoordinateRangeIsInvalid())
  {
    v9 = 0;
  }
  else
  {
    [a1 distanceBetweenRouteCoordinate:a3 andRouteCoordinate:a4];
    double v11 = v10;
    v9 = objc_alloc_init(MNRouteDivergenceFinderBoundingSection);
    -[MNRouteDivergenceFinderBoundingSection setRange:](v9, "setRange:", a3, a4);
    [(MNRouteDivergenceFinderBoundingSection *)v9 setLength:v11];
    [a1 distance];
    double v13 = v12 / 1000.0;
    double v14 = 1609.0;
    if (v13 >= 1609.0)
    {
      [a1 distance];
      double v14 = v15 / 1000.0;
    }
    BOOL v16 = v11 <= v14 || (int)a3 + 1 >= a4;
    if (v16
      || ([a1 routeCoordinateForDistance:a3 afterRouteCoordinate:v11 * 0.5],
          uint64_t v17 = GEOPolylineCoordinateNearestIndex(),
          (GEOPolylineCoordinateEqual() & 1) != 0)
      || (GEOPolylineCoordinateEqual() & 1) != 0)
    {
      a3 = a3;
      if (a3 <= (unint64_t)a4)
      {
        uint64_t v18 = a4 + 1;
        double v19 = -180.0;
        double v20 = 180.0;
        double v21 = 180.0;
        double v22 = -180.0;
        do
        {
          [a1 pointAt:a3];
          double v20 = fmin(v20, v23);
          double v21 = fmin(v21, v24);
          double v19 = fmax(v19, v23);
          double v22 = fmax(v22, v24);
          ++a3;
        }
        while (v18 != a3);
      }
      GEOMapRectForCoordinateRegion();
      -[MNRouteDivergenceFinderBoundingSection setBoundingRect:](v9, "setBoundingRect:");
      ++*a5;
      -[MNRouteDivergenceFinderBoundingSection setLeafIndex:](v9, "setLeafIndex:");
    }
    else
    {
      v26 = objc_msgSend(a1, "_navigation_boundingSectionForRange:leafIndex:", a3, v17, a5);
      uint64_t v27 = objc_msgSend(a1, "_navigation_boundingSectionForRange:leafIndex:", v17, a4, a5);
      v28 = (void *)v27;
      if (!v26 || !v27)
      {
        v31 = [NSString stringWithFormat:@"Error creating child bounding sections"];
        v32 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          int v33 = 136315394;
          v34 = "left != nil && right != nil";
          __int16 v35 = 2112;
          v36 = v31;
          _os_log_impl(&dword_1B542B000, v32, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", (uint8_t *)&v33, 0x16u);
        }
      }
      [(MNRouteDivergenceFinderBoundingSection *)v9 setLeft:v26];
      [(MNRouteDivergenceFinderBoundingSection *)v9 setRight:v28];
      v29 = [(MNRouteDivergenceFinderBoundingSection *)v9 left];
      [v29 boundingRect];
      v30 = [(MNRouteDivergenceFinderBoundingSection *)v9 right];
      [v30 boundingRect];
      GEOMapRectUnion();
      -[MNRouteDivergenceFinderBoundingSection setBoundingRect:](v9, "setBoundingRect:");

      [(MNRouteDivergenceFinderBoundingSection *)v9 setLeafIndex:0x7FFFFFFFFFFFFFFFLL];
    }
  }
  return v9;
}

- (id)_navigation_leafBoundingSectionForRouteCoordinate:()MNRouteDivergenceFinder
{
  objc_msgSend(a1, "_navigation_rootBoundingSection");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 range];
  if (GEOPolylineCoordinateInRange())
  {
    if (v1)
    {
      while (([v1 isLeaf] & 1) == 0)
      {
        v2 = [v1 left];
        if (v2
          && ([v1 left],
              v3 = objc_claimAutoreleasedReturnValue(),
              [v3 range],
              int v4 = GEOPolylineCoordinateInRange(),
              v3,
              v2,
              v4))
        {
          uint64_t v5 = [v1 left];
        }
        else
        {
          uint64_t v6 = [v1 right];
          if (!v6
            || ([v1 right],
                v7 = objc_claimAutoreleasedReturnValue(),
                [v7 range],
                int v8 = GEOPolylineCoordinateInRange(),
                v7,
                v6,
                !v8))
          {

            id v1 = 0;
            break;
          }
          uint64_t v5 = [v1 right];
        }
        v9 = (void *)v5;

        id v1 = v9;
        if (!v9) {
          break;
        }
      }
    }
    id v1 = v1;
    double v10 = v1;
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (id)_navigation_leafBoundingSectionContainingCoordinate:()MNRouteDivergenceFinder
{
  v7 = objc_msgSend(a1, "_navigation_rootBoundingSection");
  int v8 = v7;
  if (v7)
  {
    uint64_t v12 = 0;
    double v13 = &v12;
    uint64_t v14 = 0x3032000000;
    double v15 = __Block_byref_object_copy__10;
    BOOL v16 = __Block_byref_object_dispose__10;
    id v17 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __97__GEOComposedRoute_MNRouteDivergenceFinder___navigation_leafBoundingSectionContainingCoordinate___block_invoke;
    v11[3] = &unk_1E60FADD8;
    v11[4] = &v12;
    *(double *)&v11[5] = a2;
    *(double *)&v11[6] = a3;
    *(double *)&v11[7] = a4;
    [v7 traverseWithHandler:v11];
    id v9 = (id)v13[5];
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)_navigation_leafBoundingSectionsIntersectingSection:()MNRouteDivergenceFinder
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "_navigation_rootBoundingSection");
  uint64_t v6 = [v5 leafSectionsIntersectingSection:v4 paddingMapPoints:0.0];

  return v6;
}

- (id)_navigation_leafBoundingSectionsIntersectingSection:()MNRouteDivergenceFinder paddingMapPoints:
{
  id v6 = a4;
  v7 = objc_msgSend(a1, "_navigation_rootBoundingSection");
  int v8 = [v7 leafSectionsIntersectingSection:v6 paddingMapPoints:a2];

  return v8;
}

- (id)_navigation_allLeafBoundingSections
{
  id v1 = objc_msgSend(a1, "_navigation_rootBoundingSection");
  if (v1)
  {
    v2 = [MEMORY[0x1E4F1CA48] array];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __80__GEOComposedRoute_MNRouteDivergenceFinder___navigation_allLeafBoundingSections__block_invoke;
    v7[3] = &unk_1E60FAE00;
    id v3 = v2;
    id v8 = v3;
    [v1 traverseWithHandler:v7];
    if ([v3 count]) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
    id v5 = v4;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

@end