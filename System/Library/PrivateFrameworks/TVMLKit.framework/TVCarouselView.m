@interface TVCarouselView
- (BOOL)_canScrollCarouselView;
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (CADisplayLink)displayLink;
- (CGPoint)focusDirection;
- (CGPoint)targetContentOffset;
- (CGSize)itemSize;
- (CGSize)sizeThatFits:(CGSize)result;
- (NSArray)visibleCells;
- (NSDate)firstFocusChangeInInterval;
- (NSDictionary)collectionToDatasourceIndexMap;
- (TVCarouselView)initWithFrame:(CGRect)a3;
- (TVCarouselViewDataSource)dataSource;
- (TVCarouselViewDelegate)delegate;
- (double)_contentOffsetXForCollectionViewIndex:(int64_t)a3;
- (double)autoScrollInterval;
- (double)continuousScrollVelocity;
- (double)interitemSpacing;
- (double)offsetChangePerSecond;
- (double)previousDisplayLinkTimestamp;
- (id)_cellForItemAtIndex:(unint64_t)a3;
- (id)_collectionView;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)dequeueReusableCellWithReuseIdentifier:(id)a3 forIndex:(unint64_t)a4;
- (id)focusedCell;
- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3;
- (id)preferredFocusedView;
- (int64_t)_centerCollectionViewCellIndex;
- (int64_t)_numberOfCells;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (unint64_t)indexForCell:(id)a3;
- (unint64_t)scrollMode;
- (void)_adjustCarouselForDirectionShift:(int64_t)a3;
- (void)_handlePlayGesture:(id)a3;
- (void)_prepareIndexMap:(int64_t)a3;
- (void)_setContentOffsetForCollectionViewIndex:(int64_t)a3;
- (void)_startAutoScrollTimer;
- (void)_startContinuousScroll;
- (void)_stopAutoScrollTimer;
- (void)_stopContinuousScroll;
- (void)_updateAutoScrollTimer;
- (void)_updateCarouselWithCenterIndex:(int64_t)a3 indexToRemove:(int64_t)a4 indexToAdd:(int64_t)a5;
- (void)_updateCollectionViewLayout;
- (void)_updateCollectionViewLayoutAnimated:(BOOL)a3;
- (void)_updateContentOffsetForFocusedIndex:(int64_t)a3 animated:(BOOL)a4;
- (void)_updateIdleModeLayoutAttributes;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)displayLinkDidFire:(id)a3;
- (void)layoutSubviews;
- (void)registerClass:(Class)a3 forCellWithReuseIdentifier:(id)a4;
- (void)reloadData;
- (void)scrollViewDidScroll:(id)a3;
- (void)setAutoScrollInterval:(double)a3;
- (void)setCollectionToDatasourceIndexMap:(id)a3;
- (void)setContinuousScrollVelocity:(double)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayLink:(id)a3;
- (void)setFirstFocusChangeInInterval:(id)a3;
- (void)setFocusDirection:(CGPoint)a3;
- (void)setInteritemSpacing:(double)a3;
- (void)setInteritemSpacing:(double)a3 animated:(BOOL)a4;
- (void)setItemSize:(CGSize)a3;
- (void)setOffsetChangePerSecond:(double)a3;
- (void)setPreviousDisplayLinkTimestamp:(double)a3;
- (void)setScrollMode:(unint64_t)a3;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)setTargetContentOffset:(CGPoint)a3;
@end

@implementation TVCarouselView

