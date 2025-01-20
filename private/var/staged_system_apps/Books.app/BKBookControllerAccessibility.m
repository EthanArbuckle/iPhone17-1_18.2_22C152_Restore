@interface BKBookControllerAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (void)scrubValueChanged:(id)a3;
@end

@implementation BKBookControllerAccessibility

+ (id)imaxTargetClassName
{
  return @"BKBookController";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)scrubValueChanged:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKBookControllerAccessibility;
  id v3 = a3;
  [(BKBookControllerAccessibility *)&v5 scrubValueChanged:v3];
  NSClassFromString(@"BKScrubberControl");
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    if (IMAccessibilityShouldPerformValidationChecks()) {
      +[NSException raise:@"Accessibility", @"sender is not a BKScrubber", v5.receiver, v5.super_class format];
    }
  }
}

@end