@interface MailActionsViewController
- (BOOL)_cardActionIsUnflag:(id)a3;
- (BOOL)_insertActions:(id)a3 after:(id)a4;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)useActionSheetStyleCard;
- (BOOL)useVerticalSingleInsteadOfHorizontal;
- (MFCardAction)flagCardAction;
- (MFCatchUpFeedbackCardAction)catchUpFeedbackCardAction;
- (MFCatchUpFeedbackCardHeaderAction)catchUpFeedbackHeaderCardAction;
- (MFRecategorizationHeaderCardAction)messageFeedbackHeaderAction;
- (MFRecategorizationHeaderCardAction)senderRecategorizationHeaderAction;
- (MailActionViewHeader)messageHeaderView;
- (MailActionsViewController)initWithDelegate:(id)a3 messageHeaderView:(id)a4 didDismissHandler:(id)a5;
- (MailActionsViewDataSource)dataSource;
- (MailActionsViewDelegate)delegate;
- (NSArray)flagColorCardAction;
- (NSArray)sectionData;
- (NSMutableDictionary)cardSectionViewLayout;
- (UICollectionView)collectionView;
- (UICollectionViewDiffableDataSource)collectionViewDataSource;
- (UIVisualEffectView)backgroundView;
- (_UINavigationBarTitleView)titleView;
- (double)_bottomInsetForCollectionView;
- (double)_maxLabelWidthInSection:(id)a3;
- (double)_topInsetForCollectionView;
- (double)approximateHeightForActionSheetStyleCard;
- (double)approximateHeightNeededForAccessibilityContentSizeCategory;
- (id)compositionalLayout;
- (id)didDismissHandler;
- (void)_configureCollectionViewIfNeeded;
- (void)_configureNavigationTitleViewIfNeeded;
- (void)_expandRecategorizationHeader:(id)a3;
- (void)_loadData;
- (void)_performDataSourceUpdate:(id)a3;
- (void)_reloadRecategorizationHeaderCellForAction:(id)a3;
- (void)_updateFlagCardActionCell:(BOOL)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dismissSelf;
- (void)loadView;
- (void)mailActionCatchUpFeedbackCell:(id)a3 didTapOnFeedbackType:(int64_t)a4;
- (void)mailActionFlagColorCell:(id)a3 didTapOnFlagColor:(id)a4;
- (void)reloadFlagItem;
- (void)scrollViewDidScroll:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setCardSectionViewLayout:(id)a3;
- (void)setCatchUpFeedbackCardAction:(id)a3;
- (void)setCatchUpFeedbackHeaderCardAction:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setCollectionViewDataSource:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidDismissHandler:(id)a3;
- (void)setFlagCardAction:(id)a3;
- (void)setFlagColorCardAction:(id)a3;
- (void)setMessageFeedbackHeaderAction:(id)a3;
- (void)setMessageHeaderView:(id)a3;
- (void)setSectionData:(id)a3;
- (void)setSenderRecategorizationHeaderAction:(id)a3;
- (void)setTitleView:(id)a3;
- (void)setUseVerticalSingleInsteadOfHorizontal:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewLayoutMarginsDidChange;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MailActionsViewController

- (MailActionsViewController)initWithDelegate:(id)a3 messageHeaderView:(id)a4 didDismissHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MailActionsViewController;
  v11 = [(MailActionsViewController *)&v16 initWithNibName:0 bundle:0];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v8);
    objc_storeStrong((id *)&v12->_messageHeaderView, a4);
    id v13 = objc_retainBlock(v10);
    id didDismissHandler = v12->_didDismissHandler;
    v12->_id didDismissHandler = v13;
  }
  return v12;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MailActionsViewController;
  [(MailActionsViewController *)&v6 viewDidDisappear:a3];
  uint64_t v4 = [(MailActionsViewController *)self didDismissHandler];
  v5 = (void *)v4;
  if (v4) {
    (*(void (**)(uint64_t))(v4 + 16))(v4);
  }
  [(MailActionsViewController *)self setDidDismissHandler:0];
}

