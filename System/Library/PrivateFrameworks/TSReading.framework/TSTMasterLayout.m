@interface TSTMasterLayout
+ (CGSize)tableNameTextSize:(id)a3;
+ (double)effectiveTableNameHeightForModel:(id)a3;
+ (id)tableNameTextEngine:(id)a3;
- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)dynamicSuppressingConditionalStylesCellID;
- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)layoutCellIDForModelCellID:(id)a3;
- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)modelCellIDForLayoutCellID:(id)a3;
- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)modelCellIDForStrokesOfLayoutCellID:(id)a3;
- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)p_validateFittingInfoForEmptyCellsBetween:(id)var0 andCellID:(id)a4 inRange:(id)a5;
- ($CA3468F20078D5D2DB35E78E73CA60DA)dynamicFontColorCellRange;
- ($CA3468F20078D5D2DB35E78E73CA60DA)dynamicResizingColumnRange;
- ($CA3468F20078D5D2DB35E78E73CA60DA)dynamicResizingRowRange;
- (BOOL)cell:(id *)a3 forCellID:(id)a4;
- (BOOL)dynamicBandedFill;
- (BOOL)dynamicBandedFillSetting;
- (BOOL)dynamicRepResize;
- (BOOL)dynamicResizingColumns;
- (BOOL)dynamicResizingRows;
- (BOOL)emptyFilteredTable;
- (BOOL)hintIsValid:(id)a3;
- (BOOL)inDynamicLayoutMode;
- (BOOL)isDynamicallyChangingColumnCount;
- (BOOL)isDynamicallyChangingContent;
- (BOOL)isDynamicallyChangingFontColorOfCellID:(id)a3;
- (BOOL)isDynamicallyChangingInfoGeometry;
- (BOOL)isDynamicallyChangingRowCount;
- (BOOL)isDynamicallyChangingRowOrColumnCount;
- (BOOL)isDynamicallyChangingSelection;
- (BOOL)isDynamicallyColumnTabResizing;
- (BOOL)isDynamicallyHidingContentOfCellID:(id)a3;
- (BOOL)isDynamicallyHidingRowsCols;
- (BOOL)isDynamicallyHidingRowsCols:(int)a3 rowColIndex:(unsigned __int16)a4;
- (BOOL)isDynamicallyHidingRowsColsCellID:(id)a3;
- (BOOL)isDynamicallyHidingTextOfCellID:(id)a3;
- (BOOL)isDynamicallyRepressingFrozenHeaders;
- (BOOL)isDynamicallyResizing:(int)a3;
- (BOOL)isDynamicallyResizing:(int)a3 rowColIndex:(unsigned __int16)a4;
- (BOOL)isDynamicallyResizingCellID:(id)a3;
- (BOOL)isDynamicallyResizingTableName;
- (BOOL)isDynamicallyRevealingRowsCols;
- (BOOL)isDynamicallyRevealingRowsCols:(int)a3 rowColIndex:(unsigned __int16)a4;
- (BOOL)isDynamicallyRowTabResizing;
- (BOOL)isDynamicallySettingBandedFill;
- (BOOL)isDynamicallySwappingColumns;
- (BOOL)isDynamicallySwappingRows;
- (BOOL)isGrouped;
- (BOOL)processHiddenRowsForExport;
- (BOOL)shouldRowUseBandedFill:(unsigned __int16)a3;
- (BOOL)updateDynamicChangeRowOrColumnCount:(int)a3 count:(int)a4 newlyAddedElementSize:(double)a5;
- (BOOL)useBandedFill;
- (CGSize)maximumPartitionSize;
- (CGSize)tableNameTextSize;
- (NSIndexSet)visibleColumnIndices;
- (NSIndexSet)visibleRowIndices;
- (NSMutableArray)changeDescriptors;
- (NSMutableSet)dynamicLayouts;
- (NSString)description;
- (TSDFill)bandedFillObject;
- (TSDInfoGeometry)dynamicInfoGeometry;
- (TSDLayoutGeometry)dynamicSavedLayoutGeometry;
- (TSKChangeNotifier)changeNotifier;
- (TSTCellRegion)dynamicSelectionRegion;
- (TSTDupContentCache)dupContentCache;
- (TSTHiddenRowsColumnsCache)hiddenRowsColumnsCache;
- (TSTLayout)dynamicLayout;
- (TSTLayoutDynamicColumnSwapProtocol)dynamicColumnSwapDelegate;
- (TSTLayoutDynamicContentProtocol)dynamicContentDelegate;
- (TSTLayoutDynamicRowSwapProtocol)dynamicRowSwapDelegate;
- (TSTMasterLayout)initWithInfo:(id)a3;
- (TSTMergeRangeSortedSet)mergeRanges;
- (TSTTableInfo)tableInfo;
- (TSTTableModel)tableModel;
- (TSTWPColumnCache)cellIDToWPColumnCache;
- (TSTWPColumnCache)tempWPColumnCache;
- (TSTWidthHeightCache)widthHeightCache;
- (TSUColor)dynamicFontColor;
- (TSUReadWriteQueue)whCacheQueue;
- (TSWPEditingController)containedTextEditor;
- (UIEdgeInsets)defaultPaddingForCellID:(id)a3;
- (UIEdgeInsets)edgeInsetsFromPadding:(id)a3;
- (UIEdgeInsets)paddingForCellID:(id)a3;
- (double)calculatedTableNameHeight;
- (double)calculatedTableNameHeightIncludingDynamicResize:(BOOL)a3;
- (double)dynamicAddOrRemoveColumnElementSize;
- (double)dynamicAddOrRemoveRowElementSize;
- (double)dynamicColumnTabSize;
- (double)dynamicHeightResize;
- (double)dynamicResizingColumnAdjustment;
- (double)dynamicResizingRowAdjustment;
- (double)dynamicRowTabSize;
- (double)dynamicTableNameResize;
- (double)dynamicWidthResize;
- (double)fontHeightOfParagraphStyle:(id)a3;
- (double)tableNameHeight;
- (id)accountingParagraphStylePropertyMapForCell:(id)a3 atCellID:(id)a4;
- (id)newLayoutHint;
- (id)newTextEngineForCell:(id)a3 atCellID:(id)a4;
- (id)regionForStrokeValidationFromChangeDescriptors:(id)a3;
- (id)tableNameTextEngine;
- (id)validateCellForDrawing:(id)a3 cell:(id)a4 contents:(id)a5 wrap:(BOOL)a6 verticalAlignment:(unsigned int)a7 padding:(id)a8 layoutCacheFlags:(int)a9 pageNumber:(unint64_t)a10 pageCount:(unint64_t)a11;
- (id)validateFittingInfoForChangeDescriptors:(id)a3 rowsNeedingFittingInfo:(id)a4;
- (int)dynamicColumnAdjustment;
- (int)dynamicRowAdjustment;
- (int)tableEnvironment;
- (int)tableRowsBehavior;
- (unsigned)maxConcurrentTasks;
- (unsigned)numCellsPerTask;
- (unsigned)tableAreaForCellID:(id)a3;
- (void)addChangeDescriptor:(id)a3;
- (void)addChangeDescriptorWithType:(int)a3 andCellRange:(id)a4;
- (void)addChangeDescriptorWithType:(int)a3 andCellRange:(id)a4 andStrokeRange:(id)a5;
- (void)addDynamicLayoutBeginIfNecessary:(id)a3;
- (void)beginDynamicMode:(id)a3;
- (void)calculateRawTableSize:(CGSize *)a3 andStrokeDelta:(CGSize *)a4;
- (void)cancelDynamicModeChanges;
- (void)clearModelHeightWidthCacheForCellRange:(id)a3;
- (void)dealloc;
- (void)endDynamicMode;
- (void)invalidateBandedFill;
- (void)invalidateDefaultFontHeights;
- (void)invalidateDynamicResizeInfo;
- (void)invalidateTableNameHeight;
- (void)measureTextForLayoutState:(id)a3;
- (void)p_cancelDynamicRowColCountChanges;
- (void)p_processChange:(id)a3 forChangeSource:(id)a4;
- (void)p_validateFittingInfoForCellID:(id)a3 inMergeRange:(id)a4;
- (void)p_validateFittingInfoForEmptyCellsOnSingleRowBetween:(id)a3 andEndCellID:(id)a4;
- (void)processLayoutTask:(id)a3;
- (void)queueCellForValidation:(id)a3 cell:(id)a4 mergeRange:(id)a5 wrap:(BOOL)a6 verticalAlignment:(unsigned int)a7 padding:(id)a8 prop:(BOOL)a9 layoutCacheFlags:(int)a10;
- (void)removeDynamicLayoutEndIfNecessary:(id)a3;
- (void)resetModelHeightWidthCache;
- (void)setChangeNotifier:(id)a3;
- (void)setContainedTextEditor:(id)a3;
- (void)setDynamicHeightResize:(double)a3;
- (void)setDynamicRepResize:(BOOL)a3;
- (void)setDynamicSavedLayoutGeometry:(id)a3;
- (void)setDynamicWidthResize:(double)a3;
- (void)setMaxConcurrentTasks:(unsigned int)a3;
- (void)setMaximumPartitionSize:(CGSize)a3;
- (void)setMergeRanges:(id)a3;
- (void)setNumCellsPerTask:(unsigned int)a3;
- (void)setProcessHiddenRowsForExport:(BOOL)a3;
- (void)setTableEnvironment:(int)a3;
- (void)setTableInfo:(id)a3;
- (void)syncProcessChanges:(id)a3 forChangeSource:(id)a4;
- (void)updateDynamicBandedFill:(BOOL)a3 setting:(BOOL)a4;
- (void)updateDynamicColumnSwapDelegate:(id)a3;
- (void)updateDynamicColumnTabSize:(double)a3;
- (void)updateDynamicContentDelegate:(id)a3;
- (void)updateDynamicFontColor:(id)a3 andRange:(id)a4;
- (void)updateDynamicHidingContent:(id)a3;
- (void)updateDynamicHidingRowsCols:(int)a3 hidingCellRange:(id)a4;
- (void)updateDynamicHidingText:(id)a3;
- (void)updateDynamicInfoGeometry:(id)a3;
- (void)updateDynamicRepressFrozenHeader:(BOOL)a3;
- (void)updateDynamicResize:(int)a3 resizingRange:(id)a4 resizeAdjustment:(double)a5;
- (void)updateDynamicResizeInfo:(id)a3;
- (void)updateDynamicRevealingRowsCols:(int)a3 revealingCellRange:(id)a4;
- (void)updateDynamicRowSwapDelegate:(id)a3;
- (void)updateDynamicRowTabSize:(double)a3;
- (void)updateDynamicSelectionRegion:(id)a3;
- (void)updateDynamicSuppressingConditionalStylesCellID:(id)a3;
- (void)updateDynamicTableNameSize:(double)a3;
- (void)updateWHCForMergeRanges;
- (void)validate;
- (void)validateBandedFill;
- (void)validateChangeDescriptorQueue;
- (void)validateDefaultFontHeights;
- (void)validateFittingInfoForCell:(id)a3 cellID:(id)a4 mergeRange:(id)a5 setFitting:(BOOL)a6;
- (void)validateFittingInfoWithCellRange:(id)a3;
- (void)validateFittingWidthsForRegion:(id)a3;
- (void)validateLayoutHint:(id)a3;
- (void)validateMasterLayoutForChangeDescriptors:(id)a3;
- (void)validateStrokesForRegion:(id)a3 regionAlreadyValidated:(id)a4;
- (void)validateTableRowsBehavior;
- (void)waitForLayoutToComplete;
- (void)wasRemovedFromDocumentRoot;
- (void)willBeAddedToDocumentRoot:(id)a3;
@end

@implementation TSTMasterLayout

- (TSTTableModel)tableModel
{
  return [(TSTTableInfo *)self->mTableInfo tableModel];
}

- (void)setChangeNotifier:(id)a3
{
  if (!self->mChangeNotifier)
  {
    self->mChangeNotifier = (TSKChangeNotifier *)a3;
    id v5 = a3;
    mTableInfo = self->mTableInfo;
    [a3 addObserver:self forChangeSource:mTableInfo];
  }
}

- (BOOL)emptyFilteredTable
{
  return self->mEmptyFilteredTable && !self->mProcessHiddenRowsForExport;
}

- (void)setProcessHiddenRowsForExport:(BOOL)a3
{
  self->mProcessHiddenRowsForExport = a3;
  $CA3468F20078D5D2DB35E78E73CA60DA v4 = [(TSTTableModel *)[(TSTMasterLayout *)self tableModel] range];

  TSTMasterLayoutInvalidateStrokeRange(self, *(void *)&v4);
}

- (TSTMasterLayout)initWithInfo:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)TSTMasterLayout;
  $CA3468F20078D5D2DB35E78E73CA60DA v4 = [(TSTMasterLayout *)&v14 init];
  uint64_t v5 = (uint64_t)v4;
  if (v4)
  {
    p_mDynamicHidingContent = &v4->mDynamicHidingContent;
    v4->mTableInfo = (TSTTableInfo *)a3;
    v4->mCellIDToWPColumnCache = [(TSUConcurrentCache *)[TSTWPColumnCache alloc] initWithName:@"cell id to wp column $"];
    *(void *)(v5 + 40) = [(TSUConcurrentCache *)[TSTDupContentCache alloc] initWithName:@"dup $"];
    *(void *)(v5 + 48) = [(TSUConcurrentCache *)[TSTWPColumnCache alloc] initWithName:@"temp wp column $"];
    *(void *)(v5 + 56) = -[TSTWidthHeightCache initWithNumRows:andNumCols:]([TSTWidthHeightCache alloc], "initWithNumRows:andNumCols:", objc_msgSend((id)objc_msgSend(a3, "tableModel"), "numberOfRows"), objc_msgSend((id)objc_msgSend(a3, "tableModel"), "numberOfColumns"));
    *(void *)(v5 + 64) = [objc_alloc(MEMORY[0x263F7C8C0]) initWithIdentifier:@"TSTWHCacheQueue"];
    *(void *)(v5 + 88) = dispatch_group_create();
    *(void *)(v5 + 112) = 0xA0000000ALL;
    dispatch_semaphore_t v7 = dispatch_semaphore_create(10);
    *(void *)(v5 + 96) = 0;
    *(void *)(v5 + 104) = v7;
    *(_DWORD *)(v5 + 280) = 0;
    *(void *)(v5 + 80) = (id)[MEMORY[0x263EFF980] arrayWithCapacity:5];
    id v8 = +[TSTConfiguration sharedTableConfiguration];
    *(void *)(v5 + 192) = [v8 maxNumberOfRows];
    *(void *)(v5 + 176) = [v8 maxNumberOfColumns];
    *(_DWORD *)(v5 + 284) = 0;
    *(void *)&long long v9 = 0xFFFFFFLL;
    *((void *)&v9 + 1) = 0xFFFFFFLL;
    *(_OWORD *)(v5 + 400) = v9;
    *(_OWORD *)&p_mDynamicHidingContent->origin.row = v9;
    *(void *)(v5 + 452) = 0xFFFFFFLL;
    *(void *)(v5 + 464) = 0;
    *(void *)(v5 + 474) = 0xFFFFFFLL;
    *(void *)(v5 + 488) = 0;
    *(void *)(v5 + 496) = 0xFFFFFFLL;
    *(void *)(v5 + 536) = 0;
    *(void *)(v5 + 160) = 0xBFF0000000000000;
    *(void *)(v5 + 240) = objc_alloc_init(MEMORY[0x263F08AE0]);
    *(void *)(v5 + 208) = objc_alloc_init(MEMORY[0x263EFF980]);
    *(void *)(v5 + 216) = objc_alloc_init(MEMORY[0x263EFF980]);
    *(void *)(v5 + 224) = objc_alloc_init(MEMORY[0x263EFF980]);
    *(void *)(v5 + 232) = objc_alloc_init(MEMORY[0x263EFF980]);
    *(void *)(v5 + 248) = objc_alloc_init(MEMORY[0x263F7C8C8]);
    v10 = objc_alloc_init(TSTHiddenRowsColumnsCache);
    *(void *)(v5 + 72) = v10;
    [(TSTHiddenRowsColumnsCache *)v10 validate:v5];
    *(void *)(v5 + 256) = objc_alloc_init(MEMORY[0x263F08958]);
    *(unsigned char *)(v5 + 264) = 0;
    *(unsigned char *)(v5 + 265) = objc_msgSend((id)objc_msgSend((id)v5, "tableModel"), "useBandedFill");
    *(void *)(v5 + 272) = objc_msgSend((id)objc_msgSend((id)v5, "tableModel"), "bandedFillObject");
    *(void *)(v5 + 592) = objc_alloc_init(TSTMergeRangeSortedSet);
    *(_WORD *)(v5 + 168) = objc_msgSend((id)objc_msgSend((id)v5, "tableModel"), "numberOfHeaderColumns");
    *(_WORD *)(v5 + 184) = objc_msgSend((id)objc_msgSend((id)v5, "tableModel"), "numberOfHeaderRows");
    *(_WORD *)(v5 + 186) = objc_msgSend((id)objc_msgSend((id)v5, "tableModel"), "numberOfFooterRows");
    *(void *)(v5 + 336) = [objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:1];
    *(unsigned char *)(v5 + 600) = 0;
    *(_DWORD *)(v5 + 576) = 0xFFFFFF;
    uint64_t TableNumberOfColumns = TSTMasterLayoutGetTableNumberOfColumns(v5);
    uint64_t v12 = (TableNumberOfColumns << 32) | (TSTMasterLayoutGetTableNumberOfRows(v5) << 48);
    [(id)v5 addChangeDescriptorWithType:26 andCellRange:v12];
    [(id)v5 addChangeDescriptorWithType:5 andCellRange:v12];
    *(_OWORD *)(v5 + 608) = *MEMORY[0x263F001B0];
  }
  return (TSTMasterLayout *)v5;
}

