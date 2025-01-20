@interface SFWebExtension
- (BOOL)_applicationIsActive;
- (BOOL)_canShowBanner;
- (BOOL)canLoadWithErrorString:(id *)a3;
- (BOOL)isDevelopmentBuild;
- (WKWebViewConfiguration)extensionWebViewConfiguration;
- (id)_lastInteractionDate;
- (id)_updateLastInteractionDate;
- (void)_hidePermissionBanner;
- (void)_showAccessRequestDialogForPendingRequestsAndAdditionalURLs:(id)a3 additionalCallingAPIName:(id)a4 performingUserGestureInTab:(id)a5 completionHandler:(id)a6;
- (void)permissionRequestBannerWasDismissed;
- (void)promptForAccessToURLs:(id)a3 inTab:(id)a4 completionHandler:(id)a5;
- (void)requestPermissionsFromToolbarItemInTab:(id)a3 completionHandler:(id)a4;
- (void)showAlertForPendingPermissionRequests;
- (void)showOrHidePermissionRequestBannerIfNeeded;
- (void)userGesturePerformedInTab:(id)a3;
@end

@implementation SFWebExtension

- (WKWebViewConfiguration)extensionWebViewConfiguration
{
  v2 = [(WBSWebExtensionData *)self webKitContext];
  v3 = [v2 webViewConfiguration];

  return (WKWebViewConfiguration *)v3;
}

- (BOOL)_applicationIsActive
{
  return [(id)*MEMORY[0x1E4FB2608] applicationState] == 0;
}

- (void)promptForAccessToURLs:(id)a3 inTab:(id)a4 completionHandler:(id)a5
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  if (self->_isAccessRequestDialogPresentedOrScheduled)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __64__SFWebExtension_promptForAccessToURLs_inTab_completionHandler___block_invoke;
    aBlock[3] = &unk_1E54EC260;
    objc_copyWeak(&v55, &location);
    id v52 = v8;
    id v53 = v9;
    id v54 = v10;
    v11 = _Block_copy(aBlock);
    accessRequestDialogCompletionHandlers = self->_accessRequestDialogCompletionHandlers;
    v13 = _Block_copy(v11);
    v14 = [(NSArray *)accessRequestDialogCompletionHandlers arrayByAddingObject:v13];
    v15 = v14;
    if (v14)
    {
      v16 = v14;
      v17 = self->_accessRequestDialogCompletionHandlers;
      self->_accessRequestDialogCompletionHandlers = v16;
    }
    else
    {
      v17 = _Block_copy(v11);
      v57[0] = v17;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:1];
      v21 = self->_accessRequestDialogCompletionHandlers;
      self->_accessRequestDialogCompletionHandlers = v20;
    }
    objc_destroyWeak(&v55);
  }
  else if ([v8 count])
  {
    v18 = [(WBSSafariExtension *)self extensionsController];
    if ([v18 parentalControlsAreEnabledForExtensions])
    {
      v19 = [MEMORY[0x1E4F1CAD0] set];
      (*((void (**)(id, void *, void))v10 + 2))(v10, v19, 0);
    }
    else
    {
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __64__SFWebExtension_promptForAccessToURLs_inTab_completionHandler___block_invoke_2;
      v47[3] = &unk_1E54EC2B0;
      id v48 = v8;
      v49 = self;
      id v50 = v9;
      v22 = (void (**)(void))_Block_copy(v47);
      v23 = [(WBSWebExtensionData *)self toolbarItem];
      char v24 = [v23 showingExtensionPopup];

      if (v24)
      {
        v25 = v22[2](v22);
        if ([v25 count])
        {
          v41[0] = MEMORY[0x1E4F143A8];
          v41[1] = 3221225472;
          v41[2] = __64__SFWebExtension_promptForAccessToURLs_inTab_completionHandler___block_invoke_6;
          v41[3] = &unk_1E54E9D78;
          id v42 = v10;
          [(SFWebExtension *)self _showAccessRequestDialogForPendingRequestsAndAdditionalURLs:v25 additionalCallingAPIName:0 performingUserGestureInTab:0 completionHandler:v41];
          v26 = v42;
        }
        else
        {
          v26 = [MEMORY[0x1E4F1CAD0] set];
          (*((void (**)(id, void *, void))v10 + 2))(v10, v26, 0);
        }
      }
      else
      {
        BOOL v27 = [(WBSWebExtensionData *)self hasPendingWebsiteRequests];
        v25 = v22[2](v22);
        if ([v25 count]) {
          char v28 = 1;
        }
        else {
          char v28 = v27;
        }
        if ((v28 & 1) != 0
          && ((+[WBSWebExtensionsController pendingSiteAccessTimeoutInterval], double v30 = v29, v29 > 0.0)? (v31 = 1): (v31 = v27), (v31 & 1) != 0))
        {
          dispatch_time_t v32 = dispatch_time(0, (uint64_t)((v29 + 1.0) * 1000000000.0));
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __64__SFWebExtension_promptForAccessToURLs_inTab_completionHandler___block_invoke_4;
          block[3] = &unk_1E54EA1B8;
          objc_copyWeak(&v46, &location);
          dispatch_after(v32, MEMORY[0x1E4F14428], block);
          id v33 = objc_alloc_init(MEMORY[0x1E4F98FB0]);
          v34 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v30];
          [v33 setExpirationDate:v34];

          [v33 setUrls:v25];
          v43[0] = MEMORY[0x1E4F143A8];
          v43[1] = 3221225472;
          v43[2] = __64__SFWebExtension_promptForAccessToURLs_inTab_completionHandler___block_invoke_5;
          v43[3] = &unk_1E54EB568;
          id v44 = v10;
          [v33 setCompletionHandler:v43];
          uint64_t v35 = (int)*MEMORY[0x1E4F99018];
          v36 = *(Class *)((char *)&self->super.super.super.isa + v35);
          if (!v36)
          {
            uint64_t v37 = [MEMORY[0x1E4F1CA48] array];
            v38 = (void **)((char *)&self->super.super.super.isa + v35);
            v39 = *v38;
            *v38 = (void *)v37;

            v36 = *v38;
          }
          [v36 addObject:v33];
          [(WBSWebExtensionData *)self _validateToolbarItemInAllWindows];

          objc_destroyWeak(&v46);
        }
        else
        {
          v40 = [MEMORY[0x1E4F1CAD0] set];
          (*((void (**)(id, void *, void))v10 + 2))(v10, v40, 0);
        }
      }

      v19 = v48;
    }
  }
  else
  {
    (*((void (**)(id, id, void))v10 + 2))(v10, v8, 0);
  }
  objc_destroyWeak(&location);
}

