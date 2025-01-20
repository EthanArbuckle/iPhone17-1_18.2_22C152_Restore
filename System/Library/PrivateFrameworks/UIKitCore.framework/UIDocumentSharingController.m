@interface UIDocumentSharingController
- (BOOL)_collaborationUIEnabled;
- (BOOL)_legacyAppearance;
- (BOOL)_requiresCustomPresentationController;
- (BOOL)_showOnlyAddPeople;
- (BOOL)_showRootFolder;
- (NSString)_appName;
- (NSString)_auxiliaryActionTitle;
- (NSString)_headerActionTitle;
- (NSString)_headerSubtitle;
- (NSString)_initialHeaderSubtitle;
- (NSString)_mailSubject;
- (NSString)_mailTemplate;
- (NSString)_messageTemplate;
- (NSURL)rootFolderURL;
- (NSURL)url;
- (UIActivityViewController)activityViewController;
- (UIDocumentSharingController)initWithFileURL:(id)a3;
- (UIDocumentSharingController)initWithFileURL:(id)a3 error:(id *)a4;
- (UIImage)_thumbnail;
- (UIViewController)_originalPresentingViewController;
- (UIViewController)_strongReferenceToOurself;
- (_UIDocumentSharingControllerDelegate_Private)_privateDelegate;
- (_UIResilientRemoteViewContainerViewController)_childViewController;
- (_UIShareInvitationRemoteViewController)_remoteViewController;
- (id)_customPresentationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)_sharingViewPresentationController;
- (id)delegate;
- (void)_addResizingChildViewController:(id)a3;
- (void)_cloudSharingControllerDidActivateAddPeopleWithRemoteSourceX:(double)a3 y:(double)a4 width:(double)a5 height:(double)a6;
- (void)_cloudSharingControllerDidActivateShowActivityController;
- (void)_cloudSharingControllerDidChooseTransport:(id)a3;
- (void)_cloudSharingControllerDidUpdateRootFolderURL:(id)a3;
- (void)_didDismiss;
- (void)_dismissForActivityRepresentation:(id)a3;
- (void)_dismissViewControllerWithError:(id)a3;
- (void)_performAuxiliaryActionWithCompletion:(id)a3;
- (void)_performHeaderActionWithCompletion:(id)a3;
- (void)_presentationControllerDidDismiss:(id)a3;
- (void)_representFullscreenAfterActivityDismissal:(id)a3;
- (void)_setAppName:(id)a3;
- (void)_setAuxiliaryActionTitle:(id)a3;
- (void)_setChildViewController:(id)a3;
- (void)_setCollaborationUIEnabled:(BOOL)a3;
- (void)_setHeaderActionTitle:(id)a3;
- (void)_setHeaderSubtitle:(id)a3;
- (void)_setInitialHeaderSubtitle:(id)a3;
- (void)_setLegacyAppearance:(BOOL)a3;
- (void)_setMailSubject:(id)a3;
- (void)_setMailSubject:(id)a3 template:(id)a4;
- (void)_setMailTemplate:(id)a3;
- (void)_setMessageTemplate:(id)a3;
- (void)_setOriginalPresentingViewController:(id)a3;
- (void)_setPrivateDelegate:(id)a3;
- (void)_setShowOnlyAddPeople:(BOOL)a3;
- (void)_setShowRootFolder:(BOOL)a3;
- (void)_setStrongReferenceToOurself:(id)a3;
- (void)_setThumbnail:(id)a3;
- (void)_shareDidChange:(id)a3;
- (void)_shareWasMadePrivate;
- (void)_updatePresentationStyleForLegacyAppearance;
- (void)dealloc;
- (void)setActivityViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRootFolderURL:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation UIDocumentSharingController

- (UIDocumentSharingController)initWithFileURL:(id)a3
{
  return [(UIDocumentSharingController *)self initWithFileURL:a3 error:0];
}

