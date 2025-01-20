@interface _UIFocusRegionMap
- (BOOL)_containsFocusableRegionForView:(id)a3;
- (CGPoint)_focusCandidateSearchOriginForFocusedFrame:(CGRect)a3 heading:(unint64_t)a4 minimumSearchArea:(CGRect)a5;
- (CGRect)_focusCandidateSearchRectForFocusedFrame:(CGRect)a3 heading:(unint64_t)a4 minimumSearchArea:(CGRect)a5;
- (CGRect)_rectThatJustBarelyIntersectsRect:(CGRect)a3 startingRect:(CGRect)a4;
- (CGRect)_viewSearchRectForFocusedFrame:(CGRect)a3 focusCandidateSearchRect:(CGRect)a4 includesFocusedFrame:(BOOL)a5;
- (CGRect)_viewSearchRectForSnapshotRect:(CGRect)a3;
- (CGRect)minimumSearchArea;
- (UIFocusSystem)focusSystem;
- (UIView)rootView;
- (_UIFocusRegionMap)initWithRootView:(id)a3 focusSystem:(id)a4;
- (_UIFocusRegionMapSnapshot)lastSnapshot;
- (id)_closestFocusableRegionInArray:(id)a3 toPoint:(CGPoint)a4 usingHeading:(unint64_t)a5 withFocusedView:(id)a6 consideringFavoredRegion:(BOOL)a7 includingFocusedView:(BOOL)a8;
- (id)_contextWithSourceView:(id)a3 focusedContainerGuide:(id)a4 movement:(id)a5;
- (id)_contextWithSourceView:(id)a3 focusedRegion:(id)a4 movement:(id)a5;
- (id)_nearestCandidateForFocusMovement:(id)a3 fromFocusedView:(id)a4 withFocusedRect:(CGRect)a5 includingFocusedView:(BOOL)a6;
- (id)debugQuickLookObject;
- (id)linearlyOrderedCandidatesForFocusMovement:(id)a3 fromView:(id)a4 indexForFocusedView:(unint64_t *)a5;
- (id)linearlyOrderedFocusRegionMapEntriesForFocusMovement:(id)a3 fromView:(id)a4;
- (id)nearestCandidateFromRect:(CGRect)a3;
- (void)setFocusSystem:(id)a3;
- (void)setLastSnapshot:(id)a3;
- (void)setMinimumSearchArea:(CGRect)a3;
- (void)setRootView:(id)a3;
@end

@implementation _UIFocusRegionMap

- (_UIFocusRegionMap)initWithRootView:(id)a3 focusSystem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UIFocusRegionMap;
  v8 = [(_UIFocusRegionMap *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_rootView, v6);
    objc_storeStrong((id *)&v9->_focusSystem, a4);
  }

  return v9;
}

- (id)nearestCandidateFromRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = +[_UIFocusMovementInfo _movementWithHeading:0 isInitial:1];
  v9 = [(_UIFocusRegionMap *)self rootView];
  v10 = [v9 _focusSystem];
  objc_super v11 = [v10 _focusedView];
  v12 = -[_UIFocusRegionMap _nearestCandidateForFocusMovement:fromFocusedView:withFocusedRect:includingFocusedView:](self, "_nearestCandidateForFocusMovement:fromFocusedView:withFocusedRect:includingFocusedView:", v8, v11, 0, x, y, width, height);

  return v12;
}

