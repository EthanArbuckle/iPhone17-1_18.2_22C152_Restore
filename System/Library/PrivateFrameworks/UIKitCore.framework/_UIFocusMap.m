@interface _UIFocusMap
- (BOOL)verifyFocusabilityForItem:(id)a3;
- (CGRect)minimumSearchArea;
- (UICoordinateSpace)coordinateSpace;
- (UIFocusSystem)focusSystem;
- (_UIFocusGroupMap)focusGroupMap;
- (_UIFocusMap)init;
- (_UIFocusMap)initWithFocusSystem:(id)a3 rootContainer:(id)a4 coordinateSpace:(id)a5 searchInfo:(id)a6 ignoresRootContainerClippingRect:(BOOL)a7;
- (_UIFocusMap)initWithFocusSystem:(id)a3 rootEnvironment:(id)a4;
- (_UIFocusMap)initWithFocusSystem:(id)a3 rootEnvironment:(id)a4 coordinateSpace:(id)a5 searchInfo:(id)a6 ignoresRootContainerClippingRect:(BOOL)a7;
- (_UIFocusMapSearchInfo)_defaultItemSearchContext;
- (_UIFocusMapSearchInfo)_focusMovementSearchContext;
- (_UIFocusRegionContainer)rootContainer;
- (_UIFocusSearchInfo)searchInfo;
- (id)_allDefaultFocusableRegionsInContainer:(id)a3 intersectingRegion:(id)a4;
- (id)_allFocusableItemsInEnvironment:(id)a3;
- (id)_closestFocusableItemToPoint:(CGPoint)a3 inRect:(CGRect)a4 excludingItems:(id)a5 distanceMeasuringUnitPoint:(CGPoint)a6;
- (id)_defaultMapSnapshotter;
- (id)_findAllDefaultFocusableRegionsWithSnapshotter:(id)a3;
- (id)_inferredDefaultFocusItemInEnvironment:(id)a3;
- (id)_linearlySortedFocusItemsForItems:(id)a3 groupFilter:(int64_t)a4 itemStandInMap:(id)a5;
- (id)_nextFocusedItemForFocusMovementRequest:(id)a3;
- (id)_nextFocusedItemForFocusMovementRequest:(id)a3 inRegions:(id)a4 withSnapshot:(id)a5;
- (id)_nextFocusedItemForFocusMovementRequest:(id)a3 startingFromRegion:(id)a4;
- (id)_nextFocusedItemForFocusMovementRequest:(id)a3 startingFromRegion:(id)a4 inRegions:(id)a5 withSnapshot:(id)a6;
- (id)_nextFocusedItemForLinearFocusMovementRequest:(id)a3 startingFromRegion:(id)a4 inRegions:(id)a5 withSnapshot:(id)a6;
- (id)_nextFocusedItemForNonLinearFocusMovementRequest:(id)a3 startingFromRegion:(id)a4 inRegions:(id)a5 withSnapshot:(id)a6;
- (id)_stopTrackingSearches;
- (void)_beginTrackingDefaultItemSearchInfoIfNecessary;
- (void)_beginTrackingFocusMovementSearchInfoIfNecessary;
- (void)_beginTrackingSearches;
- (void)_trackExternalSnapshot:(id)a3;
- (void)diagnoseFocusabilityForItem:(id)a3 report:(id)a4;
- (void)setMinimumSearchArea:(CGRect)a3;
@end

@implementation _UIFocusMap

- (_UIFocusMap)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"_UIFocusMap.m" lineNumber:97 description:@"-init is not a valid initializer for this class."];

  return 0;
}

- (_UIFocusMap)initWithFocusSystem:(id)a3 rootEnvironment:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"_UIFocusMap.m", 103, @"Invalid parameter not satisfying: %@", @"focusSystem" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"_UIFocusMap.m", 104, @"Invalid parameter not satisfying: %@", @"rootEnvironment" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  v10 = [(_UIFocusMap *)self initWithFocusSystem:v7 rootEnvironment:v9 coordinateSpace:0 searchInfo:0 ignoresRootContainerClippingRect:0];

  return v10;
}

- (_UIFocusMap)initWithFocusSystem:(id)a3 rootEnvironment:(id)a4 coordinateSpace:(id)a5 searchInfo:(id)a6 ignoresRootContainerClippingRect:(BOOL)a7
{
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [v12 focusItemContainer];
  if (!v14)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"_UIFocusMap.m" lineNumber:111 description:@"The environment does not provide an item container."];
  }
  _UIFocusRegionContainerFromEnvironmentAndContainer((uint64_t)v12, (uint64_t)v14);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = [(_UIFocusMap *)self initWithFocusSystem:v13 rootContainer:v15 coordinateSpace:v11 searchInfo:0 ignoresRootContainerClippingRect:0];

  if (v15 != v12 && v16) {
    objc_storeStrong((id *)&v16->_rootContainerProxy, v15);
  }

  return v16;
}

- (_UIFocusMap)initWithFocusSystem:(id)a3 rootContainer:(id)a4 coordinateSpace:(id)a5 searchInfo:(id)a6 ignoresRootContainerClippingRect:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"_UIFocusMap.m", 125, @"Invalid parameter not satisfying: %@", @"focusSystem" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"_UIFocusMap.m", 126, @"Invalid parameter not satisfying: %@", @"rootContainer" object file lineNumber description];

LABEL_3:
  v26.receiver = self;
  v26.super_class = (Class)_UIFocusMap;
  v17 = [(_UIFocusMap *)&v26 init];
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_focusSystem, v13);
    objc_storeWeak((id *)&v18->_rootContainer, v14);
    if (!v15)
    {
      id v15 = [v14 _preferredFocusRegionCoordinateSpace];
      if (!v15)
      {
        v25 = [MEMORY[0x1E4F28B00] currentHandler];
        [v25 handleFailureInMethod:a2, v18, @"_UIFocusMap.m", 134, @"Invalid parameter not satisfying: %@", @"coordinateSpace" object file lineNumber description];

        id v15 = 0;
      }
    }
    objc_storeWeak((id *)&v18->_coordinateSpace, v15);
    CGSize v19 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    v18->_minimumSearchArea.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    v18->_minimumSearchArea.size = v19;
    v18->_minimumSearchAreaIsEmpty = 1;
    if (v16)
    {
      v20 = (_UIFocusSearchInfo *)v16;
    }
    else
    {
      v20 = +[_UIFocusSearchInfo defaultInfo];
    }
    searchInfo = v18->_searchInfo;
    v18->_searchInfo = v20;

    v18->_ignoresRootContainerClippingRect = a7;
  }

  return v18;
}

- (void)setMinimumSearchArea:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectEqualToRect(self->_minimumSearchArea, a3))
  {
    self->_minimumSearchArea.origin.CGFloat x = x;
    self->_minimumSearchArea.origin.CGFloat y = y;
    self->_minimumSearchArea.size.CGFloat width = width;
    self->_minimumSearchArea.size.CGFloat height = height;
    v8.origin.CGFloat x = x;
    v8.origin.CGFloat y = y;
    v8.size.CGFloat width = width;
    v8.size.CGFloat height = height;
    self->_minimumSearchAreaIsEmptCGFloat y = CGRectIsEmpty(v8);
  }
}

- (id)_defaultMapSnapshotter
{
  v3 = [_UIFocusMapSnapshotter alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystem);
  id v5 = objc_loadWeakRetained((id *)&self->_rootContainer);
  id v6 = objc_loadWeakRetained((id *)&self->_coordinateSpace);
  id v7 = [(_UIFocusMap *)self searchInfo];
  CGRect v8 = [(_UIFocusMapSnapshotter *)v3 initWithFocusSystem:WeakRetained rootContainer:v5 coordinateSpace:v6 searchInfo:v7 ignoresRootContainerClippingRect:self->_ignoresRootContainerClippingRect];

  return v8;
}

- (id)_allFocusableItemsInEnvironment:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(_UIFocusMap *)self _defaultMapSnapshotter];
    [v5 setFocusedRegion:0];
    CGSize v19 = v5;
    id v6 = [v5 captureSnapshot];
    id v7 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v18 = v6;
    CGRect v8 = [v6 regions];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = [*(id *)(*((void *)&v20 + 1) + 8 * i) _defaultFocusItem];
          if (v13)
          {
            id v14 = [(_UIFocusMap *)self searchInfo];
            int v15 = [v14 shouldIncludeFocusItem:v13];

            if (v15)
            {
              if (([v7 containsObject:v13] & 1) == 0
                && _UIFocusEnvironmentIsAncestorOfEnvironment(v4, v13))
              {
                [v7 addObject:v13];
              }
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v10);
    }

    id v16 = [v7 allObjects];
  }
  else
  {
    id v16 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v16;
}