- (UIDocumentSharingController)initWithFileURL:(id)a3 error:(id *)a4
{
  v63[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = [v7 absoluteString];
  if ([v8 length])
  {
    char v9 = [v7 isFileURL];

    if (v9)
    {
      v53.receiver = self;
      v53.super_class = (Class)UIDocumentSharingController;
      v10 = [(UIViewController *)&v53 init];
      if (!v10)
      {
        self = 0;
LABEL_32:
        self = self;
        v27 = self;
        goto LABEL_18;
      }
      v10->_legacyAppearance = dyld_program_sdk_at_least() ^ 1;
      objc_storeStrong((id *)&v10->_url, a3);
      uint64_t v59 = 0;
      v60 = &v59;
      uint64_t v61 = 0x2050000000;
      v11 = (void *)_MergedGlobals_7_16;
      uint64_t v62 = _MergedGlobals_7_16;
      if (!_MergedGlobals_7_16)
      {
        id location = (id)MEMORY[0x1E4F143A8];
        uint64_t v55 = 3221225472;
        v56 = __getFPItemManagerClass_block_invoke;
        v57 = &unk_1E52D9900;
        v58 = &v59;
        __getFPItemManagerClass_block_invoke((uint64_t)&location);
        v11 = (void *)v60[3];
      }
      id v12 = v11;
      _Block_object_dispose(&v59, 8);
      v13 = [v12 defaultManager];
      id v52 = 0;
      v14 = [v13 itemForURL:v7 error:&v52];
      id v15 = v52;

      if (v14)
      {
        int v16 = [v14 isShared];
        if (!IsGelatoEnabled()
          || ((dyld_program_sdk_at_least() ^ 1 | v16) & 1) != 0
          || v10->_legacyAppearance)
        {
          v17 = (void *)MEMORY[0x1E4F28C70];
          v18 = CloudSharingUIExtensionBundleID();
          v19 = [v17 extensionWithIdentifier:v18 error:a4];

          if (v19)
          {
            [(UIViewController *)v10 _beginDelayingPresentation:0 cancellationHandler:3.0];
            uint64_t v59 = 0;
            v60 = &v59;
            uint64_t v61 = 0x2050000000;
            v20 = (void *)qword_1EB25D758;
            uint64_t v62 = qword_1EB25D758;
            if (!qword_1EB25D758)
            {
              id location = (id)MEMORY[0x1E4F143A8];
              uint64_t v55 = 3221225472;
              v56 = __getFPSandboxingURLWrapperClass_block_invoke_0;
              v57 = &unk_1E52D9900;
              v58 = &v59;
              __getFPSandboxingURLWrapperClass_block_invoke_0((uint64_t)&location);
              v20 = (void *)v60[3];
            }
            id v21 = v20;
            _Block_object_dispose(&v59, 8);
            id v44 = 0;
            v22 = [v21 wrapperWithURL:v7 readonly:0 error:&v44];
            v23 = (UIDocumentSharingController *)v44;
            v24 = v23;
            if (v22)
            {
              v41[0] = MEMORY[0x1E4F143A8];
              v41[1] = 3221225472;
              v41[2] = __53__UIDocumentSharingController_initWithFileURL_error___block_invoke_3;
              v41[3] = &unk_1E5311738;
              self = v10;
              v42 = self;
              id v43 = v22;
              v25 = +[_UIResilientRemoteViewContainerViewController instantiateWithExtension:v19 completion:v41];
              [(UIDocumentSharingController *)self _setChildViewController:v25];
              [(UIDocumentSharingController *)self _updatePresentationStyleForLegacyAppearance];

              int v26 = 0;
              v10 = v42;
            }
            else
            {
              NSLog(&cfstr_FailedToCreate_11.isa, v7, v23);
              self = 0;
              if (a4) {
                *a4 = v24;
              }
              int v26 = 1;
            }

            v10 = v24;
          }
          else
          {
            self = 0;
            int v26 = 1;
          }

          if (!v26) {
            goto LABEL_32;
          }
          goto LABEL_17;
        }
        id v51 = 0;
        uint64_t v29 = *MEMORY[0x1E4F1C538];
        id v50 = 0;
        char v30 = [v7 getResourceValue:&v51 forKey:v29 error:&v50];
        id v40 = v51;
        v31 = (UIDocumentSharingController *)v50;
        v32 = v31;
        if (v30)
        {
          id v33 = objc_alloc(MEMORY[0x1E4F28D78]);
          v34 = [v40 identifier];
          uint64_t v39 = [v33 initWithItem:v7 typeIdentifier:v34];

          v35 = [UIActivityItemsConfiguration alloc];
          v63[0] = v39;
          v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:1];
          v37 = [(UIActivityItemsConfiguration *)v35 initWithItemProviders:v36];

          objc_initWeak(&location, v10);
          v47[0] = MEMORY[0x1E4F143A8];
          v47[1] = 3221225472;
          v47[2] = __53__UIDocumentSharingController_initWithFileURL_error___block_invoke;
          v47[3] = &unk_1E5311710;
          objc_copyWeak(&v49, &location);
          id v48 = v7;
          [(UIActivityItemsConfiguration *)v37 setMetadataProvider:v47];
          v38 = (void *)[objc_alloc(MEMORY[0x1E4F9F2E8]) initWithActivityItemsConfiguration:v37];
          [v38 setAllowsEmbedding:1];
          [v38 setCollaborationMode:4];
          v45[0] = MEMORY[0x1E4F143A8];
          v45[1] = 3221225472;
          v45[2] = __53__UIDocumentSharingController_initWithFileURL_error___block_invoke_2;
          v45[3] = &unk_1E5311588;
          objc_copyWeak(&v46, &location);
          [v38 setCompletionWithItemsHandler:v45];
          [(UIDocumentSharingController *)v10 _addResizingChildViewController:v38];
          [(UIDocumentSharingController *)v10 setActivityViewController:v38];
          self = v10;
          objc_destroyWeak(&v46);

          objc_destroyWeak(&v49);
          objc_destroyWeak(&location);

          v10 = (UIDocumentSharingController *)v39;
        }
        else
        {
          if (a4) {
            *a4 = v31;
          }
          NSLog(&cfstr_UnableToGetUti.isa, v7, v32);
          self = 0;
        }

        v10 = v32;
      }
      else
      {
        if (a4) {
          *a4 = v15;
        }
        NSLog(&cfstr_UnableToGetFpi.isa, v7, v15);
        self = 0;
      }

      v27 = self;
      goto LABEL_18;
    }
  }
  else
  {
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"must pass a valid file URL to -[%@ initWithFileURL:]", objc_opt_class() format];
LABEL_17:
  v27 = 0;
LABEL_18:

  return v27;
}

