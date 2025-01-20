@interface RAPReportComposerIncorrectSearchViewController
- (RAPReportComposerIncorrectSearchViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5;
- (id)tableParts;
- (int)analyticTarget;
- (void)_instrumentSelectedSearch;
- (void)proceedToNextQuestion:(id)a3;
- (void)proceedToPlaceClosureQuestion:(id)a3;
- (void)proceedToProblemNotListedQuestion:(id)a3;
- (void)proceedToSearchResultIncorrectQuestion:(id)a3;
@end

@implementation RAPReportComposerIncorrectSearchViewController

- (RAPReportComposerIncorrectSearchViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5
{
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)RAPReportComposerIncorrectSearchViewController;
  v10 = [(RAPReportTableViewController *)&v17 initWithReport:a3 question:v9 completion:a5];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_question, a4);
    v12 = [v9 selectableSearches];
    id v13 = [v12 count];

    if (v13 == (id)1)
    {
      v14 = [v9 selectableSearches];
      v15 = [v14 firstObject];
      [v9 setSelectedValue:v15];
    }
    [(RAPQuestion *)v11->_question addObserver:v11 changeHandler:&stru_101320B90];
  }

  return v11;
}

- (int)analyticTarget
{
  return [(RAPSearchWhichOneQuestion *)self->_question analyticTarget];
}

- (id)tableParts
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  objc_initWeak(&location, self);
  if (!self->_searchSection)
  {
    v4 = [RAPReportComposerWhichSearchSection alloc];
    question = self->_question;
    v6 = [(RAPSearchWhichOneQuestion *)question selectableSearches];
    v7 = [(RAPSearchWhichOneQuestion *)self->_question selectedValue];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100CB8218;
    v34[3] = &unk_101320BF8;
    objc_copyWeak(&v35, &location);
    v8 = [(RAPTableCollapsableCheckmarkSection *)v4 initWithOwner:question initialValues:v6 initialSelectedValue:v7 configureForValue:&stru_101320BD0 selection:v34];
    searchSection = self->_searchSection;
    self->_searchSection = v8;

    v10 = +[NSBundle mainBundle];
    v11 = [v10 localizedStringForKey:@"Result [Report an Issue header]" value:@"localized string not found" table:0];
    [(RAPTableCollapsableCheckmarkSection *)self->_searchSection setHeaderTitle:v11];

    objc_destroyWeak(&v35);
  }
  searchRequestPart = self->_searchRequestPart;
  if (!searchRequestPart)
  {
    id v13 = [RAPTablePart alloc];
    v38 = self->_searchSection;
    v14 = +[NSArray arrayWithObjects:&v38 count:1];
    v15 = [(RAPTablePart *)v13 initWithSections:v14];
    v16 = self->_searchRequestPart;
    self->_searchRequestPart = v15;

    searchRequestPart = self->_searchRequestPart;
  }
  [v3 addObject:searchRequestPart];
  objc_super v17 = [(RAPSearchWhichOneQuestion *)self->_question selectedValue];

  if (v17)
  {
    if (!self->_subcategorySection)
    {
      v18 = [RAPReportComposerSearchSubcategorySection alloc];
      v19 = [(RAPSearchWhichOneQuestion *)self->_question followUpQuestion];
      v29 = _NSConcreteStackBlock;
      uint64_t v30 = 3221225472;
      v31 = sub_100CB829C;
      v32 = &unk_101316340;
      objc_copyWeak(&v33, &location);
      v20 = [(RAPReportComposerSearchSubcategorySection *)v18 initWithQuestion:v19 selection:&v29];
      subcategorySection = self->_subcategorySection;
      self->_subcategorySection = v20;

      objc_destroyWeak(&v33);
    }
    subcategoryPart = self->_subcategoryPart;
    if (!subcategoryPart)
    {
      v23 = [RAPTablePart alloc];
      v37 = self->_subcategorySection;
      v24 = +[NSArray arrayWithObjects:&v37 count:1];
      v25 = [(RAPTablePart *)v23 initWithSections:v24];
      p_subcategoryPart = &self->_subcategoryPart;
      v27 = *p_subcategoryPart;
      *p_subcategoryPart = v25;

      subcategoryPart = *p_subcategoryPart;
    }
    [v3 addObject:subcategoryPart v29, v30, v31, v32];
  }
  objc_destroyWeak(&location);

  return v3;
}

- (void)_instrumentSelectedSearch
{
  id v3 = [(RAPSearchWhichOneQuestion *)self->_question selectedValue];

  if (v3)
  {
    id v4 = +[MKMapService sharedService];
    [v4 captureUserAction:10140 onTarget:[self analyticTarget] eventValue:0];
  }
}

- (void)proceedToNextQuestion:(id)a3
{
  id v8 = a3;
  if ([v8 userAction]
    && [(RAPReportComposerIncorrectSearchViewController *)self analyticTarget])
  {
    id v4 = +[MKMapService sharedService];
    [v4 captureUserAction:[v8 userAction] onTarget:[self analyticTarget] eventValue:0];
  }
  id v5 = [v8 questionCategory];
  if (v5 == (id)1)
  {
    [(RAPReportComposerIncorrectSearchViewController *)self proceedToProblemNotListedQuestion:v8];
    goto LABEL_11;
  }
  if (v5 == (id)9)
  {
    [(RAPReportComposerIncorrectSearchViewController *)self proceedToPlaceClosureQuestion:v8];
    goto LABEL_11;
  }
  BOOL v6 = v5 == (id)10;
  v7 = v8;
  if (v6)
  {
    [(RAPReportComposerIncorrectSearchViewController *)self proceedToSearchResultIncorrectQuestion:v8];
LABEL_11:
    v7 = v8;
  }
}

- (void)proceedToProblemNotListedQuestion:(id)a3
{
  id v4 = a3;
  id v5 = [RAPReportComposerCommentViewController alloc];
  id v8 = [(RAPReportTableViewController *)self report];
  BOOL v6 = [(RAPReportTableViewController *)self completion];
  v7 = [(RAPReportComposerCommentViewController *)v5 initWithReport:v8 question:v4 completion:v6];

  [(RAPTableViewController *)self segueToViewController:v7];
}

- (void)proceedToPlaceClosureQuestion:(id)a3
{
  id v4 = a3;
  id v5 = [RAPReportComposerPlaceClosureViewController alloc];
  id v8 = [(RAPReportTableViewController *)self report];
  BOOL v6 = [(RAPReportTableViewController *)self completion];
  v7 = [(RAPReportComposerPlaceClosureViewController *)v5 initWithReport:v8 question:v4 completion:v6];

  [(RAPTableViewController *)self segueToViewController:v7];
}

- (void)proceedToSearchResultIncorrectQuestion:(id)a3
{
  id v4 = a3;
  id v5 = [RAPReportComposerCommentViewController alloc];
  id v8 = [(RAPReportTableViewController *)self report];
  BOOL v6 = [(RAPReportTableViewController *)self completion];
  v7 = [(RAPReportComposerCommentViewController *)v5 initWithReport:v8 question:v4 completion:v6];

  [(RAPTableViewController *)self segueToViewController:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commentSection, 0);
  objc_storeStrong((id *)&self->_commentPart, 0);
  objc_storeStrong((id *)&self->_subcategorySection, 0);
  objc_storeStrong((id *)&self->_subcategoryPart, 0);
  objc_storeStrong((id *)&self->_searchSection, 0);
  objc_storeStrong((id *)&self->_searchRequestPart, 0);
  objc_storeStrong((id *)&self->_search, 0);

  objc_storeStrong((id *)&self->_question, 0);
}

@end