- (id)_inferredDefaultFocusItemInEnvironment:(id)a3
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(_UIFocusMap *)self _beginTrackingDefaultItemSearchInfoIfNecessary];
  v69 = v4;
  if (v4)
  {
    v70 = self;
    v64 = [(_UIFocusMap *)self _defaultMapSnapshotter];
    [v64 setFocusedRegion:0];
    id v5 = [v64 captureSnapshot];
    id v6 = [(_UIFocusMap *)self _defaultItemSearchContext];
    [v6 addSnapshot:v5];

    v68 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    v66 = objc_opt_new();
    v67 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    id v65 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    id v7 = [v5 regions];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v83 objects:v88 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v84;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v84 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v83 + 1) + 8 * v10);
        id v12 = [v11 _defaultFocusItem];
        if (v12)
        {
          id v13 = [(_UIFocusMap *)v70 searchInfo];
          int v14 = [v13 shouldIncludeFocusItem:v12];

          if (v14)
          {
            if (v12 == v69)
            {
              id v36 = v11;

              v17 = v69;
              if (v36) {
                goto LABEL_44;
              }
              goto LABEL_43;
            }
            if (([v68 containsObject:v12] & 1) == 0)
            {
              id v15 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
              uint64_t v79 = 0;
              v80 = &v79;
              uint64_t v81 = 0x2020000000;
              char v82 = 0;
              v75[0] = MEMORY[0x1E4F143A8];
              v75[1] = 3221225472;
              v75[2] = __54___UIFocusMap__inferredDefaultFocusItemInEnvironment___block_invoke;
              v75[3] = &unk_1E52EE410;
              id v16 = v15;
              id v76 = v16;
              id v77 = v69;
              v78 = &v79;
              _UIFocusEnvironmentEnumerateAncestorEnvironments(v12, v75);
              if (*((unsigned char *)v80 + 24))
              {
                [v68 addObject:v12];
                [v66 addObject:v11];
                [v67 setObject:v11 forKey:v12];
                [v65 unionSet:v16];
              }

              _Block_object_dispose(&v79, 8);
            }
          }
        }

        if (v8 == ++v10)
        {
          uint64_t v8 = [v7 countByEnumeratingWithState:&v83 objects:v88 count:16];
          if (v8) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    if ([v68 count] != 1
      || ([v68 anyObject], (v17 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      if ((unint64_t)[v68 count] < 2)
      {
        v17 = 0;
      }
      else
      {
        location = (id *)&v70->_focusSystem;
        id WeakRetained = objc_loadWeakRetained((id *)&v70->_focusSystem);
        int v19 = [WeakRetained _shouldReverseLayoutDirectionForEnvironment:v69];

        long long v20 = [v5 mapArea];
        [v20 frame];
        CGFloat v22 = v21;
        CGFloat v24 = v23;
        CGFloat v26 = v25;
        CGFloat v28 = v27;

        CGFloat v29 = v22;
        CGFloat v30 = v24;
        CGFloat v31 = v26;
        CGFloat v32 = v28;
        if (v19)
        {
          double MaxX = CGRectGetMaxX(*(CGRect *)&v29);
          uint64_t v34 = 6;
        }
        else
        {
          double MaxX = CGRectGetMinX(*(CGRect *)&v29) + -1.0;
          uint64_t v34 = 10;
        }
        v91.origin.CGFloat x = v22;
        v91.origin.CGFloat y = v24;
        v91.size.CGFloat width = v26;
        v91.size.CGFloat height = v28;
        double MinY = CGRectGetMinY(v91);
        v38 = +[_UIFocusMovementInfo _movementWithHeading:v34 isInitial:1];
        id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v73 = 0u;
        long long v74 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        id v40 = v66;
        uint64_t v41 = [v40 countByEnumeratingWithState:&v71 objects:v87 count:16];
        if (v41)
        {
          double v42 = MinY + -1.0;
          uint64_t v43 = *(void *)v72;
          double v44 = 1.79769313e308;
          do
          {
            for (uint64_t i = 0; i != v41; ++i)
            {
              if (*(void *)v72 != v43) {
                objc_enumerationMutation(v40);
              }
              v46 = *(void **)(*((void *)&v71 + 1) + 8 * i);
              v47 = objc_msgSend(v46, "_defaultFocusItem", location);
              if (v47)
              {
                double v48 = _UIFocusMapDistanceToRegionBoundary((uint64_t)v46, objc_msgSend(v46, "_effectiveFocusableBoundariesForHeading:", objc_msgSend(v38, "heading")), v38, objc_msgSend(v46, "_preferredDistanceComparisonType"), 1, v5, MaxX, v42, 1.0, 1.0);
                double v49 = v48;
                if (v48 <= v44)
                {
                  if (v48 < v44) {
                    [v39 removeAllObjects];
                  }
                  [v39 addObject:v47];
                  double v44 = v49;
                }
              }
            }
            uint64_t v41 = [v40 countByEnumeratingWithState:&v71 objects:v87 count:16];
          }
          while (v41);
        }

        v17 = [v39 firstObject];
        id v50 = objc_loadWeakRetained(location);
        v51 = [v50 behavior];
        unsigned int v52 = [v51 focusGroupMovementBehavior];

        if (((v17 != 0) & (v52 >> 4)) != 0)
        {
          v53 = [_UIFocusGroupMap alloc];
          v54 = [(_UIFocusMap *)v70 coordinateSpace];
          uint64_t v55 = [(_UIFocusGroupMap *)v53 initWithItems:v68 coordinateSpace:v54];
          focusGroupMap = v70->_focusGroupMap;
          v70->_focusGroupMap = (_UIFocusGroupMap *)v55;

          v57 = [(_UIFocusGroupMap *)v70->_focusGroupMap focusGroupForItem:v17];
          v58 = [v57 primaryItem];
          v59 = v58;
          if (v58)
          {
            id v60 = v58;

            v17 = v60;
          }
        }
      }
    }
LABEL_43:
    objc_msgSend(v67, "objectForKey:", v17, location);
    id v36 = (id)objc_claimAutoreleasedReturnValue();
LABEL_44:
    v61 = [(_UIFocusMap *)v70 _defaultItemSearchContext];
    [v61 addDestinationRegion:v36];

    id v35 = v17;
  }
  else
  {
    id v35 = 0;
  }

  return v35;
}

- (id)_nextFocusedItemForFocusMovementRequest:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    unsigned int v52 = [MEMORY[0x1E4F28B00] currentHandler];
    [v52 handleFailureInMethod:a2, self, @"_UIFocusMap.m", 332, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];
  }
  id v6 = [v5 focusSystem];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystem);

  if (v6 != WeakRetained)
  {
    v53 = [MEMORY[0x1E4F28B00] currentHandler];
    [v53 handleFailureInMethod:a2 object:self file:@"_UIFocusMap.m" lineNumber:333 description:@"Submitted a focus movement request to a focus map with a mismatched focus system."];
  }
  [(_UIFocusMap *)self _beginTrackingFocusMovementSearchInfoIfNecessary];
  uint64_t v8 = [v5 movementInfo];
  unint64_t v9 = [v8 heading];

  if (!v9)
  {
    id v13 = 0;
    goto LABEL_18;
  }
  uint64_t v10 = [v5 focusedItemInfo];
  uint64_t v11 = [v10 item];

  if (v11)
  {
    id v12 = [v10 focusedRegion];
    id v13 = [(_UIFocusMap *)self _nextFocusedItemForFocusMovementRequest:v5 startingFromRegion:v12];
  }
  else
  {
    int v14 = [v5 movementInfo];
    [v14 _fallbackMovementOriginatingFrame];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;

    v55.origin.CGFloat x = v16;
    v55.origin.CGFloat y = v18;
    v55.size.CGFloat width = v20;
    v55.size.CGFloat height = v22;
    if (!CGRectIsNull(v55))
    {
      v56.origin.CGFloat x = v16;
      v56.origin.CGFloat y = v18;
      v56.size.CGFloat width = v20;
      v56.size.CGFloat height = v22;
      if (!CGRectIsEmpty(v56))
      {
        double v23 = [_UIFocusRegion alloc];
        CGFloat v24 = [(_UIFocusMap *)self coordinateSpace];
        double v25 = -[_UIFocusRegion initWithFrame:coordinateSpace:](v23, "initWithFrame:coordinateSpace:", v24, v16, v18, v20, v22);

        id v13 = [(_UIFocusMap *)self _nextFocusedItemForFocusMovementRequest:v5 startingFromRegion:v25];

        if (v13) {
          goto LABEL_17;
        }
      }
    }
    if (self->_minimumSearchAreaIsEmpty)
    {
      CGFloat v26 = [(_UIFocusMap *)self coordinateSpace];
      [v26 bounds];
      double v28 = v27;
      double v30 = v29;
      double v32 = v31;
      double v34 = v33;
    }
    else
    {
      [(_UIFocusMap *)self minimumSearchArea];
      double v28 = v35;
      double v30 = v36;
      double v32 = v37;
      double v34 = v38;
    }
    id v12 = [(_UIFocusMap *)self _defaultMapSnapshotter];
    id v39 = [v10 focusedRegion];
    [v12 setFocusedRegion:v39];

    objc_msgSend(v12, "setSnapshotFrame:", v28, v30, v32, v34);
    id v40 = [v5 movementInfo];
    objc_msgSend(v12, "setClipToSnapshotRect:", objc_msgSend(v40, "_isLinearMovement") ^ 1);

    uint64_t v41 = [v5 movementInfo];
    [v12 setMovementInfo:v41];

    double v42 = [v12 captureSnapshot];
    uint64_t v43 = [(_UIFocusMap *)self _focusMovementSearchContext];
    [v43 addSnapshot:v42];

    double v44 = _UIRectDeparturePointAlongFocusHeading((v9 >> 1) & 0x14 | (2 * v9) & 0x28 | (__rbit32(v9) >> 30), v28, v30, v32, v34);
    double v46 = v45;
    v47 = [_UIFocusRegion alloc];
    double v48 = [(_UIFocusMap *)self coordinateSpace];
    double v49 = -[_UIFocusRegion initWithFrame:coordinateSpace:](v47, "initWithFrame:coordinateSpace:", v48, v44, v46, 1.0, 1.0);

    id v50 = [v42 regions];
    id v13 = [(_UIFocusMap *)self _nextFocusedItemForFocusMovementRequest:v5 startingFromRegion:v49 inRegions:v50 withSnapshot:v42];
  }
