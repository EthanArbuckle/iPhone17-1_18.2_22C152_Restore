@interface PUAdjustmentsToolController
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canResetToDefaultValue;
- (BOOL)wantsSliderKeyControl;
- (BOOL)wantsZoomAndPanEnabled;
- (CEKBadgeTextView)badgeView;
- (PEAutoAdjustmentController)autoAdjustmentController;
- (PUAdjustmentsDataSource)dataSource;
- (PUAdjustmentsToolController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)_sliderLength;
- (double)ppt_valueIncrementForSelectedSlider;
- (double)ppt_visibleScaleValueForSelectedSlider;
- (id)_indexPathForAdjustmentCategory:(int64_t)a3;
- (id)adjustmentsRenderer:(id)a3;
- (id)centerToolbarView;
- (id)localizedName;
- (id)localizedResetToolActionTitle;
- (id)selectedToolbarIconGlyphName;
- (id)toolbarIconAccessibilityLabel;
- (id)toolbarIconGlyphName;
- (int64_t)initialAction;
- (int64_t)toolControllerTag;
- (void)_performInitialAction;
- (void)_ppt_scrollAfterDelay:(id)a3;
- (void)_updateBadgeTextWithInfo:(id)a3;
- (void)adjustmentsDataChanged:(id)a3;
- (void)adjustmentsViewControllerDidUpdateSelectedControl:(id)a3;
- (void)adjustmentsViewControllerSliderDidEndScrubbing:(id)a3;
- (void)adjustmentsViewControllerSliderWillBeginScrubbing:(id)a3;
- (void)adjustmentsViewControllerSliderWillEndScrubbing:(id)a3;
- (void)autoEnhanceActionStateChanged;
- (void)autoEnhanceAssets:(id)a3;
- (void)compositionControllerDidChangeForAdjustments:(id)a3;
- (void)configureForAdjustmentCategory:(int64_t)a3;
- (void)decreaseSliderValue:(BOOL)a3;
- (void)didBecomeActiveTool;
- (void)increaseSliderValue:(BOOL)a3;
- (void)ppt_selectSliderNamed:(id)a3 completion:(id)a4;
- (void)reactivate;
- (void)resetToDefaultValueAnimated:(BOOL)a3;
- (void)setAutoAdjustmentController:(id)a3;
- (void)setBackdropViewGroupName:(id)a3;
- (void)setBadgeView:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setFocusingViewForInteraction:(BOOL)a3;
- (void)setInitialAction:(int64_t)a3;
- (void)setLayoutOrientation:(int64_t)a3 withTransitionCoordinator:(id)a4;
- (void)setUseGradientBackground:(BOOL)a3 animated:(BOOL)a4;
- (void)setupWithAsset:(id)a3 compositionController:(id)a4 editSource:(id)a5 valuesCalculator:(id)a6;
- (void)specDidChange;
- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4;
- (void)validateCommand:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willBecomeActiveTool;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PUAdjustmentsToolController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_autoAdjustmentController, 0);
  objc_storeStrong((id *)&self->_solidBackgroundView, 0);
  objc_storeStrong((id *)&self->_backdropBackgroundView, 0);
  objc_storeStrong((id *)&self->_adjustmentPickerView, 0);
  objc_storeStrong((id *)&self->_adjustmentsViewController, 0);
}

- (void)setBadgeView:(id)a3
{
}

- (CEKBadgeTextView)badgeView
{
  return self->_badgeView;
}

- (void)setDataSource:(id)a3
{
}

