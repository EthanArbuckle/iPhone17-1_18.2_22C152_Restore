@interface RPPairingPromptViewController
+ (id)instantiateViewController;
- (RPPINEntryView)pinEntryView;
- (UIActivityIndicatorView)progressSpinner;
- (UIButton)cancelButton;
- (UILabel)progressLabel;
- (UILabel)subTitleLabel;
- (UILabel)titleLabel;
- (id)dismissHandler;
- (id)tryPasswordHandler;
- (void)_retryTimer;
- (void)handleCancelButton:(id)a3;
- (void)handlePINEntered:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setDismissHandler:(id)a3;
- (void)setPinEntryView:(id)a3;
- (void)setProgressLabel:(id)a3;
- (void)setProgressSpinner:(id)a3;
- (void)setSubTitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTryPasswordHandler:(id)a3;
- (void)updateWithFlags:(unsigned int)a3 throttleSeconds:(int)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation RPPairingPromptViewController

+ (id)instantiateViewController
{
  v2 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.RapportUI"];
  v3 = [MEMORY[0x263F1C9E8] storyboardWithName:@"RPPairingPrompt_iOS" bundle:v2];
  v4 = [v3 instantiateViewControllerWithIdentifier:@"PINEntry"];
  id v5 = (id)[v4 view];

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RPPairingPromptViewController;
  [(RPPairingPromptViewController *)&v6 viewWillAppear:a3];
  v4 = [(RPPairingPromptViewController *)self navigationController];
  [(UIButton *)self->_cancelButton setHidden:v4 != 0];

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__RPPairingPromptViewController_viewWillAppear___block_invoke;
  v5[3] = &unk_26504A648;
  v5[4] = self;
  [(RPPINEntryView *)self->_pinEntryView setTextChangedHandler:v5];
  [(RPPINEntryView *)self->_pinEntryView becomeFirstResponder];
}

void __48__RPPairingPromptViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 length];
  v4 = [*(id *)(*(void *)(a1 + 32) + 1032) labels];
  uint64_t v5 = [v4 count];

  if (v3 == v5) {
    [*(id *)(a1 + 32) handlePINEntered:v6];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RPPairingPromptViewController;
  [(RPPairingPromptViewController *)&v10 viewDidDisappear:a3];
  retryTimer = self->_retryTimer;
  if (retryTimer)
  {
    uint64_t v5 = retryTimer;
    dispatch_source_cancel(v5);
    id v6 = self->_retryTimer;
    self->_retryTimer = 0;
  }
  [(RPPINEntryView *)self->_pinEntryView setTextChangedHandler:0];
  id tryPasswordHandler = self->_tryPasswordHandler;
  self->_id tryPasswordHandler = 0;

  v8 = (void (**)(void))MEMORY[0x2455C0200](self->_dismissHandler);
  id dismissHandler = self->_dismissHandler;
  self->_id dismissHandler = 0;

  if (v8) {
    v8[2](v8);
  }
}

- (void)handleCancelButton:(id)a3
{
}

- (void)handlePINEntered:(id)a3
{
  id v7 = a3;
  [(RPPINEntryView *)self->_pinEntryView setDisabled:1];
  [(UIActivityIndicatorView *)self->_progressSpinner startAnimating];
  [(UIActivityIndicatorView *)self->_progressSpinner setHidden:0];
  v4 = RPUILocalizedString(@"AUTHENTICATING");
  [(UILabel *)self->_progressLabel setText:v4];

  [(UILabel *)self->_progressLabel setHidden:0];
  uint64_t v5 = MEMORY[0x2455C0200](self->_tryPasswordHandler);
  id v6 = (void *)v5;
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v7);
  }
}

