@interface UICloudSharingController
+ (id)allowedSharingOptionsFromPermissions:(unint64_t)a3;
- (BOOL)_primaryAuxiliarySwitchState;
- (BOOL)_requiresCustomPresentationController;
- (BOOL)_secondaryAuxiliarySwitchState;
- (CKContainer)container;
- (CKContainerSetupInfo)containerSetupInfo;
- (CKShare)share;
- (CKSystemSharingUIObserver)_systemSharingUIObserver;
- (NSDictionary)_participantDetails;
- (NSString)_folderSubitemName;
- (NSString)_primaryAuxiliarySwitchTitle;
- (NSString)_rootFolderTitle;
- (NSString)_secondaryAuxiliarySwitchTitle;
- (NSString)_sectionTitleForAuxiliarySwitches;
- (UIActivityViewController)_activityViewController;
- (UICloudSharingController)initWithPreparationHandler:(void *)preparationHandler;
- (UICloudSharingController)initWithShare:(CKShare *)share container:(CKContainer *)container;
- (UICloudSharingController)initWithShare:(id)a3 preparationHandler:(id)a4;
- (UICloudSharingPermissionOptions)availablePermissions;
- (UIImage)_headerPrimaryImage;
- (UIImage)_headerSecondaryImage;
- (UIViewController)_originalPresentingViewController;
- (UIViewController)_strongReferenceToOurself;
- (_UICloudSharingControllerDelegate_Internal)internalDelegate;
- (_UIRemoteViewController)_containedRemoteViewController;
- (_UIResilientRemoteViewContainerViewController)_childViewController;
- (_UIShareInvitationRemoteViewController)_remoteViewController;
- (id)_customPresentationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)_sharingViewPresentationController;
- (id)activityItemSource;
- (id)createActivityLinkMetadata;
- (id)delegate;
- (id)excludedActivityTypes;
- (id)preparationHandler;
- (int64_t)modalPresentationStyle;
- (uint64_t)_commonInit;
- (void)__viewControllerWillBePresented:(BOOL)a3;
- (void)_callPreparationHandler:(id)a3;
- (void)_cloudSharingControllerDidActivateAddPeopleWithRemoteSourceX:(double)a3 y:(double)a4 width:(double)a5 height:(double)a6;
- (void)_cloudSharingControllerDidActivateShowActivityController;
- (void)_cloudSharingControllerDidActivateShowSharedFolder;
- (void)_cloudSharingControllerDidChooseTransport:(id)a3;
- (void)_cloudSharingControllerDidModifyPrimarySwitch:(BOOL)a3;
- (void)_cloudSharingControllerDidModifySecondarySwitch:(BOOL)a3;
- (void)_deleteShareAfterDismissalWithoutSave:(id)a3;
- (void)_didDismiss;
- (void)_dismissForActivityRepresentation:(id)a3;
- (void)_dismissViewControllerWithError:(id)a3;
- (void)_representFullscreenAfterActivityDismissal:(id)a3;
- (void)_sendDidStopSharingDelegate;
- (void)_setActivityViewController:(id)a3;
- (void)_setChildViewController:(id)a3;
- (void)_setFolderSubitemName:(id)a3;
- (void)_setHeaderPrimaryImage:(id)a3;
- (void)_setHeaderSecondaryImage:(id)a3;
- (void)_setOriginalPresentingViewController:(id)a3;
- (void)_setParticipantDetails:(id)a3;
- (void)_setPrimaryAuxiliarySwitchState:(BOOL)a3;
- (void)_setPrimaryAuxiliarySwitchTitle:(id)a3;
- (void)_setRootFolderTitle:(id)a3;
- (void)_setSecondaryAuxiliarySwitchState:(BOOL)a3;
- (void)_setSecondaryAuxiliarySwitchTitle:(id)a3;
- (void)_setSectionTitleForAuxiliarySwitches:(id)a3;
- (void)_setStrongReferenceToOurself:(id)a3;
- (void)_setSystemSharingUIObserver:(id)a3;
- (void)_shareDidChange:(id)a3;
- (void)_shareWasMadePrivate;
- (void)addResizingChildViewController:(id)a3;
- (void)dealloc;
- (void)setAvailablePermissions:(UICloudSharingPermissionOptions)availablePermissions;
- (void)setContainer:(id)a3;
- (void)setContainerSetupInfo:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setInternalDelegate:(id)a3;
- (void)setPreparationHandler:(id)a3;
- (void)setShare:(id)a3;
@end

@implementation UICloudSharingController

- (uint64_t)_commonInit
{
  v2 = [a1 preparationHandler];
  if (!v2)
  {
    uint64_t v3 = [a1 share];
    if (v3)
    {
      v4 = (void *)v3;
      v5 = [a1 container];

      if (v5) {
        goto LABEL_6;
      }
    }
    v2 = [MEMORY[0x1E4F28B00] currentHandler];
    [v2 handleFailureInMethod:sel__commonInit object:a1 file:@"UICloudSharingController.m" lineNumber:120 description:@"Must have either share or preparation handler set"];
  }

LABEL_6:
  v6 = [a1 preparationHandler];
  if (v6)
  {
    v7 = [a1 share];
    BOOL v8 = v7 != 0;
  }
  else
  {
    BOOL v8 = 1;
  }

  if (IsGelatoEnabled() && (dyld_program_sdk_at_least() ^ 1 | v8) != 1) {
    return 1;
  }
  v9 = (void *)MEMORY[0x1E4F28C70];
  v10 = CloudSharingUIExtensionBundleID();
  v11 = [v9 extensionWithIdentifier:v10 error:0];

  BOOL v12 = v11 != 0;
  if (v11)
  {
    dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
    v14 = (void *)a1[122];
    a1[122] = v13;

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __39__UICloudSharingController__commonInit__block_invoke;
    v18[3] = &unk_1E5311498;
    v18[4] = a1;
    uint64_t v15 = +[_UIResilientRemoteViewContainerViewController instantiateWithExtension:v11 completion:v18];
    [a1 addResizingChildViewController:v15];
    v16 = (void *)a1[128];
    a1[128] = v15;

    [a1 setModalPresentationStyle:7];
    objc_msgSend(a1, "setPreferredContentSize:", 375.0, 636.0);
  }

  return v12;
}

