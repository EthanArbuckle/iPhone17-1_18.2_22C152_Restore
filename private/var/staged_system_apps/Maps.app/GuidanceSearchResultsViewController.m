@interface GuidanceSearchResultsViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_isEmpty;
- (BOOL)isHeaderHidden;
- (GuidanceSearchResultsView)resultsView;
- (GuidanceSearchResultsViewController)init;
- (GuidanceSearchResultsViewController)initWithViewModel:(id)a3;
- (GuidanceSearchResultsViewModel)viewModel;
- (NavActionCoordination)navContaineeDelegate;
- (SearchResultsDataSource)dataSource;
- (double)_mediumLayoutHeightInSAR;
- (double)heightForLayout:(unint64_t)a3;
- (id)contentView;
- (id)headerView;
- (int)currentMapViewTargetForAnalytics;
- (int)currentUITargetForAnalytics;
- (int)listForDataSource:(id)a3;
- (unint64_t)defaultLayoutForContainerStyle:(unint64_t)a3 traitCollection:(id)a4;
- (unint64_t)maxLayoutForEdgeInsetsUpdate;
- (void)_updateLayoutWithContainerStyle:(unint64_t)a3 traitCollection:(id)a4;
- (void)applyAlphaToContent:(double)a3;
- (void)configureWithViewModel:(id)a3;
- (void)dataSource:(id)a3 itemTapped:(id)a4;
- (void)dataSourceUpdated:(id)a3;
- (void)didChangePersonalItems:(id)a3;
- (void)didTapOnAddStopAtIndex:(unint64_t)a3;
- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4;
- (void)headerViewTapped:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)searchResultTableViewCellDidTapActionButton:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setHideHeader:(BOOL)a3;
- (void)setNavContaineeDelegate:(id)a3;
- (void)setResultsView:(id)a3;
- (void)viewDidLoad;
- (void)viewModelDidFinishLoading:(id)a3 error:(id)a4;
- (void)viewModelWillStartLoading:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)willChangeContainerStyle:(unint64_t)a3;
- (void)willChangeLayout:(unint64_t)a3;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation GuidanceSearchResultsViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (GuidanceSearchResultsViewController)initWithViewModel:(id)a3
{
  id v5 = a3;
  v6 = [(GuidanceSearchResultsViewController *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewModel, a3);
    [(GuidanceSearchResultsViewModel *)v7->_viewModel setDelegate:v7];
  }

  return v7;
}

- (GuidanceSearchResultsViewController)init
{
  v8.receiver = self;
  v8.super_class = (Class)GuidanceSearchResultsViewController;
  v2 = [(GuidanceSearchResultsViewController *)&v8 initWithNibName:0 bundle:0];
  v3 = v2;
  if (v2)
  {
    v4 = [(ContaineeViewController *)v2 cardPresentationController];
    [v4 setBlurInCardView:0];

    id v5 = +[UIColor colorNamed:@"NavigationMaterialColor"];
    v6 = [(ContaineeViewController *)v3 cardPresentationController];
    [v6 setCardColor:v5];
  }
  return v3;
}

- (void)configureWithViewModel:(id)a3
{
  id v5 = (GuidanceSearchResultsViewModel *)a3;
  p_viewModel = &self->_viewModel;
  if (self->_viewModel != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_viewModel, a3);
    [(GuidanceSearchResultsViewModel *)*p_viewModel setDelegate:self];
    [(GuidanceSearchResultsViewModel *)*p_viewModel loadDataIfNeeded];
    id v5 = v7;
  }
}

