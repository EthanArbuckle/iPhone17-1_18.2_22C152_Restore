@interface PXCloudPhotoWelcomeNavigationController
+ (BOOL)shouldPresentWelcomeViewController:(BOOL *)a3;
+ (id)new;
- (PXCloudPhotoWelcomeNavigationController)init;
- (PXCloudPhotoWelcomeNavigationController)initWithCoder:(id)a3;
- (PXCloudPhotoWelcomeNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (PXCloudPhotoWelcomeNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (PXCloudPhotoWelcomeNavigationController)initWithRootViewController:(id)a3;
- (PXCloudPhotoWelcomeNavigationController)initWithWelcomeController:(id)a3;
- (PXCloudPhotoWelcomeNavigationControllerDismissDelegate)dismissDelegate;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)setDismissDelegate:(id)a3;
@end

@implementation PXCloudPhotoWelcomeNavigationController

- (void).cxx_destruct
{
}

- (void)setDismissDelegate:(id)a3
{
}

- (PXCloudPhotoWelcomeNavigationControllerDismissDelegate)dismissDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dismissDelegate);
  return (PXCloudPhotoWelcomeNavigationControllerDismissDelegate *)WeakRetained;
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PXCloudPhotoWelcomeNavigationController;
  [(PXCloudPhotoWelcomeNavigationController *)&v6 dismissViewControllerAnimated:a3 completion:a4];
  v5 = [(PXCloudPhotoWelcomeNavigationController *)self dismissDelegate];
  [v5 navigationControllerDidDismissViewController:self];
}

- (PXCloudPhotoWelcomeNavigationController)initWithWelcomeController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXCloudPhotoWelcomeNavigationController;
  v5 = [(PXCloudPhotoWelcomeNavigationController *)&v8 initWithRootViewController:v4];
  objc_super v6 = v5;
  if (v5)
  {
    [(PXCloudPhotoWelcomeNavigationController *)v5 setDismissDelegate:v4];
    [(PXCloudPhotoWelcomeNavigationController *)v6 setNavigationBarHidden:1];
    [(PXCloudPhotoWelcomeNavigationController *)v6 setModalPresentationStyle:2];
  }

  return v6;
}

- (PXCloudPhotoWelcomeNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  objc_super v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCloudPhotoWelcomeNavigationController.m", 95, @"%s is not available as initializer", "-[PXCloudPhotoWelcomeNavigationController initWithNavigationBarClass:toolbarClass:]");

  abort();
}

- (PXCloudPhotoWelcomeNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCloudPhotoWelcomeNavigationController.m", 91, @"%s is not available as initializer", "-[PXCloudPhotoWelcomeNavigationController initWithNibName:bundle:]");

  abort();
}

- (PXCloudPhotoWelcomeNavigationController)initWithCoder:(id)a3
{
  id v5 = a3;
  objc_super v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCloudPhotoWelcomeNavigationController.m", 87, @"%s is not available as initializer", "-[PXCloudPhotoWelcomeNavigationController initWithCoder:]");

  abort();
}

- (PXCloudPhotoWelcomeNavigationController)initWithRootViewController:(id)a3
{
  id v5 = a3;
  objc_super v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCloudPhotoWelcomeNavigationController.m", 83, @"%s is not available as initializer", "-[PXCloudPhotoWelcomeNavigationController initWithRootViewController:]");

  abort();
}

- (PXCloudPhotoWelcomeNavigationController)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCloudPhotoWelcomeNavigationController.m", 79, @"%s is not available as initializer", "-[PXCloudPhotoWelcomeNavigationController init]");

  abort();
}

+ (id)new
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PXCloudPhotoWelcomeNavigationController.m", 75, @"%s is not available as initializer", "+[PXCloudPhotoWelcomeNavigationController new]");

  abort();
}

