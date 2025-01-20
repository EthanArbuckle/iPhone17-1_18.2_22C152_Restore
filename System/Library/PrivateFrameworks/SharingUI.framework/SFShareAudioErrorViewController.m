@interface SFShareAudioErrorViewController
- (NSError)error;
- (UIButton)dismissButton;
- (UILabel)infoLabel;
- (UILabel)internalLabel;
- (void)eventDismiss:(id)a3;
- (void)setDismissButton:(id)a3;
- (void)setError:(id)a3;
- (void)setInfoLabel:(id)a3;
- (void)setInternalLabel:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SFShareAudioErrorViewController

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (gLogCategory_SFShareAudioViewController <= 30
    && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v10.receiver = self;
  v10.super_class = (Class)SFShareAudioErrorViewController;
  [(SFShareAudioBaseViewController *)&v10 viewWillAppear:v3];
  v5 = [(SFShareAudioViewController *)self->super._mainController mainBundle];
  v6 = SFLocalizedStringEx();
  [(UILabel *)self->super._titleLabel setText:v6];

  v7 = SFLocalizedStringEx();
  [(UILabel *)self->_infoLabel setText:v7];

  if (IsAppleInternalBuild())
  {
    error = self->_error;
    v8 = NSPrintF();
    -[UILabel setText:](self->_internalLabel, "setText:", v8, error);

    [(UILabel *)self->_internalLabel setHidden:0];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (gLogCategory_SFShareAudioViewController <= 30
    && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v5.receiver = self;
  v5.super_class = (Class)SFShareAudioErrorViewController;
  [(SFShareAudioBaseViewController *)&v5 viewWillDisappear:v3];
}

- (void)eventDismiss:(id)a3
{
  id v4 = a3;
  if (gLogCategory_SFShareAudioViewController <= 30
    && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(SFShareAudioViewController *)self->super._mainController reportError:self->_error];
}

- (UILabel)infoLabel
{
  return self->_infoLabel;
}

- (void)setInfoLabel:(id)a3
{
}

- (UILabel)internalLabel
{
  return self->_internalLabel;
}

- (void)setInternalLabel:(id)a3
{
}

- (UIButton)dismissButton
{
  return self->_dismissButton;
}

- (void)setDismissButton:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_internalLabel, 0);
  objc_storeStrong((id *)&self->_infoLabel, 0);
}

@end