void __64__SFWebExtension_promptForAccessToURLs_inTab_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained promptForAccessToURLs:*(void *)(a1 + 32) inTab:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
    id WeakRetained = v3;
  }
}

id __64__SFWebExtension_promptForAccessToURLs_inTab_completionHandler___block_invoke_2(void *a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__SFWebExtension_promptForAccessToURLs_inTab_completionHandler___block_invoke_3;
  v5[3] = &unk_1E54EC288;
  v1 = (void *)a1[4];
  v2 = (void *)a1[6];
  v5[4] = a1[5];
  id v6 = v2;
  id v3 = objc_msgSend(v1, "safari_mapAndFilterObjectsUsingBlock:", v5);

  return v3;
}

id __64__SFWebExtension_promptForAccessToURLs_inTab_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) webKitContext];
  uint64_t v5 = [v4 permissionStatusForURL:v3 inTab:*(void *)(a1 + 40)];

  if (v5 == 1 || v5 == -1) {
    id v7 = v3;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

void __64__SFWebExtension_promptForAccessToURLs_inTab_completionHandler___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained dispatchExpiredPendingWebsiteRequests];
    id WeakRetained = v2;
  }
}

void __64__SFWebExtension_promptForAccessToURLs_inTab_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F1CAD0] set];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

void __64__SFWebExtension_promptForAccessToURLs_inTab_completionHandler___block_invoke_6(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F1CAD0] set];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