- (void)dealloc
{
  self->mCellIDToWPColumnCache = 0;
  self->mDupContentCache = 0;

  self->mTempWPColumnCache = 0;
  self->mWidthHeightCache = 0;

  self->mWHCacheQueue = 0;
  self->mHiddenRowsColumnsCache = 0;
  dispatch_release((dispatch_object_t)self->mLayoutInFlight);
  dispatch_release((dispatch_object_t)self->mLayoutSemaphore);

  self->mCurrentLayoutTask = 0;
  self->mChangeDescriptors = 0;
  self->mTableInfo = 0;

  TSTMasterLayoutInvalidateStrokeDefaults((uint64_t)self);
  self->mTopRowStrokes = 0;

  self->mBottomRowStrokes = 0;
  self->mLeftColumnStrokes = 0;

  self->mRightColumnStrokes = 0;
  self->mParaStyleToHeightCache = 0;

  self->mStrokesLock = 0;
  self->mLock = 0;

  self->mDynamicLayouts = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSTMasterLayout;
  [(TSTMasterLayout *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  $CA3468F20078D5D2DB35E78E73CA60DA v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = [(TSTTableModel *)[(TSTMasterLayout *)self tableModel] tableName];
  unsigned int TableNumberOfColumns = TSTMasterLayoutGetTableNumberOfColumns((uint64_t)self);
  unsigned int TableNumberOfRows = TSTMasterLayoutGetTableNumberOfRows((uint64_t)self);
  long long v9 = NSString;
  uint64_t v10 = [NSString stringWithFormat:@"(%hu, %hu)", 0, 0];
  uint64_t v11 = [v9 stringWithFormat:@"(%@, %@)", v10, objc_msgSend(NSString, "stringWithFormat:", @"%hux%hu", TableNumberOfColumns, TableNumberOfRows)];
  if (self->mInDynamicLayoutMode) {
    uint64_t v12 = @"YES";
  }
  else {
    uint64_t v12 = @"NO";
  }
  return (NSString *)[v3 stringWithFormat:@"<%@:%p \"%@\" range:%@ dynamic_mode:%@ >", v5, self, v6, v11, v12];
}

- (id)newLayoutHint
{
  objc_super v3 = objc_alloc_init(TSTLayoutHint);
  if (![(TSDDrawableInfo *)[(TSTMasterLayout *)self tableInfo] isInlineWithText])
  {
    uint64_t TableNumberOfColumns = TSTMasterLayoutGetTableNumberOfColumns((uint64_t)self);
    [(TSTLayoutHint *)v3 setCellRange:(TableNumberOfColumns << 32) | (TSTMasterLayoutGetTableNumberOfRows((uint64_t)self) << 48)];
    -[TSTLayoutHint setMaximumSize:](v3, "setMaximumSize:", INFINITY, INFINITY);
  }
  [(TSTMasterLayout *)self validateLayoutHint:v3];
  return v3;
}

- (BOOL)hintIsValid:(id)a3
{
  double v5 = *MEMORY[0x263F001B0];
  double v6 = *(double *)(MEMORY[0x263F001B0] + 8);
  if ([(TSTMasterLayout *)self emptyFilteredTable]) {
    unsigned int mCachedNumberOfHeaderRows = 0;
  }
  else {
    unsigned int mCachedNumberOfHeaderRows = self->mCachedNumberOfHeaderRows;
  }
  if ([(TSTMasterLayout *)self emptyFilteredTable]) {
    unsigned __int16 mCachedNumberOfHeaderColumns = 0;
  }
  else {
    unsigned __int16 mCachedNumberOfHeaderColumns = self->mCachedNumberOfHeaderColumns;
  }
  if ([(TSTMasterLayout *)self emptyFilteredTable]) {
    unsigned __int16 mCachedNumberOfFooterRows = 0;
  }
  else {
    unsigned __int16 mCachedNumberOfFooterRows = self->mCachedNumberOfFooterRows;
  }
  __int16 TableNumberOfColumns = TSTMasterLayoutGetTableNumberOfColumns((uint64_t)self);
  int TableNumberOfRows = TSTMasterLayoutGetTableNumberOfRows((uint64_t)self);
  if ((unsigned __int16)(TableNumberOfColumns - mCachedNumberOfHeaderColumns) >= 0xFFu) {
    int v12 = 255;
  }
  else {
    int v12 = (unsigned __int16)(TableNumberOfColumns - mCachedNumberOfHeaderColumns);
  }
  unint64_t v13 = [a3 cellRange];
  unint64_t v14 = 0;
  if (mCachedNumberOfHeaderRows == 0xFFFF) {
    goto LABEL_32;
  }
  unint64_t v15 = 0;
  if (mCachedNumberOfHeaderColumns == 255) {
    goto LABEL_33;
  }
  unint64_t v14 = 0;
  if (TableNumberOfRows == (unsigned __int16)(mCachedNumberOfFooterRows + mCachedNumberOfHeaderRows)) {
    goto LABEL_32;
  }
  unint64_t v15 = 0;
  if (!v12) {
    goto LABEL_33;
  }
  unint64_t v14 = 0;
  if ((_WORD)v13 == 0xFFFF) {
    goto LABEL_32;
  }
  unint64_t v15 = 0;
  if ((v13 & 0xFF0000) == 0xFF0000) {
    goto LABEL_33;
  }
  unint64_t v14 = 0;
  if (!HIWORD(v13)) {
    goto LABEL_32;
  }
  unint64_t v15 = 0;
  if ((v13 & 0xFFFF00000000) == 0) {
    goto LABEL_33;
  }
  unint64_t v14 = 0;
  unsigned int v16 = mCachedNumberOfHeaderColumns;
  if (mCachedNumberOfHeaderColumns <= BYTE2(v13)) {
    unsigned int v16 = BYTE2(v13);
  }
  unsigned int v17 = (unsigned __int16)v13;
  if (mCachedNumberOfHeaderRows > (unsigned __int16)v13) {
    unsigned int v17 = mCachedNumberOfHeaderRows;
  }
  unsigned int v18 = (mCachedNumberOfHeaderColumns + v12 - 1);
  if (v18 >= (BYTE4(v13) + BYTE2(v13) - 1)) {
    unsigned int v18 = (BYTE4(v13) + BYTE2(v13) - 1);
  }
  unsigned int v19 = (unsigned __int16)(mCachedNumberOfHeaderRows
                         + TableNumberOfRows
                         + ~(mCachedNumberOfFooterRows + mCachedNumberOfHeaderRows));
  if (v19 >= (unsigned __int16)(v13 + HIWORD(v13) - 1)) {
    unsigned int v19 = (unsigned __int16)(v13 + HIWORD(v13) - 1);
  }
  if (v17 > v19)
  {
LABEL_32:
    unint64_t v15 = 0;
    goto LABEL_33;
  }
  unint64_t v15 = 0;
  if (v16 <= v18)
  {
    unint64_t v15 = ((unint64_t)(v19 - v17) << 48) + 0x1000000000000;
    unint64_t v14 = (((unint64_t)(v18 - v16) << 32) + 0x100000000) & 0xFFFF00000000;
  }
LABEL_33:
  BOOL mHeaderRowsRepeat = self->mHeaderRowsRepeat;
  unsigned __int16 v21 = [a3 cellRange];
  if (mHeaderRowsRepeat && (unsigned __int16)(mCachedNumberOfHeaderRows - 1) < v21)
  {
    int v22 = 0;
    do
      double v6 = v6 + TSTMasterLayoutHeightOfRow(self, (unsigned __int16)v22++, 0, 0, 1, 1);
    while (mCachedNumberOfHeaderRows > (unsigned __int16)v22);
  }
  int v23 = [a3 cellRange];
  uint64_t v24 = [a3 cellRange];
  if ((unsigned __int16)(v24 + HIWORD(v24) - 1) >= (unsigned __int16)v23)
  {
    do
    {
      double v6 = v6 + TSTMasterLayoutHeightOfRow(self, (unsigned __int16)v23++, 0, 0, 1, 1);
      uint64_t v25 = [a3 cellRange];
    }
    while ((unsigned __int16)v23 <= (unsigned __int16)(v25 + HIWORD(v25) - 1));
  }
  [a3 maximumSize];
  uint64_t v28 = v6 > v26 && HIWORD(v15) == 1;
  if (![(TSDDrawableInfo *)[(TSTMasterLayout *)self tableInfo] isInlineWithText])
  {
    if ([(TSTMasterLayout *)self emptyFilteredTable]) {
      unsigned int v29 = 0;
    }
    else {
      unsigned int v29 = self->mCachedNumberOfHeaderColumns;
    }
    if (v29 <= ([a3 cellRange] >> 16) && (_BYTE)v29)
    {
      int v30 = 0;
      do
        double v5 = v5 + TSTMasterLayoutWidthOfColumn((uint64_t)self, v30++, 0, 0, 1);
      while (v30 < v29);
    }
    unint64_t v31 = [a3 cellRange];
    uint64_t v32 = [a3 cellRange];
    if (BYTE2(v31) <= (BYTE4(v32) + BYTE2(v32) - 1))
    {
      unint64_t v33 = v31 >> 16;
      do
      {
        double v5 = v5 + TSTMasterLayoutWidthOfColumn((uint64_t)self, v33, 0, 0, 1);
        LODWORD(v33) = v33 + 1;
        uint64_t v34 = [a3 cellRange];
      }
      while (v33 <= (BYTE4(v34) + BYTE2(v34) - 1));
    }
    [a3 maximumSize];
    if (v5 > v35 && (v15 & 0xFFFF00000000 | v14) == 0x100000000) {
      uint64_t v28 = 1;
    }
    else {
      uint64_t v28 = v28;
    }
  }
  [a3 maximumSize];
  if (v6 <= v37)
  {
    [a3 maximumSize];
    if (v5 <= v38) {
      uint64_t v28 = 1;
    }
  }
  [a3 setIsValid:v28];

  return [a3 isValid];
}

- (void)validateLayoutHint:(id)a3
{
  double v5 = [(TSTMasterLayout *)self tableInfo];
  objc_opt_class();
  [(TSTTableInfo *)v5 partitioner];
  uint64_t v6 = TSUDynamicCast();
  uint64_t TableNumberOfColumns = TSTMasterLayoutGetTableNumberOfColumns((uint64_t)self);
  int TableNumberOfRows = TSTMasterLayoutGetTableNumberOfRows((uint64_t)self);
  uint64_t v9 = [a3 cellRange];
  if (!v6 || ([a3 maximumSize], uint64_t v11 = v9, v12 == INFINITY) && (uint64_t v11 = v9, v10 == INFINITY))
  {
    uint64_t v13 = TSTMasterLayoutGetTableNumberOfColumns((uint64_t)self);
    uint64_t v11 = (v13 << 32) | (TSTMasterLayoutGetTableNumberOfRows((uint64_t)self) << 48);
    objc_msgSend(a3, "setMaximumSize:", INFINITY, INFINITY);
    [a3 setCacheHintID:0];
  }
  BOOL v14 = [(TSDDrawableInfo *)v5 isInlineWithText];
  unsigned int v15 = (TableNumberOfColumns - 1);
  if (v15 <= (BYTE4(v9) + BYTE2(v9) - 1)) {
    uint64_t v16 = v11;
  }
  else {
    uint64_t v16 = TableNumberOfColumns << 32;
  }
  if (!v14) {
    uint64_t v16 = v11;
  }
  uint64_t v17 = v16 & 0xFFFF00000000;
  unsigned int v18 = (unsigned __int16)v11 == 0;
  if (TableNumberOfRows == (unsigned __int16)(v11 + HIWORD(v11))) {
    v18 |= 2u;
  }
  if ((v11 & 0xFF0000) == 0) {
    v18 |= 4u;
  }
  if (v15 == (BYTE4(v16) + BYTE2(v11) - 1)) {
    uint64_t v19 = v18 | 8;
  }
  else {
    uint64_t v19 = v18;
  }
  if (v19 == 15)
  {
    *(_WORD *)&self->mHeaderColumnsRepeat = 0;
    self->mHeaderColumnsFrozen = [(TSTTableModel *)[(TSTMasterLayout *)self tableModel] headerColumnsFrozen];
    BOOL v20 = [(TSTTableModel *)[(TSTMasterLayout *)self tableModel] headerRowsFrozen];
  }
  else
  {
    self->mHeaderColumnsRepeat = [(TSTTableModel *)[(TSTMasterLayout *)self tableModel] repeatingHeaderColumnsEnabled];
    BOOL v21 = [(TSTTableModel *)[(TSTMasterLayout *)self tableModel] repeatingHeaderRowsEnabled];
    BOOL v20 = 0;
    self->BOOL mHeaderRowsRepeat = v21;
    self->mHeaderColumnsFrozen = 0;
  }
  self->mHeaderRowsFrozen = v20;
  [a3 setPartitionPosition:v19];
  [a3 setCellRange:v17 | v11 & 0xFFFF0000FFFFFFFFLL];

  [a3 setIsValid:1];
}

- (void)resetModelHeightWidthCache
{
  v2 = [(TSTMasterLayout *)self widthHeightCache];

  [(TSTWidthHeightCache *)v2 resetModelCache];
}

- (void)clearModelHeightWidthCacheForCellRange:(id)a3
{
  $CA3468F20078D5D2DB35E78E73CA60DA v4 = [(TSTMasterLayout *)self widthHeightCache];

  [(TSTWidthHeightCache *)v4 resetModelCacheRange:a3];
}

- (id)tableNameTextEngine
{
  v2 = [(TSTMasterLayout *)self tableModel];

  return +[TSTMasterLayout tableNameTextEngine:v2];
}

- (CGSize)tableNameTextSize
{
  if (self->mTableNameEnabled)
  {
    +[TSTMasterLayout tableNameTextSize:[(TSTMasterLayout *)self tableModel]];
  }
  else
  {
    double v2 = *MEMORY[0x263F001B0];
    double v3 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  result.height = v3;
  result.width = v2;
  return result;
}

+ (id)tableNameTextEngine:(id)a3
{
  id v4 = +[TSWPColumnStyle defaultStyleWithContext:](TSWPColumnStyle, "defaultStyleWithContext:", [a3 context]);
  objc_msgSend(v4, "setIntValue:forProperty:", objc_msgSend((id)objc_msgSend(a3, "tableNameShapeStyle"), "intValueForProperty:", 149), 149);
  id v5 = (id)objc_msgSend((id)objc_msgSend(a3, "tableNameShapeStyle"), "objectForProperty:", 146);
  if (!v5) {
    id v5 = +[TSWPPadding padding];
  }
  [v4 setValue:v5 forProperty:146];
  uint64_t v6 = -[TSWPText initWithParagraphStyle:columnStyle:]([TSWPText alloc], "initWithParagraphStyle:columnStyle:", [a3 tableNameStyle], v4);

  return v6;
}

+ (CGSize)tableNameTextSize:(id)a3
{
  id v4 = (void *)[a3 tableName];
  double v5 = *MEMORY[0x263F001B0];
  double v6 = *(double *)(MEMORY[0x263F001B0] + 8);
  if (v4)
  {
    dispatch_semaphore_t v7 = v4;
    if ([v4 length])
    {
      id v8 = +[TSTMasterLayout tableNameTextEngine:a3];
      [v8 measureText:v7];
      double v5 = v9;
      double v11 = v10;
      objc_msgSend((id)objc_msgSend(v8, "paragraphStyle"), "CGFloatValueForProperty:", 88);
      double v13 = v11 + v12;
      BOOL v14 = (void *)[*((id *)a3 + 30) valueForProperty:146];
      [v14 topInset];
      double v16 = v15;
      [v14 bottomInset];
      double v6 = v13 + v16 + v17;
    }
  }
  double v18 = v5;
  double v19 = v6;
  result.height = v19;
  result.width = v18;
  return result;
}

+ (double)effectiveTableNameHeightForModel:(id)a3
{
  [a3 tableNameHeight];
  double v5 = v4;
  +[TSTMasterLayout tableNameTextSize:a3];
  if (v5 >= v6) {
    double result = v5;
  }
  else {
    double result = v6;
  }
  if (v5 <= 0.0) {
    return v6;
  }
  return result;
}

- (double)tableNameHeight
{
  if (!self->mTableNameEnabled) {
    return 0.0;
  }
  [(TSTMasterLayout *)self calculatedTableNameHeight];
  return result;
}

- (double)calculatedTableNameHeight
{
  [(TSTMasterLayout *)self calculatedTableNameHeightIncludingDynamicResize:1];
  return result;
}

- (double)calculatedTableNameHeightIncludingDynamicResize:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->mCachedTableNameHeight < 0.0)
  {
    self->double mCachedTableNameHeight = 0.0;
    +[TSTMasterLayout effectiveTableNameHeightForModel:[(TSTMasterLayout *)self tableModel]];
    self->double mCachedTableNameHeight = v5;
  }
  BOOL v6 = [(TSTMasterLayout *)self isDynamicallyResizingTableName];
  double mCachedTableNameHeight = self->mCachedTableNameHeight;
  if (v6 && v3)
  {
    [(TSTMasterLayout *)self dynamicTableNameResize];
    return mCachedTableNameHeight + v8;
  }
  return mCachedTableNameHeight;
}

- (void)invalidateTableNameHeight
{
  self->double mCachedTableNameHeight = -1.0;
}

- (unsigned)tableAreaForCellID:(id)a3
{
  unint64_t EntireFooterRowsCellRange = TSTMasterLayoutGetEntireFooterRowsCellRange((unsigned __int16 *)self);
  if (HIWORD(EntireFooterRowsCellRange)
    && (EntireFooterRowsCellRange & 0xFFFF00000000) != 0
    && (unsigned __int16)EntireFooterRowsCellRange <= a3.var0
    && (unsigned __int16)(EntireFooterRowsCellRange + HIWORD(EntireFooterRowsCellRange) - 1) >= a3.var0
    && a3.var1 >= BYTE2(EntireFooterRowsCellRange)
    && a3.var1 <= (BYTE4(EntireFooterRowsCellRange) + BYTE2(EntireFooterRowsCellRange) - 1))
  {
    return 3;
  }
  unint64_t EntireHeaderRowsCellRange = TSTMasterLayoutGetEntireHeaderRowsCellRange((unsigned __int16 *)self);
  if (HIWORD(EntireHeaderRowsCellRange)
    && (EntireHeaderRowsCellRange & 0xFFFF00000000) != 0
    && (unsigned __int16)EntireHeaderRowsCellRange <= a3.var0
    && (unsigned __int16)(EntireHeaderRowsCellRange + HIWORD(EntireHeaderRowsCellRange) - 1) >= a3.var0
    && a3.var1 >= BYTE2(EntireHeaderRowsCellRange)
    && a3.var1 <= (BYTE4(EntireHeaderRowsCellRange) + BYTE2(EntireHeaderRowsCellRange) - 1))
  {
    return 1;
  }
  unint64_t EntireHeaderColumnsCellRange = TSTMasterLayoutGetEntireHeaderColumnsCellRange((unsigned __int16 *)self);
  unsigned int v8 = 0;
  if (HIWORD(EntireHeaderColumnsCellRange) && (EntireHeaderColumnsCellRange & 0xFFFF00000000) != 0)
  {
    if ((unsigned __int16)EntireHeaderColumnsCellRange <= a3.var0
      && (unsigned __int16)(EntireHeaderColumnsCellRange + HIWORD(EntireHeaderColumnsCellRange) - 1) >= a3.var0
      && a3.var1 >= BYTE2(EntireHeaderColumnsCellRange))
    {
      if (a3.var1 > (BYTE4(EntireHeaderColumnsCellRange)
                                                   + BYTE2(EntireHeaderColumnsCellRange)
                                                   - 1))
        return 0;
      else {
        return 2;
      }
    }
    else
    {
      return 0;
    }
  }
  return v8;
}

- (id)regionForStrokeValidationFromChangeDescriptors:(id)a3
{
  double v4 = self;
  uint64_t v32 = *MEMORY[0x263EF8340];
  unsigned int TableNumberOfColumns = TSTMasterLayoutGetTableNumberOfColumns((uint64_t)self);
  uint64_t TableNumberOfRows = TSTMasterLayoutGetTableNumberOfRows((uint64_t)v4);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = a3;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (!v7)
  {
    double v10 = 0;
    uint64_t v18 = TableNumberOfColumns;
    goto LABEL_23;
  }
  uint64_t v8 = v7;
  uint64_t v22 = TableNumberOfRows;
  uint64_t v23 = (uint64_t)v4;
  char v9 = 0;
  double v10 = 0;
  uint64_t v11 = *(void *)v28;
  uint64_t v21 = TableNumberOfColumns;
  uint64_t v24 = ((TableNumberOfColumns << 16) + 16711680) & 0xFF0000 | (unsigned __int16)(TableNumberOfRows - 1) | 0x1000100000000;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v28 != v11) {
        objc_enumerationMutation(obj);
      }
      double v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
      unsigned int v14 = objc_msgSend(v13, "changeDescriptor", v21, v22);
      unsigned int v15 = [v13 cellID];
      double v16 = (void *)[v13 strokeRegion];
      uint64_t v17 = (uint64_t)v16;
      if (v14 > 0x28) {
        goto LABEL_11;
      }
      if (((1 << v14) & 0x10010004700) == 0)
      {
        if (((1 << v14) & 0x600006) == 0)
        {
          if (((1 << v14) & 0x8000C8) != 0) {
            uint64_t v17 = [v16 regionByUnioningEveryRangeInRegionWithRange:v15 | 0x1000100000000];
          }
LABEL_11:
          if (v10) {
            goto LABEL_12;
          }
          goto LABEL_15;
        }
        uint64_t v17 = [v16 regionByUnioningEveryRangeInRegionWithRange:v24];
      }
      char v9 = 1;
      if (v10)
      {
LABEL_12:
        double v10 = (void *)[v10 regionByAddingRegion:v17];
        continue;
      }
LABEL_15:
      double v10 = (void *)v17;
    }
    uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  }
  while (v8);
  if (v9)
  {
    double v4 = (TSTMasterLayout *)v23;
    TSTMasterLayoutInvalidateStrokeDefaults(v23);
  }
  else
  {
    double v4 = (TSTMasterLayout *)v23;
  }
  uint64_t v18 = v21;
  uint64_t TableNumberOfRows = v22;
LABEL_23:
  double v19 = (void *)[v10 regionByIntersectingRange:(v18 << 32) | (TableNumberOfRows << 48)];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __66__TSTMasterLayout_regionForStrokeValidationFromChangeDescriptors___block_invoke;
  v26[3] = &unk_2646B3508;
  v26[4] = v4;
  [v19 enumerateCellRangesUsingBlock:v26];
  return v19;
}

uint64_t __66__TSTMasterLayout_regionForStrokeValidationFromChangeDescriptors___block_invoke(uint64_t a1, uint64_t a2)
{
  return TSTMasterLayoutInvalidateStrokeRange(*(TSTMasterLayout **)(a1 + 32), a2);
}

- (void)validateStrokesForRegion:(id)a3 regionAlreadyValidated:(id)a4
{
  double v5 = (void *)[a3 regionBySubtractingRegion:a4];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__TSTMasterLayout_validateStrokesForRegion_regionAlreadyValidated___block_invoke;
  v6[3] = &unk_2646B3508;
  v6[4] = self;
  [v5 enumerateCellRangesUsingBlock:v6];
}

void __67__TSTMasterLayout_validateStrokesForRegion_regionAlreadyValidated___block_invoke(uint64_t a1, unint64_t a2)
{
  BOOL v6 = [[TSTLayoutCellIterator alloc] initWithMasterLayout:*(void *)(a1 + 32) range:a2 flags:2];
  uint64_t v7 = 0xFFFFLL;
  uint64_t v8 = 0xFFFFLL;
LABEL_2:
  uint64_t v9 = v7;
  uint64_t v7 = v8;
LABEL_3:
  uint64_t v8 = v7;
  while (1)
  {
    BOOL NextCell = TSTLayoutCellIteratorGetNextCell((uint64_t)v6, v13);
    uint64_t v11 = *(TSTMasterLayout **)(a1 + 32);
    if (!NextCell) {
      break;
    }
    unint64_t v2 = v2 & 0xFFFFFFFF00000000 | HIDWORD(v13[0]);
    unsigned __int16 v12 = (unsigned __int16)[(TSTMasterLayout *)v11 modelCellIDForStrokesOfLayoutCellID:v2];
    if (v7 != v12)
    {
      uint64_t v7 = v12;
      if (v9 == v12)
      {
        uint64_t v7 = v9;
      }
      else if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "hiddenRowsColumnsCache"), "isRowHidden:", WORD2(v13[0])))
      {
        goto LABEL_3;
      }
      if ((objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "hiddenRowsColumnsCache"), "isColumnHidden:", BYTE6(v13[0])) & 1) == 0)
      {
        unint64_t v3 = v3 & 0xFFFFFFFF00000000 | HIDWORD(v13[0]);
        TSTMasterLayoutUpdateStrokesForCell(*(TSTMasterLayout **)(a1 + 32), v13[1], v3);
      }
      goto LABEL_2;
    }
  }
  TSTMasterLayoutSetStrokesValidForRange(v11, a2);
}

- (BOOL)useBandedFill
{
  if (![(TSTMasterLayout *)self isDynamicallySettingBandedFill]) {
    return self->mUseBandedFill;
  }

  return [(TSTMasterLayout *)self dynamicBandedFill];
}

- (BOOL)shouldRowUseBandedFill:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  if (![(TSTMasterLayout *)self isDynamicallySettingBandedFill]) {
    return ([(TSTMasterLayout *)self emptyFilteredTable]
  }
         || self->mCachedNumberOfHeaderRows <= v3)
        && ([(TSTHiddenRowsColumnsCache *)self->mHiddenRowsColumnsCache numberOfVisibleRowsFromHeader:v3] & 1) == 0;

  return [(TSTMasterLayout *)self dynamicBandedFillSetting];
}

- (void)invalidateBandedFill
{
  self->mBandedFillIsValid = 0;
}

- (void)validateBandedFill
{
  if (!self->mBandedFillIsValid)
  {
    self->mBandedFillIsValid = 1;
    self->mUseBandedFill = [(TSTTableModel *)[(TSTMasterLayout *)self tableModel] useBandedFill];
    self->mBandedFillObject = (TSDFill *)[(TSTTableModel *)[(TSTMasterLayout *)self tableModel] bandedFillObject];
  }
}

- (void)validateTableRowsBehavior
{
  id v3 = +[TSTConfiguration sharedTableConfiguration];
  if (self->mTableEnvironment == 1) {
    goto LABEL_2;
  }
  if (![v3 supportsAutoResizedTables])
  {
    int v4 = 3;
    goto LABEL_7;
  }
  if (![(TSSStyle *)[(TSTTableModel *)[(TSTMasterLayout *)self tableModel] tableStyle] intValueForProperty:768])LABEL_2:int v4 = 2; {
  else
  }
    int v4 = 1;
LABEL_7:
  self->mTableRowsBehavior = v4;
}

- (void)invalidateDefaultFontHeights
{
  self->mTableDefaultFontHeightsAreValid = 0;
}

- (void)validateDefaultFontHeights
{
  if (!self->mTableDefaultFontHeightsAreValid)
  {
    id v3 = [(TSTMasterLayout *)self tableModel];
    for (uint64_t i = 0; i != 4; ++i)
    {
      double v5 = objc_alloc_init(TSTCell);
      [(TSTTableModel *)v3 defaultCell:v5 forTableArea:i];
      BOOL v6 = objc_alloc_init(TSTCellStateForLayout);
      [(TSTCellStateForLayout *)v6 setModelCellID:0xFFFFFFLL];
      [(TSTCellStateForLayout *)v6 setCell:v5];
      [(TSTCellStateForLayout *)v6 setCellPropsRowHeight:0];
      [(TSTCellStateForLayout *)v6 setCellWraps:0];
      -[TSTCellStateForLayout setPaddingInsets:](v6, "setPaddingInsets:", 0.0, 0.0, 0.0, 0.0);
      -[TSTCellStateForLayout setMinSize:](v6, "setMinSize:", 4294967300.0, 8.0);
      -[TSTCellStateForLayout setMaxSize:](v6, "setMaxSize:", 4294967300.0, 4294967300.0);
      [(TSTCellStateForLayout *)v6 setForDrawing:0];
      [(TSTCellStateForLayout *)v6 setMergedRange:0xFFFFFFLL];
      [(TSTCellStateForLayout *)v6 setInDynamicLayout:0];
      [(TSTCellStateForLayout *)v6 setCellContents:@"Q"];
      [(TSTCellStateForLayout *)v6 setLayoutCacheFlags:0];
      [(TSTCellStateForLayout *)v6 setPageNumber:0];
      [(TSTCellStateForLayout *)v6 setPageCount:0];
      [(TSTMasterLayout *)self measureTextForLayoutState:v6];
      uint64_t v7 = [(TSTCellStateForLayout *)v6 wpColumn];
      [(TSWPColumn *)v7 typographicBoundsForCell];
      [(TSWPColumn *)v7 frameBounds];
      double v9 = v8;
      double v10 = objc_msgSend(-[TSTTableModel defaultCellStyleForTableArea:](v3, "defaultCellStyleForTableArea:", i), "valueForProperty:", 904);
      [v10 topInset];
      double v12 = v11;
      [v10 leftInset];
      [v10 bottomInset];
      double v14 = v13;
      [v10 rightInset];
      self->mTableDefaultFontHeightForArea[i] = v9 + v12 + v14;
    }
    self->mTableDefaultFontHeightsAreValid = 1;
  }
}

