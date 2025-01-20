@interface PKPassGroupView
- (BOOL)_isOurGestureRecognizer:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isLoaned;
- (BOOL)isModallyPresented;
- (BOOL)isPaused;
- (BOOL)overridePageControlAlpha:(double)a3;
- (BOOL)pageControlAlphaOverrideMatchesPredicate:(id)a3;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGPoint)_fanningPositionForCardView:(id)a3 atStackIndex:(unint64_t)a4 withSelectedFrame:(CGRect)a5;
- (CGPoint)_stackingPositionForCardView:(id)a3 atStackIndex:(unint64_t)a4 withSeparation:(BOOL)a5;
- (CGRect)_pagingFrameForCardView:(id)a3 atIndex:(unint64_t)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKGroup)group;
- (PKPassGroupView)initWithGroup:(id)a3 delegate:(id)a4 presentationState:(int64_t)a5;
- (PKPassGroupViewDelegate)delegate;
- (PKPassView)frontmostPassView;
- (PKReusablePassViewQueue)passViewQueue;
- (UIEdgeInsets)alignmentRectInsets;
- (UILongPressGestureRecognizer)pressGestureRecognizer;
- (UIOffset)offsetForFrontmostPassWhileStacked;
- (UIPageControl)pageControl;
- (_NSRange)_rangeOfFannedIndices;
- (_NSRange)_rangeOfPagingIndices;
- (_NSRange)_rangeOfVisibleIndices;
- (double)continuousShadowIndex;
- (id)_loadCardViewForIndex:(unint64_t)a3 contentMode:(int64_t)a4;
- (id)beginSuppressingPageControl;
- (id)createExternalTapGestureRecognizer;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)passViewForIndex:(unint64_t)a3;
- (int64_t)_defaultContentModeForIndex:(unint64_t)a3;
- (int64_t)presentationState;
- (unint64_t)displayIndex;
- (void)_addPanAndLongPressGestureRecognizers;
- (void)_applyContentMode:(int64_t)a3 toPassView:(id)a4 animated:(BOOL)a5;
- (void)_beginTrackingAnimation;
- (void)_endTrackingAnimation;
- (void)_enumerateIndicesInFannedOrderWithHandler:(id)a3;
- (void)_enumerateIndicesInStackOrderWithHandler:(id)a3;
- (void)_enumeratePassViewsInStackOrderWithHandler:(id)a3;
- (void)_groupViewTapped;
- (void)_handleLongPress:(id)a3;
- (void)_handlePanGesture:(id)a3;
- (void)_handlePress:(id)a3;
- (void)_layoutFan;
- (void)_layoutPages;
- (void)_layoutStack;
- (void)_pageControlChanged:(id)a3;
- (void)_preventLayoutForAction:(id)a3;
- (void)_removeDelayedAnimations;
- (void)_removePageControl;
- (void)_removePanAndLongPressGestureRecognizers;
- (void)_updateCachedGroupState;
- (void)_updateCachedLayoutState;
- (void)_updateDelegateResponderCache;
- (void)_updateFrontmostPassViewIfNecessary;
- (void)_updateLoadedViews:(BOOL)a3;
- (void)_updatePageControlFrameAnimated:(BOOL)a3;
- (void)_updatePageControlVisibilityAnimated:(BOOL)a3 withDelay:(double)a4;
- (void)_updatePageControlWithDisplayIndex;
- (void)_updatePausedState;
- (void)addPassGroupViewObserver:(id)a3;
- (void)applyContentModesAnimated:(BOOL)a3;
- (void)beginPinningFrontFaceContentMode;
- (void)clearPageControlAlphaOverride;
- (void)dealloc;
- (void)deleteButtonPressed;
- (void)didMoveToSuperview;
- (void)dismissBackOfPassIfNecessaryForUniqueID:(id)a3;
- (void)endPinningFrontFaceContentMode;
- (void)faceFrameDidChangeForPassView:(id)a3;
- (void)group:(id)a3 didInsertAssociatedAccount:(id)a4 forPass:(id)a5;
- (void)group:(id)a3 didInsertPass:(id)a4 withState:(id)a5 atIndex:(unint64_t)a6;
- (void)group:(id)a3 didMovePassFromIndex:(unint64_t)a4 toIndex:(unint64_t)a5;
- (void)group:(id)a3 didRemoveAssociatedAccountForPass:(id)a4;
- (void)group:(id)a3 didRemovePass:(id)a4 atIndex:(unint64_t)a5;
- (void)group:(id)a3 didUpdateAssociatedAccount:(id)a4 forPass:(id)a5;
- (void)group:(id)a3 didUpdatePass:(id)a4 withState:(id)a5 atIndex:(unint64_t)a6;
- (void)group:(id)a3 didUpdatePassState:(id)a4 forPass:(id)a5 atIndex:(unint64_t)a6;
- (void)invalidate;
- (void)layoutSubviews;
- (void)layoutSubviewsAnimated:(BOOL)a3;
- (void)markGroupDeleted;
- (void)passViewDidResize:(id)a3 animated:(BOOL)a4;
- (void)passViewExpandButtonTapped:(id)a3;
- (void)presentDiff:(id)a3 completion:(id)a4;
- (void)presentPassWithUniqueID:(id)a3;
- (void)presentPassWithUniqueID:(id)a3 withContext:(id)a4 animated:(BOOL)a5;
- (void)removePassGroupViewObserver:(id)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDimmer:(double)a3 animated:(BOOL)a4;
- (void)setFrontmostPassView:(id)a3;
- (void)setFrontmostPassView:(id)a3 withContext:(id)a4 animated:(BOOL)a5;
- (void)setFrontmostPassViewFromPassIndex:(int64_t)a3;
- (void)setFrontmostPassViewFromPassIndex:(int64_t)a3 withContext:(id)a4 animated:(BOOL)a5;
- (void)setLoaned:(BOOL)a3;
- (void)setModallyPresented:(BOOL)a3;
- (void)setPassViewExpanded:(BOOL)a3 forPass:(id)a4 animated:(BOOL)a5;
- (void)setPassViewQueue:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setPresentationState:(int64_t)a3;
- (void)setPresentationState:(int64_t)a3 animated:(BOOL)a4;
- (void)setPresentationState:(int64_t)a3 withContext:(id)a4 animated:(BOOL)a5;
- (void)sizeToFit;
- (void)updatePageControlFrameAnimated:(BOOL)a3;
- (void)updateToStackWithProgress:(double)a3 originalPosition:(CGPoint)a4;
@end

@implementation PKPassGroupView

- (void)didMoveToSuperview
{
  v12.receiver = self;
  v12.super_class = (Class)PKPassGroupView;
  [(PKPassGroupView *)&v12 didMoveToSuperview];
  v3 = [(PKPassGroupView *)self superview];
  if (v3)
  {
    uint64_t v4 = [(UIPageControl *)self->_pageControl superview];
    v5 = (void *)v4;
    if (v4) {
      BOOL v6 = v4 == (void)v3;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6)
    {
      [(UIPageControl *)self->_pageControl center];
      objc_msgSend(v5, "convertPoint:toView:", v3);
      uint64_t v8 = v7;
      uint64_t v10 = v9;
      [v3 insertSubview:self->_pageControl atIndex:0];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __37__PKPassGroupView_didMoveToSuperview__block_invoke;
      v11[3] = &unk_1E59CBCB8;
      v11[4] = self;
      v11[5] = v8;
      v11[6] = v10;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v11];
    }
  }
  else
  {
    [(PKPassGroupView *)self _removePageControl];
  }
}

- (PKPassGroupView)initWithGroup:(id)a3 delegate:(id)a4 presentationState:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v29.receiver = self;
  v29.super_class = (Class)PKPassGroupView;
  double v11 = *MEMORY[0x1E4F1DB28];
  double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v15 = -[PKPassGroupView initWithFrame:](&v29, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v12, v13, v14);
  if (v15)
  {
    v16 = (void *)MEMORY[0x1A6224460]();
    objc_storeWeak((id *)&v15->_delegate, v10);
    [(PKPassGroupView *)v15 _updateDelegateResponderCache];
    v17 = [(PKPassGroupView *)v15 layer];
    objc_msgSend(v17, "setAnchorPoint:", 0.5, 0.0);
    [v17 setMasksToBounds:0];
    uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v9, "passCount"));
    passViewsByUniqueID = v15->_passViewsByUniqueID;
    v15->_passViewsByUniqueID = (NSMutableDictionary *)v18;

    v20 = (PKRemoveableAnimationTrackerStore *)objc_alloc_init(MEMORY[0x1E4F84F38]);
    delayedAnimations = v15->_delayedAnimations;
    v15->_delayedAnimations = v20;

    v22 = [v10 groupViewReusablePassViewQueue:v15];
    objc_storeWeak((id *)&v15->_passViewQueue, v22);

    objc_storeStrong((id *)&v15->_group, a3);
    [(PKGroup *)v15->_group addGroupObserver:v15];
    id v23 = objc_alloc(MEMORY[0x1E4FB1BE0]);
    [(PKPassGroupView *)v15 bounds];
    uint64_t v24 = objc_msgSend(v23, "initWithFrame:");
    horizontalScrollView = v15->_horizontalScrollView;
    v15->_horizontalScrollView = (UIScrollView *)v24;

    [(UIScrollView *)v15->_horizontalScrollView setDelegate:v15];
    [(UIScrollView *)v15->_horizontalScrollView setShowsHorizontalScrollIndicator:0];
    [(UIScrollView *)v15->_horizontalScrollView setShowsVerticalScrollIndicator:0];
    [(UIScrollView *)v15->_horizontalScrollView setPagingEnabled:1];
    [(UIScrollView *)v15->_horizontalScrollView setScrollsToTop:0];
    [(UIScrollView *)v15->_horizontalScrollView setClipsToBounds:0];
    [(UIScrollView *)v15->_horizontalScrollView setScrollEnabled:0];
    [(PKPassGroupView *)v15 addSubview:v15->_horizontalScrollView];
    uint64_t v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1A40]), "initWithFrame:", v11, v12, v13, v14);
    pageControl = v15->_pageControl;
    v15->_pageControl = (UIPageControl *)v26;

    [(UIPageControl *)v15->_pageControl addTarget:v15 action:sel__pageControlChanged_ forControlEvents:4096];
    -[UIPageControl setAnchorPoint:](v15->_pageControl, "setAnchorPoint:", 0.5, 0.0);
    [(UIPageControl *)v15->_pageControl setAlpha:0.0];
    [(UIPageControl *)v15->_pageControl setAutoresizingMask:0];
    v15->_presentationState = a5;
    [(PKPassGroupView *)v15 _addPanAndLongPressGestureRecognizers];
    [(PKPassGroupView *)v15 _updateCachedLayoutState];
    [(PKPassGroupView *)v15 setFrontmostPassViewFromPassIndex:v15->_layoutState.selectedIndex];
    [(PKPassGroupView *)v15 _updateLoadedViews:1];
    [(PKPassGroupView *)v15 applyContentModesAnimated:0];
    -[UIScrollView setContentOffset:](v15->_horizontalScrollView, "setContentOffset:", CGRectGetWidth(v15->_layoutState.bounds) * (double)v15->_layoutState.selectedIndex, 0.0);
    [(PKPassGroupView *)v15 _updatePageControlVisibilityAnimated:0 withDelay:0.0];
    [(PKPassGroupView *)v15 setAccessibilityIdentifier:*MEMORY[0x1E4F85778]];
  }

  return v15;
}

- (void)_updatePageControlVisibilityAnimated:(BOOL)a3 withDelay:(double)a4
{
  BOOL v5 = a3;
  uint64_t v7 = [(PKPassGroupView *)self superview];
  unint64_t v8 = [(PKGroup *)self->_group passCount];
  unint64_t v9 = v8;
  BOOL v10 = self->_modallyPresented && v8 > 1;
  char layoutState = (char)self->_layoutState;
  int v12 = v10;
  char v13 = layoutState & 0xFE | v12;
  *(unsigned char *)&self->_char layoutState = v13;
  BOOL v14 = v12 == 1 && self->_presentationState == 3;
  if (v14 && (layoutState & 8) == 0) {
    char v15 = 4;
  }
  else {
    char v15 = 0;
  }
  char v16 = v15 | v13 & 0xFB;
  *(unsigned char *)&self->_char layoutState = v16;
  if (v7 && v14)
  {
    *(unsigned char *)&self->_char layoutState = v16 & 0xFD | (2 * (self->_pageControlSuppressionCounter == 0));
  }
  else
  {
    *(unsigned char *)&self->_char layoutState = v16 & 0xFD;
    if (!v7)
    {
      [(PKPassGroupView *)self _removePageControl];
      goto LABEL_23;
    }
  }
  uint64_t v17 = [(UIPageControl *)self->_pageControl superview];
  uint64_t v18 = (void *)v17;
  if ((void *)v17 != v7)
  {
    if (v17)
    {
      [(UIPageControl *)self->_pageControl center];
      objc_msgSend(v18, "convertPoint:toView:", v7);
      uint64_t v20 = v19;
      uint64_t v22 = v21;
      [v7 insertSubview:self->_pageControl atIndex:0];
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __66__PKPassGroupView__updatePageControlVisibilityAnimated_withDelay___block_invoke;
      v52[3] = &unk_1E59CBCB8;
      v52[4] = self;
      v52[5] = v20;
      v52[6] = v22;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v52];
    }
    else if (*(unsigned char *)&self->_layoutState)
    {
      [v7 insertSubview:self->_pageControl atIndex:0];
    }
  }

