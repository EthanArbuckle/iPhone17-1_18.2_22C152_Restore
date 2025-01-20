@interface THWAutoplayConfig
- (BOOL)enabled;
- (THWAutoplayConfig)initWithAutoplayEnabled:(BOOL)a3;
@end

@implementation THWAutoplayConfig

- (THWAutoplayConfig)initWithAutoplayEnabled:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THWAutoplayConfig;
  result = [(THWAutoplayConfig *)&v5 init];
  if (result) {
    result->_enabled = a3;
  }
  return result;
}

- (BOOL)enabled
{
  return self->_enabled;
}

@end