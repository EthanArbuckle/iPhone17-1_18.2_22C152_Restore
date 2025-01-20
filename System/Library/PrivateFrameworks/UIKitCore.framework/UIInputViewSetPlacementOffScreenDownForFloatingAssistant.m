@interface UIInputViewSetPlacementOffScreenDownForFloatingAssistant
+ (id)placement;
- (BOOL)isFloatingAssistantView;
- (BOOL)showsEditItems;
- (CGRect)remoteIntrinsicContentSizeForInputViewInSet:(id)a3 includingIAV:(BOOL)a4;
- (Class)applicatorClassForKeyboard:(BOOL)a3;
@end

@implementation UIInputViewSetPlacementOffScreenDownForFloatingAssistant

+ (id)placement
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)showsEditItems
{
  return 0;
}

- (CGRect)remoteIntrinsicContentSizeForInputViewInSet:(id)a3 includingIAV:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)UIInputViewSetPlacementOffScreenDownForFloatingAssistant;
  [(UIInputViewSetPlacement *)&v8 remoteIntrinsicContentSizeForInputViewInSet:a3 includingIAV:a4];
  double v6 = 1.0;
  double v7 = 0.0;
  result.size.height = v7;
  result.size.width = v5;
  result.origin.y = v6;
  result.origin.x = v4;
  return result;
}

- (BOOL)isFloatingAssistantView
{
  return 1;
}

- (Class)applicatorClassForKeyboard:(BOOL)a3
{
  return (Class)objc_opt_class();
}

@end