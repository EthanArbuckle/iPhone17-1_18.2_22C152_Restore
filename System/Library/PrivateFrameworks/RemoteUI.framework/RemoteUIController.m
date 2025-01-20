@interface RemoteUIController
- (BOOL)_objectModelPageWantsHSATokens:(id)a3;
- (BOOL)_shouldAnimate;
- (BOOL)isListeningForHSATokenAutoFill;
- (BOOL)objectModel:(id)a3 shouldDisplayNamedElement:(id)a4 page:(id)a5;
- (NSArray)displayedPages;
- (NSString)userAgentString;
- (NSURLSessionConfiguration)sessionConfiguration;
- (NSUUID)UUID;
- (RUILoader)loader;
- (RUIStyle)style;
- (RemoteUIController)init;
- (RemoteUIControllerDelegate)delegate;
- (UINavigationController)navigationController;
- (UIViewController)currentPresentationContext;
- (UIViewController)hostViewController;
- (id)_handleDismissAndReplaceWithActionSignal:(id)a3 objectModel:(id)a4;
- (id)_handleDismissWithActionSignal:(id)a3 objectModel:(id)a4;
- (id)_modalObjectModels;
- (id)_objectModelStack;
- (id)_objectModels;
- (id)dismissObjectModelsAnimated:(BOOL)a3 completion:(id)a4;
- (id)hostingController;
- (id)loadCompletion;
- (id)parentViewControllerForObjectModel:(id)a3;
- (id)parser:(id)a3 createPageWithName:(id)a4 attributes:(id)a5;
- (id)popObjectModelAnimated:(BOOL)a3;
- (id)popObjectModelAnimated:(BOOL)a3 stopListeningForHSATokens:(BOOL)a4;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (id)sessionConfigurationForLoader:(id)a3;
- (id)setHandlerForElementsMatching:(id)a3 handler:(id)a4;
- (id)viewControllerForAlertPresentation;
- (id)visibleElementWithIdentifier:(id)a3;
- (unint64_t)supportedInterfaceOrientationsForObjectModel:(id)a3 page:(id)a4;
- (void)_beginListeningForSMSAutoFill;
- (void)_didPresentObjectModel:(id)a3 modally:(BOOL)a4;
- (void)_didRemoveObjectModel:(id)a3;
- (void)_enableTestMode;
- (void)_invalidateModalObjectModels;
- (void)_loadURL:(id)a3 fromObjectModel:(id)a4 postBody:(id)a5;
- (void)_loadURL:(id)a3 postBody:(id)a4 fromObjectModel:(id)a5 completion:(id)a6;
- (void)_modalNavigationWasDismissed;
- (void)_modalViewControllerWasPopped:(id)a3;
- (void)_objectModel:(id)a3 receivedToken:(id)a4;
- (void)_presentModalRUIController:(id)a3 completion:(id)a4;
- (void)_removePreviousObjectModelsBackToIdentifier:(id)a3;
- (void)_replaceModalRUIController:(id)a3 byController:(id)a4 completion:(id)a5;
- (void)_replaceObjectModelWithObjectModel:(id)a3;
- (void)_replacePagesOfObjectModel:(id)a3 byObjectModel:(id)a4 sourceArray:(id)a5;
- (void)_setHandlerWithKey:(id)a3 forElementsMatching:(id)a4 handler:(id)a5;
- (void)_showPartialScreenModal:(id)a3;
- (void)_stopListeningForSMSAutoFill;
- (void)_willPresentObjectModel:(id)a3 modally:(BOOL)a4;
- (void)dealloc;
- (void)handleCancel:(id)a3;
- (void)loadData:(id)a3 baseURL:(id)a4;
- (void)loadRequest:(id)a3;
- (void)loadRequest:(id)a3 completion:(id)a4;
- (void)loadURL:(id)a3 postBody:(id)a4;
- (void)loadURL:(id)a3 postBody:(id)a4 completion:(id)a5;
- (void)loader:(id)a3 didFinishLoadWithError:(id)a4 forRequest:(id)a5;
- (void)loader:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)loader:(id)a3 didReceiveHTTPResponse:(id)a4 forRequest:(id)a5;
- (void)loader:(id)a3 loadResourcesForObjectModel:(id)a4 completion:(id)a5;
- (void)loader:(id)a3 receivedObjectModel:(id)a4 topActionSignal:(id)a5;
- (void)loader:(id)a3 receivedObjectModel:(id)a4 topActionSignal:(id)a5 completion:(id)a6;
- (void)loader:(id)a3 willLoadRequest:(id)a4 redirectResponse:(id)a5 completionHandler:(id)a6;
- (void)modalNavigationWasDismissed;
- (void)objectModel:(id)a3 didNavigateBackFromController:(id)a4 withGesture:(BOOL)a5;
- (void)objectModel:(id)a3 elementDidChange:(id)a4;
- (void)objectModel:(id)a3 pressedLink:(id)a4 httpMethod:(id)a5 completion:(id)a6;
- (void)objectModel:(id)a3 willLoadLinkURL:(id)a4 attributes:(id)a5;
- (void)presentLoadingSheet:(id)a3;
- (void)pushObjectModel:(id)a3 animated:(BOOL)a4;
- (void)pushObjectModel:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)refreshTopModelWithModel:(id)a3;
- (void)removeHandlerForKey:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHandlerForButtonName:(id)a3 handler:(id)a4;
- (void)setHandlerForButtonsMatching:(id)a3 handler:(id)a4;
- (void)setHandlerForElementName:(id)a3 handler:(id)a4;
- (void)setHostViewController:(id)a3;
- (void)setLoadCompletion:(id)a3;
- (void)setLoader:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setSessionConfiguration:(id)a3;
- (void)setStyle:(id)a3;
- (void)setUUID:(id)a3;
- (void)setUserAgentString:(id)a3;
- (void)startListeningForHSATokenAutoFill;
- (void)stopListeningForHSATokenAutoFill;
@end

@implementation RemoteUIController

- (RemoteUIController)init
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)RemoteUIController;
  v2 = [(RemoteUIController *)&v13 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    objectModels = v2->_objectModels;
    v2->_objectModels = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    modalObjectModels = v2->_modalObjectModels;
    v2->_modalObjectModels = v5;

    [MEMORY[0x263F829A0] _setUseCustomBackButtonAction:1];
    uint64_t v7 = [MEMORY[0x263F08C38] UUID];
    UUID = v2->_UUID;
    v2->_UUID = (NSUUID *)v7;

    if (_isInternalInstall())
    {
      if (_isInternalInstall())
      {
        v9 = _RUILoggingFacility();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = [(RemoteUIController *)v2 UUID];
          v11 = [MEMORY[0x263F08B88] callStackSymbols];
          *(_DWORD *)buf = 138412546;
          v15 = v10;
          __int16 v16 = 2112;
          v17 = v11;
          _os_log_impl(&dword_2144F2000, v9, OS_LOG_TYPE_DEFAULT, "RemoteUIController init %@\n%@", buf, 0x16u);
        }
      }
    }
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (_isInternalInstall() && _isInternalInstall())
  {
    v3 = _RUILoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = [(RemoteUIController *)self UUID];
      v5 = [MEMORY[0x263F08B88] callStackSymbols];
      *(_DWORD *)buf = 138412546;
      v8 = v4;
      __int16 v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_2144F2000, v3, OS_LOG_TYPE_DEFAULT, "RemoteUIController dealloc %@\n%@", buf, 0x16u);
    }
  }
  [(RemoteUIController *)self _stopListeningForSMSAutoFill];
  [(RUILoader *)self->_loader cancel];
  [(RUIHTTPRequest *)self->_loader setDelegate:0];
  v6.receiver = self;
  v6.super_class = (Class)RemoteUIController;
  [(RemoteUIController *)&v6 dealloc];
}

- (void)setDelegate:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_delegate, v4);
    if (_isInternalInstall())
    {
      uint64_t v7 = _RUILoggingFacility();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = [(RemoteUIController *)self UUID];
        __int16 v9 = [v8 UUIDString];
        id v10 = objc_loadWeakRetained((id *)p_delegate);
        int v11 = 138412546;
        v12 = v9;
        __int16 v13 = 2112;
        id v14 = v10;
        _os_log_impl(&dword_2144F2000, v7, OS_LOG_TYPE_DEFAULT, "RUIController %@ got delegate %@", (uint8_t *)&v11, 0x16u);
      }
    }
  }
}

- (UIViewController)currentPresentationContext
{
  modalNavigationController = self->_modalNavigationController;
  if (modalNavigationController && ![(RUINavigationController *)modalNavigationController isDismissing])
  {
    id v4 = self->_modalNavigationController;
  }
  else
  {
    id v4 = [(RemoteUIController *)self hostViewController];
  }
  return (UIViewController *)v4;
}

- (void)_enableTestMode
{
  self->_testMode = 1;
}

- (BOOL)_shouldAnimate
{
  return !self->_testMode;
}

- (void)setStyle:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v5 = (RUIStyle *)a3;
  if (self->_style != v5)
  {
    objc_storeStrong((id *)&self->_style, a3);
    [(RUILoader *)self->_loader setStyle:v5];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    objc_super v6 = self->_objectModels;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v20 + 1) + 8 * i) setStyle:v5];
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v8);
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    int v11 = self->_modalObjectModels;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * j), "setStyle:", v5, (void)v16);
        }
        uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v13);
    }
  }
}

- (void)modalNavigationWasDismissed
{
  spinner = self->_spinner;
  if (spinner) {
    [(UIActivityIndicatorView *)spinner stopAnimating];
  }
  [(RemoteUIController *)self _modalNavigationWasDismissed];
}

- (void)handleCancel:(id)a3
{
  id v4 = [(RemoteUIController *)self hostViewController];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __35__RemoteUIController_handleCancel___block_invoke;
  v5[3] = &unk_2642112D8;
  v5[4] = self;
  [v4 dismissViewControllerAnimated:1 completion:v5];
}

uint64_t __35__RemoteUIController_handleCancel___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _modalNavigationWasDismissed];
}

