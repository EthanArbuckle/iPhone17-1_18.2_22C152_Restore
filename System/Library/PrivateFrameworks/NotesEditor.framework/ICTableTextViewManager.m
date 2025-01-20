@interface ICTableTextViewManager
- (BOOL)cellContainingPoint:(CGPoint)a3 columnID:(id *)a4 rowID:(id *)a5;
- (BOOL)isUpdatingTiles;
- (CGPoint)anchorPoint;
- (CGPoint)initialScrollPointForViewport:(CGRect)a3;
- (CGPoint)redrawAllWithViewport:(CGRect)a3;
- (CGPoint)updateTilesWithViewport:(CGRect)a3 redrawAll:(BOOL)a4;
- (CGRect)boundingRect;
- (CGRect)frameOfCellAtColumn:(id)a3 row:(id)a4;
- (CGRect)frameOfColumn:(id)a3;
- (CGRect)frameOfRow:(id)a3;
- (ICDimensionSumCache)cachedColumnWidths;
- (ICDimensionSumCache)cachedRowHeights;
- (ICTableContentView)contentView;
- (ICTableLayoutManager)tableLayoutManager;
- (ICTableTextViewManager)init;
- (ICTableTextViewManager)initWithTableLayoutManager:(id)a3 view:(id)a4 cachedWidths:(id)a5 cachedRowHeights:(id)a6 cachedCellHeights:(id)a7;
- (ICTableTextViewManagerDelegate)delegate;
- (NSArray)columnIDs;
- (NSArray)previousRowIdentifiers;
- (NSArray)rowIDs;
- (NSMutableArray)columnIdentifiers;
- (NSMutableArray)rowIdentifiers;
- (NSMutableDictionary)cachedCellHeights;
- (NSMutableDictionary)columnTextViews;
- (NSMutableSet)columnsNeedingRestyle;
- (NSMutableSet)prepopulatedColumns;
- (NSSet)draggedColumns;
- (NSSet)draggedRows;
- (double)addColumn:(id)a3 atEnd:(BOOL)a4;
- (double)addRow:(id)a3 atEnd:(BOOL)a4;
- (double)ensureChunkOfPopulatedColumnsForColumn:(id)a3;
- (double)ensureChunkOfPopulatedRowsForRow:(id)a3 shouldForce:(BOOL)a4;
- (double)preAddColumn:(id)a3;
- (double)preAddRow:(id)a3 atYPosition:(double)a4;
- (id)columnContainingX:(double)a3;
- (id)rowContainingY:(double)a3;
- (id)textViewForColumn:(id)a3;
- (id)textViewForColumn:(id)a3 createIfNeeded:(BOOL)a4;
- (unint64_t)anchorColumn;
- (unint64_t)anchorRow;
- (void)adjustOnscreenPositions;
- (void)clearColumn:(id)a3;
- (void)clearColumnsOutsideFrame:(CGRect)a3;
- (void)clearRow:(id)a3;
- (void)clearRowsOutsideFrame:(CGRect)a3;
- (void)dealloc;
- (void)ensureCellPositionForColumn:(id)a3 andRow:(id)a4;
- (void)enumerateTextViewsWithBlock:(id)a3;
- (void)heightChangedForRow:(id)a3 by:(double)a4;
- (void)moveColumnAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4;
- (void)moveRowAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4;
- (void)parentViewDidChange;
- (void)removeColumn:(id)a3;
- (void)restyleCells;
- (void)restyleTextView:(id)a3;
- (void)setAnchorColumn:(unint64_t)a3;
- (void)setAnchorPoint:(CGPoint)a3;
- (void)setAnchorRow:(unint64_t)a3;
- (void)setColumnsNeedingRestyle:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDraggedColumns:(id)a3;
- (void)setDraggedRows:(id)a3;
- (void)setPreviousRowIdentifiers:(id)a3;
- (void)setUpdatingTiles:(BOOL)a3;
- (void)updateAuthorHighlights;
- (void)validateRowHeightsForColumn:(id)a3;
@end

@implementation ICTableTextViewManager

- (ICTableTextViewManager)init
{
  return 0;
}

- (ICTableTextViewManager)initWithTableLayoutManager:(id)a3 view:(id)a4 cachedWidths:(id)a5 cachedRowHeights:(id)a6 cachedCellHeights:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v28.receiver = self;
  v28.super_class = (Class)ICTableTextViewManager;
  v18 = [(ICTableTextViewManager *)&v28 init];
  if (v18)
  {
    uint64_t v19 = [MEMORY[0x263EFF980] array];
    columnIdentifiers = v18->_columnIdentifiers;
    v18->_columnIdentifiers = (NSMutableArray *)v19;

    uint64_t v21 = [MEMORY[0x263EFF980] array];
    rowIdentifiers = v18->_rowIdentifiers;
    v18->_rowIdentifiers = (NSMutableArray *)v21;

    uint64_t v23 = [MEMORY[0x263EFF9C0] set];
    prepopulatedColumns = v18->_prepopulatedColumns;
    v18->_prepopulatedColumns = (NSMutableSet *)v23;

    uint64_t v25 = [MEMORY[0x263EFF9A0] dictionary];
    columnTextViews = v18->_columnTextViews;
    v18->_columnTextViews = (NSMutableDictionary *)v25;

    objc_storeStrong((id *)&v18->_tableLayoutManager, a3);
    objc_storeWeak((id *)&v18->_contentView, v14);
    objc_storeStrong((id *)&v18->_cachedColumnWidths, a5);
    objc_storeStrong((id *)&v18->_cachedRowHeights, a6);
    objc_storeStrong((id *)&v18->_cachedCellHeights, a7);
    v18->_anchorColumn = 0;
    v18->_anchorRow = 0;
    v18->_anchorPoint = (CGPoint)*MEMORY[0x263F00148];
  }

  return v18;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = [(ICTableTextViewManager *)self columnTextViews];
  v4 = [v3 allValues];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v8++) removeFromSuperview];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  v9.receiver = self;
  v9.super_class = (Class)ICTableTextViewManager;
  [(ICTableTextViewManager *)&v9 dealloc];
}

- (CGPoint)initialScrollPointForViewport:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v8 = (double *)MEMORY[0x263F00148];
  double v9 = *(double *)(MEMORY[0x263F00148] + 8);
  long long v10 = [(ICTableTextViewManager *)self tableLayoutManager];
  long long v11 = [v10 table];

  if ([v11 isRightToLeft])
  {
    long long v12 = [(ICTableTextViewManager *)self tableLayoutManager];
    long long v13 = [v12 table];
    id v14 = [v12 columnWidthManager];
    unint64_t v15 = [v13 columnCount];
    v30.origin.CGFloat x = x;
    v30.origin.CGFloat y = y;
    v30.size.CGFloat width = width;
    v30.size.CGFloat height = height;
    double v16 = CGRectGetWidth(v30);
    id v17 = [(ICTableTextViewManager *)self cachedColumnWidths];
    if (v16 > 0.0 && v15)
    {
      double v18 = 0.0;
      unint64_t v19 = 1;
      do
      {
        v20 = [v13 identifierForColumnAtIndex:v19 - 1];
        [v14 widthOfColumn:v20];
        double v22 = v21;
        objc_msgSend(v17, "setDimension:forKey:", v20);
        double v18 = v18 + v22;
      }
      while (v18 < v16 && v19++ < v15);
    }
    [v17 sum];
    double v25 = v24 - v16;
    if (v25 >= 0.0) {
      double v26 = v25;
    }
    else {
      double v26 = 0.0;
    }
  }
  else
  {
    double v26 = *v8;
  }

  double v27 = v26;
  double v28 = v9;
  result.CGFloat y = v28;
  result.CGFloat x = v27;
  return result;
}

- (CGRect)boundingRect
{
  v3 = [(ICTableTextViewManager *)self columnTextViews];
  v4 = [(ICTableTextViewManager *)self columnIdentifiers];
  uint64_t v5 = [v4 lastObject];
  uint64_t v6 = [v3 objectForKeyedSubscript:v5];

  [v6 frame];
  double MaxX = CGRectGetMaxX(v31);
  [(ICTableTextViewManager *)self anchorPoint];
  double v9 = MaxX - v8;
  if (v9 >= 0.0) {
    double v10 = v9;
  }
  else {
    double v10 = 0.0;
  }
  long long v11 = [(ICTableTextViewManager *)self rowIdentifiers];
  long long v12 = [v11 lastObject];

  long long v13 = [(ICTableTextViewManager *)self tableLayoutManager];
  id v14 = [v13 rowPositions];
  unint64_t v15 = [v14 objectForKeyedSubscript:v12];
  [v15 doubleValue];
  double v17 = v16;

  double v18 = [(ICTableTextViewManager *)self cachedRowHeights];
  [v18 dimensionForKey:v12];
  double v20 = v17 + v19;

  [(ICTableTextViewManager *)self anchorPoint];
  if (v20 - v21 >= 0.0) {
    double v22 = v20 - v21;
  }
  else {
    double v22 = 0.0;
  }
  [(ICTableTextViewManager *)self anchorPoint];
  double v24 = v23;
  [(ICTableTextViewManager *)self anchorPoint];
  double v26 = v25;

  double v27 = v24;
  double v28 = v26;
  double v29 = v10;
  double v30 = v22;
  result.size.CGFloat height = v30;
  result.size.CGFloat width = v29;
  result.origin.CGFloat y = v28;
  result.origin.CGFloat x = v27;
  return result;
}

