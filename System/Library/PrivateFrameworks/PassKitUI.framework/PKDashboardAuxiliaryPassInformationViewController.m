@interface PKDashboardAuxiliaryPassInformationViewController
- ($85E40A55691FE2F31975A98F57E3065D)pkui_navigationStatusBarStyleDescriptor;
- (BOOL)_shouldBlurButtons;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (PKDashboardAuxiliaryPassInformationViewController)initWithItem:(id)a3 forPass:(id)a4;
- (id)_barButtonItems;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (void)_handleMessageButtonTapped;
- (void)_handlePhoneButtonTapped;
- (void)_showMapsDetailsViewController;
- (void)_updateButtonConfigurationsDisablingBlur:(BOOL)a3;
- (void)_updateHeaderCellWithAnimationProgress:(id)a3;
- (void)_updateNavigationBarIconForNavigationBarAppeared:(BOOL)a3;
- (void)_updateNavigationBarIconWithLogoURL:(id)a3;
- (void)updateContent;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PKDashboardAuxiliaryPassInformationViewController

- (PKDashboardAuxiliaryPassInformationViewController)initWithItem:(id)a3 forPass:(id)a4
{
  v24[3] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = [[PKAuxiliaryPassInformationDataSource alloc] initWithItem:v7 forPass:v6];

  v9 = objc_alloc_init(PKDashboardDetailHeaderItemPresenter);
  v10 = objc_alloc_init(PKDashboardTextActionItemPresenter);
  v11 = objc_alloc_init(PKDashboardMapItemPresenter);
  v12 = objc_alloc_init(PKHeaderVerticalScrollingLayout);
  [(PKHeaderVerticalScrollingLayout *)v12 setUseStickyHeader:1];
  v24[0] = v9;
  v24[1] = v10;
  v24[2] = v11;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];
  v23.receiver = self;
  v23.super_class = (Class)PKDashboardAuxiliaryPassInformationViewController;
  v14 = [(PKDashboardViewController *)&v23 initWithDataSource:v8 presenters:v13 layout:v12];

  if (v14)
  {
    v15 = [(PKDashboardAuxiliaryPassInformationViewController *)v14 navigationItem];
    [(PKDashboardViewController *)v14 setUseChromelessNavigationItem:0];
    objc_msgSend(v15, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v15, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
    v16 = [(PKDashboardAuxiliaryPassInformationViewController *)v14 _barButtonItems];
    [v15 setRightBarButtonItems:v16];

    v17 = [v15 standardAppearance];
    v18 = [v17 backgroundEffect];
    [(PKDashboardDetailHeaderItemPresenter *)v9 setOverlayEffect:v18];

    v19 = [v17 shadowColor];
    [(PKDashboardDetailHeaderItemPresenter *)v9 setShadowColor:v19];

    uint64_t v20 = [(PKAuxiliaryPassInformationDataSource *)v8 headerIndexPath];
    headerIndexPath = v14->_headerIndexPath;
    v14->_headerIndexPath = (NSIndexPath *)v20;

    objc_storeStrong((id *)&v14->_headerPresenter, v9);
  }

  return v14;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)PKDashboardAuxiliaryPassInformationViewController;
  [(PKDashboardViewController *)&v5 viewDidLoad];
  self->_isHeaderPinned = 1;
  v3 = [(PKDashboardAuxiliaryPassInformationViewController *)self view];
  v4 = +[PKDashboardViewController backgroundColor];
  [v3 setBackgroundColor:v4];
}

- (void)_updateNavigationBarIconForNavigationBarAppeared:(BOOL)a3
{
  BOOL v3 = a3;
  titleIconImageView = self->_titleIconImageView;
  if (titleIconImageView)
  {
    titleView = self->_titleView;
    if (v3)
    {
      if (!titleView)
      {
        id v7 = [(PKDashboardAuxiliaryPassInformationViewController *)self navigationController];
        v8 = [v7 navigationBar];
        [v8 frame];
        double v10 = v9;

        v11 = -[PKAnimatedNavigationBarTitleView initWithFrame:]([PKAnimatedNavigationBarTitleView alloc], "initWithFrame:", 0.0, 0.0, v10, v10);
        v12 = self->_titleView;
        self->_titleView = v11;

        v13 = [(PKDashboardAuxiliaryPassInformationViewController *)self navigationItem];
        objc_msgSend(v13, "pkui_setCenterAlignedTitleView:", self->_titleView);

        titleView = self->_titleView;
        titleIconImageView = self->_titleIconImageView;
      }
    }
    else
    {
      titleIconImageView = 0;
    }
    [(PKAnimatedNavigationBarTitleView *)titleView setTitleView:titleIconImageView animated:1];
  }
  else if (self->_titleText)
  {
    v14 = [(PKDashboardAuxiliaryPassInformationViewController *)self navigationItem];
    id v16 = v14;
    if (v3) {
      titleText = self->_titleText;
    }
    else {
      titleText = 0;
    }
    [v14 _setTitle:titleText animated:1];
  }
}