- (void)calculateRawTableSize:(CGSize *)a3 andStrokeDelta:(CGSize *)a4
{
  BOOL v6 = (CGSize *)MEMORY[0x263F001B0];
  *a4 = *(CGSize *)MEMORY[0x263F001B0];
  *a3 = *v6;
  BOOL v23 = [(TSTMasterLayout *)self dynamicRepResize];
  [(TSTMasterLayout *)self setDynamicRepResize:0];
  $CA3468F20078D5D2DB35E78E73CA60DA v7 = [(TSTTableModel *)[(TSTMasterLayout *)self tableModel] range];
  $CA3468F20078D5D2DB35E78E73CA60DA v8 = v7;
  unint64_t v9 = *(unint64_t *)&v7 >> 16;
  unint64_t v10 = HIWORD(*(unint64_t *)&v7);
  double width = v6->width;
  double height = v6->height;
  unsigned int var0 = v7.var0.var0;
  if (v7.var0.var0 < *(unsigned int *)&v7.var1.var1)
  {
    int v14 = v7.var0.var0;
    do
      double height = height + TSTMasterLayoutHeightOfRow(self, (unsigned __int16)v14++, 0, 0, 1, 1);
    while (v10 != v14);
  }
  if (v8.var1.var0 > v8.var0.var1)
  {
    int v15 = v9;
    do
      double width = width + TSTMasterLayoutWidthOfColumn((uint64_t)self, v15++, 1, 0, 1);
    while (v8.var1.var0 > v15);
  }
  double v16 = TSTMasterLayoutStrokeHeightOfGridRow(self, var0, 0, 0xFFFFFFFF);
  double v17 = height
      + (v16
       + TSTMasterLayoutStrokeHeightOfGridRow(self, (unsigned __int16)(v8.var0.var0 + v10 - 1) + 1, 0, 0xFFFFFFFF))* 0.5;
  double v18 = TSTMasterLayoutStrokeWidthOfGridColumn(self, v8.var0.var1, 0, 0xFFFFFFFF);
  double v19 = TSTMasterLayoutStrokeWidthOfGridColumn(self, (LOBYTE(v8.var1.var0) + v8.var0.var1 - 1) + 1, 0, 0xFFFFFFFF);
  if (var0 >= v10)
  {
    double v21 = a3->height;
    BOOL v20 = a4;
  }
  else
  {
    BOOL v20 = a4;
    do
    {
      double v21 = TSTMasterLayoutHeightOfRow(self, (unsigned __int16)var0, 0, 0, 0, 1) + a3->height;
      a3->double height = v21;
      ++var0;
    }
    while (v10 != var0);
  }
  v20->double height = v17 - v21;
  if (v8.var1.var0 <= v8.var0.var1)
  {
    double v22 = a3->width;
  }
  else
  {
    do
    {
      double v22 = TSTMasterLayoutWidthOfColumn((uint64_t)self, v9, 0, 0, 1) + a3->width;
      a3->double width = v22;
      LODWORD(v9) = v9 + 1;
    }
    while (v8.var1.var0 > v9);
  }
  v20->double width = width + (v18 + v19) * 0.5 - v22;

  [(TSTMasterLayout *)self setDynamicRepResize:v23];
}

- (void)beginDynamicMode:(id)a3
{
  if (a3)
  {
    [(NSMutableSet *)[(TSTMasterLayout *)self dynamicLayouts] addObject:a3];
    -[TSTMasterLayout setDynamicSavedLayoutGeometry:](self, "setDynamicSavedLayoutGeometry:", [a3 geometry]);
  }
  self->mInDynamicLayoutMode = 1;
}

- (void)p_cancelDynamicRowColCountChanges
{
  int mDynamicColumnAdjustment = self->mDynamicColumnAdjustment;
  if (mDynamicColumnAdjustment) {
    [(TSTMasterLayout *)self updateDynamicChangeRowOrColumnCount:1 count:-mDynamicColumnAdjustment newlyAddedElementSize:self->mDynamicAddOrRemoveColumnElementSize];
  }
  int mDynamicRowAdjustment = self->mDynamicRowAdjustment;
  if (mDynamicRowAdjustment)
  {
    double mDynamicAddOrRemoveRowElementSize = self->mDynamicAddOrRemoveRowElementSize;
    [(TSTMasterLayout *)self updateDynamicChangeRowOrColumnCount:0 count:-mDynamicRowAdjustment newlyAddedElementSize:mDynamicAddOrRemoveRowElementSize];
  }
}

- (void)cancelDynamicModeChanges
{
  p_mDynamicHidingContent = &self->mDynamicHidingContent;
  [(TSTMasterLayout *)self p_cancelDynamicRowColCountChanges];
  self->int mDynamicColumnAdjustment = 0;
  self->mDynamicColumnTabSize = 0.0;
  self->mDynamicAddOrRemoveColumnElementSize = 0.0;
  self->double mDynamicAddOrRemoveRowElementSize = 0.0;
  *(_WORD *)&self->mDynamicBandedFill = 0;
  self->mDynamicFontColorCellRange = ($6C2899CC353BE70625C5C4ACBB5C74E2)0xFFFFFFLL;
  $6C2899CC353BE70625C5C4ACBB5C74E2 mDynamicHidingRowsCols = self->mDynamicHidingRowsCols;
  if (self->mDynamicHidingRowsCols.origin.row != 0xFFFF)
  {
    BOOL v7 = (*(void *)&mDynamicHidingRowsCols & 0xFF0000) == 16711680;
    uint64_t v5 = *(void *)&mDynamicHidingRowsCols & 0xFFFF00000000;
    unint64_t v6 = HIWORD(*(unint64_t *)&mDynamicHidingRowsCols);
    BOOL v7 = v7 || v6 == 0;
    if (!v7 && v5 != 0)
    {
      [(TSTMasterLayout *)self updateDynamicHidingRowsCols:self->mDynamicHidingRowsColsDirection hidingCellRange:0xFFFFFFLL];
      self->$6C2899CC353BE70625C5C4ACBB5C74E2 mDynamicHidingRowsCols = ($6C2899CC353BE70625C5C4ACBB5C74E2)0xFFFFFFLL;
    }
  }
  *(void *)&long long v9 = 0xFFFFFFLL;
  *((void *)&v9 + 1) = 0xFFFFFFLL;
  *(_OWORD *)&p_mDynamicHidingContent->origin.row = v9;
  *(_WORD *)&self->mDynamicRepResize = 0;
  self->mDynamicResizingColumns = 0;
  self->mDynamicResizingColumnAdjustment = 0.0;
  p_mDynamicHidingContent[4] = ($6C2899CC353BE70625C5C4ACBB5C74E2)0xFFFFFFLL;
  self->mDynamicResizingRows = 0;
  *(void *)&p_mDynamicHidingContent[6].size.numberOfRows = 0xFFFFFFLL;
  self->mDynamicResizingRowAdjustment = 0.0;
  self->mDynamicRevealingRowsCols = ($6C2899CC353BE70625C5C4ACBB5C74E2)0xFFFFFFLL;
  self->int mDynamicRowAdjustment = 0;
  self->mDynamicRowTabSize = 0.0;
  self->mDynamicTableNameResize = 0.0;
}

- (void)endDynamicMode
{
  self->mDynamicColumnSwapDelegate = 0;
  self->mDynamicRowSwapDelegate = 0;

  self->mDynamicContentDelegate = 0;
  self->mDynamicFontColor = 0;

  self->mDynamicSelectionRegion = 0;
  self->mDynamicInfoGeometry = 0;
  [(TSTMasterLayout *)self cancelDynamicModeChanges];
  self->unsigned __int16 mCachedNumberOfHeaderColumns = [(TSTTableModel *)[(TSTMasterLayout *)self tableModel] numberOfHeaderColumns];
  self->unsigned int mCachedNumberOfHeaderRows = [(TSTTableModel *)[(TSTMasterLayout *)self tableModel] numberOfHeaderRows];
  self->unsigned __int16 mCachedNumberOfFooterRows = [(TSTTableModel *)[(TSTMasterLayout *)self tableModel] numberOfFooterRows];
  self->mInDynamicLayoutMode = 0;
  [(NSMutableSet *)[(TSTMasterLayout *)self dynamicLayouts] removeAllObjects];
  [(TSTMasterLayout *)self setDynamicSavedLayoutGeometry:0];
  self->mDynamicTableNameResize = 0.0;
  self->mDynamicSuppressingConditionalStylesCellID = ($5CFCD363C99B2F51819B67AD7AD2E060)0xFFFFFF;
}

- (void)addDynamicLayoutBeginIfNecessary:(id)a3
{
  if (self->mInDynamicLayoutMode)
  {
    int v4 = [(TSTMasterLayout *)self dynamicLayouts];
    [(NSMutableSet *)v4 addObject:a3];
  }
  else
  {
    -[TSTMasterLayout beginDynamicMode:](self, "beginDynamicMode:");
  }
}

- (void)removeDynamicLayoutEndIfNecessary:(id)a3
{
  if ((unint64_t)[(NSMutableSet *)[(TSTMasterLayout *)self dynamicLayouts] count] < 2)
  {
    [(TSTMasterLayout *)self endDynamicMode];
  }
  else
  {
    uint64_t v5 = [(TSTMasterLayout *)self dynamicLayouts];
    [(NSMutableSet *)v5 removeObject:a3];
  }
}

- (BOOL)cell:(id *)a3 forCellID:(id)a4
{
  mDynamicContentDelegate = self->mDynamicContentDelegate;
  if (mDynamicContentDelegate)
  {
    if (!-[TSTLayoutDynamicContentProtocol dynamicContentMustDrawOnMainThread](mDynamicContentDelegate, "dynamicContentMustDrawOnMainThread")|| (LODWORD(mDynamicContentDelegate) = [MEMORY[0x263F08B88] isMainThread], mDynamicContentDelegate))
    {
      if (([(TSTLayoutDynamicContentProtocol *)self->mDynamicContentDelegate cell:a3 forCellID:*(unsigned int *)&a4] & 1) == 0)
      {
        $CA3468F20078D5D2DB35E78E73CA60DA v8 = objc_alloc_init(TSTCell);
        if (TSTCellAtCellID((uint64_t)[(TSTMasterLayout *)self tableModel], *(_DWORD *)&a4, v8))BOOL v9 = 1; {
        else
        }
          BOOL v9 = v8 == 0;
        if (v9 || !*((unsigned char *)&v8->mPrivate + 1))
        {
          LOBYTE(mDynamicContentDelegate) = 0;
          return (char)mDynamicContentDelegate;
        }
        *a3 = v8;
      }
      LOBYTE(mDynamicContentDelegate) = 1;
    }
  }
  return (char)mDynamicContentDelegate;
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)modelCellIDForLayoutCellID:(id)a3
{
  unint64_t v3 = *(void *)&a3.var0;
  uint64_t v5 = *(void *)&a3.var0 >> 16;
  if ([(TSTMasterLayout *)self isDynamicallySwappingRows]) {
    unsigned __int16 v6 = [(TSTLayoutDynamicRowSwapProtocol *)[(TSTMasterLayout *)self dynamicRowSwapDelegate] modelRowForLayoutRow:(unsigned __int16)v3];
  }
  else {
    unsigned __int16 v6 = v3;
  }
  unint64_t v7 = v3 >> 24;
  if ([(TSTMasterLayout *)self isDynamicallySwappingColumns]) {
    LOBYTE(v5) = [(TSTLayoutDynamicColumnSwapProtocol *)[(TSTMasterLayout *)self dynamicColumnSwapDelegate] modelColForLayoutCol:v5];
  }
  if ([(TSTMasterLayout *)self isDynamicallyChangingRowCount])
  {
    int TableNumberOfRows = TSTMasterLayoutGetTableNumberOfRows((uint64_t)self);
    if ([(TSTMasterLayout *)self emptyFilteredTable]) {
      int mCachedNumberOfFooterRows = 0;
    }
    else {
      int mCachedNumberOfFooterRows = self->mCachedNumberOfFooterRows;
    }
    int v10 = TableNumberOfRows - mCachedNumberOfFooterRows;
    int mDynamicRowAdjustment = self->mDynamicRowAdjustment;
    if ((unsigned __int16)v3 >= v10 - mDynamicRowAdjustment) {
      __int16 v12 = -1;
    }
    else {
      __int16 v12 = v6;
    }
    if ((unsigned __int16)v3 >= v10 - mDynamicRowAdjustment) {
      char v13 = -1;
    }
    else {
      char v13 = v5;
    }
    if ((unsigned __int16)v3 >= v10 - mDynamicRowAdjustment) {
      int v14 = 0;
    }
    else {
      int v14 = v3 >> 24;
    }
    unsigned __int16 v15 = v6 - mDynamicRowAdjustment;
    if ((unsigned __int16)v3 >= v10) {
      unsigned __int16 v6 = v15;
    }
    else {
      unsigned __int16 v6 = v12;
    }
    if ((unsigned __int16)v3 < v10)
    {
      LOBYTE(v5) = v13;
      LODWORD(v7) = v14;
    }
  }
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)((v5 << 16) | (v7 << 24) | v6);
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)modelCellIDForStrokesOfLayoutCellID:(id)a3
{
  uint64_t v5 = *(void *)&a3.var0 >> 16;
  if ([(TSTMasterLayout *)self isDynamicallySwappingRows]) {
    unsigned __int16 var0 = [(TSTLayoutDynamicRowSwapProtocol *)[(TSTMasterLayout *)self dynamicRowSwapDelegate] modelRowForLayoutRow:a3.var0];
  }
  else {
    unsigned __int16 var0 = a3.var0;
  }
  if ([(TSTMasterLayout *)self isDynamicallySwappingColumns]) {
    LOBYTE(v5) = [(TSTLayoutDynamicColumnSwapProtocol *)[(TSTMasterLayout *)self dynamicColumnSwapDelegate] modelColForLayoutCol:v5];
  }
  if ([(TSTMasterLayout *)self isDynamicallyChangingRowCount])
  {
    int TableNumberOfRows = TSTMasterLayoutGetTableNumberOfRows((uint64_t)self);
    if ([(TSTMasterLayout *)self emptyFilteredTable]) {
      int mCachedNumberOfFooterRows = 0;
    }
    else {
      int mCachedNumberOfFooterRows = self->mCachedNumberOfFooterRows;
    }
    int v9 = TableNumberOfRows - mCachedNumberOfFooterRows;
    int mDynamicRowAdjustment = self->mDynamicRowAdjustment;
    if (a3.var0 >= v9)
    {
      var0 -= mDynamicRowAdjustment;
    }
    else
    {
      int v11 = v9 - mDynamicRowAdjustment;
      if (a3.var0 >= v11) {
        unsigned __int16 var0 = [(TSTHiddenRowsColumnsCache *)[(TSTMasterLayout *)self hiddenRowsColumnsCache] previousVisibleRow:(unsigned __int16)(v11 - 1)];
      }
    }
  }
  if ([(TSTMasterLayout *)self isDynamicallyChangingColumnCount])
  {
    int v12 = TSTMasterLayoutGetTableNumberOfColumns((uint64_t)self) - self->mDynamicColumnAdjustment;
    if (v12 <= a3.var1) {
      LOBYTE(v5) = [(TSTHiddenRowsColumnsCache *)[(TSTMasterLayout *)self hiddenRowsColumnsCache] previousVisibleColumn:(v12 - 1)];
    }
  }
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)(*(_DWORD *)&a3 & 0xFF000000 | (v5 << 16) | var0);
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)layoutCellIDForModelCellID:(id)a3
{
  uint64_t var1 = a3.var1;
  unsigned __int16 var0 = a3.var0;
  if ([(TSTMasterLayout *)self isDynamicallySwappingRows]) {
    unsigned __int16 var0 = [(TSTLayoutDynamicRowSwapProtocol *)[(TSTMasterLayout *)self dynamicRowSwapDelegate] layoutRowForModelRow:a3.var0];
  }
  if ([(TSTMasterLayout *)self isDynamicallySwappingColumns]) {
    int v7 = [(TSTLayoutDynamicColumnSwapProtocol *)[(TSTMasterLayout *)self dynamicColumnSwapDelegate] layoutColForModelCol:var1];
  }
  else {
    int v7 = var1;
  }
  if ([(TSTMasterLayout *)self isDynamicallyChangingRowCount])
  {
    $CA3468F20078D5D2DB35E78E73CA60DA v8 = [(TSTTableModel *)[(TSTMasterLayout *)self tableModel] footerRowRange];
    if (HIWORD(*(unint64_t *)&v8))
    {
      if ((*(void *)&v8 & 0xFFFF00000000) != 0
        && v8.var0.var0 <= a3.var0
        && (unsigned __int16)(v8.var0.var0 + v8.var1.var1 - 1) >= a3.var0
        && v8.var0.var1 <= var1
        && var1 <= (LOBYTE(v8.var1.var0) + v8.var0.var1 - 1))
      {
        var0 += LOWORD(self->mDynamicRowAdjustment);
      }
    }
  }
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)(*(_DWORD *)&a3 & 0xFF000000 | (v7 << 16) | var0);
}

- (BOOL)isDynamicallyResizing:(int)a3
{
  if (a3)
  {
    if (a3 != 1 || !self->mDynamicResizingColumns) {
      return 0;
    }
    $6C2899CC353BE70625C5C4ACBB5C74E2 mDynamicResizingColumnRange = self->mDynamicResizingColumnRange;
  }
  else
  {
    if (!self->mDynamicResizingRows) {
      return 0;
    }
    $6C2899CC353BE70625C5C4ACBB5C74E2 mDynamicResizingColumnRange = self->mDynamicResizingRowRange;
  }
  if (mDynamicResizingColumnRange.origin.row != 0xFFFF)
  {
    BOOL v6 = (*(void *)&mDynamicResizingColumnRange & 0xFF0000) == 16711680;
    uint64_t v4 = *(void *)&mDynamicResizingColumnRange & 0xFFFF00000000;
    unint64_t v5 = HIWORD(*(unint64_t *)&mDynamicResizingColumnRange);
    BOOL v6 = v6 || v5 == 0;
    if (!v6 && v4 != 0) {
      return 1;
    }
  }
  return 0;
}

- (BOOL)isDynamicallyResizing:(int)a3 rowColIndex:(unsigned __int16)a4
{
  if (!a3)
  {
    if (self->mDynamicResizingRows)
    {
      $6C2899CC353BE70625C5C4ACBB5C74E2 mDynamicResizingRowRange = self->mDynamicResizingRowRange;
      BOOL v7 = !HIWORD(*(unint64_t *)&mDynamicResizingRowRange)
        || (*(void *)&mDynamicResizingRowRange & 0xFFFF00000000) == 0;
      BOOL v8 = v7 || mDynamicResizingRowRange.origin.column > a4;
      if (!v8
        && a4 <= (LOBYTE(mDynamicResizingRowRange.size.numberOfColumns)
                                                                + mDynamicResizingRowRange.origin.column
                                                                - 1))
      {
        return 1;
      }
    }
    return 0;
  }
  if (a3 != 1 || !self->mDynamicResizingColumns) {
    return 0;
  }
  $6C2899CC353BE70625C5C4ACBB5C74E2 mDynamicResizingColumnRange = self->mDynamicResizingColumnRange;
  BOOL v5 = !HIWORD(*(unint64_t *)&mDynamicResizingColumnRange)
    || (*(void *)&mDynamicResizingColumnRange & 0xFFFF00000000) == 0;
  return !v5
      && a4 >= mDynamicResizingColumnRange.origin.row
      && a4 <= (unsigned __int16)(mDynamicResizingColumnRange.origin.row
                                              + mDynamicResizingColumnRange.size.numberOfRows
                                              - 1);
}

- (BOOL)isDynamicallyResizingCellID:(id)a3
{
  BOOL mDynamicResizingRows = self->mDynamicResizingRows;
  if (mDynamicResizingRows)
  {
    if (self->mDynamicResizingRowAdjustment == 0.0
      || (($6C2899CC353BE70625C5C4ACBB5C74E2 mDynamicResizingRowRange = self->mDynamicResizingRowRange,
           HIWORD(*(unint64_t *)&mDynamicResizingRowRange))
        ? (BOOL v5 = (*(void *)&mDynamicResizingRowRange & 0xFFFF00000000) == 0)
        : (BOOL v5 = 1),
          v5))
    {
      BOOL mDynamicResizingRows = 0;
    }
    else
    {
      BOOL mDynamicResizingRows = (unsigned __int16)(mDynamicResizingRowRange.origin.row
                                              + mDynamicResizingRowRange.size.numberOfRows
                                              - 1) >= a3.var0;
      if ((unsigned __int16)*(void *)&self->mDynamicResizingRowRange > a3.var0) {
        BOOL mDynamicResizingRows = 0;
      }
    }
  }
  if (self->mDynamicResizingColumns && self->mDynamicResizingColumnAdjustment != 0.0)
  {
    $6C2899CC353BE70625C5C4ACBB5C74E2 mDynamicResizingColumnRange = self->mDynamicResizingColumnRange;
    if (HIWORD(*(unint64_t *)&mDynamicResizingColumnRange)) {
      BOOL v7 = (*(void *)&mDynamicResizingColumnRange & 0xFFFF00000000) == 0;
    }
    else {
      BOOL v7 = 1;
    }
    BOOL v8 = v7 || mDynamicResizingColumnRange.origin.column > a3.var1;
    if (!v8
      && a3.var1 <= (LOBYTE(mDynamicResizingColumnRange.size.numberOfColumns)
                                                  + mDynamicResizingColumnRange.origin.column
                                                  - 1))
    {
      return 1;
    }
  }
  return mDynamicResizingRows;
}

- (NSIndexSet)visibleRowIndices
{
  unint64_t v2 = [(TSTMasterLayout *)self hiddenRowsColumnsCache];

  return [(TSTHiddenRowsColumnsCache *)v2 visibleRowIndices];
}

- (NSIndexSet)visibleColumnIndices
{
  unint64_t v2 = [(TSTMasterLayout *)self hiddenRowsColumnsCache];

  return [(TSTHiddenRowsColumnsCache *)v2 visibleColumnIndices];
}

- (TSTLayout)dynamicLayout
{
  unint64_t v2 = [(TSTMasterLayout *)self dynamicLayouts];

  return (TSTLayout *)[(NSMutableSet *)v2 anyObject];
}

- (BOOL)isDynamicallyHidingRowsCols
{
  $6C2899CC353BE70625C5C4ACBB5C74E2 mDynamicHidingRowsCols = self->mDynamicHidingRowsCols;
  if (self->mDynamicHidingRowsCols.origin.row == 0xFFFF) {
    return 0;
  }
  uint64_t v3 = *(void *)&mDynamicHidingRowsCols & 0xFF0000;
  BOOL v5 = (*(void *)&mDynamicHidingRowsCols & 0xFFFF00000000) == 0;
  unint64_t v4 = HIWORD(*(unint64_t *)&mDynamicHidingRowsCols);
  BOOL v5 = v5 || v4 == 0;
  BOOL v6 = !v5;
  return v3 != 16711680 && v6;
}

