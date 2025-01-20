@interface RUIObjectModel
+ (id)objectModelForXMLNamed:(id)a3;
+ (void)_enableTestMode;
- (BOOL)_shouldDisplayNamedElement:(id)a3 page:(id)a4;
- (BOOL)goBack;
- (BOOL)goBack:(BOOL)a3;
- (BOOL)hasAttributeOrAttributeFunctionNamed:(id)a3 withAttributes:(id)a4;
- (BOOL)hasConfirmationAttributes:(id)a3;
- (BOOL)hasSecondConfirmationAttributes:(id)a3;
- (BOOL)prepareScriptContext;
- (BOOL)tableViewOM:(id)a3 deleteRowAtIndexPath:(id)a4;
- (BOOL)validateWithFunction:(id)a3;
- (BOOL)webViewOM:(id)a3 shouldStartLoadWithRequest:(id)a4 navigationType:(int64_t)a5;
- (Class)customFooterClassForSection:(id)a3;
- (Class)customHeaderClassForSection:(id)a3;
- (Class)customTableCellClassForTableViewRow:(id)a3;
- (NSArray)allPages;
- (NSArray)defaultPages;
- (NSArray)displayedPages;
- (NSArray)pages;
- (NSDictionary)alert;
- (NSDictionary)clientInfo;
- (NSDictionary)namedPages;
- (NSDictionary)serverInfo;
- (NSDictionary)updateInfo;
- (NSString)authPasswordEquivalent;
- (NSString)authPasswordFieldID;
- (NSString)description;
- (NSString)idOfObjectModelToReplace;
- (NSString)identifier;
- (NSString)identifierMarkingStackRemovalAfterPush;
- (NSString)inlineScript;
- (NSString)name;
- (NSString)refreshURL;
- (NSString)validationFunction;
- (NSURL)scriptURL;
- (NSURL)sourceURL;
- (OpaqueJSContext)jsContextRef;
- (RUIAlertView)primaryAlert;
- (RUIElement)activeElement;
- (RUIElement)elementForActivityIndicator;
- (RUIObjectModel)init;
- (RUIObjectModelDelegate)delegate;
- (RUIPage)visiblePage;
- (RUIStyle)style;
- (id)_firstPageForPresentation;
- (id)_pageContainingTableView:(id)a3;
- (id)_parentNavigationController;
- (id)_parentViewController;
- (id)_viewControllerFromNavigatingBackWithinDisplayedPagesAnimated:(BOOL)a3;
- (id)absoluteURLWithString:(id)a3;
- (id)alertController;
- (id)alertWithName:(id)a3;
- (id)elementForActivityIndicatorAnchorId:(id)a3;
- (id)elementForActivityIndicatorWithActivatedElement:(id)a3;
- (id)elementForActivityIndicatorWithAttributes:(id)a3;
- (id)elementsWithName:(id)a3;
- (id)invokeScriptFunction:(id)a3 withArguments:(id)a4;
- (id)newNavigationControllerForPresentation;
- (id)objectForJSValue:(OpaqueJSValue *)a3;
- (id)postbackData;
- (id)postbackDictionary;
- (id)relativeURLWithString:(id)a3;
- (id)rowForFormField:(id)a3;
- (id)stringForAttributeName:(id)a3 withAttributes:(id)a4;
- (id)subElementWithID:(id)a3;
- (id)tableFooterViewForAttributes:(id)a3;
- (id)tableHeaderViewForAttributes:(id)a3;
- (id)textInRowWithIdentifier:(id)a3;
- (int)refreshDelay;
- (int64_t)nextButtonStyle;
- (unint64_t)supportedInterfaceOrientationsForRUIPage:(id)a3;
- (void)RUIPage:(id)a3 pressedNavBarButton:(id)a4;
- (void)RUIPage:(id)a3 toggledEditing:(BOOL)a4;
- (void)_displayNamedPage:(id)a3 animated:(BOOL)a4;
- (void)_displaySupplementalPage:(id)a3;
- (void)_handleElementChange:(id)a3 completion:(id)a4;
- (void)_handleLinkPress:(id)a3 attributes:(id)a4 completion:(id)a5;
- (void)_logException:(OpaqueJSValue *)a3;
- (void)_navigateBackWithPop:(BOOL)a3 fromViewController:(id)a4;
- (void)_navigateToNextPageAnimated;
- (void)_populatePageNavItem:(id)a3 withNextButton:(BOOL)a4;
- (void)_populateRequest:(id)a3;
- (void)_presentConfirmationWithAttributes:(id)a3 completion:(id)a4;
- (void)_presentSecondConfirmationWithAttributes:(id)a3 completion:(id)a4;
- (void)_startNavigationBarSpinnerIfNeededForAttributes:(id)a3;
- (void)_stopNavigationBarSpinnerIfNeededForAttributes:(id)a3;
- (void)_unsafe_setPages:(id)a3;
- (void)activateElement:(id)a3 completion:(id)a4;
- (void)addAlertElement:(id)a3;
- (void)alertView:(id)a3 pressedButton:(id)a4 completion:(id)a5;
- (void)back:(id)a3;
- (void)cleanupRefreshTimer;
- (void)configureRow:(id)a3;
- (void)configureSection:(id)a3;
- (void)configureTableView:(id)a3;
- (void)dealloc;
- (void)didNavigateBackFromViewController:(id)a3;
- (void)handleAppleIDAuthenticationIfNeededForAttributes:(id)a3 completion:(id)a4;
- (void)handleElementChange:(id)a3 action:(int)a4 completion:(id)a5;
- (void)initializeSwift;
- (void)jsInterfaceForElementId:(id)a3;
- (void)navigateToNextPageAnimated:(BOOL)a3;
- (void)notifyXMLUIDataChange;
- (void)openLink:(id)a3 HTTPMethod:(id)a4 attributes:(id)a5 completion:(id)a6;
- (void)openLink:(id)a3 HTTPMethod:(id)a4 completion:(id)a5;
- (void)pageDidDisappear:(id)a3;
- (void)parseDidFinish;
- (void)passcodeViewOM:(id)a3 activatedElement:(id)a4 completion:(id)a5;
- (void)populatePostbackDictionary:(id)a3;
- (void)presentConfirmationIfNeededForElement:(id)a3 completion:(id)a4;
- (void)presentInParentViewController:(id)a3 animated:(BOOL)a4;
- (void)presentInParentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentPage:(id)a3 inViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)presentWithBlock:(id)a3;
- (void)refreshTimeout;
- (void)refreshWithObjectModel:(id)a3;
- (void)remoteUIWebViewController:(id)a3 dismissWithPayload:(id)a4;
- (void)remoteUIWebViewControllerDidDismiss:(id)a3;
- (void)runScript;
- (void)setActivityIndicatorStatus:(BOOL)a3 forElement:(id)a4;
- (void)setAlert:(id)a3;
- (void)setAuthPasswordEquivalent:(id)a3;
- (void)setAuthPasswordFieldID:(id)a3;
- (void)setClientInfo:(id)a3;
- (void)setDecodingUserInfo:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIdOfObjectModelToReplace:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIdentifierMarkingStackRemovalAfterPush:(id)a3;
- (void)setInlineScript:(id)a3;
- (void)setJSGlobalContext:(OpaqueJSContext *)a3;
- (void)setName:(id)a3;
- (void)setNextButtonStyle:(int64_t)a3;
- (void)setPages:(id)a3;
- (void)setRefreshDelay:(int)a3;
- (void)setRefreshURL:(id)a3;
- (void)setScriptURL:(id)a3;
- (void)setServerInfo:(id)a3;
- (void)setSourceURL:(id)a3;
- (void)setStyle:(id)a3;
- (void)setUpdateInfo:(id)a3;
- (void)setValidationFunction:(id)a3;
- (void)showModalWebViewWithLinkURL:(id)a3 dismissButtonLabel:(id)a4 dismissButtonAlignment:(id)a5 scaleToFit:(BOOL)a6 loadCompletion:(id)a7 dismissHandler:(id)a8;
- (void)startActivityIndicator;
- (void)startActivityIndicatorForElement:(id)a3;
- (void)startActivityIndicatorWithAttributes:(id)a3;
- (void)startNavigationBarSpinnerWithTitle:(id)a3;
- (void)stopActivityIndicator;
- (void)stopNavigationBarSpinner;
- (void)tableViewOM:(id)a3 elementDidChange:(id)a4 action:(int)a5 completion:(id)a6;
- (void)tableViewOMDidChange:(id)a3;
- (void)tableViewOMSubmitForm:(id)a3;
@end

@implementation RUIObjectModel

+ (void)_enableTestMode
{
  gAnimatedNavigationTransitions = 1;
}

- (RUIObjectModel)init
{
  v16.receiver = self;
  v16.super_class = (Class)RUIObjectModel;
  v2 = [(RUIObjectModel *)&v16 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    namedAlerts = v2->_namedAlerts;
    v2->_namedAlerts = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    defaultPages = v2->_defaultPages;
    v2->_defaultPages = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    displayedPages = v2->_displayedPages;
    v2->_displayedPages = (NSMutableArray *)v7;

    uint64_t v9 = objc_opt_new();
    namedPages = v2->_namedPages;
    v2->_namedPages = (NSMutableDictionary *)v9;

    uint64_t v11 = objc_opt_new();
    httpHeaders = v2->_httpHeaders;
    v2->_httpHeaders = (NSMutableDictionary *)v11;

    uint64_t v13 = objc_opt_new();
    updateInfo = v2->_updateInfo;
    v2->_updateInfo = (NSDictionary *)v13;

    [(RUIObjectModel *)v2 initializeSwift];
  }
  return v2;
}

- (void)cleanupRefreshTimer
{
  [(NSTimer *)self->_refreshTimer invalidate];
  refreshTimer = self->_refreshTimer;
  self->_refreshTimer = 0;
}

- (void)dealloc
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v3 = self->_defaultPages;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v9 = [v8 objectModel];

        if (v9 == self) {
          [v8 setObjectModel:0];
        }
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v5);
  }

  v10 = [(NSMutableDictionary *)self->_namedPages allValues];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v18 + 1) + 8 * j);
        objc_super v16 = [v15 objectModel];

        if (v16 == self) {
          [v15 setObjectModel:0];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v12);
  }
  [(RUIObjectModel *)self setJSGlobalContext:0];
  [(RUIObjectModel *)self cleanupRefreshTimer];

  v17.receiver = self;
  v17.super_class = (Class)RUIObjectModel;
  [(RUIObjectModel *)&v17 dealloc];
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(RUIObjectModel *)self identifier];
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p ID '%@', Source: %@\nDisplayed Pages: %@ Default Pages: %@ Named Pages: %@>", v4, self, v5, self->_sourceURL, self->_displayedPages, self->_defaultPages, self->_namedPages];

  return (NSString *)v6;
}

+ (id)objectModelForXMLNamed:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a3;
  uint64_t v5 = [v3 mainBundle];
  uint64_t v6 = [v5 URLForResource:v4 withExtension:@"xml"];

  uint64_t v7 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v6];
  v8 = [[RUIParser alloc] initWithXML:v7 baseURL:v6 delegate:0];
  uint64_t v9 = [(RUIParser *)v8 uiObjectModel];
  [v9 setName:v4];

  return v9;
}

- (void)parseDidFinish
{
  self->_parseFinished = 1;
  id v3 = [(RUIObjectModel *)self style];
  [v3 applyToObjectModel:self];
}

- (void)_populatePageNavItem:(id)a3 withNextButton:(BOOL)a4
{
  BOOL v4 = a4;
  id v23 = a3;
  uint64_t v6 = [v23 navigationItem];
  uint64_t v7 = v6;
  if (v4)
  {
    v8 = [v6 rightBarButtonItem];

    if (!v8)
    {
      id v9 = objc_alloc(MEMORY[0x263F824A8]);
      v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v11 = [v10 localizedStringForKey:@"NEXT" value:&stru_26C545B50 table:@"Localizable"];
      uint64_t v12 = (void *)[v9 initWithTitle:v11 style:self->_nextButtonStyle target:self action:sel__navigateToNextPageAnimated];

      [v7 setRightBarButtonItem:v12];
    }
  }
  id v13 = objc_alloc(MEMORY[0x263F824A8]);
  v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v15 = [v14 localizedStringForKey:@"BACK" value:&stru_26C545B50 table:@"Localizable"];
  objc_super v16 = (void *)[v13 initWithTitle:v15 style:0 target:self action:sel_back_];
  [v7 setBackBarButtonItem:v16];

  objc_super v17 = [v23 backButtonTitle];

  if (v17)
  {
    long long v18 = [v7 backBarButtonItem];
    uint64_t v19 = [v23 backButtonTitle];
  }
  else
  {
    long long v20 = [v23 navTitle];
    uint64_t v21 = [v20 length];

    if (!v21) {
      goto LABEL_9;
    }
    long long v18 = [v7 backBarButtonItem];
    uint64_t v19 = [v23 navTitle];
  }
  long long v22 = (void *)v19;
  [v18 setTitle:v19];

LABEL_9:
}

- (void)refreshTimeout
{
  if (_isInternalInstall())
  {
    id v3 = _RUILoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v4 = 0;
      _os_log_impl(&dword_2144F2000, v3, OS_LOG_TYPE_DEFAULT, "Refresh page from timeout", v4, 2u);
    }
  }
  [(RUIObjectModel *)self _handleLinkPress:self->_refreshURL attributes:&unk_26C557F20 completion:0];
  [(RUIObjectModel *)self cleanupRefreshTimer];
}

- (id)_firstPageForPresentation
{
  self->_currentPage = 0;
  uint64_t v3 = [(NSMutableArray *)self->_defaultPages count];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = [(NSMutableArray *)self->_defaultPages objectAtIndex:0];
    [(NSMutableArray *)self->_displayedPages addObject:v5];
    [(RUIObjectModel *)self _populatePageNavItem:v5 withNextButton:v4 != 1];
    int refreshDelay = self->_refreshDelay;
    if (refreshDelay >= 1)
    {
      if (self->_refreshTimer)
      {
        [(RUIObjectModel *)self cleanupRefreshTimer];
        int refreshDelay = self->_refreshDelay;
      }
      uint64_t v7 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel_refreshTimeout selector:0 userInfo:0 repeats:(double)refreshDelay];
      refreshTimer = self->_refreshTimer;
      self->_refreshTimer = v7;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (void)presentWithBlock:(id)a3
{
  uint64_t v7 = (void (**)(void))a3;
  if (!v7)
  {
    uint64_t v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"RUIObjectModel.m", 219, @"Invalid parameter not satisfying: %@", @"block != nil" object file lineNumber description];
  }
  id v5 = [(RUIObjectModel *)self _firstPageForPresentation];
  v7[2]();
}

- (void)presentInParentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(RUIObjectModel *)self _firstPageForPresentation];
  [(RUIObjectModel *)self presentPage:v10 inViewController:v9 animated:v5 completion:v8];
}

