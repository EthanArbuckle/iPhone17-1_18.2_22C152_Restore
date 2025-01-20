@interface THWPopUpContentProviderAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (UIView)thaxPopoverContentView;
@end

@implementation THWPopUpContentProviderAccessibility

+ (id)tsaxTargetClassName
{
  return @"THWPopUpContentProvider";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (UIView)thaxPopoverContentView
{
  char v5 = 0;
  v3 = (objc_class *)objc_opt_class();
  result = (UIView *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(THWPopUpContentProviderAccessibility *)self tsaxValueForKey:@"popoverContentView"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end