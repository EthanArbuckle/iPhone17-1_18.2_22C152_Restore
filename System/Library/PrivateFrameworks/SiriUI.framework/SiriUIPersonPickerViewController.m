@interface SiriUIPersonPickerViewController
- (id)_pickerResponseForPerson:(id)a3;
- (void)_dismissPicker;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPickerDidCancel:(id)a3;
- (void)showPicker:(id)a3;
@end

@implementation SiriUIPersonPickerViewController

- (void)showPicker:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263EFEBE0]);
  [v4 setDelegate:self];
  v5 = [MEMORY[0x263F08A98] predicateWithValue:1];
  [v4 setPredicateForSelectionOfContact:v5];

  [(SiriUIPersonPickerViewController *)self _dismissPicker];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __47__SiriUIPersonPickerViewController_showPicker___block_invoke;
  v14 = &unk_26469F450;
  v15 = self;
  id v6 = v4;
  id v16 = v6;
  v7 = (void (**)(void, void))MEMORY[0x223CB13F0](&v11);
  v8 = [(SiriUIObjectPickerViewController *)self pickerDelegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    v10 = [(SiriUIObjectPickerViewController *)self pickerDelegate];
    [v10 pickerViewController:self shouldPresentPicker:v6 completion:v7];
  }
  else
  {
    v7[2](v7, 1);
  }
}

void __47__SiriUIPersonPickerViewController_showPicker___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    v3 = [*(id *)(a1 + 32) pickerDelegate];
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      v5 = [*(id *)(a1 + 32) pickerDelegate];
      [v5 pickerViewController:*(void *)(a1 + 32) willPresentPicker:*(void *)(a1 + 40)];
    }
    id v6 = [*(id *)(a1 + 32) pickerDelegate];
    uint64_t v7 = [v6 viewControllerForPickerPresentation:*(void *)(a1 + 32)];
    objc_storeWeak((id *)(*(void *)(a1 + 32) + 992), (id)v7);

    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 992));
    [WeakRetained presentViewController:*(void *)(a1 + 40) animated:1 completion:0];

    char v9 = [*(id *)(a1 + 32) pickerDelegate];
    LOBYTE(v7) = objc_opt_respondsToSelector();

    if (v7)
    {
      id v10 = [*(id *)(a1 + 32) pickerDelegate];
      [v10 pickerViewController:*(void *)(a1 + 32) didRequestKeyboardWithVisibility:0];
    }
  }
}

- (id)_pickerResponseForPerson:(id)a3
{
  char v4 = [MEMORY[0x263F333F0] createSAPersonFromCNContact:a3];
  id v5 = objc_alloc_init(MEMORY[0x263F64F58]);
  id v6 = [(SiriUIObjectPickerViewController *)self _picker];
  [v5 setDomainObjectPicker:v6];

  [v5 setSelectedItem:v4];
  return v5;
}

- (void)_dismissPicker
{
  v3 = [(SiriUIObjectPickerViewController *)self pickerDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(SiriUIObjectPickerViewController *)self pickerDelegate];
    [v5 pickerViewController:self willDismissPicker:0];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__SiriUIPersonPickerViewController__dismissPicker__block_invoke;
  v7[3] = &unk_26469EFA8;
  v7[4] = self;
  [WeakRetained dismissViewControllerAnimated:1 completion:v7];

  objc_storeWeak((id *)&self->_presentingViewController, 0);
}

void __50__SiriUIPersonPickerViewController__dismissPicker__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) pickerDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) pickerDelegate];
    [v4 pickerViewController:*(void *)(a1 + 32) didDismissPicker:0];
  }
}

- (void)contactPickerDidCancel:(id)a3
{
  [(SiriUIPersonPickerViewController *)self _dismissPicker];
  id v4 = [(SiriUIObjectPickerViewController *)self pickerDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(SiriUIObjectPickerViewController *)self pickerDelegate];
    [v6 pickerViewController:self didRequestKeyboardWithVisibility:1];
  }
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v13 = a3;
  id v6 = [(SiriUIPersonPickerViewController *)self _pickerResponseForPerson:a4];
  if (v6)
  {
    uint64_t v7 = [(SiriUIObjectPickerViewController *)self pickerDelegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      char v9 = [(SiriUIObjectPickerViewController *)self pickerDelegate];
      [v9 pickerViewController:self didSelectObject:v6 fromPicker:v13];
    }
  }
  [(SiriUIPersonPickerViewController *)self _dismissPicker];
  id v10 = [(SiriUIObjectPickerViewController *)self pickerDelegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    uint64_t v12 = [(SiriUIObjectPickerViewController *)self pickerDelegate];
    [v12 pickerViewController:self didRequestKeyboardWithVisibility:1];
  }
}

- (void).cxx_destruct
{
}

@end