- (TVCarouselView)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)TVCarouselView;
  v3 = -[TVCarouselView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [_TVCarouselCollectionView alloc];
    [(TVCarouselView *)v3 bounds];
    CGRect v23 = CGRectInset(v22, 0.0, 0.0);
    double x = v23.origin.x;
    double y = v23.origin.y;
    double width = v23.size.width;
    double height = v23.size.height;
    v9 = objc_alloc_init(_TVCarouselCollectionViewLayout);
    uint64_t v10 = -[_TVCarouselCollectionView initWithFrame:collectionViewLayout:](v4, "initWithFrame:collectionViewLayout:", v9, x, y, width, height);
    collectionView = v3->_collectionView;
    v3->_collectionView = (_TVCarouselCollectionView *)v10;

    [(_TVCarouselCollectionView *)v3->_collectionView setAutoresizingMask:18];
    [(_TVCarouselCollectionView *)v3->_collectionView setDataSource:v3];
    [(_TVCarouselCollectionView *)v3->_collectionView setDelegate:v3];
    [(_TVCarouselCollectionView *)v3->_collectionView setOpaque:0];
    [(_TVCarouselCollectionView *)v3->_collectionView setBackgroundColor:0];
    [(_TVCarouselCollectionView *)v3->_collectionView setClipsToBounds:0];
    v3->_itemSize = (CGSize)vdupq_n_s64(0x4049000000000000uLL);
    [(TVCarouselView *)v3 addSubview:v3->_collectionView];
    uint64_t v12 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:0];
    collectionToDatasourceIndexMap = v3->_collectionToDatasourceIndexMap;
    v3->_collectionToDatasourceIndexMap = (NSDictionary *)v12;

    v14 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:v3 action:sel__handlePlayGesture_];
    [v14 setAllowedPressTypes:&unk_26E59EBC0];
    [(TVCarouselView *)v3 addGestureRecognizer:v14];
    v15 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v16 = *MEMORY[0x263F1D050];
    v17 = [MEMORY[0x263F1C408] sharedApplication];
    [v15 addObserver:v3 selector:sel__applicationDidEnterBackgroundNotification_ name:v16 object:v17];

    uint64_t v18 = *MEMORY[0x263F1D0D0];
    v19 = [MEMORY[0x263F1C408] sharedApplication];
    [v15 addObserver:v3 selector:sel__applicationWillEnterForegroundNotification_ name:v18 object:v19];

    v3->_numFocusChangesInInterval = 0;
  }
  return v3;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)TVCarouselView;
  [(TVCarouselView *)&v9 layoutSubviews];
  v3 = [(_TVCarouselCollectionView *)self->_collectionView collectionViewLayout];
  [v3 itemSize];
  double v5 = v4;
  [v3 minimumInteritemSpacing];
  double v7 = v5 + v6;
  v8 = [(TVCarouselView *)self _collectionView];
  objc_msgSend(v8, "_setVisibleRectEdgeInsets:", 0.0, v7 * -10.0, 0.0, v7 * -10.0);
}

- (void)_startContinuousScroll
{
  if (!self->_displayLink)
  {
    int64_t v3 = [(TVCarouselView *)self _centerCollectionViewCellIndex];
    [(TVCarouselView *)self _setContentOffsetForCollectionViewIndex:v3];
    double v4 = [(TVCarouselView *)self _collectionView];
    [v4 contentOffset];
    double v6 = v5;
    double v8 = v7;

    [(TVCarouselView *)self _contentOffsetXForCollectionViewIndex:v3 + 1];
    double v10 = v9;
    [(TVCarouselView *)self setOffsetChangePerSecond:(v9 - v6) / self->_continuousScrollVelocity];
    -[TVCarouselView setTargetContentOffset:](self, "setTargetContentOffset:", v10, v8);
    [(TVCarouselView *)self setPreviousDisplayLinkTimestamp:0.0];
    [(TVCarouselView *)self _stopContinuousScroll];
    id v12 = [MEMORY[0x263F15780] displayLinkWithTarget:self selector:sel_displayLinkDidFire_];
    v11 = [MEMORY[0x263EFF9F0] currentRunLoop];
    [v12 addToRunLoop:v11 forMode:*MEMORY[0x263EFF588]];

    [(TVCarouselView *)self setDisplayLink:v12];
  }
}

