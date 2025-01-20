@interface TSTTablePartitioner
- ($CA3468F20078D5D2DB35E78E73CA60DA)measureCellRangeForNextPartitionOfSize:(CGSize)a3 previousHint:(id)a4 horizontally:(BOOL)a5;
- (BOOL)didHint:(id)a3 syncWithNextHint:(id)a4 horizontally:(BOOL)a5 delta:(int)a6;
- (BOOL)p_didFinishPartitioningHint:(id)a3 horizontally:(BOOL)a4;
- (BOOL)scaleIsValid;
- (BOOL)shouldReuseLayout:(id)a3 forSize:(CGSize)a4 parentLayout:(id)a5 hint:(id)a6;
- (CGSize)scaleToFit;
- (TSDInfoGeometry)infoGeometry;
- (TSTLayout)scaledLayout;
- (TSTTableInfo)tableInfo;
- (TSTTablePartitioner)initWithInfo:(id)a3;
- (double)inlineTableWidth;
- (id)hintCacheKeyForHint:(id)a3;
- (id)hintCacheKeyForPartitioningPass:(id)a3 andHintID:(id)a4;
- (id)hintForLayout:(id)a3;
- (id)layoutForHint:(id)a3 parentLayout:(id)a4;
- (id)nextHintForSize:(CGSize)a3 parentLayout:(id)a4 previousHint:(id)a5 horizontally:(BOOL)a6 outFinished:(BOOL *)a7;
- (id)nextLayoutForSize:(CGSize)a3 parentLayout:(id)a4 previousHint:(id)a5 horizontally:(BOOL)a6 outFinished:(BOOL *)a7;
- (id)partitioningPassForFirstPartitionSize:(CGSize)a3;
- (id)partitioningPassForHint:(id)a3 withPreviousHint:(id)a4;
- (void)dealloc;
- (void)p_flushCacheAfterPartitioningFinished:(id)a3 lastHint:(id)a4 horizontally:(BOOL)a5;
- (void)setInfoGeometry:(id)a3;
- (void)setScaleToFit:(CGSize)a3;
- (void)validateScaledLayout;
@end

@implementation TSTTablePartitioner

