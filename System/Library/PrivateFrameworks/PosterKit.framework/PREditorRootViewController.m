@interface PREditorRootViewController
- (BOOL)_shouldShowQuickActionEditing;
- (BOOL)areControlsHidden;
- (BOOL)areTopButtonsHidden;
- (BOOL)fourDigitTime;
- (BOOL)ignoresScrolling;
- (BOOL)initialLayoutFinished;
- (BOOL)isAllUserInteractionDisabledExceptForCancelButton;
- (BOOL)isComplicationSidebarConfigured;
- (BOOL)isComplicationsRowConfigured;
- (BOOL)isDepthEffectDisabled;
- (BOOL)isDisconnected;
- (BOOL)isLookInteractionHintCompleted;
- (BOOL)isPresentingModalViewController;
- (BOOL)isSubtitleHidden;
- (BOOL)isTitleReticleActive;
- (BOOL)needsEditingElementsVisibilityUpdate;
- (BOOL)needsReticleVisibilityUpdate;
- (BOOL)presentedGalleryUpdatesLeadingControl;
- (BOOL)shouldFixTitleBetweenTransitionFromTitleStyleConfiguration:(id)a3 toTitleStyleConfiguration:(id)a4 extensionBundleURL:(id)a5;
- (BOOL)usesEditingLayout;
- (BSUIVibrancyEffectView)controlsDividerVibrancyView;
- (BSUIVibrancyEffectView)emptyVibrancyView;
- (BSUIVibrancyEffectView)reticleVibrancyView;
- (BSUIVibrancyEffectView)sidebarReticleVibrancyView;
- (CGPoint)scrollContentOffsetForLook:(id)a3;
- (CGPoint)scrollContentOffsetForLookAtIndex:(unint64_t)a3;
- (CGRect)frameForPageAtLookIndex:(unint64_t)a3;
- (CGRect)frameForPageAtViewIndex:(unint64_t)a3;
- (CSProminentDisplayViewController)subtitleViewController;
- (NSArray)leadingMenuElementViews;
- (NSArray)leadingMenuElements;
- (NSArray)looks;
- (NSArray)trailingMenuElementViews;
- (NSArray)trailingMenuElements;
- (NSLayoutConstraint)bottomControlsYConstraint;
- (NSLayoutConstraint)leadingTopButtonXConstraint;
- (NSLayoutConstraint)leadingTopButtonYConstraint;
- (NSLayoutConstraint)trailingTopButtonXConstraint;
- (NSLayoutConstraint)trailingTopButtonYConstraint;
- (NSString)description;
- (NSTimer)lookInteractionHintTimer;
- (PRComplicationEmptyStateView)complicationRowEmptyStateView;
- (PRComplicationEmptyStateView)complicationSidebarEmptyStateView;
- (PRComplicationSceneHostViewController)complicationHostViewController;
- (PRDateProviding)dateProvider;
- (PREditingBottomLegibilityView)bottomLegibilityView;
- (PREditingCancelButton)cancelButton;
- (PREditingReticleView)complicationRowReticleView;
- (PREditingReticleView)complicationSidebarReticleView;
- (PREditingReticleView)inlineComplicationReticleView;
- (PREditingReticleView)titleReticleView;
- (PREditingStandaloneLabelView)lookInteractionHintLabel;
- (PREditingStandaloneLabelView)lookNameLabel;
- (PREditingTitledButton)acceptButton;
- (PREditor)editor;
- (PREditorElementLayoutController)editorElementLayoutController;
- (PREditorLookTransition)lookTransition;
- (PRQuickActionsSceneHostViewController)quickActionsHostViewController;
- (UIEdgeInsets)editingChromeDodgingInsets;
- (UIEdgeInsets)topButtonsEdgeInsets;
- (UILayoutGuide)titlePopoverLayoutGuide;
- (UIPageControl)pageControl;
- (UIScrollView)scrollView;
- (UIView)backgroundContainerView;
- (UIView)complicationsContainerView;
- (UIView)contentOverlayContainerView;
- (UIView)contentOverlayView;
- (UIView)controlsDividerView;
- (UIView)floatingContainerView;
- (UIView)foregroundContainerView;
- (UIView)presentationDismissalGestureView;
- (UIView)timeContainerView;
- (UIView)titleGestureView;
- (UIView)touchBlockingView;
- (id)_viewsForMenuElements:(id)a3;
- (id)beginTransitionToLook:(id)a3 method:(int64_t)a4;
- (id)configuredProperties;
- (id)currentLook;
- (id)defaultTitleStyleConfigurationForLook:(id)a3;
- (id)effectiveTitleStyleConfigurationForLook:(id)a3;
- (id)extensionBundleURL;
- (id)imageForDepthEffectActionTopLevelAction:(BOOL)a3;
- (id)lookAtScrollContentOffset:(CGPoint)a3;
- (id)lookAtScrollContentOffset:(CGPoint)a3 fractionOfDistanceThroughLook:(double *)a4;
- (id)makeComplicationHostingSceneWithSpecification:(id)a3;
- (id)makeComplicationsHostingScene;
- (id)makeQuickActionsHostingScene;
- (id)makeQuickActionsHostingSceneWithSpecification:(id)a3;
- (id)timeViewControllerForLook:(id)a3;
- (id)viewForMenuElementIdentifier:(id)a3;
- (int64_t)focusedComplicationElement;
- (int64_t)focusedQuickActionPosition;
- (unint64_t)backgroundTypeForLook:(id)a3;
- (unint64_t)lookIndexForContentOffset:(CGPoint)a3;
- (unint64_t)lookIndexForViewIndex:(unint64_t)a3;
- (unint64_t)viewIndexForLookIndex:(unint64_t)a3;
- (void)_setNeedsEditingElementsVisibilityUpdate;
- (void)_setVibrancyConfiguration:(id)a3;
- (void)_updateButtonLayout;
- (void)_updateComplicationSidebarEmptyViewVisibility;
- (void)_updateComplicationSidebarEmptyViewVisibilityAnimated:(BOOL)a3;
- (void)_updateComplicationsRowEmptyViewVisibility;
- (void)_updateComplicationsRowEmptyViewVisibilityAnimated:(BOOL)a3;
- (void)_updateComplicationsVibrancyFromCurrentLook;
- (void)_updateEditingElementsVisibilityIfNeeded;
- (void)_updateMenuElements;
- (void)_updateReticleViewFramesWithOffset:(double)a3;
- (void)_updateScrollViewContentSize;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)beginLookInteractionHinting;
- (void)dateProvider:(id)a3 didUpdateDate:(id)a4;
- (void)depthEffectEnablementDidChange;
- (void)didFinishTransitionToLook:(id)a3;
- (void)didTransitionToLook:(id)a3 method:(int64_t)a4 progress:(double)a5;
- (void)disconnect;
- (void)endLookInteractionHinting;
- (void)enumerateTimeViewControllersUsingBlock:(id)a3;
- (void)forciblyFinishLookTransition;
- (void)invalidate;
- (void)loadView;
- (void)lookBackgroundTypesDidChange;
- (void)lookPropertiesDidChange;
- (void)looksDidChange;
- (void)looksWillChange;
- (void)modalPresentationDismissGestureDidFire:(id)a3;
- (void)pageControlCurrentPageDidChange:(id)a3;
- (void)reconnect;
- (void)requireGestureRecognizerToFailForLooksScroll:(id)a3;
- (void)scrollToLook:(id)a3 animated:(BOOL)a4;
- (void)scrollToLookAtIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)scrollViewDidEndScrolling:(id)a3;
- (void)scrollViewDidScroll:(id)a3 withContext:(id *)a4;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setAcceptButton:(id)a3;
- (void)setAllUserInteractionDisabledExceptForCancelButton:(BOOL)a3;
- (void)setBackgroundContainerView:(id)a3;
- (void)setBottomControlsYConstraint:(id)a3;
- (void)setBottomLegibilityView:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setComplicationHostViewController:(id)a3;
- (void)setComplicationRowEmptyStateView:(id)a3;
- (void)setComplicationRowReticleView:(id)a3;
- (void)setComplicationSidebarConfigured:(BOOL)a3;
- (void)setComplicationSidebarEmptyStateView:(id)a3;
- (void)setComplicationSidebarReticleView:(id)a3;
- (void)setComplicationsContainerView:(id)a3;
- (void)setComplicationsRowConfigured:(BOOL)a3;
- (void)setContentOverlayContainerView:(id)a3;
- (void)setContentOverlayView:(id)a3;
- (void)setControlsDividerVibrancyView:(id)a3;
- (void)setControlsDividerView:(id)a3;
- (void)setControlsHidden:(BOOL)a3;
- (void)setDateProvider:(id)a3;
- (void)setDepthEffectDisabled:(BOOL)a3;
- (void)setDisconnected:(BOOL)a3;
- (void)setEditor:(id)a3;
- (void)setEditorElementLayoutController:(id)a3;
- (void)setEmptyVibrancyView:(id)a3;
- (void)setFloatingContainerView:(id)a3;
- (void)setFocusedComplicationElement:(int64_t)a3;
- (void)setFocusedQuickActionPosition:(int64_t)a3;
- (void)setForegroundContainerView:(id)a3;
- (void)setFourDigitTime:(BOOL)a3;
- (void)setIgnoresScrolling:(BOOL)a3;
- (void)setInitialLayoutFinished:(BOOL)a3;
- (void)setInlineComplicationReticleView:(id)a3;
- (void)setLeadingMenuElementViews:(id)a3;
- (void)setLeadingMenuElements:(id)a3;
- (void)setLeadingTopButtonXConstraint:(id)a3;
- (void)setLeadingTopButtonYConstraint:(id)a3;
- (void)setLookInteractionHintCompleted:(BOOL)a3;
- (void)setLookInteractionHintLabel:(id)a3;
- (void)setLookInteractionHintTimer:(id)a3;
- (void)setLookNameLabel:(id)a3;
- (void)setLookTransition:(id)a3;
- (void)setLooks:(id)a3;
- (void)setLooks:(id)a3 forUpdatingProperties:(BOOL)a4;
- (void)setNeedsEditingElementsVisibilityUpdate:(BOOL)a3;
- (void)setNeedsReticleVisibilityUpdate;
- (void)setNeedsReticleVisibilityUpdate:(BOOL)a3;
- (void)setPageControl:(id)a3;
- (void)setPresentationDismissalGestureView:(id)a3;
- (void)setPresentedGalleryUpdatesLeadingControl:(BOOL)a3;
- (void)setPresentingModalViewController:(BOOL)a3;
- (void)setQuickActionsHostViewController:(id)a3;
- (void)setReticleVibrancyView:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setSidebarReticleVibrancyView:(id)a3;
- (void)setSubtitleHidden:(BOOL)a3;
- (void)setSubtitleViewController:(id)a3;
- (void)setTimeContainerView:(id)a3;
- (void)setTitleGestureView:(id)a3;
- (void)setTitlePopoverLayoutGuide:(id)a3;
- (void)setTitleReticleActive:(BOOL)a3;
- (void)setTitleReticleView:(id)a3;
- (void)setTopButtonsEdgeInsets:(UIEdgeInsets)a3;
- (void)setTopButtonsHidden:(BOOL)a3;
- (void)setTouchBlockingView:(id)a3;
- (void)setTrailingMenuElementViews:(id)a3;
- (void)setTrailingMenuElements:(id)a3;
- (void)setTrailingTopButtonXConstraint:(id)a3;
- (void)setTrailingTopButtonYConstraint:(id)a3;
- (void)setUsesEditingLayout:(BOOL)a3;
- (void)titleViewTapped:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateForChangedOverrideDate;
- (void)updateForChangedTitleString;
- (void)updatePageControlCurrentPage;
- (void)updateReticleViewFrames;
- (void)updateReticleVisibilityIfNeeded;
- (void)updateTimeControllersForLookMap;
- (void)updateTopButtonAlpha;
- (void)updateTopButtonsLayoutWithLeadingTopButtonFrame:(CGRect)a3 trailingTopButtonFrame:(CGRect)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PREditorRootViewController

- (void)invalidate
{
  [(PRComplicationSceneHostViewController *)self->_complicationHostViewController invalidate];
  quickActionsHostViewController = self->_quickActionsHostViewController;
  [(PRQuickActionsSceneHostViewController *)quickActionsHostViewController invalidate];
}

