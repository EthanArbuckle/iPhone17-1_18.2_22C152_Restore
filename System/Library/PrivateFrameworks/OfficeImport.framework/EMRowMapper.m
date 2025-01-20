@interface EMRowMapper
+ (void)mapEmptyRowAt:(id)a3 colspan:(unint64_t)a4 height:(double)a5;
- (BOOL)isColumnHidden:(unint64_t)a3;
- (BOOL)isMergedCell:(EDCellHeader *)a3;
- (EDCellHeader)cellWithColumnNumber:(unint64_t)a3;
- (EMRowMapper)initWithEDRowBlock:(id)a3 rowInfo:(EDRowInfo *)a4 parent:(id)a5;
- (void)insertEmptyCellAt:(id)a3 withColSpan:(unint64_t)a4 height:(double)a5;
- (void)mapAt:(id)a3 withState:(id)a4;
- (void)mapEmptyCellsAt:(id)a3 withState:(id)a4 firstColumn:(unint64_t)a5 lastColumn:(unint64_t)a6;
@end

@implementation EMRowMapper

- (EMRowMapper)initWithEDRowBlock:(id)a3 rowInfo:(EDRowInfo *)a4 parent:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)EMRowMapper;
  v11 = [(CMMapper *)&v15 initWithParent:v10];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->mRowBlock, a3);
    v12->mRowInfo = a4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12->columnGrid = (double *)[v10 columnGrid];
      uint64_t v13 = [v10 columnCount];
    }
    else
    {
      uint64_t v13 = 0;
      v12->columnGrid = 0;
    }
    v12->columnCount = v13;
  }

  return v12;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v27 = a3;
  id v29 = a4;
  if ((*((unsigned char *)self->mRowInfo + 23) & 2) != 0) {
    goto LABEL_45;
  }
  v28 = +[OIXMLElement elementWithType:21];
  uint64_t v6 = objc_msgSend(v27, "addChild:");
  unsigned int var2 = self->mRowInfo->var2;
  uint64_t v8 = MEMORY[0x23EC9A170](v6);
  if (var2 >= 0x401)
  {
    uint64_t v9 = 0;
    int v10 = 0;
    do
    {
      if (!+[EMCellMapper isCellEmpty:[(EDRowBlock *)self->mRowBlock cellAtIndex:v9 rowInfo:self->mRowInfo]])int v10 = v9; {
      uint64_t v9 = (v9 + 1);
      }
    }
    while (var2 != v9);
    if (var2 >= v10 + 1) {
      unsigned int var2 = v10 + 1;
    }
  }
  v26 = (void *)v8;
  if (!var2)
  {
    v16 = 0;
    v11 = 0;
    uint64_t v13 = 0xFFFFFFFFLL;
    goto LABEL_38;
  }
  v11 = 0;
  int v12 = -var2;
  uint64_t v13 = 0xFFFFFFFFLL;
  uint64_t v14 = 1;
  while (1)
  {
    objc_super v15 = [(EDRowBlock *)self->mRowBlock cellAtIndex:(v14 - 1) rowInfo:self->mRowInfo];
    if (v12 + v14) {
      v16 = [(EDRowBlock *)self->mRowBlock cellAtIndex:v14 rowInfo:self->mRowInfo];
    }
    else {
      v16 = 0;
    }
    int v17 = columnNumberForEDCell(v15);
    if ([(EMRowMapper *)self isColumnHidden:v17]) {
      goto LABEL_34;
    }
    v18 = [[EMCellMapper alloc] initWithEDCell:v15 rowInfo:self->mRowInfo parent:self state:v29];
    v19 = v18;
    if (!v11) {
      break;
    }
    if (![(EMCellMapper *)v18 isCellEmpty]
      || ![(EMCellMapper *)v19 isCellSpreading:v29])
    {
      LODWORD(v13) = v17 - 1;
      [(EMCellMapper *)v11 setLastColumn:(v17 - 1)];
      [(EMCellMapper *)v11 adjustColumnSpanForGrid:self->columnGrid columnCount:self->columnCount nextCell:v16 withState:v29];
      [(EMCellMapper *)v11 mapAt:v28 withState:v29 height:v16 nextCell:0.0];

      break;
    }
    uint64_t v13 = [(EMCellMapper *)v19 lastColumn];
LABEL_33:

LABEL_34:
    uint64_t v14 = (v14 + 1);
    if (v12 + v14 == 1) {
      goto LABEL_38;
    }
  }
  if (v13 == -1) {
    [(EMCellMapper *)v19 setFirstCellFlag];
  }
  if (v17 > (int)v13 + 1) {
    [(EMRowMapper *)self mapEmptyCellsAt:v28 withState:v29 firstColumn:(int)v13 + 1 lastColumn:v17 - 1];
  }
  uint64_t v13 = [(EMCellMapper *)v19 lastColumn];
  if ([(EMCellMapper *)v19 isCellMerged])
  {
    v11 = 0;
    goto LABEL_33;
  }
  if ([(EMCellMapper *)v19 isCellSpreading:v29])
  {
    v11 = v19;
  }
  else
  {
    [(EMCellMapper *)v19 adjustColumnSpanForGrid:self->columnGrid columnCount:self->columnCount nextCell:v16 withState:v29];
    v11 = 0;
    [(EMCellMapper *)v19 mapAt:v28 withState:v29 height:v16 nextCell:0.0];
  }
  char v20 = [v29 isThumbnail];
  if ((v14 - 1) > 0x64) {
    char v21 = v20;
  }
  else {
    char v21 = 0;
  }
  if ((v21 & 1) == 0) {
    goto LABEL_33;
  }

