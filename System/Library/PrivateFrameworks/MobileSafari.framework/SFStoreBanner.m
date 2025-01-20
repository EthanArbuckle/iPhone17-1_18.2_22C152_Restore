@interface SFStoreBanner
+ (BOOL)omitsBottomSeparator;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SFAppSuggestionBannerDelegate)delegate;
- (SFStoreBanner)initWithProductID:(id)a3 mainDocumentURL:(id)a4 affiliateData:(id)a5 applicationLaunchArgument:(id)a6;
- (id)presentingViewControllerForLockupView:(id)a3;
- (void)_openApp;
- (void)_removeAppStoreLockUpView;
- (void)_setBlockedByUser;
- (void)_setUpAppStoreLockUpView;
- (void)_setUpStoreKitProductView;
- (void)dealloc;
- (void)layoutSubviews;
- (void)lockupView:(id)a3 appStateDidChange:(id)a4;
- (void)lockupView:(id)a3 didFailRequestWithError:(id)a4;
- (void)productPage:(id)a3 didFailLoadWithError:(id)a4;
- (void)productPage:(id)a3 didFinishPurchase:(id)a4 withError:(id)a5;
- (void)productPage:(id)a3 didFinishWithResult:(int64_t)a4;
- (void)productPage:(id)a3 willMakePurchases:(id)a4;
- (void)setDelegate:(id)a3;
- (void)themeDidChange;
@end

@implementation SFStoreBanner

+ (BOOL)omitsBottomSeparator
{
  return 1;
}

- (SFStoreBanner)initWithProductID:(id)a3 mainDocumentURL:(id)a4 affiliateData:(id)a5 applicationLaunchArgument:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [(SFStoreBanner *)self init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_productID, a3);
    objc_storeStrong((id *)&v16->_affiliateData, a5);
    objc_storeStrong((id *)&v16->_mainDocumentURL, a4);
    objc_storeStrong((id *)&v16->_argument, a6);
    [(SFStoreBanner *)v16 setClipsToBounds:1];
    [(SFStoreBanner *)v16 _setUpAppStoreLockUpView];
    v17 = v16;
  }

  return v16;
}

- (void)_setUpStoreKitProductView
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2050000000;
  v3 = (void *)getSKProductPageViewControllerClass_softClass;
  uint64_t v14 = getSKProductPageViewControllerClass_softClass;
  if (!getSKProductPageViewControllerClass_softClass)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __getSKProductPageViewControllerClass_block_invoke;
    v10[3] = &unk_1E54EA8A0;
    v10[4] = &v11;
    __getSKProductPageViewControllerClass_block_invoke((uint64_t)v10);
    v3 = (void *)v12[3];
  }
  v4 = v3;
  _Block_object_dispose(&v11, 8);
  v5 = (SKProductPageViewController *)[[v4 alloc] initWithProductPageStyle:1];
  productViewController = self->_productViewController;
  self->_productViewController = v5;

  if (self->_mainDocumentURL && (objc_opt_respondsToSelector() & 1) != 0) {
    [(SKProductPageViewController *)self->_productViewController setMainDocumentURL:self->_mainDocumentURL];
  }
  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  [v7 setObject:self->_argument forKeyedSubscript:@"applicationLaunchArgument"];
  [v7 setObject:self->_affiliateData forKeyedSubscript:@"affiliateData"];
  if ([v7 count]) {
    [(SKProductPageViewController *)self->_productViewController setScriptContextDictionary:v7];
  }
  [(SKProductPageViewController *)self->_productViewController setDelegate:self];
  v8 = [(SKProductPageViewController *)self->_productViewController view];
  [(SFStoreBanner *)self insertSubview:v8 atIndex:0];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__SFStoreBanner__setUpStoreKitProductView__block_invoke;
  v9[3] = &unk_1E54E9858;
  v9[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

void __42__SFStoreBanner__setUpStoreKitProductView__block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 456);
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  v3 = (id *)getSKStoreProductParameterITunesItemIdentifierSymbolLoc_ptr;
  uint64_t v11 = getSKStoreProductParameterITunesItemIdentifierSymbolLoc_ptr;
  if (!getSKStoreProductParameterITunesItemIdentifierSymbolLoc_ptr)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __getSKStoreProductParameterITunesItemIdentifierSymbolLoc_block_invoke;
    v7[3] = &unk_1E54EA8A0;
    v7[4] = &v8;
    __getSKStoreProductParameterITunesItemIdentifierSymbolLoc_block_invoke((uint64_t)v7);
    v3 = (id *)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v3)
  {
    -[SFScreenTimeOverlayViewController showBlockingViewControllerForURL:withPolicy:animated:]();
    __break(1u);
  }
  id v12 = *v3;
  v13[0] = *(void *)(*(void *)(a1 + 32) + 496);
  v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = v12;
  v6 = [v4 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  [v2 loadProductWithParameters:v6];
}