- (void)presentLoadingSheet:(id)a3
{
  id v71 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F82E10]);
  v5 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_handleCancel_];
  objc_super v6 = [v4 navigationItem];
  [v6 setRightBarButtonItem:v5];

  id v7 = objc_alloc(MEMORY[0x263F82E00]);
  uint64_t v8 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  uint64_t v9 = [v71 navBarImage];
  if (v9)
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v9];
    [v8 addSubview:v10];
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    int v11 = [v10 topAnchor];
    uint64_t v12 = [v8 topAnchor];
    uint64_t v13 = [v11 constraintEqualToAnchor:v12];
    [v13 setActive:1];

    uint64_t v14 = [v10 bottomAnchor];
    uint64_t v15 = [v8 bottomAnchor];
    long long v16 = [v14 constraintEqualToAnchor:v15];
    [v16 setActive:1];

    long long v17 = [v10 leadingAnchor];
    long long v18 = [v8 leadingAnchor];
    long long v19 = [v17 constraintEqualToAnchor:v18];
    [v19 setActive:1];

    long long v20 = [v10 widthAnchor];
    long long v21 = [v20 constraintEqualToConstant:20.0];
    [v21 setActive:1];

    long long v22 = [v10 heightAnchor];
    long long v23 = [v22 constraintEqualToConstant:20.0];
    [v23 setActive:1];

    id v24 = objc_alloc_init(MEMORY[0x263F828E0]);
    v25 = [v71 navBarImageLabel];
    [v24 setText:v25];

    uint64_t v26 = [MEMORY[0x263F81708] systemFontOfSize:18.0 weight:*MEMORY[0x263F81840]];
    [v24 setFont:v26];

    [v8 addSubview:v24];
    [v24 setTranslatesAutoresizingMaskIntoConstraints:0];
    v27 = [v24 topAnchor];
    v28 = [v8 topAnchor];
    v29 = [v27 constraintEqualToAnchor:v28];
    [v29 setActive:1];

    v30 = [v24 bottomAnchor];
    v31 = [v8 bottomAnchor];
    v32 = [v30 constraintEqualToAnchor:v31];
    [v32 setActive:1];

    v33 = [v24 leadingAnchor];
    v34 = [v10 trailingAnchor];
    v35 = [v33 constraintEqualToAnchor:v34 constant:10.0];
    [v35 setActive:1];

    v36 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:v8];
    v37 = [v4 navigationItem];
    [v37 setLeftBarButtonItem:v36];
  }
  v38 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
  spinner = self->_spinner;
  self->_spinner = v38;

  v40 = [v4 view];
  [v40 addSubview:self->_spinner];

  [(UIActivityIndicatorView *)self->_spinner setTranslatesAutoresizingMaskIntoConstraints:0];
  v41 = [(UIActivityIndicatorView *)self->_spinner centerXAnchor];
  v42 = [v4 view];
  v43 = [v42 centerXAnchor];
  v44 = [v41 constraintEqualToAnchor:v43];
  [v44 setActive:1];

  v45 = [(UIActivityIndicatorView *)self->_spinner centerYAnchor];
  v46 = [v4 view];
  v47 = [v46 centerYAnchor];
  v48 = [v45 constraintEqualToAnchor:v47];
  [v48 setActive:1];

  v49 = [v71 spinnerLabel];

  if (v49)
  {
    id v50 = objc_alloc_init(MEMORY[0x263F828E0]);
    v51 = [v71 spinnerLabel];
    [v50 setText:v51];

    [v50 setTextAlignment:1];
    v52 = [(RemoteUIController *)self style];
    v53 = [v52 spinnerLabelFont];
    [v50 setFont:v53];

    v54 = [(RemoteUIController *)self style];
    v55 = [v54 spinnerLabelColor];
    [v50 setTextColor:v55];

    v56 = [v4 view];
    [v56 addSubview:v50];

    [v50 setTranslatesAutoresizingMaskIntoConstraints:0];
    v57 = [v50 leadingAnchor];
    v58 = [v4 view];
    v59 = [v58 leadingAnchor];
    v60 = [v57 constraintEqualToAnchor:v59];
    [v60 setActive:1];

    v61 = [v50 trailingAnchor];
    v62 = [v4 view];
    v63 = [v62 trailingAnchor];
    v64 = [v61 constraintEqualToAnchor:v63];
    [v64 setActive:1];

    v65 = [v50 topAnchor];
    v66 = [(UIActivityIndicatorView *)self->_spinner bottomAnchor];
    v67 = [v65 constraintEqualToAnchor:v66 constant:10.0];
    [v67 setActive:1];
  }
  [(UIActivityIndicatorView *)self->_spinner startAnimating];
  v68 = [v4 view];
  v69 = [(RemoteUIController *)self style];
  v70 = [v69 backgroundColor];
  [v68 setBackgroundColor:v70];

  [(RemoteUIController *)self _showPartialScreenModal:v4];
}

- (void)_showPartialScreenModal:(id)a3
{
  id v4 = a3;
  obuint64_t j = [[RUINavigationController alloc] initWithRootViewController:v4];

  v5 = [(RemoteUIController *)self hostViewController];
  [(RUINavigationController *)obj setHostViewController:v5];

  objc_super v6 = [MEMORY[0x263F82670] currentDevice];
  LODWORD(v4) = [v6 userInterfaceIdiom] != 1;

  [(RUINavigationController *)obj setRuiModalPresentationStyle:2 * v4];
  [(RUINavigationController *)obj setModalPresentationStyle:4];
  [(RUINavigationController *)obj setTransitioningDelegate:self];
  id v7 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (!v8) {
    [(RUINavigationController *)obj setSupportedInterfaceOrientations:2];
  }
  objc_storeStrong((id *)&self->_modalNavigationController, obj);
  uint64_t v9 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v10 = [v9 userInterfaceIdiom];

  if (v10 == 1) {
    [(RUINavigationController *)self->_modalNavigationController setModalInPresentation:1];
  }
  int v11 = [(RemoteUIController *)self hostViewController];
  [v11 presentViewController:obj animated:1 completion:0];
}

- (void)loadRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  [(RemoteUIController *)self setLoadCompletion:a4];
  id v7 = (id)[v6 mutableCopy];

  [(RemoteUIController *)self loadRequest:v7];
}

- (void)_loadURL:(id)a3 postBody:(id)a4 fromObjectModel:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  [(RemoteUIController *)self setLoadCompletion:a6];
  [(RemoteUIController *)self _loadURL:v12 fromObjectModel:v10 postBody:v11];
}

- (void)loadURL:(id)a3 postBody:(id)a4 completion:(id)a5
{
}

- (void)loadRequest:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 setValue:self->_userAgentString forHTTPHeaderField:@"User-Agent"];
  v5 = [v4 valueForHTTPHeaderField:@"Content-Type"];
  uint64_t v6 = [v5 length];

  if (!v6) {
    [v4 setValue:@"application/x-plist" forHTTPHeaderField:@"Content-Type"];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);

  if (WeakRetained)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_hostViewController);
    uint64_t v9 = [v8 traitCollection];
    uint64_t v10 = [v9 userInterfaceStyle];

    if (_isInternalInstall())
    {
      id v11 = _RUILoggingFacility();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [NSNumber numberWithInteger:v10];
        int v15 = 138412290;
        long long v16 = v12;
        _os_log_impl(&dword_2144F2000, v11, OS_LOG_TYPE_DEFAULT, "Setting interface style based on _hostViewController %@", (uint8_t *)&v15, 0xCu);
      }
    }
    uint64_t v13 = [(RemoteUIController *)self loader];
    [v13 setUserInterfaceStyle:v10];
  }
  uint64_t v14 = [(RemoteUIController *)self loader];
  [v14 loadXMLUIWithRequest:v4];
}

- (void)_loadURL:(id)a3 fromObjectModel:(id)a4 postBody:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8) {
    goto LABEL_7;
  }
  id v11 = [(RemoteUIController *)self loader];
  id v12 = [v11 URL];
  uint64_t v13 = [v12 absoluteURL];
  uint64_t v14 = [v8 absoluteURL];
  int v15 = [v13 isEqual:v14];

  if (v15)
  {
    if (_isInternalInstall())
    {
      long long v16 = _RUILoggingFacility();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138412290;
        id v21 = v8;
        _os_log_impl(&dword_2144F2000, v16, OS_LOG_TYPE_DEFAULT, "Already loading %@", (uint8_t *)&v20, 0xCu);
      }
    }
  }
  else
  {
LABEL_7:
    uint64_t v17 = [(RemoteUIController *)self loader];
    [v17 cancel];

    long long v18 = (void *)[objc_alloc(MEMORY[0x263F089E0]) initWithURL:v8 cachePolicy:1 timeoutInterval:30.0];
    long long v19 = v18;
    if (v10)
    {
      [v18 setHTTPBody:v10];
      [v19 setHTTPMethod:@"POST"];
    }
    [v9 _populateRequest:v19];
    [(RemoteUIController *)self loadRequest:v19];
  }
}

- (void)loadURL:(id)a3 postBody:(id)a4
{
}

- (void)loadData:(id)a3 baseURL:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    goto LABEL_6;
  }
  id v8 = [(RemoteUIController *)self loader];
  id v9 = [v8 URL];
  id v10 = [v9 absoluteURL];
  id v11 = [v7 absoluteURL];
  int v12 = [v10 isEqual:v11];

  if (!v12)
  {
LABEL_6:
    uint64_t v14 = [(RemoteUIController *)self loader];
    [v14 cancel];

    uint64_t v13 = [(RemoteUIController *)self loader];
    [v13 loadXMLUIWithData:v6 baseURL:v7];
LABEL_7:

    goto LABEL_8;
  }
  if (_isInternalInstall())
  {
    uint64_t v13 = _RUILoggingFacility();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v7;
      _os_log_impl(&dword_2144F2000, v13, OS_LOG_TYPE_DEFAULT, "Already loading %@", (uint8_t *)&v15, 0xCu);
    }
    goto LABEL_7;
  }
LABEL_8:
}

- (void)_willPresentObjectModel:(id)a3 modally:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  if (self->_SMSAutoFillToken) {
    -[RemoteUIController _objectModel:receivedToken:](self, "_objectModel:receivedToken:", v9);
  }
  id v6 = [(RemoteUIController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(RemoteUIController *)self delegate];
    [v8 remoteUIController:self willPresentObjectModel:v9 modally:v4];
  }
}

- (void)_didPresentObjectModel:(id)a3 modally:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  id v6 = [(RemoteUIController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(RemoteUIController *)self delegate];
    [v8 remoteUIController:self didPresentObjectModel:v9 modally:v4];
  }
}

- (void)_didRemoveObjectModel:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(RemoteUIController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(RemoteUIController *)self delegate];
    [v6 remoteUIController:self didRemoveObjectModel:v7];
  }
}

- (id)_objectModels
{
  return self->_objectModels;
}

- (id)_modalObjectModels
{
  return self->_modalObjectModels;
}

- (void)_removePreviousObjectModelsBackToIdentifier:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v28 = a3;
  uint64_t v5 = 24;
  if (!self->_modalNavigationController) {
    uint64_t v5 = 16;
  }
  id v6 = *(id *)((char *)&self->super.isa + v5);
  if ((unint64_t)[v6 count] >= 2)
  {
    modalNavigationController = self->_modalNavigationController;
    if (modalNavigationController)
    {
      id v8 = modalNavigationController;
    }
    else
    {
      id v8 = [(RemoteUIController *)self navigationController];
      if (!v8)
      {
        uint64_t v26 = [MEMORY[0x263F08690] currentHandler];
        objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"RemoteUIController.m", 341, @"%s: no navigation controller to remove from", "-[RemoteUIController _removePreviousObjectModelsBackToIdentifier:]");

        id v8 = 0;
      }
    }
    p_super = &v8->super.super.super.super;
    id v10 = objc_opt_new();
    uint64_t v11 = [v6 count];
    if (v11 - 2 < 0)
    {
      int v12 = 0;
    }
    else
    {
      int v12 = 0;
      uint64_t v13 = v11 - 1;
      while (1)
      {
        uint64_t v14 = v12;
        int v15 = [v6 objectAtIndexedSubscript:--v13];
        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = __66__RemoteUIController__removePreviousObjectModelsBackToIdentifier___block_invoke;
        v33[3] = &unk_264211D68;
        id v34 = v15;
        id v16 = v15;
        int v12 = objc_msgSend(v12, "aaf_filter:", v33);

        uint64_t v17 = v10;
        [v10 addObject:v16];
        long long v18 = [v16 identifier];
        int v19 = [v18 isEqualToString:v28];

        if (v19) {
          break;
        }
        id v10 = v17;
        if (v13 < 1) {
          goto LABEL_26;
        }
      }
      id v10 = v17;
      if ([v17 count])
      {
        id v9 = p_super;
        [p_super setViewControllers:v12 animated:0];
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        int v20 = v10;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v30;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v30 != v23) {
                objc_enumerationMutation(v20);
              }
              v25 = *(void **)(*((void *)&v29 + 1) + 8 * i);
              [v25 setDelegate:0];
              [v6 removeObject:v25];
              [(RemoteUIController *)self _didRemoveObjectModel:v25];
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v29 objects:v37 count:16];
          }
          while (v22);
        }
        goto LABEL_30;
      }
    }
