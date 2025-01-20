@interface PXSharedLibraryStatusProvider
+ (PXSharedLibraryStatusProvider)sharedLibraryStatusProviderWithPhotoLibrary:(id)a3;
- (BOOL)hasPreview;
- (BOOL)hasSharedLibrary;
- (BOOL)hasSharedLibraryOrPreview;
- (BOOL)isInitialized;
- (PHPhotoLibrary)photoLibrary;
- (PXSharedLibrary)exiting;
- (PXSharedLibrary)invitation;
- (PXSharedLibrary)preview;
- (PXSharedLibrary)sharedLibrary;
- (PXSharedLibrary)sharedLibraryOrPreview;
- (PXSharedLibraryStatusProvider)init;
- (PXSharedLibraryStatusProvider)initWithPhotoLibrary:(id)a3 deferInitialization:(BOOL)a4 initialHasPreview:(BOOL)a5 initialHasSharedLibrary:(BOOL)a6;
- (id)_statusDescription;
- (id)fetchExiting;
- (id)fetchPreview;
- (id)fetchSharedLibrary;
- (void)_configureExitingDataSourceManager;
- (void)_configureInvitationDataSourceManager;
- (void)_configurePreviewDataSourceManager;
- (void)_configureSharedLibraryDataSourceManager;
- (void)_fullfillDeferredInitializationIfNecessary;
- (void)_initializeDataSourceManagers;
- (void)_performDeferredInitializationIfNecessary;
- (void)_updateExitingWithChangeNotification:(BOOL)a3;
- (void)_updateInvitationReceivedDateWithIdentifier:(id)a3;
- (void)_updateInvitationWithChangeNotification:(BOOL)a3;
- (void)_updatePreviewWithChangeNotification:(BOOL)a3;
- (void)_updateSharedLibraryWithChangeNotification:(BOOL)a3;
- (void)fetchSharedLibraryForURL:(id)a3 completionHandler:(id)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setExiting:(id)a3;
- (void)setHasPreview:(BOOL)a3;
- (void)setHasSharedLibrary:(BOOL)a3;
- (void)setInvitation:(id)a3;
- (void)setIsInitialized:(BOOL)a3;
- (void)setPreview:(id)a3;
- (void)setSharedLibrary:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
@end

@implementation PXSharedLibraryStatusProvider