- (void)_setUpAppStoreLockUpView
{
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2050000000;
  v3 = (void *)getASCLockupViewClass_softClass;
  uint64_t v47 = getASCLockupViewClass_softClass;
  if (!getASCLockupViewClass_softClass)
  {
    uint64_t v39 = MEMORY[0x1E4F143A8];
    uint64_t v40 = 3221225472;
    v41 = __getASCLockupViewClass_block_invoke;
    v42 = &unk_1E54EA8A0;
    v43 = &v44;
    __getASCLockupViewClass_block_invoke((uint64_t)&v39);
    v3 = (void *)v45[3];
  }
  v4 = v3;
  _Block_object_dispose(&v44, 8);
  id v5 = [v4 alloc];
  v6 = (ASCLockupView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  lockupView = self->_lockupView;
  self->_lockupView = v6;

  -[ASCLockupView setLayoutMargins:](self->_lockupView, "setLayoutMargins:", 0.0, 0.0, 0.0, 14.0);
  uint64_t v8 = [getASCOfferThemeClass() blueTheme];
  [(ASCLockupView *)self->_lockupView setOfferTheme:v8];

  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2050000000;
  v9 = (void *)getASCLockupRequestClass_softClass;
  uint64_t v47 = getASCLockupRequestClass_softClass;
  if (!getASCLockupRequestClass_softClass)
  {
    uint64_t v39 = MEMORY[0x1E4F143A8];
    uint64_t v40 = 3221225472;
    v41 = __getASCLockupRequestClass_block_invoke;
    v42 = &unk_1E54EA8A0;
    v43 = &v44;
    __getASCLockupRequestClass_block_invoke((uint64_t)&v39);
    v9 = (void *)v45[3];
  }
  uint64_t v10 = v9;
  _Block_object_dispose(&v44, 8);
  id v11 = [v10 alloc];
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2050000000;
  id v12 = (void *)getASCAdamIDClass_softClass;
  uint64_t v47 = getASCAdamIDClass_softClass;
  if (!getASCAdamIDClass_softClass)
  {
    uint64_t v39 = MEMORY[0x1E4F143A8];
    uint64_t v40 = 3221225472;
    v41 = __getASCAdamIDClass_block_invoke;
    v42 = &unk_1E54EA8A0;
    v43 = &v44;
    __getASCAdamIDClass_block_invoke((uint64_t)&v39);
    id v12 = (void *)v45[3];
  }
  uint64_t v13 = v12;
  _Block_object_dispose(&v44, 8);
  uint64_t v14 = (void *)[[v13 alloc] initWithNumberValue:self->_productID];
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  v15 = (id *)getASCLockupKindAppSymbolLoc_ptr;
  uint64_t v47 = getASCLockupKindAppSymbolLoc_ptr;
  if (!getASCLockupKindAppSymbolLoc_ptr)
  {
    uint64_t v39 = MEMORY[0x1E4F143A8];
    uint64_t v40 = 3221225472;
    v41 = __getASCLockupKindAppSymbolLoc_block_invoke;
    v42 = &unk_1E54EA8A0;
    v43 = &v44;
    v16 = (void *)AppStoreComponentsLibrary();
    v17 = dlsym(v16, "ASCLockupKindApp");
    *(void *)(v43[1] + 24) = v17;
    getASCLockupKindAppSymbolLoc_ptr = *(void *)(v43[1] + 24);
    v15 = (id *)v45[3];
  }
  _Block_object_dispose(&v44, 8);
  if (!v15)
  {
    -[SFScreenTimeOverlayViewController showBlockingViewControllerForURL:withPolicy:animated:]();
    goto LABEL_18;
  }
  id v18 = *v15;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  v19 = (id *)getASCLockupContextStandardSymbolLoc_ptr;
  uint64_t v47 = getASCLockupContextStandardSymbolLoc_ptr;
  if (!getASCLockupContextStandardSymbolLoc_ptr)
  {
    uint64_t v39 = MEMORY[0x1E4F143A8];
    uint64_t v40 = 3221225472;
    v41 = __getASCLockupContextStandardSymbolLoc_block_invoke;
    v42 = &unk_1E54EA8A0;
    v43 = &v44;
    v20 = (void *)AppStoreComponentsLibrary();
    v21 = dlsym(v20, "ASCLockupContextStandard");
    *(void *)(v43[1] + 24) = v21;
    getASCLockupContextStandardSymbolLoc_ptr = *(void *)(v43[1] + 24);
    v19 = (id *)v45[3];
  }
  _Block_object_dispose(&v44, 8);
  if (!v19)
  {
LABEL_18:
    v38 = (_Unwind_Exception *)-[SFScreenTimeOverlayViewController showBlockingViewControllerForURL:withPolicy:animated:]();
    _Block_object_dispose(&v44, 8);
    _Unwind_Resume(v38);
  }
  id v22 = *v19;
  if (objc_opt_respondsToSelector()) {
    uint64_t v23 = [v11 _initWithID:v14 kind:v18 context:v22 clientID:@"SmartAppBanner" enableAppDistribution:1];
  }
  else {
    uint64_t v23 = [v11 _initWithID:v14 kind:v18 context:v22 clientID:@"SmartAppBanner"];
  }
  v24 = (void *)v23;
  [(ASCLockupView *)self->_lockupView setRequest:v23];

  [(ASCLockupView *)self->_lockupView setDelegate:self];
  [(SFStoreBanner *)self addSubview:self->_lockupView];
  v25 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
  v26 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  [v25 setBaseForegroundColor:v26];

  v27 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark"];
  [v25 setImage:v27];

  v28 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB28E0] scale:-1];
  [v25 setPreferredSymbolConfigurationForImage:v28];

  v29 = (UIButton *)objc_alloc_init(MEMORY[0x1E4FB14D0]);
  closeButton = self->_closeButton;
  self->_closeButton = v29;

  [(UIButton *)self->_closeButton setConfiguration:v25];
  [(UIButton *)self->_closeButton addTarget:self action:sel__setBlockedByUser forControlEvents:64];
  [(UIButton *)self->_closeButton sizeToFit];
  [(SFStoreBanner *)self addSubview:self->_closeButton];
  v31 = [SFThemeColorEffectView alloc];
  v32 = [MEMORY[0x1E4FB14C8] effectWithStyle:10];
  v33 = [(SFThemeColorEffectView *)v31 initWithEffect:v32];
  backdrop = self->_backdrop;
  self->_backdrop = v33;

  [(SFStoreBanner *)self bounds];
  -[SFThemeColorEffectView setFrame:](self->_backdrop, "setFrame:");
  [(SFThemeColorEffectView *)self->_backdrop setAutoresizingMask:18];
  [(SFStoreBanner *)self addSubview:self->_backdrop];
  [(SFStoreBanner *)self sendSubviewToBack:self->_backdrop];
  v35 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  separator = self->_separator;
  self->_separator = v35;

  v37 = objc_msgSend(MEMORY[0x1E4FB1618], "sf_barHairlineOutlineColor");
  [(UIView *)self->_separator setBackgroundColor:v37];

  [(SFStoreBanner *)self addSubview:self->_separator];
}

