@interface OfflineMapsManagementViewController
+ (BOOL)wantsDefaultHeaderContentViews;
- (ContainerHeaderView)titleHeaderView;
- (OfflineMapsManagementActionCoordination)delegate;
- (OfflineMapsManagementDataSource)offlineMapsDataSource;
- (UICollectionView)collectionView;
- (void)_setupConstraints;
- (void)_setupViews;
- (void)_updateHairlineAlpha:(BOOL)a3;
- (void)dataSource:(id)a3 itemTapped:(id)a4;
- (void)dataSourceUpdated:(id)a3;
- (void)didSelectDownloadNewMap;
- (void)didSelectExpiredMaps;
- (void)didSelectRenameSubscriptionInfo:(id)a3 completionHandler:(id)a4;
- (void)didSelectResumeSubscriptionInfo:(id)a3;
- (void)didSelectSuggestion:(id)a3;
- (void)didSelectUpdateAll;
- (void)didSetSyncToWatch:(BOOL)a3 completionHandler:(id)a4;
- (void)handleDismissAction:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOfflineMapsDataSource:(id)a3;
- (void)setTitleHeaderView:(id)a3;
- (void)showPairedDeviceDiskSpaceDialogWithRequiredDiskSpace:(int64_t)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willDismissByGesture;
@end

@implementation OfflineMapsManagementViewController

+ (BOOL)wantsDefaultHeaderContentViews
{
  return 1;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)OfflineMapsManagementViewController;
  [(ContaineeViewController *)&v4 viewDidLoad];
  [(OfflineMapsManagementViewController *)self _setupViews];
  [(OfflineMapsManagementViewController *)self _setupConstraints];
  v3 = +[NSUserDefaults standardUserDefaults];
  [v3 setBool:1 forKey:@"OfflineMapsUserHasOpenedOfflineManagementScreenKey"];
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)OfflineMapsManagementViewController;
  [(ContaineeViewController *)&v10 viewWillAppear:a3];
  objc_super v4 = [OfflineMapsManagementDataSource alloc];
  v5 = [(OfflineMapsManagementViewController *)self collectionView];
  v6 = [(OfflineMapsManagementDataSource *)v4 initWithCollectionView:v5 updateLocation:0];
  [(OfflineMapsManagementViewController *)self setOfflineMapsDataSource:v6];

  v7 = [(OfflineMapsManagementViewController *)self offlineMapsDataSource];
  [v7 setDelegate:self];

  v8 = [(OfflineMapsManagementViewController *)self offlineMapsDataSource];
  [v8 setOfflineDelegate:self];

  v9 = [(OfflineMapsManagementViewController *)self offlineMapsDataSource];
  [v9 setActive:1];

  [(OfflineMapsManagementViewController *)self _updateHairlineAlpha:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)OfflineMapsManagementViewController;
  [(ContaineeViewController *)&v5 viewWillDisappear:a3];
  objc_super v4 = [(OfflineMapsManagementViewController *)self offlineMapsDataSource];
  [v4 setActive:0];
}

