@interface PKDiscoveryArticleViewController
- (BOOL)_hasCardInGalleryView;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hasSafeAreaInsetOverride;
- (BOOL)isAnimatingCard;
- (BOOL)isScrollable;
- (BOOL)prefersStatusBarHidden;
- (BOOL)shouldHideStatusBar;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (PKDiscoveryArticleViewController)initWithArticleLayout:(id)a3 referrerIdentifier:(id)a4 cardTemplateInformation:(id)a5;
- (PKDiscoveryArticleViewController)initWithItemIdentifier:(id)a3 referrerIdentifier:(id)a4;
- (PKDiscoveryArticleViewControllerDelegate)delegate;
- (PKDiscoveryCardView)cardView;
- (PKProximityReaderDiscoveryDelegate)proximityReaderDelegate;
- (UICollectionView)collectionView;
- (UIEdgeInsets)safeAreaOverrideInsets;
- (id)_dismissButtonColor;
- (id)_paymentSetupNavigationControllerForProvisioningController:(id)a3;
- (id)_shelfForIndexPath:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)modalPresentationStyle;
- (int64_t)modalTransitionStyle;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)preferredStatusBarUpdateAnimation;
- (void)_configureCallToActionShelfView:(id)a3 forCallToActionShelf:(id)a4 atIndexPath:(id)a5;
- (void)_configureInlineMediaShelfView:(id)a3 forInlineMediaShelf:(id)a4 atIndexPath:(id)a5;
- (void)_dismissButtonPressed;
- (void)_dismissForActionCompleted:(BOOL)a3 withRelevantPassUniqueIdentifier:(id)a4;
- (void)_handlePanGesture:(id)a3;
- (void)_leftScreenEdgePanSwipeGesture:(id)a3;
- (void)_loadMedia:(id)a3 forShelfViewAtIndexPath:(id)a4 withCellImageCacheKey:(id)a5 completion:(id)a6;
- (void)_performAccountUserInvitationFlowWithCTATapped:(id)a3 callToAction:(id)a4;
- (void)_performProvisioningCTATapped:(id)a3 callToAction:(id)a4;
- (void)_performStandaloneApplyWithCTATapped:(id)a3 callToAction:(id)a4;
- (void)_reportScolledToBottomIfNecessary;
- (void)_showActivityIndicator:(BOOL)a3 view:(id)a4;
- (void)_systemTextSizeChanged;
- (void)dealloc;
- (void)discoveryCardViewCTATapped:(id)a3 callToAction:(id)a4 itemIdentifier:(id)a5;
- (void)loadView;
- (void)paymentSetupDidFinish:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setAnimatingCard:(BOOL)a3;
- (void)setArticleLayout:(id)a3 animated:(BOOL)a4;
- (void)setCallToActionTappedOverride:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHasSafeAreaInsetOverride:(BOOL)a3;
- (void)setIsDownloading:(BOOL)a3;
- (void)setProximityReaderDelegate:(id)a3;
- (void)setSafeAreaOverrideInsets:(UIEdgeInsets)a3;
- (void)setShouldHideStatusBar:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKDiscoveryArticleViewController

- (PKDiscoveryArticleViewController)initWithItemIdentifier:(id)a3 referrerIdentifier:(id)a4
{
  id v5 = a4;
  v6 = [[PKDiscoveryCardViewTemplateInformation alloc] initWithCardSize:1 displayType:1];
  v7 = [(PKDiscoveryArticleViewController *)self initWithArticleLayout:0 referrerIdentifier:v5 cardTemplateInformation:v6];

  return v7;
}

- (PKDiscoveryArticleViewController)initWithArticleLayout:(id)a3 referrerIdentifier:(id)a4 cardTemplateInformation:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)PKDiscoveryArticleViewController;
  v12 = [(PKDiscoveryArticleViewController *)&v23 initWithNibName:0 bundle:0];
  if (v12)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v14 = (void *)*((void *)v12 + 137);
    *((void *)v12 + 137) = v13;

    *((_DWORD *)v12 + 276) = 0;
    *(_OWORD *)(v12 + 984) = xmmword_1A0444AD0;
    *(_OWORD *)(v12 + 1000) = xmmword_1A0444AD0;
    objc_storeStrong((id *)v12 + 131, a4);
    v15 = [v9 card];
    v16 = [v15 callToAction];
    *((void *)v12 + 132) = [v16 action];

    objc_storeStrong((id *)v12 + 122, a3);
    v12[1024] = v9 == 0;
    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v12 selector:sel__systemTextSizeChanged name:*MEMORY[0x1E4FB27A8] object:0];
    [v17 addObserver:v12 selector:sel__applicationWillTerminate name:*MEMORY[0x1E4FB2740] object:0];
    [v17 addObserver:v12 selector:sel__applicationWillResignActive name:*MEMORY[0x1E4FB2738] object:0];
    v12[1138] = 1;
    objc_storeStrong((id *)v12 + 141, a5);
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v19 = (void *)*((void *)v12 + 136);
    *((void *)v12 + 136) = v18;

    dispatch_queue_t v20 = dispatch_queue_create("com.apple.passbook.discoveryarticlevc.loadimage", 0);
    v21 = (void *)*((void *)v12 + 139);
    *((void *)v12 + 139) = v20;

    [v12 setTransitioningDelegate:v12];
  }

  return (PKDiscoveryArticleViewController *)v12;
}

- (void)_reportScolledToBottomIfNecessary
{
  if ([(PKDiscoveryArticleViewController *)self isScrollable])
  {
    if (!self->_reportedScrolledToBottom)
    {
      self->_reportedScrolledToBottom = 1;
      v3 = [(PKDiscoveryArticleViewController *)self proximityReaderDelegate];

      if (!v3)
      {
        id v5 = [MEMORY[0x1E4F84688] sharedInstance];
        v4 = [(PKDiscoveryArticleLayout *)self->_articleLayout itemIdentifier];
        [v5 discoveryItemWithIdentifier:v4 callToAction:self->_callToAction wasScrolledToTheBottom:self->_scrolledToBottom];
      }
    }
  }
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4 = [(PKDiscoveryArticleViewController *)self view];
  [v4 removeGestureRecognizer:self->_panGestureRecognizer];

  panGestureRecognizer = self->_panGestureRecognizer;
  self->_panGestureRecognizer = 0;

  [(PKDiscoveryCardView *)self->_cardView setDelegate:0];
  v6.receiver = self;
  v6.super_class = (Class)PKDiscoveryArticleViewController;
  [(PKDiscoveryArticleViewController *)&v6 dealloc];
}

