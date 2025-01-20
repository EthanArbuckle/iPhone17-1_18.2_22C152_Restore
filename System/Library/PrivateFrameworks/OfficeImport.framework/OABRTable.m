@interface OABRTable
- (OABRTable)initWithSourceTable:(id)a3 targetTable:(id)a4 state:(id)a5;
- (id)readStrokeFromShape:(void *)a3;
- (void)createTargetTableContents;
- (void)dealloc;
- (void)map;
- (void)mapScale;
- (void)readAnchor;
- (void)readCellsAndLines;
- (void)readCoordinates;
- (void)validateTable;
@end

@implementation OABRTable

- (OABRTable)initWithSourceTable:(id)a3 targetTable:(id)a4 state:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)OABRTable;
  v12 = [(OABRTable *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->mSrcTable, a3);
    objc_storeStrong((id *)&v13->mTgtTable, a4);
    objc_storeStrong((id *)&v13->mState, a5);
  }

  return v13;
}

- (void)map
{
  v3 = [(OADTable *)self->mTgtTable tableProperties];
  objc_msgSend(v3, "setRightToLeft:", *((unsigned __int8 *)EshGroupProperties::getTableProperties((EshGroupProperties *)(-[ESDContainer eshGroup](self->mSrcTable, "eshGroup")+ 288))+ 2));

  [(OABRTable *)self readAnchor];
  [(OABRTable *)self mapScale];
  [(OABRTable *)self readCoordinates];
  [(OABRTable *)self readCellsAndLines];
  [(OABRTable *)self validateTable];
  [(OABRTable *)self createTargetTableContents];
  v4 = [(OADTable *)self->mTgtTable tableProperties];
  int v5 = [v4 rightToLeft];

  if (v5)
  {
    mTgtTable = self->mTgtTable;
    [(OADTable *)mTgtTable flipTableRTL];
  }
}

- (void)readAnchor
{
  +[OABContent readFromContainer:self->mSrcTable toDrawable:self->mTgtTable state:self->mState];
  v3 = [(OABReaderState *)self->mState client];
  mSrcTable = self->mSrcTable;
  mTgtTable = self->mTgtTable;
  mState = self->mState;
  [(objc_class *)v3 readClientDataFromGroup:mSrcTable toGroup:mTgtTable state:mState];
}

- (void)mapScale
{
  v3 = (CGRect *)MEMORY[0x263F001A8];
  CGFloat v4 = *MEMORY[0x263F001A8];
  CGFloat v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  CGFloat v6 = *(double *)(MEMORY[0x263F001A8] + 16);
  CGFloat v7 = *(double *)(MEMORY[0x263F001A8] + 24);
  v8 = [(OADDrawable *)self->mTgtTable clientData];

  if (v8)
  {
    id v9 = [(OADDrawable *)self->mTgtTable clientData];
    [v9 bounds];
    CGFloat v4 = v10;
    CGFloat v5 = v11;
    CGFloat v6 = v12;
    CGFloat v7 = v13;
  }
  v28.origin.x = v4;
  v28.origin.y = v5;
  v28.size.width = v6;
  v28.size.height = v7;
  if (CGRectEqualToRect(v28, *v3))
  {
    v14 = [(OADDrawable *)self->mTgtTable drawableProperties];
    objc_super v15 = [v14 orientedBounds];
    [v15 bounds];
    CGFloat v4 = v16;
    CGFloat v5 = v17;
    CGFloat v6 = v18;
    CGFloat v7 = v19;

    v29.origin.x = v4;
    v29.origin.y = v5;
    v29.size.width = v6;
    v29.size.height = v7;
    if (CGRectEqualToRect(v29, *v3)) {
      [MEMORY[0x263EFF940] raise:@"Table bounds must be available in order to read the table" format:&stru_26EBF24D8];
    }
  }
  uint64_t v20 = *(void *)([(ESDContainer *)self->mSrcTable eshGroup] + 280);
  int32x2_t v21 = *(int32x2_t *)(v20 + 28);
  int32x2_t v22 = *(int32x2_t *)(v20 + 36);
  v30.origin.x = v4;
  v30.origin.y = v5;
  v30.size.width = v6;
  v30.size.height = v7;
  CGFloat Width = CGRectGetWidth(v30);
  v31.origin.x = v4;
  v31.origin.y = v5;
  v31.size.width = v6;
  v31.size.height = v7;
  CGFloat Height = CGRectGetHeight(v31);
  int32x2_t v24 = vsub_s32(v22, v21);
  v25.i64[0] = v24.i32[0];
  v25.i64[1] = v24.i32[1];
  v26.f64[0] = Width;
  v26.f64[1] = Height;
  self->mScale = (CGPoint)vdivq_f64(v26, vcvtq_f64_s64(v25));
}

