@interface UIInputViewSetPlacementOnScreen
+ (BOOL)supportsSecureCoding;
- (BOOL)inputViewWillAppear;
- (BOOL)showsInputOrAssistantViews;
- (BOOL)showsInputViews;
- (BOOL)showsKeyboard;
@end

@implementation UIInputViewSetPlacementOnScreen

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)showsInputViews
{
  return 1;
}

- (BOOL)showsKeyboard
{
  return 1;
}

- (BOOL)showsInputOrAssistantViews
{
  return 1;
}

- (BOOL)inputViewWillAppear
{
  return 1;
}

@end