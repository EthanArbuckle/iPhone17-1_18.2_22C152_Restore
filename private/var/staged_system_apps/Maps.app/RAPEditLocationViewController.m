@interface RAPEditLocationViewController
- (BOOL)_isInEditLocationMode;
- (BackgroundColorButton)addButton;
- (NSString)navigationTitle;
- (RAPCorrectableEntryPoints)correctableEntryPoints;
- (RAPEditLocationViewController)initWithInitialCoordinates:(CLLocationCoordinate2D)a3 inMapRect:(id)a4 analyticsTarget:(int)a5 markerViewAttributes:(id)a6 allowEditingEntryPoints:(BOOL)a7 correctableEntryPoints:(id)a8 selectionHandler:(id)a9 cancelSelectionHandler:(id)a10;
- (UISegmentedControl)editModeSegmentedControl;
- (id)cancelSelectionHandler;
- (id)selectionHandler;
- (id)userDidRequestCreationOfEntryPointWithCoordinates:(CLLocationCoordinate2D)a3 entryPointType:(int64_t)a4;
- (void)_presentEntryPointEditor:(id)a3;
- (void)addEntryPoint;
- (void)didTapCancel;
- (void)didTapDone;
- (void)editEntryPointController:(id)a3 willDismissWithViewMode:(int64_t)a4;
- (void)editLocationMapView:(id)a3 didChangeCenterCoordinate:(CLLocationCoordinate2D)a4;
- (void)editLocationMapView:(id)a3 didChangeViewMode:(int64_t)a4;
- (void)editLocationMapView:(id)a3 didSelectAnnotationView:(id)a4;
- (void)editLocationMapViewFinishedPanning:(id)a3;
- (void)editLocationMapViewFinishedZoomingIn:(id)a3;
- (void)editLocationMapViewFinishedZoomingOut:(id)a3;
- (void)reloadData;
- (void)selectedEditModeDidChange:(id)a3;
- (void)setAddButton:(id)a3;
- (void)setCancelSelectionHandler:(id)a3;
- (void)setCorrectableEntryPoints:(id)a3;
- (void)setEditModeSegmentedControl:(id)a3;
- (void)setNavigationTitle:(id)a3;
- (void)setSelectionHandler:(id)a3;
- (void)setupConstraints;
- (void)userDidRequestDeletionOfEntryPoint:(id)a3;
- (void)userDidRequestModificationOfEntryPoint:(id)a3 withCoordinates:(CLLocationCoordinate2D)a4 entryPointType:(int64_t)a5;
- (void)viewDidLoad;
@end

@implementation RAPEditLocationViewController

- (RAPEditLocationViewController)initWithInitialCoordinates:(CLLocationCoordinate2D)a3 inMapRect:(id)a4 analyticsTarget:(int)a5 markerViewAttributes:(id)a6 allowEditingEntryPoints:(BOOL)a7 correctableEntryPoints:(id)a8 selectionHandler:(id)a9 cancelSelectionHandler:(id)a10
{
  uint64_t v14 = *(void *)&a5;
  double var1 = a4.var1.var1;
  double var0 = a4.var1.var0;
  double v17 = a4.var0.var1;
  double v18 = a4.var0.var0;
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  v33.receiver = self;
  v33.super_class = (Class)RAPEditLocationViewController;
  v25 = -[EditLocationViewController initWithInitialCoordinates:inMapRect:analyticsTarget:markerViewAttributes:](&v33, "initWithInitialCoordinates:inMapRect:analyticsTarget:markerViewAttributes:", v14, a6, latitude, longitude, v18, v17, var0, var1);
  if (v25)
  {
    id v26 = [v23 copy];
    id selectionHandler = v25->_selectionHandler;
    v25->_id selectionHandler = v26;

    id v28 = [v24 copy];
    id cancelSelectionHandler = v25->_cancelSelectionHandler;
    v25->_id cancelSelectionHandler = v28;

    v30 = (RAPCorrectableEntryPoints *)[v22 copy];
    correctableEntryPoints = v25->_correctableEntryPoints;
    v25->_correctableEntryPoints = v30;

    v25->_allowEditingEntryPoints = a7;
  }

  return v25;
}

