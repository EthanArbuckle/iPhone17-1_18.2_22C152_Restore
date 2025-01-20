@interface THNotesViewControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_thaxIsViewLoaded;
- (THBookViewControllerAccessibility)_thaxBookViewController;
- (UIView)_thaxExistingView;
- (UIView)_thaxView;
@end

@implementation THNotesViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"THNotesViewController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (UIView)_thaxExistingView
{
  if (![(THNotesViewControllerAccessibility *)self _thaxIsViewLoaded]) {
    return 0;
  }

  return [(THNotesViewControllerAccessibility *)self _thaxView];
}

- (BOOL)_thaxIsViewLoaded
{
  return [(THNotesViewControllerAccessibility *)self tsaxBoolValueForKey:@"isViewLoaded"];
}

- (UIView)_thaxView
{
  char v5 = 0;
  v3 = (objc_class *)objc_opt_class();
  result = (UIView *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(THNotesViewControllerAccessibility *)self tsaxValueForKey:@"view"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (THBookViewControllerAccessibility)_thaxBookViewController
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (THBookViewControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THNotesViewControllerAccessibility *)self tsaxValueForKey:@"bookViewController"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end