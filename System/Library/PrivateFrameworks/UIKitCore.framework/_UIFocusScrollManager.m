@interface _UIFocusScrollManager
- (BOOL)_scrollWithScrollRequest:(id)a3 onlyIfNecessary:(BOOL)a4;
- (BOOL)isScrollingScrollableContainer:(id)a3;
- (CGPoint)contentOffsetForEnvironmentScrollableContainer:(id)a3 toShowFocusItem:(id)a4 targetOffset:(CGPoint)a5;
- (CGPoint)contentOffsetForEnvironmentScrollableContainer:(id)a3 toShowRect:(CGRect)a4 targetOffset:(CGPoint)a5;
- (CGPoint)currentVelocityForScrollableContainer:(id)a3;
- (CGPoint)targetContentOffsetForScrollableContainer:(id)a3;
- (NSHashTable)stackVisitedScrollingContainers;
- (UIScreen)screen;
- (_UIFocusDisplayLinkScrollAnimator)scrollAnimator;
- (_UIFocusScrollManager)initWithScreen:(id)a3;
- (void)_ensureFocusItemIsOnscreenForScrollRequest:(id)a3;
- (void)adjustTargetContentOffsetForScrollableContainer:(id)a3 byDelta:(CGPoint)a4;
- (void)animateOffsetOfEnvironmentScrollableContainer:(id)a3 toShowFocusItem:(id)a4;
- (void)animateOffsetOfScrollableContainersInParentEnvironmentContainer:(id)a3 toShowFocusItem:(id)a4;
- (void)cancelScrollingForScrollableContainer:(id)a3;
- (void)performScrollingIfNeededForFocusUpdateInContext:(id)a3;
@end

@implementation _UIFocusScrollManager

- (_UIFocusScrollManager)initWithScreen:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIFocusScrollManager;
  v5 = [(_UIFocusScrollManager *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_screen, v4);
    if (v4)
    {
      v7 = [[_UIFocusDisplayLinkScrollAnimator alloc] initWithScreen:v4];
      scrollAnimator = v6->_scrollAnimator;
      v6->_scrollAnimator = v7;

      [(_UIFocusDisplayLinkScrollAnimator *)v6->_scrollAnimator setDefaultConvergenceRate:_UIGetFocusEngineScrollConvergence()];
      uint64_t v9 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      stackVisitedScrollingContainers = v6->_stackVisitedScrollingContainers;
      v6->_stackVisitedScrollingContainers = (NSHashTable *)v9;
    }
  }

  return v6;
}

- (void)performScrollingIfNeededForFocusUpdateInContext:(id)a3
{
  id v23 = a3;
  id v4 = [v23 _commonEnvironmentScrollableContainer];
  v5 = [v23 _sourceItemInfo];
  v6 = [v5 item];
  v7 = +[_UIFocusItemInfo infoWithItem:v6 useFallbackAncestorScroller:1];

  v8 = [v23 _destinationItemInfo];
  uint64_t v9 = [v8 item];
  v10 = +[_UIFocusItemInfo infoWithItem:v9 useFallbackAncestorScroller:1];

  v11 = [v23 _request];
  objc_super v12 = [v11 focusSystem];
  v13 = [v12 behavior];

  uint64_t v14 = [v13 enforcesStrictTargetContentOffsetAdjustmentBehavior];
  uint64_t v15 = [v13 scrollingMode];
  if (v15)
  {
    if (v15 == 1)
    {
      v18 = [v23 _request];
      int v19 = [v18 isMovementRequest];

      if (!v19) {
        goto LABEL_12;
      }
    }
    else
    {
      if (v15 != 2) {
        goto LABEL_12;
      }
      v16 = [v23 _request];
      char v17 = [v16 shouldScrollIfNecessary];

      if ((v17 & 1) == 0) {
        goto LABEL_12;
      }
    }
  }
  if (!v4)
  {
    id v4 = _UIFocusEngineCommonEnvironmentScrollableContainerForItems(v7, v10);
    if (!v4)
    {
      id v4 = _UIFocusEngineFirstScrollableContainerTupleThatScrollsForItem(v10);
    }
  }
  v20 = [v4 scrollableContainer];
  int CanScroll = _UIFocusEngineScrollableContainerCanScroll(v20);

  if (CanScroll)
  {
    v22 = [[_UIFocusScrollRequest alloc] initWithEnvironmentScrollableContainer:v4 focusItemInfo:v10 focusUpdateContext:v23];
    [(_UIFocusScrollManager *)self _ensureFocusItemIsOnscreenForScrollRequest:v22];
    [(_UIFocusScrollManager *)self _scrollWithScrollRequest:v22 onlyIfNecessary:v14];
  }
LABEL_12:
}