- (void)loadView
{
  v208[7] = *MEMORY[0x1E4F143B8];
  id v200 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  val = self;
  v191 = [(PREditorRootViewController *)self editor];
  objc_initWeak(&location, self);
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F8E0]);
  [v3 setDelegate:self];
  [v3 setPagingEnabled:1];
  [v3 setShowsVerticalScrollIndicator:0];
  [v3 setShowsHorizontalScrollIndicator:0];
  [v3 setScrollsToTop:0];
  [v3 setBounces:0];
  [v3 _setAutoScrollEnabled:0];
  v4 = [v3 layer];
  [v4 setHitTestsAsOpaque:1];
  v199 = v3;

  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v200 addSubview:v3];
  [(PREditorRootViewController *)val setScrollView:v3];
  v5 = objc_alloc_init(PREditingBottomLegibilityView);
  [(PREditingBottomLegibilityView *)v5 setUserInteractionEnabled:0];
  [(PREditingBottomLegibilityView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  BOOL v6 = [(PREditorRootViewController *)val _shouldShowQuickActionEditing];
  double v7 = 0.35;
  if (!v6) {
    double v7 = 0.25;
  }
  [(PREditingBottomLegibilityView *)v5 setHeightFactor:v7];
  [v200 addSubview:v5];
  [(PREditorRootViewController *)val setBottomLegibilityView:v5];
  v194 = v5;
  id v8 = objc_alloc_init(MEMORY[0x1E4FB1A40]);
  [v8 setHidesForSinglePage:1];
  [v8 setBackgroundStyle:1];
  [v8 addTarget:val action:sel_pageControlCurrentPageDidChange_ forControlEvents:4096];
  LODWORD(v9) = 1132068864;
  [v8 setContentCompressionResistancePriority:0 forAxis:v9];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v8 setAccessibilityIdentifier:@"editing-page-control"];
  [v8 _setPreferredNumberOfVisibleIndicators:6];
  [v200 addSubview:v8];
  [(PREditorRootViewController *)val setPageControl:v8];
  v196 = v8;
  v178 = [v191 delegate];
  uint64_t v10 = PREditingSupportsLiveBlurs() ^ 1;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [v178 prefersSimpleButtonAppearanceForEditor:v191])
  {
    uint64_t v10 = 1;
  }
  v11 = [PREditingCancelButton alloc];
  v12 = (void *)MEMORY[0x1E4FB13F0];
  v204[0] = MEMORY[0x1E4F143A8];
  v204[1] = 3221225472;
  v204[2] = __38__PREditorRootViewController_loadView__block_invoke;
  v204[3] = &unk_1E54DADA8;
  objc_copyWeak(&v205, &location);
  v13 = [v12 actionWithHandler:v204];
  double v14 = *MEMORY[0x1E4F1DB28];
  double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v198 = -[PREditingButton initWithStyle:frame:primaryAction:](v11, "initWithStyle:frame:primaryAction:", v10, v13, *MEMORY[0x1E4F1DB28], v15, v17, v16);

  [(PREditingCancelButton *)v198 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PREditingCancelButton *)v198 setAccessibilityIdentifier:@"editing-cancel"];
  [v200 addSubview:v198];
  [(PREditorRootViewController *)val setCancelButton:v198];
  v18 = (objc_class *)objc_opt_class();
  v19 = [(PREditorRootViewController *)val editor];
  uint64_t v20 = [v19 acceptButtonType];

  if (v20 == 1 || v20 == 2) {
    v18 = (objc_class *)objc_opt_class();
  }
  id v21 = [v18 alloc];
  v22 = (void *)MEMORY[0x1E4FB13F0];
  v202[0] = MEMORY[0x1E4F143A8];
  v202[1] = 3221225472;
  v202[2] = __38__PREditorRootViewController_loadView__block_invoke_2;
  v202[3] = &unk_1E54DADA8;
  objc_copyWeak(&v203, &location);
  v23 = [v22 actionWithHandler:v202];
  v197 = objc_msgSend(v21, "initWithStyle:frame:primaryAction:", 2, v23, v14, v15, v17, v16);

  [v197 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v197 setAccessibilityIdentifier:@"editing-done"];
  [v200 addSubview:v197];
  [(PREditorRootViewController *)val setAcceptButton:v197];
  [(PREditorRootViewController *)val updateTopButtonAlpha];
  id v24 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [(PREditorRootViewController *)val setTimeContainerView:v24];
  v175 = v24;
  int v25 = [v191 displaysHeaderElements];
  LODWORD(v24) = [v191 displaysSubtitleElement];
  int v26 = [v191 areComplicationsAllowed];
  char v27 = v26;
  int v28 = v25 & v26;
  if ((v25 & v26 & v24) == 1)
  {
    BOOL v29 = [(PREditorRootViewController *)val isSubtitleHidden];
    id v30 = objc_alloc_init(MEMORY[0x1E4F5E4C8]);
    v31 = v30;
    if (v29) {
      uint64_t v32 = 0;
    }
    else {
      uint64_t v32 = 2;
    }
    [v30 setElements:v32];
    v33 = [(PREditorRootViewController *)val dateProvider];
    v34 = [v33 date];
    [v31 setDisplayDate:v34];

    objc_msgSend(v31, "setUsesEditingLayout:", -[PREditorRootViewController usesEditingLayout](val, "usesEditingLayout"));
    v35 = [v31 view];
    [v35 setUserInteractionEnabled:0];
    v36 = [v35 layer];
    [v36 setAllowsHitTesting:0];

    [v35 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PREditorRootViewController *)val addChildViewController:v31];
    [v175 addSubview:v35];
    [v31 didMoveToParentViewController:val];
    [(PREditorRootViewController *)val setSubtitleViewController:v31];
  }
  v37 = objc_alloc_init(PREditingStandaloneLabelView);
  [(PREditingStandaloneLabelView *)v37 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PREditingStandaloneLabelView *)v37 setUserInteractionEnabled:0];
  [(PREditingStandaloneLabelView *)v37 setAlpha:0.0];
  [v200 addSubview:v37];
  [(PREditorRootViewController *)val setLookNameLabel:v37];
  v195 = v37;
  v38 = objc_alloc_init(PREditingStandaloneLabelView);
  [(PREditingStandaloneLabelView *)v38 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PREditingStandaloneLabelView *)v38 setUserInteractionEnabled:0];
  [v200 addSubview:v38];
  [(PREditorRootViewController *)val setLookInteractionHintLabel:v38];
  v193 = v38;
  id v39 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [(PREditorRootViewController *)val setComplicationsContainerView:v39];
  v176 = v39;
  if (v25)
  {
    id v192 = objc_alloc_init(MEMORY[0x1E4F4F8F0]);
    [v192 setUserInteractionEnabled:0];
    [v192 setBlurEnabled:PREditingSupportsLiveBlurs()];
    [(PREditorRootViewController *)val setReticleVibrancyView:v192];
    v40 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v41 = [v40 userInterfaceIdiom];

    if ((v41 & 0xFFFFFFFFFFFFFFFBLL) == 1 && _os_feature_enabled_impl())
    {
      id v177 = objc_alloc_init(MEMORY[0x1E4F4F8F0]);
      [v177 setUserInteractionEnabled:0];
      [v177 setBlurEnabled:PREditingSupportsLiveBlurs()];
      [(PREditorRootViewController *)val setSidebarReticleVibrancyView:v177];
    }
    else
    {
      id v177 = 0;
    }
  }
  else
  {
    id v177 = 0;
    id v192 = 0;
  }
  if ([v191 areViewsSharedBetweenLooks])
  {
    id v42 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [v199 addSubview:v42];
    [(PREditorRootViewController *)val setBackgroundContainerView:v42];
    id v43 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [v199 addSubview:v43];
    [(PREditorRootViewController *)val setForegroundContainerView:v43];
    id v44 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [(PREditorRootViewController *)val setFloatingContainerView:v44];
    if (v192) {
      [v199 addSubview:v192];
    }
    [v199 insertSubview:v44 aboveSubview:v43];
    [v199 addSubview:v175];
    if (v177) {
      [v199 addSubview:v177];
    }
  }
  [v199 addSubview:v176];
  if (v28)
  {
    v45 = objc_alloc_init(PREditingReticleView);
    [(PREditingReticleView *)v45 setTranslatesAutoresizingMaskIntoConstraints:0];
    v46 = [v192 contentView];
    [v46 addSubview:v45];

    [(PREditorRootViewController *)val setInlineComplicationReticleView:v45];
  }
  if (v25)
  {
    v47 = objc_alloc_init(PREditingReticleView);
    v48 = [v192 contentView];
    [v48 addSubview:v47];

    [(PREditorRootViewController *)val setTitleReticleView:v47];
    id v49 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    v50 = [v49 layer];
    [v50 setHitTestsAsOpaque:1];

    v51 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:val action:sel_titleViewTapped_];
    [v49 addGestureRecognizer:v51];
    [v49 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v200 addSubview:v49];
    [(PREditorRootViewController *)val setTitleGestureView:v49];
    id v52 = objc_alloc_init(MEMORY[0x1E4FB1940]);
    [(PREditingReticleView *)v47 addLayoutGuide:v52];
    [(PREditorRootViewController *)val setTitlePopoverLayoutGuide:v52];

    if (v27)
    {
      v53 = objc_alloc_init(PREditingReticleView);
      v54 = [v192 contentView];
      [v54 addSubview:v53];

      [(PREditorRootViewController *)val setComplicationRowReticleView:v53];
      v55 = objc_alloc_init(PRComplicationEmptyStateView);
      [(PREditingReticleView *)v53 addSubview:v55];
      [(PREditorRootViewController *)val setComplicationRowEmptyStateView:v55];
      v56 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v57 = [v56 userInterfaceIdiom];

      if ((v57 & 0xFFFFFFFFFFFFFFFBLL) == 1 && _os_feature_enabled_impl())
      {
        v58 = objc_alloc_init(PREditingReticleView);
        v59 = [v177 contentView];
        [v59 addSubview:v58];

        [(PREditorRootViewController *)val setComplicationSidebarReticleView:v58];
        v60 = objc_alloc_init(PRComplicationEmptyStateView);
        [(PREditingReticleView *)v58 addSubview:v60];
        [(PREditorRootViewController *)val setComplicationSidebarEmptyStateView:v60];
      }
      v61 = [PRComplicationSceneHostViewController alloc];
      v62 = [(PREditorRootViewController *)val makeComplicationsHostingScene];
      v63 = [(PRComplicationSceneHostViewController *)v61 initWithScene:v62];

      v64 = [(PRComplicationSceneHostViewController *)v63 view];
      [v64 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(PREditorRootViewController *)val addChildViewController:v63];
      [v176 addSubview:v64];
      [(PRComplicationSceneHostViewController *)v63 didMoveToParentViewController:val];
      [(PREditorRootViewController *)val setComplicationHostViewController:v63];
      [(PREditorRootViewController *)val _updateComplicationsVibrancyFromCurrentLook];
    }
  }
  if ([(PREditorRootViewController *)val _shouldShowQuickActionEditing])
  {
    v65 = [PRQuickActionsSceneHostViewController alloc];
    v66 = [(PREditorRootViewController *)val makeQuickActionsHostingScene];
    v189 = [(PRQuickActionsSceneHostViewController *)v65 initWithScene:v66];

    v187 = [(PRQuickActionsSceneHostViewController *)v189 view];
    [(PREditorRootViewController *)val addChildViewController:v189];
    [v200 addSubview:v187];
    [v187 setAutoresizingMask:18];
    [(PRQuickActionsSceneHostViewController *)v189 didMoveToParentViewController:val];
    [(PREditorRootViewController *)val setQuickActionsHostViewController:v189];
    id v67 = objc_alloc_init(MEMORY[0x1E4F4F8F0]);
    [v67 setUserInteractionEnabled:0];
    [v67 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v67 setBlurEnabled:PREditingSupportsLiveBlurs()];
    [(PREditorRootViewController *)val setControlsDividerVibrancyView:v67];
    [v200 addSubview:v67];
    id v68 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    v69 = [MEMORY[0x1E4FB1618] colorWithWhite:0.2 alpha:1.0];
    [v68 setBackgroundColor:v69];

    [v68 setTranslatesAutoresizingMaskIntoConstraints:0];
    v70 = [v68 layer];
    [v70 setCornerRadius:0.5];

    v71 = [v67 contentView];
    [v71 addSubview:v68];

    [(PREditorRootViewController *)val setControlsDividerView:v68];
    v155 = (void *)MEMORY[0x1E4F28DC8];
    v183 = [v67 leadingAnchor];
    v185 = [v200 leadingAnchor];
    v181 = [v183 constraintEqualToAnchor:v185 constant:40.0];
    v208[0] = v181;
    v173 = [v67 trailingAnchor];
    v179 = [v200 trailingAnchor];
    v171 = [v173 constraintEqualToAnchor:v179 constant:-40.0];
    v208[1] = v171;
    v169 = [v67 heightAnchor];
    v167 = [v169 constraintEqualToConstant:1.0];
    v208[2] = v167;
    v165 = [v68 leadingAnchor];
    v163 = [v67 leadingAnchor];
    v161 = [v165 constraintEqualToAnchor:v163];
    v208[3] = v161;
    v159 = [v68 trailingAnchor];
    v157 = [v67 trailingAnchor];
    v72 = [v159 constraintEqualToAnchor:v157];
    v208[4] = v72;
    v73 = [v68 topAnchor];
    v74 = [v67 topAnchor];
    v75 = [v73 constraintEqualToAnchor:v74];
    v208[5] = v75;
    v76 = [v68 bottomAnchor];
    v77 = [v67 bottomAnchor];
    v78 = [v76 constraintEqualToAnchor:v77];
    v208[6] = v78;
    v79 = [MEMORY[0x1E4F1C978] arrayWithObjects:v208 count:7];
    [v155 activateConstraints:v79];
  }
  id v80 = [(PREditorRootViewController *)val contentOverlayView];
  if (!v80)
  {
    id v80 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [(PREditorRootViewController *)val setContentOverlayView:v80];
  }
  v190 = v80;
  [v80 bounds];
  double v82 = v81;
  double v84 = v83;
  double v86 = v85;
  double v88 = v87;
  v89 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v81, v83, v85, v87);
  objc_msgSend(v190, "setFrame:", v82, v84, v86, v88);
  [v89 addSubview:v190];
  [v199 addSubview:v89];
  [(PREditorRootViewController *)val setContentOverlayContainerView:v89];
  v117 = v89;
  if ([(PREditorRootViewController *)val _shouldShowQuickActionEditing])
  {
    v90 = [(BSUIVibrancyEffectView *)val->_controlsDividerVibrancyView bottomAnchor];
    v91 = [v200 bottomAnchor];
    v188 = [v90 constraintEqualToAnchor:v91];

    v92 = [v196 bottomAnchor];
    v93 = [(BSUIVibrancyEffectView *)val->_controlsDividerVibrancyView topAnchor];
    v94 = [v92 constraintEqualToAnchor:v93 constant:-23.0];
    [v94 setActive:1];
  }
  else
  {
    v92 = [v196 bottomAnchor];
    v93 = [v200 safeAreaLayoutGuide];
    v94 = [v93 bottomAnchor];
    v188 = [v92 constraintEqualToAnchor:v94];
  }

  [(PREditorRootViewController *)val setBottomControlsYConstraint:v188];
  [(PREditorRootViewController *)val topButtonsEdgeInsets];
  double v96 = v95;
  double v98 = v97;
  v99 = [(PREditingCancelButton *)v198 leadingAnchor];
  v100 = [v200 leadingAnchor];
  v186 = [v99 constraintEqualToAnchor:v100 constant:v98];

  [(PREditorRootViewController *)val setLeadingTopButtonXConstraint:v186];
  v101 = [(PREditingCancelButton *)v198 topAnchor];
  v102 = [v200 topAnchor];
  v184 = [v101 constraintEqualToAnchor:v102 constant:v96];

  [(PREditorRootViewController *)val setLeadingTopButtonYConstraint:v184];
  v103 = [v197 trailingAnchor];
  v104 = [v200 trailingAnchor];
  v182 = [v103 constraintEqualToAnchor:v104 constant:-v98];

  [(PREditorRootViewController *)val setTrailingTopButtonXConstraint:v182];
  v105 = [v197 topAnchor];
  v106 = [v200 topAnchor];
  v180 = [v105 constraintEqualToAnchor:v106 constant:v96];

  [(PREditorRootViewController *)val setTrailingTopButtonYConstraint:v180];
  v118 = (void *)MEMORY[0x1E4F28DC8];
  v172 = [v196 centerXAnchor];
  v174 = [v200 safeAreaLayoutGuide];
  v170 = [v174 centerXAnchor];
  v168 = [v172 constraintEqualToAnchor:v170];
  v207[0] = v168;
  v207[1] = v188;
  v207[2] = v186;
  v207[3] = v184;
  v207[4] = v182;
  v207[5] = v180;
  v166 = [v197 widthAnchor];
  v164 = [(PREditingCancelButton *)v198 widthAnchor];
  v162 = [v166 constraintEqualToAnchor:v164];
  v207[6] = v162;
  v160 = [v199 topAnchor];
  v158 = [v200 topAnchor];
  v156 = [v160 constraintEqualToAnchor:v158];
  v207[7] = v156;
  v154 = [v199 bottomAnchor];
  v153 = [v200 bottomAnchor];
  v152 = [v154 constraintEqualToAnchor:v153];
  v207[8] = v152;
  v151 = [v199 leadingAnchor];
  v150 = [v200 leadingAnchor];
  v149 = [v151 constraintEqualToAnchor:v150];
  v207[9] = v149;
  v148 = [v199 trailingAnchor];
  v147 = [v200 trailingAnchor];
  v146 = [v148 constraintEqualToAnchor:v147];
  v207[10] = v146;
  v145 = [(PREditingStandaloneLabelView *)v195 centerXAnchor];
  v144 = [v200 centerXAnchor];
  v143 = [v145 constraintEqualToAnchor:v144];
  v207[11] = v143;
  v142 = [(PREditingStandaloneLabelView *)v195 bottomAnchor];
  v141 = [v196 topAnchor];
  v140 = [v142 constraintEqualToAnchor:v141 constant:-10.0];
  v207[12] = v140;
  v139 = [(PREditingStandaloneLabelView *)v195 leadingAnchor];
  v138 = [v200 leadingAnchor];
  v137 = [v139 constraintGreaterThanOrEqualToAnchor:v138 constant:20.0];
  v207[13] = v137;
  v136 = [(PREditingStandaloneLabelView *)v195 trailingAnchor];
  v135 = [v200 trailingAnchor];
  v134 = [v136 constraintLessThanOrEqualToAnchor:v135 constant:-20.0];
  v207[14] = v134;
  v133 = [(PREditingStandaloneLabelView *)v193 centerXAnchor];
  v132 = [v200 centerXAnchor];
  v131 = [v133 constraintEqualToAnchor:v132];
  v207[15] = v131;
  v130 = [(PREditingStandaloneLabelView *)v193 bottomAnchor];
  v129 = [v196 topAnchor];
  v128 = [v130 constraintEqualToAnchor:v129 constant:-10.0];
  v207[16] = v128;
  v127 = [(PREditingStandaloneLabelView *)v193 leadingAnchor];
  v126 = [v200 leadingAnchor];
  v125 = [v127 constraintGreaterThanOrEqualToAnchor:v126 constant:20.0];
  v207[17] = v125;
  v124 = [(PREditingStandaloneLabelView *)v193 trailingAnchor];
  v123 = [v200 trailingAnchor];
  v122 = [v124 constraintLessThanOrEqualToAnchor:v123 constant:-20.0];
  v207[18] = v122;
  v121 = [(PREditingBottomLegibilityView *)v194 heightAnchor];
  v120 = [v200 heightAnchor];
  v119 = [v121 constraintEqualToAnchor:v120];
  v207[19] = v119;
  v107 = [(PREditingBottomLegibilityView *)v194 bottomAnchor];
  v108 = [v200 bottomAnchor];
  v109 = [v107 constraintEqualToAnchor:v108];
  v207[20] = v109;
  v110 = [(PREditingBottomLegibilityView *)v194 leadingAnchor];
  v111 = [v200 leadingAnchor];
  v112 = [v110 constraintEqualToAnchor:v111];
  v207[21] = v112;
  v113 = [(PREditingBottomLegibilityView *)v194 trailingAnchor];
  v114 = [v200 trailingAnchor];
  v115 = [v113 constraintEqualToAnchor:v114];
  v207[22] = v115;
  v116 = [MEMORY[0x1E4F1C978] arrayWithObjects:v207 count:23];
  [v118 activateConstraints:v116];

  [(PREditorRootViewController *)val setView:v200];
  objc_destroyWeak(&v203);

  objc_destroyWeak(&v205);
  objc_destroyWeak(&location);
}

void __38__PREditorRootViewController_loadView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained editor];

  [v2 requestDismissalWithAction:0];
}

void __38__PREditorRootViewController_loadView__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained editor];

  [v2 requestDismissalWithAction:1];
}

- (void)viewDidLoad
{
  v76[8] = *MEMORY[0x1E4F143B8];
  v73.receiver = self;
  v73.super_class = (Class)PREditorRootViewController;
  [(PREditorRootViewController *)&v73 viewDidLoad];
  id v3 = [[PREditorElementLayoutController alloc] initWithTraitEnvironment:self];
  [(PREditorRootViewController *)self setEditorElementLayoutController:v3];
  [(PREditorRootViewController *)self depthEffectEnablementDidChange];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v5 = [(PREditorRootViewController *)self view];
  BOOL v6 = [(PREditorRootViewController *)self editor];
  if ([v6 displaysHeaderElements])
  {
    v71 = v5;
    v69 = v3;
    double v7 = [(PREditorRootViewController *)self titleGestureView];
    id v8 = [(PREditorRootViewController *)self titleReticleView];
    double v9 = [(PREditorRootViewController *)self titlePopoverLayoutGuide];
    v64 = [v7 centerXAnchor];
    v62 = [v8 centerXAnchor];
    v59 = [v64 constraintEqualToAnchor:v62];
    v76[0] = v59;
    v56 = [v7 centerYAnchor];
    v53 = [v8 centerYAnchor];
    v50 = [v56 constraintEqualToAnchor:v53];
    v76[1] = v50;
    v47 = [v7 widthAnchor];
    v46 = [v8 widthAnchor];
    v45 = [v47 constraintEqualToAnchor:v46];
    v76[2] = v45;
    id v68 = v7;
    id v44 = [v7 heightAnchor];
    id v43 = [v8 heightAnchor];
    id v42 = [v44 constraintEqualToAnchor:v43];
    v76[3] = v42;
    uint64_t v41 = [v9 centerXAnchor];
    v40 = [v8 centerXAnchor];
    id v39 = [v41 constraintEqualToAnchor:v40];
    v76[4] = v39;
    v38 = [v9 centerYAnchor];
    v37 = [v8 centerYAnchor];
    uint64_t v10 = [v38 constraintEqualToAnchor:v37];
    v76[5] = v10;
    v11 = [v9 widthAnchor];
    v12 = [v8 widthAnchor];
    v13 = [v11 constraintEqualToAnchor:v12 constant:10.0];
    v76[6] = v13;
    v66 = v9;
    double v14 = [v9 heightAnchor];
    id v67 = v8;
    [v8 heightAnchor];
    double v15 = v70 = v6;
    double v16 = [v14 constraintEqualToAnchor:v15 constant:10.0];
    v76[7] = v16;
    double v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:8];
    v72 = v4;
    [v4 addObjectsFromArray:v17];

    BOOL v6 = v70;
    if ([v70 areComplicationsAllowed])
    {
      v65 = [(PREditorRootViewController *)self complicationHostViewController];
      v18 = [v65 view];
      v60 = [v18 leadingAnchor];
      uint64_t v57 = [v71 leadingAnchor];
      v54 = [v60 constraintEqualToAnchor:v57];
      v75[0] = v54;
      v51 = [v18 trailingAnchor];
      v48 = [v71 trailingAnchor];
      v19 = [v51 constraintEqualToAnchor:v48];
      v75[1] = v19;
      v63 = v18;
      uint64_t v20 = [v18 topAnchor];
      id v21 = [v71 topAnchor];
      v22 = [v20 constraintEqualToAnchor:v21];
      v75[2] = v22;
      v23 = [v18 bottomAnchor];
      id v24 = [v71 bottomAnchor];
      int v25 = [v23 constraintEqualToAnchor:v24];
      v75[3] = v25;
      int v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:4];
      [v72 addObjectsFromArray:v26];

      v61 = [(PREditorRootViewController *)self subtitleViewController];
      char v27 = [v61 view];
      v58 = [v27 leadingAnchor];
      v55 = [v71 leadingAnchor];
      id v52 = [v58 constraintEqualToAnchor:v55];
      v74[0] = v52;
      id v49 = [v27 trailingAnchor];
      int v28 = [v71 trailingAnchor];
      BOOL v29 = [v49 constraintEqualToAnchor:v28];
      v74[1] = v29;
      id v30 = [v27 topAnchor];
      v31 = [v71 topAnchor];
      uint64_t v32 = [v30 constraintEqualToAnchor:v31];
      v74[2] = v32;
      v33 = [v27 bottomAnchor];
      v34 = [v71 bottomAnchor];
      v35 = [v33 constraintEqualToAnchor:v34];
      v74[3] = v35;
      v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:4];
      [v72 addObjectsFromArray:v36];

      BOOL v6 = v70;
    }

    id v3 = v69;
    v5 = v71;
    id v4 = v72;
  }
  [MEMORY[0x1E4F28DC8] activateConstraints:v4];
}

- (void)viewDidAppear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)PREditorRootViewController;
  [(PREditorRootViewController *)&v13 viewDidAppear:a3];
  id v4 = [(PREditorRootViewController *)self currentLook];
  v5 = [(PREditorRootViewController *)self effectiveTitleStyleConfigurationForLook:v4];

  editorElementLayoutController = self->_editorElementLayoutController;
  double v7 = [v5 timeNumberingSystem];
  [(PREditorElementLayoutController *)editorElementLayoutController setNumberingSystem:v7];

  id v8 = [(PREditorRootViewController *)self currentLook];
  double v9 = [(PREditorRootViewController *)self timeViewControllerForLook:v8];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [v9 isFourDigitTime];
    [(PREditorRootViewController *)self setFourDigitTime:v10];
    [(PREditorElementLayoutController *)self->_editorElementLayoutController setFourDigitTime:v10];
  }
  [(PREditorRootViewController *)self _updateMenuElements];
  if (![(PREditorRootViewController *)self initialLayoutFinished])
  {
    [(PREditorRootViewController *)self setInitialLayoutFinished:1];
    v11 = [(PREditorRootViewController *)self editor];
    v12 = [v11 delegateSafeForCallbackType:3];
    if (objc_opt_respondsToSelector()) {
      [v12 editorDidFinishInitialLayout:v11];
    }
  }
}

