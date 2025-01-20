@interface PUWallpaperPosterEditDebugViewController
- (BOOL)isPerspectiveZoomEnabled;
- (BOOL)prefersStatusBarHidden;
- (BOOL)pu_canApplyParallaxToViews;
- (BOOL)pu_idleTimerDisabled;
- (BOOL)pu_isDepthEffectDisallowed;
- (NSArray)availableLooks;
- (PUPosterEditingLook)pu_currentLook;
- (PUWallpaperPosterDateView)dateView;
- (PUWallpaperPosterEditDebugViewController)initWithAsset:(id)a3;
- (PUWallpaperPosterEditDebugViewController)initWithAsset:(id)a3 posterType:(int64_t)a4;
- (PUWallpaperPosterEditDebugViewController)initWithAssets:(id)a3 posterType:(int64_t)a4 photoLibrary:(id)a5;
- (PUWallpaperPosterEditDebugViewController)initWithExistingConfiguration:(id)a3 assetDirectory:(id)a4 overrideConfiguration:(id)a5 photoLibrary:(id)a6;
- (PUWallpaperPosterEditDebugViewController)initWithMigratorOfLegacyConfigurationType:(unint64_t)a3 photoLibrary:(id)a4;
- (PUWallpaperPosterEditDebugViewController)initWithPosterType:(int64_t)a3 photoLibrary:(id)a4;
- (PUWallpaperPosterEditToolBar)editToolBar;
- (PUWallpaperPosterEditorController)posterEditorController;
- (UIAction)pu_placeholderAction;
- (UIAction)tapToRadarAction;
- (UIButton)lookLabelButton;
- (UIEdgeInsets)pu_editingChromeDodgingInsets;
- (UIPageControl)pageControl;
- (UIScrollView)looksScrollView;
- (UIView)backgroundView;
- (UIView)contentOverlayView;
- (UIView)floatingView;
- (UIView)foregroundView;
- (_PUWallpaperPosterEditorDebugEnvironment)editEnvironment;
- (_PUWallpaperPosterEditorDebugPreferences)editPreferences;
- (id)colorPickerChangeHandler;
- (id)pu_disableIdleTimer;
- (id)pu_viewForMenuElementIdentifier:(id)a3;
- (int64_t)currentLookIndex;
- (void)_dismissAndCancel:(id)a3;
- (void)_dismissAndSave:(id)a3;
- (void)_handlePageControlSelectedPage:(id)a3;
- (void)_setupEditorViews;
- (void)_setupPosterEditorController;
- (void)_setupSimulatedControls;
- (void)_updateLookControls;
- (void)_updateLookProperties;
- (void)_updateLooks;
- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5;
- (void)colorPickerViewControllerDidFinish:(id)a3;
- (void)presentColorPickerWithConfiguration:(id)a3 changeHandler:(id)a4;
- (void)pu_requestDismissalWithAction:(int64_t)a3;
- (void)px_updatePreferences:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setAvailableLooks:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setColorPickerChangeHandler:(id)a3;
- (void)setContentOverlayView:(id)a3;
- (void)setCurrentLookIndex:(int64_t)a3;
- (void)setDateView:(id)a3;
- (void)setEditEnvironment:(id)a3;
- (void)setEditPreferences:(id)a3;
- (void)setEditToolBar:(id)a3;
- (void)setFloatingView:(id)a3;
- (void)setForegroundView:(id)a3;
- (void)setLookLabelButton:(id)a3;
- (void)setLooksScrollView:(id)a3;
- (void)setPageControl:(id)a3;
- (void)setPerspectiveZoomEnabled:(BOOL)a3;
- (void)setPosterEditorController:(id)a3;
- (void)setTapToRadarAction:(id)a3;
- (void)updateActions;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation PUWallpaperPosterEditDebugViewController

- (void).cxx_destruct
{
  objc_storeStrong(&self->_colorPickerChangeHandler, 0);
  objc_storeStrong((id *)&self->_editPreferences, 0);
  objc_storeStrong((id *)&self->_editEnvironment, 0);
  objc_storeStrong((id *)&self->_dateView, 0);
  objc_storeStrong((id *)&self->_lookLabelButton, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_tapToRadarAction, 0);
  objc_storeStrong((id *)&self->_editToolBar, 0);
  objc_storeStrong((id *)&self->_contentOverlayView, 0);
  objc_storeStrong((id *)&self->_floatingView, 0);
  objc_storeStrong((id *)&self->_foregroundView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_looksScrollView, 0);
  objc_storeStrong((id *)&self->_availableLooks, 0);
  objc_storeStrong((id *)&self->_posterEditorController, 0);
}

