@interface SUSSoftwareUpdateTermsManager
- (RUIStyle)serverFlowStyle;
- (SUSSoftwareUpdateTermsManager)init;
- (void)_acceptedTermsFromAsset;
- (void)_acceptedTermsVersion:(id)a3;
- (void)_finishTermsWithAcceptance:(BOOL)a3 error:(id)a4;
- (void)_handleAgreeFromObjectModel:(id)a3;
- (void)_handleDisagreeFromObjectModel:(id)a3;
- (void)_loadRemoteUITermsWithCloudAtURL:(id)a3;
- (void)_loadTermsFromUpdateAsset;
- (void)_loadTermsRemoteUIFailureWithError:(id)a3;
- (void)_presentModalController:(id)a3;
- (void)_reportTermsUserAction:(id)a3;
- (void)_reportTermsUserAction:(id)a3 agreeUrl:(id)a4;
- (void)_termsDisagree;
- (void)cancelLoadingTerms:(id)a3;
- (void)presentTermsIfNecessaryForUpdate:(id)a3 overController:(id)a4 showLoadSpinner:(BOOL)a5 completion:(id)a6;
- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4 forRequest:(id)a5;
- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5;
- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5;
- (void)remoteUIControllerDidDismiss:(id)a3;
- (void)setServerFlowStyle:(id)a3;
- (void)showLoadingSpinnerViewController;
@end

@implementation SUSSoftwareUpdateTermsManager

- (SUSSoftwareUpdateTermsManager)init
{
  SEL v7 = a2;
  v8 = 0;
  v6.receiver = self;
  v6.super_class = (Class)SUSSoftwareUpdateTermsManager;
  v8 = [(SUSSoftwareUpdateTermsManager *)&v6 init];
  objc_storeStrong((id *)&v8, v8);
  if (v8)
  {
    v2 = (SUManagerClient *)objc_alloc_init(MEMORY[0x263F78200]);
    termsAndConditionsClient = v8->termsAndConditionsClient;
    v8->termsAndConditionsClient = v2;
  }
  v5 = v8;
  objc_storeStrong((id *)&v8, 0);
  return v5;
}

- (void)_finishTermsWithAcceptance:(BOOL)a3 error:(id)a4
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  v55 = self;
  SEL v54 = a2;
  BOOL v53 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v51 = _SUSLoggingFacility();
  os_log_type_t v50 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v51, OS_LOG_TYPE_DEFAULT))
  {
    if (v53) {
      v4 = @"YASE";
    }
    else {
      v4 = @"NERP";
    }
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v57, (uint64_t)v4, (uint64_t)location);
    _os_log_impl(&dword_23BAE9000, (os_log_t)v51, v50, "Terms accepted: %@, error: %@", v57, 0x16u);
  }
  objc_storeStrong(&v51, 0);
  uint64_t v43 = MEMORY[0x263EF8330];
  int v44 = -1073741824;
  int v45 = 0;
  v46 = __66__SUSSoftwareUpdateTermsManager__finishTermsWithAcceptance_error___block_invoke;
  v47 = &unk_264E07120;
  v48 = v55;
  id v49 = (id)MEMORY[0x23ECCDF60](&v43);
  if (v55->_showProgressViewController)
  {
    showProgressViewController = v55->_showProgressViewController;
    uint64_t v35 = MEMORY[0x263EF8330];
    int v36 = -1073741824;
    int v37 = 0;
    v38 = __66__SUSSoftwareUpdateTermsManager__finishTermsWithAcceptance_error___block_invoke_2;
    v39 = &unk_264E07148;
    id v41 = v49;
    BOOL v42 = v53;
    id v40 = location;
    [(UINavigationController *)showProgressViewController dismissViewControllerAnimated:1 completion:&v35];
    objc_storeStrong(&v40, 0);
    objc_storeStrong(&v41, 0);
  }
  else if (v55->_termsRemoteUI)
  {
    termsRemoteUI = v55->_termsRemoteUI;
    uint64_t v27 = MEMORY[0x263EF8330];
    int v28 = -1073741824;
    int v29 = 0;
    v30 = __66__SUSSoftwareUpdateTermsManager__finishTermsWithAcceptance_error___block_invoke_3;
    v31 = &unk_264E07148;
    id v33 = v49;
    BOOL v34 = v53;
    id v32 = location;
    id v5 = (id)[(RemoteUIController *)termsRemoteUI dismissObjectModelsAnimated:1 completion:&v27];
    objc_storeStrong(&v32, 0);
    objc_storeStrong(&v33, 0);
  }
  else
  {
    v9 = [(UIViewController *)v55->_hostController presentedViewController];
    char v25 = 0;
    char v23 = 0;
    BOOL v10 = 0;
    if (v9)
    {
      id v26 = [(UIViewController *)v55->_hostController presentedViewController];
      char v25 = 1;
      id WeakRetained = objc_loadWeakRetained((id *)&v55->_presentedViewController);
      char v23 = 1;
      BOOL v10 = v26 == WeakRetained;
    }
    if (v23) {

    }
    if (v25) {
    if (v10)
    }
    {
      hostController = v55->_hostController;
      uint64_t v15 = MEMORY[0x263EF8330];
      int v16 = -1073741824;
      int v17 = 0;
      v18 = __66__SUSSoftwareUpdateTermsManager__finishTermsWithAcceptance_error___block_invoke_4;
      v19 = &unk_264E07148;
      id v21 = v49;
      BOOL v22 = v53;
      id v20 = location;
      [(UIViewController *)hostController dismissViewControllerAnimated:1 completion:&v15];
      objc_storeStrong(&v20, 0);
      objc_storeStrong(&v21, 0);
    }
    else
    {
      (*((void (**)(void))v49 + 2))();
    }
  }
  id v6 = objc_alloc(MEMORY[0x263F781C8]);
  id v14 = (id)[v6 initWithEventName:*MEMORY[0x263F78398]];
  if (v53) {
    uint64_t v7 = *MEMORY[0x263F78498];
  }
  else {
    uint64_t v7 = *MEMORY[0x263F784A0];
  }
  [v14 setEventPayloadEntry:*MEMORY[0x263F783A0] stringValue:v7];
  os_log_t oslog = (os_log_t)_SUSLoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v56, (uint64_t)v14);
    _os_log_impl(&dword_23BAE9000, oslog, OS_LOG_TYPE_DEFAULT, "Submitting event for T&C interaction: %@", v56, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  [(SUManagerClient *)v55->termsAndConditionsClient submitSUAnalyticsEvent:v14];
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v49, 0);
  objc_storeStrong((id *)&v48, 0);
  objc_storeStrong(&location, 0);
}