- (void)viewWillLayoutSubviews
{
  v34.receiver = self;
  v34.super_class = (Class)PKDashboardAuxiliaryPassInformationViewController;
  [(PKDashboardAuxiliaryPassInformationViewController *)&v34 viewWillLayoutSubviews];
  BOOL v3 = [(PKDashboardAuxiliaryPassInformationViewController *)self collectionView];
  [v3 contentOffset];
  double v5 = v4;
  [v3 safeAreaInsets];
  double v8 = v7;
  double v9 = (double *)MEMORY[0x1E4FB2848];
  if (self->_footer)
  {
    double v10 = v6;
    [(PKDashboardViewControllerFooterContainer *)self->_footerContainer bounds];
    double v12 = v11 - v10;
  }
  else
  {
    double v12 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  }
  double v13 = v9[1];
  double v14 = v9[3];
  if (self->_isHeaderPinned)
  {
    double v15 = self->_headerHeight - v8 - fmin(v5, 0.0);
    double v16 = -v8;
  }
  else
  {
    double v16 = *v9;
    double v15 = *v9;
  }
  objc_msgSend(v3, "setVerticalScrollIndicatorInsets:", v15, v9[1], v12, v9[3]);
  objc_msgSend(v3, "setContentInset:", v16, v13, v12, v14);
  double merchantHeaderAnimationProgress = self->_merchantHeaderAnimationProgress;
  double headerHeight = self->_headerHeight;
  if (headerHeight <= 0.0)
  {
    self->_double merchantHeaderAnimationProgress = 0.0;
    double v19 = 0.0;
  }
  else
  {
    double v19 = fmin(fmax(v5 / vabdd_f64(headerHeight, v8), 0.0), 1.0);
    self->_double merchantHeaderAnimationProgress = v19;
    if (merchantHeaderAnimationProgress < 1.0 && v19 >= 1.0)
    {
      uint64_t v20 = 1;
LABEL_18:
      [(PKDashboardAuxiliaryPassInformationViewController *)self _updateNavigationBarIconForNavigationBarAppeared:v20];
      goto LABEL_19;
    }
  }
  if (merchantHeaderAnimationProgress >= 1.0 && v19 < 1.0)
  {
    uint64_t v20 = 0;
    goto LABEL_18;
  }
LABEL_19:
  if (self->_headerIndexPath)
  {
    v22 = [(PKDashboardAuxiliaryPassInformationViewController *)self collectionView];
    objc_super v23 = [v22 cellForItemAtIndexPath:self->_headerIndexPath];

    if (v23)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(PKDashboardAuxiliaryPassInformationViewController *)self _updateHeaderCellWithAnimationProgress:v23];
      }
    }
  }
  if (self->_isHeaderPinned)
  {
    double v24 = self->_merchantHeaderAnimationProgress;
    v25 = [(PKDashboardAuxiliaryPassInformationViewController *)self navigationItem];
    v26 = v25;
    double v27 = 1.0;
    if (v24 < 1.0) {
      double v27 = 0.0;
    }
    [v25 _setManualScrollEdgeAppearanceProgress:v27];

    if (merchantHeaderAnimationProgress > 0.35 && v19 <= 0.35 || merchantHeaderAnimationProgress < 0.35 && v19 >= 0.35)
    {
      v28 = [(PKDashboardAuxiliaryPassInformationViewController *)self navigationController];
      if (v28)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v29 = (void *)MEMORY[0x1E4FB1EB0];
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __75__PKDashboardAuxiliaryPassInformationViewController_viewWillLayoutSubviews__block_invoke;
          v30[3] = &unk_1E59CD7B0;
          id v31 = v28;
          v32 = self;
          BOOL v33 = v19 >= 0.35;
          [v29 _animateUsingDefaultTimingWithOptions:6 animations:v30 completion:0];
        }
      }
    }
  }
}