- (void)_removeAppStoreLockUpView
{
  [(ASCLockupView *)self->_lockupView setDelegate:0];
  [(ASCLockupView *)self->_lockupView removeFromSuperview];
  [(UIButton *)self->_closeButton removeFromSuperview];
  [(UIView *)self->_separator removeFromSuperview];
  [(SFThemeColorEffectView *)self->_backdrop removeFromSuperview];
  lockupView = self->_lockupView;
  self->_lockupView = 0;

  closeButton = self->_closeButton;
  self->_closeButton = 0;

  separator = self->_separator;
  self->_separator = 0;

  backdrop = self->_backdrop;
  self->_backdrop = 0;
}

- (void)themeDidChange
{
  id v11 = [(SFPinnableBanner *)self theme];
  [(SFThemeColorEffectView *)self->_backdrop setTheme:v11];
  v3 = [v11 overrideTintColor];
  [(UIView *)self->_separator setHidden:v3 != 0];
  ASCOfferThemeClass = (objc_class *)getASCOfferThemeClass();
  if (v3)
  {
    id v5 = [ASCOfferThemeClass alloc];
    v6 = [v11 themeColor];
    v7 = [v11 themeColor];
    uint64_t v8 = [v7 colorWithAlphaComponent:0.3];
    v9 = [v11 themeColor];
    uint64_t v10 = (void *)[v5 initWithTitleBackgroundColor:v3 titleTextColor:v6 titleTextDisabledColor:v8 subtitleTextColor:v9 iconTintColor:v3 progressColor:v3];
    [(ASCLockupView *)self->_lockupView setOfferTheme:v10];
  }
  else
  {
    v6 = [(objc_class *)ASCOfferThemeClass blueTheme];
    [(ASCLockupView *)self->_lockupView setOfferTheme:v6];
  }
}