void __66__SUSSoftwareUpdateTermsManager__finishTermsWithAcceptance_error___block_invoke(uint64_t a1, char a2, id obj)
{
  uint64_t v8 = a1;
  char v7 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  if (*(void *)(*(void *)(a1 + 32) + 24)) {
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 24) + 16))();
  }
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = 0;

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), 0);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), 0);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), 0);
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 64), 0);
  objc_storeStrong(&location, 0);
}

uint64_t __66__SUSSoftwareUpdateTermsManager__finishTermsWithAcceptance_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned char *)(a1 + 48) & 1);
}

uint64_t __66__SUSSoftwareUpdateTermsManager__finishTermsWithAcceptance_error___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned char *)(a1 + 48) & 1);
}

uint64_t __66__SUSSoftwareUpdateTermsManager__finishTermsWithAcceptance_error___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned char *)(a1 + 48) & 1);
}

- (void)_presentModalController:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeWeak((id *)&v4->_presentedViewController, location[0]);
  [(UIViewController *)v4->_hostController presentViewController:location[0] animated:1 completion:0];
  objc_storeStrong(location, 0);
}

- (void)showLoadingSpinnerViewController
{
  v13[1] = *MEMORY[0x263EF8340];
  v12 = self;
  v11[1] = (id)a2;
  v11[0] = (id)objc_opt_new();
  uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x263F824A8]), "initWithBarButtonSystemItem:target:action:");
  id v5 = v11[0];
  v13[0] = v10;
  id v6 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  objc_msgSend(v5, "setToolbarItems:");

  id v7 = v11[0];
  id v9 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = (id)[v9 localizedStringForKey:@"TERMS_AND_CONDITIONS" value:&stru_26EF052F8 table:@"Software Update"];
  objc_msgSend(v7, "setTitle:");

  v2 = [_PSSpinnerHandlingNavigationController alloc];
  uint64_t v3 = [(_PSSpinnerHandlingNavigationController *)v2 initWithRootViewController:v11[0]];
  showProgressViewController = v12->_showProgressViewController;
  v12->_showProgressViewController = (UINavigationController *)v3;

  [(UINavigationController *)v12->_showProgressViewController setModalPresentationStyle:2];
  [(UINavigationController *)v12->_showProgressViewController setToolbarHidden:0];
  [(SUSSoftwareUpdateTermsManager *)v12 _presentModalController:v12->_showProgressViewController];
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(v11, 0);
}

- (void)presentTermsIfNecessaryForUpdate:(id)a3 overController:(id)a4 showLoadSpinner:(BOOL)a5 completion:(id)a6
{
  BOOL v42 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v40 = 0;
  objc_storeStrong(&v40, a4);
  BOOL v39 = a5;
  id v38 = 0;
  objc_storeStrong(&v38, a6);
  objc_storeStrong((id *)&v42->_hostController, v40);
  objc_storeStrong((id *)&v42->_update, location[0]);
  id v37 = (id)objc_opt_new();
  id v36 = (id)objc_msgSend(v37, "aa_primaryAppleAccount");
  id v35 = (id)objc_msgSend(v36, "aa_personID");
  uint64_t v6 = [v38 copy];
  id termsCompletion = v42->_termsCompletion;
  v42->_id termsCompletion = (id)v6;

  if ([v35 length])
  {
    id v34 = _SUSLoggingFacility();
    os_log_type_t v33 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_DEFAULT))
    {
      log = v34;
      os_log_type_t type = v33;
      __os_log_helper_16_0_0(v32);
      _os_log_impl(&dword_23BAE9000, log, type, "SU Terms: Downloading URL configuration for combined terms", v32, 2u);
    }
    objc_storeStrong(&v34, 0);
    if (v39) {
      [(SUSSoftwareUpdateTermsManager *)v42 showLoadingSpinnerViewController];
    }
    id v8 = objc_alloc((Class)getAASetupAssistantServiceClass());
    uint64_t v31 = [v8 initWithAccount:v36];
    id v16 = (id)v31;
    uint64_t v25 = MEMORY[0x263EF8330];
    int v26 = -1073741824;
    int v27 = 0;
    int v28 = __108__SUSSoftwareUpdateTermsManager_presentTermsIfNecessaryForUpdate_overController_showLoadSpinner_completion___block_invoke;
    int v29 = &unk_264E07198;
    v30 = v42;
    [v16 downloadURLConfiguration:&v25];
    objc_storeStrong((id *)&v30, 0);
    objc_storeStrong((id *)&v31, 0);
  }
  else
  {
    id v14 = (id)[(SUDescriptor *)v42->_update documentation];
    id v13 = (id)[v14 licenseAgreement];
    BOOL v15 = [v13 length] == 0;

    if (v15)
    {
      if (v38)
      {
        id v24 = _SUSLoggingFacility();
        os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
        {
          v11 = v24;
          os_log_type_t v12 = v23;
          __os_log_helper_16_0_0(v22);
          _os_log_impl(&dword_23BAE9000, v11, v12, "SU Terms: No terms on update asset", v22, 2u);
        }
        objc_storeStrong(&v24, 0);
        id v9 = (void (**)(id, uint64_t))v38;
        id v10 = (id)[MEMORY[0x263F087E8] errorWithDomain:@"com.apple.softwareupdatesettings.errors" code:1 userInfo:0];
        v9[2](v9, 1);
      }
    }
    else
    {
      [(SUSSoftwareUpdateTermsManager *)v42 _loadTermsFromUpdateAsset];
    }
  }
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(location, 0);
}