- (id)_nearestCandidateForFocusMovement:(id)a3 fromFocusedView:(id)a4 withFocusedRect:(CGRect)a5 includingFocusedView:(BOOL)a6
{
  uint64_t v6 = a6;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v102 = a4;
  id v88 = v13;
  uint64_t v14 = [v13 heading];
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(_UIFocusRegionMap *)self minimumSearchArea];
  -[_UIFocusRegionMap _focusCandidateSearchOriginForFocusedFrame:heading:minimumSearchArea:](self, "_focusCandidateSearchOriginForFocusedFrame:heading:minimumSearchArea:", v14, x, y, width, height, v16, v17, v18, v19);
  double v21 = v20;
  double v23 = v22;
  [(_UIFocusRegionMap *)self minimumSearchArea];
  double v86 = y;
  double v87 = x;
  -[_UIFocusRegionMap _focusCandidateSearchRectForFocusedFrame:heading:minimumSearchArea:](self, "_focusCandidateSearchRectForFocusedFrame:heading:minimumSearchArea:", v14, x, y, width, height, v24, v25, v26, v27);
  double v29 = v28;
  double v31 = v30;
  double v32 = x;
  double v33 = y;
  double v35 = v34;
  double v37 = v36;
  -[_UIFocusRegionMap _viewSearchRectForFocusedFrame:focusCandidateSearchRect:includesFocusedFrame:](self, "_viewSearchRectForFocusedFrame:focusCandidateSearchRect:includesFocusedFrame:", v6, v32, v33, width, height, v29, v31);
  double v98 = v39;
  double v100 = v38;
  double v93 = v41;
  double v95 = v40;
  v42 = [(_UIFocusRegionMap *)self rootView];
  v43 = [(_UIFocusRegionMap *)self focusSystem];
  v44 = +[_UIFocusRegionMapSnapshotRequest requestWithRootView:v42 focusSystem:v43];

  objc_msgSend(v44, "setSnapshotRect:", v29, v31, v35, v37);
  objc_msgSend(v44, "setViewSearchRect:", v100, v98, v95, v93);
  objc_msgSend(v44, "setFocusedRect:", v87, v86, width, height);
  uint64_t v96 = v14;
  [v44 setFocusHeading:v14];
  v92 = v44;
  v45 = [v44 takeSnapshot];
  v94 = v15;
  [v15 addObject:v45];
  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  v46 = [v45 sortedFocusContainerGuideMapEntries];
  uint64_t v101 = [v46 countByEnumeratingWithState:&v103 objects:v107 count:16];
  if (v101)
  {
    uint64_t v99 = *(void *)v104;
    double v47 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v89 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v90 = *MEMORY[0x1E4F1DB28];
    double v48 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v49 = v14;
    v97 = self;
    unsigned int v91 = v6;
LABEL_3:
    uint64_t v50 = 0;
    while (1)
    {
      if (*(void *)v104 != v99) {
        objc_enumerationMutation(v46);
      }
      v51 = *(void **)(*((void *)&v103 + 1) + 8 * v50);
      v52 = [v51 focusContainerGuide];
      v53 = [v45 focusableRegionMapEntriesLimitedByFocusContainerGuide:v52];

      if ([v53 count])
      {
        v54 = 0;
        uint64_t v55 = 0;
        BOOL v56 = 1;
      }
      else
      {
        v57 = [v51 focusContainerGuide];
        v58 = [v57 preferredFocusedView];

        BOOL v56 = v58 != 0;
        if (v58)
        {
          uint64_t v55 = [v51 focusContainerGuide];
          v54 = 0;
        }
        else
        {
          v59 = (void *)[v92 copy];
          v60 = [v51 focusContainerGuide];
          [v60 _focusRegionFrame];
          objc_msgSend(v59, "setSnapshotRect:");

          [v59 snapshotRect];
          -[_UIFocusRegionMap _viewSearchRectForFocusedFrame:focusCandidateSearchRect:includesFocusedFrame:](v97, "_viewSearchRectForFocusedFrame:focusCandidateSearchRect:includesFocusedFrame:", 0, v87, v86, width, height, v61, v62, v63, v64);
          objc_msgSend(v59, "setViewSearchRect:");
          objc_msgSend(v59, "setFocusedRect:", v90, v89, v47, v48);
          [v59 setFocusHeading:0];
          v65 = [v51 focusContainerGuide];
          v66 = [v65 owningView];
          [v59 setFocusableRegionAncestorView:v66];

          v54 = [v59 takeSnapshot];
          [v94 addObject:v54];
          [v54 allFocusableRegionMapEntries];
          uint64_t v68 = v67 = v46;

          uint64_t v6 = v91;
          uint64_t v55 = 0;
          v53 = (void *)v68;
          v46 = v67;
          uint64_t v49 = v96;
        }

        self = v97;
      }
      if ([v53 count])
      {
        uint64_t v69 = -[_UIFocusRegionMap _closestFocusableRegionInArray:toPoint:usingHeading:withFocusedView:consideringFavoredRegion:includingFocusedView:](self, "_closestFocusableRegionInArray:toPoint:usingHeading:withFocusedView:consideringFavoredRegion:includingFocusedView:", v53, v49, v102, v56, v6, v21, v23);
      }
      else
      {
        uint64_t v69 = 0;
      }
      if (v69 | v55) {
        break;
      }

      if (v101 == ++v50)
      {
        uint64_t v101 = [v46 countByEnumeratingWithState:&v103 objects:v107 count:16];
        if (v101) {
          goto LABEL_3;
        }
        goto LABEL_18;
      }
    }
    if (v54)
    {
      id v70 = v54;

      v45 = v70;
    }

    if (v69) {
      goto LABEL_23;
    }
  }
  else
  {
LABEL_18:

    uint64_t v55 = 0;
  }
  v71 = [v45 allFocusableRegionMapEntries];
  uint64_t v69 = -[_UIFocusRegionMap _closestFocusableRegionInArray:toPoint:usingHeading:withFocusedView:consideringFavoredRegion:includingFocusedView:](self, "_closestFocusableRegionInArray:toPoint:usingHeading:withFocusedView:consideringFavoredRegion:includingFocusedView:", v71, v96, v102, 1, v6, v21, v23);

