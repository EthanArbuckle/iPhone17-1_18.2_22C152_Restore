@interface PXCMMPhotoKitDeleteActionPerformer
- (id)localizedTitleForUseCase:(unint64_t)a3;
- (void)performUserInteractionTask;
@end

@implementation PXCMMPhotoKitDeleteActionPerformer

- (void)performUserInteractionTask
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v3 = [(PXCMMActionPerformer *)self session];
  v4 = [v3 momentShare];

  v5 = [(PXActionPerformer *)self presentationEnvironment];
  v8[0] = v4;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__PXCMMPhotoKitDeleteActionPerformer_performUserInteractionTask__block_invoke;
  v7[3] = &unk_1E5DD3158;
  v7[4] = self;
  PXTrashMomentShares(v6, v5, v7);
}

uint64_t __64__PXCMMPhotoKitDeleteActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:a2 error:a3];
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  return PXLocalizedStringFromTable(@"PXCMMStopSharingConfirmationButtonTitle", @"PhotosUICore");
}

@end