- (void)viewDidLoad
{
  v3 = [(RAPEditLocationViewController *)self navigationTitle];
  v4 = [(RAPEditLocationViewController *)self navigationItem];
  [v4 setTitle:v3];

  v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"Back" value:@"localized string not found" table:0];
  v7 = [(RAPEditLocationViewController *)self navigationItem];
  v8 = [v7 backBarButtonItem];
  [v8 setTitle:v6];

  if (self->_allowEditingEntryPoints)
  {
    v9 = +[NSBundle mainBundle];
    v10 = [v9 localizedStringForKey:@"Location [Report an Issue]" value:@"localized string not found" table:0];

    v11 = +[NSBundle mainBundle];
    v12 = [v11 localizedStringForKey:@"Entrances [Report an Issue]" value:@"localized string not found" table:0];

    id v13 = objc_alloc((Class)UISegmentedControl);
    v54[0] = v10;
    v54[1] = v12;
    uint64_t v14 = +[NSArray arrayWithObjects:v54 count:2];
    v15 = (UISegmentedControl *)[v13 initWithItems:v14];
    editModeSegmentedControl = self->_editModeSegmentedControl;
    self->_editModeSegmentedControl = v15;

    [(UISegmentedControl *)self->_editModeSegmentedControl setSelectedSegmentIndex:0];
    [(UISegmentedControl *)self->_editModeSegmentedControl addTarget:self action:"selectedEditModeDidChange:" forControlEvents:4096];
    double v17 = [(RAPEditLocationViewController *)self editModeSegmentedControl];
    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];

    double v18 = [(RAPEditLocationViewController *)self view];
    v19 = [(RAPEditLocationViewController *)self editModeSegmentedControl];
    [v18 addSubview:v19];
  }
  id v20 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"didTapDone"];
  v21 = [(RAPEditLocationViewController *)self navigationItem];
  [v21 setRightBarButtonItem:v20];

  id v22 = [(RAPEditLocationViewController *)self navigationItem];
  id v23 = [v22 rightBarButtonItem];
  [v23 setEnabled:0];

  id v24 = [(RAPEditLocationViewController *)self cancelSelectionHandler];

  if (v24)
  {
    id v25 = objc_alloc((Class)UIBarButtonItem);
    id v26 = +[NSBundle mainBundle];
    v27 = [v26 localizedStringForKey:@"Cancel [Report an Issue]" value:@"localized string not found" table:0];
    id v28 = [v25 initWithTitle:v27 style:0 target:self action:"didTapCancel"];
    v29 = [(RAPEditLocationViewController *)self navigationItem];
    [v29 setLeftBarButtonItem:v28];
  }
  v30 = [(EditLocationViewController *)self editLocationMapView];
  [v30 setTranslatesAutoresizingMaskIntoConstraints:0];

  v31 = [(RAPEditLocationViewController *)self view];
  v32 = [(EditLocationViewController *)self editLocationMapView];
  [v31 addSubview:v32];

  if (self->_allowEditingEntryPoints)
  {
    objc_super v33 = +[BackgroundColorButton buttonWithType:0];
    addButton = self->_addButton;
    self->_addButton = v33;

    v35 = self->_addButton;
    v36 = +[NSBundle mainBundle];
    v37 = [v36 localizedStringForKey:@"Add Entrance [Report an Issue]" value:@"localized string not found" table:0];
    [(BackgroundColorButton *)v35 setTitle:v37 forState:0];

    v38 = self->_addButton;
    v39 = +[UIColor systemBackgroundColor];
    [(BackgroundColorButton *)v38 setBackgroundColor:v39 forState:0];

    v40 = self->_addButton;
    v41 = +[UIColor systemBlueColor];
    [(BackgroundColorButton *)v40 setTitleColor:v41 forState:0];

    [(BackgroundColorButton *)self->_addButton addTarget:self action:"addEntryPoint" forControlEvents:64];
    v42 = +[UIScreen mainScreen];
    [v42 nativeScale];
    double v44 = 1.0 / v43;

    v45 = [(BackgroundColorButton *)self->_addButton layer];
    [v45 setBorderWidth:v44];

    v46 = [(BackgroundColorButton *)self->_addButton theme];
    id v47 = [v46 hairlineColor];
    id v48 = [v47 CGColor];
    v49 = [(BackgroundColorButton *)self->_addButton layer];
    [v49 setBorderColor:v48];

    v50 = [(BackgroundColorButton *)self->_addButton traitCollection];
    +[UISegmentedControl _cornerRadiusForTraitCollection:v50 size:0];
    -[BackgroundColorButton _setContinuousCornerRadius:](self->_addButton, "_setContinuousCornerRadius:");

    [(BackgroundColorButton *)self->_addButton setHidden:1];
    [(BackgroundColorButton *)self->_addButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v51 = [(RAPEditLocationViewController *)self view];
    [v51 addSubview:self->_addButton];
  }
  v53.receiver = self;
  v53.super_class = (Class)RAPEditLocationViewController;
  [(EditLocationViewController *)&v53 viewDidLoad];
  v52 = [(RAPEditLocationViewController *)self view];
  [v52 bringSubviewToFront:self->_addButton];
}

