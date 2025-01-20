@interface PSSetupController
- (BOOL)popupStyleIsModal;
- (BOOL)usePopupStyle;
- (PSSetupController)init;
- (id)controller;
- (id)parentController;
- (void)dismiss;
- (void)dismissAnimated:(BOOL)a3;
- (void)dismissAnimated:(BOOL)a3 completion:(id)a4;
- (void)dismissWithCompletion:(id)a3;
- (void)handleURL:(id)a3;
- (void)popControllerOnParent;
- (void)pushControllerOnParentWithSpecifier:(id)a3;
- (void)setParentController:(id)a3;
- (void)setupController;
- (void)showController:(id)a3 animate:(BOOL)a4;
- (void)statusBarWillChangeHeight:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PSSetupController

- (PSSetupController)init
{
  v5.receiver = self;
  v5.super_class = (Class)PSSetupController;
  v2 = [(PSRootController *)&v5 initWithTitle:@"setup" identifier:@"setup"];
  v3 = v2;
  if (v2) {
    [(PSSetupController *)v2 setModalPresentationStyle:2];
  }
  return v3;
}

- (void)handleURL:(id)a3
{
  id v5 = a3;
  v4 = [(PSSetupController *)self topViewController];
  if [v4 conformsToProtocol:&unk_1EFB7BC28] && (objc_opt_respondsToSelector()) {
    [v4 handleURL:v5];
  }
}

- (id)parentController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);
  return WeakRetained;
}

- (void)setupController
{
  v3 = [(PSSetupController *)self viewControllers];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    aClassName = [(PSSpecifier *)self->super._specifier propertyForKey:@"customControllerClass"];
    if (![(NSString *)aClassName length] || (id v5 = NSClassFromString(aClassName)) == 0) {
      id v5 = (objc_class *)objc_opt_class();
    }
    v6 = CreateDetailControllerInstanceWithClass(v5);
    id WeakRetained = objc_loadWeakRetained(&self->super._specifier->target);

    if (!WeakRetained) {
      objc_storeWeak(&self->super._specifier->target, self);
    }
    v8 = [(PSSpecifier *)self->super._specifier properties];
    rootInfo = self->_rootInfo;
    self->_rootInfo = v8;

    [v6 setParentController:self];
    [v6 setRootController:self];
    [v6 setSpecifier:self->super._specifier];
    [(PSRootController *)self showController:v6];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PSSetupController;
  [(PSRootController *)&v4 viewWillDisappear:a3];
  if ([(PSSetupController *)self usePopupStyle])
  {
    [(PSRootController *)self->_parentRootController willDismissPopupView];
  }
  else if ([(PSSetupController *)self modalPresentationStyle] == 2)
  {
    [(PSRootController *)self->_parentRootController willDismissFormSheetView];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PSSetupController;
  [(PSRootController *)&v4 viewDidDisappear:a3];
  if ([(PSSetupController *)self usePopupStyle])
  {
    [(PSRootController *)self->_parentRootController didDismissPopupView];
  }
  else if ([(PSSetupController *)self modalPresentationStyle] == 2)
  {
    [(PSRootController *)self->_parentRootController didDismissFormSheetView];
  }
}

- (void)showController:(id)a3 animate:(BOOL)a4
{
  id v5 = a3;
  if (objc_opt_respondsToSelector())
  {
    v6 = [v5 specifier];
    v7 = [v6 propertyForKey:@"dontAnimate"];
    int v8 = [v7 BOOLValue];

    uint64_t v9 = v8 ^ 1u;
  }
  else
  {
    uint64_t v9 = 1;
  }
  v10.receiver = self;
  v10.super_class = (Class)PSSetupController;
  [(PSRootController *)&v10 showController:v5 animate:v9];
}

- (void)setParentController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_parentController, obj);
    id v5 = [obj rootController];
    parentRootController = self->_parentRootController;
    self->_parentRootController = v5;
  }
}

- (id)controller
{
  v2 = [(PSSetupController *)self viewControllers];
  v3 = [v2 firstObject];

  return v3;
}

- (void)dismissWithCompletion:(id)a3
{
}

- (void)dismiss
{
}

- (void)dismissAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v12 = a4;
  if (![(PSSetupController *)self usePopupStyle])
  {
    objc_super v10 = [(PSSetupController *)self parentController];
    [v10 performSelector:sel__setNotShowingSetupController];

    v11 = [(PSSetupController *)self presentingViewController];
    [v11 dismissViewControllerAnimated:v4 completion:v12];
LABEL_7:

    goto LABEL_8;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);
  v7 = [WeakRetained presentedViewController];

  if (v7 == self)
  {
    v11 = objc_loadWeakRetained((id *)&self->_parentController);
    [v11 dismissPopoverWithCompletion:v12];
    goto LABEL_7;
  }
  int v8 = [(PSRootController *)self->_parentRootController presentedViewController];

  uint64_t v9 = v12;
  if (v8 != self) {
    goto LABEL_9;
  }
  [(PSRootController *)self->_parentRootController dismissViewControllerAnimated:1 completion:v12];
LABEL_8:
  uint64_t v9 = v12;
LABEL_9:
}

- (void)dismissAnimated:(BOOL)a3
{
}

- (void)pushControllerOnParentWithSpecifier:(id)a3
{
  id v12 = (objc_class **)a3;
  p_parentController = &self->_parentController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7 = CreateDetailControllerInstanceWithClass(v12[6]);
    [v7 setRootController:self->_parentRootController];
    id v8 = objc_loadWeakRetained((id *)&self->_parentController);
    [v7 setParentController:v8];

    [v7 setSpecifier:v12];
    id v9 = objc_loadWeakRetained((id *)p_parentController);
    objc_super v10 = [v9 navigationController];
    v11 = [MEMORY[0x1E4F42948] currentDevice];
    objc_msgSend(v10, "pushViewController:animated:", v7, objc_msgSend(v11, "sf_isiPad"));
  }
}

- (void)popControllerOnParent
{
  p_parentController = &self->_parentController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = objc_loadWeakRetained((id *)p_parentController);
    id v5 = [v7 navigationController];
    id v6 = (id)[v5 popViewControllerAnimated:0];
  }
}

- (BOOL)usePopupStyle
{
  return 0;
}

- (BOOL)popupStyleIsModal
{
  return 0;
}

- (void)statusBarWillChangeHeight:(id)a3
{
  id v4 = a3;
  if (![(PSSetupController *)self usePopupStyle]
    && [(PSSetupController *)self modalPresentationStyle] != 2)
  {
    v5.receiver = self;
    v5.super_class = (Class)PSSetupController;
    [(PSRootController *)&v5 statusBarWillChangeHeight:v4];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentRootController, 0);
  objc_destroyWeak((id *)&self->_parentController);
  objc_storeStrong((id *)&self->_rootInfo, 0);
}

@end