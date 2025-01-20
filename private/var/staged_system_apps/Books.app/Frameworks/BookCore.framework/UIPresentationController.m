@interface UIPresentationController
- (BOOL)im_isFullScreen;
- (UIBarButtonItem)bc_realSourceBarButtonItem;
- (UIView)bc_fakeSourceView;
- (void)bc_applyTraitOverridesWithOverrideUserInterfaceStyleFromViewController:(id)a3;
- (void)setBc_fakeSourceView:(id)a3;
- (void)setBc_realSourceBarButtonItem:(id)a3;
@end

@implementation UIPresentationController

- (void)setBc_realSourceBarButtonItem:(id)a3
{
}

- (UIBarButtonItem)bc_realSourceBarButtonItem
{
  return (UIBarButtonItem *)objc_getAssociatedObject(self, "bc_realSourceBarButtonItem");
}

- (void)setBc_fakeSourceView:(id)a3
{
}

- (UIView)bc_fakeSourceView
{
  return (UIView *)objc_getAssociatedObject(self, "bc_fakeSourceView");
}

- (BOOL)im_isFullScreen
{
  v3 = [(UIPresentationController *)self presentingViewController];

  if (!v3) {
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/ViewControllers/UIPresentationController+IMAdditions.m", 41, (uint64_t)"-[UIPresentationController(IMAdditions) im_isFullScreen]", (uint64_t)"self.presentingViewController", @"View Controller is not presented yet so this question doesn't make sense", v4, v5, v6, v8);
  }
  if ((char *)[(UIPresentationController *)self presentationStyle] != (char *)&dword_4 + 3) {
    return 1;
  }

  return [(UIPresentationController *)self _isAdapted];
}

- (void)bc_applyTraitOverridesWithOverrideUserInterfaceStyleFromViewController:(id)a3
{
  id v4 = [a3 overrideUserInterfaceStyle];
  if (v4)
  {
    id v5 = v4;
    id v6 = [(UIPresentationController *)self traitOverrides];
    [v6 setUserInterfaceStyle:v5];
  }
}

@end