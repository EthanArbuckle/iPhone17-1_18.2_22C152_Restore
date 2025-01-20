@interface PXSharedLibrarySourceLibraryInfoPhotoKit
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)assetsCountsForAssetLocalIdentifiers:(SEL)a3;
- (BOOL)_isCPLExitModeError:(id)a3;
- (BOOL)_isRegionUnsupportedError:(id)a3;
- (BOOL)_isTooManyParticipantsError:(id)a3;
- (BOOL)_isU13RestrictedError:(id)a3;
- (BOOL)isCloudPhotoLibraryEnabled;
- (BOOL)isCloudPhotoLibraryExiting;
- (BOOL)isCloudPhotoLibraryInitialSyncCompleted;
- (BOOL)isFailedToURLFetchOwnedSharedLibraryError:(id)a3;
- (BOOL)isSharedLibraryNotFoundError:(id)a3;
- (BOOL)isSystemPhotoLibrary;
- (BOOL)presentCustomInformationForError:(id)a3 customTitle:(id *)a4 customMessage:(id *)a5;
- (BOOL)presentServerGeneratedMessageForError:(id)a3 customMessage:(id *)a4 learnMoreURL:(id *)a5;
- (NSString)description;
- (OS_dispatch_queue)queue;
- (PHPhotoLibrary)photoLibrary;
- (PXSharedLibrarySourceLibraryInfoPhotoKit)init;
- (PXSharedLibrarySourceLibraryInfoPhotoKit)initWithPhotoLibrary:(id)a3;
- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider;
- (id)createDataSourceManager;
- (id)pickerConfiguration;
- (void)createPreviewWithEmailAddresses:(id)a3 phoneNumbers:(id)a4 autoSharePolicy:(int64_t)a5 startDate:(id)a6 personUUIDs:(id)a7 progress:(id)a8 presentationEnvironment:(id)a9 withCompletionHandler:(id)a10;
- (void)createSharedLibraryWithEmailAddresses:(id)a3 phoneNumbers:(id)a4 autoSharePolicy:(int64_t)a5 startDate:(id)a6 personUUIDs:(id)a7 progress:(id)a8 presentationEnvironment:(id)a9 withCompletionHandler:(id)a10;
- (void)fetchEstimatedAssetsCountsForExit:(BOOL)a3 imageCount:(unint64_t *)a4 videoCount:(unint64_t *)a5 audioCount:(unint64_t *)a6 itemCount:(unint64_t *)a7;
- (void)fetchEstimatedAssetsCountsForStartDate:(id)a3 personUUIDs:(id)a4 completion:(id)a5;
- (void)fetchEstimatedAssetsCountsShareEverythingPolicyWithCompletion:(id)a3;
- (void)fetchSuggestedStartDateForPersonUUIDs:(id)a3 completion:(id)a4;
@end

@implementation PXSharedLibrarySourceLibraryInfoPhotoKit

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (BOOL)_isCPLExitModeError:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 domain];
    if ([v5 isEqualToString:*MEMORY[0x1E4F39800]]) {
      BOOL v6 = [v4 code] == 6007;
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_isTooManyParticipantsError:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 domain];
    if ([v5 isEqualToString:*MEMORY[0x1E4F39800]]) {
      BOOL v6 = [v4 code] == 6011;
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_isRegionUnsupportedError:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 domain];
    if ([v5 isEqualToString:*MEMORY[0x1E4F39800]]) {
      BOOL v6 = [v4 code] == 8504;
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_isU13RestrictedError:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 domain];
    if ([v5 isEqualToString:*MEMORY[0x1E4F39800]]) {
      BOOL v6 = [v4 code] == 8503;
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isFailedToURLFetchOwnedSharedLibraryError:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 domain];
    if ([v5 isEqualToString:*MEMORY[0x1E4F39800]]) {
      BOOL v6 = [v4 code] == 8505;
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isSharedLibraryNotFoundError:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 domain];
    if ([v5 isEqualToString:*MEMORY[0x1E4F39800]] && objc_msgSend(v4, "code") == 6003)
    {
      BOOL v6 = 1;
    }
    else
    {
      v7 = [v4 domain];
      if ([v7 isEqualToString:@"PXSharedLibraryErrorDomain"]) {
        BOOL v6 = [v4 code] == -1002;
      }
      else {
        BOOL v6 = 0;
      }
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)presentServerGeneratedMessageForError:(id)a3 customMessage:(id *)a4 learnMoreURL:(id *)a5
{
  id v9 = a3;
  if (a4)
  {
    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXSharedLibrarySourceLibraryInfoPhotoKit.m", 278, @"Invalid parameter not satisfying: %@", @"customMessage" object file lineNumber description];

    if (a5) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"PXSharedLibrarySourceLibraryInfoPhotoKit.m", 279, @"Invalid parameter not satisfying: %@", @"learnMoreURL" object file lineNumber description];

LABEL_3:
  v10 = [v9 userInfo];
  v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F39830]];

  v12 = [v9 userInfo];
  v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F39730]];

  uint64_t v14 = [v11 length];
  if (v14)
  {
    *a4 = v11;
    *a5 = v13;
  }

  return v14 != 0;
}