- (void)loadView
{
  v47.receiver = self;
  v47.super_class = (Class)PKDiscoveryArticleViewController;
  [(PKDiscoveryArticleViewController *)&v47 loadView];
  v3 = [(PKDiscoveryArticleViewController *)self view];
  v43 = [v3 layer];
  objc_msgSend(v43, "setAnchorPoint:", 0.5, 0.0);
  v4 = objc_alloc_init(PKDiscoveryLayout);
  id v5 = objc_alloc(MEMORY[0x1E4FB1568]);
  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  id v10 = (UICollectionView *)objc_msgSend(v5, "initWithFrame:collectionViewLayout:", v4, *MEMORY[0x1E4F1DB28], v7, v8, v9);
  collectionView = self->_collectionView;
  self->_collectionView = v10;

  [(UICollectionView *)self->_collectionView setContentInsetAdjustmentBehavior:2];
  v12 = self->_collectionView;
  id v13 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [(UICollectionView *)v12 setBackgroundColor:v13];

  [(UICollectionView *)self->_collectionView setDelegate:self];
  [(UICollectionView *)self->_collectionView setDataSource:self];
  [(UICollectionView *)self->_collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"cell"];
  v42 = [(UICollectionView *)self->_collectionView layer];
  objc_msgSend(v42, "setAnchorPoint:", 0.5, 0.0);
  [(PKDiscoveryCardViewTemplateInformation *)self->_cardTemplateInformation setDisplayType:1];
  v14 = [[PKDiscoveryCardView alloc] initWithArticleLayout:self->_articleLayout dismissImage:0 cardTemplateInformation:self->_cardTemplateInformation];
  cardView = self->_cardView;
  self->_cardView = v14;

  [(PKDiscoveryCardView *)self->_cardView setCallToActionTappedOverride:self->_callToActionTappedOverride];
  [(PKDiscoveryCardView *)self->_cardView setDelegate:self];
  v16 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = v16;

  id v18 = self->_activityIndicator;
  v19 = [MEMORY[0x1E4FB1618] grayColor];
  [(UIActivityIndicatorView *)v18 setColor:v19];

  dispatch_queue_t v20 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v6, v7, v8, v9);
  downloadingLabel = self->_downloadingLabel;
  self->_downloadingLabel = v20;

  v22 = self->_downloadingLabel;
  objc_super v23 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28D8], (NSString *)*MEMORY[0x1E4FB27C8]);
  [(UILabel *)v22 setFont:v23];

  v24 = self->_downloadingLabel;
  v25 = [MEMORY[0x1E4FB1618] systemDarkGrayColor];
  [(UILabel *)v24 setTextColor:v25];

  v26 = self->_downloadingLabel;
  v27 = PKLocalizedDiscoveryString(&cfstr_DiscoveryArtic_1.isa);
  [(UILabel *)v26 setText:v27];

  double v28 = 1.0;
  if (!self->_isDownloading) {
    double v28 = 0.0;
  }
  [(UILabel *)self->_downloadingLabel setAlpha:v28];
  v29 = (void *)MEMORY[0x1E4FB1830];
  v30 = PKDefaultSystemFontOfSizeAndWeight(28.0, *MEMORY[0x1E4FB09D8]);
  v31 = [v29 configurationWithFont:v30];

  v32 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark.circle.fill" withConfiguration:v31];
  v44[0] = 0;
  v44[1] = 0;
  long long v45 = xmmword_1A0444AE0;
  uint64_t v46 = 2;
  v33 = [[PKContinuousButton alloc] initWithConfiguration:v44];
  dismissButton = self->_dismissButton;
  self->_dismissButton = v33;

  [(PKContinuousButton *)self->_dismissButton setImage:v32 forState:0];
  [(PKContinuousButton *)self->_dismissButton addTarget:self action:sel__dismissButtonPressed forControlEvents:64];
  v35 = self->_dismissButton;
  v36 = [(PKDiscoveryArticleViewController *)self _dismissButtonColor];
  [(PKContinuousButton *)v35 setTintColor:v36];

  [(PKContinuousButton *)self->_dismissButton setAccessibilityIdentifier:*MEMORY[0x1E4F85488]];
  v37 = (UIPanGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:self action:sel__handlePanGesture_];
  panGestureRecognizer = self->_panGestureRecognizer;
  self->_panGestureRecognizer = v37;

  [(UIPanGestureRecognizer *)self->_panGestureRecognizer setDelegate:self];
  [(UICollectionView *)self->_collectionView addGestureRecognizer:self->_panGestureRecognizer];
  v39 = (UIScreenEdgePanGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1BB0]) initWithTarget:self action:sel__leftScreenEdgePanSwipeGesture_];
  screenEdgePanGestureRecognizer = self->_screenEdgePanGestureRecognizer;
  self->_screenEdgePanGestureRecognizer = v39;

  [(UIScreenEdgePanGestureRecognizer *)self->_screenEdgePanGestureRecognizer setEdges:2];
  [(UIScreenEdgePanGestureRecognizer *)self->_screenEdgePanGestureRecognizer setDelegate:self];
  [(UICollectionView *)self->_collectionView addGestureRecognizer:self->_screenEdgePanGestureRecognizer];
  v41 = [MEMORY[0x1E4FB1618] whiteColor];
  [v3 setBackgroundColor:v41];

  [v3 addSubview:self->_collectionView];
  [(UICollectionView *)self->_collectionView addSubview:self->_cardView];
  [v3 addSubview:self->_dismissButton];
  [v3 addSubview:self->_activityIndicator];
  [v3 addSubview:self->_downloadingLabel];
  [v3 setAccessibilityIdentifier:*MEMORY[0x1E4F85248]];
  if (self->_isDownloading) {
    [(UIActivityIndicatorView *)self->_activityIndicator startAnimating];
  }
}

