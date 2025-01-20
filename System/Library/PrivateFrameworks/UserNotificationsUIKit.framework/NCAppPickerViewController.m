@interface NCAppPickerViewController
+ (id)appPickerViewControllerWithContentProvider:(id)a3;
- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldInlineButtontray;
- (BOOL)showMoreButtonWasPressed;
- (NSArray)selectedBundleIdentifiers;
- (NSSet)shownBundleIdentifiers;
- (double)_availableContentWidth;
- (id)_initWithContentProvider:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_cancelButtonPressed:(id)a3;
- (void)_refreshNextButton;
- (void)_reloadFooter;
- (void)_saveCellsSeen;
- (void)_updateHeightConstraintAndLayout;
- (void)_updateHeightConstraintAndLayoutIfNeeded:(BOOL)a3;
- (void)appPickViewFooterShowMoreButtonPressed:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)setShowMoreButtonWasPressed:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation NCAppPickerViewController

+ (id)appPickerViewControllerWithContentProvider:(id)a3
{
  id v3 = a3;
  id v4 = [[NCAppPickerViewController alloc] _initWithContentProvider:v3];

  return v4;
}

- (id)_initWithContentProvider:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NCAppPickerViewController;
  v6 = [(NCOnboardingViewController *)&v16 initWithTitle:&stru_1F2F516F8 detailText:&stru_1F2F516F8 contentLayout:3];
  v7 = v6;
  if (v6)
  {
    v6->_contentCollapsedCellCount = 0;
    v6->_contentCollapsable = 0;
    v6->_contentCollapsed = 1;
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    mutableShownBundleIdentifiers = v7->_mutableShownBundleIdentifiers;
    v7->_mutableShownBundleIdentifiers = v8;

    v7->_showMoreButtonWasPressed = 0;
    objc_storeStrong((id *)&v7->_contentProvider, a3);
    v10 = [(NCAppPickerViewController *)v7 traitCollection];
    v11 = [v10 preferredContentSizeCategory];

    uint64_t v12 = *MEMORY[0x1E4FB27B0];
    v17[0] = *MEMORY[0x1E4FB27B8];
    v17[1] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    if ([v13 containsObject:v11])
    {

      BOOL IsAX = 1;
    }
    else
    {
      BOOL IsAX = _NCSizeCategoryIsAX(v11);
    }
    v7->_largerTextSize = IsAX;
  }
  return v7;
}

