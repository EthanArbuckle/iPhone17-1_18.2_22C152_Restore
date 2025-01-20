@interface PUParallaxLayerStackDebugViewController
- (CGRect)initialVisibleRect;
- (PHAsset)asset;
- (PUParallaxLayerStackDebugViewController)init;
- (PUParallaxLayerStackView)layerStackView;
- (PUParallaxLayerStackViewModel)viewModel;
- (PUParallaxLayerStackViewModelUpdater)viewModelUpdater;
- (PUProgressIndicatorView)downloadProgressIndicator;
- (PUProgressIndicatorView)progressIndicator;
- (PUWallpaperPosterDateView)dateTimeView;
- (UIButton)colorPaletteButton;
- (UIButton)layerListButton;
- (UIButton)looksButton;
- (UIButton)parallaxEnabledButton;
- (UIButton)radarButton;
- (UIButton)shareButton;
- (UIStackView)buttonStackView;
- (id)_newButtonWithSystemImageName:(id)a3;
- (unint64_t)signpost;
- (void)_dismissSheetController:(id)a3;
- (void)_presentSheetController:(id)a3;
- (void)_updateDateTimeView;
- (void)hideDowloadProgressIndicator;
- (void)hideProgressIndicator;
- (void)loadLayerStack:(id)a3;
- (void)loadLayerStack:(id)a3 segmentationItem:(id)a4;
- (void)loadPHAsset:(id)a3;
- (void)loadPartialSegmentationItem:(id)a3 loadingState:(unint64_t)a4;
- (void)loadSegmentationItem:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)panGesture:(id)a3;
- (void)pinchGesture:(id)a3;
- (void)renderAfterStyleChange;
- (void)renderAfterVisibleFrameChange;
- (void)setAsset:(id)a3;
- (void)setButtonStackView:(id)a3;
- (void)setColorPaletteButton:(id)a3;
- (void)setDateTimeView:(id)a3;
- (void)setDownloadProgressIndicator:(id)a3;
- (void)setInitialVisibleRect:(CGRect)a3;
- (void)setLayerListButton:(id)a3;
- (void)setLayerStackView:(id)a3;
- (void)setLooksButton:(id)a3;
- (void)setParallaxEnabledButton:(id)a3;
- (void)setProgressIndicator:(id)a3;
- (void)setRadarButton:(id)a3;
- (void)setShareButton:(id)a3;
- (void)setViewModel:(id)a3;
- (void)setViewModelUpdater:(id)a3;
- (void)shareLayerStack:(id)a3;
- (void)showColorPalettes:(id)a3;
- (void)showDownloadProgressIndicator;
- (void)showLayerList:(id)a3;
- (void)showLooks:(id)a3;
- (void)showProgressIndicator:(id)a3;
- (void)tapToRadar:(id)a3;
- (void)toggleParallaxEnabled:(id)a3;
- (void)updateDownloadProgressIndicator:(double)a3;
- (void)updateProgressIndicator:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PUParallaxLayerStackDebugViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadProgressIndicator, 0);
  objc_storeStrong((id *)&self->_progressIndicator, 0);
  objc_storeStrong((id *)&self->_radarButton, 0);
  objc_storeStrong((id *)&self->_shareButton, 0);
  objc_storeStrong((id *)&self->_colorPaletteButton, 0);
  objc_storeStrong((id *)&self->_layerListButton, 0);
  objc_storeStrong((id *)&self->_looksButton, 0);
  objc_storeStrong((id *)&self->_parallaxEnabledButton, 0);
  objc_storeStrong((id *)&self->_buttonStackView, 0);
  objc_storeStrong((id *)&self->_dateTimeView, 0);
  objc_storeStrong((id *)&self->_layerStackView, 0);
  objc_storeStrong((id *)&self->_viewModelUpdater, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (void)setInitialVisibleRect:(CGRect)a3
{
  self->_initialVisibleRect = a3;
}

- (CGRect)initialVisibleRect
{
  double x = self->_initialVisibleRect.origin.x;
  double y = self->_initialVisibleRect.origin.y;
  double width = self->_initialVisibleRect.size.width;
  double height = self->_initialVisibleRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setDownloadProgressIndicator:(id)a3
{
}

- (PUProgressIndicatorView)downloadProgressIndicator
{
  return self->_downloadProgressIndicator;
}

- (void)setProgressIndicator:(id)a3
{
}

- (PUProgressIndicatorView)progressIndicator
{
  return self->_progressIndicator;
}

- (void)setRadarButton:(id)a3
{
}

- (UIButton)radarButton
{
  return self->_radarButton;
}

- (void)setShareButton:(id)a3
{
}

- (UIButton)shareButton
{
  return self->_shareButton;
}

- (void)setColorPaletteButton:(id)a3
{
}

- (UIButton)colorPaletteButton
{
  return self->_colorPaletteButton;
}

- (void)setLayerListButton:(id)a3
{
}

- (UIButton)layerListButton
{
  return self->_layerListButton;
}

- (void)setLooksButton:(id)a3
{
}

- (UIButton)looksButton
{
  return self->_looksButton;
}

- (void)setParallaxEnabledButton:(id)a3
{
}

- (UIButton)parallaxEnabledButton
{
  return self->_parallaxEnabledButton;
}

- (void)setButtonStackView:(id)a3
{
}

- (UIStackView)buttonStackView
{
  return self->_buttonStackView;
}

- (void)setDateTimeView:(id)a3
{
}

- (PUWallpaperPosterDateView)dateTimeView
{
  return self->_dateTimeView;
}

- (void)setLayerStackView:(id)a3
{
}

- (PUParallaxLayerStackView)layerStackView
{
  return self->_layerStackView;
}

- (void)setViewModelUpdater:(id)a3
{
}

- (PUParallaxLayerStackViewModelUpdater)viewModelUpdater
{
  return self->_viewModelUpdater;
}

- (void)setAsset:(id)a3
{
}

- (PHAsset)asset
{
  return self->_asset;
}

- (unint64_t)signpost
{
  return self->_signpost;
}

- (PUParallaxLayerStackViewModel)viewModel
{
  return self->_viewModel;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6 = a4;
  id v9 = a3;
  if (a5 != "LayerStackViewModelObservationContext") {
    goto LABEL_9;
  }
  id v19 = v9;
  id v10 = v9;
  if (!v10)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    [v14 handleFailureInMethod:a2, self, @"PUParallaxLayerStackDebugViewController.m", 539, @"%@ should be an instance inheriting from %@, but it is nil", @"observable", v16 object file lineNumber description];
LABEL_14:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v17);
    v18 = objc_msgSend(v10, "px_descriptionForAssertionMessage");
    [v14 handleFailureInMethod:a2, self, @"PUParallaxLayerStackDebugViewController.m", 539, @"%@ should be an instance inheriting from %@, but it is %@", @"observable", v16, v18 object file lineNumber description];

    goto LABEL_14;
  }
LABEL_4:
  char v11 = [v10 currentLayerStackPropertiesChange];
  char v12 = [v10 stylePropertiesChange];
  if (v11 & 0x10 | (unint64_t)(v6 & 0x200))
  {
    v13 = [(PUParallaxLayerStackDebugViewController *)self view];
    [v13 setNeedsLayout];
  }
  if ((v12 & 0x11) != 0) {
    [(PUParallaxLayerStackDebugViewController *)self _updateDateTimeView];
  }

  id v9 = v19;
LABEL_9:
}