- (BOOL)isScrollingScrollableContainer:(id)a3
{
  return [(_UIFocusDisplayLinkScrollAnimator *)self->_scrollAnimator isAnimatingScrollableContainer:a3];
}

- (void)cancelScrollingForScrollableContainer:(id)a3
{
}

- (CGPoint)targetContentOffsetForScrollableContainer:(id)a3
{
  id v4 = a3;
  if ([(_UIFocusScrollManager *)self isScrollingScrollableContainer:v4]) {
    [(_UIFocusDisplayLinkScrollAnimator *)self->_scrollAnimator targetContentOffsetForScrollableContainer:v4];
  }
  else {
    [v4 contentOffset];
  }
  double v7 = v5;
  double v8 = v6;

  double v9 = v7;
  double v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (CGPoint)currentVelocityForScrollableContainer:(id)a3
{
  [(_UIFocusDisplayLinkScrollAnimator *)self->_scrollAnimator currentVelocityForScrollableContainer:a3];
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)animateOffsetOfEnvironmentScrollableContainer:(id)a3 toShowFocusItem:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v11)
  {
    if (v6)
    {
      double v7 = [v11 owningEnvironment];
      BOOL IsAncestorOfEnvironment = _UIFocusEnvironmentIsAncestorOfEnvironment(v7, v6);

      if (IsAncestorOfEnvironment)
      {
        double v9 = +[_UIFocusItemInfo infoWithItem:v6 useFallbackAncestorScroller:1];
        double v10 = [[_UIFocusScrollRequest alloc] initWithEnvironmentScrollableContainer:v11 focusItemInfo:v9 targetContentOffsetValue:0];
        [(_UIFocusScrollManager *)self _scrollWithScrollRequest:v10 onlyIfNecessary:1];
      }
    }
  }
}

- (void)animateOffsetOfScrollableContainersInParentEnvironmentContainer:(id)a3 toShowFocusItem:(id)a4
{
  id v6 = a3;
  double v7 = +[_UIFocusItemInfo infoWithItem:a4 useFallbackAncestorScroller:1];
  double v8 = [v7 ancestorEnvironmentScrollableContainers];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __105___UIFocusScrollManager_animateOffsetOfScrollableContainersInParentEnvironmentContainer_toShowFocusItem___block_invoke;
  v17[3] = &unk_1E52EDEA8;
  id v9 = v6;
  id v18 = v9;
  unint64_t v10 = [v8 indexOfObjectPassingTest:v17];
  if (v10 <= 0x7FFFFFFFFFFFFFFELL)
  {
    uint64_t v11 = 0;
    unint64_t v12 = v10 + 1;
    do
    {
      v13 = [v8 objectAtIndexedSubscript:v11];
      uint64_t v14 = [v13 scrollableContainer];
      int CanScroll = _UIFocusEngineScrollableContainerCanScroll(v14);

      if (CanScroll)
      {
        v16 = [[_UIFocusScrollRequest alloc] initWithEnvironmentScrollableContainer:v13 focusItemInfo:v7 targetContentOffsetValue:0];
        [(_UIFocusScrollManager *)self _scrollWithScrollRequest:v16 onlyIfNecessary:1];
      }
      ++v11;
    }
    while (v12 != v11);
  }
}

- (CGPoint)contentOffsetForEnvironmentScrollableContainer:(id)a3 toShowFocusItem:(id)a4 targetOffset:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v8 = a3;
  id v9 = +[_UIFocusItemInfo infoWithItem:a4 useFallbackAncestorScroller:1];
  unint64_t v10 = [_UIFocusScrollRequest alloc];
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", x, y);
  unint64_t v12 = [(_UIFocusScrollRequest *)v10 initWithEnvironmentScrollableContainer:v8 focusItemInfo:v9 targetContentOffsetValue:v11];

  [(_UIFocusScrollRequest *)v12 resolveTargetContentOffsetUsingScrollOffsetResolverClamped:1];
  double v14 = v13;
  double v16 = v15;

  double v17 = v14;
  double v18 = v16;
  result.double y = v18;
  result.double x = v17;
  return result;
}

