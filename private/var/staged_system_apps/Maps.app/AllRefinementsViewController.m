@interface AllRefinementsViewController
- (AllRefinementsDataSource)dataSource;
- (AllRefinementsViewController)initWithViewModel:(id)a3 selectionSequenceNumber:(id)a4 resultRefinementsAnalyticsDelegate:(id)a5;
- (AllRefinementsViewControllerDelegate)allRefinementsDelegate;
- (AllRefinementsViewModel)copiedViewModel;
- (AllRefinementsViewModel)viewModel;
- (BOOL)_checkIfFiltersAreSelected;
- (ModalCardHeaderView)modalHeaderView;
- (NSNumber)selectionSequenceNumber;
- (ResultRefinementsAnalytics)analyticsDelegate;
- (UICollectionView)collectionView;
- (UICollectionViewLayout)collectionViewLayout;
- (double)heightForLayout:(unint64_t)a3;
- (void)_clearCurrentSelection;
- (void)_sendAnalyticsForEvent:(unint64_t)a3;
- (void)_setupTopLeadingButton:(id)a3 filters:(BOOL)a4;
- (void)addCollectionView;
- (void)addHeaderView;
- (void)didTapOnApply:(id)a3;
- (void)didTapOnCancel:(id)a3;
- (void)didTapOnClear:(id)a3;
- (void)dismiss;
- (void)refinementViewModelDidChange;
- (void)scrollViewDidScroll:(id)a3;
- (void)setAllRefinementsDelegate:(id)a3;
- (void)setAnalyticsDelegate:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setCollectionViewLayout:(id)a3;
- (void)setCopiedViewModel:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setModalHeaderView:(id)a3;
- (void)setSelectionSequenceNumber:(id)a3;
- (void)setViewModel:(id)a3;
- (void)updateHeaderHairlineAnimated:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation AllRefinementsViewController

- (AllRefinementsViewController)initWithViewModel:(id)a3 selectionSequenceNumber:(id)a4 resultRefinementsAnalyticsDelegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)AllRefinementsViewController;
  v12 = [(AllRefinementsViewController *)&v22 initWithNibName:0 bundle:0];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_viewModel, a3);
    v14 = (AllRefinementsViewModel *)[v9 copy];
    copiedViewModel = v13->_copiedViewModel;
    v13->_copiedViewModel = v14;

    objc_storeStrong((id *)&v13->_selectionSequenceNumber, a4);
    objc_storeWeak((id *)&v13->_analyticsDelegate, v11);
    v16 = [(ContaineeViewController *)v13 cardPresentationController];
    [v16 setPresentedModally:1];

    v17 = [(ContaineeViewController *)v13 cardPresentationController];
    [v17 setAllowsSwipeToDismiss:0];

    v18 = [(ContaineeViewController *)v13 cardPresentationController];
    [v18 setDefaultContaineeLayout:5];

    v19 = [(ContaineeViewController *)v13 cardPresentationController];
    [v19 setTakesAvailableHeight:1];

    v20 = [(ContaineeViewController *)v13 cardPresentationController];
    [v20 setHideGrabber:1];

    [(AllRefinementsViewController *)v13 setAccessibilityIdentifier:@"AllRefinementsView"];
  }

  return v13;
}

