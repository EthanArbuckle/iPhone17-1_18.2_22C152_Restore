@interface PXCMMInvitationViewModelManager
+ (id)_serialQueue;
- (BOOL)_showIsNewStatusInAttributedTitle;
- (PXCMMInvitationViewModel)viewModel;
- (PXCMMInvitationViewModelManager)init;
- (PXCMMInvitationViewModelManager)initWithInvitation:(id)a3 invitationSpec:(id)a4 bulletPrefix:(int64_t)a5;
- (PXMomentShareStatusPresentation)momentShareStatusPresentation;
- (void)_contentSizeCategoryDidChange:(id)a3;
- (void)_invitationsIsNewMonitorDidChange:(id)a3;
- (void)_registerMomentShareStatusPresentation;
- (void)_updateExpirationTitle:(id)a3;
- (void)_updateIsNew:(id)a3;
- (void)_updatePosterTitle:(id)a3;
- (void)_updateStatusString:(id)a3;
- (void)_updateTitle:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setMomentShareStatusPresentation:(id)a3;
@end

@implementation PXCMMInvitationViewModelManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentShareStatusPresentation, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
}

- (PXMomentShareStatusPresentation)momentShareStatusPresentation
{
  return self->_momentShareStatusPresentation;
}

- (PXCMMInvitationViewModel)viewModel
{
  return self->_viewModel;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PXMomentShareStatusPresentationObservationContext_13854 != a5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"PXCMMInvitationViewModelManager.m" lineNumber:256 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v10 = v9;
  if ((v6 & 0x1C) != 0)
  {
    viewModel = self->_viewModel;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __64__PXCMMInvitationViewModelManager_observable_didChange_context___block_invoke;
    v13[3] = &unk_1E5DB0238;
    BOOL v14 = (v6 & 0x18) != 0;
    v13[4] = self;
    BOOL v15 = (v6 & 4) != 0;
    [(PXCMMInvitationViewModel *)viewModel performChanges:v13];
  }
}

void __64__PXCMMInvitationViewModelManager_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(unsigned char *)(a1 + 40))
  {
    [*(id *)(a1 + 32) _updateStatusString:v3];
    id v3 = v4;
  }
  if (*(unsigned char *)(a1 + 41))
  {
    [*(id *)(a1 + 32) _updateExpirationTitle:v4];
    id v3 = v4;
  }
}

- (void)_invitationsIsNewMonitorDidChange:(id)a3
{
  viewModel = self->_viewModel;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__PXCMMInvitationViewModelManager__invitationsIsNewMonitorDidChange___block_invoke;
  v4[3] = &unk_1E5DB0210;
  v4[4] = self;
  [(PXCMMInvitationViewModel *)viewModel performChanges:v4];
}

void __69__PXCMMInvitationViewModelManager__invitationsIsNewMonitorDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_updateIsNew:");
  if ([*(id *)(a1 + 32) _showIsNewStatusInAttributedTitle]) {
    [*(id *)(a1 + 32) _updateTitle:v3];
  }
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  viewModel = self->_viewModel;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__PXCMMInvitationViewModelManager__contentSizeCategoryDidChange___block_invoke;
  v4[3] = &unk_1E5DB0210;
  v4[4] = self;
  [(PXCMMInvitationViewModel *)viewModel performChanges:v4];
}

void __65__PXCMMInvitationViewModelManager__contentSizeCategoryDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 _updatePosterTitle:v4];
  [*(id *)(a1 + 32) _updateTitle:v4];
  [*(id *)(a1 + 32) _updateStatusString:v4];
  [*(id *)(a1 + 32) _updateExpirationTitle:v4];
}

