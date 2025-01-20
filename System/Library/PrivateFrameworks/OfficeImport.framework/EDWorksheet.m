@interface EDWorksheet
- (BOOL)fitToPage;
- (BOOL)hasMergedCells;
- (BOOL)hasMergedCol;
- (BOOL)hasMergedRow;
- (BOOL)isColMerged:(unsigned int)a3;
- (BOOL)isRowMerged:(unsigned int)a3;
- (double)defaultColumnWidth;
- (id)columnInfos;
- (id)conditionalFormattings;
- (id)description;
- (id)hyperlinks;
- (id)implicitCellArea;
- (id)maxCellReferencedInFormulas;
- (id)mergedCells;
- (id)mergedColRef:(unsigned int)a3;
- (id)mergedRowRef:(unsigned int)a3;
- (id)pane;
- (id)pivotTables;
- (id)rowBlocks;
- (id)tables;
- (id)worksheetWarnings;
- (unint64_t)maxColumnOutlineLevel;
- (unint64_t)maxRowOutlineLevel;
- (unsigned)defaultRowHeight;
- (void)reduceMemoryIfPossible;
- (void)setDefaultColumnWidth:(double)a3;
- (void)setDefaultRowHeight:(unsigned __int16)a3;
- (void)setFitToPage:(BOOL)a3;
- (void)setImplicitCellArea:(id)a3;
- (void)setMaxColumnOutlineLevel:(unint64_t)a3;
- (void)setMaxRowOutlineLevel:(unint64_t)a3;
- (void)setMergedColsRef:(id)a3 from:(unsigned int)a4 to:(unsigned int)a5;
- (void)setMergedRowsRef:(id)a3 from:(unsigned int)a4 to:(unsigned int)a5;
- (void)setPane:(id)a3;
- (void)setup;
- (void)teardown;
- (void)updateMaxColumnOutlineLevelIfNeeded:(unint64_t)a3;
- (void)updateMaxRowOutlineLevelIfNeeded:(unint64_t)a3;
@end

@implementation EDWorksheet

- (void)setup
{
  v3 = [EDColumnInfoCollection alloc];
  v4 = [(EDSheet *)self workbook];
  v5 = [v4 resources];
  v6 = [(EDColumnInfoCollection *)v3 initWithResources:v5 worksheet:self];
  mColumnInfos = self->mColumnInfos;
  self->mColumnInfos = v6;

  v8 = objc_alloc_init(EDWarnings);
  mWorksheetWarnings = self->mWorksheetWarnings;
  self->mWorksheetWarnings = v8;

  v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  mMergedRows = self->mMergedRows;
  self->mMergedRows = v10;

  v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  mMergedCols = self->mMergedCols;
  self->mMergedCols = v12;

  self->mDefaultColumnWidth = 8.0;
  self->mDefaultRowHeight = 255;
  self->mMaxRowOutlineLevel = 0;
  self->mMaxColumnOutlineLevel = 0;
  self->mFitToPage = 0;
  v14.receiver = self;
  v14.super_class = (Class)EDWorksheet;
  [(EDSheet *)&v14 setup];
}

- (void)setDefaultColumnWidth:(double)a3
{
  self->mDefaultColumnWidth = a3;
}

- (void)setDefaultRowHeight:(unsigned __int16)a3
{
  self->mDefaultRowHeight = a3;
}

- (void)setFitToPage:(BOOL)a3
{
  self->mFitToPage = a3;
}

- (void)setMaxRowOutlineLevel:(unint64_t)a3
{
  self->mMaxRowOutlineLevel = a3;
}

- (void)setMaxColumnOutlineLevel:(unint64_t)a3
{
  self->mMaxColumnOutlineLevel = a3;
}

- (id)columnInfos
{
  return self->mColumnInfos;
}

- (id)rowBlocks
{
  mRowBlocks = self->mRowBlocks;
  if (!mRowBlocks)
  {
    v4 = [[EDRowBlocks alloc] initWithWorksheet:self];
    v5 = self->mRowBlocks;
    self->mRowBlocks = v4;

    mRowBlocks = self->mRowBlocks;
  }
  [(EDRowBlocks *)mRowBlocks lock];
  v6 = self->mRowBlocks;
  return v6;
}

- (id)mergedCells
{
  mMergedCells = self->mMergedCells;
  if (!mMergedCells)
  {
    v4 = objc_alloc_init(EDMergedCellCollection);
    v5 = self->mMergedCells;
    self->mMergedCells = v4;

    v6 = [(EDSheet *)self processors];
    [v6 markObject:self processor:objc_opt_class()];

    mMergedCells = self->mMergedCells;
  }
  return mMergedCells;
}

