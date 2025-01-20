@interface OfflineMapsManagementExpiredViewController
+ (BOOL)wantsDefaultHeaderContentViews;
- (OfflineMapsManagementActionCoordination)delegate;
- (OfflineMapsManagementExpiredDataSource)offlineMapsDataSource;
- (UIBarButtonItem)cancelButtonItem;
- (UIBarButtonItem)clearButtonItem;
- (UIBarButtonItem)deselectAllButtonItem;
- (UIBarButtonItem)doneButtonItem;
- (UIBarButtonItem)editButtonItem;
- (UIBarButtonItem)restoreButtonItem;
- (UIBarButtonItem)selectAllButtonItem;
- (UICollectionView)collectionView;
- (UINavigationBar)navBar;
- (UIToolbar)toolbar;
- (void)_clearSelectedMaps;
- (void)_dismiss;
- (void)_restoreSelectedMaps;
- (void)_setupConstraints;
- (void)_setupViews;
- (void)_toggleEditing;
- (void)_toggleSelectAll;
- (void)_updateClearButton;
- (void)_updateRestoreButton;
- (void)_updateSelectAllButton;
- (void)dataSource:(id)a3 itemTapped:(id)a4;
- (void)didSelectRestoreExpiredSubscriptions:(id)a3 completionHandler:(id)a4;
- (void)dismissExpiredViewControllerIfNecessary;
- (void)setCancelButtonItem:(id)a3;
- (void)setClearButtonItem:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeselectAllButtonItem:(id)a3;
- (void)setDoneButtonItem:(id)a3;
- (void)setEditButtonItem:(id)a3;
- (void)setNavBar:(id)a3;
- (void)setOfflineMapsDataSource:(id)a3;
- (void)setRestoreButtonItem:(id)a3;
- (void)setSelectAllButtonItem:(id)a3;
- (void)setToolbar:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation OfflineMapsManagementExpiredViewController

+ (BOOL)wantsDefaultHeaderContentViews
{
  return 1;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)OfflineMapsManagementExpiredViewController;
  [(ContaineeViewController *)&v3 viewDidLoad];
  [(OfflineMapsManagementExpiredViewController *)self _setupViews];
  [(OfflineMapsManagementExpiredViewController *)self _setupConstraints];
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)OfflineMapsManagementExpiredViewController;
  [(ContaineeViewController *)&v10 viewWillAppear:a3];
  v4 = [OfflineMapsManagementExpiredDataSource alloc];
  v5 = [(OfflineMapsManagementExpiredViewController *)self collectionView];
  v6 = [(OfflineMapsManagementExpiredDataSource *)v4 initWithCollectionView:v5 updateLocation:0];
  [(OfflineMapsManagementExpiredViewController *)self setOfflineMapsDataSource:v6];

  v7 = [(OfflineMapsManagementExpiredViewController *)self offlineMapsDataSource];
  [v7 setDelegate:self];

  v8 = [(OfflineMapsManagementExpiredViewController *)self offlineMapsDataSource];
  [v8 setOfflineDelegate:self];

  v9 = [(OfflineMapsManagementExpiredViewController *)self offlineMapsDataSource];
  [v9 setActive:1];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)OfflineMapsManagementExpiredViewController;
  [(ContaineeViewController *)&v5 viewWillDisappear:a3];
  v4 = [(OfflineMapsManagementExpiredViewController *)self offlineMapsDataSource];
  [v4 setActive:0];
}

