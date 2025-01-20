@interface SDUnit
- (unint64_t)runtimeChecks;
- (void)setRuntimeChecks:(unint64_t)a3;
@end

@implementation SDUnit

- (unint64_t)runtimeChecks
{
  return self->_runtimeChecks;
}

- (void)setRuntimeChecks:(unint64_t)a3
{
  self->_runtimeChecks = a3;
}

@end