LABEL_17:

LABEL_18:
  return v13;
}

- (id)_nextFocusedItemForFocusMovementRequest:(id)a3 startingFromRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(_UIFocusMap *)self _beginTrackingFocusMovementSearchInfoIfNecessary];
  uint64_t v8 = [v6 movementInfo];
  uint64_t v9 = [v8 heading];

  uint64_t v10 = [(_UIFocusMap *)self coordinateSpace];
  +[_UIFocusRegionEvaluator frameForRegion:v7 inCoordinateSpace:v10];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;

  if (!v9) {
    goto LABEL_48;
  }
  v87.origin.double x = v12;
  v87.origin.double y = v14;
  v87.size.double width = v16;
  v87.size.double height = v18;
  if (CGRectIsEmpty(v87)) {
    goto LABEL_48;
  }
  if (self->_minimumSearchAreaIsEmpty)
  {
    double v19 = [(_UIFocusMap *)self coordinateSpace];
    [v19 bounds];
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;
  }
  else
  {
    [(_UIFocusMap *)self minimumSearchArea];
    CGFloat v21 = v28;
    CGFloat v23 = v29;
    CGFloat v25 = v30;
    CGFloat v27 = v31;
  }
  v88.origin.double x = v21;
  v88.origin.double y = v23;
  v88.size.double width = v25;
  CGFloat v79 = v27;
  v88.size.double height = v27;
  CGFloat v32 = v25;
  CGFloat v78 = v25;
  double v33 = CGRectGetMinY(v88) + -1.0;
  v89.origin.double x = v12;
  v89.origin.double y = v14;
  v89.size.double width = v16;
  v89.size.double height = v18;
  double MinY = CGRectGetMinY(v89);
  CGFloat rect = v21;
  v90.origin.double x = v12;
  v90.origin.double y = v14;
  v90.size.double width = v16;
  v90.size.double height = v18;
  double v34 = MinY - CGRectGetHeight(v90);
  if (v33 < v34) {
    double v34 = v33;
  }
  double v83 = v34;
  v91.origin.double x = v21;
  v91.origin.double y = v23;
  CGFloat v35 = v23;
  CGFloat v80 = v23;
  v91.size.double width = v32;
  v91.size.double height = v79;
  double v36 = CGRectGetMinX(v91) + -1.0;
  v92.origin.double x = v12;
  v92.origin.double y = v14;
  v92.size.double width = v16;
  v92.size.double height = v18;
  double MinX = CGRectGetMinX(v92);
  v93.origin.double x = v12;
  v93.origin.double y = v14;
  v93.size.double width = v16;
  v93.size.double height = v18;
  double v38 = MinX - CGRectGetWidth(v93);
  if (v36 < v38) {
    double v38 = v36;
  }
  double v81 = v38;
  v94.origin.double x = rect;
  v94.origin.double y = v35;
  v94.size.double width = v78;
  v94.size.double height = v79;
  double v39 = CGRectGetMaxY(v94) + 1.0;
  v95.origin.double x = v12;
  v95.origin.double y = v14;
  v95.size.double width = v16;
  v95.size.double height = v18;
  double MaxY = CGRectGetMaxY(v95);
  v96.origin.double x = v12;
  v96.origin.double y = v14;
  v96.size.double width = v16;
  v96.size.double height = v18;
  double v41 = MaxY + CGRectGetHeight(v96);
  CGFloat v42 = v79;
  if (v39 >= v41) {
    double v43 = v39;
  }
  else {
    double v43 = v41;
  }
  CGFloat v44 = rect;
  CGFloat v45 = v80;
  CGFloat v46 = v78;
  double v47 = CGRectGetMaxX(*(CGRect *)(&v42 - 3)) + 1.0;
  v97.origin.double x = v12;
  v97.origin.double y = v14;
  v97.size.double width = v16;
  v97.size.double height = v18;
  double MaxX = CGRectGetMaxX(v97);
  v98.origin.double x = v12;
  v98.origin.double y = v14;
  v98.size.double width = v16;
  v98.size.double height = v18;
  double v49 = MaxX + CGRectGetWidth(v98);
  if (v47 >= v49) {
    double v50 = v47;
  }
  else {
    double v50 = v49;
  }
  if ((v9 & 4) != 0) {
    double v51 = v81;
  }
  else {
    double v51 = v50;
  }
  double recta = v43;
  if (v9) {
    double v52 = v83;
  }
  else {
    double v52 = v43;
  }
  if ((v9 & 0xC) == 0)
  {
    v99.origin.double x = v12;
    v99.origin.double y = v14;
    v99.size.double width = v16;
    v99.size.double height = v18;
    double v51 = CGRectGetMaxX(v99);
  }
  if ((v9 & 3) == 0)
  {
    v100.origin.double x = v12;
    v100.origin.double y = v14;
    v100.size.double width = v16;
    v100.size.double height = v18;
    double v52 = CGRectGetMaxY(v100);
  }
  if ((v9 & 0xC) == 0 || (v9 & 4) != 0)
  {
    double v53 = v51;
    v102.origin.double x = v12;
    v102.origin.double y = v14;
    v102.size.double width = v16;
    v102.size.double height = v18;
    double v54 = CGRectGetMinX(v102);
  }
  else
  {
    double v53 = v51;
    v101.origin.double x = v12;
    v101.origin.double y = v14;
    v101.size.double width = v16;
    v101.size.double height = v18;
    double v54 = CGRectGetMaxX(v101);
  }
  double v55 = v54;
  if (v9 & 3) == 0 || (v9)
  {
    v104.origin.double x = v12;
    v104.origin.double y = v14;
    v104.size.double width = v16;
    v104.size.double height = v18;
    double v56 = CGRectGetMinY(v104);
  }
  else
  {
    v103.origin.double x = v12;
    v103.origin.double y = v14;
    v103.size.double width = v16;
    v103.size.double height = v18;
    double v56 = CGRectGetMaxY(v103);
  }
  double v57 = v56;
  v58 = objc_msgSend(v6, "movementInfo", *(void *)&v78);
  int v59 = [v58 _isLinearMovement];

  double v60 = v59 ? v50 : v53;
  double v61 = v59 ? recta : v52;
  double v62 = v59 ? v81 : v55;
  double v63 = v59 ? v83 : v57;
  double v64 = v60 - v62;
  double v65 = v61 - v63;
  CGRect v105 = CGRectStandardize(*(CGRect *)&v62);
  double x = v105.origin.x;
  double y = v105.origin.y;
  double width = v105.size.width;
  double height = v105.size.height;
  if (fabs(CGRectGetWidth(v105)) < 0.0001) {
    goto LABEL_48;
  }
  v106.origin.double x = x;
  v106.origin.double y = y;
  v106.size.double width = width;
  v106.size.double height = height;
  if (fabs(CGRectGetWidth(v106)) >= 0.0001)
  {
    long long v72 = [(_UIFocusMap *)self _defaultMapSnapshotter];
    [v72 setFocusedRegion:v7];
    objc_msgSend(v72, "setSnapshotFrame:", x, y, width, height);
    long long v73 = [v6 movementInfo];
    objc_msgSend(v72, "setClipToSnapshotRect:", objc_msgSend(v73, "_isLinearMovement") ^ 1);

    long long v74 = [v6 movementInfo];
    [v72 setMovementInfo:v74];

    v75 = [v72 captureSnapshot];
    id v76 = [(_UIFocusMap *)self _focusMovementSearchContext];
    [v76 addSnapshot:v75];

    id v77 = [v75 regions];
    v70 = [(_UIFocusMap *)self _nextFocusedItemForFocusMovementRequest:v6 startingFromRegion:v7 inRegions:v77 withSnapshot:v75];
  }
  else
  {
LABEL_48:
    v70 = 0;
  }

  return v70;
}