- (TSTTablePartitioner)initWithInfo:(id)a3
{
  objc_opt_class();
  v4 = (TSTTableInfo *)TSUDynamicCast();
  if (!v4)
  {
    v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSTTablePartitioner initWithInfo:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTablePartitioner.m"), 56, @"Incorrect info class in the table partitioner!");
  }
  v15.receiver = self;
  v15.super_class = (Class)TSTTablePartitioner;
  v7 = [(TSTTablePartitioner *)&v15 init];
  v8 = v7;
  if (v7)
  {
    v7->mTableInfo = v4;
    v7->mFirstPartitionWidth = -1.0;
    if ([(TSDDrawableInfo *)v4 isInlineWithText]) {
      _Q0 = (CGSize)*MEMORY[0x263F001B0];
    }
    else {
      __asm { FMOV            V0.2D, #1.0 }
    }
    v8->mScaleToFit = _Q0;
    v8->mHintMatricesByCanvas = (TSUPointerKeyDictionary *)objc_alloc_init(MEMORY[0x263F7C8A8]);
    v8->mPartitioningPassCache = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v8->mScaledLayout = 0;
    [(TSTTablePartitioner *)v8 setInfoGeometry:[(TSDDrawableInfo *)v4 geometry]];
  }
  return v8;
}

- (void)dealloc
{
  objc_msgSend((id)-[TSUPointerKeyDictionary allValues](self->mHintMatricesByCanvas, "allValues"), "makeObjectsPerformSelector:", sel_removeAllObjects);
  [(TSUPointerKeyDictionary *)self->mHintMatricesByCanvas removeAllObjects];

  self->mHintMatricesByCanvas = 0;
  self->mPartitioningPassCache = 0;
  self->mTableInfo = 0;

  self->mScaledLayout = 0;
  self->mInfoGeometry = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSTTablePartitioner;
  [(TSTTablePartitioner *)&v3 dealloc];
}

- (void)setScaleToFit:(CGSize)a3
{
  self->mScaleToFit = a3;
}

- (void)validateScaledLayout
{
  objc_super v3 = [(TSTTableInfo *)[(TSTTablePartitioner *)self tableInfo] masterLayout];
  [(TSTMasterLayout *)v3 maximumPartitionSize];
  double v5 = v4;
  double v7 = v6;
  -[TSTMasterLayout setMaximumPartitionSize:](v3, "setMaximumPartitionSize:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  [(TSTLayout *)[(TSTTablePartitioner *)self scaledLayout] validate];

  -[TSTMasterLayout setMaximumPartitionSize:](v3, "setMaximumPartitionSize:", v5, v7);
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)measureCellRangeForNextPartitionOfSize:(CGSize)a3 previousHint:(id)a4 horizontally:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a3.height;
  double width = a3.width;
  v10 = [(TSTTablePartitioner *)self scaledLayout];
  v11 = [(TSTTableInfo *)[(TSTTablePartitioner *)self tableInfo] masterLayout];
  BOOL v69 = [(TSDDrawableInfo *)[(TSTTablePartitioner *)self tableInfo] isInlineWithText];
  [(TSTTablePartitioner *)self validateScaledLayout];
  if (!a4)
  {
    LODWORD(range1_8) = 0;
    LOWORD(v68) = 0;
    LOBYTE(v16) = 0;
    int v17 = 0;
    goto LABEL_14;
  }
  unint64_t v12 = [a4 cellRange];
  if ((_WORD)v12 == 0xFFFF || (v12 & 0xFF0000) == 0xFF0000 || !HIWORD(v12) || (v12 & 0xFFFF00000000) == 0)
  {
    v13 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v14 = [NSString stringWithUTF8String:"-[TSTTablePartitioner measureCellRangeForNextPartitionOfSize:previousHint:horizontally:]"];
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTablePartitioner.m"), 114, @"Partitioner can't continue from an invalid range.");
  }
  unint64_t v15 = [a4 cellRange];
  if (!v5)
  {
    int v17 = HIWORD(v15) + v15;
    unint64_t v16 = (unint64_t)[a4 cellRange] >> 16;
    [a4 maximumSize];
    if (width == v19)
    {
      LODWORD(range1_8) = 0;
      unint64_t v68 = (unint64_t)[a4 cellRange] >> 32;
      goto LABEL_14;
    }
LABEL_13:
    LODWORD(range1_8) = 0;
    LOWORD(v68) = 0;
    goto LABEL_14;
  }
  LODWORD(v16) = HIDWORD(v15) + WORD1(v15);
  int v17 = [a4 cellRange];
  [a4 maximumSize];
  if (height != v18) {
    goto LABEL_13;
  }
  unint64_t range1_8 = (unint64_t)[a4 cellRange] >> 48;
  LOWORD(v68) = 0;
LABEL_14:
  unint64_t Range = TSTMasterLayoutGetRange((uint64_t)v11);
  unsigned int TableNumberOfRows = TSTMasterLayoutGetTableNumberOfRows((uint64_t)v11);
  unsigned int TableNumberOfColumns = TSTMasterLayoutGetTableNumberOfColumns((uint64_t)v11);
  uint64_t TableNumberOfHeaderRows = TSTMasterLayoutGetTableNumberOfHeaderRows((unsigned __int16 *)v11);
  unsigned int TableNumberOfHeaderColumns = TSTMasterLayoutGetTableNumberOfHeaderColumns((unsigned __int16 *)v11);
  unsigned int v64 = TableNumberOfRows;
  unsigned int TableNumberOfFooterRows = TSTMasterLayoutGetTableNumberOfFooterRows((unsigned __int16 *)v11);
  uint64_t v70 = TableNumberOfRows;
  BOOL v24 = [(TSTTableModel *)[(TSTTableInfo *)[(TSTTablePartitioner *)self tableInfo] tableModel] repeatingHeaderRowsEnabled];
  BOOL v25 = [(TSTTableModel *)[(TSTTableInfo *)[(TSTTablePartitioner *)self tableInfo] tableModel] repeatingHeaderColumnsEnabled];
  if (v24 && (_WORD)v17)
  {
    if (TableNumberOfColumns >= 0xFF) {
      uint64_t v26 = 255;
    }
    else {
      uint64_t v26 = TableNumberOfColumns;
    }
    TSTLayoutGetStrokeFrameForRange(v10, (v26 << 32) | (TableNumberOfHeaderRows << 48));
    double height = height - v27;
  }
  if ((_BYTE)v16) {
    BOOL v28 = v25;
  }
  else {
    BOOL v28 = 0;
  }
  if (v28)
  {
    if (TableNumberOfHeaderColumns >= 0xFF) {
      uint64_t v29 = 255;
    }
    else {
      uint64_t v29 = TableNumberOfHeaderColumns;
    }
    TSTLayoutGetStrokeFrameForRange(v10, (v70 << 48) | (v29 << 32));
    double width = width - v30;
  }
  TSTLayoutGetTableNameHeight((uint64_t)v10);
  unsigned int range1 = TableNumberOfHeaderRows;
  if (!(_WORD)v17)
  {
    double v32 = v31;
    int TableNameVisible = TSTLayoutGetTableNameVisible((uint64_t)v10);
    double v34 = 0.0;
    if (TableNameVisible) {
      double v34 = v32;
    }
    double height = height - v34;
  }
  if (width > 0.0) {
    double v35 = width;
  }
  else {
    double v35 = 0.0;
  }
  if (height <= 0.0) {
    double height = 0.0;
  }
  double CanvasStrokeFrameForRange = TSTLayoutGetCanvasStrokeFrameForRange(v10, (unsigned __int16)v17 | (v16 << 16) | 0x1000100000000);
  CGFloat v38 = v37;
  CGFloat v40 = v39;
  CGFloat v42 = v41;
  double v43 = v35 + CanvasStrokeFrameForRange;
  double v44 = height + v37;
  unsigned int CellIDHitByCanvasPoint = TSTLayoutGetCellIDHitByCanvasPoint(v10, v43, v44);
  unsigned __int16 v46 = CellIDHitByCanvasPoint;
  unsigned int v47 = HIWORD(CellIDHitByCanvasPoint);
  v74.origin.x = CanvasStrokeFrameForRange;
  v74.origin.y = v38;
  v74.size.double width = v40;
  v74.size.double height = v42;
  if (CGRectGetMinX(v74) <= v43)
  {
    v75.origin.x = CanvasStrokeFrameForRange;
    v75.origin.y = v38;
    v75.size.double width = v40;
    v75.size.double height = v42;
    if (CGRectGetMaxX(v75) >= v43) {
      LOBYTE(v47) = v16;
    }
  }
  v76.origin.x = CanvasStrokeFrameForRange;
  v76.origin.y = v38;
  v76.size.double width = v40;
  v76.size.double height = v42;
  if (CGRectGetMinY(v76) <= v44)
  {
    v77.origin.x = CanvasStrokeFrameForRange;
    v77.origin.y = v38;
    v77.size.double width = v40;
    v77.size.double height = v42;
    if (CGRectGetMaxY(v77) >= v44) {
      unsigned __int16 v46 = v17;
    }
  }
  int v48 = v46;
  if ((unsigned __int16)v17 > v46) {
    int v48 = (unsigned __int16)v17;
  }
  if (v16 <= v47) {
    unsigned int v47 = v47;
  }
  else {
    unsigned int v47 = v16;
  }
  if (v48 == 0xFFFF) {
    uint64_t v49 = (v70 - v17);
  }
  else {
    uint64_t v49 = range1_8;
  }
  if (v47 == 255) {
    unsigned __int16 v50 = TableNumberOfColumns - v16;
  }
  else {
    unsigned __int16 v50 = v68;
  }
  if (!(_WORD)v49)
  {
    unsigned int v51 = v64 + ~TableNumberOfFooterRows;
    unsigned int v52 = v48 - v17;
    if ((unsigned __int16)v17 >= v46) {
      ++v52;
    }
    if ((unsigned __int16)(v52 - 1) < range1 && (unsigned __int16)v17 == 0) {
      uint64_t v49 = range1 + 1;
    }
    else {
      uint64_t v49 = v52;
    }
    if ((unsigned __int16)(v17 + v49 - 1) >= (unsigned __int16)v51
      && (unsigned __int16)(Range + HIWORD(Range) - 1) != (unsigned __int16)(v17 + v49 - 1))
    {
      v72.location = range1;
      v72.length = v70 - (TableNumberOfFooterRows + (unint64_t)range1);
      v73.location = (unsigned __int16)v17;
      v73.length = (unsigned __int16)v49;
      if (NSIntersectionRange(v72, v73).length < 2) {
        uint64_t v49 = HIWORD(Range) - v17;
      }
      else {
        uint64_t v49 = v51 - v17;
      }
    }
  }
  if (v69)
  {
    unsigned __int16 v54 = [(TSTTableModel *)[(TSTTableInfo *)[(TSTTablePartitioner *)self tableInfo] tableModel] numberOfColumns];
    unsigned __int8 v55 = 0;
  }
  else
  {
    __int16 v56 = v47 - v16;
    if (!v56) {
      __int16 v56 = 1;
    }
    if (TableNumberOfHeaderColumns > (v56 - 1)) {
      __int16 v57 = TableNumberOfHeaderColumns + 1;
    }
    else {
      __int16 v57 = v56;
    }
    if ((_BYTE)v16)
    {
      unsigned __int8 v58 = v16;
    }
    else
    {
      __int16 v56 = v57;
      unsigned __int8 v58 = 0;
    }
    if (v50) {
      unsigned __int16 v54 = v50;
    }
    else {
      unsigned __int16 v54 = v56;
    }
    if (v50) {
      unsigned __int8 v55 = v16;
    }
    else {
      unsigned __int8 v55 = v58;
    }
  }
  unint64_t v59 = (unsigned __int16)v17 | ((unint64_t)v55 << 16) | (v49 << 48) | ((unint64_t)v54 << 32);
  if ((_WORD)v17 == 0xFFFF || v55 == 0xFF || !v54 || !HIWORD(v59))
  {
    v60 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v61 = [NSString stringWithUTF8String:"-[TSTTablePartitioner measureCellRangeForNextPartitionOfSize:previousHint:horizontally:]"];
    objc_msgSend(v60, "handleFailureInFunction:file:lineNumber:description:", v61, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTablePartitioner.m"), 262, @"Partitioner measured an invalid range.");
  }
  return ($CA3468F20078D5D2DB35E78E73CA60DA)v59;
}

- (id)nextHintForSize:(CGSize)a3 parentLayout:(id)a4 previousHint:(id)a5 horizontally:(BOOL)a6 outFinished:(BOOL *)a7
{
  BOOL v8 = a6;
  double height = a3.height;
  CGFloat width = a3.width;
  objc_opt_class();
  uint64_t v14 = TSUDynamicCast();
  unint64_t v15 = (void *)v14;
  if (a5 && !v14)
  {
    unint64_t v16 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v17 = [NSString stringWithUTF8String:"-[TSTTablePartitioner nextHintForSize:parentLayout:previousHint:horizontally:outFinished:]"];
    [v16 handleFailureInFunction:v17, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTablePartitioner.m"), 269, @"previousHint must be nil, or of type TSTLayoutHint." file lineNumber description];
  }
  if ([v15 layout]
    && (TSTTableInfo *)objc_msgSend((id)objc_msgSend(v15, "layout"), "info") != self->mTableInfo)
  {
    double v18 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v19 = [NSString stringWithUTF8String:"-[TSTTablePartitioner nextHintForSize:parentLayout:previousHint:horizontally:outFinished:]"];
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTablePartitioner.m"), 270, @"Hint is for the wrong table info.");
  }
  if (v15)
  {
    if ([(TSTTablePartitioner *)self p_didFinishPartitioningHint:v15 horizontally:v8])
    {
      return 0;
    }
    unsigned int v24 = [v15 cacheHintID];
    unsigned int v21 = HIBYTE(v24);
    if (v8) {
      unsigned __int8 v22 = BYTE2(v24) + 1;
    }
    else {
      unsigned __int8 v22 = BYTE2(v24);
    }
    if (v8) {
      unsigned __int16 v23 = v24;
    }
    else {
      unsigned __int16 v23 = v24 + 1;
    }
  }
  else
  {
    unsigned int v21 = 0;
    unsigned __int8 v22 = 0;
    unsigned __int16 v23 = 0;
  }
  uint64_t v25 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "rootLayout"), "layoutController"), "canvas");
  if (!v25) {
    uint64_t v25 = [MEMORY[0x263EFF9D0] null];
  }
  if (![(TSUPointerKeyDictionary *)self->mHintMatricesByCanvas objectForKey:v25]) {
    [(TSUPointerKeyDictionary *)self->mHintMatricesByCanvas setObject:objc_alloc_init(MEMORY[0x263EFF9A0]) forUncopiedKey:v25];
  }
  v20 = objc_alloc_init(TSTLayoutHint);
  uint64_t v26 = [(TSTTableInfo *)[(TSTTablePartitioner *)self tableInfo] masterLayout];
  [(TSTMasterLayout *)v26 maximumPartitionSize];
  [(TSTMasterLayout *)v26 setMaximumPartitionSize:TSDSizeWithMaxArea(v27, v28, width, height)];
  [(TSTTablePartitioner *)self scaleToFit];
  double v31 = *MEMORY[0x263F001B0];
  double v30 = *(double *)(MEMORY[0x263F001B0] + 8);
  if (*MEMORY[0x263F001B0] == v32
    && v30 == v29
    && ![(TSDDrawableInfo *)self->mTableInfo isInlineWithText])
  {
    -[TSTTablePartitioner setScaleToFit:](self, "setScaleToFit:", 1.0, 1.0);
  }
  else if ([(TSDDrawableInfo *)self->mTableInfo isInlineWithText])
  {
    if (self->mFirstPartitionWidth != width && !(v23 | ((unint64_t)v22 << 16))
      || ([(TSTTablePartitioner *)self scaleToFit], v34 == v31) && v33 == v30
      || ([(TSDInfoGeometry *)[(TSTTablePartitioner *)self infoGeometry] size],
          double v36 = v35,
          double v38 = v37,
          [(TSDInfoGeometry *)[(TSDDrawableInfo *)[(TSTTablePartitioner *)self tableInfo] geometry] size], v36 != v40)|| v38 != v39)
    {
      [(TSTLayout *)[(TSTTablePartitioner *)self scaledLayout] scaleToFit];
      if (v42 != 1.0
        || v41 != 1.0
        || ([(TSDInfoGeometry *)[(TSTTablePartitioner *)self infoGeometry] size],
            double v44 = v43,
            double v46 = v45,
            [(TSDInfoGeometry *)[(TSDDrawableInfo *)[(TSTTablePartitioner *)self tableInfo] geometry] size], v44 != v48)|| v46 != v47)
      {
        unsigned int v49 = v21;
        unsigned __int16 v50 = [(TSTTablePartitioner *)self scaledLayout];
        $CA3468F20078D5D2DB35E78E73CA60DA v51 = [(TSTTableModel *)[(TSTTableInfo *)self->mTableInfo tableModel] range];
        unsigned int v52 = v50;
        unsigned int v21 = v49;
        ((void (*)(void, void))TSTLayoutInvalidateCellRange)(v52, v51);
      }
      -[TSTTablePartitioner setScaleToFit:](self, "setScaleToFit:", 1.0, 1.0);
      [(TSTTablePartitioner *)self validateScaledLayout];
      [(TSTLayout *)[(TSTTablePartitioner *)self scaledLayout] computeLayoutGeometry];
      double StrokeFrame = TSTLayoutGetStrokeFrame([(TSTTablePartitioner *)self scaledLayout]);
      double v55 = v54;
      [(TSTLayout *)[(TSTTablePartitioner *)self scaledLayout] alignmentFrame];
      double v57 = width - (v56 - v55);
      double v58 = 1.0;
      if (v55 > v57) {
        double v58 = v57 / v55;
      }
      -[TSTTablePartitioner setScaleToFit:](self, "setScaleToFit:", v58, 1.0);
      self->mFirstPartitionWidth = width;
      [(TSTTablePartitioner *)self scaleToFit];
      -[TSTLayout setScaleToFit:]([(TSTTablePartitioner *)self scaledLayout], "setScaleToFit:", v59, v60);
      [(TSTTablePartitioner *)self scaleToFit];
      if (v62 != 1.0 || v61 != 1.0)
      {
        [(TSTMasterLayout *)v26 addChangeDescriptor:+[TSTChangeDescriptor changeDescriptorWithType:33 cellRange:[(TSTTableModel *)[(TSTTableInfo *)[(TSTTablePartitioner *)self tableInfo] tableModel] range]]];
        TSTLayoutInvalidateCellRange([(TSTTablePartitioner *)self scaledLayout], [(TSTTableModel *)[(TSTTableInfo *)self->mTableInfo tableModel] range]);
      }
    }
  }
  $CA3468F20078D5D2DB35E78E73CA60DA v63 = -[TSTTablePartitioner measureCellRangeForNextPartitionOfSize:previousHint:horizontally:](self, "measureCellRangeForNextPartitionOfSize:previousHint:horizontally:", v15, v8, width, height);
  [(TSTTablePartitioner *)self setInfoGeometry:[(TSDDrawableInfo *)self->mTableInfo geometry]];
  [(TSTLayoutHint *)v20 setCacheHintID:((unint64_t)v21 << 24) | ((unint64_t)v22 << 16) | v23];
  [(TSTLayoutHint *)v20 setCellRange:v63];
  -[TSTLayoutHint setMaximumSize:](v20, "setMaximumSize:", width, height);
  [(TSTLayoutHint *)v20 setHorizontal:v8];
  [(TSTLayoutHint *)v20 setPartitioningPass:[(TSTTablePartitioner *)self partitioningPassForHint:v20 withPreviousHint:v15]];
  if (a7) {
    *a7 = [(TSTTablePartitioner *)self p_didFinishPartitioningHint:v20 horizontally:v8];
  }
  return v20;
}

