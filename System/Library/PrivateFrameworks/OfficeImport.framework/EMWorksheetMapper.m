@interface EMWorksheetMapper
- (BOOL)isVisible;
- (CGSize)preprocessDrawableSizeWithState:(id)a3;
- (CGSize)preprocessSizeWithState:(id)a3;
- (EMWorksheetMapper)initWithEDWorksheet:(id)a3 parent:(id)a4;
- (double)columnGrid;
- (double)defaultColumnWidth;
- (double)defaultRowHeight;
- (double)rowGrid;
- (double)xlColumnWidthToPoints:(double)a3;
- (id)columnWidthConvertor;
- (int)height;
- (int)preprocessHeightWithState:(id)a3;
- (int)preprocessWidthWithState:(id)a3;
- (int)width;
- (int64_t)maxRowNumber;
- (unint64_t)columnCount;
- (void)_initWithState:(id)a3;
- (void)countRowsAndColumnsWithState:(id)a3;
- (void)dealloc;
- (void)mapAt:(id)a3 withState:(id)a4;
- (void)mapColumnInfosAt:(id)a3 withState:(id)a4;
- (void)mapDrawablesAt:(id)a3 withState:(id)a4;
- (void)mapTableAt:(id)a3 withState:(id)a4;
- (void)mapWorksheetClassesAtTableNode:(id)a3;
- (void)readHyperlinksWithState:(id)a3;
- (void)setRowGrid;
@end

@implementation EMWorksheetMapper

- (EMWorksheetMapper)initWithEDWorksheet:(id)a3 parent:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EMWorksheetMapper;
  v9 = [(CMMapper *)&v14 initWithParent:v8];
  v10 = v9;
  if (v9)
  {
    v9->mHeight = 0;
    v9->mWidth = 0;
    v9->mMaxPopulatedColumn = -1;
    v9->mMaxPopulatedRow = -1;
    objc_storeStrong((id *)&v9->edWorksheet, a3);
    v11 = objc_alloc_init(CMStyle);
    mStyle = v10->mStyle;
    v10->mStyle = v11;
  }
  return v10;
}