+ (PXSharedLibraryStatusProvider)sharedLibraryStatusProviderWithPhotoLibrary:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&sharedLibraryStatusProviderWithPhotoLibrary___statusProvidersMapTableLock);
    v4 = (void *)sharedLibraryStatusProviderWithPhotoLibrary___statusProvidersMapTable;
    if (!sharedLibraryStatusProviderWithPhotoLibrary___statusProvidersMapTable)
    {
      uint64_t v5 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
      v6 = (void *)sharedLibraryStatusProviderWithPhotoLibrary___statusProvidersMapTable;
      sharedLibraryStatusProviderWithPhotoLibrary___statusProvidersMapTable = v5;

      v4 = (void *)sharedLibraryStatusProviderWithPhotoLibrary___statusProvidersMapTable;
    }
    uint64_t v7 = [v4 objectForKey:v3];
    if (v7)
    {
      v8 = (PXSharedLibraryStatusProvider *)v7;
      v9 = PLSharedLibraryGetLog();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
LABEL_27:

        os_unfair_lock_unlock((os_unfair_lock_t)&sharedLibraryStatusProviderWithPhotoLibrary___statusProvidersMapTableLock);
        goto LABEL_28;
      }
      int v20 = 138412546;
      id v21 = v3;
      __int16 v22 = 2048;
      v23 = v8;
      v10 = "%@ Reusing existing shared library status provider: %p";
    }
    else
    {
      int IsLaunchedToExecuteTests = PFProcessIsLaunchedToExecuteTests();
      if (IsLaunchedToExecuteTests)
      {
        uint64_t v13 = 0;
        uint64_t v14 = 0;
      }
      else
      {
        LOBYTE(v20) = 0;
        int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"LastKnownHasSharedLibraryPreview", @"com.apple.mobileslideshow", (Boolean *)&v20);
        if ((_BYTE)v20) {
          BOOL v16 = AppBooleanValue == 0;
        }
        else {
          BOOL v16 = 1;
        }
        uint64_t v13 = !v16;
        LOBYTE(v20) = 0;
        int v17 = CFPreferencesGetAppBooleanValue(@"LastKnownHasSharedLibrary", @"com.apple.mobileslideshow", (Boolean *)&v20);
        if ((_BYTE)v20) {
          BOOL v18 = v17 == 0;
        }
        else {
          BOOL v18 = 1;
        }
        uint64_t v14 = !v18;
      }
      v8 = [[PXSharedLibraryStatusProvider alloc] initWithPhotoLibrary:v3 deferInitialization:IsLaunchedToExecuteTests ^ 1u initialHasPreview:v13 initialHasSharedLibrary:v14];
      [(id)sharedLibraryStatusProviderWithPhotoLibrary___statusProvidersMapTable setObject:v8 forKey:v3];
      v9 = PLSharedLibraryGetLog();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_27;
      }
      int v20 = 138412546;
      id v21 = v3;
      __int16 v22 = 2048;
      v23 = v8;
      v10 = "%@ Creating new shared library status provider: %p";
    }
    _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEBUG, v10, (uint8_t *)&v20, 0x16u);
    goto LABEL_27;
  }
  v11 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_FAULT, "+[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:] called without a photo library", (uint8_t *)&v20, 2u);
  }

  v8 = 0;
LABEL_28:

  return v8;
}

- (BOOL)hasSharedLibrary
{
  return self->_hasSharedLibrary;
}

- (PXSharedLibrary)sharedLibrary
{
  [(PXSharedLibraryStatusProvider *)self _fullfillDeferredInitializationIfNecessary];
  sharedLibrary = self->_sharedLibrary;
  return sharedLibrary;
}

- (PXSharedLibrary)invitation
{
  [(PXSharedLibraryStatusProvider *)self _fullfillDeferredInitializationIfNecessary];
  invitation = self->_invitation;
  return invitation;
}

- (PXSharedLibrary)exiting
{
  [(PXSharedLibraryStatusProvider *)self _fullfillDeferredInitializationIfNecessary];
  exiting = self->_exiting;
  return exiting;
}

- (void)_fullfillDeferredInitializationIfNecessary
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  p_deferredInitializationLock = &self->_deferredInitializationLock;
  os_unfair_lock_lock(&self->_deferredInitializationLock);
  if (!self->_invitationsDataSourceManager)
  {
    [(PXSharedLibraryStatusProvider *)self _initializeDataSourceManagers];
    v4 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [(PXSharedLibraryStatusProvider *)self _statusDescription];
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "PXSharedLibraryStatusProvider performed deferred initialization on-demand: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
  os_unfair_lock_unlock(p_deferredInitializationLock);
}

