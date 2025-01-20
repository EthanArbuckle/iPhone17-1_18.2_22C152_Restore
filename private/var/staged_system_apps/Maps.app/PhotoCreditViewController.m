@interface PhotoCreditViewController
+ (BOOL)useCollectionView;
- (NSDirectionalEdgeInsets)collectionViewListSectionContentInsetsForSection:(int64_t)a3;
- (PhotoCreditDataSource)photoCreditDataSource;
- (PhotoCreditViewController)initWithCompletionHandler:(id)a3;
- (double)heightForLayout:(unint64_t)a3;
- (id)collectionViewLayoutBoundarySupplementaryItems;
- (int64_t)collectionViewConfigurationSeparatorStyle;
- (int64_t)collectionViewListLayoutAppearanceStyle;
- (void)_presentAlertForError:(id)a3;
- (void)cancelAction:(id)a3;
- (void)closeAction:(id)a3;
- (void)didTapOnPrivacyText;
- (void)keyboardWillHide:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)loadView;
- (void)photoCreditNameHasBeenFlaggedWithErrorMessage:(id)a3;
- (void)setupSubviews;
- (void)submitAction:(id)a3;
- (void)updateAppearanceForPhotoCredit:(BOOL)a3 photoCreditNameExists:(BOOL)a4;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PhotoCreditViewController

+ (BOOL)useCollectionView
{
  return 1;
}

- (PhotoCreditViewController)initWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PhotoCreditViewController;
  v5 = [(PhotoCreditViewController *)&v14 initWithNibName:0 bundle:0];
  if (v5)
  {
    v6 = objc_alloc_init(PhotoCreditDataSource);
    [(PreferenceValuesDataSource *)v6 setDelegate:v5];
    [(PhotoCreditDataSource *)v6 setPhotoCreditChangesDelegate:v5];
    [(PhotoCreditDataSource *)v6 setPrivacyDelegate:v5];
    dataSource = v5->super._dataSource;
    v5->super._dataSource = &v6->super;
    v8 = v6;

    [(PhotoCreditDataSource *)v8 loadPreferences];
    v9 = [(ContaineeViewController *)v5 cardPresentationController];
    [v9 setPresentedModally:1];

    [(PhotoCreditViewController *)v5 setModalPresentationStyle:2];
    v10 = [(ContaineeViewController *)v5 cardPresentationController];
    [v10 setTakesAvailableHeight:1];

    id v11 = [v4 copy];
    id completionHandler = v5->_completionHandler;
    v5->_id completionHandler = v11;
  }
  return v5;
}

- (PhotoCreditDataSource)photoCreditDataSource
{
  return (PhotoCreditDataSource *)self->super._dataSource;
}

