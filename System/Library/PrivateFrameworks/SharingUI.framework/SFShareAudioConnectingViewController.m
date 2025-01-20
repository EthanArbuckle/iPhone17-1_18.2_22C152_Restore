@interface SFShareAudioConnectingViewController
- (SFMediaPlayerView)productMovieView;
- (UIActivityIndicatorView)progressActivity;
- (UIButton)cancelButton;
- (UIImageView)productImageView;
- (UIImageView)shareImageView;
- (UILabel)progressLabel;
- (UIView)progressView;
- (unsigned)colorCode;
- (unsigned)productID;
- (void)_updateDeviceVisual:(id)a3;
- (void)_updateForDeviceInfo;
- (void)eventCancel:(id)a3;
- (void)sessionProgressEvent:(int)a3 info:(id)a4;
- (void)setCancelButton:(id)a3;
- (void)setColorCode:(unsigned int)a3;
- (void)setProductID:(unsigned int)a3;
- (void)setProductImageView:(id)a3;
- (void)setProductMovieView:(id)a3;
- (void)setProgressActivity:(id)a3;
- (void)setProgressLabel:(id)a3;
- (void)setProgressView:(id)a3;
- (void)setShareImageView:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SFShareAudioConnectingViewController

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (gLogCategory_SFShareAudioViewController <= 30
    && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v7.receiver = self;
  v7.super_class = (Class)SFShareAudioConnectingViewController;
  [(SFShareAudioBaseViewController *)&v7 viewWillAppear:v3];
  [(SFShareAudioConnectingViewController *)self _updateForDeviceInfo];
  v5 = [(SFShareAudioViewController *)self->super._mainController mainBundle];
  [(UIView *)self->_progressView startAnimating];
  v6 = SFLocalizedStringEx();
  [(UIActivityIndicatorView *)self->_progressActivity setText:v6];

  [(UILabel *)self->_progressLabel setHidden:1];
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
  v5.super_class = (Class)SFShareAudioConnectingViewController;
  [(SFShareAudioBaseViewController *)&v5 viewWillDisappear:v3];
  [(SFShareAudioViewController *)self->super._mainController setVcConnecting:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFShareAudioConnectingViewController;
  [(SFShareAudioConnectingViewController *)&v4 viewDidDisappear:a3];
  [(UIImageView *)self->_productImageView stop];
}

- (void)eventCancel:(id)a3
{
  id v4 = a3;
  if (gLogCategory_SFShareAudioViewController <= 30
    && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(SFShareAudioViewController *)self->super._mainController reportUserCancelled];
}

- (void)sessionProgressEvent:(int)a3 info:(id)a4
{
  id v6 = a4;
  if (a3 == 300 || a3 == 220 || a3 == 200)
  {
    id v9 = v6;
    [(SFShareAudioConnectingViewController *)self _updateForDeviceInfo];
    objc_super v7 = [(SFShareAudioViewController *)self->super._mainController mainBundle];
    v8 = SFLocalizedStringEx();
    [(UIActivityIndicatorView *)self->_progressActivity setText:v8];

    id v6 = v9;
  }
}

- (void)_updateForDeviceInfo
{
  BOOL v3 = [(SFShareAudioViewController *)self->super._mainController mainBundle];
  if (self->_colorCode) {
    SFLocalizedNameForBluetoothProductID();
  }
  else {
  id v4 = SFLocalizedStringEx();
  }
  [(UILabel *)self->super._titleLabel setText:v4];

  unsigned int colorCode = self->_colorCode;
  if (colorCode)
  {
    if (colorCode != *((_DWORD *)&self->super._viewActive + 1))
    {
      *((_DWORD *)&self->super._viewActive + 1) = colorCode;
      if (gLogCategory_SFShareAudioViewController <= 30
        && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      id v6 = objc_alloc_init(MEMORY[0x263F6C1F8]);
      [v6 setBluetoothProductID:LOWORD(self->_colorCode)];
      [v6 setColorCode:self->_productIDActive];
      [v6 setTimeoutSeconds:5.0];
      id v7 = objc_alloc_init(MEMORY[0x263F6C1F0]);
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __60__SFShareAudioConnectingViewController__updateForDeviceInfo__block_invoke;
      v8[3] = &unk_264472DA0;
      v8[4] = v7;
      v8[5] = self;
      [v7 getDeviceAssets:v6 completion:v8];
    }
  }
  else
  {
    [(SFShareAudioConnectingViewController *)self _updateDeviceVisual:0];
  }
}

void __60__SFShareAudioConnectingViewController__updateForDeviceInfo__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  [*(id *)(a1 + 32) invalidate];
  BOOL v3 = *(unsigned char **)(a1 + 40);
  if (v3[1000])
  {
    id v4 = [v5 assetBundlePath];
    [v3 _updateDeviceVisual:v4];
  }
}

- (void)_updateDeviceVisual:(id)a3
{
  id v4 = a3;
  id v12 = v4;
  if (v4)
  {
    id v5 = [MEMORY[0x263F086E0] bundleWithPath:v4];
  }
  else
  {
    id v5 = 0;
  }
  id v6 = [v5 pathForResource:*MEMORY[0x263F6C330] ofType:0];
  if (v6
    || ([v5 pathForResource:*MEMORY[0x263F6C340] ofType:0],
        (id v6 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([v5 pathForResource:*MEMORY[0x263F6C348] ofType:0],
        (id v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v7 = [v5 URLForResource:*MEMORY[0x263F6C318] withExtension:0];
    if (gLogCategory_SFShareAudioViewController <= 30
      && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
    {
      v11 = v6;
      LogPrintF();
    }
    -[UIImageView startMovieLoopWithPath:assetType:adjustmentsURL:](self->_productImageView, "startMovieLoopWithPath:assetType:adjustmentsURL:", v6, 1, v7, v11);
    [(UIImageView *)self->_productImageView setHidden:0];
    [*(id *)&self->_productID setHidden:1];
    [(SFMediaPlayerView *)self->_productMovieView setHidden:1];
  }
  else
  {
    if (gLogCategory_SFShareAudioViewController <= 30
      && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v8 = (void *)MEMORY[0x263F827E8];
    id v9 = [(SFShareAudioViewController *)self->super._mainController mainBundle];
    v10 = [v8 imageNamed:@"ShareAudioAirPods" inBundle:v9 compatibleWithTraitCollection:0];
    [(SFMediaPlayerView *)self->_productMovieView setImage:v10];

    [(SFMediaPlayerView *)self->_productMovieView setHidden:0];
    [*(id *)&self->_productID setHidden:1];
    [(UIImageView *)self->_productImageView setHidden:1];
  }
}

- (UIImageView)productImageView
{
  return *(UIImageView **)&self->_productID;
}

- (void)setProductImageView:(id)a3
{
}

- (SFMediaPlayerView)productMovieView
{
  return (SFMediaPlayerView *)self->_productImageView;
}

- (void)setProductMovieView:(id)a3
{
}

- (UIImageView)shareImageView
{
  return (UIImageView *)self->_productMovieView;
}

- (void)setShareImageView:(id)a3
{
}

- (UIView)progressView
{
  return &self->_shareImageView->super;
}

- (void)setProgressView:(id)a3
{
}

- (UIActivityIndicatorView)progressActivity
{
  return (UIActivityIndicatorView *)self->_progressView;
}

- (void)setProgressActivity:(id)a3
{
}

- (UILabel)progressLabel
{
  return (UILabel *)self->_progressActivity;
}

- (void)setProgressLabel:(id)a3
{
}

- (UIButton)cancelButton
{
  return (UIButton *)self->_progressLabel;
}

- (void)setCancelButton:(id)a3
{
}

- (unsigned)colorCode
{
  return self->_productIDActive;
}

- (void)setColorCode:(unsigned int)a3
{
  self->_productIDActive = a3;
}

- (unsigned)productID
{
  return self->_colorCode;
}

- (void)setProductID:(unsigned int)a3
{
  self->_unsigned int colorCode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressLabel, 0);
  objc_storeStrong((id *)&self->_progressActivity, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_shareImageView, 0);
  objc_storeStrong((id *)&self->_productMovieView, 0);
  objc_storeStrong((id *)&self->_productImageView, 0);
  objc_storeStrong((id *)&self->_productID, 0);
}

@end