@interface PFXTable
+ (void)ensure2DStrokeArray:(id)a3 hasDim1:(unsigned __int16)a4 dim2:(unsigned __int16)a5;
+ (void)initialize;
+ (void)setStrokeProperty:(int)a3 value:(id)a4 cellPropertyMap:(id)a5;
- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)addCellWithSize:(id)a3;
- (BOOL)canAddColumnBreak:(id)a3;
- (BOOL)mapStartElementWithState:(id)a3;
- (CGSize)compensateForStrokeThickness;
- (THTableInfo)tableInfo;
- (TSTTableModel)tableModel;
- (double)height;
- (double)width;
- (id).cxx_construct;
- (id)horizontalStrokeAboveRow:(unsigned __int16)a3 inColumn:(unsigned __int16)a4;
- (id)verticalStrokeToTheLeftOfColumn:(unsigned __int16)a3 inRow:(unsigned __int16)a4;
- (unsigned)numberOfColumns;
- (unsigned)numberOfRows;
- (void)dealloc;
- (void)endRow;
- (void)ensureStrokeMatricesMatchModel;
- (void)finalizeStrokesWithState:(id)a3;
- (void)mapEndElementWithState:(id)a3;
- (void)setHorizontalStroke:(id)a3 aboveRow:(unsigned __int16)a4 inColumn:(unsigned __int16)a5;
- (void)setNumberOfColumns:(unsigned __int16)a3;
- (void)setNumberOfRows:(unsigned __int16)a3;
- (void)setVerticalStroke:(id)a3 toTheLeftOfColumn:(unsigned __int16)a4 inRow:(unsigned __int16)a5;
- (void)startRow;
@end

@implementation PFXTable

+ (void)initialize
{
  if (!qword_5737F8)
  {
    qword_5737F8 = (uint64_t)+[TSDStroke emptyStroke];
    qword_573800 = @"UndefinedStroke";
    qword_573808 = @"ContinuationStroke";
    qword_573810 = @"InsideCellStroke";
  }
}

- (BOOL)mapStartElementWithState:(id)a3
{
  [a3 setInTable:1];
  id v5 = [a3 currentHtmlDocMediaState];
  id v29 = [a3 currentHtmlStackEntry];
  id v28 = [v29 currentEntryMediaState];
  id v6 = [v28 propertySet];
  v30.receiver = self;
  v30.super_class = (Class)PFXTable;
  [(PFXDrawable *)&v30 mapStartElementWithState:a3];
  [(PFXDrawablePlacement *)self->super.mPlacement bounds];
  self->mWidth = v7;
  [(PFXDrawablePlacement *)self->super.mPlacement bounds];
  self->mHeight = v8;
  id v9 = [v5 stylesheet];
  id v10 = +[TSTTableStyleNetwork networkFromStylesheet:v9 presetIndex:0];
  if (!v10) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFXTable mapStartElementWithState:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/Readers/PFXTable.mm") lineNumber:108 description:@"invalid nil value for '%s'", "styles"];
  }
  id v11 = [v10 tableStyle];
  id v12 = objc_alloc_init((Class)TSSPropertyMap);
  id v13 = +[TSTTableStyle properties];
  if ([v13 containsProperty:520])
  {
    id v14 = +[PFXGraphicStyle mapShadowFromStyleProperties:v6 contentState:a3];
    if (v14) {
      [v12 setObject:v14 forProperty:520];
    }
  }
  if ([v13 containsProperty:516])
  {
    id v15 = +[PFXGraphicStyle mapFillFromStyleProperties:v6 contentState:a3];
    if (v15) {
      [v12 setObject:v15 forProperty:516];
    }
  }
  if ([v13 containsProperty:519])
  {
    id v16 = +[PFXGraphicStyle mapReflectionFromStyleProperties:v6];
    if (v16) {
      [v12 setObject:v16 forProperty:519];
    }
  }
  if ([v13 containsProperty:518])
  {
    id v17 = +[PFXGraphicStyle mapOpacityFromStyleProperties:v6];
    if (v17)
    {
      [v17 doubleValue];
      *(float *)&double v18 = v18;
      [v12 setFloatValue:518 forProperty:v18];
    }
  }
  [v12 setIntValue:0 forProperty:799];
  [v12 setIntValue:0 forProperty:768];
  [v12 minusPropertyMap:[v11 propertyMap]];
  id v19 = [v9 variationOfStyle:v11 propertyMap:v12];

  [v10 setTableStyle:v19];
  v20 = -[THTableInfo initWithContext:geometry:rows:columns:styles:]([THTableInfo alloc], "initWithContext:geometry:rows:columns:styles:", [a3 tspContext], -[PFXDrawablePlacement infoGeometry](self->super.mPlacement, "infoGeometry"), 1, 1, v10);
  self->mTableInfo = v20;
  self->mTableModel = (TSTTableModel *)[(THTableInfo *)v20 tableModel];
  [a3 setUniqueIdForInfo:self->mTableInfo fromStackEntry:v29];
  v21 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  self->mHorizontalStrokes = v21;
  [(NSMutableArray *)v21 addObject:+[NSMutableArray array]];
  v22 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  self->mVerticalStrokes = v22;
  [(NSMutableArray *)v22 addObject:+[NSMutableArray array]];
  if ([(PFXDrawablePlacement *)self->super.mPlacement mode] == 2)
  {
    [v28 setCurrentBreakStateSameAsParent];
    id v23 = objc_msgSend(a3, "hintCollectorForStorage:", objc_msgSend(v28, "storage"));
    [a3 setInTable:0];
    unsigned int v24 = +[PFXBreak breakCharacterFromPropertySet:](PFXBreak, "breakCharacterFromPropertySet:", [v28 propertySet]);
    uint64_t v25 = 10;
    if (v24)
    {
      unsigned int v26 = v24;
      if (v24 != 10)
      {
        if (-[PFXTable canAddColumnBreak:](self, "canAddColumnBreak:", a3, 10)) {
          uint64_t v25 = v26;
        }
        else {
          uint64_t v25 = 10;
        }
      }
    }
    +[PFXBlock addBreakIfApplicableToEntry:v29 newBreakState:v25 hintCollector:v23];
    [a3 setInTable:1];
  }
  return 1;
}

