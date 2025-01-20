@interface SBDataPlanCompletionAlertItem
- (BOOL)isNewAccount;
- (NSString)carrierName;
- (SBDataPlanCompletionAlertItem)initWithCarrierName:(id)a3 newAccount:(BOOL)a4;
- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4;
- (void)setCarrierName:(id)a3;
- (void)setNewAccount:(BOOL)a3;
@end

@implementation SBDataPlanCompletionAlertItem

- (SBDataPlanCompletionAlertItem)initWithCarrierName:(id)a3 newAccount:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBDataPlanCompletionAlertItem;
  v7 = [(SBAlertItem *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(SBDataPlanCompletionAlertItem *)v7 setCarrierName:v6];
    [(SBDataPlanCompletionAlertItem *)v8 setNewAccount:v4];
  }

  return v8;
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  v5 = [(SBAlertItem *)self alertController];
  id v6 = [MEMORY[0x1E4F28B50] mainBundle];
  BOOL v7 = [(SBDataPlanCompletionAlertItem *)self isNewAccount];
  v8 = @"UPDATED";
  if (v7) {
    v8 = @"ACTIVATED";
  }
  v9 = v8;
  objc_super v10 = [(SBDataPlanCompletionAlertItem *)self carrierName];
  v11 = @"CARRIER";
  if (!v10) {
    v11 = @"FALLBACK";
  }
  v12 = v11;

  v13 = [NSString stringWithFormat:@"DATA_PLAN_%@_TITLE", v9];
  v14 = [NSString stringWithFormat:@"DATA_PLAN_%@_%@_BODY", v9, v12];

  v15 = [v6 localizedStringForKey:v13 value:&stru_1F3084718 table:@"SpringBoard"];
  v16 = [v6 localizedStringForKey:v14 value:&stru_1F3084718 table:@"SpringBoard"];
  v17 = [(SBDataPlanCompletionAlertItem *)self carrierName];
  if (v17)
  {
    v18 = NSString;
    v19 = [(SBDataPlanCompletionAlertItem *)self carrierName];
    objc_msgSend(v18, "stringWithFormat:", v16, v19);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v20 = v16;
  }

  [v5 setTitle:v15];
  [v5 setMessage:v20];
  v21 = (void *)MEMORY[0x1E4F42720];
  v22 = [v6 localizedStringForKey:@"OK" value:&stru_1F3084718 table:@"SpringBoard"];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __69__SBDataPlanCompletionAlertItem_configure_requirePasscodeForActions___block_invoke;
  v24[3] = &unk_1E6AF4918;
  v24[4] = self;
  v23 = [v21 actionWithTitle:v22 style:0 handler:v24];
  [v5 addAction:v23];
}

uint64_t __69__SBDataPlanCompletionAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deactivateForButton];
}

- (NSString)carrierName
{
  return self->_carrierName;
}

- (void)setCarrierName:(id)a3
{
}

- (BOOL)isNewAccount
{
  return self->_newAccount;
}

- (void)setNewAccount:(BOOL)a3
{
  self->_newAccount = a3;
}

- (void).cxx_destruct
{
}

@end