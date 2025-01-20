@interface UISceneSystemProtectionManager
- (BOOL)isUserAuthenticationEnabled;
- (id)_init;
@end

@implementation UISceneSystemProtectionManager

- (BOOL)isUserAuthenticationEnabled
{
  return self->userAuthenticationEnabled;
}

- (id)_init
{
  if (result)
  {
    v1.receiver = result;
    v1.super_class = (Class)UISceneSystemProtectionManager;
    return objc_msgSendSuper2(&v1, sel_init);
  }
  return result;
}

@end