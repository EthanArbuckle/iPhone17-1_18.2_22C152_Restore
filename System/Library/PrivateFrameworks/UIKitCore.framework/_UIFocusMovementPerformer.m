@interface _UIFocusMovementPerformer
- (BOOL)_isMovementValidForFocusSequences:(id)a3;
- (BOOL)performFocusMovement:(id)a3;
- (CGRect)_minimumSearchAreaForContainer:(id)a3 inCoordinateSpace:(id)a4;
- (CGRect)_minimumSearchAreaForContainer:(id)a3 inCoordinateSpace:(id)a4 shouldLoadScrollableContainer:(BOOL)a5;
- (_UIFocusMovementPerformerDelegate)delegate;
- (id)__findFocusCandidateInEnvironment:(id)a3 container:(id)a4 forRequest:(id)a5 minimumSearchArea:(CGRect)a6 isLoadingScrollableContainer:(BOOL)a7;
- (id)_bestCandidateForLinearFocusMovement:(id)a3;
- (id)_bestCandidateForNonLinearFocusMovement:(id)a3;
- (id)_dummyFocusItemForFocusMovement:(id)a3 searchArea:(CGRect)a4 parent:(id)a5;
- (id)_environmentContainersToCheckForRequest:(id)a3;
- (id)_findFocusCandidateByExhaustivelySearchingEnvironment:(id)a3 scrollableContainer:(id)a4 forRequest:(id)a5;
- (id)_findFocusCandidateBySearchingLinearFocusMovementSequencesForRequest:(id)a3;
- (id)_findFocusCandidateWithoutLoadingScrollableContentInEnvironment:(id)a3 container:(id)a4 forRequest:(id)a5 minimumSearchArea:(CGRect)a6;
- (id)_nextLinearCandidateLoadingScrollableContentForRequest:(id)a3;
- (id)contextForFocusMovement:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation _UIFocusMovementPerformer

- (BOOL)performFocusMovement:(id)a3
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIFocus", &_MergedGlobals_1048);
  v7 = *(id *)(CategoryCachedImpl + 8);
  if (os_signpost_id_make_with_pointer(*(os_log_t *)(CategoryCachedImpl + 8), v5) - 1 <= 0xFFFFFFFFFFFFFFFDLL
    && os_signpost_enabled(v7))
  {
    _os_signpost_emit_unreliably_with_name_impl();
  }

  if (!v5)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"_UIFocusMovementPerformer.m", 50, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];

    LOBYTE(self) = 0;
    v11 = 0;
    id v10 = 0;
    goto LABEL_30;
  }
  id v8 = v5;
  char v9 = 0;
  id v10 = 0;
  v11 = v8;
  do
  {
    v12 = [v11 focusSystem];
    if (([v8 overridesDeferredFocusUpdate] & 1) == 0
      && ([v12 _performDeferredFocusUpdateIfAvailable] & 1) != 0)
    {
      LOBYTE(self) = 1;
      goto LABEL_33;
    }
    v13 = [v11 movementInfo];
    if (v13)
    {
      v14 = [(_UIFocusMovementPerformer *)self contextForFocusMovement:v11];
      if ([v14 _isValidInFocusSystem:v12])
      {
        int v15 = [v12 _updateFocusImmediatelyWithContext:v14];
        if (!v10) {
          goto LABEL_13;
        }
      }
      else
      {
        int v15 = 0;
        if (!v10) {
LABEL_13:
        }
          id v10 = v14;
      }

      if (v15)
      {

        goto LABEL_22;
      }
      char v9 = 1;
    }
    uint64_t v16 = [v11 fallbackRequest];

    v11 = (void *)v16;
  }
  while (v16);
  if ((v9 & 1) == 0) {
    goto LABEL_28;
  }
  v17 = [(_UIFocusMovementPerformer *)self delegate];
  if (v17)
  {
    v18 = v17;
    char v19 = [v17 _handleFailedFocusMovementRequest:v8 withPerformer:self];

    if (v19)
    {
      v11 = 0;
LABEL_22:
      LOBYTE(self) = 1;
      goto LABEL_30;
    }
  }
  v20 = [v8 focusSystem];
  LODWORD(self) = [v20 _postsFocusUpdateNotifications];

  if (self)
  {
    if (!v10) {
      id v10 = [[UIFocusUpdateContext alloc] _initWithFocusMovementRequest:v8 nextFocusedItem:0];
    }
    v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v22 = [v8 focusSystem];
    v27 = @"UIFocusUpdateContextKey";
    v28[0] = v10;
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    [v21 postNotificationName:@"UIFocusMovementDidFailNotification" object:v22 userInfo:v23];

LABEL_28:
    LOBYTE(self) = 0;
  }
  v11 = 0;