LABEL_38:
  mRowInfo = self->mRowInfo;
  if (*((unsigned char *)mRowInfo + 23))
  {
    v23 = [[CMLengthProperty alloc] initWithNumber:(double)mRowInfo->var5 / 20.0];
    v24 = [(CMLengthProperty *)v23 cssString];
    v25 = +[OIXMLAttribute attributeWithName:@"height" stringValue:v24];
    [v28 addAttribute:v25];
  }
  if (v11)
  {
    [(EMCellMapper *)v11 setLastColumn:v13];
    [(EMCellMapper *)v11 adjustColumnSpanForGrid:self->columnGrid columnCount:self->columnCount nextCell:0 withState:v29];
    [(EMCellMapper *)v11 mapAt:v28 withState:v29 height:v16 nextCell:0.0];
    LODWORD(v13) = [(EMCellMapper *)v11 lastColumn];
  }
  if (self->columnCount - 1 > (int)v13) {
    -[EMRowMapper mapEmptyCellsAt:withState:firstColumn:lastColumn:](self, "mapEmptyCellsAt:withState:firstColumn:lastColumn:", v28, v29, (int)v13 + 1);
  }

LABEL_45:
}

- (BOOL)isColumnHidden:(unint64_t)a3
{
  columnGrid = self->columnGrid;
  return columnGrid && self->columnCount > a3 && columnGrid[a3] <= 0.0;
}

- (void)mapEmptyCellsAt:(id)a3 withState:(id)a4 firstColumn:(unint64_t)a5 lastColumn:(unint64_t)a6
{
  id v20 = a3;
  for (id i = a4; a5 <= a6; ++a5)
  {
    if (![(EMRowMapper *)self isColumnHidden:a5])
    {
      v11 = [(EMRowMapper *)self cellWithColumnNumber:a5];
      if (v11)
      {
        BOOL v12 = 0;
      }
      else
      {
        uint64_t v13 = [i currentSheet];
        uint64_t v14 = [v13 columnInfos];

        objc_super v15 = [v14 columnInfoForColumnNumber:a5];
        v16 = [v15 style];
        BOOL v12 = v16 != 0;
        if (v16)
        {
          v11 = (EDCellHeader *)malloc_type_malloc(8uLL, 0x100004000313F17uLL);
          initEDCell((int *)v11, a5, 0, 0);
          v11->var1 = [v16 index];
        }
        else
        {
          v11 = 0;
        }

        if (!v11)
        {
          double v19 = 0.0;
          if (!a5)
          {
            LOWORD(v19) = self->mRowInfo->var5;
            double v19 = (double)*(unint64_t *)&v19 / 20.0;
          }
          [(EMRowMapper *)self insertEmptyCellAt:v20 withColSpan:1 height:v19];
          if (!v16) {
            continue;
          }
          v11 = 0;
LABEL_13:
          free(v11);
          continue;
        }
      }
      int v17 = [[EMCellMapper alloc] initWithEDCell:v11 rowInfo:self->mRowInfo parent:self state:i];
      LOWORD(v18) = self->mRowInfo->var5;
      [(EMCellMapper *)v17 mapAt:v20 withState:i height:0 nextCell:(double)v18 / 20.0];

      if (v12) {
        goto LABEL_13;
      }
    }
  }
}

- (EDCellHeader)cellWithColumnNumber:(unint64_t)a3
{
  v4 = [(EDRowBlock *)self->mRowBlock cellWithColumnNumber:a3 rowInfo:self->mRowInfo];
  if (columnNumberForEDCell(v4) == a3) {
    return v4;
  }
  else {
    return 0;
  }
}

- (void)insertEmptyCellAt:(id)a3 withColSpan:(unint64_t)a4 height:(double)a5
{
  id v12 = a3;
  uint64_t v8 = +[OIXMLElement elementWithType:19];
  [v12 addChild:v8];
  if (a5 > 0.0)
  {
    uint64_t v9 = objc_alloc_init(CMStyle);
    [(CMStyle *)v9 appendPropertyForName:0x26EC07B38 intValue:(int)a5];
    [(CMMapper *)self addStyleUsingGlobalCacheTo:v8 style:v9];
  }
  if (a4 >= 2)
  {
    int v10 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", a4);
    v11 = +[OIXMLAttribute attributeWithName:@"colspan" stringValue:v10];
    [v8 addAttribute:v11];
  }
}

+ (void)mapEmptyRowAt:(id)a3 colspan:(unint64_t)a4 height:(double)a5
{
  id v12 = a3;
  v7 = +[OIXMLElement elementWithType:21];
  [v12 addChild:v7];
  uint64_t v8 = +[OIXMLElement elementWithType:19];
  [v7 addChild:v8];
  if (a5 > 0.0)
  {
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%d", (int)(a5 / 20.0));
    int v10 = +[OIXMLAttribute attributeWithName:@"height" stringValue:v9];

    [v8 addAttribute:v10];
  }
  if (a4 >= 2)
  {
    do
    {
      v11 = +[OIXMLElement elementWithType:19];
      [v7 addChild:v11];
      --a4;
    }
    while (a4 > 1);
  }
}

- (void).cxx_destruct
{
}

- (BOOL)isMergedCell:(EDCellHeader *)a3
{
  return edCellHasRef((uint64_t)a3);
}

@end