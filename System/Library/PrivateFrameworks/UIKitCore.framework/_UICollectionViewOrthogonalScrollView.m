@interface _UICollectionViewOrthogonalScrollView
+ (BOOL)_supportsInvalidatingFocusCache;
- (CGPoint)_contentOffsetForScrollingToItemAtIndexPath:(id)a3 atScrollPosition:(unint64_t)a4 additionalInsets:(NSDirectionalEdgeInsets)a5 itemFrame:(CGRect)a6;
- (CGPoint)_contentOffsetForScrollingToTop;
- (CGPoint)_panGestureLocationInView:(id)a3;
- (CGPoint)_panGestureVelocityInView:(id)a3;
- (CGPoint)_pointByApplyingBaseContentInsetsToPoint:(CGPoint)a3;
- (CGPoint)_pointByRemovingBaseContentInsetsFromPoint:(CGPoint)a3;
- (UIEdgeInsets)_focusScrollableAreaInsets;
- (double)contentOffsetAdjustedForCurrentScrollingBehavior:(double)a3 itemFrame:(CGFloat)a4;
- (id)_childFocusRegionsInRect:(CGRect)a3 inCoordinateSpace:(id)a4;
- (id)_extantFocusItemsInRect:(CGRect)a3;
- (id)_focusScrollBoundaryMetricsForItem:(id)a3;
- (id)collectionView;
- (id)focusItemsInRect:(CGRect)a3;
- (unint64_t)_edgesPropagatingSafeAreaInsetsToSubviews;
- (unint64_t)_focusPrimaryScrollableAxis;
- (void)_addSubview:(id)a3 positioned:(int64_t)a4 relativeTo:(id)a5;
- (void)_autoScrollAssistantUpdateContentOffset:(CGPoint)a3;
- (void)_notifyDidScroll;
- (void)_willRemoveSubview:(id)a3;
- (void)bringSubviewToFront:(id)a3;
- (void)configureForDescriptor:(uint64_t)a1;
- (void)dealloc;
- (void)exchangeSubviewAtIndex:(int64_t)a3 withSubviewAtIndex:(int64_t)a4;
- (void)initWithCollectionView:(uint64_t)a3 section:;
- (void)scrollToItemAtIndexPath:(uint64_t)a3 atScrollPosition:(uint64_t)a4 additionalInsets:(double)a5 animated:(double)a6;
- (void)sendSubviewToBack:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation _UICollectionViewOrthogonalScrollView

+ (BOOL)_supportsInvalidatingFocusCache
{
  return 1;
}

- (unint64_t)_edgesPropagatingSafeAreaInsetsToSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)_UICollectionViewOrthogonalScrollView;
  unint64_t v3 = [(UIScrollView *)&v5 _edgesPropagatingSafeAreaInsetsToSubviews];
  if ([(UIScrollView *)self _contentScrollsAlongXAxis]) {
    v3 &= 0xFFFFFFFFFFFFFFF5;
  }
  if ([(UIScrollView *)self _contentScrollsAlongYAxis]) {
    return v3 & 0xFFFFFFFFFFFFFFFALL;
  }
  else {
    return v3;
  }
}

- (void)_addSubview:(id)a3 positioned:(int64_t)a4 relativeTo:(id)a5
{
  v7 = self;
  int64_t v9 = a4;
  if (self) {
    self = (_UICollectionViewOrthogonalScrollView *)self->_subviewRouter;
  }
  if ([(_UICollectionViewOrthogonalScrollView *)self shouldAddSubview:a3 atPosition:&v9 relativeTo:a5])
  {
    v8.receiver = v7;
    v8.super_class = (Class)_UICollectionViewOrthogonalScrollView;
    [(UIView *)&v8 _addSubview:a3 positioned:v9 relativeTo:a5];
  }
}

