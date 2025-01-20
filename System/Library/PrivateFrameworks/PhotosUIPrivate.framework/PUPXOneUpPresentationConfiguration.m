@interface PUPXOneUpPresentationConfiguration
- (BOOL)isAnimated;
- (PUPXOneUpPresentationConfiguration)init;
- (id)activityCompletion;
- (int64_t)interactiveMode;
- (int64_t)pu_interactiveMode;
- (unint64_t)activity;
- (unint64_t)pu_activity;
- (void)setActivity:(unint64_t)a3;
- (void)setActivityCompletion:(id)a3;
- (void)setAnimated:(BOOL)a3;
- (void)setInteractiveMode:(int64_t)a3;
@end

@implementation PUPXOneUpPresentationConfiguration

- (void).cxx_destruct
{
}

- (void)setActivityCompletion:(id)a3
{
}

- (id)activityCompletion
{
  return self->_activityCompletion;
}

- (void)setActivity:(unint64_t)a3
{
  self->_activity = a3;
}

- (unint64_t)activity
{
  return self->_activity;
}

- (void)setInteractiveMode:(int64_t)a3
{
  self->_interactiveMode = a3;
}

- (int64_t)interactiveMode
{
  return self->_interactiveMode;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (unint64_t)pu_activity
{
  unint64_t result = [(PUPXOneUpPresentationConfiguration *)self activity];
  if (result != 2) {
    return result == 1;
  }
  return result;
}

- (int64_t)pu_interactiveMode
{
  return [(PUPXOneUpPresentationConfiguration *)self interactiveMode] == 1;
}

- (PUPXOneUpPresentationConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)PUPXOneUpPresentationConfiguration;
  unint64_t result = [(PUPXOneUpPresentationConfiguration *)&v3 init];
  if (result)
  {
    result->_animated = 1;
    result->_interactiveMode = 0;
    result->_activity = 0;
  }
  return result;
}

@end