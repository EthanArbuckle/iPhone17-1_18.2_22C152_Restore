@interface NTKGreenfieldCompanionShareController
+ (id)sharedController;
- (void)_handleError:(id)a3;
- (void)_prepareForShareSheet;
- (void)_presentInternalWarningIfNeededWithContinueBlock:(id)a3;
- (void)_presentShareSheetWithDraftRecipe:(id)a3 previewImage:(id)a4;
- (void)_showPhotosPickerView;
- (void)_startFaceSharing;
- (void)companionSharePhotosPickerViewController:(id)a3 didFinishWithFace:(id)a4;
- (void)shareWatchFace:(id)a3 fromViewController:(id)a4;
@end

@implementation NTKGreenfieldCompanionShareController

+ (id)sharedController
{
  if (sharedController_onceToken != -1) {
    dispatch_once(&sharedController_onceToken, &__block_literal_global_107);
  }
  v2 = (void *)sharedController_controller;
  return v2;
}

void __57__NTKGreenfieldCompanionShareController_sharedController__block_invoke()
{
  v0 = objc_alloc_init(NTKGreenfieldCompanionShareController);
  v1 = (void *)sharedController_controller;
  sharedController_controller = (uint64_t)v0;
}

- (void)shareWatchFace:(id)a3 fromViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_storeWeak((id *)&self->_face, v6);
  updatedFace = self->_updatedFace;
  self->_updatedFace = 0;

  objc_storeWeak((id *)&self->_originatedViewController, v7);
  objc_initWeak(&location, self);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __75__NTKGreenfieldCompanionShareController_shareWatchFace_fromViewController___block_invoke;
  v13 = &unk_1E62C0068;
  objc_copyWeak(&v14, &location);
  v9 = (void (**)(void))_Block_copy(&v10);
  if (+[NTKGreenfieldUtilities shouldPresentUnreleasedFeaturesInternalWarningForFace:](NTKGreenfieldUtilities, "shouldPresentUnreleasedFeaturesInternalWarningForFace:", v6, v10, v11, v12, v13))
  {
    [(NTKGreenfieldCompanionShareController *)self _presentInternalWarningIfNeededWithContinueBlock:v9];
  }
  else
  {
    v9[2](v9);
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __75__NTKGreenfieldCompanionShareController_shareWatchFace_fromViewController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _startFaceSharing];
}

- (void)_presentInternalWarningIfNeededWithContinueBlock:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Warning" message:@"This face is not released or contains complications that are not released. Please make sure it will not be shared with undisclosed individuals." preferredStyle:1];
  id v6 = (void *)MEMORY[0x1E4FB1410];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __90__NTKGreenfieldCompanionShareController__presentInternalWarningIfNeededWithContinueBlock___block_invoke;
  v11[3] = &unk_1E62C6000;
  id v12 = v4;
  id v7 = v4;
  v8 = [v6 actionWithTitle:@"I Agree" style:2 handler:v11];
  v9 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Cancel" style:1 handler:0];
  [v5 addAction:v8];
  [v5 addAction:v9];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originatedViewController);
  [WeakRetained presentViewController:v5 animated:1 completion:0];
}

uint64_t __90__NTKGreenfieldCompanionShareController__presentInternalWarningIfNeededWithContinueBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_startFaceSharing
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_face);
  uint64_t v4 = [WeakRetained faceStyle];

  if (v4 == 22)
  {
    [(NTKGreenfieldCompanionShareController *)self _showPhotosPickerView];
  }
  else
  {
    [(NTKGreenfieldCompanionShareController *)self _prepareForShareSheet];
  }
}

- (void)_showPhotosPickerView
{
  p_face = &self->_face;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_face);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v9 = objc_loadWeakRetained((id *)p_face);
    id v6 = [[NTKGreenfieldCompanionSharePhotosPickerViewController alloc] initWithPhotosFace:v9];
    [(NTKGreenfieldCompanionSharePhotosPickerViewController *)v6 setDelegate:self];
    id v7 = [[NTKCNavigationController alloc] initWithRootViewController:v6];
    [(NTKCNavigationController *)v7 setModalInPresentation:1];
    id v8 = objc_loadWeakRetained((id *)&self->_originatedViewController);
    [v8 presentViewController:v7 animated:1 completion:0];
  }
}