void __39__UICloudSharingController__commonInit__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v16 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = objc_opt_class();
    NSLog(&cfstr_RemoteViewCont.isa, v7, v6);
  }
  else
  {
    [v16 setPublicController:*(void *)(a1 + 32)];
    BOOL v8 = [v16 serviceViewControllerProxy];
    v9 = *(void **)(a1 + 32);
    if (v9[125])
    {
      v10 = [v9 share];
      v11 = [*(id *)(a1 + 32) container];
      BOOL v12 = [v11 containerID];
      [v8 _setCloudKitShare:v10 containerID:v12];
    }
    else
    {
      v10 = [v9 delegate];
      BOOL v12 = [v10 itemTitleForCloudSharingController:*(void *)(a1 + 32)];
      if (objc_opt_respondsToSelector())
      {
        v11 = [v10 itemThumbnailDataForCloudSharingController:*(void *)(a1 + 32)];
      }
      else
      {
        v11 = 0;
      }
      if (objc_opt_respondsToSelector())
      {
        dispatch_semaphore_t v13 = [v10 itemTypeForCloudSharingController:*(void *)(a1 + 32)];
      }
      else
      {
        dispatch_semaphore_t v13 = 0;
      }
      [v8 _setCloudKitThumbnail:v11 title:v12 type:v13];
    }
    uint64_t v14 = *(void *)(a1 + 32);
    if (*(void *)(v14 + 1048))
    {
      objc_msgSend(v8, "_setCloudKitContainerSetupInfo:");
      uint64_t v14 = *(void *)(a1 + 32);
    }
    if (*(void *)(v14 + 1056))
    {
      objc_msgSend(v8, "_setParticipantDetails:");
      uint64_t v14 = *(void *)(a1 + 32);
      if (*(void *)(v14 + 1088))
      {
        objc_msgSend(v8, "_setSectionTitleForAuxiliarySwitches:");
        uint64_t v14 = *(void *)(a1 + 32);
      }
      if (*(void *)(v14 + 1096))
      {
        objc_msgSend(v8, "_setPrimaryAuxiliarySwitchTitle:");
        uint64_t v14 = *(void *)(a1 + 32);
      }
      if (*(unsigned char *)(v14 + 985))
      {
        [v8 _setPrimaryAuxiliarySwitchState:1];
        uint64_t v14 = *(void *)(a1 + 32);
      }
      if (*(void *)(v14 + 1104))
      {
        objc_msgSend(v8, "_setSecondaryAuxiliarySwitchTitle:");
        uint64_t v14 = *(void *)(a1 + 32);
      }
      if (*(unsigned char *)(v14 + 986))
      {
        [v8 _setSecondaryAuxiliarySwitchState:1];
        uint64_t v14 = *(void *)(a1 + 32);
      }
    }
    if (*(void *)(v14 + 1112))
    {
      objc_msgSend(v8, "_setRootFolderTitle:");
      uint64_t v14 = *(void *)(a1 + 32);
    }
    if (*(void *)(v14 + 1120))
    {
      objc_msgSend(v8, "_setFolderSubitemName:");
      uint64_t v14 = *(void *)(a1 + 32);
    }
    if (*(void *)(v14 + 1128))
    {
      objc_msgSend(v8, "_setHeaderPrimaryImage:");
      uint64_t v14 = *(void *)(a1 + 32);
    }
    if (*(void *)(v14 + 1136)) {
      objc_msgSend(v8, "_setHeaderSecondaryImage:");
    }
    uint64_t v15 = [(id)UIApp _localizedApplicationName];
    [v8 _setAppName:v15];

    if (*(void *)(*(void *)(a1 + 32) + 1008)) {
      objc_msgSend(v8, "_setAvailablePermissions:");
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 976));
}

- (UICloudSharingController)initWithShare:(CKShare *)share container:(CKContainer *)container
{
  id v6 = share;
  uint64_t v7 = container;
  v12.receiver = self;
  v12.super_class = (Class)UICloudSharingController;
  BOOL v8 = [(UIViewController *)&v12 init];
  v9 = v8;
  if (v8
    && ([(UICloudSharingController *)v8 setShare:v6],
        [(UICloudSharingController *)v9 setContainer:v7],
        !-[UICloudSharingController _commonInit](v9)))
  {
    v10 = 0;
  }
  else
  {
    v10 = v9;
  }

  return v10;
}

- (UICloudSharingController)initWithShare:(id)a3 preparationHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)UICloudSharingController;
  v9 = [(UIViewController *)&v17 init];
  if (!v9) {
    goto LABEL_5;
  }
  v10 = [v7 participants];
  unint64_t v11 = [v10 count];

  if (v11 >= 2)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v15 = NSStringFromSelector(a2);
    id v16 = NSStringFromSelector(sel_initWithShare_container_);
    [v14 handleFailureInMethod:a2, v9, @"UICloudSharingController.m", 255, @"Share passed in to %@ has multiple participants. Use %@ for an existing share.", v15, v16 object file lineNumber description];
  }
  [(UICloudSharingController *)v9 setShare:v7];
  [(UICloudSharingController *)v9 setPreparationHandler:v8];
  if (!-[UICloudSharingController _commonInit](v9)) {
    objc_super v12 = 0;
  }
  else {
LABEL_5:
  }
    objc_super v12 = v9;

  return v12;
}

- (UICloudSharingController)initWithPreparationHandler:(void *)preparationHandler
{
  v4 = preparationHandler;
  v9.receiver = self;
  v9.super_class = (Class)UICloudSharingController;
  v5 = [(UIViewController *)&v9 init];
  id v6 = v5;
  if (v5
    && ([(UICloudSharingController *)v5 setPreparationHandler:v4],
        !-[UICloudSharingController _commonInit](v6)))
  {
    id v7 = 0;
  }
  else
  {
    id v7 = v6;
  }

  return v7;
}

- (void)dealloc
{
  uint64_t v3 = [(UICloudSharingController *)self _remoteViewController];
  [v3 setPublicController:0];

  v4.receiver = self;
  v4.super_class = (Class)UICloudSharingController;
  [(UIViewController *)&v4 dealloc];
}

