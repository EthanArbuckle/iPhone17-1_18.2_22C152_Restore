@interface UITouchesEventAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityAutomationHitTest;
- (id)_accessibilityHitTestOptions;
- (id)_accessibilityHitTestStartsAtElement;
- (unsigned)_accessibilityHitTestType;
- (void)_setAccessibilityAutomationHitTest:(BOOL)a3;
- (void)_setAccessibilityHitTestOptions:(id)a3;
- (void)_setAccessibilityHitTestStartsAtElement:(id)a3;
- (void)_setAccessibilityHitTestType:(unsigned __int16)a3;
@end

@implementation UITouchesEventAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UITouchesEvent";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityHitTestStartsAtElement
{
  return objc_getAssociatedObject(self, &AXHitTestStartsAtElement);
}

- (void)_setAccessibilityHitTestStartsAtElement:(id)a3
{
}

- (void)_setAccessibilityAutomationHitTest:(BOOL)a3
{
  if (a3) {
    v3 = &unk_1EF171998;
  }
  else {
    v3 = &unk_1EF1719B0;
  }
  objc_setAssociatedObject(self, &AXHitTestMode, v3, (void *)1);
}

- (BOOL)_accessibilityAutomationHitTest
{
  v2 = objc_getAssociatedObject(self, &AXHitTestMode);
  BOOL v3 = [v2 longValue] == 2;

  return v3;
}

- (unsigned)_accessibilityHitTestType
{
  v2 = objc_getAssociatedObject(self, &AXHitTestMode);
  unsigned __int16 v3 = [v2 longValue];

  return v3;
}

- (void)_setAccessibilityHitTestType:(unsigned __int16)a3
{
  id v4 = [NSNumber numberWithUnsignedShort:a3];
  objc_setAssociatedObject(self, &AXHitTestMode, v4, (void *)1);
}

- (id)_accessibilityHitTestOptions
{
  return objc_getAssociatedObject(self, &__UITouchesEventAccessibility___accessibilityHitTestOptions);
}

- (void)_setAccessibilityHitTestOptions:(id)a3
{
}

@end