@interface PXPhotoKitAssetCollectionFileRadarActionPerformer
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5;
+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4;
- (void)_presentTTRWorkFlowInViewController:(id)a3 context:(int64_t)a4 attachmentImageUrls:(id)a5 attachmentFileUrls:(id)a6;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitAssetCollectionFileRadarActionPerformer

- (void)_presentTTRWorkFlowInViewController:(id)a3 context:(int64_t)a4 attachmentImageUrls:(id)a5 attachmentFileUrls:(id)a6
{
  +[PXTTRWorkflowFactory presentDefaultWorkFlowInViewController:a3 withContext:a4 attachmentImageUrls:a5 attachmentFileUrls:a6];
  [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
}

- (void)performUserInteractionTask
{
  v50[1] = *MEMORY[0x1E4F143B8];
  v4 = [(PXAssetCollectionActionPerformer *)self assetCollection];
  if ([v4 assetCollectionType] != 4)
  {
    if ([v4 assetCollectionType] == 6)
    {
      id v5 = v4;
      if (v5)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
LABEL_11:
          v6 = [[PXHighlightDiagnosticsViewController alloc] initWithHighlight:v5];
          v7 = [(PXActionPerformer *)self hostViewController];
          v8 = [(PXHighlightDiagnosticsViewController *)v6 radarAttachmentURLs];
          v9 = self;
          id v10 = v7;
          uint64_t v11 = 2;
LABEL_15:
          v12 = v8;
          goto LABEL_16;
        }
        v32 = [MEMORY[0x1E4F28B00] currentHandler];
        v35 = (objc_class *)objc_opt_class();
        v34 = NSStringFromClass(v35);
        v36 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
        [v32 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionActionManager.m", 1597, @"%@ should be an instance inheriting from %@, but it is %@", @"assetCollection", v34, v36 object file lineNumber description];
      }
      else
      {
        v32 = [MEMORY[0x1E4F28B00] currentHandler];
        v33 = (objc_class *)objc_opt_class();
        v34 = NSStringFromClass(v33);
        [v32 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionActionManager.m", 1597, @"%@ should be an instance inheriting from %@, but it is nil", @"assetCollection", v34 object file lineNumber description];
      }

      goto LABEL_11;
    }
    if ([v4 assetCollectionType] == 2)
    {
      v13 = [(PXAssetCollectionActionPerformer *)self socialGroups];

      if (v13)
      {
        id v5 = [(PXActionPerformer *)self hostViewController];
        v14 = [v4 photoLibrary];
        v6 = +[PXPeopleSwiftUtilities fetchAllSocialGroupDetailedDebugDescriptionFor:v14];

        v7 = PXFeedbackTapToRadarUtilitiesWriteStringToFileWithExtension(v6, @"SocialGroups-Debug", @"txt");
        v50[0] = v7;
        v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:1];
        v9 = self;
        id v10 = v5;
        uint64_t v11 = 3;
        goto LABEL_15;
      }
    }
    v15 = +[PXFeedbackTapToRadarUtilities captureScreenshot];
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v41 = 3221225472;
    v42 = __79__PXPhotoKitAssetCollectionFileRadarActionPerformer_performUserInteractionTask__block_invoke;
    v43 = &unk_1E5DD0058;
    id v5 = v15;
    id v44 = v5;
    v45 = self;
    v16 = _Block_copy(&aBlock);
    v17 = +[PXFeedbackTapToRadarUtilities defaultTitlePrefix];
    v18 = (void *)[v17 mutableCopy];

    v19 = +[PXFeedbackTapToRadarUtilities defaultDescription];
    v20 = (void *)[v19 mutableCopy];

    if (v5)
    {
      id v49 = v5;
      v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
    }
    else
    {
      v21 = 0;
    }
    if ([v4 assetCollectionType] == 7)
    {
      [v18 appendString:@"CMM - [TTR] <Insert Bug Title>"];
      [v20 appendString:@"---Moment Share Tap-To-Radar (CMM / iCloud Sharing Link)---\n"];
      [v20 appendFormat:@"Moment Share: %@", v4];
      v48 = @"com.apple.PhotoLibraryServices.PhotosDiagnostics";
      v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
      v38 = v22;
      v39 = v16;
      v23 = @"1073863";
      LOWORD(v37) = 1;
      v24 = @"Photos UI Shared iCloud Link";
    }
    else
    {
      if (!objc_msgSend(v4, "px_isSharedLibrarySharingSuggestion"))
      {
        v25 = [(PXActionPerformer *)self hostViewController];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v22 = [(PXActionPerformer *)self hostViewController];
          [(PXPhotoKitAssetCollectionFileRadarActionPerformer *)self _presentTTRWorkFlowInViewController:v22 context:5 attachmentImageUrls:v21 attachmentFileUrls:0];
        }
        else
        {
          [v18 appendString:@"Photos - [TTR] <Insert Bug Title>"];
          v46 = @"com.apple.PhotoLibraryServices.PhotosDiagnostics";
          v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
          LOWORD(v37) = 1;
          +[PXFeedbackTapToRadarUtilities fileRadarWithTitle:v18, v20, @"Other Bug", @"630529", @"Photos (New Bugs) | iOS", @"all", 0, v21, 0, v37, v22, v16, aBlock, v41, v42, v43 description classification componentID componentName componentVersion keyword screenshotURLs attachmentURLs includeSysDiagnose includeInternalRelease additionalExtensionIdentifiers completionHandler];
        }
        goto LABEL_27;
      }
      [v18 appendString:@"Goldilocks - [TTR] <Insert Bug Title>"];
      [v20 appendString:@"---Shared Library Suggestion Tap-To-Radar---\n"];
      [v20 appendFormat:@"Shared Library Suggestion: %@", v4];
      v47 = @"com.apple.PhotoLibraryServices.PhotosDiagnostics";
      v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
      v38 = v22;
      v39 = v16;
      v23 = @"1092067";
      LOWORD(v37) = 1;
      v24 = @"Photos UI Goldilocks";
    }
    +[PXFeedbackTapToRadarUtilities fileRadarWithTitle:v18, v20, @"Other Bug", v23, v24, @"iOS", 0, v21, 0, v37, v38, v39, aBlock, v41, v42, v43 description classification componentID componentName componentVersion keyword screenshotURLs attachmentURLs includeSysDiagnose includeInternalRelease additionalExtensionIdentifiers completionHandler];
LABEL_27:

    goto LABEL_18;
  }
  id v5 = v4;
  if (!v5)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    v28 = (objc_class *)objc_opt_class();
    v29 = NSStringFromClass(v28);
    [v27 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionActionManager.m", 1577, @"%@ should be an instance inheriting from %@, but it is nil", @"assetCollection", v29 object file lineNumber description];
LABEL_33:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    v30 = (objc_class *)objc_opt_class();
    v29 = NSStringFromClass(v30);
    v31 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
    [v27 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionActionManager.m", 1577, @"%@ should be an instance inheriting from %@, but it is %@", @"assetCollection", v29, v31 object file lineNumber description];

    goto LABEL_33;
  }
LABEL_4:
  v6 = [[PXMemoryDiagnosticsViewController alloc] initWithMemory:v5];
  [(PXCuratedAssetCollectionDiagnosticsViewController *)v6 setShouldPresentTapToRadar:1];
  v7 = [(PXHighlightDiagnosticsViewController *)v6 radarAttachmentURLs];
  v8 = [(PXActionPerformer *)self hostViewController];
  if ([v5 creationType] == 1)
  {
    +[PXGenerativeStoryTTRWorkflowBuilder presentViewController:v8 memory:v5 attachmentFileUrls:v7];
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
  }
  if ([v5 creationType]) {
    goto LABEL_17;
  }
  v9 = self;
  id v10 = v8;
  uint64_t v11 = 4;
  v12 = v7;
LABEL_16:
  [(PXPhotoKitAssetCollectionFileRadarActionPerformer *)v9 _presentTTRWorkFlowInViewController:v10 context:v11 attachmentImageUrls:0 attachmentFileUrls:v12];
LABEL_17:

LABEL_18:
}

uint64_t __79__PXPhotoKitAssetCollectionFileRadarActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v2 removeItemAtURL:*(void *)(a1 + 32) error:0];
  }
  v3 = *(void **)(a1 + 40);
  return [v3 completeUserInteractionTaskWithSuccess:1 error:0];
}

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  return +[PXActivity activityWithActionTitle:a3 actionType:a4 activityType:@"PXActivityTypeFileRadar" systemImageName:a5];
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return @"ant";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  v6 = [a4 assetCollection];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 creationType] == 1)
  {
    v7 = @"File MC Radar";
  }
  else
  {
    v8 = @"File Radar";
    if (a3 == 2) {
      v8 = @"(Internal) File Radar";
    }
    v7 = v8;
  }

  return v7;
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  v4 = +[PXRootSettings sharedInstance];
  char v5 = [v4 canShowInternalUI];

  return v5;
}

@end