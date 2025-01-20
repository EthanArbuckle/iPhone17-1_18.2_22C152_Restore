@interface VSViewServiceViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (BOOL)didAuthenticateAccount;
- (BOOL)isIdentityProviderPickerRequired;
- (BOOL)isPresentedInHost;
- (NSOperationQueue)privateQueue;
- (UINavigationController)navController;
- (VSAuditToken)auditToken;
- (VSOptional)currentRequest;
- (VSOptional)currentRequestID;
- (VSPersistentStorage)storage;
- (VSPreferences)preferences;
- (VSRemoteNotifier)remoteNotifier;
- (VSRestrictionsCenter)restrictionsCenter;
- (VSTopShelfPurger)topShelfPurger;
- (VSViewServiceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_identityProviderRequestForViewServiceRequest:(id)a3 withAccount:(id)a4;
- (id)_viewServiceResponseWithIdentityProviderResponse:(id)a3;
- (void)_completeRequest:(id)a3 withResponse:(id)a4;
- (void)_completeRequestWithResponse:(id)a3;
- (void)_completeRequestWithResponse:(id)a3 fromIdentityProvider:(id)a4;
- (void)_determinePreAuthAppIsAuthorized:(id)a3 completion:(id)a4;
- (void)_didCancelRequest;
- (void)_didDetermineIdentityProvider:(id)a3 withPickerViewController:(id)a4;
- (void)_dismissInHostIfNecessary;
- (void)_performRequest:(id)a3 withIdentifier:(id)a4;
- (void)_performRequestInternal:(id)a3 withID:(id)a4 identityProviders:(id)a5 accounts:(id)a6 currentStorefrontCode:(id)a7 allStorefronts:(id)a8;
- (void)_performRequestWithIdentityProvider:(id)a3 account:(id)a4;
- (void)_presentInHostIfNecessary;
- (void)_request:(id)a3 didFailWithError:(id)a4;
- (void)_requestDidFailWithError:(id)a3;
- (void)_showIdentityProviderPickerViewControllerWithIdentityProviders:(id)a3 currentStorefrontCode:(id)a4 allStorefronts:(id)a5;
- (void)_willAppearInRemoteViewController;
- (void)dealloc;
- (void)identityProviderPickerViewController:(id)a3 didPickIdentityProvider:(id)a4;
- (void)identityProviderPickerViewControllerDidPickAdditionalIdentityProviders:(id)a3;
- (void)identityProviderViewController:(id)a3 didAuthenticateAccount:(id)a4 forRequest:(id)a5;
- (void)identityProviderViewController:(id)a3 didFinishRequest:(id)a4 withResult:(id)a5;
- (void)identityProviderViewControllerDidCancel:(id)a3;
- (void)identityProviderViewControllerDidFinishLoading:(id)a3;
- (void)remoteNotifier:(id)a3 didReceiveRemoteNotificationWithUserInfo:(id)a4;
- (void)setAuditToken:(id)a3;
- (void)setCurrentRequest:(id)a3;
- (void)setCurrentRequestID:(id)a3;
- (void)setDidAuthenticateAccount:(BOOL)a3;
- (void)setIdentityProviderPickerRequired:(BOOL)a3;
- (void)setNavController:(id)a3;
- (void)setPreferences:(id)a3;
- (void)setPresentedInHost:(BOOL)a3;
- (void)setPrivateQueue:(id)a3;
- (void)setRemoteNotifier:(id)a3;
- (void)setRestrictionsCenter:(id)a3;
- (void)setStorage:(id)a3;
- (void)setTopShelfPurger:(id)a3;
@end

@implementation VSViewServiceViewController

- (VSViewServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  VSRequireMainThread();
  v31.receiver = self;
  v31.super_class = (Class)VSViewServiceViewController;
  v8 = [(VSViewServiceViewController *)&v31 initWithNibName:v7 bundle:v6];

  if (v8)
  {
    v9 = (VSPersistentStorage *)objc_alloc_init(MEMORY[0x263F1E258]);
    storage = v8->_storage;
    v8->_storage = v9;

    uint64_t v11 = [MEMORY[0x263F1E270] defaultRestrictionsCenter];
    restrictionsCenter = v8->_restrictionsCenter;
    v8->_restrictionsCenter = (VSRestrictionsCenter *)v11;

    v13 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    privateQueue = v8->_privateQueue;
    v8->_privateQueue = v13;

    [(NSOperationQueue *)v8->_privateQueue setName:@"VSViewServiceViewController"];
    id v15 = objc_alloc(MEMORY[0x263F1E268]);
    uint64_t v16 = [v15 initWithNotificationName:*MEMORY[0x263F1E3F8]];
    remoteNotifier = v8->_remoteNotifier;
    v8->_remoteNotifier = (VSRemoteNotifier *)v16;

    [(VSRemoteNotifier *)v8->_remoteNotifier setDelegate:v8];
    v18 = (VSPreferences *)objc_alloc_init(MEMORY[0x263F1E260]);
    preferences = v8->_preferences;
    v8->_preferences = v18;

    v20 = objc_alloc_init(VSTopShelfPurger);
    topShelfPurger = v8->_topShelfPurger;
    v8->_topShelfPurger = v20;

    v22 = (VSOptional *)objc_alloc_init(MEMORY[0x263F1E250]);
    currentRequest = v8->_currentRequest;
    v8->_currentRequest = v22;

    v24 = (VSOptional *)objc_alloc_init(MEMORY[0x263F1E250]);
    currentRequestID = v8->_currentRequestID;
    v8->_currentRequestID = v24;

    v26 = (UINavigationController *)objc_alloc_init(MEMORY[0x263F1C7F8]);
    navController = v8->_navController;
    v8->_navController = v26;

    [(VSViewServiceViewController *)v8 addChildViewController:v8->_navController];
    v28 = [(UINavigationController *)v8->_navController view];
    v29 = [(VSViewServiceViewController *)v8 view];
    [v29 bounds];
    objc_msgSend(v28, "setFrame:");
    [v29 addSubview:v28];
    [v28 setAutoresizingMask:18];
    [(UINavigationController *)v8->_navController didMoveToParentViewController:v8];
  }
  return v8;
}

- (void)dealloc
{
  VSRequireMainThread();
  v3.receiver = self;
  v3.super_class = (Class)VSViewServiceViewController;
  [(VSViewServiceViewController *)&v3 dealloc];
}

+ (id)_exportedInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26F3A1D38];
}

+ (id)_remoteViewControllerInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26F3C7CE8];
}

- (void)_willAppearInRemoteViewController
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  objc_super v3 = [(VSViewServiceViewController *)self _hostApplicationBundleIdentifier];
  v4 = VSDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 2112;
    v10 = v3;
    id v5 = v8;
    _os_log_impl(&dword_23F9AB000, v4, OS_LOG_TYPE_DEFAULT, "%@: Appearing in client: %@", buf, 0x16u);
  }
  v6.receiver = self;
  v6.super_class = (Class)VSViewServiceViewController;
  [(VSViewServiceViewController *)&v6 _willAppearInRemoteViewController];
}

- (void)_performRequest:(id)a3 withIdentifier:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = VSDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl(&dword_23F9AB000, v8, OS_LOG_TYPE_DEFAULT, "Received view service request: %@", buf, 0xCu);
  }

  __int16 v9 = [(VSViewServiceViewController *)self storage];
  v10 = [v9 accountStore];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke;
  v13[3] = &unk_265077918;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [v10 fetchAccountsWithCompletionHandler:v13];
}

void __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke_2;
  v7[3] = &unk_2650778F0;
  v4 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v4;
  id v9 = *(id *)(a1 + 48);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke_7;
  v5[3] = &unk_265077658;
  v5[4] = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 48);
  [a2 unwrapObject:v7 error:v5];
}