- (void)viewWillLayoutSubviews
{
  v46.receiver = self;
  v46.super_class = (Class)PKDiscoveryArticleViewController;
  [(PKDiscoveryArticleViewController *)&v46 viewWillLayoutSubviews];
  v3 = [(PKDiscoveryArticleViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v3 safeAreaInsets];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  if (![(PKDiscoveryArticleViewController *)self isAnimatingCard])
  {
    [v3 _shouldReverseLayoutDirection];
    [(PKContinuousButton *)self->_dismissButton sizeToFit];
    [(PKContinuousButton *)self->_dismissButton frame];
    v47.origin.x = v5;
    v47.origin.y = v7;
    v47.size.width = v9;
    v47.size.height = v11;
    CGRectInset(v47, 17.0, 20.0);
    PKSizeAlignedInRect();
    -[PKContinuousButton setFrame:](self->_dismissButton, "setFrame:");
    -[UICollectionView setFrame:](self->_collectionView, "setFrame:", v5, v7, v9, v11);
    if (self->_hasSafeAreaInsetOverride)
    {
      double top = self->_safeAreaOverrideInsets.top;
      double left = self->_safeAreaOverrideInsets.left;
      double bottom = self->_safeAreaOverrideInsets.bottom;
      double right = self->_safeAreaOverrideInsets.right;
    }
    else
    {
      double right = v19;
      double bottom = v17;
      double left = v15;
      double top = v13;
    }
    -[UICollectionView setScrollIndicatorInsets:](self->_collectionView, "setScrollIndicatorInsets:", top, left, bottom, right);
    [(UICollectionView *)self->_collectionView contentOffset];
    double v25 = fmin(v7, v24);
    -[PKDiscoveryCardView sizeThatFits:](self->_cardView, "sizeThatFits:", v9, v11);
    double v27 = v26;
    double v29 = v28;
    [(PKDiscoveryCardView *)self->_cardView setHasSafeAreaInsetOverride:self->_hasSafeAreaInsetOverride];
    -[PKDiscoveryCardView setSafeAreaOverrideInsets:](self->_cardView, "setSafeAreaOverrideInsets:", self->_safeAreaOverrideInsets.top, self->_safeAreaOverrideInsets.left, self->_safeAreaOverrideInsets.bottom, self->_safeAreaOverrideInsets.right);
    -[PKDiscoveryCardView setFrame:](self->_cardView, "setFrame:", v5, v25, v27, v29);
    -[UILabel sizeThatFits:](self->_downloadingLabel, "sizeThatFits:", v9, v11);
    PKSizeAlignedInRect();
    PKSizeAlignedInRect();
    double v31 = v30;
    double v33 = v32;
    double v44 = v35;
    double v45 = v34;
    PKSizeAlignedInRect();
    double v37 = v36;
    double v39 = v38;
    double v41 = v40;
    double v43 = v42;
    -[UIActivityIndicatorView setFrame:](self->_activityIndicator, "setFrame:", v31, v33, v45, v44);
    -[UILabel setFrame:](self->_downloadingLabel, "setFrame:", v37, v39, v41, v43);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKDiscoveryArticleViewController;
  [(PKDiscoveryArticleViewController *)&v7 viewDidAppear:a3];
  if (self->_articleLayout && !self->_isDownloading)
  {
    double v4 = [(PKDiscoveryArticleViewController *)self proximityReaderDelegate];

    if (!v4)
    {
      double v5 = [MEMORY[0x1E4F84688] sharedInstance];
      double v6 = [(PKDiscoveryArticleLayout *)self->_articleLayout itemIdentifier];
      objc_msgSend(v5, "discoveryItemWithIdentifier:callToAction:isScrollable:", v6, self->_callToAction, -[PKDiscoveryArticleViewController isScrollable](self, "isScrollable"));
    }
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKDiscoveryArticleViewController;
  [(PKDiscoveryArticleViewController *)&v4 viewDidDisappear:a3];
  [(PKDiscoveryArticleViewController *)self _reportScolledToBottomIfNecessary];
}

- (BOOL)isScrollable
{
  v2 = [(UICollectionView *)self->_collectionView collectionViewLayout];
  char v3 = [v2 isScrollable];

  return v3;
}

- (BOOL)prefersStatusBarHidden
{
  return self->_shouldHideStatusBar;
}

- (int64_t)preferredStatusBarUpdateAnimation
{
  return 2;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  [a3 bounds];
  double v6 = v5;
  +[PKDiscoveryCardView expandedHeight];
  double v8 = v7 + 8.0;
  double v9 = v6;
  result.height = v8;
  result.width = v9;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  double v6 = [(PKDiscoveryArticleViewController *)self view];
  double v7 = v6;
  if (self->_hasSafeAreaInsetOverride)
  {
    CGFloat bottom = self->_safeAreaOverrideInsets.bottom;
  }
  else
  {
    [v6 safeAreaInsets];
    CGFloat bottom = v9;
  }
  [v7 bounds];
  double v11 = v10;

  double v12 = v11;
  double v13 = bottom;
  result.height = v13;
  result.width = v12;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v6 = -[PKDiscoveryArticleViewController _shelfForIndexPath:](self, "_shelfForIndexPath:", a5, a4);
  double v7 = [(PKDiscoveryArticleLayout *)self->_articleLayout itemIdentifier];
  double v8 = +[PKDiscoveryShelfView viewForShelf:v6 discoveryCardViewDelegate:self itemIdentifier:v7];

  objc_msgSend(v8, "setContentInsets:", self->_contentInsets.top, self->_contentInsets.left, self->_contentInsets.bottom, self->_contentInsets.right);
  [(UICollectionView *)self->_collectionView bounds];
  objc_msgSend(v8, "sizeThatFits:", v9, 1.79769313e308);
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)setCallToActionTappedOverride:(id)a3
{
  id v6 = a3;
  objc_super v4 = _Block_copy(v6);
  id callToActionTappedOverride = self->_callToActionTappedOverride;
  self->_id callToActionTappedOverride = v4;

  [(PKDiscoveryCardView *)self->_cardView setCallToActionTappedOverride:v6];
}

- (void)setArticleLayout:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  objc_storeStrong((id *)&self->_articleLayout, a3);
  self->_isDownloading = v7 == 0;
  [(PKDiscoveryCardView *)self->_cardView removeFromSuperview];
  [(PKDiscoveryCardView *)self->_cardView setDelegate:0];
  [(PKDiscoveryCardViewTemplateInformation *)self->_cardTemplateInformation setDisplayType:1];
  double v8 = [[PKDiscoveryCardView alloc] initWithArticleLayout:self->_articleLayout dismissImage:0 cardTemplateInformation:self->_cardTemplateInformation];
  cardView = self->_cardView;
  self->_cardView = v8;

  [(PKDiscoveryCardView *)self->_cardView setDelegate:self];
  [(UICollectionView *)self->_collectionView addSubview:self->_cardView];
  double v10 = [(PKDiscoveryArticleViewController *)self view];
  [v10 setNeedsLayout];

  [(UICollectionView *)self->_collectionView reloadData];
  if (v4)
  {
    [(UICollectionView *)self->_collectionView setAlpha:0.0];
    v11[4] = self;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __62__PKDiscoveryArticleViewController_setArticleLayout_animated___block_invoke;
    v12[3] = &unk_1E59CA7D0;
    v12[4] = self;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __62__PKDiscoveryArticleViewController_setArticleLayout_animated___block_invoke_2;
    v11[3] = &unk_1E59CB6D8;
    objc_msgSend(MEMORY[0x1E4FB1EB0], "pkui_animateUsingOptions:animations:completion:", 0, v12, v11);
  }
  else
  {
    [(UIActivityIndicatorView *)self->_activityIndicator setHidden:1];
    [(UILabel *)self->_downloadingLabel setAlpha:0.0];
    [(UIActivityIndicatorView *)self->_activityIndicator stopAnimating];
  }
}

uint64_t __62__PKDiscoveryArticleViewController_setArticleLayout_animated___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1152) setAlpha:1.0];
  [*(id *)(*(void *)(a1 + 32) + 1032) setAlpha:0.0];
  v2 = *(void **)(*(void *)(a1 + 32) + 1040);

  return [v2 setAlpha:0.0];
}

uint64_t __62__PKDiscoveryArticleViewController_setArticleLayout_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1032) stopAnimating];
}

- (void)setIsDownloading:(BOOL)a3
{
  if (((!self->_isDownloading ^ a3) & 1) == 0)
  {
    BOOL v3 = a3;
    self->_isDownloading = a3;
    double v5 = self->_activityIndicator;
    if (v3) {
      [(UIActivityIndicatorView *)self->_activityIndicator startAnimating];
    }
    id v6 = (void *)MEMORY[0x1E4FB1EB0];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __53__PKDiscoveryArticleViewController_setIsDownloading___block_invoke;
    v11[3] = &unk_1E59CD7B0;
    BOOL v13 = v3;
    v11[4] = self;
    double v12 = v5;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __53__PKDiscoveryArticleViewController_setIsDownloading___block_invoke_2;
    v8[3] = &unk_1E59CE050;
    BOOL v10 = v3;
    double v9 = v12;
    id v7 = v12;
    objc_msgSend(v6, "pkui_animateUsingOptions:animations:completion:", 6, v11, v8);
  }
}