- (PXSharedLibraryStatusProvider)initWithPhotoLibrary:(id)a3 deferInitialization:(BOOL)a4 initialHasPreview:(BOOL)a5 initialHasSharedLibrary:(BOOL)a6
{
  BOOL v8 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  if (!v12)
  {
    int v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PXSharedLibraryStatusProvider.m", 288, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  v23.receiver = self;
  v23.super_class = (Class)PXSharedLibraryStatusProvider;
  uint64_t v13 = [(PXSharedLibraryStatusProvider *)&v23 init];
  uint64_t v14 = v13;
  if (v13)
  {
    v13->_deferredInitializationLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v13->_photoLibrary, a3);
    v14->_hasPreview = a5;
    v14->_hasSharedLibrary = a6;
    if (v8)
    {
      v15 = PLSharedLibraryGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v16 = [(PXSharedLibraryStatusProvider *)v14 _statusDescription];
        *(_DWORD *)buf = 138543362;
        v25 = v16;
        _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_DEFAULT, "PXSharedLibraryStatusProvider deferring initialization... (%{public}@)", buf, 0xCu);
      }
      objc_initWeak((id *)buf, v14);
      int v17 = +[PXPreloadScheduler sharedScheduler];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __116__PXSharedLibraryStatusProvider_initWithPhotoLibrary_deferInitialization_initialHasPreview_initialHasSharedLibrary___block_invoke;
      v21[3] = &unk_1E5DD32D0;
      objc_copyWeak(&v22, (id *)buf);
      [v17 scheduleMainQueueTask:v21];

      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v14->_isInitialized = 1;
      [(PXSharedLibraryStatusProvider *)v14 _initializeDataSourceManagers];
    }
    BOOL v18 = +[PXSharedLibrarySettings sharedInstance];
    [v18 addDeferredKeyObserver:v14];
  }
  return v14;
}

- (id)_statusDescription
{
  return (id)[NSString stringWithFormat:@"<Invitation: %d, Preview: %d, Shared Library: %d, Exiting: %d>", self->_invitation != 0, self->_hasPreview, self->_hasSharedLibrary, self->_exiting != 0];
}

- (void)_updateExitingWithChangeNotification:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(PXSectionedDataSourceManager *)self->_exitingDataSourceManager dataSource];
  if ([v5 containsAnyItems])
  {
    if (v5) {
      [v5 firstItemIndexPath];
    }
    else {
      memset(v11, 0, sizeof(v11));
    }
    int v6 = [v5 sharedLibraryAtItemIndexPath:v11];
    if (v3) {
      goto LABEL_8;
    }
  }
  else
  {
    int v6 = 0;
    if (v3)
    {
LABEL_8:
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __70__PXSharedLibraryStatusProvider__updateExitingWithChangeNotification___block_invoke;
      v9[3] = &unk_1E5DBCED0;
      v10 = v6;
      [(PXSharedLibraryStatusProvider *)self performChanges:v9];
      exiting = v10;
      goto LABEL_9;
    }
  }
  uint64_t v7 = v6;
  exiting = self->_exiting;
  self->_exiting = v7;
LABEL_9:
}

- (void)_initializeDataSourceManagers
{
  [(PXSharedLibraryStatusProvider *)self _configureInvitationDataSourceManager];
  [(PXSharedLibraryStatusProvider *)self _configurePreviewDataSourceManager];
  [(PXSharedLibraryStatusProvider *)self _configureSharedLibraryDataSourceManager];
  [(PXSharedLibraryStatusProvider *)self _configureExitingDataSourceManager];
}

- (void)_updateSharedLibraryWithChangeNotification:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(PXSectionedDataSourceManager *)self->_sharedLibraryDataSourceManager dataSource];
  if ([v5 containsAnyItems])
  {
    if (v5) {
      [v5 firstItemIndexPath];
    }
    else {
      memset(v10, 0, sizeof(v10));
    }
    int v6 = [v5 sharedLibraryAtItemIndexPath:v10];
  }
  else
  {
    int v6 = 0;
  }
  if (v3)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __76__PXSharedLibraryStatusProvider__updateSharedLibraryWithChangeNotification___block_invoke;
    v7[3] = &unk_1E5DBCEF8;
    id v8 = v6;
    BOOL v9 = v6 != 0;
    [(PXSharedLibraryStatusProvider *)self performChanges:v7];
  }
  else
  {
    objc_storeStrong((id *)&self->_sharedLibrary, v6);
    self->_hasSharedLibrary = v6 != 0;
    if ((PFProcessIsLaunchedToExecuteTests() & 1) == 0) {
      PXPreferencesSetInteger(@"LastKnownHasSharedLibrary", self->_hasSharedLibrary);
    }
  }
}

