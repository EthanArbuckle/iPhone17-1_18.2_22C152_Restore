@interface _TVCarouselView
- (BOOL)_canScrollCarouselView;
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)shouldScaleOnIdleFocus;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (BOOL)showsPageControl;
- (CADisplayLink)displayLink;
- (CGPoint)focusDirection;
- (CGPoint)targetContentOffset;
- (CGSize)_collectionViewLayoutItemSize;
- (CGSize)itemSize;
- (CGSize)sizeThatFits:(CGSize)result;
- (NSArray)visibleCells;
- (NSDate)firstFocusChangeInInterval;
- (NSDictionary)collectionToDatasourceIndexMap;
- (TVCarouselViewDataSource)dataSource;
- (TVCarouselViewDelegate)delegate;
- (UIFocusGuide)focusGuide;
- (UIPageControl)pageControl;
- (UIView)headerView;
- (_TVCarouselView)initWithFrame:(CGRect)a3;
- (double)_centeringAnimationDuration;
- (double)_contentOffsetXForCollectionViewIndex:(int64_t)a3;
- (double)autoscrollInterval;
- (double)focusThrottleTimeInterval;
- (double)interitemSpacing;
- (double)offsetChangePerSecond;
- (double)pageControlMargin;
- (double)previousDisplayLinkTimestamp;
- (double)showcaseFactor;
- (double)unitScrollDuration;
- (id)_cellForItemAtIndex:(unint64_t)a3;
- (id)_collectionView;
- (id)_prepareIndexMap:(int64_t)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)dequeueReusableCellWithReuseIdentifier:(id)a3 forIndex:(unint64_t)a4;
- (id)focusedCell;
- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3;
- (id)preferredFocusedView;
- (int64_t)_centerCollectionViewCellIndex;
- (int64_t)_numberOfCells;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (unint64_t)_itemIndexForIndexPath:(id)a3;
- (unint64_t)_previousItemIndexForIndexPath:(id)a3;
- (unint64_t)indexForCell:(id)a3;
- (unint64_t)scrollMode;
- (void)_animatePagedCenteringAnimated:(BOOL)a3 animations:(id)a4 completion:(id)a5;
- (void)_centerItemAtPageIndex:(int64_t)a3 animated:(BOOL)a4;
- (void)_focusItemAtIndex:(int64_t)a3;
- (void)_handlePlayGesture:(id)a3;
- (void)_pageControlValueChanged:(id)a3;
- (void)_setContentOffsetForCollectionViewIndex:(int64_t)a3;
- (void)_setContentOffsetForCollectionViewIndex:(int64_t)a3 animated:(BOOL)a4;
- (void)_startAutoScrollTimer;
- (void)_startContinuousScroll;
- (void)_stopAutoScrollTimer;
- (void)_stopContinuousScroll;
- (void)_updateAutoScrollTimer;
- (void)_updateCarouselWithDataSource:(id)a3 indicesToRemove:(id)a4 indicesToAdd:(id)a5 indicesToReload:(id)a6;
- (void)_updateCollectionViewLayout;
- (void)_updateCollectionViewLayoutAnimated:(BOOL)a3;
- (void)_updateContentOffsetForFocusedIndex:(int64_t)a3 animated:(BOOL)a4;
- (void)_updateIdleModeLayoutAttributes;
- (void)_updatePageControl;
- (void)calculateChangeSetForFocusedIndex:(int64_t)a3 newDataSourceMap:(id)a4 indexesToRemove:(id *)a5 indexesToAdd:(id *)a6 indexesToReload:(id *)a7;
- (void)centerItemAtPageIndex:(int64_t)a3;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)displayLinkDidFire:(id)a3;
- (void)layoutSubviews;
- (void)registerClass:(Class)a3 forCellWithReuseIdentifier:(id)a4;
- (void)registerNib:(id)a3 forCellWithReuseIdentifier:(id)a4;
- (void)reloadData;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setAutoscrollInterval:(double)a3;
- (void)setCollectionToDatasourceIndexMap:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayLink:(id)a3;
- (void)setFirstFocusChangeInInterval:(id)a3;
- (void)setFocusDirection:(CGPoint)a3;
- (void)setFocusGuide:(id)a3;
- (void)setFocusThrottleTimeInterval:(double)a3;
- (void)setHeaderView:(id)a3;
- (void)setInteritemSpacing:(double)a3;
- (void)setInteritemSpacing:(double)a3 animated:(BOOL)a4;
- (void)setItemSize:(CGSize)a3;
- (void)setOffsetChangePerSecond:(double)a3;
- (void)setPageControl:(id)a3;
- (void)setPageControlMargin:(double)a3;
- (void)setPreviousDisplayLinkTimestamp:(double)a3;
- (void)setScrollMode:(unint64_t)a3;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)setShouldScaleOnIdleFocus:(BOOL)a3;
- (void)setShowcaseFactor:(double)a3;
- (void)setShowsPageControl:(BOOL)a3;
- (void)setTargetContentOffset:(CGPoint)a3;
- (void)setUnitScrollDuration:(double)a3;
- (void)tv_setShowcaseFactor:(double)a3;
@end

@implementation _TVCarouselView

- (_TVCarouselView)initWithFrame:(CGRect)a3
{
  v41[1] = *MEMORY[0x263EF8340];
  v39.receiver = self;
  v39.super_class = (Class)_TVCarouselView;
  v3 = -[_TVCarouselView initWithFrame:](&v39, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [_TVCarouselCollectionView alloc];
    [v3 bounds];
    CGRect v43 = CGRectInset(v42, 0.0, 0.0);
    double x = v43.origin.x;
    double y = v43.origin.y;
    double width = v43.size.width;
    double height = v43.size.height;
    v9 = objc_alloc_init(_TVCarouselCollectionViewLayout);
    uint64_t v10 = -[_TVCarouselCollectionView initWithFrame:collectionViewLayout:](v4, "initWithFrame:collectionViewLayout:", v9, x, y, width, height);
    v11 = (void *)*((void *)v3 + 53);
    *((void *)v3 + 53) = v10;

    [*((id *)v3 + 53) setAutoresizingMask:18];
    [*((id *)v3 + 53) setDataSource:v3];
    [*((id *)v3 + 53) setDelegate:v3];
    [*((id *)v3 + 53) setOpaque:0];
    [*((id *)v3 + 53) setBackgroundColor:0];
    [*((id *)v3 + 53) setClipsToBounds:0];
    [*((id *)v3 + 53) setShowsHorizontalScrollIndicator:0];
    [*((id *)v3 + 53) setShowsVerticalScrollIndicator:0];
    *(int64x2_t *)(v3 + 632) = vdupq_n_s64(0x4049000000000000uLL);
    *((void *)v3 + 64) = 0x4024000000000000;
    [v3 addSubview:*((void *)v3 + 53)];
    uint64_t v12 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:0];
    v13 = (void *)*((void *)v3 + 71);
    *((void *)v3 + 71) = v12;

    v38 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:v3 action:sel__handlePlayGesture_];
    [v38 setAllowedPressTypes:&unk_26F2B58A8];
    [v3 addGestureRecognizer:v38];
    v14 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v15 = *MEMORY[0x263F1D050];
    v16 = [MEMORY[0x263F1C408] sharedApplication];
    v37 = v14;
    [v14 addObserver:v3 selector:sel__applicationDidEnterBackgroundNotification_ name:v15 object:v16];

    uint64_t v17 = *MEMORY[0x263F1D038];
    v18 = [MEMORY[0x263F1C408] sharedApplication];
    [v14 addObserver:v3 selector:sel__applicationDidBecomeActiveNotification_ name:v17 object:v18];

    [v14 addObserver:v3 selector:sel__accessibilityReducedMotionNotification_ name:*MEMORY[0x263F1CE50] object:0];
    *((void *)v3 + 78) = 0x3FD0000000000000;
    *((void *)v3 + 59) = 0;
    *((void *)v3 + 66) = 0x4024000000000000;
    *((void *)v3 + 67) = 0x4010000000000000;
    id v19 = objc_alloc_init(MEMORY[0x263F1C640]);
    v20 = (void *)*((void *)v3 + 72);
    *((void *)v3 + 72) = v19;

    v41[0] = *((void *)v3 + 53);
    v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:1];
    [*((id *)v3 + 72) setPreferredFocusEnvironments:v21];

    [v3 addLayoutGuide:*((void *)v3 + 72)];
    v32 = (void *)MEMORY[0x263F08938];
    v36 = [v3 leftAnchor];
    v35 = [*((id *)v3 + 72) leftAnchor];
    v34 = [v36 constraintEqualToAnchor:v35];
    v40[0] = v34;
    v33 = [v3 topAnchor];
    v22 = [*((id *)v3 + 72) topAnchor];
    v23 = [v33 constraintEqualToAnchor:v22 constant:1.0];
    v40[1] = v23;
    v24 = [v3 rightAnchor];
    v25 = [*((id *)v3 + 72) rightAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];
    v40[2] = v26;
    v27 = [v3 bottomAnchor];
    v28 = [*((id *)v3 + 72) bottomAnchor];
    v29 = [v27 constraintEqualToAnchor:v28 constant:-1.0];
    v40[3] = v29;
    v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:4];
    [v32 activateConstraints:v30];

    *((void *)v3 + 70) = 0x4014000000000000;
  }
  return (_TVCarouselView *)v3;
}

