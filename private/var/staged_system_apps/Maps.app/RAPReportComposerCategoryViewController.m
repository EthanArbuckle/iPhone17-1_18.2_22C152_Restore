@interface RAPReportComposerCategoryViewController
- (BOOL)_shouldUseServerControlledUI;
- (RAPReportComposerCategoryViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5;
- (int)analyticTarget;
- (void)_cancel;
- (void)_proceedToIncidentsQuestion:(id)a3;
- (void)dealloc;
- (void)incidentsReportingEnablementDidUpdate;
- (void)proceedToArrivalTimeIncorrectQuestion:(id)a3;
- (void)proceedToBadRouteSuggestionsQuestion:(id)a3;
- (void)proceedToIncorrectSearchResultsQuestion:(id)a3;
- (void)proceedToLabelCorrectionsQuestion:(id)a3;
- (void)proceedToNextQuestion:(id)a3;
- (void)proceedToPlaceClosureQuestion:(id)a3;
- (void)proceedToProblemNotListedQuestion:(id)a3;
- (void)proceedToProblemWithDirectionsQuestion:(id)a3;
- (void)proceedToRAPPersonalPlaceCorrectionsQuestion:(id)a3;
- (void)refinementCoordinator:(id)a3 finishedRefiningCoordinate:(CLLocationCoordinate2D)a4 withShortcut:(id)a5;
- (void)refinementCoordinatorRequestsChangeAddress:(id)a3 withShortcut:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation RAPReportComposerCategoryViewController

- (RAPReportComposerCategoryViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5
{
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)RAPReportComposerCategoryViewController;
  v10 = [(RAPReportTableViewController *)&v15 initWithReport:a3 question:v9 completion:a5];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_categoryQuestion, a4);
    id v12 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:v11 action:"_cancel"];
    v13 = [(RAPReportComposerCategoryViewController *)v11 navigationItem];
    [v13 setLeftBarButtonItem:v12];
  }
  return v11;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4 = +[TrafficIncidentLayoutManager sharedInstance];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)RAPReportComposerCategoryViewController;
  [(RAPReportComposerCategoryViewController *)&v5 dealloc];
}

