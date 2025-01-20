@interface PXGScrollLayout
- (BOOL)alwaysBounceHorizontal;
- (BOOL)alwaysBounceVertical;
- (BOOL)axShouldBeConsideredAsSubgroup;
- (BOOL)clipsToBounds;
- (BOOL)draggingPerformsScroll;
- (BOOL)isScrolling;
- (BOOL)showsHorizontalScrollIndicator;
- (BOOL)showsVerticalScrollIndicator;
- (BOOL)transfersScrollToContainer;
- (BOOL)wantsScrollView;
- (CGPoint)anchor:(id)a3 visibleRectOriginForProposedVisibleRect:(CGRect)a4 forLayout:(id)a5;
- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (NSNumber)fixedHeight;
- (NSNumber)fixedWidth;
- (PXGLayout)contentLayout;
- (PXGScrollLayout)init;
- (PXGScrollLayout)initWithContentLayout:(id)a3;
- (PXGScrollLayoutDelegate)delegate;
- (PXGScrollViewModel)scrollViewModel;
- (UIEdgeInsets)hitTestContentInsets;
- (UIEdgeInsets)horizontalScrollIndicatorInsets;
- (UIEdgeInsets)verticalScrollIndicatorInsets;
- (double)horizontalInterPageSpacing;
- (float)scrollViewSpriteZPosition;
- (id)axContainingScrollViewForAXGroup:(id)a3;
- (id)axSpriteIndexes;
- (id)createAnchorForVisibleAreaIgnoringEdges:(unint64_t)a3;
- (id)focusItemsForScrollViewContainer:(id)a3 inRect:(CGRect)a4;
- (id)layoutForItemChanges;
- (id)px_assetsSectionLayout;
- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (int64_t)intrinsicScrollRegime;
- (int64_t)scrollDecelerationRate;
- (int64_t)scrollableAxis;
- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5;
- (void)_invalidateContentLayout;
- (void)_invalidateLocalContent;
- (void)_invalidateScrollView;
- (void)_updateContentLayout;
- (void)_updateLocalContent;
- (void)alphaDidChange;
- (void)contentSizeDidChange;
- (void)didUpdate;
- (void)displayScaleDidChange;
- (void)insertSublayout:(id)a3 atIndex:(int64_t)a4;
- (void)lastScrollDirectionDidChange;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)px_modifyAssetsSectionLayoutGeometry:(id)a3;
- (void)referenceSizeDidChange;
- (void)safeAreaInsetsDidChange;
- (void)scrollViewContainerDidEndScrolling:(id)a3;
- (void)scrollViewContainerDidScroll:(id)a3;
- (void)scrollViewContainerWillBeginScrolling:(id)a3;
- (void)scrollViewContainerWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5 currentContentOffset:(CGPoint)a6;
- (void)setAlwaysBounceHorizontal:(BOOL)a3;
- (void)setAlwaysBounceVertical:(BOOL)a3;
- (void)setClipsToBounds:(BOOL)a3;
- (void)setContentLayout:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDraggingPerformsScroll:(BOOL)a3;
- (void)setFixedHeight:(id)a3;
- (void)setFixedWidth:(id)a3;
- (void)setHitTestContentInsets:(UIEdgeInsets)a3;
- (void)setHorizontalInterPageSpacing:(double)a3;
- (void)setHorizontalScrollIndicatorInsets:(UIEdgeInsets)a3;
- (void)setIsScrolling:(BOOL)a3;
- (void)setScrollDecelerationRate:(int64_t)a3;
- (void)setScrollViewSpriteZPosition:(float)a3;
- (void)setShowsHorizontalScrollIndicator:(BOOL)a3;
- (void)setShowsVerticalScrollIndicator:(BOOL)a3;
- (void)setTransfersScrollToContainer:(BOOL)a3;
- (void)setVerticalScrollIndicatorInsets:(UIEdgeInsets)a3;
- (void)setWantsScrollView:(BOOL)a3;
- (void)stopScrolling;
- (void)sublayoutNeedsUpdate:(id)a3;
- (void)update;
- (void)userInterfaceDirectionDidChange;
- (void)viewEnvironmentDidChange;
- (void)visibleRectDidChange;
- (void)willUpdate;
@end

