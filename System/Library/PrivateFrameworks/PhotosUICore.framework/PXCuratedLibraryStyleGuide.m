@interface PXCuratedLibraryStyleGuide
- (BOOL)secondaryToolbarRenderedExternally;
- (CGSize)secondaryToolbarSize;
- (PXCuratedLibraryStyleGuide)init;
- (PXCuratedLibraryStyleGuide)initWithExtendedTraitCollection:(id)a3;
- (PXCuratedLibraryStyleGuide)initWithExtendedTraitCollection:(id)a3 secondaryToolbarStyle:(unint64_t)a4;
- (PXExtendedTraitCollection)extendedTraitCollection;
- (UIEdgeInsets)secondaryToolbarContentInsets;
- (UIEdgeInsets)secondaryToolbarPadding;
- (double)lateralMargin;
- (double)maximumAccessoryViewPadding;
- (id)zoomLevelControlTextColorOverLegibilityGradient:(BOOL)a3;
- (int64_t)buttonStyle;
- (int64_t)secondaryToolbarPlacement;
- (int64_t)toggleAspectFitButtonPlacement;
- (int64_t)zoomButtonsButtonPlacement;
- (unint64_t)secondaryToolbarStyle;
- (void)_update;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setButtonStyle:(int64_t)a3;
- (void)setLateralMargin:(double)a3;
- (void)setMaximumAccessoryViewPadding:(double)a3;
- (void)setSecondaryToolbarContentInsets:(UIEdgeInsets)a3;
- (void)setSecondaryToolbarPadding:(UIEdgeInsets)a3;
- (void)setSecondaryToolbarPlacement:(int64_t)a3;
- (void)setSecondaryToolbarRenderedExternally:(BOOL)a3;
- (void)setSecondaryToolbarSize:(CGSize)a3;
- (void)setToggleAspectFitButtonPlacement:(int64_t)a3;
- (void)setZoomButtonsButtonPlacement:(int64_t)a3;
@end

@implementation PXCuratedLibraryStyleGuide

- (void)setMaximumAccessoryViewPadding:(double)a3
{
  self->_maximumAccessoryViewPadding = a3;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6 = a4;
  id v9 = a3;
  if ((void *)PXExtendedTraitCollectionObservationContext_21859 != a5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXCuratedLibraryStyleGuide.m" lineNumber:263 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((v6 & 0x14A) != 0)
  {
    id v11 = v9;
    [(PXCuratedLibraryStyleGuide *)self _invalidate];
    id v9 = v11;
  }
}

- (void)_update
{
  v3 = +[PXCuratedLibrarySettings sharedInstance];
  v4 = +[PXPhotosGridSettings sharedInstance];
  v5 = [(PXCuratedLibraryStyleGuide *)self extendedTraitCollection];
  unint64_t v6 = [v5 layoutSizeClass];
  unint64_t v7 = v6;
  if (v6 <= 1) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = v6;
  }
  uint64_t v9 = [v5 userInterfaceIdiom];
  if ([v4 enableAspectFitButton]) {
    BOOL v10 = v9 == 4;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10 && v7 >= 2)
  {
    [v5 layoutOrientation];
    uint64_t v12 = 1;
  }
  else
  {
    uint64_t v12 = 0;
  }
  if ([v4 enableZoomInOutButton]) {
    BOOL v13 = v9 == 4;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    if (v9 == 4) {
      goto LABEL_34;
    }
  }
  else if (v7 >= 2)
  {
    if ([v5 layoutOrientation] == 2) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = 2;
    }
  }
  else
  {
    uint64_t v14 = 2;
  }
  if (v8 == 2)
  {
    if (([v3 alwaysShowSecondaryToolbarAtBottom] & 1) == 0)
    {
      uint64_t v16 = 3;
      goto LABEL_31;
    }
LABEL_29:
    uint64_t v15 = 2;
    goto LABEL_34;
  }
  if ([v5 layoutOrientation] == 2) {
    goto LABEL_29;
  }
  uint64_t v16 = 1;
LABEL_31:
  if ([(PXCuratedLibraryStyleGuide *)self secondaryToolbarStyle] == 1) {
    uint64_t v15 = 2;
  }
  else {
    uint64_t v15 = v16;
  }