- (void)readCoordinates
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  unint64_t v5 = [(ESDContainer *)self->mSrcTable childCount];
  if (v5 >= 2)
  {
    for (uint64_t i = 1; i != v5; ++i)
    {
      CGFloat v7 = [(ESDContainer *)self->mSrcTable childAt:i];
      uint64_t v8 = [v7 eshShape];
      if (!v8)
      {

        id v4 = 0;
        id v3 = 0;
        [MEMORY[0x263EFF940] raise:@"Could not read shape" format:&stru_26EBF24D8];
      }
      id v9 = (EshContentProperties *)(v8 + 424);
      if (EshShapeProperties::getShapeType((EshShapeProperties *)v9) == 1)
      {
        double v10 = [NSNumber numberWithInt:EshContentProperties::getLeft(v9)];
        [v3 addObject:v10];

        double v11 = [NSNumber numberWithInt:EshContentProperties::getRight(v9)];
        [v3 addObject:v11];

        double v12 = [NSNumber numberWithInt:EshContentProperties::getTop(v9)];
        [v4 addObject:v12];

        double v13 = [NSNumber numberWithInt:EshContentProperties::getBottom(v9)];
        [v4 addObject:v13];
      }
    }
  }
  self->mColumnCount = [v3 count] - 1;
  self->mRowCount = [v4 count] - 1;
  v14 = [[OABTableSortedIntArray alloc] initWithIntSet:v3];
  mXCoords = self->mXCoords;
  self->mXCoords = v14;

  double v16 = [[OABTableSortedIntArray alloc] initWithIntSet:v4];
  mYCoords = self->mYCoords;
  self->mYCoords = v16;

  operator new();
}

- (void)readCellsAndLines
{
  v2 = self;
  int v3 = [(ESDContainer *)self->mSrcTable childCount];
  if (v3 >= 2)
  {
    uint64_t v22 = v3;
    uint64_t v4 = 1;
    do
    {
      v27 = -[ESDContainer childAt:](v2->mSrcTable, "childAt:", v4, v22);
      uint64_t v5 = [v27 eshShape];
      CGFloat v6 = (EshShapeProperties *)(v5 + 424);
      int v24 = [(OABTableSortedIntArray *)v2->mXCoords indexOfInt:EshContentProperties::getLeft((EshContentProperties *)(v5 + 424))];
      int v26 = [(OABTableSortedIntArray *)v2->mXCoords indexOfInt:EshContentProperties::getRight((EshContentProperties *)(v5 + 424))];
      uint64_t v23 = v4;
      int v7 = [(OABTableSortedIntArray *)v2->mYCoords indexOfInt:EshContentProperties::getTop((EshContentProperties *)(v5 + 424))];
      int v25 = [(OABTableSortedIntArray *)v2->mYCoords indexOfInt:EshContentProperties::getBottom((EshContentProperties *)(v5 + 424))];
      mCells = (int *)v2->mCells;
      if (v24 >= *mCells || v7 >= mCells[1]) {
        [MEMORY[0x263EFF940] raise:@"index out of bounds in cell coordinates" format:&stru_26EBF24D8];
      }
      if (EshShapeProperties::getShapeType(v6) == 1)
      {
        if (v26 > v24)
        {
          int v9 = v24;
          do
          {
            if (v25 > v7)
            {
              int v10 = 0;
              if (v9 == v24) {
                int v11 = v26 - v24;
              }
              else {
                int v11 = 1;
              }
              do
              {
                BOOL v12 = *(void *)OABTable2DArray<OABTableCell>::element((uint64_t)v2->mCells, v9, v7 + v10) == 0;
                TCVerifyInputMeetsCondition(v12);
                id v13 = v27;
                v14 = (void **)OABTable2DArray<OABTableCell>::element((uint64_t)v2->mCells, v9, v7 + v10);
                objc_super v15 = v14;
                double v16 = v2;
                if (v10) {
                  int v17 = 1;
                }
                else {
                  int v17 = v25 - v7;
                }
                double v18 = *v14;
                OABTableSortedIntArray *v14 = v13;

                *((_DWORD *)v15 + 2) = v11;
                *((_DWORD *)v15 + 3) = v17;
                v2 = v16;
                *((unsigned char *)v15 + 16) = v9 > v24;
                *((unsigned char *)v15 + 17) = v7 + v10++ > v7;
              }
              while (v25 - v7 != v10);
            }
            ++v9;
          }
          while (v9 != v26);
        }
      }
      else if (EshShapeProperties::getShapeType(v6) == 20 && (v26 == v24 || v25 == v7))
      {
        int v19 = v24;
        if (v26 > v24)
        {
          do
          {
            BOOL v20 = *(void *)OABTable2DArray<EshShape *>::element((uint64_t)v2->mHorzLines, v19, v7) == 0;
            TCVerifyInputMeetsCondition(v20);
            *(void *)OABTable2DArray<EshShape *>::element((uint64_t)v2->mHorzLines, v19++, v7) = v5;
          }
          while (v26 != v19);
        }
        if (v25 > v7)
        {
          do
          {
            BOOL v21 = *(void *)OABTable2DArray<EshShape *>::element((uint64_t)v2->mVertLines, v24, v7) == 0;
            TCVerifyInputMeetsCondition(v21);
            *(void *)OABTable2DArray<EshShape *>::element((uint64_t)v2->mVertLines, v24, v7++) = v5;
          }
          while (v25 != v7);
        }
      }

      uint64_t v4 = v23 + 1;
    }
    while (v23 + 1 != v22);
  }
}