- (void)pinchGesture:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 state];
  if (v5 == 2)
  {
    [v4 scale];
    [(PUParallaxLayerStackViewModel *)self->_viewModel visibleFrame];
    [(PUParallaxLayerStackViewModel *)self->_viewModel extendedImageRect];
    [(PUParallaxLayerStackDebugViewController *)self initialVisibleRect];
    [(PUParallaxLayerStackDebugViewController *)self initialVisibleRect];
    [(PUParallaxLayerStackDebugViewController *)self initialVisibleRect];
    [(PUParallaxLayerStackDebugViewController *)self initialVisibleRect];
    [(PUParallaxLayerStackDebugViewController *)self initialVisibleRect];
    [(PUParallaxLayerStackDebugViewController *)self initialVisibleRect];
    PXRectShiftedInsideConstrainingRect();
    viewModel = self->_viewModel;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __56__PUParallaxLayerStackDebugViewController_pinchGesture___block_invoke;
    v12[3] = &__block_descriptor_64_e48_v16__0___PUParallaxLayerStackMutableViewModel__8l;
    v12[4] = v7;
    v12[5] = v8;
    v12[6] = v9;
    v12[7] = v10;
    [(PUParallaxLayerStackViewModel *)viewModel performChanges:v12];
    char v11 = [(PUParallaxLayerStackDebugViewController *)self layerStackView];
    [v11 layoutIfNeeded];

    [(PUParallaxLayerStackDebugViewController *)self renderAfterVisibleFrameChange];
  }
  else if (v5 == 1)
  {
    [(PUParallaxLayerStackViewModel *)self->_viewModel visibleFrame];
    -[PUParallaxLayerStackDebugViewController setInitialVisibleRect:](self, "setInitialVisibleRect:");
  }
}

uint64_t __56__PUParallaxLayerStackDebugViewController_pinchGesture___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setVisibleFrame:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)panGesture:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 state];
  if (v5 == 2)
  {
    __int16 v6 = [(PUParallaxLayerStackDebugViewController *)self layerStackView];
    [v4 translationInView:v6];

    [(PUParallaxLayerStackViewModel *)self->_viewModel visibleFrame];
    [(PUParallaxLayerStackViewModel *)self->_viewModel extendedImageRect];
    uint64_t v7 = [(PUParallaxLayerStackDebugViewController *)self view];
    [v7 bounds];

    [(PUParallaxLayerStackDebugViewController *)self initialVisibleRect];
    [(PUParallaxLayerStackDebugViewController *)self initialVisibleRect];
    PXRectShiftedInsideConstrainingRect();
    viewModel = self->_viewModel;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __54__PUParallaxLayerStackDebugViewController_panGesture___block_invoke;
    v14[3] = &__block_descriptor_64_e48_v16__0___PUParallaxLayerStackMutableViewModel__8l;
    v14[4] = v9;
    v14[5] = v10;
    v14[6] = v11;
    v14[7] = v12;
    [(PUParallaxLayerStackViewModel *)viewModel performChanges:v14];
    v13 = [(PUParallaxLayerStackDebugViewController *)self layerStackView];
    [v13 layoutIfNeeded];

    [(PUParallaxLayerStackDebugViewController *)self renderAfterVisibleFrameChange];
  }
  else if (v5 == 1)
  {
    [(PUParallaxLayerStackViewModel *)self->_viewModel visibleFrame];
    -[PUParallaxLayerStackDebugViewController setInitialVisibleRect:](self, "setInitialVisibleRect:");
  }
}

uint64_t __54__PUParallaxLayerStackDebugViewController_panGesture___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setVisibleFrame:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)renderAfterStyleChange
{
  id v4 = [(PUParallaxLayerStackDebugViewController *)self viewModelUpdater];
  v3 = [(PUParallaxLayerStackDebugViewController *)self viewModel];
  [v4 renderOnscreenModelAfterStyleChange:v3];
}

- (void)renderAfterVisibleFrameChange
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v3 = [(PUParallaxLayerStackDebugViewController *)self viewModelUpdater];
  id v4 = [(PUParallaxLayerStackDebugViewController *)self viewModel];
  uint64_t v5 = [(PUParallaxLayerStackDebugViewController *)self viewModel];
  v7[0] = v5;
  __int16 v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [v3 renderOnscreenModelAfterVisibleFrameChange:v4 allViewModels:v6];
}