- (double)heightForLayout:(unint64_t)a3
{
  v5 = [(ContaineeViewController *)self cardPresentationController];
  unint64_t v6 = (unint64_t)[v5 containerStyle];
  if (v6 > 7 || ((1 << v6) & 0xE3) == 0)
  {

    objc_super v22 = [(ContaineeViewController *)self cardPresentationController];
    [v22 availableHeight];
    double v24 = v23;

    return v24;
  }
  else
  {

    v8 = [(AllRefinementsViewController *)self viewModel];
    unsigned int v9 = [v8 viewTakesFullHeight];

    if (v9)
    {
      -[ContaineeViewController heightForLayout:](&v29, "heightForLayout:", a3, v28.receiver, v28.super_class, self, AllRefinementsViewController);
      return v10 + 32.0;
    }
    id v11 = [(AllRefinementsViewController *)self collectionViewLayout];
    [v11 collectionViewContentSize];
    double v13 = v12;

    if (v13 <= 2.22044605e-16)
    {
      -[ContaineeViewController heightForLayout:](&v28, "heightForLayout:", 2, self, AllRefinementsViewController, v29.receiver, v29.super_class);
      return v10 + 32.0;
    }
    [(ContaineeViewController *)self headerHeight];
    double v15 = v13 + v14;
    v16 = [(ContaineeViewController *)self cardPresentationController];
    [v16 availableHeight];
    if (v15 < v17)
    {
      [(ContaineeViewController *)self headerHeight];
      double v20 = v13 + v25;
    }
    else
    {
      v18 = [(ContaineeViewController *)self cardPresentationController];
      [v18 availableHeight];
      double v20 = v19;
    }
    sub_10002197C();
    double v27 = v26;
    double result = v20 + 32.0;
    if (v27 > v20 + 32.0)
    {
      sub_10002197C();
    }
  }
  return result;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)AllRefinementsViewController;
  [(ContaineeViewController *)&v6 viewDidLoad];
  v3 = [(AllRefinementsViewController *)self view];
  [v3 setAccessibilityIdentifier:@"AllRefinementsView"];

  [(AllRefinementsViewController *)self addHeaderView];
  [(AllRefinementsViewController *)self addCollectionView];
  v4 = [(AllRefinementsViewController *)self collectionView];
  [v4 frame];
  self->_collectionViewWidth = v5;
}

- (void)viewDidLayoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)AllRefinementsViewController;
  [(ContaineeViewController *)&v19 viewDidLayoutSubviews];
  v3 = [(AllRefinementsViewController *)self collectionViewLayout];
  [v3 collectionViewContentSize];
  double v5 = v4;
  [(ContaineeViewController *)self headerHeight];
  double v7 = v5 + v6;

  if (v7 > 2.22044605e-16)
  {
    v8 = [(ContaineeViewController *)self cardPresentationController];
    -[AllRefinementsViewController heightForLayout:](self, "heightForLayout:", [v8 containeeLayout]);
    double v10 = v9;

    id v11 = [(AllRefinementsViewController *)self collectionView];
    [v11 setScrollEnabled:v7 > v10];
  }
  double collectionViewWidth = self->_collectionViewWidth;
  double v13 = [(AllRefinementsViewController *)self collectionView];
  [v13 frame];
  double v15 = v14;

  if (collectionViewWidth != v15)
  {
    v16 = [(AllRefinementsViewController *)self collectionView];
    [v16 frame];
    self->_double collectionViewWidth = v17;

    v18 = [(AllRefinementsViewController *)self collectionView];
    [v18 reloadData];
  }
}