- (void)didChangePersonalItems:(id)a3
{
  v4 = [(GuidanceSearchResultsViewController *)self viewModel];
  id v5 = [v4 results];
  id v6 = [v5 count];

  v7 = [(GuidanceSearchResultsViewController *)self viewModel];
  objc_super v8 = [v7 results];
  v9 = v8;
  if (v6 == (id)1)
  {
    v10 = [v8 firstObject];

    v11 = sub_100109E50();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = [v10 name];
      int v25 = 138412290;
      v26 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "SAR: didChangePersonalItems. Opening placecard with map Item: %@", (uint8_t *)&v25, 0xCu);
    }
    v13 = [(GuidanceSearchResultsViewController *)self navContaineeDelegate];
    [v13 selectMapItem:v10 shouldRemoveResults:1];

    goto LABEL_14;
  }
  id v14 = [v8 count];

  if ((unint64_t)v14 < 2) {
    return;
  }
  v15 = [(GuidanceSearchResultsViewController *)self navContaineeDelegate];
  v10 = [v15 currentSearchInfo];

  if ([v10 selectedIndex] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v16 = [v10 selectedIndex];
    v17 = [(GuidanceSearchResultsViewController *)self viewModel];
    v18 = [v17 results];
    if (v16 >= [v18 count])
    {

LABEL_13:
      goto LABEL_14;
    }
    v19 = [v10 spotlightMapsIdentifier];

    if (v19)
    {
      v20 = [(GuidanceSearchResultsViewController *)self viewModel];
      v21 = [v20 results];
      v17 = [v21 objectAtIndexedSubscript:[v10 selectedIndex]];

      v22 = sub_100109E50();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        v23 = [v17 name];
        int v25 = 138412290;
        v26 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "SAR: didChangePersonalItems. Opening placecard with map Item: %@", (uint8_t *)&v25, 0xCu);
      }
      v24 = [(GuidanceSearchResultsViewController *)self navContaineeDelegate];
      [v24 selectMapItem:v17 shouldRemoveResults:0];

      goto LABEL_13;
    }
  }
LABEL_14:
}

