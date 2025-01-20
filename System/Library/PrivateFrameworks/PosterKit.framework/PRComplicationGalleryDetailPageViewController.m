@interface PRComplicationGalleryDetailPageViewController
- (BOOL)_shouldDisplayFamily:(int64_t)a3;
- (PRAddWidgetDetailSheetWidgetDescriptionView)descriptionView;
- (PRComplicationGalleryDetailPageViewController)initWithGalleryItem:(id)a3 listLayoutProvider:(id)a4 iconViewProvider:(id)a5 widgetDragHandler:(id)a6 allowedFamilies:(unint64_t)a7;
- (PRComplicationGalleryDetailPageViewControllerDelegate)delegate;
- (SBHAddWidgetSheetGalleryItem)galleryItem;
- (SBHWidgetDragHandling)widgetDragHandler;
- (SBIconListLayoutProvider)listLayoutProvider;
- (SBIconViewProviding)iconViewProvider;
- (UILayoutGuide)layoutGuide;
- (UIStackView)complicationsStackView;
- (UIStackView)stackView;
- (UIView)referenceView;
- (id)backgroundViewMatchingMaterialBeneathWrapperViewController:(id)a3;
- (unint64_t)allowedFamilies;
- (void)iconTapped:(id)a3;
- (void)loadView;
- (void)setAllowedFamilies:(unint64_t)a3;
- (void)setComplicationsStackView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDescriptionView:(id)a3;
- (void)setIconViewProvider:(id)a3;
- (void)setLayoutGuide:(id)a3;
- (void)setListLayoutProvider:(id)a3;
- (void)setReferenceView:(id)a3;
- (void)setStackView:(id)a3;
- (void)updateParallaxEffectInReferenceView:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PRComplicationGalleryDetailPageViewController

- (PRComplicationGalleryDetailPageViewController)initWithGalleryItem:(id)a3 listLayoutProvider:(id)a4 iconViewProvider:(id)a5 widgetDragHandler:(id)a6 allowedFamilies:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PRComplicationGalleryDetailPageViewController;
  v17 = [(PRComplicationGalleryDetailPageViewController *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_galleryItem, a3);
    objc_storeStrong((id *)&v18->_listLayoutProvider, a4);
    objc_storeStrong((id *)&v18->_iconViewProvider, a5);
    objc_storeStrong((id *)&v18->_widgetDragHandler, a6);
    v18->_allowedFamilies = a7;
  }

  return v18;
}

