@interface TIInMemoryResultLogger
- (NSMutableArray)results;
- (TIInMemoryResultLogger)init;
- (void)addResult:(id)a3;
@end

@implementation TIInMemoryResultLogger

- (void).cxx_destruct
{
}

- (NSMutableArray)results
{
  return self->_results;
}

- (void)addResult:(id)a3
{
  id v4 = a3;
  id v5 = [(TIInMemoryResultLogger *)self results];
  [v5 addObject:v4];
}

- (TIInMemoryResultLogger)init
{
  v6.receiver = self;
  v6.super_class = (Class)TIInMemoryResultLogger;
  v2 = [(TIInMemoryResultLogger *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    results = v2->_results;
    v2->_results = v3;
  }
  return v2;
}

@end