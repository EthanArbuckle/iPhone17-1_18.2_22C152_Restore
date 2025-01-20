@interface VUIMultiviewConfig
- (BOOL)isEnabled;
- (BOOL)useExperienceController;
- (VUIMultiviewConfig)init;
- (int64_t)maximumPlayerCount;
- (void)setIsEnabled:(BOOL)a3;
- (void)setMaximumPlayerCount:(int64_t)a3;
- (void)setUseExperienceController:(BOOL)a3;
@end

@implementation VUIMultiviewConfig

- (void)setMaximumPlayerCount:(int64_t)a3
{
  self->_maximumPlayerCount = a3;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (VUIMultiviewConfig)init
{
  v3.receiver = self;
  v3.super_class = (Class)VUIMultiviewConfig;
  result = [(VUIMultiviewConfig *)&v3 init];
  if (result)
  {
    result->_isEnabled = 0;
    result->_maximumPlayerCount = 4;
  }
  return result;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (BOOL)useExperienceController
{
  return self->_useExperienceController;
}

- (void)setUseExperienceController:(BOOL)a3
{
  self->_useExperienceController = a3;
}

- (int64_t)maximumPlayerCount
{
  return self->_maximumPlayerCount;
}

@end