@implementation PXGScrollLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollViewModel, 0);
  objc_storeStrong((id *)&self->_fixedHeight, 0);
  objc_storeStrong((id *)&self->_fixedWidth, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (BOOL)isScrolling
{
  return self->_isScrolling;
}

- (BOOL)wantsScrollView
{
  return self->_wantsScrollView;
}

- (PXGScrollViewModel)scrollViewModel
{
  return self->_scrollViewModel;
}

- (double)horizontalInterPageSpacing
{
  return self->_horizontalInterPageSpacing;
}

- (BOOL)transfersScrollToContainer
{
  return self->_transfersScrollToContainer;
}

- (BOOL)draggingPerformsScroll
{
  return self->_draggingPerformsScroll;
}

- (UIEdgeInsets)hitTestContentInsets
{
  double top = self->_hitTestContentInsets.top;
  double left = self->_hitTestContentInsets.left;
  double bottom = self->_hitTestContentInsets.bottom;
  double right = self->_hitTestContentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)verticalScrollIndicatorInsets
{
  double top = self->_verticalScrollIndicatorInsets.top;
  double left = self->_verticalScrollIndicatorInsets.left;
  double bottom = self->_verticalScrollIndicatorInsets.bottom;
  double right = self->_verticalScrollIndicatorInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)horizontalScrollIndicatorInsets
{
  double top = self->_horizontalScrollIndicatorInsets.top;
  double left = self->_horizontalScrollIndicatorInsets.left;
  double bottom = self->_horizontalScrollIndicatorInsets.bottom;
  double right = self->_horizontalScrollIndicatorInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)alwaysBounceVertical
{
  return self->_alwaysBounceVertical;
}

- (BOOL)alwaysBounceHorizontal
{
  return self->_alwaysBounceHorizontal;
}

- (BOOL)showsVerticalScrollIndicator
{
  return self->_showsVerticalScrollIndicator;
}

- (BOOL)showsHorizontalScrollIndicator
{
  return self->_showsHorizontalScrollIndicator;
}

- (BOOL)clipsToBounds
{
  return self->_clipsToBounds;
}

- (int64_t)scrollDecelerationRate
{
  return self->_scrollDecelerationRate;
}

- (float)scrollViewSpriteZPosition
{
  return self->_scrollViewSpriteZPosition;
}

- (NSNumber)fixedHeight
{
  return self->_fixedHeight;
}

- (NSNumber)fixedWidth
{
  return self->_fixedWidth;
}

- (PXGScrollLayoutDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXGScrollLayoutDelegate *)WeakRetained;
}

- (id)axContainingScrollViewForAXGroup:(id)a3
{
  v4 = [(PXGLayout *)self rootLayout];
  v5 = objc_msgSend(v4, "viewForSpriteIndex:", objc_msgSend(v4, "convertSpriteIndex:fromDescendantLayout:", self->_scrollViewSpriteIndex, self));
  v6 = [v5 scrollViewController];
  v7 = [v6 scrollView];

  return v7;
}

- (id)axSpriteIndexes
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28D60]);
  return v2;
}

- (BOOL)axShouldBeConsideredAsSubgroup
{
  return 0;
}

- (id)focusItemsForScrollViewContainer:(id)a3 inRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v9 = [a3 scrollViewController];
  v10 = [(PXGScrollLayout *)self contentLayout];
  v11 = [v10 axGroup];
  v12 = objc_msgSend(v11, "focusItemsForScrollViewController:inRect:", v9, x, y, width, height);

  return v12;
}

- (void)scrollViewContainerDidEndScrolling:(id)a3
{
  [(PXGScrollLayout *)self setIsScrolling:0];
  if (self->_delegateRespondsTo.didEndScrolling)
  {
    id v4 = [(PXGScrollLayout *)self delegate];
    [v4 scrollLayoutDidEndScrolling:self];
  }
}

- (void)scrollViewContainerWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5 currentContentOffset:(CGPoint)a6
{
  if (self->_delegateRespondsTo.willEndScrollingWithVelocityTargetContentOffsetCurrentContentOffset)
  {
    double y = a6.y;
    double x = a6.x;
    double v9 = a4.y;
    double v10 = a4.x;
    id v12 = [(PXGScrollLayout *)self delegate];
    objc_msgSend(v12, "scrollLayoutWillEndScrolling:withVelocity:targetContentOffset:currentContentOffset:", self, a5, v10, v9, x, y);
  }
}

- (void)scrollViewContainerDidScroll:(id)a3
{
  id v5 = a3;
  if (![(PXGScrollLayout *)self isScrolling] && _PXPPTCurrentlyTestedScrollView) {
    [(PXGScrollLayout *)self scrollViewContainerWillBeginScrolling:v5];
  }
  if ([(PXGScrollLayout *)self isScrolling]) {
    [(PXGLayout *)self clearLastVisibleAreaAnchoringInformation];
  }
  if (self->_delegateRespondsTo.didScroll)
  {
    id v4 = [(PXGScrollLayout *)self delegate];
    [v4 scrollLayoutDidScroll:self];
  }
}

