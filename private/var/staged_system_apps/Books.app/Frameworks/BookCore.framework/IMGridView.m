@interface IMGridView
- (BKLibraryDragAndDropDelegate)dragAndDropDelegate;
- (BOOL)canDeleteCellAtIndex:(int64_t)a3;
- (BOOL)dragInteraction:(id)a3 sessionAllowsMoveOperation:(id)a4;
- (BOOL)dragInteraction:(id)a3 sessionIsRestrictedToDraggingApplication:(id)a4;
- (BOOL)draggingInsideApp;
- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4;
- (BOOL)hideFooterView;
- (BOOL)hidingCells;
- (BOOL)isEditing;
- (BOOL)isRotating;
- (BOOL)jiggleWhenEditing;
- (BOOL)tapAndHoldToReorder;
- (BOOL)tapToSelectMode;
- (CGPoint)originForCellAtX:(int64_t)a3 Y:(int64_t)a4;
- (CGRect)rectForCellAtIndex:(int64_t)a3;
- (CGSize)cellSize;
- (CGSize)cellSpacing;
- (CGSize)minimumGridSpacing;
- (IMGridView)init;
- (IMGridView)initWithCoder:(id)a3;
- (IMGridView)initWithFrame:(CGRect)a3;
- (IMGridViewCell)grabbedCell;
- (IMGridViewDataSource)dataSource;
- (IMGridViewDelegate)delegate;
- (NSMutableSet)draggedCellIDs;
- (NSString)grabbedCellUniqueID;
- (UIEdgeInsets)gridInset;
- (UIEdgeInsets)visibleRegionInsets;
- (UIView)footerView;
- (UIView)gridViewHeader;
- (UIView)pendingCancelView;
- (UIView)pendingDropView;
- (_NSRange)rangeOfVisibleCells;
- (double)grabTimerDelayEditing;
- (double)grabTimerDelayNotEditing;
- (float)_autoscrollDistanceForProximityToEdge:(float)a3;
- (id)_arrayForUpdateAction:(int)a3;
- (id)_cellWithUniqueIdentifier:(id)a3;
- (id)_dragInteraction:(id)a3 itemsForSession:(id)a4 atPoint:(CGPoint)a5;
- (id)_dropOperationForInteraction:(id)a3 session:(id)a4;
- (id)_installNewCellAtIndex:(int64_t)a3;
- (id)_reuseArrayForCell:(id)a3;
- (id)_reuseArrayForIdentifier:(id)a3;
- (id)cellAtPoint:(CGPoint)a3;
- (id)cellAtPoint:(CGPoint)a3 ensureSelectionRect:(BOOL)a4;
- (id)cellForIndex:(int64_t)a3;
- (id)dequeueReusableCell;
- (id)dequeueReusableCellWithIdentifier:(id)a3;
- (id)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (id)dragInteraction:(id)a3 sessionForAddingItems:(id)a4 withTouchAtPoint:(CGPoint)a5;
- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5;
- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4;
- (id)rotationCellContainersForSize:(CGSize)a3;
- (id)visibleCellForIndex:(int64_t)a3;
- (id)visibleCells;
- (int64_t)_calculateNumberOfColumns;
- (int64_t)_dataSourceIndexFromReorderedIndex:(int64_t)a3;
- (int64_t)cellColumnsForSize:(CGSize)a3;
- (int64_t)indexForCell:(id)a3;
- (int64_t)indexForX:(int64_t)a3 Y:(int64_t)a4;
- (int64_t)layoutDirection;
- (int64_t)numberOfColumnsForSize:(CGSize)a3;
- (int64_t)numberOfRows;
- (int64_t)numberOfRowsForSize:(CGSize)a3;
- (int64_t)rowRangeStart;
- (unint64_t)numberOfColumns;
- (void)_autoscrollForCell:(id)a3;
- (void)_autoscrollTimerFired:(id)a3;
- (void)_cancelAutoscrollTimer;
- (void)_cancelCellHighlight;
- (void)_endCellAnimations;
- (void)_hideGrabbedCell;
- (void)_highlightSelectedCell;
- (void)_legalizeAutoscrollDistance;
- (void)_refreshCells;
- (void)_restoreGrabbedCell:(id)a3 toOriginalGrabIndex:(int64_t)a4;
- (void)_resumeReloads;
- (void)_setupCellAnimations;
- (void)_setupGridViewCommon;
- (void)_showGrabbedCell;
- (void)_stopReordering:(BOOL)a3;
- (void)_suspendReloads;
- (void)_swapGrabbedCell:(id)a3 withOtherCell:(id)a4;
- (void)_updateGrabbedCellLocation:(CGPoint)a3;
- (void)_updateItemAtIndex:(unint64_t)a3 updateAction:(int)a4;
- (void)animateDeletionOfCell:(id)a3;
- (void)arrangeVisibleCells:(_NSRange)a3;
- (void)beginUpdates;
- (void)cleanupAfterRotation;
- (void)cleanupGrabbedCell;
- (void)dealloc;
- (void)deleteCellAtIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)deleteCellDidAnimate;
- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5;
- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5;
- (void)dragInteraction:(id)a3 session:(id)a4 willAddItems:(id)a5 forInteraction:(id)a6;
- (void)dragInteraction:(id)a3 session:(id)a4 willEndWithOperation:(unint64_t)a5;
- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5;
- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5;
- (void)dropInteraction:(id)a3 performDrop:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4;
- (void)endUpdates;
- (void)hideCells;
- (void)insertCellAtIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)invalidateNumberOfColumns;
- (void)layoutSubviews;
- (void)performRotationWithDuration:(double)a3;
- (void)prepareToRotateWithDestinationSize:(CGSize)a3;
- (void)reloadAllCells;
- (void)reloadCellAtIndex:(unint64_t)a3;
- (void)reloadData;
- (void)reuseCell:(id)a3;
- (void)scrollMakingTopmostRowContainCellAtIndex:(int64_t)a3 animated:(BOOL)a4;
- (void)scrollToCellAtIndex:(int64_t)a3 animated:(BOOL)a4;
- (void)setBounds:(CGRect)a3;
- (void)setCellSize:(CGSize)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDragAndDropDelegate:(id)a3;
- (void)setDraggedCellIDs:(id)a3;
- (void)setDraggingInsideApp:(BOOL)a3;
- (void)setEditing:(BOOL)a3;
- (void)setFooterView:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setGrabTimerDelayEditing:(double)a3;
- (void)setGrabTimerDelayNotEditing:(double)a3;
- (void)setGrabbedCell:(id)a3;
- (void)setGrabbedCellUniqueID:(id)a3;
- (void)setGridInset:(UIEdgeInsets)a3;
- (void)setGridViewHeader:(id)a3;
- (void)setHideFooterView:(BOOL)a3;
- (void)setHidingCells:(BOOL)a3;
- (void)setJiggleWhenEditing:(BOOL)a3;
- (void)setLayoutDirection:(int64_t)a3;
- (void)setMinimumGridSpacing:(CGSize)a3;
- (void)setPendingCancelView:(id)a3;
- (void)setPendingDropView:(id)a3;
- (void)setTapAndHoldToReorder:(BOOL)a3;
- (void)setTapToSelectMode:(BOOL)a3;
- (void)setVisibleRegionInsets:(UIEdgeInsets)a3;
- (void)showCells;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)updateContentSize;
@end

@implementation IMGridView

- (void)_setupGridViewCommon
{
  v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  visibleCells = self->_visibleCells;
  self->_visibleCells = v3;

  v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  reusableCells = self->_reusableCells;
  self->_reusableCells = v5;

  v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  cellsForReuse = self->_cellsForReuse;
  self->_cellsForReuse = v7;

  *(_DWORD *)&self->_gridFlags |= 0x1000u;
  __asm { FMOV            V0.2D, #4.0 }
  self->_minimumGridSpacing = _Q0;
  self->_cellSize = (CGSize)vdupq_n_s64(0x4052C00000000000uLL);
  v14 = +[UIApplication jsa_sharedApplicationIfNotExtension];
  -[IMGridView setLayoutDirection:](self, "setLayoutDirection:", [v14 userInterfaceLayoutDirection]);

  [(IMGridView *)self setAlwaysBounceVertical:1];
  id v18 = [objc_alloc((Class)UIDragInteraction) initWithDelegate:self];
  [v18 setEnabled:1];
  [(IMGridView *)self addInteraction:v18];
  id v15 = [objc_alloc((Class)UIDropInteraction) initWithDelegate:self];
  [(IMGridView *)self addInteraction:v15];
  v16 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  draggedCellIDs = self->_draggedCellIDs;
  self->_draggedCellIDs = v16;
}

- (IMGridView)init
{
  v5.receiver = self;
  v5.super_class = (Class)IMGridView;
  v2 = [(IMGridView *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(IMGridView *)v2 setGrabTimerDelayEditing:0.08];
    [(IMGridView *)v3 setGrabTimerDelayNotEditing:0.4];
  }
  return v3;
}

- (IMGridView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IMGridView;
  v3 = -[IMGridView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(IMGridView *)v3 _setupGridViewCommon];
  }
  return v4;
}

- (IMGridView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IMGridView;
  v3 = [(IMGridView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(IMGridView *)v3 _setupGridViewCommon];
  }
  return v4;
}

- (void)dealloc
{
  [(NSTimer *)self->_autoscrollTimer invalidate];
  autoscrollTimer = self->_autoscrollTimer;
  self->_autoscrollTimer = 0;

  [(IMGridView *)self _cancelCellHighlight];
  v4.receiver = self;
  v4.super_class = (Class)IMGridView;
  [(IMGridView *)&v4 dealloc];
}

- (void)setDataSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  objc_super v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    objc_super v5 = obj;
    *(_DWORD *)&self->_gridFlags |= 0x1000u;
  }
}

