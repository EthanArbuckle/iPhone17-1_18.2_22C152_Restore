@interface CollectionCreateViewController
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (CollectionCreateViewController)initWithEditSession:(id)a3;
- (id)keyCommands;
- (id)preferredFocusEnvironments;
- (int)target;
- (void)collectionHandlerInfoUpdated:(id)a3;
- (void)createAction:(id)a3;
- (void)dataSourceUpdated:(id)a3;
- (void)setTarget:(int)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation CollectionCreateViewController

- (CollectionCreateViewController)initWithEditSession:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CollectionCreateViewController;
  v6 = [(CollectionCreateViewController *)&v13 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_editSession, a3);
    v8 = [(ContaineeViewController *)v7 cardPresentationController];
    [v8 setPresentedModally:1];

    v9 = [(ContaineeViewController *)v7 cardPresentationController];
    [v9 setTakesAvailableHeight:1];

    [(ContaineeViewController *)v7 setPreferredPresentationStyle:6];
    uint64_t v10 = +[CollectionHandler collection];
    collection = v7->_collection;
    v7->_collection = (CollectionHandler *)v10;

    [(CollectionHandler *)v7->_collection addObserver:v7];
  }

  return v7;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if ("createAction:" == a3)
  {
    id v5 = [(CollectionHandler *)self->_collection stagedTitle];
    BOOL v4 = [v5 length] != 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CollectionCreateViewController;
    return -[CollectionCreateViewController canPerformAction:withSender:](&v7, "canPerformAction:withSender:");
  }
  return v4;
}

- (id)keyCommands
{
  v8.receiver = self;
  v8.super_class = (Class)CollectionCreateViewController;
  v2 = [(ContaineeViewController *)&v8 keyCommands];
  v3 = +[NSBundle mainBundle];
  BOOL v4 = [v3 localizedStringForKey:@"[Guide] Create" value:@"localized string not found" table:0];
  id v5 = +[UIKeyCommand commandWithTitle:v4 image:0 action:"createAction:" input:@"\r" modifierFlags:0x100000 propertyList:0];
  v6 = [v2 arrayByAddingObject:v5];

  return v6;
}

- (id)preferredFocusEnvironments
{
  collectionView = self->_collectionView;
  v2 = +[NSArray arrayWithObjects:&collectionView count:1];

  return v2;
}