- (CGSize)preprocessSizeWithState:(id)a3
{
  id v4 = a3;
  int v5 = [(EMWorksheetMapper *)self preprocessWidthWithState:v4];
  int v6 = [(EMWorksheetMapper *)self preprocessHeightWithState:v4];
  [(EMWorksheetMapper *)self preprocessDrawableSizeWithState:v4];
  if (v7 < (double)v5) {
    double v7 = (double)v5;
  }
  if (v8 < (double)v6) {
    double v8 = (double)v6;
  }
  if (v7 > 0.0 || v8 > 0.0)
  {
    if (v7 > 0.0)
    {
      if (v8 <= 0.0) {
        double v8 = v7 * 3.0 * 0.25;
      }
    }
    else
    {
      double v7 = v8 * 4.0 / 3.0;
    }
    double v10 = v7 + 20.0;
    double v9 = v8 + 20.0;
  }
  else
  {
    double v9 = 600.0;
    double v10 = 980.0;
  }
  if (v10 >= 300.0) {
    double v11 = v10;
  }
  else {
    double v11 = 300.0;
  }
  if (v9 >= 200.0) {
    double v12 = v9;
  }
  else {
    double v12 = 200.0;
  }

  double v13 = v11;
  double v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (int)preprocessWidthWithState:(id)a3
{
  [(EMWorksheetMapper *)self _initWithState:a3];
  if (!self->mColumnGrid) {
    return 0;
  }
  [(EDWorksheet *)self->edWorksheet defaultColumnWidth];
  double v5 = v4;
  v34 = [(EDWorksheet *)self->edWorksheet columnInfos];
  uint64_t v6 = [v34 count];
  if (v6)
  {
    uint64_t v33 = v6;
    uint64_t v7 = 0;
    int v8 = -1;
    double v9 = 0.0;
    while (v8 <= SLODWORD(self->mMaxPopulatedColumn))
    {
      double v10 = [v34 objectAtIndex:v7];
      double v11 = v10;
      if (v10)
      {
        double v12 = [v10 range];
        int v13 = [v12 firstColumn];
        int v14 = [v12 lastColumn];
        if (v13 < 0 || (int v15 = v14, v14 < 0) || self->mMaxPopulatedColumn < v13)
        {

          break;
        }
        if (v8 + 1 < v13)
        {
          v16 = [[EMColumnInfoMapper alloc] initWithDefaultWidth:v13 + ~v8 span:self parent:v5];
          [(EMColumnInfoMapper *)v16 columnWidth];
          int v18 = ~v8 + v13;
          v19 = &self->mColumnGrid[v8 + 1];
          do
          {
            *v19++ = v17;
            double v9 = v17 + v9;
            --v18;
          }
          while (v18);
        }
        double v20 = 0.0;
        if (([v11 isHidden] & 1) == 0)
        {
          v21 = [[EMColumnInfoMapper alloc] initWithEDColumnInfo:v11 maxSpan:self->mMaxPopulatedColumn - v8 parent:self];
          [(EMColumnInfoMapper *)v21 columnWidth];
          double v20 = v22;
        }
        if (v13 <= v15)
        {
          int64_t v23 = v13;
          int64_t mMaxPopulatedColumn = self->mMaxPopulatedColumn;
          int v25 = v15 - v13 + 1;
          do
          {
            if (mMaxPopulatedColumn < v23) {
              break;
            }
            self->mColumnGrid[v23] = v20;
            double v9 = v20 + v9;
            ++v23;
            --v25;
          }
          while (v25);
        }

        int v8 = v15;
      }
      else
      {
        int v15 = v8;
      }
      if (++v7 == v33) {
        goto LABEL_27;
      }
    }
    int v15 = v8;
  }
  else
  {
    double v9 = 0.0;
    int v15 = -1;
  }
LABEL_27:
  if (self->mMaxPopulatedColumn > v15)
  {
    v27 = [[EMColumnInfoMapper alloc] initWithDefaultWidth:self->mMaxPopulatedColumn - v15 span:self parent:v5];
    [(EMColumnInfoMapper *)v27 columnWidth];
    int64_t v29 = self->mMaxPopulatedColumn;
    LODWORD(v30) = v15 + 1;
    if (v29 >= v15 + 1)
    {
      int64_t v30 = (int)v30;
      mColumnGrid = self->mColumnGrid;
      do
      {
        mColumnGrid[v30] = v28;
        double v9 = v28 + v9;
        ++v30;
      }
      while (v29 >= v30);
    }
  }
  int v26 = (int)v9;

  return v26;
}

- (void)_initWithState:(id)a3
{
  id v7 = a3;
  if (self->mMaxPopulatedRow < 0 && self->mMaxPopulatedColumn < 0 && !self->mColumnGrid)
  {
    [(EMWorksheetMapper *)self countRowsAndColumnsWithState:v7];
    unint64_t mMaxPopulatedColumn = self->mMaxPopulatedColumn;
    if (mMaxPopulatedColumn <= 0x4000 && (unint64_t v5 = mMaxPopulatedColumn + 1, 8 * (int)v5 / v5 == 8)) {
      uint64_t v6 = (double *)malloc_type_malloc(8 * v5, 0xD809582AuLL);
    }
    else {
      uint64_t v6 = 0;
    }
    self->mColumnGrid = v6;
    [(EMWorksheetMapper *)self setRowGrid];
  }
}

- (void)countRowsAndColumnsWithState:(id)a3
{
  id v30 = a3;
  if (self->mMaxPopulatedRow < 0 && self->mMaxPopulatedColumn < 0)
  {
    double v4 = [(EDWorksheet *)self->edWorksheet rowBlocks];
    self->uint64_t mMaxPopulatedColumn = 0;
    int64_t v29 = v4;
    int v5 = [v4 maxPopulatedRow];
    self->mMaxPopulatedRow = 0;
    uint64_t v33 = [(EDWorksheet *)self->edWorksheet mergedCells];
    uint64_t v6 = (objc_class *)(v5 + 1);
    if (v5 != -1)
    {
      uint64_t v27 = 72;
      double v28 = (objc_class *)(v5 + 1);
      v32 = self;
      id v7 = 0;
      int v8 = 0;
      do
      {
        double v9 = v8;
        int v8 = objc_msgSend(v4, "rowBlockForRowNumber:currentRowBlock:createIfNil:", v7, v8, 0, v27);

        if (v8)
        {
          uint64_t v10 = [v8 rowInfoWithRowNumber:v7];
          uint64_t v11 = v10;
          if (v10)
          {
            if (*(_DWORD *)(v10 + 8))
            {
              uint64_t v12 = 0;
              char v31 = 1;
              do
              {
                int v13 = (EDCellHeader *)[v8 cellAtIndex:v12 rowInfo:v11];
                uint64_t v14 = columnNumberForEDCell(v13);
                int v15 = [v33 referenceContainingRow:v7 column:v14];
                int v16 = [v15 lastColumn];
                if (v16 == 0x3FFF && v14 == 0) {
                  uint64_t v18 = 0;
                }
                else {
                  uint64_t v18 = v16;
                }
                unsigned int v19 = typeForEDCell(v13);
                if (v19)
                {
                  if (v19 != 3) {
                    goto LABEL_18;
                  }
                  double v20 = [v30 document];
                  v21 = [v20 resources];
                  double v22 = stringValueForEDCell(v13, v21);

                  int64_t v23 = [v22 string];
                  uint64_t v24 = [v23 length];

                  if (v24)
                  {
LABEL_18:
                    uint64_t mMaxPopulatedColumn = v32->mMaxPopulatedColumn;
                    BOOL v26 = mMaxPopulatedColumn < v14;
                    if (mMaxPopulatedColumn <= v14) {
                      uint64_t mMaxPopulatedColumn = v14;
                    }
                    if (v26 || mMaxPopulatedColumn < v18)
                    {
                      char v31 = 0;
                      if (mMaxPopulatedColumn <= v18) {
                        uint64_t mMaxPopulatedColumn = v18;
                      }
                      v32->uint64_t mMaxPopulatedColumn = mMaxPopulatedColumn;
                    }
                    else
                    {
                      char v31 = 0;
                    }
                  }
                }

                uint64_t v12 = (v12 + 1);
              }
              while (v12 < *(_DWORD *)(v11 + 8));
              uint64_t v6 = v28;
              double v4 = v29;
              if ((v31 & 1) == 0 && (uint64_t)*(Class *)((char *)&v32->super.super.super.isa + v27) < (uint64_t)v7) {
                *(Class *)((char *)&v32->super.super.super.isa + v27) = v7;
              }
            }
          }
        }
        id v7 = (objc_class *)((char *)v7 + 1);
      }
      while (v7 != v6);
    }
  }
}

- (void)setRowGrid
{
  if ((self->mMaxPopulatedRow & 0x8000000000000000) == 0)
  {
    id v13 = [(EDWorksheet *)self->edWorksheet rowBlocks];
    int64_t mMaxPopulatedRow = self->mMaxPopulatedRow;
    unint64_t v4 = mMaxPopulatedRow + 1;
    if (mMaxPopulatedRow == -1)
    {
      self->mRowGrid = 0;
    }
    else
    {
      if (8 * v4 / v4 == 8)
      {
        int v5 = (double *)malloc_type_malloc(8 * v4, 0xD809582AuLL);
        int64_t mMaxPopulatedRow = self->mMaxPopulatedRow;
      }
      else
      {
        int v5 = 0;
      }
      self->mRowGrid = v5;
      if ((mMaxPopulatedRow & 0x8000000000000000) == 0)
      {
        uint64_t v6 = 0;
        id v7 = 0;
        unsigned int v8 = 1;
        do
        {
          double v9 = [v13 rowBlockForRowNumber:v8 - 1 currentRowBlock:v7 createIfNil:0];

          uint64_t v10 = [v9 rowInfoWithRowNumber:v8 - 1];
          if (!v10 || (unsigned int v11 = *(unsigned __int16 *)(v10 + 20)) == 0) {
            unsigned int v11 = [(EDWorksheet *)self->edWorksheet defaultRowHeight];
          }
          self->mRowGrid[v6] = (double)v11;
          uint64_t v6 = v8;
          BOOL v12 = self->mMaxPopulatedRow < v8++;
          id v7 = v9;
        }
        while (!v12);
      }
    }
  }
}

- (id)columnWidthConvertor
{
  mColumnWidthConvertor = self->mColumnWidthConvertor;
  if (!mColumnWidthConvertor)
  {
    unint64_t v4 = objc_alloc_init(ECColumnWidthConvertor);
    int v5 = self->mColumnWidthConvertor;
    self->mColumnWidthConvertor = v4;

    uint64_t v6 = self->mColumnWidthConvertor;
    id WeakRetained = objc_loadWeakRetained((id *)&self->super.super.mParent);
    unsigned int v8 = [WeakRetained document];
    double v9 = [v8 resources];
    uint64_t v10 = [v9 styles];
    unsigned int v11 = [v10 defaultWorkbookStyle];
    BOOL v12 = [v11 font];
    [(ECColumnWidthConvertor *)v6 setupWithEDFont:v12 state:0];

    mColumnWidthConvertor = self->mColumnWidthConvertor;
  }
  return mColumnWidthConvertor;
}

- (int)preprocessHeightWithState:(id)a3
{
  [(EMWorksheetMapper *)self _initWithState:a3];
  unint64_t v4 = [(EDWorksheet *)self->edWorksheet rowBlocks];
  int v5 = [v4 maxPopulatedRow];
  if (v5 == -1)
  {
    int v8 = 0;
  }
  else
  {
    uint64_t v6 = 0;
    id v7 = 0;
    int v8 = 0;
    int v9 = -1;
    do
    {
      uint64_t v10 = v7;
      id v7 = [v4 rowBlockForRowNumber:v6 currentRowBlock:v7 createIfNil:0];

      if (v7)
      {
        uint64_t v11 = [v7 rowInfoWithRowNumber:v6];
        uint64_t v13 = v11;
        if (v11)
        {
          int v14 = *(_DWORD *)(v11 + 4);
          if (v14 > SLODWORD(self->mMaxPopulatedRow)) {
            break;
          }
          if (v9 + 1 < v14)
          {
            int v15 = ~v9 + v14;
            do
            {
              double v12 = (double)[(EDWorksheet *)self->edWorksheet defaultRowHeight] / 20.0 + (double)v8;
              int v8 = (int)v12;
              --v15;
            }
            while (v15);
          }
          LOWORD(v12) = *(_WORD *)(v13 + 20);
          int v8 = (int)((double)*(unint64_t *)&v12 / 20.0 + (double)v8);
          int v9 = v14;
        }
      }
      BOOL v16 = v6 == v5;
      uint64_t v6 = (v6 + 1);
    }
    while (!v16);
  }
  return v8;
}

- (CGSize)preprocessDrawableSizeWithState:(id)a3
{
  double v5 = *MEMORY[0x263F001B0];
  double v4 = *(double *)(MEMORY[0x263F001B0] + 8);
  unint64_t v6 = [(EDSheet *)self->edWorksheet drawableCount];
  if (v6)
  {
    unint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
    {
      int v9 = [(EDSheet *)self->edWorksheet drawableAtIndex:i];
      uint64_t v10 = [[EMDrawableMapper alloc] initWithOADDrawable:v9 parent:self];
      [(EMDrawableMapper *)v10 getImageRect];
      double v15 = v13 + v14;
      if (v15 > v5) {
        double v5 = v15;
      }
      if (v11 + v12 > v4) {
        double v4 = v11 + v12;
      }
    }
  }
  double v16 = v5;
  double v17 = v4;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  [(EMWorksheetMapper *)self _initWithState:v6];
  unint64_t v7 = +[OIXMLElement elementWithType:3];
  [(EMWorksheetMapper *)self readHyperlinksWithState:v6];
  [(EMWorksheetMapper *)self mapTableAt:v7 withState:v6];
  [(EMWorksheetMapper *)self mapDrawablesAt:v7 withState:v6];
  if ([v7 childrenCount] >= 1) {
    [v8 addChild:v7];
  }
}

- (void)mapTableAt:(id)a3 withState:(id)a4
{
  id v24 = a3;
  id v6 = a4;
  int v25 = v6;
  if ([(EMWorksheetMapper *)self isVisible])
  {
    uint64_t v27 = [(EDWorksheet *)self->edWorksheet rowBlocks];
    if ((self->mMaxPopulatedRow & 0x8000000000000000) == 0)
    {
      unint64_t v7 = +[OIXMLElement elementWithType:18];
      [v24 addChild:v7];
      [(EMWorksheetMapper *)self mapColumnInfosAt:v7 withState:v6];
      id v8 = [(CMStyle *)self->mStyle cssStyleString];
      int v9 = +[OIXMLAttribute attributeWithName:@"style" stringValue:v8];

      [v7 addAttribute:v9];
      [(EMWorksheetMapper *)self mapWorksheetClassesAtTableNode:v7];
      if ((self->mMaxPopulatedRow & 0x8000000000000000) == 0)
      {
        int64_t v23 = v9;
        unint64_t v10 = 0;
        double v11 = 0;
        int v12 = -1;
        do
        {
          double v13 = objc_msgSend(v27, "rowBlockForRowNumber:currentRowBlock:createIfNil:", v10, v11, 0, v23);

          if (v13)
          {
            uint64_t v14 = [v13 rowInfoWithRowNumber:v10];
            uint64_t v15 = v14;
            if (v14)
            {
              int v16 = *(_DWORD *)(v14 + 4);
              if (v16 > SLODWORD(self->mMaxPopulatedRow)) {
                break;
              }
              int v26 = *(_DWORD *)(v14 + 4);
              if (v12 + 1 < v16)
              {
                int v17 = ~v12 + v16;
                do
                {
                  +[EMRowMapper mapEmptyRowAt:v7 colspan:self->mMaxPopulatedColumn + 1 height:(double)[(EDWorksheet *)self->edWorksheet defaultRowHeight]];
                  self->mHeight = (int)((double)[(EDWorksheet *)self->edWorksheet defaultRowHeight]
                                      / 20.0
                                      + (double)self->mHeight);
                  --v17;
                }
                while (v17);
              }
              uint64_t v18 = [[EMRowMapper alloc] initWithEDRowBlock:v13 rowInfo:v15 parent:self];
              LOWORD(v19) = *(_WORD *)(v15 + 20);
              self->mHeight = (int)((double)v19 / 20.0 + (double)self->mHeight);
              id v6 = v25;
              [(EMRowMapper *)v18 mapAt:v7 withState:v25];
              char v20 = [v25 isThumbnail];
              char v21 = v10 > 0xC8 ? v20 : 0;

              int v12 = v26;
              if (v21) {
                break;
              }
            }
          }
          if (v10 > 0xFFE) {
            break;
          }
          double v11 = v13;
        }
        while (self->mMaxPopulatedRow > (uint64_t)v10++);

        int v9 = v23;
      }
    }
  }
}

- (BOOL)isVisible
{
  if ([(EDSheet *)self->edWorksheet isHidden]) {
    return 0;
  }
  double v4 = [(EDWorksheet *)self->edWorksheet rowBlocks];
  if ([v4 rowBlockCount])
  {
    BOOL v3 = 1;
  }
  else
  {
    double v5 = [(EDWorksheet *)self->edWorksheet columnInfos];
    if ([v5 count])
    {
      BOOL v3 = 1;
    }
    else
    {
      id v6 = [(EDWorksheet *)self->edWorksheet maxCellReferencedInFormulas];
      BOOL v3 = v6 != 0;
    }
  }

  return v3;
}

- (void)mapColumnInfosAt:(id)a3 withState:(id)a4
{
  id v39 = a3;
  id v38 = a4;
  if ((self->mMaxPopulatedColumn & 0x8000000000000000) == 0)
  {
    [(EDWorksheet *)self->edWorksheet defaultColumnWidth];
    double v7 = v6;
    id v8 = [(EDWorksheet *)self->edWorksheet columnInfos];
    v36 = v8;
    uint64_t v9 = [v8 count];
    if (v9)
    {
      uint64_t v37 = v9;
      uint64_t v10 = 0;
      int v11 = -1;
      double v12 = 0.0;
      while (v11 < SLODWORD(self->mMaxPopulatedColumn))
      {
        double v13 = [v8 objectAtIndex:v10];
        uint64_t v14 = v13;
        if (v13)
        {
          uint64_t v15 = [v13 range];
          int v16 = [v15 firstColumn];
          int v17 = [v15 lastColumn];
          if (v16 < 0 || (int v18 = v17, v17 < 0) || self->mMaxPopulatedColumn < v16 || !self->mColumnGrid)
          {

            int v18 = v11;
            id v8 = v36;
            goto LABEL_27;
          }
          if (v11 + 1 < v16)
          {
            unint64_t v19 = [[EMColumnInfoMapper alloc] initWithDefaultWidth:v16 + ~v11 span:self parent:v7];
            [(EMColumnInfoMapper *)v19 mapAt:v39 withState:v38];
            [(EMColumnInfoMapper *)v19 columnWidth];
            int v21 = ~v11 + v16;
            double v22 = &self->mColumnGrid[v11 + 1];
            do
            {
              *v22++ = v20;
              double v12 = v20 + v12;
              --v21;
            }
            while (v21);
          }
          double v23 = 0.0;
          if (([v14 isHidden] & 1) == 0)
          {
            id v24 = [[EMColumnInfoMapper alloc] initWithEDColumnInfo:v14 maxSpan:self->mMaxPopulatedColumn - v11 parent:self];
            [(EMColumnInfoMapper *)v24 mapAt:v39 withState:v38];
            [(EMColumnInfoMapper *)v24 columnWidth];
            double v23 = v25;
          }
          if (v16 <= v18)
          {
            int64_t v26 = v16;
            int64_t mMaxPopulatedColumn = self->mMaxPopulatedColumn;
            int v28 = v18 - v16 + 1;
            do
            {
              if (mMaxPopulatedColumn < v26) {
                break;
              }
              self->mColumnGrid[v26] = v23;
              double v12 = v23 + v12;
              ++v26;
              --v28;
            }
            while (v28);
          }

          int v11 = v18;
          id v8 = v36;
        }
        else
        {
          int v18 = v11;
        }
        if (++v10 == v37) {
          goto LABEL_27;
        }
      }
      int v18 = v11;
    }
    else
    {
      double v12 = 0.0;
      int v18 = -1;
    }
LABEL_27:
    if (v18 < SLODWORD(self->mMaxPopulatedColumn) && self->mColumnGrid)
    {
      int64_t v29 = [[EMColumnInfoMapper alloc] initWithDefaultWidth:self->mMaxPopulatedColumn - v18 span:self parent:v7];
      [(EMColumnInfoMapper *)v29 mapAt:v39 withState:v38];
      [(EMColumnInfoMapper *)v29 columnWidth];
      int64_t v31 = self->mMaxPopulatedColumn;
      if (v31 >= v18 + 1)
      {
        uint64_t v32 = v18 + 1;
        mColumnGrid = self->mColumnGrid;
        uint64_t v34 = v18 + 1;
        do
        {
          mColumnGrid[v32] = v30;
          double v12 = v30 + v12;
          uint64_t v32 = ++v34;
        }
        while (v31 >= v34);
      }
    }
    v35 = [[CMLengthProperty alloc] initWithNumber:v12];
    [(CMStyle *)self->mStyle addProperty:v35 forKey:@"width"];
    self->mWidth = (int)v12;
  }
}

- (double)columnGrid
{
  return self->mColumnGrid;
}

- (unint64_t)columnCount
{
  return self->mMaxPopulatedColumn + 1;
}

- (void)mapDrawablesAt:(id)a3 withState:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  unint64_t v7 = [(EDSheet *)self->edWorksheet drawableCount];
  if (v7)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      uint64_t v9 = [(EDSheet *)self->edWorksheet drawableAtIndex:i];
      uint64_t v10 = [[EMDrawableMapper alloc] initWithOADDrawable:v9 parent:self];
      [(EMDrawableMapper *)v10 mapAt:v17 withState:v6];
      [(CMDrawableMapper *)v10 box];
      int v15 = (int)(v13 + v14);
      if (self->mWidth < v15) {
        self->mWidth = v15;
      }
      int v16 = (int)(v11 + v12);
      if (self->mHeight < v16) {
        self->mHeight = v16;
      }
    }
  }
}

