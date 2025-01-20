@interface PRComplicationGalleryDetailView
- (BOOL)performedInitialSelection;
- (BOOL)showsBackgroundView;
- (BOOL)showsCloseButton;
- (BSUIScrollView)complicationGalleryScrollView;
- (BSUIScrollView)contentScrollView;
- (MTMaterialView)magicPocketBackgroundView;
- (NSArray)pages;
- (NSLayoutConstraint)widgetGalleryHeightConstraint;
- (NSString)title;
- (PRComplicationGalleryApplicationTitleView)titleView;
- (PRComplicationGalleryDetailView)initWithFrame:(CGRect)a3;
- (PRComplicationGalleryDetailViewDelegate)delegate;
- (UIButton)closeButton;
- (UIImage)iconImage;
- (UILabel)instructionsLabel;
- (UIPageControl)pageControl;
- (UIStackView)complicationGalleryStackView;
- (UIStackView)contentStackView;
- (UIView)backgroundView;
- (UIView)containerView;
- (UIView)footerContainerView;
- (UIView)footerStackSpacerView;
- (UIView)headerView;
- (id)_instructionsLabelFont;
- (unint64_t)_pageIndexAtContentOffset:(CGPoint)a3;
- (void)_addFooterConstraints;
- (void)_contentSizeCategoryDidChange:(id)a3;
- (void)_createConstraints;
- (void)_createPageControlIfNecessary;
- (void)_createViews;
- (void)_scrollToPageIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)_updateContent;
- (void)_updatePageControlForContentOffset:(CGPoint)a3 animated:(BOOL)a4;
- (void)_updatePageViewControllerAppearanceForNormalScroll;
- (void)_updatePageViewControllerAppearanceWithAppearedBlock:(id)a3;
- (void)closeButtonTapped:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)pageControlChanged:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setBackgroundView:(id)a3;
- (void)setCloseButton:(id)a3;
- (void)setComplicationGalleryScrollView:(id)a3;
- (void)setComplicationGalleryStackView:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setContentScrollView:(id)a3;
- (void)setContentStackView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFooterContainerView:(id)a3;
- (void)setFooterStackSpacerView:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setIconImage:(id)a3;
- (void)setInstructionsLabel:(id)a3;
- (void)setMagicPocketBackgroundView:(id)a3;
- (void)setPageControl:(id)a3;
- (void)setPages:(id)a3;
- (void)setPerformedInitialSelection:(BOOL)a3;
- (void)setShowsBackgroundView:(BOOL)a3;
- (void)setShowsCloseButton:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setTitleView:(id)a3;
- (void)setWidgetGalleryHeightConstraint:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PRComplicationGalleryDetailView

- (PRComplicationGalleryDetailView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PRComplicationGalleryDetailView;
  v3 = -[PRComplicationGalleryDetailView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(PRComplicationGalleryDetailView *)v3 _createViews];
    [(PRComplicationGalleryDetailView *)v4 _createConstraints];
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v4 selector:sel__contentSizeCategoryDidChange_ name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB27A8] object:0];

  v4.receiver = self;
  v4.super_class = (Class)PRComplicationGalleryDetailView;
  [(PRComplicationGalleryDetailView *)&v4 dealloc];
}

