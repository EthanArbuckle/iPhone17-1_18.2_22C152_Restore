@interface TSDArrangeZOrderCellAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (TSDArrangeZOrderCellAccessibility)initWithDelegate:(id)a3;
@end

@implementation TSDArrangeZOrderCellAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDArrangeZOrderCell";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (TSDArrangeZOrderCellAccessibility)initWithDelegate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSDArrangeZOrderCellAccessibility;
  v4 = [(TSDArrangeZOrderCellAccessibility *)&v6 initWithDelegate:a3];
  [-[TSDArrangeZOrderCellAccessibility tsaxValueForKey:](self tsaxValueForKey:@"mZOrderSlider", "setAccessibilityLabel:", TSAccessibilityLocalizedString(@"move.back.to.front.slider")];
  [-[TSDArrangeZOrderCellAccessibility tsaxValueForKey:](self tsaxValueForKey:@"mMoveBackButton", "setAccessibilityLabel:", TSAccessibilityLocalizedString(@"move.to.back.button")];
  [-[TSDArrangeZOrderCellAccessibility tsaxValueForKey:](self tsaxValueForKey:@"mMoveFrontButton", "setAccessibilityLabel:", TSAccessibilityLocalizedString(@"move.to.front.button")];
  return v4;
}

@end