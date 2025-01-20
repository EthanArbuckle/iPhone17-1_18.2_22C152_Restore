@interface TSUIApplicationAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)_accessibilityElementFirst:(BOOL)a3 last:(BOOL)a4 forFocus:(BOOL)a5;
- (id)accessibilityLabel;
@end

@implementation TSUIApplicationAccessibility

+ (id)tsaxTargetClassName
{
  return @"UIApplication";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  id v3 = [(TSUIApplicationAccessibility *)self tsaxValueForKey:@"delegate"];
  if (objc_opt_respondsToSelector())
  {
    return [v3 tsaxValueForKey:@"applicationName"];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)TSUIApplicationAccessibility;
    return [(TSUIApplicationAccessibility *)&v5 accessibilityLabel];
  }
}

- (id)_accessibilityElementFirst:(BOOL)a3 last:(BOOL)a4 forFocus:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  if (!a3) {
    goto LABEL_8;
  }
  v9 = +[TSAccessibility sharedInstance];
  if (!v5)
  {
    id v10 = [(TSAccessibility *)v9 _firstElementForUpcomingPageTurn];
    if (v10) {
      goto LABEL_6;
    }
    v9 = +[TSAccessibility sharedInstance];
  }
  id v10 = [(TSAccessibility *)v9 _firstElementForUpcomingScreenChange];
  if (!v10)
  {
LABEL_8:
    v14.receiver = self;
    v14.super_class = (Class)TSUIApplicationAccessibility;
    return [(TSUIApplicationAccessibility *)&v14 _accessibilityElementFirst:v7 last:v6 forFocus:v5];
  }
LABEL_6:
  id v11 = [v10 tsaxAncestorView];
  if (!v11) {
    goto LABEL_8;
  }
  id v12 = [v11 tsaxViewAncestorOfType:objc_opt_class()];
  if (v12 != [(TSUIApplicationAccessibility *)self tsaxValueForKey:@"_accessibilityMainWindow"])goto LABEL_8; {
  return v10;
  }
}

@end