LABEL_34:
  v17 = [[PXFeatureSpec alloc] initWithExtendedTraitCollection:v5];
  [(PXFeatureSpec *)v17 contentGuideInsetsForScrollAxis:1];
  double v19 = v18;
  double v41 = v20;
  uint64_t v21 = [v5 curatedLibraryLayoutStyle];
  +[PXPhotosChromeSpec secondaryToolbarSize];
  uint64_t v24 = v23;
  if (v15 == 3)
  {
    uint64_t v25 = 0x4075400000000000;
  }
  else
  {
    uint64_t v25 = 0;
    if (v15 == 2)
    {
      uint64_t v26 = v22;
      if ([(PXCuratedLibraryStyleGuide *)self secondaryToolbarStyle] == 1)
      {
        uint64_t v25 = v26;
      }
      else
      {
        [v3 bottomCenterSecondaryToolbarWidth];
        uint64_t v25 = v27;
      }
    }
  }
  +[PXPhotosChromeSpec maximumAccessoryViewPadding];
  uint64_t v29 = v28;
  if (v21 == 1)
  {
    uint64_t v30 = [v5 layoutSizeClass];
    [v5 safeAreaInsets];
    +[PXPhotosChromeSpec secondaryToolbarPaddingForSizeClass:safeAreaInsets:](PXPhotosChromeSpec, "secondaryToolbarPaddingForSizeClass:safeAreaInsets:", v30);
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;
  }
  else
  {
    double v34 = 16.0;
    double v32 = 8.0;
    uint64_t v24 = 0x4044000000000000;
    double v36 = 8.0;
    double v38 = 16.0;
  }
  uint64_t v39 = [v5 userInterfaceIdiom];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __37__PXCuratedLibraryStyleGuide__update__block_invoke;
  v42[3] = &unk_1E5DB1230;
  double v44 = (v19 + v41) * 0.5;
  uint64_t v45 = v15;
  uint64_t v46 = v25;
  uint64_t v47 = v24;
  v42[4] = self;
  id v43 = v5;
  uint64_t v48 = v12;
  uint64_t v49 = v14;
  BOOL v55 = v39 == 5;
  double v50 = v32;
  double v51 = v34;
  double v52 = v36;
  double v53 = v38;
  uint64_t v54 = v29;
  id v40 = v5;
  [(PXCuratedLibraryStyleGuide *)self performChanges:v42];
}

- (unint64_t)secondaryToolbarStyle
{
  return self->_secondaryToolbarStyle;
}

- (PXExtendedTraitCollection)extendedTraitCollection
{
  return self->_extendedTraitCollection;
}

- (PXCuratedLibraryStyleGuide)initWithExtendedTraitCollection:(id)a3 secondaryToolbarStyle:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXCuratedLibraryStyleGuide;
  uint64_t v8 = [(PXCuratedLibraryStyleGuide *)&v11 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_extendedTraitCollection, a3);
    v9->_secondaryToolbarStyle = a4;
    [(PXExtendedTraitCollection *)v9->_extendedTraitCollection registerChangeObserver:v9 context:PXExtendedTraitCollectionObservationContext_21859];
    [(PXCuratedLibraryStyleGuide *)v9 _update];
  }

  return v9;
}

- (PXCuratedLibraryStyleGuide)initWithExtendedTraitCollection:(id)a3
{
  return [(PXCuratedLibraryStyleGuide *)self initWithExtendedTraitCollection:a3 secondaryToolbarStyle:0];
}

- (void).cxx_destruct
{
}

uint64_t __37__PXCuratedLibraryStyleGuide__update__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setLateralMargin:*(double *)(a1 + 48)];
  [*(id *)(a1 + 32) setSecondaryToolbarPlacement:*(void *)(a1 + 56)];
  objc_msgSend(*(id *)(a1 + 32), "setSecondaryToolbarSize:", *(double *)(a1 + 64), *(double *)(a1 + 72));
  if (*(void *)(a1 + 56) == 3)
  {
    [*(id *)(a1 + 40) safeAreaInsets];
    [*(id *)(a1 + 32) secondaryToolbarSize];
    PXEdgeInsetsMake();
  }
  objc_msgSend(*(id *)(a1 + 32), "setSecondaryToolbarContentInsets:", *(double *)off_1E5DAAF10, *((double *)off_1E5DAAF10 + 1), *((double *)off_1E5DAAF10 + 2), *((double *)off_1E5DAAF10 + 3));
  [*(id *)(a1 + 32) setToggleAspectFitButtonPlacement:*(void *)(a1 + 80)];
  [*(id *)(a1 + 32) setZoomButtonsButtonPlacement:*(void *)(a1 + 88)];
  [*(id *)(a1 + 32) setSecondaryToolbarRenderedExternally:*(unsigned __int8 *)(a1 + 136)];
  objc_msgSend(*(id *)(a1 + 32), "setSecondaryToolbarPadding:", *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120));
  double v2 = *(double *)(a1 + 128);
  v3 = *(void **)(a1 + 32);
  return [v3 setMaximumAccessoryViewPadding:v2];
}

