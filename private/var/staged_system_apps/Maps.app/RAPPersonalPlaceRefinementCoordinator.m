@interface RAPPersonalPlaceRefinementCoordinator
- (CLLocationCoordinate2D)originalCoordinate;
- (RAPPersonalPlaceCorrectionsQuestion)question;
- (RAPPersonalPlaceRefinementCoordinator)initWithPresentingViewController:(id)a3 delegate:(id)a4 report:(id)a5 question:(id)a6;
- (RAPPersonalPlaceRefinementCoordinator)initWithPresentingViewController:(id)a3 delegate:(id)a4 shortcut:(id)a5;
- (id)_navigationControllerWithRootViewController:(id)a3;
- (id)_refinementAlertController;
- (void)_cancelLocationRefinement;
- (void)_commonInitWithPresentingViewController:(id)a3 delegate:(id)a4 presentationStyle:(int64_t)a5 shortcut:(id)a6;
- (void)_createRAPContext;
- (void)_doneLocationRefinement;
- (void)_presentLocationRefinement;
- (void)beginShortcutRefinement;
@end

@implementation RAPPersonalPlaceRefinementCoordinator

- (RAPPersonalPlaceRefinementCoordinator)initWithPresentingViewController:(id)a3 delegate:(id)a4 shortcut:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)RAPPersonalPlaceRefinementCoordinator;
  v11 = [(RAPPersonalPlaceRefinementCoordinator *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(RAPPersonalPlaceRefinementCoordinator *)v11 _commonInitWithPresentingViewController:v8 delegate:v9 presentationStyle:1 shortcut:v10];
    [(RAPPersonalPlaceRefinementCoordinator *)v12 _createRAPContext];
  }

  return v12;
}

- (RAPPersonalPlaceRefinementCoordinator)initWithPresentingViewController:(id)a3 delegate:(id)a4 report:(id)a5 question:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)RAPPersonalPlaceRefinementCoordinator;
  objc_super v14 = [(RAPPersonalPlaceRefinementCoordinator *)&v17 init];
  if (v14)
  {
    v15 = [v13 shortcut];
    [(RAPPersonalPlaceRefinementCoordinator *)v14 _commonInitWithPresentingViewController:v10 delegate:v11 presentationStyle:0 shortcut:v15];

    objc_storeStrong((id *)&v14->_question, a6);
    objc_storeStrong((id *)&v14->_report, a5);
  }

  return v14;
}

- (void)_commonInitWithPresentingViewController:(id)a3 delegate:(id)a4 presentationStyle:(int64_t)a5 shortcut:(id)a6
{
  id v10 = (RAPPersonalPlaceRefinementCoordinatorDelegate *)a4;
  self->_presentationStyle = a5;
  objc_storeStrong((id *)&self->_shortcut, a6);
  id v11 = a6;
  id v12 = a3;
  objc_storeWeak((id *)&self->_parentViewController, v12);

  delegate = self->_delegate;
  self->_delegate = v10;

  self->_hasDisplayedRefinementAlert = 0;
}

