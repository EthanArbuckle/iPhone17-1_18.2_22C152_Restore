@interface THWLabelControlRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)tsaxDescription;
@end

@implementation THWLabelControlRepAccessibility

- (BOOL)isAccessibilityElement
{
  return 1;
}

+ (id)tsaxTargetClassName
{
  return @"THWLabelControlRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)tsaxDescription
{
  char v5 = 0;
  v3 = (objc_class *)objc_opt_class();
  id result = (id)[__TSAccessibilityCastAsClass(v3, (uint64_t)[-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", @"_labelLayer") tsaxValueForKey:@"string"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end