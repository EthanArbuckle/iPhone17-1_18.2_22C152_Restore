@interface _UIAlertControllerActionSheetRegularPresentationController
- (BOOL)dimmingViewWasTapped:(id)a3 withDismissCompletion:(id)a4;
- (id)_alertController;
- (id)_alertControllerContainer;
- (id)_compactPresentationController;
- (id)_exceptionStringForNilSourceViewOrBarButtonItem;
- (id)_presentationControllerForTraitCollection:(id)a3;
@end

@implementation _UIAlertControllerActionSheetRegularPresentationController

- (id)_compactPresentationController
{
  v3 = [_UIAlertControllerActionSheetCompactPresentationController alloc];
  v4 = [(UIPresentationController *)self presentedViewController];
  v5 = [(UIPresentationController *)self presentingViewController];
  v6 = [(_UIAlertControllerPresentationController *)v3 initWithPresentedViewController:v4 presentingViewController:v5];

  return v6;
}

- (id)_presentationControllerForTraitCollection:(id)a3
{
  id v5 = a3;
  v6 = self;
  v7 = [(UIPresentationController *)v6 presentingViewController];
  v8 = [v7 _presentationControllerClassName];
  Class v9 = NSClassFromString(v8);

  if (v9 == (Class)objc_opt_class())
  {
    [v5 horizontalSizeClass];
  }
  else
  {
    uint64_t v10 = objc_opt_class();
    if ([v5 horizontalSizeClass] == 1 && v9 != (Class)v10) {
      goto LABEL_8;
    }
  }
  v11 = +[UIDevice currentDevice];
  uint64_t v12 = [v11 userInterfaceIdiom];

  if (v12)
  {
    v13 = v6;
    goto LABEL_11;
  }
LABEL_8:
  v13 = [(_UIAlertControllerActionSheetRegularPresentationController *)v6 _compactPresentationController];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    v18 = [(_UIAlertControllerActionSheetRegularPresentationController *)v6 _alertController];
    v19 = [v18 description];
    [v15 handleFailureInMethod:a2, v6, @"_UIAlertControllerActionSheetRegularPresentationController.m", 40, @"Unknown presentation controller class %@ encountered when adapting UIAlertController %@", v17, v19 object file lineNumber description];
  }
  [v13 _presentedAlertControllerDidAdapt];
LABEL_11:

  return v13;
}

- (BOOL)dimmingViewWasTapped:(id)a3 withDismissCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(UIPopoverPresentationController *)self _popoverIsDismissingBecauseDismissInteractionOccurred])
  {
    BOOL v8 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)_UIAlertControllerActionSheetRegularPresentationController;
    BOOL v8 = [(UIPopoverPresentationController *)&v11 dimmingViewWasTapped:v6 withDismissCompletion:v7];
    Class v9 = [(_UIAlertControllerActionSheetRegularPresentationController *)self _alertController];
    [v9 _dismissFromPopoverDimmingView];
  }
  return v8;
}

- (id)_exceptionStringForNilSourceViewOrBarButtonItem
{
  v3 = [(_UIAlertControllerActionSheetRegularPresentationController *)self _alertController];
  v4 = [(_UIAlertControllerActionSheetRegularPresentationController *)self _alertControllerContainer];

  if (v3 == v4)
  {
    id v6 = NSString;
    id v7 = [(UIPresentationController *)self presentingViewController];
    BOOL v8 = (objc_class *)objc_opt_class();
    Class v9 = NSStringFromClass(v8);
    uint64_t v10 = [(UIPresentationController *)self presentingViewController];
    id v5 = [v6 stringWithFormat:@"Your application has presented a UIAlertController (%@) of style UIAlertControllerStyleActionSheet from %@ (%@). The modalPresentationStyle of a UIAlertController with this style is UIModalPresentationPopover. You must provide location information for this popover through the alert controller's popoverPresentationController. You must provide either a sourceView and sourceRect or a barButtonItem.  If this information is not known when you present the alert controller, you may provide it in the UIPopoverPresentationControllerDelegate method -prepareForPopoverPresentation.", v3, v9, v10];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)_UIAlertControllerActionSheetRegularPresentationController;
    id v5 = [(UIPopoverPresentationController *)&v12 _exceptionStringForNilSourceViewOrBarButtonItem];
  }

  return v5;
}

- (id)_alertController
{
  v2 = [(UIPresentationController *)self presentedViewController];
  v3 = [v2 _containedAlertController];

  return v3;
}

- (id)_alertControllerContainer
{
  v2 = [(_UIAlertControllerActionSheetRegularPresentationController *)self _alertController];
  v3 = [v2 _alertControllerContainer];

  return v3;
}

@end