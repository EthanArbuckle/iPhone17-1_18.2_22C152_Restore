@interface THMultiLineLabelAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (NSString)thaxText;
@end

@implementation THMultiLineLabelAccessibility

+ (id)tsaxTargetClassName
{
  return @"THMultiLineLabel";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)thaxText
{
  char v5 = 0;
  v3 = (objc_class *)objc_opt_class();
  result = (NSString *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(THMultiLineLabelAccessibility *)self tsaxValueForKey:@"text"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end