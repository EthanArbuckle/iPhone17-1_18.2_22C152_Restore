@interface PHCallBlockingAndIdentificationSettingsBundleController
- (BOOL)isHidden;
- (BOOL)shouldInsert;
- (CXCallDirectoryExtensionManager)extensionManager;
- (NSMutableArray)extensions;
- (NSMutableArray)llextensions;
- (PHBusinessCallingController)businessCallingController;
- (PHCallBlockingAndIdentificationSettingsBundleController)initWithParentListController:(id)a3;
- (PHCallBlockingServiceProviderController)serviceProviderController;
- (PSListController)parentListController;
- (PSSpecifier)callDirectorySpecifier;
- (id)specifiersWithSpecifier:(id)a3;
- (void)_updateExtensions;
- (void)didChangeServiceProvidersForCallBlockingServiceProviderController:(id)a3;
- (void)extensionsChangedForCallDirectoryExtensionManager:(id)a3;
- (void)setCallDirectorySpecifier:(id)a3;
- (void)setExtensions:(id)a3;
- (void)setLlextensions:(id)a3;
- (void)updateParentListController;
@end

@implementation PHCallBlockingAndIdentificationSettingsBundleController

- (PHCallBlockingAndIdentificationSettingsBundleController)initWithParentListController:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)PHCallBlockingAndIdentificationSettingsBundleController;
  v3 = [(PHCallBlockingAndIdentificationSettingsBundleController *)&v15 initWithParentListController:a3];
  if (v3)
  {
    v4 = (CXCallDirectoryExtensionManager *)objc_alloc_init(MEMORY[0x1E4F19188]);
    extensionManager = v3->_extensionManager;
    v3->_extensionManager = v4;

    [(CXCallDirectoryExtensionManager *)v3->_extensionManager setDelegate:v3 queue:0];
    [(CXCallDirectoryExtensionManager *)v3->_extensionManager beginObservingExtensions];
    [(PHCallBlockingAndIdentificationSettingsBundleController *)v3 _updateExtensions];
    v6 = objc_alloc_init(PHCallBlockingServiceProviderController);
    serviceProviderController = v3->_serviceProviderController;
    v3->_serviceProviderController = v6;

    [(PHCallBlockingServiceProviderController *)v3->_serviceProviderController setDelegate:v3];
    v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v9 = dispatch_queue_create("PHCallDirectorySettingsListControllerQueue", v8);
    v10 = [PHBusinessCallingController alloc];
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F23A80]) initWithQueue:v9];
    uint64_t v12 = [(PHBusinessCallingController *)v10 initWithCoreTelephonyClient:v11];
    businessCallingController = v3->_businessCallingController;
    v3->_businessCallingController = (PHBusinessCallingController *)v12;
  }
  return v3;
}

- (id)specifiersWithSpecifier:(id)a3
{
  v4 = [(PHCallBlockingAndIdentificationSettingsBundleController *)self callDirectorySpecifier];

  if (!v4)
  {
    v5 = (void *)MEMORY[0x1E4F92E70];
    v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"CALL_DIRECTORY_NAV_TITLE" value:&stru_1F40BEF98 table:@"CallDirectorySettings"];
    v8 = [v5 preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v8 setIdentifier:@"CALL_DIRECTORIES"];
    [(PHCallBlockingAndIdentificationSettingsBundleController *)self setCallDirectorySpecifier:v8];
  }
  if ([(PHCallBlockingAndIdentificationSettingsBundleController *)self isHidden])
  {
    dispatch_queue_t v9 = 0;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E4F1C978];
    v11 = [(PHCallBlockingAndIdentificationSettingsBundleController *)self callDirectorySpecifier];
    dispatch_queue_t v9 = [v10 arrayWithObject:v11];
  }
  uint64_t v12 = (void *)[v9 copy];

  return v12;
}

- (BOOL)isHidden
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [(PHCallBlockingAndIdentificationSettingsBundleController *)self extensions];
  uint64_t v4 = [v3 count];

  v5 = [(PHCallBlockingAndIdentificationSettingsBundleController *)self serviceProviderController];
  v6 = [v5 serviceProvidersSupportingSpamBlocking];
  uint64_t v7 = [v6 count];

  v8 = [(PHCallBlockingAndIdentificationSettingsBundleController *)self businessCallingController];
  dispatch_queue_t v9 = [v8 specifiers];
  uint64_t v10 = [v9 count];

  v11 = [(PHCallBlockingAndIdentificationSettingsBundleController *)self llextensions];
  uint64_t v12 = [v11 count];

  v13 = TPSLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134218752;
    uint64_t v16 = v4;
    __int16 v17 = 2048;
    uint64_t v18 = v7;
    __int16 v19 = 2048;
    uint64_t v20 = v10;
    __int16 v21 = 2048;
    uint64_t v22 = v12;
    _os_log_impl(&dword_1E4DD4000, v13, OS_LOG_TYPE_DEFAULT, "shouldShow extensions=%ld service providers=%ld business calling specifiers=%ld liveLookupExtensionsCount=%ld", (uint8_t *)&v15, 0x2Au);
  }

  return (v4 | v7 | v10 | v12) == 0;
}

- (void)_updateExtensions
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v3 = [(PHCallBlockingAndIdentificationSettingsBundleController *)self extensionManager];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __76__PHCallBlockingAndIdentificationSettingsBundleController__updateExtensions__block_invoke;
  v4[3] = &unk_1E6EB21A8;
  v4[4] = self;
  [v3 extensionsWithCompletionHandler:v4];
}

