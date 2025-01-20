@interface PXHideAssetsAction
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4;
+ (BOOL)currentValueForAssets:(id)a3;
+ (BOOL)toggledValueForAssets:(id)a3;
- (BOOL)isHidden;
- (PXHideAssetsAction)initWithAssets:(id)a3;
- (PXHideAssetsAction)initWithAssets:(id)a3 hidden:(BOOL)a4;
- (id)actionIdentifier;
- (id)actionNameLocalizationKey;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
@end

@implementation PXHideAssetsAction

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)performUndo:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PXHideAssetsAction *)self isHidden];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__PXHideAssetsAction_performUndo___block_invoke;
  v6[3] = &__block_descriptor_33_e30_v16__0__PHAssetChangeRequest_8l;
  BOOL v7 = !v5;
  [(PXAssetsAction *)self performAssetChanges:v6 completionHandler:v4];
}

uint64_t __34__PXHideAssetsAction_performUndo___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHidden:*(unsigned __int8 *)(a1 + 32)];
}

- (void)performAction:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PXHideAssetsAction *)self isHidden];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__PXHideAssetsAction_performAction___block_invoke;
  v6[3] = &__block_descriptor_33_e30_v16__0__PHAssetChangeRequest_8l;
  BOOL v7 = v5;
  [(PXAssetsAction *)self performAssetChanges:v6 completionHandler:v4];
}

uint64_t __36__PXHideAssetsAction_performAction___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHidden:*(unsigned __int8 *)(a1 + 32)];
}

- (id)actionNameLocalizationKey
{
  if ([(PXHideAssetsAction *)self isHidden]) {
    v2 = @"PXHideActionName";
  }
  else {
    v2 = @"PXUnhideActionName";
  }
  return v2;
}

- (id)actionIdentifier
{
  return @"HideAssets";
}

- (PXHideAssetsAction)initWithAssets:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[PXHideAssetsAction initWithAssets:hidden:](self, "initWithAssets:hidden:", v4, [(id)objc_opt_class() toggledValueForAssets:v4]);

  return v5;
}

- (PXHideAssetsAction)initWithAssets:(id)a3 hidden:(BOOL)a4
{
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  BOOL v7 = __44__PXHideAssetsAction_initWithAssets_hidden___block_invoke;
  v8 = &unk_1E5DC2430;
  BOOL v10 = a4;
  v9 = self;
  PXFilter();
}

uint64_t __44__PXHideAssetsAction_initWithAssets_hidden___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned __int8 *)(a1 + 40) == [v3 isHidden]) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = [(id)objc_opt_class() canPerformOnAsset:v3 inAssetCollection:0];
  }

  return v4;
}

+ (BOOL)currentValueForAssets:(id)a3
{
  id v4 = a3;
  if ([v4 count]) {
    int v5 = [a1 toggledValueForAssets:v4] ^ 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

+ (BOOL)toggledValueForAssets:(id)a3
{
}

uint64_t __44__PXHideAssetsAction_toggledValueForAssets___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isHidden] ^ 1;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  id v4 = a3;
  if (([v4 isTrashed] & 1) != 0
    || ([v4 isRecoveredAsset] & 1) != 0
    || [v4 sourceType] == 2
    || [v4 sourceType] == 8)
  {
    goto LABEL_5;
  }
  if (!objc_msgSend(v4, "px_isSyndicatedAsset"))
  {
    LOBYTE(v5) = 1;
    goto LABEL_6;
  }
  if (!objc_msgSend(v4, "px_isUnsavedSyndicatedAsset")) {
LABEL_5:
  }
    LOBYTE(v5) = 0;
  else {
    int v5 = objc_msgSend(v4, "px_isSyndicationPhotoLibraryAsset") ^ 1;
  }
LABEL_6:

  return v5;
}

@end