- (NSArray)columnIDs
{
  v2 = [(ICTableTextViewManager *)self columnIdentifiers];
  v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (NSArray)rowIDs
{
  v2 = [(ICTableTextViewManager *)self rowIdentifiers];
  v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (void)enumerateTextViewsWithBlock:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void *, unsigned char *))a3;
  unsigned __int8 v17 = 0;
  uint64_t v5 = [(ICTableTextViewManager *)self columnTextViews];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [(ICTableTextViewManager *)self columnIdentifiers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v6);
      }
      long long v11 = [v5 objectForKeyedSubscript:*(void *)(*((void *)&v13 + 1) + 8 * v10)];
      v4[2](v4, v11, &v17);
      int v12 = v17;

      if (v12) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)adjustOnscreenPositions
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  [(ICTableTextViewManager *)self boundingRect];
  CGFloat x = v49.origin.x;
  CGFloat y = v49.origin.y;
  CGFloat width = v49.size.width;
  CGFloat height = v49.size.height;
  double MinX = CGRectGetMinX(v49);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v8 = [(ICTableTextViewManager *)self columnIDs];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v43;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v43 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v42 + 1) + 8 * v12);
        long long v14 = [(ICTableTextViewManager *)self columnTextViews];
        long long v15 = [v14 objectForKey:v13];

        if (!v15) {
          objc_msgSend(MEMORY[0x263F5AE60], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((columnTextView) != nil)", "-[ICTableTextViewManager adjustOnscreenPositions]", 1, 0, @"Expected non-nil value for '%s'", "columnTextView");
        }
        long long v16 = [(ICTableTextViewManager *)self cachedColumnWidths];
        [v16 dimensionForKey:v13];
        double v18 = v17;

        [v15 frame];
        double v20 = v19;
        [v15 frame];
        objc_msgSend(v15, "setFrame:", MinX, v20, v18);
        double v21 = [(ICTableTextViewManager *)self contentView];
        double v22 = [NSNumber numberWithDouble:MinX];
        [v21 setVerticalLinePosition:v22 forKey:v13];

        double MinX = MinX + v18;
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v10);
  }

  v50.origin.CGFloat x = x;
  v50.origin.CGFloat y = y;
  v50.size.CGFloat width = width;
  v50.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v50);
  double v24 = [(ICTableTextViewManager *)self rowIdentifiers];
  if ([v24 count]) {
    [(ICTableTextViewManager *)self rowIdentifiers];
  }
  else {
  double v25 = [(ICTableTextViewManager *)self previousRowIdentifiers];
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v26 = v25;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v39;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v39 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = *(void *)(*((void *)&v38 + 1) + 8 * v30);
        v32 = [(ICTableTextViewManager *)self contentView];
        v33 = [NSNumber numberWithDouble:MinY];
        [v32 setHorizontalLinePosition:v33 forKey:v31];

        v34 = [(ICTableTextViewManager *)self tableLayoutManager];
        [v34 setYPosition:v31 forRow:1 shouldInvalidate:MinY];

        v35 = [(ICTableTextViewManager *)self cachedRowHeights];
        [v35 dimensionForKey:v31];
        double v37 = v36;

        double MinY = MinY + v37;
        ++v30;
      }
      while (v28 != v30);
      uint64_t v28 = [v26 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v28);
  }
}

- (void)validateRowHeightsForColumn:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v40 = a3;
  v4 = [(ICTableTextViewManager *)self rowIdentifiers];
  if ([v4 count]) {
    [(ICTableTextViewManager *)self rowIdentifiers];
  }
  else {
  uint64_t v5 = [(ICTableTextViewManager *)self previousRowIdentifiers];
  }

  uint64_t v6 = [(ICTableTextViewManager *)self tableLayoutManager];
  uint64_t v7 = [v6 table];
  uint64_t v8 = [v7 textStorageForColumn:v40];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v46 != v12) {
          objc_enumerationMutation(v9);
        }
        [v8 characterRangeForRowID:*(void *)(*((void *)&v45 + 1) + 8 * i)];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v11);
  }

  long long v14 = [(ICTableTextViewManager *)self tableLayoutManager];
  long long v15 = [v14 columnLayoutManagerForColumn:v40];

  if ([v9 count])
  {
    long long v16 = [v9 firstObject];
    double v17 = [v9 lastObject];
    NSUInteger v18 = [v8 characterRangeForRowID:v16];
    NSUInteger v20 = v19;
    v53.location = [v8 characterRangeForRowID:v17];
    v53.length = v21;
    v52.location = v18;
    v52.length = v20;
    NSRange v22 = NSUnionRange(v52, v53);
    objc_msgSend(v15, "ensureLayoutForCharacterRange:", v22.location, v22.length);
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v23 = v9;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    long long v39 = v8;
    char v26 = 0;
    uint64_t v27 = *(void *)v42;
    double v28 = *MEMORY[0x263F5B1C0];
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v42 != v27) {
          objc_enumerationMutation(v23);
        }
        uint64_t v30 = *(void *)(*((void *)&v41 + 1) + 8 * j);
        uint64_t v31 = [(ICTableTextViewManager *)self cachedCellHeights];
        v32 = [v31 objectForKey:v30];

        if (!v32) {
          objc_msgSend(MEMORY[0x263F5AE60], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((cellHeightsForRow) != nil)", "-[ICTableTextViewManager validateRowHeightsForColumn:]", 1, 0, @"Expected non-nil value for '%s'", "cellHeightsForRow");
        }
        [v15 heightOfCellAtRowID:v30];
        objc_msgSend(v32, "setDimension:forKey:", v40);
        v33 = [(ICTableTextViewManager *)self cachedRowHeights];
        [v33 dimensionForKey:v30];
        double v35 = v34;

        [v32 max];
        if (v36 >= v28) {
          double v37 = v36;
        }
        else {
          double v37 = v28;
        }
        if (v35 != v37)
        {
          long long v38 = [(ICTableTextViewManager *)self cachedRowHeights];
          [v38 setDimension:v30 forKey:v37];

          char v26 = 1;
        }
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v41 objects:v49 count:16];
    }
    while (v25);

    uint64_t v8 = v39;
    if (v26) {
      [(ICTableTextViewManager *)self adjustOnscreenPositions];
    }
  }
  else
  {
  }
}

- (double)addColumn:(id)a3 atEnd:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(ICTableTextViewManager *)self validateRowHeightsForColumn:v6];
  [(ICTableTextViewManager *)self boundingRect];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  long long v15 = [(ICTableTextViewManager *)self columnIdentifiers];
  long long v16 = v15;
  if (v4)
  {
    double v17 = [(ICTableTextViewManager *)self columnIdentifiers];
    objc_msgSend(v16, "insertObject:atIndex:", v6, objc_msgSend(v17, "count"));
  }
  else
  {
    [v15 insertObject:v6 atIndex:0];
  }

  NSUInteger v18 = [(ICTableTextViewManager *)self prepopulatedColumns];
  int v19 = [v18 containsObject:v6];

  if (v19)
  {
    NSUInteger v20 = [(ICTableTextViewManager *)self prepopulatedColumns];
    [v20 removeObject:v6];
  }
  NSUInteger v21 = [(ICTableTextViewManager *)self tableLayoutManager];
  NSRange v22 = [v21 columnWidthManager];
  [v22 widthOfColumn:v6];
  double v24 = v23;

  if (v4)
  {
    v41.origin.CGFloat x = v8;
    v41.origin.CGFloat y = v10;
    v41.size.CGFloat width = v12;
    v41.size.CGFloat height = v14;
    double MaxX = CGRectGetMaxX(v41);
    [(ICTableTextViewManager *)self anchorPoint];
    if (MaxX < v26) {
      double MaxX = v26;
    }
  }
  else
  {
    [(ICTableTextViewManager *)self anchorPoint];
    double MaxX = v27 - v24;
  }
  double v28 = [(ICTableTextViewManager *)self contentView];
  [v28 bounds];
  double v30 = v29;

  uint64_t v31 = [(ICTableTextViewManager *)self textViewForColumn:v6 createIfNeeded:1];
  objc_msgSend(v31, "setFrame:", MaxX, 0.0, v24, v30);
  v32 = [(ICTableTextViewManager *)self contentView];
  [v32 addSubview:v31];

  v33 = [(ICTableTextViewManager *)self columnsNeedingRestyle];
  int v34 = [v33 containsObject:v6];

  if (v34) {
    [(ICTableTextViewManager *)self restyleTextView:v31];
  }
  [(ICTableTextViewManager *)self updateAuthorHighlights];
  double v35 = [(ICTableTextViewManager *)self contentView];
  double v36 = [NSNumber numberWithDouble:MaxX];
  [v35 setVerticalLinePosition:v36 forKey:v6];

  if (!v4)
  {
    [(ICTableTextViewManager *)self setAnchorColumn:[(ICTableTextViewManager *)self anchorColumn] - 1];
    [(ICTableTextViewManager *)self anchorPoint];
    double v38 = v37 - v24;
    [(ICTableTextViewManager *)self anchorPoint];
    [(ICTableTextViewManager *)self setAnchorPoint:v38];
  }
  long long v39 = [(ICTableTextViewManager *)self cachedColumnWidths];
  [v39 setDimension:v6 forKey:v24];

  [(ICTableTextViewManager *)self validateRowHeightsForColumn:v6];
  return v24;
}

- (double)ensureChunkOfPopulatedColumnsForColumn:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICTableTextViewManager *)self tableLayoutManager];
  id v6 = [v5 columnLayoutManagerForColumn:v4];

  double v7 = [v6 columnTextStorage];
  CGFloat v8 = [v7 populatedRows];
  uint64_t v9 = [v8 count];

  if (!v9)
  {
    CGFloat v10 = [(ICTableTextViewManager *)self tableLayoutManager];
    double v11 = [v10 table];

    unint64_t v12 = [v11 columnIndexForIdentifier:v4];
    unint64_t v13 = *MEMORY[0x263F5B190] + v12;
    unint64_t v14 = [v11 columnCount];
    if (v13 >= v14) {
      unint64_t v15 = v14;
    }
    else {
      unint64_t v15 = v13;
    }
    if (v12 < v15)
    {
      do
      {
        long long v16 = [v11 identifierForColumnAtIndex:v12];
        [(ICTableTextViewManager *)self preAddColumn:v16];

        ++v12;
      }
      while (v15 != v12);
    }
  }
  [(ICTableTextViewManager *)self addColumn:v4 atEnd:1];
  double v18 = v17;

  return v18;
}