- (IMGridViewDelegate)delegate
{
  v4.receiver = self;
  v4.super_class = (Class)IMGridView;
  v2 = [(IMGridView *)&v4 delegate];

  return (IMGridViewDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(IMGridView *)self delegate];

  if (v5 != v4)
  {
    v17.receiver = self;
    v17.super_class = (Class)IMGridView;
    [(IMGridView *)&v17 setDelegate:v4];
    self->_gridFlags = ($5B90CFA202BF1D20308DC9D3199A23B1)(*(_DWORD *)&self->_gridFlags & 0xFFFFFFFE | objc_opt_respondsToSelector() & 1);
    if (objc_opt_respondsToSelector()) {
      int v6 = 2;
    }
    else {
      int v6 = 0;
    }
    self->_gridFlags = ($5B90CFA202BF1D20308DC9D3199A23B1)(*(_DWORD *)&self->_gridFlags & 0xFFFFFFFD | v6);
    if (objc_opt_respondsToSelector()) {
      int v7 = 4;
    }
    else {
      int v7 = 0;
    }
    self->_gridFlags = ($5B90CFA202BF1D20308DC9D3199A23B1)(*(_DWORD *)&self->_gridFlags & 0xFFFFFFFB | v7);
    if (objc_opt_respondsToSelector()) {
      int v8 = 8;
    }
    else {
      int v8 = 0;
    }
    self->_gridFlags = ($5B90CFA202BF1D20308DC9D3199A23B1)(*(_DWORD *)&self->_gridFlags & 0xFFFFFFF7 | v8);
    if (objc_opt_respondsToSelector()) {
      int v9 = 16;
    }
    else {
      int v9 = 0;
    }
    self->_gridFlags = ($5B90CFA202BF1D20308DC9D3199A23B1)(*(_DWORD *)&self->_gridFlags & 0xFFFFFFEF | v9);
    if (objc_opt_respondsToSelector()) {
      int v10 = 32;
    }
    else {
      int v10 = 0;
    }
    self->_gridFlags = ($5B90CFA202BF1D20308DC9D3199A23B1)(*(_DWORD *)&self->_gridFlags & 0xFFFFFFDF | v10);
    if (objc_opt_respondsToSelector()) {
      int v11 = 64;
    }
    else {
      int v11 = 0;
    }
    self->_gridFlags = ($5B90CFA202BF1D20308DC9D3199A23B1)(*(_DWORD *)&self->_gridFlags & 0xFFFFFFBF | v11);
    if (objc_opt_respondsToSelector()) {
      int v12 = 128;
    }
    else {
      int v12 = 0;
    }
    self->_gridFlags = ($5B90CFA202BF1D20308DC9D3199A23B1)(*(_DWORD *)&self->_gridFlags & 0xFFFFFF7F | v12);
    if (objc_opt_respondsToSelector()) {
      int v13 = 256;
    }
    else {
      int v13 = 0;
    }
    self->_gridFlags = ($5B90CFA202BF1D20308DC9D3199A23B1)(*(_DWORD *)&self->_gridFlags & 0xFFFFFEFF | v13);
    if (objc_opt_respondsToSelector()) {
      int v14 = 512;
    }
    else {
      int v14 = 0;
    }
    self->_gridFlags = ($5B90CFA202BF1D20308DC9D3199A23B1)(*(_DWORD *)&self->_gridFlags & 0xFFFFFDFF | v14);
    if (objc_opt_respondsToSelector()) {
      int v15 = 1024;
    }
    else {
      int v15 = 0;
    }
    self->_gridFlags = ($5B90CFA202BF1D20308DC9D3199A23B1)(*(_DWORD *)&self->_gridFlags & 0xFFFFFBFF | v15);
    if (objc_opt_respondsToSelector()) {
      int v16 = 2048;
    }
    else {
      int v16 = 0;
    }
    self->_gridFlags = ($5B90CFA202BF1D20308DC9D3199A23B1)(*(_DWORD *)&self->_gridFlags & 0xFFFFF7FF | v16);
  }
}

- (void)setGridViewHeader:(id)a3
{
  id v5 = (UIView *)a3;
  gridViewHeader = self->_gridViewHeader;
  if (gridViewHeader != v5)
  {
    int v7 = v5;
    [(UIView *)gridViewHeader removeFromSuperview];
    objc_storeStrong((id *)&self->_gridViewHeader, a3);
    if (v7) {
      [(IMGridView *)self addSubview:v7];
    }
  }

  _objc_release_x1();
}

- (int64_t)numberOfColumnsForSize:(CGSize)a3
{
  double width = a3.width;
  [(IMGridView *)self gridInset];
  double v6 = width - v5;
  [(IMGridView *)self gridInset];
  return (uint64_t)((v6 - v7 + self->_minimumGridSpacing.width)
                 / (self->_minimumGridSpacing.width + self->_cellSize.width));
}

- (int64_t)numberOfRowsForSize:(CGSize)a3
{
  double height = a3.height;
  [(IMGridView *)self contentOffset];
  double v6 = v5 - self->_gridInset.top;
  [(IMGridView *)self cellSpacing];
  double v8 = v7 + self->_cellSize.height;
  int64_t numberOfItems = self->_numberOfItems;
  if (numberOfItems >= (int)((height + v6) / v8)) {
    int64_t numberOfItems = (int)((height + v6) / v8);
  }
  return numberOfItems - ((int)(v6 / v8) & ~((int)(v6 / v8) >> 31));
}

- (int64_t)_calculateNumberOfColumns
{
  [(IMGridView *)self bounds];

  return -[IMGridView cellColumnsForSize:](self, "cellColumnsForSize:", v3, v4);
}

- (unint64_t)numberOfColumns
{
  if (self->_numberOfColumnsValid) {
    return self->_numberOfColumns;
  }
  unint64_t result = [(IMGridView *)self _calculateNumberOfColumns];
  self->_numberOfColumns = result;
  self->_numberOfColumnsValid = 1;
  return result;
}

- (void)invalidateNumberOfColumns
{
  if (self->_numberOfColumnsValid)
  {
    self->_numberOfColumnsValid = 0;
    [(IMGridView *)self setNeedsLayout];
  }
}

- (int64_t)numberOfRows
{
  return vcvtps_s32_f32((float)self->_numberOfItems / (float)[(IMGridView *)self numberOfColumns]);
}

- (CGSize)cellSpacing
{
  uint64_t v3 = [(IMGridView *)self numberOfColumns];
  [(IMGridView *)self bounds];
  double v5 = v4;
  [(IMGridView *)self gridInset];
  double v7 = v6;
  [(IMGridView *)self gridInset];
  double v9 = 0.0;
  if (v3 >= 2) {
    double v9 = (v5 - v7 - v8 - self->_cellSize.width * (double)v3) / (double)(v3 - 1);
  }
  double height = self->_minimumGridSpacing.height;
  result.double height = height;
  result.double width = v9;
  return result;
}

- (_NSRange)rangeOfVisibleCells
{
  uint64_t v2 = 0x7FFFFFFFFFFFFFFFLL;
  if (self->_numberOfItems)
  {
    [(IMGridView *)self bounds];
    double v6 = v4 + -30.0 - self->_gridInset.top;
    double v7 = v5 + 60.0 + v6;
    [(IMGridView *)self cellSpacing];
    double v9 = v8 + self->_cellSize.height;
    int v10 = (int)(v6 / v9);
    uint64_t v11 = v10 & ~(v10 >> 31);
    int v12 = (int)(v7 / v9);
    if (self->_numberOfItems >= v12) {
      int64_t numberOfItems = v12;
    }
    else {
      int64_t numberOfItems = self->_numberOfItems;
    }
    uint64_t v14 = [(IMGridView *)self numberOfColumns];
    uint64_t v15 = (uint64_t)(-(v6 - (double)(v11 + 1) * v9) / v9 * (double)v14);
    if (v10 <= 0) {
      uint64_t v15 = 0;
    }
    int64_t v16 = v14 * v11 - v15;
    int64_t v17 = self->_numberOfItems;
    if (v17 >= (numberOfItems + 2) * v14) {
      int64_t v17 = (numberOfItems + 2) * v14;
    }
    BOOL v18 = v17 <= v16;
    uint64_t v19 = v17 - v16;
    if (!v18) {
      uint64_t v2 = v16;
    }
    NSUInteger v20 = v19 & ~(v19 >> 63);
  }
  else
  {
    NSUInteger v20 = 0;
  }
  NSUInteger v21 = v2;
  result.length = v20;
  result.location = v21;
  return result;
}

- (id)visibleCells
{
  id v2 = [(NSMutableArray *)self->_visibleCells copy];

  return v2;
}

- (CGRect)rectForCellAtIndex:(int64_t)a3
{
  uint64_t v5 = [(IMGridView *)self numberOfColumns];
  if (v5 < 1)
  {
    double x = CGRectNull.origin.x;
    double y = CGRectNull.origin.y;
    double width = CGRectNull.size.width;
    double height = CGRectNull.size.height;
  }
  else
  {
    int64_t v6 = a3 / v5;
    int64_t v7 = a3 % v5;
    [(IMGridView *)self cellSpacing];
    double v9 = v8;
    double v11 = v10;
    if ([(IMGridView *)self layoutDirection])
    {
      [(IMGridView *)self bounds];
      CGFloat v12 = CGRectGetWidth(v17);
      double width = self->_cellSize.width;
      double x = v12 - self->_gridInset.right - round((v9 + width) * (double)v7) - width;
    }
    else
    {
      double width = self->_cellSize.width;
      double x = self->_gridInset.left + round((v9 + width) * (double)v7);
    }
    double height = self->_cellSize.height;
    double y = self->_gridInset.top + round((v11 + height) * (double)v6);
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)visibleCellForIndex:(int64_t)a3
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_visibleCells;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (-[IMGridView indexForCell:](self, "indexForCell:", v10, (void)v13) == a3)
        {
          id v11 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:

  return v11;
}

- (id)cellForIndex:(int64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v4 = 0;
  }
  else
  {
    [(IMGridView *)self layoutIfNeeded];
    double v4 = [(IMGridView *)self visibleCellForIndex:a3];
  }
  return v4;
}

- (int64_t)indexForCell:(id)a3
{
  if (a3) {
    return (int64_t)[a3 tag] - 10000;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)IMGridView;
  [(IMGridView *)&v16 bounds];
  v18.origin.double x = v8;
  v18.origin.double y = v9;
  v18.size.double width = v10;
  v18.size.double height = v11;
  v17.origin.double x = x;
  v17.origin.double y = y;
  v17.size.double width = width;
  v17.size.double height = height;
  if (!CGRectEqualToRect(v17, v18))
  {
    [(IMGridView *)self bounds];
    if (width != v13 || height != v12) {
      [(IMGridView *)self invalidateNumberOfColumns];
    }
    v15.receiver = self;
    v15.super_class = (Class)IMGridView;
    -[IMGridView setBounds:](&v15, "setBounds:", x, y, width, height);
    *(_DWORD *)&self->_gridFlags |= 0x20000u;
    [(IMGridView *)self setNeedsLayout];
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(_DWORD *)&self->_gridFlags &= ~0x20000u;
  [(IMGridView *)self frame];
  if (width != v9 || height != v8) {
    [(IMGridView *)self invalidateNumberOfColumns];
  }
  v11.receiver = self;
  v11.super_class = (Class)IMGridView;
  -[IMGridView setFrame:](&v11, "setFrame:", x, y, width, height);
}

- (void)arrangeVisibleCells:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v6 = self->_visibleCells;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v29;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(id *)(*((void *)&v28 + 1) + 8 * i);
        unint64_t v12 = -[IMGridView indexForCell:](self, "indexForCell:", v11, (void)v28);
        if (v12 >= location && v12 - location < length)
        {
          unint64_t v14 = v12;
          id WeakRetained = objc_loadWeakRetained((id *)&self->_grabbedCell);

          if (v11 != WeakRetained)
          {
            [(IMGridView *)self rectForCellAtIndex:v14];
            double v17 = v16;
            double v19 = v18;
            double v21 = v20;
            double v23 = v22;
            [v11 frame];
            v34.origin.double x = v24;
            v34.origin.double y = v25;
            v34.size.double width = v26;
            v34.size.double height = v27;
            v33.origin.double x = v17;
            v33.origin.double y = v19;
            v33.size.double width = v21;
            v33.size.double height = v23;
            if (!CGRectEqualToRect(v33, v34)) {
              [v11 setFrame:v17, v19, v21, v23];
            }
          }
        }
      }
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v8);
  }
}