- (void)_showAccessRequestDialogForPendingRequestsAndAdditionalURLs:(id)a3 additionalCallingAPIName:(id)a4 performingUserGestureInTab:(id)a5 completionHandler:(id)a6
{
  id v36 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [(WBSWebExtensionData *)self urlsPendingApproval];
  uint64_t v31 = [v13 count];
  if (v13)
  {
    id v14 = v13;
  }
  else
  {
    id v14 = [MEMORY[0x1E4F1CAD0] set];
  }
  v15 = v14;
  if (v36)
  {
    uint64_t v16 = [v14 setByAddingObjectsFromSet:v36];

    v15 = (void *)v16;
  }
  id v33 = objc_msgSend(v15, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_36);
  self->_isAccessRequestDialogPresentedOrScheduled = 1;
  v17 = [(WBSWebExtensionData *)self apiNamesPendingApproval];
  v18 = v17;
  if (v17)
  {
    id v19 = v17;
  }
  else
  {
    id v19 = [MEMORY[0x1E4F1CAD0] set];
  }
  v20 = v19;

  if (v10)
  {
    uint64_t v21 = [v20 setByAddingObject:v10];

    v20 = (void *)v21;
  }
  v22 = [v20 allObjects];
  uint64_t v32 = [v22 componentsJoinedByString:@", "];

  BOOL v23 = [(WBSWebExtensionData *)self hasMoreThanOneRequestedOriginNotAlreadyConfigured];
  char v24 = [(WBSSafariExtension *)self extensionsController];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __148__SFWebExtension__showAccessRequestDialogForPendingRequestsAndAdditionalURLs_additionalCallingAPIName_performingUserGestureInTab_completionHandler___block_invoke_2;
  aBlock[3] = &unk_1E54EC318;
  id v25 = v11;
  id v45 = v25;
  id v46 = self;
  id v26 = v15;
  id v47 = v26;
  id v27 = v12;
  id v48 = v27;
  char v28 = (void (**)(void *, uint64_t, void))_Block_copy(aBlock);
  v34 = v26;
  uint64_t v35 = v25;
  if ([v24 parentalControlsAreEnabledForExtensions])
  {
    v28[2](v28, 3, 0);
    double v29 = (void *)v32;
    double v30 = v33;
  }
  else
  {
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __148__SFWebExtension__showAccessRequestDialogForPendingRequestsAndAdditionalURLs_additionalCallingAPIName_performingUserGestureInTab_completionHandler___block_invoke_4;
    v37[3] = &unk_1E54EC340;
    BOOL v42 = v23;
    id v38 = v24;
    v39 = self;
    double v30 = v33;
    id v40 = v33;
    BOOL v43 = v31 != 0;
    v41 = v28;
    double v29 = (void *)v32;
    [v38 showAccessRequestDialogForExtension:self domains:v40 callingAPIName:v32 showMoreOptionsForAlwaysAllow:v23 includeDenyButton:v31 != 0 responseBlock:v37];
  }
}

id __148__SFWebExtension__showAccessRequestDialogForPendingRequestsAndAdditionalURLs_additionalCallingAPIName_performingUserGestureInTab_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 host];
  id v3 = objc_msgSend(v2, "safari_stringByRemovingWwwAndWildcardDotPrefixes");

  return v3;
}