- (void)scrollViewContainerWillBeginScrolling:(id)a3
{
  [(PXGScrollLayout *)self setIsScrolling:1];
  if (self->_delegateRespondsTo.willBeginScrolling)
  {
    id v4 = [(PXGScrollLayout *)self delegate];
    [v4 scrollLayoutWillBeginScrolling:self];
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)ScrollViewModelObservationContext_235127 != a5)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"PXGScrollLayout.m" lineNumber:544 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  double v10 = v9;
  if ((v6 & 2) != 0)
  {
    id v13 = v9;
    char v11 = [v9 changesOptions];
    double v10 = v13;
    if ((v11 & 1) == 0)
    {
      [(PXGScrollLayout *)self _invalidateContentLayout];
      double v10 = v13;
    }
  }
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if (self->_scrollViewSpriteIndex != a3)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"PXGScrollLayout.m" lineNumber:524 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v8 = v7;
  id v9 = objc_alloc_init(PXGScrollViewContainerConfiguration);
  double v10 = [(PXGScrollLayout *)self scrollViewModel];
  [(PXGScrollViewContainerConfiguration *)v9 setScrollViewModel:v10];

  [(PXGScrollViewContainerConfiguration *)v9 setDelegate:self];
  return v9;
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if (self->_scrollViewSpriteIndex != a3)
  {
    char v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PXGScrollLayout.m" lineNumber:513 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v8 = v7;
  id v9 = objc_opt_class();

  return (Class)v9;
}

- (void)_updateLocalContent
{
}

uint64_t __38__PXGScrollLayout__updateLocalContent__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v8 = *(unsigned int **)(a1 + 32);
  uint64_t v9 = a3 + 32 * v8[218];
  [v8 scrollViewSpriteZPosition];
  float v11 = v10;
  CGFloat v12 = *(double *)(a1 + 40);
  CGFloat v13 = *(double *)(a1 + 48);
  CGFloat v14 = *(double *)(a1 + 56);
  CGFloat v15 = *(double *)(a1 + 64);
  v30.origin.double x = v12;
  v30.origin.double y = v13;
  v30.size.double width = v14;
  v30.size.double height = v15;
  CGFloat MidX = CGRectGetMidX(v30);
  v31.origin.double x = v12;
  v31.origin.double y = v13;
  v31.size.double width = v14;
  v31.size.double height = v15;
  CGFloat MidY = CGRectGetMidY(v31);
  v32.origin.double x = v12;
  v32.origin.double y = v13;
  v32.size.double width = v14;
  v32.size.double height = v15;
  CGFloat Width = CGRectGetWidth(v32);
  v33.origin.double x = v12;
  v33.origin.double y = v13;
  v33.size.double width = v14;
  v33.size.double height = v15;
  CGFloat Height = CGRectGetHeight(v33);
  v19.f64[0] = Width;
  v19.f64[1] = Height;
  *(CGFloat *)uint64_t v9 = MidX;
  *(CGFloat *)(v9 + 8) = MidY;
  *(double *)(v9 + 16) = v11;
  *(float32x2_t *)(v9 + 24) = vcvt_f32_f64(v19);
  v20 = (_OWORD *)(a4 + 160 * *(unsigned int *)(*(void *)(a1 + 32) + 872));
  long long v21 = *((_OWORD *)off_1E5DAAF90 + 7);
  v20[6] = *((_OWORD *)off_1E5DAAF90 + 6);
  v20[7] = v21;
  long long v22 = *((_OWORD *)off_1E5DAAF90 + 9);
  v20[8] = *((_OWORD *)off_1E5DAAF90 + 8);
  v20[9] = v22;
  long long v23 = *((_OWORD *)off_1E5DAAF90 + 3);
  v20[2] = *((_OWORD *)off_1E5DAAF90 + 2);
  v20[3] = v23;
  long long v24 = *((_OWORD *)off_1E5DAAF90 + 5);
  v20[4] = *((_OWORD *)off_1E5DAAF90 + 4);
  v20[5] = v24;
  long long v25 = *((_OWORD *)off_1E5DAAF90 + 1);
  _OWORD *v20 = *(_OWORD *)off_1E5DAAF90;
  v20[1] = v25;
  uint64_t result = [*(id *)(a1 + 32) alpha];
  float v27 = 0.0;
  if (v28 > 0.0)
  {
    uint64_t result = [*(id *)(a1 + 32) wantsScrollView];
    float v27 = 1.0;
    if (!result) {
      float v27 = 0.0;
    }
  }
  *(float *)(a4 + 160 * *(unsigned int *)(*(void *)(a1 + 32) + 872)) = v27;
  *(unsigned char *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 32) + 872)) = 1;
  *(unsigned char *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 32) + 872) + 1) = 10;
  *(_WORD *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 32) + 872) + 32) = *(_WORD *)(*(void *)(a1 + 32) + 876);
  *(unsigned char *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 32) + 872) + 34) = 2;
  return result;
}