- (CGPoint)contentOffsetForEnvironmentScrollableContainer:(id)a3 toShowRect:(CGRect)a4 targetOffset:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double height = a4.size.height;
  double width = a4.size.width;
  double v9 = a4.origin.y;
  double v10 = a4.origin.x;
  id v11 = a3;
  unint64_t v12 = [_UIFocusScrollRequest alloc];
  double v13 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", x, y);
  double v14 = -[_UIFocusScrollRequest initWithEnvironmentScrollableContainer:focusItemFrame:targetContentOffsetValue:](v12, "initWithEnvironmentScrollableContainer:focusItemFrame:targetContentOffsetValue:", v11, v13, v10, v9, width, height);

  [(_UIFocusScrollRequest *)v14 resolveTargetContentOffsetUsingScrollOffsetResolverClamped:1];
  double v16 = v15;
  double v18 = v17;

  double v19 = v16;
  double v20 = v18;
  result.double y = v20;
  result.double x = v19;
  return result;
}

- (void)adjustTargetContentOffsetForScrollableContainer:(id)a3 byDelta:(CGPoint)a4
{
}

- (BOOL)_scrollWithScrollRequest:(id)a3 onlyIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [v6 environmentScrollableContainer];
  id v8 = [v7 scrollableContainer];
  double v9 = [v7 owningEnvironment];
  double v10 = [v6 focusItemInfo];
  id v11 = _UIFocusEnvironmentRootAncestorEnvironment(v9);

  if (!v11 || [(NSHashTable *)self->_stackVisitedScrollingContainers containsObject:v8]) {
    goto LABEL_3;
  }
  double v14 = [v10 item];
  int IsFocusedOrContainsFocus = _UIFocusEnvironmentIsFocusedOrContainsFocus(v14);

  if (!IsFocusedOrContainsFocus) {
    goto LABEL_4;
  }
  [v6 originatingContentOffset];
  double v16 = v15;
  double v18 = v17;
  [v8 contentOffset];
  double v20 = v19;
  double v22 = v21;
  [v6 resolveTargetContentOffsetUsingScrollOffsetResolverClamped:1];
  double v25 = v23;
  double v26 = v24;
  v69[0] = v23;
  v69[1] = v24;
  if (!v4) {
    goto LABEL_9;
  }
  if (v23 == v16 && v24 == v18)
  {
LABEL_3:
    LOBYTE(IsFocusedOrContainsFocus) = 0;
  }
  else
  {
LABEL_9:
    [(NSHashTable *)self->_stackVisitedScrollingContainers addObject:v8];
    if (objc_msgSend(v8, "__isKindOfUIScrollView")) {
      id v27 = v8;
    }
    else {
      id v27 = 0;
    }
    double v58 = v18;
    v28 = [v27 delegate];
    [v27 _scrollViewWillBeginDragging];
    -[_UIFocusDisplayLinkScrollAnimator velocityToScrollFromOffset:toOffset:](self->_scrollAnimator, "velocityToScrollFromOffset:toOffset:", v20, v22, v25, v26);
    double v30 = v29;
    double v32 = v31;
    char v33 = objc_opt_respondsToSelector();
    long long v68 = *(_OWORD *)v69;
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v27, "_scrollViewWillEndDraggingWithVelocity:targetContentOffset:", v69, v30, v32);
    }
    *(double *)&v57 = v22;
    if (v33) {
      objc_msgSend(v28, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v27, v69, v30, v32);
    }
    v34 = [v8 coordinateSpace];
    [v10 focusedRectInCoordinateSpace:v34];
    CGFloat v36 = v35;
    CGFloat v38 = v37;
    CGFloat v40 = v39;
    CGFloat v42 = v41;

    v70.origin.double x = v36;
    v70.origin.double y = v38;
    v70.size.double width = v40;
    v70.size.double height = v42;
    if (CGRectGetMinX(v70) < v69[0]) {
      goto LABEL_21;
    }
    v71.origin.double x = v36;
    v71.origin.double y = v38;
    v71.size.double width = v40;
    v71.size.double height = v42;
    double v43 = v20;
    double MaxX = CGRectGetMaxX(v71);
    double v45 = v69[0];
    [v8 visibleSize];
    BOOL v47 = MaxX <= v45 + v46;
    double v20 = v43;
    if (!v47) {
      goto LABEL_21;
    }
    v72.origin.double x = v36;
    v72.origin.double y = v38;
    v72.size.double width = v40;
    v72.size.double height = v42;
    if (CGRectGetMinY(v72) < v69[1]) {
      goto LABEL_21;
    }
    v73.origin.double x = v36;
    v73.origin.double y = v38;
    v73.size.double width = v40;
    v73.size.double height = v42;
    double MaxY = CGRectGetMaxY(v73);
    double v49 = v69[1];
    [v8 visibleSize];
    BOOL v47 = MaxY <= v49 + v50;
    double v20 = v43;
    if (!v47) {
LABEL_21:
    }
      *(_OWORD *)v69 = v68;
    LOBYTE(IsFocusedOrContainsFocus) = v69[1] != v58 || v69[0] != v16;
    if (IsFocusedOrContainsFocus)
    {
      objc_msgSend(v27, "_scrollViewDidEndDraggingForDelegateWithDeceleration:", 1, v58, v69[1]);
      if (objc_opt_respondsToSelector()) {
        [v28 scrollViewWillBeginDecelerating:v27];
      }
      v56 = v28;
      double v51 = _UIGetFocusEngineScrollConvergence();
      v52 = [(_UIFocusScrollManager *)self screen];
      uint64_t v53 = [v52 _userInterfaceIdiom];

      if (v53 == 3)
      {
        if ([v27 isPagingEnabled])
        {
          double v51 = 0.979;
        }
        else
        {
          double v55 = hypot(v69[0] - v20, v69[1] - *(double *)&v57);
          double v51 = fmax(_UIGetFocusEngineScrollConvergence() / 10.0, v51 + v55 / -4000.0);
        }
      }
      objc_initWeak(&location, self);
      objc_initWeak(&from, v27);
      objc_initWeak(&v65, v8);
      scrollAnimator = self->_scrollAnimator;
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __66___UIFocusScrollManager__scrollWithScrollRequest_onlyIfNecessary___block_invoke;
      v60[3] = &unk_1E52EEA68;
      objc_copyWeak(&v62, &location);
      objc_copyWeak(&v63, &from);
      objc_copyWeak(&v64, &v65);
      id v61 = v6;
      [(_UIFocusDisplayLinkScrollAnimator *)scrollAnimator setTargetContentOffset:v7 forEnvironmentScrollableContainer:v60 convergenceRate:*(_OWORD *)v69 completion:v51];
      [(NSHashTable *)self->_stackVisitedScrollingContainers removeObject:v8];

      objc_destroyWeak(&v64);
      objc_destroyWeak(&v63);
      objc_destroyWeak(&v62);
      objc_destroyWeak(&v65);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
      v28 = v56;
    }
    else
    {
      BOOL v54 = -[_UIFocusDisplayLinkScrollAnimator isAnimatingScrollableContainer:](self->_scrollAnimator, "isAnimatingScrollableContainer:", v8, v58, v69[1]);
      [v27 _scrollViewDidEndDraggingForDelegateWithDeceleration:v54];
      [(_UIFocusScrollManager *)self _ensureFocusItemIsOnscreenForScrollRequest:v6];
      if (v54 && (objc_opt_respondsToSelector() & 1) != 0) {
        [v28 scrollViewWillBeginDecelerating:v27];
      }
      [(NSHashTable *)self->_stackVisitedScrollingContainers removeObject:v8];
    }
  }