- (id)nextLayoutForSize:(CGSize)a3 parentLayout:(id)a4 previousHint:(id)a5 horizontally:(BOOL)a6 outFinished:(BOOL *)a7
{
  id result = -[TSTTablePartitioner nextHintForSize:parentLayout:previousHint:horizontally:outFinished:](self, "nextHintForSize:parentLayout:previousHint:horizontally:outFinished:", a4, a5, a6, a7, a3.width, a3.height);
  if (result)
  {
    return [(TSTTablePartitioner *)self layoutForHint:result parentLayout:a4];
  }
  return result;
}

- (id)layoutForHint:(id)a3 parentLayout:(id)a4
{
  objc_opt_class();
  uint64_t v7 = TSUDynamicCast();
  if (!v7) {
    return 0;
  }
  BOOL v8 = (void *)v7;
  uint64_t v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "rootLayout"), "layoutController"), "canvas");
  if (!v9) {
    uint64_t v9 = [MEMORY[0x263EFF9D0] null];
  }
  id v10 = (id)[(TSUPointerKeyDictionary *)self->mHintMatricesByCanvas objectForKey:v9];
  if (!v10)
  {
    id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(TSUPointerKeyDictionary *)self->mHintMatricesByCanvas setObject:v10 forUncopiedKey:v9];
  }
  v11 = objc_msgSend(v10, "objectForKey:", -[TSTTablePartitioner hintCacheKeyForHint:](self, "hintCacheKeyForHint:", a3));
  uint64_t v12 = [v11 layout];
  id v13 = (id)v12;
  if (v11)
  {
    uint64_t v14 = [v11 cellRange];
    uint64_t v15 = [v8 cellRange];
    if (v13)
    {
      [v13 scaleToFit];
      double v17 = v16;
      double v19 = v18;
      [v8 maximumSize];
      if (-[TSTTablePartitioner shouldReuseLayout:forSize:parentLayout:hint:](self, "shouldReuseLayout:forSize:parentLayout:hint:", v13, a4, v8))
      {
        int v20 = 1;
        goto LABEL_18;
      }
      [v8 setLayout:0];
      goto LABEL_17;
    }
    double v17 = 1.0;
  }
  else
  {
    double v17 = 1.0;
    uint64_t v15 = 0xFFFFFFLL;
    if (v12)
    {
      int v20 = 0;
      uint64_t v14 = 0xFFFFFFLL;
      double v19 = 1.0;
      goto LABEL_18;
    }
    uint64_t v14 = 0xFFFFFFLL;
  }
  double v19 = 1.0;