- (BOOL)presentCustomInformationForError:(id)a3 customTitle:(id *)a4 customMessage:(id *)a5
{
  id v9 = a3;
  if (a4)
  {
    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXSharedLibrarySourceLibraryInfoPhotoKit.m", 245, @"Invalid parameter not satisfying: %@", @"customTitle" object file lineNumber description];

    if (a5) {
      goto LABEL_3;
    }
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"PXSharedLibrarySourceLibraryInfoPhotoKit.m", 246, @"Invalid parameter not satisfying: %@", @"customMessage" object file lineNumber description];

LABEL_3:
  if ([(PXSharedLibrarySourceLibraryInfoPhotoKit *)self isSharedLibraryNotFoundError:v9])
  {
    PXLocalizedSharedLibraryString(@"PXSharedLibraryFetchInvitationFailureAlertTitle_Permanent");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    v10 = @"PXSharedLibraryFetchInvitationFailureAlertMessage_ShareNotFound";
  }
  else if ([(PXSharedLibrarySourceLibraryInfoPhotoKit *)self _isU13RestrictedError:v9])
  {
    PXLocalizedSharedLibraryString(@"PXSharedLibraryAcceptInvitationFailureAlertTitle_Permanent");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    v10 = @"PXSharedLibraryAcceptInvitationFailureAlertMessage_U13Restricted";
  }
  else if ([(PXSharedLibrarySourceLibraryInfoPhotoKit *)self _isRegionUnsupportedError:v9])
  {
    PXLocalizedSharedLibraryString(@"PXSharedLibraryAcceptInvitationFailureAlertTitle_Permanent");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    v10 = @"PXSharedLibraryAcceptInvitationFailureAlertMessage_RegionUnsupported";
  }
  else
  {
    if ([(PXSharedLibrarySourceLibraryInfoPhotoKit *)self _isTooManyParticipantsError:v9])
    {
      PXLocalizedSharedLibraryString(@"PXSharedLibraryAddParticipantsFailureAlertTitle_TooManyParticipants");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      v13 = NSString;
      uint64_t v14 = PXLocalizedSharedLibraryString(@"PXSharedLibraryAddParticipantsFailureAlertMessageFormat_%lu_TooManyParticipants");
      objc_msgSend(v13, "localizedStringWithFormat:", v14, 5);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
    if (![(PXSharedLibrarySourceLibraryInfoPhotoKit *)self _isCPLExitModeError:v9])
    {
      BOOL v11 = 0;
      goto LABEL_11;
    }
    PXLocalizedSharedLibraryString(@"PXSharedLibraryPublishFailureAlertTitle_CPLExitMode");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    v10 = @"PXSharedLibraryPublishFailureAlertMessage_CPLExitMode";
  }
  PXLocalizedSharedLibraryString(v10);
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
  BOOL v11 = 1;
LABEL_11:

  return v11;
}

- (void)createPreviewWithEmailAddresses:(id)a3 phoneNumbers:(id)a4 autoSharePolicy:(int64_t)a5 startDate:(id)a6 personUUIDs:(id)a7 progress:(id)a8 presentationEnvironment:(id)a9 withCompletionHandler:(id)a10
{
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a4;
  id v23 = a3;
  if (a5 == 2) {
    __int16 v24 = 2;
  }
  else {
    __int16 v24 = a5 == 1;
  }
  v25 = [(PXSharedLibrarySourceLibraryInfoPhotoKit *)self photoLibrary];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __182__PXSharedLibrarySourceLibraryInfoPhotoKit_createPreviewWithEmailAddresses_phoneNumbers_autoSharePolicy_startDate_personUUIDs_progress_presentationEnvironment_withCompletionHandler___block_invoke;
  v27[3] = &unk_1E5DCDEA0;
  id v28 = v17;
  id v26 = v17;
  PXSharedLibraryCreatePreviewLibraryScope(v25, v23, v22, v24, v21, v20, v19, v18, v27);
}

void __182__PXSharedLibrarySourceLibraryInfoPhotoKit_createPreviewWithEmailAddresses_phoneNumbers_autoSharePolicy_startDate_personUUIDs_progress_presentationEnvironment_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v3 = [[PXSharedLibraryPhotoKit alloc] initWithLibraryScope:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)createSharedLibraryWithEmailAddresses:(id)a3 phoneNumbers:(id)a4 autoSharePolicy:(int64_t)a5 startDate:(id)a6 personUUIDs:(id)a7 progress:(id)a8 presentationEnvironment:(id)a9 withCompletionHandler:(id)a10
{
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a4;
  id v23 = a3;
  if (a5 == 2) {
    __int16 v24 = 2;
  }
  else {
    __int16 v24 = a5 == 1;
  }
  v25 = [(PXSharedLibrarySourceLibraryInfoPhotoKit *)self photoLibrary];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __188__PXSharedLibrarySourceLibraryInfoPhotoKit_createSharedLibraryWithEmailAddresses_phoneNumbers_autoSharePolicy_startDate_personUUIDs_progress_presentationEnvironment_withCompletionHandler___block_invoke;
  v27[3] = &unk_1E5DCDEA0;
  id v28 = v17;
  id v26 = v17;
  PXSharedLibrarySetupLibraryScope(v25, v23, v22, v24, v21, v20, v19, v18, v27);
}

void __188__PXSharedLibrarySourceLibraryInfoPhotoKit_createSharedLibraryWithEmailAddresses_phoneNumbers_autoSharePolicy_startDate_personUUIDs_progress_presentationEnvironment_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v3 = [[PXSharedLibraryPhotoKit alloc] initWithLibraryScope:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider
{
  v2 = [(PXSharedLibrarySourceLibraryInfoPhotoKit *)self photoLibrary];
  id v3 = +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:v2];

  return (PXSharedLibraryStatusProvider *)v3;
}

- (BOOL)isCloudPhotoLibraryInitialSyncCompleted
{
  v2 = [(PXSharedLibrarySourceLibraryInfoPhotoKit *)self photoLibrary];
  id v3 = [v2 cplStatus];

  id v4 = [v3 initialSyncDate];
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (BOOL)isCloudPhotoLibraryExiting
{
  v2 = [(PXSharedLibrarySourceLibraryInfoPhotoKit *)self photoLibrary];
  id v3 = [v2 cplStatus];
  id v4 = [v3 exitDeleteTime];
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)isCloudPhotoLibraryEnabled
{
  v2 = [(PXSharedLibrarySourceLibraryInfoPhotoKit *)self photoLibrary];
  char v3 = [v2 isCloudPhotoLibraryEnabled];

  return v3;
}

- (BOOL)isSystemPhotoLibrary
{
  v2 = [(PXSharedLibrarySourceLibraryInfoPhotoKit *)self photoLibrary];
  char v3 = [v2 isSystemPhotoLibrary];

  return v3;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)assetsCountsForAssetLocalIdentifiers:(SEL)a3
{
  BOOL v6 = (void *)MEMORY[0x1E4F38EB8];
  id v7 = a4;
  v8 = [(PXSharedLibrarySourceLibraryInfoPhotoKit *)self photoLibrary];
  id v9 = [v8 librarySpecificFetchOptions];
  id v14 = [v6 fetchAssetsWithLocalIdentifiers:v7 options:v9];

  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  unint64_t v10 = [v14 countOfAssetsWithMediaType:1];
  unint64_t v11 = [v14 countOfAssetsWithMediaType:2];
  unint64_t v12 = [v14 countOfAssetsWithMediaType:3];
  retstr->var0 = v10;
  retstr->var1 = v11;
  retstr->var2 = v12;

  return result;
}

- (id)pickerConfiguration
{
  id v3 = objc_alloc(MEMORY[0x1E4F39930]);
  id v4 = [(PXSharedLibrarySourceLibraryInfoPhotoKit *)self photoLibrary];
  BOOL v5 = (void *)[v3 initWithPhotoLibraryAndOnlyReturnsIdentifiers:v4];

  [v5 setDisabledCapabilities:16];
  [v5 _setDisabledPrivateCapabilities:4];
  return v5;
}

- (id)createDataSourceManager
{
  v2 = [(PXSharedLibrarySourceLibraryInfoPhotoKit *)self photoLibrary];
  id v3 = [v2 librarySpecificFetchOptions];
  id v4 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:2 subtype:209 options:v3];
  BOOL v5 = [[PXPhotosDataSourceConfiguration alloc] initWithCollectionListFetchResult:v4 options:0];
  BOOL v6 = [[PXPhotosDataSource alloc] initWithPhotosDataSourceConfiguration:v5];
  id v7 = [[PXPhotoKitAssetsDataSourceManager alloc] initWithPhotosDataSource:v6];

  return v7;
}

- (void)fetchEstimatedAssetsCountsForExit:(BOOL)a3 imageCount:(unint64_t *)a4 videoCount:(unint64_t *)a5 audioCount:(unint64_t *)a6 itemCount:(unint64_t *)a7
{
  BOOL v11 = a3;
  unint64_t v12 = [(PXSharedLibrarySourceLibraryInfoPhotoKit *)self photoLibrary];
  id v13 = [v12 librarySpecificFetchOptions];

  [v13 setIncludeHiddenAssets:1];
  [v13 setIncludeTrashedAssets:1];
  [MEMORY[0x1E4F39110] estimatedAssetCountToMoveForExitRetentionPolicyContributedOnly:v11 imageCount:a4 videoCount:a5 audioCount:a6 itemCount:a7 options:v13 error:0];
}

- (void)fetchEstimatedAssetsCountsShareEverythingPolicyWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    BOOL v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PXSharedLibrarySourceLibraryInfoPhotoKit.m", 126, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  BOOL v6 = [(PXSharedLibrarySourceLibraryInfoPhotoKit *)self photoLibrary];
  id v7 = [v6 librarySpecificFetchOptions];

  v8 = [(PXSharedLibrarySourceLibraryInfoPhotoKit *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __106__PXSharedLibrarySourceLibraryInfoPhotoKit_fetchEstimatedAssetsCountsShareEverythingPolicyWithCompletion___block_invoke;
  block[3] = &unk_1E5DD3280;
  id v13 = v7;
  id v14 = v5;
  id v9 = v5;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __106__PXSharedLibrarySourceLibraryInfoPhotoKit_fetchEstimatedAssetsCountsShareEverythingPolicyWithCompletion___block_invoke(uint64_t a1)
{
  long long v6 = 0uLL;
  uint64_t v7 = 0;
  _FetchCountsForRulesAndPolicy((uint64_t)&v6, MEMORY[0x1E4F1CBF0], 1, *(void *)(a1 + 32));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __106__PXSharedLibrarySourceLibraryInfoPhotoKit_fetchEstimatedAssetsCountsShareEverythingPolicyWithCompletion___block_invoke_2;
  block[3] = &unk_1E5DCDE78;
  id v3 = *(id *)(a1 + 40);
  long long v4 = v6;
  uint64_t v5 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __106__PXSharedLibrarySourceLibraryInfoPhotoKit_fetchEstimatedAssetsCountsShareEverythingPolicyWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(uint64_t (**)(uint64_t, long long *))(v1 + 16);
  long long v4 = *(_OWORD *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 56);
  return v2(v1, &v4);
}

- (void)fetchEstimatedAssetsCountsForStartDate:(id)a3 personUUIDs:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PXSharedLibrarySourceLibraryInfoPhotoKit.m", 92, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  unint64_t v12 = [(PXSharedLibrarySourceLibraryInfoPhotoKit *)self photoLibrary];
  id v13 = [v12 librarySpecificFetchOptions];

  id v14 = [(PXSharedLibrarySourceLibraryInfoPhotoKit *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __106__PXSharedLibrarySourceLibraryInfoPhotoKit_fetchEstimatedAssetsCountsForStartDate_personUUIDs_completion___block_invoke;
  block[3] = &unk_1E5DD2BB8;
  id v21 = v9;
  id v22 = v10;
  id v23 = v13;
  id v24 = v11;
  id v15 = v11;
  id v16 = v13;
  id v17 = v10;
  id v18 = v9;
  dispatch_async(v14, block);
}

void __106__PXSharedLibrarySourceLibraryInfoPhotoKit_fetchEstimatedAssetsCountsForStartDate_personUUIDs_completion___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (*(void *)(a1 + 32))
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F39130]);
    long long v4 = PXSharedLibraryDateConditionForSelectedStartDate(*(void **)(a1 + 32));
    [v3 addCondition:v4];
    [v2 addObject:v3];
  }
  if ([*(id *)(a1 + 40) count])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F39130]);
    long long v6 = PXSharedLibraryPersonConditionForSelectedPeople(*(void **)(a1 + 40));
    [v5 addCondition:v6];
    [v2 addObject:v5];
  }
  long long v11 = *(_OWORD *)off_1E5DAAEE8;
  uint64_t v12 = *((void *)off_1E5DAAEE8 + 2);
  if ([v2 count]) {
    _FetchCountsForRulesAndPolicy((uint64_t)&v11, (uint64_t)v2, 2, *(void *)(a1 + 48));
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __106__PXSharedLibrarySourceLibraryInfoPhotoKit_fetchEstimatedAssetsCountsForStartDate_personUUIDs_completion___block_invoke_2;
  v7[3] = &unk_1E5DCDE78;
  id v8 = *(id *)(a1 + 56);
  long long v9 = v11;
  uint64_t v10 = v12;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __106__PXSharedLibrarySourceLibraryInfoPhotoKit_fetchEstimatedAssetsCountsForStartDate_personUUIDs_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(uint64_t (**)(uint64_t, long long *))(v1 + 16);
  long long v4 = *(_OWORD *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 56);
  return v2(v1, &v4);
}