- (void)_invalidateLocalContent
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 2;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 2) != 0)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      char v6 = [NSString stringWithUTF8String:"-[PXGScrollLayout _invalidateLocalContent]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXGScrollLayout.m", 491, @"invalidating %lu after it already has been updated", 2);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 2;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_invalidateScrollView
{
}

- (void)_updateContentLayout
{
  self->_isUpdatingContentLayout = 1;
  v3 = [(PXGScrollLayout *)self contentLayout];
  [(PXGLayout *)self referenceSize];
  double v5 = v4;
  double v7 = v6;
  v8 = [(PXGScrollLayout *)self fixedWidth];
  uint64_t v9 = [(PXGScrollLayout *)self fixedHeight];
  if (v8)
  {
    [v8 doubleValue];
    double v5 = v10;
  }
  if (v9)
  {
    [v9 doubleValue];
    double v7 = v11;
  }
  CGFloat v12 = [(PXGLayout *)self viewEnvironment];
  [v3 setViewEnvironment:v12];

  objc_msgSend(v3, "setReferenceSize:", v5, v7);
  [(PXGLayout *)self referenceDepth];
  objc_msgSend(v3, "setReferenceDepth:");
  objc_msgSend(v3, "setReferenceOptions:", -[PXGLayout referenceOptions](self, "referenceOptions"));
  [(PXGLayout *)self displayScale];
  objc_msgSend(v3, "setDisplayScale:");
  objc_msgSend(v3, "setLastScrollDirection:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  [(PXGLayout *)self safeAreaInsets];
  objc_msgSend(v3, "setSafeAreaInsets:");
  objc_msgSend(v3, "setUserInterfaceDirection:", -[PXGLayout userInterfaceDirection](self, "userInterfaceDirection"));
  [(PXGScrollLayout *)self scrollViewModel];
  [(id)objc_claimAutoreleasedReturnValue() contentOffset];
  [(PXGLayout *)self visibleRect];
  PXPointAdd();
}

void __39__PXGScrollLayout__updateContentLayout__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    double v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"PXGScrollLayout.m" lineNumber:472 description:@"PXGScrollLayout only supports a single sublayout"];
  }
  *(_OWORD *)(a3 + 32) = *(_OWORD *)(a1 + 48);
  PXPointSubtract();
}

void __39__PXGScrollLayout__updateContentLayout__block_invoke_2(double *a1, void *a2)
{
  double v3 = a1[4];
  double v4 = a1[5];
  id v5 = a2;
  objc_msgSend(v5, "setContentSize:", v3, v4);
  objc_msgSend(v5, "setContentOffset:", a1[6], a1[7]);
}