LABEL_17:
  id v13 = (id)objc_msgSend(objc_alloc(-[TSTTableInfo layoutClass](-[TSTTablePartitioner tableInfo](self, "tableInfo"), "layoutClass")), "initWithInfo:layoutHint:", self->mTableInfo, v8);
  int v20 = 0;
LABEL_18:
  [v8 setLayout:v13];
  [v13 setLayoutHint:v8];
  TSTLayoutSetPartitionRange(v13);
  [v8 setIsValid:1];
  if (!v20) {
    goto LABEL_35;
  }
  BOOL v21 = [(TSDDrawableInfo *)[(TSTTablePartitioner *)self tableInfo] isInlineWithText];
  [(TSTTablePartitioner *)self scaleToFit];
  if (v23 == v17 && v22 == v19)
  {
    if (((v14 ^ v15) & 0xFFFFFFFF00FFFFFFLL) == 0) {
      goto LABEL_33;
    }
    if (BYTE2(v15) < BYTE2(v14))
    {
      TSTLayoutInvalidateColumns(v13);
      BOOL v21 = 1;
    }
    if ((BYTE4(v15) + BYTE2(v15) - 1) > (BYTE4(v14) + BYTE2(v14) - 1))
    {
      TSTLayoutInvalidateColumns(v13);
      BOOL v21 = 1;
    }
    if ((unsigned __int16)v15 < (unsigned __int16)v14)
    {
      TSTLayoutInvalidateRows(v13);
      BOOL v21 = 1;
    }
    if ((unsigned __int16)(v15 + HIWORD(v15) - 1) > (unsigned __int16)(v14 - 1 + HIWORD(v14)))
    {
      TSTLayoutInvalidateRows(v13);
      BOOL v21 = 1;
    }
    unsigned int v24 = (void *)[v13 containedTextEditingLayout];
    if (v24)
    {
      uint64_t v25 = v24;
      [v24 invalidateTextLayout];
      [v13 invalidateForAutosizingTextLayout:v25];
    }
    else
    {
LABEL_33:
      if (!v21) {
        goto LABEL_35;
      }
    }
  }
  else
  {
    TSTLayoutInvalidateCellRange(v13, [v8 cellRange]);
  }
  TSTLayoutInvalidateLayoutSpaceCoordinates(v13);
  TSTLayoutInvalidateLayoutSpaceTableOffsets(v13);
  [v13 invalidateSize];
  [v13 setNeedsDisplay];
