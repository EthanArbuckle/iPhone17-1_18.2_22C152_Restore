@interface THModelGlossaryEntryAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (NSString)thaxDefinition;
- (NSString)thaxTerm;
@end

@implementation THModelGlossaryEntryAccessibility

+ (id)tsaxTargetClassName
{
  return @"THModelGlossaryEntry";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)thaxTerm
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (NSString *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THModelGlossaryEntryAccessibility *)self tsaxValueForKey:@"term"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (NSString)thaxDefinition
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (NSString *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THModelGlossaryEntryAccessibility *)self tsaxValueForKey:@"summaryText"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end