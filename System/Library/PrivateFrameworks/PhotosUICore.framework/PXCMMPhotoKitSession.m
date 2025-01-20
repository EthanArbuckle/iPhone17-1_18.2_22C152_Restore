@interface PXCMMPhotoKitSession
- (PHMomentShare)momentShare;
- (PHMomentShare)originatingMomentShare;
- (PHSuggestion)suggestion;
- (PXCMMPhotoKitSession)initWithContext:(id)a3;
- (PXCMMPhotoKitSession)initWithPhotoKitContext:(id)a3;
- (id)description;
- (id)diagnosticDictionary;
- (id)importSessionID;
- (id)importStatusManager;
- (id)momentShareStatus;
- (id)notificationSuppressionContexts;
@end

@implementation PXCMMPhotoKitSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingMomentShare, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_momentShare, 0);
  objc_storeStrong((id *)&self->_photoKitImportSessionID, 0);
  objc_storeStrong((id *)&self->_photoKitMomentShareStatus, 0);
  objc_storeStrong((id *)&self->_importStatusManager, 0);
}

- (PHMomentShare)originatingMomentShare
{
  return self->_originatingMomentShare;
}

- (PHSuggestion)suggestion
{
  return self->_suggestion;
}

- (PHMomentShare)momentShare
{
  return self->_momentShare;
}

- (id)diagnosticDictionary
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)PXCMMPhotoKitSession;
  v3 = [(PXCMMSession *)&v15 diagnosticDictionary];
  v4 = [(PXCMMPhotoKitSession *)self suggestion];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 photoLibrary];
    v7 = [v5 localIdentifier];
    id v14 = 0;
    v8 = [v6 sharingSuggestionDebugInformationForAssetCollectionLocalIdentifier:v7 error:&v14];
    id v9 = v14;

    if (v8)
    {
      v10 = [MEMORY[0x1E4F1CA60] dictionary];
      v11 = v10;
      if (v3) {
        [v10 addEntriesFromDictionary:v3];
      }
      [v11 addEntriesFromDictionary:v8];
      uint64_t v12 = [v11 copy];

      v3 = (void *)v12;
    }
    else
    {
      v11 = PLSharingGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v5;
        _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_ERROR, "Failed to retrieve debug information for suggestion %@", buf, 0xCu);
      }
    }
  }
  return v3;
}

- (id)description
{
  momentShare = self->_momentShare;
  if (momentShare)
  {
    v4 = [NSString stringWithFormat:@", %@", momentShare];
  }
  else
  {
    v4 = &stru_1F00B0030;
  }
  if (self->_suggestion)
  {
    v5 = [NSString stringWithFormat:@", %@", self->_suggestion];
  }
  else
  {
    v5 = &stru_1F00B0030;
  }
  v6 = [NSString stringWithFormat:@"<%@:%p%@%@>", objc_opt_class(), self, v4, v5];

  return v6;
}

- (id)momentShareStatus
{
  return self->_photoKitMomentShareStatus;
}

- (id)importSessionID
{
  return self->_photoKitImportSessionID;
}

- (id)importStatusManager
{
  return self->_importStatusManager;
}

- (id)notificationSuppressionContexts
{
  v3 = [(PXCMMPhotoKitSession *)self momentShare];
  v4 = [v3 uuid];

  unint64_t v5 = [(PXCMMSession *)self activityType];
  v6 = 0;
  if (v5 == 2 && v4)
  {
    v7 = PLSuppressionContextForMomentShareUUID();
    v6 = [MEMORY[0x1E4F1CAD0] setWithObject:v7];
  }
  return v6;
}

- (PXCMMPhotoKitSession)initWithPhotoKitContext:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"PXCMMPhotoKitSession.m", 41, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  v27.receiver = self;
  v27.super_class = (Class)PXCMMPhotoKitSession;
  v6 = [(PXCMMSession *)&v27 initWithContext:v5];
  if (v6)
  {
    uint64_t v7 = [v5 momentShare];
    momentShare = v6->_momentShare;
    v6->_momentShare = (PHMomentShare *)v7;

    uint64_t v9 = [v5 suggestion];
    suggestion = v6->_suggestion;
    v6->_suggestion = (PHSuggestion *)v9;

    uint64_t v11 = [v5 originatingMomentShare];
    originatingMomentShare = v6->_originatingMomentShare;
    v6->_originatingMomentShare = (PHMomentShare *)v11;

    if ([(PXCMMSession *)v6 activityType] == 2)
    {
      v13 = +[PXCompleteMyMomentSettings sharedInstance];
      uint64_t v14 = [v13 simulateImport];

      objc_super v15 = [[PXPhotoKitImportStatusManager alloc] initAllowingSimulation:v14];
      importStatusManager = v6->_importStatusManager;
      v6->_importStatusManager = v15;
    }
    v17 = [(PXCMMSession *)v6 viewModel];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __48__PXCMMPhotoKitSession_initWithPhotoKitContext___block_invoke;
    v25[3] = &unk_1E5DCCFD0;
    uint64_t v18 = v6;
    v26 = v18;
    [v17 performChanges:v25];

    if (v6->_momentShare)
    {
      v19 = [[PXPhotoKitMomentShareStatus alloc] initWithPhotoKitMomentShare:v6->_momentShare];
      photoKitMomentShareStatus = v18->_photoKitMomentShareStatus;
      v18->_photoKitMomentShareStatus = v19;

      uint64_t v21 = [MEMORY[0x1E4F8BA08] UUIDString];
      photoKitImportSessionID = v18->_photoKitImportSessionID;
      v18->_photoKitImportSessionID = (NSString *)v21;
    }
  }

  return v6;
}

void __48__PXCMMPhotoKitSession_initWithPhotoKitContext___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 144);
  id v3 = a2;
  objc_msgSend(v3, "setContainsUnverifiedPersons:", objc_msgSend(v2, "containsUnverifiedPersons"));
}

- (PXCMMPhotoKitSession)initWithContext:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMPhotoKitSession.m", 37, @"%s is not available as initializer", "-[PXCMMPhotoKitSession initWithContext:]");

  abort();
}

@end