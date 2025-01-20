@interface CarSharedTripsCardViewController
- (CarSharedTripsCardViewController)initWithSelectionHandler:(id)a3;
- (NSArray)focusOrderSubItems;
- (void)_showDetailForSharedTrip:(id)a3;
- (void)clearSelection;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
@end

@implementation CarSharedTripsCardViewController

- (CarSharedTripsCardViewController)initWithSelectionHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CarSharedTripsCardViewController;
  v5 = [(CarSharedTripsCardViewController *)&v9 init];
  if (v5)
  {
    id v6 = [v4 copy];
    id selectionHandler = v5->_selectionHandler;
    v5->_id selectionHandler = v6;
  }
  return v5;
}

- (void)viewDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)CarSharedTripsCardViewController;
  [(CarSharedTripsCardViewController *)&v20 viewDidLoad];
  v3 = [(CarSharedTripsCardViewController *)self view];
  [v3 setAccessibilityIdentifier:@"CarSharedTripsListCard"];

  id v4 = [CarTableView alloc];
  v5 = [(CarSharedTripsCardViewController *)self view];
  [v5 bounds];
  id v6 = -[CarTableView initWithFrame:style:](v4, "initWithFrame:style:", 0);
  tableView = self->_tableView;
  self->_tableView = v6;

  [(CarTableView *)self->_tableView setAccessibilityIdentifier:@"CarSharedTripsListCardTableView"];
  [(CarTableView *)self->_tableView setAutoresizingMask:18];
  v8 = +[UIColor clearColor];
  [(CarTableView *)self->_tableView setBackgroundColor:v8];

  [(CarTableView *)self->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CarTableView *)self->_tableView setDelegate:self];
  [(CarTableView *)self->_tableView setRowHeight:UITableViewAutomaticDimension];
  objc_super v9 = self->_tableView;
  uint64_t v10 = objc_opt_class();
  v11 = +[CarShareTripContactCell reuseIdentifier];
  [(CarTableView *)v9 registerClass:v10 forCellReuseIdentifier:v11];

  v12 = [(CarSharedTripsCardViewController *)self view];
  [v12 addSubview:self->_tableView];

  objc_initWeak(&location, self);
  v13 = [SharedTripsTableDataSource alloc];
  v14 = self->_tableView;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100C292A8;
  v17[3] = &unk_1012ECBA8;
  objc_copyWeak(&v18, &location);
  v15 = [(SharedTripsTableDataSource *)v13 initWithTableView:v14 cellProvider:v17 tableViewReloadEvent:0];
  sharedTripsDataSource = self->_sharedTripsDataSource;
  self->_sharedTripsDataSource = v15;

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)clearSelection
{
}

- (void)_showDetailForSharedTrip:(id)a3
{
  id v5 = a3;
  -[SharedTripsTableDataSource setSelectedTrip:](self->_sharedTripsDataSource, "setSelectedTrip:");
  id selectionHandler = (void (**)(id, id))self->_selectionHandler;
  if (selectionHandler) {
    selectionHandler[2](selectionHandler, v5);
  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  -[SharedTripsTableDataSource sharedTripAtIndexPath:](self->_sharedTripsDataSource, "sharedTripAtIndexPath:", a5, a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if ([v7 hasTransportType])
  {
    id v5 = [v7 transportType];
    if (v5 >= 7)
    {
      id v6 = +[NSString stringWithFormat:@"(unknown: %i)", v5];
    }
    else
    {
      id v6 = *(&off_10131BB68 + (int)v5);
    }
  }
  else
  {
    id v6 = @"UNKNOWN_TRANSPORT_TYPE";
  }
  +[GEOAPPortal captureUserAction:9002 target:267 value:v6];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v7 = [(SharedTripsTableDataSource *)self->_sharedTripsDataSource sharedTripAtIndexPath:a4];
  [(SharedTripsTableDataSource *)self->_sharedTripsDataSource setSelectedTrip:v7];
  if ([v7 hasTransportType])
  {
    id v5 = [v7 transportType];
    if (v5 >= 7)
    {
      id v6 = +[NSString stringWithFormat:@"(unknown: %i)", v5];
    }
    else
    {
      id v6 = *(&off_10131BB68 + (int)v5);
    }
  }
  else
  {
    id v6 = @"UNKNOWN_TRANSPORT_TYPE";
  }
  +[GEOAPPortal captureUserAction:9003 target:268 value:v6];

  [(CarSharedTripsCardViewController *)self _showDetailForSharedTrip:v7];
}

- (NSArray)focusOrderSubItems
{
  if ([(CarSharedTripsCardViewController *)self isViewLoaded])
  {
    v3 = [(CarTableView *)self->_tableView _car_visibleCells];
  }
  else
  {
    v3 = &__NSArray0__struct;
  }

  return (NSArray *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selectionHandler, 0);
  objc_storeStrong((id *)&self->_sharedTripsDataSource, 0);

  objc_storeStrong((id *)&self->_tableView, 0);
}

@end