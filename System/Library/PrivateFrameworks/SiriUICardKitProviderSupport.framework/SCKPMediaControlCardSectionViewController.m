@interface SCKPMediaControlCardSectionViewController
+ (void)initialize;
- (BOOL)_canShowWhileLocked;
- (CRKCardSectionViewControllingDelegate)cardSectionViewControllingDelegate;
- (SCKPMediaControlCardSectionViewController)initWithMediaRemoteControlCardSection:(id)a3;
- (SFMediaRemoteControlCardSection)cardSection;
- (id)_nowPlayingViewControllerWithRouteUID:(id)a3;
- (id)_nowPlayingVisualStylingProvider;
- (void)_updateActiveSystemEndpointForRouteUID:(id)a3;
- (void)_updatePlatterForHashedRouteUID:(id)a3;
- (void)_updatePlatterForRouteUID:(id)a3;
- (void)loadView;
- (void)setCardSectionViewControllingDelegate:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SCKPMediaControlCardSectionViewController

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___SCKPMediaControlCardSectionViewController;
  objc_msgSendSuper2(&v2, sel_initialize);
  CRLogInitIfNeeded();
}

- (SCKPMediaControlCardSectionViewController)initWithMediaRemoteControlCardSection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCKPMediaControlCardSectionViewController;
  v6 = [(SCKPMediaControlCardSectionViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_cardSection, a3);
  }

  return v7;
}

- (void)loadView
{
  v7 = objc_alloc_init(SCKPMediaControlCardSectionView);
  -[SCKPMediaControlCardSectionViewController setView:](self, "setView:");
  v3 = [(SCKPMediaControlCardSectionViewController *)self cardSection];
  int v4 = [v3 playbackRouteUniqueIdentifierIsEncrypted];

  id v5 = [(SCKPMediaControlCardSectionViewController *)self cardSection];
  v6 = [v5 playbackRouteUniqueIdentifier];
  if (v4) {
    [(SCKPMediaControlCardSectionViewController *)self _updatePlatterForHashedRouteUID:v6];
  }
  else {
    [(SCKPMediaControlCardSectionViewController *)self _updatePlatterForRouteUID:v6];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_updatePlatterForHashedRouteUID:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!self->_assistantSecurityConnection)
  {
    v8 = (AFSecurityConnection *)objc_alloc_init(MEMORY[0x263F285C0]);
    assistantSecurityConnection = self->_assistantSecurityConnection;
    self->_assistantSecurityConnection = v8;

    if (v5) {
      goto LABEL_3;
    }
LABEL_5:
    [(SCKPMediaControlCardSectionViewController *)self _updatePlatterForRouteUID:0];
    goto LABEL_6;
  }
  if (!v4) {
    goto LABEL_5;
  }
LABEL_3:
  v6 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v5 options:0];
  objc_initWeak(&location, self);
  v7 = self->_assistantSecurityConnection;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __77__SCKPMediaControlCardSectionViewController__updatePlatterForHashedRouteUID___block_invoke;
  v10[3] = &unk_26484DEF0;
  id v11 = v5;
  objc_copyWeak(&v12, &location);
  [(AFSecurityConnection *)v7 processData:v6 usingProcedure:2 completion:v10];
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
LABEL_6:
}

void __77__SCKPMediaControlCardSectionViewController__updatePlatterForHashedRouteUID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v7 = (void *)[[NSString alloc] initWithData:v5 encoding:4];
    v8 = (os_log_t *)MEMORY[0x263F31630];
    objc_super v9 = *MEMORY[0x263F31630];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v29 = v10;
      __int16 v30 = 2112;
      v31 = v7;
      _os_log_impl(&dword_228A19000, v9, OS_LOG_TYPE_DEFAULT, "Decoded routeUID: %@ => %@", buf, 0x16u);
    }
    if (v7)
    {
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __77__SCKPMediaControlCardSectionViewController__updatePlatterForHashedRouteUID___block_invoke_7;
      v25[3] = &unk_26484DEC8;
      objc_copyWeak(&v27, (id *)(a1 + 40));
      id v26 = v7;
      dispatch_async(MEMORY[0x263EF83A0], v25);

      objc_destroyWeak(&v27);
    }
    else
    {
      v18 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR)) {
        __77__SCKPMediaControlCardSectionViewController__updatePlatterForHashedRouteUID___block_invoke_cold_2((uint64_t)v5, v18, v19, v20, v21, v22, v23, v24);
      }
    }
  }
  else
  {
    id v11 = *MEMORY[0x263F31630];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_ERROR)) {
      __77__SCKPMediaControlCardSectionViewController__updatePlatterForHashedRouteUID___block_invoke_cold_1((uint64_t)v6, v11, v12, v13, v14, v15, v16, v17);
    }
  }
}