LABEL_4:

  return IsFocusedOrContainsFocus;
}

- (void)_ensureFocusItemIsOnscreenForScrollRequest:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [v4 environmentScrollableContainer];
  id v6 = [v5 scrollableContainer];

  double v7 = [v4 focusItemInfo];
  id v8 = [v7 item];
  unsigned int v9 = objc_msgSend(v8, sel_allowsWeakReference);

  if (v9)
  {
    double v10 = [v7 item];
    if (v7 && v10)
    {
      double v21 = v10;
      double v22 = v7;
      [v7 ancestorEnvironmentScrollableContainers];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v24;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v24 != v14) {
              objc_enumerationMutation(v11);
            }
            double v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            double v17 = [v16 scrollableContainer];
            if (_UIFocusEngineScrollableContainerCanScroll(v17)) {
              BOOL v18 = v6 == v17;
            }
            else {
              BOOL v18 = 1;
            }
            if (!v18)
            {
              double v19 = [[_UIFocusScrollRequest alloc] initWithBaseRequest:v4 environmentScrollableContainer:v16];
              BOOL v20 = [(_UIFocusScrollManager *)self _scrollWithScrollRequest:v19 onlyIfNecessary:1];

              if (v20)
              {

                goto LABEL_19;
              }
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }
LABEL_19:

      double v10 = v21;
      double v7 = v22;
    }
  }
  else
  {
    double v10 = 0;
  }
}

- (UIScreen)screen
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_screen);
  return (UIScreen *)WeakRetained;
}

- (_UIFocusDisplayLinkScrollAnimator)scrollAnimator
{
  return self->_scrollAnimator;
}

- (NSHashTable)stackVisitedScrollingContainers
{
  return self->_stackVisitedScrollingContainers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackVisitedScrollingContainers, 0);
  objc_storeStrong((id *)&self->_scrollAnimator, 0);
  objc_destroyWeak((id *)&self->_screen);
}

@end