- (void)layoutSubviews
{
  v53.receiver = self;
  v53.super_class = (Class)IMGridView;
  [(IMGridView *)&v53 layoutSubviews];
  $5B90CFA202BF1D20308DC9D3199A23B1 gridFlags = self->_gridFlags;
  if ((*(_WORD *)&gridFlags & 0x2000) == 0)
  {
    if ((*(_WORD *)&gridFlags & 0x1000) != 0) {
      [(IMGridView *)self reloadData];
    }
    id v4 = [(NSMutableArray *)self->_cellsForReuse copy];
    [(NSMutableArray *)self->_cellsForReuse removeAllObjects];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v49 objects:v55 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v50;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v50 != v8) {
            objc_enumerationMutation(v5);
          }
          CGFloat v10 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          [v10 setIgnoreChangesToHidden:0];
          [v10 prepareForReuse];
          id v11 = [(IMGridView *)self _reuseArrayForCell:v10];
          [v11 addObject:v10];
        }
        id v7 = [v5 countByEnumeratingWithState:&v49 objects:v55 count:16];
      }
      while (v7);
    }

    unint64_t v12 = (char *)[(IMGridView *)self rangeOfVisibleCells];
    unint64_t v14 = v13;
    id v15 = [(NSMutableArray *)self->_visibleCells copy];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v16 = v15;
    id v17 = [v16 countByEnumeratingWithState:&v45 objects:v54 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v46;
      do
      {
        for (j = 0; j != v18; j = (char *)j + 1)
        {
          if (*(void *)v46 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v45 + 1) + 8 * (void)j);
          unint64_t v22 = -[IMGridView indexForCell:](self, "indexForCell:", v21, (void)v45);
          if (v22 < (unint64_t)v12 || v22 - (unint64_t)v12 >= v14) {
            [(IMGridView *)self reuseCell:v21];
          }
        }
        id v18 = [v16 countByEnumeratingWithState:&v45 objects:v54 count:16];
      }
      while (v18);
    }

    if ((*((unsigned char *)&self->_gridFlags + 2) & 2) == 0) {
      -[IMGridView arrangeVisibleCells:](self, "arrangeVisibleCells:", v12, v14);
    }
    if ((uint64_t)v12 < (uint64_t)&v12[v14])
    {
      do
      {
        CGFloat v25 = -[IMGridView visibleCellForIndex:](self, "visibleCellForIndex:", v12, (void)v45);
        if (!v25) {
          id v26 = [(IMGridView *)self _installNewCellAtIndex:v12];
        }

        ++v12;
        --v14;
      }
      while (v14);
    }
    if ((*((unsigned char *)&self->_gridFlags + 2) & 2) == 0)
    {
      CGFloat v27 = [(IMGridView *)self footerView];

      if (v27)
      {
        double v28 = (double)[(IMGridView *)self numberOfRows];
        [(IMGridView *)self cellSpacing];
        double v30 = v29;
        [(IMGridView *)self cellSize];
        double v32 = v30 + v31;
        [(IMGridView *)self gridInset];
        double v34 = v33 + v28 * v32;
        [(IMGridView *)self bounds];
        double v36 = v35;
        v37 = [(IMGridView *)self footerView];
        [v37 bounds];
        double v39 = v38;
        v40 = [(IMGridView *)self footerView];
        [v40 setFrame:0.0, v34, v36, v39];
      }
    }
    $5B90CFA202BF1D20308DC9D3199A23B1 v41 = self->_gridFlags;
    if ((*(_DWORD *)&v41 & 0x20000) == 0)
    {
      [(IMGridView *)self updateContentSize];
      $5B90CFA202BF1D20308DC9D3199A23B1 v41 = self->_gridFlags;
    }
    self->_$5B90CFA202BF1D20308DC9D3199A23B1 gridFlags = ($5B90CFA202BF1D20308DC9D3199A23B1)(*(_DWORD *)&v41 & 0xFFFDFFFF);
    if (self->_grabbedCellUniqueID)
    {
      p_grabbedCell = &self->_grabbedCell;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_grabbedCell);

      if (!WeakRetained)
      {
        v44 = [(IMGridView *)self _cellWithUniqueIdentifier:self->_grabbedCellUniqueID];
        objc_storeWeak((id *)p_grabbedCell, v44);
      }
    }
  }
}

- (void)updateContentSize
{
  [(IMGridView *)self cellSpacing];
  double v4 = v3;
  uint64_t v5 = [(IMGridView *)self numberOfRows];
  [(IMGridView *)self bounds];
  CGFloat x = v18.origin.x;
  CGFloat y = v18.origin.y;
  CGFloat width = v18.size.width;
  CGFloat height = v18.size.height;
  double v10 = CGRectGetWidth(v18);
  double v11 = self->_gridInset.top + self->_gridInset.bottom - (v4 - (double)v5 * (v4 + self->_cellSize.height));
  if (self->_gridViewHeader)
  {
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.CGFloat width = width;
    v19.size.CGFloat height = height;
    double v12 = CGRectGetHeight(v19);
    [(UIView *)self->_gridViewHeader frame];
    double v13 = v12 + CGRectGetHeight(v20);
    if (v11 < v13) {
      double v11 = v13;
    }
  }
  footerView = self->_footerView;
  if (footerView)
  {
    [(UIView *)footerView frame];
    double v15 = CGRectGetHeight(v21);
    [(IMGridView *)self cellSpacing];
    double v11 = v11 + v15 + v16;
  }

  -[IMGridView setContentSize:](self, "setContentSize:", v10, v11);
}

- (BOOL)canDeleteCellAtIndex:(int64_t)a3
{
  if ((*((unsigned char *)&self->_gridFlags + 1) & 1) == 0 || [(IMGridView *)self tapToSelectMode]) {
    return 0;
  }
  id v6 = [(IMGridView *)self delegate];
  unsigned __int8 v7 = [v6 gridView:self canDeleteCellAtIndex:a3];

  return v7;
}

- (id)_installNewCellAtIndex:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_grabbedCell);
  int64_t v6 = a3;
  if (WeakRetained)
  {
    int64_t v7 = [(IMGridView *)self indexForCell:WeakRetained];
    grabIndeCGFloat x = self->_grabIndex;
    if (grabIndex <= v7)
    {
      if (grabIndex >= v7 || grabIndex > a3 || v7 <= a3) {
        int64_t v6 = a3;
      }
      else {
        int64_t v6 = a3 + 1;
      }
    }
    else
    {
      BOOL v10 = v7 < a3 && grabIndex >= a3;
      int64_t v6 = a3 - v10;
    }
  }
  double v13 = [(IMGridView *)self dataSource];
  id v14 = [v13 gridView:self cellForIndex:v6];

  if (v14)
  {
    if (v14 != WeakRetained)
    {
      [(IMGridView *)self rectForCellAtIndex:a3];
      [v14 setFrame:];
    }
    [v14 setCanDelete:[self canDeleteCellAtIndex:a3]];
    [v14 setTag:a3 + 10000];
    [v14 setEditing:[self isEditing]];
    [(NSMutableArray *)self->_visibleCells addObject:v14];
    double v15 = [v14 superview];

    if (v15 != self) {
      [(IMGridView *)self addSubview:v14];
    }
  }

  return v14;
}

- (id)_reuseArrayForCell:(id)a3
{
  uint64_t v4 = [a3 reuseIdentifier];
  if (v4) {
    uint64_t v5 = (__CFString *)v4;
  }
  else {
    uint64_t v5 = &stru_2CE418;
  }
  int64_t v6 = [(IMGridView *)self _reuseArrayForIdentifier:v5];

  return v6;
}

- (id)_reuseArrayForIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(NSMutableDictionary *)self->_reusableCells objectForKey:v4];
    if (!v5)
    {
      uint64_t v5 = +[NSMutableArray array];
      [(NSMutableDictionary *)self->_reusableCells setObject:v5 forKey:v4];
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)reuseCell:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_grabbedCell);

    if (WeakRetained != v6)
    {
      [(NSMutableArray *)self->_visibleCells removeObject:v6];
      [(NSMutableArray *)self->_cellsForReuse addObject:v6];
      [(IMGridView *)self setNeedsLayout];
    }
  }

  _objc_release_x1();
}

- (id)dequeueReusableCell
{
  return [(IMGridView *)self dequeueReusableCellWithIdentifier:0];
}

- (id)dequeueReusableCellWithIdentifier:(id)a3
{
  id v4 = [(IMGridView *)self _reuseArrayForIdentifier:a3];
  if ([v4 count])
  {
    uint64_t v5 = [v4 objectAtIndex:0];
    [v4 removeObject:v5];
  }
  else
  {
    uint64_t v5 = 0;
  }
  [v5 setIgnoreChangesToHidden:0];
  [v5 setHidden:self->_hidingCells];
  [v5 setIgnoreChangesToHidden:self->_hidingCells];

  return v5;
}

- (void)hideCells
{
  self->_hidingCells = 1;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = self->_visibleCells;
  id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        int64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        [v7 setHidden:1, v8];
        [v7 setIgnoreChangesToHidden:1];
      }
      id v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)showCells
{
  self->_hidingCells = 0;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = self->_visibleCells;
  id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        int64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        [v7 setIgnoreChangesToHidden:0, v8];
        [v7 setHidden:0];
      }
      id v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)reloadData
{
  [(IMGridView *)self _cancelAutoscrollTimer];
  if (self->_tableReloadingSuspendedCount < 1)
  {
    id v3 = [(IMGridView *)self footerView];
    [v3 removeFromSuperview];

    id v4 = [(IMGridView *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v5 = [v4 footerViewForGridView:self];
    }
    else
    {
      uint64_t v5 = 0;
    }
    [(IMGridView *)self setFooterView:v5];
    id v6 = [(IMGridView *)self footerView];

    if (v6)
    {
      int64_t v7 = [(IMGridView *)self footerView];
      [(IMGridView *)self addSubview:v7];

      BOOL hideFooterView = self->_hideFooterView;
      long long v9 = [(IMGridView *)self footerView];
      [v9 setHidden:hideFooterView];
    }
    [(IMGridView *)self setGrabbedCell:0];
    id v10 = [(NSMutableArray *)self->_visibleCells copy];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v11 = v10;
    id v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        double v15 = 0;
        do
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          -[IMGridView reuseCell:](self, "reuseCell:", *(void *)(*((void *)&v17 + 1) + 8 * (void)v15), (void)v17);
          double v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v13);
    }

    *(_DWORD *)&self->_gridFlags &= ~0x1000u;
    double v16 = [(IMGridView *)self dataSource];
    self->_int64_t numberOfItems = (int64_t)[v16 numberOfCellsInGridView:self];

    [(IMGridView *)self setNeedsLayout];
  }
  else
  {
    *(_DWORD *)&self->_gridFlags |= 0x8000u;
  }
}

- (void)_suspendReloads
{
}

- (void)_resumeReloads
{
  int64_t v2 = self->_tableReloadingSuspendedCount - 1;
  self->_tableReloadingSuspendedCount = v2;
  if (!v2)
  {
    $5B90CFA202BF1D20308DC9D3199A23B1 gridFlags = self->_gridFlags;
    if ((*(_WORD *)&gridFlags & 0x8000) != 0)
    {
      self->_$5B90CFA202BF1D20308DC9D3199A23B1 gridFlags = ($5B90CFA202BF1D20308DC9D3199A23B1)(*(_DWORD *)&gridFlags & 0xFFFF7FFF);
      [(IMGridView *)self reloadData];
    }
  }
}