- (void)_createRAPContext
{
  id v14 = +[UIApplication sharedMapsDelegate];
  v3 = [RAPAppStateCreator alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
  v5 = [WeakRetained _maps_mapsSceneDelegate];
  v6 = [(RAPAppStateCreator *)v3 initWithSceneDelegate:v5];

  v7 = [(RAPAppStateCreator *)v6 createReportAProblemAppState];
  id v8 = [RAPReport alloc];
  id v9 = [v14 submissionManager];
  id v10 = [(RAPReport *)v8 initWithContext:v7 submitter:v9];
  report = self->_report;
  self->_report = v10;

  id v12 = [[RAPPersonalPlaceCorrectionsQuestion alloc] initWithReport:self->_report parentQuestion:0 shortcut:self->_shortcut];
  question = self->_question;
  self->_question = v12;

  [(RAPReport *)self->_report setInitialQuestion:self->_question];
  [(RAPPersonalPlaceCorrectionsQuestion *)self->_question addUserPathItem:1];
}

- (void)beginShortcutRefinement
{
}

- (id)_refinementAlertController
{
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"Continue Refining location [Personal Place]" value:@"localized string not found" table:0];

  v5 = &stru_101324E70;
  v6 = 0;
  v7 = &stru_101324E70;
  id v8 = &stru_101324E70;
  switch((unint64_t)[(MapsSuggestionsShortcut *)self->_shortcut type])
  {
    case 0uLL:
    case 1uLL:
    case 6uLL:
      goto LABEL_11;
    case 2uLL:
      id v9 = +[NSBundle mainBundle];
      id v8 = [v9 localizedStringForKey:@"Change Home Address? [Personal Place]" value:@"localized string not found" table:0];

      id v10 = +[NSBundle mainBundle];
      v7 = [v10 localizedStringForKey:@"Change Home Address Description [Personal Place]" value:@"localized string not found" table:0];

      id v11 = +[NSBundle mainBundle];
      id v12 = v11;
      CFStringRef v13 = @"Change Home Address [Personal Place]";
      goto LABEL_5;
    case 3uLL:
      id v14 = +[NSBundle mainBundle];
      id v8 = [v14 localizedStringForKey:@"Change Work Address? [Personal Place]" value:@"localized string not found" table:0];

      v15 = +[NSBundle mainBundle];
      v7 = [v15 localizedStringForKey:@"Change Work Address Description [Personal Place]" value:@"localized string not found" table:0];

      id v11 = +[NSBundle mainBundle];
      id v12 = v11;
      CFStringRef v13 = @"Change Work Address [Personal Place]";
      goto LABEL_5;
    case 4uLL:
      break;
    case 5uLL:
      v16 = +[NSBundle mainBundle];
      id v8 = [v16 localizedStringForKey:@"Change School Address? [Personal Place]" value:@"localized string not found" table:0];

      objc_super v17 = +[NSBundle mainBundle];
      v7 = [v17 localizedStringForKey:@"Change School Address Description [Personal Place]" value:@"localized string not found" table:0];

      id v11 = +[NSBundle mainBundle];
      id v12 = v11;
      CFStringRef v13 = @"Change School Address [Personal Place]";
LABEL_5:
      v5 = [v11 localizedStringForKey:v13 value:@"localized string not found" table:0];

      break;
    default:
      v7 = &stru_101324E70;
      id v8 = &stru_101324E70;
      break;
  }
  if (![(__CFString *)v8 length])
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      goto LABEL_24;
    }
    LOWORD(location[0]) = 0;
    v21 = "Assertion failed: changeAddressPrompt.length > 0";
LABEL_23:
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, v21, (uint8_t *)location, 2u);
    goto LABEL_24;
  }
  if (![(__CFString *)v7 length])
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      goto LABEL_24;
    }
    LOWORD(location[0]) = 0;
    v21 = "Assertion failed: changeAddressDescription.length > 0";
    goto LABEL_23;
  }
  if (![(__CFString *)v5 length])
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      goto LABEL_24;
    }
    LOWORD(location[0]) = 0;
    v21 = "Assertion failed: changeAddressSelection.length > 0";
    goto LABEL_23;
  }
  if ([v4 length])
  {
    v6 = +[UIAlertController alertControllerWithTitle:v8 message:v7 preferredStyle:1];
    v18 = +[UIAlertAction actionWithTitle:v4 style:0 handler:0];
    [v6 addAction:v18];

    objc_initWeak(location, self);
    v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472;
    v24 = sub_100B58DE4;
    v25 = &unk_101313470;
    objc_copyWeak(&v27, location);
    v26 = self;
    v19 = +[UIAlertAction actionWithTitle:v5 style:1 handler:&v22];
    [v6 addAction:v19, v22, v23, v24, v25];

    objc_destroyWeak(&v27);
    objc_destroyWeak(location);
    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    LOWORD(location[0]) = 0;
    v21 = "Assertion failed: continueRefiningLocation.length > 0";
    goto LABEL_23;
  }