- (void)_setupViews
{
  v3 = [(ContaineeViewController *)self cardPresentationController];
  [v3 setPresentedModally:1];

  objc_super v4 = [(ContaineeViewController *)self cardPresentationController];
  [v4 setTakesAvailableHeight:1];

  objc_super v5 = [(ContaineeViewController *)self cardPresentationController];
  [v5 setAllowsSwipeToDismiss:0];

  v6 = +[UIColor clearColor];
  v7 = [(OfflineMapsManagementViewController *)self view];
  [v7 setBackgroundColor:v6];

  v8 = [(OfflineMapsManagementViewController *)self view];
  [v8 setAccessibilityIdentifier:@"OfflineMapsView"];

  v9 = [ContainerHeaderView alloc];
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v13 = -[ContainerHeaderView initWithFrame:](v9, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(OfflineMapsManagementViewController *)self setTitleHeaderView:v13];

  v14 = [(OfflineMapsManagementViewController *)self titleHeaderView];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

  v15 = [(OfflineMapsManagementViewController *)self titleHeaderView];
  [v15 setDelegate:self];

  v16 = [(OfflineMapsManagementViewController *)self titleHeaderView];
  [v16 setHeaderSize:2];

  v17 = [(OfflineMapsManagementViewController *)self titleHeaderView];
  [v17 setHairLineAlpha:0.0];

  v18 = +[UIColor clearColor];
  v19 = [(OfflineMapsManagementViewController *)self titleHeaderView];
  [v19 setBackgroundColor:v18];

  v20 = +[NSBundle mainBundle];
  v21 = [v20 localizedStringForKey:@"Offline Maps" value:@"localized string not found" table:@"Offline"];
  v22 = [(OfflineMapsManagementViewController *)self titleHeaderView];
  [v22 setTitle:v21];

  v23 = [(ContaineeViewController *)self headerView];
  v24 = [(OfflineMapsManagementViewController *)self titleHeaderView];
  [v23 addSubview:v24];

  objc_initWeak(&location, self);
  id v25 = objc_alloc((Class)UICollectionViewCompositionalLayout);
  v35 = _NSConcreteStackBlock;
  uint64_t v36 = 3221225472;
  v37 = sub_100C6F280;
  v38 = &unk_1012EF3A8;
  objc_copyWeak(&v39, &location);
  id v26 = [v25 initWithSectionProvider:&v35];
  id v27 = objc_alloc((Class)UICollectionView);
  id v28 = [v27 initWithFrame:v26 collectionViewLayout:CGRectZero.origin.x, y, width, height, v35, v36, v37, v38];
  [(OfflineMapsManagementViewController *)self setCollectionView:v28];

  v29 = [(OfflineMapsManagementViewController *)self collectionView];
  [v29 setTranslatesAutoresizingMaskIntoConstraints:0];

  v30 = +[UIColor clearColor];
  v31 = [(OfflineMapsManagementViewController *)self collectionView];
  [v31 setBackgroundColor:v30];

  v32 = [(OfflineMapsManagementViewController *)self collectionView];
  [v32 setAccessibilityIdentifier:@"OfflineMapsCollectionView"];

  v33 = [(ContaineeViewController *)self contentView];
  v34 = [(OfflineMapsManagementViewController *)self collectionView];
  [v33 addSubview:v34];

  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);
}

- (void)_setupConstraints
{
  v43 = [(OfflineMapsManagementViewController *)self titleHeaderView];
  v41 = [v43 topAnchor];
  v42 = [(ContaineeViewController *)self headerView];
  v40 = [v42 topAnchor];
  id v39 = [v41 constraintEqualToAnchor:v40];
  v44[0] = v39;
  v38 = [(OfflineMapsManagementViewController *)self titleHeaderView];
  uint64_t v36 = [v38 leadingAnchor];
  v37 = [(ContaineeViewController *)self headerView];
  v35 = [v37 leadingAnchor];
  v34 = [v36 constraintEqualToAnchor:v35];
  v44[1] = v34;
  v33 = [(OfflineMapsManagementViewController *)self titleHeaderView];
  v31 = [v33 trailingAnchor];
  v32 = [(ContaineeViewController *)self headerView];
  v30 = [v32 trailingAnchor];
  v29 = [v31 constraintEqualToAnchor:v30];
  v44[2] = v29;
  id v28 = [(OfflineMapsManagementViewController *)self titleHeaderView];
  id v26 = [v28 bottomAnchor];
  id v27 = [(ContaineeViewController *)self headerView];
  id v25 = [v27 bottomAnchor];
  v24 = [v26 constraintEqualToAnchor:v25];
  v44[3] = v24;
  v23 = [(OfflineMapsManagementViewController *)self collectionView];
  v21 = [v23 topAnchor];
  v22 = [(ContaineeViewController *)self contentView];
  v20 = [v22 topAnchor];
  v19 = [v21 constraintEqualToAnchor:v20];
  v44[4] = v19;
  v18 = [(OfflineMapsManagementViewController *)self collectionView];
  v16 = [v18 leadingAnchor];
  v17 = [(ContaineeViewController *)self contentView];
  v15 = [v17 leadingAnchor];
  v14 = [v16 constraintEqualToAnchor:v15];
  v44[5] = v14;
  v13 = [(OfflineMapsManagementViewController *)self collectionView];
  v3 = [v13 trailingAnchor];
  objc_super v4 = [(ContaineeViewController *)self contentView];
  objc_super v5 = [v4 trailingAnchor];
  v6 = [v3 constraintEqualToAnchor:v5];
  v44[6] = v6;
  v7 = [(OfflineMapsManagementViewController *)self collectionView];
  v8 = [v7 bottomAnchor];
  v9 = [(ContaineeViewController *)self contentView];
  objc_super v10 = [v9 bottomAnchor];
  v11 = [v8 constraintEqualToAnchor:v10];
  v44[7] = v11;
  v12 = +[NSArray arrayWithObjects:v44 count:8];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (void)handleDismissAction:(id)a3
{
  id v3 = [(OfflineMapsManagementViewController *)self delegate];
  [v3 closeOfflineMapsManagement];
}

- (void)willDismissByGesture
{
  id v2 = [(OfflineMapsManagementViewController *)self delegate];
  [v2 closeOfflineMapsManagement];
}

- (void)_updateHairlineAlpha:(BOOL)a3
{
  objc_super v4 = [(OfflineMapsManagementViewController *)self collectionView];
  unsigned int v5 = [v4 _maps_shouldShowTopHairline];

  double v6 = 0.0;
  if (v5) {
    double v6 = 1.0;
  }
  v7[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100C6FC5C;
  v8[3] = &unk_1012EB708;
  v8[4] = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100C6FC70;
  v7[3] = &unk_1012EB730;
  +[UIScrollView _maps_updateTopHairlineAlpha:1 animated:v8 getter:v7 setter:v6];
}

- (void)scrollViewDidScroll:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)OfflineMapsManagementViewController;
  [(ContaineeViewController *)&v4 scrollViewDidScroll:a3];
  [(OfflineMapsManagementViewController *)self _updateHairlineAlpha:1];
}