- (void)displayLinkDidFire:(id)a3
{
  double v4 = [(TVCarouselView *)self displayLink];
  [v4 timestamp];
  double v6 = v5;

  [(TVCarouselView *)self previousDisplayLinkTimestamp];
  if (v7 == 0.0)
  {
    double v9 = 0.0;
  }
  else
  {
    [(TVCarouselView *)self previousDisplayLinkTimestamp];
    double v9 = v6 - v8;
  }
  [(TVCarouselView *)self setPreviousDisplayLinkTimestamp:v6];
  if ([(TVCarouselView *)self _canScrollCarouselView])
  {
    double v10 = [(TVCarouselView *)self _collectionView];
    [v10 contentOffset];
    double v12 = v11;
    double v14 = v13;

    [(TVCarouselView *)self offsetChangePerSecond];
    double v16 = v12 + v15 * v9;
    v17 = [(TVCarouselView *)self _collectionView];
    objc_msgSend(v17, "setContentOffset:animated:", 0, v16, v14);

    uint64_t v18 = [(TVCarouselView *)self displayLink];
    [v18 targetTimestamp];
    double v20 = v19 - v6;
    [(TVCarouselView *)self offsetChangePerSecond];
    double v22 = v20 * v21;

    CGRect v23 = [(TVCarouselView *)self _collectionView];
    [v23 contentOffset];
    double v25 = v22 + v24;
    [(TVCarouselView *)self targetContentOffset];
    double v27 = v26;

    if (v25 >= v27)
    {
      [(TVCarouselView *)self _adjustCarouselForDirectionShift:0];
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
  int64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TVCarouselView;
  [(TVCarouselView *)&v4 dealloc];
}

- (NSDictionary)collectionToDatasourceIndexMap
{
  if (![(NSDictionary *)self->_collectionToDatasourceIndexMap count]) {
    [(TVCarouselView *)self _prepareIndexMap:0];
  }
  collectionToDatasourceIndexMap = self->_collectionToDatasourceIndexMap;
  return collectionToDatasourceIndexMap;
}

- (id)_collectionView
{
  return self->_collectionView;
}

- (void)didMoveToSuperview
{
  v4.receiver = self;
  v4.super_class = (Class)TVCarouselView;
  [(TVCarouselView *)&v4 didMoveToSuperview];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__TVCarouselView_didMoveToSuperview__block_invoke;
  block[3] = &unk_264BA69A0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __36__TVCarouselView_didMoveToSuperview__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAutoScrollTimer];
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)TVCarouselView;
  [(TVCarouselView *)&v4 didMoveToWindow];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__TVCarouselView_didMoveToWindow__block_invoke;
  block[3] = &unk_264BA69A0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __33__TVCarouselView_didMoveToWindow__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAutoScrollTimer];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TVCarouselView;
  [(TVCarouselView *)&v5 didUpdateFocusInContext:a3 withAnimationCoordinator:a4];
  [(TVCarouselView *)self _updateAutoScrollTimer];
  [(TVCarouselView *)self _updateIdleModeLayoutAttributes];
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
  v5.super_class = (Class)TVCarouselView;
  -[TVCarouselView setSemanticContentAttribute:](&v5, sel_setSemanticContentAttribute_);
  [(_TVCarouselCollectionView *)self->_collectionView setSemanticContentAttribute:a3];
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  int64_t v3 = [(TVCarouselView *)self _centerCollectionViewCellIndex];
  objc_super v4 = (void *)MEMORY[0x263F088C8];
  return (id)[v4 indexPathForItem:v3 inSection:0];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  self->_numberOfRealItemsForDataSource = [WeakRetained numberOfItemsInCarouselView:self];

  int64_t result = self->_numberOfRealItemsForDataSource;
  if ((unint64_t)result >= 2)
  {
    double v7 = [(TVCarouselView *)self collectionToDatasourceIndexMap];
    int64_t v8 = [v7 count];

    return v8;
  }
  return result;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  self->_indexToDeque = objc_msgSend(a4, "item", a3);
  objc_super v5 = [(TVCarouselView *)self collectionToDatasourceIndexMap];
  double v6 = [NSNumber numberWithUnsignedInteger:self->_indexToDeque];
  double v7 = [v5 objectForKey:v6];
  uint64_t v8 = [v7 unsignedIntegerValue];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  double v10 = [WeakRetained carouselView:self cellForItemAtIndex:v8];

  objc_msgSend(v10, "_setFocusableContentMargins:", 140.0, 0.0, 0.0, 0.0);
  self->_indexToDeque = 0x7FFFFFFFFFFFFFFFLL;
  return v10;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  if (!self->_focusedIndexPath) {
    -[TVCarouselView _updateContentOffsetForFocusedIndex:animated:](self, "_updateContentOffsetForFocusedIndex:animated:", 0x7FFFFFFFFFFFFFFFLL, 0, a5);
  }
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  if (self->_scrollMode == 1) {
    return 0;
  }
  if (!self->_firstFocusChangeInInterval) {
    return 1;
  }
  double v6 = objc_msgSend(MEMORY[0x263EFF910], "date", a3, a4);
  [v6 timeIntervalSinceDate:self->_firstFocusChangeInInterval];
  if (v7 < 0.15)
  {
    BOOL v4 = self->_numFocusChangesInInterval < 1;
  }
  else
  {
    self->_numFocusChangesInInterval = 0;
    BOOL v4 = 1;
  }

  return v4;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v12 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    double v7 = [(TVCarouselView *)self collectionToDatasourceIndexMap];
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "item"));
    double v9 = [v7 objectForKeyedSubscript:v8];
    uint64_t v10 = [v9 unsignedIntegerValue];

    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
    [v11 carouselView:self didSelectItemAtIndex:v10];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v15 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 carouselViewDidScroll:self];
  }
  if (self->_focusedIndexPath)
  {
    int64_t v7 = [(TVCarouselView *)self _centerCollectionViewCellIndex];
    [(TVCarouselView *)self _contentOffsetXForCollectionViewIndex:v7 + 1];
    double v9 = v8;
    [(TVCarouselView *)self _contentOffsetXForCollectionViewIndex:v7 - 1];
    double v11 = v10;
    [v15 contentOffset];
    if (v12 <= v11)
    {
      uint64_t v14 = 1;
    }
    else
    {
      [v15 contentOffset];
      if (v13 < v9) {
        goto LABEL_9;
      }
      uint64_t v14 = 0;
    }
    [(TVCarouselView *)self _adjustCarouselForDirectionShift:v14];
  }
