@interface CLSubHarvesterTraceAdapterOutdoor
- (BOOL)valid;
- (CLSubHarvesterTraceAdapterOutdoor)initWithHarvesterExternal:(void *)a3;
- (void)onOutdoorUpdate:(id)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation CLSubHarvesterTraceAdapterOutdoor

- (BOOL)valid
{
  return self->_valid;
}

- (void)onOutdoorUpdate:(id)a3
{
  harvesterExternal = (void **)self->_harvesterExternal;
  (*((void (**)(void *__return_ptr, id, SEL))a3 + 2))(v4, a3, a2);
  (*(void (**)(void *, void *))(*harvesterExternal[38] + 48))(harvesterExternal[38], v4);
}

- (CLSubHarvesterTraceAdapterOutdoor)initWithHarvesterExternal:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLSubHarvesterTraceAdapterOutdoor;
  result = [(CLSubHarvesterTraceAdapterOutdoor *)&v5 init];
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

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end