@interface SBHAddWidgetDetailSheetViewController
- (BOOL)scrollingInitiatedByInfoScrollView;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (BSUIScrollView)contentScrollView;
- (BSUIScrollView)widgetGalleryScrollView;
- (BSUIScrollView)widgetInfoScrollView;
- (MTMaterialView)backgroundView;
- (MTMaterialView)magicPocketBackgroundView;
- (NSLayoutConstraint)addButtonBottomConstraint;
- (NSLayoutConstraint)addButtonTopConstraint;
- (NSLayoutConstraint)pageControlTopConstraint;
- (NSLayoutConstraint)topSpacingConstraint;
- (NSLayoutConstraint)widgetGalleryHeightConstraint;
- (NSMutableArray)pages;
- (NSMutableDictionary)userInfo;
- (SBFFluidBehaviorSettings)widgetInfoScrollViewAnimationSettings;
- (SBHAddWidgetButton)addButton;
- (SBHAddWidgetDetailSheetTitleView)titleView;
- (SBHAddWidgetDetailsSheetPageViewController)currentPage;
- (SBHApplicationWidgetCollection)applicationWidgetCollection;
- (SBHWidgetDragHandling)widgetDragHandler;
- (SBHWidgetSearchController)externalSearchController;
- (SBHWidgetSheetViewControllerPresenter)presenter;
- (UIButton)closeButton;
- (UIPageControl)pageControl;
- (UIStackView)contentStackView;
- (UIStackView)widgetGalleryStackView;
- (UIStackView)widgetInfoStackView;
- (UIView)addButtonContainerView;
- (UIView)addButtonStackSpacerView;
- (UIView)containerView;
- (UIView)headerView;
- (double)_minumumWidgetGalleryScrollViewHeight;
- (id)_currentGalleryItem;
- (id)_materialViewForVisualStyling;
- (id)_newBackgroundView;
- (id)backgroundViewMatchingMaterialBeneathPageViewController:(id)a3;
- (id)widgetInfoViews;
- (unint64_t)_closestPageWithGalleryItem:(id)a3;
- (unint64_t)_pageIndexAtContentOffset:(CGPoint)a3;
- (void)_addPage:(id)a3;
- (void)_contentSizeCategoryDidChange;
- (void)_createConstraints;
- (void)_createViews;
- (void)_scrollMainScrollViewToMatchInfoScrollViewIfNeeded;
- (void)_scrollToPageIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)_updateBackgroundRecipe;
- (void)_updateConstraintConstants;
- (void)_updateControlsForContentOffset:(CGPoint)a3 animated:(BOOL)a4;
- (void)_updateLayoutMargins;
- (void)_updateMaterialRecipeForBackgroundView:(id)a3;
- (void)_updatePageViewControllerAppearanceForFastScrollToTargetIndex:(unint64_t)a3;
- (void)_updatePageViewControllerAppearanceForNormalScroll;
- (void)_updatePageViewControllerAppearanceWithAppearedBlock:(id)a3;
- (void)_updateParallaxEffect;
- (void)_updateStackViewForSizeCategory;
- (void)addButtonTapped:(id)a3;
- (void)closeButtonTapped:(id)a3;
- (void)configureBackgroundView:(id)a3 matchingMaterialBeneathPageViewController:(id)a4;
- (void)configureForGalleryItem:(id)a3 selectedSizeClass:(int64_t)a4;
- (void)currentPage;
- (void)dealloc;
- (void)loadView;
- (void)pageControlChanged:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setAddButton:(id)a3;
- (void)setAddButtonBottomConstraint:(id)a3;
- (void)setAddButtonContainerView:(id)a3;
- (void)setAddButtonStackSpacerView:(id)a3;
- (void)setAddButtonTopConstraint:(id)a3;
- (void)setApplicationWidgetCollection:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setCloseButton:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setContentScrollView:(id)a3;
- (void)setContentStackView:(id)a3;
- (void)setExternalSearchController:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setMagicPocketBackgroundView:(id)a3;
- (void)setPageControl:(id)a3;
- (void)setPageControlTopConstraint:(id)a3;
- (void)setPages:(id)a3;
- (void)setPresenter:(id)a3;
- (void)setScrollingInitiatedByInfoScrollView:(BOOL)a3;
- (void)setTitleView:(id)a3;
- (void)setTopSpacingConstraint:(id)a3;
- (void)setWidgetGalleryHeightConstraint:(id)a3;
- (void)setWidgetGalleryScrollView:(id)a3;
- (void)setWidgetGalleryStackView:(id)a3;
- (void)setWidgetInfoScrollView:(id)a3;
- (void)setWidgetInfoScrollViewAnimationSettings:(id)a3;
- (void)setWidgetInfoStackView:(id)a3;
- (void)updateViewConstraints;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SBHAddWidgetDetailSheetViewController

- (void)loadView
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)SBHAddWidgetDetailSheetViewController;
  [(SBHAddWidgetDetailSheetViewController *)&v10 loadView];
  [(SBHAddWidgetDetailSheetViewController *)self _createViews];
  [(SBHAddWidgetDetailSheetViewController *)self _createConstraints];
  v3 = self;
  v12[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  id v5 = (id)[(SBHAddWidgetDetailSheetViewController *)self registerForTraitChanges:v4 withAction:sel__contentSizeCategoryDidChange];

  v6 = self;
  v11 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  id v8 = (id)[(SBHAddWidgetDetailSheetViewController *)self registerForTraitChanges:v7 withAction:sel__updateBackgroundRecipe];

  v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 addObserver:self selector:sel__contentSizeCategoryDidChange name:*MEMORY[0x1E4FB27A8] object:0];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB27A8] object:0];

  v4.receiver = self;
  v4.super_class = (Class)SBHAddWidgetDetailSheetViewController;
  [(SBHAddWidgetDetailSheetViewController *)&v4 dealloc];
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)SBHAddWidgetDetailSheetViewController;
  [(SBHAddWidgetDetailSheetViewController *)&v7 viewWillAppear:a3];
  objc_super v4 = SBLogWidgets();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    applicationWidgetCollection = self->_applicationWidgetCollection;
    *(_DWORD *)buf = 138543362;
    v9 = applicationWidgetCollection;
    _os_log_impl(&dword_1D7F0A000, v4, OS_LOG_TYPE_DEFAULT, "Presenting add widget detail sheet for applicationWidgetCollection: %{public}@", buf, 0xCu);
  }

  if (!self->_performedInitialSelection)
  {
    self->_performedInitialSelection = 1;
    [(SBHAddWidgetDetailSheetViewController *)self _scrollToPageIndex:self->_initialSelectionIndex animated:0];
    [(SBHAddWidgetDetailSheetViewController *)self scrollViewDidScroll:self->_widgetGalleryScrollView];
  }
  v6 = [(SBHAddWidgetDetailSheetViewController *)self navigationController];
  [v6 setNavigationBarHidden:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBHAddWidgetDetailSheetViewController;
  [(SBHAddWidgetDetailSheetViewController *)&v4 viewDidDisappear:a3];
  [(SBHWidgetSearchController *)self->_externalSearchController updateSearchBarBackgroundForScrollDistance:self forClient:2.22507386e-308];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __92__SBHAddWidgetDetailSheetViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_1E6AACFA8;
  v9[4] = self;
  id v7 = a4;
  [v7 animateAlongsideTransition:v9 completion:0];
  v8.receiver = self;
  v8.super_class = (Class)SBHAddWidgetDetailSheetViewController;
  -[SBHAddWidgetDetailSheetViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
}

uint64_t __92__SBHAddWidgetDetailSheetViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateConstraintConstants];
}

- (void)updateViewConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)SBHAddWidgetDetailSheetViewController;
  [(SBHAddWidgetDetailSheetViewController *)&v3 updateViewConstraints];
  [(SBHAddWidgetDetailSheetViewController *)self _updateConstraintConstants];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBHAddWidgetDetailSheetViewController;
  [(SBHAddWidgetDetailSheetViewController *)&v3 viewDidLayoutSubviews];
  [(SBHAddWidgetDetailSheetViewController *)self _updateLayoutMargins];
}