- (PUAdjustmentsDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setInitialAction:(int64_t)a3
{
  self->_initialAction = a3;
}

- (int64_t)initialAction
{
  return self->_initialAction;
}

- (void)setAutoAdjustmentController:(id)a3
{
}

- (PEAutoAdjustmentController)autoAdjustmentController
{
  return self->_autoAdjustmentController;
}

- (void)_ppt_scrollAfterDelay:(id)a3
{
  id v3 = a3;
  dispatch_time_t v4 = dispatch_time(0, 5000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__PUAdjustmentsToolController__ppt_scrollAfterDelay___block_invoke;
  block[3] = &unk_1E5F2EBA0;
  id v7 = v3;
  id v5 = v3;
  dispatch_after(v4, MEMORY[0x1E4F14428], block);
}

uint64_t __53__PUAdjustmentsToolController__ppt_scrollAfterDelay___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (double)ppt_valueIncrementForSelectedSlider
{
  [(PUAdjustmentsViewController *)self->_adjustmentsViewController ppt_sliderValueIncrement];
  return result;
}

- (double)ppt_visibleScaleValueForSelectedSlider
{
  [(PUAdjustmentsViewController *)self->_adjustmentsViewController ppt_sliderVisibleScaleValue];
  return result;
}

- (void)ppt_selectSliderNamed:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PUAdjustmentsToolController *)self dataSource];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    v10 = [(PUAdjustmentsToolController *)self dataSource];
    uint64_t v11 = [v10 numberOfItemsInAllSections];

    if ((v11 & 0x8000000000000000) == 0)
    {
      uint64_t v12 = v11 + 1;
      goto LABEL_5;
    }
  }
  else
  {
    uint64_t v12 = 21;
LABEL_5:
    while (1)
    {
      v13 = [(PUAdjustmentsViewController *)self->_adjustmentsViewController selectedAdjustmentInfo];
      v14 = [v13 localizedName];
      uint64_t v15 = [v14 caseInsensitiveCompare:v6];

      if (!v15) {
        break;
      }
      [(PUAdjustmentsViewController *)self->_adjustmentsViewController ppt_selectNextAdjustment];
      if (!--v12) {
        goto LABEL_10;
      }
    }
    if (v7)
    {
      dispatch_time_t v16 = dispatch_time(0, 1000000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __64__PUAdjustmentsToolController_ppt_selectSliderNamed_completion___block_invoke;
      block[3] = &unk_1E5F2EBA0;
      id v18 = v7;
      dispatch_after(v16, MEMORY[0x1E4F14428], block);
    }
  }
LABEL_10:
}

uint64_t __64__PUAdjustmentsToolController_ppt_selectSliderNamed_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)autoEnhanceAssets:(id)a3
{
}

- (void)validateCommand:(id)a3
{
  id v8 = a3;
  if ((char *)[v8 action] == sel_autoEnhanceAssets_)
  {
    dispatch_time_t v4 = (void *)MEMORY[0x1E4F91118];
    id v5 = [(PUPhotoEditToolController *)self compositionController];
    LODWORD(v4) = [v4 isAutoEnhanceEnabledForCompositionController:v5];

    if (v4) {
      id v6 = @"MENU_ITEM_TITLE_REMOVE_AUTO_ENHANCEMENTS";
    }
    else {
      id v6 = @"MENU_ITEM_TITLE_AUTO_ENHANCE";
    }
    id v7 = PULocalizedString(v6);
    [v8 setDiscoverabilityTitle:v7];
  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (sel_autoEnhanceAssets_ == a3)
  {
    id v5 = [(PUAdjustmentsToolController *)self autoAdjustmentController];
    int v4 = [v5 isBusy] ^ 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PUAdjustmentsToolController;
    LOBYTE(v4) = -[PUAdjustmentsToolController canPerformAction:withSender:](&v7, sel_canPerformAction_withSender_);
  }
  return v4;
}

- (double)_sliderLength
{
  v2 = [(PUPhotoEditToolController *)self toolControllerSpec];
  [v2 sliderLength];
  double v4 = v3;

  return v4;
}

- (void)autoEnhanceActionStateChanged
{
  id v2 = [(PUPhotoEditToolController *)self delegate];
  [v2 updateProgressIndicatorAnimated:1];
}

- (id)adjustmentsRenderer:(id)a3
{
  double v4 = [(PUPhotoEditToolController *)self delegate];
  id v5 = [v4 toolControllerMainRenderer:self];

  return v5;
}

- (void)adjustmentsDataChanged:(id)a3
{
}

- (void)adjustmentsViewControllerSliderDidEndScrubbing:(id)a3
{
  [(PUPhotoEditToolController *)self setActivelyAdjusting:0];
  [(PUPhotoEditToolController *)self setPerformingLiveInteraction:0];
}

- (void)adjustmentsViewControllerSliderWillEndScrubbing:(id)a3
{
}

- (void)adjustmentsViewControllerSliderWillBeginScrubbing:(id)a3
{
  [(PUPhotoEditToolController *)self setActivelyAdjusting:1];
  [(PUPhotoEditToolController *)self setPerformingLiveInteraction:1];
}

- (void)adjustmentsViewControllerDidUpdateSelectedControl:(id)a3
{
  id v4 = [a3 selectedAdjustmentInfo];
  [(PUAdjustmentsToolController *)self _updateBadgeTextWithInfo:v4];
}

- (void)compositionControllerDidChangeForAdjustments:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUAdjustmentsToolController;
  [(PUPhotoEditToolController *)&v4 compositionControllerDidChangeForAdjustments:a3];
  [(PUAdjustmentsDataSource *)self->_dataSource compositionControllerDidChange];
}

