@interface THWPressableRepGestureTargetHandlerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (void)thaxInvokeAction;
@end

@implementation THWPressableRepGestureTargetHandlerAccessibility

+ (id)tsaxTargetClassName
{
  return @"THWPressableRepGestureTargetHandler";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)thaxInvokeAction
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_27FA14;
  v2[3] = &unk_456DE0;
  v2[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2)) {
    abort();
  }
}

@end