LABEL_26:
    if (!_isInternalInstall())
    {
      id v9 = p_super;
      goto LABEL_32;
    }
    int v20 = _RUILoggingFacility();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2144F2000, v20, OS_LOG_TYPE_DEFAULT, "No object models removed by idOfOldestObjectModelToRemoveAfterPush", buf, 2u);
    }
    id v9 = p_super;
LABEL_30:

LABEL_32:
LABEL_33:

    goto LABEL_34;
  }
  if (_isInternalInstall())
  {
    id v9 = _RUILoggingFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v36 = [v6 count];
      _os_log_impl(&dword_2144F2000, v9, OS_LOG_TYPE_DEFAULT, "Not enough object models on the stack to use idOfOldestObjectModelToRemoveAfterPush! Need >=2, have %lu", buf, 0xCu);
    }
    goto LABEL_33;
  }
LABEL_34:
}

uint64_t __66__RemoteUIController__removePreviousObjectModelsBackToIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  BOOL v4 = [v2 displayedPages];
  int v5 = [v3 containsDescendantFromArray:v4];

  return v5 ^ 1u;
}

- (void)pushObjectModel:(id)a3 animated:(BOOL)a4
{
}

- (void)pushObjectModel:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  uint64_t v6 = a4;
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = 24;
  if (!self->_modalNavigationController) {
    uint64_t v11 = 16;
  }
  id v12 = *(id *)((char *)&self->super.isa + v11);
  modalNavigationController = self->_modalNavigationController;
  if (modalNavigationController)
  {
    uint64_t v14 = modalNavigationController;
  }
  else
  {
    uint64_t v14 = [(RemoteUIController *)self hostingController];
    if (!v14)
    {
      v46 = [MEMORY[0x263F08690] currentHandler];
      objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"RemoteUIController.m", 383, @"%s: no navigation controller to push onto", "-[RemoteUIController pushObjectModel:animated:completion:]");

      uint64_t v14 = 0;
    }
  }
  [v9 setDelegate:self];
  [(RemoteUIController *)self _willPresentObjectModel:v9 modally:self->_modalNavigationController != 0];
  int v15 = [v9 identifierMarkingStackRemovalAfterPush];

  if (v15)
  {
    v57[0] = MEMORY[0x263EF8330];
    v57[1] = 3221225472;
    v57[2] = __58__RemoteUIController_pushObjectModel_animated_completion___block_invoke;
    v57[3] = &unk_264211D90;
    id v16 = v9;
    id v58 = v16;
    uint64_t v17 = [v12 indexOfObjectPassingTest:v57];
    if (v17 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (_isInternalInstall())
      {
        long long v18 = _RUILoggingFacility();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = [v16 identifierMarkingStackRemovalAfterPush];
          *(_DWORD *)buf = 138412290;
          v60 = v19;
          _os_log_impl(&dword_2144F2000, v18, OS_LOG_TYPE_DEFAULT, "idOfOldestObjectModelToRemoveAfterPush '%@' not found", buf, 0xCu);
        }
      }
      int v15 = 0;
      goto LABEL_24;
    }
    uint64_t v20 = v17;
    if (v17 >= 2)
    {
      unsigned int v47 = v6;
      uint64_t v21 = [v12 objectAtIndexedSubscript:v17 - 1];
      uint64_t v22 = [v21 displayedPages];
      uint64_t v23 = [v22 lastObject];

      uint64_t v24 = [v23 backButtonTitle];
      if (v24)
      {
        v25 = (void *)v24;

        uint64_t v6 = v47;
        goto LABEL_21;
      }
      v25 = [v23 navTitle];

      uint64_t v6 = v47;
      if (v25) {
        goto LABEL_21;
      }
    }
    uint64_t v26 = [v12 objectAtIndexedSubscript:v20];
    v27 = [v26 displayedPages];
    v25 = [v27 firstObject];

    id v28 = [(RUINavigationController *)v14 viewControllers];
    uint64_t v29 = [v28 indexOfObject:v25];

    if (v29 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_22;
    }
    uint64_t v30 = v29 - 1;
    if (!v30) {
      goto LABEL_22;
    }
    v48 = [(RUINavigationController *)v14 viewControllers];
    long long v31 = [v48 objectAtIndexedSubscript:v30];
    [v31 navigationItem];
    v49 = v14;
    id v32 = v10;
    id v33 = v16;
    v35 = uint64_t v34 = v6;
    uint64_t v36 = [v35 title];

    uint64_t v6 = v34;
    id v16 = v33;
    id v10 = v32;
    uint64_t v14 = v49;

    v25 = (void *)v36;
    if (!v36)
    {
LABEL_23:
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __58__RemoteUIController_pushObjectModel_animated_completion___block_invoke_2;
      aBlock[3] = &unk_264211888;
      aBlock[4] = self;
      id v56 = v16;
      int v15 = _Block_copy(aBlock);

LABEL_24:
      goto LABEL_25;
    }
LABEL_21:
    id v50 = v14;
    v37 = [v12 lastObject];
    uint64_t v38 = [v37 displayedPages];
    [v38 lastObject];
    id v39 = v10;
    id v40 = v16;
    v42 = uint64_t v41 = v6;

    [v42 setBackButtonTitle:v25];
    uint64_t v6 = v41;
    id v16 = v40;
    id v10 = v39;
    uint64_t v14 = v50;
LABEL_22:

    goto LABEL_23;
  }
LABEL_25:
  [v12 addObject:v9];
  v51[0] = MEMORY[0x263EF8330];
  v51[1] = 3221225472;
  v51[2] = __58__RemoteUIController_pushObjectModel_animated_completion___block_invoke_65;
  v51[3] = &unk_264211DB8;
  v51[4] = self;
  id v52 = v9;
  id v53 = v15;
  id v54 = v10;
  id v43 = v10;
  id v44 = v15;
  id v45 = v9;
  [v45 presentInParentViewController:v14 animated:v6 completion:v51];
}

uint64_t __58__RemoteUIController_pushObjectModel_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  BOOL v4 = [*(id *)(a1 + 32) identifierMarkingStackRemovalAfterPush];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

void __58__RemoteUIController_pushObjectModel_animated_completion___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) identifierMarkingStackRemovalAfterPush];
  [v1 _removePreviousObjectModelsBackToIdentifier:v2];
}

uint64_t __58__RemoteUIController_pushObjectModel_animated_completion___block_invoke_65(uint64_t a1)
{
  [*(id *)(a1 + 32) _didPresentObjectModel:*(void *)(a1 + 40) modally:*(void *)(*(void *)(a1 + 32) + 8) != 0];
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    BOOL v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (id)_objectModelStack
{
  uint64_t v2 = 24;
  if (!self->_modalNavigationController) {
    uint64_t v2 = 16;
  }
  return *(id *)((char *)&self->super.isa + v2);
}

- (id)popObjectModelAnimated:(BOOL)a3 stopListeningForHSATokens:(BOOL)a4
{
  BOOL v4 = a3;
  if (a4) {
    [(RemoteUIController *)self _stopListeningForSMSAutoFill];
  }
  modalNavigationController = self->_modalNavigationController;
  if (modalNavigationController)
  {
    id v8 = modalNavigationController;
  }
  else
  {
    id v8 = [(RemoteUIController *)self navigationController];
    if (!v8)
    {
      uint64_t v22 = [MEMORY[0x263F08690] currentHandler];
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"RemoteUIController.m", 449, @"%s: no navigation controller to pop from", "-[RemoteUIController popObjectModelAnimated:stopListeningForHSATokens:]");

      id v8 = 0;
    }
  }
  id v9 = [(RemoteUIController *)self _objectModelStack];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    uint64_t v11 = [(RemoteUIController *)self _objectModelStack];
    id v12 = [v11 lastObject];

    uint64_t v13 = [v12 displayedPages];
    uint64_t v14 = [v13 count];
    int v15 = [(RUINavigationController *)v8 viewControllers];
    id v16 = (void *)[v15 mutableCopy];

    if (v14 - 1 >= 0)
    {
      do
      {
        uint64_t v17 = [v13 objectAtIndex:--v14];
        long long v18 = [v16 lastObject];
        int v19 = [v18 containsDescendant:v17];

        if (v19) {
          [v16 removeLastObject];
        }
      }
      while (v14 > 0);
    }
    [(RUINavigationController *)v8 setViewControllers:v16 animated:v4];
    [v12 setDelegate:0];
    uint64_t v20 = [(RemoteUIController *)self _objectModelStack];
    [v20 removeLastObject];

    [(RemoteUIController *)self _didRemoveObjectModel:v12];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)popObjectModelAnimated:(BOOL)a3
{
  return [(RemoteUIController *)self popObjectModelAnimated:a3 stopListeningForHSATokens:1];
}

- (void)_replaceObjectModelWithObjectModel:(id)a3
{
  v39[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 defaultPages];
  uint64_t v6 = [v5 firstObject];
  BOOL v7 = [(RemoteUIController *)self _objectModelPageWantsHSATokens:v6];

  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = __Block_byref_object_copy__1;
  v37 = __Block_byref_object_dispose__1;
  id v38 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v8 = 24;
  if (!self->_modalNavigationController) {
    uint64_t v8 = 16;
  }
  id v9 = *(id *)((char *)&self->super.isa + v8);
  uint64_t v10 = [v4 idOfObjectModelToReplace];
  BOOL v11 = [v10 length] == 0;

  if (v11)
  {
    if (![v9 count]) {
      goto LABEL_8;
    }
    uint64_t v14 = [v9 count];
    v30[3] = v14 - 1;
    int v15 = v34;
    id v16 = v9;
    uint64_t v13 = (void *)v15[5];
    v15[5] = (uint64_t)v16;
  }
  else
  {
    objectModels = self->_objectModels;
    v39[0] = self->_modalObjectModels;
    v39[1] = objectModels;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:2];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __57__RemoteUIController__replaceObjectModelWithObjectModel___block_invoke;
    v25[3] = &unk_264211E08;
    id v26 = v4;
    v27 = &v33;
    id v28 = &v29;
    [v13 enumerateObjectsUsingBlock:v25];
  }
LABEL_8:
  uint64_t v17 = v30[3];
  if (v17 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [v9 addObject:v4];
    long long v18 = 0;
  }
  else
  {
    if (!v7)
    {
      [(RemoteUIController *)self stopListeningForHSATokenAutoFill];
      uint64_t v17 = v30[3];
    }
    long long v18 = [(id)v34[5] objectAtIndexedSubscript:v17];
    [(id)v34[5] replaceObjectAtIndex:v30[3] withObject:v4];
  }
  [v4 setDelegate:self];
  [(RemoteUIController *)self _replacePagesOfObjectModel:v18 byObjectModel:v4 sourceArray:v34[5]];
  if (v18)
  {
    [(RemoteUIController *)self _didRemoveObjectModel:v18];
    [v18 setDelegate:0];
  }
  int v19 = (NSMutableArray *)v34[5];
  modalObjectModels = self->_modalObjectModels;
  [(RemoteUIController *)self _willPresentObjectModel:v4 modally:v19 == modalObjectModels];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __57__RemoteUIController__replaceObjectModelWithObjectModel___block_invoke_3;
  v22[3] = &unk_264211E30;
  v22[4] = self;
  id v21 = v4;
  id v23 = v21;
  BOOL v24 = v19 == modalObjectModels;
  [v21 presentWithBlock:v22];

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
}

void __57__RemoteUIController__replaceObjectModelWithObjectModel___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__RemoteUIController__replaceObjectModelWithObjectModel___block_invoke_2;
  v8[3] = &unk_264211DE0;
  id v9 = *(id *)(a1 + 32);
  id v10 = v6;
  long long v11 = *(_OWORD *)(a1 + 40);
  uint64_t v12 = a4;
  id v7 = v6;
  [v7 enumerateObjectsUsingBlock:v8];
}