LABEL_35:
  objc_msgSend(v10, "setObject:forKey:", v8, -[TSTTablePartitioner hintCacheKeyForHint:](self, "hintCacheKeyForHint:", v8));
  if (-[TSTTablePartitioner p_didFinishPartitioningHint:horizontally:](self, "p_didFinishPartitioningHint:horizontally:", v8, [v8 horizontal]))
  {
    -[TSTTablePartitioner p_flushCacheAfterPartitioningFinished:lastHint:horizontally:](self, "p_flushCacheAfterPartitioningFinished:lastHint:horizontally:", v10, v8, [v8 horizontal]);
  }
  return v13;
}

- (BOOL)didHint:(id)a3 syncWithNextHint:(id)a4 horizontally:(BOOL)a5 delta:(int)a6
{
  BOOL v6 = a5;
  objc_opt_class();
  uint64_t v7 = (void *)TSUDynamicCast();
  objc_opt_class();
  uint64_t v8 = TSUDynamicCast();
  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9) {
    return 0;
  }
  id v10 = (void *)v8;
  uint64_t v11 = objc_msgSend((id)objc_msgSend(v7, "layout"), "tableInfo");
  if (v11 != objc_msgSend((id)objc_msgSend(v10, "layout"), "tableInfo")) {
    return 0;
  }
  uint64_t v13 = [v7 cellRange];
  if (v6)
  {
    if ((BYTE4(v13) + BYTE2(v13) - 1) + 1 == ([v10 cellRange] >> 16))
    {
      int v14 = (unsigned __int16)[v7 cellRange];
      if (v14 == (unsigned __int16)[v10 cellRange])
      {
        uint64_t v15 = [v7 cellRange];
        int v16 = (unsigned __int16)(v15 + HIWORD(v15));
        uint64_t v17 = [v10 cellRange];
        return v16 == (unsigned __int16)(v17 + HIWORD(v17));
      }
    }
    return 0;
  }
  if ((unsigned __int16)(v13 + HIWORD(v13) - 1) + 1 != (unsigned __int16)[v10 cellRange]) {
    return 0;
  }
  int v19 = ([v7 cellRange] >> 16);
  if (v19 != ([v10 cellRange] >> 16)) {
    return 0;
  }
  uint64_t v20 = [v7 cellRange];
  int v21 = (BYTE4(v20) + BYTE2(v20));
  uint64_t v22 = [v10 cellRange];
  return v21 == (BYTE4(v22) + BYTE2(v22));
}

