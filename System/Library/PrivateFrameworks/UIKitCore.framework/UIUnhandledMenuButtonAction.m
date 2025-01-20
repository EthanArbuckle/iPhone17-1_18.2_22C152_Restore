@interface UIUnhandledMenuButtonAction
- (UIUnhandledMenuButtonAction)init;
- (int64_t)UIActionType;
@end

@implementation UIUnhandledMenuButtonAction

- (UIUnhandledMenuButtonAction)init
{
  v3.receiver = self;
  v3.super_class = (Class)UIUnhandledMenuButtonAction;
  return [(UIUnhandledMenuButtonAction *)&v3 initWithInfo:0 timeout:0 forResponseOnQueue:0 withHandler:0.0];
}

- (int64_t)UIActionType
{
  return 12;
}

@end