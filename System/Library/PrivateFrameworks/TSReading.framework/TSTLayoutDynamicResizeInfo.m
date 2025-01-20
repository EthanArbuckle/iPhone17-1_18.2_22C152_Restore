@interface TSTLayoutDynamicResizeInfo
- (BOOL)hasHeightForRow:(unsigned __int16)a3;
- (BOOL)hasWidthForColumn:(unsigned __int8)a3;
- (BOOL)valid;
- (CGSize)capturedTableSize;
- (TSTLayoutDynamicResizeInfo)initWithDynamicResizeInfo:(id)a3;
- (TSTLayoutDynamicResizeInfo)initWithMasterLayout:(id)a3;
- (TSTLayoutDynamicResizeInfo)initWithMasterLayout:(id)a3 columnRegion:(id)a4;
- (TSTLayoutDynamicResizeInfo)initWithMasterLayout:(id)a3 rowRegion:(id)a4;
- (double)applyColumnTotalWidth:(double)a3;
- (double)applyRowTotalHeight:(double)a3;
- (double)getColumnInitialWidth:(unsigned __int8)a3;
- (double)getColumnWidth:(unsigned __int8)a3;
- (double)getColumnWidthResize:(unsigned __int8)a3;
- (double)getRowHeight:(unsigned __int16)a3;
- (double)getRowHeightResize:(unsigned __int16)a3;
- (double)getRowInitialHeight:(unsigned __int16)a3;
- (id)columnWidths;
- (id)rowHeights;
- (void)dealloc;
- (void)enumerateColumnWidthsUsingBlock:(id)a3;
- (void)enumerateRowHeightsUsingBlock:(id)a3;
- (void)invalidate;
- (void)p_captureRowColumnInformation:(id)a3 columnRegion:(id)a4 rowRegion:(id)a5;
@end

@implementation TSTLayoutDynamicResizeInfo

- (TSTLayoutDynamicResizeInfo)initWithMasterLayout:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSTLayoutDynamicResizeInfo;
  v4 = [(TSTLayoutDynamicResizeInfo *)&v7 init];
  if (v4)
  {
    v4->mTableRowsBehavior = [a3 tableRowsBehavior];
    id v5 = +[TSTCellRegion regionFromRange:TSTMasterLayoutGetRange((uint64_t)a3)];
    [(TSTLayoutDynamicResizeInfo *)v4 p_captureRowColumnInformation:a3 columnRegion:v5 rowRegion:v5];
    v4->mValid = 1;
  }
  return v4;
}

- (TSTLayoutDynamicResizeInfo)initWithMasterLayout:(id)a3 columnRegion:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)TSTLayoutDynamicResizeInfo;
  v6 = [(TSTLayoutDynamicResizeInfo *)&v8 init];
  if (v6)
  {
    v6->mTableRowsBehavior = [a3 tableRowsBehavior];
    [(TSTLayoutDynamicResizeInfo *)v6 p_captureRowColumnInformation:a3 columnRegion:a4 rowRegion:0];
    v6->mValid = 1;
  }
  return v6;
}

- (TSTLayoutDynamicResizeInfo)initWithMasterLayout:(id)a3 rowRegion:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)TSTLayoutDynamicResizeInfo;
  v6 = [(TSTLayoutDynamicResizeInfo *)&v8 init];
  if (v6)
  {
    v6->mTableRowsBehavior = [a3 tableRowsBehavior];
    [(TSTLayoutDynamicResizeInfo *)v6 p_captureRowColumnInformation:a3 columnRegion:0 rowRegion:a4];
    v6->mValid = 1;
  }
  return v6;
}