- (void)_notifyDidScroll
{
  if (!self->_isConfiguring)
  {
    [(UIScrollView *)self contentOffset];
    -[_UICollectionViewOrthogonalScrollView _pointByRemovingBaseContentInsetsFromPoint:](self, "_pointByRemovingBaseContentInsetsFromPoint:");
    descriptor = self->_descriptor;
    if (descriptor)
    {
      descriptor->_contentOffset.x = v3;
      descriptor->_contentOffset.y = v4;
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)_UICollectionViewOrthogonalScrollView;
  [(UIScrollView *)&v6 _notifyDidScroll];
}

- (void)initWithCollectionView:(uint64_t)a3 section:
{
  if (!a1) {
    return 0;
  }
  v10.receiver = a1;
  v10.super_class = (Class)_UICollectionViewOrthogonalScrollView;
  id v5 = objc_msgSendSuper2(&v10, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  objc_super v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)v5 + 259, a2);
    v6[260] = a3;
    id v7 = -[_UICollectionViewSubviewRouter initWithContainer:]([_UICollectionViewSubviewRouter alloc], v6);
    objc_super v8 = (void *)v6[261];
    v6[261] = v7;

    [v6 setDelaysContentTouches:0];
    [v6 setClipsToBounds:0];
    [v6 setContentInsetAdjustmentBehavior:2];
    [v6 setShowsHorizontalScrollIndicator:0];
    [v6 setShowsVerticalScrollIndicator:0];
  }
  return v6;
}