- (BOOL)isDynamicallyHidingRowsCols:(int)a3 rowColIndex:(unsigned __int16)a4
{
  $6C2899CC353BE70625C5C4ACBB5C74E2 mDynamicHidingRowsCols = self->mDynamicHidingRowsCols;
  if (self->mDynamicHidingRowsCols.origin.row == 0xFFFF) {
    return 0;
  }
  BOOL v5 = (*(void *)&mDynamicHidingRowsCols & 0xFF0000) == 0xFF0000
    || HIWORD(*(unint64_t *)&mDynamicHidingRowsCols) == 0;
  BOOL v6 = v5 || (*(void *)&mDynamicHidingRowsCols & 0xFFFF00000000) == 0;
  if (v6 || self->mDynamicHidingRowsColsDirection != a3) {
    return 0;
  }
  if (a3 == 1) {
    return a4 >= mDynamicHidingRowsCols.origin.column
  }
        && a4 <= (LOBYTE(mDynamicHidingRowsCols.size.numberOfColumns)
                                                                + mDynamicHidingRowsCols.origin.column
                                                                - 1);
  return !a3
      && a4 >= mDynamicHidingRowsCols.origin.row
      && a4 <= (unsigned __int16)(mDynamicHidingRowsCols.origin.row
                                              + mDynamicHidingRowsCols.size.numberOfRows
                                              - 1);
}

- (BOOL)isDynamicallyHidingRowsColsCellID:(id)a3
{
  $6C2899CC353BE70625C5C4ACBB5C74E2 mDynamicHidingRowsCols = self->mDynamicHidingRowsCols;
  BOOL result = 0;
  if (self->mDynamicHidingRowsCols.origin.row != 0xFFFF)
  {
    BOOL v4 = (*(void *)&mDynamicHidingRowsCols & 0xFF0000) == 0xFF0000
      || HIWORD(*(unint64_t *)&mDynamicHidingRowsCols) == 0;
    BOOL v5 = v4 || (*(void *)&mDynamicHidingRowsCols & 0xFFFF00000000) == 0;
    if (!v5
      && (unsigned __int16)*(void *)&self->mDynamicHidingRowsCols <= a3.var0
      && (unsigned __int16)(mDynamicHidingRowsCols.origin.row + mDynamicHidingRowsCols.size.numberOfRows - 1) >= a3.var0
      && a3.var1 >= mDynamicHidingRowsCols.origin.column
      && a3.var1 <= (LOBYTE(mDynamicHidingRowsCols.size.numberOfColumns)
                                                  + mDynamicHidingRowsCols.origin.column
                                                  - 1))
    {
      return 1;
    }
  }
  return result;
}

- (BOOL)isDynamicallyHidingContentOfCellID:(id)a3
{
  $6C2899CC353BE70625C5C4ACBB5C74E2 mDynamicHidingContent = self->mDynamicHidingContent;
  BOOL result = 0;
  if (self->mDynamicHidingContent.origin.row != 0xFFFF)
  {
    BOOL v4 = (*(void *)&mDynamicHidingContent & 0xFF0000) == 0xFF0000
      || HIWORD(*(unint64_t *)&mDynamicHidingContent) == 0;
    BOOL v5 = v4 || (*(void *)&mDynamicHidingContent & 0xFFFF00000000) == 0;
    if (!v5
      && (unsigned __int16)*(void *)&self->mDynamicHidingContent <= a3.var0
      && (unsigned __int16)(mDynamicHidingContent.origin.row + mDynamicHidingContent.size.numberOfRows - 1) >= a3.var0
      && a3.var1 >= mDynamicHidingContent.origin.column
      && a3.var1 <= (LOBYTE(mDynamicHidingContent.size.numberOfColumns)
                                                  + mDynamicHidingContent.origin.column
                                                  - 1))
    {
      return 1;
    }
  }
  return result;
}

- (BOOL)isDynamicallyHidingTextOfCellID:(id)a3
{
  $6C2899CC353BE70625C5C4ACBB5C74E2 mDynamicHidingText = self->mDynamicHidingText;
  BOOL result = 0;
  if (self->mDynamicHidingText.origin.row != 0xFFFF)
  {
    BOOL v4 = (*(void *)&mDynamicHidingText & 0xFF0000) == 0xFF0000
      || HIWORD(*(unint64_t *)&mDynamicHidingText) == 0;
    BOOL v5 = v4 || (*(void *)&mDynamicHidingText & 0xFFFF00000000) == 0;
    if (!v5
      && (unsigned __int16)*(void *)&self->mDynamicHidingText <= a3.var0
      && (unsigned __int16)(mDynamicHidingText.origin.row + mDynamicHidingText.size.numberOfRows - 1) >= a3.var0
      && a3.var1 >= mDynamicHidingText.origin.column
      && a3.var1 <= (LOBYTE(mDynamicHidingText.size.numberOfColumns)
                                                  + mDynamicHidingText.origin.column
                                                  - 1))
    {
      return 1;
    }
  }
  return result;
}

- (BOOL)isDynamicallyChangingInfoGeometry
{
  return self->mDynamicInfoGeometry != 0;
}

- (void)updateDynamicResize:(int)a3 resizingRange:(id)a4 resizeAdjustment:(double)a5
{
  if (a3 == 1)
  {
    p_mDynamicResizingColumnAdjustment = &self->mDynamicResizingColumnAdjustment;
    $6C2899CC353BE70625C5C4ACBB5C74E2 mDynamicResizingColumnRange = self->mDynamicResizingColumnRange;
    uint64_t v10 = 452;
    uint64_t v11 = 450;
    if (self->mDynamicResizingColumnAdjustment == 0.0)
    {
      if (mDynamicResizingColumnRange.origin.row == 0xFFFFLL) {
        goto LABEL_27;
      }
      if ((*(void *)&mDynamicResizingColumnRange & 0xFF0000) == 0xFF0000) {
        goto LABEL_27;
      }
      uint64_t v10 = 452;
      uint64_t v11 = 450;
      if (!HIWORD(*(unint64_t *)&mDynamicResizingColumnRange)
        || (*(void *)&mDynamicResizingColumnRange & 0xFFFF00000000) == 0)
      {
        goto LABEL_27;
      }
    }
    else
    {
      uint64_t v13 = 3448;
      if (mDynamicResizingColumnRange.origin.row == 0xFFFFLL
        || (*(void *)&mDynamicResizingColumnRange & 0xFF0000) == 0xFF0000)
      {
        goto LABEL_26;
      }
    }
    uint64_t v10 = 452;
    uint64_t v11 = 450;
    uint64_t v13 = 3448;
    if (HIWORD(*(unint64_t *)&mDynamicResizingColumnRange)
      && (*(void *)&mDynamicResizingColumnRange & 0xFFFF00000000) != 0)
    {
      uint64_t v10 = 452;
      uint64_t v11 = 450;
      if (self->mDynamicResizingColumns) {
        goto LABEL_27;
      }
      uint64_t v13 = 3448;
    }
LABEL_26:
    int v14 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v15 = [NSString stringWithUTF8String:"-[TSTMasterLayout updateDynamicResize:resizingRange:resizeAdjustment:]"];
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTMasterLayout.mm"), v13, @"Dynamic resize invariants violated.");
    goto LABEL_27;
  }
  p_mDynamicResizingColumnAdjustment = &self->mDynamicResizingRowAdjustment;
  $6C2899CC353BE70625C5C4ACBB5C74E2 mDynamicResizingRowRange = self->mDynamicResizingRowRange;
  uint64_t v10 = 474;
  uint64_t v11 = 472;
  if (self->mDynamicResizingRowAdjustment != 0.0)
  {
    uint64_t v13 = 3457;
    if (mDynamicResizingRowRange.origin.row == 0xFFFFLL
      || (*(void *)&mDynamicResizingRowRange & 0xFF0000) == 0xFF0000)
    {
      goto LABEL_26;
    }
    goto LABEL_22;
  }
  if (mDynamicResizingRowRange.origin.row != 0xFFFFLL && (*(void *)&mDynamicResizingRowRange & 0xFF0000) != 0xFF0000)
  {
    uint64_t v10 = 474;
    uint64_t v11 = 472;
    if (HIWORD(*(unint64_t *)&mDynamicResizingRowRange))
    {
      if ((*(void *)&mDynamicResizingRowRange & 0xFFFF00000000) != 0)
      {
LABEL_22:
        uint64_t v10 = 474;
        uint64_t v11 = 472;
        uint64_t v13 = 3457;
        if (HIWORD(*(unint64_t *)&mDynamicResizingRowRange)
          && (*(void *)&mDynamicResizingRowRange & 0xFFFF00000000) != 0)
        {
          uint64_t v10 = 474;
          uint64_t v11 = 472;
          if (self->mDynamicResizingRows) {
            goto LABEL_27;
          }
          uint64_t v13 = 3457;
        }
        goto LABEL_26;
      }
    }
  }
LABEL_27:
  *((unsigned char *)&self->super.isa + v11) = 1;
  *($CA3468F20078D5D2DB35E78E73CA60DA *)((char *)&self->super.isa + v10) = a4;
  double *p_mDynamicResizingColumnAdjustment = a5;
}

- (BOOL)isDynamicallyRevealingRowsCols
{
  $6C2899CC353BE70625C5C4ACBB5C74E2 mDynamicRevealingRowsCols = self->mDynamicRevealingRowsCols;
  if (self->mDynamicRevealingRowsCols.origin.row == 0xFFFF) {
    return 0;
  }
  uint64_t v3 = *(void *)&mDynamicRevealingRowsCols & 0xFF0000;
  BOOL v5 = (*(void *)&mDynamicRevealingRowsCols & 0xFFFF00000000) == 0;
  unint64_t v4 = HIWORD(*(unint64_t *)&mDynamicRevealingRowsCols);
  BOOL v5 = v5 || v4 == 0;
  BOOL v6 = !v5;
  return v3 != 16711680 && v6;
}

- (BOOL)isDynamicallyRevealingRowsCols:(int)a3 rowColIndex:(unsigned __int16)a4
{
  $6C2899CC353BE70625C5C4ACBB5C74E2 mDynamicRevealingRowsCols = self->mDynamicRevealingRowsCols;
  if (self->mDynamicRevealingRowsCols.origin.row == 0xFFFF) {
    return 0;
  }
  BOOL v5 = (*(void *)&mDynamicRevealingRowsCols & 0xFF0000) == 0xFF0000
    || HIWORD(*(unint64_t *)&mDynamicRevealingRowsCols) == 0;
  BOOL v6 = v5 || (*(void *)&mDynamicRevealingRowsCols & 0xFFFF00000000) == 0;
  if (v6 || self->mDynamicRevealingRowsColsDirection != a3) {
    return 0;
  }
  if (a3 == 1) {
    return a4 >= mDynamicRevealingRowsCols.origin.column
  }
        && a4 <= (LOBYTE(mDynamicRevealingRowsCols.size.numberOfColumns)
                                                                + mDynamicRevealingRowsCols.origin.column
                                                                - 1);
  return !a3
      && a4 >= mDynamicRevealingRowsCols.origin.row
      && a4 <= (unsigned __int16)(mDynamicRevealingRowsCols.origin.row
                                              + mDynamicRevealingRowsCols.size.numberOfRows
                                              - 1);
}

- (void)updateDynamicTableNameSize:(double)a3
{
  self->mDynamicTableNameResize = a3;
}

- (BOOL)isDynamicallyResizingTableName
{
  return self->mDynamicTableNameResize != 0.0;
}

- (BOOL)isDynamicallyChangingRowCount
{
  return self->mDynamicAddOrRemoveRowElementSize != 0.0 && self->mDynamicRowAdjustment != 0;
}

- (BOOL)isDynamicallyChangingColumnCount
{
  return self->mDynamicAddOrRemoveColumnElementSize != 0.0 && self->mDynamicColumnAdjustment != 0;
}

- (BOOL)isDynamicallyChangingRowOrColumnCount
{
  if ([(TSTMasterLayout *)self isDynamicallyChangingRowCount]) {
    return 1;
  }

  return [(TSTMasterLayout *)self isDynamicallyChangingColumnCount];
}

- (void)updateDynamicSelectionRegion:(id)a3
{
  mDynamicSelectionRegion = self->mDynamicSelectionRegion;
  if (mDynamicSelectionRegion)
  {

    self->mDynamicSelectionRegion = 0;
  }
  if (a3)
  {
    id v6 = a3;
    self->mDynamicSelectionRegion = (TSTCellRegion *)a3;
  }
}

- (BOOL)isDynamicallyChangingSelection
{
  return self->mDynamicSelectionRegion != 0;
}

- (BOOL)isDynamicallyColumnTabResizing
{
  return self->mDynamicColumnTabSize != 0.0;
}

- (BOOL)isDynamicallyRowTabResizing
{
  return self->mDynamicRowTabSize != 0.0;
}

- (BOOL)isDynamicallySettingBandedFill
{
  return self->mDynamicBandedFill;
}

- (BOOL)isDynamicallyRepressingFrozenHeaders
{
  return self->mDynamicRepressFrozenHeader;
}

- (BOOL)updateDynamicChangeRowOrColumnCount:(int)a3 count:(int)a4 newlyAddedElementSize:(double)a5
{
  if (!a4) {
    return 1;
  }
  uint64_t v6 = *(void *)&a4;
  unsigned int TableNumberOfColumns = TSTMasterLayoutGetTableNumberOfColumns((uint64_t)self);
  uint64_t TableNumberOfRows = TSTMasterLayoutGetTableNumberOfRows((uint64_t)self);
  uint64_t v11 = [(TSTMasterLayout *)self tableModel];
  if (!a3)
  {
    int v15 = [(TSTTableModel *)v11 numberOfRows] + v6 + self->mDynamicRowAdjustment;
    self->BOOL mDynamicResizingRows = 1;
    self->double mDynamicAddOrRemoveRowElementSize = a5;
    if (v15 <= SLODWORD(self->mCachedMaxNumberOfRows))
    {
      int v16 = [(TSTMasterLayout *)self emptyFilteredTable] ? 0 : self->mCachedNumberOfHeaderRows;
      int v23 = [(TSTMasterLayout *)self emptyFilteredTable] ? 0 : self->mCachedNumberOfFooterRows;
      if (v15 > v23 + v16)
      {
        p_int mDynamicRowAdjustment = &self->mDynamicRowAdjustment;
        TSTLayoutInvalidateLayoutSpaceTableOffsets([(TSTMasterLayout *)self dynamicLayout]);
        TSTLayoutInvalidateLayoutSpaceCoordinates([(TSTMasterLayout *)self dynamicLayout]);
        if ([(TSTMasterLayout *)self emptyFilteredTable]) {
          int mCachedNumberOfFooterRows = 0;
        }
        else {
          int mCachedNumberOfFooterRows = self->mCachedNumberOfFooterRows;
        }
        unint64_t v25 = (unint64_t)TableNumberOfColumns << 32;
        if ((int)v6 < 1)
        {
          uint64_t v26 = (unsigned __int16)(TableNumberOfRows + v6 - mCachedNumberOfFooterRows);
          unint64_t v19 = v26 | ((unint64_t)-(int)v6 << 48) | v25;
          unint64_t v20 = v26 | ((unint64_t)(mCachedNumberOfFooterRows - v6 + 1) << 48) | v25;
          double v21 = self;
          uint64_t v22 = 21;
        }
        else
        {
          unint64_t v19 = (unsigned __int16)(TableNumberOfRows - mCachedNumberOfFooterRows) | (unint64_t)(v6 << 48) | v25;
          unint64_t v20 = (unsigned __int16)(TableNumberOfRows + ~(_WORD)mCachedNumberOfFooterRows) | ((unint64_t)(v6 + mCachedNumberOfFooterRows + 1) << 48) | v25;
          double v21 = self;
          uint64_t v22 = 22;
        }
        goto LABEL_27;
      }
    }
    return 0;
  }
  int v12 = [(TSTTableModel *)v11 numberOfColumns] + v6 + self->mDynamicColumnAdjustment;
  self->mDynamicResizingColumns = 1;
  self->mDynamicAddOrRemoveColumnElementSize = a5;
  if (v12 > SLODWORD(self->mCachedMaxNumberOfColumns)) {
    return 0;
  }
  int v13 = [(TSTMasterLayout *)self emptyFilteredTable] ? 0 : self->mCachedNumberOfHeaderColumns;
  if (v12 <= v13) {
    return 0;
  }
  p_int mDynamicRowAdjustment = &self->mDynamicColumnAdjustment;
  uint64_t v18 = TableNumberOfRows << 48;
  TSTLayoutInvalidateLayoutSpaceTableOffsets([(TSTMasterLayout *)self dynamicLayout]);
  TSTLayoutInvalidateLayoutSpaceCoordinates([(TSTMasterLayout *)self dynamicLayout]);
  if ((int)v6 < 1)
  {
    unint64_t v19 = v18 | ((unint64_t)((((v18 | ((unint64_t)TableNumberOfColumns << 32)) >> 32)
                                                                  + v6)
                                  - (v6 << 16)) << 16);
    unint64_t v20 = (((((v18 | ((unint64_t)TableNumberOfColumns << 32)) >> 32) + v6) << 16) + 16711680) & 0xFF0000 | ((unint64_t)(unsigned __int16)(1 - v6) << 32) | v18;
    double v21 = self;
    uint64_t v22 = 1;
  }
  else
  {
    unint64_t v19 = v18 | ((unint64_t)(TableNumberOfColumns | (v6 << 16)) << 16);
    unint64_t v20 = ((TableNumberOfColumns << 16) + 16711680) & 0xFF0000 | ((unint64_t)(unsigned __int16)(v6 + 1) << 32) | v18;
    double v21 = self;
    uint64_t v22 = 2;
  }
LABEL_27:
  [(TSTMasterLayout *)v21 addChangeDescriptorWithType:v22 andCellRange:v19 andStrokeRange:v20];
  *p_mDynamicRowAdjustment += v6;
  [(TSTLayout *)[(TSTMasterLayout *)self dynamicLayout] invalidateSize];
  [(TSTLayout *)[(TSTMasterLayout *)self dynamicLayout] validate];
  return 1;
}

- (void)updateDynamicColumnTabSize:(double)a3
{
  self->mDynamicColumnTabSize = a3;
}

- (void)updateDynamicRowTabSize:(double)a3
{
  self->mDynamicRowTabSize = a3;
}

- (void)updateDynamicBandedFill:(BOOL)a3 setting:(BOOL)a4
{
  self->mDynamicBandedFill = a3;
  self->mDynamicBandedFillSetting = a4;
}

- (void)updateDynamicRepressFrozenHeader:(BOOL)a3
{
  self->mDynamicRepressFrozenHeader = a3;
}

- (void)updateDynamicHidingRowsCols:(int)a3 hidingCellRange:(id)a4
{
  int mDynamicHidingRowsColsDirection = self->mDynamicHidingRowsColsDirection;
  $6C2899CC353BE70625C5C4ACBB5C74E2 mDynamicHidingRowsCols = self->mDynamicHidingRowsCols;
  if (mDynamicHidingRowsColsDirection != a3
    || ((*(void *)&mDynamicHidingRowsCols ^ *(void *)&a4) & 0xFFFFFFFF00FFFFFFLL) != 0)
  {
    if (mDynamicHidingRowsCols.origin.row != 0xFFFF)
    {
      BOOL v10 = (*(void *)&mDynamicHidingRowsCols & 0xFF0000) == 0xFF0000
         || mDynamicHidingRowsCols.size.numberOfRows == 0;
      if (!v10 && (*(void *)&mDynamicHidingRowsCols & 0xFFFF00000000) != 0)
      {
        if (mDynamicHidingRowsColsDirection == 1) {
          uint64_t v12 = 5;
        }
        else {
          uint64_t v12 = 26;
        }
        [(TSTMasterLayout *)self addChangeDescriptorWithType:v12 andCellRange:mDynamicHidingRowsCols andStrokeRange:*(void *)&self->mDynamicHidingRowsCols];
      }
    }
    if (a4.var0.var0 != 0xFFFF
      && (*(void *)&a4 & 0xFF0000) != 0xFF0000
      && HIWORD(*(unint64_t *)&a4)
      && (*(void *)&a4 & 0xFFFF00000000) != 0)
    {
      if (a3 == 1) {
        uint64_t v13 = 5;
      }
      else {
        uint64_t v13 = 26;
      }
      [(TSTMasterLayout *)self addChangeDescriptorWithType:v13 andCellRange:a4 andStrokeRange:a4];
    }
    self->$6C2899CC353BE70625C5C4ACBB5C74E2 mDynamicHidingRowsCols = ($6C2899CC353BE70625C5C4ACBB5C74E2)a4;
    self->int mDynamicHidingRowsColsDirection = a3;
  }
}

- (void)updateDynamicHidingContent:(id)a3
{
  self->$6C2899CC353BE70625C5C4ACBB5C74E2 mDynamicHidingContent = ($6C2899CC353BE70625C5C4ACBB5C74E2)a3;
}

- (void)updateDynamicHidingText:(id)a3
{
  self->$6C2899CC353BE70625C5C4ACBB5C74E2 mDynamicHidingText = ($6C2899CC353BE70625C5C4ACBB5C74E2)a3;
}

- (void)updateDynamicInfoGeometry:(id)a3
{
  self->mDynamicInfoGeometry = (TSDInfoGeometry *)[a3 copy];
}

- (void)updateDynamicRevealingRowsCols:(int)a3 revealingCellRange:(id)a4
{
  int mDynamicRevealingRowsColsDirection = self->mDynamicRevealingRowsColsDirection;
  $6C2899CC353BE70625C5C4ACBB5C74E2 mDynamicRevealingRowsCols = self->mDynamicRevealingRowsCols;
  if (mDynamicRevealingRowsColsDirection != a3
    || ((*(void *)&mDynamicRevealingRowsCols ^ *(void *)&a4) & 0xFFFFFFFF00FFFFFFLL) != 0)
  {
    if (mDynamicRevealingRowsCols.origin.row != 0xFFFF)
    {
      BOOL v10 = (*(void *)&mDynamicRevealingRowsCols & 0xFF0000) == 0xFF0000
         || mDynamicRevealingRowsCols.size.numberOfRows == 0;
      if (!v10 && (*(void *)&mDynamicRevealingRowsCols & 0xFFFF00000000) != 0)
      {
        if (mDynamicRevealingRowsColsDirection == 1) {
          uint64_t v12 = 5;
        }
        else {
          uint64_t v12 = 26;
        }
        [(TSTMasterLayout *)self addChangeDescriptorWithType:v12 andCellRange:mDynamicRevealingRowsCols andStrokeRange:*(void *)&self->mDynamicRevealingRowsCols];
      }
    }
    if (a4.var0.var0 != 0xFFFF
      && (*(void *)&a4 & 0xFF0000) != 0xFF0000
      && HIWORD(*(unint64_t *)&a4)
      && (*(void *)&a4 & 0xFFFF00000000) != 0)
    {
      if (a3 == 1) {
        uint64_t v13 = 5;
      }
      else {
        uint64_t v13 = 26;
      }
      [(TSTMasterLayout *)self addChangeDescriptorWithType:v13 andCellRange:a4 andStrokeRange:a4];
    }
    self->$6C2899CC353BE70625C5C4ACBB5C74E2 mDynamicRevealingRowsCols = ($6C2899CC353BE70625C5C4ACBB5C74E2)a4;
    self->int mDynamicRevealingRowsColsDirection = a3;
  }
}

