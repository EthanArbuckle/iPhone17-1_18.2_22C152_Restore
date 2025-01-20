@interface OADTable
+ (void)applyTextStyle:(id)a3 toParagraphProperties:(id)a4;
- (OADTMatrixPos)masterPosOfPos:(OADTMatrixPos)a3;
- (OADTable)init;
- (id)addRow;
- (id)cellAtPos:(OADTMatrixPos)a3;
- (id)description;
- (id)grid;
- (id)masterCellOfPos:(OADTMatrixPos)a3;
- (id)rowAtIndex:(unint64_t)a3;
- (id)tableProperties;
- (unint64_t)rowCount;
- (void)changeParentTextListStylePreservingEffectiveValues:(id)a3;
- (void)flattenStyle;
- (void)flipTableRTL;
- (void)setParentTextListStyle:(id)a3;
@end

@implementation OADTable

- (OADTable)init
{
  uint64_t v3 = objc_opt_class();
  v10.receiver = self;
  v10.super_class = (Class)OADTable;
  v4 = [(OADDrawable *)&v10 initWithPropertiesClass:v3];
  if (v4)
  {
    v5 = objc_alloc_init(OADTableGrid);
    mGrid = v4->mGrid;
    v4->mGrid = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mRows = v4->mRows;
    v4->mRows = v7;
  }
  return v4;
}

- (id)tableProperties
{
  return self->super.mDrawableProperties;
}

- (id)grid
{
  return self->mGrid;
}

- (id)addRow
{
  uint64_t v3 = objc_alloc_init(OADTableRow);
  [(NSMutableArray *)self->mRows addObject:v3];
  return v3;
}

- (void)setParentTextListStyle:(id)a3
{
  id v11 = a3;
  unint64_t v4 = [(OADTable *)self rowCount];
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      v6 = [(OADTable *)self rowAtIndex:i];
      uint64_t v7 = [v6 cellCount];
      if (v7)
      {
        for (uint64_t j = 0; j != v7; ++j)
        {
          v9 = [v6 cellAtIndex:j];
          objc_super v10 = [v9 textBody];
          [v10 setParentTextListStyle:v11];
        }
      }
    }
  }
}

- (unint64_t)rowCount
{
  return [(NSMutableArray *)self->mRows count];
}

- (id)rowAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->mRows objectAtIndex:a3];
}

- (void)flipTableRTL
{
  [(OADTableGrid *)self->mGrid flipColumnsRTL];
  unint64_t v3 = [(OADTable *)self rowCount];
  if (v3)
  {
    unint64_t v4 = v3;
    for (uint64_t i = 0; i != v4; ++i)
    {
      v6 = [(OADTable *)self rowAtIndex:i];
      [v6 flipCellsRTL];
    }
  }
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADTable;
  v2 = [(OADDrawable *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mRows, 0);
  objc_storeStrong((id *)&self->mGrid, 0);
}

- (id)cellAtPos:(OADTMatrixPos)a3
{
  objc_super v4 = [(OADTable *)self rowAtIndex:a3.var0];
  v5 = [v4 cellAtIndex:*(uint64_t *)&a3 >> 32];

  return v5;
}

- (OADTMatrixPos)masterPosOfPos:(OADTMatrixPos)a3
{
  if (a3.var0 < 1)
  {
    unsigned int var0 = a3.var0;
  }
  else
  {
    unsigned int v5 = a3.var0;
    do
    {
      v6 = [(OADTable *)self cellAtPos:*(void *)&a3 & 0xFFFFFFFF00000000 | v5];
      char v7 = [v6 vertMerge];
      --v5;
    }
    while ((v7 & 1) != 0);
    unsigned int var0 = v5 + 1;
  }
  unint64_t v9 = HIDWORD(*(unint64_t *)&a3);
  if (*(uint64_t *)&a3 <= 0)
  {
    return (OADTMatrixPos)(*(void *)&a3 & 0xFFFFFFFF00000000 | var0);
  }
  else
  {
    uint64_t v10 = var0;
    do
    {
      OADTMatrixPos v11 = (OADTMatrixPos)(v10 | (v9 << 32));
      v12 = [(OADTable *)self cellAtPos:v11];
      char v13 = [v12 horzMerge];
      unint64_t v9 = (v9 - 1);
    }
    while ((v13 & 1) != 0);
  }
  return v11;
}

- (id)masterCellOfPos:(OADTMatrixPos)a3
{
  OADTMatrixPos v4 = [(OADTable *)self masterPosOfPos:a3];
  return [(OADTable *)self cellAtPos:v4];
}

- (void)flattenStyle
{
  v2 = [(OADTableStyleResolver *)[OADTableStyleFlattener alloc] initWithTable:self];
  [(OADTableStyleResolver *)v2 flatten];
}

+ (void)applyTextStyle:(id)a3 toParagraphProperties:(id)a4
{
  id v14 = a3;
  id v5 = a4;
  v6 = [v5 parent];
  [v5 setParent:0];
  char v7 = [v14 fontReference];

  if (v7)
  {
    v8 = [v14 fontReference];
    [v8 setColor:0];

    unint64_t v9 = [v14 fontReference];
    [v9 applyToParagraphProperties:v5];
  }
  uint64_t v10 = [v14 color];
  if (v10)
  {
    char v11 = [v5 hasFill];

    if ((v11 & 1) == 0)
    {
      v12 = objc_alloc_init(OADSolidFill);
      char v13 = [v14 color];
      [(OADSolidFill *)v12 setColor:v13];

      [v5 setFill:v12];
    }
  }
  if ([v14 bold] != 2 && (objc_msgSend(v5, "hasIsBold") & 1) == 0) {
    objc_msgSend(v5, "setIsBold:", objc_msgSend(v14, "bold") == 0);
  }
  if ([v14 italic] != 2 && (objc_msgSend(v5, "hasIsItalic") & 1) == 0) {
    objc_msgSend(v5, "setIsItalic:", objc_msgSend(v14, "italic") == 0);
  }
  [v5 setParent:v6];
}

- (void)changeParentTextListStylePreservingEffectiveValues:(id)a3
{
  id v14 = a3;
  OADTMatrixPos v4 = [(OADTable *)self tableProperties];
  id v5 = [v4 style];

  if (v5)
  {
    v6 = [[OADTableUnnecessaryOverrideRemover alloc] initWithTable:self parentTextListStyle:v14];
    [(OADTableStyleResolver *)v6 flatten];
  }
  else
  {
    unint64_t v7 = [(OADTable *)self rowCount];
    if (v7)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        unint64_t v9 = [(OADTable *)self rowAtIndex:i];
        uint64_t v10 = [v9 cellCount];
        if (v10)
        {
          for (uint64_t j = 0; j != v10; ++j)
          {
            v12 = [v9 cellAtIndex:j];
            char v13 = [v12 textBody];
            [v13 changeParentTextListStylePreservingEffectiveValues:v14 ownTextListStyle:0];
          }
        }
      }
    }
  }
}

@end