void __77__SCKPMediaControlCardSectionViewController__updatePlatterForHashedRouteUID___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updatePlatterForRouteUID:*(void *)(a1 + 32)];
}

- (void)_updatePlatterForRouteUID:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = *MEMORY[0x263F31630];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl(&dword_228A19000, v5, OS_LOG_TYPE_DEFAULT, "update platter for routeUID: %@", (uint8_t *)&v12, 0xCu);
  }
  id v6 = [(SCKPMediaControlCardSectionViewController *)self view];
  p_mediaPlatterViewController = &self->_mediaPlatterViewController;
  mediaPlatterViewController = self->_mediaPlatterViewController;
  if (mediaPlatterViewController)
  {
    [(UIViewController *)mediaPlatterViewController willMoveToParentViewController:0];
    [v6 setContentView:0];
    [(UIViewController *)*p_mediaPlatterViewController removeFromParentViewController];
    objc_super v9 = *p_mediaPlatterViewController;
    *p_mediaPlatterViewController = 0;
  }
  uint64_t v10 = [(SCKPMediaControlCardSectionViewController *)self _nowPlayingViewControllerWithRouteUID:v4];
  if (v10)
  {
    [(SCKPMediaControlCardSectionViewController *)self addChildViewController:v10];
    id v11 = [v10 view];
    [v6 setContentView:v11];

    [v10 didMoveToParentViewController:self];
    objc_storeStrong((id *)&self->_mediaPlatterViewController, v10);
    [(SCKPMediaControlCardSectionViewController *)self _updateActiveSystemEndpointForRouteUID:v4];
  }
}

- (id)_nowPlayingViewControllerWithRouteUID:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    MRUNowPlayingViewControllerClass = (objc_class *)getMRUNowPlayingViewControllerClass();
    if (MRUNowPlayingViewControllerClass)
    {
      id v6 = (void *)[[MRUNowPlayingViewControllerClass alloc] initWithRouteUID:v4];
      id v7 = objc_alloc((Class)getMRUVisualStylingProviderClass());
      v8 = [(SCKPMediaControlCardSectionViewController *)self _nowPlayingVisualStylingProvider];
      objc_super v9 = (void *)[v7 initWithVisualStylingProvider:v8];
      [v6 setStylingProvider:v9];

      [v6 setLayout:4];
      [v6 setContext:5];
      goto LABEL_11;
    }
    uint64_t v10 = *MEMORY[0x263F31630];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_ERROR)) {
      -[SCKPMediaControlCardSectionViewController _nowPlayingViewControllerWithRouteUID:](v10);
    }
  }
  if (getMRPlatterViewControllerClass())
  {
    id v6 = (void *)[objc_alloc((Class)getMRPlatterViewControllerClass()) initWithRouteUID:v4];
    [v6 setStyle:4];
    [v6 setAllowsNowPlayingAppLaunch:1];
  }
  else
  {
    id v11 = *MEMORY[0x263F31630];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_ERROR)) {
      -[SCKPMediaControlCardSectionViewController _nowPlayingViewControllerWithRouteUID:](v11);
    }
    id v6 = 0;
  }
LABEL_11:

  return v6;
}

- (id)_nowPlayingVisualStylingProvider
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2050000000;
  v3 = (void *)getMTVisualStylingProviderClass_softClass;
  uint64_t v12 = getMTVisualStylingProviderClass_softClass;
  if (!getMTVisualStylingProviderClass_softClass)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __getMTVisualStylingProviderClass_block_invoke;
    v8[3] = &unk_26484DE68;
    v8[4] = &v9;
    __getMTVisualStylingProviderClass_block_invoke((uint64_t)v8);
    v3 = (void *)v10[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v9, 8);
  id v5 = [(SCKPMediaControlCardSectionViewController *)self traitCollection];
  id v6 = objc_msgSend(v4, "_visualStylingProviderForRecipe:category:andUserInterfaceStyle:", 1, 1, objc_msgSend(v5, "userInterfaceStyle"));

  return v6;
}