- (void)tapToRadar:(id)a3
{
  id v4 = [(PUParallaxLayerStackDebugViewController *)self asset];

  if (v4)
  {
    [(PUParallaxLayerStackDebugViewController *)self showProgressIndicator:@"Preparing Attachments…"];
    uint64_t v5 = [(PUParallaxLayerStackViewModel *)self->_viewModel compoundLayerStack];
    __int16 v6 = [(PUParallaxLayerStackDebugViewController *)self asset];
    uint64_t v7 = [(PUParallaxLayerStackViewModel *)self->_viewModel segmentationItem];
    uint64_t v8 = +[PUWallpaperRadarAttachmentProvider radarConfigurationForAsset:v6 suggestion:0 compoundLayerStack:v5 segmentationItem:v7 posterDescriptor:0 posterConfiguration:0 component:10 completionHandler:0];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54__PUParallaxLayerStackDebugViewController_tapToRadar___block_invoke;
    v9[3] = &unk_1E5F2E3B8;
    v9[4] = self;
    [v8 setCompletionHandler:v9];
    PXFileRadarWithConfiguration();
  }
}

uint64_t __54__PUParallaxLayerStackDebugViewController_tapToRadar___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) hideProgressIndicator];
}

- (void)shareLayerStack:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__PUParallaxLayerStackDebugViewController_shareLayerStack___block_invoke;
  v5[3] = &unk_1E5F2BF98;
  v5[4] = self;
  id v4 = [MEMORY[0x1E4F90698] confidentialityAlertWithConfirmAction:v5 abortAction:0];
  [(PUParallaxLayerStackDebugViewController *)self presentViewController:v4 animated:1 completion:0];
}

void __59__PUParallaxLayerStackDebugViewController_shareLayerStack___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) showProgressIndicator:@"Preparing…"];
  v2 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__PUParallaxLayerStackDebugViewController_shareLayerStack___block_invoke_2;
  block[3] = &unk_1E5F2ED10;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

void __59__PUParallaxLayerStackDebugViewController_shareLayerStack___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  v3 = NSTemporaryDirectory();
  id v4 = NSString;
  uint64_t v5 = [MEMORY[0x1E4F29128] UUID];
  __int16 v6 = [v4 stringWithFormat:@"share-%@.imagestack", v5];
  uint64_t v7 = [v3 stringByAppendingPathComponent:v6];
  uint64_t v8 = [v2 fileURLWithPath:v7];

  uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 976) currentLayerStack];
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F8CE50]) initWithPortraitLayerStack:v9 landscapeLayerStack:0];
  id v14 = 0;
  LODWORD(v7) = [MEMORY[0x1E4F8CCA0] saveCompoundLayerStack:v10 toURL:v8 options:0xFFFFLL error:&v14];
  id v11 = v14;
  if (v7)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__PUParallaxLayerStackDebugViewController_shareLayerStack___block_invoke_3;
    block[3] = &unk_1E5F2ECC8;
    block[4] = *(void *)(a1 + 32);
    id v13 = v8;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __59__PUParallaxLayerStackDebugViewController_shareLayerStack___block_invoke_3(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) hideProgressIndicator];
  id v2 = objc_alloc(MEMORY[0x1E4F28D78]);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [(id)*MEMORY[0x1E4F444F8] identifier];
  uint64_t v5 = (void *)[v2 initWithItem:v3 typeIdentifier:v4];

  id v6 = objc_alloc(MEMORY[0x1E4F9F2E8]);
  v11[0] = v5;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  uint64_t v8 = (void *)[v6 initWithActivityItems:v7 applicationActivities:0];

  uint64_t v10 = *MEMORY[0x1E4F9F348];
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  [v8 setIncludedActivityTypes:v9];

  [*(id *)(a1 + 32) presentViewController:v8 animated:1 completion:0];
}

- (void)showColorPalettes:(id)a3
{
  id v4 = objc_alloc_init(PUParallaxLayerStackDebugPaletteViewController);
  [(PUParallaxLayerStackDebugPaletteViewController *)v4 setTitle:@"Color Palettes"];
  [(PUParallaxLayerStackDebugViewController *)self _presentSheetController:v4];
}

- (void)showLayerList:(id)a3
{
  uint64_t v5 = [[PUParallaxLayerStackDebugTableViewController alloc] initWithStyle:0];
  id v4 = [(PUParallaxLayerStackDebugViewController *)self layerStackView];
  [(PUParallaxLayerStackDebugTableViewController *)v5 setLayerStackView:v4];

  [(PUParallaxLayerStackDebugTableViewController *)v5 setTitle:@"Layers"];
  [(PUParallaxLayerStackDebugViewController *)self _presentSheetController:v5];
}

- (void)showLooks:(id)a3
{
  id v6 = [[PUParallaxLayerStackDebugStyleTableViewController alloc] initWithStyle:0];
  id v4 = [(PUParallaxLayerStackDebugViewController *)self viewModel];
  [(PUParallaxLayerStackDebugStyleTableViewController *)v6 setViewModel:v4];

  uint64_t v5 = [(PUParallaxLayerStackDebugViewController *)self viewModelUpdater];
  [(PUParallaxLayerStackDebugStyleTableViewController *)v6 setViewModelUpdater:v5];

  [(PUParallaxLayerStackDebugStyleTableViewController *)v6 setTitle:@"Looks"];
  [(PUParallaxLayerStackDebugViewController *)self _presentSheetController:v6];
}

- (void)_dismissSheetController:(id)a3
{
}

- (void)_presentSheetController:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  id v7 = v4;
  uint64_t v8 = v7;
  if (v6)
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v7];
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel__dismissSheetController_];
    v18[0] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    id v11 = [v7 navigationItem];
    [v11 setRightBarButtonItems:v10];
  }
  [v8 setModalPresentationStyle:1];
  uint64_t v12 = [MEMORY[0x1E4FB1C30] mediumDetent];
  id v13 = objc_msgSend(MEMORY[0x1E4FB1C30], "largeDetent", v12);
  v17[1] = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  v15 = [v8 sheetPresentationController];
  [v15 setDetents:v14];

  v16 = [v8 sheetPresentationController];
  [v16 setPrefersGrabberVisible:v6 == 0];

  [(PUParallaxLayerStackDebugViewController *)self presentViewController:v8 animated:1 completion:0];
}