uint64_t __53__PKDiscoveryArticleViewController_setIsDownloading___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    double v2 = 1.0;
  }
  else {
    double v2 = 0.0;
  }
  [*(id *)(*(void *)(a1 + 32) + 1040) setAlpha:v2];
  BOOL v3 = *(void **)(a1 + 40);

  return [v3 setAlpha:v2];
}

uint64_t __53__PKDiscoveryArticleViewController_setIsDownloading___block_invoke_2(uint64_t result)
{
  if (!*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) stopAnimating];
  }
  return result;
}

- (void)discoveryCardViewCTATapped:(id)a3 callToAction:(id)a4 itemIdentifier:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 action];
  double v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v35 = v11;
    _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "Article view CTA (action=%ld) tapped", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v14 = [(PKDiscoveryArticleLayout *)self->_articleLayout item];
  [WeakRetained discoveryArticleViewController:self tappedCallToAction:v9 item:v14];

  double v15 = [(PKDiscoveryArticleViewController *)self proximityReaderDelegate];

  if (!v15)
  {
    double v16 = [MEMORY[0x1E4F84688] sharedInstance];
    objc_msgSend(v16, "tappedDiscoveryItemWithIdentifier:callToAction:cardSize:", v10, objc_msgSend(v9, "action"), -[PKDiscoveryCardViewTemplateInformation cardSize](self->_cardTemplateInformation, "cardSize"));
  }
  switch(v11)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 11:
      [(PKDiscoveryArticleViewController *)self _performProvisioningCTATapped:v8 callToAction:v9];
      goto LABEL_25;
    case 4:
      id v17 = [NSString alloc];
      double v18 = (void *)MEMORY[0x1E4F87F48];
      goto LABEL_23;
    case 5:
      double v19 = PKPeerPaymentGetAppleCashFamilySettingsSensitiveURLForAltDSID();
      dispatch_queue_t v20 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      [v20 openSensitiveURL:v19 withOptions:0];

      v21 = [(PKDiscoveryArticleViewController *)self proximityReaderDelegate];

      if (!v21)
      {
        v22 = [MEMORY[0x1E4F84688] sharedInstance];
        [v22 completedDiscoveryItemCTAWithCompletion:0];
      }
      goto LABEL_25;
    case 6:
      if (PKPeerPaymentIsSetup())
      {
        objc_super v23 = [(PKDiscoveryArticleViewController *)self view];
        double v24 = [v23 window];
        double v25 = [v24 rootViewController];

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && v25) {
          [v25 presentPeerPaymentPassAnimated:1 completion:0];
        }
      }
      else
      {
        id v17 = [NSString alloc];
        double v18 = (void *)MEMORY[0x1E4F88028];
LABEL_23:
        double v25 = (void *)[v17 initWithFormat:@"prefs:root=PASSBOOK&path=%@", *v18];
        double v32 = [MEMORY[0x1E4F1CB10] URLWithString:v25];
        double v33 = [MEMORY[0x1E4F223E0] defaultWorkspace];
        [v33 openSensitiveURL:v32 withOptions:0];
      }
LABEL_24:

LABEL_25:
      return;
    case 7:
      [(PKDiscoveryArticleViewController *)self _performAccountUserInvitationFlowWithCTATapped:v8 callToAction:v9];
      goto LABEL_25;
    case 8:
      double v26 = [MEMORY[0x1E4FB1438] sharedApplication];
      double v27 = [v26 delegate];
      double v28 = [v27 window];
      double v25 = [v28 rootViewController];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        double v29 = v25;
      }
      else {
        double v29 = 0;
      }
      id v30 = v29;
      double v31 = [v9 appStoreAppIdentifier];
      [v30 presentAppStorePageForItemWithIdentifier:v31];

      goto LABEL_24;
    case 9:
      [(PKDiscoveryArticleViewController *)self _performStandaloneApplyWithCTATapped:v8 callToAction:v9];
      goto LABEL_25;
    case 10:
      id v17 = [NSString alloc];
      double v18 = (void *)MEMORY[0x1E4F87F58];
      goto LABEL_23;
    default:
      goto LABEL_25;
  }
}

- (void)_performAccountUserInvitationFlowWithCTATapped:(id)a3 callToAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(PKDiscoveryArticleViewController *)self _showActivityIndicator:1 view:v6];
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __96__PKDiscoveryArticleViewController__performAccountUserInvitationFlowWithCTATapped_callToAction___block_invoke;
  v9[3] = &unk_1E59CB010;
  objc_copyWeak(&v11, &location);
  id v8 = v6;
  id v10 = v8;
  +[PKAccountInvitationController presentCreateAccountUserInvitationWithViewController:self account:0 accountUserCollection:0 familyMemberCollection:0 context:0 completion:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __96__PKDiscoveryArticleViewController__performAccountUserInvitationFlowWithCTATapped_callToAction___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __96__PKDiscoveryArticleViewController__performAccountUserInvitationFlowWithCTATapped_callToAction___block_invoke_2;
  v2[3] = &unk_1E59CB010;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);

  objc_destroyWeak(&v4);
}

void __96__PKDiscoveryArticleViewController__performAccountUserInvitationFlowWithCTATapped_callToAction___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _showActivityIndicator:0 view:*(void *)(a1 + 32)];
}

- (void)_performStandaloneApplyWithCTATapped:(id)a3 callToAction:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [v5 allowedFeatureIdentifiers];
  id v7 = [v6 anyObject];
  uint64_t v8 = PKFeatureIdentifierFromString();

  if (!v8) {
    goto LABEL_9;
  }
  id v9 = NSString;
  uint64_t v10 = *MEMORY[0x1E4F87FB0];
  uint64_t v11 = *MEMORY[0x1E4F87F50];
  double v12 = PKFeatureIdentifierToString();
  BOOL v13 = [v9 stringWithFormat:@"//%@/%@/%@", v10, v11, v12];

  double v14 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithString:v13];
  [v14 setScheme:*MEMORY[0x1E4F88088]];
  referrerIdentifierOverride = self->_referrerIdentifierOverride;
  if (referrerIdentifierOverride)
  {
    double v16 = referrerIdentifierOverride;
LABEL_5:
    id v17 = objc_alloc(MEMORY[0x1E4F290C8]);
    double v18 = (void *)[v17 initWithName:*MEMORY[0x1E4F87FC8] value:v16];
    v22[0] = v18;
    double v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    [v14 setQueryItems:v19];

    goto LABEL_6;
  }
  double v16 = [v5 referrerIdentifier];
  if (v16) {
    goto LABEL_5;
  }
LABEL_6:
  dispatch_queue_t v20 = [v14 URL];
  if (v20)
  {
    v21 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v21 openURL:v20 withOptions:0];
  }
LABEL_9:
}