+ (BOOL)shouldPresentWelcomeViewController:(BOOL *)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(MEMORY[0x1E4F8A668], "pl_sharedAccountStore");
  id v5 = [v4 cachedPrimaryAppleAccount];

  char v6 = [v5 isEnabledForDataclass:*MEMORY[0x1E4F17A88]];
  char v7 = v6;
  if (a3) {
    *a3 = v6;
  }
  long long v37 = xmmword_1AB35A230;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  id v8 = (uint64_t (*)(void, long long *))getSCNetworkReachabilityCreateWithAddressSymbolLoc_ptr;
  v36 = getSCNetworkReachabilityCreateWithAddressSymbolLoc_ptr;
  if (!getSCNetworkReachabilityCreateWithAddressSymbolLoc_ptr)
  {
    uint64_t v28 = MEMORY[0x1E4F143A8];
    uint64_t v29 = 3221225472;
    v30 = __getSCNetworkReachabilityCreateWithAddressSymbolLoc_block_invoke;
    v31 = &unk_1E5DD2B08;
    v32 = &v33;
    v9 = SystemConfigurationLibrary();
    v34[3] = (uint64_t)dlsym(v9, "SCNetworkReachabilityCreateWithAddress");
    getSCNetworkReachabilityCreateWithAddressSymbolLoc_ptr = *(_UNKNOWN **)(v32[1] + 24);
    id v8 = (uint64_t (*)(void, long long *))v34[3];
  }
  _Block_object_dispose(&v33, 8);
  if (!v8)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    v22 = objc_msgSend(NSString, "stringWithUTF8String:", "SCNetworkReachabilityRef PLSCNetworkReachabilityCreateWithAddress(CFAllocatorRef, const struct sockaddr *)");
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, @"PXCloudPhotoWelcomeNavigationController.m", 28, @"%s", dlerror());

    goto LABEL_22;
  }
  v10 = (const void *)v8(*MEMORY[0x1E4F1CF80], &v37);
  if (v10)
  {
    int v27 = 0;
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x2020000000;
    v11 = (void (*)(const void *, int *))getSCNetworkReachabilityGetFlagsSymbolLoc_ptr;
    v36 = getSCNetworkReachabilityGetFlagsSymbolLoc_ptr;
    if (!getSCNetworkReachabilityGetFlagsSymbolLoc_ptr)
    {
      uint64_t v28 = MEMORY[0x1E4F143A8];
      uint64_t v29 = 3221225472;
      v30 = __getSCNetworkReachabilityGetFlagsSymbolLoc_block_invoke;
      v31 = &unk_1E5DD2B08;
      v32 = &v33;
      v12 = SystemConfigurationLibrary();
      v34[3] = (uint64_t)dlsym(v12, "SCNetworkReachabilityGetFlags");
      getSCNetworkReachabilityGetFlagsSymbolLoc_ptr = *(_UNKNOWN **)(v32[1] + 24);
      v11 = (void (*)(const void *, int *))v34[3];
    }
    _Block_object_dispose(&v33, 8);
    if (v11)
    {
      v11(v10, &v27);
      BOOL v13 = (v27 & 2) == 0;
      CFRelease(v10);
      if (v7 & 1 | (v5 == 0) | v13)
      {
        LOBYTE(v10) = 0;
        goto LABEL_18;
      }
      uint64_t v33 = 0;
      v34 = &v33;
      uint64_t v35 = 0x2050000000;
      v14 = (void *)getMCProfileConnectionClass_softClass;
      v36 = (void *)getMCProfileConnectionClass_softClass;
      if (!getMCProfileConnectionClass_softClass)
      {
        uint64_t v28 = MEMORY[0x1E4F143A8];
        uint64_t v29 = 3221225472;
        v30 = __getMCProfileConnectionClass_block_invoke;
        v31 = &unk_1E5DD2B08;
        v32 = &v33;
        __getMCProfileConnectionClass_block_invoke((uint64_t)&v28);
        v14 = (void *)v34[3];
      }
      id v15 = v14;
      _Block_object_dispose(&v33, 8);
      v16 = [v15 sharedConnection];
      uint64_t v33 = 0;
      v34 = &v33;
      uint64_t v35 = 0x2020000000;
      v17 = (void *)getMCFeatureCloudPhotoLibraryAllowedSymbolLoc_ptr;
      v36 = (void *)getMCFeatureCloudPhotoLibraryAllowedSymbolLoc_ptr;
      if (!getMCFeatureCloudPhotoLibraryAllowedSymbolLoc_ptr)
      {
        uint64_t v28 = MEMORY[0x1E4F143A8];
        uint64_t v29 = 3221225472;
        v30 = __getMCFeatureCloudPhotoLibraryAllowedSymbolLoc_block_invoke;
        v31 = &unk_1E5DD2B08;
        v32 = &v33;
        v18 = ManagedConfigurationLibrary();
        v19 = dlsym(v18, "MCFeatureCloudPhotoLibraryAllowed");
        *(void *)(v32[1] + 24) = v19;
        getMCFeatureCloudPhotoLibraryAllowedSymbolLoc_ptr = *(void *)(v32[1] + 24);
        v17 = (void *)v34[3];
      }
      _Block_object_dispose(&v33, 8);
      if (v17)
      {
        LOBYTE(v10) = [v16 BOOLRestrictionForFeature:*v17] != 2;

        goto LABEL_18;
      }
      v25 = [MEMORY[0x1E4F28B00] currentHandler];
      v26 = [NSString stringWithUTF8String:"NSString *getMCFeatureCloudPhotoLibraryAllowed(void)"];
      objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, @"PXCloudPhotoWelcomeNavigationController.m", 33, @"%s", dlerror());
    }
    else
    {
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      v24 = objc_msgSend(NSString, "stringWithUTF8String:", "Boolean PLSCNetworkReachabilityGetFlags(SCNetworkReachabilityRef, SCNetworkReachabilityFlags *)");
      objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, @"PXCloudPhotoWelcomeNavigationController.m", 29, @"%s", dlerror());
    }
LABEL_22:
    __break(1u);
  }
LABEL_18:

  return (char)v10;
}

@end