void __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  v4 = [a1[4] _hostApplicationBundleIdentifier];
  memset(v35, 0, sizeof(v35));
  id v5 = a1[4];
  if (v5) {
    [v5 _hostAuditToken];
  }
  id v6 = objc_alloc_init(MEMORY[0x263F1E1C8]);
  [v6 setBundleIdentifier:v4];
  id v7 = [MEMORY[0x263EFF8F8] dataWithBytes:v35 length:32];
  [v6 setTokenBytes:v7];

  [a1[4] setAuditToken:v6];
  id v8 = objc_alloc_init(VSViewServiceRequestPreparationOperation);
  id v9 = [a1[4] restrictionsCenter];
  -[VSViewServiceRequestPreparationOperation setAccountModificationAllowed:](v8, "setAccountModificationAllowed:", [v9 isAcountModificationAllowed]);

  id v10 = a1[4];
  if (v10) {
    [v10 _hostAuditToken];
  }
  else {
    memset(v34, 0, sizeof(v34));
  }
  [(VSViewServiceRequestPreparationOperation *)v8 setHostAuditToken:v34];
  -[VSViewServiceRequestPreparationOperation setHostProcessIdentifier:](v8, "setHostProcessIdentifier:", [a1[4] _hostProcessIdentifier]);
  [(VSViewServiceRequestPreparationOperation *)v8 setAuditToken:v6];
  id v11 = (void *)MEMORY[0x263F1E250];
  id v12 = [v3 firstObject];
  v13 = [v11 optionalWithObject:v12];
  [(VSViewServiceRequestPreparationOperation *)v8 setCurrentAccount:v13];

  -[VSViewServiceRequestPreparationOperation setRequestAllowsPrivacyUI:](v8, "setRequestAllowsPrivacyUI:", [a1[5] allowsPrivacyUI]);
  -[VSViewServiceRequestPreparationOperation setRequestRequiresPrivacyUI:](v8, "setRequestRequiresPrivacyUI:", [a1[5] requiresPrivacyUI]);
  id v14 = [a1[5] supportedIdentityProviderIdentifiers];
  [(VSViewServiceRequestPreparationOperation *)v8 setSupportedIdentityProviderIdentifiers:v14];

  id v15 = [a1[5] featuredIdentityProviderIdentifiers];
  [(VSViewServiceRequestPreparationOperation *)v8 setFeaturedIdentityProviderIdentifiers:v15];

  uint64_t v16 = [a1[5] applicationAccountProviders];
  [(VSViewServiceRequestPreparationOperation *)v8 setApplicationAccountProviders:v16];

  -[VSViewServiceRequestPreparationOperation setShouldInferFeaturedProviders:](v8, "setShouldInferFeaturedProviders:", [a1[5] shouldInferFeaturedProviders]);
  -[VSViewServiceRequestPreparationOperation setShouldReturnErrorOnTVProviderFeatureUnsupportedByStorefront:](v8, "setShouldReturnErrorOnTVProviderFeatureUnsupportedByStorefront:", [a1[5] shouldReturnErrorOnTVProviderFeatureUnsupportedByStorefront]);
  id v17 = [a1[5] supportedIdentityProviderIdentifiers];
  if ([v17 count]) {
    int v18 = 0;
  }
  else {
    int v18 = [a1[5] allowsAuthenticationUI];
  }

  v19 = [a1[4] privateQueue];
  if (v18)
  {
    id v20 = objc_alloc_init(MEMORY[0x263F1E2A0]);
    v21 = objc_alloc_init(VSAMSStorefrontFetchAllOperation);
    id v22 = v20;
    [(VSViewServiceRequestPreparationOperation *)v8 addDependency:v22];
    [(VSViewServiceRequestPreparationOperation *)v8 addDependency:v21];
    [v19 addOperation:v22];

    [v19 addOperation:v21];
  }
  else
  {
    v21 = 0;
    id v22 = 0;
  }
  v28 = v22;
  v29 = v21;
  id v30 = a1[6];
  objc_super v31 = v8;
  id v32 = a1[5];
  v33 = v3;
  id v23 = v3;
  v24 = v8;
  v25 = v21;
  id v26 = v22;
  v27 = VSMainThreadOperationWithBlock();
  [v27 addDependency:v24];
  [v19 addOperation:v24];
  VSEnqueueCompletionOperation();
}

void __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke_3(uint64_t a1)
{
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__3;
  v31[4] = __Block_byref_object_dispose__3;
  id v32 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__3;
  v29[4] = __Block_byref_object_dispose__3;
  id v30 = 0;
  v2 = *(void **)(a1 + 32);
  if (v2 && *(void *)(a1 + 40))
  {
    id v3 = v2;
    v4 = [v3 result];
    id v5 = [v4 forceUnwrapObject];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke_82;
    v28[3] = &unk_2650771C8;
    v28[4] = v31;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke_2_84;
    v26[3] = &unk_265077658;
    id v6 = *(void **)(a1 + 56);
    v26[4] = *(void *)(a1 + 48);
    id v27 = v6;
    [v5 unwrapObject:v28 error:v26];

    id v7 = *(void **)(a1 + 40);
    if (!v7)
    {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The fetchAllSfOperationOrNil parameter must not be nil."];
      id v7 = *(void **)(a1 + 40);
    }
    id v8 = v7;
    id v9 = [v8 result];
    id v10 = [v9 forceUnwrapObject];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke_3_89;
    v25[3] = &unk_265077878;
    v25[4] = v29;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke_4;
    v23[3] = &unk_265077658;
    id v11 = *(void **)(a1 + 56);
    v23[4] = *(void *)(a1 + 48);
    id v24 = v11;
    [v10 unwrapObject:v25 error:v23];
  }
  id v12 = [*(id *)(a1 + 64) result];
  v13 = [v12 forceUnwrapObject];

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke_5;
  v17[3] = &unk_2650778A0;
  v17[4] = *(void *)(a1 + 48);
  id v18 = *(id *)(a1 + 72);
  id v19 = *(id *)(a1 + 56);
  id v20 = *(id *)(a1 + 80);
  v21 = v31;
  id v22 = v29;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke_6;
  v15[3] = &unk_265077658;
  id v14 = *(void **)(a1 + 56);
  v15[4] = *(void *)(a1 + 48);
  id v16 = v14;
  [v13 unwrapObject:v17 error:v15];

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);
}

void __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke_82(uint64_t a1, void *a2)
{
}

uint64_t __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke_2_84(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _request:*(void *)(a1 + 40) didFailWithError:a2];
}

void __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke_3_89(uint64_t a1, void *a2)
{
}

uint64_t __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _request:*(void *)(a1 + 40) didFailWithError:a2];
}

uint64_t __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _performRequestInternal:*(void *)(a1 + 40) withID:*(void *)(a1 + 48) identityProviders:a2 accounts:*(void *)(a1 + 56) currentStorefrontCode:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) allStorefronts:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
}

uint64_t __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _request:*(void *)(a1 + 40) didFailWithError:a2];
}

void __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = VSErrorLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke_7_cold_1();
  }

  id v6 = *(id *)(a1 + 40);
  id v7 = v3;
  id v5 = v3;
  VSPerformCompletionHandler();
}

void __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke_92(uint64_t a1)
{
  id v2 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  VSPerformBlockOnMainThread();
}

uint64_t __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke_2_93(uint64_t a1)
{
  return [*(id *)(a1 + 32) _request:*(void *)(a1 + 40) didFailWithError:*(void *)(a1 + 48)];
}

