@interface MailRecategorizationViewController
- (EMMessageListItem)messageListItem;
- (MFTriageInteractionDelegate)delegate;
- (MailActionViewHeader)messageHeaderView;
- (MailRecategorizationDataSource)dataSource;
- (MailRecategorizationViewController)initWithMessageHeaderView:(id)a3 messageListItem:(id)a4 completion:(id)a5;
- (UICollectionView)collectionView;
- (_UINavigationBarTitleView)titleView;
- (id)_compositionalLayout;
- (id)completion;
- (void)_configureCollectionViewIfNeeded;
- (void)_configureNavigationTitleViewIfNeeded;
- (void)_dismissSelf;
- (void)_loadData;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)loadView;
- (void)scrollViewDidScroll:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMessageHeaderView:(id)a3;
- (void)setMessageListItem:(id)a3;
- (void)setTitleView:(id)a3;
- (void)updateSizeForLayoutChange;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MailRecategorizationViewController

- (MailRecategorizationViewController)initWithMessageHeaderView:(id)a3 messageListItem:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MailRecategorizationViewController;
  v12 = [(MailRecategorizationViewController *)&v19 initWithNibName:0 bundle:0];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_messageHeaderView, a3);
    objc_storeStrong((id *)&v13->_messageListItem, a4);
    uint64_t v14 = +[UICollectionViewCellRegistration registrationWithCellClass:objc_opt_class() configurationHandler:&stru_100608AA0];
    cellRegistration = v13->_cellRegistration;
    v13->_cellRegistration = (UICollectionViewCellRegistration *)v14;

    id v16 = objc_retainBlock(v11);
    id completion = v13->_completion;
    v13->_id completion = v16;
  }
  return v13;
}