- (void)tv_setShowcaseFactor:(double)a3
{
  self->_showcaseFactor = a3;
  [(_TVCarouselView *)self setNeedsLayout];
}

- (void)setHeaderView:(id)a3
{
  v5 = (UIView *)a3;
  headerView = self->_headerView;
  v8 = v5;
  if (headerView != v5)
  {
    [(UIView *)headerView removeFromSuperview];
    objc_storeStrong((id *)&self->_headerView, a3);
    v7 = [(_TVCarouselView *)self headerView];
    [(_TVCarouselView *)self addSubview:v7];
  }
  [(_TVCarouselView *)self setNeedsLayout];
}

- (void)setScrollMode:(unint64_t)a3
{
  if (self->_scrollMode != a3)
  {
    self->_scrollMode = a3;
    autoScrollTimer = self->_autoScrollTimer;
    if (a3 || !autoScrollTimer)
    {
      if (a3 == 2)
      {
        if (autoScrollTimer) {
          dispatch_suspend(autoScrollTimer);
        }
      }
    }
    else
    {
      dispatch_resume(autoScrollTimer);
    }
  }
}

- (void)setShowsPageControl:(BOOL)a3
{
  BOOL v3 = a3;
  self->_showsPageControl = a3;
  v5 = [(_TVCarouselView *)self pageControl];

  if (v3)
  {
    if (!v5)
    {
      v6 = objc_opt_new();
      [v6 setHidesForSinglePage:1];
      [v6 addTarget:self action:sel__pageControlValueChanged_ forControlEvents:4096];
      [(_TVCarouselView *)self setPageControl:v6];
      v7 = [(_TVCarouselView *)self pageControl];
      [v7 setHidesForSinglePage:1];

      v8 = [(_TVCarouselView *)self pageControl];
      [(_TVCarouselView *)self addSubview:v8];
    }
    [(_TVCarouselView *)self setNeedsLayout];
  }
  else if (v5)
  {
    v9 = [(_TVCarouselView *)self pageControl];
    [v9 removeFromSuperview];

    [(_TVCarouselView *)self setPageControl:0];
  }
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)_TVCarouselView;
  [(_TVCarouselView *)&v10 layoutSubviews];
  [(_TVCarouselView *)self itemSize];
  double v4 = v3;
  [(_TVCarouselView *)self interitemSpacing];
  double v6 = v5 + v4 * 0.5 + 10.0;
  [(_TVCarouselView *)self bounds];
  double v8 = v6 - v7 * 0.5;
  if (v8 < 0.0) {
    double v8 = 0.0;
  }
  -[_TVCarouselCollectionView _setVisibleRectEdgeInsets:](self->_collectionView, "_setVisibleRectEdgeInsets:", 0.0, -v8, 0.0, -v8);
  if (self->_flags.firstLayoutPass)
  {
    self->_flags.firstLayoutPass = 0;
    [(_TVCarouselView *)self layoutBelowIfNeeded];
    [(_TVCarouselView *)self _updateAutoScrollTimer];
    focusedIndexPath = self->_focusedIndexPath;
    if (focusedIndexPath) {
      [(_TVCarouselView *)self _updateContentOffsetForFocusedIndex:[(NSIndexPath *)focusedIndexPath item] animated:0];
    }
  }
  [(_TVCarouselView *)self _updatePageControl];
}

- (void)_startContinuousScroll
{
  if (!self->_displayLink)
  {
    int64_t v3 = [(_TVCarouselView *)self _centerCollectionViewCellIndex];
    [(_TVCarouselView *)self _setContentOffsetForCollectionViewIndex:v3];
    double v4 = [(_TVCarouselView *)self _collectionView];
    [v4 contentOffset];
    double v6 = v5;
    double v8 = v7;

    [(_TVCarouselView *)self _contentOffsetXForCollectionViewIndex:v3 + 1];
    double v10 = v9;
    [(_TVCarouselView *)self setOffsetChangePerSecond:(v9 - v6) / self->_unitScrollDuration];
    -[_TVCarouselView setTargetContentOffset:](self, "setTargetContentOffset:", v10, v8);
    [(_TVCarouselView *)self setPreviousDisplayLinkTimestamp:0.0];
    [(_TVCarouselView *)self _stopContinuousScroll];
    id v12 = [MEMORY[0x263F15780] displayLinkWithTarget:self selector:sel_displayLinkDidFire_];
    v11 = [MEMORY[0x263EFF9F0] currentRunLoop];
    [v12 addToRunLoop:v11 forMode:*MEMORY[0x263EFF588]];

    [(_TVCarouselView *)self setDisplayLink:v12];
  }
}

- (void)displayLinkDidFire:(id)a3
{
  double v4 = [(_TVCarouselView *)self displayLink];
  [v4 timestamp];
  double v6 = v5;

  [(_TVCarouselView *)self previousDisplayLinkTimestamp];
  if (v7 == 0.0)
  {
    double v9 = 0.0;
  }
  else
  {
    [(_TVCarouselView *)self previousDisplayLinkTimestamp];
    double v9 = v6 - v8;
  }
  [(_TVCarouselView *)self setPreviousDisplayLinkTimestamp:v6];
  if ([(_TVCarouselView *)self _canScrollCarouselView])
  {
    double v10 = [(_TVCarouselView *)self _collectionView];
    [v10 contentOffset];
    double v12 = v11;
    double v14 = v13;

    [(_TVCarouselView *)self offsetChangePerSecond];
    double v16 = v12 + v15 * v9;
    uint64_t v17 = [(_TVCarouselView *)self _collectionView];
    objc_msgSend(v17, "setContentOffset:animated:", 0, v16, v14);

    v18 = [(_TVCarouselView *)self displayLink];
    [v18 targetTimestamp];
    double v20 = v19 - v6;
    [(_TVCarouselView *)self offsetChangePerSecond];
    double v22 = v20 * v21;

    v23 = [(_TVCarouselView *)self _collectionView];
    [v23 contentOffset];
    double v25 = v22 + v24;
    [(_TVCarouselView *)self targetContentOffset];
    double v27 = v26;

    if (v25 >= v27)
    {
      int64_t v28 = [(_TVCarouselView *)self _centerCollectionViewCellIndex] + 1;
      [(_TVCarouselView *)self _focusItemAtIndex:v28];
    }
  }
}