- (void)configureForDescriptor:(uint64_t)a1
{
  if (!a1) {
    return;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 2072));
  if (a2 && WeakRetained)
  {
    id v103 = WeakRetained;
    *(unsigned char *)(a1 + 2064) = 1;
    if (-[_UICollectionLayoutSectionDescriptor isEqualToSectionDescriptor:comparingContentOffset:](*(void *)(a1 + 2096), a2, 0))
    {
      goto LABEL_52;
    }
    objc_storeStrong((id *)(a1 + 2096), (id)a2);
    uint64_t v5 = *(void *)(a2 + 16);
    double v6 = *(double *)(a2 + 208);
    double v7 = *(double *)(a2 + 216);
    double v101 = *(double *)(a2 + 232);
    double v102 = *(double *)(a2 + 224);
    double v9 = *(double *)(a1 + 2104);
    double v8 = *(double *)(a1 + 2112);
    double v10 = *(double *)(a1 + 2120);
    double v11 = *(double *)(a1 + 2128);
    double v12 = *MEMORY[0x1E4F1DAD8];
    double v13 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v14 = _UIPointValueForAxis(v5, v6, v7);
    double v99 = v13;
    double v100 = v12;
    double v15 = _UISetPointValueForAxis(v5, v12, v13, v14);
    double v17 = -v7;
    BOOL v19 = v8 == -v6 && v9 == v17 && v11 == v15;
    double v20 = v15;
    BOOL v21 = v19 && v10 == v16;
    double v22 = v16;
    if (!v21)
    {
      *(double *)(a1 + 2104) = v17;
      *(double *)(a1 + 2112) = -v6;
      *(double *)(a1 + 2120) = v16;
      *(double *)(a1 + 2128) = v15;
      v23 = +[_UIFocusSystemSceneComponent sceneComponentForEnvironment:a1];
      v24 = [v23 scrollManager];

      objc_msgSend(v24, "adjustTargetContentOffsetForScrollableContainer:byDelta:", a1, v6 + v8, v7 + v9);
    }
    double v25 = *(double *)(a2 + 160);
    double v26 = *(double *)(a2 + 168);
    uint64_t v27 = [(id)a1 _isAutomaticContentOffsetAdjustmentEnabled];
    [(id)a1 _setAutomaticContentOffsetAdjustmentEnabled:0];
    objc_msgSend((id)a1, "setFrame:", v6, v7, v102, v101);
    objc_msgSend((id)a1, "setContentSize:", v25, v26);
    [(id)a1 _setAutomaticContentOffsetAdjustmentEnabled:v27];
    uint64_t v28 = *(void *)(a2 + 40);
    BOOL v29 = v28 == 1 && v5 == 1;
    BOOL v30 = v28 == 1 && v5 == 2;
    [(id)a1 setBounces:v28 != 2];
    [(id)a1 setAlwaysBounceHorizontal:v29];
    [(id)a1 setAlwaysBounceVertical:v30];
    uint64_t v31 = *(void *)(a2 + 24);
    [(id)a1 setPagingEnabled:(unint64_t)(v31 - 3) < 3];
    double v32 = *(double *)(a2 + 32);
    if (v32 == *(double *)off_1E52D6B50) {
      double v32 = *(double *)off_1E52D6B58;
    }
    [(id)a1 setDecelerationRate:v32];
    objc_msgSend((id)a1, "_setShouldPreventFocusScrollPastContentSize:", objc_msgSend((id)a1, "_shouldPreventFocusScrollPastContentSize"));
    double v33 = *(double *)(a2 + 48);
    if (v33 <= 0.0)
    {
      v36 = [(id)a1 maskView];
    }
    else
    {
      int v34 = *(unsigned __int8 *)(a2 + 8);
      uint64_t v35 = [(id)a1 maskView];
      v36 = (UIView *)v35;
      if (!v34)
      {
        if (!v35)
        {
          v36 = objc_alloc_init(UIView);
          v37 = +[UIColor whiteColor];
          [(UIView *)v36 setBackgroundColor:v37];

          uint64_t v38 = *MEMORY[0x1E4F39EA8];
          v39 = [(UIView *)v36 layer];
          [v39 setCornerCurve:v38];

          [(id)a1 setMaskView:v36];
        }
        v40 = [(UIView *)v36 layer];
        [v40 setCornerRadius:v33];

        -[UIView setFrame:](v36, "setFrame:", *(double *)(a2 + 144), *(double *)(a2 + 152), *(double *)(a2 + 160), *(double *)(a2 + 168));
        goto LABEL_32;
      }
    }
    if (!v36) {
      goto LABEL_33;
    }
    [(id)a1 setMaskView:0];
LABEL_32:

LABEL_33:
    double v97 = v22;
    double v98 = -v6;
    double v96 = v20;
    if (v5) {
      uint64_t v41 = 7;
    }
    else {
      uint64_t v41 = 1;
    }
    [(id)a1 _setContentScrollsAlongXAxis:v5 & 1];
    if ((v5 & 2) != 0) {
      v41 |= 0x18uLL;
    }
    [(id)a1 _setContentScrollsAlongYAxis:(unint64_t)(v5 & 2) >> 1];
    v42 = [(id)a1 _autoScrollAssistant];
    [v42 setAllowedDirections:v41];

    [v103 frame];
    CGFloat v44 = v43;
    CGFloat v46 = v45;
    CGFloat v48 = v47;
    CGFloat v50 = v49;
    v105.origin.x = v6;
    v105.origin.y = v7;
    v105.size.width = v102;
    v105.size.height = v101;
    CGFloat MinY = CGRectGetMinY(v105);
    v106.origin.x = v6;
    v106.origin.y = v7;
    v106.size.width = v102;
    v106.size.height = v101;
    CGFloat MinX = CGRectGetMinX(v106);
    v107.origin.x = v44;
    v107.origin.y = v46;
    v107.size.width = v48;
    v107.size.height = v50;
    double Height = CGRectGetHeight(v107);
    v108.origin.x = v6;
    v108.origin.y = v7;
    v108.size.width = v102;
    v108.size.height = v101;
    double MaxY = CGRectGetMaxY(v108);
    v109.origin.x = v44;
    v109.origin.y = v46;
    v109.size.width = v48;
    v109.size.height = v50;
    double Width = CGRectGetWidth(v109);
    double v90 = v7;
    double v91 = v6;
    v110.origin.x = v6;
    v110.origin.y = v7;
    v110.size.width = v102;
    v110.size.height = v101;
    double MaxX = CGRectGetMaxX(v110);
    if (v5)
    {
      double v53 = Width - MaxX;
      double v55 = -v7;
      double v54 = v97;
      if (v5 == 1)
      {
        double v56 = 0.0;
        double v58 = 0.0;
        double v57 = MinX;
      }
      else
      {
        double v56 = Height - MaxY;
        double v57 = MinX;
        if (v5 == 2)
        {
          double v53 = 0.0;
          double v57 = 0.0;
        }
        double v58 = MinY;
      }
    }
    else
    {
      double v53 = 0.0;
      double v56 = 0.0;
      double v57 = 0.0;
      double v58 = 0.0;
      double v55 = -v7;
      double v54 = v97;
    }
    objc_msgSend((id)a1, "_setTouchInsets:", -v58, -v57, -v56, -v53);
    double v59 = *(double *)(a2 + 56);
    objc_msgSend((id)a1, "_pointByApplyingBaseContentInsetsToPoint:", v100, v99);
    double v61 = v60;
    double v63 = v62;
    double v64 = *MEMORY[0x1E4F1DB30];
    double v65 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    if (v59 > 0.0)
    {
      double v66 = _UISizeValueForAxis(v5, v102, v101);
      double v64 = _UISetSizeValueForAxis(v5, v64, v65, -(v66 - v59));
      double v65 = v67;
      if (v31 == 5)
      {
        dyld_program_sdk_at_least();
        UIRoundToViewScale((void *)a1);
        double v69 = v68;
        double v61 = v61 + _UISetPointValueForAxis(v5, v100, v99, -v68);
        double v63 = v63 + v70;
        if (v5 == 1)
        {
          objc_msgSend((id)a1, "setContentInset:", v55, v69 - v91, v54, v96 + v69);
LABEL_51:
          objc_msgSend((id)a1, "_setPagingOrigin:", v61, v63);
          objc_msgSend((id)a1, "_setInterpageSpacing:", v64, v65);
LABEL_52:
          double v71 = *(double *)(a2 + 96);
          double v72 = *(double *)(a2 + 104);
          [(id)a1 _currentScreenScale];
          double v74 = _UICollectionLayoutValidatedContentOffsetForProposedContentOffsetForOrthogonalSection(a2, v71, v72, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24), v73);
          double v76 = v75;
          if (([(id)a1 isTracking] & 1) != 0
            || ([(id)a1 isDecelerating] & 1) != 0
            || [(id)a1 isScrollAnimating])
          {
            uint64_t v77 = *(void *)(a2 + 16);
            double v78 = _UIPointValueForAxis(v77, v71, v72);
            double v74 = _UISetPointValueForAxis(v77, v74, v76, v78);
            double v76 = v79;
          }
          [(id)a1 contentOffset];
          double v81 = v80;
          double v83 = v82;
          objc_msgSend((id)a1, "_pointByApplyingBaseContentInsetsToPoint:", v74, v76);
          double v86 = vabdd_f64(v83, v85);
          if (vabdd_f64(v81, v84) >= 0.00000011920929 || v86 >= 0.00000011920929) {
            objc_msgSend((id)a1, "setContentOffset:", v84, v85, 0.00000011920929, v86);
          }
          double v88 = vabdd_f64(v72, v76);
          if (vabdd_f64(v71, v74) >= 0.00000011920929 || v88 >= 0.00000011920929) {
            objc_msgSend(v103, "_orthogonalScrollView:didScrollToOffset:inSection:", a1, *(void *)(a1 + 2080), v74, v76);
          }
          *(unsigned char *)(a1 + 2064) = 0;
          id WeakRetained = v103;
          goto LABEL_67;
        }
        double v55 = v69 - v90;
        double v54 = v54 + v69;
      }
    }
    objc_msgSend((id)a1, "setContentInset:", v55, v98, v54, v96);
    goto LABEL_51;
  }