- (void)addHeaderView
{
  v3 = [ModalCardHeaderView alloc];
  double v4 = +[ModalCardHeaderConfiguration defaultModalCardHeaderConfiguration];
  double v5 = [(ModalCardHeaderView *)v3 initWithConfiguration:v4];

  [(ModalCardHeaderView *)v5 setAccessibilityIdentifier:@"AllRefinementsHeader"];
  [(ModalCardHeaderView *)v5 setUseAdaptiveFont:1];
  [(ModalCardHeaderView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v6 = [(AllRefinementsViewController *)self viewModel];
  double v7 = [v6 displayName];
  [(ModalCardHeaderView *)v5 setTitle:v7];

  if (MapsFeature_IsEnabled_SearchAndDiscovery())
  {
    [(AllRefinementsViewController *)self _setupTopLeadingButton:v5 filters:[(AllRefinementsViewController *)self _checkIfFiltersAreSelected]];
  }
  else
  {
    v8 = [(ModalCardHeaderView *)v5 leadingButton];
    double v9 = sub_100AEBD5C();
    [v8 setTitle:v9 forState:0];

    double v10 = [(ModalCardHeaderView *)v5 leadingButton];
    [v10 addTarget:self action:"didTapOnCancel:" forControlEvents:64];
  }
  id v11 = [(ModalCardHeaderView *)v5 trailingButton];
  double v12 = sub_100AEBE94();
  [v11 setTitle:v12 forState:0];

  double v13 = [(ModalCardHeaderView *)v5 trailingButton];
  [v13 addTarget:self action:"didTapOnApply:" forControlEvents:64];

  double v14 = [(ContaineeViewController *)self headerView];
  [v14 addSubview:v5];

  v30 = [(ModalCardHeaderView *)v5 leadingAnchor];
  v31 = [(ContaineeViewController *)self headerView];
  objc_super v29 = [v31 leadingAnchor];
  objc_super v28 = [v30 constraintEqualToAnchor:v29];
  v32[0] = v28;
  double v26 = [(ModalCardHeaderView *)v5 trailingAnchor];
  double v27 = [(ContaineeViewController *)self headerView];
  double v25 = [v27 trailingAnchor];
  double v24 = [v26 constraintEqualToAnchor:v25];
  v32[1] = v24;
  double v23 = [(ModalCardHeaderView *)v5 topAnchor];
  double v15 = [(ContaineeViewController *)self headerView];
  v16 = [v15 topAnchor];
  double v17 = [v23 constraintEqualToAnchor:v16];
  v32[2] = v17;
  v18 = [(ModalCardHeaderView *)v5 bottomAnchor];
  objc_super v19 = [(ContaineeViewController *)self headerView];
  double v20 = [v19 bottomAnchor];
  v21 = [v18 constraintEqualToAnchor:v20];
  v32[3] = v21;
  objc_super v22 = +[NSArray arrayWithObjects:v32 count:4];
  +[NSLayoutConstraint activateConstraints:v22];

  [(AllRefinementsViewController *)self setModalHeaderView:v5];
  [(AllRefinementsViewController *)self updateHeaderHairlineAnimated:0];
}

- (void)addCollectionView
{
  v2 = self;
  objc_initWeak(&location, self);
  id v3 = objc_alloc((Class)UICollectionViewCompositionalLayout);
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_10056C9B0;
  v46[3] = &unk_1012EF3A8;
  objc_copyWeak(&v47, &location);
  id v4 = [v3 initWithSectionProvider:v46];
  [(AllRefinementsViewController *)v2 setCollectionViewLayout:v4];

  double v5 = [(AllRefinementsViewController *)v2 collectionViewLayout];
  uint64_t v6 = objc_opt_class();
  double v7 = +[AllRefinementsSectionBackground decorationViewKind];
  [v5 registerClass:v6 forDecorationViewOfKind:v7];

  id v8 = objc_alloc((Class)UICollectionView);
  double v9 = [(AllRefinementsViewController *)v2 collectionViewLayout];
  id v10 = [v8 initWithFrame:v9 collectionViewLayout:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(AllRefinementsViewController *)v2 setCollectionView:v10];

  id v11 = [(AllRefinementsViewController *)v2 collectionView];
  [v11 setAccessibilityIdentifier:@"AllRefinementsCollectionView"];

  double v12 = [(AllRefinementsViewController *)v2 collectionView];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v13 = +[UIColor clearColor];
  double v14 = [(AllRefinementsViewController *)v2 collectionView];
  [v14 setBackgroundColor:v13];

  double v15 = [(AllRefinementsViewController *)v2 collectionView];
  [v15 setAlwaysBounceVertical:1];

  v16 = [(ContaineeViewController *)v2 contentView];
  double v17 = [(AllRefinementsViewController *)v2 collectionView];
  [v16 addSubview:v17];

  v45 = [(AllRefinementsViewController *)v2 collectionView];
  v43 = [v45 leadingAnchor];
  v44 = [(ContaineeViewController *)v2 contentView];
  v42 = [v44 leadingAnchor];
  v41 = [v43 constraintEqualToAnchor:v42];
  v49[0] = v41;
  v40 = [(AllRefinementsViewController *)v2 collectionView];
  v38 = [v40 trailingAnchor];
  v39 = [(ContaineeViewController *)v2 contentView];
  v37 = [v39 trailingAnchor];
  v36 = [v38 constraintEqualToAnchor:v37];
  v49[1] = v36;
  v35 = [(AllRefinementsViewController *)v2 collectionView];
  v34 = [v35 topAnchor];
  v18 = [(ContaineeViewController *)v2 contentView];
  objc_super v19 = [v18 topAnchor];
  double v20 = [v34 constraintEqualToAnchor:v19];
  v49[2] = v20;
  v21 = [(AllRefinementsViewController *)v2 collectionView];
  objc_super v22 = [v21 bottomAnchor];
  double v23 = [(ContaineeViewController *)v2 contentView];
  double v24 = [v23 bottomAnchor];
  double v25 = [v22 constraintEqualToAnchor:v24];
  v49[3] = v25;
  double v26 = +[NSArray arrayWithObjects:v49 count:4];
  +[NSLayoutConstraint activateConstraints:v26];

  double v27 = [AllRefinementsDataSource alloc];
  objc_super v28 = [(AllRefinementsViewController *)v2 collectionView];
  objc_super v29 = [(AllRefinementsViewController *)v2 viewModel];
  v30 = [(AllRefinementsViewController *)v2 selectionSequenceNumber];
  v31 = [(AllRefinementsViewController *)v2 analyticsDelegate];
  v32 = [(AllRefinementsDataSource *)v27 initWithCollectionView:v28 viewModel:v29 scrollViewDelegate:v2 selectionSequenceNumber:v30 analyticsDelegate:v31 viewModelDelegate:v2];
  v2 = (AllRefinementsViewController *)((char *)v2 + 168);
  Class isa = v2->super.super.super.super.super.super.isa;
  v2->super.super.super.super.super.super.Class isa = (Class)v32;

  [(objc_class *)v2->super.super.super.super.super.super.isa displayRefinements];
  objc_destroyWeak(&v47);
  objc_destroyWeak(&location);
}

- (void)dismiss
{
}

- (void)updateHeaderHairlineAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(AllRefinementsViewController *)self modalHeaderView];

  if (v5)
  {
    unsigned int v6 = [(UICollectionView *)self->_collectionView _maps_shouldShowTopHairline];
    double v7 = 0.0;
    if (v6) {
      double v7 = 1.0;
    }
    v8[4] = self;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10056CB3C;
    v9[3] = &unk_1012EB708;
    v9[4] = self;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10056CB90;
    v8[3] = &unk_1012EB730;
    +[UIScrollView _maps_updateTopHairlineAlpha:v3 animated:v9 getter:v8 setter:v7];
  }
}