LABEL_24:
  v6 = 0;
LABEL_11:

  return v6;
}

- (void)_presentLocationRefinement
{
  [(RAPPersonalPlaceRefinementCoordinator *)self originalCoordinate];
  double latitude = v39.latitude;
  double longitude = v39.longitude;
  MKCoordinateRegionMakeWithDistance(v39, 100.0, 100.0);
  [(MapsSuggestionsShortcut *)self->_shortcut type];
  uint64_t v5 = MapsSuggestionsShortcutTypeStyleAttributes();
  v6 = [[RAPMarkerViewAttributes alloc] initWithTitle:0 styleAttributes:v5];
  v7 = [EditLocationViewController alloc];
  MKMapRectForCoordinateRegion();
  id v12 = -[EditLocationViewController initWithInitialCoordinates:inMapRect:analyticsTarget:markerViewAttributes:](v7, "initWithInitialCoordinates:inMapRect:analyticsTarget:markerViewAttributes:", 603, v6, latitude, longitude, v8, v9, v10, v11);
  editLocationViewController = self->_editLocationViewController;
  self->_editLocationViewController = v12;

  objc_initWeak(&location, self);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100B59378;
  v36[3] = &unk_101319208;
  objc_copyWeak(v37, &location);
  v37[1] = *(id *)&latitude;
  v37[2] = *(id *)&longitude;
  [(EditLocationViewController *)self->_editLocationViewController setChangeHandler:v36];
  id v14 = +[NSBundle mainBundle];
  v15 = [v14 localizedStringForKey:@"Refine Home Location" value:@"localized string not found" table:0];

  if ([(MapsSuggestionsShortcut *)self->_shortcut type] == (id)3)
  {
    v16 = +[NSBundle mainBundle];
    uint64_t v17 = [v16 localizedStringForKey:@"Refine Work Location" value:@"localized string not found" table:0];

    v15 = (void *)v17;
  }
  v35 = (void *)v5;
  if ([(MapsSuggestionsShortcut *)self->_shortcut type] == (id)5)
  {
    v18 = +[NSBundle mainBundle];
    uint64_t v19 = [v18 localizedStringForKey:@"Refine School Location" value:@"localized string not found" table:0];

    v15 = (void *)v19;
  }
  v20 = +[NSBundle mainBundle];
  v21 = [v20 localizedStringForKey:@"[Shortcut] Done" value:@"localized string not found" table:0];

  v22 = +[NSBundle mainBundle];
  uint64_t v23 = [v22 localizedStringForKey:@"[Shortcut] Cancel" value:@"localized string not found" table:0];

  v24 = [(EditLocationViewController *)self->_editLocationViewController navigationItem];
  [v24 setTitle:v15];

  id v25 = [objc_alloc((Class)UIBarButtonItem) initWithTitle:v21 style:2 target:self action:"_doneLocationRefinement"];
  v26 = [(EditLocationViewController *)self->_editLocationViewController navigationItem];
  [v26 setRightBarButtonItem:v25];

  if (self->_presentationStyle != 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
    v33 = [WeakRetained navigationController];
    [v33 pushViewController:self->_editLocationViewController animated:1];
LABEL_11:

    goto LABEL_12;
  }
  id v27 = [objc_alloc((Class)UIBarButtonItem) initWithTitle:v23 style:0 target:self action:"_cancelLocationRefinement"];
  v28 = [(EditLocationViewController *)self->_editLocationViewController navigationItem];
  [v28 setLeftBarButtonItem:v27];

  id WeakRetained = [(RAPPersonalPlaceRefinementCoordinator *)self _navigationControllerWithRootViewController:self->_editLocationViewController];
  id v30 = objc_loadWeakRetained((id *)&self->_parentViewController);
  v31 = [v30 traitCollection];
  id v32 = [v31 userInterfaceIdiom];

  if (v32 != (id)5)
  {
    v33 = objc_loadWeakRetained((id *)&self->_parentViewController);
    [v33 _maps_topMostPresentViewController:WeakRetained animated:1 completion:0];
    goto LABEL_11;
  }
  if (objc_opt_respondsToSelector()) {
    [(RAPPersonalPlaceRefinementCoordinatorDelegate *)self->_delegate refinementCoordinator:self presentViewController:WeakRetained];
  }
LABEL_12:

  objc_destroyWeak(v37);
  objc_destroyWeak(&location);
}