LABEL_67:
}

- (CGPoint)_pointByApplyingBaseContentInsetsToPoint:(CGPoint)a3
{
  if (self)
  {
    double top = self->_baseContentInsets.top;
    double left = self->_baseContentInsets.left;
  }
  else
  {
    double left = 0.0;
    double top = 0.0;
  }
  double v5 = a3.x - left;
  double v6 = a3.y - top;
  result.y = v6;
  result.x = v5;
  return result;
}

- (void)_willRemoveSubview:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UICollectionViewOrthogonalScrollView;
  -[UIView _willRemoveSubview:](&v6, sel__willRemoveSubview_);
  if (self) {
    subviewRouter = self->_subviewRouter;
  }
  else {
    subviewRouter = 0;
  }
  [(_UICollectionViewSubviewRouter *)subviewRouter willRemoveSubview:a3];
}

- (id)collectionView
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 259);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (void)scrollToItemAtIndexPath:(uint64_t)a3 atScrollPosition:(uint64_t)a4 additionalInsets:(double)a5 animated:(double)a6
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 259);
    double v16 = [WeakRetained collectionViewLayout];
    double v17 = [v16 layoutAttributesForItemAtIndexPath:a2];

    if (v17)
    {
      [v17 frame];
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      objc_msgSend(a1, "_contentOffsetForScrollingToItemAtIndexPath:atScrollPosition:additionalInsets:itemFrame:", a2, a3, a5, a6, a7, a8, v18, v20, v22, v24);
      double v37 = v27;
      double v38 = v26;
      if (dyld_program_sdk_at_least())
      {
        if ((dyld_program_sdk_at_least() & 1) == 0)
        {
          CGFloat v19 = *MEMORY[0x1E4F1DB20];
          CGFloat v21 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
          CGFloat v23 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
          CGFloat v25 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
        }
        double v28 = -[_UICollectionViewOrthogonalScrollView contentOffsetAdjustedForCurrentScrollingBehavior:itemFrame:](a1, v38, v37, v19, v21, v23, v25);
      }
      else
      {
        objc_msgSend(WeakRetained, "_contentOffsetForScrollingToItemAtIndexPath:atScrollPosition:additionalInsets:itemFrame:containingScrollView:clampToScrollableArea:", a2, a3, a1, 1, a5, a6, a7, a8, v19, v21, v23, v25);
      }
      [a1 setContentOffset:a4 animated:v28];
      if ((dyld_program_sdk_at_least() & 1) == 0)
      {
        [a1 frame];
        double v30 = v29;
        double v32 = v31;
        double v34 = v33;
        double v36 = v35;
        [WeakRetained bounds];
        v41.x = v30;
        v41.y = v32;
        if (!CGRectContainsPoint(v42, v41)) {
          objc_msgSend(WeakRetained, "scrollRectToVisible:animated:", a4, v30, v32, v34, v36);
        }
      }
    }
  }
}