LABEL_23:
  id v23 = [(UIPageControl *)self->_pageControl superview];

  if (v9 != [(UIPageControl *)self->_pageControl numberOfPages]) {
    [(UIPageControl *)self->_pageControl setNumberOfPages:v9];
  }
  if (v23) {
    BOOL v24 = v5;
  }
  else {
    BOOL v24 = 0;
  }
  [(PKPassGroupView *)self _updatePageControlFrameAnimated:v24];
  v25 = [(UIPageControl *)self->_pageControl layer];
  double pageControlAlphaOverride = 0.0;
  if ((*(unsigned char *)&self->_layoutState & 2) != 0)
  {
    if (self->_pageControlHasAlphaOverride) {
      double pageControlAlphaOverride = self->_pageControlAlphaOverride;
    }
    else {
      double pageControlAlphaOverride = 1.0;
    }
  }
  id v51 = 0;
  pageControl = self->_pageControl;
  if (v24)
  {
    v28 = (void *)[MEMORY[0x1E4F85060] sharedDefaultFactory];
    [(UIPageControl *)pageControl pkui_setAlpha:v28 withAnimationFactory:&v51 animation:pageControlAlphaOverride];
  }
  else
  {
    [(UIPageControl *)pageControl pkui_setAlpha:0 withAnimationFactory:&v51 animation:pageControlAlphaOverride];
    if (pageControlAlphaOverride != v29) {
      [v25 removeAnimationForKey:@"opacity"];
    }
  }
  unsigned int v30 = self->_layoutState;
  if (v23 && pageControlAlphaOverride > 0.0)
  {
    v30 |= 0x40u;
    *(unsigned char *)&self->_char layoutState = v30;
  }
  if (v51)
  {
    [v51 duration];
    v32 = v31;
    [v51 setBeginTime:a4];
    if ((v30 & 4) == 0) {
      [(UIScrollView *)self->_horizontalScrollView setScrollEnabled:(*(unsigned char *)&self->_layoutState >> 2) & 1];
    }
    ++self->_scrollEnabledAnimationCounter;
    v49[0] = 0;
    v49[1] = v49;
    v49[2] = 0x2020000000;
    char v50 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__PKPassGroupView__updatePageControlVisibilityAnimated_withDelay___block_invoke_2;
    aBlock[3] = &unk_1E59D84B0;
    aBlock[4] = v49;
    v33 = _Block_copy(aBlock);
    objc_initWeak(&location, self);
    id v34 = v51;
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __66__PKPassGroupView__updatePageControlVisibilityAnimated_withDelay___block_invoke_3;
    v44[3] = &unk_1E59D84D8;
    v46[1] = v32;
    v46[2] = *(id *)&a4;
    objc_copyWeak(v46, &location);
    id v35 = v33;
    id v45 = v35;
    objc_msgSend(v34, "pkui_setDidStartHandler:", v44);
    ++self->_pageControlAnimationCounter;
    id v36 = v51;
    uint64_t v38 = MEMORY[0x1E4F143A8];
    uint64_t v39 = 3221225472;
    v40 = __66__PKPassGroupView__updatePageControlVisibilityAnimated_withDelay___block_invoke_5;
    v41 = &unk_1E59CB0D8;
    objc_copyWeak(&v43, &location);
    id v37 = v35;
    id v42 = v37;
    objc_msgSend(v36, "pkui_setCompletionHandler:", &v38);
    objc_msgSend(v25, "removeAnimationForKey:", @"opacity", v38, v39, v40, v41);
    [v25 addAnimation:v51 forKey:@"opacity"];

    objc_destroyWeak(&v43);
    objc_destroyWeak(v46);
    objc_destroyWeak(&location);

    _Block_object_dispose(v49, 8);
  }
  else
  {
    if ((v30 & 4) == 0 || !self->_scrollEnabledAnimationCounter)
    {
      [(UIScrollView *)self->_horizontalScrollView setScrollEnabled:(v30 >> 2) & 1];
      LOBYTE(v30) = self->_layoutState;
    }
    if ((v30 & 1) == 0 && (v30 & 2) == 0 && !self->_pageControlAnimationCounter) {
      [(PKPassGroupView *)self _removePageControl];
    }
  }
}

- (void)_removePageControl
{
  v3 = [(UIPageControl *)self->_pageControl superview];

  if (v3)
  {
    [(UIPageControl *)self->_pageControl removeFromSuperview];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __37__PKPassGroupView__removePageControl__block_invoke;
    v5[3] = &unk_1E59CA7D0;
    v5[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v5];
    uint64_t v4 = [(UIPageControl *)self->_pageControl layer];
    [v4 removeAllAnimations];
    [v4 clearHasBeenCommitted];
    *(unsigned char *)&self->_layoutState &= 0x9Fu;
  }
}

- (void)_updatePageControlFrameAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(UIPageControl *)self->_pageControl superview];

  if (v5)
  {
    if (v3)
    {
      unsigned int layoutState = self->_layoutState;
      if ((layoutState & 0x20) != 0)
      {
        int v7 = (layoutState >> 6) & 1;
        if (self->_pageControlAnimationCounter) {
          LOBYTE(v3) = 1;
        }
        else {
          LOBYTE(v3) = v7;
        }
      }
      else
      {
        LOBYTE(v3) = 0;
      }
    }
    [(UIPageControl *)self->_pageControl frame];
    -[UIPageControl sizeThatFits:](self->_pageControl, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__PKPassGroupView__updatePageControlFrameAnimated___block_invoke;
    aBlock[3] = &unk_1E59D8488;
    BOOL v34 = v3;
    aBlock[4] = self;
    unint64_t v8 = _Block_copy(aBlock);
    unint64_t v9 = [(PKPassView *)self->_frontmostPassView superview];

    if (v9)
    {
      [(PKPassGroupView *)self center];
      double v31 = v11;
      double v32 = v10;
      [(PKPassGroupView *)self anchorPoint];
      double v13 = v12;
      double v15 = v14;
      [(PKPassGroupView *)self bounds];
      double v17 = v16;
      double v19 = v18;
      [(PKPassView *)self->_frontmostPassView frameOfVisibleFace];
      -[PKPassGroupView convertRect:fromView:](self, "convertRect:fromView:", self->_frontmostPassView);
      PKSizeAlignedInRect();
      double v21 = v20;
      double v23 = v22;
      PKFloatRoundToPixel();
      double v25 = v32 - v13 * v17 + v24;
      PKFloatRoundToPixel();
      v27.n128_f64[0] = v31 - v15 * v19 + v26;
    }
    else
    {
      if ((*(unsigned char *)&self->_layoutState & 0x20) == 0)
      {
LABEL_13:

        return;
      }
      PKSizeAlignedInRect();
      double v25 = v28;
      double v21 = v29;
      double v23 = v30;
    }
    (*((void (**)(void *, UIPageControl *, double, __n128, double, double))v8 + 2))(v8, self->_pageControl, v25, v27, v21, v23);
    goto LABEL_13;
  }
}

- (void)setFrontmostPassViewFromPassIndex:(int64_t)a3
{
}

- (void)_updateDelegateResponderCache
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  p_unsigned int layoutState = &self->_layoutState;
  if (objc_opt_respondsToSelector()) {
    char v6 = 8;
  }
  else {
    char v6 = 0;
  }
  *((unsigned char *)&self->_layoutState + 16) = *((unsigned char *)&self->_layoutState + 16) & 0xF7 | v6;

  id v7 = objc_loadWeakRetained((id *)p_delegate);
  if (objc_opt_respondsToSelector()) {
    char v8 = 16;
  }
  else {
    char v8 = 0;
  }
  *((unsigned char *)p_layoutState + 16) = *((unsigned char *)p_layoutState + 16) & 0xEF | v8;

  id v10 = objc_loadWeakRetained((id *)p_delegate);
  if (objc_opt_respondsToSelector()) {
    char v9 = 32;
  }
  else {
    char v9 = 0;
  }
  *((unsigned char *)p_layoutState + 16) = *((unsigned char *)p_layoutState + 16) & 0xDF | v9;
}

- (void)_addPanAndLongPressGestureRecognizers
{
  if (!self->_panGestureRecognizer)
  {
    BOOL v3 = (UIPanGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:self action:sel__handlePanGesture_];
    panGestureRecognizer = self->_panGestureRecognizer;
    self->_panGestureRecognizer = v3;

    [(PKPassGroupView *)self addGestureRecognizer:self->_panGestureRecognizer];
    [(UIPanGestureRecognizer *)self->_panGestureRecognizer setDelegate:self];
  }
  if (!self->_longPressGestureRecognizer)
  {
    BOOL v5 = (UILongPressGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:self action:sel__handleLongPress_];
    longPressGestureRecognizer = self->_longPressGestureRecognizer;
    self->_longPressGestureRecognizer = v5;

    [(PKPassGroupView *)self addGestureRecognizer:self->_longPressGestureRecognizer];
    [(UILongPressGestureRecognizer *)self->_longPressGestureRecognizer setDelegate:self];
    [(UILongPressGestureRecognizer *)self->_longPressGestureRecognizer setMinimumPressDuration:0.3];
  }
  if (!self->_pressGestureRecognizer)
  {
    id v7 = (UILongPressGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:self action:sel__handlePress_];
    pressGestureRecognizer = self->_pressGestureRecognizer;
    self->_pressGestureRecognizer = v7;

    [(PKPassGroupView *)self addGestureRecognizer:self->_pressGestureRecognizer];
    [(UILongPressGestureRecognizer *)self->_pressGestureRecognizer setDelegate:self];
    char v9 = self->_pressGestureRecognizer;
    [(UILongPressGestureRecognizer *)v9 setMinimumPressDuration:0.15];
  }
}

uint64_t __37__PKPassGroupView__updatePausedState__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setPaused:*(unsigned __int8 *)(*(void *)(a1 + 32) + 651)];
}