- (void)_createViews
{
  v2 = (objc_class *)MEMORY[0x1E4FB1EB0];
  v3 = self;
  objc_super v4 = (UIView *)objc_alloc_init(v2);
  containerView = v3->_containerView;
  v3->_containerView = v4;

  [(UIView *)v3->_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
  v3->_showsBackgroundView = 1;
  id v6 = objc_alloc(MEMORY[0x1E4FB1F00]);
  objc_super v7 = [MEMORY[0x1E4FB14C8] effectWithStyle:8];
  uint64_t v8 = [v6 initWithEffect:v7];
  backgroundView = v3->_backgroundView;
  v3->_backgroundView = (UIView *)v8;

  v10 = v3->_backgroundView;
  [(PRComplicationGalleryDetailView *)v3 bounds];
  -[UIView setFrame:](v10, "setFrame:");
  [(UIView *)v3->_backgroundView setAutoresizingMask:18];
  [(PRComplicationGalleryDetailView *)v3 addSubview:v3->_backgroundView];
  v11 = (BSUIScrollView *)objc_alloc_init(MEMORY[0x1E4F4F8E0]);
  contentScrollView = v3->_contentScrollView;
  v3->_contentScrollView = v11;

  [(BSUIScrollView *)v3->_contentScrollView setDelegate:v3];
  [(BSUIScrollView *)v3->_contentScrollView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(BSUIScrollView *)v3->_contentScrollView setShowsVerticalScrollIndicator:0];
  [(BSUIScrollView *)v3->_contentScrollView setShowsHorizontalScrollIndicator:0];
  [(BSUIScrollView *)v3->_contentScrollView setContentInsetAdjustmentBehavior:2];
  [(BSUIScrollView *)v3->_contentScrollView addSubview:v3->_containerView];
  [(PRComplicationGalleryDetailView *)v3 addSubview:v3->_contentScrollView];
  v13 = (UIStackView *)objc_alloc_init(MEMORY[0x1E4FB1C60]);
  contentStackView = v3->_contentStackView;
  v3->_contentStackView = v13;

  [(UIStackView *)v3->_contentStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)v3->_contentStackView setAxis:1];
  [(UIStackView *)v3->_contentStackView setAlignment:0];
  [(UIView *)v3->_containerView addSubview:v3->_contentStackView];
  v15 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  headerView = v3->_headerView;
  v3->_headerView = v15;

  [(UIView *)v3->_headerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)v3->_contentStackView addArrangedSubview:v3->_headerView];
  v17 = objc_alloc_init(PRComplicationGalleryApplicationTitleView);
  titleView = v3->_titleView;
  v3->_titleView = v17;

  [(PRComplicationGalleryApplicationTitleView *)v3->_titleView setTranslatesAutoresizingMaskIntoConstraints:0];
  -[PRComplicationGalleryApplicationTitleView setImageSize:](v3->_titleView, "setImageSize:", 32.0, 32.0);
  -[PRComplicationGalleryApplicationTitleView setContentInsets:](v3->_titleView, "setContentInsets:", 25.0, 25.0, 25.0, 25.0);
  [(UIView *)v3->_headerView addSubview:v3->_titleView];
  v3->_showsCloseButton = 1;
  uint64_t v19 = [MEMORY[0x1E4FB14D0] buttonWithType:7];
  closeButton = v3->_closeButton;
  v3->_closeButton = (UIButton *)v19;

  [(UIButton *)v3->_closeButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)v3->_closeButton addTarget:v3 action:sel_closeButtonTapped_ forControlEvents:64];
  [(PRComplicationGalleryDetailView *)v3 addSubview:v3->_closeButton];
  v21 = (UIStackView *)objc_alloc_init(MEMORY[0x1E4FB1C60]);
  complicationGalleryStackView = v3->_complicationGalleryStackView;
  v3->_complicationGalleryStackView = v21;

  [(UIStackView *)v3->_complicationGalleryStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)v3->_complicationGalleryStackView setAxis:0];
  v23 = (BSUIScrollView *)objc_alloc_init(MEMORY[0x1E4F4F8E0]);
  complicationGalleryScrollView = v3->_complicationGalleryScrollView;
  v3->_complicationGalleryScrollView = v23;

  [(BSUIScrollView *)v3->_complicationGalleryScrollView setDelegate:v3];
  [(BSUIScrollView *)v3->_complicationGalleryScrollView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(BSUIScrollView *)v3->_complicationGalleryScrollView setDecelerationRate:*MEMORY[0x1E4FB2EE8]];
  [(BSUIScrollView *)v3->_complicationGalleryScrollView setClipsToBounds:0];
  [(BSUIScrollView *)v3->_complicationGalleryScrollView setShowsHorizontalScrollIndicator:0];
  [(BSUIScrollView *)v3->_complicationGalleryScrollView addSubview:v3->_complicationGalleryStackView];
  [(UIStackView *)v3->_contentStackView addArrangedSubview:v3->_complicationGalleryScrollView];
  v25 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  instructionsLabel = v3->_instructionsLabel;
  v3->_instructionsLabel = v25;

  [(UILabel *)v3->_instructionsLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v27 = v3->_instructionsLabel;
  v28 = [(PRComplicationGalleryDetailView *)v3 _instructionsLabelFont];
  [(UILabel *)v27 setFont:v28];

  v29 = v3->_instructionsLabel;
  v30 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UILabel *)v29 setTextColor:v30];

  [(UILabel *)v3->_instructionsLabel setTextAlignment:1];
  v31 = v3->_instructionsLabel;
  v32 = PRBundle();
  v33 = [v32 localizedStringForKey:@"COMPLICATION_GALLERY_DETAIL_FOOTER_TEXT" value:&stru_1ED9A3120 table:@"PosterKit"];
  [(UILabel *)v31 setText:v33];

  [(UILabel *)v3->_instructionsLabel setNumberOfLines:0];
  [(UIStackView *)v3->_contentStackView addArrangedSubview:v3->_instructionsLabel];
  v34 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  footerStackSpacerView = v3->_footerStackSpacerView;
  v3->_footerStackSpacerView = v34;

  [(UIView *)v3->_footerStackSpacerView setTranslatesAutoresizingMaskIntoConstraints:0];
  v36 = v3->_contentStackView;
  v37 = v3->_footerStackSpacerView;

  [(UIStackView *)v36 addArrangedSubview:v37];
}

