@interface SUCellularFeeAlertItem
- (BOOL)allowInSetup;
- (BOOL)allowLockScreenDismissal;
- (BOOL)allowMenuButtonDismissal;
- (BOOL)allowNoButton;
- (BOOL)forcesModalAlertAppearance;
- (BOOL)reappearsAfterUnlock;
- (BOOL)shouldShowInLockScreen;
- (BOOL)showButtonsOnLockScreen;
- (BOOL)undimsScreen;
- (SUCellularFeeAlertItem)initWithHandler:(id)a3 updateName:(id)a4 dueDate:(id)a5;
- (id)_noButton;
- (id)_yesButton;
- (id)allowedApps;
- (id)buttons;
- (id)message;
- (id)title;
- (void)alertWasDismissed:(unint64_t)a3;
@end

@implementation SUCellularFeeAlertItem

- (SUCellularFeeAlertItem)initWithHandler:(id)a3 updateName:(id)a4 dueDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SUCellularFeeAlertItem;
  v11 = [(SUBaseAlertItem *)&v15 init];
  if (v11)
  {
    uint64_t v12 = MEMORY[0x223C18480](v8);
    id handler = v11->_handler;
    v11->_id handler = (id)v12;

    objc_storeStrong((id *)&v11->_updateName, a4);
    objc_storeStrong((id *)&v11->_dueDate, a5);
  }

  return v11;
}

- (void)alertWasDismissed:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUCellularFeeAlertItem;
  -[SUBaseAlertItem alertWasDismissed:](&v6, sel_alertWasDismissed_);
  if (a3 != 1)
  {
    id handler = (void (**)(id, void))self->_handler;
    if (handler) {
      handler[2](handler, 0);
    }
  }
}

- (id)title
{
  v2 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"];
  v3 = [v2 localizedStringForKey:@"MANAGED_UPDATE" value:&stru_26CE93248 table:@"SoftwareUpdateServices"];

  return v3;
}

- (id)message
{
  id v3 = objc_alloc_init(MEMORY[0x263F08790]);
  [v3 setDateStyle:1];
  [v3 setTimeStyle:1];
  v4 = [v3 stringFromDate:self->_dueDate];
  v5 = NSString;
  objc_super v6 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"];
  v7 = [v6 localizedStringForKey:@"CELLULAR_DOWNLOAD_ACCEPT_DEFINITE_FEES_FOR_MANAGED_UPDATE" value:&stru_26CE93248 table:@"SoftwareUpdateServices"];
  id v8 = objc_msgSend(v5, "stringWithFormat:", v7, self->_updateName, v4);

  return v8;
}

- (id)buttons
{
  id v3 = [MEMORY[0x263EFF980] array];
  v4 = [(SUCellularFeeAlertItem *)self _yesButton];
  [v3 addObject:v4];

  v5 = [(SUCellularFeeAlertItem *)self _noButton];
  [v3 addObject:v5];

  objc_super v6 = (void *)[v3 copy];
  return v6;
}

- (id)_yesButton
{
  id v3 = [SUAlertButtonDefinition alloc];
  v4 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"];
  v5 = [v4 localizedStringForKey:@"CONTINUE" value:&stru_26CE93248 table:@"SoftwareUpdateServices"];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __36__SUCellularFeeAlertItem__yesButton__block_invoke;
  v8[3] = &unk_26447C878;
  v8[4] = self;
  objc_super v6 = [(SUAlertButtonDefinition *)v3 initWithLabel:v5 presentationStyle:0 isPreferredButton:1 handler:v8];

  return v6;
}

uint64_t __36__SUCellularFeeAlertItem__yesButton__block_invoke(uint64_t a1)
{
  v2 = SULogAlerts();
  uint64_t v3 = objc_opt_class();
  SULogInfoForSubsystem(v2, @"[%@] User accepted to use cellular.", v4, v5, v6, v7, v8, v9, v3);

  uint64_t result = *(void *)(*(void *)(a1 + 32) + 40);
  if (result)
  {
    v11 = *(uint64_t (**)(void))(result + 16);
    return v11();
  }
  return result;
}

- (id)_noButton
{
  uint64_t v3 = [SUAlertButtonDefinition alloc];
  uint64_t v4 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"];
  uint64_t v5 = [v4 localizedStringForKey:@"CANCEL_BUTTON" value:&stru_26CE93248 table:@"SoftwareUpdateServices"];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __35__SUCellularFeeAlertItem__noButton__block_invoke;
  v8[3] = &unk_26447C878;
  v8[4] = self;
  uint64_t v6 = [(SUAlertButtonDefinition *)v3 initWithLabel:v5 presentationStyle:2 isPreferredButton:0 handler:v8];

  return v6;
}

uint64_t __35__SUCellularFeeAlertItem__noButton__block_invoke(uint64_t a1)
{
  v2 = SULogAlerts();
  uint64_t v3 = objc_opt_class();
  SULogInfoForSubsystem(v2, @"[%@] User declined to use cellular.", v4, v5, v6, v7, v8, v9, v3);

  uint64_t result = *(void *)(*(void *)(a1 + 32) + 40);
  if (result)
  {
    v11 = *(uint64_t (**)(void))(result + 16);
    return v11();
  }
  return result;
}

- (BOOL)reappearsAfterUnlock
{
  return 1;
}

- (BOOL)shouldShowInLockScreen
{
  return 1;
}

- (BOOL)showButtonsOnLockScreen
{
  return 0;
}

- (BOOL)forcesModalAlertAppearance
{
  return 0;
}

- (BOOL)allowInSetup
{
  return 1;
}

- (BOOL)undimsScreen
{
  return 1;
}

- (BOOL)allowNoButton
{
  return 0;
}

- (BOOL)allowLockScreenDismissal
{
  return 0;
}

- (BOOL)allowMenuButtonDismissal
{
  return 0;
}

- (id)allowedApps
{
  return &unk_26CEBD230;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dueDate, 0);
  objc_storeStrong((id *)&self->_updateName, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end