- (void)layoutSubviews
{
  v42.receiver = self;
  v42.super_class = (Class)PKPassGroupView;
  id v3 = [(PKPassGroupView *)&v42 layoutSubviews];
  if (self->_preventLayoutCounter)
  {
    self->_preventedLayout = 1;
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x1A6224460](v3);
    p_unsigned int layoutState = &self->_layoutState;
    char v6 = *((unsigned char *)&self->_layoutState + 16);
    if (v6) {
      [(PKPassGroupView *)self _removeDelayedAnimations];
    }
    self->_layoutState.deladouble y = 0.0;
    [(PKPassGroupView *)self bounds];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    if ((*((unsigned char *)&self->_layoutState + 16) & 4) != 0)
    {
      double x = self->_layoutState.priorContentOffset.x;
      double y = self->_layoutState.priorContentOffset.y;
    }
    else
    {
      [(UIScrollView *)self->_horizontalScrollView contentOffset];
      double x = v13;
      double y = v15;
    }
    [(UIScrollView *)self->_horizontalScrollView contentSize];
    double v18 = v17;
    double v20 = v19;
    double v21 = [(PKPassGroupView *)self frontmostPassView];
    [v21 sizeToFit];
    [v21 sizeOfFront];
    double v23 = v22;
    [(UIScrollView *)self->_horizontalScrollView frame];
    v44.origin.double x = v8;
    v44.origin.double y = v10;
    v44.size.width = v12;
    v44.size.height = v23;
    if (!CGRectEqualToRect(v43, v44)) {
      -[UIScrollView setFrame:](self->_horizontalScrollView, "setFrame:", v8, v10, v12, v23);
    }
    [(PKPassGroupView *)self _updateCachedLayoutState];
    double v24 = self->_layoutState.bounds.size.width * (double)self->_layoutState.numberOfPasses;
    int v25 = [(UIScrollView *)self->_horizontalScrollView isScrollAnimating];
    if (v25) {
      double v26 = v18;
    }
    else {
      double v26 = v24;
    }
    if (v25) {
      double v27 = v20;
    }
    else {
      double v27 = v23;
    }
    if (v26 != v18 || v27 != v20) {
      -[UIScrollView setContentSize:](self->_horizontalScrollView, "setContentSize:");
    }
    self->_layoutState.instantaneousContentOffsetDelta.double x = self->_layoutState.bounds.origin.x - x;
    self->_layoutState.instantaneousContentOffsetDelta.double y = self->_layoutState.bounds.origin.y - y;
    if (v6)
    {
      [MEMORY[0x1E4F39CF8] begin];
      [(PKPassGroupView *)self _beginTrackingAnimation];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __33__PKPassGroupView_layoutSubviews__block_invoke;
      v41[3] = &unk_1E59CA7D0;
      v41[4] = self;
      [MEMORY[0x1E4F39CF8] setCompletionBlock:v41];
    }
    [(PKPassGroupView *)self applyContentModesAnimated:v6 & 1];
    int64_t presentationState = self->_presentationState;
    if (presentationState == 3)
    {
      if ((unint64_t)[(PKGroup *)self->_group passCount] >= 2)
      {
        double v30 = [(UIScrollView *)self->_horizontalScrollView layer];
        long long v31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
        v36[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
        v36[3] = v31;
        v36[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
        uint64_t v32 = *(void *)(MEMORY[0x1E4F39B10] + 80);
        long long v33 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
        v36[0] = *MEMORY[0x1E4F39B10];
        v36[1] = v33;
        uint64_t v37 = v32;
        unint64_t v38 = 0xBF847AE147AE147BLL;
        long long v34 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
        long long v39 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
        long long v40 = v34;
        [v30 setSublayerTransform:v36];
      }
      int64_t presentationState = self->_presentationState;
    }
    double v35 = 0.0;
    if ((unint64_t)(presentationState - 1) >= 2)
    {
      if (presentationState == 3)
      {
        if ((*(unsigned char *)p_layoutState & 8) != 0)
        {
          if ((*(unsigned char *)p_layoutState & 0x10) != 0) {
            [(PKPassGroupView *)self _layoutFan];
          }
        }
        else if (v6)
        {
          if ((*((unsigned char *)&self->_layoutState + 16) & 2) != 0)
          {
            [(PKPassGroupView *)self _layoutFan];
            self->_layoutState.deladouble y = self->_layoutState.delay + 0.45;
          }
          [(PKPassGroupView *)self _layoutPages];
          double v35 = dbl_1A04446C0[(*((unsigned char *)&self->_layoutState + 16) & 2) == 0];
        }
        else
        {
          [(PKPassGroupView *)self _layoutPages];
        }
      }
    }
    else
    {
      [(PKPassGroupView *)self _layoutStack];
    }
    [(PKPassGroupView *)self _updatePageControlVisibilityAnimated:(*(unsigned char *)p_layoutState & 8) == 0 withDelay:v35];
    if (v6) {
      [MEMORY[0x1E4F39CF8] commit];
    }
    self->_layoutState.instantaneousContentOffsetDelta = (CGPoint)*MEMORY[0x1E4F1DAD8];
  }
}

- (void)applyContentModesAnimated:(BOOL)a3
{
  int64_t presentationState = self->_presentationState;
  if (presentationState == 1)
  {
    if ((*((unsigned char *)&self->_layoutState + 16) & 8) == 0)
    {
LABEL_8:
      selectedIndedouble x = self->_layoutState.selectedIndex;
      uint64_t v6 = 2;
      goto LABEL_13;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v8 = [WeakRetained groupViewContentModeForFrontmostPassWhenStacked:self];
LABEL_11:
    uint64_t v6 = v8;

    int64_t presentationState = self->_presentationState;
LABEL_12:
    selectedIndedouble x = self->_layoutState.selectedIndex;
    if ((unint64_t)(presentationState - 1) >= 2)
    {
      if (presentationState != 3)
      {
        uint64_t v11 = 0;
        uint64_t v10 = 1;
        goto LABEL_20;
      }
      goto LABEL_15;
    }
LABEL_13:
    uint64_t v10 = 1;
    uint64_t v11 = 1;
    goto LABEL_20;
  }
  if (presentationState == 2)
  {
    if ((*((unsigned char *)&self->_layoutState + 16) & 0x10) == 0) {
      goto LABEL_8;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v8 = [WeakRetained groupViewContentModeForFrontmostPassWhenPiled:self withDefaultContentMode:2];
    goto LABEL_11;
  }
  if (presentationState != 3)
  {
    uint64_t v6 = 0;
    goto LABEL_12;
  }
  uint64_t v6 = 5;
LABEL_15:
  if (self->_animationCounter) {
    uint64_t v11 = 3;
  }
  else {
    uint64_t v11 = 4;
  }
  selectedIndedouble x = [(PKPassGroupView *)self _rangeOfPagingIndices];
LABEL_20:
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __45__PKPassGroupView_applyContentModesAnimated___block_invoke;
  v12[3] = &unk_1E59D8350;
  v12[4] = self;
  v12[5] = selectedIndex;
  v12[6] = v10;
  v12[7] = v6;
  v12[8] = v11;
  BOOL v13 = a3;
  [(PKPassGroupView *)self _enumeratePassViewsInStackOrderWithHandler:v12];
}

- (void)_updateCachedLayoutState
{
  [(PKPassGroupView *)self _updateCachedGroupState];
  [(UIScrollView *)self->_horizontalScrollView bounds];
  self->_layoutState.bounds.origin.double x = v3;
  self->_layoutState.bounds.origin.double y = v4;
  self->_layoutState.bounds.size.width = v5;
  self->_layoutState.bounds.size.height = v6;
}

- (void)_updateCachedGroupState
{
  p_unsigned int layoutState = &self->_layoutState;
  self->_layoutState.unint64_t numberOfPasses = [(PKGroup *)self->_group passCount];
  unint64_t v4 = [(PKGroup *)self->_group frontmostPassIndex];
  unint64_t numberOfPasses = self->_layoutState.numberOfPasses;
  BOOL v6 = numberOfPasses != 0;
  unint64_t v7 = numberOfPasses - 1;
  if (v6) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = 0;
  }
  if (v4 < v8) {
    unint64_t v8 = [(PKGroup *)self->_group frontmostPassIndex];
  }
  p_layoutState->selectedIndedouble x = v8;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKPassView sizeThatFits:](self->_frontmostPassView, "sizeThatFits:", a3.width, a3.height);
  double v5 = v4;
  double v7 = v6;
  if ((*(unsigned char *)&self->_layoutState & 2) != 0)
  {
    -[UIPageControl sizeThatFits:](self->_pageControl, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    double v7 = v7 + v8 + 6.0;
  }
  double v9 = v5 + 8.0;
  double v10 = v7;
  result.height = v10;
  result.width = v9;
  return result;
}

- (PKGroup)group
{
  return self->_group;
}

- (PKPassView)frontmostPassView
{
  return self->_frontmostPassView;
}

- (BOOL)isLoaned
{
  return self->_loaned;
}

- (void)setPresentationState:(int64_t)a3 withContext:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  int64_t presentationState = self->_presentationState;
  char layoutState = (char)self->_layoutState;
  if (presentationState != a3 || (layoutState & 8) != 0)
  {
    self->_int64_t presentationState = a3;
    id v15 = v8;
    if (presentationState != a3 && !v5)
    {
      [(PKPassGroupView *)self _removeDelayedAnimations];
      a3 = self->_presentationState;
    }
    BOOL v12 = a3 == 3 && (unint64_t)[(PKGroup *)self->_group passCount] > 1;
    int v13 = [v15 presentFanned];
    *(unsigned char *)&self->_layoutState &= 0xE7u;
    if ((((layoutState & 0x18) != 8) & ~(_BYTE)v13 & v12) != 0) {
      char v14 = 2;
    }
    else {
      char v14 = 0;
    }
    *((unsigned char *)&self->_layoutState + 16) = *((unsigned char *)&self->_layoutState + 16) & 0xFD | v14;
    [(PKPassGroupView *)self setNeedsLayout];
    [(PKPassGroupView *)self layoutSubviewsAnimated:v5 & ~(v13 & v12)];
    *((unsigned char *)&self->_layoutState + 16) &= ~2u;
    [(PKPassGroupView *)self _updatePausedState];
    [(PKPassGroupView *)self _updatePageControlVisibilityAnimated:v5 withDelay:0.0];
    id v8 = v15;
  }
}

- (void)updatePageControlFrameAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(UIPageControl *)self->_pageControl superview];
  if ((*(unsigned char *)&self->_layoutState & 4) != 0 || v5)
  {
    id v7 = v5;
    id v6 = [(PKPassGroupView *)self superview];

    if (v7 == v6) {
      [(PKPassGroupView *)self _updatePageControlFrameAnimated:v3];
    }
    else {
      [(PKPassGroupView *)self _updatePageControlVisibilityAnimated:1 withDelay:0.0];
    }
    BOOL v5 = v7;
  }
}

- (void)sizeToFit
{
  [(PKPassView *)self->_frontmostPassView frame];
  double v4 = v3;
  double v6 = v5;
  [(PKPassView *)self->_frontmostPassView sizeToFit];
  v10.receiver = self;
  v10.super_class = (Class)PKPassGroupView;
  [(PKPassGroupView *)&v10 sizeToFit];
  [(PKPassView *)self->_frontmostPassView frame];
  if (v4 != v8 || v6 != v7) {
    [(PKPassGroupView *)self setNeedsLayout];
  }
}

- (void)setPresentationState:(int64_t)a3
{
}

- (UIPageControl)pageControl
{
  return self->_pageControl;
}

- (void)addPassGroupViewObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E4F28D30], "pk_weakObjectsHashTableUsingPointerPersonality");
    double v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    double v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)setPresentationState:(int64_t)a3 animated:(BOOL)a4
{
}

- (UIOffset)offsetForFrontmostPassWhileStacked
{
  [(PKPassGroupView *)self _rangeOfVisibleIndices];
  if (v2 <= 1) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = v2;
  }
  double v4 = (double)(unint64_t)(v3 - 1) * 6.0;
  double v5 = 0.0;
  result.vertical = v4;
  result.horizontal = v5;
  return result;
}

- (void)_updateLoadedViews:(BOOL)a3
{
  double v5 = (void *)MEMORY[0x1A6224460](self, a2);
  uint64_t v8 = 0;
  double v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__PKPassGroupView__updateLoadedViews___block_invoke;
  v6[3] = &unk_1E59D8440;
  BOOL v7 = a3;
  v6[4] = self;
  v6[5] = &v8;
  [(PKPassGroupView *)self _preventLayoutForAction:v6];
  if (*((unsigned char *)v9 + 24)) {
    [(PKPassGroupView *)self setNeedsLayout];
  }
  _Block_object_dispose(&v8, 8);
}

- (void)_layoutStack
{
  p_char layoutState = &self->_layoutState;
  char v4 = *((unsigned char *)&self->_layoutState + 16) & 1;
  double x = self->_layoutState.instantaneousContentOffsetDelta.x;
  double y = self->_layoutState.instantaneousContentOffsetDelta.y;
  self->_layoutState.instantaneousContentOffsetDelta = (CGPoint)*MEMORY[0x1E4F1DAD8];
  double v7 = self->_layoutState.bounds.origin.x;
  selectedIndedouble x = (double)self->_layoutState.selectedIndex;
  double v9 = self->_layoutState.bounds.origin.y;
  v18.size.width = self->_layoutState.bounds.size.width;
  v18.size.height = self->_layoutState.bounds.size.height;
  v18.origin.double x = v7;
  v18.origin.double y = v9;
  CGFloat v10 = CGRectGetWidth(v18) * selectedIndex;
  p_layoutState->bounds.origin.double x = v10;
  p_layoutState->bounds.origin.double y = 0.0;
  double v11 = x + v10 - v7;
  -[UIScrollView setContentOffset:animated:](self->_horizontalScrollView, "setContentOffset:animated:", 0, v10, 0.0);
  BOOL v12 = self->_presentationState == 2;
  uint64_t v13 = [(PKPassGroupView *)self _rangeOfVisibleIndices];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __31__PKPassGroupView__layoutStack__block_invoke;
  v15[3] = &unk_1E59D82B0;
  v15[4] = self;
  *(double *)&v15[5] = v11;
  *(double *)&v15[6] = y + 0.0 - v9;
  BOOL v16 = v12;
  char v17 = v4;
  v15[7] = v13;
  v15[8] = v14;
  [(PKPassGroupView *)self _enumeratePassViewsInStackOrderWithHandler:v15];
}

- (void)_enumeratePassViewsInStackOrderWithHandler:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    double v5 = [(NSMutableDictionary *)self->_passViewsByUniqueID allKeys];
    double v6 = (void *)[v5 mutableCopy];

    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __62__PKPassGroupView__enumeratePassViewsInStackOrderWithHandler___block_invoke;
    v25[3] = &unk_1E59D83A0;
    v25[4] = self;
    id v7 = v6;
    id v26 = v7;
    [(PKPassGroupView *)self _enumerateIndicesInStackOrderWithHandler:v25];
    if ([v7 count])
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __62__PKPassGroupView__enumeratePassViewsInStackOrderWithHandler___block_invoke_2;
      v21[3] = &unk_1E59D83C8;
      id v22 = v7;
      double v23 = self;
      id v24 = v4;
      [(PKPassGroupView *)self _enumerateIndicesInFannedOrderWithHandler:v21];
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [(PKGroup *)self->_group indexForPassUniqueID:*(void *)(*((void *)&v17 + 1) + 8 * v12)];
          uint64_t v14 = [(PKPassGroupView *)self passViewForIndex:v13];
          if (v14) {
            (*((void (**)(id, void *, uint64_t, void))v4 + 2))(v4, v14, v13, 0);
          }

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v27 count:16];
      }
      while (v10);
    }

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __62__PKPassGroupView__enumeratePassViewsInStackOrderWithHandler___block_invoke_3;
    v15[3] = &unk_1E59D83F0;
    v15[4] = self;
    id v16 = v4;
    [(PKPassGroupView *)self _enumerateIndicesInStackOrderWithHandler:v15];
  }
}

- (void)_enumerateIndicesInStackOrderWithHandler:(id)a3
{
  id v4 = a3;
  [(PKPassGroupView *)self _rangeOfVisibleIndices];
  PKEnumerateRangeInStackOrder();
}

- (_NSRange)_rangeOfVisibleIndices
{
  if ((*((unsigned char *)&self->_layoutState + 16) & 2) != 0) {
    uint64_t v2 = 5;
  }
  else {
    uint64_t v2 = 3;
  }
  NSUInteger v3 = MEMORY[0x1F413B220](0, self->_layoutState.numberOfPasses, self->_layoutState.selectedIndex, v2);
  result.length = v4;
  result.id location = v3;
  return result;
}

- (_NSRange)_rangeOfPagingIndices
{
  unint64_t numberOfPasses = self->_layoutState.numberOfPasses;
  selectedIndedouble x = self->_layoutState.selectedIndex;
  uint64_t v4 = 1;
  if (selectedIndex) {
    uint64_t v4 = 2;
  }
  BOOL v5 = selectedIndex != 0;
  NSUInteger v6 = selectedIndex - 1;
  if (v5) {
    NSUInteger v7 = v6;
  }
  else {
    NSUInteger v7 = 0;
  }
  if (v4 + v7 >= numberOfPasses) {
    NSUInteger v8 = v4;
  }
  else {
    NSUInteger v8 = v4 + 1;
  }
  result.length = v8;
  result.id location = v7;
  return result;
}