- (void)viewDidLoad
{
  v74.receiver = self;
  v74.super_class = (Class)GuidanceSearchResultsViewController;
  [(ContaineeViewController *)&v74 viewDidLoad];
  v3 = [(GuidanceSearchResultsViewController *)self view];
  [v3 setAccessibilityIdentifier:@"GuidanceSearchResults"];

  v4 = [GuidanceSearchResultsView alloc];
  id v5 = +[UIScreen mainScreen];
  [v5 bounds];
  id v6 = -[GuidanceSearchResultsView initWithFrame:](v4, "initWithFrame:");
  [(GuidanceSearchResultsViewController *)self setResultsView:v6];

  v7 = [(GuidanceSearchResultsViewController *)self resultsView];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v8 = [(GuidanceSearchResultsViewController *)self resultsView];
  [v8 setPreservesSuperviewLayoutMargins:1];

  v9 = [(GuidanceSearchResultsViewController *)self view];
  v10 = [(GuidanceSearchResultsViewController *)self resultsView];
  [v9 addSubview:v10];

  v11 = [ResultsTitleView alloc];
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v15 = -[ResultsTitleView initWithFrame:](v11, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  resultsTitleView = self->_resultsTitleView;
  self->_resultsTitleView = v15;

  [(ResultsTitleView *)self->_resultsTitleView setTranslatesAutoresizingMaskIntoConstraints:0];
  v17 = [(GuidanceSearchResultsViewController *)self viewModel];
  v18 = [v17 title];
  [(ResultsTitleView *)self->_resultsTitleView setTitle:v18];

  [(ResultsTitleView *)self->_resultsTitleView setEditButtonHidden:1];
  [(GuidanceSearchResultsViewController *)self setHideHeader:1];
  v19 = [SearchResultsDataSource alloc];
  v20 = [(GuidanceSearchResultsViewController *)self resultsView];
  v21 = [v20 tableView];
  v22 = [(SearchResultsDataSource *)v19 initWithTableView:v21];
  [(GuidanceSearchResultsViewController *)self setDataSource:v22];

  v23 = [(GuidanceSearchResultsViewController *)self dataSource];
  [v23 setDelegate:self];

  uint64_t v24 = sub_1009DB5CC();
  int v25 = [(GuidanceSearchResultsViewController *)self dataSource];
  [v25 setUsePlaceSummary:v24];

  v26 = [(GuidanceSearchResultsViewController *)self dataSource];
  [v26 setIsPresentingSearchAlongTheRouteResults:1];

  v27 = [(GuidanceSearchResultsViewController *)self dataSource];
  [v27 setSearchAlongTheRouteCellDelegate:self];

  v28 = [(GuidanceSearchResultsViewController *)self dataSource];
  v29 = [(GuidanceSearchResultsViewController *)self resultsView];
  v30 = [v29 tableView];
  [v30 setDataSource:v28];

  v31 = [(GuidanceSearchResultsViewController *)self dataSource];
  v32 = [(GuidanceSearchResultsViewController *)self resultsView];
  v33 = [v32 tableView];
  [v33 setDelegate:v31];

  v34 = [(GuidanceSearchResultsViewController *)self resultsView];
  v35 = [v34 tableView];
  [v35 setSectionHeaderTopPadding:0.0];

  v36 = -[ContainerHeaderView initWithFrame:]([ContainerHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  containerHeaderView = self->_containerHeaderView;
  self->_containerHeaderView = v36;

  [(ContainerHeaderView *)self->_containerHeaderView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(ContainerHeaderView *)self->_containerHeaderView setDelegate:self];
  [(ContainerHeaderView *)self->_containerHeaderView setTitleView:self->_resultsTitleView];
  v38 = [(GuidanceSearchResultsViewController *)self view];
  [v38 addSubview:self->_containerHeaderView];

  v72 = [(ContainerHeaderView *)self->_containerHeaderView leadingAnchor];
  v73 = [(GuidanceSearchResultsViewController *)self view];
  v71 = [v73 leadingAnchor];
  v70 = [v72 constraintEqualToAnchor:v71];
  v75[0] = v70;
  v68 = [(ContainerHeaderView *)self->_containerHeaderView trailingAnchor];
  v69 = [(GuidanceSearchResultsViewController *)self view];
  v67 = [v69 trailingAnchor];
  v66 = [v68 constraintEqualToAnchor:v67];
  v75[1] = v66;
  v64 = [(ContainerHeaderView *)self->_containerHeaderView topAnchor];
  v65 = [(GuidanceSearchResultsViewController *)self view];
  v63 = [v65 topAnchor];
  v62 = [v64 constraintEqualToAnchor:v63];
  v75[2] = v62;
  v61 = [(GuidanceSearchResultsViewController *)self resultsView];
  v59 = [v61 leadingAnchor];
  v60 = [(GuidanceSearchResultsViewController *)self view];
  v58 = [v60 leadingAnchor];
  v57 = [v59 constraintEqualToAnchor:v58];
  v75[3] = v57;
  v56 = [(GuidanceSearchResultsViewController *)self resultsView];
  v54 = [v56 trailingAnchor];
  v55 = [(GuidanceSearchResultsViewController *)self view];
  v53 = [v55 trailingAnchor];
  v52 = [v54 constraintEqualToAnchor:v53];
  v75[4] = v52;
  v51 = [(GuidanceSearchResultsViewController *)self resultsView];
  v39 = [v51 topAnchor];
  v40 = [(ContainerHeaderView *)self->_containerHeaderView bottomAnchor];
  v41 = [v39 constraintEqualToAnchor:v40];
  v75[5] = v41;
  v42 = [(GuidanceSearchResultsViewController *)self resultsView];
  v43 = [v42 bottomAnchor];
  v44 = [(GuidanceSearchResultsViewController *)self view];
  v45 = [v44 bottomAnchor];
  v46 = [v43 constraintEqualToAnchor:v45];
  v75[6] = v46;
  v47 = +[NSArray arrayWithObjects:v75 count:7];
  +[NSLayoutConstraint activateConstraints:v47];

  v48 = +[MNNavigationService sharedService];
  switch([v48 navigationTransportType])
  {
    case 1u:
    case 6u:

      goto LABEL_7;
    case 2u:
      char IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps182();
      break;
    case 3u:
      char IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps420();
      break;
    default:
      char IsEnabled_Maps182 = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes();
      break;
  }
  char v50 = IsEnabled_Maps182;

  if ((v50 & 1) == 0) {
LABEL_7:
  }
    [(GuidanceSearchResultsViewModel *)self->_viewModel loadDataIfNeeded];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GuidanceSearchResultsViewController;
  [(ContaineeViewController *)&v8 viewWillAppear:a3];
  v4 = [(GuidanceSearchResultsViewController *)self viewModel];
  [v4 clearSelection];

  id v5 = [(ContaineeViewController *)self cardPresentationController];
  id v6 = [v5 containerStyle];
  v7 = [(GuidanceSearchResultsViewController *)self traitCollection];
  [(GuidanceSearchResultsViewController *)self _updateLayoutWithContainerStyle:v6 traitCollection:v7];
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)GuidanceSearchResultsViewController;
  id v6 = a3;
  [(GuidanceSearchResultsViewController *)&v8 willTransitionToTraitCollection:v6 withTransitionCoordinator:a4];
  v7 = [(ContaineeViewController *)self cardPresentationController];
  -[GuidanceSearchResultsViewController _updateLayoutWithContainerStyle:traitCollection:](self, "_updateLayoutWithContainerStyle:traitCollection:", [v7 containerStyle], v6);
}

- (double)_mediumLayoutHeightInSAR
{
  v2 = [(GuidanceSearchResultsViewController *)self view];
  v3 = [v2 window];
  v4 = [v3 windowScene];
  id v5 = [v4 screen];

  if (!v5)
  {
    id v5 = +[UIScreen mainScreen];
  }
  [v5 bounds];
  double v7 = v6;
  [v5 bounds];
  if (v7 == 320.0)
  {
    [v5 bounds];
    UIRoundToScreenScale();
    double v10 = v9;
  }
  else
  {
    double v10 = dbl_100F6F690[v8 > 750.0];
  }

  return v10;
}

- (BOOL)_isEmpty
{
  v3 = [(GuidanceSearchResultsViewController *)self resultsView];
  if ([v3 isLoading])
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [(GuidanceSearchResultsViewController *)self dataSource];
    double v6 = [v5 content];
    BOOL v4 = [v6 count] == 0;
  }
  return v4;
}

- (void)_updateLayoutWithContainerStyle:(unint64_t)a3 traitCollection:(id)a4
{
  if (sub_1008262C8(a3, a4))
  {
    id v5 = [(ContaineeViewController *)self cardPresentationController];
    [v5 wantsLayout:1];
  }
}

- (void)applyAlphaToContent:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GuidanceSearchResultsViewController;
  -[ContaineeViewController applyAlphaToContent:](&v5, "applyAlphaToContent:");
  if (![(GuidanceSearchResultsViewController *)self isHeaderHidden]) {
    [(ContainerHeaderView *)self->_containerHeaderView setHairLineAlpha:a3];
  }
}