- (TSTLayoutDynamicResizeInfo)initWithDynamicResizeInfo:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)TSTLayoutDynamicResizeInfo;
  v4 = [(TSTLayoutDynamicResizeInfo *)&v15 init];
  id v5 = v4;
  if (v4)
  {
    v4->mValid = *((unsigned char *)a3 + 8);
    v4->mTableRowsBehavior = *((_DWORD *)a3 + 3);
    v4->mRowRegion = (TSTCellRegion *)*((id *)a3 + 2);
    v5->mStartRowIndex = *((_WORD *)a3 + 12);
    uint64_t v6 = *((unsigned __int16 *)a3 + 13);
    v5->mNumberOfRows = v6;
    if (v6)
    {
      objc_super v7 = (double *)malloc_type_malloc(8 * v6, 0x100004000313F17uLL);
      v5->mCapturedRowHeights = v7;
      memcpy(v7, *((const void **)a3 + 4), 8 * v5->mNumberOfRows);
      objc_super v8 = (double *)malloc_type_malloc(8 * v5->mNumberOfRows, 0x100004000313F17uLL);
      v5->mCurrentRowHeights = v8;
      memcpy(v8, *((const void **)a3 + 5), 8 * v5->mNumberOfRows);
      v9 = (double *)malloc_type_malloc(8 * v5->mNumberOfRows, 0x100004000313F17uLL);
      v5->mMinimumRowHeights = v9;
      memcpy(v9, *((const void **)a3 + 6), 8 * v5->mNumberOfRows);
    }
    else
    {
      v5->mCapturedRowHeights = 0;
      v5->mCurrentRowHeights = 0;
      v5->mMinimumRowHeights = 0;
    }
    v5->mCapturedRowHeightTotal = *((double *)a3 + 7);
    v5->mColumnRegion = (TSTCellRegion *)*((id *)a3 + 8);
    v5->mStartColumnIndex = *((unsigned char *)a3 + 72);
    uint64_t v10 = *((unsigned __int16 *)a3 + 37);
    v5->mNumberOfColumns = v10;
    if (v10)
    {
      v11 = (double *)malloc_type_malloc(8 * v10, 0x100004000313F17uLL);
      v5->mCapturedColumnWidths = v11;
      memcpy(v11, *((const void **)a3 + 10), 8 * v5->mNumberOfColumns);
      v12 = (double *)malloc_type_malloc(8 * v5->mNumberOfColumns, 0x100004000313F17uLL);
      v5->mCurrentColumnWidths = v12;
      memcpy(v12, *((const void **)a3 + 11), 8 * v5->mNumberOfColumns);
      v13 = (double *)malloc_type_malloc(8 * v5->mNumberOfColumns, 0x100004000313F17uLL);
      v5->mMinimumColumnWidths = v13;
      memcpy(v13, *((const void **)a3 + 12), 8 * v5->mNumberOfColumns);
    }
    else
    {
      v5->mCapturedColumnWidths = 0;
      v5->mCurrentColumnWidths = 0;
      v5->mMinimumColumnWidths = 0;
    }
    v5->mCapturedColumnWidthTotal = *((double *)a3 + 13);
  }
  return v5;
}

- (void)dealloc
{
  mCapturedRowHeights = self->mCapturedRowHeights;
  if (mCapturedRowHeights)
  {
    free(mCapturedRowHeights);
    self->mCapturedRowHeights = 0;
  }
  mCurrentRowHeights = self->mCurrentRowHeights;
  if (mCurrentRowHeights)
  {
    free(mCurrentRowHeights);
    self->mCurrentRowHeights = 0;
  }
  mMinimumRowHeights = self->mMinimumRowHeights;
  if (mMinimumRowHeights)
  {
    free(mMinimumRowHeights);
    self->mMinimumRowHeights = 0;
  }
  self->mCapturedRowHeightTotal = 0.0;
  self->mNumberOfRows = 0;

  mCapturedColumnWidths = self->mCapturedColumnWidths;
  if (mCapturedColumnWidths)
  {
    free(mCapturedColumnWidths);
    self->mCapturedColumnWidths = 0;
  }
  mCurrentColumnWidths = self->mCurrentColumnWidths;
  if (mCurrentColumnWidths)
  {
    free(mCurrentColumnWidths);
    self->mCurrentColumnWidths = 0;
  }
  mMinimumColumnWidths = self->mMinimumColumnWidths;
  if (mMinimumColumnWidths)
  {
    free(mMinimumColumnWidths);
    self->mMinimumColumnWidths = 0;
  }
  self->mCapturedColumnWidthTotal = 0.0;
  self->mNumberOfColumns = 0;
  v9.receiver = self;
  v9.super_class = (Class)TSTLayoutDynamicResizeInfo;
  [(TSTLayoutDynamicResizeInfo *)&v9 dealloc];
}

