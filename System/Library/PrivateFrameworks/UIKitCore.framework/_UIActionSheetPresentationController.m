@interface _UIActionSheetPresentationController
- (BOOL)_shouldPresentedViewControllerControlStatusBarAppearance;
- (BOOL)_shouldUseCompactPresentationControllerWhenPresentedInSheet;
- (BOOL)actionSheetCompactPresentationControllerShouldPresentInCurrentContext:(id)a3;
- (BOOL)avoidsKeyboardDisabled;
- (BOOL)dimmingViewWasTapped:(id)a3 withDismissCompletion:(id)a4;
- (BOOL)dismissActionUsesShorterHeightWhenCompactVertically;
- (NSString)dismissActionTitle;
- (UIActionSheetPresentationControllerDelegate)actionSheetDelegate;
- (_UIActionSheetCompactPresentationController)compactPresentationController;
- (id)_compactPresentationController;
- (id)_exceptionStringForNilSourceViewOrBarButtonItem;
- (id)_presentationControllerForTraitCollection:(id)a3;
- (id)_visualStyleForTraitCollection:(id)a3;
- (int64_t)_presentationContextForViewController:(id)a3;
- (void)_setShouldUseCompactPresentationControllerWhenPresentedInSheet:(BOOL)a3;
- (void)actionSheetCompactPresentationControllerDidDismiss:(id)a3;
- (void)beginPseudoAlertPresentationMode;
- (void)dealloc;
- (void)endPseudoAlertPresentationMode;
- (void)setActionSheetDelegate:(id)a3;
- (void)setAvoidsKeyboardDisabled:(BOOL)a3;
- (void)setCompactPresentationController:(id)a3;
- (void)setDismissActionTitle:(id)a3;
- (void)setDismissActionUsesShorterHeightWhenCompactVertically:(BOOL)a3;
@end

@implementation _UIActionSheetPresentationController

- (id)_visualStyleForTraitCollection:(id)a3
{
  v3 = objc_alloc_init(_UIActionSheetPresentationControllerVisualStyleiOS);
  return v3;
}

- (id)_compactPresentationController
{
  v3 = [(_UIActionSheetPresentationController *)self compactPresentationController];

  if (!v3)
  {
    v4 = [_UIActionSheetCompactPresentationController alloc];
    v5 = [(UIPresentationController *)self presentedViewController];
    v6 = [(UIPresentationController *)self presentingViewController];
    v7 = [(UIPresentationController *)self traitCollection];
    v8 = [(_UIActionSheetPresentationController *)self _visualStyleForTraitCollection:v7];
    v9 = [(_UIActionSheetCompactPresentationController *)v4 initWithPresentedViewController:v5 presentingViewController:v6 visualStyle:v8];

    [(_UIActionSheetPresentationController *)self setCompactPresentationController:v9];
    [(_UIActionSheetCompactPresentationController *)v9 setActionSheetDelegate:self];
    v10 = [(_UIActionSheetPresentationController *)self dismissActionTitle];
    [(_UIActionSheetCompactPresentationController *)v9 setDismissActionTitle:v10];

    [(_UIActionSheetCompactPresentationController *)v9 setDismissActionUsesShorterHeightWhenCompactVertically:self->_dismissActionUsesShorterHeightWhenCompactVertically];
  }
  return [(_UIActionSheetPresentationController *)self compactPresentationController];
}