- (void)updateDynamicContentDelegate:(id)a3
{
  mDynamicContentDelegate = self->mDynamicContentDelegate;
  if (mDynamicContentDelegate != a3)
  {
    if (mDynamicContentDelegate)
    {

      self->mDynamicContentDelegate = 0;
    }
    if (a3)
    {
      id v6 = a3;
      self->mDynamicContentDelegate = (TSTLayoutDynamicContentProtocol *)a3;
    }
  }
}

- (void)updateDynamicFontColor:(id)a3 andRange:(id)a4
{
  mDynamicFontColor = self->mDynamicFontColor;
  if (mDynamicFontColor)
  {

    self->mDynamicFontColor = 0;
  }
  if (a3)
  {
    id v8 = a3;
    self->mDynamicFontColor = (TSUColor *)a3;
  }
  self->mDynamicFontColorCellRange = ($6C2899CC353BE70625C5C4ACBB5C74E2)a4;
}

- (void)updateDynamicRowSwapDelegate:(id)a3
{
  mDynamicRowSwapDelegate = self->mDynamicRowSwapDelegate;
  if (mDynamicRowSwapDelegate)
  {

    self->mDynamicRowSwapDelegate = 0;
  }
  if (a3)
  {
    id v6 = a3;
    self->mDynamicRowSwapDelegate = (TSTLayoutDynamicRowSwapProtocol *)a3;
  }
}

- (void)updateDynamicColumnSwapDelegate:(id)a3
{
  mDynamicColumnSwapDelegate = self->mDynamicColumnSwapDelegate;
  if (mDynamicColumnSwapDelegate)
  {

    self->mDynamicColumnSwapDelegate = 0;
  }
  if (a3)
  {
    id v6 = a3;
    self->mDynamicColumnSwapDelegate = (TSTLayoutDynamicColumnSwapProtocol *)a3;
  }
}

- (void)updateDynamicSuppressingConditionalStylesCellID:(id)a3
{
  self->mDynamicSuppressingConditionalStylesCellID = ($5CFCD363C99B2F51819B67AD7AD2E060)a3;
}

- (TSTLayoutDynamicContentProtocol)dynamicContentDelegate
{
  return self->mDynamicContentDelegate;
}

- (BOOL)isDynamicallyChangingContent
{
  mDynamicContentDelegate = self->mDynamicContentDelegate;
  if (mDynamicContentDelegate)
  {
    if (!-[TSTLayoutDynamicContentProtocol dynamicContentMustDrawOnMainThread](mDynamicContentDelegate, "dynamicContentMustDrawOnMainThread")|| (LODWORD(mDynamicContentDelegate) = [MEMORY[0x263F08B88] isMainThread], mDynamicContentDelegate))
    {
      LOBYTE(mDynamicContentDelegate) = 1;
    }
  }
  return (char)mDynamicContentDelegate;
}

- (BOOL)isDynamicallyChangingFontColorOfCellID:(id)a3
{
  BOOL result = self->mDynamicFontColor
        && (($6C2899CC353BE70625C5C4ACBB5C74E2 mDynamicFontColorCellRange = self->mDynamicFontColorCellRange,
             HIWORD(*(unint64_t *)&mDynamicFontColorCellRange))
          ? (BOOL v4 = (*(void *)&mDynamicFontColorCellRange & 0xFFFF00000000) == 0)
          : (BOOL v4 = 1),
            !v4
         && (unsigned __int16)*(void *)&self->mDynamicFontColorCellRange <= a3.var0
         && (unsigned __int16)(mDynamicFontColorCellRange.origin.row + mDynamicFontColorCellRange.size.numberOfRows - 1) >= a3.var0
         && a3.var1 >= mDynamicFontColorCellRange.origin.column)
        && a3.var1 <= (LOBYTE(mDynamicFontColorCellRange.size.numberOfColumns)
                                                    + mDynamicFontColorCellRange.origin.column
                                                    - 1);
  return result;
}

- (TSTLayoutDynamicRowSwapProtocol)dynamicRowSwapDelegate
{
  return self->mDynamicRowSwapDelegate;
}

- (BOOL)isDynamicallySwappingRows
{
  return self->mDynamicRowSwapDelegate != 0;
}

- (TSTLayoutDynamicColumnSwapProtocol)dynamicColumnSwapDelegate
{
  return self->mDynamicColumnSwapDelegate;
}

- (BOOL)isDynamicallySwappingColumns
{
  return self->mDynamicColumnSwapDelegate != 0;
}

- (void)updateDynamicResizeInfo:(id)a3
{
  self->mDynamicResizeInfo = 0;
  self->mDynamicResizeInfo = (TSTLayoutDynamicResizeInfo *)a3;
}

- (void)invalidateDynamicResizeInfo
{
}

- (BOOL)isGrouped
{
  return objc_opt_isKindOfClass() & 1;
}

- (void)p_processChange:(id)a3 forChangeSource:(id)a4
{
  if (objc_msgSend(a4, "isEqual:", -[TSTMasterLayout tableInfo](self, "tableInfo")))
  {
    objc_opt_class();
    [a3 details];
    id v6 = (TSTChangeDescriptor *)TSUDynamicCast();
    if (!v6)
    {
      objc_opt_class();
      [a3 details];
      BOOL v7 = (void *)TSUDynamicCast();
      if (!v7) {
        return;
      }
      id v8 = (void *)[v7 changedProperties];
      int v9 = objc_msgSend(v8, "propertySetByIntersectingWithPropertySet:", +[TSWPParagraphStyle properties](TSWPParagraphStyle, "properties"));
      BOOL v10 = objc_msgSend(v8, "propertySetByIntersectingWithPropertySet:", +[TSTCellStyle properties](TSTCellStyle, "properties"));
      if (![v9 count] && !objc_msgSend(v10, "count")) {
        return;
      }
      id v6 = +[TSTChangeDescriptor changeDescriptorWithType:40 cellRange:[(TSTTableModel *)[(TSTMasterLayout *)self tableModel] range] strokeRange:[(TSTTableModel *)[(TSTMasterLayout *)self tableModel] range]];
    }
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    uint64_t v11 = (void *)TSUDynamicCast();
    if ([v11 wpKind] == 5)
    {
      $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v12 = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)[(TSTEditingState *)[(TSTTableInfo *)[(TSTMasterLayout *)self tableInfo] editingState] editingCellID];
      uint64_t v13 = [v11 hyperlinkCellID];
      if ((_WORD)v13 != 0xFFFF && (v13 & 0xFF0000) != 0xFF0000) {
        $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v12 = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)[v11 hyperlinkCellID];
      }
      unint64_t v14 = *(unsigned int *)&v12 | 0x1000100000000;
      if (![(TSTMasterLayout *)self emptyFilteredTable]) {
        unint64_t v14 = TSTTableExpandCellRangeToCoverMergedCells((uint64_t)[(TSTMasterLayout *)self tableModel], *(unsigned int *)&v12 | 0x1000100000000);
      }
      if ((_WORD)v14 != 0xFFFF && (v14 & 0xFF0000) != 0xFF0000 && HIWORD(v14) && (v14 & 0xFFFF00000000) != 0)
      {
        id v6 = +[TSTChangeDescriptor changeDescriptorWithType:33 cellRange:v14];
LABEL_19:
        [(TSTMasterLayout *)self addChangeDescriptor:v6];
      }
    }
  }
}

- (void)syncProcessChanges:(id)a3 forChangeSource:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a3 && [a3 count])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v7 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(a3);
          }
          [(TSTMasterLayout *)self p_processChange:*(void *)(*((void *)&v11 + 1) + 8 * v10++) forChangeSource:a4];
        }
        while (v8 != v10);
        uint64_t v8 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
    if ([(TSTMasterLayout *)self tableInfo] == a4) {
      [(TSTLayout *)[(TSTTablePartitioner *)[(TSTTableInfo *)[(TSTMasterLayout *)self tableInfo] partitioner] scaledLayout] processChanges:a3];
    }
  }
}

- (void)addChangeDescriptorWithType:(int)a3 andCellRange:(id)a4
{
}

- (void)addChangeDescriptorWithType:(int)a3 andCellRange:(id)a4 andStrokeRange:(id)a5
{
  id v6 = +[TSTChangeDescriptor changeDescriptorWithType:*(void *)&a3 cellRange:a4 strokeRange:a5];

  [(TSTMasterLayout *)self addChangeDescriptor:v6];
}

- (void)addChangeDescriptor:(id)a3
{
  if (a3)
  {
    mChangeDescriptors = self->mChangeDescriptors;
    objc_sync_enter(mChangeDescriptors);
    if ([a3 changeDescriptor] != 33
      && [a3 changeDescriptor] != 29
      || (objc_msgSend((id)-[NSMutableArray lastObject](-[TSTMasterLayout changeDescriptors](self, "changeDescriptors"), "lastObject"), "isEqual:", a3) & 1) == 0)
    {
      [(NSMutableArray *)[(TSTMasterLayout *)self changeDescriptors] addObject:a3];
    }
    objc_sync_exit(mChangeDescriptors);
  }
}

- (void)willBeAddedToDocumentRoot:(id)a3
{
  uint64_t v4 = [a3 changeNotifier];

  [(TSTMasterLayout *)self setChangeNotifier:v4];
}

- (void)wasRemovedFromDocumentRoot
{
  mChangeNotifier = self->mChangeNotifier;
  if (mChangeNotifier)
  {
    if (self->mTableInfo)
    {
      -[TSKChangeNotifier removeObserver:forChangeSource:](mChangeNotifier, "removeObserver:forChangeSource:", self);

      self->mChangeNotifier = 0;
    }
  }
}

- (void)validate
{
  [(NSLock *)self->mLock lock];
  self->unsigned __int16 mCachedNumberOfHeaderColumns = [(TSTTableModel *)[(TSTMasterLayout *)self tableModel] numberOfHeaderColumns];
  self->unsigned int mCachedNumberOfHeaderRows = [(TSTTableModel *)[(TSTMasterLayout *)self tableModel] numberOfHeaderRows];
  self->int mCachedNumberOfFooterRows = [(TSTTableModel *)[(TSTMasterLayout *)self tableModel] numberOfFooterRows];
  BOOL v3 = [(TSTTableModel *)[(TSTMasterLayout *)self tableModel] tableNameEnabled];
  if (self->mTableNameEnabled != v3) {
    self->mTableNameEnabled = v3;
  }
  TSTMasterLayoutStrokesArrayRangeUpdate(self);
  [(TSTMasterLayout *)self validateBandedFill];
  [(TSTMasterLayout *)self validateTableRowsBehavior];
  [(TSTMasterLayout *)self validateDynamicResizeInfo];
  [(TSTMasterLayout *)self validateChangeDescriptorQueue];
  mLock = self->mLock;

  [(NSLock *)mLock unlock];
}

- (void)validateMasterLayoutForChangeDescriptors:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    char v7 = 0;
    char v8 = 0;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(a3);
        }
        long long v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v7 |= [v11 changeDescriptor] == 31;
        v8 |= [v11 changeDescriptor] == 29;
      }
      uint64_t v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
    if (v7) {
      [(TSTMasterLayout *)self invalidateTableNameHeight];
    }
    if (v8) {
      [(TSTMasterLayout *)self invalidateDefaultFontHeights];
    }
  }
}

- (void)validateChangeDescriptorQueue
{
  TSTMasterLayoutGetTableNumberOfRows((uint64_t)self);
  TSTMasterLayoutGetTableNumberOfColumns((uint64_t)self);
  mChangeDescriptors = self->mChangeDescriptors;
  objc_sync_enter(mChangeDescriptors);
  if ([(NSMutableArray *)self->mChangeDescriptors count])
  {
    uint64_t v4 = (void *)[(NSMutableArray *)[(TSTMasterLayout *)self changeDescriptors] mutableCopy];
    [(NSMutableArray *)[(TSTMasterLayout *)self changeDescriptors] removeAllObjects];
  }
  else
  {
    uint64_t v4 = 0;
  }
  objc_sync_exit(mChangeDescriptors);
  [(TSTMasterLayout *)self validateRowVisibility:v4];
  if (v4)
  {
    [(TSUConcurrentCache *)[(TSTMasterLayout *)self cellIDToWPColumnCache] removeAllObjects];
    [(TSUReadWriteQueue *)[(TSUConcurrentCache *)[(TSTMasterLayout *)self cellIDToWPColumnCache] readWriteQueue] waitOnInFlightWriters];
    self->mCurrentLayoutTask = [[TSTLayoutTask alloc] initWithMasterLayout:self];
    id v5 = [(TSTWidthHeightCache *)[(TSTMasterLayout *)self widthHeightCache] validateChangeDescriptors:v4 tableModel:[(TSTMasterLayout *)self tableModel]];
    [(TSTHiddenRowsColumnsCache *)[(TSTMasterLayout *)self hiddenRowsColumnsCache] validateChangeDescriptors:v4];
    [(TSTMasterLayout *)self validateMasterLayoutForChangeDescriptors:v4];
    [(TSTHiddenRowsColumnsCache *)[(TSTMasterLayout *)self hiddenRowsColumnsCache] validate:self];
    [(TSTMasterLayout *)self validateDefaultFontHeights];
    [(TSTMasterLayout *)self validateStrokesForRegion:[(TSTMasterLayout *)self regionForStrokeValidationFromChangeDescriptors:v4] regionAlreadyValidated:[(TSTMasterLayout *)self validateFittingInfoForChangeDescriptors:v4 rowsNeedingFittingInfo:v5]];

    [(TSTMasterLayout *)self processLayoutTask:self->mCurrentLayoutTask];
    self->mCurrentLayoutTask = 0;
    [(TSTMasterLayout *)self waitForLayoutToComplete];
    [(TSTMasterLayout *)self updateWHCForMergeRanges];
    mParaStyleToHeightCache = self->mParaStyleToHeightCache;
    [(TSURetainedPointerKeyDictionary *)mParaStyleToHeightCache removeAllObjects];
  }
}

- (void)updateWHCForMergeRanges
{
  $CA3468F20078D5D2DB35E78E73CA60DA v6 = [(TSTMergeRangeSortedSet *)self->mMergeRanges begin];
  if (v6.var0.var0 != 0xFFFF && (*(void *)&v6 & 0xFF0000) != 0xFF0000)
  {
    do
    {
      if (!HIWORD(*(unint64_t *)&v6) || (*(void *)&v6 & 0xFFFF00000000) == 0) {
        break;
      }
      [(TSTMergeRangeSortedSet *)self->mMergeRanges getSize];
      double v8 = v7;
      unsigned __int16 v9 = v6.var0.var0 + v6.var1.var1 - 1;
      $2F2D2FE54C0B9D2AA4EBD8788136C7D0 var0 = v6.var0;
      if (v9 > v6.var0.var0)
      {
        do
        {
          double v8 = v8 - TSTMasterLayoutHeightOfRow(self, var0.var0, 0, 0, 1, 1);
          ++*(_DWORD *)&var0;
        }
        while (var0.var0 < v9);
      }
      uint64_t v11 = *(_DWORD *)&v6.var0 & 0xFF0000 | v9;
      [(TSTMergeRangeSortedSet *)self->mMergeRanges isCheckbox];
      [(TSTMergeRangeSortedSet *)self->mMergeRanges getPaddingInsets];
      if (v8 <= 8.0)
      {
        unint64_t v3 = v3 & 0xFFFFFFFF00000000 | v11;
        unsigned int v18 = [(TSTMasterLayout *)self tableAreaForCellID:v3];
        long long v15 = [(TSTMasterLayout *)self widthHeightCache];
        double v16 = self->mTableDefaultFontHeightForArea[v18];
        unint64_t v2 = v2 & 0xFFFFFFFF00000000 | v11;
        unint64_t v17 = v2;
      }
      else
      {
        double v14 = v13 + v8 + v12;
        long long v15 = [(TSTMasterLayout *)self widthHeightCache];
        unint64_t v4 = v4 & 0xFFFFFFFF00000000 | v11;
        double v16 = v14;
        unint64_t v17 = v4;
      }
      [(TSTWidthHeightCache *)v15 setFitHeight:v17 forCellID:v16];
      $CA3468F20078D5D2DB35E78E73CA60DA v6 = [(TSTMergeRangeSortedSet *)self->mMergeRanges iter];
      if (v6.var0.var0 == 0xFFFF) {
        break;
      }
    }
    while ((*(void *)&v6 & 0xFF0000) != 0xFF0000);
  }
  mMergeRanges = self->mMergeRanges;

  [(TSTMergeRangeSortedSet *)mMergeRanges reset];
}

- (void)validateFittingInfoForCell:(id)a3 cellID:(id)a4 mergeRange:(id)a5 setFitting:(BOOL)a6
{
  uint64_t var1 = a5.var1.var1;
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v11 = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)[(TSTMasterLayout *)self modelCellIDForLayoutCellID:*(_DWORD *)&a5.var0];
  unint64_t v12 = a4;
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v13 = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)[(TSTMasterLayout *)self modelCellIDForLayoutCellID:*(unsigned int *)&a4];
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v14 = v13;
  if (v11.var0 == 0xFFFF
    || (*(void *)&v11.var0 & 0xFF0000) == 0xFF0000
    || !var1
    || (*(void *)&a5 & 0xFFFF00000000) == 0)
  {
    uint64_t v57 = 1;
    unint64_t v58 = 0x100000000;
  }
  else
  {
    if (((*(_DWORD *)&v13 ^ *(_DWORD *)&v11) & 0xFFFFFF) != 0) {
      return;
    }
    uint64_t v57 = var1;
    unint64_t v58 = *(void *)&a5 & 0xFFFFFFFF00000000;
    a4 = v11;
  }
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v59 = a4;
  unint64_t v61 = v12;
  if (a3)
  {
    int v15 = *((unsigned __int8 *)a3 + 9);
    double v16 = (void *)*((void *)a3 + 5);
    if (v16)
    {
      uint64_t v17 = v13;
LABEL_13:
      unsigned int v18 = (void *)*((void *)a3 + 7);
      goto LABEL_15;
    }
  }
  else
  {
    int v15 = 0;
  }
  uint64_t v17 = v13;
  double v16 = (void *)TSTTableCellStyleForCellWithEmptyStyleAtCellID((uint64_t *)[(TSTMasterLayout *)self tableModel], *(_DWORD *)&v13, 0);
  if (a3) {
    goto LABEL_13;
  }
  unsigned int v18 = 0;
LABEL_15:
  uint64_t v66 = v17;
  uint64_t v19 = TSTTableTextStyleForCellWithEmptyStyleAtCellID((uint64_t *)[(TSTMasterLayout *)self tableModel], v17, 0);
  BOOL v65 = 0;
  v63 = (void *)v19;
  if (v18) {
    unint64_t v20 = v18;
  }
  else {
    unint64_t v20 = (void *)v19;
  }
  if (a5.var0.var0 != 0xFFFF && (*(void *)&a5 & 0xFF0000) != 0xFF0000)
  {
    BOOL v22 = (*(void *)&a5 & 0xFFFF00000000) != 0 && var1 != 0;
    BOOL v65 = v22;
  }
  unint64_t v55 = *(void *)&a5 & 0xFF0000;
  int v56 = v15;
  if (v15 == 3 || v15 == 9)
  {
    if (!a3) {
      goto LABEL_31;
    }
  }
  else if (!*((_DWORD *)a3 + 25) || *((_DWORD *)a3 + 26) != 266)
  {
    BOOL v25 = 0;
    BOOL v64 = 0;
    int v62 = 0;
    goto LABEL_42;
  }
  unsigned int v23 = *((_DWORD *)a3 + 2);
  if ((v23 & 0x10000) != 0)
  {
    int v24 = HIWORD(v23) & 1;
    goto LABEL_36;
  }
LABEL_31:
  int v24 = -[__CFString rangeOfCharacterFromSet:](TSTTableStringForCellAtCellID((uint64_t)-[TSTMasterLayout tableModel](self, "tableModel"), (__CFString *)a3, v66), "rangeOfCharacterFromSet:", [MEMORY[0x263F08708] newlineCharacterSet]) != 0x7FFFFFFFFFFFFFFFLL;
LABEL_36:
  int v62 = v24;
  if (v16) {
    BOOL v64 = ([v16 intValueForProperty:896] & 0x7FFFFFFF) != 0;
  }
  else {
    BOOL v64 = 0;
  }
  if (self->mContainedTextEditor) {
    BOOL v25 = (([(TSTTableInfo *)[(TSTMasterLayout *)self tableInfo] editingCellID] ^ *(_DWORD *)&v14) & 0xFFFFFF) == 0;
  }
  else {
    BOOL v25 = 0;
  }