- (void)_cancelLocationRefinement
{
  if (self->_presentationStyle == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
    v4 = [WeakRetained traitCollection];
    id v5 = [v4 userInterfaceIdiom];

    objc_initWeak(&location, self);
    editLocationViewController = self->_editLocationViewController;
    if (v5 == (id)5)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100B595C4;
      v10[3] = &unk_1012E6708;
      v7 = &v11;
      objc_copyWeak(&v11, &location);
      [(EditLocationViewController *)editLocationViewController dismissViewControllerAnimated:1 completion:v10];
    }
    else
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100B5962C;
      v8[3] = &unk_1012E6708;
      v7 = &v9;
      objc_copyWeak(&v9, &location);
      [(EditLocationViewController *)editLocationViewController dismissViewControllerAnimated:1 completion:v8];
    }
    objc_destroyWeak(v7);
    objc_destroyWeak(&location);
  }
}

- (void)_doneLocationRefinement
{
  question = self->_question;
  [(EditLocationViewController *)self->_editLocationViewController selectedCoordinate];
  -[RAPPersonalPlaceCorrectionsQuestion setCorrectedCoordinate:](question, "setCorrectedCoordinate:");
  [(RAPPersonalPlaceCorrectionsQuestion *)self->_question addUserPathItem:5];
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_delegate;
    [(EditLocationViewController *)self->_editLocationViewController selectedCoordinate];
    -[RAPPersonalPlaceRefinementCoordinatorDelegate refinementCoordinator:finishedRefiningCoordinate:withShortcut:](delegate, "refinementCoordinator:finishedRefiningCoordinate:withShortcut:", self, self->_shortcut);
  }
  if (self->_presentationStyle == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
    v6 = [WeakRetained traitCollection];
    id v7 = [v6 userInterfaceIdiom];

    if (v7 == (id)5)
    {
      objc_initWeak(&location, self);
      double v8 = [(EditLocationViewController *)self->_editLocationViewController navigationController];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100B59870;
      v11[3] = &unk_1012E6708;
      objc_copyWeak(&v12, &location);
      [v8 dismissViewControllerAnimated:1 completion:v11];

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
      return;
    }
    id v10 = [(EditLocationViewController *)self->_editLocationViewController navigationController];
    [v10 dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    id v10 = [(EditLocationViewController *)self->_editLocationViewController navigationController];
    id v9 = [v10 popViewControllerAnimated:1];
  }
}

- (id)_navigationControllerWithRootViewController:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v3];

  [v4 setModalPresentationStyle:2];
  [v4 setModalInPresentation:1];

  return v4;
}

- (CLLocationCoordinate2D)originalCoordinate
{
  id v3 = [(MapsSuggestionsShortcut *)self->_shortcut geoMapItem];
  [v3 coordinate];
  CLLocationDegrees v5 = v4;
  v6 = [(MapsSuggestionsShortcut *)self->_shortcut geoMapItem];
  [v6 coordinate];
  CLLocationCoordinate2D v8 = CLLocationCoordinate2DMake(v5, v7);

  double latitude = v8.latitude;
  double longitude = v8.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (RAPPersonalPlaceCorrectionsQuestion)question
{
  return self->_question;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_question, 0);
  objc_storeStrong((id *)&self->_homeWorkCorrectionsViewController, 0);
  objc_storeStrong((id *)&self->_editLocationViewController, 0);
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_shortcut, 0);

  objc_storeStrong((id *)&self->_report, 0);
}

@end