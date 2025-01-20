@interface PXBaseMessagesStackView
+ (unsigned)accessoryMediaKind;
+ (unsigned)itemMediaKind;
- (BOOL)contentChangedForItemBeforeDataSource:(id)a3 beforeIndexPath:(PXSimpleIndexPath *)a4 afterDataSource:(id)a5 afterIndexPath:(PXSimpleIndexPath *)a6;
- (BOOL)debugColorModeEnabled;
- (BOOL)isSettled;
- (BOOL)scrollToIndex:(unint64_t)a3 animated:(BOOL)a4;
- (BOOL)scrollToObjectReference:(id)a3 animated:(BOOL)a4;
- (BOOL)selectionOverlayEnabled;
- (BOOL)useAspectTiles;
- (Class)viewClassForAccessoryItemAtIndex:(int64_t)a3;
- (Class)viewClassForItemAtIndex:(int64_t)a3 inStackLayout:(id)a4;
- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inDecoratingLayout:(id)a4;
- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (PXBaseMessagesStackView)initWithCoder:(id)a3;
- (PXBaseMessagesStackView)initWithFrame:(CGRect)a3;
- (PXGView)tungstenView;
- (PXMessagesStackItemsLayout)layout;
- (PXSectionedDataSource)currentDataSource;
- (PXSectionedDataSourceManager)dataSourceManager;
- (PXSectionedObjectReference)currentObjectReference;
- (UIPanGestureRecognizer)panGestureRecognizer;
- (double)alphaForShadowAtSpriteIndex:(unsigned int)a3 inLayout:(id)a4;
- (double)cornerRadiusForShadowSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (double)horizontalContentMargin;
- (double)horizontalContentMarginForSize:(CGSize)a3;
- (double)leftEdgeHorizontalContentMarginAdjustment;
- (double)rightEdgeHorizontalContentMarginAdjustment;
- (double)solidColorOverlayAlphaForSpriteIndex:(unsigned int)a3 inLayout:(id)a4;
- (double)verticalContentInsets;
- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)shadowForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)solidColorOverlayForLayout:(id)a3;
- (id)viewUserDataForAccessoryItemAtIndex:(int64_t)a3;
- (id)viewUserDataForItemAtIndex:(int64_t)a3 inStackLayout:(id)a4;
- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inDecoratingLayout:(id)a4;
- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (int64_t)horizontalAlignment;
- (int64_t)numberOfAccessoryItems;
- (unint64_t)currentIndex;
- (void)_updateDataSource;
- (void)layoutSubviews;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)outputEventSignaledForCoalescer:(id)a3;
- (void)primaryItemDidChangeForStackItemsLayout:(id)a3;
- (void)registerAllTextureProvidersWithMediaProvider:(id)a3;
- (void)reloadAccessoryItems;
- (void)scrollViewControllerDidEndScrolling:(id)a3;
- (void)scrollViewControllerDidLayoutSubviews:(id)a3;
- (void)scrollViewControllerWillBeginScrolling:(id)a3;
- (void)scrollViewControllerWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5 currentContentOffset:(CGPoint)a6;
- (void)setCurrentDataSource:(id)a3;
- (void)setDataSourceManager:(id)a3;
- (void)setDebugColorModeEnabled:(BOOL)a3;
- (void)setHorizontalAlignment:(int64_t)a3;
- (void)setLeftEdgeHorizontalContentMarginAdjustment:(double)a3;
- (void)setNumberOfAccessoryItems:(int64_t)a3;
- (void)setRightEdgeHorizontalContentMarginAdjustment:(double)a3;
- (void)setSelectionOverlayEnabled:(BOOL)a3;
- (void)setSettled:(BOOL)a3;
- (void)setUseAspectTiles:(BOOL)a3;
- (void)setVerticalContentInsets:(double)a3;
@end

@implementation PXBaseMessagesStackView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDataSource, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_tungstenView, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_settledEventCoalescer, 0);
  objc_storeStrong((id *)&self->_centerItemShadow, 0);
  objc_storeStrong((id *)&self->_decoratingLayout, 0);
}

- (BOOL)isSettled
{
  return self->_settled;
}

- (PXSectionedDataSource)currentDataSource
{
  return self->_currentDataSource;
}

- (BOOL)debugColorModeEnabled
{
  return self->_debugColorModeEnabled;
}

- (PXMessagesStackItemsLayout)layout
{
  return self->_layout;
}

- (PXGView)tungstenView
{
  return self->_tungstenView;
}

- (int64_t)horizontalAlignment
{
  return self->_horizontalAlignment;
}

- (void)setUseAspectTiles:(BOOL)a3
{
  self->_useAspectTiles = a3;
}