- (void)presentInParentViewController:(id)a3 animated:(BOOL)a4
{
}

- (void)presentPage:(id)a3 inViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v11 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a6;
  if (v11)
  {
    if (v10 && v7) {
      [v11 addDidAppearBlock:v10];
    }
    [v9 pushViewController:v11 animated:v7];
    if (v10 && !v7) {
      v10[2](v10);
    }
  }
}

- (id)newNavigationControllerForPresentation
{
  uint64_t v3 = [(RUIObjectModel *)self _firstPageForPresentation];
  if (v3)
  {
    uint64_t v4 = [[RUINavigationController alloc] initWithRootViewController:v3];
    BOOL v5 = [(RUIObjectModel *)self style];
    [(RUINavigationController *)v4 setStyle:v5];

    uint64_t v6 = [(RUIObjectModel *)self style];
    [v6 applyToNavigationController:v4];

    if (+[RUIPlatform isAppleTV]) {
      [(RUINavigationController *)v4 setModalTransitionStyle:2];
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)_parentViewController
{
  uint64_t v3 = [(RUIObjectModel *)self primaryAlert];

  if (!v3
    || (id v4 = objc_loadWeakRetained((id *)&self->_delegate),
        char v5 = objc_opt_respondsToSelector(),
        v4,
        (v5 & 1) == 0)
    || (id v6 = objc_loadWeakRetained((id *)&self->_delegate),
        [v6 viewControllerForAlertPresentation],
        BOOL v7 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    BOOL v7 = [WeakRetained parentViewControllerForObjectModel:self];
  }
  return v7;
}

- (id)_parentNavigationController
{
  v2 = [(RUIObjectModel *)self _parentViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (void)_displaySupplementalPage:(id)a3
{
  p_delegate = &self->_delegate;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  id v6 = [WeakRetained parentViewControllerForObjectModel:self];
  [v6 pushViewController:v7 animated:(gAnimatedNavigationTransitions & 1) == 0];

  [(NSMutableArray *)self->_displayedPages addObject:v7];
}

- (void)_displayNamedPage:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  displayedPages = self->_displayedPages;
  id v7 = a3;
  [(NSMutableArray *)displayedPages addObject:v7];
  [(RUIObjectModel *)self _populatePageNavItem:v7 withNextButton:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v8 = [WeakRetained parentViewControllerForObjectModel:self];
  [v8 pushViewController:v7 animated:v4];
}

- (void)pageDidDisappear:(id)a3
{
  id v9 = a3;
  id v4 = [(RUIObjectModel *)self visiblePage];
  if (v4 == v9)
  {
    [(NSMutableArray *)self->_displayedPages removeLastObject];
    char v5 = [v9 parentPage];

    if (v5)
    {
      [v9 _updateParentPage];
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        id v8 = objc_loadWeakRetained((id *)&self->_delegate);
        [v8 objectModel:self didNavigateBackFromController:v9 withGesture:1];
      }
    }
  }
}

- (void)_navigateBackWithPop:(BOOL)a3 fromViewController:(id)a4
{
  BOOL v4 = a3;
  id v19 = a4;
  id v6 = [(RUIObjectModel *)self visiblePage];
  char v7 = [v6 parentPage];

  if (v7)
  {
    if (v4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      id v9 = [WeakRetained parentViewControllerForObjectModel:self];
      id v10 = (id)[v9 popViewControllerAnimated:(gAnimatedNavigationTransitions & 1) == 0];
    }
    [(NSMutableArray *)self->_displayedPages removeLastObject];
    [v6 _updateParentPage];
  }
  else
  {
    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      uint64_t v13 = (uint64_t)v19;
      if (!v19 && v4)
      {
        uint64_t v13 = [(RUIObjectModel *)self _viewControllerFromNavigatingBackWithinDisplayedPagesAnimated:(gAnimatedNavigationTransitions & 1) == 0];
      }
      id v19 = (id)v13;
      if (v4 && !v13)
      {
        id v14 = objc_loadWeakRetained((id *)&self->_delegate);
        v15 = [v14 parentViewControllerForObjectModel:self];
        [v15 popViewControllerAnimated:(gAnimatedNavigationTransitions & 1) == 0];
        id v19 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v16 = objc_loadWeakRetained((id *)&self->_delegate);
      [v16 objectModel:self didNavigateBackFromController:v19 withGesture:0];
    }
    else
    {
      id v17 = objc_loadWeakRetained((id *)&self->_delegate);
      char v18 = objc_opt_respondsToSelector();

      if ((v18 & 1) == 0) {
        goto LABEL_16;
      }
      id v16 = objc_loadWeakRetained((id *)&self->_delegate);
      [v16 objectModelPressedBack:self];
    }
  }
LABEL_16:
}

- (void)didNavigateBackFromViewController:(id)a3
{
}

- (void)back:(id)a3
{
}

- (id)_viewControllerFromNavigatingBackWithinDisplayedPagesAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ((unint64_t)[(NSMutableArray *)self->_displayedPages count] < 2)
  {
    char v7 = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v6 = [WeakRetained parentViewControllerForObjectModel:self];
    char v7 = [v6 popViewControllerAnimated:v3];

    id v8 = [(NSMutableArray *)self->_displayedPages lastObject];
    if (v8 == v7)
    {
      id v9 = [v7 pageID];
      uint64_t v10 = [v9 length];

      if (!v10) {
        --self->_currentPage;
      }
      [(NSMutableArray *)self->_displayedPages removeLastObject];
    }
  }
  return v7;
}

- (BOOL)goBack
{
  return [(RUIObjectModel *)self goBack:1];
}

- (BOOL)goBack:(BOOL)a3
{
  BOOL v3 = [(RUIObjectModel *)self _viewControllerFromNavigatingBackWithinDisplayedPagesAnimated:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)postbackData
{
  v2 = (void *)MEMORY[0x263F08AC0];
  BOOL v3 = [(RUIObjectModel *)self postbackDictionary];
  BOOL v4 = [v2 dataWithPropertyList:v3 format:100 options:0 error:0];

  return v4;
}

- (void)populatePostbackDictionary:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  char v5 = self->_displayedPages;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v9++), "populatePostbackDictionary:", v4, (void)v16);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  if (self->_updateInfo) {
    objc_msgSend(v4, "addEntriesFromDictionary:");
  }
  uint64_t v10 = [(RUIObjectModel *)self authPasswordEquivalent];
  if (v10)
  {
    id v11 = (void *)v10;
    char v12 = [(RUIObjectModel *)self authPasswordFieldID];

    if (v12)
    {
      uint64_t v13 = [(RUIObjectModel *)self authPasswordEquivalent];
      id v14 = [(RUIObjectModel *)self authPasswordFieldID];
      [v4 setObject:v13 forKey:v14];
    }
  }
  serverInfo = self->_serverInfo;
  if (serverInfo) {
    [v4 setObject:serverInfo forKey:@"serverInfo"];
  }
}

- (void)setUpdateInfo:(id)a3
{
  objc_storeStrong((id *)&self->_updateInfo, a3);
  [(RUIObjectModel *)self notifyXMLUIDataChange];
}

- (id)postbackDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [(RUIObjectModel *)self populatePostbackDictionary:v3];
  return v3;
}

- (void)_populateRequest:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  char v5 = self->_httpHeaders;
  uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_httpHeaders, "objectForKeyedSubscript:", v10, (void)v12);
        [v4 setValue:v11 forHTTPHeaderField:v10];
      }
      uint64_t v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)refreshWithObjectModel:(id)a3
{
  id v4 = (id *)a3;
  char v5 = [v4 identifier];
  uint64_t v6 = [(RUIObjectModel *)self identifier];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    uint64_t v8 = [v4 serverInfo];
    [(RUIObjectModel *)self setServerInfo:v8];

    uint64_t v9 = [v4 clientInfo];
    [(RUIObjectModel *)self setClientInfo:v9];

    objc_storeStrong((id *)&self->_namedAlerts, v4[19]);
    namedAlerts = self->_namedAlerts;
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __41__RUIObjectModel_refreshWithObjectModel___block_invoke;
    v39[3] = &unk_264211B10;
    v39[4] = self;
    [(NSMutableDictionary *)namedAlerts enumerateKeysAndObjectsUsingBlock:v39];
    id v11 = [v4 primaryAlert];
    primaryAlert = self->_primaryAlert;
    self->_primaryAlert = v11;

    [(RUIAlertView *)self->_primaryAlert setObjectModel:self];
    long long v13 = [(RUIObjectModel *)self visiblePage];
    long long v14 = [v13 tableViewOM];
    long long v15 = [v14 tableView];
    [v15 contentOffset];
    double v17 = v16;

    long long v18 = [(RUIObjectModel *)self displayedPages];
    long long v19 = (void *)[v18 copy];

    uint64_t currentPage = self->_currentPage;
    self->_uint64_t currentPage = -1;
    uint64_t v21 = [(RUIObjectModel *)self _parentNavigationController];
    long long v22 = [v21 viewControllers];
    id v23 = (void *)[v22 mutableCopy];

    [v23 removeObjectsInArray:v19];
    [v21 setViewControllers:v23 animated:0];
    long long v24 = [v4 allPages];
    [(RUIObjectModel *)self _unsafe_setPages:v24];

    long long v25 = [v4 defaultPages];
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __41__RUIObjectModel_refreshWithObjectModel___block_invoke_2;
    v38[3] = &unk_264211B38;
    v38[4] = self;
    v38[5] = currentPage;
    [v25 enumerateObjectsUsingBlock:v38];

    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __41__RUIObjectModel_refreshWithObjectModel___block_invoke_3;
    v35[3] = &unk_264211B60;
    v36 = v4;
    v37 = self;
    [v19 enumerateObjectsUsingBlock:v35];
    v26 = [(RUIObjectModel *)self _parentViewController];
    v27 = [v26 view];
    [v27 layoutBelowIfNeeded];

    uint64_t v28 = [(RUIObjectModel *)self visiblePage];
    v29 = [v28 tableViewOM];
    v30 = [v29 tableView];

    [v30 contentSize];
    double v32 = v31;
    [v30 bounds];
    float v33 = v32 - CGRectGetHeight(v40);
    float v34 = v17;
    objc_msgSend(v30, "setContentOffset:animated:", 0, 0.0, fminf(fmaxf(v33, 0.0), v34));
  }
}

uint64_t __41__RUIObjectModel_refreshWithObjectModel___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setObjectModel:*(void *)(a1 + 32)];
}

uint64_t __41__RUIObjectModel_refreshWithObjectModel___block_invoke_2(uint64_t result, uint64_t a2, unint64_t a3, unsigned char *a4)
{
  if (*(void *)(result + 40) >= a3) {
    return [*(id *)(result + 32) navigateToNextPageAnimated:0];
  }
  *a4 = 1;
  return result;
}

void __41__RUIObjectModel_refreshWithObjectModel___block_invoke_3(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 pageID];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) namedPages];
    char v5 = [v7 pageID];
    uint64_t v6 = [v4 objectForKeyedSubscript:v5];

    if (v6) {
      [*(id *)(a1 + 40) _displayNamedPage:v6 animated:0];
    }
  }
}

- (NSArray)displayedPages
{
  return (NSArray *)self->_displayedPages;
}

- (RUIPage)visiblePage
{
  v2 = [(RUIObjectModel *)self displayedPages];
  id v3 = [v2 lastObject];

  return (RUIPage *)v3;
}

- (NSArray)pages
{
  NSLog(&cfstr_UiobjectmodelP.isa, a2);
  defaultPages = self->_defaultPages;
  return (NSArray *)defaultPages;
}

- (NSArray)allPages
{
  id v3 = objc_alloc(MEMORY[0x263EFF980]);
  id v4 = [(RUIObjectModel *)self defaultPages];
  char v5 = (void *)[v3 initWithArray:v4];

  uint64_t v6 = [(RUIObjectModel *)self namedPages];
  id v7 = [v6 allValues];
  [v5 addObjectsFromArray:v7];

  return (NSArray *)v5;
}

- (void)setPages:(id)a3
{
  id v6 = a3;
  if ([(NSMutableArray *)self->_displayedPages count])
  {
    char v5 = [MEMORY[0x263F08690] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"RUIObjectModel.m" lineNumber:529 description:@"Cannot change RUIObjectModel pages once they are displayed"];
  }
  [(RUIObjectModel *)self _unsafe_setPages:v6];
}

- (void)_unsafe_setPages:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(NSMutableDictionary *)self->_namedPages removeAllObjects];
  [(NSMutableArray *)self->_defaultPages removeAllObjects];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        objc_msgSend(v10, "setObjectModel:", self, (void)v19);
        id v11 = [v10 pageID];
        uint64_t v12 = [v11 length];

        if (v12)
        {
          namedPages = self->_namedPages;
          long long v14 = [v10 pageID];
          [(NSMutableDictionary *)namedPages setObject:v10 forKey:v14];
        }
        long long v15 = [v10 pageID];
        if (![v15 length])
        {

LABEL_12:
          [(NSMutableArray *)self->_defaultPages addObject:v10];
          continue;
        }
        double v16 = [v10 attributes];
        double v17 = [v16 objectForKeyedSubscript:@"default"];
        int v18 = [v17 BOOLValue];

        if (v18) {
          goto LABEL_12;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }
}

- (void)setStyle:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = (RUIStyle *)a3;
  if (self->_style != v5)
  {
    objc_storeStrong((id *)&self->_style, a3);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = [(RUIObjectModel *)self allPages];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * i) setStyle:v5];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }

    if (self->_parseFinished) {
      [(RUIStyle *)v5 applyToObjectModel:self];
    }
  }
}

- (NSDictionary)alert
{
  return [(RUIElement *)self->_primaryAlert attributes];
}

- (id)alertController
{
  v2 = [(RUIObjectModel *)self primaryAlert];
  id v3 = [v2 alertController];

  return v3;
}

- (void)addAlertElement:(id)a3
{
  id v10 = a3;
  [v10 setObjectModel:self];
  id v4 = [v10 identifier];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    namedAlerts = self->_namedAlerts;
    primaryAlert = [v10 attributes];
    uint64_t v8 = [primaryAlert objectForKeyedSubscript:@"id"];
    [(NSMutableDictionary *)namedAlerts setObject:v10 forKey:v8];
  }
  else
  {
    uint64_t v9 = (RUIAlertView *)v10;
    primaryAlert = self->_primaryAlert;
    self->_primaryAlert = v9;
  }
}

- (RUIAlertView)primaryAlert
{
  return self->_primaryAlert;
}

- (void)configureTableView:(id)a3
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v7 = [(RUIObjectModel *)self visiblePage];
    [v6 objectModel:self configureTableView:v8 page:v7];
  }
}