- (void)__viewControllerWillBePresented:(BOOL)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  objc_super v4 = [(UICloudSharingController *)self preparationHandler];
  if (v4)
  {
    v5 = [(UICloudSharingController *)self share];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 1;
  }

  if (IsGelatoEnabled() && ((dyld_program_sdk_at_least() ^ 1 | v6) & 1) == 0)
  {
    id v7 = [(UICloudSharingController *)self _activityViewController];

    if (!v7)
    {
      id v8 = objc_msgSend((id)objc_opt_class(), "allowedSharingOptionsFromPermissions:", -[UICloudSharingController availablePermissions](self, "availablePermissions"));
      objc_super v9 = [_UISharingControllerActivityItemProvider alloc];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __60__UICloudSharingController___viewControllerWillBePresented___block_invoke;
      v23[3] = &unk_1E5311538;
      v23[4] = self;
      v10 = [(_UISharingControllerActivityItemProvider *)v9 initWithCKSharePreparationHandler:v23 allowedSharingOptions:v8];
      unint64_t v11 = [UIActivityItemsConfiguration alloc];
      v24[0] = v10;
      objc_super v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
      dispatch_semaphore_t v13 = [(UIActivityItemsConfiguration *)v11 initWithItemProviders:v12];

      objc_initWeak(&location, self);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __60__UICloudSharingController___viewControllerWillBePresented___block_invoke_7;
      v20[3] = &unk_1E5311560;
      objc_copyWeak(&v21, &location);
      [(UIActivityItemsConfiguration *)v13 setPerItemMetadataProvider:v20];
      uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F9F2E8]) initWithActivityItemsConfiguration:v13];
      [v14 setAllowsEmbedding:1];
      [v14 setCollaborationMode:4];
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      objc_super v17 = __60__UICloudSharingController___viewControllerWillBePresented___block_invoke_8;
      v18 = &unk_1E5311588;
      objc_copyWeak(&v19, &location);
      [v14 setCompletionWithItemsHandler:&v15];
      -[UICloudSharingController addResizingChildViewController:](self, "addResizingChildViewController:", v14, v15, v16, v17, v18);
      [(UICloudSharingController *)self _setActivityViewController:v14];
      objc_destroyWeak(&v19);

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
  }
}

void __60__UICloudSharingController___viewControllerWillBePresented___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = [*(id *)(a1 + 32) preparationHandler];
  uint64_t v5 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__UICloudSharingController___viewControllerWillBePresented___block_invoke_2;
  v8[3] = &unk_1E5311510;
  v8[4] = v5;
  id v9 = v3;
  BOOL v6 = (void (*)(void *, uint64_t, void *))v4[2];
  id v7 = v3;
  v6(v4, v5, v8);
}

void __60__UICloudSharingController___viewControllerWillBePresented___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2050000000;
  v10 = (void *)getCKSystemSharingUIObserverClass_softClass;
  uint64_t v25 = getCKSystemSharingUIObserverClass_softClass;
  if (!getCKSystemSharingUIObserverClass_softClass)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __getCKSystemSharingUIObserverClass_block_invoke;
    v21[3] = &unk_1E52D9900;
    v21[4] = &v22;
    __getCKSystemSharingUIObserverClass_block_invoke((uint64_t)v21);
    v10 = (void *)v23[3];
  }
  unint64_t v11 = v10;
  _Block_object_dispose(&v22, 8);
  objc_super v12 = (void *)[[v11 alloc] initWithContainer:v8];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __60__UICloudSharingController___viewControllerWillBePresented___block_invoke_3;
  v18[3] = &unk_1E53114C0;
  objc_copyWeak(&v19, &location);
  [v12 setSystemSharingUIDidSaveShareBlock:v18];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __60__UICloudSharingController___viewControllerWillBePresented___block_invoke_5;
  uint64_t v16 = &unk_1E53114E8;
  objc_copyWeak(&v17, &location);
  [v12 setSystemSharingUIDidStopSharingBlock:&v13];
  objc_msgSend(*(id *)(a1 + 32), "_setSystemSharingUIObserver:", v12, v13, v14, v15, v16);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&location);
}

void __60__UICloudSharingController___viewControllerWillBePresented___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    if (v7)
    {
      NSLog(&cfstr_Systemsharingu.isa, v7);
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __60__UICloudSharingController___viewControllerWillBePresented___block_invoke_4;
      block[3] = &unk_1E52D9F98;
      block[4] = WeakRetained;
      id v11 = v6;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

uint64_t __60__UICloudSharingController___viewControllerWillBePresented___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _shareDidChange:*(void *)(a1 + 40)];
}

void __60__UICloudSharingController___viewControllerWillBePresented___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    if (v4)
    {
      NSLog(&cfstr_Systemsharingu_0.isa, v4);
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __60__UICloudSharingController___viewControllerWillBePresented___block_invoke_6;
      block[3] = &unk_1E52D9F70;
      block[4] = WeakRetained;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

uint64_t __60__UICloudSharingController___viewControllerWillBePresented___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendDidStopSharingDelegate];
}

id __60__UICloudSharingController___viewControllerWillBePresented___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  if ([a3 isEqualToString:@"linkPresentationMetadata"])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v5 = [WeakRetained createActivityLinkMetadata];
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

void __60__UICloudSharingController___viewControllerWillBePresented___block_invoke_8(uint64_t a1, uint64_t a2, int a3, uint64_t a4, void *a5)
{
  id v12 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (a3)
  {
    id v9 = [WeakRetained delegate];
    char v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) == 0) {
      goto LABEL_7;
    }
    id v11 = [v8 delegate];
    [v11 cloudSharingControllerDidSaveShare:v8];
  }
  else
  {
    if (!v12) {
      goto LABEL_7;
    }
    id v11 = [WeakRetained delegate];
    [v11 cloudSharingController:v8 failedToSaveShareWithError:v12];
  }

LABEL_7:
}