- (void)setColorPickerChangeHandler:(id)a3
{
}

- (id)colorPickerChangeHandler
{
  return self->_colorPickerChangeHandler;
}

- (void)setEditPreferences:(id)a3
{
}

- (_PUWallpaperPosterEditorDebugPreferences)editPreferences
{
  return self->_editPreferences;
}

- (void)setEditEnvironment:(id)a3
{
}

- (_PUWallpaperPosterEditorDebugEnvironment)editEnvironment
{
  return self->_editEnvironment;
}

- (void)setDateView:(id)a3
{
}

- (PUWallpaperPosterDateView)dateView
{
  return self->_dateView;
}

- (void)setLookLabelButton:(id)a3
{
}

- (UIButton)lookLabelButton
{
  return self->_lookLabelButton;
}

- (void)setPageControl:(id)a3
{
}

- (UIPageControl)pageControl
{
  return self->_pageControl;
}

- (void)setTapToRadarAction:(id)a3
{
}

- (UIAction)tapToRadarAction
{
  return self->_tapToRadarAction;
}

- (void)setEditToolBar:(id)a3
{
}

- (PUWallpaperPosterEditToolBar)editToolBar
{
  return self->_editToolBar;
}

- (void)setContentOverlayView:(id)a3
{
}

- (UIView)contentOverlayView
{
  return self->_contentOverlayView;
}

- (void)setFloatingView:(id)a3
{
}

- (UIView)floatingView
{
  return self->_floatingView;
}

- (void)setForegroundView:(id)a3
{
}

- (UIView)foregroundView
{
  return self->_foregroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setLooksScrollView:(id)a3
{
}

- (UIScrollView)looksScrollView
{
  return self->_looksScrollView;
}

- (void)setCurrentLookIndex:(int64_t)a3
{
  self->_currentLookIndex = a3;
}

- (int64_t)currentLookIndex
{
  return self->_currentLookIndex;
}

- (void)setAvailableLooks:(id)a3
{
}

- (NSArray)availableLooks
{
  return self->_availableLooks;
}

- (void)setPosterEditorController:(id)a3
{
}

- (PUWallpaperPosterEditorController)posterEditorController
{
  return self->_posterEditorController;
}

- (void)setPerspectiveZoomEnabled:(BOOL)a3
{
  self->_perspectiveZoomEnabled = a3;
}

- (BOOL)isPerspectiveZoomEnabled
{
  return self->_perspectiveZoomEnabled;
}

- (UIEdgeInsets)pu_editingChromeDodgingInsets
{
  double v2 = *MEMORY[0x1E4FB2848];
  double v3 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v4 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)pu_viewForMenuElementIdentifier:(id)a3
{
  id v4 = a3;
  double v5 = [(PUWallpaperPosterEditDebugViewController *)self editToolBar];
  v6 = [v5 viewForMenuElementIdentifier:v4];

  return v6;
}

- (UIAction)pu_placeholderAction
{
  double v2 = (void *)MEMORY[0x1E4FB13F0];
  double v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"slowmo"];
  id v4 = [v2 actionWithTitle:@"Loading" image:v3 identifier:@"Loading" handler:&__block_literal_global_512];

  return (UIAction *)v4;
}

- (id)pu_disableIdleTimer
{
  double v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v2 setIdleTimerDisabled:1];

  double v3 = objc_alloc_init(_PUWallpaperPosterDebugIdleTimerAssertion);
  return v3;
}

- (BOOL)pu_idleTimerDisabled
{
  double v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  char v3 = [v2 isIdleTimerDisabled];

  return v3;
}

- (BOOL)pu_isDepthEffectDisallowed
{
  return 0;
}

- (void)pu_requestDismissalWithAction:(int64_t)a3
{
  if (a3)
  {
    if (a3 == 1) {
      [(PUWallpaperPosterEditDebugViewController *)self _dismissAndSave:self];
    }
  }
  else
  {
    [(PUWallpaperPosterEditDebugViewController *)self _dismissAndCancel:self];
  }
}