- (void)didTapOnClear:(id)a3
{
  [(AllRefinementsViewController *)self _clearCurrentSelection];
  id v4 = [(AllRefinementsViewController *)self copiedViewModel];
  id v5 = [v4 copy];
  [(AllRefinementsViewController *)self setViewModel:v5];

  dataSource = self->_dataSource;
  double v7 = [(AllRefinementsViewController *)self viewModel];
  [(AllRefinementsDataSource *)dataSource reloadCollectionView:v7];

  id v8 = [(AllRefinementsViewController *)self modalHeaderView];
  [(AllRefinementsViewController *)self _setupTopLeadingButton:v8 filters:0];
}

- (void)didTapOnCancel:(id)a3
{
  [(ContaineeViewController *)self handleDismissAction:a3];

  [(AllRefinementsViewController *)self _sendAnalyticsForEvent:0];
}

- (void)didTapOnApply:(id)a3
{
  [(ContaineeViewController *)self handleDismissAction:a3];
  id v4 = [(AllRefinementsViewController *)self allRefinementsDelegate];
  id v5 = [(AllRefinementsViewController *)self viewModel];
  unsigned int v6 = [(AllRefinementsViewController *)self dataSource];
  double v7 = [v6 selectionSequenceNumber];
  [v4 allRefinementsApplyViewModel:v5 selectionSequenceNumber:v7];

  [(AllRefinementsViewController *)self _sendAnalyticsForEvent:1];
}

- (void)scrollViewDidScroll:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AllRefinementsViewController;
  [(ContaineeViewController *)&v4 scrollViewDidScroll:a3];
  [(AllRefinementsViewController *)self updateHeaderHairlineAnimated:1];
}

- (void)_sendAnalyticsForEvent:(unint64_t)a3
{
  id v5 = [(AllRefinementsViewController *)self viewModel];
  unsigned int v6 = [v5 sections];
  if ([v6 count] == (id)1) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 1;
  }

  id v8 = [(AllRefinementsViewController *)self analyticsDelegate];
  [v8 logRefinementsEvent:a3 fromSource:v7];
}