- (void)updateWithFlags:(unsigned int)a3 throttleSeconds:(int)a4
{
  if ((a3 & 0x10000) != 0)
  {
    id v6 = RPUILocalizedString(@"PAIR_RETRY_PIN");
    [(UILabel *)self->_subTitleLabel setText:v6];

    id v7 = [MEMORY[0x263F1C550] systemRedColor];
    [(UILabel *)self->_subTitleLabel setTextColor:v7];

    [(RPPINEntryView *)self->_pinEntryView setText:&stru_26F2A7210];
  }
  if ((a3 & 0x20000) != 0)
  {
    -[RPPINEntryView setDisabled:](self->_pinEntryView, "setDisabled:", 1, *(void *)&a4);
    [(UIActivityIndicatorView *)self->_progressSpinner startAnimating];
    [(UIActivityIndicatorView *)self->_progressSpinner setHidden:0];
    uint64_t v8 = mach_absolute_time();
    self->_retryDeadlineTicks = SecondsToUpTicks() + v8;
    retryTimer = self->_retryTimer;
    if (retryTimer)
    {
      objc_super v10 = retryTimer;
      dispatch_source_cancel(v10);
      v11 = self->_retryTimer;
      self->_retryTimer = 0;
    }
    v12 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
    v13 = self->_retryTimer;
    self->_retryTimer = v12;

    v14 = self->_retryTimer;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __65__RPPairingPromptViewController_updateWithFlags_throttleSeconds___block_invoke;
    handler[3] = &unk_26504A600;
    handler[4] = self;
    dispatch_source_set_event_handler(v14, handler);
    CUDispatchTimerSet();
    dispatch_resume((dispatch_object_t)self->_retryTimer);
  }
  else
  {
    self->_retryDeadlineTicks = 0;
  }
  [(RPPairingPromptViewController *)self _retryTimer];
}

uint64_t __65__RPPairingPromptViewController_updateWithFlags_throttleSeconds___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _retryTimer];
}

- (void)_retryTimer
{
  uint64_t v3 = mach_absolute_time();
  unint64_t retryDeadlineTicks = self->_retryDeadlineTicks;
  if (retryDeadlineTicks > v3)
  {
    UpTicksToSecondsF();
    LODWORD(v10) = vcvtpd_s64_f64(v9);
    v18 = RPUILocalizedStringF(@"PAIR_RETRY_PROGRESS_FORMAT", v11, v12, v13, v14, v15, v16, v17, v10);
    p_progressLabel = &self->_progressLabel;
    [(UILabel *)*p_progressLabel setText:v18];
  }
  else
  {
    retryTimer = self->_retryTimer;
    if (retryTimer)
    {
      id v6 = retryTimer;
      dispatch_source_cancel(v6);
      id v7 = self->_retryTimer;
      self->_retryTimer = 0;
    }
    [(RPPINEntryView *)self->_pinEntryView setDisabled:0];
    [(RPPINEntryView *)self->_pinEntryView setText:&stru_26F2A7210];
    [(UIActivityIndicatorView *)self->_progressSpinner stopAnimating];
    [(UIActivityIndicatorView *)self->_progressSpinner setHidden:1];
    p_progressLabel = &self->_progressLabel;
  }
  v19 = *p_progressLabel;
  [(UILabel *)v19 setHidden:retryDeadlineTicks <= v3];
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setDismissHandler:(id)a3
{
}

- (id)tryPasswordHandler
{
  return self->_tryPasswordHandler;
}

- (void)setTryPasswordHandler:(id)a3
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

- (RPPINEntryView)pinEntryView
{
  return self->_pinEntryView;
}

- (void)setPinEntryView:(id)a3
{
}

- (UIActivityIndicatorView)progressSpinner
{
  return self->_progressSpinner;
}

- (void)setProgressSpinner:(id)a3
{
}

- (UILabel)progressLabel
{
  return self->_progressLabel;
}

- (void)setProgressLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressLabel, 0);
  objc_storeStrong((id *)&self->_progressSpinner, 0);
  objc_storeStrong((id *)&self->_pinEntryView, 0);
  objc_storeStrong((id *)&self->_subTitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong(&self->_tryPasswordHandler, 0);
  objc_storeStrong(&self->_dismissHandler, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
}

@end