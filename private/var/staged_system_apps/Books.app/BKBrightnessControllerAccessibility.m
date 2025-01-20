@interface BKBrightnessControllerAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BKBrightnessControllerAccessibility

+ (id)imaxTargetClassName
{
  return @"BKBrightnessController";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BKBrightnessControllerAccessibility;
  [(BKBrightnessControllerAccessibility *)&v7 viewWillAppear:a3];
  v4 = [(BKBrightnessControllerAccessibility *)self imaxValueForKey:@"_slider"];
  v5 = sub_1000B86A8(@"brightness.button");
  [v4 setAccessibilityLabel:v5];

  v6 = [(BKBrightnessControllerAccessibility *)self imaxValueForKey:@"_slider"];
  [v6 imaxSetIdentification:@"BrightnessSlider"];
}

@end