@interface PUCloudPhotoWelcomeViewController
+ (void)presentIfNecessaryFromViewController:(id)a3 presentationHandler:(id)a4 completionHandler:(id)a5;
+ (void)resetLastPresentationInfo;
- (PUCloudPhotoWelcomeViewController)initWithCompletionHandler:(id)a3;
- (PUCloudPhotoWelcomeViewController)initWithDefaultTitle;
- (id)_completionHandler;
- (void)_setCompletionHandler:(id)a3;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
@end

@implementation PUCloudPhotoWelcomeViewController

- (void).cxx_destruct
{
}

- (void)_setCompletionHandler:(id)a3
{
}

- (id)_completionHandler
{
  return self->__completionHandler;
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__PUCloudPhotoWelcomeViewController_dismissViewControllerAnimated_completion___block_invoke;
  v9[3] = &unk_1E5F2EA60;
  v9[4] = self;
  id v10 = v6;
  v8.receiver = self;
  v8.super_class = (Class)PUCloudPhotoWelcomeViewController;
  id v7 = v6;
  [(PUCloudPhotoWelcomeViewController *)&v8 dismissViewControllerAnimated:v4 completion:v9];
}

void __78__PUCloudPhotoWelcomeViewController_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  v3 = [*(id *)(a1 + 32) _completionHandler];

  if (v3)
  {
    BOOL v4 = [*(id *)(a1 + 32) _completionHandler];
    v4[2](v4, 1);

    v5 = *(void **)(a1 + 32);
    [v5 _setCompletionHandler:0];
  }
}

- (PUCloudPhotoWelcomeViewController)initWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PUCloudPhotoWelcomeViewController;
  v5 = [(PXCloudPhotoWelcomeViewController *)&v8 initWithDefaultTitle];
  if (v5)
  {
    id v6 = (void *)[v4 copy];
    [(PUCloudPhotoWelcomeViewController *)v5 _setCompletionHandler:v6];
  }
  return v5;
}

- (PUCloudPhotoWelcomeViewController)initWithDefaultTitle
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUCloudPhotoWelcomeViewController.m", 140, @"%s is not available as initializer", "-[PUCloudPhotoWelcomeViewController initWithDefaultTitle]");

  abort();
}

+ (void)resetLastPresentationInfo
{
  CFPreferencesSetAppValue(@"iCloudPhotoLibraryHasBeenWelcomedAccountIdentifiers", 0, @"com.apple.mobileslideshow");
  CFPreferencesSetAppValue(@"iCloudPhotoLibraryHasBeenEnabledAccountIdentifiers", 0, @"com.apple.mobileslideshow");
  CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
}

+ (void)presentIfNecessaryFromViewController:(id)a3 presentationHandler:(id)a4 completionHandler:(id)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  id v10 = [v7 presentedViewController];
  if (v10)
  {
    v11 = PLUIGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      *(void *)&buf[4] = objc_opt_class();
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v7;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = objc_opt_class();
      *(_WORD *)v53 = 2048;
      *(void *)&v53[2] = v10;
      _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_ERROR, "PUCloudPhotoWelcomeViewController: Bailing out! Presenting view controller:<%@:%p>, already has a presented view controller:<%@:%p>", buf, 0x2Au);
    }

    v9[2](v9, 2);
    goto LABEL_29;
  }
  v12 = objc_msgSend(MEMORY[0x1E4F8A668], "pl_sharedAccountStore");
  v42 = [v12 cachedPrimaryAppleAccount];

  int v39 = [v42 isEnabledForDataclass:*MEMORY[0x1E4F17A88]];
  long long v54 = xmmword_1AEFF7DA0;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x2020000000;
  v13 = (uint64_t (*)(void, long long *))getSCNetworkReachabilityCreateWithAddressSymbolLoc_ptr;
  v51 = getSCNetworkReachabilityCreateWithAddressSymbolLoc_ptr;
  if (!getSCNetworkReachabilityCreateWithAddressSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getSCNetworkReachabilityCreateWithAddressSymbolLoc_block_invoke;
    *(void *)&buf[24] = &unk_1E5F2E228;
    *(void *)v53 = &v48;
    v14 = SystemConfigurationLibrary();
    v15 = dlsym(v14, "SCNetworkReachabilityCreateWithAddress");
    *(void *)(*(void *)(*(void *)v53 + 8) + 24) = v15;
    getSCNetworkReachabilityCreateWithAddressSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)v53 + 8) + 24);
    v13 = (uint64_t (*)(void, long long *))v49[3];
  }
  _Block_object_dispose(&v48, 8);
  if (!v13)
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    v34 = objc_msgSend(NSString, "stringWithUTF8String:", "SCNetworkReachabilityRef PLSCNetworkReachabilityCreateWithAddress(CFAllocatorRef, const struct sockaddr *)");
    objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, @"PUCloudPhotoWelcomeViewController.m", 29, @"%s", dlerror());

    goto LABEL_32;
  }
  v16 = (const void *)v13(*MEMORY[0x1E4F1CF80], &v54);
  if (v16)
  {
    unsigned int v47 = 0;
    uint64_t v48 = 0;
    v49 = &v48;
    uint64_t v50 = 0x2020000000;
    v17 = (void (*)(const void *, unsigned int *))getSCNetworkReachabilityGetFlagsSymbolLoc_ptr;
    v51 = getSCNetworkReachabilityGetFlagsSymbolLoc_ptr;
    if (!getSCNetworkReachabilityGetFlagsSymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getSCNetworkReachabilityGetFlagsSymbolLoc_block_invoke;
      *(void *)&buf[24] = &unk_1E5F2E228;
      *(void *)v53 = &v48;
      v18 = SystemConfigurationLibrary();
      v19 = dlsym(v18, "SCNetworkReachabilityGetFlags");
      *(void *)(*(void *)(*(void *)v53 + 8) + 24) = v19;
      getSCNetworkReachabilityGetFlagsSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)v53 + 8) + 24);
      v17 = (void (*)(const void *, unsigned int *))v49[3];
    }
    _Block_object_dispose(&v48, 8);
    if (v17)
    {
      v17(v16, &v47);
      unsigned int v20 = v47;
      CFRelease(v16);
      int v38 = (v20 >> 1) & 1;
      goto LABEL_14;
    }
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    v36 = objc_msgSend(NSString, "stringWithUTF8String:", "Boolean PLSCNetworkReachabilityGetFlags(SCNetworkReachabilityRef, SCNetworkReachabilityFlags *)");
    objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, @"PUCloudPhotoWelcomeViewController.m", 30, @"%s", dlerror());