- (void)specDidChange
{
  v2.receiver = self;
  v2.super_class = (Class)PUAdjustmentsToolController;
  [(PUPhotoEditToolController *)&v2 specDidChange];
}

- (void)setLayoutOrientation:(int64_t)a3 withTransitionCoordinator:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PUAdjustmentsToolController;
  [(PUPhotoEditToolController *)&v5 setLayoutOrientation:a3 withTransitionCoordinator:a4];
  [(PUAdjustmentsToolController *)self updateAdjustmentControls];
}

- (id)_indexPathForAdjustmentCategory:(int64_t)a3
{
  objc_super v5 = [(PUAdjustmentsToolController *)self dataSource];
  uint64_t v6 = [v5 numberOfSections];

  if (v6)
  {
    unint64_t v7 = 0;
    uint64_t v25 = *MEMORY[0x1E4F8A3F0];
    do
    {
      id v8 = [(PUAdjustmentsToolController *)self dataSource];
      uint64_t v9 = [v8 numberOfItemsInSection:v7];

      if (v9)
      {
        unint64_t v10 = 0;
        while (2)
        {
          uint64_t v11 = [MEMORY[0x1E4F28D58] indexPathForItem:v10 inSection:v7];
          uint64_t v12 = [(PUAdjustmentsToolController *)self dataSource];
          v13 = [v12 infoForItemAtIndexPath:v11];

          switch(a3)
          {
            case 0:
              v14 = [v13 identifier];
              int v15 = [v14 isEqualToString:v25];

              if (!v15) {
                goto LABEL_12;
              }
              goto LABEL_15;
            case 1:
              dispatch_time_t v16 = [v13 settingKey];
              uint64_t v17 = [MEMORY[0x1E4F8A3C0] offsetExposureKey];
              goto LABEL_11;
            case 2:
              dispatch_time_t v16 = [v13 settingKey];
              uint64_t v17 = [MEMORY[0x1E4F8A3B8] offsetSaturationKey];
              goto LABEL_11;
            case 3:
              dispatch_time_t v16 = [v13 settingKey];
              uint64_t v17 = [MEMORY[0x1E4F8A3E0] warmTempKey];
LABEL_11:
              id v18 = (void *)v17;
              char v19 = [v16 isEqualToString:v17];

              if ((v19 & 1) == 0) {
                goto LABEL_12;
              }
LABEL_15:

              goto LABEL_16;
            default:
LABEL_12:

              ++v10;
              v20 = [(PUAdjustmentsToolController *)self dataSource];
              unint64_t v21 = [v20 numberOfItemsInSection:v7];

              if (v10 >= v21) {
                break;
              }
              continue;
          }
          break;
        }
      }
      ++v7;
      v22 = [(PUAdjustmentsToolController *)self dataSource];
      unint64_t v23 = [v22 numberOfSections];
    }
    while (v7 < v23);
  }
  uint64_t v11 = 0;
LABEL_16:
  return v11;
}

- (void)configureForAdjustmentCategory:(int64_t)a3
{
  objc_super v4 = [(PUAdjustmentsToolController *)self _indexPathForAdjustmentCategory:a3];
  if (v4)
  {
    objc_super v5 = v4;
    [(PUAdjustmentsViewController *)self->_adjustmentsViewController selectAdjustmentInfoAtIndexPath:v4];
    objc_super v4 = v5;
  }
}

- (void)setFocusingViewForInteraction:(BOOL)a3
{
}