- (BOOL)useAspectTiles
{
  return self->_useAspectTiles;
}

- (BOOL)selectionOverlayEnabled
{
  return self->_selectionOverlayEnabled;
}

- (double)verticalContentInsets
{
  return self->_verticalContentInsets;
}

- (PXSectionedDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (void)outputEventSignaledForCoalescer:(id)a3
{
}

- (void)scrollViewControllerDidLayoutSubviews:(id)a3
{
  int64_t indexToRestore = self->_indexToRestore;
  if (indexToRestore != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(PXBaseMessagesStackView *)self scrollToIndex:indexToRestore animated:0];
    self->_int64_t indexToRestore = 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (void)scrollViewControllerDidEndScrolling:(id)a3
{
}

- (void)scrollViewControllerWillBeginScrolling:(id)a3
{
  [(PXBaseMessagesStackView *)self setSettled:0];
  [(PXMessagesStackItemsLayout *)self->_layout setIsSettling:0];
  [(PXEventCoalescer *)self->_settledEventCoalescer cancel];
  [(PXBaseMessagesStackView *)self willBeginScrolling];
}

- (void)scrollViewControllerWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5 currentContentOffset:(CGPoint)a6
{
  double x = a4.x;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v9 = +[PXMessagesUISettings sharedInstance];
  uint64_t v10 = [v9 pagingBehavior];
  [(PXBaseMessagesStackView *)self bounds];
  double v12 = v11;
  [v9 pagingVelocityThreshold];
  switch(v10)
  {
    case 1:
      double v17 = a5->x;
      layout = self->_layout;
      goto LABEL_12;
    case 2:
      double v19 = v13 * (v12 / 355.0);
      [(PXGLayout *)self->_layout visibleRect];
      if (x < -v19)
      {
        -[PXMessagesStackItemsLayout pageOffsetLessThanOffset:](self->_layout, "pageOffsetLessThanOffset:");
LABEL_13:
        a5->double x = v20;
        break;
      }
      layout = self->_layout;
      if (x > v19)
      {
        -[PXMessagesStackItemsLayout pageOffsetGreaterThanOffset:](layout, "pageOffsetGreaterThanOffset:");
        goto LABEL_13;
      }
LABEL_12:
      [(PXMessagesStackItemsLayout *)layout closestPageOffsetForHorizontalOffset:v17];
      goto LABEL_13;
    case 3:
      [(PXGLayout *)self->_layout visibleRect];
      double v15 = v14;
      if (x <= 0.0)
      {
        v21 = self->_layout;
        if (x < 0.0) {
          -[PXMessagesStackItemsLayout pageOffsetLessThanOffset:](v21, "pageOffsetLessThanOffset:");
        }
        else {
          -[PXMessagesStackItemsLayout closestPageOffsetForHorizontalOffset:](v21, "closestPageOffsetForHorizontalOffset:");
        }
      }
      else
      {
        [(PXMessagesStackItemsLayout *)self->_layout pageOffsetGreaterThanOffset:v14];
      }
      CGFloat v22 = v16;
      v23 = PLUIGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        CGFloat v24 = a5->x;
        int v25 = 134218752;
        double v26 = v15;
        __int16 v27 = 2048;
        CGFloat v28 = v24;
        __int16 v29 = 2048;
        CGFloat v30 = v22;
        __int16 v31 = 2048;
        double v32 = x;
        _os_log_impl(&dword_1A9AE7000, v23, OS_LOG_TYPE_DEBUG, "Settling nearest clamped. Current (%lf). Proposed (%lf). Final (%lf). Velocity (%lf).", (uint8_t *)&v25, 0x2Au);
      }

      a5->double x = v22;
      break;
  }
  [(PXMessagesStackItemsLayout *)self->_layout setIsSettling:1];
}

- (id)viewUserDataForAccessoryItemAtIndex:(int64_t)a3
{
}

- (id)viewUserDataForItemAtIndex:(int64_t)a3 inStackLayout:(id)a4
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  PXAssertGetLog();
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inDecoratingLayout:(id)a4
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  PXAssertGetLog();
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v6 = (PXGDecoratingLayout *)a4;
  if (self->_decoratingLayout == v6)
  {
    uint64_t v15 = [(PXBaseMessagesStackView *)self viewUserDataForSpriteAtIndex:v4 inDecoratingLayout:v6];
LABEL_6:
    double v16 = (void *)v15;
    goto LABEL_9;
  }
  v7 = [(PXBaseMessagesStackView *)self layout];

  v8 = [(PXBaseMessagesStackView *)self layout];
  v9 = v8;
  if (v7 != v6)
  {
    uint64_t v10 = [v8 convertSpriteIndex:v4 fromDescendantLayout:v6];

    double v11 = [(PXBaseMessagesStackView *)self layout];
    uint64_t v12 = [v11 accessoryItemForSpriteIndex:v10];

    double v13 = [(PXBaseMessagesStackView *)self layout];
    uint64_t v14 = [v13 numberOfAccessoryItems];

    if (v12 >= v14) {
      PXAssertGetLog();
    }
    uint64_t v15 = [(PXBaseMessagesStackView *)self viewUserDataForAccessoryItemAtIndex:v12];
    goto LABEL_6;
  }
  uint64_t v17 = [v8 itemForSpriteIndex:v4];

  v18 = [(PXBaseMessagesStackView *)self layout];
  double v16 = [(PXBaseMessagesStackView *)self viewUserDataForItemAtIndex:v17 inStackLayout:v18];

LABEL_9:
  return v16;
}

