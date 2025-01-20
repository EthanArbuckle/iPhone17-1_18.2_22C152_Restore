@interface RAPReportComposerBadRouteSuggestionsViewController
- (RAPReportComposerBadRouteSuggestionsViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5;
- (id)tableParts;
- (int)analyticTarget;
- (void)_instrumentSelectingRoute;
@end

@implementation RAPReportComposerBadRouteSuggestionsViewController

- (RAPReportComposerBadRouteSuggestionsViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5
{
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)RAPReportComposerBadRouteSuggestionsViewController;
  v10 = [(RAPReportTableViewController *)&v15 initWithReport:a3 question:v9 completion:a5];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_question, a4);
    [(RAPQuestion *)v11->_question addObserver:v11 changeHandler:&stru_1012F9670];
    v12 = [(RAPReportTableViewController *)v11 sendButtonItem];
    v13 = [(RAPReportComposerBadRouteSuggestionsViewController *)v11 navigationItem];
    [v13 setRightBarButtonItem:v12];
  }
  return v11;
}

- (int)analyticTarget
{
  return 1103;
}

- (id)tableParts
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = [(RAPReportTableViewController *)self userInfoPart];
  [v3 addObject:v4];

  whichRoutePart = self->_whichRoutePart;
  if (!whichRoutePart)
  {
    if (!self->_whichRouteSection)
    {
      objc_initWeak(&location, self);
      v6 = [RAPReportComposerBadRouteSelectionSection alloc];
      question = self->_question;
      v21 = _NSConcreteStackBlock;
      uint64_t v22 = 3221225472;
      v23 = sub_1007F1B54;
      v24 = &unk_1012E6708;
      objc_copyWeak(&v25, &location);
      v8 = [(RAPReportComposerBadRouteSelectionSection *)v6 initWithQuestion:question willChangeQuestionRequiringNoScroll:&v21];
      whichRouteSection = self->_whichRouteSection;
      self->_whichRouteSection = v8;

      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);
    }
    v10 = [RAPTablePart alloc];
    v27 = self->_whichRouteSection;
    v11 = +[NSArray arrayWithObjects:&v27 count:1];
    v12 = [(RAPTablePart *)v10 initWithSections:v11];
    v13 = self->_whichRoutePart;
    self->_whichRoutePart = v12;

    whichRoutePart = self->_whichRoutePart;
  }
  [v3 addObject:whichRoutePart, v21, v22, v23, v24];
  if ([(RAPBadRouteSuggestionsQuestion *)self->_question shouldShowCommentQuestion])
  {
    commentPart = self->_commentPart;
    if (!commentPart)
    {
      objc_super v15 = [RAPReportComposerCommentPart alloc];
      v16 = [(RAPBadRouteSuggestionsQuestion *)self->_question commentQuestion];
      v17 = [(RAPReportComposerCommentPart *)v15 initWithCommentQuestion:v16];
      p_commentPart = &self->_commentPart;
      v19 = *p_commentPart;
      *p_commentPart = v17;

      commentPart = *p_commentPart;
    }
    [v3 addObject:commentPart];
  }

  return v3;
}

- (void)_instrumentSelectingRoute
{
  id v3 = +[MKMapService sharedService];
  [v3 captureUserAction:10154 onTarget:[self analyticTarget] eventValue:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commentPart, 0);
  objc_storeStrong((id *)&self->_whichRoutePart, 0);
  objc_storeStrong((id *)&self->_whichRouteSection, 0);

  objc_storeStrong((id *)&self->_question, 0);
}

@end