LABEL_32:
    __break(1u);
  }
  int v38 = 0;
LABEL_14:
  int v21 = PLCPLHasBeenEnabledForCurrentAccount();
  int v22 = PLCPLHasBeenWelcomedForCurrentAccount();
  v23 = [MEMORY[0x1E4F74230] sharedConnection];
  int v24 = [v23 BOOLRestrictionForFeature:*MEMORY[0x1E4F73FB0]];

  int v25 = PLIsRunningInStoreDemoMode();
  v26 = +[PUWelcomeSettings sharedInstance];
  uint64_t v27 = [v26 cloudPhotoWelcomeBehavior];

  int v28 = 1;
  if (!v27) {
    goto LABEL_25;
  }
  if (v27 == 1) {
    goto LABEL_22;
  }
  if (v27 != 2)
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2 object:a1 file:@"PUCloudPhotoWelcomeViewController.m" lineNumber:106 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  int v28 = 0;
  int v29 = v39;
  if (!v42) {
    int v29 = 1;
  }
  int v30 = v29 | v38 ^ 1 | v21 | v22;
  if (v24 == 2) {
    int v30 = 1;
  }
  if ((v30 | v25))
  {
LABEL_22:
    v31 = PLUIGetLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67110656;
      *(_DWORD *)&buf[4] = v42 != 0;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v39;
      *(_WORD *)&buf[14] = 1024;
      *(_DWORD *)&buf[16] = v21;
      *(_WORD *)&buf[20] = 1024;
      *(_DWORD *)&buf[22] = v38;
      *(_WORD *)&buf[26] = 1024;
      *(_DWORD *)&buf[28] = v22;
      *(_WORD *)v53 = 1024;
      *(_DWORD *)&v53[2] = v24 == 2;
      *(_WORD *)&v53[6] = 1024;
      *(_DWORD *)&v53[8] = v28;
      _os_log_impl(&dword_1AE9F8000, v31, OS_LOG_TYPE_DEFAULT, "PUCloudPhotoWelcomeViewController: Skipping! (iCloud:%d, iCPL Now:%d, iCPL Before:%d, Online:%d, Already Shown:%d, Restricted:%d, Debug Override:%d)", buf, 0x2Cu);
    }

    v9[2](v9, 0);
  }
  else
  {
LABEL_25:
    v32 = PLUIGetLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67110656;
      *(_DWORD *)&buf[4] = v42 != 0;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v39;
      *(_WORD *)&buf[14] = 1024;
      *(_DWORD *)&buf[16] = v21;
      *(_WORD *)&buf[20] = 1024;
      *(_DWORD *)&buf[22] = v38;
      *(_WORD *)&buf[26] = 1024;
      *(_DWORD *)&buf[28] = v22;
      *(_WORD *)v53 = 1024;
      *(_DWORD *)&v53[2] = v24 == 2;
      *(_WORD *)&v53[6] = 1024;
      *(_DWORD *)&v53[8] = v28;
      _os_log_impl(&dword_1AE9F8000, v32, OS_LOG_TYPE_DEFAULT, "PUCloudPhotoWelcomeViewController: Presenting! (iCloud:%d, iCPL Now:%d, iCPL Before:%d, Online:%d, Already Shown:%d, Restricted:%d, Debug Override:%d)", buf, 0x2Cu);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __112__PUCloudPhotoWelcomeViewController_presentIfNecessaryFromViewController_presentationHandler_completionHandler___block_invoke;
    block[3] = &unk_1E5F2E958;
    v45 = v9;
    id v44 = v7;
    id v46 = v8;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
LABEL_29:
}

void __112__PUCloudPhotoWelcomeViewController_presentIfNecessaryFromViewController_presentationHandler_completionHandler___block_invoke(uint64_t a1)
{
  PLCPLRecordWelcomeForCurrentAccount();
  v3 = [[PUCloudPhotoWelcomeViewController alloc] initWithCompletionHandler:*(void *)(a1 + 40)];
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F90050]) initWithWelcomeController:v3];
  [*(id *)(a1 + 32) presentViewController:v2 animated:1 completion:0];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

@end