- (id)createActivityLinkMetadata
{
  id v3 = [(UICloudSharingController *)self delegate];
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2050000000;
  id v4 = (void *)qword_1EB25CAB0;
  uint64_t v26 = qword_1EB25CAB0;
  if (!qword_1EB25CAB0)
  {
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __getLPLinkMetadataClass_block_invoke_1;
    id v21 = &unk_1E52D9900;
    uint64_t v22 = &v23;
    __getLPLinkMetadataClass_block_invoke_1((uint64_t)&v18);
    id v4 = (void *)v24[3];
  }
  uint64_t v5 = v4;
  _Block_object_dispose(&v23, 8);
  id v6 = objc_alloc_init(v5);
  id v7 = [v3 itemTitleForCloudSharingController:self];
  [v6 setTitle:v7];

  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = [v3 itemThumbnailDataForCloudSharingController:self];
    if (v8)
    {
      id v9 = (void *)v8;
      uint64_t v23 = 0;
      uint64_t v24 = &v23;
      uint64_t v25 = 0x2050000000;
      char v10 = (void *)qword_1EB25CAB8;
      uint64_t v26 = qword_1EB25CAB8;
      if (!qword_1EB25CAB8)
      {
        uint64_t v18 = MEMORY[0x1E4F143A8];
        uint64_t v19 = 3221225472;
        v20 = __getLPImagePropertiesClass_block_invoke;
        id v21 = &unk_1E52D9900;
        uint64_t v22 = &v23;
        __getLPImagePropertiesClass_block_invoke((uint64_t)&v18);
        char v10 = (void *)v24[3];
      }
      id v11 = v10;
      _Block_object_dispose(&v23, 8);
      id v12 = objc_alloc_init(v11);
      [v12 setType:5];
      uint64_t v13 = +[UIImage imageWithData:v9];
      uint64_t v23 = 0;
      uint64_t v24 = &v23;
      uint64_t v25 = 0x2050000000;
      uint64_t v14 = (void *)qword_1EB25CAC0;
      uint64_t v26 = qword_1EB25CAC0;
      if (!qword_1EB25CAC0)
      {
        uint64_t v18 = MEMORY[0x1E4F143A8];
        uint64_t v19 = 3221225472;
        v20 = __getLPImageClass_block_invoke;
        id v21 = &unk_1E52D9900;
        uint64_t v22 = &v23;
        __getLPImageClass_block_invoke((uint64_t)&v18);
        uint64_t v14 = (void *)v24[3];
      }
      uint64_t v15 = v14;
      _Block_object_dispose(&v23, 8);
      uint64_t v16 = (void *)[[v15 alloc] initWithPlatformImage:v13 properties:v12];
      [v6 setIcon:v16];
    }
  }

  return v6;
}

- (void)setContainer:(id)a3
{
  id v10 = a3;
  objc_storeStrong((id *)&self->_container, a3);
  uint64_t v5 = [v10 setupInfo];
  containerSetupInfo = self->_containerSetupInfo;
  self->_containerSetupInfo = v5;

  if (self->_containerSetupInfo)
  {
    id v7 = [(UICloudSharingController *)self _childViewController];
    uint64_t v8 = [v7 remoteViewController];
    id v9 = [v8 serviceViewControllerProxy];

    [v9 _setCloudKitContainerSetupInfo:self->_containerSetupInfo];
  }
}

- (void)_callPreparationHandler:(id)a3
{
  id v5 = a3;
  id v6 = [(UICloudSharingController *)self preparationHandler];

  if (v6)
  {
    id v7 = [(UICloudSharingController *)self preparationHandler];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52__UICloudSharingController__callPreparationHandler___block_invoke;
    v8[3] = &unk_1E5311600;
    SEL v10 = a2;
    v8[4] = self;
    id v9 = v5;
    ((void (**)(void, UICloudSharingController *, void *))v7)[2](v7, self, v8);
  }
}

void __52__UICloudSharingController__callPreparationHandler___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  SEL v10 = v9;
  if (v8) {
    BOOL v11 = v7 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11 && !v9)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a1[6], a1[4], @"UICloudSharingController.m", 469, @"%@ preparation handler was called with a nil share or container, but no error", objc_opt_class() object file lineNumber description];
  }
  id v12 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__UICloudSharingController__callPreparationHandler___block_invoke_2;
  block[3] = &unk_1E53115D8;
  uint64_t v13 = a1[4];
  uint64_t v14 = (void *)a1[5];
  id v20 = v10;
  uint64_t v21 = v13;
  id v23 = v8;
  id v24 = v14;
  id v22 = v7;
  id v15 = v8;
  id v16 = v7;
  id v17 = v10;
  dispatch_async(v12, block);
}

void __52__UICloudSharingController__callPreparationHandler___block_invoke_2(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = *(NSObject **)(*(void *)(a1 + 40) + 976);
  dispatch_time_t v4 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v3, v4))
  {
    uint64_t v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4097 userInfo:0];

    id v2 = (id)v5;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__UICloudSharingController__callPreparationHandler___block_invoke_3;
  block[3] = &unk_1E53115B0;
  id v10 = v2;
  int8x16_t v8 = *(int8x16_t *)(a1 + 32);
  id v6 = (id)v8.i64[0];
  int8x16_t v11 = vextq_s8(v8, v8, 8uLL);
  id v14 = *(id *)(a1 + 64);
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v7 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __52__UICloudSharingController__callPreparationHandler___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__UICloudSharingController__callPreparationHandler___block_invoke_4;
    block[3] = &unk_1E52E3298;
    id v2 = *(void **)(a1 + 48);
    void block[4] = *(void *)(a1 + 40);
    id v8 = v2;
    id v9 = *(id *)(a1 + 72);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    id v3 = [*(id *)(*(void *)(a1 + 40) + 1000) participants];
    *(unsigned char *)(*(void *)(a1 + 40) + 984) = (unint64_t)[v3 count] < 2;

    [*(id *)(a1 + 40) setShare:*(void *)(a1 + 56)];
    [*(id *)(a1 + 40) setContainer:*(void *)(a1 + 64)];
    uint64_t v4 = *(void *)(a1 + 72);
    uint64_t v5 = *(void *)(a1 + 56);
    id v6 = [*(id *)(a1 + 64) containerID];
    (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, v5, v6);
  }
}

uint64_t __52__UICloudSharingController__callPreparationHandler___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _dismissViewControllerWithError:*(void *)(a1 + 40)];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