- (double)preAddColumn:(id)a3
{
  id v4 = a3;
  [(ICTableTextViewManager *)self validateRowHeightsForColumn:v4];
  uint64_t v5 = [(ICTableTextViewManager *)self tableLayoutManager];
  uint64_t v6 = [v5 columnWidthManager];
  [(id)v6 widthOfColumn:v4];
  double v8 = v7;

  uint64_t v9 = [(ICTableTextViewManager *)self columnIdentifiers];
  LOBYTE(v6) = [v9 containsObject:v4];

  if ((v6 & 1) == 0)
  {
    CGFloat v10 = [(ICTableTextViewManager *)self prepopulatedColumns];
    [v10 addObject:v4];
  }
  double v11 = [(ICTableTextViewManager *)self cachedColumnWidths];
  [v11 setDimension:v4 forKey:v8];

  return v8;
}

- (double)addRow:(id)a3 atEnd:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(ICTableTextViewManager *)self boundingRect];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  unint64_t v15 = [(ICTableTextViewManager *)self rowIdentifiers];
  long long v16 = v15;
  if (v4)
  {
    double v17 = [(ICTableTextViewManager *)self rowIdentifiers];
    objc_msgSend(v16, "insertObject:atIndex:", v6, objc_msgSend(v17, "count"));
  }
  else
  {
    [v15 insertObject:v6 atIndex:0];
  }

  double v18 = [(ICTableTextViewManager *)self cachedCellHeights];
  int v19 = [v18 objectForKey:v6];

  if (!v19)
  {
    int v19 = (void *)[objc_alloc(MEMORY[0x263F5AC28]) initWithComparator:&__block_literal_global_33];
    NSUInteger v20 = [(ICTableTextViewManager *)self cachedCellHeights];
    [v20 setObject:v19 forKey:v6];
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  obuint64_t j = [(ICTableTextViewManager *)self columnIdentifiers];
  uint64_t v21 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v55;
    uint64_t v51 = self;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v55 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = *(void *)(*((void *)&v54 + 1) + 8 * i);
        double v26 = [(ICTableTextViewManager *)self tableLayoutManager];
        uint64_t v53 = v25;
        double v27 = [v26 columnLayoutManagerForColumn:v25];

        if (v4)
        {
          double v28 = [v27 columnTextStorage];
          [v28 populatedRows];
          double v30 = v29 = v4;
          char v31 = [v30 containsObject:v6];

          BOOL v4 = v29;
          self = v51;

          if ((v31 & 1) == 0)
          {
            v60.origin.CGFloat x = v8;
            v60.origin.CGFloat y = v10;
            v60.size.CGFloat width = v12;
            v60.size.CGFloat height = v14;
            double MaxY = CGRectGetMaxY(v60);
            [(ICTableTextViewManager *)v51 anchorPoint];
            if (MaxY < v33) {
              double MaxY = v33;
            }
            int v34 = [(ICTableTextViewManager *)v51 tableLayoutManager];
            [v34 setYPosition:v6 forRow:0 shouldInvalidate:MaxY];
          }
        }
        [v27 heightOfCellAtRowID:v6];
        objc_msgSend(v19, "setDimension:forKey:", v53);
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
    }
    while (v22);
  }

  [v19 max];
  double v36 = v35;
  double v37 = [(ICTableTextViewManager *)self tableLayoutManager];
  [v37 emptyCellHeight];
  double v39 = v38;

  if (v36 < v39) {
    double v36 = v39;
  }
  if (v4)
  {
    v61.origin.CGFloat x = v8;
    v61.origin.CGFloat y = v10;
    v61.size.CGFloat width = v12;
    v61.size.CGFloat height = v14;
    double v40 = CGRectGetMaxY(v61);
    [(ICTableTextViewManager *)self anchorPoint];
    if (v40 < v41) {
      double v40 = v41;
    }
  }
  else
  {
    [(ICTableTextViewManager *)self anchorPoint];
    double v40 = v42 - v36;
  }
  long long v43 = [(ICTableTextViewManager *)self tableLayoutManager];
  [v43 setYPosition:v6 forRow:1 shouldInvalidate:v40];

  long long v44 = [(ICTableTextViewManager *)self contentView];
  long long v45 = [NSNumber numberWithDouble:v40];
  [v44 setHorizontalLinePosition:v45 forKey:v6];

  if (!v4)
  {
    [(ICTableTextViewManager *)self setAnchorRow:[(ICTableTextViewManager *)self anchorRow] - 1];
    [(ICTableTextViewManager *)self anchorPoint];
    double v47 = v46;
    [(ICTableTextViewManager *)self anchorPoint];
    -[ICTableTextViewManager setAnchorPoint:](self, "setAnchorPoint:", v47, v48 - v36);
  }
  CGRect v49 = [(ICTableTextViewManager *)self cachedRowHeights];
  [v49 setDimension:v6 forKey:v36];

  return v36;
}

uint64_t __39__ICTableTextViewManager_addRow_atEnd___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (double)ensureChunkOfPopulatedRowsForRow:(id)a3 shouldForce:(BOOL)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (a4)
  {
LABEL_12:
    double v18 = [(ICTableTextViewManager *)self tableLayoutManager];
    double v7 = [v18 table];

    unint64_t v19 = [v7 rowIndexForIdentifier:v6];
    unint64_t v20 = *MEMORY[0x263F5B1C8] + v19;
    unint64_t v21 = [v7 rowCount];
    if (v20 >= v21) {
      unint64_t v22 = v21;
    }
    else {
      unint64_t v22 = v20;
    }
    [(ICTableTextViewManager *)self boundingRect];
    double MaxY = CGRectGetMaxY(v36);
    [(ICTableTextViewManager *)self anchorPoint];
    if (v19 < v22)
    {
      if (MaxY < v24) {
        double MaxY = v24;
      }
      do
      {
        uint64_t v25 = [v7 identifierForRowAtIndex:v19];
        [(ICTableTextViewManager *)self preAddRow:v25 atYPosition:MaxY];
        double MaxY = MaxY + v26;

        ++v19;
      }
      while (v22 != v19);
    }
  }
  else
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    double v7 = [(ICTableTextViewManager *)self columnIdentifiers];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v31;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          double v13 = [(ICTableTextViewManager *)self tableLayoutManager];
          CGFloat v14 = [v13 columnLayoutManagerForColumn:v12];

          unint64_t v15 = [v14 columnTextStorage];
          long long v16 = [v15 populatedRows];
          int v17 = [v16 containsObject:v6];

          if (!v17)
          {

            goto LABEL_12;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
  }

  [(ICTableTextViewManager *)self addRow:v6 atEnd:1];
  double v28 = v27;

  return v28;
}

- (double)preAddRow:(id)a3 atYPosition:(double)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = a3;
  double v7 = [(ICTableTextViewManager *)self cachedCellHeights];
  uint64_t v8 = [v7 objectForKey:v6];

  double v42 = (void *)v8;
  if (!v8)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x263F5AC28]) initWithComparator:&__block_literal_global_26];
    uint64_t v10 = [(ICTableTextViewManager *)self cachedCellHeights];
    double v42 = (void *)v9;
    [v10 setObject:v9 forKey:v6];
  }
  double v11 = [(ICTableTextViewManager *)self columnIdentifiers];
  uint64_t v12 = [(ICTableTextViewManager *)self prepopulatedColumns];
  double v13 = [v12 allObjects];
  CGFloat v14 = [v11 arrayByAddingObjectsFromArray:v13];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = v14;
  uint64_t v15 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v44 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        unint64_t v20 = [(ICTableTextViewManager *)self tableLayoutManager];
        unint64_t v21 = [v20 columnLayoutManagerForColumn:v19];

        unint64_t v22 = [v21 columnTextStorage];
        uint64_t v23 = [v22 populatedRows];
        char v24 = [v23 containsObject:v6];

        if ((v24 & 1) == 0)
        {
          uint64_t v25 = [(ICTableTextViewManager *)self tableLayoutManager];
          double v26 = [v25 rowPositions];
          double v27 = [v26 objectForKey:v6];

          if (v27)
          {
            [v27 doubleValue];
            BOOL v29 = v28 != a4;
          }
          else
          {
            BOOL v29 = 0;
          }
          long long v30 = [(ICTableTextViewManager *)self tableLayoutManager];
          [v30 setYPosition:v6 forRow:v29 shouldInvalidate:a4];
        }
        [v21 heightOfCellAtRowID:v6];
        objc_msgSend(v42, "setDimension:forKey:", v19);
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v16);
  }

  long long v31 = [(ICTableTextViewManager *)self tableLayoutManager];
  [v31 setYPosition:v6 forRow:1 shouldInvalidate:a4];

  long long v32 = [(ICTableTextViewManager *)self contentView];
  long long v33 = [NSNumber numberWithDouble:a4];
  [v32 setHorizontalLinePosition:v33 forKey:v6];

  [v42 max];
  double v35 = v34;
  CGRect v36 = [(ICTableTextViewManager *)self tableLayoutManager];
  [v36 emptyCellHeight];
  double v38 = v37;

  if (v35 < v38) {
    double v35 = v38;
  }
  double v39 = [(ICTableTextViewManager *)self cachedRowHeights];
  [v39 setDimension:v6 forKey:v35];

  return v35;
}