- (void)updateActions
{
  id v6 = [(PUWallpaperPosterEditDebugViewController *)self posterEditorController];
  char v3 = [v6 leadingMenuElementsForEditor:self];
  id v4 = [v6 trailingMenuElementsForEditor:self];
  double v5 = [(PUWallpaperPosterEditDebugViewController *)self editToolBar];
  [v5 setLeadingMenuElements:v3];
  [v5 setTrailingMenuElements:v4];
}

- (PUPosterEditingLook)pu_currentLook
{
  char v3 = [(PUWallpaperPosterEditDebugViewController *)self availableLooks];
  id v4 = objc_msgSend(v3, "objectAtIndexedSubscript:", -[PUWallpaperPosterEditDebugViewController currentLookIndex](self, "currentLookIndex"));

  return (PUPosterEditingLook *)v4;
}

- (void)px_updatePreferences:(id)a3
{
  id v4 = (void (**)(id, void *, _PUWallpaperDebugTransition *))a3;
  id v6 = objc_alloc_init(_PUWallpaperDebugTransition);
  double v5 = [(PUWallpaperPosterEditDebugViewController *)self editPreferences];
  v4[2](v4, v5, v6);
}

- (BOOL)pu_canApplyParallaxToViews
{
  return 0;
}

- (void)presentColorPickerWithConfiguration:(id)a3 changeHandler:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = (objc_class *)MEMORY[0x1E4FB1628];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  v10 = [v8 prompt];

  [v9 setTitle:v10];
  [v9 setDelegate:self];
  [v9 setModalPresentationStyle:1];
  v11 = [v9 sheetPresentationController];
  v12 = [MEMORY[0x1E4FB1C30] mediumDetent];
  v14[0] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v11 setDetents:v13];

  [(PUWallpaperPosterEditDebugViewController *)self setColorPickerChangeHandler:v7];
  [(PUWallpaperPosterEditDebugViewController *)self presentViewController:v9 animated:1 completion:0];
}

- (void)colorPickerViewControllerDidFinish:(id)a3
{
}

- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5
{
  id v8 = a4;
  id v6 = [(PUWallpaperPosterEditDebugViewController *)self colorPickerChangeHandler];

  if (v6)
  {
    id v7 = [(PUWallpaperPosterEditDebugViewController *)self colorPickerChangeHandler];
    ((void (**)(void, id))v7)[2](v7, v8);
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  [v4 contentOffset];
  double v6 = v5;
  double v8 = v7;
  [v4 frame];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  v35.origin.x = v10;
  v35.origin.y = v12;
  v35.size.width = v14;
  v35.size.height = v16;
  double __y = 0.0;
  double v17 = v6 / CGRectGetWidth(v35);
  double v18 = modf(v17, &__y);
  double v19 = __y;
  uint64_t v20 = (uint64_t)__y;
  v21 = [(PUWallpaperPosterEditDebugViewController *)self pageControl];
  [v21 setCurrentPage:v20];

  id v32 = [(PUWallpaperPosterEditDebugViewController *)self pu_currentLook];
  v22 = [(PUWallpaperPosterEditDebugViewController *)self availableLooks];
  v23 = [(PUWallpaperPosterEditDebugViewController *)self contentOverlayView];
  [v23 frame];
  objc_msgSend(v23, "setFrame:", v6, v8);
  if ([v22 count] > (unint64_t)v19)
  {
    id v24 = [v22 objectAtIndex:vcvtmd_u64_f64(v17)];
    uint64_t v25 = [v22 count];
    unint64_t v26 = vcvtpd_u64_f64(v17);
    if (v25 - 1 >= v26) {
      unint64_t v27 = v26;
    }
    else {
      unint64_t v27 = v25 - 1;
    }
    id v28 = [v22 objectAtIndex:v27];
    if (v24 != v28)
    {
      if (v24 == v32) {
        v29 = v28;
      }
      else {
        v29 = v24;
      }
      if (v24 != v32) {
        double v18 = 1.0 - v18;
      }
      id v30 = v29;
      v31 = [(PUWallpaperPosterEditDebugViewController *)self posterEditorController];
      [v31 editor:self didTransitionToLook:v30 progress:v18];
    }
    [(PUWallpaperPosterEditDebugViewController *)self setCurrentLookIndex:v20];
    [(PUWallpaperPosterEditDebugViewController *)self _updateLookControls];
  }
}

- (void)_handlePageControlSelectedPage:(id)a3
{
  id v4 = a3;
  id v8 = [(PUWallpaperPosterEditDebugViewController *)self looksScrollView];
  BOOL v5 = [v4 interactionState] == 1;
  [v8 frame];
  double Width = CGRectGetWidth(v10);
  uint64_t v7 = [v4 currentPage];

  objc_msgSend(v8, "setContentOffset:animated:", v5, Width * (double)v7, 0.0);
}

- (void)_dismissAndCancel:(id)a3
{
  id v3 = [(PUWallpaperPosterEditDebugViewController *)self presentingViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)_dismissAndSave:(id)a3
{
  id v4 = [(PUWallpaperPosterEditDebugViewController *)self posterEditorController];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__PUWallpaperPosterEditDebugViewController__dismissAndSave___block_invoke;
  v5[3] = &unk_1E5F2ED10;
  v5[4] = self;
  [v4 editor:self finalizeWithCompletion:v5];
}

void __60__PUWallpaperPosterEditDebugViewController__dismissAndSave___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__PUWallpaperPosterEditDebugViewController__dismissAndSave___block_invoke_2;
  block[3] = &unk_1E5F2ED10;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __60__PUWallpaperPosterEditDebugViewController__dismissAndSave___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) presentingViewController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

- (void)viewDidLayoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)PUWallpaperPosterEditDebugViewController;
  [(PUWallpaperPosterEditDebugViewController *)&v18 viewDidLayoutSubviews];
  id v3 = [(PUWallpaperPosterEditDebugViewController *)self posterEditorController];
  id v4 = [v3 editViewModel];

  BOOL v5 = [v4 currentLayerStackViewModel];
  double v6 = [v5 currentLayerStack];

  uint64_t v7 = [v6 layout];
  id v8 = [v4 currentLayerStackViewModel];
  [v8 containerFrame];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  if (v7)
  {
    v19.origin.x = v10;
    v19.origin.y = v12;
    v19.size.width = v14;
    v19.size.height = v16;
    if (!CGRectIsEmpty(v19))
    {
      double v17 = [(PUWallpaperPosterEditDebugViewController *)self dateView];
      objc_msgSend(v17, "layoutWithLayout:inContainerFrame:", v7, v10, v12, v14, v16);
    }
  }
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)_setupSimulatedControls
{
  v99[4] = *MEMORY[0x1E4F143B8];
  [(PUWallpaperPosterEditDebugViewController *)self setModalPresentationCapturesStatusBarAppearance:1];
  id v3 = [MEMORY[0x1E4FB14D8] filledButtonConfiguration];
  [v3 setButtonSize:1];
  v94 = v3;
  [v3 setCornerStyle:4];
  id v4 = [MEMORY[0x1E4FB1618] systemBlueColor];
  [v3 setBaseBackgroundColor:v4];

  BOOL v5 = [MEMORY[0x1E4FB1618] whiteColor];
  [v3 setBaseForegroundColor:v5];

  [v3 setTitle:@"Done"];
  double v6 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
  [v6 setConfiguration:v3];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v7 = v6;
  [v6 addTarget:self action:sel__dismissAndSave_ forControlEvents:0x2000];
  id v8 = self;
  double v9 = [(PUWallpaperPosterEditDebugViewController *)self view];
  [v9 addSubview:v7];

  double v10 = [MEMORY[0x1E4FB14D8] grayButtonConfiguration];
  [v10 setButtonSize:1];
  [v10 setCornerStyle:4];
  double v11 = [MEMORY[0x1E4FB1618] whiteColor];
  [v10 setBaseForegroundColor:v11];

  v93 = v10;
  [v10 setTitle:@"Cancel"];
  double v12 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
  [v12 setConfiguration:v10];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v13 = v12;
  [v12 addTarget:v8 action:sel__dismissAndCancel_ forControlEvents:0x2000];
  double v14 = [(PUWallpaperPosterEditDebugViewController *)v8 view];
  [v14 addSubview:v13];

  v69 = (void *)MEMORY[0x1E4F28DC8];
  v92 = v7;
  v86 = [v7 topAnchor];
  v89 = [(PUWallpaperPosterEditDebugViewController *)v8 view];
  v82 = [v89 topAnchor];
  v78 = [v86 constraintEqualToAnchor:v82 constant:20.0];
  v99[0] = v78;
  v73 = [v7 trailingAnchor];
  double v15 = v8;
  v75 = [(PUWallpaperPosterEditDebugViewController *)v8 view];
  v71 = [v75 trailingAnchor];
  v67 = [v73 constraintEqualToAnchor:v71 constant:-20.0];
  v99[1] = v67;
  double v16 = v13;
  v91 = v13;
  double v17 = [v13 topAnchor];
  objc_super v18 = [(PUWallpaperPosterEditDebugViewController *)v8 view];
  CGRect v19 = [v18 topAnchor];
  uint64_t v20 = [v17 constraintEqualToAnchor:v19 constant:20.0];
  v99[2] = v20;
  v21 = [v16 leadingAnchor];
  v22 = [(PUWallpaperPosterEditDebugViewController *)v8 view];
  v23 = [v22 leadingAnchor];
  id v24 = [v21 constraintEqualToAnchor:v23 constant:20.0];
  v99[3] = v24;
  uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v99 count:4];
  [v69 activateConstraints:v25];

  unint64_t v26 = objc_alloc_init(PUWallpaperPosterEditToolBar);
  [(PUWallpaperPosterEditToolBar *)v26 setAutoresizingMask:18];
  unint64_t v27 = [(PUWallpaperPosterEditDebugViewController *)v15 view];
  [v27 addSubview:v26];

  id v28 = v15;
  [(PUWallpaperPosterEditToolBar *)v26 setDelegate:v15];
  [(PUWallpaperPosterEditToolBar *)v26 setTranslatesAutoresizingMaskIntoConstraints:0];
  v70 = (void *)MEMORY[0x1E4F28DC8];
  v29 = v26;
  v83 = [(PUWallpaperPosterEditToolBar *)v26 bottomAnchor];
  v87 = [(PUWallpaperPosterEditDebugViewController *)v28 view];
  v79 = [v87 bottomAnchor];
  v76 = [v83 constraintEqualToAnchor:v79 constant:-20.0];
  v98[0] = v76;
  v72 = [(PUWallpaperPosterEditToolBar *)v26 leadingAnchor];
  v74 = [(PUWallpaperPosterEditDebugViewController *)v28 view];
  v68 = [v74 leadingAnchor];
  id v30 = [v72 constraintEqualToAnchor:v68];
  v98[1] = v30;
  v31 = [(PUWallpaperPosterEditToolBar *)v26 trailingAnchor];
  id v32 = [(PUWallpaperPosterEditDebugViewController *)v28 view];
  v33 = [v32 trailingAnchor];
  v34 = [v31 constraintEqualToAnchor:v33];
  v98[2] = v34;
  v90 = v26;
  CGRect v35 = [(PUWallpaperPosterEditToolBar *)v26 heightAnchor];
  v36 = [v35 constraintEqualToConstant:44.0];
  v98[3] = v36;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v98 count:4];
  [v70 activateConstraints:v37];

  [(PUWallpaperPosterEditDebugViewController *)v28 setEditToolBar:v29];
  id v38 = objc_alloc(MEMORY[0x1E4FB1A40]);
  v39 = objc_msgSend(v38, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v39 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v39 addTarget:v28 action:sel__handlePageControlSelectedPage_ forControlEvents:0x2000];
  v40 = [(PUWallpaperPosterEditDebugViewController *)v28 view];
  [v40 addSubview:v39];

  v77 = (void *)MEMORY[0x1E4F28DC8];
  v41 = v39;
  v80 = [v39 centerXAnchor];
  v42 = v28;
  v95 = v28;
  v84 = [(PUWallpaperPosterEditDebugViewController *)v28 view];
  v43 = [v84 centerXAnchor];
  v44 = [v80 constraintEqualToAnchor:v43];
  v97[0] = v44;
  v45 = [v41 bottomAnchor];
  v46 = [(PUWallpaperPosterEditDebugViewController *)v42 editToolBar];
  v47 = [v46 topAnchor];
  v48 = [v45 constraintEqualToAnchor:v47 constant:10.0];
  v97[1] = v48;
  v49 = v41;
  v88 = v41;
  v50 = [v41 heightAnchor];
  v51 = [v50 constraintEqualToConstant:50.0];
  v97[2] = v51;
  v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v97 count:3];
  [v77 activateConstraints:v52];

  [(PUWallpaperPosterEditDebugViewController *)v95 setPageControl:v49];
  v53 = [MEMORY[0x1E4FB14D8] grayButtonConfiguration];
  [v53 setButtonSize:1];
  [v53 setCornerStyle:1];
  v54 = [MEMORY[0x1E4FB1618] whiteColor];
  [v53 setBaseForegroundColor:v54];

  v55 = [MEMORY[0x1E4FB1618] darkGrayColor];
  v56 = [v55 colorWithAlphaComponent:0.7];
  [v53 setBaseBackgroundColor:v56];

  [v53 setTitle:&stru_1F06BE7B8];
  v57 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
  [v57 setConfiguration:v53];
  [v57 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v57 setUserInteractionEnabled:0];
  v58 = [(PUWallpaperPosterEditDebugViewController *)v95 view];
  [v58 addSubview:v57];

  v81 = (void *)MEMORY[0x1E4F28DC8];
  v85 = [v57 centerXAnchor];
  v59 = [(PUWallpaperPosterEditDebugViewController *)v95 view];
  v60 = [v59 centerXAnchor];
  v61 = [v85 constraintEqualToAnchor:v60];
  v96[0] = v61;
  v62 = [v57 bottomAnchor];
  v63 = [(PUWallpaperPosterEditDebugViewController *)v95 pageControl];
  v64 = [v63 topAnchor];
  v65 = [v62 constraintEqualToAnchor:v64 constant:10.0];
  v96[1] = v65;
  v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:v96 count:2];
  [v81 activateConstraints:v66];

  [(PUWallpaperPosterEditDebugViewController *)v95 setLookLabelButton:v57];
}