- (void)viewDidLoad
{
  v58.receiver = self;
  v58.super_class = (Class)RAPReportComposerCategoryViewController;
  [(RAPReportTableViewController *)&v58 viewDidLoad];
  id v3 = objc_alloc_init((Class)NSMutableArray);
  if ([(RAPMenu *)self->_categoryQuestion conformsToProtocol:&OBJC_PROTOCOL___RAPSnippetProtocol])
  {
    v4 = self->_categoryQuestion;
    objc_super v5 = [[RAPReportComposerSnippetSection alloc] initWithQuestion:v4];
    v6 = [RAPTablePart alloc];
    v61 = v5;
    v7 = +[NSArray arrayWithObjects:&v61 count:1];
    v8 = [(RAPTablePart *)v6 initWithSections:v7];

    [v3 addObject:v8];
  }
  id v9 = objc_alloc_init((Class)NSMutableArray);
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v10 = [(RAPMenu *)self->_categoryQuestion allMenuItems];
  id v11 = [v10 countByEnumeratingWithState:&v54 objects:v60 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v55;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v55 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [*(id *)(*((void *)&v54 + 1) + 8 * i) questionCategory]);
        [v9 addObject:v14];
      }
      id v11 = [v10 countByEnumeratingWithState:&v54 objects:v60 count:16];
    }
    while (v11);
  }

  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_100B3CD74;
  v52[3] = &unk_1012E5D58;
  v52[4] = self;
  id v39 = v3;
  id v53 = v39;
  v41 = objc_retainBlock(v52);
  objc_super v15 = +[TrafficIncidentLayoutManager sharedInstance];
  unsigned int v40 = [v15 isIncidentReportingEnabled];

  if (([(RAPReportComposerCategoryViewController *)self _shouldUseServerControlledUI] | v40) == 1)
  {
    v16 = [[RAPWorkflowLayoutManager alloc] initWithSupportedCategories:v9];
    layoutManager = self->_layoutManager;
    self->_layoutManager = v16;

    v38 = objc_alloc_init(RAPLayoutOptions);
    [(RAPLayoutOptions *)v38 setLayoutType:4];
    v18 = [[RAPLayoutDownloader alloc] initWithLayoutOptions:v38];
    layoutDownloader = self->_layoutDownloader;
    self->_layoutDownloader = v18;

    v20 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    activityIndicator = self->_activityIndicator;
    self->_activityIndicator = v20;

    [(UIActivityIndicatorView *)self->_activityIndicator setHidesWhenStopped:1];
    [(UIActivityIndicatorView *)self->_activityIndicator startAnimating];
    [(UIActivityIndicatorView *)self->_activityIndicator setTranslatesAutoresizingMaskIntoConstraints:0];
    v22 = [(RAPReportComposerCategoryViewController *)self tableView];
    [v22 addSubview:self->_activityIndicator];

    v37 = [(UIActivityIndicatorView *)self->_activityIndicator centerXAnchor];
    v23 = [(RAPReportComposerCategoryViewController *)self tableView];
    v24 = [v23 centerXAnchor];
    v25 = [v37 constraintEqualToAnchor:v24];
    v59[0] = v25;
    v26 = [(UIActivityIndicatorView *)self->_activityIndicator centerYAnchor];
    v27 = [(RAPReportComposerCategoryViewController *)self tableView];
    v28 = [v27 centerYAnchor];
    v29 = [v26 constraintEqualToAnchor:v28];
    v59[1] = v29;
    v30 = +[NSArray arrayWithObjects:v59 count:2];
    +[NSLayoutConstraint activateConstraints:v30];

    objc_initWeak(&location, self);
    v31 = dispatch_group_create();
    if (sub_1000BBB44(self) == 5) {
      unsigned int v32 = 0;
    }
    else {
      unsigned int v32 = v40;
    }
    if (v32 == 1)
    {
      dispatch_group_enter(v31);
      v33 = +[TrafficIncidentLayoutManager sharedInstance];
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_100B3CE54;
      v48[3] = &unk_101318D30;
      objc_copyWeak(&v50, &location);
      v49 = v31;
      [v33 fetchTrafficIncidentsLayout:v48];

      objc_destroyWeak(&v50);
    }
    if ([(RAPReportComposerCategoryViewController *)self _shouldUseServerControlledUI])
    {
      dispatch_group_enter(v31);
      v34 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v36);
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_100B3CEC8;
      v45[3] = &unk_101318D58;
      objc_copyWeak(&v47, &location);
      v46 = v31;
      [v34 fetchLayoutConfig:v45];

      objc_destroyWeak(&v47);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100B3CF4C;
    block[3] = &unk_1012E9950;
    objc_copyWeak(&v44, &location);
    v43 = v41;
    dispatch_group_notify(v31, (dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);
  }
  else
  {
    ((void (*)(void))v41[2])();
  }
  v35 = +[TrafficIncidentLayoutManager sharedInstance];
  [v35 addObserver:self];
  self->_isIncidentReportingEnabled = [v35 isIncidentReportingEnabled];
}

- (BOOL)_shouldUseServerControlledUI
{
  int BOOL = GEOConfigGetBOOL();
  if (BOOL)
  {
    objc_opt_class();
    LOBYTE(BOOL) = objc_opt_isKindOfClass();
  }
  return BOOL & 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RAPReportComposerCategoryViewController;
  [(RAPReportComposerCategoryViewController *)&v5 viewDidAppear:a3];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"RAPReportComposerCategoryViewControllerDidAppearNotification" object:self];
}

- (void)_cancel
{
}

- (int)analyticTarget
{
  return [(RAPMenu *)self->_categoryQuestion analyticTarget];
}

