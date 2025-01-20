@interface SUScriptInterface
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (int64_t)purchaseAnimationStyleFromString:(id)a3;
+ (void)initialize;
- (BOOL)arePodcastsDisabled;
- (BOOL)canSendEmail;
- (BOOL)checkCapabilitiesPropertyListString:(id)a3 showFailureDialog:(BOOL)a4;
- (BOOL)haveAccount;
- (BOOL)isExplicitContentDisabled;
- (BOOL)isRunningTest;
- (BOOL)launchedToTest;
- (BOOL)scriptXMLHTTPRequest:(id)a3 requiresCellularForURL:(id)a4;
- (BOOL)scriptXMLHTTPStoreRequest:(id)a3 requiresCellularForURL:(id)a4;
- (BOOL)shouldRestrictContentOfSystem:(id)a3 level:(id)a4;
- (BOOL)shouldShowAddToWalletLink:(id)a3;
- (BOOL)showConfirmWithMessage:(id)a3 title:(id)a4 okButtonTitle:(id)a5 cancelButtonTitle:(id)a6;
- (NSArray)accounts;
- (NSArray)deviceOffers;
- (NSArray)installedSoftwareApplications;
- (NSNumber)orientation;
- (NSNumber)safariDismissButtonStyle;
- (NSString)actionTypeDismissSheet;
- (NSString)actionTypeDismissWindows;
- (NSString)actionTypeReturnToLibrary;
- (NSString)askToBuyPrompt;
- (NSString)clientIdentifier;
- (NSString)cookie;
- (NSString)cookieDefaultURL;
- (NSString)cookieForDefaultURL;
- (NSString)deviceSerialNumber;
- (NSString)gsToken;
- (NSString)referrerURL;
- (NSString)referringUserAgent;
- (NSString)safariViewControllerIdentifier;
- (NSString)safariViewControllerIdentifierQueryParameterName;
- (NSString)storeFrontIdentifier;
- (NSString)tidState;
- (NSString)userAgent;
- (OpaqueJSContext)copyJavaScriptContext;
- (SFSafariViewController)safariViewController;
- (SSAuthenticationContext)authenticationContext;
- (SUClientInterface)clientInterface;
- (SUScriptAccount)primaryAccount;
- (SUScriptAccount)primaryLockerAccount;
- (SUScriptAppleAccountStore)appleAccountStore;
- (SUScriptApplication)application;
- (SUScriptCarrierBundlingController)carrierBundlingController;
- (SUScriptDevice)device;
- (SUScriptDictionary)scriptStoreBagDictionary;
- (SUScriptDictionary)tidHeaders;
- (SUScriptFairPlayContext)accountCreationSecureContext;
- (SUScriptInterface)init;
- (SUScriptInterfaceDelegate)delegate;
- (SUScriptInterfaceDelegate)threadSafeDelegate;
- (SUScriptKeyValueStore)applicationLocalStorage;
- (SUScriptKeyValueStore)deviceLocalStorage;
- (SUScriptMediaLibrary)mediaLibrary;
- (SUScriptMetricsController)metricsController;
- (SUScriptNavigationBar)navigationBar;
- (SUScriptNavigationSimulator)navigationSimulator;
- (SUScriptPassbookLibrary)passbookLibrary;
- (SUScriptPreviewOverlay)previewOverlay;
- (SUScriptProtocol)protocol;
- (SUScriptPurchaseManager)purchaseManager;
- (SUScriptSectionsController)sectionsController;
- (SUScriptTelephony)telephony;
- (SUScriptViewController)viewController;
- (SUScriptWindow)window;
- (SUScriptWindowContext)scriptWindowContext;
- (WebFrame)webFrame;
- (id)DOMElementWithElement:(id)a3;
- (id)_className;
- (id)_cookieForURL:(id)a3;
- (id)_copyDialogWithMessage:(id)a3 title:(id)a4 cancelButtonTitle:(id)a5 okButtonTitle:(id)a6;
- (id)accountDSID;
- (id)accountForDSID:(id)a3;
- (id)accountName;
- (id)activeAudioPlayers;
- (id)activeNetworkType;
- (id)applicationAccessibilityEnabled;
- (id)creditCardReaderAvailable;
- (id)currentAccount;
- (id)currentAttestationVersion;
- (id)diskSpaceAvailable;
- (id)getAudioPlayerForURL:(id)a3 keyURL:(id)a4 certificateURL:(id)a5;
- (id)getDownloadQueueWithQueueType:(id)a3;
- (id)getiTunesPass;
- (id)globalRootObject;
- (id)hardwareType;
- (id)isApplePayAvailable;
- (id)isFinanceInterruption;
- (id)isWalletAvailable;
- (id)loggingEnabled;
- (id)machineGUID;
- (id)makeAMSViewController;
- (id)makeAccount;
- (id)makeAccountPageWithURLs:(id)a3;
- (id)makeActivity;
- (id)makeActivityItemProviderWithMIMEType:(id)a3;
- (id)makeActivityViewControllerWithProviders:(id)a3 activities:(id)a4;
- (id)makeButtonWithSystemItemString:(id)a3 action:(id)a4;
- (id)makeButtonWithTitle:(id)a3 action:(id)a4;
- (id)makeCalloutView;
- (id)makeCanvasWithWidth:(id)a3 height:(id)a4;
- (id)makeColorWithHue:(id)a3 saturation:(id)a4 brightness:(id)a5 alpha:(id)a6;
- (id)makeColorWithRed:(id)a3 green:(id)a4 blue:(id)a5 alpha:(id)a6;
- (id)makeColorWithWhite:(id)a3 alpha:(id)a4;
- (id)makeComposeReviewViewControllerWithReview:(id)a3;
- (id)makeDateFormatter;
- (id)makeDialog;
- (id)makeDocumentInteractionController;
- (id)makeDonationViewControllerWithCharityIdentifier:(id)a3;
- (id)makeFacebookRequestWithURL:(id)a3 requestMethod:(id)a4;
- (id)makeFacebookSessionWithAccount:(id)a3;
- (id)makeFamilySetupViewController;
- (id)makeGiftViewController;
- (id)makeLinearGradientWithX0:(double)a3 y0:(double)a4 x1:(double)a5 y1:(double)a6;
- (id)makeLookupRequest;
- (id)makeMediaPlayerItemWithProperties:(id)a3;
- (id)makeMediaPlayerViewControllerWithMediaPlayerItem:(id)a3;
- (id)makeMenuViewController;
- (id)makeNavigationControllerWithRootViewController:(id)a3;
- (id)makeNumberFormatterWithStyle:(id)a3;
- (id)makePopOverWithViewController:(id)a3;
- (id)makeRadialGradientWithX0:(double)a3 y0:(double)a4 r0:(double)a5 x1:(double)a6 y1:(double)a7 r1:(double)a8;
- (id)makeRedeemCameraViewController;
- (id)makeRedeemViewController;
- (id)makeReportAProblemViewControllerWithAdamID:(id)a3;
- (id)makeReviewWithAdamID:(id)a3;
- (id)makeScriptActionWithType:(id)a3;
- (id)makeSegmentedControl;
- (id)makeSplitViewController;
- (id)makeStorePageWithURLs:(id)a3;
- (id)makeStoreSheetViewController;
- (id)makeSubscriptionStatusRequest;
- (id)makeTextFieldWithStyle:(id)a3 placeholder:(id)a4 value:(id)a5 width:(id)a6;
- (id)makeURLRequestWithURLs:(id)a3 timeoutInterval:(id)a4;
- (id)makeVolumeViewController;
- (id)makeWindow;
- (id)makeXMLHTTPRequest;
- (id)makeXMLHTTPStoreRequest;
- (id)minimumAttestationVersionForAction:(unint64_t)a3;
- (id)parentViewController;
- (id)presentPrivacySplashWithIdentifier:(id)a3;
- (id)presentPrivacyViewControllerWithIdentifier:(id)a3;
- (id)primaryiCloudAccount;
- (id)redeemCameraAvailable;
- (id)requestInfo;
- (id)safariViewControllerDismissButtonStyle;
- (id)screenReaderRunning;
- (id)scriptAttributeKeys;
- (id)shouldDisplayPrivacyLinkWithIdentifier:(id)a3;
- (id)showPromptWithMessage:(id)a3 initialValue:(id)a4 title:(id)a5 okButtonTitle:(id)a6 cancelButtonTitle:(id)a7;
- (id)softwareApplicationWithAdamID:(id)a3;
- (id)softwareApplicationWithBundleID:(id)a3;
- (id)subscriptionStatusCoordinator;
- (id)systemItemAction;
- (id)systemItemAdd;
- (id)systemItemBookmarks;
- (id)systemItemCamera;
- (id)systemItemCancel;
- (id)systemItemCompose;
- (id)systemItemDone;
- (id)systemItemEdit;
- (id)systemItemFastForward;
- (id)systemItemFixedSpace;
- (id)systemItemFlexibleSpace;
- (id)systemItemOrganize;
- (id)systemItemPageCurl;
- (id)systemItemPause;
- (id)systemItemPlay;
- (id)systemItemRedo;
- (id)systemItemRefresh;
- (id)systemItemReplay;
- (id)systemItemRewind;
- (id)systemItemSearch;
- (id)systemItemStop;
- (id)systemItemTrash;
- (id)systemItemUndo;
- (id)systemVersion;
- (int64_t)dialogDisplayCountForKey:(id)a3;
- (int64_t)storeSheetType;
- (int64_t)storeSheetTypeAskToBuy;
- (int64_t)storeSheetTypeDefault;
- (void)_accessibilityPostLayoutChange;
- (void)_cleanUpSafariViewController;
- (void)_dismissSafariViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)_finishCreditCardReaderWithOutput:(id)a3 callback:(id)a4;
- (void)_getSoftwareApplicationWithCompletionFunction:(id)a3 lookupBlock:(id)a4;
- (void)_globalEventNotification:(id)a3;
- (void)_presentSafariViewControllerWithURL:(id)a3 safariIdentifier:(id)a4 animated:(BOOL)a5;
- (void)_scriptUserInfoDidChangeNotification:(id)a3;
- (void)accessibilityPostLayoutChange;
- (void)accessibilityPostScreenChange;
- (void)acknowledgePrivacyLinkWithIdentifier:(id)a3;
- (void)addExternalDownloads:(id)a3;
- (void)addExternalDownloads:(id)a3 options:(id)a4;
- (void)addExternalDownloadsFromManifestURL:(id)a3;
- (void)addPurchaseWithInfo:(id)a3;
- (void)addPurchaseWithInfo:(id)a3 options:(id)a4;
- (void)addiTunesPassWithCompletionFunction:(id)a3;
- (void)approveInPerson:(id)a3 completionFunction:(id)a4;
- (void)authenticateAppleIdWithUsername:(id)a3 password:(id)a4 callback:(id)a5;
- (void)authenticateForAccount:(id)a3 withOptions:(id)a4;
- (void)authorizeApplePayEnrollmentWithParameters:(id)a3 callback:(id)a4;
- (void)composeEmailWithSubject:(id)a3 body:(id)a4;
- (void)composeReviewWithURL:(id)a3 itemIdentifier:(id)a4 type:(id)a5;
- (void)dealloc;
- (void)deallocAuthentication;
- (void)deallocCarrierBundlingController;
- (void)deallocMediaLibrary;
- (void)deallocMetricsController;
- (void)deallocSubscriptionStatusCoordinator;
- (void)dismissSafariViewControllerAnimated:(BOOL)a3;
- (void)dismissSheet;
- (void)dismissWindowsWithOptions:(id)a3;
- (void)dispatchGlobalEventWithName:(id)a3 payload:(id)a4;
- (void)dispatchXEvent:(id)a3;
- (void)fetchAppleCardMetadata:(id)a3 callback:(id)a4;
- (void)fetchWalletCardData:(id)a3;
- (void)fetchWalletCardMetadata:(id)a3 callback:(id)a4;
- (void)financeInterruptionResolved:(id)a3;
- (void)finishedTest:(id)a3 extraResults:(id)a4;
- (void)getInstalledSoftwareApplicationsWithCompletionFunction:(id)a3;
- (void)getSoftwareApplicationWithAdamID:(id)a3 completionFunction:(id)a4;
- (void)getSoftwareApplicationWithBundleID:(id)a3 completionFunction:(id)a4;
- (void)goBack;
- (void)gotoStoreURL:(id)a3;
- (void)gotoStoreURL:(id)a3 ofType:(id)a4 withAuthentication:(BOOL)a5 forceAuthentication:(BOOL)a6;
- (void)handleDialogPropertyListString:(id)a3;
- (void)handleProtocolPropertyListString:(id)a3;
- (void)initAuthentication;
- (void)log:(id)a3;
- (void)openCreditCardReaderWithCompletionFunction:(id)a3;
- (void)openFamilyCircleSetupWithClientName:(id)a3 completionFunction:(id)a4;
- (void)openURL:(id)a3;
- (void)openWallet;
- (void)paymentSetupFeatureSupported:(id)a3 callback:(id)a4;
- (void)perfLog:(id)a3;
- (void)performPurchaseAnimationForIdentifier:(id)a3 style:(id)a4;
- (void)pingURL:(id)a3;
- (void)redeemCode:(id)a3;
- (void)redeemCodes:(id)a3 params:(id)a4 completion:(id)a5;
- (void)redeemCodesReloadDownloadManager;
- (void)registerNavBarButtonWithTitle:(id)a3 side:(id)a4 function:(id)a5;
- (void)reloadFooterSection:(id)a3 withURL:(id)a4;
- (void)removeDeviceOfferWithIdentifier:(id)a3 account:(id)a4;
- (void)reportAProblemForIdentifier:(id)a3;
- (void)requireCellularForResourceWithURL:(id)a3;
- (void)retryAllRestoreDownloads;
- (void)safariViewController:(id)a3 didCompleteInitialLoad:(BOOL)a4;
- (void)safariViewControllerDidFinish:(id)a3;
- (void)selectSectionWithIdentifier:(id)a3;
- (void)sendPostOfType:(id)a3 withOptions:(id)a4;
- (void)setAccounts:(id)a3;
- (void)setAuthenticationContext:(id)a3;
- (void)setCarrierBundlingController:(id)a3;
- (void)setClientInterface:(id)a3;
- (void)setCookie:(id)a3;
- (void)setCookieDefaultURL:(id)a3;
- (void)setCookieForDefaultURL:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDevice:(id)a3;
- (void)setGlobalRootObject:(id)a3;
- (void)setGsToken:(id)a3;
- (void)setLibraryIdentifierWithType:(id)a3 value:(id)a4;
- (void)setLoggingEnabled:(id)a3;
- (void)setMediaLibrary:(id)a3;
- (void)setMetricsController:(id)a3;
- (void)setNavigationBar:(id)a3;
- (void)setNavigationSimulator:(id)a3;
- (void)setOrientation:(id)a3;
- (void)setPrimaryAccount:(id)a3;
- (void)setPrimaryLockerAccount:(id)a3;
- (void)setReferrerURL:(id)a3;
- (void)setReferringUserAgent:(id)a3;
- (void)setSafariDismissButtonStyle:(id)a3;
- (void)setSafariViewController:(id)a3;
- (void)setSafariViewControllerDismissButtonStyle:(id)a3;
- (void)setSafariViewControllerIdentifier:(id)a3;
- (void)setScriptWindowContext:(id)a3;
- (void)setStoreFrontIdentifier:(id)a3;
- (void)setSubscriptionStatusCoordinator:(id)a3;
- (void)setTidHeaders:(id)a3;
- (void)setTidState:(id)a3;
- (void)setUserAgent:(id)a3;
- (void)setWalletAvailable:(id)a3;
- (void)setWebFrame:(id)a3;
- (void)setWindow:(id)a3;
- (void)showAlertWithMessage:(id)a3 title:(id)a4 buttonTitle:(id)a5;
- (void)showMediaPlayerWithURLString:(id)a3 orientation:(id)a4 title:(id)a5 subtitle:(id)a6 bookmarkID:(id)a7 duration:(id)a8 type:(id)a9 imageURL:(id)a10;
- (void)showMediaPreviewWithURLString:(id)a3;
- (void)showSafariViewControllerWithURLString:(id)a3 identifier:(id)a4 animated:(BOOL)a5;
- (void)signOutPrimaryAccount;
- (void)signupInWallet:(id)a3 callback:(id)a4;
- (void)startListeningForAuthenticationTokenWithCallback:(id)a3;
- (void)startedTest:(id)a3;
- (void)stopListeningForAuthenticationToken;
@end

@implementation SUScriptInterface

- (void)deallocSubscriptionStatusCoordinator
{
}

- (id)subscriptionStatusCoordinator
{
  [(SUScriptObject *)self lock];
  subscriptionStatusCoordinator = self->_subscriptionStatusCoordinator;
  v4 = subscriptionStatusCoordinator;
  if (!subscriptionStatusCoordinator)
  {
    v5 = objc_alloc_init(SUScriptSubscriptionStatusCoordinator);
    self->_subscriptionStatusCoordinator = v5;
    [(SUScriptObject *)v5 setVisible:1];
    v4 = self->_subscriptionStatusCoordinator;
  }
  v6 = v4;
  [(SUScriptObject *)self unlock];
  if (!subscriptionStatusCoordinator) {
    [(SUScriptObject *)self checkInScriptObject:v6];
  }

  return v6;
}

- (void)setSubscriptionStatusCoordinator:(id)a3
{
  v3 = (void *)MEMORY[0x263F1FA90];
  uint64_t v4 = [NSString stringWithFormat:@"%@ is readonly", @"subscriptionStatusCoordinator"];

  [v3 throwException:v4];
}

- (BOOL)launchedToTest
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  WebThreadRunOnMainThread();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __61__SUScriptInterface_SUScriptTestingAdditions__launchedToTest__block_invoke(uint64_t a1)
{
  uint64_t result = [(id)*MEMORY[0x263F1D020] launchedToTest];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)isRunningTest
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  WebThreadRunOnMainThread();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __60__SUScriptInterface_SUScriptTestingAdditions__isRunningTest__block_invoke(uint64_t a1)
{
  uint64_t result = [(id)*MEMORY[0x263F1D020] isRunningTest];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)startedTest:(id)a3
{
}

uint64_t __59__SUScriptInterface_SUScriptTestingAdditions__startedTest___block_invoke(uint64_t a1)
{
  return [(id)*MEMORY[0x263F1D020] startedTest:*(void *)(a1 + 32)];
}

- (void)finishedTest:(id)a3 extraResults:(id)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_7;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v6 = 0;
  if (a4 && (isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = objc_msgSend(a4, "copyArrayOrDictionaryWithContext:", objc_msgSend(+[SUClientDispatch scriptExecutionContext](SUClientDispatch, "scriptExecutionContext"), "globalExecutionContext"));
      goto LABEL_8;
    }
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
LABEL_7:
    uint64_t v6 = 0;
  }
LABEL_8:
  WebThreadRunOnMainThread();
}

uint64_t __73__SUScriptInterface_SUScriptTestingAdditions__finishedTest_extraResults___block_invoke(uint64_t a1)
{
  return [(id)*MEMORY[0x263F1D020] finishedTest:*(void *)(a1 + 32) extraResults:*(void *)(a1 + 40)];
}

- (SUScriptInterface)init
{
  v15.receiver = self;
  v15.super_class = (Class)SUScriptInterface;
  char v2 = [(SUScriptObject *)&v15 init];
  v3 = v2;
  if (v2)
  {
    [(SUScriptInterface *)v2 initAuthentication];
    uint64_t v4 = objc_alloc_init(SUScriptNotificationObserver);
    notificationObserver = v3->_notificationObserver;
    v3->_notificationObserver = v4;

    [(SUScriptNotificationObserver *)v3->_notificationObserver addEventReceiver:v3];
    safariDismissButtonStyle = v3->_safariDismissButtonStyle;
    v3->_safariDismissButtonStyle = (NSNumber *)&unk_26DBD7B20;

    char v7 = objc_alloc_init(SUScriptOperationDelegate);
    scriptOperationDelegate = v3->_scriptOperationDelegate;
    v3->_scriptOperationDelegate = v7;

    v9 = objc_alloc_init(SUScriptStoreBagLoader);
    scriptStoreBagLoader = v3->_scriptStoreBagLoader;
    v3->_scriptStoreBagLoader = v9;

    v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 addObserver:v3 selector:sel__globalEventNotification_ name:@"SUScriptInterfaceGlobalEventNotification" object:0];
    [v11 addObserver:v3 selector:sel__scriptUserInfoDidChangeNotification_ name:@"SUStorePageViewControllerScriptUserInfoDidChangeNotification" object:0];
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.SUScriptInterface.hsaToken", 0);
    hsaTokenQueue = v3->_hsaTokenQueue;
    v3->_hsaTokenQueue = (OS_dispatch_queue *)v12;

    v3->_hsaCurrentIdentifier = 0;
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:@"SUScriptInterfaceGlobalEventNotification" object:0];
  [v3 removeObserver:self name:@"SUStorePageViewControllerScriptUserInfoDidChangeNotification" object:0];
  [(SUScriptInterface *)self deallocAuthentication];
  [(SUScriptInterface *)self deallocCarrierBundlingController];
  [(SUScriptInterface *)self deallocMediaLibrary];
  [(SUScriptInterface *)self deallocMetricsController];
  [(SUScriptInterface *)self deallocSubscriptionStatusCoordinator];
  [(SUScriptNotificationObserver *)self->_notificationObserver removeEventReceiver:self];
  [(SUScriptOperationDelegate *)self->_scriptOperationDelegate cancelAllOperations];
  [(SUScriptInterface *)self stopListeningForAuthenticationToken];

  v4.receiver = self;
  v4.super_class = (Class)SUScriptInterface;
  [(SUScriptObject *)&v4 dealloc];
}

- (SSAuthenticationContext)authenticationContext
{
  [(SUScriptObject *)self lock];
  v3 = self->_authenticationContext;
  [(SUScriptObject *)self unlock];

  return v3;
}

- (SUClientInterface)clientInterface
{
  [(SUScriptObject *)self lock];
  v3 = self->_clientInterface;
  [(SUScriptObject *)self unlock];

  return v3;
}

- (OpaqueJSContext)copyJavaScriptContext
{
  [(SUScriptObject *)self lock];
  v3 = [(WebFrame *)self->_frame globalContext];
  objc_super v4 = v3;
  if (v3) {
    JSGlobalContextRetain(v3);
  }
  [(SUScriptObject *)self unlock];
  return v4;
}

- (SUScriptInterfaceDelegate)delegate
{
  [(SUScriptObject *)self lock];
  v3 = self->_delegate;
  [(SUScriptObject *)self unlock];

  return v3;
}

- (SUScriptKeyValueStore)deviceLocalStorage
{
  [(SUScriptObject *)self lock];
  deviceLocalStorage = self->_deviceLocalStorage;
  if (!deviceLocalStorage)
  {
    objc_super v4 = [[SUScriptKeyValueStore alloc] initWithDomain:@"com.apple.iTunesStoreUI.script.device"];
    v5 = self->_deviceLocalStorage;
    self->_deviceLocalStorage = v4;

    deviceLocalStorage = self->_deviceLocalStorage;
  }
  uint64_t v6 = deviceLocalStorage;
  [(SUScriptObject *)self unlock];

  return v6;
}

- (SUScriptWindowContext)scriptWindowContext
{
  [(SUScriptObject *)self lock];
  v3 = self->_scriptWindowContext;
  [(SUScriptObject *)self unlock];

  return v3;
}

- (void)setAuthenticationContext:(id)a3
{
  uint64_t v6 = (SSAuthenticationContext *)a3;
  [(SUScriptObject *)self lock];
  if (self->_authenticationContext != v6)
  {
    objc_super v4 = (SSAuthenticationContext *)[(SSAuthenticationContext *)v6 copy];
    authenticationContext = self->_authenticationContext;
    self->_authenticationContext = v4;
  }
  [(SUScriptObject *)self unlock];
}

- (void)setClientInterface:(id)a3
{
  v5 = (SUClientInterface *)a3;
  [(SUScriptObject *)self lock];
  if (self->_clientInterface != v5) {
    objc_storeStrong((id *)&self->_clientInterface, a3);
  }
  [(SUScriptObject *)self unlock];
}

- (void)setDelegate:(id)a3
{
  id v7 = a3;
  [(SUScriptObject *)self lock];
  objc_storeStrong((id *)&self->_delegate, a3);
  [self->_threadSafeDelegate setDelegate:self->_delegate];
  id threadSafeDelegate = self->_threadSafeDelegate;
  if (self->_delegate)
  {
    if (threadSafeDelegate) {
      goto LABEL_6;
    }
    id v6 = objc_alloc_init(MEMORY[0x263F89478]);
    [v6 setDelegate:self->_delegate];
    [v6 setShouldMessageMainThread:1];
    id threadSafeDelegate = self->_threadSafeDelegate;
  }
  else
  {
    id v6 = 0;
  }
  self->_id threadSafeDelegate = v6;

LABEL_6:
  [(SUScriptObject *)self unlock];
}

- (void)setScriptWindowContext:(id)a3
{
  v5 = (SUScriptWindowContext *)a3;
  [(SUScriptObject *)self lock];
  if (self->_scriptWindowContext != v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&self->_scriptWindowContext, a3);
    }
  }
  [(SUScriptObject *)self unlock];
}

- (void)setWebFrame:(id)a3
{
  id v6 = (WebFrame *)a3;
  [(SUScriptObject *)self lock];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (self->_frame != v6 && (v6 == 0) | isKindOfClass & 1) {
    objc_storeStrong((id *)&self->_frame, a3);
  }
  [(SUScriptObject *)self unlock];
}

- (SUScriptInterfaceDelegate)threadSafeDelegate
{
  [(SUScriptObject *)self lock];
  id v3 = self->_threadSafeDelegate;
  [(SUScriptObject *)self unlock];

  return (SUScriptInterfaceDelegate *)v3;
}

- (WebFrame)webFrame
{
  [(SUScriptObject *)self lock];
  id v3 = self->_frame;
  [(SUScriptObject *)self unlock];

  return v3;
}

+ (int64_t)purchaseAnimationStyleFromString:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  int64_t v4 = (objc_opt_isKindOfClass() & 1) != 0 && ([v3 isEqualToString:@"float"] & 1) != 0;

  return v4;
}

- (id)DOMElementWithElement:(id)a3
{
  id v4 = a3;
  v5 = [(SUScriptInterface *)self delegate];
  id v6 = [v5 DOMElementForScriptInterface:self element:v4];

  return v6;
}

- (id)parentViewController
{
  id v3 = [(SUScriptInterface *)self delegate];
  id v4 = [v3 parentViewControllerForScriptInterface:self];

  return v4;
}

- (void)acknowledgePrivacyLinkWithIdentifier:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
  }
  else if (v4)
  {
    id v6 = objc_alloc(MEMORY[0x263F894B0]);
    id v7 = [MEMORY[0x263F7B358] contextWithBagType:0];
    v8 = (void *)[v6 initWithBagContext:v7];

    objc_initWeak(&location, v8);
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    v13 = __58__SUScriptInterface_acknowledgePrivacyLinkWithIdentifier___block_invoke;
    v14 = &unk_2648121F0;
    objc_copyWeak(&v17, &location);
    objc_super v15 = self;
    id v9 = v4;
    id v16 = v9;
    [v8 setCompletionBlock:&v11];
    v10 = objc_msgSend(MEMORY[0x263F894E0], "mainQueue", v11, v12, v13, v14, v15);
    [v10 addOperation:v8];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

    return;
  }
  v5 = (void *)MEMORY[0x263F1FA90];

  [v5 throwException:@"Invalid acknowlegement identifier"];
}

void __58__SUScriptInterface_acknowledgePrivacyLinkWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained URLBag];

  if (v3)
  {
    id v4 = [v3 valueForKey:@"privacyAcknowledgementUrl"];
    if (![v4 length]
      || ([NSURL URLWithString:v4], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v6 = [MEMORY[0x263F7B1F8] sharedConfig];
      int v13 = [v6 shouldLog];
      if ([v6 shouldLogToDisk]) {
        int v14 = v13 | 2;
      }
      else {
        int v14 = v13;
      }
      objc_super v15 = [v6 OSLogObject];
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        v14 &= 2u;
      }
      if (v14)
      {
        *(_DWORD *)v23 = 138543618;
        *(void *)&v23[4] = objc_opt_class();
        *(_WORD *)&v23[12] = 2080;
        *(void *)&v23[14] = "-[SUScriptInterface acknowledgePrivacyLinkWithIdentifier:]_block_invoke";
        id v16 = *(id *)&v23[4];
        LODWORD(v22) = 22;
        id v17 = (void *)_os_log_send_and_compose_impl();

        if (!v17) {
          goto LABEL_31;
        }
        objc_super v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v17, 4, v23, v22, *(void *)v23, *(_OWORD *)&v23[8], v24);
        free(v17);
        SSFileLog();
      }

      goto LABEL_31;
    }
    id v6 = v5;
    id v7 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    v10 = [v7 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      v9 &= 2u;
    }
    if (v9)
    {
      *(_DWORD *)v23 = 138543362;
      *(void *)&v23[4] = objc_opt_class();
      id v11 = *(id *)&v23[4];
      LODWORD(v22) = 12;
      uint64_t v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_13:

        [MEMORY[0x263F7B2C0] acknowledgePrivacyLinkWithIdentifier:*(void *)(a1 + 40) URL:v6];
LABEL_31:

        goto LABEL_32;
      }
      v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, v23, v22, *(_OWORD *)v23);
      free(v12);
      SSFileLog();
    }

    goto LABEL_13;
  }
  id v4 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v18 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v19 = v18 | 2;
  }
  else {
    int v19 = v18;
  }
  id v6 = [v4 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    v19 &= 2u;
  }
  if (!v19) {
    goto LABEL_31;
  }
  *(_DWORD *)v23 = 138543618;
  *(void *)&v23[4] = objc_opt_class();
  *(_WORD *)&v23[12] = 2080;
  *(void *)&v23[14] = "-[SUScriptInterface acknowledgePrivacyLinkWithIdentifier:]_block_invoke";
  id v20 = *(id *)&v23[4];
  LODWORD(v22) = 22;
  v21 = (void *)_os_log_send_and_compose_impl();

  if (v21)
  {
    id v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v21, 4, v23, v22, *(void *)v23, *(_OWORD *)&v23[8], v24);
    free(v21);
    SSFileLog();
    goto LABEL_31;
  }
LABEL_32:
}

- (void)addiTunesPassWithCompletionFunction:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }
  else
  {
    uint64_t v5 = [(SUScriptInterface *)self viewController];
    id v6 = [v5 nativeViewController];

    id v7 = [[SUAddiTunesPassOperation alloc] initWithViewController:v6];
    int v8 = [(SUScriptInterface *)self authenticationContext];
    [(SUAddiTunesPassOperation *)v7 setAuthenticationContext:v8];

    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __57__SUScriptInterface_addiTunesPassWithCompletionFunction___block_invoke;
    v10[3] = &unk_264812218;
    int v13 = v7;
    id v11 = v4;
    uint64_t v12 = self;
    [(SUAddiTunesPassOperation *)v7 setCompletionBlock:v10];
    int v9 = [MEMORY[0x263F894E0] mainQueue];
    [v9 addOperation:v7];
  }
}

void __57__SUScriptInterface_addiTunesPassWithCompletionFunction___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  WebThreadRunOnMainThread();
}

void __57__SUScriptInterface_addiTunesPassWithCompletionFunction___block_invoke_2(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  char v2 = [*(id *)(a1 + 48) pass];
  if (v2)
  {
    id v3 = [SUScriptPassbookPass alloc];
    id v4 = [*(id *)(a1 + 48) pass];
    uint64_t v5 = [(SUScriptPassbookPass *)v3 initWithPass:v4];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x263F1FA98] undefined];
  }

  id v6 = [[SUScriptFunction alloc] initWithScriptObject:*(void *)(a1 + 32)];
  [(SUScriptFunction *)v6 setThisObject:*(void *)(a1 + 40)];
  v8[0] = v5;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  [(SUScriptFunction *)v6 callWithArguments:v7];

  [(SUScriptFunction *)v6 setThisObject:0];
}

- (id)currentAttestationVersion
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  id v26 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = objc_alloc_init(MEMORY[0x263F7B138]);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __46__SUScriptInterface_currentAttestationVersion__block_invoke;
  v18[3] = &unk_264812240;
  v18[4] = self;
  id v20 = &v21;
  uint64_t v5 = v3;
  int v19 = v5;
  [v4 getCurrentACLVersionWithCompletion:v18];
  dispatch_time_t v6 = dispatch_time(0, 3000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    id v7 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v8 = [v7 shouldLog];
    int v9 = [v7 shouldLogToDisk];
    v10 = [v7 OSLogObject];
    id v11 = v10;
    if (v9) {
      v8 |= 2u;
    }
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      v8 &= 2u;
    }
    if (v8)
    {
      uint64_t v12 = objc_opt_class();
      int v27 = 138543362;
      v28 = v12;
      id v13 = v12;
      LODWORD(v17) = 12;
      int v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_10:

        goto LABEL_11;
      }
      id v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v27, v17);
      free(v14);
      SSFileLog();
    }

    goto LABEL_10;
  }
LABEL_11:
  id v15 = (id)v22[5];

  _Block_object_dispose(&v21, 8);

  return v15;
}