- (void)addResizingChildViewController:(id)a3
{
  id v27 = a3;
  [v27 beginAppearanceTransition:1 animated:0];
  [(UIViewController *)self addChildViewController:v27];
  uint64_t v4 = [v27 view];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v5 = [(UIViewController *)self view];
  id v6 = [v27 view];
  [v5 addSubview:v6];

  id v7 = [(UIViewController *)self view];
  id v8 = (void *)MEMORY[0x1E4F5B268];
  id v9 = [(UIViewController *)self view];
  id v10 = [v27 view];
  int8x16_t v11 = [v8 constraintWithItem:v9 attribute:7 relatedBy:0 toItem:v10 attribute:7 multiplier:1.0 constant:0.0];
  [v7 addConstraint:v11];

  id v12 = [(UIViewController *)self view];
  id v13 = (void *)MEMORY[0x1E4F5B268];
  id v14 = [(UIViewController *)self view];
  id v15 = [v27 view];
  id v16 = [v13 constraintWithItem:v14 attribute:8 relatedBy:0 toItem:v15 attribute:8 multiplier:1.0 constant:0.0];
  [v12 addConstraint:v16];

  id v17 = [(UIViewController *)self view];
  uint64_t v18 = (void *)MEMORY[0x1E4F5B268];
  uint64_t v19 = [(UIViewController *)self view];
  id v20 = [v27 view];
  uint64_t v21 = [v18 constraintWithItem:v19 attribute:1 relatedBy:0 toItem:v20 attribute:1 multiplier:1.0 constant:0.0];
  [v17 addConstraint:v21];

  id v22 = [(UIViewController *)self view];
  id v23 = (void *)MEMORY[0x1E4F5B268];
  id v24 = [(UIViewController *)self view];
  uint64_t v25 = [v27 view];
  uint64_t v26 = [v23 constraintWithItem:v24 attribute:3 relatedBy:0 toItem:v25 attribute:3 multiplier:1.0 constant:0.0];
  [v22 addConstraint:v26];

  [v27 didMoveToParentViewController:self];
  [v27 endAppearanceTransition];
}

- (void)_didDismiss
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(UICloudSharingController *)self setPreparationHandler:0];
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  strongReferenceToOurself = self->_strongReferenceToOurself;
  if (has_internal_diagnostics)
  {
    if (strongReferenceToOurself)
    {
      int8x16_t v11 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = self;
        _os_log_fault_impl(&dword_1853B0000, v11, OS_LOG_TYPE_FAULT, "Cyclic reference to %@ wasn't cleared out. This means that the view service didn't call us back.", buf, 0xCu);
      }
    }
  }
  else if (strongReferenceToOurself)
  {
    id v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_didDismiss___s_category) + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = self;
      _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "Cyclic reference to %@ wasn't cleared out. This means that the view service didn't call us back.", buf, 0xCu);
    }
  }
  uint64_t v5 = self->_strongReferenceToOurself;
  self->_strongReferenceToOurself = 0;

  id v6 = [(UICloudSharingController *)self _childViewController];
  id v7 = [v6 remoteViewController];
  [v7 setPublicController:0];

  id v8 = [(UICloudSharingController *)self _childViewController];
  [v8 invalidate];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __39__UICloudSharingController__didDismiss__block_invoke;
  aBlock[3] = &unk_1E52D9F70;
  aBlock[4] = self;
  id v9 = (void (**)(void))_Block_copy(aBlock);
  if (self->_shareNeedsDeletion
    && ([(UICloudSharingController *)self share],
        id v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v10))
  {
    [(UICloudSharingController *)self _deleteShareAfterDismissalWithoutSave:v9];
  }
  else
  {
    v9[2](v9);
  }
}

void __39__UICloudSharingController__didDismiss__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) internalDelegate];
  if (objc_opt_respondsToSelector()) {
    [v2 _cloudShareControllerDidDismiss:*(void *)(a1 + 32)];
  }
}

- (void)_deleteShareAfterDismissalWithoutSave:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2050000000;
  uint64_t v5 = (void *)getCKModifyRecordsOperationClass_softClass;
  uint64_t v20 = getCKModifyRecordsOperationClass_softClass;
  if (!getCKModifyRecordsOperationClass_softClass)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __getCKModifyRecordsOperationClass_block_invoke;
    v16[3] = &unk_1E52D9900;
    v16[4] = &v17;
    __getCKModifyRecordsOperationClass_block_invoke((uint64_t)v16);
    uint64_t v5 = (void *)v18[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v17, 8);
  id v7 = [v6 alloc];
  id v8 = [(CKShare *)self->_share recordID];
  v21[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  id v10 = (void *)[v7 initWithRecordsToSave:MEMORY[0x1E4F1CBF0] recordIDsToDelete:v9];

  [v10 setQualityOfService:25];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__UICloudSharingController__deleteShareAfterDismissalWithoutSave___block_invoke;
  v14[3] = &unk_1E5311628;
  v14[4] = self;
  id v15 = v4;
  id v11 = v4;
  [v10 setModifyRecordsCompletionBlock:v14];
  id v12 = [(UICloudSharingController *)self container];
  id v13 = [v12 privateCloudDatabase];
  [v13 addOperation:v10];
}

void __66__UICloudSharingController__deleteShareAfterDismissalWithoutSave___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__UICloudSharingController__deleteShareAfterDismissalWithoutSave___block_invoke_2;
  block[3] = &unk_1E52E3968;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  id v10 = v5;
  uint64_t v11 = v7;
  id v12 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __66__UICloudSharingController__deleteShareAfterDismissalWithoutSave___block_invoke_2(void *a1)
{
  (*(void (**)(void))(a1[6] + 16))();
  id v2 = (void *)a1[5];
  if (a1[4])
  {
    id v3 = [v2 delegate];
    [v3 cloudSharingController:a1[5] failedToSaveShareWithError:a1[4]];
  }
  else
  {
    [v2 _sendDidStopSharingDelegate];
  }
}

- (void)_dismissViewControllerWithError:(id)a3
{
  id v4 = a3;
  if (![(UIViewController *)self isBeingDismissed])
  {
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    id v10 = __60__UICloudSharingController__dismissViewControllerWithError___block_invoke;
    uint64_t v11 = &unk_1E52D9F98;
    id v12 = self;
    id v13 = v4;
    id v5 = (void (**)(void))_Block_copy(&v8);
    id v6 = [(UIViewController *)self presentingViewController];

    if (v6)
    {
      uint64_t v7 = [(UIViewController *)self presentingViewController];
      [v7 dismissViewControllerAnimated:1 completion:v5];
    }
    else
    {
      v5[2](v5);
    }
  }
}

void __60__UICloudSharingController__dismissViewControllerWithError___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _didDismiss];
  if (*(void *)(a1 + 40))
  {
    id v2 = [*(id *)(a1 + 32) delegate];
    [v2 cloudSharingController:*(void *)(a1 + 32) failedToSaveShareWithError:*(void *)(a1 + 40)];
  }
}

- (id)activityItemSource
{
  id v3 = objc_alloc_init(_UISharingControllerActivityItemSource);
  [(_UISharingControllerActivityItemSource *)v3 setViewController:self];
  return v3;
}