- (void)toggleParallaxEnabled:(id)a3
{
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__PUParallaxLayerStackDebugViewController_toggleParallaxEnabled___block_invoke;
  v12[3] = &unk_1E5F2ED10;
  v12[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v12 animations:0.2];
  id v4 = [(PUParallaxLayerStackDebugViewController *)self parallaxEnabledButton];
  uint64_t v5 = [v4 configuration];
  uint64_t v6 = (void *)[v5 copy];

  id v7 = (void *)MEMORY[0x1E4FB1818];
  uint64_t v8 = [(PUParallaxLayerStackViewModel *)self->_viewModel currentLayerStack];
  if ([v8 parallaxDisabled]) {
    uint64_t v9 = @"square.stack.3d.up.slash";
  }
  else {
    uint64_t v9 = @"square.stack.3d.up";
  }
  uint64_t v10 = [v7 systemImageNamed:v9];
  [v6 setImage:v10];

  id v11 = [(PUParallaxLayerStackDebugViewController *)self parallaxEnabledButton];
  [v11 setConfiguration:v6];
}

uint64_t __65__PUParallaxLayerStackDebugViewController_toggleParallaxEnabled___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 976);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__PUParallaxLayerStackDebugViewController_toggleParallaxEnabled___block_invoke_2;
  v4[3] = &unk_1E5F2E420;
  v4[4] = v1;
  return [v2 performChanges:v4];
}

void __65__PUParallaxLayerStackDebugViewController_toggleParallaxEnabled___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 976);
  id v3 = a2;
  id v4 = [v2 currentLayerStack];
  objc_msgSend(v3, "setParallaxDisabled:", objc_msgSend(v4, "parallaxDisabled") ^ 1);
}

- (void)setViewModel:(id)a3
{
  uint64_t v8 = (PUParallaxLayerStackViewModel *)a3;
  uint64_t v5 = self->_viewModel;
  if (v5 == v8)
  {
  }
  else
  {
    char v6 = [(PUParallaxLayerStackViewModel *)v5 isEqual:v8];

    if ((v6 & 1) == 0)
    {
      [(PUParallaxLayerStackViewModel *)self->_viewModel unregisterChangeObserver:self context:"LayerStackViewModelObservationContext"];
      objc_storeStrong((id *)&self->_viewModel, a3);
      [(PUParallaxLayerStackViewModel *)v8 registerChangeObserver:self context:"LayerStackViewModelObservationContext"];
      id v7 = [(PUParallaxLayerStackDebugViewController *)self layerStackView];
      [v7 setViewModel:v8];

      [(PUParallaxLayerStackDebugViewController *)self _updateDateTimeView];
    }
  }
}

- (void)loadLayerStack:(id)a3 segmentationItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[PUParallaxLayerStackViewModel alloc] initWithSegmentationItem:v6 initialStyle:0 compoundLayerStack:v7 deviceOrientation:1];

  [(PUParallaxLayerStackDebugViewController *)self setViewModel:v8];
  uint64_t v9 = [[PUParallaxLayerStackViewModelUpdater alloc] initWithSegmentationItem:v6];

  [(PUParallaxLayerStackDebugViewController *)self setViewModelUpdater:v9];
}

- (void)loadLayerStack:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[PUParallaxLayerStackViewModel alloc] initWithCompoundLayerStack:v4 style:0 deviceOrientation:1];

  [(PUParallaxLayerStackDebugViewController *)self setViewModel:v5];
}

- (void)loadSegmentationItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F8A318]) initWithSegmentationItem:v4];
  [v5 setResponseQueue:MEMORY[0x1E4F14428]];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F7A5E8]) initWithLevel:0];
  [v5 setPriority:v6];

  [v5 setLayerStackOptions:0xFFFFLL];
  if ([v4 isSettlingEffectAvailable]) {
    [v5 setSettlingEffectEnabled:1];
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__PUParallaxLayerStackDebugViewController_loadSegmentationItem___block_invoke;
  v8[3] = &unk_1E5F25878;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v5 submit:v8];
}

void __64__PUParallaxLayerStackDebugViewController_loadSegmentationItem___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v26 = 0;
  id v3 = [a2 result:&v26];
  id v4 = v26;
  uint64_t v5 = PLWallpaperGetLog();
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [v3 statistics];
      *(_DWORD *)buf = 138543362;
      id v28 = v7;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_DEFAULT, "Render layer stack stats: %{public}@", buf, 0xCu);
    }
    uint64_t v8 = [v3 compoundLayerStack];
    id v9 = +[PUSuggestionsSettings sharedInstance];
    int v10 = [v9 debugRoundTripLayerStack];

    if (v10)
    {
      id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v12 = [v11 temporaryDirectory];
      id v13 = [v12 URLByAppendingPathComponent:@"debugRoundTrip.layerStack"];

      id v14 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v14 removeItemAtURL:v13 error:0];

      v15 = (void *)MEMORY[0x1E4F8CCA0];
      v16 = [v3 compoundLayerStack];
      id v25 = 0;
      int v17 = [v15 saveCompoundLayerStack:v16 toURL:v13 options:0xFFFFLL error:&v25];
      id v18 = v25;

      if (v17)
      {
        id v24 = v18;
        uint64_t v19 = [MEMORY[0x1E4F8CCA0] loadCompoundLayerStackFromURL:v13 options:0xFFFFLL error:&v24];
        id v20 = v24;

        if (v19)
        {
          uint64_t v8 = (void *)v19;
        }
        else
        {
          v22 = PLWallpaperGetLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v28 = v20;
            _os_log_impl(&dword_1AE9F8000, v22, OS_LOG_TYPE_ERROR, "Failed to load layer stack: %{public}@", buf, 0xCu);
          }

          uint64_t v8 = [v3 compoundLayerStack];
        }
      }
      else
      {
        v21 = PLWallpaperGetLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v28 = v18;
          _os_log_impl(&dword_1AE9F8000, v21, OS_LOG_TYPE_ERROR, "Failed to write layer stack: %{public}@", buf, 0xCu);
        }

        id v20 = v18;
      }
    }
    [*(id *)(a1 + 32) loadLayerStack:v8 segmentationItem:*(void *)(a1 + 40)];
    v23 = [*(id *)(a1 + 32) layerStackView];
    [v23 setHidden:0];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v28 = v4;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "Render layer stack failed: %{public}@", buf, 0xCu);
    }

    uint64_t v8 = [*(id *)(a1 + 32) layerStackView];
    [v8 setHidden:1];
  }

  [*(id *)(a1 + 32) hideProgressIndicator];
}