id __53__UIDocumentSharingController_initWithFileURL_error___block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_4;
  }
  if (@"title" == v3)
  {
    id v7 = *(void **)(a1 + 32);
    id v16 = 0;
    uint64_t v8 = *MEMORY[0x1E4F1C6C8];
    id v15 = 0;
    char v9 = [v7 getResourceValue:&v16 forKey:v8 error:&v15];
    id v10 = v16;
    id v11 = v15;
    id v12 = v11;
    if (v9)
    {
      id v6 = v10;
    }
    else
    {
      NSLog(&cfstr_UnableToGetDis.isa, *(void *)(a1 + 32), v11);
      v13 = [*(id *)(a1 + 32) lastPathComponent];
      id v6 = [v13 stringByDeletingPathExtension];
    }
    goto LABEL_10;
  }
  if (@"thumbnail" == v3)
  {
    id v6 = [WeakRetained _thumbnail];
  }
  else
  {
LABEL_4:
    id v6 = 0;
  }
LABEL_10:

  return v6;
}

void __53__UIDocumentSharingController_initWithFileURL_error___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didDismiss];
}

void __53__UIDocumentSharingController_initWithFileURL_error___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = objc_opt_class();
    NSLog(&cfstr_RemoteViewCont.isa, v8, v7);
  }
  else
  {
    [v6 setPublicController:*(void *)(a1 + 32)];
    char v9 = [v6 serviceViewControllerProxy];
    [v9 _setLegacyAppearance:*(unsigned __int8 *)(*(void *)(a1 + 32) + 979)];
    id v10 = [*(id *)(a1 + 32) _thumbnail];

    if (v10)
    {
      id v11 = [*(id *)(a1 + 32) _thumbnail];
      [v9 _setThumbnail:v11];
    }
    id v12 = [*(id *)(a1 + 32) _auxiliaryActionTitle];

    if (v12)
    {
      v13 = [*(id *)(a1 + 32) _auxiliaryActionTitle];
      [v9 _setAuxiliaryActionTitle:v13];
    }
    v14 = [*(id *)(a1 + 32) _mailTemplate];

    if (v14)
    {
      id v15 = [*(id *)(a1 + 32) _mailSubject];
      id v16 = [*(id *)(a1 + 32) _mailTemplate];
      [v9 _setMailSubject:v15 template:v16];
    }
    v17 = [*(id *)(a1 + 32) _initialHeaderSubtitle];

    if (v17)
    {
      v18 = [*(id *)(a1 + 32) _initialHeaderSubtitle];
      [v9 _setInitialHeaderSubtitle:v18];
    }
    v19 = [*(id *)(a1 + 32) _headerSubtitle];

    if (v19)
    {
      v20 = [*(id *)(a1 + 32) _headerSubtitle];
      [v9 _setHeaderSubtitle:v20];
    }
    id v21 = [*(id *)(a1 + 32) _headerActionTitle];

    if (v21)
    {
      v22 = [*(id *)(a1 + 32) _headerActionTitle];
      [v9 _setHeaderActionTitle:v22];
    }
    v23 = [*(id *)(a1 + 32) _messageTemplate];

    if (v23)
    {
      v24 = [*(id *)(a1 + 32) _messageTemplate];
      [v9 _setMessageTemplate:v24];
    }
    if ([*(id *)(a1 + 32) _collaborationUIEnabled]) {
      objc_msgSend(v9, "_setCollaborationUIEnabled:", objc_msgSend(*(id *)(a1 + 32), "_collaborationUIEnabled"));
    }
    int v25 = [*(id *)(a1 + 32) _showOnlyAddPeople];
    int v26 = *(void **)(a1 + 32);
    if (v25)
    {
      objc_msgSend(v9, "_setShowAddPeople:", objc_msgSend(v26, "_showOnlyAddPeople"));
    }
    else if ([v26 _showRootFolder])
    {
      objc_msgSend(v9, "_setShowRootFolder:", objc_msgSend(*(id *)(a1 + 32), "_showRootFolder"));
    }
    v27 = [*(id *)(a1 + 32) _appName];
    [v9 _setAppName:v27];

    [v9 _setSandboxingURLWrapper:*(void *)(a1 + 40)];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __53__UIDocumentSharingController_initWithFileURL_error___block_invoke_4;
    v28[3] = &unk_1E52F2248;
    id v29 = *(id *)(a1 + 32);
    [v9 _prepareForDisplayWithCompletion:v28];
  }
}