void __46__SUScriptInterface_currentAttestationVersion__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  if (!v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    goto LABEL_13;
  }
  int v8 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v9 = [v8 shouldLog];
  if ([v8 shouldLogToDisk]) {
    int v10 = v9 | 2;
  }
  else {
    int v10 = v9;
  }
  id v11 = [v8 OSLogObject];
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    v10 &= 2u;
  }
  if (!v10) {
    goto LABEL_10;
  }
  *(_DWORD *)id v15 = 138543618;
  *(void *)&v15[4] = objc_opt_class();
  *(_WORD *)&v15[12] = 2114;
  *(void *)&v15[14] = v7;
  id v12 = *(id *)&v15[4];
  LODWORD(v14) = 22;
  id v13 = (void *)_os_log_send_and_compose_impl();

  if (v13)
  {
    id v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, v15, v14, *(_OWORD *)v15, *(void *)&v15[16], v16);
    free(v13);
    SSFileLog();
LABEL_10:
  }
LABEL_13:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)openCreditCardReaderWithCompletionFunction:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }
  else
  {
    id v4 = v3;
    WebThreadRunOnMainThread();
  }
}

void __64__SUScriptInterface_openCreditCardReaderWithCompletionFunction___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) clientInterface];
  id v3 = [v2 delegate];

  if (objc_opt_respondsToSelector())
  {
    id v4 = [*(id *)(a1 + 32) clientInterface];
    uint64_t v5 = [*(id *)(a1 + 32) parentViewController];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __64__SUScriptInterface_openCreditCardReaderWithCompletionFunction___block_invoke_2;
    v17[3] = &unk_264812268;
    id v6 = *(void **)(a1 + 40);
    v17[4] = *(void *)(a1 + 32);
    id v18 = v6;
    [v3 clientInterface:v4 overrideCreditCardPresentationFromViewController:v5 completion:v17];
  }
  else
  {
    id v7 = objc_alloc_init(SUCreditCardReaderViewController);
    int v8 = (void *)[objc_alloc(MEMORY[0x263F1C7F8]) initWithRootViewController:v7];
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    id v13 = __64__SUScriptInterface_openCreditCardReaderWithCompletionFunction___block_invoke_3;
    uint64_t v14 = &unk_264812268;
    int v9 = *(void **)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 32);
    id v16 = v9;
    [(SUCreditCardReaderViewController *)v7 setCompletionBlock:&v11];
    int v10 = objc_msgSend(*(id *)(a1 + 32), "parentViewController", v11, v12, v13, v14, v15);
    [v10 presentViewController:v8 animated:1 completion:0];
  }
}

uint64_t __64__SUScriptInterface_openCreditCardReaderWithCompletionFunction___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _finishCreditCardReaderWithOutput:a2 callback:*(void *)(a1 + 40)];
}

uint64_t __64__SUScriptInterface_openCreditCardReaderWithCompletionFunction___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _finishCreditCardReaderWithOutput:a2 callback:*(void *)(a1 + 40)];
}

- (void)_finishCreditCardReaderWithOutput:(id)a3 callback:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v8;
  id v7 = v5;
  WebThreadRunOnMainThread();
}

void __64__SUScriptInterface__finishCreditCardReaderWithOutput_callback___block_invoke(void *a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  char v2 = (void *)a1[4];
  if (v2) {
    id v3 = v2;
  }
  else {
    id v3 = (id)objc_opt_new();
  }
  id v4 = v3;
  id v5 = [[SUScriptFunction alloc] initWithScriptObject:a1[5]];
  [(SUScriptFunction *)v5 setThisObject:a1[6]];
  v7[0] = v4;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  [(SUScriptFunction *)v5 callWithArguments:v6];

  [(SUScriptFunction *)v5 setThisObject:0];
}

- (void)openFamilyCircleSetupWithClientName:(id)a3 completionFunction:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    int v10 = [v7 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      int v11 = v9;
    }
    else {
      int v11 = v9 & 2;
    }
    if (!v11) {
      goto LABEL_23;
    }
    int v20 = 138543362;
    id v21 = v6;
    LODWORD(v17) = 12;
    uint64_t v12 = (void *)_os_log_send_and_compose_impl();

    if (v12)
    {
      id v13 = NSString;
LABEL_22:
      int v10 = objc_msgSend(v13, "stringWithCString:encoding:", v12, 4, &v20, v17);
      free(v12);
      SSFileLog();
LABEL_23:
    }
LABEL_24:

    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v14 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v15 = v14 | 2;
    }
    else {
      int v15 = v14;
    }
    int v10 = [v7 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      int v16 = v15;
    }
    else {
      int v16 = v15 & 2;
    }
    if (!v16) {
      goto LABEL_23;
    }
    int v20 = 138543362;
    id v21 = v5;
    LODWORD(v17) = 12;
    uint64_t v12 = (void *)_os_log_send_and_compose_impl();

    if (v12)
    {
      id v13 = NSString;
      goto LABEL_22;
    }
    goto LABEL_24;
  }
  id v18 = v6;
  id v19 = v5;
  WebThreadRunOnMainThread();

LABEL_25:
}

void __76__SUScriptInterface_openFamilyCircleSetupWithClientName_completionFunction___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  char v2 = [[SUScriptFunction alloc] initWithScriptObject:*(void *)(a1 + 32)];
  [(SUScriptFunction *)v2 setThisObject:*(void *)(a1 + 40)];
  id v3 = objc_alloc(getFACircleContextClass());
  id v4 = getFACircleEventTypeInitiate();
  id v5 = (void *)[v3 initWithEventType:v4];

  [v5 setClientName:*(void *)(a1 + 48)];
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  id v26 = __Block_byref_object_dispose_;
  id v6 = objc_alloc(getFACircleStateControllerClass());
  id v7 = [*(id *)(a1 + 40) parentViewController];
  id v27 = (id)[v6 initWithPresenter:v7];

  int v8 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v9 = [v8 shouldLog];
  int v10 = [v8 shouldLogToDisk];
  int v11 = [v8 OSLogObject];
  uint64_t v12 = v11;
  if (v10) {
    v9 |= 2u;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
    int v13 = v9;
  }
  else {
    int v13 = v9 & 2;
  }
  if (!v13) {
    goto LABEL_9;
  }
  uint64_t v14 = v23[5];
  int v28 = 138543618;
  uint64_t v29 = v14;
  __int16 v30 = 2114;
  v31 = v5;
  LODWORD(v18) = 22;
  int v15 = (void *)_os_log_send_and_compose_impl();

  if (v15)
  {
    uint64_t v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v28, v18);
    free(v15);
    SSFileLog();
LABEL_9:
  }
  int v16 = (void *)v23[5];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __76__SUScriptInterface_openFamilyCircleSetupWithClientName_completionFunction___block_invoke_81;
  v19[3] = &unk_2648122E0;
  id v21 = &v22;
  uint64_t v17 = v2;
  int v20 = v17;
  [v16 performOperationWithContext:v5 completion:v19];

  _Block_object_dispose(&v22, 8);
}

void __76__SUScriptInterface_openFamilyCircleSetupWithClientName_completionFunction___block_invoke_81(uint64_t a1, int a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v7 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v8 = v7 | 2;
  }
  else {
    int v8 = v7;
  }
  int v9 = [v6 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
    int v10 = v8;
  }
  else {
    int v10 = v8 & 2;
  }
  if (!v10) {
    goto LABEL_12;
  }
  uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v12 = "NO";
  if (a2) {
    uint64_t v12 = "YES";
  }
  int v25 = 138543874;
  uint64_t v26 = v11;
  __int16 v27 = 2082;
  int v28 = v12;
  __int16 v29 = 2114;
  id v30 = v5;
  LODWORD(v23) = 32;
  uint64_t v22 = &v25;
  int v13 = (void *)_os_log_send_and_compose_impl();

  if (v13)
  {
    int v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v25, v23);
    free(v13);
    uint64_t v22 = (int *)v9;
    SSFileLog();
LABEL_12:
  }
  uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
  int v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = 0;

  if (v5) {
    int v16 = [[SUScriptError alloc] initWithError:v5];
  }
  else {
    int v16 = 0;
  }
  uint64_t v17 = (id *)MEMORY[0x263EFFB40];
  uint64_t v18 = *(void **)(a1 + 32);
  if (!a2) {
    uint64_t v17 = (id *)MEMORY[0x263EFFB38];
  }
  id v19 = *v17;
  v24[0] = v19;
  int v20 = v16;
  if (!v16)
  {
    int v20 = [MEMORY[0x263F1FA98] undefined];
  }
  v24[1] = v20;
  id v21 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v24, 2, v22);
  [v18 callWithArguments:v21];

  if (!v16) {
}
  }

- (void)dispatchGlobalEventWithName:(id)a3 payload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v7 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass())))
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__SUScriptInterface_dispatchGlobalEventWithName_payload___block_invoke;
    block[3] = &unk_2648122B8;
    id v9 = v6;
    id v10 = v7;
    uint64_t v11 = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }
}

void __57__SUScriptInterface_dispatchGlobalEventWithName_payload___block_invoke(uint64_t a1)
{
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    [v6 setObject:v2 forKey:@"name"];
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    [v6 setObject:v3 forKey:@"payload"];
  }
  id v4 = [*(id *)(a1 + 48) parentViewController];
  if (v4) {
    [v6 setObject:v4 forKey:@"viewController"];
  }
  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 postNotificationName:@"SUScriptInterfaceGlobalEventNotification" object:*(void *)(a1 + 48) userInfo:v6];
}

- (void)dispatchXEvent:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(SUScriptInterface *)self copyJavaScriptContext];
    if (v5)
    {
      id v6 = v5;
      id v7 = (void *)[v4 copyArrayOrDictionaryWithContext:v5];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v7;
        WebThreadRunOnMainThread();
      }
      JSGlobalContextRelease(v6);
    }
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }
}

void __36__SUScriptInterface_dispatchXEvent___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) clientInterface];
  [v2 _dispatchXEvent:*(void *)(a1 + 40) withCompletionBlock:0];
}

- (void)fetchAppleCardMetadata:(id)a3 callback:(id)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v6 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v7 = 0;
  }
  uint64_t v37 = MEMORY[0x263EF8330];
  uint64_t v38 = 3221225472;
  v39 = __53__SUScriptInterface_fetchAppleCardMetadata_callback___block_invoke;
  v40 = &unk_264812308;
  id v8 = v7;
  id v41 = v8;
  v42 = self;
  id v9 = (void (**)(void, void, void))MEMORY[0x22A680AE0](&v37);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v20 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v21 = [v20 shouldLog];
    if ([v20 shouldLogToDisk]) {
      int v22 = v21 | 2;
    }
    else {
      int v22 = v21;
    }
    uint64_t v23 = [v20 OSLogObject];
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      v22 &= 2u;
    }
    if (v22)
    {
      uint64_t v24 = objc_opt_class();
      int v45 = 138543362;
      v46 = v24;
      id v25 = v24;
      LODWORD(v36) = 12;
      uint64_t v26 = (void *)_os_log_send_and_compose_impl();

      if (!v26) {
        goto LABEL_39;
      }
      uint64_t v23 = objc_msgSend(NSString, "stringWithCString:encoding:", v26, 4, &v45, v36, v37, v38, v39, v40);
      free(v26);
      SSFileLog();
    }

    goto LABEL_39;
  }
  if ([MEMORY[0x263F89460] shouldUseExtendedEnrollment])
  {
    id v10 = [(objc_class *)getAMSUICardMetadataClass() appleCardIconString];
    uint64_t v11 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v12 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      int v13 = v12 | 2;
    }
    else {
      int v13 = v12;
    }
    uint64_t v14 = [v11 OSLogObject];
    int v15 = v14;
    if (v10)
    {
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        v13 &= 2u;
      }
      if (v13)
      {
        int v16 = objc_opt_class();
        int v45 = 138543362;
        v46 = v16;
        id v17 = v16;
        LODWORD(v36) = 12;
        uint64_t v18 = (void *)_os_log_send_and_compose_impl();

        if (!v18)
        {
LABEL_19:

          v43 = @"cardArtwork";
          v44 = v10;
          id v19 = [NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
          ((void (**)(void, void *, void))v9)[2](v9, v19, 0);
LABEL_47:

          goto LABEL_48;
        }
        int v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v18, 4, &v45, v36, v37, v38, v39, v40);
        free(v18);
        SSFileLog();
      }

      goto LABEL_19;
    }
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      v13 &= 2u;
    }
    if (v13)
    {
      v33 = objc_opt_class();
      int v45 = 138543362;
      v46 = v33;
      id v34 = v33;
      LODWORD(v36) = 12;
      v35 = (void *)_os_log_send_and_compose_impl();

      if (!v35)
      {
LABEL_46:

        id v19 = ISError();
        ((void (**)(void, void, void *))v9)[2](v9, 0, v19);
        goto LABEL_47;
      }
      int v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v35, 4, &v45, v36, v37, v38, v39, v40);
      free(v35);
      SSFileLog();
    }

    goto LABEL_46;
  }
  int v20 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v27 = [v20 shouldLog];
  if ([v20 shouldLogToDisk]) {
    int v28 = v27 | 2;
  }
  else {
    int v28 = v27;
  }
  __int16 v29 = [v20 OSLogObject];
  if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
    v28 &= 2u;
  }
  if (!v28) {
    goto LABEL_38;
  }
  id v30 = objc_opt_class();
  int v45 = 138543362;
  v46 = v30;
  id v31 = v30;
  LODWORD(v36) = 12;
  uint64_t v32 = (void *)_os_log_send_and_compose_impl();

  if (v32)
  {
    __int16 v29 = objc_msgSend(NSString, "stringWithCString:encoding:", v32, 4, &v45, v36, v37, v38, v39, v40);
    free(v32);
    SSFileLog();
LABEL_38:
  }
LABEL_39:

  [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  id v10 = ISError();
  ((void (**)(void, void, void *))v9)[2](v9, 0, v10);
LABEL_48:
}

void __53__SUScriptInterface_fetchAppleCardMetadata_callback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v13[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [[SUScriptFunction alloc] initWithScriptObject:*(void *)(a1 + 32)];
  [(SUScriptFunction *)v7 setThisObject:*(void *)(a1 + 40)];
  if (v6)
  {
    id v8 = [[SUScriptError alloc] initWithError:v6];
    id v9 = [MEMORY[0x263F1FA98] undefined];
    v13[0] = v9;
    v13[1] = v8;
    id v10 = v13;
  }
  else
  {
    id v8 = [[SUScriptDictionary alloc] initWithDictionary:v5];
    v12[0] = v8;
    id v9 = [MEMORY[0x263F1FA98] undefined];
    v12[1] = v9;
    id v10 = v12;
  }
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
  [(SUScriptFunction *)v7 callWithArguments:v11];

  [(SUScriptFunction *)v7 setThisObject:0];
}

- (void)fetchWalletCardData:(id)a3
{
  from[3] = *(id *)MEMORY[0x263EF8340];
  id v4 = a3;
  objc_initWeak(&location, self);
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __41__SUScriptInterface_fetchWalletCardData___block_invoke;
  v35[3] = &unk_264812330;
  objc_copyWeak(&v37, &location);
  id v5 = v4;
  id v36 = v5;
  id v6 = (void (**)(void, void, void))MEMORY[0x22A680AE0](v35);
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v5 = 0;
  }
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy_;
  v33[4] = __Block_byref_object_dispose_;
  id v34 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v11 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v12 = [v11 shouldLog];
    int v13 = [v11 shouldLogToDisk];
    uint64_t v14 = [v11 OSLogObject];
    int v15 = v14;
    if (v13) {
      v12 |= 2u;
    }
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      v12 &= 2u;
    }
    if (v12)
    {
      int v16 = objc_opt_class();
      LODWORD(from[0]) = 138543362;
      *(id *)((char *)from + 4) = v16;
      id v17 = v16;
      LODWORD(v26) = 12;
      uint64_t v18 = (void *)_os_log_send_and_compose_impl();

      if (!v18) {
        goto LABEL_24;
      }
      int v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v18, 4, from, v26);
      free(v18);
      SSFileLog();
    }

    goto LABEL_24;
  }
  if (([MEMORY[0x263F89460] shouldUseExtendedEnrollment] & 1) == 0)
  {
    uint64_t v11 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v19 = [v11 shouldLog];
    int v20 = [v11 shouldLogToDisk];
    int v21 = [v11 OSLogObject];
    int v22 = v21;
    if (v20) {
      v19 |= 2u;
    }
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      v19 &= 2u;
    }
    if (v19)
    {
      uint64_t v23 = objc_opt_class();
      LODWORD(from[0]) = 138543362;
      *(id *)((char *)from + 4) = v23;
      id v24 = v23;
      LODWORD(v26) = 12;
      id v25 = (void *)_os_log_send_and_compose_impl();

      if (!v25)
      {
LABEL_24:

        [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
        id v9 = ISError();
        ((void (**)(void, void, void *))v6)[2](v6, 0, v9);
        goto LABEL_25;
      }
      int v22 = objc_msgSend(NSString, "stringWithCString:encoding:", v25, 4, from, v26);
      free(v25);
      SSFileLog();
    }

    goto LABEL_24;
  }
  id v7 = objc_alloc(MEMORY[0x263F894B0]);
  id v8 = [MEMORY[0x263F7B358] contextWithBagType:0];
  id v9 = (void *)[v7 initWithBagContext:v8];

  objc_initWeak(from, v9);
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __41__SUScriptInterface_fetchWalletCardData___block_invoke_119;
  v27[3] = &unk_264812380;
  objc_copyWeak(&v31, &location);
  objc_copyWeak(&v32, from);
  id v30 = v33;
  int v28 = @"Fetch Wallet Card Data Error";
  __int16 v29 = v6;
  [v9 setCompletionBlock:v27];
  id v10 = [MEMORY[0x263F894E0] mainQueue];
  [v10 addOperation:v9];

  objc_destroyWeak(&v32);
  objc_destroyWeak(&v31);
  objc_destroyWeak(from);
LABEL_25:

  _Block_object_dispose(v33, 8);
  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);
}

void __41__SUScriptInterface_fetchWalletCardData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v56[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = [[SUScriptFunction alloc] initWithScriptObject:*(void *)(a1 + 32)];
  [(SUScriptFunction *)v8 setThisObject:WeakRetained];
  if (!v6)
  {
    id v9 = [v5 cardData];
    [(SUScriptError *)v9 bytes];
    [(SUScriptError *)v9 length];
    uint64_t v12 = ISCopyEncodedBase64();
    int v13 = [v5 brokerURL];
    uint64_t v14 = [v13 absoluteString];

    int v15 = [v5 paymentServicesURL];
    uint64_t v16 = [v15 absoluteString];

    id v17 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v51 = v17;
    v52 = (void *)v16;
    if (v12)
    {
      uint64_t v18 = v17;
      [v17 setObject:v12 forKeyedSubscript:@"cardData"];
      if (v14)
      {
LABEL_5:
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v14, @"brokerURL", v44);
        goto LABEL_26;
      }
LABEL_16:
      id v24 = objc_msgSend(MEMORY[0x263F7B1F8], "sharedConfig", v44);
      int v25 = [v24 shouldLog];
      if ([v24 shouldLogToDisk]) {
        int v26 = v25 | 2;
      }
      else {
        int v26 = v25;
      }
      int v27 = [v24 OSLogObject];
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        v26 &= 2u;
      }
      if (v26)
      {
        int v28 = objc_opt_class();
        int v54 = 138543362;
        id v55 = v28;
        id v48 = v28;
        LODWORD(v46) = 12;
        int v45 = &v54;
        __int16 v29 = (void *)_os_log_send_and_compose_impl();

        if (!v29)
        {
LABEL_25:

          uint64_t v18 = v51;
          uint64_t v16 = (uint64_t)v52;
LABEL_26:
          v50 = (void *)v14;
          if (v16)
          {
            id v30 = (void *)v12;
            id v31 = WeakRetained;
            id v32 = v5;
            [v18 setObject:v16 forKeyedSubscript:@"paymentServicesURL"];
            v33 = (void *)v16;
LABEL_38:
            v40 = v18;
            id v41 = [[SUScriptDictionary alloc] initWithDictionary:v18];
            v53[0] = v41;
            v42 = [MEMORY[0x263F1FA98] undefined];
            v53[1] = v42;
            v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:2];
            [(SUScriptFunction *)v8 callWithArguments:v43];

            id v5 = v32;
            id WeakRetained = v31;
            id v6 = 0;
            id v10 = v30;
            uint64_t v11 = v50;
            goto LABEL_39;
          }
          id v34 = [MEMORY[0x263F7B1F8] sharedConfig];
          int v35 = [v34 shouldLog];
          if ([v34 shouldLogToDisk]) {
            int v36 = v35 | 2;
          }
          else {
            int v36 = v35;
          }
          id v37 = objc_msgSend(v34, "OSLogObject", v45);
          if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
            v36 &= 2u;
          }
          if (v36)
          {
            uint64_t v38 = objc_opt_class();
            int v54 = 138543362;
            id v55 = v38;
            id v49 = v38;
            LODWORD(v46) = 12;
            v39 = (void *)_os_log_send_and_compose_impl();

            if (!v39)
            {
LABEL_37:
              id v30 = (void *)v12;
              id v31 = WeakRetained;
              id v32 = v5;

              uint64_t v18 = v51;
              v33 = v52;
              goto LABEL_38;
            }
            id v37 = objc_msgSend(NSString, "stringWithCString:encoding:", v39, 4, &v54, v46);
            free(v39);
            SSFileLog();
          }

          goto LABEL_37;
        }
        int v27 = objc_msgSend(NSString, "stringWithCString:encoding:", v29, 4, &v54, v46);
        free(v29);
        int v45 = (int *)v27;
        SSFileLog();
      }

      goto LABEL_25;
    }
    int v19 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v20 = [v19 shouldLog];
    if ([v19 shouldLogToDisk]) {
      int v21 = v20 | 2;
    }
    else {
      int v21 = v20;
    }
    int v22 = [v19 OSLogObject];
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      v21 &= 2u;
    }
    if (v21)
    {
      int v54 = 138543362;
      id v55 = (id)objc_opt_class();
      id v47 = v55;
      LODWORD(v46) = 12;
      v44 = &v54;
      uint64_t v23 = (void *)_os_log_send_and_compose_impl();

      if (!v23) {
        goto LABEL_15;
      }
      int v22 = objc_msgSend(NSString, "stringWithCString:encoding:", v23, 4, &v54, v46);
      free(v23);
      v44 = (int *)v22;
      SSFileLog();
    }

LABEL_15:
    uint64_t v18 = v51;
    uint64_t v16 = (uint64_t)v52;
    if (v14) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
  id v9 = [[SUScriptError alloc] initWithError:v6];
  id v10 = [MEMORY[0x263F1FA98] undefined];
  v56[0] = v10;
  v56[1] = v9;
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:2];
  [(SUScriptFunction *)v8 callWithArguments:v11];
LABEL_39:

  [(SUScriptFunction *)v8 setThisObject:0];
}

void __41__SUScriptInterface_fetchWalletCardData___block_invoke_119(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = objc_loadWeakRetained((id *)(a1 + 64));
  id v4 = [v3 URLBag];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 valueForKey:@"applepay-merchant-id"];
    if (v6) {
      goto LABEL_13;
    }
    id v7 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    id v10 = [v7 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      v9 &= 2u;
    }
    if (v9)
    {
      int v45 = 138543362;
      id v46 = (id)objc_opt_class();
      id v11 = v46;
      LODWORD(v42) = 12;
      v40 = &v45;
      uint64_t v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_12:

LABEL_13:
        int v13 = objc_msgSend(v5, "valueForKey:", @"countryCode", v40);
        uint64_t v14 = [v13 uppercaseString];

        if (v14)
        {
          if (v6) {
            goto LABEL_47;
          }
LABEL_36:
          __int16 v29 = objc_msgSend(MEMORY[0x263F7B1F8], "sharedConfig", v41);
          int v30 = [v29 shouldLog];
          if ([v29 shouldLogToDisk]) {
            int v31 = v30 | 2;
          }
          else {
            int v31 = v30;
          }
          id v32 = [v29 OSLogObject];
          if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
            v31 &= 2u;
          }
          if (v31)
          {
            v33 = objc_opt_class();
            int v45 = 138543362;
            id v46 = v33;
            id v34 = v33;
            LODWORD(v42) = 12;
            int v35 = (void *)_os_log_send_and_compose_impl();

            if (!v35)
            {
LABEL_45:

              [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
              uint64_t v21 = ISError();
              goto LABEL_46;
            }
            id v32 = objc_msgSend(NSString, "stringWithCString:encoding:", v35, 4, &v45, v42);
            free(v35);
            SSFileLog();
          }

          goto LABEL_45;
        }
        int v22 = [MEMORY[0x263F7B1F8] sharedConfig];
        int v23 = [v22 shouldLog];
        if ([v22 shouldLogToDisk]) {
          int v24 = v23 | 2;
        }
        else {
          int v24 = v23;
        }
        int v25 = [v22 OSLogObject];
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          v24 &= 2u;
        }
        if (v24)
        {
          int v26 = objc_opt_class();
          int v45 = 138543362;
          id v46 = v26;
          id v27 = v26;
          LODWORD(v42) = 12;
          id v41 = &v45;
          int v28 = (void *)_os_log_send_and_compose_impl();

          if (!v28)
          {
LABEL_35:

            goto LABEL_36;
          }
          int v25 = objc_msgSend(NSString, "stringWithCString:encoding:", v28, 4, &v45, v42);
          free(v28);
          id v41 = (int *)v25;
          SSFileLog();
        }

        goto LABEL_35;
      }
      id v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v45, v42);
      free(v12);
      v40 = (int *)v10;
      SSFileLog();
    }

    goto LABEL_12;
  }
  int v15 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v16 = [v15 shouldLog];
  if ([v15 shouldLogToDisk]) {
    int v17 = v16 | 2;
  }
  else {
    int v17 = v16;
  }
  uint64_t v18 = [v15 OSLogObject];
  if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    v17 &= 2u;
  }
  if (!v17) {
    goto LABEL_24;
  }
  int v45 = 138543362;
  id v46 = (id)objc_opt_class();
  id v19 = v46;
  LODWORD(v42) = 12;
  int v20 = (void *)_os_log_send_and_compose_impl();

  if (v20)
  {
    uint64_t v18 = objc_msgSend(NSString, "stringWithCString:encoding:", v20, 4, &v45, v42);
    free(v20);
    SSFileLog();
LABEL_24:
  }
  uint64_t v21 = ISError();
  uint64_t v14 = 0;
  id v6 = 0;
LABEL_46:
  uint64_t v36 = *(void *)(*(void *)(a1 + 48) + 8);
  id v37 = *(void **)(v36 + 40);
  *(void *)(v36 + 40) = v21;

LABEL_47:
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v38 = (void *)[objc_alloc(MEMORY[0x263F27BB0]) initWithCountryCode:v14 merchantIdentifier:v6];
    v39 = [v38 performCardRegistration];
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __41__SUScriptInterface_fetchWalletCardData___block_invoke_127;
    v43[3] = &unk_264812358;
    v43[4] = WeakRetained;
    id v44 = *(id *)(a1 + 40);
    [v39 addFinishBlock:v43];
  }
}

void __41__SUScriptInterface_fetchWalletCardData___block_invoke_127(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    id v10 = [v7 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      v9 &= 2u;
    }
    if (v9)
    {
      *(_DWORD *)uint64_t v14 = 138543618;
      *(void *)&v14[4] = objc_opt_class();
      *(_WORD *)&v14[12] = 2114;
      *(void *)&v14[14] = v6;
      id v11 = *(id *)&v14[4];
      LODWORD(v13) = 22;
      uint64_t v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_11:

        goto LABEL_12;
      }
      id v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, v14, v13, *(_OWORD *)v14, *(void *)&v14[16], v15);
      free(v12);
      SSFileLog();
    }

    goto LABEL_11;
  }
LABEL_12:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchWalletCardMetadata:(id)a3 callback:(id)a4
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0)
  {
    int v9 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v10 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v11 = v10 | 2;
    }
    else {
      int v11 = v10;
    }
    uint64_t v12 = [v9 OSLogObject];
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      v11 &= 2u;
    }
    if (v11)
    {
      int v48 = 138543362;
      id v49 = (id)objc_opt_class();
      id v13 = v49;
      LODWORD(v41) = 12;
      v40 = &v48;
      uint64_t v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_11:

        [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
        goto LABEL_12;
      }
      uint64_t v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v48, v41);
      free(v14);
      v40 = (int *)v12;
      SSFileLog();
    }

    goto LABEL_11;
  }
LABEL_12:
  if (!objc_msgSend(MEMORY[0x263F89460], "shouldUseExtendedEnrollment", v40))
  {
    id v19 = [[SUScriptFunction alloc] initWithScriptObject:v7];
    [(SUScriptFunction *)v19 setThisObject:self];
    uint64_t v18 = ISError();
    int v22 = [[SUScriptError alloc] initWithError:v18];
    int v23 = [MEMORY[0x263F1FA98] undefined];
    v46[0] = v23;
    v46[1] = v22;
    int v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:2];
    [(SUScriptFunction *)v19 callWithArguments:v24];

    [(SUScriptFunction *)v19 setThisObject:0];
    goto LABEL_38;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v6 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v7 = 0;
  }
  uint64_t v15 = [(SUScriptInterface *)self copyJavaScriptContext];
  id v43 = v6;
  int v16 = (void *)[v6 copyArrayOrDictionaryWithContext:v15];
  JSGlobalContextRelease(v15);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v25 = v16;
    uint64_t v21 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v26 = [v21 shouldLog];
    if ([v21 shouldLogToDisk]) {
      int v27 = v26 | 2;
    }
    else {
      int v27 = v26;
    }
    int v28 = [v21 OSLogObject];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
      int v29 = v27;
    }
    else {
      int v29 = v27 & 2;
    }
    if (v29)
    {
      int v30 = objc_opt_class();
      int v48 = 138543362;
      id v49 = v30;
      id v31 = v30;
      LODWORD(v41) = 12;
      uint64_t v18 = (void *)_os_log_send_and_compose_impl();

      int v16 = v25;
      if (!v18)
      {
        int v22 = 0;
        goto LABEL_34;
      }
      int v28 = objc_msgSend(NSString, "stringWithCString:encoding:", v18, 4, &v48, v41);
      free(v18);
      SSFileLog();
    }
    else
    {
      int v16 = v25;
    }

    int v22 = 0;
    uint64_t v18 = 0;
LABEL_34:
    id v19 = 0;
    goto LABEL_35;
  }
  id v17 = v16;
  uint64_t v18 = [v17 objectForKeyedSubscript:@"passSerialNumber"];
  id v19 = [v17 objectForKeyedSubscript:@"passTypeIdentifier"];
  int v20 = NSNumber;
  uint64_t v21 = [v17 objectForKeyedSubscript:@"size"];

  objc_msgSend(v20, "numberWithInteger:", objc_msgSend(v21, "integerValue"));
  int v22 = (SUScriptError *)objc_claimAutoreleasedReturnValue();
LABEL_35:

  id v32 = [(objc_class *)getAMSUICardMetadataClass() metadataForPassTypeIdentifier:v19 serialNumber:v18 cardArtworkSize:v22];
  if (isKindOfClass)
  {
    v33 = [[SUScriptFunction alloc] initWithScriptObject:v7];
    [(SUScriptFunction *)v33 setThisObject:self];
    id v34 = objc_alloc_init(MEMORY[0x263EFF980]);
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __54__SUScriptInterface_fetchWalletCardMetadata_callback___block_invoke;
    v44[3] = &unk_2648123A8;
    id v45 = v34;
    id v42 = v34;
    [v32 enumerateObjectsUsingBlock:v44];
    int v35 = (void *)[v42 copy];
    v47[0] = v35;
    [MEMORY[0x263F1FA98] undefined];
    id v36 = v7;
    v38 = id v37 = v16;
    v47[1] = v38;
    v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:2];
    [(SUScriptFunction *)v33 callWithArguments:v39];

    int v16 = v37;
    id v7 = v36;

    [(SUScriptFunction *)v33 setThisObject:0];
  }

  id v6 = v43;
LABEL_38:
}

void __54__SUScriptInterface_fetchWalletCardMetadata_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [SUScriptDictionary alloc];
  id v5 = [v3 dictionary];

  id v6 = [(SUScriptDictionary *)v4 initWithDictionary:v5];
  [*(id *)(a1 + 32) addObject:v6];
}

- (void)financeInterruptionResolved:(id)a3
{
  id v8 = a3;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [v8 BOOLValue];
    id v5 = [(SUScriptInterface *)self clientInterface];
    id v6 = [v5 delegate];

    if (objc_opt_respondsToSelector())
    {
      id v7 = [(SUScriptInterface *)self clientInterface];
      [v6 clientInterface:v7 financeInterruptionResolved:v4];
    }
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }
}

- (id)getiTunesPass
{
  id v2 = [MEMORY[0x263F7B0E8] defaultStore];
  id v3 = [v2 activeAccount];
  uint64_t v4 = [v3 ITunesPassSerialNumber];

  if (v4)
  {
    id v5 = objc_alloc_init((Class)ISWeakLinkedClassForString());
    id v6 = [v5 passWithPassTypeIdentifier:@"pass.com.apple.itunes.storecredit" serialNumber:v4];
    if (v6) {
      id v7 = [[SUScriptPassbookPass alloc] initWithPass:v6];
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)handleDialogPropertyListString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x22A680860]();
  id v5 = SUScriptPropertyListFromString(v3);
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
    WebThreadRunOnMainThread();
  }
}