- (void)loadPartialSegmentationItem:(id)a3 loadingState:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = PLWallpaperGetLog();
  uint64_t v8 = v7;
  os_signpost_id_t signpost = self->_signpost;
  if (signpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v16 = a4;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v8, OS_SIGNPOST_EVENT, signpost, "PUParallaxLayerStackDebugViewController.LoadingState", "state=%lx", buf, 0xCu);
  }

  int v10 = (void *)[objc_alloc(MEMORY[0x1E4F8A320]) initWithSegmentationItem:v6];
  [v10 setResponseQueue:MEMORY[0x1E4F14428]];
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F7A5E8]) initWithLevel:0];
  [v10 setPriority:v11];

  [v10 setLayerStackMode:2];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __84__PUParallaxLayerStackDebugViewController_loadPartialSegmentationItem_loadingState___block_invoke;
  v14[3] = &unk_1E5F2E470;
  v14[4] = self;
  [v10 submit:v14];
  if ((a4 & 4) != 0)
  {
    id v13 = @"Finishing…";
  }
  else if ((a4 & 2) != 0)
  {
    id v13 = @"Analyzing…";
  }
  else if (a4)
  {
    id v13 = @"Segmenting…";
  }
  else
  {
    uint64_t v12 = PLWallpaperGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v16 = a4;
      _os_log_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_ERROR, "Unexpected segmentation loading state; %lx", buf, 0xCu);
    }

    id v13 = 0;
  }
  [(PUParallaxLayerStackDebugViewController *)self updateProgressIndicator:v13];
}

void __84__PUParallaxLayerStackDebugViewController_loadPartialSegmentationItem_loadingState___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v11 = 0;
  id v3 = [a2 result:&v11];
  id v4 = v11;
  if (v3)
  {
    uint64_t v5 = PLWallpaperGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v3 statistics];
      *(_DWORD *)buf = 138543362;
      id v13 = v6;
      _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEFAULT, "Render layer stack stats: %{public}@", buf, 0xCu);
    }
    id v7 = objc_alloc(MEMORY[0x1E4F8CE50]);
    uint64_t v8 = [v3 layerStack];
    id v9 = (void *)[v7 initWithPortraitLayerStack:v8 landscapeLayerStack:0];

    [*(id *)(a1 + 32) loadLayerStack:v9];
    int v10 = [*(id *)(a1 + 32) layerStackView];
    [v10 setHidden:0];
  }
}

- (void)loadPHAsset:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [(PUParallaxLayerStackDebugViewController *)self setAsset:v4];
    uint64_t v5 = [(PUParallaxLayerStackDebugViewController *)self layerStackView];
    [v5 setHidden:1];

    [(PUParallaxLayerStackDebugViewController *)self showProgressIndicator:@"Loading…"];
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F39358]) initWithPhotoAsset:v4];

    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F8A390]) initWithParallaxAsset:v6];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __55__PUParallaxLayerStackDebugViewController_loadPHAsset___block_invoke;
    v10[3] = &unk_1E5F2D8C0;
    v10[4] = self;
    [v7 setDownloadProgressHandler:v10];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __55__PUParallaxLayerStackDebugViewController_loadPHAsset___block_invoke_2;
    v9[3] = &unk_1E5F25828;
    v9[4] = self;
    [v7 setLoadingHandler:v9];
    [v7 setLoadingHandlerQueue:MEMORY[0x1E4F14428]];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __55__PUParallaxLayerStackDebugViewController_loadPHAsset___block_invoke_275;
    v8[3] = &unk_1E5F25850;
    v8[4] = self;
    [v7 loadSegmentationItemWithCompletion:v8];
  }
}

uint64_t __55__PUParallaxLayerStackDebugViewController_loadPHAsset___block_invoke(double a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = PLWallpaperGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v5 = a1;
    _os_log_impl(&dword_1AE9F8000, v2, OS_LOG_TYPE_DEFAULT, "Download progress: %g", buf, 0xCu);
  }

  return px_dispatch_on_main_queue();
}

void __55__PUParallaxLayerStackDebugViewController_loadPHAsset___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = PLWallpaperGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    uint64_t v8 = a3;
    _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_DEFAULT, "Segmentation loading state: %lx", (uint8_t *)&v7, 0xCu);
  }

  [*(id *)(a1 + 32) loadPartialSegmentationItem:v5 loadingState:a3];
}

void __55__PUParallaxLayerStackDebugViewController_loadPHAsset___block_invoke_275(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) loadSegmentationItem:a2];
  }
  else
  {
    uint64_t v6 = PLWallpaperGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138543362;
      id v8 = v5;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "Failed to load segmentation item, error: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
}

uint64_t __55__PUParallaxLayerStackDebugViewController_loadPHAsset___block_invoke_272(uint64_t a1)
{
  [*(id *)(a1 + 32) showDownloadProgressIndicator];
  uint64_t result = [*(id *)(a1 + 32) updateDownloadProgressIndicator:*(double *)(a1 + 40)];
  if (*(double *)(a1 + 40) == 1.0)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 hideDowloadProgressIndicator];
  }
  return result;
}

- (void)hideDowloadProgressIndicator
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(PUParallaxLayerStackDebugViewController *)self downloadProgressIndicator];
  int v4 = [v3 isShowingProgress];

  if (v4)
  {
    id v5 = [(PUParallaxLayerStackDebugViewController *)self downloadProgressIndicator];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __71__PUParallaxLayerStackDebugViewController_hideDowloadProgressIndicator__block_invoke;
    v16[3] = &unk_1E5F2ED10;
    v16[4] = self;
    [v5 endShowingProgressImmediately:1 animated:1 withCompletionHandler:v16];

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = [(PUParallaxLayerStackDebugViewController *)self buttonStackView];
    int v7 = [v6 arrangedSubviews];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * v11++) setEnabled:1];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v9);
    }
  }
}

