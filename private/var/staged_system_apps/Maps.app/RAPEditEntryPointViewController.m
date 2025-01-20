@interface RAPEditEntryPointViewController
- (CLLocationCoordinate2D)originalCoordinate;
- (RAPEditEntryPointDelegate)delegate;
- (RAPEditEntryPointViewController)initWithMapRect:(id)a3 entryPoint:(id)a4 delegate:(id)a5 initialViewMode:(int64_t)a6;
- (RAPEditLocationMapView)editLocationMapView;
- (RAPEntryPoint)entryPoint;
- (UITableView)tableView;
- (id)_tableView:(id)a3 deleteCellForIndexPath:(id)a4;
- (id)_tableView:(id)a3 entryTypeCellForIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int)analyticTarget;
- (int)backAction;
- (int64_t)editState;
- (int64_t)entryPointType;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)originalEntryPointType;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_cancelEditingEntryPoint;
- (void)_captureUserAction:(int)a3;
- (void)_deleteEntryPoint;
- (void)_editEntryPoint;
- (void)_saveEntryPoint;
- (void)_updateDoneButton;
- (void)editLocationMapView:(id)a3 didChangeViewMode:(int64_t)a4;
- (void)editLocationMapViewFinishedPanning:(id)a3;
- (void)editLocationMapViewFinishedZoomingIn:(id)a3;
- (void)editLocationMapViewFinishedZoomingOut:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditLocationMapView:(id)a3;
- (void)setEditState:(int64_t)a3;
- (void)setEntryPoint:(id)a3;
- (void)setEntryPointType:(int64_t)a3;
- (void)setOriginalCoordinate:(CLLocationCoordinate2D)a3;
- (void)setOriginalEntryPointType:(int64_t)a3;
- (void)setTableView:(id)a3;
- (void)setupConstraints;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation RAPEditEntryPointViewController

- (RAPEditEntryPointViewController)initWithMapRect:(id)a3 entryPoint:(id)a4 delegate:(id)a5 initialViewMode:(int64_t)a6
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v11 = a3.var0.var1;
  double v12 = a3.var0.var0;
  id v14 = a4;
  id v15 = a5;
  v52.receiver = self;
  v52.super_class = (Class)RAPEditEntryPointViewController;
  v16 = [(RAPEditEntryPointViewController *)&v52 init];
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_delegate, v15);
    v17->_editState = v14 != 0;
    v18 = +[NSBundle mainBundle];
    uint64_t v19 = [v18 localizedStringForKey:@"Add Entrance [Report an Issue]" value:@"localized string not found" table:0];

    v20 = +[NSBundle mainBundle];
    uint64_t v21 = [v20 localizedStringForKey:@"Edit Entrance [Report an Issue]" value:@"localized string not found" table:0];

    v50 = (void *)v21;
    v51 = (void *)v19;
    if (v17->_editState) {
      uint64_t v22 = v21;
    }
    else {
      uint64_t v22 = v19;
    }
    v23 = [(RAPEditEntryPointViewController *)v17 navigationItem];
    [v23 setTitle:v22];

    v24 = +[NSBundle mainBundle];
    v25 = [v24 localizedStringForKey:@"Back" value:@"localized string not found" table:0];
    v26 = [(RAPEditEntryPointViewController *)v17 navigationItem];
    v27 = [v26 backBarButtonItem];
    [v27 setTitle:v25];

    v28 = [RAPMarkerViewAttributes alloc];
    v29 = +[RAPEntryPoint entryPointStyleAttributes];
    v30 = [(RAPMarkerViewAttributes *)v28 initWithTitle:0 styleAttributes:v29];

    v31 = -[RAPEditLocationMapView initWithMapRect:viewMode:markerViewAttributes:]([RAPEditLocationMapView alloc], "initWithMapRect:viewMode:markerViewAttributes:", a6, v30, v12, v11, var0, var1);
    editLocationMapView = v17->_editLocationMapView;
    v17->_editLocationMapView = v31;

    [(RAPEditLocationMapView *)v17->_editLocationMapView setCrosshairEnabled:1];
    v33 = +[NSBundle mainBundle];
    v34 = [v33 localizedStringForKey:@"Pan & zoom map to adjust entrance location [Report an Issue]" value:@"localized string not found" table:0];
    [(RAPEditLocationMapView *)v17->_editLocationMapView setPrompt:v34];

    if (v14)
    {
      objc_storeStrong((id *)&v17->_entryPoint, a4);
      v17->_entryPointType = (int64_t)[v14 entryPointType];
      [v14 coordinate];
      v17->_originalCoordinate.latitude = v35;
      v17->_originalCoordinate.longitude = v36;
      v17->_originalEntryPointType = (int64_t)[v14 entryPointType];
      [v14 coordinate];
      -[RAPEditLocationMapView setCenterCoordinate:](v17->_editLocationMapView, "setCenterCoordinate:");
    }
    else
    {
      v17->_entryPointType = 0;
      [(RAPEditLocationMapView *)v17->_editLocationMapView centerCoordinate];
      v17->_originalCoordinate.latitude = v37;
      v17->_originalCoordinate.longitude = v38;
    }
    v39 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    tableView = v17->_tableView;
    v17->_tableView = v39;

    v41 = v17->_tableView;
    uint64_t v42 = objc_opt_class();
    v43 = (objc_class *)objc_opt_class();
    v44 = NSStringFromClass(v43);
    [(UITableView *)v41 registerClass:v42 forCellReuseIdentifier:v44];

    v45 = v17->_tableView;
    uint64_t v46 = objc_opt_class();
    v47 = (objc_class *)objc_opt_class();
    v48 = NSStringFromClass(v47);
    [(UITableView *)v45 registerClass:v46 forCellReuseIdentifier:v48];

    [(UITableView *)v17->_tableView _maps_initializeRAPAppearance];
    [(UITableView *)v17->_tableView setDataSource:v17];
    [(UITableView *)v17->_tableView setDelegate:v17];
  }
  return v17;
}