- (void)_stopContinuousScroll
{
  [(CADisplayLink *)self->_displayLink invalidate];
  displayLink = self->_displayLink;
  self->_displayLink = 0;
}

- (void)dealloc
{
  [(_TVCarouselView *)self _stopAutoScrollTimer];
  [(_TVCarouselView *)self _stopContinuousScroll];
  int64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)_TVCarouselView;
  [(_TVCarouselView *)&v4 dealloc];
}

- (id)_collectionView
{
  return self->_collectionView;
}

- (void)_pageControlValueChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 currentPage];
  uint64_t v6 = [v4 interactionState];

  [(_TVCarouselView *)self _centerItemAtPageIndex:v5 animated:v6 != 2];
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)_TVCarouselView;
  [(_TVCarouselView *)&v4 didMoveToWindow];
  int64_t v3 = [(_TVCarouselView *)self window];

  if (v3) {
    self->_flags.firstLayoutPass = 1;
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_TVCarouselView;
  [(_TVCarouselView *)&v5 didUpdateFocusInContext:a3 withAnimationCoordinator:a4];
  [(_TVCarouselView *)self _updateAutoScrollTimer];
  [(_TVCarouselView *)self _updateIdleModeLayoutAttributes];
}

- (id)preferredFocusedView
{
  return self->_collectionView;
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double height = self->_itemSize.height;
  result.double height = height;
  return result;
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_TVCarouselView;
  -[_TVCarouselView setSemanticContentAttribute:](&v5, sel_setSemanticContentAttribute_);
  [(_TVCarouselCollectionView *)self->_collectionView setSemanticContentAttribute:a3];
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  int64_t v3 = [(_TVCarouselView *)self _centerCollectionViewCellIndex];
  objc_super v4 = (void *)MEMORY[0x263F088C8];
  return (id)[v4 indexPathForItem:v3 inSection:0];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  self->_numberOfRealItemsForDataSource = [WeakRetained numberOfItemsInCarouselView:self];

  [(_TVCarouselCollectionView *)self->_collectionView setScrollEnabled:self->_numberOfRealItemsForDataSource > 1];
  uint64_t v6 = [(_TVCarouselView *)self collectionToDatasourceIndexMap];
  uint64_t v7 = [v6 count];

  if (!v7)
  {
    double v8 = [(_TVCarouselView *)self _prepareIndexMap:0x7FFFFFFFFFFFFFFFLL];
    [(_TVCarouselView *)self setCollectionToDatasourceIndexMap:v8];
  }
  double v9 = [(_TVCarouselView *)self collectionToDatasourceIndexMap];
  int64_t v10 = [v9 count];

  return v10;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  self->_indexToDeque = objc_msgSend(a4, "item", a3);
  objc_super v5 = [(_TVCarouselView *)self collectionToDatasourceIndexMap];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:self->_indexToDeque];
  uint64_t v7 = [v5 objectForKey:v6];
  uint64_t v8 = [v7 unsignedIntegerValue];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  int64_t v10 = [WeakRetained carouselView:self cellForItemAtIndex:v8];

  self->_indexToDeque = 0x7FFFFFFFFFFFFFFFLL;
  return v10;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  if ((*(unsigned char *)&self->_carouselViewFlags & 2) == 0) {
    return 1;
  }
  objc_super v5 = self;
  p_delegate = &self->_delegate;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  uint64_t v9 = [(_TVCarouselView *)v5 _itemIndexForIndexPath:v7];

  LOBYTE(v5) = [WeakRetained carouselView:v5 shouldHighlightItemAtIndex:v9];
  return (char)v5;
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  if ((*(unsigned char *)&self->_carouselViewFlags & 4) != 0)
  {
    p_delegate = &self->_delegate;
    id v6 = a4;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    unint64_t v7 = [(_TVCarouselView *)self _itemIndexForIndexPath:v6];

    [WeakRetained carouselView:self didHighlightItemAtIndex:v7];
  }
}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  if ((*(unsigned char *)&self->_carouselViewFlags & 8) != 0)
  {
    p_delegate = &self->_delegate;
    id v6 = a4;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    unint64_t v7 = [(_TVCarouselView *)self _itemIndexForIndexPath:v6];

    [WeakRetained carouselView:self didUnhighlightItemAtIndex:v7];
  }
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  if ((*(unsigned char *)&self->_carouselViewFlags & 0x10) == 0) {
    return 1;
  }
  objc_super v5 = self;
  p_delegate = &self->_delegate;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  uint64_t v9 = [(_TVCarouselView *)v5 _itemIndexForIndexPath:v7];

  LOBYTE(v5) = [WeakRetained carouselView:v5 shouldSelectItemAtIndex:v9];
  return (char)v5;
}

- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4
{
  if ((*(unsigned char *)&self->_carouselViewFlags & 0x20) == 0) {
    return 1;
  }
  objc_super v5 = self;
  p_delegate = &self->_delegate;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  uint64_t v9 = [(_TVCarouselView *)v5 _itemIndexForIndexPath:v7];

  LOBYTE(v5) = [WeakRetained carouselView:v5 shouldDeselectItemAtIndex:v9];
  return (char)v5;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  if ((*(unsigned char *)&self->_carouselViewFlags & 0x40) != 0)
  {
    p_delegate = &self->_delegate;
    id v6 = a4;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    unint64_t v7 = [(_TVCarouselView *)self _itemIndexForIndexPath:v6];

    [WeakRetained carouselView:self didSelectItemAtIndex:v7];
  }
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  if ((*(unsigned char *)&self->_carouselViewFlags & 0x80) != 0)
  {
    p_delegate = &self->_delegate;
    id v6 = a4;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    unint64_t v7 = [(_TVCarouselView *)self _itemIndexForIndexPath:v6];

    [WeakRetained carouselView:self didDeselectItemAtIndex:v7];
  }
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!self->_focusedIndexPath) {
    [(_TVCarouselView *)self _updateContentOffsetForFocusedIndex:0x7FFFFFFFFFFFFFFFLL animated:0];
  }
  unint64_t v11 = [(_TVCarouselView *)self _itemIndexForIndexPath:v10];
  if (*((unsigned char *)&self->_carouselViewFlags + 1))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained carouselView:self willDisplayCell:v9 forItemAtIndex:v11];
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __69___TVCarouselView_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke;
  v15[3] = &unk_26504DE80;
  v15[4] = self;
  v15[5] = v11;
  double v13 = (unsigned int (**)(void))MEMORY[0x2455C18A0](v15);
  if (v13[2]() && (*((unsigned char *)&self->_carouselViewFlags + 1) & 0x20) != 0)
  {
    id v14 = objc_loadWeakRetained((id *)&self->_delegate);
    [v14 carouselView:self willDisplayItemAtIndex:v11];
  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7 = a4;
  unint64_t v8 = [(_TVCarouselView *)self _previousItemIndexForIndexPath:a5];
  if ((*((unsigned char *)&self->_carouselViewFlags + 1) & 2) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained carouselView:self didEndDisplayingCell:v7 forItemAtIndex:v8];
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __74___TVCarouselView_collectionView_didEndDisplayingCell_forItemAtIndexPath___block_invoke;
  v12[3] = &unk_26504DE80;
  v12[4] = self;
  v12[5] = v8;
  id v10 = (unsigned int (**)(void))MEMORY[0x2455C18A0](v12);
  if (v10[2]() && (*((unsigned char *)&self->_carouselViewFlags + 1) & 0x40) != 0)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
    [v11 carouselView:self didEndDisplayingItemAtIndex:v8];
  }
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4 = a3;
  if (self->_scrollMode != 1)
  {
    if (self->_firstFocusChangeInInterval)
    {
      id v6 = [MEMORY[0x263EFF910] date];
      [v6 timeIntervalSinceDate:self->_firstFocusChangeInInterval];
      double v8 = v7;

      if (v8 < self->_focusThrottleTimeInterval)
      {
        BOOL v5 = self->_numFocusChangesInInterval < 1;
        goto LABEL_8;
      }
      self->_numFocusChangesInInterval = 0;
    }
    BOOL v5 = 1;
    goto LABEL_8;
  }
  BOOL v5 = 0;