- (void)loadView
{
  id v6 = objc_alloc_init((Class)UIView);
  v3 = +[UIColor clearColor];
  [v6 setBackgroundColor:v3];

  [(MailActionsViewController *)self setView:v6];
  uint64_t v4 = +[UIBlurEffect effectWithStyle:9];
  id v5 = [objc_alloc((Class)UIVisualEffectView) initWithEffect:v4];
  objc_storeStrong((id *)&self->_backgroundView, v5);
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 addSubview:v5];
  [v5 mf_pinToView:v6 usingLayoutMargins:0];
  [(MailActionsViewController *)self _configureNavigationTitleViewIfNeeded];
  [(MailActionsViewController *)self _configureCollectionViewIfNeeded];
  [(MailActionsViewController *)self _loadData];
}

- (void)reloadFlagItem
{
  id v15 = [(MailActionsViewController *)self flagCardAction];
  [v15 setAccessibilityIdentifer:MSAccessibilityIdentifierActionsViewControllerFlag];
  if (v15)
  {
    v3 = [(MailActionsViewController *)self flagColorCardAction];
    if ([v3 count])
    {
      uint64_t v4 = [(MailActionsViewController *)self collectionViewDataSource];
      id v5 = [v3 firstObject];
      id v6 = [v4 indexPathForItemIdentifier:v5];

      v7 = [(MailActionsViewController *)self collectionView];
      id v8 = [v7 cellForItemAtIndexPath:v6];

      unsigned int v9 = [(MailActionsViewController *)self _cardActionIsUnflag:v15];
      if (v9)
      {
        id v10 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", +[MFFlagTriageInteraction defaultColor]);
      }
      else
      {
        id v10 = 0;
      }
      [v8 selectColor:v10];
      if (v9) {
    }
      }
    v11 = [(MailActionsViewController *)self collectionView];
    v12 = [(MailActionsViewController *)self collectionViewDataSource];
    id v13 = [v12 indexPathForItemIdentifier:v15];
    v14 = [v11 cellForItemAtIndexPath:v13];

    [v14 setCardAction:v15];
  }
}

- (void)_reloadRecategorizationHeaderCellForAction:(id)a3
{
  id v8 = a3;
  [v8 setAccessibilityIdentifer:MSAccessibilityIdentifierActionsViewControllerRecategorization];
  if (v8)
  {
    uint64_t v4 = [(MailActionsViewController *)self collectionView];
    id v5 = [(MailActionsViewController *)self collectionViewDataSource];
    id v6 = [v5 indexPathForItemIdentifier:v8];
    v7 = [v4 cellForItemAtIndexPath:v6];

    [v7 setCardAction:v8];
  }
}

- (BOOL)_cardActionIsUnflag:(id)a3
{
  v3 = [a3 imageName];
  unsigned __int8 v4 = [v3 isEqualToString:MFImageGlyphUnflag];

  return v4;
}

- (double)_topInsetForCollectionView
{
  return 16.0;
}

- (double)_bottomInsetForCollectionView
{
  v3 = [(MailActionsViewController *)self view];
  [v3 layoutMargins];
  double v5 = v4;
  id v6 = [(MailActionsViewController *)self view];
  [v6 safeAreaInsets];
  double v8 = v5 + v7;

  return v8;
}

- (BOOL)useActionSheetStyleCard
{
  v2 = [(MailActionsViewController *)self sectionData];
  BOOL v3 = [v2 count] == (id)1;

  return v3;
}

