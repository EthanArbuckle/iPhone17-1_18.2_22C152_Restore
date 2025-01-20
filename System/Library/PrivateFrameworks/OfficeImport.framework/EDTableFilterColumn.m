@interface EDTableFilterColumn
- (EDTableFilterColumn)init;
- (id)description;
- (id)filterAtIndex:(unint64_t)a3;
- (int)filtersRelation;
- (unint64_t)columnIndex;
- (unint64_t)filterCount;
- (void)addFilter:(id)a3;
- (void)setColumnIndex:(unint64_t)a3;
- (void)setFiltersRelation:(int)a3;
@end

@implementation EDTableFilterColumn

- (EDTableFilterColumn)init
{
  v6.receiver = self;
  v6.super_class = (Class)EDTableFilterColumn;
  v2 = [(EDTableFilterColumn *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mFilters = v2->mFilters;
    v2->mFilters = v3;

    v2->mColumnIndex = -1;
  }
  return v2;
}

- (unint64_t)filterCount
{
  return [(NSMutableArray *)self->mFilters count];
}

- (id)filterAtIndex:(unint64_t)a3
{
  if ([(EDTableFilterColumn *)self filterCount] <= a3)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(NSMutableArray *)self->mFilters objectAtIndex:a3];
  }
  return v5;
}

- (void)addFilter:(id)a3
{
  id v4 = a3;
  if (v4) {
    [(NSMutableArray *)self->mFilters addObject:v4];
  }
}

- (unint64_t)columnIndex
{
  return self->mColumnIndex;
}

- (void)setColumnIndex:(unint64_t)a3
{
  self->mColumnIndex = a3;
}

- (int)filtersRelation
{
  return self->mFiltersRelation;
}

- (void)setFiltersRelation:(int)a3
{
  self->mFiltersRelation = a3;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDTableFilterColumn;
  v2 = [(EDTableFilterColumn *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
}

@end