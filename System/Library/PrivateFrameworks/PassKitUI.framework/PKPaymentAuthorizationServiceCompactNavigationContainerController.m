@interface PKPaymentAuthorizationServiceCompactNavigationContainerController
- (BOOL)_canShowWhileLocked;
- (BOOL)_effectiveShowCameraIndicator;
- (BOOL)_effectiveShowPhysicalButtonIndicator;
- (BOOL)showCameraIndicator;
- (BOOL)showPhysicalButtonIndicator;
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4;
- (LAUIPhysicalButtonView)physicalButtonView;
- (int)_preferredStatusBarVisibility;
- (void)_createSecondaryViewsIfNecessary;
- (void)loadView;
- (void)setShowCameraIndicator:(BOOL)a3;
- (void)setShowPhysicalButtonIndicator:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PKPaymentAuthorizationServiceCompactNavigationContainerController

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentAuthorizationServiceCompactNavigationContainerController;
  -[PKCompactNavigationContainerController viewWillTransitionToSize:withTransitionCoordinator:](&v12, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8 = [(PKPaymentAuthorizationServiceCompactNavigationContainerController *)self traitCollection];
  uint64_t v9 = [v8 userInterfaceIdiom];

  if ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    ++self->_rotationCount;
    v10 = [(PKPaymentAuthorizationServiceCompactNavigationContainerController *)self view];
    [v10 setNeedsLayout];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __120__PKPaymentAuthorizationServiceCompactNavigationContainerController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v11[3] = &unk_1E59CC1F8;
    v11[4] = self;
    [v7 animateAlongsideTransition:0 completion:v11];
  }
}

void __120__PKPaymentAuthorizationServiceCompactNavigationContainerController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  --*(unsigned char *)(*(void *)(a1 + 32) + 1312);
  v1 = *(unsigned char **)(a1 + 32);
  if (!v1[1312])
  {
    id v2 = [v1 view];
    [v2 setNeedsLayout];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentAuthorizationServiceCompactNavigationContainerController;
  [(PKCompactNavigationContainerController *)&v3 loadView];
  [(PKPaymentAuthorizationServiceCompactNavigationContainerController *)self _createSecondaryViewsIfNecessary];
  if (self->_physicalButtonView) {
    -[PKCompactNavigationContainerController insertBackgroundLevelView:](self, "insertBackgroundLevelView:");
  }
  if (self->_cameraArrowView) {
    -[PKCompactNavigationContainerController insertBackgroundLevelView:](self, "insertBackgroundLevelView:");
  }
}

- (void)viewWillLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentAuthorizationServiceCompactNavigationContainerController;
  [(PKCompactNavigationContainerController *)&v6 viewWillLayoutSubviews];
  if (!self->_rotationCount)
  {
    physicalButtonView = self->_physicalButtonView;
    if (physicalButtonView) {
      [(LAUIPhysicalButtonView *)physicalButtonView updateFrame];
    }
    cameraArrowView = self->_cameraArrowView;
    if (cameraArrowView) {
      self->_cameraOrientationSupported = [(LAUIHorizontalArrowView *)cameraArrowView pkui_updateFrame];
    }
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __91__PKPaymentAuthorizationServiceCompactNavigationContainerController_viewWillLayoutSubviews__block_invoke;
  v5[3] = &unk_1E59CA7D0;
  v5[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v5];
}

void *__91__PKPaymentAuthorizationServiceCompactNavigationContainerController_viewWillLayoutSubviews__block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  objc_super v3 = (void *)result[166];
  if (v3)
  {
    objc_msgSend(v3, "setAnimating:", objc_msgSend(result, "_effectiveShowPhysicalButtonIndicator"));
    result = *(void **)(a1 + 32);
  }
  v4 = (void *)result[165];
  if (v4)
  {
    uint64_t v5 = [result _effectiveShowCameraIndicator];
    return (void *)[v4 setAnimating:v5];
  }
  return result;
}