+ (void)ensure2DStrokeArray:(id)a3 hasDim1:(unsigned __int16)a4 dim2:(unsigned __int16)a5
{
  unsigned int v5 = a5;
  unsigned int v6 = a4;
  unsigned __int16 v8 = (unsigned __int16)[a3 count];
  unsigned int v9 = v8;
  uint64_t v10 = v8;
  if (v8)
  {
    uint64_t v11 = 0;
    unsigned int v12 = (unsigned __int16)[(id)[a3 lastObject] count];
    do
    {
      id v13 = [a3 objectAtIndex:v11];
      if (v12 < v5)
      {
        id v14 = v13;
        unsigned int v15 = v12;
        do
        {
          [v14 addObject:qword_573800];
          ++v15;
        }
        while (v15 < v5);
      }
      ++v11;
    }
    while (v11 != v10);
  }
  for (; v9 < v6; ++v9)
  {
    id v16 = objc_alloc_init((Class)NSMutableArray);
    if (v5)
    {
      for (unsigned int i = 0; i < v5; ++i)
        [v16 addObject:qword_573800];
    }
    [a3 addObject:v16];
  }
}

- (void)ensureStrokeMatricesMatchModel
{
  +[PFXTable ensure2DStrokeArray:self->mHorizontalStrokes hasDim1:(unsigned __int16)((unsigned __int16)[(TSTTableModel *)self->mTableModel numberOfRows] + 1) dim2:[(TSTTableModel *)self->mTableModel numberOfColumns]];
  mVerticalStrokes = self->mVerticalStrokes;
  unsigned __int16 v4 = (unsigned __int16)[(TSTTableModel *)self->mTableModel numberOfColumns] + 1;
  id v5 = [(TSTTableModel *)self->mTableModel numberOfRows];

  +[PFXTable ensure2DStrokeArray:mVerticalStrokes hasDim1:v4 dim2:v5];
}

- (id)horizontalStrokeAboveRow:(unsigned __int16)a3 inColumn:(unsigned __int16)a4
{
  unsigned int v4 = a4;
  id v5 = [(NSMutableArray *)self->mHorizontalStrokes objectAtIndex:a3];

  return [v5 objectAtIndex:v4];
}

- (void)setHorizontalStroke:(id)a3 aboveRow:(unsigned __int16)a4 inColumn:(unsigned __int16)a5
{
  unsigned int v5 = a5;
  id v7 = [(NSMutableArray *)self->mHorizontalStrokes objectAtIndex:a4];

  [v7 replaceObjectAtIndex:v5 withObject:a3];
}

- (id)verticalStrokeToTheLeftOfColumn:(unsigned __int16)a3 inRow:(unsigned __int16)a4
{
  unsigned int v4 = a4;
  id v5 = [(NSMutableArray *)self->mVerticalStrokes objectAtIndex:a3];

  return [v5 objectAtIndex:v4];
}

- (void)setVerticalStroke:(id)a3 toTheLeftOfColumn:(unsigned __int16)a4 inRow:(unsigned __int16)a5
{
  unsigned int v5 = a5;
  id v7 = [(NSMutableArray *)self->mVerticalStrokes objectAtIndex:a4];

  [v7 replaceObjectAtIndex:v5 withObject:a3];
}