- (void)viewDidLoad
{
  v72.receiver = self;
  v72.super_class = (Class)CollectionCreateViewController;
  [(ContaineeViewController *)&v72 viewDidLoad];
  v3 = [(ContaineeViewController *)self headerView];
  BOOL v4 = [(ContaineeViewController *)self contentView];
  id v5 = [(CollectionCreateViewController *)self view];
  [v5 setAccessibilityIdentifier:@"CollectionCreateView"];

  [v4 setAccessibilityIdentifier:@"CollectionCreateContent"];
  v6 = [ModalCardHeaderView alloc];
  objc_super v7 = +[ModalCardHeaderConfiguration defaultModalCardHeaderConfiguration];
  objc_super v8 = [(ModalCardHeaderView *)v6 initWithConfiguration:v7];

  [(ModalCardHeaderView *)v8 setUseAdaptiveFont:1];
  [(ModalCardHeaderView *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  v9 = +[NSBundle mainBundle];
  uint64_t v10 = [v9 localizedStringForKey:@"[Guide] New guide" value:@"localized string not found" table:0];
  [(ModalCardHeaderView *)v8 setTitle:v10];

  v11 = [(ModalCardHeaderView *)v8 leadingButton];
  v12 = sub_100AEBD5C();
  [v11 setTitle:v12 forState:0];

  objc_super v13 = [(ModalCardHeaderView *)v8 leadingButton];
  [v13 addTarget:self action:"cancelAction:" forControlEvents:64];

  v14 = [(ModalCardHeaderView *)v8 trailingButton];
  v15 = +[NSBundle mainBundle];
  v16 = [v15 localizedStringForKey:@"[Collection] Create" value:@"localized string not found" table:0];
  [v14 setTitle:v16 forState:0];

  v17 = [(ModalCardHeaderView *)v8 trailingButton];
  [v17 addTarget:self action:"createAction:" forControlEvents:64];

  v18 = [(ModalCardHeaderView *)v8 trailingButton];
  [v18 setEnabled:0];

  [v3 addSubview:v8];
  v66 = self;
  objc_storeStrong((id *)&self->_modalHeaderView, v8);
  v19 = [[CollectionView alloc] initWithCollectionViewSize:1];
  [(CollectionView *)v19 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CollectionView *)v19 setEditSession:self->_editSession];
  [(CollectionView *)v19 setMaxContentSizeCategory:UIContentSizeCategoryAccessibilityMedium];
  [(CollectionView *)v19 setAllowAccessibilityTextWrapping:0];
  [(CollectionView *)v19 setCollectionInfo:self->_collection];
  [(CollectionView *)v19 setEditing:1];
  [v4 addSubview:v19];
  objc_storeStrong((id *)&self->_collectionView, v19);
  v65 = [(ModalCardHeaderView *)v8 leadingAnchor];
  v63 = [v3 leadingAnchor];
  v61 = [v65 constraintEqualToAnchor:v63];
  v74[0] = v61;
  v59 = [(ModalCardHeaderView *)v8 topAnchor];
  v57 = [v3 topAnchor];
  v55 = [v59 constraintEqualToAnchor:v57];
  v74[1] = v55;
  v54 = [(ModalCardHeaderView *)v8 trailingAnchor];
  v53 = [v3 trailingAnchor];
  v52 = [v54 constraintEqualToAnchor:v53];
  v74[2] = v52;
  v68 = v8;
  v51 = [(ModalCardHeaderView *)v8 bottomAnchor];
  v69 = v3;
  v50 = [v3 bottomAnchor];
  v49 = [v51 constraintEqualToAnchor:v50];
  v74[3] = v49;
  v20 = [(CollectionView *)v19 topAnchor];
  v21 = [v4 topAnchor];
  v22 = [v20 constraintEqualToAnchor:v21];
  v74[4] = v22;
  v23 = [(CollectionView *)v19 leadingAnchor];
  v24 = [v4 leadingAnchor];
  v25 = [v23 constraintEqualToAnchor:v24];
  v74[5] = v25;
  v70 = v19;
  v26 = [(CollectionView *)v19 trailingAnchor];
  v71 = v4;
  v27 = [v4 trailingAnchor];
  v28 = [v26 constraintEqualToAnchor:v27];
  v74[6] = v28;
  v29 = +[NSArray arrayWithObjects:v74 count:7];
  +[NSLayoutConstraint activateConstraints:v29];

  v30 = v66->_editSession;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v31 = v30;
  }
  else {
    v31 = 0;
  }
  v32 = v31;

  if (v32)
  {
    v33 = -[MapsThemeTableView initWithFrame:style:]([MapsThemeTableView alloc], "initWithFrame:style:", 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [(MapsThemeTableView *)v33 setTranslatesAutoresizingMaskIntoConstraints:0];
    v34 = +[UIColor clearColor];
    [(MapsThemeTableView *)v33 setBackgroundColor:v34];

    [(MapsThemeTableView *)v33 setScrollEnabled:0];
    [(MapsThemeTableView *)v33 setAccessibilityIdentifier:@"CollectionCreateTable"];
    [v71 addSubview:v33];
    tableView = v66->_tableView;
    v66->_tableView = v33;
    v36 = v33;

    double v37 = 0.0;
    id v38 = [(CollectionView *)v70 _maps_addHairlineAtTopWithMargin:0.0];
    if (sub_1000BBB44(v66) == 5) {
      double v37 = 16.0;
    }
    v64 = [(MapsThemeTableView *)v36 leadingAnchor];
    v62 = [v71 leadingAnchor];
    v60 = [v64 constraintEqualToAnchor:v62 constant:v37];
    v73[0] = v60;
    v58 = [(MapsThemeTableView *)v36 topAnchor];
    v56 = [(CollectionView *)v70 bottomAnchor];
    v39 = [v58 constraintEqualToAnchor:v56 constant:10.0];
    v73[1] = v39;
    v40 = [(MapsThemeTableView *)v36 trailingAnchor];
    [v71 trailingAnchor];
    v41 = v67 = v32;
    v42 = [v40 constraintEqualToAnchor:v41 constant:-v37];
    v73[2] = v42;
    v43 = [(MapsThemeTableView *)v36 bottomAnchor];
    v44 = [v71 bottomAnchor];
    v45 = [v43 constraintEqualToAnchor:v44];
    v73[3] = v45;
    v46 = +[NSArray arrayWithObjects:v73 count:4];
    +[NSLayoutConstraint activateConstraints:v46];

    v32 = v67;
    v47 = [[CollectionDataSource alloc] initWithTableView:v66->_tableView collectionEditSession:v67];
    dataSource = v66->_dataSource;
    v66->_dataSource = v47;

    [(CollectionDataSource *)v66->_dataSource setShowsHeader:1];
    [(DataSource *)v66->_dataSource setDelegate:v66];
    [(MapsThemeTableView *)v36 setDelegate:v66->_dataSource];
    [(MapsThemeTableView *)v36 setDataSource:v66->_dataSource];
    [(CollectionDataSource *)v66->_dataSource setActive:1];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CollectionCreateViewController;
  [(CollectionCreateViewController *)&v4 viewDidAppear:a3];
  [(CollectionView *)self->_collectionView becomeFirstResponder];
}

- (void)createAction:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  editSession = self->_editSession;
  collection = self->_collection;
  if (editSession)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10049A980;
    v13[3] = &unk_1012EB690;
    objc_super v7 = &v15;
    objc_copyWeak(&v15, &location);
    id v14 = v4;
    [(CollectionEditSession *)editSession applyToCollection:collection completion:v13];
    objc_super v8 = &v14;
  }
  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10049A9D0;
    v10[3] = &unk_1012EB690;
    objc_super v7 = &v12;
    objc_copyWeak(&v12, &location);
    id v11 = v4;
    [(CollectionHandler *)collection createCollection:v10];
    objc_super v8 = &v11;
  }

  objc_destroyWeak(v7);
  uint64_t target = self->_target;
  if (target) {
    +[GEOAPPortal captureUserAction:2072 target:target value:0];
  }
  +[GEOAPPortal captureUserAction:2072 target:0 value:0];
  objc_destroyWeak(&location);
}

- (void)collectionHandlerInfoUpdated:(id)a3
{
  id v6 = [a3 stagedTitle];
  BOOL v4 = [v6 length] != 0;
  id v5 = [(ModalCardHeaderView *)self->_modalHeaderView trailingButton];
  [v5 setEnabled:v4];
}

- (void)dataSourceUpdated:(id)a3
{
}

- (int)target
{
  return self->_target;
}

- (void)setTarget:(int)a3
{
  self->_uint64_t target = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_editSession, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_modalHeaderView, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end