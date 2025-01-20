@interface searchResults
- (NSMutableArray)rows;
- (searchResults)init;
- (void)setRows:(id)a3;
@end

@implementation searchResults

- (searchResults)init
{
  v6.receiver = self;
  v6.super_class = (Class)searchResults;
  v2 = [(searchResults *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    rows = v2->_rows;
    v2->_rows = v3;

    if (!v2->_rows)
    {

      return 0;
    }
  }
  return v2;
}

- (NSMutableArray)rows
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRows:(id)a3
{
}

- (void).cxx_destruct
{
}

@end