void __148__SFWebExtension__showAccessRequestDialogForPendingRequestsAndAdditionalURLs_additionalCallingAPIName_performingUserGestureInTab_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a2 - 4) <= 0xFFFFFFFFFFFFFFFDLL && *(void *)(a1 + 32) != 0) {
    objc_msgSend(*(id *)(a1 + 40), "userGesturePerformedInTab:");
  }
  if (a3)
  {
    if ([*(id *)(a1 + 40) requestsAccessToAllHosts]) {
      [MEMORY[0x1E4F98FA0] allHostsAndSchemesMatchPatternSet];
    }
    else {
    uint64_t v7 = [*(id *)(a1 + 40) requestedPermissionOriginsNotAlreadyConfigured];
    }
  }
  else
  {
    uint64_t v7 = objc_msgSend(*(id *)(a1 + 48), "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_17);
  }
  uint64_t v31 = (void *)v7;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v8 = [*(id *)(a1 + 40) extensionsController];
  id v9 = [v8 allProfileExtensionsControllers];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (!v10)
  {
    char v12 = 0;
    goto LABEL_29;
  }
  uint64_t v11 = v10;
  char v12 = 0;
  uint64_t v13 = *(void *)v37;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v37 != v13) {
        objc_enumerationMutation(v9);
      }
      v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
      uint64_t v16 = [*(id *)(a1 + 40) extension];
      v17 = [v15 webExtensionForExtension:v16];

      [v15 loadPermissionsIfNecessaryForExtension:v17];
      if (a2 == 2)
      {
        v18 = [MEMORY[0x1E4F1CAD0] set];
        uint64_t v21 = [MEMORY[0x1E4F1C9C8] distantFuture];
        [v17 revokePermissions:v18 origins:v31 expirationDate:v21];
      }
      else
      {
        if (a2 == 1)
        {
          v18 = [MEMORY[0x1E4F1CAD0] set];
          v20 = (void *)MEMORY[0x1E4F1C9C8];
          +[WBSExtensionsController temporarySiteAccessTimeInterval];
          uint64_t v19 = objc_msgSend(v20, "dateWithTimeIntervalSinceNow:");
        }
        else
        {
          if (a2) {
            goto LABEL_25;
          }
          v18 = [MEMORY[0x1E4F1CAD0] set];
          uint64_t v19 = [MEMORY[0x1E4F1C9C8] distantFuture];
        }
        uint64_t v21 = (void *)v19;
        [v17 grantPermissions:v18 origins:v31 expirationDate:v19];
        char v12 = 1;
      }

LABEL_25:
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v36 objects:v41 count:16];
  }
  while (v11);
LABEL_29:

  [*(id *)(a1 + 40) dispatchAllPendingWebsiteRequests];
  uint64_t v22 = *(void *)(a1 + 56);
  if (v22) {
    (*(void (**)(uint64_t, void))(v22 + 16))(v22, v12 & 1);
  }
  *(unsigned char *)(*(void *)(a1 + 40) + 240) = 0;
  id v23 = *(id *)(*(void *)(a1 + 40) + 232);
  uint64_t v24 = *(void *)(a1 + 40);
  id v25 = *(void **)(v24 + 232);
  *(void *)(v24 + 232) = 0;

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v26 = v23;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v33 != v29) {
          objc_enumerationMutation(v26);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v32 + 1) + 8 * j) + 16))();
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v28);
  }
}

id __148__SFWebExtension__showAccessRequestDialogForPendingRequestsAndAdditionalURLs_additionalCallingAPIName_performingUserGestureInTab_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F98FA0];
  id v3 = [a2 host];
  v4 = objc_msgSend(v3, "safari_stringByRemovingWwwDotPrefix");
  uint64_t v5 = [v2 matchPatternForDomain:v4];

  return v5;
}

uint64_t __148__SFWebExtension__showAccessRequestDialogForPendingRequestsAndAdditionalURLs_additionalCallingAPIName_performingUserGestureInTab_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  if (a2 || !*(unsigned char *)(a1 + 64)) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else {
    return [*(id *)(a1 + 32) showAlwaysAllowConfirmationDialogForExtension:*(void *)(a1 + 40) domains:*(void *)(a1 + 48) includeDenyButton:*(unsigned __int8 *)(a1 + 65) responseBlock:*(void *)(a1 + 56)];
  }
}

- (id)_updateLastInteractionDate
{
  id v3 = [(WBSSafariExtension *)self extensionsController];
  uint64_t v4 = (int)*MEMORY[0x1E4F99010];
  uint64_t v5 = [v3 _extensionStateForExtension:*(Class *)((char *)&self->super.super.super.isa + v4)];
  id v6 = (void *)[v5 mutableCopy];

  uint64_t v7 = [MEMORY[0x1E4F1C9C8] now];
  [v6 setObject:v7 forKeyedSubscript:@"LastInteractionDate"];
  [v3 _setExtensionState:v6 forExtension:*(Class *)((char *)&self->super.super.super.isa + v4)];

  return v7;
}

