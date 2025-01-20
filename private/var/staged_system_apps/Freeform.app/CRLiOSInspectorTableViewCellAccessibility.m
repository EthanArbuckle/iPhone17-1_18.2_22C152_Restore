@interface CRLiOSInspectorTableViewCellAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (BOOL)_accessibilityUsesSpecialKeyboardDismiss;
- (id)_crlaxImageButton;
- (id)accessibilityLabel;
- (void)setChecked:(BOOL)a3;
@end

@implementation CRLiOSInspectorTableViewCellAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLiOSInspectorTableViewCell";
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

- (void)setChecked:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CRLiOSInspectorTableViewCellAccessibility;
  -[CRLiOSInspectorTableViewCellAccessibility setChecked:](&v7, "setChecked:");
  unint64_t v5 = (unint64_t)[(CRLiOSInspectorTableViewCellAccessibility *)self accessibilityTraits];
  if (v3) {
    UIAccessibilityTraits v6 = UIAccessibilityTraitSelected | v5;
  }
  else {
    UIAccessibilityTraits v6 = v5 & ~UIAccessibilityTraitSelected;
  }
  [(CRLiOSInspectorTableViewCellAccessibility *)self setAccessibilityTraits:v6];
}

- (id)accessibilityLabel
{
  char v13 = 0;
  v2 = self;
  BOOL v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = __CRLAccessibilityCastAsClass(v3, (uint64_t)v2, 1, &v13);
  if (v13) {
    abort();
  }
  unint64_t v5 = (void *)v4;

  UIAccessibilityTraits v6 = [v5 textLabel];
  objc_super v7 = [v6 text];
  id v8 = [v7 length];

  if (v8)
  {
    v9 = [v5 textLabel];
    v10 = [v9 text];
  }
  else
  {
    v12.receiver = v2;
    v12.super_class = (Class)CRLiOSInspectorTableViewCellAccessibility;
    v10 = [(CRLiOSInspectorTableViewCellAccessibility *)&v12 accessibilityLabel];
  }

  return v10;
}

- (BOOL)_accessibilityUsesSpecialKeyboardDismiss
{
  return 1;
}

- (id)_crlaxImageButton
{
  v2 = [(CRLiOSInspectorTableViewCellAccessibility *)self crlaxTarget];
  BOOL v3 = [v2 imageButton];

  return v3;
}

@end