LABEL_23:
  v72 = [(id)v69 focusableRegion];
  int v73 = [v72 _isPromiseFocusRegion];

  v74 = v94;
  if (v73)
  {
    uint64_t v75 = v6;
    do
    {
      [v45 setPrivateSnaphot:1];
      v76 = [v45 _snapshotByFulfillingPromiseFocusRegionEntry:v69];

      [v94 addObject:v76];
      uint64_t v77 = [v76 allFocusableRegionMapEntries];
      v78 = -[_UIFocusRegionMap _closestFocusableRegionInArray:toPoint:usingHeading:withFocusedView:consideringFavoredRegion:includingFocusedView:](self, "_closestFocusableRegionInArray:toPoint:usingHeading:withFocusedView:consideringFavoredRegion:includingFocusedView:", v77, v96, v102, 1, v75, v21, v23);

      v79 = [v78 focusableRegion];
      LOBYTE(v77) = [v79 _isPromiseFocusRegion];

      v45 = v76;
      uint64_t v69 = (uint64_t)v78;
    }
    while ((v77 & 1) != 0);
    if (v78) {
      goto LABEL_27;
    }
  }
  else
  {
    v78 = (void *)v69;
    v76 = v45;
    if (v69)
    {
LABEL_27:
      v80 = [v78 focusableRegion];
      v81 = v88;
      v82 = [(_UIFocusRegionMap *)self _contextWithSourceView:v102 focusedRegion:v80 movement:v88];

      v83 = [v94 lastObject];
      v84 = [v78 focusableRegion];
      [v83 _didChooseFocusCandidateRegion:v84];

      v74 = v94;
      goto LABEL_32;
    }
  }
  v81 = v88;
  if (v55)
  {
    v82 = [(_UIFocusRegionMap *)self _contextWithSourceView:v102 focusedContainerGuide:v55 movement:v88];
  }
  else
  {
    v82 = 0;
  }
LABEL_32:
  [(_UIFocusRegionMap *)self setLastSnapshot:v76];
  [v82 _setRegionMapSnapshots:v74];

  return v82;
}

- (id)linearlyOrderedCandidatesForFocusMovement:(id)a3 fromView:(id)a4 indexForFocusedView:(unint64_t *)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  double v24 = self;
  double v25 = v8;
  v10 = [(_UIFocusRegionMap *)self linearlyOrderedFocusRegionMapEntriesForFocusMovement:v8 fromView:v9];
  objc_super v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v10;
  uint64_t v12 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(obj);
        }
        double v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        double v17 = [v16 focusableRegion];
        double v18 = [v17 _focusRegionView];

        if (v18)
        {
          double v19 = [v16 focusableRegion];
          double v20 = [(_UIFocusRegionMap *)v24 _contextWithSourceView:v9 focusedRegion:v19 movement:v25];

          [v11 addObject:v20];
          if (a5)
          {
            id v21 = [v16 focusableRegion];

            if (v21 == v9) {
              *a5 = [v11 count] - 1;
            }
          }
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v13);
  }

  return v11;
}

- (id)linearlyOrderedFocusRegionMapEntriesForFocusMovement:(id)a3 fromView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_UIFocusRegionMap *)self rootView];
  id v9 = [(_UIFocusRegionMap *)self focusSystem];
  v10 = +[_UIFocusRegionMapSnapshotRequest requestWithRootView:v8 focusSystem:v9];

  [v6 _focusRegionFrame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  objc_msgSend(v10, "setFocusedRect:", v12, v14, v16, v18);
  uint64_t v19 = [v7 heading];

  [v10 setFocusHeading:v19];
  [v10 setIncludeFocusContainerGuides:0];
  [v10 setClipToSnapshotRect:0];
  double v20 = [v10 takeSnapshot];
  id v21 = [(_UIFocusRegionMap *)self focusSystem];
  double v22 = [(_UIFocusRegionMap *)self rootView];
  LOBYTE(v8) = [v21 _shouldReverseLayoutDirectionForEnvironment:v22];

  double v23 = [(_UIFocusRegionMap *)self focusSystem];
  double v24 = [(_UIFocusRegionMap *)self rootView];
  LOBYTE(v9) = [v23 _shouldReverseLinearWrappingForEnvironment:v24];

  double v25 = [v20 allFocusableRegionMapEntries];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __83___UIFocusRegionMap_linearlyOrderedFocusRegionMapEntriesForFocusMovement_fromView___block_invoke;
  v28[3] = &__block_descriptor_34_e67_q24__0___UIFocusableRegionMapEntry_8___UIFocusableRegionMapEntry_16l;
  char v29 = (char)v8;
  char v30 = (char)v9;
  long long v26 = [v25 sortedArrayUsingComparator:v28];

  [(_UIFocusRegionMap *)self setLastSnapshot:v20];
  return v26;
}