void __52__SUScriptInterface_handleDialogPropertyListString___block_invoke(uint64_t a1)
{
  id v3 = (id)[objc_alloc(MEMORY[0x263F89488]) initWithDialogDictionary:*(void *)(a1 + 32)];
  id v2 = [*(id *)(a1 + 40) clientInterface];
  [v2 _presentDialog:v3];
}

- (void)log:(id)a3
{
}

- (id)machineGUID
{
  id v2 = [MEMORY[0x263F89480] sharedInstance];
  id v3 = [v2 guid];

  return v3;
}

- (id)minimumAttestationVersionForAction:(unint64_t)a3
{
  return (id)[MEMORY[0x263F27B60] minimumACLVersionForAction:a3];
}

- (void)openWallet
{
}

void __31__SUScriptInterface_openWallet__block_invoke()
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v0 = [(id)ISWeakLinkedClassForString() isPassLibraryAvailable];
  id v1 = [MEMORY[0x263F27CB8] sharedConfig];
  id v2 = [v1 OSLogObject];
  id v3 = v2;
  if (v0)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      id v12 = (id)objc_opt_class();
      id v4 = v12;
      _os_log_impl(&dword_2277A2000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: OpenWallet: Will open Wallet", (uint8_t *)&v11, 0xCu);
    }
    id v5 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v6 = [v5 userInterfaceIdiom];

    id v7 = @"shoebox://";
    if (v6 == 1) {
      id v7 = @"prefs:root=PASSBOOK";
    }
    id v8 = (void *)MEMORY[0x263F01880];
    int v9 = v7;
    id v1 = [v8 defaultWorkspace];
    id v3 = [NSURL URLWithString:v9];

    [v1 openSensitiveURL:v3 withOptions:0];
  }
  else if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v11 = 138543362;
    id v12 = (id)objc_opt_class();
    id v10 = v12;
    _os_log_impl(&dword_2277A2000, v3, OS_LOG_TYPE_ERROR, "%{public}@: OpenWallet: PassKit not available", (uint8_t *)&v11, 0xCu);
  }
}

- (void)paymentSetupFeatureSupported:(id)a3 callback:(id)a4
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v76[0] = MEMORY[0x263EF8330];
  v76[1] = 3221225472;
  v76[2] = __59__SUScriptInterface_paymentSetupFeatureSupported_callback___block_invoke;
  v76[3] = &unk_2648123F8;
  id v8 = v7;
  id v77 = v8;
  objc_copyWeak(&v78, &location);
  int v9 = (void (**)(void, void, void))MEMORY[0x22A680AE0](v76);
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v6 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v8 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v16 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v17 = [v16 shouldLog];
    int v18 = [v16 shouldLogToDisk];
    id v19 = [v16 OSLogObject];
    int v20 = v19;
    if (v18) {
      v17 |= 2u;
    }
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      v17 &= 2u;
    }
    if (v17)
    {
      uint64_t v21 = objc_opt_class();
      int v80 = 138543362;
      v81 = v21;
      id v22 = v21;
      LODWORD(v70) = 12;
      int v23 = (void *)_os_log_send_and_compose_impl();

      if (!v23) {
        goto LABEL_21;
      }
      int v20 = objc_msgSend(NSString, "stringWithCString:encoding:", v23, 4, &v80, v70);
      free(v23);
      SSFileLog();
    }

    goto LABEL_21;
  }
  if (([MEMORY[0x263F89460] shouldUseUpsellEnrollment] & 1) == 0)
  {
    int v16 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v24 = [v16 shouldLog];
    int v25 = [v16 shouldLogToDisk];
    int v26 = [v16 OSLogObject];
    int v27 = v26;
    if (v25) {
      v24 |= 2u;
    }
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      v24 &= 2u;
    }
    if (!v24) {
      goto LABEL_29;
    }
    int v28 = objc_opt_class();
    int v80 = 138543362;
    v81 = v28;
    id v29 = v28;
    LODWORD(v70) = 12;
    int v30 = (void *)_os_log_send_and_compose_impl();

    if (v30)
    {
      int v27 = objc_msgSend(NSString, "stringWithCString:encoding:", v30, 4, &v80, v70);
      free(v30);
      SSFileLog();
LABEL_29:
    }
LABEL_21:

    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    uint64_t v15 = ISError();
    ((void (**)(void, void, void *))v9)[2](v9, 0, v15);
LABEL_75:

    goto LABEL_76;
  }
  id v10 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
  char v11 = objc_msgSend(v10, "ams_isActiveAccountCombined");

  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v12 = [MEMORY[0x263F7B1F8] sharedConfig];
      int v39 = [v12 shouldLog];
      int v40 = [v12 shouldLogToDisk];
      uint64_t v41 = [v12 OSLogObject];
      id v14 = v41;
      if (v40) {
        v39 |= 2u;
      }
      if (!os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT)) {
        v39 &= 2u;
      }
      if (v39)
      {
        id v42 = objc_opt_class();
        int v80 = 138543362;
        v81 = v42;
        id v43 = v42;
        LODWORD(v70) = 12;
        uint64_t v15 = (void *)_os_log_send_and_compose_impl();

        if (!v15) {
          goto LABEL_61;
        }
        objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v80, v70);
        id v14 = (id)objc_claimAutoreleasedReturnValue();
        free(v15);
        SSFileLog();
      }
      goto LABEL_59;
    }
    id v12 = v6;
    uint64_t v13 = [(SUScriptInterface *)self copyJavaScriptContext];
    id v14 = (id)[v12 copyArrayOrDictionaryWithContext:v13];
    JSGlobalContextRelease(v13);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v14;
      uint64_t v15 = v14;
LABEL_60:

LABEL_61:
      id v55 = [v15 objectForKeyedSubscript:@"referrerIdentifier"];
      if (v55)
      {
LABEL_74:
        id v67 = objc_alloc_init(MEMORY[0x263F894D8]);
        v73[0] = MEMORY[0x263EF8330];
        v73[1] = 3221225472;
        v73[2] = __59__SUScriptInterface_paymentSetupFeatureSupported_callback___block_invoke_181;
        v73[3] = &unk_264812420;
        id v68 = v55;
        id v74 = v68;
        v75 = v9;
        [v67 setCompletionBlock:v73];
        v69 = [MEMORY[0x263F894E0] mainQueue];
        [v69 addOperation:v67];

        goto LABEL_75;
      }
      v56 = [MEMORY[0x263F7B1F8] sharedConfig];
      int v57 = [v56 shouldLog];
      int v58 = [v56 shouldLogToDisk];
      v72 = v56;
      v59 = [v56 OSLogObject];
      v60 = v59;
      if (v58) {
        int v61 = v57 | 2;
      }
      else {
        int v61 = v57;
      }
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT)) {
        int v62 = v61;
      }
      else {
        int v62 = v61 & 2;
      }
      if (v62)
      {
        v63 = objc_opt_class();
        int v80 = 138543362;
        v81 = v63;
        id v64 = v63;
        LODWORD(v70) = 12;
        v65 = (void *)_os_log_send_and_compose_impl();

        v66 = v72;
        if (!v65)
        {
LABEL_73:

          goto LABEL_74;
        }
        v60 = objc_msgSend(NSString, "stringWithCString:encoding:", v65, 4, &v80, v70);
        free(v65);
        SSFileLog();
      }
      else
      {
        v66 = v72;
      }

      goto LABEL_73;
    }
    id v44 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v45 = [v44 shouldLog];
    int v46 = [v44 shouldLogToDisk];
    v71 = v44;
    uint64_t v47 = [v44 OSLogObject];
    int v48 = v47;
    if (v46) {
      int v49 = v45 | 2;
    }
    else {
      int v49 = v45;
    }
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT)) {
      int v50 = v49;
    }
    else {
      int v50 = v49 & 2;
    }
    if (v50)
    {
      id v51 = objc_opt_class();
      int v80 = 138543362;
      v81 = v51;
      id v52 = v51;
      LODWORD(v70) = 12;
      v53 = (void *)_os_log_send_and_compose_impl();

      int v54 = v71;
      if (!v53)
      {
LABEL_58:

LABEL_59:
        uint64_t v15 = 0;
        goto LABEL_60;
      }
      int v48 = objc_msgSend(NSString, "stringWithCString:encoding:", v53, 4, &v80, v70);
      free(v53);
      SSFileLog();
    }
    else
    {
      int v54 = v71;
    }

    goto LABEL_58;
  }
  id v31 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v32 = [v31 shouldLog];
  int v33 = [v31 shouldLogToDisk];
  id v34 = [v31 OSLogObject];
  int v35 = v34;
  if (v33) {
    v32 |= 2u;
  }
  if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
    v32 &= 2u;
  }
  if (!v32) {
    goto LABEL_38;
  }
  id v36 = objc_opt_class();
  int v80 = 138543362;
  v81 = v36;
  id v37 = v36;
  LODWORD(v70) = 12;
  uint64_t v38 = (void *)_os_log_send_and_compose_impl();

  if (v38)
  {
    int v35 = objc_msgSend(NSString, "stringWithCString:encoding:", v38, 4, &v80, v70);
    free(v38);
    SSFileLog();
LABEL_38:
  }
  ((void (**)(void, void *, void))v9)[2](v9, &unk_26DBD7B98, 0);
LABEL_76:

  objc_destroyWeak(&v78);
  objc_destroyWeak(&location);
}

void __59__SUScriptInterface_paymentSetupFeatureSupported_callback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v14[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a2;
  id v7 = [[SUScriptFunction alloc] initWithScriptObject:*(void *)(a1 + 32)];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [(SUScriptFunction *)v7 setThisObject:WeakRetained];

  int v9 = [[SUScriptDictionary alloc] initWithDictionary:v6];
  if (v5)
  {
    id v10 = [[SUScriptError alloc] initWithError:v5];
    v14[0] = v9;
    v14[1] = v10;
    char v11 = v14;
  }
  else
  {
    v13[0] = v9;
    id v10 = [MEMORY[0x263F1FA98] undefined];
    v13[1] = v10;
    char v11 = v13;
  }
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
  [(SUScriptFunction *)v7 callWithArguments:v12];

  [(SUScriptFunction *)v7 setThisObject:0];
}

void __59__SUScriptInterface_paymentSetupFeatureSupported_callback___block_invoke_181(uint64_t a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  id v2 = (void *)[objc_alloc(MEMORY[0x263F27DF0]) initWithIdentifier:*(void *)(a1 + 32)];
  id v7 = 0;
  uint64_t v3 = [v2 isPaymentSetupFeatureSupportedWithError:&v7];
  id v4 = v7;
  id v8 = @"supported";
  id v5 = [NSNumber numberWithBool:v3];
  v9[0] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)perfLog:(id)a3
{
  id v4 = a3;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  NSLog(&cfstr_Js2f.isa, *(void *)&Current, v4);
}

- (void)performPurchaseAnimationForIdentifier:(id)a3 style:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [(id)objc_opt_class() purchaseAnimationStyleFromString:v6];

  if (!v7)
  {
    id v8 = v5;
    WebThreadRunOnMainThread();
  }
}

void __65__SUScriptInterface_performPurchaseAnimationForIdentifier_style___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) webFrame];
  uint64_t v3 = [v2 DOMDocument];

  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 getElementById:*(void *)(a1 + 40)];
  id v6 = [v4 DOMElementWithElement:v5];

  uint64_t v7 = [v6 innerText];
  if ([v7 length]) {
    uint64_t v8 = [v6 newLabelForElementWithText:v7];
  }
  else {
    uint64_t v8 = [v6 newImageView];
  }
  id v17 = (id)v8;
  if (v8)
  {
    int v9 = [*(id *)(a1 + 32) parentViewController];
    id v10 = [v9 tabBarController];

    char v11 = [v6 webView];
    [v17 frame];
    objc_msgSend(v11, "convertRect:fromView:", 0);
    objc_msgSend(v17, "setFrame:");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      LODWORD(v12) = 1.0;
      LODWORD(v13) = -1.0;
      id v14 = v17;
      uint64_t v15 = v11;
      int v16 = v10;
    }
    else
    {
      LODWORD(v12) = 1051931443;
      id v14 = v17;
      uint64_t v15 = v11;
      int v16 = v10;
      LODWORD(v13) = 1051931443;
    }
    +[SUPurchaseAnimator performHopAnimationForView:v14 relativeToView:v15 tabBarController:v16 finalAlpha:v12 scale:v13];
  }
}

- (id)presentPrivacyViewControllerWithIdentifier:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

LABEL_4:
    [MEMORY[0x263F1FA90] throwException:@"Invalid private vc identifier"];
    id v4 = (id)*MEMORY[0x263EFFB38];
    goto LABEL_5;
  }
  if (!v3) {
    goto LABEL_4;
  }
  id v6 = objc_alloc(MEMORY[0x263F894B0]);
  uint64_t v7 = [MEMORY[0x263F7B358] contextWithBagType:0];
  uint64_t v8 = (void *)[v6 initWithBagContext:v7];

  [v8 start];
  int v9 = [v8 URLBag];
  id v10 = v9;
  if (!v9)
  {
    uint64_t v21 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v22 = [v21 shouldLog];
    if ([v21 shouldLogToDisk]) {
      int v23 = v22 | 2;
    }
    else {
      int v23 = v22;
    }
    int v24 = [v21 OSLogObject];
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      v23 &= 2u;
    }
    if (v23)
    {
      int v30 = 138543618;
      id v31 = (id)objc_opt_class();
      __int16 v32 = 2080;
      int v33 = "-[SUScriptInterface presentPrivacyViewControllerWithIdentifier:]";
      id v25 = v31;
      LODWORD(v27) = 22;
      int v26 = (void *)_os_log_send_and_compose_impl();

      if (!v26)
      {
LABEL_33:

        id v4 = (id)*MEMORY[0x263EFFB38];
        goto LABEL_34;
      }
      int v24 = objc_msgSend(NSString, "stringWithCString:encoding:", v26, 4, &v30, v27);
      free(v26);
      SSFileLog();
    }

    goto LABEL_33;
  }
  char v11 = [v9 valueForKey:@"privacyAcknowledgementUrl"];
  if (![v11 length]
    || ([NSURL URLWithString:v11], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v15 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v16 = [v15 shouldLog];
    if ([v15 shouldLogToDisk]) {
      int v17 = v16 | 2;
    }
    else {
      int v17 = v16;
    }
    int v18 = [v15 OSLogObject];
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      v17 &= 2u;
    }
    if (v17)
    {
      int v30 = 138543362;
      id v31 = (id)objc_opt_class();
      id v19 = v31;
      LODWORD(v27) = 12;
      int v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20)
      {
LABEL_22:

        id v4 = (id)*MEMORY[0x263EFFB38];
        goto LABEL_23;
      }
      int v18 = objc_msgSend(NSString, "stringWithCString:encoding:", v20, 4, &v30, v27);
      free(v20);
      SSFileLog();
    }

    goto LABEL_22;
  }
  double v13 = (void *)v12;
  id v28 = v3;
  id v29 = v13;
  id v14 = v13;
  WebThreadRunOnMainThread();
  id v4 = (id)*MEMORY[0x263EFFB40];

LABEL_23:
LABEL_34:

LABEL_5:

  return v4;
}

void __64__SUScriptInterface_presentPrivacyViewControllerWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v3 = [v2 shouldLog];
  if ([v2 shouldLogToDisk]) {
    int v4 = v3 | 2;
  }
  else {
    int v4 = v3;
  }
  id v5 = [v2 OSLogObject];
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
    v4 &= 2u;
  }
  if (!v4) {
    goto LABEL_9;
  }
  LODWORD(v11) = 138543362;
  *(void *)((char *)&v11 + 4) = objc_opt_class();
  id v6 = *(id *)((char *)&v11 + 4);
  LODWORD(v10) = 12;
  uint64_t v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    id v5 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v11, v10, v11);
    free(v7);
    SSFileLog();
LABEL_9:
  }
  uint64_t v8 = [MEMORY[0x263F7B2C0] viewControllerForPrivacySplashWithIdentifier:*(void *)(a1 + 40) URL:*(void *)(a1 + 48)];
  int v9 = [*(id *)(a1 + 32) parentViewController];
  [v9 presentViewController:v8 animated:1 completion:0];
}

- (id)presentPrivacySplashWithIdentifier:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

LABEL_4:
    [MEMORY[0x263F1FA90] throwException:@"Invalid private vc identifier"];
    id v4 = (id)*MEMORY[0x263EFFB38];
    goto LABEL_5;
  }
  if (!v3) {
    goto LABEL_4;
  }
  uint64_t v7 = v3;
  id v6 = v3;
  WebThreadRunOnMainThread();
  id v4 = (id)*MEMORY[0x263EFFB40];

LABEL_5:

  return v4;
}

void __56__SUScriptInterface_presentPrivacySplashWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v3 = [v2 shouldLog];
  if ([v2 shouldLogToDisk]) {
    int v4 = v3 | 2;
  }
  else {
    int v4 = v3;
  }
  id v5 = [v2 OSLogObject];
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
    v4 &= 2u;
  }
  if (!v4) {
    goto LABEL_9;
  }
  LODWORD(v11) = 138543362;
  *(void *)((char *)&v11 + 4) = objc_opt_class();
  id v6 = *(id *)((char *)&v11 + 4);
  LODWORD(v10) = 12;
  uint64_t v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    id v5 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v11, v10, v11);
    free(v7);
    SSFileLog();
LABEL_9:
  }
  uint64_t v8 = [MEMORY[0x263F5B8F8] presenterForPrivacySplashWithIdentifier:*(void *)(a1 + 40)];
  int v9 = [*(id *)(a1 + 32) parentViewController];
  [v8 setPresentingViewController:v9];

  [v8 present];
}

- (void)registerNavBarButtonWithTitle:(id)a3 side:(id)a4 function:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = objc_alloc_init(SUScriptButton);
        [(SUScriptObject *)self checkInScriptObject:v10];
        [(SUScriptButton *)v10 setAction:v9];
        long long v11 = [(WebFrame *)self->_frame windowObject];
        [(SUScriptButton *)v10 setTarget:v11];

        [(SUScriptButton *)v10 setTitle:v14];
        LODWORD(v11) = [v8 isEqualToString:@"left"];
        uint64_t v12 = [(SUScriptInterface *)self navigationBar];
        double v13 = v12;
        if (v11) {
          [v12 setLeftButton:v10 animated:0];
        }
        else {
          [v12 setRightButton:v10 animated:0];
        }
      }
    }
  }
}

- (void)redeemCode:(id)a3
{
}

- (void)redeemCodes:(id)a3 params:(id)a4 completion:(id)a5
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v11 = [(SUScriptInterface *)self copyJavaScriptContext];
      uint64_t v12 = (void *)[v8 copyArrayOrDictionaryWithContext:v11];
      double v13 = (void *)[v9 copyArrayOrDictionaryWithContext:v11];
      JSGlobalContextRelease(v11);
      objc_opt_class();
      int v45 = v12;
      if (objc_opt_isKindOfClass())
      {
        id v14 = v12;
        goto LABEL_33;
      }
      int v23 = [MEMORY[0x263F7B1F8] sharedConfig];
      int v24 = [v23 shouldLog];
      if ([v23 shouldLogToDisk]) {
        int v25 = v24 | 2;
      }
      else {
        int v25 = v24;
      }
      int v26 = [v23 OSLogObject];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        int v27 = v25;
      }
      else {
        int v27 = v25 & 2;
      }
      if (v27)
      {
        int v49 = 138543362;
        id v50 = (id)objc_opt_class();
        id v28 = v9;
        id v29 = v50;
        LODWORD(v43) = 12;
        id v42 = &v49;
        int v30 = (void *)_os_log_send_and_compose_impl();

        id v9 = v28;
        if (!v30)
        {
LABEL_32:

          [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
          id v14 = 0;
LABEL_33:
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v31 = v13;
LABEL_46:
            int v40 = (void *)[objc_alloc(MEMORY[0x263F7B2F8]) initWithRedeemCodes:v14];
            uint64_t v41 = [(SUScriptInterface *)self authenticationContext];
            [v40 setAuthenticationContext:v41];

            [v40 setHeadless:0];
            [v40 setParams:v31];
            v46[0] = MEMORY[0x263EF8330];
            v46[1] = 3221225472;
            void v46[2] = __51__SUScriptInterface_redeemCodes_params_completion___block_invoke;
            v46[3] = &unk_264812470;
            id v47 = v10;
            int v48 = self;
            [v40 startWithRedeemResponseBlock:v46];

            goto LABEL_47;
          }
          id v44 = v9;
          __int16 v32 = [MEMORY[0x263F7B1F8] sharedConfig];
          int v33 = [v32 shouldLog];
          if ([v32 shouldLogToDisk]) {
            int v34 = v33 | 2;
          }
          else {
            int v34 = v33;
          }
          int v35 = objc_msgSend(v32, "OSLogObject", v42);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT)) {
            int v36 = v34;
          }
          else {
            int v36 = v34 & 2;
          }
          if (v36)
          {
            id v37 = objc_opt_class();
            int v49 = 138543362;
            id v50 = v37;
            id v38 = v37;
            LODWORD(v43) = 12;
            int v39 = (void *)_os_log_send_and_compose_impl();

            if (!v39)
            {
LABEL_45:

              id v31 = 0;
              id v9 = v44;
              goto LABEL_46;
            }
            int v35 = objc_msgSend(NSString, "stringWithCString:encoding:", v39, 4, &v49, v43);
            free(v39);
            SSFileLog();
          }

          goto LABEL_45;
        }
        int v26 = objc_msgSend(NSString, "stringWithCString:encoding:", v30, 4, &v49, v43);
        free(v30);
        id v42 = (int *)v26;
        SSFileLog();
      }

      goto LABEL_32;
    }
    uint64_t v15 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v19 = [v15 shouldLog];
    if ([v15 shouldLogToDisk]) {
      int v20 = v19 | 2;
    }
    else {
      int v20 = v19;
    }
    int v18 = [v15 OSLogObject];
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      v20 &= 2u;
    }
    if (!v20) {
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v15 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v16 = [v15 shouldLog];
    if ([v15 shouldLogToDisk]) {
      int v17 = v16 | 2;
    }
    else {
      int v17 = v16;
    }
    int v18 = [v15 OSLogObject];
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      v17 &= 2u;
    }
    if (!v17) {
      goto LABEL_20;
    }
  }
  int v49 = 138543362;
  id v50 = (id)objc_opt_class();
  id v21 = v50;
  LODWORD(v43) = 12;
  int v22 = (void *)_os_log_send_and_compose_impl();

  if (v22)
  {
    int v18 = objc_msgSend(NSString, "stringWithCString:encoding:", v22, 4, &v49, v43);
    free(v22);
    SSFileLog();
LABEL_20:
  }
  [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
LABEL_47:
}

void __51__SUScriptInterface_redeemCodes_params_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v9 = *(id *)(a1 + 32);
  id v10 = v6;
  id v7 = v5;
  id v8 = v6;
  WebThreadRunOnMainThread();
}

void __51__SUScriptInterface_redeemCodes_params_completion___block_invoke_2(uint64_t a1)
{
  v29[2] = *MEMORY[0x263EF8340];
  id v2 = [[SUScriptFunction alloc] initWithScriptObject:*(void *)(a1 + 32)];
  [(SUScriptFunction *)v2 setThisObject:*(void *)(a1 + 40)];
  if (*(void *)(a1 + 48))
  {
    int v3 = [[SUScriptError alloc] initWithError:*(void *)(a1 + 48)];
    int v4 = [MEMORY[0x263F1FA98] undefined];
    v29[0] = v4;
    v29[1] = v3;
    id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:2];
    [(SUScriptFunction *)v2 callWithArguments:v5];
LABEL_3:

    goto LABEL_4;
  }
  id v6 = [*(id *)(a1 + 56) codeResponses];

  if (!v6)
  {
    ISError();
    int v3 = (SUScriptError *)objc_claimAutoreleasedReturnValue();
    int v4 = [[SUScriptError alloc] initWithError:v3];
    id v5 = [MEMORY[0x263F1FA98] undefined];
    v26[0] = v5;
    v26[1] = v4;
    int v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
    [(SUScriptFunction *)v2 callWithArguments:v17];

    goto LABEL_3;
  }
  id v21 = v2;
  id v7 = [*(id *)(a1 + 56) codeResponses];
  int v4 = (SUScriptError *)objc_alloc_init(MEMORY[0x263EFF980]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  int v3 = v7;
  uint64_t v8 = [(SUScriptError *)v3 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    char v10 = 0;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v3);
        }
        uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        id v14 = [*(id *)(a1 + 56) dictionaryForCode:v13];

        v10 |= v14 != 0;
        uint64_t v15 = [*(id *)(a1 + 56) responseDictionaryForCode:v13];
        int v16 = [[SUScriptDictionary alloc] initWithDictionary:v15];
        [(SUScriptError *)v4 addObject:v16];
      }
      uint64_t v9 = [(SUScriptError *)v3 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v9);
  }
  else
  {
    char v10 = 0;
  }

  int v18 = (void *)[(SUScriptError *)v4 copy];
  v27[0] = v18;
  int v19 = [MEMORY[0x263F1FA98] undefined];
  v27[1] = v19;
  int v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
  id v2 = v21;
  [(SUScriptFunction *)v21 callWithArguments:v20];

  if (v10) {
    [*(id *)(a1 + 40) redeemCodesReloadDownloadManager];
  }
LABEL_4:

  [(SUScriptFunction *)v2 setThisObject:0];
}

- (void)redeemCodesReloadDownloadManager
{
  v10[1] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263F7B180]);
  int v3 = [MEMORY[0x263F7B178] allStoreDownloadKinds];
  [v2 setDownloadKinds:v3];

  v10[0] = *MEMORY[0x263F7B558];
  int v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  [v2 setPrefetchedDownloadExternalProperties:v4];

  uint64_t v5 = *MEMORY[0x263F7B628];
  v9[0] = *MEMORY[0x263F7B6D8];
  v9[1] = v5;
  uint64_t v6 = *MEMORY[0x263F7B658];
  void v9[2] = *MEMORY[0x263F7B640];
  v9[3] = v6;
  v9[4] = *MEMORY[0x263F7B660];
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:5];
  [v2 setPrefetchedDownloadProperties:v7];

  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F7B178]) initWithManagerOptions:v2];
  [v8 reloadFromServer];
}

- (void)removeDeviceOfferWithIdentifier:(id)a3 account:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v5 account];
    id v7 = [v6 backingAccount];
    uint64_t v8 = objc_alloc_init(AMSBag_iTunesStoreUI);
    [MEMORY[0x263F27BF8] removeDeviceOfferWithIdentifier:v9 account:v7 bagContract:v8 logKey:0];
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid device offer identifier"];
  }
}

- (void)reportAProblemForIdentifier:(id)a3
{
  if (SSGetUnsignedLongLongFromValue())
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    int v3 = (void *)MEMORY[0x263F1FA90];
    [v3 throwException:@"Invalid adam ID"];
  }
}

void __49__SUScriptInterface_reportAProblemForIdentifier___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) clientInterface];
  id v2 = [[SUReportConcernViewController alloc] initWithItemIdentifier:*(void *)(a1 + 40)];
  [(SUViewController *)v2 setClientInterface:v5];
  int v3 = [[SUNavigationController alloc] initWithRootViewController:v2];
  [(SUNavigationController *)v3 setClientInterface:v5];
  int v4 = [*(id *)(a1 + 32) parentViewController];
  [v4 presentViewController:v3 animated:1 completion:0];
}

- (void)requireCellularForResourceWithURL:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (void *)[objc_alloc(NSURL) initWithString:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = MEMORY[0x263EF8330];
      id v6 = v5;
      WebThreadRunOnMainThread();
      [(NSLock *)self->super._lock lock];
      requireCellularURLs = self->_requireCellularURLs;
      if (!requireCellularURLs)
      {
        uint64_t v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
        id v9 = self->_requireCellularURLs;
        self->_requireCellularURLs = v8;

        requireCellularURLs = self->_requireCellularURLs;
      }
      [(NSMutableSet *)requireCellularURLs addObject:v6];
      [(NSLock *)self->super._lock unlock];
    }
    else
    {
      [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    }
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }
}

void __55__SUScriptInterface_requireCellularForResourceWithURL___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0 && *(void *)(a1 + 40)) {
    objc_msgSend(v2, "scriptInterface:requireCellularForResourceWithURL:", *(void *)(a1 + 32));
  }
}

- (void)sendPostOfType:(id)a3 withOptions:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = (void *)MEMORY[0x263F1FA90];
    uint64_t v8 = @"Invalid post type";
LABEL_11:
    [v7 throwException:v8];
    goto LABEL_12;
  }
  if (!v6)
  {
    if (!+[SUScriptOperation postOperationClassForType:v10])
    {
      id v6 = 0;
      goto LABEL_12;
    }
    id v6 = [MEMORY[0x263F1FA98] undefined];
LABEL_9:
    id v9 = [[SUScriptOperation alloc] initWithPostType:v10 options:v6];
    [(SUScriptOperationDelegate *)self->_scriptOperationDelegate enqueueOperation:v9];

    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = (void *)MEMORY[0x263F1FA90];
    uint64_t v8 = @"Invalid post options";
    goto LABEL_11;
  }
  if (+[SUScriptOperation postOperationClassForType:v10])
  {
    goto LABEL_9;
  }
LABEL_12:
}

- (void)setLibraryIdentifierWithType:(id)a3 value:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    id v5 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v9 isEqualToString:@"app-genius"])
  {
    if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v6 = [MEMORY[0x263F7B148] currentDevice];
      [v6 setSoftwareLibraryIdentifier:v5];

      goto LABEL_10;
    }
    id v7 = (void *)MEMORY[0x263F1FA90];
    uint64_t v8 = @"Invalid library identifier";
  }
  else
  {
    id v7 = (void *)MEMORY[0x263F1FA90];
    uint64_t v8 = @"Invalid library identifier type";
  }
  [v7 throwException:v8];
LABEL_10:
}

- (id)shouldDisplayPrivacyLinkWithIdentifier:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

LABEL_4:
    [MEMORY[0x263F1FA90] throwException:@"Invalid privacy identifier"];
    id v4 = (id)*MEMORY[0x263EFFB38];
    goto LABEL_5;
  }
  if (!v3) {
    goto LABEL_4;
  }
  int v6 = [MEMORY[0x263F7B2C0] shouldDisplayPrivacyLinkWithIdentifier:v3];
  id v7 = (id *)MEMORY[0x263EFFB40];
  if (!v6) {
    id v7 = (id *)MEMORY[0x263EFFB38];
  }
  id v4 = *v7;

LABEL_5:

  return v4;
}

- (void)signOutPrimaryAccount
{
  id v2 = [MEMORY[0x263F7B0E8] defaultStore];
  id v4 = [v2 activeAccount];

  if (v4)
  {
    id v3 = [MEMORY[0x263F7B0E8] defaultStore];
    [v3 signOutAccount:v4];
  }
}

- (void)startListeningForAuthenticationTokenWithCallback:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [MEMORY[0x263F1FA90] throwException:@"Failed to listen for authentication token - nil callback"];
    goto LABEL_13;
  }
  id v5 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  uint64_t v8 = [v5 OSLogObject];
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
    v7 &= 2u;
  }
  if (!v7) {
    goto LABEL_10;
  }
  int v15 = 138543362;
  id v16 = (id)objc_opt_class();
  id v9 = v16;
  LODWORD(v12) = 12;
  id v10 = (void *)_os_log_send_and_compose_impl();

  if (v10)
  {
    uint64_t v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v15, v12);
    free(v10);
    SSFileLog();
LABEL_10:
  }
  hsaTokenQueue = self->_hsaTokenQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__SUScriptInterface_startListeningForAuthenticationTokenWithCallback___block_invoke;
  block[3] = &unk_264812290;
  void block[4] = self;
  id v14 = v4;
  dispatch_sync(hsaTokenQueue, block);

LABEL_13:
}

void __70__SUScriptInterface_startListeningForAuthenticationTokenWithCallback___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 240))
  {
    HSAAuthenticationUnregisterIncomingAuthenticationTokenBlockWithIdentifier();
    CFRelease(*(CFTypeRef *)(*(void *)(a1 + 32) + 240));
  }
  id v2 = [MEMORY[0x263F08C38] UUID];
  id v3 = [v2 UUIDString];
  *(void *)(*(void *)(a1 + 32) + 240) = v3;

  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = __Block_byref_object_copy_;
  v5[4] = __Block_byref_object_dispose_;
  id v6 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  HSAAuthenticationRegisterIncomingAuthenticationTokenBlockWithIdentifier();

  _Block_object_dispose(v5, 8);
}

void __70__SUScriptInterface_startListeningForAuthenticationTokenWithCallback___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v11 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v12 = [v11 shouldLog];
  if ([v11 shouldLogToDisk]) {
    int v13 = v12 | 2;
  }
  else {
    int v13 = v12;
  }
  id v14 = [v11 OSLogObject];
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
    v13 &= 2u;
  }
  if (!v13) {
    goto LABEL_9;
  }
  int v27 = 138543362;
  id v28 = (id)objc_opt_class();
  id v15 = v28;
  LODWORD(v24) = 12;
  id v16 = (void *)_os_log_send_and_compose_impl();

  if (v16)
  {
    id v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, &v27, v24);
    free(v16);
    SSFileLog();