uint64_t __75__PKDashboardAuxiliaryPassInformationViewController_viewWillLayoutSubviews__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsNavigationBarUpdate];
  v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);

  return [v2 _updateButtonConfigurationsDisablingBlur:v3];
}

- (void)viewDidLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)PKDashboardAuxiliaryPassInformationViewController;
  [(PKDashboardAuxiliaryPassInformationViewController *)&v13 viewDidLayoutSubviews];
  uint64_t v3 = [(PKDashboardAuxiliaryPassInformationViewController *)self view];
  [v3 bounds];
  if (self->_footerContainer)
  {
    double v7 = v4;
    double v8 = v5;
    double v9 = v6;
    [v3 safeAreaInsets];
    double v11 = v10;
    -[PKDashboardViewControllerFooterContainer sizeThatFits:](self->_footerContainer, "sizeThatFits:", v8, v9);
    -[PKDashboardViewControllerFooterContainer setFrame:](self->_footerContainer, "setFrame:", 0.0, v7 + v9 - (v11 + v12), v8);
  }
}

- (void)updateContent
{
  v41.receiver = self;
  v41.super_class = (Class)PKDashboardAuxiliaryPassInformationViewController;
  [(PKDashboardViewController *)&v41 updateContent];
  uint64_t v3 = [(PKDashboardAuxiliaryPassInformationViewController *)self navigationItem];
  uint64_t v4 = [v3 rightBarButtonItems];
  double v5 = [(PKDashboardAuxiliaryPassInformationViewController *)self _barButtonItems];
  if ((PKEqualObjects() & 1) == 0) {
    [v3 setRightBarButtonItems:v5 animated:1];
  }
  double v6 = [(PKDashboardViewController *)self dataSource];
  double v7 = [v6 merchant];
  double v8 = PKUIScreenScale();
  double v9 = PKIconForMerchant(v7, 0, 0, 0, 35.0, 35.0, v8);
  uint64_t v10 = [v7 logoImageURL];
  double v11 = [v6 item];
  double v12 = v11;
  v39 = (void *)v10;
  v40 = (void *)v4;
  if (v9)
  {
    objc_super v13 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v9];
    titleIconImageView = self->_titleIconImageView;
    self->_titleIconImageView = v13;

    [(UIImageView *)self->_titleIconImageView setContentMode:1];
    [(UIImageView *)self->_titleIconImageView _setContinuousCornerRadius:3.0];
    [(UIImageView *)self->_titleIconImageView setClipsToBounds:1];
    [(PKDashboardAuxiliaryPassInformationViewController *)self _updateNavigationBarIconWithLogoURL:v10];
  }
  else
  {
    double v15 = [v11 title];
    titleText = self->_titleText;
    self->_titleText = v15;
  }
  v17 = [v12 detailFooterLeadingTitle];
  if (v17)
  {
    v38 = v3;
    footer = self->_footer;
    if (!footer)
    {
      double v19 = [PKDashboardViewControllerFooterView alloc];
      double v20 = *MEMORY[0x1E4F1DB28];
      double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      double v24 = -[PKDashboardViewControllerFooterView initWithFrame:](v19, "initWithFrame:", *MEMORY[0x1E4F1DB28], v21, v22, v23);
      v25 = self->_footer;
      self->_footer = v24;

      [(PKDashboardViewControllerFooterView *)self->_footer setDetailNumberOfLines:2];
      v26 = -[PKDashboardViewControllerFooterContainer initWithFrame:]([PKDashboardViewControllerFooterContainer alloc], "initWithFrame:", v20, v21, v22, v23);
      footerContainer = self->_footerContainer;
      self->_footerContainer = v26;

      [(PKDashboardViewControllerFooterContainer *)self->_footerContainer setCurrentFooter:self->_footer];
      v28 = [(PKDashboardAuxiliaryPassInformationViewController *)self view];
      [v28 addSubview:self->_footerContainer];

      footer = self->_footer;
    }
    v29 = [(PKDashboardViewControllerFooterView *)footer leadingTitle];
    [v29 setText:v17];

    v30 = [(PKDashboardViewControllerFooterView *)self->_footer leadingDetail];
    id v31 = [v12 detailFooterLeadingText];
    [v30 setText:v31];

    v32 = [v12 detailFooterTrailingTitle];
    BOOL v33 = [(PKDashboardViewControllerFooterView *)self->_footer trailingTitle];
    [v33 setText:v32];

    objc_super v34 = [(PKDashboardViewControllerFooterView *)self->_footer trailingDetail];
    v35 = [v12 detailFooterTrailingText];
    [v34 setText:v35];

    uint64_t v3 = v38;
  }
  v36 = [(PKDashboardAuxiliaryPassInformationViewController *)self navigationItem];
  v37 = [v6 navigationBarTitle];
  [v36 setBackButtonTitle:v37];

  [v36 setBackButtonDisplayMode:1];
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PKDashboardAuxiliaryPassInformationViewController;
  [(PKDashboardViewController *)&v16 collectionView:a3 layout:a4 sizeForItemAtIndexPath:v8];
  double v10 = v9;
  double v12 = v11;
  if (self->_headerIndexPath && objc_msgSend(v8, "isEqual:") && self->_headerHeight != v12)
  {
    self->_double headerHeight = v12;
    objc_super v13 = [(PKDashboardAuxiliaryPassInformationViewController *)self view];
    [v13 setNeedsLayout];
  }
  double v14 = v10;
  double v15 = v12;
  result.height = v15;
  result.width = v14;
  return result;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)PKDashboardAuxiliaryPassInformationViewController;
  double v7 = [(PKDashboardViewController *)&v9 collectionView:a3 cellForItemAtIndexPath:v6];
  if (self->_headerIndexPath)
  {
    if (objc_msgSend(v6, "isEqual:"))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(PKDashboardAuxiliaryPassInformationViewController *)self _updateHeaderCellWithAnimationProgress:v7];
      }
    }
  }

  return v7;
}