- (id)_nextFocusedItemForFocusMovementRequest:(id)a3 inRegions:(id)a4 withSnapshot:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  double v11 = [v10 focusedItemInfo];
  CGFloat v12 = [v11 focusedRegion];

  double v13 = [(_UIFocusMap *)self _nextFocusedItemForFocusMovementRequest:v10 startingFromRegion:v12 inRegions:v9 withSnapshot:v8];

  return v13;
}

- (id)_nextFocusedItemForFocusMovementRequest:(id)a3 startingFromRegion:(id)a4 inRegions:(id)a5 withSnapshot:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  CGFloat v14 = [v13 movementInfo];
  int v15 = [v14 _isLinearMovement];

  if (v15) {
    [(_UIFocusMap *)self _nextFocusedItemForLinearFocusMovementRequest:v13 startingFromRegion:v12 inRegions:v11 withSnapshot:v10];
  }
  else {
  CGFloat v16 = [(_UIFocusMap *)self _nextFocusedItemForNonLinearFocusMovementRequest:v13 startingFromRegion:v12 inRegions:v11 withSnapshot:v10];
  }

  return v16;
}

- (id)_nextFocusedItemForNonLinearFocusMovementRequest:(id)a3 startingFromRegion:(id)a4 inRegions:(id)a5 withSnapshot:(id)a6
{
  uint64_t v212 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v152 = a5;
  id v12 = a6;
  [(_UIFocusMap *)self _beginTrackingFocusMovementSearchInfoIfNecessary];
  v158 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystem);
  v162 = v10;
  id v13 = [v10 movementInfo];
  uint64_t v190 = [v13 heading];
  v170 = v13;
  uint64_t v14 = [v13 _groupFilter];
  int v15 = (CGFloat *)MEMORY[0x1E4F1DB20];
  v151 = v11;
  if (v11)
  {
    [v12 snapshotFrameForRegion:v11];
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v24 = *v15;
    CGFloat v25 = v15[1];
    CGFloat v26 = v15[2];
    CGFloat v27 = v15[3];
  }
  else
  {
    CGFloat v24 = *MEMORY[0x1E4F1DB20];
    CGFloat v25 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat v26 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat v27 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    CGFloat v23 = v27;
    CGFloat v21 = v26;
    CGFloat v19 = v25;
    CGFloat v17 = *MEMORY[0x1E4F1DB20];
  }
  double v28 = [v10 focusedItemInfo];
  double v29 = [v28 item];

  CGFloat v186 = v25;
  CGFloat v188 = v24;
  CGFloat v182 = v27;
  CGFloat v184 = v26;
  if (v29 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    double v30 = [v12 coordinateSpace];
    double v31 = v29;
    [v29 _focusCastingFrameForHeading:v190 inCoordinateSpace:v30];
    CGFloat v24 = v32;
    CGFloat v25 = v33;
    CGFloat v26 = v34;
    CGFloat v27 = v35;
  }
  else
  {
    double v31 = v29;
    double v36 = [WeakRetained _focusCastingController];

    if (!v36) {
      goto LABEL_10;
    }
    double v30 = [WeakRetained _focusCastingController];
    double v37 = [v12 coordinateSpace];
    [v30 castingFrameForFocusedItem:v31 heading:v190 inCoordinateSpace:v37];
    CGFloat v24 = v38;
    CGFloat v25 = v39;
    CGFloat v26 = v40;
    CGFloat v27 = v41;
  }