LABEL_42:
  __int16 v60 = var1;
  if (v20 && [v20 isVariation])
  {
    [v20 overrideCGFloatValueForProperty:17];
    double v27 = v26;
    if (((*(void *)&v26 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE
      && (*(void *)&v26 & 0x7FFFFFFFFFFFFFFFuLL) < 0x7FF0000000000001
      && *(void *)&v26 != 0xFFF0000000000000
      && (*(void *)&v26 & 0x7FFFFFFFFFFFFFFFuLL) - 1 > 0xFFFFFFFFFFFFELL)
    {
      BOOL v32 = 0;
    }
    else
    {
      objc_msgSend((id)objc_msgSend(v20, "parent"), "CGFloatValueForProperty:", 17);
      BOOL v32 = v27 != v31;
    }
    BOOL v33 = [v20 overrideValueForProperty:16] != 0;
    if ([v20 overridesProperty:85]) {
      int v34 = 1;
    }
    else {
      int v34 = [v20 overridesProperty:33];
    }
  }
  else
  {
    BOOL v32 = 0;
    BOOL v33 = 0;
    int v34 = 0;
  }
  uint64_t v35 = [v16 valueForProperty:904];
  [(TSTMasterLayout *)self edgeInsetsFromPadding:v35];
  double v37 = v36;
  double v39 = v38;
  [(TSTMasterLayout *)self defaultPaddingForCellID:v66];
  double v42 = v40 + v41;
  if ((v64 | v62 | v25))
  {
    int v43 = 1;
  }
  else if (v56 == 9)
  {
    int v43 = 1;
  }
  else
  {
    int v43 = v34;
  }
  int v44 = v32 || v33;
  if (v37 + v39 != v42) {
    int v44 = 1;
  }
  if (v20 != v63) {
    int v44 = 1;
  }
  char v45 = v44 & v65;
  if (!(*(unint64_t *)&a5 >> 49)) {
    char v45 = 0;
  }
  if ((v45 & 1) != 0 || v43)
  {
    uint64_t v50 = [v16 intValueForProperty:903];
    if (v65) {
      uint64_t v51 = v58 & 0xFFFF00000000 | (v57 << 48) | *(unsigned int *)&v59;
    }
    else {
      uint64_t v51 = 0xFFFFFFLL;
    }
    if (TSTCellFormatUsesAccountingStyle(a3)) {
      int v52 = 0;
    }
    else {
      int v52 = 15;
    }
    HIDWORD(v54) = v52;
    LOBYTE(v54) = 1;
    -[TSTMasterLayout queueCellForValidation:cell:mergeRange:wrap:verticalAlignment:padding:prop:layoutCacheFlags:](self, "queueCellForValidation:cell:mergeRange:wrap:verticalAlignment:padding:prop:layoutCacheFlags:", v58 & 0xFFFF00000000 | (v57 << 48) | *(unsigned int *)&v59, a3, v51, v64, v50, v35, v54);
  }
  else
  {
    if (v44)
    {
      [(TSTMasterLayout *)self fontHeightOfParagraphStyle:v20];
      double v47 = v39 + v37 + v46;
      mWidthHeightCache = self->mWidthHeightCache;
      if (v65) {
        unint64_t v49 = (unsigned __int16)(a5.var0.var0 + v60 - 1) | v55;
      }
      else {
        unint64_t v49 = v61;
      }
    }
    else
    {
      if (v65) {
        unint64_t v53 = (unsigned __int16)(a5.var0.var0 + v60 - 1) | v55;
      }
      else {
        unint64_t v53 = v61;
      }
      double v47 = self->mTableDefaultFontHeightForArea[-[TSTMasterLayout tableAreaForCellID:](self, "tableAreaForCellID:")];
      mWidthHeightCache = self->mWidthHeightCache;
      unint64_t v49 = v53;
    }
    [(TSTWidthHeightCache *)mWidthHeightCache setFitHeight:v49 forCellID:v47];
  }
}

- (void)validateFittingInfoWithCellRange:(id)a3
{
  BOOL v6 = [(TSTMasterLayout *)self tableRowsBehavior] == 3
    || [(TSTMasterLayout *)self tableRowsBehavior] == 1;
  BOOL v32 = v6;
  int v34 = [[TSTLayoutCellIterator alloc] initWithMasterLayout:self range:a3];
  double v36 = objc_alloc_init(TSTCell);
  double v7 = objc_alloc_init(TSTCell);
  BOOL v8 = 0;
  LODWORD(v9) = 0;
  BOOL v11 = (*(void *)&a3 & 0xFFFF00000000) == 0 || HIWORD(*(unint64_t *)&a3) == 0;
  char v38 = v11;
  int v12 = 255;
  LOWORD(v13) = -1;
  unsigned int v14 = 0xFFFFFF;
  unint64_t v15 = 0xFFFFFFLL;
LABEL_11:
  long long v29 = v7;
  BOOL v27 = v8;
  BOOL v35 = v8;
  uint64_t v26 = 0xFFFFFFLL;
  LOWORD(v16) = v13;
  LODWORD(v17) = v12;
  do
  {
    if ((_WORD)v16 == 0xFFFF || v17 == 255)
    {
      TSTLayoutCellIteratorGetNextCell((uint64_t)v34, &v41);
      uint64_t v16 = WORD2(v41);
      if (WORD2(v41) == 0xFFFFLL) {
        break;
      }
      uint64_t v17 = BYTE6(v41);
      if (BYTE6(v41) == 255) {
        break;
      }
      uint64_t v9 = HIBYTE(v41);
      TSTLayoutCellIteratorExpandCell((uint64_t)v34, (uint64_t)&v41);
      BOOL v35 = v42 != 0;
      if (v42) {
        TSTCellCopy(v42, (uint64_t)v36);
      }
      unint64_t v15 = v43;
      unint64_t v31 = v16 | (v17 << 16) | (v9 << 24) | v31 & 0xFFFFFFFF00000000;
      TSTMasterLayoutUpdateStrokesForCell(self, (uint64_t)v36, v16 | (v17 << 16) | (v9 << 24));
    }
    unsigned int v19 = (unsigned __int16)v16;
    char v20 = v38;
    if ((unsigned __int16)v16 < a3.var0.var0) {
      char v20 = 1;
    }
    LODWORD(v13) = 0xFFFF;
    if ((v20 & 1) != 0 || (unsigned __int16)(a3.var0.var0 + a3.var1.var1 - 1) < (unsigned __int16)v16)
    {
      LODWORD(v39) = 255;
      LODWORD(v33) = 0;
    }
    else
    {
      LODWORD(v13) = 0xFFFF;
      if ((int)v17 + 1 < a3.var0.var1
        || v17 >= (LOBYTE(a3.var1.var0) + a3.var0.var1 - 1))
      {
        LODWORD(v39) = 255;
        LODWORD(v33) = 0;
      }
      else
      {
        TSTLayoutCellIteratorGetNextCell((uint64_t)v34, &v41);
        uint64_t v13 = WORD2(v41);
        uint64_t v33 = HIBYTE(v41);
        uint64_t v39 = BYTE6(v41);
        if (WORD2(v41) != 0xFFFFLL && BYTE6(v41) != 255)
        {
          TSTLayoutCellIteratorExpandCell((uint64_t)v34, (uint64_t)&v41);
          BOOL v27 = v42 != 0;
          if (v42) {
            TSTCellCopy(v42, (uint64_t)v29);
          }
          uint64_t v26 = v43;
          unint64_t v28 = v13 | (v39 << 16) | (v33 << 24) | v28 & 0xFFFFFFFF00000000;
          TSTMasterLayoutUpdateStrokesForCell(self, (uint64_t)v29, v13 | (v39 << 16) | (v33 << 24));
        }
      }
    }
    uint64_t v21 = (uint64_t)[(TSTEditingState *)[(TSTTableInfo *)[(TSTMasterLayout *)self tableInfo] editingState] editingCellID];
    if ((_WORD)v21 != 0xFFFF
      && (v21 & 0xFF0000) != 0xFF0000
      && ![(TSTMasterLayout *)self dynamicContentDelegate]
      && objc_msgSend(+[TSTConfiguration sharedTableConfiguration](TSTConfiguration, "sharedTableConfiguration"), "supportsContainedTextEditing")&& -[TSDDrawableInfo isInlineWithText](-[TSTMasterLayout tableInfo](self, "tableInfo"), "isInlineWithText")&& (-[TSTEditingState editingCellID](-[TSTTableInfo editingState](-[TSTMasterLayout tableInfo](self, "tableInfo"), "editingState"), "editingCellID") & 0xFFFFFF) == ((unsigned __int16)v16 | (v17 << 16)))
    {
      TSTCellCopy((uint64_t)[(TSTEditingState *)[(TSTTableInfo *)[(TSTMasterLayout *)self tableInfo] editingState] editingCell], (uint64_t)v36);
    }
    int v22 = (v9 << 24) | (v17 << 16);
    if ((_WORD)v15 == 0xFFFF)
    {
      unint64_t v23 = v37;
    }
    else
    {
      unint64_t v23 = v37;
      if ((v15 & 0xFF0000) != 0xFF0000 && HIWORD(v15) && (v15 & 0xFFFF00000000) != 0)
      {
        unint64_t v30 = v30 & 0xFFFFFFFF00000000 | v22 | (unsigned __int16)v16;
        -[TSTMasterLayout p_validateFittingInfoForCellID:inMergeRange:](self, "p_validateFittingInfoForCellID:inMergeRange:");
      }
    }
    uint64_t v9 = v22 | (unsigned __int16)v16;
    unint64_t v37 = v23 & 0xFFFFFFFF00000000 | v14;
    $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v24 = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)-[TSTMasterLayout p_validateFittingInfoForEmptyCellsBetween:andCellID:inRange:](self, "p_validateFittingInfoForEmptyCellsBetween:andCellID:inRange:");
    unint64_t v3 = v3 & 0xFFFFFFFF00000000 | v9;
    [(TSTMasterLayout *)self validateFittingInfoForCell:v36 cellID:v3 mergeRange:v15 setFitting:v32];
    if (v35) {
      double v18 = TSTCellClear((uint64_t)v36);
    }
    int v12 = v39;
    if (v13 != 0xFFFF && v39 != 255)
    {
      unint64_t v4 = v4 & 0xFFFFFFFF00000000 | v9;
      unsigned int v14 = v24;
      double v7 = v36;
      double v36 = v29;
      BOOL v8 = v27;
      unint64_t v15 = v26;
      LODWORD(v9) = v33;
      goto LABEL_11;
    }
    unint64_t v4 = v4 & 0xFFFFFFFF00000000 | v9;
    unsigned int v14 = v24;
    if ((unsigned __int16)(v16 + 1) < a3.var0.var0) {
      char v25 = 1;
    }
    else {
      char v25 = v38;
    }
    if (v25) {
      break;
    }
    LODWORD(v9) = 0;
    LODWORD(v17) = 255;
    LOWORD(v16) = -1;
    unint64_t v15 = 0xFFFFFFLL;
  }
  while (v19 < (unsigned __int16)(a3.var0.var0 + a3.var1.var1 - 1));
  -[TSTMasterLayout p_validateFittingInfoForEmptyCellsBetween:andCellID:inRange:](self, "p_validateFittingInfoForEmptyCellsBetween:andCellID:inRange:", v14, 0xFFFFFFLL, a3, v18, v26);

  TSTMasterLayoutSetStrokesValidForRange(self, *(void *)&a3);
}

- (void)p_validateFittingInfoForEmptyCellsOnSingleRowBetween:(id)a3 andEndCellID:(id)a4
{
  if (![(TSTHiddenRowsColumnsCache *)[(TSTMasterLayout *)self hiddenRowsColumnsCache] isRowHidden:a3.var0])
  {
    unsigned int v7 = [(TSTHiddenRowsColumnsCache *)[(TSTMasterLayout *)self hiddenRowsColumnsCache] nextVisibleColumn:a3.var1];
    if (a4.var1 >= v7)
    {
      unsigned int v8 = v7;
      uint64_t v9 = *(_DWORD *)&a3 & 0xFF00FFFF | (v7 << 16);
      unsigned int v10 = [(TSTMasterLayout *)self tableAreaForCellID:v9];
      [(TSTWidthHeightCache *)self->mWidthHeightCache setFitHeight:v9 forCellID:self->mTableDefaultFontHeightForArea[v10]];
      if ((a4.var0 | (a4.var1 << 16)) != (v9 & 0xFFFFFF))
      {
        unsigned int v11 = [(TSTHiddenRowsColumnsCache *)[(TSTMasterLayout *)self hiddenRowsColumnsCache] previousVisibleColumn:a4.var1];
        if (v8 <= v11)
        {
          uint64_t v12 = *(_DWORD *)&a4 & 0xFF000000 | (v11 << 16) | a4.var0;
          unsigned int v13 = [(TSTMasterLayout *)self tableAreaForCellID:v12];
          if (v10 != v13)
          {
            double v14 = self->mTableDefaultFontHeightForArea[v13];
            mWidthHeightCache = self->mWidthHeightCache;
            [(TSTWidthHeightCache *)mWidthHeightCache setFitHeight:v12 forCellID:v14];
          }
        }
      }
    }
  }
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)p_validateFittingInfoForEmptyCellsBetween:(id)var0 andCellID:(id)a4 inRange:(id)a5
{
  unint64_t v5 = (unint64_t)a5;
  unint64_t v6 = *(void *)&a4.var0;
  if (var0.var0 == 0xFFFF || (*(void *)&var0.var0 & 0xFF0000) == 0xFF0000)
  {
    unint64_t v8 = *(unint64_t *)&a5 >> 16;
    $2F2D2FE54C0B9D2AA4EBD8788136C7D0 var0 = a5.var0;
    unint64_t v9 = (unint64_t)a5;
  }
  else if (var0.var1 >= (LOBYTE(a5.var1.var0) + a5.var0.var1 - 1))
  {
    if (var0.var0 >= (unsigned __int16)(a5.var0.var0 + a5.var1.var1 - 1))
    {
      LODWORD(v11) = 0;
      LOBYTE(v10) = -1;
      LOWORD(v6) = -1;
      return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)((v10 << 16) | (v11 << 24) | (unsigned __int16)v6);
    }
    unint64_t v8 = *(unint64_t *)&a5 >> 16;
    unint64_t v9 = (*(_DWORD *)&var0 + 1);
  }
  else
  {
    LOBYTE(v8) = var0.var1 + 1;
    unint64_t v9 = *(void *)&var0.var0;
  }
  uint64_t v10 = *(void *)&a4.var0 >> 16;
  uint64_t v11 = *(void *)&a4.var0 >> 24;
  if (a4.var0 == 0xFFFF || (*(void *)&a4.var0 & 0xFF0000) == 0xFF0000)
  {
    LODWORD(v14) = 0;
    unsigned __int16 v13 = a5.var0.var0 + a5.var1.var1 - 1;
    unsigned int v12 = (*(_DWORD *)&a5.var0 + (*(_DWORD *)&a5.var0.var1 & 0xFF0000u) + 16711680) >> 16;
  }
  else
  {
    if (a4.var1 <= a5.var0.var1)
    {
      if (a4.var0 <= a5.var0.var0) {
        return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)((v10 << 16) | (v11 << 24) | (unsigned __int16)v6);
      }
      LOBYTE(v12) = LOBYTE(a5.var1.var0) + a5.var0.var1 - 1;
      unsigned __int16 v13 = a4.var0 - 1;
    }
    else
    {
      LOBYTE(v12) = a4.var1 - 1;
      unsigned __int16 v13 = a4.var0;
    }
    uint64_t v14 = *(void *)&a4.var0 >> 24;
  }
  unsigned int v15 = v13;
  if (v13 > (unsigned __int16)v9
    || v13 == (unsigned __int16)v9 && v12 >= v8)
  {
    unsigned int v16 = *(_DWORD *)&var0 & 0xFF000000;
    uint64_t v17 = *(_DWORD *)&var0 & 0xFF000000 | (v8 << 16) | (unsigned __int16)v9;
    if (v15 == (unsigned __int16)v9)
    {
      [(TSTMasterLayout *)self p_validateFittingInfoForEmptyCellsOnSingleRowBetween:v17 andEndCellID:(v12 << 16) | (v14 << 24) | v15];
    }
    else
    {
      int v18 = (*(_DWORD *)&a5.var0 + (*(_DWORD *)&a5.var0.var1 & 0xFF0000) + 16711680) & 0xFF0000;
      [(TSTMasterLayout *)self p_validateFittingInfoForEmptyCellsOnSingleRowBetween:v17 andEndCellID:v18 | (unsigned __int16)v9 | v16];
      int v19 = v5 & 0xFF0000;
      [(TSTMasterLayout *)self p_validateFittingInfoForEmptyCellsOnSingleRowBetween:v5 & 0xFF0000 | v15 & 0xFFFFFF | (v14 << 24) andEndCellID:(v14 << 24) | (v12 << 16) | v15];
      if (v15 > (unsigned __int16)(v9 + 1))
      {
        unsigned int v20 = (unsigned __int16)(v9 + 1);
        do
        {
          unint64_t v9 = v9 & 0xFFFFFFFF00000000 | v19 | v20;
          unint64_t v5 = v5 & 0xFFFFFFFF00000000 | v18 | v20;
          [(TSTMasterLayout *)self p_validateFittingInfoForEmptyCellsOnSingleRowBetween:v9 andEndCellID:v5];
          ++v20;
        }
        while (v15 != (unsigned __int16)v20);
      }
      uint64_t v10 = v6 >> 16;
    }
  }
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)((v10 << 16) | (v11 << 24) | (unsigned __int16)v6);
}

- (void)p_validateFittingInfoForCellID:(id)a3 inMergeRange:(id)a4
{
  unsigned __int8 var1 = a3.var1;
  if (a3.var1 == a4.var0.var1)
  {
    double v7 = self->mTableDefaultFontHeightForArea[[(TSTMasterLayout *)self tableAreaForCellID:*(_DWORD *)&a4.var0 & 0xFF00FFFF | (a3.var1 << 16)]];
    mWidthHeightCache = self->mWidthHeightCache;
    [(TSTWidthHeightCache *)mWidthHeightCache setFitHeight:*(_DWORD *)&a3 & 0xFF00FFFF | (var1 << 16) forCellID:v7];
  }
}

- (id)validateFittingInfoForChangeDescriptors:(id)a3 rowsNeedingFittingInfo:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  unint64_t v5 = [(TSTMasterLayout *)self tableModel];
  uint64_t v34 = 0;
  BOOL v35 = &v34;
  uint64_t v36 = 0x3052000000;
  unint64_t v37 = __Block_byref_object_copy__29;
  char v38 = __Block_byref_object_dispose__29;
  uint64_t v39 = 0;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(a3);
        }
        unint64_t v9 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        int v10 = [v9 changeDescriptor];
        uint64_t v11 = (void *)[v9 cellRegion];
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __82__TSTMasterLayout_validateFittingInfoForChangeDescriptors_rowsNeedingFittingInfo___block_invoke;
        v28[3] = &unk_2646B3948;
        int v29 = v10;
        v28[4] = self;
        v28[5] = v5;
        v28[6] = &v34;
        [v11 enumerateCellRangesUsingBlock:v28];
        unsigned int v12 = (void *)[v9 expandedRegion];
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __82__TSTMasterLayout_validateFittingInfoForChangeDescriptors_rowsNeedingFittingInfo___block_invoke_2;
        v26[3] = &unk_2646B3970;
        int v27 = v10;
        v26[4] = &v34;
        [v12 enumerateCellRangesUsingBlock:v26];
      }
      uint64_t v6 = [a3 countByEnumeratingWithState:&v30 objects:v40 count:16];
    }
    while (v6);
  }
  uint64_t TableNumberOfColumns = TSTMasterLayoutGetTableNumberOfColumns((uint64_t)self);
  uint64_t TableNumberOfRows = TSTMasterLayoutGetTableNumberOfRows((uint64_t)self);
  unsigned int v15 = (void *)[(id)v35[5] regionByIntersectingRange:(TableNumberOfColumns << 32) | (TableNumberOfRows << 48)];
  v35[5] = (uint64_t)v15;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __82__TSTMasterLayout_validateFittingInfoForChangeDescriptors_rowsNeedingFittingInfo___block_invoke_3;
  v25[3] = &unk_2646B34E0;
  v25[4] = self;
  [v15 enumerateColumnRangesUsingBlock:v25];
  unsigned int v16 = (void *)v35[5];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __82__TSTMasterLayout_validateFittingInfoForChangeDescriptors_rowsNeedingFittingInfo___block_invoke_4;
  v24[3] = &unk_2646B3508;
  v24[4] = self;
  [v16 enumerateCellRangesUsingBlock:v24];
  if (a4)
  {
    objc_msgSend(a4, "tsu_intersectionWithIndexSet:", -[TSTHiddenRowsColumnsCache visibleRowIndices](-[TSTMasterLayout hiddenRowsColumnsCache](self, "hiddenRowsColumnsCache"), "visibleRowIndices"));
    if ([a4 firstIndex] != 0x7FFFFFFFFFFFFFFFLL)
    {
      unsigned __int8 v17 = [(TSTHiddenRowsColumnsCache *)[(TSTMasterLayout *)self hiddenRowsColumnsCache] nextVisibleColumn:0];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __82__TSTMasterLayout_validateFittingInfoForChangeDescriptors_rowsNeedingFittingInfo___block_invoke_5;
      v22[3] = &unk_2646B3998;
      v22[4] = self;
      unsigned __int8 v23 = v17;
      [a4 enumerateIndexesUsingBlock:v22];
    }
  }
  int v18 = (void *)v35[5];
  _Block_object_dispose(&v34, 8);
  return v18;
}

id __82__TSTMasterLayout_validateFittingInfoForChangeDescriptors_rowsNeedingFittingInfo___block_invoke(id result, unint64_t a2)
{
  unint64_t v2 = a2;
  id v3 = result;
  int v4 = *((_DWORD *)result + 14);
  if (v4 > 18)
  {
    if (v4 <= 23)
    {
      if ((v4 - 19) >= 2)
      {
        if (v4 != 22)
        {
          if (v4 == 23) {
            return result;
          }
          goto LABEL_27;
        }
        goto LABEL_18;
      }
LABEL_22:
      unsigned int v6 = [*((id *)result + 5) numberOfColumns];
      if (v6 >= 0xFF) {
        uint64_t v7 = 255;
      }
      else {
        uint64_t v7 = v6;
      }
      a2 = v2 & 0xFFFF00000000FFFFLL | (v7 << 32);
      uint64_t v5 = *((void *)v3 + 5);
      goto LABEL_26;
    }
    if (v4 > 32)
    {
      if (v4 != 33)
      {
        if (v4 == 40)
        {
          objc_msgSend((id)objc_msgSend(*((id *)result + 4), "dupContentCache"), "removeAllObjects");
          BOOL result = (id)objc_msgSend((id)objc_msgSend(*((id *)v3 + 4), "cellIDToWPColumnCache"), "removeAllObjects");
        }
        goto LABEL_27;
      }
      goto LABEL_22;
    }
    if (v4 != 24)
    {
      if (v4 != 29) {
        goto LABEL_27;
      }
      goto LABEL_22;
    }
    goto LABEL_18;
  }
  if (v4 > 5)
  {
    if ((v4 - 6) < 2) {
      return result;
    }
    if ((v4 - 13) >= 2) {
      goto LABEL_27;
    }
    goto LABEL_22;
  }
  switch(v4)
  {
    case 2:
      goto LABEL_18;
    case 3:
      return result;
    case 4:
LABEL_18:
      uint64_t v5 = *((void *)result + 5);
LABEL_26:
      BOOL result = (id)TSTTableExpandCellRangeToCoverMergedCells(v5, a2);
      unint64_t v2 = (unint64_t)result;
      break;
  }
LABEL_27:
  if ((_WORD)v2 != 0xFFFF)
  {
    BOOL v8 = (v2 & 0xFF0000) == 0xFF0000 || HIWORD(v2) == 0;
    if (!v8 && (v2 & 0xFFFF00000000) != 0)
    {
      int v10 = *(void **)(*(void *)(*((void *)v3 + 6) + 8) + 40);
      if (v10) {
        BOOL result = (id)[v10 regionByAddingRange:v2];
      }
      else {
        BOOL result = +[TSTCellRegion regionFromRange:v2];
      }
      *(void *)(*(void *)(*((void *)v3 + 6) + 8) + 40) = result;
    }
  }
  return result;
}

_DWORD *__82__TSTMasterLayout_validateFittingInfoForChangeDescriptors_rowsNeedingFittingInfo___block_invoke_2(_DWORD *result, unint64_t a2)
{
  int v2 = result[10];
  BOOL v4 = v2 != 21 && v2 != 1 || (unsigned __int16)~(_WORD)a2 == 0;
  if (!v4 && (a2 & 0xFF0000) != 0xFF0000 && HIWORD(a2) && (a2 & 0xFFFF00000000) != 0)
  {
    uint64_t v5 = result;
    unsigned int v6 = *(void **)(*(void *)(*((void *)result + 4) + 8) + 40);
    if (v6) {
      BOOL result = (_DWORD *)[v6 regionByAddingRange:a2];
    }
    else {
      BOOL result = +[TSTCellRegion regionFromRange:a2];
    }
    *(void *)(*(void *)(*((void *)v5 + 4) + 8) + 40) = result;
  }
  return result;
}

uint64_t __82__TSTMasterLayout_validateFittingInfoForChangeDescriptors_rowsNeedingFittingInfo___block_invoke_3(uint64_t a1, unsigned __int8 a2, char a3)
{
  uint64_t v5 = (void *)[*(id *)(a1 + 32) widthHeightCache];

  return [v5 resetColWidthsStartingWith:a2 andEndingWith:(a2 + a3 - 1)];
}

uint64_t __82__TSTMasterLayout_validateFittingInfoForChangeDescriptors_rowsNeedingFittingInfo___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) validateFittingInfoWithCellRange:a2];
}

uint64_t __82__TSTMasterLayout_validateFittingInfoForChangeDescriptors_rowsNeedingFittingInfo___block_invoke_5(uint64_t a1, unsigned __int16 a2)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 56) getFitHeightForRow:a2];
  if (v5 <= 0.0)
  {
    unint64_t v6 = a2 | ((unint64_t)*(unsigned __int8 *)(a1 + 40) << 16) | 0x1000100000000;
    uint64_t v7 = *(void **)(a1 + 32);
    return [v7 validateFittingInfoWithCellRange:v6];
  }
  return result;
}