- (int64_t)toolControllerTag
{
  return 1002;
}

- (void)didBecomeActiveTool
{
  double v3 = [(PUAdjustmentsToolController *)self view];
  objc_super v4 = [v3 layer];
  [v4 setAllowsGroupOpacity:1];

  v5.receiver = self;
  v5.super_class = (Class)PUAdjustmentsToolController;
  [(PUPhotoEditToolController *)&v5 didBecomeActiveTool];
}

- (void)_performInitialAction
{
  if ([(PUAdjustmentsToolController *)self initialAction] == 1) {
    [(PUAdjustmentsViewController *)self->_adjustmentsViewController toggleAutoEnhance];
  }
  [(PUAdjustmentsToolController *)self setInitialAction:0];
}

- (void)willBecomeActiveTool
{
  v5.receiver = self;
  v5.super_class = (Class)PUAdjustmentsToolController;
  [(PUPhotoEditToolController *)&v5 willBecomeActiveTool];
  double v3 = [(PUAdjustmentsToolController *)self view];
  objc_super v4 = [v3 layer];
  [v4 setAllowsGroupOpacity:0];

  [(PUAdjustmentsToolController *)self updateAdjustmentControls];
}

- (void)decreaseSliderValue:(BOOL)a3
{
}

- (void)increaseSliderValue:(BOOL)a3
{
}

- (BOOL)wantsSliderKeyControl
{
  return 1;
}

- (BOOL)wantsZoomAndPanEnabled
{
  return 1;
}

- (void)resetToDefaultValueAnimated:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PUAdjustmentsToolController;
  [(PUPhotoEditToolController *)&v3 resetToDefaultValueAnimated:a3];
}

- (id)localizedResetToolActionTitle
{
  return PULocalizedString(@"PHOTOEDIT_RESET_LIGHT_AND_COLOR");
}

- (BOOL)canResetToDefaultValue
{
  objc_super v4 = [(PUPhotoEditToolController *)self delegate];
  objc_super v5 = [v4 toolControllerUneditedCompositionController:self];

  if (!v5)
  {
    unint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"PUAdjustmentsToolController.m" lineNumber:394 description:@"Cannot continue without a base composition."];
  }
  return 0;
}

- (id)centerToolbarView
{
  objc_super v2 = +[PUInterfaceManager currentTheme];
  objc_super v3 = PULocalizedString(@"PHOTOEDIT_ADJUSTMENTS_TOP_LABEL");
  objc_super v4 = [v3 localizedUppercaseString];

  objc_super v5 = [v2 photoEditingTopToolbarToolLabelButtonColor];
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 setText:v4];
  [v6 setTextColor:v5];
  unint64_t v7 = [v2 topToolbarToolLabelFont];
  [v6 setFont:v7];

  return v6;
}

- (id)toolbarIconAccessibilityLabel
{
  return PULocalizedString(@"PHOTOEDIT_ADJUST_TOOLBAR_BUTTON_AX_LABEL");
}

- (id)selectedToolbarIconGlyphName
{
  return @"dial.min.fill";
}

- (id)toolbarIconGlyphName
{
  return @"dial.min";
}

- (id)localizedName
{
  return PULocalizedString(@"PHOTOEDIT_ADJUSTMENTS_TOOL_BUTTON");
}

- (void)_updateBadgeTextWithInfo:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(PUAdjustmentsToolController *)self badgeView];
  id v6 = [v4 localizedName];

  unint64_t v7 = [v6 localizedUppercaseString];
  [v5 _setText:v7];

  id v8 = [(PUAdjustmentsToolController *)self badgeView];
  [v8 sizeToFit];
}

- (void)setBackdropViewGroupName:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->super._backdropViewGroupName, "isEqualToString:"))
  {
    id v4 = (NSString *)[v6 copy];
    backdropViewGroupName = self->super._backdropViewGroupName;
    self->super._backdropViewGroupName = v4;

    [(_UIBackdropView *)self->_backdropBackgroundView setGroupName:self->super._backdropViewGroupName];
  }
}

- (void)setUseGradientBackground:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_useTranslucentBackground != a3)
  {
    self->_useTranslucentBackground = a3;
    [(PUAdjustmentsToolController *)self _updateBackgroundAnimated:a4];
  }
}