- (void)configureRow:(id)a3
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v7 = [(RUIObjectModel *)self visiblePage];
    [v6 objectModel:self configureTableRow:v8 page:v7];
  }
}

- (void)configureSection:(id)a3
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v7 = [(RUIObjectModel *)self visiblePage];
    [v6 objectModel:self configureTableSection:v8 page:v7];
  }
}

- (Class)customHeaderClassForSection:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    id v8 = [v7 objectModel:self customHeaderClassForSection:v4];
  }
  else
  {
    id v8 = 0;
  }

  return (Class)v8;
}

- (Class)customFooterClassForSection:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    id v8 = [v7 objectModel:self customFooterClassForSection:v4];
  }
  else
  {
    id v8 = 0;
  }

  return (Class)v8;
}

- (Class)customTableCellClassForTableViewRow:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    id v8 = [v7 objectModel:self customTableCellClassForTableViewRow:v4];
  }
  else
  {
    id v8 = 0;
  }

  return (Class)v8;
}

- (id)tableHeaderViewForAttributes:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    id v8 = [(RUIObjectModel *)self visiblePage];
    uint64_t v9 = [v7 objectModel:self tableHeaderViewForAttributes:v4 page:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)tableFooterViewForAttributes:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    id v8 = [(RUIObjectModel *)self visiblePage];
    uint64_t v9 = [v7 objectModel:self tableFooterViewForAttributes:v4 page:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)rowForFormField:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  char v5 = self->_displayedPages;
  uint64_t v26 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v26)
  {
    uint64_t v6 = *(void *)v43;
    id v33 = v4;
    uint64_t v28 = v5;
    uint64_t v25 = *(void *)v43;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v43 != v6) {
          objc_enumerationMutation(v5);
        }
        uint64_t v27 = v7;
        id v8 = [*(id *)(*((void *)&v42 + 1) + 8 * v7) tableViewOM];
        uint64_t v9 = [v8 sections];

        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        obuint64_t j = v9;
        uint64_t v31 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
        if (v31)
        {
          uint64_t v30 = *(void *)v39;
          while (2)
          {
            for (uint64_t i = 0; i != v31; ++i)
            {
              if (*(void *)v39 != v30) {
                objc_enumerationMutation(obj);
              }
              long long v11 = [*(id *)(*((void *)&v38 + 1) + 8 * i) rows];
              long long v34 = 0u;
              long long v35 = 0u;
              long long v36 = 0u;
              long long v37 = 0u;
              id v12 = v11;
              uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v46 count:16];
              if (v13)
              {
                uint64_t v14 = v13;
                uint64_t v15 = *(void *)v35;
                uint64_t v32 = i;
LABEL_13:
                uint64_t v16 = 0;
                while (1)
                {
                  if (*(void *)v35 != v15) {
                    objc_enumerationMutation(v12);
                  }
                  double v17 = *(void **)(*((void *)&v34 + 1) + 8 * v16);
                  int v18 = [v17 attributes];
                  long long v19 = [v18 objectForKey:@"postback"];
                  if ([v19 isEqualToString:v4]) {
                    break;
                  }
                  long long v20 = [v17 attributes];
                  long long v21 = [v20 objectForKey:@"id"];
                  char v22 = [v21 isEqualToString:v4];

                  if (v22) {
                    goto LABEL_22;
                  }
                  ++v16;
                  id v4 = v33;
                  if (v14 == v16)
                  {
                    uint64_t v14 = [v12 countByEnumeratingWithState:&v34 objects:v46 count:16];
                    uint64_t i = v32;
                    if (v14) {
                      goto LABEL_13;
                    }
                    goto LABEL_20;
                  }
                }

LABEL_22:
                id v23 = v17;

                uint64_t i = v32;
                id v4 = v33;
                if (!v23) {
                  continue;
                }

                char v5 = v28;
                goto LABEL_30;
              }
LABEL_20:
            }
            uint64_t v31 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
            if (v31) {
              continue;
            }
            break;
          }
        }

        uint64_t v7 = v27 + 1;
        char v5 = v28;
        uint64_t v6 = v25;
      }
      while (v27 + 1 != v26);
      id v23 = 0;
      uint64_t v26 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v26);
  }
  else
  {
    id v23 = 0;
  }
LABEL_30:

  return v23;
}

- (id)absoluteURLWithString:(id)a3
{
  if (self->_sourceURL) {
    objc_msgSend(NSURL, "URLWithString:relativeToURL:", a3);
  }
  else {
  id v3 = [NSURL URLWithString:a3];
  }
  return v3;
}

- (id)relativeURLWithString:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (_isInternalInstall())
  {
    char v5 = _RUILoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      uint64_t v9 = "-[RUIObjectModel relativeURLWithString:]";
      _os_log_impl(&dword_2144F2000, v5, OS_LOG_TYPE_DEFAULT, "Using deprecating method %s", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v6 = [(RUIObjectModel *)self absoluteURLWithString:v4];

  return v6;
}

- (id)elementsWithName:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [(RUIObjectModel *)self allPages];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) elementsWithName:v4];
        [v5 addObjectsFromArray:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)startNavigationBarSpinnerWithTitle:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  if (a3) {
    id v4 = (__CFString *)a3;
  }
  else {
    id v4 = &stru_26C545B50;
  }
  uint64_t v10 = @"titleLoadingMessage";
  v11[0] = v4;
  char v5 = NSDictionary;
  id v6 = a3;
  uint64_t v7 = [v5 dictionaryWithObjects:v11 forKeys:&v10 count:1];

  [(RUIObjectModel *)self _startNavigationBarSpinnerIfNeededForAttributes:v7];
  uint64_t v8 = [(RUIObjectModel *)self visiblePage];
  uint64_t v9 = [v8 view];
  [v9 setUserInteractionEnabled:0];
}

- (void)stopNavigationBarSpinner
{
  [(RUIObjectModel *)self _stopNavigationBarSpinnerIfNeededForAttributes:&unk_26C557F48];
  id v4 = [(RUIObjectModel *)self visiblePage];
  id v3 = [v4 view];
  [v3 setUserInteractionEnabled:1];
}

- (void)_startNavigationBarSpinnerIfNeededForAttributes:(id)a3
{
  id v16 = a3;
  id v4 = [v16 objectForKeyedSubscript:@"activityIndicatorAnchorId"];
  char v5 = [(RUIObjectModel *)self elementForActivityIndicatorAnchorId:v4];

  if (!v5)
  {
    char v5 = [(RUIObjectModel *)self elementForActivityIndicatorWithActivatedElement:self->_activeElement];
  }
  uint64_t v6 = [v16 objectForKeyedSubscript:@"titleLoadingMessage"];
  uint64_t v7 = (void *)v6;
  if (v5) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v6 == 0;
  }
  if (!v8)
  {
    uint64_t v9 = [(RUIObjectModel *)self _parentViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [v9 topViewController];

      uint64_t v9 = (void *)v10;
    }
    long long v11 = [v9 navigationItem];
    id v12 = +[RUINavBarSpinnerManager sharedSpinnerManager];
    long long v13 = [(RUIObjectModel *)self style];
    objc_msgSend(v12, "setActivityIndicatorViewStyle:", objc_msgSend(v13, "navBarActivityIndicatorStyle"));

    long long v14 = +[RUINavBarSpinnerManager sharedSpinnerManager];
    long long v15 = [(RUIObjectModel *)self visiblePage];
    objc_msgSend(v14, "startAnimatingInNavItem:title:forIdentifier:hideBackButton:hideLeftItems:", v11, v7, @"RemoteUI", 1, objc_msgSend(v15, "navBarIndicatorHidesLeftButton"));
  }
}

- (void)_stopNavigationBarSpinnerIfNeededForAttributes:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"titleLoadingMessage"];

  if (v3)
  {
    id v4 = +[RUINavBarSpinnerManager sharedSpinnerManager];
    [v4 stopAnimatingForIdentifier:@"RemoteUI"];
  }
}

- (void)startActivityIndicator
{
  id v2 = [(RUIObjectModel *)self visiblePage];
  [v2 setLoading:1];
}

- (void)stopActivityIndicator
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(RUIObjectModel *)self allPages];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v8 isLoading]) {
          [v8 setLoading:0];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [(RUIElement *)self->_elementForActivityIndicator stopActivityIndicator];
  elementForActivityIndicator = self->_elementForActivityIndicator;
  self->_elementForActivityIndicator = 0;
}

- (BOOL)hasAttributeOrAttributeFunctionNamed:(id)a3 withAttributes:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 stringByAppendingString:@"Function"];
  BOOL v8 = [v5 objectForKeyedSubscript:v6];

  if ([v8 length])
  {
    BOOL v9 = 1;
  }
  else
  {
    long long v10 = [v5 objectForKeyedSubscript:v7];
    BOOL v9 = [v10 length] != 0;
  }
  return v9;
}

- (id)stringForAttributeName:(id)a3 withAttributes:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (__CFString *)a4;
  BOOL v8 = [v6 stringByAppendingString:@"Function"];
  BOOL v9 = [(__CFString *)v7 objectForKeyedSubscript:v8];
  uint64_t v10 = [v9 length];

  if (v10)
  {
    long long v11 = [(__CFString *)v7 objectForKeyedSubscript:v8];

    uint64_t v7 = [(RUIObjectModel *)self invokeScriptFunction:v11 withArguments:0];

    objc_opt_class();
    long long v12 = &stru_26C545B50;
    if ((objc_opt_isKindOfClass() & 1) != 0 && [(__CFString *)v7 length]) {
      long long v12 = v7;
    }
    long long v13 = v12;
  }
  else
  {
    long long v13 = [(__CFString *)v7 objectForKeyedSubscript:v6];
  }
  long long v14 = v13;

  return v14;
}

- (BOOL)hasConfirmationAttributes:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(RUIObjectModel *)self hasAttributeOrAttributeFunctionNamed:@"confirmationTitle" withAttributes:v4]&& [(RUIObjectModel *)self hasAttributeOrAttributeFunctionNamed:@"confirmationBody" withAttributes:v4]&& [(RUIObjectModel *)self hasAttributeOrAttributeFunctionNamed:@"confirmationCancel" withAttributes:v4]&& [(RUIObjectModel *)self hasAttributeOrAttributeFunctionNamed:@"confirmationOK" withAttributes:v4];

  return v5;
}

- (BOOL)hasSecondConfirmationAttributes:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(RUIObjectModel *)self hasAttributeOrAttributeFunctionNamed:@"secondConfirmationTitle" withAttributes:v4]&& [(RUIObjectModel *)self hasAttributeOrAttributeFunctionNamed:@"secondConfirmationBody" withAttributes:v4]&& [(RUIObjectModel *)self hasAttributeOrAttributeFunctionNamed:@"secondConfirmationCancel" withAttributes:v4]&& [(RUIObjectModel *)self hasAttributeOrAttributeFunctionNamed:@"secondConfirmationOK" withAttributes:v4];

  return v5;
}

- (void)presentConfirmationIfNeededForElement:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v6 attributes];
  BOOL v9 = [(RUIObjectModel *)self hasConfirmationAttributes:v8];

  if (v9)
  {
    uint64_t v10 = [v6 attributes];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    void v11[2] = __67__RUIObjectModel_presentConfirmationIfNeededForElement_completion___block_invoke;
    v11[3] = &unk_264211BB0;
    v11[4] = self;
    id v12 = v6;
    id v13 = v7;
    [(RUIObjectModel *)self _presentConfirmationWithAttributes:v10 completion:v11];
  }
  else if (v7)
  {
    (*((void (**)(id, void, uint64_t))v7 + 2))(v7, 0, 1);
  }
}

void __67__RUIObjectModel_presentConfirmationIfNeededForElement_completion___block_invoke(uint64_t a1, int a2)
{
  if (a2
    && (id v3 = *(void **)(a1 + 32),
        [*(id *)(a1 + 40) attributes],
        id v4 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v3) = [v3 hasSecondConfirmationAttributes:v4],
        v4,
        v3))
  {
    BOOL v5 = *(void **)(a1 + 32);
    id v6 = [*(id *)(a1 + 40) attributes];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __67__RUIObjectModel_presentConfirmationIfNeededForElement_completion___block_invoke_2;
    v9[3] = &unk_264211B88;
    id v10 = *(id *)(a1 + 48);
    [v5 _presentSecondConfirmationWithAttributes:v6 completion:v9];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7)
    {
      BOOL v8 = *(void (**)(void))(v7 + 16);
      v8();
    }
  }
}

uint64_t __67__RUIObjectModel_presentConfirmationIfNeededForElement_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, 1, a2);
  }
  return result;
}

- (void)_presentConfirmationWithAttributes:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(RUIObjectModel *)self stringForAttributeName:@"confirmationTitle" withAttributes:v7];
  uint64_t v9 = [(RUIObjectModel *)self stringForAttributeName:@"confirmationBody" withAttributes:v7];
  id v10 = [(RUIObjectModel *)self stringForAttributeName:@"confirmationOK" withAttributes:v7];
  long long v11 = [(RUIObjectModel *)self stringForAttributeName:@"confirmationCancel" withAttributes:v7];
  id v12 = [v7 objectForKey:@"confirmationOKIsDestructive"];
  int v13 = [v12 BOOLValue];

  long long v14 = [(RUIObjectModel *)self _parentNavigationController];
  uint64_t v15 = [v7 objectForKeyedSubscript:@"confirmationIsSheet"];

  LODWORD(v7) = [v15 BOOLValue];
  if (v7)
  {
    id v16 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v17 = [v16 userInterfaceIdiom];

    BOOL v18 = (v17 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  }
  else
  {
    BOOL v18 = 1;
  }
  uint64_t v28 = (void *)v8;
  long long v19 = objc_msgSend(MEMORY[0x263F82418], "alertControllerWithTitle:message:preferredStyle:", v8, v9, v18, v9);
  long long v20 = (void *)MEMORY[0x263F82400];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __64__RUIObjectModel__presentConfirmationWithAttributes_completion___block_invoke;
  v31[3] = &unk_264211BD8;
  id v21 = v6;
  id v32 = v21;
  char v22 = [v20 actionWithTitle:v11 style:1 handler:v31];
  if (v13)
  {
    uint64_t v23 = 2;
  }
  else
  {
    [v19 addAction:v22];
    uint64_t v23 = 0;
  }
  uint64_t v24 = (void *)MEMORY[0x263F82400];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __64__RUIObjectModel__presentConfirmationWithAttributes_completion___block_invoke_2;
  v29[3] = &unk_264211BD8;
  id v30 = v21;
  id v25 = v21;
  uint64_t v26 = [v24 actionWithTitle:v10 style:v23 handler:v29];
  [v19 addAction:v26];

  if (v13) {
    [v19 addAction:v22];
  }
  [v14 presentViewController:v19 animated:1 completion:0];
}