- (void)_updatePreviewWithChangeNotification:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(PXSectionedDataSourceManager *)self->_previewDataSourceManager dataSource];
  if ([v5 containsAnyItems])
  {
    if (v5) {
      [v5 firstItemIndexPath];
    }
    else {
      memset(v10, 0, sizeof(v10));
    }
    int v6 = [v5 sharedLibraryAtItemIndexPath:v10];
  }
  else
  {
    int v6 = 0;
  }
  if (v3)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __70__PXSharedLibraryStatusProvider__updatePreviewWithChangeNotification___block_invoke;
    v7[3] = &unk_1E5DBCEF8;
    id v8 = v6;
    BOOL v9 = v6 != 0;
    [(PXSharedLibraryStatusProvider *)self performChanges:v7];
  }
  else
  {
    objc_storeStrong((id *)&self->_preview, v6);
    self->_hasPreview = v6 != 0;
    if ((PFProcessIsLaunchedToExecuteTests() & 1) == 0) {
      PXPreferencesSetInteger(@"LastKnownHasSharedLibraryPreview", self->_hasPreview);
    }
  }
}

- (BOOL)hasSharedLibraryOrPreview
{
  return self->_hasPreview || self->_hasSharedLibrary;
}

- (void)_configureInvitationDataSourceManager
{
  if (!self->_invitationsDataSourceManager && ![(PXSharedLibraryStatusProvider *)self isInitialized])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__PXSharedLibraryStatusProvider__configureInvitationDataSourceManager__block_invoke;
    block[3] = &unk_1E5DD36F8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  BOOL v3 = [(PXSharedLibraryStatusProvider *)self photoLibrary];
  v4 = +[PXSharedLibraryDataSourceManager currentInvitationsDataSourceManagerForPhotoLibrary:v3];

  [(PXSectionedDataSourceManager *)self->_invitationsDataSourceManager unregisterChangeObserver:self context:InvitationObservationContext];
  invitationsDataSourceManager = self->_invitationsDataSourceManager;
  self->_invitationsDataSourceManager = v4;
  int v6 = v4;

  [(PXSectionedDataSourceManager *)self->_invitationsDataSourceManager registerChangeObserver:self context:InvitationObservationContext];
  [(PXSharedLibraryStatusProvider *)self _updateInvitationWithChangeNotification:0];
}

- (void)_updateInvitationWithChangeNotification:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PXSharedLibrary *)self->_invitation identifier];
  int v6 = [(PXSectionedDataSourceManager *)self->_invitationsDataSourceManager dataSource];
  if ([v6 containsAnyItems])
  {
    if (v6) {
      [v6 firstItemIndexPath];
    }
    else {
      memset(v14, 0, sizeof(v14));
    }
    uint64_t v7 = [v6 sharedLibraryAtItemIndexPath:v14];
    if (v3) {
      goto LABEL_8;
    }
LABEL_5:
    id v8 = v7;
    invitation = self->_invitation;
    self->_invitation = v8;
    goto LABEL_9;
  }
  uint64_t v7 = 0;
  if (!v3) {
    goto LABEL_5;
  }
LABEL_8:
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__PXSharedLibraryStatusProvider__updateInvitationWithChangeNotification___block_invoke;
  v12[3] = &unk_1E5DBCED0;
  uint64_t v13 = v7;
  [(PXSharedLibraryStatusProvider *)self performChanges:v12];
  invitation = v13;
LABEL_9:

  id v10 = [(PXSharedLibrary *)self->_invitation identifier];
  if (v5 == v10)
  {
  }
  else
  {
    char v11 = [v5 isEqualToString:v10];

    if ((v11 & 1) == 0) {
      [(PXSharedLibraryStatusProvider *)self _updateInvitationReceivedDateWithIdentifier:v10];
    }
  }
}