- (double)contentOffsetAdjustedForCurrentScrollingBehavior:(double)a3 itemFrame:(CGFloat)a4
{
  if (!a1) {
    return 0.0;
  }
  double v9 = a5;
  double v10 = a4;
  v26.origin.x = a4;
  v26.origin.y = a5;
  v26.size.width = a6;
  v26.size.height = a7;
  if (!CGRectIsNull(v26))
  {
    objc_msgSend(a1, "_pointByRemovingBaseContentInsetsFromPoint:", v10, v9);
    double v10 = v14;
    double v9 = v15;
  }
  objc_msgSend(a1, "_pointByRemovingBaseContentInsetsFromPoint:", a2, a3);
  double v17 = v16;
  double v19 = v18;
  id v20 = a1[262];
  [a1 _currentScreenScale];
  double v22 = _UICollectionLayoutValidatedContentOffsetForProposedContentOffsetForOrthogonalSection((uint64_t)v20, v17, v19, v10, v9, a6, a7, v21);
  double v24 = v23;

  objc_msgSend(a1, "_pointByApplyingBaseContentInsetsToPoint:", v22, v24);
  return result;
}

- (CGPoint)_contentOffsetForScrollingToItemAtIndexPath:(id)a3 atScrollPosition:(unint64_t)a4 additionalInsets:(NSDirectionalEdgeInsets)a5 itemFrame:(CGRect)a6
{
  double x = a6.origin.x;
  double y = a6.origin.y;
  double trailing = a5.trailing;
  double bottom = a5.bottom;
  double leading = a5.leading;
  double top = a5.top;
  [(UIView *)self bounds];
  double v14 = v13;
  double v16 = v15;
  uint64_t v52 = v18;
  uint64_t v53 = v17;
  double v19 = -[_UICollectionViewOrthogonalScrollView collectionView]((id *)&self->super.super.super.super.isa);
  id v20 = [v19 collectionViewLayout];
  [v20 _supplementaryViewInsetsForScrollingToItemAtIndexPath:a3];
  double v22 = top + v21;
  double v24 = leading + v23;
  double v26 = bottom + v25;
  double v28 = trailing + v27;
  unint64_t v29 = [(UIScrollView *)self _contentScrollableAxes];
  if (v29 == 2) {
    double v30 = 0.0;
  }
  else {
    double v30 = v28;
  }
  if (v29 == 2) {
    double v31 = 0.0;
  }
  else {
    double v31 = v24;
  }
  if (v29 == 1)
  {
    double v30 = v28;
    double v32 = 0.0;
  }
  else
  {
    double v32 = v26;
  }
  if (v29 == 1)
  {
    double v31 = v24;
    double v33 = 0.0;
  }
  else
  {
    double v33 = v22;
  }
  if (v29) {
    double v34 = v30;
  }
  else {
    double v34 = 0.0;
  }
  if (v29) {
    double v35 = v32;
  }
  else {
    double v35 = 0.0;
  }
  if (v29) {
    double v36 = v31;
  }
  else {
    double v36 = 0.0;
  }
  if (v29) {
    double v37 = v33;
  }
  else {
    double v37 = 0.0;
  }
  int v38 = dyld_program_sdk_at_least();
  if (v38) {
    double v39 = v16;
  }
  else {
    double v39 = y;
  }
  if (v38) {
    double v40 = v14;
  }
  else {
    double v40 = x;
  }
  objc_msgSend(v19, "_contentOffsetFromProposedOffset:forScrollingToItemWithFrame:atScrollPosition:additionalInsets:containingScrollViewBounds:", a4, v40, v39, x, *(void *)&v37, *(void *)&v36, *(void *)&v35, *(void *)&v34, *(void *)&v14, *(void *)&v16, v53, v52);
  double v42 = v41;
  double v44 = v43;
  uint64_t v45 = [v20 _orthogonalScrollingAxis];
  double v46 = _UIPointValueForAxis(v45, v42, v44);
  double v47 = _UISetPointValueForAxis(v45, v40, v39, v46);
  double v49 = v48;

  double v50 = v47;
  double v51 = v49;
  result.double y = v51;
  result.double x = v50;
  return result;
}