LABEL_9:
}

- (void)_handlePlayGesture:(id)a3
{
  if ([a3 state] == 3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [MEMORY[0x263F1C920] mainScreen];
      id v11 = [v6 focusedView];

      if (v11)
      {
        int64_t v7 = [(TVCarouselView *)self visibleCells];
        int v8 = [v7 containsObject:v11];

        if (v8)
        {
          unint64_t v9 = [(TVCarouselView *)self indexForCell:v11];
          id v10 = objc_loadWeakRetained((id *)&self->_delegate);
          [v10 carouselView:self didPlayItemAtIndex:v9];
        }
      }
    }
  }
}

- (id)_cellForItemAtIndex:(unint64_t)a3
{
  collectionView = self->_collectionView;
  BOOL v4 = [MEMORY[0x263F088C8] indexPathForItem:a3 inSection:0];
  char v5 = [(_TVCarouselCollectionView *)collectionView cellForItemAtIndexPath:v4];

  return v5;
}

- (id)dequeueReusableCellWithReuseIdentifier:(id)a3 forIndex:(unint64_t)a4
{
  id v5 = a3;
  unint64_t indexToDeque = self->_indexToDeque;
  if (indexToDeque == 0x7FFFFFFFFFFFFFFFLL)
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"-dequeueReusableCellWithReuseIdentifier:forIndex: may only be called from -carouselView:cellForItemAtIndex:"];
    int64_t v7 = 0;
  }
  else
  {
    collectionView = self->_collectionView;
    unint64_t v9 = [MEMORY[0x263F088C8] indexPathForItem:indexToDeque inSection:0];
    int64_t v7 = [(_TVCarouselCollectionView *)collectionView dequeueReusableCellWithReuseIdentifier:v5 forIndexPath:v9];
  }
  return v7;
}