- (void)viewDidLoad
{
  id v3 = [(NCAppPickerViewController *)self navigationController];
  [v3 setNavigationBarHidden:0 animated:1];

  v54.receiver = self;
  v54.super_class = (Class)NCAppPickerViewController;
  [(NCOnboardingViewController *)&v54 viewDidLoad];
  id v4 = [(NCAppPickerViewController *)self scrollView];
  [v4 setScrollEnabled:0];

  id v5 = objc_alloc_init(MEMORY[0x1E4FB15C0]);
  [v5 setMinimumLineSpacing:8.0];
  [(NCAppPickerViewController *)self _availableContentWidth];
  double v7 = v6;
  v8 = [(NCAppPickerContentProvider *)self->_contentProvider longestAppName];
  +[NCAppPickerViewCell preferredHeightForText:v8 cellWidth:v7];
  self->_cellHeight = v9;

  objc_msgSend(v5, "setItemSize:", v7, self->_cellHeight);
  +[NCAppPickerViewHeader preferredHeightForWidth:[(NCAppPickerContentProvider *)self->_contentProvider isAbleToSortByAvgNumberOfNotifications] supportsSortByAvgNumberOfNotifications:v7];
  self->_headerHeight = v10;
  objc_msgSend(v5, "setHeaderReferenceSize:", v7, v10);
  +[NCAppPickerViewFooter preferredHeightForWidth:self->_contentCollapsed showMoreButton:v7];
  self->_footerHeight = v11;
  objc_msgSend(v5, "setFooterReferenceSize:", v7, v11);
  id v12 = objc_alloc(MEMORY[0x1E4FB1568]);
  v13 = (UICollectionView *)objc_msgSend(v12, "initWithFrame:collectionViewLayout:", v5, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  collectionView = self->_collectionView;
  self->_collectionView = v13;

  [(UICollectionView *)self->_collectionView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UICollectionView *)self->_collectionView setDataSource:self];
  [(UICollectionView *)self->_collectionView setDelegate:self];
  [(UICollectionView *)self->_collectionView setShowsHorizontalScrollIndicator:0];
  [(UICollectionView *)self->_collectionView setAutomaticallyAdjustsScrollIndicatorInsets:0];
  [(UICollectionView *)self->_collectionView setContentInsetAdjustmentBehavior:2];
  v15 = self->_collectionView;
  uint64_t v16 = objc_opt_class();
  v17 = +[NCAppPickerViewCell reuseIdentifier];
  [(UICollectionView *)v15 registerClass:v16 forCellWithReuseIdentifier:v17];

  v18 = self->_collectionView;
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = *MEMORY[0x1E4FB2770];
  v21 = +[NCAppPickerViewHeader reuseIdentifier];
  [(UICollectionView *)v18 registerClass:v19 forSupplementaryViewOfKind:v20 withReuseIdentifier:v21];

  v22 = self->_collectionView;
  uint64_t v23 = objc_opt_class();
  uint64_t v24 = *MEMORY[0x1E4FB2760];
  v25 = +[NCAppPickerViewFooter reuseIdentifier];
  [(UICollectionView *)v22 registerClass:v23 forSupplementaryViewOfKind:v24 withReuseIdentifier:v25];

  v26 = [(NCAppPickerViewController *)self contentView];
  [v26 addSubview:self->_collectionView];

  v27 = [(OBBaseWelcomeController *)self navigationItem];
  [v27 setHidesBackButton:1];

  id v28 = objc_alloc(MEMORY[0x1E4FB14A8]);
  v29 = NCUserNotificationsUIKitFrameworkBundle();
  v30 = [v29 localizedStringForKey:@"NOTIFICATION_DIGEST_ONBOARDING_APP_PICKER_CANCEL" value:&stru_1F2F516F8 table:0];
  v31 = (void *)[v28 initWithTitle:v30 style:0 target:self action:sel__cancelButtonPressed_];

  v32 = [(OBBaseWelcomeController *)self navigationItem];
  [v32 setLeftBarButtonItem:v31];

  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v34 = [(UICollectionView *)self->_collectionView heightAnchor];
  v35 = [v34 constraintEqualToConstant:0.0];
  heightConstraint = self->_heightConstraint;
  self->_heightConstraint = v35;

  [v33 addObject:self->_heightConstraint];
  v37 = [(UICollectionView *)self->_collectionView leadingAnchor];
  v38 = [(NCAppPickerViewController *)self contentView];
  v39 = [v38 leadingAnchor];
  v40 = [v37 constraintEqualToAnchor:v39];
  [v33 addObject:v40];

  v41 = [(NCAppPickerViewController *)self contentView];
  v42 = [v41 trailingAnchor];
  v43 = [(UICollectionView *)self->_collectionView trailingAnchor];
  v44 = [v42 constraintEqualToAnchor:v43];
  [v33 addObject:v44];

  v45 = [(UICollectionView *)self->_collectionView topAnchor];
  v46 = [(NCAppPickerViewController *)self contentView];
  v47 = [v46 topAnchor];
  v48 = [v45 constraintEqualToAnchor:v47];
  topConstraint = self->_topConstraint;
  self->_topConstraint = v48;

  [v33 addObject:self->_topConstraint];
  v50 = [(NCAppPickerViewController *)self contentView];
  v51 = [v50 bottomAnchor];
  v52 = [(UICollectionView *)self->_collectionView bottomAnchor];
  v53 = [v51 constraintEqualToAnchor:v52];
  [v33 addObject:v53];

  [(NCAppPickerViewController *)self _updateHeightConstraintAndLayoutIfNeeded:0];
  [MEMORY[0x1E4F28DC8] activateConstraints:v33];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NCAppPickerViewController;
  [(NCAppPickerViewController *)&v4 viewWillAppear:a3];
  [(NCAppPickerViewController *)self performSelector:sel__updateHeightConstraintAndLayout withObject:0 afterDelay:0.0];
  [(NCAppPickerViewController *)self _refreshNextButton];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NCAppPickerViewController;
  [(OBBaseWelcomeController *)&v4 viewDidAppear:a3];
  self->_viewHasAppeared = 1;
  [(NCAppPickerViewController *)self _saveCellsSeen];
}