- (void)setCurrentRequest:(id)a3
{
  v4 = (VSOptional *)a3;
  if (self->_currentRequest != v4)
  {
    id v5 = [(VSViewServiceViewController *)self _hostApplicationBundleIdentifier];
    id v6 = objc_msgSend(MEMORY[0x263F01878], "vs_applicationRecordWithBundleIdentifier:", v5);
    uint64_t v23 = 0;
    id v24 = &v23;
    uint64_t v25 = 0x3032000000;
    id v26 = __Block_byref_object_copy__3;
    id v27 = __Block_byref_object_dispose__3;
    id v28 = 0;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __49__VSViewServiceViewController_setCurrentRequest___block_invoke;
    v22[3] = &unk_265077940;
    v22[4] = &v23;
    [(VSOptional *)v4 conditionallyUnwrapObject:v22];
    id v7 = [v6 localizedName];
    if (v7)
    {
      id v8 = [v6 localizedName];

      if (!v8) {
        [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The [appRecordOrNil localizedName] parameter must not be nil."];
      }
      id v9 = [v6 localizedName];
    }
    else
    {
      id v9 = &stru_26F361E90;
    }

    id v10 = (void *)v24[5];
    id v11 = (void *)MEMORY[0x263F1E250];
    id v12 = (void *)[(__CFString *)v9 copy];
    v13 = [v11 optionalWithObject:v12];
    [v10 setRequestingAppDisplayName:v13];

    id v14 = NSNumber;
    id v15 = [v6 iTunesMetadata];
    id v16 = objc_msgSend(v14, "numberWithUnsignedLongLong:", objc_msgSend(v15, "storeItemIdentifier"));

    id v17 = [v16 stringValue];
    [(id)v24[5] setRequestingAppAdamID:v17];
    id v18 = (void *)MEMORY[0x263F1E250];
    id v19 = (void *)[(id)v24[5] copy];
    id v20 = [v18 optionalWithObject:v19];
    currentRequest = self->_currentRequest;
    self->_currentRequest = v20;

    _Block_object_dispose(&v23, 8);
  }
}

uint64_t __49__VSViewServiceViewController_setCurrentRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x270F9A758](v3, v5);
}

- (void)_performRequestInternal:(id)a3 withID:(id)a4 identityProviders:(id)a5 accounts:(id)a6 currentStorefrontCode:(id)a7 allStorefronts:(id)a8
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v53 = a6;
  id v50 = a7;
  id v51 = a8;
  if (v14)
  {
    if (v15) {
      goto LABEL_3;
    }
  }
  else
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The request parameter must not be nil."];
    if (v15) {
      goto LABEL_3;
    }
  }
  [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The requestID parameter must not be nil."];
LABEL_3:
  v52 = v15;
  if (!v16) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The identityProviders parameter must not be nil."];
  }
  id v17 = [MEMORY[0x263F1E250] optionalWithObject:v14];
  [(VSViewServiceViewController *)self setCurrentRequest:v17];

  id v18 = (void *)MEMORY[0x263F1E250];
  id v19 = (void *)[v15 copy];
  id v20 = [v18 optionalWithObject:v19];
  [(VSViewServiceViewController *)self setCurrentRequestID:v20];

  [(VSViewServiceViewController *)self setDidAuthenticateAccount:0];
  [(VSViewServiceViewController *)self setIdentityProviderPickerRequired:0];
  v21 = [v14 accountMetadataRequest];
  id v22 = v21;
  if (!v21)
  {
    id v27 = objc_alloc_init(MEMORY[0x263F1E2F0]);
    [(VSViewServiceViewController *)self _completeRequestWithResponse:v27];

    goto LABEL_42;
  }
  uint64_t v23 = [v21 accountProviderAuthenticationToken];

  if (v23)
  {
    id v24 = VSDefaultLogObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_23F9AB000, v24, OS_LOG_TYPE_DEFAULT, "Request has account provider authentication token.", (uint8_t *)&buf, 2u);
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v58 = 0x2020000000;
    char v59 = 0;
    if ([v53 count])
    {
      uint64_t v25 = [v53 objectAtIndex:0];
      id v26 = [v25 authenticationToken];
      v56[0] = MEMORY[0x263EF8330];
      v56[1] = 3221225472;
      v56[2] = __126__VSViewServiceViewController__performRequestInternal_withID_identityProviders_accounts_currentStorefrontCode_allStorefronts___block_invoke;
      v56[3] = &unk_265077968;
      v56[4] = &buf;
      [v26 conditionallyUnwrapObject:v56];

      if (!*(unsigned char *)(*((void *)&buf + 1) + 24)) {
        goto LABEL_18;
      }
    }
    else
    {
      *(unsigned char *)(*((void *)&buf + 1) + 24) = 1;
    }
    if ([v14 allowsAuthenticationUI] && objc_msgSend(v16, "count") == 1)
    {
LABEL_21:
      _Block_object_dispose(&buf, 8);
      goto LABEL_22;
    }
LABEL_18:
    id v28 = VSErrorLogObject();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[VSViewServiceViewController _performRequestInternal:withID:identityProviders:accounts:currentStorefrontCode:allStorefronts:]();
    }

    v29 = VSPublicError();
    [(VSViewServiceViewController *)self _requestDidFailWithError:v29];

    goto LABEL_21;
  }
LABEL_22:
  if ([v53 count])
  {
    v49 = [v53 objectAtIndex:0];
    id v30 = [v49 identityProviderID];
    objc_super v31 = [v30 forceUnwrapObject];

    v54[0] = MEMORY[0x263EF8330];
    v54[1] = 3221225472;
    v54[2] = __126__VSViewServiceViewController__performRequestInternal_withID_identityProviders_accounts_currentStorefrontCode_allStorefronts___block_invoke_114;
    v54[3] = &unk_265077990;
    id v32 = v31;
    id v55 = v32;
    uint64_t v33 = [v16 indexOfObjectPassingTest:v54];
    if (v33 == 0x7FFFFFFFFFFFFFFFLL) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Current provider not included among providers."];
    }
    v34 = [v16 objectAtIndex:v33];
    v35 = [v14 supportedAccountProviderAuthenticationSchemes];
    int v36 = [v34 isFullySupportedForRequestsExpectingAuthenticationSchemes:v35];

    if (v36)
    {
      [(VSViewServiceViewController *)self _performRequestWithIdentityProvider:v34 account:v49];
    }
    else
    {
      v41 = VSDefaultLogObject();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v34;
        _os_log_impl(&dword_23F9AB000, v41, OS_LOG_TYPE_DEFAULT, "Identity provider %@ is not supported.", (uint8_t *)&buf, 0xCu);
      }

      v42 = [v34 providerID];
      v43 = [v42 forceUnwrapObject];

      v44 = VSPublicUnsupportedProviderError();
      if (([v34 isDeveloper] & 1) == 0)
      {
        v45 = (void *)MEMORY[0x263F1E240];
        v46 = [(VSViewServiceViewController *)self _hostApplicationBundleIdentifier];
        [v45 recordMetadataRequestWithProviderIdentifier:v43 channelAdamID:v46 fulfilledByProvider:0 error:v44];
      }
      [(VSViewServiceViewController *)self _requestDidFailWithError:v44];
    }
  }
  else if ([v14 allowsAuthenticationUI])
  {
    if ([v16 count] == 1)
    {
      v37 = VSDefaultLogObject();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_23F9AB000, v37, OS_LOG_TYPE_DEFAULT, "Will skip identity provider picker due to single provider.", (uint8_t *)&buf, 2u);
      }

      v38 = [v16 firstObject];
      BOOL v39 = v38 == 0;

      if (v39) {
        [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The [identityProviders firstObject] parameter must not be nil."];
      }
      v40 = [v16 firstObject];
      [(VSViewServiceViewController *)self _didDetermineIdentityProvider:v40 withPickerViewController:0];
    }
    else
    {
      [(VSViewServiceViewController *)self setIdentityProviderPickerRequired:1];
      [(VSViewServiceViewController *)self _showIdentityProviderPickerViewControllerWithIdentityProviders:v16 currentStorefrontCode:v50 allStorefronts:v51];
    }
  }
  else
  {
    id v47 = objc_alloc_init(MEMORY[0x263F1E2F0]);
    id v48 = objc_alloc_init(MEMORY[0x263F1E190]);
    [v47 setAccountMetadata:v48];

    [(VSViewServiceViewController *)self _completeRequestWithResponse:v47];
  }