- (void)_autoScrollAssistantUpdateContentOffset:(CGPoint)a3
{
  double v4 = -[_UICollectionViewOrthogonalScrollView contentOffsetAdjustedForCurrentScrollingBehavior:itemFrame:]((id *)&self->super.super.super.super.isa, a3.x, a3.y, *MEMORY[0x1E4F1DB20], *(CGFloat *)(MEMORY[0x1E4F1DB20] + 8), *(CGFloat *)(MEMORY[0x1E4F1DB20] + 16), *(CGFloat *)(MEMORY[0x1E4F1DB20] + 24));
  v5.receiver = self;
  v5.super_class = (Class)_UICollectionViewOrthogonalScrollView;
  [(UIScrollView *)&v5 _autoScrollAssistantUpdateContentOffset:v4];
}

- (CGPoint)_contentOffsetForScrollingToTop
{
  double v2 = -[_UICollectionViewOrthogonalScrollView contentOffsetAdjustedForCurrentScrollingBehavior:itemFrame:]((id *)&self->super.super.super.super.isa, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), *MEMORY[0x1E4F1DB20], *(CGFloat *)(MEMORY[0x1E4F1DB20] + 8), *(CGFloat *)(MEMORY[0x1E4F1DB20] + 16), *(CGFloat *)(MEMORY[0x1E4F1DB20] + 24));
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (CGPoint)_pointByRemovingBaseContentInsetsFromPoint:(CGPoint)a3
{
  if (self)
  {
    double top = self->_baseContentInsets.top;
    double left = self->_baseContentInsets.left;
  }
  else
  {
    double left = 0.0;
    double top = 0.0;
  }
  double v5 = a3.x + left;
  double v6 = a3.y + top;
  result.double y = v6;
  result.double x = v5;
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_UICollectionViewOrthogonalScrollView;
  -[UIScrollView touchesBegan:withEvent:](&v8, sel_touchesBegan_withEvent_);
  double v7 = -[_UICollectionViewOrthogonalScrollView collectionView]((id *)&self->super.super.super.super.isa);
  [v7 touchesBegan:a3 withEvent:a4];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_UICollectionViewOrthogonalScrollView;
  -[UIScrollView touchesMoved:withEvent:](&v8, sel_touchesMoved_withEvent_);
  double v7 = -[_UICollectionViewOrthogonalScrollView collectionView]((id *)&self->super.super.super.super.isa);
  [v7 touchesMoved:a3 withEvent:a4];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_UICollectionViewOrthogonalScrollView;
  -[UIScrollView touchesCancelled:withEvent:](&v8, sel_touchesCancelled_withEvent_);
  double v7 = -[_UICollectionViewOrthogonalScrollView collectionView]((id *)&self->super.super.super.super.isa);
  [v7 touchesCancelled:a3 withEvent:a4];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_UICollectionViewOrthogonalScrollView;
  -[UIScrollView touchesEnded:withEvent:](&v8, sel_touchesEnded_withEvent_);
  double v7 = -[_UICollectionViewOrthogonalScrollView collectionView]((id *)&self->super.super.super.super.isa);
  [v7 touchesEnded:a3 withEvent:a4];
}

