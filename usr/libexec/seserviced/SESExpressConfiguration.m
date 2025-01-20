@interface SESExpressConfiguration
+ (id)withState:(int64_t)a3 passConfigs:(id)a4;
- (NSArray)passConfigs;
- (int64_t)state;
@end

@implementation SESExpressConfiguration

+ (id)withState:(int64_t)a3 passConfigs:(id)a4
{
  id v5 = a4;
  v6 = objc_opt_new();
  v7 = (void *)v6[2];
  v6[1] = a3;
  v6[2] = v5;

  return v6;
}

- (int64_t)state
{
  return self->_state;
}

- (NSArray)passConfigs
{
  return self->_passConfigs;
}

- (void).cxx_destruct
{
}

@end