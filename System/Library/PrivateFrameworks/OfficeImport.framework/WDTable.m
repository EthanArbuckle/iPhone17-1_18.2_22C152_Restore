@interface WDTable
- (WDTable)initWithText:(id)a3;
- (id)addRow;
- (id)cellIterator;
- (id)description;
- (id)insertRowAtIndex:(unint64_t)a3;
- (id)newCellIterator;
- (id)newRowIterator;
- (id)newRunIterator;
- (id)properties;
- (id)rowAt:(unint64_t)a3;
- (id)rowIterator;
- (id)runIterator;
- (int)blockType;
- (int)nestingLevel;
- (unint64_t)rowCount;
- (void)clearProperties;
- (void)clearRows;
@end

@implementation WDTable

- (WDTable)initWithText:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WDTable;
  v5 = [(WDBlock *)&v13 initWithText:v4];
  if (v5)
  {
    v6 = [WDTableProperties alloc];
    v7 = [v4 document];
    uint64_t v8 = [(WDTableProperties *)v6 initWithDocument:v7];
    mProperties = v5->mProperties;
    v5->mProperties = (WDTableProperties *)v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mRows = v5->mRows;
    v5->mRows = v10;
  }
  return v5;
}

- (id)properties
{
  return self->mProperties;
}

- (id)addRow
{
  v3 = [[WDTableRow alloc] initWithTable:self at:[(WDTable *)self rowCount]];
  [(NSMutableArray *)self->mRows addObject:v3];
  return v3;
}

- (unint64_t)rowCount
{
  return [(NSMutableArray *)self->mRows count];
}

- (int)nestingLevel
{
  v3 = [(WDText *)self->super.mText tableCell];
  if (v3
    && ([(WDBlock *)self textType] != 4
     || ([v3 text],
         id v4 = objc_claimAutoreleasedReturnValue(),
         int v5 = [v4 textType],
         v4,
         v5 == 4)))
  {
    v6 = [v3 row];
    v7 = [v6 table];
    int v8 = [v7 nestingLevel] + 1;
  }
  else
  {
    int v8 = 1;
  }

  return v8;
}

- (int)blockType
{
  return 1;
}

- (id)rowAt:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->mRows objectAtIndex:a3];
}

- (void)clearProperties
{
  mProperties = self->mProperties;
  self->mProperties = 0;
}

- (id)insertRowAtIndex:(unint64_t)a3
{
  int v5 = [[WDTableRow alloc] initWithTable:self at:a3];
  [(NSMutableArray *)self->mRows insertObject:v5 atIndex:a3];
  unint64_t v6 = [(NSMutableArray *)self->mRows count];
  unint64_t v7 = a3 + 1;
  if (v7 < v6)
  {
    do
    {
      int v8 = [(NSMutableArray *)self->mRows objectAtIndex:v7];
      [v8 setIndex:v7];

      ++v7;
    }
    while (v6 != v7);
  }
  return v5;
}

- (void)clearRows
{
  mRows = self->mRows;
  self->mRows = 0;
}

- (id)rowIterator
{
  v2 = [[WDArrayIterator alloc] initWithArray:self->mRows];
  return v2;
}

- (id)newRowIterator
{
  v3 = [WDArrayIterator alloc];
  mRows = self->mRows;
  return [(WDArrayIterator *)v3 initWithArray:mRows];
}

- (id)cellIterator
{
  v3 = [WDTableRowCellIterator alloc];
  id v4 = [(WDTable *)self rowIterator];
  int v5 = [(WDCombinedIterator *)v3 initWithParentIterator:v4];

  return v5;
}

- (id)newCellIterator
{
  id v2 = [(WDTable *)self newRowIterator];
  v3 = [(WDCombinedIterator *)[WDTableRowCellIterator alloc] initWithParentIterator:v2];

  return v3;
}

- (id)runIterator
{
  v3 = [WDTableCellRunIterator alloc];
  id v4 = [(WDTable *)self cellIterator];
  int v5 = [(WDCombinedIterator *)v3 initWithParentIterator:v4];

  return v5;
}

- (id)newRunIterator
{
  id v2 = [(WDTable *)self newCellIterator];
  v3 = [(WDCombinedIterator *)[WDTableCellRunIterator alloc] initWithParentIterator:v2];

  return v3;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDTable;
  id v2 = [(WDBlock *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mRows, 0);
  objc_storeStrong((id *)&self->mProperties, 0);
}

@end