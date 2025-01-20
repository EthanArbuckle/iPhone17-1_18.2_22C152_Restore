@interface TSDiOSCanvasViewControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_tsaxIsEditMenuAllowedToAppear;
- (NSArray)tsaxEditMenuItems;
- (TSDInteractiveCanvasControllerAccessibility)_tsaxInteractiveCanvasController;
- (void)showEditMenuForSelection:(id)a3;
@end

@implementation TSDiOSCanvasViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDiOSCanvasViewController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSArray)tsaxEditMenuItems
{
  if (![(TSDiOSCanvasViewControllerAccessibility *)self _tsaxIsEditMenuAllowedToAppear])return 0; {
  v3 = +[UIMenuController sharedMenuController];
  }
  if ([(UIMenuController *)v3 isMenuVisible])
  {
    return [(UIMenuController *)v3 menuItems];
  }
  else
  {
    result = [(TSDInteractiveCanvasControllerAccessibility *)[(TSDiOSCanvasViewControllerAccessibility *)self _tsaxInteractiveCanvasController] tsaxCanvasSelection];
    if (result)
    {
      v4 = result;
      v5 = (NSArray *)+[NSMutableArray array];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_273F00;
      v11[3] = &unk_456F28;
      v11[4] = self;
      v11[5] = v5;
      v11[6] = v4;
      if (__TSAccessibilityPerformSafeBlock((uint64_t)v11)
        || (char v10 = 0,
            v6 = (objc_class *)objc_opt_class(),
            v7 = (void *)__TSAccessibilityCastAsClass(v6, (uint64_t)[(TSDiOSCanvasViewControllerAccessibility *)self tsaxValueForKey:@"extraMenuItems"], 1, &v10), v10))
      {
        abort();
      }
      v8 = v7;
      if ([v7 count]) {
        [(NSArray *)v5 addObjectsFromArray:v8];
      }
      if ([(NSArray *)v5 count]) {
        return v5;
      }
      else {
        return 0;
      }
    }
  }
  return result;
}

- (void)showEditMenuForSelection:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_273F98;
  v3[3] = &unk_456E38;
  v3[4] = a3;
  v3[5] = self;
  [+[UIMenuController sharedMenuController] tsaxPerformBlockPreventingMakingVisible:v3];
}

- (TSDInteractiveCanvasControllerAccessibility)_tsaxInteractiveCanvasController
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (TSDInteractiveCanvasControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDiOSCanvasViewControllerAccessibility *)self tsaxValueForKey:@"interactiveCanvasController"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (BOOL)_tsaxIsEditMenuAllowedToAppear
{
  id v2 = [(TSDiOSCanvasViewControllerAccessibility *)self tsaxValueForKey:@"delegate"];
  NSSelectorFromString(@"allowEditMenuToAppear");
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return [v2 tsaxBoolValueForKey:@"allowEditMenuToAppear"];
}

@end