LABEL_9:
  }
  v26[0] = a5;
  v26[1] = a2;
  void v26[2] = a3;
  v26[3] = a4;
  uint64_t v17 = (void *)MEMORY[0x263EFF8C0];
  id v18 = a4;
  id v19 = a3;
  id v20 = a2;
  id v21 = a5;
  long long v22 = [v17 arrayWithObjects:v26 count:4];
  id v25 = *(id *)(a1 + 32);
  id v23 = v22;
  WebThreadRunOnMainThread();
}

void __70__SUScriptInterface_startListeningForAuthenticationTokenWithCallback___block_invoke_243(void *a1)
{
  id v2 = [[SUScriptFunction alloc] initWithScriptObject:a1[4]];
  [(SUScriptFunction *)v2 setThisObject:a1[5]];
  [(SUScriptFunction *)v2 callWithArguments:a1[6]];
  [(SUScriptFunction *)v2 setThisObject:0];
}

- (void)stopListeningForAuthenticationToken
{
  hsaTokenQueue = self->_hsaTokenQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__SUScriptInterface_stopListeningForAuthenticationToken__block_invoke;
  block[3] = &unk_2648123D0;
  void block[4] = self;
  dispatch_sync(hsaTokenQueue, block);
}

void __56__SUScriptInterface_stopListeningForAuthenticationToken__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(a1 + 32) + 240))
  {
    id v2 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v3 = [v2 shouldLog];
    if ([v2 shouldLogToDisk]) {
      int v4 = v3 | 2;
    }
    else {
      int v4 = v3;
    }
    id v5 = [v2 OSLogObject];
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      v4 &= 2u;
    }
    if (v4)
    {
      LODWORD(v9) = 138543362;
      *(void *)((char *)&v9 + 4) = objc_opt_class();
      id v6 = *(id *)((char *)&v9 + 4);
      LODWORD(v8) = 12;
      int v7 = (void *)_os_log_send_and_compose_impl();

      if (!v7)
      {
LABEL_11:

        HSAAuthenticationUnregisterIncomingAuthenticationTokenBlockWithIdentifier();
        CFRelease(*(CFTypeRef *)(*(void *)(a1 + 32) + 240));
        *(void *)(*(void *)(a1 + 32) + 240) = 0;
        return;
      }
      id v5 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v9, v8, v9);
      free(v7);
      SSFileLog();
    }

    goto LABEL_11;
  }
}

- (void)_accessibilityPostLayoutChange
{
}

- (void)accessibilityPostLayoutChange
{
}

- (void)accessibilityPostScreenChange
{
}

void __50__SUScriptInterface_accessibilityPostScreenChange__block_invoke()
{
}

- (void)authorizeApplePayEnrollmentWithParameters:(id)a3 callback:(id)a4
{
  uint64_t v125 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v118[0] = MEMORY[0x263EF8330];
  v118[1] = 3221225472;
  v118[2] = __72__SUScriptInterface_authorizeApplePayEnrollmentWithParameters_callback___block_invoke;
  v118[3] = &unk_2648124E8;
  objc_copyWeak(&v120, &location);
  id v8 = v7;
  id v119 = v8;
  long long v9 = (void (**)(void, void, void))MEMORY[0x22A680AE0](v118);
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v6 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v8 = 0;
  }
  uint64_t v112 = 0;
  v113 = &v112;
  uint64_t v114 = 0x3032000000;
  v115 = __Block_byref_object_copy_;
  v116 = __Block_byref_object_dispose_;
  id v117 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v14 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v15 = [v14 shouldLog];
    int v16 = [v14 shouldLogToDisk];
    uint64_t v17 = [v14 OSLogObject];
    id v18 = v17;
    if (v16) {
      v15 |= 2u;
    }
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      v15 &= 2u;
    }
    if (v15)
    {
      id v19 = objc_opt_class();
      *(_DWORD *)from = 138543362;
      *(void *)&from[4] = v19;
      id v20 = v19;
      LODWORD(v92) = 12;
      id v21 = (void *)_os_log_send_and_compose_impl();

      if (!v21) {
        goto LABEL_20;
      }
      id v18 = objc_msgSend(NSString, "stringWithCString:encoding:", v21, 4, from, v92);
      free(v21);
      SSFileLog();
    }

    goto LABEL_20;
  }
  if ([MEMORY[0x263F89460] shouldUseExtendedEnrollment])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v6;
      uint64_t v11 = [(SUScriptInterface *)self copyJavaScriptContext];
      int v12 = (void *)[v10 copyArrayOrDictionaryWithContext:v11];
      JSGlobalContextRelease(v11);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = v12;
      }
      else
      {
        uint64_t v30 = ISError();
        id v31 = (void *)v113[5];
        v113[5] = v30;

        id v13 = 0;
      }
    }
    else
    {
      uint64_t v29 = ISError();
      id v13 = 0;
      id v10 = (id)v113[5];
      v113[5] = v29;
    }

    if (v113[5])
    {
      __int16 v32 = [MEMORY[0x263F7B1F8] sharedConfig];
      int v33 = [v32 shouldLog];
      int v34 = [v32 shouldLogToDisk];
      int v35 = [v32 OSLogObject];
      int v36 = v35;
      if (v34) {
        v33 |= 2u;
      }
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        v33 &= 2u;
      }
      if (v33)
      {
        id v37 = objc_opt_class();
        uint64_t v38 = v113[5];
        *(_DWORD *)from = 138543618;
        *(void *)&from[4] = v37;
        __int16 v123 = 2114;
        uint64_t v124 = v38;
        id v39 = v37;
        LODWORD(v92) = 22;
        int v40 = (void *)_os_log_send_and_compose_impl();

        if (!v40)
        {
LABEL_42:

          [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
          v9[2](v9, 0, v113[5]);
          goto LABEL_97;
        }
        int v36 = objc_msgSend(NSString, "stringWithCString:encoding:", v40, 4, from, v92);
        free(v40);
        SSFileLog();
      }

      goto LABEL_42;
    }
    v97 = [v13 objectForKeyedSubscript:@"paymentSession"];
    if (v97)
    {
LABEL_53:
      v96 = objc_msgSend(v13, "objectForKeyedSubscript:", @"passTypeIdentifier", v88);
      if (v96) {
        goto LABEL_63;
      }
      int v49 = [MEMORY[0x263F7B1F8] sharedConfig];
      int v50 = [v49 shouldLog];
      int v51 = [v49 shouldLogToDisk];
      id v52 = [v49 OSLogObject];
      v53 = v52;
      if (v51) {
        v50 |= 2u;
      }
      if (!os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT)) {
        v50 &= 2u;
      }
      if (v50)
      {
        int v54 = objc_opt_class();
        *(_DWORD *)from = 138543362;
        *(void *)&from[4] = v54;
        id v55 = v54;
        LODWORD(v92) = 12;
        v89 = from;
        v56 = (void *)_os_log_send_and_compose_impl();

        if (!v56)
        {
LABEL_62:

LABEL_63:
          v95 = objc_msgSend(v13, "objectForKeyedSubscript:", @"passSerialNumber", v89);
          if (v95) {
            goto LABEL_73;
          }
          int v57 = [MEMORY[0x263F7B1F8] sharedConfig];
          int v58 = [v57 shouldLog];
          int v59 = [v57 shouldLogToDisk];
          v60 = [v57 OSLogObject];
          int v61 = v60;
          if (v59) {
            v58 |= 2u;
          }
          if (!os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT)) {
            v58 &= 2u;
          }
          if (v58)
          {
            int v62 = objc_opt_class();
            *(_DWORD *)from = 138543362;
            *(void *)&from[4] = v62;
            id v63 = v62;
            LODWORD(v92) = 12;
            v90 = from;
            id v64 = (void *)_os_log_send_and_compose_impl();

            if (!v64)
            {
LABEL_72:

LABEL_73:
              v94 = objc_msgSend(v13, "objectForKeyedSubscript:", @"metrics", v90);
              if (v94) {
                goto LABEL_83;
              }
              v65 = [MEMORY[0x263F7B1F8] sharedConfig];
              int v66 = [v65 shouldLog];
              int v67 = [v65 shouldLogToDisk];
              id v68 = [v65 OSLogObject];
              v69 = v68;
              if (v67) {
                v66 |= 2u;
              }
              if (!os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT)) {
                v66 &= 2u;
              }
              if (v66)
              {
                uint64_t v70 = objc_opt_class();
                *(_DWORD *)from = 138543362;
                *(void *)&from[4] = v70;
                id v71 = v70;
                LODWORD(v92) = 12;
                v91 = from;
                v72 = (void *)_os_log_send_and_compose_impl();

                if (!v72)
                {
LABEL_82:

LABEL_83:
                  v99 = objc_msgSend(v13, "objectForKeyedSubscript:", @"confirmationStyle", v91);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    v73 = [v13 objectForKeyedSubscript:@"confirmationStyle"];
                    uint64_t v93 = [v73 unsignedIntegerValue];
LABEL_96:

                    id v81 = objc_alloc(MEMORY[0x263F894B0]);
                    uint64_t v82 = [MEMORY[0x263F7B358] contextWithBagType:0];
                    v83 = (void *)[v81 initWithBagContext:v82];

                    objc_initWeak((id *)from, v83);
                    v100[0] = MEMORY[0x263EF8330];
                    v100[1] = 3221225472;
                    v100[2] = __72__SUScriptInterface_authorizeApplePayEnrollmentWithParameters_callback___block_invoke_269;
                    v100[3] = &unk_264812538;
                    objc_copyWeak(&v110, &location);
                    objc_copyWeak(v111, (id *)from);
                    v109 = &v112;
                    v101 = @"Apple Pay Enrollment Error";
                    id v98 = v97;
                    id v102 = v98;
                    id v84 = v96;
                    id v103 = v84;
                    id v85 = v95;
                    id v104 = v85;
                    id v105 = v8;
                    v108 = v9;
                    id v86 = v94;
                    id v106 = v86;
                    v107 = self;
                    v111[1] = (id)v93;
                    [v83 setCompletionBlock:v100];
                    v87 = [MEMORY[0x263F894E0] mainQueue];
                    [v87 addOperation:v83];

                    objc_destroyWeak(v111);
                    objc_destroyWeak(&v110);
                    objc_destroyWeak((id *)from);

                    goto LABEL_97;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    v73 = [v13 objectForKeyedSubscript:@"confirmationStyle"];
                    uint64_t v93 = (int)[v73 intValue];
                    goto LABEL_96;
                  }
                  v73 = [MEMORY[0x263F7B1F8] sharedConfig];
                  int v74 = [v73 shouldLog];
                  int v75 = [v73 shouldLogToDisk];
                  v76 = [v73 OSLogObject];
                  id v77 = v76;
                  if (v75) {
                    v74 |= 2u;
                  }
                  if (!os_log_type_enabled(v76, OS_LOG_TYPE_ERROR)) {
                    v74 &= 2u;
                  }
                  if (v74)
                  {
                    id v78 = objc_opt_class();
                    *(_DWORD *)from = 138412290;
                    *(void *)&from[4] = v78;
                    id v79 = v78;
                    LODWORD(v92) = 12;
                    int v80 = (void *)_os_log_send_and_compose_impl();

                    if (!v80)
                    {
LABEL_95:
                      uint64_t v93 = 0;
                      goto LABEL_96;
                    }
                    id v77 = objc_msgSend(NSString, "stringWithCString:encoding:", v80, 4, from, v92);
                    free(v80);
                    SSFileLog();
                  }

                  goto LABEL_95;
                }
                v69 = objc_msgSend(NSString, "stringWithCString:encoding:", v72, 4, from, v92);
                free(v72);
                v91 = v69;
                SSFileLog();
              }

              goto LABEL_82;
            }
            int v61 = objc_msgSend(NSString, "stringWithCString:encoding:", v64, 4, from, v92);
            free(v64);
            v90 = v61;
            SSFileLog();
          }

          goto LABEL_72;
        }
        v53 = objc_msgSend(NSString, "stringWithCString:encoding:", v56, 4, from, v92);
        free(v56);
        v89 = v53;
        SSFileLog();
      }

      goto LABEL_62;
    }
    uint64_t v41 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v42 = [v41 shouldLog];
    int v43 = [v41 shouldLogToDisk];
    id v44 = [v41 OSLogObject];
    int v45 = v44;
    if (v43) {
      v42 |= 2u;
    }
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT)) {
      v42 &= 2u;
    }
    if (v42)
    {
      int v46 = objc_opt_class();
      *(_DWORD *)from = 138543362;
      *(void *)&from[4] = v46;
      id v47 = v46;
      LODWORD(v92) = 12;
      v88 = from;
      int v48 = (void *)_os_log_send_and_compose_impl();

      if (!v48)
      {
LABEL_52:

        goto LABEL_53;
      }
      int v45 = objc_msgSend(NSString, "stringWithCString:encoding:", v48, 4, from, v92);
      free(v48);
      v88 = v45;
      SSFileLog();
    }

    goto LABEL_52;
  }
  id v14 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v22 = [v14 shouldLog];
  int v23 = [v14 shouldLogToDisk];
  uint64_t v24 = [v14 OSLogObject];
  id v25 = v24;
  if (v23) {
    v22 |= 2u;
  }
  if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    v22 &= 2u;
  }
  if (!v22) {
    goto LABEL_28;
  }
  int v26 = objc_opt_class();
  *(_DWORD *)from = 138543362;
  *(void *)&from[4] = v26;
  id v27 = v26;
  LODWORD(v92) = 12;
  id v28 = (void *)_os_log_send_and_compose_impl();

  if (v28)
  {
    id v25 = objc_msgSend(NSString, "stringWithCString:encoding:", v28, 4, from, v92);
    free(v28);
    SSFileLog();
LABEL_28:
  }
LABEL_20:

  [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  ISError();
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(void, void, id))v9)[2](v9, 0, v13);
LABEL_97:

  _Block_object_dispose(&v112, 8);
  objc_destroyWeak(&v120);
  objc_destroyWeak(&location);
}

void __72__SUScriptInterface_authorizeApplePayEnrollmentWithParameters_callback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v20[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = [[SUScriptFunction alloc] initWithScriptObject:*(void *)(a1 + 32)];
  [(SUScriptFunction *)v8 setThisObject:WeakRetained];
  if (v6)
  {
    long long v9 = [[SUScriptError alloc] initWithError:v6];
    id v10 = [MEMORY[0x263F1FA98] undefined];
    v20[0] = v10;
    v20[1] = v9;
    uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
    [(SUScriptFunction *)v8 callWithArguments:v11];
  }
  else
  {
    int v12 = [v5 token];
    id v13 = [v12 paymentData];

    long long v9 = v13;
    [(SUScriptError *)v9 bytes];
    [(SUScriptError *)v9 length];
    id v10 = (void *)ISCopyEncodedBase64();
    id v18 = @"payment";
    id v19 = v10;
    uint64_t v11 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    id v14 = [[SUScriptDictionary alloc] initWithDictionary:v11];
    v17[0] = v14;
    int v15 = [MEMORY[0x263F1FA98] undefined];
    v17[1] = v15;
    int v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
    [(SUScriptFunction *)v8 callWithArguments:v16];
  }
  [(SUScriptFunction *)v8 setThisObject:0];
}

void __72__SUScriptInterface_authorizeApplePayEnrollmentWithParameters_callback___block_invoke_269(uint64_t a1)
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  id v3 = objc_loadWeakRetained((id *)(a1 + 112));
  int v4 = [v3 URLBag];
  id v5 = v4;
  if (!v4)
  {
    int v23 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v24 = [v23 shouldLog];
    if ([v23 shouldLogToDisk]) {
      int v25 = v24 | 2;
    }
    else {
      int v25 = v24;
    }
    int v26 = [v23 OSLogObject];
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      v25 &= 2u;
    }
    if (v25)
    {
      *(_DWORD *)buf = 138543362;
      id v72 = (id)objc_opt_class();
      id v27 = v72;
      LODWORD(v64) = 12;
      id v63 = buf;
      id v28 = (void *)_os_log_send_and_compose_impl();

      if (!v28)
      {
LABEL_32:

        uint64_t v29 = ISError();
        id v7 = 0;
        uint64_t v30 = *(void *)(*(void *)(a1 + 96) + 8);
        int v16 = *(void **)(v30 + 40);
        *(void *)(v30 + 4UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0) = v29;
        goto LABEL_33;
      }
      int v26 = objc_msgSend(NSString, "stringWithCString:encoding:", v28, 4, buf, v64);
      free(v28);
      id v63 = (uint8_t *)v26;
      SSFileLog();
    }

    goto LABEL_32;
  }
  id v6 = [v4 valueForKey:@"countryCode"];
  id v7 = [v6 uppercaseString];

  if (!v7)
  {
    id v8 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    uint64_t v11 = [v8 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      v10 &= 2u;
    }
    if (v10)
    {
      *(_DWORD *)buf = 138543362;
      id v72 = (id)objc_opt_class();
      id v12 = v72;
      LODWORD(v64) = 12;
      id v63 = buf;
      id v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_12:

        goto LABEL_13;
      }
      uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, buf, v64);
      free(v13);
      id v63 = (uint8_t *)v11;
      SSFileLog();
    }

    goto LABEL_12;
  }
LABEL_13:
  id v14 = objc_msgSend(v5, "valueForKey:", @"currencyCode", v63);
  int v15 = [v14 uppercaseString];

  if (v15) {
    goto LABEL_43;
  }
  int v16 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v17 = [v16 shouldLog];
  if ([v16 shouldLogToDisk]) {
    int v18 = v17 | 2;
  }
  else {
    int v18 = v17;
  }
  id v19 = [v16 OSLogObject];
  if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    v18 &= 2u;
  }
  if (v18)
  {
    id v20 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    id v72 = v20;
    id v21 = v20;
    LODWORD(v64) = 12;
    id v63 = buf;
    int v22 = (void *)_os_log_send_and_compose_impl();

    if (!v22) {
      goto LABEL_33;
    }
    id v19 = objc_msgSend(NSString, "stringWithCString:encoding:", v22, 4, buf, v64);
    free(v22);
    id v63 = (uint8_t *)v19;
    SSFileLog();
  }

LABEL_33:
  id v31 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v32 = [v31 shouldLog];
  if ([v31 shouldLogToDisk]) {
    int v33 = v32 | 2;
  }
  else {
    int v33 = v32;
  }
  int v34 = objc_msgSend(v31, "OSLogObject", v63);
  if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
    v33 &= 2u;
  }
  if (!v33) {
    goto LABEL_41;
  }
  int v35 = objc_opt_class();
  *(_DWORD *)buf = 138543362;
  id v72 = v35;
  id v36 = v35;
  LODWORD(v64) = 12;
  id v63 = buf;
  id v37 = (void *)_os_log_send_and_compose_impl();

  if (v37)
  {
    int v34 = objc_msgSend(NSString, "stringWithCString:encoding:", v37, 4, buf, v64);
    free(v37);
    id v63 = (uint8_t *)v34;
    SSFileLog();
LABEL_41:
  }
  uint64_t v38 = [MEMORY[0x263EFF960] currentLocale];
  int v15 = [v38 currencyCode];

LABEL_43:
  if (*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40))
  {
LABEL_60:
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
    goto LABEL_61;
  }
  if (!*(void *)(a1 + 40) || !*(void *)(a1 + 48) || !*(void *)(a1 + 56) || !v7 || !v15 || !*(void *)(a1 + 64))
  {
    id v39 = objc_msgSend(MEMORY[0x263F7B1F8], "sharedConfig", v63);
    int v40 = [v39 shouldLog];
    if ([v39 shouldLogToDisk]) {
      int v41 = v40 | 2;
    }
    else {
      int v41 = v40;
    }
    int v42 = [v39 OSLogObject];
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      v41 &= 2u;
    }
    if (v41)
    {
      int v43 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v72 = v43;
      id v44 = v43;
      LODWORD(v64) = 12;
      id v63 = buf;
      int v45 = (void *)_os_log_send_and_compose_impl();

      if (!v45) {
        goto LABEL_59;
      }
      int v42 = objc_msgSend(NSString, "stringWithCString:encoding:", v45, 4, buf, v64);
      free(v45);
      id v63 = (uint8_t *)v42;
      SSFileLog();
    }

LABEL_59:
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    uint64_t v46 = ISError();
    uint64_t v47 = *(void *)(*(void *)(a1 + 96) + 8);
    int v48 = *(void **)(v47 + 40);
    *(void *)(v47 + 4UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0) = v46;

    if (*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40)) {
      goto LABEL_60;
    }
  }
  int v49 = (void *)[objc_alloc(MEMORY[0x263F27B90]) initWithPaymentSession:*(void *)(a1 + 40)];
  [v49 setCountryCode:v7];
  [v49 setCurrencyCode:v15];
  [v49 setPassSerialNumber:*(void *)(a1 + 56)];
  [v49 setPassTypeIdentifier:*(void *)(a1 + 48)];
  int v50 = *(void **)(a1 + 72);
  if (v50)
  {
    int v51 = [v50 objectForKeyedSubscript:@"topic"];
    if (v51)
    {
      id v52 = (void *)[objc_alloc(MEMORY[0x263F27D48]) initWithTopic:v51];
      uint64_t v53 = [*(id *)(a1 + 72) objectForKeyedSubscript:@"mtApp"];
      if (v53) {
        [v52 setProperty:v53 forBodyKey:@"app"];
      }
      int v66 = v53;
      uint64_t v54 = objc_msgSend(*(id *)(a1 + 72), "objectForKeyedSubscript:", @"mtPageContext", v63);
      if (v54) {
        [v52 setProperty:v54 forBodyKey:@"pageContext"];
      }
      v65 = (void *)v54;
      id v68 = v51;
      id v55 = [*(id *)(a1 + 72) objectForKeyedSubscript:@"mtPageId"];
      if (v55) {
        [v52 setProperty:v55 forBodyKey:@"pageId"];
      }
      id v67 = v3;
      v56 = [*(id *)(a1 + 72) objectForKeyedSubscript:@"mtPageType"];
      if (v56) {
        [v52 setProperty:v56 forBodyKey:@"pageType"];
      }
      [*(id *)(a1 + 72) objectForKeyedSubscript:@"mtPrevPage"];
      v58 = int v57 = v52;
      if (v58) {
        [v57 setProperty:v58 forBodyKey:@"prevPage"];
      }
      [v49 setMetricsEvent:v57];

      int v59 = v57;
      id v3 = v67;
      int v51 = v68;
      v60 = v66;
    }
    else
    {
      int v59 = [MEMORY[0x263F27CB8] sharedConfig];
      v60 = [v59 OSLogObject];
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        int v61 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        id v72 = v61;
        _os_log_impl(&dword_2277A2000, v60, OS_LOG_TYPE_ERROR, "%{public}@: [AuthorizeEnrollment] Metrics failed for no topic", buf, 0xCu);
      }
    }
  }
  if (*(void *)(a1 + 120) <= 1uLL) {
    objc_msgSend(v49, "setConfirmationStyle:");
  }
  int v62 = objc_msgSend(v49, "performCardAuthorization", v63);
  v69[0] = MEMORY[0x263EF8330];
  v69[1] = 3221225472;
  v69[2] = __72__SUScriptInterface_authorizeApplePayEnrollmentWithParameters_callback___block_invoke_306;
  v69[3] = &unk_264812510;
  v69[4] = WeakRetained;
  id v70 = *(id *)(a1 + 88);
  [v62 addFinishBlock:v69];

LABEL_61:
}

void __72__SUScriptInterface_authorizeApplePayEnrollmentWithParameters_callback___block_invoke_306(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v7 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    int v10 = [v7 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      v9 &= 2u;
    }
    if (v9)
    {
      LODWORD(v14) = 138543362;
      *(void *)((char *)&v14 + 4) = objc_opt_class();
      id v11 = *(id *)((char *)&v14 + 4);
      LODWORD(v13) = 12;
      id v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_11:

        goto LABEL_12;
      }
      int v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v14, v13, v14);
      free(v12);
      SSFileLog();
    }

    goto LABEL_11;
  }
LABEL_12:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)dismissSafariViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v4 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  id v7 = [v4 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
    int v8 = v6;
  }
  else {
    int v8 = v6 & 2;
  }
  if (!v8) {
    goto LABEL_10;
  }
  v11[0] = 67109120;
  v11[1] = v3;
  LODWORD(v1UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0) = 8;
  int v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    id v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, v11, v10);
    free(v9);
    SSFileLog();
LABEL_10:
  }
  WebThreadRunOnMainThread();
}

uint64_t __57__SUScriptInterface_dismissSafariViewControllerAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismissSafariViewControllerAnimated:*(unsigned __int8 *)(a1 + 40) completion:0];
}

- (void)showSafariViewControllerWithURLString:(id)a3 identifier:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  int v9 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v10 = [v9 shouldLog];
  if ([v9 shouldLogToDisk]) {
    int v11 = v10 | 2;
  }
  else {
    int v11 = v10;
  }
  uint64_t v12 = [v9 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
    int v13 = v11;
  }
  else {
    int v13 = v11 & 2;
  }
  if (v13)
  {
    int v25 = 138412802;
    id v26 = v7;
    __int16 v27 = 2112;
    id v28 = v8;
    __int16 v29 = 1024;
    BOOL v30 = v5;
    LODWORD(v22) = 28;
    id v21 = &v25;
    long long v14 = (void *)_os_log_send_and_compose_impl();

    if (!v14) {
      goto LABEL_11;
    }
    uint64_t v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v25, v22);
    free(v14);
    id v21 = (int *)v12;
    SSFileLog();
  }

LABEL_11:
  if (!v8)
  {
    uint64_t v15 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v16 = [v15 shouldLog];
    if ([v15 shouldLogToDisk]) {
      int v17 = v16 | 2;
    }
    else {
      int v17 = v16;
    }
    int v18 = objc_msgSend(v15, "OSLogObject", v21);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      int v19 = v17;
    }
    else {
      int v19 = v17 & 2;
    }
    if (v19)
    {
      LOWORD(v25) = 0;
      LODWORD(v22) = 2;
      id v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20) {
        goto LABEL_23;
      }
      int v18 = objc_msgSend(NSString, "stringWithCString:encoding:", v20, 4, &v25, v22);
      free(v20);
      SSFileLog();
    }

    goto LABEL_23;
  }
  id v23 = v7;
  id v24 = v8;
  WebThreadRunOnMainThread();

  uint64_t v15 = v23;
LABEL_23:
}

void __79__SUScriptInterface_showSafariViewControllerWithURLString_identifier_animated___block_invoke(uint64_t a1)
{
  id v2 = [NSURL URLWithString:*(void *)(a1 + 32)];
  BOOL v3 = [*(id *)(a1 + 40) safariViewControllerIdentifier];

  int v4 = *(void **)(a1 + 40);
  if (v3)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __79__SUScriptInterface_showSafariViewControllerWithURLString_identifier_animated___block_invoke_2;
    v5[3] = &unk_2648122B8;
    v5[4] = v4;
    id v6 = v2;
    id v7 = *(id *)(a1 + 48);
    [v4 _dismissSafariViewControllerAnimated:0 completion:v5];
  }
  else
  {
    [*(id *)(a1 + 40) _presentSafariViewControllerWithURL:v2 safariIdentifier:*(void *)(a1 + 48) animated:*(unsigned __int8 *)(a1 + 56)];
  }
}

uint64_t __79__SUScriptInterface_showSafariViewControllerWithURLString_identifier_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentSafariViewControllerWithURL:*(void *)(a1 + 40) safariIdentifier:*(void *)(a1 + 48) animated:0];
}

- (id)applicationAccessibilityEnabled
{
  int v2 = _AXSApplicationAccessibilityEnabled();
  BOOL v3 = (void **)MEMORY[0x263EFFB40];
  if (!v2) {
    BOOL v3 = (void **)MEMORY[0x263EFFB38];
  }
  int v4 = *v3;

  return v4;
}

- (SUScriptKeyValueStore)applicationLocalStorage
{
  [(SUScriptObject *)self lock];
  applicationLocalStorage = self->_applicationLocalStorage;
  if (!applicationLocalStorage)
  {
    int v4 = NSString;
    BOOL v5 = [(SUClientInterface *)self->_clientInterface clientIdentifier];
    id v6 = [v4 stringWithFormat:@"com.apple.iTunesStoreUI.script.app.%@", v5];

    id v7 = [[SUScriptKeyValueStore alloc] initWithDomain:v6];
    id v8 = self->_applicationLocalStorage;
    self->_applicationLocalStorage = v7;

    applicationLocalStorage = self->_applicationLocalStorage;
  }
  int v9 = applicationLocalStorage;
  [(SUScriptObject *)self unlock];

  return v9;
}

- (NSString)askToBuyPrompt
{
  uint64_t v4 = 0;
  BOOL v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy_;
  id v8 = __Block_byref_object_dispose_;
  id v9 = 0;
  WebThreadRunOnMainThread();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSString *)v2;
}

void __35__SUScriptInterface_askToBuyPrompt__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) clientInterface];
  uint64_t v2 = [v5 askToBuyApprovalPrompt];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 4UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0) = v2;
}

- (id)_className
{
  return @"iTunes";
}

- (NSString)clientIdentifier
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy_;
  id v8 = __Block_byref_object_dispose_;
  id v9 = 0;
  WebThreadRunOnMainThread();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSString *)v2;
}

void __37__SUScriptInterface_clientIdentifier__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) clientInterface];
  uint64_t v2 = [v5 clientIdentifier];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 4UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0) = v2;
}

- (NSString)cookie
{
  uint64_t v3 = [(SUScriptInterface *)self webFrame];
  uint64_t v4 = [v3 dataSource];
  id v5 = [v4 request];
  uint64_t v6 = [v5 URL];
  id v7 = [(SUScriptInterface *)self _cookieForURL:v6];

  return (NSString *)v7;
}

- (NSString)cookieDefaultURL
{
  return (NSString *)@"http://www.apple.com/";
}

- (NSString)cookieForDefaultURL
{
  uint64_t v3 = NSURL;
  uint64_t v4 = [(SUScriptInterface *)self cookieDefaultURL];
  id v5 = [v3 URLWithString:v4];
  uint64_t v6 = [(SUScriptInterface *)self _cookieForURL:v5];

  return (NSString *)v6;
}

- (id)creditCardReaderAvailable
{
  BOOL v2 = +[SUCreditCardReaderViewController cameraSupported];
  uint64_t v3 = (void **)MEMORY[0x263EFFB40];
  if (!v2) {
    uint64_t v3 = (void **)MEMORY[0x263EFFB38];
  }
  uint64_t v4 = *v3;

  return v4;
}

- (NSArray)deviceOffers
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v4 = [MEMORY[0x263F27BF8] deviceOffers];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  int v10 = __33__SUScriptInterface_deviceOffers__block_invoke;
  int v11 = &unk_264812600;
  uint64_t v12 = self;
  id v13 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:&v8];

  uint64_t v6 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithArray:", v5, v8, v9, v10, v11, v12);

  return (NSArray *)v6;
}

void __33__SUScriptInterface_deviceOffers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [[SUScriptDeviceOffer alloc] initWithDeviceOffer:v3];

  [*(id *)(a1 + 32) checkInScriptObject:v4];
  [*(id *)(a1 + 40) addObject:v4];
}

- (NSString)deviceSerialNumber
{
  BOOL v2 = [MEMORY[0x263F7B148] currentDevice];
  id v3 = [v2 serialNumber];
  uint64_t v4 = v3;
  if (!v3) {
    id v3 = &stru_26DB8C5F8;
  }
  id v5 = v3;

  return v5;
}

- (id)globalRootObject
{
  BOOL v2 = [(SUScriptInterface *)self webFrame];
  id v3 = [v2 webView];
  uint64_t v4 = [v3 mainFrame];
  id v5 = [v4 windowObject];

  return v5;
}

- (NSString)gsToken
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy_;
  uint64_t v8 = __Block_byref_object_dispose_;
  id v9 = 0;
  WebThreadRunOnMainThread();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSString *)v2;
}

void __28__SUScriptInterface_gsToken__block_invoke(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) parentViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = [v8 webView];
    id v3 = [v2 request];
    uint64_t v4 = [v3 allHTTPHeaderFields];

    uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F7B7C8]];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 4UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0) = v5;
  }
}

- (id)isApplePayAvailable
{
  int v2 = [MEMORY[0x263F27BF8] isSecureElementAvailable];
  id v3 = (void **)MEMORY[0x263EFFB40];
  if (!v2) {
    id v3 = (void **)MEMORY[0x263EFFB38];
  }
  uint64_t v4 = *v3;

  return v4;
}

- (id)isFinanceInterruption
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  WebThreadRunOnMainThread();
  if (*((unsigned char *)v6 + 24)) {
    int v2 = (id *)MEMORY[0x263EFFB40];
  }
  else {
    int v2 = (id *)MEMORY[0x263EFFB38];
  }
  id v3 = *v2;
  _Block_object_dispose(&v5, 8);

  return v3;
}

void __42__SUScriptInterface_isFinanceInterruption__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) clientInterface];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isFinanceInterruption];
}

- (id)isWalletAvailable
{
  int v2 = [(id)ISWeakLinkedClassForString() isPassLibraryAvailable];
  id v3 = (void **)MEMORY[0x263EFFB40];
  if (!v2) {
    id v3 = (void **)MEMORY[0x263EFFB38];
  }
  uint64_t v4 = *v3;

  return v4;
}