void __108__SUSSoftwareUpdateTermsManager_presentTermsIfNecessaryForUpdate_overController_showLoadSpinner_completion___block_invoke(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v10[1] = a1;
  queue = MEMORY[0x263EF83A0];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = __108__SUSSoftwareUpdateTermsManager_presentTermsIfNecessaryForUpdate_overController_showLoadSpinner_completion___block_invoke_2;
  id v8 = &unk_264E07170;
  id v9 = location[0];
  v10[0] = a1[4];
  dispatch_async(queue, &v4);

  objc_storeStrong(v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __108__SUSSoftwareUpdateTermsManager_presentTermsIfNecessaryForUpdate_overController_showLoadSpinner_completion___block_invoke_2(id *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v5[2] = a1;
  v5[1] = a1;
  v5[0] = (id)[a1[4] genericTermsURL];
  if (v5[0])
  {
    id v1 = a1[5];
    id v2 = (id)[NSURL URLWithString:v5[0]];
    objc_msgSend(v1, "_loadRemoteUITermsWithCloudAtURL:");
  }
  else
  {
    id location = _SUSLoggingFacility();
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v6, (uint64_t)a1[4]);
      _os_log_impl(&dword_23BAE9000, (os_log_t)location, OS_LOG_TYPE_DEFAULT, "Terms config response did not contain a terms URL: %@", v6, 0xCu);
    }
    objc_storeStrong(&location, 0);
    [a1[5] _loadTermsRemoteUIFailureWithError:0];
  }
  objc_storeStrong(v5, 0);
}

- (void)cancelLoadingTerms:(id)a3
{
  uint64_t v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(SUSSoftwareUpdateTermsManager *)v7 _reportTermsUserAction:@"Dismiss"];
  id v3 = (id)[(RemoteUIController *)v7->_termsRemoteUI loader];
  [v3 cancel];

  uint64_t v4 = v7;
  id v5 = (id)[MEMORY[0x263F087E8] errorWithDomain:@"com.apple.softwareupdatesettings.errors" code:7 userInfo:0];
  -[SUSSoftwareUpdateTermsManager _finishTermsWithAcceptance:error:](v4, "_finishTermsWithAcceptance:error:", 0);

  objc_storeStrong(location, 0);
}

