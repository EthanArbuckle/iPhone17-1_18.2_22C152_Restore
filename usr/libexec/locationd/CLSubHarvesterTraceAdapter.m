@interface CLSubHarvesterTraceAdapter
- (BOOL)valid;
- (CLSubHarvesterTraceAdapter)initWithHarvesterExternal:(void *)a3;
- (void)handleVIOEstimation:(id)a3 fromClient:(id)a4;
- (void)handleVLLocalizationResult:(id)a3 fromClient:(id)a4;
- (void)setValid:(BOOL)a3;
@end

@implementation CLSubHarvesterTraceAdapter

- (CLSubHarvesterTraceAdapter)initWithHarvesterExternal:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLSubHarvesterTraceAdapter;
  result = [(CLSubHarvesterTraceAdapter *)&v5 init];
  if (result)
  {
    result->_harvesterExternal = a3;
    result->_valid = 1;
  }
  else
  {
    MEMORY[0x10] = 0;
  }
  return result;
}

- (void)handleVIOEstimation:(id)a3 fromClient:(id)a4
{
}

- (void)handleVLLocalizationResult:(id)a3 fromClient:(id)a4
{
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end