- (id)_lastInteractionDate
{
  id v3 = [(WBSSafariExtension *)self extensionsController];
  uint64_t v4 = [v3 _extensionStateForExtension:*(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E4F99010])];
  uint64_t v5 = objc_msgSend(v4, "safari_dateForKey:", @"LastInteractionDate");

  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    id v6 = [(SFWebExtension *)self _updateLastInteractionDate];
  }
  uint64_t v7 = v6;

  return v7;
}

- (void)_hidePermissionBanner
{
  if (self->_isBannerShownOrScheduled)
  {
    id v3 = [(WBSSafariExtension *)self extensionsController];
    [v3 hidePermissionBannerForExtension:self];

    self->_isBannerShownOrScheduled = 0;
  }
}

- (BOOL)_canShowBanner
{
  id v2 = [(SFWebExtension *)self _lastInteractionDate];
  id v3 = [v2 dateByAddingTimeInterval:480.0];
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] now];
  [v4 timeIntervalSinceDate:v3];
  BOOL v6 = v5 < 0.0;

  return v6;
}

- (void)showOrHidePermissionRequestBannerIfNeeded
{
  id v4 = [(WBSSafariExtension *)self extensionsController];
  if ([(WBSWebExtensionData *)self hasPendingWebsiteRequests]
    && [(SFWebExtension *)self _canShowBanner])
  {
    id v3 = v4;
    if (!self->_isBannerShownOrScheduled)
    {
      [v4 showPermissionBannerForExtension:self];
      id v3 = v4;
      self->_isBannerShownOrScheduled = 1;
    }
  }
  else
  {
    id v3 = v4;
    if (self->_isBannerShownOrScheduled)
    {
      [v4 hidePermissionBannerForExtension:self];
      id v3 = v4;
      self->_isBannerShownOrScheduled = 0;
    }
  }
}

- (void)permissionRequestBannerWasDismissed
{
  id v3 = [(WBSSafariExtension *)self extensionsController];
  [(WBSWebExtensionData *)self dispatchAllPendingWebsiteRequests];
}

- (void)showAlertForPendingPermissionRequests
{
  id v3 = [(WBSSafariExtension *)self extensionsController];
  [(SFWebExtension *)self _showAccessRequestDialogForPendingRequestsAndAdditionalURLs:0 additionalCallingAPIName:0 performingUserGestureInTab:0 completionHandler:0];
}

- (void)requestPermissionsFromToolbarItemInTab:(id)a3 completionHandler:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  uint64_t v7 = [(WBSWebExtensionData *)self toolbarItem];
  int v8 = [v7 shouldRequestAccessForTab:v13];

  if (v8)
  {
    id v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = [v13 urlForExtensions];
    uint64_t v11 = [v9 setWithObject:v10];

    char v12 = @"action";
  }
  else
  {
    uint64_t v11 = 0;
    char v12 = 0;
  }
  [(SFWebExtension *)self _showAccessRequestDialogForPendingRequestsAndAdditionalURLs:v11 additionalCallingAPIName:v12 performingUserGestureInTab:v13 completionHandler:v6];
}

- (BOOL)canLoadWithErrorString:(id *)a3
{
  if ([(WBSWebExtensionData *)self backgroundPageIsPersistent])
  {
    double v5 = [(WBSWebExtensionData *)self manifestErrors];
    id v6 = v5;
    if (a3)
    {
      if ([v5 count])
      {
        uint64_t v7 = [v6 firstObject];
        *a3 = [v7 localizedDescription];
      }
    }

    return 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SFWebExtension;
    return [(WBSWebExtensionData *)&v9 canLoadWithErrorString:a3];
  }
}

- (void)userGesturePerformedInTab:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SFWebExtension;
  [(WBSWebExtensionData *)&v6 userGesturePerformedInTab:a3];
  id v4 = [(SFWebExtension *)self _updateLastInteractionDate];
  double v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:*MEMORY[0x1E4F99760] object:self];
}

- (BOOL)isDevelopmentBuild
{
  id v2 = [*(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E4F99010]) _plugIn];
  id v3 = [v2 entitlements];
  char v4 = objc_msgSend(v3, "safari_BOOLForKey:", @"get-task-allow");

  return v4;
}

- (void).cxx_destruct
{
}

@end