- (double)approximateHeightForActionSheetStyleCard
{
  unsigned int v3 = [(MailActionsViewController *)self useActionSheetStyleCard];
  double result = 0.0;
  if (v3)
  {
    double v5 = [(MailActionsViewController *)self messageHeaderView];
    [v5 frame];
    double Height = CGRectGetHeight(v22);

    [(MailActionsViewController *)self _topInsetForCollectionView];
    double v8 = v7;
    unsigned int v9 = [(MailActionsViewController *)self traitCollection];
    id v10 = [v9 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v10);

    if (IsAccessibilityCategory)
    {
      +[MailActionCell approximateHeightForAccessibilityContentSizeCategory];
      double v13 = v12;
    }
    else
    {
      v14 = objc_opt_new();
      [v14 topToFirstBaselineSpacingInMailActionCardVerticalGroup];
      double v16 = v15;
      [v14 bottomToLastBaselineInMailActionCardVerticalGroup];
      double v13 = v16 + v17;
    }
    v18 = [(MailActionsViewController *)self sectionData];
    v19 = [v18 firstObject];
    v20 = [v19 actions];
    double v21 = Height + 0.0 + v8 + (double)(unint64_t)[v20 count] * v13;

    return v21 + 8.0;
  }
  return result;
}

- (double)approximateHeightNeededForAccessibilityContentSizeCategory
{
  unsigned int v3 = [(MailActionsViewController *)self traitCollection];
  double v4 = [v3 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  double result = 0.0;
  if (IsAccessibilityCategory)
  {
    double v7 = [(MailActionsViewController *)self sectionData];
    double v8 = [v7 firstObject];
    unsigned int v9 = [v8 actions];
    id v10 = [v9 count];

    +[MailActionCell approximateHeightForAccessibilityContentSizeCategory];
    double v12 = v11;
    [(MailActionsViewController *)self _topInsetForCollectionView];
    double v14 = v13;
    double v15 = [(MailActionsViewController *)self messageHeaderView];
    [v15 frame];
    double Height = CGRectGetHeight(v17);

    return (double)((unint64_t)v10 - 1) * 8.0 + (double)(unint64_t)v10 * v12 + v14 + Height;
  }
  return result;
}

- (void)_loadData
{
  id v4 = [(MailActionsViewController *)self dataSource];
  if (v4)
  {
    unsigned int v3 = [(MailActionsViewController *)self sectionData];
    [(MailActionsViewController *)self _performDataSourceUpdate:v3];
  }
}

- (NSArray)sectionData
{
  unsigned int v3 = [(MailActionsViewController *)self dataSource];
  sectionData = self->_sectionData;
  if (sectionData) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (!v5)
  {
    id v6 = [v3 sectionDataForMailActionsViewController:self];
    double v7 = self->_sectionData;
    self->_sectionData = v6;

    sectionData = self->_sectionData;
  }
  double v8 = sectionData;

  return v8;
}

- (void)_configureCollectionViewIfNeeded
{
  unsigned int v3 = [(MailActionsViewController *)self collectionView];

  if (!v3)
  {
    id v4 = [(MailActionsViewController *)self view];
    id v5 = objc_alloc((Class)UICollectionView);
    [v4 bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v14 = [(MailActionsViewController *)self compositionalLayout];
    id v15 = [v5 initWithFrame:v14 collectionViewLayout:v7, v9, v11, v13];

    [v15 setDelegate:self];
    [v15 setDelaysContentTouches:0];
    [(MailActionsViewController *)self setContentScrollView:v15 forEdge:15];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v15 setBackgroundColor:0];
    [v15 setAlwaysBounceVertical:1];
    [(MailActionsViewController *)self _topInsetForCollectionView];
    double v17 = v16;
    [(MailActionsViewController *)self _bottomInsetForCollectionView];
    [v15 setContentInset:v17, 0.0, v18, 0.0];
    [v15 setShowsVerticalScrollIndicator:0];
    [v15 _setVisibleRectEdgeInsets:0.0, 0.0, -400.0, 0.0];
    uint64_t v19 = objc_opt_class();
    v20 = +[MailActionCell reusableIdentifier];
    [v15 registerClass:v19 forCellWithReuseIdentifier:v20];

    uint64_t v21 = objc_opt_class();
    CGRect v22 = +[MailActionHorizontalGroupedCell reusableIdentifier];
    [v15 registerClass:v21 forCellWithReuseIdentifier:v22];

    uint64_t v23 = objc_opt_class();
    v24 = +[MailActionVerticalGroupedCell reusableIdentifier];
    [v15 registerClass:v23 forCellWithReuseIdentifier:v24];

    uint64_t v25 = objc_opt_class();
    v26 = +[MailActionFlagColorCell reusableIdentifier];
    [v15 registerClass:v25 forCellWithReuseIdentifier:v26];

    uint64_t v27 = objc_opt_class();
    v28 = +[MailActionCatchUpFeedbackCell reusableIdentifier];
    [v15 registerClass:v27 forCellWithReuseIdentifier:v28];

    if (EMBlackPearlIsFeatureEnabled())
    {
      uint64_t v29 = objc_opt_class();
      v30 = +[MailActionRecategorizationHeaderCell reusableIdentifier];
      [v15 registerClass:v29 forCellWithReuseIdentifier:v30];
    }
    [v15 setAccessibilityIdentifier:MSAccessibilityIdentifierActionsViewController];
    [(MailActionsViewController *)self setCollectionView:v15];
    [v4 addSubview:v15];
    [v15 mf_pinToView:v4 usingLayoutMargins:0];
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v34 = _NSConcreteStackBlock;
    uint64_t v35 = 3221225472;
    v36 = sub_1000CC1C8;
    v37 = &unk_1006071C0;
    objc_copyWeak(&v38, &location);
    v31 = objc_retainBlock(&v34);
    id v32 = objc_alloc((Class)UICollectionViewDiffableDataSource);
    id v33 = [v32 initWithCollectionView:v15 cellProvider:v31, v34, v35, v36, v37];
    [(MailActionsViewController *)self setCollectionViewDataSource:v33];

    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }
}

- (id)compositionalLayout
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  double v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  double v8 = sub_1000CC6BC;
  double v9 = &unk_100607280;
  objc_copyWeak(&v10, &location);
  v2 = objc_retainBlock(&v6);
  id v3 = objc_alloc((Class)UICollectionViewCompositionalLayout);
  id v4 = [v3 initWithSectionProvider:v2, v6, v7, v8, v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v4;
}

- (double)_maxLabelWidthInSection:(id)a3
{
  id v4 = a3;
  id v5 = +[MailActionCell preferredFontForHorizontalTitle];
  double v6 = [(MailActionsViewController *)self collectionViewDataSource];
  uint64_t v7 = [v6 snapshot];
  double v8 = [v7 itemIdentifiersInSectionWithIdentifier:v4];

  NSAttributedStringKey v24 = NSFontAttributeName;
  uint64_t v25 = v5;
  double v9 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v20;
    double v13 = 0.0;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v10);
        }
        id v15 = [v19 shortTitle];
        [v15 sizeWithAttributes:v9];
        double v17 = v16;

        double v13 = fmax(v17, v13);
      }
      id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }
  else
  {
    double v13 = 0.0;
  }

  return ceil(v13);
}