- (void)_updateHeaderCellWithAnimationProgress:(id)a3
{
  id v4 = a3;
  [v4 setOverlayAlpha:self->_merchantHeaderAnimationProgress];
  if (self->_isHeaderPinned && self->_merchantHeaderAnimationProgress >= 1.0) {
    [v4 setOverlayAlpha:0.0];
  }
}

- (void)_updateNavigationBarIconWithLogoURL:(id)a3
{
  if (a3)
  {
    id v4 = (void *)MEMORY[0x1E4F84830];
    id v5 = a3;
    id v6 = [v4 sharedImageAssetDownloader];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __89__PKDashboardAuxiliaryPassInformationViewController__updateNavigationBarIconWithLogoURL___block_invoke;
    v7[3] = &unk_1E59DBE50;
    v7[4] = self;
    [v6 downloadFromUrl:v5 completionHandler:v7];
  }
}

void __89__PKDashboardAuxiliaryPassInformationViewController__updateNavigationBarIconWithLogoURL___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 && !a4)
  {
    id v5 = [MEMORY[0x1E4FB1818] imageWithData:a2];
    id v6 = v5;
    if (v5)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __89__PKDashboardAuxiliaryPassInformationViewController__updateNavigationBarIconWithLogoURL___block_invoke_2;
      v7[3] = &unk_1E59CA870;
      v7[4] = *(void *)(a1 + 32);
      id v8 = v5;
      dispatch_async(MEMORY[0x1E4F14428], v7);
    }
  }
}

uint64_t __89__PKDashboardAuxiliaryPassInformationViewController__updateNavigationBarIconWithLogoURL___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1192) setImage:*(void *)(a1 + 40)];
}

- ($85E40A55691FE2F31975A98F57E3065D)pkui_navigationStatusBarStyleDescriptor
{
  uint64_t v3 = [(PKDashboardViewController *)self dataSource];
  id v4 = [v3 merchant];
  BOOL v6 = 0;
  if (v4)
  {
    double merchantHeaderAnimationProgress = self->_merchantHeaderAnimationProgress;

    if (merchantHeaderAnimationProgress < 0.35) {
      BOOL v6 = 1;
    }
  }

  BOOL v7 = v6;
  int64_t v8 = v6;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (void)_updateButtonConfigurationsDisablingBlur:(BOOL)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(PKDashboardAuxiliaryPassInformationViewController *)self _shouldBlurButtons];
  id v5 = [(PKDashboardAuxiliaryPassInformationViewController *)self _barButtonItems];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    BOOL v9 = a3 || !v4;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        double v11 = [*(id *)(*((void *)&v18 + 1) + 8 * i) customView];
        double v12 = [v11 contentView];
        objc_super v13 = [v12 configuration];
        double v14 = [v13 background];
        if (v9)
        {
          if (a3) {
            [MEMORY[0x1E4FB1618] secondarySystemFillColor];
          }
          else {
          objc_super v16 = [MEMORY[0x1E4FB1618] clearColor];
          }
          [v14 setBackgroundColor:v16];
          uint64_t v15 = 0;
        }
        else
        {
          uint64_t v15 = [MEMORY[0x1E4FB14C8] effectWithStyle:1];
          objc_super v16 = (void *)v15;
        }
        [v14 setVisualEffect:v15];

        [v12 setConfiguration:v13];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
}

