@interface SUCellConfigurationCache
- (SUCellConfigurationCache)initWithClass:(Class)a3 tableHeight:(double)a4;
- (id)cellContext;
- (id)configurationForRow:(unint64_t)a3;
- (void)dealloc;
- (void)reset;
- (void)resetLayoutCaches;
- (void)setCellContext:(id)a3;
@end

@implementation SUCellConfigurationCache

- (SUCellConfigurationCache)initWithClass:(Class)a3 tableHeight:(double)a4
{
  v6 = [(SUCellConfigurationCache *)self init];
  if (v6)
  {
    v6->_configurations = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    [(objc_class *)a3 minimumRowHeight];
    for (unint64_t i = (unint64_t)(ceil(a4 / v7) + 1.0); i; --i)
    {
      id v9 = objc_alloc_init(a3);
      [(NSMutableArray *)v6->_configurations addObject:v9];
    }
  }
  return v6;
}

- (void)dealloc
{
  self->_cellContext = 0;
  self->_configurations = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUCellConfigurationCache;
  [(SUCellConfigurationCache *)&v3 dealloc];
}

- (id)configurationForRow:(unint64_t)a3
{
  configurations = self->_configurations;
  unint64_t v4 = a3 % [(NSMutableArray *)configurations count];

  return (id)[(NSMutableArray *)configurations objectAtIndex:v4];
}

- (void)reset
{
  uint64_t v3 = [(NSMutableArray *)self->_configurations count];
  [(NSMutableArray *)self->_configurations lastObject];
  unint64_t v4 = (objc_class *)objc_opt_class();
  [(NSMutableArray *)self->_configurations removeAllObjects];
  for (; v3; --v3)
  {
    id v5 = objc_alloc_init(v4);
    [(NSMutableArray *)self->_configurations addObject:v5];
  }
}

- (void)resetLayoutCaches
{
  id v2 = [(SUCellConfigurationCache *)self cellContext];

  [v2 resetLayoutCaches];
}

- (id)cellContext
{
  return self->_cellContext;
}

- (void)setCellContext:(id)a3
{
}

@end