- (void)_invalidateContentLayout
{
  if (!self->_isUpdatingContentLayout)
  {
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if (self->_updateFlags.updated)
      {
        id v5 = [MEMORY[0x1E4F28B00] currentHandler];
        double v6 = [NSString stringWithUTF8String:"-[PXGScrollLayout _invalidateContentLayout]"];
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXGScrollLayout.m", 411, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)didUpdate
{
  v5.receiver = self;
  v5.super_class = (Class)PXGScrollLayout;
  [(PXGLayout *)&v5 didUpdate];
  if (self->_updateFlags.willPerformUpdate)
  {
    double v3 = [MEMORY[0x1E4F28B00] currentHandler];
    double v4 = [NSString stringWithUTF8String:"-[PXGScrollLayout didUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXGScrollLayout.m", 406, @"Invalid parameter not satisfying: %@", @"!_updateFlags.willPerformUpdate" file lineNumber description];
  }
}

- (void)update
{
  uint64_t v3 = [(PXGLayout *)self numberOfDescendantAnchors];
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (v3 >= 1)
  {
    BOOL isPerformingUpdate = self->_updateFlags.isPerformingUpdate;
    if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 1) != 0)
    {
      CGFloat v14 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v15 = [NSString stringWithUTF8String:"-[PXGScrollLayout update]"];
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, @"PXGScrollLayout.m", 390, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    needsUpdate |= 1uLL;
    p_updateFlags->unint64_t needsUpdate = needsUpdate;
    self->_updateFlags.BOOL willPerformUpdate = 0;
    if (!isPerformingUpdate) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
  self->_updateFlags.BOOL willPerformUpdate = 0;
  if (!needsUpdate) {
    goto LABEL_12;
  }
  if (self->_updateFlags.isPerformingUpdate)
  {
LABEL_15:
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[PXGScrollLayout update]"];
    [v8 handleFailureInFunction:v9, @"PXGScrollLayout.m", 393, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

    unint64_t needsUpdate = p_updateFlags->needsUpdate;
  }
LABEL_5:
  self->_updateFlags.BOOL isPerformingUpdate = 1;
  self->_updateFlags.updated = 1;
  if (needsUpdate)
  {
    p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
    [(PXGScrollLayout *)self _updateContentLayout];
    if (!self->_updateFlags.isPerformingUpdate)
    {
      double v10 = [MEMORY[0x1E4F28B00] currentHandler];
      double v11 = [NSString stringWithUTF8String:"-[PXGScrollLayout update]"];
      [v10 handleFailureInFunction:v11, @"PXGScrollLayout.m", 397, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
  }
  unint64_t v7 = p_updateFlags->needsUpdate;
  self->_updateFlags.updated |= 2uLL;
  if ((v7 & 2) != 0)
  {
    p_updateFlags->unint64_t needsUpdate = v7 & 0xFFFFFFFFFFFFFFFDLL;
    [(PXGScrollLayout *)self _updateLocalContent];
    unint64_t v7 = p_updateFlags->needsUpdate;
  }
  self->_updateFlags.BOOL isPerformingUpdate = 0;
  if (v7)
  {
    CGFloat v12 = [MEMORY[0x1E4F28B00] currentHandler];
    CGFloat v13 = [NSString stringWithUTF8String:"-[PXGScrollLayout update]"];
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, @"PXGScrollLayout.m", 400, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
  }
LABEL_12:
  v16.receiver = self;
  v16.super_class = (Class)PXGScrollLayout;
  [(PXGLayout *)&v16 update];
}

- (void)willUpdate
{
  v5.receiver = self;
  v5.super_class = (Class)PXGScrollLayout;
  [(PXGLayout *)&v5 willUpdate];
  self->_updateFlags.BOOL willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    double v4 = [NSString stringWithUTF8String:"-[PXGScrollLayout willUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXGScrollLayout.m", 384, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];
  }
}

- (id)layoutForItemChanges
{
  id v2 = [(PXGScrollLayout *)self contentLayout];
  uint64_t v3 = [v2 layoutForItemChanges];

  return v3;
}

- (CGPoint)anchor:(id)a3 visibleRectOriginForProposedVisibleRect:(CGRect)a4 forLayout:(id)a5
{
  double y = a4.origin.y;
  double x = a4.origin.x;
  if (self->_delegateRespondsTo.willEndScrollingWithVelocityTargetContentOffsetCurrentContentOffset)
  {
    double height = a4.size.height;
    double width = a4.size.width;
    id v10 = a5;
    [(PXGScrollLayout *)self contentLayout];
    objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "convertRect:fromLayout:", v10, x, y, width, height);
    PXPointSubtract();
  }
  result.double y = a4.origin.y;
  result.double x = a4.origin.x;
  return result;
}

- (int64_t)scrollableAxis
{
  uint64_t v3 = [(PXGScrollLayout *)self contentLayout];
  double v4 = v3;
  if (v3)
  {
    id v5 = (id)[v3 scrollableAxis];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PXGScrollLayout;
    id v5 = [(PXGLayout *)&v8 scrollableAxis];
  }
  int64_t v6 = (int64_t)v5;

  return v6;
}

- (id)createAnchorForVisibleAreaIgnoringEdges:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXGScrollLayout;
  double v4 = [(PXGLayout *)&v6 createAnchorForVisibleAreaIgnoringEdges:a3];
  [v4 setDelegate:self];
  return v4;
}

- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  *a5 = a3;
  objc_super v6 = [(PXGScrollLayout *)self contentLayout];
  if (v6) {
    int64_t v7 = [(PXGLayout *)self indexOfSublayout:v6];
  }
  else {
    int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (int64_t)intrinsicScrollRegime
{
  id v2 = [(PXGScrollLayout *)self scrollViewModel];
  int64_t v3 = [v2 scrollRegime];

  return v3;
}

- (void)sublayoutNeedsUpdate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXGScrollLayout;
  [(PXGLayout *)&v4 sublayoutNeedsUpdate:a3];
  [(PXGScrollLayout *)self _invalidateContentLayout];
}

- (void)alphaDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXGScrollLayout;
  [(PXGLayout *)&v3 alphaDidChange];
  [(PXGScrollLayout *)self _invalidateLocalContent];
}

- (void)contentSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXGScrollLayout;
  [(PXGLayout *)&v3 contentSizeDidChange];
  [(PXGScrollLayout *)self _invalidateLocalContent];
}

- (void)userInterfaceDirectionDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXGScrollLayout;
  [(PXGLayout *)&v3 userInterfaceDirectionDidChange];
  [(PXGScrollLayout *)self _invalidateContentLayout];
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXGScrollLayout;
  [(PXGLayout *)&v3 safeAreaInsetsDidChange];
  [(PXGScrollLayout *)self _invalidateContentLayout];
}