- (void)setFrontmostPassViewFromPassIndex:(int64_t)a3 withContext:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = [(PKPassGroupView *)self passViewForIndex:a3];
  [(PKPassGroupView *)self setFrontmostPassView:v9 withContext:v8 animated:v5];
}

void __62__PKPassGroupView__enumeratePassViewsInStackOrderWithHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) passViewForIndex:a2];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __62__PKPassGroupView__enumeratePassViewsInStackOrderWithHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 688) passAtIndex:a2];
  id v5 = [v3 uniqueID];

  uint64_t v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 40) removeObject:v5];
    uint64_t v4 = v5;
  }
}

- (id)passViewForIndex:(unint64_t)a3
{
  uint64_t v4 = [(PKGroup *)self->_group passAtIndex:a3];
  id v5 = [v4 uniqueID];

  NSUInteger v6 = [(NSMutableDictionary *)self->_passViewsByUniqueID objectForKey:v5];

  return v6;
}

uint64_t __45__PKPassGroupView_applyContentModesAnimated___block_invoke(uint64_t result, uint64_t a2, unint64_t a3)
{
  if (a2)
  {
    unint64_t v3 = *(void *)(result + 40);
    BOOL v4 = a3 - v3 < *(void *)(result + 48) && a3 >= v3;
    uint64_t v5 = 64;
    if (v4) {
      uint64_t v5 = 56;
    }
    return [*(id *)(result + 32) _applyContentMode:*(void *)(result + v5) toPassView:a2 animated:*(unsigned __int8 *)(result + 72)];
  }
  return result;
}

- (void)_applyContentMode:(int64_t)a3 toPassView:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v11 = (PKPassView *)a4;
  int64_t v8 = [(PKPassView *)v11 contentMode];
  if (self->_animationCounter)
  {
    BOOL v9 = 0;
  }
  else if (self->_frontFaceContentModePinningCounter)
  {
    BOOL v9 = self->_frontmostPassView != v11;
  }
  else
  {
    BOOL v9 = 1;
  }
  if (v8 < a3) {
    BOOL v9 = 1;
  }
  if (v8 != a3 && v9)
  {
    double v10 = v5 ? 0.5 : 0.0;
    if (a3 == 5
      || v8 != 5
      || !v5
      || ([(PKPassView *)v11 setContentMode:4 animated:1], a3 != 4))
    {
      [(PKPassView *)v11 setContentMode:a3 animated:v5 withDelay:v10];
    }
  }
}

void __31__PKPassGroupView__layoutStack__block_invoke(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(v8 + 520);
    long long v40 = v7;
    [*(id *)(v8 + 576) bringSubviewToFront:v7];
    double v10 = [v40 layer];
    [v10 position];
    double v12 = v11;
    double v14 = v13;
    double v15 = *(double *)(a1 + 40);
    double v16 = *(double *)(a1 + 48);
    [*(id *)(a1 + 32) _stackingPositionForCardView:v40 atStackIndex:a4 withSeparation:*(unsigned char *)(a1 + 72) == 0];
    double v19 = v17;
    double v20 = v18;
    if (*(unsigned char *)(a1 + 73))
    {
      double v21 = v14 + v16;
      double v22 = v12 + v15;
      if (v17 != v22 || v18 != v21)
      {
        id v24 = [MEMORY[0x1E4F85060] springAnimationWithKeyPath:@"position"];
        objc_msgSend(v24, "pkui_updateForAdditiveAnimationFromPoint:toPoint:", v22, v21, v19, v20);
        id v25 = (id)objc_msgSend(v10, "pkui_addAdditiveAnimation:", v24);
      }
    }
    objc_msgSend(v10, "setPosition:", v19, v20);
    [v10 opacity];
    unint64_t v27 = *(void *)(a1 + 56);
    double v28 = 0.0;
    BOOL v29 = a3 >= v27;
    unint64_t v30 = a3 - v27;
    if (v29 && v30 < *(void *)(a1 + 64))
    {
      if (*(unsigned char *)(a1 + 72)) {
        BOOL v31 = v9 == a3;
      }
      else {
        BOOL v31 = 1;
      }
      unsigned int v32 = v31;
      double v28 = (double)v32;
    }
    if (*(unsigned char *)(a1 + 73))
    {
      double v33 = *(float *)&v26;
      if (v28 != *(float *)&v26)
      {
        long long v34 = [MEMORY[0x1E4F85060] springAnimationWithKeyPath:@"opacity"];
        objc_msgSend(v34, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v33, v28);
        id v35 = (id)objc_msgSend(v10, "pkui_addAdditiveAnimation:", v34);
      }
    }
    *(float *)&double v26 = v28;
    [v10 setOpacity:v26];
    [v10 zPosition];
    if (v36 != 0.0)
    {
      double v37 = v36;
      unint64_t v38 = [MEMORY[0x1E4F85060] springAnimationWithKeyPath:@"zPosition"];
      objc_msgSend(v38, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v37, 0.0);
      id v39 = (id)objc_msgSend(v10, "pkui_addAdditiveAnimation:", v38);
      [v10 setZPosition:0.0];
    }
    [v40 setDimmer:*(unsigned __int8 *)(a1 + 73) animated:*(double *)(*(void *)(a1 + 32) + 584)];
    [v40 setModalShadowVisibility:*(unsigned __int8 *)(a1 + 73) animated:0.0];

    id v7 = v40;
  }
}

- (CGPoint)_stackingPositionForCardView:(id)a3 atStackIndex:(unint64_t)a4 withSeparation:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  [v7 bounds];
  PKSizeAlignedInRect();
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  if (v5) {
    double v15 = v8 + (double)a4 * 6.0;
  }
  else {
    double v15 = v8;
  }
  [v7 anchorPoint];
  double v17 = v16;
  double v19 = v18;

  double v20 = v10 + v17 * v12;
  double v21 = v15 + v19 * v14;
  result.double y = v21;
  result.double x = v20;
  return result;
}

void __38__PKPassGroupView__updateLoadedViews___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 32;
  uint64_t v3 = [*(id *)(a1 + 32) _rangeOfPagingIndices];
  uint64_t v5 = v4;
  NSUInteger v6 = [*(id *)(*(void *)v2 + 560) allKeys];
  id v7 = (void *)[v6 mutableCopy];

  uint64_t v28 = 0;
  BOOL v29 = &v28;
  uint64_t v30 = 0x3032000000;
  BOOL v31 = __Block_byref_object_copy__34;
  unsigned int v32 = __Block_byref_object_dispose__34;
  id v33 = 0;
  double v8 = *(void **)v2;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __38__PKPassGroupView__updateLoadedViews___block_invoke_60;
  v21[3] = &unk_1E59D8418;
  char v27 = *(unsigned char *)(a1 + 48);
  uint64_t v25 = v3;
  uint64_t v26 = v5;
  uint64_t v9 = *(void *)(a1 + 40);
  void v21[4] = v8;
  uint64_t v23 = v9;
  id v24 = &v28;
  id v10 = v7;
  id v22 = v10;
  [v8 _enumerateIndicesInStackOrderWithHandler:v21];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        double v16 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 560), "objectForKey:", v15, (void)v17);
        [v16 removeFromSuperview];
        [v16 setDelegate:0];
        [*(id *)(*(void *)(a1 + 32) + 560) removeObjectForKey:v15];
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v34 count:16];
    }
    while (v12);
  }

  if (v29[5]) {
    objc_msgSend(*(id *)(a1 + 32), "setFrontmostPassView:");
  }

  _Block_object_dispose(&v28, 8);
}

- (void)setFrontmostPassView:(id)a3 withContext:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = (PKPassView *)a3;
  id v10 = a4;
  p_frontmostPassView = (id *)&self->_frontmostPassView;
  frontmostPassView = self->_frontmostPassView;
  if (frontmostPassView != v9)
  {
    long long v20 = v9;
    if (frontmostPassView)
    {
      uint64_t v13 = [(PKPassView *)frontmostPassView contentMode];
      frontmostPassView = (PKPassView *)*p_frontmostPassView;
    }
    else
    {
      uint64_t v13 = 1;
    }
    [(PKPassView *)frontmostPassView setModallyPresented:0];
    objc_storeStrong((id *)&self->_frontmostPassView, a3);
    if (*p_frontmostPassView)
    {
      if (self->_modallyPresented) {
        [*p_frontmostPassView setModallyPresented:1];
      }
      if (self->_frontFaceContentModePinningCounter && v13 > [*p_frontmostPassView contentMode]) {
        [*p_frontmostPassView setContentMode:v13 animated:v5];
      }
    }
    [(PKPassGroupView *)self sizeToFit];
    [(PKPassGroupView *)self _updatePageControlFrameAnimated:1];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    double v14 = self->_observers;
    uint64_t v15 = [(NSHashTable *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          long long v19 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v19 groupView:self frontmostPassViewDidChange:*p_frontmostPassView withContext:v10];
          }
        }
        uint64_t v16 = [(NSHashTable *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v16);
    }

    uint64_t v9 = v20;
  }
}

- (id)_loadCardViewForIndex:(unint64_t)a3 contentMode:(int64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_passViewQueue);
  double v8 = [WeakRetained dequeueReusablePassView];

  if (v8) {
    goto LABEL_2;
  }
  if (self->_invalidated)
  {
    double v8 = 0;
    goto LABEL_10;
  }
  id v10 = [(PKGroup *)self->_group passAtIndex:a3];
  id v11 = [(PKGroup *)self->_group stateAtIndex:a3];
  id v12 = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v13 = [v12 groupViewPassesSuppressedContent:self];

  double v8 = [[PKPassView alloc] initWithPass:v10 content:a4 suppressedContent:v13];
  [(PKPassView *)v8 setPassState:v11];

  if (v8)
  {
LABEL_2:
    [(PKPassView *)v8 setDelegate:self];
    [(UIScrollView *)self->_horizontalScrollView addSubview:v8];
    uint64_t v9 = [(PKPassView *)v8 uniqueID];
    if (v9) {
      [(NSMutableDictionary *)self->_passViewsByUniqueID setObject:v8 forKey:v9];
    }
    [(PKPassView *)v8 setPaused:self->_effectivePaused];
    [(PKPassView *)v8 sizeToFit];
    if (self->_presentationState == 3)
    {
      [(PKPassGroupView *)self _pagingFrameForCardView:v8 atIndex:a3];
      -[PKPassView setFrame:](v8, "setFrame:");
    }
  }
LABEL_10:

  return v8;
}

- (int64_t)_defaultContentModeForIndex:(unint64_t)a3
{
  int64_t presentationState = self->_presentationState;
  if (presentationState == 1) {
    goto LABEL_4;
  }
  if (presentationState == 3) {
    return 5;
  }
  if (presentationState != 2) {
    return 2;
  }
LABEL_4:
  if (self->_layoutState.selectedIndex == a3) {
    return 2;
  }
  return 1;
}

- (void)setFrontmostPassView:(id)a3
{
}

- (void)faceFrameDidChangeForPassView:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (PKPassView *)a3;
  if (self->_frontmostPassView == v4)
  {
    [(PKPassGroupView *)self updatePageControlFrameAnimated:0];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    BOOL v5 = self->_observers;
    uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v10, "groupView:faceViewFrameDidChangeForFrontmostPassView:", self, v4, (void)v11);
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    self->_paused = a3;
    [(PKPassGroupView *)self _updatePausedState];
  }
}

- (void)_updatePausedState
{
  BOOL v2 = self->_invalidated || self->_paused;
  if (self->_effectivePaused != v2)
  {
    self->_effectivePaused = v2;
    passViewsByUniqueID = self->_passViewsByUniqueID;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __37__PKPassGroupView__updatePausedState__block_invoke;
    v4[3] = &unk_1E59D8328;
    v4[4] = self;
    [(NSMutableDictionary *)passViewsByUniqueID enumerateKeysAndObjectsUsingBlock:v4];
  }
}

- (void)dealloc
{
  [(UIPageControl *)self->_pageControl removeFromSuperview];
  [(UIScrollView *)self->_horizontalScrollView setDelegate:0];
  [(NSMutableDictionary *)self->_passViewsByUniqueID enumerateKeysAndObjectsUsingBlock:&__block_literal_global_144];
  [(PKGroup *)self->_group removeGroupObserver:self];
  [(PKPassGroupView *)self _removePanAndLongPressGestureRecognizers];
  [(PKPassGroupView *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PKPassGroupView;
  [(PKPassGroupView *)&v3 dealloc];
}

uint64_t __26__PKPassGroupView_dealloc__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setDelegate:0];
}