- (unsigned)defaultRowHeight
{
  return self->mDefaultRowHeight;
}

- (double)defaultColumnWidth
{
  BOOL v3 = [(EDSheet *)self isDisplayFormulas];
  double result = self->mDefaultColumnWidth;
  if (v3) {
    return result + result;
  }
  return result;
}

- (void)teardown
{
  if (self->mRowBlocks)
  {
    BOOL v3 = +[OITSUFlushingManager sharedManager];
    [v3 removeObject:self->mRowBlocks];

    mRowBlocks = self->mRowBlocks;
    self->mRowBlocks = 0;
  }
  mColumnInfos = self->mColumnInfos;
  self->mColumnInfos = 0;

  mConditionalFormattings = self->mConditionalFormattings;
  self->mConditionalFormattings = 0;

  mMergedCells = self->mMergedCells;
  self->mMergedCells = 0;

  mHyperlinks = self->mHyperlinks;
  self->mHyperlinks = 0;

  mTables = self->mTables;
  self->mTables = 0;

  mPivotTables = self->mPivotTables;
  self->mPivotTables = 0;

  mPane = self->mPane;
  self->mPane = 0;

  mImplicitCellArea = self->mImplicitCellArea;
  self->mImplicitCellArea = 0;

  mWorksheetWarnings = self->mWorksheetWarnings;
  self->mWorksheetWarnings = 0;

  mMaxCellReferencedInFormulas = self->mMaxCellReferencedInFormulas;
  self->mMaxCellReferencedInFormulas = 0;

  mMergedRows = self->mMergedRows;
  self->mMergedRows = 0;

  mMergedCols = self->mMergedCols;
  self->mMergedCols = 0;

  v17.receiver = self;
  v17.super_class = (Class)EDWorksheet;
  [(EDSheet *)&v17 teardown];
}

- (id)maxCellReferencedInFormulas
{
  mMaxCellReferencedInFormulas = self->mMaxCellReferencedInFormulas;
  if (!mMaxCellReferencedInFormulas)
  {
    v4 = objc_alloc_init(EDReference);
    v5 = self->mMaxCellReferencedInFormulas;
    self->mMaxCellReferencedInFormulas = v4;

    mMaxCellReferencedInFormulas = self->mMaxCellReferencedInFormulas;
  }
  return mMaxCellReferencedInFormulas;
}

- (void)setPane:(id)a3
{
  v5 = (EDPane *)a3;
  if (self->mPane != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mPane, a3);
    v5 = v6;
  }
}

- (id)conditionalFormattings
{
  mConditionalFormattings = self->mConditionalFormattings;
  if (!mConditionalFormattings)
  {
    v4 = objc_alloc_init(EDCollection);
    v5 = self->mConditionalFormattings;
    self->mConditionalFormattings = v4;

    mConditionalFormattings = self->mConditionalFormattings;
  }
  return mConditionalFormattings;
}

- (id)worksheetWarnings
{
  return self->mWorksheetWarnings;
}

- (id)tables
{
  mTables = self->mTables;
  if (!mTables)
  {
    v4 = objc_alloc_init(EDCollection);
    v5 = self->mTables;
    self->mTables = v4;

    v6 = [(EDSheet *)self processors];
    [v6 markObject:self processor:objc_opt_class()];

    mTables = self->mTables;
  }
  return mTables;
}

- (id)pivotTables
{
  mPivotTables = self->mPivotTables;
  if (!mPivotTables)
  {
    v4 = objc_alloc_init(EDCollection);
    v5 = self->mPivotTables;
    self->mPivotTables = v4;

    v6 = [(EDSheet *)self processors];
    [v6 markObject:self processor:objc_opt_class()];

    mPivotTables = self->mPivotTables;
  }
  return mPivotTables;
}

- (id)hyperlinks
{
  mHyperlinks = self->mHyperlinks;
  if (!mHyperlinks)
  {
    v4 = objc_alloc_init(EDCollection);
    v5 = self->mHyperlinks;
    self->mHyperlinks = v4;

    mHyperlinks = self->mHyperlinks;
  }
  return mHyperlinks;
}

- (void)updateMaxColumnOutlineLevelIfNeeded:(unint64_t)a3
{
  if (self->mMaxColumnOutlineLevel < a3) {
    self->mMaxColumnOutlineLevel = a3;
  }
}