- (void)traitCollectionDidChange:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SCKPMediaControlCardSectionViewController;
  id v4 = a3;
  [(SCKPMediaControlCardSectionViewController *)&v11 traitCollectionDidChange:v4];
  id v5 = [(SCKPMediaControlCardSectionViewController *)self traitCollection];
  int v6 = [v4 hasDifferentColorAppearanceComparedToTraitCollection:v5];

  if (v6)
  {
    getMRUNowPlayingViewControllerClass();
    id v7 = self->_mediaPlatterViewController;
    if (objc_opt_isKindOfClass())
    {
      id v8 = objc_alloc((Class)getMRUVisualStylingProviderClass());
      uint64_t v9 = [(SCKPMediaControlCardSectionViewController *)self _nowPlayingVisualStylingProvider];
      uint64_t v10 = (void *)[v8 initWithVisualStylingProvider:v9];
      [(UIViewController *)v7 setStylingProvider:v10];
    }
  }
}

- (void)_updateActiveSystemEndpointForRouteUID:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  id v4 = getMRAVEndpointUpdateActiveSystemEndpointForOutputDeviceUIDWithReasonSymbolLoc_ptr;
  uint64_t v10 = getMRAVEndpointUpdateActiveSystemEndpointForOutputDeviceUIDWithReasonSymbolLoc_ptr;
  if (!getMRAVEndpointUpdateActiveSystemEndpointForOutputDeviceUIDWithReasonSymbolLoc_ptr)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __getMRAVEndpointUpdateActiveSystemEndpointForOutputDeviceUIDWithReasonSymbolLoc_block_invoke;
    v6[3] = &unk_26484DE68;
    v6[4] = &v7;
    __getMRAVEndpointUpdateActiveSystemEndpointForOutputDeviceUIDWithReasonSymbolLoc_block_invoke((uint64_t)v6);
    id v4 = (void *)v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v4)
  {
    id v5 = (_Unwind_Exception *)-[SCKPMediaControlCardSectionViewController _updateActiveSystemEndpointForRouteUID:]();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v5);
  }
  ((void (*)(id, void, __CFString *, void, void *))v4)(v3, 0, @"SCKPMediaControlCardSectionViewController", 0, &__block_literal_global_1);
}

void __84__SCKPMediaControlCardSectionViewController__updateActiveSystemEndpointForRouteUID___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *MEMORY[0x263F31630];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_ERROR)) {
      __84__SCKPMediaControlCardSectionViewController__updateActiveSystemEndpointForRouteUID___block_invoke_cold_1(a2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

- (CRKCardSectionViewControllingDelegate)cardSectionViewControllingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->cardSectionViewControllingDelegate);

  return (CRKCardSectionViewControllingDelegate *)WeakRetained;
}

- (void)setCardSectionViewControllingDelegate:(id)a3
{
}

- (SFMediaRemoteControlCardSection)cardSection
{
  return (SFMediaRemoteControlCardSection *)objc_getProperty(self, a2, 1000, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardSection, 0);
  objc_destroyWeak((id *)&self->cardSectionViewControllingDelegate);
  objc_storeStrong((id *)&self->_mediaPlatterViewController, 0);

  objc_storeStrong((id *)&self->_assistantSecurityConnection, 0);
}

void __77__SCKPMediaControlCardSectionViewController__updatePlatterForHashedRouteUID___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __77__SCKPMediaControlCardSectionViewController__updatePlatterForHashedRouteUID___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_nowPlayingViewControllerWithRouteUID:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_228A19000, log, OS_LOG_TYPE_ERROR, "MRPlatterViewControllerClass is unexpectedly Nil", v1, 2u);
}

- (void)_nowPlayingViewControllerWithRouteUID:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_228A19000, log, OS_LOG_TYPE_ERROR, "MRUNowPlayingViewController is unexpectedly Nil", v1, 2u);
}

- (uint64_t)_updateActiveSystemEndpointForRouteUID:.cold.1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return __84__SCKPMediaControlCardSectionViewController__updateActiveSystemEndpointForRouteUID___block_invoke_cold_1(v0);
}

void __84__SCKPMediaControlCardSectionViewController__updateActiveSystemEndpointForRouteUID___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end