- (BOOL)p_didFinishPartitioningHint:(id)a3 horizontally:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = [(TSTTableInfo *)[(TSTTablePartitioner *)self tableInfo] masterLayout];
  if (!a3) {
    return 0;
  }
  uint64_t v7 = (uint64_t)v6;
  uint64_t Range = TSTMasterLayoutGetRange((uint64_t)v6);
  unint64_t RangeForHint = TSTMasterLayoutGetRangeForHint(v7, a3);
  if (v4)
  {
    unsigned int v10 = (BYTE4(Range) + BYTE2(Range) - 1);
    unsigned int v11 = (BYTE4(RangeForHint) + BYTE2(RangeForHint) - 1);
    if (v10 < v11)
    {
      uint64_t v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v13 = [NSString stringWithUTF8String:"-[TSTTablePartitioner p_didFinishPartitioningHint:horizontally:]"];
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTablePartitioner.m"), 548, @"Horizontal partitioning went beyond the table bounds!");
    }
    BOOL v14 = v10 > v11;
  }
  else
  {
    unsigned int v16 = (unsigned __int16)(Range + HIWORD(Range) - 1);
    int v17 = RangeForHint + HIWORD(RangeForHint) - 1;
    if (v16 < (unsigned __int16)(RangeForHint + HIWORD(RangeForHint) - 1))
    {
      double v18 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v19 = [NSString stringWithUTF8String:"-[TSTTablePartitioner p_didFinishPartitioningHint:horizontally:]"];
      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTablePartitioner.m"), 551, @"Vertical partitioning went beyond the table bounds!");
    }
    BOOL v14 = v16 > (unsigned __int16)v17;
  }
  return !v14;
}