LABEL_42:
}

uint64_t __126__VSViewServiceViewController__performRequestInternal_withID_identityProviders_accounts_currentStorefrontCode_allStorefronts___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isFromUnsupportedProvider];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __126__VSViewServiceViewController__performRequestInternal_withID_identityProviders_accounts_currentStorefrontCode_allStorefronts___block_invoke_114(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = [a2 providerID];
  id v7 = [v6 forceUnwrapObject];
  uint64_t v8 = [v5 isEqual:v7];

  if (v8) {
    *a4 = 1;
  }
  return v8;
}

- (id)_identityProviderRequestForViewServiceRequest:(id)a3 withAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__3;
  id v19 = __Block_byref_object_dispose__3;
  id v20 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __89__VSViewServiceViewController__identityProviderRequestForViewServiceRequest_withAccount___block_invoke;
  v11[3] = &unk_2650779B8;
  id v14 = &v15;
  id v8 = v7;
  id v12 = v8;
  v13 = self;
  [v6 conditionallyUnwrapObject:v11 otherwise:&__block_literal_global_12];
  id v9 = [MEMORY[0x263F1E250] optionalWithObject:v16[5]];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __89__VSViewServiceViewController__identityProviderRequestForViewServiceRequest_withAccount___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 requestingAppDisplayName];
  id v13 = [v4 forceUnwrapObject];

  uint64_t v5 = [v3 requestingAppAdamID];
  id v6 = [v3 accountProviderAuthenticationToken];
  id v7 = [v3 accountMetadataRequest];

  if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = [*(id *)(a1 + 40) storage];
    uint64_t v10 = +[VSIdentityProviderRequest accountMetadataRequestWithAccount:v8 storage:v9 accountMetadataRequest:v7 requestingAppDisplayName:v13 requestingAppAdamID:v5 accountProviderAuthenticationToken:v6];
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

void __89__VSViewServiceViewController__identityProviderRequestForViewServiceRequest_withAccount___block_invoke_2()
{
  v0 = VSDefaultLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_23F9AB000, v0, OS_LOG_TYPE_DEFAULT, "No view service request to use to construct identity provider request.", v1, 2u);
  }
}

- (void)_determinePreAuthAppIsAuthorized:(id)a3 completion:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  if ([v6 isDeveloper])
  {
    v7[2](v7, 1, 0);
  }
  else
  {
    uint64_t v8 = [v6 nonChannelAppDescriptions];
    if ([v8 count])
    {
      id v28 = v6;
      id v9 = (uint64_t *)MEMORY[0x263EFF4A0];
      if (!v8) {
        [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The providerAppDescriptionsOrNil parameter must not be nil."];
      }
      id v27 = v8;
      id v10 = v8;
      uint64_t v11 = [(VSViewServiceViewController *)self _hostApplicationBundleIdentifier];
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v12 = v10;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v30;
        uint64_t v16 = *v9;
        while (2)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v30 != v15) {
              objc_enumerationMutation(v12);
            }
            id v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            uint64_t v19 = objc_msgSend(v18, "bundleID", v27);
            if (v19)
            {
              id v20 = (void *)v19;
              v21 = [v18 bundleID];

              if (!v21) {
                [MEMORY[0x263EFF940] raise:v16 format:@"The [description bundleID] parameter must not be nil."];
              }
              id v22 = [v18 bundleID];
              char v23 = [v11 isEqualToString:v22];

              if (v23)
              {

                id v24 = VSDefaultLogObject();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)long long buf = 0;
                  _os_log_impl(&dword_23F9AB000, v24, OS_LOG_TYPE_DEFAULT, "Requesting app is an identity provider app, can allow pre-auth.", buf, 2u);
                }
                uint64_t v25 = 1;
                goto LABEL_26;
              }
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v34 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }

      id v24 = VSErrorLogObject();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[VSViewServiceViewController _determinePreAuthAppIsAuthorized:completion:]();
      }
      uint64_t v25 = 0;
LABEL_26:
      uint64_t v8 = v27;
      id v6 = v28;

      v7[2](v7, v25, 0);
    }
    else
    {
      id v26 = VSDefaultLogObject();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_23F9AB000, v26, OS_LOG_TYPE_DEFAULT, "Identity provider has no apps, will reject any pre-auth requests.", buf, 2u);
      }

      v7[2](v7, 0, 0);
    }
  }
}

- (void)_performRequestWithIdentityProvider:(id)a3 account:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(VSViewServiceViewController *)self currentRequest];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __75__VSViewServiceViewController__performRequestWithIdentityProvider_account___block_invoke;
  v11[3] = &unk_265077A30;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 conditionallyUnwrapObject:v11 otherwise:&__block_literal_global_145];
}

void __75__VSViewServiceViewController__performRequestWithIdentityProvider_account___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75__VSViewServiceViewController__performRequestWithIdentityProvider_account___block_invoke_2;
  v7[3] = &unk_265077A08;
  id v8 = v3;
  id v9 = v5;
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 40);
  id v6 = v3;
  [v5 _determinePreAuthAppIsAuthorized:v4 completion:v7];
}

void __75__VSViewServiceViewController__performRequestWithIdentityProvider_account___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = VSErrorLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __75__VSViewServiceViewController__performRequestWithIdentityProvider_account___block_invoke_2_cold_2();
    }
  }
  else
  {
    if (![*(id *)(a1 + 32) isPreAuthRequest] || (a2 & 1) != 0)
    {
      id v8 = *(void **)(a1 + 40);
      id v9 = [v8 currentRequest];
      id v7 = [v8 _identityProviderRequestForViewServiceRequest:v9 withAccount:*(void *)(a1 + 48)];

      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __75__VSViewServiceViewController__performRequestWithIdentityProvider_account___block_invoke_135;
      v12[3] = &unk_2650779E0;
      id v10 = *(id *)(a1 + 56);
      uint64_t v11 = *(void *)(a1 + 40);
      id v13 = v10;
      uint64_t v14 = v11;
      [v7 conditionallyUnwrapObject:v12 otherwise:&__block_literal_global_141];

      goto LABEL_10;
    }
    id v6 = VSErrorLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __75__VSViewServiceViewController__performRequestWithIdentityProvider_account___block_invoke_2_cold_1();
    }
  }

  id v7 = VSPublicError();
  [*(id *)(a1 + 40) _requestDidFailWithError:v7];
LABEL_10:
}

void __75__VSViewServiceViewController__performRequestWithIdentityProvider_account___block_invoke_135(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [[VSIdentityProviderViewController alloc] initWithIdentityProvider:*(void *)(a1 + 32)];
  [(VSIdentityProviderViewController *)v4 setDelegate:*(void *)(a1 + 40)];
  id v5 = [*(id *)(a1 + 40) auditToken];
  [(VSIdentityProviderViewController *)v4 setAuditToken:v5];

  -[VSIdentityProviderViewController setCancellationAllowed:](v4, "setCancellationAllowed:", [*(id *)(a1 + 40) isIdentityProviderPickerRequired] ^ 1);
  [(VSIdentityProviderViewController *)v4 enqueueRequest:v3];

  LODWORD(v3) = [*(id *)(a1 + 40) isIdentityProviderPickerRequired];
  id v6 = [*(id *)(a1 + 40) navController];
  id v7 = v6;
  if (v3)
  {
    [v6 pushViewController:v4 animated:1];
  }
  else
  {
    v9[0] = v4;
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
    [v7 setViewControllers:v8];
  }
}