LABEL_8:

  return v5;
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  int64_t v9 = [(_TVCarouselView *)self _centerCollectionViewCellIndex];
  int64_t v10 = v9;
  int v11 = y == *(double *)(MEMORY[0x263F00148] + 8) && x == *MEMORY[0x263F00148];
  if (v11 == 1)
  {
    [(_TVCarouselView *)self _contentOffsetXForCollectionViewIndex:v9];
    double v13 = v12;
    [(_TVCarouselView *)self itemSize];
    double v15 = v13 + v14 * 0.5;
    [(_TVCarouselView *)self interitemSpacing];
    double v17 = v16 * 0.5 + v15;
    [(_TVCarouselView *)self _contentOffsetXForCollectionViewIndex:v10];
    double v19 = v18;
    [(_TVCarouselView *)self itemSize];
    double v21 = v19 - v20 * 0.5;
    [(_TVCarouselView *)self interitemSpacing];
    double v23 = v21 - v22 * 0.5;
  }
  else
  {
    [(_TVCarouselView *)self _contentOffsetXForCollectionViewIndex:v9 + 1];
    double v17 = v24;
    [(_TVCarouselView *)self _contentOffsetXForCollectionViewIndex:v10 - 1];
  }
  double v25 = floor(a5->x);
  if (v25 <= v23) {
    uint64_t v26 = -1;
  }
  else {
    uint64_t v26 = v25 >= v17;
  }
  uint64_t v27 = v26 + v10;
  int64_t v28 = [MEMORY[0x263F088C8] indexPathForItem:v27 inSection:0];
  focusedIndexPath = self->_focusedIndexPath;
  self->_focusedIndexPath = v28;

  if (((v26 != 0) & ~v11) == 0)
  {
    v30 = [(_TVCarouselView *)self _collectionView];
    [v30 contentOffset];
    a5->double x = v31;

    [(_TVCarouselView *)self _setContentOffsetForCollectionViewIndex:v27 animated:1];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v15 = a3;
  if ((*((unsigned char *)&self->_carouselViewFlags + 1) & 4) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained carouselViewDidScroll:self];
  }
  focusedIndexPath = self->_focusedIndexPath;
  if (focusedIndexPath)
  {
    if ([(NSIndexPath *)focusedIndexPath item] != 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v6 = [(_TVCarouselView *)self _centerCollectionViewCellIndex];
      [(_TVCarouselView *)self _contentOffsetXForCollectionViewIndex:v6 + 1];
      double v8 = v7;
      [(_TVCarouselView *)self _contentOffsetXForCollectionViewIndex:v6 - 1];
      double v10 = v9;
      [v15 contentOffset];
      if (floor(v11) <= v10 || ([v15 contentOffset], floor(v12) >= v8))
      {
        [(_TVCarouselView *)self _focusItemAtIndex:[(NSIndexPath *)self->_focusedIndexPath item]];
        double v13 = [MEMORY[0x263F088C8] indexPathForItem:v6 inSection:0];
        double v14 = self->_focusedIndexPath;
        self->_focusedIndexPath = v13;
      }
    }
  }
}

- (void)_handlePlayGesture:(id)a3
{
  if ([a3 state] == 3 && (*((unsigned char *)&self->_carouselViewFlags + 1) & 0x10) != 0)
  {
    id v4 = [MEMORY[0x263F1C920] mainScreen];
    id v9 = [v4 focusedView];

    if (v9)
    {
      BOOL v5 = [(_TVCarouselView *)self visibleCells];
      int v6 = [v5 containsObject:v9];

      if (v6)
      {
        unint64_t v7 = [(_TVCarouselView *)self indexForCell:v9];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained carouselView:self didPlayItemAtIndex:v7];
      }
    }
  }
}

- (id)_cellForItemAtIndex:(unint64_t)a3
{
  collectionView = self->_collectionView;
  id v4 = [MEMORY[0x263F088C8] indexPathForItem:a3 inSection:0];
  BOOL v5 = [(_TVCarouselCollectionView *)collectionView cellForItemAtIndexPath:v4];

  return v5;
}

- (id)focusedCell
{
  focusedIndexPath = self->_focusedIndexPath;
  if (focusedIndexPath)
  {
    focusedIndexPath = -[_TVCarouselView _cellForItemAtIndex:](self, "_cellForItemAtIndex:", [focusedIndexPath item]);
  }
  return focusedIndexPath;
}

- (id)dequeueReusableCellWithReuseIdentifier:(id)a3 forIndex:(unint64_t)a4
{
  id v5 = a3;
  unint64_t indexToDeque = self->_indexToDeque;
  if (indexToDeque == 0x7FFFFFFFFFFFFFFFLL)
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"-dequeueReusableCellWithReuseIdentifier:forIndex: may only be called from -carouselView:cellForItemAtIndex:"];
    unint64_t v7 = 0;
  }
  else
  {
    collectionView = self->_collectionView;
    id v9 = [MEMORY[0x263F088C8] indexPathForItem:indexToDeque inSection:0];
    unint64_t v7 = [(_TVCarouselCollectionView *)collectionView dequeueReusableCellWithReuseIdentifier:v5 forIndexPath:v9];
  }
  return v7;
}

- (unint64_t)indexForCell:(id)a3
{
  id v4 = [(_TVCarouselCollectionView *)self->_collectionView indexPathForCell:a3];
  if (v4)
  {
    id v5 = [(_TVCarouselView *)self collectionToDatasourceIndexMap];
    int v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "item"));
    unint64_t v7 = [v5 objectForKeyedSubscript:v6];
    unint64_t v8 = [v7 unsignedIntegerValue];
  }
  else
  {
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (void)registerClass:(Class)a3 forCellWithReuseIdentifier:(id)a4
{
}

- (void)registerNib:(id)a3 forCellWithReuseIdentifier:(id)a4
{
}

- (void)reloadData
{
  objc_storeStrong((id *)&self->_previousCollectionToDatasourceIndexMap, self->_collectionToDatasourceIndexMap);
  [(_TVCarouselView *)self setCollectionToDatasourceIndexMap:0];
  focusedIndexPath = self->_focusedIndexPath;
  self->_focusedIndexPath = 0;

  [(_TVCarouselCollectionView *)self->_collectionView reloadData];
  [(_TVCarouselView *)self _updateAutoScrollTimer];
  [(_TVCarouselView *)self _updatePageControl];
  if (*((unsigned char *)&self->_carouselViewFlags + 2))
  {
    id v4 = [(_TVCarouselView *)self collectionToDatasourceIndexMap];
    id v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[_TVCarouselView _centerCollectionViewCellIndex](self, "_centerCollectionViewCellIndex"));
    int v6 = [v4 objectForKeyedSubscript:v5];
    uint64_t v7 = [v6 integerValue];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained carouselView:self didCenterItemAtIndex:v7];
  }
}