- (BOOL)_shouldBlurButtons
{
  v2 = [(PKDashboardViewController *)self dataSource];
  uint64_t v3 = [v2 merchant];
  BOOL v4 = [v3 heroImageURL];
  BOOL v5 = v4 != 0;

  return v5;
}

- (id)_barButtonItems
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL v4 = [(PKDashboardViewController *)self dataSource];
  BOOL v5 = [v4 merchant];
  uint64_t v6 = v5;
  if (v5)
  {
    if ([v5 useRawMerchantData])
    {
      BOOL v7 = 0;
    }
    else
    {
      double v10 = [v6 mapsMerchant];
      BOOL v7 = v10 != 0;
    }
    double v11 = [v6 phoneNumber];
    BOOL v9 = v11 != 0;

    double v12 = [v6 businessChatURL];
    BOOL v8 = v12 != 0;
  }
  else
  {
    BOOL v8 = 0;
    BOOL v9 = 0;
    BOOL v7 = 0;
  }
  BOOL v13 = [(PKDashboardAuxiliaryPassInformationViewController *)self _shouldBlurButtons];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PKDashboardAuxiliaryPassInformationViewController__barButtonItems__block_invoke;
  aBlock[3] = &__block_descriptor_33_e43___UIButton_28__0__UIImage_8B16__UIAction_20l;
  BOOL v67 = v13;
  double v14 = (void (**)(void, void *, BOOL, void *))_Block_copy(aBlock);
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __68__PKDashboardAuxiliaryPassInformationViewController__barButtonItems__block_invoke_2;
  v64[3] = &__block_descriptor_48_e49___PKAlignedContentContainerView_16__0__UIButton_8l;
  int64x2_t v65 = vdupq_n_s64(0x4040000000000000uLL);
  uint64_t v15 = (void (**)(void *, UIButton *))_Block_copy(v64);
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __68__PKDashboardAuxiliaryPassInformationViewController__barButtonItems__block_invoke_3;
  v62[3] = &unk_1E59CA7D0;
  id v16 = v3;
  id v63 = v16;
  v17 = (void (**)(void))_Block_copy(v62);
  objc_initWeak(&location, self);
  if (v7)
  {
    if ([v16 count]) {
      v17[2](v17);
    }
    if (!self->_detailsButton)
    {
      [(PKDashboardViewController *)self dataSource];
      v52 = v14;
      v51 = v54 = v15;
      long long v18 = [v51 merchant];
      long long v19 = [v18 heroImageURL];

      if (v19) {
        long long v20 = @"info";
      }
      else {
        long long v20 = @"info.circle";
      }
      long long v21 = objc_msgSend(MEMORY[0x1E4FB1818], "systemImageNamed:", v20, v4);
      double v22 = (void *)MEMORY[0x1E4FB13F0];
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __68__PKDashboardAuxiliaryPassInformationViewController__barButtonItems__block_invoke_4;
      v59[3] = &unk_1E59CBEE0;
      objc_copyWeak(&v60, &location);
      uint64_t v23 = [v22 actionWithHandler:v59];
      v52[2](v52, v21, v19 == 0, v23);
      double v24 = (UIButton *)objc_claimAutoreleasedReturnValue();
      detailsButton = self->_detailsButton;
      self->_detailsButton = v24;

      v54[2](v54, self->_detailsButton);
      v26 = (PKAlignedContentContainerView *)objc_claimAutoreleasedReturnValue();
      detailsButtonContainer = self->_detailsButtonContainer;
      self->_detailsButtonContainer = v26;

      objc_destroyWeak(&v60);
      BOOL v4 = v50;
      double v14 = v52;
      uint64_t v15 = v54;
    }
    v28 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:self->_detailsButtonContainer];
    [v16 addObject:v28];
  }
  if (v9)
  {
    if ([v16 count]) {
      v17[2](v17);
    }
    v29 = &OBJC_IVAR___PKPassBannerMinimalView__leadingView;
    if (!self->_phoneButton)
    {
      v53 = (void (**)(void *, void *, void, void *))v14;
      v30 = [MEMORY[0x1E4FB1818] systemImageNamed:@"phone.fill"];
      id v31 = (void *)MEMORY[0x1E4FB13F0];
      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = __68__PKDashboardAuxiliaryPassInformationViewController__barButtonItems__block_invoke_5;
      v57[3] = &unk_1E59CBEE0;
      objc_copyWeak(&v58, &location);
      v32 = [v31 actionWithHandler:v57];
      v53[2](v53, v30, 0, v32);
      BOOL v33 = (UIButton *)objc_claimAutoreleasedReturnValue();
      phoneButton = self->_phoneButton;
      self->_phoneButton = v33;

      v15[2](v15, self->_phoneButton);
      v35 = (PKAlignedContentContainerView *)objc_claimAutoreleasedReturnValue();
      v29 = &OBJC_IVAR___PKPassBannerMinimalView__leadingView;
      phoneButtonContainer = self->_phoneButtonContainer;
      self->_phoneButtonContainer = v35;

      objc_destroyWeak(&v58);
      double v14 = (void (**)(void, void *, BOOL, void *))v53;
    }
    v37 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:*(Class *)((char *)&self->super.super.super.super.super.isa + v29[169])];
    [v16 addObject:v37];
  }
  if (v8)
  {
    if ([v16 count]) {
      v17[2](v17);
    }
    v38 = &OBJC_IVAR___PKPassBannerMinimalView__leadingView;
    if (!self->_messageButton)
    {
      v39 = (void (**)(void *, void *, void, void *))v14;
      v40 = [MEMORY[0x1E4FB1818] systemImageNamed:@"message.fill"];
      objc_super v41 = (void *)MEMORY[0x1E4FB13F0];
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __68__PKDashboardAuxiliaryPassInformationViewController__barButtonItems__block_invoke_6;
      v55[3] = &unk_1E59CBEE0;
      objc_copyWeak(&v56, &location);
      v42 = [v41 actionWithHandler:v55];
      v39[2](v39, v40, 0, v42);
      v43 = (UIButton *)objc_claimAutoreleasedReturnValue();
      messageButton = self->_messageButton;
      self->_messageButton = v43;

      v15[2](v15, self->_messageButton);
      v45 = (PKAlignedContentContainerView *)objc_claimAutoreleasedReturnValue();
      v38 = &OBJC_IVAR___PKPassBannerMinimalView__leadingView;
      messageButtonContainer = self->_messageButtonContainer;
      self->_messageButtonContainer = v45;

      objc_destroyWeak(&v56);
      double v14 = (void (**)(void, void *, BOOL, void *))v39;
    }
    v47 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:*(Class *)((char *)&self->super.super.super.super.super.isa + v38[171])];
    [v16 addObject:v47];
  }
  v48 = (void *)[v16 copy];
  objc_destroyWeak(&location);

  return v48;
}

