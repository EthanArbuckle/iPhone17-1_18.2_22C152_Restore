@interface THModelGlossaryEntryFlushableAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (void)p_populate;
@end

@implementation THModelGlossaryEntryFlushableAccessibility

+ (id)tsaxTargetClassName
{
  return @"THModelGlossaryEntryFlushable";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)p_populate
{
  v5.receiver = self;
  v5.super_class = (Class)THModelGlossaryEntryFlushableAccessibility;
  [(THModelGlossaryEntryFlushableAccessibility *)&v5 p_populate];
  id v3 = [self tsaxValueForKey:@"body"] tsaxValueForKey:@"headerInfo"];
  unint64_t v4 = (unint64_t)[v3 accessibilityTraits];
  [v3 setAccessibilityTraits:TSAccessibilityTraitHeader | v4];
}

@end