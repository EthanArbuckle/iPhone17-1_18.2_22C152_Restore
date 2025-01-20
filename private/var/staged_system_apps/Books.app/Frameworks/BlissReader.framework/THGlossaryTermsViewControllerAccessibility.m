@interface THGlossaryTermsViewControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)sectionIndexTitlesForTableView:(id)a3;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
@end

@implementation THGlossaryTermsViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"THGlossaryTermsViewController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  if (UIAccessibilityIsVoiceOverRunning()) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)THGlossaryTermsViewControllerAccessibility;
  return [(THGlossaryTermsViewControllerAccessibility *)&v6 sectionIndexTitlesForTableView:a3];
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)THGlossaryTermsViewControllerAccessibility;
  id v5 = [(THGlossaryTermsViewControllerAccessibility *)&v12 tableView:a3 willSelectRowAtIndexPath:a4];
  char v11 = 0;
  objc_super v6 = (objc_class *)objc_opt_class();
  v7 = (void *)__TSAccessibilityCastAsClass(v6, (uint64_t)self, 1, &v11);
  if (v11) {
    abort();
  }
  v8 = v7;
  if (objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(v7, "view"), "window"), "traitCollection"), "horizontalSizeClass") == (char *)&dword_0 + 1)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_28600C;
    v10[3] = &unk_456DE0;
    v10[4] = v8;
    TSAccessibilityPerformBlockOnMainThreadAfterDelay(v10, 1.0);
  }
  return v5;
}

@end