- (void)_setupViews
{
  objc_super v3 = [(ContaineeViewController *)self cardPresentationController];
  [v3 setPresentedModally:1];

  v4 = [(ContaineeViewController *)self cardPresentationController];
  [v4 setTakesAvailableHeight:1];

  objc_super v5 = +[UIColor clearColor];
  v6 = [(OfflineMapsManagementExpiredViewController *)self view];
  [v6 setBackgroundColor:v5];

  id v7 = objc_alloc((Class)UIBarButtonItem);
  v8 = sub_100AEBDC4();
  id v9 = [v7 initWithTitle:v8 style:2 target:self action:"_dismiss"];
  [(OfflineMapsManagementExpiredViewController *)self setDoneButtonItem:v9];

  id v10 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:2 target:self action:"_toggleEditing"];
  [(OfflineMapsManagementExpiredViewController *)self setEditButtonItem:v10];

  id v11 = objc_alloc((Class)UIBarButtonItem);
  v12 = +[NSBundle mainBundle];
  v13 = [v12 localizedStringForKey:@"Select All" value:@"localized string not found" table:@"Offline"];
  id v14 = [v11 initWithTitle:v13 style:0 target:self action:"_toggleSelectAll"];
  [(OfflineMapsManagementExpiredViewController *)self setSelectAllButtonItem:v14];

  id v15 = objc_alloc((Class)UIBarButtonItem);
  v16 = +[NSBundle mainBundle];
  v17 = [v16 localizedStringForKey:@"Deselect All" value:@"localized string not found" table:@"Offline"];
  id v18 = [v15 initWithTitle:v17 style:0 target:self action:"_toggleSelectAll"];
  [(OfflineMapsManagementExpiredViewController *)self setDeselectAllButtonItem:v18];

  id v19 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"_toggleEditing"];
  [(OfflineMapsManagementExpiredViewController *)self setCancelButtonItem:v19];

  id v20 = objc_alloc((Class)UINavigationItem);
  v21 = +[NSBundle mainBundle];
  v22 = [v21 localizedStringForKey:@"EXPIRED_MAPS_TITLE" value:@"localized string not found" table:@"Offline"];
  id v23 = [v20 initWithTitle:v22];

  v24 = [(OfflineMapsManagementExpiredViewController *)self doneButtonItem];
  [v23 setRightBarButtonItem:v24];

  v25 = [(OfflineMapsManagementExpiredViewController *)self editButtonItem];
  [v23 setLeftBarButtonItem:v25];

  id v26 = objc_alloc_init((Class)UINavigationBar);
  [(OfflineMapsManagementExpiredViewController *)self setNavBar:v26];

  v27 = [(OfflineMapsManagementExpiredViewController *)self navBar];
  [v27 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v28 = objc_alloc_init((Class)UINavigationBarAppearance);
  [v28 configureWithTransparentBackground];
  v29 = [(OfflineMapsManagementExpiredViewController *)self navBar];
  [v29 setStandardAppearance:v28];

  v30 = [(OfflineMapsManagementExpiredViewController *)self navBar];
  [v30 pushNavigationItem:v23 animated:0];

  v31 = [(ContaineeViewController *)self headerView];
  v32 = [(OfflineMapsManagementExpiredViewController *)self navBar];
  [v31 addSubview:v32];

  objc_initWeak(&location, self);
  id v33 = objc_alloc((Class)UICollectionViewCompositionalLayout);
  v66 = _NSConcreteStackBlock;
  uint64_t v67 = 3221225472;
  v68 = sub_100BB5478;
  v69 = &unk_1012EF3A8;
  objc_copyWeak(&v70, &location);
  id v34 = [v33 initWithSectionProvider:&v66];
  id v35 = objc_alloc((Class)UICollectionView);
  id v36 = [v35 initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height, v66, v67, v68, v69];
  [(OfflineMapsManagementExpiredViewController *)self setCollectionView:v36];

  v37 = [(OfflineMapsManagementExpiredViewController *)self collectionView];
  [v37 setTranslatesAutoresizingMaskIntoConstraints:0];

  v38 = +[UIColor clearColor];
  v39 = [(OfflineMapsManagementExpiredViewController *)self collectionView];
  [v39 setBackgroundColor:v38];

  v40 = [(OfflineMapsManagementExpiredViewController *)self collectionView];
  [v40 setAllowsSelection:1];

  v41 = [(OfflineMapsManagementExpiredViewController *)self collectionView];
  [v41 setAllowsSelectionDuringEditing:1];

  v42 = [(OfflineMapsManagementExpiredViewController *)self collectionView];
  [v42 setAllowsMultipleSelectionDuringEditing:1];

  v43 = [(ContaineeViewController *)self contentView];
  v44 = [(OfflineMapsManagementExpiredViewController *)self collectionView];
  [v43 addSubview:v44];

  id v45 = objc_alloc((Class)UIBarButtonItem);
  v46 = +[NSBundle mainBundle];
  v47 = [v46 localizedStringForKey:@"Clear" value:@"localized string not found" table:@"Offline"];
  id v48 = [v45 initWithTitle:v47 style:0 target:self action:"_clearSelectedMaps"];
  [(OfflineMapsManagementExpiredViewController *)self setClearButtonItem:v48];

  v49 = [(OfflineMapsManagementExpiredViewController *)self clearButtonItem];
  v50 = +[UIColor systemRedColor];
  [v49 setTintColor:v50];

  v51 = [(OfflineMapsManagementExpiredViewController *)self clearButtonItem];
  [v51 setEnabled:0];

  id v52 = objc_alloc((Class)UIBarButtonItem);
  v53 = +[NSBundle mainBundle];
  v54 = [v53 localizedStringForKey:@"Restore" value:@"localized string not found" table:@"Offline"];
  id v55 = [v52 initWithTitle:v54 style:0 target:self action:"_restoreSelectedMaps"];
  [(OfflineMapsManagementExpiredViewController *)self setRestoreButtonItem:v55];

  v56 = [(OfflineMapsManagementExpiredViewController *)self restoreButtonItem];
  [v56 setEnabled:0];

  id v57 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
  id v58 = objc_alloc_init((Class)UIToolbar);
  [(OfflineMapsManagementExpiredViewController *)self setToolbar:v58];

  v59 = [(OfflineMapsManagementExpiredViewController *)self toolbar];
  [v59 setTranslatesAutoresizingMaskIntoConstraints:0];

  v60 = [(OfflineMapsManagementExpiredViewController *)self toolbar];
  v61 = [(OfflineMapsManagementExpiredViewController *)self clearButtonItem];
  v72[0] = v61;
  v72[1] = v57;
  v62 = [(OfflineMapsManagementExpiredViewController *)self restoreButtonItem];
  v72[2] = v62;
  v63 = +[NSArray arrayWithObjects:v72 count:3];
  [v60 setItems:v63];

  v64 = [(ContaineeViewController *)self contentView];
  v65 = [(OfflineMapsManagementExpiredViewController *)self toolbar];
  [v64 addSubview:v65];

  [(OfflineMapsManagementExpiredViewController *)self setAccessibilityIdentifier:@"OfflineMapsExpiredView"];
  objc_destroyWeak(&v70);
  objc_destroyWeak(&location);
}