LABEL_30:
  unint64_t v24 = __UILogGetCategoryCachedImpl("UIFocus", &qword_1EB260728);
  v12 = *(id *)(v24 + 8);
  if (os_signpost_id_make_with_pointer(*(os_log_t *)(v24 + 8), v5) - 1 <= 0xFFFFFFFFFFFFFFFDLL
    && os_signpost_enabled(v12))
  {
    _os_signpost_emit_unreliably_with_name_impl();
  }
LABEL_33:

  return (char)self;
}

- (id)__findFocusCandidateInEnvironment:(id)a3 container:(id)a4 forRequest:(id)a5 minimumSearchArea:(CGRect)a6 isLoadingScrollableContainer:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = [v14 focusSystem];
  v18 = [v17 focusItemContainer];
  char v19 = [v18 coordinateSpace];

  v20 = _UIFocusRegionContainerFromEnvironmentAndContainer((uint64_t)v16, (uint64_t)v15);

  v21 = [_UIFocusMap alloc];
  v22 = [v14 focusSystem];
  v23 = [v14 searchInfo];
  unint64_t v24 = [(_UIFocusMap *)v21 initWithFocusSystem:v22 rootContainer:v20 coordinateSpace:v19 searchInfo:v23 ignoresRootContainerClippingRect:v7];

  -[_UIFocusMap setMinimumSearchArea:](v24, "setMinimumSearchArea:", x, y, width, height);
  [(_UIFocusMap *)v24 _beginTrackingSearches];
  v25 = [(_UIFocusMap *)v24 _nextFocusedItemForFocusMovementRequest:v14];
  v26 = [(_UIFocusMap *)v24 _stopTrackingSearches];
  id v27 = [[UIFocusUpdateContext alloc] _initWithFocusMovementRequest:v14 nextFocusedItem:v25];

  [v27 _setFocusMapSearchInfo:v26];
  v28 = [(_UIFocusMap *)v24 focusGroupMap];
  [v27 _updateWithFocusGroupMap:v28];

  return v27;
}

- (id)_findFocusCandidateWithoutLoadingScrollableContentInEnvironment:(id)a3 container:(id)a4 forRequest:(id)a5 minimumSearchArea:(CGRect)a6
{
  return -[_UIFocusMovementPerformer __findFocusCandidateInEnvironment:container:forRequest:minimumSearchArea:isLoadingScrollableContainer:](self, "__findFocusCandidateInEnvironment:container:forRequest:minimumSearchArea:isLoadingScrollableContainer:", a3, a4, a5, 0, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
}

- (id)_findFocusCandidateByExhaustivelySearchingEnvironment:(id)a3 scrollableContainer:(id)a4 forRequest:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v10 focusSystem];
  v12 = [v10 focusedItemInfo];
  v13 = [v10 movementInfo];
  id v14 = [v11 focusItemContainer];
  id v15 = [v14 coordinateSpace];
  [v15 bounds];
  CGFloat v64 = v17;
  CGFloat v65 = v16;
  CGFloat v62 = v19;
  CGFloat v63 = v18;

  v20 = [v11 focusItemContainer];
  uint64_t v21 = [v20 coordinateSpace];

  v61 = v12;
  [v12 focusedRectInCoordinateSpace:v21];
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  v60 = (void *)v21;
  [(_UIFocusMovementPerformer *)self _minimumSearchAreaForContainer:v9 inCoordinateSpace:v21];
  CGFloat v31 = v30;
  CGFloat v33 = v32;
  CGFloat v35 = v34;
  CGFloat v37 = v36;
  [v13 heading];
  double v38 = _UIFocusShiftAndExpandRectAlongFocusMovement(v13, v23, v25, v27, v29);
  CGFloat v40 = v39;
  CGFloat v42 = v41;
  CGFloat v44 = v43;
  v45 = 0;
  uint64_t v46 = -5;
  while ((_UIRectSmartIntersectsRect(v38, v40, v42, v44, v31, v33, v35, v37) & 1) != 0 || !v45)
  {
    __int16 v47 = [v13 _linearHeading];
    double v48 = v38;
    double v49 = v40;
    double v50 = v42;
    double v51 = v44;
    if ((v47 & 0x300) == 0)
    {
      v67.origin.double y = v64;
      v67.origin.double x = v65;
      v67.size.double height = v62;
      v67.size.double width = v63;
      v68.origin.double x = v38;
      v68.origin.double y = v40;
      v68.size.double width = v42;
      v68.size.double height = v44;
      *(CGRect *)&double v48 = CGRectUnion(v67, v68);
    }
    v52 = -[_UIFocusMovementPerformer __findFocusCandidateInEnvironment:container:forRequest:minimumSearchArea:isLoadingScrollableContainer:](self, "__findFocusCandidateInEnvironment:container:forRequest:minimumSearchArea:isLoadingScrollableContainer:", v8, v9, v10, 1, v48, v49, v50, v51);

    if (([v52 _isValidInFocusSystem:v11] & 1) == 0)
    {
      v53 = [v52 _focusMapSearchInfo];
      char v54 = [v53 didFindFocusBlockingBoundary];

      if ((v54 & 1) == 0)
      {
        double v38 = _UIFocusShiftAndExpandRectAlongFocusMovement(v13, v38, v40, v42, v44);
        CGFloat v40 = v55;
        CGFloat v42 = v56;
        CGFloat v44 = v57;
        v45 = v52;
        if (!__CFADD__(v46++, 1)) {
          continue;
        }
      }
    }
    goto LABEL_12;
  }
  v52 = v45;
