@interface THGlossaryDefinitionsViewControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)thaxSuffixOfScrollStatusStringForScrollView:(id)a3;
- (void)_axClearWeakReferencesToSelf;
- (void)dealloc;
- (void)loadView;
- (void)p_entryDidLoad:(id)a3;
- (void)viewWillUnload;
@end

@implementation THGlossaryDefinitionsViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"THGlossaryDefinitionsViewController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)_axClearWeakReferencesToSelf
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_285448;
  v2[3] = &unk_456DE0;
  v2[4] = [(THGlossaryDefinitionsViewControllerAccessibility *)self tsaxValueForKey:@"mScrollView"];
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2)) {
    abort();
  }
}

- (void)dealloc
{
  [(THGlossaryDefinitionsViewControllerAccessibility *)self _axClearWeakReferencesToSelf];
  v3.receiver = self;
  v3.super_class = (Class)THGlossaryDefinitionsViewControllerAccessibility;
  [(THGlossaryDefinitionsViewControllerAccessibility *)&v3 dealloc];
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)THGlossaryDefinitionsViewControllerAccessibility;
  [(THGlossaryDefinitionsViewControllerAccessibility *)&v4 loadView];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_285580;
  v3[3] = &unk_456E38;
  v3[4] = [(THGlossaryDefinitionsViewControllerAccessibility *)self tsaxValueForKey:@"mScrollView"];
  v3[5] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3)) {
    abort();
  }
}

- (void)viewWillUnload
{
  [(THGlossaryDefinitionsViewControllerAccessibility *)self _axClearWeakReferencesToSelf];
  v3.receiver = self;
  v3.super_class = (Class)THGlossaryDefinitionsViewControllerAccessibility;
  [(THGlossaryDefinitionsViewControllerAccessibility *)&v3 viewWillUnload];
}

- (id)thaxSuffixOfScrollStatusStringForScrollView:(id)a3
{
  id v3 = [(THGlossaryDefinitionsViewControllerAccessibility *)self tsaxValueForKey:@"displayedEntry"];

  return [v3 tsaxValueForKey:@"term"];
}

- (void)p_entryDidLoad:(id)a3
{
  id v5 = [(THGlossaryDefinitionsViewControllerAccessibility *)self tsaxValueForKey:@"glossaryViewController"];
  if (objc_opt_respondsToSelector())
  {
    [v5 _axGlossaryDefinitionsViewController:self entryDidLoad:a3];
  }
}

@end