- (id)hintForLayout:(id)a3
{
  objc_opt_class();
  id result = (id)TSUDynamicCast();
  if (result)
  {
    return (id)[result layoutHint];
  }
  return result;
}

- (BOOL)shouldReuseLayout:(id)a3 forSize:(CGSize)a4 parentLayout:(id)a5 hint:(id)a6
{
  return !a5 || !objc_msgSend(a3, "parent", a4.width, a4.height) || (id)objc_msgSend(a3, "parent") == a5;
}

- (BOOL)scaleIsValid
{
  [(TSTTablePartitioner *)self scaleToFit];
  return v3 != *(double *)(MEMORY[0x263F001B0] + 8) || v2 != *MEMORY[0x263F001B0];
}

- (TSTLayout)scaledLayout
{
  id result = self->mScaledLayout;
  if (!result)
  {
    id result = (TSTLayout *)objc_msgSend(objc_alloc(-[TSTTableInfo layoutClass](-[TSTTablePartitioner tableInfo](self, "tableInfo"), "layoutClass")), "initWithInfo:", self->mTableInfo);
    self->mScaledLayout = result;
  }
  return result;
}

- (id)partitioningPassForFirstPartitionSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  if (a3.width == *MEMORY[0x263F001B0] && a3.height == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    uint64_t v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSTTablePartitioner partitioningPassForFirstPartitionSize:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTablePartitioner.m"), 599, @"partitioningPassForFirstPartitionSize: Invalid partition size");
  }
  v11.CGFloat width = width;
  v11.CGFloat height = height;
  BOOL v9 = (void *)[(NSMutableDictionary *)self->mPartitioningPassCache objectForKey:NSStringFromCGSize(v11)];
  if (!v9)
  {
    BOOL v9 = (void *)[NSNumber numberWithUnsignedInt:random()];
    v12.CGFloat width = width;
    v12.CGFloat height = height;
    [(NSMutableDictionary *)self->mPartitioningPassCache setObject:v9 forKey:NSStringFromCGSize(v12)];
  }
  return v9;
}