LABEL_12:

  return v52;
}

- (id)_findFocusCandidateBySearchingLinearFocusMovementSequencesForRequest:(id)a3
{
  id v3 = a3;
  v4 = [v3 focusSystem];
  id v5 = [v3 focusedItemInfo];
  v6 = [v5 item];

  BOOL v7 = [v3 movementInfo];
  uint64_t v8 = [v7 heading];

  uint64_t v22 = 0;
  CGFloat v23 = &v22;
  uint64_t v24 = 0x3032000000;
  CGFloat v25 = __Block_byref_object_copy__91;
  double v26 = __Block_byref_object_dispose__91;
  id v27 = 0;
  id v9 = [v3 focusedItemInfo];
  id v10 = [v9 item];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __98___UIFocusMovementPerformer__findFocusCandidateBySearchingLinearFocusMovementSequencesForRequest___block_invoke;
  v16[3] = &unk_1E52EE6A8;
  uint64_t v21 = v8;
  id v11 = v6;
  id v17 = v11;
  id v12 = v4;
  id v18 = v12;
  id v13 = v3;
  id v19 = v13;
  v20 = &v22;
  _UIFocusEnvironmentEnumerateAncestorEnvironments(v10, v16);

  id v14 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v14;
}

- (id)_bestCandidateForNonLinearFocusMovement:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 focusSystem];
  v6 = [v4 focusedItemInfo];
  __int16 v47 = v5;
  BOOL v7 = [v5 focusItemContainer];
  uint64_t v8 = [v7 coordinateSpace];

  double v48 = v4;
  [(_UIFocusMovementPerformer *)self _environmentContainersToCheckForRequest:v4];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = 0;
    uint64_t v12 = *(void *)v51;
    v45 = v6;
    do
    {
      id v13 = v8;
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v51 != v12) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v50 + 1) + 8 * v14);
        double v16 = objc_msgSend(v15, "owningEnvironment", v45);
        id v17 = [v15 itemContainer];
        if ([v15 isScrollableContainer]
          && ([v48 movementInfo],
              id v18 = objc_claimAutoreleasedReturnValue(),
              int v19 = [v18 _shouldLoadScrollableContainer],
              v18,
              v19))
        {
          v20 = [(_UIFocusMovementPerformer *)self _findFocusCandidateByExhaustivelySearchingEnvironment:v16 scrollableContainer:v17 forRequest:v48];

          if (v20)
          {
            if ([v20 _isValidInFocusSystem:v47]) {
              goto LABEL_19;
            }
            uint64_t v21 = [v20 _focusMapSearchInfo];
            char v22 = [v21 didFindFocusBlockingBoundary];

            id v11 = v20;
            if (v22) {
              goto LABEL_19;
            }
          }
          else
          {
            id v11 = 0;
          }
        }
        else
        {
          [(_UIFocusMovementPerformer *)self _minimumSearchAreaForContainer:v17 inCoordinateSpace:v13];
          v20 = -[_UIFocusMovementPerformer _findFocusCandidateWithoutLoadingScrollableContentInEnvironment:container:forRequest:minimumSearchArea:](self, "_findFocusCandidateWithoutLoadingScrollableContentInEnvironment:container:forRequest:minimumSearchArea:", v16, v17, v48);

          if (([v20 _isValidInFocusSystem:v47] & 1) != 0
            || ([v20 _focusMapSearchInfo],
                CGFloat v23 = objc_claimAutoreleasedReturnValue(),
                int v24 = [v23 didFindFocusBlockingBoundary],
                v23,
                id v11 = v20,
                v24))
          {
LABEL_19:

            id v11 = v20;
            v6 = v45;
            uint64_t v8 = v13;
            goto LABEL_21;
          }
        }

        ++v14;
      }
      while (v10 != v14);
      uint64_t v25 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
      uint64_t v10 = v25;
      v6 = v45;
      uint64_t v8 = v13;
    }
    while (v25);
  }
  else
  {
    id v11 = 0;
  }