- (void)_createViews
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(SBHAddWidgetDetailSheetViewController *)self view];
  objc_super v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  containerView = self->_containerView;
  self->_containerView = v4;

  [(UIView *)self->_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
  unint64_t v84 = [(SBHAddWidgetSheetViewControllerBase *)self addWidgetSheetStyle];
  v80 = v3;
  if (v84 != 1)
  {
    v6 = [(SBHAddWidgetDetailSheetViewController *)self _newBackgroundView];
    backgroundView = self->_backgroundView;
    self->_backgroundView = v6;

    objc_super v8 = self->_backgroundView;
    [v3 bounds];
    -[MTMaterialView setFrame:](v8, "setFrame:");
    [(MTMaterialView *)self->_backgroundView setAutoresizingMask:18];
    [v3 addSubview:self->_backgroundView];
    [(SBHAddWidgetDetailSheetViewController *)self _updateMaterialRecipeForBackgroundView:self->_backgroundView];
  }
  v9 = (BSUIScrollView *)objc_alloc_init(MEMORY[0x1E4F4F8E0]);
  contentScrollView = self->_contentScrollView;
  self->_contentScrollView = v9;

  [(BSUIScrollView *)self->_contentScrollView setDelegate:self];
  [(BSUIScrollView *)self->_contentScrollView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(BSUIScrollView *)self->_contentScrollView setShowsVerticalScrollIndicator:0];
  [(BSUIScrollView *)self->_contentScrollView setShowsHorizontalScrollIndicator:0];
  [(BSUIScrollView *)self->_contentScrollView setContentInsetAdjustmentBehavior:2];
  [(BSUIScrollView *)self->_contentScrollView addSubview:self->_containerView];
  [v3 addSubview:self->_contentScrollView];
  v11 = (UIStackView *)objc_alloc_init(MEMORY[0x1E4FB1C60]);
  contentStackView = self->_contentStackView;
  self->_contentStackView = v11;

  [(UIStackView *)self->_contentStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_contentStackView setAxis:1];
  [(UIStackView *)self->_contentStackView setAlignment:0];
  [(UIView *)self->_containerView addSubview:self->_contentStackView];
  v13 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  headerView = self->_headerView;
  self->_headerView = v13;

  [(UIView *)self->_headerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_contentStackView addArrangedSubview:self->_headerView];
  if (![(SBHAddWidgetSheetViewControllerBase *)self addWidgetSheetStyle])
  {
    v15 = [(SBHAddWidgetDetailSheetViewController *)self traitCollection];
    [v15 displayScale];
    double v17 = v16;

    v18 = -[SBHAddWidgetDetailSheetTitleView initWithIconImageInfo:contentInsets:]([SBHAddWidgetDetailSheetTitleView alloc], "initWithIconImageInfo:contentInsets:", 30.0, 30.0, v17, 7.0, 21.0, 21.0, 21.0, 21.0);
    titleView = self->_titleView;
    self->_titleView = v18;

    [(SBHAddWidgetDetailSheetTitleView *)self->_titleView setTranslatesAutoresizingMaskIntoConstraints:0];
    v20 = [(SBHAddWidgetDetailSheetViewController *)self applicationWidgetCollection];
    v21 = [(SBHAddWidgetSheetViewControllerBase *)self appCellConfigurator];
    [v21 configureCell:self->_titleView withApplicationWidgetCollection:v20];

    [(UIView *)self->_headerView addSubview:self->_titleView];
  }
  if (v84 != 1)
  {
    v22 = [MEMORY[0x1E4FB14D0] buttonWithType:7];
    closeButton = self->_closeButton;
    self->_closeButton = v22;

    [(UIButton *)self->_closeButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)self->_closeButton addTarget:self action:sel_closeButtonTapped_ forControlEvents:64];
    [v3 addSubview:self->_closeButton];
  }
  v24 = (UIStackView *)objc_alloc_init(MEMORY[0x1E4FB1C60]);
  widgetInfoStackView = self->_widgetInfoStackView;
  self->_widgetInfoStackView = v24;

  [(UIStackView *)self->_widgetInfoStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_widgetInfoStackView setAxis:0];
  [(UIStackView *)self->_widgetInfoStackView setAlignment:0];
  v26 = (BSUIScrollView *)objc_alloc_init(MEMORY[0x1E4F4F8E0]);
  widgetInfoScrollView = self->_widgetInfoScrollView;
  self->_widgetInfoScrollView = v26;

  [(BSUIScrollView *)self->_widgetInfoScrollView setDelegate:self];
  [(BSUIScrollView *)self->_widgetInfoScrollView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(BSUIScrollView *)self->_widgetInfoScrollView setPagingEnabled:1];
  [(BSUIScrollView *)self->_widgetInfoScrollView setShowsHorizontalScrollIndicator:0];
  [(BSUIScrollView *)self->_widgetInfoScrollView addSubview:self->_widgetInfoStackView];
  [(UIStackView *)self->_contentStackView addArrangedSubview:self->_widgetInfoScrollView];
  v28 = (UIStackView *)objc_alloc_init(MEMORY[0x1E4FB1C60]);
  widgetGalleryStackView = self->_widgetGalleryStackView;
  self->_widgetGalleryStackView = v28;

  [(UIStackView *)self->_widgetGalleryStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_widgetGalleryStackView setSpacing:0.0];
  [(UIStackView *)self->_widgetGalleryStackView setAxis:0];
  v30 = (BSUIScrollView *)objc_alloc_init(MEMORY[0x1E4F4F8E0]);
  widgetGalleryScrollView = self->_widgetGalleryScrollView;
  self->_widgetGalleryScrollView = v30;

  [(BSUIScrollView *)self->_widgetGalleryScrollView setDelegate:self];
  [(BSUIScrollView *)self->_widgetGalleryScrollView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(BSUIScrollView *)self->_widgetGalleryScrollView setDecelerationRate:*MEMORY[0x1E4FB2EE8]];
  [(BSUIScrollView *)self->_widgetGalleryScrollView setClipsToBounds:0];
  [(BSUIScrollView *)self->_widgetGalleryScrollView setShowsHorizontalScrollIndicator:0];
  -[BSUIScrollView _setInterpageSpacing:](self->_widgetGalleryScrollView, "_setInterpageSpacing:", 0.0, 0.0);
  -[BSUIScrollView _setTouchInsets:](self->_widgetGalleryScrollView, "_setTouchInsets:", 0.0, -0.0, 0.0, -0.0);
  [(BSUIScrollView *)self->_widgetGalleryScrollView addSubview:self->_widgetGalleryStackView];
  [(UIStackView *)self->_contentStackView addArrangedSubview:self->_widgetGalleryScrollView];
  v32 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  pages = self->_pages;
  self->_pages = v32;

  [(SBHAddWidgetSheetViewControllerBase *)self allowedWidgets];
  char v86 = v34;
  uint64_t v83 = [(SBHAddWidgetSheetViewControllerBase *)self allowedWidgets];
  int64_t v82 = [(SBHAddWidgetSheetViewControllerBase *)self widgetWrapperViewControllerBackgroundType];
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  v88 = self;
  v35 = [(SBHAddWidgetDetailSheetViewController *)self applicationWidgetCollection];
  v36 = [v35 widgetDescriptors];

  id obj = v36;
  uint64_t v87 = [v36 countByEnumeratingWithState:&v112 objects:v117 count:16];
  if (v87)
  {
    uint64_t v85 = *(void *)v113;
    do
    {
      for (uint64_t i = 0; i != v87; ++i)
      {
        if (*(void *)v113 != v85) {
          objc_enumerationMutation(obj);
        }
        v38 = *(void **)(*((void *)&v112 + 1) + 8 * i);
        if ((v86 & 1) != 0
          || objc_msgSend(*(id *)(*((void *)&v112 + 1) + 8 * i), "sbh_canBeAddedToStack"))
        {
          v39 = [(SBHAddWidgetDetailSheetViewController *)v88 applicationWidgetCollection];
          int v40 = [v39 isDisfavored];

          uint64_t v41 = [(SBHAddWidgetSheetViewControllerBase *)v88 addWidgetSheetLocation];
          uint64_t v111 = 0;
          long long v109 = 0u;
          long long v110 = 0u;
          long long v107 = 0u;
          long long v108 = 0u;
          long long v105 = 0u;
          long long v106 = 0u;
          long long v104 = 0u;
          [(SBHAddWidgetSheetViewControllerBase *)v88 addWidgetSheetMetrics];
          if (v40) {
            uint64_t v42 = objc_msgSend(v38, "sbh_disfavoredSizeClassesForAddWidgetSheetLocation:", v41);
          }
          else {
            uint64_t v42 = objc_msgSend(v38, "sbh_favoredSizeClassesForAddWidgetSheetLocation:", v41);
          }
          v89[0] = MEMORY[0x1E4F143A8];
          int8x8_t v43 = (int8x8_t)(v42 & v83);
          v89[1] = 3221225472;
          v90 = __53__SBHAddWidgetDetailSheetViewController__createViews__block_invoke;
          v91 = &unk_1E6AB5100;
          v92 = v38;
          v93 = v88;
          int64_t v94 = v82;
          unint64_t v95 = v84;
          long long v100 = v108;
          long long v101 = v109;
          long long v102 = v110;
          uint64_t v103 = v111;
          long long v96 = v104;
          long long v97 = v105;
          long long v98 = v106;
          long long v99 = v107;
          v44 = v89;
          if (v43)
          {
            char v116 = 0;
            uint8x8_t v45 = (uint8x8_t)vcnt_s8(v43);
            v45.i16[0] = vaddlv_u8(v45);
            int v46 = v45.i32[0];
            if (v45.i32[0])
            {
              unint64_t v47 = 0;
              do
              {
                if (((1 << v47) & *(void *)&v43) != 0)
                {
                  ((void (*)(void *))v90)(v44);
                  if (v116) {
                    break;
                  }
                  --v46;
                }
                if (v47 > 0x3E) {
                  break;
                }
                ++v47;
              }
              while (v46 > 0);
            }
            objc_super v3 = v80;
          }

          v48 = [SBHAddWidgetDetailSheetWidgetDescriptionView alloc];
          v49 = objc_msgSend(v38, "sbh_widgetName");
          v50 = objc_msgSend(v38, "sbh_widgetDescription");
          v51 = [(SBHAddWidgetDetailSheetWidgetDescriptionView *)v48 initWithTitle:v49 subtitle:v50];

          v52 = [(SBHAddWidgetDetailSheetViewController *)v88 _materialViewForVisualStyling];
          v53 = [v52 visualStylingProviderForCategory:1];
          v54 = [(SBHAddWidgetDetailSheetWidgetDescriptionView *)v51 descriptionLabel];
          [v53 automaticallyUpdateView:v54 withStyle:2];

          [(SBHAddWidgetDetailSheetWidgetDescriptionView *)v51 setTranslatesAutoresizingMaskIntoConstraints:0];
          [(UIStackView *)v88->_widgetInfoStackView addArrangedSubview:v51];
          v55 = [(SBHAddWidgetDetailSheetWidgetDescriptionView *)v51 widthAnchor];
          v56 = [v3 widthAnchor];
          v57 = [v55 constraintEqualToAnchor:v56];
          [v57 setActive:1];
        }
      }
      uint64_t v87 = [obj countByEnumeratingWithState:&v112 objects:v117 count:16];
    }
    while (v87);
  }

  uint64_t v58 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:54];
  v59 = v88;
  magicPocketBackgroundView = v88->_magicPocketBackgroundView;
  v88->_magicPocketBackgroundView = (MTMaterialView *)v58;

  v61 = v88->_magicPocketBackgroundView;
  [(UIView *)v88->_addButtonContainerView bounds];
  -[MTMaterialView setFrame:](v61, "setFrame:");
  [(MTMaterialView *)v88->_magicPocketBackgroundView setAutoresizingMask:18];
  [(MTMaterialView *)v88->_magicPocketBackgroundView setGroupNameBase:@"Add-Sheet"];
  [(UIView *)v59->_addButtonContainerView addSubview:v59->_magicPocketBackgroundView];
  [(SBHAddWidgetDetailSheetViewController *)v59 _updateMaterialRecipeForBackgroundView:v59->_magicPocketBackgroundView];
  v62 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  addButtonStackSpacerView = v88->_addButtonStackSpacerView;
  v88->_addButtonStackSpacerView = v62;

  [(UIView *)v88->_addButtonStackSpacerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)v59->_contentStackView addArrangedSubview:v59->_addButtonStackSpacerView];
  v64 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  addButtonContainerView = v88->_addButtonContainerView;
  v88->_addButtonContainerView = v64;

  [(UIView *)v88->_addButtonContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)v59->_addButtonStackSpacerView addSubview:v59->_addButtonContainerView];
  v66 = objc_alloc_init(SBHAddWidgetButton);
  addButton = v88->_addButton;
  v88->_addButton = v66;

  [(SBHAddWidgetButton *)v88->_addButton setAddWidgetSheetStyle:v84];
  [(SBHAddWidgetButton *)v88->_addButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(SBHAddWidgetButton *)v59->_addButton addTarget:v59 action:sel_addButtonTapped_ forControlEvents:64];
  [(UIView *)v59->_addButtonContainerView addSubview:v59->_addButton];
  v68 = [(SBHApplicationWidgetCollection *)v88->_applicationWidgetCollection widgetDescriptors];
  v69 = [v68 firstObject];

  v70 = [(SBHAddWidgetButton *)v88->_addButton backgroundView];
  v71 = [v69 mostInterestingColor];
  if (v71)
  {
    [v70 setBackgroundColor:v71];
  }
  else
  {
    v72 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [v70 setBackgroundColor:v72];
  }
  v73 = v80;

  if ((unint64_t)[(NSMutableArray *)v88->_pages count] >= 2)
  {
    v74 = (UIPageControl *)objc_alloc_init(MEMORY[0x1E4FB1A40]);
    pageControl = v88->_pageControl;
    v88->_pageControl = v74;

    [(UIPageControl *)v88->_pageControl setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIPageControl *)v88->_pageControl setNumberOfPages:[(NSMutableArray *)v88->_pages count]];
    [(UIPageControl *)v88->_pageControl setCurrentPage:0];
    [(UIPageControl *)v88->_pageControl setHidesForSinglePage:1];
    v76 = v88->_pageControl;
    v77 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UIPageControl *)v76 setPageIndicatorTintColor:v77];

    v78 = v88->_pageControl;
    v73 = v80;
    v79 = [MEMORY[0x1E4FB1618] labelColor];
    [(UIPageControl *)v78 setCurrentPageIndicatorTintColor:v79];

    [(UIPageControl *)v88->_pageControl addTarget:v88 action:sel_pageControlChanged_ forControlEvents:4096];
    [(UIView *)v88->_addButtonContainerView addSubview:v88->_pageControl];
  }
}

