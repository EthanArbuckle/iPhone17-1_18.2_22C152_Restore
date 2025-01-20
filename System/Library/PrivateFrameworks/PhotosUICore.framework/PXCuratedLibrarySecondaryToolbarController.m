@interface PXCuratedLibrarySecondaryToolbarController
- (BOOL)secondaryToolbarControllerToolbarRenderedExternally:(id)a3;
- (BOOL)secondaryToolbarControllerWantsToolbarVisible:(id)a3;
- (CGSize)secondaryToolbarControllerToolbarSize:(id)a3;
- (PXCuratedLibrarySecondaryToolbarController)initWithContainerView:(id)a3 legibilityContainerView:(id)a4 viewModel:(id)a5;
- (PXCuratedLibraryStyleGuide)styleGuide;
- (PXCuratedLibraryViewModel)viewModel;
- (UIEdgeInsets)secondaryToolbarControllerScrollableContentPadding:(id)a3;
- (UIEdgeInsets)secondaryToolbarControllerToolbarContentInsets:(id)a3;
- (UIEdgeInsets)secondaryToolbarControllerToolbarPadding:(id)a3;
- (double)secondaryToolbarControllerMaximumAccessoryViewPaddingToContentView:(id)a3;
- (int64_t)secondaryToolbarControllerToolbarPlacement:(id)a3;
- (void)isShowingGradientDidChange;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
@end

@implementation PXCuratedLibrarySecondaryToolbarController

- (BOOL)secondaryToolbarControllerWantsToolbarVisible:(id)a3
{
  v3 = [(PXCuratedLibrarySecondaryToolbarController *)self viewModel];
  char v4 = [v3 wantsSecondaryToolbarVisible];

  return v4;
}

- (PXCuratedLibraryViewModel)viewModel
{
  return self->_viewModel;
}

- (double)secondaryToolbarControllerMaximumAccessoryViewPaddingToContentView:(id)a3
{
  v3 = [(PXCuratedLibrarySecondaryToolbarController *)self styleGuide];
  [v3 maximumAccessoryViewPadding];
  double v5 = v4;

  return v5;
}

- (CGSize)secondaryToolbarControllerToolbarSize:(id)a3
{
  v3 = [(PXCuratedLibrarySecondaryToolbarController *)self styleGuide];
  [v3 secondaryToolbarSize];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (PXCuratedLibraryStyleGuide)styleGuide
{
  return self->_styleGuide;
}

- (int64_t)secondaryToolbarControllerToolbarPlacement:(id)a3
{
  v3 = [(PXCuratedLibrarySecondaryToolbarController *)self styleGuide];
  int64_t v4 = [v3 secondaryToolbarPlacement];

  if ((unint64_t)(v4 - 1) >= 3) {
    return 0;
  }
  else {
    return v4;
  }
}

- (UIEdgeInsets)secondaryToolbarControllerToolbarPadding:(id)a3
{
  v3 = [(PXCuratedLibrarySecondaryToolbarController *)self styleGuide];
  [v3 secondaryToolbarPadding];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
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

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  int v6 = a4;
  id v10 = a3;
  if ((void *)PXStyleGuideObservationContext == a5)
  {
    if ((v6 & 0x84) != 0) {
      [(PXSecondaryToolbarController *)self invalidatePositioning];
    }
    if ((v6 & 0x18) != 0) {
      [(PXSecondaryToolbarController *)self invalidateSecondaryToolbarLayout];
    }
  }
  else
  {
    if ((void *)PXViewModelObservationContext_273296 != a5)
    {
      double v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"PXCuratedLibrarySecondaryToolbarController.m" lineNumber:63 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    if ((v6 & 0x400000) != 0) {
      [(PXSecondaryToolbarController *)self invalidateSecondaryToolbarLayout];
    }
    if ((*(void *)&v6 & 0x400040) != 0) {
      [(PXSecondaryToolbarController *)self setNeedsUpdate];
    }
  }
}

- (PXCuratedLibrarySecondaryToolbarController)initWithContainerView:(id)a3 legibilityContainerView:(id)a4 viewModel:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PXCuratedLibrarySecondaryToolbarController;
  id v10 = [(PXSecondaryToolbarController *)&v15 initWithContainerView:a3 styleGuideProvider:self];
  double v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_viewModel, a5);
    [(PXCuratedLibraryViewModel *)v11->_viewModel registerChangeObserver:v11 context:PXViewModelObservationContext_273296];
    uint64_t v12 = [v9 styleGuide];
    styleGuide = v11->_styleGuide;
    v11->_styleGuide = (PXCuratedLibraryStyleGuide *)v12;

    [(PXCuratedLibraryStyleGuide *)v11->_styleGuide registerChangeObserver:v11 context:PXStyleGuideObservationContext];
    [(PXSecondaryToolbarController *)v11 setLegibilityContainerView:v8];
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleGuide, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (BOOL)secondaryToolbarControllerToolbarRenderedExternally:(id)a3
{
  double v3 = [(PXCuratedLibrarySecondaryToolbarController *)self styleGuide];
  char v4 = [v3 secondaryToolbarRenderedExternally];

  return v4;
}

- (UIEdgeInsets)secondaryToolbarControllerToolbarContentInsets:(id)a3
{
  double v3 = [(PXCuratedLibrarySecondaryToolbarController *)self styleGuide];
  [v3 secondaryToolbarContentInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (void)isShowingGradientDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)PXCuratedLibrarySecondaryToolbarController;
  [(PXSecondaryToolbarController *)&v5 isShowingGradientDidChange];
  double v3 = [(PXCuratedLibrarySecondaryToolbarController *)self viewModel];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__PXCuratedLibrarySecondaryToolbarController_isShowingGradientDidChange__block_invoke;
  v4[3] = &unk_1E5DCF3F0;
  v4[4] = self;
  [v3 performChanges:v4];
}

void __72__PXCuratedLibrarySecondaryToolbarController_isShowingGradientDidChange__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setSecondaryToolbarLegibilityGradientIsVisible:", objc_msgSend(v2, "isShowingGradient"));
}

@end