@interface searchRow
- (NSMutableDictionary)columns;
- (searchRow)init;
- (void)setColumns:(id)a3;
@end

@implementation searchRow

- (searchRow)init
{
  v6.receiver = self;
  v6.super_class = (Class)searchRow;
  v2 = [(searchRow *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    columns = v2->_columns;
    v2->_columns = v3;

    if (!v2->_columns)
    {

      return 0;
    }
  }
  return v2;
}

- (NSMutableDictionary)columns
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setColumns:(id)a3
{
}

- (void).cxx_destruct
{
}

@end