void __75__VSViewServiceViewController__performRequestWithIdentityProvider_account___block_invoke_2_139()
{
  v0 = VSDefaultLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_23F9AB000, v0, OS_LOG_TYPE_DEFAULT, "No identity provider request to submit.", v1, 2u);
  }
}

void __75__VSViewServiceViewController__performRequestWithIdentityProvider_account___block_invoke_143()
{
  v0 = VSErrorLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __75__VSViewServiceViewController__performRequestWithIdentityProvider_account___block_invoke_143_cold_1();
  }
}

- (void)_showIdentityProviderPickerViewControllerWithIdentityProviders:(id)a3 currentStorefrontCode:(id)a4 allStorefronts:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = +[VSViewControllerFactory sharedFactory];
  id v12 = [v11 identityProviderPickerViewControllerWithIdentityProviders:v10];

  id v13 = [v12 forceUnwrapObject];

  [v13 setCancellationAllowed:1];
  [v13 setDelegate:self];
  uint64_t v14 = [v13 navigationItem];
  uint64_t v15 = [v13 searchController];
  [v14 setSearchController:v15];

  uint64_t v16 = [(VSViewServiceViewController *)self currentRequest];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __131__VSViewServiceViewController__showIdentityProviderPickerViewControllerWithIdentityProviders_currentStorefrontCode_allStorefronts___block_invoke;
  v20[3] = &unk_265077A58;
  id v21 = v13;
  id v22 = v9;
  id v23 = v8;
  id v24 = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v13;
  [v16 conditionallyUnwrapObject:v20 otherwise:&__block_literal_global_148];
}

void __131__VSViewServiceViewController__showIdentityProviderPickerViewControllerWithIdentityProviders_currentStorefrontCode_allStorefronts___block_invoke(uint64_t a1, void *a2)
{
  v16[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 requestingAppDisplayName];
  id v5 = [v4 forceUnwrapObject];

  id v6 = *(void **)(a1 + 32);
  id v7 = (void *)[v5 copy];
  [v6 setRequestingAppDisplayName:v7];

  id v8 = [v3 localizedVideoTitle];
  [*(id *)(a1 + 32) setResourceTitle:v8];
  if (*(void *)(a1 + 40) && *(void *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "setAllStorefronts:");
  }
  else
  {
    id v9 = [v3 accountMetadataRequest];
    id v10 = [v9 applicationAccountProviders];
    uint64_t v11 = [v10 count];

    [*(id *)(a1 + 32) setAdditionalProvidersMode:v11 == 0];
  }
  id v12 = [v3 supportedIdentityProviderIdentifiers];
  BOOL v13 = [v12 count] == 0;

  [*(id *)(a1 + 32) setRequestedStorefrontCountryCode:*(void *)(a1 + 48) defaultToDeveloperProviders:v13];
  uint64_t v14 = [*(id *)(a1 + 56) navController];
  v16[0] = *(void *)(a1 + 32);
  uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  [v14 setViewControllers:v15];

  [*(id *)(a1 + 56) _presentInHostIfNecessary];
}

void __131__VSViewServiceViewController__showIdentityProviderPickerViewControllerWithIdentityProviders_currentStorefrontCode_allStorefronts___block_invoke_2()
{
  v0 = VSDefaultLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_23F9AB000, v0, OS_LOG_TYPE_DEFAULT, "No current request to show picker.", v1, 2u);
  }
}

- (void)_didDetermineIdentityProvider:(id)a3 withPickerViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(VSViewServiceViewController *)self currentRequest];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __86__VSViewServiceViewController__didDetermineIdentityProvider_withPickerViewController___block_invoke;
  v11[3] = &unk_265077A30;
  id v12 = v6;
  BOOL v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 conditionallyUnwrapObject:v11 otherwise:&__block_literal_global_157];
}

void __86__VSViewServiceViewController__didDetermineIdentityProvider_withPickerViewController___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 supportedAccountProviderAuthenticationSchemes];
  if ([*(id *)(a1 + 32) isFullySupportedForRequestsExpectingAuthenticationSchemes:v4])
  {
    if ([v3 canVetoAuthentication])
    {
      id v5 = [*(id *)(a1 + 32) providerID];
      id v6 = [v5 forceUnwrapObject];

      id v7 = [*(id *)(a1 + 40) _viewControllerHost];
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __86__VSViewServiceViewController__didDetermineIdentityProvider_withPickerViewController___block_invoke_2;
      v32[3] = &unk_265077A80;
      int8x16_t v26 = *(int8x16_t *)(a1 + 32);
      id v8 = (id)v26.i64[0];
      int8x16_t v33 = vextq_s8(v26, v26, 8uLL);
      id v34 = v6;
      id v9 = v6;
      [v7 _didChooseProviderWithIdentifier:v9 vetoHandler:v32];
    }
    else
    {
      [*(id *)(a1 + 40) _performRequestWithIdentityProvider:*(void *)(a1 + 32) account:0];
    }
  }
  else
  {
    id v10 = VSDefaultLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v36 = v11;
      _os_log_impl(&dword_23F9AB000, v10, OS_LOG_TYPE_DEFAULT, "Identity provider %@ is not supported.", buf, 0xCu);
    }

    if ([*(id *)(a1 + 32) isApplication])
    {
      id v12 = [*(id *)(a1 + 32) providerID];
      BOOL v13 = [v12 forceUnwrapObject];
      id v14 = VSPublicUnsupportedProviderError();

      [*(id *)(a1 + 40) _requestDidFailWithError:v14];
    }
    else
    {
      uint64_t v15 = [v3 requestingAppDisplayName];
      uint64_t v16 = [v15 forceUnwrapObject];

      id v17 = +[VSViewControllerFactory sharedFactory];
      uint64_t v18 = *(void *)(a1 + 32);
      id v19 = [*(id *)(a1 + 40) storage];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __86__VSViewServiceViewController__didDetermineIdentityProvider_withPickerViewController___block_invoke_150;
      v27[3] = &unk_265077AA8;
      id v28 = *(id *)(a1 + 32);
      id v20 = v4;
      uint64_t v21 = *(void *)(a1 + 40);
      id v22 = *(void **)(a1 + 48);
      id v29 = v20;
      uint64_t v30 = v21;
      id v31 = v22;
      id v23 = [v17 viewControllerForUnsupportedProvider:v18 withRequestingAppDisplayName:v16 storage:v19 acknowledgementHandler:v27];

      id v24 = *(void **)(a1 + 40);
      uint64_t v25 = [v23 forceUnwrapObject];
      [v24 presentViewController:v25 animated:1 completion:0];
    }
  }
}

void __86__VSViewServiceViewController__didDetermineIdentityProvider_withPickerViewController___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    [v3 _performRequestWithIdentityProvider:v4 account:0];
  }
  else
  {
    VSPublicUnsupportedProviderError();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) _requestDidFailWithError:v5];
  }
}

void __86__VSViewServiceViewController__didDetermineIdentityProvider_withPickerViewController___block_invoke_150(uint64_t a1, void *a2)
{
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __86__VSViewServiceViewController__didDetermineIdentityProvider_withPickerViewController___block_invoke_2_151;
  v8[3] = &unk_265077918;
  id v9 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v10 = v4;
  uint64_t v11 = v5;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __86__VSViewServiceViewController__didDetermineIdentityProvider_withPickerViewController___block_invoke_153;
  v6[3] = &unk_265076A18;
  id v7 = *(id *)(a1 + 56);
  [a2 conditionallyUnwrapObject:v8 otherwise:v6];
}