uint64_t __37__PKPassGroupView_didMoveToSuperview__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 672), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (UIEdgeInsets)alignmentRectInsets
{
  int v3 = [(PKPassGroupView *)self _shouldReverseLayoutDirection];
  PKFloatRoundToPixel();
  double v5 = 8.0 - v4;
  double v6 = 0.0;
  if ((*(unsigned char *)&self->_layoutState & 2) != 0) {
    double v6 = 12.0;
  }
  if (v3) {
    double v7 = 8.0 - v4;
  }
  else {
    double v7 = v4;
  }
  if (v3) {
    double v5 = v4;
  }
  double v8 = 0.0;
  result.right = v5;
  result.bottom = v6;
  result.left = v7;
  result.top = v8;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPassGroupView;
  if (-[PKPassGroupView pointInside:withEvent:](&v12, sel_pointInside_withEvent_, v7, x, y))
  {
    char v8 = 1;
  }
  else
  {
    uint64_t v9 = [(UIPageControl *)self->_pageControl superview];

    if (v9)
    {
      pageControl = self->_pageControl;
      -[UIPageControl convertPoint:fromView:](pageControl, "convertPoint:fromView:", self, x, y);
      char v8 = -[UIPageControl pointInside:withEvent:](pageControl, "pointInside:withEvent:", v7);
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PKPassGroupView;
  -[PKPassGroupView hitTest:withEvent:](&v11, sel_hitTest_withEvent_, v7, x, y);
  char v8 = (PKPassGroupView *)objc_claimAutoreleasedReturnValue();
  if (v8 == self)
  {
    char v8 = [(UIPageControl *)self->_pageControl superview];

    if (v8)
    {
      pageControl = self->_pageControl;
      -[UIPageControl convertPoint:fromView:](pageControl, "convertPoint:fromView:", self, x, y);
      -[UIPageControl hitTest:withEvent:](pageControl, "hitTest:withEvent:", v7);
      char v8 = (PKPassGroupView *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v8;
}

- (void)_preventLayoutForAction:(id)a3
{
  id v7 = (void (**)(void))a3;
  if (!v7
    || (int v4 = self->_preventLayoutCounter + 1, ++self->_preventLayoutCounter, (v4 & 0x10000) != 0)
    || (double v5 = (void *)MEMORY[0x1A6224460](),
        v7[2](),
        unsigned int v6 = self->_preventLayoutCounter - 1,
        --self->_preventLayoutCounter,
        v6 >= 0x10000))
  {
    __break(1u);
  }
  else
  {
    if (!(_WORD)v6 && self->_preventedLayout)
    {
      self->_preventedLayout = 0;
      [(PKPassGroupView *)self setNeedsLayout];
    }
  }
}

- (void)layoutSubviewsAnimated:(BOOL)a3
{
  p_char layoutState = &self->_layoutState;
  char v4 = *((unsigned char *)&self->_layoutState + 16);
  *((unsigned char *)&self->_layoutState + 16) = v4 & 0xFE | a3;
  [(PKPassGroupView *)self layoutIfNeeded];
  *((unsigned char *)p_layoutState + 16) = *((unsigned char *)p_layoutState + 16) & 0xFE | v4 & 1;
}

uint64_t __33__PKPassGroupView_layoutSubviews__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endTrackingAnimation];
}

- (void)_layoutFan
{
  p_char layoutState = &self->_layoutState;
  char v4 = *((unsigned char *)&self->_layoutState + 16) & 1;
  double v5 = [(PKPassGroupView *)self passViewForIndex:self->_layoutState.selectedIndex];
  [(PKPassGroupView *)self _pagingFrameForCardView:v5 atIndex:p_layoutState->selectedIndex];
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;

  CGPoint instantaneousContentOffsetDelta = p_layoutState->instantaneousContentOffsetDelta;
  p_layoutState->CGPoint instantaneousContentOffsetDelta = (CGPoint)*MEMORY[0x1E4F1DAD8];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __29__PKPassGroupView__layoutFan__block_invoke;
  v14[3] = &unk_1E59D82D8;
  v14[4] = self;
  uint64_t v16 = v7;
  uint64_t v17 = v9;
  uint64_t v18 = v11;
  uint64_t v19 = v13;
  char v20 = v4;
  [(PKPassGroupView *)self _enumeratePassViewsInStackOrderWithHandler:v14];
}

void __29__PKPassGroupView__layoutFan__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7
    || (objc_msgSend(*(id *)(a1 + 32), "_loadCardViewForIndex:contentMode:", a3, objc_msgSend(*(id *)(a1 + 32), "_defaultContentModeForIndex:", a3)), v36 = (id)objc_claimAutoreleasedReturnValue(), objc_msgSend(*(id *)(a1 + 32), "_stackingPositionForCardView:atStackIndex:withSeparation:", v36, a4, 0), objc_msgSend(v36, "setCenter:"), (id v7 = v36) != 0))
  {
    id v37 = v7;
    uint64_t v8 = [v7 layer];
    [*(id *)(*(void *)(a1 + 32) + 576) bringSubviewToFront:v37];
    [v37 center];
    double v10 = v9;
    double v12 = v11;
    double v13 = *(double *)(a1 + 40);
    double v14 = *(double *)(a1 + 48);
    [*(id *)(a1 + 32) _pagingFrameForCardView:v37 atIndex:a3];
    objc_msgSend(v37, "setBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    objc_msgSend(*(id *)(a1 + 32), "_fanningPositionForCardView:atStackIndex:withSelectedFrame:", v37, a4, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
    double v16 = v15;
    double v18 = v17;
    uint64_t v19 = *(void *)(a1 + 32);
    if ((*(unsigned char *)(v19 + 440) & 8) != 0 && *(double *)(v19 + 448) > 0.0)
    {
      [(id)v19 _stackingPositionForCardView:v37 atStackIndex:a4 withSeparation:1];
      double v20 = *(double *)(*(void *)(a1 + 32) + 448);
      double v16 = v21 * v20 + (1.0 - v20) * v16;
      double v18 = v22 * v20 + (1.0 - v20) * v18;
    }
    if (*(unsigned char *)(a1 + 88))
    {
      double v23 = v10 + v13;
      double v24 = v12 + v14;
      if (v16 != v23 || v18 != v24)
      {
        uint64_t v26 = [MEMORY[0x1E4F85060] springAnimationWithKeyPath:@"position"];
        objc_msgSend(v26, "pkui_updateForAdditiveAnimationFromPoint:toPoint:", v23, v24, v16, v18);
        id v27 = (id)objc_msgSend(v8, "pkui_addAdditiveAnimation:", v26);
      }
    }
    objc_msgSend(v37, "setCenter:", v16, v18);
    [v8 opacity];
    if (*(unsigned char *)(a1 + 88) && v28 != 1.0)
    {
      double v29 = v28;
      uint64_t v30 = [MEMORY[0x1E4F85060] springAnimationWithKeyPath:@"opacity"];
      objc_msgSend(v30, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v29, 1.0);
      id v31 = (id)objc_msgSend(v8, "pkui_addAdditiveAnimation:", v30);
    }
    [v37 setAlpha:1.0];
    [v8 zPosition];
    if (v32 != 0.0)
    {
      double v33 = v32;
      long long v34 = [MEMORY[0x1E4F85060] springAnimationWithKeyPath:@"zPosition"];
      objc_msgSend(v34, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v33, 0.0);
      id v35 = (id)objc_msgSend(v8, "pkui_addAdditiveAnimation:", v34);
      [v8 setZPosition:0.0];
    }
    [v37 setDimmer:*(unsigned __int8 *)(a1 + 88) animated:*(double *)(*(void *)(a1 + 32) + 584)];
    [v37 setModalShadowVisibility:*(unsigned __int8 *)(a1 + 88) animated:0.0];
  }
}

- (void)_layoutPages
{
  p_char layoutState = &self->_layoutState;
  int v4 = *((unsigned char *)&self->_layoutState + 16) & 1;
  CGPoint instantaneousContentOffsetDelta = self->_layoutState.instantaneousContentOffsetDelta;
  [(PKPassGroupView *)self continuousShadowIndex];
  p_layoutState->CGPoint instantaneousContentOffsetDelta = (CGPoint)*MEMORY[0x1E4F1DAD8];
  deladouble y = p_layoutState->delay;
  uint64_t v12 = 0;
  double v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__PKPassGroupView__layoutPages__block_invoke;
  v7[3] = &unk_1E59D8300;
  char v11 = v4;
  v7[4] = self;
  v7[5] = &v12;
  double v9 = delay;
  uint64_t v10 = v6;
  [(PKPassGroupView *)self _enumeratePassViewsInStackOrderWithHandler:v7];
  if (v4) {
    p_layoutState->indeterminateAnimatedBefore = fmax(delay + CFAbsoluteTimeGetCurrent() + v13[3] * 0.3, p_layoutState->indeterminateAnimatedBefore);
  }
  _Block_object_dispose(&v12, 8);
}

void __31__PKPassGroupView__layoutPages__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  if (v5)
  {
    CGRect v44 = v5;
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 576), "bringSubviewToFront:");
    uint64_t v6 = [v44 layer];
    [v6 position];
    double v8 = v7;
    double v10 = v9;
    double v11 = *(double *)(a1 + 48);
    double v12 = *(double *)(a1 + 56);
    [*(id *)(a1 + 32) _pagingFrameForCardView:v44 atIndex:a3];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    objc_msgSend(v6, "setBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    [v6 anchorPoint];
    double v22 = v14 + v21 * v18;
    double v24 = v16 + v23 * v20;
    if (*(unsigned char *)(a1 + 80))
    {
      double v25 = v10 + v12;
      double v26 = v8 + v11;
      if (v22 != v26 || v24 != v25)
      {
        float v28 = [MEMORY[0x1E4F85060] springAnimationWithKeyPath:@"position"];
        objc_msgSend(v28, "pkui_updateForAdditiveAnimationFromPoint:toPoint:", v26, v25, v22, v24);
        [v28 duration];
        *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = fmax(v29, *(double *)(*(void *)(*(void *)(a1 + 40)+ 8)+ 24));
        if (*(double *)(a1 + 64) <= 0.0)
        {
          id v30 = (id)objc_msgSend(v6, "pkui_addAdditiveAnimation:", v28);
        }
        else
        {
          objc_msgSend(v28, "setBeginTime:");
        }
      }
    }
    objc_msgSend(v6, "setPosition:", v22, v24);
    [v6 opacity];
    if (*(unsigned char *)(a1 + 80) && *(float *)&v31 != 1.0)
    {
      double v32 = *(float *)&v31;
      double v33 = [MEMORY[0x1E4F85060] springAnimationWithKeyPath:@"opacity"];
      objc_msgSend(v33, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v32, 1.0);
      id v34 = (id)objc_msgSend(v6, "pkui_addAdditiveAnimation:", v33);
    }
    LODWORD(v31) = 1.0;
    [v6 setOpacity:v31];
    [v6 zPosition];
    if (v35 != 0.0)
    {
      double v36 = v35;
      id v37 = [MEMORY[0x1E4F85060] springAnimationWithKeyPath:@"zPosition"];
      objc_msgSend(v37, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v36, 0.0);
      id v38 = (id)objc_msgSend(v6, "pkui_addAdditiveAnimation:", v37);
      [v6 setZPosition:0.0];
    }
    [v44 setDimmer:*(unsigned __int8 *)(a1 + 80) animated:*(double *)(*(void *)(a1 + 32) + 584)];
    double v39 = *(double *)(a1 + 72) - (double)a3;
    if (v39 > -1.0 && v39 < 1.0)
    {
      PKSpringAnimationSolveForInput();
      int v41 = *(unsigned __int8 *)(a1 + 80);
      double v43 = 0.0;
      if (v42 > 0.0) {
        double v43 = *(double *)(a1 + 64);
      }
    }
    else
    {
      int v41 = *(unsigned __int8 *)(a1 + 80);
      double v42 = 0.0;
      double v43 = 0.0;
    }
    [v44 setModalShadowVisibility:v41 != 0 animated:v42 withDelay:v43];

    id v5 = v44;
  }
}

void __31__PKPassGroupView__layoutPages__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v14 = a2;
  [v14 position];
  double v6 = v5;
  double v8 = v7;
  double v9 = [v4 fromValue];

  [v9 CGPointValue];
  double v11 = v10;
  double v13 = v12;

  objc_msgSend(v14, "setPosition:", v6 + v11, v8 + v13);
}

- (void)updateToStackWithProgress:(double)a3 originalPosition:(CGPoint)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (self->_presentationState == 3)
  {
    double y = a4.y;
    double x = a4.x;
    p_char layoutState = &self->_layoutState;
    char layoutState = (char)self->_layoutState;
    if ((layoutState & 8) == 0)
    {
      *(unsigned char *)p_char layoutState = layoutState | 8;
      self->_layoutState.indeterminateProgress = 0.0;
      double v10 = [(PKRemoveableAnimationTrackerStore *)self->_delayedAnimations trackers];
      if ([v10 count])
      {
        [(PKPassGroupView *)self _removeDelayedAnimations];
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v11 = v10;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v32;
          while (2)
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v32 != v13) {
                objc_enumerationMutation(v11);
              }
              if ([*(id *)(*((void *)&v31 + 1) + 8 * i) isPreempted])
              {
                LOBYTE(v12) = 16;
                goto LABEL_14;
              }
            }
            uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
LABEL_14:

        *(unsigned char *)p_char layoutState = *(unsigned char *)p_layoutState & 0xEF | v12;
        [(PKPassGroupView *)self setNeedsLayout];
        [(PKPassGroupView *)self layoutSubviewsAnimated:1];
      }
      [(PKPassGroupView *)self _updatePageControlVisibilityAnimated:1 withDelay:0.0];

      char layoutState = *(unsigned char *)p_layoutState;
    }
    double v15 = 1.0;
    double v16 = fmin(fmax(a3, 0.0), 1.0);
    if ((layoutState & 0x10) != 0)
    {
      if (v16 >= 0.85) {
        double v18 = 1.0;
      }
      else {
        double v18 = v16 / 0.85;
      }
      [(PKPassGroupView *)self setNeedsLayout];
      p_layoutState->indeterminateProgress = v18;
    }
    else
    {
      if (v16 < 0.2)
      {
        double v15 = 0.0;
        double v17 = v16 / 0.2;
      }
      else if (v16 >= 1.0)
      {
        double v17 = 1.0;
      }
      else
      {
        double v17 = 1.0;
        if (fmax(v16 + -0.2, 0.0) / 0.8 < 0.8)
        {
          PKSpringAnimationSolveForInput();
          double v17 = v15;
        }
      }
      p_layoutState->indeterminateProgress = v15;
      double v19 = [(PKPassGroupView *)self layer];
      [v19 position];
      double v21 = v20;
      double v23 = v22;

      double v24 = x - v21;
      double v25 = y - v23;
      BOOL v26 = CFAbsoluteTimeGetCurrent() < p_layoutState->indeterminateAnimatedBefore;
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __62__PKPassGroupView_updateToStackWithProgress_originalPosition___block_invoke;
      v28[3] = &unk_1E59D82B0;
      char v27 = v26;
      v28[4] = self;
      *(double *)&v28[5] = v24;
      *(double *)&v28[6] = v25;
      BOOL v29 = v16 >= 0.2;
      char v30 = v27;
      *(double *)&v28[7] = v17;
      *(double *)&v28[8] = v16;
      [(PKPassGroupView *)self _enumeratePassViewsInStackOrderWithHandler:v28];
    }
  }
}

