@interface PKServicePerformActionSetupViewController
- (unint64_t)supportedInterfaceOrientations;
- (void)configureWithPassUniqueIdentifier:(id)a3 actionType:(unint64_t)a4 completion:(id)a5;
- (void)dismiss;
- (void)performActionViewControllerDidCancel:(id)a3;
- (void)performActionViewControllerDidPerformAction:(id)a3;
- (void)setDisplayPropertiesWithScreenSize:(CGSize)a3 scale:(double)a4;
@end

@implementation PKServicePerformActionSetupViewController

- (unint64_t)supportedInterfaceOrientations
{
  if ([(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
  {
    return 30;
  }
  else
  {
    return 2;
  }
}

- (void)setDisplayPropertiesWithScreenSize:(CGSize)a3 scale:(double)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v14.CGFloat width = width;
    v14.CGFloat height = height;
    v8 = NSStringFromCGSize(v14);
    int v9 = 138543618;
    v10 = v8;
    __int16 v11 = 2048;
    double v12 = a4;
    _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Setting display properties with screenSize=%{public}@ scale=%.f", (uint8_t *)&v9, 0x16u);
  }
  PKSetDisplayProperties();
}

- (void)configureWithPassUniqueIdentifier:(id)a3 actionType:(unint64_t)a4 completion:(id)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  int v9 = (void (**)(id, void))a5;
  [(PKServicePerformActionSetupViewController *)self _hostAuditToken];
  v10 = SecTaskCreateWithAuditToken(0, &token);
  if (!v10) {
    goto LABEL_16;
  }
  __int16 v11 = v10;
  double v12 = (void *)SecTaskCopyValueForEntitlement(v10, (CFStringRef)*MEMORY[0x1E4F85148], 0);
  if (![v12 BOOLValue])
  {
    uint64_t v13 = (void *)SecTaskCopyValueForEntitlement(v11, (CFStringRef)*MEMORY[0x1E4F85140], 0);
    char v14 = [v13 BOOLValue];

    CFRelease(v11);
    if (v14) {
      goto LABEL_5;
    }
LABEL_16:
    v27 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v40 = [(PKServicePerformActionSetupViewController *)self _hostApplicationBundleIdentifier];
      *(_DWORD *)buf = 138543362;
      v50 = v40;
      _os_log_error_impl(&dword_19F450000, v27, OS_LOG_TYPE_ERROR, "%{public}@ missing entitlement", buf, 0xCu);
    }
    if (!v9) {
      goto LABEL_20;
    }
LABEL_19:
    v9[2](v9, 0);
LABEL_20:
    [(PKServicePerformActionSetupViewController *)self dismiss];
    goto LABEL_32;
  }
  CFRelease(v11);

LABEL_5:
  v15 = [MEMORY[0x1E4F84898] sharedInstance];
  v16 = [v15 passWithUniqueID:v8];
  v17 = [v16 paymentPass];

  if (!v17)
  {
    v18 = [MEMORY[0x1E4F84898] sharedInstanceWithRemoteLibrary];
    v19 = [v18 _remoteLibrary];
    v20 = [v19 passWithUniqueID:v8];
    v17 = [v20 paymentPass];

    if (!v17)
    {
      v38 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v39 = PKPaymentPassActionTypeToString();
        *(_DWORD *)buf = 138412290;
        v50 = v39;
        _os_log_impl(&dword_19F450000, v38, OS_LOG_TYPE_DEFAULT, "No payment pass to perform top up action %@", buf, 0xCu);
      }
      if (!v9) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }
  [v17 availableActions];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = [v21 countByEnumeratingWithState:&v44 objects:v54 count:16];
  if (!v22) {
    goto LABEL_29;
  }
  uint64_t v23 = v22;
  uint64_t v24 = *(void *)v45;
  while (2)
  {
    for (uint64_t i = 0; i != v23; ++i)
    {
      if (*(void *)v45 != v24) {
        objc_enumerationMutation(v21);
      }
      v26 = *(void **)(*((void *)&v44 + 1) + 8 * i);
      if ([v26 type] == a4)
      {
        id v42 = 0;
        uint64_t v43 = 0;
        char v28 = [v17 canPerformAction:v26 unableReason:&v43 displayableError:&v42];
        id v29 = v42;
        if ((v28 & 1) != 0 || v43 == 2)
        {
          v30 = [[PKPerformActionViewController alloc] initWithPass:v17 action:v26];
          [(PKPerformActionViewController *)v30 setDelegate:self];
          v31 = objc_alloc_init(PKNavigationController);
          [(PKNavigationController *)v31 setSupportedInterfaceOrientations:2];
          [(PKNavigationController *)v31 setModalPresentationStyle:3];
          v53 = v30;
          v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
          [(PKNavigationController *)v31 setViewControllers:v37 animated:1];

          [(UIViewController *)self pk_presentViewController:v31 animated:1 popToViewControllerAfterPresentation:0 completion:0];
          v32 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            v33 = PKPaymentPassActionTypeToString();
            *(_DWORD *)buf = 138412290;
            v50 = v33;
            v34 = "Presented PKPerformActionViewController for actionType %@";
            v35 = v32;
            uint32_t v36 = 12;
            goto LABEL_27;
          }
        }
        else
        {
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __101__PKServicePerformActionSetupViewController_configureWithPassUniqueIdentifier_actionType_completion___block_invoke;
          aBlock[3] = &unk_1E59CA7D0;
          aBlock[4] = self;
          v30 = (PKPerformActionViewController *)_Block_copy(aBlock);
          v31 = +[PKPerformActionViewController alertControllerForUnableReason:v43 action:v26 displayableError:v29 addCardActionHandler:0 unavailableActionHandler:v30 cancelActionHandler:v30];
          [(PKServicePerformActionSetupViewController *)self presentViewController:v31 animated:1 completion:0];
          v32 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            v33 = PKPaymentPassActionTypeToString();
            *(_DWORD *)buf = 138412546;
            v50 = v33;
            __int16 v51 = 2112;
            id v52 = v29;
            v34 = "PKPerformActionViewController unavailable for actionType %@, error: %@";
            v35 = v32;
            uint32_t v36 = 22;
LABEL_27:
            _os_log_impl(&dword_19F450000, v35, OS_LOG_TYPE_DEFAULT, v34, buf, v36);
          }
        }

        goto LABEL_29;
      }
    }
    uint64_t v23 = [v21 countByEnumeratingWithState:&v44 objects:v54 count:16];
    if (v23) {
      continue;
    }
    break;
  }
LABEL_29:

  if (v9) {
    v9[2](v9, 1);
  }

LABEL_32:
}

uint64_t __101__PKServicePerformActionSetupViewController_configureWithPassUniqueIdentifier_actionType_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismiss];
}

- (void)dismiss
{
  id v2 = [(PKServicePerformActionSetupViewController *)self _remoteViewControllerProxy];
  [v2 didCancelAction];
}

- (void)performActionViewControllerDidCancel:(id)a3
{
  [a3 setDelegate:0];

  [(PKServicePerformActionSetupViewController *)self dismiss];
}

- (void)performActionViewControllerDidPerformAction:(id)a3
{
  [a3 setDelegate:0];
  id v4 = [(PKServicePerformActionSetupViewController *)self _remoteViewControllerProxy];
  [v4 didPerformAction];
}

@end