- (void)setupConstraints
{
  id v67 = objc_alloc_init((Class)NSMutableArray);
  v65 = [(EditLocationViewController *)self editLocationMapView];
  v61 = [v65 leadingAnchor];
  v63 = [(RAPEditLocationViewController *)self view];
  v59 = [v63 leadingAnchor];
  v57 = [v61 constraintEqualToAnchor:v59];
  v69[0] = v57;
  v55 = [(EditLocationViewController *)self editLocationMapView];
  objc_super v53 = [v55 trailingAnchor];
  v3 = [(RAPEditLocationViewController *)self view];
  v4 = [v3 trailingAnchor];
  v5 = [v53 constraintEqualToAnchor:v4];
  v69[1] = v5;
  v6 = [(EditLocationViewController *)self editLocationMapView];
  v7 = [v6 bottomAnchor];
  v8 = [(RAPEditLocationViewController *)self view];
  v9 = [v8 bottomAnchor];
  v10 = [v7 constraintEqualToAnchor:v9];
  v69[2] = v10;
  v11 = +[NSArray arrayWithObjects:v69 count:3];
  [v67 addObjectsFromArray:v11];

  if (self->_allowEditingEntryPoints)
  {
    v51 = [(RAPEditLocationViewController *)self editModeSegmentedControl];
    double v43 = [v51 leadingAnchor];
    v50 = [(RAPEditLocationViewController *)self view];
    v46 = [v50 layoutMarginsGuide];
    uint64_t v41 = [v46 leadingAnchor];
    uint64_t v42 = [v43 constraintEqualToAnchor:v41 constant:8.0];
    v68[0] = v42;
    v66 = [(RAPEditLocationViewController *)self editModeSegmentedControl];
    v60 = [v66 trailingAnchor];
    v64 = [(RAPEditLocationViewController *)self view];
    v62 = [v64 layoutMarginsGuide];
    v58 = [v62 trailingAnchor];
    v56 = [v60 constraintEqualToAnchor:v58 constant:-8.0];
    v68[1] = v56;
    v54 = [(RAPEditLocationViewController *)self editModeSegmentedControl];
    id v48 = [v54 topAnchor];
    v52 = [(RAPEditLocationViewController *)self view];
    v49 = [v52 safeAreaLayoutGuide];
    id v47 = [v49 topAnchor];
    v45 = [v48 constraintEqualToAnchor:v47 constant:15.0];
    v68[2] = v45;
    double v44 = [(EditLocationViewController *)self editLocationMapView];
    v39 = [v44 topAnchor];
    v40 = [(RAPEditLocationViewController *)self editModeSegmentedControl];
    v38 = [v40 bottomAnchor];
    v37 = [v39 constraintEqualToAnchor:v38 constant:15.0];
    v68[3] = v37;
    v36 = [(RAPEditLocationViewController *)self addButton];
    v34 = [v36 leadingAnchor];
    v35 = [(EditLocationViewController *)self editLocationMapView];
    objc_super v33 = [v35 leadingContentGuide];
    v32 = [v34 constraintEqualToAnchor:v33];
    v68[4] = v32;
    v31 = [(RAPEditLocationViewController *)self addButton];
    v29 = [v31 trailingAnchor];
    v30 = [(EditLocationViewController *)self editLocationMapView];
    id v28 = [v30 trailingContentGuide];
    v12 = [v29 constraintEqualToAnchor:v28];
    v68[5] = v12;
    id v13 = [(RAPEditLocationViewController *)self addButton];
    uint64_t v14 = [v13 bottomAnchor];
    v15 = [(EditLocationViewController *)self editLocationMapView];
    v16 = [v15 bottomContentGuide];
    double v17 = [v14 constraintEqualToAnchor:v16 constant:-8.0];
    v68[6] = v17;
    double v18 = [(RAPEditLocationViewController *)self addButton];
    v19 = [v18 heightAnchor];
    id v20 = [v19 constraintEqualToConstant:45.0];
    v68[7] = v20;
    v21 = +[NSArray arrayWithObjects:v68 count:8];
    [v67 addObjectsFromArray:v21];

    id v22 = (void *)v41;
    id v23 = v43;

    id v24 = (void *)v42;
    id v25 = v46;

    id v26 = v51;
    v27 = v50;
  }
  else
  {
    id v26 = [(EditLocationViewController *)self editLocationMapView];
    id v23 = [v26 topAnchor];
    v27 = [(RAPEditLocationViewController *)self view];
    id v25 = [v27 safeAreaLayoutGuide];
    id v22 = [v25 topAnchor];
    id v24 = [v23 constraintEqualToAnchor:v22];
    [v67 addObject:v24];
  }

  +[NSLayoutConstraint activateConstraints:v67];
}