void __62__PKPassGroupView_updateToStackWithProgress_originalPosition___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7)
  {
    id v43 = v7;
    double v8 = [v7 layer];
    [*(id *)(a1 + 32) _pagingFrameForCardView:v43 atIndex:a3];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    [v8 anchorPoint];
    double v19 = *(double **)(a1 + 32);
    uint64_t v20 = *((void *)v19 + 65);
    double v21 = 0.0;
    double v22 = 0.0;
    double v23 = 0.0;
    if (v20 != a3)
    {
      double v21 = *(double *)(a1 + 40);
      double v23 = *(double *)(a1 + 48);
      double v22 = -5.0;
    }
    double v24 = v10 + v17 * v14 + v21;
    double v25 = v12 + v18 * v16;
    double v26 = v19[73];
    double v27 = v25 + v23;
    double v28 = fmax(v26, 0.025);
    if (v20 == a3) {
      double v29 = v19[73];
    }
    else {
      double v29 = v28;
    }
    [v19 _stackingPositionForCardView:v43 atStackIndex:a4 withSeparation:1];
    if (*(unsigned char *)(a1 + 72))
    {
      double v32 = *(double *)(a1 + 56);
      double v33 = v30 * v32 + (1.0 - v32) * v24;
      double v34 = v31 * v32 + (1.0 - v32) * v27;
      double v35 = v32 * 0.0 + (1.0 - v32) * v22;
      double v36 = *(double *)(*(void *)(a1 + 32) + 584) * v32 + (1.0 - v32) * v29;
    }
    else
    {
      double v37 = fmax(v26, 0.0);
      double v38 = *(double *)(a1 + 56);
      double v33 = v24 * v38 + (1.0 - v38) * v24;
      double v34 = v27 * v38 + (1.0 - v38) * v27;
      double v35 = v22 * v38 + (1.0 - v38) * 0.0;
      double v36 = v29 * v38 + (1.0 - v38) * v37;
    }
    if (*(unsigned char *)(a1 + 73))
    {
      [v8 position];
      double v40 = v39;
      int v41 = [MEMORY[0x1E4F85060] springAnimationWithKeyPath:@"position.x"];
      objc_msgSend(v41, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v40, v33);
      id v42 = (id)objc_msgSend(v8, "pkui_addAdditiveAnimation:", v41);
    }
    objc_msgSend(v8, "setPosition:", v33, v34);
    [v8 setZPosition:v35];
    [v43 setDimmer:0 animated:v36];
    objc_msgSend(v43, "setModalShadowVisibility:", (1.0 - *(double *)(a1 + 64)) * (double)objc_msgSend(v43, "isModallyPresented"));

    id v7 = v43;
  }
}

- (CGPoint)_fanningPositionForCardView:(id)a3 atStackIndex:(unint64_t)a4 withSelectedFrame:(CGRect)a5
{
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v8 = a3;
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;
  [v8 anchorPoint];
  double v14 = v13;
  double v16 = v15;

  double v17 = x + v14 * v10;
  double v18 = y + (double)a4 * 60.0 + v16 * v12;
  result.double y = v18;
  result.double x = v17;
  return result;
}

- (CGRect)_pagingFrameForCardView:(id)a3 atIndex:(unint64_t)a4
{
  [a3 bounds];
  double v7 = v6;
  double v9 = v8;
  v10.n128_f64[0] = (double)a4;
  v11.n128_f64[0] = (self->_layoutState.bounds.size.width - v6) * 0.5
                  + (double)a4 * self->_layoutState.bounds.size.width;
  PKFloatFloorToPixel(v11, v10);
  double v13 = 0.0;
  double v14 = v7;
  double v15 = v9;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (void)deleteButtonPressed
{
  id v4 = [(PKPassView *)self->_frontmostPassView pass];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained groupView:self deleteButtonPressedForPass:v4];
  }
}

- (void)setPassViewExpanded:(BOOL)a3 forPass:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a3;
  passViewsByUniqueID = self->_passViewsByUniqueID;
  double v7 = [a4 uniqueID];
  id v8 = [(NSMutableDictionary *)passViewsByUniqueID objectForKey:v7];

  [v8 setFrontFaceExpanded:v5 animated:1];
}

- (void)beginPinningFrontFaceContentMode
{
}

- (void)endPinningFrontFaceContentMode
{
  unsigned __int16 v2 = self->_frontFaceContentModePinningCounter - 1;
  self->_frontFaceContentModePinningCounter = v2;
  if (!v2) {
    [(PKPassGroupView *)self applyContentModesAnimated:0];
  }
}

- (void)presentDiff:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [v6 passUniqueID];
    [(PKPassGroupView *)self presentPassWithUniqueID:v8];
    double v9 = [(NSMutableDictionary *)self->_passViewsByUniqueID objectForKey:v8];
    [v9 presentDiff:v6 completion:v7];
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = self->_passViewsByUniqueID;
    uint64_t v10 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v8);
          }
          double v14 = -[NSMutableDictionary objectForKey:](self->_passViewsByUniqueID, "objectForKey:", *(void *)(*((void *)&v15 + 1) + 8 * v13), (void)v15);
          [v14 presentDiff:0 completion:v7];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
}

- (void)presentPassWithUniqueID:(id)a3
{
}

- (void)presentPassWithUniqueID:(id)a3 withContext:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v10 = a4;
  uint64_t v8 = [(PKGroup *)self->_group indexForPassUniqueID:a3];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v9 = v8;
    [(PKGroup *)self->_group setFrontmostPassIndex:v8];
    [(PKPassGroupView *)self setFrontmostPassViewFromPassIndex:v9 withContext:v10 animated:v5];
    [(PKPassGroupView *)self _updateCachedGroupState];
    [(PKPassGroupView *)self _updateLoadedViews:1];
    if (self->_presentationState == 3)
    {
      -[UIScrollView setContentOffset:animated:](self->_horizontalScrollView, "setContentOffset:animated:", 1, self->_layoutState.bounds.size.width * (double)v9, 0.0);
      [(PKPassGroupView *)self _updatePageControlWithDisplayIndex];
    }
    else
    {
      [(PKPassGroupView *)self setPresentationState:3 withContext:v10 animated:1];
    }
  }
}

- (void)setDimmer:(double)a3 animated:(BOOL)a4
{
  self->_dimmerValue = a3;
  id v6 = [(PKPassGroupView *)self frontmostPassView];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__PKPassGroupView_setDimmer_animated___block_invoke;
  v8[3] = &unk_1E59D8378;
  id v9 = v6;
  id v10 = self;
  BOOL v11 = a4;
  id v7 = v6;
  [(PKPassGroupView *)self _enumeratePassViewsInStackOrderWithHandler:v8];
}

void __38__PKPassGroupView_setDimmer_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v6 = v3;
    if (*(id *)(a1 + 32) == v3)
    {
      double v4 = *(double *)(*(void *)(a1 + 40) + 584);
      uint64_t v5 = *(unsigned __int8 *)(a1 + 48);
    }
    else
    {
      double v4 = 0.0;
      uint64_t v5 = 0;
    }
    [v3 setDimmer:v5 animated:v4];
    id v3 = v6;
  }
}

- (void)_beginTrackingAnimation
{
}

- (void)_endTrackingAnimation
{
  unsigned __int16 v2 = self->_animationCounter - 1;
  self->_animationCounter = v2;
  if (!v2) {
    [(PKPassGroupView *)self applyContentModesAnimated:0];
  }
}

- (_NSRange)_rangeOfFannedIndices
{
  NSUInteger v2 = MEMORY[0x1F413B220](0, self->_layoutState.numberOfPasses, self->_layoutState.selectedIndex, 5);
  result.length = v3;
  result.id location = v2;
  return result;
}

- (void)_enumerateIndicesInFannedOrderWithHandler:(id)a3
{
  id v4 = a3;
  [(PKPassGroupView *)self _rangeOfFannedIndices];
  PKEnumerateRangeInStackOrder();
}

void __62__PKPassGroupView__enumeratePassViewsInStackOrderWithHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if ([*(id *)(a1 + 32) count])
  {
    id v7 = [*(id *)(*(void *)(a1 + 40) + 688) passAtIndex:a2];
    uint64_t v11 = [v7 uniqueID];

    uint64_t v8 = (void *)v11;
    if (v11)
    {
      int v9 = [*(id *)(a1 + 32) containsObject:v11];
      uint64_t v8 = (void *)v11;
      if (v9)
      {
        [*(id *)(a1 + 32) removeObject:v11];
        id v10 = [*(id *)(a1 + 40) passViewForIndex:a2];
        if (v10) {
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        }

        uint64_t v8 = (void *)v11;
      }
    }
  }
  else
  {
    *a4 = 1;
  }
}

void __38__PKPassGroupView__updateLoadedViews___block_invoke_60(uint64_t a1, unint64_t a2)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 688) passAtIndex:a2];
  id v11 = [v4 uniqueID];

  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 560) objectForKey:v11];
  uint64_t v6 = *(void *)(a1 + 32);
  if (v5)
  {
    id v7 = (void *)v5;
    [*(id *)(v6 + 576) bringSubviewToFront:v5];
  }
  else if (*(void *)(v6 + 432) != 3 {
         || *(unsigned char *)(a1 + 80)
  }
         || (id v7 = 0, v8 = *(void *)(a1 + 64), v9 = a2 >= v8, v10 = a2 - v8, v9) && v10 < *(void *)(a1 + 72))
  {
    id v7 = objc_msgSend((id)v6, "_loadCardViewForIndex:contentMode:", a2, objc_msgSend(*(id *)(a1 + 32), "_defaultContentModeForIndex:", a2));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  if (*(void *)(*(void *)(a1 + 32) + 520) == a2) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v7);
  }
  if (v11) {
    [*(id *)(a1 + 40) removeObject:v11];
  }
}

- (void)_removeDelayedAnimations
{
  [(PKRemoveableAnimationTrackerStore *)self->_delayedAnimations preempt];
  delayedAnimations = self->_delayedAnimations;

  [(PKRemoveableAnimationTrackerStore *)delayedAnimations clear];
}

- (id)beginSuppressingPageControl
{
  int pageControlSuppressionCounter = self->_pageControlSuppressionCounter;
  self->_int pageControlSuppressionCounter = pageControlSuppressionCounter + 1;
  if (pageControlSuppressionCounter)
  {
    if (pageControlSuppressionCounter != 0xFFFF) {
      goto LABEL_5;
    }
    __break(1u);
  }
  [(PKPassGroupView *)self _updatePageControlVisibilityAnimated:1 withDelay:0.0];
LABEL_5:
  objc_initWeak(&location, self);
  id v4 = objc_alloc(MEMORY[0x1E4F84630]);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __46__PKPassGroupView_beginSuppressingPageControl__block_invoke_2;
  v13[3] = &unk_1E59CB128;
  objc_copyWeak(&v15, &location);
  id v14 = &__block_literal_global_64;
  uint64_t v5 = (void *)[v4 initWithBlock:v13];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__PKPassGroupView_beginSuppressingPageControl__block_invoke_3;
  v9[3] = &unk_1E59D6D98;
  id v10 = v5;
  id v6 = v5;
  objc_copyWeak(&v12, &location);
  id v11 = &__block_literal_global_64;
  id v7 = _Block_copy(v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v7;
}

void __46__PKPassGroupView_beginSuppressingPageControl__block_invoke(uint64_t a1, void *a2)
{
  NSUInteger v2 = a2;
  if (v2 && (unsigned int v3 = v2[210] - 1, --v2[210], v3 < 0x10000))
  {
    if (!(_WORD)v3)
    {
      id v4 = v2;
      [v2 _updatePageControlVisibilityAnimated:1 withDelay:0.0];
      NSUInteger v2 = v4;
    }
  }
  else
  {
    __break(1u);
  }
}

void __46__PKPassGroupView_beginSuppressingPageControl__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v3;
  }
}

void __46__PKPassGroupView_beginSuppressingPageControl__block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) invalidate])
  {
    __break(1u);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      id v3 = WeakRetained;
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      id WeakRetained = v3;
    }
  }
}

