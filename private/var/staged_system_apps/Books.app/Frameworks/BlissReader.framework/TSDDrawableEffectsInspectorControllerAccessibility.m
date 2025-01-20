@interface TSDDrawableEffectsInspectorControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)p_cellsForOpacitySection;
- (id)p_cellsForReflectionSection;
@end

@implementation TSDDrawableEffectsInspectorControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDDrawableEffectsInspectorController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)p_cellsForReflectionSection
{
  v5.receiver = self;
  v5.super_class = (Class)TSDDrawableEffectsInspectorControllerAccessibility;
  id v3 = [(TSDDrawableEffectsInspectorControllerAccessibility *)&v5 p_cellsForReflectionSection];
  [-[TSDDrawableEffectsInspectorControllerAccessibility tsaxValueForKey:](self tsaxValueForKey:@"mReflectionOpacitySlider", "setAccessibilityLabel:", TSAccessibilityLocalizedString(@"reflection.slider")];
  return v3;
}

- (id)p_cellsForOpacitySection
{
  v4.receiver = self;
  v4.super_class = (Class)TSDDrawableEffectsInspectorControllerAccessibility;
  id v2 = [(TSDDrawableEffectsInspectorControllerAccessibility *)&v4 p_cellsForOpacitySection];
  objc_msgSend(objc_msgSend(objc_msgSend(v2, "lastObject"), "tsaxValueForKey:", @"slider"), "setAccessibilityLabel:", TSAccessibilityLocalizedString(@"opacity.slider"));
  return v2;
}

@end