- (id)focusedCell
{
  focusedIndexPath = self->_focusedIndexPath;
  if (focusedIndexPath)
  {
    focusedIndexPath = -[TVCarouselView _cellForItemAtIndex:](self, "_cellForItemAtIndex:", [focusedIndexPath item]);
  }
  return focusedIndexPath;
}

- (unint64_t)indexForCell:(id)a3
{
  BOOL v4 = [(_TVCarouselCollectionView *)self->_collectionView indexPathForCell:a3];
  if (v4)
  {
    id v5 = [(TVCarouselView *)self collectionToDatasourceIndexMap];
    id v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "item"));
    int64_t v7 = [v5 objectForKeyedSubscript:v6];
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

- (void)reloadData
{
  collectionToDatasourceIndexMap = self->_collectionToDatasourceIndexMap;
  self->_collectionToDatasourceIndexMap = 0;

  [(_TVCarouselCollectionView *)self->_collectionView reloadData];
  [(TVCarouselView *)self _updateAutoScrollTimer];
}

- (void)setInteritemSpacing:(double)a3
{
}

- (void)setInteritemSpacing:(double)a3 animated:(BOOL)a4
{
  if (vabdd_f64(self->_interitemSpacing, a3) > 0.00000011920929)
  {
    self->_interitemSpacing = a3;
    [(TVCarouselView *)self _updateCollectionViewLayoutAnimated:a4];
  }
}

- (void)setItemSize:(CGSize)a3
{
  if (self->_itemSize.width != a3.width || self->_itemSize.height != a3.height)
  {
    self->_itemSize = a3;
    [(TVCarouselView *)self _updateCollectionViewLayout];
  }
}

- (void)setAutoScrollInterval:(double)a3
{
  if (vabdd_f64(self->_autoScrollInterval, a3) > 2.22044605e-16)
  {
    if (a3 < 0.5 && a3 > 2.22044605e-16) {
      a3 = 0.5;
    }
    self->_autoScrollInterval = a3;
    [(TVCarouselView *)self _updateAutoScrollTimer];
  }
}

- (void)setContinuousScrollVelocity:(double)a3
{
  if (vabdd_f64(self->_continuousScrollVelocity, a3) > 2.22044605e-16)
  {
    if (a3 < 0.5 && a3 > 2.22044605e-16) {
      a3 = 0.5;
    }
    self->_continuousScrollVelocitdouble y = a3;
    [(TVCarouselView *)self _updateAutoScrollTimer];
  }
}

- (NSArray)visibleCells
{
  return (NSArray *)[(_TVCarouselCollectionView *)self->_collectionView visibleCells];
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
  uint64_t v2 = [(_TVCarouselCollectionView *)self->_collectionView collectionViewLayout];
  int64_t v3 = [v2 _expectedNumberOfCells];

  return v3;
}

- (void)_adjustCarouselForDirectionShift:(int64_t)a3
{
  if ([(TVCarouselView *)self _canScrollCarouselView])
  {
    int64_t v5 = [(TVCarouselView *)self _centerCollectionViewCellIndex];
    int64_t v6 = v5;
    if (a3 == 1) {
      int64_t v7 = v5 - 1;
    }
    else {
      int64_t v7 = v5 + 1;
    }
    unint64_t v8 = [(TVCarouselView *)self collectionToDatasourceIndexMap];
    unint64_t v9 = [NSNumber numberWithInteger:v7];
    id v10 = [v8 objectForKeyedSubscript:v9];
    uint64_t v11 = [v10 integerValue];

    double v12 = [(TVCarouselView *)self collectionToDatasourceIndexMap];
    uint64_t v13 = [v12 count];
    BOOL v14 = a3 == 1;
    if (a3 == 1) {
      uint64_t v15 = 0;
    }
    else {
      uint64_t v15 = v13 - 1;
    }
    if (v14) {
      uint64_t v16 = v13 - 1;
    }
    else {
      uint64_t v16 = 0;
    }

    [(TVCarouselView *)self _updateCarouselWithCenterIndex:v11 indexToRemove:v16 indexToAdd:v15];
    [(TVCarouselView *)self _setContentOffsetForCollectionViewIndex:v6];
  }
}