LABEL_21:

  if (os_variant_has_internal_diagnostics())
  {
    if (!v11)
    {
      double v43 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v43, OS_LOG_TYPE_FAULT, "Non-linear focus movement should always produce a context, even if the focus movement failed.", buf, 2u);
      }
    }
  }
  else if (!v11)
  {
    CGFloat v44 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_bestCandidateForNonLinearFocusMovement____s_category)
                       + 8);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v44, OS_LOG_TYPE_ERROR, "Non-linear focus movement should always produce a context, even if the focus movement failed.", buf, 2u);
    }
  }
  double v26 = [v11 _destinationItemInfo];
  uint64_t v27 = _UIFocusEngineCommonEnvironmentScrollableContainerForItems(v6, v26);
  double v28 = (void *)v27;
  if (v26 && !v27)
  {
    double v28 = _UIFocusEngineFirstScrollableContainerTupleThatScrollsForItem(v26);
  }
  [v11 _setCommonEnvironmentScrollableContainer:v28];
  CGFloat v29 = [v26 focusedRegion];
  if (v29)
  {
    +[_UIFocusRegionEvaluator frameForRegion:v29 inCoordinateSpace:v8];
    CGFloat v31 = v30;
    CGFloat v33 = v32;
    CGFloat v35 = v34;
    CGFloat v37 = v36;
    [v8 bounds];
    objc_msgSend(v11, "_setDestinationViewDistanceOffscreen:", UIDistanceBetweenRects(v38, v39, v40, v41, v31, v33, v35, v37));
  }

  return v11;
}

- (id)_bestCandidateForLinearFocusMovement:(id)a3
{
  id v4 = a3;
  id v5 = [v4 focusSystem];
  v6 = [v4 focusedItemInfo];
  BOOL v7 = [v4 movementInfo];
  uint64_t v8 = [v6 containingView];
  [v7 heading];
  uint64_t v9 = [v5 _focusMovementCache];
  uint64_t v10 = [v9 nextItemForRequest:v4];

  if (!v10
    || (id v11 = [[UIFocusUpdateContext alloc] _initWithFocusMovementRequest:v4 nextFocusedItem:v10]) == 0)
  {
    id v11 = [(_UIFocusMovementPerformer *)self _findFocusCandidateBySearchingLinearFocusMovementSequencesForRequest:v4];
    if (!v11)
    {
      id v11 = [(_UIFocusMovementPerformer *)self _nextLinearCandidateLoadingScrollableContentForRequest:v4];
    }
  }
  uint64_t v12 = [v11 _destinationItemInfo];
  uint64_t v13 = _UIFocusEngineCommonEnvironmentScrollableContainerForItems(v6, v12);
  uint64_t v14 = (void *)v13;
  if (v12 && !v13)
  {
    uint64_t v14 = _UIFocusEngineFirstScrollableContainerTupleThatScrollsForItem(v12);
  }
  [v11 _setCommonEnvironmentScrollableContainer:v14];

  return v11;
}