void __53__SBHAddWidgetDetailSheetViewController__createViews__block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  id v5 = [SBHWidgetWrapperViewController alloc];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) listLayoutProvider];
  objc_super v8 = [*(id *)(a1 + 40) iconViewProvider];
  v9 = [(SBHWidgetWrapperViewController *)v5 initWithGalleryItem:v6 titleAndSubtitleVisible:0 listLayoutProvider:v7 iconViewProvider:v8];

  if ([*(id *)(a1 + 40) addWidgetSheetLocation] == 2) {
    [(SBHWidgetWrapperViewController *)v9 setUsesAmbientScaleFactorForRemovableBackgroundItems:1];
  }
  [(SBHWidgetWrapperViewController *)v9 setSelectedSizeClass:a3];
  [(SBHWidgetWrapperViewController *)v9 setBackgroundType:*(void *)(a1 + 48)];
  uint64_t v10 = [[SBHAddWidgetDetailsSheetPageViewController alloc] initWithWidgetWrapperViewController:v9];
  [(SBHAddWidgetDetailsSheetPageViewController *)v10 setAddWidgetSheetStyle:*(void *)(a1 + 56)];
  long long v11 = *(_OWORD *)(a1 + 144);
  v14[4] = *(_OWORD *)(a1 + 128);
  v14[5] = v11;
  v14[6] = *(_OWORD *)(a1 + 160);
  uint64_t v15 = *(void *)(a1 + 176);
  long long v12 = *(_OWORD *)(a1 + 80);
  v14[0] = *(_OWORD *)(a1 + 64);
  v14[1] = v12;
  long long v13 = *(_OWORD *)(a1 + 112);
  v14[2] = *(_OWORD *)(a1 + 96);
  v14[3] = v13;
  [(SBHAddWidgetDetailsSheetPageViewController *)v10 setAddWidgetSheetMetrics:v14];
  [(SBHAddWidgetDetailsSheetPageViewController *)v10 setDelegate:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 40) + 1408) addObject:v10];
  [*(id *)(a1 + 40) _addPage:v10];
}