- (void)setInteritemSpacing:(double)a3
{
}

- (void)setInteritemSpacing:(double)a3 animated:(BOOL)a4
{
  if (vabdd_f64(self->_interitemSpacing, a3) > 0.00000011920929)
  {
    self->_interitemSpacing = a3;
    [(_TVCarouselView *)self _updateCollectionViewLayoutAnimated:a4];
  }
}

- (void)setItemSize:(CGSize)a3
{
  if (self->_itemSize.width != a3.width || self->_itemSize.height != a3.height)
  {
    self->_itemSize = a3;
    [(_TVCarouselView *)self _updateCollectionViewLayout];
  }
}

- (void)setAutoscrollInterval:(double)a3
{
  if (vabdd_f64(self->_autoscrollInterval, a3) > 2.22044605e-16)
  {
    if (a3 < 0.5 && a3 > 2.22044605e-16) {
      a3 = 0.5;
    }
    self->_autoscrollInterval = a3;
    [(_TVCarouselView *)self _updateAutoScrollTimer];
  }
}

- (void)setUnitScrollDuration:(double)a3
{
  if (vabdd_f64(self->_unitScrollDuration, a3) > 2.22044605e-16)
  {
    if (a3 < 0.5 && a3 > 2.22044605e-16) {
      a3 = 0.5;
    }
    self->_unitScrollDuration = a3;
    [(_TVCarouselView *)self _updateAutoScrollTimer];
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id v4 = [(_TVCarouselView *)self delegate];
  if (v4 != obj || !obj && (*(unsigned char *)&self->_carouselViewFlags & 1) != 0)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_carouselViewFlags = ($369F20C4059AE0935D9B998A99959B13)(*(_DWORD *)&self->_carouselViewFlags & 0xFFFFFFFE | (obj != 0));
    if (objc_opt_respondsToSelector()) {
      int v5 = 2;
    }
    else {
      int v5 = 0;
    }
    self->_carouselViewFlags = ($369F20C4059AE0935D9B998A99959B13)(*(_DWORD *)&self->_carouselViewFlags & 0xFFFFFFFD | v5);
    if (objc_opt_respondsToSelector()) {
      int v6 = 4;
    }
    else {
      int v6 = 0;
    }
    self->_carouselViewFlags = ($369F20C4059AE0935D9B998A99959B13)(*(_DWORD *)&self->_carouselViewFlags & 0xFFFFFFFB | v6);
    if (objc_opt_respondsToSelector()) {
      int v7 = 8;
    }
    else {
      int v7 = 0;
    }
    self->_carouselViewFlags = ($369F20C4059AE0935D9B998A99959B13)(*(_DWORD *)&self->_carouselViewFlags & 0xFFFFFFF7 | v7);
    if (objc_opt_respondsToSelector()) {
      int v8 = 16;
    }
    else {
      int v8 = 0;
    }
    self->_carouselViewFlags = ($369F20C4059AE0935D9B998A99959B13)(*(_DWORD *)&self->_carouselViewFlags & 0xFFFFFFEF | v8);
    if (objc_opt_respondsToSelector()) {
      int v9 = 32;
    }
    else {
      int v9 = 0;
    }
    self->_carouselViewFlags = ($369F20C4059AE0935D9B998A99959B13)(*(_DWORD *)&self->_carouselViewFlags & 0xFFFFFFDF | v9);
    if (objc_opt_respondsToSelector()) {
      int v10 = 64;
    }
    else {
      int v10 = 0;
    }
    self->_carouselViewFlags = ($369F20C4059AE0935D9B998A99959B13)(*(_DWORD *)&self->_carouselViewFlags & 0xFFFFFFBF | v10);
    if (objc_opt_respondsToSelector()) {
      int v11 = 128;
    }
    else {
      int v11 = 0;
    }
    self->_carouselViewFlags = ($369F20C4059AE0935D9B998A99959B13)(*(_DWORD *)&self->_carouselViewFlags & 0xFFFFFF7F | v11);
    if (objc_opt_respondsToSelector()) {
      int v12 = 256;
    }
    else {
      int v12 = 0;
    }
    self->_carouselViewFlags = ($369F20C4059AE0935D9B998A99959B13)(*(_DWORD *)&self->_carouselViewFlags & 0xFFFFFEFF | v12);
    if (objc_opt_respondsToSelector()) {
      int v13 = 512;
    }
    else {
      int v13 = 0;
    }
    self->_carouselViewFlags = ($369F20C4059AE0935D9B998A99959B13)(*(_DWORD *)&self->_carouselViewFlags & 0xFFFFFDFF | v13);
    if (objc_opt_respondsToSelector()) {
      int v14 = 1024;
    }
    else {
      int v14 = 0;
    }
    self->_carouselViewFlags = ($369F20C4059AE0935D9B998A99959B13)(*(_DWORD *)&self->_carouselViewFlags & 0xFFFFFBFF | v14);
    if (objc_opt_respondsToSelector()) {
      int v15 = 2048;
    }
    else {
      int v15 = 0;
    }
    self->_carouselViewFlags = ($369F20C4059AE0935D9B998A99959B13)(*(_DWORD *)&self->_carouselViewFlags & 0xFFFFF7FF | v15);
    if (objc_opt_respondsToSelector()) {
      int v16 = 4096;
    }
    else {
      int v16 = 0;
    }
    self->_carouselViewFlags = ($369F20C4059AE0935D9B998A99959B13)(*(_DWORD *)&self->_carouselViewFlags & 0xFFFFEFFF | v16);
    if (objc_opt_respondsToSelector()) {
      int v17 = 0x2000;
    }
    else {
      int v17 = 0;
    }
    self->_carouselViewFlags = ($369F20C4059AE0935D9B998A99959B13)(*(_DWORD *)&self->_carouselViewFlags & 0xFFFFDFFF | v17);
    if (objc_opt_respondsToSelector()) {
      int v18 = 0x4000;
    }
    else {
      int v18 = 0;
    }
    self->_carouselViewFlags = ($369F20C4059AE0935D9B998A99959B13)(*(_DWORD *)&self->_carouselViewFlags & 0xFFFFBFFF | v18);
    if (objc_opt_respondsToSelector()) {
      int v19 = 0x8000;
    }
    else {
      int v19 = 0;
    }
    self->_carouselViewFlags = ($369F20C4059AE0935D9B998A99959B13)(*(_DWORD *)&self->_carouselViewFlags & 0xFFFF7FFF | v19);
    if (objc_opt_respondsToSelector()) {
      int v20 = 0x10000;
    }
    else {
      int v20 = 0;
    }
    self->_carouselViewFlags = ($369F20C4059AE0935D9B998A99959B13)(*(_DWORD *)&self->_carouselViewFlags & 0xFFFEFFFF | v20);
  }
}

- (NSArray)visibleCells
{
  return (NSArray *)[(_TVCarouselCollectionView *)self->_collectionView visibleCells];
}

- (void)centerItemAtPageIndex:(int64_t)a3
{
}