- (id)contextForFocusMovement:(id)a3
{
  id v4 = a3;
  id v5 = [v4 movementInfo];
  __int16 v6 = [v5 heading];

  if ((v6 & 0x330) != 0) {
    [(_UIFocusMovementPerformer *)self _bestCandidateForLinearFocusMovement:v4];
  }
  else {
  BOOL v7 = [(_UIFocusMovementPerformer *)self _bestCandidateForNonLinearFocusMovement:v4];
  }

  return v7;
}

- (id)_environmentContainersToCheckForRequest:(id)a3
{
  id v3 = a3;
  id v4 = [v3 movementInfo];
  id v5 = [v3 focusedItemInfo];
  __int16 v6 = [v3 focusSystem];
  if (([v4 heading] & 0x300) != 0)
  {
    BOOL v7 = [v6 behavior];
    char v8 = [v7 treatFirstAndLastHeadingsAsGlobal];
  }
  else
  {
    char v8 = 0;
  }
  uint64_t v9 = [v4 heading];
  uint64_t v10 = objc_opt_new();
  id v11 = [v5 item];
  double v26 = [v6 behavior];
  uint64_t v27 = v3;
  uint64_t v12 = [v3 searchInfo];
  char v13 = [v12 forceFocusToLeaveContainer];

  if (v11)
  {
    char v14 = v13 | v8;
    while (1)
    {
      id v15 = [v11 focusItemContainer];
      if (v15) {
        break;
      }
LABEL_17:
      uint64_t v18 = [v11 parentFocusEnvironment];

      id v11 = (void *)v18;
      if (!v18) {
        goto LABEL_18;
      }
    }
    double v16 = +[_UIFocusEnvironmentContainerTuple tupleWithOwningEnvironment:v11 itemContainer:v15];
    if (v14 & 1) != 0 || (_UIFocusEnvironmentAllowsFocusToLeaveViaHeading(v11, v9))
    {
      id v17 = [v5 item];
      if (v11 == v17 || !_UIFocusEnvironmentPrefersFocusContainment(v11))
      {

        goto LABEL_16;
      }

      if ((v14 & 1) == 0)
      {
        [v10 addObject:v16];
        char v14 = 0;
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {
      [v10 addObject:v16];
    }
    char v14 = 1;
    goto LABEL_16;
  }
LABEL_18:
  int v19 = [v10 lastObject];
  v20 = [v19 owningEnvironment];

  if (v20 != v6)
  {
    uint64_t v21 = [v6 focusItemContainer];
    if (v21)
    {
      char v22 = +[_UIFocusEnvironmentContainerTuple tupleWithOwningEnvironment:v6 itemContainer:v21];
      [v10 addObject:v22];
    }
    else if (os_variant_has_internal_diagnostics())
    {
      uint64_t v25 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)CGFloat v29 = 0;
        _os_log_fault_impl(&dword_1853B0000, v25, OS_LOG_TYPE_FAULT, "FocusSystem does not have a focusItemContainer.", v29, 2u);
      }
    }
    else
    {
      CGFloat v23 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_environmentContainersToCheckForRequest____s_category)+ 8);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v23, OS_LOG_TYPE_ERROR, "FocusSystem does not have a focusItemContainer.", buf, 2u);
      }
    }
  }
  return v10;
}

- (id)_dummyFocusItemForFocusMovement:(id)a3 searchArea:(CGRect)a4 parent:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v12 = a3;
  id v13 = a5;
  if (!v13)
  {
    double v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"_UIFocusMovementPerformer.m", 483, @"Invalid parameter not satisfying: %@", @"parent != nil" object file lineNumber description];
  }
  if (([v12 heading] & 0x300) != 0)
  {
    char v14 = [v13 focusItemContainer];
    id v15 = [v14 coordinateSpace];
    [v15 bounds];
    double MaxX = v16;
    double MaxY = v18;
    double v21 = v20;
    double v23 = v22;

    if (([v12 _shouldLoadScrollableContainer] & 1) == 0)
    {
      double MaxX = *MEMORY[0x1E4F1DB28];
      double MaxY = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
    if (([v12 heading] & 0x100) != 0)
    {
      double MaxX = x - v21;
      double MaxY = y - v23;
    }
    else if (([v12 heading] & 0x200) != 0)
    {
      v28.origin.double x = x;
      v28.origin.double y = y;
      v28.size.CGFloat width = width;
      v28.size.CGFloat height = height;
      double MaxX = CGRectGetMaxX(v28);
      v29.origin.double x = x;
      v29.origin.double y = y;
      v29.size.CGFloat width = width;
      v29.size.CGFloat height = height;
      double MaxY = CGRectGetMaxY(v29);
    }
    int v24 = objc_opt_new();
    objc_msgSend(v24, "setFrame:", MaxX, MaxY, v21, v23);
    [v24 setParentFocusEnvironment:v13];
  }
  else
  {
    int v24 = 0;
  }

  return v24;
}