uint64_t __71__PUParallaxLayerStackDebugViewController_hideDowloadProgressIndicator__block_invoke(uint64_t a1)
{
  id v2 = PLWallpaperGetLog();
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(*(void *)(a1 + 32) + 984);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)int v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v3, OS_SIGNPOST_INTERVAL_END, v4, "PUParallaxLayerStackDebugViewController.DownloadProgressIndicator", "", v7, 2u);
  }

  id v5 = [*(id *)(a1 + 32) downloadProgressIndicator];
  [v5 removeFromSuperview];

  return [*(id *)(a1 + 32) setDownloadProgressIndicator:0];
}

- (void)updateDownloadProgressIndicator:(double)a3
{
  id v5 = [(PUParallaxLayerStackDebugViewController *)self downloadProgressIndicator];
  [v5 setCurrentProgress:a3];

  uint64_t v6 = PLWallpaperGetLog();
  int v7 = v6;
  os_signpost_id_t signpost = self->_signpost;
  if (signpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v7, OS_SIGNPOST_EVENT, signpost, "PUParallaxLayerStackDebugViewController.UpdateDownloadProgress", "", v9, 2u);
  }
}

- (void)showDownloadProgressIndicator
{
  id v3 = [(PUParallaxLayerStackDebugViewController *)self downloadProgressIndicator];

  if (!v3)
  {
    os_signpost_id_t v4 = PLWallpaperGetLog();
    id v5 = v4;
    os_signpost_id_t signpost = self->_signpost;
    if (signpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, signpost, "PUParallaxLayerStackDebugViewController.DownloadProgressIndicator", "", v17, 2u);
    }

    int v7 = [[PUProgressIndicatorView alloc] initWithStyle:0];
    [(PUParallaxLayerStackDebugViewController *)self setDownloadProgressIndicator:v7];

    uint64_t v8 = [(PUParallaxLayerStackDebugViewController *)self downloadProgressIndicator];
    [v8 setLocalizedMessage:@"Downloading…"];

    uint64_t v9 = [(PUParallaxLayerStackDebugViewController *)self downloadProgressIndicator];
    [v9 setDeterminate:1];

    uint64_t v10 = [(PUParallaxLayerStackDebugViewController *)self downloadProgressIndicator];
    [v10 setCurrentProgress:0.0];

    uint64_t v11 = [(PUParallaxLayerStackDebugViewController *)self downloadProgressIndicator];
    [v11 setShowsBackground:1];

    long long v12 = [(PUParallaxLayerStackDebugViewController *)self downloadProgressIndicator];
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

    long long v13 = [(PUParallaxLayerStackDebugViewController *)self downloadProgressIndicator];
    [v13 beginShowingProgressImmediately:1 animated:1];

    long long v14 = [(PUParallaxLayerStackDebugViewController *)self view];
    long long v15 = [(PUParallaxLayerStackDebugViewController *)self downloadProgressIndicator];
    [v14 addSubview:v15];

    unint64_t v16 = [(PUParallaxLayerStackDebugViewController *)self downloadProgressIndicator];
    [v16 sizeToFit];
  }
}

- (void)hideProgressIndicator
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [(PUParallaxLayerStackDebugViewController *)self progressIndicator];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__PUParallaxLayerStackDebugViewController_hideProgressIndicator__block_invoke;
  v14[3] = &unk_1E5F2ED10;
  v14[4] = self;
  [v3 endShowingProgressImmediately:1 animated:1 withCompletionHandler:v14];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  os_signpost_id_t v4 = [(PUParallaxLayerStackDebugViewController *)self buttonStackView];
  id v5 = [v4 arrangedSubviews];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setEnabled:1];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

uint64_t __64__PUParallaxLayerStackDebugViewController_hideProgressIndicator__block_invoke(uint64_t a1)
{
  id v2 = PLWallpaperGetLog();
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(*(void *)(a1 + 32) + 984);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v3, OS_SIGNPOST_INTERVAL_END, v4, "PUParallaxLayerStackDebugViewController.ProgressIndicator", "", v7, 2u);
  }

  id v5 = [*(id *)(a1 + 32) progressIndicator];
  [v5 removeFromSuperview];

  return [*(id *)(a1 + 32) setProgressIndicator:0];
}

- (void)updateProgressIndicator:(id)a3
{
  id v4 = a3;
  id v5 = [(PUParallaxLayerStackDebugViewController *)self progressIndicator];
  [v5 setLocalizedMessage:v4];
}

- (void)showProgressIndicator:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PUParallaxLayerStackDebugViewController *)self progressIndicator];

  if (!v5)
  {
    uint64_t v6 = PLWallpaperGetLog();
    uint64_t v7 = v6;
    os_signpost_id_t signpost = self->_signpost;
    if (signpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v7, OS_SIGNPOST_INTERVAL_BEGIN, signpost, "PUParallaxLayerStackDebugViewController.ProgressIndicator", "", buf, 2u);
    }

    uint64_t v9 = [[PUProgressIndicatorView alloc] initWithStyle:0];
    [(PUParallaxLayerStackDebugViewController *)self setProgressIndicator:v9];

    long long v10 = [(PUParallaxLayerStackDebugViewController *)self progressIndicator];
    [v10 setLocalizedMessage:v4];

    long long v11 = [(PUParallaxLayerStackDebugViewController *)self progressIndicator];
    [v11 setDeterminate:0];

    long long v12 = [(PUParallaxLayerStackDebugViewController *)self progressIndicator];
    [v12 setShowsBackground:1];

    long long v13 = [(PUParallaxLayerStackDebugViewController *)self progressIndicator];
    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

    long long v14 = [(PUParallaxLayerStackDebugViewController *)self progressIndicator];
    [v14 beginShowingProgressImmediately:1 animated:1];

    long long v15 = [(PUParallaxLayerStackDebugViewController *)self view];
    uint64_t v16 = [(PUParallaxLayerStackDebugViewController *)self progressIndicator];
    [v15 addSubview:v16];

    uint64_t v17 = [(PUParallaxLayerStackDebugViewController *)self progressIndicator];
    [v17 sizeToFit];
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v18 = [(PUParallaxLayerStackDebugViewController *)self buttonStackView];
  uint64_t v19 = [v18 arrangedSubviews];

  uint64_t v20 = [v19 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v25;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(v19);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * v23++) setEnabled:0];
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v21);
  }
}