- (void)_centerItemAtPageIndex:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = [NSNumber numberWithInteger:a3];
  int v6 = [(_TVCarouselView *)self collectionToDatasourceIndexMap];
  int v7 = [v6 allKeysForObject:v10];

  if ([v7 count])
  {
    int v8 = [v7 firstObject];
    uint64_t v9 = [v8 integerValue];

    [(_TVCarouselView *)self _updateContentOffsetForFocusedIndex:v9 animated:v4];
  }
}

- (int64_t)_centerCollectionViewCellIndex
{
  uint64_t v2 = [(_TVCarouselCollectionView *)self->_collectionView numberOfItemsInSection:0];
  if (v2 >= 0) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = v2 + 1;
  }
  return v3 >> 1;
}

- (int64_t)_numberOfCells
{
  if (self->_numberOfRealItemsForDataSource < 2) {
    return self->_numberOfRealItemsForDataSource;
  }
  uint64_t v3 = [(_TVCarouselCollectionView *)self->_collectionView collectionViewLayout];
  int64_t v4 = [v3 _expectedNumberOfCells];

  return v4;
}

- (void)calculateChangeSetForFocusedIndex:(int64_t)a3 newDataSourceMap:(id)a4 indexesToRemove:(id *)a5 indexesToAdd:(id *)a6 indexesToReload:(id *)a7
{
  id v42 = a4;
  int v12 = [(_TVCarouselView *)self collectionToDatasourceIndexMap];
  int v13 = (void *)[v12 copy];

  uint64_t v14 = [v13 count];
  if (v14 == [v42 count])
  {
    v41 = a5;
    int v15 = [(_TVCarouselView *)self collectionToDatasourceIndexMap];
    uint64_t v16 = [v15 count];

    int64_t v17 = [(_TVCarouselView *)self _centerCollectionViewCellIndex];
    int v18 = [MEMORY[0x263EFF980] array];
    int v19 = [MEMORY[0x263EFF980] array];
    uint64_t v20 = a3 - v17;
    if (a3 != v17)
    {
      uint64_t v21 = 0;
      if (v20 < 0) {
        uint64_t v20 = v17 - a3;
      }
      if ((unint64_t)v20 <= 1) {
        uint64_t v22 = 1;
      }
      else {
        uint64_t v22 = v20;
      }
      uint64_t v23 = v16 - 1;
      do
      {
        double v24 = [MEMORY[0x263F088C8] indexPathForItem:v21 inSection:0];
        [v18 addObject:v24];

        double v25 = [MEMORY[0x263F088C8] indexPathForItem:v23 inSection:0];
        [v19 addObject:v25];

        ++v21;
        --v23;
      }
      while (v22 != v21);
    }
    if (a3 <= v17) {
      uint64_t v26 = v18;
    }
    else {
      uint64_t v26 = v19;
    }
    if (a3 <= v17) {
      uint64_t v27 = v19;
    }
    else {
      uint64_t v27 = v18;
    }
    *a6 = v26;
    id *v41 = v27;
  }
  else
  {
    unint64_t v28 = [v13 count];
    unint64_t v29 = [v42 count];
    unint64_t v30 = [v13 count];
    if (v28 >= v29)
    {
      if (v30 > [v42 count])
      {
        for (unint64_t i = 0; i < [v42 count]; ++i)
        {
          id v37 = *a7;
          v38 = [MEMORY[0x263F088C8] indexPathForItem:i inSection:0];
          [v37 addObject:v38];
        }
        for (; i < [v13 count]; ++i)
        {
          id v39 = *a5;
          v40 = [MEMORY[0x263F088C8] indexPathForItem:i inSection:0];
          [v39 addObject:v40];
        }
      }
    }
    else
    {
      unint64_t v31 = 0;
      if (v30)
      {
        do
        {
          id v32 = *a7;
          v33 = [MEMORY[0x263F088C8] indexPathForItem:v31 inSection:0];
          [v32 addObject:v33];

          ++v31;
        }
        while (v31 < [v13 count]);
      }
      for (; v31 < [v42 count]; ++v31)
      {
        id v34 = *a6;
        v35 = [MEMORY[0x263F088C8] indexPathForItem:v31 inSection:0];
        [v34 addObject:v35];
      }
    }
  }
}

- (void)_focusItemAtIndex:(int64_t)a3
{
  if ([(_TVCarouselView *)self _canScrollCarouselView] && !self->_flags.layoutUpdateInProgress)
  {
    int64_t v5 = [(_TVCarouselView *)self _centerCollectionViewCellIndex];
    int v6 = [(_TVCarouselView *)self collectionToDatasourceIndexMap];
    int v7 = [NSNumber numberWithInteger:a3];
    int v8 = [v6 objectForKeyedSubscript:v7];
    uint64_t v9 = [v8 integerValue];

    id v10 = [(_TVCarouselView *)self pageControl];
    [v10 setCurrentPage:v9];

    int v11 = [MEMORY[0x263EFF980] array];
    int v12 = [MEMORY[0x263EFF980] array];
    int v13 = [MEMORY[0x263EFF980] array];
    uint64_t v14 = [(_TVCarouselView *)self _prepareIndexMap:v9];
    id v20 = v12;
    id v21 = v13;
    id v19 = v11;
    [(_TVCarouselView *)self calculateChangeSetForFocusedIndex:a3 newDataSourceMap:v14 indexesToRemove:&v21 indexesToAdd:&v20 indexesToReload:&v19];
    id v15 = v21;

    id v16 = v20;
    id v17 = v19;

    [(_TVCarouselView *)self _updateCarouselWithDataSource:v14 indicesToRemove:v15 indicesToAdd:v16 indicesToReload:v17];
    [(_TVCarouselView *)self _setContentOffsetForCollectionViewIndex:v5];
    [(_TVCarouselView *)self _updateAutoScrollTimer];
    if (*((unsigned char *)&self->_carouselViewFlags + 2))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained carouselView:self didCenterItemAtIndex:v9];
    }
  }
}

- (void)_setContentOffsetForCollectionViewIndex:(int64_t)a3
{
}

- (void)_setContentOffsetForCollectionViewIndex:(int64_t)a3 animated:(BOOL)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __68___TVCarouselView__setContentOffsetForCollectionViewIndex_animated___block_invoke;
  v4[3] = &unk_26504DEA8;
  v4[4] = self;
  v4[5] = a3;
  BOOL v5 = a4;
  [MEMORY[0x263F1CB60] performWithoutAnimation:v4];
}

- (void)_updateCarouselWithDataSource:(id)a3 indicesToRemove:(id)a4 indicesToAdd:(id)a5 indicesToReload:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void *)MEMORY[0x263F1CB60];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __94___TVCarouselView__updateCarouselWithDataSource_indicesToRemove_indicesToAdd_indicesToReload___block_invoke;
  v19[3] = &unk_26504DED0;
  v19[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  [v14 performWithoutAnimation:v19];
}