+ (void)setStrokeProperty:(int)a3 value:(id)a4 cellPropertyMap:(id)a5
{
  if ((id)qword_573810 != a4) {
    [a5 setObject:a4 forProperty:*(void *)&a3];
  }
}

- (void)finalizeStrokesWithState:(id)a3
{
  id v26 = [a3 currentHtmlDocMediaState];
  [(TSTTableModel *)self->mTableModel numberOfRows];
  unsigned __int16 v4 = 0;
  do
  {
    if ([(TSTTableModel *)self->mTableModel numberOfColumns])
    {
      id v5 = 0;
      unsigned __int16 v6 = 0;
      do
      {
        id v7 = [(PFXTable *)self horizontalStrokeAboveRow:v4 inColumn:v6];
        if (v7 == (id)qword_573808)
        {
          [(PFXTable *)self setHorizontalStroke:v5 aboveRow:v4 inColumn:v6];
          id v7 = v5;
        }
        ++v6;
        id v5 = v7;
      }
      while ([(TSTTableModel *)self->mTableModel numberOfColumns] > v6);
    }
    ++v4;
  }
  while ([(TSTTableModel *)self->mTableModel numberOfRows] >= v4);
  [(TSTTableModel *)self->mTableModel numberOfColumns];
  unsigned __int16 v8 = 0;
  do
  {
    if ([(TSTTableModel *)self->mTableModel numberOfRows])
    {
      unsigned __int16 v9 = 0;
      id v10 = 0;
      do
      {
        id v11 = [(PFXTable *)self verticalStrokeToTheLeftOfColumn:v8 inRow:v9];
        if (v11 == (id)qword_573808)
        {
          [(PFXTable *)self setVerticalStroke:v10 toTheLeftOfColumn:v8 inRow:v9];
          id v11 = v10;
        }
        ++v9;
        id v10 = v11;
      }
      while ([(TSTTableModel *)self->mTableModel numberOfRows] > v9);
    }
    ++v8;
  }
  while ([(TSTTableModel *)self->mTableModel numberOfColumns] >= v8);
  if ([(TSTTableModel *)self->mTableModel numberOfRows])
  {
    unint64_t v12 = 0;
    id v13 = &unk_573000;
    do
    {
      unint64_t v30 = v12 + 1;
      if ([(TSTTableModel *)self->mTableModel numberOfColumns])
      {
        unsigned __int16 v14 = 0;
        unint64_t v27 = v12;
        do
        {
          id v15 = [(PFXTable *)self verticalStrokeToTheLeftOfColumn:v14 inRow:(unsigned __int16)v12];
          unsigned __int16 v16 = v14 + 1;
          id v31 = [(PFXTable *)self verticalStrokeToTheLeftOfColumn:(unsigned __int16)(v14 + 1) inRow:(unsigned __int16)v12];
          id v17 = [(PFXTable *)self horizontalStrokeAboveRow:(unsigned __int16)v12 inColumn:v14];
          id v18 = [(PFXTable *)self horizontalStrokeAboveRow:(unsigned __int16)v30 inColumn:v14];
          id v19 = (id)v13[258];
          if (v15 == v19 || v17 == v19)
          {
            id v21 = v18;
            unint64_t v28 = v12 | ((unint64_t)v14 << 16) | v28 & 0xFFFFFFFF00000000;
            v22 = (void *)TSTTableDefaultCellStyleForCellID();
            id v23 = objc_alloc_init((Class)TSSPropertyMap);
            +[PFXTable setStrokeProperty:901 value:v15 cellPropertyMap:v23];
            +[PFXTable setStrokeProperty:899 value:v17 cellPropertyMap:v23];
            +[PFXTable setStrokeProperty:902 value:v31 cellPropertyMap:v23];
            +[PFXTable setStrokeProperty:900 value:v21 cellPropertyMap:v23];
            [v23 minusPropertyMap:[v22 propertyMap]];
            id v24 = [v26 stylesheet];
            uint64_t v25 = v22;
            id v13 = (void *)&unk_573000;
            [v24 variationOfStyle:v25 propertyMap:v23];

            unint64_t v29 = v12 | ((unint64_t)v14 << 16) | v29 & 0xFFFFFFFF00000000;
            TSTTableSetCellStyleAtCellID();
            unint64_t v12 = v27;
          }
          ++v14;
        }
        while ([(TSTTableModel *)self->mTableModel numberOfColumns] > v16);
      }
      unint64_t v12 = v30;
    }
    while (v30 < [(TSTTableModel *)self->mTableModel numberOfRows]);
  }
}

