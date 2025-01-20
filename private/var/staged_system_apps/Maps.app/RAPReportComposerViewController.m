@interface RAPReportComposerViewController
- (RAPReport)report;
- (RAPReportComposerViewController)initWithReport:(id)a3 categoryQuestion:(id)a4 completion:(id)a5;
- (RAPReportComposerViewController)initWithReport:(id)a3 commentQuestion:(id)a4 completion:(id)a5;
- (RAPReportComposerViewController)initWithReport:(id)a3 curatedCollectionQuestion:(id)a4 completion:(id)a5;
- (RAPReportComposerViewController)initWithReport:(id)a3 lookAroundQuestion:(id)a4 completion:(id)a5;
- (RAPReportComposerViewController)initWithReport:(id)a3 placecardQuestion:(id)a4 completion:(id)a5;
- (id)_cancelButtonWithSelector:(SEL)a3;
- (id)popViewControllerAnimated:(BOOL)a3;
- (void)_cancelWithAnalyticsTarget:(int)a3;
- (void)_capturePrivacyBackActionIfNeeded;
- (void)_exitCommentCorrections;
- (void)_exitCuratedCollections;
- (void)_exitLookAround;
- (void)_exitPlaceCorrections;
- (void)_handlePrivacyCancelledNotification:(id)a3;
- (void)_invokeCompletionWithOutcome:(int64_t)a3;
- (void)_registerForPrivacyNotification;
- (void)_sendWithFinalOutcome:(int64_t)a3 acknowledgementOptions:(id)a4;
- (void)returnFromViewController:(id)a3;
- (void)segueToViewController:(id)a3;
- (void)segueToViewController:(id)a3 afterReturningFromViewController:(id)a4;
@end

@implementation RAPReportComposerViewController

- (RAPReportComposerViewController)initWithReport:(id)a3 categoryQuestion:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)RAPReportComposerViewController;
  v12 = [(RAPReportComposerViewController *)&v26 initWithNibName:0 bundle:0];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_report, a3);
    id v14 = [v11 copy];
    id completion = v13->_completion;
    v13->_id completion = v14;

    objc_initWeak(&location, v13);
    v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    v22 = sub_100B390B0;
    v23 = &unk_101318C18;
    objc_copyWeak(&v24, &location);
    v16 = objc_retainBlock(&v20);
    [(RAPReportComposerViewController *)v13 _registerForPrivacyNotification];
    v17 = [[RAPReportComposerCategoryViewController alloc] initWithReport:v13->_report question:v10 completion:v16];
    v27 = v17;
    v18 = +[NSArray arrayWithObjects:&v27 count:1];
    [(RAPReportComposerViewController *)v13 setViewControllers:v18];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (RAPReportComposerViewController)initWithReport:(id)a3 placecardQuestion:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)RAPReportComposerViewController;
  id v10 = [(RAPReportComposerViewController *)&v15 initWithNibName:0 bundle:0];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_report, a3);
    id v12 = [v9 copy];
    id completion = v11->_completion;
    v11->_id completion = v12;

    [(RAPReportComposerViewController *)v11 _registerForPrivacyNotification];
  }

  return v11;
}