- (id)_prepareIndexMap:(int64_t)a3
{
  uint64_t v5 = [(_TVCarouselView *)self _numberOfCells];
  uint64_t v6 = v5;
  if (v5 >= 0) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = v5 + 1;
  }
  unint64_t numberOfRealItemsForDataSource = self->_numberOfRealItemsForDataSource;
  uint64_t v9 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:v5];
  if (v6 && numberOfRealItemsForDataSource)
  {
    uint64_t v10 = v7 >> 1;
    if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ((*((unsigned char *)&self->_carouselViewFlags + 1) & 0x80) != 0)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        a3 = [WeakRetained indexForPreferredCenteredViewInCarouselView:self];
      }
      else
      {
        a3 = 0;
      }
    }
    id v12 = [NSNumber numberWithInteger:a3];
    id v13 = [NSNumber numberWithInteger:v10];
    [v9 setObject:v12 forKey:v13];

    if (v6 >= 2)
    {
      uint64_t v14 = v10 - 1;
      uint64_t v15 = v10 + 1;
      int64_t v16 = a3;
      do
      {
        if (v16 + 1 == numberOfRealItemsForDataSource) {
          int64_t v16 = 0;
        }
        else {
          ++v16;
        }
        if (a3 >= 1) {
          int64_t v17 = a3;
        }
        else {
          int64_t v17 = numberOfRealItemsForDataSource;
        }
        a3 = v17 - 1;
        id v18 = [NSNumber numberWithInteger:v16];
        id v19 = [NSNumber numberWithInteger:v15];
        [v9 setObject:v18 forKey:v19];

        id v20 = [NSNumber numberWithInteger:a3];
        id v21 = [NSNumber numberWithInteger:v14];
        [v9 setObject:v20 forKey:v21];

        --v14;
        ++v15;
      }
      while (v14 != -1);
    }
  }
  id v22 = (void *)[v9 copy];

  return v22;
}

- (double)_contentOffsetXForCollectionViewIndex:(int64_t)a3
{
  uint64_t v5 = [(_TVCarouselCollectionView *)self->_collectionView collectionViewLayout];
  [v5 itemSize];
  double v7 = v6;
  [v5 minimumInteritemSpacing];
  double v9 = v8;
  [(_TVCarouselView *)self bounds];
  if (CGRectGetWidth(v13) > 0.0)
  {
    [(_TVCarouselView *)self bounds];
    double Width = CGRectGetWidth(v15);
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F1C920] mainScreen];
    [v10 bounds];
    double Width = CGRectGetWidth(v14);
  }
  return v7 * 0.5 + (double)a3 * (v7 + v9) - Width * 0.5;
}

- (void)_updateCollectionViewLayout
{
}

- (void)_updateCollectionViewLayoutAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  self->_flags.layoutUpdateInProgress = 1;
  double v6 = objc_alloc_init(_TVCarouselCollectionViewLayout);
  [(_TVCarouselView *)self _collectionViewLayoutItemSize];
  -[_TVCarouselCollectionViewLayout setItemSize:](v6, "setItemSize:");
  [(_TVCarouselCollectionViewLayout *)v6 setMinimumInteritemSpacing:self->_interitemSpacing];
  [(_TVCarouselCollectionView *)self->_collectionView setCollectionViewLayout:v6 animated:v3];
  focusedIndexPath = self->_focusedIndexPath;
  if (focusedIndexPath) {
    [(_TVCarouselView *)self _updateContentOffsetForFocusedIndex:[(NSIndexPath *)focusedIndexPath item] animated:0];
  }
  self->_flags.layoutUpdateInProgress = 0;
}

- (void)_updateContentOffsetForFocusedIndex:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = [(_TVCarouselView *)self window];

  if (v7)
  {
    double v8 = [MEMORY[0x263F088C8] indexPathForItem:a3 inSection:0];
    focusedIndexPath = self->_focusedIndexPath;
    self->_focusedIndexPath = v8;

    uint64_t v10 = [(_TVCarouselCollectionView *)self->_collectionView numberOfItemsInSection:0];
    if (self->_scrollMode != 1)
    {
      if (v10 >= 0) {
        uint64_t v11 = v10;
      }
      else {
        uint64_t v11 = v10 + 1;
      }
      uint64_t v12 = v11 >> 1;
      if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
        int64_t v13 = v12;
      }
      else {
        int64_t v13 = a3;
      }
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __64___TVCarouselView__updateContentOffsetForFocusedIndex_animated___block_invoke;
      v15[3] = &unk_26504DEF8;
      v15[4] = self;
      v15[5] = v13;
      void v15[6] = v12;
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __64___TVCarouselView__updateContentOffsetForFocusedIndex_animated___block_invoke_2;
      v14[3] = &unk_26504DF20;
      v14[4] = self;
      v14[5] = v12;
      [(_TVCarouselView *)self _animatePagedCenteringAnimated:v4 animations:v15 completion:v14];
    }
  }
}

- (void)_animatePagedCenteringAnimated:(BOOL)a3 animations:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v11 = a4;
  id v8 = a5;
  double v9 = (void *)MEMORY[0x263F1CB60];
  double v10 = 0.0;
  if (v6) {
    [(_TVCarouselView *)self _centeringAnimationDuration];
  }
  [v9 animateWithDuration:327686 delay:v11 options:v8 animations:v10 completion:0.0];
}

- (BOOL)_canScrollCarouselView
{
  BOOL v3 = [(_TVCarouselView *)self window];
  if (v3) {
    BOOL v4 = [(_TVCarouselCollectionView *)self->_collectionView numberOfItemsInSection:0] > 1;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)_updateAutoScrollTimer
{
  if (![(_TVCarouselView *)self _canScrollCarouselView])
  {
LABEL_8:
    [(_TVCarouselView *)self _stopAutoScrollTimer];
    [(_TVCarouselView *)self _stopContinuousScroll];
    return;
  }
  if (!self->_focusedIndexPath) {
    [(_TVCarouselView *)self _updateContentOffsetForFocusedIndex:0x7FFFFFFFFFFFFFFFLL animated:0];
  }
  BOOL v3 = [MEMORY[0x263F1C920] mainScreen];
  BOOL v4 = [v3 focusedView];
  if ([v4 isDescendantOfView:self])
  {
LABEL_7:

    goto LABEL_8;
  }
  uint64_t v5 = [MEMORY[0x263F1C408] sharedApplication];
  if ([v5 applicationState])
  {

    goto LABEL_7;
  }
  BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();

  if (IsReduceMotionEnabled) {
    goto LABEL_8;
  }
  unint64_t scrollMode = self->_scrollMode;
  if (scrollMode == 1)
  {
    [(_TVCarouselView *)self _startContinuousScroll];
  }
  else if (!scrollMode && fabs(self->_autoscrollInterval) > 2.22044605e-16)
  {
    [(_TVCarouselView *)self _startAutoScrollTimer];
  }
}

- (void)_startAutoScrollTimer
{
  [(_TVCarouselView *)self _stopAutoScrollTimer];
  if (self->_autoscrollInterval > 0.0)
  {
    objc_initWeak(&location, self);
    BOOL v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
    autoScrollTimer = self->_autoScrollTimer;
    self->_autoScrollTimer = v3;

    uint64_t v5 = self->_autoScrollTimer;
    dispatch_time_t v6 = dispatch_time(0, (uint64_t)(self->_autoscrollInterval * 1000000000.0));
    dispatch_source_set_timer(v5, v6, (unint64_t)(self->_autoscrollInterval * 1000000000.0), 0x1DCD6500uLL);
    double v7 = self->_autoScrollTimer;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __40___TVCarouselView__startAutoScrollTimer__block_invoke;
    v8[3] = &unk_26504DF48;
    objc_copyWeak(&v9, &location);
    dispatch_source_set_event_handler(v7, v8);
    dispatch_resume((dispatch_object_t)self->_autoScrollTimer);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)_stopAutoScrollTimer
{
  autoScrollTimer = self->_autoScrollTimer;
  if (autoScrollTimer)
  {
    uint64_t v7 = 0;
    id v8 = &v7;
    uint64_t v9 = 0x3032000000;
    double v10 = __Block_byref_object_copy_;
    id v11 = __Block_byref_object_dispose_;
    uint64_t v12 = autoScrollTimer;
    BOOL v4 = self->_autoScrollTimer;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __39___TVCarouselView__stopAutoScrollTimer__block_invoke;
    handler[3] = &unk_26504DF70;
    handler[4] = &v7;
    dispatch_source_set_cancel_handler(v4, handler);
    dispatch_source_cancel((dispatch_source_t)v8[5]);
    uint64_t v5 = self->_autoScrollTimer;
    self->_autoScrollTimer = 0;

    _Block_object_dispose(&v7, 8);
  }
}

- (void)_updateIdleModeLayoutAttributes
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if ([(_TVCarouselView *)self shouldScaleOnIdleFocus])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    BOOL v3 = [(_TVCarouselCollectionView *)self->_collectionView visibleCells];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v19;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v19 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v18 + 1) + 8 * v7++) _setIdleModeLayoutAttributes:0];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v5);
    }

    id v8 = [MEMORY[0x263F1C920] mainScreen];
    uint64_t v9 = [v8 focusedView];

    if ([v9 isDescendantOfView:self])
    {
      double v10 = [(_TVCarouselCollectionView *)self->_collectionView visibleCells];
      int v11 = [v10 containsObject:v9];

      if (v11)
      {
        [v9 bounds];
        if (v12 >= v13) {
          double v14 = v12;
        }
        else {
          double v14 = v13;
        }
        memset(&v17, 0, sizeof(v17));
        CGAffineTransformMakeScale(&v17, (v14 + 20.0) / v14, (v14 + 20.0) / v14);
        CGRect v15 = objc_opt_new();
        CGAffineTransform v16 = v17;
        [v15 setTransform:&v16];
        [v9 _setIdleModeLayoutAttributes:v15];
      }
    }
  }
}

