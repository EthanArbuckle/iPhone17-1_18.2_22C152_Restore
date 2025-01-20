@interface _SBAlertController
- (BOOL)_canShowWhileLocked;
- (SBAlertItem)alertItem;
- (_SBAlertController)initWithStyleProvider:(id)a3;
- (_SBAlertControllerDelegate)alertControllerDelegate;
- (id)_styleProvider;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)setAlertControllerDelegate:(id)a3;
- (void)setAlertItem:(id)a3;
- (void)setHiddenOnClonedDisplay:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation _SBAlertController

- (_SBAlertController)initWithStyleProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SBAlertController;
  v6 = [(_SBAlertController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_styleProvider, a3);
  }

  return v7;
}

- (void)setHiddenOnClonedDisplay:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(_SBAlertController *)self view];
  v6 = [v5 layer];
  int v7 = [v6 disableUpdateMask];

  if (v3) {
    int v8 = 16;
  }
  else {
    int v8 = 0;
  }
  uint64_t v9 = v7 & 0xFFFFFFEF | v8;
  id v11 = [(_SBAlertController *)self view];
  v10 = [v11 layer];
  [v10 setDisableUpdateMask:v9];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_SBAlertController;
  [(_SBAlertController *)&v9 viewDidDisappear:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertControllerDelegate);
  id v5 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained alertControllerDidDisappear:self];
  }
  v6 = [(_SBAlertController *)self view];
  int v7 = [v6 window];

  if (!v7)
  {
    int v8 = [MEMORY[0x263F1C408] sharedApplication];
    [v8 didDismissMiniAlert];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)_styleProvider
{
  return self->_styleProvider;
}

- (id)succinctDescription
{
  v2 = [(_SBAlertController *)self succinctDescriptionBuilder];
  BOOL v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  BOOL v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  v4 = [(_SBAlertController *)self title];
  [v3 appendString:v4 withName:@"title"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(_SBAlertController *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (SBAlertItem)alertItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertItem);

  return (SBAlertItem *)WeakRetained;
}

- (void)setAlertItem:(id)a3
{
}

- (_SBAlertControllerDelegate)alertControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertControllerDelegate);

  return (_SBAlertControllerDelegate *)WeakRetained;
}

- (void)setAlertControllerDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_destroyWeak((id *)&self->_alertControllerDelegate);

  objc_destroyWeak((id *)&self->_alertItem);
}

@end