- (RAPReportComposerViewController)initWithReport:(id)a3 lookAroundQuestion:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v29.receiver = self;
  v29.super_class = (Class)RAPReportComposerViewController;
  id v12 = [(RAPReportComposerViewController *)&v29 initWithNibName:0 bundle:0];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_report, a3);
    id v14 = [v11 copy];
    id completion = v13->_completion;
    v13->_id completion = v14;

    objc_initWeak(&location, v13);
    v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472;
    v25 = sub_100B39460;
    objc_super v26 = &unk_101318C18;
    objc_copyWeak(&v27, &location);
    v16 = objc_retainBlock(&v23);
    v17 = [RAPLookAroundInitialCategoriesViewController alloc];
    v18 = -[RAPLookAroundInitialCategoriesViewController initWithReport:question:completion:](v17, "initWithReport:question:completion:", v9, v10, v16, v23, v24, v25, v26);
    v19 = [(RAPReportComposerViewController *)v13 _cancelButtonWithSelector:"_exitLookAround"];
    v20 = [(RAPLookAroundInitialCategoriesViewController *)v18 navigationItem];
    [v20 setLeftBarButtonItem:v19];

    [(RAPReportComposerViewController *)v13 _registerForPrivacyNotification];
    [(RAPReportComposerViewController *)v13 setOverrideUserInterfaceStyle:2];
    v30 = v18;
    uint64_t v21 = +[NSArray arrayWithObjects:&v30 count:1];
    [(RAPReportComposerViewController *)v13 setViewControllers:v21];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (RAPReportComposerViewController)initWithReport:(id)a3 curatedCollectionQuestion:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v33.receiver = self;
  v33.super_class = (Class)RAPReportComposerViewController;
  id v12 = [(RAPReportComposerViewController *)&v33 initWithNibName:0 bundle:0];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_report, a3);
    id v14 = objc_retainBlock(v11);
    id completion = v13->_completion;
    v13->_id completion = v14;

    objc_initWeak(&location, v13);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100B3982C;
    v29[3] = &unk_101318C40;
    objc_copyWeak(&v31, &location);
    id v16 = v10;
    id v30 = v16;
    v17 = objc_retainBlock(v29);
    if ([v16 selectedQuestionType] == (id)3)
    {
      v18 = [RAPCuratedCollectionPOISelectionViewController alloc];
      v19 = v28;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100B398CC;
      v28[3] = &unk_101318C68;
      v28[4] = v17;
      v20 = [(RAPCuratedCollectionPOISelectionViewController *)v18 initWithReport:v9 parentQuestion:v16 completion:v28];
    }
    else
    {
      uint64_t v21 = [RAPCuratedCollectionCategoriesViewController alloc];
      v19 = v27;
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100B398DC;
      v27[3] = &unk_101318C68;
      v27[4] = v17;
      v20 = [(RAPCuratedCollectionCategoriesViewController *)v21 initWithReport:v9 question:v16 completion:v27];
    }
    v22 = v20;

    v23 = [(RAPReportComposerViewController *)v13 _cancelButtonWithSelector:"_exitCommentCorrections"];
    uint64_t v24 = [(RAPCuratedCollectionPOISelectionViewController *)v22 navigationItem];
    [v24 setLeftBarButtonItem:v23];

    v34 = v22;
    v25 = +[NSArray arrayWithObjects:&v34 count:1];
    [(RAPReportComposerViewController *)v13 setViewControllers:v25];

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (RAPReportComposerViewController)initWithReport:(id)a3 commentQuestion:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v28.receiver = self;
  v28.super_class = (Class)RAPReportComposerViewController;
  id v12 = [(RAPReportComposerViewController *)&v28 initWithNibName:0 bundle:0];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_report, a3);
    id v14 = objc_retainBlock(v11);
    id completion = v13->_completion;
    v13->_id completion = v14;

    objc_initWeak(&location, v13);
    id v16 = [RAPReportComposerCommentViewController alloc];
    v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472;
    uint64_t v24 = sub_100B39B28;
    v25 = &unk_101318C18;
    objc_copyWeak(&v26, &location);
    v17 = [(RAPReportComposerCommentViewController *)v16 initWithReport:v9 question:v10 completion:&v22];
    v18 = -[RAPReportComposerViewController _cancelButtonWithSelector:](v13, "_cancelButtonWithSelector:", "_exitCuratedCollections", v22, v23, v24, v25);
    v19 = [(RAPReportComposerCommentViewController *)v17 navigationItem];
    [v19 setLeftBarButtonItem:v18];

    objc_super v29 = v17;
    v20 = +[NSArray arrayWithObjects:&v29 count:1];
    [(RAPReportComposerViewController *)v13 setViewControllers:v20];

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (id)_cancelButtonWithSelector:(SEL)a3
{
  id v5 = objc_alloc((Class)UIBarButtonItem);
  v6 = +[NSBundle mainBundle];
  v7 = [v6 localizedStringForKey:@"Cancel [Report a Problem Placecard]" value:@"localized string not found" table:0];
  id v8 = [v5 initWithTitle:v7 style:0 target:self action:a3];

  return v8;
}