- (NSString)navigationTitle
{
  navigationTitle = self->_navigationTitle;
  if (!navigationTitle)
  {
    BOOL allowEditingEntryPoints = self->_allowEditingEntryPoints;
    v5 = +[NSBundle mainBundle];
    v6 = v5;
    if (allowEditingEntryPoints) {
      CFStringRef v7 = @"Location & Entrances [Report an Issue]";
    }
    else {
      CFStringRef v7 = @"Edit Location [Report an Issue]";
    }
    v8 = [v5 localizedStringForKey:v7 value:@"localized string not found" table:0];
    v9 = self->_navigationTitle;
    self->_navigationTitle = v8;

    navigationTitle = self->_navigationTitle;
  }

  return navigationTitle;
}

- (void)editLocationMapView:(id)a3 didChangeCenterCoordinate:(CLLocationCoordinate2D)a4
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  if ([(RAPEditLocationViewController *)self _isInEditLocationMode])
  {
    self->_lastEditLocationCoordinate.double latitude = latitude;
    self->_lastEditLocationCoordinate.double longitude = longitude;
    if (longitude >= -180.0 && longitude <= 180.0 && latitude >= -90.0 && latitude <= 90.0)
    {
      id v8 = [(RAPEditLocationViewController *)self navigationItem];
      CFStringRef v7 = [v8 rightBarButtonItem];
      [v7 setEnabled:1];
    }
  }
}

- (void)didTapCancel
{
  [(EditLocationViewController *)self _captureUserAction:18];
  v3 = [(RAPEditLocationViewController *)self cancelSelectionHandler];

  if (v3)
  {
    v4 = [(RAPEditLocationViewController *)self cancelSelectionHandler];
    v4[2]();
  }
  id v6 = [(RAPEditLocationViewController *)self navigationController];
  id v5 = [v6 popViewControllerAnimated:1];
}