- (void)_setContentOffsetForCollectionViewIndex:(int64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __58__TVCarouselView__setContentOffsetForCollectionViewIndex___block_invoke;
  v3[3] = &unk_264BA6A60;
  v3[4] = self;
  v3[5] = a3;
  [MEMORY[0x263F1CB60] performWithoutAnimation:v3];
}

void __58__TVCarouselView__setContentOffsetForCollectionViewIndex___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _collectionView];
  [v2 contentOffset];
  double v4 = v3;

  [*(id *)(a1 + 32) _contentOffsetXForCollectionViewIndex:*(void *)(a1 + 40)];
  double v6 = v5;
  id v7 = [*(id *)(a1 + 32) _collectionView];
  objc_msgSend(v7, "setContentOffset:animated:", 0, v6, v4);
}

- (void)_updateCarouselWithCenterIndex:(int64_t)a3 indexToRemove:(int64_t)a4 indexToAdd:(int64_t)a5
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __74__TVCarouselView__updateCarouselWithCenterIndex_indexToRemove_indexToAdd___block_invoke;
  v5[3] = &unk_264BA7320;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  v5[7] = a5;
  [MEMORY[0x263F1CB60] performWithoutAnimation:v5];
}

void __74__TVCarouselView__updateCarouselWithCenterIndex_indexToRemove_indexToAdd___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _collectionView];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __74__TVCarouselView__updateCarouselWithCenterIndex_indexToRemove_indexToAdd___block_invoke_2;
  v3[3] = &unk_264BA7320;
  v3[4] = *(void *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 56);
  [v2 performBatchUpdates:v3 completion:0];
}

void __74__TVCarouselView__updateCarouselWithCenterIndex_indexToRemove_indexToAdd___block_invoke_2(uint64_t a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) _prepareIndexMap:*(void *)(a1 + 40)];
  uint64_t v2 = [*(id *)(a1 + 32) _collectionView];
  double v3 = [MEMORY[0x263F088C8] indexPathForItem:*(void *)(a1 + 48) inSection:0];
  v9[0] = v3;
  long long v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  [v2 deleteItemsAtIndexPaths:v4];

  uint64_t v5 = [*(id *)(a1 + 32) _collectionView];
  double v6 = [MEMORY[0x263F088C8] indexPathForItem:*(void *)(a1 + 56) inSection:0];
  unint64_t v8 = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v8 count:1];
  [v5 insertItemsAtIndexPaths:v7];
}

- (void)_prepareIndexMap:(int64_t)a3
{
  uint64_t v5 = [(TVCarouselView *)self _numberOfCells];
  uint64_t v6 = v5;
  if (v5 >= 0) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = v5 + 1;
  }
  uint64_t v8 = v7 >> 1;
  unint64_t numberOfRealItemsForDataSource = self->_numberOfRealItemsForDataSource;
  id v22 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:v5];
  id v10 = [NSNumber numberWithInteger:a3];
  uint64_t v11 = [NSNumber numberWithInteger:v8];
  [v22 setObject:v10 forKey:v11];

  if (v6 >= 2)
  {
    uint64_t v12 = v8 - 1;
    uint64_t v13 = v8 + 1;
    int64_t v14 = a3;
    do
    {
      if (v14 + 1 == numberOfRealItemsForDataSource) {
        int64_t v14 = 0;
      }
      else {
        ++v14;
      }
      if (a3 >= 1) {
        int64_t v15 = a3;
      }
      else {
        int64_t v15 = numberOfRealItemsForDataSource;
      }
      a3 = v15 - 1;
      uint64_t v16 = [NSNumber numberWithInteger:v14];
      v17 = [NSNumber numberWithInteger:v13];
      [v22 setObject:v16 forKey:v17];

      uint64_t v18 = [NSNumber numberWithInteger:a3];
      double v19 = [NSNumber numberWithInteger:v12];
      [v22 setObject:v18 forKey:v19];

      --v12;
      ++v13;
    }
    while (v12 != -1);
  }
  double v20 = (NSDictionary *)[v22 copy];
  collectionToDatasourceIndexMap = self->_collectionToDatasourceIndexMap;
  self->_collectionToDatasourceIndexMap = v20;
}