uint64_t __53__UIDocumentSharingController_initWithFileURL_error___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:");
  v2 = *(void **)(a1 + 32);
  return [v2 _endDelayingPresentation];
}

- (void)dealloc
{
  v3 = [(UIDocumentSharingController *)self _remoteViewController];
  [v3 setPublicController:0];

  v4.receiver = self;
  v4.super_class = (Class)UIDocumentSharingController;
  [(UIViewController *)&v4 dealloc];
}

- (void)_presentationControllerDidDismiss:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIDocumentSharingController;
  [(UIViewController *)&v4 _presentationControllerDidDismiss:a3];
  [(UIDocumentSharingController *)self _didDismiss];
}

- (void)_setLegacyAppearance:(BOOL)a3
{
  if (self->_legacyAppearance != a3)
  {
    self->_legacyAppearance = a3;
    [(UIDocumentSharingController *)self _updatePresentationStyleForLegacyAppearance];
  }
}

- (void)_updatePresentationStyleForLegacyAppearance
{
  if (self->_legacyAppearance) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = 7;
  }
  [(UIViewController *)self setModalPresentationStyle:v2];
}

- (_UIShareInvitationRemoteViewController)_remoteViewController
{
  return (_UIShareInvitationRemoteViewController *)[(_UIResilientRemoteViewContainerViewController *)self->_childViewController remoteViewController];
}

- (NSString)_appName
{
  appName = self->_appName;
  if (appName)
  {
    v3 = appName;
  }
  else
  {
    v3 = [(id)UIApp _localizedApplicationName];
  }
  return v3;
}

- (void)_setChildViewController:(id)a3
{
  v5 = (_UIResilientRemoteViewContainerViewController *)a3;
  if (self->_childViewController)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIDocumentSharingController.m", 315, @"%s: remote view controller can only be set once", "-[UIDocumentSharingController _setChildViewController:]");

    childViewController = self->_childViewController;
  }
  else
  {
    childViewController = 0;
  }
  self->_childViewController = v5;
  uint64_t v8 = v5;

  [(UIDocumentSharingController *)self _addResizingChildViewController:v8];
}