- (void)viewDidLayoutSubviews
{
  OUTLINED_FUNCTION_3();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_18C1C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, 0x3Au);
}

void __51__PREditorRootViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 frameForPageAtLookIndex:a3];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  id v16 = [*(id *)(a1 + 32) timeViewControllerForLook:v6];

  double v15 = [v16 view];
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);
  objc_msgSend(v16, "pr_updateStyleBoundingRects");
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v13.receiver = self;
  v13.super_class = (Class)PREditorRootViewController;
  [(PREditorRootViewController *)&v13 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  id v6 = [(PREditorRootViewController *)self bottomControlsYConstraint];
  double v7 = [(PREditorRootViewController *)self view];
  if ([(PREditorRootViewController *)self _shouldShowQuickActionEditing]) {
    double v8 = -138.0;
  }
  else {
    double v8 = 0.0;
  }
  [v7 safeAreaInsets];
  double v9 = -20.0;
  if (v10 > 0.0) {
    double v9 = -10.0;
  }
  [v6 setConstant:v8 + v9];
  [(PREditorRootViewController *)self _updateButtonLayout];
  double v11 = [(PREditorRootViewController *)self dateProvider];
  double v12 = v11;
  if (a3) {
    [v11 addMinuteUpdateObserver:self];
  }
  else {
    [v11 removeMinuteUpdateObserver:self];
  }
  [(PREditorRootViewController *)self _updateComplicationsRowEmptyViewVisibilityAnimated:0];
  [(PREditorRootViewController *)self _updateComplicationSidebarEmptyViewVisibilityAnimated:0];
  [(PREditorRootViewController *)self setNeedsReticleVisibilityUpdate];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PREditorRootViewController;
  [(PREditorRootViewController *)&v4 traitCollectionDidChange:a3];
  [(PREditorRootViewController *)self setNeedsReticleVisibilityUpdate];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v32.receiver = self;
  v32.super_class = (Class)PREditorRootViewController;
  id v7 = a4;
  -[PREditorRootViewController viewWillTransitionToSize:withTransitionCoordinator:](&v32, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  double v8 = [(PREditorRootViewController *)self scrollView];
  double v9 = [(PREditorRootViewController *)self lookTransition];
  double v10 = v9;
  if (v9)
  {
    double v11 = [v9 destinationLook];
    double v12 = [(PREditorRootViewController *)self looks];
    uint64_t v13 = [v12 indexOfObject:v11];

    unint64_t v14 = [(PREditorRootViewController *)self viewIndexForLookIndex:v13];
  }
  else
  {
    [v8 contentOffset];
    unint64_t v14 = -[PREditorRootViewController lookIndexForContentOffset:](self, "lookIndexForContentOffset:");
  }
  double v15 = width * (double)v14;
  id v16 = objc_alloc_init(PREditingBottomLegibilityView);
  [(PREditingBottomLegibilityView *)v16 setShouldOverscan:1];
  if ([(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] == 1) {
    uint64_t v17 = 8;
  }
  else {
    uint64_t v17 = 4;
  }
  v18 = [(PREditorRootViewController *)self view];
  v19 = [v18 window];
  uint64_t v20 = [v19 windowScene];
  uint64_t v21 = [v20 interfaceOrientation];

  if ((unint64_t)(v21 - 1) < 2) {
    uint64_t v22 = 1;
  }
  else {
    uint64_t v22 = v17;
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __81__PREditorRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v27[3] = &unk_1E54DB678;
  v27[4] = self;
  id v28 = v8;
  double v29 = v15;
  uint64_t v30 = 0;
  uint64_t v31 = v22;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __81__PREditorRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v25[3] = &unk_1E54DB6A0;
  int v26 = v16;
  v23 = v16;
  id v24 = v8;
  [v7 animateAlongsideTransition:v27 completion:v25];
}

void __81__PREditorRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsReticleVisibilityUpdate];
  objc_msgSend(*(id *)(a1 + 40), "setContentOffset:animated:", 0, *(double *)(a1 + 48), *(double *)(a1 + 56));
  [*(id *)(a1 + 32) _updateScrollViewContentSize];
  id v2 = [*(id *)(a1 + 32) editor];
  id v3 = [v2 popoverPresentationController];
  uint64_t v4 = [v3 permittedArrowDirections];
  uint64_t v5 = *(void *)(a1 + 64);

  if (v4 != v5)
  {
    id v6 = [*(id *)(a1 + 32) editor];
    id v7 = [v6 popoverPresentationController];
    [v7 setPermittedArrowDirections:*(void *)(a1 + 64)];

    id v9 = [*(id *)(a1 + 32) editor];
    double v8 = [v9 fontAndColorPickerViewController];
    [v8 updatePopoverContentSize];
  }
}

uint64_t __81__PREditorRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShouldOverscan:0];
}

- (void)_updateScrollViewContentSize
{
  id v12 = [(PREditorRootViewController *)self looks];
  unint64_t v3 = [v12 count];
  uint64_t v4 = [(PREditorRootViewController *)self view];
  [v4 bounds];
  CGFloat x = v14.origin.x;
  CGFloat y = v14.origin.y;
  CGFloat width = v14.size.width;
  CGFloat height = v14.size.height;
  CGFloat v9 = CGRectGetWidth(v14) * (double)v3;
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  double v10 = CGRectGetHeight(v15);
  double v11 = [(PREditorRootViewController *)self scrollView];
  objc_msgSend(v11, "setContentSize:", v9, v10);
}

- (void)looksWillChange
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v3 = [(PREditorRootViewController *)self looks];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = [(PREditorRootViewController *)self timeViewControllerForLook:*(void *)(*((void *)&v10 + 1) + 8 * v7)];
        [v8 removeFromParentViewController];
        CGFloat v9 = [v8 view];
        [v9 removeFromSuperview];

        [v8 didMoveToParentViewController:0];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [(PREditorTitleViewControllerCoordinator *)self->_titleViewControllerCoordinator reloadData];
}

- (void)looksDidChange
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  [(PREditorRootViewController *)self _updateScrollViewContentSize];
  unint64_t v3 = [(PREditorRootViewController *)self editor];
  uint64_t v4 = [v3 environment];
  uint64_t v5 = [v4 role];

  uint64_t v6 = [(PREditorRootViewController *)self looks];
  unint64_t v32 = [v6 count];
  id v39 = [(PREditorRootViewController *)self currentLook];
  v33 = (void *)v5;
  v34 = v6;
  if ([v3 displaysHeaderElements])
  {
    uint64_t v7 = [(PREditorRootViewController *)self dateProvider];
    v37 = [v7 date];

    v36 = [(PREditorRootViewController *)self extensionBundleURL];
    v38 = v3;
    uint64_t v8 = [v3 timeViewControllerDisplayedElements];
    titleViewControllerCoordinator = self->_titleViewControllerCoordinator;
    if (!titleViewControllerCoordinator
      || ([(PREditorTitleViewControllerCoordinator *)titleViewControllerCoordinator role],
          long long v10 = objc_claimAutoreleasedReturnValue(),
          char v11 = [v10 isEqual:v5],
          v10,
          (v11 & 1) == 0))
    {
      long long v12 = [[PREditorTitleViewControllerCoordinator alloc] initWithRole:v5];
      long long v13 = self->_titleViewControllerCoordinator;
      self->_titleViewControllerCoordinator = v12;
    }
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id obj = v34;
    uint64_t v14 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v41 != v16) {
            objc_enumerationMutation(obj);
          }
          v18 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          v19 = [(PREditorRootViewController *)self effectiveTitleStyleConfigurationForLook:v18];
          uint64_t v20 = [(PREditorRootViewController *)self timeViewControllerForLook:v18];
          objc_msgSend(v20, "pr_setElements:", v8);
          objc_msgSend(v20, "pr_setDisplayDate:", v37);
          objc_msgSend(v20, "pr_setUsesEditingLayout:", -[PREditorRootViewController usesEditingLayout](self, "usesEditingLayout"));
          uint64_t v21 = [(PREditorRootViewController *)self editor];
          uint64_t v22 = [v21 posterRole];

          objc_msgSend(v20, "pr_setStylingFromTitleStyleConfiguration:withExtensionBundleURL:forRole:", v19, v36, v22);
          v23 = [v38 titleString];
          objc_msgSend(v20, "pr_setDisplayString:", v23);

          [(PREditorRootViewController *)self addChildViewController:v20];
          id v24 = [v20 view];
          objc_msgSend(v24, "setHidden:", objc_msgSend(v18, "isEqual:", v39) ^ 1);
          [(UIView *)self->_timeContainerView addSubview:v24];
          [(UIView *)self->_timeContainerView sendSubviewToBack:v24];
          [v20 didMoveToParentViewController:self];
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v15);
    }

    unint64_t v3 = v38;
  }
  [(PREditorRootViewController *)self _updateComplicationsVibrancyFromCurrentLook];
  int v25 = [(PREditorRootViewController *)self effectiveTitleStyleConfigurationForLook:v39];
  int v26 = [(PREditorRootViewController *)self subtitleViewController];
  char v27 = [(PREditorRootViewController *)self extensionBundleURL];
  id v28 = [v3 posterRole];
  objc_msgSend(v26, "pr_setStylingFromTitleStyleConfiguration:withExtensionBundleURL:forRole:", v25, v27, v28);
  double v29 = [(PREditorRootViewController *)self pageControl];
  [v29 setNumberOfPages:v32];
  [(PREditorRootViewController *)self updatePageControlCurrentPage];
  uint64_t v30 = [(PREditorRootViewController *)self lookNameLabel];
  uint64_t v31 = [v39 displayName];
  [v30 setText:v31];
  [v30 setHidden:v32 < 2];
}

- (void)updateForChangedTitleString
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(PREditorRootViewController *)self looks];
  uint64_t v4 = [(PREditorRootViewController *)self editor];
  uint64_t v5 = [v4 titleString];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        char v11 = -[PREditorRootViewController timeViewControllerForLook:](self, "timeViewControllerForLook:", *(void *)(*((void *)&v12 + 1) + 8 * v10), (void)v12);
        objc_msgSend(v11, "pr_setDisplayString:", v5);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)updateForChangedOverrideDate
{
  id v4 = [(PREditorRootViewController *)self dateProvider];
  unint64_t v3 = [v4 date];
  [(PREditorRootViewController *)self dateProvider:v4 didUpdateDate:v3];
}

- (void)updateTimeControllersForLookMap
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(PREditorRootViewController *)self editor];
  int v4 = [v3 displaysHeaderElements];

  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = [(PREditorRootViewController *)self looks];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          titleViewControllerCoordinator = self->_titleViewControllerCoordinator;
          long long v12 = [v10 identifier];
          [(PREditorTitleViewControllerCoordinator *)titleViewControllerCoordinator updateLookWithIdentifier:v12 withLook:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }
}

- (void)lookPropertiesDidChange
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  int v4 = [(PREditorRootViewController *)self editor];
  int v5 = [v4 displaysHeaderElements];

  if (v5)
  {
    aSelector = a2;
    [(PREditorRootViewController *)self updateTimeControllersForLookMap];
    uint64_t v6 = [(PREditorRootViewController *)self extensionBundleURL];
    uint64_t v7 = [(PREditorRootViewController *)self editor];
    uint64_t v8 = [v7 posterRole];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v9 = [(PREditorRootViewController *)self looks];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v46 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v31;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v31 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v30 + 1) + 8 * v13);
          long long v15 = [(PREditorRootViewController *)self effectiveTitleStyleConfigurationForLook:v14];
          long long v16 = [(PREditorRootViewController *)self timeViewControllerForLook:v14];
          if (!v16)
          {
            uint64_t v17 = [NSString stringWithFormat:@"Couldn't find titleViewController for look: %@", v14];
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
            {
              id v28 = NSStringFromSelector(aSelector);
              uint64_t v18 = (objc_class *)objc_opt_class();
              char v27 = NSStringFromClass(v18);
              *(_DWORD *)buf = 138544642;
              v35 = v28;
              __int16 v36 = 2114;
              v37 = v27;
              __int16 v38 = 2048;
              id v39 = self;
              __int16 v40 = 2114;
              long long v41 = @"PREditor.m";
              __int16 v42 = 1024;
              int v43 = 3539;
              __int16 v44 = 2114;
              uint64_t v45 = v17;
              _os_log_fault_impl(&dword_18C1C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
            }
          }
          objc_msgSend(v16, "pr_setStylingFromTitleStyleConfiguration:withExtensionBundleURL:forRole:", v15, v6, v8);

          ++v13;
        }
        while (v11 != v13);
        uint64_t v19 = [v9 countByEnumeratingWithState:&v30 objects:v46 count:16];
        uint64_t v11 = v19;
      }
      while (v19);
    }

    uint64_t v20 = [(PREditorRootViewController *)self editor];
    uint64_t v21 = [v20 configuredProperties];
    uint64_t v22 = [v21 titleStyleConfiguration];

    v23 = [(PREditorRootViewController *)self subtitleViewController];
    objc_msgSend(v23, "pr_setStylingFromTitleStyleConfiguration:withExtensionBundleURL:forRole:", v22, v6, v8);

    if ([v8 isEqual:@"PRPosterRoleIncomingCall"])
    {
      id v24 = [(PREditorRootViewController *)self editor];
      objc_msgSend(v24, "setDepthEffectDisallowed:", objc_msgSend(v22, "prefersVerticalTitleLayout"));
    }
    editorElementLayoutController = self->_editorElementLayoutController;
    int v26 = [v22 timeNumberingSystem];
    [(PREditorElementLayoutController *)editorElementLayoutController setNumberingSystem:v26];

    [(PREditorRootViewController *)self _updateComplicationsVibrancyFromCurrentLook];
    [(PREditorRootViewController *)self updateReticleViewFrames];
  }
}

- (void)lookBackgroundTypesDidChange
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  int v4 = [(PREditorRootViewController *)self editor];
  int v5 = [v4 displaysHeaderElements];

  if (v5)
  {
    aSelector = a2;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v6 = [(PREditorRootViewController *)self looks];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v40 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v25;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8 * v10);
          uint64_t v12 = [(PREditorRootViewController *)self effectiveTitleStyleConfigurationForLook:v11];
          uint64_t v13 = [(PREditorRootViewController *)self extensionBundleURL];
          uint64_t v14 = [v12 vibrancyConfigurationWithExtensionBundleURL:v13];
          uint64_t v15 = [v14 backgroundType];

          long long v16 = [(PREditorRootViewController *)self timeViewControllerForLook:v11];
          if (!v16)
          {
            uint64_t v17 = [NSString stringWithFormat:@"Couldn't find titleViewController for look: %@", v11];
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
            {
              uint64_t v22 = NSStringFromSelector(aSelector);
              uint64_t v18 = (objc_class *)objc_opt_class();
              uint64_t v19 = NSStringFromClass(v18);
              *(_DWORD *)buf = 138544642;
              double v29 = v22;
              __int16 v30 = 2114;
              uint64_t v31 = v19;
              uint64_t v20 = (void *)v19;
              __int16 v32 = 2048;
              long long v33 = self;
              __int16 v34 = 2114;
              v35 = @"PREditor.m";
              __int16 v36 = 1024;
              int v37 = 3567;
              __int16 v38 = 2114;
              id v39 = v17;
              _os_log_fault_impl(&dword_18C1C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
            }
          }
          objc_msgSend(v16, "pr_setBackgroundType:", v15);

          ++v10;
        }
        while (v8 != v10);
        uint64_t v21 = [v6 countByEnumeratingWithState:&v24 objects:v40 count:16];
        uint64_t v8 = v21;
      }
      while (v21);
    }

    [(PREditorRootViewController *)self _updateComplicationsVibrancyFromCurrentLook];
  }
}

- (void)updateReticleViewFrames
{
  id v6 = [(PREditorRootViewController *)self editor];
  double v3 = 0.0;
  if ([v6 areViewsSharedBetweenLooks])
  {
    int v4 = [(PREditorRootViewController *)self scrollView];
    [v4 contentOffset];
    double v3 = v5;
  }
  [(PREditorRootViewController *)self _updateReticleViewFramesWithOffset:v3];
}

- (void)_updateReticleViewFramesWithOffset:(double)a3
{
  id v112 = [(PREditorRootViewController *)self editor];
  double v5 = [(PREditorRootViewController *)self view];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  uint64_t v14 = [(PREditorRootViewController *)self editorElementLayoutController];
  v111 = [(PREditorRootViewController *)self configuredProperties];
  uint64_t v15 = [v111 titleStyleConfiguration];
  long long v16 = [v112 titleString];
  uint64_t v17 = [v15 effectiveTitleLayoutForText:v16];

  uint64_t v18 = [(PREditorRootViewController *)self reticleVibrancyView];
  int v19 = [v112 displaysHeaderElements];
  if (v18 && v19)
  {
    int v20 = [v112 displaysSubtitleElement];
    int v21 = [v112 areComplicationsAllowed];
    uint64_t v22 = 3;
    if (!v20) {
      uint64_t v22 = 1;
    }
    if (v21) {
      uint64_t v23 = v22 | 0xC;
    }
    else {
      uint64_t v23 = v22;
    }
    v107 = objc_msgSend(v14, "frameAttributesForElements:variant:titleLayout:withBoundingRect:", v23, 3, v17, v7, v9, v11, v13);
    [v107 rect];
    [v18 setFrame:v24 + a3];
    long long v25 = [(PREditorRootViewController *)self inlineComplicationReticleView];
    objc_msgSend(v14, "frameForElements:variant:withBoundingRect:", 2, 3, v7, v9, v11, v13);
    double v27 = v26;
    double v109 = v13;
    double v110 = v11;
    double v29 = v28;
    double v30 = v9;
    double v31 = v7;
    double v33 = v32;
    double v35 = v34;
    __int16 v36 = [v25 superview];
    objc_msgSend(v36, "convertRect:fromView:", v5, v27, v29, v33, v35);
    double v38 = v37;
    double v40 = v39;
    double v108 = a3;
    double v42 = v41;
    double v44 = v43;

    objc_msgSend(v25, "setFrame:", v38, v40, v42, v44);
    uint64_t v45 = [(PREditorRootViewController *)self titleReticleView];
    v46 = objc_msgSend(v14, "frameAttributesForElements:variant:titleLayout:withBoundingRect:", 1, 3, v17, v31, v30, v110, v109);
    [v46 rect];
    double v48 = v47;
    double v50 = v49;
    double v52 = v51;
    double v54 = v53;
    if (BSFloatLessThanFloat())
    {
      double v48 = v27;
      double v52 = v33;
    }
    double v7 = v31;
    double v9 = v30;
    double v11 = v110;
    v55 = [v45 superview];
    double v56 = v54;
    double v13 = v109;
    objc_msgSend(v55, "convertRect:fromView:", v5, v48, v50, v52, v56);
    double v58 = v57;
    double v60 = v59;
    double v62 = v61;
    double v64 = v63;

    objc_msgSend(v45, "setFrame:", v58, v60, v62, v64);
    v65 = [(PREditorRootViewController *)self complicationRowReticleView];
    objc_msgSend(v14, "frameForElements:variant:withBoundingRect:", 8, 3, v7, v9, v110, v109);
    double v67 = v66;
    double v69 = v68;
    double v71 = v70;
    double v73 = v72;
    v74 = [v65 superview];
    objc_msgSend(v74, "convertRect:fromView:", v5, v67, v69, v71, v73);
    double v76 = v75;
    double v78 = v77;
    double v80 = v79;
    double v82 = v81;

    double v83 = v76;
    a3 = v108;
    objc_msgSend(v65, "setFrame:", v83, v78, v80, v82);
    double v84 = [(PREditorRootViewController *)self complicationRowEmptyStateView];
    [v65 bounds];
    objc_msgSend(v84, "setFrame:");
  }
  double v85 = [(PREditorRootViewController *)self sidebarReticleVibrancyView];
  if (v85)
  {
    double v86 = objc_msgSend(v14, "frameAttributesForElements:variant:titleLayout:withBoundingRect:", 16, 3, 0, v7, v9, v11, v13);
    [v86 rect];
    [v85 setFrame:v87 + a3];
    double v88 = [(PREditorRootViewController *)self complicationSidebarReticleView];
    objc_msgSend(v14, "frameForElements:variant:withBoundingRect:", 16, 3, v7, v9, v11, v13);
    double v90 = v89;
    double v92 = v91;
    double v94 = v93;
    double v96 = v95;
    double v97 = [v88 superview];
    objc_msgSend(v97, "convertRect:fromView:", v5, v90, v92, v94, v96);
    double v99 = v98;
    double v101 = v100;
    double v103 = v102;
    double v105 = v104;

    objc_msgSend(v88, "setFrame:", v99, v101, v103, v105);
    v106 = [(PREditorRootViewController *)self complicationSidebarEmptyStateView];
    [v88 bounds];
    objc_msgSend(v106, "setFrame:");
  }
}