- (void)_setupConstraints
{
  objc_super v3 = [(OfflineMapsManagementExpiredViewController *)self toolbar];
  v4 = [v3 topAnchor];
  objc_super v5 = [(ContaineeViewController *)self contentView];
  v6 = [v5 bottomAnchor];
  id v7 = [v4 constraintEqualToAnchor:v6];
  toolbarHiddenConstraint = self->_toolbarHiddenConstraint;
  self->_toolbarHiddenConstraint = v7;

  id v9 = [(OfflineMapsManagementExpiredViewController *)self toolbar];
  id v10 = [v9 bottomAnchor];
  id v11 = [(ContaineeViewController *)self contentView];
  v12 = [v11 safeAreaLayoutGuide];
  v13 = [v12 bottomAnchor];
  id v14 = [v10 constraintEqualToAnchor:v13];
  toolbarVisibleConstraint = self->_toolbarVisibleConstraint;
  self->_toolbarVisibleConstraint = v14;

  uint64_t v67 = [(OfflineMapsManagementExpiredViewController *)self navBar];
  v65 = [v67 topAnchor];
  v66 = [(ContaineeViewController *)self headerView];
  v64 = [v66 topAnchor];
  v63 = [v65 constraintEqualToAnchor:v64];
  v68[0] = v63;
  v62 = [(OfflineMapsManagementExpiredViewController *)self navBar];
  v60 = [v62 leadingAnchor];
  v61 = [(ContaineeViewController *)self headerView];
  v59 = [v61 leadingAnchor];
  id v58 = [v60 constraintEqualToAnchor:v59];
  v68[1] = v58;
  id v57 = [(OfflineMapsManagementExpiredViewController *)self navBar];
  id v55 = [v57 trailingAnchor];
  v56 = [(ContaineeViewController *)self headerView];
  v54 = [v56 trailingAnchor];
  v53 = [v55 constraintEqualToAnchor:v54];
  v68[2] = v53;
  id v52 = [(OfflineMapsManagementExpiredViewController *)self navBar];
  v50 = [v52 bottomAnchor];
  v51 = [(ContaineeViewController *)self headerView];
  v49 = [v51 bottomAnchor];
  id v48 = [v50 constraintEqualToAnchor:v49];
  v68[3] = v48;
  v47 = [(OfflineMapsManagementExpiredViewController *)self collectionView];
  id v45 = [v47 topAnchor];
  v46 = [(ContaineeViewController *)self contentView];
  v44 = [v46 topAnchor];
  v43 = [v45 constraintEqualToAnchor:v44];
  v68[4] = v43;
  v42 = [(OfflineMapsManagementExpiredViewController *)self collectionView];
  v40 = [v42 leadingAnchor];
  v41 = [(ContaineeViewController *)self contentView];
  v39 = [v41 leadingAnchor];
  v38 = [v40 constraintEqualToAnchor:v39];
  v68[5] = v38;
  v37 = [(OfflineMapsManagementExpiredViewController *)self collectionView];
  id v35 = [v37 trailingAnchor];
  id v36 = [(ContaineeViewController *)self contentView];
  id v34 = [v36 trailingAnchor];
  id v33 = [v35 constraintEqualToAnchor:v34];
  v68[6] = v33;
  v32 = [(OfflineMapsManagementExpiredViewController *)self collectionView];
  v30 = [v32 bottomAnchor];
  v31 = [(ContaineeViewController *)self contentView];
  v29 = [v31 bottomAnchor];
  id v28 = [v30 constraintEqualToAnchor:v29];
  v68[7] = v28;
  v27 = [(OfflineMapsManagementExpiredViewController *)self toolbar];
  v16 = [v27 leadingAnchor];
  v17 = [(ContaineeViewController *)self contentView];
  id v18 = [v17 leadingAnchor];
  id v19 = [v16 constraintEqualToAnchor:v18];
  v68[8] = v19;
  id v20 = [(OfflineMapsManagementExpiredViewController *)self toolbar];
  v21 = [v20 trailingAnchor];
  v22 = [(ContaineeViewController *)self contentView];
  id v23 = [v22 trailingAnchor];
  v24 = [v21 constraintEqualToAnchor:v23];
  v25 = self->_toolbarHiddenConstraint;
  v68[9] = v24;
  v68[10] = v25;
  id v26 = +[NSArray arrayWithObjects:v68 count:11];
  +[NSLayoutConstraint activateConstraints:v26];
}

