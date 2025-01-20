@interface PXCuratedLibraryCurationDebugActionPerformer
- (BOOL)canPerformWithActivityItems:(id)a3 forActivity:(id)a4;
- (PXCuratedLibraryCurationDebugActionPerformer)initWithViewModel:(id)a3 assetCollectionReference:(id)a4 diagnosticLayout:(id)a5;
- (PXGLayout)layoutForDiagnosticDescription;
- (id)activitySystemImageName;
- (id)activityType;
- (void)performUserInteractionTask;
@end

@implementation PXCuratedLibraryCurationDebugActionPerformer

- (void).cxx_destruct
{
}

- (PXGLayout)layoutForDiagnosticDescription
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutForDiagnosticDescription);
  return (PXGLayout *)WeakRetained;
}

- (void)performUserInteractionTask
{
  v3 = [(PXCuratedLibraryCurationDebugActionPerformer *)self layoutForDiagnosticDescription];
  if (v3)
  {
    v4 = [(PXCuratedLibraryAssetCollectionActionPerformer *)self assetCollectionReference];
    v5 = [v4 assetCollection];

    v6 = [[PXHighlightDiagnosticsViewController alloc] initWithHighlight:v5];
    v7 = [v3 diagnosticDescription];
    [(PXCuratedAssetCollectionDiagnosticsViewController *)v6 setHostLayoutDiagnosticDescription:v7];

    [(PXCuratedAssetCollectionDiagnosticsViewController *)v6 setShouldPresentTapToRadar:0];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __74__PXCuratedLibraryCurationDebugActionPerformer_performUserInteractionTask__block_invoke;
    v9[3] = &unk_1E5DD32A8;
    v9[4] = self;
    v10 = v6;
    v8 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v9);
  }
  else
  {
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:0];
  }
}

uint64_t __74__PXCuratedLibraryCurationDebugActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  return [v2 completeUserInteractionTaskWithSuccess:1 error:0];
}

- (BOOL)canPerformWithActivityItems:(id)a3 forActivity:(id)a4
{
  objc_msgSend(a4, "activityType", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [(PXCuratedLibraryCurationDebugActionPerformer *)self activityType];
  if (v6 == v7)
  {

    goto LABEL_5;
  }
  v8 = v7;
  char v9 = [v6 isEqualToString:v7];

  if ((v9 & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXCuratedLibraryAssetCollectionActionPerformer.m", 541, @"Invalid parameter not satisfying: %@", @"PXStringEqualToString(activity.activityType, self.activityType)" object file lineNumber description];
LABEL_5:
  }
  return 1;
}

- (id)activitySystemImageName
{
  return @"photo.on.rectangle";
}

- (id)activityType
{
  v2 = @"PXActivityTypeDebugCuration";
  return @"PXActivityTypeDebugCuration";
}

- (PXCuratedLibraryCurationDebugActionPerformer)initWithViewModel:(id)a3 assetCollectionReference:(id)a4 diagnosticLayout:(id)a5
{
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)PXCuratedLibraryCurationDebugActionPerformer;
  char v9 = [(PXCuratedLibraryAssetCollectionActionPerformer *)&v12 initWithActionType:@"PXCuratedLibraryActionCurationDebug" viewModel:a3 assetCollectionReference:a4];
  v10 = v9;
  if (v9) {
    objc_storeWeak((id *)&v9->_layoutForDiagnosticDescription, v8);
  }

  return v10;
}

@end