- (id)_nextLinearCandidateLoadingScrollableContentForRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 focusSystem];
  __int16 v6 = [v4 focusedItemInfo];
  BOOL v7 = [v4 movementInfo];
  v96 = v6;
  char v8 = [v6 item];
  uint64_t v9 = [(_UIFocusMovementPerformer *)self _environmentContainersToCheckForRequest:v4];
  if (![v9 count])
  {
    double v56 = 0;
    goto LABEL_51;
  }
  v83 = v8;
  uint64_t v10 = 0;
  LOBYTE(v8) = 1;
  v97 = v5;
  v98 = v4;
  v99 = v9;
  v100 = self;
  while (1)
  {
    char v103 = (char)v8;
    id v11 = [v9 objectAtIndexedSubscript:v10];
    v105 = [v11 owningEnvironment];
    id v12 = [v11 itemContainer];
    id v13 = [v5 focusItemContainer];
    char v14 = [v13 coordinateSpace];
    -[_UIFocusMovementPerformer _minimumSearchAreaForContainer:inCoordinateSpace:shouldLoadScrollableContainer:](self, "_minimumSearchAreaForContainer:inCoordinateSpace:shouldLoadScrollableContainer:", v12, v14, [v7 _shouldLoadScrollableContainer]);
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;

    uint64_t v23 = -[_UIFocusMovementPerformer _dummyFocusItemForFocusMovement:searchArea:parent:](self, "_dummyFocusItemForFocusMovement:searchArea:parent:", v7, v5, v16, v18, v20, v22);
    int v24 = [_UIFocusMovementRequest alloc];
    uint64_t v25 = [v4 focusSystem];
    double v26 = [(_UIFocusMovementRequest *)v24 initWithFocusSystem:v25];

    if (v23)
    {
      uint64_t v27 = +[_UIFocusItemInfo infoWithItem:v23];
      [(_UIFocusMovementRequest *)v26 setFocusedItemInfo:v27];
    }
    else
    {
      [(_UIFocusMovementRequest *)v26 setFocusedItemInfo:v96];
    }
    CGRect v28 = [v4 searchInfo];
    [(_UIFocusMovementRequest *)v26 setSearchInfo:v28];

    v101 = v11;
    v104 = v12;
    v102 = (void *)v23;
    if (![v11 isScrollableContainer]
      || !_UIFocusEngineScrollableContainerCanScroll(v12))
    {
      int v52 = 0;
      unint64_t v53 = 15;
      goto LABEL_12;
    }
    id rect = v12;
    CGRect v29 = [(_UIFocusMovementRequest *)v26 focusedItemInfo];
    double v30 = [v29 item];

    CGFloat v31 = [v30 parentFocusEnvironment];
    double v32 = [v31 focusItemContainer];

    v95 = v32;
    double v93 = v18;
    double v94 = v16;
    double v91 = v22;
    double v92 = v20;
    v90 = v30;
    if (!v32 || v102 == v30)
    {
      [v30 frame];
      CGFloat v45 = v63;
      CGFloat v47 = v64;
      CGFloat v49 = v65;
      CGFloat v51 = v66;
      CGFloat v42 = rect;
    }
    else
    {
      CGFloat v33 = [v32 coordinateSpace];
      [v30 frame];
      double v35 = v34;
      double v37 = v36;
      double v39 = v38;
      double v41 = v40;
      CGFloat v42 = rect;
      double v43 = [rect coordinateSpace];
      objc_msgSend(v33, "convertRect:toCoordinateSpace:", v43, v35, v37, v39, v41);
      CGFloat v45 = v44;
      CGFloat v47 = v46;
      CGFloat v49 = v48;
      CGFloat v51 = v50;
    }
    double v67 = _UIFocusItemScrollableContainerContentBounds(v42);
    CGFloat v69 = v68;
    CGFloat v84 = v70;
    CGFloat v85 = v68;
    CGFloat v72 = v71;
    CGFloat v86 = v71;
    v106.origin.double x = v45;
    v106.origin.double y = v47;
    v106.size.CGFloat width = v49;
    v106.size.CGFloat height = v51;
    CGFloat v87 = v45;
    double MinX = CGRectGetMinX(v106);
    v107.origin.double x = v67;
    v107.origin.double y = v69;
    v107.size.CGFloat width = v84;
    v107.size.CGFloat height = v72;
    if (MinX <= CGRectGetMinX(v107)) {
      unint64_t v74 = 11;
    }
    else {
      unint64_t v74 = 15;
    }
    v108.origin.double x = v45;
    v108.origin.double y = v47;
    v108.size.CGFloat width = v49;
    v108.size.CGFloat height = v51;
    CGFloat recta = v51;
    double MaxX = CGRectGetMaxX(v108);
    v109.origin.double x = v67;
    v109.origin.double y = v85;
    v109.size.CGFloat width = v84;
    v109.size.CGFloat height = v86;
    if (MaxX >= CGRectGetMaxX(v109)) {
      v74 &= 7u;
    }
    v110.origin.double x = v87;
    v110.origin.double y = v47;
    v110.size.CGFloat width = v49;
    v110.size.CGFloat height = v51;
    double MinY = CGRectGetMinY(v110);
    v111.origin.double x = v67;
    v111.origin.double y = v85;
    v111.size.CGFloat width = v84;
    v111.size.CGFloat height = v86;
    if (MinY <= CGRectGetMinY(v111)) {
      v74 &= 0xEu;
    }
    v112.origin.double x = v87;
    v112.origin.double y = v47;
    v112.size.CGFloat width = v49;
    v112.size.CGFloat height = recta;
    double MaxY = CGRectGetMaxY(v112);
    v113.origin.double x = v67;
    v113.origin.double y = v85;
    v113.size.CGFloat width = v84;
    v113.size.CGFloat height = v86;
    unint64_t v53 = MaxY >= CGRectGetMaxY(v113) ? v74 & 0xFFFFFFFFFFFFFFFDLL : v74;
    if (v103)
    {
      v78 = [v4 focusSystem];
      LODWORD(v8) = [v78 _isScrollingScrollableContainer:v42 targetContentOffset:0] ^ 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }
    double v18 = v93;
    double v16 = v94;
    double v22 = v91;
    double v20 = v92;

    if (v53) {
      break;
    }
    uint64_t v9 = v99;
    self = v100;
    v79 = v101;
LABEL_46:

    if (++v10 >= (unint64_t)[v9 count])
    {
      double v56 = 0;
      goto LABEL_50;
    }
  }
  char v103 = (char)v8;
  int v52 = 1;