- (void)_setupEditorViews
{
  id v26 = [(PUWallpaperPosterEditDebugViewController *)self view];
  [v26 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v3, v5, v7, v9);
  [(UIView *)v11 setAutoresizingMask:18];
  [v26 addSubview:v11];
  backgroundView = self->_backgroundView;
  self->_backgroundView = v11;
  double v13 = v11;

  double v14 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v4, v6, v8, v10);
  [(UIView *)v14 setAutoresizingMask:18];
  [v26 addSubview:v14];
  foregroundView = self->_foregroundView;
  self->_foregroundView = v14;
  double v16 = v14;

  v28.origin.x = v4;
  v28.origin.y = v6;
  v28.size.width = v8;
  v28.size.height = v10;
  CGRect v29 = CGRectOffset(v28, 0.0, 100.0);
  double v17 = -[PUWallpaperPosterDateView initWithFrame:]([PUWallpaperPosterDateView alloc], "initWithFrame:", v29.origin.x, v29.origin.y, v29.size.width, v29.size.height);
  [v26 addSubview:v17];
  [(PUWallpaperPosterEditDebugViewController *)self setDateView:v17];
  objc_super v18 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v4, v6, v8, v10);
  [(UIView *)v18 setAutoresizingMask:18];
  [v26 addSubview:v18];
  floatingView = self->_floatingView;
  self->_floatingView = v18;
  uint64_t v20 = v18;

  v21 = (UIScrollView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1BE0]), "initWithFrame:", v4, v6, v8, v10);
  [(UIScrollView *)v21 setAutoresizingMask:18];
  [(UIScrollView *)v21 setPagingEnabled:1];
  [(UIScrollView *)v21 setScrollsToTop:0];
  [(UIScrollView *)v21 setShowsHorizontalScrollIndicator:0];
  [(UIScrollView *)v21 setDelegate:self];
  [v26 addSubview:v21];
  looksScrollView = self->_looksScrollView;
  self->_looksScrollView = v21;
  v23 = v21;

  id v24 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v4, v6, v8, v10);
  [(UIView *)v24 setAutoresizingMask:18];
  [(UIScrollView *)v23 addSubview:v24];
  contentOverlayView = self->_contentOverlayView;
  self->_contentOverlayView = v24;
}