- (void)_createPageControlIfNecessary
{
  v10 = self;
  if ([(NSArray *)v10->_pages count] >= 2)
  {
    v2 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    footerContainerView = v10->_footerContainerView;
    v10->_footerContainerView = v2;

    [(UIView *)v10->_footerContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PRComplicationGalleryDetailView *)v10 addSubview:v10->_footerContainerView];
    objc_super v4 = (UIPageControl *)objc_alloc_init(MEMORY[0x1E4FB1A40]);
    pageControl = v10->_pageControl;
    v10->_pageControl = v4;

    [(UIPageControl *)v10->_pageControl setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIPageControl *)v10->_pageControl setNumberOfPages:[(NSArray *)v10->_pages count]];
    [(UIPageControl *)v10->_pageControl setCurrentPage:0];
    [(UIPageControl *)v10->_pageControl setHidesForSinglePage:1];
    id v6 = v10->_pageControl;
    objc_super v7 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UIPageControl *)v6 setPageIndicatorTintColor:v7];

    uint64_t v8 = v10->_pageControl;
    v9 = [MEMORY[0x1E4FB1618] labelColor];
    [(UIPageControl *)v8 setCurrentPageIndicatorTintColor:v9];

    [(UIPageControl *)v10->_pageControl addTarget:v10 action:sel_pageControlChanged_ forControlEvents:4096];
    [(UIView *)v10->_footerContainerView addSubview:v10->_pageControl];
  }
  [(PRComplicationGalleryDetailView *)v10 _addFooterConstraints];
}