- (void)_updateDateTimeView
{
  id v10 = [(PUParallaxLayerStackDebugViewController *)self dateTimeView];
  id v3 = [(PUParallaxLayerStackDebugViewController *)self viewModel];
  id v4 = [v3 style];

  id v5 = [v4 clockFont];
  uint64_t v6 = PUPosterSimulatedTimeFontForIdentifier(v5);
  [v10 setTimeFont:v6];

  uint64_t v7 = (void *)MEMORY[0x1E4FB1618];
  uint64_t v8 = [v4 clockColor];
  uint64_t v9 = objc_msgSend(v7, "colorWithCGColor:", objc_msgSend(v8, "CGColor"));
  [v10 setTimeColor:v9];

  [v10 setUseVibrantAppearance:0];
}

- (void)viewDidLayoutSubviews
{
  v49.receiver = self;
  v49.super_class = (Class)PUParallaxLayerStackDebugViewController;
  [(PUParallaxLayerStackDebugViewController *)&v49 viewDidLayoutSubviews];
  id v3 = [(PUParallaxLayerStackDebugViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  long long v12 = [(PUParallaxLayerStackDebugViewController *)self layerStackView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  long long v13 = [(PUParallaxLayerStackDebugViewController *)self view];
  [v13 bounds];
  double MidX = CGRectGetMidX(v50);
  long long v15 = [(PUParallaxLayerStackDebugViewController *)self view];
  [v15 bounds];
  CGFloat v16 = CGRectGetMidY(v51) * 0.67;
  uint64_t v17 = [(PUParallaxLayerStackDebugViewController *)self progressIndicator];
  objc_msgSend(v17, "setCenter:", MidX, v16);

  uint64_t v18 = [(PUParallaxLayerStackDebugViewController *)self view];
  [v18 bounds];
  double v19 = CGRectGetMidX(v52);
  uint64_t v20 = [(PUParallaxLayerStackDebugViewController *)self view];
  [v20 bounds];
  CGFloat v21 = CGRectGetMidY(v53) * 1.33;
  uint64_t v22 = [(PUParallaxLayerStackDebugViewController *)self downloadProgressIndicator];
  objc_msgSend(v22, "setCenter:", v19, v21);

  uint64_t v23 = [(PUParallaxLayerStackDebugViewController *)self view];
  [v23 safeAreaInsets];
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;

  uint64_t v30 = [(PUParallaxLayerStackDebugViewController *)self view];
  [v30 bounds];
  CGFloat v31 = CGRectGetMaxY(v54) - v27;
  v32 = [(PUParallaxLayerStackDebugViewController *)self radarButton];
  [v32 bounds];
  CGFloat v33 = v31 - CGRectGetHeight(v55);
  v34 = [(PUParallaxLayerStackDebugViewController *)self view];
  [v34 bounds];
  CGFloat v35 = CGRectGetWidth(v56) - v29 - v25;
  v36 = [(PUParallaxLayerStackDebugViewController *)self radarButton];
  [v36 bounds];
  double Height = CGRectGetHeight(v57);

  v38 = [(PUParallaxLayerStackDebugViewController *)self buttonStackView];
  objc_msgSend(v38, "setFrame:", v25, v33, v35, Height);

  v39 = [(PUParallaxLayerStackDebugViewController *)self viewModel];
  v40 = [v39 currentLayerStack];

  v41 = [v40 layout];
  if (v41)
  {
    v58.origin.double x = v5;
    v58.origin.double y = v7;
    v58.size.double width = v9;
    v58.size.double height = v11;
    if (!CGRectIsEmpty(v58))
    {
      v42 = [(PUParallaxLayerStackDebugViewController *)self dateTimeView];
      objc_msgSend(v42, "layoutWithLayout:inContainerFrame:", v41, v5, v7, v9, v11);

      v43 = [(PUParallaxLayerStackDebugViewController *)self viewModel];
      int v44 = [v43 clockAppearsAboveForeground];

      if (v44) {
        v45 = (double *)MEMORY[0x1E4F8D0F0];
      }
      else {
        v45 = (double *)MEMORY[0x1E4F8D0E8];
      }
      double v46 = *v45;
      v47 = [(PUParallaxLayerStackDebugViewController *)self dateTimeView];
      v48 = [v47 layer];
      [v48 setZPosition:v46];
    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PUParallaxLayerStackDebugViewController;
  [(PUParallaxLayerStackDebugViewController *)&v3 viewWillDisappear:a3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PUParallaxLayerStackDebugViewController;
  [(PUParallaxLayerStackDebugViewController *)&v3 viewDidAppear:a3];
}

- (void)viewDidLoad
{
  v50[6] = *MEMORY[0x1E4F143B8];
  v49.receiver = self;
  v49.super_class = (Class)PUParallaxLayerStackDebugViewController;
  [(PUParallaxLayerStackDebugViewController *)&v49 viewDidLoad];
  objc_super v3 = [MEMORY[0x1E4FB1618] grayColor];
  double v4 = [(PUParallaxLayerStackDebugViewController *)self view];
  [v4 setBackgroundColor:v3];

  double v5 = [PUParallaxLayerStackView alloc];
  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v10 = -[PUParallaxLayerStackView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], v7, v8, v9);
  [(PUParallaxLayerStackDebugViewController *)self setLayerStackView:v10];

  double v11 = [(PUParallaxLayerStackDebugViewController *)self view];
  long long v12 = [(PUParallaxLayerStackDebugViewController *)self layerStackView];
  [v11 addSubview:v12];

  long long v13 = -[PUWallpaperPosterDateView initWithFrame:]([PUWallpaperPosterDateView alloc], "initWithFrame:", v6, v7, v8, v9);
  [(PUParallaxLayerStackDebugViewController *)self setDateTimeView:v13];

  long long v14 = [(PUParallaxLayerStackDebugViewController *)self view];
  long long v15 = [(PUParallaxLayerStackDebugViewController *)self dateTimeView];
  [v14 addSubview:v15];

  id v16 = [(PUParallaxLayerStackDebugViewController *)self _newButtonWithSystemImageName:@"square.stack.3d.up"];
  [(PUParallaxLayerStackDebugViewController *)self setParallaxEnabledButton:v16];

  uint64_t v17 = [(PUParallaxLayerStackDebugViewController *)self parallaxEnabledButton];
  [v17 addTarget:self action:sel_toggleParallaxEnabled_ forControlEvents:0x2000];

  id v18 = [(PUParallaxLayerStackDebugViewController *)self _newButtonWithSystemImageName:@"slider.horizontal.below.rectangle"];
  [(PUParallaxLayerStackDebugViewController *)self setLooksButton:v18];

  double v19 = [(PUParallaxLayerStackDebugViewController *)self looksButton];
  [v19 addTarget:self action:sel_showLooks_ forControlEvents:0x2000];

  id v20 = [(PUParallaxLayerStackDebugViewController *)self _newButtonWithSystemImageName:@"list.dash"];
  [(PUParallaxLayerStackDebugViewController *)self setLayerListButton:v20];

  CGFloat v21 = [(PUParallaxLayerStackDebugViewController *)self layerListButton];
  [v21 addTarget:self action:sel_showLayerList_ forControlEvents:0x2000];

  id v22 = [(PUParallaxLayerStackDebugViewController *)self _newButtonWithSystemImageName:@"eyedropper.full"];
  [(PUParallaxLayerStackDebugViewController *)self setColorPaletteButton:v22];

  uint64_t v23 = [(PUParallaxLayerStackDebugViewController *)self colorPaletteButton];
  [v23 addTarget:self action:sel_showColorPalettes_ forControlEvents:0x2000];

  id v24 = [(PUParallaxLayerStackDebugViewController *)self _newButtonWithSystemImageName:@"square.and.arrow.up"];
  [(PUParallaxLayerStackDebugViewController *)self setShareButton:v24];

  double v25 = [(PUParallaxLayerStackDebugViewController *)self shareButton];
  [v25 addTarget:self action:sel_shareLayerStack_ forControlEvents:0x2000];

  id v26 = [(PUParallaxLayerStackDebugViewController *)self _newButtonWithSystemImageName:@"ant.fill"];
  [(PUParallaxLayerStackDebugViewController *)self setRadarButton:v26];

  double v27 = [(PUParallaxLayerStackDebugViewController *)self radarButton];
  [v27 addTarget:self action:sel_tapToRadar_ forControlEvents:0x2000];

  id v28 = objc_alloc(MEMORY[0x1E4FB1C60]);
  double v29 = [(PUParallaxLayerStackDebugViewController *)self parallaxEnabledButton];
  v50[0] = v29;
  uint64_t v30 = [(PUParallaxLayerStackDebugViewController *)self looksButton];
  v50[1] = v30;
  CGFloat v31 = [(PUParallaxLayerStackDebugViewController *)self layerListButton];
  v50[2] = v31;
  v32 = [(PUParallaxLayerStackDebugViewController *)self colorPaletteButton];
  v50[3] = v32;
  CGFloat v33 = [(PUParallaxLayerStackDebugViewController *)self shareButton];
  v50[4] = v33;
  v34 = [(PUParallaxLayerStackDebugViewController *)self radarButton];
  v50[5] = v34;
  CGFloat v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:6];
  v36 = (void *)[v28 initWithArrangedSubviews:v35];
  [(PUParallaxLayerStackDebugViewController *)self setButtonStackView:v36];

  v37 = [MEMORY[0x1E4FB1618] clearColor];
  v38 = [(PUParallaxLayerStackDebugViewController *)self buttonStackView];
  [v38 setBackgroundColor:v37];

  v39 = [(PUParallaxLayerStackDebugViewController *)self buttonStackView];
  [v39 setAxis:0];

  v40 = [(PUParallaxLayerStackDebugViewController *)self buttonStackView];
  [v40 setAlignment:3];

  v41 = [(PUParallaxLayerStackDebugViewController *)self buttonStackView];
  [v41 setDistribution:1];

  v42 = [(PUParallaxLayerStackDebugViewController *)self view];
  v43 = [(PUParallaxLayerStackDebugViewController *)self buttonStackView];
  [v42 addSubview:v43];

  int v44 = [(PUParallaxLayerStackDebugViewController *)self buttonStackView];
  [v44 sizeToFit];

  v45 = (void *)[objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:self action:sel_panGesture_];
  double v46 = [(PUParallaxLayerStackDebugViewController *)self layerStackView];
  [v46 addGestureRecognizer:v45];

  v47 = (void *)[objc_alloc(MEMORY[0x1E4FB1AA0]) initWithTarget:self action:sel_pinchGesture_];
  v48 = [(PUParallaxLayerStackDebugViewController *)self view];
  [v48 addGestureRecognizer:v47];
}

- (id)_newButtonWithSystemImageName:(id)a3
{
  objc_super v3 = (void *)MEMORY[0x1E4FB14D8];
  id v4 = a3;
  double v5 = [v3 borderlessButtonConfiguration];
  [v5 setButtonSize:0];
  double v6 = [MEMORY[0x1E4FB1818] systemImageNamed:v4];

  [v5 setImage:v6];
  double v7 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
  [v7 setConfiguration:v5];
  [v7 sizeToFit];

  return v7;
}

- (PUParallaxLayerStackDebugViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)PUParallaxLayerStackDebugViewController;
  id v2 = [(PUParallaxLayerStackDebugViewController *)&v5 init];
  objc_super v3 = PLWallpaperGetLog();
  v2->_os_signpost_id_t signpost = os_signpost_id_make_with_pointer(v3, v2);

  return v2;
}

@end