- (void)dataSourceUpdated:(id)a3
{
  objc_super v4 = [(OfflineMapsManagementViewController *)self collectionView];
  if ([v4 numberOfSections] == (id)1)
  {
    unsigned int v5 = [(OfflineMapsManagementViewController *)self offlineMapsDataSource];
    double v6 = [v5 sectionForSectionIndex:0];
    id v7 = [v6 sectionType];

    if (!v7)
    {
      v8 = [(OfflineMapsManagementViewController *)self collectionView];
      id v10 = v8;
      uint64_t v9 = 2;
      goto LABEL_6;
    }
  }
  else
  {
  }
  v8 = [(OfflineMapsManagementViewController *)self collectionView];
  id v10 = v8;
  uint64_t v9 = 0;
LABEL_6:
  [v8 setContentInsetAdjustmentBehavior:v9];
}

- (void)dataSource:(id)a3 itemTapped:(id)a4
{
  id v12 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v12;
    double v6 = [(OfflineMapsManagementViewController *)self delegate];
    [v6 presentOfflineMapDetailsForSubscriptionInfo:v5];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v12;
    v8 = [v7 tableRow];
    uint64_t v9 = [v8 selectionAction];

    if (v9)
    {
      id v10 = [v7 tableRow];
      v11 = [v10 selectionAction];
      v11[2]();
    }
  }
}

- (void)didSelectDownloadNewMap
{
  id v2 = [(OfflineMapsManagementViewController *)self delegate];
  [v2 presentAddNewMapSearchAutocomplete];
}

- (void)didSelectSuggestion:(id)a3
{
  id v4 = a3;
  id v7 = [(OfflineMapsManagementViewController *)self delegate];
  id v5 = [v4 mapRegion];
  double v6 = [v4 regionName];

  [v7 presentOfflineMapRegionSelectorForRegion:v5 name:v6];
}

- (void)didSelectRenameSubscriptionInfo:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(OfflineMapsManagementViewController *)self delegate];
  [v8 presentRenameOfflineMapForSubscriptionInfo:v7 completionHandler:v6];
}

- (void)didSelectResumeSubscriptionInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(OfflineMapsManagementViewController *)self delegate];
  [v5 resumeDownloadingForSubscriptionInfo:v4];
}

- (void)didSelectUpdateAll
{
  id v2 = [(OfflineMapsManagementViewController *)self delegate];
  [v2 startUpdatingOfflineSubscriptions];
}

- (void)didSelectExpiredMaps
{
  id v2 = [(OfflineMapsManagementViewController *)self delegate];
  [v2 presentExpiredMapsManagement];
}

- (void)didSetSyncToWatch:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(OfflineMapsManagementViewController *)self delegate];
  [v7 setSyncToWatch:v4 completionHandler:v6];
}

- (void)showPairedDeviceDiskSpaceDialogWithRequiredDiskSpace:(int64_t)a3
{
  id v4 = [(OfflineMapsManagementViewController *)self delegate];
  [v4 showPairedDeviceDiskSpaceDialogWithRequiredDiskSpace:a3];
}

- (OfflineMapsManagementActionCoordination)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (OfflineMapsManagementActionCoordination *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ContainerHeaderView)titleHeaderView
{
  return self->_titleHeaderView;
}

- (void)setTitleHeaderView:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (OfflineMapsManagementDataSource)offlineMapsDataSource
{
  return self->_offlineMapsDataSource;
}

- (void)setOfflineMapsDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offlineMapsDataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_titleHeaderView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end