- (void)_updateLookControls
{
  id v13 = [(PUWallpaperPosterEditDebugViewController *)self availableLooks];
  int64_t v3 = [(PUWallpaperPosterEditDebugViewController *)self currentLookIndex];
  double v4 = [v13 objectAtIndexedSubscript:v3];
  double v5 = [(PUWallpaperPosterEditDebugViewController *)self pageControl];
  objc_msgSend(v5, "setNumberOfPages:", objc_msgSend(v13, "count"));
  [v5 setCurrentPage:v3];
  double v6 = [(PUWallpaperPosterEditDebugViewController *)self lookLabelButton];
  double v7 = [v4 displayName];
  [v6 setTitle:v7 forState:0];

  double v8 = [(PUWallpaperPosterEditDebugViewController *)self dateView];
  double v9 = objc_msgSend(v4, "pu_timeFontIdentifier");
  double v10 = PUPosterSimulatedTimeFontForIdentifier(v9);
  [v8 setTimeFont:v10];

  double v11 = objc_msgSend(v4, "pu_timeFontColor");
  double v12 = [v11 color];
  [v8 setTimeColor:v12];

  objc_msgSend(v8, "setUseVibrantAppearance:", objc_msgSend(v4, "pu_timeAppearance") == 1);
}

- (void)_updateLooks
{
  [(PUWallpaperPosterEditDebugViewController *)self _updateLookProperties];
  int64_t v3 = [(PUWallpaperPosterEditDebugViewController *)self posterEditorController];
  double v4 = [(PUWallpaperPosterEditDebugViewController *)self availableLooks];
  double v5 = [v4 firstObject];
  [v3 editor:self populateViews:self forLook:v5];

  double v6 = [(PUWallpaperPosterEditDebugViewController *)self availableLooks];
  unint64_t v7 = [v6 count];

  id v13 = [(PUWallpaperPosterEditDebugViewController *)self looksScrollView];
  [v13 bounds];
  PXRectWithOriginAndSize();
  double v9 = v8;
  double v11 = v10 * (double)v7;
  double v12 = [(PUWallpaperPosterEditDebugViewController *)self looksScrollView];
  objc_msgSend(v12, "setContentSize:", v11, v9);
}