- (id)headerView
{
  return self->_containerHeaderView;
}

- (id)contentView
{
  return self->_resultsView;
}

- (void)willChangeLayout:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GuidanceSearchResultsViewController;
  [(ContaineeViewController *)&v7 willChangeLayout:"willChangeLayout:"];
  objc_super v5 = [(GuidanceSearchResultsViewController *)self navContaineeDelegate];
  double v6 = v5;
  if (a3 == 1) {
    [v5 showJunctionViewIfNeeded];
  }
  else {
    [v5 hideJunctionViewIfNeeded];
  }
}

- (void)willChangeContainerStyle:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GuidanceSearchResultsViewController;
  -[ContaineeViewController willChangeContainerStyle:](&v6, "willChangeContainerStyle:");
  objc_super v5 = [(GuidanceSearchResultsViewController *)self traitCollection];
  [(GuidanceSearchResultsViewController *)self _updateLayoutWithContainerStyle:a3 traitCollection:v5];
}

- (double)heightForLayout:(unint64_t)a3
{
  -[ContainerHeaderView systemLayoutSizeFittingSize:](self->_containerHeaderView, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  double v6 = v5;
  if ([(GuidanceSearchResultsViewController *)self _isEmpty])
  {
    if (a3 == 2) {
      return v6;
    }
    else {
      return -1.0;
    }
  }
  if (a3 - 3 < 2)
  {
    v11 = [(ContaineeViewController *)self cardPresentationController];
    [v11 availableHeight];
    double v13 = v12;

    return v13;
  }
  else
  {
    if (a3 != 2)
    {
      double v7 = -1.0;
      if (a3 == 1)
      {
        double v9 = [(ContaineeViewController *)self cardPresentationController];
        [v9 bottomSafeOffset];
        double v7 = v6 + v10;
      }
      return v7;
    }
    if (!MapsFeature_IsEnabled_SearchAndDiscovery())
    {
      v15.receiver = self;
      v15.super_class = (Class)GuidanceSearchResultsViewController;
      [(ContaineeViewController *)&v15 heightForLayout:2];
      return v14;
    }
    [(GuidanceSearchResultsViewController *)self _mediumLayoutHeightInSAR];
  }
  return result;
}

- (unint64_t)maxLayoutForEdgeInsetsUpdate
{
  return 2;
}

- (unint64_t)defaultLayoutForContainerStyle:(unint64_t)a3 traitCollection:(id)a4
{
  return sub_1008262C8(a3, a4);
}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  +[SARAnalytics captureCancelSearchResults];
  id v5 = [(GuidanceSearchResultsViewController *)self viewModel];
  [v5 cancelResultsView];
}

