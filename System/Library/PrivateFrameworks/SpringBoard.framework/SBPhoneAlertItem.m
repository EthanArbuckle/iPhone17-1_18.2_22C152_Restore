@interface SBPhoneAlertItem
- (SBPhoneAlertItem)initWithTitle:(id)a3 bodyText:(id)a4 slot:(int64_t)a5;
- (int64_t)slot;
- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4;
@end

@implementation SBPhoneAlertItem

- (SBPhoneAlertItem)initWithTitle:(id)a3 bodyText:(id)a4 slot:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBPhoneAlertItem;
  v11 = [(SBAlertItem *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_title, a3);
    objc_storeStrong((id *)&v12->_bodyText, a4);
    v12->_slot = a5;
  }

  return v12;
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  v6 = [(SBAlertItem *)self alertController];
  [v6 setTitle:self->_title];
  [v6 setMessage:self->_bodyText];
  if (!a3)
  {
    v7 = (void *)MEMORY[0x1E4F42720];
    v8 = [MEMORY[0x1E4F28B50] mainBundle];
    id v9 = [v8 localizedStringForKey:@"DISMISS_ALERT" value:&stru_1F3084718 table:@"SpringBoard"];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__SBPhoneAlertItem_configure_requirePasscodeForActions___block_invoke;
    v11[3] = &unk_1E6AF4918;
    v11[4] = self;
    id v10 = [v7 actionWithTitle:v9 style:0 handler:v11];
    [v6 addAction:v10];
  }
}

uint64_t __56__SBPhoneAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deactivateForButton];
}

- (int64_t)slot
{
  return self->_slot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_bodyText, 0);
}

@end