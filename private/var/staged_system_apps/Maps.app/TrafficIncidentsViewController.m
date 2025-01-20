@interface TrafficIncidentsViewController
- (BOOL)isMarzipan;
- (CGSize)preferredContentSize;
- (HeightProviding)heightProvider;
- (NSMutableArray)tableViewRows;
- (TrafficIncidentLayoutManager)trafficLayoutManager;
- (TrafficIncidentReport)incidentReport;
- (TrafficIncidentsViewController)init;
- (TrafficIncidentsViewControllerDelegate)delegate;
- (UIScrollViewDelegate)scrollViewDelegate;
- (VKTrafficIncidentFeature)incident;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_cellForRow:(int64_t)a3 inSection:(int64_t)a4;
- (id)_incidentsDetailsRow;
- (id)_incidentsOverviewRow;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)rowForRow:(unint64_t)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)numberOfItems;
- (void)_contentSizeCategoryDidChange:(id)a3;
- (void)_didReceiveIncidentUpdate:(id)a3;
- (void)_incidentUpvoted:(BOOL)a3;
- (void)_refreshTrafficLayout;
- (void)_setupRowsWithIncident:(id)a3;
- (void)_setupRowsWithIncidentReport:(id)a3;
- (void)dealloc;
- (void)incidentsReportingEnablementDidUpdate;
- (void)overviewCell:(id)a3 incidentUpvoted:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setDelegate:(id)a3;
- (void)setIncident:(id)a3;
- (void)setIncidentReport:(id)a3;
- (void)setScrollViewDelegate:(id)a3;
- (void)setTableViewRows:(id)a3;
- (void)setTrafficLayoutManager:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateTheme;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TrafficIncidentsViewController

- (TrafficIncidentsViewController)init
{
  v11.receiver = self;
  v11.super_class = (Class)TrafficIncidentsViewController;
  v2 = [(TrafficIncidentsViewController *)&v11 initWithStyle:0];
  v3 = v2;
  if (v2)
  {
    v4 = [(TrafficIncidentsViewController *)v2 tableView];
    [v4 setAllowsSelection:0];

    id v5 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v6 = [(TrafficIncidentsViewController *)v3 tableView];
    [v6 setTableFooterView:v5];

    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v3 selector:"_contentSizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];

    v8 = [[TrafficIncidentLayoutManager alloc] initWithFormType:9];
    [(TrafficIncidentsViewController *)v3 setTrafficLayoutManager:v8];

    v9 = [(TrafficIncidentsViewController *)v3 trafficLayoutManager];
    [v9 addObserver:v3];

    [(TrafficIncidentsViewController *)v3 _refreshTrafficLayout];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [(TrafficIncidentsViewController *)self trafficLayoutManager];
  [v3 removeObserver:self];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)TrafficIncidentsViewController;
  [(TrafficIncidentsViewController *)&v5 dealloc];
}