LABEL_10:
  if (v31 && v14 == 1)
  {
    CGFloat v42 = [_UIDynamicFocusGroupMap alloc];
    double v43 = [(_UIFocusMap *)self coordinateSpace];
    CGFloat v44 = [(_UIDynamicFocusGroupMap *)v42 initWithCoordinateSpace:v43];

    v153 = v44;
    CGFloat v45 = [(_UIDynamicFocusGroupMap *)v44 focusGroupIdentifierForItem:v31];
  }
  else
  {
    if (v14 == 2) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Primary item focus group filtering is not available for non linear focus movement."];
    }
    CGFloat v45 = 0;
    v153 = 0;
  }
  CGFloat v46 = v170;
  v214.origin.double x = v24;
  v214.origin.double y = v25;
  v214.size.double width = v26;
  v214.size.double height = v27;
  v219.origin.double y = v186;
  v219.origin.double x = v188;
  v219.size.double height = v182;
  v219.size.double width = v184;
  if (!CGRectEqualToRect(v214, v219))
  {
    CGFloat v23 = v27;
    CGFloat v21 = v26;
    CGFloat v19 = v25;
    CGFloat v17 = v24;
  }
  v189 = v12;
  if (!v190
    || ![v152 count]
    || (v215.origin.x = v17, v215.origin.y = v19, v215.size.width = v21, v215.size.double height = v23, CGRectIsEmpty(v215)))
  {
    id v47 = 0;
    goto LABEL_22;
  }
  v155 = v45;
  v150 = v31;
  double v49 = [v162 focusedItemInfo];
  uint64_t v50 = [v49 inheritedFocusMovementStyle];

  id v169 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v187 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
  long long v200 = 0u;
  long long v201 = 0u;
  long long v202 = 0u;
  long long v203 = 0u;
  obuint64_t j = v152;
  uint64_t v160 = [obj countByEnumeratingWithState:&v200 objects:v210 count:16];
  if (!v160)
  {
    char v154 = 0;
    double v173 = 1.79769313e308;
    goto LABEL_133;
  }
  char v154 = 0;
  uint64_t v159 = *(void *)v201;
  uint64_t v51 = -1;
  float v52 = 1.1755e-38;
  double v53 = 1.79769313e308;
  double v171 = 1.79769313e308;
  double v173 = 1.79769313e308;
  double v167 = v23;
  double v165 = v19;
  double v166 = v21;
  double v164 = v17;
  uint64_t v168 = v50;
  do
  {
    uint64_t v54 = 0;
    do
    {
      if (*(void *)v201 != v159) {
        objc_enumerationMutation(obj);
      }
      double v55 = *(void **)(*((void *)&v200 + 1) + 8 * v54);
      uint64_t v183 = [v55 _effectiveFocusableBoundariesForHeading:v190];
      uint64_t v181 = [v55 _effectiveBoundariesBlockingFocusMovementRequest:v162];
      uint64_t v178 = [v55 _preferredDistanceComparisonType];
      [v55 _focusPriority];
      float v174 = v56;
      long long v196 = 0u;
      long long v197 = 0u;
      long long v198 = 0u;
      long long v199 = 0u;
      uint64_t v185 = [&unk_1ED3EFAB8 countByEnumeratingWithState:&v196 objects:v209 count:16];
      if (!v185) {
        goto LABEL_127;
      }
      uint64_t v161 = v54;
      uint64_t v163 = v51;
      char v176 = 0;
      uint64_t v180 = *(void *)v197;
      v172 = v55;
LABEL_32:
      uint64_t v57 = 0;
      while (1)
      {
        if (*(void *)v197 != v180) {
          objc_enumerationMutation(&unk_1ED3EFAB8);
        }
        v58 = *(void **)(*((void *)&v196 + 1) + 8 * v57);
        uint64_t v59 = [v58 unsignedIntegerValue];
        uint64_t v60 = v59 & v183;
        uint64_t v61 = v59 & v181;
        if (!(v59 & v183 | v59 & v181)) {
          goto LABEL_96;
        }
        unsigned int v62 = v59;
        double v63 = _UIFocusMapDistanceToRegionBoundary((uint64_t)v55, v59, v46, 1, v50, v12, v17, v19, v21, v23);
        double v179 = v63;
        if (!v178) {
          double v63 = _UIFocusMapDistanceToRegionBoundary((uint64_t)v55, v62, v46, 0, v50, v12, v17, v19, v21, v23);
        }
        int v64 = [v55 _ignoresSpeedBumpEdges];
        if (v63 < 0.0) {
          goto LABEL_96;
        }
        if (v63 < v171) {
          int v65 = 1;
        }
        else {
          int v65 = v64;
        }
        if (v65 != 1) {
          goto LABEL_126;
        }
        [v12 snapshotFrameForRegion:v55];
        BOOL v177 = _UIRectIntersectsRectAlongFocusHeading(v190, v66, v67, v68, v69, v17, v19, v21, v23);
        long long v192 = 0u;
        long long v193 = 0u;
        long long v194 = 0u;
        long long v195 = 0u;
        id v70 = v169;
        uint64_t v71 = [v70 countByEnumeratingWithState:&v192 objects:v208 count:16];
        if (v71)
        {
          uint64_t v72 = *(void *)v193;
          while (2)
          {
            for (uint64_t i = 0; i != v71; ++i)
            {
              if (*(void *)v193 != v72) {
                objc_enumerationMutation(v70);
              }
              long long v74 = [v187 objectForKey:*(void *)(*((void *)&v192 + 1) + 8 * i)];
              [v189 snapshotFrameForRegion:v74];
              BOOL v79 = _UIRectIntersectsRectAlongFocusHeading(v190, v75, v76, v77, v78, v17, v19, v21, v23);

              if (v79)
              {
                LODWORD(v71) = 1;
                goto LABEL_53;
              }
            }
            uint64_t v71 = [v70 countByEnumeratingWithState:&v192 objects:v208 count:16];
            if (v71) {
              continue;
            }
            break;
          }
LABEL_53:
          id v12 = v189;
        }
        double v80 = v63;
        double v81 = vabdd_f64(v173, v63);
        double v82 = vabdd_f64(v53, v179);
        double v83 = vabds_f32(v52, v174);
        BOOL v84 = v81 >= 0.0001 || v80 < v173;
        double v175 = v80;
        int v85 = v80 < v173 || !v84;

        if (v84 || v177)
        {
          double v86 = v53;
          float v87 = v52;
        }
        else
        {
          double v86 = v53;
          BOOL v88 = v179 < v53;
          if (v82 < 0.0001) {
            BOOL v88 = 1;
          }
          float v87 = v52;
          if (v174 > v52) {
            BOOL v88 = 1;
          }
          int v85 = v83 < 0.0001 || v88;
        }
        CGFloat v19 = v165;
        if (v176)
        {
          char v89 = 1;
LABEL_93:
          CGFloat v46 = v170;
          CGFloat v23 = v167;
          float v52 = v87;
          double v53 = v86;
          CGFloat v21 = v166;
          double v93 = v175;
          CGFloat v17 = v164;
          goto LABEL_94;
        }
        if (!v60 || !v85)
        {
          char v89 = 0;
          goto LABEL_93;
        }
        uint64_t v90 = v82 < 0.0001;
        double v53 = v86;
        if (v179 < v86) {
          uint64_t v90 = 2;
        }
        int v91 = v174 > v87 || v84;
        if (v81 >= 0.0001) {
          uint64_t v92 = 1;
        }
        else {
          uint64_t v92 = 2;
        }
        double v93 = v175;
        if (v175 < v173) {
          uint64_t v92 = 2;
        }
        if (v91) {
          uint64_t v94 = v92;
        }
        else {
          uint64_t v94 = 0;
        }
        if (v91)
        {
          CGFloat v46 = v170;
          float v52 = v87;
          CGFloat v21 = v166;
          CGFloat v23 = v167;
          CGFloat v17 = v164;
          goto LABEL_102;
        }
        BOOL v95 = v83 < 0.0001;
        CGFloat v46 = v170;
        float v52 = v87;
        CGFloat v21 = v166;
        CGFloat v23 = v167;
        CGFloat v17 = v164;
        if (v95)
        {
          uint64_t v94 = v90;
          if (v71)
          {
            if (v177) {
              goto LABEL_102;
            }
            uint64_t v94 = 0;
          }
          else
          {
            if (!v177) {
              goto LABEL_102;
            }
            uint64_t v94 = 2;
          }
          uint64_t v96 = [&unk_1ED3EFAB8 indexOfObject:v58];
LABEL_105:
          if (!v94) {
            goto LABEL_117;
          }
          goto LABEL_106;
        }
LABEL_102:
        uint64_t v97 = [&unk_1ED3EFAB8 indexOfObject:v58];
        uint64_t v96 = v97;
        if (v94 != 1) {
          goto LABEL_105;
        }
        if (v97 <= v163)
        {
          if (v97 != v163)
          {
LABEL_117:
            char v89 = 0;
            goto LABEL_94;
          }
          uint64_t v94 = 1;
          uint64_t v96 = v163;
        }
        else
        {
          uint64_t v94 = 2;
        }
LABEL_106:
        CGRect v98 = [v12 _cachedNextFocusedItemForRegion:v172 withFocusMovementRequest:v162 inMap:v158];
        if (v98
          && ([(_UIFocusMap *)v158 searchInfo],
              CGRect v99 = objc_claimAutoreleasedReturnValue(),
              int IsFocusableInFocusSystemWithSearchInfo = _UIFocusItemIsFocusableInFocusSystemWithSearchInfo(v98, WeakRetained, v99), v99, IsFocusableInFocusSystemWithSearchInfo))
        {
          if (v155)
          {
            CGRect v101 = [(_UIDynamicFocusGroupMap *)v153 focusGroupIdentifierForItem:v98];
            int v102 = [v155 isEqual:v101];

            if (!v102)
            {

LABEL_125:
              uint64_t v50 = v168;
LABEL_126:
              uint64_t v51 = v163;
              uint64_t v54 = v161;
              goto LABEL_127;
            }
          }
          if (v94 == 2)
          {
            [v70 removeAllObjects];
            [v187 removeAllObjects];
          }
          [v70 addObject:v98];
          [v187 setObject:v172 forKey:v98];
          char v89 = 1;
          float v52 = v174;
          double v173 = v175;
          double v53 = v179;
        }
        else
        {
          char v89 = 0;
          uint64_t v96 = v163;
        }

        uint64_t v163 = v96;
LABEL_94:
        if (v61) {
          break;
        }
        char v176 = v89;
        uint64_t v50 = v168;
        double v55 = v172;
LABEL_96:
        if (++v57 == v185)
        {
          uint64_t v103 = [&unk_1ED3EFAB8 countByEnumeratingWithState:&v196 objects:v209 count:16];
          uint64_t v185 = v103;
          if (!v103) {
            goto LABEL_126;
          }
          goto LABEL_32;
        }
      }
      if (![v70 count])
      {
        char v154 = 1;
        double v171 = v93;
        goto LABEL_125;
      }
      uint64_t v51 = v163;
      uint64_t v54 = v161;
      if (v173 >= v93)
      {
        objc_msgSend(v70, "removeAllObjects", v173);
        [v187 removeAllObjects];
      }
      char v154 = 1;
      double v171 = v93;
      uint64_t v50 = v168;
LABEL_127:
      ++v54;
    }
    while (v54 != v160);
    uint64_t v104 = [obj countByEnumeratingWithState:&v200 objects:v210 count:16];
    uint64_t v160 = v104;
  }
  while (v104);