- (void)headerViewTapped:(id)a3
{
  BOOL v4 = [(ContaineeViewController *)self cardPresentationController];
  id v5 = [v4 containeeLayout];

  if (v5 == (id)1)
  {
    +[SARAnalytics captureListTapToShowTray];
    double v6 = [(ContaineeViewController *)self cardPresentationController];
    id v10 = v6;
    uint64_t v7 = 2;
  }
  else
  {
    double v8 = [(ContaineeViewController *)self cardPresentationController];
    id v9 = [v8 containeeLayout];

    if (v9 != (id)2) {
      return;
    }
    +[SARAnalytics captureListTapToHideTray];
    double v6 = [(ContaineeViewController *)self cardPresentationController];
    id v10 = v6;
    uint64_t v7 = 1;
  }
  [v6 wantsLayout:v7];
}

- (void)setHideHeader:(BOOL)a3
{
  if (self->_hideHeader != a3)
  {
    self->_hideHeader = a3;
    if (a3) {
      double v4 = 0.0;
    }
    else {
      double v4 = 1.0;
    }
    [(ResultsTitleView *)self->_resultsTitleView setAlpha:v4];
    containerHeaderView = self->_containerHeaderView;
    [(ContainerHeaderView *)containerHeaderView setHairLineAlpha:v4];
  }
}

- (void)dataSourceUpdated:(id)a3
{
  id v4 = [(GuidanceSearchResultsViewController *)self resultsView];
  v3 = [v4 tableView];
  [v3 reloadData];
}

- (int)listForDataSource:(id)a3
{
  return 6;
}

- (void)dataSource:(id)a3 itemTapped:(id)a4
{
  id v5 = a4;
  double v6 = [(GuidanceSearchResultsViewController *)self resultsView];
  uint64_t v7 = [v6 tableView];
  double v8 = [(GuidanceSearchResultsViewController *)self resultsView];
  id v9 = [v8 tableView];
  id v10 = [v9 indexPathForSelectedRow];
  [v7 deselectRowAtIndexPath:v10 animated:1];

  id v16 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = [v16 mapItem];
    double v12 = [(GuidanceSearchResultsViewController *)self viewModel];
    double v13 = [v12 results];
    id v14 = [v13 indexOfObject:v11];

    if (v14 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      objc_super v15 = [(GuidanceSearchResultsViewController *)self viewModel];
      [v15 selectMapItemAtIndex:v14];
    }
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  v6.receiver = self;
  v6.super_class = (Class)GuidanceSearchResultsViewController;
  [(ContaineeViewController *)&v6 scrollViewWillEndDragging:a3 withVelocity:a5 targetContentOffset:a4.x];
  if (y <= 0.0)
  {
    if (y < 0.0) {
      +[SARAnalytics captureListScrollUp];
    }
  }
  else
  {
    +[SARAnalytics captureListScrollDown];
  }
}

- (void)searchResultTableViewCellDidTapActionButton:(id)a3
{
  id v4 = a3;
  id v5 = [(GuidanceSearchResultsViewController *)self resultsView];
  objc_super v6 = [v5 tableView];
  id v8 = [v6 indexPathForCell:v4];

  uint64_t v7 = [(GuidanceSearchResultsViewController *)self viewModel];
  [v7 navigateToItemAtIndex:[v8 row]];
}

- (void)didTapOnAddStopAtIndex:(unint64_t)a3
{
  id v4 = [(GuidanceSearchResultsViewController *)self viewModel];
  [v4 navigateToItemAtIndex:a3];
}