uint64_t __48__ICTableTextViewManager_preAddRow_atYPosition___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)ensureCellPositionForColumn:(id)a3 andRow:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ICTableTextViewManager *)self textViewForColumn:v6 createIfNeeded:1];
  uint64_t v9 = [v8 superview];

  if (!v9)
  {
    uint64_t v10 = [(ICTableTextViewManager *)self contentView];
    [v10 addSubview:v8];

    double v11 = [(ICTableTextViewManager *)self tableLayoutManager];
    uint64_t v12 = [v11 table];

    uint64_t v13 = [v12 columnIndexForIdentifier:v6];
    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_42:

      goto LABEL_43;
    }
    unint64_t v14 = v13;
    uint64_t v15 = [(ICTableTextViewManager *)self tableLayoutManager];
    uint64_t v16 = [v15 columnWidthManager];
    [v16 widthOfColumn:v6];
    double v18 = v17;

    if (!v14 && ([v12 isLeftToRight] & 1) != 0)
    {
      uint64_t v19 = 0;
      int v20 = 1;
LABEL_25:
      double MaxX = 0.0;
      goto LABEL_28;
    }
    if (v14 != [v12 columnCount] - 1 || (double MaxX = 0.0, (objc_msgSend(v12, "isRightToLeft") & 1) == 0))
    {
      if (v14 != [v12 columnCount] - 1 || (objc_msgSend(v12, "isLeftToRight") & 1) == 0)
      {
        if (v14)
        {
          int v20 = 0;
          double MaxX = 0.0;
LABEL_17:
          uint64_t v24 = [v12 identifierForColumnAtIndex:v14 - 1];
          uint64_t v19 = (void *)v24;
          if ((v20 & 1) == 0 && v24)
          {
            uint64_t v25 = [(ICTableTextViewManager *)self columnTextViews];
            double v26 = [v25 allKeys];
            int v27 = [v26 containsObject:v19];

            if (v27)
            {
              double v28 = [(ICTableTextViewManager *)self textViewForColumn:v19];
              int v29 = [v12 isLeftToRight];
              [v28 frame];
              if (v29) {
                double MaxX = CGRectGetMaxX(*(CGRect *)&v30);
              }
              else {
                double MaxX = CGRectGetMinX(*(CGRect *)&v30) - v18;
              }

              int v20 = 1;
            }
            else
            {
              int v20 = 0;
            }
          }
LABEL_28:
          if (v14 >= [v12 columnCount] - 1)
          {
            double v34 = 0;
          }
          else
          {
            double v34 = [v12 identifierForColumnAtIndex:v14 + 1];
            if (v34) {
              int v35 = v20;
            }
            else {
              int v35 = 1;
            }
            if (v35 != 1)
            {
              CGRect v36 = [(ICTableTextViewManager *)self columnTextViews];
              double v37 = [v36 allKeys];
              int v38 = [v37 containsObject:v34];

              if (v38)
              {
                double v39 = [(ICTableTextViewManager *)self textViewForColumn:v34];
                int v40 = [v12 isLeftToRight];
                [v39 frame];
                if (v40) {
                  double MaxX = CGRectGetMinX(*(CGRect *)&v41) - v18;
                }
                else {
                  double MaxX = CGRectGetMaxX(*(CGRect *)&v41);
                }

                goto LABEL_41;
              }
              goto LABEL_38;
            }
          }
          if (v20)
          {
LABEL_41:
            long long v46 = [(ICTableTextViewManager *)self contentView];
            [v46 bounds];
            objc_msgSend(v8, "setFrame:", MaxX, 0.0, v18);

            goto LABEL_42;
          }
LABEL_38:
          [(ICTableTextViewManager *)self frameOfCellAtColumn:v6 row:v7];
          double MaxX = v45;
          goto LABEL_41;
        }
        if (![v12 isRightToLeft])
        {
          uint64_t v19 = 0;
          int v20 = 0;
          goto LABEL_25;
        }
      }
      if ([v12 isLeftToRight])
      {
        uint64_t v51 = 0;
        NSRange v52 = (double *)&v51;
        uint64_t v53 = 0x2020000000;
        uint64_t v54 = 0;
        v47[0] = MEMORY[0x263EF8330];
        v47[1] = 3221225472;
        v47[2] = __61__ICTableTextViewManager_ensureCellPositionForColumn_andRow___block_invoke;
        v47[3] = &unk_2640BBC38;
        id v48 = v6;
        CGRect v49 = self;
        CGRect v50 = &v51;
        [v12 enumerateColumnsWithBlock:v47];
        double MaxX = v52[3];

        _Block_object_dispose(&v51, 8);
      }
      else
      {
        unint64_t v22 = [(ICTableTextViewManager *)self cachedColumnWidths];
        [v22 sum];
        double MaxX = v23 - v18;
      }
    }
    int v20 = 1;
    if (!v14)
    {
      uint64_t v19 = 0;
      goto LABEL_28;
    }
    goto LABEL_17;
  }
LABEL_43:
}

void __61__ICTableTextViewManager_ensureCellPositionForColumn_andRow___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  if ([v10 isEqual:*(void *)(a1 + 32)])
  {
    *a4 = 1;
  }
  else
  {
    id v6 = [*(id *)(a1 + 40) tableLayoutManager];
    id v7 = [v6 columnWidthManager];
    [v7 widthOfColumn:v10];
    double v9 = v8;

    *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v9
                                                                + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
  }
}

- (void)clearColumn:(id)a3
{
  id v8 = a3;
  BOOL v4 = [(ICTableTextViewManager *)self columnTextViews];
  uint64_t v5 = [v4 objectForKey:v8];

  if ((objc_msgSend(v5, "ic_isFirstResponder") & 1) == 0) {
    [v5 removeFromSuperview];
  }
  id v6 = [(ICTableTextViewManager *)self contentView];
  [v6 setVerticalLinePosition:0 forKey:v8];

  id v7 = [(ICTableTextViewManager *)self columnIdentifiers];
  [v7 removeObject:v8];
}

- (void)clearRow:(id)a3
{
  id v8 = a3;
  BOOL v4 = [(ICTableTextViewManager *)self rowIdentifiers];
  int v5 = [v4 containsObject:v8];

  if (v5)
  {
    id v6 = [(ICTableTextViewManager *)self contentView];
    [v6 setHorizontalLinePosition:0 forKey:v8];

    id v7 = [(ICTableTextViewManager *)self rowIdentifiers];
    [v7 removeObject:v8];
  }
}

- (void)clearColumnsOutsideFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v50 = *MEMORY[0x263EF8340];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v8 = [(ICTableTextViewManager *)self columnIDs];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v45;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v45 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v44 + 1) + 8 * i);
        unint64_t v14 = [(ICTableTextViewManager *)self columnTextViews];
        uint64_t v15 = [v14 objectForKeyedSubscript:v13];

        [v15 frame];
        CGFloat v17 = v16;
        [v15 frame];
        v53.size.CGFloat width = v18;
        v51.origin.CGFloat x = x;
        v51.origin.CGFloat y = y;
        v51.size.CGFloat width = width;
        v51.size.CGFloat height = height;
        v53.origin.CGFloat x = v17;
        v53.origin.CGFloat y = y;
        v53.size.CGFloat height = height;
        if (CGRectIntersectsRect(v51, v53)
          || ([(ICTableTextViewManager *)self draggedColumns],
              uint64_t v19 = objc_claimAutoreleasedReturnValue(),
              int v20 = [v19 containsObject:v13],
              v19,
              v20))
        {

          goto LABEL_12;
        }
        [(ICTableTextViewManager *)self clearColumn:v13];
        [(ICTableTextViewManager *)self setAnchorColumn:[(ICTableTextViewManager *)self anchorColumn] + 1];
        unint64_t v21 = [(ICTableTextViewManager *)self cachedColumnWidths];
        [v21 dimensionForKey:v13];
        double v23 = v22;

        [(ICTableTextViewManager *)self anchorPoint];
        double v25 = v23 + v24;
        [(ICTableTextViewManager *)self anchorPoint];
        [(ICTableTextViewManager *)self setAnchorPoint:v25];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v44 objects:v49 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  double v26 = [(ICTableTextViewManager *)self columnIDs];
  int v27 = [v26 reverseObjectEnumerator];

  uint64_t v28 = [v27 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v41;
    while (2)
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v41 != v30) {
          objc_enumerationMutation(v27);
        }
        uint64_t v32 = *(void *)(*((void *)&v40 + 1) + 8 * j);
        long long v33 = [(ICTableTextViewManager *)self columnTextViews];
        double v34 = [v33 objectForKeyedSubscript:v32];

        [v34 frame];
        CGFloat v36 = v35;
        [v34 frame];
        v54.size.CGFloat width = v37;
        v52.origin.CGFloat x = x;
        v52.origin.CGFloat y = y;
        v52.size.CGFloat width = width;
        v52.size.CGFloat height = height;
        v54.origin.CGFloat x = v36;
        v54.origin.CGFloat y = y;
        v54.size.CGFloat height = height;
        if (CGRectIntersectsRect(v52, v54)
          || ([(ICTableTextViewManager *)self draggedColumns],
              int v38 = objc_claimAutoreleasedReturnValue(),
              int v39 = [v38 containsObject:v32],
              v38,
              v39))
        {

          goto LABEL_23;
        }
        [(ICTableTextViewManager *)self clearColumn:v32];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v40 objects:v48 count:16];
      if (v29) {
        continue;
      }
      break;
    }
  }
LABEL_23:
}