- (void)_configurePreviewDataSourceManager
{
  BOOL v3 = [(PXSharedLibraryStatusProvider *)self photoLibrary];
  v4 = +[PXSharedLibraryDataSourceManager currentPreviewDataSourceManagerForPhotoLibrary:v3];

  [(PXSectionedDataSourceManager *)self->_previewDataSourceManager unregisterChangeObserver:self context:PreviewObservationContext];
  previewDataSourceManager = self->_previewDataSourceManager;
  self->_previewDataSourceManager = v4;
  int v6 = v4;

  [(PXSectionedDataSourceManager *)self->_previewDataSourceManager registerChangeObserver:self context:PreviewObservationContext];
  [(PXSharedLibraryStatusProvider *)self _updatePreviewWithChangeNotification:0];
}

uint64_t __70__PXSharedLibraryStatusProvider__configureInvitationDataSourceManager__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsInitialized:1];
}

- (void)_configureSharedLibraryDataSourceManager
{
  BOOL v3 = [(PXSharedLibraryStatusProvider *)self photoLibrary];
  v4 = +[PXSharedLibraryDataSourceManager currentSharedLibraryDataSourceManagerForPhotoLibrary:v3];

  [(PXSectionedDataSourceManager *)self->_sharedLibraryDataSourceManager unregisterChangeObserver:self context:SharedLibraryObservationContext];
  sharedLibraryDataSourceManager = self->_sharedLibraryDataSourceManager;
  self->_sharedLibraryDataSourceManager = v4;
  int v6 = v4;

  [(PXSectionedDataSourceManager *)self->_sharedLibraryDataSourceManager registerChangeObserver:self context:SharedLibraryObservationContext];
  [(PXSharedLibraryStatusProvider *)self _updateSharedLibraryWithChangeNotification:0];
}

- (void)_configureExitingDataSourceManager
{
  BOOL v3 = [(PXSharedLibraryStatusProvider *)self photoLibrary];
  v4 = +[PXSharedLibraryDataSourceManager currentExitingDataSourceManagerForPhotoLibrary:v3];

  [(PXSectionedDataSourceManager *)self->_exitingDataSourceManager unregisterChangeObserver:self context:ExitingObservationContext];
  exitingDataSourceManager = self->_exitingDataSourceManager;
  self->_exitingDataSourceManager = v4;
  int v6 = v4;

  [(PXSectionedDataSourceManager *)self->_exitingDataSourceManager registerChangeObserver:self context:ExitingObservationContext];
  [(PXSharedLibraryStatusProvider *)self _updateExitingWithChangeNotification:0];
}

- (BOOL)isInitialized
{
  return self->_isInitialized;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (BOOL)hasPreview
{
  return self->_hasPreview;
}

- (void)setIsInitialized:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (self->_isInitialized != v3)
  {
    self->_isInitialized = v3;
    [(PXSharedLibraryStatusProvider *)self signalChange:64];
  }
}