- (void)layoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)SFStoreBanner;
  [(SFStoreBanner *)&v22 layoutSubviews];
  [(SFStoreBanner *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(SKProductPageViewController *)self->_productViewController view];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  if (self->_lockupView)
  {
    v23.origin.x = v4;
    v23.origin.y = v6;
    v23.size.width = v8;
    v23.size.height = v10;
    double Width = CGRectGetWidth(v23);
    v24.origin.x = v4;
    v24.origin.y = v6;
    v24.size.width = v8;
    v24.size.height = v10;
    double Height = CGRectGetHeight(v24);
    [(SFStoreBanner *)self safeAreaInsets];
    double v15 = v14;
    double v17 = v16;
    [(UIButton *)self->_closeButton sizeToFit];
    [(UIButton *)self->_closeButton bounds];
    -[UIButton setFrame:](self->_closeButton, "setFrame:", fmax(v15, 4.0), (Height - fmax(CGRectGetHeight(v25), 44.0)) * 0.5);
    [(UIButton *)self->_closeButton frame];
    double v19 = v18;
    [(UIButton *)self->_closeButton frame];
    CGFloat v20 = CGRectGetWidth(v26);
    -[ASCLockupView setFrame:](self->_lockupView, "setFrame:", v19 + v20, 0.0, Width - v17 - (v19 + v20), Height);
    double v21 = _SFOnePixel();
    -[UIView setFrame:](self->_separator, "setFrame:", 0.0, Height - v21, Width, v21);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  lockupView = self->_lockupView;
  if (lockupView)
  {
    -[ASCLockupView sizeThatFits:](lockupView, "sizeThatFits:", a3.width, 1.79769313e308);
    double v6 = v5 + 28.0;
  }
  else
  {
    int IsPad = _SFDeviceIsPad();
    double v6 = 95.0;
    if (!IsPad) {
      double v6 = 84.0;
    }
  }
  double v8 = width;
  result.height = v6;
  result.CGFloat width = v8;
  return result;
}

- (void)_setBlockedByUser
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained dismissAppSuggestionBanner:self];
  if ([WeakRetained shouldBlockAppSuggestionBanner:self])
  {
    double v3 = +[SFStoreBannerTracker sharedTracker];
    [v3 blockProductBanner:self->_productID];
  }
}