- (Class)viewClassForAccessoryItemAtIndex:(int64_t)a3
{
}

- (Class)viewClassForItemAtIndex:(int64_t)a3 inStackLayout:(id)a4
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  PXAssertGetLog();
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inDecoratingLayout:(id)a4
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  PXAssertGetLog();
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v6 = (PXGDecoratingLayout *)a4;
  if (self->_decoratingLayout == v6)
  {
    uint64_t v15 = [(PXBaseMessagesStackView *)self viewClassForSpriteAtIndex:v4 inDecoratingLayout:v6];
LABEL_6:
    double v16 = (void *)v15;
    goto LABEL_9;
  }
  v7 = [(PXBaseMessagesStackView *)self layout];

  v8 = [(PXBaseMessagesStackView *)self layout];
  v9 = v8;
  if (v7 != v6)
  {
    uint64_t v10 = [v8 convertSpriteIndex:v4 fromDescendantLayout:v6];

    double v11 = [(PXBaseMessagesStackView *)self layout];
    uint64_t v12 = [v11 accessoryItemForSpriteIndex:v10];

    double v13 = [(PXBaseMessagesStackView *)self layout];
    uint64_t v14 = [v13 numberOfAccessoryItems];

    if (v12 >= v14) {
      PXAssertGetLog();
    }
    uint64_t v15 = [(PXBaseMessagesStackView *)self viewClassForAccessoryItemAtIndex:v12];
    goto LABEL_6;
  }
  uint64_t v17 = [v8 itemForSpriteIndex:v4];

  v18 = [(PXBaseMessagesStackView *)self layout];
  double v16 = [(PXBaseMessagesStackView *)self viewClassForItemAtIndex:v17 inStackLayout:v18];

LABEL_9:
  return (Class)v16;
}

- (double)alphaForShadowAtSpriteIndex:(unsigned int)a3 inLayout:(id)a4
{
  [(PXMessagesStackItemsLayout *)self->_layout primaryItemFocus];
  return 1.0 - v4;
}

- (double)cornerRadiusForShadowSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 20.0;
}

- (id)shadowForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  unsigned int v11 = -1;
  if ([v6 isSpriteIndex:v4 decoratingSpriteWithIndex:&v11]
    && (uint64_t v7 = [v6 convertSpriteIndex:v11 toDescendantLayout:self->_layout], v7 != -1)
    && (int64_t v8 = [(PXGItemsLayout *)self->_layout itemForSpriteIndex:v7],
        v8 == [(PXMessagesStackItemsLayout *)self->_layout primaryItemIndex]))
  {
    v9 = self->_centerItemShadow;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (double)solidColorOverlayAlphaForSpriteIndex:(unsigned int)a3 inLayout:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  BOOL v6 = [(PXBaseMessagesStackView *)self selectionOverlayEnabled];
  layout = self->_layout;
  if (v6)
  {
    [(PXMessagesStackItemsLayout *)layout selectionOverlayAlphaForSpriteIndex:v4];
  }
  else
  {
    [(PXMessagesStackItemsLayout *)layout overlayAlphaForSpriteIndex:v4];
  }
  return result;
}

- (id)solidColorOverlayForLayout:(id)a3
{
  if ([(PXBaseMessagesStackView *)self selectionOverlayEnabled]) {
    [MEMORY[0x1E4FB1618] colorWithRed:0.807843137 green:0.807843137 blue:0.823529412 alpha:1.0];
  }
  else {
  v3 = [MEMORY[0x1E4FB1618] blackColor];
  }
  return v3;
}

- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  BOOL v6 = (PXMessagesStackItemsLayout *)a4;
  uint64_t v7 = v6;
  if (self->_layout == v6)
  {
    unint64_t v9 = [(PXGItemsLayout *)v6 itemForSpriteIndex:v4];
    if (colorAtIndex_inLayout__onceToken != -1) {
      dispatch_once(&colorAtIndex_inLayout__onceToken, &__block_literal_global_76519);
    }
    unint64_t v10 = [(id)colorAtIndex_inLayout__colors count];
    uint64_t v8 = [(id)colorAtIndex_inLayout__colors objectAtIndexedSubscript:v9 % v10];
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4FB1618] blueColor];
  }
  unsigned int v11 = (void *)v8;

  return v11;
}

void __49__PXBaseMessagesStackView_colorAtIndex_inLayout___block_invoke()
{
  v9[7] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4FB1618] redColor];
  v1 = objc_msgSend(MEMORY[0x1E4FB1618], "orangeColor", v0);
  v9[1] = v1;
  v2 = [MEMORY[0x1E4FB1618] yellowColor];
  v9[2] = v2;
  v3 = [MEMORY[0x1E4FB1618] greenColor];
  v9[3] = v3;
  uint64_t v4 = [MEMORY[0x1E4FB1618] systemBlueColor];
  v9[4] = v4;
  v5 = [MEMORY[0x1E4FB1618] systemIndigoColor];
  v9[5] = v5;
  BOOL v6 = [MEMORY[0x1E4FB1618] systemPurpleColor];
  v9[6] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:7];
  uint64_t v8 = (void *)colorAtIndex_inLayout__colors;
  colorAtIndex_inLayout__colors = v7;
}

- (void)primaryItemDidChangeForStackItemsLayout:(id)a3
{
  id v13 = [(PXBaseMessagesStackView *)self currentDataSource];
  unint64_t v4 = [(PXBaseMessagesStackView *)self currentIndex];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL || (int64_t v5 = v4, [v13 numberOfItemsInSection:0] <= v4))
  {
    int64_t v6 = *(void *)off_1E5DAB028;
    int64_t v7 = *((void *)off_1E5DAB028 + 1);
    int64_t v5 = *((void *)off_1E5DAB028 + 2);
    int64_t v8 = *((void *)off_1E5DAB028 + 3);
  }
  else
  {
    int64_t v6 = [v13 identifier];
    int64_t v7 = 0;
    int64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  int64_t dataSourceIdentifier = self->_lastKnownPrimaryIndex.dataSourceIdentifier;
  if (dataSourceIdentifier == *(void *)off_1E5DAAED8) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = dataSourceIdentifier != v6
  }
       || self->_lastKnownPrimaryIndex.section != v7
       || self->_lastKnownPrimaryIndex.item != v5
       || self->_lastKnownPrimaryIndex.subitem != v8;
  self->_lastKnownPrimaryIndex.int64_t dataSourceIdentifier = v6;
  self->_lastKnownPrimaryIndex.section = v7;
  self->_lastKnownPrimaryIndex.item = v5;
  self->_lastKnownPrimaryIndex.subitem = v8;
  [(PXBaseMessagesStackView *)self primaryItemDidChange:self->_isProgramaticallyScrolling didChangeIndex:v10];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)DataSourceManagerObservationContext_76522 != a5)
  {
    BOOL v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXBaseMessagesStackView.m" lineNumber:444 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if (v6)
  {
    id v11 = v9;
    [(PXBaseMessagesStackView *)self _updateDataSource];
    id v9 = v11;
  }
}

