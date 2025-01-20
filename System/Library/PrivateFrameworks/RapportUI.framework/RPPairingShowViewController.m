@interface RPPairingShowViewController
+ (id)instantiateViewController;
- (NSString)password;
- (UIButton)cancelButton;
- (UILabel)subTitleLabel;
- (UILabel)titleLabel;
- (UILabel)verificationCodeLabel;
- (id)dismissHandler;
- (void)_updatePasswordUI;
- (void)handleCancelButton:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setDismissHandler:(id)a3;
- (void)setPassword:(id)a3;
- (void)setSubTitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setVerificationCodeLabel:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation RPPairingShowViewController

+ (id)instantiateViewController
{
  v2 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.RapportUI"];
  v3 = [MEMORY[0x263F1C9E8] storyboardWithName:@"RPPairingShow_iOS" bundle:v2];
  v4 = [v3 instantiateViewControllerWithIdentifier:@"PINShow"];
  id v5 = (id)[v4 view];

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RPPairingShowViewController;
  [(RPPairingShowViewController *)&v5 viewWillAppear:a3];
  v4 = [(RPPairingShowViewController *)self navigationController];
  [(UIButton *)self->_cancelButton setHidden:v4 != 0];

  [(RPPairingShowViewController *)self _updatePasswordUI];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RPPairingShowViewController;
  [(RPPairingShowViewController *)&v6 viewDidDisappear:a3];
  v4 = (void (**)(void))MEMORY[0x2455C0200](self->_dismissHandler);
  id dismissHandler = self->_dismissHandler;
  self->_id dismissHandler = 0;

  if (v4) {
    v4[2](v4);
  }
}

- (void)handleCancelButton:(id)a3
{
}

- (void)_updatePasswordUI
{
  v9 = self->_password;
  if ([(NSString *)v9 length] == 4)
  {
    uint64_t v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"%C %C %C %C", -[NSString characterAtIndex:](v9, "characterAtIndex:", 0), -[NSString characterAtIndex:](v9, "characterAtIndex:", 1), -[NSString characterAtIndex:](v9, "characterAtIndex:", 2), -[NSString characterAtIndex:](v9, "characterAtIndex:", 3), v5, v6, v7, v8);
LABEL_7:
    v4 = (void *)v3;
    [(UILabel *)self->_verificationCodeLabel setText:v3];

    goto LABEL_8;
  }
  if ([(NSString *)v9 length] == 6)
  {
    uint64_t v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"%C %C %C   %C %C %C", -[NSString characterAtIndex:](v9, "characterAtIndex:", 0), -[NSString characterAtIndex:](v9, "characterAtIndex:", 1), -[NSString characterAtIndex:](v9, "characterAtIndex:", 2), -[NSString characterAtIndex:](v9, "characterAtIndex:", 3), -[NSString characterAtIndex:](v9, "characterAtIndex:", 4), -[NSString characterAtIndex:](v9, "characterAtIndex:", 5), v7, v8);
    goto LABEL_7;
  }
  if ([(NSString *)v9 length] == 8)
  {
    uint64_t v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"%C%C%C-%C%C-%C%C%C", -[NSString characterAtIndex:](v9, "characterAtIndex:", 0), -[NSString characterAtIndex:](v9, "characterAtIndex:", 1), -[NSString characterAtIndex:](v9, "characterAtIndex:", 2), -[NSString characterAtIndex:](v9, "characterAtIndex:", 3), -[NSString characterAtIndex:](v9, "characterAtIndex:", 4), -[NSString characterAtIndex:](v9, "characterAtIndex:", 5), -[NSString characterAtIndex:](v9, "characterAtIndex:", 6), -[NSString characterAtIndex:](v9, "characterAtIndex:", 7));
    goto LABEL_7;
  }
  [(UILabel *)self->_verificationCodeLabel setText:v9];
LABEL_8:
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setDismissHandler:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subTitleLabel
{
  return self->_subTitleLabel;
}

- (void)setSubTitleLabel:(id)a3
{
}

- (UILabel)verificationCodeLabel
{
  return self->_verificationCodeLabel;
}

- (void)setVerificationCodeLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verificationCodeLabel, 0);
  objc_storeStrong((id *)&self->_subTitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong(&self->_dismissHandler, 0);
}

@end