- (void)loadView
{
  v51[1] = *MEMORY[0x1E4F143B8];
  v49.receiver = self;
  v49.super_class = (Class)PRComplicationGalleryDetailPageViewController;
  [(PRComplicationGalleryDetailPageViewController *)&v49 loadView];
  v3 = [(PRComplicationGalleryDetailPageViewController *)self view];
  v4 = (UIStackView *)objc_alloc_init(MEMORY[0x1E4FB1C60]);
  stackView = self->_stackView;
  self->_stackView = v4;

  [(UIStackView *)self->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_stackView setAxis:1];
  [(UIStackView *)self->_stackView setAlignment:3];
  [v3 addSubview:self->_stackView];
  id v6 = PRPinViewWithinView(self->_stackView, v3);
  v7 = [PRAddWidgetDetailSheetWidgetDescriptionView alloc];
  v8 = [(PRComplicationGalleryDetailPageViewController *)self galleryItem];
  v9 = objc_msgSend(v8, "sbh_widgetName");
  v10 = [(PRComplicationGalleryDetailPageViewController *)self galleryItem];
  v11 = objc_msgSend(v10, "sbh_widgetDescription");
  v12 = [(PRAddWidgetDetailSheetWidgetDescriptionView *)v7 initWithTitle:v9 subtitle:v11];
  descriptionView = self->_descriptionView;
  self->_descriptionView = v12;

  [(PRAddWidgetDetailSheetWidgetDescriptionView *)self->_descriptionView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PRAddWidgetDetailSheetWidgetDescriptionView *)self->_descriptionView bs_setHitTestingDisabled:1];
  [(UIStackView *)self->_stackView addArrangedSubview:self->_descriptionView];
  id v14 = [(PRAddWidgetDetailSheetWidgetDescriptionView *)self->_descriptionView widthAnchor];
  v42 = v3;
  id v15 = [v3 widthAnchor];
  id v16 = [v14 constraintEqualToAnchor:v15];
  [v16 setActive:1];

  id v17 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [(UIStackView *)self->_stackView addArrangedSubview:v17];
  v18 = (UIStackView *)objc_alloc_init(MEMORY[0x1E4FB1C60]);
  complicationsStackView = self->_complicationsStackView;
  self->_complicationsStackView = v18;

  [(UIStackView *)self->_complicationsStackView setAlignment:4];
  [(UIStackView *)self->_complicationsStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_complicationsStackView setAxis:0];
  [(UIStackView *)self->_complicationsStackView setSpacing:20.0];
  [(UIStackView *)self->_stackView addArrangedSubview:self->_complicationsStackView];
  id v20 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [(UIStackView *)self->_stackView addArrangedSubview:v20];
  v21 = (void *)MEMORY[0x1E4F28DC8];
  v41 = v17;
  v22 = [v17 heightAnchor];
  v40 = v20;
  v23 = [v20 heightAnchor];
  v24 = [v22 constraintEqualToAnchor:v23];
  v51[0] = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
  [v21 activateConstraints:v25];

  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __57__PRComplicationGalleryDetailPageViewController_loadView__block_invoke;
  v48[3] = &unk_1E54DCDF0;
  v48[4] = self;
  objc_msgSend(&unk_1ED9EF088, "bs_filter:", v48);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v26 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v45;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v45 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v30 = [*(id *)(*((void *)&v44 + 1) + 8 * v29) unsignedIntegerValue];
        id v31 = objc_alloc(MEMORY[0x1E4FA63A8]);
        v32 = [(PRComplicationGalleryDetailPageViewController *)self galleryItem];
        v33 = [(PRComplicationGalleryDetailPageViewController *)self listLayoutProvider];
        v34 = [(PRComplicationGalleryDetailPageViewController *)self iconViewProvider];
        v35 = (void *)[v31 initWithGalleryItem:v32 titleAndSubtitleVisible:0 listLayoutProvider:v33 iconViewProvider:v34];

        [v35 setSelectedSizeClass:v30];
        [v35 setDelegate:self];
        [v35 setUsesAmbientScaleFactorForRemovableBackgroundItems:0];
        v36 = [v35 wrapperView];
        [v36 setBackgroundType:0];

        v37 = [v35 wrapperView];
        [v37 setCornerRadius:PRWidgetPlatterCornerRadius()];

        v38 = self->_complicationsStackView;
        v39 = [v35 view];
        [(UIStackView *)v38 addArrangedSubview:v39];

        [(PRComplicationGalleryDetailPageViewController *)self bs_addChildViewController:v35];
        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v27);
  }
}

uint64_t __57__PRComplicationGalleryDetailPageViewController_loadView__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 integerValue];
  return [v2 _shouldDisplayFamily:v3];
}

