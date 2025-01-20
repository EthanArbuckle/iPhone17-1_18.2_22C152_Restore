@interface CRLUIMenuControllerAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (BOOL)_crlaxShouldActuallyPreventMakingVisible;
- (void)setMenuItems:(id)a3;
- (void)setMenuVisible:(BOOL)a3;
- (void)setMenuVisible:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation CRLUIMenuControllerAccessibility

+ (id)crlaxTargetClassName
{
  return @"UIMenuController";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_class();
  v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 0, 0);

  return v5;
}

- (BOOL)_crlaxShouldActuallyPreventMakingVisible
{
  id v3 = +[CRLAccessibility sharedInstance];
  unsigned int v4 = [v3 needsAccessibilityElements];

  if (!v4) {
    return 0;
  }
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001838C;
  v7[3] = &unk_1014CB090;
  v7[4] = self;
  v7[5] = &v8;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v7)) {
    abort();
  }
  BOOL v5 = *((unsigned char *)v9 + 24) != 0;
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)setMenuItems:(id)a3
{
  unsigned int v4 = self;
  id v5 = a3;
  if ([(CRLUIMenuControllerAccessibility *)v4 _crlaxShouldPreventMutatingItems])
  {
    [(CRLUIMenuControllerAccessibility *)v4 _crlaxSetLastUpdatedMenuItemsWhilePreventingActualItemsMutation:v5];
  }
  else
  {
    v6.receiver = v4;
    v6.super_class = (Class)CRLUIMenuControllerAccessibility;
    [(CRLUIMenuControllerAccessibility *)&v6 setMenuItems:v5];
  }
}

- (void)setMenuVisible:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3
    || ![(CRLUIMenuControllerAccessibility *)self _crlaxShouldActuallyPreventMakingVisible])
  {
    v5.receiver = self;
    v5.super_class = (Class)CRLUIMenuControllerAccessibility;
    [(CRLUIMenuControllerAccessibility *)&v5 setMenuVisible:v3];
  }
}

- (void)setMenuVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (!a3
    || ![(CRLUIMenuControllerAccessibility *)self _crlaxShouldActuallyPreventMakingVisible])
  {
    v7.receiver = self;
    v7.super_class = (Class)CRLUIMenuControllerAccessibility;
    [(CRLUIMenuControllerAccessibility *)&v7 setMenuVisible:v5 animated:v4];
  }
}

@end