- (void)proceedToNextQuestion:(id)a3
{
  id v15 = a3;
  unsigned int v4 = [(RAPReportComposerCategoryViewController *)self analyticTarget];
  objc_super v5 = v15;
  if (v4)
  {
    unsigned int v6 = [v15 userAction];
    objc_super v5 = v15;
    if (v6)
    {
      id v7 = v15;
      if ([v7 conformsToProtocol:&OBJC_PROTOCOL___RAPInstrumentableTarget]) {
        v8 = v7;
      }
      else {
        v8 = 0;
      }
      id v9 = v8;

      char v10 = objc_opt_respondsToSelector();
      id v11 = +[MKMapService sharedService];
      id v12 = [v7 userAction];
      uint64_t v13 = [(RAPReportComposerCategoryViewController *)self analyticTarget];
      if (v10)
      {
        v14 = [v9 eventValue];
        [v11 captureUserAction:v12 onTarget:v13 eventValue:v14];
      }
      else
      {
        [v11 captureUserAction:v12 onTarget:v13 eventValue:0];
      }

      objc_super v5 = v15;
    }
  }
  switch((unint64_t)[v5 questionCategory])
  {
    case 1uLL:
      [(RAPReportComposerCategoryViewController *)self proceedToProblemNotListedQuestion:v15];
      break;
    case 7uLL:
      [(RAPReportComposerCategoryViewController *)self proceedToProblemWithDirectionsQuestion:v15];
      break;
    case 8uLL:
      [(RAPReportComposerCategoryViewController *)self proceedToLabelCorrectionsQuestion:v15];
      break;
    case 9uLL:
      [(RAPReportComposerCategoryViewController *)self proceedToPlaceClosureQuestion:v15];
      break;
    case 0xCuLL:
      [(RAPReportComposerCategoryViewController *)self proceedToIncorrectSearchResultsQuestion:v15];
      break;
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
      [(RAPReportComposerCategoryViewController *)self proceedToRAPPersonalPlaceCorrectionsQuestion:v15];
      break;
    case 0x13uLL:
      [(RAPReportComposerCategoryViewController *)self _proceedToIncidentsQuestion:v15];
      break;
    default:
      break;
  }
}

- (void)proceedToProblemNotListedQuestion:(id)a3
{
  id v4 = a3;
  objc_super v5 = [RAPReportComposerCommentViewController alloc];
  id v8 = [(RAPReportTableViewController *)self report];
  unsigned int v6 = [(RAPReportTableViewController *)self completion];
  id v7 = [(RAPReportComposerCommentViewController *)v5 initWithReport:v8 question:v4 completion:v6];

  [(RAPTableViewController *)self segueToViewController:v7];
}

- (void)proceedToArrivalTimeIncorrectQuestion:(id)a3
{
  id v4 = a3;
  objc_super v5 = [RAPReportComposerCommentViewController alloc];
  id v8 = [(RAPReportTableViewController *)self report];
  unsigned int v6 = [(RAPReportTableViewController *)self completion];
  id v7 = [(RAPReportComposerCommentViewController *)v5 initWithReport:v8 question:v4 completion:v6];

  [(RAPTableViewController *)self segueToViewController:v7];
}

- (void)proceedToIncorrectSearchResultsQuestion:(id)a3
{
  id v4 = a3;
  objc_super v5 = [RAPReportComposerIncorrectSearchViewController alloc];
  id v8 = [(RAPReportTableViewController *)self report];
  unsigned int v6 = [(RAPReportTableViewController *)self completion];
  id v7 = [(RAPReportComposerIncorrectSearchViewController *)v5 initWithReport:v8 question:v4 completion:v6];

  [(RAPTableViewController *)self segueToViewController:v7];
}

- (void)proceedToProblemWithDirectionsQuestion:(id)a3
{
  id v4 = a3;
  objc_super v5 = [RAPReportComposerDirectionsViewController alloc];
  id v8 = [(RAPReportTableViewController *)self report];
  unsigned int v6 = [(RAPReportTableViewController *)self completion];
  id v7 = [(RAPReportComposerDirectionsViewController *)v5 initWithReport:v8 question:v4 completion:v6];

  [(RAPTableViewController *)self segueToViewController:v7];
}

- (void)proceedToPlaceClosureQuestion:(id)a3
{
  id v4 = a3;
  objc_super v5 = [RAPReportComposerPlaceClosureViewController alloc];
  id v8 = [(RAPReportTableViewController *)self report];
  unsigned int v6 = [(RAPReportTableViewController *)self completion];
  id v7 = [(RAPReportComposerPlaceClosureViewController *)v5 initWithReport:v8 question:v4 completion:v6];

  [(RAPTableViewController *)self segueToViewController:v7];
}

- (void)proceedToLabelCorrectionsQuestion:(id)a3
{
  id v4 = a3;
  objc_super v5 = [RAPReportComposerLabelNameEditorViewController alloc];
  id v8 = [(RAPReportTableViewController *)self report];
  unsigned int v6 = [(RAPReportTableViewController *)self completion];
  id v7 = [(RAPReportComposerLabelNameEditorViewController *)v5 initWithReport:v8 question:v4 completion:v6];

  [(RAPTableViewController *)self segueToViewController:v7];
}

