@interface WDTableRow
- (WDTable)table;
- (WDTableRow)initWithTable:(id)a3 at:(unint64_t)a4;
- (id)addCell;
- (id)addCellWithIndex:(unint64_t)a3;
- (id)cellAt:(unint64_t)a3;
- (id)cellIterator;
- (id)description;
- (id)newCellIterator;
- (id)properties;
- (unint64_t)cellCount;
- (unint64_t)index;
- (void)setIndex:(unint64_t)a3;
@end

@implementation WDTableRow

- (WDTableRow)initWithTable:(id)a3 at:(unint64_t)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WDTableRow;
  v7 = [(WDTableRow *)&v17 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->mTable, v6);
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mCells = v8->mCells;
    v8->mCells = v9;

    v11 = [WDTableRowProperties alloc];
    v12 = [v6 properties];
    v13 = [v12 document];
    uint64_t v14 = [(WDTableRowProperties *)v11 initWithDocument:v13];
    mProperties = v8->mProperties;
    v8->mProperties = (WDTableRowProperties *)v14;

    v8->mIndex = a4;
  }

  return v8;
}

- (id)properties
{
  return self->mProperties;
}

- (WDTable)table
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mTable);
  return (WDTable *)WeakRetained;
}

- (id)addCell
{
  v3 = [[WDTableCell alloc] initWithRow:self at:[(NSMutableArray *)self->mCells count]];
  [(NSMutableArray *)self->mCells addObject:v3];
  return v3;
}

- (unint64_t)cellCount
{
  return [(NSMutableArray *)self->mCells count];
}

- (id)cellAt:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->mCells objectAtIndex:a3];
}

- (void)setIndex:(unint64_t)a3
{
  self->mIndex = a3;
}

- (unint64_t)index
{
  return self->mIndex;
}

- (id)addCellWithIndex:(unint64_t)a3
{
  v4 = [[WDTableCell alloc] initWithRow:self at:a3];
  [(NSMutableArray *)self->mCells addObject:v4];
  [(NSMutableArray *)self->mCells sortUsingSelector:sel_compareIndex_];
  return v4;
}

- (id)cellIterator
{
  v2 = [[WDArrayIterator alloc] initWithArray:self->mCells];
  return v2;
}

- (id)newCellIterator
{
  v3 = [WDArrayIterator alloc];
  mCells = self->mCells;
  return [(WDArrayIterator *)v3 initWithArray:mCells];
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDTableRow;
  v2 = [(WDTableRow *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mTable);
  objc_storeStrong((id *)&self->mCells, 0);
  objc_storeStrong((id *)&self->mProperties, 0);
}

@end