- (void)scrollToCellAtIndex:(int64_t)a3 animated:(BOOL)a4
{
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v5 = a4;
    -[IMGridView rectForCellAtIndex:](self, "rectForCellAtIndex:");
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    [(IMGridView *)self layoutIfNeeded];
    -[IMGridView scrollRectToVisible:animated:](self, "scrollRectToVisible:animated:", v5, v8, v10, v12, v14);
  }
}

- (void)scrollMakingTopmostRowContainCellAtIndex:(int64_t)a3 animated:(BOOL)a4
{
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v5 = a4;
    int64_t v8 = [(IMGridView *)self numberOfColumns];
    [(IMGridView *)self bounds];
    int64_t v11 = -[IMGridView numberOfRowsForSize:](self, "numberOfRowsForSize:", v9, v10);
    int64_t v12 = [(IMGridView *)self numberOfRows];
    int64_t v13 = a3 / v8;
    if (v12 - a3 / v8 < v11) {
      int64_t v13 = (v12 - v11) & ~((v12 - v11) >> 63);
    }
    [(IMGridView *)self rectForCellAtIndex:v13 * v8];
    double v15 = v14;
    [(IMGridView *)self contentOffset];
    double v17 = v16;
    [(IMGridView *)self layoutIfNeeded];
    -[IMGridView setContentOffset:animated:](self, "setContentOffset:animated:", v5, v17, v15);
  }
}

- (id)_arrayForUpdateAction:(int)a3
{
  if (a3 == 2)
  {
    uint64_t v3 = 192;
  }
  else if (a3 == 1)
  {
    uint64_t v3 = 184;
  }
  else
  {
    if (a3)
    {
      id v8 = 0;
      goto LABEL_11;
    }
    uint64_t v3 = 176;
  }
  uint64_t v4 = (void **)((char *)&self->super.super.super.super.isa + v3);
  BOOL v5 = *(Class *)((char *)&self->super.super.super.super.isa + v3);
  if (!v5)
  {
    id v6 = objc_alloc_init((Class)NSMutableArray);
    double v7 = *v4;
    void *v4 = v6;

    BOOL v5 = *v4;
  }
  id v8 = v5;
LABEL_11:

  return v8;
}

- (void)_updateItemAtIndex:(unint64_t)a3 updateAction:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  [(IMGridView *)self beginUpdates];
  id v8 = [(IMGridView *)self _arrayForUpdateAction:v4];
  double v7 = [[IMGridViewUpdateItem alloc] initWithAction:v4 forIndex:a3];
  [v8 addObject:v7];
  [(IMGridView *)self endUpdates];
}

- (void)reloadCellAtIndex:(unint64_t)a3
{
}

- (void)insertCellAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
}

- (void)deleteCellAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
}

- (void)_refreshCells
{
  [(IMGridView *)self reloadAllCells];

  [(IMGridView *)self setNeedsLayout];
}

- (void)reloadAllCells
{
  [(IMGridView *)self beginUpdates];
  *(_DWORD *)&self->_gridFlags |= 0x1000u;

  [(IMGridView *)self endUpdates];
}

- (void)deleteCellDidAnimate
{
  int v3 = self->_deleteAnimationCount - 1;
  self->_deleteAnimationCount = v3;
  if (v3)
  {
    [(IMGridView *)self _resumeReloads];
  }
  else
  {
    [(NSMutableArray *)self->_cellsToDelete sortedArrayUsingSelector:"inverseCompareIndexes:"];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v19 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v19)
    {
      uint64_t v18 = *(void *)v28;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v28 != v18) {
            objc_enumerationMutation(obj);
          }
          BOOL v5 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          id v6 = [v5 index];
          [(IMGridView *)self rangeOfVisibleCells];
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          double v7 = self->_visibleCells;
          id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v8)
          {
            id v9 = v8;
            long long v20 = i;
            double v10 = 0;
            uint64_t v11 = *(void *)v24;
            do
            {
              for (j = 0; j != v9; j = (char *)j + 1)
              {
                if (*(void *)v24 != v11) {
                  objc_enumerationMutation(v7);
                }
                int64_t v13 = *(void **)(*((void *)&v23 + 1) + 8 * (void)j);
                if ([(IMGridView *)self indexForCell:v13] <= (uint64_t)v6)
                {
                  unint64_t v14 = [(IMGridView *)self indexForCell:v13];
                  if (v14 >= (unint64_t)[v5 index])
                  {
                    id v15 = v13;

                    double v10 = v15;
                  }
                }
                else
                {
                  [v13 setTag:((char *)[v13 tag]) - 1];
                }
              }
              id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
            }
            while (v9);

            if (v10) {
              [(IMGridView *)self reuseCell:v10];
            }
            i = v20;
          }
          else
          {

            double v10 = 0;
          }
          --self->_numberOfItems;
        }
        id v19 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v19);
    }
    cellsToDelete = self->_cellsToDelete;
    self->_cellsToDelete = 0;

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_743E8;
    v22[3] = &unk_2C3C50;
    v22[4] = self;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_7442C;
    v21[3] = &unk_2C5968;
    v21[4] = self;
    +[UIView animateWithDuration:v22 animations:v21 completion:0.3];
    [(IMGridView *)self layoutIfNeeded];
    [(IMGridView *)self layoutSubviews];
  }
}

- (void)_setupCellAnimations
{
}

- (void)_endCellAnimations
{
  int64_t v2 = self;
  $5B90CFA202BF1D20308DC9D3199A23B1 gridFlags = self->_gridFlags;
  if ((*(_WORD *)&gridFlags & 0x1000) != 0)
  {
    deleteItems = self->_deleteItems;
    self->_deleteItems = 0;

    insertItems = v2->_insertItems;
    v2->_insertItems = 0;

    reloadItems = v2->_reloadItems;
    v2->_reloadItems = 0;
  }
  id v7 = [(NSMutableArray *)v2->_deleteItems count];
  if (([(NSMutableArray *)v2->_deleteItems count] || [(NSMutableArray *)v2->_insertItems count])
    && v2->_selectedCell)
  {
    [(IMGridView *)v2 _cancelCellHighlight];
    [(IMGridViewCell *)v2->_selectedCell setHighlighted:0];
    selectedCell = v2->_selectedCell;
    v2->_selectedCell = 0;
  }
  if ([(NSMutableArray *)v2->_deleteItems count])
  {
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_74904;
    v52[3] = &unk_2C3C50;
    v52[4] = v2;
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_74AD4;
    v51[3] = &unk_2C5968;
    v51[4] = v2;
    +[UIView animateWithDuration:v52 animations:v51 completion:0.2];
    int v9 = 1;
  }
  else
  {
    int v9 = (*(unsigned int *)&gridFlags >> 12) & 1;
  }
  if ([(NSMutableArray *)v2->_insertItems count] && !v2->_deleteAnimationCount)
  {
    id v34 = v7;
    [(NSMutableArray *)v2->_insertItems sortedArrayUsingSelector:"compareIndexes:"];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v38 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
    if (v38)
    {
      uint64_t v36 = *(void *)v48;
      v37 = v2;
      do
      {
        for (i = 0; i != v38; i = (char *)i + 1)
        {
          if (*(void *)v48 != v36) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          long long v43 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          int64_t v12 = v2->_visibleCells;
          id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v43 objects:v54 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v44;
            do
            {
              for (j = 0; j != v14; j = (char *)j + 1)
              {
                if (*(void *)v44 != v15) {
                  objc_enumerationMutation(v12);
                }
                double v17 = *(void **)(*((void *)&v43 + 1) + 8 * (void)j);
                uint64_t v18 = (char *)[v17 tag] - 10000;
                id v19 = (char *)[v11 index];
                long long v20 = (char *)[v17 tag];
                if (v18 < v19) {
                  CGRect v21 = v20;
                }
                else {
                  CGRect v21 = v20 + 1;
                }
                [v17 setTag:v21];
              }
              id v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v43 objects:v54 count:16];
            }
            while (v14);
          }

          int64_t v2 = v37;
          ++v37->_numberOfItems;
          id v22 = [(IMGridView *)v37 rangeOfVisibleCells];
          -[IMGridView arrangeVisibleCells:](v37, "arrangeVisibleCells:", v22, v23);
        }
        id v38 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
      }
      while (v38);
    }
    long long v24 = v2->_insertItems;
    v2->_insertItems = 0;

    int v9 = 1;
    id v7 = v34;
  }
  if ([(NSMutableArray *)v2->_reloadItems count] && !v2->_deleteAnimationCount)
  {
    long long v25 = [(NSMutableArray *)v2->_reloadItems sortedArrayUsingSelector:"compareIndexes:"];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v26 = [v25 countByEnumeratingWithState:&v39 objects:v53 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v40;
      do
      {
        for (k = 0; k != v27; k = (char *)k + 1)
        {
          if (*(void *)v40 != v28) {
            objc_enumerationMutation(v25);
          }
          long long v30 = -[IMGridView visibleCellForIndex:](v2, "visibleCellForIndex:", [*(id *)(*((void *)&v39 + 1) + 8 * (void)k) index]);
          [(IMGridView *)v2 reuseCell:v30];
        }
        id v27 = [v25 countByEnumeratingWithState:&v39 objects:v53 count:16];
      }
      while (v27);
    }
    double v31 = v2->_reloadItems;
    v2->_reloadItems = 0;

    id v32 = [(IMGridView *)v2 rangeOfVisibleCells];
    -[IMGridView arrangeVisibleCells:](v2, "arrangeVisibleCells:", v32, v33);
  }
  else if (!v9)
  {
    if (v7) {
      return;
    }
LABEL_44:
    [(IMGridView *)v2 _resumeReloads];
    return;
  }
  [(IMGridView *)v2 setNeedsLayout];
  if (!v7) {
    goto LABEL_44;
  }
}

- (void)beginUpdates
{
  int64_t updateCount = self->_updateCount;
  if (!updateCount)
  {
    [(IMGridView *)self _setupCellAnimations];
    int64_t updateCount = self->_updateCount;
  }
  self->_int64_t updateCount = updateCount + 1;
}