- (void)didTapDone
{
  [(EditLocationViewController *)self _captureUserAction:41];
  unsigned int v3 = [(RAPEditLocationViewController *)self _isInEditLocationMode];
  v4 = [(RAPEditLocationViewController *)self selectionHandler];
  if (v3)
  {
    id v5 = [(EditLocationViewController *)self editLocationMapView];
    [v5 centerCoordinate];
    double v7 = v6;
    double v9 = v8;
    v10 = [(RAPEditLocationViewController *)self correctableEntryPoints];
    ((void (**)(void, void *, double, double))v4)[2](v4, v10, v7, v9);
  }
  else
  {
    id v5 = [(RAPEditLocationViewController *)self correctableEntryPoints];
    ((void (**)(void, void *, double, double))v4)[2](v4, v5, self->_lastEditLocationCoordinate.latitude, self->_lastEditLocationCoordinate.longitude);
  }

  id v12 = [(RAPEditLocationViewController *)self navigationController];
  id v11 = [v12 popViewControllerAnimated:1];
}

- (void)reloadData
{
  unsigned int v3 = [(EditLocationViewController *)self editLocationMapView];
  id v13 = [v3 mapView];

  v4 = [v13 annotations];
  [v13 removeAnnotations:v4];

  id v5 = objc_alloc((Class)MKPointAnnotation);
  double v6 = [(EditLocationViewController *)self attributes];
  double v7 = [v6 title];
  id v8 = [v5 initWithCoordinate:v7 title:0 subtitle:self->_lastEditLocationCoordinate.latitude, self->_lastEditLocationCoordinate.longitude];

  id v9 = objc_alloc((Class)NSMutableArray);
  v10 = [(RAPEditLocationViewController *)self correctableEntryPoints];
  id v11 = [v10 workingPoints];
  id v12 = [v9 initWithArray:v11];

  [v12 addObject:v8];
  [v13 showAnnotations:v12 animated:0];
}

- (void)selectedEditModeDidChange:(id)a3
{
  if ([(RAPEditLocationViewController *)self _isInEditLocationMode])
  {
    v4 = [(EditLocationViewController *)self editLocationMapView];
    [v4 setCrosshairEnabled:1];

    id v5 = [(EditLocationViewController *)self editLocationMapView];
    double v6 = [v5 mapView];
    double v7 = [(EditLocationViewController *)self editLocationMapView];
    id v8 = [v7 mapView];
    id v9 = [v8 annotations];
    [v6 removeAnnotations:v9];

    v10 = +[NSBundle mainBundle];
    id v11 = [v10 localizedStringForKey:@"Pan & zoom map to refine location [Report an Issue]" value:@"localized string not found" table:0];
    id v12 = [(EditLocationViewController *)self editLocationMapView];
    [v12 setPrompt:v11];

    [(BackgroundColorButton *)self->_addButton setHidden:1];
    id v13 = [(EditLocationViewController *)self editLocationMapView];
    uint64_t v14 = [v13 mapView];
    [v14 setCenterCoordinate:0, self->_lastEditLocationCoordinate.latitude, self->_lastEditLocationCoordinate.longitude];
    uint64_t v15 = 10184;
  }
  else
  {
    v16 = [(EditLocationViewController *)self editLocationMapView];
    double v17 = [v16 mapView];
    [v17 centerCoordinate];
    self->_lastEditLocationCoordinate.double latitude = v18;
    self->_lastEditLocationCoordinate.double longitude = v19;

    id v20 = [(EditLocationViewController *)self editLocationMapView];
    [v20 setCrosshairEnabled:0];

    [(RAPEditLocationViewController *)self reloadData];
    [(BackgroundColorButton *)self->_addButton setHidden:0];
    v21 = [(RAPEditLocationViewController *)self correctableEntryPoints];
    id v22 = [v21 workingPoints];
    id v23 = [v22 count];

    if (v23)
    {
      id v13 = +[NSBundle mainBundle];
      uint64_t v14 = [v13 localizedStringForKey:@"Choose an entrance to edit [Report an Issue]" value:@"localized string not found" table:0];
      id v24 = [(EditLocationViewController *)self editLocationMapView];
      [v24 setPrompt:v14];
    }
    else
    {
      id v13 = +[NSString string];
      uint64_t v14 = [(EditLocationViewController *)self editLocationMapView];
      [v14 setPrompt:v13];
    }
    uint64_t v15 = 10187;
  }

  [(EditLocationViewController *)self _captureUserAction:v15];
}

