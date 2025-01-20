@interface BKAppearanceFontViewControllerAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 setSelectionState:(BOOL)a4 cell:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation BKAppearanceFontViewControllerAccessibility

+ (id)imaxTargetClassName
{
  return @"BKAppearanceFontViewController";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)BKAppearanceFontViewControllerAccessibility;
  [(BKAppearanceFontViewControllerAccessibility *)&v3 viewDidAppear:a3];
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)BKAppearanceFontViewControllerAccessibility;
  v4 = [(BKAppearanceFontViewControllerAccessibility *)&v10 tableView:a3 cellForRowAtIndexPath:a4];
  v5 = [v4 accessoryView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7 = [v4 accessoryView];
    v8 = sub_1000B86A8(@"download.font.button");
    [v7 setAccessibilityLabel:v8];
  }

  return v4;
}

- (void)tableView:(id)a3 setSelectionState:(BOOL)a4 cell:(id)a5
{
  BOOL v5 = a4;
  v10.receiver = self;
  v10.super_class = (Class)BKAppearanceFontViewControllerAccessibility;
  id v7 = a5;
  [(BKAppearanceFontViewControllerAccessibility *)&v10 tableView:a3 setSelectionState:v5 cell:v7];
  unint64_t v8 = [v7 accessibilityTraits];
  if (v5) {
    UIAccessibilityTraits v9 = UIAccessibilityTraitSelected | v8;
  }
  else {
    UIAccessibilityTraits v9 = v8 & ~UIAccessibilityTraitSelected;
  }
  [v7 setAccessibilityTraits:v9];
}

@end