- (void)endUpdates
{
  int64_t updateCount = self->_updateCount;
  if (updateCount > 0
    || (BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Views/IMGridView.m", 1126, (uint64_t)"-[IMGridView endUpdates]", (uint64_t)"_updateCount > 0", @"Unbalanced endUpdates call. _updateCount: %ld", v2, v3, v4, updateCount), int64_t updateCount = self->_updateCount, updateCount >= 1))
  {
    self->_int64_t updateCount = --updateCount;
  }
  if (!updateCount)
  {
    [(IMGridView *)self _endCellAnimations];
  }
}

- (int64_t)cellColumnsForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ((*((unsigned char *)&self->_gridFlags + 1) & 8) != 0)
  {
    id v6 = [(IMGridView *)self delegate];
    id v7 = [v6 gridView:self numberOfColumnsForSize:width, height];

    return (int64_t)v7;
  }
  else
  {
    return -[IMGridView numberOfColumnsForSize:](self, "numberOfColumnsForSize:");
  }
}

- (id)rotationCellContainersForSize:(CGSize)a3
{
  cellContainerMatriCGFloat x = self->_cellContainerMatrix;
  if (!cellContainerMatrix)
  {
    double height = a3.height;
    double width = a3.width;
    [(IMGridView *)self bounds];
    int64_t v9 = -[IMGridView cellColumnsForSize:](self, "cellColumnsForSize:", v7, v8);
    int64_t v10 = -[IMGridView cellColumnsForSize:](self, "cellColumnsForSize:", width, height);
    if (v9 <= v10) {
      int64_t v11 = v10;
    }
    else {
      int64_t v11 = v9;
    }
    int64_t v12 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:6];
    id v13 = self->_cellContainerMatrix;
    self->_cellContainerMatriCGFloat x = v12;

    [(IMGridView *)self rectForCellAtIndex:0];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    for (int i = 0; i != 6; ++i)
    {
      id v23 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v11 + 1];
      if ((v11 & 0x8000000000000000) == 0)
      {
        int64_t v24 = 0;
        do
        {
          long long v25 = -[IMCellRotationContainer initWithFrame:]([IMCellRotationContainer alloc], "initWithFrame:", v15, v17, v19, v21);
          [v23 addObject:v25];

          ++v24;
        }
        while (v11 >= v24);
      }
      [(NSMutableArray *)self->_cellContainerMatrix addObject:v23];
    }
    cellContainerMatriCGFloat x = self->_cellContainerMatrix;
  }

  return cellContainerMatrix;
}

- (int64_t)indexForX:(int64_t)a3 Y:(int64_t)a4
{
  [(IMGridView *)self bounds];
  int64_t v9 = -[IMGridView cellColumnsForSize:](self, "cellColumnsForSize:", v7, v8);
  if (v9 <= a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return a3 + v9 * a4;
  }
}

- (CGPoint)originForCellAtX:(int64_t)a3 Y:(int64_t)a4
{
  [(IMGridView *)self rectForCellAtIndex:0];
  double v8 = v7;
  double v10 = v9;
  [(IMGridView *)self cellSpacing];
  float v12 = v11 + v8;
  [(IMGridView *)self cellSpacing];
  double v14 = v13;
  if ([(IMGridView *)self layoutDirection])
  {
    [(IMGridView *)self bounds];
    double v15 = CGRectGetWidth(v19) - (v8 + self->_gridInset.right + (float)((float)a3 * v12));
  }
  else
  {
    double v15 = self->_gridInset.left + (float)((float)a3 * v12);
  }
  float v16 = v10 + v14;
  double v17 = self->_gridInset.top + (float)((float)a4 * v16);
  result.CGFloat y = v17;
  result.CGFloat x = v15;
  return result;
}

- (int64_t)rowRangeStart
{
  [(IMGridView *)self contentOffset];
  double v4 = v3 - self->_gridInset.top;
  [(IMGridView *)self cellSpacing];
  int v6 = (int)(v4 / (v5 + self->_cellSize.height));
  return v6 & ~(v6 >> 31);
}

- (BOOL)isRotating
{
  return (*((unsigned __int8 *)&self->_gridFlags + 1) >> 5) & 1;
}

- (void)prepareToRotateWithDestinationSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (([(IMGridView *)self isDecelerating] & 1) == 0)
  {
    [(IMGridView *)self setHideFooterView:1];
    [(IMGridView *)self contentOffset];
    self->_oldContentOffset.CGFloat x = v6;
    self->_oldContentOffset.CGFloat y = v7;
    *(_DWORD *)&self->_gridFlags |= 0x2000u;
    -[IMGridView rotationCellContainersForSize:](self, "rotationCellContainersForSize:", width, height);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    double v18 = (char *)[v19 count];
    if ((uint64_t)v18 >= 1)
    {
      for (int i = 0; i != v18; ++i)
      {
        double v9 = [v19 objectAtIndex:i];
        double v10 = (char *)[v9 count];
        if ((uint64_t)v10 >= 1)
        {
          double v11 = v10;
          for (j = 0; j != v11; ++j)
          {
            double v13 = [v9 objectAtIndex:j];
            int64_t v14 = [(IMGridView *)self indexForX:j Y:&i[[(IMGridView *)self rowRangeStart]]];
            if (v14 != 0x7FFFFFFFFFFFFFFFLL)
            {
              int64_t v15 = v14;
              if (v14 < self->_numberOfItems)
              {
                uint64_t v16 = [(IMGridView *)self cellForIndex:v14];
                if (v16)
                {
                  double v17 = (void *)v16;
                  [v13 setStartCell:v16];
                  [(NSMutableArray *)self->_visibleCells removeObject:v17];
                }
              }
            }
            [(IMGridView *)self originForCellAtX:j Y:&i[[(IMGridView *)self rowRangeStart]]];
            [v13 setOrigin:];
            [(IMGridView *)self addSubview:v13];
          }
        }
      }
    }
  }
}

- (void)performRotationWithDuration:(double)a3
{
  if ((*((unsigned char *)&self->_gridFlags + 1) & 0x20) != 0
    && ([(IMGridView *)self isDecelerating] & 1) == 0)
  {
    [(IMGridView *)self updateContentSize];
    double y = self->_oldContentOffset.y;
    [(IMGridView *)self contentSize];
    double v7 = v6;
    [(IMGridView *)self bounds];
    if (y <= v7 - v8)
    {
      double v12 = self->_oldContentOffset.y;
    }
    else
    {
      [(IMGridView *)self contentSize];
      double v10 = v9;
      [(IMGridView *)self bounds];
      double v12 = v10 - v11;
      self->_oldContentOffset.double y = v12;
    }
    [(IMGridView *)self contentInset];
    if (v12 < -v13)
    {
      [(IMGridView *)self contentInset];
      self->_oldContentOffset.double y = -v14;
    }
    [(IMGridView *)self setContentOffset:self->_oldContentOffset.x];
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_755E0;
    v39[3] = &unk_2C3C50;
    v39[4] = self;
    +[UIView performWithoutAnimation:v39];
    int64_t v24 = (char *)[(NSMutableArray *)self->_cellContainerMatrix count];
    if ((uint64_t)v24 >= 1)
    {
      for (int i = 0; i != v24; ++i)
      {
        id v26 = [(NSMutableArray *)self->_cellContainerMatrix objectAtIndex:i];
        long long v25 = (char *)[v26 count];
        if ((uint64_t)v25 >= 1)
        {
          for (j = 0; j != v25; ++j)
          {
            double v17 = [v26 objectAtIndex:j];
            int64_t v18 = [(IMGridView *)self indexForX:j Y:&i[[(IMGridView *)self rowRangeStart]]];
            uint64_t v33 = 0;
            id v34 = &v33;
            uint64_t v35 = 0x3032000000;
            uint64_t v36 = sub_7561C;
            v37 = sub_7562C;
            id v38 = 0;
            if (v18 != 0x7FFFFFFFFFFFFFFFLL)
            {
              int64_t v19 = v18;
              if (v18 < self->_numberOfItems)
              {
                uint64_t v20 = [(IMGridView *)self cellForIndex:v18];
                double v21 = (void *)v34[5];
                v34[5] = v20;

                if (v34[5]) {
                  goto LABEL_16;
                }
                v32[0] = _NSConcreteStackBlock;
                v32[1] = 3221225472;
                v32[2] = sub_75634;
                v32[3] = &unk_2C66C0;
                v32[4] = self;
                v32[5] = &v33;
                v32[6] = v19;
                +[UIView performWithoutAnimation:v32];
                [v17 setCellNotVisible:1];
                if (v34[5])
                {
LABEL_16:
                  v29[0] = _NSConcreteStackBlock;
                  v29[1] = 3221225472;
                  v29[2] = sub_756A8;
                  v29[3] = &unk_2C6758;
                  id v22 = v17;
                  id v30 = v22;
                  double v31 = &v33;
                  +[UIView performWithoutAnimation:v29];
                  [(NSMutableArray *)self->_visibleCells removeObject:v34[5]];
                  [(IMGridView *)self originForCellAtX:j Y:&i[[(IMGridView *)self rowRangeStart]]];
                  [v22 setOrigin:];
                }
              }
            }
            v27[0] = _NSConcreteStackBlock;
            v27[1] = 3221225472;
            v27[2] = sub_756BC;
            v27[3] = &unk_2C3C50;
            id v23 = v17;
            id v28 = v23;
            +[UIView performWithoutAnimation:v27];
            [v23 crossfadeWithDuration:a3];

            _Block_object_dispose(&v33, 8);
          }
        }
      }
    }
  }
}

- (void)cleanupAfterRotation
{
  if ((*((unsigned char *)&self->_gridFlags + 1) & 0x20) != 0
    && ([(IMGridView *)self isDecelerating] & 1) == 0)
  {
    double v3 = [(IMGridView *)self footerView];
    [v3 setAlpha:0.0];

    [(IMGridView *)self setHideFooterView:0];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_75930;
    v26[3] = &unk_2C3C50;
    v26[4] = self;
    +[UIView animateWithDuration:v26 animations:&stru_2C6778 completion:0.15];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v17 = 96;
    double v4 = self->_cellContainerMatrix;
    id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v23;
      do
      {
        for (int i = 0; i != v6; int i = (char *)i + 1)
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(v4);
          }
          double v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          long long v18 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          id v10 = v9;
          id v11 = [v10 countByEnumeratingWithState:&v18 objects:v27 count:16];
          if (v11)
          {
            id v12 = v11;
            uint64_t v13 = *(void *)v19;
            do
            {
              for (j = 0; j != v12; j = (char *)j + 1)
              {
                if (*(void *)v19 != v13) {
                  objc_enumerationMutation(v10);
                }
                int64_t v15 = *(void **)(*((void *)&v18 + 1) + 8 * (void)j);
                [v15 didFinishRotation:v17];
                [v15 removeFromSuperview];
              }
              id v12 = [v10 countByEnumeratingWithState:&v18 objects:v27 count:16];
            }
            while (v12);
          }
        }
        id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v22 objects:v28 count:16];
      }
      while (v6);
    }

    uint64_t v16 = *(Class *)((char *)&self->super.super.super.super.isa + v17);
    *(Class *)((char *)&self->super.super.super.super.isa + v17) = 0;

    *(_DWORD *)&self->_gridFlags &= ~0x2000u;
  }
}

- (void)setHideFooterView:(BOOL)a3
{
  BOOL v3 = a3;
  self->_BOOL hideFooterView = a3;
  id v4 = [(IMGridView *)self footerView];
  [v4 setHidden:v3];
}

- (void)_highlightSelectedCell
{
}

- (void)_cancelCellHighlight
{
}

- (id)cellAtPoint:(CGPoint)a3
{
  return -[IMGridView cellAtPoint:ensureSelectionRect:](self, "cellAtPoint:ensureSelectionRect:", 1, a3.x, a3.y);
}

