@interface VUILiveLinkConfig
- (BOOL)isEnabled;
- (VUILiveLinkConfig)init;
- (void)setIsEnabled:(BOOL)a3;
@end

@implementation VUILiveLinkConfig

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (VUILiveLinkConfig)init
{
  v3.receiver = self;
  v3.super_class = (Class)VUILiveLinkConfig;
  result = [(VUILiveLinkConfig *)&v3 init];
  if (result) {
    result->_isEnabled = 0;
  }
  return result;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

@end