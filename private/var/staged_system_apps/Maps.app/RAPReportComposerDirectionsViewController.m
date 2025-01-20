@interface RAPReportComposerDirectionsViewController
- (RAPDirectionsWhichOneQuestion)rapDirectionsWhichOneQuestion;
- (RAPReportComposerDirectionsViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5;
- (id)tableParts;
- (int)analyticTarget;
- (void)_didTapOnCancel;
- (void)_instrumentSelectingRoute;
- (void)dealloc;
- (void)proceedToArrivalEntryPointIncorrectQuestion:(id)a3;
- (void)proceedToArrivalTimeIncorrectQuestion:(id)a3;
- (void)proceedToBadRouteSuggestionsQuestion:(id)a3;
- (void)proceedToDirectionInstructionsIncorrectQuestion:(id)a3;
- (void)proceedToNextQuestion:(id)a3;
- (void)proceedToProblemNotListedQuestion:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation RAPReportComposerDirectionsViewController

- (RAPReportComposerDirectionsViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5
{
  id v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)RAPReportComposerDirectionsViewController;
  v10 = [(RAPReportTableViewController *)&v20 initWithReport:a3 question:v9 completion:a5];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_question, a4);
    v12 = [v9 selectableDirectionsRequests];
    id v13 = [v12 count];

    if (v13 == (id)1)
    {
      v14 = [v9 selectableDirectionsRequests];
      v15 = [v14 firstObject];
      [v9 setSelectedValue:v15];
    }
    [(RAPQuestion *)v11->_question addObserver:v11 changeHandler:&stru_1013162F0];
    v16 = [v9 parentQuestion];

    if (!v16)
    {
      id v17 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:v11 action:"_didTapOnCancel"];
      v18 = [(RAPReportComposerDirectionsViewController *)v11 navigationItem];
      [v18 setLeftBarButtonItem:v17];
    }
  }

  return v11;
}

- (void)dealloc
{
  [(RAPQuestion *)self->_question removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)RAPReportComposerDirectionsViewController;
  [(RAPReportComposerDirectionsViewController *)&v3 dealloc];
}

- (RAPDirectionsWhichOneQuestion)rapDirectionsWhichOneQuestion
{
  return self->_question;
}

- (int)analyticTarget
{
  return 1100;
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RAPReportComposerDirectionsViewController;
  [(RAPReportComposerDirectionsViewController *)&v5 viewDidAppear:a3];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"RAPReportComposerDirectionsViewControllerDidAppearNotification" object:self];
}

- (id)tableParts
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  objc_initWeak(&location, self);
  if (!self->_directionsRequestsSection)
  {
    v4 = [RAPDirectionsRequestsCheckmarkSection alloc];
    question = self->_question;
    v6 = [(RAPDirectionsWhichOneQuestion *)question selectableDirectionsRequests];
    v7 = [(RAPDirectionsWhichOneQuestion *)self->_question selectedValue];
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100A9DF78;
    v41[3] = &unk_101316318;
    objc_copyWeak(&v42, &location);
    v8 = [(RAPTableCollapsableCheckmarkSection *)v4 initWithOwner:question initialValues:v6 initialSelectedValue:v7 configureForValue:0 selection:v41];
    directionsRequestsSection = self->_directionsRequestsSection;
    self->_directionsRequestsSection = v8;

    v10 = [(RAPDirectionsWhichOneQuestion *)self->_question localizedSelectDirectionsRequestPrompt];
    [(RAPTableCollapsableCheckmarkSection *)self->_directionsRequestsSection setHeaderTitle:v10];

    objc_destroyWeak(&v42);
  }
  directionsRequestsPart = self->_directionsRequestsPart;
  if (!directionsRequestsPart)
  {
    v12 = [RAPTablePart alloc];
    v46 = self->_directionsRequestsSection;
    id v13 = +[NSArray arrayWithObjects:&v46 count:1];
    v14 = [(RAPTablePart *)v12 initWithSections:v13];
    v15 = self->_directionsRequestsPart;
    self->_directionsRequestsPart = v14;

    directionsRequestsPart = self->_directionsRequestsPart;
  }
  [v3 addObject:directionsRequestsPart];
  v16 = [(RAPDirectionsWhichOneQuestion *)self->_question selectedValue];

  if (v16)
  {
    id v17 = [RAPReportComposerDirectionsSubcategorySection alloc];
    v18 = [(RAPDirectionsWhichOneQuestion *)self->_question followUpQuestion];
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100A9DFFC;
    v39[3] = &unk_101316340;
    objc_copyWeak(&v40, &location);
    v19 = [(RAPReportComposerDirectionsSubcategorySection *)v17 initWithQuestion:v18 selection:v39];
    subcategorySection = self->_subcategorySection;
    self->_subcategorySection = v19;

    v21 = +[RAPDirectionsCategoryQuestion localizedHeaderText];
    [(RAPTablePartSection *)self->_subcategorySection setHeaderTitle:v21];

    v22 = [RAPTablePart alloc];
    v45 = self->_subcategorySection;
    v23 = +[NSArray arrayWithObjects:&v45 count:1];
    v24 = [(RAPTablePart *)v22 initWithSections:v23];
    subcategoryPart = self->_subcategoryPart;
    self->_subcategoryPart = v24;

    [v3 addObject:self->_subcategoryPart];
    v26 = [(RAPDirectionsWhichOneQuestion *)self->_question followUpQuestion];
    LODWORD(v22) = [v26 shouldShowBetterRouteAvailable];

    if (v22)
    {
      v27 = [RAPReportComposerBadRouteSuggestionSection alloc];
      v28 = [(RAPDirectionsWhichOneQuestion *)self->_question followUpQuestion];
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_100A9E058;
      v37[3] = &unk_101316340;
      objc_copyWeak(&v38, &location);
      v29 = [(RAPReportComposerBadRouteSuggestionSection *)v27 initWithQuestion:v28 selection:v37];
      betterRouteSection = self->_betterRouteSection;
      self->_betterRouteSection = v29;

      v31 = [RAPTablePart alloc];
      v44 = self->_betterRouteSection;
      v32 = +[NSArray arrayWithObjects:&v44 count:1];
      v33 = [(RAPTablePart *)v31 initWithSections:v32];
      p_betterRoutePart = &self->_betterRoutePart;
      v35 = *p_betterRoutePart;
      *p_betterRoutePart = v33;

      [v3 addObject:*p_betterRoutePart];
      objc_destroyWeak(&v38);
    }
    objc_destroyWeak(&v40);
  }
  objc_destroyWeak(&location);

  return v3;
}