- (BOOL)overridePageControlAlpha:(double)a3
{
  BOOL pageControlHasAlphaOverride = self->_pageControlHasAlphaOverride;
  if (self->_pageControlHasAlphaOverride && self->_pageControlAlphaOverride == a3) {
    return 0;
  }
  BOOL v4 = 1;
  self->_BOOL pageControlHasAlphaOverride = 1;
  self->_double pageControlAlphaOverride = a3;
  if ((*(unsigned char *)&self->_layoutState & 2) != 0)
  {
    [(PKPassGroupView *)self _updatePageControlVisibilityAnimated:!pageControlHasAlphaOverride withDelay:0.0];
    return 1;
  }
  return v4;
}

- (void)clearPageControlAlphaOverride
{
  if (self->_pageControlHasAlphaOverride)
  {
    self->_BOOL pageControlHasAlphaOverride = 0;
    if ((*(unsigned char *)&self->_layoutState & 2) != 0) {
      [(PKPassGroupView *)self _updatePageControlVisibilityAnimated:1 withDelay:0.0];
    }
  }
}

- (BOOL)pageControlAlphaOverrideMatchesPredicate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = v4;
    if (self->_pageControlHasAlphaOverride) {
      char v6 = (*((uint64_t (**)(id, double))v4 + 2))(v4, self->_pageControlAlphaOverride);
    }
    else {
      char v6 = 0;
    }

    LOBYTE(v4) = v6;
  }
  else
  {
    __break(1u);
  }
  return (char)v4;
}

- (void)_pageControlChanged:(id)a3
{
  if (self->_presentationState == 3)
  {
    unint64_t v4 = [(PKPassGroupView *)self displayIndex];
    unint64_t v5 = [(UIPageControl *)self->_pageControl currentPage];
    if (v4 != v5)
    {
      double v8 = CGRectGetWidth(self->_layoutState.bounds) * (double)v5;
      horizontalScrollView = self->_horizontalScrollView;
      -[UIScrollView setContentOffset:animated:](horizontalScrollView, "setContentOffset:animated:", 1, v8, 0.0);
    }
  }
  else
  {
    pageControl = self->_pageControl;
    selectedIndedouble x = self->_layoutState.selectedIndex;
    [(UIPageControl *)pageControl setCurrentPage:selectedIndex];
  }
}

void __51__PKPassGroupView__updatePageControlFrameAnimated___block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  double v11 = *MEMORY[0x1E4F1DAD8];
  double v12 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  id v13 = a2;
  objc_msgSend(v13, "pkui_setBounds:animated:", 0, v11, v12, a5, a6);
  [v13 anchorPoint];
  objc_msgSend(v13, "pkui_setPosition:animated:", *(unsigned __int8 *)(a1 + 40), a3 + v14 * a5, a4 + v15 * a6);

  *(unsigned char *)(*(void *)(a1 + 32) + 440) |= 0x20u;
}

- (void)_updatePageControlWithDisplayIndex
{
  unint64_t v3 = [(PKPassGroupView *)self displayIndex];
  if (v3 != [(UIPageControl *)self->_pageControl currentPage])
  {
    pageControl = self->_pageControl;
    [(UIPageControl *)pageControl setCurrentPage:v3];
  }
}

uint64_t __37__PKPassGroupView__removePageControl__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 672) setAlpha:0.0];
}

uint64_t __66__PKPassGroupView__updatePageControlVisibilityAnimated_withDelay___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 672), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __66__PKPassGroupView__updatePageControlVisibilityAnimated_withDelay___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v3 = a2;
  if (v3)
  {
    unint64_t v4 = v3;
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    if (!*(unsigned char *)(v5 + 24))
    {
      *(unsigned char *)(v5 + 24) = 1;
      __int16 v6 = *((_WORD *)v3 + 206) - 1;
      *((_WORD *)v3 + 206) = v6;
      if (!v6)
      {
        id v7 = v3;
        [v3[72] setScrollEnabled:(*((unsigned __int8 *)v3 + 440) >> 2) & 1];
        unint64_t v4 = v7;
      }
    }
  }
  else
  {
    __break(1u);
  }
}

void __66__PKPassGroupView__updatePageControlVisibilityAnimated_withDelay___block_invoke_3(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, (uint64_t)(fmax(*(double *)(a1 + 48) - *(double *)(a1 + 56), 0.0) * 0.5 * 1000000000.0));
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __66__PKPassGroupView__updatePageControlVisibilityAnimated_withDelay___block_invoke_4;
  v3[3] = &unk_1E59CB128;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  id v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E4F14428], v3);

  objc_destroyWeak(&v5);
}

void __66__PKPassGroupView__updatePageControlVisibilityAnimated_withDelay___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v3;
  }
}

void __66__PKPassGroupView__updatePageControlVisibilityAnimated_withDelay___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v5;
    __int16 v3 = *((_WORD *)v5 + 205) - 1;
    *((_WORD *)v5 + 205) = v3;
    if ((*((unsigned char *)v5 + 440) & 3) == 0 && v3 == 0)
    {
      [v5 _removePageControl];
      id WeakRetained = v5;
    }
  }
}

- (void)setModallyPresented:(BOOL)a3
{
  if (self->_modallyPresented != a3)
  {
    self->_modallyPresented = a3;
    frontmostPassView = self->_frontmostPassView;
    if (frontmostPassView) {
      -[PKPassView setModallyPresented:](frontmostPassView, "setModallyPresented:");
    }
    [(PKPassGroupView *)self _updatePageControlVisibilityAnimated:1 withDelay:0.0];
  }
}

- (void)setLoaned:(BOOL)a3
{
  if (self->_loaned != a3) {
    self->_loaned = a3;
  }
}

- (unint64_t)displayIndex
{
  return (unint64_t)fmax(fmin(CGRectGetMidX(self->_layoutState.bounds) / v2, (double)(unint64_t)([(PKGroup *)self->_group passCount] - 1)), 0.0);
}

- (double)continuousShadowIndex
{
  return fmax(fmin(self->_layoutState.bounds.origin.x / self->_layoutState.bounds.size.width, (double)(unint64_t)([(PKGroup *)self->_group passCount] - 1)), 0.0);
}

- (void)_removePanAndLongPressGestureRecognizers
{
  if (self->_panGestureRecognizer)
  {
    -[PKPassGroupView removeGestureRecognizer:](self, "removeGestureRecognizer:");
    [(UIPanGestureRecognizer *)self->_panGestureRecognizer setDelegate:0];
    panGestureRecognizer = self->_panGestureRecognizer;
    self->_panGestureRecognizer = 0;
  }
  if (self->_longPressGestureRecognizer)
  {
    -[PKPassGroupView removeGestureRecognizer:](self, "removeGestureRecognizer:");
    [(UILongPressGestureRecognizer *)self->_longPressGestureRecognizer setDelegate:0];
    longPressGestureRecognizer = self->_longPressGestureRecognizer;
    self->_longPressGestureRecognizer = 0;
  }
  if (self->_pressGestureRecognizer)
  {
    -[PKPassGroupView removeGestureRecognizer:](self, "removeGestureRecognizer:");
    [(UILongPressGestureRecognizer *)self->_pressGestureRecognizer setDelegate:0];
    pressGestureRecognizer = self->_pressGestureRecognizer;
    self->_pressGestureRecognizer = 0;
  }
}

- (void)_handlePress:(id)a3
{
  uint64_t v4 = [a3 state];
  if ((unint64_t)(v4 - 3) >= 2)
  {
    if (v4 != 1) {
      return;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) == 0) {
      return;
    }
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 groupViewPressed:self];
  }
  else
  {
    id v5 = objc_loadWeakRetained((id *)&self->_delegate);
    char v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) == 0) {
      return;
    }
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 groupViewPressedDidEnd:self];
  }
}

- (void)_handleLongPress:(id)a3
{
  uint64_t v4 = [a3 state];
  if ((unint64_t)(v4 - 3) >= 2)
  {
    if (v4 != 1) {
      return;
    }
    self->_canPan = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) == 0) {
      return;
    }
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 groupViewPanDidBegin:self];
  }
  else
  {
    self->_canPan = 0;
    id v5 = objc_loadWeakRetained((id *)&self->_delegate);
    char v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) == 0) {
      return;
    }
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 groupViewPanDidEnd:self];
  }
}

- (void)_handlePanGesture:(id)a3
{
  id v13 = a3;
  if ((unint64_t)([v13 state] - 1) <= 1 && self->_canPan)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)&self->_delegate);
      [v13 translationInView:self];
      double v8 = v7;
      double v10 = v9;
      [v13 velocityInView:self];
      objc_msgSend(v6, "groupView:panned:withVelocity:", self, v8, v10, v11, v12);
    }
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  if (self->_panGestureRecognizer == a3) {
    return self->_canPan;
  }
  v4.receiver = self;
  v4.super_class = (Class)PKPassGroupView;
  return -[PKPassGroupView gestureRecognizerShouldBegin:](&v4, sel_gestureRecognizerShouldBegin_);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = (UIPanGestureRecognizer *)a3;
  id v7 = a4;
  if ((self->_panGestureRecognizer == v6 || (UIPanGestureRecognizer *)self->_longPressGestureRecognizer == v6)
    && (*((unsigned char *)&self->_layoutState + 16) & 0x20) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v8 = [WeakRetained groupViewShouldAllowPanning:self];
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = (UILongPressGestureRecognizer *)a3;
  id v7 = (UILongPressGestureRecognizer *)a4;
  if ([(PKPassGroupView *)self _isOurGestureRecognizer:v6]
    && [(PKPassGroupView *)self _isOurGestureRecognizer:v7])
  {
    BOOL v8 = 1;
  }
  else
  {
    pressGestureRecognizer = self->_pressGestureRecognizer;
    BOOL v8 = pressGestureRecognizer == v6 || pressGestureRecognizer == v7;
  }

  return v8;
}

- (BOOL)_isOurGestureRecognizer:(id)a3
{
  objc_super v4 = (UIPanGestureRecognizer *)a3;
  BOOL v5 = self->_panGestureRecognizer == v4
    || (UIPanGestureRecognizer *)self->_longPressGestureRecognizer == v4
    || self->_pressGestureRecognizer == (UILongPressGestureRecognizer *)v4;

  return v5;
}

- (void)_updateFrontmostPassViewIfNecessary
{
  unint64_t v3 = [(PKPassGroupView *)self displayIndex];
  if (v3 != self->_layoutState.selectedIndex)
  {
    unint64_t v4 = v3;
    if ([(PKPassView *)self->_frontmostPassView isFrontFaceExpanded]) {
      [(PKPassView *)self->_frontmostPassView setFrontFaceExpanded:0 animated:1];
    }
    [(PKGroup *)self->_group setFrontmostPassIndex:v4];
    [(PKPassGroupView *)self setFrontmostPassViewFromPassIndex:v4];
    [(PKPassGroupView *)self _updateCachedGroupState];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  unint64_t v4 = (UIScrollView *)a3;
  if (self->_horizontalScrollView == v4 && self->_presentationState == 3)
  {
    double v9 = v4;
    [(UIScrollView *)v4 bounds];
    self->_layoutState.bounds.origin.double x = v5;
    self->_layoutState.bounds.origin.double y = v6;
    self->_layoutState.bounds.size.width = v7;
    self->_layoutState.bounds.size.height = v8;
    if (([(UIScrollView *)v9 isScrollAnimating] & 1) == 0)
    {
      [(PKPassGroupView *)self _updateFrontmostPassViewIfNecessary];
      [(PKPassGroupView *)self _updatePageControlWithDisplayIndex];
    }
    [(PKPassGroupView *)self _updateLoadedViews:0];
    [(PKPassGroupView *)self setNeedsLayout];
    unint64_t v4 = v9;
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  CGFloat v6 = (UIScrollView *)a3;
  if (self->_horizontalScrollView == v6)
  {
    double v11 = v6;
    if (self->_presentationState == 3 && !a4)
    {
      [(UIScrollView *)v6 bounds];
      self->_layoutState.bounds.origin.double x = v7;
      self->_layoutState.bounds.origin.double y = v8;
      self->_layoutState.bounds.size.width = v9;
      self->_layoutState.bounds.size.height = v10;
      [(PKPassGroupView *)self _updateFrontmostPassViewIfNecessary];
      [(PKPassGroupView *)self _updatePageControlWithDisplayIndex];
      [(PKPassGroupView *)self _updateLoadedViews:1];
      CGFloat v6 = v11;
    }
    if (!a4)
    {
      [(PKPassGroupView *)self setNeedsLayout];
      CGFloat v6 = v11;
    }
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  unint64_t v4 = (UIScrollView *)a3;
  if (self->_horizontalScrollView == v4)
  {
    CGFloat v9 = v4;
    if (self->_presentationState == 3)
    {
      [(UIScrollView *)v4 bounds];
      self->_layoutState.bounds.origin.double x = v5;
      self->_layoutState.bounds.origin.double y = v6;
      self->_layoutState.bounds.size.width = v7;
      self->_layoutState.bounds.size.height = v8;
      [(PKPassGroupView *)self _updateFrontmostPassViewIfNecessary];
      [(PKPassGroupView *)self _updatePageControlWithDisplayIndex];
      [(PKPassGroupView *)self _updateLoadedViews:1];
    }
    [(PKPassGroupView *)self setNeedsLayout];
    unint64_t v4 = v9;
  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  unint64_t v4 = (UIScrollView *)a3;
  if (self->_horizontalScrollView == v4)
  {
    CGFloat v9 = v4;
    if (self->_presentationState == 3)
    {
      [(UIScrollView *)v4 bounds];
      self->_layoutState.bounds.origin.double x = v5;
      self->_layoutState.bounds.origin.double y = v6;
      self->_layoutState.bounds.size.width = v7;
      self->_layoutState.bounds.size.height = v8;
      [(PKPassGroupView *)self _updateFrontmostPassViewIfNecessary];
      [(PKPassGroupView *)self _updatePageControlWithDisplayIndex];
      [(PKPassGroupView *)self _updateLoadedViews:1];
    }
    [(PKPassGroupView *)self setNeedsLayout];
    unint64_t v4 = v9;
  }
}

- (void)group:(id)a3 didInsertPass:(id)a4 withState:(id)a5 atIndex:(unint64_t)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  [(PKPassGroupView *)self _updateCachedGroupState];
  unint64_t v9 = [(PKPassGroupView *)self _rangeOfVisibleIndices];
  if (a6 < v9 || a6 - v9 >= v10)
  {
    BOOL v11 = 0;
  }
  else
  {
    BOOL v11 = self->_presentationState != 3;
    double v12 = [(PKPassGroupView *)self _loadCardViewForIndex:a6 contentMode:[(PKPassGroupView *)self _defaultContentModeForIndex:a6]];
    id v13 = [v12 layer];
    double MidX = CGRectGetMidX(self->_layoutState.bounds);
    objc_msgSend(v13, "setPosition:", MidX, CGRectGetMaxY(self->_layoutState.bounds));
  }
  selectedIndedouble x = self->_layoutState.selectedIndex;
  if (self->_presentationState == 3)
  {
    if (selectedIndex >= a6)
    {
      unint64_t v16 = selectedIndex + 1;
      [v8 setFrontmostPassIndex:selectedIndex + 1];
      [(PKPassGroupView *)self setFrontmostPassViewFromPassIndex:v16];
      [(PKPassGroupView *)self _updateCachedGroupState];
      selectedIndedouble x = self->_layoutState.selectedIndex;
    }
    -[UIScrollView setContentOffset:animated:](self->_horizontalScrollView, "setContentOffset:animated:", v11, CGRectGetWidth(self->_layoutState.bounds) * (double)selectedIndex, 0.0);
  }
  else
  {
    [(PKPassGroupView *)self setFrontmostPassViewFromPassIndex:selectedIndex];
  }
  if ([v8 passCount] == 2)
  {
    [(PKPassGroupView *)self sizeToFit];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v17 = self->_observers;
    uint64_t v18 = [(NSHashTable *)v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v24 != v20) {
            objc_enumerationMutation(v17);
          }
          double v22 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v22, "groupViewDidUpdatePageControlVisibility:", self, (void)v23);
          }
        }
        uint64_t v19 = [(NSHashTable *)v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v19);
    }
  }
  [(PKPassGroupView *)self setNeedsLayout];
  [(PKPassGroupView *)self layoutSubviewsAnimated:v11];
  [(PKPassGroupView *)self setDimmer:0 animated:self->_dimmerValue];
  [(PKPassGroupView *)self _updatePageControlVisibilityAnimated:1 withDelay:0.0];
  [(PKPassGroupView *)self _updatePageControlWithDisplayIndex];
}