- (void)_createConstraints
{
  v120[5] = *MEMORY[0x1E4F143B8];
  long long v112 = [(SBHAddWidgetDetailSheetViewController *)self view];
  id v3 = SBHPinViewWithinView(self->_contentScrollView, v112);
  id v4 = SBHPinViewWithinView(self->_containerView, self->_contentScrollView);
  id v5 = SBHPinViewWithinView(self->_contentStackView, self->_containerView);
  id v6 = SBHPinViewWithinView(self->_widgetInfoScrollView, self->_widgetInfoStackView);
  id v7 = SBHPinViewWithinView(self->_widgetGalleryScrollView, self->_widgetGalleryStackView);
  objc_super v8 = [(BSUIScrollView *)self->_contentScrollView contentLayoutGuide];
  v9 = [(BSUIScrollView *)self->_contentScrollView frameLayoutGuide];
  uint64_t v10 = [(UIStackView *)self->_widgetGalleryStackView heightAnchor];
  long long v11 = [v10 constraintGreaterThanOrEqualToConstant:0.0];
  widgetGalleryHeightConstraint = self->_widgetGalleryHeightConstraint;
  self->_widgetGalleryHeightConstraint = v11;

  long long v97 = (void *)MEMORY[0x1E4F28DC8];
  long long v109 = [v8 heightAnchor];
  long long v104 = [v9 heightAnchor];
  long long v101 = [v109 constraintGreaterThanOrEqualToAnchor:v104];
  v120[0] = v101;
  long long v108 = v8;
  long long v98 = [v8 widthAnchor];
  long long v107 = v9;
  long long v13 = [v9 widthAnchor];
  v14 = [v98 constraintEqualToAnchor:v13];
  v120[1] = v14;
  uint64_t v15 = [(BSUIScrollView *)self->_widgetInfoScrollView heightAnchor];
  double v16 = [(UIStackView *)self->_widgetInfoStackView heightAnchor];
  double v17 = [v15 constraintEqualToAnchor:v16];
  v120[2] = v17;
  v18 = [(BSUIScrollView *)self->_widgetGalleryScrollView heightAnchor];
  v19 = [(UIStackView *)self->_widgetGalleryStackView heightAnchor];
  v20 = [v18 constraintEqualToAnchor:v19];
  v21 = self->_widgetGalleryHeightConstraint;
  v120[3] = v20;
  v120[4] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v120 count:5];
  [v97 activateConstraints:v22];

  if (self->_closeButton)
  {
    [(SBHAddWidgetDetailSheetTitleView *)self->_titleView contentInsets];
    double v24 = v23;
    double v26 = v25;
    v27 = (void *)MEMORY[0x1E4F28DC8];
    v28 = [(UIButton *)self->_closeButton trailingAnchor];
    v29 = [v112 trailingAnchor];
    v30 = [v28 constraintEqualToAnchor:v29 constant:-v26];
    v119[0] = v30;
    v31 = [(UIButton *)self->_closeButton topAnchor];
    v32 = [v112 topAnchor];
    v33 = [v31 constraintEqualToAnchor:v32 constant:v24];
    v119[1] = v33;
    char v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v119 count:2];
    [v27 activateConstraints:v34];
  }
  titleView = self->_titleView;
  if (titleView)
  {
    long long v99 = (void *)MEMORY[0x1E4F28DC8];
    long long v105 = [(SBHAddWidgetDetailSheetTitleView *)titleView leadingAnchor];
    long long v102 = [(UIView *)self->_headerView leadingAnchor];
    v36 = [v105 constraintEqualToAnchor:v102];
    v118[0] = v36;
    v37 = [(SBHAddWidgetDetailSheetTitleView *)self->_titleView trailingAnchor];
    v38 = [(UIView *)self->_headerView trailingAnchor];
    v39 = [v37 constraintEqualToAnchor:v38];
    v118[1] = v39;
    int v40 = [(SBHAddWidgetDetailSheetTitleView *)self->_titleView topAnchor];
    uint64_t v41 = [(UIView *)self->_headerView topAnchor];
    uint64_t v42 = [v40 constraintEqualToAnchor:v41];
    v118[2] = v42;
    int8x8_t v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v118 count:3];
    [v99 activateConstraints:v43];

    v44 = [(UIView *)self->_headerView bottomAnchor];
    uint8x8_t v45 = [(SBHAddWidgetDetailSheetTitleView *)self->_titleView bottomAnchor];
    int v46 = [v44 constraintEqualToAnchor:v45];
    topSpacingConstraint = self->_topSpacingConstraint;
    self->_topSpacingConstraint = v46;
  }
  else
  {
    v44 = [(UIView *)self->_headerView heightAnchor];
    v48 = [v44 constraintEqualToConstant:0.0];
    uint8x8_t v45 = self->_topSpacingConstraint;
    self->_topSpacingConstraint = v48;
  }

  [(NSLayoutConstraint *)self->_topSpacingConstraint setActive:1];
  if (__sb__runningInSpringBoard())
  {
    BOOL v49 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    v50 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v51 = [v50 userInterfaceIdiom];

    BOOL v49 = v51 == 1;
  }
  v52 = (void *)MEMORY[0x1E4F28DC8];
  if (v49)
  {
    v53 = [(SBHAddWidgetButton *)self->_addButton widthAnchor];
    v54 = [v53 constraintEqualToConstant:460.0];
    v117[0] = v54;
    v55 = [(SBHAddWidgetButton *)self->_addButton centerXAnchor];
    v56 = [(UIView *)self->_containerView centerXAnchor];
    v57 = [v55 constraintEqualToAnchor:v56];
    v117[1] = v57;
    uint64_t v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:v117 count:2];
    [v52 activateConstraints:v58];
  }
  else
  {
    v53 = [(SBHAddWidgetButton *)self->_addButton leadingAnchor];
    v54 = [(UIView *)self->_containerView leadingAnchor];
    v55 = [v53 constraintEqualToAnchor:v54 constant:24.0];
    v116[0] = v55;
    v56 = [(SBHAddWidgetButton *)self->_addButton trailingAnchor];
    v57 = [(UIView *)self->_containerView trailingAnchor];
    uint64_t v58 = [v56 constraintEqualToAnchor:v57 constant:-24.0];
    v116[1] = v58;
    v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v116 count:2];
    [v52 activateConstraints:v59];
  }
  pageControl = self->_pageControl;
  if (pageControl)
  {
    v61 = (void *)MEMORY[0x1E4F28DC8];
    v62 = [(UIPageControl *)pageControl leadingAnchor];
    v63 = [(UIView *)self->_containerView leadingAnchor];
    v64 = [v62 constraintEqualToAnchor:v63 constant:24.0];
    v115[0] = v64;
    v65 = [(UIPageControl *)self->_pageControl trailingAnchor];
    v66 = [(UIView *)self->_containerView trailingAnchor];
    v67 = [v65 constraintEqualToAnchor:v66 constant:-24.0];
    v115[1] = v67;
    v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:v115 count:2];
    [v61 activateConstraints:v68];
  }
  v69 = [(SBHAddWidgetButton *)self->_addButton bottomAnchor];
  v70 = [(UIView *)self->_addButtonContainerView bottomAnchor];
  v71 = [v69 constraintEqualToAnchor:v70];
  addButtonBottomConstraint = self->_addButtonBottomConstraint;
  self->_addButtonBottomConstraint = v71;

  v73 = self->_pageControl;
  v74 = [(SBHAddWidgetButton *)self->_addButton topAnchor];
  if (v73)
  {
    v75 = [(UIPageControl *)self->_pageControl bottomAnchor];
    v76 = [v74 constraintEqualToAnchor:v75 constant:10.0];
    addButtonTopConstraint = self->_addButtonTopConstraint;
    self->_addButtonTopConstraint = v76;

    v78 = [(UIPageControl *)self->_pageControl topAnchor];
    v79 = [(UIView *)self->_addButtonContainerView topAnchor];
    v80 = [v78 constraintEqualToAnchor:v79 constant:10.0];
    pageControlTopConstraint = self->_pageControlTopConstraint;
    self->_pageControlTopConstraint = v80;

    [(NSLayoutConstraint *)self->_pageControlTopConstraint setActive:1];
  }
  else
  {
    int64_t v82 = [(UIView *)self->_addButtonContainerView topAnchor];
    uint64_t v83 = [v74 constraintEqualToAnchor:v82 constant:24.0];
    unint64_t v84 = self->_addButtonTopConstraint;
    self->_addButtonTopConstraint = v83;
  }
  uint64_t v85 = (void *)MEMORY[0x1E4F28DC8];
  char v86 = self->_addButtonBottomConstraint;
  v114[0] = self->_addButtonTopConstraint;
  v114[1] = v86;
  uint64_t v87 = [MEMORY[0x1E4F1C978] arrayWithObjects:v114 count:2];
  [v85 activateConstraints:v87];

  long long v100 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v111 = [(UIView *)self->_addButtonContainerView heightAnchor];
  long long v110 = [(UIView *)self->_addButtonStackSpacerView heightAnchor];
  long long v106 = [v111 constraintEqualToAnchor:v110];
  v113[0] = v106;
  uint64_t v103 = [(UIView *)self->_addButtonContainerView leadingAnchor];
  v88 = [(UIView *)self->_addButtonStackSpacerView leadingAnchor];
  v89 = [v103 constraintEqualToAnchor:v88];
  v113[1] = v89;
  v90 = [(UIView *)self->_addButtonContainerView trailingAnchor];
  v91 = [(UIView *)self->_addButtonStackSpacerView trailingAnchor];
  v92 = [v90 constraintEqualToAnchor:v91];
  v113[2] = v92;
  v93 = [(UIView *)self->_addButtonContainerView bottomAnchor];
  int64_t v94 = [(UIView *)self->_addButtonStackSpacerView bottomAnchor];
  unint64_t v95 = [v93 constraintEqualToAnchor:v94];
  v113[3] = v95;
  long long v96 = [MEMORY[0x1E4F1C978] arrayWithObjects:v113 count:4];
  [v100 activateConstraints:v96];

  [(SBHAddWidgetDetailSheetViewController *)self _contentSizeCategoryDidChange];
}