- (id)loggingEnabled
{
  int v2 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v3 = [v2 shouldLog];
  uint64_t v4 = (id *)MEMORY[0x263EFFB40];
  if (!v3) {
    uint64_t v4 = (id *)MEMORY[0x263EFFB38];
  }
  id v5 = *v4;

  return v5;
}

- (id)makeXMLHTTPRequest
{
  int v2 = [[SUScriptXMLHTTPRequest alloc] initWithDelegate:self];

  return v2;
}

- (id)makeXMLHTTPStoreRequest
{
  int v3 = [[SUScriptXMLHTTPStoreRequest alloc] initWithDelegate:self];
  uint64_t v4 = [(SUScriptInterface *)self authenticationContext];
  [(SUScriptXMLHTTPStoreRequest *)v3 setAuthenticationContext:v4];

  id v5 = [(SUScriptInterface *)self clientInterface];
  uint64_t v6 = objc_alloc_init(SUStorePageDataProvider);
  [(SUStorePageDataProvider *)v6 setClientInterface:v5];
  [(SUScriptXMLHTTPStoreRequest *)v3 setDataProvider:v6];

  return v3;
}

- (SUScriptNavigationBar)navigationBar
{
  int v2 = [(SUScriptInterface *)self viewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v3 = [v2 navigationController];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v4 = [v3 navigationBar];
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (SUScriptNavigationBar *)v4;
}

- (SUScriptNavigationSimulator)navigationSimulator
{
  WebThreadRunOnMainThread();
  if (self->_navigationSimulator)
  {
    -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:");
    int v3 = self->_navigationSimulator;
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Failed to create a navigation simulator."];
    int v3 = [MEMORY[0x263EFF9D0] null];
  }

  return v3;
}

void __40__SUScriptInterface_navigationSimulator__block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  if (!v2[31])
  {
    int v3 = [v2 parentViewController];
    objc_msgSend(v3, "su_closestNavigationController");
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      uint64_t v4 = [[SUScriptNavigationSimulator alloc] initWithNavigationController:v7];
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void **)(v5 + 248);
      *(void *)(v5 + 248) = v4;
    }
  }
}

- (NSNumber)orientation
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy_;
  int v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  WebThreadRunOnMainThread();
  int v2 = (void *)v7[5];
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    id v3 = [MEMORY[0x263EFF9D0] null];
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v6, 8);

  return (NSNumber *)v4;
}

void __32__SUScriptInterface_orientation__block_invoke(uint64_t a1)
{
  id v4 = objc_alloc(NSNumber);
  uint64_t v5 = (void *)0x263F1C000;
  id v13 = [MEMORY[0x263F1C408] sharedApplication];
  uint64_t v6 = [v13 statusBarOrientation];
  if (v6 == 1)
  {
    int v7 = 0;
    int v8 = 0;
    uint64_t v9 = 0;
  }
  else
  {
    id v1 = [MEMORY[0x263F1C408] sharedApplication];
    if ([v1 statusBarOrientation] == 4)
    {
      int v7 = 0;
      int v8 = 0;
      uint64_t v9 = -90;
    }
    else
    {
      int v2 = [MEMORY[0x263F1C408] sharedApplication];
      if ([v2 statusBarOrientation] == 3)
      {
        int v8 = 0;
        int v7 = 1;
        uint64_t v9 = 90;
      }
      else
      {
        uint64_t v5 = [MEMORY[0x263F1C408] sharedApplication];
        if ([v5 statusBarOrientation] == 2) {
          uint64_t v9 = 180;
        }
        else {
          uint64_t v9 = 0;
        }
        int v7 = 1;
        int v8 = 1;
      }
    }
  }
  uint64_t v10 = [v4 initWithInteger:v9];
  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 4UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0) = v10;

  if (v8) {
  if (v7)
  }

  if (v6 != 1) {
}
  }

- (NSString)referrerURL
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  int v7 = __Block_byref_object_copy_;
  int v8 = __Block_byref_object_dispose_;
  id v9 = 0;
  WebThreadRunOnMainThread();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSString *)v2;
}

void __32__SUScriptInterface_referrerURL__block_invoke(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) parentViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = [v8 webView];
    id v3 = [v2 request];
    uint64_t v4 = [v3 allHTTPHeaderFields];

    uint64_t v5 = [v4 valueForKey:@"referer"];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    int v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 4UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0) = v5;
  }
}

- (NSString)referringUserAgent
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  int v7 = __Block_byref_object_copy_;
  id v8 = __Block_byref_object_dispose_;
  id v9 = 0;
  WebThreadRunOnMainThread();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSString *)v2;
}

void __39__SUScriptInterface_referringUserAgent__block_invoke(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) parentViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = [v8 webView];
    id v3 = [v2 request];
    uint64_t v4 = [v3 allHTTPHeaderFields];

    uint64_t v5 = [v4 valueForKey:@"ref-user-agent"];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    int v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 4UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0) = v5;
  }
}

- (id)requestInfo
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy_;
  uint64_t v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  if (v9[5])
  {
    id v3 = [SUScriptRequestPerformance alloc];
    uint64_t v4 = -[SUScriptRequestPerformance initWithRequestPerformance:](v3, "initWithRequestPerformance:", v9[5], v6, 3221225472, __32__SUScriptInterface_requestInfo__block_invoke, &unk_2648125D8, self, &v8);
    [(SUScriptObject *)self checkInScriptObject:v4];
  }
  else
  {
    uint64_t v4 = 0;
  }
  _Block_object_dispose(&v8, 8);

  return v4;
}

uint64_t __32__SUScriptInterface_requestInfo__block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 4UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0) = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 112), "performanceMetricsForScriptInterface:");
    return MEMORY[0x270F9A758]();
  }
  return result;
}

- (id)safariViewControllerDismissButtonStyle
{
  return self->_safariDismissButtonStyle;
}

- (SUScriptPreviewOverlay)previewOverlay
{
  [(SUScriptObject *)self lock];
  previewOverlay = self->_previewOverlay;
  if (previewOverlay)
  {
    uint64_t v4 = previewOverlay;
    [(SUScriptObject *)self unlock];
  }
  else
  {
    uint64_t v5 = objc_alloc_init(SUScriptPreviewOverlay);
    uint64_t v6 = self->_previewOverlay;
    self->_previewOverlay = v5;

    [(SUScriptObject *)self->_previewOverlay setVisible:1];
    uint64_t v4 = self->_previewOverlay;
    [(SUScriptObject *)self unlock];
    [(SUScriptObject *)self checkInScriptObject:v4];
  }

  return v4;
}

- (id)screenReaderRunning
{
  BOOL IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();
  id v3 = (void **)MEMORY[0x263EFFB40];
  if (!IsVoiceOverRunning) {
    id v3 = (void **)MEMORY[0x263EFFB38];
  }
  uint64_t v4 = *v3;

  return v4;
}

- (void)setCookie:(id)a3
{
  id v15 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", v15, @"Set-Cookie", 0);
    uint64_t v5 = (void *)MEMORY[0x263EFC5D0];
    uint64_t v6 = [(SUScriptInterface *)self webFrame];
    int v7 = [v6 dataSource];
    uint64_t v8 = [v7 request];
    id v9 = [v8 URL];
    uint64_t v10 = [v5 cookiesWithResponseHeaderFields:v4 forURL:v9];

    if ([v10 count])
    {
      uint64_t v11 = [MEMORY[0x263F7B0E8] defaultStore];
      uint64_t v12 = [v11 activeAccount];

      id v13 = [MEMORY[0x263F7B380] sharedStorage];
      long long v14 = [v12 uniqueIdentifier];
      [v13 setCookies:v10 forUserIdentifier:v14];
    }
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }
}

- (void)setCookieDefaultURL:(id)a3
{
  id v3 = (void *)MEMORY[0x263F1FA90];
  id v4 = [NSString stringWithFormat:@"%@ is readonly", @"cookieDefaultURL"];
  [v3 throwException:v4];
}

- (void)setCookieForDefaultURL:(id)a3
{
  id v3 = (void *)MEMORY[0x263F1FA90];
  id v4 = [NSString stringWithFormat:@"%@ is readonly", @"cookieForDefaultURL"];
  [v3 throwException:v4];
}

- (void)setGlobalRootObject:(id)a3
{
  id v3 = (void *)MEMORY[0x263F1FA90];
  id v4 = [NSString stringWithFormat:@"%@ is readonly", @"globalRootObject"];
  [v3 throwException:v4];
}

- (void)setGsToken:(id)a3
{
  id v3 = (void *)MEMORY[0x263F1FA90];
  id v4 = [NSString stringWithFormat:@"%@ is readonly", @"gsToken"];
  [v3 throwException:v4];
}

- (void)setLoggingEnabled:(id)a3
{
  id v3 = (void *)MEMORY[0x263F1FA90];
  id v4 = [NSString stringWithFormat:@"%@ is readonly", @"loggingEnabled"];
  [v3 throwException:v4];
}

- (void)setOrientation:(id)a3
{
  id v3 = (void *)MEMORY[0x263F1FA90];
  id v4 = [NSString stringWithFormat:@"%@ is readonly", @"orientation"];
  [v3 throwException:v4];
}

- (void)setReferrerURL:(id)a3
{
  id v3 = (void *)MEMORY[0x263F1FA90];
  id v4 = [NSString stringWithFormat:@"%@ is readonly", @"referrerURL"];
  [v3 throwException:v4];
}

- (void)setReferringUserAgent:(id)a3
{
  id v3 = (void *)MEMORY[0x263F1FA90];
  id v4 = [NSString stringWithFormat:@"%@ is readonly", @"referringUserAgent"];
  [v3 throwException:v4];
}

- (void)setSafariViewControllerDismissButtonStyle:(id)a3
{
  p_safariDismissButtonStyle = &self->_safariDismissButtonStyle;
  objc_storeStrong((id *)&self->_safariDismissButtonStyle, a3);
  id v6 = a3;
  [(SFSafariViewController *)self->_safariViewController setDismissButtonStyle:[(NSNumber *)*p_safariDismissButtonStyle integerValue]];
}

- (void)setNavigationBar:(id)a3
{
  id v3 = (void *)MEMORY[0x263F1FA90];
  id v4 = [NSString stringWithFormat:@"%@ is readonly", @"navigationBar"];
  [v3 throwException:v4];
}

- (void)setNavigationSimulator:(id)a3
{
  id v3 = (void *)MEMORY[0x263F1FA90];
  id v4 = [NSString stringWithFormat:@"%@ is readonly", @"navigationSimulator"];
  [v3 throwException:v4];
}

- (void)setStoreFrontIdentifier:(id)a3
{
  id v3 = (void *)MEMORY[0x263F1FA90];
  id v4 = [NSString stringWithFormat:@"%@ is readonly", @"storeFrontID"];
  [v3 throwException:v4];
}

- (void)setTidHeaders:(id)a3
{
  id v3 = (void *)MEMORY[0x263F1FA90];
  id v4 = [NSString stringWithFormat:@"%@ is readonly", @"tidHeaders"];
  [v3 throwException:v4];
}

- (void)setTidState:(id)a3
{
  id v3 = (void *)MEMORY[0x263F1FA90];
  id v4 = [NSString stringWithFormat:@"%@ is readonly", @"tidState"];
  [v3 throwException:v4];
}

- (void)setUserAgent:(id)a3
{
  id v3 = (void *)MEMORY[0x263F1FA90];
  id v4 = [NSString stringWithFormat:@"%@ is readonly", @"userAgent"];
  [v3 throwException:v4];
}

- (void)setWalletAvailable:(id)a3
{
  id v3 = (void *)MEMORY[0x263F1FA90];
  id v4 = [NSString stringWithFormat:@"%@ is readonly", @"walletAvailable"];
  [v3 throwException:v4];
}

- (NSString)storeFrontIdentifier
{
  id v2 = [MEMORY[0x263F7B0E8] defaultStore];
  id v3 = [v2 activeAccount];

  id v4 = SSVStoreFrontIdentifierForAccount();

  return (NSString *)v4;
}

- (int64_t)storeSheetType
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  WebThreadRunOnMainThread();
  if (*((unsigned char *)v6 + 24)) {
    id v2 = (int64_t *)MEMORY[0x263EFFB40];
  }
  else {
    id v2 = (int64_t *)MEMORY[0x263EFFB38];
  }
  int64_t v3 = *v2;
  _Block_object_dispose(&v5, 8);
  return v3;
}

void __35__SUScriptInterface_storeSheetType__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) clientInterface];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 inAskToBuyApprovalFlow];
}

- (SUScriptDictionary)tidHeaders
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy_;
  char v8 = __Block_byref_object_dispose_;
  id v9 = 0;
  WebThreadRunOnMainThread();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (SUScriptDictionary *)v2;
}

uint64_t __31__SUScriptInterface_tidHeaders__block_invoke(uint64_t a1)
{
  uint64_t v22 = [*(id *)(a1 + 32) parentViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = [v22 webView];
    int64_t v3 = [v2 request];
    uint64_t v4 = [v3 allHTTPHeaderFields];

    id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v6 = *MEMORY[0x263F7B818];
    uint64_t v7 = [v4 objectForKeyedSubscript:*MEMORY[0x263F7B818]];
    if (v7) {
      [v5 setObject:v7 forKeyedSubscript:v6];
    }
    uint64_t v8 = *MEMORY[0x263F7B820];
    id v9 = [v4 objectForKeyedSubscript:*MEMORY[0x263F7B820]];

    if (v9) {
      [v5 setObject:v9 forKeyedSubscript:v8];
    }
    uint64_t v10 = *MEMORY[0x263F7B830];
    uint64_t v11 = [v4 objectForKeyedSubscript:*MEMORY[0x263F7B830]];

    if (v11) {
      [v5 setObject:v11 forKeyedSubscript:v10];
    }
    uint64_t v12 = *MEMORY[0x263F7B838];
    id v13 = [v4 objectForKeyedSubscript:*MEMORY[0x263F7B838]];

    if (v13) {
      [v5 setObject:v13 forKeyedSubscript:v12];
    }
    uint64_t v14 = *MEMORY[0x263F7B840];
    id v15 = [v4 objectForKeyedSubscript:*MEMORY[0x263F7B840]];

    if (v15) {
      [v5 setObject:v15 forKeyedSubscript:v14];
    }
    uint64_t v16 = *MEMORY[0x263F7B810];
    int v17 = [v4 objectForKeyedSubscript:*MEMORY[0x263F7B810]];

    if (v17) {
      [v5 setObject:v17 forKeyedSubscript:v16];
    }
    int v18 = [[SUScriptDictionary alloc] initWithDictionary:v5];
    uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
    id v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 4UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0) = v18;
  }

  return MEMORY[0x270F9A758]();
}

- (NSString)tidState
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy_;
  uint64_t v8 = __Block_byref_object_dispose_;
  id v9 = 0;
  WebThreadRunOnMainThread();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSString *)v2;
}

void __29__SUScriptInterface_tidState__block_invoke(uint64_t a1)
{
  id v5 = [MEMORY[0x263F89460] sharedInstance];
  uint64_t v2 = ISBiometricsHTTPHeaderValueForBiometricStateWithStore();
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 4UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0) = v2;
}

- (NSString)userAgent
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy_;
  uint64_t v8 = __Block_byref_object_dispose_;
  id v9 = 0;
  WebThreadRunOnMainThread();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSString *)v2;
}

void __30__SUScriptInterface_userAgent__block_invoke(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) parentViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = [v8 webView];
    uint64_t v3 = [v2 request];
    uint64_t v4 = [v3 allHTTPHeaderFields];

    uint64_t v5 = [v4 valueForKey:@"User-Agent"];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 4UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0) = v5;
  }
}

- (NSString)safariViewControllerIdentifierQueryParameterName
{
  return (NSString *)@"safariid";
}

- (int64_t)storeSheetTypeDefault
{
  return 0;
}

- (int64_t)storeSheetTypeAskToBuy
{
  return 1;
}

- (id)accountDSID
{
  id v2 = [MEMORY[0x263F7B0E8] defaultStore];
  uint64_t v3 = [v2 activeAccount];
  uint64_t v4 = [v3 uniqueIdentifier];

  return v4;
}

- (id)accountName
{
  id v2 = [MEMORY[0x263F7B0E8] defaultStore];
  uint64_t v3 = [v2 activeAccount];
  uint64_t v4 = [v3 accountName];

  return v4;
}

- (BOOL)haveAccount
{
  id v2 = [(SUScriptInterface *)self accountDSID];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)shouldRestrictContentOfSystem:(id)a3 level:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    uint64_t v7 = objc_alloc_init(SUItemContentRating);
    -[SUItemContentRating setRank:](v7, "setRank:", (int)[v6 intValue]);
    [(SUItemContentRating *)v7 setRatingSystem:+[SUItemContentRating ratingSystemFromString:v5]];
    BOOL v8 = [(SUItemContentRating *)v7 isRestricted];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)shouldShowAddToWalletLink:(id)a3
{
  BOOL v3 = (void *)ISWeakLinkedClassForString();

  return [v3 canMakePayments];
}

- (void)signupInWallet:(id)a3 callback:(id)a4
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v72[0] = MEMORY[0x263EF8330];
  v72[1] = 3221225472;
  v72[2] = __45__SUScriptInterface_signupInWallet_callback___block_invoke;
  v72[3] = &unk_2648123F8;
  id v8 = v7;
  id v73 = v8;
  objc_copyWeak(&v74, &location);
  id v9 = (void (**)(void, void, void))MEMORY[0x22A680AE0](v72);
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v6 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v8 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v16 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v17 = [v16 shouldLog];
    int v18 = [v16 shouldLogToDisk];
    uint64_t v19 = [v16 OSLogObject];
    id v20 = v19;
    if (v18) {
      v17 |= 2u;
    }
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      v17 &= 2u;
    }
    if (v17)
    {
      id v21 = objc_opt_class();
      int v76 = 138543362;
      id v77 = v21;
      id v22 = v21;
      LODWORD(v67) = 12;
      id v23 = (void *)_os_log_send_and_compose_impl();

      if (!v23) {
        goto LABEL_21;
      }
      id v20 = objc_msgSend(NSString, "stringWithCString:encoding:", v23, 4, &v76, v67);
      free(v23);
      SSFileLog();
    }

    goto LABEL_21;
  }
  if ([MEMORY[0x263F89460] shouldUseUpsellEnrollment])
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
    char v11 = objc_msgSend(v10, "ams_isActiveAccountCombined");

    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v12 = [MEMORY[0x263F7B1F8] sharedConfig];
        int v39 = [v12 shouldLog];
        int v40 = [v12 shouldLogToDisk];
        int v41 = [v12 OSLogObject];
        id v14 = v41;
        if (v40) {
          v39 |= 2u;
        }
        if (!os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT)) {
          v39 &= 2u;
        }
        if (v39)
        {
          int v42 = objc_opt_class();
          int v76 = 138543362;
          id v77 = v42;
          id v43 = v42;
          LODWORD(v67) = 12;
          id v15 = (void *)_os_log_send_and_compose_impl();

          if (!v15) {
            goto LABEL_61;
          }
          objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v76, v67);
          id v14 = (id)objc_claimAutoreleasedReturnValue();
          free(v15);
          SSFileLog();
        }
        goto LABEL_59;
      }
      id v12 = v6;
      id v13 = [(SUScriptInterface *)self copyJavaScriptContext];
      id v14 = (id)[v12 copyArrayOrDictionaryWithContext:v13];
      JSGlobalContextRelease(v13);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = v14;
        id v15 = v14;
LABEL_60:

LABEL_61:
        id v55 = [v15 objectForKeyedSubscript:@"referrerIdentifier"];
        if (v55)
        {
LABEL_74:
          id v70 = v55;
          id v71 = v9;
          WebThreadRunOnMainThread();

          goto LABEL_75;
        }
        v56 = [MEMORY[0x263F7B1F8] sharedConfig];
        int v57 = [v56 shouldLog];
        int v58 = [v56 shouldLogToDisk];
        v69 = v56;
        int v59 = [v56 OSLogObject];
        v60 = v59;
        if (v58) {
          int v61 = v57 | 2;
        }
        else {
          int v61 = v57;
        }
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT)) {
          int v62 = v61;
        }
        else {
          int v62 = v61 & 2;
        }
        if (v62)
        {
          id v63 = objc_opt_class();
          int v76 = 138543362;
          id v77 = v63;
          id v64 = v63;
          LODWORD(v67) = 12;
          v65 = (void *)_os_log_send_and_compose_impl();

          int v66 = v69;
          if (!v65)
          {
LABEL_73:

            goto LABEL_74;
          }
          v60 = objc_msgSend(NSString, "stringWithCString:encoding:", v65, 4, &v76, v67);
          free(v65);
          SSFileLog();
        }
        else
        {
          int v66 = v69;
        }

        goto LABEL_73;
      }
      id v44 = [MEMORY[0x263F7B1F8] sharedConfig];
      int v45 = [v44 shouldLog];
      int v46 = [v44 shouldLogToDisk];
      id v68 = v44;
      uint64_t v47 = [v44 OSLogObject];
      int v48 = v47;
      if (v46) {
        int v49 = v45 | 2;
      }
      else {
        int v49 = v45;
      }
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT)) {
        int v50 = v49;
      }
      else {
        int v50 = v49 & 2;
      }
      if (v50)
      {
        int v51 = objc_opt_class();
        int v76 = 138543362;
        id v77 = v51;
        id v52 = v51;
        LODWORD(v67) = 12;
        uint64_t v53 = (void *)_os_log_send_and_compose_impl();

        uint64_t v54 = v68;
        if (!v53)
        {
LABEL_58:

LABEL_59:
          id v15 = 0;
          goto LABEL_60;
        }
        int v48 = objc_msgSend(NSString, "stringWithCString:encoding:", v53, 4, &v76, v67);
        free(v53);
        SSFileLog();
      }
      else
      {
        uint64_t v54 = v68;
      }

      goto LABEL_58;
    }
    uint64_t v31 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v32 = [v31 shouldLog];
    int v33 = [v31 shouldLogToDisk];
    int v34 = [v31 OSLogObject];
    int v35 = v34;
    if (v33) {
      v32 |= 2u;
    }
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      v32 &= 2u;
    }
    if (v32)
    {
      id v36 = objc_opt_class();
      int v76 = 138543362;
      id v77 = v36;
      id v37 = v36;
      LODWORD(v67) = 12;
      uint64_t v38 = (void *)_os_log_send_and_compose_impl();

      if (!v38)
      {
LABEL_39:

        id v15 = ISError();
        ((void (**)(void, void, void *))v9)[2](v9, 0, v15);
        goto LABEL_75;
      }
      int v35 = objc_msgSend(NSString, "stringWithCString:encoding:", v38, 4, &v76, v67);
      free(v38);
      SSFileLog();
    }

    goto LABEL_39;
  }
  uint64_t v16 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v24 = [v16 shouldLog];
  int v25 = [v16 shouldLogToDisk];
  id v26 = [v16 OSLogObject];
  __int16 v27 = v26;
  if (v25) {
    v24 |= 2u;
  }
  if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    v24 &= 2u;
  }
  if (!v24) {
    goto LABEL_29;
  }
  id v28 = objc_opt_class();
  int v76 = 138543362;
  id v77 = v28;
  id v29 = v28;
  LODWORD(v67) = 12;
  BOOL v30 = (void *)_os_log_send_and_compose_impl();

  if (v30)
  {
    __int16 v27 = objc_msgSend(NSString, "stringWithCString:encoding:", v30, 4, &v76, v67);
    free(v30);
    SSFileLog();
LABEL_29:
  }
LABEL_21:

  [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  id v15 = ISError();
  ((void (**)(void, void, void *))v9)[2](v9, 0, v15);
LABEL_75:

  objc_destroyWeak(&v74);
  objc_destroyWeak(&location);
}

void __45__SUScriptInterface_signupInWallet_callback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v14[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [[SUScriptFunction alloc] initWithScriptObject:*(void *)(a1 + 32)];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [(SUScriptFunction *)v7 setThisObject:WeakRetained];

  if (v6)
  {
    id v9 = [[SUScriptError alloc] initWithError:v6];
    uint64_t v10 = [MEMORY[0x263F1FA98] undefined];
    v14[0] = v10;
    v14[1] = v9;
    char v11 = v14;
  }
  else
  {
    id v9 = [[SUScriptDictionary alloc] initWithDictionary:v5];
    v13[0] = v9;
    uint64_t v10 = [MEMORY[0x263F1FA98] undefined];
    v13[1] = v10;
    char v11 = v13;
  }
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
  [(SUScriptFunction *)v7 callWithArguments:v12];

  [(SUScriptFunction *)v7 setThisObject:0];
}

void __45__SUScriptInterface_signupInWallet_callback___block_invoke_408(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) parentViewController];
  BOOL v3 = [[SUCardEnrollmentUpsellOperation alloc] initWithViewController:v2];
  objc_initWeak(&location, v3);
  [(SUCardEnrollmentUpsellOperation *)v3 setReferrerIdentifier:*(void *)(a1 + 40)];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45__SUScriptInterface_signupInWallet_callback___block_invoke_2;
  v5[3] = &unk_264812628;
  objc_copyWeak(&v7, &location);
  id v6 = *(id *)(a1 + 48);
  [(SUCardEnrollmentUpsellOperation *)v3 setCompletionBlock:v5];
  uint64_t v4 = [MEMORY[0x263F894E0] mainQueue];
  [v4 addOperation:v3];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __45__SUScriptInterface_signupInWallet_callback___block_invoke_2(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = [WeakRetained didSucceed];

  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = @"success";
  id v5 = [NSNumber numberWithBool:v3];
  v8[0] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v6, 0);
}

- (id)systemVersion
{
  id v2 = [MEMORY[0x263F7B148] currentDevice];
  uint64_t v3 = [v2 productVersion];

  return v3;
}

- (BOOL)checkCapabilitiesPropertyListString:(id)a3 showFailureDialog:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(SUScriptInterface *)self device];
  id v8 = [v7 checkCapabilitiesPropertyListString:v6 showFailureDialog:v4];

  LOBYTE(v6) = [v8 BOOLValue];
  return (char)v6;
}

- (id)activeNetworkType
{
  id v2 = NSNumber;
  uint64_t v3 = [(SUScriptInterface *)self device];
  BOOL v4 = objc_msgSend(v2, "numberWithInteger:", objc_msgSend(v3, "activeNetworkType"));

  return v4;
}

- (BOOL)arePodcastsDisabled
{
  id v2 = [(SUScriptInterface *)self device];
  uint64_t v3 = [v2 capabilityNamePodcasts];
  BOOL v4 = [v2 hasCapability:v3];
  char v5 = [v4 BOOLValue] ^ 1;

  return v5;
}

- (BOOL)canSendEmail
{
  id v2 = [(SUScriptInterface *)self device];
  uint64_t v3 = [v2 capabilityNameEmail];
  BOOL v4 = [v2 hasCapability:v3];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (id)diskSpaceAvailable
{
  id v2 = [(SUScriptInterface *)self device];
  uint64_t v3 = [v2 diskSpaceAvailable];

  return v3;
}

- (id)hardwareType
{
  id v2 = NSNumber;
  uint64_t v3 = [(SUScriptInterface *)self device];
  BOOL v4 = objc_msgSend(v2, "numberWithInteger:", objc_msgSend(v3, "hardwareType"));

  return v4;
}

- (BOOL)isExplicitContentDisabled
{
  id v2 = [(SUScriptInterface *)self device];
  uint64_t v3 = [v2 capabilityNameExplicitMedia];
  BOOL v4 = [v2 hasCapability:v3];
  char v5 = [v4 BOOLValue] ^ 1;

  return v5;
}

- (void)showAlertWithMessage:(id)a3 title:(id)a4 buttonTitle:(id)a5
{
  id v7 = [(SUScriptInterface *)self _copyDialogWithMessage:a3 title:a4 cancelButtonTitle:0 okButtonTitle:a5];
  id v6 = [[SUScriptModalDialog alloc] initWithDialog:v7];
  [(SUScriptModalDialog *)v6 setDelegate:self];
}

- (BOOL)showConfirmWithMessage:(id)a3 title:(id)a4 okButtonTitle:(id)a5 cancelButtonTitle:(id)a6
{
  if (a6)
  {
    id v10 = a5;
    id v11 = a4;
    id v12 = a3;
    id v13 = [(SUScriptInterface *)self _copyDialogWithMessage:v12 title:v11 cancelButtonTitle:a6 okButtonTitle:v10];
  }
  else
  {
    id v14 = (void *)MEMORY[0x263F086E0];
    id v15 = a5;
    id v16 = a4;
    id v10 = a3;
    id v12 = [v14 bundleForClass:objc_opt_class()];
    id v11 = [v12 localizedStringForKey:@"CANCEL" value:&stru_26DB8C5F8 table:0];
    id v13 = [(SUScriptInterface *)self _copyDialogWithMessage:v10 title:v16 cancelButtonTitle:v11 okButtonTitle:v15];
  }
  int v17 = [[SUScriptModalDialog alloc] initWithDialog:v13];
  [(SUScriptModalDialog *)v17 setDelegate:self];
  id v18 = [(SUScriptModalDialog *)v17 copyResponseByRunningModal];
  BOOL v19 = [v18 buttonIndex] == 1;

  return v19;
}

- (id)showPromptWithMessage:(id)a3 initialValue:(id)a4 title:(id)a5 okButtonTitle:(id)a6 cancelButtonTitle:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v16)
  {
    id v17 = [(SUScriptInterface *)self _copyDialogWithMessage:v12 title:v14 cancelButtonTitle:v16 okButtonTitle:v15];
  }
  else
  {
    id v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v19 = [v18 localizedStringForKey:@"CANCEL" value:&stru_26DB8C5F8 table:0];
    id v17 = [(SUScriptInterface *)self _copyDialogWithMessage:v12 title:v14 cancelButtonTitle:v19 okButtonTitle:v15];
  }
  id v20 = [MEMORY[0x263F894A0] textFieldWithTitle:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v20 setValue:v13];
  }
  id v21 = [MEMORY[0x263EFF8C0] arrayWithObject:v20];
  [v17 setTextFields:v21];

  id v22 = [[SUScriptModalDialog alloc] initWithDialog:v17];
  [(SUScriptModalDialog *)v22 setDelegate:self];
  id v23 = [(SUScriptModalDialog *)v22 copyResponseByRunningModal];
  if ([v23 buttonIndex] == 1)
  {
    int v24 = [v23 textFieldValue];
  }
  else
  {
    int v24 = 0;
  }

  return v24;
}

- (void)_globalEventNotification:(id)a3
{
  id v8 = a3;
  BOOL v4 = [v8 object];

  if (v4 != self)
  {
    char v5 = [v8 userInfo];
    id v6 = [v5 objectForKey:@"payload"];
    id v7 = [v5 objectForKey:@"name"];
    [(SUScriptObject *)self dispatchEvent:v6 forName:v7];
  }
}

- (void)_scriptUserInfoDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v6 = [(SUScriptInterface *)self parentViewController];
  char v5 = [v4 object];

  LODWORD(v4) = [v6 isDescendantOfViewController:v5];
  if (v4) {
    [(SUScriptObject *)self dispatchEvent:0 forName:@"userinfochange"];
  }
}

- (void)safariViewController:(id)a3 didCompleteInitialLoad:(BOOL)a4
{
  id v4 = objc_msgSend(MEMORY[0x263F7B1F8], "sharedConfig", a3, a4);
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  id v7 = [v4 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
    int v8 = v6;
  }
  else {
    int v8 = v6 & 2;
  }
  if (!v8) {
    goto LABEL_10;
  }
  v11[0] = 0;
  LODWORD(v1UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0) = 2;
  id v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    id v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, v11, v10);
    free(v9);
    SSFileLog();
LABEL_10:
  }
}

- (void)safariViewControllerDidFinish:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x263F7B1F8], "sharedConfig", a3);
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  id v7 = [v4 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
    int v8 = v6;
  }
  else {
    int v8 = v6 & 2;
  }
  if (!v8) {
    goto LABEL_10;
  }
  v11[0] = 0;
  LODWORD(v1UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0) = 2;
  id v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    id v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, v11, v10);
    free(v9);
    SSFileLog();
LABEL_10:
  }
  [(SUScriptInterface *)self _cleanUpSafariViewController];
}

- (id)_cookieForURL:(id)a3
{
  id v4 = a3;
  int v5 = [(SUScriptInterface *)self authenticationContext];
  int v6 = [v5 requiredUniqueIdentifier];

  if (!v6) {
    goto LABEL_3;
  }
  id v7 = [MEMORY[0x263F7B0E8] defaultStore];
  int v8 = [(SUScriptInterface *)self authenticationContext];
  id v9 = [v8 requiredUniqueIdentifier];
  uint64_t v10 = [(SUScriptInterface *)self authenticationContext];
  id v11 = objc_msgSend(v7, "accountWithUniqueIdentifier:scope:", v9, objc_msgSend(v10, "accountScope"));

  if (!v11)
  {
LABEL_3:
    id v12 = [MEMORY[0x263F7B0E8] defaultStore];
    id v11 = [v12 activeAccount];
  }
  id v13 = [MEMORY[0x263F7B380] sharedStorage];
  id v14 = [v11 uniqueIdentifier];
  id v15 = [v13 cookieHeadersForURL:v4 userIdentifier:v14];

  id v16 = [v15 objectForKey:@"Cookie"];

  return v16;
}