LABEL_12:
  char v54 = -[_UIFocusMovementInfo initWithHeading:linearHeading:isInitial:shouldLoadScrollableContainer:looping:groupFilter:inputType:]([_UIFocusMovementInfo alloc], "initWithHeading:linearHeading:isInitial:shouldLoadScrollableContainer:looping:groupFilter:inputType:", v53, [v7 heading], objc_msgSend(v7, "_isInitialMovement"), 1, objc_msgSend(v7, "_isLooping"), objc_msgSend(v7, "_groupFilter"), objc_msgSend(v7, "_inputType"));
  [(_UIFocusMovementRequest *)v26 setMovementInfo:v54];

  if (v52 && [v7 _shouldLoadScrollableContainer])
  {
    self = v100;
    uint64_t v55 = [(_UIFocusMovementPerformer *)v100 _findFocusCandidateByExhaustivelySearchingEnvironment:v105 scrollableContainer:v104 forRequest:v26];
  }
  else
  {
    self = v100;
    uint64_t v55 = -[_UIFocusMovementPerformer _findFocusCandidateWithoutLoadingScrollableContentInEnvironment:container:forRequest:minimumSearchArea:](v100, "_findFocusCandidateWithoutLoadingScrollableContentInEnvironment:container:forRequest:minimumSearchArea:", v105, v104, v26, v16, v18, v20, v22);
  }
  double v56 = (void *)v55;
  id v5 = v97;
  id v4 = v98;
  uint64_t v9 = v99;
  double v57 = [v98 movementInfo];
  [v56 _restoreRestrictedFocusMovementWithMovement:v57];

  if (![v56 _isValidInFocusSystem:v97]
    || ![(_UIFocusMovementPerformer *)self _isMovementValidForFocusSequences:v56])
  {
    v58 = [0 _focusMapSearchInfo];
    char v59 = [v58 didFindFocusBlockingBoundary];

    if ((v59 & 1) == 0)
    {
      if (v103)
      {
        if (v10 == [v99 count] - 1)
        {
          uint64_t v60 = [v56 previouslyFocusedItem];
          if (v60
            && (v61 = (void *)v60,
                [v56 nextFocusedItem],
                CGFloat v62 = objc_claimAutoreleasedReturnValue(),
                v62,
                v61,
                !v62))
          {
            uint64_t v80 = +[_UIFocusItemInfo infoWithItem:0];

            LOBYTE(v8) = 0;
            --v10;
            v96 = (void *)v80;
          }
          else
          {
            LOBYTE(v8) = 0;
          }
          self = v100;
        }
        else
        {
          LOBYTE(v8) = 1;
        }
      }
      else
      {
        LOBYTE(v8) = 0;
      }
      v79 = v101;

      goto LABEL_46;
    }
  }