void __86__VSViewServiceViewController__didDetermineIdentityProvider_withPickerViewController___block_invoke_2_151(uint64_t a1, void *a2)
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __86__VSViewServiceViewController__didDetermineIdentityProvider_withPickerViewController___block_invoke_3;
  v7[3] = &unk_2650778F0;
  id v8 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v9 = v4;
  uint64_t v10 = v5;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __86__VSViewServiceViewController__didDetermineIdentityProvider_withPickerViewController___block_invoke_152;
  v6[3] = &unk_265076EB8;
  void v6[4] = v5;
  [a2 unwrapObject:v7 error:v6];
}

void __86__VSViewServiceViewController__didDetermineIdentityProvider_withPickerViewController___block_invoke_3(uint64_t a1)
{
  id v2 = VSDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_23F9AB000, v2, OS_LOG_TYPE_DEFAULT, "Successfully saved unsupported provider.", v7, 2u);
  }

  id v3 = [*(id *)(a1 + 32) providerID];
  id v4 = [v3 forceUnwrapObject];

  if ([*(id *)(a1 + 32) supportsRequestsExpectingAuthenticationSchemes:*(void *)(a1 + 40)])
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = VSPrivateError();
  }
  id v6 = VSPublicUnsupportedProviderError();
  [*(id *)(a1 + 48) _requestDidFailWithError:v6];
}

void __86__VSViewServiceViewController__didDetermineIdentityProvider_withPickerViewController___block_invoke_152(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = VSDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_23F9AB000, v4, OS_LOG_TYPE_DEFAULT, "Failed: %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 32) _requestDidFailWithError:v3];
}

void *__86__VSViewServiceViewController__didDetermineIdentityProvider_withPickerViewController___block_invoke_153(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result) {
    return (void *)[result deselectSelectedProviderAnimated:1];
  }
  return result;
}

void __86__VSViewServiceViewController__didDetermineIdentityProvider_withPickerViewController___block_invoke_2_155()
{
  v0 = VSDefaultLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_23F9AB000, v0, OS_LOG_TYPE_DEFAULT, "No request for which to pick providers.", v1, 2u);
  }
}

- (void)_presentInHostIfNecessary
{
  if (![(VSViewServiceViewController *)self isPresentedInHost])
  {
    [(VSViewServiceViewController *)self setPresentedInHost:1];
    id v3 = VSDefaultLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_23F9AB000, v3, OS_LOG_TYPE_DEFAULT, "Will present in host", buf, 2u);
    }

    id v4 = [(VSViewServiceViewController *)self _viewControllerHost];
    [v4 _presentViewController];

    int v5 = VSDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_23F9AB000, v5, OS_LOG_TYPE_DEFAULT, "Did present in host", v6, 2u);
    }

    [MEMORY[0x263F1E240] recordEnterEventWithPage:*MEMORY[0x263F1E478] pageType:*MEMORY[0x263F1E470]];
  }
}

- (void)_dismissInHostIfNecessary
{
  if ([(VSViewServiceViewController *)self isPresentedInHost])
  {
    [(VSViewServiceViewController *)self setPresentedInHost:0];
    id v3 = VSDefaultLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_23F9AB000, v3, OS_LOG_TYPE_DEFAULT, "Will dismiss in host", buf, 2u);
    }

    id v4 = [(VSViewServiceViewController *)self _viewControllerHost];
    [v4 _dismissViewController];

    int v5 = VSDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_23F9AB000, v5, OS_LOG_TYPE_DEFAULT, "Did dismiss in host", v6, 2u);
    }

    [MEMORY[0x263F1E240] recordExitEventWithPage:*MEMORY[0x263F1E478] pageType:*MEMORY[0x263F1E470]];
  }
}

- (void)_request:(id)a3 didFailWithError:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(v7, "vs_secureCodingSafeError");
  id v9 = VSDefaultLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_23F9AB000, v9, OS_LOG_TYPE_DEFAULT, "Will fail request %@ in host with error: %@", (uint8_t *)&v12, 0x16u);
  }

  uint64_t v10 = [(VSViewServiceViewController *)self _viewControllerHost];
  [v10 _request:v6 didFailWithError:v8];

  uint64_t v11 = VSDefaultLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl(&dword_23F9AB000, v11, OS_LOG_TYPE_DEFAULT, "Did fail in host", (uint8_t *)&v12, 2u);
  }
}

- (void)_requestDidFailWithError:(id)a3
{
  id v4 = a3;
  int v5 = [(VSViewServiceViewController *)self currentRequestID];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__VSViewServiceViewController__requestDidFailWithError___block_invoke;
  v7[3] = &unk_2650769F0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 conditionallyUnwrapObject:v7 otherwise:&__block_literal_global_160];
}

void __56__VSViewServiceViewController__requestDidFailWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _request:a2 didFailWithError:*(void *)(a1 + 40)];
  id v3 = *(void **)(a1 + 32);
  id v4 = objc_alloc_init(MEMORY[0x263F1E250]);
  [v3 setCurrentRequest:v4];

  int v5 = *(void **)(a1 + 32);
  id v6 = objc_alloc_init(MEMORY[0x263F1E250]);
  [v5 setCurrentRequestID:v6];
}

void __56__VSViewServiceViewController__requestDidFailWithError___block_invoke_2()
{
  v0 = VSDefaultLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_23F9AB000, v0, OS_LOG_TYPE_DEFAULT, "No request to fail.", v1, 2u);
  }
}

- (void)_didCancelRequest
{
  id v3 = [(VSViewServiceViewController *)self currentRequestID];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __48__VSViewServiceViewController__didCancelRequest__block_invoke;
  v4[3] = &unk_265077AD0;
  v4[4] = self;
  [v3 conditionallyUnwrapObject:v4 otherwise:&__block_literal_global_163];
}

void __48__VSViewServiceViewController__didCancelRequest__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = VSDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v3;
    _os_log_impl(&dword_23F9AB000, v4, OS_LOG_TYPE_DEFAULT, "Will cancel request %@ in host", (uint8_t *)&v11, 0xCu);
  }

  int v5 = [*(id *)(a1 + 32) _viewControllerHost];
  [v5 _didCancelRequest:v3];

  id v6 = VSDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_23F9AB000, v6, OS_LOG_TYPE_DEFAULT, "Did cancel in host", (uint8_t *)&v11, 2u);
  }

  id v7 = *(void **)(a1 + 32);
  id v8 = objc_alloc_init(MEMORY[0x263F1E250]);
  [v7 setCurrentRequest:v8];

  id v9 = *(void **)(a1 + 32);
  id v10 = objc_alloc_init(MEMORY[0x263F1E250]);
  [v9 setCurrentRequestID:v10];
}

void __48__VSViewServiceViewController__didCancelRequest__block_invoke_161()
{
  v0 = VSDefaultLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_23F9AB000, v0, OS_LOG_TYPE_DEFAULT, "No request to cancel.", v1, 2u);
  }
}

- (void)_completeRequestWithResponse:(id)a3 fromIdentityProvider:(id)a4
{
  -[VSViewServiceViewController _viewServiceResponseWithIdentityProviderResponse:](self, "_viewServiceResponseWithIdentityProviderResponse:", a3, a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(VSViewServiceViewController *)self _completeRequestWithResponse:v5];
}