- (void)loadView
{
  id v6 = objc_alloc_init((Class)UIView);
  v3 = +[UIColor clearColor];
  [v6 setBackgroundColor:v3];

  [(MailRecategorizationViewController *)self setView:v6];
  v4 = +[UIBlurEffect effectWithStyle:9];
  id v5 = [objc_alloc((Class)UIVisualEffectView) initWithEffect:v4];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 addSubview:v5];
  [v5 mf_pinToView:v6 usingLayoutMargins:0];
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)MailRecategorizationViewController;
  [(MailRecategorizationViewController *)&v9 viewDidLoad];
  [(MailRecategorizationViewController *)self _configureNavigationTitleViewIfNeeded];
  [(MailRecategorizationViewController *)self _configureCollectionViewIfNeeded];
  [(MailRecategorizationViewController *)self _loadData];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = [(MailRecategorizationViewController *)self presentingViewController];
  v10[0] = objc_opt_class();
  v10[1] = objc_opt_class();
  v4 = +[NSArray arrayWithObjects:v10 count:2];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10011CB30;
  v6[3] = &unk_100608AC8;
  objc_copyWeak(&v7, &location);
  id v5 = [v3 registerForTraitChanges:v4 withHandler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MailRecategorizationViewController;
  [(MailRecategorizationViewController *)&v3 viewDidLayoutSubviews];
  [(MailRecategorizationViewController *)self updateSizeForLayoutChange];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v9.receiver = self;
  v9.super_class = (Class)MailRecategorizationViewController;
  -[MailRecategorizationViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10011CD60;
  v8[3] = &unk_100606048;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

- (void)updateSizeForLayoutChange
{
  objc_super v3 = [(MailRecategorizationViewController *)self sheetPresentationController];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10011CE8C;
  v5[3] = &unk_1006047A0;
  v5[4] = self;
  [v3 animateChanges:v5];

  v4 = [(MailRecategorizationViewController *)self collectionView];
  [v4 contentSize];
  [(MailRecategorizationViewController *)self setPreferredContentSize:388.0];
}

- (void)_configureNavigationTitleViewIfNeeded
{
  objc_super v3 = [(MailRecategorizationViewController *)self titleView];

  if (!v3)
  {
    v4 = [(MailRecategorizationViewController *)self messageHeaderView];
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v5 = [objc_alloc((Class)_UINavigationBarTitleView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v5 setPreservesSuperviewLayoutMargins:1];
    [v5 setHideStandardTitle:1];
    [v4 frame];
    [v5 setHeight:CGRectGetHeight(v31)];
    id v6 = +[UIColor clearColor];
    [v5 setBackgroundColor:v6];

    [v5 addSubview:v4];
    id v7 = [(MailRecategorizationViewController *)self navigationItem];
    [v7 setTitleView:v5];

    [(MailRecategorizationViewController *)self setTitleView:v5];
    id v29 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:24 target:self action:"_dismissSelf"];
    v8 = [(MailRecategorizationViewController *)self navigationItem];
    [v8 setRightBarButtonItem:v29];

    if (v4)
    {
      if (v5)
      {
        v27 = [v4 leadingAnchor];
        v26 = [v5 layoutMarginsGuide];
        v25 = [v26 leadingAnchor];
        v24 = [v27 constraintEqualToAnchor:];
        v30[0] = v24;
        v28 = [v4 trailingAnchor];
        v23 = [v5 layoutMarginsGuide];
        v22 = [v23 trailingAnchor];
        v21 = [v28 constraintEqualToAnchor:-24.0];
        v30[1] = v21;
        objc_super v9 = [v4 heightAnchor];
        id v10 = [v5 heightAnchor];
        id v11 = [v9 constraintEqualToAnchor:v10];
        v30[2] = v11;
        v12 = [v4 centerYAnchor];
        v13 = [v5 centerYAnchor];
        uint64_t v14 = [v12 constraintEqualToAnchor:v13];
        v30[3] = v14;
        v15 = +[NSArray arrayWithObjects:v30 count:4];

        +[NSLayoutConstraint activateConstraints:v15];
      }
    }
    id v16 = [(MailRecategorizationViewController *)self navigationItem];
    [v16 _setManualScrollEdgeAppearanceEnabled:1];

    id v17 = objc_alloc_init((Class)UINavigationBarAppearance);
    [v17 configureWithDefaultBackground];
    v18 = +[UIColor separatorColor];
    [v17 setShadowColor:v18];

    objc_super v19 = [(MailRecategorizationViewController *)self navigationItem];
    [v19 setStandardAppearance:v17];

    v20 = [(MailRecategorizationViewController *)self navigationItem];
    [v20 _setManualScrollEdgeAppearanceProgress:0.0];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v17 = a3;
  id v4 = [(MailRecategorizationViewController *)self collectionView];

  id v5 = v17;
  if (v4 == v17)
  {
    [v17 bounds];
    double v7 = v6;
    v8 = [(MailRecategorizationViewController *)self view];
    [v8 frame];
    BOOL v10 = v7 > v9;

    [v17 setBounces:v10];
    id v11 = [(MailRecategorizationViewController *)self messageHeaderView];
    [v11 frame];
    double Height = CGRectGetHeight(v19);

    [v17 contentOffset];
    id v5 = v17;
    if (v13 > -Height)
    {
      [v17 contentOffset];
      double v15 = v14;
      id v16 = [(MailRecategorizationViewController *)self navigationItem];
      [v16 _setManualScrollEdgeAppearanceProgress:fmin((Height + v15) * 10.0, 100.0) / 100.0];

      id v5 = v17;
    }
  }
}

- (void)_dismissSelf
{
}

- (void)_configureCollectionViewIfNeeded
{
  objc_super v3 = [(MailRecategorizationViewController *)self collectionView];

  if (!v3)
  {
    id v15 = [(MailRecategorizationViewController *)self view];
    id v4 = objc_alloc((Class)UICollectionView);
    [v15 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v13 = [(MailRecategorizationViewController *)self _compositionalLayout];
    id v14 = [v4 initWithFrame:v13 collectionViewLayout:v6, v8, v10, v12];

    [v14 setDelegate:self];
    [(MailRecategorizationViewController *)self setContentScrollView:v14 forEdge:15];
    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v14 setBackgroundColor:0];
    [v14 setAlwaysBounceVertical:1];
    [v14 setShowsVerticalScrollIndicator:0];
    [(MailRecategorizationViewController *)self setCollectionView:v14];
    [v15 addSubview:v14];
    [v14 mf_pinToView:v15 usingLayoutMargins:0];
  }
}

- (id)_compositionalLayout
{
  id v2 = [objc_alloc((Class)UICollectionLayoutListConfiguration) initWithAppearance:2];
  [v2 setFooterMode:1];
  [v2 setItemSeparatorHandler:&stru_100608B30];
  id v3 = objc_alloc((Class)UICollectionViewCompositionalLayout);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10011DA04;
  v7[3] = &unk_100608B58;
  id v4 = v2;
  id v8 = v4;
  id v5 = [v3 initWithSectionProvider:v7];

  return v5;
}

- (void)_loadData
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  void v10[2] = sub_10011DC6C;
  v10[3] = &unk_100608B80;
  v10[4] = self;
  id v3 = objc_retainBlock(v10);
  id v4 = [MailRecategorizationDataSource alloc];
  id v5 = [(MailRecategorizationViewController *)self collectionView];
  double v6 = [(MailRecategorizationDataSource *)v4 initWithCollectionView:v5 cellProvider:v3];

  double v7 = [(MailRecategorizationViewController *)self delegate];
  [(MailRecategorizationDataSource *)v6 setDelegate:v7];

  id v8 = [(MailRecategorizationViewController *)self messageListItem];
  double v9 = [(MailRecategorizationViewController *)self completion];
  [(MailRecategorizationDataSource *)v6 updateDataSourceWithMessageListItem:v8 completion:v9];

  [(MailRecategorizationViewController *)self setDataSource:v6];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v7 = a4;
  id v5 = [(MailRecategorizationViewController *)self dataSource];
  double v6 = [v5 cardActionAtIndexPath:v7];

  [v6 executeHandlerIfEnabled];
}

- (MFTriageInteractionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFTriageInteractionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
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

- (MailRecategorizationDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (EMMessageListItem)messageListItem
{
  return self->_messageListItem;
}

- (void)setMessageListItem:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_cellRegistration, 0);
  objc_storeStrong((id *)&self->_messageListItem, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_messageHeaderView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end