- (id)_closestFocusableRegionInArray:(id)a3 toPoint:(CGPoint)a4 usingHeading:(unint64_t)a5 withFocusedView:(id)a6 consideringFavoredRegion:(BOOL)a7 includingFocusedView:(BOOL)a8
{
  BOOL v34 = a8;
  double y = a4.y;
  double x = a4.x;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a6;
  if (!v13)
  {
    double v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"_UIFocusRegionMap.m", 234, @"Invalid parameter not satisfying: %@", @"focusableRegionMapEntries" object file lineNumber description];
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v15 = v13;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    id v18 = 0;
    uint64_t v19 = *(void *)v36;
    double v20 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v36 != v19) {
          objc_enumerationMutation(v15);
        }
        double v22 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if (v14
          && ([*(id *)(*((void *)&v35 + 1) + 8 * i) focusableRegion],
              id v23 = (id)objc_claimAutoreleasedReturnValue(),
              v23,
              v23 == v14))
        {
          if (v34 && !v18) {
            id v18 = v22;
          }
        }
        else
        {
          [v22 frame];
          double MidX = CGRectGetMidX(v42);
          [v22 frame];
          CGFloat MidY = CGRectGetMidY(v43);
          double v26 = sqrt((MidX - x) * (MidX - x) + (MidY - y) * (MidY - y));
          if (v26 < v20)
          {
            long long v27 = [v22 focusableRegion];
            long long v28 = [v27 _focusRegionView];

            if (v28
              || ([v22 focusableRegion],
                  char v29 = objc_claimAutoreleasedReturnValue(),
                  int v30 = [v29 _isPromiseFocusRegion],
                  v29,
                  v30))
            {
              id v31 = v22;

              id v18 = v31;
              double v20 = v26;
            }
          }
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v17);
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (CGPoint)_focusCandidateSearchOriginForFocusedFrame:(CGRect)a3 heading:(unint64_t)a4 minimumSearchArea:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  CGFloat v10 = a3.size.height;
  CGFloat v11 = a3.size.width;
  CGFloat v12 = a3.origin.y;
  CGFloat v13 = a3.origin.x;
  if (CGRectIsEmpty(a3))
  {
    unint64_t v14 = (a4 >> 1) & 0x114 | (2 * (int)a4) & 0x228 | (__rbit32(a4) >> 30);
    double v15 = _UIRectDeparturePointAlongFocusHeading(v14, x, y, width, height);
  }
  else
  {
    v20.origin.double x = v13;
    v20.origin.double y = v12;
    v20.size.double width = v11;
    v20.size.double height = v10;
    CGFloat MidX = CGRectGetMidX(v20);
    v21.origin.double x = v13;
    v21.origin.double y = v12;
    v21.size.double width = v11;
    v21.size.double height = v10;
    double MidY = CGRectGetMidY(v21);
    double v15 = MidX;
  }
  result.double y = MidY;
  result.double x = v15;
  return result;
}

