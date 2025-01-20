@interface OADTableGrid
- (OADTableGrid)init;
- (id)addColumn;
- (id)columnAtIndex:(unint64_t)a3;
- (id)description;
- (unint64_t)columnCount;
- (void)flipColumnsRTL;
@end

@implementation OADTableGrid

- (OADTableGrid)init
{
  v6.receiver = self;
  v6.super_class = (Class)OADTableGrid;
  v2 = [(OADTableGrid *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mColumns = v2->mColumns;
    v2->mColumns = v3;
  }
  return v2;
}

- (id)addColumn
{
  v3 = objc_alloc_init(OADTableColumn);
  [(NSMutableArray *)self->mColumns addObject:v3];
  return v3;
}

- (unint64_t)columnCount
{
  return [(NSMutableArray *)self->mColumns count];
}

- (id)columnAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->mColumns objectAtIndex:a3];
}

- (void)flipColumnsRTL
{
  unint64_t v3 = [(OADTableGrid *)self columnCount];
  unint64_t v4 = v3 - 1;
  if (v3 != 1)
  {
    unint64_t v5 = 1;
    do
      [(NSMutableArray *)self->mColumns exchangeObjectAtIndex:v5 - 1 withObjectAtIndex:v4--];
    while (v5++ < v4);
  }
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADTableGrid;
  v2 = [(OADTableGrid *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
}

@end