uint64_t __70__PXSharedLibraryStatusProvider__configureInvitationDataSourceManager__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __70__PXSharedLibraryStatusProvider__configureInvitationDataSourceManager__block_invoke_2;
  v3[3] = &unk_1E5DD0FA8;
  v3[4] = v1;
  return [v1 performChanges:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_exiting, 0);
  objc_storeStrong((id *)&self->_sharedLibrary, 0);
  objc_storeStrong((id *)&self->_preview, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_storeStrong((id *)&self->_exitingDataSourceManager, 0);
  objc_storeStrong((id *)&self->_sharedLibraryDataSourceManager, 0);
  objc_storeStrong((id *)&self->_previewDataSourceManager, 0);
  objc_storeStrong((id *)&self->_invitationsDataSourceManager, 0);
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  int v6 = +[PXSharedLibraryDataSourceManager keyPathsAffectingCurrentInvitationsDataSourceManager];
  int v7 = [v6 containsObject:v5];

  if (v7)
  {
    [(PXSharedLibraryStatusProvider *)self _configureInvitationDataSourceManager];
    id v8 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = [(PXSharedLibraryStatusProvider *)self _statusDescription];
      int v17 = 138543362;
      BOOL v18 = v9;
      id v10 = "PXSharedLibraryStatusProvider INVITATIONS MANAGER did change: %{public}@";
LABEL_13:
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v17, 0xCu);

      goto LABEL_14;
    }
    goto LABEL_14;
  }
  char v11 = +[PXSharedLibraryDataSourceManager keyPathsAffectingCurrentPreviewDataSourceManager];
  int v12 = [v11 containsObject:v5];

  if (v12)
  {
    [(PXSharedLibraryStatusProvider *)self _configurePreviewDataSourceManager];
    id v8 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = [(PXSharedLibraryStatusProvider *)self _statusDescription];
      int v17 = 138543362;
      BOOL v18 = v9;
      id v10 = "PXSharedLibraryStatusProvider PREVIEW MANAGER did change: %{public}@";
      goto LABEL_13;
    }
LABEL_14:

    goto LABEL_15;
  }
  uint64_t v13 = +[PXSharedLibraryDataSourceManager keyPathsAffectingCurrentSharedLibraryDataSourceManager];
  int v14 = [v13 containsObject:v5];

  if (v14)
  {
    [(PXSharedLibraryStatusProvider *)self _configureSharedLibraryDataSourceManager];
    id v8 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = [(PXSharedLibraryStatusProvider *)self _statusDescription];
      int v17 = 138543362;
      BOOL v18 = v9;
      id v10 = "PXSharedLibraryStatusProvider SHARED LIBRARY MANAGER did change: %{public}@";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  v15 = +[PXSharedLibraryDataSourceManager keyPathsAffectingCurrentExitingDataSourceManager];
  int v16 = [v15 containsObject:v5];

  if (v16)
  {
    [(PXSharedLibraryStatusProvider *)self _configureExitingDataSourceManager];
    id v8 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = [(PXSharedLibraryStatusProvider *)self _statusDescription];
      int v17 = 138543362;
      BOOL v18 = v9;
      id v10 = "PXSharedLibraryStatusProvider EXITING MANAGER did change: %{public}@";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
LABEL_15:
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if ((void *)InvitationObservationContext == a5)
  {
    [(PXSharedLibraryStatusProvider *)self _updateInvitationWithChangeNotification:1];
    BOOL v9 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(PXSharedLibraryStatusProvider *)self _statusDescription];
      int v13 = 138543362;
      int v14 = v10;
      char v11 = "PXSharedLibraryStatusProvider INVITATIONS did change: %{public}@";
      goto LABEL_13;
    }
  }
  else if ((void *)PreviewObservationContext == a5)
  {
    [(PXSharedLibraryStatusProvider *)self _updatePreviewWithChangeNotification:1];
    BOOL v9 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(PXSharedLibraryStatusProvider *)self _statusDescription];
      int v13 = 138543362;
      int v14 = v10;
      char v11 = "PXSharedLibraryStatusProvider PREVIEW did change: %{public}@";
      goto LABEL_13;
    }
  }
  else if ((void *)SharedLibraryObservationContext == a5)
  {
    [(PXSharedLibraryStatusProvider *)self _updateSharedLibraryWithChangeNotification:1];
    BOOL v9 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(PXSharedLibraryStatusProvider *)self _statusDescription];
      int v13 = 138543362;
      int v14 = v10;
      char v11 = "PXSharedLibraryStatusProvider SHARED LIBRARY did change: %{public}@";
      goto LABEL_13;
    }
  }
  else
  {
    if ((void *)ExitingObservationContext != a5)
    {
      int v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"PXSharedLibraryStatusProvider.m" lineNumber:468 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    [(PXSharedLibraryStatusProvider *)self _updateExitingWithChangeNotification:1];
    BOOL v9 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(PXSharedLibraryStatusProvider *)self _statusDescription];
      int v13 = 138543362;
      int v14 = v10;
      char v11 = "PXSharedLibraryStatusProvider EXITING did change: %{public}@";
LABEL_13:
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)setExiting:(id)a3
{
  id v5 = (PXSharedLibrary *)a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (self->_exiting != v5)
  {
    objc_storeStrong((id *)&self->_exiting, a3);
    [(PXSharedLibraryStatusProvider *)self signalChange:32];
  }
}