- (void)_performProvisioningCTATapped:(id)a3 callToAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = objc_alloc(MEMORY[0x1E4F84BB8]);
  id v9 = [MEMORY[0x1E4F84D50] sharedService];
  uint64_t v10 = (void *)[v8 initWithWebService:v9];

  referrerIdentifierOverride = self->_referrerIdentifierOverride;
  if (referrerIdentifierOverride)
  {
    double v12 = referrerIdentifierOverride;
  }
  else
  {
    double v12 = [v7 referrerIdentifier];
  }
  BOOL v13 = v12;
  [v10 setReferrerIdentifier:v12];
  double v14 = [v7 paymentNetworks];
  [v10 setAllowedPaymentNetworks:v14];

  double v15 = [v7 transitNetworkIdentifiers];
  [v10 setRequiredTransitNetworkIdentifiers:v15];

  double v16 = [v7 allowedFeatureIdentifiers];
  [v10 setAllowedFeatureIdentifiers:v16];

  id v17 = [v7 productIdentifiers];
  [v10 setAllowedProductIdentifiers:v17];

  [(PKDiscoveryArticleViewController *)self _showActivityIndicator:1 view:v6];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__PKDiscoveryArticleViewController__performProvisioningCTATapped_callToAction___block_invoke;
  aBlock[3] = &unk_1E59CE810;
  objc_copyWeak(&v31, &location);
  id v18 = v10;
  id v28 = v18;
  id v19 = v7;
  id v29 = v19;
  id v20 = v6;
  id v30 = v20;
  v21 = _Block_copy(aBlock);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __79__PKDiscoveryArticleViewController__performProvisioningCTATapped_callToAction___block_invoke_5;
  v24[3] = &unk_1E59CD2D0;
  id v22 = v18;
  id v25 = v22;
  id v23 = v21;
  id v26 = v23;
  [v22 preflightWithCompletion:v24];

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
}

void __79__PKDiscoveryArticleViewController__performProvisioningCTATapped_callToAction___block_invoke(id *a1, char a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__PKDiscoveryArticleViewController__performProvisioningCTATapped_callToAction___block_invoke_2;
  v7[3] = &unk_1E59CE7E8;
  objc_copyWeak(&v12, a1 + 7);
  char v13 = a2;
  id v8 = a1[4];
  id v9 = a1[5];
  id v10 = a1[6];
  id v11 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);

  objc_destroyWeak(&v12);
}

void __79__PKDiscoveryArticleViewController__performProvisioningCTATapped_callToAction___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 72))
    {
      id v4 = [WeakRetained _paymentSetupNavigationControllerForProvisioningController:*(void *)(a1 + 32)];
      objc_msgSend(v4, "setPaymentSetupMode:", objc_msgSend(*(id *)(a1 + 40), "paymentSetupMode"));
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __79__PKDiscoveryArticleViewController__performProvisioningCTATapped_callToAction___block_invoke_3;
      v9[3] = &unk_1E59CC188;
      id v10 = v3;
      id v11 = v4;
      id v12 = *(id *)(a1 + 48);
      id v5 = v4;
      [v5 preflightWithCompletion:v9];
    }
    else
    {
      [WeakRetained _showActivityIndicator:0 view:*(void *)(a1 + 48)];
      id v6 = *(void **)(a1 + 56);
      if (v6)
      {
        id v7 = v6;
      }
      else
      {
        PKDisplayableErrorForCommonType();
        id v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v5 = v7;
      id v8 = +[PKPaymentSetupNavigationController viewControllerForPresentingPaymentError:v7];
      [v3 presentViewController:v8 animated:1 completion:0];
    }
  }
}

void __79__PKDiscoveryArticleViewController__performProvisioningCTATapped_callToAction___block_invoke_3(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __79__PKDiscoveryArticleViewController__performProvisioningCTATapped_callToAction___block_invoke_4;
  v4[3] = &unk_1E59CA870;
  id v5 = v2;
  id v6 = *(id *)(a1 + 48);
  [v5 presentViewController:v3 animated:1 completion:v4];
}

uint64_t __79__PKDiscoveryArticleViewController__performProvisioningCTATapped_callToAction___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showActivityIndicator:0 view:*(void *)(a1 + 40)];
}

void __79__PKDiscoveryArticleViewController__performProvisioningCTATapped_callToAction___block_invoke_5(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) paymentSetupProductModel];
  id v7 = [v6 allSetupProducts];

  if (a2 && [v7 count] == 1)
  {
    id v8 = *(void **)(a1 + 32);
    id v9 = [v7 firstObject];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __79__PKDiscoveryArticleViewController__performProvisioningCTATapped_callToAction___block_invoke_6;
    v10[3] = &unk_1E59CAA48;
    id v11 = *(id *)(a1 + 40);
    [v8 setupProductForProvisioning:v9 includePurchases:1 withCompletionHandler:v10];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __79__PKDiscoveryArticleViewController__performProvisioningCTATapped_callToAction___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_paymentSetupNavigationControllerForProvisioningController:(id)a3
{
  id v4 = a3;
  id v5 = [[PKPaymentSetupNavigationController alloc] initWithProvisioningController:v4 context:0];

  [(PKNavigationController *)v5 setCustomFormSheetPresentationStyleForiPad];
  [(PKPaymentSetupNavigationController *)v5 setSetupDelegate:self];

  return v5;
}

- (void)_showActivityIndicator:(BOOL)a3 view:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    [v5 setShowActivityIndicator:v4];
  }
}

