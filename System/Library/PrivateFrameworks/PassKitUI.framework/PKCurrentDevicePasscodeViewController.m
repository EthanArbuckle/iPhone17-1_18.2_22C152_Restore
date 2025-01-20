@interface PKCurrentDevicePasscodeViewController
- (BOOL)requiresKeyboard;
- (PKCurrentDevicePasscodeViewController)initWithPasscodeUpgradeFlowController:(id)a3;
- (id)pinInstructionsPrompt;
- (id)stringsBundle;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PKCurrentDevicePasscodeViewController

- (PKCurrentDevicePasscodeViewController)initWithPasscodeUpgradeFlowController:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKCurrentDevicePasscodeViewController;
  v5 = [(DevicePINController *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_flowController, v4);
    v7 = (objc_class *)objc_alloc_init(MEMORY[0x1E4F92E70]);
    uint64_t v8 = (int)*MEMORY[0x1E4F92FA0];
    v9 = *(Class *)((char *)&v6->super.super.super.super.super.super.isa + v8);
    *(Class *)((char *)&v6->super.super.super.super.super.super.isa + v8) = v7;

    [*(id *)((char *)&v6->super.super.super.super.super.super.isa + v8) setEditPaneClass:objc_opt_class()];
    [*(id *)((char *)&v6->super.super.super.super.super.super.isa + v8) setProperty:&unk_1EF2B92B8 forKey:*MEMORY[0x1E4F93260]];
    [(DevicePINController *)v6 setShouldDismissWhenDone:0];
    [(DevicePINController *)v6 setHidesCancelButton:1];
  }

  return v6;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKCurrentDevicePasscodeViewController;
  [(DevicePINController *)&v5 viewWillAppear:a3];
  [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92EF8]) resignFirstResponder];
  if (!self->_viewHasAppeared)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_flowController);
    [WeakRetained beginShowingViewController];

    self->_viewHasAppeared = 1;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKCurrentDevicePasscodeViewController;
  [(DevicePINController *)&v4 viewDidAppear:a3];
  [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92EF8]) becomeFirstResponder];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKCurrentDevicePasscodeViewController;
  [(DevicePINController *)&v5 viewDidDisappear:a3];
  if (self->_viewHasAppeared)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_flowController);
    [WeakRetained endedShowingViewController];

    self->_viewHasAppeared = 0;
  }
}

- (id)stringsBundle
{
  v2 = (void *)MEMORY[0x1E4F28B50];
  uint64_t v3 = objc_opt_class();

  return (id)[v2 bundleForClass:v3];
}

- (id)pinInstructionsPrompt
{
  return (id)PKLocalizedPaymentString(&cfstr_PasscodeUpgrad_10.isa);
}

- (BOOL)requiresKeyboard
{
  return 1;
}

- (void).cxx_destruct
{
}

@end