- (void)_performDataSourceUpdate:(id)a3
{
  double v6 = self;
  id v3 = a3;
  id v7 = v3;
  id v4 = +[EFScheduler mainThreadScheduler];
  [v4 performBlock:&v5];
}

- (void)_expandRecategorizationHeader:(id)a3
{
  id v5 = a3;
  id v4 = [v5 children];
  [v5 setIsExpanded:[self _insertActions:after:v4, v5]];

  [(MailActionsViewController *)self _reloadRecategorizationHeaderCellForAction:v5];
}

- (BOOL)_insertActions:(id)a3 after:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  double v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  id v15 = self;
  double v16 = &v17;
  id v10 = +[EFScheduler mainThreadScheduler];
  [v10 performBlock:&v12];

  LOBYTE(v10) = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v17, 8);

  return (char)v10;
}

- (void)viewLayoutMarginsDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)MailActionsViewController;
  [(MailActionsViewController *)&v5 viewLayoutMarginsDidChange];
  id v3 = [(MailActionsViewController *)self collectionView];
  id v4 = [v3 collectionViewLayout];
  [v4 invalidateLayout];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MailActionsViewController;
  [(MailActionsViewController *)&v12 traitCollectionDidChange:v4];
  [(MailActionsViewController *)self _loadData];
  objc_super v5 = [(MailActionsViewController *)self collectionView];
  id v6 = [v5 collectionViewLayout];
  [v6 invalidateLayout];

  id v7 = [(MailActionsViewController *)self messageHeaderView];
  id v8 = [v7 displayMetrics];
  +[MailActionViewHeader defaultHeightWithDisplayMetrics:v8];
  double v10 = v9;
  id v11 = [(MailActionsViewController *)self titleView];
  [v11 setHeight:v10];
}