- (void)_loadTermsFromUpdateAsset
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  BOOL v42 = self;
  v41[1] = (id)a2;
  id v25 = (id)[(RemoteUIController *)self->_termsRemoteUI loader];
  [v25 cancel];

  -[RemoteUIController setNavigationController:](v42->_termsRemoteUI, "setNavigationController:");
  objc_storeStrong((id *)&v42->_termsRemoteUI, 0);
  v41[0] = (id)[(SUDescriptor *)v42->_update documentation];
  id v26 = [NSString alloc];
  id v27 = (id)[v41[0] licenseAgreement];
  id v40 = (id)objc_msgSend(v26, "initWithData:encoding:");

  id location = _SUSLoggingFacility();
  os_log_type_t v38 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
  {
    id v24 = (id)[(SUDescriptor *)v42->_update documentation];
    id v23 = (id)[v24 slaVersion];
    __os_log_helper_16_2_2_8_64_8_0((uint64_t)v44, (uint64_t)v23, [v40 length]);
    _os_log_impl(&dword_23BAE9000, (os_log_t)location, v38, "SU Terms: Update asset license agreement has version: %@, length %llu", v44, 0x16u);
  }
  objc_storeStrong(&location, 0);
  uint64_t v36 = [getBYLicenseAgreementClass() versionOfAcceptedAgreement];
  id v21 = (id)[v41[0] slaVersion];
  uint64_t v22 = [v21 unsignedIntegerValue];

  uint64_t v35 = v22;
  BOOL v37 = v36 != v22;
  if (v36 == v22)
  {
    [getBYLicenseAgreementClass() recordUserAcceptedAgreementVersion:v35];
    id v34 = _SUSLoggingFacility();
    os_log_type_t v33 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(getBYLicenseAgreementClass(), "versionOfAcceptedAgreement"));
      id v19 = (id)[v41[0] slaVersion];
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v43, (uint64_t)v20, (uint64_t)v19);
      _os_log_impl(&dword_23BAE9000, (os_log_t)v34, v33, "Not showing terms because accepted version %@ >= asset version: %@", v43, 0x16u);
    }
    objc_storeStrong(&v34, 0);
  }
  if ([v40 length] && v37)
  {
    id v2 = [SUSSoftwareUpdateLicenseViewController alloc];
    id v32 = [(SUSSoftwareUpdateLicenseViewController *)v2 initWithLicense:v40];
    id v18 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v17 = (id)[v18 localizedStringForKey:@"TERMS_AND_CONDITIONS" value:&stru_26EF052F8 table:@"Software Update"];
    objc_msgSend(v32, "setTitle:");

    [v32 setModalInPresentation:1];
    id v31 = 0;
    if (!v42->_showProgressViewController)
    {
      id v3 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v32];
      id v4 = v31;
      id v31 = v3;
    }
    id v9 = objc_alloc(MEMORY[0x263F824A8]);
    id v11 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v10 = (id)objc_msgSend(v11, "localizedStringForKey:value:table:", @"DISAGREE");
    id v30 = (id)objc_msgSend(v9, "initWithTitle:style:target:action:");

    id v12 = objc_alloc(MEMORY[0x263F824A8]);
    id v14 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v13 = (id)[v14 localizedStringForKey:@"AGREE" value:&stru_26EF052F8 table:@"Software Update"];
    id v29 = (id)objc_msgSend(v12, "initWithTitle:style:target:action:");

    [v29 setAccessibilityIdentifier:@"SUSSoftwareUpdateTermsManagerAgreeButton"];
    [v30 setAccessibilityIdentifier:@"SUSSoftwareUpdateTermsManagerDisagreeButton"];
    id v15 = (id)[MEMORY[0x263F82670] currentDevice];
    char v16 = objc_msgSend(v15, "sf_isiPad");

    if (v16)
    {
      [v31 setModalPresentationStyle:2];
      id v7 = (id)[v32 navigationItem];
      [v7 setRightBarButtonItem:v29];

      id v8 = (id)[v32 navigationItem];
      [v8 setLeftBarButtonItem:v30];
    }
    else
    {
      [v31 setModalPresentationStyle:0];
      id v28 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F824A8]), "initWithBarButtonSystemItem:target:action:", 5, 0);
      id v5 = v32;
      id v6 = (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v30, v28, v29, 0);
      objc_msgSend(v5, "setToolbarItems:animated:");

      [v31 setToolbarHidden:0];
      objc_storeStrong(&v28, 0);
    }
    if (v42->_showProgressViewController) {
      [(UINavigationController *)v42->_showProgressViewController pushViewController:v32 animated:0];
    }
    else {
      [(SUSSoftwareUpdateTermsManager *)v42 _presentModalController:v31];
    }
    objc_storeStrong(&v29, 0);
    objc_storeStrong(&v30, 0);
    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v32, 0);
  }
  else
  {
    [(SUSSoftwareUpdateTermsManager *)v42 _finishTermsWithAcceptance:1 error:0];
  }
  objc_storeStrong(&v40, 0);
  objc_storeStrong(v41, 0);
}

- (void)_loadRemoteUITermsWithCloudAtURL:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v40 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v38 = _SUSLoggingFacility();
  os_log_type_t v37 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v49, (uint64_t)location[0]);
    _os_log_impl(&dword_23BAE9000, (os_log_t)v38, v37, "SU Terms: Loading combined terms from %@", v49, 0xCu);
  }
  objc_storeStrong(&v38, 0);
  id v11 = NSString;
  id v10 = (id)[(SUDescriptor *)v40->_update productVersion];
  id v9 = (id)[(SUDescriptor *)v40->_update productBuildVersion];
  id v36 = (id)[v11 stringWithFormat:@"%@:%@", v10, v9];

  v47[0] = @"name";
  v48[0] = *MEMORY[0x263F25720];
  v47[1] = @"version";
  v48[1] = v36;
  id v35 = (id)[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:2];
  id v34 = &unk_26EF09200;
  id v33 = &unk_26EF09228;
  id v32 = &unk_26EF09250;
  v46[0] = v35;
  v46[1] = v34;
  v46[2] = v33;
  v46[3] = v32;
  id v31 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:4];
  v44[0] = @"terms";
  v45[0] = v31;
  v44[1] = @"format";
  id v8 = getkAAProtocolGenericTermsUIBuddyMLKey();
  v45[1] = v8;
  id v30 = (id)[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:2];

  uint64_t v23 = 0;
  id v24 = &v23;
  int v25 = 838860800;
  int v26 = 48;
  id v27 = __Block_byref_object_copy_;
  id v28 = __Block_byref_object_dispose_;
  uint64_t v29 = objc_opt_new();
  id v22 = (id)objc_msgSend((id)v24[5], "aa_primaryAppleAccount");
  id v7 = objc_alloc((Class)getAAGenericTermsUIRequestClass());
  id v21 = (id)[v7 initWithAccount:v22 parameters:v30];
  BOOL v42 = @"X-Apple-iOS-SLA-Version";
  id v6 = (id)objc_msgSend(NSString, "stringWithFormat:", @"%llu", objc_msgSend(getBYLicenseAgreementClass(), "versionOfAcceptedAgreement"));
  id v43 = v6;
  id v5 = (id)[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
  objc_msgSend(v21, "setCustomHeaders:");

  os_log_t oslog = (os_log_t)_SUSLoggingFacility();
  os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (id)[v21 customHeaders];
    __os_log_helper_16_2_1_8_64((uint64_t)v41, (uint64_t)v4);
    _os_log_impl(&dword_23BAE9000, oslog, v19, "SU Terms: Adding headers: %@", v41, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v3 = v21;
  uint64_t v12 = MEMORY[0x263EF8330];
  int v13 = -1073741824;
  int v14 = 0;
  id v15 = __66__SUSSoftwareUpdateTermsManager__loadRemoteUITermsWithCloudAtURL___block_invoke;
  char v16 = &unk_264E07210;
  id v17 = v40;
  v18[0] = location[0];
  v18[1] = &v23;
  [v3 performRequestWithHandler:&v12];
  objc_storeStrong(v18, 0);
  objc_storeStrong((id *)&v17, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  _Block_object_dispose(&v23, 8);
  objc_storeStrong((id *)&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(location, 0);
}

void __66__SUSSoftwareUpdateTermsManager__loadRemoteUITermsWithCloudAtURL___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v27 = 0;
  objc_storeStrong(&v27, a3);
  id v26 = 0;
  objc_storeStrong(&v26, a4);
  v25[1] = (id)a1;
  v25[0] = v27;
  id v24 = (id)[v25[0] responseData];
  if (!v26 && [v24 length])
  {
    id v4 = MEMORY[0x263EF83A0];
    uint64_t v9 = MEMORY[0x263EF8330];
    int v10 = -1073741824;
    int v11 = 0;
    uint64_t v12 = __66__SUSSoftwareUpdateTermsManager__loadRemoteUITermsWithCloudAtURL___block_invoke_3;
    int v13 = &unk_264E071E8;
    id v14 = *(id *)(a1 + 32);
    id v15 = v24;
    id v16 = *(id *)(a1 + 40);
    dispatch_async(v4, &v9);

    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v14, 0);
  }
  else
  {
    queue = MEMORY[0x263EF83A0];
    uint64_t v17 = MEMORY[0x263EF8330];
    int v18 = -1073741824;
    int v19 = 0;
    id v20 = __66__SUSSoftwareUpdateTermsManager__loadRemoteUITermsWithCloudAtURL___block_invoke_2;
    id v21 = &unk_264E07170;
    id v22 = *(id *)(a1 + 32);
    id v23 = v26;
    dispatch_async(queue, &v17);

    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v22, 0);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
}

uint64_t __66__SUSSoftwareUpdateTermsManager__loadRemoteUITermsWithCloudAtURL___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadTermsRemoteUIFailureWithError:", *(void *)(a1 + 40), a1, a1);
}