- (void)_updateComplicationsRowEmptyViewVisibility
{
}

- (void)_updateComplicationsRowEmptyViewVisibilityAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(PREditorRootViewController *)self view];
  double v6 = [v5 window];
  double v7 = [v6 windowScene];
  uint64_t v8 = [v7 interfaceOrientation];

  double v9 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v9 userInterfaceIdiom] == 1)
  {

    double v10 = 0.0;
    if ((unint64_t)(v8 - 3) < 2) {
      goto LABEL_11;
    }
  }
  else
  {
  }
  double v10 = 0.0;
  if ([(PREditorRootViewController *)self isTitleReticleActive]) {
    goto LABEL_11;
  }
  if ([(PREditorRootViewController *)self focusedComplicationElement])
  {
    if ([(PREditorRootViewController *)self focusedComplicationElement] != 2) {
      goto LABEL_11;
    }
LABEL_8:
    if (self->_complicationsRowConfigured) {
      double v10 = 0.0;
    }
    else {
      double v10 = 1.0;
    }
    goto LABEL_11;
  }
  if (![(PREditorRootViewController *)self areControlsHidden]) {
    goto LABEL_8;
  }
LABEL_11:
  if (self->_complicationsRowConfigured || !v3)
  {
    complicationRowEmptyStateView = self->_complicationRowEmptyStateView;
    [(PRComplicationEmptyStateView *)complicationRowEmptyStateView setAlpha:v10];
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __81__PREditorRootViewController__updateComplicationsRowEmptyViewVisibilityAnimated___block_invoke;
    v13[3] = &unk_1E54DB6C8;
    v13[4] = self;
    *(double *)&v13[5] = v10;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v13 animations:0.3];
  }
}

uint64_t __81__PREditorRootViewController__updateComplicationsRowEmptyViewVisibilityAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1304) setAlpha:*(double *)(a1 + 40)];
}

- (void)_updateComplicationSidebarEmptyViewVisibility
{
}

- (void)_updateComplicationSidebarEmptyViewVisibilityAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(PREditorRootViewController *)self view];
  double v6 = [v5 window];
  double v7 = [v6 windowScene];
  uint64_t v8 = [v7 interfaceOrientation];

  double v9 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v9 userInterfaceIdiom] == 1)
  {

    double v10 = 0.0;
    if ((unint64_t)(v8 - 1) < 2) {
      goto LABEL_11;
    }
  }
  else
  {
  }
  double v10 = 0.0;
  if ([(PREditorRootViewController *)self isTitleReticleActive]) {
    goto LABEL_11;
  }
  if ([(PREditorRootViewController *)self focusedComplicationElement])
  {
    if ([(PREditorRootViewController *)self focusedComplicationElement] != 3) {
      goto LABEL_11;
    }
LABEL_8:
    if (self->_complicationSidebarConfigured) {
      double v10 = 0.0;
    }
    else {
      double v10 = 1.0;
    }
    goto LABEL_11;
  }
  if (![(PREditorRootViewController *)self areControlsHidden]) {
    goto LABEL_8;
  }
LABEL_11:
  if (self->_complicationSidebarConfigured || !v3)
  {
    complicationSidebarEmptyStateView = self->_complicationSidebarEmptyStateView;
    [(PRComplicationEmptyStateView *)complicationSidebarEmptyStateView setAlpha:v10];
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __84__PREditorRootViewController__updateComplicationSidebarEmptyViewVisibilityAnimated___block_invoke;
    v13[3] = &unk_1E54DB6C8;
    v13[4] = self;
    *(double *)&v13[5] = v10;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v13 animations:0.3];
  }
}

uint64_t __84__PREditorRootViewController__updateComplicationSidebarEmptyViewVisibilityAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1320) setAlpha:*(double *)(a1 + 40)];
}

- (void)_updateComplicationsVibrancyFromCurrentLook
{
  uint64_t v3 = [(PREditorRootViewController *)self currentLook];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v17 = v3;
    double v5 = [(PREditorRootViewController *)self effectiveTitleStyleConfigurationForLook:v3];
    double v6 = [v5 titleContentStyle];
    uint64_t v7 = [v6 type];

    if (v7 == 1)
    {
      uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F4F8E8]) initWithEffectType:2 backgroundType:0 color:0];
    }
    else
    {
      double v9 = [(PREditorRootViewController *)self extensionBundleURL];
      uint64_t v8 = [v5 vibrancyConfigurationWithExtensionBundleURL:v9];
    }
    [(PREditorRootViewController *)self _setVibrancyConfiguration:v8];
    double v10 = [(PREditorRootViewController *)self subtitleViewController];
    double v11 = [v8 color];
    [v10 setTextColor:v11];

    objc_msgSend(v10, "setEffectType:", objc_msgSend(v8, "effectType"));
    objc_msgSend(v10, "setBackgroundType:", objc_msgSend(v8, "backgroundType"));
    double v12 = [v8 alternativeVibrancyEffectLUT];
    char v13 = objc_opt_respondsToSelector();
    uint64_t v14 = [v12 lutIdentifier];
    uint64_t v15 = [v12 bundleURL];
    if (v13) {
      [v10 setAlternativeVibrancyEffectLUTIdentifier:v14 alternativeVibrancyEffectLUTBundleURL:v15 luminanceReduced:0];
    }
    else {
      [v10 setAlternativeVibrancyEffectLUTIdentifier:v14 alternativeVibrancyEffectLUTBundleURL:v15];
    }

    long long v16 = [v8 groupName];
    [v10 setGroupName:v16];

    uint64_t v4 = v17;
  }
  MEMORY[0x1F41817F8](v3, v4);
}

- (void)_setVibrancyConfiguration:(id)a3
{
  id v4 = a3;
  double v5 = [(PREditorRootViewController *)self editor];
  [v5 setComplicationsVibrancyConfiguration:v4];

  id v9 = +[PREditingReticleView reticleVibrancyForVibrancyConfiguration:v4];

  double v6 = [(PREditorRootViewController *)self reticleVibrancyView];
  [v6 setConfiguration:v9];

  uint64_t v7 = [(PREditorRootViewController *)self sidebarReticleVibrancyView];
  [v7 setConfiguration:v9];

  uint64_t v8 = [(PREditorRootViewController *)self controlsDividerVibrancyView];
  [v8 setConfiguration:v9];
}

- (unint64_t)backgroundTypeForLook:(id)a3
{
  uint64_t v3 = [(PREditorRootViewController *)self effectiveTitleStyleConfigurationForLook:a3];
  [v3 contentsLuminance];
  unint64_t v5 = PRPosterContentsBackgroundTypeForLuminance(v4);

  return v5;
}

- (void)setLooks:(id)a3
{
}

- (void)setLooks:(id)a3 forUpdatingProperties:(BOOL)a4
{
  id v10 = a3;
  if ((BSEqualArrays() & 1) == 0)
  {
    if (a4)
    {
      double v6 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v10 copyItems:1];
      looks = self->_looks;
      self->_looks = v6;

      [(PREditorRootViewController *)self lookPropertiesDidChange];
    }
    else
    {
      [(PREditorRootViewController *)self looksWillChange];
      uint64_t v8 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v10 copyItems:1];
      id v9 = self->_looks;
      self->_looks = v8;

      [(PREditorRootViewController *)self looksDidChange];
    }
  }
}

- (id)viewForMenuElementIdentifier:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(PREditorRootViewController *)self leadingMenuElements];
  uint64_t v6 = [(PREditorRootViewController *)self trailingMenuElements];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1C978]);
  uint64_t v8 = [v7 arrayByAddingObjectsFromArray:v5];

  double v37 = (void *)v6;
  id v9 = [v8 arrayByAddingObjectsFromArray:v6];

  uint64_t v10 = [(PREditorRootViewController *)self leadingMenuElementViews];
  uint64_t v11 = [(PREditorRootViewController *)self trailingMenuElementViews];
  id v12 = objc_alloc_init(MEMORY[0x1E4F1C978]);
  __int16 v36 = (void *)v10;
  char v13 = [v12 arrayByAddingObjectsFromArray:v10];

  double v35 = (void *)v11;
  double v39 = [v13 arrayByAddingObjectsFromArray:v11];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v9;
  uint64_t v14 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = 0;
    uint64_t v17 = *(void *)v41;
    double v34 = v5;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v41 != v17) {
          objc_enumerationMutation(obj);
        }
        int v19 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        int v20 = objc_msgSend(v39, "objectAtIndex:", v16 + i, v34);
        uint64_t v21 = objc_opt_class();
        id v22 = v19;
        if (v21)
        {
          if (objc_opt_isKindOfClass()) {
            uint64_t v23 = v22;
          }
          else {
            uint64_t v23 = 0;
          }
        }
        else
        {
          uint64_t v23 = 0;
        }
        id v24 = v23;

        long long v25 = [v24 identifier];
        char v26 = [v25 isEqualToString:v4];

        if (v26) {
          goto LABEL_23;
        }
        uint64_t v27 = objc_opt_class();
        id v28 = v22;
        if (v27)
        {
          if (objc_opt_isKindOfClass()) {
            double v29 = v28;
          }
          else {
            double v29 = 0;
          }
        }
        else
        {
          double v29 = 0;
        }
        id v30 = v29;

        double v31 = [v30 identifier];
        char v32 = [v31 isEqualToString:v4];

        if (v32)
        {

LABEL_23:
          unint64_t v5 = v34;
          goto LABEL_24;
        }
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
      int v20 = 0;
      v16 += i;
      unint64_t v5 = v34;
      if (v15) {
        continue;
      }
      break;
    }
  }
  else
  {
    int v20 = 0;
  }
LABEL_24:

  return v20;
}

- (void)_updateMenuElements
{
  *(_WORD *)SEL v1 = 0;
  _os_log_fault_impl(&dword_18C1C4000, log, OS_LOG_TYPE_FAULT, "Poster editor supports a maximum of 2 trailing menu elements", v1, 2u);
}

- (id)_viewsForMenuElements:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (!v4) {
    goto LABEL_31;
  }
  uint64_t v36 = *(void *)v44;
  double v5 = *MEMORY[0x1E4F1DB28];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v44 != v36) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void **)(*((void *)&v43 + 1) + 8 * i);
      uint64_t v11 = objc_opt_class();
      id v12 = v10;
      if (v11)
      {
        if (objc_opt_isKindOfClass()) {
          char v13 = v12;
        }
        else {
          char v13 = 0;
        }
      }
      else
      {
        char v13 = 0;
      }
      id v14 = v13;

      uint64_t v15 = objc_opt_class();
      id v16 = v12;
      if (v15)
      {
        if (objc_opt_isKindOfClass()) {
          uint64_t v17 = v16;
        }
        else {
          uint64_t v17 = 0;
        }
      }
      else
      {
        uint64_t v17 = 0;
      }
      id v18 = v17;

      int v19 = [v14 identifier];
      int v20 = [v19 isEqualToString:PREditorPlaceholderActionIdentifier];

      if (v20)
      {
        uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1400]), "initWithFrame:", v5, v6, v7, v8);
        [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
        id v22 = [MEMORY[0x1E4FB1618] whiteColor];
        [v21 setColor:v22];

        [v21 startAnimating];
        [v37 addObject:v21];
        goto LABEL_29;
      }
      uint64_t v21 = +[PREditorMenuButton buttonWithType:0];
      [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
      uint64_t v23 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:26.0];
      [v21 setPreferredSymbolConfiguration:v23 forImageInState:0];
      id v24 = [v16 accessibilityLabel];
      [v21 setAccessibilityLabel:v24];

      long long v25 = [MEMORY[0x1E4FB1618] whiteColor];
      [v21 setTintColor:v25];

      [v21 setPointerInteractionEnabled:1];
      objc_initWeak(&location, self);
      objc_initWeak(&from, v21);
      char v26 = (void *)MEMORY[0x1E4FB13F0];
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __52__PREditorRootViewController__viewsForMenuElements___block_invoke;
      v38[3] = &unk_1E54DB6F0;
      objc_copyWeak(&v39, &location);
      objc_copyWeak(&v40, &from);
      uint64_t v27 = [v26 actionWithHandler:v38];
      [v21 addAction:v27 forControlEvents:0x4000];

      id v28 = [v14 identifier];
      if ([v28 isEqualToString:PREditorDepthEffectActionIdentifier])
      {

LABEL_21:
        double v31 = [(PREditorRootViewController *)self imageForDepthEffectActionTopLevelAction:1];
        [v21 setImage:v31 forState:0];
        goto LABEL_23;
      }
      double v29 = [v18 identifier];
      int v30 = [v29 isEqualToString:PREditorDepthEffectActionIdentifier];

      if (v30) {
        goto LABEL_21;
      }
      double v31 = [v16 image];
      [v21 setImage:v31 forState:0];
LABEL_23:

      if (v14)
      {
        [v21 addAction:v14 forControlEvents:0x2000];
LABEL_27:
        [v21 setShowsMenuAsPrimaryAction:v14 == 0];
        goto LABEL_28;
      }
      if (v18)
      {
        [v21 setMenu:v18];
        goto LABEL_27;
      }
LABEL_28:
      [v37 addObject:v21];
      objc_destroyWeak(&v40);
      objc_destroyWeak(&v39);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);

LABEL_29:
    }
    uint64_t v4 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
  }
  while (v4);
LABEL_31:

  if ([v37 count]) {
    char v32 = (void *)[v37 copy];
  }
  else {
    char v32 = 0;
  }

  return v32;
}

void __52__PREditorRootViewController__viewsForMenuElements___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained editor];
  id v5 = [v3 _acquireModalPresentationAssertionForReason:@"MenuPresentation"];

  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  [v4 setMenuPresentationAssertion:v5];
}

- (void)_updateButtonLayout
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  if ([(PREditorRootViewController *)self _appearState] == 2)
  {
    uint64_t v3 = [(PREditorRootViewController *)self leadingMenuElementViews];
    uint64_t v4 = [(PREditorRootViewController *)self trailingMenuElementViews];
    if (!(v3 | v4))
    {
LABEL_36:

      return;
    }
    id v5 = [(PREditorRootViewController *)self view];
    double v85 = [(PREditorRootViewController *)self pageControl];
    double v80 = [v5 safeAreaLayoutGuide];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1C978]);
    double v7 = [(id)v4 reverseObjectEnumerator];
    uint64_t v8 = [v7 allObjects];

    id v9 = [(id)v3 reverseObjectEnumerator];
    uint64_t v10 = [v9 allObjects];

    double v79 = (void *)v8;
    uint64_t v11 = [v6 arrayByAddingObjectsFromArray:v8];

    double v78 = (void *)v10;
    id v12 = [v11 arrayByAddingObjectsFromArray:v10];

    char v13 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v14 = [v13 userInterfaceIdiom];

    if ((v14 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      long long v106 = 0u;
      long long v107 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      id obj = v12;
      uint64_t v86 = [obj countByEnumeratingWithState:&v104 objects:v113 count:16];
      if (v86)
      {
        v74 = v12;
        double v75 = v5;
        uint64_t v76 = v4;
        uint64_t v77 = v3;
        id v15 = 0;
        uint64_t v82 = *(void *)v105;
        do
        {
          uint64_t v16 = 0;
          uint64_t v17 = v15;
          do
          {
            if (*(void *)v105 != v82) {
              objc_enumerationMutation(obj);
            }
            id v18 = *(void **)(*((void *)&v104 + 1) + 8 * v16);
            if (v17) {
              [v17 leadingAnchor];
            }
            else {
            double v89 = [v80 trailingAnchor];
            }
            double v92 = (void *)MEMORY[0x1E4F28DC8];
            double v101 = [v18 centerYAnchor];
            double v98 = [v85 centerYAnchor];
            double v95 = [v101 constraintEqualToAnchor:v98];
            v112[0] = v95;
            int v19 = [v18 widthAnchor];
            int v20 = [v19 constraintEqualToConstant:50.0];
            v112[1] = v20;
            uint64_t v21 = [v18 heightAnchor];
            id v22 = [v21 constraintEqualToConstant:50.0];
            v112[2] = v22;
            uint64_t v23 = [v18 trailingAnchor];
            id v24 = [v23 constraintEqualToAnchor:v89 constant:-22.0];
            v112[3] = v24;
            long long v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v112 count:4];
            [v92 activateConstraints:v25];

            id v15 = v18;
            ++v16;
            uint64_t v17 = v15;
          }
          while (v86 != v16);
          uint64_t v86 = [obj countByEnumeratingWithState:&v104 objects:v113 count:16];
        }
        while (v86);
        goto LABEL_34;
      }
LABEL_35:

      goto LABEL_36;
    }
    id obj = [v5 window];
    [obj frame];
    double Width = CGRectGetWidth(v115);
    if (Width >= 395.0) {
      double v27 = 44.0;
    }
    else {
      double v27 = 36.0;
    }
    if (Width >= 395.0) {
      double v28 = 34.0;
    }
    else {
      double v28 = 22.0;
    }
    if (Width < 390.0)
    {
      double v28 = 16.0;
      if ((unint64_t)[v12 count] >= 3) {
        [v85 _setPreferredNumberOfVisibleIndicators:4];
      }
    }
    uint64_t v76 = v4;
    uint64_t v77 = v3;
    v74 = v12;
    double v75 = v5;
    if ([(id)v3 count] == 1)
    {
      double v29 = [(id)v3 objectAtIndex:0];
      int v30 = (void *)MEMORY[0x1E4F28DC8];
      double v31 = [v29 centerYAnchor];
      char v32 = [v85 centerYAnchor];
      double v33 = [v31 constraintEqualToAnchor:v32];
      v111[0] = v33;
      double v34 = [v29 widthAnchor];
      double v102 = [v34 constraintEqualToConstant:50.0];
      v111[1] = v102;
      double v99 = [v29 heightAnchor];
      double v96 = [v99 constraintEqualToConstant:50.0];
      v111[2] = v96;
      double v35 = [v29 leadingAnchor];
      uint64_t v36 = [v80 leadingAnchor];
      id v37 = [v35 constraintEqualToAnchor:v36 constant:v27];
      v111[3] = v37;
      double v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v111 count:4];
      [v30 activateConstraints:v38];
    }
    else
    {
      if ([(id)v3 count] != 2) {
        goto LABEL_29;
      }
      double v29 = [(id)v3 objectAtIndex:0];
      id v39 = [(id)v3 objectAtIndex:1];
      double v90 = (void *)MEMORY[0x1E4F28DC8];
      double v93 = [v29 centerYAnchor];
      uint64_t v83 = [v85 centerYAnchor];
      uint64_t v87 = [v93 constraintEqualToAnchor:v83];
      v110[0] = v87;
      double v102 = [v29 widthAnchor];
      double v99 = [v102 constraintEqualToConstant:50.0];
      v110[1] = v99;
      double v96 = [v29 heightAnchor];
      uint64_t v70 = [v96 constraintEqualToConstant:50.0];
      v110[2] = v70;
      uint64_t v36 = [v29 leadingAnchor];
      id v37 = [v80 leadingAnchor];
      double v38 = [v36 constraintEqualToAnchor:v37 constant:v28];
      v110[3] = v38;
      double v72 = [v39 centerYAnchor];
      double v68 = [v85 centerYAnchor];
      double v66 = [v72 constraintEqualToAnchor:v68];
      v110[4] = v66;
      double v64 = [v39 widthAnchor];
      double v62 = [v64 constraintEqualToConstant:50.0];
      v110[5] = v62;
      double v60 = [v39 heightAnchor];
      id v40 = [v60 constraintEqualToConstant:50.0];
      v110[6] = v40;
      long long v41 = [v39 leadingAnchor];
      long long v42 = [v80 leadingAnchor];
      long long v43 = [v41 constraintEqualToAnchor:v42 constant:v28 + 50.0];
      v110[7] = v43;
      long long v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v110 count:8];
      [v90 activateConstraints:v44];

      double v33 = (void *)v83;
      double v31 = v39;
      double v35 = (void *)v70;

      double v34 = (void *)v87;
      char v32 = v93;
    }
    uint64_t v4 = v76;
    uint64_t v3 = v77;
    id v12 = v74;
    id v5 = v75;