- (void)_updateDataSource
{
  v3 = [(PXBaseMessagesStackView *)self currentDataSource];
  unint64_t v4 = [(PXBaseMessagesStackView *)self dataSourceManager];
  int64_t v5 = [v4 dataSource];

  if (v3 != v5)
  {
    char v6 = [(PXBaseMessagesStackView *)self dataSourceManager];
    int64_t v7 = [v6 allChangeDetailsFromDataSource:v3 toDataSource:v5];

    long long v8 = *(_OWORD *)&self->_lastKnownPrimaryIndex.item;
    long long v23 = *(_OWORD *)&self->_lastKnownPrimaryIndex.dataSourceIdentifier;
    long long v24 = v8;
    [off_1E5DA8488 indexPathAfterApplyingChanges:v7 toIndexPath:&v23 hasIncrementalChanges:0 objectChanged:0];
    long long v9 = v26;
    *(_OWORD *)&self->_lastKnownPrimaryIndex.int64_t dataSourceIdentifier = v25;
    *(_OWORD *)&self->_lastKnownPrimaryIndex.item = v9;
    uint64_t v10 = [v3 numberOfItemsInSection:0];
    int64_t indexToRestore = self->_indexToRestore;
    if (indexToRestore == 0x7FFFFFFFFFFFFFFFLL) {
      int64_t indexToRestore = [(PXBaseMessagesStackView *)self currentIndex];
    }
    if (indexToRestore == 0x7FFFFFFFFFFFFFFFLL || indexToRestore < v10)
    {
      if (indexToRestore == 0x7FFFFFFFFFFFFFFFLL)
      {
        if ([v5 numberOfItemsInSection:0] <= 0) {
          int64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          int64_t v13 = 0;
        }
      }
      else
      {
        uint64_t v14 = [v3 identifier];
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = (unint64_t)v14;
        *(void *)&long long v24 = indexToRestore;
        *((void *)&v24 + 1) = 0x7FFFFFFFFFFFFFFFLL;
        [off_1E5DA8488 indexPathAfterApplyingChanges:v7 toIndexPath:&v23 hasIncrementalChanges:0 objectChanged:0];
        if ((void)v25 == *(void *)off_1E5DAAED8)
        {
          uint64_t v15 = [v5 numberOfItemsInSection:0];
          int64_t v13 = v15 - 1;
          if (v15 <= 0) {
            int64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
          }
          if (indexToRestore < v15) {
            int64_t v13 = indexToRestore;
          }
        }
        else
        {
          int64_t v13 = v26;
        }
      }
    }
    else
    {
      int64_t v13 = indexToRestore - v10 + [v5 numberOfItemsInSection:0];
    }
    self->_int64_t indexToRestore = v13;
    if (([v3 containsAnyItems] & 1) != 0
      && [v5 containsAnyItems]
      && [(PXGLayout *)self->_layout appearState] == 1)
    {
      double v16 = [(PXGLayout *)self->_layout createDefaultAnimationForCurrentContext];
      uint64_t v17 = +[PXPhotosGridSettings sharedInstance];
      [v17 defaultAnimationDuration];
      objc_msgSend(v16, "setDuration:");
    }
    layout = self->_layout;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __44__PXBaseMessagesStackView__updateDataSource__block_invoke;
    v20[3] = &unk_1E5DB6E80;
    v20[4] = self;
    id v21 = v3;
    id v19 = v5;
    id v22 = v19;
    [(PXGLayout *)layout applySectionedChangeDetailsForSingleSection:v7 dataSourceBeforeChanges:v21 dataSourceAfterChanges:v19 changeMediaVersionHandler:v20];
    [(PXBaseMessagesStackView *)self setCurrentDataSource:v19];
  }
}

uint64_t __44__PXBaseMessagesStackView__updateDataSource__block_invoke(void *a1, _OWORD *a2, _OWORD *a3)
{
  v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  long long v6 = a2[1];
  v10[0] = *a2;
  v10[1] = v6;
  long long v7 = a3[1];
  v9[0] = *a3;
  v9[1] = v7;
  return [v3 contentChangedForItemBeforeDataSource:v4 beforeIndexPath:v10 afterDataSource:v5 afterIndexPath:v9];
}

- (void)setSettled:(BOOL)a3
{
  if (self->_settled != a3)
  {
    self->_settled = a3;
    [(PXBaseMessagesStackView *)self settledDidChange];
  }
}

- (void)setCurrentDataSource:(id)a3
{
  uint64_t v5 = (PXSectionedDataSource *)a3;
  if (self->_currentDataSource != v5)
  {
    long long v6 = v5;
    objc_storeStrong((id *)&self->_currentDataSource, a3);
    [(PXBaseMessagesStackView *)self currentDataSourceDidChange];
    [(PXBaseMessagesStackView *)self setNeedsLayout];
    uint64_t v5 = v6;
  }
}

- (void)registerAllTextureProvidersWithMediaProvider:(id)a3
{
  id v4 = a3;
  id v6 = [(PXBaseMessagesStackView *)self tungstenView];
  [v6 registerAllTextureProvidersWithMediaProvider:v4];

  uint64_t v5 = objc_alloc_init(PXGDecorationTextureProvider);
  [(PXGDecorationTextureProvider *)v5 setOverlayViewSource:self];
  [v6 registerTextureProvider:v5 forMediaKind:8];
}

- (BOOL)contentChangedForItemBeforeDataSource:(id)a3 beforeIndexPath:(PXSimpleIndexPath *)a4 afterDataSource:(id)a5 afterIndexPath:(PXSimpleIndexPath *)a6
{
  return 0;
}

- (void)reloadAccessoryItems
{
  id v2 = [(PXBaseMessagesStackView *)self layout];
  [v2 reloadAccessoryItems];
}

- (int64_t)numberOfAccessoryItems
{
  id v2 = [(PXBaseMessagesStackView *)self layout];
  int64_t v3 = [v2 numberOfAccessoryItems];

  return v3;
}