- (void)dealloc
{
  [(ASCLockupView *)self->_lockupView setDelegate:0];
  [(SKProductPageViewController *)self->_productViewController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SFStoreBanner;
  [(SFStoreBanner *)&v3 dealloc];
}

- (void)productPage:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    id v8 = v6;
    [(SFStoreBanner *)self _setBlockedByUser];
  }
  else
  {
    if (a4 != 2) {
      goto LABEL_6;
    }
    id v8 = v6;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained setAppSuggestionBanner:self isPinned:0];
  }
  id v6 = v8;
LABEL_6:
}

- (void)productPage:(id)a3 didFailLoadWithError:(id)a4
{
  id v5 = a4;
  id v6 = WBS_LOG_CHANNEL_PREFIXBanners();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[SFStoreBanner productPage:didFailLoadWithError:](v6, v5);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained dismissAppSuggestionBanner:self];
}

- (void)productPage:(id)a3 willMakePurchases:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = v5;
  if (self->_affiliateData)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * v10++) setAffiliateIdentifier:self->_affiliateData];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)productPage:(id)a3 didFinishPurchase:(id)a4 withError:(id)a5
{
  if (!a5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained setAppSuggestionBanner:self isPinned:1];
  }
}

- (id)presentingViewControllerForLockupView:(id)a3
{
  return 0;
}

- (void)lockupView:(id)a3 didFailRequestWithError:(id)a4
{
  [(SFStoreBanner *)self _removeAppStoreLockUpView];

  [(SFStoreBanner *)self _setUpStoreKitProductView];
}

