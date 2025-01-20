@interface SWProcessConfiguration
- (BOOL)shouldRunAtBackgroundPriority;
- (SWProcessConfiguration)initWithBackgroundPriority:(BOOL)a3;
@end

@implementation SWProcessConfiguration

- (SWProcessConfiguration)initWithBackgroundPriority:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SWProcessConfiguration;
  result = [(SWProcessConfiguration *)&v5 init];
  if (result) {
    result->_shouldRunAtBackgroundPriority = a3;
  }
  return result;
}

- (BOOL)shouldRunAtBackgroundPriority
{
  return self->_shouldRunAtBackgroundPriority;
}

@end