- (void)_registerForPrivacyNotification
{
  self->_shouldInstrumentPrivacyCancelOnNextBackAction = 0;
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_handlePrivacyCancelledNotification:" name:@"RAPUserDidCancelPrivacyAgreementNotification" object:0];
}

- (void)_handlePrivacyCancelledNotification:(id)a3
{
  v4 = [a3 object];
  id v5 = [(RAPReportComposerViewController *)self _maps_uiScene];

  if (v4 == v5) {
    self->_shouldInstrumentPrivacyCancelOnNextBackAction = 1;
  }
}

- (void)_capturePrivacyBackActionIfNeeded
{
  if (self->_shouldInstrumentPrivacyCancelOnNextBackAction)
  {
    id v3 = [(RAPReportComposerViewController *)self topViewController];
    v4 = [(RAPReportComposerViewController *)self rootViewController];

    if (v3 == v4) {
      uint64_t v5 = 10109;
    }
    else {
      uint64_t v5 = 10111;
    }
    +[GEOAPPortal captureUserAction:v5 target:1136 value:0];
    self->_shouldInstrumentPrivacyCancelOnNextBackAction = 0;
  }
}

- (void)_exitLookAround
{
  [(RAPReportComposerViewController *)self _capturePrivacyBackActionIfNeeded];

  [(RAPReportComposerViewController *)self _cancelWithAnalyticsTarget:1151];
}

- (void)_exitPlaceCorrections
{
  [(RAPReportComposerViewController *)self _capturePrivacyBackActionIfNeeded];

  [(RAPReportComposerViewController *)self _cancelWithAnalyticsTarget:1155];
}

- (void)_exitCuratedCollections
{
  [(RAPReportComposerViewController *)self _capturePrivacyBackActionIfNeeded];

  [(RAPReportComposerViewController *)self _cancelWithAnalyticsTarget:0];
}

- (void)_exitCommentCorrections
{
  [(RAPReportComposerViewController *)self _capturePrivacyBackActionIfNeeded];

  [(RAPReportComposerViewController *)self _cancelWithAnalyticsTarget:0];
}

- (id)popViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(RAPReportComposerViewController *)self topViewController];
  if ([v5 conformsToProtocol:&OBJC_PROTOCOL___RAPInstrumentableTarget]) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (objc_opt_respondsToSelector()) {
    uint64_t v8 = (uint64_t)[v7 backAction];
  }
  else {
    uint64_t v8 = 10111;
  }
  if ([v7 analyticTarget])
  {
    id v9 = +[MKMapService sharedService];
    [v9 captureUserAction:v8 onTarget:[v7 analyticTarget] eventValue:0];
  }
  [(RAPReportComposerViewController *)self _capturePrivacyBackActionIfNeeded];
  v12.receiver = self;
  v12.super_class = (Class)RAPReportComposerViewController;
  id v10 = [(RAPReportComposerViewController *)&v12 popViewControllerAnimated:v3];

  return v10;
}

- (void)_invokeCompletionWithOutcome:(int64_t)a3
{
  id completion = (void (**)(id, RAPReportComposerViewController *, int64_t))self->_completion;
  if (completion)
  {
    completion[2](completion, self, a3);
    id v5 = self->_completion;
    self->_id completion = 0;
  }
}