void __57__RemoteUIController__replaceObjectModelWithObjectModel___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = [a2 identifier];
  uint64_t v8 = [*(id *)(a1 + 32) idOfObjectModelToReplace];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(a1 + 40));
    id v10 = *(unsigned char **)(a1 + 64);
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a3;
    unsigned char *v10 = 1;
    *a4 = 1;
  }
}

uint64_t __57__RemoteUIController__replaceObjectModelWithObjectModel___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didPresentObjectModel:*(void *)(a1 + 40) modally:*(unsigned __int8 *)(a1 + 48)];
}

- (void)_replacePagesOfObjectModel:(id)a3 byObjectModel:(id)a4 sourceArray:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (NSMutableArray *)a5;
  if (self->_modalObjectModels == v10)
  {
    long long v11 = self->_modalNavigationController;
  }
  else
  {
    long long v11 = [(RemoteUIController *)self navigationController];
  }
  uint64_t v12 = v11;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__1;
  uint64_t v30 = __Block_byref_object_dispose__1;
  uint64_t v13 = [(RUINavigationController *)v11 viewControllers];
  id v31 = (id)[v13 mutableCopy];

  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
  if (v8)
  {
    uint64_t v14 = [v8 allPages];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __75__RemoteUIController__replacePagesOfObjectModel_byObjectModel_sourceArray___block_invoke;
    v21[3] = &unk_264211E80;
    v21[4] = &v22;
    v21[5] = &v26;
    [v14 enumerateObjectsUsingBlock:v21];
  }
  else if ([(id)v27[5] count])
  {
    uint64_t v15 = [(id)v27[5] count];
    v23[3] = v15 - 1;
    [(id)v27[5] removeLastObject];
  }
  id v16 = [v9 defaultPages];
  uint64_t v17 = [v16 firstObject];

  if (v17)
  {
    if (v23[3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      long long v18 = _RUILoggingFacility();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[RemoteUIController _replacePagesOfObjectModel:byObjectModel:sourceArray:]();
      }
    }
    else
    {
      int v19 = (void *)v27[5];
      long long v18 = [v9 defaultPages];
      uint64_t v20 = [v18 firstObject];
      [v19 insertObject:v20 atIndex:v23[3]];
    }
  }
  else
  {
    long long v18 = _RUILoggingFacility();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[RemoteUIController _replacePagesOfObjectModel:byObjectModel:sourceArray:]();
    }
  }

  [(RUINavigationController *)v12 setViewControllers:v27[5] animated:0];
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
}

void __75__RemoteUIController__replacePagesOfObjectModel_byObjectModel_sourceArray___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __75__RemoteUIController__replacePagesOfObjectModel_byObjectModel_sourceArray___block_invoke_2;
    v17[3] = &unk_264211E58;
    id v6 = v3;
    uint64_t v7 = *(void *)(a1 + 32);
    id v18 = v6;
    uint64_t v19 = v7;
    id v8 = (id)objc_msgSend(v5, "aaf_firstObjectPassingTest:", v17);
  }
  id v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __75__RemoteUIController__replacePagesOfObjectModel_byObjectModel_sourceArray___block_invoke_3;
  v15[3] = &unk_2642116B0;
  id v16 = v4;
  id v10 = v4;
  long long v11 = objc_msgSend(v9, "aaf_filter:", v15);
  uint64_t v12 = [v11 mutableCopy];
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;
}

uint64_t __75__RemoteUIController__replacePagesOfObjectModel_byObjectModel_sourceArray___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 containsDescendant:*(void *)(a1 + 32)];
  if (result) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  }
  return result;
}

uint64_t __75__RemoteUIController__replacePagesOfObjectModel_byObjectModel_sourceArray___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 containsDescendant:*(void *)(a1 + 32)] ^ 1;
}

- (id)dismissObjectModelsAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(void))a4;
  if (self->_modalNavigationController && [(NSMutableArray *)self->_modalObjectModels count])
  {
    uint64_t v7 = (void *)[(NSMutableArray *)self->_modalObjectModels copy];
    [(RUINavigationController *)self->_modalNavigationController dismissViewControllerAnimated:v4 completion:v6];
    [(RemoteUIController *)self _invalidateModalObjectModels];
  }
  else
  {
    if (v6) {
      v6[2](v6);
    }
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)_invalidateModalObjectModels
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (self->_modalNavigationController && [(NSMutableArray *)self->_modalObjectModels count])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v3 = self->_modalObjectModels;
    uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7++), "setDelegate:", 0, (void)v9);
        }
        while (v5 != v7);
        uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }

    modalNavigationController = self->_modalNavigationController;
    self->_modalNavigationController = 0;

    [(NSMutableArray *)self->_modalObjectModels removeAllObjects];
  }
}

- (void)_modalNavigationWasDismissed
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = [(RemoteUIController *)self loader];
  [v3 cancel];

  if (self->_modalNavigationController)
  {
    uint64_t v4 = (void *)[(NSMutableArray *)self->_modalObjectModels copy];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v5 = [(NSMutableArray *)self->_modalObjectModels reverseObjectEnumerator];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          [v10 setDelegate:0];
          [(RemoteUIController *)self _didRemoveObjectModel:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
      }
      while (v7);
    }

    [(NSMutableArray *)self->_modalObjectModels removeAllObjects];
    modalNavigationController = self->_modalNavigationController;
    self->_modalNavigationController = 0;

    if (_isInternalInstall())
    {
      long long v12 = _RUILoggingFacility();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v4;
        _os_log_impl(&dword_2144F2000, v12, OS_LOG_TYPE_DEFAULT, "Modal navigation was dismissed with objectModels still present: %@", buf, 0xCu);
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      id v15 = objc_loadWeakRetained((id *)&self->_delegate);
      [v15 remoteUIController:self didDismissModalNavigationWithObjectModels:v4];
    }
  }
}

- (void)_modalViewControllerWasPopped:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(RemoteUIController *)self loader];
  [v5 cancel];

  if (_isInternalInstall())
  {
    uint64_t v6 = _RUILoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [(NSMutableArray *)self->_modalObjectModels lastObject];
      int v9 = 138412290;
      long long v10 = v7;
      _os_log_impl(&dword_2144F2000, v6, OS_LOG_TYPE_DEFAULT, "A page from modal object model was popped: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v8 = [(NSMutableArray *)self->_modalObjectModels lastObject];
  [v8 didNavigateBackFromViewController:v4];
}

- (NSArray)displayedPages
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = self->_objectModels;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = [*(id *)(*((void *)&v21 + 1) + 8 * i) displayedPages];
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v6);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v10 = self->_modalObjectModels;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * j), "displayedPages", (void)v17);
        [v3 addObjectsFromArray:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v12);
  }

  return (NSArray *)v3;
}

- (void)_setHandlerWithKey:(id)a3 forElementsMatching:(id)a4 handler:(id)a5
{
  v19[2] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    long long v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"RemoteUIController.m", 643, @"Invalid parameter not satisfying: %@", @"handler != nil" object file lineNumber description];
  }
  if (!self->_elementChangeHandlers)
  {
    uint64_t v12 = (NSMutableDictionary *)objc_opt_new();
    elementChangeHandlers = self->_elementChangeHandlers;
    self->_elementChangeHandlers = v12;
  }
  v18[0] = @"ButtonHandler";
  char v14 = (void *)[v11 copy];
  v18[1] = @"ButtonComparison";
  v19[0] = v14;
  id v15 = (void *)[v10 copy];
  v19[1] = v15;
  long long v16 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  [(NSMutableDictionary *)self->_elementChangeHandlers setObject:v16 forKeyedSubscript:v9];
}

- (void)setHandlerForElementName:(id)a3 handler:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __55__RemoteUIController_setHandlerForElementName_handler___block_invoke;
  v8[3] = &unk_264211398;
  id v9 = v6;
  id v7 = v6;
  [(RemoteUIController *)self _setHandlerWithKey:v7 forElementsMatching:v8 handler:a4];
}

uint64_t __55__RemoteUIController_setHandlerForElementName_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 name];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)setHandlerForElementsMatching:(id)a3 handler:(id)a4
{
  id v6 = (void *)MEMORY[0x263F08C38];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 UUID];
  id v10 = [v9 UUIDString];

  [(RemoteUIController *)self _setHandlerWithKey:v10 forElementsMatching:v8 handler:v7];
  return v10;
}

- (void)removeHandlerForKey:(id)a3
{
}

- (void)setHandlerForButtonsMatching:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __59__RemoteUIController_setHandlerForButtonsMatching_handler___block_invoke;
  v13[3] = &unk_264211EA8;
  id v14 = v6;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __59__RemoteUIController_setHandlerForButtonsMatching_handler___block_invoke_2;
  v11[3] = &unk_264211ED0;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = [(RemoteUIController *)self setHandlerForElementsMatching:v13 handler:v11];
}

uint64_t __59__RemoteUIController_setHandlerForButtonsMatching_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 name];
  uint64_t v4 = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  return v4;
}

void __59__RemoteUIController_setHandlerForButtonsMatching_handler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a4;
  id v8 = a2;
  id v9 = [a3 name];
  (*(void (**)(uint64_t, id, id, id))(v6 + 16))(v6, v8, v9, v7);
}

- (void)setHandlerForButtonName:(id)a3 handler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__RemoteUIController_setHandlerForButtonName_handler___block_invoke;
  v8[3] = &unk_264211ED0;
  id v9 = v6;
  id v7 = v6;
  [(RemoteUIController *)self setHandlerForElementName:a3 handler:v8];
}

void __54__RemoteUIController_setHandlerForButtonName_handler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a4;
  id v8 = a2;
  id v9 = [a3 name];
  (*(void (**)(uint64_t, id, id, id))(v6 + 16))(v6, v8, v9, v7);
}

- (RUILoader)loader
{
  loader = self->_loader;
  if (!loader)
  {
    uint64_t v4 = objc_alloc_init(RUILoader);
    uint64_t v5 = self->_loader;
    self->_loader = v4;

    [(RUIHTTPRequest *)self->_loader setDelegate:self];
    [(RUILoader *)self->_loader setParserDelegate:self];
    [(RUILoader *)self->_loader setStyle:self->_style];
    loader = self->_loader;
  }
  return loader;
}

- (void)loader:(id)a3 didFinishLoadWithError:(id)a4 forRequest:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    id v11 = _RUILoggingFacility();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[RemoteUIController loader:didFinishLoadWithError:forRequest:]((uint64_t)v9, v11);
    }
  }
  id v12 = [(RemoteUIController *)self _objectModelStack];
  uint64_t v13 = [v12 lastObject];
  [v13 stopActivityIndicator];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v15 = objc_opt_respondsToSelector();

  id v16 = objc_loadWeakRetained((id *)&self->_delegate);
  id v17 = v16;
  if (v15)
  {
    [v16 remoteUIController:self didFinishLoadWithError:v9 forRequest:v10];
  }
  else
  {
    char v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) == 0) {
      goto LABEL_10;
    }
    id v17 = objc_loadWeakRetained((id *)&self->_delegate);
    [v17 remoteUIController:self didFinishLoadWithError:v9];
  }

LABEL_10:
  long long v19 = [(RemoteUIController *)self loadCompletion];

  if (v19)
  {
    long long v20 = [(RemoteUIController *)self loadCompletion];
    ((void (**)(void, BOOL, id))v20)[2](v20, v9 == 0, v9);
  }
  id loadCompletion = self->_loadCompletion;
  self->_id loadCompletion = 0;
}

- (void)loader:(id)a3 didReceiveHTTPResponse:(id)a4 forRequest:(id)a5
{
  id v13 = a4;
  id v7 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v9 = objc_opt_respondsToSelector();

  id v10 = objc_loadWeakRetained((id *)&self->_delegate);
  id v11 = v10;
  if (v9)
  {
    [v10 remoteUIController:self didReceiveHTTPResponse:v13 forRequest:v7];
  }
  else
  {
    char v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) == 0) {
      goto LABEL_6;
    }
    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
    [v11 remoteUIController:self didReceiveHTTPResponse:v13];
  }