- (CGRect)_focusCandidateSearchRectForFocusedFrame:(CGRect)a3 heading:(unint64_t)a4 minimumSearchArea:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  char v9 = a4;
  CGFloat v10 = a3.size.height;
  CGFloat v11 = a3.size.width;
  CGFloat v12 = a3.origin.y;
  CGFloat v13 = a3.origin.x;
  if (!CGRectIsEmpty(a3))
  {
    if ((v9 & 0xC) == 0 || (v9 & 4) != 0)
    {
      v51.origin.CGFloat x = v13;
      v51.origin.CGFloat y = v12;
      v51.size.CGFloat width = v11;
      v51.size.CGFloat height = v10;
      double MinX = CGRectGetMinX(v51);
    }
    else
    {
      v50.origin.CGFloat x = v13;
      v50.origin.CGFloat y = v12;
      v50.size.CGFloat width = v11;
      v50.size.CGFloat height = v10;
      double MinX = CGRectGetMaxX(v50);
    }
    double v47 = MinX;
    if (v9 & 3) == 0 || (v9)
    {
      v53.origin.CGFloat x = v13;
      v53.origin.CGFloat y = v12;
      v53.size.CGFloat width = v11;
      v53.size.CGFloat height = v10;
      double MinY = CGRectGetMinY(v53);
    }
    else
    {
      v52.origin.CGFloat x = v13;
      v52.origin.CGFloat y = v12;
      v52.size.CGFloat width = v11;
      v52.size.CGFloat height = v10;
      double MinY = CGRectGetMaxY(v52);
    }
    double v46 = MinY;
    CGFloat rect = x;
    v54.origin.CGFloat x = x;
    v54.origin.CGFloat y = y;
    v54.size.CGFloat width = width;
    CGFloat rect_16 = height;
    v54.size.CGFloat height = height;
    double v21 = CGRectGetMinY(v54);
    v55.origin.CGFloat x = v13;
    v55.origin.CGFloat y = v12;
    v55.size.CGFloat width = v11;
    v55.size.CGFloat height = v10;
    double v22 = CGRectGetMinY(v55);
    double v23 = v22;
    if ((v9 & 3) != 0 && (v9 & 0xC) != 0)
    {
      if (v21 < v22) {
        double v22 = v21;
      }
      double v44 = v22;
      v56.origin.CGFloat y = y;
      v56.origin.CGFloat x = rect;
      v56.size.CGFloat width = width;
      v56.size.CGFloat height = rect_16;
      double v24 = CGRectGetMinX(v56);
      v57.origin.CGFloat x = v13;
      v57.origin.CGFloat y = v12;
      v57.size.CGFloat width = v11;
      v57.size.CGFloat height = v10;
      double v25 = CGRectGetMinX(v57);
      if (v24 < v25) {
        double v25 = v24;
      }
      double v42 = v25;
      v58.origin.CGFloat x = rect;
      v58.origin.CGFloat y = y;
      v58.size.CGFloat width = width;
      v58.size.CGFloat height = rect_16;
      double MaxY = CGRectGetMaxY(v58);
      v59.origin.CGFloat x = v13;
      v59.origin.CGFloat y = v12;
      v59.size.CGFloat width = v11;
      v59.size.CGFloat height = v10;
      double v27 = CGRectGetMaxY(v59);
      if (MaxY < v27) {
        double MaxY = v27;
      }
      v60.origin.CGFloat x = rect;
      v60.origin.CGFloat y = y;
      v60.size.CGFloat width = width;
      v60.size.CGFloat height = rect_16;
      double MaxX = CGRectGetMaxX(v60);
      v61.origin.CGFloat x = v13;
      v61.origin.CGFloat y = v12;
      v61.size.CGFloat width = v11;
      v61.size.CGFloat height = v10;
      double v29 = CGRectGetMaxX(v61);
      if (MaxX >= v29) {
        double v29 = MaxX;
      }
      if ((v9 & 4) != 0) {
        double v30 = v42;
      }
      else {
        double v30 = v29;
      }
      if (v9) {
        double v31 = v44;
      }
      else {
        double v31 = MaxY;
      }
      goto LABEL_43;
    }
    v62.origin.CGFloat x = v13;
    v62.origin.CGFloat y = v12;
    v62.size.CGFloat width = v11;
    v62.size.CGFloat height = v10;
    double v32 = v23 - CGRectGetHeight(v62);
    if (v21 < v32) {
      double v32 = v21;
    }
    double v45 = v32;
    v63.origin.CGFloat x = rect;
    v63.origin.CGFloat y = y;
    v63.size.CGFloat width = width;
    v63.size.CGFloat height = rect_16;
    double v33 = CGRectGetMinX(v63);
    v64.origin.CGFloat x = v13;
    v64.origin.CGFloat y = v12;
    v64.size.CGFloat width = v11;
    v64.size.CGFloat height = v10;
    double v34 = CGRectGetMinX(v64);
    v65.origin.CGFloat x = v13;
    v65.origin.CGFloat y = v12;
    v65.size.CGFloat width = v11;
    v65.size.CGFloat height = v10;
    double v35 = v34 - CGRectGetWidth(v65);
    if (v33 < v35) {
      double v35 = v33;
    }
    double v43 = v35;
    v66.origin.CGFloat x = rect;
    v66.origin.CGFloat y = y;
    v66.size.CGFloat width = width;
    v66.size.CGFloat height = rect_16;
    double v36 = CGRectGetMaxY(v66);
    v67.origin.CGFloat x = v13;
    v67.origin.CGFloat y = v12;
    v67.size.CGFloat width = v11;
    v67.size.CGFloat height = v10;
    double v37 = CGRectGetMaxY(v67);
    v68.origin.CGFloat x = v13;
    v68.origin.CGFloat y = v12;
    v68.size.CGFloat width = v11;
    v68.size.CGFloat height = v10;
    double v38 = v37 + CGRectGetHeight(v68);
    if (v36 < v38) {
      double v36 = v38;
    }
    v69.origin.CGFloat x = rect;
    v69.origin.CGFloat y = y;
    v69.size.CGFloat height = rect_16;
    v69.size.CGFloat width = width;
    double v39 = CGRectGetMaxX(v69);
    v70.origin.CGFloat x = v13;
    v70.origin.CGFloat y = v12;
    v70.size.CGFloat width = v11;
    v70.size.CGFloat height = v10;
    double v40 = CGRectGetMaxX(v70);
    v71.origin.CGFloat x = v13;
    v71.origin.CGFloat y = v12;
    v71.size.CGFloat width = v11;
    v71.size.CGFloat height = v10;
    double v41 = v40 + CGRectGetWidth(v71);
    if (v39 >= v41) {
      double v41 = v39;
    }
    if ((v9 & 4) != 0) {
      double v30 = v43;
    }
    else {
      double v30 = v41;
    }
    if (v9) {
      double v31 = v45;
    }
    else {
      double v31 = v36;
    }
    if ((v9 & 0xC) != 0)
    {
      if ((v9 & 3) != 0)
      {
LABEL_43:
        v72.origin.CGFloat y = v46;
        v72.origin.CGFloat x = v47;
        v72.size.CGFloat width = v30 - v47;
        v72.size.CGFloat height = v31 - v46;
        *(CGRect *)&CGFloat v15 = CGRectStandardize(v72);
        goto LABEL_46;
      }
    }
    else
    {
      v73.origin.CGFloat x = v13;
      v73.origin.CGFloat y = v12;
      v73.size.CGFloat width = v11;
      v73.size.CGFloat height = v10;
      double v30 = CGRectGetMaxX(v73);
      if ((v9 & 3) != 0) {
        goto LABEL_43;
      }
    }
    v74.origin.CGFloat x = v13;
    v74.origin.CGFloat y = v12;
    v74.size.CGFloat width = v11;
    v74.size.CGFloat height = v10;
    double v31 = CGRectGetMaxY(v74);
    goto LABEL_43;
  }
  [(_UIFocusRegionMap *)self minimumSearchArea];