- (void)_setParticipantDetails:(id)a3
{
  if (self->_participantDetails != a3)
  {
    id v4 = a3;
    id v5 = (NSDictionary *)[v4 copy];
    participantDetails = self->_participantDetails;
    self->_participantDetails = v5;

    uint64_t v7 = [(UICloudSharingController *)self _childViewController];
    uint64_t v8 = [v7 remoteViewController];
    id v9 = [v8 serviceViewControllerProxy];

    [v9 _setParticipantDetails:v4];
  }
}

- (void)_setSectionTitleForAuxiliarySwitches:(id)a3
{
  id v4 = (NSString *)a3;
  if (self->_sectionTitleForAuxiliarySwitches != v4)
  {
    id v10 = v4;
    id v5 = (NSString *)[(NSString *)v4 copy];
    sectionTitleForAuxiliarySwitches = self->_sectionTitleForAuxiliarySwitches;
    self->_sectionTitleForAuxiliarySwitches = v5;

    uint64_t v7 = [(UICloudSharingController *)self _childViewController];
    uint64_t v8 = [v7 remoteViewController];
    id v9 = [v8 serviceViewControllerProxy];

    if (objc_opt_respondsToSelector()) {
      [v9 _setSectionTitleForAuxiliarySwitches:v10];
    }

    id v4 = v10;
  }
}

- (void)_setPrimaryAuxiliarySwitchTitle:(id)a3
{
  if (self->_primaryAuxiliarySwitchTitle != a3)
  {
    id v4 = a3;
    id v5 = (NSString *)[v4 copy];
    primaryAuxiliarySwitchTitle = self->_primaryAuxiliarySwitchTitle;
    self->_primaryAuxiliarySwitchTitle = v5;

    uint64_t v7 = [(UICloudSharingController *)self _childViewController];
    uint64_t v8 = [v7 remoteViewController];
    id v9 = [v8 serviceViewControllerProxy];

    [v9 _setPrimaryAuxiliarySwitchTitle:v4];
  }
}

- (void)_setPrimaryAuxiliarySwitchState:(BOOL)a3
{
  BOOL v3 = a3;
  self->_primaryAuxiliarySwitchState = a3;
  id v4 = [(UICloudSharingController *)self _childViewController];
  id v5 = [v4 remoteViewController];
  id v6 = [v5 serviceViewControllerProxy];

  [v6 _setPrimaryAuxiliarySwitchState:v3];
}

- (void)_setSecondaryAuxiliarySwitchTitle:(id)a3
{
  if (self->_secondaryAuxiliarySwitchTitle != a3)
  {
    id v4 = a3;
    id v5 = (NSString *)[v4 copy];
    secondaryAuxiliarySwitchTitle = self->_secondaryAuxiliarySwitchTitle;
    self->_secondaryAuxiliarySwitchTitle = v5;

    uint64_t v7 = [(UICloudSharingController *)self _childViewController];
    uint64_t v8 = [v7 remoteViewController];
    id v9 = [v8 serviceViewControllerProxy];

    [v9 _setSecondaryAuxiliarySwitchTitle:v4];
  }
}

- (void)_setSecondaryAuxiliarySwitchState:(BOOL)a3
{
  BOOL v3 = a3;
  self->_secondaryAuxiliarySwitchState = a3;
  id v4 = [(UICloudSharingController *)self _childViewController];
  id v5 = [v4 remoteViewController];
  id v6 = [v5 serviceViewControllerProxy];

  [v6 _setSecondaryAuxiliarySwitchState:v3];
}

- (void)_setRootFolderTitle:(id)a3
{
  objc_storeStrong((id *)&self->_rootFolderTitle, a3);
  id v5 = a3;
  id v6 = [(UICloudSharingController *)self _childViewController];
  uint64_t v7 = [v6 remoteViewController];
  id v8 = [v7 serviceViewControllerProxy];

  [v8 _setRootFolderTitle:v5];
}

- (void)_setFolderSubitemName:(id)a3
{
  objc_storeStrong((id *)&self->_folderSubitemName, a3);
  id v5 = a3;
  id v6 = [(UICloudSharingController *)self _childViewController];
  uint64_t v7 = [v6 remoteViewController];
  id v8 = [v7 serviceViewControllerProxy];

  [v8 _setFolderSubitemName:v5];
}

- (void)_setHeaderPrimaryImage:(id)a3
{
  objc_storeStrong((id *)&self->_headerPrimaryImage, a3);
  id v5 = a3;
  id v6 = [(UICloudSharingController *)self _childViewController];
  uint64_t v7 = [v6 remoteViewController];
  id v8 = [v7 serviceViewControllerProxy];

  [v8 _setHeaderPrimaryImage:v5];
}

- (void)_setHeaderSecondaryImage:(id)a3
{
  objc_storeStrong((id *)&self->_headerSecondaryImage, a3);
  id v5 = a3;
  id v6 = [(UICloudSharingController *)self _childViewController];
  uint64_t v7 = [v6 remoteViewController];
  id v8 = [v7 serviceViewControllerProxy];

  [v8 _setHeaderSecondaryImage:v5];
}

- (int64_t)modalPresentationStyle
{
  v3.receiver = self;
  v3.super_class = (Class)UICloudSharingController;
  return [(UIViewController *)&v3 modalPresentationStyle];
}

- (BOOL)_requiresCustomPresentationController
{
  return [(UICloudSharingController *)self modalPresentationStyle] == 7;
}

- (id)_customPresentationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(UIPopoverPresentationController *)[_UISharingViewPresentationController alloc] initWithPresentedViewController:v8 presentingViewController:v9];
  objc_initWeak(&location, self);
  id v12 = [v10 view];
  [(UIPresentationController *)v11 setSourceView:v12];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __118__UICloudSharingController__customPresentationControllerForPresentedController_presentingController_sourceController___block_invoke;
  v14[3] = &unk_1E52DC308;
  objc_copyWeak(&v15, &location);
  [(_UISharingViewPresentationController *)v11 setDismissalHandler:v14];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v11;
}

void __118__UICloudSharingController__customPresentationControllerForPresentedController_presentingController_sourceController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didDismiss];
}

- (id)_sharingViewPresentationController
{
  id v2 = [(UIViewController *)self presentationController];
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
  [(UICloudSharingController *)self _setOriginalPresentingViewController:v5];

  id v6 = [(UICloudSharingController *)self _sharingViewPresentationController];
  [v6 setSuppressDismissalHandlerUnlessDimmingViewTapped:1];

  uint64_t v7 = [(UIViewController *)self presentingViewController];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__UICloudSharingController__dismissForActivityRepresentation___block_invoke;
  v9[3] = &unk_1E52DA160;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 dismissViewControllerAnimated:0 completion:v9];
}