- (double)_contentOffsetXForCollectionViewIndex:(int64_t)a3
{
  uint64_t v5 = [(_TVCarouselCollectionView *)self->_collectionView collectionViewLayout];
  [v5 itemSize];
  double v7 = v6;
  [v5 minimumInteritemSpacing];
  double v9 = v8;
  [(TVCarouselView *)self bounds];
  if (CGRectGetWidth(v13) > 0.0)
  {
    [(TVCarouselView *)self bounds];
    double Width = CGRectGetWidth(v15);
  }
  else
  {
    id v10 = [MEMORY[0x263F1C920] mainScreen];
    [v10 bounds];
    double Width = CGRectGetWidth(v14);
  }
  return floor(floor(v7 * 0.5 + (double)a3 * (v7 + v9)) - Width * 0.5);
}

- (void)_updateCollectionViewLayout
{
}

- (void)_updateCollectionViewLayoutAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v6 = objc_alloc_init(_TVCarouselCollectionViewLayout);
  -[UICollectionViewFlowLayout setItemSize:](v6, "setItemSize:", self->_itemSize.width, self->_itemSize.height);
  [(UICollectionViewFlowLayout *)v6 setMinimumInteritemSpacing:self->_interitemSpacing];
  [(UICollectionViewFlowLayout *)v6 setScrollDirection:1];
  [(UICollectionViewFlowLayout *)v6 setSectionInsetReference:0];
  [(_TVCarouselCollectionView *)self->_collectionView setCollectionViewLayout:v6 animated:v3];
  focusedIndexPath = self->_focusedIndexPath;
  if (focusedIndexPath) {
    [(TVCarouselView *)self _updateContentOffsetForFocusedIndex:[(NSIndexPath *)focusedIndexPath item] animated:0];
  }
}

- (void)_updateContentOffsetForFocusedIndex:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(TVCarouselView *)self _canScrollCarouselView])
  {
    double v7 = [MEMORY[0x263F088C8] indexPathForItem:a3 inSection:0];
    focusedIndexPath = self->_focusedIndexPath;
    self->_focusedIndexPath = v7;

    uint64_t v9 = [(_TVCarouselCollectionView *)self->_collectionView numberOfItemsInSection:0];
    if (!self->_scrollMode)
    {
      if (v9 >= 0) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = v9 + 1;
      }
      uint64_t v11 = v10 >> 1;
      if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
        int64_t v12 = v11;
      }
      else {
        int64_t v12 = a3;
      }
      double v13 = 0.8;
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __63__TVCarouselView__updateContentOffsetForFocusedIndex_animated___block_invoke;
      v15[3] = &unk_264BA6A60;
      v15[4] = self;
      v15[5] = v12;
      v14[1] = 3221225472;
      v14[0] = MEMORY[0x263EF8330];
      v14[2] = __63__TVCarouselView__updateContentOffsetForFocusedIndex_animated___block_invoke_2;
      v14[3] = &unk_264BA7F58;
      if (!v4) {
        double v13 = 0.0;
      }
      v14[4] = self;
      v14[5] = v11;
      objc_msgSend(MEMORY[0x263F1CB60], "animateWithDuration:delay:options:animations:completion:", 327686, v15, v14, v13);
    }
  }
}

void __63__TVCarouselView__updateContentOffsetForFocusedIndex_animated___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _collectionView];
  uint64_t v2 = [MEMORY[0x263F088C8] indexPathForItem:*(void *)(a1 + 40) inSection:0];
  [v3 scrollToItemAtIndexPath:v2 atScrollPosition:16 animated:0];
}

