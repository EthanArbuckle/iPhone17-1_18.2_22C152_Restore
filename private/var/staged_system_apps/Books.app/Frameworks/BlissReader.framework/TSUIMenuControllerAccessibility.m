@interface TSUIMenuControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_tsaxShouldActuallyPreventMakingVisible;
- (void)setMenuItems:(id)a3;
- (void)setMenuVisible:(BOOL)a3;
- (void)setMenuVisible:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation TSUIMenuControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"UIMenuController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_tsaxShouldActuallyPreventMakingVisible
{
  if (![+[TSAccessibility sharedInstance] needsAccessibilityElements])return 0; {
  uint64_t v6 = 0;
  }
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_260750;
  v5[3] = &unk_4573D8;
  v5[4] = self;
  v5[5] = &v6;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5)) {
    abort();
  }
  BOOL v3 = *((unsigned char *)v7 + 24) != 0;
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setMenuItems:(id)a3
{
  if ([(TSUIMenuControllerAccessibility *)self _tsaxShouldPreventMutatingItems])
  {
    [(TSUIMenuControllerAccessibility *)self _tsaxSetLastUpdatedMenuItemsWhilePreventingActualItemsMutation:a3];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)TSUIMenuControllerAccessibility;
    [(TSUIMenuControllerAccessibility *)&v5 setMenuItems:a3];
  }
}

- (void)setMenuVisible:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3
    || ![(TSUIMenuControllerAccessibility *)self _tsaxShouldActuallyPreventMakingVisible])
  {
    v5.receiver = self;
    v5.super_class = (Class)TSUIMenuControllerAccessibility;
    [(TSUIMenuControllerAccessibility *)&v5 setMenuVisible:v3];
  }
}

- (void)setMenuVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (!a3
    || ![(TSUIMenuControllerAccessibility *)self _tsaxShouldActuallyPreventMakingVisible])
  {
    v7.receiver = self;
    v7.super_class = (Class)TSUIMenuControllerAccessibility;
    [(TSUIMenuControllerAccessibility *)&v7 setMenuVisible:v5 animated:v4];
  }
}

@end