- (void)lockupView:(id)a3 appStateDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  uint64_t v9 = (id *)getASCAppStateWaitingSymbolLoc_ptr;
  uint64_t v39 = getASCAppStateWaitingSymbolLoc_ptr;
  if (!getASCAppStateWaitingSymbolLoc_ptr)
  {
    uint64_t v31 = MEMORY[0x1E4F143A8];
    uint64_t v32 = 3221225472;
    v33 = __getASCAppStateWaitingSymbolLoc_block_invoke;
    v34 = &unk_1E54EA8A0;
    v35 = &v36;
    uint64_t v10 = (void *)AppStoreComponentsLibrary();
    v37[3] = (uint64_t)dlsym(v10, "ASCAppStateWaiting");
    getASCAppStateWaitingSymbolLoc_ptr = *(void *)(v35[1] + 24);
    uint64_t v9 = (id *)v37[3];
  }
  _Block_object_dispose(&v36, 8);
  if (!v9)
  {
    -[SFScreenTimeOverlayViewController showBlockingViewControllerForURL:withPolicy:animated:]();
    goto LABEL_22;
  }
  id v11 = *v9;
  if ([v7 isEqualToString:v11])
  {
    uint64_t v12 = 1;
  }
  else
  {
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x2020000000;
    long long v13 = (void *)getASCAppStateInstallingSymbolLoc_ptr;
    uint64_t v39 = getASCAppStateInstallingSymbolLoc_ptr;
    if (!getASCAppStateInstallingSymbolLoc_ptr)
    {
      uint64_t v31 = MEMORY[0x1E4F143A8];
      uint64_t v32 = 3221225472;
      v33 = __getASCAppStateInstallingSymbolLoc_block_invoke;
      v34 = &unk_1E54EA8A0;
      v35 = &v36;
      long long v14 = (void *)AppStoreComponentsLibrary();
      v37[3] = (uint64_t)dlsym(v14, "ASCAppStateInstalling");
      getASCAppStateInstallingSymbolLoc_ptr = *(void *)(v35[1] + 24);
      long long v13 = (void *)v37[3];
    }
    _Block_object_dispose(&v36, 8);
    if (!v13)
    {
LABEL_23:
      v27 = (_Unwind_Exception *)-[SFScreenTimeOverlayViewController showBlockingViewControllerForURL:withPolicy:animated:]();
      _Block_object_dispose(&v36, 8);
      objc_destroyWeak(&location);
      _Unwind_Resume(v27);
    }
    uint64_t v12 = [v7 isEqualToString:*v13];
  }

  [WeakRetained setAppSuggestionBanner:self isPinned:v12];
  if (!self->_argument) {
    goto LABEL_20;
  }
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  double v15 = (void *)getASCAppStateOpenableSymbolLoc_ptr;
  uint64_t v39 = getASCAppStateOpenableSymbolLoc_ptr;
  if (!getASCAppStateOpenableSymbolLoc_ptr)
  {
    uint64_t v31 = MEMORY[0x1E4F143A8];
    uint64_t v32 = 3221225472;
    v33 = __getASCAppStateOpenableSymbolLoc_block_invoke;
    v34 = &unk_1E54EA8A0;
    v35 = &v36;
    uint64_t v16 = (void *)AppStoreComponentsLibrary();
    v37[3] = (uint64_t)dlsym(v16, "ASCAppStateOpenable");
    getASCAppStateOpenableSymbolLoc_ptr = *(void *)(v35[1] + 24);
    double v15 = (void *)v37[3];
  }
  _Block_object_dispose(&v36, 8);
  if (!v15)
  {
LABEL_22:
    -[SFScreenTimeOverlayViewController showBlockingViewControllerForURL:withPolicy:animated:]();
    goto LABEL_23;
  }
  if ([v7 isEqualToString:*v15])
  {
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x2050000000;
    double v17 = (void *)getASCOfferMetadataClass_softClass;
    uint64_t v39 = getASCOfferMetadataClass_softClass;
    if (!getASCOfferMetadataClass_softClass)
    {
      uint64_t v31 = MEMORY[0x1E4F143A8];
      uint64_t v32 = 3221225472;
      v33 = __getASCOfferMetadataClass_block_invoke;
      v34 = &unk_1E54EA8A0;
      v35 = &v36;
      __getASCOfferMetadataClass_block_invoke((uint64_t)&v31);
      double v17 = (void *)v37[3];
    }
    id v18 = v17;
    _Block_object_dispose(&v36, 8);
    double v19 = _WBSLocalizedString();
    CGFloat v20 = [v18 textMetadataWithTitle:v19 subtitle:0];

    objc_initWeak(&location, self);
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x2050000000;
    double v21 = (void *)getASCLocalOfferClass_softClass;
    uint64_t v39 = getASCLocalOfferClass_softClass;
    if (!getASCLocalOfferClass_softClass)
    {
      uint64_t v31 = MEMORY[0x1E4F143A8];
      uint64_t v32 = 3221225472;
      v33 = __getASCLocalOfferClass_block_invoke;
      v34 = &unk_1E54EA8A0;
      v35 = &v36;
      __getASCLocalOfferClass_block_invoke((uint64_t)&v31);
      double v21 = (void *)v37[3];
    }
    objc_super v22 = v21;
    _Block_object_dispose(&v36, 8);
    id v23 = [v22 alloc];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __46__SFStoreBanner_lockupView_appStateDidChange___block_invoke;
    v28[3] = &unk_1E54EA1B8;
    objc_copyWeak(&v29, &location);
    CGRect v24 = (void *)[v23 initWithMetadata:v20 action:v28];
    CGRect v25 = [v6 lockup];
    CGRect v26 = [v25 lockupWithOffer:v24];
    [v6 setLockup:v26];

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
LABEL_20:
}

void __46__SFStoreBanner_lockupView_appStateDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _openApp];
}