- (void)dealloc
{
  mHorzLines = self->mHorzLines;
  if (mHorzLines)
  {
    uint64_t v4 = mHorzLines[1];
    if (v4) {
      MEMORY[0x23EC99790](v4, 0x20C8093837F09);
    }
    MEMORY[0x23EC997B0](mHorzLines, 0x1080C4057E67DB5);
  }
  mVertLines = self->mVertLines;
  if (mVertLines)
  {
    uint64_t v6 = mVertLines[1];
    if (v6) {
      MEMORY[0x23EC99790](v6, 0x20C8093837F09);
    }
    MEMORY[0x23EC997B0](mVertLines, 0x1080C4057E67DB5);
  }
  mCells = self->mCells;
  if (mCells)
  {
    uint64_t v8 = OABTable2DArray<OABTableCell>::~OABTable2DArray((uint64_t)mCells);
    MEMORY[0x23EC997B0](v8, 0x1020C405730B0C9);
  }
  v9.receiver = self;
  v9.super_class = (Class)OABRTable;
  [(OABRTable *)&v9 dealloc];
}

- (void)validateTable
{
  int mRowCount = self->mRowCount;
  if (mRowCount >= 1)
  {
    int v4 = 0;
    int mColumnCount = self->mColumnCount;
    do
    {
      if (mColumnCount >= 1)
      {
        for (int i = 0; i < mColumnCount; ++i)
        {
          BOOL v7 = *(void *)OABTable2DArray<OABTableCell>::element((uint64_t)self->mCells, i, v4) != 0;
          TCVerifyInputMeetsCondition(v7);
          int mColumnCount = self->mColumnCount;
        }
        int mRowCount = self->mRowCount;
      }
      ++v4;
    }
    while (v4 < mRowCount);
  }
  if ((mRowCount & 0x80000000) == 0)
  {
    int v8 = 0;
    int v9 = self->mColumnCount;
    do
    {
      if (v9 >= 1)
      {
        for (int j = 0; j < v9; ++j)
        {
          int v11 = (void *)OABTable2DArray<EshShape *>::element((uint64_t)self->mHorzLines, j, v8);
          if (v8 && *v11 && v8 < self->mRowCount)
          {
            uint64_t v12 = *(void *)OABTable2DArray<OABTableCell>::element((uint64_t)self->mCells, j, v8 - 1);
            BOOL v13 = v12 != *(void *)OABTable2DArray<OABTableCell>::element((uint64_t)self->mCells, j, v8);
            TCVerifyInputMeetsCondition(v13);
          }
          if (j < self->mColumnCount - 1)
          {
            if (v8)
            {
              uint64_t v14 = *(void *)OABTable2DArray<OABTableCell>::element((uint64_t)self->mCells, j, v8 - 1);
              BOOL v15 = v14 != *(void *)OABTable2DArray<OABTableCell>::element((uint64_t)self->mCells, j + 1, v8 - 1);
            }
            else
            {
              BOOL v15 = 0;
            }
            if (v8 >= self->mRowCount)
            {
              BOOL v17 = 0;
            }
            else
            {
              uint64_t v16 = *(void *)OABTable2DArray<OABTableCell>::element((uint64_t)self->mCells, j, v8);
              BOOL v17 = v16 != *(void *)OABTable2DArray<OABTableCell>::element((uint64_t)self->mCells, j + 1, v8);
            }
            if (!v15 && !v17)
            {
              uint64_t v18 = *(void *)OABTable2DArray<EshShape *>::element((uint64_t)self->mHorzLines, j, v8);
              BOOL v19 = v18 == *(void *)OABTable2DArray<EshShape *>::element((uint64_t)self->mHorzLines, j + 1, v8);
              TCVerifyInputMeetsCondition(v19);
            }
          }
          int v9 = self->mColumnCount;
        }
        int mRowCount = self->mRowCount;
      }
      BOOL v20 = v8++ < mRowCount;
    }
    while (v20);
    if (mRowCount >= 1)
    {
      int v21 = 0;
      int v22 = self->mColumnCount;
      do
      {
        int v23 = v21 + 1;
        if ((v22 & 0x80000000) == 0)
        {
          int v24 = 0;
          do
          {
            int v25 = (void *)OABTable2DArray<EshShape *>::element((uint64_t)self->mVertLines, v24, v21);
            if (v24 && *v25 && v24 < self->mColumnCount)
            {
              uint64_t v26 = *(void *)OABTable2DArray<OABTableCell>::element((uint64_t)self->mCells, v24 - 1, v21);
              BOOL v27 = v26 != *(void *)OABTable2DArray<OABTableCell>::element((uint64_t)self->mCells, v24, v21);
              TCVerifyInputMeetsCondition(v27);
            }
            if (v21 < self->mRowCount - 1)
            {
              if (v24)
              {
                uint64_t v28 = *(void *)OABTable2DArray<OABTableCell>::element((uint64_t)self->mCells, v24 - 1, v21);
                BOOL v29 = v28 != *(void *)OABTable2DArray<OABTableCell>::element((uint64_t)self->mCells, v24 - 1, v21 + 1);
              }
              else
              {
                BOOL v29 = 0;
              }
              if (v24 >= self->mColumnCount)
              {
                BOOL v31 = 0;
              }
              else
              {
                uint64_t v30 = *(void *)OABTable2DArray<OABTableCell>::element((uint64_t)self->mCells, v24, v21);
                BOOL v31 = v30 != *(void *)OABTable2DArray<OABTableCell>::element((uint64_t)self->mCells, v24, v21 + 1);
              }
              if (!v29 && !v31 && v24 < self->mColumnCount)
              {
                uint64_t v32 = *(void *)OABTable2DArray<EshShape *>::element((uint64_t)self->mVertLines, v24, v21);
                BOOL v33 = v32 == *(void *)OABTable2DArray<EshShape *>::element((uint64_t)self->mVertLines, v24, v21 + 1);
                TCVerifyInputMeetsCondition(v33);
              }
            }
            int v22 = self->mColumnCount;
            BOOL v20 = v24++ < v22;
          }
          while (v20);
          int mRowCount = self->mRowCount;
        }
        ++v21;
      }
      while (v23 < mRowCount);
    }
  }
}