- (id)_copyDialogWithMessage:(id)a3 title:(id)a4 cancelButtonTitle:(id)a5 okButtonTitle:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc_init(MEMORY[0x263F89488]);
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v16 = [v15 localizedStringForKey:@"CANCEL" value:&stru_26DB8C5F8 table:0];

      id v12 = (id)v16;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v18 = [v17 localizedStringForKey:@"OK" value:&stru_26DB8C5F8 table:0];

    id v13 = (id)v18;
  }
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v19 = [(SUScriptInterface *)self webFrame];
      id v20 = [v19 dataSource];
      id v21 = [v20 request];
      id v22 = [v21 URL];
      uint64_t v23 = +[SUScriptModalDialog titleForURL:v22];

      id v11 = (id)v23;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v24 = [v10 stringRepresentation];

    id v10 = (id)v24;
  }
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v25 = [v10 description];

      id v10 = (id)v25;
    }
  }
  id v26 = v14;
  id v27 = v10;
  if (v11)
  {
    [v14 setMessage:v10];
    id v26 = v14;
    id v27 = v11;
  }
  [v26 setTitle:v27];
  id v28 = (void *)MEMORY[0x263EFF8C0];
  if (v12)
  {
    id v29 = [MEMORY[0x263F89490] buttonWithTitle:v12];
    BOOL v30 = [MEMORY[0x263F89490] buttonWithTitle:v13];
    uint64_t v31 = objc_msgSend(v28, "arrayWithObjects:", v29, v30, 0);
    [v14 setButtons:v31];
  }
  else
  {
    id v29 = [MEMORY[0x263F89490] buttonWithTitle:v13];
    BOOL v30 = objc_msgSend(v28, "arrayWithObjects:", v29, 0);
    [v14 setButtons:v30];
  }

  return v14;
}

- (void)_presentSafariViewControllerWithURL:(id)a3 safariIdentifier:(id)a4 animated:(BOOL)a5
{
  v16[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  [(SUScriptInterface *)self setSafariViewControllerIdentifier:a4];
  id v9 = [MEMORY[0x263F1C408] sharedApplication];
  uint64_t v15 = *MEMORY[0x263F1D090];
  v16[0] = MEMORY[0x263EFFA88];
  id v10 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = __83__SUScriptInterface__presentSafariViewControllerWithURL_safariIdentifier_animated___block_invoke;
  v12[3] = &unk_264812678;
  v12[4] = self;
  id v13 = v8;
  BOOL v14 = a5;
  id v11 = v8;
  [v9 openURL:v11 options:v10 completionHandler:v12];
}

void __83__SUScriptInterface__presentSafariViewControllerWithURL_safariIdentifier_animated___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v14 = [*(id *)(a1 + 32) clientInterface];
    id v4 = [v14 delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = [*(id *)(a1 + 32) parentViewController];
      [v4 clientInterface:v14 presentSafariViewControllerWithURL:v5 fromViewController:v6 animated:*(unsigned __int8 *)(a1 + 48) completion:0];
    }
    else
    {
      id v7 = (objc_class *)ISWeakLinkedClassForString();
      id v8 = *(void **)(a1 + 32);
      id v9 = (void *)[[v7 alloc] initWithURL:*(void *)(a1 + 40)];
      [v8 setSafariViewController:v9];

      id v10 = [*(id *)(a1 + 32) safariViewController];
      [v10 setDelegate:*(void *)(a1 + 32)];

      id v11 = [*(id *)(a1 + 32) safariViewController];
      [v11 setModalPresentationStyle:16];

      id v12 = [*(id *)(a1 + 32) safariViewController];
      objc_msgSend(v12, "setDismissButtonStyle:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 264), "integerValue"));

      int v6 = [*(id *)(a1 + 32) parentViewController];
      id v13 = [*(id *)(a1 + 32) safariViewController];
      [v6 presentViewController:v13 animated:*(unsigned __int8 *)(a1 + 48) completion:0];
    }
  }
}

- (void)_dismissSafariViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  int v6 = (void (**)(void))a4;
  id v7 = [(SUScriptInterface *)self clientInterface];
  id v8 = [v7 delegate];
  if (objc_opt_respondsToSelector())
  {
    id v9 = [(SUScriptInterface *)self parentViewController];
    [v8 clientInterface:v7 dismissSafariViewControllerAnimated:v4 fromViewController:v9 completion:v6];
  }
  else
  {
    id v10 = [(SUScriptInterface *)self safariViewController];

    if (v10)
    {
      id v11 = [(SUScriptInterface *)self safariViewController];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      void v12[2] = __69__SUScriptInterface__dismissSafariViewControllerAnimated_completion___block_invoke;
      v12[3] = &unk_264812420;
      v12[4] = self;
      id v13 = v6;
      [v11 dismissViewControllerAnimated:v4 completion:v12];
    }
    else
    {
      [(SUScriptInterface *)self _cleanUpSafariViewController];
      if (v6) {
        v6[2](v6);
      }
    }
  }
}

uint64_t __69__SUScriptInterface__dismissSafariViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _cleanUpSafariViewController];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_cleanUpSafariViewController
{
  [(SUScriptInterface *)self setSafariViewController:0];

  [(SUScriptInterface *)self setSafariViewControllerIdentifier:0];
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(id)__KeyMapping_2 objectForKey:v4];
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptInterface;
    uint64_t v5 = objc_msgSendSuper2(&v7, sel_webScriptNameForKeyName_, v4);
  }

  return v5;
}

- (BOOL)scriptXMLHTTPRequest:(id)a3 requiresCellularForURL:(id)a4
{
  id v5 = a4;
  [(NSLock *)self->super._lock lock];
  requireCellularURLs = self->_requireCellularURLs;
  if (requireCellularURLs) {
    char v7 = [(NSMutableSet *)requireCellularURLs containsObject:v5];
  }
  else {
    char v7 = 0;
  }
  [(NSLock *)self->super._lock unlock];

  return v7;
}

- (BOOL)scriptXMLHTTPStoreRequest:(id)a3 requiresCellularForURL:(id)a4
{
  id v5 = a4;
  [(NSLock *)self->super._lock lock];
  requireCellularURLs = self->_requireCellularURLs;
  if (requireCellularURLs) {
    char v7 = [(NSMutableSet *)requireCellularURLs containsObject:v5];
  }
  else {
    char v7 = 0;
  }
  [(NSLock *)self->super._lock unlock];

  return v7;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id v5 = SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_0, 141);
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptInterface;
    id v5 = objc_msgSendSuper2(&v7, sel_webScriptNameForSelector_, a3);
  }

  return v5;
}

- (id)scriptAttributeKeys
{
  v5.receiver = self;
  v5.super_class = (Class)SUScriptInterface;
  uint64_t v2 = [(SUScriptObject *)&v5 scriptAttributeKeys];
  uint64_t v3 = [(id)__KeyMapping_2 allKeys];
  [v2 addObjectsFromArray:v3];

  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_0 = (uint64_t)sel_accessibilityPostLayoutChange;
    *(void *)algn_2681B3C98 = @"accessibilityPostLayoutChange";
    qword_2681B3CA0 = (uint64_t)sel_accessibilityPostScreenChange;
    unk_2681B3CA8 = @"accessibilityPostScreenChange";
    qword_2681B3CB0 = (uint64_t)sel_accountDSID;
    unk_2681B3CB8 = @"dsid";
    qword_2681B3CC0 = (uint64_t)sel_accountForDSID_;
    unk_2681B3CC8 = @"accountForDSID";
    qword_2681B3CD0 = (uint64_t)sel_accountName;
    unk_2681B3CD8 = @"accountName";
    qword_2681B3CE0 = (uint64_t)sel_activeNetworkType;
    unk_2681B3CE8 = @"activeNetworkType";
    qword_2681B3CF0 = (uint64_t)sel_addExternalDownloads_options_;
    unk_2681B3CF8 = @"addExternalDownloads";
    qword_2681B3D00 = (uint64_t)sel_addExternalDownloadsFromManifestURL_;
    unk_2681B3D08 = @"addExternalDownloadsFromURL";
    qword_2681B3D10 = (uint64_t)sel_authorizeApplePayEnrollmentWithParameters_callback_;
    unk_2681B3D18 = @"authorizeApplePayEnrollmentWithParameters";
    qword_2681B3D20 = (uint64_t)sel_addiTunesPassWithCompletionFunction_;
    unk_2681B3D28 = @"addiTunesPass";
    qword_2681B3D30 = (uint64_t)sel_addPurchaseWithInfo_options_;
    unk_2681B3D38 = @"buyAction";
    qword_2681B3D40 = (uint64_t)sel_acknowledgePrivacyLinkWithIdentifier_;
    unk_2681B3D48 = @"acknowledgePrivacyLink";
    qword_2681B3D50 = (uint64_t)sel_arePodcastsDisabled;
    unk_2681B3D58 = @"disablePodcasts";
    qword_2681B3D60 = (uint64_t)sel_approveInPerson_completionFunction_;
    unk_2681B3D68 = @"approveInPerson";
    qword_2681B3D70 = (uint64_t)sel_authenticateForAccount_withOptions_;
    unk_2681B3D78 = @"authenticateForAccount";
    qword_2681B3D80 = (uint64_t)sel_authenticateAppleIdWithUsername_password_callback_;
    unk_2681B3D88 = @"authenticateAppleIdWithCredentials";
    qword_2681B3D90 = (uint64_t)sel_canSendEmail;
    unk_2681B3D98 = @"canSendEmail";
    qword_2681B3DA0 = (uint64_t)sel_checkCapabilitiesPropertyListString_showFailureDialog_;
    unk_2681B3DA8 = @"checkCapabilities";
    qword_2681B3DB0 = (uint64_t)sel_composeEmailWithSubject_body_;
    unk_2681B3DB8 = @"composeEmail";
    qword_2681B3DC0 = (uint64_t)sel_composeReviewWithURL_itemIdentifier_type_;
    unk_2681B3DC8 = @"composeReview";
    qword_2681B3DD0 = (uint64_t)sel_currentAttestationVersion;
    unk_2681B3DD8 = @"getCurrentAttestationVersion";
    qword_2681B3DE0 = (uint64_t)sel_dialogDisplayCountForKey_;
    unk_2681B3DE8 = @"getDialogDisplayCountForKey";
    qword_2681B3DF0 = (uint64_t)sel_diskSpaceAvailable;
    unk_2681B3DF8 = @"diskSpaceAvailable";
    qword_2681B3E00 = (uint64_t)sel_dismissSafariViewControllerAnimated_;
    unk_2681B3E08 = @"dismissSafariViewController";
    qword_2681B3E10 = (uint64_t)sel_dismissSheet;
    unk_2681B3E18 = @"dismissSheet";
    qword_2681B3E20 = (uint64_t)sel_dismissWindowsWithOptions_;
    unk_2681B3E28 = @"dismissAllWindows";
    qword_2681B3E30 = (uint64_t)sel_dispatchGlobalEventWithName_payload_;
    unk_2681B3E38 = @"dispatchGlobalEvent";
    qword_2681B3E40 = (uint64_t)sel_dispatchXEvent_;
    unk_2681B3E48 = @"dispatchXEvent";
    qword_2681B3E50 = (uint64_t)sel_fetchAppleCardMetadata_callback_;
    unk_2681B3E58 = @"fetchAppleCardMetadata";
    qword_2681B3E60 = (uint64_t)sel_fetchWalletCardData_;
    unk_2681B3E68 = @"fetchWalletCardData";
    qword_2681B3E70 = (uint64_t)sel_fetchWalletCardMetadata_callback_;
    unk_2681B3E78 = @"fetchWalletCardMetadata";
    qword_2681B3E80 = (uint64_t)sel_finishedTest_extraResults_;
    unk_2681B3E88 = @"finishedTest";
    qword_2681B3E90 = (uint64_t)sel_financeInterruptionResolved_;
    qword_2681B3E98 = @"financeInterruptionResolved";
    qword_2681B3EA0 = (uint64_t)sel_getAudioPlayerForURL_keyURL_certificateURL_;
    qword_2681B3EA8 = @"getAudioPlayer";
    qword_2681B3EB0 = (uint64_t)sel_getInstalledSoftwareApplicationsWithCompletionFunction_;
    qword_2681B3EB8 = @"getSoftwareApplications";
    qword_2681B3EC0 = (uint64_t)sel_getDownloadQueueWithQueueType_;
    qword_2681B3EC8 = @"getDownloadQueue";
    qword_2681B3ED0 = (uint64_t)sel_getiTunesPass;
    qword_2681B3ED8 = @"getiTunesPass";
    qword_2681B3EE0 = (uint64_t)sel_getSoftwareApplicationWithAdamID_completionFunction_;
    qword_2681B3EE8 = @"getSoftwareApplicationWithAdamID";
    qword_2681B3EF0 = (uint64_t)sel_getSoftwareApplicationWithBundleID_completionFunction_;
    qword_2681B3EF8 = @"getSoftwareApplicationWithBundleID";
    qword_2681B3F00 = (uint64_t)sel_goBack;
    qword_2681B3F08 = @"goBack";
    qword_2681B3F10 = (uint64_t)sel_gotoStoreURL_;
    qword_2681B3F18 = @"gotoURL";
    qword_2681B3F20 = (uint64_t)sel_gotoStoreURL_ofType_withAuthentication_forceAuthentication_;
    qword_2681B3F28 = @"gotoURLOfType";
    qword_2681B3F30 = (uint64_t)sel_handleDialogPropertyListString_;
    qword_2681B3F38 = @"createDialogDict";
    qword_2681B3F40 = (uint64_t)sel_handleProtocolPropertyListString_;
    qword_2681B3F48 = @"addProtocol";
    qword_2681B3F50 = (uint64_t)sel_handleRootObjectWithPropertyListString_;
    qword_2681B3F58 = @"addRootObject";
    qword_2681B3F60 = (uint64_t)sel_handleTrackListWithPropertyListString_;
    qword_2681B3F68 = @"createTracklist";
    qword_2681B3F70 = (uint64_t)sel_hardwareType;
    qword_2681B3F78 = @"hardwareType";
    qword_2681B3F80 = (uint64_t)sel_haveAccount;
    qword_2681B3F88 = @"isAccountPresent";
    qword_2681B3F90 = (uint64_t)sel_isExplicitContentDisabled;
    qword_2681B3F98 = @"disableExplicit";
    qword_2681B3FA0 = (uint64_t)sel_isRunningTest;
    qword_2681B3FA8 = @"isRunningTest";
    qword_2681B3FB0 = (uint64_t)sel_launchedToTest;
    qword_2681B3FB8 = @"launchedToTest";
    qword_2681B3FC0 = (uint64_t)sel_log_;
    qword_2681B3FC8 = @"log";
    qword_2681B3FD0 = (uint64_t)sel_machineGUID;
    qword_2681B3FD8 = @"getMachineGUID";
    qword_2681B3FE0 = (uint64_t)sel_makeAccount;
    qword_2681B3FE8 = @"createAccount";
    qword_2681B3FF0 = (uint64_t)sel_makeAccountPageWithURLs_;
    qword_2681B3FF8 = @"createAccountPage";
    qword_2681B4000 = (uint64_t)sel_makeActivity;
    qword_2681B4008 = @"createActivity";
    qword_2681B4010 = (uint64_t)sel_makeActivityItemProviderWithMIMEType_;
    qword_2681B4018 = @"createActivityItemProvider";
    qword_2681B4020 = (uint64_t)sel_makeActivityViewControllerWithProviders_activities_;
    qword_2681B4028 = @"createActivityViewController";
    qword_2681B4030 = (uint64_t)sel_makeAMSViewController;
    qword_2681B4038 = @"makeAMSViewController";
    qword_2681B4040 = (uint64_t)sel_makeButtonWithSystemItemString_action_;
    qword_2681B4048 = @"createSystemButton";
    qword_2681B4050 = (uint64_t)sel_makeButtonWithTitle_action_;
    qword_2681B4058 = @"createButton";
    qword_2681B4060 = (uint64_t)sel_makeCalloutView;
    qword_2681B4068 = @"createCalloutView";
    qword_2681B4070 = (uint64_t)sel_makeCanvasWithWidth_height_;
    qword_2681B4078 = @"createCanvas";
    qword_2681B4080 = (uint64_t)sel_makeColorWithHue_saturation_brightness_alpha_;
    qword_2681B4088 = @"createHSBAColor";
    qword_2681B4090 = (uint64_t)sel_makeColorWithRed_green_blue_alpha_;
    qword_2681B4098 = @"createRGBAColor";
    qword_2681B40A0 = (uint64_t)sel_makeColorWithWhite_alpha_;
    qword_2681B40A8 = @"createWhiteColor";
    qword_2681B40B0 = (uint64_t)sel_makeComposeReviewViewControllerWithReview_;
    qword_2681B40B8 = @"createComposeReviewController";
    qword_2681B40C0 = (uint64_t)sel_makeDateFormatter;
    qword_2681B40C8 = @"createDateFormatter";
    qword_2681B40D0 = (uint64_t)sel_makeDialog;
    qword_2681B40D8 = @"createDialog";
    qword_2681B40E0 = (uint64_t)sel_makeDocumentInteractionController;
    qword_2681B40E8 = @"createDocumentInteractionController";
    qword_2681B40F0 = (uint64_t)sel_makeDonationViewControllerWithCharityIdentifier_;
    qword_2681B40F8 = @"createDonationViewController";
    qword_2681B4100 = (uint64_t)sel_makeFacebookRequestWithURL_requestMethod_;
    qword_2681B4108 = @"createFacebookRequest";
    qword_2681B4110 = (uint64_t)sel_makeFacebookSessionWithAccount_;
    qword_2681B4118 = @"createFacebookSession";
    qword_2681B4120 = (uint64_t)sel_makeFamilySetupViewController;
    qword_2681B4128 = @"createFamilySetupViewController";
    qword_2681B4130 = (uint64_t)sel_makeGiftViewController;
    qword_2681B4138 = @"createGiftViewController";
    qword_2681B4140 = (uint64_t)sel_makeLinearGradientWithX0_y0_x1_y1_;
    qword_2681B4148 = @"createLinearGradient";
    qword_2681B4150 = (uint64_t)sel_makeLookupRequest;
    qword_2681B4158 = @"createLookupRequest";
    qword_2681B4160 = (uint64_t)sel_makeMediaPlayerItemWithProperties_;
    qword_2681B4168 = @"createMediaPlayerItem";
    qword_2681B4170 = (uint64_t)sel_makeMediaPlayerViewControllerWithMediaPlayerItem_;
    qword_2681B4178 = @"createMediaPlayer";
    qword_2681B4180 = (uint64_t)sel_makeMenuViewController;
    qword_2681B4188 = @"createMenuViewController";
    qword_2681B4190 = (uint64_t)sel_makeNavigationControllerWithRootViewController_;
    qword_2681B4198 = @"createNavigationController";
    qword_2681B41A0 = (uint64_t)sel_makeNumberFormatterWithStyle_;
    qword_2681B41A8 = @"createNumberFormatter";
    qword_2681B41B0 = (uint64_t)sel_makePopOverWithViewController_;
    qword_2681B41B8 = @"createPopOver";
    qword_2681B41C0 = (uint64_t)sel_makeRadialGradientWithX0_y0_r0_x1_y1_r1_;
    qword_2681B41C8 = @"createRadialGradient";
    qword_2681B41D0 = (uint64_t)sel_makeRedeemCameraViewController;
    qword_2681B41D8 = @"createRedeemCamera";
    qword_2681B41E0 = (uint64_t)sel_makeRedeemViewController;
    qword_2681B41E8 = @"createRedeemViewController";
    qword_2681B41F0 = (uint64_t)sel_makeReportAProblemViewControllerWithAdamID_;
    qword_2681B41F8 = @"createReportAProblemViewController";
    qword_2681B4200 = (uint64_t)sel_makeReviewWithAdamID_;
    qword_2681B4208 = @"createReview";
    qword_2681B4210 = (uint64_t)sel_makeScriptActionWithType_;
    qword_2681B4218 = @"createAction";
    qword_2681B4220 = (uint64_t)sel_makeSegmentedControl;
    qword_2681B4228 = @"createSegmentedControl";
    qword_2681B4230 = (uint64_t)sel_makeSplitViewController;
    qword_2681B4238 = @"createSplitViewController";
    qword_2681B4240 = (uint64_t)sel_makeStorePageWithURLs_;
    qword_2681B4248 = @"createStorePage";
    qword_2681B4250 = (uint64_t)sel_makeStoreSheetViewController;
    qword_2681B4258 = @"createStoreSheetViewController";
    qword_2681B4260 = (uint64_t)sel_makeSubscriptionStatusRequest;
    qword_2681B4268 = @"createSubscriptionStatusRequest";
    qword_2681B4270 = (uint64_t)sel_makeTextFieldWithStyle_placeholder_value_width_;
    qword_2681B4278 = @"createTextField";
    qword_2681B4280 = (uint64_t)sel_makeTweetComposeViewController;
    qword_2681B4288 = @"createTweetComposeViewController";
    qword_2681B4290 = (uint64_t)sel_makeURLRequestWithURLs_timeoutInterval_;
    qword_2681B4298 = @"createURLRequest";
    qword_2681B42A0 = (uint64_t)sel_makeVolumeViewController;
    qword_2681B42A8 = @"createVolumeViewController";
    qword_2681B42B0 = (uint64_t)sel_makeXMLHTTPRequest;
    qword_2681B42B8 = @"createXHR";
    qword_2681B42C0 = (uint64_t)sel_makeXMLHTTPStoreRequest;
    qword_2681B42C8 = @"createStoreXHR";
    qword_2681B42D0 = (uint64_t)sel_makeWindow;
    qword_2681B42D8 = @"createWindow";
    qword_2681B42E0 = (uint64_t)sel_minimumAttestationVersionForAction_;
    qword_2681B42E8 = @"getMinimumAttestationVersion";
    qword_2681B42F0 = (uint64_t)sel_openCreditCardReaderWithCompletionFunction_;
    qword_2681B42F8 = @"openCreditCardReader";
    qword_2681B4300 = (uint64_t)sel_openFamilyCircleSetupWithClientName_completionFunction_;
    qword_2681B4308 = @"openFamilyCircleSetup";
    qword_2681B4310 = (uint64_t)sel_openURL_;
    qword_2681B4318 = @"openURL";
    qword_2681B4320 = (uint64_t)sel_openWallet;
    qword_2681B4328 = @"openWallet";
    qword_2681B4330 = (uint64_t)sel_paymentSetupFeatureSupported_callback_;
    qword_2681B4338 = @"paymentSetupFeatureSupported";
    qword_2681B4340 = (uint64_t)sel_perfLog_;
    qword_2681B4348 = @"perfLog";
    qword_2681B4350 = (uint64_t)sel_performPurchaseAnimationForIdentifier_style_;
    qword_2681B4358 = @"performPurchaseAnimation";
    qword_2681B4360 = (uint64_t)sel_pingURL_;
    qword_2681B4368 = @"pingURL";
    qword_2681B4370 = (uint64_t)sel_presentPrivacySplashWithIdentifier_;
    qword_2681B4378 = @"presentPrivacySplash";
    qword_2681B4380 = (uint64_t)sel_presentPrivacyViewControllerWithIdentifier_;
    qword_2681B4388 = @"presentPrivacyViewController";
    qword_2681B4390 = (uint64_t)sel_redeemCode_;
    qword_2681B4398 = @"redeemCode";
    qword_2681B43A0 = (uint64_t)sel_redeemCodes_params_completion_;
    qword_2681B43A8 = @"redeemCodes";
    qword_2681B43B0 = (uint64_t)sel_registerNavBarButtonWithTitle_side_function_;
    qword_2681B43B8 = @"registerNavigationButton";
    qword_2681B43C0 = (uint64_t)sel_reloadFooterSection_withURL_;
    qword_2681B43C8 = @"reloadFooterSection";
    qword_2681B43D0 = (uint64_t)sel_removeDeviceOfferWithIdentifier_account_;
    qword_2681B43D8 = @"removeDeviceOffer";
    qword_2681B43E0 = (uint64_t)sel_reportAProblemForIdentifier_;
    qword_2681B43E8 = @"openReportAProblemSheet";
    qword_2681B43F0 = (uint64_t)sel_requireCellularForResourceWithURL_;
    qword_2681B43F8 = @"requireCellular";
    qword_2681B4400 = (uint64_t)sel_retryAllRestoreDownloads;
    qword_2681B4408 = @"retryAllRestoreDownloads";
    qword_2681B4410 = (uint64_t)sel_selectSectionWithIdentifier_;
    qword_2681B4418 = @"selectFooterTab";
    qword_2681B4420 = (uint64_t)sel_selectTrackListItemWithIdentifier_;
    qword_2681B4428 = @"selectTrackWithItemId";
    qword_2681B4430 = (uint64_t)sel_sendPostOfType_withOptions_;
    qword_2681B4438 = @"sendPostOfType";
    qword_2681B4440 = (uint64_t)sel_setLibraryIdentifierWithType_value_;
    qword_2681B4448 = @"setLibraryIdentifier";
    qword_2681B4450 = (uint64_t)sel_shouldRestrictContentOfSystem_level_;
    qword_2681B4458 = @"restrictContentForSystemAndLevel";
    qword_2681B4460 = (uint64_t)sel_shouldShowAddToWalletLink_;
    qword_2681B4468 = @"shouldShowAddToWalletLink";
    qword_2681B4470 = (uint64_t)sel_shouldDisplayPrivacyLinkWithIdentifier_;
    qword_2681B4478 = @"shouldDisplayPrivacyLink";
    qword_2681B4480 = (uint64_t)sel_showAlertWithMessage_title_buttonTitle_;
    qword_2681B4488 = @"alert";
    qword_2681B4490 = (uint64_t)sel_showConfirmWithMessage_title_okButtonTitle_cancelButtonTitle_;
    qword_2681B4498 = @"confirm";
    qword_2681B44A0 = (uint64_t)sel_showMediaPlayerWithURLString_orientation_title_subtitle_bookmarkID_duration_type_imageURL_;
    qword_2681B44A8 = @"showMediaPlayer";
    qword_2681B44B0 = (uint64_t)sel_showMediaPreviewWithURLString_;
    qword_2681B44B8 = @"showMediaPreview";
    qword_2681B44C0 = (uint64_t)sel_showPromptWithMessage_initialValue_title_okButtonTitle_cancelButtonTitle_;
    qword_2681B44C8 = @"prompt";
    qword_2681B44D0 = (uint64_t)sel_showSafariViewControllerWithURLString_identifier_animated_;
    qword_2681B44D8 = @"showSafariViewController";
    qword_2681B44E0 = (uint64_t)sel_signOutPrimaryAccount;
    qword_2681B44E8 = @"signOutActiveAccount";
    qword_2681B44F0 = (uint64_t)sel_signupInWallet_callback_;
    qword_2681B44F8 = @"signupInWallet";
    qword_2681B4500 = (uint64_t)sel_softwareApplicationWithAdamID_;
    qword_2681B4508 = @"softwareApplicationWithAdamID";
    qword_2681B4510 = (uint64_t)sel_softwareApplicationWithBundleID_;
    qword_2681B4518 = @"softwareApplicationWithBundleID";
    qword_2681B4520 = (uint64_t)sel_startedTest_;
    qword_2681B4528 = @"startedTest";
    qword_2681B4530 = (uint64_t)sel_startListeningForAuthenticationTokenWithCallback_;
    qword_2681B4538 = @"startListeningForAuthenticationToken";
    qword_2681B4540 = (uint64_t)sel_stopListeningForAuthenticationToken;
    qword_2681B4548 = @"stopListeningForAuthenticationToken";
    qword_2681B4550 = (uint64_t)sel_systemVersion;
    qword_2681B4558 = @"systemVersion";
    __KeyMapping_2 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"accountCreationSecureContext", @"accounts", @"accounts", @"activeAudioPlayers", @"activeAudioPlayers", @"appleAccountStore", @"appleAccountStore", @"application", @"application", @"applicationAccessibilityEnabled", @"applicationAccessibilityEnabled", @"applicationLocalStorage", @"applicationLocalStorage", @"askToBuyPrompt", @"askToBuyPrompt", @"bag", @"scriptStoreBagDictionary",
                       @"carrierBundling",
                       @"carrierBundlingController",
                       @"clientIdentifier",
                       @"clientIdentifier",
                       @"cookie",
                       @"cookie",
                       @"cookieDefaultURL",
                       @"cookieDefaultURL",
                       @"cookieForDefaultURL",
                       @"cookieForDefaultURL",
                       @"creditCardReaderAvailable",
                       @"creditCardReaderAvailable",
                       @"currentAccount",
                       @"currentAccount",
                       @"device",
                       @"device",
                       @"deviceLocalStorage",
                       @"deviceLocalStorage",
                       @"deviceOffers",
                       @"deviceOffers",
                       @"deviceSerialNumber",
                       @"deviceSerialNumber",
                       @"globalRootObject",
                       @"globalRootObject",
                       @"gsToken",
                       @"gsToken",
                       @"installedSoftwareApplications",
                       @"installedSoftwareApplications",
                       @"isApplePayAvailable",
                       @"isApplePayAvailable",
                       @"isFinanceInterruption",
                       @"isFinanceInterruption",
                       @"isWalletAvailable",
                       @"isWalletAvailable",
                       @"loggingEnabled",
                       @"loggingEnabled",
                       @"mediaLibrary",
                       @"mediaLibrary",
                       @"metricsController",
                       @"metricsController",
                       @"navigationBar",
                       @"navigationBar",
                       @"navigationSimulator",
                       @"navigationSimulator");
    MEMORY[0x270F9A758]();
  }
}

- (NSString)safariViewControllerIdentifier
{
  return self->_safariViewControllerIdentifier;
}

- (void)setSafariViewControllerIdentifier:(id)a3
{
}

- (NSNumber)safariDismissButtonStyle
{
  return (NSNumber *)objc_getProperty(self, a2, 264, 1);
}

- (void)setSafariDismissButtonStyle:(id)a3
{
}

- (SFSafariViewController)safariViewController
{
  return self->_safariViewController;
}

- (void)setSafariViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_safariViewController, 0);
  objc_storeStrong((id *)&self->_safariDismissButtonStyle, 0);
  objc_storeStrong((id *)&self->_safariViewControllerIdentifier, 0);
  objc_storeStrong((id *)&self->_navigationSimulator, 0);
  objc_storeStrong((id *)&self->_hsaTokenQueue, 0);
  objc_storeStrong(&self->_threadSafeDelegate, 0);
  objc_storeStrong((id *)&self->_subscriptionStatusCoordinator, 0);
  objc_storeStrong((id *)&self->_scriptWindowContext, 0);
  objc_storeStrong((id *)&self->_scriptStoreBagLoader, 0);
  objc_storeStrong((id *)&self->_scriptOperationDelegate, 0);
  objc_storeStrong((id *)&self->_requireCellularURLs, 0);
  objc_storeStrong((id *)&self->_purchaseManager, 0);
  objc_storeStrong((id *)&self->_previewOverlay, 0);
  objc_storeStrong((id *)&self->_notificationObserver, 0);
  objc_storeStrong((id *)&self->_metricsController, 0);
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
  objc_storeStrong((id *)&self->_frame, 0);
  objc_storeStrong((id *)&self->_downloadQueues, 0);
  objc_storeStrong((id *)&self->_deviceLocalStorage, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_clientInterface, 0);
  objc_storeStrong((id *)&self->_carrierBundlingController, 0);
  objc_storeStrong((id *)&self->_authenticationContext, 0);
  objc_storeStrong((id *)&self->_applicationLocalStorage, 0);

  objc_storeStrong((id *)&self->_accountManager, 0);
}

- (id)redeemCameraAvailable
{
  BOOL v2 = +[SURedeemCameraViewController cameraSupported];
  uint64_t v3 = (void **)MEMORY[0x263EFFB40];
  if (!v2) {
    uint64_t v3 = (void **)MEMORY[0x263EFFB38];
  }
  id v4 = *v3;

  return v4;
}

- (id)makeRedeemCameraViewController
{
  uint64_t v3 = objc_alloc_init(SUScriptRedeemCameraViewController);
  [(SUScriptObject *)self checkInScriptObject:v3];

  return v3;
}

- (SUScriptDictionary)scriptStoreBagDictionary
{
  return (SUScriptDictionary *)[(SUScriptStoreBagLoader *)self->_scriptStoreBagLoader scriptStoreBagDictionary];
}

- (void)getInstalledSoftwareApplicationsWithCompletionFunction:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v5 = [[SUScriptFunction alloc] initWithScriptObject:a3];
    [(SUScriptFunction *)v5 setThisObject:self];
    id v6 = objc_alloc_init(MEMORY[0x263F894A8]);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    void v8[2] = __114__SUScriptInterface_SUScriptSoftwareApplicationAdditions__getInstalledSoftwareApplicationsWithCompletionFunction___block_invoke;
    v8[3] = &unk_264812158;
    v8[4] = self;
    v8[5] = v5;
    [v6 setCompletionBlock:v8];
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F894E0], "mainQueue"), "addOperation:", v6);
  }
  else
  {
    objc_super v7 = (void *)MEMORY[0x263F1FA90];
    [v7 throwException:@"Invalid argument"];
  }
}

