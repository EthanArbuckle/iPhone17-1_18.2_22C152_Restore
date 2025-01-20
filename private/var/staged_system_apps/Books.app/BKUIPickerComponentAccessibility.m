@interface BKUIPickerComponentAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (NSString)bkaxAccessibilityValueOverride;
- (id)accessibilityValue;
- (void)setAccessibilityValue:(id)a3;
- (void)setBKAXAccessibilityValueOverride:(id)a3;
@end

@implementation BKUIPickerComponentAccessibility

+ (id)imaxTargetClassName
{
  return @"UIAccessibilityPickerComponent";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)bkaxAccessibilityValueOverride
{
  return (NSString *)___IMAccessibilityGetAssociatedObject(self, &unk_100B4A240);
}

- (void)setBKAXAccessibilityValueOverride:(id)a3
{
}

- (id)accessibilityValue
{
  uint64_t v3 = AXRequestingClient();
  v4 = [(BKUIPickerComponentAccessibility *)self bkaxAccessibilityValueOverride];

  if (!v4 || v3 == 7 || v3 == 2)
  {
    v7.receiver = self;
    v7.super_class = (Class)BKUIPickerComponentAccessibility;
    v5 = [(BKUIPickerComponentAccessibility *)&v7 accessibilityValue];
  }
  else
  {
    v5 = [(BKUIPickerComponentAccessibility *)self bkaxAccessibilityValueOverride];
  }

  return v5;
}

- (void)setAccessibilityValue:(id)a3
{
}

@end