LABEL_6:
}

- (void)loader:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v11 = a4;
  id v7 = (void (**)(id, uint64_t, void))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    [v10 remoteUIController:self didReceiveChallenge:v11 completionHandler:v7];
  }
  else if (v7)
  {
    v7[2](v7, 1, 0);
  }
}

- (void)loader:(id)a3 loadResourcesForObjectModel:(id)a4 completion:(id)a5
{
  id v9 = a4;
  id v7 = (void (**)(id, uint64_t, void))a5;
  id v8 = [(RemoteUIController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v8 remoteUIController:self loadResourcesForObjectModel:v9 completion:v7];
  }
  else {
    v7[2](v7, 1, 0);
  }
}

- (id)_handleDismissAndReplaceWithActionSignal:(id)a3 objectModel:(id)a4
{
  id v6 = a4;
  id v7 = [v6 defaultPages];
  uint64_t v8 = [v7 count];

  if (!v8)
  {
    id v13 = &__block_literal_global_109;
    goto LABEL_9;
  }
  uint64_t v9 = [(NSMutableArray *)self->_objectModels count];
  id v10 = [(RemoteUIController *)self hostingController];

  if (!v10)
  {
    id v14 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"RemoteUIController.m", 751, @"%s: dismiss+replace requires a hosting controller", "-[RemoteUIController _handleDismissAndReplaceWithActionSignal:objectModel:]");

    if (v9) {
      goto LABEL_4;
    }
LABEL_7:
    id v11 = v17;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    char v12 = __75__RemoteUIController__handleDismissAndReplaceWithActionSignal_objectModel___block_invoke_2;
    goto LABEL_8;
  }
  if (!v9) {
    goto LABEL_7;
  }
LABEL_4:
  id v11 = v18;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  char v12 = __75__RemoteUIController__handleDismissAndReplaceWithActionSignal_objectModel___block_invoke;
LABEL_8:
  v11[2] = v12;
  v11[3] = &unk_264211888;
  void v11[4] = self;
  v11[5] = v6;
  id v13 = _Block_copy(v11);

LABEL_9:
  char v15 = _Block_copy(v13);

  return v15;
}

uint64_t __75__RemoteUIController__handleDismissAndReplaceWithActionSignal_objectModel___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _replaceObjectModelWithObjectModel:*(void *)(a1 + 40)];
}

void __75__RemoteUIController__handleDismissAndReplaceWithActionSignal_objectModel___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _willPresentObjectModel:*(void *)(a1 + 40) modally:0];
  [*(id *)(a1 + 40) setDelegate:*(void *)(a1 + 32)];
  uint64_t v2 = *(void **)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) hostingController];
  uint64_t v4 = [*(id *)(a1 + 32) _shouldAnimate];
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __75__RemoteUIController__handleDismissAndReplaceWithActionSignal_objectModel___block_invoke_3;
  uint64_t v9 = &unk_264211888;
  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = v5;
  [v2 presentInParentViewController:v3 animated:v4 completion:&v6];

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "addObject:", *(void *)(a1 + 40), v6, v7, v8, v9, v10);
}

uint64_t __75__RemoteUIController__handleDismissAndReplaceWithActionSignal_objectModel___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didPresentObjectModel:*(void *)(a1 + 40) modally:0];
}

- (id)_handleDismissWithActionSignal:(id)a3 objectModel:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 subActions];
  uint64_t v9 = [v8 firstObject];

  uint64_t v10 = +[RUIActionSignal signalWithString:v9];
  id v11 = [v6 subActions];
  [v10 setSubActions:v11];

  if (v10)
  {
    char v12 = [v10 subActions];
    [v12 removeObjectAtIndex:0];

    if (_isInternalInstall())
    {
      id v13 = _RUILoggingFacility();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v21 = v10;
        _os_log_impl(&dword_2144F2000, v13, OS_LOG_TYPE_DEFAULT, "dismiss sub-action: %@", buf, 0xCu);
      }
    }
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __65__RemoteUIController__handleDismissWithActionSignal_objectModel___block_invoke;
    aBlock[3] = &unk_264211EF8;
    aBlock[4] = self;
    id v18 = v7;
    id v19 = v10;
    id v14 = _Block_copy(aBlock);
    char v15 = _Block_copy(v14);
  }
  else
  {
    char v15 = [(RemoteUIController *)self _handleDismissAndReplaceWithActionSignal:v6 objectModel:v7];
  }

  return v15;
}

uint64_t __65__RemoteUIController__handleDismissWithActionSignal_objectModel___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) loader:*(void *)(*(void *)(a1 + 32) + 88) receivedObjectModel:*(void *)(a1 + 40) topActionSignal:*(void *)(a1 + 48)];
}

- (void)loader:(id)a3 receivedObjectModel:(id)a4 topActionSignal:(id)a5
{
}

- (void)loader:(id)a3 receivedObjectModel:(id)a4 topActionSignal:(id)a5 completion:(id)a6
{
  uint64_t v145 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6) {
    id v13 = a6;
  }
  else {
    id v13 = &__block_literal_global_112;
  }
  id v14 = (void (**)(void))_Block_copy(v13);
  [v11 setDelegate:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);

  if (!WeakRetained)
  {
    if (_isInternalInstall())
    {
      long long v21 = _RUILoggingFacility();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v12;
        _os_log_impl(&dword_2144F2000, v21, OS_LOG_TYPE_DEFAULT, "Warning: Received action signal %@ with no host controller", buf, 0xCu);
      }
    }
    goto LABEL_11;
  }
  pageOriginatingLoad = self->_pageOriginatingLoad;
  if (!pageOriginatingLoad)
  {
LABEL_18:
    self->_pageOriginatingLoad = 0;

    if (_isInternalInstall())
    {
      uint64_t v22 = _RUILoggingFacility();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        long long v23 = [(RemoteUIController *)self UUID];
        long long v24 = [v23 UUIDString];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v12;
        __int16 v143 = 2112;
        v144 = v24;
        _os_log_impl(&dword_2144F2000, v22, OS_LOG_TYPE_DEFAULT, "Incoming action signal: %@ on RemoteUIController %@", buf, 0x16u);
      }
    }
    if (self->_modalNavigationController)
    {
      [v12 topSignal];
    }
    else
    {
      id v25 = objc_loadWeakRetained((id *)&self->_hostViewController);
      char v26 = [v25 conformsToProtocol:&unk_26C584EB0];

      if ([v12 topSignal] == 2) {
        char v27 = v26;
      }
      else {
        char v27 = 1;
      }
      if ((v27 & 1) == 0)
      {
        if (_isInternalInstall())
        {
          uint64_t v28 = _RUILoggingFacility();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2144F2000, v28, OS_LOG_TYPE_INFO, "Coercing 'push' into 'showModal' for non-nav host controller", buf, 2u);
          }
        }
        [v12 setTopSignal:5];
      }
    }
    id v29 = objc_loadWeakRetained((id *)&self->_delegate);
    char v30 = objc_opt_respondsToSelector();

    if (v30)
    {
      *(void *)buf = 0;
      *(void *)buf = [v12 topSignal];
      id v31 = objc_loadWeakRetained((id *)&self->_delegate);
      [v31 remoteUIController:self didReceiveObjectModel:v11 actionSignal:buf];

      if (*(void *)buf)
      {
        uint64_t v32 = [v12 topSignal];
        if (v32 != *(void *)buf)
        {
          if (_isInternalInstall())
          {
            uint64_t v33 = _RUILoggingFacility();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v140 = 67109120;
              int v141 = *(_DWORD *)buf;
              _os_log_impl(&dword_2144F2000, v33, OS_LOG_TYPE_DEFAULT, "Signal override provided: (%d)", v140, 8u);
            }
          }
          [v12 setTopSignal:*(void *)buf];
        }
      }
    }
    if ([v12 topSignal] == 2 || objc_msgSend(v12, "topSignal") == 5)
    {
      uint64_t v34 = [v11 defaultPages];
      BOOL v35 = [v34 count] == 0;

      if (v35)
      {
        if (_isInternalInstall())
        {
          uint64_t v36 = _RUILoggingFacility();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2144F2000, v36, OS_LOG_TYPE_DEFAULT, "Warning: received an object model with actionSignal push or showModal but no pages.", buf, 2u);
          }
        }
        v37 = [v11 primaryAlert];
        BOOL v38 = v37 == 0;

        if (v38)
        {
          v14[2](v14);
          goto LABEL_75;
        }
        if (_isInternalInstall())
        {
          id v39 = _RUILoggingFacility();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2144F2000, v39, OS_LOG_TYPE_DEFAULT, "Changing action signal back to Alert (was it overridden mistakenly?)", buf, 2u);
          }
        }
        [v12 setTopSignal:7];
      }
    }
    if ([v12 topSignal] == 2)
    {
      modalNavigationController = self->_modalNavigationController;
      if (modalNavigationController)
      {
        uint64_t v41 = modalNavigationController;
      }
      else
      {
        uint64_t v41 = [(RemoteUIController *)self hostingController];
        if (!v41)
        {
          uint64_t v41 = _RUILoggingFacility();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
            -[RemoteUIController loader:receivedObjectModel:topActionSignal:completion:]();
          }
          goto LABEL_73;
        }
      }
      [(RemoteUIController *)self pushObjectModel:v11 animated:[(RemoteUIController *)self _shouldAnimate] completion:v14];
LABEL_73:

LABEL_74:
      objc_initWeak((id *)buf, self);
      v114[0] = MEMORY[0x263EF8330];
      v114[1] = 3221225472;
      v114[2] = __76__RemoteUIController_loader_receivedObjectModel_topActionSignal_completion___block_invoke_149;
      v114[3] = &unk_264211F70;
      objc_copyWeak(&v115, (id *)buf);
      [(RUINavigationController *)self->_modalNavigationController setViewDidDisappearHandler:v114];
      objc_destroyWeak(&v115);
      objc_destroyWeak((id *)buf);
      goto LABEL_75;
    }
    if ([v12 topSignal] == 1)
    {
      v42 = [(RemoteUIController *)self loader];
      [v42 cancel];

      [(RUINavigationController *)self->_modalNavigationController setIsDismissing:1];
      id v43 = [v12 subActions];
      id v44 = [v43 firstObject];
      int v45 = [v44 isEqualToString:@"refresh"];

      v46 = self->_modalNavigationController;
      if (v46) {
        char v47 = 1;
      }
      else {
        char v47 = v45;
      }
      if (v47)
      {
        if (v45)
        {
          if (v46)
          {
            BOOL v48 = [(RemoteUIController *)self _shouldAnimate];
            v135[0] = MEMORY[0x263EF8330];
            v135[1] = 3221225472;
            v135[2] = __76__RemoteUIController_loader_receivedObjectModel_topActionSignal_completion___block_invoke_140;
            v135[3] = &unk_2642119A0;
            v135[4] = self;
            id v136 = v11;
            v137 = v14;
            [(RUINavigationController *)v46 dismissViewControllerAnimated:v48 completion:v135];
            v49 = self->_modalNavigationController;
            self->_modalNavigationController = 0;
          }
          else
          {
            [(RemoteUIController *)self refreshTopModelWithModel:v11];
          }
          v14[2](v14);
        }
        else
        {
          uint64_t v61 = [(RemoteUIController *)self _handleDismissWithActionSignal:v12 objectModel:v11];
          aBlock[0] = MEMORY[0x263EF8330];
          aBlock[1] = 3221225472;
          aBlock[2] = __76__RemoteUIController_loader_receivedObjectModel_topActionSignal_completion___block_invoke_2;
          aBlock[3] = &unk_264211F20;
          aBlock[4] = self;
          id v62 = v61;
          id v133 = v62;
          v134 = v14;
          v63 = (void (**)(void))_Block_copy(aBlock);
          v64 = self->_modalNavigationController;
          BOOL v65 = [(RemoteUIController *)self _shouldAnimate];
          if ([(RemoteUIController *)self _shouldAnimate]) {
            v66 = v63;
          }
          else {
            v66 = 0;
          }
          [(RUINavigationController *)v64 dismissViewControllerAnimated:v65 completion:v66];
          if (![(RemoteUIController *)self _shouldAnimate]) {
            v63[2](v63);
          }
        }
      }
      else
      {
        id v58 = [(RemoteUIController *)self delegate];
        char v59 = objc_opt_respondsToSelector();

        if (v59)
        {
          v60 = [(RemoteUIController *)self delegate];
          [v60 remoteUIControllerDidDismiss:self];

          v14[2](v14);
        }
      }
      goto LABEL_74;
    }
    if ([v12 topSignal] == 4)
    {
      id v50 = [v11 defaultPages];
      BOOL v51 = [v50 count] == 0;

      if (v51)
      {
        id v67 = [(RemoteUIController *)self popObjectModelAnimated:[(RemoteUIController *)self _shouldAnimate]];
        goto LABEL_74;
      }
      uint64_t v52 = 24;
      if (!self->_modalNavigationController) {
        uint64_t v52 = 16;
      }
      id v53 = *(id *)((char *)&self->super.isa + v52);
      id v54 = self->_modalNavigationController;
      if (v54)
      {
        v55 = v54;
      }
      else
      {
        v55 = [(RemoteUIController *)self navigationController];
        if (!v55)
        {
          v86 = _RUILoggingFacility();
          p_super = v86;
          if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
          {
            -[RemoteUIController loader:receivedObjectModel:topActionSignal:completion:]();
            p_super = v86;
          }
          goto LABEL_117;
        }
      }
      v112 = v55;
      if ((unint64_t)[v53 count] > 1)
      {
        v108 = [(RUINavigationController *)v112 topViewController];
        v110 = [v53 lastObject];
        [v110 setDelegate:0];
        [v53 removeLastObject];
        [(RemoteUIController *)self _didRemoveObjectModel:v110];
        v109 = [v53 lastObject];
        [v109 setDelegate:0];
        [v53 removeLastObject];
        [(RemoteUIController *)self _didRemoveObjectModel:v109];
        v72 = [(RUINavigationController *)v112 viewControllers];
        v73 = (void *)[v72 mutableCopy];

        long long v130 = 0u;
        long long v131 = 0u;
        long long v128 = 0u;
        long long v129 = 0u;
        v74 = [v110 displayedPages];
        v75 = [v74 reverseObjectEnumerator];

        uint64_t v76 = [v75 countByEnumeratingWithState:&v128 objects:v139 count:16];
        if (v76)
        {
          uint64_t v77 = *(void *)v129;
          while (1)
          {
            if (*(void *)v129 != v77) {
              objc_enumerationMutation(v75);
            }
            [v73 removeLastObject];
            if (!--v76)
            {
              uint64_t v76 = [v75 countByEnumeratingWithState:&v128 objects:v139 count:16];
              if (!v76) {
                break;
              }
            }
          }
        }

        long long v126 = 0u;
        long long v127 = 0u;
        long long v124 = 0u;
        long long v125 = 0u;
        v78 = [v109 displayedPages];
        v79 = [v78 reverseObjectEnumerator];

        uint64_t v80 = [v79 countByEnumeratingWithState:&v124 objects:v138 count:16];
        if (v80)
        {
          uint64_t v81 = *(void *)v125;
          while (1)
          {
            if (*(void *)v125 != v81) {
              objc_enumerationMutation(v79);
            }
            [v73 removeLastObject];
            if (!--v80)
            {
              uint64_t v80 = [v79 countByEnumeratingWithState:&v124 objects:v138 count:16];
              if (!v80) {
                break;
              }
            }
          }
        }

        [(RemoteUIController *)self _willPresentObjectModel:v11 modally:0];
        v82 = [v11 _firstPageForPresentation];
        [v73 addObject:v82];

        [v73 addObject:v108];
        [(RUINavigationController *)v112 setViewControllers:v73 animated:0];
        [v53 addObject:v11];
        [v11 setDelegate:self];
        id v83 = (id)[(RUINavigationController *)v112 popViewControllerAnimated:[(RemoteUIController *)self _shouldAnimate]];
        [(RemoteUIController *)self _didPresentObjectModel:v11 modally:0];
        v14[2](v14);
      }
      else
      {
        id v71 = _RUILoggingFacility();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR)) {
          -[RemoteUIController loader:receivedObjectModel:topActionSignal:completion:]();
        }
      }
      p_super = &v112->super.super.super.super;
LABEL_117:

      goto LABEL_74;
    }
    if ([v12 topSignal] != 3)
    {
      if ([v12 topSignal] == 8)
      {
        [(RemoteUIController *)self refreshTopModelWithModel:v11];
        v14[2](v14);
      }
      else if ([v12 topSignal] == 5 {
             || [v12 topSignal] == 6
      }
             || [v12 topSignal] == 9)
      {
        [(RemoteUIController *)self _willPresentObjectModel:v11 modally:1];
        uint64_t v68 = [v12 topSignal];
        if (v68 == 9)
        {
          BOOL v69 = 0;
          uint64_t v70 = 2;
        }
        else
        {
          BOOL v69 = [v12 topSignal] == 6;
          uint64_t v70 = v69;
        }
        v113 = self->_modalNavigationController;
        v85 = self->_modalNavigationController;
        if (v85 && [(RUINavigationController *)v85 ruiModalPresentationStyle] != v70)
        {
          [(RUINavigationController *)self->_modalNavigationController setViewDidDisappearHandler:0];
          [(RemoteUIController *)self _invalidateModalObjectModels];
          int v111 = 1;
        }
        else
        {
          int v111 = 0;
        }
        [(NSMutableArray *)self->_modalObjectModels addObject:v11];
        if (self->_modalNavigationController)
        {
          v121[0] = MEMORY[0x263EF8330];
          v121[1] = 3221225472;
          v121[2] = __76__RemoteUIController_loader_receivedObjectModel_topActionSignal_completion___block_invoke_141;
          v121[3] = &unk_2642119A0;
          v121[4] = self;
          id v88 = v11;
          id v122 = v88;
          v123 = v14;
          v89 = _Block_copy(v121);
          objc_msgSend(v88, "presentInParentViewController:animated:completion:", self->_modalNavigationController, -[RemoteUIController _shouldAnimate](self, "_shouldAnimate"), v89);
        }
        else
        {
          v90 = (RUINavigationController *)[v11 newNavigationControllerForPresentation];
          v91 = self->_modalNavigationController;
          self->_modalNavigationController = v90;

          [(RUINavigationController *)self->_modalNavigationController setRuiModalPresentationStyle:v70];
          if (objc_opt_respondsToSelector())
          {
            id v92 = objc_loadWeakRetained((id *)&self->_hostViewController);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              uint64_t v93 = [v92 navigationController];
              v94 = (void *)v93;
              if (v93) {
                v95 = (void *)v93;
              }
              else {
                v95 = v92;
              }
              id v96 = v95;

              id v92 = v96;
            }
            -[RUINavigationController setSupportedInterfaceOrientations:](self->_modalNavigationController, "setSupportedInterfaceOrientations:", [v92 supportedInterfaceOrientations]);
          }
          objc_initWeak((id *)buf, self);
          v97 = self->_modalNavigationController;
          v119[0] = MEMORY[0x263EF8330];
          v119[1] = 3221225472;
          v119[2] = __76__RemoteUIController_loader_receivedObjectModel_topActionSignal_completion___block_invoke_2_145;
          v119[3] = &unk_264211F48;
          objc_copyWeak(&v120, (id *)buf);
          [(RUINavigationController *)v97 setMenuDismissalHandler:v119];
          BOOL v98 = !v69;
          if (v68 == 9) {
            BOOL v98 = 0;
          }
          if (v98)
          {
            v99 = [MEMORY[0x263F82670] currentDevice];
            BOOL v100 = [v99 userInterfaceIdiom] == 1;

            if (v100) {
              uint64_t v101 = 2;
            }
            else {
              uint64_t v101 = -2;
            }
            [(RUINavigationController *)self->_modalNavigationController setModalPresentationStyle:v101];
            [(RUINavigationController *)self->_modalNavigationController setModalInPresentation:1];
          }
          else
          {
            [(RUINavigationController *)self->_modalNavigationController setModalPresentationStyle:4];
            [(RUINavigationController *)self->_modalNavigationController setTransitioningDelegate:self];
          }
          v102 = [(RemoteUIController *)self delegate];
          char v103 = objc_opt_respondsToSelector();

          if (v103)
          {
            v104 = [(RemoteUIController *)self delegate];
            [v104 remoteUIController:self willPresentModalNavigationController:self->_modalNavigationController];
          }
          v116[0] = MEMORY[0x263EF8330];
          v116[1] = 3221225472;
          v116[2] = __76__RemoteUIController_loader_receivedObjectModel_topActionSignal_completion___block_invoke_3;
          v116[3] = &unk_2642119A0;
          v116[4] = self;
          id v117 = v11;
          v118 = v14;
          v105 = _Block_copy(v116);
          v106 = self->_modalNavigationController;
          if (v111) {
            [(RemoteUIController *)self _replaceModalRUIController:v113 byController:v106 completion:v105];
          }
          else {
            [(RemoteUIController *)self _presentModalRUIController:v106 completion:v105];
          }

          objc_destroyWeak(&v120);
          objc_destroyWeak((id *)buf);
        }
      }
      else if ([v12 topSignal] == 7)
      {
        [v11 setDelegate:self];
        v14[2](v14);
      }
      else
      {
        v107 = _RUILoggingFacility();
        if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR)) {
          -[RemoteUIController loader:receivedObjectModel:topActionSignal:completion:].cold.5((uint64_t)v12, v107);
        }

        v14[2](v14);
      }
      goto LABEL_74;
    }
    id v56 = self->_modalNavigationController;
    if (v56)
    {
      v57 = v56;
    }
    else
    {
      v57 = [(RemoteUIController *)self hostingController];
      if (!v57)
      {
        v87 = _RUILoggingFacility();
        if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
          -[RemoteUIController loader:receivedObjectModel:topActionSignal:completion:].cold.4();
        }

        v57 = 0;
        goto LABEL_120;
      }
    }
    [(RemoteUIController *)self _replaceObjectModelWithObjectModel:v11];
LABEL_120:
    v14[2](v14);

    goto LABEL_74;
  }
  id v17 = [(NSMutableArray *)self->_objectModels lastObject];
  id v18 = [v17 visiblePage];
  id v19 = self->_pageOriginatingLoad;

  if (v18 == v19)
  {
    pageOriginatingLoad = self->_pageOriginatingLoad;
    goto LABEL_18;
  }
  if (_isInternalInstall())
  {
    long long v20 = _RUILoggingFacility();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2144F2000, v20, OS_LOG_TYPE_DEFAULT, "Finished loading object model for page no longer being displayed. Ignoring.", buf, 2u);
    }
  }
LABEL_11:
  v14[2](v14);
LABEL_75:
}

uint64_t __76__RemoteUIController_loader_receivedObjectModel_topActionSignal_completion___block_invoke_140(uint64_t a1)
{
  [*(id *)(a1 + 32) refreshTopModelWithModel:*(void *)(a1 + 40)];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

uint64_t __76__RemoteUIController_loader_receivedObjectModel_topActionSignal_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _modalNavigationWasDismissed];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

