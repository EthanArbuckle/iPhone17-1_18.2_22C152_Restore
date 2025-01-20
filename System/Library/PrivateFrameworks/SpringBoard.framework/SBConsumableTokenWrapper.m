@interface SBConsumableTokenWrapper
+ (SBConsumableTokenWrapper)consumableTokenWrapperWithToken:(id)a3;
- (BOOL)isTokenAvailable;
- (id)consumeToken;
@end

@implementation SBConsumableTokenWrapper

+ (SBConsumableTokenWrapper)consumableTokenWrapperWithToken:(id)a3
{
  v3 = (SBHardwareButtonLaunchPreludeAnimationToken *)a3;
  v4 = objc_alloc_init(SBConsumableTokenWrapper);
  token = v4->_token;
  v4->_token = v3;

  return v4;
}

- (id)consumeToken
{
  v3 = self->_token;
  token = self->_token;
  self->_token = 0;

  return v3;
}

- (BOOL)isTokenAvailable
{
  return self->_token != 0;
}

- (void).cxx_destruct
{
}

@end