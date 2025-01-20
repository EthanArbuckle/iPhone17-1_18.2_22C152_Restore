@interface CRLUIApplicationAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (id)_accessibilityElementFirst:(BOOL)a3 last:(BOOL)a4 forFocus:(BOOL)a5 allowScrolling:(BOOL)a6 traversalOptions:(id)a7;
- (id)_accessibilityElementFirst:(BOOL)a3 last:(BOOL)a4 forFocus:(BOOL)a5 parameters:(id)a6;
- (id)_crlaxAccessibilityElementFirstForFocus:(BOOL)a3;
- (id)_unswizzledTargetInChainForAction:(SEL)a3 sender:(id)a4;
- (id)accessibilityLabel;
@end

@implementation CRLUIApplicationAccessibility

+ (id)crlaxTargetClassName
{
  return @"UIApplication";
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

- (id)accessibilityLabel
{
  if (objc_opt_respondsToSelector())
  {
    id v3 = [(CRLUIApplicationAccessibility *)self crlaxTarget];
    v4 = [v3 _localizedApplicationName];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CRLUIApplicationAccessibility;
    v4 = [(CRLUIApplicationAccessibility *)&v6 accessibilityLabel];
  }

  return v4;
}

- (id)_crlaxAccessibilityElementFirstForFocus:(BOOL)a3
{
  v5 = +[CRLAccessibility sharedInstance];
  objc_super v6 = v5;
  if (!a3)
  {
    v7 = [v5 _firstElementForUpcomingPageTurn];

    if (v7) {
      goto LABEL_5;
    }
    objc_super v6 = +[CRLAccessibility sharedInstance];
  }
  v7 = [v6 _firstElementForUpcomingScreenChange];

  if (!v7)
  {
    id v12 = 0;
    goto LABEL_11;
  }
LABEL_5:
  v8 = [v7 crlaxAncestorView];
  if (!v8) {
    goto LABEL_7;
  }
  v9 = [v8 crlaxViewAncestorOfType:objc_opt_class()];
  v10 = [(CRLUIApplicationAccessibility *)self crlaxTarget];
  v11 = [v10 _accessibilityMainWindow];

  if (v9 == v11) {
    id v12 = v7;
  }
  else {
LABEL_7:
  }
    id v12 = 0;

LABEL_11:

  return v12;
}

- (id)_accessibilityElementFirst:(BOOL)a3 last:(BOOL)a4 forFocus:(BOOL)a5 parameters:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a6;
  if (!v8
    || ([(CRLUIApplicationAccessibility *)self _crlaxAccessibilityElementFirstForFocus:v6], (v11 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v13.receiver = self;
    v13.super_class = (Class)CRLUIApplicationAccessibility;
    v11 = [(CRLUIApplicationAccessibility *)&v13 _accessibilityElementFirst:v8 last:v7 forFocus:v6 parameters:v10];
  }

  return v11;
}

- (id)_accessibilityElementFirst:(BOOL)a3 last:(BOOL)a4 forFocus:(BOOL)a5 allowScrolling:(BOOL)a6 traversalOptions:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  BOOL v9 = a4;
  BOOL v10 = a3;
  id v12 = a7;
  if (!v10
    || ([(CRLUIApplicationAccessibility *)self _crlaxAccessibilityElementFirstForFocus:v8], (objc_super v13 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v15.receiver = self;
    v15.super_class = (Class)CRLUIApplicationAccessibility;
    objc_super v13 = [(CRLUIApplicationAccessibility *)&v15 _accessibilityElementFirst:v10 last:v9 forFocus:v8 allowScrolling:v7 traversalOptions:v12];
  }

  return v13;
}

- (id)_unswizzledTargetInChainForAction:(SEL)a3 sender:(id)a4
{
  id v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CRLUIApplicationAccessibility;
  BOOL v7 = [(CRLUIApplicationAccessibility *)&v17 _unswizzledTargetInChainForAction:a3 sender:v6];
  char v16 = 0;
  id v8 = v6;
  BOOL v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = __CRLAccessibilityCastAsClass(v9, (uint64_t)v8, 1, &v16);
  if (v16) {
    abort();
  }
  v11 = (void *)v10;

  if (v7) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v11 == 0;
  }
  if (!v12)
  {
    objc_super v13 = [v11 window];
    BOOL v7 = [v13 firstResponder];

    if (v7)
    {
      do
      {
        if ([v7 canPerformAction:a3 withSender:v8]) {
          break;
        }
        uint64_t v14 = [v7 nextResponder];

        BOOL v7 = (void *)v14;
      }
      while (v14);
    }
  }

  return v7;
}

@end