- (void)_addResizingChildViewController:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  id v30 = v4;
  if (self && ((*(_DWORD *)&self->super._viewControllerFlags >> 1) & 3u) - 1 <= 1)
  {
    int v6 = 1;
    [v4 beginAppearanceTransition:1 animated:0];
    id v5 = v30;
  }
  else
  {
    int v6 = 0;
  }
  [(UIViewController *)self addChildViewController:v5];
  id v7 = [v30 view];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v8 = [(UIViewController *)self view];
  char v9 = [v30 view];
  [v8 addSubview:v9];

  id v10 = [(UIViewController *)self view];
  id v11 = (void *)MEMORY[0x1E4F5B268];
  id v12 = [(UIViewController *)self view];
  v13 = [v30 view];
  v14 = [v11 constraintWithItem:v12 attribute:7 relatedBy:0 toItem:v13 attribute:7 multiplier:1.0 constant:0.0];
  [v10 addConstraint:v14];

  id v15 = [(UIViewController *)self view];
  id v16 = (void *)MEMORY[0x1E4F5B268];
  v17 = [(UIViewController *)self view];
  v18 = [v30 view];
  v19 = [v16 constraintWithItem:v17 attribute:8 relatedBy:0 toItem:v18 attribute:8 multiplier:1.0 constant:0.0];
  [v15 addConstraint:v19];

  v20 = [(UIViewController *)self view];
  id v21 = (void *)MEMORY[0x1E4F5B268];
  v22 = [(UIViewController *)self view];
  v23 = [v30 view];
  v24 = [v21 constraintWithItem:v22 attribute:1 relatedBy:0 toItem:v23 attribute:1 multiplier:1.0 constant:0.0];
  [v20 addConstraint:v24];

  int v25 = [(UIViewController *)self view];
  int v26 = (void *)MEMORY[0x1E4F5B268];
  v27 = [(UIViewController *)self view];
  v28 = [v30 view];
  id v29 = [v26 constraintWithItem:v27 attribute:3 relatedBy:0 toItem:v28 attribute:3 multiplier:1.0 constant:0.0];
  [v25 addConstraint:v29];

  [v30 didMoveToParentViewController:self];
  if (v6) {
    [v30 endAppearanceTransition];
  }
}

- (void)_performAuxiliaryActionWithCompletion:(id)a3
{
  id v5 = (void (**)(void))a3;
  id v4 = [(UIDocumentSharingController *)self _privateDelegate];
  if (objc_opt_respondsToSelector())
  {
    [v4 _documentSharingControllerPerformAuxiliaryAction:self completion:v5];
  }
  else if (self->_legacyAppearance && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v4 shareInvitationViewControllerPerformAuxiliaryAction:self completion:v5];
  }
  else
  {
    v5[2]();
  }
}

- (void)_performHeaderActionWithCompletion:(id)a3
{
  id v5 = (void (**)(void))a3;
  id v4 = [(UIDocumentSharingController *)self _privateDelegate];
  if (self->_legacyAppearance && (objc_opt_respondsToSelector() & 1) != 0) {
    [v4 shareInvitationViewControllerPerformHeaderAction:self completion:v5];
  }
  else {
    v5[2]();
  }
}

- (void)_shareDidChange:(id)a3
{
  int v6 = [(UIDocumentSharingController *)self _privateDelegate];
  if (objc_opt_respondsToSelector())
  {
    [v6 _documentSharingControllerDidModifyShare:self];
LABEL_6:
    id v4 = v6;
    goto LABEL_7;
  }
  id v4 = v6;
  if (self->_legacyAppearance)
  {
    char v5 = objc_opt_respondsToSelector();
    id v4 = v6;
    if (v5)
    {
      [v6 shareInvitationViewControllerDidModifyShare:self];
      goto LABEL_6;
    }
  }
LABEL_7:
}

- (void)_shareWasMadePrivate
{
  char v5 = [(UIDocumentSharingController *)self _privateDelegate];
  if (objc_opt_respondsToSelector())
  {
    [v5 _documentSharingControllerDidStopSharing:self];
LABEL_6:
    v3 = v5;
    goto LABEL_7;
  }
  v3 = v5;
  if (self->_legacyAppearance)
  {
    char v4 = objc_opt_respondsToSelector();
    v3 = v5;
    if (v4)
    {
      [v5 shareInvitationViewControllerDidStopSharing:self];
      goto LABEL_6;
    }
  }
LABEL_7:
}

- (void)_setMailSubject:(id)a3 template:(id)a4
{
  id v6 = a4;
  [(UIDocumentSharingController *)self _setMailSubject:a3];
  [(UIDocumentSharingController *)self _setMailTemplate:v6];
}