LABEL_29:
    if ([(id)v4 count] == 1)
    {
      id v15 = [(id)v4 objectAtIndex:0];
      long long v45 = (void *)MEMORY[0x1E4F28DC8];
      long long v46 = [v15 centerYAnchor];
      double v47 = [v85 centerYAnchor];
      uint64_t v48 = [v46 constraintEqualToAnchor:v47];
      v109[0] = v48;
      double v49 = [v15 widthAnchor];
      double v103 = [v49 constraintEqualToConstant:50.0];
      v109[1] = v103;
      double v100 = [v15 heightAnchor];
      double v97 = [v100 constraintEqualToConstant:50.0];
      v109[2] = v97;
      double v50 = [v15 trailingAnchor];
      double v51 = [v80 trailingAnchor];
      double v52 = [v50 constraintEqualToAnchor:v51 constant:-v27];
      v109[3] = v52;
      double v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v109 count:4];
      [v45 activateConstraints:v53];
    }
    else
    {
      if ([(id)v4 count] != 2) {
        goto LABEL_35;
      }
      id v15 = [(id)v4 objectAtIndex:1];
      double v54 = [(id)v4 objectAtIndex:0];
      double v91 = (void *)MEMORY[0x1E4F28DC8];
      double v94 = [v15 centerYAnchor];
      uint64_t v84 = [v85 centerYAnchor];
      uint64_t v88 = [v94 constraintEqualToAnchor:v84];
      v108[0] = v88;
      double v103 = [v15 widthAnchor];
      double v100 = [v103 constraintEqualToConstant:50.0];
      v108[1] = v100;
      double v97 = [v15 heightAnchor];
      uint64_t v71 = [v97 constraintEqualToConstant:50.0];
      v108[2] = v71;
      double v51 = [v15 trailingAnchor];
      double v52 = [v80 trailingAnchor];
      double v53 = [v51 constraintEqualToAnchor:v52 constant:-v28];
      v108[3] = v53;
      double v73 = [v54 centerYAnchor];
      double v69 = [v85 centerYAnchor];
      double v67 = [v73 constraintEqualToAnchor:v69];
      v108[4] = v67;
      v65 = [v54 widthAnchor];
      double v63 = [v65 constraintEqualToConstant:50.0];
      v108[5] = v63;
      double v61 = [v54 heightAnchor];
      v55 = [v61 constraintEqualToConstant:50.0];
      v108[6] = v55;
      double v56 = [v54 trailingAnchor];
      double v57 = [v80 trailingAnchor];
      double v58 = [v56 constraintEqualToAnchor:v57 constant:-(v28 + 50.0)];
      v108[7] = v58;
      double v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v108 count:8];
      [v91 activateConstraints:v59];

      uint64_t v48 = (void *)v84;
      long long v46 = v54;
      double v50 = (void *)v71;

      double v49 = (void *)v88;
      double v47 = v94;
    }
LABEL_34:

    uint64_t v4 = v76;
    uint64_t v3 = v77;
    id v12 = v74;
    id v5 = v75;
    goto LABEL_35;
  }
}

- (void)updateTopButtonsLayoutWithLeadingTopButtonFrame:(CGRect)a3 trailingTopButtonFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  double v10 = a3.origin.y;
  double v11 = a3.origin.x;
  id v15 = [(PREditorRootViewController *)self view];
  if (![v15 effectiveUserInterfaceLayoutDirection])
  {
    double x = v11;
    double y = v10;
    double width = v9;
    double height = v8;
  }
  v17.origin.double x = x;
  v17.origin.double y = y;
  v17.size.double width = width;
  v17.size.double height = height;
  double MinY = CGRectGetMinY(v17);
  v18.origin.double x = x;
  v18.origin.double y = y;
  v18.size.double width = width;
  v18.size.double height = height;
  CGFloat MinX = CGRectGetMinX(v18);
  -[PREditorRootViewController setTopButtonsEdgeInsets:](self, "setTopButtonsEdgeInsets:", MinY, MinX, 0.0, MinX);
}

- (void)setTopButtonsEdgeInsets:(UIEdgeInsets)a3
{
  double left = a3.left;
  double top = a3.top;
  if (a3.left != self->_topButtonsEdgeInsets.left
    || a3.top != self->_topButtonsEdgeInsets.top
    || a3.right != self->_topButtonsEdgeInsets.right
    || a3.bottom != self->_topButtonsEdgeInsets.bottom)
  {
    self->_topButtonsEdgeInsets = a3;
    id v12 = [(PREditorRootViewController *)self leadingTopButtonXConstraint];
    [v12 setConstant:left];
    double v9 = [(PREditorRootViewController *)self leadingTopButtonYConstraint];
    [v9 setConstant:top];
    double v10 = [(PREditorRootViewController *)self trailingTopButtonXConstraint];
    [v10 setConstant:-left];
    double v11 = [(PREditorRootViewController *)self trailingTopButtonYConstraint];
    [v11 setConstant:top];
  }
}

- (void)setTopButtonsHidden:(BOOL)a3
{
  if (self->_topButtonsHidden != a3)
  {
    self->_topButtonsHidden = a3;
    [(PREditorRootViewController *)self updateTopButtonAlpha];
  }
}

- (void)updateTopButtonAlpha
{
  double v3 = 0.0;
  if (![(PREditorRootViewController *)self areTopButtonsHidden])
  {
    if ([(PREditorRootViewController *)self areControlsHidden]) {
      double v3 = 0.0;
    }
    else {
      double v3 = 1.0;
    }
  }
  uint64_t v4 = [(PREditorRootViewController *)self cancelButton];
  [v4 setAlpha:v3];

  id v5 = [(PREditorRootViewController *)self acceptButton];
  [v5 setAlpha:v3];
}

- (void)setAllUserInteractionDisabledExceptForCancelButton:(BOOL)a3
{
  v27[4] = *MEMORY[0x1E4F143B8];
  if (self->_allUserInteractionDisabledExceptForCancelButton != a3)
  {
    BOOL v3 = a3;
    self->_allUserInteractionDisabledExceptForCancelButton = a3;
    id v5 = [(PREditorRootViewController *)self view];
    id v6 = [(PREditorRootViewController *)self acceptButton];
    BOOL v7 = !v3;
    [v6 setEnabled:v7];
    if (v7)
    {
      CGRect v17 = [(PREditorRootViewController *)self touchBlockingView];
      [v17 removeFromSuperview];

      [(PREditorRootViewController *)self setTouchBlockingView:0];
    }
    else
    {
      long long v25 = [(PREditorRootViewController *)self cancelButton];
      [v5 bringSubviewToFront:v25];
      char v26 = v6;
      id v8 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      double v9 = [v8 layer];
      [v9 setHitTestsAsOpaque:1];

      [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v5 insertSubview:v8 belowSubview:v25];
      int v19 = (void *)MEMORY[0x1E4F28DC8];
      id v24 = [v8 leadingAnchor];
      uint64_t v23 = [v5 leadingAnchor];
      id v22 = [v24 constraintEqualToAnchor:v23];
      v27[0] = v22;
      uint64_t v21 = [v8 trailingAnchor];
      int v20 = [v5 trailingAnchor];
      CGRect v18 = [v21 constraintEqualToAnchor:v20];
      v27[1] = v18;
      double v10 = [v8 topAnchor];
      double v11 = [v5 topAnchor];
      id v12 = [v10 constraintEqualToAnchor:v11];
      v27[2] = v12;
      char v13 = [v8 bottomAnchor];
      uint64_t v14 = [v5 bottomAnchor];
      id v15 = [v13 constraintEqualToAnchor:v14];
      v27[3] = v15;
      uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:4];
      [v19 activateConstraints:v16];

      [(PREditorRootViewController *)self setTouchBlockingView:v8];
      id v6 = v26;
    }
  }
}

- (void)setDepthEffectDisabled:(BOOL)a3
{
  if (self->_depthEffectDisabled != a3)
  {
    self->_depthEffectDisabled = a3;
    [(PREditorRootViewController *)self depthEffectEnablementDidChange];
  }
}

- (void)depthEffectEnablementDidChange
{
  if (![(PREditorRootViewController *)self isViewLoaded]) {
    return;
  }
  id v10 = [(PREditorRootViewController *)self editor];
  BOOL v3 = [(PREditorRootViewController *)self reticleVibrancyView];
  BOOL v4 = [(PREditorRootViewController *)self isDepthEffectDisabled];
  if ([v10 areViewsSharedBetweenLooks])
  {
    id v5 = [(PREditorRootViewController *)self scrollView];
    id v6 = [(PREditorRootViewController *)self floatingContainerView];
    if (!v4)
    {
      BOOL v7 = [(PREditorRootViewController *)self sidebarReticleVibrancyView];
      if (v7)
      {
        id v8 = [(PREditorRootViewController *)self sidebarReticleVibrancyView];
        [v5 insertSubview:v6 belowSubview:v8];
      }
      else
      {
        id v8 = [(PREditorRootViewController *)self complicationsContainerView];
        [v5 insertSubview:v6 aboveSubview:v8];
      }

      goto LABEL_12;
    }
  }
  else
  {
    id v5 = [(PREditorRootViewController *)self view];
    id v6 = [(PREditorRootViewController *)self floatingContainerViewsZStackView];
    if (!v4)
    {
      double v9 = [(PREditorRootViewController *)self timeContainerScrollView];
      [v5 insertSubview:v6 aboveSubview:v9];

      goto LABEL_12;
    }
  }
  [v5 insertSubview:v6 belowSubview:v3];
LABEL_12:
}

- (id)imageForDepthEffectActionTopLevelAction:(BOOL)a3
{
  if (a3) {
    BOOL v3 = @"square.2.layers.3d.fill";
  }
  else {
    BOOL v3 = @"square.2.layers.3d";
  }
  BOOL v4 = [MEMORY[0x1E4FB1818] systemImageNamed:v3];
  return v4;
}

- (void)setSubtitleHidden:(BOOL)a3
{
  if (self->_subtitleHidden != a3)
  {
    BOOL v3 = a3;
    self->_subtitleHidden = a3;
    id v4 = [(PREditorRootViewController *)self subtitleViewController];
    objc_msgSend(v4, "pr_setSubtitleHidden:", v3);
  }
}

- (void)setUsesEditingLayout:(BOOL)a3
{
  if (self->_usesEditingLayout != a3)
  {
    BOOL v3 = a3;
    self->_usesEditingLayout = a3;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __51__PREditorRootViewController_setUsesEditingLayout___block_invoke;
    v6[3] = &__block_descriptor_33_e55_v16__0__UIViewController_PREditorTitleViewController__8l;
    BOOL v7 = a3;
    [(PREditorRootViewController *)self enumerateTimeViewControllersUsingBlock:v6];
    id v5 = [(PREditorRootViewController *)self subtitleViewController];
    [v5 setUsesEditingLayout:v3];
  }
}

uint64_t __51__PREditorRootViewController_setUsesEditingLayout___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pr_setUsesEditingLayout:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setControlsHidden:(BOOL)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (self->_controlsHidden != a3)
  {
    BOOL v3 = a3;
    self->_controlsHidden = a3;
    [(PREditorRootViewController *)self updateTopButtonAlpha];
    [(PREditorRootViewController *)self setNeedsReticleVisibilityUpdate];
    if (v3) {
      double v5 = 0.0;
    }
    else {
      double v5 = 1.0;
    }
    id v6 = [(PREditorRootViewController *)self lookNameLabel];
    [v6 setAlpha:v5];

    BOOL v7 = [(PREditorRootViewController *)self pageControl];
    [v7 setAlpha:v5];

    id v8 = [(PREditorRootViewController *)self contentOverlayView];
    [v8 setAlpha:v5];

    double v9 = [(PREditorRootViewController *)self bottomLegibilityView];
    [v9 setAlpha:v5];

    id v10 = [(PREditorRootViewController *)self controlsDividerView];
    [v10 setAlpha:v5];

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    double v11 = [(PREditorRootViewController *)self leadingMenuElementViews];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v26 != v14) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v25 + 1) + 8 * i) setAlpha:v5];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v13);
    }

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v16 = [(PREditorRootViewController *)self trailingMenuElementViews];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v22;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v22 != v19) {
            objc_enumerationMutation(v16);
          }
          [*(id *)(*((void *)&v21 + 1) + 8 * j) setAlpha:v5];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v18);
    }

    if (v3) {
      [(PREditorRootViewController *)self endLookInteractionHinting];
    }
  }
}

- (void)setComplicationsRowConfigured:(BOOL)a3
{
  if (self->_complicationsRowConfigured != a3)
  {
    self->_complicationsRowConfigured = a3;
    [(PREditorRootViewController *)self _updateComplicationsRowEmptyViewVisibility];
  }
}

- (void)setComplicationSidebarConfigured:(BOOL)a3
{
  if (self->_complicationSidebarConfigured != a3)
  {
    self->_complicationSidebarConfigured = a3;
    [(PREditorRootViewController *)self _updateComplicationSidebarEmptyViewVisibility];
  }
}

- (void)setFocusedComplicationElement:(int64_t)a3
{
  if (self->_focusedComplicationElement != a3)
  {
    self->_focusedComplicationElement = a3;
    [(PREditorRootViewController *)self setNeedsReticleVisibilityUpdate];
  }
}

- (void)setFocusedQuickActionPosition:(int64_t)a3
{
  if (self->_focusedQuickActionPosition != a3)
  {
    self->_focusedQuickActionPosition = a3;
    [(PREditorRootViewController *)self setNeedsReticleVisibilityUpdate];
    [(PREditorRootViewController *)self _setNeedsEditingElementsVisibilityUpdate];
  }
}

- (void)setTitleReticleActive:(BOOL)a3
{
  if (self->_titleReticleActive != a3)
  {
    self->_titleReticleActive = a3;
    [(PREditorRootViewController *)self setNeedsReticleVisibilityUpdate];
  }
}

- (void)setNeedsReticleVisibilityUpdate
{
  if (!self->_needsReticleVisibilityUpdate)
  {
    self->_needsReticleVisibilityUpdate = 1;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__PREditorRootViewController_setNeedsReticleVisibilityUpdate__block_invoke;
    block[3] = &unk_1E54DAFB8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __61__PREditorRootViewController_setNeedsReticleVisibilityUpdate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateReticleVisibilityIfNeeded];
}

- (void)_setNeedsEditingElementsVisibilityUpdate
{
  if (!self->_needsEditingElementsVisibilityUpdate)
  {
    self->_needsEditingElementsVisibilityUpdate = 1;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__PREditorRootViewController__setNeedsEditingElementsVisibilityUpdate__block_invoke;
    block[3] = &unk_1E54DAFB8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __70__PREditorRootViewController__setNeedsEditingElementsVisibilityUpdate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateEditingElementsVisibilityIfNeeded];
}

- (void)_updateEditingElementsVisibilityIfNeeded
{
  if (self->_needsEditingElementsVisibilityUpdate)
  {
    self->_needsEditingElementsVisibilityUpdate = 0;
    int64_t v3 = [(PREditorRootViewController *)self focusedQuickActionPosition];
    id v6 = [(PREditorRootViewController *)self timeContainerView];
    id v4 = [(PREditorRootViewController *)self complicationsContainerView];
    if (v3) {
      double v5 = 0.0;
    }
    else {
      double v5 = 1.0;
    }
    [v6 setAlpha:v5];
    [v4 setAlpha:v5];
  }
}

- (void)updateReticleVisibilityIfNeeded
{
  if (self->_needsReticleVisibilityUpdate)
  {
    self->_needsReticleVisibilityUpdate = 0;
    int64_t v3 = [(PREditorRootViewController *)self focusedComplicationElement];
    BOOL v4 = [(PREditorRootViewController *)self isTitleReticleActive];
    BOOL v5 = [(PREditorRootViewController *)self areControlsHidden];
    int64_t v6 = [(PREditorRootViewController *)self focusedQuickActionPosition];
    if (v4)
    {
      BOOL v7 = 0;
      BOOL v8 = 0;
      double v9 = 1.0;
      double v10 = 0.0;
    }
    else if (v3)
    {
      BOOL v7 = v3 == 2;
      BOOL v8 = v3 == 3;
      double v9 = 0.0;
      if (v3 == 1) {
        double v10 = 1.0;
      }
      else {
        double v10 = 0.0;
      }
    }
    else
    {
      if (v6) {
        char v11 = 1;
      }
      else {
        char v11 = v5;
      }
      if (v11)
      {
        BOOL v7 = 0;
        BOOL v8 = 0;
        double v10 = 0.0;
        double v9 = 0.0;
      }
      else
      {
        uint64_t v12 = [MEMORY[0x1E4FB16C8] currentDevice];
        uint64_t v13 = [v12 userInterfaceIdiom];

        double v10 = 1.0;
        if (v13 == 1)
        {
          uint64_t v14 = [(PREditorRootViewController *)self view];
          id v15 = [v14 window];
          uint64_t v16 = [v15 windowScene];
          uint64_t v17 = [v16 interfaceOrientation];

          BOOL v7 = (unint64_t)(v17 - 1) < 2;
          BOOL v8 = (unint64_t)(v17 - 3) < 2;
        }
        else
        {
          BOOL v8 = 0;
          BOOL v7 = 1;
        }
        double v9 = 1.0;
      }
    }
    id v21 = [(PREditorRootViewController *)self titleReticleView];
    uint64_t v18 = [(PREditorRootViewController *)self inlineComplicationReticleView];
    uint64_t v19 = [(PREditorRootViewController *)self complicationRowReticleView];
    int v20 = [(PREditorRootViewController *)self complicationSidebarReticleView];
    [v21 setAlpha:v9];
    [v18 setAlpha:v10];
    [v19 setAlpha:(double)v7];
    [v20 setAlpha:(double)v8];
    if (PREditingSupportsLiveBlurs())
    {
      [v21 setActive:v4];
      [v18 setActive:v3 == 1];
      [v19 setActive:v3 == 2];
      [v20 setActive:v3 == 3];
    }
    [(PREditorRootViewController *)self _updateComplicationsRowEmptyViewVisibility];
    [(PREditorRootViewController *)self _updateComplicationSidebarEmptyViewVisibility];
  }
}

