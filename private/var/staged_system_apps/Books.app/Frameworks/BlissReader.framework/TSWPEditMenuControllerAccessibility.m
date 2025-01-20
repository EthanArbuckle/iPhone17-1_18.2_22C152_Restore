@interface TSWPEditMenuControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)tsaxAllowsMenuVisible;
- (void)p_setMenuVisible:(id)a3;
- (void)tsaxSetAllowsMenuVisible:(BOOL)a3;
@end

@implementation TSWPEditMenuControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSWPEditMenuController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)tsaxAllowsMenuVisible
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_5739F5);
}

- (void)tsaxSetAllowsMenuVisible:(BOOL)a3
{
}

- (void)p_setMenuVisible:(id)a3
{
  if (!UIAccessibilityIsVoiceOverRunning()
    || ![a3 BOOLValue]
    || [(TSWPEditMenuControllerAccessibility *)self tsaxAllowsMenuVisible])
  {
    v5.receiver = self;
    v5.super_class = (Class)TSWPEditMenuControllerAccessibility;
    [(TSWPEditMenuControllerAccessibility *)&v5 p_setMenuVisible:a3];
  }
}

@end