- (void)setNumberOfAccessoryItems:(int64_t)a3
{
  id v9 = [(PXBaseMessagesStackView *)self layout];
  if ([v9 numberOfAccessoryItems] != a3)
  {
    uint64_t v5 = [v9 numberOfItems];
    int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    int64_t v7 = v5 + a3 - 1;
    if (v5 + a3 >= 1)
    {
      int64_t indexToRestore = self->_indexToRestore;
      if (indexToRestore == 0x7FFFFFFFFFFFFFFFLL) {
        int64_t indexToRestore = [v9 primaryItemIndex];
      }
      if (v7 >= indexToRestore) {
        int64_t v6 = indexToRestore;
      }
      else {
        int64_t v6 = v7;
      }
    }
    self->_int64_t indexToRestore = v6;
    [v9 setNumberOfAccessoryItems:a3];
    [(PXBaseMessagesStackView *)self reloadAccessoryItems];
  }
}

- (void)setHorizontalAlignment:(int64_t)a3
{
  if (self->_horizontalAlignment != a3)
  {
    self->_horizontalAlignment = a3;
    [(PXBaseMessagesStackView *)self setNeedsLayout];
  }
}

- (void)setSelectionOverlayEnabled:(BOOL)a3
{
  if (self->_selectionOverlayEnabled != a3)
  {
    self->_selectionOverlayEnabled = a3;
    id v3 = [(PXBaseMessagesStackView *)self layout];
    [v3 invalidateDecorationAndSprites];
  }
}

- (double)rightEdgeHorizontalContentMarginAdjustment
{
  [(PXMessagesStackItemsLayout *)self->_layout rightEdgeInternalHorizontalAlignment];
  return result;
}

- (void)setRightEdgeHorizontalContentMarginAdjustment:(double)a3
{
}

- (double)leftEdgeHorizontalContentMarginAdjustment
{
  [(PXMessagesStackItemsLayout *)self->_layout leftEdgeInternalHorizontalAlignment];
  return result;
}

- (void)setLeftEdgeHorizontalContentMarginAdjustment:(double)a3
{
}

- (double)horizontalContentMarginForSize:(CGSize)a3
{
  double v4 = MEMORY[0x1AD10BC20](self, a2, 1.0, a3.width, a3.height);
  double v6 = v5;
  [(PXBaseMessagesStackView *)self verticalContentInsets];
  double v8 = v7 / v6;
  if (v6 <= 0.0) {
    double v9 = 0.0;
  }
  else {
    double v9 = v8;
  }
  layout = self->_layout;
  -[PXMessagesStackItemsLayout horizontalContentMarginForSize:normalizedVerticalContentInsets:](layout, "horizontalContentMarginForSize:normalizedVerticalContentInsets:", v4, v6, v9);
  return result;
}

- (double)horizontalContentMargin
{
  [(PXMessagesStackItemsLayout *)self->_layout horizontalContentMargin];
  return result;
}

- (void)setVerticalContentInsets:(double)a3
{
  if (self->_verticalContentInsets != a3)
  {
    self->_verticalContentInsets = a3;
    [(PXBaseMessagesStackView *)self setNeedsLayout];
  }
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  id v2 = [(PXBaseMessagesStackView *)self tungstenView];
  id v3 = [v2 scrollViewController];
  double v4 = [v3 scrollView];

  double v5 = [v4 panGestureRecognizer];

  return (UIPanGestureRecognizer *)v5;
}

- (PXSectionedObjectReference)currentObjectReference
{
  unint64_t v3 = [(PXBaseMessagesStackView *)self currentIndex];
  double v4 = [(PXBaseMessagesStackView *)self currentDataSource];
  double v5 = v4;
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v6 = 0;
  }
  else
  {
    double v6 = 0;
    if ([v4 numberOfItemsInSection:0] > v3)
    {
      v8[0] = [v5 identifier];
      v8[1] = 0;
      v8[2] = v3;
      v8[3] = 0x7FFFFFFFFFFFFFFFLL;
      double v6 = [v5 objectReferenceAtIndexPath:v8];
    }
  }

  return (PXSectionedObjectReference *)v6;
}

- (unint64_t)currentIndex
{
  id v2 = [(PXBaseMessagesStackView *)self layout];
  unint64_t v3 = [v2 primaryItemIndex];

  return v3;
}