- (void)setContentOverlayView:(id)a3
{
  BOOL v5 = (UIView *)a3;
  p_contentOverlayView = &self->_contentOverlayView;
  contentOverlayView = self->_contentOverlayView;
  if (contentOverlayView != v5)
  {
    int v20 = v5;
    BOOL v8 = contentOverlayView;
    double v9 = [(PREditorRootViewController *)self scrollView];
    [(UIView *)v20 bounds];
    -[UIView setFrame:](v20, "setFrame:");
    objc_storeStrong((id *)&self->_contentOverlayView, a3);
    BOOL v10 = [(PREditorRootViewController *)self areControlsHidden];
    double v11 = 1.0;
    if (v10) {
      double v11 = 0.0;
    }
    [(UIView *)v20 setAlpha:v11];
    if ([(PREditorRootViewController *)self isViewLoaded] && v9)
    {
      uint64_t v12 = [(UIView *)v8 superview];
      [(UIView *)v8 removeFromSuperview];
      contentOverlayContainerView = self->_contentOverlayContainerView;
      if (v12 == contentOverlayContainerView)
      {
        [(UIView *)v12 addSubview:v20];
      }
      else
      {
        uint64_t v14 = [(UIView *)contentOverlayContainerView subviews];
        id v15 = [v14 firstObject];
        uint64_t v16 = objc_opt_class();
        id v17 = v15;
        if (v16)
        {
          if (objc_opt_isKindOfClass()) {
            uint64_t v18 = v17;
          }
          else {
            uint64_t v18 = 0;
          }
        }
        else
        {
          uint64_t v18 = 0;
        }
        id v19 = v18;

        [v19 addContentView:*p_contentOverlayView];
      }
    }
    BOOL v5 = v20;
  }
}

- (void)scrollToLook:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [(PREditorRootViewController *)self looks];
  uint64_t v8 = [v7 indexOfObject:v6];

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(PREditorRootViewController *)self scrollToLookAtIndex:v8 animated:v4];
  }
}

- (void)scrollToLookAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(PREditorRootViewController *)self scrollView];
  [(PREditorRootViewController *)self scrollContentOffsetForLookAtIndex:a3];
  objc_msgSend(v7, "setContentOffset:animated:", v4);
}

- (CGPoint)scrollContentOffsetForLook:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PREditorRootViewController *)self looks];
  uint64_t v6 = [v5 indexOfObject:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v7 = *MEMORY[0x1E4F1DAD8];
    double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  else
  {
    [(PREditorRootViewController *)self scrollContentOffsetForLookAtIndex:v6];
  }
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (CGPoint)scrollContentOffsetForLookAtIndex:(unint64_t)a3
{
  BOOL v5 = [(PREditorRootViewController *)self scrollView];
  [v5 frame];
  double Width = CGRectGetWidth(v11);
  if ([v5 effectiveUserInterfaceLayoutDirection])
  {
    double v7 = [(PREditorRootViewController *)self looks];
    a3 = [v7 count] + ~a3;
  }
  double v8 = 0.0;
  double v9 = Width * (double)a3;
  result.double y = v8;
  result.double x = v9;
  return result;
}

- (id)lookAtScrollContentOffset:(CGPoint)a3
{
  return -[PREditorRootViewController lookAtScrollContentOffset:fractionOfDistanceThroughLook:](self, "lookAtScrollContentOffset:fractionOfDistanceThroughLook:", 0, a3.x, a3.y);
}

- (id)lookAtScrollContentOffset:(CGPoint)a3 fractionOfDistanceThroughLook:(double *)a4
{
  double x = a3.x;
  double v7 = [(PREditorRootViewController *)self scrollView];
  [v7 frame];
  CGFloat Width = CGRectGetWidth(v20);
  __double y = 0.0;
  long double v9 = modf(x / Width, &__y);
  BOOL v10 = [(PREditorRootViewController *)self looks];
  unint64_t v11 = [v10 count];
  unint64_t v12 = 0;
  double v13 = __y;
  if (__y >= 0.0) {
    unint64_t v12 = [(PREditorRootViewController *)self lookIndexForViewIndex:(unint64_t)__y];
  }
  unint64_t v14 = v11 - 1;
  if (!v11) {
    unint64_t v14 = 0;
  }
  if (v12 >= v11) {
    unint64_t v15 = v14;
  }
  else {
    unint64_t v15 = v12;
  }
  uint64_t v16 = objc_msgSend(v10, "objectAtIndex:", v15, v13);
  if (a4) {
    *a4 = v9;
  }

  return v16;
}

- (unint64_t)lookIndexForContentOffset:(CGPoint)a3
{
  double x = a3.x;
  id v4 = [(PREditorRootViewController *)self scrollView];
  [v4 frame];
  float v5 = x / CGRectGetWidth(v8);
  unint64_t v6 = vcvtms_u32_f32(v5);

  return v6;
}

- (unint64_t)lookIndexForViewIndex:(unint64_t)a3
{
  float v5 = [(PREditorRootViewController *)self view];
  uint64_t v6 = [v5 effectiveUserInterfaceLayoutDirection];

  if (v6)
  {
    double v7 = [(PREditorRootViewController *)self looks];
    a3 = [v7 count] + ~a3;
  }
  return a3;
}

- (unint64_t)viewIndexForLookIndex:(unint64_t)a3
{
  float v5 = [(PREditorRootViewController *)self view];
  uint64_t v6 = [v5 effectiveUserInterfaceLayoutDirection];

  if (v6)
  {
    double v7 = [(PREditorRootViewController *)self looks];
    a3 = [v7 count] + ~a3;
  }
  return a3;
}

- (CGRect)frameForPageAtViewIndex:(unint64_t)a3
{
  id v4 = [(PREditorRootViewController *)self view];
  [v4 bounds];
  CGFloat x = v15.origin.x;
  CGFloat y = v15.origin.y;
  CGFloat width = v15.size.width;
  CGFloat height = v15.size.height;
  double v9 = CGRectGetWidth(v15);
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  CGFloat v10 = CGRectGetHeight(v16);

  double v11 = 0.0;
  double v12 = v9 * (double)a3;
  double v13 = v9;
  double v14 = v10;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v11;
  result.origin.CGFloat x = v12;
  return result;
}

- (CGRect)frameForPageAtLookIndex:(unint64_t)a3
{
  unint64_t v4 = [(PREditorRootViewController *)self viewIndexForLookIndex:a3];
  [(PREditorRootViewController *)self frameForPageAtViewIndex:v4];
  result.size.CGFloat height = v8;
  result.size.CGFloat width = v7;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

- (void)requireGestureRecognizerToFailForLooksScroll:(id)a3
{
  scrollView = self->_scrollView;
  id v4 = a3;
  id v5 = [(UIScrollView *)scrollView panGestureRecognizer];
  [v5 requireGestureRecognizerToFail:v4];
}

- (void)updatePageControlCurrentPage
{
  id v6 = [(PREditorRootViewController *)self currentLook];
  int64_t v3 = [(PREditorRootViewController *)self looks];
  uint64_t v4 = [v3 indexOfObject:v6];
  id v5 = [(PREditorRootViewController *)self pageControl];
  [v5 setCurrentPage:v4];
}

- (void)pageControlCurrentPageDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 currentPage];
  uint64_t v6 = [v4 interactionState];

  id v7 = [(PREditorRootViewController *)self scrollView];
  [(PREditorRootViewController *)self scrollContentOffsetForLookAtIndex:v5];
  objc_msgSend(v7, "setContentOffset:animated:", v6 != 2);
  [(PREditorRootViewController *)self endLookInteractionHinting];
}

- (void)titleViewTapped:(id)a3
{
  id v3 = [(PREditorRootViewController *)self editor];
  [v3 presentTimeStyleEditor];
}

- (id)timeViewControllerForLook:(id)a3
{
  return [(PREditorTitleViewControllerCoordinator *)self->_titleViewControllerCoordinator titleViewControllerForLook:a3];
}

- (void)enumerateTimeViewControllersUsingBlock:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  [(PREditorRootViewController *)self loadViewIfNeeded];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [(PREditorRootViewController *)self looks];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        CGFloat v10 = [(PREditorRootViewController *)self timeViewControllerForLook:*(void *)(*((void *)&v11 + 1) + 8 * v9)];
        if (v10) {
          v4[2](v4, v10);
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (id)currentLook
{
  id v2 = [(PREditorRootViewController *)self editor];
  id v3 = [v2 currentLook];

  return v3;
}

- (id)configuredProperties
{
  id v2 = [(PREditorRootViewController *)self editor];
  id v3 = [v2 configuredProperties];

  return v3;
}

- (id)defaultTitleStyleConfigurationForLook:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PREditorRootViewController *)self editor];
  uint64_t v6 = [v5 defaultTitleStyleConfigurationForLook:v4];

  return v6;
}

- (id)effectiveTitleStyleConfigurationForLook:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PREditorRootViewController *)self editor];
  uint64_t v6 = [v5 effectiveTitleStyleConfigurationForLook:v4];

  return v6;
}

- (id)extensionBundleURL
{
  id v2 = [(PREditorRootViewController *)self editor];
  id v3 = [v2 extensionBundleURL];

  return v3;
}

- (void)didTransitionToLook:(id)a3 method:(int64_t)a4 progress:(double)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = PRLogEditing();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    CGFloat v10 = [v8 identifier];
    *(_DWORD *)buf = 138543874;
    long long v27 = v10;
    __int16 v28 = 2048;
    double v29 = a5;
    __int16 v30 = 1024;
    LODWORD(v31) = a4 == 1;
    _os_log_impl(&dword_18C1C4000, v9, OS_LOG_TYPE_DEFAULT, "did transition to look '%{public}@', progress: %f, discrete: %{BOOL}u", buf, 0x1Cu);
  }
  long long v11 = [(PREditorRootViewController *)self lookTransition];
  long long v12 = [(PREditorRootViewController *)self currentLook];
  if (([v11 matchesCurrentLook:v12 destinationLook:v8] & 1) == 0)
  {
    long long v13 = [v11 currentLook];
    long long v14 = [v11 destinationLook];
    CGRect v15 = PRLogEditing();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      [v13 identifier];
      uint64_t v16 = v25 = a4;
      [v14 identifier];
      id v17 = v24 = v13;
      uint64_t v18 = [v12 identifier];
      id v19 = [v8 identifier];
      *(_DWORD *)buf = 138544130;
      long long v27 = v16;
      __int16 v28 = 2114;
      double v29 = *(double *)&v17;
      __int16 v30 = 2114;
      uint64_t v31 = v18;
      __int16 v32 = 2114;
      double v33 = v19;
      _os_log_impl(&dword_18C1C4000, v15, OS_LOG_TYPE_DEFAULT, "Current coordinated transition ('%{public}@' -> '%{public}@') does not match '%{public}@' -> '%{public}@', invalidating", buf, 0x2Au);

      long long v13 = v24;
      a4 = v25;
    }

    CGRect v20 = [v11 destinationLook];
    int v21 = [v8 isEqual:v20];

    if (v21) {
      [v11 finishInteractiveTransition];
    }
    else {
      [v11 cancelInteractiveTransition];
    }

    goto LABEL_12;
  }
  if (!v11)
  {
LABEL_12:
    long long v11 = [(PREditorRootViewController *)self beginTransitionToLook:v8 method:a4];
  }
  [v11 updateInteractiveTransition:a5];
  long long v22 = [(PREditorRootViewController *)self editor];
  long long v23 = [v22 delegate];
  if (a5 >= 0.0 && a5 <= 1.0 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v23 editor:v22 didTransitionToLook:v8 progress:a5];
  }
}

- (id)beginTransitionToLook:(id)a3 method:(int64_t)a4
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = PRLogEditing();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v5 identifier];
    *(_DWORD *)buf = 138543362;
    double v68 = v7;
    _os_log_impl(&dword_18C1C4000, v6, OS_LOG_TYPE_DEFAULT, "Begin coordinated transition to look '%{public}@'", buf, 0xCu);
  }
  id v8 = [(PREditorRootViewController *)self currentLook];
  uint64_t v9 = [[PREditorLookTransition alloc] initWithCurrentLook:v8 destinationLook:v5];
  CGFloat v10 = [(PREditorRootViewController *)self effectiveTitleStyleConfigurationForLook:v8];
  long long v11 = [(PREditorRootViewController *)self effectiveTitleStyleConfigurationForLook:v5];
  long long v12 = [(PREditorRootViewController *)self extensionBundleURL];
  double v60 = v10;
  uint64_t v13 = [v10 vibrancyConfigurationWithExtensionBundleURL:v12];
  [v11 vibrancyConfigurationWithExtensionBundleURL:v12];
  v61 = double v53 = (void *)v13;
  char v55 = BSEqualObjects();
  [(PREditorTitleViewControllerCoordinator *)self->_titleViewControllerCoordinator prepareInteractiveTransitionForStartingLook:v8];
  uint64_t v52 = [(PREditorTitleViewControllerCoordinator *)self->_titleViewControllerCoordinator cachingVibrancyProviderForLook:v8];
  long long v14 = [(PREditorRootViewController *)self timeViewControllerForLook:v8];
  CGRect v15 = [(PREditorRootViewController *)self timeViewControllerForLook:v5];
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __59__PREditorRootViewController_beginTransitionToLook_method___block_invoke;
  v62[3] = &unk_1E54DB738;
  id v16 = v14;
  id v63 = v16;
  id v57 = v15;
  id v64 = v57;
  v65 = self;
  id v17 = v9;
  double v66 = v17;
  uint64_t v18 = MEMORY[0x192F91830](v62);
  uint64_t v19 = v18;
  double v50 = (void *)v18;
  double v51 = v16;
  if (a4 == 1)
  {
    (*(void (**)(uint64_t))(v18 + 16))(v18);
    CGRect v20 = v11;
  }
  else
  {
    CGRect v20 = v11;
    if ([(PREditorRootViewController *)self shouldFixTitleBetweenTransitionFromTitleStyleConfiguration:v60 toTitleStyleConfiguration:v11 extensionBundleURL:v12])
    {
      (*(void (**)(uint64_t))(v19 + 16))(v19);
      if (v55) {
        goto LABEL_10;
      }
      objc_msgSend(v16, "pr_baseFont");
      int v21 = (PREditorSlidingTitleTransition *)objc_claimAutoreleasedReturnValue();
      long long v22 = [(PREditorTitleViewControllerCoordinator *)self->_titleViewControllerCoordinator beginInteractiveTransitionForStartingLook:v8 toBaseFont:v21 vibrancyConfiguration:v61];
      [(PREditorLookTransition *)v17 setTitleStyleTransition:v22];
    }
    else
    {
      int v21 = [[PREditorSlidingTitleTransition alloc] initWithSourceTitleViewController:v16 destinationTitleViewController:v57];
      [(PREditorLookTransition *)v17 setTitleScrollingTransition:v21];
    }
  }
LABEL_10:
  long long v23 = [v8 displayName];
  long long v24 = [v5 displayName];
  int64_t v25 = [(PREditorRootViewController *)self lookNameLabel];
  [v25 setText:v23];
  double v49 = v25;
  uint64_t v48 = [v25 beginInteractiveTransitionToText:v24];
  -[PREditorLookTransition setLookNameTransition:](v17, "setLookNameTransition:");
  if (a4 == 1) {
    char v26 = 0;
  }
  else {
    char v26 = v55;
  }
  long long v27 = v53;
  if (v26)
  {
    __int16 v28 = (void *)v52;
  }
  else
  {
    long long v45 = v24;
    long long v46 = v23;
    id v59 = v5;
    double v29 = [v60 titleContentStyle];
    uint64_t v30 = [v29 type];

    if (v30 == 1)
    {
      uint64_t v31 = [objc_alloc(MEMORY[0x1E4F4F8E8]) initWithEffectType:2 backgroundType:0 color:0];

      long long v27 = (void *)v31;
    }
    double v56 = v8;
    __int16 v32 = [v20 titleContentStyle];
    uint64_t v33 = [v32 type];

    double v47 = v12;
    uint64_t v34 = v20;
    if (v33 == 1)
    {
      uint64_t v35 = [objc_alloc(MEMORY[0x1E4F4F8E8]) initWithEffectType:2 backgroundType:0 color:0];
    }
    else
    {
      uint64_t v35 = (uint64_t)v61;
    }
    __int16 v28 = (void *)v52;
    double v61 = (void *)v35;
    double v54 = [[PREditorLookSwitchingComplicationTransition alloc] initWithFromVibrancyConfiguration:v27 toVibrancyConfiguration:v35 viewController:self cachingVibrancyTransitionProvider:v52];
    [(PREditorLookTransition *)v17 setComplicationTransition:v54];
    uint64_t v36 = [(PREditorRootViewController *)self subtitleViewController];
    id v37 = [(PREditorRootViewController *)self extensionBundleURL];
    double v38 = [(PREditorRootViewController *)self editor];
    [v38 posterRole];
    v40 = id v39 = v27;

    long long v41 = [v34 effectiveTimeFontWithExtensionBundleURL:v37 forRole:v40];
    long long v42 = [v36 beginInteractiveTransitionToBaseFont:v41 vibrancyConfiguration:v35 cachingVibrancyTransitionProvider:v52];
    [(PREditorLookTransition *)v17 setSubtitleStyleTransition:v42];

    CGRect v20 = v34;
    long long v27 = v39;

    id v5 = v59;
    id v8 = v56;
    long long v23 = v46;
    long long v12 = v47;
    long long v24 = v45;
  }
  [(PREditorRootViewController *)self setLookTransition:v17];
  long long v43 = v17;

  return v43;
}

void __59__PREditorRootViewController_beginTransitionToLook_method___block_invoke(uint64_t a1)
{
  id v2 = [PREditorFixedTitleTransition alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 48) view];
  uint64_t v6 = [(PREditorFixedTitleTransition *)v2 initWithSourceTitleViewController:v3 destinationTitleViewController:v4 anchorView:v5];

  [*(id *)(a1 + 56) setTitleScrollingTransition:v6];
}