- (void)_updateConstraintConstants
{
  id v3 = [(SBHAddWidgetDetailSheetViewController *)self view];
  id v4 = [v3 window];

  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = self;
  }
  uint64_t v6 = [(SBHAddWidgetDetailSheetViewController *)v5 interfaceOrientation];
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
LABEL_6:
      double v7 = dbl_1D81E94C0[self->_titleView == 0];
      goto LABEL_14;
    }
  }
  else
  {
    objc_super v8 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v9 = [v8 userInterfaceIdiom];

    if (v9 != 1) {
      goto LABEL_6;
    }
  }
  unint64_t v10 = v6 - 3;
  externalSearchController = self->_externalSearchController;
  if (externalSearchController)
  {
    long long v12 = [(SBHWidgetSearchController *)externalSearchController searchBarBackgroundView];
    [v12 frame];
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
  }
  else
  {
    CGFloat v14 = *MEMORY[0x1E4F1DB28];
    CGFloat v16 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat v18 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat v20 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  v28.origin.x = v14;
  v28.origin.y = v16;
  v28.size.double width = v18;
  v28.size.double height = v20;
  double MaxY = CGRectGetMaxY(v28);
  double v22 = 40.0;
  if (v10 < 2) {
    double v22 = 46.0;
  }
  double v7 = v22 + MaxY;
LABEL_14:
  [(NSLayoutConstraint *)self->_topSpacingConstraint setConstant:v7];
  if ([(SBHAddWidgetSheetViewControllerBase *)self addWidgetSheetStyle] == 1)
  {
    [(SBHAddWidgetSheetViewControllerBase *)self addWidgetSheetMetrics];
    double v24 = 0.0;
    double v23 = 0.0;
    double v25 = 0.0;
  }
  else
  {
    double v24 = 24.0;
    double v23 = 6.0;
    double v25 = 5.0;
  }
  [(NSLayoutConstraint *)self->_pageControlTopConstraint setConstant:v23];
  [(NSLayoutConstraint *)self->_addButtonTopConstraint setConstant:v25];
  [(NSLayoutConstraint *)self->_addButtonBottomConstraint setConstant:-v24];
  if (_SBHTraitEnvironmentIsAccessibilityTextSize(self)) {
    double v26 = 1.0;
  }
  else {
    double v26 = 0.25;
  }
  [(SBHAddWidgetDetailSheetViewController *)self _minumumWidgetGalleryScrollViewHeight];
  [(NSLayoutConstraint *)self->_widgetGalleryHeightConstraint setConstant:v26 * v27];
}

- (void)_updateLayoutMargins
{
  [(BSUIScrollView *)self->_contentScrollView layoutMargins];
  double v5 = v4;
  double v7 = v6;
  externalSearchController = self->_externalSearchController;
  if (externalSearchController)
  {
    uint64_t v9 = [(SBHWidgetSearchController *)externalSearchController searchBar];
    [v9 frame];
    double Height = CGRectGetHeight(v16);
  }
  else
  {
    double Height = v3;
  }
  long long v11 = [(SBHAddWidgetDetailSheetViewController *)self view];
  [v11 bounds];
  double v12 = CGRectGetHeight(v17);
  [(UIView *)self->_addButtonContainerView frame];
  double v13 = v12 - CGRectGetMinY(v18);

  contentScrollView = self->_contentScrollView;
  -[BSUIScrollView setLayoutMargins:](contentScrollView, "setLayoutMargins:", Height, v5, v13, v7);
}

- (double)_minumumWidgetGalleryScrollViewHeight
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = self->_pages;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    double v6 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_super v8 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "widgetWrapperViewController", (void)v14);
        uint64_t v9 = [v8 wrapperView];
        unint64_t v10 = [v9 contentView];
        [v10 intrinsicContentSize];
        double v12 = v11;

        if (v6 < v12) {
          double v6 = v12;
        }
      }
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (void)setApplicationWidgetCollection:(id)a3
{
  uint64_t v4 = (SBHApplicationWidgetCollection *)a3;
  uint64_t v5 = [(SBHAddWidgetSheetViewControllerBase *)self allowedWidgets];
  uint64_t v7 = v6;
  objc_super v8 = [(SBHApplicationWidgetCollection *)v4 widgetDescriptors];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__SBHAddWidgetDetailSheetViewController_setApplicationWidgetCollection___block_invoke;
  v11[3] = &__block_descriptor_48_e40_B16__0___SBHAddWidgetSheetGalleryItem__8l;
  v11[4] = v5;
  v11[5] = v7;
  uint64_t v9 = objc_msgSend(v8, "bs_filter:", v11);

  [(SBHApplicationWidgetCollection *)v4 setWidgetDescriptors:v9];
  applicationWidgetCollection = self->_applicationWidgetCollection;
  self->_applicationWidgetCollection = v4;
}

uint64_t __72__SBHAddWidgetDetailSheetViewController_setApplicationWidgetCollection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if ((objc_msgSend(v3, "sbh_supportedSizeClasses") & v4) != 0
    && (*(unsigned char *)(a1 + 40) || objc_msgSend(v3, "sbh_canBeAddedToStack")))
  {
    if (*(unsigned char *)(a1 + 41)) {
      uint64_t v5 = objc_msgSend(v3, "sbh_supportsRemovableBackgroundOrAccessoryFamilies");
    }
    else {
      uint64_t v5 = 1;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)configureForGalleryItem:(id)a3 selectedSizeClass:(int64_t)a4
{
  id v6 = a3;
  [(SBHAddWidgetDetailSheetViewController *)self loadViewIfNeeded];
  pages = self->_pages;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  long long v14 = __83__SBHAddWidgetDetailSheetViewController_configureForGalleryItem_selectedSizeClass___block_invoke;
  long long v15 = &unk_1E6AB5128;
  id v8 = v6;
  id v16 = v8;
  int64_t v17 = a4;
  uint64_t v9 = [(NSMutableArray *)pages indexOfObjectPassingTest:&v12];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v10 = SBLogWidgets();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SBHAddWidgetDetailSheetViewController configureForGalleryItem:selectedSizeClass:]((uint64_t)v8, v10);
    }
  }
  else
  {
    unint64_t v11 = v9;
    if ([(SBHAddWidgetDetailSheetViewController *)self bs_isAppearingOrAppeared])[(SBHAddWidgetDetailSheetViewController *)self _scrollToPageIndex:v11 animated:0]; {
    else
    }
      self->_initialSelectionIndex = v11;
  }
}

BOOL __83__SBHAddWidgetDetailSheetViewController_configureForGalleryItem_selectedSizeClass___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 widgetWrapperViewController];
  uint64_t v5 = [v4 galleryItem];
  id v6 = objc_msgSend(v5, "sbh_galleryItemIdentifier");
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "sbh_galleryItemIdentifier");
  if ([v6 isEqual:v7])
  {
    id v8 = [v3 widgetWrapperViewController];
    BOOL v9 = [v8 selectedSizeClass] == *(void *)(a1 + 40);
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)closeButtonTapped:(id)a3
{
  id v4 = [(SBHAddWidgetSheetViewControllerBase *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 addWidgetSheetViewControllerDidCancel:self];
  }
}

- (void)addButtonTapped:(id)a3
{
  unint64_t v10 = [(SBHAddWidgetSheetViewControllerBase *)self delegate];
  char v4 = objc_opt_respondsToSelector();
  uint64_t v5 = v10;
  if (v4)
  {
    id v6 = [(SBHAddWidgetDetailSheetViewController *)self currentPage];
    uint64_t v7 = [v6 widgetWrapperViewController];

    id v8 = [v7 wrapperView];
    BOOL v9 = [v8 contentView];

    if (v9) {
      [v10 addWidgetSheetViewController:self didSelectWidgetIconView:v9];
    }

    uint64_t v5 = v10;
  }
}

- (void)pageControlChanged:(id)a3
{
  uint64_t v4 = [a3 currentPage];
  [(SBHAddWidgetDetailSheetViewController *)self _scrollToPageIndex:v4 animated:1];
}

- (void)_scrollToPageIndex:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [(UIStackView *)self->_widgetGalleryStackView arrangedSubviews];
  unint64_t v8 = [v7 count];

  if (v8 <= a3)
  {
    uint64_t v12 = SBLogWidgets();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SBHAddWidgetDetailSheetViewController _scrollToPageIndex:animated:](v8, a3, v12);
    }
  }
  else
  {
    BOOL v9 = [(SBHAddWidgetDetailSheetViewController *)self view];
    [v9 layoutIfNeeded];

    if ([(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] == 1) {
      a3 = [(NSMutableArray *)self->_pages count] + ~a3;
    }
    [(BSUIScrollView *)self->_widgetGalleryScrollView bounds];
    double v11 = v10 * (double)a3;
    -[BSUIScrollView setContentOffset:animated:](self->_widgetGalleryScrollView, "setContentOffset:animated:", v4, v11, 0.0);
    -[SBHAddWidgetDetailSheetViewController _updateControlsForContentOffset:animated:](self, "_updateControlsForContentOffset:animated:", v4, v11, 0.0);
  }
}