- (void)reactivate
{
  objc_super v3 = [(PUPhotoEditToolController *)self ppt_didBecomeActiveToolBlock];

  if (v3)
  {
    id v4 = [(PUPhotoEditToolController *)self ppt_didBecomeActiveToolBlock];
    v4[2]();
  }
}

- (void)setupWithAsset:(id)a3 compositionController:(id)a4 editSource:(id)a5 valuesCalculator:(id)a6
{
  v13.receiver = self;
  v13.super_class = (Class)PUAdjustmentsToolController;
  [(PUPhotoEditToolController *)&v13 setupWithAsset:a3 compositionController:a4 editSource:a5 valuesCalculator:a6];
  unint64_t v7 = [(PUPhotoEditToolController *)self delegate];
  uint64_t v8 = [v7 toolControllerSourceAssetType:self];

  uint64_t v9 = [(PUAdjustmentsToolController *)self dataSource];
  unint64_t v10 = [(PUPhotoEditToolController *)self compositionController];
  uint64_t v11 = [(PUPhotoEditToolController *)self valuesCalculator];
  uint64_t v12 = [(PUAdjustmentsToolController *)self autoAdjustmentController];
  [v9 setupWithCompositionController:v10 valuesCalculator:v11 autoAdjustmentController:v12 assetType:v8];
}