uint64_t __63__TVCarouselView__updateContentOffsetForFocusedIndex_animated___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F088C8] indexPathForItem:*(void *)(a1 + 40) inSection:0];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 432);
  *(void *)(v3 + 432) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (BOOL)_canScrollCarouselView
{
  uint64_t v3 = [(TVCarouselView *)self window];
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
  if (![(TVCarouselView *)self _canScrollCarouselView]) {
    goto LABEL_5;
  }
  if (!self->_focusedIndexPath) {
    [(TVCarouselView *)self _updateContentOffsetForFocusedIndex:0x7FFFFFFFFFFFFFFFLL animated:0];
  }
  uint64_t v3 = [MEMORY[0x263F1C920] mainScreen];
  BOOL v4 = [v3 focusedView];
  char v5 = [v4 isDescendantOfView:self];

  if ((v5 & 1) == 0)
  {
    unint64_t scrollMode = self->_scrollMode;
    if (scrollMode == 1)
    {
      [(TVCarouselView *)self _startContinuousScroll];
    }
    else if (!scrollMode && fabs(self->_autoScrollInterval) > 2.22044605e-16)
    {
      [(TVCarouselView *)self _startAutoScrollTimer];
    }
  }
  else
  {
LABEL_5:
    [(TVCarouselView *)self _stopAutoScrollTimer];
    [(TVCarouselView *)self _stopContinuousScroll];
  }
}

- (void)_startAutoScrollTimer
{
  [(TVCarouselView *)self _stopAutoScrollTimer];
  if (self->_autoScrollInterval > 0.0)
  {
    objc_initWeak(&location, self);
    uint64_t v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
    autoScrollTimer = self->_autoScrollTimer;
    self->_autoScrollTimer = v3;

    char v5 = self->_autoScrollTimer;
    dispatch_time_t v6 = dispatch_time(0, (uint64_t)(self->_autoScrollInterval * 1000000000.0));
    dispatch_source_set_timer(v5, v6, (unint64_t)(self->_autoScrollInterval * 1000000000.0), 0x1DCD6500uLL);
    double v7 = self->_autoScrollTimer;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __39__TVCarouselView__startAutoScrollTimer__block_invoke;
    handler[3] = &unk_264BA6918;
    objc_copyWeak(&v9, &location);
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_resume((dispatch_object_t)self->_autoScrollTimer);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __39__TVCarouselView__startAutoScrollTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    uint64_t v3 = [MEMORY[0x263EFF9F0] currentRunLoop];
    BOOL v4 = [v3 currentMode];
    char v5 = [v4 isEqualToString:*MEMORY[0x263F1D798]];

    id WeakRetained = v6;
    if ((v5 & 1) == 0)
    {
      objc_msgSend(v6, "_updateContentOffsetForFocusedIndex:animated:", objc_msgSend(*(id *)(a1 + 32), "_centerCollectionViewCellIndex") + 1, 1);
      id WeakRetained = v6;
    }
  }
}

- (void)_stopAutoScrollTimer
{
  autoScrollTimer = self->_autoScrollTimer;
  if (autoScrollTimer)
  {
    dispatch_source_cancel(autoScrollTimer);
    BOOL v4 = self->_autoScrollTimer;
    self->_autoScrollTimer = 0;
  }
}

- (void)_updateIdleModeLayoutAttributes
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v3 = [(_TVCarouselCollectionView *)self->_collectionView visibleCells];
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

  double v8 = [MEMORY[0x263F1C920] mainScreen];
  id v9 = [v8 focusedView];

  if ([v9 isDescendantOfView:self])
  {
    uint64_t v10 = [(_TVCarouselCollectionView *)self->_collectionView visibleCells];
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

- (void)setDelegate:(id)a3
{
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

- (void)setScrollMode:(unint64_t)a3
{
  self->_unint64_t scrollMode = a3;
}

- (double)autoScrollInterval
{
  return self->_autoScrollInterval;
}

- (double)continuousScrollVelocity
{
  return self->_continuousScrollVelocity;
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

- (void)setCollectionToDatasourceIndexMap:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstFocusChangeInInterval, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_collectionToDatasourceIndexMap, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_focusedIndexPath, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_autoScrollTimer, 0);
}

@end