void __66__SUSSoftwareUpdateTermsManager__loadRemoteUITermsWithCloudAtURL___block_invoke_3(uint64_t a1)
{
  id location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = 0;
  if (*(void *)(*(void *)(a1 + 32) + 48))
  {
    objc_storeStrong(location, *(id *)(*(void *)(a1 + 32) + 48));
  }
  else
  {
    id v7 = (id)[*(id *)(*(void *)(a1 + 32) + 56) navigationController];
    if (v7) {
      objc_storeStrong(location, v7);
    }
    else {
      objc_storeStrong(location, *(id *)(*(void *)(a1 + 32) + 56));
    }
  }
  objc_initWeak(&from, *(id *)(a1 + 32));
  getRemoteUIControllerClass();
  uint64_t v6 = objc_opt_new();
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = v6;

  [*(id *)(*(void *)(a1 + 32) + 16) setStyle:*(void *)(*(void *)(a1 + 32) + 72)];
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 1;
  [*(id *)(*(void *)(a1 + 32) + 16) setHostViewController:location[0]];
  [*(id *)(*(void *)(a1 + 32) + 16) setDelegate:*(void *)(a1 + 32)];
  id v5 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v15 = MEMORY[0x263EF8330];
  int v16 = -1073741824;
  int v17 = 0;
  int v18 = __66__SUSSoftwareUpdateTermsManager__loadRemoteUITermsWithCloudAtURL___block_invoke_4;
  int v19 = &unk_264E071C0;
  objc_copyWeak(v20, &from);
  [v5 setHandlerForElementName:@"agree" handler:&v15];
  id v4 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v9 = MEMORY[0x263EF8330];
  int v10 = -1073741824;
  int v11 = 0;
  uint64_t v12 = __66__SUSSoftwareUpdateTermsManager__loadRemoteUITermsWithCloudAtURL___block_invoke_5;
  int v13 = &unk_264E071C0;
  objc_copyWeak(&v14, &from);
  [v4 setHandlerForElementName:@"disagree" handler:&v9];
  [*(id *)(*(void *)(a1 + 32) + 16) loadData:*(void *)(a1 + 40) baseURL:*(void *)(a1 + 48)];
  id v3 = (id)[MEMORY[0x263F82438] sharedApplication];
  [v3 setStatusBarShowsProgress:1];

  objc_destroyWeak(&v14);
  objc_destroyWeak(v20);
  objc_destroyWeak(&from);
  objc_storeStrong(location, 0);
}