- (void)clearRowsOutsideFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v8 = [(ICTableTextViewManager *)self columnIDs];
  uint64_t v9 = [v8 firstObject];

  if (v9)
  {
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    uint64_t v10 = [(ICTableTextViewManager *)self rowIDs];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v50 objects:v55 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v51;
LABEL_4:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v51 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v50 + 1) + 8 * v14);
        double v16 = [(ICTableTextViewManager *)self tableLayoutManager];
        CGFloat v17 = [v16 rowPositions];
        CGFloat v18 = [v17 objectForKey:v15];
        [v18 doubleValue];
        CGFloat v20 = v19;

        unint64_t v21 = [(ICTableTextViewManager *)self cachedRowHeights];
        [v21 dimensionForKey:v15];
        double v23 = v22;

        v57.origin.CGFloat x = x;
        v57.origin.CGFloat y = y;
        v57.size.CGFloat width = width;
        v57.size.CGFloat height = height;
        v59.origin.CGFloat x = x;
        v59.origin.CGFloat y = v20;
        v59.size.CGFloat width = width;
        v59.size.CGFloat height = v23;
        if (CGRectIntersectsRect(v57, v59)) {
          break;
        }
        double v24 = [(ICTableTextViewManager *)self draggedRows];
        char v25 = [v24 containsObject:v15];

        if (v25) {
          break;
        }
        [(ICTableTextViewManager *)self clearRow:v15];
        [(ICTableTextViewManager *)self setAnchorRow:[(ICTableTextViewManager *)self anchorRow] + 1];
        [(ICTableTextViewManager *)self anchorPoint];
        double v27 = v26;
        [(ICTableTextViewManager *)self anchorPoint];
        -[ICTableTextViewManager setAnchorPoint:](self, "setAnchorPoint:", v27, v23 + v28);
        if (v12 == ++v14)
        {
          uint64_t v12 = [v10 countByEnumeratingWithState:&v50 objects:v55 count:16];
          if (v12) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v29 = [(ICTableTextViewManager *)self rowIDs];
    uint64_t v30 = [v29 reverseObjectEnumerator];

    uint64_t v31 = [v30 countByEnumeratingWithState:&v46 objects:v54 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v47;
LABEL_13:
      uint64_t v34 = 0;
      while (1)
      {
        if (*(void *)v47 != v33) {
          objc_enumerationMutation(v30);
        }
        uint64_t v35 = *(void *)(*((void *)&v46 + 1) + 8 * v34);
        CGFloat v36 = [(ICTableTextViewManager *)self tableLayoutManager];
        CGFloat v37 = [v36 rowPositions];
        int v38 = [v37 objectForKey:v35];
        [v38 doubleValue];
        CGFloat v40 = v39;

        long long v41 = [(ICTableTextViewManager *)self cachedRowHeights];
        [v41 dimensionForKey:v35];
        CGFloat v43 = v42;

        v58.origin.CGFloat x = x;
        v58.origin.CGFloat y = y;
        v58.size.CGFloat width = width;
        v58.size.CGFloat height = height;
        v60.origin.CGFloat x = x;
        v60.origin.CGFloat y = v40;
        v60.size.CGFloat width = width;
        v60.size.CGFloat height = v43;
        if (CGRectIntersectsRect(v58, v60)) {
          break;
        }
        long long v44 = [(ICTableTextViewManager *)self draggedRows];
        char v45 = [v44 containsObject:v35];

        if (v45) {
          break;
        }
        [(ICTableTextViewManager *)self clearRow:v35];
        if (v32 == ++v34)
        {
          uint64_t v32 = [v30 countByEnumeratingWithState:&v46 objects:v54 count:16];
          if (v32) {
            goto LABEL_13;
          }
          break;
        }
      }
    }
  }
}

- (CGPoint)updateTilesWithViewport:(CGRect)a3 redrawAll:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v140 = *MEMORY[0x263EF8340];
  BOOL v10 = [(ICTableTextViewManager *)self isUpdatingTiles];
  uint64_t v11 = (double *)MEMORY[0x263F00148];
  if (v10)
  {
    double v12 = *MEMORY[0x263F00148];
    double v13 = *(double *)(MEMORY[0x263F00148] + 8);
  }
  else
  {
    [(ICTableTextViewManager *)self setUpdatingTiles:1];
    [(ICTableTextViewManager *)self boundingRect];
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    v129 = self;
    double v22 = [(ICTableTextViewManager *)self tableLayoutManager];
    double v23 = [v22 table];

    v152.size.double width = width;
    v152.origin.double y = y;
    double v125 = *v11;
    obuint64_t j = v11[1];
    v142.origin.double x = v15;
    v142.origin.double y = v17;
    v142.size.double width = v19;
    v142.size.double height = v21;
    v152.origin.double x = x;
    v152.size.double height = height;
    if (CGRectContainsRect(v142, v152)
      && (v143.origin.x = v15, v143.origin.y = v17, v143.size.width = v19, v143.size.double height = v21, !CGRectIsEmpty(v143)))
    {
      double v13 = obj;
      double v12 = v125;
      CGFloat v37 = self;
    }
    else
    {
      CGFloat v121 = v21;
      CGFloat v122 = v19;
      -[ICTableTextViewManager clearColumnsOutsideFrame:](self, "clearColumnsOutsideFrame:", x, y, width, height);
      -[ICTableTextViewManager clearRowsOutsideFrame:](self, "clearRowsOutsideFrame:", x, y, width, height);
      double v24 = [(ICTableTextViewManager *)self draggedColumns];
      uint64_t v25 = [v24 count];

      if (v25)
      {
        id v26 = objc_alloc(MEMORY[0x263EFF9C0]);
        double v27 = [(ICTableTextViewManager *)self columnIdentifiers];
        double v28 = (void *)[v26 initWithArray:v27];

        uint64_t v29 = [(ICTableTextViewManager *)self draggedColumns];
        [v28 intersectSet:v29];

        uint64_t v25 = [v28 count];
      }
      uint64_t v30 = [(ICTableTextViewManager *)self draggedRows];
      uint64_t v31 = [v30 count];

      CGFloat v123 = v17;
      CGFloat v124 = v15;
      if (v31)
      {
        id v32 = objc_alloc(MEMORY[0x263EFF9C0]);
        uint64_t v33 = [(ICTableTextViewManager *)self rowIdentifiers];
        uint64_t v34 = (void *)[v32 initWithArray:v33];

        uint64_t v35 = [(ICTableTextViewManager *)self draggedRows];
        [v34 intersectSet:v35];

        uint64_t v36 = [v34 count];
      }
      else
      {
        uint64_t v36 = 0;
      }
      CGFloat v37 = self;
      [(ICTableTextViewManager *)self anchorPoint];
      double v39 = v38;
      v144.origin.double x = x;
      v144.origin.double y = y;
      v144.size.double width = width;
      CGFloat rect = height;
      v144.size.double height = height;
      double MinX = CGRectGetMinX(v144);
      unint64_t v41 = [(ICTableTextViewManager *)self anchorColumn];
      double v12 = v125;
      if (v39 > MinX)
      {
        uint64_t v42 = v41 + v25;
        double v12 = v125;
        if ((uint64_t)(v41 + v25) >= 1)
        {
          double v12 = v125;
          do
          {
            if (([v23 isLeftToRight] & 1) == 0) {
              [v23 columnCount];
            }
            --v42;
            CGFloat v43 = objc_msgSend(v23, "identifierForColumnAtIndex:");
            if (v43)
            {
              long long v44 = [(ICTableTextViewManager *)self columnIdentifiers];
              char v45 = [v44 containsObject:v43];

              if ((v45 & 1) == 0)
              {
                long long v46 = [(ICTableTextViewManager *)self cachedColumnWidths];
                [v46 dimensionForKey:v43];
                double v48 = v47;

                [(ICTableTextViewManager *)self addColumn:v43 atEnd:0];
                double v39 = v39 - v49;
                double v12 = v12 + v49 - v48;
              }
            }
          }
          while (v39 > MinX && v42 > 0);
        }
      }
      [(ICTableTextViewManager *)self anchorPoint];
      double v51 = v50;
      v145.origin.double y = v123;
      v145.origin.double x = v124;
      v145.size.double height = v21;
      v145.size.double width = v122;
      double MaxX = CGRectGetMaxX(v145);
      if (v51 >= MaxX) {
        double v53 = v51;
      }
      else {
        double v53 = MaxX;
      }
      v146.origin.double x = x;
      v146.origin.double y = y;
      v146.size.double width = width;
      v146.size.double height = rect;
      double v54 = CGRectGetMaxX(v146);
      unint64_t v55 = [(ICTableTextViewManager *)self anchorColumn];
      uint64_t v56 = [(ICTableTextViewManager *)self columnIDs];
      uint64_t v57 = [v56 count];

      if (v53 < v54)
      {
        unint64_t v58 = v55 - v25 + v57;
        do
        {
          if (v58 >= [v23 columnCount]) {
            break;
          }
          if ([v23 isLeftToRight])
          {
            unint64_t v59 = v58++;
          }
          else
          {
            ++v58;
            unint64_t v59 = [v23 columnCount] - v58;
          }
          CGRect v60 = [v23 identifierForColumnAtIndex:v59];
          if (v60)
          {
            CGRect v61 = [(ICTableTextViewManager *)v129 columnIdentifiers];
            char v62 = [v61 containsObject:v60];

            if ((v62 & 1) == 0)
            {
              [(ICTableTextViewManager *)v129 ensureChunkOfPopulatedColumnsForColumn:v60];
              double v53 = v53 + v63;
            }
          }
        }
        while (v53 < v54);
      }
      [(ICTableTextViewManager *)v129 anchorPoint];
      double v65 = v64;
      v147.origin.double x = x;
      v147.origin.double y = y;
      v147.size.double width = width;
      v147.size.double height = rect;
      double MinY = CGRectGetMinY(v147);
      uint64_t v67 = [(ICTableTextViewManager *)v129 anchorRow] + v36;
      BOOL v68 = v65 <= MinY || v67 < 1;
      double v13 = obj;
      if (!v68)
      {
        double v13 = obj;
        do
        {
          v69 = [v23 identifierForRowAtIndex:v67 - 1];
          if (v69)
          {
            v70 = [(ICTableTextViewManager *)v129 rowIdentifiers];
            char v71 = [v70 containsObject:v69];

            if ((v71 & 1) == 0)
            {
              v72 = [(ICTableTextViewManager *)v129 cachedRowHeights];
              [v72 dimensionForKey:v69];
              double v74 = v73;

              [(ICTableTextViewManager *)v129 addRow:v69 atEnd:0];
              double v65 = v65 - v75;
              double v13 = v13 + v75 - v74;
            }
          }
        }
        while (v65 > MinY && (unint64_t)v67-- > 1);
      }
      [(ICTableTextViewManager *)v129 anchorPoint];
      double v78 = v77;
      v148.origin.double y = v123;
      v148.origin.double x = v124;
      v148.size.double height = v121;
      v148.size.double width = v122;
      double MaxY = CGRectGetMaxY(v148);
      if (v78 >= MaxY) {
        double v80 = v78;
      }
      else {
        double v80 = MaxY;
      }
      v149.origin.double x = x;
      v149.origin.double y = y;
      v149.size.double width = width;
      v149.size.double height = rect;
      double v81 = CGRectGetMaxY(v149);
      uint64_t v82 = [(ICTableTextViewManager *)v129 anchorRow];
      v83 = [(ICTableTextViewManager *)v129 rowIDs];
      uint64_t v84 = [v83 count];

      if (v80 < v81)
      {
        unint64_t v85 = v82 - v36 + v84;
        do
        {
          if (v85 >= [v23 rowCount]) {
            break;
          }
          v86 = [v23 identifierForRowAtIndex:v85];
          if (v86)
          {
            v87 = [(ICTableTextViewManager *)v129 rowIdentifiers];
            char v88 = [v87 containsObject:v86];

            if ((v88 & 1) == 0)
            {
              [(ICTableTextViewManager *)v129 ensureChunkOfPopulatedRowsForRow:v86 shouldForce:v4];
              double v80 = v80 + v89;
            }
          }

          ++v85;
        }
        while (v80 < v81);
      }
      v90 = [(ICTableTextViewManager *)v129 contentView];
      if (v12 != v125 || v13 != obj)
      {
        v120 = v23;
        if (v12 != 0.0)
        {
          long long v136 = 0u;
          long long v137 = 0u;
          long long v134 = 0u;
          long long v135 = 0u;
          v92 = [(ICTableTextViewManager *)v129 columnIdentifiers];
          uint64_t v93 = [v92 countByEnumeratingWithState:&v134 objects:v139 count:16];
          if (v93)
          {
            uint64_t v94 = v93;
            uint64_t v95 = *(void *)v135;
            do
            {
              for (uint64_t i = 0; i != v94; ++i)
              {
                if (*(void *)v135 != v95) {
                  objc_enumerationMutation(v92);
                }
                uint64_t v97 = *(void *)(*((void *)&v134 + 1) + 8 * i);
                v98 = [(ICTableTextViewManager *)v129 columnTextViews];
                v99 = [v98 objectForKeyedSubscript:v97];

                [v99 frame];
                CGRect v151 = CGRectOffset(v150, v12, 0.0);
                objc_msgSend(v99, "setFrame:", v151.origin.x, v151.origin.y, v151.size.width, v151.size.height);
                v100 = NSNumber;
                [v99 frame];
                v101 = objc_msgSend(v100, "numberWithDouble:");
                [v90 setVerticalLinePosition:v101 forKey:v97];
              }
              uint64_t v94 = [v92 countByEnumeratingWithState:&v134 objects:v139 count:16];
            }
            while (v94);
          }

          double v23 = v120;
        }
        if (v13 != 0.0)
        {
          long long v132 = 0u;
          long long v133 = 0u;
          long long v130 = 0u;
          long long v131 = 0u;
          id obja = [(ICTableTextViewManager *)v129 rowIdentifiers];
          uint64_t v102 = [obja countByEnumeratingWithState:&v130 objects:v138 count:16];
          if (v102)
          {
            uint64_t v103 = v102;
            uint64_t v104 = *(void *)v131;
            do
            {
              for (uint64_t j = 0; j != v103; ++j)
              {
                if (*(void *)v131 != v104) {
                  objc_enumerationMutation(obja);
                }
                uint64_t v106 = *(void *)(*((void *)&v130 + 1) + 8 * j);
                v107 = [(ICTableTextViewManager *)v129 tableLayoutManager];
                v108 = [v107 rowPositions];
                v109 = [v108 objectForKey:v106];
                [v109 doubleValue];
                double v111 = v110;

                double v112 = v13 + v111;
                v113 = [(ICTableTextViewManager *)v129 tableLayoutManager];
                [v113 setYPosition:v106 forRow:1 shouldInvalidate:v112];

                v114 = [NSNumber numberWithDouble:v112];
                [v90 setHorizontalLinePosition:v114 forKey:v106];
              }
              uint64_t v103 = [obja countByEnumeratingWithState:&v130 objects:v138 count:16];
            }
            while (v103);
          }

          CGFloat v37 = v129;
          double v23 = v120;
        }
        [(ICTableTextViewManager *)v37 anchorPoint];
        double v116 = v12 + v115;
        [(ICTableTextViewManager *)v37 anchorPoint];
        -[ICTableTextViewManager setAnchorPoint:](v37, "setAnchorPoint:", v116, v13 + v117);
      }
    }
    [(ICTableTextViewManager *)v37 setUpdatingTiles:0];
  }
  double v118 = v12;
  double v119 = v13;
  result.double y = v119;
  result.double x = v118;
  return result;
}

