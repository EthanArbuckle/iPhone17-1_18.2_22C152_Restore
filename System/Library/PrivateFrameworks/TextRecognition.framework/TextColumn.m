@interface TextColumn
- (NSArray)rows;
- (NSMutableArray)mutableRows;
- (TextColumn)init;
- (TextColumn)initWithRows:(id)a3;
- (unint64_t)rowCount;
- (void)addRow:(id)a3;
- (void)setMutableRows:(id)a3;
- (void)sortRowsInAscendingOrder;
@end

@implementation TextColumn

- (TextColumn)init
{
  v6.receiver = self;
  v6.super_class = (Class)TextColumn;
  v2 = [(TextColumn *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    mutableRows = v2->_mutableRows;
    v2->_mutableRows = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)addRow:(id)a3
{
  mutableRows = self->_mutableRows;
  if (mutableRows) {
    [(NSMutableArray *)mutableRows addObject:a3];
  }
}

- (NSArray)rows
{
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithArray:self->_mutableRows];
}

- (unint64_t)rowCount
{
  return [(NSMutableArray *)self->_mutableRows count];
}

- (TextColumn)initWithRows:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(TextColumn);
  objc_super v6 = [MEMORY[0x1E4F1CA48] arrayWithArray:v4];

  [(TextColumn *)v5 setMutableRows:v6];
  return v5;
}

- (void)sortRowsInAscendingOrder
{
}

uint64_t __38__TextColumn_sortRowsInAscendingOrder__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 score];
  double v7 = v6;
  [v5 score];
  if (v7 <= v8)
  {
    [v4 score];
    double v11 = v10;
    [v5 score];
    if (v11 >= v12) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = -1;
    }
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

- (NSMutableArray)mutableRows
{
  return self->_mutableRows;
}

- (void)setMutableRows:(id)a3
{
}

- (void).cxx_destruct
{
}

@end