uint64_t __62__UICloudSharingController__dismissForActivityRepresentation___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1080), *(id *)(a1 + 32));
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)_representFullscreenAfterActivityDismissal:(id)a3
{
  id v4 = a3;
  [(UIViewController *)self setModalPresentationStyle:5];
  id v5 = [(UICloudSharingController *)self _sharingViewPresentationController];
  [v5 setSuppressDismissalHandlerUnlessDimmingViewTapped:0];

  id v6 = [(UICloudSharingController *)self _originalPresentingViewController];
  [v6 presentViewController:self animated:0 completion:v4];

  strongReferenceToOurself = self->_strongReferenceToOurself;
  self->_strongReferenceToOurself = 0;

  objc_storeWeak((id *)&self->_originalPresentingViewController, 0);
}

- (void)_cloudSharingControllerDidModifyPrimarySwitch:(BOOL)a3
{
  BOOL v3 = a3;
  objc_copyWeak(&to, (id *)&self->_delegate);
  id v4 = objc_loadWeakRetained(&to);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained(&to);
    [v6 _cloudSharingControllerDidModifyPrimarySwitch:v3];
  }
  objc_destroyWeak(&to);
}

- (void)_cloudSharingControllerDidModifySecondarySwitch:(BOOL)a3
{
  BOOL v3 = a3;
  objc_copyWeak(&to, (id *)&self->_delegate);
  id v4 = objc_loadWeakRetained(&to);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained(&to);
    [v6 _cloudSharingControllerDidModifySecondarySwitch:v3];
  }
  objc_destroyWeak(&to);
}

- (void)_cloudSharingControllerDidActivateShowSharedFolder
{
  objc_copyWeak(&to, (id *)&self->_delegate);
  id v2 = objc_loadWeakRetained(&to);
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained(&to);
    [v4 _cloudSharingControllerDidActivateShowSharedFolder];
  }
  objc_destroyWeak(&to);
}

+ (id)allowedSharingOptionsFromPermissions:(unint64_t)a3
{
  if (a3)
  {
    char v3 = (void *)[objc_alloc((Class)getCKAllowedSharingOptionsClass()) initWithAllowedParticipantPermissionOptions:(a3 >> 2) & 3 allowedParticipantAccessOptions:a3 & 3];
  }
  else
  {
    char v3 = [getCKAllowedSharingOptionsClass() standardOptions];
  }
  return v3;
}

- (id)excludedActivityTypes
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__UICloudSharingController_excludedActivityTypes__block_invoke;
  block[3] = &unk_1E52D9F70;
  void block[4] = self;
  if (qword_1EB25CAA8 != -1) {
    dispatch_once(&qword_1EB25CAA8, block);
  }
  return (id)_MergedGlobals_5_16;
}

void __49__UICloudSharingController_excludedActivityTypes__block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v10[0] = *MEMORY[0x1E4F9F358];
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  char v3 = (void *)_MergedGlobals_5_16;
  _MergedGlobals_5_16 = v2;

  id v4 = [*(id *)(a1 + 32) container];
  char v5 = [v4 containerID];
  id v6 = [v5 containerIdentifier];
  int v7 = [v6 isEqualToString:@"com.apple.reminders"];

  if (v7)
  {
    uint64_t v8 = [(id)_MergedGlobals_5_16 arrayByAddingObject:*MEMORY[0x1E4F9F368]];
    id v9 = (void *)_MergedGlobals_5_16;
    _MergedGlobals_5_16 = v8;
  }
}

- (void)_cloudSharingControllerDidActivateShowActivityController
{
  id v5 = [(UIViewController *)self view];
  [v5 bounds];
  double MidX = CGRectGetMidX(v7);
  id v4 = [(UIViewController *)self view];
  [v4 bounds];
  [(UICloudSharingController *)self _cloudSharingControllerDidActivateAddPeopleWithRemoteSourceX:MidX y:CGRectGetMidY(v8) width:0.0 height:0.0];
}

- (void)_cloudSharingControllerDidActivateAddPeopleWithRemoteSourceX:(double)a3 y:(double)a4 width:(double)a5 height:(double)a6
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v12 = [(UICloudSharingController *)self share];

  if (!v12)
  {
    id v27 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UICloudSharingController.m", 826, @"%s: Expect a CKShare while presenting share sheet", "-[UICloudSharingController _cloudSharingControllerDidActivateAddPeopleWithRemoteSourceX:y:width:height:]");
  }
  id v13 = [(UICloudSharingController *)self container];

  if (!v13)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UICloudSharingController.m", 827, @"%s: Expect a CKShare while presenting share sheet", "-[UICloudSharingController _cloudSharingControllerDidActivateAddPeopleWithRemoteSourceX:y:width:height:]");
  }
  id v14 = objc_msgSend((id)objc_opt_class(), "allowedSharingOptionsFromPermissions:", -[UICloudSharingController availablePermissions](self, "availablePermissions"));
  id v15 = [_UISharingControllerActivityItemProvider alloc];
  uint64_t v16 = [(UICloudSharingController *)self share];
  uint64_t v17 = [(UICloudSharingController *)self container];
  uint64_t v18 = [(_UISharingControllerActivityItemProvider *)v15 initWithCKShare:v16 container:v17 allowedSharingOptions:v14];

  uint64_t v19 = [UIActivityItemsConfiguration alloc];
  v34[0] = v18;
  uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
  uint64_t v21 = [(UIActivityItemsConfiguration *)v19 initWithItemProviders:v20];

  objc_initWeak(&location, self);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __104__UICloudSharingController__cloudSharingControllerDidActivateAddPeopleWithRemoteSourceX_y_width_height___block_invoke;
  v31[3] = &unk_1E5311560;
  objc_copyWeak(&v32, &location);
  [(UIActivityItemsConfiguration *)v21 setPerItemMetadataProvider:v31];
  id v22 = (void *)[objc_alloc(MEMORY[0x1E4F9F2E8]) initWithActivityItemsConfiguration:v21];
  [v22 setCollaborationMode:4];
  id v23 = [(UICloudSharingController *)self excludedActivityTypes];
  [v22 setExcludedActivityTypes:v23];

  id v24 = [(UIViewController *)self view];
  uint64_t v25 = [v22 popoverPresentationController];
  [v25 setSourceView:v24];

  uint64_t v26 = [v22 popoverPresentationController];
  objc_msgSend(v26, "setSourceRect:", a3, a4, a5, a6);

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __104__UICloudSharingController__cloudSharingControllerDidActivateAddPeopleWithRemoteSourceX_y_width_height___block_invoke_2;
  v29[3] = &unk_1E5311588;
  objc_copyWeak(&v30, &location);
  [v22 setCompletionWithItemsHandler:v29];
  [(UIViewController *)self presentViewController:v22 animated:1 completion:0];
  objc_destroyWeak(&v30);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
}