- (void)_proceedToIncidentsQuestion:(id)a3
{
  id v4 = a3;
  objc_super v5 = [RAPReportComposerIncidentsEditorViewController alloc];
  id v8 = [(RAPReportTableViewController *)self report];
  unsigned int v6 = [(RAPReportTableViewController *)self completion];
  id v7 = [(RAPReportComposerIncidentsEditorViewController *)v5 initWithReport:v8 question:v4 completion:v6];

  [(RAPTableViewController *)self segueToViewController:v7];
}

- (void)proceedToBadRouteSuggestionsQuestion:(id)a3
{
  id v4 = a3;
  objc_super v5 = [RAPReportComposerBadRouteSuggestionsViewController alloc];
  id v8 = [(RAPReportTableViewController *)self report];
  unsigned int v6 = [(RAPReportTableViewController *)self completion];
  id v7 = [(RAPReportComposerBadRouteSuggestionsViewController *)v5 initWithReport:v8 question:v4 completion:v6];

  [(RAPTableViewController *)self segueToViewController:v7];
}

- (void)proceedToRAPPersonalPlaceCorrectionsQuestion:(id)a3
{
  id v18 = a3;
  id v4 = [v18 mainMenuItems];
  id v5 = [v4 count];

  unsigned int v6 = [v18 mainMenuItems];
  id v7 = v6;
  if (v5 == (id)1)
  {
    id v8 = [v6 firstObject];

    id v9 = [RAPPersonalPlaceCorrectionsQuestion alloc];
    char v10 = [v18 report];
    id v11 = [(RAPPersonalPlaceSelectionViewController *)v8 shortcut];
    id v12 = [(RAPPersonalPlaceCorrectionsQuestion *)v9 initWithReport:v10 parentQuestion:v18 shortcut:v11];

    [v18 setSelectedMenuItem:v12];
    uint64_t v13 = [RAPPersonalPlaceRefinementCoordinator alloc];
    v14 = [v18 report];
    id v15 = [(RAPPersonalPlaceRefinementCoordinator *)v13 initWithPresentingViewController:self delegate:self report:v14 question:v12];
    homeWorkCoordinator = self->_homeWorkCoordinator;
    self->_homeWorkCoordinator = v15;

    [(RAPPersonalPlaceRefinementCoordinator *)self->_homeWorkCoordinator beginShortcutRefinement];
  }
  else
  {
    id v17 = [v6 count];

    if (!v17) {
      goto LABEL_6;
    }
    id v8 = [[RAPPersonalPlaceSelectionViewController alloc] initWithQuestion:v18];
    [(RAPTableViewController *)self segueToViewController:v8];
  }

LABEL_6:
}

- (void)refinementCoordinatorRequestsChangeAddress:(id)a3 withShortcut:(id)a4
{
  id v4 = a4;
  id v7 = +[UIApplication sharedMapsDelegate];
  id v5 = [v7 appCoordinator];
  unsigned int v6 = [v5 chromeViewController];
  [v6 resetForEditingShortcut:v4];
}

- (void)refinementCoordinator:(id)a3 finishedRefiningCoordinate:(CLLocationCoordinate2D)a4 withShortcut:(id)a5
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  id v8 = a3;
  id v9 = a5;
  char v10 = +[ShortcutEditSession editSessionWithShortcut:v9];
  [v10 setAdjustedCoordinate:latitude longitude];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100B3DB58;
  v13[3] = &unk_1012E6160;
  id v14 = v9;
  id v15 = v8;
  id v11 = v8;
  id v12 = v9;
  [v10 saveWithCompletion:v13];
}

- (void)incidentsReportingEnablementDidUpdate
{
  id v3 = +[TrafficIncidentLayoutManager sharedInstance];
  if (([v3 isIncidentReportingEnabled] & 1) == 0 && self->_isIncidentReportingEnabled) {
    [(RAPReportTableViewController *)self invokeCompletionWithOutcome:0];
  }
  self->_isIncidentReportingEnabled = [v3 isIncidentReportingEnabled];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeWorkCoordinator, 0);
  objc_storeStrong((id *)&self->_categoryQuestion, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_layoutManager, 0);

  objc_storeStrong((id *)&self->_layoutDownloader, 0);
}

@end