- (void)paymentSetupDidFinish:(id)a3
{
  BOOL v4 = [a3 provisioningController];
  id v5 = [v4 provisionedPasses];
  id v6 = [v5 lastObject];
  id v7 = [v6 secureElementPass];
  id v9 = [v7 paymentPass];

  if (v9)
  {
    id v8 = [v9 uniqueID];
    [(PKDiscoveryArticleViewController *)self _dismissForActionCompleted:1 withRelevantPassUniqueIdentifier:v8];
  }
  else
  {
    [(PKDiscoveryArticleViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (int64_t)modalPresentationStyle
{
  return 2;
}

- (int64_t)modalTransitionStyle
{
  return 0;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v7 = (PKDiscoveryArticleViewController *)a3;
  id v8 = a4;
  if (v7 == self && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v9 = [[PKPresentationControllerForOpaqueViewControllerDestination alloc] initWithPresentedViewController:v7 presentingViewController:v8];
  }
  else {
    id v9 = 0;
  }

  return v9;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  BOOL v4 = [(PKDiscoveryArticleLayout *)self->_articleLayout shelves];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:v6];
  id v8 = [MEMORY[0x1E4FB1618] whiteColor];
  [v7 setBackgroundColor:v8];

  id v9 = [(PKDiscoveryArticleViewController *)self _shelfForIndexPath:v6];
  if (v9)
  {
    id v10 = [(PKDiscoveryArticleLayout *)self->_articleLayout itemIdentifier];
    id v11 = +[PKDiscoveryShelfView viewForShelf:v9 discoveryCardViewDelegate:self itemIdentifier:v10];

    objc_msgSend(v11, "setContentInsets:", self->_contentInsets.top, self->_contentInsets.left, self->_contentInsets.bottom, self->_contentInsets.right);
    uint64_t v12 = [v7 shelfView];
    char v13 = (void *)v12;
    if (v12)
    {
      if ((void *)v12 == v11)
      {
LABEL_6:
        uint64_t v15 = [v9 type];
        if (v15 == 4)
        {
          [(PKDiscoveryArticleViewController *)self _configureCallToActionShelfView:v11 forCallToActionShelf:v9 atIndexPath:v6];
        }
        else if (v15 == 2)
        {
          [(PKDiscoveryArticleViewController *)self _configureInlineMediaShelfView:v11 forInlineMediaShelf:v9 atIndexPath:v6];
        }

        goto LABEL_14;
      }
      double v14 = [v7 shelfView];
      [v14 removeFromSuperview];

      [v7 setShelfView:0];
    }
    [v7 setShelfView:v11];
    goto LABEL_6;
  }
  double v16 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    uint64_t v19 = 0;
    _os_log_impl(&dword_19F450000, v16, OS_LOG_TYPE_DEFAULT, "Could not create PKDiscoveryShelfView for shelf: %@", (uint8_t *)&v18, 0xCu);
  }

LABEL_14:

  return v7;
}

- (id)_shelfForIndexPath:(id)a3
{
  unint64_t v4 = [a3 row];
  int64_t v5 = [(PKDiscoveryArticleLayout *)self->_articleLayout shelves];
  if (v4 >= [v5 count])
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [v5 objectAtIndex:v4];
  }

  return v6;
}

- (void)_systemTextSizeChanged
{
}

- (void)scrollViewDidScroll:(id)a3
{
  id v17 = a3;
  unint64_t v4 = [(PKDiscoveryArticleViewController *)self view];
  [v4 setNeedsLayout];

  int64_t v5 = [(PKDiscoveryArticleViewController *)self proximityReaderDelegate];

  if (v5)
  {
    [v17 contentOffset];
    double v7 = v6;
    [v17 frame];
    double v9 = v7 + v8;
    id v10 = [(PKDiscoveryArticleViewController *)self proximityReaderDelegate];
    id v11 = [(PKDiscoveryArticleLayout *)self->_articleLayout itemIdentifier];
    [v10 discoveryItemWithIdentifier:v11 position:v9];
  }
  else if ([(PKDiscoveryArticleViewController *)self isScrollable])
  {
    if (!self->_scrolledToBottom)
    {
      [v17 contentOffset];
      double v13 = v12;
      [v17 contentSize];
      double v15 = v14;
      [v17 frame];
      self->_scrolledToBottom = v13 >= v15 - v16;
      if (v13 >= v15 - v16) {
        [(PKDiscoveryArticleViewController *)self _reportScolledToBottomIfNecessary];
      }
    }
  }
}

- (void)_configureInlineMediaShelfView:(id)a3 forInlineMediaShelf:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 media];
  uint64_t v12 = [v11 type];

  if (v12 == 1)
  {
    id v13 = v8;
    double v14 = [(NSMutableDictionary *)self->_cellImageCache objectForKey:v10];
    double v15 = [v14 objectForKey:@"mediaAsset"];
    if (v15)
    {
      [v13 setImage:v15 animated:0];
    }
    else
    {
      double v16 = [v9 media];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __99__PKDiscoveryArticleViewController__configureInlineMediaShelfView_forInlineMediaShelf_atIndexPath___block_invoke;
      v17[3] = &unk_1E59CA898;
      id v18 = v13;
      [(PKDiscoveryArticleViewController *)self _loadMedia:v16 forShelfViewAtIndexPath:v10 withCellImageCacheKey:@"mediaAsset" completion:v17];
    }
  }
}

uint64_t __99__PKDiscoveryArticleViewController__configureInlineMediaShelfView_forInlineMediaShelf_atIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setImage:a2 animated:1];
}

- (void)_configureCallToActionShelfView:(id)a3 forCallToActionShelf:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  cellImageCache = self->_cellImageCache;
  id v11 = a4;
  uint64_t v12 = [(NSMutableDictionary *)cellImageCache objectForKey:v9];
  id v13 = [v11 callToAction];

  double v14 = [v13 icon];

  if (!v14)
  {
    double v16 = [v12 objectForKey:@"wordmarkAsset"];
    if (v16) {
      goto LABEL_6;
    }
LABEL_8:
    id v18 = [v13 wordmarkAsset];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __101__PKDiscoveryArticleViewController__configureCallToActionShelfView_forCallToActionShelf_atIndexPath___block_invoke_2;
    v19[3] = &unk_1E59CA898;
    id v20 = v8;
    [(PKDiscoveryArticleViewController *)self _loadMedia:v18 forShelfViewAtIndexPath:v9 withCellImageCacheKey:@"wordmarkAsset" completion:v19];

    goto LABEL_9;
  }
  double v15 = [v12 objectForKey:@"mediaAsset"];
  double v16 = [v12 objectForKey:@"wordmarkAsset"];
  if (!v15)
  {
    id v17 = [v13 icon];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __101__PKDiscoveryArticleViewController__configureCallToActionShelfView_forCallToActionShelf_atIndexPath___block_invoke;
    v21[3] = &unk_1E59CA898;
    id v22 = v8;
    [(PKDiscoveryArticleViewController *)self _loadMedia:v17 forShelfViewAtIndexPath:v9 withCellImageCacheKey:@"mediaAsset" completion:v21];

    if (v16) {
      goto LABEL_6;
    }
    goto LABEL_8;
  }
  [v8 setImage:v15 animated:0];

  if (!v16) {
    goto LABEL_8;
  }
LABEL_6:
  [v8 setWordmarkAsset:v16 animated:0];
LABEL_9:
}

uint64_t __101__PKDiscoveryArticleViewController__configureCallToActionShelfView_forCallToActionShelf_atIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setImage:a2 animated:1];
}

uint64_t __101__PKDiscoveryArticleViewController__configureCallToActionShelfView_forCallToActionShelf_atIndexPath___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setWordmarkAsset:a2 animated:1];
}