- (CGSize)compensateForStrokeThickness
{
}

- (void)mapEndElementWithState:(id)a3
{
  id v5 = objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "currentEntryMediaState");
  [(PFXTable *)self finalizeStrokesWithState:a3];
  [(PFXTable *)self compensateForStrokeThickness];
  [v5 setResult:self->mTableInfo];
  v8.receiver = self;
  v8.super_class = (Class)PFXTable;
  [(PFXDrawable *)&v8 mapEndElementWithState:a3];
  id v6 = [[-[THTableInfo geometry](self->mTableInfo, "geometry") mutableCopy]];
  [v6 position];
  TSDAddPoints();
  [v6 setPosition:];
  [(THTableInfo *)self->mTableInfo setGeometry:v6];

  self->mTableInfo = 0;
  id v7 = [a3 currentHtmlDocMediaState];
  if ([(PFXDrawablePlacement *)self->super.mPlacement mode] == 2)
  {
    if ([v7 hasHints])
    {
      objc_msgSend(objc_msgSend(a3, "hintCollectorForStorage:", objc_msgSend(v5, "storage")), "addLineBreakHintWithPresentationId:", @"p");
      [v7 popHint];
    }
    [v5 setParentBreakStateSameAsCurrent];
  }
  [a3 setInTable:0];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFXTable;
  [(PFXDrawable *)&v3 dealloc];
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)addCellWithSize:(id)a3
{
  unsigned __int16 var0 = a3.var0;
  p_mHangingCells = &self->mHangingCells;
  begin = p_mHangingCells->__begin_;
  uint64_t v7 = p_mHangingCells->__end_ - p_mHangingCells->__begin_;
  unint64_t mCurrentHangingCellIndex = self->mCurrentHangingCellIndex;
  if (mCurrentHangingCellIndex < v7 >> 3)
  {
    unint64_t v9 = v7 >> 3;
    do
    {
      uint64_t v10 = *((void *)begin + mCurrentHangingCellIndex);
      if (self->mCurrentColumn < BYTE2(v10)) {
        break;
      }
      self->mCurrentColumn = (BYTE4(v10) + BYTE2(v10) - 1) + 1;
      unint64_t mCurrentHangingCellIndex = self->mCurrentHangingCellIndex + 1;
      self->unint64_t mCurrentHangingCellIndex = mCurrentHangingCellIndex;
    }
    while (mCurrentHangingCellIndex < v9);
  }
  LOWORD(v13[0]) = self->mNumberOfRows - 1;
  BYTE2(v13[0]) = self->mCurrentColumn;
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v11 = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)v13[0];
  v13[1] = a3;
  sub_2318D4((uint64_t)p_mHangingCells, (char *)begin + 8 * mCurrentHangingCellIndex, (char *)v13);
  ++self->mCurrentHangingCellIndex;
  self->mCurrentColumn += var0;
  return v11;
}

- (void)startRow
{
  self->mCurrentColumn = 0;
  self->unint64_t mCurrentHangingCellIndex = 0;
}

- (void)endRow
{
  p_mHangingCells = &self->mHangingCells;
  begin = self->mHangingCells.__begin_;
  end = self->mHangingCells.__end_;
  while (begin != end)
  {
    if (self->mNumberOfRows - 1 == (unsigned __int16)(*(void *)begin + HIWORD(*(void *)begin) - 1))
    {
      int64_t v6 = end - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 8);
      if (end != ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 8)) {
        memmove(begin, (char *)begin + 8, end - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 8));
      }
      end = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + v6);
      p_mHangingCells->__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + v6);
    }
    else
    {
      begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 8);
    }
  }
}

- (THTableInfo)tableInfo
{
  return self->mTableInfo;
}

- (TSTTableModel)tableModel
{
  return self->mTableModel;
}

- (double)width
{
  return self->mWidth;
}

- (double)height
{
  return self->mHeight;
}

- (unsigned)numberOfRows
{
  return self->mNumberOfRows;
}

- (void)setNumberOfRows:(unsigned __int16)a3
{
  self->mNumberOfRows = a3;
}

- (unsigned)numberOfColumns
{
  return self->mNumberOfColumns;
}

- (void)setNumberOfColumns:(unsigned __int16)a3
{
  self->mNumberOfColumns = a3;
}

- (void).cxx_destruct
{
  p_mHangingCells = &self->mHangingCells;
  begin = self->mHangingCells.__begin_;
  if (begin)
  {
    p_mHangingCells->__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 9) = 0;
  *((void *)self + 10) = 0;
  *((void *)self + 8) = 0;
  return self;
}

- (BOOL)canAddColumnBreak:(id)a3
{
  return 0;
}

@end