@interface TSDTableViewBasedInspectorPaneAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)checkableImageCellOfClass:(Class)a3 withImage:(id)a4 showsCheckboxOnRight:(BOOL)a5;
@end

@implementation TSDTableViewBasedInspectorPaneAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDTableViewBasedInspectorPane";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)checkableImageCellOfClass:(Class)a3 withImage:(id)a4 showsCheckboxOnRight:(BOOL)a5
{
  v8.receiver = self;
  v8.super_class = (Class)TSDTableViewBasedInspectorPaneAccessibility;
  id v6 = [(TSDTableViewBasedInspectorPaneAccessibility *)&v8 checkableImageCellOfClass:a3 withImage:a4 showsCheckboxOnRight:a5];
  [v6 setIsAccessibilityElement:1];
  [v6 setAccessibilityLabel:[a4 accessibilityLabel]];
  return v6;
}

@end