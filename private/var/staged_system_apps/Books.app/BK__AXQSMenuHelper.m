@interface BK__AXQSMenuHelper
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (void)restoreMenu;
@end

@implementation BK__AXQSMenuHelper

+ (id)imaxTargetClassName
{
  return @"AXQSMenuHelper";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)restoreMenu
{
  v3 = [(BK__AXQSMenuHelper *)self imaxValueForKey:@"thirdPartyMenuItems"];

  if (v3)
  {
    v4.receiver = self;
    v4.super_class = (Class)BK__AXQSMenuHelper;
    [(BK__AXQSMenuHelper *)&v4 restoreMenu];
  }
}

@end