- (void)p_captureRowColumnInformation:(id)a3 columnRegion:(id)a4 rowRegion:(id)a5
{
  objc_super v9 = (void *)[a3 tableInfo];
  double v10 = 1.0;
  if ([v9 partitioner])
  {
    double v11 = 1.0;
    if (objc_msgSend((id)objc_msgSend(v9, "partitioner"), "scaleIsValid"))
    {
      objc_msgSend((id)objc_msgSend(v9, "partitioner"), "scaleToFit");
      double v11 = v12;
      objc_msgSend((id)objc_msgSend(v9, "partitioner"), "scaleToFit");
      double v10 = v13;
    }
  }
  else
  {
    double v11 = 1.0;
  }
  if (a5)
  {
    self->mRowRegion = (TSTCellRegion *)a5;
    self->mStartRowIndex = [a5 boundingCellRange];
    self->mNumberOfRows = (unint64_t)[a5 boundingCellRange] >> 48;
    self->mNumberOfResizableRows = [a5 numberOfIntersectingRows];
    v14 = malloc_type_malloc(8 * self->mNumberOfRows, 0x100004000313F17uLL);
    objc_super v15 = malloc_type_calloc(self->mNumberOfRows, 8uLL, 0x100004000313F17uLL);
    v16 = (double *)malloc_type_calloc(self->mNumberOfRows, 8uLL, 0x100004000313F17uLL);
    if (self->mNumberOfRows) {
      memset_pattern16(v14, &unk_22383BC50, 8 * self->mNumberOfRows);
    }
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x2020000000;
    __int16 v42 = 0;
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x2020000000;
    unint64_t v38 = 0xBFF0000000000000;
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2020000000;
    unint64_t v34 = 0xBFF0000000000000;
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2020000000;
    uint64_t v30 = 0;
    char v17 = [a3 isGrouped];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __83__TSTLayoutDynamicResizeInfo_p_captureRowColumnInformation_columnRegion_rowRegion___block_invoke;
    v25[3] = &unk_2646B3278;
    v25[9] = &v27;
    v25[10] = v14;
    v25[4] = self;
    v25[5] = a3;
    *(double *)&v25[11] = v10;
    char v26 = v17;
    v25[12] = v16;
    v25[6] = &v35;
    v25[7] = &v39;
    v25[8] = &v31;
    [a5 enumerateRowsUsingBlock:v25];
    self->mCapturedRowHeights = (double *)v14;
    memcpy(v15, v14, 8 * self->mNumberOfRows);
    self->mCurrentRowHeights = (double *)v15;
    self->mMinimumRowHeights = v16;
    *(void *)&self->mCapturedRowHeightTotal = v28[3];
    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(&v39, 8);
  }
  if (a4)
  {
    self->mColumnRegion = (TSTCellRegion *)a4;
    self->mStartColumnIndex = [a4 boundingCellRange] >> 16;
    self->unsigned int mNumberOfColumns = (unint64_t)[a4 boundingCellRange] >> 32;
    self->mNumberOfResizableColumns = [a4 numberOfIntersectingColumns];
    v18 = (double *)malloc_type_malloc(8 * self->mNumberOfColumns, 0x100004000313F17uLL);
    v19 = malloc_type_calloc(self->mNumberOfColumns, 8uLL, 0x100004000313F17uLL);
    v20 = (double *)malloc_type_calloc(self->mNumberOfColumns, 8uLL, 0x100004000313F17uLL);
    v21 = v20;
    unsigned int mNumberOfColumns = self->mNumberOfColumns;
    if (self->mNumberOfColumns)
    {
      int v23 = 0;
      do
        v18[v23++] = -1.0;
      while (mNumberOfColumns > v23);
    }
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x2020000000;
    LOBYTE(v42) = 0;
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x2020000000;
    unint64_t v38 = 0xBFF0000000000000;
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2020000000;
    unint64_t v34 = 0xBFF0000000000000;
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2020000000;
    uint64_t v30 = 0;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __83__TSTLayoutDynamicResizeInfo_p_captureRowColumnInformation_columnRegion_rowRegion___block_invoke_2;
    v24[3] = &unk_2646B32A0;
    v24[9] = &v27;
    v24[10] = v18;
    v24[4] = self;
    v24[5] = a3;
    *(double *)&v24[11] = v11;
    v24[12] = v20;
    v24[6] = &v35;
    v24[7] = &v39;
    v24[8] = &v31;
    [a4 enumerateColumnsUsingBlock:v24];
    self->mCapturedColumnWidths = v18;
    memcpy(v19, v18, 8 * self->mNumberOfColumns);
    self->mCurrentColumnWidths = (double *)v19;
    self->mMinimumColumnWidths = v21;
    *(void *)&self->mCapturedColumnWidthTotal = v28[3];
    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(&v39, 8);
  }
}