- (CGPoint)redrawAllWithViewport:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v8 = [(ICTableTextViewManager *)self tableLayoutManager];
  uint64_t v9 = [v8 table];
  BOOL v10 = [(ICTableTextViewManager *)self rowIdentifiers];
  uint64_t v11 = (void *)[v10 copy];
  double v12 = [v9 rowsIntersectingWithRows:v11];
  [(ICTableTextViewManager *)self setPreviousRowIdentifiers:v12];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  double v13 = [(ICTableTextViewManager *)self rowIdentifiers];
  double v14 = (void *)[v13 copy];

  uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v36;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v36 != v17) {
          objc_enumerationMutation(v14);
        }
        [(ICTableTextViewManager *)self clearRow:*(void *)(*((void *)&v35 + 1) + 8 * v18++)];
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v16);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  CGFloat v19 = [(ICTableTextViewManager *)self columnIdentifiers];
  double v20 = (void *)[v19 copy];

  uint64_t v21 = [v20 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v32;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v32 != v23) {
          objc_enumerationMutation(v20);
        }
        [(ICTableTextViewManager *)self clearColumn:*(void *)(*((void *)&v31 + 1) + 8 * v24++)];
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v22);
  }

  -[ICTableTextViewManager updateTilesWithViewport:redrawAll:](self, "updateTilesWithViewport:redrawAll:", 1, x, y, width, height);
  double v26 = v25;
  double v28 = v27;
  [(ICTableTextViewManager *)self setPreviousRowIdentifiers:0];
  double v29 = v26;
  double v30 = v28;
  result.double y = v30;
  result.double x = v29;
  return result;
}

- (void)heightChangedForRow:(id)a3 by:(double)a4
{
  id v21 = a3;
  if (a4 != 0.0)
  {
    id v6 = [(ICTableTextViewManager *)self rowIdentifiers];
    uint64_t v7 = [v6 indexOfObject:v21];

    id v8 = [(ICTableTextViewManager *)self rowIdentifiers];
    unint64_t v9 = [v8 count];

    unint64_t v10 = v7 + 1;
    if (v10 < v9)
    {
      do
      {
        uint64_t v11 = [(ICTableTextViewManager *)self rowIdentifiers];
        double v12 = [v11 objectAtIndex:v10];

        double v13 = [(ICTableTextViewManager *)self tableLayoutManager];
        double v14 = [v13 rowPositions];
        uint64_t v15 = [v14 objectForKey:v12];
        [v15 doubleValue];
        double v17 = v16 + a4;

        uint64_t v18 = [(ICTableTextViewManager *)self tableLayoutManager];
        [v18 setYPosition:v12 forRow:1 shouldInvalidate:v17];

        CGFloat v19 = [(ICTableTextViewManager *)self contentView];
        double v20 = [NSNumber numberWithDouble:v17];
        [v19 setHorizontalLinePosition:v20 forKey:v12];

        ++v10;
      }
      while (v9 != v10);
    }
  }
}

- (void)removeColumn:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(ICTableTextViewManager *)self columnTextViews];
  int v5 = [v4 objectForKey:v7];

  [v5 removeFromSuperview];
  if (v5)
  {
    id v6 = [(ICTableTextViewManager *)self columnTextViews];
    [v6 removeObjectForKey:v7];
  }
}

- (void)moveColumnAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  id v7 = [(ICTableTextViewManager *)self columnIdentifiers];
  id v10 = [v7 objectAtIndex:a3];

  id v8 = [(ICTableTextViewManager *)self columnIdentifiers];
  [v8 removeObjectAtIndex:a3];

  unint64_t v9 = [(ICTableTextViewManager *)self columnIdentifiers];
  [v9 insertObject:v10 atIndex:a4];
}

- (void)moveRowAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  id v7 = [(ICTableTextViewManager *)self rowIdentifiers];
  id v10 = [v7 objectAtIndex:a3];

  id v8 = [(ICTableTextViewManager *)self rowIdentifiers];
  [v8 removeObjectAtIndex:a3];

  unint64_t v9 = [(ICTableTextViewManager *)self rowIdentifiers];
  [v9 insertObject:v10 atIndex:a4];
}

- (BOOL)cellContainingPoint:(CGPoint)a3 columnID:(id *)a4 rowID:(id *)a5
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v10 = [(ICTableTextViewManager *)self contentView];
  uint64_t v11 = objc_msgSend(v10, "hitTest:withEvent:", 0, x, y);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    double v12 = ICCheckedDynamicCast();
    double v13 = [v12 columnID];
    if (v13)
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      double v14 = [(ICTableTextViewManager *)self rowIdentifiers];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        long long v35 = v12;
        id v36 = v13;
        long long v33 = a4;
        long long v34 = a5;
        uint64_t v17 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v38 != v17) {
              objc_enumerationMutation(v14);
            }
            CGFloat v19 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            double v20 = [(ICTableTextViewManager *)self tableLayoutManager];
            id v21 = [v20 rowPositions];
            uint64_t v22 = [v21 objectForKey:v19];
            [v22 doubleValue];
            double v24 = v23;

            double v25 = [(ICTableTextViewManager *)self cachedRowHeights];
            [v25 dimensionForKey:v19];
            double v27 = v26;

            double v28 = v24 + v27;
            if (v24 <= y && v28 >= y)
            {
              double v13 = v36;
              id *v33 = v36;
              id *v34 = v19;
              int v31 = 1;
              goto LABEL_17;
            }
          }
          uint64_t v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v41, 16, v28);
        }
        while (v16);
        int v31 = 0;
        double v13 = v36;
LABEL_17:
        double v12 = v35;
      }
      else
      {
        int v31 = 0;
      }
    }
    else
    {
      int v31 = 0;
    }

    BOOL v30 = v31 != 0;
  }
  else
  {
    BOOL v30 = 0;
  }

  return v30;
}

