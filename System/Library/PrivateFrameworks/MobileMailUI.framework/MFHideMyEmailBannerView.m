@interface MFHideMyEmailBannerView
+ (id)_accountImageFuture;
- (BOOL)_fetchAccountImageWithHandler:(id)a3;
- (MFHideMyEmailBannerView)initWithFrame:(CGRect)a3;
- (MFHideMyEmailBannerViewDelegate)delegate;
- (void)dismissAction;
- (void)primaryAction;
- (void)setDelegate:(id)a3;
@end

@implementation MFHideMyEmailBannerView

- (MFHideMyEmailBannerView)initWithFrame:(CGRect)a3
{
  v30[1] = *MEMORY[0x1E4F143B8];
  v29.receiver = self;
  v29.super_class = (Class)MFHideMyEmailBannerView;
  v3 = -[MFSuggestionBannerView initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F5DFE8]);
    v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v6 = [v5 localizedStringForKey:@"HIDE_MY_EMAIL_TITLE" value:&stru_1F39E2A88 table:@"Main"];
    [v4 setTitle:v6];

    v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v8 = [v7 localizedStringForKey:@"HME_BANNER_DESCRIPTION" value:&stru_1F39E2A88 table:@"Main"];
    [v4 setSubtitle:v8];

    [v4 setAccessoryType:1];
    v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v10 = [v9 localizedStringForKey:@"SETTINGS" value:&stru_1F39E2A88 table:@"Main"];
    [v4 setActionTitle:v10];

    [v4 setActionButtonType:0];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __41__MFHideMyEmailBannerView_initWithFrame___block_invoke;
    v27[3] = &unk_1E6D1AFF8;
    id v11 = v4;
    id v28 = v11;
    if (![(MFHideMyEmailBannerView *)v3 _fetchAccountImageWithHandler:v27])
    {
      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, 0.0, 28.0, 28.0);
      v30[0] = v12;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
      [v11 setImageSGViews:v13];
    }
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v3);
    v14 = (void *)MEMORY[0x1E4F5DFF8];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __41__MFHideMyEmailBannerView_initWithFrame___block_invoke_2;
    v24[3] = &unk_1E6D1AEA8;
    objc_copyWeak(&v25, &location);
    v15 = [v14 actionWithTitle:&stru_1F39E2A88 handler:v24];
    [v11 setPrimaryAction:v15];

    v16 = (void *)MEMORY[0x1E4F5DFF8];
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    v21 = __41__MFHideMyEmailBannerView_initWithFrame___block_invoke_3;
    v22 = &unk_1E6D1AEA8;
    objc_copyWeak(&v23, &location);
    v17 = [v16 actionWithTitle:&stru_1F39E2A88 handler:&v19];
    objc_msgSend(v11, "setDismissAction:", v17, v19, v20, v21, v22);

    [(MFSuggestionBannerView *)v3 setBanner:v11];
    [v11 reload];
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __41__MFHideMyEmailBannerView_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    [*(id *)(a1 + 32) setImageSGViews:0];
    v5[0] = v3;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
    [*(id *)(a1 + 32) setImages:v4];

    [*(id *)(a1 + 32) reload];
  }
}

void __41__MFHideMyEmailBannerView_initWithFrame___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained primaryAction];
}

void __41__MFHideMyEmailBannerView_initWithFrame___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissAction];
}

+ (id)_accountImageFuture
{
  if (_accountImageFuture_onceToken != -1) {
    dispatch_once(&_accountImageFuture_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)_accountImageFuture_imageFuture;
  return v2;
}

void __46__MFHideMyEmailBannerView__accountImageFuture__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F60D70];
  id v3 = [MEMORY[0x1E4F60F28] globalAsyncSchedulerWithQualityOfService:25];
  uint64_t v1 = objc_msgSend(v0, "onScheduler:futureWithBlock:");
  v2 = (void *)_accountImageFuture_imageFuture;
  _accountImageFuture_imageFuture = v1;
}

uint64_t __46__MFHideMyEmailBannerView__accountImageFuture__block_invoke_2()
{
  return objc_msgSend(MEMORY[0x1E4F92E70], "acui_specifierIconForAccountTypeIdentifier:", *MEMORY[0x1E4F17750]);
}

- (BOOL)_fetchAccountImageWithHandler:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() _accountImageFuture];
  v5 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  [v4 onScheduler:v5 addSuccessBlock:v3];

  v6 = [v4 resultIfAvailable];
  LOBYTE(v5) = v6 != 0;

  return (char)v5;
}

- (void)primaryAction
{
  id v3 = [(MFHideMyEmailBannerView *)self delegate];
  [v3 didTapHideMyEmailBannerView:self];
}

- (void)dismissAction
{
  id v3 = [(MFHideMyEmailBannerView *)self delegate];
  [v3 didDismissHideMyEmailBannerView:self];
}

- (MFHideMyEmailBannerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MFHideMyEmailBannerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end