- (void)_createSecondaryViewsIfNecessary
{
  if (!self->_attemptedSecondaryViewCreation)
  {
    self->_attemptedSecondaryViewCreation = 1;
    if (PKUserIntentIsAvailable())
    {
      objc_super v3 = (LAUIPhysicalButtonView *)[objc_alloc(MEMORY[0x1E4F72FE0]) initWithStyle:1];
      physicalButtonView = self->_physicalButtonView;
      self->_physicalButtonView = v3;
    }
    uint64_t v5 = [(PKPaymentAuthorizationServiceCompactNavigationContainerController *)self traitCollection];
    uint64_t v6 = [v5 userInterfaceIdiom];

    if (PKPearlIsAvailable() && (v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      [(PKCompactNavigationContainerController *)self setDidMoveToWindowDirtiesLayout:1];
      id v7 = (LAUIHorizontalArrowView *)objc_alloc_init(MEMORY[0x1E4F72FC8]);
      cameraArrowView = self->_cameraArrowView;
      self->_cameraArrowView = v7;

      uint64_t v9 = self->_cameraArrowView;
      [(LAUIHorizontalArrowView *)v9 sizeToFit];
    }
  }
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = (PKPaymentAuthorizationServiceCompactNavigationContainerController *)a3;
  if (v7 != self)
  {
    v8 = [(PKCompactNavigationContainerController *)self containedNavigationController];

    if (v8 != v7)
    {
      v13.receiver = self;
      v13.super_class = (Class)PKPaymentAuthorizationServiceCompactNavigationContainerController;
      -[PKPaymentAuthorizationServiceCompactNavigationContainerController sizeForChildContentContainer:withParentContainerSize:](&v13, sel_sizeForChildContentContainer_withParentContainerSize_, v7, width, height);
      double width = v9;
      double height = v10;
    }
  }

  double v11 = width;
  double v12 = height;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (int)_preferredStatusBarVisibility
{
  return 1;
}

- (LAUIPhysicalButtonView)physicalButtonView
{
  [(PKPaymentAuthorizationServiceCompactNavigationContainerController *)self _createSecondaryViewsIfNecessary];
  physicalButtonView = self->_physicalButtonView;

  return physicalButtonView;
}

- (void)setShowPhysicalButtonIndicator:(BOOL)a3
{
  if (self->_showPhysicalButtonIndicator != a3)
  {
    self->_showPhysicalButtonIndicator = a3;
    physicalButtonView = self->_physicalButtonView;
    if (physicalButtonView)
    {
      BOOL v4 = [(PKPaymentAuthorizationServiceCompactNavigationContainerController *)self _effectiveShowPhysicalButtonIndicator];
      [(LAUIPhysicalButtonView *)physicalButtonView setAnimating:v4];
    }
  }
}

- (BOOL)_effectiveShowPhysicalButtonIndicator
{
  return !self->_rotationCount && self->_showPhysicalButtonIndicator;
}

- (void)setShowCameraIndicator:(BOOL)a3
{
  if (self->_showCameraIndicator != a3)
  {
    self->_showCameraIndicator = a3;
    cameraArrowView = self->_cameraArrowView;
    if (cameraArrowView)
    {
      BOOL v4 = [(PKPaymentAuthorizationServiceCompactNavigationContainerController *)self _effectiveShowCameraIndicator];
      [(LAUIHorizontalArrowView *)cameraArrowView setAnimating:v4];
    }
  }
}

- (BOOL)_effectiveShowCameraIndicator
{
  return !self->_rotationCount && self->_cameraOrientationSupported && self->_showCameraIndicator;
}

- (BOOL)showPhysicalButtonIndicator
{
  return self->_showPhysicalButtonIndicator;
}

- (BOOL)showCameraIndicator
{
  return self->_showCameraIndicator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicalButtonView, 0);

  objc_storeStrong((id *)&self->_cameraArrowView, 0);
}

@end