- (void)setMomentShareStatusPresentation:(id)a3
{
  v5 = (PXMomentShareStatusPresentation *)a3;
  momentShareStatusPresentation = self->_momentShareStatusPresentation;
  if (momentShareStatusPresentation != v5)
  {
    [(PXMomentShareStatusPresentation *)momentShareStatusPresentation unregisterChangeObserver:self context:PXMomentShareStatusPresentationObservationContext_13854];
    objc_storeStrong((id *)&self->_momentShareStatusPresentation, a3);
    [(PXMomentShareStatusPresentation *)self->_momentShareStatusPresentation registerChangeObserver:self context:PXMomentShareStatusPresentationObservationContext_13854];
    viewModel = self->_viewModel;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __68__PXCMMInvitationViewModelManager_setMomentShareStatusPresentation___block_invoke;
    v8[3] = &unk_1E5DB0210;
    v8[4] = self;
    [(PXCMMInvitationViewModel *)viewModel performChanges:v8];
  }
}

void __68__PXCMMInvitationViewModelManager_setMomentShareStatusPresentation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 _updateStatusString:v4];
  [*(id *)(a1 + 32) _updateExpirationTitle:v4];
}

- (void)_updateExpirationTitle:(id)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  momentShareStatusPresentation = self->_momentShareStatusPresentation;
  if (momentShareStatusPresentation)
  {
    id v5 = a3;
    char v6 = [(PXMomentShareStatusPresentation *)momentShareStatusPresentation expirationTitle];
    if (v6)
    {
      v17[0] = *MEMORY[0x1E4FB06F8];
      v7 = [(PXCMMInvitationSpec *)self->_spec subtitle2Font];
      v18[0] = v7;
      v17[1] = *MEMORY[0x1E4FB0700];
      v8 = [(PXCMMInvitationSpec *)self->_spec subtitle2Color];
      v18[1] = v8;
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

      v10 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v6 attributes:v9];
    }
    else
    {
      id v9 = PLSharingGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        invitation = self->_invitation;
        v12 = [(PXCMMInvitation *)invitation expiryDate];
        int v13 = 138412546;
        BOOL v14 = invitation;
        __int16 v15 = 2112;
        v16 = v12;
        _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_ERROR, "Received CMM share: %@ has no expiration date: %@", (uint8_t *)&v13, 0x16u);
      }
      v10 = 0;
    }

    [v5 setAttributedSubtitle2:v10];
  }
}

- (void)_updateStatusString:(id)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  momentShareStatusPresentation = self->_momentShareStatusPresentation;
  if (momentShareStatusPresentation)
  {
    id v5 = a3;
    char v6 = [(PXMomentShareStatusPresentation *)momentShareStatusPresentation activityTitle];
    if (v6
      || ([(PXMomentShareStatusPresentation *)self->_momentShareStatusPresentation idleTitle],
          (char v6 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v17[0] = *MEMORY[0x1E4FB06F8];
      v7 = [(PXCMMInvitationSpec *)self->_spec subtitle1Font];
      v18[0] = v7;
      v17[1] = *MEMORY[0x1E4FB0700];
      v8 = [(PXCMMInvitationSpec *)self->_spec subtitle1Color];
      v18[1] = v8;
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

      v10 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v6 attributes:v9];
    }
    else
    {
      id v9 = PLSharingGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        invitation = self->_invitation;
        v12 = self->_momentShareStatusPresentation;
        int v13 = 138412546;
        BOOL v14 = invitation;
        __int16 v15 = 2112;
        v16 = v12;
        _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_ERROR, "Received CMM share: %@ has no status: %@", (uint8_t *)&v13, 0x16u);
      }
      char v6 = 0;
      v10 = 0;
    }

    [v5 setAttributedSubtitle1:v10];
  }
}