- (int)width
{
  return self->mWidth;
}

- (int)height
{
  return self->mHeight;
}

- (void)dealloc
{
  mColumnGrid = self->mColumnGrid;
  if (mColumnGrid) {
    free(mColumnGrid);
  }
  mRowGrid = self->mRowGrid;
  if (mRowGrid) {
    free(mRowGrid);
  }
  v5.receiver = self;
  v5.super_class = (Class)EMWorksheetMapper;
  [(EMWorksheetMapper *)&v5 dealloc];
}

- (double)rowGrid
{
  return self->mRowGrid;
}

- (int64_t)maxRowNumber
{
  return self->mMaxPopulatedRow;
}

- (double)defaultColumnWidth
{
  [(EDWorksheet *)self->edWorksheet defaultColumnWidth];
  -[EMWorksheetMapper xlColumnWidthToPoints:](self, "xlColumnWidthToPoints:");
  return result;
}

- (double)xlColumnWidthToPoints:(double)a3
{
  return a3 * 5.83300018;
}

- (double)defaultRowHeight
{
  return (double)[(EDWorksheet *)self->edWorksheet defaultRowHeight];
}

- (void)readHyperlinksWithState:(id)a3
{
  id v12 = a3;
  double v4 = [(EDWorksheet *)self->edWorksheet hyperlinks];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      unint64_t v7 = [(EDWorksheet *)self->edWorksheet hyperlinks];
      id v8 = [v7 objectAtIndex:i];

      uint64_t v9 = [v8 reference];
      int v10 = [v9 firstRow];
      double v11 = [v8 reference];
      objc_msgSend(v12, "setHyperlink:forRow:column:", v8, v10, (int)objc_msgSend(v11, "firstColumn"));
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mColumnWidthConvertor, 0);
  objc_storeStrong((id *)&self->mStyle, 0);
  objc_storeStrong((id *)&self->edWorksheet, 0);
}

- (void)mapWorksheetClassesAtTableNode:(id)a3
{
  id v7 = a3;
  if ([(EDSheet *)self->edWorksheet isDisplayGridlines])
  {
    double v4 = [&unk_26EC80B88 arrayByAddingObject:@"showGridlines"];
  }
  else
  {
    double v4 = &unk_26EC80B88;
  }
  uint64_t v5 = [v4 componentsJoinedByString:@" "];
  id v6 = +[OIXMLAttribute attributeWithName:@"class" stringValue:v5];

  [v7 addAttribute:v6];
}

@end