- (void)lastScrollDirectionDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXGScrollLayout;
  [(PXGLayout *)&v3 lastScrollDirectionDidChange];
  [(PXGScrollLayout *)self _invalidateContentLayout];
}

- (void)displayScaleDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXGScrollLayout;
  [(PXGLayout *)&v3 displayScaleDidChange];
  [(PXGScrollLayout *)self _invalidateContentLayout];
}

- (void)referenceSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXGScrollLayout;
  [(PXGLayout *)&v3 referenceSizeDidChange];
  [(PXGScrollLayout *)self _invalidateContentLayout];
}

- (void)viewEnvironmentDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXGScrollLayout;
  [(PXGLayout *)&v3 viewEnvironmentDidChange];
  [(PXGScrollLayout *)self _invalidateContentLayout];
}

- (void)visibleRectDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXGScrollLayout;
  [(PXGLayout *)&v3 visibleRectDidChange];
  [(PXGScrollLayout *)self _invalidateContentLayout];
}

- (void)stopScrolling
{
  id v2 = [(PXGScrollLayout *)self scrollViewModel];
  [v2 performChanges:&__block_literal_global_235178 options:5];
}

uint64_t __32__PXGScrollLayout_stopScrolling__block_invoke(uint64_t a1, void *a2)
{
  return [a2 stopScrolling];
}

- (void)setTransfersScrollToContainer:(BOOL)a3
{
  if (self->_transfersScrollToContainer != a3)
  {
    self->_transfersScrollToContainer = a3;
    objc_super v4 = [(PXGScrollLayout *)self scrollViewModel];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __49__PXGScrollLayout_setTransfersScrollToContainer___block_invoke;
    v5[3] = &__block_descriptor_33_e37_v16__0___PXGMutableScrollViewModel__8l;
    BOOL v6 = a3;
    [v4 performChanges:v5];
  }
}

uint64_t __49__PXGScrollLayout_setTransfersScrollToContainer___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setTransfersScrollToContainer:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setIsScrolling:(BOOL)a3
{
  if (self->_isScrolling != a3)
  {
    self->_isScrolling = a3;
    [(PXGScrollLayout *)self isScrollingDidChange];
  }
}

- (void)setScrollDecelerationRate:(int64_t)a3
{
  if (self->_scrollDecelerationRate != a3)
  {
    self->_scrollDecelerationRate = a3;
    objc_super v4 = [(PXGScrollLayout *)self scrollViewModel];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __45__PXGScrollLayout_setScrollDecelerationRate___block_invoke;
    v5[3] = &__block_descriptor_40_e37_v16__0___PXGMutableScrollViewModel__8l;
    void v5[4] = a3;
    [v4 performChanges:v5 options:1];
  }
}

uint64_t __45__PXGScrollLayout_setScrollDecelerationRate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setScrollDecelerationRate:*(void *)(a1 + 32)];
}

- (void)setDraggingPerformsScroll:(BOOL)a3
{
  if (self->_draggingPerformsScroll != a3)
  {
    self->_draggingPerformsScroll = a3;
    objc_super v4 = [(PXGScrollLayout *)self scrollViewModel];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __45__PXGScrollLayout_setDraggingPerformsScroll___block_invoke;
    v5[3] = &__block_descriptor_33_e37_v16__0___PXGMutableScrollViewModel__8l;
    BOOL v6 = a3;
    [v4 performChanges:v5];
  }
}

uint64_t __45__PXGScrollLayout_setDraggingPerformsScroll___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDraggingPerformsScroll:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setHorizontalInterPageSpacing:(double)a3
{
  if (self->_horizontalInterPageSpacing != a3)
  {
    self->_horizontalInterPageSpacing = a3;
    objc_super v4 = [(PXGScrollLayout *)self scrollViewModel];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __49__PXGScrollLayout_setHorizontalInterPageSpacing___block_invoke;
    v5[3] = &__block_descriptor_40_e37_v16__0___PXGMutableScrollViewModel__8l;
    *(double *)&void v5[4] = a3;
    [v4 performChanges:v5];
  }
}