- (void)viewSafeAreaInsetsDidChange
{
  v9.receiver = self;
  v9.super_class = (Class)MailActionsViewController;
  [(MailActionsViewController *)&v9 viewSafeAreaInsetsDidChange];
  id v3 = [(MailActionsViewController *)self view];
  id v4 = [(MailActionsViewController *)self collectionView];

  if (v4)
  {
    objc_super v5 = [(MailActionsViewController *)self collectionView];
    [v3 layoutMargins];
    double v7 = v6;
    [v3 safeAreaInsets];
    [v5 setContentInset:16.0, 0.0, v7 + v8, 0.0];
  }
  [v3 setNeedsLayout];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v9.receiver = self;
  v9.super_class = (Class)MailActionsViewController;
  -[MailActionsViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000CE5A0;
  v8[3] = &unk_100606048;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  double v6 = [(MailActionsViewController *)self collectionViewDataSource];
  id v7 = [v6 itemIdentifierForIndexPath:v5];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000CE85C;
  v13[3] = &unk_100604618;
  v13[4] = self;
  id v8 = v7;
  id v14 = v8;
  objc_super v9 = objc_retainBlock(v13);
  if ([v8 shouldDeferDismissHandler])
  {
    double v10 = [(MailActionsViewController *)self didDismissHandler];
    [v8 setDismissHandler:v10];

    [(MailActionsViewController *)self setDidDismissHandler:0];
  }
  if ([v8 shouldDismissCardBeforeExecuteHandler])
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000CEAE0;
    v11[3] = &unk_100604578;
    objc_super v12 = v9;
    [(MailActionsViewController *)self dismissViewControllerAnimated:1 completion:v11];
  }
  else
  {
    ((void (*)(void *))v9[2])(v9);
  }
}

- (void)_updateFlagCardActionCell:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(MailActionsViewController *)self flagCardAction];
  double v6 = &MFImageGlyphFlag;
  if (!v3) {
    double v6 = &MFImageGlyphUnflag;
  }
  id v12 = v5;
  [v5 setImageName:*v6];
  id v7 = [(MailActionsViewController *)self dataSource];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    objc_super v9 = [(MailActionsViewController *)self dataSource];
    uint64_t v10 = (uint64_t)[v9 messageCountForMailActionsViewController:self];
  }
  else
  {
    uint64_t v10 = 1;
  }
  id v11 = +[MFFlagTriageInteraction titleForFlagAction:v3 messageCount:v10];
  [v12 setTitle:v11];

  [(MailActionsViewController *)self reloadFlagItem];
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(MailActionsViewController *)self collectionViewDataSource];
  id v7 = [(id)v6 itemIdentifierForIndexPath:v5];

  objc_opt_class();
  LOBYTE(v6) = objc_opt_isKindOfClass();
  objc_opt_class();
  LOBYTE(v6) = v6 | objc_opt_isKindOfClass();

  return (v6 & 1) == 0;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(MailActionsViewController *)self collectionViewDataSource];
  id v7 = [v6 itemIdentifierForIndexPath:v5];

  objc_opt_class();
  LODWORD(v6) = objc_opt_isKindOfClass();
  objc_opt_class();
  BOOL v8 = ((v6 | objc_opt_isKindOfClass()) & 1) == 0
    && ([v7 handlerEnabled] & 1) != 0;

  return v8;
}