LABEL_46:
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (CGRect)_rectThatJustBarelyIntersectsRect:(CGRect)a3 startingRect:(CGRect)a4
{
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat v8 = a3.origin.y;
  CGFloat v9 = a3.origin.x;
  CGFloat v35 = a4.size.width;
  CGFloat v36 = a4.size.height;
  double MaxX = CGRectGetMaxX(a4);
  double v11 = v9;
  v41.origin.CGFloat x = v9;
  v41.origin.CGFloat y = v8;
  CGFloat v37 = width;
  v41.size.CGFloat width = width;
  v41.size.CGFloat height = height;
  CGFloat v38 = height;
  if (MaxX <= CGRectGetMinX(v41))
  {
    CGFloat v15 = v9;
    v42.origin.CGFloat x = v9;
    CGFloat v12 = v8;
    v42.origin.CGFloat y = v8;
    v42.size.CGFloat width = v37;
    v42.size.CGFloat height = v38;
    CGFloat MinX = CGRectGetMinX(v42);
    v43.origin.CGFloat x = x;
    v43.origin.CGFloat y = y;
    v43.size.CGFloat width = v35;
    v43.size.CGFloat height = v36;
    CGFloat MinY = CGRectGetMinY(v43);
    v44.origin.CGFloat x = x;
    v44.origin.CGFloat y = y;
    v44.size.CGFloat width = v35;
    v44.size.CGFloat height = v36;
    v45.size.CGFloat height = CGRectGetHeight(v44);
    v45.size.CGFloat width = 90.0;
    v45.origin.CGFloat x = MinX;
    v45.origin.CGFloat y = MinY;
    v70.origin.CGFloat x = x;
    v70.origin.CGFloat y = y;
    v70.size.CGFloat width = v35;
    v70.size.CGFloat height = v36;
    CGRect v46 = CGRectUnion(v45, v70);
    CGFloat x = v46.origin.x;
    CGFloat y = v46.origin.y;
    CGFloat v14 = v46.size.width;
    CGFloat v13 = v46.size.height;
  }
  else
  {
    CGFloat v12 = v8;
    CGFloat v14 = v35;
    CGFloat v13 = v36;
    CGFloat v15 = v11;
  }
  v47.origin.CGFloat x = x;
  v47.origin.CGFloat y = y;
  v47.size.CGFloat width = v14;
  v47.size.CGFloat height = v13;
  double v18 = CGRectGetMinX(v47);
  v48.origin.CGFloat x = v15;
  v48.origin.CGFloat y = v12;
  v48.size.CGFloat width = v37;
  v48.size.CGFloat height = v38;
  if (v18 >= CGRectGetMaxX(v48))
  {
    v49.origin.CGFloat x = v15;
    v49.origin.CGFloat y = v12;
    v49.size.CGFloat width = v37;
    v49.size.CGFloat height = v38;
    CGFloat v19 = CGRectGetMaxX(v49) + -90.0;
    v50.origin.CGFloat x = x;
    v50.origin.CGFloat y = y;
    v50.size.CGFloat width = v14;
    v50.size.CGFloat height = v13;
    CGFloat v20 = CGRectGetMinY(v50);
    v51.origin.CGFloat x = x;
    v51.origin.CGFloat y = y;
    v51.size.CGFloat width = v14;
    v51.size.CGFloat height = v13;
    v52.size.CGFloat height = CGRectGetHeight(v51);
    v52.size.CGFloat width = 90.0;
    v52.origin.CGFloat x = v19;
    v52.origin.CGFloat y = v20;
    v71.origin.CGFloat x = x;
    v71.origin.CGFloat y = y;
    v71.size.CGFloat width = v14;
    v71.size.CGFloat height = v13;
    CGRect v53 = CGRectUnion(v52, v71);
    CGFloat x = v53.origin.x;
    CGFloat y = v53.origin.y;
    CGFloat v14 = v53.size.width;
    CGFloat v13 = v53.size.height;
  }
  v54.origin.CGFloat x = x;
  v54.origin.CGFloat y = y;
  v54.size.CGFloat width = v14;
  v54.size.CGFloat height = v13;
  double MaxY = CGRectGetMaxY(v54);
  v55.origin.CGFloat x = v15;
  v55.origin.CGFloat y = v12;
  v55.size.CGFloat width = v37;
  v55.size.CGFloat height = v38;
  if (MaxY <= CGRectGetMinY(v55))
  {
    v56.origin.CGFloat x = x;
    v56.origin.CGFloat y = y;
    v56.size.CGFloat width = v14;
    v56.size.CGFloat height = v13;
    CGFloat v22 = CGRectGetMinX(v56);
    v57.origin.CGFloat x = v15;
    v57.origin.CGFloat y = v12;
    v57.size.CGFloat width = v37;
    v57.size.CGFloat height = v38;
    CGFloat v23 = CGRectGetMinY(v57);
    v58.origin.CGFloat x = x;
    v58.origin.CGFloat y = y;
    v58.size.CGFloat width = v14;
    v58.size.CGFloat height = v13;
    v59.size.CGFloat width = CGRectGetWidth(v58);
    v59.size.CGFloat height = 90.0;
    v59.origin.CGFloat x = v22;
    v59.origin.CGFloat y = v23;
    v72.origin.CGFloat x = x;
    v72.origin.CGFloat y = y;
    v72.size.CGFloat width = v14;
    v72.size.CGFloat height = v13;
    CGRect v60 = CGRectUnion(v59, v72);
    CGFloat x = v60.origin.x;
    CGFloat y = v60.origin.y;
    CGFloat v14 = v60.size.width;
    CGFloat v13 = v60.size.height;
  }
  v61.origin.CGFloat x = x;
  v61.origin.CGFloat y = y;
  v61.size.CGFloat width = v14;
  v61.size.CGFloat height = v13;
  double v24 = CGRectGetMinY(v61);
  v62.origin.CGFloat x = v15;
  v62.origin.CGFloat y = v12;
  v62.size.CGFloat width = v37;
  v62.size.CGFloat height = v38;
  if (v24 >= CGRectGetMaxY(v62))
  {
    v63.origin.CGFloat x = x;
    v63.origin.CGFloat y = y;
    v63.size.CGFloat width = v14;
    v63.size.CGFloat height = v13;
    CGFloat v25 = CGRectGetMinX(v63);
    v64.origin.CGFloat x = v15;
    v64.origin.CGFloat y = v12;
    v64.size.CGFloat width = v37;
    v64.size.CGFloat height = v38;
    CGFloat v26 = CGRectGetMaxY(v64) + -90.0;
    v65.origin.CGFloat x = x;
    v65.origin.CGFloat y = y;
    v65.size.CGFloat width = v14;
    v65.size.CGFloat height = v13;
    v66.size.CGFloat width = CGRectGetWidth(v65);
    v66.size.CGFloat height = 90.0;
    v66.origin.CGFloat x = v25;
    v66.origin.CGFloat y = v26;
    v73.origin.CGFloat x = x;
    v73.origin.CGFloat y = y;
    v73.size.CGFloat width = v14;
    v73.size.CGFloat height = v13;
    CGRect v67 = CGRectUnion(v66, v73);
    CGFloat x = v67.origin.x;
    CGFloat y = v67.origin.y;
    CGFloat v14 = v67.size.width;
    CGFloat v13 = v67.size.height;
  }
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v68.origin.CGFloat x = x;
  v68.origin.CGFloat y = y;
  v68.size.CGFloat width = v14;
  v68.size.CGFloat height = v13;
  v74.origin.CGFloat x = v15;
  v74.origin.CGFloat y = v12;
  v74.size.CGFloat width = v37;
  v74.size.CGFloat height = v38;
  BOOL v28 = CGRectIntersectsRect(v68, v74);
  if (has_internal_diagnostics)
  {
    if (!v28)
    {
      double v33 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)double v40 = 0;
        _os_log_fault_impl(&dword_1853B0000, v33, OS_LOG_TYPE_FAULT, "Getting an overlapping rect failed to actually overlap.", v40, 2u);
      }
    }
  }
  else if (!v28)
  {
    double v34 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_rectThatJustBarelyIntersectsRect_startingRect____s_category)+ 8);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v34, OS_LOG_TYPE_ERROR, "Getting an overlapping rect failed to actually overlap.", buf, 2u);
    }
  }
  double v29 = x;
  double v30 = y;
  double v31 = v14;
  double v32 = v13;
  result.size.CGFloat height = v32;
  result.size.CGFloat width = v31;
  result.origin.CGFloat y = v30;
  result.origin.CGFloat x = v29;
  return result;
}

