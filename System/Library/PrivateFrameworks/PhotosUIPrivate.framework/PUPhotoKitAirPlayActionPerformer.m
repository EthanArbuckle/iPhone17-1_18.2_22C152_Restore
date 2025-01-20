@interface PUPhotoKitAirPlayActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4;
- (void)_handleDismissedAirPlayPicker;
- (void)_showAirPlayPicker;
- (void)performUserInteractionTask;
@end

@implementation PUPhotoKitAirPlayActionPerformer

- (void)_handleDismissedAirPlayPicker
{
  [(PUAssetActionPerformer *)self dismissViewController:0 completionHandler:0];
  [(PUAssetActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
}

- (void)_showAirPlayPicker
{
  objc_initWeak(&location, self);
  v3 = [PUScreenRoutePickerViewController alloc];
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  v7 = __54__PUPhotoKitAirPlayActionPerformer__showAirPlayPicker__block_invoke;
  v8 = &unk_1E5F2E530;
  objc_copyWeak(&v9, &location);
  v4 = [(PUScreenRoutePickerViewController *)v3 initWithCompletionBlock:&v5];
  -[PUAssetActionPerformer presentViewController:](self, "presentViewController:", v4, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __54__PUPhotoKitAirPlayActionPerformer__showAirPlayPicker__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleDismissedAirPlayPicker];
}

- (void)performUserInteractionTask
{
  v4 = [(PUAssetActionPerformer *)self assets];
  uint64_t v5 = [v4 count];

  if (v5 != 1)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PUPhotoKitAssetActionManager.m" lineNumber:1925 description:@"There can be only one asset when starting an AirPlay action"];
  }
  [(PUPhotoKitAirPlayActionPerformer *)self _showAirPlayPicker];
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return 1;
}

@end