- (BOOL)fitToPage
{
  return self->mFitToPage;
}

- (id)pane
{
  return self->mPane;
}

- (BOOL)hasMergedCells
{
  mMergedCells = self->mMergedCells;
  if (mMergedCells) {
    LOBYTE(mMergedCells) = [(EDCollection *)mMergedCells count] != 0;
  }
  return (char)mMergedCells;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDWorksheet;
  v2 = [(EDSheet *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mImplicitCellArea, 0);
  objc_storeStrong((id *)&self->mMergedCols, 0);
  objc_storeStrong((id *)&self->mMergedRows, 0);
  objc_storeStrong((id *)&self->mMaxCellReferencedInFormulas, 0);
  objc_storeStrong((id *)&self->mWorksheetWarnings, 0);
  objc_storeStrong((id *)&self->mPane, 0);
  objc_storeStrong((id *)&self->mMergedCells, 0);
  objc_storeStrong((id *)&self->mPivotTables, 0);
  objc_storeStrong((id *)&self->mTables, 0);
  objc_storeStrong((id *)&self->mHyperlinks, 0);
  objc_storeStrong((id *)&self->mConditionalFormattings, 0);
  objc_storeStrong((id *)&self->mColumnInfos, 0);
  objc_storeStrong((id *)&self->mRowBlocks, 0);
}

- (void)reduceMemoryIfPossible
{
}

- (unint64_t)maxRowOutlineLevel
{
  return self->mMaxRowOutlineLevel;
}

- (void)updateMaxRowOutlineLevelIfNeeded:(unint64_t)a3
{
  if (self->mMaxRowOutlineLevel < a3) {
    self->mMaxRowOutlineLevel = a3;
  }
}

- (unint64_t)maxColumnOutlineLevel
{
  return self->mMaxColumnOutlineLevel;
}

- (void)setMergedRowsRef:(id)a3 from:(unsigned int)a4 to:(unsigned int)a5
{
  uint64_t v6 = *(void *)&a4;
  for (i = a3; v6 <= a5; uint64_t v6 = (v6 + 1))
  {
    mMergedRows = self->mMergedRows;
    v9 = [NSNumber numberWithUnsignedInt:v6];
    [(NSMutableDictionary *)mMergedRows setObject:i forKey:v9];
  }
}

- (void)setMergedColsRef:(id)a3 from:(unsigned int)a4 to:(unsigned int)a5
{
  uint64_t v6 = *(void *)&a4;
  for (i = a3; v6 <= a5; uint64_t v6 = (v6 + 1))
  {
    mMergedCols = self->mMergedCols;
    v9 = [NSNumber numberWithUnsignedInt:v6];
    [(NSMutableDictionary *)mMergedCols setObject:i forKey:v9];
  }
}

- (BOOL)hasMergedRow
{
  return [(NSMutableDictionary *)self->mMergedRows count] != 0;
}

- (BOOL)isRowMerged:(unsigned int)a3
{
  mMergedRows = self->mMergedRows;
  objc_super v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  v5 = [(NSMutableDictionary *)mMergedRows objectForKey:v4];
  LOBYTE(mMergedRows) = v5 != 0;

  return (char)mMergedRows;
}

- (id)mergedRowRef:(unsigned int)a3
{
  mMergedRows = self->mMergedRows;
  objc_super v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  v5 = [(NSMutableDictionary *)mMergedRows objectForKey:v4];

  return v5;
}

- (BOOL)hasMergedCol
{
  return [(NSMutableDictionary *)self->mMergedCols count] != 0;
}

- (BOOL)isColMerged:(unsigned int)a3
{
  mMergedCols = self->mMergedCols;
  objc_super v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  v5 = [(NSMutableDictionary *)mMergedCols objectForKey:v4];
  LOBYTE(mMergedCols) = v5 != 0;

  return (char)mMergedCols;
}

- (id)mergedColRef:(unsigned int)a3
{
  mMergedCols = self->mMergedCols;
  objc_super v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  v5 = [(NSMutableDictionary *)mMergedCols objectForKey:v4];

  return v5;
}

- (id)implicitCellArea
{
  return self->mImplicitCellArea;
}

- (void)setImplicitCellArea:(id)a3
{
  v5 = (EDReference *)a3;
  if (self->mImplicitCellArea != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->mImplicitCellArea, a3);
    v5 = v6;
  }
}

@end