LABEL_133:

  if ((unint64_t)[v169 count] < 2)
  {
    [v169 lastObject];
    v107 = v169;
    id v47 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CGRect v105 = [v162 focusedItemInfo];
    CGRect v106 = [v105 focusedRegion];
    if (v106 != v151) {
      goto LABEL_139;
    }
    id v47 = [v105 item];
    if (!v47 || fabs(v173) >= 0.0001 || ([v169 containsObject:v47] & 1) == 0)
    {

LABEL_139:
      id v47 = [WeakRetained _previousFocusedItem];
      if (([v169 containsObject:v47] & 1) == 0)
      {

        goto LABEL_144;
      }
      if (!v47)
      {
LABEL_144:
        v108 = [v162 movementInfo];
        char v109 = [v108 heading];

        id v110 = objc_loadWeakRetained((id *)&v158->_coordinateSpace);
        id v111 = v169;
        id v112 = v110;
        v113 = v112;
        if ((v109 & 3) != 0)
        {
          v114 = +[UIWindow _applicationKeyWindow];
          UIUserInterfaceLayoutDirection v115 = +[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", [v114 semanticContentAttribute]);

          v191 = v113;
          if (v115)
          {
            id v116 = v111;
            id v117 = v113;
            long long v204 = 0u;
            long long v205 = 0u;
            long long v206 = 0u;
            long long v207 = 0u;
            uint64_t v118 = [v116 countByEnumeratingWithState:&v204 objects:v211 count:16];
            if (v118)
            {
              uint64_t v119 = v118;
              v120 = 0;
              uint64_t v121 = *(void *)v205;
              double v122 = 2.22507386e-308;
              do
              {
                for (uint64_t j = 0; j != v119; ++j)
                {
                  if (*(void *)v205 != v121) {
                    objc_enumerationMutation(v116);
                  }
                  v124 = *(void **)(*((void *)&v204 + 1) + 8 * j);
                  v216.origin.double x = _UIFocusItemFrameInCoordinateSpace(v124, v117);
                  double MaxX = CGRectGetMaxX(v216);
                  if (MaxX >= v122)
                  {
                    double v126 = MaxX;
                    id v127 = v124;

                    v120 = v127;
                    double v122 = v126;
                  }
                }
                uint64_t v119 = [v116 countByEnumeratingWithState:&v204 objects:v211 count:16];
              }
              while (v119);
              goto LABEL_178;
            }
LABEL_177:
            v120 = 0;
            goto LABEL_178;
          }
          id v116 = v111;
          id v117 = v113;
          long long v204 = 0u;
          long long v205 = 0u;
          long long v206 = 0u;
          long long v207 = 0u;
          uint64_t v138 = [v116 countByEnumeratingWithState:&v204 objects:v211 count:16];
          if (!v138) {
            goto LABEL_177;
          }
          uint64_t v139 = v138;
          v120 = 0;
          uint64_t v140 = *(void *)v205;
          double v141 = 1.79769313e308;
          do
          {
            for (uint64_t k = 0; k != v139; ++k)
            {
              if (*(void *)v205 != v140) {
                objc_enumerationMutation(v116);
              }
              v143 = *(void **)(*((void *)&v204 + 1) + 8 * k);
              v218.origin.double x = _UIFocusItemFrameInCoordinateSpace(v143, v117);
              double MinX = CGRectGetMinX(v218);
              if (MinX <= v141)
              {
                double v145 = MinX;
                id v146 = v143;

                v120 = v146;
                double v141 = v145;
              }
            }
            uint64_t v139 = [v116 countByEnumeratingWithState:&v204 objects:v211 count:16];
          }
          while (v139);
LABEL_178:

          id v47 = v120;
          CGFloat v46 = v170;
          v113 = v191;
        }
        else if ((v109 & 0xC) != 0)
        {
          id v128 = v112;
          long long v204 = 0u;
          long long v205 = 0u;
          long long v206 = 0u;
          long long v207 = 0u;
          uint64_t v129 = [v111 countByEnumeratingWithState:&v204 objects:v211 count:16];
          if (v129)
          {
            uint64_t v130 = v129;
            id v47 = 0;
            uint64_t v131 = *(void *)v205;
            double v132 = 1.79769313e308;
            do
            {
              for (uint64_t m = 0; m != v130; ++m)
              {
                if (*(void *)v205 != v131) {
                  objc_enumerationMutation(v111);
                }
                v134 = *(void **)(*((void *)&v204 + 1) + 8 * m);
                v217.origin.double x = _UIFocusItemFrameInCoordinateSpace(v134, v128);
                double MinY = CGRectGetMinY(v217);
                if (MinY <= v132)
                {
                  double v136 = MinY;
                  id v137 = v134;

                  id v47 = v137;
                  double v132 = v136;
                }
              }
              uint64_t v130 = [v111 countByEnumeratingWithState:&v204 objects:v211 count:16];
            }
            while (v130);
          }
          else
          {
            id v47 = 0;
          }

          CGFloat v46 = v170;
        }
        else
        {
          id v47 = [v111 lastObject];
        }
      }
    }

    v107 = v169;
  }
  v147 = [(_UIFocusMap *)v158 _focusMovementSearchContext];
  v148 = [v187 objectForKey:v47];
  [v147 addDestinationRegion:v148];

  v149 = [(_UIFocusMap *)v158 _focusMovementSearchContext];
  [v149 setDidFindFocusBlockingBoundary:(v47 == 0) & v154];

  double v31 = v150;
  CGFloat v45 = v155;
LABEL_22:

  return v47;
}

- (id)_nextFocusedItemForLinearFocusMovementRequest:(id)a3 startingFromRegion:(id)a4 inRegions:(id)a5 withSnapshot:(id)a6
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  [(_UIFocusMap *)self _beginTrackingFocusMovementSearchInfoIfNecessary];
  if (!v11)
  {
    int v15 = 0;
    goto LABEL_51;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystem);
  uint64_t v14 = [v10 movementInfo];
  int v15 = (void *)[v14 heading];
  [v13 snapshotFrameForRegion:v11];
  if (v15)
  {
    CGFloat v20 = v16;
    CGFloat v21 = v17;
    CGFloat v22 = v18;
    CGFloat v23 = v19;
    if (![v12 count]
      || (v89.origin.x = v20, v89.origin.y = v21, v89.size.width = v22, v89.size.double height = v23, CGRectIsEmpty(v89)))
    {
      int v15 = 0;
      goto LABEL_50;
    }
    CGFloat v69 = v12;
    id v70 = v14;
    id v66 = v11;
    uint64_t v72 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    long long v73 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    uint64_t v24 = [v14 _linearHeading];
    CGFloat v25 = [v10 focusedItemInfo];
    CGFloat v77 = [v25 item];

    __int16 v68 = v24;
    if (v24) {
      int v15 = (void *)v24;
    }
    CGFloat v26 = [v10 movementInfo];
    if (([v26 _linearHeading] & 0x110) != 0) {
      uint64_t v27 = 256;
    }
    else {
      uint64_t v27 = 512;
    }

    double v28 = [[_UIFocusMovementRequest alloc] initWithFocusSystem:WeakRetained];
    double v29 = [v10 movementInfo];
    double v30 = +[_UIFocusRegionMovementInfo _movementWithHeading:linearHeading:originatingHeading:isInitial:inputType:](_UIFocusRegionMovementInfo, "_movementWithHeading:linearHeading:originatingHeading:isInitial:inputType:", v27, v27, v15, 1, [v29 _inputType]);
    [(_UIFocusMovementRequest *)v28 setMovementInfo:v30];

    double v31 = [v10 focusedItemInfo];
    CGFloat v78 = v28;
    [(_UIFocusMovementRequest *)v28 setFocusedItemInfo:v31];

    uint64_t v71 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    CGFloat v67 = v10;
    if (([v14 _linearHeading] & 0x100) != 0)
    {
      id v32 = [v69 reverseObjectEnumerator];
    }
    else
    {
      id v32 = v69;
    }
    double v33 = v32;
    uint64_t v34 = [v32 countByEnumeratingWithState:&v82 objects:v86 count:16];
    if (!v34)
    {
LABEL_46:

      uint64_t v50 = [v73 allObjects];
      v79[0] = MEMORY[0x1E4F143A8];
      v79[1] = 3221225472;
      v79[2] = __103___UIFocusMap__nextFocusedItemForLinearFocusMovementRequest_startingFromRegion_inRegions_withSnapshot___block_invoke;
      v79[3] = &unk_1E52EE438;
      id v80 = WeakRetained;
      double v81 = self;
      uint64_t v51 = objc_msgSend(v50, "bs_filter:", v79);

      id v10 = v67;
      float v52 = [v67 movementInfo];
      uint64_t v53 = [v52 _groupFilter];

      uint64_t v54 = [(_UIFocusMap *)self _linearlySortedFocusItemsForItems:v51 groupFilter:v53 itemStandInMap:v71];
      uint64_t v14 = v70;
      int v15 = _UIFocusGetNextItemFromList(v77, v54, v68, [v70 _isLooping]);
      double v55 = [v72 objectForKey:v15];
      float v56 = [(_UIFocusMap *)self _focusMovementSearchContext];
      [v56 addDestinationRegion:v55];

      if (v15 && ([v55 _shouldUseNextFocusedItemForLinearSorting] & 1) == 0)
      {
        uint64_t v57 = [v72 objectForKey:v15];
        uint64_t v58 = [v13 _cachedNextFocusedItemForRegion:v57 withFocusMovementRequest:v78 inMap:self];

        int v15 = (void *)v58;
      }
      uint64_t v59 = [(_UIFocusMap *)self _defaultItemSearchContext];
      [v59 setLinearSortedFocusItems:v54];

      uint64_t v60 = [(_UIFocusMap *)self _focusMovementSearchContext];
      [v60 setLinearSortedFocusItems:v54];

      focusGroupMap = self->_focusGroupMap;
      unsigned int v62 = [(_UIFocusMap *)self _defaultItemSearchContext];
      [v62 setFocusGroupMap:focusGroupMap];

      double v63 = self->_focusGroupMap;
      int v64 = [(_UIFocusMap *)self _focusMovementSearchContext];
      [v64 setFocusGroupMap:v63];

      id v11 = v66;
      id v12 = v69;
      goto LABEL_50;
    }
    uint64_t v35 = v34;
    uint64_t v76 = *(void *)v83;
    BOOL v37 = (v68 & 0x300) == 0 && v77 != 0;
    double v38 = self;
    obuint64_t j = v33;
LABEL_23:
    uint64_t v39 = 0;
    while (1)
    {
      if (*(void *)v83 != v76) {
        objc_enumerationMutation(obj);
      }
      double v40 = *(void **)(*((void *)&v82 + 1) + 8 * v39);
      double v41 = [v13 _cachedNextFocusedItemForRegion:v40 withFocusMovementRequest:v78 inMap:self];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        CGFloat v42 = [v40 item];
        if (!v41) {
          goto LABEL_30;
        }
      }
      else
      {
        CGFloat v42 = 0;
        if (!v41)
        {
LABEL_30:
          char IsFocusableInFocusSystemWithSearchInfo = 0;
          goto LABEL_31;
        }
      }
      [(_UIFocusMap *)self searchInfo];
      v44 = id v43 = v13;
      char IsFocusableInFocusSystemWithSearchInfo = _UIFocusItemIsFocusableInFocusSystemWithSearchInfo(v41, WeakRetained, v44);

      id v13 = v43;
LABEL_31:
      BOOL v46 = v42 == v77 && v37;
      if ((IsFocusableInFocusSystemWithSearchInfo & 1) != 0 || v46)
      {
        if (v46) {
          double v48 = v42;
        }
        else {
          double v48 = v41;
        }
        id v47 = v48;

        self = v38;
        if (([v40 _shouldUseNextFocusedItemForLinearSorting] & 1) == 0)
        {
          uint64_t v49 = [v40 _focusedItemForLinearSorting:v78 inMap:v38 withSnapshot:v13];
          [v71 setObject:v47 forKey:v49];

          id v47 = (id)v49;
        }
        if (([v73 containsObject:v47] & 1) == 0)
        {
          [v72 setObject:v40 forKey:v47];
          [v73 addObject:v47];
        }
      }
      else
      {
        id v47 = v41;
        self = v38;
      }

      if (v35 == ++v39)
      {
        double v33 = obj;
        uint64_t v35 = [obj countByEnumeratingWithState:&v82 objects:v86 count:16];
        if (!v35) {
          goto LABEL_46;
        }
        goto LABEL_23;
      }
    }
  }