uint64_t __49__PXGScrollLayout_setHorizontalInterPageSpacing___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHorizontalInterPageSpacing:*(double *)(a1 + 32)];
}

- (void)setHitTestContentInsets:(UIEdgeInsets)a3
{
}

uint64_t __43__PXGScrollLayout_setHitTestContentInsets___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setHitTestContentInsets:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)setVerticalScrollIndicatorInsets:(UIEdgeInsets)a3
{
}

uint64_t __52__PXGScrollLayout_setVerticalScrollIndicatorInsets___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setVerticalScrollIndicatorInsets:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)setHorizontalScrollIndicatorInsets:(UIEdgeInsets)a3
{
}

uint64_t __54__PXGScrollLayout_setHorizontalScrollIndicatorInsets___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setHorizontalScrollIndicatorInsets:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)setAlwaysBounceVertical:(BOOL)a3
{
  if (self->_alwaysBounceVertical != a3)
  {
    self->_alwaysBounceVertical = a3;
    objc_super v4 = [(PXGScrollLayout *)self scrollViewModel];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __43__PXGScrollLayout_setAlwaysBounceVertical___block_invoke;
    v5[3] = &__block_descriptor_33_e37_v16__0___PXGMutableScrollViewModel__8l;
    BOOL v6 = a3;
    [v4 performChanges:v5];
  }
}

uint64_t __43__PXGScrollLayout_setAlwaysBounceVertical___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAlwaysBounceVertical:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setAlwaysBounceHorizontal:(BOOL)a3
{
  if (self->_alwaysBounceHorizontal != a3)
  {
    self->_alwaysBounceHorizontal = a3;
    objc_super v4 = [(PXGScrollLayout *)self scrollViewModel];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __45__PXGScrollLayout_setAlwaysBounceHorizontal___block_invoke;
    v5[3] = &__block_descriptor_33_e37_v16__0___PXGMutableScrollViewModel__8l;
    BOOL v6 = a3;
    [v4 performChanges:v5];
  }
}

uint64_t __45__PXGScrollLayout_setAlwaysBounceHorizontal___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAlwaysBounceHorizontal:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setShowsVerticalScrollIndicator:(BOOL)a3
{
  if (self->_showsVerticalScrollIndicator != a3)
  {
    self->_showsVerticalScrollIndicator = a3;
    objc_super v4 = [(PXGScrollLayout *)self scrollViewModel];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __51__PXGScrollLayout_setShowsVerticalScrollIndicator___block_invoke;
    v5[3] = &__block_descriptor_33_e37_v16__0___PXGMutableScrollViewModel__8l;
    BOOL v6 = a3;
    [v4 performChanges:v5];
  }
}

uint64_t __51__PXGScrollLayout_setShowsVerticalScrollIndicator___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setShowsVerticalScrollIndicator:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setShowsHorizontalScrollIndicator:(BOOL)a3
{
  if (self->_showsHorizontalScrollIndicator != a3)
  {
    self->_showsHorizontalScrollIndicator = a3;
    objc_super v4 = [(PXGScrollLayout *)self scrollViewModel];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __53__PXGScrollLayout_setShowsHorizontalScrollIndicator___block_invoke;
    v5[3] = &__block_descriptor_33_e37_v16__0___PXGMutableScrollViewModel__8l;
    BOOL v6 = a3;
    [v4 performChanges:v5];
  }
}

uint64_t __53__PXGScrollLayout_setShowsHorizontalScrollIndicator___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setShowsHorizontalScrollIndicator:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setClipsToBounds:(BOOL)a3
{
  if (self->_clipsToBounds != a3)
  {
    self->_clipsToBounds = a3;
    objc_super v4 = [(PXGScrollLayout *)self scrollViewModel];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __36__PXGScrollLayout_setClipsToBounds___block_invoke;
    v5[3] = &__block_descriptor_33_e37_v16__0___PXGMutableScrollViewModel__8l;
    BOOL v6 = a3;
    [v4 performChanges:v5];
  }
}

uint64_t __36__PXGScrollLayout_setClipsToBounds___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setClipsToBounds:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setScrollViewSpriteZPosition:(float)a3
{
  if (self->_scrollViewSpriteZPosition != a3)
  {
    self->_scrollViewSpriteZPosition = a3;
    [(PXGScrollLayout *)self _invalidateLocalContent];
  }
}

- (void)setWantsScrollView:(BOOL)a3
{
  if (self->_wantsScrollView != a3)
  {
    self->_wantsScrollView = a3;
    [(PXGScrollLayout *)self _invalidateLocalContent];
  }
}