- (NSArray)selectedBundleIdentifiers
{
  contentProvider = self->_contentProvider;
  if (contentProvider)
  {
    id v3 = [(NCAppPickerContentProvider *)contentProvider selectedBundleIdentifiers];
  }
  else
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1C978]);
  }

  return (NSArray *)v3;
}

- (NSSet)shownBundleIdentifiers
{
  v2 = (void *)[(NSMutableSet *)self->_mutableShownBundleIdentifiers copy];

  return (NSSet *)v2;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  if (self->_contentCollapsable && self->_contentCollapsed) {
    return self->_contentCollapsedCellCount;
  }
  else {
    return [(NCAppPickerContentProvider *)self->_contentProvider totalCount];
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[NCAppPickerViewCell reuseIdentifier];
  double v9 = [v7 dequeueReusableCellWithReuseIdentifier:v8 forIndexPath:v6];

  uint64_t v10 = [v6 item];
  double v11 = [(NCAppPickerContentProvider *)self->_contentProvider nameForIndex:v10];
  +[NCAppPickerViewCell preferredImageDimension];
  v13 = -[NCAppPickerContentProvider imageForIndex:size:](self->_contentProvider, "imageForIndex:size:", v10, v12, v12);
  objc_msgSend(v9, "configureWithName:image:avgNumberOfNotificationsCount:maxAvgNumberOfNotificationsCount:selected:", v11, v13, -[NCAppPickerContentProvider avgNumberOfNotificationsForIndex:](self->_contentProvider, "avgNumberOfNotificationsForIndex:", v10), -[NCAppPickerContentProvider maxAvgNumberOfNotifications](self->_contentProvider, "maxAvgNumberOfNotifications"), -[NCAppPickerContentProvider isSelectedForIndex:](self->_contentProvider, "isSelectedForIndex:", v10));

  return v9;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = *MEMORY[0x1E4FB2770];
  if ([v9 isEqualToString:*MEMORY[0x1E4FB2770]])
  {
    double v12 = +[NCAppPickerViewHeader reuseIdentifier];
    v13 = [v8 dequeueReusableSupplementaryViewOfKind:v11 withReuseIdentifier:v12 forIndexPath:v10];

    objc_msgSend(v13, "configureSupportsSortByAvgNumberOfNotifications:", -[NCAppPickerContentProvider isAbleToSortByAvgNumberOfNotifications](self->_contentProvider, "isAbleToSortByAvgNumberOfNotifications"));
  }
  else
  {
    uint64_t v14 = *MEMORY[0x1E4FB2760];
    if ([v9 isEqualToString:*MEMORY[0x1E4FB2760]])
    {
      v15 = +[NCAppPickerViewFooter reuseIdentifier];
      v13 = [v8 dequeueReusableSupplementaryViewOfKind:v14 withReuseIdentifier:v15 forIndexPath:v10];

      [v13 configureWithShowMoreButton:self->_contentCollapsed delegate:self];
    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  v9[1] = *MEMORY[0x1E4F143B8];
  contentProvider = self->_contentProvider;
  id v6 = a4;
  -[NCAppPickerContentProvider toggleSelectedForIndex:](contentProvider, "toggleSelectedForIndex:", [v6 item]);
  [(NCAppPickerViewController *)self _refreshNextButton];
  collectionView = self->_collectionView;
  v9[0] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [(UICollectionView *)collectionView reconfigureItemsAtIndexPaths:v8];
}

- (void)appPickViewFooterShowMoreButtonPressed:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  for (unint64_t i = self->_contentCollapsedCellCount;
        i < [(NCAppPickerContentProvider *)self->_contentProvider totalCount];
        ++i)
  {
    id v6 = [MEMORY[0x1E4F28D58] indexPathForItem:i inSection:0];
    [v4 addObject:v6];
  }
  collectionView = self->_collectionView;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__NCAppPickerViewController_appPickViewFooterShowMoreButtonPressed___block_invoke;
  v10[3] = &unk_1E6A91A68;
  v10[4] = self;
  id v11 = v4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __68__NCAppPickerViewController_appPickViewFooterShowMoreButtonPressed___block_invoke_2;
  v9[3] = &unk_1E6A93220;
  v9[4] = self;
  id v8 = v4;
  [(UICollectionView *)collectionView performBatchUpdates:v10 completion:v9];
}

uint64_t __68__NCAppPickerViewController_appPickViewFooterShowMoreButtonPressed___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1225) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 1313) = 1;
  [*(id *)(*(void *)(a1 + 32) + 1256) insertItemsAtIndexPaths:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);

  return [v2 _reloadFooter];
}

