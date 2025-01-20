@interface SFShareAudioConfirmViewController
- (SFMediaPlayerView)productMovieView;
- (UIButton)cancelButton;
- (UIButton)confirmButton;
- (UIImageView)productImageView;
- (UIImageView)shareImageView;
- (unsigned)colorCode;
- (unsigned)productID;
- (void)_updateDeviceVisual:(id)a3;
- (void)eventCancel:(id)a3;
- (void)eventConfirm:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setColorCode:(unsigned int)a3;
- (void)setConfirmButton:(id)a3;
- (void)setProductID:(unsigned int)a3;
- (void)setProductImageView:(id)a3;
- (void)setProductMovieView:(id)a3;
- (void)setShareImageView:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SFShareAudioConfirmViewController

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (gLogCategory_SFShareAudioViewController <= 30
    && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v16.receiver = self;
  v16.super_class = (Class)SFShareAudioConfirmViewController;
  [(SFShareAudioBaseViewController *)&v16 viewWillAppear:v3];
  if (self->_productID)
  {
    v5 = SFLocalizedNameForBluetoothProductID();
    [(UILabel *)self->super._titleLabel setText:v5];
  }
  else
  {
    v5 = [(SFShareAudioViewController *)self->super._mainController mainBundle];
    v6 = SFLocalizedStringEx();
    [(UILabel *)self->super._titleLabel setText:v6];
  }
  if (!self->_confirmButtonMaterialView)
  {
    v7 = [(objc_class *)getMTMaterialViewClass() materialViewWithRecipe:4 configuration:4];
    confirmButtonMaterialView = self->_confirmButtonMaterialView;
    self->_confirmButtonMaterialView = v7;

    [(UIButton *)self->_confirmButton bounds];
    -[MTMaterialView setFrame:](self->_confirmButtonMaterialView, "setFrame:");
    [(MTMaterialView *)self->_confirmButtonMaterialView setAutoresizingMask:18];
    v9 = [(UIButton *)self->_confirmButton layer];
    [v9 cornerRadius];
    double v11 = v10;
    v12 = [(MTMaterialView *)self->_confirmButtonMaterialView layer];
    [v12 setCornerRadius:v11];

    [(UIButton *)self->_confirmButton addSubview:self->_confirmButtonMaterialView];
  }
  if (self->_productID)
  {
    if (gLogCategory_SFShareAudioViewController <= 30
      && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v13 = objc_alloc_init(MEMORY[0x263F6C1F8]);
    [v13 setBluetoothProductID:LOWORD(self->_productID)];
    [v13 setColorCode:self->_colorCode];
    [v13 setTimeoutSeconds:5.0];
    id v14 = objc_alloc_init(MEMORY[0x263F6C1F0]);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __52__SFShareAudioConfirmViewController_viewWillAppear___block_invoke;
    v15[3] = &unk_264472DA0;
    v15[4] = v14;
    v15[5] = self;
    [v14 getDeviceAssets:v13 completion:v15];
  }
  else
  {
    [(SFShareAudioConfirmViewController *)self _updateDeviceVisual:0];
  }
}

void __52__SFShareAudioConfirmViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  [*(id *)(a1 + 32) invalidate];
  BOOL v3 = *(unsigned char **)(a1 + 40);
  if (v3[1000])
  {
    v4 = [v5 assetBundlePath];
    [v3 _updateDeviceVisual:v4];
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
  v5.super_class = (Class)SFShareAudioConfirmViewController;
  [(SFShareAudioBaseViewController *)&v5 viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFShareAudioConfirmViewController;
  [(SFShareAudioConfirmViewController *)&v4 viewDidDisappear:a3];
  [(SFMediaPlayerView *)self->_productMovieView stop];
}

- (void)eventConfirm:(id)a3
{
  id v5 = a3;
  if (gLogCategory_SFShareAudioViewController <= 30
    && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_super v4 = [(SFShareAudioViewController *)self->super._mainController shareAudioSession];
  [v4 userConfirmed];
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
  v6 = [v5 pathForResource:*MEMORY[0x263F6C330] ofType:0];
  if (v6
    || ([v5 pathForResource:*MEMORY[0x263F6C340] ofType:0],
        (v6 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([v5 pathForResource:*MEMORY[0x263F6C348] ofType:0],
        (v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = [v5 URLForResource:*MEMORY[0x263F6C318] withExtension:0];
    if (gLogCategory_SFShareAudioViewController <= 30
      && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
    {
      double v11 = v6;
      LogPrintF();
    }
    -[SFMediaPlayerView startMovieLoopWithPath:assetType:adjustmentsURL:](self->_productMovieView, "startMovieLoopWithPath:assetType:adjustmentsURL:", v6, 1, v7, v11);
    [(SFMediaPlayerView *)self->_productMovieView setHidden:0];
  }
  else
  {
    if (gLogCategory_SFShareAudioViewController <= 30
      && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v8 = (void *)MEMORY[0x263F827E8];
    v9 = [(SFShareAudioViewController *)self->super._mainController mainBundle];
    double v10 = [v8 imageNamed:@"ShareAudioAirPods" inBundle:v9 compatibleWithTraitCollection:0];
    [(UIImageView *)self->_shareImageView setImage:v10];

    [(UIImageView *)self->_shareImageView setHidden:0];
  }
}

- (UIImageView)productImageView
{
  return self->_productImageView;
}

- (void)setProductImageView:(id)a3
{
}

- (SFMediaPlayerView)productMovieView
{
  return self->_productMovieView;
}

- (void)setProductMovieView:(id)a3
{
}

- (UIButton)confirmButton
{
  return self->_confirmButton;
}

- (void)setConfirmButton:(id)a3
{
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (UIImageView)shareImageView
{
  return self->_shareImageView;
}

- (void)setShareImageView:(id)a3
{
}

- (unsigned)colorCode
{
  return self->_colorCode;
}

- (void)setColorCode:(unsigned int)a3
{
  self->_colorCode = a3;
}

- (unsigned)productID
{
  return self->_productID;
}

- (void)setProductID:(unsigned int)a3
{
  self->_productID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareImageView, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_confirmButton, 0);
  objc_storeStrong((id *)&self->_productMovieView, 0);
  objc_storeStrong((id *)&self->_productImageView, 0);
  objc_storeStrong((id *)&self->_confirmButtonMaterialView, 0);
}

@end