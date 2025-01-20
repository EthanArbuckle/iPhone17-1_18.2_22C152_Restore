@interface TSUIAccessibilityElementKBKey
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)isAccessibilityElement;
@end

@implementation TSUIAccessibilityElementKBKey

+ (id)tsaxTargetClassName
{
  return @"UIAccessibilityElementKBKey";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  if (sub_26E41C()) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSUIAccessibilityElementKBKey;
  return [(TSUIAccessibilityElementKBKey *)&v4 isAccessibilityElement];
}

@end