- (void)didFinishTransitionToLook:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PRLogEditing();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 identifier];
    int v20 = 138543362;
    int v21 = v6;
    _os_log_impl(&dword_18C1C4000, v5, OS_LOG_TYPE_DEFAULT, "Did finish transition to look '%{public}@'", (uint8_t *)&v20, 0xCu);
  }
  uint64_t v7 = [(PREditorRootViewController *)self lookTransition];
  id v8 = [v7 destinationLook];
  int v9 = [v4 isEqual:v8];
  if (v7)
  {
    CGFloat v10 = PRLogEditing();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_18C1C4000, v10, OS_LOG_TYPE_DEFAULT, "Finishing transition object successfully", (uint8_t *)&v20, 2u);
      }

      [v7 finishInteractiveTransition];
    }
    else
    {
      if (v11)
      {
        long long v12 = [v8 identifier];
        int v20 = 138543362;
        int v21 = v12;
        _os_log_impl(&dword_18C1C4000, v10, OS_LOG_TYPE_DEFAULT, "Canceling transition object (object look: '%{public}@')", (uint8_t *)&v20, 0xCu);
      }
      [v7 cancelInteractiveTransition];
    }
    [(PREditorRootViewController *)self setLookTransition:0];
  }
  uint64_t v13 = [(PREditorRootViewController *)self editor];
  [v13 didFinishTransitionToLook:v4];
  long long v14 = [v13 delegate];
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if (v9) {
      double v15 = 1.0;
    }
    else {
      double v15 = 0.0;
    }
    id v16 = PRLogEditing();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [v8 identifier];
      int v20 = 138543618;
      int v21 = v17;
      __int16 v22 = 2048;
      double v23 = v15;
      _os_log_impl(&dword_18C1C4000, v16, OS_LOG_TYPE_DEFAULT, "Sending final didTransitionToLook delegate method with look '%{public}@', progress: %f", (uint8_t *)&v20, 0x16u);
    }
    [v14 editor:v13 didTransitionToLook:v8 progress:v15];
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v18 = PRLogEditing();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = [v8 identifier];
      int v20 = 138543362;
      int v21 = v19;
      _os_log_impl(&dword_18C1C4000, v18, OS_LOG_TYPE_DEFAULT, "Sending didFinishTransitionToLook delegate method with look '%{public}@'", (uint8_t *)&v20, 0xCu);
    }
    [v14 editor:v13 didFinishTransitionToLook:v4];
  }
}

- (BOOL)shouldFixTitleBetweenTransitionFromTitleStyleConfiguration:(id)a3 toTitleStyleConfiguration:(id)a4 extensionBundleURL:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  BOOL v11 = [(PREditorRootViewController *)self editor];
  long long v12 = [v11 posterRole];

  uint64_t v13 = [v10 effectiveTimeFontWithExtensionBundleURL:v8 forRole:v12];

  long long v14 = [v9 effectiveTimeFontWithExtensionBundleURL:v8 forRole:v12];

  LOBYTE(v9) = [v13 isEqual:v14];
  return (char)v9;
}

- (void)forciblyFinishLookTransition
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PREditorRootViewController *)self lookTransition];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 destinationLook];
    uint64_t v6 = PRLogEditing();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [v5 identifier];
      int v12 = 138543362;
      uint64_t v13 = v7;
      _os_log_impl(&dword_18C1C4000, v6, OS_LOG_TYPE_DEFAULT, "Forcibly ending transition to look '%{public}@'", (uint8_t *)&v12, 0xCu);
    }
    id v8 = [(PREditorRootViewController *)self currentLook];
    if (([v8 isEqual:v5] & 1) == 0)
    {
      id v9 = PRLogEditing();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = [v5 identifier];
        int v12 = 138543362;
        uint64_t v13 = v10;
        _os_log_impl(&dword_18C1C4000, v9, OS_LOG_TYPE_DEFAULT, "Changing current look while forcibly ending transition to look '%{public}@'", (uint8_t *)&v12, 0xCu);
      }
      BOOL v11 = [(PREditorRootViewController *)self editor];
      [v11 setCurrentLook:v5];
    }
    [(PREditorRootViewController *)self didFinishTransitionToLook:v5];
  }
}

- (id)makeComplicationsHostingScene
{
  uint64_t v3 = objc_alloc_init(PREditorComplicationSceneSpecification);
  id v4 = [(PREditorRootViewController *)self makeComplicationHostingSceneWithSpecification:v3];

  return v4;
}

- (id)makeComplicationHostingSceneWithSpecification:(id)a3
{
  id v4 = a3;
  id v5 = [(PREditorRootViewController *)self editor];
  uint64_t v6 = [v5 sceneWorkspace];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__PREditorRootViewController_makeComplicationHostingSceneWithSpecification___block_invoke;
  v10[3] = &unk_1E54DB760;
  id v11 = v4;
  id v7 = v4;
  id v8 = [v6 createScene:v10];

  return v8;
}

void __76__PREditorRootViewController_makeComplicationHostingSceneWithSpecification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = NSString;
  id v4 = (void *)MEMORY[0x1E4F29128];
  id v5 = a2;
  uint64_t v6 = [v4 UUID];
  id v7 = [v6 UUIDString];
  id v8 = [v3 stringWithFormat:@"PREditor-%@", v7];
  [v5 setIdentifier:v8];

  [v5 setSpecification:*(void *)(a1 + 32)];
  id v9 = FBSSceneClientIdentity;
  id v11 = [MEMORY[0x1E4F96408] identityForAngelJobLabel:@"com.apple.PosterBoard"];
  id v10 = [v9 identityForProcessIdentity:v11];
  [v5 setClientIdentity:v10];
}

- (BOOL)_shouldShowQuickActionEditing
{
  if (!PRLockPickIsActive()) {
    return 0;
  }
  uint64_t v3 = [(PREditorRootViewController *)self editor];
  id v4 = [v3 posterRole];
  if ([v4 isEqualToString:@"PRPosterRoleLockScreen"])
  {
    id v5 = [(PREditorRootViewController *)self editor];
    BOOL v6 = [v5 variant] == 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)makeQuickActionsHostingScene
{
  uint64_t v3 = objc_alloc_init(PREditorQuickActionsSceneSpecification);
  id v4 = [(PREditorRootViewController *)self makeComplicationHostingSceneWithSpecification:v3];

  return v4;
}

- (id)makeQuickActionsHostingSceneWithSpecification:(id)a3
{
  id v4 = a3;
  id v5 = [(PREditorRootViewController *)self editor];
  BOOL v6 = [v5 sceneWorkspace];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__PREditorRootViewController_makeQuickActionsHostingSceneWithSpecification___block_invoke;
  v10[3] = &unk_1E54DB760;
  id v11 = v4;
  id v7 = v4;
  id v8 = [v6 createScene:v10];

  return v8;
}

void __76__PREditorRootViewController_makeQuickActionsHostingSceneWithSpecification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = NSString;
  id v4 = (void *)MEMORY[0x1E4F29128];
  id v5 = a2;
  BOOL v6 = [v4 UUID];
  id v7 = [v6 UUIDString];
  id v8 = [v3 stringWithFormat:@"PREditor-QuickActions-%@", v7];
  [v5 setIdentifier:v8];

  [v5 setSpecification:*(void *)(a1 + 32)];
  id v9 = FBSSceneClientIdentity;
  id v11 = [MEMORY[0x1E4F96408] identityForAngelJobLabel:@"com.apple.PosterBoard"];
  id v10 = [v9 identityForProcessIdentity:v11];
  [v5 setClientIdentity:v10];
}

- (void)disconnect
{
  if (![(PREditorRootViewController *)self isDisconnected])
  {
    [(PREditorRootViewController *)self setDisconnected:1];
  }
}

- (void)reconnect
{
  if ([(PREditorRootViewController *)self isDisconnected])
  {
    [(PREditorRootViewController *)self setDisconnected:0];
  }
}

- (void)setPresentingModalViewController:(BOOL)a3
{
  BOOL v3 = a3;
  v24[4] = *MEMORY[0x1E4F143B8];
  id v5 = [(PREditorRootViewController *)self presentationDismissalGestureView];
  id v6 = v5;
  if (!v3 || v5)
  {
    if (!v3 && v5)
    {
      [v5 removeFromSuperview];
      [(PREditorRootViewController *)self setPresentationDismissalGestureView:0];
    }
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    id v7 = [v6 layer];
    [v7 setHitTestsAsOpaque:1];

    double v23 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_modalPresentationDismissGestureDidFire_];
    [v6 addGestureRecognizer:v23];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PREditorRootViewController *)self setPresentationDismissalGestureView:v6];
    id v8 = [(PREditorRootViewController *)self view];
    [v8 addSubview:v6];
    id v17 = (void *)MEMORY[0x1E4F28DC8];
    __int16 v22 = [v6 leadingAnchor];
    int v21 = [v8 leadingAnchor];
    int v20 = [v22 constraintEqualToAnchor:v21];
    v24[0] = v20;
    uint64_t v19 = [v6 trailingAnchor];
    uint64_t v18 = [v8 trailingAnchor];
    id v9 = [v19 constraintEqualToAnchor:v18];
    v24[1] = v9;
    id v10 = [v6 topAnchor];
    id v11 = [v8 topAnchor];
    int v12 = [v10 constraintEqualToAnchor:v11];
    v24[2] = v12;
    uint64_t v13 = [v6 bottomAnchor];
    uint64_t v14 = [v8 bottomAnchor];
    double v15 = [v13 constraintEqualToAnchor:v14];
    v24[3] = v15;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];
    [v17 activateConstraints:v16];
  }
}

- (void)modalPresentationDismissGestureDidFire:(id)a3
{
  id v3 = [(PREditorRootViewController *)self editor];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (UIEdgeInsets)editingChromeDodgingInsets
{
  id v3 = [(PREditorRootViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  int v12 = [(PREditorRootViewController *)self editorElementLayoutController];
  uint64_t v13 = [(PREditorRootViewController *)self editor];
  int v14 = [v13 areComplicationsAllowed];

  unint64_t v15 = [(PREditorRootViewController *)self interfaceOrientation] - 1;
  [(PREditingStandaloneLabelView *)self->_lookNameLabel frame];
  double MinY = CGRectGetMinY(v39);
  if (v14)
  {
    id v17 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v18 = [v17 userInterfaceIdiom];

    if (v15 >= 2 && (v18 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      uint64_t v20 = 3;
    }
    else {
      uint64_t v20 = 11;
    }
  }
  else
  {
    uint64_t v20 = 3;
  }
  objc_msgSend(v12, "frameForElements:variant:withBoundingRect:", v20, 3, v5, v7, v9, v11);
  CGFloat MaxY = CGRectGetMaxY(v40);
  CGFloat MaxX = 0.0;
  if (v14
    && ([MEMORY[0x1E4FB16C8] currentDevice],
        double v23 = objc_claimAutoreleasedReturnValue(),
        uint64_t v24 = [v23 userInterfaceIdiom],
        v23,
        (v24 & 0xFFFFFFFFFFFFFFFBLL) == 1))
  {
    double v25 = 0.0;
    if (v15 >= 2)
    {
      objc_msgSend(v12, "frameForElements:variant:withBoundingRect:", 16, 3, v5, v7, v9, v11);
      CGFloat v27 = v26;
      CGFloat v29 = v28;
      CGFloat v37 = v31;
      CGFloat v38 = v30;
      __int16 v32 = (id *)MEMORY[0x1E4FB2608];
      if ([(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] != 1)
      {
        v41.origin.CGFloat x = v27;
        v41.origin.CGFloat y = v29;
        v41.size.CGFloat height = v37;
        v41.size.CGFloat width = v38;
        CGFloat MaxX = CGRectGetMaxX(v41);
      }
      if ([*v32 userInterfaceLayoutDirection] == 1)
      {
        v42.origin.CGFloat x = v27;
        v42.origin.CGFloat y = v29;
        v42.size.CGFloat height = v37;
        v42.size.CGFloat width = v38;
        double v25 = v9 - CGRectGetMinX(v42);
      }
    }
  }
  else
  {
    double v25 = 0.0;
  }

  double v33 = MaxY;
  double v34 = MaxX;
  double v35 = v11 - MinY;
  double v36 = v25;
  result.right = v36;
  result.bottom = v35;
  result.double left = v34;
  result.double top = v33;
  return result;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  double v9 = __41__PREditorRootViewController_description__block_invoke;
  double v10 = &unk_1E54DAA08;
  double v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  double v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return (NSString *)v5;
}

uint64_t __41__PREditorRootViewController_description__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendDescriptionToFormatter:*(void *)(a1 + 40)];
}

- (void)beginLookInteractionHinting
{
  id v3 = [(PREditorRootViewController *)self looks];
  if ((unint64_t)[v3 count] >= 2
    && ![(PREditorRootViewController *)self areControlsHidden])
  {
    id v4 = [(PREditorRootViewController *)self lookInteractionHintLabel];
    double v5 = PRBundle();
    double v6 = [v5 localizedStringForKey:@"EDIT_LOOKS_INTERACTION_HINT" value:&stru_1ED9A3120 table:@"PosterKit"];
    [v4 setText:v6];

    objc_initWeak(&location, self);
    uint64_t v7 = (void *)MEMORY[0x1E4F1CB00];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __57__PREditorRootViewController_beginLookInteractionHinting__block_invoke;
    uint64_t v13 = &unk_1E54DB788;
    objc_copyWeak(&v14, &location);
    uint64_t v8 = [v7 timerWithTimeInterval:0 repeats:&v10 block:5.0];
    double v9 = objc_msgSend(MEMORY[0x1E4F1CAC0], "currentRunLoop", v10, v11, v12, v13);
    [v9 addTimer:v8 forMode:*MEMORY[0x1E4F1C4B0]];

    [(PREditorRootViewController *)self setLookInteractionHintTimer:v8];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __57__PREditorRootViewController_beginLookInteractionHinting__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained endLookInteractionHinting];
}

- (void)endLookInteractionHinting
{
  if (![(PREditorRootViewController *)self isLookInteractionHintCompleted])
  {
    [(PREditorRootViewController *)self setLookInteractionHintCompleted:1];
    if ([(NSTimer *)self->_lookInteractionHintTimer isValid])
    {
      [(NSTimer *)self->_lookInteractionHintTimer invalidate];
      lookInteractionHintTimer = self->_lookInteractionHintTimer;
      self->_lookInteractionHintTimer = 0;

      id v4 = [(PREditorRootViewController *)self lookInteractionHintLabel];
      double v5 = (void *)MEMORY[0x1E4FB1EB0];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __55__PREditorRootViewController_endLookInteractionHinting__block_invoke;
      v12[3] = &unk_1E54DAFB8;
      id v13 = v4;
      id v6 = v4;
      [v5 animateWithDuration:v12 animations:0.2];
      uint64_t v7 = [(PREditorRootViewController *)self lookNameLabel];
      uint64_t v8 = (void *)MEMORY[0x1E4FB1EB0];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __55__PREditorRootViewController_endLookInteractionHinting__block_invoke_2;
      v10[3] = &unk_1E54DAFB8;
      id v11 = v7;
      id v9 = v7;
      [v8 animateWithDuration:0 delay:v10 options:0 animations:0.2 completion:0.1];
    }
  }
}

uint64_t __55__PREditorRootViewController_endLookInteractionHinting__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __55__PREditorRootViewController_endLookInteractionHinting__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (void)scrollViewDidScroll:(id)a3 withContext:(id *)a4
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (![(PREditorRootViewController *)self ignoresScrolling])
  {
    int64_t var0 = a4->var0;
    if (a4->var0 != 1) {
      [(PREditorRootViewController *)self endLookInteractionHinting];
    }
    [v6 contentOffset];
    long double v9 = v8;
    double x = a4->var2.x;
    [v6 frame];
    double Width = CGRectGetWidth(v87);
    id v12 = [(PREditorRootViewController *)self looks];
    uint64_t v76 = [v12 count];
    BOOL v13 = v9 > Width * (double)(unint64_t)(v76 - 1) || v9 < 0.0;
    double v14 = nexttoward(v9 + Width, v9);
    int v15 = v9 >= x || v13;
    int v16 = v9 < x || v13;
    if (v15) {
      double v17 = v9;
    }
    else {
      double v17 = v14;
    }
    if (v16) {
      double v18 = v9;
    }
    else {
      double v18 = v14;
    }
    double v84 = 0.0;
    uint64_t v19 = -[PREditorRootViewController lookAtScrollContentOffset:fractionOfDistanceThroughLook:](self, "lookAtScrollContentOffset:fractionOfDistanceThroughLook:", &v84, v17, 0.0);
    uint64_t v20 = -[PREditorRootViewController lookAtScrollContentOffset:fractionOfDistanceThroughLook:](self, "lookAtScrollContentOffset:fractionOfDistanceThroughLook:", 0, v18, 0.0);
    double v79 = [(PREditorRootViewController *)self editor];
    int v21 = [(PREditorRootViewController *)self currentLook];
    char v22 = [v19 isEqual:v21];

    if ((v22 & 1) == 0) {
      [v79 setCurrentLook:v19];
    }
    double v23 = [(PREditorRootViewController *)self contentOverlayContainerView];
    [v23 frame];
    double v78 = v23;
    objc_msgSend(v23, "setFrame:", (double)v9, 0.0);
    uint64_t v77 = v20;
    if ((PUIDynamicRotationIsActive() & 1) == 0)
    {
      uint64_t v24 = [v23 subviews];
      double v25 = [v24 firstObject];
      uint64_t v26 = objc_opt_class();
      id v27 = v25;
      if (v26)
      {
        if (objc_opt_isKindOfClass()) {
          double v28 = v27;
        }
        else {
          double v28 = 0;
        }
      }
      else
      {
        double v28 = 0;
      }
      id v29 = v28;

      [v29 frame];
      objc_msgSend(v29, "setFrame:", (double)v9, 0.0);

      uint64_t v20 = v77;
    }
    if (v13)
    {
      double v30 = [v12 lastObject];
      int v31 = [v19 isEqual:v30];
      BOOL v32 = v84 > 0.0;

      double v33 = v84;
      if ((v31 & v32) != 0) {
        double v33 = v84 + 1.0;
      }
    }
    else
    {
      BOOL v34 = v9 < x || var0 == 1;
      double v33 = v84;
      if (v34) {
        double v33 = 1.0 - v84;
      }
    }
    [(PREditorRootViewController *)self didTransitionToLook:v20 method:a4->var0 progress:v33];
    if ([v79 areViewsSharedBetweenLooks])
    {
      [(PREditorRootViewController *)self _updateReticleViewFramesWithOffset:(double)v9];
    }
    else
    {
      double v72 = v19;
      v74 = v12;
      double v35 = [(PREditorRootViewController *)self timeContainerScrollView];
      objc_msgSend(v35, "setContentOffset:", (double)v9, 0.0);

      [v6 bounds];
      double v37 = v36;
      double v75 = v6;
      [v6 bounds];
      double v39 = v38;
      uint64_t v71 = [(PREditorRootViewController *)self backgroundForegroundContainerViewsZStackView];
      CGRect v40 = [v71 subviews];
      CGRect v41 = [v40 reverseObjectEnumerator];
      CGRect v42 = [v41 allObjects];

      double v73 = self;
      uint64_t v70 = [(PREditorRootViewController *)self floatingContainerViewsZStackView];
      long long v43 = [v70 subviews];
      long long v44 = [v43 reverseObjectEnumerator];
      long long v45 = [v44 allObjects];

      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      id v46 = v42;
      uint64_t v47 = [v46 countByEnumeratingWithState:&v80 objects:v85 count:16];
      if (v47)
      {
        uint64_t v48 = v47;
        uint64_t v49 = *(void *)v81;
        double v50 = v9;
        do
        {
          for (uint64_t i = 0; i != v48; ++i)
          {
            if (*(void *)v81 != v49) {
              objc_enumerationMutation(v46);
            }
            uint64_t v52 = *(void **)(*((void *)&v80 + 1) + 8 * i);
            double v53 = fabs(v50);
            double v54 = v37 - v50;
            if (v50 <= 0.0) {
              double v54 = v37;
            }
            if (v53 <= v37) {
              double v55 = v54;
            }
            else {
              double v55 = 0.0;
            }
            double v56 = objc_msgSend(v45, "objectAtIndex:", objc_msgSend(v46, "indexOfObject:", *(void *)(*((void *)&v80 + 1) + 8 * i), v54));
            objc_msgSend(v56, "setFrame:", 0.0, 0.0, v55, v39);
            objc_msgSend(v52, "setFrame:", 0.0, 0.0, v55, v39);
            uint64_t IsZero = BSFloatIsZero();
            [v52 setHidden:IsZero];
            [v56 setHidden:IsZero];
            double v58 = [v52 layer];
            id v59 = [v56 layer];
            if ((IsZero & 1) != 0 || v50 >= 0.0 || v53 > v37)
            {
              [v58 setMask:0];
              [v59 setMask:0];
            }
            else
            {
              double v60 = [MEMORY[0x1E4F39C88] layer];
              objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", v53, 0.0, v37 - v53, v39, 0.0);
              id v61 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "setPath:", objc_msgSend(v61, "CGPath"));
              [v58 setMask:v60];
              [v59 setMask:v60];
            }
            double v50 = v50 - v37;
          }
          uint64_t v48 = [v46 countByEnumeratingWithState:&v80 objects:v85 count:16];
        }
        while (v48);
      }

      id v6 = v75;
      uint64_t v62 = [v75 effectiveUserInterfaceLayoutDirection];
      uint64_t v19 = v72;
      uint64_t v20 = v77;
      if (v9 >= x) {
        id v63 = v72;
      }
      else {
        id v63 = v77;
      }
      id v12 = v74;
      uint64_t v64 = [v74 indexOfObject:v63];
      if (v62) {
        double v65 = -(v9 - v37 * (double)(v76 - v64));
      }
      else {
        double v65 = v37 - (v9 - v37 * (double)v64);
      }
      double v66 = [v75 traitCollection];
      [v66 displayScale];
      BSFloatRoundForScale();
      double v68 = v67;

      uint64_t v69 = [(PREditorRootViewController *)v73 looksDividerView];
      objc_msgSend(v69, "setFrame:", v65 - v68, 0.0, 8.0, v39);
    }
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x = a4.x;
  id v15 = a3;
  if (![(PREditorRootViewController *)self ignoresScrolling]
    && ([v15 isPagingEnabled] & 1) == 0)
  {
    [v15 frame];
    double Width = CGRectGetWidth(v18);
    [v15 contentOffset];
    double v10 = v9 / Width;
    if (x > 0.1 || x >= -0.1 && modf(v10, &__y) >= 0.5) {
      double v10 = v10 + 1.0;
    }
    a5->double x = Width * floor(v10);
    id v11 = -[PREditorRootViewController lookAtScrollContentOffset:](self, "lookAtScrollContentOffset:");
    id v12 = [(PREditorRootViewController *)self looks];
    uint64_t v13 = [v12 indexOfObject:v11];

    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      double v14 = [(PREditorRootViewController *)self pageControl];
      [v14 setCurrentPage:v13];
    }
  }
}

- (void)scrollViewDidEndScrolling:(id)a3
{
  id v13 = a3;
  BOOL v4 = [(PREditorRootViewController *)self ignoresScrolling];
  id v5 = v13;
  if (!v4)
  {
    [v13 contentOffset];
    double v7 = v6;
    double v9 = v8;
    double v10 = [(PREditorRootViewController *)self currentLook];
    id v11 = -[PREditorRootViewController lookAtScrollContentOffset:](self, "lookAtScrollContentOffset:", v7, v9);
    if (([v11 isEqual:v10] & 1) == 0)
    {
      id v12 = [(PREditorRootViewController *)self editor];
      [v12 setCurrentLook:v11];
    }
    [(PREditorRootViewController *)self didFinishTransitionToLook:v11];

    id v5 = v13;
  }
  MEMORY[0x1F41817F8](v4, v5);
}

- (void)dateProvider:(id)a3 didUpdateDate:(id)a4
{
  id v5 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__PREditorRootViewController_dateProvider_didUpdateDate___block_invoke;
  v12[3] = &unk_1E54DB7B0;
  id v6 = v5;
  id v13 = v6;
  [(PREditorRootViewController *)self enumerateTimeViewControllersUsingBlock:v12];
  double v7 = [(PREditorRootViewController *)self subtitleViewController];
  [v7 setDisplayDate:v6];

  double v8 = [(PREditorRootViewController *)self currentLook];
  if (v8)
  {
    double v9 = [(PREditorRootViewController *)self timeViewControllerForLook:v8];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [v9 isFourDigitTime];
      if (self->_fourDigitTime != v10)
      {
        uint64_t v11 = v10;
        [(PREditorRootViewController *)self setFourDigitTime:v10];
        [(PREditorElementLayoutController *)self->_editorElementLayoutController setFourDigitTime:v11];
        [(PREditorRootViewController *)self updateReticleViewFrames];
      }
    }
  }
}