- (CGRect)_viewSearchRectForSnapshotRect:(CGRect)a3
{
  -[_UIFocusRegionMap _viewSearchRectForFocusedFrame:focusCandidateSearchRect:includesFocusedFrame:](self, "_viewSearchRectForFocusedFrame:focusCandidateSearchRect:includesFocusedFrame:", 0, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24), a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (CGRect)_viewSearchRectForFocusedFrame:(CGRect)a3 focusCandidateSearchRect:(CGRect)a4 includesFocusedFrame:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v11 = [(_UIFocusRegionMap *)self rootView];
  CGFloat v12 = [v11 _window];
  [v12 bounds];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  v49.origin.double x = v14;
  v49.origin.double y = v16;
  v49.size.double width = v18;
  v49.size.double height = v20;
  v52.origin.double x = x;
  v52.origin.double y = y;
  v52.size.double width = width;
  v52.size.double height = height;
  if (!CGRectIntersectsRect(v49, v52))
  {
    double v21 = self;
    double v22 = v14;
    double v23 = v16;
    double v24 = v18;
    double v25 = v20;
    goto LABEL_6;
  }
  if (v5)
  {
    v53.origin.double x = x;
    v53.origin.double y = y;
    v53.size.double width = width;
    v53.size.double height = height;
    if (!CGRectIntersectsRect(a3, v53))
    {
      double v21 = self;
      double v22 = a3.origin.x;
      double v23 = a3.origin.y;
      double v24 = a3.size.width;
      double v25 = a3.size.height;
LABEL_6:
      -[_UIFocusRegionMap _rectThatJustBarelyIntersectsRect:startingRect:](v21, "_rectThatJustBarelyIntersectsRect:startingRect:", v22, v23, v24, v25, x, y, width, height);
      double x = v26;
      double y = v27;
      double width = v28;
      double height = v29;
    }
  }
  double v30 = [(_UIFocusRegionMap *)self rootView];

  if (v30)
  {
    double v31 = [(_UIFocusRegionMap *)self rootView];
    [v31 _focusRegionFrame];
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;

    v50.origin.double x = v33;
    v50.origin.double y = v35;
    v50.size.double width = v37;
    v50.size.double height = v39;
    v54.origin.double x = x;
    v54.origin.double y = y;
    v54.size.double width = width;
    v54.size.double height = height;
    if (!CGRectIntersectsRect(v50, v54))
    {
      -[_UIFocusRegionMap _rectThatJustBarelyIntersectsRect:startingRect:](self, "_rectThatJustBarelyIntersectsRect:startingRect:", v33, v35, v37, v39, x, y, width, height);
      double x = v40;
      double y = v41;
      double width = v42;
      double height = v43;
    }
  }
  double v44 = x;
  double v45 = y;
  double v46 = width;
  double v47 = height;
  result.size.double height = v47;
  result.size.double width = v46;
  result.origin.double y = v45;
  result.origin.double x = v44;
  return result;
}

