@interface BKAppearanceViewControllerAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (BOOL)accessibilityPerformEscape;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)themeContainer;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_changeAppearanceStyle:(int)a3;
- (void)decreaseFontSize:(id)a3;
- (void)increaseFontSize:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation BKAppearanceViewControllerAccessibility

+ (id)imaxTargetClassName
{
  return @"BKAppearanceViewController";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)_changeAppearanceStyle:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKAppearanceViewControllerAccessibility;
  [(BKAppearanceViewControllerAccessibility *)&v5 _changeAppearanceStyle:*(void *)&a3];
  UIAccessibilityNotifications v3 = UIAccessibilityAnnouncementNotification;
  v4 = sub_1000B86A8(@"selected");
  UIAccessibilityPostNotification(v3, v4);
}

- (void)increaseFontSize:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKAppearanceViewControllerAccessibility;
  [(BKAppearanceViewControllerAccessibility *)&v5 increaseFontSize:a3];
  UIAccessibilityNotifications v3 = UIAccessibilityAnnouncementNotification;
  v4 = sub_1000B86A8(@"font.size.increased");
  UIAccessibilityPostNotification(v3, v4);
}

- (void)decreaseFontSize:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKAppearanceViewControllerAccessibility;
  [(BKAppearanceViewControllerAccessibility *)&v5 decreaseFontSize:a3];
  UIAccessibilityNotifications v3 = UIAccessibilityAnnouncementNotification;
  v4 = sub_1000B86A8(@"font.size.decreased");
  UIAccessibilityPostNotification(v3, v4);
}

- (void)viewDidAppear:(BOOL)a3
{
  v19.receiver = self;
  v19.super_class = (Class)BKAppearanceViewControllerAccessibility;
  [(BKAppearanceViewControllerAccessibility *)&v19 viewDidAppear:a3];
  objc_opt_class();
  v4 = [(BKAppearanceViewControllerAccessibility *)self imaxValueForKey:@"tableView"];
  objc_super v5 = __IMAccessibilityCastAsClass();

  [v5 setIsAccessibilityElement:0];
  objc_opt_class();
  v6 = [(BKAppearanceViewControllerAccessibility *)self imaxValueForKey:@"_brightnessSlider"];
  v7 = __IMAccessibilityCastAsClass();

  v8 = sub_1000B86A8(@"brightness.button");
  [v7 setAccessibilityLabel:v8];

  [v7 accessibilitySetIdentification:@"BrightnessSlider"];
  objc_opt_class();
  v9 = [(BKAppearanceViewControllerAccessibility *)self imaxValueForKey:@"_sizeSmallerButton"];
  v10 = __IMAccessibilityCastAsClass();

  v11 = sub_1000B86A8(@"decrease.font.size.button");
  [v10 setAccessibilityLabel:v11];

  v12 = [(BKAppearanceViewControllerAccessibility *)self imaxValueForKey:@"_sizeLargerButton"];
  v13 = sub_1000B86A8(@"increase.font.size.button");
  [v12 setAccessibilityLabel:v13];

  objc_opt_class();
  v14 = [(BKAppearanceViewControllerAccessibility *)self imaxValueForKey:@"scrollSwitch"];
  v15 = __IMAccessibilityCastAsClass();

  objc_opt_class();
  v16 = [v15 superview];
  v17 = __IMAccessibilityCastAsClass();

  v18 = sub_1000B86A8(@"vertical.scrolling.switch");
  [v17 setAccessibilityLabel:v18];

  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, v7);
}

- (id)themeContainer
{
  v5.receiver = self;
  v5.super_class = (Class)BKAppearanceViewControllerAccessibility;
  UIAccessibilityNotifications v3 = [(BKAppearanceViewControllerAccessibility *)&v5 themeContainer];
  [(BKAppearanceViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];

  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)BKAppearanceViewControllerAccessibility;
  objc_super v5 = [(BKAppearanceViewControllerAccessibility *)&v9 tableView:a3 cellForRowAtIndexPath:a4];
  v6 = [(BKAppearanceViewControllerAccessibility *)self imaxValueForKey:@"_themeContainer"];
  if ([v6 _accessibilityIsDescendantOfElement:v5])
  {
    [v5 setAccessibilityContainerType:4];
    v7 = sub_1000B86A8(@"theme.selector.container");
    [v5 setAccessibilityLabel:v7];
  }

  return v5;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)BKAppearanceViewControllerAccessibility;
  [(BKAppearanceViewControllerAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  UIAccessibilityNotifications v3 = [(BKAppearanceViewControllerAccessibility *)self imaxValueForKey:@"_themeWhiteLabel"];
  [v3 setIsAccessibilityElement:0];

  v4 = [(BKAppearanceViewControllerAccessibility *)self imaxValueForKey:@"_themeSepiaLabel"];
  [v4 setIsAccessibilityElement:0];

  objc_super v5 = [(BKAppearanceViewControllerAccessibility *)self imaxValueForKey:@"_themeNightLabel"];
  [v5 setIsAccessibilityElement:0];
}

- (BOOL)accessibilityPerformEscape
{
  return 1;
}

@end