- (BOOL)scrollToObjectReference:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [(PXBaseMessagesStackView *)self currentDataSource];
  double v8 = [v7 objectReferenceForObjectReference:v6];

  if (v8)
  {
    double v13 = 0.0;
    BOOL v9 = [(PXMessagesStackItemsLayout *)self->_layout getHorizontalOffsetForObjectReference:v8 outOffset:&v13];
    if (v9)
    {
      self->_isProgramaticallyScrolling = 1;
      uint64_t v10 = [(PXGView *)self->_tungstenView scrollViewController];
      id v11 = [v10 scrollView];

      objc_msgSend(v11, "px_scrollToContentOffset:animated:", v4, v13, 0.0);
      if (!v4) {
        [(PXGView *)self->_tungstenView ensureUpdatedLayout];
      }
      self->_int64_t indexToRestore = 0x7FFFFFFFFFFFFFFFLL;
      self->_isProgramaticallyScrolling = 0;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (BOOL)scrollToIndex:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = [(PXBaseMessagesStackView *)self currentDataSource];
  if ([v7 numberOfItemsInSection:0] <= a3)
  {
    BOOL v9 = 0;
  }
  else
  {
    v11[0] = [v7 identifier];
    v11[1] = 0;
    v11[2] = a3;
    v11[3] = 0x7FFFFFFFFFFFFFFFLL;
    double v8 = [v7 objectReferenceAtIndexPath:v11];
    BOOL v9 = [(PXBaseMessagesStackView *)self scrollToObjectReference:v8 animated:v4];
  }
  return v9;
}

- (void)setDebugColorModeEnabled:(BOOL)a3
{
  if (self->_debugColorModeEnabled != a3)
  {
    self->_debugColorModeEnabled = a3;
    if (a3)
    {
      BOOL v4 = [(PXBaseMessagesStackView *)self layout];
      uint64_t v5 = 5;
      [v4 setMediaKind:5];
    }
    else
    {
      uint64_t v6 = [(id)objc_opt_class() itemMediaKind];
      double v7 = [(PXBaseMessagesStackView *)self layout];
      [v7 setMediaKind:v6];

      uint64_t v5 = [(id)objc_opt_class() accessoryMediaKind];
    }
    id v8 = [(PXBaseMessagesStackView *)self layout];
    [v8 setAccessoryMediaKind:v5];
  }
}

- (void)layoutSubviews
{
  v25.receiver = self;
  v25.super_class = (Class)PXBaseMessagesStackView;
  [(PXBaseMessagesStackView *)&v25 layoutSubviews];
  uint64_t v3 = [(PXBaseMessagesStackView *)self bounds];
  double v6 = MEMORY[0x1AD10BC20](v3, 1.0, v4, v5);
  double v8 = v7;
  [(NSShadow *)self->_centerItemShadow shadowOffset];
  double v10 = v9;
  [(NSShadow *)self->_centerItemShadow shadowBlurRadius];
  double v12 = v11;
  int64_t v13 = [(PXBaseMessagesStackView *)self horizontalAlignment];
  if (!v13 || v13 == 2)
  {
    [(PXGLayout *)self->_layout displayScale];
    PXFloatRoundToPixel();
  }
  double v14 = 0.0;
  double v15 = 0.0;
  double v16 = v8;
  double v17 = v6;
  if (![(PXMessagesStackItemsLayout *)self->_layout presentationType])
  {
    double v17 = v6 + v6;
    double v16 = v8 + v10 + v12;
    double v15 = v6 * 0.5;
    double v14 = -(v6 * 0.5);
  }
  [(PXGView *)self->_tungstenView frame];
  BOOL v20 = v19 == v16 && v18 == v17;
  int64_t indexToRestore = self->_indexToRestore;
  if (!v20 && indexToRestore == 0x7FFFFFFFFFFFFFFFLL) {
    int64_t indexToRestore = [(PXMessagesStackItemsLayout *)self->_layout primaryItemIndex];
  }
  self->_int64_t indexToRestore = indexToRestore;
  -[PXGView setFrame:](self->_tungstenView, "setFrame:", v14, 0.0, v17, v16);
  [(PXBaseMessagesStackView *)self verticalContentInsets];
  double v24 = v23 / v8;
  if (v8 <= 0.0) {
    double v24 = 0.0;
  }
  [(PXMessagesStackItemsLayout *)self->_layout setNormalizedContentInsets:v24];
  -[PXMessagesStackItemsLayout setDesiredLayoutRect:](self->_layout, "setDesiredLayoutRect:", v15, 0.0, v6, v8);
}

- (void)setDataSourceManager:(id)a3
{
  double v5 = (PXSectionedDataSourceManager *)a3;
  dataSourceManager = self->_dataSourceManager;
  if (dataSourceManager != v5)
  {
    double v8 = v5;
    [(PXSectionedDataSourceManager *)dataSourceManager unregisterChangeObserver:self context:DataSourceManagerObservationContext_76522];
    objc_storeStrong((id *)&self->_dataSourceManager, a3);
    [(PXSectionedDataSourceManager *)self->_dataSourceManager registerChangeObserver:self context:DataSourceManagerObservationContext_76522];
    [(PXBaseMessagesStackView *)self _updateDataSource];
    double v5 = v8;
    long long v7 = *((_OWORD *)off_1E5DAB028 + 1);
    *(_OWORD *)&self->_lastKnownPrimaryIndex.int64_t dataSourceIdentifier = *(_OWORD *)off_1E5DAB028;
    *(_OWORD *)&self->_lastKnownPrimaryIndex.item = v7;
  }
}

- (PXBaseMessagesStackView)initWithCoder:(id)a3
{
  id v5 = a3;
  double v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXBaseMessagesStackView.m", 125, @"%s is not available as initializer", "-[PXBaseMessagesStackView initWithCoder:]");

  abort();
}

- (PXBaseMessagesStackView)initWithFrame:(CGRect)a3
{
  v25.receiver = self;
  v25.super_class = (Class)PXBaseMessagesStackView;
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  long long v7 = -[PXBaseMessagesStackView initWithFrame:](&v25, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v4, v5, v6);
  if (v7)
  {
    double v8 = +[PXMessagesUISettings sharedInstance];
    v7->_horizontalAlignment = 1;
    v7->_useAspectTiles = [v8 aspectTilesEnabled];
    int v9 = [v8 renderWithCA];
    double v10 = &unk_1F02D3E20;
    if (!v9) {
      double v10 = 0;
    }
    id v11 = v10;
    double v12 = -[PXGView initWithFrame:allowedPresentationTypes:]([PXGView alloc], "initWithFrame:allowedPresentationTypes:", v11, v3, v4, v5, v6);

    tungstenView = v7->_tungstenView;
    v7->_tungstenView = v12;

    double v14 = [MEMORY[0x1E4FB1618] clearColor];
    [(PXGView *)v7->_tungstenView setBackgroundColor:v14];

    double v15 = [(PXGView *)v7->_tungstenView scrollViewController];
    double v16 = [v15 scrollView];

    [v16 setAlwaysBounceVertical:0];
    [v16 setShowsHorizontalScrollIndicator:0];
    [v16 setShowsVerticalScrollIndicator:0];
    [v16 setDecelerationRate:*MEMORY[0x1E4FB2EE8]];
    [v16 setClipsToBounds:0];
    double v17 = [(PXGView *)v7->_tungstenView scrollViewController];
    [v17 registerObserver:v7];

    double v18 = objc_alloc_init(PXMessagesStackItemsLayout);
    [(PXMessagesStackItemsLayout *)v18 setPresentationType:0];
    if ([(PXBaseMessagesStackView *)v7 debugColorModeEnabled]) {
      uint64_t v19 = 5;
    }
    else {
      uint64_t v19 = [(id)objc_opt_class() itemMediaKind];
    }
    [(PXMessagesStackItemsLayout *)v18 setMediaKind:v19];
    [(PXGLayout *)v18 setContentSource:v7];
    [(PXMessagesStackItemsLayout *)v18 setAccessoryPresentationType:1];
    if ([(PXBaseMessagesStackView *)v7 debugColorModeEnabled]) {
      uint64_t v20 = 5;
    }
    else {
      uint64_t v20 = [(id)objc_opt_class() accessoryMediaKind];
    }
    [(PXMessagesStackItemsLayout *)v18 setAccessoryMediaKind:v20];
    [(PXGItemsLayout *)v18 setAccessoryItemContentSource:v7];
    [(PXMessagesStackItemsLayout *)v18 setPrimaryItemDelegate:v7];
    -[PXMessagesStackItemsLayout setStackedItemsCount:](v18, "setStackedItemsCount:", [v8 stackedItemsCount]);
    int v21 = [v8 renderWithCA];
    [v8 normalizedPageWidth];
    if (!v21) {
      double v22 = v22 * 0.5;
    }
    [(PXMessagesStackItemsLayout *)v18 setNormalizedPageWidth:v22];
    [v8 normalizedStackSizeTransform];
    -[PXMessagesStackItemsLayout setNormalizedStackSizeTransform:](v18, "setNormalizedStackSizeTransform:");
    double v23 = [v8 horizontalOffsets];
    [(PXMessagesStackItemsLayout *)v18 setNormalizedStackHorizontalOffsets:v23];

    [v8 rotationAngle];
    PXDegreesToRadians();
  }
  return 0;
}

+ (unsigned)accessoryMediaKind
{
  return 0;
}

+ (unsigned)itemMediaKind
{
  return 0;
}

@end