- (void)_createConstraints
{
  v52[4] = *MEMORY[0x1E4F143B8];
  v2 = self;
  id v3 = PRPinViewWithinView(v2->_contentScrollView, v2);
  id v4 = PRPinViewWithinView(v2->_containerView, v2->_contentScrollView);
  id v5 = PRPinViewWithinView(v2->_contentStackView, v2->_containerView);
  id v6 = PRPinViewWithinView(v2->_complicationGalleryScrollView, v2->_complicationGalleryStackView);
  objc_super v7 = [(BSUIScrollView *)v2->_contentScrollView contentLayoutGuide];
  uint64_t v8 = [(BSUIScrollView *)v2->_contentScrollView frameLayoutGuide];
  v9 = [(UIStackView *)v2->_complicationGalleryStackView heightAnchor];
  uint64_t v10 = [v9 constraintGreaterThanOrEqualToConstant:0.0];
  widgetGalleryHeightConstraint = v2->_widgetGalleryHeightConstraint;
  v2->_widgetGalleryHeightConstraint = (NSLayoutConstraint *)v10;

  v42 = (void *)MEMORY[0x1E4F28DC8];
  v46 = [v7 heightAnchor];
  v44 = [v8 heightAnchor];
  v12 = [v46 constraintGreaterThanOrEqualToAnchor:v44];
  v52[0] = v12;
  v49 = v7;
  v13 = [v7 widthAnchor];
  v48 = v8;
  v14 = [v8 widthAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  v52[1] = v15;
  v16 = [(BSUIScrollView *)v2->_complicationGalleryScrollView heightAnchor];
  v17 = [(UIStackView *)v2->_complicationGalleryStackView heightAnchor];
  v18 = [v16 constraintEqualToAnchor:v17];
  v52[2] = v18;
  v52[3] = v2->_widgetGalleryHeightConstraint;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:4];
  [v42 activateConstraints:v19];

  closeButton = v2->_closeButton;
  if (closeButton)
  {
    v22 = (void *)MEMORY[0x1E4F28DC8];
    v23 = [(UIButton *)closeButton trailingAnchor];
    v24 = [(PRComplicationGalleryDetailView *)v2 trailingAnchor];
    v25 = [v23 constraintEqualToAnchor:v24 constant:-21.0];
    v51[0] = v25;
    v26 = [(UIButton *)v2->_closeButton topAnchor];
    v27 = [(PRComplicationGalleryDetailView *)v2 topAnchor];
    v28 = [v26 constraintEqualToAnchor:v27 constant:21.0];
    v51[1] = v28;
    v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
    [v22 activateConstraints:v29];
  }
  titleView = v2->_titleView;
  if (titleView)
  {
    LODWORD(v20) = 1148846080;
    [(PRComplicationGalleryApplicationTitleView *)titleView setContentHuggingPriority:1 forAxis:v20];
    v40 = (void *)MEMORY[0x1E4F28DC8];
    v47 = [(PRComplicationGalleryApplicationTitleView *)v2->_titleView leadingAnchor];
    v45 = [(UIView *)v2->_headerView leadingAnchor];
    v43 = [v47 constraintEqualToAnchor:v45];
    v50[0] = v43;
    v41 = [(PRComplicationGalleryApplicationTitleView *)v2->_titleView trailingAnchor];
    v31 = [(UIView *)v2->_headerView trailingAnchor];
    v32 = [v41 constraintEqualToAnchor:v31];
    v50[1] = v32;
    v33 = [(PRComplicationGalleryApplicationTitleView *)v2->_titleView topAnchor];
    v34 = [(UIView *)v2->_headerView topAnchor];
    v35 = [v33 constraintEqualToAnchor:v34];
    v50[2] = v35;
    v36 = [(PRComplicationGalleryApplicationTitleView *)v2->_titleView bottomAnchor];
    v37 = [(UIView *)v2->_headerView bottomAnchor];
    v38 = [v36 constraintEqualToAnchor:v37];
    v50[3] = v38;
    v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:4];
    [v40 activateConstraints:v39];
  }
}

- (void)_addFooterConstraints
{
  v32[8] = *MEMORY[0x1E4F143B8];
  v2 = self;
  pageControl = v2->_pageControl;
  if (pageControl)
  {
    v22 = (void *)MEMORY[0x1E4F28DC8];
    v31 = [(UIPageControl *)pageControl leadingAnchor];
    v30 = [(UIView *)v2->_containerView leadingAnchor];
    v29 = [v31 constraintEqualToAnchor:v30 constant:24.0];
    v32[0] = v29;
    v28 = [(UIPageControl *)v2->_pageControl trailingAnchor];
    v27 = [(UIView *)v2->_containerView trailingAnchor];
    v26 = [v28 constraintEqualToAnchor:v27 constant:-24.0];
    v32[1] = v26;
    v25 = [(UIPageControl *)v2->_pageControl topAnchor];
    v24 = [(UIView *)v2->_footerContainerView topAnchor];
    v23 = [v25 constraintEqualToAnchor:v24];
    v32[2] = v23;
    v21 = [(UIPageControl *)v2->_pageControl bottomAnchor];
    double v20 = [(UIView *)v2->_footerContainerView bottomAnchor];
    uint64_t v19 = [v21 constraintEqualToAnchor:v20 constant:-50.0];
    v32[3] = v19;
    v18 = [(UIView *)v2->_footerStackSpacerView heightAnchor];
    v17 = [(UIView *)v2->_footerContainerView heightAnchor];
    v16 = [v18 constraintEqualToAnchor:v17 constant:50.0];
    v32[4] = v16;
    v15 = [(UIView *)v2->_footerContainerView leadingAnchor];
    id v4 = [(PRComplicationGalleryDetailView *)v2 leadingAnchor];
    id v5 = [v15 constraintEqualToAnchor:v4];
    v32[5] = v5;
    id v6 = [(UIView *)v2->_footerContainerView trailingAnchor];
    objc_super v7 = [(PRComplicationGalleryDetailView *)v2 trailingAnchor];
    uint64_t v8 = [v6 constraintEqualToAnchor:v7];
    v32[6] = v8;
    v9 = [(UIView *)v2->_footerContainerView bottomAnchor];
    uint64_t v10 = [(PRComplicationGalleryDetailView *)v2 bottomAnchor];
    v11 = [v9 constraintEqualToAnchor:v10];
    v32[7] = v11;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:8];
    [v22 activateConstraints:v12];
  }
  else
  {
    v13 = [(UIView *)v2->_footerStackSpacerView heightAnchor];
    v14 = [v13 constraintEqualToConstant:50.0];
    [v14 setActive:1];
  }
}