- (void)_dismiss
{
  id v2 = [(OfflineMapsManagementExpiredViewController *)self delegate];
  [v2 closeExpiredMapsManagement];
}

- (void)_toggleEditing
{
  objc_super v3 = [(OfflineMapsManagementExpiredViewController *)self collectionView];
  uint64_t v4 = [v3 isEditing] ^ 1;
  objc_super v5 = [(OfflineMapsManagementExpiredViewController *)self collectionView];
  [v5 setEditing:v4];

  v6 = [(OfflineMapsManagementExpiredViewController *)self collectionView];
  unsigned int v7 = [v6 isEditing];

  if (v7)
  {
    v8 = [(OfflineMapsManagementExpiredViewController *)self selectAllButtonItem];
    id v9 = [(OfflineMapsManagementExpiredViewController *)self navBar];
    id v10 = [v9 topItem];
    [v10 setRightBarButtonItem:v8];

    [(OfflineMapsManagementExpiredViewController *)self cancelButtonItem];
  }
  else
  {
    id v11 = [(OfflineMapsManagementExpiredViewController *)self doneButtonItem];
    v12 = [(OfflineMapsManagementExpiredViewController *)self navBar];
    v13 = [v12 topItem];
    [v13 setRightBarButtonItem:v11];

    [(OfflineMapsManagementExpiredViewController *)self editButtonItem];
  id v14 = };
  id v15 = [(OfflineMapsManagementExpiredViewController *)self navBar];
  v16 = [v15 topItem];
  [v16 setLeftBarButtonItem:v14];

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100BB5F8C;
  v24[3] = &unk_1012E6300;
  char v25 = v7 ^ 1;
  v24[4] = self;
  +[UIView animateWithDuration:v24 animations:UINavigationControllerHideShowBarDuration];
  if (v7)
  {
    v17 = [(OfflineMapsManagementExpiredViewController *)self toolbar];
    [v17 frame];
    double Height = CGRectGetHeight(v26);

    double top = 0.0;
    double left = 0.0;
    double right = 0.0;
  }
  else
  {
    double top = UIEdgeInsetsZero.top;
    double left = UIEdgeInsetsZero.left;
    double Height = UIEdgeInsetsZero.bottom;
    double right = UIEdgeInsetsZero.right;
  }
  v22 = [(OfflineMapsManagementExpiredViewController *)self collectionView];
  [v22 setContentInset:top, left, Height, right];

  id v23 = [(OfflineMapsManagementExpiredViewController *)self collectionView];
  [v23 setVerticalScrollIndicatorInsets:top, left, Height, right];
}