LABEL_50:
  char v8 = v83;
LABEL_51:
  id v81 = v56;

  return v81;
}

- (BOOL)_isMovementValidForFocusSequences:(id)a3
{
  id v3 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 1;
  uint64_t v4 = [v3 focusHeading];
  id v5 = [v3 nextFocusedItem];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63___UIFocusMovementPerformer__isMovementValidForFocusSequences___block_invoke;
  v8[3] = &unk_1E52EE6F8;
  id v6 = v3;
  id v9 = v6;
  uint64_t v10 = &v12;
  uint64_t v11 = v4;
  _UIFocusEnvironmentEnumerateAncestorEnvironments(v5, v8);

  LOBYTE(v5) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)v5;
}

- (CGRect)_minimumSearchAreaForContainer:(id)a3 inCoordinateSpace:(id)a4
{
  [(_UIFocusMovementPerformer *)self _minimumSearchAreaForContainer:a3 inCoordinateSpace:a4 shouldLoadScrollableContainer:1];
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGRect)_minimumSearchAreaForContainer:(id)a3 inCoordinateSpace:(id)a4 shouldLoadScrollableContainer:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 coordinateSpace];
  uint64_t v10 = [v7 coordinateSpace];
  [v10 bounds];
  objc_msgSend(v9, "convertRect:toCoordinateSpace:", v8);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double x = v12 + -1.0;
  double width = v16 + 2.0;
  double y = v14 + -1.0;
  double height = v18 + 2.0;
  if (v5 && _UIFocusItemContainerIsScrollableContainer(v7))
  {
    id v23 = v7;
    [v23 contentSize];
    double v25 = v24;
    double v27 = v26;
    double v28 = *MEMORY[0x1E4F1DAD8];
    double v29 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v30 = [v23 coordinateSpace];

    objc_msgSend(v8, "convertRect:fromCoordinateSpace:", v30, v28, v29, v25, v27);
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    CGFloat v36 = v35;
    CGFloat v38 = v37;

    v43.origin.double x = x;
    v43.origin.double y = y;
    v43.size.double width = width;
    v43.size.double height = height;
    v46.origin.double x = v32;
    v46.origin.double y = v34;
    v46.size.double width = v36;
    v46.size.double height = v38;
    CGRect v44 = CGRectUnion(v43, v46);
    double x = v44.origin.x;
    double y = v44.origin.y;
    double width = v44.size.width;
    double height = v44.size.height;
  }

  double v39 = x;
  double v40 = y;
  double v41 = width;
  double v42 = height;
  result.size.double height = v42;
  result.size.double width = v41;
  result.origin.double y = v40;
  result.origin.double x = v39;
  return result;
}

- (_UIFocusMovementPerformerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIFocusMovementPerformerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end