double __83__TSTLayoutDynamicResizeInfo_p_captureRowColumnInformation_columnRegion_rowRegion___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned __int16 v4 = a2 - *(_WORD *)(*(void *)(a1 + 32) + 24);
  double v5 = TSTMasterLayoutHeightOfRow(*(TSTMasterLayout **)(a1 + 40), a2, 0, 0, 1, 1);
  uint64_t v6 = *(void *)(a1 + 80);
  *(double *)(v6 + 8 * v4) = v5;
  if (v5 == 0.0)
  {
    *(void *)(*(void *)(a1 + 96) + 8 * v4) = 0;
    --*(_WORD *)(*(void *)(a1 + 32) + 28);
  }
  else
  {
    *(double *)(v6 + 8 * v4) = v5 / *(double *)(a1 + 88);
    int v7 = [*(id *)(a1 + 40) tableRowsBehavior];
    double v8 = 8.0;
    if (v7 == 1 && !*(unsigned char *)(a1 + 104)) {
      TSTMasterLayoutFittingHeightOfRow(*(void **)(a1 + 40), a2);
    }
    uint64_t v9 = *(void *)(a1 + 96);
    *(double *)(v9 + 8 * v4) = v8;
    *(double *)(v9 + 8 * v4) = v8 / *(double *)(a1 + 88);
    if (*(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) < 0.0
      || a2 - 1 != *(unsigned __int16 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = TSTMasterLayoutStrokeHeightOfGridRow(*(TSTMasterLayout **)(a1 + 40), a2, 0, 0xFFFFFFFF);
      *(_WORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a2;
    }
    *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = TSTMasterLayoutStrokeHeightOfGridRow(*(TSTMasterLayout **)(a1 + 40), (int)a2 + 1, 0, 0xFFFFFFFF);
    *(double *)(*(void *)(a1 + 96) + 8 * v4) = *(double *)(*(void *)(a1 + 96) + 8 * v4)
                                                 + (*(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
                                                  + *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                 * 0.5;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                            + 24);
    uint64_t v6 = *(void *)(a1 + 80);
  }
  double v10 = *(double *)(v6 + 8 * v4);
  uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
  double result = v10 + *(double *)(v11 + 24);
  *(double *)(v11 + 24) = result;
  return result;
}

double __83__TSTLayoutDynamicResizeInfo_p_captureRowColumnInformation_columnRegion_rowRegion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  unsigned __int8 v4 = a2 - *(unsigned char *)(*(void *)(a1 + 32) + 72);
  double v5 = TSTMasterLayoutWidthOfColumn(*(void *)(a1 + 40), a2, 1, 0, 1);
  uint64_t v6 = *(void *)(a1 + 80);
  *(double *)(v6 + 8 * v4) = v5;
  if (v5 == 0.0)
  {
    *(void *)(*(void *)(a1 + 96) + 8 * v4) = 0;
    --*(_WORD *)(*(void *)(a1 + 32) + 76);
  }
  else
  {
    *(double *)(v6 + 8 * v4) = v5 / *(double *)(a1 + 88);
    uint64_t v7 = *(void *)(a1 + 96);
    *(void *)(v7 + 8 * v4) = 0x4020000000000000;
    *(double *)(v7 + 8 * v4) = 8.0 / *(double *)(a1 + 88);
    if (*(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) < 0.0
      || v2 - 1 != *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = TSTMasterLayoutStrokeWidthOfGridColumn(*(TSTMasterLayout **)(a1 + 40), v2, 0, 0xFFFFFFFF);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v2;
    }
    *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = TSTMasterLayoutStrokeWidthOfGridColumn(*(TSTMasterLayout **)(a1 + 40), v2 + 1, 0, 0xFFFFFFFF);
    *(double *)(*(void *)(a1 + 96) + 8 * v4) = *(double *)(*(void *)(a1 + 96) + 8 * v4)
                                                 + (*(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
                                                  + *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
                                                 * 0.5;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                            + 24);
    uint64_t v6 = *(void *)(a1 + 80);
  }
  double v8 = *(double *)(v6 + 8 * v4);
  uint64_t v9 = *(void *)(*(void *)(a1 + 72) + 8);
  double result = v8 + *(double *)(v9 + 24);
  *(double *)(v9 + 24) = result;
  return result;
}

- (BOOL)valid
{
  return self->mValid;
}

- (void)invalidate
{
  self->mValid = 0;
}

- (BOOL)hasHeightForRow:(unsigned __int16)a3
{
  unsigned int mStartRowIndex = self->mStartRowIndex;
  BOOL v4 = a3 >= mStartRowIndex;
  unsigned __int16 v5 = a3 - mStartRowIndex;
  return v4 && self->mNumberOfRows > v5 && self->mCapturedRowHeights[v5] > 0.0;
}

- (BOOL)hasWidthForColumn:(unsigned __int8)a3
{
  unsigned int mStartColumnIndex = self->mStartColumnIndex;
  BOOL v4 = a3 >= mStartColumnIndex;
  unsigned __int8 v5 = a3 - mStartColumnIndex;
  return v4 && self->mNumberOfColumns > v5 && self->mCapturedColumnWidths[v5] > 0.0;
}

- (double)getRowInitialHeight:(unsigned __int16)a3
{
  mCapturedRowHeights = self->mCapturedRowHeights;
  double result = 0.0;
  if (mCapturedRowHeights)
  {
    unsigned int mStartRowIndex = self->mStartRowIndex;
    if (mStartRowIndex <= a3 && self->mNumberOfRows + mStartRowIndex > a3) {
      return mCapturedRowHeights[a3 - mStartRowIndex];
    }
  }
  return result;
}

- (double)getColumnInitialWidth:(unsigned __int8)a3
{
  mCapturedColumnWidths = self->mCapturedColumnWidths;
  double result = 0.0;
  if (mCapturedColumnWidths)
  {
    unsigned int mStartColumnIndex = self->mStartColumnIndex;
    if (mStartColumnIndex <= a3 && self->mNumberOfColumns + mStartColumnIndex > a3) {
      return mCapturedColumnWidths[a3 - mStartColumnIndex];
    }
  }
  return result;
}

- (double)getRowHeight:(unsigned __int16)a3
{
  mCurrentRowHeights = self->mCurrentRowHeights;
  double result = 0.0;
  if (mCurrentRowHeights)
  {
    unsigned int mStartRowIndex = self->mStartRowIndex;
    if (mStartRowIndex <= a3 && self->mNumberOfRows + mStartRowIndex > a3) {
      return mCurrentRowHeights[a3 - mStartRowIndex];
    }
  }
  return result;
}

- (double)getColumnWidth:(unsigned __int8)a3
{
  mCurrentColumnWidths = self->mCurrentColumnWidths;
  double result = 0.0;
  if (mCurrentColumnWidths)
  {
    unsigned int mStartColumnIndex = self->mStartColumnIndex;
    if (mStartColumnIndex <= a3 && self->mNumberOfColumns + mStartColumnIndex > a3) {
      return mCurrentColumnWidths[a3 - mStartColumnIndex];
    }
  }
  return result;
}

- (double)getRowHeightResize:(unsigned __int16)a3
{
  double v3 = 0.0;
  if (self->mCurrentRowHeights)
  {
    int v4 = a3;
    unsigned int mStartRowIndex = self->mStartRowIndex;
    if (mStartRowIndex <= a3
      && self->mNumberOfRows + mStartRowIndex > a3
      && [(TSTLayoutDynamicResizeInfo *)self hasHeightForRow:a3])
    {
      return self->mCurrentRowHeights[v4 - self->mStartRowIndex] - self->mCapturedRowHeights[v4 - self->mStartRowIndex];
    }
  }
  return v3;
}

- (double)getColumnWidthResize:(unsigned __int8)a3
{
  double v3 = 0.0;
  if (self->mCurrentColumnWidths)
  {
    int v4 = a3;
    unsigned int mStartColumnIndex = self->mStartColumnIndex;
    if (mStartColumnIndex <= a3
      && self->mNumberOfColumns + mStartColumnIndex > a3
      && [(TSTLayoutDynamicResizeInfo *)self hasWidthForColumn:a3])
    {
      return self->mCurrentColumnWidths[v4 - self->mStartColumnIndex]
           - self->mCapturedColumnWidths[v4 - self->mStartColumnIndex];
    }
  }
  return v3;
}

- (double)applyRowTotalHeight:(double)a3
{
  [(TSTLayoutDynamicResizeInfo *)self applyResizeHeightFactor:a3 / self->mCapturedRowHeightTotal];
  return result;
}

- (double)applyColumnTotalWidth:(double)a3
{
  [(TSTLayoutDynamicResizeInfo *)self applyResizeWidthFactor:a3 / self->mCapturedColumnWidthTotal];
  return result;
}

- (CGSize)capturedTableSize
{
  double mCapturedColumnWidthTotal = self->mCapturedColumnWidthTotal;
  double mCapturedRowHeightTotal = self->mCapturedRowHeightTotal;
  result.height = mCapturedRowHeightTotal;
  result.width = mCapturedColumnWidthTotal;
  return result;
}

- (void)enumerateColumnWidthsUsingBlock:(id)a3
{
  char v6 = 0;
  unsigned __int8 mStartColumnIndex = self->mStartColumnIndex;
  do
  {
    if (self->mNumberOfColumns + self->mStartColumnIndex <= mStartColumnIndex) {
      break;
    }
    if ([(TSTLayoutDynamicResizeInfo *)self hasWidthForColumn:mStartColumnIndex])
    {
      [(TSTLayoutDynamicResizeInfo *)self getColumnWidth:mStartColumnIndex];
      (*((void (**)(id, void, char *))a3 + 2))(a3, mStartColumnIndex, &v6);
    }
    ++mStartColumnIndex;
  }
  while (!v6);
}

- (void)enumerateRowHeightsUsingBlock:(id)a3
{
  char v6 = 0;
  unsigned __int16 mStartRowIndex = self->mStartRowIndex;
  do
  {
    if (self->mNumberOfRows + self->mStartRowIndex <= mStartRowIndex) {
      break;
    }
    if ([(TSTLayoutDynamicResizeInfo *)self hasHeightForRow:mStartRowIndex])
    {
      [(TSTLayoutDynamicResizeInfo *)self getRowHeight:mStartRowIndex];
      (*((void (**)(id, void, char *))a3 + 2))(a3, mStartRowIndex, &v6);
    }
    ++mStartRowIndex;
  }
  while (!v6);
}

- (id)rowHeights
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__25;
  double v10 = __Block_byref_object_dispose__25;
  id v11 = 0;
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__TSTLayoutDynamicResizeInfo_rowHeights__block_invoke;
  v5[3] = &unk_2646B32C8;
  v5[4] = &v6;
  [(TSTLayoutDynamicResizeInfo *)self enumerateRowHeightsUsingBlock:v5];
  double v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__TSTLayoutDynamicResizeInfo_rowHeights__block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithDouble:");

  return [v1 addObject:v2];
}

- (id)columnWidths
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__25;
  double v10 = __Block_byref_object_dispose__25;
  id v11 = 0;
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__TSTLayoutDynamicResizeInfo_columnWidths__block_invoke;
  v5[3] = &unk_2646B32F0;
  v5[4] = &v6;
  [(TSTLayoutDynamicResizeInfo *)self enumerateColumnWidthsUsingBlock:v5];
  double v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__TSTLayoutDynamicResizeInfo_columnWidths__block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithDouble:");

  return [v1 addObject:v2];
}

@end