void __66__SUSSoftwareUpdateTermsManager__loadRemoteUITermsWithCloudAtURL___block_invoke_4(id *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v9 = 0;
  objc_storeStrong(&v9, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  [WeakRetained _handleAgreeFromObjectModel:location[0]];

  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __66__SUSSoftwareUpdateTermsManager__loadRemoteUITermsWithCloudAtURL___block_invoke_5(id *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v9 = 0;
  objc_storeStrong(&v9, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  [WeakRetained _handleDisagreeFromObjectModel:location[0]];

  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)_loadTermsRemoteUIFailureWithError:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = (id)[MEMORY[0x263F82438] sharedApplication];
  [v3 setStatusBarShowsProgress:0];

  NSLog(&cfstr_ErrorLoadingRe.isa, location[0]);
  [(SUSSoftwareUpdateTermsManager *)v5 _loadTermsFromUpdateAsset];
  objc_storeStrong(location, 0);
}

- (void)remoteUIControllerDidDismiss:(id)a3
{
  int v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = (id)[MEMORY[0x263F82438] sharedApplication];
  [v5 setStatusBarShowsProgress:0];

  id v8 = _SUSLoggingFacility();
  os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
  {
    log = v8;
    os_log_type_t type = v7;
    __os_log_helper_16_0_0(v6);
    _os_log_impl(&dword_23BAE9000, log, type, "iCloud Terms Dismissed via server", v6, 2u);
  }
  objc_storeStrong(&v8, 0);
  [(SUSSoftwareUpdateTermsManager *)v10 _reportTermsUserAction:@"Dismiss"];
  [(SUSSoftwareUpdateTermsManager *)v10 _finishTermsWithAcceptance:1 error:0];
  objc_storeStrong(location, 0);
}

- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4 forRequest:(id)a5
{
  int v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  id v8 = 0;
  objc_storeStrong(&v8, a5);
  id v7 = (id)[MEMORY[0x263F82438] sharedApplication];
  [v7 setStatusBarShowsProgress:0];

  if (v9) {
    [(SUSSoftwareUpdateTermsManager *)v11 _loadTermsRemoteUIFailureWithError:v9];
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  id v6 = (id)[MEMORY[0x263F82438] sharedApplication];
  [v6 setStatusBarShowsProgress:0];

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  char v10 = 0;
  BOOL overrideNextRUIAction = 0;
  if (location[0] == v14->_termsRemoteUI)
  {
    BOOL overrideNextRUIAction = 0;
    if (a5)
    {
      id v11 = (id)[v12 defaultPages];
      char v10 = 1;
      BOOL overrideNextRUIAction = 0;
      if ([v11 count]) {
        BOOL overrideNextRUIAction = v14->_overrideNextRUIAction;
      }
    }
  }
  if (v10) {

  }
  if (overrideNextRUIAction)
  {
    if (v14->_showProgressViewController)
    {
      id v5 = [(UINavigationController *)v14->_showProgressViewController topViewController];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        *a5 = 3;
      }
    }
    else
    {
      *a5 = 5;
    }
  }
  v14->_BOOL overrideNextRUIAction = 0;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)_handleAgreeFromObjectModel:(id)a3
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  v61 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v61->_agreeToCombinedTOSInProgress)
  {
    int v59 = 1;
  }
  else
  {
    id v58 = (id)[location[0] clientInfo];
    id v57 = (id)[v58 objectForKey:@"agreeUrl"];
    id v32 = objc_alloc(MEMORY[0x263EFF980]);
    id v35 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v34 = (id)[MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"OS_PLATFORM"];
    id v33 = (id)objc_msgSend(v35, "localizedStringForKey:value:table:");
    id v56 = (id)[v32 initWithObjects:0];

    char v55 = 0;
    memset(__b, 0, sizeof(__b));
    id obj = (id)[location[0] namedPages];
    uint64_t v37 = [obj countByEnumeratingWithState:__b objects:v62 count:16];
    if (v37)
    {
      uint64_t v29 = *(void *)__b[2];
      uint64_t v30 = 0;
      unint64_t v31 = v37;
      while (1)
      {
        uint64_t v28 = v30;
        if (*(void *)__b[2] != v29) {
          objc_enumerationMutation(obj);
        }
        id v54 = *(id *)(__b[1] + 8 * v30);
        if ([v54 isEqualToString:@"iCloud"]) {
          [v56 addObject:@"iCloud"];
        }
        if ([v54 isEqualToString:@"GameCenter"]) {
          [v56 addObject:@"Game Center"];
        }
        if ([v54 isEqualToString:@"AMS"]) {
          [v56 addObject:@"Apple Media Services"];
        }
        if ([v54 isEqualToString:@"Privacy"]) {
          char v55 = 1;
        }
        ++v30;
        if (v28 + 1 >= v31)
        {
          uint64_t v30 = 0;
          unint64_t v31 = [obj countByEnumeratingWithState:__b objects:v62 count:16];
          if (!v31) {
            break;
          }
        }
      }
    }

    id v52 = &unk_26EF09318;
    unint64_t v51 = 0;
    int v50 = 3;
    unint64_t v49 = [v56 count] - 1;
    if (v49 <= 3) {
      unint64_t v27 = v49;
    }
    else {
      unint64_t v27 = v50;
    }
    v48[1] = (id)v27;
    unint64_t v51 = v27;
    if (v55) {
      v51 += 4;
    }
    while ((unint64_t)[v56 count] < 4)
    {
      id v25 = v56;
      id v26 = (id)[MEMORY[0x263EFF9D0] null];
      objc_msgSend(v25, "addObject:");
    }
    id v3 = NSString;
    id v10 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v9 = (id)[v52 objectAtIndexedSubscript:v51];
    id v8 = (id)objc_msgSend(v10, "localizedStringForKey:value:table:");
    id v7 = (id)objc_msgSend(v56, "objectAtIndexedSubscript:");
    id v6 = (id)objc_msgSend(v56, "objectAtIndexedSubscript:");
    id v5 = (id)[v56 objectAtIndexedSubscript:2];
    id v4 = (id)[v56 objectAtIndexedSubscript:3];
    v48[0] = (id)objc_msgSend(v3, "stringWithFormat:", v8, v7, v6, v5, v4);

    id v11 = (void *)MEMORY[0x263F82418];
    id v13 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v12 = (id)[v13 localizedStringForKey:@"TERMS_AND_CONDITIONS" value:&stru_26EF052F8 table:@"Software Update"];
    id v47 = (id)objc_msgSend(v11, "alertControllerWithTitle:message:preferredStyle:");

    id v15 = v47;
    id v14 = (void *)MEMORY[0x263F82400];
    id v18 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v17 = (id)[v18 localizedStringForKey:@"CANCEL" value:&stru_26EF052F8 table:@"Software Update"];
    id v16 = (id)objc_msgSend(v14, "actionWithTitle:style:handler:");
    objc_msgSend(v15, "addAction:");

    id v20 = v47;
    int v19 = (void *)MEMORY[0x263F82400];
    id v23 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v22 = (id)[v23 localizedStringForKey:@"AGREE" value:&stru_26EF052F8 table:@"Software Update"];
    uint64_t v38 = MEMORY[0x263EF8330];
    int v39 = -1073741824;
    int v40 = 0;
    id v41 = __61__SUSSoftwareUpdateTermsManager__handleAgreeFromObjectModel___block_invoke;
    BOOL v42 = &unk_264E07260;
    id v43 = v61;
    id v44 = v57;
    id v45 = location[0];
    id v46 = v58;
    id v21 = (id)[v19 actionWithTitle:v22 style:0 handler:&v38];
    objc_msgSend(v20, "addAction:");

    id v24 = [(UIViewController *)v61->_hostController presentedViewController];
    [(UIViewController *)v24 presentViewController:v47 animated:1 completion:0];

    objc_storeStrong(&v46, 0);
    objc_storeStrong(&v45, 0);
    objc_storeStrong(&v44, 0);
    objc_storeStrong((id *)&v43, 0);
    objc_storeStrong(&v47, 0);
    objc_storeStrong(v48, 0);
    objc_storeStrong(&v52, 0);
    objc_storeStrong(&v56, 0);
    objc_storeStrong(&v57, 0);
    objc_storeStrong(&v58, 0);
    int v59 = 0;
  }
  objc_storeStrong(location, 0);
}