- (void)setTitle:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:"))
  {
    id v4 = (NSString *)[v6 copy];
    title = self->_title;
    self->_title = v4;

    [(PRComplicationGalleryDetailView *)self _updateContent];
  }
}

- (void)setIconImage:(id)a3
{
  id v5 = (UIImage *)a3;
  p_iconImage = &self->_iconImage;
  if (self->_iconImage != v5)
  {
    objc_super v7 = v5;
    objc_storeStrong((id *)p_iconImage, a3);
    p_iconImage = (UIImage **)[(PRComplicationGalleryDetailView *)self _updateContent];
    id v5 = v7;
  }
  MEMORY[0x1F41817F8](p_iconImage, v5);
}

- (void)setPages:(id)a3
{
  id v5 = a3;
  if (self->_pages)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PRComplicationGalleryDetailView.m" lineNumber:266 description:@"This class doesn't support changing the pages array after it has been set."];

    pages = self->_pages;
  }
  else
  {
    pages = 0;
  }
  if (![(NSArray *)pages isEqualToArray:v5])
  {
    objc_super v7 = (NSArray *)[v5 copy];
    uint64_t v8 = self->_pages;
    self->_pages = v7;

    v9 = self->_pages;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __44__PRComplicationGalleryDetailView_setPages___block_invoke;
    v11[3] = &unk_1E54DAA30;
    v11[4] = self;
    [(NSArray *)v9 enumerateObjectsUsingBlock:v11];
    [(PRComplicationGalleryDetailView *)self _createPageControlIfNecessary];
    [(PRComplicationGalleryDetailView *)self _updatePageViewControllerAppearanceForNormalScroll];
  }
}

void __44__PRComplicationGalleryDetailView_setPages___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 504);
  id v6 = a2;
  [v5 insertArrangedSubview:v6 atIndex:a3];
  id v9 = [v6 widthAnchor];

  objc_super v7 = [*(id *)(a1 + 32) widthAnchor];
  uint64_t v8 = [v9 constraintEqualToAnchor:v7];
  [v8 setActive:1];
}

- (void)setShowsCloseButton:(BOOL)a3
{
  if (self->_showsCloseButton != a3)
  {
    self->_showsCloseButton = a3;
    [(UIButton *)self->_closeButton setHidden:!a3];
  }
}

- (void)setShowsBackgroundView:(BOOL)a3
{
  if (self->_showsBackgroundView != a3)
  {
    self->_showsBackgroundView = a3;
    [(UIView *)self->_backgroundView setHidden:!a3];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PRComplicationGalleryDetailView;
  [(PRComplicationGalleryDetailView *)&v3 layoutSubviews];
  if (!self->_performedInitialSelection)
  {
    self->_performedInitialSelection = 1;
    [(PRComplicationGalleryDetailView *)self _scrollToPageIndex:0 animated:0];
  }
}

- (void)_updateContent
{
  [(PRComplicationGalleryApplicationTitleView *)self->_titleView setTitle:self->_title];
  titleView = self->_titleView;
  iconImage = self->_iconImage;
  [(PRComplicationGalleryApplicationTitleView *)titleView setIconImage:iconImage];
}

- (void)closeButtonTapped:(id)a3
{
  id v4 = [(PRComplicationGalleryDetailView *)self delegate];
  [v4 complicationGalleryViewDidTapClose:self];
}

- (void)pageControlChanged:(id)a3
{
  uint64_t v4 = [a3 currentPage];
  [(PRComplicationGalleryDetailView *)self _scrollToPageIndex:v4 animated:1];
}

- (unint64_t)_pageIndexAtContentOffset:(CGPoint)a3
{
  uint64_t v4 = -[UIStackView hitTest:withEvent:](self->_complicationGalleryStackView, "hitTest:withEvent:", 0, a3.x, a3.y);
  if (v4)
  {
    do
    {
      id v5 = [v4 superview];
      complicationGalleryStackView = self->_complicationGalleryStackView;

      if (v5 == complicationGalleryStackView) {
        break;
      }
      uint64_t v7 = [v4 superview];

      uint64_t v4 = (void *)v7;
    }
    while (v7);
  }
  uint64_t v8 = [(UIStackView *)self->_complicationGalleryStackView arrangedSubviews];
  unint64_t v9 = [v8 indexOfObject:v4];

  return v9;
}

- (void)_updatePageViewControllerAppearanceForNormalScroll
{
  objc_super v3 = self->_complicationGalleryScrollView;
  [(BSUIScrollView *)v3 contentOffset];
  double v5 = v4;
  double v7 = v6;
  [(BSUIScrollView *)v3 bounds];
  double v9 = v8;

  unint64_t v10 = -[PRComplicationGalleryDetailView _pageIndexAtContentOffset:](self, "_pageIndexAtContentOffset:", v5 + v9 * 0.5, v7);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __85__PRComplicationGalleryDetailView__updatePageViewControllerAppearanceForNormalScroll__block_invoke;
  v11[3] = &__block_descriptor_40_e8_B16__0Q8l;
  v11[4] = v10;
  [(PRComplicationGalleryDetailView *)self _updatePageViewControllerAppearanceWithAppearedBlock:v11];
}

BOOL __85__PRComplicationGalleryDetailView__updatePageViewControllerAppearanceForNormalScroll__block_invoke(uint64_t a1, int a2)
{
  int v2 = a2 - *(_DWORD *)(a1 + 32);
  if (v2 < 0) {
    int v2 = *(_DWORD *)(a1 + 32) - a2;
  }
  return v2 < 3;
}

- (void)_updatePageViewControllerAppearanceWithAppearedBlock:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 complicationGalleryView:self didUpdateVisiblePagesWithAppearedBlock:v7];
  }
}