- (CGPoint)_panGestureLocationInView:(id)a3
{
  double v4 = [(UIScrollView *)self panGestureRecognizer];
  [v4 locationInView:a3];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (CGPoint)_panGestureVelocityInView:(id)a3
{
  double v4 = [(UIScrollView *)self panGestureRecognizer];
  [v4 velocityInView:a3];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (id)focusItemsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (_UIViewShouldReturnSubviewsInFocusItemsInRect())
  {
    v16.receiver = self;
    v16.super_class = (Class)_UICollectionViewOrthogonalScrollView;
    double v8 = -[UIView focusItemsInRect:](&v16, sel_focusItemsInRect_, x, y, width, height);
    double v9 = -[_UICollectionViewOrthogonalScrollView collectionView]((id *)&self->super.super.super.super.isa);
    double v10 = [(UIView *)self coordinateSpace];
    if (self) {
      int64_t section = self->_section;
    }
    else {
      int64_t section = 0;
    }
    double v12 = objc_msgSend(v9, "_focusPromiseRegionsInRect:inCoordinateSpace:inSection:", v10, section, x, y, width, height);

    double v13 = [v8 arrayByAddingObjectsFromArray:v12];
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)_UICollectionViewOrthogonalScrollView;
    double v13 = -[UIView focusItemsInRect:](&v15, sel_focusItemsInRect_, x, y, width, height);
  }
  return v13;
}

- (id)_extantFocusItemsInRect:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UICollectionViewOrthogonalScrollView;
  double v3 = -[UIView focusItemsInRect:](&v5, sel_focusItemsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return v3;
}

- (id)_childFocusRegionsInRect:(CGRect)a3 inCoordinateSpace:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (_UIViewShouldReturnSubviewsInFocusItemsInRect())
  {
    v27.receiver = self;
    v27.super_class = (Class)_UICollectionViewOrthogonalScrollView;
    double v10 = -[UIView _childFocusRegionsInRect:inCoordinateSpace:](&v27, sel__childFocusRegionsInRect_inCoordinateSpace_, a4, x, y, width, height);
  }
  else
  {
    v26.receiver = self;
    v26.super_class = (Class)_UICollectionViewOrthogonalScrollView;
    double v11 = -[UIView _childFocusRegionsInRect:inCoordinateSpace:](&v26, sel__childFocusRegionsInRect_inCoordinateSpace_, a4, x, y, width, height);
    double v12 = -[_UICollectionViewOrthogonalScrollView collectionView]((id *)&self->super.super.super.super.isa);
    double v13 = v12;
    if (self) {
      int64_t section = self->_section;
    }
    else {
      int64_t section = 0;
    }
    objc_super v15 = objc_msgSend(v12, "_focusPromiseRegionsInRect:inCoordinateSpace:inSection:", a4, section, x, y, width, height);

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v16 = v15;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v23 != v19) {
            objc_enumerationMutation(v16);
          }
          objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "setParentScrollView:", self, (void)v22);
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v28 count:16];
      }
      while (v18);
    }

    double v10 = [v11 arrayByAddingObjectsFromArray:v16];
  }
  return v10;
}

- (id)_focusScrollBoundaryMetricsForItem:(id)a3
{
  [(UIScrollView *)self _canScrollX];
  [(UIScrollView *)self _canScrollY];
  objc_super v5 = [[_UIFocusScrollBoundaryMetrics alloc] initWithFocusItem:a3 scrollView:self];
  double v6 = -[_UICollectionViewOrthogonalScrollView collectionView]((id *)&self->super.super.super.super.isa);
  double v7 = v6;
  if (self) {
    int64_t section = self->_section;
  }
  else {
    int64_t section = 0;
  }
  [v6 _updateFocusScrollBoundaryMetrics:v5 forItem:a3 inSection:section];

  if (![(_UIFocusScrollBoundaryMetrics *)v5 hasDisprovedAllRelevantAssumptions])
  {
    v11.receiver = self;
    v11.super_class = (Class)_UICollectionViewOrthogonalScrollView;
    double v9 = [(UIScrollView *)&v11 _focusScrollBoundaryMetricsForItem:a3];
    [(_UIFocusScrollBoundaryMetrics *)v5 consumeOtherMetrics:v9];
  }
  return v5;
}