- (void)_toggleSelectAll
{
  objc_super v3 = [(OfflineMapsManagementExpiredViewController *)self collectionView];
  uint64_t v4 = (uint64_t)[v3 numberOfItemsInSection:0];

  objc_super v5 = [(OfflineMapsManagementExpiredViewController *)self collectionView];
  v6 = [v5 indexPathsForSelectedItems];
  id v7 = [v6 count];

  if (v4 >= 1)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      id v9 = +[NSIndexPath indexPathForRow:i inSection:0];
      id v10 = [(OfflineMapsManagementExpiredViewController *)self collectionView];
      id v11 = v10;
      if (v7 == (id)v4) {
        [v10 deselectItemAtIndexPath:v9 animated:0];
      }
      else {
        [v10 selectItemAtIndexPath:v9 animated:0 scrollPosition:0];
      }
    }
  }
  [(OfflineMapsManagementExpiredViewController *)self _updateSelectAllButton];
  [(OfflineMapsManagementExpiredViewController *)self _updateRestoreButton];

  [(OfflineMapsManagementExpiredViewController *)self _updateClearButton];
}

- (void)_updateSelectAllButton
{
  objc_super v3 = [(OfflineMapsManagementExpiredViewController *)self collectionView];
  id v4 = [v3 numberOfItemsInSection:0];

  objc_super v5 = [(OfflineMapsManagementExpiredViewController *)self collectionView];
  v6 = [v5 indexPathsForSelectedItems];
  id v7 = [v6 count];

  if (v7 == v4) {
    [(OfflineMapsManagementExpiredViewController *)self deselectAllButtonItem];
  }
  else {
  id v10 = [(OfflineMapsManagementExpiredViewController *)self selectAllButtonItem];
  }
  v8 = [(OfflineMapsManagementExpiredViewController *)self navBar];
  id v9 = [v8 topItem];
  [v9 setRightBarButtonItem:v10];
}

- (void)_updateRestoreButton
{
  id v5 = [(OfflineMapsManagementExpiredViewController *)self offlineMapsDataSource];
  id v3 = [v5 canRestoreSelectedMaps];
  id v4 = [(OfflineMapsManagementExpiredViewController *)self restoreButtonItem];
  [v4 setEnabled:v3];
}