void __61__SUSSoftwareUpdateTermsManager__handleAgreeFromObjectModel___block_invoke(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v16[1] = a1;
  *((unsigned char *)a1[4] + 41) = 1;
  v16[0] = (id)objc_opt_new();
  id v15 = (id)objc_msgSend(v16[0], "aa_primaryAppleAccount");
  id v14 = (id)[objc_alloc((Class)getAAiCloudTermsAgreeRequestClass()) initWithURLString:a1[5] account:v15];
  if (objc_opt_respondsToSelector())
  {
    id v3 = (id)[a1[6] serverInfo];
    id v13 = (id)[v3 objectForKeyedSubscript:@"serverInfoKey"];

    [v14 setServerInfo:v13];
    objc_storeStrong(&v13, 0);
  }
  id v2 = v14;
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = __61__SUSSoftwareUpdateTermsManager__handleAgreeFromObjectModel___block_invoke_2;
  id v9 = &unk_264E07238;
  id v10 = a1[4];
  id v11 = a1[5];
  id v12 = a1[7];
  [v2 performRequestWithHandler:&v5];
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(v16, 0);
  objc_storeStrong(location, 0);
}

void __61__SUSSoftwareUpdateTermsManager__handleAgreeFromObjectModel___block_invoke_2(id *a1, void *a2, void *a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v19 = 0;
  objc_storeStrong(&v19, a3);
  id v18 = 0;
  objc_storeStrong(&v18, a4);
  v17[1] = a1;
  if (v18)
  {
    v17[0] = _SUSLoggingFacility();
    os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v17[0], OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v21, (uint64_t)v18);
      _os_log_impl(&dword_23BAE9000, (os_log_t)v17[0], v16, "Failed to mark terms as agreed in iCloud: %@", v21, 0xCu);
    }
    objc_storeStrong(v17, 0);
  }
  queue = MEMORY[0x263EF83A0];
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  id v11 = __61__SUSSoftwareUpdateTermsManager__handleAgreeFromObjectModel___block_invoke_539;
  id v12 = &unk_264E071E8;
  id v13 = a1[4];
  id v14 = a1[5];
  id v15 = a1[6];
  dispatch_async(queue, &v8);

  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
}

void __61__SUSSoftwareUpdateTermsManager__handleAgreeFromObjectModel___block_invoke_539(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v7[2] = (id)a1;
  v7[1] = (id)a1;
  [*(id *)(a1 + 32) _reportTermsUserAction:@"Accept" agreeUrl:*(void *)(a1 + 40)];
  v7[0] = (id)[*(id *)(a1 + 48) objectForKey:@"SLAVersion"];
  id location = _SUSLoggingFacility();
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v8, (uint64_t)v7[0]);
    _os_log_impl(&dword_23BAE9000, (os_log_t)location, OS_LOG_TYPE_DEFAULT, "SLA version in combined terms: %@", v8, 0xCu);
  }
  objc_storeStrong(&location, 0);
  if ([v7[0] hasPrefix:@"EA"])
  {
    id v1 = (id)[v7[0] substringFromIndex:2];
    id v2 = v7[0];
    v7[0] = v1;
  }
  if (v7[0] && [v7[0] integerValue] > 0)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = (id)objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7[0], "integerValue"));
    objc_msgSend(v3, "_acceptedTermsVersion:");
  }
  else
  {
    [*(id *)(a1 + 32) _acceptedTermsVersion:0];
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 41) = 0;
  objc_storeStrong(v7, 0);
}