- (id)cellAtPoint:(CGPoint)a3 ensureSelectionRect:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  [(IMGridView *)self contentSize];
  double v9 = v8;
  [(IMGridView *)self contentSize];
  double v11 = v10;
  [(IMGridView *)self gridInset];
  CGFloat v13 = v12 + 0.0;
  CGFloat v16 = v9 - (v14 + v15);
  v36.size.double height = v11 - (v12 + v17);
  v36.origin.double x = v14 + 0.0;
  v36.origin.double y = v13;
  v36.size.double width = v16;
  v34.double x = x;
  v34.double y = y;
  if (CGRectContainsPoint(v36, v34))
  {
    unint64_t v18 = [(IMGridView *)self numberOfColumns];
    [(IMGridView *)self cellSpacing];
    uint64_t v20 = (uint64_t)((v19 * 0.5 + y - self->_gridInset.top) / (v19 + self->_cellSize.height));
    uint64_t v22 = (uint64_t)((v21 * 0.5 + x - self->_gridInset.left) / (v21 + self->_cellSize.width));
    int64_t v23 = [(IMGridView *)self layoutDirection];
    uint64_t v24 = v18 + ~v22;
    if (v23 != 1) {
      uint64_t v24 = v22;
    }
    long long v25 = [(IMGridView *)self cellForIndex:v24 + v18 * v20];
    id v26 = v25;
    if (v4)
    {
      -[IMGridView convertPoint:toView:](self, "convertPoint:toView:", v25, x, y);
      CGFloat v28 = v27;
      CGFloat v30 = v29;
      [v25 selectionFrame];
      v35.double x = v28;
      v35.double y = v30;
      if (CGRectContainsPoint(v37, v35)) {
        id v26 = v25;
      }
      else {
        id v26 = 0;
      }
    }
    id v31 = v26;
  }
  else
  {
    id v31 = 0;
  }

  return v31;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([(IMGridView *)self isDecelerating] & 1) == 0
    && ([(IMGridView *)self isDragging] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_grabbedCell);

    if (!WeakRetained)
    {
      v17.receiver = self;
      v17.super_class = (Class)IMGridView;
      [(IMGridView *)&v17 touchesBegan:v6 withEvent:v7];
      double v9 = [v6 anyObject];
      [v9 locationInView:self];
      self->_grabPoint.double x = v10;
      self->_grabPoint.double y = v11;
      double v12 = -[IMGridView cellAtPoint:](self, "cellAtPoint:");
      if (v12)
      {
        if ((*(unsigned char *)&self->_gridFlags & 2) != 0)
        {
          int64_t v13 = [(IMGridView *)self indexForCell:v12];
          double v14 = [(IMGridView *)self delegate];
          id v15 = [v14 gridView:self willSelectItemAtIndex:v13];

          if ((id)v13 != v15)
          {
            if (v15 == (id)0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v16 = 0;
            }
            else
            {
              uint64_t v16 = [(IMGridView *)self cellForIndex:v15];
            }

            double v12 = (void *)v16;
          }
        }
      }
      [(IMGridView *)self _cancelCellHighlight];
      objc_storeStrong((id *)&self->_selectedCell, v12);
      if (v12
        && (![(IMGridView *)self isEditing] || ![(IMGridView *)self tapToSelectMode]))
      {
        [(IMGridView *)self performSelector:"_highlightSelectedCell" withObject:0 afterDelay:0.08];
      }
    }
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [v6 anyObject];
  [v8 locationInView:self];
  double v10 = v9;
  double v12 = v11;

  double v13 = v10 - self->_grabPoint.x;
  double v14 = -v13;
  if (v13 >= 0.0) {
    double v14 = v10 - self->_grabPoint.x;
  }
  if (v14 <= 25.0)
  {
    double v16 = v12 - self->_grabPoint.y;
    if (v16 < 0.0) {
      double v16 = -v16;
    }
    BOOL v15 = v16 > 25.0;
  }
  else
  {
    BOOL v15 = 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_grabbedCell);
  if (WeakRetained)
  {
    -[IMGridView _updateGrabbedCellLocation:](self, "_updateGrabbedCellLocation:", v10, v12);
    [(IMGridView *)self _autoscrollForCell:WeakRetained];
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)IMGridView;
    [(IMGridView *)&v19 touchesMoved:v6 withEvent:v7];
    if (v15)
    {
      [(IMGridView *)self _cancelCellHighlight];
      [(IMGridViewCell *)self->_selectedCell setHighlighted:0];
      selectedCell = self->_selectedCell;
      self->_selectedCell = 0;
    }
  }
}

- (void)cleanupGrabbedCell
{
  grabbedCellUniqueID = self->_grabbedCellUniqueID;
  self->_grabbedCellUniqueID = 0;

  [(IMGridView *)self setGrabbedCell:0];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(IMGridView *)self _cancelAutoscrollTimer];
  [(IMGridView *)self _cancelCellHighlight];
  [(IMGridViewCell *)self->_selectedCell setHighlighted:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_grabbedCell);
  double v9 = [(IMGridView *)self delegate];
  if (WeakRetained)
  {
    int64_t v10 = [(IMGridView *)self indexForCell:WeakRetained];
    [(IMGridView *)self cleanupGrabbedCell];
    if (self->_grabIndex != v10 && (*(unsigned char *)&self->_gridFlags & 0x10) != 0) {
      [v9 gridView:self reorderCellAtIndex:];
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)IMGridView;
    [(IMGridView *)&v13 touchesEnded:v6 withEvent:v7];
    if (self->_selectedCell)
    {
      $5B90CFA202BF1D20308DC9D3199A23B1 gridFlags = self->_gridFlags;
      if ((*(unsigned char *)&gridFlags & 4) != 0)
      {
        if ((*(unsigned char *)&gridFlags & 8) != 0)
        {
          [v9 gridView:self updateSelectedCell:self];
        }
        else if (![(IMGridView *)self isEditing] || ![(IMGridView *)self tapToSelectMode])
        {
          [(IMGridViewCell *)self->_selectedCell setHighlighted:1];
        }
        [v9 gridView:self didSelectItemAtIndex:[self indexForCell:self->_selectedCell]];
      }
    }
  }
  [(IMGridView *)self _cancelCellHighlight];
  selectedCell = self->_selectedCell;
  self->_selectedCell = 0;
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)IMGridView;
  [(IMGridView *)&v6 touchesCancelled:a3 withEvent:a4];
  [(IMGridView *)self _cancelCellHighlight];
  [(IMGridViewCell *)self->_selectedCell setHighlighted:0];
  selectedCell = self->_selectedCell;
  self->_selectedCell = 0;
}

- (void)animateDeletionOfCell:(id)a3
{
  if ((*(unsigned char *)&self->_gridFlags & 0x80) != 0)
  {
    int64_t v4 = [(IMGridView *)self indexForCell:a3];
    id v5 = [(IMGridView *)self delegate];
    [v5 gridView:self shouldDeleteItemAtIndex:v4];
  }
}

- (void)_autoscrollForCell:(id)a3
{
  self->_float autoscrollDistance = 0.0;
  [a3 frame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(IMGridView *)self bounds];
  v28.origin.double x = v12;
  v28.origin.double y = v13;
  v28.size.double width = v14;
  v28.size.double height = v15;
  v25.origin.double x = v5;
  v25.origin.double y = v7;
  v25.size.double width = v9;
  v25.size.double height = v11;
  if (!CGRectIntersectsRect(v25, v28)) {
    return;
  }
  double y = self->_grabPoint.y;
  [(IMGridView *)self bounds];
  float v17 = y - CGRectGetMinY(v26);
  [(IMGridView *)self bounds];
  double MaxY = CGRectGetMaxY(v27);
  if (v17 >= 84.0)
  {
    float v21 = (MaxY - self->_grabPoint.y) * 0.5;
    if (v21 >= 84.0)
    {
      float autoscrollDistance = self->_autoscrollDistance;
      goto LABEL_8;
    }
    -[IMGridView _autoscrollDistanceForProximityToEdge:](self, "_autoscrollDistanceForProximityToEdge:");
  }
  else
  {
    *(float *)&double MaxY = v17;
    [(IMGridView *)self _autoscrollDistanceForProximityToEdge:MaxY];
    float autoscrollDistance = -v19;
  }
  self->_float autoscrollDistance = autoscrollDistance;
LABEL_8:
  autoscrollTimer = self->_autoscrollTimer;
  if (autoscrollDistance == 0.0)
  {
    [(NSTimer *)autoscrollTimer invalidate];
    int64_t v23 = 0;
  }
  else
  {
    if (autoscrollTimer) {
      return;
    }
    int64_t v23 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_autoscrollTimerFired:" selector:0 userInfo:1 repeats:0.0166666667];
  }
  self->_autoscrollTimer = v23;

  _objc_release_x1();
}

- (float)_autoscrollDistanceForProximityToEdge:(float)a3
{
  return ceilf((float)(84.0 - a3) / 3.0);
}

- (void)_legalizeAutoscrollDistance
{
  [(IMGridView *)self contentOffset];
  float v4 = v3;
  float v5 = -v4;
  [(IMGridView *)self contentSize];
  double v7 = v6;
  [(IMGridView *)self bounds];
  double v9 = v8;
  [(IMGridView *)self contentOffset];
  float v11 = fmax(v7 - (v9 + v10), 0.0);
  uint64_t autoscrollDistance_low = LODWORD(self->_autoscrollDistance);
  if (*(float *)&autoscrollDistance_low < v5) {
    *(float *)&uint64_t autoscrollDistance_low = v5;
  }
  if (*(float *)&autoscrollDistance_low < v11) {
    float v11 = *(float *)&autoscrollDistance_low;
  }
  self->_float autoscrollDistance = v11;
}

- (void)_autoscrollTimerFired:(id)a3
{
  [(IMGridView *)self _legalizeAutoscrollDistance];
  [(IMGridView *)self contentOffset];
  -[IMGridView setContentOffset:](self, "setContentOffset:");
  double x = self->_grabPoint.x;
  double v5 = self->_grabPoint.y + self->_autoscrollDistance;

  -[IMGridView _updateGrabbedCellLocation:](self, "_updateGrabbedCellLocation:", x, v5);
}

- (void)_cancelAutoscrollTimer
{
  [(NSTimer *)self->_autoscrollTimer invalidate];
  autoscrollTimer = self->_autoscrollTimer;
  self->_autoscrollTimer = 0;
}

- (BOOL)tapToSelectMode
{
  return *((unsigned char *)&self->_gridFlags + 2) & 1;
}

- (void)setTapToSelectMode:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(IMGridView *)self tapToSelectMode] != a3)
  {
    if (v3) {
      int v5 = 0x10000;
    }
    else {
      int v5 = 0;
    }
    self->_$5B90CFA202BF1D20308DC9D3199A23B1 gridFlags = ($5B90CFA202BF1D20308DC9D3199A23B1)(*(_DWORD *)&self->_gridFlags & 0xFFFEFFFF | v5);
    [(IMGridView *)self reloadData];
  }
}

- (BOOL)isEditing
{
  return (*((unsigned __int8 *)&self->_gridFlags + 1) >> 6) & 1;
}