id __68__PKDashboardAuxiliaryPassInformationViewController__barButtonItems__block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  BOOL v7 = (void *)MEMORY[0x1E4FB14D8];
  id v8 = a4;
  id v9 = a2;
  double v10 = [v7 plainButtonConfiguration];
  [v10 setImage:v9];

  [v10 setCornerStyle:4];
  if (*(unsigned char *)(a1 + 32))
  {
    double v11 = [MEMORY[0x1E4FB14C8] effectWithStyle:1];
    double v12 = [v10 background];
    [v12 setVisualEffect:v11];
  }
  BOOL v13 = (void *)MEMORY[0x1E4FB1830];
  double v14 = (double *)MEMORY[0x1E4FB09D8];
  if (a3) {
    double v14 = (double *)MEMORY[0x1E4FB09B8];
  }
  uint64_t v15 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0 weight:*v14];
  id v16 = [v13 configurationWithFont:v15];

  [v10 setPreferredSymbolConfigurationForImage:v16];
  v17 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v10 primaryAction:v8];

  return v17;
}

PKAlignedContentContainerView *__68__PKDashboardAuxiliaryPassInformationViewController__barButtonItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [PKAlignedContentContainerView alloc];
  BOOL v5 = -[PKAlignedContentContainerView initWithContentView:alignment:size:](v4, "initWithContentView:alignment:size:", v3, *MEMORY[0x1E4F87150], *(double *)(a1 + 32), *(double *)(a1 + 40));

  -[PKAlignedContentContainerView setFrame:](v5, "setFrame:", 0.0, 0.0, 32.0, 32.0);

  return v5;
}