- (void)_loadMedia:(id)a3 forShelfViewAtIndexPath:(id)a4 withCellImageCacheKey:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  loadImageQueue = self->_loadImageQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __104__PKDiscoveryArticleViewController__loadMedia_forShelfViewAtIndexPath_withCellImageCacheKey_completion___block_invoke;
  block[3] = &unk_1E59D8DD8;
  id v20 = v10;
  id v15 = v10;
  objc_copyWeak(&v25, &location);
  id v21 = v11;
  id v22 = v12;
  id v23 = self;
  id v24 = v13;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  dispatch_async(loadImageQueue, block);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void __104__PKDiscoveryArticleViewController__loadMedia_forShelfViewAtIndexPath_withCellImageCacheKey_completion___block_invoke(uint64_t a1)
{
  PKScreenScale();
  uint64_t v3 = v2;
  uint64_t v4 = [*(id *)(a1 + 32) type];
  if (v4 != 4)
  {
    if (v4 == 3)
    {
      int64_t v5 = [*(id *)(a1 + 32) passKitUIImageName];
      double v6 = [v5 pathExtension];
      int v7 = [v6 isEqualToString:@"pdf"];

      if (v7)
      {
        id v8 = [v5 stringByDeletingPathExtension];
        id v9 = PKPassKitUIBundle();
        id v10 = [v9 URLForResource:v8 withExtension:@"pdf"];

        [*(id *)(a1 + 32) width];
        CGFloat v12 = v11;
        [*(id *)(a1 + 32) height];
        CGFloat v14 = v13;
        double v15 = PKUIScreenScale();
        id v16 = PKUIImageFromPDF(v10, v12, v14, v15);
      }
      else
      {
        id v16 = PKUIImageNamed(v5);
      }
      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = __104__PKDiscoveryArticleViewController__loadMedia_forShelfViewAtIndexPath_withCellImageCacheKey_completion___block_invoke_2;
      v57[3] = &unk_1E59D54E8;
      id v20 = &v62;
      objc_copyWeak(&v62, (id *)(a1 + 72));
      v58 = v16;
      id v59 = *(id *)(a1 + 40);
      id v60 = *(id *)(a1 + 48);
      id v61 = *(id *)(a1 + 64);
      id v21 = v16;
      dispatch_async(MEMORY[0x1E4F14428], v57);

      id v22 = v58;
      goto LABEL_11;
    }
    int64_t v5 = [*(id *)(a1 + 32) imageDataFromCacheWithScale:*(double *)&v3];
    if (v5)
    {
      id v23 = (void *)[objc_alloc(MEMORY[0x1E4F84780]) initWithData:v5 scale:*(double *)&v3];
      [v23 preheatBitmapData];
      id v24 = objc_alloc(MEMORY[0x1E4FB1818]);
      id v25 = v23;
      id v26 = objc_msgSend(v24, "initWithCGImage:", objc_msgSend(v25, "imageRef"));
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __104__PKDiscoveryArticleViewController__loadMedia_forShelfViewAtIndexPath_withCellImageCacheKey_completion___block_invoke_4;
      v45[3] = &unk_1E59D54E8;
      double v27 = &v50;
      objc_copyWeak(&v50, (id *)(a1 + 72));
      id v46 = v26;
      id v47 = *(id *)(a1 + 40);
      id v48 = *(id *)(a1 + 48);
      id v49 = *(id *)(a1 + 64);
      id v28 = v26;
      dispatch_async(MEMORY[0x1E4F14428], v45);
    }
    else
    {
      os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 56) + 1104));
      id v29 = [*(id *)(*(void *)(a1 + 56) + 1096) objectForKey:*(void *)(a1 + 40)];
      id v30 = v29;
      if (v29)
      {
        uint64_t v31 = [v29 objectForKey:*(void *)(a1 + 48)];
        if (v31)
        {
          double v32 = (void *)v31;
          double v33 = _Block_copy(*(const void **)(a1 + 64));
          [v32 addObject:v33];
        }
        else
        {
          id v36 = objc_alloc(MEMORY[0x1E4F1CA48]);
          double v37 = _Block_copy(*(const void **)(a1 + 64));
          double v32 = objc_msgSend(v36, "initWithObjects:", v37, 0);

          [v30 setObject:v32 forKey:*(void *)(a1 + 48)];
        }
        id v25 = v30;
      }
      else
      {
        id v34 = objc_alloc(MEMORY[0x1E4F1CA48]);
        uint64_t v35 = _Block_copy(*(const void **)(a1 + 64));
        double v32 = objc_msgSend(v34, "initWithObjects:", v35, 0);

        id v25 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
        [v25 setObject:v32 forKey:*(void *)(a1 + 48)];
      }

      [*(id *)(*(void *)(a1 + 56) + 1096) setObject:v25 forKey:*(void *)(a1 + 40)];
      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 56) + 1104));
      if (v30) {
        goto LABEL_19;
      }
      double v38 = *(void **)(a1 + 32);
      PKScreenScale();
      double v40 = v39;
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __104__PKDiscoveryArticleViewController__loadMedia_forShelfViewAtIndexPath_withCellImageCacheKey_completion___block_invoke_5;
      v41[3] = &unk_1E59D8DB0;
      v41[4] = *(void *)(a1 + 56);
      v44[1] = v3;
      double v27 = v44;
      objc_copyWeak(v44, (id *)(a1 + 72));
      id v42 = *(id *)(a1 + 40);
      id v43 = *(id *)(a1 + 48);
      [v38 downloadImageDataWithScale:0 shouldWriteData:v41 completion:v40];
    }
    objc_destroyWeak(v27);
LABEL_19:

    goto LABEL_20;
  }
  int64_t v5 = [*(id *)(a1 + 32) localAssetURL];
  id v17 = (void *)MEMORY[0x1E4FB1818];
  id v18 = [v5 path];
  uint64_t v19 = [v17 imageWithContentsOfFile:v18];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __104__PKDiscoveryArticleViewController__loadMedia_forShelfViewAtIndexPath_withCellImageCacheKey_completion___block_invoke_3;
  block[3] = &unk_1E59D54E8;
  id v20 = &v56;
  objc_copyWeak(&v56, (id *)(a1 + 72));
  v52 = v19;
  id v53 = *(id *)(a1 + 40);
  id v54 = *(id *)(a1 + 48);
  id v55 = *(id *)(a1 + 64);
  id v21 = v19;
  dispatch_async(MEMORY[0x1E4F14428], block);

  id v22 = v52;
LABEL_11:

  objc_destroyWeak(v20);
LABEL_20:
}

void __104__PKDiscoveryArticleViewController__loadMedia_forShelfViewAtIndexPath_withCellImageCacheKey_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  int64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      uint64_t v3 = [WeakRetained[136] objectForKey:*(void *)(a1 + 40)];
      if (!v3) {
        uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
      }
      [v3 setObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 48)];
      [v5[136] setObject:v3 forKey:*(void *)(a1 + 40)];
    }
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  else
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  v4();
}

void __104__PKDiscoveryArticleViewController__loadMedia_forShelfViewAtIndexPath_withCellImageCacheKey_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  int64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      uint64_t v3 = [WeakRetained[136] objectForKey:*(void *)(a1 + 40)];
      if (!v3) {
        uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
      }
      [v3 setObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 48)];
      [v5[136] setObject:v3 forKey:*(void *)(a1 + 40)];
    }
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  else
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  v4();
}

void __104__PKDiscoveryArticleViewController__loadMedia_forShelfViewAtIndexPath_withCellImageCacheKey_completion___block_invoke_4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  int64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      uint64_t v3 = [WeakRetained[136] objectForKey:*(void *)(a1 + 40)];
      if (!v3) {
        uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
      }
      [v3 setObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 48)];
      [v5[136] setObject:v3 forKey:*(void *)(a1 + 40)];
    }
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  else
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  v4();
}

void __104__PKDiscoveryArticleViewController__loadMedia_forShelfViewAtIndexPath_withCellImageCacheKey_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 1112);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __104__PKDiscoveryArticleViewController__loadMedia_forShelfViewAtIndexPath_withCellImageCacheKey_completion___block_invoke_6;
  block[3] = &unk_1E59D8D88;
  id v7 = v3;
  v10[1] = *(id *)(a1 + 64);
  id v5 = v3;
  objc_copyWeak(v10, (id *)(a1 + 56));
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

  objc_destroyWeak(v10);
}