uint64_t __76__RemoteUIController_loader_receivedObjectModel_topActionSignal_completion___block_invoke_141(uint64_t a1)
{
  [*(id *)(a1 + 32) _didPresentObjectModel:*(void *)(a1 + 40) modally:1];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

void __76__RemoteUIController_loader_receivedObjectModel_topActionSignal_completion___block_invoke_2_145(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && v4 && WeakRetained[3]) {
    [WeakRetained _modalViewControllerWasPopped:v4];
  }
}

uint64_t __76__RemoteUIController_loader_receivedObjectModel_topActionSignal_completion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _didPresentObjectModel:*(void *)(a1 + 40) modally:1];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

void __76__RemoteUIController_loader_receivedObjectModel_topActionSignal_completion___block_invoke_149(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [v6 parentViewController];
  if (v4 || ([v6 navigationController], (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    uint64_t v5 = [v6 presentingViewController];

    if (!v5) {
      [WeakRetained _modalNavigationWasDismissed];
    }
  }
}

- (void)_replaceModalRUIController:(id)a3 byController:(id)a4 completion:(id)a5
{
  id v14 = a4;
  id v8 = a5;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  [v14 setHostViewController:WeakRetained];

  id v11 = objc_loadWeakRetained((id *)&self->_hostViewController);
  int v12 = [v11 conformsToProtocol:&unk_26C591348];

  if (v12)
  {
    id v13 = objc_loadWeakRetained((id *)&self->_hostViewController);
    [v13 replaceModalRUIController:v9 byController:v14 completion:v8];

    id v8 = v13;
  }
  else
  {
    objc_msgSend(v9, "dismissViewControllerAnimated:completion:", -[RemoteUIController _shouldAnimate](self, "_shouldAnimate"), 0);

    [(RemoteUIController *)self _presentModalRUIController:self->_modalNavigationController completion:v8];
  }
}

- (void)_presentModalRUIController:(id)a3 completion:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  [v12 setHostViewController:WeakRetained];

  id v8 = objc_loadWeakRetained((id *)&self->_hostViewController);
  int v9 = [v8 conformsToProtocol:&unk_26C591348];

  id v10 = objc_loadWeakRetained((id *)&self->_hostViewController);
  id v11 = v10;
  if (v9) {
    [v10 presentModalRUIController:v12 completion:v6];
  }
  else {
    objc_msgSend(v10, "presentViewController:animated:completion:", v12, -[RemoteUIController _shouldAnimate](self, "_shouldAnimate"), v6);
  }
}

- (void)refreshTopModelWithModel:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(RemoteUIController *)self _objectModelStack];
  id v6 = [v5 lastObject];

  id v7 = [v4 identifier];
  id v8 = [v6 identifier];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    [v6 refreshWithObjectModel:v4];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = objc_loadWeakRetained((id *)&self->_delegate);
      [v12 remoteUIController:self didRefreshObjectModel:v6];
    }
  }
  else if (_isInternalInstall())
  {
    id v13 = _RUILoggingFacility();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v4 identifier];
      char v15 = [v6 identifier];
      int v16 = 138412546;
      id v17 = v14;
      __int16 v18 = 2112;
      id v19 = v15;
      _os_log_impl(&dword_2144F2000, v13, OS_LOG_TYPE_DEFAULT, "Refresh action detected, but identifiers did not match; New: <%@> Old: <%@>",
        (uint8_t *)&v16,
        0x16u);
    }
  }
}

- (id)sessionConfigurationForLoader:(id)a3
{
  return self->_sessionConfiguration;
}

- (void)loader:(id)a3 willLoadRequest:(id)a4 redirectResponse:(id)a5 completionHandler:(id)a6
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(RemoteUIController *)self _objectModelStack];
  id v14 = [v13 lastObject];

  [v14 startActivityIndicator];
  if (!v12)
  {
    char v27 = [MEMORY[0x263F08690] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"RemoteUIController.m", 1126, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  if (_isInternalInstall())
  {
    char v15 = _RUILoggingFacility();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = [v10 URL];
      *(_DWORD *)buf = 138412290;
      uint64_t v33 = v16;
      _os_log_impl(&dword_2144F2000, v15, OS_LOG_TYPE_DEFAULT, "RUIController sending delegate redirect call for URL %@", buf, 0xCu);
    }
  }
  id v17 = (void *)[v10 mutableCopy];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v19 = objc_opt_respondsToSelector();

  id v20 = objc_loadWeakRetained((id *)&self->_delegate);
  if ((v19 & 1) == 0)
  {
    char v21 = objc_opt_respondsToSelector();

    id v22 = objc_loadWeakRetained((id *)&self->_delegate);
    long long v23 = v22;
    if (v21)
    {
      int v24 = [v22 remoteUIController:self shouldLoadRequest:v17 redirectResponse:v11];

      if (!v24)
      {
        [v14 stopActivityIndicator];
        (*((void (**)(id, void, void))v12 + 2))(v12, 0, 0);
        goto LABEL_15;
      }
    }
    else
    {
      char v25 = objc_opt_respondsToSelector();

      if (v25)
      {
        id v26 = objc_loadWeakRetained((id *)&self->_delegate);
        [v26 remoteUIController:self willLoadRequest:v17];
      }
    }
    (*((void (**)(id, void *, void))v12 + 2))(v12, v17, 0);
    goto LABEL_15;
  }
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __80__RemoteUIController_loader_willLoadRequest_redirectResponse_completionHandler___block_invoke;
  v28[3] = &unk_264211900;
  id v31 = v12;
  id v29 = v17;
  id v30 = v14;
  [v20 remoteUIController:self shouldLoadRequest:v29 redirectResponse:v11 withCompletionHandler:v28];

LABEL_15:
}

void __80__RemoteUIController_loader_willLoadRequest_redirectResponse_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (!a2) {
    [*(id *)(a1 + 40) stopActivityIndicator];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)parser:(id)a3 createPageWithName:(id)a4 attributes:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
    id v12 = [v11 remoteUIController:self createPageWithName:v7 attributes:v8];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)parentViewControllerForObjectModel:(id)a3
{
  id v4 = a3;
  if ([(NSMutableArray *)self->_objectModels containsObject:v4])
  {
    id v5 = [(RemoteUIController *)self navigationController];
LABEL_5:
    id v6 = v5;
    goto LABEL_7;
  }
  if ([(NSMutableArray *)self->_modalObjectModels containsObject:v4])
  {
    id v5 = self->_modalNavigationController;
    goto LABEL_5;
  }
  id v6 = 0;
LABEL_7:

  return v6;
}

- (id)viewControllerForAlertPresentation
{
  modalNavigationController = self->_modalNavigationController;
  if (modalNavigationController) {
    id WeakRetained = modalNavigationController;
  }
  else {
    id WeakRetained = (RUINavigationController *)objc_loadWeakRetained((id *)&self->_hostViewController);
  }
  return WeakRetained;
}

- (id)visibleElementWithIdentifier:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v5 = self->_objectModels;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v23;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = [*(id *)(*((void *)&v22 + 1) + 8 * v9) visiblePage];
        id v11 = [v10 subElementWithID:v4];

        if (v11) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v5 = self->_modalObjectModels;
      uint64_t v12 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v19;
LABEL_12:
        uint64_t v15 = 0;
        while (1)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v5);
          }
          int v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v15), "visiblePage", (void)v18);
          id v11 = [v16 subElementWithID:v4];

          if (v11) {
            break;
          }
          if (v13 == ++v15)
          {
            uint64_t v13 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
            if (v13) {
              goto LABEL_12;
            }
            goto LABEL_18;
          }
        }
      }
      else
      {
LABEL_18:
        id v11 = 0;
      }
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)objectModel:(id)a3 didNavigateBackFromController:(id)a4 withGesture:(BOOL)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a4;
  if (_isInternalInstall())
  {
    uint64_t v9 = _RUILoggingFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      id v21 = v8;
      _os_log_impl(&dword_2144F2000, v9, OS_LOG_TYPE_DEFAULT, "Object model navigated back from %@", (uint8_t *)&v20, 0xCu);
    }
  }
  uint64_t v10 = 24;
  if (!self->_modalNavigationController) {
    uint64_t v10 = 16;
  }
  id v11 = *(id *)((char *)&self->super.isa + v10);
  uint64_t v12 = [(RemoteUIController *)self loader];
  [v12 cancel];

  uint64_t v13 = [v11 lastObject];
  uint64_t v14 = [v13 displayedPages];
  uint64_t v15 = [v14 count];
  if (v15 == 1)
  {
    id v5 = [v13 displayedPages];
    uint64_t v16 = [v5 lastObject];
    if ((id)v16 == v8)
    {

LABEL_15:
      if (_isInternalInstall())
      {
        long long v19 = _RUILoggingFacility();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = 138412290;
          id v21 = v13;
          _os_log_impl(&dword_2144F2000, v19, OS_LOG_TYPE_DEFAULT, "Object model has no more pages, popping: %@", (uint8_t *)&v20, 0xCu);
        }
      }
      [v11 removeLastObject];
      [(RemoteUIController *)self _didRemoveObjectModel:v13];
      goto LABEL_20;
    }
    uint64_t v6 = (void *)v16;
  }
  id v17 = [v13 displayedPages];
  uint64_t v18 = [v17 count];

  if (v15 == 1)
  {
  }
  if (!v18) {
    goto LABEL_15;
  }
LABEL_20:
}

- (unint64_t)supportedInterfaceOrientationsForObjectModel:(id)a3 page:(id)a4
{
  return 30;
}

- (void)objectModel:(id)a3 elementDidChange:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RemoteUIController *)self loader];
  [v8 cancel];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v9 = self->_objectModels;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v34;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v33 + 1) + 8 * v13);
        id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        [v14 populatePostbackDictionary:v15];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v11);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v16 = self->_modalObjectModels;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v30;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v30 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = *(void **)(*((void *)&v29 + 1) + 8 * v20);
        id v22 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        [v21 populatePostbackDictionary:v22];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v18);
  }

  elementChangeHandlers = self->_elementChangeHandlers;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __51__RemoteUIController_objectModel_elementDidChange___block_invoke;
  v26[3] = &unk_264211F98;
  id v27 = v7;
  id v28 = v6;
  id v24 = v6;
  id v25 = v7;
  [(NSMutableDictionary *)elementChangeHandlers enumerateKeysAndObjectsUsingBlock:v26];
}

void __51__RemoteUIController_objectModel_elementDidChange___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKey:@"ButtonComparison"];
  id v6 = (void *)v5;
  if (v5 && (*(unsigned int (**)(uint64_t, void))(v5 + 16))(v5, *(void *)(a1 + 32)))
  {
    id v7 = [v4 objectForKey:@"ButtonHandler"];
    if (v7)
    {
      if (_isInternalInstall())
      {
        id v8 = _RUILoggingFacility();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = [*(id *)(a1 + 32) name];
          int v14 = 138412290;
          id v15 = v9;
          _os_log_impl(&dword_2144F2000, v8, OS_LOG_TYPE_DEFAULT, "Calling handler for element named '%@'", (uint8_t *)&v14, 0xCu);
        }
      }
      uint64_t v12 = a1 + 32;
      uint64_t v10 = *(void **)(a1 + 32);
      uint64_t v11 = *(void *)(v12 + 8);
      uint64_t v13 = [v10 attributes];
      ((void (**)(void, uint64_t, void *, void *))v7)[2](v7, v11, v10, v13);
    }
  }
}