LABEL_50:

LABEL_51:
  return v15;
}

- (id)_allDefaultFocusableRegionsInContainer:(id)a3 intersectingRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_UIFocusMap *)self coordinateSpace];
  +[_UIFocusRegionEvaluator frameForRegion:v7 inCoordinateSpace:v8];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  if (v6 && (v21.origin.x = v10, v21.origin.y = v12, v21.size.width = v14, v21.size.double height = v16, !CGRectIsEmpty(v21)))
  {
    double v18 = [(_UIFocusMap *)self _defaultMapSnapshotter];
    [v18 setRegionsContainer:v6];
    objc_msgSend(v18, "setSnapshotFrame:", v10, v12, v14, v16);
    double v17 = [(_UIFocusMap *)self _findAllDefaultFocusableRegionsWithSnapshotter:v18];
  }
  else
  {
    double v17 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v17;
}

- (id)_closestFocusableItemToPoint:(CGPoint)a3 inRect:(CGRect)a4 excludingItems:(id)a5 distanceMeasuringUnitPoint:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  double height = a4.size.height;
  double width = a4.size.width;
  double v10 = a4.origin.y;
  double v11 = a4.origin.x;
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v13 = a5;
  v73.origin.double x = v11;
  v73.origin.double y = v10;
  v73.size.double width = width;
  v73.size.double height = height;
  if (CGRectIsEmpty(v73))
  {
    id v14 = 0;
  }
  else
  {
    double v15 = [(_UIFocusMap *)self _defaultMapSnapshotter];
    objc_msgSend(v15, "setSnapshotFrame:", v11, v10, width, height);
    double v55 = v15;
    double v16 = [v15 captureSnapshot];
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystem);
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    double v18 = [v16 regions];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v65 objects:v70 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v66;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v66 != v21) {
            objc_enumerationMutation(v18);
          }
          CGFloat v23 = *(void **)(*((void *)&v65 + 1) + 8 * i);
          uint64_t v24 = [v23 _defaultFocusItem];
          char v25 = [v13 containsObject:v24];
          if (v24 && (v25 & 1) == 0 && _UIFocusItemIsFocusableInFocusSystem(v24, WeakRetained)) {
            [v17 addObject:v23];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v65 objects:v70 count:16];
      }
      while (v20);
    }
    id v56 = v13;

    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    obuint64_t j = v17;
    uint64_t v26 = [obj countByEnumeratingWithState:&v61 objects:v69 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v59 = 0;
      double v28 = 0;
      double v29 = fmax(fmin(x, 1.0), 0.0);
      double v30 = fmax(fmin(y, 1.0), 0.0);
      uint64_t v31 = *(void *)v62;
      p_coordinateSpace = &self->_coordinateSpace;
      double v33 = 1.79769313e308;
      double v34 = 1.79769313e308;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v62 != v31) {
            objc_enumerationMutation(obj);
          }
          double v36 = *(void **)(*((void *)&v61 + 1) + 8 * j);
          BOOL v37 = [v36 _defaultFocusItem];
          if (v37)
          {
            double v38 = [v16 originalRegionForRegion:v36];
            [v16 snapshotFrameForRegion:v38];
            double v40 = v39;
            double v42 = v41;
            double v44 = v43;
            double v46 = v45;
            id v47 = objc_loadWeakRetained((id *)p_coordinateSpace);
            [v47 bounds];
            v75.origin.double x = v40;
            v75.origin.double y = v42;
            v75.size.double width = v44;
            v75.size.double height = v46;
            BOOL v48 = CGRectContainsRect(v74, v75);

            double v49 = (a3.x - (v40 + v29 * v44)) * (a3.x - (v40 + v29 * v44))
                + (a3.y - (v42 + v30 * v46)) * (a3.y - (v42 + v30 * v46));
            if (v49 <= v34)
            {
              id v50 = v37;

              double v34 = v49;
              double v28 = v50;
            }
            if (v49 <= v33 && v48)
            {
              id v52 = v37;

              uint64_t v59 = v52;
              double v33 = v49;
            }
          }
        }
        uint64_t v27 = [obj countByEnumeratingWithState:&v61 objects:v69 count:16];
      }
      while (v27);
    }
    else
    {
      uint64_t v59 = 0;
      double v28 = 0;
    }

    if (v59) {
      uint64_t v53 = v59;
    }
    else {
      uint64_t v53 = v28;
    }
    id v14 = v53;

    id v13 = v56;
  }

  return v14;
}

- (id)_findAllDefaultFocusableRegionsWithSnapshotter:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 captureSnapshot];
  id v5 = [(_UIFocusMap *)self _defaultItemSearchContext];
  [v5 addSnapshot:v4];

  id v6 = [(_UIFocusMap *)self _focusMovementSearchContext];
  [v6 addSnapshot:v4];

  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystem);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  double v18 = v4;
  id v8 = [v4 regions];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v14 = [v13 _defaultFocusItem];
        if (v14)
        {
          double v15 = [(_UIFocusMap *)self searchInfo];
          int IsFocusableInFocusSystemWithSearchInfo = _UIFocusItemIsFocusableInFocusSystemWithSearchInfo(v14, WeakRetained, v15);

          if (IsFocusableInFocusSystemWithSearchInfo) {
            [v19 addObject:v13];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  return v19;
}

- (id)_linearlySortedFocusItemsForItems:(id)a3 groupFilter:(int64_t)a4 itemStandInMap:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (a4 == 1)
  {
    double v15 = [(_UIFocusMap *)self focusSystem];
    double v16 = [v15 focusedItem];

    if (v16)
    {
      id v17 = [v8 arrayByAddingObject:v16];
      double v18 = [_UIFocusGroupMap alloc];
      id v19 = [(_UIFocusMap *)self coordinateSpace];
      long long v20 = [(_UIFocusGroupMap *)v18 initWithItems:v17 standInItemsMap:v9 coordinateSpace:v19];
      focusGroupMap = self->_focusGroupMap;
      self->_focusGroupMap = v20;

      long long v22 = [(_UIFocusGroupMap *)self->_focusGroupMap focusGroupForItem:v16];
      long long v23 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v30 = MEMORY[0x1E4F143A8];
      uint64_t v31 = 3221225472;
      id v32 = __76___UIFocusMap__linearlySortedFocusItemsForItems_groupFilter_itemStandInMap___block_invoke;
      double v33 = &unk_1E52EE460;
      double v34 = self;
      id v35 = v22;
      id v24 = v22;
      uint64_t v25 = [v23 predicateWithBlock:&v30];
      uint64_t v26 = objc_msgSend(v8, "filteredArrayUsingPredicate:", v25, v30, v31, v32, v33, v34);

      id v8 = (id)v26;
    }
  }
  else if (a4 == 2)
  {
    uint64_t v10 = [_UIFocusGroupMap alloc];
    uint64_t v11 = [(_UIFocusMap *)self coordinateSpace];
    double v12 = [(_UIFocusGroupMap *)v10 initWithItems:v8 standInItemsMap:v9 coordinateSpace:v11];
    id v13 = self->_focusGroupMap;
    self->_focusGroupMap = v12;

    id v14 = [(_UIFocusGroupMap *)self->_focusGroupMap focusItems];
    goto LABEL_8;
  }
  uint64_t v27 = [v8 sortedArrayUsingComparator:&__block_literal_global_208];

  id v14 = v27;
  id v8 = v14;
LABEL_8:
  double v28 = v14;

  return v28;
}