uint64_t __68__NCAppPickerViewController_appPickViewFooterShowMoreButtonPressed___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _saveCellsSeen];
  }
  return result;
}

- (double)_availableContentWidth
{
  id v3 = [(NCAppPickerViewController *)self navigationController];
  id v4 = [v3 view];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(NCAppPickerViewController *)self contentView];
  }
  id v7 = v6;

  [v7 frame];
  double v9 = v8 + -32.0;

  return v9;
}

- (void)_reloadFooter
{
  [(NCAppPickerViewController *)self _availableContentWidth];
  double v4 = v3;
  id v8 = [(UICollectionView *)self->_collectionView collectionViewLayout];
  +[NCAppPickerViewFooter preferredHeightForWidth:self->_contentCollapsed showMoreButton:v4];
  objc_msgSend(v8, "setFooterReferenceSize:", v4, v5);
  id v6 = [(UICollectionView *)self->_collectionView visibleSupplementaryViewsOfKind:*MEMORY[0x1E4FB2760]];
  id v7 = [v6 firstObject];

  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v7 configureWithShowMoreButton:self->_contentCollapsed delegate:self];
    }
  }
}

- (void)_saveCellsSeen
{
  if (self->_viewHasAppeared)
  {
    [(UICollectionView *)self->_collectionView contentOffset];
    double v4 = v3 - self->_headerHeight;
    double v5 = fmax(v4, 0.0);
    double v6 = fmax(v4 + self->_collectionViewVisibleHeight, 0.0);
    double v7 = self->_cellHeight + 8.0;
    double v8 = v5 / v7;
    double v9 = floor(v5 / v7);
    double v10 = ceil(v8);
    if (v8 - v9 <= 0.25) {
      double v11 = v9;
    }
    else {
      double v11 = v10;
    }
    double v12 = v6 / v7;
    double v13 = floor(v6 / v7);
    BOOL v14 = v12 - v13 >= 0.75 || v12 <= 0.0;
    double v15 = floor(v12 + -1.0);
    if (!v14) {
      double v13 = v15;
    }
    uint64_t v16 = (uint64_t)v13;
    unint64_t v17 = [(NCAppPickerContentProvider *)self->_contentProvider totalCount] - 1;
    NSInteger v18 = [(UICollectionView *)self->_collectionView numberOfItemsInSection:0] - 1;
    if (v18 >= v16) {
      NSInteger v18 = v16;
    }
    if (v17 >= v18) {
      unint64_t v17 = v18;
    }
    double v19 = v12 - v8;
    if (v12 - v8 > 0.75)
    {
      for (unint64_t i = (unint64_t)v11; i <= v17; ++i)
      {
        v21 = -[NCAppPickerContentProvider bundleIdentifierForIndex:](self->_contentProvider, "bundleIdentifierForIndex:", i, v19);
        if (v21) {
          [(NSMutableSet *)self->_mutableShownBundleIdentifiers addObject:v21];
        }
      }
    }
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_refreshNextButton
{
  if ([(NCAppPickerContentProvider *)self->_contentProvider selectedCount])
  {
    double v3 = (void *)MEMORY[0x1E4F28EE0];
    double v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NCAppPickerContentProvider selectedCount](self->_contentProvider, "selectedCount"));
    id v11 = [v3 localizedStringFromNumber:v4 numberStyle:0];

    double v5 = NSString;
    double v6 = NCUserNotificationsUIKitFrameworkBundle();
    double v7 = [v6 localizedStringForKey:@"NOTIFICATION_DIGEST_ADD_APPS_FORMAT_WITH_LOCALIZED_NUMBER" value:&stru_1F2F516F8 table:0];
    double v8 = objc_msgSend(v5, "stringWithFormat:", v7, -[NCAppPickerContentProvider selectedCount](self->_contentProvider, "selectedCount"), v11);

    [(NCOnboardingViewController *)self setNextButtonText:v8];
    [(NCOnboardingViewController *)self setNextButtonEnabled:1];
  }
  else
  {
    double v9 = NCUserNotificationsUIKitFrameworkBundle();
    double v10 = [v9 localizedStringForKey:@"NOTIFICATION_DIGEST_ONBOARDING_ADD_APPS" value:&stru_1F2F516F8 table:0];
    [(NCOnboardingViewController *)self setNextButtonText:v10];

    [(NCOnboardingViewController *)self setNextButtonEnabled:0];
  }
}