void __114__SUScriptInterface_SUScriptSoftwareApplicationAdditions__getInstalledSoftwareApplicationsWithCompletionFunction___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F89518], "loadedMap"), "applications");
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [[SUScriptSoftwareApplication alloc] initWithApplication:*(void *)(*((void *)&v10 + 1) + 8 * v7)];
        if (v8)
        {
          id v9 = v8;
          [v2 addObject:v8];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  [*(id *)(a1 + 32) checkInScriptObjects:v2];
  objc_msgSend(*(id *)(a1 + 40), "callWithArguments:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", v2));
  [*(id *)(a1 + 40) setThisObject:0];
}

- (void)getSoftwareApplicationWithAdamID:(id)a3 completionFunction:(id)a4
{
  uint64_t v6 = SSGetUnsignedLongLongFromValue();
  uint64_t v7 = (void *)MEMORY[0x263F1FA90];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      void v8[2] = __111__SUScriptInterface_SUScriptSoftwareApplicationAdditions__getSoftwareApplicationWithAdamID_completionFunction___block_invoke;
      v8[3] = &__block_descriptor_40_e28___ISSoftwareApplication_8__0l;
      v8[4] = v6;
      [(SUScriptInterface *)self _getSoftwareApplicationWithCompletionFunction:a4 lookupBlock:v8];
      return;
    }
    uint64_t v7 = (void *)MEMORY[0x263F1FA90];
  }

  [v7 throwException:@"Invalid argument"];
}

uint64_t __111__SUScriptInterface_SUScriptSoftwareApplicationAdditions__getSoftwareApplicationWithAdamID_completionFunction___block_invoke(uint64_t a1)
{
  id v2 = (void *)[MEMORY[0x263F89518] loadedMap];
  uint64_t v3 = [NSNumber numberWithItemIdentifier:*(void *)(a1 + 32)];

  return [v2 applicationForItemIdentifier:v3];
}

- (void)getSoftwareApplicationWithBundleID:(id)a3 completionFunction:(id)a4
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v8 = (void *)MEMORY[0x263F1FA90];
  if (isKindOfClass)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      void v9[2] = __113__SUScriptInterface_SUScriptSoftwareApplicationAdditions__getSoftwareApplicationWithBundleID_completionFunction___block_invoke;
      v9[3] = &unk_264812EB8;
      v9[4] = a3;
      [(SUScriptInterface *)self _getSoftwareApplicationWithCompletionFunction:a4 lookupBlock:v9];
      return;
    }
    id v8 = (void *)MEMORY[0x263F1FA90];
  }

  [v8 throwException:@"Invalid argument"];
}

uint64_t __113__SUScriptInterface_SUScriptSoftwareApplicationAdditions__getSoftwareApplicationWithBundleID_completionFunction___block_invoke(uint64_t a1)
{
  id v2 = (void *)[MEMORY[0x263F89518] loadedMap];
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 applicationForBundleIdentifier:v3];
}

- (id)softwareApplicationWithAdamID:(id)a3
{
  uint64_t v4 = (SUScriptSoftwareApplication *)SSGetUnsignedLongLongFromValue();
  if (v4)
  {
    uint64_t v5 = (void *)[MEMORY[0x263F89518] loadedMap];
    uint64_t v4 = (SUScriptSoftwareApplication *)objc_msgSend(v5, "applicationForItemIdentifier:", objc_msgSend(NSNumber, "numberWithItemIdentifier:", v4));
    if (v4)
    {
      uint64_t v4 = [[SUScriptSoftwareApplication alloc] initWithApplication:v4];
      [(SUScriptObject *)self checkInScriptObject:v4];
    }
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }

  return v4;
}

- (id)softwareApplicationWithBundleID:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = (SUScriptSoftwareApplication *)objc_msgSend((id)objc_msgSend(MEMORY[0x263F89518], "loadedMap"), "applicationForBundleIdentifier:", a3);
    if (v5)
    {
      uint64_t v5 = [[SUScriptSoftwareApplication alloc] initWithApplication:v5];
      [(SUScriptObject *)self checkInScriptObject:v5];
    }
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    uint64_t v5 = 0;
  }

  return v5;
}

- (NSArray)installedSoftwareApplications
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = (NSArray *)[MEMORY[0x263EFF980] array];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F89518], "loadedMap"), "applications");
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [[SUScriptSoftwareApplication alloc] initWithApplication:*(void *)(*((void *)&v12 + 1) + 8 * v8)];
        if (v9)
        {
          long long v10 = v9;
          [(NSArray *)v3 addObject:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  [(SUScriptObject *)self checkInScriptObjects:v3];
  return v3;
}

- (void)_getSoftwareApplicationWithCompletionFunction:(id)a3 lookupBlock:(id)a4
{
  uint64_t v6 = [[SUScriptFunction alloc] initWithScriptObject:a3];
  [(SUScriptFunction *)v6 setThisObject:self];
  id v7 = objc_alloc_init(MEMORY[0x263F894A8]);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __117__SUScriptInterface_SUScriptSoftwareApplicationAdditions___getSoftwareApplicationWithCompletionFunction_lookupBlock___block_invoke;
  v8[3] = &unk_264812EE0;
  void v8[5] = v6;
  void v8[6] = a4;
  v8[4] = self;
  [v7 setCompletionBlock:v8];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F894E0], "mainQueue"), "addOperation:", v7);
}

void __117__SUScriptInterface_SUScriptSoftwareApplicationAdditions___getSoftwareApplicationWithCompletionFunction_lookupBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  if (v2)
  {
    id v9 = [[SUScriptSoftwareApplication alloc] initWithApplication:v2];
    [*(id *)(a1 + 32) checkInScriptObject:v9];
    uint64_t v6 = *(void **)(a1 + 40);
    uint64_t v4 = (id *)(a1 + 40);
    uint64_t v5 = v6;
    id v7 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v3 = (uint64_t)v9;
    if (v9) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v8 = *(void **)(a1 + 40);
    uint64_t v4 = (id *)(a1 + 40);
    uint64_t v5 = v8;
    id v7 = (void *)MEMORY[0x263EFF8C0];
  }
  uint64_t v3 = objc_msgSend(MEMORY[0x263EFF9D0], "null", v3);
  id v9 = 0;
LABEL_6:
  objc_msgSend(v5, "callWithArguments:", objc_msgSend(v7, "arrayWithObject:", v3));
  [*v4 setThisObject:0];
}

- (id)makePopOverWithViewController:(id)a3
{
  uint64_t v5 = objc_alloc_init(SUScriptPopOver);
  [(SUScriptObject *)self checkInScriptObject:v5];
  [(SUScriptPopOver *)v5 setViewController:a3];

  return v5;
}

- (id)makeTextFieldWithStyle:(id)a3 placeholder:(id)a4 value:(id)a5 width:(id)a6
{
  long long v10 = [[SUScriptTextField alloc] initWithTextFieldStyle:a3];
  if (v10)
  {
    [(SUScriptObject *)self checkInScriptObject:v10];
    [(SUScriptTextField *)v10 setPlaceholder:a4];
    [(SUScriptTextField *)v10 setValue:a5];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (a6)
      {
        if ((isKindOfClass & 1) == 0) {
          [(SUScriptTextField *)v10 setWidth:a6];
        }
      }
    }
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }

  return v10;
}

- (id)makeButtonWithSystemItemString:(id)a3 action:(id)a4
{
  uint64_t v6 = [[SUScriptButton alloc] initWithSystemItemString:a3];
  [(SUScriptObject *)self checkInScriptObject:v6];
  [(SUScriptButton *)v6 setAction:a4];

  return v6;
}

- (id)makeButtonWithTitle:(id)a3 action:(id)a4
{
  id v7 = objc_alloc_init(SUScriptButton);
  [(SUScriptObject *)self checkInScriptObject:v7];
  [(SUScriptButton *)v7 setAction:a4];
  [(SUScriptButton *)v7 setTitle:a3];

  return v7;
}

- (id)systemItemAction
{
  return @"action";
}

- (id)systemItemAdd
{
  return @"add";
}

- (id)systemItemBookmarks
{
  return @"bookmarks";
}

- (id)systemItemCamera
{
  return @"camera";
}

- (id)systemItemCancel
{
  return @"cancel";
}

- (id)systemItemCompose
{
  return @"compose";
}

- (id)systemItemDone
{
  return @"done";
}

- (id)systemItemEdit
{
  return @"edit";
}

- (id)systemItemFastForward
{
  return @"fast-forward";
}

- (id)systemItemFixedSpace
{
  return @"fixed-space";
}

- (id)systemItemFlexibleSpace
{
  return @"flexible-space";
}

- (id)systemItemOrganize
{
  return @"organize";
}

- (id)systemItemPageCurl
{
  return @"page-curl";
}

- (id)systemItemPause
{
  return @"pause";
}

- (id)systemItemPlay
{
  return @"play";
}

- (id)systemItemRedo
{
  return @"redo";
}

- (id)systemItemRefresh
{
  return @"refresh";
}

- (id)systemItemReplay
{
  return @"replay";
}

- (id)systemItemRewind
{
  return @"rewind";
}

- (id)systemItemSearch
{
  return @"search";
}

- (id)systemItemStop
{
  return @"stop";
}

- (id)systemItemTrash
{
  return @"trash";
}

- (id)systemItemUndo
{
  return @"undo";
}

- (int64_t)dialogDisplayCountForKey:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = (void *)MEMORY[0x263F89488];
    return [v4 displayCountForKey:a3];
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    return 0;
  }
}

- (id)makeDialog
{
  uint64_t v3 = objc_alloc_init(SUScriptDialog);
  [(SUScriptObject *)self checkInScriptObject:v3];

  return v3;
}

- (void)deallocAuthentication
{
}

- (void)initAuthentication
{
  self->_accountManager = +[SUScriptAccountManager beginAccountManagerSessionForObject:self];

  MEMORY[0x270F9A758]();
}

- (id)accountForDSID:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v4 = 0;
LABEL_4:
    uint64_t v5 = [MEMORY[0x263EFF9D0] null];
    goto LABEL_5;
  }
  if (!v4) {
    goto LABEL_4;
  }
  uint64_t v7 = SSGetUnsignedLongLongFromValue();
  if (!v7)
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    goto LABEL_4;
  }
  uint64_t v8 = [objc_alloc(NSNumber) initWithUnsignedLongLong:v7];

  uint64_t v5 = [(SUScriptAccountManager *)self->_accountManager accountForDSID:v8];
  id v4 = (id)v8;
  if (!v5) {
    goto LABEL_4;
  }
LABEL_5:

  return v5;
}

- (void)authenticateForAccount:(id)a3 withOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v6 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v7 = 0;
  }
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      long long v12 = (void *)MEMORY[0x263F1FA90];
LABEL_18:
      [v12 throwException:@"Invalid argument"];
      goto LABEL_19;
    }
  }
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      long long v12 = (void *)MEMORY[0x263F1FA90];
      goto LABEL_18;
    }
  }
  uint64_t v8 = [v6 dsID];
  if (!v8)
  {
    uint64_t v8 = [NSNumber numberWithInteger:0];
  }
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__8;
  uint64_t v18 = __Block_byref_object_dispose__8;
  id v19 = 0;
  uint64_t v13 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  id v9 = -[SUScriptAuthenticationOperation initWithAccountIdentifier:]([SUScriptAuthenticationOperation alloc], "initWithAccountIdentifier:", v8, v13, 3221225472, __74__SUScriptInterface_SUAuthentication__authenticateForAccount_withOptions___block_invoke, &unk_2648125B0, self, &v14);
  long long v10 = v9;
  if (v15[5]) {
    -[SUScriptAuthenticationOperation setPresentingViewController:](v9, "setPresentingViewController:");
  }
  long long v11 = [[SUScriptOperation alloc] initWithOperation:v10 options:v7];
  [(SUScriptOperationDelegate *)self->_scriptOperationDelegate enqueueOperation:v11];

  _Block_object_dispose(&v14, 8);
LABEL_19:
}

uint64_t __74__SUScriptInterface_SUAuthentication__authenticateForAccount_withOptions___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 4UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0) = [*(id *)(a1 + 32) parentViewController];

  return MEMORY[0x270F9A758]();
}

- (void)authenticateAppleIdWithUsername:(id)a3 password:(id)a4 callback:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v7 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v8 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v9 = 0;
  }
  if (!v7 || !v8)
  {
    long long v10 = (void *)MEMORY[0x263F1FA90];
    long long v11 = @"Invalid argument - username or password does not exist";
LABEL_21:
    [v10 throwException:v11];
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v10 = (void *)MEMORY[0x263F1FA90];
    long long v11 = @"Invalid argument - username";
    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v10 = (void *)MEMORY[0x263F1FA90];
    long long v11 = @"Invalid argument - password";
    goto LABEL_21;
  }
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      long long v10 = (void *)MEMORY[0x263F1FA90];
      long long v11 = @"Invalid argument - callback";
      goto LABEL_21;
    }
  }
  id v12 = v7;
  id v13 = v8;
  id v14 = v9;
  WebThreadRunOnMainThread();

LABEL_22:
}

void __89__SUScriptInterface_SUAuthentication__authenticateAppleIdWithUsername_password_callback___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) parentViewController];
  if (!v2)
  {
    uint64_t v5 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    id v8 = [v5 OSLogObject];
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      v7 &= 2u;
    }
    if (v7)
    {
      int v14 = 138543362;
      id v15 = (id)objc_opt_class();
      id v9 = v15;
      LODWORD(v12) = 12;
      long long v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_12:

        uint64_t v3 = [[SUScriptFunction alloc] initWithScriptObject:*(void *)(a1 + 56)];
        [(SUScriptFunction *)v3 setThisObject:*(void *)(a1 + 32)];
        id v13 = @"fail";
        long long v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:1];
        [(SUScriptFunction *)v3 callWithArguments:v11];

        [(SUScriptFunction *)v3 setThisObject:0];
        goto LABEL_13;
      }
      id v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v14, v12);
      free(v10);
      SSFileLog();
    }

    goto LABEL_12;
  }
  uint64_t v3 = [[SUScriptAppleIdAuthenticationOperation alloc] initWithUsername:*(void *)(a1 + 40) password:*(void *)(a1 + 48) viewController:v2];
  id v4 = [[SUScriptOperation alloc] initWithOperation:v3 callback:*(void *)(a1 + 56)];
  [*(id *)(*(void *)(a1 + 32) + 192) enqueueOperation:v4];

LABEL_13:
}

- (id)makeAccount
{
  uint64_t v2 = objc_alloc_init(SUScriptAccount);

  return v2;
}

- (NSArray)accounts
{
  return [(SUScriptAccountManager *)self->_accountManager accounts];
}

- (id)currentAccount
{
  uint64_t v3 = [(SUScriptInterface *)self authenticationContext];
  id v4 = [v3 requiredUniqueIdentifier];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263F7B0E8] defaultStore];
    int v6 = [(SUScriptInterface *)self authenticationContext];
    int v7 = [v6 requiredUniqueIdentifier];
    id v8 = [(SUScriptInterface *)self authenticationContext];
    id v9 = objc_msgSend(v5, "accountWithUniqueIdentifier:scope:", v7, objc_msgSend(v8, "accountScope"));

    if (v9) {
      goto LABEL_4;
    }
  }
  long long v10 = [MEMORY[0x263F7B0E8] defaultStore];
  id v9 = [v10 activeAccount];

  if (v9)
  {
LABEL_4:
    long long v11 = [v9 uniqueIdentifier];
    uint64_t v12 = [(SUScriptInterface *)self accountForDSID:v11];
  }
  else
  {
    uint64_t v12 = [MEMORY[0x263EFF9D0] null];
  }

  return v12;
}

- (SUScriptAccount)primaryAccount
{
  uint64_t v3 = [(SUScriptInterface *)self authenticationContext];
  id v4 = [v3 requiredUniqueIdentifier];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263F7B0E8] defaultStore];
    int v6 = [(SUScriptInterface *)self authenticationContext];
    int v7 = [v6 requiredUniqueIdentifier];
    id v8 = [(SUScriptInterface *)self authenticationContext];
    id v9 = objc_msgSend(v5, "accountWithUniqueIdentifier:scope:", v7, objc_msgSend(v8, "accountScope"));

    if ([v9 isActive])
    {
      if (v9)
      {
LABEL_7:
        long long v11 = [v9 uniqueIdentifier];
        uint64_t v12 = [(SUScriptInterface *)self accountForDSID:v11];

        goto LABEL_9;
      }
    }
    else
    {
    }
  }
  long long v10 = [MEMORY[0x263F7B0E8] defaultStore];
  id v9 = [v10 activeAccount];

  if (v9) {
    goto LABEL_7;
  }
  uint64_t v12 = [MEMORY[0x263EFF9D0] null];
LABEL_9:

  return (SUScriptAccount *)v12;
}

- (id)primaryiCloudAccount
{
  uint64_t v2 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
  uint64_t v3 = objc_msgSend(v2, "ams_activeiCloudAccount");

  if (v3)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x263F7B0E0]) initWithBackingAccount:v3];
    uint64_t v5 = objc_alloc_init(SUScriptAccount);
    [(SUScriptAccount *)v5 setAccount:v4];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x263EFF9D0] null];
  }

  return v5;
}

- (SUScriptAccount)primaryLockerAccount
{
  uint64_t v3 = [MEMORY[0x263F7B0E8] defaultStore];
  id v4 = [v3 activeLockerAccount];

  if (v4)
  {
    uint64_t v5 = [v4 uniqueIdentifier];
    int v6 = [(SUScriptInterface *)self accountForDSID:v5];
  }
  else
  {
    int v6 = [MEMORY[0x263EFF9D0] null];
  }

  return (SUScriptAccount *)v6;
}

- (void)setAccounts:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F1FA90];
  id v4 = [NSString stringWithFormat:@"%@ is readonly", @"accounts"];
  [v3 throwException:v4];
}

- (void)setPrimaryAccount:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
  }
  else if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v3 = [v7 account];
      id v4 = [v3 uniqueIdentifier];

      if (v4)
      {
        uint64_t v5 = [MEMORY[0x263F7B0E8] defaultStore];
        id v6 = (id)[v5 setActiveAccount:v3];
      }
      else
      {
        [MEMORY[0x263F1FA90] throwException:@"Account must have a dsid to be primary"];
      }
    }
    else
    {
      [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    }
    goto LABEL_5;
  }
  id v7 = [MEMORY[0x263F7B0E8] defaultStore];
  [v7 signOutAllAccounts];
LABEL_5:
}

- (void)setPrimaryLockerAccount:(id)a3
{
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
  }
  else if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = [v8 account];
      uint64_t v5 = [v4 uniqueIdentifier];

      if (v5)
      {
        id v6 = [MEMORY[0x263F7B0E8] defaultStore];
        id v7 = (id)[v6 setActiveLockerAccount:v4];
      }
      else
      {
        [MEMORY[0x263F1FA90] throwException:@"Account must have a dsid to be primary"];
      }
    }
    else
    {
      [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    }
    goto LABEL_5;
  }
  id v8 = [MEMORY[0x263F7B0E8] defaultStore];
  id v3 = (id)[v8 setActiveLockerAccount:0];
LABEL_5:
}

- (id)makeFamilySetupViewController
{
  id v3 = objc_alloc_init(SUScriptFamilySetupViewController);
  [(SUScriptObject *)self checkInScriptObject:v3];

  return v3;
}

- (id)getDownloadQueueWithQueueType:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = (void *)MEMORY[0x263F1FA90];
    id v9 = @"Invalid argument";
LABEL_11:
    [v8 throwException:v9];
    return 0;
  }
  if (([a3 isEqualToString:@"media"] & 1) == 0
    && ([a3 isEqualToString:@"software"] & 1) == 0
    && ([a3 isEqualToString:@"ebooks"] & 1) == 0)
  {
    id v8 = (void *)MEMORY[0x263F1FA90];
    id v9 = @"Unknown queue type";
    goto LABEL_11;
  }
  [(SUScriptObject *)self lock];
  downloadQueues = self->_downloadQueues;
  if (!downloadQueues)
  {
    downloadQueues = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    self->_downloadQueues = downloadQueues;
  }
  id v6 = (SUScriptDownloadQueue *)(id)[(NSMutableDictionary *)downloadQueues objectForKey:a3];
  [(SUScriptObject *)self unlock];
  if (!v6 || ![(SUScriptObject *)self scriptObjectIsCheckedIn:v6])
  {
    id v6 = [[SUScriptDownloadQueue alloc] initWithQueueType:a3 clientInterface:[(SUScriptInterface *)self clientInterface]];
    [(SUScriptObject *)self checkInScriptObject:v6];
    [(SUScriptObject *)self lock];
    [(NSMutableDictionary *)self->_downloadQueues setObject:v6 forKey:a3];
    [(SUScriptObject *)self unlock];
    id v7 = v6;
  }
  return v6;
}

- (void)composeEmailWithSubject:(id)a3 body:(id)a4
{
  uint64_t v5 = (__CFString *)a3;
  id v6 = (__CFString *)a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v6 = &stru_26DB8C5F8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v5 = &stru_26DB8C5F8;
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __64__SUScriptInterface_SUNavigation__composeEmailWithSubject_body___block_invoke;
  v9[3] = &unk_264812290;
  long long v10 = v5;
  long long v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v9);
}

uint64_t __64__SUScriptInterface_SUNavigation__composeEmailWithSubject_body___block_invoke(uint64_t a1)
{
  return +[SUClientDispatch composeEmailWithSubject:*(void *)(a1 + 32) body:*(void *)(a1 + 40)];
}

- (void)dismissWindowsWithOptions:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F7B1F8];
  id v4 = a3;
  uint64_t v5 = [v3 sharedConfig];
  int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  id v8 = [v5 OSLogObject];
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
    v7 &= 2u;
  }
  if (!v7) {
    goto LABEL_9;
  }
  *(_DWORD *)uint64_t v12 = 138543618;
  *(void *)&v12[4] = objc_opt_class();
  *(_WORD *)&v12[12] = 2082;
  *(void *)&v12[14] = "-[SUScriptInterface(SUNavigation) dismissWindowsWithOptions:]";
  id v9 = *(id *)&v12[4];
  LODWORD(v11) = 22;
  long long v10 = (void *)_os_log_send_and_compose_impl();

  if (v10)
  {
    id v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, v12, v11, *(_OWORD *)v12, *(void *)&v12[16], v13);
    free(v10);
    SSFileLog();
LABEL_9:
  }
  +[SUScriptWindow dismissWindowsWithOptions:v4];
}

- (id)makeNavigationControllerWithRootViewController:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    int v7 = 0;
  }
  else
  {
    uint64_t v5 = [SUScriptNavigationController alloc];
    int v6 = [(SUScriptInterface *)self clientInterface];
    int v7 = [(SUScriptNavigationController *)v5 initWithRootScriptViewController:v4 clientInterface:v6];

    [(SUScriptObject *)self checkInScriptObject:v7];
  }

  return v7;
}

- (id)makeStorePageWithURLs:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v4 = 0;
  }
  id v9 = 0;
  BOOL v5 = +[SUScriptStorePageViewController copyURLStrings:&v9 forValue:v4];
  id v6 = v9;
  if (v5)
  {
    int v7 = [[SUScriptStorePageViewController alloc] initWithURLStrings:v6];
    [(SUScriptObject *)self checkInScriptObject:v7];
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    int v7 = 0;
  }

  return v7;
}

- (void)openURL:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263F7B1F8];
  id v5 = a3;
  id v6 = [v4 sharedConfig];
  int v7 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v8 = v7 | 2;
  }
  else {
    int v8 = v7;
  }
  id v9 = [v6 OSLogObject];
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
    v8 &= 2u;
  }
  if (v8)
  {
    *(_DWORD *)id v15 = 138543618;
    *(void *)&v15[4] = objc_opt_class();
    *(_WORD *)&v15[12] = 2082;
    *(void *)&v15[14] = "-[SUScriptInterface(SUNavigation) openURL:]";
    id v10 = *(id *)&v15[4];
    LODWORD(v14) = 22;
    uint64_t v11 = (void *)_os_log_send_and_compose_impl();

    if (!v11) {
      goto LABEL_10;
    }
    id v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, v15, v14, *(_OWORD *)v15, *(void *)&v15[16], v16);
    free(v11);
    SSFileLog();
  }

LABEL_10:
  uint64_t v12 = (void *)[objc_alloc(NSURL) initWithString:v5];

  if (v12)
  {
    uint64_t v13 = [(SUScriptInterface *)self clientInterface];
    SUOpenExternalURL((uint64_t)v12, v13);
  }
}

- (void)reloadFooterSection:(id)a3 withURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    id v6 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v8 = (void *)MEMORY[0x263F1FA90];
    id v9 = @"Invalid section ID";
LABEL_11:
    [v8 throwException:v9];
    goto LABEL_12;
  }
  if (!v6)
  {
    int v7 = 0;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v8 = (void *)MEMORY[0x263F1FA90];
    id v9 = @"Invalid url string";
    goto LABEL_11;
  }
  int v7 = (void *)[objc_alloc(NSURL) initWithString:v6];
LABEL_9:
  id v11 = v5;
  id v10 = v7;
  WebThreadRunOnMainThread();

LABEL_12:
}

void __63__SUScriptInterface_SUNavigation__reloadFooterSection_withURL___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) clientInterface];
  uint64_t v2 = [v3 tabBarController];
  [v2 reloadSectionWithIdentifier:*(void *)(a1 + 40) URL:*(void *)(a1 + 48)];
}

- (void)selectSectionWithIdentifier:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    WebThreadRunOnMainThread();
  }
}

void __63__SUScriptInterface_SUNavigation__selectSectionWithIdentifier___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) clientInterface];
  uint64_t v2 = [v3 tabBarController];
  [v2 setSelectedIdentifier:*(void *)(a1 + 40)];
}

- (SUScriptSectionsController)sectionsController
{
  id v3 = objc_alloc_init(SUScriptSectionsController);
  [(SUScriptObject *)self checkInScriptObject:v3];

  return v3;
}

- (SUScriptViewController)viewController
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__9;
  uint64_t v17 = __Block_byref_object_dispose__9;
  id v18 = 0;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  id v9 = __49__SUScriptInterface_SUNavigation__viewController__block_invoke;
  id v10 = &unk_2648125B0;
  id v11 = self;
  uint64_t v12 = &v13;
  WebThreadRunOnMainThread();
  if (v14[5]
    && (-[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v7, 3221225472, __49__SUScriptInterface_SUNavigation__viewController__block_invoke, &unk_2648125B0, v11, &v13), (id v3 = (void *)v14[5]) != 0))
  {
    id v4 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x263EFF9D0], "null", v7, v8, v9, v10, v11, v12);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v5 = v4;
  _Block_object_dispose(&v13, 8);

  return (SUScriptViewController *)v5;
}

void __49__SUScriptInterface_SUNavigation__viewController__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) parentViewController];
  uint64_t v2 = [v5 copyScriptViewController];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 4UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0) = v2;
}

- (void)dismissSheet
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  id v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    v5 &= 2u;
  }
  if (!v5) {
    goto LABEL_9;
  }
  *(_DWORD *)id v11 = 138543618;
  *(void *)&v11[4] = objc_opt_class();
  *(_WORD *)&v11[12] = 2082;
  *(void *)&v11[14] = "-[SUScriptInterface(SUNavigation) dismissSheet]";
  id v7 = *(id *)&v11[4];
  LODWORD(v1UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0) = 22;
  uint64_t v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    id v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, v11, v10, *(_OWORD *)v11, *(void *)&v11[16]);
    free(v8);
    SSFileLog();
LABEL_9:
  }
  id v9 = [(SUScriptInterface *)self viewController];
  [v9 dismissModalViewControllerAnimated:1];
}

- (void)goBack
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  id v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    v5 &= 2u;
  }
  if (!v5) {
    goto LABEL_9;
  }
  *(_DWORD *)uint64_t v12 = 138543618;
  *(void *)&v12[4] = objc_opt_class();
  *(_WORD *)&v12[12] = 2082;
  *(void *)&v12[14] = "-[SUScriptInterface(SUNavigation) goBack]";
  id v7 = *(id *)&v12[4];
  LODWORD(v11) = 22;
  uint64_t v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    id v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, v12, v11, *(_OWORD *)v12, *(void *)&v12[16]);
    free(v8);
    SSFileLog();
LABEL_9:
  }
  id v9 = [(SUScriptInterface *)self viewController];
  uint64_t v10 = [v9 navigationController];

  [v10 popViewControllerAnimated:1];
}

- (void)gotoStoreURL:(id)a3
{
}

- (void)gotoStoreURL:(id)a3 ofType:(id)a4 withAuthentication:(BOOL)a5 forceAuthentication:(BOOL)a6
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v10 = [v9 shouldLog];
  if ([v9 shouldLogToDisk]) {
    int v11 = v10 | 2;
  }
  else {
    int v11 = v10;
  }
  uint64_t v12 = [v9 OSLogObject];
  if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
    v11 &= 2u;
  }
  if (!v11) {
    goto LABEL_9;
  }
  int v19 = 138543874;
  id v20 = (id)objc_opt_class();
  __int16 v21 = 2082;
  id v22 = "-[SUScriptInterface(SUNavigation) gotoStoreURL:ofType:withAuthentication:forceAuthentication:]";
  __int16 v23 = 2114;
  id v24 = v7;
  id v13 = v20;
  LODWORD(v16) = 32;
  uint64_t v14 = (void *)_os_log_send_and_compose_impl();

  if (v14)
  {
    uint64_t v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v19, v16);
    free(v14);
    SSFileLog();
LABEL_9:
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v15 = (void *)[objc_alloc(NSURL) initWithString:v7];
      if (v15)
      {
        id v17 = v8;
        id v18 = v15;
        WebThreadRunOnMainThread();
      }
    }
  }
}

void __94__SUScriptInterface_SUNavigation__gotoStoreURL_ofType_withAuthentication_forceAuthentication___block_invoke(uint64_t a1)
{
  id v13 = [*(id *)(a1 + 32) clientInterface];
  if ([*(id *)(a1 + 40) hasPrefix:@"account"])
  {
    uint64_t v2 = objc_alloc_init(SUAccountViewController);
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F7B368]) initWithURL:*(void *)(a1 + 48)];
    [(SUViewController *)v2 setClientInterface:v13];
    [(SUStorePageViewController *)v2 setURLRequestProperties:v3];
    +[SUClientDispatch enterAccountFlowWithViewController:v2 animated:1];
  }
  else
  {
    uint64_t v3 = [*(id *)(a1 + 32) parentViewController];
    int v4 = [*(id *)(a1 + 32) viewControllerFactory];
    int v5 = v4;
    if (v4) {
      id v6 = (SUStorePageViewController *)[v4 newStorePageViewControllerWithSection:0];
    }
    else {
      id v6 = [(SUViewController *)[SUStorePageViewController alloc] initWithSection:0];
    }
    uint64_t v2 = (SUAccountViewController *)v6;
    [(SUViewController *)v6 setClientInterface:v13];
    id v7 = (void *)[objc_alloc(MEMORY[0x263F7B368]) initWithURL:*(void *)(a1 + 48)];
    [(SUStorePageViewController *)v2 setURLRequestProperties:v7];
    [(SUStorePageViewController *)v2 setNeedsAuthentication:*(unsigned __int8 *)(a1 + 56)];
    id v8 = objc_alloc(MEMORY[0x263F7B288]);
    id v9 = [MEMORY[0x263F7B0E8] defaultStore];
    int v10 = [v9 activeAccount];
    int v11 = (void *)[v8 initWithAccount:v10];

    if (*(unsigned char *)(a1 + 57)) {
      [v11 setPromptStyle:1];
    }
    [(SUStorePageViewController *)v2 setAuthenticationContext:v11];
    uint64_t v12 = [v3 navigationController];
    [v12 pushViewController:v2 animated:1];
  }
}

- (void)pingURL:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (uint64_t v4 = [objc_alloc(NSURL) initWithString:a3]) != 0)
  {
    int v5 = (void *)v4;
    id v6 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    if (!os_log_type_enabled((os_log_t)[v6 OSLogObject], OS_LOG_TYPE_INFO)) {
      v8 &= 2u;
    }
    if (v8)
    {
      int v16 = 138412546;
      uint64_t v17 = objc_opt_class();
      __int16 v18 = 2112;
      int v19 = v5;
      LODWORD(v15) = 22;
      uint64_t v14 = &v16;
      uint64_t v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        int v10 = (void *)v9;
        uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v16, v15);
        free(v10);
        uint64_t v14 = (int *)v11;
        SSFileLog();
      }
    }
    uint64_t v12 = objc_msgSend(MEMORY[0x263F894E0], "mainQueue", v14);
    objc_msgSend(v12, "addOperation:", objc_msgSend(MEMORY[0x263F89528], "pingOperationWithUrl:", v5));
  }
  else
  {
    id v13 = (void *)MEMORY[0x263F1FA90];
    [v13 throwException:@"Invalid argument"];
  }
}

- (void)retryAllRestoreDownloads
{
}

- (SUScriptProtocol)protocol
{
  uint64_t v3 = objc_alloc_init(SUScriptProtocol);
  [(SUScriptObject *)self checkInScriptObject:v3];

  return v3;
}

- (void)handleProtocolPropertyListString:(id)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263F086B0]);
  id v6 = (void *)SUScriptPropertyListFromString(a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 count])
  {
    [(SUScriptProtocol *)[(SUScriptInterface *)self protocol] setValuesFromDictionary:v6];
    WebThreadRunOnMainThread();
  }
}