- (void)viewDidLayoutSubviews
{
  v63.receiver = self;
  v63.super_class = (Class)PUAdjustmentsToolController;
  [(PUPhotoEditToolController *)&v63 viewDidLayoutSubviews];
  int64_t v3 = [(PUPhotoEditToolController *)self layoutOrientation];
  id v4 = [(PUPhotoEditToolController *)self photoEditSpec];
  uint64_t v5 = [v4 currentLayoutStyle];

  id v6 = [(PUAdjustmentsToolController *)self view];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  if (v5 == 4)
  {
    int v15 = [(PUPhotoEditToolController *)self toolContainerView];
    [v15 bounds];
    -[UIView setFrame:](self->_adjustmentPickerView, "setFrame:");

    [(PUAdjustmentsViewController *)self->_adjustmentsViewController setLayoutDirection:1];
    dispatch_time_t v16 = [(PUPhotoEditToolController *)self toolContainerView];
    [v16 frame];
    double MinX = CGRectGetMinX(v64);

    id v18 = [(PUPhotoEditToolController *)self toolContainerView];
    [v18 center];
    double v20 = v19;

    unint64_t v21 = [(PUAdjustmentsToolController *)self badgeView];
    [v21 bounds];
    double v23 = MinX + v22 * -0.5 + -6.0;
LABEL_5:

    v32 = [(PUAdjustmentsToolController *)self badgeView];
    objc_msgSend(v32, "setCenter:", v23, v20);
    goto LABEL_10;
  }
  if (v3 == 1)
  {
    [(PUAdjustmentsViewController *)self->_adjustmentsViewController setLayoutDirection:0];
    adjustmentPickerView = self->_adjustmentPickerView;
    long long v25 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v62[0] = *MEMORY[0x1E4F1DAB8];
    v62[1] = v25;
    v62[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [(UIView *)adjustmentPickerView setTransform:v62];
    v26 = [(PUPhotoEditToolController *)self toolContainerView];
    [v26 frame];
    -[UIView setFrame:](self->_adjustmentPickerView, "setFrame:");

    v27 = [(PUPhotoEditToolController *)self toolContainerView];
    [v27 bounds];
    UIRectGetCenter();
    -[UIView setCenter:](self->_adjustmentPickerView, "setCenter:");

    v28 = [(PUPhotoEditToolController *)self toolContainerView];
    [v28 frame];
    double MinY = CGRectGetMinY(v65);

    UIRectGetCenter();
    double v23 = v30;
    unint64_t v21 = [(PUAdjustmentsToolController *)self badgeView];
    [v21 bounds];
    double v20 = MinY + v31 * -0.5 + -6.0;
    goto LABEL_5;
  }
  v33 = [(PUPhotoEditToolController *)self toolContainerView];
  [v33 bounds];
  -[UIView setFrame:](self->_adjustmentPickerView, "setFrame:");

  [(PUAdjustmentsViewController *)self->_adjustmentsViewController setLayoutDirection:1];
  v34 = [(PUPhotoEditToolController *)self delegate];
  v35 = [v34 toolControllerMainContainerView:self];
  v36 = v35;
  if (v35)
  {
    id v37 = v35;
  }
  else
  {
    id v37 = [(PUAdjustmentsToolController *)self view];
  }
  v32 = v37;

  [v32 bounds];
  UIRectGetCenter();
  double v39 = v38;
  v40 = [(PUAdjustmentsToolController *)self view];
  [v40 safeAreaInsets];
  CGFloat v42 = v8 + v41;
  CGFloat v44 = v10 + v43;
  CGFloat v46 = v12 - (v41 + v45);
  CGFloat v48 = v14 - (v43 + v47);

  v66.origin.x = v42;
  v66.origin.y = v44;
  v66.size.width = v46;
  v66.size.height = v48;
  double MaxY = CGRectGetMaxY(v66);
  v50 = [(PUAdjustmentsToolController *)self badgeView];
  [v50 bounds];
  double v52 = MaxY + v51 * -0.5;

  v53 = [(PUAdjustmentsToolController *)self badgeView];
  objc_msgSend(v53, "setCenter:", v39, v52);

LABEL_10:
  v54 = [(PUPhotoEditToolController *)self toolContainerView];
  [v54 frame];
  double v56 = v55;
  v57 = [(PUPhotoEditToolController *)self toolContainerView];
  [v57 frame];
  -[_UIBackdropView setFrame:](self->_backdropBackgroundView, "setFrame:", 0.0, 0.0, v56);

  v58 = [(PUPhotoEditToolController *)self toolContainerView];
  [v58 frame];
  double v60 = v59;
  v61 = [(PUPhotoEditToolController *)self toolContainerView];
  [v61 frame];
  -[UIView setFrame:](self->_solidBackgroundView, "setFrame:", 0.0, 0.0, v60);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)PUAdjustmentsToolController;
  -[PUPhotoEditToolController viewWillTransitionToSize:withTransitionCoordinator:](&v4, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)PUAdjustmentsToolController;
  [(PUAdjustmentsToolController *)&v4 willTransitionToTraitCollection:a3 withTransitionCoordinator:a4];
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PUAdjustmentsToolController;
  [(PUPhotoEditToolController *)&v6 traitEnvironment:a3 didChangeTraitCollection:a4];
  uint64_t v5 = [(PUAdjustmentsViewController *)self->_adjustmentsViewController selectedAdjustmentInfo];
  [(PUAdjustmentsToolController *)self _updateBadgeTextWithInfo:v5];
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)PUAdjustmentsToolController;
  [(PUPhotoEditToolController *)&v6 viewDidAppear:a3];
  if (self->_viewLoadingStartTime >= 1)
  {
    objc_super v4 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      double v5 = (double)(mach_absolute_time() - self->_viewLoadingStartTime) / 1000000.0;
      *(_DWORD *)buf = 134217984;
      double v8 = v5;
      _os_log_impl(&dword_1AE9F8000, v4, OS_LOG_TYPE_DEFAULT, "PUAdjustmentsToolController loading took: %.3fms", buf, 0xCu);
    }

    self->_viewLoadingStartTime = 0;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUAdjustmentsToolController;
  [(PUPhotoEditToolController *)&v4 viewWillAppear:a3];
  self->_viewLoadingStartTime = mach_absolute_time();
  [(PUAdjustmentsToolController *)self updateAdjustmentControls];
}