- (void)viewDidLoad
{
  v21.receiver = self;
  v21.super_class = (Class)RAPEditEntryPointViewController;
  [(RAPEditEntryPointViewController *)&v21 viewDidLoad];
  v3 = +[UIColor colorNamed:@"RAPGroupedTableViewBackgroundColor"];
  v4 = [(RAPEditEntryPointViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = [(RAPEditEntryPointViewController *)self editLocationMapView];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v6 = [(RAPEditEntryPointViewController *)self editLocationMapView];
  [v6 setDelegate:self];

  v7 = [(RAPEditEntryPointViewController *)self view];
  v8 = [(RAPEditEntryPointViewController *)self editLocationMapView];
  [v7 addSubview:v8];

  v9 = [(RAPEditEntryPointViewController *)self tableView];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  v10 = [(RAPEditEntryPointViewController *)self view];
  double v11 = [(RAPEditEntryPointViewController *)self tableView];
  [v10 addSubview:v11];

  double v12 = [(RAPEditEntryPointViewController *)self entryPoint];

  id v13 = objc_alloc((Class)UIBarButtonItem);
  id v14 = v13;
  if (v12)
  {
    id v15 = [v13 initWithBarButtonSystemItem:0 target:self action:"_editEntryPoint"];
    v16 = [(RAPEditEntryPointViewController *)self navigationItem];
    [v16 setRightBarButtonItem:v15];
  }
  else
  {
    id v15 = +[NSBundle mainBundle];
    v16 = [v15 localizedStringForKey:@"Save [RAP][Entry Point]" value:@"localized string not found" table:0];
    id v17 = [v14 initWithTitle:v16 style:2 target:self action:"_saveEntryPoint"];
    v18 = [(RAPEditEntryPointViewController *)self navigationItem];
    [v18 setRightBarButtonItem:v17];
  }
  id v19 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"_cancelEditingEntryPoint"];
  v20 = [(RAPEditEntryPointViewController *)self navigationItem];
  [v20 setLeftBarButtonItem:v19];

  [(RAPEditEntryPointViewController *)self _updateDoneButton];
  [(RAPEditEntryPointViewController *)self setupConstraints];
}

- (void)setupConstraints
{
  v44 = [(RAPEditEntryPointViewController *)self editLocationMapView];
  uint64_t v42 = [v44 leadingAnchor];
  v43 = [(RAPEditEntryPointViewController *)self view];
  v41 = [v43 leadingAnchor];
  v40 = [v42 constraintEqualToAnchor:v41];
  v45[0] = v40;
  v39 = [(RAPEditEntryPointViewController *)self editLocationMapView];
  CLLocationDegrees v37 = [v39 trailingAnchor];
  CLLocationDegrees v38 = [(RAPEditEntryPointViewController *)self view];
  CLLocationDegrees v36 = [v38 trailingAnchor];
  CLLocationDegrees v35 = [v37 constraintEqualToAnchor:v36];
  v45[1] = v35;
  v34 = [(RAPEditEntryPointViewController *)self editLocationMapView];
  v32 = [v34 topAnchor];
  v33 = [(RAPEditEntryPointViewController *)self view];
  v31 = [v33 safeAreaLayoutGuide];
  v30 = [v31 topAnchor];
  v29 = [v32 constraintEqualToAnchor:v30];
  v45[2] = v29;
  v28 = [(RAPEditEntryPointViewController *)self editLocationMapView];
  v26 = [v28 heightAnchor];
  v27 = [(RAPEditEntryPointViewController *)self view];
  v25 = [v27 heightAnchor];
  v24 = [v26 constraintEqualToAnchor:v25 multiplier:0.5];
  v45[3] = v24;
  v23 = [(RAPEditEntryPointViewController *)self tableView];
  objc_super v21 = [v23 topAnchor];
  uint64_t v22 = [(RAPEditEntryPointViewController *)self editLocationMapView];
  v20 = [v22 bottomAnchor];
  id v19 = [v21 constraintEqualToAnchor:v20];
  v45[4] = v19;
  v18 = [(RAPEditEntryPointViewController *)self tableView];
  v16 = [v18 leadingAnchor];
  id v17 = [(RAPEditEntryPointViewController *)self view];
  id v15 = [v17 leadingAnchor];
  id v14 = [v16 constraintEqualToAnchor:v15];
  v45[5] = v14;
  id v13 = [(RAPEditEntryPointViewController *)self tableView];
  v3 = [v13 trailingAnchor];
  v4 = [(RAPEditEntryPointViewController *)self view];
  v5 = [v4 trailingAnchor];
  v6 = [v3 constraintEqualToAnchor:v5];
  v45[6] = v6;
  v7 = [(RAPEditEntryPointViewController *)self tableView];
  v8 = [v7 bottomAnchor];
  v9 = [(RAPEditEntryPointViewController *)self view];
  v10 = [v9 bottomAnchor];
  double v11 = [v8 constraintEqualToAnchor:v10];
  v45[7] = v11;
  double v12 = +[NSArray arrayWithObjects:v45 count:8];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (void)_cancelEditingEntryPoint
{
  [(RAPEditEntryPointViewController *)self _captureUserAction:[(RAPEditEntryPointViewController *)self backAction]];
  v3 = [(RAPEditEntryPointViewController *)self delegate];
  v4 = [(RAPEditEntryPointViewController *)self editLocationMapView];
  [v3 editEntryPointController:self willDismissWithViewMode:[v4 viewMode]];

  [(RAPEditEntryPointViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)_editEntryPoint
{
  [(RAPEditEntryPointViewController *)self _captureUserAction:16];
  v3 = [(RAPEditEntryPointViewController *)self delegate];
  v4 = [(RAPEditEntryPointViewController *)self entryPoint];
  v5 = [(RAPEditEntryPointViewController *)self editLocationMapView];
  [v5 centerCoordinate];
  [v3 userDidRequestModificationOfEntryPoint:v4 entryPointType:[self entryPointType] withCoordinates:v6 entryPointType:v7];

  v8 = [(RAPEditEntryPointViewController *)self delegate];
  v9 = [(RAPEditEntryPointViewController *)self editLocationMapView];
  [v8 editEntryPointController:self willDismissWithViewMode:[v9 viewMode]];

  [(RAPEditEntryPointViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)_saveEntryPoint
{
  [(RAPEditEntryPointViewController *)self _captureUserAction:10110];
  v3 = [(RAPEditEntryPointViewController *)self delegate];
  v4 = [(RAPEditEntryPointViewController *)self editLocationMapView];
  [v4 centerCoordinate];
  double v7 = [v3 userDidRequestCreationOfEntryPointWithCoordinates:-[RAPEditEntryPointViewController entryPointType] v5, v6];
  [(RAPEditEntryPointViewController *)self setEntryPoint:v7];

  v8 = [(RAPEditEntryPointViewController *)self delegate];
  v9 = [(RAPEditEntryPointViewController *)self editLocationMapView];
  [v8 editEntryPointController:self willDismissWithViewMode:[v9 viewMode]];

  [(RAPEditEntryPointViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)_deleteEntryPoint
{
  [(RAPEditEntryPointViewController *)self _captureUserAction:10190];
  v3 = [(RAPEditEntryPointViewController *)self delegate];
  v4 = [(RAPEditEntryPointViewController *)self entryPoint];
  [v3 userDidRequestDeletionOfEntryPoint:v4];

  [(RAPEditEntryPointViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)editLocationMapView:(id)a3 didChangeViewMode:(int64_t)a4
{
  id v6 = a3;
  if ((unint64_t)a4 <= 2)
  {
    id v7 = v6;
    [(RAPEditEntryPointViewController *)self _captureUserAction:dword_100F74030[a4]];
    id v6 = v7;
  }
}

- (void)editLocationMapViewFinishedPanning:(id)a3
{
}

- (void)editLocationMapViewFinishedZoomingIn:(id)a3
{
}

- (void)editLocationMapViewFinishedZoomingOut:(id)a3
{
}

- (void)_captureUserAction:(int)a3
{
  if (a3)
  {
    uint64_t v3 = *(void *)&a3;
    uint64_t v4 = [(RAPEditEntryPointViewController *)self analyticTarget];
    +[GEOAPPortal captureUserAction:v3 target:v4 value:0];
  }
}

- (int)analyticTarget
{
  if (self->_editState) {
    return 1159;
  }
  else {
    return 1161;
  }
}

- (int)backAction
{
  return 10111;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  uint64_t v3 = [(RAPEditEntryPointViewController *)self entryPoint];

  if (v3) {
    return 2;
  }
  else {
    return 1;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4) {
    return 1;
  }
  else {
    return 3;
  }
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  if (a4)
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = a3;
    id v6 = +[NSBundle mainBundle];
    id v7 = [v6 localizedStringForKey:@"Entrance Type [RAP]" value:@"localized string not found" table:0];
    uint64_t v4 = [v5 _maps_groupedHeaderViewWithTitle:v7];
  }

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v6 section]) {
    [(RAPEditEntryPointViewController *)self _tableView:v7 deleteCellForIndexPath:v6];
  }
  else {
  v8 = [(RAPEditEntryPointViewController *)self _tableView:v7 entryTypeCellForIndexPath:v6];
  }

  return v8;
}

- (id)_tableView:(id)a3 entryTypeCellForIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  v10 = [v7 dequeueReusableCellWithIdentifier:v9 forIndexPath:v6];

  id v11 = [v6 row];
  if (v11 == (id)2)
  {
    double v12 = +[NSBundle mainBundle];
    id v13 = [v12 localizedStringForKey:@"Both [Report an Issue]" value:@"localized string not found" table:0];
    id v14 = [v10 textLabel];
    [v14 setText:v13];
    uint64_t v15 = 3;
  }
  else if (v11 == (id)1)
  {
    double v12 = +[NSBundle mainBundle];
    id v13 = [v12 localizedStringForKey:@"Walk [RAP][Entry Points]" value:@"localized string not found" table:0];
    id v14 = [v10 textLabel];
    [v14 setText:v13];
    uint64_t v15 = 1;
  }
  else
  {
    if (v11) {
      goto LABEL_8;
    }
    double v12 = +[NSBundle mainBundle];
    id v13 = [v12 localizedStringForKey:@"Drive [RAP][Entry Points]" value:@"localized string not found" table:0];
    id v14 = [v10 textLabel];
    [v14 setText:v13];
    uint64_t v15 = 2;
  }

  [v10 setChecked:[self entryPointType] == v15];
LABEL_8:

  return v10;
}

- (id)_tableView:(id)a3 deleteCellForIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  v9 = [v6 dequeueReusableCellWithIdentifier:v8 forIndexPath:v5];

  v10 = +[NSBundle mainBundle];
  id v11 = [v10 localizedStringForKey:@"Remove Entrance [Report an Issue]" value:@"localized string not found" table:0];
  double v12 = [v9 textLabel];
  [v12 setText:v11];

  id v13 = +[UIColor systemRedColor];
  id v14 = [v9 textLabel];
  [v14 setTextColor:v13];

  uint64_t v15 = [v9 textLabel];
  [v15 setTextAlignment:1];

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  [v12 deselectRowAtIndexPath:v6 animated:1];
  if ([v6 section])
  {
    [(RAPEditEntryPointViewController *)self _captureUserAction:10190];
    id v7 = [(RAPEditEntryPointViewController *)self delegate];
    v8 = [(RAPEditEntryPointViewController *)self entryPoint];
    [v7 userDidRequestDeletionOfEntryPoint:v8];

    [(RAPEditEntryPointViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    v9 = [(RAPEditEntryPointViewController *)self entryPointType];
    unint64_t v10 = (unint64_t)[v6 row];
    if (v10 <= 2) {
      [(RAPEditEntryPointViewController *)self setEntryPointType:qword_100F74040[v10]];
    }
    if (v9 != (void *)[(RAPEditEntryPointViewController *)self entryPointType])
    {
      [(RAPEditEntryPointViewController *)self _captureUserAction:10191];
      id v11 = [objc_alloc((Class)NSIndexSet) initWithIndex:0];
      [v12 reloadSections:v11 withRowAnimation:5];

      [(RAPEditEntryPointViewController *)self _updateDoneButton];
    }
  }
}

- (void)_updateDoneButton
{
  uint64_t v3 = [(RAPEditLocationMapView *)self->_editLocationMapView mapView];
  [v3 centerCoordinate];
  double v5 = v4;
  double v7 = v6;

  uint64_t v8 = 0;
  if (v7 >= -180.0 && v7 <= 180.0 && v5 >= -90.0 && v5 <= 90.0)
  {
    int64_t entryPointType = self->_entryPointType;
    if (self->_editState)
    {
      if (entryPointType == self->_originalEntryPointType)
      {
        BOOL v10 = vabdd_f64(v5, self->_originalCoordinate.latitude) >= 0.00000000999999994;
        uint64_t v8 = vabdd_f64(v7, self->_originalCoordinate.longitude) >= 0.00000000999999994 || v10;
      }
      else
      {
        uint64_t v8 = 1;
      }
    }
    else
    {
      uint64_t v8 = entryPointType != 0;
    }
  }
  id v12 = [(RAPEditEntryPointViewController *)self navigationItem];
  id v11 = [v12 rightBarButtonItem];
  [v11 setEnabled:v8];
}

- (RAPEditLocationMapView)editLocationMapView
{
  return self->_editLocationMapView;
}

- (void)setEditLocationMapView:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (RAPEditEntryPointDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RAPEditEntryPointDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RAPEntryPoint)entryPoint
{
  return self->_entryPoint;
}

- (void)setEntryPoint:(id)a3
{
}

- (int64_t)entryPointType
{
  return self->_entryPointType;
}

- (void)setEntryPointType:(int64_t)a3
{
  self->_int64_t entryPointType = a3;
}

- (int64_t)editState
{
  return self->_editState;
}

- (void)setEditState:(int64_t)a3
{
  self->_editState = a3;
}

- (CLLocationCoordinate2D)originalCoordinate
{
  double latitude = self->_originalCoordinate.latitude;
  double longitude = self->_originalCoordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)setOriginalCoordinate:(CLLocationCoordinate2D)a3
{
  self->_originalCoordinate = a3;
}

- (int64_t)originalEntryPointType
{
  return self->_originalEntryPointType;
}

- (void)setOriginalEntryPointType:(int64_t)a3
{
  self->_originalEntryPointType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryPoint, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tableView, 0);

  objc_storeStrong((id *)&self->_editLocationMapView, 0);
}

@end