- (void)_scrollToPageIndex:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(UIStackView *)self->_complicationGalleryStackView arrangedSubviews];
  unint64_t v8 = [v7 count];

  if (v8 <= a3)
  {
    v11 = PRLogEditing();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[PRComplicationGalleryDetailView _scrollToPageIndex:animated:](v8, a3, v11);
    }
  }
  else
  {
    [(PRComplicationGalleryDetailView *)self layoutIfNeeded];
    if ([(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] == 1) {
      a3 = [(NSArray *)self->_pages count] + ~a3;
    }
    [(BSUIScrollView *)self->_complicationGalleryScrollView bounds];
    double v10 = v9 * (double)a3;
    -[BSUIScrollView setContentOffset:animated:](self->_complicationGalleryScrollView, "setContentOffset:animated:", v4, v10, 0.0);
    -[PRComplicationGalleryDetailView _updatePageControlForContentOffset:animated:](self, "_updatePageControlForContentOffset:animated:", v4, v10, 0.0);
  }
}

- (void)_updatePageControlForContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  double y = a3.y;
  double x = a3.x;
  [(PRComplicationGalleryDetailView *)self layoutIfNeeded];
  unint64_t v7 = -[PRComplicationGalleryDetailView _pageIndexAtContentOffset:](self, "_pageIndexAtContentOffset:", x, y);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v8 = v7;
    pageControl = self->_pageControl;
    [(UIPageControl *)pageControl setCurrentPage:v8];
  }
}