uint64_t __64__RUIObjectModel__presentConfirmationWithAttributes_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __64__RUIObjectModel__presentConfirmationWithAttributes_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)_presentSecondConfirmationWithAttributes:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(RUIObjectModel *)self stringForAttributeName:@"secondConfirmationTitle" withAttributes:v7];
  uint64_t v9 = [(RUIObjectModel *)self stringForAttributeName:@"secondConfirmationBody" withAttributes:v7];
  id v10 = [(RUIObjectModel *)self stringForAttributeName:@"secondConfirmationOK" withAttributes:v7];
  long long v11 = [(RUIObjectModel *)self stringForAttributeName:@"secondConfirmationCancel" withAttributes:v7];
  id v12 = [v7 objectForKey:@"secondConfirmationOKIsDestructive"];
  int v13 = [v12 BOOLValue];

  long long v14 = [(RUIObjectModel *)self _parentNavigationController];
  uint64_t v15 = [v7 objectForKeyedSubscript:@"secondConfirmationIsSheet"];

  LODWORD(v7) = [v15 BOOLValue];
  if (v7)
  {
    id v16 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v17 = [v16 userInterfaceIdiom];

    BOOL v18 = (v17 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  }
  else
  {
    BOOL v18 = 1;
  }
  uint64_t v28 = (void *)v8;
  long long v19 = objc_msgSend(MEMORY[0x263F82418], "alertControllerWithTitle:message:preferredStyle:", v8, v9, v18, v9);
  long long v20 = (void *)MEMORY[0x263F82400];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __70__RUIObjectModel__presentSecondConfirmationWithAttributes_completion___block_invoke;
  v31[3] = &unk_264211BD8;
  id v21 = v6;
  id v32 = v21;
  char v22 = [v20 actionWithTitle:v11 style:1 handler:v31];
  if (v13)
  {
    uint64_t v23 = 2;
  }
  else
  {
    [v19 addAction:v22];
    uint64_t v23 = 0;
  }
  uint64_t v24 = (void *)MEMORY[0x263F82400];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __70__RUIObjectModel__presentSecondConfirmationWithAttributes_completion___block_invoke_2;
  v29[3] = &unk_264211BD8;
  id v30 = v21;
  id v25 = v21;
  uint64_t v26 = [v24 actionWithTitle:v10 style:v23 handler:v29];
  [v19 addAction:v26];

  if (v13) {
    [v19 addAction:v22];
  }
  [v14 presentViewController:v19 animated:1 completion:0];
}

uint64_t __70__RUIObjectModel__presentSecondConfirmationWithAttributes_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __70__RUIObjectModel__presentSecondConfirmationWithAttributes_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (id)textInRowWithIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(RUIObjectModel *)self visiblePage];
  id v6 = [v5 tableViewOM];
  id v7 = [v6 rowWithIdentifier:v4];

  uint64_t v8 = [v7 attributes];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"class"];
  LODWORD(v6) = [v9 isEqualToString:@"editableText"];

  id v10 = [v7 tableCell];
  long long v11 = v10;
  if (v6) {
    [v10 ruiEditableTextField];
  }
  else {
  id v12 = [v10 ruiTextLabel];
  }
  int v13 = [v12 text];

  return v13;
}

- (void)handleAppleIDAuthenticationIfNeededForAttributes:(id)a3 completion:(id)a4
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 objectForKeyedSubscript:@"authRequired"];
  if ([v8 BOOLValue])
  {

    goto LABEL_4;
  }
  uint64_t v9 = [v6 objectForKeyedSubscript:@"authCredentialRecoveryRequired"];
  int v10 = [v9 BOOLValue];

  if (v10)
  {
LABEL_4:
    uint64_t v58 = 0;
    v59 = &v58;
    uint64_t v60 = 0x3032000000;
    v61 = __Block_byref_object_copy__0;
    v62 = __Block_byref_object_dispose__0;
    uint64_t v64 = 0;
    uint64_t v65 = (uint64_t)&v64;
    uint64_t v66 = 0x2050000000;
    long long v11 = (void *)getAKAppleIDAuthenticationInAppContextClass_softClass;
    v67 = (void *)getAKAppleIDAuthenticationInAppContextClass_softClass;
    if (!getAKAppleIDAuthenticationInAppContextClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      uint64_t v74 = (uint64_t)__getAKAppleIDAuthenticationInAppContextClass_block_invoke;
      v75 = (uint64_t (*)(uint64_t, uint64_t))&unk_264211600;
      v76 = (void (*)(uint64_t))&v64;
      __getAKAppleIDAuthenticationInAppContextClass_block_invoke((uint64_t)&buf);
      long long v11 = *(void **)(v65 + 24);
    }
    id v12 = v11;
    _Block_object_dispose(&v64, 8);
    id v63 = (id)objc_opt_new();
    int v13 = [v6 objectForKeyedSubscript:@"authAccountIsPrimary"];
    int v14 = [v13 BOOLValue];

    if (v14)
    {
      uint64_t v64 = 0;
      uint64_t v65 = (uint64_t)&v64;
      uint64_t v66 = 0x2050000000;
      uint64_t v15 = (void *)getACAccountStoreClass_softClass;
      v67 = (void *)getACAccountStoreClass_softClass;
      if (!getACAccountStoreClass_softClass)
      {
        *(void *)&long long buf = MEMORY[0x263EF8330];
        *((void *)&buf + 1) = 3221225472;
        uint64_t v74 = (uint64_t)__getACAccountStoreClass_block_invoke;
        v75 = (uint64_t (*)(uint64_t, uint64_t))&unk_264211600;
        v76 = (void (*)(uint64_t))&v64;
        __getACAccountStoreClass_block_invoke((uint64_t)&buf);
        uint64_t v15 = *(void **)(v65 + 24);
      }
      id v16 = v15;
      _Block_object_dispose(&v64, 8);
      uint64_t v17 = objc_opt_new();
      BOOL v18 = objc_msgSend(v17, "aa_primaryAppleAccount");
      long long v19 = [v18 username];

      if ([v19 length]) {
        [(id)v59[5] setUsername:v19];
      }
    }
    long long v20 = [(id)v59[5] username];
    if (![v20 length])
    {
      id v21 = [v6 objectForKeyedSubscript:@"authUsername"];
      BOOL v22 = [v21 length] == 0;

      if (v22) {
        goto LABEL_16;
      }
      uint64_t v23 = (void *)v59[5];
      long long v20 = [v6 objectForKeyedSubscript:@"authUsername"];
      [v23 setUsername:v20];
    }

LABEL_16:
    uint64_t v24 = [(id)v59[5] username];
    if (![v24 length])
    {
      v29 = [v6 objectForKeyedSubscript:@"authUsernameFieldID"];
      BOOL v30 = [v29 length] == 0;

      if (v30) {
        goto LABEL_18;
      }
      uint64_t v31 = [v6 objectForKeyedSubscript:@"authUsernameFieldID"];
      uint64_t v24 = [(RUIObjectModel *)self textInRowWithIdentifier:v31];

      if ([v24 length])
      {
        [(id)v59[5] setUsername:v24];
      }
      else if (_isInternalInstall())
      {
        v51 = _RUILoggingFacility();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          v52 = [v6 objectForKeyedSubscript:@"authUsernameFieldID"];
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v52;
          _os_log_impl(&dword_2144F2000, v51, OS_LOG_TYPE_DEFAULT, "Could not find a username in usernameFieldID %@", (uint8_t *)&buf, 0xCu);
        }
      }
    }

LABEL_18:
    id v25 = [v6 objectForKeyedSubscript:@"authPasswordFieldID"];
    BOOL v26 = [v25 length] == 0;

    if (!v26)
    {
      uint64_t v27 = [v6 objectForKeyedSubscript:@"authPasswordFieldID"];
      uint64_t v28 = [(RUIObjectModel *)self textInRowWithIdentifier:v27];

      if ([v28 length])
      {
        [(id)v59[5] _setPassword:v28];
      }
      else if (_isInternalInstall())
      {
        id v32 = _RUILoggingFacility();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          id v33 = [v6 objectForKeyedSubscript:@"authPasswordFieldID"];
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v33;
          _os_log_impl(&dword_2144F2000, v32, OS_LOG_TYPE_DEFAULT, "Could not find a password in passwordFieldID %@", (uint8_t *)&buf, 0xCu);
        }
      }
    }
    long long v34 = (void *)v59[5];
    long long v35 = [v6 objectForKeyedSubscript:@"authReason"];
    [v34 setReason:v35];

    long long v36 = [(RUIObjectModel *)self _parentNavigationController];
    [(id)v59[5] setPresentingViewController:v36];
    long long v37 = [v6 objectForKeyedSubscript:@"authIsEphemeral"];
    uint64_t v38 = [v37 BOOLValue];

    [(id)v59[5] setIsEphemeral:v38];
    long long v39 = [v6 objectForKeyedSubscript:@"authCredentialRecoveryRequired"];
    uint64_t v40 = [v39 BOOLValue];

    [(id)v59[5] setNeedsCredentialRecovery:v40];
    long long v41 = [v6 objectForKeyedSubscript:@"authIsTwoFactor"];
    if (v41)
    {
      long long v42 = [v6 objectForKeyedSubscript:@"authIsTwoFactor"];
      int v43 = [v42 BOOLValue];

      uint64_t v44 = v43 ^ 1u;
    }
    else
    {
      uint64_t v44 = 0;
    }

    [(id)v59[5] setShouldPromptForPasswordOnly:v44];
    long long v45 = [(id)v59[5] username];
    BOOL v46 = [v45 length] == 0;

    if (!v46) {
      [(id)v59[5] setIsUsernameEditable:0];
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v74 = 0x3032000000;
    v75 = __Block_byref_object_copy__0;
    v76 = __Block_byref_object_dispose__0;
    uint64_t v69 = 0;
    v70 = &v69;
    uint64_t v71 = 0x2050000000;
    v47 = (void *)getAKAppleIDAuthenticationControllerClass_softClass;
    uint64_t v72 = getAKAppleIDAuthenticationControllerClass_softClass;
    if (!getAKAppleIDAuthenticationControllerClass_softClass)
    {
      uint64_t v64 = MEMORY[0x263EF8330];
      uint64_t v65 = 3221225472;
      uint64_t v66 = (uint64_t)__getAKAppleIDAuthenticationControllerClass_block_invoke;
      v67 = &unk_264211600;
      v68 = &v69;
      __getAKAppleIDAuthenticationControllerClass_block_invoke((uint64_t)&v64);
      v47 = (void *)v70[3];
    }
    id v48 = v47;
    _Block_object_dispose(&v69, 8);
    id v77 = (id)objc_opt_new();
    uint64_t v49 = *(void **)(*((void *)&buf + 1) + 40);
    uint64_t v50 = v59[5];
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = __78__RUIObjectModel_handleAppleIDAuthenticationIfNeededForAttributes_completion___block_invoke;
    v53[3] = &unk_264211C28;
    v53[4] = self;
    id v54 = v6;
    id v55 = v7;
    p_long long buf = &buf;
    v57 = &v58;
    [v49 authenticateWithContext:v50 completion:v53];

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v58, 8);

    goto LABEL_39;
  }
  if (v7) {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
  }
LABEL_39:
}

void __78__RUIObjectModel_handleAppleIDAuthenticationIfNeededForAttributes_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__RUIObjectModel_handleAppleIDAuthenticationIfNeededForAttributes_completion___block_invoke_2;
  block[3] = &unk_264211C00;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(a1 + 40);
  id v12 = v6;
  uint64_t v13 = v7;
  id v14 = v5;
  id v15 = v8;
  id v16 = *(id *)(a1 + 48);
  long long v17 = *(_OWORD *)(a1 + 56);
  id v9 = v5;
  id v10 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __78__RUIObjectModel_handleAppleIDAuthenticationIfNeededForAttributes_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  if (!*(void *)(a1 + 32))
  {
    uint64_t v13 = *(void **)(a1 + 48);
    uint64_t v41 = 0;
    long long v42 = &v41;
    uint64_t v43 = 0x2020000000;
    id v14 = (void *)getAKAuthenticationUsernameKeySymbolLoc_ptr;
    uint64_t v44 = getAKAuthenticationUsernameKeySymbolLoc_ptr;
    if (!getAKAuthenticationUsernameKeySymbolLoc_ptr)
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      BOOL v46 = __getAKAuthenticationUsernameKeySymbolLoc_block_invoke;
      v47 = &unk_264211600;
      id v48 = &v41;
      id v15 = (void *)AuthKitLibrary();
      id v16 = dlsym(v15, "AKAuthenticationUsernameKey");
      *(void *)(v48[1] + 24) = v16;
      getAKAuthenticationUsernameKeySymbolLoc_ptr = *(void *)(v48[1] + 24);
      id v14 = (void *)v42[3];
    }
    _Block_object_dispose(&v41, 8);
    if (!v14) {
      __78__RUIObjectModel_handleAppleIDAuthenticationIfNeededForAttributes_completion___block_invoke_2_cold_1();
    }
    id v4 = [v13 objectForKeyedSubscript:*v14];
    long long v17 = *(void **)(a1 + 48);
    BOOL v18 = getAKAuthenticationPasswordKey();
    id v5 = [v17 objectForKeyedSubscript:v18];

    [*(id *)(a1 + 40) setAuthPasswordEquivalent:v5];
    long long v19 = [*(id *)(a1 + 56) objectForKeyedSubscript:@"authPasswordFieldID"];
    [*(id *)(a1 + 40) setAuthPasswordFieldID:v19];

    if ([v4 length] && objc_msgSend(v5, "length"))
    {
      long long v20 = [NSString stringWithFormat:@"%@:%@", v4, v5, v41];
      id v21 = [v20 dataUsingEncoding:4];
      BOOL v22 = [v21 base64EncodedStringWithOptions:0];

      [*(id *)(*(void *)(a1 + 40) + 160) setObject:v22 forKeyedSubscript:@"Authorization"];
    }
    else
    {
      NSLog(&cfstr_AuthSucceededB.isa);
    }
    goto LABEL_33;
  }
  if (_isInternalInstall())
  {
    id v2 = _RUILoggingFacility();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v3;
      _os_log_impl(&dword_2144F2000, v2, OS_LOG_TYPE_DEFAULT, "Auth failed with error %@", (uint8_t *)&buf, 0xCu);
    }
  }
  id v4 = [*(id *)(a1 + 32) domain];
  id v5 = getAKAppleIDAuthenticationErrorDomain();
  if ([v4 isEqualToString:v5])
  {
    BOOL v6 = [*(id *)(a1 + 32) code] == -7003;

    if (v6) {
      goto LABEL_34;
    }
    uint64_t v7 = [*(id *)(a1 + 32) domain];
    uint64_t v8 = getAKAppleIDAuthenticationErrorDomain();
    if ([v7 isEqualToString:v8])
    {
      BOOL v9 = [*(id *)(a1 + 32) code] == -7006;

      if (v9)
      {
        id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        if (([@"AUTH_WRONG_PASSWORD_ALERT_MESSAGE" containsString:@"REBRAND"] & 1) != 0
          || !_os_feature_enabled_impl())
        {
          int v12 = 0;
          long long v11 = @"AUTH_WRONG_PASSWORD_ALERT_MESSAGE";
        }
        else
        {
          long long v11 = [@"AUTH_WRONG_PASSWORD_ALERT_MESSAGE" stringByAppendingString:@"_REBRAND"];
          int v12 = 1;
        }
        id v4 = [v10 localizedStringForKey:v11 value:&stru_26C545B50 table:@"Localizable"];
        if (!v12) {
          goto LABEL_32;
        }
        goto LABEL_31;
      }
    }
    else
    {
    }
    uint64_t v23 = [*(id *)(a1 + 32) userInfo];
    uint64_t v24 = *MEMORY[0x263F08320];
    id v25 = [v23 objectForKeyedSubscript:*MEMORY[0x263F08320]];

    if (v25)
    {
      id v10 = [*(id *)(a1 + 32) userInfo];
      id v4 = [v10 objectForKeyedSubscript:v24];
LABEL_32:

      uint64_t v27 = (void *)MEMORY[0x263F82418];
      uint64_t v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v29 = [v28 localizedStringForKey:@"AUTH_ERROR_ALERT_TITLE" value:&stru_26C545B50 table:@"Localizable"];
      id v5 = [v27 alertControllerWithTitle:v29 message:v4 preferredStyle:1];

      BOOL v30 = (void *)MEMORY[0x263F82400];
      uint64_t v31 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v32 = [v31 localizedStringForKey:@"AUTH_ERROR_OK_BUTTON" value:&stru_26C545B50 table:@"Localizable"];
      id v33 = [v30 actionWithTitle:v32 style:0 handler:0];
      [v5 addAction:v33];

      long long v34 = [*(id *)(a1 + 40) _parentViewController];
      [v34 presentViewController:v5 animated:1 completion:0];

      goto LABEL_33;
    }
    id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    if (([@"AUTH_OTHER_ERROR_ALERT_MESSAGE" containsString:@"REBRAND"] & 1) != 0
      || !_os_feature_enabled_impl())
    {
      int v26 = 0;
      long long v11 = @"AUTH_OTHER_ERROR_ALERT_MESSAGE";
    }
    else
    {
      long long v11 = [@"AUTH_OTHER_ERROR_ALERT_MESSAGE" stringByAppendingString:@"_REBRAND"];
      int v26 = 1;
    }
    id v4 = [v10 localizedStringForKey:v11 value:&stru_26C545B50 table:@"Localizable"];
    if (!v26) {
      goto LABEL_32;
    }
LABEL_31:

    goto LABEL_32;
  }