- (void)viewDidLoad
{
  v35.receiver = self;
  v35.super_class = (Class)PUAdjustmentsToolController;
  [(PUAdjustmentsToolController *)&v35 viewDidLoad];
  int64_t v3 = objc_alloc_init(PUAdjustmentsToolControllerSpec);
  [(PUPhotoEditToolController *)self setToolControllerSpec:v3];
  objc_super v4 = [(PUPhotoEditToolController *)self toolContainerView];
  double v5 = (_UIBackdropView *)[objc_alloc(MEMORY[0x1E4FB1FE0]) initWithPrivateStyle:2030];
  backdropBackgroundView = self->_backdropBackgroundView;
  self->_backdropBackgroundView = v5;

  [(_UIBackdropView *)self->_backdropBackgroundView setHidden:1];
  double v7 = [(_UIBackdropView *)self->_backdropBackgroundView layer];
  [v7 setAllowsGroupOpacity:0];

  double v8 = [(_UIBackdropView *)self->_backdropBackgroundView groupName];
  backdropViewGroupName = self->super._backdropViewGroupName;
  self->super._backdropViewGroupName = v8;

  [v4 addSubview:self->_backdropBackgroundView];
  double v10 = +[PUInterfaceManager currentTheme];
  double v11 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  solidBackgroundView = self->_solidBackgroundView;
  self->_solidBackgroundView = v11;

  double v13 = [v10 photoEditingSolidBackgroundViewColor];
  [(UIView *)self->_solidBackgroundView setBackgroundColor:v13];

  [(UIView *)self->_solidBackgroundView setAlpha:0.0];
  [v4 addSubview:self->_solidBackgroundView];
  [(PUAdjustmentsToolController *)self addChildViewController:self->_adjustmentsViewController];
  double v14 = [(PUAdjustmentsViewController *)self->_adjustmentsViewController view];
  adjustmentPickerView = self->_adjustmentPickerView;
  self->_adjustmentPickerView = v14;

  [v4 addSubview:self->_adjustmentPickerView];
  [(PUAdjustmentsViewController *)self->_adjustmentsViewController didMoveToParentViewController:self];
  id v16 = objc_alloc(MEMORY[0x1E4F57D38]);
  uint64_t v17 = objc_msgSend(v16, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(PUAdjustmentsToolController *)self setBadgeView:v17];

  id v18 = [(PUAdjustmentsToolController *)self badgeView];
  [v18 setUserInteractionEnabled:0];

  double v19 = [v10 photoEditingBadgeViewFillColor];
  double v20 = [(PUAdjustmentsToolController *)self badgeView];
  [v20 _setFillColor:v19];

  unint64_t v21 = [v10 photoEditingBadgeViewContentColor];
  double v22 = [(PUAdjustmentsToolController *)self badgeView];
  [v22 _setContentColor:v21];

  double v23 = [(PUAdjustmentsToolController *)self badgeView];
  [v23 _setFillCornerRadius:4.0];

  [MEMORY[0x1E4F57D38] _defaultTextInsets];
  double v25 = v24 + 3.0;
  double v27 = v26 + 3.0;
  double v29 = v28 + 1.0;
  double v31 = v30 + 1.0;
  v32 = [(PUAdjustmentsToolController *)self badgeView];
  objc_msgSend(v32, "_setTextInsets:", v31, v25, v29, v27);

  v33 = [(PUAdjustmentsToolController *)self view];
  v34 = [(PUAdjustmentsToolController *)self badgeView];
  [v33 addSubview:v34];
}

- (PUAdjustmentsToolController)initWithNibName:(id)a3 bundle:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)PUAdjustmentsToolController;
  objc_super v4 = [(PUPhotoEditToolController *)&v13 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    double v5 = objc_alloc_init(PUAdjustmentsDataSource);
    dataSource = v4->_dataSource;
    v4->_dataSource = v5;

    [(PUAdjustmentsDataSource *)v4->_dataSource setDelegate:v4];
    double v7 = objc_alloc_init(PUAdjustmentsViewController);
    adjustmentsViewController = v4->_adjustmentsViewController;
    v4->_adjustmentsViewController = v7;

    [(PUAdjustmentsViewController *)v4->_adjustmentsViewController setDelegate:v4];
    [(PUAdjustmentsViewController *)v4->_adjustmentsViewController setDataSource:v4->_dataSource];
    uint64_t v9 = (PEAutoAdjustmentController *)objc_alloc_init(MEMORY[0x1E4F91118]);
    autoAdjustmentController = v4->_autoAdjustmentController;
    v4->_autoAdjustmentController = v9;

    double v11 = objc_alloc_init(PUAdjustmentsToolControllerSpec);
    [(PUPhotoEditToolController *)v4 setToolControllerSpec:v11];
  }
  return v4;
}

@end