- (id)columnContainingX:(double)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  int v5 = [(ICTableTextViewManager *)self columnIdentifiers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = [(ICTableTextViewManager *)self textViewForColumn:v10];
        [v11 frame];
        if (CGRectGetMinX(v21) <= a3)
        {
          [v11 frame];
          if (CGRectGetMaxX(v22) >= a3)
          {
            id v12 = v10;

            goto LABEL_12;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_12:

  return v12;
}

- (id)rowContainingY:(double)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  int v5 = [(ICTableTextViewManager *)self rowIdentifiers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v11 = [(ICTableTextViewManager *)self tableLayoutManager];
        id v12 = [v11 rowPositions];
        double v13 = [v12 objectForKey:v10];
        [v13 doubleValue];
        double v15 = v14;

        long long v16 = [(ICTableTextViewManager *)self cachedRowHeights];
        [v16 dimensionForKey:v10];
        double v18 = v17;

        double v19 = v15 + v18;
        if (v15 <= a3 && v19 >= a3)
        {
          id v21 = v10;
          goto LABEL_14;
        }
      }
      uint64_t v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16, v19);
    }
    while (v7);
  }
  id v21 = 0;
LABEL_14:

  return v21;
}

- (id)textViewForColumn:(id)a3
{
  return [(ICTableTextViewManager *)self textViewForColumn:a3 createIfNeeded:0];
}

- (id)textViewForColumn:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(ICTableTextViewManager *)self columnTextViews];
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];

  if (!v8 && v4)
  {
    unint64_t v9 = [(ICTableTextViewManager *)self tableLayoutManager];
    id v10 = [v9 columnLayoutManagerForColumn:v6];

    uint64_t v11 = [ICTableColumnTextView alloc];
    id v12 = [v10 textContainer];
    uint64_t v8 = -[ICTableColumnTextView initWithFrame:textContainer:](v11, "initWithFrame:textContainer:", v12, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));

    [(ICTableColumnTextView *)v8 setAutoresizingMask:20];
    [v10 setTextView:v8];
    [(ICTableColumnTextView *)v8 setDataDetectorTypes:-1];
    double v13 = [(ICTableTextViewManager *)self delegate];
    double v14 = [v13 noteTextView];
    -[ICTableColumnTextView _setDataOwnerForCopy:](v8, "_setDataOwnerForCopy:", [v14 _dataOwnerForCopy]);

    double v15 = [(ICTableTextViewManager *)self delegate];
    long long v16 = [v15 noteTextView];
    -[ICTableColumnTextView _setDataOwnerForPaste:](v8, "_setDataOwnerForPaste:", [v16 _dataOwnerForPaste]);

    double v17 = [(ICTableTextViewManager *)self delegate];
    double v18 = [v17 noteTextView];
    double v19 = [v18 editorController];
    [(ICTableColumnTextView *)v8 setEditorController:v19];

    double v20 = [(ICTableColumnTextView *)v8 textContainer];
    [v20 setWidthTracksTextView:1];

    id v21 = [(ICTableColumnTextView *)v8 textContainer];
    [v21 setHeightTracksTextView:0];

    [(ICTableColumnTextView *)v8 setSelectable:1];
    [(ICTableColumnTextView *)v8 setColumnID:v6];
    CGRect v22 = [v10 textContainer];
    [v22 replaceLayoutManager:v10];

    long long v23 = [(ICTableTextViewManager *)self columnTextViews];
    [v23 setObject:v8 forKeyedSubscript:v6];

    long long v24 = [(ICTableTextViewManager *)self delegate];

    if (v24)
    {
      long long v25 = [(ICTableTextViewManager *)self delegate];
      [v25 setupTableTextView:v8];
    }
  }

  return v8;
}

- (void)parentViewDidChange
{
  v3 = [(ICTableTextViewManager *)self delegate];

  if (v3)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __45__ICTableTextViewManager_parentViewDidChange__block_invoke;
    v4[3] = &unk_2640B8AE8;
    v4[4] = self;
    [(ICTableTextViewManager *)self enumerateTextViewsWithBlock:v4];
  }
}

void __45__ICTableTextViewManager_parentViewDidChange__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v6 = [v2 delegate];
  BOOL v4 = [v6 noteTextView];
  int v5 = [v4 editorController];
  [v3 setEditorController:v5];
}

- (void)restyleCells
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = [(ICTableTextViewManager *)self columnsNeedingRestyle];

  if (!v3)
  {
    BOOL v4 = (void *)MEMORY[0x263EFF9C0];
    int v5 = [(ICTableTextViewManager *)self columnTextViews];
    id v6 = objc_msgSend(v4, "setWithCapacity:", objc_msgSend(v5, "count"));
    [(ICTableTextViewManager *)self setColumnsNeedingRestyle:v6];
  }
  uint64_t v7 = [(ICTableTextViewManager *)self columnsNeedingRestyle];
  uint64_t v8 = [(ICTableTextViewManager *)self prepopulatedColumns];
  [v7 unionSet:v8];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unint64_t v9 = [(ICTableTextViewManager *)self columnTextViews];
  id v10 = [v9 allKeys];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * v14);
        long long v16 = [(ICTableTextViewManager *)self columnsNeedingRestyle];
        [v16 addObject:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __38__ICTableTextViewManager_restyleCells__block_invoke;
  v17[3] = &unk_2640B8AE8;
  v17[4] = self;
  [(ICTableTextViewManager *)self enumerateTextViewsWithBlock:v17];
}

uint64_t __38__ICTableTextViewManager_restyleCells__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) restyleTextView:a2];
}

- (void)restyleTextView:(id)a3
{
  id v4 = a3;
  id v14 = [v4 columnTextStorage];
  [v14 setShouldPreventUndoCommands:1];
  [v14 beginPreventEditingUpdates];
  int v5 = [(ICTableTextViewManager *)self delegate];
  id v6 = [v5 noteTextView];
  uint64_t v7 = [v6 TTTextStorage];
  uint64_t v8 = [v7 styler];
  unint64_t v9 = [v8 zoomController];
  id v10 = [v14 styler];
  [v10 setZoomController:v9];

  uint64_t v11 = [v14 styler];
  objc_msgSend(v11, "styleText:inRange:fixModelAttributes:", v14, 0, objc_msgSend(v14, "length"), 0);

  [v14 endPreventEditingUpdates];
  [v14 setShouldPreventUndoCommands:0];
  uint64_t v12 = [(ICTableTextViewManager *)self columnsNeedingRestyle];
  uint64_t v13 = [v4 columnID];

  [v12 removeObject:v13];
}

- (void)updateAuthorHighlights
{
}

void __48__ICTableTextViewManager_updateAuthorHighlights__block_invoke(uint64_t a1, void *a2)
{
  id v7 = [a2 columnTextStorage];
  objc_opt_class();
  v2 = [v7 styler];
  id v3 = ICDynamicCast();

  id v4 = [v3 authorHighlightsController];
  uint64_t v5 = objc_msgSend(v7, "ic_range");
  objc_msgSend(v4, "performHighlightUpdatesForRange:inTextStorage:updates:", v5, v6, v7, 0);
}