LABEL_33:

LABEL_34:
  if (*(void *)(a1 + 64))
  {
    long long v35 = *(void **)(a1 + 48);
    long long v36 = getAKAuthenticationPasswordKey();
    [v35 objectForKeyedSubscript:v36];

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  uint64_t v37 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v38 = *(void **)(v37 + 40);
  *(void *)(v37 + 40) = 0;

  uint64_t v39 = *(void *)(*(void *)(a1 + 80) + 8);
  uint64_t v40 = *(void **)(v39 + 40);
  *(void *)(v39 + 40) = 0;
}

- (id)subElementWithID:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(RUIObjectModel *)self primaryAlert];
  BOOL v6 = [v5 identifier];
  int v7 = [v6 isEqualToString:v4];

  if (v7)
  {
    uint64_t v8 = [(RUIObjectModel *)self primaryAlert];
  }
  else
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    BOOL v9 = self->_namedAlerts;
    uint64_t v10 = [(NSMutableDictionary *)v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v33;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v8 = [(NSMutableDictionary *)self->_namedAlerts objectForKeyedSubscript:*(void *)(*((void *)&v32 + 1) + 8 * i)];
          id v14 = [v8 identifier];
          char v15 = [v14 isEqualToString:v4];

          if (v15) {
            goto LABEL_23;
          }
          uint64_t v16 = [v8 subElementWithID:v4];

          if (v16)
          {
            uint64_t v8 = (void *)v16;
LABEL_23:

            goto LABEL_26;
          }
        }
        uint64_t v11 = [(NSMutableDictionary *)v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v17 = [(RUIObjectModel *)self allPages];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v29;
      while (2)
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v29 != v20) {
            objc_enumerationMutation(v17);
          }
          BOOL v22 = *(void **)(*((void *)&v28 + 1) + 8 * j);
          uint64_t v23 = [v22 pageElement];
          uint64_t v24 = [v23 identifier];
          int v25 = [v24 isEqualToString:v4];

          if (v25)
          {
            uint64_t v26 = [v22 pageElement];
LABEL_25:
            uint64_t v8 = (void *)v26;

            goto LABEL_26;
          }
          uint64_t v26 = [v22 subElementWithID:v4];
          if (v26) {
            goto LABEL_25;
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }

    uint64_t v8 = 0;
  }
LABEL_26:

  return v8;
}

- (void)startActivityIndicatorWithAttributes:(id)a3
{
  id v4 = [(RUIObjectModel *)self elementForActivityIndicatorWithAttributes:a3];
  [(RUIObjectModel *)self startActivityIndicatorForElement:v4];
}

- (void)startActivityIndicatorForElement:(id)a3
{
  id v5 = a3;
  id v4 = [(RUIObjectModel *)self elementForActivityIndicatorWithActivatedElement:v5];
  objc_storeStrong((id *)&self->_elementForActivityIndicator, v4);
  [(RUIElement *)self->_elementForActivityIndicator startActivityIndicator];
  if (v5) {
    [(RUIObjectModel *)self setActivityIndicatorStatus:1 forElement:v5];
  }
}

- (void)activateElement:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v7 = (RUIElement *)a3;
  uint64_t v8 = (void (**)(id, void, void *))a4;
  if ([(RUIElement *)self->_activeElement isEqual:v7])
  {
    if (_isInternalInstall())
    {
      BOOL v9 = _RUILoggingFacility();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        long long v17 = v7;
        _os_log_impl(&dword_2144F2000, v9, OS_LOG_TYPE_DEFAULT, "Already handling activation for element: %@", buf, 0xCu);
      }
    }
    if (v8)
    {
      uint64_t v10 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.RemoteUI" code:4 userInfo:0];
      v8[2](v8, 0, v10);
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_activeElement, a3);
    [(RUIObjectModel *)self startActivityIndicatorForElement:v7];
    if (_isInternalInstall())
    {
      uint64_t v11 = _RUILoggingFacility();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        activeElement = self->_activeElement;
        *(_DWORD *)long long buf = 138412290;
        long long v17 = activeElement;
        _os_log_impl(&dword_2144F2000, v11, OS_LOG_TYPE_DEFAULT, "Active element set %@", buf, 0xCu);
      }
    }
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __45__RUIObjectModel_activateElement_completion___block_invoke;
    v13[3] = &unk_264211C50;
    v13[4] = self;
    id v14 = v7;
    char v15 = v8;
    [(RUIObjectModel *)self handleElementChange:v14 action:2 completion:v13];
  }
}

void __45__RUIObjectModel_activateElement_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (_isInternalInstall())
  {
    BOOL v6 = _RUILoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 200);
      int v13 = 138412290;
      uint64_t v14 = v7;
      _os_log_impl(&dword_2144F2000, v6, OS_LOG_TYPE_DEFAULT, "Removing active element %@", (uint8_t *)&v13, 0xCu);
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 248) stopActivityIndicator];
  if (*(void *)(a1 + 40)) {
    objc_msgSend(*(id *)(a1 + 32), "setActivityIndicatorStatus:forElement:", 0);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  BOOL v9 = *(void **)(v8 + 248);
  *(void *)(v8 + 248) = 0;

  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(v10 + 200);
  *(void *)(v10 + 200) = 0;

  uint64_t v12 = *(void *)(a1 + 48);
  if (v12) {
    (*(void (**)(uint64_t, uint64_t, id))(v12 + 16))(v12, a2, v5);
  }
}

- (id)elementForActivityIndicatorWithAttributes:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"activityIndicatorAnchorId"];
  id v5 = [(RUIObjectModel *)self elementForActivityIndicatorAnchorId:v4];

  return v5;
}

- (id)elementForActivityIndicatorWithActivatedElement:(id)a3
{
  id v4 = a3;
  id v5 = [v4 attributes];
  BOOL v6 = [(RUIObjectModel *)self elementForActivityIndicatorWithAttributes:v5];

  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = [v7 pageElement];
    BOOL v9 = [v8 page];
  }
  else
  {
    id v7 = v4;
    BOOL v9 = [(RUIObjectModel *)self visiblePage];
  }
  uint64_t v10 = [v9 activityIndicatorStyle];
  int v11 = [v10 isEqualToString:@"activeElement"];

  if (v11) {
    id v12 = v7;
  }
  else {
    id v12 = 0;
  }

  return v12;
}

- (id)elementForActivityIndicatorAnchorId:(id)a3
{
  id v4 = a3;
  id v5 = [(RUIObjectModel *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(RUIObjectModel *)self delegate];
    uint64_t v8 = [v7 visibleElementWithIdentifier:v4];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)handleElementChange:(id)a3 action:(int)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__RUIObjectModel_handleElementChange_action_completion___block_invoke;
  v12[3] = &unk_264211CC8;
  id v13 = v8;
  id v14 = v9;
  v12[4] = self;
  int v15 = a4;
  id v10 = v8;
  id v11 = v9;
  [(RUIObjectModel *)self presentConfirmationIfNeededForElement:v10 completion:v12];
}

void __56__RUIObjectModel_handleElementChange_action_completion___block_invoke(uint64_t a1, int a2, char a3)
{
  if (!a2 || (a3 & 1) != 0)
  {
    char v6 = *(void **)(a1 + 32);
    id v7 = [*(id *)(a1 + 40) attributes];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    void v11[2] = __56__RUIObjectModel_handleElementChange_action_completion___block_invoke_2;
    v11[3] = &unk_264211CA0;
    id v8 = *(id *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(a1 + 40);
    id v13 = v8;
    v11[4] = v9;
    id v12 = v10;
    int v14 = *(_DWORD *)(a1 + 56);
    [v6 handleAppleIDAuthenticationIfNeededForAttributes:v7 completion:v11];
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 48);
    if (v4)
    {
      id v5 = *(void (**)(void))(v4 + 16);
      v5();
    }
  }
}

void __56__RUIObjectModel_handleElementChange_action_completion___block_invoke_2(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __56__RUIObjectModel_handleElementChange_action_completion___block_invoke_3;
    v9[3] = &unk_264211C78;
    id v12 = *(id *)(a1 + 48);
    id v5 = *(id *)(a1 + 40);
    int v13 = *(_DWORD *)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 32);
    id v10 = v5;
    uint64_t v11 = v6;
    [v3 _handleElementChange:v4 completion:v9];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7)
    {
      id v8 = *(void (**)(void))(v7 + 16);
      v8();
    }
  }
}

void __56__RUIObjectModel_handleElementChange_action_completion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = [*(id *)(a1 + 32) attributes];
    uint64_t v7 = [v6 objectForKeyedSubscript:@"url"];
    if (v7) {
      BOOL v8 = *(_DWORD *)(a1 + 56) == 2;
    }
    else {
      BOOL v8 = 0;
    }

    uint64_t v11 = [*(id *)(a1 + 32) attributes];
    id v12 = [v11 objectForKeyedSubscript:@"action"];
    if ([v12 isEqualToString:@"dismiss"])
    {
      int v13 = *(_DWORD *)(a1 + 56);

      if (!v8)
      {
        if (v13 == 2)
        {
          int v14 = [*(id *)(a1 + 40) visiblePage];
          v21[0] = MEMORY[0x263EF8330];
          v21[1] = 3221225472;
          v21[2] = __56__RUIObjectModel_handleElementChange_action_completion___block_invoke_5;
          v21[3] = &unk_264211528;
          id v22 = *(id *)(a1 + 48);
          [v14 dismissIfPresentedWithCompletion:v21];

          goto LABEL_18;
        }
LABEL_13:
        uint64_t v19 = _RUILoggingFacility();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          __56__RUIObjectModel_handleElementChange_action_completion___block_invoke_3_cold_1(a1, v19);
        }

        uint64_t v20 = *(void *)(a1 + 48);
        if (v20)
        {
          id v10 = *(void (**)(void))(v20 + 16);
          goto LABEL_17;
        }
        goto LABEL_18;
      }
    }
    else
    {

      if (!v8) {
        goto LABEL_13;
      }
    }
    int v15 = [*(id *)(a1 + 32) attributes];
    uint64_t v16 = [v15 objectForKeyedSubscript:@"url"];

    long long v17 = *(void **)(a1 + 40);
    uint64_t v18 = [*(id *)(a1 + 32) attributes];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __56__RUIObjectModel_handleElementChange_action_completion___block_invoke_4;
    v23[3] = &unk_264211500;
    id v24 = *(id *)(a1 + 48);
    [v17 _handleLinkPress:v16 attributes:v18 completion:v23];

    goto LABEL_18;
  }
  uint64_t v9 = *(void *)(a1 + 48);
  if (v9)
  {
    id v10 = *(void (**)(void))(v9 + 16);
LABEL_17:
    v10();
  }
LABEL_18:
}

uint64_t __56__RUIObjectModel_handleElementChange_action_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __56__RUIObjectModel_handleElementChange_action_completion___block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

- (void)openLink:(id)a3 HTTPMethod:(id)a4 completion:(id)a5
{
}

- (void)openLink:(id)a3 HTTPMethod:(id)a4 attributes:(id)a5 completion:(id)a6
{
  uint64_t v9 = (void *)MEMORY[0x263EFF9A0];
  if (a5) {
    id v10 = a5;
  }
  else {
    id v10 = (id)MEMORY[0x263EFFA78];
  }
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id v15 = [v9 dictionaryWithDictionary:v10];
  [v15 setObject:v12 forKeyedSubscript:@"httpMethod"];

  int v14 = (void *)[v15 copy];
  [(RUIObjectModel *)self _handleLinkPress:v13 attributes:v14 completion:v11];
}

- (BOOL)_shouldDisplayNamedElement:(id)a3 page:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(RUIObjectModel *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(RUIObjectModel *)self delegate];
    char v11 = [v10 objectModel:self shouldDisplayNamedElement:v6 page:v7];
  }
  else
  {
    char v11 = 1;
  }

  return v11;
}

- (id)alertWithName:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_namedAlerts objectForKeyedSubscript:a3];
}