- (BOOL)_checkIfFiltersAreSelected
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v2 = [(AllRefinementsViewController *)self viewModel];
  BOOL v3 = [v2 sections];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10056CF6C;
  v5[3] = &unk_1012EF420;
  v5[4] = &v6;
  [v3 enumerateObjectsUsingBlock:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)_clearCurrentSelection
{
  if (MapsFeature_IsEnabled_SearchAndDiscovery())
  {
    id v4 = [(AllRefinementsViewController *)self copiedViewModel];
    BOOL v3 = [v4 sections];
    [v3 enumerateObjectsUsingBlock:&stru_1012EF460];
  }
}

- (void)_setupTopLeadingButton:(id)a3 filters:(BOOL)a4
{
  BOOL v4 = a4;
  id v22 = a3;
  uint64_t v6 = [v22 leadingButton];
  [v6 removeTarget:self action:"didTapOnClear:" forControlEvents:64];

  uint64_t v7 = [v22 leadingButton];
  [v7 removeTarget:self action:"didTapOnCancel:" forControlEvents:64];

  if (v4)
  {
    uint64_t v8 = sub_100AEBCF4();
    char v9 = [v22 leadingButton];
    id v10 = [v9 titleLabel];
    [v10 setText:v8];

    id v11 = [v22 leadingButton];
    double v12 = sub_100AEBCF4();
    [v11 setTitle:v12 forState:0];

    double v13 = [v22 leadingButton];
    double v14 = v13;
    double v15 = self;
    v16 = "didTapOnClear:";
  }
  else
  {
    double v17 = sub_100AEBD5C();
    v18 = [v22 leadingButton];
    objc_super v19 = [v18 titleLabel];
    [v19 setText:v17];

    double v20 = [v22 leadingButton];
    v21 = sub_100AEBD5C();
    [v20 setTitle:v21 forState:0];

    double v13 = [v22 leadingButton];
    double v14 = v13;
    double v15 = self;
    v16 = "didTapOnCancel:";
  }
  [v13 addTarget:v15 action:v16 forControlEvents:64];
}

- (void)refinementViewModelDidChange
{
  if (MapsFeature_IsEnabled_SearchAndDiscovery())
  {
    uint64_t v6 = 0;
    uint64_t v7 = &v6;
    uint64_t v8 = 0x2020000000;
    char v9 = 0;
    BOOL v3 = [(AllRefinementsViewModel *)self->_viewModel sections];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10056D53C;
    v5[3] = &unk_1012EF488;
    v5[4] = self;
    void v5[5] = &v6;
    [v3 enumerateObjectsUsingBlock:v5];

    BOOL v4 = [(AllRefinementsViewController *)self modalHeaderView];
    [(AllRefinementsViewController *)self _setupTopLeadingButton:v4 filters:*((unsigned __int8 *)v7 + 24)];

    _Block_object_dispose(&v6, 8);
  }
}

- (AllRefinementsViewControllerDelegate)allRefinementsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_allRefinementsDelegate);

  return (AllRefinementsViewControllerDelegate *)WeakRetained;
}

- (void)setAllRefinementsDelegate:(id)a3
{
}

- (AllRefinementsViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
}

- (AllRefinementsViewModel)copiedViewModel
{
  return self->_copiedViewModel;
}

- (void)setCopiedViewModel:(id)a3
{
}

- (UICollectionViewLayout)collectionViewLayout
{
  return self->_collectionViewLayout;
}

- (void)setCollectionViewLayout:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (AllRefinementsDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (ModalCardHeaderView)modalHeaderView
{
  return self->_modalHeaderView;
}

- (void)setModalHeaderView:(id)a3
{
}

- (NSNumber)selectionSequenceNumber
{
  return self->_selectionSequenceNumber;
}

- (void)setSelectionSequenceNumber:(id)a3
{
}

- (ResultRefinementsAnalytics)analyticsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsDelegate);

  return (ResultRefinementsAnalytics *)WeakRetained;
}

- (void)setAnalyticsDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_storeStrong((id *)&self->_selectionSequenceNumber, 0);
  objc_storeStrong((id *)&self->_modalHeaderView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_copiedViewModel, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);

  objc_destroyWeak((id *)&self->_allRefinementsDelegate);
}

@end