- (void)_refreshTrafficLayout
{
  objc_initWeak(&location, self);
  v3 = [(TrafficIncidentsViewController *)self trafficLayoutManager];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1009CCCFC;
  v4[3] = &unk_1012E9BD0;
  objc_copyWeak(&v5, &location);
  [v3 fetchTrafficIncidentsLayout:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)setIncident:(id)a3
{
  v9 = (VKTrafficIncidentFeature *)a3;
  if (self->_incident != v9)
  {
    incidentReport = self->_incidentReport;
    self->_incidentReport = 0;

    objc_storeStrong((id *)&self->_incident, a3);
    [(TrafficIncidentsViewController *)self _setupRowsWithIncident:v9];
    if ([(TrafficIncidentsViewController *)self isViewLoaded])
    {
      v6 = [(TrafficIncidentsViewController *)self view];
      v7 = [v6 window];

      if (v7)
      {
        v8 = [(TrafficIncidentsViewController *)self tableView];
        [v8 reloadData];
      }
    }
  }
}

- (unint64_t)numberOfItems
{
  return (unint64_t)[(NSMutableArray *)self->_tableViewRows count];
}

- (void)_setupRowsWithIncident:(id)a3
{
  id v4 = objc_alloc_init((Class)NSMutableArray);
  [(TrafficIncidentsViewController *)self setTableViewRows:v4];

  if ([(TrafficIncidentsViewController *)self isMarzipan])
  {
    id v5 = [MacTrafficIncidentsOverviewCellModel alloc];
    v6 = [(TrafficIncidentsViewController *)self incident];
    v16 = [(MacTrafficIncidentsOverviewCellModel *)v5 initWithVKTrafficIncidentFeature:v6];

    if ([(MacTrafficIncidentsOverviewCellModel *)v16 hasDataToShow])
    {
      v7 = [(TrafficIncidentsViewController *)self tableViewRows];
      [v7 addObject:&off_1013A9F28];
    }
    v8 = [MacTrafficIncidentsDetailsCellModel alloc];
    v9 = [(TrafficIncidentsViewController *)self incident];
    v10 = [(MacTrafficIncidentsDetailsCellModel *)v8 initWithVKTrafficIncidentFeature:v9];

    if ([(MacTrafficIncidentsDetailsCellModel *)v10 hasDataToShow])
    {
      objc_super v11 = [(TrafficIncidentsViewController *)self tableViewRows];
      [v11 addObject:&off_1013A9F40];
    }
    goto LABEL_13;
  }
  v12 = [(TrafficIncidentsViewController *)self incident];
  v13 = [v12 info];
  if (!v13)
  {
    v13 = [(TrafficIncidentsViewController *)self incident];
    v14 = [v13 lastUpdatedDate];
    if (!v14)
    {
      v14 = [(TrafficIncidentsViewController *)self incident];
      if (([v14 isRestrictionIncident] & 1) == 0)
      {
        v15 = [(TrafficIncidentsViewController *)self incident];

        if (!v15) {
          return;
        }
        goto LABEL_12;
      }
    }
  }
LABEL_12:
  v16 = [(TrafficIncidentsViewController *)self tableViewRows];
  [(MacTrafficIncidentsOverviewCellModel *)v16 addObject:&off_1013A9F28];
LABEL_13:
}

- (void)setIncidentReport:(id)a3
{
  v9 = (TrafficIncidentReport *)a3;
  if (self->_incidentReport != v9)
  {
    incident = self->_incident;
    self->_incident = 0;

    objc_storeStrong((id *)&self->_incidentReport, a3);
    [(TrafficIncidentsViewController *)self _setupRowsWithIncidentReport:v9];
    if ([(TrafficIncidentsViewController *)self isViewLoaded])
    {
      v6 = [(TrafficIncidentsViewController *)self view];
      v7 = [v6 window];

      if (v7)
      {
        v8 = [(TrafficIncidentsViewController *)self tableView];
        [v8 reloadData];
      }
    }
  }
}

- (void)_setupRowsWithIncidentReport:(id)a3
{
  id v4 = objc_alloc_init((Class)NSMutableArray);
  [(TrafficIncidentsViewController *)self setTableViewRows:v4];

  if (![(TrafficIncidentsViewController *)self isMarzipan])
  {
    id v5 = [(TrafficIncidentsViewController *)self tableViewRows];
    [v5 addObject:&off_1013A9F28];
  }
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)TrafficIncidentsViewController;
  [(TrafficIncidentsViewController *)&v7 viewDidLoad];
  v3 = +[UIColor clearColor];
  id v4 = [(TrafficIncidentsViewController *)self tableView];
  [v4 setBackgroundColor:v3];

  id v5 = [(TrafficIncidentsViewController *)self tableView];
  [v5 setSeparatorInset:0.0, 16.0, 0.0, 16.0];

  if (![(TrafficIncidentsViewController *)self isMarzipan])
  {
    v6 = [(TrafficIncidentsViewController *)self tableView];
    [v6 setSeparatorStyle:0];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TrafficIncidentsViewController;
  [(TrafficIncidentsViewController *)&v6 viewWillAppear:a3];
  id v4 = [(TrafficIncidentsViewController *)self tableView];
  [v4 reloadData];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_didReceiveIncidentUpdate:" name:@"SiriTrafficIncidentUpdateNotification" object:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(TrafficIncidentsViewController *)self tableView];
  [v5 setShowsVerticalScrollIndicator:0];

  v7.receiver = self;
  v7.super_class = (Class)TrafficIncidentsViewController;
  [(TrafficIncidentsViewController *)&v7 viewDidAppear:v3];
  objc_super v6 = [(TrafficIncidentsViewController *)self tableView];
  [v6 setShowsVerticalScrollIndicator:1];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TrafficIncidentsViewController;
  [(TrafficIncidentsViewController *)&v5 viewWillDisappear:a3];
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:@"SiriTrafficIncidentUpdateNotification" object:0];
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  id v3 = [(TrafficIncidentsViewController *)self tableView];
  [v3 reloadData];
}

