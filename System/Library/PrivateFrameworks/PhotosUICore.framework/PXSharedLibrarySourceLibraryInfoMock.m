@interface PXSharedLibrarySourceLibraryInfoMock
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)assetsCountsForAssetLocalIdentifiers:(SEL)a3;
- (BOOL)isCloudPhotoLibraryEnabled;
- (BOOL)isCloudPhotoLibraryExiting;
- (BOOL)isCloudPhotoLibraryInitialSyncCompleted;
- (BOOL)isFailedToURLFetchOwnedSharedLibraryError:(id)a3;
- (BOOL)isSharedLibraryNotFoundError:(id)a3;
- (BOOL)isSystemPhotoLibrary;
- (BOOL)presentCustomInformationForError:(id)a3 customTitle:(id *)a4 customMessage:(id *)a5;
- (BOOL)presentServerGeneratedMessageForError:(id)a3 customMessage:(id *)a4 learnMoreURL:(id *)a5;
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

@implementation PXSharedLibrarySourceLibraryInfoMock

- (BOOL)isFailedToURLFetchOwnedSharedLibraryError:(id)a3
{
  return 0;
}

- (BOOL)isSharedLibraryNotFoundError:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 domain];
    if ([v5 isEqualToString:@"PXSharedLibraryErrorDomain"]) {
      BOOL v6 = [v4 code] == -1002;
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

- (BOOL)presentServerGeneratedMessageForError:(id)a3 customMessage:(id *)a4 learnMoreURL:(id *)a5
{
  return 0;
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
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXSharedLibrarySourceLibraryInfoMock.m", 95, @"Invalid parameter not satisfying: %@", @"customTitle" object file lineNumber description];

    if (a5) {
      goto LABEL_3;
    }
  }
  v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2, self, @"PXSharedLibrarySourceLibraryInfoMock.m", 96, @"Invalid parameter not satisfying: %@", @"customMessage" object file lineNumber description];

LABEL_3:
  BOOL v10 = [(PXSharedLibrarySourceLibraryInfoMock *)self isSharedLibraryNotFoundError:v9];
  if (v10)
  {
    PXLocalizedSharedLibraryString(@"PXSharedLibraryFetchInvitationFailureAlertTitle_Permanent");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    *a5 = 0;
  }

  return v10;
}

- (void)createPreviewWithEmailAddresses:(id)a3 phoneNumbers:(id)a4 autoSharePolicy:(int64_t)a5 startDate:(id)a6 personUUIDs:(id)a7 progress:(id)a8 presentationEnvironment:(id)a9 withCompletionHandler:(id)a10
{
}

- (void)createSharedLibraryWithEmailAddresses:(id)a3 phoneNumbers:(id)a4 autoSharePolicy:(int64_t)a5 startDate:(id)a6 personUUIDs:(id)a7 progress:(id)a8 presentationEnvironment:(id)a9 withCompletionHandler:(id)a10
{
}

- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider
{
  v2 = [(PXSharedLibrarySourceLibraryInfoMock *)self pickerConfiguration];
  id v3 = [v2 photoLibrary];
  v4 = +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:v3];

  return (PXSharedLibraryStatusProvider *)v4;
}

- (BOOL)isCloudPhotoLibraryInitialSyncCompleted
{
  return 1;
}

- (BOOL)isCloudPhotoLibraryExiting
{
  return 0;
}

- (BOOL)isCloudPhotoLibraryEnabled
{
  return 1;
}

- (BOOL)isSystemPhotoLibrary
{
  return 1;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)assetsCountsForAssetLocalIdentifiers:(SEL)a3
{
  *retstr = *($F99D9A4FB75BC57F3386B8DC8EE08D7A *)off_1E5DAAEE0;
  return self;
}

- (id)pickerConfiguration
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F39930]);
  return v2;
}

- (id)createDataSourceManager
{
  return 0;
}

- (void)fetchEstimatedAssetsCountsForExit:(BOOL)a3 imageCount:(unint64_t *)a4 videoCount:(unint64_t *)a5 audioCount:(unint64_t *)a6 itemCount:(unint64_t *)a7
{
  *a4 = 250;
  *a5 = 125;
}

- (void)fetchEstimatedAssetsCountsShareEverythingPolicyWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PXSharedLibrarySourceLibraryInfoMock.m", 38, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__PXSharedLibrarySourceLibraryInfoMock_fetchEstimatedAssetsCountsShareEverythingPolicyWithCompletion___block_invoke;
  block[3] = &unk_1E5DD3128;
  id v9 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __102__PXSharedLibrarySourceLibraryInfoMock_fetchEstimatedAssetsCountsShareEverythingPolicyWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  long long v5 = xmmword_1AB359D50;
  uint64_t v6 = 0;
  return (*(uint64_t (**)(uint64_t, long long *, uint64_t))(v3 + 16))(v3, &v5, a3);
}

- (void)fetchEstimatedAssetsCountsForStartDate:(id)a3 personUUIDs:(id)a4 completion:(id)a5
{
  id v7 = a5;
  if (!v7)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXSharedLibrarySourceLibraryInfoMock.m", 30, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__PXSharedLibrarySourceLibraryInfoMock_fetchEstimatedAssetsCountsForStartDate_personUUIDs_completion___block_invoke;
  block[3] = &unk_1E5DD3128;
  id v11 = v7;
  id v8 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __102__PXSharedLibrarySourceLibraryInfoMock_fetchEstimatedAssetsCountsForStartDate_personUUIDs_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  long long v5 = xmmword_1AB359D60;
  uint64_t v6 = 0;
  return (*(uint64_t (**)(uint64_t, long long *, uint64_t))(v3 + 16))(v3, &v5, a3);
}

- (void)fetchSuggestedStartDateForPersonUUIDs:(id)a3 completion:(id)a4
{
  id v4 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__PXSharedLibrarySourceLibraryInfoMock_fetchSuggestedStartDateForPersonUUIDs_completion___block_invoke;
  block[3] = &unk_1E5DD3128;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __89__PXSharedLibrarySourceLibraryInfoMock_fetchSuggestedStartDateForPersonUUIDs_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F1C9C8] now];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

@end