- (void)createTargetTableContents
{
  if (self->mColumnCount >= 1)
  {
    uint64_t v3 = 0;
    do
    {
      uint64_t v4 = (v3 + 1);
      int v5 = [(OABTableSortedIntArray *)self->mXCoords intAtIndex:v4];
      int v6 = [(OABTableSortedIntArray *)self->mXCoords intAtIndex:v3];
      uint64_t v28 = [(OADTable *)self->mTgtTable grid];
      BOOL v7 = [v28 addColumn];
      CGFloat v8 = self->mScale.x * (float)(v5 - v6);
      *(float *)&CGFloat v8 = v8;
      [v7 setWidth:v8];

      uint64_t v3 = v4;
    }
    while ((int)v4 < self->mColumnCount);
  }
  if (self->mRowCount >= 1)
  {
    uint64_t v9 = 0;
    do
    {
      BOOL v29 = [(OADTable *)self->mTgtTable addRow];
      int v27 = v9 + 1;
      int v10 = -[OABTableSortedIntArray intAtIndex:](self->mYCoords, "intAtIndex:");
      CGFloat v11 = self->mScale.y * (float)(v10 - [(OABTableSortedIntArray *)self->mYCoords intAtIndex:v9]);
      *(float *)&CGFloat v11 = v11;
      [v29 setHeight:v11];
      if (self->mColumnCount >= 1)
      {
        int v12 = 0;
        do
        {
          BOOL v13 = [v29 addCell];
          uint64_t v14 = (void *)OABTable2DArray<OABTableCell>::element((uint64_t)self->mCells, v12, v9);
          [v13 setRowSpan:*((unsigned int *)v14 + 3)];
          [v13 setGridSpan:*((unsigned int *)v14 + 2)];
          [v13 setHorzMerge:*((unsigned __int8 *)v14 + 16)];
          [v13 setVertMerge:*((unsigned __int8 *)v14 + 17)];
          if (!(*((unsigned __int8 *)v14 + 16) | *((unsigned __int8 *)v14 + 17)))
          {
            uint64_t v15 = [(id)*v14 eshShape];
            [(objc_class *)[(OABReaderState *)self->mState client] readClientDataFromTableCell:*v14 toTableCell:v13 state:self->mState];
            uint64_t v16 = [v13 textBody];
            if (!v16)
            {
              uint64_t v16 = objc_alloc_init(OADTextBody);
              [v13 setTextBody:v16];
            }
            BOOL v17 = [(OADTextBody *)v16 properties];
            +[OABTextBodyProperties readTextBodyProperties:v17 textBox:v15 + 272 useDefaults:1 state:self->mState];

            uint64_t v18 = [(OADTextBody *)v16 properties];
            [(OADTextBody *)v16 setProperties:v18];

            BOOL v19 = objc_alloc_init(OADTableCellProperties);
            BOOL v20 = [[OABShapeManager alloc] initWithShape:v15];
            int v21 = +[OABFill readFillFromFillPropertiesManager:v20 state:self->mState];
            [(OADTableCellProperties *)v19 setFill:v21];
            int v22 = [(OABRTable *)self readStrokeFromShape:*(void *)OABTable2DArray<EshShape *>::element((uint64_t)self->mVertLines, v12, v9)];
            [(OADTableCellProperties *)v19 setLeftStroke:v22];

            int v23 = [(OABRTable *)self readStrokeFromShape:*(void *)OABTable2DArray<EshShape *>::element((uint64_t)self->mVertLines, v12 + *((_DWORD *)v14 + 2), v9)];
            [(OADTableCellProperties *)v19 setRightStroke:v23];

            int v24 = [(OABRTable *)self readStrokeFromShape:*(void *)OABTable2DArray<EshShape *>::element((uint64_t)self->mHorzLines, v12, v9)];
            [(OADTableCellProperties *)v19 setTopStroke:v24];

            int v25 = [(OABRTable *)self readStrokeFromShape:*(void *)OABTable2DArray<EshShape *>::element((uint64_t)self->mHorzLines, v12, *((_DWORD *)v14 + 3) + (int)v9)];
            [(OADTableCellProperties *)v19 setBottomStroke:v25];

            uint64_t v26 = [(OADTextBody *)v16 properties];
            -[OADTableCellProperties setTextAnchor:](v19, "setTextAnchor:", [v26 textAnchorType]);

            [v13 setProperties:v19];
          }

          ++v12;
        }
        while (v12 < self->mColumnCount);
      }

      uint64_t v9 = v27;
    }
    while (v27 < self->mRowCount);
  }
}

- (id)readStrokeFromShape:(void *)a3
{
  if (a3)
  {
    uint64_t v4 = [[OABShapeManager alloc] initWithShape:a3];
    int v5 = +[OABStroke readStrokeFromShapeBaseManager:v4 state:self->mState];
    if ([(OADStroke *)v5 isCapOverridden] && [(OADStroke *)v5 cap] != 2) {
      [(OADStroke *)v5 setCap:2];
    }
  }
  else
  {
    int v5 = objc_alloc_init(OADStroke);
    uint64_t v4 = +[OADNullFill nullFill];
    [(OADStroke *)v5 setFill:v4];
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mYCoords, 0);
  objc_storeStrong((id *)&self->mXCoords, 0);
  objc_storeStrong((id *)&self->mState, 0);
  objc_storeStrong((id *)&self->mTgtTable, 0);
  objc_storeStrong((id *)&self->mSrcTable, 0);
}

@end