- (void)_cancelButtonPressed:(id)a3
{
  id v3 = [(NCAppPickerViewController *)self navigationController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)_updateHeightConstraintAndLayout
{
}

- (void)_updateHeightConstraintAndLayoutIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(NCAppPickerViewController *)self contentView];
  [v5 frame];
  double v7 = v6;

  if ([(NCAppPickerViewController *)self _shouldInlineButtontray])
  {
    double v8 = [(NCAppPickerViewController *)self view];
    [v8 bounds];
    double v10 = v9;
    id v11 = [(NCAppPickerViewController *)self view];
    [v11 safeAreaInsets];
    double v13 = v10 - v12;
    BOOL v14 = [(NCAppPickerViewController *)self buttonTray];
    [v14 bounds];
    double v16 = v13 - v15;

    double v17 = 0.0;
  }
  else
  {
    NSInteger v18 = [(NCAppPickerViewController *)self buttonTray];
    [v18 frame];
    double v20 = v19;
    v21 = [(NCAppPickerViewController *)self buttonTray];
    [v21 frame];
    double v23 = v20 + v22;
    uint64_t v24 = [(NCAppPickerViewController *)self view];
    [v24 safeAreaInsets];
    double v16 = v23 - v25;

    double v8 = [(NCAppPickerViewController *)self buttonTray];
    [v8 frame];
    double v17 = v26;
  }
  double v27 = -v7;

  [(NSLayoutConstraint *)self->_heightConstraint constant];
  if (v16 != v28
    || ([(NSLayoutConstraint *)self->_topConstraint constant], v29 != v27)
    || ([(UICollectionView *)self->_collectionView contentInset], v30 != v17)
    || ([(UICollectionView *)self->_collectionView verticalScrollIndicatorInsets],
        v31 != v17))
  {
    -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:", 0.0, 16.0, v17, 16.0);
    -[UICollectionView setVerticalScrollIndicatorInsets:](self->_collectionView, "setVerticalScrollIndicatorInsets:", 0.0, 0.0, v17, 0.0);
    [(NSLayoutConstraint *)self->_heightConstraint setConstant:v16];
    [(NSLayoutConstraint *)self->_topConstraint setConstant:v27];
    self->_collectionViewVisibleHeight = v16 - v17;
    double v32 = v16 - v17 - self->_footerHeight - self->_headerHeight;
    double cellHeight = self->_cellHeight;
    double v34 = v32 / (cellHeight + 8.0);
    if (v34 < 4.0) {
      double v34 = 4.0;
    }
    if ((double)(unint64_t)v34 * 8.0 + (double)((unint64_t)v34 + 1) * cellHeight >= v32) {
      unint64_t v35 = (unint64_t)v34;
    }
    else {
      unint64_t v35 = (unint64_t)v34 + 1;
    }
    unint64_t v36 = [(NCAppPickerContentProvider *)self->_contentProvider totalCount];
    self->_contentCollapsable = v36 > v35;
    if (v36 <= v35) {
      unint64_t v37 = 0;
    }
    else {
      unint64_t v37 = v35;
    }
    self->_contentCollapsedCellCount = v37;
    if (v3)
    {
      v38 = [(NCAppPickerViewController *)self contentView];
      [v38 needsUpdateConstraints];

      v39 = [(NCAppPickerViewController *)self contentView];
      [v39 setNeedsLayout];

      v40 = [(NCAppPickerViewController *)self contentView];
      [v40 layoutIfNeeded];

      collectionView = self->_collectionView;
      [(UICollectionView *)collectionView reloadData];
    }
  }
}

- (BOOL)_shouldInlineButtontray
{
  return self->_largerTextSize;
}

- (BOOL)showMoreButtonWasPressed
{
  return self->_showMoreButtonWasPressed;
}

- (void)setShowMoreButtonWasPressed:(BOOL)a3
{
  self->_showMoreButtonWasPressed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_mutableShownBundleIdentifiers, 0);

  objc_storeStrong((id *)&self->_contentProvider, 0);
}

@end