- (id)widgetInfoViews
{
  return [(UIStackView *)self->_widgetInfoStackView arrangedSubviews];
}

- (void)scrollViewDidScroll:(id)a3
{
  BOOL v4 = (BSUIScrollView *)a3;
  widgetGalleryScrollView = self->_widgetGalleryScrollView;
  BOOL v9 = v4;
  if (widgetGalleryScrollView == v4)
  {
    [(SBHAddWidgetDetailSheetViewController *)self _updateParallaxEffect];
    if (!self->_scrollingInitiatedByInfoScrollView) {
      [(SBHAddWidgetDetailSheetViewController *)self _updatePageViewControllerAppearanceForNormalScroll];
    }
  }
  else if (self->_widgetInfoScrollView == v4 && ![(BSUIScrollView *)widgetGalleryScrollView isScrolling])
  {
    [(SBHAddWidgetDetailSheetViewController *)self _scrollMainScrollViewToMatchInfoScrollViewIfNeeded];
  }
  if (([MEMORY[0x1E4FB1EB0] _isInAnimationBlock] & 1) == 0)
  {
    [(BSUIScrollView *)v9 adjustedContentInset];
    double v7 = v6;
    [(BSUIScrollView *)v9 contentOffset];
    [(SBHWidgetSearchController *)self->_externalSearchController updateSearchBarBackgroundForScrollDistance:self forClient:v7 + v8];
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  if (self->_widgetGalleryScrollView == a3)
  {
    double x = a4.x;
    objc_msgSend(a3, "bounds", a4.x, a4.y);
    double v9 = a5->x / v8;
    double v10 = floor(v9);
    double v11 = ceil(v9);
    if (x <= 0.0) {
      double v11 = v10;
    }
    a5->double x = v8 * v11;
    -[SBHAddWidgetDetailSheetViewController _updateControlsForContentOffset:animated:](self, "_updateControlsForContentOffset:animated:", 1);
  }
}

- (id)_newBackgroundView
{
  v2 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:54];
  [v2 setGroupNameBase:@"Add-Sheet"];
  return v2;
}

- (void)_updateBackgroundRecipe
{
  [(SBHAddWidgetDetailSheetViewController *)self _updateMaterialRecipeForBackgroundView:self->_backgroundView];
  magicPocketBackgroundView = self->_magicPocketBackgroundView;
  [(SBHAddWidgetDetailSheetViewController *)self _updateMaterialRecipeForBackgroundView:magicPocketBackgroundView];
}

- (void)_updateMaterialRecipeForBackgroundView:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(SBHAddWidgetDetailSheetViewController *)self traitCollection];
  uint64_t v5 = [v4 userInterfaceStyle];

  if (v5 == 2) {
    uint64_t v6 = 53;
  }
  else {
    uint64_t v6 = 54;
  }
  [v7 setRecipe:v6];
}

- (void)_addPage:(id)a3
{
  id v4 = a3;
  [(SBHAddWidgetDetailSheetViewController *)self addChildViewController:v4];
  uint64_t v5 = [(NSMutableArray *)self->_pages indexOfObject:v4];
  id v10 = [v4 view];
  [(UIStackView *)self->_widgetGalleryStackView insertArrangedSubview:v10 atIndex:v5];
  uint64_t v6 = [v10 widthAnchor];
  id v7 = [(SBHAddWidgetDetailSheetViewController *)self view];
  double v8 = [v7 widthAnchor];
  double v9 = [v6 constraintEqualToAnchor:v8];
  [v9 setActive:1];

  [v4 didMoveToParentViewController:self];
}

- (void)_updatePageViewControllerAppearanceForNormalScroll
{
  [(BSUIScrollView *)self->_widgetGalleryScrollView contentOffset];
  double v4 = v3;
  double v6 = v5;
  [(BSUIScrollView *)self->_widgetGalleryScrollView bounds];
  unint64_t v8 = -[SBHAddWidgetDetailSheetViewController _pageIndexAtContentOffset:](self, "_pageIndexAtContentOffset:", v4 + v7 * 0.5, v6);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __91__SBHAddWidgetDetailSheetViewController__updatePageViewControllerAppearanceForNormalScroll__block_invoke;
  v9[3] = &__block_descriptor_40_e8_B16__0Q8l;
  v9[4] = v8;
  [(SBHAddWidgetDetailSheetViewController *)self _updatePageViewControllerAppearanceWithAppearedBlock:v9];
}

BOOL __91__SBHAddWidgetDetailSheetViewController__updatePageViewControllerAppearanceForNormalScroll__block_invoke(uint64_t a1, int a2)
{
  int v2 = a2 - *(_DWORD *)(a1 + 32);
  if (v2 < 0) {
    int v2 = *(_DWORD *)(a1 + 32) - a2;
  }
  return v2 < 3;
}

- (void)_updatePageViewControllerAppearanceWithAppearedBlock:(id)a3
{
  id v4 = a3;
  pages = self->_pages;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __94__SBHAddWidgetDetailSheetViewController__updatePageViewControllerAppearanceWithAppearedBlock___block_invoke;
  v7[3] = &unk_1E6AB5170;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)pages enumerateObjectsWithOptions:0 usingBlock:v7];
}

void __94__SBHAddWidgetDetailSheetViewController__updatePageViewControllerAppearanceWithAppearedBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  BOOL v6 = v5 && ((*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v5, a3) & 1) != 0;
  objc_msgSend(v7, "bs_endAppearanceTransition:", v6);
}

- (void)_updatePageViewControllerAppearanceForFastScrollToTargetIndex:(unint64_t)a3
{
  unint64_t v5 = [(UIPageControl *)self->_pageControl currentPage];
  if (v5 >= a3) {
    int64_t v6 = a3;
  }
  else {
    int64_t v6 = v5;
  }
  if (v5 > a3) {
    a3 = v5;
  }
  if (v6 <= 1) {
    int64_t v6 = 1;
  }
  int64_t v7 = v6 - 1;
  unint64_t v8 = [(NSMutableArray *)self->_pages count] - 1;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __103__SBHAddWidgetDetailSheetViewController__updatePageViewControllerAppearanceForFastScrollToTargetIndex___block_invoke;
  v9[3] = &__block_descriptor_48_e8_B16__0Q8l;
  if (a3 + 1 < v8) {
    unint64_t v8 = a3 + 1;
  }
  v9[4] = v7;
  void v9[5] = v8;
  [(SBHAddWidgetDetailSheetViewController *)self _updatePageViewControllerAppearanceWithAppearedBlock:v9];
}

BOOL __103__SBHAddWidgetDetailSheetViewController__updatePageViewControllerAppearanceForFastScrollToTargetIndex___block_invoke(uint64_t a1, unint64_t a2)
{
  return *(void *)(a1 + 32) <= a2 && *(void *)(a1 + 40) >= a2;
}

- (SBHAddWidgetDetailsSheetPageViewController)currentPage
{
  unint64_t v3 = [(UIPageControl *)self->_pageControl currentPage];
  p_pages = &self->_pages;
  if (v3 >= [(NSMutableArray *)*p_pages count])
  {
    int64_t v6 = SBLogWidgets();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(SBHAddWidgetDetailSheetViewController *)(id *)p_pages currentPage];
    }

    unint64_t v5 = 0;
  }
  else
  {
    unint64_t v5 = [(NSMutableArray *)*p_pages objectAtIndex:v3];
  }
  return (SBHAddWidgetDetailsSheetPageViewController *)v5;
}