- (id)_instructionsLabelFont
{
  objc_super v3 = [MEMORY[0x1E4F4F8B8] preferredFontProvider];
  uint64_t v4 = *MEMORY[0x1E4FB28D0];
  char v5 = [(PRComplicationGalleryDetailView *)self traitCollection];
  id v6 = [v5 preferredContentSizeCategory];
  unint64_t v7 = [v3 preferredFontForTextStyle:v4 hiFontStyle:1 contentSizeCategory:v6];

  return v7;
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  uint64_t v4 = [(PRComplicationGalleryDetailView *)self instructionsLabel];
  char v5 = [(PRComplicationGalleryDetailView *)self _instructionsLabelFont];
  [v4 setFont:v5];

  [(PRComplicationGalleryDetailView *)self setNeedsLayout];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PRComplicationGalleryDetailView;
  id v4 = a3;
  [(PRComplicationGalleryDetailView *)&v8 traitCollectionDidChange:v4];
  char v5 = [(PRComplicationGalleryDetailView *)self traitCollection];
  id v6 = [v5 preferredContentSizeCategory];
  unint64_t v7 = [v4 preferredContentSizeCategory];

  LOBYTE(v4) = [v6 isEqualToString:v7];
  if ((v4 & 1) == 0) {
    [(PRComplicationGalleryDetailView *)self _contentSizeCategoryDidChange:0];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = [(PRComplicationGalleryDetailView *)self delegate];
  [v4 complicationGalleryViewShouldUpdateParallax:self];

  [(PRComplicationGalleryDetailView *)self _updatePageViewControllerAppearanceForNormalScroll];
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x = a4.x;
  id v19 = a3;
  [(BSUIScrollView *)self->_complicationGalleryScrollView bounds];
  double v9 = v8;
  if (BSFloatIsZero())
  {
    [v19 contentOffset];
    double v11 = v10;
    [(BSUIScrollView *)self->_complicationGalleryScrollView frame];
    double v13 = v11 + v12 * 0.5;
    [v19 contentOffset];
    NSUInteger v14 = [(PRComplicationGalleryDetailView *)self _pageIndexAtContentOffset:v13];
    if ([(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] == 1) {
      NSUInteger v14 = [(NSArray *)self->_pages count] + ~v14;
    }
    [(BSUIScrollView *)self->_complicationGalleryScrollView bounds];
    double v16 = v15 * (double)v14;
  }
  else
  {
    double v17 = a5->x / v9;
    double v18 = v9 * floor(v17);
    double v16 = v9 * ceil(v17);
    if (x <= 0.0) {
      double v16 = v18;
    }
  }
  a5->double x = v16;
  -[PRComplicationGalleryDetailView _updatePageControlForContentOffset:animated:](self, "_updatePageControlForContentOffset:animated:", 1);
}

- (PRComplicationGalleryDetailViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PRComplicationGalleryDetailViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (NSArray)pages
{
  return self->_pages;
}

- (BOOL)showsCloseButton
{
  return self->_showsCloseButton;
}

- (BOOL)showsBackgroundView
{
  return self->_showsBackgroundView;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
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

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
}

- (PRComplicationGalleryApplicationTitleView)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
}

- (UIStackView)complicationGalleryStackView
{
  return self->_complicationGalleryStackView;
}

- (void)setComplicationGalleryStackView:(id)a3
{
}

- (BSUIScrollView)complicationGalleryScrollView
{
  return self->_complicationGalleryScrollView;
}

- (void)setComplicationGalleryScrollView:(id)a3
{
}

- (UIPageControl)pageControl
{
  return self->_pageControl;
}

- (void)setPageControl:(id)a3
{
}

- (UILabel)instructionsLabel
{
  return self->_instructionsLabel;
}

- (void)setInstructionsLabel:(id)a3
{
}

- (UIView)footerContainerView
{
  return self->_footerContainerView;
}

- (void)setFooterContainerView:(id)a3
{
}

- (MTMaterialView)magicPocketBackgroundView
{
  return self->_magicPocketBackgroundView;
}

- (void)setMagicPocketBackgroundView:(id)a3
{
}

- (UIView)footerStackSpacerView
{
  return self->_footerStackSpacerView;
}

- (void)setFooterStackSpacerView:(id)a3
{
}

- (NSLayoutConstraint)widgetGalleryHeightConstraint
{
  return self->_widgetGalleryHeightConstraint;
}

- (void)setWidgetGalleryHeightConstraint:(id)a3
{
}

- (BOOL)performedInitialSelection
{
  return self->_performedInitialSelection;
}

- (void)setPerformedInitialSelection:(BOOL)a3
{
  self->_performedInitialSelection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetGalleryHeightConstraint, 0);
  objc_storeStrong((id *)&self->_footerStackSpacerView, 0);
  objc_storeStrong((id *)&self->_magicPocketBackgroundView, 0);
  objc_storeStrong((id *)&self->_footerContainerView, 0);
  objc_storeStrong((id *)&self->_instructionsLabel, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_complicationGalleryScrollView, 0);
  objc_storeStrong((id *)&self->_complicationGalleryStackView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
  objc_storeStrong((id *)&self->_contentScrollView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_pages, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_scrollToPageIndex:(os_log_t)log animated:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218240;
  uint64_t v4 = a2;
  __int16 v5 = 2048;
  uint64_t v6 = a1 - 1;
  _os_log_error_impl(&dword_18C1C4000, log, OS_LOG_TYPE_ERROR, "Trying to scroll to a page index (%lu) outside the bounds [0 - %lu]", (uint8_t *)&v3, 0x16u);
}

@end