- (void)loadView
{
  v3 = -[MacPhotoCreditView initWithFrame:]([MacPhotoCreditView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(PhotoCreditViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v65.receiver = self;
  v65.super_class = (Class)PhotoCreditViewController;
  [(PreferencesValuesContaineeViewController *)&v65 viewDidLoad];
  [(PhotoCreditViewController *)self setAccessibilityIdentifier:@"PhotoCreditConfiguration"];
  v3 = +[UIColor systemBackgroundColor];
  id v4 = [(PhotoCreditViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = [(ContaineeViewController *)self headerView];
  v6 = [(ContaineeViewController *)self contentView];
  v7 = [ModalCardHeaderView alloc];
  v8 = +[ModalCardHeaderConfiguration defaultModalCardHeaderConfiguration];
  v9 = [(ModalCardHeaderView *)v7 initWithConfiguration:v8];

  [(ModalCardHeaderView *)v9 setUseAdaptiveFont:1];
  v10 = +[UIColor secondarySystemBackgroundColor];
  [(ModalCardHeaderView *)v9 setBackgroundColor:v10];

  id v11 = [(ModalCardHeaderView *)v9 bottomHairline];
  [v11 setHidden:1];

  [(ModalCardHeaderView *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  v12 = +[NSBundle mainBundle];
  v13 = [v12 localizedStringForKey:@"[Photo Credit] Photo Credit" value:@"localized string not found" table:0];
  [(ModalCardHeaderView *)v9 setTitle:v13];

  objc_super v14 = [(ModalCardHeaderView *)v9 leadingButton];
  v15 = sub_100AEBD5C();
  [v14 setTitle:v15 forState:0];

  v16 = [(ModalCardHeaderView *)v9 leadingButton];
  [v16 addTarget:self action:"cancelAction:" forControlEvents:64];

  v17 = [(ModalCardHeaderView *)v9 trailingButton];
  v18 = sub_100AEBDC4();
  [v17 setTitle:v18 forState:0];

  v19 = [(ModalCardHeaderView *)v9 trailingButton];
  [v19 addTarget:self action:"submitAction:" forControlEvents:64];

  [v5 addSubview:v9];
  objc_storeStrong((id *)&self->_modalHeaderView, v9);
  v20 = [(ModalCardHeaderView *)self->_modalHeaderView trailingButton];
  [v20 setEnabled:0];

  v21 = +[UIColor secondarySystemBackgroundColor];
  v22 = [(PreferencesValuesContaineeViewController *)self collectionView];
  [v22 setBackgroundColor:v21];

  v23 = [(PreferencesValuesContaineeViewController *)self collectionView];
  [v23 setTranslatesAutoresizingMaskIntoConstraints:0];

  v24 = [(PreferencesValuesContaineeViewController *)self collectionView];
  [v24 setAccessibilityIdentifier:@"PhotoCreditCollectionView"];

  v25 = [(PreferencesValuesContaineeViewController *)self collectionView];
  +[PhotoCreditDataSource registerCellsInCollectionView:v25];

  v26 = [(PreferencesValuesContaineeViewController *)self collectionView];
  [v6 addSubview:v26];

  v62 = [(ModalCardHeaderView *)v9 topAnchor];
  v61 = [v5 topAnchor];
  v60 = [v62 constraintEqualToAnchor:v61];
  v67[0] = v60;
  v59 = [(ModalCardHeaderView *)v9 leadingAnchor];
  v58 = [v5 leadingAnchor];
  v57 = [v59 constraintEqualToAnchor:v58];
  v67[1] = v57;
  v56 = [(ModalCardHeaderView *)v9 trailingAnchor];
  v55 = [v5 trailingAnchor];
  v54 = [v56 constraintEqualToAnchor:v55];
  v67[2] = v54;
  v63 = v9;
  v53 = [(ModalCardHeaderView *)v9 bottomAnchor];
  v64 = v5;
  v52 = [v5 bottomAnchor];
  v51 = [v53 constraintEqualToAnchor:v52];
  v67[3] = v51;
  v50 = [(PreferencesValuesContaineeViewController *)self collectionView];
  v49 = [v50 topAnchor];
  v48 = [v6 topAnchor];
  v47 = [v49 constraintEqualToAnchor:v48];
  v67[4] = v47;
  v46 = [(PreferencesValuesContaineeViewController *)self collectionView];
  v45 = [v46 leadingAnchor];
  v44 = [v6 leadingAnchor];
  v43 = [v45 constraintEqualToAnchor:v44];
  v67[5] = v43;
  v42 = [(PreferencesValuesContaineeViewController *)self collectionView];
  v27 = [v42 trailingAnchor];
  v28 = [v6 trailingAnchor];
  v29 = [v27 constraintEqualToAnchor:v28];
  v67[6] = v29;
  v30 = [(PreferencesValuesContaineeViewController *)self collectionView];
  v31 = [v30 bottomAnchor];
  v32 = [v6 bottomAnchor];
  v33 = [v31 constraintEqualToAnchor:v32];
  v67[7] = v33;
  v34 = +[NSArray arrayWithObjects:v67 count:8];
  +[NSLayoutConstraint activateConstraints:v34];

  if (sub_1000BBB44(self) == 5)
  {
    v35 = [v6 widthAnchor];
    v36 = [v35 constraintEqualToConstant:400.0];
    v66[0] = v36;
    v37 = [v6 heightAnchor];
    v38 = [v37 constraintEqualToConstant:250.0];
    v66[1] = v38;
    v39 = +[NSArray arrayWithObjects:v66 count:2];
    +[NSLayoutConstraint activateConstraints:v39];
  }
  v40 = +[NSNotificationCenter defaultCenter];
  [v40 addObserver:self selector:"keyboardWillShow:" name:UIKeyboardWillShowNotification object:0];

  v41 = +[NSNotificationCenter defaultCenter];
  [v41 addObserver:self selector:"keyboardWillHide:" name:UIKeyboardWillHideNotification object:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:UIKeyboardWillShowNotification object:0];

  v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self name:UIKeyboardWillHideNotification object:0];

  v7.receiver = self;
  v7.super_class = (Class)PhotoCreditViewController;
  [(ContaineeViewController *)&v7 viewWillDisappear:v3];
}

- (void)setupSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)PhotoCreditViewController;
  [(PreferencesValuesContaineeViewController *)&v2 setupSubviews];
}

- (int64_t)collectionViewListLayoutAppearanceStyle
{
  return 2;
}

- (int64_t)collectionViewConfigurationSeparatorStyle
{
  return sub_1000BBB44(self) != 5;
}

- (NSDirectionalEdgeInsets)collectionViewListSectionContentInsetsForSection:(int64_t)a3
{
  double v3 = 0.0;
  double v4 = 16.0;
  double v5 = 10.0;
  double v6 = 16.0;
  result.trailing = v6;
  result.bottom = v5;
  result.leading = v4;
  result.top = v3;
  return result;
}

- (id)collectionViewLayoutBoundarySupplementaryItems
{
  double v3 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
  double v4 = [(PhotoCreditViewController *)self photoCreditDataSource];
  double v5 = [(PreferencesValuesContaineeViewController *)self collectionView];
  [v4 footerHeightForCollectionView:v5];
  double v6 = +[NSCollectionLayoutDimension absoluteDimension:](NSCollectionLayoutDimension, "absoluteDimension:");
  objc_super v7 = +[NSCollectionLayoutSize sizeWithWidthDimension:v3 heightDimension:v6];

  v8 = +[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:v7 elementKind:UICollectionElementKindSectionFooter alignment:5];
  id v11 = v8;
  v9 = +[NSArray arrayWithObjects:&v11 count:1];

  return v9;
}

- (void)cancelAction:(id)a3
{
  id v4 = a3;
  +[GEOAPPortal captureUserAction:18 target:77 value:0];
  [(PhotoCreditViewController *)self closeAction:v4];
}

- (void)closeAction:(id)a3
{
  id v4 = a3;
  if (sub_1000BBB44(self) == 5) {
    [(PhotoCreditViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
  else {
    [(ContaineeViewController *)self handleDismissAction:v4];
  }
}

- (void)submitAction:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  double v5 = [(PhotoCreditViewController *)self photoCreditDataSource];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1004973C8;
  v6[3] = &unk_1012EBDD8;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  [v5 updatePhotoCreditPreferencesWithCompletion:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_presentAlertForError:(id)a3
{
  id v7 = +[UIAlertController alertControllerWithTitle:0 message:a3 preferredStyle:1];
  id v4 = +[NSBundle mainBundle];
  double v5 = [v4 localizedStringForKey:@"OK [Photo Credit alert acceptance button]" value:@"localized string not found" table:0];
  double v6 = +[UIAlertAction actionWithTitle:v5 style:0 handler:0];

  [v7 addAction:v6];
  [(PhotoCreditViewController *)self _maps_topMostPresentViewController:v7 animated:1 completion:0];
}

- (void)didTapOnPrivacyText
{
  id v3 = +[OBPrivacyPresenter presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.ratingsAndPhotos"];
  [v3 setPresentingViewController:self];
  [v3 present];
}

- (void)keyboardWillShow:(id)a3
{
  id v4 = [a3 userInfo];
  double v5 = [v4 objectForKeyedSubscript:UIKeyboardFrameEndUserInfoKey];
  [v5 CGRectValue];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  objc_super v14 = [(PreferencesValuesContaineeViewController *)self collectionView];
  v15 = +[UIScreen mainScreen];
  v16 = [v15 coordinateSpace];
  [v14 convertRect:v16 fromCoordinateSpace:v7, v9, v11, v13];
  double v18 = v17;

  id v19 = [(PreferencesValuesContaineeViewController *)self collectionView];
  [v19 setContentInset:0.0, 0.0, v18, 0.0];
}

- (void)keyboardWillHide:(id)a3
{
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  double v7 = [(PreferencesValuesContaineeViewController *)self collectionView];
  [v7 setContentInset:UIEdgeInsetsZero.top, left, bottom, right];

  id v8 = [(PreferencesValuesContaineeViewController *)self collectionView];
  [v8 setScrollIndicatorInsets:UIEdgeInsetsZero.top, left, bottom, right];
}

- (double)heightForLayout:(unint64_t)a3
{
  if (a3 > 5)
  {
    double v4 = -1.0;
  }
  else
  {
    if (((1 << a3) & 0x27) != 0) {
      return 350.0;
    }
    double v5 = [(ContaineeViewController *)self cardPresentationController];
    [v5 availableHeight];
    double v4 = v6;
  }
  double v7 = [(ContaineeViewController *)self cardPresentationController];
  id v8 = [v7 containerStyle];

  if (v8 == (id)6)
  {
    double v9 = [(ContaineeViewController *)self cardPresentationController];
    [v9 availableHeight];
    double v4 = v10;
  }
  return v4;
}

- (void)updateAppearanceForPhotoCredit:(BOOL)a3 photoCreditNameExists:(BOOL)a4
{
  uint64_t v4 = !a3 | a4;
  id v5 = [(ModalCardHeaderView *)self->_modalHeaderView trailingButton];
  [v5 setEnabled:v4];
}

- (void)photoCreditNameHasBeenFlaggedWithErrorMessage:(id)a3
{
  [(PhotoCreditViewController *)self _presentAlertForError:a3];
  id v4 = [(ModalCardHeaderView *)self->_modalHeaderView trailingButton];
  [v4 setEnabled:0];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->_modalHeaderView, 0);
}

@end