void __68__PKDashboardAuxiliaryPassInformationViewController__barButtonItems__block_invoke_3(uint64_t a1)
{
  id v2 = (id)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:6 target:0 action:0];
  [v2 setWidth:15.0];
  [*(id *)(a1 + 32) addObject:v2];
}

void __68__PKDashboardAuxiliaryPassInformationViewController__barButtonItems__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleInfoButtonTapped];
}

void __68__PKDashboardAuxiliaryPassInformationViewController__barButtonItems__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handlePhoneButtonTapped];
}

void __68__PKDashboardAuxiliaryPassInformationViewController__barButtonItems__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleMessageButtonTapped];
}

- (void)_handleMessageButtonTapped
{
  if (PKStoreDemoModeEnabled())
  {
    PKUIStoreDemoGatewayViewController();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [(PKDashboardAuxiliaryPassInformationViewController *)self presentViewController:v6 animated:1 completion:0];
  }
  else
  {
    id v6 = [(PKDashboardViewController *)self dataSource];
    id v3 = [v6 merchant];
    BOOL v4 = [v3 businessChatURL];

    if (v4)
    {
      BOOL v5 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      [v5 openURL:v4 configuration:0 completionHandler:0];
    }
  }
}

- (void)_handlePhoneButtonTapped
{
  if (PKStoreDemoModeEnabled())
  {
    PKUIStoreDemoGatewayViewController();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [(PKDashboardAuxiliaryPassInformationViewController *)self presentViewController:v7 animated:1 completion:0];
  }
  else
  {
    id v7 = [(PKDashboardViewController *)self dataSource];
    id v3 = [v7 merchant];
    BOOL v4 = [v3 phoneNumber];

    if (v4)
    {
      BOOL v5 = PKTelephoneURLFromPhoneNumber();
      id v6 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      [v6 openSensitiveURL:v5 withOptions:0];
    }
  }
}

- (void)_showMapsDetailsViewController
{
  v23[1] = *MEMORY[0x1E4F143B8];
  if (!self->_loadingMapsViewController)
  {
    id v3 = [(PKDashboardViewController *)self dataSource];
    BOOL v4 = [v3 merchant];
    BOOL v5 = [v4 mapsMerchant];
    id v6 = (void *)[v5 identifier];

    if (v6)
    {
      self->_loadingMapsViewController = 1;
      loadingMapsTimer = self->_loadingMapsTimer;
      if (loadingMapsTimer)
      {
        dispatch_source_cancel(loadingMapsTimer);
        id v8 = self->_loadingMapsTimer;
        self->_loadingMapsTimer = 0;
      }
      objc_initWeak(&location, self);
      id v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
      double v10 = self->_loadingMapsTimer;
      self->_loadingMapsTimer = v9;

      double v11 = self->_loadingMapsTimer;
      dispatch_time_t v12 = dispatch_time(0, 1000000000);
      dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
      BOOL v13 = self->_loadingMapsTimer;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __83__PKDashboardAuxiliaryPassInformationViewController__showMapsDetailsViewController__block_invoke;
      handler[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v21, &location);
      dispatch_source_set_event_handler(v13, handler);
      dispatch_resume((dispatch_object_t)self->_loadingMapsTimer);
      id v14 = objc_alloc_init(MEMORY[0x1E4F30EF0]);
      uint64_t v15 = [NSNumber numberWithUnsignedLongLong:v6];
      v23[0] = v15;
      id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
      [v14 _setMuids:v16];

      v17 = (void *)[objc_alloc(MEMORY[0x1E4F30ED8]) initWithRequest:v14];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __83__PKDashboardAuxiliaryPassInformationViewController__showMapsDetailsViewController__block_invoke_2;
      v18[3] = &unk_1E59DBEE8;
      objc_copyWeak(v19, &location);
      v18[4] = self;
      v19[1] = v6;
      [v17 startWithCompletionHandler:v18];
      objc_destroyWeak(v19);

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
  }
}

void __83__PKDashboardAuxiliaryPassInformationViewController__showMapsDetailsViewController__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = (id *)WeakRetained;
  if (WeakRetained)
  {
    id v3 = *((void *)WeakRetained + 162);
    BOOL v5 = v2;
    if (v3)
    {
      dispatch_source_cancel(v3);
      id v4 = v5[162];
      v5[162] = 0;

      id v2 = v5;
    }
    objc_msgSend(v2[166], "pkui_updateConfigurationShowingActivityIndicator:", 1);
    id v2 = v5;
  }
}