- (unint64_t)_focusPrimaryScrollableAxis
{
  if ([(UIScrollView *)self _contentScrollsAlongXAxis]) {
    return 1;
  }
  if ([(UIScrollView *)self _contentScrollsAlongYAxis]) {
    return 2;
  }
  v4.receiver = self;
  v4.super_class = (Class)_UICollectionViewOrthogonalScrollView;
  return [(UIScrollView *)&v4 _focusPrimaryScrollableAxis];
}

- (UIEdgeInsets)_focusScrollableAreaInsets
{
  double leading = 0.0;
  if (!self)
  {
    double bottom = 0.0;
    double trailing = 0.0;
    double top = 0.0;
    goto LABEL_6;
  }
  descriptor = self->_descriptor;
  double bottom = 0.0;
  double trailing = 0.0;
  double top = 0.0;
  if (!descriptor)
  {
LABEL_6:
    double v7 = -top;
    double v8 = -leading;
    double v9 = -bottom;
    double v10 = -trailing;
    goto LABEL_9;
  }
  if (!descriptor->_clipsContentToBounds)
  {
    double top = descriptor->_contentInsets.top;
    double leading = descriptor->_contentInsets.leading;
    double bottom = descriptor->_contentInsets.bottom;
    double trailing = descriptor->_contentInsets.trailing;
    goto LABEL_6;
  }
  v11.receiver = self;
  v11.super_class = (Class)_UICollectionViewOrthogonalScrollView;
  [(UIScrollView *)&v11 _focusScrollableAreaInsets];
LABEL_9:
  result.right = v10;
  result.double bottom = v9;
  result.double left = v8;
  result.double top = v7;
  return result;
}

- (void)bringSubviewToFront:(id)a3
{
  objc_super v4 = self;
  if (self) {
    self = (_UICollectionViewOrthogonalScrollView *)self->_subviewRouter;
  }
  if ([(_UICollectionViewOrthogonalScrollView *)self shouldBringSubviewToFront:a3])
  {
    v5.receiver = v4;
    v5.super_class = (Class)_UICollectionViewOrthogonalScrollView;
    [(UIView *)&v5 bringSubviewToFront:a3];
  }
}

- (void)sendSubviewToBack:(id)a3
{
  objc_super v4 = self;
  if (self) {
    self = (_UICollectionViewOrthogonalScrollView *)self->_subviewRouter;
  }
  if ([(_UICollectionViewOrthogonalScrollView *)self shouldSendSubviewToBack:a3])
  {
    v5.receiver = v4;
    v5.super_class = (Class)_UICollectionViewOrthogonalScrollView;
    [(UIView *)&v5 sendSubviewToBack:a3];
  }
}

- (void)exchangeSubviewAtIndex:(int64_t)a3 withSubviewAtIndex:(int64_t)a4
{
  double v6 = self;
  if (self) {
    self = (_UICollectionViewOrthogonalScrollView *)self->_subviewRouter;
  }
  if ([(_UICollectionViewOrthogonalScrollView *)self shouldExchangeSubviewAtIndex:a3 withSubviewAtIndex:a4])
  {
    v7.receiver = v6;
    v7.super_class = (Class)_UICollectionViewOrthogonalScrollView;
    [(UIView *)&v7 exchangeSubviewAtIndex:a3 withSubviewAtIndex:a4];
  }
}

- (void)dealloc
{
  -[_UICollectionViewSubviewRouter setContainer:]((uint64_t)self->_subviewRouter, 0);
  v3.receiver = self;
  v3.super_class = (Class)_UICollectionViewOrthogonalScrollView;
  [(UIScrollView *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_subviewRouter, 0);
  objc_destroyWeak((id *)&self->_collectionView);
}

@end