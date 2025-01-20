@interface THBodyRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)tsaxNeedsEditRotorMenu;
- (id)_accessibilityScrollAncestorForSelector:(SEL)a3;
@end

@implementation THBodyRepAccessibility

+ (id)tsaxTargetClassName
{
  return @"THBodyRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)tsaxNeedsEditRotorMenu
{
  return 1;
}

- (id)_accessibilityScrollAncestorForSelector:(SEL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)THBodyRepAccessibility;
  id result = -[THBodyRepAccessibility _accessibilityScrollAncestorForSelector:](&v10, "_accessibilityScrollAncestorForSelector:");
  if (a3 && !result)
  {
    v6 = [NSStringFromSelector(a3) stringByAppendingString:@"Supported"];
    v7 = objc_opt_class();
    Class v8 = __TSAccessibilityCastAsSafeCategory(v7, (uint64_t)[(THBodyRepAccessibility *)self _accessibilityScrollParent], 0, 0);
    unsigned int v9 = [[objc_class thaxScrollingDelegate](v8, "thaxScrollingDelegate") tsaxBoolValueForKey:v6];
    id result = 0;
    if (v9) {
      return [(objc_class *)v8 thaxScrollingDelegate];
    }
  }
  return result;
}

@end