- (int64_t)_presentationContextForViewController:(id)a3
{
  id v3 = a3;
  if ([v3 _isInPopoverPresentation])
  {
    int64_t v4 = 1;
  }
  else if ([v3 _isInContextOfPresentationControllerOfClass:objc_opt_class() effective:1])
  {
    int64_t v4 = 2;
  }
  else if ([v3 _isInContextOfPresentationControllerOfClass:objc_opt_class() effective:1])
  {
    int64_t v4 = 2;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (id)_presentationControllerForTraitCollection:(id)a3
{
  id v4 = a3;
  v5 = [(_UIActionSheetPresentationController *)self _compactPresentationController];
  v6 = [(UIPresentationController *)self presentingViewController];
  v7 = UIActionSheetPresentationControllerToUse(v4, [(_UIActionSheetPresentationController *)self _presentationContextForViewController:v6], self, v5, [(_UIActionSheetPresentationController *)self _shouldUseCompactPresentationControllerWhenPresentedInSheet]);

  return v7;
}

- (void)dealloc
{
  id v3 = [(_UIActionSheetPresentationController *)self compactPresentationController];
  [v3 setActionSheetDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)_UIActionSheetPresentationController;
  [(UIPopoverPresentationController *)&v4 dealloc];
}

- (BOOL)_shouldPresentedViewControllerControlStatusBarAppearance
{
  return 0;
}

- (BOOL)dimmingViewWasTapped:(id)a3 withDismissCompletion:(id)a4
{
  id v5 = a3;
  if ([(UIPopoverPresentationController *)self _popoverIsDismissingBecauseDismissInteractionOccurred])
  {
    BOOL v6 = 0;
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __83___UIActionSheetPresentationController_dimmingViewWasTapped_withDismissCompletion___block_invoke;
    v9[3] = &unk_1E52D9F70;
    v9[4] = self;
    v8.receiver = self;
    v8.super_class = (Class)_UIActionSheetPresentationController;
    BOOL v6 = [(UIPopoverPresentationController *)&v8 dimmingViewWasTapped:v5 withDismissCompletion:v9];
  }

  return v6;
}

- (id)_exceptionStringForNilSourceViewOrBarButtonItem
{
  id v3 = [(UIPresentationController *)self presentedViewController];
  objc_super v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);

  BOOL v6 = NSString;
  v7 = [(UIPresentationController *)self presentedViewController];
  objc_super v8 = [v7 description];
  v9 = [v6 stringWithFormat:@"Your application has presented a %@ (%@). In its current trait environment, the modalPresentationStyle of a %@ with this style is UIModalPresentationPopover. You must provide location information for this popover through the view controller's popoverPresentationController. You must provide either a sourceView and sourceRect or a barButtonItem.  If this information is not known when you present the view controller, you may provide it in the UIPopoverPresentationControllerDelegate method -prepareForPopoverPresentation.", v5, v8, v5];

  return v9;
}

- (void)setDismissActionTitle:(id)a3
{
  objc_storeStrong((id *)&self->_dismissActionTitle, a3);
  id v5 = a3;
  id v6 = [(_UIActionSheetPresentationController *)self compactPresentationController];
  [v6 setDismissActionTitle:v5];
}

- (void)setDismissActionUsesShorterHeightWhenCompactVertically:(BOOL)a3
{
  self->_dismissActionUsesShorterHeightWhenCompactVertically = a3;
  id v3 = [(_UIActionSheetPresentationController *)self compactPresentationController];
  [v3 setDismissActionUsesShorterHeightWhenCompactVertically:1];
}

- (void)beginPseudoAlertPresentationMode
{
  id v2 = [(_UIActionSheetPresentationController *)self compactPresentationController];
  [v2 beginPseudoAlertPresentationMode];
}

- (void)endPseudoAlertPresentationMode
{
  id v2 = [(_UIActionSheetPresentationController *)self compactPresentationController];
  [v2 endPseudoAlertPresentationMode];
}

- (void)setAvoidsKeyboardDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_avoidsKeyboardDisabled = a3;
  id v4 = [(_UIActionSheetPresentationController *)self compactPresentationController];
  [v4 setAvoidsKeyboardDisabled:v3];
}

- (void)actionSheetCompactPresentationControllerDidDismiss:(id)a3
{
  id v4 = [(_UIActionSheetPresentationController *)self actionSheetDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(_UIActionSheetPresentationController *)self actionSheetDelegate];
    [v6 actionSheetPresentationControllerDidDismissActionSheet:self];
  }
}

- (BOOL)actionSheetCompactPresentationControllerShouldPresentInCurrentContext:(id)a3
{
  id v4 = [a3 presentingViewController];
  int64_t v5 = [(_UIActionSheetPresentationController *)self _presentationContextForViewController:v4];

  return v5 == 1;
}

- (NSString)dismissActionTitle
{
  return self->_dismissActionTitle;
}

- (BOOL)dismissActionUsesShorterHeightWhenCompactVertically
{
  return self->_dismissActionUsesShorterHeightWhenCompactVertically;
}

- (BOOL)_shouldUseCompactPresentationControllerWhenPresentedInSheet
{
  return self->__shouldUseCompactPresentationControllerWhenPresentedInSheet;
}

- (void)_setShouldUseCompactPresentationControllerWhenPresentedInSheet:(BOOL)a3
{
  self->__shouldUseCompactPresentationControllerWhenPresentedInSheet = a3;
}

- (UIActionSheetPresentationControllerDelegate)actionSheetDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionSheetDelegate);
  return (UIActionSheetPresentationControllerDelegate *)WeakRetained;
}

- (void)setActionSheetDelegate:(id)a3
{
}

- (_UIActionSheetCompactPresentationController)compactPresentationController
{
  return self->_compactPresentationController;
}

- (void)setCompactPresentationController:(id)a3
{
}

- (BOOL)avoidsKeyboardDisabled
{
  return self->_avoidsKeyboardDisabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compactPresentationController, 0);
  objc_destroyWeak((id *)&self->_actionSheetDelegate);
  objc_storeStrong((id *)&self->_dismissActionTitle, 0);
}

@end