- (void)_setAuxiliaryActionTitle:(id)a3
{
  if (self->_auxiliaryActionTitle != a3)
  {
    char v4 = (NSString *)[a3 copy];
    auxiliaryActionTitle = self->_auxiliaryActionTitle;
    self->_auxiliaryActionTitle = v4;

    id v7 = [(UIDocumentSharingController *)self _remoteViewController];
    id v6 = [v7 serviceViewControllerProxy];
    [v6 _setAuxiliaryActionTitle:self->_auxiliaryActionTitle];
  }
}

- (void)_setThumbnail:(id)a3
{
  char v5 = (UIImage *)a3;
  p_thumbnail = &self->_thumbnail;
  if (self->_thumbnail != v5)
  {
    char v9 = v5;
    objc_storeStrong((id *)&self->_thumbnail, a3);
    id v7 = [(UIDocumentSharingController *)self _remoteViewController];
    uint64_t v8 = [v7 serviceViewControllerProxy];
    [v8 _setThumbnail:*p_thumbnail];

    char v5 = v9;
  }
}

- (void)_didDismiss
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  strongReferenceToOurself = self->_strongReferenceToOurself;
  if (has_internal_diagnostics)
  {
    if (strongReferenceToOurself)
    {
      uint64_t v8 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        int v10 = 138412290;
        id v11 = self;
        _os_log_fault_impl(&dword_1853B0000, v8, OS_LOG_TYPE_FAULT, "Cyclic reference to %@ wasn't cleared out. This means that the view service didn't call us back.", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  else if (strongReferenceToOurself)
  {
    char v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_didDismiss___s_category_0) + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = self;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Cyclic reference to %@ wasn't cleared out. This means that the view service didn't call us back.", (uint8_t *)&v10, 0xCu);
    }
  }
  char v5 = self->_strongReferenceToOurself;
  self->_strongReferenceToOurself = 0;

  id v6 = [(UIDocumentSharingController *)self _childViewController];
  [v6 invalidate];

  id v7 = [(UIDocumentSharingController *)self _privateDelegate];
  if (objc_opt_respondsToSelector()) {
    [v7 _documentSharingControllerDidDismiss:self];
  }
}

- (void)_dismissViewControllerWithError:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(UIViewController *)self isBeingDismissed])
  {
    if (os_variant_has_internal_diagnostics())
    {
      if (v4)
      {
        id v7 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v11 = v4;
          _os_log_fault_impl(&dword_1853B0000, v7, OS_LOG_TYPE_FAULT, "%@ should never get error from service", buf, 0xCu);
        }
      }
    }
    else if (v4)
    {
      uint64_t v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_dismissViewControllerWithError____s_category) + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v11 = v4;
        _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "%@ should never get error from service", buf, 0xCu);
      }
    }
    char v5 = [(UIViewController *)self presentingViewController];

    if (v5)
    {
      id v6 = [(UIViewController *)self presentingViewController];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __63__UIDocumentSharingController__dismissViewControllerWithError___block_invoke;
      v9[3] = &unk_1E52D9F70;
      v9[4] = self;
      [v6 dismissViewControllerAnimated:1 completion:v9];
    }
    else
    {
      [(UIDocumentSharingController *)self _didDismiss];
    }
  }
}

uint64_t __63__UIDocumentSharingController__dismissViewControllerWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didDismiss];
}

- (void)_cloudSharingControllerDidUpdateRootFolderURL:(id)a3
{
  if (a3) {
    -[UIDocumentSharingController setRootFolderURL:](self, "setRootFolderURL:");
  }
}

- (void)_cloudSharingControllerDidActivateShowActivityController
{
  id v5 = [(UIViewController *)self view];
  [v5 bounds];
  double MidX = CGRectGetMidX(v7);
  id v4 = [(UIViewController *)self view];
  [v4 bounds];
  [(UIDocumentSharingController *)self _cloudSharingControllerDidActivateAddPeopleWithRemoteSourceX:MidX y:CGRectGetMidY(v8) width:0.0 height:0.0];
}