- (void)_completeRequest:(id)a3 withResponse:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(VSViewServiceViewController *)self _dismissInHostIfNecessary];
  id v8 = VSDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl(&dword_23F9AB000, v8, OS_LOG_TYPE_DEFAULT, "Will finish request %@ with response %@", (uint8_t *)&v13, 0x16u);
  }

  id v9 = [(VSViewServiceViewController *)self _viewControllerHost];
  [v9 _request:v6 didFinishWithResponse:v7];

  id v10 = VSDefaultLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_23F9AB000, v10, OS_LOG_TYPE_DEFAULT, "Did finish request in host", (uint8_t *)&v13, 2u);
  }

  id v11 = objc_alloc_init(MEMORY[0x263F1E250]);
  [(VSViewServiceViewController *)self setCurrentRequest:v11];

  id v12 = objc_alloc_init(MEMORY[0x263F1E250]);
  [(VSViewServiceViewController *)self setCurrentRequestID:v12];
}

- (void)_completeRequestWithResponse:(id)a3
{
  id v4 = a3;
  id v5 = [(VSViewServiceViewController *)self currentRequestID];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__VSViewServiceViewController__completeRequestWithResponse___block_invoke;
  v7[3] = &unk_2650769F0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 conditionallyUnwrapObject:v7 otherwise:&__block_literal_global_165];
}

uint64_t __60__VSViewServiceViewController__completeRequestWithResponse___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _completeRequest:a2 withResponse:*(void *)(a1 + 40)];
}

void __60__VSViewServiceViewController__completeRequestWithResponse___block_invoke_2()
{
  v0 = VSDefaultLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_23F9AB000, v0, OS_LOG_TYPE_DEFAULT, "No request to complete.", v1, 2u);
  }
}

- (id)_viewServiceResponseWithIdentityProviderResponse:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F1E2F0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = [v4 accountMetadata];

  [v5 setAccountMetadata:v6];
  return v5;
}

- (void)identityProviderPickerViewController:(id)a3 didPickIdentityProvider:(id)a4
{
  id v6 = (void *)MEMORY[0x263F1E240];
  uint64_t v7 = *MEMORY[0x263F1E468];
  uint64_t v8 = *MEMORY[0x263F1E470];
  uint64_t v9 = *MEMORY[0x263F1E450];
  id v10 = a4;
  id v11 = a3;
  [v6 recordClickEventWithPage:v7 pageType:v8 target:v9];
  [(VSViewServiceViewController *)self _didDetermineIdentityProvider:v10 withPickerViewController:v11];
}

- (void)identityProviderPickerViewControllerDidPickAdditionalIdentityProviders:(id)a3
{
  id v4 = [(VSViewServiceViewController *)self currentRequestID];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __102__VSViewServiceViewController_identityProviderPickerViewControllerDidPickAdditionalIdentityProviders___block_invoke;
  v5[3] = &unk_265077AD0;
  v5[4] = self;
  [v4 conditionallyUnwrapObject:v5 otherwise:&__block_literal_global_168];
}

void __102__VSViewServiceViewController_identityProviderPickerViewControllerDidPickAdditionalIdentityProviders___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = VSDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_23F9AB000, v4, OS_LOG_TYPE_DEFAULT, "Will choose additional providers for request %@", (uint8_t *)&v7, 0xCu);
  }

  id v5 = [*(id *)(a1 + 32) _viewControllerHost];
  [v5 _didChooseAdditionalProvidersForRequest:v3];

  id v6 = VSDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_23F9AB000, v6, OS_LOG_TYPE_DEFAULT, "Did choose additional providers in host", (uint8_t *)&v7, 2u);
  }
}

void __102__VSViewServiceViewController_identityProviderPickerViewControllerDidPickAdditionalIdentityProviders___block_invoke_166()
{
  v0 = VSDefaultLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_23F9AB000, v0, OS_LOG_TYPE_DEFAULT, "No request to choose additional providers.", v1, 2u);
  }
}

- (void)identityProviderViewControllerDidCancel:(id)a3
{
  if ([(VSViewServiceViewController *)self isIdentityProviderPickerRequired])
  {
    id v5 = [(VSViewServiceViewController *)self navController];
    id v4 = (id)[v5 popToRootViewControllerAnimated:1];
  }
  else
  {
    [(VSViewServiceViewController *)self _didCancelRequest];
  }
}

- (void)identityProviderViewController:(id)a3 didFinishRequest:(id)a4 withResult:(id)a5
{
  id v7 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __90__VSViewServiceViewController_identityProviderViewController_didFinishRequest_withResult___block_invoke;
  v10[3] = &unk_265077AF8;
  id v11 = v7;
  id v12 = self;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __90__VSViewServiceViewController_identityProviderViewController_didFinishRequest_withResult___block_invoke_173;
  v9[3] = &unk_265076EB8;
  v9[4] = self;
  id v8 = v7;
  [a5 unwrapObject:v10 error:v9];
}

void __90__VSViewServiceViewController_identityProviderViewController_didFinishRequest_withResult___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) identityProvider];
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v6 = [*(id *)(a1 + 40) currentRequest];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __90__VSViewServiceViewController_identityProviderViewController_didFinishRequest_withResult___block_invoke_2;
  v15[3] = &unk_2650769A0;
  id v7 = v5;
  id v16 = v7;
  [v6 conditionallyUnwrapObject:v15 otherwise:&__block_literal_global_171];

  id v8 = [v3 accountMetadata];
  uint64_t v9 = [v8 accountProviderResponse];
  id v10 = [v9 authenticationScheme];
  if (v10 && ([v7 containsObject:v10] & 1) == 0)
  {
    id v11 = VSPrivateError();
    id v12 = [v4 providerID];
    int v13 = [v12 forceUnwrapObject];

    id v14 = VSPublicUnsupportedProviderError();
    [*(id *)(a1 + 40) _requestDidFailWithError:v14];
  }
  else
  {
    [*(id *)(a1 + 40) _completeRequestWithResponse:v3 fromIdentityProvider:v4];
  }
}

void __90__VSViewServiceViewController_identityProviderViewController_didFinishRequest_withResult___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 supportedAccountProviderAuthenticationSchemes];
  [v2 addObjectsFromArray:v3];
}

void __90__VSViewServiceViewController_identityProviderViewController_didFinishRequest_withResult___block_invoke_3()
{
  v0 = VSDefaultLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_23F9AB000, v0, OS_LOG_TYPE_DEFAULT, "No current request to inspect for supported auth schemes.", v1, 2u);
  }
}

void __90__VSViewServiceViewController_identityProviderViewController_didFinishRequest_withResult___block_invoke_173(uint64_t a1, void *a2)
{
  id v3 = a2;
  int IsPublicError = VSErrorIsPublicError();
  int v5 = [*(id *)(a1 + 32) isIdentityProviderPickerRequired];
  if (IsPublicError)
  {
    if (v5)
    {
      id v6 = [*(id *)(a1 + 32) navController];
      id v7 = (id)[v6 popToRootViewControllerAnimated:1];
    }
    else
    {
      [*(id *)(a1 + 32) _didCancelRequest];
    }
  }
  else if (v5)
  {
    id v8 = VSErrorLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __90__VSViewServiceViewController_identityProviderViewController_didFinishRequest_withResult___block_invoke_173_cold_1();
    }

    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __90__VSViewServiceViewController_identityProviderViewController_didFinishRequest_withResult___block_invoke_174;
    v10[3] = &unk_265077B20;
    void v10[4] = *(void *)(a1 + 32);
    uint64_t v9 = VSAlertForError(v3, v10);
    [*(id *)(a1 + 32) presentViewController:v9 animated:1 completion:0];
  }
  else
  {
    [*(id *)(a1 + 32) _requestDidFailWithError:v3];
  }
}

void __90__VSViewServiceViewController_identityProviderViewController_didFinishRequest_withResult___block_invoke_174(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navController];
  id v1 = (id)[v2 popToRootViewControllerAnimated:1];
}

