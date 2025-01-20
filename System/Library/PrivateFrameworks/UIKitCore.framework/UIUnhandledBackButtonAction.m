@interface UIUnhandledBackButtonAction
- (UIUnhandledBackButtonAction)init;
- (int64_t)UIActionType;
@end

@implementation UIUnhandledBackButtonAction

- (UIUnhandledBackButtonAction)init
{
  v3.receiver = self;
  v3.super_class = (Class)UIUnhandledBackButtonAction;
  return [(UIUnhandledBackButtonAction *)&v3 initWithInfo:0 timeout:0 forResponseOnQueue:0 withHandler:0.0];
}

- (int64_t)UIActionType
{
  return 13;
}

@end