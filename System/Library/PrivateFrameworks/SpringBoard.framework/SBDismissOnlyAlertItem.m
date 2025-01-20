@interface SBDismissOnlyAlertItem
- (BOOL)suppressForKeynote;
- (SBDismissOnlyAlertItem)initWithTitle:(id)a3 body:(id)a4;
- (id)bodyText;
- (id)dismissButtonText;
- (id)title;
- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4;
- (void)setBodyText:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SBDismissOnlyAlertItem

- (SBDismissOnlyAlertItem)initWithTitle:(id)a3 body:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBDismissOnlyAlertItem;
  v8 = [(SBAlertItem *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    title = v8->_title;
    v8->_title = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    body = v8->_body;
    v8->_body = (NSString *)v11;
  }
  return v8;
}

- (void)setTitle:(id)a3
{
  id v6 = (NSString *)a3;
  if (self->_title != v6)
  {
    objc_storeStrong((id *)&self->_title, a3);
    v5 = [(SBAlertItem *)self alertController];
    [v5 setTitle:v6];
  }
}

- (void)setBodyText:(id)a3
{
  id v6 = (NSString *)a3;
  if (self->_body != v6)
  {
    objc_storeStrong((id *)&self->_body, a3);
    v5 = [(SBAlertItem *)self alertController];
    [v5 setMessage:v6];
  }
}

- (id)title
{
  return self->_title;
}

- (id)bodyText
{
  return self->_body;
}

- (id)dismissButtonText
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 localizedStringForKey:@"DISMISS_ALERT" value:&stru_1F3084718 table:@"SpringBoard"];

  return v3;
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  v5 = [(SBAlertItem *)self alertController];
  [v5 setTitle:self->_title];
  [v5 setMessage:self->_body];
  id v6 = (void *)MEMORY[0x1E4F42720];
  id v7 = [(SBDismissOnlyAlertItem *)self dismissButtonText];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__SBDismissOnlyAlertItem_configure_requirePasscodeForActions___block_invoke;
  v9[3] = &unk_1E6AF4918;
  v9[4] = self;
  v8 = [v6 actionWithTitle:v7 style:0 handler:v9];
  [v5 addAction:v8];
}

uint64_t __62__SBDismissOnlyAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deactivateForButton];
}

- (BOOL)suppressForKeynote
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end