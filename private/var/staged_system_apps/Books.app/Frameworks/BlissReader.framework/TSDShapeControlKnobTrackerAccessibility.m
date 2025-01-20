@interface TSDShapeControlKnobTrackerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (void)p_updateHUDAtPoint:(CGPoint)a3;
@end

@implementation TSDShapeControlKnobTrackerAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDShapeControlKnobTracker";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)p_updateHUDAtPoint:(CGPoint)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSDShapeControlKnobTrackerAccessibility;
  -[TSDShapeControlKnobTrackerAccessibility p_updateHUDAtPoint:](&v4, "p_updateHUDAtPoint:", a3.x, a3.y);
  id v3 = [[NSClassFromString(@"TSDHUDViewController") tsaxValueForKey:@"sharedHUDViewController"] tsaxValueForKey:@"mLastStringSet"];
  UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v3);
}

@end