- (void)setEditing:(BOOL)a3
{
  if (((((*(_DWORD *)&self->_gridFlags & 0x4000) == 0) ^ a3) & 1) == 0)
  {
    BOOL v3 = a3;
    if (a3) {
      int v5 = 0x4000;
    }
    else {
      int v5 = 0;
    }
    self->_$5B90CFA202BF1D20308DC9D3199A23B1 gridFlags = ($5B90CFA202BF1D20308DC9D3199A23B1)(*(_DWORD *)&self->_gridFlags & 0xFFFFBFFF | v5);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    double v6 = self->_visibleCells;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        for (int i = 0; i != v8; int i = (char *)i + 1)
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * i) setEditing:v3, v11];
        }
        id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }

    [(IMGridView *)self reloadData];
  }
}

- (id)_cellWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  int v5 = (char *)[(IMGridView *)self rangeOfVisibleCells];
  if (v6 && (id v7 = v5, v8 = v6, v5 < &v5[v6]))
  {
    uint64_t v9 = 0;
    do
    {
      double v10 = [(IMGridView *)self dragAndDropDelegate];
      long long v11 = [v10 uniqueIdentifierForCellIndex:v7];

      if ([v4 isEqualToString:v11])
      {
        uint64_t v12 = [(IMGridView *)self cellForIndex:v7];

        uint64_t v9 = (void *)v12;
      }

      ++v7;
      --v8;
    }
    while (v8);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (int64_t)_dataSourceIndexFromReorderedIndex:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_grabbedCell);
  if (WeakRetained)
  {
    int64_t v6 = [(IMGridView *)self indexForCell:WeakRetained];
    grabIndedouble x = self->_grabIndex;
    if (v6 != a3)
    {
      BOOL v9 = v6 < a3 && grabIndex >= a3;
      int64_t v10 = a3 - v9;
      if (v6 > a3 && grabIndex <= a3) {
        int64_t v12 = a3 + 1;
      }
      else {
        int64_t v12 = a3;
      }
      if (v6 >= grabIndex) {
        grabIndedouble x = v12;
      }
      else {
        grabIndedouble x = v10;
      }
    }
  }
  else
  {
    grabIndedouble x = a3;
  }

  return grabIndex;
}

- (id)_dragInteraction:(id)a3 itemsForSession:(id)a4 atPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v9 = a3;
  id v10 = a4;
  long long v11 = -[IMGridView cellAtPoint:](self, "cellAtPoint:", x, y);
  if (!v11)
  {
    id v15 = 0;
    goto LABEL_44;
  }
  int64_t v12 = [(IMGridView *)self indexForCell:v11];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_grabbedCell);
  long long v45 = WeakRetained;
  if (WeakRetained) {
    BOOL v14 = v12 == [(IMGridView *)self indexForCell:WeakRetained];
  }
  else {
    BOOL v14 = 0;
  }
  long long v44 = [(IMGridView *)self delegate];
  double v16 = [(IMGridView *)self dragAndDropDelegate];
  int64_t v17 = [(IMGridView *)self _dataSourceIndexFromReorderedIndex:v12];
  unint64_t v18 = [v16 uniqueIdentifierForCellIndex:v17];
  id v15 = 0;
  if (!v18 || v14) {
    goto LABEL_43;
  }
  float v19 = [(IMGridView *)self draggedCellIDs];
  unsigned __int8 v20 = [v19 containsObject:v18];

  if (v20)
  {
    id v15 = 0;
    goto LABEL_43;
  }
  $5B90CFA202BF1D20308DC9D3199A23B1 gridFlags = self->_gridFlags;
  if ((*(_WORD *)&gridFlags & 0x200) != 0)
  {
    unsigned int v22 = [v44 gridView:self canReorderCellAtIndex:v17];
    if ((*(_DWORD *)&self->_gridFlags & 0x400) == 0) {
      goto LABEL_15;
    }
  }
  else
  {
    unsigned int v22 = 1;
    if ((*(_WORD *)&gridFlags & 0x400) == 0) {
      goto LABEL_15;
    }
  }
  if (!isPhone())
  {
    unsigned int v23 = [v44 gridView:self canDragCellAtIndex:v17];
    goto LABEL_17;
  }
LABEL_15:
  unsigned int v23 = 0;
LABEL_17:
  unsigned int v42 = v22;
  id v43 = v10;
  if ((v22 | v23) != 1)
  {
    id v15 = 0;
    goto LABEL_36;
  }
  uint64_t v24 = [(IMGridView *)self draggedCellIDs];
  long long v40 = (char *)[v24 count];

  id v41 = v9;
  [v16 dragItemsForDataSourceIndex:v17 cellIndex:v12 interaction:v9 session:v10];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v25 = [v15 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (!v25) {
    goto LABEL_31;
  }
  id v26 = v25;
  uint64_t v27 = *(void *)v47;
  do
  {
    CGRect v28 = 0;
    do
    {
      if (*(void *)v47 != v27) {
        objc_enumerationMutation(v15);
      }
      double v29 = [v16 uniqueIdentifierForDragItem:*(void *)(*((void *)&v46 + 1) + 8 * (void)v28) v40];
      if ([v29 length])
      {
        if (!v29) {
          goto LABEL_26;
        }
LABEL_25:
        uint64_t v33 = [(IMGridView *)self draggedCellIDs];
        [v33 addObject:v29];

        goto LABEL_26;
      }
      BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Views/IMGridView.m", 1814, (uint64_t)"-[IMGridView _dragInteraction:itemsForSession:atPoint:]", (uint64_t)"assetID.length", @"UIDragItem with no assetID encountered", v30, v31, v32, (uint64_t)v40);
      if (v29) {
        goto LABEL_25;
      }
LABEL_26:

      CGRect v28 = (char *)v28 + 1;
    }
    while (v26 != v28);
    id v34 = [v15 countByEnumeratingWithState:&v46 objects:v50 count:16];
    id v26 = v34;
  }
  while (v34);
LABEL_31:

  CGPoint v35 = [(IMGridView *)self draggedCellIDs];
  id v36 = [v35 count];

  if (v40 == (unsigned char *)&def_7D91C + 1 && (uint64_t)v36 >= 2) {
    [(IMGridView *)self _stopReordering:1];
  }
  id v9 = v41;
  [v16 dragInteraction:v41 session:v43 willAddItems:v15 forInteraction:0];
LABEL_36:
  CGRect v37 = [(IMGridView *)self draggedCellIDs];
  if ([v37 count] == (char *)&def_7D91C + 1) {
    unsigned int v38 = v42;
  }
  else {
    unsigned int v38 = 0;
  }

  if (!v45 && v38) {
    [(IMGridView *)self setGrabbedCell:v11];
  }
  id v10 = v43;
LABEL_43:

LABEL_44:

  return v15;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(IMGridView *)self pendingDropView];
  if (v8)
  {
    [(IMGridView *)self _showGrabbedCell];
    [v8 setHidden:1];
    [(IMGridView *)self setPendingDropView:0];
  }
  id v9 = [(IMGridView *)self pendingCancelView];
  id v10 = v9;
  if (v9)
  {
    [v9 setHidden:1];
    [(IMGridView *)self setPendingCancelView:0];
  }
  [v6 locationInView:self];
  long long v11 = -[IMGridView _dragInteraction:itemsForSession:atPoint:](self, "_dragInteraction:itemsForSession:atPoint:", v7, v6);

  return v11;
}

- (id)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v9 = a3;
  id v10 = a4;
  if (isPhone())
  {
    long long v11 = 0;
  }
  else
  {
    long long v11 = -[IMGridView _dragInteraction:itemsForSession:atPoint:](self, "_dragInteraction:itemsForSession:atPoint:", v9, v10, x, y);
  }

  return v11;
}

- (BOOL)dragInteraction:(id)a3 sessionAllowsMoveOperation:(id)a4
{
  return 1;
}

- (BOOL)dragInteraction:(id)a3 sessionIsRestrictedToDraggingApplication:(id)a4
{
  return 0;
}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_76E58;
  v9[3] = &unk_2C67A0;
  v9[4] = self;
  id v10 = a3;
  id v11 = a5;
  id v7 = v11;
  id v8 = v10;
  [a4 addCompletion:v9];
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(IMGridView *)self dragAndDropDelegate];
  int64_t v12 = [v11 dragInteraction:v10 previewForLiftingItem:v9 session:v8];

  return v12;
}

- (void)dragInteraction:(id)a3 session:(id)a4 willEndWithOperation:(unint64_t)a5
{
  if (a5 < 2 || !self->_draggingInsideApp) {
    -[IMGridView _stopReordering:](self, "_stopReordering:", 1, a4);
  }
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  id v11 = a3;
  id v8 = a4;
  if (a5 < 2 || !self->_draggingInsideApp) {
    [(IMGridView *)self _showGrabbedCell];
  }
  [(IMGridView *)self _stopReordering:0];
  id v9 = [(IMGridView *)self draggedCellIDs];
  [v9 removeAllObjects];

  id v10 = [(IMGridView *)self dragAndDropDelegate];
  [v10 dragInteraction:v11 session:v8 didEndWithOperation:a5];
}

- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(IMGridView *)self dragAndDropDelegate];
  [v11 dragInteraction:v10 item:v9 willAnimateCancelWithAnimator:v8];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_7711C;
  v12[3] = &unk_2C4EE0;
  v12[4] = self;
  [v8 addCompletion:v12];
}

- (id)dragInteraction:(id)a3 sessionForAddingItems:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  id v5 = a4;
  id v6 = BKMobileDragAndDropLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1EB0B4(v5, v6);
  }

  id v7 = [v5 firstObject];

  return v7;
}

- (void)dragInteraction:(id)a3 session:(id)a4 willAddItems:(id)a5 forInteraction:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  int64_t v12 = BKMobileDragAndDropLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 138412802;
    id v14 = v9;
    __int16 v15 = 2112;
    id v16 = v10;
    __int16 v17 = 2112;
    id v18 = v11;
    _os_log_debug_impl(&def_7D91C, v12, OS_LOG_TYPE_DEBUG, "interaction: %@ session: %@ willAddItems: %@", (uint8_t *)&v13, 0x20u);
  }

  [(IMGridView *)self _showGrabbedCell];
}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [(IMGridView *)self dragAndDropDelegate];
  id v10 = [v9 dragInteraction:v8 previewForLiftingItem:v7 session:0];

  id v11 = [v10 view];
  [(IMGridView *)self setPendingCancelView:v11];

  return v10;
}