- (void)identityProviderViewController:(id)a3 didAuthenticateAccount:(id)a4 forRequest:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = [a5 requestingAppAdamID];
  int8x16_t v26 = v7;
  uint64_t v9 = [v7 identityProviderID];
  id v10 = [v9 forceUnwrapObject];

  uint64_t v25 = self;
  id v11 = [(VSViewServiceViewController *)self storage];
  id v12 = [v11 voucherLockbox];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v27 = v12;
  int v13 = [v12 unredeemedVouchers];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v19 = [v18 appAdamID];
        if ([v19 isEqual:v8])
        {
          id v20 = [v18 providerID];
          int v21 = [v20 isEqual:v10];

          if (v21) {
            [v27 redeemVoucher:v18];
          }
        }
        else
        {
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v15);
  }

  id v22 = [(VSViewServiceViewController *)v25 storage];
  id v23 = [v22 privacyFacade];

  [(VSViewServiceViewController *)v25 _hostAuditToken];
  if (([v23 setAccessGranted:1 forAuditToken:v28] & 1) == 0)
  {
    id v24 = VSErrorLogObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[VSViewServiceViewController identityProviderViewController:didAuthenticateAccount:forRequest:](v24);
    }
  }
  [(VSViewServiceViewController *)v25 _dismissInHostIfNecessary];
}

- (void)identityProviderViewControllerDidFinishLoading:(id)a3
{
  id v4 = a3;
  int v5 = [(VSViewServiceViewController *)self currentRequest];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __78__VSViewServiceViewController_identityProviderViewControllerDidFinishLoading___block_invoke;
  v7[3] = &unk_265076978;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  [v5 conditionallyUnwrapObject:v7 otherwise:&__block_literal_global_183];
}

void __78__VSViewServiceViewController_identityProviderViewControllerDidFinishLoading___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isPreAuthRequest]
    && ([*(id *)(a1 + 32) currentAuthenticationViewControllerSupportsPreAuth] & 1) == 0)
  {
    [*(id *)(a1 + 32) sendErrorMessage:@"presented template is incompatible with authentication share requests"];
    id v4 = VSErrorLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __78__VSViewServiceViewController_identityProviderViewControllerDidFinishLoading___block_invoke_cold_1();
    }

    int v5 = VSPublicError();
    [*(id *)(a1 + 40) _requestDidFailWithError:v5];
    id v6 = [v3 requestingAppAdamID];

    if (v6)
    {
      id v7 = [v3 requestingAppAdamID];

      if (!v7) {
        [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The [currentRequest requestingAppAdamID] parameter must not be nil."];
      }
      id v8 = [v3 requestingAppAdamID];
      [MEMORY[0x263F1E240] recordInvalidTemplateErrorWithProviderAppAdamID:v8];
    }
  }
  else
  {
    [*(id *)(a1 + 40) _presentInHostIfNecessary];
  }
}

void __78__VSViewServiceViewController_identityProviderViewControllerDidFinishLoading___block_invoke_181()
{
  v0 = VSErrorLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __78__VSViewServiceViewController_identityProviderViewControllerDidFinishLoading___block_invoke_181_cold_1();
  }
}

- (void)remoteNotifier:(id)a3 didReceiveRemoteNotificationWithUserInfo:(id)a4
{
  [(VSViewServiceViewController *)self _didCancelRequest];
  id v5 = [(VSViewServiceViewController *)self topShelfPurger];
  [v5 purge];
}

- (VSPersistentStorage)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
}

- (VSRestrictionsCenter)restrictionsCenter
{
  return self->_restrictionsCenter;
}

- (void)setRestrictionsCenter:(id)a3
{
}

- (VSRemoteNotifier)remoteNotifier
{
  return self->_remoteNotifier;
}

- (void)setRemoteNotifier:(id)a3
{
}

- (VSPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
}

- (VSTopShelfPurger)topShelfPurger
{
  return self->_topShelfPurger;
}

- (void)setTopShelfPurger:(id)a3
{
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (VSOptional)currentRequest
{
  return self->_currentRequest;
}

- (VSOptional)currentRequestID
{
  return self->_currentRequestID;
}

- (void)setCurrentRequestID:(id)a3
{
}

- (BOOL)isPresentedInHost
{
  return self->_presentedInHost;
}

- (void)setPresentedInHost:(BOOL)a3
{
  self->_presentedInHost = a3;
}

- (BOOL)isIdentityProviderPickerRequired
{
  return self->_identityProviderPickerRequired;
}

- (void)setIdentityProviderPickerRequired:(BOOL)a3
{
  self->_identityProviderPickerRequired = a3;
}

- (BOOL)didAuthenticateAccount
{
  return self->_didAuthenticateAccount;
}

- (void)setDidAuthenticateAccount:(BOOL)a3
{
  self->_didAuthenticateAccount = a3;
}

- (UINavigationController)navController
{
  return self->_navController;
}

- (void)setNavController:(id)a3
{
}

- (VSAuditToken)auditToken
{
  return self->_auditToken;
}

- (void)setAuditToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_navController, 0);
  objc_storeStrong((id *)&self->_currentRequestID, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_topShelfPurger, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_remoteNotifier, 0);
  objc_storeStrong((id *)&self->_restrictionsCenter, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

void __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke_7_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23F9AB000, v0, v1, "Unable to fetch accounts for request due to failure to fetch accounts: %@", v2, v3, v4, v5, v6);
}

- (void)_performRequestInternal:withID:identityProviders:accounts:currentStorefrontCode:allStorefronts:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_23F9AB000, v0, v1, "Request has account provider authentication token but pre-auth is not applicable.", v2, v3, v4, v5, v6);
}

- (void)_determinePreAuthAppIsAuthorized:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23F9AB000, v0, v1, "App with bundle ID %@ is not allowed to make pre-auth requests to this identity provider.", v2, v3, v4, v5, v6);
}

void __75__VSViewServiceViewController__performRequestWithIdentityProvider_account___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_23F9AB000, v0, v1, "Request is a pre-auth request but the host app is not authorized for pre-auth.", v2, v3, v4, v5, v6);
}

void __75__VSViewServiceViewController__performRequestWithIdentityProvider_account___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23F9AB000, v0, v1, "Error checking pre-auth authorization: %@", v2, v3, v4, v5, v6);
}

void __75__VSViewServiceViewController__performRequestWithIdentityProvider_account___block_invoke_143_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_23F9AB000, v0, v1, "No request to perform.", v2, v3, v4, v5, v6);
}

void __90__VSViewServiceViewController_identityProviderViewController_didFinishRequest_withResult___block_invoke_173_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23F9AB000, v0, v1, "Will present error: %@", v2, v3, v4, v5, v6);
}

- (void)identityProviderViewController:(NSObject *)a1 didAuthenticateAccount:forRequest:.cold.1(NSObject *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v2 = *__error();
  int v3 = *__error();
  v4[0] = 67109376;
  v4[1] = v2;
  __int16 v5 = 1024;
  int v6 = v3;
  _os_log_error_impl(&dword_23F9AB000, a1, OS_LOG_TYPE_ERROR, "Error granting access for audit token: %d (%{errno}d)", (uint8_t *)v4, 0xEu);
}

void __78__VSViewServiceViewController_identityProviderViewControllerDidFinishLoading___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_23F9AB000, v0, v1, "Invalid template loaded for pre-auth request.", v2, v3, v4, v5, v6);
}

void __78__VSViewServiceViewController_identityProviderViewControllerDidFinishLoading___block_invoke_181_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_23F9AB000, v0, v1, "No request to perform. Possibly cancelled.", v2, v3, v4, v5, v6);
}

@end