void __104__PKDiscoveryArticleViewController__loadMedia_forShelfViewAtIndexPath_withCellImageCacheKey_completion___block_invoke_6(uint64_t a1)
{
  double v2 = (void *)[objc_alloc(MEMORY[0x1E4F84780]) initWithData:*(void *)(a1 + 32) scale:*(double *)(a1 + 64)];
  [v2 preheatBitmapData];
  id v3 = objc_alloc(MEMORY[0x1E4FB1818]);
  id v4 = v2;
  id v5 = objc_msgSend(v3, "initWithCGImage:", objc_msgSend(v4, "imageRef"));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __104__PKDiscoveryArticleViewController__loadMedia_forShelfViewAtIndexPath_withCellImageCacheKey_completion___block_invoke_7;
  v7[3] = &unk_1E59CE888;
  objc_copyWeak(&v11, (id *)(a1 + 56));
  id v8 = v5;
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);

  objc_destroyWeak(&v11);
}

void __104__PKDiscoveryArticleViewController__loadMedia_forShelfViewAtIndexPath_withCellImageCacheKey_completion___block_invoke_7(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      id v4 = [WeakRetained[136] objectForKey:*(void *)(a1 + 40)];
      if (!v4) {
        id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
      }
      [v4 setObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 48)];
      [v3[136] setObject:v4 forKey:*(void *)(a1 + 40)];
    }
    os_unfair_lock_lock((os_unfair_lock_t)v3 + 276);
    id v5 = [v3[137] objectForKey:*(void *)(a1 + 40)];
    [v3[137] removeObjectForKey:*(void *)(a1 + 40)];
    os_unfair_lock_unlock((os_unfair_lock_t)v3 + 276);
    id v6 = [v5 objectForKey:*(void *)(a1 + 48)];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v10++) + 16))();
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return 1;
  }
  [(UICollectionView *)self->_collectionView contentOffset];
  return v6 == -20.0;
}

- (void)_handlePanGesture:(id)a3
{
  id v14 = a3;
  if ([v14 state] == 3)
  {
    [(UICollectionView *)self->_collectionView contentOffset];
    double v5 = v4;
    [(UICollectionView *)self->_collectionView safeAreaInsets];
    double v7 = -v6;
    uint64_t v8 = [(PKDiscoveryArticleViewController *)self view];
    [v14 translationInView:v8];
    double v10 = v9;

    long long v11 = [(PKDiscoveryArticleViewController *)self view];
    [v14 velocityInView:v11];
    double v13 = v12;

    if (v5 <= v7 && v10 > 0.0 && v13 > 0.0) {
      [(PKDiscoveryArticleViewController *)self _dismissForActionCompleted:0 withRelevantPassUniqueIdentifier:0];
    }
  }
}

- (void)_leftScreenEdgePanSwipeGesture:(id)a3
{
  if ([a3 state] == 3)
  {
    [(PKDiscoveryArticleViewController *)self _dismissForActionCompleted:0 withRelevantPassUniqueIdentifier:0];
  }
}

- (BOOL)_hasCardInGalleryView
{
  id v3 = [(PKDiscoveryArticleViewController *)self presentingViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    articleLayout = self->_articleLayout;
    id v5 = v3;
    double v6 = [(PKDiscoveryArticleLayout *)articleLayout itemIdentifier];
    char v7 = [v5 hasDiscoveryCardWithItemIdentifier:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)_dismissForActionCompleted:(BOOL)a3 withRelevantPassUniqueIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v12 = a4;
  double v6 = [(PKDiscoveryArticleViewController *)self presentingViewController];
  if ([v6 conformsToProtocol:&unk_1EF335A08])
  {
    [v6 dismissDiscoveryArticleViewController:self afterActionCompleted:v4 withRelevantPassUniqueIdenitifer:v12];
    char v7 = [(PKDiscoveryArticleViewController *)self proximityReaderDelegate];

    if (!v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F84688] sharedInstance];
      double v9 = [(PKDiscoveryArticleLayout *)self->_articleLayout itemIdentifier];
      double v10 = [(PKDiscoveryArticleLayout *)self->_articleLayout card];
      long long v11 = [v10 callToAction];
      objc_msgSend(v8, "dismissedDiscoveryItemWithIdentifier:callToAction:cardSize:", v9, objc_msgSend(v11, "action"), -[PKDiscoveryCardViewTemplateInformation cardSize](self->_cardTemplateInformation, "cardSize"));
    }
  }
  else
  {
    [v6 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_dismissButtonPressed
{
  id v3 = [(PKDiscoveryArticleViewController *)self cardView];
  [v3 loadAndUploadImageData];

  [(PKDiscoveryArticleViewController *)self _dismissForActionCompleted:0 withRelevantPassUniqueIdentifier:0];
}

- (id)_dismissButtonColor
{
  id v3 = [MEMORY[0x1E4FB1618] systemDarkGrayColor];
  BOOL v4 = [(PKDiscoveryArticleLayout *)self->_articleLayout card];
  uint64_t v5 = [v4 foregroundContentMode];

  if (v5 == 3)
  {
    uint64_t v6 = [MEMORY[0x1E4FB1618] systemGrayColor];
  }
  else
  {
    if (v5 != 1) {
      goto LABEL_6;
    }
    uint64_t v6 = [MEMORY[0x1E4FB1618] systemLightGrayColor];
  }
  char v7 = (void *)v6;

  id v3 = v7;
LABEL_6:

  return v3;
}

- (PKDiscoveryCardView)cardView
{
  return self->_cardView;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (BOOL)hasSafeAreaInsetOverride
{
  return self->_hasSafeAreaInsetOverride;
}

- (void)setHasSafeAreaInsetOverride:(BOOL)a3
{
  self->_hasSafeAreaInsetOverride = a3;
}

- (UIEdgeInsets)safeAreaOverrideInsets
{
  double top = self->_safeAreaOverrideInsets.top;
  double left = self->_safeAreaOverrideInsets.left;
  double bottom = self->_safeAreaOverrideInsets.bottom;
  double right = self->_safeAreaOverrideInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setSafeAreaOverrideInsets:(UIEdgeInsets)a3
{
  self->_safeAreaOverrideInsets = a3;
}

- (BOOL)isAnimatingCard
{
  return self->_animatingCard;
}

- (void)setAnimatingCard:(BOOL)a3
{
  self->_animatingCard = a3;
}

- (PKDiscoveryArticleViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKDiscoveryArticleViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKProximityReaderDiscoveryDelegate)proximityReaderDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proximityReaderDelegate);

  return (PKProximityReaderDiscoveryDelegate *)WeakRetained;
}

- (void)setProximityReaderDelegate:(id)a3
{
}

- (BOOL)shouldHideStatusBar
{
  return self->_shouldHideStatusBar;
}

- (void)setShouldHideStatusBar:(BOOL)a3
{
  self->_shouldHideStatusBar = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_proximityReaderDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_cardView, 0);
  objc_storeStrong((id *)&self->_cardTemplateInformation, 0);
  objc_storeStrong((id *)&self->_loadImageQueue, 0);
  objc_storeStrong((id *)&self->_imageDownloads, 0);
  objc_storeStrong((id *)&self->_cellImageCache, 0);
  objc_storeStrong((id *)&self->_screenEdgePanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong(&self->_callToActionTappedOverride, 0);
  objc_storeStrong((id *)&self->_referrerIdentifierOverride, 0);
  objc_storeStrong((id *)&self->_downloadingLabel, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);

  objc_storeStrong((id *)&self->_articleLayout, 0);
}

@end