- (void)_handleLinkPress:(id)a3 attributes:(id)a4 completion:(id)a5
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  BOOL v8 = (RUIElement *)a3;
  id v9 = a4;
  id v10 = (void (**)(id, BOOL, void *))a5;
  if ([(RUIElement *)v8 hasPrefix:@"#"])
  {
    char v11 = [(RUIElement *)v8 substringFromIndex:1];
    id v12 = [(NSMutableDictionary *)self->_namedPages objectForKey:v11];
    if (v12)
    {
      if ([(RUIObjectModel *)self _shouldDisplayNamedElement:0 page:v12])
      {
        BOOL v13 = 1;
        [(RUIObjectModel *)self _displayNamedPage:v12 animated:(gAnimatedNavigationTransitions & 1) == 0];
        int v14 = 0;
        if (!v10) {
          goto LABEL_38;
        }
      }
      else
      {
        int v14 = 0;
        BOOL v13 = 0;
        if (!v10) {
          goto LABEL_38;
        }
      }
    }
    else
    {
      id v22 = [(NSMutableDictionary *)self->_namedAlerts objectForKey:v11];
      if (v22 && [(RUIObjectModel *)self _shouldDisplayNamedElement:0 page:0])
      {
        uint64_t v23 = [(RUIObjectModel *)self _parentViewController];
        BOOL v13 = v23 != 0;
        if (v23) {
          [v22 runAlertInController:v23 completion:0];
        }

        int v14 = 0;
      }
      else
      {
        if (_isInternalInstall())
        {
          id v24 = _RUILoggingFacility();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            v53 = v8;
            _os_log_impl(&dword_2144F2000, v24, OS_LOG_TYPE_DEFAULT, "Link press for named element %@ did not find an element", buf, 0xCu);
          }
        }
        int v14 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.RemoteUI" code:3 userInfo:0];
        BOOL v13 = 0;
      }

      if (!v10) {
        goto LABEL_38;
      }
    }
    v10[2](v10, v13, v14);
LABEL_38:

LABEL_39:
    goto LABEL_40;
  }
  char v11 = [(RUIObjectModel *)self absoluteURLWithString:v8];
  id v15 = [v9 objectForKeyedSubscript:@"openInSafari"];
  if ([v15 BOOLValue]) {
    int v16 = objc_msgSend(v11, "rui_isSupportedSafariURL");
  }
  else {
    int v16 = 0;
  }

  if ((objc_msgSend(v11, "rui_isSupportedNativeURL") & 1) != 0 || v16)
  {
    if (_isInternalInstall())
    {
      uint64_t v18 = _RUILoggingFacility();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_2144F2000, v18, OS_LOG_TYPE_DEFAULT, "RUIObjectModel - url provided is native", buf, 2u);
      }
    }
    uint64_t v19 = [MEMORY[0x263F01880] defaultWorkspace];
    id v51 = 0;
    [v19 openSensitiveURL:v11 withOptions:0 error:&v51];
    id v20 = v51;

    if (v20)
    {
      id v21 = _RUILoggingFacility();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[RUIObjectModel _handleLinkPress:attributes:completion:]((uint64_t)v11, (uint64_t)v20, v21);
      }
    }
    if (v10) {
      v10[2](v10, v20 == 0, v20);
    }

    goto LABEL_40;
  }
  long long v17 = [v9 objectForKeyedSubscript:@"fetchLinksInModalWebView"];
  if ([v17 BOOLValue])
  {
  }
  else
  {
    int v25 = [v9 objectForKeyedSubscript:@"isModalHTMLView"];
    int v26 = [v25 BOOLValue];

    if (!v26)
    {
      if (v11)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        char v34 = objc_opt_respondsToSelector();

        if (v34)
        {
          [(RUIObjectModel *)self _startNavigationBarSpinnerIfNeededForAttributes:v9];
          id v35 = objc_loadWeakRetained((id *)&self->_delegate);
          char v36 = objc_opt_respondsToSelector();

          if (v36)
          {
            id v37 = objc_loadWeakRetained((id *)&self->_delegate);
            [v37 objectModel:self willLoadLinkURL:v11 attributes:v9];
          }
          id v38 = objc_loadWeakRetained((id *)&self->_delegate);
          uint64_t v39 = [v9 objectForKeyedSubscript:@"httpMethod"];
          v48[0] = MEMORY[0x263EF8330];
          v48[1] = 3221225472;
          v48[2] = __57__RUIObjectModel__handleLinkPress_attributes_completion___block_invoke;
          v48[3] = &unk_264211C50;
          v48[4] = self;
          uint64_t v49 = (RUIElement *)v9;
          uint64_t v50 = v10;
          [v38 objectModel:self pressedLink:v11 httpMethod:v39 completion:v48];

          uint64_t v40 = v49;
        }
        else
        {
          id v41 = objc_loadWeakRetained((id *)&self->_delegate);
          char v42 = objc_opt_respondsToSelector();

          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
          id v43 = objc_loadWeakRetained((id *)&self->_delegate);
          uint64_t v44 = [v9 objectForKeyedSubscript:@"httpMethod"];
          [v43 objectModel:self pressedLink:v11 httpMethod:v44];

          if (_isInternalInstall())
          {
            long long v45 = _RUILoggingFacility();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl(&dword_2144F2000, v45, OS_LOG_TYPE_DEFAULT, "DEPRECATED - Please use objectModel:pressedLink:httpMethod:completion:", buf, 2u);
            }
          }
          if (_isInternalInstall())
          {
            BOOL v46 = _RUILoggingFacility();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              activeElement = self->_activeElement;
              *(_DWORD *)long long buf = 138412290;
              v53 = activeElement;
              _os_log_impl(&dword_2144F2000, v46, OS_LOG_TYPE_DEFAULT, "Removing active element %@", buf, 0xCu);
            }
          }
          uint64_t v40 = self->_activeElement;
          self->_activeElement = 0;
        }

        goto LABEL_40;
      }
      NSLog(&cfstr_WarningInvalid.isa, v8);
      goto LABEL_40;
    }
  }
  if (v11)
  {
    id v27 = objc_loadWeakRetained((id *)&self->_delegate);
    char v28 = objc_opt_respondsToSelector();

    if ((v28 & 1) == 0
      || (id v29 = objc_loadWeakRetained((id *)&self->_delegate),
          int v30 = [v29 objectModel:self shouldShowModalHTMLViewWithURL:v11],
          v29,
          v30))
    {
      id v12 = [v9 objectForKeyedSubscript:@"dismissButtonLabel"];
      long long v31 = [v9 objectForKeyedSubscript:@"dismissButtonAlignment"];
      long long v32 = [v9 objectForKeyedSubscript:@"shouldScaleHTMLPageToFit"];
      -[RUIObjectModel showModalWebViewWithLinkURL:dismissButtonLabel:dismissButtonAlignment:scaleToFit:loadCompletion:dismissHandler:](self, "showModalWebViewWithLinkURL:dismissButtonLabel:dismissButtonAlignment:scaleToFit:loadCompletion:dismissHandler:", v11, v12, v31, [v32 BOOLValue], v10, 0);

      goto LABEL_39;
    }
  }
LABEL_40:
}

void __57__RUIObjectModel__handleLinkPress_attributes_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  [*(id *)(a1 + 32) _stopNavigationBarSpinnerIfNeededForAttributes:*(void *)(a1 + 40)];
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);
  }
}

- (void)_handleElementChange:(id)a3 completion:(id)a4
{
  v25[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  BOOL v8 = [v6 attributes];
  id v9 = [v8 objectForKeyedSubscript:@"validationFunction"];

  if (![v9 length]
    || ([MEMORY[0x263F828A0] activeKeyboard],
        id v10 = objc_claimAutoreleasedReturnValue(),
        [v10 acceptAutocorrection],
        v10,
        [(RUIObjectModel *)self validateWithFunction:v9]))
  {
    char v11 = [v6 attributes];
    id v12 = [v11 objectForKeyedSubscript:@"activationFunction"];

    if ([v12 length])
    {
      BOOL v13 = [MEMORY[0x263F828A0] activeKeyboard];
      [v13 acceptAutocorrection];

      if (v6)
      {
        v25[0] = v6;
        int v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
        id v15 = [(RUIObjectModel *)self invokeScriptFunction:v12 withArguments:v14];
      }
      else
      {
        id v17 = [(RUIObjectModel *)self invokeScriptFunction:v12 withArguments:0];
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v19 = objc_opt_respondsToSelector();

    id v20 = objc_loadWeakRetained((id *)&self->_delegate);
    id v21 = v20;
    if (v19)
    {
      [v20 objectModel:self elementDidChange:v6];
    }
    else
    {
      char v22 = objc_opt_respondsToSelector();

      if ((v22 & 1) == 0)
      {
LABEL_14:
        if (v7) {
          v7[2](v7, 1, 0);
        }

        goto LABEL_17;
      }
      id v21 = objc_loadWeakRetained((id *)&self->_delegate);
      uint64_t v23 = [v6 name];
      id v24 = [v6 attributes];
      [v21 objectModel:self pressedButton:v23 attributes:v24];
    }
    goto LABEL_14;
  }
  if (v7)
  {
    int v16 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.RemoteUI" code:1 userInfo:0];
    ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v16);
  }
LABEL_17:
}

- (id)_pageContainingTableView:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [(RUIObjectModel *)self allPages];
  id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v10 = [v9 tableViewOM];

        if (v10 == v4)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)showModalWebViewWithLinkURL:(id)a3 dismissButtonLabel:(id)a4 dismissButtonAlignment:(id)a5 scaleToFit:(BOOL)a6 loadCompletion:(id)a7 dismissHandler:(id)a8
{
  BOOL v10 = a6;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  id webViewDismissHandler = self->_webViewDismissHandler;
  int isInternalInstall = _isInternalInstall();
  if (!webViewDismissHandler)
  {
    if (isInternalInstall)
    {
      char v22 = _RUILoggingFacility();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = [v14 host];
        int v28 = 138412290;
        id v29 = v23;
        _os_log_impl(&dword_2144F2000, v22, OS_LOG_TYPE_DEFAULT, "Showing modal web view with domain '%@'", (uint8_t *)&v28, 0xCu);
      }
    }
    id v24 = _Block_copy(v18);
    id v25 = self->_webViewDismissHandler;
    self->_id webViewDismissHandler = v24;

    id v21 = [[RemoteUIWebViewController alloc] initWithNibName:0 bundle:0];
    int v26 = [(RUIObjectModel *)self style];
    [(RemoteUIWebViewController *)v21 setStyle:v26];

    [(RemoteUIWebViewController *)v21 setDismissButtonAlignment:v16];
    [(RemoteUIWebViewController *)v21 setDismissButtonLabel:v15];
    [(RemoteUIWebViewController *)v21 setScalesPageToFit:v10];
    [(RemoteUIWebViewController *)v21 setDelegate:self];
    id v27 = [(RUIObjectModel *)self _parentViewController];
    [v27 presentViewController:v21 animated:1 completion:0];

    [(RemoteUIWebViewController *)v21 loadURL:v14 completion:v17];
    goto LABEL_10;
  }
  if (isInternalInstall)
  {
    _RUILoggingFacility();
    id v21 = (RemoteUIWebViewController *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v21->super.super.super, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v28) = 0;
      _os_log_impl(&dword_2144F2000, &v21->super.super.super, OS_LOG_TYPE_DEFAULT, "Error: Can't show a modal web view, already showing one!", (uint8_t *)&v28, 2u);
    }
LABEL_10:
  }
}

- (void)remoteUIWebViewController:(id)a3 dismissWithPayload:(id)a4
{
  id v10 = a4;
  id webViewDismissHandler = self->_webViewDismissHandler;
  id v7 = a3;
  BOOL v8 = (void (**)(void *, id))_Block_copy(webViewDismissHandler);
  id v9 = self->_webViewDismissHandler;
  self->_id webViewDismissHandler = 0;

  [v7 dismissViewControllerAnimated:1 completion:0];
  if (v8) {
    v8[2](v8, v10);
  }
}

- (void)remoteUIWebViewControllerDidDismiss:(id)a3
{
  id webViewDismissHandler = (void (**)(id, void, id))self->_webViewDismissHandler;
  if (webViewDismissHandler)
  {
    webViewDismissHandler[2](webViewDismissHandler, 0, a3);
    id v5 = self->_webViewDismissHandler;
    self->_id webViewDismissHandler = 0;
  }
}

- (void)alertView:(id)a3 pressedButton:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  char v11 = [(RUIObjectModel *)self _parentNavigationController];
  long long v12 = [v11 topViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v13 = [v11 viewControllers];
    id v14 = [v13 lastObject];
  }
  else
  {
    id v14 = 0;
  }

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __53__RUIObjectModel_alertView_pressedButton_completion___block_invoke;
  v19[3] = &unk_264211CF0;
  id v20 = v14;
  id v21 = v11;
  id v22 = v8;
  id v23 = v9;
  id v15 = v9;
  id v16 = v8;
  id v17 = v11;
  id v18 = v14;
  [(RUIObjectModel *)self activateElement:v10 completion:v19];
}

void __53__RUIObjectModel_alertView_pressedButton_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  id v14 = v5;
  if (v6)
  {
    id v7 = objc_msgSend(*(id *)(a1 + 40), "topViewController", v5);
    if (v6 != v7)
    {
LABEL_6:

      id v5 = v14;
      goto LABEL_7;
    }
    id v8 = [*(id *)(a1 + 48) attributes];
    id v9 = [v8 objectForKeyedSubscript:@"activationFunction"];
    if (v9)
    {

LABEL_5:
      id v7 = v6;
      goto LABEL_6;
    }
    char v11 = [*(id *)(a1 + 48) attributes];
    long long v12 = [v11 objectForKeyedSubscript:@"url"];

    id v5 = v14;
    if (!v12)
    {
      int v13 = objc_msgSend(*(id *)(a1 + 32), "hasPasscodeView", v14);
      id v5 = v14;
      if (v13)
      {
        id v6 = objc_msgSend(*(id *)(a1 + 32), "passcodeViewOM", v14);
        id v8 = [v6 passcodeField];
        [v8 becomeFirstResponder];
        goto LABEL_5;
      }
    }
  }
LABEL_7:
  uint64_t v10 = *(void *)(a1 + 56);
  if (v10)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v10 + 16))(v10, a2, v14);
    id v5 = v14;
  }
}