void __83__PKDashboardAuxiliaryPassInformationViewController__showMapsDetailsViewController__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__PKDashboardAuxiliaryPassInformationViewController__showMapsDetailsViewController__block_invoke_3;
  block[3] = &unk_1E59DBEC0;
  objc_copyWeak(v13, (id *)(a1 + 40));
  block[4] = *(void *)(a1 + 32);
  id v11 = v6;
  id v7 = *(void **)(a1 + 48);
  id v12 = v5;
  v13[1] = v7;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v13);
}

void __83__PKDashboardAuxiliaryPassInformationViewController__showMapsDetailsViewController__block_invoke_3(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[162];
    if (v4)
    {
      dispatch_source_cancel(v4);
      id v5 = v3[162];
      v3[162] = 0;
    }
    *((unsigned char *)v3 + 1288) = 0;
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1328), "pkui_updateConfigurationShowingActivityIndicator:", 0);
    if (*(void *)(a1 + 40)
      || ([*(id *)(a1 + 48) mapItems],
          double v10 = objc_claimAutoreleasedReturnValue(),
          uint64_t v11 = [v10 count],
          v10,
          !v11))
    {
      id v6 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 64);
        id v8 = *(void **)(a1 + 40);
        if (v8)
        {
          id v9 = [v8 localizedDescription];
        }
        else
        {
          id v9 = @"no map items.";
        }
        int v23 = 134218242;
        uint64_t v24 = v7;
        __int16 v25 = 2112;
        v26 = v9;
        _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "PKDashboardAuxiliaryPassInformationViewController: MKLocalSearch could not resolve merchant maps for mapsID: %llu. Error: %@", (uint8_t *)&v23, 0x16u);
        if (v8) {
      }
        }
      v17 = (void *)MEMORY[0x1E4FB1418];
      long long v18 = PKLocalizedPaymentString(&cfstr_DashboardMapsM.isa);
      long long v19 = [v17 alertControllerWithTitle:0 message:v18 preferredStyle:1];

      long long v20 = (void *)MEMORY[0x1E4FB1410];
      id v21 = PKLocalizedPaymentString(&cfstr_DashboardMapsM_0.isa);
      double v22 = [v20 actionWithTitle:v21 style:0 handler:0];
      [v19 addAction:v22];

      [v3 presentViewController:v19 animated:1 completion:0];
    }
    else
    {
      id v12 = [PKMerchantMapViewController alloc];
      BOOL v13 = [*(id *)(a1 + 48) mapItems];
      id v14 = [v13 firstObject];
      uint64_t v15 = [(PKMerchantMapViewController *)v12 initWithMapItem:v14];

      id v16 = [v3 navigationController];
      [v16 pushViewController:v15 animated:1];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageButton, 0);
  objc_storeStrong((id *)&self->_phoneButton, 0);
  objc_storeStrong((id *)&self->_detailsButton, 0);
  objc_storeStrong((id *)&self->_messageButtonContainer, 0);
  objc_storeStrong((id *)&self->_phoneButtonContainer, 0);
  objc_storeStrong((id *)&self->_detailsButtonContainer, 0);
  objc_storeStrong((id *)&self->_loadingMapsTimer, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_headerIndexPath, 0);
  objc_storeStrong((id *)&self->_contactAvatarManager, 0);
  objc_storeStrong((id *)&self->_headerPresenter, 0);
  objc_storeStrong((id *)&self->_titleIconImageView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_footerContainer, 0);

  objc_storeStrong((id *)&self->_footer, 0);
}

@end