- (void)_openApp
{
  v17[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:self->_argument];
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x2050000000;
  double v4 = (void *)getSSSoftwareLibraryClass_softClass;
  uint64_t v16 = getSSSoftwareLibraryClass_softClass;
  if (!getSSSoftwareLibraryClass_softClass)
  {
    location[0] = (id)MEMORY[0x1E4F143A8];
    location[1] = (id)3221225472;
    location[2] = __getSSSoftwareLibraryClass_block_invoke;
    location[3] = &unk_1E54EA8A0;
    location[4] = &v13;
    __getSSSoftwareLibraryClass_block_invoke((uint64_t)location);
    double v4 = (void *)v14[3];
  }
  uint64_t v5 = v4;
  _Block_object_dispose(&v13, 8);
  id v6 = objc_alloc_init(v5);
  objc_initWeak(location, self);
  v17[0] = self->_productID;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __25__SFStoreBanner__openApp__block_invoke;
  v9[3] = &unk_1E54EC800;
  objc_copyWeak(&v11, location);
  id v8 = v3;
  id v10 = v8;
  [v6 getLibraryItemsForITunesStoreItemIdentifiers:v7 completionBlock:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(location);
}

void __25__SFStoreBanner__openApp__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 firstObject];
  uint64_t v19 = 0;
  CGFloat v20 = &v19;
  uint64_t v21 = 0x2020000000;
  id v8 = (void *)getSSSoftwareLibraryItemBundleIdentifierSymbolLoc_ptr;
  objc_super v22 = (void *)getSSSoftwareLibraryItemBundleIdentifierSymbolLoc_ptr;
  if (!getSSSoftwareLibraryItemBundleIdentifierSymbolLoc_ptr)
  {
    uint64_t v9 = (void *)StoreServicesLibrary();
    v20[3] = (uint64_t)dlsym(v9, "SSSoftwareLibraryItemBundleIdentifier");
    getSSSoftwareLibraryItemBundleIdentifierSymbolLoc_ptr = v20[3];
    id v8 = (void *)v20[3];
  }
  _Block_object_dispose(&v19, 8);
  if (!v8)
  {
    -[SFScreenTimeOverlayViewController showBlockingViewControllerForURL:withPolicy:animated:]();
    goto LABEL_18;
  }
  id v10 = [v7 valueForProperty:*v8];

  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void **)(a1 + 32);
    if (v12) {
      id v13 = v12;
    }
    uint64_t v19 = 0;
    CGFloat v20 = &v19;
    uint64_t v21 = 0x2020000000;
    long long v14 = getSKUIMetricsLaunchApplicationWithIdentifierAndURLAndLaunchOptionsSymbolLoc_ptr;
    objc_super v22 = getSKUIMetricsLaunchApplicationWithIdentifierAndURLAndLaunchOptionsSymbolLoc_ptr;
    if (!getSKUIMetricsLaunchApplicationWithIdentifierAndURLAndLaunchOptionsSymbolLoc_ptr)
    {
      uint64_t v15 = (void *)StoreKitUILibrary();
      v20[3] = (uint64_t)dlsym(v15, "SKUIMetricsLaunchApplicationWithIdentifierAndURLAndLaunchOptions");
      getSKUIMetricsLaunchApplicationWithIdentifierAndURLAndLaunchOptionsSymbolLoc_ptr = (_UNKNOWN *)v20[3];
      long long v14 = (void *)v20[3];
    }
    _Block_object_dispose(&v19, 8);
    if (v14)
    {
      ((void (*)(id, void *, void, void, void))v14)(v11, v12, 0, 0, 0);
      if (v12) {
        CFRelease(v12);
      }
      CFRelease(v11);
      goto LABEL_16;
    }
LABEL_18:
    id v18 = (_Unwind_Exception *)-[SFScreenTimeOverlayViewController showBlockingViewControllerForURL:withPolicy:animated:]();
    _Block_object_dispose(&v19, 8);
    _Unwind_Resume(v18);
  }
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  double v17 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained[59] presentProductDetailsViewController];
  }

LABEL_16:
}

- (SFAppSuggestionBannerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFAppSuggestionBannerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_argument, 0);
  objc_storeStrong((id *)&self->_mainDocumentURL, 0);
  objc_storeStrong((id *)&self->_affiliateData, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_lockupView, 0);
  objc_storeStrong((id *)&self->_backdrop, 0);

  objc_storeStrong((id *)&self->_productViewController, 0);
}

- (void)productPage:(void *)a1 didFailLoadWithError:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  objc_super v3 = a1;
  double v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_18C354000, v3, OS_LOG_TYPE_ERROR, "App Store Banner failed to load and will be dismissed: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end