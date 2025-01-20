@interface MDModeDecision
- (MDModeDecision)initWithMode:(unint64_t)a3;
- (unint64_t)currentMode;
@end

@implementation MDModeDecision

- (MDModeDecision)initWithMode:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MDModeDecision;
  result = [(MDModeDecision *)&v5 init];
  if (result) {
    result->_currentMode = a3;
  }
  return result;
}

- (unint64_t)currentMode
{
  return self->_currentMode;
}

@end