- (void)validateFittingWidthsForRegion:(id)a3
{
  double v5 = [(TSTMasterLayout *)self tableModel];
  unsigned int TableNumberOfRows = TSTMasterLayoutGetTableNumberOfRows((uint64_t)self);
  if (![(TSTMasterLayout *)self inDynamicLayoutMode]
    && TableNumberOfRows <= 0x200
    && ([a3 isEmpty] & 1) == 0)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __50__TSTMasterLayout_validateFittingWidthsForRegion___block_invoke;
    v7[3] = &unk_2646B39C0;
    __int16 v8 = TableNumberOfRows;
    v7[4] = self;
    v7[5] = v5;
    [a3 enumerateColumnsUsingBlock:v7];
  }
}

void __50__TSTMasterLayout_validateFittingWidthsForRegion___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "widthHeightCache"), "getFitWidthForCol:", a2);
  if (v6 <= 0.0)
  {
    BOOL v62 = 0;
    uint64_t v7 = [[TSTLayoutCellIterator alloc] initWithMasterLayout:*(void *)(a1 + 32) range:((unint64_t)a2 << 16) | ((unint64_t)*(unsigned __int16 *)(a1 + 48) << 48) | 0x100000000];
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "widthHeightCache"), "resetColWidthsStartingWith:andEndingWith:", a2, a2);
    if (TSTLayoutCellIteratorGetNextCell((uint64_t)v7, &v63))
    {
      __int16 v8 = (double *)MEMORY[0x263F001B0];
      do
      {
        int v9 = TSTLayoutCellIteratorValueTypeOfCell((uint64_t)&v63);
        if (v64)
        {
          if (!v9 || v64->mPrivate.mCellFormats.mCurrentCellFormat.mFormatType == 267) {
            continue;
          }
          int v10 = *((unsigned __int8 *)&v64->mPrivate + 1) << 8;
          BOOL v12 = v10 == 768 || v10 == 2304;
        }
        else
        {
          if (!v9) {
            continue;
          }
          BOOL v12 = 0;
        }
        unsigned int v61 = 1;
        uint64_t v60 = 0;
        unint64_t v3 = v3 & 0xFFFFFFFF00000000 | HIDWORD(v63);
        TSTCellTextProperties((uint64_t)v64, *(void **)(a1 + 40), v3, &v62, 0, &v61, &v60);
        [*(id *)(a1 + 32) edgeInsetsFromPadding:v60];
        double v14 = v13;
        double v16 = v15;
        double v18 = v17;
        double v20 = v19;
        uint64_t v21 = *(void **)(a1 + 32);
        if (v21[73])
        {
          int v22 = objc_msgSend((id)objc_msgSend(v21, "tableInfo"), "editingCellID");
          if (((HIDWORD(v63) ^ v22) & 0xFFFFFF) == 0) {
            BOOL v62 = 1;
          }
        }
        BOOL v23 = v62 && v12;
        BOOL v62 = v23;
        if (!v64) {
          goto LABEL_30;
        }
        int v24 = *((unsigned __int8 *)&v64->mPrivate + 1);
        if (v24 == 6)
        {
          if (v64->mPrivate.mCellFormats.mCurrentCellFormat.mFormatType == 263)
          {
            uint64_t v26 = 0;
            int v27 = 1;
LABEL_32:
            double v28 = *v8;
            if (TSTCellFormatUsesAccountingStyle(v64) && v26 && [(TSWPStorage *)v26 length])
            {
              uint64_t v29 = [(TSWPStorage *)v26 stringByReplacingOccurrencesOfString:@"\t" withString:&stru_26D688A48];
              unint64_t v58 = v58 & 0xFFFFFFFF00000000 | HIDWORD(v63);
              long long v30 = objc_msgSend(*(id *)(a1 + 32), "newTextEngineForCell:atCellID:", v64);
              long long v31 = [TSTTextEngineDelegate alloc];
              long long v32 = -[TSTTextEngineDelegate initWithPadding:verticalAlignment:](v31, "initWithPadding:verticalAlignment:", v61, v14, v16, v18, v20);
              [v30 setDelegate:v32];
              long long v33 = objc_msgSend(v30, "layoutText:kind:minSize:maxSize:anchor:flags:", v29, 5, 15, 8.0, 8.0, 4294967300.0, 4294967300.0, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
              [v30 setDelegate:0];

              [v33 range];
              if (v34)
              {
                [v33 typographicBoundsForCell];
                double v28 = v35;
                [v33 frameBounds];
              }
              goto LABEL_62;
            }
            unint64_t v36 = v65;
            if ((_WORD)v65 == 0xFFFF || (v65 & 0xFF0000) == 0xFF0000 || !HIWORD(v65) || (v65 & 0xFFFF00000000) == 0) {
              unint64_t v36 = HIDWORD(v63) | 0x1000100000000;
            }
            double v37 = TSTMasterLayoutContentWidthForCellRange(*(TSTMasterLayout **)(a1 + 32), v36, 0);
            char v38 = (void *)[*(id *)(a1 + 32) cellIDToWPColumnCache];
            HIDWORD(v39) = HIDWORD(v63);
            LODWORD(v39) = HIDWORD(v63);
            double v40 = objc_msgSend(v38, "objectForKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", (v39 >> 16) & 0xFFFF00FF));
            if (v40)
            {
              uint64_t v41 = v40;
              [v40 typographicBoundsForCell];
              double v28 = v42;
              [v41 frameBounds];
              if (v28 == v37)
              {
LABEL_62:
                if (v27) {
                  double v55 = 30.0;
                }
                else {
                  double v55 = v28;
                }
                double v56 = v16 + v20 + v55;
                uint64_t v57 = (void *)[*(id *)(a1 + 32) widthHeightCache];
                unint64_t v2 = v2 & 0xFFFFFFFF00000000 | HIDWORD(v63);
                [v57 setFitWidth:v2 forCellID:v56];
                continue;
              }
              unint64_t v43 = (void *)[*(id *)(a1 + 32) cellIDToWPColumnCache];
              HIDWORD(v44) = HIDWORD(v63);
              LODWORD(v44) = HIDWORD(v63);
              objc_msgSend(v43, "removeObjectForKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", (v44 >> 16) & 0xFFFF00FF));
            }
            char v45 = objc_alloc_init(TSTCellStateForLayout);
            unint64_t v46 = v59 & 0xFFFFFFFF00000000 | HIDWORD(v63);
            [(TSTCellStateForLayout *)v45 setModelCellID:v46];
            [(TSTCellStateForLayout *)v45 setCell:v64];
            [(TSTCellStateForLayout *)v45 setCellPropsRowHeight:0];
            [(TSTCellStateForLayout *)v45 setCellWraps:v62];
            -[TSTCellStateForLayout setPaddingInsets:](v45, "setPaddingInsets:", v14, v16, v18, v20);
            [(TSTCellStateForLayout *)v45 setVerticalAlignment:v61];
            double v47 = 8.0;
            if (!v62) {
              double v47 = v37;
            }
            -[TSTCellStateForLayout setMinSize:](v45, "setMinSize:", v47, 8.0);
            if (v62) {
              double v48 = v37;
            }
            else {
              double v48 = 4294967300.0;
            }
            -[TSTCellStateForLayout setMaxSize:](v45, "setMaxSize:", v48, 4294967300.0);
            [(TSTCellStateForLayout *)v45 setForDrawing:1];
            [(TSTCellStateForLayout *)v45 setMergedRange:v65];
            -[TSTCellStateForLayout setInDynamicLayout:](v45, "setInDynamicLayout:", [*(id *)(a1 + 32) inDynamicLayoutMode]);
            [(TSTCellStateForLayout *)v45 setCellContents:v26];
            objc_opt_class();
            unint64_t v49 = (void *)TSUDynamicCast();
            if (v49)
            {
              if ([v49 hasAttachmentsThatChangeWithPageNumberOrPageCount]) {
                uint64_t v50 = 0;
              }
              else {
                uint64_t v50 = 15;
              }
            }
            else
            {
              uint64_t v50 = 15;
            }
            unint64_t v59 = v46;
            [(TSTCellStateForLayout *)v45 setLayoutCacheFlags:v50];
            [*(id *)(a1 + 32) measureTextForLayoutState:v45];
            [(TSWPColumn *)[(TSTCellStateForLayout *)v45 wpColumn] range];
            if (v51)
            {
              int v52 = [(TSTCellStateForLayout *)v45 wpColumn];
              [(TSWPColumn *)v52 typographicBoundsForCell];
              double v28 = v53;
              [(TSWPColumn *)v52 frameBounds];
            }
            else
            {
              double v28 = *v8;
            }
            uint64_t v54 = [(TSTCellStateForLayout *)v45 keyVal];
            if ((v50 & 2) != 0 && v54) {
              objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "dupContentCache"), "setObject:forKey:", -[TSTCellStateForLayout wpColumn](v45, "wpColumn"), -[TSTCellStateForLayout keyVal](v45, "keyVal"));
            }

            goto LABEL_62;
          }
LABEL_30:
          char v25 = (TSWPStorage *)NSStringFromNativeTSTCell((__CFString *)v64);
LABEL_31:
          uint64_t v26 = v25;
          int v27 = 0;
          goto LABEL_32;
        }
        if (v24 != 8)
        {
          if (v24 != 9) {
            goto LABEL_30;
          }
          char v25 = [(TSTRichTextPayload *)v64->mPrivate.mRichTextPayload storage];
          goto LABEL_31;
        }
      }
      while (TSTLayoutCellIteratorGetNextCell((uint64_t)v7, &v63));
    }
  }
}

- (id)validateCellForDrawing:(id)a3 cell:(id)a4 contents:(id)a5 wrap:(BOOL)a6 verticalAlignment:(unsigned int)a7 padding:(id)a8 layoutCacheFlags:(int)a9 pageNumber:(unint64_t)a10 pageCount:(unint64_t)a11
{
  BOOL v78 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v17 = [a5 length] == 0;
  }
  else {
    BOOL v17 = a5 == 0;
  }
  int v18 = !v17;
  double v19 = [(TSTMasterLayout *)self tableInfo];
  uint64_t v20 = [(TSTTableInfo *)v19 tableModel];
  if (!v18) {
    return 0;
  }
  uint64_t v21 = v20;
  id v73 = a4;
  id v74 = a8;
  id v75 = a5;
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v22 = a3;
  unint64_t v23 = TSTTableMergeRangeAtCellID(v20, *(_DWORD *)&a3);
  unint64_t v24 = v23;
  unint64_t v25 = HIWORD(v23);
  uint64_t v76 = v23;
  BOOL v26 = (~v23 & 0xFF0000) != 0 && (_WORD)v23 != 0xFFFF;
  unsigned int v77 = a7;
  v70 = v19;
  uint64_t v72 = a3;
  unsigned __int16 v27 = 1;
  if (v26 && v25)
  {
    uint64_t v28 = a3;
    LOWORD(v29) = 1;
    if ((v23 & 0xFFFF00000000) != 0)
    {
      unint64_t v29 = HIDWORD(v23);
      if (((v23 ^ *(_DWORD *)&a3) & 0xFFFFFFLL) != 0)
      {
        long long v30 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", *(unsigned int *)&a3);
        uint64_t v31 = [NSString stringWithUTF8String:"-[TSTMasterLayout validateCellForDrawing:cell:contents:wrap:verticalAlignment:padding:layoutCacheFlags:pageNumber:pageCount:]"];
        objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTMasterLayout.mm"), 5372, @"Trying to draw merged cell other than origin.");
      }
      if (v25)
      {
        int v32 = v24;
        do
        {
          char v79 = 0;
          TSTTableHeightOfRow(v21, (unsigned __int16)v32++, &v79);
        }
        while ((unsigned __int16)v24 + v25 > (unsigned __int16)v32);
        uint64_t v28 = v76;
        unsigned __int16 v27 = v25;
      }
      else
      {
        unsigned __int16 v27 = 0;
        uint64_t v28 = v76;
      }
    }
  }
  else
  {
    uint64_t v28 = a3;
    LOWORD(v29) = 1;
  }
  unint64_t v34 = (unsigned __int16)v29 | (v27 << 16);
  LODWORD(v35) = -[TSTMasterLayout layoutCellIDForModelCellID:](self, "layoutCellIDForModelCellID:", v28, v70);
  if (!v26 || !v25)
  {
    $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v36 = v22;
    uint64_t v37 = a9;
    goto LABEL_43;
  }
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v36 = v22;
  uint64_t v37 = a9;
  if ((v24 & 0xFFFF00000000) == 0) {
    goto LABEL_43;
  }
  int TableNumberOfColumns = TSTMasterLayoutGetTableNumberOfColumns((uint64_t)self);
  int TableNumberOfRows = TSTMasterLayoutGetTableNumberOfRows((uint64_t)self);
  unint64_t v40 = 0;
  uint64_t v41 = 16711680;
  uint64_t v42 = 0xFFFFLL;
  if (!TableNumberOfColumns) {
    goto LABEL_41;
  }
  unint64_t v43 = 0;
  if (!TableNumberOfRows) {
    goto LABEL_42;
  }
  unint64_t v40 = 0;
  uint64_t v41 = 16711680;
  uint64_t v42 = 0xFFFFLL;
  if ((_WORD)v35 == 0xFFFF)
  {
LABEL_41:
    unint64_t v43 = 0;
    goto LABEL_42;
  }
  unint64_t v43 = 0;
  if ((v35 & 0xFF0000) != 0xFF0000)
  {
    unint64_t v40 = 0;
    uint64_t v41 = 16711680;
    uint64_t v42 = 0xFFFFLL;
    if ((_WORD)v29)
    {
      unint64_t v43 = 0;
      if (v34 >= 0x10000)
      {
        uint64_t v42 = 0;
        if ((TableNumberOfColumns - 1) >= (v29 + BYTE2(v35) - 1)) {
          unsigned int v44 = (v29 + BYTE2(v35) - 1);
        }
        else {
          unsigned int v44 = (TableNumberOfColumns - 1);
        }
        if ((unsigned __int16)(TableNumberOfRows - 1) >= (unsigned __int16)(v27 + v35 - 1)) {
          unsigned int v45 = (unsigned __int16)(v27 + v35 - 1);
        }
        else {
          unsigned int v45 = (unsigned __int16)(TableNumberOfRows - 1);
        }
        if (v45 < (unsigned __int16)v35)
        {
          uint64_t v41 = 0;
          unint64_t v40 = 0;
          unint64_t v43 = 0;
        }
        else
        {
          uint64_t v41 = 0;
          unint64_t v40 = 0;
          unint64_t v43 = 0;
          if (v44 >= BYTE2(v35))
          {
            uint64_t v42 = (unsigned __int16)v35;
            unint64_t v43 = ((unint64_t)(v45 - v35) << 48) + 0x1000000000000;
            unint64_t v40 = (unint64_t)(unsigned __int16)(v44 - BYTE2(v35) + 1) << 32;
            uint64_t v41 = BYTE2(v35) << 16;
          }
        }
      }
      goto LABEL_42;
    }
    goto LABEL_41;
  }
LABEL_42:
  unint64_t v35 = v41 | v43 | v42 | v40;
  unint64_t v34 = HIDWORD(v35);
LABEL_43:
  double v46 = TSTMasterLayoutContentWidthForCellRange(self, v35 | (v34 << 32), 0);
  double v47 = TSTMasterLayoutContentHeightForCellRange(self, v35 | (v34 << 32), 0);
  if (v78) {
    double v48 = 8.0;
  }
  else {
    double v48 = v46;
  }
  if (v78) {
    double v49 = v46;
  }
  else {
    double v49 = 4294967300.0;
  }
  if (v77) {
    double v50 = v47;
  }
  else {
    double v50 = 4294967300.0;
  }
  if (v77) {
    double v51 = v47;
  }
  else {
    double v51 = 8.0;
  }
  if ((v37 & 4) == 0)
  {
    long long v33 = 0;
LABEL_60:
    int v59 = 1;
    goto LABEL_61;
  }
  int v52 = [(TSTMasterLayout *)self cellIDToWPColumnCache];
  HIDWORD(v53) = v36;
  LODWORD(v53) = v36;
  uint64_t v54 = (v53 >> 16) & 0xFFFF00FF;
  id v55 = -[TSUConcurrentCache objectForKey:](v52, "objectForKey:", [NSNumber numberWithUnsignedInt:v54]);
  long long v33 = v55;
  if (!v55) {
    goto LABEL_60;
  }
  [v55 typographicBoundsForCell];
  double v57 = v56;
  [v33 frameBounds];
  if (v57 != v46)
  {
    unint64_t v58 = [(TSTMasterLayout *)self cellIDToWPColumnCache];
    -[TSUConcurrentCache removeObjectForKey:](v58, "removeObjectForKey:", [NSNumber numberWithUnsignedInt:v54]);
    goto LABEL_60;
  }
  int v59 = 0;
  if (![(TSTMasterLayout *)self dynamicRepResize]) {
    goto LABEL_72;
  }
LABEL_61:
  if (TSTTableNumberOfPopulatedCells(v21) > 0x19) {
    return v33;
  }
  if (v48 < 0.0) {
    double v48 = 0.0;
  }
  if (v51 < 0.0) {
    double v51 = 0.0;
  }
  if (v49 < 0.0) {
    double v49 = 0.0;
  }
  if (v50 < 0.0)
  {
    double v50 = 0.0;
    if ((v59 & 1) == 0) {
      return v33;
    }
  }
  else
  {
LABEL_72:
    if (!v59) {
      return v33;
    }
  }
  unint64_t v60 = v24 & 0xFFFFFFFF00000000;
  unsigned int v61 = objc_msgSend((id)objc_msgSend(v71, "masterLayout"), "layoutCellIDForModelCellID:", v76);
  BOOL v62 = objc_alloc_init(TSTCellStateForLayout);
  [(TSTCellStateForLayout *)v62 setModelCellID:v72];
  [(TSTCellStateForLayout *)v62 setCell:v73];
  [(TSTCellStateForLayout *)v62 setCellPropsRowHeight:0];
  [(TSTCellStateForLayout *)v62 setCellWraps:v78];
  [(TSTMasterLayout *)self edgeInsetsFromPadding:v74];
  -[TSTCellStateForLayout setPaddingInsets:](v62, "setPaddingInsets:");
  [(TSTCellStateForLayout *)v62 setVerticalAlignment:v77];
  -[TSTCellStateForLayout setMinSize:](v62, "setMinSize:", v48, v51);
  -[TSTCellStateForLayout setMaxSize:](v62, "setMaxSize:", v49, v50);
  [(TSTCellStateForLayout *)v62 setForDrawing:1];
  [(TSTCellStateForLayout *)v62 setMergedRange:v60 | v61];
  [(TSTCellStateForLayout *)v62 setInDynamicLayout:[(TSTMasterLayout *)self inDynamicLayoutMode]];
  [(TSTCellStateForLayout *)v62 setCellContents:v75];
  objc_opt_class();
  uint64_t v63 = (void *)TSUDynamicCast();
  if (v63)
  {
    if ([v63 hasAttachmentsThatChangeWithPageNumberOrPageCount]) {
      uint64_t v37 = 0;
    }
    else {
      uint64_t v37 = v37;
    }
  }
  [(TSTCellStateForLayout *)v62 setLayoutCacheFlags:v37];
  [(TSTCellStateForLayout *)v62 setPageNumber:a10];
  [(TSTCellStateForLayout *)v62 setPageCount:a11];
  [(TSTMasterLayout *)self measureTextForLayoutState:v62];
  uint64_t v64 = [(TSTCellStateForLayout *)v62 keyVal];
  if ((v37 & 2) != 0 && v64) {
    [(TSUConcurrentCache *)[(TSTMasterLayout *)self dupContentCache] setObject:[(TSTCellStateForLayout *)v62 wpColumn] forKey:[(TSTCellStateForLayout *)v62 keyVal]];
  }
  if ([(TSTCellStateForLayout *)v62 layoutCacheFlags])
  {
    unint64_t v65 = [(TSTMasterLayout *)self cellIDToWPColumnCache];
    uint64_t v66 = [(TSTCellStateForLayout *)v62 wpColumn];
    HIDWORD(v67) = v36;
    LODWORD(v67) = v36;
    -[TSUConcurrentCache setObject:forKey:](v65, "setObject:forKey:", v66, [NSNumber numberWithUnsignedInt:(v67 >> 16) & 0xFFFF00FF]);
  }
  v68 = v62;
  return [(TSTCellStateForLayout *)v62 wpColumn];
}

- (void)queueCellForValidation:(id)a3 cell:(id)a4 mergeRange:(id)a5 wrap:(BOOL)a6 verticalAlignment:(unsigned int)a7 padding:(id)a8 prop:(BOOL)a9 layoutCacheFlags:(int)a10
{
  BOOL v11 = a6;
  uint64_t v15 = a10;
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v36 = objc_alloc_init(TSTCellStateForLayout);
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v16 = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)[(TSTMasterLayout *)self modelCellIDForLayoutCellID:*(_DWORD *)&a3.var0];
  [(TSTCellStateForLayout *)v36 setModelCellID:*(unsigned int *)&v16];
  [(TSTCellStateForLayout *)v36 setCell:a4];
  uint64_t v17 = objc_msgSend(-[TSTCellStateForLayout cellContents](v36, "cellContents"), "length");
  int v18 = [(TSTTableInfo *)[(TSTMasterLayout *)self tableInfo] tableModel];
  if (v17)
  {
    objc_opt_class();
    [(TSTCellStateForLayout *)v36 cellContents];
    double v19 = (void *)TSUDynamicCast();
    if (v19)
    {
      if ([v19 hasAttachmentsThatChangeWithPageNumberOrPageCount]) {
        uint64_t v15 = 0;
      }
      else {
        uint64_t v15 = a10;
      }
    }
  }
  else
  {
    uint64_t v15 = 10;
  }
  double v20 = TSTMasterLayoutContentWidthForCellRange(self, *(void *)&a3, 0);
  if (v11) {
    double v21 = 8.0;
  }
  else {
    double v21 = v20;
  }
  if (v11) {
    double v22 = v20;
  }
  else {
    double v22 = 4294967300.0;
  }
  if ([(TSTMasterLayout *)self dynamicRepResize])
  {
    unsigned int v23 = TSTTableNumberOfPopulatedCells((uint64_t)v18);
    double v24 = 0.0;
    if (v21 >= 0.0) {
      double v25 = v21;
    }
    else {
      double v25 = 0.0;
    }
    if (v22 >= 0.0) {
      double v24 = v22;
    }
    if (v23 <= 0x19)
    {
      double v22 = v24;
      double v21 = v25;
    }
  }
  BOOL v26 = [(TSTMasterLayout *)self cellIDToWPColumnCache];
  HIDWORD(v27) = v16;
  LODWORD(v27) = v16;
  uint64_t v28 = (v27 >> 16) & 0xFFFF00FF;
  id v29 = -[TSUConcurrentCache objectForKey:](v26, "objectForKey:", [NSNumber numberWithUnsignedInt:v28]);
  if ((![(TSTMasterLayout *)self containedTextEditor]
     || (([(TSTTableInfo *)[(TSTMasterLayout *)self tableInfo] editingCellID] ^ *(_DWORD *)&a3.var0) & 0xFFFFFFLL) != 0)
    && v29)
  {
    [v29 typographicBoundsForCell];
    double v31 = v30;
    [v29 frameBounds];
    if (v31 == v20) {
      goto LABEL_28;
    }
    int v32 = [(TSTMasterLayout *)self cellIDToWPColumnCache];
    -[TSUConcurrentCache removeObjectForKey:](v32, "removeObjectForKey:", [NSNumber numberWithUnsignedInt:v28]);
  }
  [(TSTCellStateForLayout *)v36 setCellPropsRowHeight:a9];
  [(TSTCellStateForLayout *)v36 setCellWraps:v11];
  [(TSTMasterLayout *)self edgeInsetsFromPadding:a8];
  -[TSTCellStateForLayout setPaddingInsets:](v36, "setPaddingInsets:");
  [(TSTCellStateForLayout *)v36 setVerticalAlignment:a7];
  -[TSTCellStateForLayout setMinSize:](v36, "setMinSize:", v21, 8.0);
  -[TSTCellStateForLayout setMaxSize:](v36, "setMaxSize:", v22, 4294967300.0);
  [(TSTCellStateForLayout *)v36 setMergedRange:a5];
  [(TSTCellStateForLayout *)v36 setLayoutCacheFlags:v15];
  [(NSMutableArray *)[(TSTLayoutTask *)self->mCurrentLayoutTask cellStatesToLayout] addObject:v36];
  unint64_t v33 = [(NSMutableArray *)[(TSTLayoutTask *)self->mCurrentLayoutTask cellStatesToLayout] count];
  if (v33 >= [(TSTMasterLayout *)self numCellsPerTask])
  {
    [(TSTMasterLayout *)self processLayoutTask:self->mCurrentLayoutTask];

    self->mCurrentLayoutTask = 0;
    self->mCurrentLayoutTask = [[TSTLayoutTask alloc] initWithMasterLayout:self];
  }