- (id)_contextWithSourceView:(id)a3 focusedRegion:(id)a4 movement:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  double v11 = [_UIFocusMovementRequest alloc];
  CGFloat v12 = [(_UIFocusRegionMap *)self focusSystem];
  double v13 = [(_UIFocusMovementRequest *)v11 initWithFocusSystem:v12];

  CGFloat v14 = +[_UIFocusItemInfo infoWithView:v10];

  [(_UIFocusMovementRequest *)v13 setFocusedItemInfo:v14];
  [(_UIFocusMovementRequest *)v13 setMovementInfo:v9];

  double v15 = [UIFocusUpdateContext alloc];
  CGFloat v16 = [v8 _focusRegionView];
  id v17 = [(UIFocusUpdateContext *)v15 _initWithFocusMovementRequest:v13 nextFocusedItem:v16];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v17 _setFocusedGuide:v8];
  }

  return v17;
}

- (id)_contextWithSourceView:(id)a3 focusedContainerGuide:(id)a4 movement:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  double v11 = [_UIFocusMovementRequest alloc];
  CGFloat v12 = [(_UIFocusRegionMap *)self focusSystem];
  double v13 = [(_UIFocusMovementRequest *)v11 initWithFocusSystem:v12];

  CGFloat v14 = +[_UIFocusItemInfo infoWithView:v10];

  [(_UIFocusMovementRequest *)v13 setFocusedItemInfo:v14];
  [(_UIFocusMovementRequest *)v13 setMovementInfo:v8];

  double v15 = [v9 preferredFocusedView];
  id v16 = [[UIFocusUpdateContext alloc] _initWithFocusMovementRequest:v13 nextFocusedItem:v15];
  [v16 _setFocusedGuide:v9];

  return v16;
}

- (id)debugQuickLookObject
{
  v2 = [(_UIFocusRegionMap *)self lastSnapshot];
  double v3 = [v2 visualRepresentation];

  return v3;
}

- (BOOL)_containsFocusableRegionForView:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(_UIFocusRegionMap *)self rootView];
  double v6 = [(_UIFocusRegionMap *)self focusSystem];
  id v7 = +[_UIFocusRegionMapSnapshotRequest requestWithRootView:v5 focusSystem:v6];

  [v4 _focusRegionFrame];
  objc_msgSend(v7, "setSnapshotRect:");
  [v7 snapshotRect];
  -[_UIFocusRegionMap _viewSearchRectForSnapshotRect:](self, "_viewSearchRectForSnapshotRect:");
  objc_msgSend(v7, "setViewSearchRect:");
  id v8 = [v4 _focusSystem];
  id v9 = [v8 _focusedView];
  [v9 _focusRegionFrame];
  objc_msgSend(v7, "setFocusedRect:");

  id v10 = [v7 takeSnapshot];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  double v11 = objc_msgSend(v10, "allFocusableRegionMapEntries", 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v11);
        }
        id v15 = [*(id *)(*((void *)&v17 + 1) + 8 * i) focusableRegion];

        if (v15 == v4)
        {
          LOBYTE(v12) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v12;
}

- (UIView)rootView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rootView);
  return (UIView *)WeakRetained;
}

- (void)setRootView:(id)a3
{
}

- (UIFocusSystem)focusSystem
{
  return self->_focusSystem;
}

- (void)setFocusSystem:(id)a3
{
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

- (void)setMinimumSearchArea:(CGRect)a3
{
  self->_minimumSearchArea = a3;
}

- (_UIFocusRegionMapSnapshot)lastSnapshot
{
  return self->_lastSnapshot;
}

- (void)setLastSnapshot:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSnapshot, 0);
  objc_storeStrong((id *)&self->_focusSystem, 0);
  objc_destroyWeak((id *)&self->_rootView);
}

@end