void __76__PHCallBlockingAndIdentificationSettingsBundleController__updateExtensions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__PHCallBlockingAndIdentificationSettingsBundleController__updateExtensions__block_invoke_2;
  block[3] = &unk_1E6EB2180;
  id v10 = v5;
  id v11 = v6;
  uint64_t v12 = *(void *)(a1 + 32);
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __76__PHCallBlockingAndIdentificationSettingsBundleController__updateExtensions__block_invoke_2(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = TPSLog();
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v5;
      _os_log_impl(&dword_1E4DD4000, v4, OS_LOG_TYPE_DEFAULT, "Received call directory extensions %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __76__PHCallBlockingAndIdentificationSettingsBundleController__updateExtensions__block_invoke_2_cold_1(a1, v4);
  }

  id v6 = *(void **)(a1 + 32);
  if (!v6
    || ([*(id *)(a1 + 48) extensions],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v6 isEqualToArray:v7],
        v7,
        (v8 & 1) == 0))
  {
    dispatch_queue_t v9 = [MEMORY[0x1E4F1CA48] array];
    [*(id *)(a1 + 48) setExtensions:v9];

    id v10 = [MEMORY[0x1E4F1CA48] array];
    [*(id *)(a1 + 48) setLlextensions:v10];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = *(id *)(a1 + 32);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if ((unint64_t)(objc_msgSend(v16, "state", (void)v20) - 1) <= 3)
          {
            __int16 v17 = [*(id *)(a1 + 48) extensions];
            [v17 addObject:v16];

            uint64_t v18 = [*(id *)(a1 + 48) llextensions];
            [v18 addObject:v16];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v13);
    }
  }
  return objc_msgSend(*(id *)(a1 + 48), "updateParentListController", (void)v20);
}

- (PSListController)parentListController
{
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F92EE8]));
  return (PSListController *)WeakRetained;
}

- (void)extensionsChangedForCallDirectoryExtensionManager:(id)a3
{
  uint64_t v4 = TPSLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1E4DD4000, v4, OS_LOG_TYPE_DEFAULT, "Call directory extensions have changed", v5, 2u);
  }

  [(PHCallBlockingAndIdentificationSettingsBundleController *)self _updateExtensions];
}

- (void)didChangeServiceProvidersForCallBlockingServiceProviderController:(id)a3
{
  uint64_t v4 = TPSLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1E4DD4000, v4, OS_LOG_TYPE_DEFAULT, "Call blocking service providers have changed", v5, 2u);
  }

  [(PHCallBlockingAndIdentificationSettingsBundleController *)self updateParentListController];
}

- (BOOL)shouldInsert
{
  v3 = [(PHCallBlockingAndIdentificationSettingsBundleController *)self parentListController];
  uint64_t v4 = [(PHCallBlockingAndIdentificationSettingsBundleController *)self parentListController];
  uint64_t v5 = [v4 specifierID];

  id v6 = [v3 specifierForID:@"CALL_DIRECTORIES"];

  if (!v6)
  {
    if ([v5 isEqualToString:@"com.apple.preferences.phone"])
    {
      LOBYTE(v7) = 1;
      goto LABEL_3;
    }
    if ([v5 isEqualToString:@"com.apple.preferences.facetime"])
    {
      int v7 = [MEMORY[0x1E4FADA88] supportsPrimaryCalling] ^ 1;
      goto LABEL_3;
    }
  }
  LOBYTE(v7) = 0;
LABEL_3:

  return v7;
}

- (void)updateParentListController
{
  id v4 = [(PHCallBlockingAndIdentificationSettingsBundleController *)self parentListController];
  [v4 beginUpdates];
  if ([(PHCallBlockingAndIdentificationSettingsBundleController *)self isHidden])
  {
    [v4 removeSpecifierID:@"CALL_DIRECTORIES"];
  }
  else if ([(PHCallBlockingAndIdentificationSettingsBundleController *)self shouldInsert])
  {
    v3 = [(PHCallBlockingAndIdentificationSettingsBundleController *)self callDirectorySpecifier];
    [v4 insertSpecifier:v3 afterSpecifierID:@"SILENCE_CALLS"];
  }
  [v4 endUpdates];
}

- (PSSpecifier)callDirectorySpecifier
{
  return self->_callDirectorySpecifier;
}

- (void)setCallDirectorySpecifier:(id)a3
{
}

- (NSMutableArray)extensions
{
  return self->_extensions;
}

- (void)setExtensions:(id)a3
{
}

- (NSMutableArray)llextensions
{
  return self->_llextensions;
}

- (void)setLlextensions:(id)a3
{
}

- (CXCallDirectoryExtensionManager)extensionManager
{
  return self->_extensionManager;
}

- (PHCallBlockingServiceProviderController)serviceProviderController
{
  return self->_serviceProviderController;
}

- (PHBusinessCallingController)businessCallingController
{
  return self->_businessCallingController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessCallingController, 0);
  objc_storeStrong((id *)&self->_serviceProviderController, 0);
  objc_storeStrong((id *)&self->_extensionManager, 0);
  objc_storeStrong((id *)&self->_llextensions, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_callDirectorySpecifier, 0);
}

void __76__PHCallBlockingAndIdentificationSettingsBundleController__updateExtensions__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1E4DD4000, a2, OS_LOG_TYPE_ERROR, "Error retrieving extensions: %@", (uint8_t *)&v3, 0xCu);
}

@end