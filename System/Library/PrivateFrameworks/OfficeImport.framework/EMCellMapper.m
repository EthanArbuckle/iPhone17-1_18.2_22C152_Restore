@interface EMCellMapper
+ (BOOL)isCellEmpty:(EDCellHeader *)a3;
- (BOOL)isCellEmpty;
- (BOOL)isCellMerged;
- (BOOL)isCellSpreading:(id)a3;
- (BOOL)isFirstCell;
- (EMCellMapper)initWithEDCell:(EDCellHeader *)a3 rowInfo:(EDRowInfo *)a4 parent:(id)a5 state:(id)a6;
- (EMCellMapper)initWithParent:(id)a3;
- (double)columnWidth;
- (id)mapHyperlink:(id)a3 at:(id)a4;
- (int)columnSpan;
- (int)firstColumn;
- (int)lastColumn;
- (void)adjustColumnSpanForGrid:(double *)a3 columnCount:(unint64_t)a4 nextCell:(EDCellHeader *)a5 withState:(id)a6;
- (void)mapAt:(id)a3 withState:(id)a4 height:(double)a5 nextCell:(EDCellHeader *)a6;
- (void)mapRowColSpansAt:(id)a3 withState:(id)a4;
- (void)resetColumnSpan:(int)a3;
- (void)setFirstCellFlag;
- (void)setFirstColumn:(int)a3;
- (void)setLastColumn:(int)a3;
@end

@implementation EMCellMapper

- (EMCellMapper)initWithEDCell:(EDCellHeader *)a3 rowInfo:(EDRowInfo *)a4 parent:(id)a5 state:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v12 = [(EMCellMapper *)self initWithParent:v10];
  v13 = v12;
  if (v12)
  {
    v12->edCell = a3;
    v12->rowNumber = a4->var1;
    int v14 = columnNumberForEDCell(a3);
    v13->int firstColumn = v14;
    if (v13->edCell)
    {
      v15 = [v11 currentSheet];
      v16 = [v15 mergedCells];

      uint64_t v17 = [v16 referenceContainingRow:v13->rowNumber column:v13->firstColumn];
      edMergedCellReference = v13->edMergedCellReference;
      v13->edMergedCellReference = (EDReference *)v17;

      v19 = v13->edMergedCellReference;
      if (v19) {
        int firstColumn = [(EDReference *)v19 lastColumn];
      }
      else {
        int firstColumn = v13->firstColumn;
      }
      v13->lastColumn = firstColumn;

      int v14 = v13->firstColumn;
    }
    v13->columnSpan = v13->lastColumn - v14 + 1;
  }

  return v13;
}

- (EMCellMapper)initWithParent:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)EMCellMapper;
  result = [(CMMapper *)&v4 initWithParent:a3];
  if (result)
  {
    result->firstCellFlag = 0;
    result->spreadLeftFlag = 1;
    result->int firstColumn = -1;
    result->lastColumn = -1;
    result->edCell = 0;
    result->rowNumber = -1;
    result->columnWidth = 0.0;
  }
  return result;
}

- (void)setFirstCellFlag
{
  self->firstCellFlag = 1;
}

- (int)lastColumn
{
  return self->lastColumn;
}

- (BOOL)isCellMerged
{
  BOOL result = 0;
  if (self->edMergedCellReference)
  {
    unsigned int v3 = columnNumberForEDCell(self->edCell);
    self->int firstColumn = [(EDReference *)self->edMergedCellReference firstColumn];
    int rowNumber = self->rowNumber;
    if (__PAIR64__(v3, [(EDReference *)self->edMergedCellReference firstRow]) != __PAIR64__(self->firstColumn, rowNumber))return 1; {
  }
    }
  return result;
}