uint64_t __57__PREditorRootViewController_dateProvider_didUpdateDate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pr_setDisplayDate:", *(void *)(a1 + 32));
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(PREditorRootViewController *)self lookTransition];
  id v5 = (id)[v6 appendObject:v4 withName:@"lookTransition" skipIfNil:1];
}

- (PREditor)editor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editor);
  return (PREditor *)WeakRetained;
}

- (void)setEditor:(id)a3
{
}

- (PRDateProviding)dateProvider
{
  return self->_dateProvider;
}

- (void)setDateProvider:(id)a3
{
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (UIPageControl)pageControl
{
  return self->_pageControl;
}

- (void)setPageControl:(id)a3
{
}

- (PREditingReticleView)titleReticleView
{
  return self->_titleReticleView;
}

- (void)setTitleReticleView:(id)a3
{
}

- (UILayoutGuide)titlePopoverLayoutGuide
{
  return self->_titlePopoverLayoutGuide;
}

- (void)setTitlePopoverLayoutGuide:(id)a3
{
}

- (PREditingBottomLegibilityView)bottomLegibilityView
{
  return self->_bottomLegibilityView;
}

- (void)setBottomLegibilityView:(id)a3
{
}

- (UIView)backgroundContainerView
{
  return self->_backgroundContainerView;
}

- (void)setBackgroundContainerView:(id)a3
{
}

- (UIView)foregroundContainerView
{
  return self->_foregroundContainerView;
}

- (void)setForegroundContainerView:(id)a3
{
}

- (UIView)floatingContainerView
{
  return self->_floatingContainerView;
}

- (void)setFloatingContainerView:(id)a3
{
}

- (UIView)timeContainerView
{
  return self->_timeContainerView;
}

- (void)setTimeContainerView:(id)a3
{
}

- (UIView)complicationsContainerView
{
  return self->_complicationsContainerView;
}

- (void)setComplicationsContainerView:(id)a3
{
}

- (UIView)contentOverlayContainerView
{
  return self->_contentOverlayContainerView;
}

- (void)setContentOverlayContainerView:(id)a3
{
}

- (UIView)contentOverlayView
{
  return self->_contentOverlayView;
}

- (NSArray)looks
{
  return self->_looks;
}

- (NSArray)leadingMenuElements
{
  return self->_leadingMenuElements;
}

- (void)setLeadingMenuElements:(id)a3
{
}

- (NSArray)trailingMenuElements
{
  return self->_trailingMenuElements;
}

- (void)setTrailingMenuElements:(id)a3
{
}

- (BOOL)isSubtitleHidden
{
  return self->_subtitleHidden;
}

- (UIEdgeInsets)topButtonsEdgeInsets
{
  double top = self->_topButtonsEdgeInsets.top;
  double left = self->_topButtonsEdgeInsets.left;
  double bottom = self->_topButtonsEdgeInsets.bottom;
  double right = self->_topButtonsEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)areTopButtonsHidden
{
  return self->_topButtonsHidden;
}

- (BOOL)isAllUserInteractionDisabledExceptForCancelButton
{
  return self->_allUserInteractionDisabledExceptForCancelButton;
}

- (BOOL)usesEditingLayout
{
  return self->_usesEditingLayout;
}

- (BOOL)areControlsHidden
{
  return self->_controlsHidden;
}

- (BOOL)isComplicationsRowConfigured
{
  return self->_complicationsRowConfigured;
}

- (BOOL)isComplicationSidebarConfigured
{
  return self->_complicationSidebarConfigured;
}

- (int64_t)focusedComplicationElement
{
  return self->_focusedComplicationElement;
}

- (BOOL)isTitleReticleActive
{
  return self->_titleReticleActive;
}

- (BOOL)isDepthEffectDisabled
{
  return self->_depthEffectDisabled;
}

- (BOOL)isPresentingModalViewController
{
  return self->_presentingModalViewController;
}

- (BOOL)ignoresScrolling
{
  return self->_ignoresScrolling;
}

- (void)setIgnoresScrolling:(BOOL)a3
{
  self->_ignoresScrolling = a3;
}

- (int64_t)focusedQuickActionPosition
{
  return self->_focusedQuickActionPosition;
}

- (BOOL)isDisconnected
{
  return self->_disconnected;
}

- (void)setDisconnected:(BOOL)a3
{
  self->_disconnected = a3;
}

- (NSArray)leadingMenuElementViews
{
  return self->_leadingMenuElementViews;
}

- (void)setLeadingMenuElementViews:(id)a3
{
}

- (NSArray)trailingMenuElementViews
{
  return self->_trailingMenuElementViews;
}

- (void)setTrailingMenuElementViews:(id)a3
{
}

- (PREditingCancelButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (PREditingTitledButton)acceptButton
{
  return self->_acceptButton;
}

- (void)setAcceptButton:(id)a3
{
}

- (NSLayoutConstraint)bottomControlsYConstraint
{
  return self->_bottomControlsYConstraint;
}

- (void)setBottomControlsYConstraint:(id)a3
{
}

- (NSLayoutConstraint)leadingTopButtonXConstraint
{
  return self->_leadingTopButtonXConstraint;
}

- (void)setLeadingTopButtonXConstraint:(id)a3
{
}

- (NSLayoutConstraint)leadingTopButtonYConstraint
{
  return self->_leadingTopButtonYConstraint;
}

- (void)setLeadingTopButtonYConstraint:(id)a3
{
}

- (NSLayoutConstraint)trailingTopButtonXConstraint
{
  return self->_trailingTopButtonXConstraint;
}

- (void)setTrailingTopButtonXConstraint:(id)a3
{
}

- (NSLayoutConstraint)trailingTopButtonYConstraint
{
  return self->_trailingTopButtonYConstraint;
}

- (void)setTrailingTopButtonYConstraint:(id)a3
{
}

- (PREditingStandaloneLabelView)lookNameLabel
{
  return self->_lookNameLabel;
}

- (void)setLookNameLabel:(id)a3
{
}

- (PREditingStandaloneLabelView)lookInteractionHintLabel
{
  return self->_lookInteractionHintLabel;
}

- (void)setLookInteractionHintLabel:(id)a3
{
}

- (BOOL)presentedGalleryUpdatesLeadingControl
{
  return self->_presentedGalleryUpdatesLeadingControl;
}

- (void)setPresentedGalleryUpdatesLeadingControl:(BOOL)a3
{
  self->_presentedGalleryUpdatesLeadingControl = a3;
}

- (NSTimer)lookInteractionHintTimer
{
  return self->_lookInteractionHintTimer;
}

- (void)setLookInteractionHintTimer:(id)a3
{
}

- (BOOL)isLookInteractionHintCompleted
{
  return self->_lookInteractionHintCompleted;
}

- (void)setLookInteractionHintCompleted:(BOOL)a3
{
  self->_lookInteractionHintCompleted = a3;
}

- (CSProminentDisplayViewController)subtitleViewController
{
  return self->_subtitleViewController;
}

- (void)setSubtitleViewController:(id)a3
{
}

- (BSUIVibrancyEffectView)reticleVibrancyView
{
  return self->_reticleVibrancyView;
}

- (void)setReticleVibrancyView:(id)a3
{
}

- (BSUIVibrancyEffectView)sidebarReticleVibrancyView
{
  return self->_sidebarReticleVibrancyView;
}

- (void)setSidebarReticleVibrancyView:(id)a3
{
}

- (BSUIVibrancyEffectView)emptyVibrancyView
{
  return self->_emptyVibrancyView;
}

- (void)setEmptyVibrancyView:(id)a3
{
}

- (PREditingReticleView)inlineComplicationReticleView
{
  return self->_inlineComplicationReticleView;
}

- (void)setInlineComplicationReticleView:(id)a3
{
}

- (PREditingReticleView)complicationRowReticleView
{
  return self->_complicationRowReticleView;
}

- (void)setComplicationRowReticleView:(id)a3
{
}

- (PRComplicationEmptyStateView)complicationRowEmptyStateView
{
  return self->_complicationRowEmptyStateView;
}

- (void)setComplicationRowEmptyStateView:(id)a3
{
}

- (PREditingReticleView)complicationSidebarReticleView
{
  return self->_complicationSidebarReticleView;
}

- (void)setComplicationSidebarReticleView:(id)a3
{
}

- (PRComplicationEmptyStateView)complicationSidebarEmptyStateView
{
  return self->_complicationSidebarEmptyStateView;
}

- (void)setComplicationSidebarEmptyStateView:(id)a3
{
}

- (UIView)titleGestureView
{
  return self->_titleGestureView;
}

- (void)setTitleGestureView:(id)a3
{
}

- (PRComplicationSceneHostViewController)complicationHostViewController
{
  return self->_complicationHostViewController;
}

- (void)setComplicationHostViewController:(id)a3
{
}

- (PRQuickActionsSceneHostViewController)quickActionsHostViewController
{
  return self->_quickActionsHostViewController;
}

- (void)setQuickActionsHostViewController:(id)a3
{
}

- (PREditorLookTransition)lookTransition
{
  return self->_lookTransition;
}

- (void)setLookTransition:(id)a3
{
}

- (UIView)presentationDismissalGestureView
{
  return self->_presentationDismissalGestureView;
}

- (void)setPresentationDismissalGestureView:(id)a3
{
}

- (UIView)touchBlockingView
{
  return self->_touchBlockingView;
}

- (void)setTouchBlockingView:(id)a3
{
}

- (BOOL)needsReticleVisibilityUpdate
{
  return self->_needsReticleVisibilityUpdate;
}

- (void)setNeedsReticleVisibilityUpdate:(BOOL)a3
{
  self->_needsReticleVisibilityUpdate = a3;
}

- (BOOL)needsEditingElementsVisibilityUpdate
{
  return self->_needsEditingElementsVisibilityUpdate;
}

- (void)setNeedsEditingElementsVisibilityUpdate:(BOOL)a3
{
  self->_needsEditingElementsVisibilityUpdate = a3;
}

- (BOOL)initialLayoutFinished
{
  return self->_initialLayoutFinished;
}

- (void)setInitialLayoutFinished:(BOOL)a3
{
  self->_initialLayoutFinished = a3;
}

- (PREditorElementLayoutController)editorElementLayoutController
{
  return self->_editorElementLayoutController;
}

- (void)setEditorElementLayoutController:(id)a3
{
}

- (BOOL)fourDigitTime
{
  return self->_fourDigitTime;
}

- (void)setFourDigitTime:(BOOL)a3
{
  self->_fourDigitTime = a3;
}

- (BSUIVibrancyEffectView)controlsDividerVibrancyView
{
  return self->_controlsDividerVibrancyView;
}

- (void)setControlsDividerVibrancyView:(id)a3
{
}

- (UIView)controlsDividerView
{
  return self->_controlsDividerView;
}

- (void)setControlsDividerView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlsDividerView, 0);
  objc_storeStrong((id *)&self->_controlsDividerVibrancyView, 0);
  objc_storeStrong((id *)&self->_editorElementLayoutController, 0);
  objc_storeStrong((id *)&self->_touchBlockingView, 0);
  objc_storeStrong((id *)&self->_presentationDismissalGestureView, 0);
  objc_storeStrong((id *)&self->_lookTransition, 0);
  objc_storeStrong((id *)&self->_quickActionsHostViewController, 0);
  objc_storeStrong((id *)&self->_complicationHostViewController, 0);
  objc_storeStrong((id *)&self->_titleGestureView, 0);
  objc_storeStrong((id *)&self->_complicationSidebarEmptyStateView, 0);
  objc_storeStrong((id *)&self->_complicationSidebarReticleView, 0);
  objc_storeStrong((id *)&self->_complicationRowEmptyStateView, 0);
  objc_storeStrong((id *)&self->_complicationRowReticleView, 0);
  objc_storeStrong((id *)&self->_inlineComplicationReticleView, 0);
  objc_storeStrong((id *)&self->_emptyVibrancyView, 0);
  objc_storeStrong((id *)&self->_sidebarReticleVibrancyView, 0);
  objc_storeStrong((id *)&self->_reticleVibrancyView, 0);
  objc_storeStrong((id *)&self->_subtitleViewController, 0);
  objc_storeStrong((id *)&self->_lookInteractionHintTimer, 0);
  objc_storeStrong((id *)&self->_lookInteractionHintLabel, 0);
  objc_storeStrong((id *)&self->_lookNameLabel, 0);
  objc_storeStrong((id *)&self->_trailingTopButtonYConstraint, 0);
  objc_storeStrong((id *)&self->_trailingTopButtonXConstraint, 0);
  objc_storeStrong((id *)&self->_leadingTopButtonYConstraint, 0);
  objc_storeStrong((id *)&self->_leadingTopButtonXConstraint, 0);
  objc_storeStrong((id *)&self->_bottomControlsYConstraint, 0);
  objc_storeStrong((id *)&self->_acceptButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_trailingMenuElementViews, 0);
  objc_storeStrong((id *)&self->_leadingMenuElementViews, 0);
  objc_storeStrong((id *)&self->_trailingMenuElements, 0);
  objc_storeStrong((id *)&self->_leadingMenuElements, 0);
  objc_storeStrong((id *)&self->_looks, 0);
  objc_storeStrong((id *)&self->_contentOverlayView, 0);
  objc_storeStrong((id *)&self->_contentOverlayContainerView, 0);
  objc_storeStrong((id *)&self->_complicationsContainerView, 0);
  objc_storeStrong((id *)&self->_timeContainerView, 0);
  objc_storeStrong((id *)&self->_floatingContainerView, 0);
  objc_storeStrong((id *)&self->_foregroundContainerView, 0);
  objc_storeStrong((id *)&self->_backgroundContainerView, 0);
  objc_storeStrong((id *)&self->_bottomLegibilityView, 0);
  objc_storeStrong((id *)&self->_titlePopoverLayoutGuide, 0);
  objc_storeStrong((id *)&self->_titleReticleView, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_destroyWeak((id *)&self->_editor);
  objc_storeStrong((id *)&self->_titleViewControllerCoordinator, 0);
}

@end