@interface TSTNumberCellEditorAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (void)deleteBackward;
@end

@implementation TSTNumberCellEditorAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSTNumberCellEditor";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)deleteBackward
{
  v2.receiver = self;
  v2.super_class = (Class)TSTNumberCellEditorAccessibility;
  [(TSTNumberCellEditorAccessibility *)&v2 deleteBackward];
  UIAccessibilityPostNotification(TSAccessibilityValueChangedNotification, @"AXValueChangeTypeDelete");
}

@end