- (void)_updateClearButton
{
  id v6 = [(OfflineMapsManagementExpiredViewController *)self collectionView];
  id v3 = [v6 indexPathsForSelectedItems];
  BOOL v4 = [v3 count] != 0;
  id v5 = [(OfflineMapsManagementExpiredViewController *)self clearButtonItem];
  [v5 setEnabled:v4];
}

- (void)_clearSelectedMaps
{
  id v2 = [(OfflineMapsManagementExpiredViewController *)self offlineMapsDataSource];
  [v2 clearSelectedMaps];

  +[GEOAPPortal captureUserAction:389 target:87 value:0];
}

- (void)_restoreSelectedMaps
{
  id v2 = [(OfflineMapsManagementExpiredViewController *)self offlineMapsDataSource];
  [v2 restoreSelectedMaps];

  +[GEOAPPortal captureUserAction:388 target:87 value:0];
}

- (void)dataSource:(id)a3 itemTapped:(id)a4
{
  [(OfflineMapsManagementExpiredViewController *)self _updateSelectAllButton];
  [(OfflineMapsManagementExpiredViewController *)self _updateRestoreButton];

  [(OfflineMapsManagementExpiredViewController *)self _updateClearButton];
}

- (void)didSelectRestoreExpiredSubscriptions:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(OfflineMapsManagementExpiredViewController *)self delegate];
  [v8 restoreExpiredSubscriptions:v7 completionHandler:v6];
}

- (void)dismissExpiredViewControllerIfNecessary
{
  id v3 = [(OfflineMapsManagementExpiredViewController *)self collectionView];
  id v4 = [v3 numberOfItemsInSection:0];

  if (!v4)
  {
    [(OfflineMapsManagementExpiredViewController *)self _dismiss];
  }
}

- (OfflineMapsManagementActionCoordination)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (OfflineMapsManagementActionCoordination *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UINavigationBar)navBar
{
  return self->_navBar;
}

- (void)setNavBar:(id)a3
{
}

- (UIBarButtonItem)doneButtonItem
{
  return self->_doneButtonItem;
}

- (void)setDoneButtonItem:(id)a3
{
}

- (UIBarButtonItem)editButtonItem
{
  return self->_editButtonItem;
}

- (void)setEditButtonItem:(id)a3
{
}

- (UIBarButtonItem)selectAllButtonItem
{
  return self->_selectAllButtonItem;
}

- (void)setSelectAllButtonItem:(id)a3
{
}

- (UIBarButtonItem)deselectAllButtonItem
{
  return self->_deselectAllButtonItem;
}

- (void)setDeselectAllButtonItem:(id)a3
{
}

- (UIBarButtonItem)cancelButtonItem
{
  return self->_cancelButtonItem;
}

- (void)setCancelButtonItem:(id)a3
{
}

- (UIBarButtonItem)restoreButtonItem
{
  return self->_restoreButtonItem;
}

- (void)setRestoreButtonItem:(id)a3
{
}

- (UIBarButtonItem)clearButtonItem
{
  return self->_clearButtonItem;
}

- (void)setClearButtonItem:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (OfflineMapsManagementExpiredDataSource)offlineMapsDataSource
{
  return self->_offlineMapsDataSource;
}

- (void)setOfflineMapsDataSource:(id)a3
{
}

- (UIToolbar)toolbar
{
  return self->_toolbar;
}

- (void)setToolbar:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_offlineMapsDataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_clearButtonItem, 0);
  objc_storeStrong((id *)&self->_restoreButtonItem, 0);
  objc_storeStrong((id *)&self->_cancelButtonItem, 0);
  objc_storeStrong((id *)&self->_deselectAllButtonItem, 0);
  objc_storeStrong((id *)&self->_selectAllButtonItem, 0);
  objc_storeStrong((id *)&self->_editButtonItem, 0);
  objc_storeStrong((id *)&self->_doneButtonItem, 0);
  objc_storeStrong((id *)&self->_navBar, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_toolbarVisibleConstraint, 0);

  objc_storeStrong((id *)&self->_toolbarHiddenConstraint, 0);
}

@end