uint64_t __75__SUScriptInterface_SUProtocolAdditions__handleProtocolPropertyListString___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) parentViewController];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F894F8]) initWithPropertyList:*(void *)(a1 + 40)];
  id v4 = objc_alloc_init(MEMORY[0x263F89500]);
  objc_msgSend(v4, "setAuthenticationContext:", objc_msgSend(*(id *)(a1 + 32), "authenticationContext"));
  [v4 setShouldPostFooterSectionChanged:0];
  [v4 setShouldProcessDialogs:0];
  [v3 setDataProvider:v4];

  uint64_t v5 = [MEMORY[0x263F7B420] weakReferenceWithObject:v2];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __75__SUScriptInterface_SUProtocolAdditions__handleProtocolPropertyListString___block_invoke_2;
  v9[3] = &unk_264812F30;
  void v9[4] = v3;
  void v9[5] = v5;
  long long v10 = *(_OWORD *)(a1 + 32);
  [v3 setCompletionBlock:v9];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F894E0], "mainQueue"), "addOperation:", v3);

  uint64_t v6 = [*(id *)(a1 + 40) objectForKey:@"tabs"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v7 = objc_alloc_init(SUPageSectionGroup);
    [(SUPageSectionGroup *)v7 loadFromDictionary:v6];
    [v2 reloadForSectionsWithGroup:v7];
  }
  objc_msgSend((id)objc_msgSend(v2, "storePageProtocol"), "setValuesFromStorePageDictionary:", *(void *)(a1 + 40));
  return [v2 storePageProtocolDidChange];
}

uint64_t __75__SUScriptInterface_SUProtocolAdditions__handleProtocolPropertyListString___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "dataProvider"), "redirectURL");
  if (v2)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __75__SUScriptInterface_SUProtocolAdditions__handleProtocolPropertyListString___block_invoke_3;
    block[3] = &unk_264812808;
    long long v8 = *(_OWORD *)(a1 + 40);
    uint64_t v9 = v2;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  uint64_t v3 = [*(id *)(a1 + 56) objectForKey:*MEMORY[0x263F89580]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __75__SUScriptInterface_SUProtocolAdditions__handleProtocolPropertyListString___block_invoke_96;
    v6[3] = &unk_264812158;
    uint64_t v4 = *(void *)(a1 + 48);
    v6[4] = v3;
    v6[5] = v4;
    dispatch_async(MEMORY[0x263EF83A0], v6);
  }
  return [*(id *)(a1 + 32) setCompletionBlock:0];
}

void __75__SUScriptInterface_SUProtocolAdditions__handleProtocolPropertyListString___block_invoke_3(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)[*(id *)(a1 + 32) object];
  uint64_t v3 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  if (!os_log_type_enabled((os_log_t)[v3 OSLogObject], OS_LOG_TYPE_DEBUG)) {
    v5 &= 2u;
  }
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = *(void *)(a1 + 48);
    int v12 = 138412546;
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    LODWORD(v11) = 22;
    uint64_t v8 = _os_log_send_and_compose_impl();
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v12, v11);
      free(v9);
      SSFileLog();
    }
  }
  long long v10 = objc_msgSend(objc_alloc(MEMORY[0x263F7B368]), "initWithURL:", objc_msgSend(*(id *)(a1 + 48), "schemeSwizzledURL"));
  [v2 reloadWithURLRequestProperties:v10];
}

void __75__SUScriptInterface_SUProtocolAdditions__handleProtocolPropertyListString___block_invoke_96(uint64_t a1)
{
  id v2 = (id)[objc_alloc(MEMORY[0x263F89488]) initWithDialogDictionary:*(void *)(a1 + 32)];
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "clientInterface"), "_presentDialog:", v2);
}

- (id)makeWindow
{
  uint64_t v3 = objc_alloc_init(SUScriptWindow);
  [(SUScriptObject *)self checkInScriptObject:v3];

  return v3;
}

- (void)setWindow:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F1FA90];
  uint64_t v4 = [NSString stringWithFormat:@"%@ is readonly", @"window"];

  [v3 throwException:v4];
}

- (SUScriptWindow)window
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(SUScriptInterface *)self scriptWindowContext];
  if (!v3) {
    return (SUScriptWindow *)[MEMORY[0x263EFF9D0] null];
  }
  uint64_t v4 = v3;
  if (objc_opt_respondsToSelector()) {
    [(SUScriptWindowContext *)v4 tag];
  }
  [(SUScriptObject *)self lock];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  scriptObjects = self->super._scriptObjects;
  uint64_t v6 = [(NSMutableSet *)scriptObjects countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_6:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(scriptObjects);
      }
      long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v10 context];
        if (objc_opt_respondsToSelector())
        {
          if (objc_msgSend((id)objc_msgSend(v10, "context"), "tag")) {
            break;
          }
        }
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableSet *)scriptObjects countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_6;
        }
        goto LABEL_14;
      }
    }
    uint64_t v11 = v10;
    [(SUScriptObject *)self unlock];
    if (v11) {
      return v11;
    }
  }
  else
  {
LABEL_14:
    [(SUScriptObject *)self unlock];
  }
  uint64_t v11 = [[SUScriptWindow alloc] initWithContext:v4];
  [(SUScriptObject *)self checkInScriptObject:v11];
  WebThreadRunOnMainThread();

  if (!v11) {
    return (SUScriptWindow *)[MEMORY[0x263EFF9D0] null];
  }
  return v11;
}

uint64_t __52__SUScriptInterface_SUScriptWindowAdditions__window__block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) _overlayViewController:0] != 0;
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 setVisible:v2];
}

- (void)deallocCarrierBundlingController
{
}

- (SUScriptCarrierBundlingController)carrierBundlingController
{
  [(SUScriptObject *)self lock];
  carrierBundlingController = self->_carrierBundlingController;
  uint64_t v4 = carrierBundlingController;
  if (!carrierBundlingController)
  {
    int v5 = objc_alloc_init(SUScriptCarrierBundlingController);
    self->_carrierBundlingController = v5;
    [(SUScriptObject *)v5 setVisible:1];
    uint64_t v4 = self->_carrierBundlingController;
  }
  uint64_t v6 = v4;
  [(SUScriptObject *)self unlock];
  if (!carrierBundlingController) {
    [(SUScriptObject *)self checkInScriptObject:v6];
  }

  return v6;
}

- (void)setCarrierBundlingController:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F1FA90];
  uint64_t v4 = [NSString stringWithFormat:@"%@ is readonly", @"carrierBundling"];

  [v3 throwException:v4];
}

- (id)makeNumberFormatterWithStyle:(id)a3
{
  uint64_t v4 = objc_alloc_init(SUScriptNumberFormatter);
  [(SUScriptNumberFormatter *)v4 setStyle:a3];

  return v4;
}

- (id)makeSplitViewController
{
  uint64_t v3 = objc_alloc_init(SUScriptSplitViewController);
  [(SUScriptObject *)self checkInScriptObject:v3];

  return v3;
}

- (id)makeMenuViewController
{
  uint64_t v3 = objc_alloc_init(SUScriptMenuViewController);
  [(SUScriptObject *)self checkInScriptObject:v3];

  return v3;
}

- (id)makeCanvasWithWidth:(id)a3 height:(id)a4
{
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [SUScriptCanvasContext alloc];
    [a3 floatValue];
    double v8 = v7;
    [a4 floatValue];
    long long v10 = [(SUScriptCanvasContext *)v6 initWithWidth:v8 height:v9];
    if (v10)
    {
      return v10;
    }
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }
  int v12 = (void *)MEMORY[0x263EFF9D0];

  return (id)[v12 null];
}

- (id)makeColorWithHue:(id)a3 saturation:(id)a4 brightness:(id)a5 alpha:(id)a6
{
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    long long v10 = objc_alloc_init(SUScriptColor);
    [a3 floatValue];
    double v12 = v11;
    [a4 floatValue];
    double v14 = v13;
    [a5 floatValue];
    double v16 = v15;
    [a6 floatValue];
    [(SUScriptColor *)v10 setHue:v12 saturation:v14 brightness:v16 alpha:v17];
    if (v10)
    {
      return v10;
    }
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }
  int v19 = (void *)MEMORY[0x263EFF9D0];

  return (id)[v19 null];
}

- (id)makeColorWithRed:(id)a3 green:(id)a4 blue:(id)a5 alpha:(id)a6
{
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    long long v10 = objc_alloc_init(SUScriptColor);
    [a3 floatValue];
    double v12 = v11;
    [a4 floatValue];
    double v14 = v13;
    [a5 floatValue];
    double v16 = v15;
    [a6 floatValue];
    [(SUScriptColor *)v10 setRed:v12 green:v14 blue:v16 alpha:v17];
    if (v10)
    {
      return v10;
    }
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }
  int v19 = (void *)MEMORY[0x263EFF9D0];

  return (id)[v19 null];
}

- (id)makeColorWithWhite:(id)a3 alpha:(id)a4
{
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    uint64_t v6 = objc_alloc_init(SUScriptColor);
    [a3 floatValue];
    double v8 = v7;
    [a4 floatValue];
    [(SUScriptColor *)v6 setWhite:v8 alpha:v9];
    if (v6)
    {
      return v6;
    }
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }
  float v11 = (void *)MEMORY[0x263EFF9D0];

  return (id)[v11 null];
}

- (id)makeLinearGradientWithX0:(double)a3 y0:(double)a4 x1:(double)a5 y1:(double)a6
{
  id v6 = [[SUScriptGradient alloc] initLinearGradientWithX0:a3 y0:a4 x1:a5 y1:a6];

  return v6;
}

- (id)makeRadialGradientWithX0:(double)a3 y0:(double)a4 r0:(double)a5 x1:(double)a6 y1:(double)a7 r1:(double)a8
{
  id v8 = [[SUScriptGradient alloc] initRadialGraidentWithX0:a3 y0:a4 r0:a5 x1:a6 y1:a7 r1:a8];

  return v8;
}

- (void)deallocMediaLibrary
{
}

- (SUScriptMediaLibrary)mediaLibrary
{
  [(SUScriptObject *)self lock];
  mediaLibrary = self->_mediaLibrary;
  uint64_t v4 = mediaLibrary;
  if (!mediaLibrary)
  {
    int v5 = objc_alloc_init(SUScriptMediaLibrary);
    self->_mediaLibrary = v5;
    [(SUScriptObject *)v5 setVisible:1];
    uint64_t v4 = self->_mediaLibrary;
  }
  id v6 = v4;
  [(SUScriptObject *)self unlock];
  if (!mediaLibrary)
  {
    [(SUScriptMediaLibrary *)v6 _connectNativeObject];
    [(SUScriptObject *)self checkInScriptObject:v6];
  }

  return v6;
}

- (void)setMediaLibrary:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F1FA90];
  uint64_t v4 = [NSString stringWithFormat:@"%@ is readonly", @"mediaLibrary"];

  [v3 throwException:v4];
}

- (void)addExternalDownloads:(id)a3 options:(id)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a4 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (!a4 || (objc_opt_class(), (objc_opt_isKindOfClass())))
  {
    float v7 = [(SUScriptInterface *)self copyJavaScriptContext];
    if (v7)
    {
      id v8 = v7;
      [(SUPurchaseManager *)[(SUClientInterface *)[(SUScriptInterface *)self clientInterface] purchaseManager] addExternalDownloads:a3 withOptions:a4 inContext:v7];
      JSGlobalContextRelease(v8);
    }
  }
  else
  {
    float v9 = (void *)MEMORY[0x263F1FA90];
    [v9 throwException:@"Invalid argument"];
  }
}

- (void)addExternalDownloadsFromManifestURL:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (uint64_t v4 = [objc_alloc(NSURL) initWithString:a3]) != 0)
  {
    int v5 = (void *)v4;
    id v6 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    if (!os_log_type_enabled((os_log_t)[v6 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      v8 &= 2u;
    }
    if (v8)
    {
      int v15 = 138412546;
      uint64_t v16 = objc_opt_class();
      __int16 v17 = 2112;
      uint64_t v18 = v5;
      LODWORD(v14) = 22;
      uint64_t v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        long long v10 = (void *)v9;
        objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v15, v14);
        free(v10);
        SSFileLog();
      }
    }
    id v11 = objc_alloc(MEMORY[0x263F7B188]);
    double v12 = objc_msgSend(v11, "initWithURLRequest:", objc_msgSend(MEMORY[0x263EFC630], "requestWithURL:", v5));
    [v12 setManifestFormat:1];
    [v12 start];
  }
  else
  {
    float v13 = (void *)MEMORY[0x263F1FA90];
    [v13 throwException:@"Invalid argument"];
  }
}

- (void)addPurchaseWithInfo:(id)a3 options:(id)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a4 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (!a4 || (objc_opt_class(), (objc_opt_isKindOfClass())))
  {
    int v7 = [(SUScriptInterface *)self copyJavaScriptContext];
    int v8 = [(SUClientInterface *)[(SUScriptInterface *)self clientInterface] purchaseManager];
    [(SUPurchaseManager *)v8 setAccountDSID:[(SSAuthenticationContext *)[(SUScriptInterface *)self authenticationContext] requiredUniqueIdentifier]];
    uint64_t v9 = [(SUScriptInterface *)self tidHeaders];
    if ([(NSDictionary *)[(SUScriptDictionary *)v9 dictionary] count]) {
      [(SUPurchaseManager *)v8 setTidHeaders:[(SUScriptDictionary *)v9 dictionary]];
    }
    [(SUPurchaseManager *)v8 purchaseScriptObject:a3 withOptions:a4 inContext:v7];
    if (v7)
    {
      JSGlobalContextRelease(v7);
    }
  }
  else
  {
    long long v10 = (void *)MEMORY[0x263F1FA90];
    [v10 throwException:@"Invalid argument"];
  }
}

- (void)approveInPerson:(id)a3 completionFunction:(id)a4
{
  v18[1] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a3 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v7 = 0;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    int v7 = 0;
    if (a4 && (isKindOfClass & 1) == 0) {
      int v7 = [[SUScriptFunction alloc] initWithScriptObject:a4];
    }
  }
  [(SUScriptFunction *)v7 setThisObject:self];
  if (a3)
  {
    uint64_t v9 = v7;
    long long v10 = (void *)ISWeakLinkedClassForString();
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __77__SUScriptInterface_SUPurchaseAdditions__approveInPerson_completionFunction___block_invoke;
    v15[3] = &unk_264813D70;
    v15[4] = v7;
    v15[5] = a3;
    [v10 localApproveRequestWithItemIdentifier:a3 completion:v15];
  }
  else
  {
    __int16 v17 = @"status";
    v18[0] = [NSNumber numberWithBool:0];
    uint64_t v11 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    uint64_t v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F7B758] code:137 userInfo:0];
    float v13 = [[SUScriptDictionary alloc] initWithDictionary:v11];
    uint64_t v14 = [[SUScriptError alloc] initWithError:v12];
    v16[0] = v13;
    v16[1] = v14;
    -[SUScriptFunction callWithArguments:](v7, "callWithArguments:", [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2]);
    [(SUScriptFunction *)v7 setThisObject:0];
  }
}

void __77__SUScriptInterface_SUPurchaseAdditions__approveInPerson_completionFunction___block_invoke(uint64_t a1, uint64_t a2)
{
  void v12[2] = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    uint64_t v4 = &unk_26DBD7B80;
    if (!a2) {
      uint64_t v4 = &unk_26DBD7B68;
    }
    v11[0] = @"status";
    v11[1] = @"adamID";
    uint64_t v5 = *(void *)(a1 + 40);
    v12[0] = v4;
    v12[1] = v5;
    id v6 = -[SUScriptDictionary initWithDictionary:]([SUScriptDictionary alloc], "initWithDictionary:", [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2]);
    if (a2) {
      int v7 = [[SUScriptError alloc] initWithError:a2];
    }
    else {
      int v7 = (SUScriptError *)(id)[MEMORY[0x263F1FA98] undefined];
    }
    int v8 = v7;
    uint64_t v9 = *(void **)(a1 + 32);
    v10[0] = v6;
    v10[1] = v7;
    objc_msgSend(v9, "callWithArguments:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v10, 2));
    [*(id *)(a1 + 32) setThisObject:0];
  }
}

- (void)addExternalDownloads:(id)a3
{
}

- (void)addPurchaseWithInfo:(id)a3
{
}

- (id)makeReviewWithAdamID:(id)a3
{
  uint64_t v3 = objc_alloc_init(SUScriptReview);

  return v3;
}

- (id)makeComposeReviewViewControllerWithReview:(id)a3
{
  uint64_t v4 = [[SUScriptComposeReviewViewController alloc] initWithScriptReview:a3 clientInterface:[(SUScriptInterface *)self clientInterface]];
  [(SUScriptObject *)self checkInScriptObject:v4];

  return v4;
}

- (void)composeReviewWithURL:(id)a3 itemIdentifier:(id)a4 type:(id)a5
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a3 = 0;
  }
  id v6 = objc_alloc_init(SUScriptReview);
  [(SUScriptReview *)v6 setInfoURL:a3];
  if (a3) {
    WebThreadRunOnMainThread();
  }
  else {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }
}

void __108__SUScriptInterface_SUScriptComposeReviewViewControllerAdditions__composeReviewWithURL_itemIdentifier_type___block_invoke(uint64_t a1)
{
  uint64_t v2 = [NSURL URLWithString:*(void *)(a1 + 32)];
  uint64_t v3 = (void *)[*(id *)(a1 + 40) clientInterface];
  uint64_t v4 = (SUComposeReviewViewController *)objc_msgSend((id)objc_msgSend(v3, "viewControllerFactory"), "newComposeReviewViewControllerWithCompositionURL:", v2);
  if (!v4) {
    uint64_t v4 = [[SUComposeReviewViewController alloc] initWithCompositionURL:v2];
  }
  [(SUViewController *)v4 setClientInterface:v3];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __108__SUScriptInterface_SUScriptComposeReviewViewControllerAdditions__composeReviewWithURL_itemIdentifier_type___block_invoke_2;
  v5[3] = &unk_264813D98;
  void v5[4] = *(void *)(a1 + 40);
  void v5[5] = v4;
  [(SUComposeReviewViewController *)v4 prepareWithCompletionBlock:v5];
}

uint64_t __108__SUScriptInterface_SUScriptComposeReviewViewControllerAdditions__composeReviewWithURL_itemIdentifier_type___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    uint64_t v3 = (void *)[*(id *)(result + 32) parentViewController];
    uint64_t v4 = *(void *)(v2 + 40);
    return [v3 presentViewController:v4 animated:1 completion:0];
  }
  return result;
}

- (SUScriptPassbookLibrary)passbookLibrary
{
  uint64_t v3 = (objc_class *)ISWeakLinkedClassForString();
  if ([(objc_class *)v3 isPassLibraryAvailable])
  {
    id v4 = objc_alloc_init(v3);
    uint64_t v5 = [[SUScriptPassbookLibrary alloc] initWithPassLibrary:v4];
    [(SUScriptObject *)self checkInScriptObject:v5];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (SUScriptApplication)application
{
  uint64_t v3 = objc_alloc_init(SUScriptApplication);
  [(SUScriptObject *)self checkInScriptObject:v3];

  return v3;
}

- (id)makeVolumeViewController
{
  uint64_t v2 = objc_alloc_init(SUScriptVolumeViewController);

  return v2;
}

- (id)makeSegmentedControl
{
  uint64_t v3 = objc_alloc_init(SUScriptSegmentedControl);
  [(SUScriptObject *)self checkInScriptObject:v3];

  return v3;
}

- (id)makeURLRequestWithURLs:(id)a3 timeoutInterval:(id)a4
{
  id v6 = objc_alloc_init(SUScriptURLRequest);
  [(SUScriptURLRequest *)v6 setURLs:a3];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (a4)
    {
      if ((isKindOfClass & 1) == 0) {
        [(SUScriptURLRequest *)v6 setTimeoutInterval:a4];
      }
    }
  }

  return v6;
}

- (id)makeReportAProblemViewControllerWithAdamID:(id)a3
{
  id v4 = (SUScriptReportAProblemViewController *)SSGetUnsignedLongLongFromValue();
  if (v4)
  {
    uint64_t v5 = [(SUScriptInterface *)self clientInterface];
    id v6 = [SUScriptReportAProblemViewController alloc];
    id v4 = -[SUScriptReportAProblemViewController initWithAdamID:clientInterface:](v6, "initWithAdamID:clientInterface:", [NSNumber numberWithItemIdentifier:v4], v5);
    [(SUScriptObject *)self checkInScriptObject:v4];
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }

  return v4;
}

- (SUScriptDevice)device
{
  uint64_t v2 = objc_alloc_init(SUScriptDevice);

  return v2;
}

- (void)setDevice:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F1FA90];
  uint64_t v4 = [NSString stringWithFormat:@"%@ is readonly", @"device"];

  [v3 throwException:v4];
}

- (id)makeAccountPageWithURLs:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a3 = 0;
  }
  uint64_t v8 = 0;
  if (+[SUScriptStorePageViewController copyURLStrings:&v8 forValue:a3])
  {
    uint64_t v5 = [SUScriptAccountPageViewController alloc];
    id v6 = [(SUScriptStorePageViewController *)v5 initWithURLStrings:v8];
    [(SUScriptObject *)self checkInScriptObject:v6];
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    id v6 = 0;
  }
  return v6;
}

- (id)makeSubscriptionStatusRequest
{
  uint64_t v3 = objc_alloc_init(SUScriptSubscriptionStatusRequest);
  [(SUScriptObject *)self checkInScriptObject:v3];

  return v3;
}

- (SUScriptTelephony)telephony
{
  uint64_t v3 = objc_alloc_init(SUScriptTelephony);
  [(SUScriptObject *)self checkInScriptObject:v3];

  return v3;
}

- (id)makeDocumentInteractionController
{
  uint64_t v3 = objc_alloc_init(SUScriptDocumentInteractionController);
  [(SUScriptObject *)self checkInScriptObject:v3];

  return v3;
}

- (id)makeScriptActionWithType:(id)a3
{
  uint64_t v3 = [[SUScriptAction alloc] initWithActionType:a3];

  return v3;
}

- (NSString)actionTypeReturnToLibrary
{
  return (NSString *)@"SUScriptActionTypeReturnToLibrary";
}

- (NSString)actionTypeDismissWindows
{
  return (NSString *)@"SUScriptActionTypeDismissWindows";
}

- (NSString)actionTypeDismissSheet
{
  return (NSString *)@"SUScriptActionTypeDismissSheet";
}

- (id)makeDateFormatter
{
  uint64_t v2 = objc_alloc_init(SUScriptDateFormatter);

  return v2;
}

- (SUScriptPurchaseManager)purchaseManager
{
  uint64_t result = self->_purchaseManager;
  if (!result)
  {
    uint64_t v4 = objc_alloc_init(SUScriptPurchaseManager);
    self->_purchaseManager = v4;
    [(SUScriptObject *)self checkInScriptObject:v4];
    return self->_purchaseManager;
  }
  return result;
}

- (id)makeMediaPlayerItemWithProperties:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a3 = 0;
  }
  uint64_t v5 = [(SUScriptInterface *)self copyJavaScriptContext];
  if (v5)
  {
    id v6 = v5;
    int v7 = (void *)[a3 copyArrayOrDictionaryWithContext:v5];
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
      uint64_t v8 = 0;
    }
    else
    {
      uint64_t v8 = [[SUScriptMediaPlayerItem alloc] initWithDictionary:v7];
    }

    JSGlobalContextRelease(v6);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)makeMediaPlayerViewControllerWithMediaPlayerItem:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [[SUScriptMediaPlayerViewController alloc] initWithMediaPlayerItem:a3];
    [(SUScriptObject *)self checkInScriptObject:v5];
    [(UIViewController *)[(SUScriptViewController *)v5 nativeViewController] setClientInterface:[(SUScriptObject *)v5 clientInterface]];
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)showMediaPlayerWithURLString:(id)a3 orientation:(id)a4 title:(id)a5 subtitle:(id)a6 bookmarkID:(id)a7 duration:(id)a8 type:(id)a9 imageURL:(id)a10
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v16 = [objc_alloc(NSURL) initWithString:a3];
    if (v16)
    {
      __int16 v17 = (void *)v16;
      uint64_t v18 = objc_alloc_init(SUMediaPlayerItem);
      [(SUMediaPlayerItem *)v18 setURL:v17];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [a7 length]) {
        [(SUMediaPlayerItem *)v18 setBookmarkIdentifier:a7];
      }
      if (objc_opt_respondsToSelector())
      {
        [a8 doubleValue];
        [(SUMediaPlayerItem *)v18 setPlayableDuration:v19 / 1000.0];
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v20 = (void *)[objc_alloc(NSURL) initWithString:a10];
        [(SUMediaPlayerItem *)v18 setBackgroundImageURL:v20];
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(SUMediaPlayerItem *)v18 setSubtitle:a6];
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(SUMediaPlayerItem *)v18 setTitle:a5];
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        -[SUMediaPlayerItem setItemType:](v18, "setItemType:", objc_msgSend(+[SUItemDataSource sharedDataSource](SUItemDataSource, "sharedDataSource"), "itemTypeForTypeString:", a9));
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 && ([a4 isEqualToString:@"landscape"]) {
        uint64_t v21 = 3;
      }
      else {
        uint64_t v21 = 1;
      }
      [(SUMediaPlayerItem *)v18 setInitialOrientation:v21];
      WebThreadRunOnMainThread();
    }
  }
}

void __149__SUScriptInterface_SUMediaPlayerViewControllerAdditions__showMediaPlayerWithURLString_orientation_title_subtitle_bookmarkID_duration_type_imageURL___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "parentViewController"), "presentedViewController");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v3 = [v2 shouldLog];
    if ([v2 shouldLogToDisk]) {
      int v4 = v3 | 2;
    }
    else {
      int v4 = v3;
    }
    if (!os_log_type_enabled((os_log_t)[v2 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v4 &= 2u;
    }
    if (v4)
    {
      int v9 = 138412290;
      uint64_t v10 = objc_opt_class();
      LODWORD(v7) = 12;
      uint64_t v5 = _os_log_send_and_compose_impl();
      if (v5)
      {
        id v6 = (void *)v5;
        objc_msgSend(NSString, "stringWithCString:encoding:", v5, 4, &v9, v7);
        free(v6);
        SSFileLog();
      }
    }
  }
  else
  {
    uint64_t v8 = [[SUMediaPlayerViewController alloc] initWithMediaPlayerItem:*(void *)(a1 + 40)];
    -[SUMediaPlayerViewController setClientInterface:](v8, "setClientInterface:", [*(id *)(a1 + 32) clientInterface]);
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "parentViewController"), "presentViewController:animated:completion:", v8, 1, 0);
  }
}

- (void)showMediaPreviewWithURLString:(id)a3
{
}

- (void)deallocMetricsController
{
}

- (SUScriptMetricsController)metricsController
{
  [(SUScriptObject *)self lock];
  metricsController = self->_metricsController;
  int v4 = metricsController;
  if (!metricsController)
  {
    uint64_t v5 = objc_alloc_init(SUScriptMetricsController);
    self->_metricsController = v5;
    [(SUScriptObject *)v5 setVisible:1];
    int v4 = self->_metricsController;
  }
  id v6 = v4;
  [(SUScriptObject *)self unlock];
  if (!metricsController) {
    [(SUScriptObject *)self checkInScriptObject:v6];
  }

  return v6;
}

- (void)setMetricsController:(id)a3
{
  int v3 = (void *)MEMORY[0x263F1FA90];
  uint64_t v4 = [NSString stringWithFormat:@"%@ is readonly", @"metricsController"];

  [v3 throwException:v4];
}

- (id)activeAudioPlayers
{
  int v3 = (void *)[MEMORY[0x263EFF980] array];
  WebThreadRunOnMainThread();
  if ([v3 count]) {
    [(SUScriptObject *)self checkInScriptObjects:v3];
  }
  return v3;
}

uint64_t __60__SUScriptInterface_SUScriptAudioPlayer__activeAudioPlayers__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_msgSend(+[SUAudioPlayerSessionManager sessionManager](SUAudioPlayerSessionManager, "sessionManager"), "allSessionURLs");
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = [[SUScriptAudioPlayer alloc] initWithURL:*(void *)(*((void *)&v8 + 1) + 8 * v6) keyURL:0 certificateURL:0];
        [*(id *)(a1 + 32) addObject:v7];

        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

- (id)getAudioPlayerForURL:(id)a3 keyURL:(id)a4 certificateURL:(id)a5
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v9 = (void *)[objc_alloc(NSURL) initWithString:a3];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      long long v10 = (void *)[objc_alloc(NSURL) initWithString:a4];
    }
    else {
      long long v10 = 0;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v12 = (void *)[objc_alloc(NSURL) initWithString:a5];
    }
    else {
      uint64_t v12 = 0;
    }
    long long v11 = [[SUScriptAudioPlayer alloc] initWithURL:v9 keyURL:v10 certificateURL:v12];
    [(SUScriptObject *)self checkInScriptObject:v11];
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    long long v11 = 0;
  }

  return v11;
}

- (id)makeActivityViewControllerWithProviders:(id)a3 activities:(id)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a4 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (!a4 || (objc_opt_class(), (objc_opt_isKindOfClass())))
  {
    uint64_t v7 = (void *)[a4 copyArrayValueWithValidator:SUISAValidator context:objc_opt_class()];
    long long v8 = (void *)[a3 copyArrayValueWithValidator:SUISAValidator context:objc_opt_class()];
    long long v9 = [[SUScriptActivityViewController alloc] initWithScriptItemProviders:v8 applicationActivities:v7];
    [(SUScriptObject *)self checkInScriptObject:v9];
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    long long v9 = 0;
  }

  return v9;
}

- (id)makeFacebookRequestWithURL:(id)a3 requestMethod:(id)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v7 = (void *)[objc_alloc(NSURL) initWithString:a3];
    long long v8 = [[SUScriptFacebookRequest alloc] initWithURL:v7 requestMethod:a4];
    [(SUScriptObject *)self checkInScriptObject:v8];
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    long long v8 = 0;
  }

  return v8;
}

- (id)makeActivity
{
  int v3 = objc_alloc_init(SUScriptActivity);
  [(SUScriptObject *)self checkInScriptObject:v3];

  return v3;
}

- (SUScriptAppleAccountStore)appleAccountStore
{
  int v3 = objc_alloc_init(SUScriptAppleAccountStore);
  [(SUScriptObject *)self checkInScriptObject:v3];

  return v3;
}

- (id)makeActivityItemProviderWithMIMEType:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [[SUScriptActivityItemProvider alloc] initWithMIMEType:a3];
    [(SUScriptObject *)self checkInScriptObject:v5];
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)makeLookupRequest
{
  int v3 = objc_alloc_init(SUScriptLookupRequest);
  [(SUScriptObject *)self checkInScriptObject:v3];

  return v3;
}

- (id)makeFacebookSessionWithAccount:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = 0;
LABEL_6:
    uint64_t v7 = [[SUScriptFacebookSession alloc] initWithAppleAccount:v5];
    [(SUScriptObject *)self checkInScriptObject:v7];
    goto LABEL_7;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = 0;
  if (!a3) {
    goto LABEL_6;
  }
  if (isKindOfClass) {
    goto LABEL_6;
  }
  objc_opt_class();
  id v5 = a3;
  if (objc_opt_isKindOfClass()) {
    goto LABEL_6;
  }
  [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  uint64_t v7 = 0;
LABEL_7:

  return v7;
}

- (id)makeCalloutView
{
  int v3 = objc_alloc_init(SUScriptCalloutView);
  [(SUScriptObject *)self checkInScriptObject:v3];

  return v3;
}

- (SUScriptFairPlayContext)accountCreationSecureContext
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3052000000;
  uint64_t v7 = __Block_byref_object_copy__54;
  long long v8 = __Block_byref_object_dispose__54;
  uint64_t v9 = 0;
  WebThreadRunOnMainThread();
  uint64_t v2 = (SUScriptFairPlayContext *)(id)v5[5];
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __83__SUScriptInterface_SUScriptFairPlayContextAdditions__accountCreationSecureContext__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 4UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0) = objc_alloc_init(SUScriptFairPlayContext);
  if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isOpen])
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    [v2 checkInScriptObject:v3];
  }
  else
  {

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 4UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0) = 0;
  }
}

- (id)makeGiftViewController
{
  uint64_t v3 = objc_alloc_init(SUScriptGiftViewController);
  [(SUScriptObject *)self checkInScriptObject:v3];

  return v3;
}

- (id)makeAMSViewController
{
  uint64_t v3 = [(SUScriptInterface *)self primaryAccount];
  uint64_t v4 = [[SUScriptAMSViewController alloc] initWithPrimaryAccount:v3];
  [(SUScriptObject *)self checkInScriptObject:v4];

  return v4;
}

- (id)makeRedeemViewController
{
  uint64_t v3 = objc_alloc_init(SUScriptRedeemViewController);
  [(SUScriptObject *)self checkInScriptObject:v3];

  return v3;
}

- (id)makeDonationViewControllerWithCharityIdentifier:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }
  id v5 = [[SUScriptDonationViewController alloc] initWithCharityIdentifier:a3];
  [(SUScriptObject *)self checkInScriptObject:v5];

  return v5;
}

- (id)makeStoreSheetViewController
{
  uint64_t v3 = objc_alloc_init(SUScriptStoreSheetViewController);
  [(SUScriptObject *)self checkInScriptObject:v3];

  return v3;
}

@end