- (unint64_t)_previousItemIndexForIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  previousCollectionToDatasourceIndexMap = self->_previousCollectionToDatasourceIndexMap;
  if (previousCollectionToDatasourceIndexMap
    && (objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "item")),
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        [(NSDictionary *)previousCollectionToDatasourceIndexMap objectForKeyedSubscript:v7],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    uint64_t v9 = self->_previousCollectionToDatasourceIndexMap;
    double v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "item"));
    int v11 = [(NSDictionary *)v9 objectForKeyedSubscript:v10];
    unint64_t v12 = [v11 unsignedIntegerValue];
  }
  else
  {
    unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v12;
}

- (unint64_t)_itemIndexForIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_TVCarouselView *)self collectionToDatasourceIndexMap];
  uint64_t v6 = NSNumber;
  uint64_t v7 = [v4 item];

  id v8 = [v6 numberWithInteger:v7];
  uint64_t v9 = [v5 objectForKeyedSubscript:v8];
  unint64_t v10 = [v9 unsignedIntegerValue];

  return v10;
}

- (CGSize)_collectionViewLayoutItemSize
{
  double width = self->_itemSize.width;
  double height = self->_itemSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)_centeringAnimationDuration
{
  return 0.8;
}

- (void)_updatePageControl
{
  BOOL v3 = [(_TVCarouselView *)self pageControl];

  if (v3)
  {
    id v4 = [(_TVCarouselView *)self dataSource];
    uint64_t v5 = [v4 numberOfItemsInCarouselView:self];

    uint64_t v6 = [(_TVCarouselView *)self pageControl];
    [v6 setNumberOfPages:v5];

    uint64_t v7 = [(_TVCarouselView *)self pageControl];
    [v7 sizeForNumberOfPages:v5];
    double v9 = v8;
    double v11 = v10;

    [(_TVCarouselView *)self frame];
    double v13 = (v12 - v9) * 0.5;
    [(_TVCarouselView *)self pageControlMargin];
    double v15 = v14;
    [(_TVCarouselView *)self frame];
    double v17 = v16 - v11 - v15;
    long long v18 = [(_TVCarouselView *)self pageControl];
    objc_msgSend(v18, "setFrame:", v13, v17, v9, v11);

    long long v19 = [(_TVCarouselView *)self collectionToDatasourceIndexMap];
    long long v20 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSIndexPath item](self->_focusedIndexPath, "item"));
    long long v21 = [v19 objectForKeyedSubscript:v20];
    uint64_t v22 = [v21 integerValue];

    id v23 = [(_TVCarouselView *)self pageControl];
    [v23 setCurrentPage:v22];
  }
}

- (TVCarouselViewDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (TVCarouselViewDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (TVCarouselViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TVCarouselViewDelegate *)WeakRetained;
}

- (CGSize)itemSize
{
  double width = self->_itemSize.width;
  double height = self->_itemSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (unint64_t)scrollMode
{
  return self->_scrollMode;
}

- (double)autoscrollInterval
{
  return self->_autoscrollInterval;
}

- (double)unitScrollDuration
{
  return self->_unitScrollDuration;
}

- (CGPoint)focusDirection
{
  double x = self->_focusDirection.x;
  double y = self->_focusDirection.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setFocusDirection:(CGPoint)a3
{
  self->_focusDirection = a3;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (double)showcaseFactor
{
  return self->_showcaseFactor;
}

- (void)setShowcaseFactor:(double)a3
{
  self->_showcaseFactor = a3;
}

- (BOOL)shouldScaleOnIdleFocus
{
  return self->_shouldScaleOnIdleFocus;
}

- (void)setShouldScaleOnIdleFocus:(BOOL)a3
{
  self->_shouldScaleOnIdleFocus = a3;
}

- (BOOL)showsPageControl
{
  return self->_showsPageControl;
}

- (double)pageControlMargin
{
  return self->_pageControlMargin;
}

- (void)setPageControlMargin:(double)a3
{
  self->_pageControlMargin = a3;
}

- (NSDictionary)collectionToDatasourceIndexMap
{
  return self->_collectionToDatasourceIndexMap;
}

- (void)setCollectionToDatasourceIndexMap:(id)a3
{
}

- (UIFocusGuide)focusGuide
{
  return self->_focusGuide;
}

- (void)setFocusGuide:(id)a3
{
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
}

- (double)previousDisplayLinkTimestamp
{
  return self->_previousDisplayLinkTimestamp;
}

- (void)setPreviousDisplayLinkTimestamp:(double)a3
{
  self->_previousDisplayLinkTimestamp = a3;
}

- (CGPoint)targetContentOffset
{
  double x = self->_targetContentOffset.x;
  double y = self->_targetContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTargetContentOffset:(CGPoint)a3
{
  self->_targetContentOffset = a3;
}

- (double)offsetChangePerSecond
{
  return self->_offsetChangePerSecond;
}

- (void)setOffsetChangePerSecond:(double)a3
{
  self->_offsetChangePerSecond = a3;
}

- (NSDate)firstFocusChangeInInterval
{
  return self->_firstFocusChangeInInterval;
}

- (void)setFirstFocusChangeInInterval:(id)a3
{
}

- (UIPageControl)pageControl
{
  return self->_pageControl;
}

- (void)setPageControl:(id)a3
{
}

- (double)focusThrottleTimeInterval
{
  return self->_focusThrottleTimeInterval;
}

- (void)setFocusThrottleTimeInterval:(double)a3
{
  self->_focusThrottleTimeInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_firstFocusChangeInInterval, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_focusGuide, 0);
  objc_storeStrong((id *)&self->_collectionToDatasourceIndexMap, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_previousCollectionToDatasourceIndexMap, 0);
  objc_storeStrong((id *)&self->_focusedIndexPath, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_autoScrollTimer, 0);
}

@end