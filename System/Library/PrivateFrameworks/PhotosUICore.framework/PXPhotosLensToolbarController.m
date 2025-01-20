@interface PXPhotosLensToolbarController
- (BOOL)secondaryToolbarControllerToolbarRenderedExternally:(id)a3;
- (BOOL)secondaryToolbarControllerWantsToolbarVisible:(id)a3;
- (CGSize)secondaryToolbarControllerToolbarSize:(id)a3;
- (PXPhotosLensControl)photosLensControl;
- (PXPhotosLensToolbarController)initWithViewModel:(id)a3 containerView:(id)a4;
- (PXPhotosViewModel)viewModel;
- (UIEdgeInsets)secondaryToolbarControllerScrollableContentPadding:(id)a3;
- (UIEdgeInsets)secondaryToolbarControllerToolbarContentInsets:(id)a3;
- (UIEdgeInsets)secondaryToolbarControllerToolbarPadding:(id)a3;
- (double)secondaryToolbarControllerMaximumAccessoryViewPaddingToContentView:(id)a3;
- (int64_t)secondaryToolbarControllerToolbarPlacement:(id)a3;
- (void)_updateLensControl;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)photosLensControl:(id)a3 didSelectItem:(id)a4;
- (void)photosLensControl:(id)a3 didTapOnAlreadySelectedItem:(id)a4;
- (void)setPhotosLensControl:(id)a3;
@end

@implementation PXPhotosLensToolbarController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosLensControl, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (void)setPhotosLensControl:(id)a3
{
}

- (PXPhotosLensControl)photosLensControl
{
  return self->_photosLensControl;
}

- (PXPhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (double)secondaryToolbarControllerMaximumAccessoryViewPaddingToContentView:(id)a3
{
  return 0.0;
}

- (BOOL)secondaryToolbarControllerWantsToolbarVisible:(id)a3
{
  return 1;
}

- (CGSize)secondaryToolbarControllerToolbarSize:(id)a3
{
  double v3 = 260.0;
  double v4 = 40.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)secondaryToolbarControllerToolbarRenderedExternally:(id)a3
{
  return 0;
}

- (int64_t)secondaryToolbarControllerToolbarPlacement:(id)a3
{
  return 2;
}

- (UIEdgeInsets)secondaryToolbarControllerScrollableContentPadding:(id)a3
{
  double v3 = *(double *)off_1E5DAAF10;
  double v4 = *((double *)off_1E5DAAF10 + 1);
  double v5 = *((double *)off_1E5DAAF10 + 2);
  double v6 = *((double *)off_1E5DAAF10 + 3);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (UIEdgeInsets)secondaryToolbarControllerToolbarPadding:(id)a3
{
}

- (UIEdgeInsets)secondaryToolbarControllerToolbarContentInsets:(id)a3
{
  double v3 = *(double *)off_1E5DAAF10;
  double v4 = *((double *)off_1E5DAAF10 + 1);
  double v5 = *((double *)off_1E5DAAF10 + 2);
  double v6 = *((double *)off_1E5DAAF10 + 3);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9 = a3;
  if ((void *)ViewModelObserverContext != a5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXPhotosLensToolbarController.m" lineNumber:73 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((a4 & 0x100000000000) != 0)
  {
    id v11 = v9;
    [(PXPhotosLensToolbarController *)self _updateLensControl];
    id v9 = v11;
  }
}

- (void)photosLensControl:(id)a3 didTapOnAlreadySelectedItem:(id)a4
{
  id v5 = [(PXSecondaryToolbarController *)self actionHandler];
  [v5 secondaryToolbarController:self scrollToBottomAnimated:1];
}

- (void)photosLensControl:(id)a3 didSelectItem:(id)a4
{
  id v5 = a4;
  double v6 = [(PXPhotosLensToolbarController *)self viewModel];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__PXPhotosLensToolbarController_photosLensControl_didSelectItem___block_invoke;
  v8[3] = &unk_1E5DCF6C0;
  id v9 = v5;
  id v7 = v5;
  [v6 performChanges:v8];
}

uint64_t __65__PXPhotosLensToolbarController_photosLensControl_didSelectItem___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setCurrentLens:*(void *)(a1 + 32)];
}

- (void)_updateLensControl
{
  id v6 = [(PXPhotosLensToolbarController *)self viewModel];
  double v3 = [(PXPhotosLensToolbarController *)self photosLensControl];
  double v4 = [v6 availableLenses];
  [v3 setItems:v4];

  id v5 = [v6 currentLens];
  [v3 setSelectedItem:v5];
}

- (PXPhotosLensToolbarController)initWithViewModel:(id)a3 containerView:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXPhotosLensToolbarController.m", 27, @"Invalid parameter not satisfying: %@", @"viewModel" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"PXPhotosLensToolbarController.m", 28, @"Invalid parameter not satisfying: %@", @"containerView" object file lineNumber description];

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)PXPhotosLensToolbarController;
  id v11 = [(PXSecondaryToolbarController *)&v18 initWithContainerView:v10 styleGuideProvider:self];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_viewModel, a3);
    [v8 registerChangeObserver:v12 context:ViewModelObserverContext];
    v13 = objc_alloc_init(PXPhotosLensControl);
    photosLensControl = v12->_photosLensControl;
    v12->_photosLensControl = v13;

    [(PXPhotosLensControl *)v12->_photosLensControl setHideSymbols:1];
    [(PXPhotosLensControl *)v12->_photosLensControl setDelegate:v12];
    [(PXPhotosLensToolbarController *)v12 _updateLensControl];
    [(PXSecondaryToolbarController *)v12 setContentView:v12->_photosLensControl];
  }

  return v12;
}

@end