- (void)_prepareForShareSheet
{
  updatedFace = self->_updatedFace;
  if (updatedFace) {
    id WeakRetained = updatedFace;
  }
  else {
    id WeakRetained = (NTKFace *)objc_loadWeakRetained((id *)&self->_face);
  }
  v5 = WeakRetained;
  id v6 = [[NTKGreenfieldDraftRecipe alloc] initWithFace:WeakRetained];
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__NTKGreenfieldCompanionShareController__prepareForShareSheet__block_invoke;
  v8[3] = &unk_1E62C6028;
  objc_copyWeak(&v10, &location);
  id v7 = v6;
  id v9 = v7;
  +[NTKGreenfieldUtilities generateFacePreviewImageFromDraftRecipe:v7 completionBlock:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __62__NTKGreenfieldCompanionShareController__prepareForShareSheet__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      [WeakRetained _presentShareSheetWithDraftRecipe:*(void *)(a1 + 32) previewImage:v6];
    }
    else
    {
      v5 = objc_msgSend(MEMORY[0x1E4F28C58], "greenfield_encodeWatchFaceErrorWithCode:message:", 2, @"Preview Image is nil");
      [v4 _handleError:v5];
    }
  }
}

- (void)_presentShareSheetWithDraftRecipe:(id)a3 previewImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[NTKGreenfieldCompanionActivityViewController alloc] initWithDraftRecipe:v6 previewImage:v7];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__NTKGreenfieldCompanionShareController__presentShareSheetWithDraftRecipe_previewImage___block_invoke;
  aBlock[3] = &unk_1E62C6050;
  objc_copyWeak(&v14, &location);
  id v9 = v6;
  id v13 = v9;
  id v10 = _Block_copy(aBlock);
  [(NTKGreenfieldCompanionActivityViewController *)v8 setCompletionWithItemsHandler:v10];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originatedViewController);
  [WeakRetained presentViewController:v8 animated:1 completion:0];

  objc_storeWeak((id *)&self->_activityViewController, v8);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __88__NTKGreenfieldCompanionShareController__presentShareSheetWithDraftRecipe_previewImage___block_invoke(uint64_t a1, void *a2, int a3, void *a4, void *a5)
{
  id v12 = a2;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _handleError:v10];
  }
  else if (a3)
  {
    NTKSubmitAnalyticsForSharedFace(v12, *(void **)(a1 + 32));
  }
}

- (void)_handleError:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__NTKGreenfieldCompanionShareController__handleError___block_invoke;
  aBlock[3] = &unk_1E62C09C0;
  id v12 = v4;
  id v13 = self;
  id v5 = v4;
  id v6 = _Block_copy(aBlock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originatedViewController);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__NTKGreenfieldCompanionShareController__handleError___block_invoke_2;
  v9[3] = &unk_1E62C0718;
  id v10 = v6;
  id v8 = v6;
  [WeakRetained dismissViewControllerAnimated:1 completion:v9];
}

void __54__NTKGreenfieldCompanionShareController__handleError___block_invoke(uint64_t a1)
{
  NTKClockFaceLocalizedString(@"GREENFIELD_GENERATE_RECIPE_ERROR_ALERT_TITLE", @"Unable to Share at This Time");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  v2 = NTKClockFaceLocalizedString(@"GREENFIELD_GENERATE_RECIPE_ERROR_ALERT_DESCRIPTION", @"Try again later.");
  v3 = NTKClockFaceLocalizedString(@"GREENFIELD_GENERATE_RECIPE_ERROR_ALERT_OK_BUTON_TITLE", @"OK");
  if (NTKInternalBuild(v3, v4))
  {
    id v5 = [NSString stringWithFormat:@"\n\n[Internal Only]\nPlease file a radar and include a sysdiagnose. Error: reason: %@", *(void *)(a1 + 32)];
    uint64_t v6 = [NSString stringWithFormat:@"%@ %@", v2, v5];

    v2 = (void *)v6;
  }
  id v7 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v10 message:v2 preferredStyle:1];
  id v8 = [MEMORY[0x1E4FB1410] actionWithTitle:v3 style:1 handler:0];
  [v7 addAction:v8];

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 24));
  [WeakRetained presentViewController:v7 animated:1 completion:0];
}

uint64_t __54__NTKGreenfieldCompanionShareController__handleError___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)companionSharePhotosPickerViewController:(id)a3 didFinishWithFace:(id)a4
{
  id v7 = a4;
  if (v7)
  {
    objc_storeStrong((id *)&self->_updatedFace, a4);
    [(NTKGreenfieldCompanionShareController *)self _prepareForShareSheet];
  }
  else
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28C58], "greenfield_encodeWatchFaceErrorWithCode:message:", 3, @"Failed to generate the new photos face.");
    [(NTKGreenfieldCompanionShareController *)self _handleError:v6];
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_activityViewController);
  objc_destroyWeak((id *)&self->_originatedViewController);
  objc_storeStrong((id *)&self->_updatedFace, 0);
  objc_destroyWeak((id *)&self->_face);
}

@end