- (id)_dropOperationForInteraction:(id)a3 session:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(IMGridView *)self dragAndDropDelegate];
  id v9 = [v8 dropProposalForInteraction:v7 session:v6];

  return v9;
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(IMGridView *)self dragAndDropDelegate];
  unsigned __int8 v9 = [v8 dropInteraction:v7 canHandleSession:v6];

  return v9;
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  id v5 = a4;
  self->_draggingInsideApp = 1;
  [v5 locationInView:self];
  double v7 = v6;
  double v9 = v8;
  id v10 = BKMobileDragAndDropLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1EB14C(v7, v9);
  }
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 locationInView:self];
  double v9 = v8;
  double v11 = v10;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_grabbedCell);
  if (WeakRetained)
  {
    -[IMGridView _updateGrabbedCellLocation:](self, "_updateGrabbedCellLocation:", v9, v11);
    [(IMGridView *)self _autoscrollForCell:WeakRetained];
  }
  int v13 = [(IMGridView *)self _dropOperationForInteraction:v6 session:v7];
  [v13 setPrefersFullSizePreview:1];

  return v13;
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  id v5 = a4;
  [v5 locationInView:self];
  double v7 = v6;
  double v9 = v8;
  double v10 = BKMobileDragAndDropLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1EB1DC(v7, v9);
  }

  [(IMGridView *)self _cancelAutoscrollTimer];
  self->_draggingInsideApp = 0;
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_grabbedCell);
  if (!WeakRetained)
  {
    double v10 = [(IMGridView *)self dragAndDropDelegate];
    [v10 performDropForInteraction:v11 session:v6];
    goto LABEL_6;
  }
  int64_t v8 = [(IMGridView *)self indexForCell:WeakRetained];
  if (self->_grabIndex != v8 && (*(unsigned char *)&self->_gridFlags & 0x10) != 0)
  {
    int64_t v9 = v8;
    double v10 = [(IMGridView *)self delegate];
    [v10 gridView:self reorderCellAtIndex:self->_grabIndex toIndex:v9];
LABEL_6:
  }
}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(IMGridView *)self dragAndDropDelegate];
  int64_t v12 = [v11 dropInteraction:v10 previewForDroppingItem:v9 withDefault:v8];

  int v13 = [v12 view];
  [(IMGridView *)self setPendingDropView:v13];

  return v12;
}

- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_77840;
  v5[3] = &unk_2C4EE0;
  v5[4] = self;
  [a5 addCompletion:v5 a4];
}

- (void)_hideGrabbedCell
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_grabbedCell);
  if (WeakRetained && (*(unsigned char *)&self->_gridFlags & 0x20) != 0)
  {
    id v5 = WeakRetained;
    id v4 = [(IMGridView *)self delegate];
    [v4 gridView:self willGrabCell:v5];

    id WeakRetained = v5;
  }
}

- (void)_showGrabbedCell
{
  if ((*(unsigned char *)&self->_gridFlags & 0x40) != 0)
  {
    id v3 = [(IMGridView *)self delegate];
    [v3 gridViewDidReleaseGrabbedCell:self];
  }
}

- (void)_stopReordering:(BOOL)a3
{
  BOOL v3 = a3;
  [(IMGridView *)self _cancelAutoscrollTimer];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_grabbedCell);
  grabIndedouble x = self->_grabIndex;
  [(IMGridView *)self cleanupGrabbedCell];
  if (v3) {
    [(IMGridView *)self _restoreGrabbedCell:WeakRetained toOriginalGrabIndex:grabIndex];
  }
  [(IMGridView *)self _cancelCellHighlight];
  [(IMGridViewCell *)self->_selectedCell setHighlighted:0];
  selectedCell = self->_selectedCell;
  self->_selectedCell = 0;
}

- (void)setGrabbedCell:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_grabbedCell);
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_grabbedCell, obj);
    if (obj)
    {
      [(IMGridView *)self setScrollEnabled:0];
      self->_grabIndedouble x = [(IMGridView *)self indexForCell:obj];
      id v5 = [(IMGridView *)self dragAndDropDelegate];
      id v6 = [v5 uniqueIdentifierForCellIndex:self->_grabIndex];
      [(IMGridView *)self setGrabbedCellUniqueID:v6];

      [obj setGrabbed:1];
    }
    else
    {
      [(IMGridView *)self beginUpdates];
      [WeakRetained setGrabbed:0];
      [(IMGridView *)self setScrollEnabled:1];
      [(IMGridView *)self endUpdates];
    }
  }
}

- (void)_swapGrabbedCell:(id)a3 withOtherCell:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [(IMGridView *)self indexForCell:v6];
  int64_t v9 = [(IMGridView *)self indexForCell:v7];
  if (v8 != v9)
  {
    int64_t v10 = v9;
    if (v9 > v8) {
      uint64_t v11 = -1;
    }
    else {
      uint64_t v11 = 1;
    }
    if (v9 > v8) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = -1;
    }
    int64_t v13 = v8 + v12;
    if (v13 != v9)
    {
      do
      {
        id v14 = [(IMGridView *)self visibleCellForIndex:v13];
        [v14 setTag:[v14 tag] + v11];

        v13 += v12;
      }
      while (v10 != v13);
    }
    [v6 setTag:v10 + 10000];
    [v7 setTag:[v7 tag] - v12];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_77CBC;
    v15[3] = &unk_2C3C50;
    v15[4] = self;
    +[UIView animateWithDuration:v15 animations:0.3];
  }
}

- (void)_restoreGrabbedCell:(id)a3 toOriginalGrabIndex:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = [(IMGridView *)self indexForCell:v6];
  BOOL v8 = v7 != a4 && v6 != 0;
  if (v7 > a4) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = -1;
  }
  if (v7 > a4) {
    uint64_t v10 = -1;
  }
  else {
    uint64_t v10 = 1;
  }
  if (v8)
  {
    for (int64_t i = v7 + v10; a4 != i; i += v10)
    {
      uint64_t v12 = [(IMGridView *)self visibleCellForIndex:i];
      [v12 setTag:[v12 tag] + v9];
    }
    int64_t v13 = [(IMGridView *)self visibleCellForIndex:a4];
    [v13 setTag:[v13 tag] + v9];
    [v6 setTag:a4 + 10000];
  }
  [(IMGridView *)self rectForCellAtIndex:a4];
  [v6 setFrame:];
  [v6 setAlpha:0.0];
  [(IMGridView *)self _showGrabbedCell];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_77E60;
  v15[3] = &unk_2C40C0;
  BOOL v18 = v8;
  id v16 = v6;
  __int16 v17 = self;
  id v14 = v6;
  +[UIView animateWithDuration:v15 animations:0.3];
}

- (void)_updateGrabbedCellLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_grabbedCell);
  [WeakRetained frame];
  double v8 = v7 + y - self->_grabPoint.y;
  [WeakRetained setFrame:v6 + x - self->_grabPoint.x, v8];
  self->_grabPoint.double x = x;
  self->_grabPoint.double y = y;
  -[IMGridView cellAtPoint:ensureSelectionRect:](self, "cellAtPoint:ensureSelectionRect:", 0, x, y);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!v9 && v8 > 0.0)
  {
    id v9 = [(IMGridView *)self visibleCellForIndex:self->_numberOfItems - 1];
  }
  if (v9 != WeakRetained && v9 != 0) {
    [(IMGridView *)self _swapGrabbedCell:WeakRetained withOtherCell:v9];
  }
}

- (IMGridViewDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (IMGridViewDataSource *)WeakRetained;
}

- (BOOL)tapAndHoldToReorder
{
  return self->_tapAndHoldToReorder;
}

- (void)setTapAndHoldToReorder:(BOOL)a3
{
  self->_tapAndHoldToReorder = a3;
}

- (BOOL)jiggleWhenEditing
{
  return self->_jiggleWhenEditing;
}

- (void)setJiggleWhenEditing:(BOOL)a3
{
  self->_jiggleWhenEditing = a3;
}

- (double)grabTimerDelayEditing
{
  return self->_grabTimerDelayEditing;
}

- (void)setGrabTimerDelayEditing:(double)a3
{
  self->_grabTimerDelayEditing = a3;
}

- (double)grabTimerDelayNotEditing
{
  return self->_grabTimerDelayNotEditing;
}

- (void)setGrabTimerDelayNotEditing:(double)a3
{
  self->_grabTimerDelayNotEditing = a3;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (void)setLayoutDirection:(int64_t)a3
{
  self->_layoutDirection = a3;
}

- (UIView)gridViewHeader
{
  return self->_gridViewHeader;
}

- (CGSize)cellSize
{
  double width = self->_cellSize.width;
  double height = self->_cellSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCellSize:(CGSize)a3
{
  self->_cellSize = a3;
}

- (CGSize)minimumGridSpacing
{
  double width = self->_minimumGridSpacing.width;
  double height = self->_minimumGridSpacing.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMinimumGridSpacing:(CGSize)a3
{
  self->_minimumGridSpacing = a3;
}

- (UIEdgeInsets)gridInset
{
  double top = self->_gridInset.top;
  double left = self->_gridInset.left;
  double bottom = self->_gridInset.bottom;
  double right = self->_gridInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setGridInset:(UIEdgeInsets)a3
{
  self->_gridInset = a3;
}

- (UIEdgeInsets)visibleRegionInsets
{
  double top = self->_visibleRegionInsets.top;
  double left = self->_visibleRegionInsets.left;
  double bottom = self->_visibleRegionInsets.bottom;
  double right = self->_visibleRegionInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setVisibleRegionInsets:(UIEdgeInsets)a3
{
  self->_visibleRegionInsets = a3;
}

- (IMGridViewCell)grabbedCell
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_grabbedCell);

  return (IMGridViewCell *)WeakRetained;
}

- (BKLibraryDragAndDropDelegate)dragAndDropDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dragAndDropDelegate);

  return (BKLibraryDragAndDropDelegate *)WeakRetained;
}

- (void)setDragAndDropDelegate:(id)a3
{
}

- (NSMutableSet)draggedCellIDs
{
  return self->_draggedCellIDs;
}

- (void)setDraggedCellIDs:(id)a3
{
}

- (BOOL)draggingInsideApp
{
  return self->_draggingInsideApp;
}

- (void)setDraggingInsideApp:(BOOL)a3
{
  self->_draggingInsideApp = a3;
}

- (NSString)grabbedCellUniqueID
{
  return self->_grabbedCellUniqueID;
}

- (void)setGrabbedCellUniqueID:(id)a3
{
}

- (UIView)pendingDropView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pendingDropView);

  return (UIView *)WeakRetained;
}

- (void)setPendingDropView:(id)a3
{
}

- (UIView)pendingCancelView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pendingCancelView);

  return (UIView *)WeakRetained;
}

- (void)setPendingCancelView:(id)a3
{
}

- (UIView)footerView
{
  return self->_footerView;
}

- (void)setFooterView:(id)a3
{
}

- (BOOL)hidingCells
{
  return self->_hidingCells;
}

- (void)setHidingCells:(BOOL)a3
{
  self->_hidingCells = a3;
}

- (BOOL)hideFooterView
{
  return self->_hideFooterView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_destroyWeak((id *)&self->_pendingCancelView);
  objc_destroyWeak((id *)&self->_pendingDropView);
  objc_storeStrong((id *)&self->_grabbedCellUniqueID, 0);
  objc_storeStrong((id *)&self->_draggedCellIDs, 0);
  objc_destroyWeak((id *)&self->_dragAndDropDelegate);
  objc_destroyWeak((id *)&self->_grabbedCell);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_cellsForReuse, 0);
  objc_storeStrong((id *)&self->_gridViewHeader, 0);
  objc_storeStrong((id *)&self->_cellsToDelete, 0);
  objc_storeStrong((id *)&self->_reloadItems, 0);
  objc_storeStrong((id *)&self->_deleteItems, 0);
  objc_storeStrong((id *)&self->_insertItems, 0);
  objc_storeStrong((id *)&self->_autoscrollTimer, 0);
  objc_storeStrong((id *)&self->_cellContainerMatrix, 0);
  objc_storeStrong((id *)&self->_selectedCell, 0);
  objc_storeStrong((id *)&self->_reusableCells, 0);

  objc_storeStrong((id *)&self->_visibleCells, 0);
}

@end