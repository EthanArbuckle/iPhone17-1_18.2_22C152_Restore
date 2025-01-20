@interface UIHealthAuthorizationAction
- (UIHealthAuthorizationAction)init;
- (int64_t)UIActionType;
@end

@implementation UIHealthAuthorizationAction

- (UIHealthAuthorizationAction)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  v6.receiver = self;
  v6.super_class = (Class)UIHealthAuthorizationAction;
  v4 = [(UIHealthAuthorizationAction *)&v6 initWithInfo:v3 timeout:0 forResponseOnQueue:0 withHandler:0.0];

  return v4;
}

- (int64_t)UIActionType
{
  return 19;
}

@end