- (void)_sendWithFinalOutcome:(int64_t)a3 acknowledgementOptions:(id)a4
{
  id v6 = a4;
  id v7 = [(RAPReportComposerViewController *)self topViewController];
  if ([v7 conformsToProtocol:&OBJC_PROTOCOL___RAPInstrumentableTarget]) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  objc_super v33 = v9;
  if ([v9 analyticTarget])
  {
    id v10 = [(RAPReport *)self->_report initialQuestion];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v12 = v6;
      v13 = [(RAPReport *)self->_report initialQuestion];
      id v14 = [v13 selectedMenuItem];
      if ([v14 conformsToProtocol:&OBJC_PROTOCOL___RAPInstrumentableTarget]) {
        objc_super v15 = v14;
      }
      else {
        objc_super v15 = 0;
      }
      id v16 = v15;

      if (objc_opt_respondsToSelector())
      {
        v17 = +[MKMapService sharedService];
        id v18 = [v33 analyticTarget];
        v19 = [v16 eventValue];
        [v17 captureUserAction:2152 onTarget:v18 eventValue:v19];
      }
      else
      {
        +[RAPAnalyticsManager captureRAPSendActionFromReport:self->_report];
      }
      id v6 = v12;
    }
    else
    {
      +[RAPAnalyticsManager captureRAPSendActionFromReport:self->_report];
    }
  }
  objc_initWeak(location, self);
  v20 = [UGCCommunityAcknowledgementViewController alloc];
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_100B3A484;
  v44[3] = &unk_1012F0708;
  objc_copyWeak(v45, location);
  v45[1] = (id)a3;
  uint64_t v21 = [(UGCCommunityAcknowledgementViewController *)v20 initWithOptions:v6 completion:v44];
  v22 = v6;
  uint64_t v23 = [(UGCCommunityAcknowledgementViewController *)v21 navigationItem];
  [v23 setHidesBackButton:1];

  uint64_t v24 = [(RAPReportComposerViewController *)self topViewController];
  v25 = [v24 navigationItem];
  id v26 = objc_alloc_init(RAPNavigationItemValues);
  [(RAPNavigationItemValues *)v26 takeValuesFromNavigationItem:v25];
  id v27 = [v24 view];
  report = self->_report;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_100B3A4F4;
  v43[3] = &unk_101318C90;
  v43[4] = self;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100B3A770;
  v39[3] = &unk_101318CB8;
  v40 = v21;
  v41 = self;
  int64_t v42 = a3;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100B3A874;
  v34[3] = &unk_101318CE0;
  v34[4] = self;
  objc_super v29 = v40;
  v35 = v29;
  id v30 = v25;
  id v36 = v30;
  id v31 = v26;
  v37 = v31;
  id v32 = v27;
  id v38 = v32;
  [(RAPReport *)report submitWithPrivacyRequestHandler:v43 willStartSubmitting:v39 didFinishSubmitting:v34];

  objc_destroyWeak(v45);
  objc_destroyWeak(location);
}

- (void)_cancelWithAnalyticsTarget:(int)a3
{
  +[GEOAPPortal captureUserAction:10109 target:*(void *)&a3 value:0];

  [(RAPReportComposerViewController *)self _invokeCompletionWithOutcome:0];
}

- (void)segueToViewController:(id)a3
{
}

- (void)segueToViewController:(id)a3 afterReturningFromViewController:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [v10 navigationController];
  uint64_t v8 = [v7 viewControllers];
  id v9 = [v8 mutableCopy];

  if (v6) {
    [v9 removeObject:v6];
  }
  [v9 addObject:v10];
  [(RAPReportComposerViewController *)self setViewControllers:v9 animated:1];
}

- (void)returnFromViewController:(id)a3
{
  id v14 = a3;
  v4 = [(RAPReportComposerViewController *)self navigationController];
  id v5 = [v4 viewControllers];
  id v6 = [v5 indexOfObject:v14];

  if (v6 && v6 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = v14;
    if ([v7 conformsToProtocol:&OBJC_PROTOCOL___RAPInstrumentableTarget]) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    id v9 = v8;

    if ([v9 analyticTarget])
    {
      id v10 = +[MKMapService sharedService];
      [v10 captureUserAction:10111 onTarget:[v9 analyticTarget] eventValue:0];
    }
    id v11 = [(RAPReportComposerViewController *)self navigationController];
    id v12 = [v11 viewControllers];
    id v13 = [v12 mutableCopy];

    [v13 trimToLength:v6];
    [(RAPReportComposerViewController *)self setViewControllers:v13 animated:1];
  }
}

- (RAPReport)report
{
  return self->_report;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendSpinner, 0);
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong((id *)&self->_report, 0);
}

@end