- (void)setFixedHeight:(id)a3
{
  int64_t v7 = (NSNumber *)a3;
  id v5 = self->_fixedHeight;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(NSNumber *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_fixedHeight, a3);
      [(PXGScrollLayout *)self _invalidateContentLayout];
    }
  }
}

- (void)setFixedWidth:(id)a3
{
  int64_t v7 = (NSNumber *)a3;
  id v5 = self->_fixedWidth;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(NSNumber *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_fixedWidth, a3);
      [(PXGScrollLayout *)self _invalidateContentLayout];
    }
  }
}

- (void)insertSublayout:(id)a3 atIndex:(int64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PXGScrollLayout;
  -[PXGLayout insertSublayout:atIndex:](&v6, sel_insertSublayout_atIndex_, a3);
  if (!a4) {
    [(PXGScrollLayout *)self _invalidateContentLayout];
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    id v6 = objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateRespondsTo = &self->_delegateRespondsTo;
    self->_delegateRespondsTo.willBeginScrolling = objc_opt_respondsToSelector() & 1;

    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    p_delegateRespondsTo->didScroll = objc_opt_respondsToSelector() & 1;

    id v9 = objc_loadWeakRetained((id *)p_delegate);
    p_delegateRespondsTo->willEndScrollingWithVelocityTargetContentOffsetCurrentContentOffset = objc_opt_respondsToSelector() & 1;

    id v10 = objc_loadWeakRetained((id *)p_delegate);
    p_delegateRespondsTo->didEndScrolling = objc_opt_respondsToSelector() & 1;
  }
}

- (void)setContentLayout:(id)a3
{
  id v5 = a3;
  id v4 = [(PXGScrollLayout *)self contentLayout];
  if (v4 != v5)
  {
    [v4 removeFromSuperlayout];
    if (v5) {
      [(PXGScrollLayout *)self insertSublayout:v5 atIndex:0];
    }
    [(PXGScrollLayout *)self contentLayoutDidChange];
  }
}

- (PXGLayout)contentLayout
{
  if ([(PXGLayout *)self numberOfSublayouts] < 1)
  {
    objc_super v3 = 0;
  }
  else
  {
    objc_super v3 = [(PXGLayout *)self sublayoutAtIndex:0 loadIfNeeded:0];
  }
  return (PXGLayout *)v3;
}

- (PXGScrollLayout)initWithContentLayout:(id)a3
{
  id v4 = a3;
  id v5 = [(PXGScrollLayout *)self init];
  [(PXGScrollLayout *)v5 setContentLayout:v4];

  return v5;
}

- (PXGScrollLayout)init
{
  v7.receiver = self;
  v7.super_class = (Class)PXGScrollLayout;
  id v2 = [(PXGLayout *)&v7 init];
  objc_super v3 = v2;
  if (v2)
  {
    v2->_wantsScrollView = 1;
    v2->_scrollViewSpriteZPosition = -1.0;
    v2->_transfersScrollToContainer = 1;
    id v4 = objc_alloc_init(PXGScrollViewModel);
    scrollViewModel = v3->_scrollViewModel;
    v3->_scrollViewModel = v4;

    [(PXGScrollViewModel *)v3->_scrollViewModel registerChangeObserver:v3 context:ScrollViewModelObservationContext_235127];
    [(PXGLayout *)v3 setContentSource:v3];
    [(PXGScrollLayout *)v3 setClipsToBounds:1];
    [(PXGScrollLayout *)v3 setShowsVerticalScrollIndicator:1];
    [(PXGScrollLayout *)v3 setShowsHorizontalScrollIndicator:1];
    v3->_scrollViewSpriteIndedouble x = 0;
    [(PXGLayout *)v3 addSpritesInRange:0x100000000 initialState:0];
  }
  return v3;
}

- (void)px_modifyAssetsSectionLayoutGeometry:(id)a3
{
  id v4 = a3;
  id v5 = [(PXGLayout *)self sublayoutDataStore];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__PXGScrollLayout_PXPhotosSectionedLayout__px_modifyAssetsSectionLayoutGeometry___block_invoke;
  v7[3] = &unk_1E5DC9500;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateSublayoutGeometriesUsingBlock:v7];
}

uint64_t __81__PXGScrollLayout_PXPhotosSectionedLayout__px_modifyAssetsSectionLayoutGeometry___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)px_assetsSectionLayout
{
  id v2 = [(PXGScrollLayout *)self contentLayout];
  objc_super v3 = objc_msgSend(v2, "px_assetsSectionLayout");

  return v3;
}

@end