- (BOOL)_shouldDisplayFamily:(int64_t)a3
{
  uint64_t v5 = CHSWidgetFamilyMaskFromWidgetFamily();
  id v6 = [(PRComplicationGalleryDetailPageViewController *)self galleryItem];
  uint64_t v7 = objc_msgSend(v6, "sbh_supportedSizeClasses") & v5;

  unint64_t v8 = self->_allowedFamilies & v5;
  if (a3 == 1)
  {
    v9 = [(PRComplicationGalleryDetailPageViewController *)self galleryItem];
    v10 = v9;
    char v11 = 0;
    if (v7 && v8) {
      char v11 = objc_msgSend(v9, "sbh_supportsRemovableBackground");
    }
  }
  else
  {
    if (v7) {
      BOOL v12 = v8 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    return !v12;
  }
  return v11;
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PRComplicationGalleryDetailPageViewController;
  [(PRComplicationGalleryDetailPageViewController *)&v7 viewWillAppear:a3];
  v4 = [(PRAddWidgetDetailSheetWidgetDescriptionView *)self->_descriptionView heightAnchor];
  uint64_t v5 = [(UILayoutGuide *)self->_layoutGuide heightAnchor];
  id v6 = [v4 constraintEqualToAnchor:v5];
  [v6 setActive:1];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PRComplicationGalleryDetailPageViewController;
  [(PRComplicationGalleryDetailPageViewController *)&v3 viewDidLayoutSubviews];
  [(PRComplicationGalleryDetailPageViewController *)self updateParallaxEffectInReferenceView:self->_referenceView];
}

- (void)updateParallaxEffectInReferenceView:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_referenceView, a3);
  if (self->_referenceView)
  {
    id v6 = [(PRComplicationGalleryDetailPageViewController *)self view];
    objc_super v7 = self->_complicationsStackView;
    [v6 bounds];
    objc_msgSend(v5, "convertRect:fromView:", v6);
    double v10 = (v8 + v9 + v8 + v9) / (v9 + v9) + -1.0;
    [(UIStackView *)v7 bounds];
    double v12 = v11;
    [(UIStackView *)v7 center];
    memset(&v15, 0, sizeof(v15));
    CGAffineTransformMakeTranslation(&v15, -(v10 * (v13 + v12 * -0.5 + 10.0)), 0.0);
    CGAffineTransform v14 = v15;
    [(UIStackView *)v7 setTransform:&v14];
  }
}

- (SBHWidgetDragHandling)widgetDragHandler
{
  return self->_widgetDragHandler;
}

- (id)backgroundViewMatchingMaterialBeneathWrapperViewController:(id)a3
{
  return 0;
}

- (void)iconTapped:(id)a3
{
  v4 = [a3 wrapperView];
  id v6 = [v4 contentView];

  if (v6)
  {
    id v5 = [(PRComplicationGalleryDetailPageViewController *)self delegate];
    [v5 complicationGalleryDetailPageViewController:self didSelectWidgetIconView:v6];
  }
}

- (SBHAddWidgetSheetGalleryItem)galleryItem
{
  return self->_galleryItem;
}

- (PRComplicationGalleryDetailPageViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PRComplicationGalleryDetailPageViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UILayoutGuide)layoutGuide
{
  return self->_layoutGuide;
}

- (void)setLayoutGuide:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (PRAddWidgetDetailSheetWidgetDescriptionView)descriptionView
{
  return self->_descriptionView;
}

- (void)setDescriptionView:(id)a3
{
}

- (UIStackView)complicationsStackView
{
  return self->_complicationsStackView;
}

- (void)setComplicationsStackView:(id)a3
{
}

- (UIView)referenceView
{
  return self->_referenceView;
}

- (void)setReferenceView:(id)a3
{
}

- (unint64_t)allowedFamilies
{
  return self->_allowedFamilies;
}

- (void)setAllowedFamilies:(unint64_t)a3
{
  self->_allowedFamilies = a3;
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  return self->_listLayoutProvider;
}

- (void)setListLayoutProvider:(id)a3
{
}

- (SBIconViewProviding)iconViewProvider
{
  return self->_iconViewProvider;
}

- (void)setIconViewProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconViewProvider, 0);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
  objc_storeStrong((id *)&self->_referenceView, 0);
  objc_storeStrong((id *)&self->_complicationsStackView, 0);
  objc_storeStrong((id *)&self->_descriptionView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_layoutGuide, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_galleryItem, 0);
  objc_storeStrong((id *)&self->_widgetDragHandler, 0);
}

@end