- (void)setZoomButtonsButtonPlacement:(int64_t)a3
{
  if (self->_zoomButtonsButtonPlacement != a3)
  {
    self->_zoomButtonsButtonPlacement = a3;
    [(PXCuratedLibraryStyleGuide *)self signalChange:64];
  }
}

- (void)setToggleAspectFitButtonPlacement:(int64_t)a3
{
  if (self->_toggleAspectFitButtonPlacement != a3)
  {
    self->_toggleAspectFitButtonPlacement = a3;
    [(PXCuratedLibraryStyleGuide *)self signalChange:32];
  }
}

- (void)setSecondaryToolbarSize:(CGSize)a3
{
  if (a3.width != self->_secondaryToolbarSize.width || a3.height != self->_secondaryToolbarSize.height)
  {
    self->_secondaryToolbarSize = a3;
    [(PXCuratedLibraryStyleGuide *)self signalChange:8];
  }
}

- (void)setSecondaryToolbarRenderedExternally:(BOOL)a3
{
  self->_secondaryToolbarRenderedExternally = a3;
}

- (void)setSecondaryToolbarPlacement:(int64_t)a3
{
  if (self->_secondaryToolbarPlacement != a3)
  {
    self->_secondaryToolbarPlacement = a3;
    [(PXCuratedLibraryStyleGuide *)self signalChange:4];
  }
}

- (void)setSecondaryToolbarPadding:(UIEdgeInsets)a3
{
}

- (void)setSecondaryToolbarContentInsets:(UIEdgeInsets)a3
{
}

- (void)setLateralMargin:(double)a3
{
  if (self->_lateralMargin != a3)
  {
    self->_lateralMargin = a3;
    [(PXCuratedLibraryStyleGuide *)self signalChange:1];
  }
}

- (int64_t)secondaryToolbarPlacement
{
  return self->_secondaryToolbarPlacement;
}

- (CGSize)secondaryToolbarSize
{
  double width = self->_secondaryToolbarSize.width;
  double height = self->_secondaryToolbarSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)maximumAccessoryViewPadding
{
  return self->_maximumAccessoryViewPadding;
}

- (UIEdgeInsets)secondaryToolbarPadding
{
  double top = self->_secondaryToolbarPadding.top;
  double left = self->_secondaryToolbarPadding.left;
  double bottom = self->_secondaryToolbarPadding.bottom;
  double right = self->_secondaryToolbarPadding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (id)zoomLevelControlTextColorOverLegibilityGradient:(BOOL)a3
{
  if (a3) {
    [MEMORY[0x1E4FB1618] whiteColor];
  }
  else {
  v3 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }
  return v3;
}

- (double)lateralMargin
{
  return self->_lateralMargin;
}

- (int64_t)buttonStyle
{
  return self->_buttonStyle;
}

- (BOOL)secondaryToolbarRenderedExternally
{
  return self->_secondaryToolbarRenderedExternally;
}

- (int64_t)zoomButtonsButtonPlacement
{
  return self->_zoomButtonsButtonPlacement;
}

- (int64_t)toggleAspectFitButtonPlacement
{
  return self->_toggleAspectFitButtonPlacement;
}

- (UIEdgeInsets)secondaryToolbarContentInsets
{
  double top = self->_secondaryToolbarContentInsets.top;
  double left = self->_secondaryToolbarContentInsets.left;
  double bottom = self->_secondaryToolbarContentInsets.bottom;
  double right = self->_secondaryToolbarContentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setButtonStyle:(int64_t)a3
{
  if (self->_buttonStyle != a3)
  {
    self->_buttonStyle = a3;
    [(PXCuratedLibraryStyleGuide *)self signalChange:2];
  }
}

- (PXCuratedLibraryStyleGuide)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCuratedLibraryStyleGuide.m", 41, @"%s is not available as initializer", "-[PXCuratedLibraryStyleGuide init]");

  abort();
}

@end