- (void)setSharedLibrary:(id)a3
{
  id v5 = (PXSharedLibrary *)a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (self->_sharedLibrary != v5)
  {
    objc_storeStrong((id *)&self->_sharedLibrary, a3);
    [(PXSharedLibraryStatusProvider *)self signalChange:16];
  }
}

- (void)setPreview:(id)a3
{
  id v5 = (PXSharedLibrary *)a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (self->_preview != v5)
  {
    objc_storeStrong((id *)&self->_preview, a3);
    [(PXSharedLibraryStatusProvider *)self signalChange:8];
  }
}

- (void)setInvitation:(id)a3
{
  id v5 = (PXSharedLibrary *)a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (self->_invitation != v5)
  {
    objc_storeStrong((id *)&self->_invitation, a3);
    [(PXSharedLibraryStatusProvider *)self signalChange:4];
  }
}

- (void)setHasSharedLibrary:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (self->_hasSharedLibrary != v3)
  {
    self->_hasSharedLibrary = v3;
    if ((PFProcessIsLaunchedToExecuteTests() & 1) == 0) {
      PXPreferencesSetInteger(@"LastKnownHasSharedLibrary", self->_hasSharedLibrary);
    }
    [(PXSharedLibraryStatusProvider *)self signalChange:2];
  }
}

- (void)setHasPreview:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (self->_hasPreview != v3)
  {
    self->_hasPreview = v3;
    if ((PFProcessIsLaunchedToExecuteTests() & 1) == 0) {
      PXPreferencesSetInteger(@"LastKnownHasSharedLibraryPreview", self->_hasPreview);
    }
    [(PXSharedLibraryStatusProvider *)self signalChange:1];
  }
}

- (PXSharedLibrary)preview
{
  [(PXSharedLibraryStatusProvider *)self _fullfillDeferredInitializationIfNecessary];
  preview = self->_preview;
  return preview;
}

- (void)_performDeferredInitializationIfNecessary
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  p_deferredInitializationLock = &self->_deferredInitializationLock;
  os_unfair_lock_lock(&self->_deferredInitializationLock);
  if (!self->_invitationsDataSourceManager)
  {
    [(PXSharedLibraryStatusProvider *)self _initializeDataSourceManagers];
    v4 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(PXSharedLibraryStatusProvider *)self _statusDescription];
      int v6 = 138543362;
      int v7 = v5;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "PXSharedLibraryStatusProvider performed scheduled deferred initialization: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
  os_unfair_lock_unlock(p_deferredInitializationLock);
}

- (PXSharedLibraryStatusProvider)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSharedLibraryStatusProvider.m", 315, @"%s is not available as initializer", "-[PXSharedLibraryStatusProvider init]");

  abort();
}

void __116__PXSharedLibraryStatusProvider_initWithPhotoLibrary_deferInitialization_initialHasPreview_initialHasSharedLibrary___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _performDeferredInitializationIfNecessary];
}

uint64_t __70__PXSharedLibraryStatusProvider__updateExitingWithChangeNotification___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setExiting:*(void *)(a1 + 32)];
}

void __76__PXSharedLibraryStatusProvider__updateSharedLibraryWithChangeNotification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setSharedLibrary:v3];
  [v4 setHasSharedLibrary:*(unsigned __int8 *)(a1 + 40)];
}

