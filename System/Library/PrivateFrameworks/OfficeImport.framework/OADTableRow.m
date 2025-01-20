@interface OADTableRow
- (OADTableRow)init;
- (float)height;
- (id)addCell;
- (id)cellAtIndex:(unint64_t)a3;
- (id)description;
- (unint64_t)cellCount;
- (void)flipCellsRTL;
- (void)setHeight:(float)a3;
@end

@implementation OADTableRow

- (OADTableRow)init
{
  v6.receiver = self;
  v6.super_class = (Class)OADTableRow;
  v2 = [(OADTableRow *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mCells = v2->mCells;
    v2->mCells = v3;
  }
  return v2;
}

- (void)setHeight:(float)a3
{
  self->mHeight = a3;
}

- (id)addCell
{
  v3 = objc_alloc_init(OADTableCell);
  [(NSMutableArray *)self->mCells addObject:v3];
  return v3;
}

- (unint64_t)cellCount
{
  return [(NSMutableArray *)self->mCells count];
}

- (id)cellAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->mCells objectAtIndex:a3];
}

- (float)height
{
  return self->mHeight;
}

- (void)flipCellsRTL
{
  unint64_t v3 = [(NSMutableArray *)self->mCells count];
  unint64_t v4 = v3 - 1;
  if (v3 == 1) {
    goto LABEL_6;
  }
  unint64_t v5 = 1;
  do
    [(NSMutableArray *)self->mCells exchangeObjectAtIndex:v5 - 1 withObjectAtIndex:v4--];
  while (v5++ < v4);
  if (v3)
  {
LABEL_6:
    unint64_t v7 = 0;
    do
    {
      v8 = [(NSMutableArray *)self->mCells objectAtIndexedSubscript:v7];
      unint64_t v9 = v7 + 1;
      if ([v8 horzMerge])
      {
        if (v9 >= v3)
        {
LABEL_11:
          unint64_t v9 = v7;
        }
        else
        {
          while (1)
          {
            v10 = [(NSMutableArray *)self->mCells objectAtIndexedSubscript:v9];
            if (([v10 horzMerge] & 1) == 0) {
              break;
            }

            if (v3 == ++v9) {
              goto LABEL_11;
            }
          }
          [(NSMutableArray *)self->mCells exchangeObjectAtIndex:v7 withObjectAtIndex:v9++];
        }
      }

      unint64_t v7 = v9;
    }
    while (v9 < v3);
    uint64_t v11 = 0;
    do
    {
      v12 = [(OADTableRow *)self cellAtIndex:v11];
      v13 = [v12 properties];
      v14 = [v13 leftStroke];
      v15 = [v13 rightStroke];
      [v13 setLeftStroke:v15];

      [v13 setRightStroke:v14];
      ++v11;
    }
    while (v3 != v11);
  }
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADTableRow;
  v2 = [(OADTableRow *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
}

@end