- (BOOL)verifyFocusabilityForItem:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[_UIFocusItemInfo infoWithItem:v4];
  [v5 ancestorEnvironmentScrollableContainers];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v27 + 1) + 8 * i) scrollableContainer];
        double v12 = [(_UIFocusMap *)self focusSystem];
        char v13 = [v12 _isScrollingScrollableContainer:v11 targetContentOffset:0];

        if (v13)
        {
          LOBYTE(v18) = 1;
          id v14 = v6;
          goto LABEL_21;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  id v14 = [(_UIFocusMap *)self _defaultMapSnapshotter];
  [v14 setFocusedRegion:0];
  double v15 = [v14 coordinateSpace];
  objc_msgSend(v14, "setSnapshotFrame:", _UIFocusItemFrameInCoordinateSpace(v4, v15));

  double v16 = [v14 captureSnapshot];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v17 = objc_msgSend(v16, "regions", 0);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v24;
    while (2)
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v17);
        }
        id v21 = [*(id *)(*((void *)&v23 + 1) + 8 * j) _defaultFocusItem];

        if (v21 == v4)
        {
          LOBYTE(v18) = 1;
          goto LABEL_20;
        }
      }
      uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }
LABEL_20:

LABEL_21:
  return v18;
}

- (void)_beginTrackingSearches
{
  if (self->_trackingSearchInfo)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"_UIFocusMap.m" lineNumber:1154 description:@"Attempted to begin tracking focus map searches  without finishing previous tracking."];
  }
  *(_WORD *)&self->_trackingSearchInfo = 257;
}

- (id)_stopTrackingSearches
{
  if (self->_trackingSearchInfo)
  {
    *(_WORD *)&self->_trackingSearchInfo = 0;
    v3 = [(_UIFocusMap *)self _defaultItemSearchContext];
    id v4 = v3;
    if (v3)
    {
      id v5 = v3;
    }
    else
    {
      id v5 = [(_UIFocusMap *)self _focusMovementSearchContext];
    }
    id v6 = v5;

    defaultItemSearchInfo = self->_defaultItemSearchInfo;
    self->_defaultItemSearchInfo = 0;

    focusMovementSearchInfo = self->_focusMovementSearchInfo;
    self->_focusMovementSearchInfo = 0;
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)_beginTrackingDefaultItemSearchInfoIfNecessary
{
  if (self->_trackingSearchInfo && self->_needsSearchInfo)
  {
    v3 = objc_alloc_init(_UIFocusMapSearchInfo);
    defaultItemSearchInfo = self->_defaultItemSearchInfo;
    self->_defaultItemSearchInfo = v3;

    self->_needsSearchInfo = 0;
  }
}

- (void)_beginTrackingFocusMovementSearchInfoIfNecessary
{
  if (self->_trackingSearchInfo && self->_needsSearchInfo)
  {
    v3 = objc_alloc_init(_UIFocusMapSearchInfo);
    focusMovementSearchInfo = self->_focusMovementSearchInfo;
    self->_focusMovementSearchInfo = v3;

    self->_needsSearchInfo = 0;
  }
}

- (void)_trackExternalSnapshot:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIFocusMap *)self _defaultItemSearchContext];
  [v5 addSnapshot:v4];

  id v6 = [(_UIFocusMap *)self _focusMovementSearchContext];
  [v6 addSnapshot:v4];
}

- (void)diagnoseFocusabilityForItem:(id)a3 report:(id)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    double v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:a2, self, @"_UIFocusMap.m", 1203, @"Invalid parameter not satisfying: %@", @"item" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  double v42 = [MEMORY[0x1E4F28B00] currentHandler];
  [v42 handleFailureInMethod:a2, self, @"_UIFocusMap.m", 1204, @"Invalid parameter not satisfying: %@", @"report" object file lineNumber description];

LABEL_3:
  if ([v7 canBecomeFocused])
  {
    uint64_t v10 = [(_UIFocusMap *)self _defaultMapSnapshotter];
    [v10 setFocusedRegion:0];
    uint64_t v11 = [v10 captureSnapshot];
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    char v13 = [v11 originalRegions];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v60 objects:v66 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v61;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v61 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          id v19 = [v18 _defaultFocusItem];
          if (v19) {
            BOOL v20 = v19 == v7;
          }
          else {
            BOOL v20 = 0;
          }
          if (v20)
          {
            [v12 addObject:v18];

            goto LABEL_18;
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v60 objects:v66 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }
LABEL_18:

    if ([v12 count])
    {
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v22 = v12;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v56 objects:v65 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        id v43 = v12;
        double v44 = v10;
        uint64_t v25 = *(void *)v57;
        BOOL v48 = v11;
        double v49 = v9;
        id v47 = v22;
        id v45 = v7;
        uint64_t v46 = *(void *)v57;
        do
        {
          uint64_t v26 = 0;
          uint64_t v50 = v24;
          do
          {
            if (*(void *)v57 != v25) {
              objc_enumerationMutation(v22);
            }
            uint64_t v27 = *(void *)(*((void *)&v56 + 1) + 8 * v26);
            long long v28 = [v11 regionsForOriginalRegion:v27];
            if (![v28 count])
            {
              uint64_t v51 = v26;
              long long v29 = +[_UIDebugIssue issueWithDescription:@"The item is being visually occluded by the following items:"];
              long long v52 = 0u;
              long long v53 = 0u;
              long long v54 = 0u;
              long long v55 = 0u;
              long long v30 = [v11 occludingRegionsForRegion:v27];
              uint64_t v31 = [v30 countByEnumeratingWithState:&v52 objects:v64 count:16];
              if (v31)
              {
                uint64_t v32 = v31;
                uint64_t v33 = *(void *)v53;
                do
                {
                  for (uint64_t j = 0; j != v32; ++j)
                  {
                    if (*(void *)v53 != v33) {
                      objc_enumerationMutation(v30);
                    }
                    id v35 = [*(id *)(*((void *)&v52 + 1) + 8 * j) _debugAssociatedObject];
                    if (v35)
                    {
                      double v36 = NSString;
                      BOOL v37 = (objc_class *)objc_opt_class();
                      double v38 = NSStringFromClass(v37);
                      double v39 = [v36 stringWithFormat:@"<%@: %p>", v38, v35];

                      double v40 = +[_UIDebugIssue issueWithDescription:v39];

                      [v40 setPrefix:&stru_1ED0E84C0];
                      [v29 addIssue:v40];
                    }
                  }
                  uint64_t v32 = [v30 countByEnumeratingWithState:&v52 objects:v64 count:16];
                }
                while (v32);
              }

              uint64_t v9 = v49;
              [v49 addIssue:v29];

              id v22 = v47;
              uint64_t v11 = v48;
              uint64_t v25 = v46;
              uint64_t v24 = v50;
              uint64_t v26 = v51;
            }

            ++v26;
          }
          while (v26 != v24);
          uint64_t v24 = [v22 countByEnumeratingWithState:&v56 objects:v65 count:16];
        }
        while (v24);
        uint64_t v10 = v44;
        id v7 = v45;
        id v12 = v43;
      }
    }
    else
    {
      id v22 = +[_UIDebugIssue issueWithDescription:@"This item is not visible onscreen."];
      [v9 addIssue:v22];
    }
  }
  else
  {
    id v21 = +[_UIDebugIssue issueWithDescription:@"This item returns NO from -canBecomeFocused."];
    [v9 addIssue:v21];
  }
}

- (UIFocusSystem)focusSystem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystem);
  return (UIFocusSystem *)WeakRetained;
}

- (_UIFocusRegionContainer)rootContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rootContainer);
  return (_UIFocusRegionContainer *)WeakRetained;
}

- (UICoordinateSpace)coordinateSpace
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinateSpace);
  return (UICoordinateSpace *)WeakRetained;
}

- (_UIFocusGroupMap)focusGroupMap
{
  return self->_focusGroupMap;
}

- (_UIFocusSearchInfo)searchInfo
{
  return self->_searchInfo;
}

- (CGRect)minimumSearchArea
{
  double x = self->_minimumSearchArea.origin.x;
  double y = self->_minimumSearchArea.origin.y;
  double width = self->_minimumSearchArea.size.width;
  double height = self->_minimumSearchArea.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (_UIFocusMapSearchInfo)_defaultItemSearchContext
{
  return self->_defaultItemSearchInfo;
}

- (_UIFocusMapSearchInfo)_focusMovementSearchContext
{
  return self->_focusMovementSearchInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusMovementSearchInfo, 0);
  objc_storeStrong((id *)&self->_defaultItemSearchInfo, 0);
  objc_storeStrong((id *)&self->_searchInfo, 0);
  objc_storeStrong((id *)&self->_focusGroupMap, 0);
  objc_destroyWeak((id *)&self->_coordinateSpace);
  objc_destroyWeak((id *)&self->_rootContainer);
  objc_destroyWeak((id *)&self->_focusSystem);
  objc_storeStrong((id *)&self->_rootContainerProxy, 0);
}

@end