- (void)fetchSuggestedStartDateForPersonUUIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PXSharedLibrarySourceLibraryInfoPhotoKit *)self photoLibrary];
  long long v9 = [v8 librarySpecificFetchOptions];

  uint64_t v10 = [(PXSharedLibrarySourceLibraryInfoPhotoKit *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__PXSharedLibrarySourceLibraryInfoPhotoKit_fetchSuggestedStartDateForPersonUUIDs_completion___block_invoke;
  block[3] = &unk_1E5DD0E78;
  id v15 = v6;
  id v16 = v9;
  id v17 = v7;
  id v11 = v7;
  id v12 = v9;
  id v13 = v6;
  dispatch_async(v10, block);
}

void __93__PXSharedLibrarySourceLibraryInfoPhotoKit_fetchSuggestedStartDateForPersonUUIDs_completion___block_invoke(id *a1)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  if (![a1[4] count]) {
    goto LABEL_3;
  }
  id v2 = objc_alloc_init(MEMORY[0x1E4F39130]);
  id v3 = PXSharedLibraryPersonConditionForSelectedPeople(a1[4]);
  [v2 addCondition:v3];
  long long v4 = (void *)MEMORY[0x1E4F39130];
  v17[0] = v2;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  id v6 = [v4 suggestedStartDateForRules:v5 autoSharePolicy:2 options:a1[5] error:0];

  if (!v6)
  {
LABEL_3:
    [a1[5] setFetchLimit:1];
    id v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
    id v16 = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
    [a1[5] setSortDescriptors:v8];

    long long v9 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:a1[5]];
    uint64_t v10 = [v9 firstObject];

    id v6 = [v10 creationDate];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__PXSharedLibrarySourceLibraryInfoPhotoKit_fetchSuggestedStartDateForPersonUUIDs_completion___block_invoke_2;
  block[3] = &unk_1E5DD3280;
  id v11 = a1[6];
  id v14 = v6;
  id v15 = v11;
  id v12 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __93__PXSharedLibrarySourceLibraryInfoPhotoKit_fetchSuggestedStartDateForPersonUUIDs_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (OS_dispatch_queue)queue
{
  queue = self->_queue;
  if (!queue)
  {
    long long v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INITIATED, 0);

    id v6 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.photos.sourcelibraryinfo.fetch", v5);
    id v7 = self->_queue;
    self->_queue = v6;

    queue = self->_queue;
  }
  return queue;
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(PXSharedLibrarySourceLibraryInfoPhotoKit *)self photoLibrary];
  id v6 = [v3 stringWithFormat:@"<%@:%p, photoLibrary:\"%@\">", v4, self, v5];

  return (NSString *)v6;
}

- (PXSharedLibrarySourceLibraryInfoPhotoKit)initWithPhotoLibrary:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXSharedLibrarySourceLibraryInfoPhotoKit.m", 38, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)PXSharedLibrarySourceLibraryInfoPhotoKit;
  id v7 = [(PXSharedLibrarySourceLibraryInfoPhotoKit *)&v11 init];
  id v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_photoLibrary, a3);
  }

  return v8;
}

- (PXSharedLibrarySourceLibraryInfoPhotoKit)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSharedLibrarySourceLibraryInfoPhotoKit.m", 34, @"%s is not available as initializer", "-[PXSharedLibrarySourceLibraryInfoPhotoKit init]");

  abort();
}

@end