- (void)_acceptedTermsFromAsset
{
  id v4 = (id)[(SUDescriptor *)self->_update documentation];
  id v3 = (id)[v4 slaVersion];
  -[SUSSoftwareUpdateTermsManager _acceptedTermsVersion:](self, "_acceptedTermsVersion:");
}

- (void)_acceptedTermsVersion:(id)a3
{
  uint64_t v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0]) {
    objc_msgSend(getBYLicenseAgreementClass(), "recordUserAcceptedAgreementVersion:", objc_msgSend(location[0], "unsignedIntegerValue"));
  }
  [(SUSSoftwareUpdateTermsManager *)v5 _finishTermsWithAcceptance:1 error:0];
  objc_storeStrong(location, obj);
}

- (void)_handleDisagreeFromObjectModel:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = (id)[location[0] clientInfo];
  id v9 = (id)[v10 objectForKey:@"disagreeUrl"];
  id v8 = (id)objc_opt_new();
  id v7 = (id)objc_msgSend(v8, "aa_primaryAppleAccount");
  id v3 = objc_alloc((Class)getAAiCloudTermsDisagreeRequestClass());
  id v6 = (id)[v3 initWithURLString:v9 account:v7];
  id v4 = (id)[location[0] serverInfo];
  id v5 = (id)[v4 objectForKeyedSubscript:@"serverInfoKey"];

  [v6 setServerInfo:v5];
  [v6 performRequestWithHandler:&__block_literal_global_0];
  [(SUSSoftwareUpdateTermsManager *)v12 _termsDisagree];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

void __64__SUSSoftwareUpdateTermsManager__handleDisagreeFromObjectModel___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v13 = 0;
  objc_storeStrong(&v13, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  v11[1] = a1;
  if (v12)
  {
    v11[0] = _SUSLoggingFacility();
    os_log_type_t v10 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v11[0], OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v17, (uint64_t)"-[SUSSoftwareUpdateTermsManager _handleDisagreeFromObjectModel:]_block_invoke", (uint64_t)v12);
      _os_log_error_impl(&dword_23BAE9000, (os_log_t)v11[0], v10, "%s: Failed to mark terms as disagreed in iCloud with error %@", v17, 0x16u);
    }
    objc_storeStrong(v11, 0);
  }
  else if ([v13 statusCode] == 200)
  {
    os_log_t v7 = (os_log_t)_SUSLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v15, (uint64_t)"-[SUSSoftwareUpdateTermsManager _handleDisagreeFromObjectModel:]_block_invoke");
      _os_log_impl(&dword_23BAE9000, v7, OS_LOG_TYPE_DEFAULT, "%s: Marked terms as disagreed in iCloud", v15, 0xCu);
    }
    objc_storeStrong((id *)&v7, 0);
  }
  else
  {
    os_log_t oslog = (os_log_t)_SUSLoggingFacility();
    os_log_type_t v8 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_0((uint64_t)v16, (uint64_t)"-[SUSSoftwareUpdateTermsManager _handleDisagreeFromObjectModel:]_block_invoke", [v13 statusCode]);
      _os_log_error_impl(&dword_23BAE9000, oslog, v8, "%s: Failed to mark terms as disagreed in iCloud with HTTP status %ld", v16, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)_termsDisagree
{
}

- (void)_reportTermsUserAction:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(SUSSoftwareUpdateTermsManager *)v4 _reportTermsUserAction:location[0] agreeUrl:0];
  objc_storeStrong(location, 0);
}

- (void)_reportTermsUserAction:(id)a3 agreeUrl:(id)a4
{
  v22[1] = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = 0;
  objc_storeStrong(&v17, a4);
  char v16 = 1;
  char v15 = _os_feature_enabled_impl() & 1;
  if (v15)
  {
    id v7 = objc_alloc(MEMORY[0x263EFF9A0]);
    uint64_t v21 = *MEMORY[0x263F25A28];
    v22[0] = location[0];
    id v8 = (id)[NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
    id v14 = (id)objc_msgSend(v7, "initWithDictionary:");

    if (v17) {
      [v14 setObject:v17 forKeyedSubscript:@"agreeUrl"];
    }
    id v13 = _SUSLoggingFacility();
    os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v20, (uint64_t)"-[SUSSoftwareUpdateTermsManager _reportTermsUserAction:agreeUrl:]", (uint64_t)location[0]);
      _os_log_impl(&dword_23BAE9000, (os_log_t)v13, v12, "%s: Reporting TOS action: %@", v20, 0x16u);
    }
    objc_storeStrong(&v13, 0);
    id v4 = objc_alloc(MEMORY[0x263F259A0]);
    id v6 = (id)objc_opt_new();
    id v5 = (id)objc_msgSend(v6, "aa_primaryAppleAccount");
    id v11 = (id)objc_msgSend(v4, "initWithAccount:parameters:");

    [v11 reportEvent];
    objc_storeStrong(&v11, 0);
    objc_storeStrong(&v14, 0);
  }
  else
  {
    os_log_t v10 = (os_log_t)_SUSLoggingFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v19, (uint64_t)"-[SUSSoftwareUpdateTermsManager _reportTermsUserAction:agreeUrl:]", (uint64_t)location[0]);
      _os_log_impl(&dword_23BAE9000, v10, OS_LOG_TYPE_DEFAULT, "%s: Terms QFA feature flag disabled. Not reporting terms '%@' action.", v19, 0x16u);
    }
    objc_storeStrong((id *)&v10, 0);
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

- (RUIStyle)serverFlowStyle
{
  return self->_serverFlowStyle;
}

- (void)setServerFlowStyle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end