- (void)proceedToNextQuestion:(id)a3
{
  id v5 = a3;
  if ([v5 userAction])
  {
    v4 = +[MKMapService sharedService];
    [v4 captureUserAction:[v5 userAction] onTarget:[self analyticTarget] eventValue:0];
  }
  switch((unint64_t)[v5 questionCategory])
  {
    case 1uLL:
      [(RAPReportComposerDirectionsViewController *)self proceedToProblemNotListedQuestion:v5];
      break;
    case 2uLL:
      [(RAPReportComposerDirectionsViewController *)self proceedToBadRouteSuggestionsQuestion:v5];
      break;
    case 3uLL:
      [(RAPReportComposerDirectionsViewController *)self proceedToArrivalTimeIncorrectQuestion:v5];
      break;
    case 4uLL:
      [(RAPReportComposerDirectionsViewController *)self proceedToArrivalEntryPointIncorrectQuestion:v5];
      break;
    case 6uLL:
      [(RAPReportComposerDirectionsViewController *)self proceedToDirectionInstructionsIncorrectQuestion:v5];
      break;
    default:
      break;
  }
}

- (void)proceedToProblemNotListedQuestion:(id)a3
{
  id v4 = a3;
  id v5 = [RAPReportComposerCommentViewController alloc];
  id v8 = [(RAPReportTableViewController *)self report];
  v6 = [(RAPReportTableViewController *)self completion];
  v7 = [(RAPReportComposerCommentViewController *)v5 initWithReport:v8 question:v4 completion:v6];

  [(RAPTableViewController *)self segueToViewController:v7];
}

- (void)proceedToBadRouteSuggestionsQuestion:(id)a3
{
  id v4 = a3;
  id v5 = [RAPReportComposerBadRouteSuggestionsViewController alloc];
  id v8 = [(RAPReportTableViewController *)self report];
  v6 = [(RAPReportTableViewController *)self completion];
  v7 = [(RAPReportComposerBadRouteSuggestionsViewController *)v5 initWithReport:v8 question:v4 completion:v6];

  [(RAPTableViewController *)self segueToViewController:v7];
}

- (void)proceedToArrivalTimeIncorrectQuestion:(id)a3
{
  id v4 = a3;
  id v5 = [RAPReportComposerCommentViewController alloc];
  id v8 = [(RAPReportTableViewController *)self report];
  v6 = [(RAPReportTableViewController *)self completion];
  v7 = [(RAPReportComposerCommentViewController *)v5 initWithReport:v8 question:v4 completion:v6];

  [(RAPTableViewController *)self segueToViewController:v7];
}

- (void)proceedToArrivalEntryPointIncorrectQuestion:(id)a3
{
  id v4 = a3;
  id v5 = [RAPReportComposerAccessPointViewController alloc];
  id v8 = [(RAPReportTableViewController *)self report];
  v6 = [(RAPReportTableViewController *)self completion];
  v7 = [(RAPReportComposerAccessPointViewController *)v5 initWithReport:v8 question:v4 completion:v6];

  [(RAPTableViewController *)self segueToViewController:v7];
}

- (void)proceedToDirectionInstructionsIncorrectQuestion:(id)a3
{
  id v4 = a3;
  id v5 = [RAPReportComposerDirectionInstructionsIncorrectViewController alloc];
  id v8 = [(RAPReportTableViewController *)self report];
  v6 = [(RAPReportTableViewController *)self completion];
  v7 = [(RAPReportComposerDirectionInstructionsIncorrectViewController *)v5 initWithReport:v8 question:v4 completion:v6];

  [(RAPTableViewController *)self segueToViewController:v7];
}

- (void)_didTapOnCancel
{
  id v3 = [(RAPReportTableViewController *)self completion];

  if (v3)
  {
    id v4 = [(RAPReportTableViewController *)self completion];
    v4[2](v4, self, 0);
  }
}

- (void)_instrumentSelectingRoute
{
  id v3 = +[MKMapService sharedService];
  [v3 captureUserAction:10154 onTarget:[self analyticTarget] eventValue:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_betterRouteSection, 0);
  objc_storeStrong((id *)&self->_betterRoutePart, 0);
  objc_storeStrong((id *)&self->_subcategorySection, 0);
  objc_storeStrong((id *)&self->_subcategoryPart, 0);
  objc_storeStrong((id *)&self->_directionsRequestsSection, 0);
  objc_storeStrong((id *)&self->_directionsRequestsPart, 0);

  objc_storeStrong((id *)&self->_question, 0);
}

@end