- (void)addEntryPoint
{
  [(EditLocationViewController *)self _captureUserAction:10189];
  unsigned int v3 = [RAPEditEntryPointViewController alloc];
  v4 = [(EditLocationViewController *)self editLocationMapView];
  id v5 = [v4 mapView];
  [v5 visibleMapRect];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  uint64_t v14 = [(EditLocationViewController *)self editLocationMapView];
  uint64_t v15 = -[RAPEditEntryPointViewController initWithMapRect:entryPoint:delegate:initialViewMode:](v3, "initWithMapRect:entryPoint:delegate:initialViewMode:", 0, self, [v14 viewMode], v7, v9, v11, v13);

  [(RAPEditLocationViewController *)self _presentEntryPointEditor:v15];
}

- (void)_presentEntryPointEditor:(id)a3
{
  id v4 = a3;
  id v7 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v4];
  [v7 setModalPresentationStyle:2];
  [v7 setModalInPresentation:1];
  id v5 = [(RAPEditLocationViewController *)self navigationController];
  [v7 setOverrideUserInterfaceStyle:[v5 overrideUserInterfaceStyle]];

  double v6 = [(RAPEditLocationViewController *)self navigationController];
  objc_msgSend(v4, "setOverrideUserInterfaceStyle:", objc_msgSend(v6, "overrideUserInterfaceStyle"));

  [(RAPEditLocationViewController *)self presentViewController:v7 animated:1 completion:0];
}

- (void)userDidRequestDeletionOfEntryPoint:(id)a3
{
  id v4 = a3;
  id v5 = [(RAPEditLocationViewController *)self correctableEntryPoints];
  [v5 removeEntryPoint:v4];

  [(RAPEditLocationViewController *)self reloadData];
  id v7 = [(RAPEditLocationViewController *)self navigationItem];
  double v6 = [v7 rightBarButtonItem];
  [v6 setEnabled:1];
}

- (id)userDidRequestCreationOfEntryPointWithCoordinates:(CLLocationCoordinate2D)a3 entryPointType:(int64_t)a4
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  double v8 = [(RAPEditLocationViewController *)self correctableEntryPoints];
  double v9 = [v8 createEntryPointWithCoordinates:a4 entryPointType:latitude longitude:longitude];

  [(RAPEditLocationViewController *)self reloadData];
  double v10 = [(RAPEditLocationViewController *)self navigationItem];
  double v11 = [v10 rightBarButtonItem];
  [v11 setEnabled:1];

  return v9;
}

- (void)userDidRequestModificationOfEntryPoint:(id)a3 withCoordinates:(CLLocationCoordinate2D)a4 entryPointType:(int64_t)a5
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  id v9 = a3;
  double v10 = [(RAPEditLocationViewController *)self correctableEntryPoints];
  [v10 modifyEntryPoint:v9 withCoordinates:a5 entryPointType:latitude longitude];

  [(RAPEditLocationViewController *)self reloadData];
  id v12 = [(RAPEditLocationViewController *)self navigationItem];
  double v11 = [v12 rightBarButtonItem];
  [v11 setEnabled:1];
}

- (void)editEntryPointController:(id)a3 willDismissWithViewMode:(int64_t)a4
{
  id v5 = [(EditLocationViewController *)self editLocationMapView];
  [v5 setViewMode:a4];
}