- (void)group:(id)a3 didUpdatePass:(id)a4 withState:(id)a5 atIndex:(unint64_t)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  unint64_t v9 = [v8 uniqueID];
  unint64_t v10 = [(NSMutableDictionary *)self->_passViewsByUniqueID objectForKey:v9];
  BOOL v11 = v10;
  if (v10)
  {
    uint64_t v12 = [(PKPassView *)v10 contentMode];
    if ((unint64_t)(v12 - 1) <= 2) {
      [v8 loadImageSetSync:2 preheat:0];
    }
    [(PKPassView *)v11 frame];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    [(PKPassView *)v11 removeFromSuperview];
    [(PKPassView *)v11 setDelegate:0];
    double v30 = v9;
    [(NSMutableDictionary *)self->_passViewsByUniqueID removeObjectForKey:v9];
    double v21 = [(PKPassGroupView *)self _loadCardViewForIndex:a6 contentMode:v12];
    objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);
    if (v11 == self->_frontmostPassView) {
      [(PKPassGroupView *)self setFrontmostPassView:v21];
    }
    id v31 = v8;
    unint64_t v22 = [(PKPassGroupView *)self _rangeOfVisibleIndices];
    if (a6 >= v22 && a6 - v22 < v23)
    {
      [(PKPassGroupView *)self setNeedsLayout];
      [(PKPassGroupView *)self layoutSubviewsAnimated:0];
      [v21 setContentMode:v12 animated:0];
    }
    [(PKPassGroupView *)self setDimmer:0 animated:self->_dimmerValue];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v24 = self->_observers;
    uint64_t v25 = [(NSHashTable *)v24 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v33 != v27) {
            objc_enumerationMutation(v24);
          }
          double v29 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v29 groupView:self didUpdatePassView:v21];
          }
        }
        uint64_t v26 = [(NSHashTable *)v24 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v26);
    }

    unint64_t v9 = v30;
    id v8 = v31;
  }
}

- (void)group:(id)a3 didRemovePass:(id)a4 atIndex:(unint64_t)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  [(PKPassGroupView *)self layoutIfNeeded];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __47__PKPassGroupView_group_didRemovePass_atIndex___block_invoke;
  v21[3] = &unk_1E59CC648;
  void v21[4] = self;
  id v10 = v9;
  id v22 = v10;
  unint64_t v23 = a5;
  [(PKPassGroupView *)self _preventLayoutForAction:v21];
  [(PKPassGroupView *)self setNeedsLayout];
  if (self->_presentationState == 3)
  {
    [(PKPassGroupView *)self layoutSubviewsAnimated:1];
    *((unsigned char *)&self->_layoutState + 16) &= ~4u;
    if ([v8 passCount] == 1)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      BOOL v11 = self->_observers;
      uint64_t v12 = [(NSHashTable *)v11 countByEnumeratingWithState:&v17 objects:v24 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v18 != v14) {
              objc_enumerationMutation(v11);
            }
            double v16 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            if (objc_opt_respondsToSelector()) {
              objc_msgSend(v16, "groupViewDidUpdatePageControlVisibility:", self, (void)v17);
            }
          }
          uint64_t v13 = [(NSHashTable *)v11 countByEnumeratingWithState:&v17 objects:v24 count:16];
        }
        while (v13);
      }
    }
  }
  else
  {
    [(PKPassGroupView *)self layoutSubviewsAnimated:0];
  }
  -[PKPassGroupView _updatePageControlVisibilityAnimated:withDelay:](self, "_updatePageControlVisibilityAnimated:withDelay:", 1, 0.0, (void)v17);
  [(PKPassGroupView *)self _updatePageControlWithDisplayIndex];
}

void __47__PKPassGroupView_group_didRemovePass_atIndex___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = *(void *)(v2 + 520);
  [*(id *)(v2 + 576) contentOffset];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  [*(id *)(a1 + 32) _updateCachedGroupState];
  id v19 = [*(id *)(a1 + 40) uniqueID];
  id v8 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 560), "objectForKey:");
  id v9 = *(id **)(a1 + 32);
  if (v9[80])
  {
    if ([v9[80] isEqualToString:v19]) {
      *(unsigned char *)(*(void *)(a1 + 32) + 649) = 1;
    }
  }
  else
  {
    [v9 dismissBackOfPassIfNecessaryForUniqueID:v19];
  }
  [v8 setDelegate:0];
  [*(id *)(*(void *)(a1 + 32) + 560) removeObjectForKey:v19];
  [v8 removeFromSuperview];
  uint64_t v10 = *(void *)(a1 + 32);
  if (v8 == *(void **)(v10 + 680))
  {
    if (v3 >= *(void *)(v10 + 512) - 1) {
      unint64_t v3 = *(void *)(v10 + 512) - 1;
    }
  }
  else if (v3)
  {
    unint64_t v11 = *(void *)(a1 + 48);
    unint64_t v12 = *(void *)(v10 + 512);
    unint64_t v13 = v3 - 1;
    if (v3 - 1 >= v12 - 1) {
      unint64_t v13 = v12 - 1;
    }
    if (v11 < v3 || v11 >= v12) {
      unint64_t v3 = v13;
    }
  }
  [*(id *)(v10 + 688) setFrontmostPassIndex:v3];
  [*(id *)(a1 + 32) _updateCachedGroupState];
  [*(id *)(a1 + 32) setFrontmostPassViewFromPassIndex:v3];
  [*(id *)(a1 + 32) _updateLoadedViews:1];
  [*(id *)(a1 + 32) setDimmer:0 animated:*(double *)(*(void *)(a1 + 32) + 584)];
  uint64_t v15 = *(void *)(a1 + 32);
  if (*(void *)(v15 + 432) == 3)
  {
    *(unsigned char *)(v15 + 456) |= 4u;
    uint64_t v16 = *(void *)(a1 + 32) + 440;
    *(void *)(v16 + 40) = v5;
    *(void *)(v16 + 48) = v7;
    double v17 = (double)*(unint64_t *)(*(void *)(a1 + 32) + 520);
    CGFloat v18 = CGRectGetWidth(*(CGRect *)(*(void *)(a1 + 32) + 528)) * v17;
    [*(id *)(a1 + 32) sizeToFit];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 576), "setContentOffset:animated:", 0, v18, 0.0);
  }
}

- (void)group:(id)a3 didUpdatePassState:(id)a4 forPass:(id)a5 atIndex:(unint64_t)a6
{
  id v8 = a4;
  id v10 = [a5 uniqueID];
  id v9 = [(NSMutableDictionary *)self->_passViewsByUniqueID objectForKey:v10];
  [v9 setPassState:v8];
}

- (void)group:(id)a3 didMovePassFromIndex:(unint64_t)a4 toIndex:(unint64_t)a5
{
  [(PKPassGroupView *)self setNeedsLayout];

  [(PKPassGroupView *)self layoutSubviewsAnimated:1];
}

- (void)group:(id)a3 didInsertAssociatedAccount:(id)a4 forPass:(id)a5
{
  passViewsByUniqueID = self->_passViewsByUniqueID;
  id v7 = a4;
  id v8 = [a5 uniqueID];
  id v9 = [(NSMutableDictionary *)passViewsByUniqueID objectForKeyedSubscript:v8];

  [v9 setAssociatedAccount:v7];
}

- (void)group:(id)a3 didRemoveAssociatedAccountForPass:(id)a4
{
  passViewsByUniqueID = self->_passViewsByUniqueID;
  uint64_t v5 = objc_msgSend(a4, "uniqueID", a3);
  id v6 = [(NSMutableDictionary *)passViewsByUniqueID objectForKeyedSubscript:v5];

  [v6 setAssociatedAccount:0];
}

- (void)group:(id)a3 didUpdateAssociatedAccount:(id)a4 forPass:(id)a5
{
  passViewsByUniqueID = self->_passViewsByUniqueID;
  id v7 = a4;
  id v8 = [a5 uniqueID];
  id v9 = [(NSMutableDictionary *)passViewsByUniqueID objectForKeyedSubscript:v8];

  [v9 setAssociatedAccount:v7];
}

- (void)markGroupDeleted
{
  self->_groupWasMarkedDeleted = 1;
  if (!self->_passBeingPresented) {
    [(PKPassGroupView *)self dismissBackOfPassIfNecessaryForUniqueID:0];
  }
}

- (void)dismissBackOfPassIfNecessaryForUniqueID:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_detailsVC);
  if (WeakRetained && (!v6 || !self->_passBeingPresented || objc_msgSend(v6, "isEqualToString:")))
  {
    uint64_t v5 = [WeakRetained presentingViewController];
    [v5 dismissViewControllerAnimated:1 completion:0];
  }
}

- (id)createExternalTapGestureRecognizer
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_tapRecognized_];
  [v2 setNumberOfTapsRequired:1];
  [v2 setNumberOfTouchesRequired:1];
  return v2;
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    [(NSMutableDictionary *)self->_passViewsByUniqueID enumerateKeysAndObjectsUsingBlock:&__block_literal_global_96];
    [(PKPassGroupView *)self _updatePausedState];
  }
}

uint64_t __29__PKPassGroupView_invalidate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 invalidate];
}

- (void)_groupViewTapped
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained groupViewTapped:self];
  }
}

- (void)passViewDidResize:(id)a3 animated:(BOOL)a4
{
  if (self->_frontmostPassView == a3)
  {
    [(PKPassGroupView *)self sizeToFit];
    [(PKPassGroupView *)self _updatePageControlVisibilityAnimated:1 withDelay:0.65];
  }
}

- (void)passViewExpandButtonTapped:(id)a3
{
  if (self->_frontmostPassView == a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained groupViewExpandButtonTapped:self];
    }
  }
}

- (void)removePassGroupViewObserver:(id)a3
{
}

- (BOOL)isModallyPresented
{
  return self->_modallyPresented;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (PKReusablePassViewQueue)passViewQueue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_passViewQueue);

  return (PKReusablePassViewQueue *)WeakRetained;
}

- (void)setPassViewQueue:(id)a3
{
}

- (int64_t)presentationState
{
  return self->_presentationState;
}

- (UILongPressGestureRecognizer)pressGestureRecognizer
{
  return self->_pressGestureRecognizer;
}

- (PKPassGroupViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPassGroupViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pressGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_passViewQueue);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_frontmostPassView, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_passBeingPresented, 0);
  objc_destroyWeak((id *)&self->_detailsVC);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_motionEffectGroup, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_horizontalScrollView, 0);
  objc_storeStrong((id *)&self->_delayedAnimations, 0);

  objc_storeStrong((id *)&self->_passViewsByUniqueID, 0);
}

@end