- (SBFFluidBehaviorSettings)widgetInfoScrollViewAnimationSettings
{
  widgetInfoScrollViewAnimationSettings = self->_widgetInfoScrollViewAnimationSettings;
  if (!widgetInfoScrollViewAnimationSettings)
  {
    id v4 = (SBFFluidBehaviorSettings *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
    unint64_t v5 = self->_widgetInfoScrollViewAnimationSettings;
    self->_widgetInfoScrollViewAnimationSettings = v4;

    [(SBFFluidBehaviorSettings *)self->_widgetInfoScrollViewAnimationSettings setDampingRatio:1.0];
    [(SBFFluidBehaviorSettings *)self->_widgetInfoScrollViewAnimationSettings setResponse:0.456999987];
    widgetInfoScrollViewAnimationSettings = self->_widgetInfoScrollViewAnimationSettings;
  }
  return widgetInfoScrollViewAnimationSettings;
}

- (unint64_t)_pageIndexAtContentOffset:(CGPoint)a3
{
  id v4 = -[UIStackView hitTest:withEvent:](self->_widgetGalleryStackView, "hitTest:withEvent:", 0, a3.x, a3.y);
  unint64_t v5 = [(UIStackView *)self->_widgetGalleryStackView arrangedSubviews];
  unint64_t v6 = [v5 indexOfObject:v4];

  return v6;
}

- (void)_updateControlsForContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  unint64_t v8 = [(SBHAddWidgetDetailSheetViewController *)self view];
  [v8 layoutIfNeeded];

  unint64_t v9 = -[SBHAddWidgetDetailSheetViewController _pageIndexAtContentOffset:](self, "_pageIndexAtContentOffset:", x, y);
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v10 = v9;
    [(UIPageControl *)self->_pageControl setCurrentPage:v9];
    if (![(BSUIScrollView *)self->_widgetInfoScrollView isScrolling])
    {
      double v11 = [(NSMutableArray *)self->_pages objectAtIndex:v10];
      uint64_t v12 = [v11 widgetWrapperViewController];
      uint64_t v13 = [v12 galleryItem];

      unint64_t v14 = [(SBHApplicationWidgetCollection *)self->_applicationWidgetCollection indexOfWidgetDescriptorMatchingDescriptor:v13];
      if (v14 != 0x7FFFFFFFFFFFFFFFLL)
      {
        unint64_t v15 = v14;
        id v16 = [(UIStackView *)self->_widgetInfoStackView arrangedSubviews];
        unint64_t v17 = [v16 count];

        if (v15 < v17)
        {
          CGRect v18 = [(UIStackView *)self->_widgetInfoStackView arrangedSubviews];
          uint64_t v19 = [v18 objectAtIndex:v15];

          uint64_t v28 = MEMORY[0x1E4F143A8];
          uint64_t v29 = 3221225472;
          v30 = __82__SBHAddWidgetDetailSheetViewController__updateControlsForContentOffset_animated___block_invoke;
          v31 = &unk_1E6AACA90;
          v32 = self;
          id v20 = v19;
          id v33 = v20;
          v21 = _Block_copy(&v28);
          double v22 = v21;
          if (v4)
          {
            double v23 = [(SBHAddWidgetDetailSheetViewController *)self widgetInfoScrollViewAnimationSettings];
            double v24 = (void *)MEMORY[0x1E4FB1EB0];
            [v23 settlingDuration];
            double v26 = v25;
            [v23 dampingRatio];
            [v24 animateWithDuration:4 delay:v22 usingSpringWithDamping:0 initialSpringVelocity:v26 options:0.0 animations:v27 completion:0.0];
          }
          else
          {
            (*((void (**)(void *))v21 + 2))(v21);
          }
        }
      }
    }
  }
}

uint64_t __82__SBHAddWidgetDetailSheetViewController__updateControlsForContentOffset_animated___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 1272);
  [*(id *)(a1 + 40) frame];
  return objc_msgSend(v1, "setContentOffset:");
}

- (void)_updateParallaxEffect
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v3 = self->_pages;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        unint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        unint64_t v9 = [(SBHAddWidgetDetailSheetViewController *)self view];
        [v8 updateParallaxEffectInReferenceView:v9];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)_scrollMainScrollViewToMatchInfoScrollViewIfNeeded
{
  [(BSUIScrollView *)self->_widgetInfoScrollView contentOffset];
  double v4 = v3;
  [(BSUIScrollView *)self->_widgetInfoScrollView bounds];
  uint64_t v6 = -[UIStackView hitTest:withEvent:](self->_widgetInfoStackView, "hitTest:withEvent:", 0, v4 + v5 * 0.5, 0.0);
  uint64_t v7 = [(SBHAddWidgetDetailSheetViewController *)self widgetInfoViews];
  unint64_t v8 = [v7 indexOfObject:v6];

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v9 = [(SBHApplicationWidgetCollection *)self->_applicationWidgetCollection widgetDescriptors];
    unint64_t v10 = [v9 count];

    if (v8 < v10)
    {
      long long v11 = [(SBHApplicationWidgetCollection *)self->_applicationWidgetCollection widgetDescriptors];
      long long v12 = [v11 objectAtIndex:v8];

      long long v13 = [(SBHAddWidgetDetailSheetViewController *)self _currentGalleryItem];

      if (v12 != v13)
      {
        unint64_t v14 = [(SBHAddWidgetDetailSheetViewController *)self _closestPageWithGalleryItem:v12];
        uint64_t v15 = [(SBHAddWidgetDetailSheetViewController *)self widgetInfoScrollViewAnimationSettings];
        self->_scrollingInitiatedByInfoScrollView = 1;
        [(SBHAddWidgetDetailSheetViewController *)self _updatePageViewControllerAppearanceForFastScrollToTargetIndex:v14];
        id v16 = (void *)MEMORY[0x1E4FB1EB0];
        [v15 settlingDuration];
        double v18 = v17;
        [v15 dampingRatio];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __91__SBHAddWidgetDetailSheetViewController__scrollMainScrollViewToMatchInfoScrollViewIfNeeded__block_invoke;
        v21[3] = &unk_1E6AAC838;
        v21[4] = self;
        v21[5] = v14;
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __91__SBHAddWidgetDetailSheetViewController__scrollMainScrollViewToMatchInfoScrollViewIfNeeded__block_invoke_2;
        v20[3] = &unk_1E6AACAB8;
        v20[4] = self;
        [v16 animateWithDuration:4 delay:v21 usingSpringWithDamping:v20 initialSpringVelocity:v18 options:0.0 animations:v19 completion:0.0];
      }
    }
  }
}

uint64_t __91__SBHAddWidgetDetailSheetViewController__scrollMainScrollViewToMatchInfoScrollViewIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scrollToPageIndex:*(void *)(a1 + 40) animated:0];
}

uint64_t __91__SBHAddWidgetDetailSheetViewController__scrollMainScrollViewToMatchInfoScrollViewIfNeeded__block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1201) = 0;
  return result;
}

- (unint64_t)_closestPageWithGalleryItem:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  applicationWidgetCollection = self->_applicationWidgetCollection;
  uint64_t v6 = [(SBHAddWidgetDetailSheetViewController *)self _currentGalleryItem];
  unint64_t v7 = [(SBHApplicationWidgetCollection *)applicationWidgetCollection indexOfWidgetDescriptorMatchingDescriptor:v6];

  unint64_t v8 = [(SBHApplicationWidgetCollection *)self->_applicationWidgetCollection indexOfWidgetDescriptorMatchingDescriptor:v4];
  unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL && v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v11 = v8;
    p_pages = (id *)&self->_pages;
    unint64_t v13 = [(NSMutableArray *)self->_pages count];
    int64_t v14 = [(UIPageControl *)self->_pageControl currentPage];
    if (v11 >= v13)
    {
      id v16 = SBLogWidgets();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v24 = *p_pages;
        int v25 = 134218498;
        unint64_t v26 = v11;
        __int16 v27 = 2112;
        id v28 = v4;
        __int16 v29 = 2112;
        id v30 = v24;
        _os_log_error_impl(&dword_1D7F0A000, v16, OS_LOG_TYPE_ERROR, "Invalid targetGalleryItemIndex:%lu for galleryItem:%@ in pages:%@", (uint8_t *)&v25, 0x20u);
      }

      unint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      unint64_t v15 = v14;
    }
    if (v7 < v11) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = -1;
    }
    if (v15 >= v13 || (v15 & 0x8000000000000000) != 0) {
      goto LABEL_21;
    }
    char v18 = 0;
    unint64_t v9 = v15;
    do
    {
      double v19 = [*p_pages objectAtIndex:v15];
      id v20 = [v19 widgetWrapperViewController];
      id v21 = [v20 galleryItem];

      if (v21 == v4) {
        unint64_t v9 = v15;
      }
      v18 |= v21 == v4;
      v15 += v17;
    }
    while (v15 < v13 && (v15 & 0x8000000000000000) == 0);
    if ((v18 & 1) == 0)
    {
LABEL_21:
      double v22 = SBLogWidgets();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        [(SBHAddWidgetDetailSheetViewController *)(uint64_t)v4 _closestPageWithGalleryItem:v22];
      }

      unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  return v9;
}

- (id)_currentGalleryItem
{
  int v2 = [(SBHAddWidgetDetailSheetViewController *)self currentPage];
  double v3 = [v2 widgetWrapperViewController];
  id v4 = [v3 galleryItem];

  return v4;
}

- (id)_materialViewForVisualStyling
{
  backgroundView = [(SBHAddWidgetSheetViewControllerBase *)self externalBackgroundView];
  id v4 = backgroundView;
  if (!backgroundView) {
    backgroundView = self->_backgroundView;
  }
  id v5 = backgroundView;

  return v5;
}

- (void)_contentSizeCategoryDidChange
{
  [(SBHAddWidgetDetailSheetViewController *)self _updateStackViewForSizeCategory];
  [(SBHAddWidgetDetailSheetViewController *)self _updateConstraintConstants];
  magicPocketBackgroundView = self->_magicPocketBackgroundView;
  BOOL v4 = !_SBHTraitEnvironmentIsAccessibilityTextSize(self);
  [(MTMaterialView *)magicPocketBackgroundView setHidden:v4];
}