- (void)viewModelWillStartLoading:(id)a3
{
  id v3 = [(GuidanceSearchResultsViewController *)self resultsView];
  [v3 setLoading:1];
}

- (void)viewModelDidFinishLoading:(id)a3 error:(id)a4
{
  id v5 = a3;
  objc_super v6 = [v5 results];
  +[SARAnalytics captureShowSearchResults:v6];

  [(GuidanceSearchResultsViewController *)self setHideHeader:0];
  uint64_t v7 = [(GuidanceSearchResultsViewController *)self resultsView];
  [v7 setLoading:0];

  id v8 = [(GuidanceSearchResultsViewController *)self viewModel];
  id v9 = [v8 title];
  [(ResultsTitleView *)self->_resultsTitleView setTitle:v9];

  id v10 = [(GuidanceSearchResultsViewController *)self viewModel];
  v11 = [v10 subtitle];
  [(ResultsTitleView *)self->_resultsTitleView setSubtitle:v11];

  double v12 = +[MNNavigationService sharedService];
  switch([v12 navigationTransportType])
  {
    case 1u:
    case 6u:
      goto LABEL_8;
    case 2u:
      char IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps182();
      goto LABEL_4;
    case 3u:
      char IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps420();
LABEL_4:
      char v14 = IsEnabled_Maps182;

      if ((v14 & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_7;
    default:
      int IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes();

      if (IsEnabled_DrivingMultiWaypointRoutes)
      {
LABEL_7:
        double v12 = [(GuidanceSearchResultsViewController *)self viewModel];
        id v16 = [v12 headerImage];
        [(ResultsTitleView *)self->_resultsTitleView setHeaderImage:v16];

LABEL_8:
      }
LABEL_9:
      v17 = objc_opt_new();
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      v18 = [v5 results];
      id v19 = [v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = *(void *)v33;
        do
        {
          v22 = 0;
          do
          {
            if (*(void *)v33 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = [[SearchResult alloc] initWithMapItem:*(void *)(*((void *)&v32 + 1) + 8 * (void)v22)];
            [v17 addObject:v23];

            v22 = (char *)v22 + 1;
          }
          while (v20 != v22);
          id v20 = [v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
        }
        while (v20);
      }

      uint64_t v24 = [[IdenticallyOrderedDataSource alloc] initWithObjects:v17];
      int v25 = [v5 placeSummaryMetadata];
      v26 = [(GuidanceSearchResultsViewController *)self dataSource];
      [v26 setPlaceSummaryMetadata:v25];

      v27 = [[SearchResultsDataSourceContent alloc] initWithOrderedDataSource:v24];
      v28 = [(GuidanceSearchResultsViewController *)self dataSource];
      [v28 setContent:v27];

      if ([(GuidanceSearchResultsViewController *)self _isEmpty])
      {
        v29 = +[NSBundle mainBundle];
        v30 = [v29 localizedStringForKey:@"SaR_NoResults" value:@"localized string not found" table:0];
        [(ResultsTitleView *)self->_resultsTitleView setTitle:v30];

        v31 = [(ContaineeViewController *)self cardPresentationController];
        [v31 wantsLayout:2];
      }
      else
      {
        v31 = [(ContaineeViewController *)self cardPresentationController];
        [v31 updateHeightForCurrentLayout];
      }

      return;
  }
}

- (int)currentUITargetForAnalytics
{
  return 104;
}

- (int)currentMapViewTargetForAnalytics
{
  return 506;
}

- (NavActionCoordination)navContaineeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navContaineeDelegate);

  return (NavActionCoordination *)WeakRetained;
}

- (void)setNavContaineeDelegate:(id)a3
{
}

- (GuidanceSearchResultsViewModel)viewModel
{
  return self->_viewModel;
}

- (GuidanceSearchResultsView)resultsView
{
  return self->_resultsView;
}

- (void)setResultsView:(id)a3
{
}

- (SearchResultsDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (BOOL)isHeaderHidden
{
  return self->_hideHeader;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_resultsView, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->_navContaineeDelegate);
  objc_storeStrong((id *)&self->_resultsTitleView, 0);

  objc_storeStrong((id *)&self->_containerHeaderView, 0);
}

@end