- (void)_cloudSharingControllerDidActivateAddPeopleWithRemoteSourceX:(double)a3 y:(double)a4 width:(double)a5 height:(double)a6
{
  v32[1] = *MEMORY[0x1E4F143B8];
  uint64_t v12 = [(UIDocumentSharingController *)self rootFolderURL];
  if (v12) {
    goto LABEL_2;
  }
  v13 = [(UIDocumentSharingController *)self url];

  if (!v13)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIDocumentSharingController.m", 512, @"%s: Expect a URL while presenting share sheet", "-[UIDocumentSharingController _cloudSharingControllerDidActivateAddPeopleWithRemoteSourceX:y:width:height:]");
LABEL_2:
  }
  v14 = [(UIDocumentSharingController *)self rootFolderURL];
  id v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = [(UIDocumentSharingController *)self url];
  }
  v17 = v16;

  id v18 = objc_alloc(MEMORY[0x1E4F9F2E8]);
  v32[0] = v17;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  v20 = (void *)[v18 initWithActivityItems:v19 applicationActivities:0];

  [v20 setCollaborationMode:4];
  uint64_t v31 = *MEMORY[0x1E4F9F358];
  id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  [v20 setExcludedActivityTypes:v21];

  v22 = [(UIViewController *)self view];
  v23 = [v20 popoverPresentationController];
  [v23 setSourceView:v22];

  v24 = [v20 popoverPresentationController];
  objc_msgSend(v24, "setSourceRect:", a3, a4, a5, a6);

  int v25 = [(UIDocumentSharingController *)self rootFolderURL];
  if (v25)
  {
    char v26 = objc_opt_respondsToSelector();

    if (v26)
    {
      v27 = [(UIDocumentSharingController *)self url];
      [v20 setManagedFileURL:v27];
    }
  }
  objc_initWeak(&location, self);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __107__UIDocumentSharingController__cloudSharingControllerDidActivateAddPeopleWithRemoteSourceX_y_width_height___block_invoke;
  v28[3] = &unk_1E5311588;
  objc_copyWeak(&v29, &location);
  [v20 setCompletionWithItemsHandler:v28];
  [(UIViewController *)self presentViewController:v20 animated:1 completion:0];
  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

void __107__UIDocumentSharingController__cloudSharingControllerDidActivateAddPeopleWithRemoteSourceX_y_width_height___block_invoke(uint64_t a1, uint64_t a2, int a3, uint64_t a4, void *a5)
{
  if (a3)
  {
    id v5 = (id *)(a1 + 32);
    id v6 = a5;
    id WeakRetained = objc_loadWeakRetained(v5);
    [WeakRetained _dismissViewControllerWithError:v6];
  }
}

- (void)_cloudSharingControllerDidChooseTransport:(id)a3
{
  id v5 = a3;
  id v4 = [(UIDocumentSharingController *)self _privateDelegate];
  if (objc_opt_respondsToSelector()) {
    [v4 _cloudSharingControllerDidChooseTransport:self transport:v5];
  }
}

- (BOOL)_requiresCustomPresentationController
{
  return [(UIViewController *)self modalPresentationStyle] == UIModalPresentationPopover;
}

- (id)_customPresentationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(UIPopoverPresentationController *)[_UISharingViewPresentationController alloc] initWithPresentedViewController:v8 presentingViewController:v9];
  objc_initWeak(&location, self);
  uint64_t v12 = [v10 view];
  [(UIPresentationController *)v11 setSourceView:v12];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __121__UIDocumentSharingController__customPresentationControllerForPresentedController_presentingController_sourceController___block_invoke;
  v14[3] = &unk_1E52DC308;
  objc_copyWeak(&v15, &location);
  [(_UISharingViewPresentationController *)v11 setDismissalHandler:v14];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v11;
}

void __121__UIDocumentSharingController__customPresentationControllerForPresentedController_presentingController_sourceController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didDismiss];
}

- (id)_sharingViewPresentationController
{
  uint64_t v2 = [(UIViewController *)self presentationController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (void)_dismissForActivityRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = [(UIViewController *)self presentingViewController];
  [(UIDocumentSharingController *)self _setOriginalPresentingViewController:v5];

  id v6 = [(UIDocumentSharingController *)self _sharingViewPresentationController];
  [v6 setSuppressDismissalHandlerUnlessDimmingViewTapped:1];

  CGRect v7 = [(UIViewController *)self presentingViewController];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__UIDocumentSharingController__dismissForActivityRepresentation___block_invoke;
  v9[3] = &unk_1E52DA160;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 dismissViewControllerAnimated:0 completion:v9];
}