- (void)_updateTitle:(id)a3
{
  v34[2] = *MEMORY[0x1E4F143B8];
  spec = self->_spec;
  id v5 = a3;
  char v6 = [(PXCMMInvitationSpec *)spec titleColor];
  uint64_t v7 = *MEMORY[0x1E4FB06F8];
  v33[0] = *MEMORY[0x1E4FB06F8];
  v8 = [(PXCMMInvitationSpec *)self->_spec titleEmphasizedFont];
  uint64_t v9 = *MEMORY[0x1E4FB0700];
  v33[1] = *MEMORY[0x1E4FB0700];
  v34[0] = v8;
  v34[1] = v6;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];

  if ([(PXCMMInvitation *)self->_invitation shareType] == 1)
  {
    v11 = [(PXCMMInvitation *)self->_invitation owner];
    v12 = [v11 localizedName];
    if (!v12)
    {
      v19 = PLSharingGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        invitation = self->_invitation;
        *(_DWORD *)buf = 138412546;
        v28 = invitation;
        __int16 v29 = 2112;
        v30 = v11;
        _os_log_impl(&dword_1A9AE7000, v19, OS_LOG_TYPE_ERROR, "Received CMM share: %@ has no sender display name: %@", buf, 0x16u);
      }
      int v13 = 0;
LABEL_10:

      goto LABEL_12;
    }
    int v13 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v12 attributes:v10];
    if ([(PXCMMInvitationViewModelManager *)self _showIsNewStatusInAttributedTitle])
    {
      id v24 = v5;
      BOOL v14 = +[PXCMMInvitationsIsNewMonitor sharedMonitor];
      int v15 = [v14 invitationIsNew:self->_invitation];

      if (!v15)
      {
        id v5 = v24;
        goto LABEL_12;
      }
      v16 = self->_spec;
      BOOL v23 = self->_bulletPrefix == 1;
      v31[0] = v7;
      v17 = [(PXCMMInvitationSpec *)v16 titleFont];
      v31[1] = v9;
      v32[0] = v17;
      v18 = [(PXCMMInvitationSpec *)self->_spec titleBulletColor];
      v32[1] = v18;
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];

      uint64_t v20 = objc_msgSend(v13, "px_bulletPrefixAttributedStringWithBulletAttributes:isLeftToRight:", v19, v23);

      int v13 = (void *)v20;
      id v5 = v24;
      goto LABEL_10;
    }
  }
  else
  {
    v11 = PXLocalizedStringFromTable(@"PXCMMSharedByYou", @"PhotosUICore");
    v25[0] = v7;
    v21 = [(PXCMMInvitationSpec *)self->_spec titleFont];
    v25[1] = v9;
    v26[0] = v21;
    v26[1] = v6;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];

    int v13 = objc_msgSend(MEMORY[0x1E4F28B18], "px_attributedStringWithHTMLString:defaultAttributes:emphasizedAttributes:", v11, v12, v10);
  }
LABEL_12:

  [v5 setAttributedTitle:v13];
}

- (void)_updatePosterTitle:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  viewModel = self->_viewModel;
  id v5 = a3;
  char v6 = [(PXCMMInvitationViewModel *)viewModel posterTitle];
  v11[0] = *MEMORY[0x1E4FB06F8];
  uint64_t v7 = [(PXCMMInvitationSpec *)self->_spec posterTitleFont];
  v12[0] = v7;
  v11[1] = *MEMORY[0x1E4FB0700];
  v8 = [(PXCMMInvitationSpec *)self->_spec posterTitleColor];
  v12[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  v10 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v6 attributes:v9];
  [v5 setAttributedPosterTitle:v10];
}

- (void)_updateIsNew:(id)a3
{
  id v6 = a3;
  id v4 = +[PXCMMInvitationsIsNewMonitor sharedMonitor];
  uint64_t v5 = [v4 invitationIsNew:self->_invitation];

  [v6 setIsNew:v5];
}

- (void)_registerMomentShareStatusPresentation
{
  id v3 = [(id)objc_opt_class() _serialQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(PXCMMInvitation *)self->_invitation statusPresentation];
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__PXCMMInvitationViewModelManager__registerMomentShareStatusPresentation__block_invoke;
  block[3] = &unk_1E5DD20C8;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __73__PXCMMInvitationViewModelManager__registerMomentShareStatusPresentation__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setMomentShareStatusPresentation:v1];
}

- (BOOL)_showIsNewStatusInAttributedTitle
{
  return self->_bulletPrefix != 0;
}

