@interface TSTiOSTableRepDelegateAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (void)p_showContextMenuAtPoint:(CGPoint)a3;
@end

@implementation TSTiOSTableRepDelegateAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSTiOSTableRepDelegate";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)p_showContextMenuAtPoint:(CGPoint)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_268DE8;
  v3[3] = &unk_46BBE0;
  CGPoint v4 = a3;
  v3[4] = self;
  [+[UIMenuController sharedMenuController] tsaxPerformBlockPreventingMakingVisible:v3];
}

@end