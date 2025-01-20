@interface VUIAlertController
- (BOOL)_canShowWhileLocked;
- (BOOL)overridesOrientationLock;
- (NSMutableArray)alertActions;
- (id)dismissalHandler;
- (void)setAlertActions:(id)a3;
- (void)setDismissalHandler:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)vui_addAction:(id)a3;
- (void)vui_addAction:(id)a3 isPreferred:(BOOL)a4;
- (void)vui_dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)vui_presentAlertFromPresentingController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)vui_setDismissalHandler:(id)a3;
@end

@implementation VUIAlertController

- (void)vui_addAction:(id)a3 isPreferred:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (+[VUIUtilities isSUIEnabled])
  {
    v7 = [(VUIAlertController *)self alertActions];

    if (!v7)
    {
      v8 = [MEMORY[0x1E4F1CA48] array];
      [(VUIAlertController *)self setAlertActions:v8];
    }
    v9 = [(VUIAlertController *)self alertActions];
    [v9 addObject:v6];
  }
  v10 = (void *)MEMORY[0x1E4FB1410];
  v11 = [v6 title];
  uint64_t v12 = [v6 style];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __48__VUIAlertController_vui_addAction_isPreferred___block_invoke;
  v15[3] = &unk_1E6DFC3E8;
  id v16 = v6;
  id v13 = v6;
  v14 = [v10 actionWithTitle:v11 style:v12 handler:v15];

  [(VUIAlertController *)self addAction:v14];
  if (v4) {
    [(VUIAlertController *)self setPreferredAction:v14];
  }
}

void __48__VUIAlertController_vui_addAction_isPreferred___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) handler];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) handler];
    v3[2](v3, *(void *)(a1 + 32));
  }
}

- (void)vui_addAction:(id)a3
{
}

- (void)vui_presentAlertFromPresentingController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v18 = a3;
  if (_os_feature_enabled_impl())
  {
    id v6 = [(VUIAlertController *)self _attributedTitle];
    v7 = [v6 string];
    v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [(VUIAlertController *)self title];
    }
    v10 = v9;

    v11 = [(VUIAlertController *)self _attributedMessage];
    uint64_t v12 = [v11 string];
    id v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [(VUIAlertController *)self message];
    }
    v15 = v14;

    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v18, "vui_requiresLegacyPresentation"))
    {
      [v18 presentViewController:self animated:1 completion:0];
    }
    else
    {
      id v16 = [(VUIAlertController *)self alertActions];
      v17 = (void *)[v16 copy];
      [v18 presentAlertWithTitle:v10 message:v15 actions:v17 animated:1];
    }
  }
  else
  {
    [v18 presentViewController:self animated:1 completion:0];
  }
}

- (void)vui_setDismissalHandler:(id)a3
{
  BOOL v4 = _Block_copy(a3);
  id dismissalHandler = self->_dismissalHandler;
  self->_id dismissalHandler = v4;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VUIAlertController;
  [(VUIAlertController *)&v5 viewDidDisappear:a3];
  id dismissalHandler = (void (**)(void))self->_dismissalHandler;
  if (dismissalHandler) {
    dismissalHandler[2]();
  }
}

- (void)vui_dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  if (+[VUIUtilities isSUIEnabled])
  {
    id v6 = +[VUIInterfaceFactory sharedInstance];
    v7 = [v6 controllerPresenter];
    [v7 dismissViewControllerAnimated:v4 completion:v8];
  }
  else
  {
    [(VUIAlertController *)self dismissViewControllerAnimated:v4 completion:v8];
  }
}

- (BOOL)overridesOrientationLock
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return +[VUIUtilities isRemoteApp];
}

- (NSMutableArray)alertActions
{
  return self->_alertActions;
}

- (void)setAlertActions:(id)a3
{
}

- (id)dismissalHandler
{
  return self->_dismissalHandler;
}

- (void)setDismissalHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissalHandler, 0);
  objc_storeStrong((id *)&self->_alertActions, 0);
}

@end