- (id)partitioningPassForHint:(id)a3 withPreviousHint:(id)a4
{
  uint64_t v7 = [a3 cacheHintID];
  if (a4 && (v7 & 0xFFFFFF) != 0)
  {
    if ([a4 partitioningPass])
    {
      return (id)[a4 partitioningPass];
    }
    else
    {
      BOOL v9 = NSNumber;
      return (id)[v9 numberWithUnsignedInt:0];
    }
  }
  else
  {
    [a3 maximumSize];
    return -[TSTTablePartitioner partitioningPassForFirstPartitionSize:](self, "partitioningPassForFirstPartitionSize:");
  }
}

- (id)hintCacheKeyForPartitioningPass:(id)a3 andHintID:(id)a4
{
  return (id)[NSString stringWithFormat:@"(%@,%@)", a3, objc_msgSend(NSString, "stringWithFormat:", @"(%hu, %hu)", a4.var1, a4.var0)];
}

- (id)hintCacheKeyForHint:(id)a3
{
  uint64_t v5 = [a3 partitioningPass];
  uint64_t v6 = [a3 cacheHintID];

  return [(TSTTablePartitioner *)self hintCacheKeyForPartitioningPass:v5 andHintID:v6];
}

- (void)p_flushCacheAfterPartitioningFinished:(id)a3 lastHint:(id)a4 horizontally:(BOOL)a5
{
  int v6 = a5;
  if (!a3)
  {
    unsigned int v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    unint64_t v5 = [NSString stringWithUTF8String:"-[TSTTablePartitioner p_flushCacheAfterPartitioningFinished:lastHint:horizontally:]"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTablePartitioner.m"), 636, @"invalid nil value for '%s'", "cache");
  }
  unsigned int v11 = [a4 cacheHintID];
  unsigned int v12 = v11 & 0xFF000000;
  uint64_t v13 = [a4 partitioningPass];
  if (v6) {
    int v14 = HIWORD(v11) + 1;
  }
  else {
    int v14 = 0;
  }
  if (v6) {
    unsigned int v15 = 0;
  }
  else {
    unsigned int v15 = v11 + 1;
  }
  id v16 = [(TSTTablePartitioner *)self hintCacheKeyForPartitioningPass:v13 andHintID:(unsigned __int16)v15 | (v14 << 16) | v12];
  if ([a3 objectForKey:v16])
  {
    while (1)
    {
      if ((~-[TSTTableInfo editingCellID](-[TSTTablePartitioner tableInfo](self, "tableInfo"), "editingCellID") & 0xFFFFFF) == 0)[a3 removeObjectForKey:v16]; {
      v14 += v6 ^ 1;
      }
      v15 += v6;
      unint64_t v5 = v5 & 0xFFFFFFFF00000000 | (unsigned __int16)v15 | (v14 << 16) | v12;
      id v16 = [(TSTTablePartitioner *)self hintCacheKeyForPartitioningPass:v13 andHintID:v5];
      if (![a3 objectForKey:v16])
      {
        if (v6) {
          ++v14;
        }
        else {
          int v14 = 0;
        }
        if (v6) {
          unsigned int v15 = 0;
        }
        else {
          ++v15;
        }
        unint64_t v17 = v17 & 0xFFFFFFFF00000000 | (unsigned __int16)v15 | (v14 << 16) | v12;
        id v16 = -[TSTTablePartitioner hintCacheKeyForPartitioningPass:andHintID:](self, "hintCacheKeyForPartitioningPass:andHintID:", v13);
        if (![a3 objectForKey:v16]) {
          break;
        }
      }
    }
  }
}

- (TSTTableInfo)tableInfo
{
  return self->mTableInfo;
}

- (double)inlineTableWidth
{
  return self->mFirstPartitionWidth;
}

- (CGSize)scaleToFit
{
  double width = self->mScaleToFit.width;
  double height = self->mScaleToFit.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (TSDInfoGeometry)infoGeometry
{
  return self->mInfoGeometry;
}

- (void)setInfoGeometry:(id)a3
{
}

@end