- (void)_configureNavigationTitleViewIfNeeded
{
  BOOL v3 = [(MailActionsViewController *)self titleView];

  if (!v3)
  {
    id v29 = [(MailActionsViewController *)self messageHeaderView];
    [v29 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v4 = [objc_alloc((Class)_UINavigationBarTitleView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v4 setPreservesSuperviewLayoutMargins:1];
    [v4 setHideStandardTitle:1];
    [v29 frame];
    [v4 setHeight:CGRectGetHeight(v31)];
    id v5 = +[UIColor clearColor];
    [v4 setBackgroundColor:v5];

    [v4 addSubview:v29];
    uint64_t v6 = [(MailActionsViewController *)self navigationItem];
    [v6 setTitleView:v4];

    [(MailActionsViewController *)self setTitleView:v4];
    id v7 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:24 target:self action:"dismissSelf"];
    BOOL v8 = [(MailActionsViewController *)self navigationItem];
    [v8 setRightBarButtonItem:v7];

    objc_super v9 = objc_opt_new();
    uint64_t v10 = [v29 leadingAnchor];
    id v11 = [v4 layoutMarginsGuide];
    id v12 = [v11 leadingAnchor];
    id v13 = [v10 constraintEqualToAnchor:v12];
    [v9 addObject:v13];

    id v14 = [v29 trailingAnchor];
    id v15 = [v4 layoutMarginsGuide];
    double v16 = [v15 trailingAnchor];
    uint64_t v17 = [v14 constraintEqualToAnchor:v16 constant:-24.0];
    [v9 addObject:v17];

    double v18 = [v29 heightAnchor];
    uint64_t v19 = [v4 heightAnchor];
    char v20 = [v18 constraintEqualToAnchor:v19];
    [v9 addObject:v20];

    long long v21 = [v29 centerYAnchor];
    long long v22 = [v4 centerYAnchor];
    uint64_t v23 = [v21 constraintEqualToAnchor:v22];
    [v9 addObject:v23];

    +[NSLayoutConstraint activateConstraints:v9];
    NSAttributedStringKey v24 = [(MailActionsViewController *)self navigationItem];
    [v24 _setManualScrollEdgeAppearanceEnabled:1];

    id v25 = objc_alloc_init((Class)UINavigationBarAppearance);
    [v25 configureWithDefaultBackground];
    v26 = +[UIColor separatorColor];
    [v25 setShadowColor:v26];

    uint64_t v27 = [(MailActionsViewController *)self navigationItem];
    [v27 setStandardAppearance:v25];

    v28 = [(MailActionsViewController *)self navigationItem];
    [v28 _setManualScrollEdgeAppearanceProgress:0.0];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v12 = a3;
  id v4 = [(MailActionsViewController *)self collectionView];

  id v5 = v12;
  if (v4 == v12)
  {
    uint64_t v6 = [(MailActionsViewController *)self messageHeaderView];
    [v6 frame];
    double Height = CGRectGetHeight(v14);

    [v12 contentOffset];
    if (v8 <= -Height)
    {
      id v11 = [(MailActionsViewController *)self navigationItem];
      [v11 _setManualScrollEdgeAppearanceProgress:0.0];
    }
    else
    {
      [v12 contentOffset];
      double v10 = v9;
      id v11 = [(MailActionsViewController *)self navigationItem];
      [v11 _setManualScrollEdgeAppearanceProgress:fmin((Height + v10) * 10.0, 100.0) / 100.0];
    }

    id v5 = v12;
  }
}

- (void)dismissSelf
{
}

- (void)mailActionFlagColorCell:(id)a3 didTapOnFlagColor:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  [v12 selectColor:v6];
  id v7 = [(MailActionsViewController *)self collectionView];
  double v8 = [v7 indexPathForCell:v12];

  double v9 = [(MailActionsViewController *)self collectionViewDataSource];
  double v10 = [v9 itemIdentifierForIndexPath:v8];

  id v11 = [v10 flagColor];

  if (v11 != v6)
  {
    [v10 setFlagColor:v6];
    [v10 executeHandler];
  }
  [(MailActionsViewController *)self _updateFlagCardActionCell:0];
}

- (void)mailActionCatchUpFeedbackCell:(id)a3 didTapOnFeedbackType:(int64_t)a4
{
  id v10 = a3;
  id v6 = [(MailActionsViewController *)self collectionView];
  id v7 = [v6 indexPathForCell:v10];

  double v8 = [(MailActionsViewController *)self collectionViewDataSource];
  double v9 = [v8 itemIdentifierForIndexPath:v7];

  [v9 setSelectedFeedbackType:a4];
  [v9 executeHandler];
}

- (MailActionsViewDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (id)didDismissHandler
{
  return self->_didDismissHandler;
}

- (void)setDidDismissHandler:(id)a3
{
}

- (MailActionsViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MailActionsViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (MailActionViewHeader)messageHeaderView
{
  return self->_messageHeaderView;
}

- (void)setMessageHeaderView:(id)a3
{
}

- (_UINavigationBarTitleView)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (UICollectionViewDiffableDataSource)collectionViewDataSource
{
  return self->_collectionViewDataSource;
}

- (void)setCollectionViewDataSource:(id)a3
{
}

- (NSMutableDictionary)cardSectionViewLayout
{
  return self->_cardSectionViewLayout;
}

- (void)setCardSectionViewLayout:(id)a3
{
}

- (NSArray)flagColorCardAction
{
  return self->_flagColorCardAction;
}

- (void)setFlagColorCardAction:(id)a3
{
}

- (MFCardAction)flagCardAction
{
  return self->_flagCardAction;
}

- (void)setFlagCardAction:(id)a3
{
}

- (MFCatchUpFeedbackCardHeaderAction)catchUpFeedbackHeaderCardAction
{
  return self->_catchUpFeedbackHeaderCardAction;
}

- (void)setCatchUpFeedbackHeaderCardAction:(id)a3
{
}

- (MFCatchUpFeedbackCardAction)catchUpFeedbackCardAction
{
  return self->_catchUpFeedbackCardAction;
}

- (void)setCatchUpFeedbackCardAction:(id)a3
{
}

- (MFRecategorizationHeaderCardAction)messageFeedbackHeaderAction
{
  return self->_messageFeedbackHeaderAction;
}

- (void)setMessageFeedbackHeaderAction:(id)a3
{
}

- (MFRecategorizationHeaderCardAction)senderRecategorizationHeaderAction
{
  return self->_senderRecategorizationHeaderAction;
}

- (void)setSenderRecategorizationHeaderAction:(id)a3
{
}

- (BOOL)useVerticalSingleInsteadOfHorizontal
{
  return self->_useVerticalSingleInsteadOfHorizontal;
}

- (void)setUseVerticalSingleInsteadOfHorizontal:(BOOL)a3
{
  self->_useVerticalSingleInsteadOfHorizontal = a3;
}

- (void)setSectionData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionData, 0);
  objc_storeStrong((id *)&self->_senderRecategorizationHeaderAction, 0);
  objc_storeStrong((id *)&self->_messageFeedbackHeaderAction, 0);
  objc_storeStrong((id *)&self->_catchUpFeedbackCardAction, 0);
  objc_storeStrong((id *)&self->_catchUpFeedbackHeaderCardAction, 0);
  objc_storeStrong((id *)&self->_flagCardAction, 0);
  objc_storeStrong((id *)&self->_flagColorCardAction, 0);
  objc_storeStrong((id *)&self->_cardSectionViewLayout, 0);
  objc_storeStrong((id *)&self->_collectionViewDataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_messageHeaderView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_didDismissHandler, 0);

  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end