- (PXCMMInvitationViewModelManager)initWithInvitation:(id)a3 invitationSpec:(id)a4 bulletPrefix:(int64_t)a5
{
  id v10 = a3;
  id v11 = a4;
  v12 = v11;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PXCMMInvitationViewModelManager.m", 53, @"Invalid parameter not satisfying: %@", @"invitation" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"PXCMMInvitationViewModelManager.m", 54, @"Invalid parameter not satisfying: %@", @"invitationSpec" object file lineNumber description];

LABEL_3:
  v29.receiver = self;
  v29.super_class = (Class)PXCMMInvitationViewModelManager;
  int v13 = [(PXCMMInvitationViewModelManager *)&v29 init];
  BOOL v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_invitation, a3);
    objc_storeStrong((id *)&v14->_spec, a4);
    v14->_bulletPrefix = a5;
    int v15 = objc_alloc_init(PXCMMInvitationViewModel);
    viewModel = v14->_viewModel;
    v14->_viewModel = v15;

    v17 = v14->_viewModel;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    void v26[2] = __82__PXCMMInvitationViewModelManager_initWithInvitation_invitationSpec_bulletPrefix___block_invoke;
    v26[3] = &unk_1E5DB01E8;
    id v27 = v10;
    v18 = v14;
    v28 = v18;
    [(PXCMMInvitationViewModel *)v17 performChanges:v26];
    objc_initWeak(&location, v18);
    v19 = [(id)objc_opt_class() _serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__PXCMMInvitationViewModelManager_initWithInvitation_invitationSpec_bulletPrefix___block_invoke_2;
    block[3] = &unk_1E5DD32D0;
    objc_copyWeak(&v24, &location);
    dispatch_async(v19, block);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  return v14;
}

void __82__PXCMMInvitationViewModelManager_initWithInvitation_invitationSpec_bulletPrefix___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = [*(id *)(a1 + 32) owner];
  [v10 setOwner:v3];

  id v4 = [*(id *)(a1 + 32) title];
  [v10 setPosterTitle:v4];

  id v5 = [*(id *)(a1 + 32) subtitle];
  [v10 setPosterSubtitle:v5];

  id v6 = [*(id *)(a1 + 32) posterAsset];
  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) posterMediaProvider];
  }
  else
  {
    id v7 = 0;
  }
  [v10 setPosterAsset:v6];
  [v10 setPosterMediaProvider:v7];
  [*(id *)(a1 + 40) _updatePosterTitle:v10];
  [*(id *)(a1 + 40) _updateIsNew:v10];
  [*(id *)(a1 + 40) _updateTitle:v10];
  [*(id *)(a1 + 40) _updateStatusString:v10];
  [*(id *)(a1 + 40) _updateExpirationTitle:v10];
  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 addObserver:*(void *)(a1 + 40) selector:sel__contentSizeCategoryDidChange_ name:*MEMORY[0x1E4FB27A8] object:0];

  uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 addObserver:*(void *)(a1 + 40) selector:sel__invitationsIsNewMonitorDidChange_ name:@"PXCMMInvitationsIsNewMonitorDidChangeNotification" object:0];
}

void __82__PXCMMInvitationViewModelManager_initWithInvitation_invitationSpec_bulletPrefix___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _registerMomentShareStatusPresentation];
}

- (PXCMMInvitationViewModelManager)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMInvitationViewModelManager.m", 49, @"%s is not available as initializer", "-[PXCMMInvitationViewModelManager init]");

  abort();
}

+ (id)_serialQueue
{
  if (_serialQueue_predicate != -1) {
    dispatch_once(&_serialQueue_predicate, &__block_literal_global_13893);
  }
  v2 = (void *)_serialQueue_serialQueue;
  return v2;
}

void __47__PXCMMInvitationViewModelManager__serialQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);

  dispatch_queue_t v1 = dispatch_queue_create("com.apple.photos.PXCMMInvitationViewModelManager", attr);
  v2 = (void *)_serialQueue_serialQueue;
  _serialQueue_serialQueue = (uint64_t)v1;
}

@end