- (BOOL)tableViewOM:(id)a3 deleteRowAtIndexPath:(id)a4
{
  v29[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 objectModelRowForIndexPath:v6];
  id v9 = [(RUIObjectModel *)self _pageContainingTableView:v7];

  uint64_t v10 = [v8 deleteAction];
  char v11 = [v8 attributes];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"deletionFunction"];

  char v13 = 0;
  if (!v9 || !v8) {
    goto LABEL_15;
  }
  if (!(v10 | v12)) {
    goto LABEL_14;
  }
  if (![(id)v12 length])
  {
    id v16 = [(id)v10 objectForKey:@"type"];
    int v17 = [v16 isEqualToString:@"linkDeleteAction"];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (v17)
    {
      char v19 = objc_opt_respondsToSelector();

      if (v19)
      {
        id v20 = [(id)v10 objectForKey:@"url"];
        id v21 = [(id)v10 objectForKey:@"httpMethod"];
        id v22 = [(RUIObjectModel *)self absoluteURLWithString:v20];
        if (v22)
        {
          int v28 = v20;
          id v23 = objc_loadWeakRetained((id *)&self->_delegate);
          char v13 = [v23 objectModel:self page:v9 deletedTableRow:v8 atIndexPath:v6 withURL:v22 httpMethod:v21];

          id v20 = v28;
        }
        else
        {
          NSLog(&cfstr_DeleteActionHa.isa, v20);
          char v13 = 0;
        }

        goto LABEL_15;
      }
    }
    else
    {
      int v24 = objc_opt_respondsToSelector();

      if (v24)
      {
        id v25 = [(id)v10 objectForKey:@"name"];
        id v26 = objc_loadWeakRetained((id *)&self->_delegate);
        char v13 = [v26 objectModel:self page:v9 deletedTableRow:v8 atIndexPath:v6 withName:v25];

        goto LABEL_15;
      }
    }
LABEL_14:
    char v13 = 0;
    goto LABEL_15;
  }
  v29[0] = v8;
  char v13 = 1;
  id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:1];
  id v15 = [(RUIObjectModel *)self invokeScriptFunction:v12 withArguments:v14];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v13 = [v15 BOOLValue];
  }

LABEL_15:
  return v13;
}

- (void)tableViewOMDidChange:(id)a3
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(RUIObjectModel *)self visiblePage];
  id v6 = [(RUIObjectModel *)self updateInfo];
  uint64_t v7 = [v6 mutableCopy];

  v47 = v4;
  [v4 populatePostbackDictionary:v7];
  BOOL v46 = (void *)v7;
  [(RUIObjectModel *)self setUpdateInfo:v7];
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  obuint64_t j = [v5 buttonItems];
  id v48 = v5;
  uint64_t v54 = [obj countByEnumeratingWithState:&v68 objects:v75 count:16];
  if (v54)
  {
    uint64_t v8 = *(void *)v69;
    uint64_t v49 = *(void *)v69;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v69 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v68 + 1) + 8 * v9);
        char v11 = [v10 attributes];
        uint64_t v12 = [v11 objectForKey:@"enabledFunction"];

        uint64_t v13 = [v12 length];
        id v14 = [v10 attributes];
        id v15 = [v14 objectForKeyedSubscript:@"authRequired"];
        int v16 = [v15 BOOLValue];

        if (v13)
        {
          uint64_t v17 = [(RUIObjectModel *)self validateWithFunction:v12];
          if (!v16) {
            goto LABEL_21;
          }
        }
        else
        {
          if ((v16 & 1) == 0) {
            goto LABEL_22;
          }
          LODWORD(v17) = 1;
        }
        id v18 = [v10 attributes];
        char v19 = [v18 objectForKeyedSubscript:@"authUsernameFieldID"];

        id v20 = [v10 attributes];
        id v21 = [v20 objectForKeyedSubscript:@"authPasswordFieldID"];

        uint64_t v22 = [v19 length];
        if (!v22)
        {
          if (![v21 length])
          {
            int v23 = 0;
            goto LABEL_20;
          }
LABEL_16:
          int v24 = [(RUIObjectModel *)self textInRowWithIdentifier:v21];
          int v23 = [v24 length] == 0;

          id v5 = v48;
          if (!v22) {
            goto LABEL_20;
          }
          goto LABEL_19;
        }
        v52 = [(RUIObjectModel *)self textInRowWithIdentifier:v19];
        if ([v52 length])
        {
          if ([v21 length]) {
            goto LABEL_16;
          }
          int v23 = 0;
        }
        else
        {
          int v23 = 1;
        }
LABEL_19:

LABEL_20:
        uint64_t v17 = v17 & ~v23;

        uint64_t v8 = v49;
LABEL_21:
        id v25 = [v10 attributes];
        [v5 setButton:v25 enabled:v17];

LABEL_22:
        ++v9;
      }
      while (v54 != v9);
      uint64_t v26 = [obj countByEnumeratingWithState:&v68 objects:v75 count:16];
      uint64_t v54 = v26;
    }
    while (v26);
  }

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v27 = [v5 accessoryViews];
  uint64_t v28 = [v27 countByEnumeratingWithState:&v64 objects:v74 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v65 != v30) {
          objc_enumerationMutation(v27);
        }
        long long v32 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v32 objectModelDidChange:self];
        }
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v64 objects:v74 count:16];
    }
    while (v29);
  }

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obja = [v47 sections];
  uint64_t v55 = [obja countByEnumeratingWithState:&v60 objects:v73 count:16];
  if (v55)
  {
    uint64_t v53 = *(void *)v61;
    do
    {
      for (uint64_t j = 0; j != v55; ++j)
      {
        if (*(void *)v61 != v53) {
          objc_enumerationMutation(obja);
        }
        char v34 = *(void **)(*((void *)&v60 + 1) + 8 * j);
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        id v35 = [v34 rows];
        uint64_t v36 = [v35 countByEnumeratingWithState:&v56 objects:v72 count:16];
        if (v36)
        {
          uint64_t v37 = v36;
          uint64_t v38 = *(void *)v57;
          do
          {
            for (uint64_t k = 0; k != v37; ++k)
            {
              if (*(void *)v57 != v38) {
                objc_enumerationMutation(v35);
              }
              uint64_t v40 = *(void **)(*((void *)&v56 + 1) + 8 * k);
              id v41 = [v40 attributes];
              char v42 = [v41 objectForKey:@"enabledFunction"];

              if ([v42 length]) {
                objc_msgSend(v40, "setEnabled:", -[RUIObjectModel validateWithFunction:](self, "validateWithFunction:", v42));
              }
            }
            uint64_t v37 = [v35 countByEnumeratingWithState:&v56 objects:v72 count:16];
          }
          while (v37);
        }
      }
      uint64_t v55 = [obja countByEnumeratingWithState:&v60 objects:v73 count:16];
    }
    while (v55);
  }

  [v48 notifyPageDidChangePublisher];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v44 = objc_opt_respondsToSelector();

  if (v44)
  {
    id v45 = objc_loadWeakRetained((id *)&self->_delegate);
    [v45 objectModelDidChange:self];
  }
}

- (void)tableViewOM:(id)a3 elementDidChange:(id)a4 action:(int)a5 completion:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v9 = (RUIElement *)a4;
  id v10 = a6;
  activeElement = self->_activeElement;
  self->_activeElement = v9;
  uint64_t v12 = v9;

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __65__RUIObjectModel_tableViewOM_elementDidChange_action_completion___block_invoke;
  v14[3] = &unk_2642112B0;
  v14[4] = self;
  id v15 = v10;
  id v13 = v10;
  [(RUIObjectModel *)self handleElementChange:v12 action:v7 completion:v14];
}

void __65__RUIObjectModel_tableViewOM_elementDidChange_action_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 200);
  *(void *)(v5 + 200) = 0;

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
  }
}

- (void)tableViewOMSubmitForm:(id)a3
{
  id v8 = [(RUIObjectModel *)self visiblePage];
  id v4 = [v8 navigationItem];
  uint64_t v5 = [v4 rightBarButtonItem];
  int v6 = [v5 isEnabled];

  if (v6)
  {
    uint64_t v7 = [v8 rightNavigationBarButtonItem];
    [(RUIObjectModel *)self RUIPage:v8 pressedNavBarButton:v7];
  }
}

- (void)passcodeViewOM:(id)a3 activatedElement:(id)a4 completion:(id)a5
{
}

- (BOOL)webViewOM:(id)a3 shouldStartLoadWithRequest:(id)a4 navigationType:(int64_t)a5
{
  id v8 = a3;
  if (a5) {
    goto LABEL_11;
  }
  id v9 = a4;
  id v10 = [v9 URL];
  char v11 = [v10 fragment];
  uint64_t v12 = [v10 scheme];
  if (![v12 isEqualToString:@"xmlui"])
  {

    goto LABEL_6;
  }
  uint64_t v13 = [v11 length];

  if (!v13)
  {
LABEL_6:
    uint64_t v14 = [v10 relativeString];
    goto LABEL_7;
  }
  uint64_t v14 = [NSString stringWithFormat:@"#%@", v11];
LABEL_7:
  id v15 = (void *)v14;
  int v16 = [v8 attributes];
  uint64_t v17 = (void *)[v16 mutableCopy];
  id v18 = v17;
  if (v17) {
    id v19 = v17;
  }
  else {
    id v19 = (id)objc_opt_new();
  }
  id v20 = v19;

  [v20 setObject:v15 forKeyedSubscript:@"url"];
  id v21 = [v9 HTTPMethod];

  [v20 setObject:v21 forKeyedSubscript:@"httpMethod"];
  uint64_t v22 = [[RUIElement alloc] initWithAttributes:v20 parent:v8];
  [(RUIObjectModel *)self handleElementChange:v22 action:2 completion:0];

LABEL_11:
  return a5 != 0;
}

- (void)_navigateToNextPageAnimated
{
  [(RUIObjectModel *)self navigateToNextPageAnimated:(gAnimatedNavigationTransitions & 1) == 0];
}

- (void)navigateToNextPageAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(NSMutableArray *)self->_defaultPages count];
  uint64_t currentPage = self->_currentPage;
  if (v5 <= currentPage + 1)
  {
    NSLog(&cfstr_WarningNextBut.isa);
  }
  else
  {
    BOOL v7 = v5 > currentPage + 2;
    self->_uint64_t currentPage = currentPage + 1;
    -[NSMutableArray objectAtIndex:](self->_defaultPages, "objectAtIndex:");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    [(NSMutableArray *)self->_displayedPages addObject:v10];
    [(RUIObjectModel *)self _populatePageNavItem:v10 withNextButton:v7];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v9 = [WeakRetained parentViewControllerForObjectModel:self];
    [v9 pushViewController:v10 animated:v3];
  }
}

- (void)RUIPage:(id)a3 pressedNavBarButton:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v6 = (RUIElement *)a4;
  BOOL v7 = [(RUIElement *)v6 attributes];
  id v8 = [v7 objectForKey:@"validationFunction"];
  if (![v8 length]
    || ([MEMORY[0x263F828A0] activeKeyboard],
        id v9 = objc_claimAutoreleasedReturnValue(),
        [v9 acceptAutocorrection],
        v9,
        [(RUIObjectModel *)self validateWithFunction:v8]))
  {
    id v10 = [v7 objectForKey:@"type"];
    if ([v10 isEqualToString:@"nextBarItem"]) {
      [(RUIObjectModel *)self _navigateToNextPageAnimated];
    }
    if ([(RUIElement *)self->_activeElement isEqual:v6])
    {
      if (_isInternalInstall())
      {
        char v11 = _RUILoggingFacility();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          int v16 = v6;
          _os_log_impl(&dword_2144F2000, v11, OS_LOG_TYPE_DEFAULT, "Already handling activation for barButtonItem: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_activeElement, a4);
      if (_isInternalInstall())
      {
        uint64_t v12 = _RUILoggingFacility();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          activeElement = self->_activeElement;
          *(_DWORD *)long long buf = 138412290;
          int v16 = activeElement;
          _os_log_impl(&dword_2144F2000, v12, OS_LOG_TYPE_DEFAULT, "Active barButtonItem set %@", buf, 0xCu);
        }
      }
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __46__RUIObjectModel_RUIPage_pressedNavBarButton___block_invoke;
      v14[3] = &unk_2642113C0;
      v14[4] = self;
      [(RUIObjectModel *)self handleElementChange:v6 action:2 completion:v14];
    }
  }
}

void __46__RUIObjectModel_RUIPage_pressedNavBarButton___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (_isInternalInstall())
  {
    id v2 = _RUILoggingFacility();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 200);
      int v6 = 138412290;
      uint64_t v7 = v3;
      _os_log_impl(&dword_2144F2000, v2, OS_LOG_TYPE_DEFAULT, "Removing active barButtonItem %@", (uint8_t *)&v6, 0xCu);
    }
  }
  uint64_t v4 = *(void *)(a1 + 32);
  unint64_t v5 = *(void **)(v4 + 200);
  *(void *)(v4 + 200) = 0;
}

- (void)RUIPage:(id)a3 toggledEditing:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    [v8 objectModel:self page:v9 toggledEditing:v4];
  }
}

- (unint64_t)supportedInterfaceOrientationsForRUIPage:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    unint64_t v8 = [v7 supportedInterfaceOrientationsForObjectModel:self page:v4];
  }
  else
  {
    unint64_t v8 = 2;
  }

  return v8;
}

- (NSDictionary)updateInfo
{
  return self->_updateInfo;
}

- (RUIObjectModelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RUIObjectModelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)defaultPages
{
  return &self->_defaultPages->super;
}

- (NSDictionary)namedPages
{
  return &self->_namedPages->super;
}

- (RUIElement)activeElement
{
  return self->_activeElement;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (void)setSourceURL:(id)a3
{
}

- (NSURL)scriptURL
{
  return self->_scriptURL;
}

- (void)setScriptURL:(id)a3
{
}

- (NSString)inlineScript
{
  return self->_inlineScript;
}

- (void)setInlineScript:(id)a3
{
}

- (NSString)validationFunction
{
  return self->_validationFunction;
}

- (void)setValidationFunction:(id)a3
{
}

- (NSDictionary)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
}

- (NSDictionary)serverInfo
{
  return self->_serverInfo;
}

- (void)setServerInfo:(id)a3
{
}

- (NSString)idOfObjectModelToReplace
{
  return self->_idOfObjectModelToReplace;
}

- (void)setIdOfObjectModelToReplace:(id)a3
{
}

- (int)refreshDelay
{
  return self->_refreshDelay;
}

- (void)setRefreshDelay:(int)a3
{
  self->_int refreshDelay = a3;
}

- (NSString)refreshURL
{
  return self->_refreshURL;
}

- (void)setRefreshURL:(id)a3
{
}

- (int64_t)nextButtonStyle
{
  return self->_nextButtonStyle;
}

- (void)setNextButtonStyle:(int64_t)a3
{
  self->_nextButtonStyle = a3;
}

- (RUIStyle)style
{
  return self->_style;
}

- (NSString)identifierMarkingStackRemovalAfterPush
{
  return self->_identifierMarkingStackRemovalAfterPush;
}

- (void)setIdentifierMarkingStackRemovalAfterPush:(id)a3
{
}

- (void)setAlert:(id)a3
{
}

- (RUIElement)elementForActivityIndicator
{
  return self->_elementForActivityIndicator;
}

- (NSString)authPasswordEquivalent
{
  return self->_authPasswordEquivalent;
}