- (CGRect)frameOfCellAtColumn:(id)a3 row:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CGFloat x = *MEMORY[0x263F001A8];
  CGFloat y = *(double *)(MEMORY[0x263F001A8] + 8);
  CGFloat width = *(double *)(MEMORY[0x263F001A8] + 16);
  CGFloat height = *(double *)(MEMORY[0x263F001A8] + 24);
  uint64_t v12 = [(ICTableTextViewManager *)self tableLayoutManager];
  uint64_t v13 = [v12 columnWidthManager];

  id v14 = [(ICTableTextViewManager *)self tableLayoutManager];
  uint64_t v15 = [v14 table];

  unint64_t v16 = [(ICTableTextViewManager *)self anchorColumn];
  unint64_t v17 = [(ICTableTextViewManager *)self anchorRow];
  [(ICTableTextViewManager *)self boundingRect];
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  long long v26 = [(ICTableTextViewManager *)self columnTextViews];
  double v27 = [v26 objectForKey:v6];

  rect_8 = v27;
  CGFloat rect = v19;
  if (v27
    && ([(ICTableTextViewManager *)self columnIdentifiers],
        uint64_t v28 = objc_claimAutoreleasedReturnValue(),
        int v29 = [v28 containsObject:v6],
        v28,
        v29))
  {
    [v27 frame];
    CGFloat v31 = v30;
    v85.origin.CGFloat x = x;
    v85.origin.CGFloat y = y;
    v85.size.CGFloat width = width;
    v85.size.CGFloat height = height;
    CGRect v86 = CGRectOffset(v85, v31, 0.0);
    CGFloat x = v86.origin.x;
    CGFloat y = v86.origin.y;
    CGFloat width = v86.size.width;
    CGFloat height = v86.size.height;
  }
  else if (objc_msgSend(v15, "containsColumn:", v6, *(void *)&v19, v27))
  {
    unint64_t v32 = [v15 columnIndexForIdentifier:v6];
    long long v33 = [(ICTableTextViewManager *)self columnIdentifiers];
    unint64_t v34 = [v33 count] + v16;

    if (v32 >= v34)
    {
      v99.origin.CGFloat x = v19;
      v99.origin.CGFloat y = v21;
      v99.size.CGFloat width = v23;
      v99.size.CGFloat height = v25;
      CGFloat MaxX = CGRectGetMaxX(v99);
      v100.origin.CGFloat x = x;
      v100.origin.CGFloat y = y;
      v100.size.CGFloat width = width;
      v100.size.CGFloat height = height;
      CGRect v101 = CGRectOffset(v100, MaxX, 0.0);
      CGFloat x = v101.origin.x;
      CGFloat y = v101.origin.y;
      CGFloat width = v101.size.width;
      CGFloat height = v101.size.height;
      uint64_t v67 = [(ICTableTextViewManager *)self columnIdentifiers];
      unint64_t v68 = [v67 count] + v16;

      while (v68 < v32)
      {
        v69 = [v15 identifierForColumnAtIndex:v68];
        [v13 widthOfColumn:v69];
        double v71 = v70;
        v72 = [(ICTableTextViewManager *)self cachedColumnWidths];
        [v72 setDimension:v69 forKey:v71];

        v102.origin.CGFloat x = x;
        v102.origin.CGFloat y = y;
        v102.size.CGFloat width = width;
        v102.size.CGFloat height = height;
        CGRect v103 = CGRectOffset(v102, v71, 0.0);
        CGFloat x = v103.origin.x;
        CGFloat y = v103.origin.y;
        CGFloat width = v103.size.width;
        CGFloat height = v103.size.height;

        ++v68;
      }
    }
    else
    {
      if (v32 >= v16) {
        [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"columnIndex < origColumn" functionName:"-[ICTableTextViewManager frameOfCellAtColumn:row:]" simulateCrash:1 showAlert:0 format:@"Expected column to be outside current cells"];
      }
      v87.origin.CGFloat x = v19;
      v87.origin.CGFloat y = v21;
      v87.size.CGFloat width = v23;
      v87.size.CGFloat height = v25;
      CGFloat MinX = CGRectGetMinX(v87);
      v88.origin.CGFloat x = x;
      v88.origin.CGFloat y = y;
      v88.size.CGFloat width = width;
      v88.size.CGFloat height = height;
      CGRect v89 = CGRectOffset(v88, MinX, 0.0);
      CGFloat x = v89.origin.x;
      CGFloat y = v89.origin.y;
      CGFloat width = v89.size.width;
      CGFloat height = v89.size.height;
      while (v16 > v32)
      {
        id v36 = [v15 identifierForColumnAtIndex:--v16];
        [v13 widthOfColumn:v36];
        double v38 = v37;
        long long v39 = [(ICTableTextViewManager *)self cachedColumnWidths];
        [v39 setDimension:v36 forKey:v38];

        v90.origin.CGFloat x = x;
        v90.origin.CGFloat y = y;
        v90.size.CGFloat width = width;
        v90.size.CGFloat height = height;
        CGRect v91 = CGRectOffset(v90, -v38, 0.0);
        CGFloat x = v91.origin.x;
        CGFloat y = v91.origin.y;
        CGFloat width = v91.size.width;
        CGFloat height = v91.size.height;
      }
    }
  }
  long long v40 = [(ICTableTextViewManager *)self rowIdentifiers];
  int v41 = [v40 containsObject:v7];

  if (v41)
  {
    uint64_t v42 = [(ICTableTextViewManager *)self tableLayoutManager];
    CGFloat v43 = [v42 rowPositions];
    long long v44 = [v43 objectForKey:v7];
    [v44 doubleValue];
    CGFloat v46 = v45;

    v92.origin.CGFloat x = x;
    v92.origin.CGFloat y = y;
    v92.size.CGFloat width = width;
    v92.size.CGFloat height = height;
    CGRect v93 = CGRectOffset(v92, 0.0, v46);
    CGFloat x = v93.origin.x;
    CGFloat y = v93.origin.y;
  }
  else if ([v15 containsRow:v7])
  {
    unint64_t v47 = [v15 rowIndexForIdentifier:v7];
    double v48 = [(ICTableTextViewManager *)self rowIdentifiers];
    unint64_t v49 = [v48 count] + v17;

    if (v47 >= v49)
    {
      v104.origin.CGFloat x = recta;
      v104.origin.CGFloat y = v21;
      v104.size.CGFloat width = v23;
      v104.size.CGFloat height = v25;
      CGFloat MaxY = CGRectGetMaxY(v104);
      v105.origin.CGFloat x = x;
      v105.origin.CGFloat y = y;
      v105.size.CGFloat width = width;
      v105.size.CGFloat height = height;
      CGRect v106 = CGRectOffset(v105, 0.0, MaxY);
      CGFloat x = v106.origin.x;
      CGFloat y = v106.origin.y;
      CGFloat v74 = v106.size.width;
      CGFloat v75 = v106.size.height;
      v76 = [(ICTableTextViewManager *)self rowIdentifiers];
      unint64_t v77 = [v76 count] + v17;

      while (v77 < v47)
      {
        double v78 = [v15 identifierForRowAtIndex:v77];
        v79 = [(ICTableTextViewManager *)self cachedRowHeights];
        [v79 dimensionForKey:v78];
        CGFloat v81 = v80;

        v107.origin.CGFloat x = x;
        v107.origin.CGFloat y = y;
        v107.size.CGFloat width = v74;
        v107.size.CGFloat height = v75;
        CGRect v108 = CGRectOffset(v107, 0.0, v81);
        CGFloat x = v108.origin.x;
        CGFloat y = v108.origin.y;
        CGFloat v74 = v108.size.width;
        CGFloat v75 = v108.size.height;

        ++v77;
      }
    }
    else
    {
      if (v47 >= v17) {
        [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"rowIndex < origRow" functionName:"-[ICTableTextViewManager frameOfCellAtColumn:row:]" simulateCrash:1 showAlert:0 format:@"Expected row to be outside current cells"];
      }
      v94.origin.CGFloat x = recta;
      v94.origin.CGFloat y = v21;
      v94.size.CGFloat width = v23;
      v94.size.CGFloat height = v25;
      CGFloat MinY = CGRectGetMinY(v94);
      v95.origin.CGFloat x = x;
      v95.origin.CGFloat y = y;
      v95.size.CGFloat width = width;
      v95.size.CGFloat height = height;
      CGRect v96 = CGRectOffset(v95, 0.0, MinY);
      CGFloat x = v96.origin.x;
      CGFloat y = v96.origin.y;
      if (v47 < v17)
      {
        CGFloat v51 = v96.size.width;
        CGFloat v52 = v96.size.height;
        do
        {
          double v53 = [v15 identifierForRowAtIndex:--v17];
          double v54 = [(ICTableTextViewManager *)self cachedRowHeights];
          [v54 dimensionForKey:v53];
          double v56 = v55;

          v97.origin.CGFloat x = x;
          v97.origin.CGFloat y = y;
          v97.size.CGFloat width = v51;
          v97.size.CGFloat height = v52;
          CGRect v98 = CGRectOffset(v97, 0.0, -v56);
          CGFloat x = v98.origin.x;
          CGFloat y = v98.origin.y;
          CGFloat v51 = v98.size.width;
          CGFloat v52 = v98.size.height;
        }
        while (v17 > v47);
      }
    }
  }
  [v13 widthOfColumn:v6];
  double v58 = v57;
  unint64_t v59 = [(ICTableTextViewManager *)self cachedRowHeights];
  [v59 dimensionForKey:v7];
  double v61 = v60;

  double v62 = x;
  double v63 = y;
  double v64 = v58;
  double v65 = v61;
  result.size.CGFloat height = v65;
  result.size.CGFloat width = v64;
  result.origin.CGFloat y = v63;
  result.origin.CGFloat x = v62;
  return result;
}

- (CGRect)frameOfColumn:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICTableTextViewManager *)self columnTextViews];
  id v6 = [v5 objectForKeyedSubscript:v4];

  [v6 frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (CGRect)frameOfRow:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICTableTextViewManager *)self tableLayoutManager];
  id v6 = [v5 rowPositions];
  double v7 = [v6 objectForKey:v4];
  [v7 doubleValue];
  double v9 = v8;

  double v10 = [(ICTableTextViewManager *)self cachedRowHeights];
  [v10 dimensionForKey:v4];
  double v12 = v11;

  double v13 = [(ICTableTextViewManager *)self contentView];
  [v13 bounds];
  double v15 = v14;

  double v16 = 0.0;
  double v17 = v9;
  double v18 = v15;
  double v19 = v12;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (ICTableTextViewManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICTableTextViewManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableArray)columnIdentifiers
{
  return self->_columnIdentifiers;
}

- (NSMutableArray)rowIdentifiers
{
  return self->_rowIdentifiers;
}

- (NSMutableSet)prepopulatedColumns
{
  return self->_prepopulatedColumns;
}

- (NSMutableDictionary)columnTextViews
{
  return self->_columnTextViews;
}

- (ICTableLayoutManager)tableLayoutManager
{
  return self->_tableLayoutManager;
}

- (ICTableContentView)contentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);

  return (ICTableContentView *)WeakRetained;
}

- (ICDimensionSumCache)cachedColumnWidths
{
  return self->_cachedColumnWidths;
}

- (ICDimensionSumCache)cachedRowHeights
{
  return self->_cachedRowHeights;
}

- (NSMutableDictionary)cachedCellHeights
{
  return self->_cachedCellHeights;
}

- (NSArray)previousRowIdentifiers
{
  return self->_previousRowIdentifiers;
}

- (void)setPreviousRowIdentifiers:(id)a3
{
}

- (NSMutableSet)columnsNeedingRestyle
{
  return self->_columnsNeedingRestyle;
}

- (void)setColumnsNeedingRestyle:(id)a3
{
}

- (BOOL)isUpdatingTiles
{
  return self->_updatingTiles;
}

- (void)setUpdatingTiles:(BOOL)a3
{
  self->_updatingTiles = a3;
}

- (unint64_t)anchorColumn
{
  return self->_anchorColumn;
}

- (void)setAnchorColumn:(unint64_t)a3
{
  self->_anchorColumn = a3;
}

- (unint64_t)anchorRow
{
  return self->_anchorRow;
}

- (void)setAnchorRow:(unint64_t)a3
{
  self->_anchorRow = a3;
}

- (CGPoint)anchorPoint
{
  double x = self->_anchorPoint.x;
  double y = self->_anchorPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setAnchorPoint:(CGPoint)a3
{
  self->_anchorPoint = a3;
}

- (NSSet)draggedColumns
{
  return self->_draggedColumns;
}

- (void)setDraggedColumns:(id)a3
{
}

- (NSSet)draggedRows
{
  return self->_draggedRows;
}

- (void)setDraggedRows:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_draggedRows, 0);
  objc_storeStrong((id *)&self->_draggedColumns, 0);
  objc_storeStrong((id *)&self->_columnsNeedingRestyle, 0);
  objc_storeStrong((id *)&self->_previousRowIdentifiers, 0);
  objc_storeStrong((id *)&self->_cachedCellHeights, 0);
  objc_storeStrong((id *)&self->_cachedRowHeights, 0);
  objc_storeStrong((id *)&self->_cachedColumnWidths, 0);
  objc_destroyWeak((id *)&self->_contentView);
  objc_storeStrong((id *)&self->_tableLayoutManager, 0);
  objc_storeStrong((id *)&self->_columnTextViews, 0);
  objc_storeStrong((id *)&self->_prepopulatedColumns, 0);
  objc_storeStrong((id *)&self->_rowIdentifiers, 0);
  objc_storeStrong((id *)&self->_columnIdentifiers, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end