- (void)_updateStackViewForSizeCategory
{
  if (_SBHTraitEnvironmentIsAccessibilityTextSize(self)
    && ([MEMORY[0x1E4FB16C8] currentDevice],
        double v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v3 userInterfaceIdiom],
        v3,
        (v4 & 0xFFFFFFFFFFFFFFFBLL) != 1))
  {
    id v5 = &OBJC_IVAR___SBHAddWidgetDetailSheetViewController__widgetGalleryScrollView;
  }
  else
  {
    id v5 = &OBJC_IVAR___SBHAddWidgetDetailSheetViewController__widgetInfoScrollView;
  }
  uint64_t v6 = *(uint64_t *)((char *)&self->super.super.super.super.isa + *v5);
  BOOL v7 = self->_headerView != 0;
  contentStackView = self->_contentStackView;
  [(UIStackView *)contentStackView insertArrangedSubview:v6 atIndex:v7];
}

- (SBHWidgetDragHandling)widgetDragHandler
{
  int v2 = [(SBHAddWidgetSheetViewControllerBase *)self delegate];
  double v3 = [v2 widgetDragHandler];

  return (SBHWidgetDragHandling *)v3;
}

- (id)backgroundViewMatchingMaterialBeneathPageViewController:(id)a3
{
  if ([(SBHAddWidgetSheetViewControllerBase *)self addWidgetSheetStyle] == 1)
  {
    uint64_t v4 = [(SBHAddWidgetSheetViewControllerBase *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      id v5 = [v4 backgroundViewMatchingMaterialBeneathAddWidgetSheetViewController:self];
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = [(SBHAddWidgetDetailSheetViewController *)self _newBackgroundView];
  }
  return v5;
}

- (void)configureBackgroundView:(id)a3 matchingMaterialBeneathPageViewController:(id)a4
{
  id v9 = a3;
  if ([(SBHAddWidgetSheetViewControllerBase *)self addWidgetSheetStyle] == 1)
  {
    id v5 = [(SBHAddWidgetSheetViewControllerBase *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v5 configureBackgroundView:v9 matchingMaterialBeneathAddWidgetSheetViewController:self];
    }
  }
  else
  {
    uint64_t v6 = objc_opt_class();
    id v7 = v9;
    if (v6)
    {
      if (objc_opt_isKindOfClass()) {
        unint64_t v8 = v7;
      }
      else {
        unint64_t v8 = 0;
      }
    }
    else
    {
      unint64_t v8 = 0;
    }
    id v5 = v8;

    if (v5) {
      [(SBHAddWidgetDetailSheetViewController *)self _updateMaterialRecipeForBackgroundView:v5];
    }
  }
}

- (NSMutableDictionary)userInfo
{
  userInfo = self->_userInfo;
  if (!userInfo)
  {
    uint64_t v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v5 = self->_userInfo;
    self->_userInfo = v4;

    userInfo = self->_userInfo;
  }
  return userInfo;
}

- (SBHWidgetSheetViewControllerPresenter)presenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  return (SBHWidgetSheetViewControllerPresenter *)WeakRetained;
}

- (void)setPresenter:(id)a3
{
}

- (SBHApplicationWidgetCollection)applicationWidgetCollection
{
  return self->_applicationWidgetCollection;
}

- (SBHWidgetSearchController)externalSearchController
{
  return self->_externalSearchController;
}

- (void)setExternalSearchController:(id)a3
{
}

- (MTMaterialView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (MTMaterialView)magicPocketBackgroundView
{
  return self->_magicPocketBackgroundView;
}

- (void)setMagicPocketBackgroundView:(id)a3
{
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
}

- (SBHAddWidgetDetailSheetTitleView)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
}

- (UIStackView)widgetInfoStackView
{
  return self->_widgetInfoStackView;
}

- (void)setWidgetInfoStackView:(id)a3
{
}

- (BSUIScrollView)widgetInfoScrollView
{
  return self->_widgetInfoScrollView;
}

- (void)setWidgetInfoScrollView:(id)a3
{
}

- (BSUIScrollView)widgetGalleryScrollView
{
  return self->_widgetGalleryScrollView;
}

- (void)setWidgetGalleryScrollView:(id)a3
{
}

- (UIStackView)widgetGalleryStackView
{
  return self->_widgetGalleryStackView;
}

- (void)setWidgetGalleryStackView:(id)a3
{
}

- (SBHAddWidgetButton)addButton
{
  return self->_addButton;
}

- (void)setAddButton:(id)a3
{
}

- (UIPageControl)pageControl
{
  return self->_pageControl;
}

- (void)setPageControl:(id)a3
{
}

- (void)setWidgetInfoScrollViewAnimationSettings:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (BSUIScrollView)contentScrollView
{
  return self->_contentScrollView;
}

- (void)setContentScrollView:(id)a3
{
}

- (UIStackView)contentStackView
{
  return self->_contentStackView;
}

- (void)setContentStackView:(id)a3
{
}

- (UIView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
}

- (UIView)addButtonContainerView
{
  return self->_addButtonContainerView;
}

- (void)setAddButtonContainerView:(id)a3
{
}

- (UIView)addButtonStackSpacerView
{
  return self->_addButtonStackSpacerView;
}

- (void)setAddButtonStackSpacerView:(id)a3
{
}

- (NSLayoutConstraint)topSpacingConstraint
{
  return self->_topSpacingConstraint;
}

- (void)setTopSpacingConstraint:(id)a3
{
}

- (NSLayoutConstraint)pageControlTopConstraint
{
  return self->_pageControlTopConstraint;
}

- (void)setPageControlTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)addButtonTopConstraint
{
  return self->_addButtonTopConstraint;
}

- (void)setAddButtonTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)addButtonBottomConstraint
{
  return self->_addButtonBottomConstraint;
}

- (void)setAddButtonBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)widgetGalleryHeightConstraint
{
  return self->_widgetGalleryHeightConstraint;
}

- (void)setWidgetGalleryHeightConstraint:(id)a3
{
}

- (NSMutableArray)pages
{
  return self->_pages;
}

- (void)setPages:(id)a3
{
}

- (BOOL)scrollingInitiatedByInfoScrollView
{
  return self->_scrollingInitiatedByInfoScrollView;
}

- (void)setScrollingInitiatedByInfoScrollView:(BOOL)a3
{
  self->_scrollingInitiatedByInfoScrollView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pages, 0);
  objc_storeStrong((id *)&self->_widgetGalleryHeightConstraint, 0);
  objc_storeStrong((id *)&self->_addButtonBottomConstraint, 0);
  objc_storeStrong((id *)&self->_addButtonTopConstraint, 0);
  objc_storeStrong((id *)&self->_pageControlTopConstraint, 0);
  objc_storeStrong((id *)&self->_topSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_addButtonStackSpacerView, 0);
  objc_storeStrong((id *)&self->_addButtonContainerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
  objc_storeStrong((id *)&self->_contentScrollView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_widgetInfoScrollViewAnimationSettings, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_addButton, 0);
  objc_storeStrong((id *)&self->_widgetGalleryStackView, 0);
  objc_storeStrong((id *)&self->_widgetGalleryScrollView, 0);
  objc_storeStrong((id *)&self->_widgetInfoScrollView, 0);
  objc_storeStrong((id *)&self->_widgetInfoStackView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_magicPocketBackgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_externalSearchController, 0);
  objc_storeStrong((id *)&self->_applicationWidgetCollection, 0);
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_userInfo, 0);
}

- (void)configureForGalleryItem:(uint64_t)a1 selectedSizeClass:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D7F0A000, a2, OS_LOG_TYPE_ERROR, "Trying to configure SBHAddWidgetDetailSheetViewController with unknown galleryItem %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_scrollToPageIndex:(NSObject *)a3 animated:.cold.1(__int16 a1, uint64_t a2, NSObject *a3)
{
  LODWORD(v3) = 134218240;
  *(void *)((char *)&v3 + 4) = a2;
  WORD6(v3) = 2048;
  HIWORD(v3) = a1 - 1;
  OUTLINED_FUNCTION_0_0(&dword_1D7F0A000, a2, a3, "Trying to scroll to a page index (%lu) outside the bounds [0 - %lu]", (void)v3, *((void *)&v3 + 1));
}

- (void)currentPage
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*a1 count];
  int v6 = 134218240;
  uint64_t v7 = a2;
  __int16 v8 = 2048;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_1D7F0A000, a3, OS_LOG_TYPE_ERROR, "currentPageIndex %lu >= count %lu", (uint8_t *)&v6, 0x16u);
}

- (void)_closestPageWithGalleryItem:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  *(_DWORD *)long long v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *a2;
  OUTLINED_FUNCTION_0_0(&dword_1D7F0A000, (uint64_t)a2, a3, "Could not find page for gallery item:%@ in pages:%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

@end