- (void)setAuthPasswordEquivalent:(id)a3
{
}

- (NSString)authPasswordFieldID
{
  return self->_authPasswordFieldID;
}

- (void)setAuthPasswordFieldID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authPasswordFieldID, 0);
  objc_storeStrong((id *)&self->_authPasswordEquivalent, 0);
  objc_storeStrong((id *)&self->_elementForActivityIndicator, 0);
  objc_storeStrong((id *)&self->_alert, 0);
  objc_storeStrong((id *)&self->_identifierMarkingStackRemovalAfterPush, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_idOfObjectModelToReplace, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_activeElement, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_updateInfo, 0);
  objc_storeStrong(&self->_webViewDismissHandler, 0);
  objc_storeStrong((id *)&self->_httpHeaders, 0);
  objc_storeStrong((id *)&self->_namedAlerts, 0);
  objc_storeStrong((id *)&self->_primaryAlert, 0);
  objc_storeStrong((id *)&self->_refreshTimer, 0);
  objc_storeStrong((id *)&self->_refreshURL, 0);
  objc_storeStrong((id *)&self->_serverInfo, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_displayedPages, 0);
  objc_storeStrong((id *)&self->_namedPages, 0);
  objc_storeStrong((id *)&self->_defaultPages, 0);
  objc_storeStrong((id *)&self->_validationFunction, 0);
  objc_storeStrong((id *)&self->_inlineScript, 0);
  objc_storeStrong((id *)&self->_scriptURL, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)_logException:(OpaqueJSValue *)a3
{
}

- (BOOL)prepareScriptContext
{
  NSUInteger v3 = [(NSString *)self->_inlineScript length];
  if (v3 && !self->_didInitializeScript)
  {
    [(RUIObjectModel *)self runScript];
    self->_didInitializeScript = 1;
  }
  return v3 != 0;
}

- (BOOL)validateWithFunction:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = (__CFString *)a3;
  if (![(RUIObjectModel *)self prepareScriptContext])
  {
    if (!_isInternalInstall()) {
      goto LABEL_21;
    }
    char v11 = _RUILoggingFacility();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    *(_DWORD *)long long buf = 138412290;
    int v16 = v4;
    uint64_t v12 = "Validation with '%@': No script context!";
LABEL_19:
    _os_log_impl(&dword_2144F2000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
    goto LABEL_20;
  }
  if (![(__CFString *)v4 length])
  {
    if (!_isInternalInstall()) {
      goto LABEL_21;
    }
    char v11 = _RUILoggingFacility();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    *(_DWORD *)long long buf = 138412290;
    int v16 = v4;
    uint64_t v12 = "Validation with '%@': Empty function!";
    goto LABEL_19;
  }
  GlobalObject = JSContextGetGlobalObject(self->_ctx);
  ObjectProperty = getObjectProperty(self->_ctx, GlobalObject, v4);
  if (!ObjectProperty)
  {
    if (_isInternalInstall())
    {
      char v11 = _RUILoggingFacility();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        int v16 = v4;
        uint64_t v12 = "Validation with '%@': Invalid script!";
        goto LABEL_19;
      }
LABEL_20:
    }
LABEL_21:
    LOBYTE(v8) = 1;
    goto LABEL_22;
  }
  JSValueRef exception = 0;
  id v7 = JSObjectCallAsFunction(self->_ctx, ObjectProperty, 0, 0, 0, &exception);
  [(RUIObjectModel *)self _logException:exception];
  if (!JSValueIsBoolean(self->_ctx, v7))
  {
    if (_isInternalInstall())
    {
      id v9 = _RUILoggingFacility();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        int v16 = v4;
        _os_log_impl(&dword_2144F2000, v9, OS_LOG_TYPE_DEFAULT, "Validation with '%@': Didn't return a BOOL!", buf, 0xCu);
      }
      LOBYTE(v8) = 1;
      goto LABEL_27;
    }
    goto LABEL_21;
  }
  BOOL v8 = JSValueToBoolean(self->_ctx, v7);
  if (_isInternalInstall())
  {
    id v9 = _RUILoggingFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = @"false";
      if (v8) {
        id v10 = @"true";
      }
      *(_DWORD *)long long buf = 138412546;
      int v16 = v4;
      __int16 v17 = 2112;
      id v18 = v10;
      _os_log_impl(&dword_2144F2000, v9, OS_LOG_TYPE_DEFAULT, "Validation with '%@': %@", buf, 0x16u);
    }
LABEL_27:
  }
LABEL_22:

  return v8;
}

- (id)objectForJSValue:(OpaqueJSValue *)a3
{
  BOOL IsString = JSValueIsString(self->_ctx, a3);
  ctx = self->_ctx;
  if (!IsString)
  {
    BOOL IsBoolean = JSValueIsBoolean(ctx, a3);
    uint64_t v13 = self->_ctx;
    if (IsBoolean)
    {
      uint64_t v14 = objc_msgSend(NSNumber, "numberWithBool:", JSValueToBoolean(v13, a3));
    }
    else
    {
      BOOL IsNumber = JSValueIsNumber(v13, a3);
      int v16 = self->_ctx;
      if (!IsNumber)
      {
        BOOL IsObject = JSValueIsObject(v16, a3);
        uint64_t v19 = self->_ctx;
        if (IsObject)
        {
          GlobalObject = JSContextGetGlobalObject(v19);
          id v21 = JSStringCreateWithUTF8CString("Array");
          Property = JSObjectGetProperty(self->_ctx, GlobalObject, v21, 0);
          id v10 = 0;
          if (JSValueIsInstanceOfConstructor(self->_ctx, a3, Property, 0))
          {
            int v23 = JSStringCreateWithUTF8CString("length");
            int v24 = JSObjectGetProperty(self->_ctx, a3, v23, 0);
            id v10 = 0;
            if (JSValueIsNumber(self->_ctx, v24))
            {
              uint64_t v25 = (int)JSValueToNumber(self->_ctx, v24, 0);
              if ((int)v25 < 1)
              {
                id v10 = 0;
              }
              else
              {
                id v10 = (__CFString *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v25];
                unsigned int v26 = 0;
                do
                {
                  id v27 = [(RUIObjectModel *)self objectForJSValue:JSObjectGetPropertyAtIndex(self->_ctx, a3, v26, 0)];
                  if (v27) {
                    [(__CFString *)v10 addObject:v27];
                  }

                  ++v26;
                }
                while (v25 != v26);
              }
            }
            JSStringRelease(v23);
          }
          char v11 = v21;
          goto LABEL_4;
        }
        if (!JSValueIsUndefined(v19, a3)) {
          NSLog(&cfstr_XmluiObjectfor.isa);
        }
        goto LABEL_21;
      }
      double v17 = JSValueToNumber(v16, a3, 0);
      *(float *)&double v17 = v17;
      uint64_t v14 = [NSNumber numberWithFloat:v17];
    }
    id v10 = (__CFString *)v14;
    goto LABEL_22;
  }
  JSStringRef v7 = JSValueToStringCopy(ctx, a3, 0);
  if (v7)
  {
    BOOL v8 = v7;
    CFAllocatorRef Default = CFAllocatorGetDefault();
    id v10 = (__CFString *)JSStringCopyCFString(Default, v8);
    char v11 = v8;
LABEL_4:
    JSStringRelease(v11);
    goto LABEL_22;
  }
LABEL_21:
  id v10 = 0;
LABEL_22:
  return v10;
}

- (id)invokeScriptFunction:(id)a3 withArguments:(id)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  char v6 = (__CFString *)a3;
  id v7 = a4;
  if (![(RUIObjectModel *)self prepareScriptContext])
  {
    if (_isInternalInstall())
    {
      uint64_t v30 = _RUILoggingFacility();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
LABEL_37:

        goto LABEL_38;
      }
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v6;
      long long v31 = "Script invocation for '%@': No script context!";
LABEL_36:
      _os_log_impl(&dword_2144F2000, v30, OS_LOG_TYPE_DEFAULT, v31, buf, 0xCu);
      goto LABEL_37;
    }
LABEL_38:
    long long v32 = 0;
    goto LABEL_39;
  }
  if (![(__CFString *)v6 length]) {
    goto LABEL_38;
  }
  GlobalObject = JSContextGetGlobalObject(self->_ctx);
  ObjectProperty = getObjectProperty(self->_ctx, GlobalObject, v6);
  if (!ObjectProperty)
  {
    if (!_isInternalInstall()) {
      goto LABEL_38;
    }
    uint64_t v30 = _RUILoggingFacility();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_37;
    }
    *(_DWORD *)long long buf = 138412290;
    *(void *)&uint8_t buf[4] = v6;
    long long v31 = "Script invocation for '%@': Invalid script!";
    goto LABEL_36;
  }
  id v10 = ObjectProperty;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    id v35 = v10;
    id v36 = v7;
    uint64_t v37 = v6;
    int v14 = 0;
    uint64_t v15 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v46 != v15) {
          objc_enumerationMutation(v11);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              continue;
            }
          }
        }
        ++v14;
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v13);

    if (v14 < 1)
    {
      double v17 = 0;
      id v7 = v36;
      goto LABEL_48;
    }
    double v17 = (JSValueRef *)malloc_type_calloc(v14, 8uLL, 0x6004044C4A2DFuLL);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    obuint64_t j = v11;
    uint64_t v18 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      int v20 = 0;
      uint64_t v40 = *(void *)v42;
      uint64_t v39 = v17;
LABEL_18:
      uint64_t v21 = 0;
      while (1)
      {
        if (*(void *)v42 != v40) {
          objc_enumerationMutation(obj);
        }
        if (v20 == v14) {
          goto LABEL_32;
        }
        uint64_t v22 = *(__CFString **)(*((void *)&v41 + 1) + 8 * v21);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          ctx = self->_ctx;
          [(__CFString *)v22 floatValue];
          uint64_t v28 = ctx;
          double v17 = v39;
          JSValueRef Number = JSValueMakeNumber(v28, v27);
          goto LABEL_28;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          JSValueRef Number = (JSValueRef)[(__CFString *)v22 JSValueForContext:self->_ctx];
LABEL_28:
          JSValueRef String = Number;
LABEL_29:
          v17[v20++] = String;
        }
        if (v19 == ++v21)
        {
          uint64_t v19 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
          if (v19) {
            goto LABEL_18;
          }
          goto LABEL_32;
        }
      }
      int v23 = JSStringCreateWithCFString(v22);
      JSValueRef String = JSValueMakeString(self->_ctx, v23);
      uint64_t v25 = v23;
      double v17 = v39;
      JSStringRelease(v25);
      goto LABEL_29;
    }
LABEL_32:
    id v7 = v36;
    char v6 = v37;
  }
  else
  {
    int v14 = 0;
    double v17 = 0;
  }

LABEL_48:
  *(void *)long long buf = 0;
  JSValueRef v34 = JSObjectCallAsFunction(self->_ctx, v10, 0, v14, v17, (JSValueRef *)buf);
  [(RUIObjectModel *)self _logException:*(void *)buf];
  if (v17) {
    free(v17);
  }
  long long v32 = -[RUIObjectModel objectForJSValue:](self, "objectForJSValue:", v34, v35, v36, v37);
LABEL_39:

  return v32;
}

- (OpaqueJSContext)jsContextRef
{
  uint64_t result = self->_ctx;
  if (!result)
  {
    id v4 = JSGlobalContextCreate(0);
    [(RUIObjectModel *)self setJSGlobalContext:v4];
    JSGlobalContextRelease(v4);
    return self->_ctx;
  }
  return result;
}

- (void)runScript
{
  NSUInteger v3 = self->_inlineScript;
  id v4 = [(RUIObjectModel *)self jsContextRef];
  GlobalObject = JSContextGetGlobalObject(v4);
  char v6 = RUIJSObjectModel_class();
  id v7 = JSObjectMake(v4, v6, self);
  BOOL v8 = JSStringCreateWithCFString(@"xmlui");
  JSValueRef exception = 0;
  JSObjectSetProperty(v4, GlobalObject, v8, v7, 0xAu, &exception);
  [(RUIObjectModel *)self _logException:exception];
  JSStringRelease(v8);
  JSValueRef v10 = 0;
  id v9 = JSStringCreateWithCFString(v3);
  JSEvaluateScript(v4, v9, 0, 0, 0, &v10);
  [(RUIObjectModel *)self _logException:v10];

  JSStringRelease(v9);
}

- (void)setJSGlobalContext:(OpaqueJSContext *)a3
{
  ctx = self->_ctx;
  if (ctx != a3)
  {
    if (ctx) {
      JSGlobalContextRelease(ctx);
    }
    if (a3) {
      JSGlobalContextRetain(a3);
    }
    self->_ctx = a3;
  }
}

- (void)initializeSwift
{
  id v2 = self;
  RUIObjectModel.initializeSwift()();
}

- (void)setDecodingUserInfo:(id)a3
{
  id v6 = a3;
  id v4 = a3;
  unint64_t v5 = self;
  sub_214558138((uint64_t)&v6, (uint64_t)&type metadata for DecodingUserInfoAssociatedKey, (uint64_t)&type metadata for DecodingUserInfoAssociatedKey, (uint64_t)&off_26B4A8778);
}

- (void)jsInterfaceForElementId:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_214602EA8();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  id v7 = self;
  RUIObjectModel.jsInterface(for:)(v4, v6);
  id v9 = v8;

  swift_bridgeObjectRelease();
  return v9;
}

- (void)notifyXMLUIDataChange
{
  id v2 = self;
  sub_214557F78((uint64_t)&type metadata for XMLUIDataAssociatedKey, (uint64_t)&off_26B4A8670, (uint64_t)&v3);
  type metadata accessor for XMLUIData();
  sub_2145536B0();
  sub_2146023D8();
  swift_release();
  sub_2146023F8();

  swift_release();
}

- (void)setActivityIndicatorStatus:(BOOL)a3 forElement:(id)a4
{
  uint64_t v6 = (RUIElement *)a4;
  id v7 = self;
  RUIObjectModel.setActivityIndicatorStatus(_:forElement:)(a3, v6);
}

void __78__RUIObjectModel_handleAppleIDAuthenticationIfNeededForAttributes_completion___block_invoke_2_cold_1()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getAKAuthenticationUsernameKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"RUIObjectModel.m", 55, @"%s", dlerror());

  __break(1u);
}

void __56__RUIObjectModel_handleElementChange_action_completion___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = *(_DWORD *)(a1 + 56);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_2144F2000, a2, OS_LOG_TYPE_ERROR, "No url/action attribute specified or action (%u) not activated.", (uint8_t *)v3, 8u);
}

- (void)_handleLinkPress:(uint64_t)a1 attributes:(uint64_t)a2 completion:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_2144F2000, log, OS_LOG_TYPE_ERROR, "Error opening sensitive url %@ - %@", (uint8_t *)&v3, 0x16u);
}

@end