LABEL_28:
}

- (void)measureTextForLayoutState:(id)a3
{
  id v4 = a3;
  int v5 = [a3 modelCellID];
  [a3 minSize];
  double v7 = v6;
  double v9 = v8;
  [a3 maxSize];
  double v11 = v10;
  double v13 = v12;
  uint64_t v14 = [a3 cellWraps];
  objc_opt_class();
  [a3 cellContents];
  uint64_t v15 = (__CFString *)TSUDynamicCast();
  if (([a3 hasContent] & 1) == 0)
  {
    objc_msgSend(a3, "setLayoutCacheFlags:", objc_msgSend(a3, "layoutCacheFlags") & 0xFFFFFFFCLL);
    uint64_t v15 = @"Z";
  }
  id v16 = -[TSTMasterLayout newTextEngineForCell:atCellID:](self, "newTextEngineForCell:atCellID:", [a3 cell], objc_msgSend(a3, "modelCellID"));
  if (([a3 layoutCacheFlags] & 8) != 0)
  {
    uint64_t v17 = [a3 cell];
    if (!v17 || *(unsigned __int8 *)(v17 + 9) << 8 != 2304)
    {
      int v18 = [TSTLayoutContentCachedKey alloc];
      double v19 = v14 ? v11 : v7;
      uint64_t v20 = [v16 paragraphStyle];
      uint64_t v21 = [a3 cell];
      uint64_t v22 = v21 ? *(unsigned __int8 *)(v21 + 9) : 0;
      [a3 paddingInsets];
      unint64_t v27 = -[TSTLayoutContentCachedKey initWithString:width:height:paragraphStyle:cellWraps:valueType:paddingInsets:verticalAlignment:writingDirection:](v18, "initWithString:width:height:paragraphStyle:cellWraps:valueType:paddingInsets:verticalAlignment:writingDirection:", v15, v20, v14, v22, [a3 verticalAlignment], -[TSSStyle intValueForProperty:](-[TSTTableModel tableStyle](-[TSTMasterLayout tableModel](self, "tableModel"), "tableStyle"), "intValueForProperty:", 798), v19, v9, v23, v24, v25, v26);
      [a3 setKeyVal:v27];
      id v28 = [(TSUConcurrentCache *)[(TSTMasterLayout *)self dupContentCache] objectForKey:v27];
      if (v28)
      {
        id v29 = v28;

        goto LABEL_44;
      }
    }
  }
  double v30 = [TSTTextEngineDelegate alloc];
  [a3 paddingInsets];
  unint64_t v35 = -[TSTTextEngineDelegate initWithPadding:verticalAlignment:](v30, "initWithPadding:verticalAlignment:", [a3 verticalAlignment], v31, v32, v33, v34);
  [v16 setDelegate:v35];
  if ([(TSTMasterLayout *)self containedTextEditor]
    && (([(TSTTableInfo *)[(TSTMasterLayout *)self tableInfo] editingCellID] ^ v5) & 0xFFFFFF) == 0)
  {
    unint64_t v39 = [(TSTEditingState *)[(TSTTableInfo *)[(TSTMasterLayout *)self tableInfo] editingState] editingStorage];
LABEL_25:
    unint64_t v40 = v39;
    if (v39 && !objc_msgSend(-[TSWPStorage string](v39, "string"), "length"))
    {
      unint64_t v40 = 0;
      uint64_t v15 = @"Z";
    }
    goto LABEL_28;
  }
  uint64_t v36 = [a3 cell];
  if (v36 && *(unsigned __int8 *)(v36 + 9) << 8 == 2304)
  {
    int v37 = (*(_DWORD *)&self->mDynamicSuppressingConditionalStylesCellID ^ v5) & 0xFFFFFF;
    char v38 = (void *)[a3 cell];
    if (v37)
    {
      unint64_t v39 = (TSWPStorage *)TSTCellRichTextStorageForLayout((uint64_t)v38);
    }
    else
    {
      if (v38) {
        char v38 = (void *)v38[9];
      }
      unint64_t v39 = (TSWPStorage *)[v38 storage];
    }
    goto LABEL_25;
  }
  unint64_t v40 = 0;
LABEL_28:
  if (v14) {
    unsigned int v41 = 3;
  }
  else {
    unsigned int v41 = 15;
  }
  if (v9 == v13 && v9 < 4294967300.0) {
    uint64_t v43 = v41 & 0xFFFFFFFD;
  }
  else {
    uint64_t v43 = v41;
  }
  if (v40) {
    uint64_t v44 = objc_msgSend(v16, "layoutTextStorage:minSize:maxSize:anchor:pageNumber:pageCount:flags:", v40, objc_msgSend(a3, "pageNumber"), objc_msgSend(a3, "pageCount"), v43, v7, v9, v11, v13, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  }
  else {
    uint64_t v44 = objc_msgSend(v16, "layoutText:kind:minSize:maxSize:anchor:flags:", v15, 5, v43, v7, v9, v11, v13, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  }
  id v29 = (id)v44;
  [v16 setDelegate:0];

  id v45 = a3;
  if (v29) {
    goto LABEL_45;
  }
  if ([a3 hasContent])
  {
    double v46 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v47 = [NSString stringWithUTF8String:"-[TSTMasterLayout measureTextForLayoutState:]"];
    [v46 handleFailureInFunction:v47, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTMasterLayout.mm"), 5719, @"No layout found for cell in col %d, row %d\n", BYTE2(v5), (unsigned __int16)v5 file lineNumber description];
  }
  id v29 = 0;
LABEL_44:
  id v45 = a3;
LABEL_45:
  [v45 setWpColumn:v29];
}

- (void)processLayoutTask:(id)a3
{
  id v5 = a3;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->mLayoutSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  mLayoutInFlight = self->mLayoutInFlight;
  global_queue = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __37__TSTMasterLayout_processLayoutTask___block_invoke;
  v8[3] = &unk_2646B0750;
  v8[4] = a3;
  v8[5] = self;
  dispatch_group_async(mLayoutInFlight, global_queue, v8);
}

uint64_t __37__TSTMasterLayout_processLayoutTask___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F086B0]);
  unint64_t v3 = (void *)[*(id *)(a1 + 32) cellStatesToLayout];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__TSTMasterLayout_processLayoutTask___block_invoke_2;
  v5[3] = &unk_2646B0B18;
  v5[4] = *(void *)(a1 + 40);
  [v3 enumerateObjectsUsingBlock:v5];
  [*(id *)(a1 + 32) flushToGlobalCaches];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 40) + 104));

  return [v2 drain];
}

uint64_t __37__TSTMasterLayout_processLayoutTask___block_invoke_2(uint64_t a1)
{
  objc_opt_class();
  uint64_t v2 = TSUDynamicCast();
  unint64_t v3 = *(void **)(a1 + 32);

  return [v3 measureTextForLayoutState:v2];
}

- (void)waitForLayoutToComplete
{
  dispatch_group_wait((dispatch_group_t)self->mLayoutInFlight, 0xFFFFFFFFFFFFFFFFLL);
  [(TSUReadWriteQueue *)[(TSUConcurrentCache *)[(TSTMasterLayout *)self cellIDToWPColumnCache] readWriteQueue] waitOnInFlightWriters];
  unint64_t v3 = [(TSTMasterLayout *)self whCacheQueue];

  [(TSUReadWriteQueue *)v3 waitOnInFlightWriters];
}

- (void)setMaxConcurrentTasks:(unsigned int)a3
{
  self->mMaxConcurrentTasks = a3;
  self->mLayoutSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(a3);
}

- (id)newTextEngineForCell:(id)a3 atCellID:(id)a4
{
  if (!a3 || (double v7 = (TSWPParagraphStyle *)*((void *)a3 + 7)) == 0)
  {
    LOBYTE(v26) = 0;
    double v7 = (TSWPParagraphStyle *)TSTTableTextStyleForCellWithEmptyStyleAtCellID((uint64_t *)[(TSTMasterLayout *)self tableModel], *(_DWORD *)&a4, (char *)&v26);
    if (!a3) {
      goto LABEL_25;
    }
  }
  int v8 = *((_DWORD *)a3 + 2);
  if ((v8 & 0xFF00) != 0x200) {
    goto LABEL_19;
  }
  if ((v8 & 0xFB00) == 0x200 || BYTE1(v8) == 7)
  {
    if (*((double *)a3 + 2) < 0.0)
    {
      int v10 = *((_DWORD *)a3 + 26);
      uint64_t v28 = 0;
      long long v26 = 0u;
      long long v27 = 0u;
      LODWORD(v26) = -1;
      if ((v10 - 256) > 2)
      {
        if ((v10 & 0xFFFFFFFE) != 0x108) {
          goto LABEL_19;
        }
        TSTCellGetFormatOfType(a3, *((_DWORD *)a3 + 34), (uint64_t)&v26);
        if ((v26 & 0xFFFFFFFC) != 0x100) {
          goto LABEL_19;
        }
      }
      else
      {
        long long v11 = *(_OWORD *)((char *)a3 + 120);
        long long v26 = *(_OWORD *)((char *)a3 + 104);
        long long v27 = v11;
        uint64_t v28 = *((void *)a3 + 17);
      }
      if ((v27 & 0x1500) == 0x100)
      {
        double v7 = [(TSSStyle *)[TSWPParagraphStyle alloc] initWithContext:[(TSPObject *)v7 context] name:@"temporaryParagraphStyleForTables" overridePropertyMap:[(TSSStyle *)v7 propertyMap] isVariation:0];
        -[TSSStyle setValue:forProperty:](v7, "setValue:forProperty:", [MEMORY[0x263F7C808] redColor], 18);
      }
    }
  }
  else if (BYTE1(v8))
  {
    double v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v13 = [NSString stringWithUTF8String:"double TSTCellDoubleValue(TSTCell *)"];
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCell.h"), 897, @"can't get value from non-value cell: %p", a3);
  }
LABEL_19:
  unsigned int v14 = *((unsigned __int8 *)a3 + 9);
  BOOL v15 = v14 > 7;
  int v16 = (1 << v14) & 0xA4;
  if (v15 || v16 == 0)
  {
LABEL_25:
    char v20 = 0;
    goto LABEL_27;
  }
  id v18 = [(TSTMasterLayout *)self accountingParagraphStylePropertyMapForCell:a3 atCellID:*(unsigned int *)&a4];
  if (v18)
  {
    id v19 = v18;
    char v20 = 1;
    double v7 = [(TSSStyle *)[TSWPParagraphStyle alloc] initWithContext:[(TSPObject *)v7 context] name:[(TSSStyle *)v7 name] overridePropertyMap:[(TSSStyle *)v7 propertyMap] isVariation:1];
    [(TSSStyle *)v7 setValuesForProperties:v19];
  }
  else
  {
    char v20 = 1;
  }
LABEL_27:
  id v21 = +[TSWPColumnStyle defaultStyleWithContext:[(TSPObject *)v7 context]];
  uint64_t v22 = [(TSSStyle *)v7 intValueForProperty:44];
  if (v22 == -1)
  {
    uint64_t v22 = [(TSSStyle *)[(TSTTableModel *)[(TSTMasterLayout *)self tableModel] tableStyle] intValueForProperty:798] == 1;
    if (v20) {
      goto LABEL_29;
    }
LABEL_31:
    if (a3 && *((unsigned __int8 *)a3 + 9) << 8 == 2304) {
      uint64_t v23 = 4;
    }
    else {
      uint64_t v23 = v22 == 1;
    }
    goto LABEL_35;
  }
  if ((v20 & 1) == 0) {
    goto LABEL_31;
  }
LABEL_29:
  uint64_t v23 = 1;
LABEL_35:
  double v24 = [[TSWPText alloc] initWithParagraphStyle:v7 columnStyle:v21 alignmentForNaturalAlignment:v23 naturalDirection:v22];
  if ([(TSTMasterLayout *)self isDynamicallyChangingFontColorOfCellID:*(unsigned int *)&a4])
  {
    [(TSWPText *)v24 setTextColorOverride:[(TSTMasterLayout *)self dynamicFontColor]];
  }
  return v24;
}

- (id)accountingParagraphStylePropertyMapForCell:(id)a3 atCellID:(id)a4
{
  if (!TSTCellFormatUsesAccountingStyle(a3)) {
    return 0;
  }
  uint64_t v6 = a4;
  unint64_t v7 = TSTTableMergeRangeAtCellID((uint64_t)[(TSTMasterLayout *)self tableModel], *(_DWORD *)&a4);
  unint64_t v8 = v7;
  if ((_WORD)v7 == 0xFFFF || (v7 & 0xFF0000) == 0xFF0000 || !HIWORD(v7) || (v7 & 0xFFFF00000000) == 0)
  {
    unint64_t v8 = *(unsigned int *)&a4 | 0x1000100000000;
  }
  else if (((v7 ^ *(_DWORD *)&a4) & 0xFFFFFF) != 0)
  {
    double v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"-[TSTMasterLayout accountingParagraphStylePropertyMapForCell:atCellID:]"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTMasterLayout.mm"), 5894, @"Trying create a text engine for a merged cell other than origin.");
  }
  double v12 = TSTMasterLayoutContentWidthForCellRange(self, v8, 0);
  id v13 = +[TSWPTab tab];
  [(TSTMasterLayout *)self paddingForCellID:v6];
  [v13 setPosition:v12 + -4.0 - v14];
  [v13 setAlignment:2];
  id v15 = +[TSWPTabs tabs];
  [v15 insertTab:v13];
  id v11 = +[TSSPropertyMap propertyMap];
  [v11 setIntValue:0 forProperty:86];
  [v11 setObject:v15 forProperty:84];
  return v11;
}

- (UIEdgeInsets)edgeInsetsFromPadding:(id)a3
{
  [a3 topInset];
  double v5 = v4;
  [a3 leftInset];
  double v7 = v6;
  [a3 bottomInset];
  double v9 = v8;
  [a3 rightInset];
  double v10 = fmax(v7, 2.0);
  double v12 = fmax(v11, 2.0);
  double v13 = v5;
  double v14 = v9;
  result.right = v12;
  result.bottom = v14;
  result.left = v10;
  result.top = v13;
  return result;
}

- (UIEdgeInsets)paddingForCellID:(id)a3
{
  if ((a3.var0 == 0xFFFF
     || (*(void *)&a3.var0 & 0xFF0000) == 0xFF0000
     || (CellStyleAtCellID = (void *)TSTTableGetCellStyleAtCellID((uint64_t *)[(TSTMasterLayout *)self tableModel], *(_DWORD *)&a3, 0)) == 0)&& (CellStyleAtCellID = (void *)TSTTableCellStyleForCellWithEmptyStyleAtCellID((uint64_t *)[(TSTMasterLayout *)self tableModel], *(_DWORD *)&a3, 0)) == 0)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [CellStyleAtCellID valueForProperty:904];
  }

  [(TSTMasterLayout *)self edgeInsetsFromPadding:v6];
  result.right = v10;
  result.bottom = v9;
  result.left = v8;
  result.top = v7;
  return result;
}

- (UIEdgeInsets)defaultPaddingForCellID:(id)a3
{
  double v4 = (void *)TSTTableCellStyleForCellWithEmptyStyleAtCellID((uint64_t *)[(TSTMasterLayout *)self tableModel], *(_DWORD *)&a3, 0);
  if (v4) {
    uint64_t v5 = [v4 valueForProperty:904];
  }
  else {
    uint64_t v5 = 0;
  }

  [(TSTMasterLayout *)self edgeInsetsFromPadding:v5];
  result.right = v9;
  result.bottom = v8;
  result.left = v7;
  result.top = v6;
  return result;
}

- (double)fontHeightOfParagraphStyle:(id)a3
{
  id v5 = a3;
  if (!a3) {
    id v5 = (id)[MEMORY[0x263EFF9D0] null];
  }
  double v6 = (void *)[(TSURetainedPointerKeyDictionary *)self->mParaStyleToHeightCache objectForKey:v5];
  if (v6)
  {
    objc_msgSend(v6, "tsu_CGFloatValue");
  }
  else
  {
    FontForStyle = TSWPFastCreateFontForStyle(0, a3, 0x64uLL);
    double v9 = ceil(TSWPDefaultLineHeightForFont(FontForStyle));
    CFRelease(FontForStyle);
    -[TSURetainedPointerKeyDictionary setObject:forKey:](self->mParaStyleToHeightCache, "setObject:forKey:", objc_msgSend(NSNumber, "tsu_numberWithCGFloat:", v9), v5);
    return v9;
  }
  return result;
}

- (TSTTableInfo)tableInfo
{
  return self->mTableInfo;
}

- (void)setTableInfo:(id)a3
{
  self->mTableInfo = (TSTTableInfo *)a3;
}

- (TSTWPColumnCache)cellIDToWPColumnCache
{
  return self->mCellIDToWPColumnCache;
}

- (TSTDupContentCache)dupContentCache
{
  return self->mDupContentCache;
}

- (TSTWPColumnCache)tempWPColumnCache
{
  return self->mTempWPColumnCache;
}

- (TSTWidthHeightCache)widthHeightCache
{
  return self->mWidthHeightCache;
}

- (TSTHiddenRowsColumnsCache)hiddenRowsColumnsCache
{
  return self->mHiddenRowsColumnsCache;
}

- (TSDFill)bandedFillObject
{
  return self->mBandedFillObject;
}

- (int)tableEnvironment
{
  return self->mTableEnvironment;
}

- (void)setTableEnvironment:(int)a3
{
  self->mTableEnvironment = a3;
}

- (int)tableRowsBehavior
{
  return self->mTableRowsBehavior;
}

- (TSUReadWriteQueue)whCacheQueue
{
  return self->mWHCacheQueue;
}

- (unsigned)maxConcurrentTasks
{
  return self->mMaxConcurrentTasks;
}

- (unsigned)numCellsPerTask
{
  return self->mNumCellsPerTask;
}

- (void)setNumCellsPerTask:(unsigned int)a3
{
  self->mNumCellsPerTask = a3;
}

- (BOOL)inDynamicLayoutMode
{
  return self->mInDynamicLayoutMode;
}

- (NSMutableSet)dynamicLayouts
{
  return self->mDynamicLayouts;
}

- (double)dynamicAddOrRemoveColumnElementSize
{
  return self->mDynamicAddOrRemoveColumnElementSize;
}

- (double)dynamicAddOrRemoveRowElementSize
{
  return self->mDynamicAddOrRemoveRowElementSize;
}

- (BOOL)dynamicBandedFill
{
  return self->mDynamicBandedFill;
}

- (BOOL)dynamicBandedFillSetting
{
  return self->mDynamicBandedFillSetting;
}

- (int)dynamicColumnAdjustment
{
  return self->mDynamicColumnAdjustment;
}

- (double)dynamicColumnTabSize
{
  return self->mDynamicColumnTabSize;
}

- (TSUColor)dynamicFontColor
{
  return self->mDynamicFontColor;
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)dynamicFontColorCellRange
{
  return ($CA3468F20078D5D2DB35E78E73CA60DA)self->mDynamicFontColorCellRange;
}

- (BOOL)dynamicRepResize
{
  return self->mDynamicRepResize;
}

- (void)setDynamicRepResize:(BOOL)a3
{
  self->mDynamicRepResize = a3;
}

- (TSDInfoGeometry)dynamicInfoGeometry
{
  return self->mDynamicInfoGeometry;
}

- (double)dynamicHeightResize
{
  return self->mDynamicHeightResize;
}

- (void)setDynamicHeightResize:(double)a3
{
  self->mDynamicHeightResize = a3;
}

- (double)dynamicWidthResize
{
  return self->mDynamicWidthResize;
}

- (void)setDynamicWidthResize:(double)a3
{
  self->mDynamicWidthResize = a3;
}

- (BOOL)dynamicResizingColumns
{
  return self->mDynamicResizingColumns;
}

- (double)dynamicResizingColumnAdjustment
{
  return self->mDynamicResizingColumnAdjustment;
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)dynamicResizingColumnRange
{
  return ($CA3468F20078D5D2DB35E78E73CA60DA)self->mDynamicResizingColumnRange;
}

- (BOOL)dynamicResizingRows
{
  return self->mDynamicResizingRows;
}

- (double)dynamicResizingRowAdjustment
{
  return self->mDynamicResizingRowAdjustment;
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)dynamicResizingRowRange
{
  return ($CA3468F20078D5D2DB35E78E73CA60DA)self->mDynamicResizingRowRange;
}

- (int)dynamicRowAdjustment
{
  return self->mDynamicRowAdjustment;
}

- (double)dynamicRowTabSize
{
  return self->mDynamicRowTabSize;
}

- (TSDLayoutGeometry)dynamicSavedLayoutGeometry
{
  return self->mDynamicSavedLayoutGeometry;
}

- (void)setDynamicSavedLayoutGeometry:(id)a3
{
}

- (TSTCellRegion)dynamicSelectionRegion
{
  return self->mDynamicSelectionRegion;
}

- (double)dynamicTableNameResize
{
  return self->mDynamicTableNameResize;
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)dynamicSuppressingConditionalStylesCellID
{
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)self->mDynamicSuppressingConditionalStylesCellID;
}

- (TSWPEditingController)containedTextEditor
{
  return self->mContainedTextEditor;
}

- (void)setContainedTextEditor:(id)a3
{
  self->mContainedTextEditor = (TSWPEditingController *)a3;
}

- (NSMutableArray)changeDescriptors
{
  return self->mChangeDescriptors;
}

- (TSTMergeRangeSortedSet)mergeRanges
{
  return self->mMergeRanges;
}

- (void)setMergeRanges:(id)a3
{
}

- (BOOL)processHiddenRowsForExport
{
  return self->mProcessHiddenRowsForExport;
}

- (CGSize)maximumPartitionSize
{
  double width = self->mMaximumPartitionSize.width;
  double height = self->mMaximumPartitionSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMaximumPartitionSize:(CGSize)a3
{
  self->mMaximumPartitionSize = a3;
}

- (TSKChangeNotifier)changeNotifier
{
  return self->mChangeNotifier;
}

@end