- (BOOL)isCellSpreading:(id)a3
{
  id v4 = a3;
  edCell = self->edCell;
  if (edCell && typeForEDCell(edCell))
  {
    v6 = self->edCell;
    v7 = [v4 document];
    v8 = [v7 resources];
    v9 = styleForEDCell(v6, v8);

    if ([v9 isAlignmentInfoOverridden])
    {
      id v10 = [v9 alignmentInfo];
      BOOL v11 = ([v10 isHorizontalAlignOverridden] & 1) != 0
         && [v10 horizontalAlignment] == 6;
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)adjustColumnSpanForGrid:(double *)a3 columnCount:(unint64_t)a4 nextCell:(EDCellHeader *)a5 withState:(id)a6
{
  id v22 = a6;
  int v10 = self->lastColumn - self->firstColumn + 1;
  self->columnSpan = v10;
  if (a3)
  {
    self->columnWidth = 0.0;
    unint64_t firstColumn = self->firstColumn;
    int lastColumn = self->lastColumn;
    if ((int)firstColumn <= lastColumn && firstColumn < a4)
    {
      double v14 = 0.0;
      do
      {
        double v15 = a3[firstColumn];
        if (v15 == 0.0)
        {
          self->columnSpan = --v10;
          int lastColumn = self->lastColumn;
        }
        double v14 = v14 + v15;
        self->columnWidth = v14;
        if (firstColumn + 1 >= a4) {
          break;
        }
      }
      while ((uint64_t)firstColumn++ < lastColumn);
    }
    if (a5 && typeForEDCell(a5) == 3)
    {
      uint64_t v17 = [v22 document];
      v18 = [v17 resources];
      v19 = stringValueForEDCell(a5, v18);
      if (v19)
      {
        int v20 = columnNumberForEDCell(a5);
        int v21 = self->lastColumn + 1;

        if (v20 == v21) {
          self->spreadLeftFlag = 0;
        }
      }
      else
      {
      }
    }
  }
}

- (void)mapRowColSpansAt:(id)a3 withState:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  if (self->columnSpan >= 2)
  {
    v7 = objc_msgSend(NSString, "stringWithFormat:", @"%d", self->columnSpan);
    v8 = +[OIXMLAttribute attributeWithName:@"colspan" stringValue:v7];
    [v14 addAttribute:v8];
  }
  edMergedCellReference = self->edMergedCellReference;
  if (edMergedCellReference)
  {
    int v10 = [(EDReference *)edMergedCellReference lastRow];
    int v11 = v10 - [(EDReference *)self->edMergedCellReference firstRow];
    if (v11 >= 1)
    {
      v12 = objc_msgSend(NSString, "stringWithFormat:", @"%d", (v11 + 1));
      v13 = +[OIXMLAttribute attributeWithName:@"rowspan" stringValue:v12];
      [v14 addAttribute:v13];
    }
  }
}

- (BOOL)isCellEmpty
{
  unsigned int v3 = objc_opt_class();
  edCell = self->edCell;
  return [v3 isCellEmpty:edCell];
}

- (void)setLastColumn:(int)a3
{
  self->int lastColumn = a3;
}

- (int)firstColumn
{
  return self->firstColumn;
}

- (void)setFirstColumn:(int)a3
{
  self->unint64_t firstColumn = a3;
}

- (double)columnWidth
{
  return self->columnWidth;
}

- (void)resetColumnSpan:(int)a3
{
  self->columnSpan = a3;
}

- (int)columnSpan
{
  return self->columnSpan;
}

+ (BOOL)isCellEmpty:(EDCellHeader *)a3
{
  return !a3 || typeForEDCell(a3) == 0;
}

- (BOOL)isFirstCell
{
  return self->firstCellFlag;
}

- (void)mapAt:(id)a3 withState:(id)a4 height:(double)a5 nextCell:(EDCellHeader *)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = +[OIXMLElement elementWithType:19];
  [v10 addChild:v12];
  edMergedCellReference = self->edMergedCellReference;
  if (edMergedCellReference
    && (int v14 = [(EDReference *)edMergedCellReference lastRow],
        v14 > [(EDReference *)self->edMergedCellReference firstRow]))
  {
    a5 = 0.0;
    int v15 = 1;
  }
  else
  {
    int v15 = [(id)objc_opt_class() isCellEmpty:a6];
  }
  [(EMCellMapper *)self mapRowColSpansAt:v12 withState:v11];
  v16 = [v11 hyperlinkForRow:self->rowNumber column:columnNumberForEDCell(self->edCell)];
  if (v16)
  {
    id v49 = [(EMCellMapper *)self mapHyperlink:v16 at:v12];
  }
  else
  {
    id v49 = v12;
  }

  edCell = self->edCell;
  v18 = [v11 document];
  v19 = [v18 resources];
  int v48 = v15;
  int v20 = styleForEDCell(edCell, v19);

  int v21 = typeForEDCell(self->edCell);
  id v22 = v21;
  if (v21 == 2)
  {
    v47 = v16;
    v32 = [EMCellNumberMapper alloc];
    double v33 = numberValueForEDCell(self->edCell);
    v34 = self->edCell;
    v35 = [v11 document];
    v36 = [v35 resources];
    v37 = styleForEDCell(v34, v36);
    double columnWidth = self->columnWidth;
    v39 = [v11 document];
    v40 = [(EMCellNumberMapper *)v32 initWithDoubleValue:v37 style:v39 columnWidth:self workbook:v33 parent:columnWidth];

    [(EMCellNumberMapper *)v40 mapAt:v49 withState:v11];
    unint64_t v31 = 0;
    v16 = v47;
  }
  else if (v21 == 3)
  {
    v23 = [EMCellTextMapper alloc];
    v24 = self->edCell;
    v25 = [v11 document];
    v26 = [v25 resources];
    v27 = stringValueForEDCell(v24, v26);
    v28 = [(EMCellTextMapper *)v23 initWithEDString:v27 style:v20 parent:self];

    [(EMCellTextMapper *)v28 mapAt:v49 withState:v11 columnWidth:self->spreadLeftFlag height:self->columnWidth spreadLeft:a5];
    [(EMCellTextMapper *)v28 contentWidth];
    double v30 = v29;

    unint64_t v31 = (unint64_t)v30;
  }
  else
  {
    unint64_t v31 = 0;
  }
  v41 = [v49 stringValue];
  uint64_t v42 = [v41 length];

  if (!v42) {
    [v49 setStringValue:@" "];
  }
  v43 = [[EMCellStyle alloc] initWithEDStyle:v20 type:v22 columnWidth:(unint64_t)self->columnWidth contentWidth:v31 truncateContents:v48 ^ 1u];
  v44 = [(CMMapper *)self archiver];
  v45 = [v44 addStyle:v43];

  if (v45)
  {
    [(CMMapper *)self addAttribute:@"class" toNode:v12 value:v45];
  }
  else
  {
    v46 = [(EMCellStyle *)v43 cssStyleString];
    if ([v46 length]) {
      [(CMMapper *)self addAttribute:@"style" toNode:v12 value:v46];
    }
  }
}

- (void).cxx_destruct
{
}

- (id)mapHyperlink:(id)a3 at:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && ![v6 type])
  {
    id v8 = +[OIXMLElement elementWithType:0];
    v9 = [v6 path];
    id v10 = [v9 string];
    [(CMMapper *)self addAttribute:0x26EC19118 toNode:v8 value:v10];

    [v7 addChild:v8];
  }
  else
  {
    id v8 = v7;
  }

  return v8;
}

@end