- (void)_updateLookProperties
{
  double v4 = [(PUWallpaperPosterEditDebugViewController *)self posterEditorController];
  double v5 = [v4 looksForEditor:self];
  [(PUWallpaperPosterEditDebugViewController *)self setAvailableLooks:v5];
  if (objc_opt_respondsToSelector())
  {
    double v6 = [v4 initialLookIdentifierForEditor:self];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __65__PUWallpaperPosterEditDebugViewController__updateLookProperties__block_invoke;
    v10[3] = &unk_1E5F2ED38;
    id v7 = v6;
    id v11 = v7;
    uint64_t v8 = [v5 indexOfObjectPassingTest:v10];
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      double v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"PUWallpaperPosterEditDebugViewController.m" lineNumber:291 description:@"Initial look is not found among available looks."];
    }
    [(PUWallpaperPosterEditDebugViewController *)self setCurrentLookIndex:v8];
  }
  [(PUWallpaperPosterEditDebugViewController *)self _updateLookControls];
}

uint64_t __65__PUWallpaperPosterEditDebugViewController__updateLookProperties__block_invoke(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  int64_t v3 = [a2 identifier];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

- (void)_setupPosterEditorController
{
  id v4 = [(PUWallpaperPosterEditDebugViewController *)self posterEditorController];
  int64_t v3 = [(PUWallpaperPosterEditDebugViewController *)self editEnvironment];
  [v4 editor:self didInitializeWithEnvironment:v3];

  [(PUWallpaperPosterEditDebugViewController *)self _updateLooks];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PUWallpaperPosterEditDebugViewController;
  [(PUWallpaperPosterEditDebugViewController *)&v5 viewDidDisappear:a3];
  id v4 = [(PUWallpaperPosterEditDebugViewController *)self posterEditorController];
  [v4 editorDidInvalidate:self];
  [(PUWallpaperPosterEditDebugViewController *)self setPosterEditorController:0];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)PUWallpaperPosterEditDebugViewController;
  [(PUWallpaperPosterEditDebugViewController *)&v6 viewDidLoad];
  int64_t v3 = [MEMORY[0x1E4FB1618] grayColor];
  id v4 = [(PUWallpaperPosterEditDebugViewController *)self view];
  [v4 setBackgroundColor:v3];

  [(PUWallpaperPosterEditDebugViewController *)self _setupEditorViews];
  [(PUWallpaperPosterEditDebugViewController *)self _setupSimulatedControls];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__PUWallpaperPosterEditDebugViewController_viewDidLoad__block_invoke;
  block[3] = &unk_1E5F2ED10;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __55__PUWallpaperPosterEditDebugViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupPosterEditorController];
}