- (void)objectModel:(id)a3 willLoadLinkURL:(id)a4 attributes:(id)a5
{
  id v10 = a5;
  uint64_t v6 = [v10 objectForKeyedSubscript:@"url"];
  if (v6)
  {
    id v7 = (void *)v6;
    id v8 = [v10 objectForKeyedSubscript:@"startSMSAutoFill"];
    int v9 = [v8 BOOLValue];

    if (v9) {
      [(RemoteUIController *)self _beginListeningForSMSAutoFill];
    }
  }
}

- (void)objectModel:(id)a3 pressedLink:(id)a4 httpMethod:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a4;
  uint64_t v13 = [a5 lowercaseString];
  LODWORD(a4) = [v13 isEqualToString:@"post"];

  if (a4)
  {
    int v14 = [v10 postbackData];
  }
  else
  {
    int v14 = 0;
  }
  id v15 = [(NSMutableArray *)self->_objectModels lastObject];
  uint64_t v16 = [v15 visiblePage];
  pageOriginatingLoad = self->_pageOriginatingLoad;
  self->_pageOriginatingLoad = v16;

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __68__RemoteUIController_objectModel_pressedLink_httpMethod_completion___block_invoke;
  void v19[3] = &unk_2642112B0;
  v19[4] = self;
  id v20 = v11;
  id v18 = v11;
  [(RemoteUIController *)self _loadURL:v12 postBody:v14 fromObjectModel:v10 completion:v19];
}

void __68__RemoteUIController_objectModel_pressedLink_httpMethod_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v7 = v5;
  if ((a2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_stopListeningForSMSAutoFill", v5);
    id v5 = v7;
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);
    id v5 = v7;
  }
}

- (BOOL)objectModel:(id)a3 shouldDisplayNamedElement:(id)a4 page:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(RemoteUIController *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    uint64_t v13 = [(RemoteUIController *)self delegate];
    char v14 = [v13 remoteUIController:self objectModel:v8 shouldDisplayNamedElement:v9 page:v10];
  }
  else
  {
    char v14 = 1;
  }

  return v14;
}

- (BOOL)_objectModelPageWantsHSATokens:(id)a3
{
  id v3 = a3;
  id v4 = [v3 attributes];
  id v5 = [v4 objectForKeyedSubscript:@"tokenReceivedFunction"];
  if ([v5 length])
  {
    char v6 = 1;
  }
  else if ([v3 hasPasscodeView])
  {
    id v7 = [v3 passcodeViewOM];
    id v8 = [v7 attributes];
    id v9 = [v8 objectForKeyedSubscript:@"SMSAutoFill"];
    char v6 = [v9 BOOLValue];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)_objectModel:(id)a3 receivedToken:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (_isInternalInstall())
  {
    id v8 = _RUILoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v7;
      _os_log_impl(&dword_2144F2000, v8, OS_LOG_TYPE_DEFAULT, "Got an autofill token: %@", buf, 0xCu);
    }
  }
  id v9 = [(RemoteUIController *)self parentViewControllerForObjectModel:v6];
  id v10 = [v9 presentedViewController];

  if (v10)
  {
    if (_isInternalInstall())
    {
      id v11 = _RUILoggingFacility();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2144F2000, v11, OS_LOG_TYPE_DEFAULT, "Skipping autofill as an alert or other modal is currently presented", buf, 2u);
      }
    }
    goto LABEL_30;
  }
  char v12 = [v6 visiblePage];
  uint64_t v13 = [v12 attributes];
  char v14 = [v13 objectForKeyedSubscript:@"tokenReceivedFunction"];
  uint64_t v15 = [v14 length];

  if (v15)
  {
    if (_isInternalInstall())
    {
      uint64_t v16 = _RUILoggingFacility();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2144F2000, v16, OS_LOG_TYPE_DEFAULT, "Calling token received function", buf, 2u);
      }
    }
    uint64_t v17 = [v6 visiblePage];
    id v18 = [v17 attributes];
    uint64_t v19 = [v18 objectForKeyedSubscript:@"tokenReceivedFunction"];
    id v30 = v7;
    id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v30 count:1];
    id v21 = (id)[v6 invokeScriptFunction:v19 withArguments:v20];

LABEL_16:
    [(RemoteUIController *)self _stopListeningForSMSAutoFill];
    goto LABEL_30;
  }
  id v22 = [v6 visiblePage];
  if ([v22 hasPasscodeView])
  {
    long long v23 = [v6 visiblePage];
    id v24 = [v23 passcodeViewOM];
    id v25 = [v24 attributes];
    id v26 = [v25 objectForKeyedSubscript:@"SMSAutoFill"];
    int v29 = [v26 BOOLValue];

    if (v29)
    {
      if (_isInternalInstall())
      {
        id v27 = _RUILoggingFacility();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2144F2000, v27, OS_LOG_TYPE_DEFAULT, "Autofilling passcodeview", buf, 2u);
        }
      }
      uint64_t v17 = [v6 visiblePage];
      id v18 = [v17 passcodeViewOM];
      [v18 autofillWithToken:v7];
      goto LABEL_16;
    }
  }
  else
  {
  }
  if (_isInternalInstall())
  {
    id v28 = _RUILoggingFacility();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2144F2000, v28, OS_LOG_TYPE_DEFAULT, "Saving autofill token for later", buf, 2u);
    }
  }
  objc_storeStrong((id *)&self->_SMSAutoFillToken, a4);
LABEL_30:
}

- (void)_beginListeningForSMSAutoFill
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = objc_msgSend(NSString, "stringWithUTF8String:", "void RUIHSAAuthenticationRegisterIncomingAuthenticationTokenBlockWithIdentifier(__strong HSAAuthenticationClientIncomingAuthenticationTokenBlock, CFStringRef)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"RemoteUIController.m", 43, @"%s", dlerror());

  __break(1u);
}

uint64_t __51__RemoteUIController__beginListeningForSMSAutoFill__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  _beginListeningForSMSAutoFill_hasTelephony = result;
  return result;
}

void __51__RemoteUIController__beginListeningForSMSAutoFill__block_invoke_241(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__RemoteUIController__beginListeningForSMSAutoFill__block_invoke_2;
  v8[3] = &unk_264211888;
  void v8[4] = *(void *)(a1 + 32);
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

void __51__RemoteUIController__beginListeningForSMSAutoFill__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = 24;
  if (!*(void *)(v2 + 8)) {
    uint64_t v3 = 16;
  }
  id v4 = [*(id *)(v2 + v3) lastObject];
  [*(id *)(a1 + 32) _objectModel:v4 receivedToken:*(void *)(a1 + 40)];
}

- (void)_stopListeningForSMSAutoFill
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"void RUIHSAAuthenticationUnregisterIncomingAuthenticationTokenBlockWithIdentifier(CFStringRef)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"RemoteUIController.m", 44, @"%s", dlerror());

  __break(1u);
}

- (void)startListeningForHSATokenAutoFill
{
  if (!self->_listeningForSMSIdentifier)
  {
    if (_isInternalInstall())
    {
      uint64_t v3 = _RUILoggingFacility();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v4 = 0;
        _os_log_impl(&dword_2144F2000, v3, OS_LOG_TYPE_DEFAULT, "Manually starting to listen for HSA tokens...", v4, 2u);
      }
    }
    [(RemoteUIController *)self _beginListeningForSMSAutoFill];
  }
}

- (void)stopListeningForHSATokenAutoFill
{
  if (self->_listeningForSMSIdentifier)
  {
    [(RemoteUIController *)self _stopListeningForSMSAutoFill];
    if (_isInternalInstall())
    {
      uint64_t v2 = _RUILoggingFacility();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v3 = 0;
        _os_log_impl(&dword_2144F2000, v2, OS_LOG_TYPE_DEFAULT, "Manually stopped listening for HSA tokens", v3, 2u);
      }
    }
  }
}

- (BOOL)isListeningForHSATokenAutoFill
{
  return self->_listeningForSMSIdentifier != 0;
}

- (void)setNavigationController:(id)a3
{
}

- (UINavigationController)navigationController
{
  p_hostViewController = &self->_hostViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    id v5 = objc_loadWeakRetained((id *)p_hostViewController);
  }
  else {
    id v5 = 0;
  }
  return (UINavigationController *)v5;
}

- (id)hostingController
{
  p_hostViewController = &self->_hostViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  int v4 = [WeakRetained conformsToProtocol:&unk_26C584EB0];

  if (v4) {
    id v5 = objc_loadWeakRetained((id *)p_hostViewController);
  }
  else {
    id v5 = 0;
  }
  return v5;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v9 = [v7 ruiModalPresentationStyle];
  }
  else {
    uint64_t v9 = 1;
  }
  id v10 = [RUIModalPresentationController alloc];
  id v11 = [(RemoteUIController *)self style];
  char v12 = [(RUIModalPresentationController *)v10 initWithPresentedViewController:v7 presentingViewController:v8 modalPresentationStyle:v9 style:v11];

  [(RUIModalPresentationController *)v12 setDelegate:self];
  return v12;
}

- (UIViewController)hostViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setHostViewController:(id)a3
{
}

- (void)setLoader:(id)a3
{
}

- (NSString)userAgentString
{
  return self->_userAgentString;
}

- (void)setUserAgentString:(id)a3
{
}

- (RemoteUIControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RemoteUIControllerDelegate *)WeakRetained;
}

- (id)loadCompletion
{
  return self->_loadCompletion;
}

- (void)setLoadCompletion:(id)a3
{
}

- (NSURLSessionConfiguration)sessionConfiguration
{
  return self->_sessionConfiguration;
}

- (void)setSessionConfiguration:(id)a3
{
}

- (RUIStyle)style
{
  return self->_style;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_sessionConfiguration, 0);
  objc_storeStrong(&self->_loadCompletion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_userAgentString, 0);
  objc_storeStrong((id *)&self->_loader, 0);
  objc_destroyWeak((id *)&self->_hostViewController);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_SMSAutoFillToken, 0);
  objc_storeStrong((id *)&self->_listeningForSMSIdentifier, 0);
  objc_storeStrong((id *)&self->_pageOriginatingLoad, 0);
  objc_storeStrong((id *)&self->_elementChangeHandlers, 0);
  objc_storeStrong((id *)&self->_modalObjectModels, 0);
  objc_storeStrong((id *)&self->_objectModels, 0);
  objc_storeStrong((id *)&self->_modalNavigationController, 0);
}

- (void)_replacePagesOfObjectModel:byObjectModel:sourceArray:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2144F2000, v0, v1, "New Object Model is nil, cannot insert object", v2, v3, v4, v5, v6);
}

- (void)_replacePagesOfObjectModel:byObjectModel:sourceArray:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2144F2000, v0, v1, "firstPageIndex is NSNOTFound, cannot insert object", v2, v3, v4, v5, v6);
}

- (void)loader:(uint64_t)a1 didFinishLoadWithError:(NSObject *)a2 forRequest:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2144F2000, a2, OS_LOG_TYPE_ERROR, "Loader failed with error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)loader:receivedObjectModel:topActionSignal:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2144F2000, v0, v1, "Push action with no nav controller", v2, v3, v4, v5, v6);
}

- (void)loader:receivedObjectModel:topActionSignal:completion:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2144F2000, v0, v1, "Pop action with no navigation controller", v2, v3, v4, v5, v6);
}

- (void)loader:receivedObjectModel:topActionSignal:completion:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2144F2000, v0, v1, "Pop + Replace requires at least 2 existing object models.", v2, v3, v4, v5, v6);
}

- (void)loader:receivedObjectModel:topActionSignal:completion:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2144F2000, v0, v1, "Replace action with no navigation controller", v2, v3, v4, v5, v6);
}

- (void)loader:(uint64_t)a1 receivedObjectModel:(NSObject *)a2 topActionSignal:completion:.cold.5(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2144F2000, a2, OS_LOG_TYPE_ERROR, "Warning: Received unknown signal %@", (uint8_t *)&v2, 0xCu);
}

@end