- (CGSize)preferredContentSize
{
  v2 = [(TrafficIncidentsViewController *)self tableView];
  [v2 contentSize];
  double v4 = v3;

  double v5 = 298.0;
  double v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (HeightProviding)heightProvider
{
  heightProvider = self->_heightProvider;
  if (!heightProvider)
  {
    double v4 = [TableViewMeasurer alloc];
    double v5 = [(TrafficIncidentsViewController *)self tableView];
    double v6 = [(TableViewMeasurer *)v4 initWithMeasurableView:v5];

    objc_super v7 = self->_heightProvider;
    self->_heightProvider = v6;

    heightProvider = self->_heightProvider;
  }

  return heightProvider;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TrafficIncidentsViewController;
  [(TrafficIncidentsViewController *)&v9 traitCollectionDidChange:v5];
  if (v5
    && (id v6 = [v5 userInterfaceStyle],
        [(TrafficIncidentsViewController *)self traitCollection],
        double v3 = objc_claimAutoreleasedReturnValue(),
        v6 == [v3 userInterfaceStyle]))
  {
  }
  else
  {
    objc_super v7 = [(TrafficIncidentsViewController *)self traitCollection];
    id v8 = [v7 userInterfaceStyle];

    if (v5) {
    if (v8)
    }
      [(TrafficIncidentsViewController *)self updateTheme];
  }
}

- (void)updateTheme
{
  double v3 = [(TrafficIncidentsViewController *)self theme];
  double v4 = [v3 hairlineColor];
  id v5 = [(TrafficIncidentsViewController *)self tableView];
  [v5 setSeparatorColor:v4];

  id v6 = [(TrafficIncidentsViewController *)self tableView];
  [v6 reloadData];
}

- (int64_t)rowForRow:(unint64_t)a3
{
  double v4 = [(TrafficIncidentsViewController *)self tableViewRows];
  id v5 = [v4 objectAtIndexedSubscript:a3];
  int64_t v6 = [v5 unsignedIntValue];

  return v6;
}

- (id)_cellForRow:(int64_t)a3 inSection:(int64_t)a4
{
  int64_t v5 = -[TrafficIncidentsViewController rowForRow:](self, "rowForRow:", a3, a4);
  if (v5)
  {
    if (v5 == 1)
    {
      int64_t v6 = [(TrafficIncidentsViewController *)self _incidentsOverviewRow];
    }
    else
    {
      int64_t v6 = 0;
    }
  }
  else
  {
    int64_t v6 = [(TrafficIncidentsViewController *)self _incidentsDetailsRow];
  }

  return v6;
}

- (id)_incidentsOverviewRow
{
  unsigned int v3 = [(TrafficIncidentsViewController *)self isMarzipan];
  double v4 = [(TrafficIncidentsViewController *)self tableView];
  if (v3)
  {
    int64_t v5 = +[MacTrafficIncidentsOverviewCell reuseIdentifier];
    [v4 _mapkit_dequeueReusableCellWithIdentifier:v5];
    int64_t v6 = (MacTrafficIncidentsOverviewCell *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_super v7 = [MacTrafficIncidentsOverviewCell alloc];
      id v8 = +[MacTrafficIncidentsOverviewCell reuseIdentifier];
      int64_t v6 = [(MacTrafficIncidentsOverviewCell *)v7 initWithStyle:0 reuseIdentifier:v8];
    }
    objc_super v9 = [MacTrafficIncidentsOverviewCellModel alloc];
    v10 = [(TrafficIncidentsViewController *)self incident];
    objc_super v11 = [(MacTrafficIncidentsOverviewCellModel *)v9 initWithVKTrafficIncidentFeature:v10];

    [(MacTrafficIncidentsOverviewCell *)v6 configureWithCellModel:v11];
  }
  else
  {
    v12 = +[TrafficIncidentsOverviewCell reuseIdentifier];
    [v4 _mapkit_dequeueReusableCellWithIdentifier:v12];
    int64_t v6 = (MacTrafficIncidentsOverviewCell *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v13 = [TrafficIncidentsOverviewCell alloc];
      v14 = +[TrafficIncidentsOverviewCell reuseIdentifier];
      int64_t v6 = [(TrafficIncidentsOverviewCell *)v13 initWithStyle:0 reuseIdentifier:v14];
    }
    [(MacTrafficIncidentsOverviewCell *)v6 setDelegate:self];
    v15 = [(TrafficIncidentsViewController *)self incident];

    if (v15)
    {
      v16 = [(TrafficIncidentsViewController *)self trafficLayoutManager];
      if ([v16 isIncidentReportingEnabled])
      {
        v17 = [(TrafficIncidentsViewController *)self trafficLayoutManager];
        v18 = [(TrafficIncidentsViewController *)self incident];
        [v6 setShowVotingButtons:[v17 containsVKTrafficIncidentType:[v18 type]]];
      }
      else
      {
        [(MacTrafficIncidentsOverviewCell *)v6 setShowVotingButtons:0];
      }

      objc_super v11 = [(TrafficIncidentsViewController *)self incident];
      [(MacTrafficIncidentsOverviewCell *)v6 setIncident:v11];
    }
    else
    {
      v19 = [(TrafficIncidentsViewController *)self incidentReport];

      if (!v19) {
        goto LABEL_18;
      }
      v20 = [(TrafficIncidentsViewController *)self trafficLayoutManager];
      if ([v20 isIncidentReportingEnabled])
      {
        v21 = [(TrafficIncidentsViewController *)self trafficLayoutManager];
        v22 = [(TrafficIncidentsViewController *)self incidentReport];
        -[v6 setShowVotingButtons:[v21 containsGEOTrafficIncidentType:[v22 incidentType]]];
      }
      else
      {
        [(MacTrafficIncidentsOverviewCell *)v6 setShowVotingButtons:0];
      }

      objc_super v11 = [(TrafficIncidentsViewController *)self incidentReport];
      [(MacTrafficIncidentsOverviewCell *)v6 setIncidentReport:v11];
    }
  }

LABEL_18:

  return v6;
}

- (id)_incidentsDetailsRow
{
  if ([(TrafficIncidentsViewController *)self isMarzipan])
  {
    unsigned int v3 = [(TrafficIncidentsViewController *)self tableView];
    double v4 = +[MacTrafficIncidentsDetailsCell reuseIdentifier];
    [v3 _mapkit_dequeueReusableCellWithIdentifier:v4];
    int64_t v5 = (MacTrafficIncidentsDetailsCell *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      int64_t v6 = [MacTrafficIncidentsDetailsCell alloc];
      objc_super v7 = +[MacTrafficIncidentsDetailsCell reuseIdentifier];
      int64_t v5 = [(MacTrafficIncidentsDetailsCell *)v6 initWithStyle:0 reuseIdentifier:v7];
    }
    id v8 = [MacTrafficIncidentsDetailsCellModel alloc];
    objc_super v9 = [(TrafficIncidentsViewController *)self incident];
    v10 = [(MacTrafficIncidentsDetailsCellModel *)v8 initWithVKTrafficIncidentFeature:v9];

    [(MacTrafficIncidentsDetailsCell *)v5 configureWithCellModel:v10];
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  double v4 = [(TrafficIncidentsViewController *)self tableViewRows];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 65.0;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return UITableViewAutomaticDimension;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [v5 row];
  id v7 = [v5 section];

  return [(TrafficIncidentsViewController *)self _cellForRow:v6 inSection:v7];
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v7 = a3;
  double v4 = [(TrafficIncidentsViewController *)self scrollViewDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(TrafficIncidentsViewController *)self scrollViewDelegate];
    [v6 scrollViewWillBeginDragging:v7];
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  id v12 = a3;
  objc_super v9 = [(TrafficIncidentsViewController *)self scrollViewDelegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    objc_super v11 = [(TrafficIncidentsViewController *)self scrollViewDelegate];
    [v11 scrollViewWillEndDragging:v12 withVelocity:a5 targetContentOffset:x, y];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v7 = a3;
  double v4 = [(TrafficIncidentsViewController *)self scrollViewDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(TrafficIncidentsViewController *)self scrollViewDelegate];
    [v6 scrollViewDidScroll:v7];
  }
}

- (BOOL)isMarzipan
{
  v2 = +[UIDevice currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == (id)5;

  return v3;
}

- (void)overviewCell:(id)a3 incidentUpvoted:(BOOL)a4
{
}

- (void)_incidentUpvoted:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(TrafficIncidentsViewController *)self incidentReport];
  if (!v5)
  {
    id v6 = objc_alloc((Class)GEOLocation);
    id v7 = [(TrafficIncidentsViewController *)self incident];
    [v7 position];
    id v8 = [v6 initWithGEOCoordinate:];

    objc_super v9 = [(TrafficIncidentsViewController *)self incident];
    uint64_t v10 = +[TrafficIncidentLayoutItem geoTrafficIncidentTypeForVKType:](TrafficIncidentLayoutItem, "geoTrafficIncidentTypeForVKType:", [v9 type]);

    char v5 = [[TrafficIncidentReport alloc] initWithIncidentLocation:v8 type:v10 userPath:6];
  }
  if (v3) {
    uint64_t v11 = 2;
  }
  else {
    uint64_t v11 = 3;
  }
  id v12 = [(TrafficIncidentsViewController *)self incident];
  v13 = [v12 uniqueIdentifier];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1009CE074;
  v18[3] = &unk_1012E5D08;
  v18[4] = self;
  [(TrafficIncidentReport *)v5 submitFeedbackForType:v11 incidentId:v13 completionHandler:v18];

  if (self->_incident && !v3)
  {
    v14 = +[TrafficIncidentsStorageManager sharedInstance];
    [v14 removeTrafficIncidentFeature:self->_incident];
  }
  id v15 = (id)[(TrafficIncidentReport *)v5 incidentType];
  if (v15 >= 0x12)
  {
    v16 = +[NSString stringWithFormat:@"(unknown: %i)", v15];
  }
  else
  {
    v16 = off_1013134D8[(int)v15];
  }
  if (v3) {
    uint64_t v17 = 107;
  }
  else {
    uint64_t v17 = 106;
  }
  +[GEOAPPortal captureUserAction:v17 target:741 value:v16];
}

- (void)_didReceiveIncidentUpdate:(id)a3
{
  double v4 = [a3 userInfo];
  char v5 = [v4 objectForKey:@"SiriTrafficIncidentIsClearKey"];
  unsigned int v6 = [v5 BOOLValue];

  [(TrafficIncidentsViewController *)self _incidentUpvoted:v6 ^ 1];
}

- (void)incidentsReportingEnablementDidUpdate
{
  id v2 = [(TrafficIncidentsViewController *)self tableView];
  [v2 reloadData];
}

- (VKTrafficIncidentFeature)incident
{
  return self->_incident;
}

- (TrafficIncidentReport)incidentReport
{
  return self->_incidentReport;
}

- (TrafficIncidentsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TrafficIncidentsViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIScrollViewDelegate)scrollViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollViewDelegate);

  return (UIScrollViewDelegate *)WeakRetained;
}

- (void)setScrollViewDelegate:(id)a3
{
}

- (NSMutableArray)tableViewRows
{
  return self->_tableViewRows;
}

- (void)setTableViewRows:(id)a3
{
}

- (TrafficIncidentLayoutManager)trafficLayoutManager
{
  return self->_trafficLayoutManager;
}

- (void)setTrafficLayoutManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trafficLayoutManager, 0);
  objc_storeStrong((id *)&self->_tableViewRows, 0);
  objc_destroyWeak((id *)&self->_scrollViewDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_incidentReport, 0);
  objc_storeStrong((id *)&self->_incident, 0);

  objc_storeStrong((id *)&self->_heightProvider, 0);
}

@end