void __70__PXSharedLibraryStatusProvider__updatePreviewWithChangeNotification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setPreview:v3];
  [v4 setHasPreview:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_updateInvitationReceivedDateWithIdentifier:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = _PXPreferencesSharedLibraryInvitationDate(@"SharedLibraryInvitationReceivedDate", v3);
    if (!v4)
    {
      id v5 = PLSharedLibraryGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 138543362;
        id v8 = v3;
        _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "Updating shared library invitation received date for library %{public}@", (uint8_t *)&v7, 0xCu);
      }

      int v6 = [MEMORY[0x1E4F1C9C8] now];
      _PXPreferencesSetSharedLibraryInvitationDate(@"SharedLibraryInvitationReceivedDate", v6, v3);
    }
  }
}

uint64_t __73__PXSharedLibraryStatusProvider__updateInvitationWithChangeNotification___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setInvitation:*(void *)(a1 + 32)];
}

- (id)fetchExiting
{
  [(PXSharedLibraryStatusProvider *)self _fullfillDeferredInitializationIfNecessary];
  exitingDataSourceManager = self->_exitingDataSourceManager;
  if (!exitingDataSourceManager)
  {
    int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXSharedLibraryStatusProvider.m", 87, @"Invalid parameter not satisfying: %@", @"_exitingDataSourceManager" object file lineNumber description];

    exitingDataSourceManager = self->_exitingDataSourceManager;
  }
  return [(PXSharedLibraryDataSourceManager *)exitingDataSourceManager fetchExiting];
}

- (id)fetchSharedLibrary
{
  [(PXSharedLibraryStatusProvider *)self _fullfillDeferredInitializationIfNecessary];
  sharedLibraryDataSourceManager = self->_sharedLibraryDataSourceManager;
  if (!sharedLibraryDataSourceManager)
  {
    int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXSharedLibraryStatusProvider.m", 78, @"Invalid parameter not satisfying: %@", @"_sharedLibraryDataSourceManager" object file lineNumber description];

    sharedLibraryDataSourceManager = self->_sharedLibraryDataSourceManager;
  }
  return [(PXSharedLibraryDataSourceManager *)sharedLibraryDataSourceManager fetchSharedLibrary];
}

- (id)fetchPreview
{
  [(PXSharedLibraryStatusProvider *)self _fullfillDeferredInitializationIfNecessary];
  previewDataSourceManager = self->_previewDataSourceManager;
  if (!previewDataSourceManager)
  {
    int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXSharedLibraryStatusProvider.m", 69, @"Invalid parameter not satisfying: %@", @"_previewDataSourceManager" object file lineNumber description];

    previewDataSourceManager = self->_previewDataSourceManager;
  }
  return [(PXSharedLibraryDataSourceManager *)previewDataSourceManager fetchPreview];
}

- (void)fetchSharedLibraryForURL:(id)a3 completionHandler:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  [(PXSharedLibraryStatusProvider *)self _fullfillDeferredInitializationIfNecessary];
  sharedLibraryDataSourceManager = self->_sharedLibraryDataSourceManager;
  if (!sharedLibraryDataSourceManager)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXSharedLibraryStatusProvider.m", 61, @"Invalid parameter not satisfying: %@", @"_sharedLibraryDataSourceManager" object file lineNumber description];

    sharedLibraryDataSourceManager = self->_sharedLibraryDataSourceManager;
  }
  [(PXSharedLibraryDataSourceManager *)sharedLibraryDataSourceManager fetchSharedLibraryForURL:v10 completionHandler:v7];
}

- (PXSharedLibrary)sharedLibraryOrPreview
{
  id v3 = [(PXSharedLibraryStatusProvider *)self preview];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(PXSharedLibraryStatusProvider *)self sharedLibrary];
  }
  int v6 = v5;

  return (PXSharedLibrary *)v6;
}

@end