uint64_t __65__UIDocumentSharingController__dismissForActivityRepresentation___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1000), *(id *)(a1 + 32));
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)_representFullscreenAfterActivityDismissal:(id)a3
{
  id v4 = a3;
  [(UIViewController *)self setModalPresentationStyle:5];
  id v5 = [(UIDocumentSharingController *)self _sharingViewPresentationController];
  [v5 setSuppressDismissalHandlerUnlessDimmingViewTapped:0];

  id v6 = [(UIDocumentSharingController *)self _originalPresentingViewController];
  [v6 presentViewController:self animated:0 completion:v4];

  strongReferenceToOurself = self->_strongReferenceToOurself;
  self->_strongReferenceToOurself = 0;

  objc_storeWeak((id *)&self->_originalPresentingViewController, 0);
}

- (_UIResilientRemoteViewContainerViewController)_childViewController
{
  return self->_childViewController;
}

- (UIViewController)_originalPresentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originalPresentingViewController);
  return (UIViewController *)WeakRetained;
}

- (void)_setOriginalPresentingViewController:(id)a3
{
}

- (UIViewController)_strongReferenceToOurself
{
  return self->_strongReferenceToOurself;
}

- (void)_setStrongReferenceToOurself:(id)a3
{
}

- (UIActivityViewController)activityViewController
{
  return self->_activityViewController;
}

- (void)setActivityViewController:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSURL)rootFolderURL
{
  return self->_rootFolderURL;
}

- (void)setRootFolderURL:(id)a3
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIImage)_thumbnail
{
  return self->_thumbnail;
}

- (NSString)_auxiliaryActionTitle
{
  return self->_auxiliaryActionTitle;
}

- (NSString)_mailTemplate
{
  return self->_mailTemplate;
}

- (void)_setMailTemplate:(id)a3
{
}

- (NSString)_messageTemplate
{
  return self->_messageTemplate;
}

- (void)_setMessageTemplate:(id)a3
{
}

- (NSString)_mailSubject
{
  return self->_mailSubject;
}

- (void)_setMailSubject:(id)a3
{
}

- (BOOL)_collaborationUIEnabled
{
  return self->_collaborationUIEnabled;
}

- (void)_setCollaborationUIEnabled:(BOOL)a3
{
  self->_collaborationUIEnabled = a3;
}

- (BOOL)_showOnlyAddPeople
{
  return self->_showOnlyAddPeople;
}

- (void)_setShowOnlyAddPeople:(BOOL)a3
{
  self->_showOnlyAddPeople = a3;
}

- (BOOL)_showRootFolder
{
  return self->_showRootFolder;
}

- (void)_setShowRootFolder:(BOOL)a3
{
  self->_showRootFolder = a3;
}

- (NSString)_initialHeaderSubtitle
{
  return self->_initialHeaderSubtitle;
}

- (void)_setInitialHeaderSubtitle:(id)a3
{
}

- (NSString)_headerSubtitle
{
  return self->_headerSubtitle;
}

- (void)_setHeaderSubtitle:(id)a3
{
}

- (NSString)_headerActionTitle
{
  return self->_headerActionTitle;
}

- (void)_setHeaderActionTitle:(id)a3
{
}

- (void)_setAppName:(id)a3
{
}

- (_UIDocumentSharingControllerDelegate_Private)_privateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__privateDelegate);
  return (_UIDocumentSharingControllerDelegate_Private *)WeakRetained;
}

- (void)_setPrivateDelegate:(id)a3
{
}

- (BOOL)_legacyAppearance
{
  return self->_legacyAppearance;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__privateDelegate);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_headerActionTitle, 0);
  objc_storeStrong((id *)&self->_headerSubtitle, 0);
  objc_storeStrong((id *)&self->_initialHeaderSubtitle, 0);
  objc_storeStrong((id *)&self->_mailSubject, 0);
  objc_storeStrong((id *)&self->_messageTemplate, 0);
  objc_storeStrong((id *)&self->_mailTemplate, 0);
  objc_storeStrong((id *)&self->_auxiliaryActionTitle, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_rootFolderURL, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_activityViewController, 0);
  objc_storeStrong((id *)&self->_strongReferenceToOurself, 0);
  objc_destroyWeak((id *)&self->_originalPresentingViewController);
  objc_storeStrong((id *)&self->_childViewController, 0);
}

@end