- (void)editLocationMapView:(id)a3 didSelectAnnotationView:(id)a4
{
  id v21 = a4;
  id v5 = [v21 annotation];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    [(EditLocationViewController *)self _captureUserAction:10188];
    id v7 = [v21 annotation];
    double v8 = [RAPEditEntryPointViewController alloc];
    id v9 = [(EditLocationViewController *)self editLocationMapView];
    double v10 = [v9 mapView];
    [v10 visibleMapRect];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    CLLocationDegrees v19 = [(EditLocationViewController *)self editLocationMapView];
    id v20 = -[RAPEditEntryPointViewController initWithMapRect:entryPoint:delegate:initialViewMode:](v8, "initWithMapRect:entryPoint:delegate:initialViewMode:", v7, self, [v19 viewMode], v12, v14, v16, v18);

    [(RAPEditLocationViewController *)self _presentEntryPointEditor:v20];
  }
}

- (BOOL)_isInEditLocationMode
{
  return !self->_allowEditingEntryPoints
      || [(UISegmentedControl *)self->_editModeSegmentedControl selectedSegmentIndex] == 0;
}

- (void)editLocationMapViewFinishedPanning:(id)a3
{
  id v4 = a3;
  if ([(RAPEditLocationViewController *)self _isInEditLocationMode])
  {
    v5.receiver = self;
    v5.super_class = (Class)RAPEditLocationViewController;
    [(EditLocationViewController *)&v5 editLocationMapViewFinishedPanning:v4];
  }
}

- (void)editLocationMapViewFinishedZoomingIn:(id)a3
{
  id v4 = a3;
  if ([(RAPEditLocationViewController *)self _isInEditLocationMode])
  {
    v5.receiver = self;
    v5.super_class = (Class)RAPEditLocationViewController;
    [(EditLocationViewController *)&v5 editLocationMapViewFinishedZoomingIn:v4];
  }
}

- (void)editLocationMapViewFinishedZoomingOut:(id)a3
{
  id v4 = a3;
  if ([(RAPEditLocationViewController *)self _isInEditLocationMode])
  {
    v5.receiver = self;
    v5.super_class = (Class)RAPEditLocationViewController;
    [(EditLocationViewController *)&v5 editLocationMapViewFinishedZoomingOut:v4];
  }
}

- (void)editLocationMapView:(id)a3 didChangeViewMode:(int64_t)a4
{
  id v6 = a3;
  if ([(RAPEditLocationViewController *)self _isInEditLocationMode])
  {
    v7.receiver = self;
    v7.super_class = (Class)RAPEditLocationViewController;
    [(EditLocationViewController *)&v7 editLocationMapView:v6 didChangeViewMode:a4];
  }
}

- (void)setNavigationTitle:(id)a3
{
}

- (BackgroundColorButton)addButton
{
  return self->_addButton;
}

- (void)setAddButton:(id)a3
{
}

- (UISegmentedControl)editModeSegmentedControl
{
  return self->_editModeSegmentedControl;
}

- (void)setEditModeSegmentedControl:(id)a3
{
}

- (RAPCorrectableEntryPoints)correctableEntryPoints
{
  return self->_correctableEntryPoints;
}

- (void)setCorrectableEntryPoints:(id)a3
{
}

- (id)selectionHandler
{
  return self->_selectionHandler;
}

- (void)setSelectionHandler:(id)a3
{
}

- (id)cancelSelectionHandler
{
  return self->_cancelSelectionHandler;
}

- (void)setCancelSelectionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelSelectionHandler, 0);
  objc_storeStrong(&self->_selectionHandler, 0);
  objc_storeStrong((id *)&self->_correctableEntryPoints, 0);
  objc_storeStrong((id *)&self->_editModeSegmentedControl, 0);
  objc_storeStrong((id *)&self->_addButton, 0);

  objc_storeStrong((id *)&self->_navigationTitle, 0);
}

@end