id __104__UICloudSharingController__cloudSharingControllerDidActivateAddPeopleWithRemoteSourceX_y_width_height___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if ([a3 isEqualToString:@"linkPresentationMetadata"])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v5 = [WeakRetained createActivityLinkMetadata];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

void __104__UICloudSharingController__cloudSharingControllerDidActivateAddPeopleWithRemoteSourceX_y_width_height___block_invoke_2(uint64_t a1, uint64_t a2, int a3, uint64_t a4, void *a5)
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
  id v4 = a3;
  objc_copyWeak(&to, (id *)&self->_delegate);
  id v5 = objc_loadWeakRetained(&to);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained(&to);
    [v7 _cloudSharingControllerDidChooseTransport:v4];
  }
  objc_destroyWeak(&to);
}

- (void)_shareDidChange:(id)a3
{
  id v4 = a3;
  if (v4) {
    [(UICloudSharingController *)self setShare:v4];
  }
  self->_shareNeedsDeletion = 0;
  objc_copyWeak(&to, (id *)&self->_delegate);
  id v5 = objc_loadWeakRetained(&to);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained(&to);
    [v7 cloudSharingControllerDidSaveShare:self];
  }
  objc_destroyWeak(&to);
}

- (void)_shareWasMadePrivate
{
  self->_shareNeedsDeletion = 0;
  [(UICloudSharingController *)self _sendDidStopSharingDelegate];
}

- (void)_sendDidStopSharingDelegate
{
  objc_copyWeak(&to, (id *)&self->_delegate);
  id v3 = objc_loadWeakRetained(&to);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained(&to);
    [v5 cloudSharingControllerDidStopSharing:self];
  }
  objc_destroyWeak(&to);
}

- (_UIRemoteViewController)_containedRemoteViewController
{
  uint64_t v2 = [(UICloudSharingController *)self _childViewController];
  id v3 = [v2 remoteViewController];

  return (_UIRemoteViewController *)v3;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (CKShare)share
{
  return self->_share;
}

- (void)setShare:(id)a3
{
}

- (UICloudSharingPermissionOptions)availablePermissions
{
  return self->_availablePermissions;
}

- (void)setAvailablePermissions:(UICloudSharingPermissionOptions)availablePermissions
{
  self->_availablePermissions = availablePermissions;
}

- (UIActivityViewController)_activityViewController
{
  return self->_activityViewController;
}

- (void)_setActivityViewController:(id)a3
{
}

- (_UIResilientRemoteViewContainerViewController)_childViewController
{
  return self->_childViewController;
}

- (void)_setChildViewController:(id)a3
{
}

- (_UIShareInvitationRemoteViewController)_remoteViewController
{
  return self->_remoteViewController;
}

- (CKContainer)container
{
  return self->_container;
}

- (CKContainerSetupInfo)containerSetupInfo
{
  return self->_containerSetupInfo;
}

- (void)setContainerSetupInfo:(id)a3
{
}

- (NSDictionary)_participantDetails
{
  return self->_participantDetails;
}

- (id)preparationHandler
{
  return self->_preparationHandler;
}

- (void)setPreparationHandler:(id)a3
{
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

- (NSString)_sectionTitleForAuxiliarySwitches
{
  return self->_sectionTitleForAuxiliarySwitches;
}

- (NSString)_primaryAuxiliarySwitchTitle
{
  return self->_primaryAuxiliarySwitchTitle;
}

- (BOOL)_primaryAuxiliarySwitchState
{
  return self->_primaryAuxiliarySwitchState;
}

- (NSString)_secondaryAuxiliarySwitchTitle
{
  return self->_secondaryAuxiliarySwitchTitle;
}

- (BOOL)_secondaryAuxiliarySwitchState
{
  return self->_secondaryAuxiliarySwitchState;
}

- (NSString)_rootFolderTitle
{
  return self->_rootFolderTitle;
}

- (NSString)_folderSubitemName
{
  return self->_folderSubitemName;
}

- (UIImage)_headerPrimaryImage
{
  return self->_headerPrimaryImage;
}

- (UIImage)_headerSecondaryImage
{
  return self->_headerSecondaryImage;
}

- (CKSystemSharingUIObserver)_systemSharingUIObserver
{
  return self->_systemSharingUIObserver;
}

- (void)_setSystemSharingUIObserver:(id)a3
{
}

- (_UICloudSharingControllerDelegate_Internal)internalDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_internalDelegate);
  return (_UICloudSharingControllerDelegate_Internal *)WeakRetained;
}

- (void)setInternalDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_internalDelegate);
  objc_storeStrong((id *)&self->_systemSharingUIObserver, 0);
  objc_storeStrong((id *)&self->_headerSecondaryImage, 0);
  objc_storeStrong((id *)&self->_headerPrimaryImage, 0);
  objc_storeStrong((id *)&self->_folderSubitemName, 0);
  objc_storeStrong((id *)&self->_rootFolderTitle, 0);
  objc_storeStrong((id *)&self->_secondaryAuxiliarySwitchTitle, 0);
  objc_storeStrong((id *)&self->_primaryAuxiliarySwitchTitle, 0);
  objc_storeStrong((id *)&self->_sectionTitleForAuxiliarySwitches, 0);
  objc_storeStrong((id *)&self->_strongReferenceToOurself, 0);
  objc_destroyWeak((id *)&self->_originalPresentingViewController);
  objc_storeStrong(&self->_preparationHandler, 0);
  objc_storeStrong((id *)&self->_participantDetails, 0);
  objc_storeStrong((id *)&self->_containerSetupInfo, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_childViewController, 0);
  objc_storeStrong((id *)&self->_activityViewController, 0);
  objc_storeStrong((id *)&self->_share, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewServiceValidSema, 0);
}

@end