- (PUWallpaperPosterEditDebugViewController)initWithAssets:(id)a3 posterType:(int64_t)a4 photoLibrary:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PUWallpaperPosterEditDebugViewController;
  double v10 = [(PUWallpaperPosterEditDebugViewController *)&v18 initWithNibName:0 bundle:0];
  if (v10)
  {
    id v11 = PXMap();
    double v12 = (void *)[objc_alloc(MEMORY[0x1E4F8CD00]) initWithDescriptorType:a4 media:v11];
    id v13 = [[_PUWallpaperPosterEditorDebugEnvironment alloc] initWithPosterDescriptor:v12];
    editEnvironment = v10->_editEnvironment;
    v10->_editEnvironment = v13;

    double v15 = [[PUWallpaperPosterEditorController alloc] initWithWallpaperEditor:v10 photoLibrary:v9];
    posterEditorController = v10->_posterEditorController;
    v10->_posterEditorController = v15;
  }
  return v10;
}

id __83__PUWallpaperPosterEditDebugViewController_initWithAssets_posterType_photoLibrary___block_invoke(uint64_t a1, void *a2)
{
  double v2 = (objc_class *)MEMORY[0x1E4F8CD18];
  id v3 = a2;
  id v4 = [v2 alloc];
  objc_super v5 = [v3 uuid];

  objc_super v6 = (void *)[v4 initWithAssetUUID:v5];
  return v6;
}

- (PUWallpaperPosterEditDebugViewController)initWithExistingConfiguration:(id)a3 assetDirectory:(id)a4 overrideConfiguration:(id)a5 photoLibrary:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PUWallpaperPosterEditDebugViewController;
  double v12 = [(PUWallpaperPosterEditDebugViewController *)&v18 initWithNibName:0 bundle:0];
  if (v12)
  {
    id v13 = [[_PUWallpaperPosterEditorDebugEnvironment alloc] initWithSourcePosterConfiguration:v9];
    editEnvironment = v12->_editEnvironment;
    v12->_editEnvironment = v13;

    [(_PUWallpaperPosterEditorDebugEnvironment *)v12->_editEnvironment setOverrideConfiguration:v10];
    double v15 = [[PUWallpaperPosterEditorController alloc] initWithWallpaperEditor:v12 photoLibrary:v11];
    posterEditorController = v12->_posterEditorController;
    v12->_posterEditorController = v15;
  }
  return v12;
}

- (PUWallpaperPosterEditDebugViewController)initWithMigratorOfLegacyConfigurationType:(unint64_t)a3 photoLibrary:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PUWallpaperPosterEditDebugViewController;
  id v7 = [(PUWallpaperPosterEditDebugViewController *)&v17 initWithNibName:0 bundle:0];
  if (v7)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F8CCF8]) initWithConfigurationType:0];
    [v8 setOptions:2];
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F8CD18]) initWithAssetUUID:0];
    v18[0] = v9;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    [v8 setMedia:v10];

    id v11 = [[_PUWallpaperPosterEditorDebugEnvironment alloc] initWithSourcePosterConfiguration:v8];
    editEnvironment = v7->_editEnvironment;
    v7->_editEnvironment = v11;

    id v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/var/tmp/PhotosPosterMigration/"];
    [(_PUWallpaperPosterEditorDebugEnvironment *)v7->_editEnvironment setSourceAssetDirectory:v13];

    [(_PUWallpaperPosterEditorDebugEnvironment *)v7->_editEnvironment setLegacyConfigurationType:a3];
    double v14 = [[PUWallpaperPosterEditorController alloc] initWithWallpaperEditor:v7 photoLibrary:v6];
    posterEditorController = v7->_posterEditorController;
    v7->_posterEditorController = v14;
  }
  return v7;
}

- (PUWallpaperPosterEditDebugViewController)initWithPosterType:(int64_t)a3 photoLibrary:(id)a4
{
  return [(PUWallpaperPosterEditDebugViewController *)self initWithAssets:MEMORY[0x1E4F1CBF0] posterType:a3 photoLibrary:a4];
}

- (PUWallpaperPosterEditDebugViewController)initWithAsset:(id)a3 posterType:(int64_t)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a3;
  id v8 = [v6 arrayWithObjects:&v12 count:1];
  id v9 = objc_msgSend(v7, "photoLibrary", v12, v13);

  id v10 = [(PUWallpaperPosterEditDebugViewController *)self initWithAssets:v8 posterType:a4 photoLibrary:v9];
  return v10;
}

- (PUWallpaperPosterEditDebugViewController)initWithAsset:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v10 count:1];
  id v7 = objc_msgSend(v5, "photoLibrary", v10, v11);

  id v8 = [(PUWallpaperPosterEditDebugViewController *)self initWithAssets:v6 posterType:1 photoLibrary:v7];
  return v8;
}

@end