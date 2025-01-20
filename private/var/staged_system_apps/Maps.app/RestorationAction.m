@interface RestorationAction
- (RestorationAction)init;
- (int)analyticsLaunchActionType;
- (int64_t)source;
- (unint64_t)fidelity;
- (void)setFidelity:(unint64_t)a3;
- (void)setSource:(int64_t)a3;
@end

@implementation RestorationAction

- (RestorationAction)init
{
  v3.receiver = self;
  v3.super_class = (Class)RestorationAction;
  result = [(RestorationAction *)&v3 init];
  if (result)
  {
    result->_source = 6;
    result->_fidelity = 0xFFFFFFFLL;
  }
  return result;
}

- (int)analyticsLaunchActionType
{
  return 26;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (unint64_t)fidelity
{
  return self->_fidelity;
}

- (void)setFidelity:(unint64_t)a3
{
  self->_fidelity = a3;
}

@end