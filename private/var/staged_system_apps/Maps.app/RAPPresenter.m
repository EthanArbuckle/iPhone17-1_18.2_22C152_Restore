@interface RAPPresenter
- (BOOL)_isMACPlaceCardViewController:(id)a3 tryingToPresent:(id)a4;
- (BOOL)presentOfflineAlertIfNecessaryWithCompletion:(id)a3;
- (RAPPresenter)initWithSceneDelegate:(id)a3;
- (id)submissionManager;
- (void)_createInitialNavigationRapStateWithCompletion:(id)a3;
- (void)_dismissReportComposerWithSender:(id)a3 completion:(id)a4;
- (void)_dismissSender:(id)a3 withGesture:(BOOL)a4 completion:(id)a5;
- (void)_presentAddAPlaceFromEntryPoint:(int)a3 withEditingBlock:(id)a4 completion:(id)a5;
- (void)_presentAutocompleteViewController:(id)a3 forItemKind:(int64_t)a4;
- (void)_presentChooseAPlaceWithAppState:(id)a3 entryPoint:(int)a4;
- (void)_presentLightweightFeedbackAcknowledgmentScreen;
- (void)_presentPlacecardImageryCommentViewControllerWithReport:(id)a3 question:(id)a4 completion:(id)a5;
- (void)_presentPushNotificationPromptIfNecessary;
- (void)_presentReportAProblemAndPrefetchShortcutsWithEditingContext:(id)a3 displayIncidentReports:(BOOL)a4 completion:(id)a5;
- (void)_presentReportComposerWithAppState:(id)a3 completion:(id)a4;
- (void)_presentReportComposerWithCompletion:(id)a3;
- (void)_presentWebBundleViewControllerWithReport:(id)a3 completion:(id)a4;
- (void)_presentWebBundleWithReport:(id)a3 completion:(id)a4;
- (void)_presentWebBundleWithReport:(id)a3 withOutcomeCompletion:(id)a4;
- (void)_submitLightweightReport:(id)a3 completion:(id)a4;
- (void)presentAddAPlaceFromEntryPoint:(int)a3 completion:(id)a4;
- (void)presentAddAPlaceFromPlacecardWithEditingContext:(id)a3 overriddenUserInterfaceStyle:(int64_t)a4 shouldShowDetailedFlow:(BOOL)a5 sourceView:(id)a6 entryPoint:(int)a7 completion:(id)a8;
- (void)presentAddAPlaceViewControllerFromEntryPoint:(int)a3 withAppState:(id)a4 completion:(id)a5;
- (void)presentAddAPlaceWithCompletion:(id)a3;
- (void)presentAddMissingDataOfType:(int64_t)a3 fromPlacecardWithEditingContext:(id)a4;
- (void)presentAddToMapsFromSearchEntryPoint:(int)a3 result:(id)a4 completion:(id)a5;
- (void)presentAddToMapsFromSearchEntryPoint:(int)a3 result:(id)a4 withAppState:(id)a5 completion:(id)a6;
- (void)presentCuratedCollectionRAPWithContext:(id)a3 sourceView:(id)a4 completion:(id)a5;
- (void)presentCurrentRouteIssueWithReport:(id)a3 fromEntryPoint:(int)a4;
- (void)presentCurrentRouteIssueWithReport:(id)a3 fromEntryPoint:(int)a4 usingContaineePresentation:(BOOL)a5;
- (void)presentEditPlaceDetailsOfType:(int64_t)a3 fromPlacecardWithEditingContext:(id)a4;
- (void)presentIncidentsReportOptions;
- (void)presentLookAroundRAPWithContext:(id)a3 completion:(id)a4;
- (void)presentPlaceEnrichmentRAPWithTarget:(int)a3 fromPlacecardWithEditingContext:(id)a4 completion:(id)a5;
- (void)presentPlaceEnrichmentRAPWithTarget:(int)a3 withAppState:(id)a4 completion:(id)a5;
- (void)presentPlacecardImageryRAPWithContext:(id)a3 layoutManager:(id)a4 popoverPresentationBlock:(id)a5 completion:(id)a6;
- (void)presentPlacecardImageryRAPWithContext:(id)a3 selectedIssueItem:(id)a4 completion:(id)a5;
- (void)presentRAPWebBundleQuestionType:(int64_t)a3 mapItem:(id)a4 fromEntryPoint:(int)a5 withCompletion:(id)a6;
- (void)presentRAPWebBundleWithMapItem:(id)a3 fromEntryPoint:(int)a4 completion:(id)a5;
- (void)presentReportAProblemAndPrefetchShortcutsWithEditingContext:(id)a3 completion:(id)a4;
- (void)presentReportAProblemByEditingContext:(id)a3 completion:(id)a4;
- (void)presentReportAProblemForRouteFromEntryPoint:(int)a3;
- (void)presentReportAProblemForRouteWithAppState:(id)a3;
- (void)presentReportAProblemFromPlaceCardViewController:(id)a3 editingContext:(id)a4 overriddenUserInterfaceStyle:(int64_t)a5 sourceView:(id)a6 entryPoint:(int)a7 completion:(id)a8;
- (void)presentReportAProblemFromSettingsWithCompletion:(id)a3;
- (void)presentReportAProblemFromTransitLineCardWithEditingContext:(id)a3 completion:(id)a4;
- (void)presentReportAProblemWithCompletion:(id)a3;
- (void)presentRouteListReportFromEntryPoint:(int)a3;
- (void)presentViewController:(id)a3 animated:(BOOL)a4;
- (void)rapSearchAutocompleteViewController:(id)a3 finishedPickingAutocompleteResult:(id)a4 isAutocompleteResult:(BOOL)a5;
- (void)rapSearchAutocompleteViewControllerDidCancel:(id)a3;
- (void)representReportAProblemIfCurrentlyOngoingAnimated:(BOOL)a3;
@end

@implementation RAPPresenter

- (RAPPresenter)initWithSceneDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RAPPresenter;
  v5 = [(RAPPresenter *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_sceneDelegate, v4);
  }

  return v6;
}

- (BOOL)presentOfflineAlertIfNecessaryWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = +[MapsOfflineUIHelper sharedHelper];
  unsigned int v6 = [v5 isUsingOfflineMaps];

  if (v6)
  {
    v7 = sub_10057754C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Attempting to report an issue while using Offline Maps. Presenting error alert.", buf, 2u);
    }

    objc_super v8 = +[MapsOfflineUIHelper sharedHelper];
    unsigned int v9 = [v8 isUsingForcedOfflineMaps];

    v10 = +[NSBundle mainBundle];
    v11 = v10;
    if (v9)
    {
      v12 = [v10 localizedStringForKey:@"REPORT_AN_ISSUE_FORCED_OFFLINE_ALERT_TITLE" value:@"localized string not found" table:@"Offline"];

      v13 = +[NSBundle mainBundle];
      v14 = v13;
      CFStringRef v15 = @"REPORT_AN_ISSUE_FORCED_OFFLINE_ALERT_MESSAGE";
    }
    else
    {
      v12 = [v10 localizedStringForKey:@"REPORT_AN_ISSUE_OFFLINE_ALERT_TITLE" value:@"localized string not found" table:@"Offline"];

      v13 = +[NSBundle mainBundle];
      v14 = v13;
      CFStringRef v15 = @"REPORT_AN_ISSUE_OFFLINE_ALERT_MESSAGE";
    }
    v16 = [v13 localizedStringForKey:v15 value:@"localized string not found" table:@"Offline"];

    v17 = +[UIAlertController alertControllerWithTitle:v12 message:v16 preferredStyle:1];
    v18 = +[NSBundle mainBundle];
    v19 = [v18 localizedStringForKey:@"REPORT_AN_ISSUE_OFFLINE_ALERT_ACTION" value:@"localized string not found" table:@"Offline"];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100D78018;
    v22[3] = &unk_1012E6E08;
    id v23 = v4;
    v20 = +[UIAlertAction actionWithTitle:v19 style:1 handler:v22];
    [v17 addAction:v20];

    [(RAPPresenter *)self presentViewController:v17 animated:1];
  }

  return v6;
}

- (void)presentAddAPlaceFromPlacecardWithEditingContext:(id)a3 overriddenUserInterfaceStyle:(int64_t)a4 shouldShowDetailedFlow:(BOOL)a5 sourceView:(id)a6 entryPoint:(int)a7 completion:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  BOOL v11 = a5;
  id v13 = a3;
  id v14 = a6;
  id v15 = a8;
  if (![(RAPPresenter *)self presentOfflineAlertIfNecessaryWithCompletion:v15])
  {
    if (v11)
    {
      [(RAPPresenter *)self _presentAddAPlaceFromEntryPoint:v9 withEditingBlock:v13 completion:v15];
    }
    else
    {
      v16 = [v14 window];
      [v16 setUserInteractionEnabled:0];

      v17 = [RAPAppStateCreator alloc];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
      v19 = [(RAPAppStateCreator *)v17 initWithSceneDelegate:WeakRetained];

      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100D781A4;
      v20[3] = &unk_101323390;
      id v21 = v14;
      v22 = self;
      id v23 = v13;
      int v25 = v9;
      id v24 = v15;
      [(RAPAppStateCreator *)v19 createReportAProblemAppStateWithCompletion:v20];
    }
  }
}

- (void)presentReportAProblemFromPlaceCardViewController:(id)a3 editingContext:(id)a4 overriddenUserInterfaceStyle:(int64_t)a5 sourceView:(id)a6 entryPoint:(int)a7 completion:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a8;
  if (![(RAPPresenter *)self presentOfflineAlertIfNecessaryWithCompletion:v16])
  {
    v17 = [v15 window];
    [v17 setUserInteractionEnabled:0];

    v18 = [RAPAppStateCreator alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
    v20 = [(RAPAppStateCreator *)v18 initWithSceneDelegate:WeakRetained];

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100D78468;
    v21[3] = &unk_1013233B8;
    id v22 = v15;
    id v25 = v14;
    id v23 = self;
    int v27 = a7;
    id v24 = v13;
    id v26 = v16;
    [(RAPAppStateCreator *)v20 createReportAProblemAppStateWithCompletion:v21];
  }
}

- (void)_dismissReportComposerWithSender:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = v7;
  if (v7) {
    (*((void (**)(id))v7 + 2))(v7);
  }
  id v9 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  if (v11)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100D78E9C;
    v13[3] = &unk_1012E5D08;
    v13[4] = self;
    [v11 dismissViewControllerAnimated:1 completion:v13];
  }
  else
  {
    v12 = sub_10057754C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Attempting to dismiss an object %@ that is not a view controller. Early return.", buf, 0xCu);
    }
  }
}

- (void)_dismissSender:(id)a3 withGesture:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void (**)(void))a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v10 = v8;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;
  if (v11)
  {
    if (v9 && v6) {
      v9[2](v9);
    }
    p_sceneDelegate = &self->_sceneDelegate;
    id WeakRetained = objc_loadWeakRetained((id *)p_sceneDelegate);
    id v14 = [WeakRetained appCoordinator];
    id v15 = [v14 baseActionCoordinator];
    id v16 = [v15 currentViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      if (!v6)
      {
        id v18 = objc_loadWeakRetained((id *)p_sceneDelegate);
        v19 = [v18 appCoordinator];
        v20 = [v19 baseActionCoordinator];
        id v21 = [v20 containerViewController];
        [v21 popLastViewControllerAnimated:1];
      }
      if (v9) {
        v9[2](v9);
      }
    }
    else
    {
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100D79108;
      v23[3] = &unk_1012E6EA8;
      id v24 = v9;
      [v11 dismissViewControllerAnimated:1 completion:v23];
    }
  }
  else
  {
    id v22 = sub_10057754C();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v8;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Attempting to dismiss an object %@ that is not a view controller. Early return.", buf, 0xCu);
    }
  }
}

- (void)_presentReportComposerWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_reportComposer)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100D79260;
    v11[3] = &unk_1012E76E8;
    v11[4] = self;
    id v12 = v4;
    BOOL v6 = objc_retainBlock(v11);
    id v7 = [(RAPReportComposerViewController *)self->_reportComposer presentingViewController];

    if (v7)
    {
      reportComposer = self->_reportComposer;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100D793F4;
      v9[3] = &unk_1012E6EA8;
      v10 = v6;
      [(RAPReportComposerViewController *)reportComposer dismissViewControllerAnimated:1 completion:v9];
    }
    else
    {
      ((void (*)(void *))v6[2])(v6);
    }
  }
}

- (void)_presentWebBundleWithReport:(id)a3 completion:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100D794C4;
  v9[3] = &unk_1013233E0;
  id v10 = a4;
  id v6 = v10;
  id v7 = a3;
  id v8 = objc_retainBlock(v9);
  [(RAPPresenter *)self _presentWebBundleWithReport:v7 withOutcomeCompletion:v8];
}

- (void)_presentWebBundleWithReport:(id)a3 withOutcomeCompletion:(id)a4
{
}

- (void)_presentWebBundleViewControllerWithReport:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  id v18 = sub_100D796CC;
  v19 = &unk_101323430;
  objc_copyWeak(&v22, &location);
  id v8 = v7;
  v20 = self;
  id v21 = v8;
  id v9 = objc_retainBlock(&v16);
  id v10 = [RAPWebBundleContaineeViewController alloc];
  id v11 = -[RAPWebBundleContaineeViewController initWithReport:completion:](v10, "initWithReport:completion:", v6, v9, v16, v17, v18, v19);
  [(RAPWebBundleContaineeViewController *)v11 setModalPresentationStyle:2];
  [(RAPWebBundleContaineeViewController *)v11 setModalInPresentation:1];
  id v12 = [v6 initialQuestion];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v14 = [v6 initialQuestion];
  }
  else
  {
    id v14 = 0;
  }
  if (sub_1000BBB44(v11) == 5 || (char *)[v14 questionType] - 13 > (char *)7)
  {
    [(RAPPresenter *)self presentViewController:v11 animated:1];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
    [WeakRetained presentFromContainerViewController:v11 animated:1];
  }
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (void)_presentPushNotificationPromptIfNecessary
{
}

- (void)_presentLightweightFeedbackAcknowledgmentScreen
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
  v3 = [WeakRetained chromeViewController];
  id v4 = [v3 view];
  id v7 = [v4 window];

  v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"Thanks for your feedback [Report an Issue]" value:@"localized string not found" table:0];

  +[ActionValidationController presentDefaultValidationActionWithTitle:v6 inWindow:v7];
}

- (void)presentReportAProblemFromTransitLineCardWithEditingContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(RAPPresenter *)self presentOfflineAlertIfNecessaryWithCompletion:v7])
  {
    id v8 = [RAPAppStateCreator alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
    id v10 = [(RAPAppStateCreator *)v8 initWithSceneDelegate:WeakRetained];

    objc_initWeak(&location, self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100D79C04;
    v11[3] = &unk_101323478;
    id v12 = v6;
    objc_copyWeak(&v14, &location);
    id v13 = v7;
    [(RAPAppStateCreator *)v10 createReportAProblemAppStateWithCompletion:v11];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

- (void)presentReportAProblemByEditingContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(RAPPresenter *)self presentOfflineAlertIfNecessaryWithCompletion:v7])
  {
    id v8 = [(RAPReportComposerViewController *)self->_reportComposer view];
    id v9 = [v8 window];
    [v9 setUserInteractionEnabled:0];

    id v10 = [RAPAppStateCreator alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
    id v12 = [(RAPAppStateCreator *)v10 initWithSceneDelegate:WeakRetained];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100D79E5C;
    v13[3] = &unk_1013234A0;
    v13[4] = self;
    id v14 = v6;
    id v15 = v7;
    [(RAPAppStateCreator *)v12 createReportAProblemAppStateWithCompletion:v13];
  }
}

- (void)presentReportAProblemAndPrefetchShortcutsWithEditingContext:(id)a3 completion:(id)a4
{
}

- (void)presentIncidentsReportOptions
{
}

- (void)presentAddMissingDataOfType:(int64_t)a3 fromPlacecardWithEditingContext:(id)a4
{
  id v6 = a4;
  if (![(RAPPresenter *)self presentOfflineAlertIfNecessaryWithCompletion:0])
  {
    id v7 = [RAPAppStateCreator alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
    id v9 = [(RAPAppStateCreator *)v7 initWithSceneDelegate:WeakRetained];

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100D7A00C;
    v10[3] = &unk_1013234C8;
    v10[4] = self;
    id v11 = v6;
    int64_t v12 = a3;
    [(RAPAppStateCreator *)v9 createReportAProblemAppStateWithCompletion:v10];
  }
}

- (void)presentEditPlaceDetailsOfType:(int64_t)a3 fromPlacecardWithEditingContext:(id)a4
{
  id v6 = a4;
  if (![(RAPPresenter *)self presentOfflineAlertIfNecessaryWithCompletion:0])
  {
    id v7 = [RAPAppStateCreator alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
    id v9 = [(RAPAppStateCreator *)v7 initWithSceneDelegate:WeakRetained];

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100D7A26C;
    v10[3] = &unk_1013234C8;
    v10[4] = self;
    id v11 = v6;
    int64_t v12 = a3;
    [(RAPAppStateCreator *)v9 createReportAProblemAppStateWithCompletion:v10];
  }
}

- (void)_presentReportAProblemAndPrefetchShortcutsWithEditingContext:(id)a3 displayIncidentReports:(BOOL)a4 completion:(id)a5
{
  id v7 = a5;
  if (a4)
  {
    if (![(RAPPresenter *)self presentOfflineAlertIfNecessaryWithCompletion:v7])
    {
      id v8 = [(RAPReportComposerViewController *)self->_reportComposer view];
      id v9 = [v8 window];
      [v9 setUserInteractionEnabled:0];

      id v10 = [RAPAppStateCreator alloc];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
      int64_t v12 = [(RAPAppStateCreator *)v10 initWithSceneDelegate:WeakRetained];

      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100D7A538;
      v16[3] = &unk_1013235E0;
      v16[4] = self;
      id v17 = v7;
      [(RAPAppStateCreator *)v12 createReportAProblemAppStateAndPrefetchShortcutsWithCompletion:v16];
    }
  }
  else
  {
    id v13 = +[UIApplication sharedMapsDelegate];
    id v14 = [v13 appCoordinator];
    id v15 = [v14 baseActionCoordinator];
    [v15 viewControllerShowReports:0];
  }
}

- (void)_presentReportComposerWithAppState:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [RAPReport alloc];
  id v9 = [(RAPPresenter *)self submissionManager];
  id v10 = [(RAPReport *)v8 initWithContext:v7 submitter:v9];

  id v11 = +[RAPMenuQuestion menuForReport:v10 state:v7 onlyShowIncidents:1];

  [(RAPReport *)v10 setInitialQuestion:v11];
  int64_t v12 = [RAPReportComposerViewController alloc];
  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  id v18 = sub_100D7A71C;
  v19 = &unk_1013234F0;
  v20 = self;
  id v21 = v6;
  id v13 = v6;
  id v14 = [(RAPReportComposerViewController *)v12 initWithReport:v10 categoryQuestion:v11 completion:&v16];
  reportComposer = self->_reportComposer;
  self->_reportComposer = v14;

  -[RAPPresenter _presentReportComposerWithCompletion:](self, "_presentReportComposerWithCompletion:", v13, v16, v17, v18, v19, v20);
}

- (void)representReportAProblemIfCurrentlyOngoingAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(RAPReportComposerViewController *)self->_reportComposer setModalPresentationStyle:2];
  [(RAPReportComposerViewController *)self->_reportComposer setModalInPresentation:1];
  reportComposer = self->_reportComposer;

  [(RAPPresenter *)self presentViewController:reportComposer animated:v3];
}

- (void)presentReportAProblemFromSettingsWithCompletion:(id)a3
{
}

- (void)presentReportAProblemWithCompletion:(id)a3
{
}

- (void)_presentAddAPlaceFromEntryPoint:(int)a3 withEditingBlock:(id)a4 completion:(id)a5
{
  id v8 = a4;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100D7A968;
  v20[3] = &unk_1012E6EA8;
  id v9 = a5;
  id v21 = v9;
  id v10 = objc_retainBlock(v20);
  if (![(RAPPresenter *)self presentOfflineAlertIfNecessaryWithCompletion:v9])
  {
    objc_initWeak(&location, self);
    id v11 = [RAPAppStateCreator alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
    id v13 = [(RAPAppStateCreator *)v11 initWithSceneDelegate:WeakRetained];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100D7A980;
    v14[3] = &unk_101323540;
    id v15 = v8;
    objc_copyWeak(&v17, &location);
    int v18 = a3;
    id v16 = v10;
    [(RAPAppStateCreator *)v13 createReportAProblemAppStateWithCompletion:v14];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

- (void)presentRAPWebBundleQuestionType:(int64_t)a3 mapItem:(id)a4 fromEntryPoint:(int)a5 withCompletion:(id)a6
{
  id v10 = a4;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100D7AD70;
  v22[3] = &unk_1012E5F78;
  id v11 = a6;
  void v22[4] = self;
  id v23 = v11;
  unsigned __int8 v12 = [(RAPPresenter *)self presentOfflineAlertIfNecessaryWithCompletion:v22];

  if ((v12 & 1) == 0)
  {
    id v13 = [RAPAppStateCreator alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
    id v15 = [(RAPAppStateCreator *)v13 initWithSceneDelegate:WeakRetained];

    objc_initWeak(&location, self);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100D7AD8C;
    v16[3] = &unk_101323568;
    objc_copyWeak(v19, &location);
    v19[1] = (id)a3;
    int v20 = a5;
    id v17 = v10;
    id v18 = v11;
    [(RAPAppStateCreator *)v15 createReportAProblemAppStateWithCompletion:v16];

    objc_destroyWeak(v19);
    objc_destroyWeak(&location);
  }
}

- (void)presentRAPWebBundleWithMapItem:(id)a3 fromEntryPoint:(int)a4 completion:(id)a5
{
  id v8 = a3;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100D7B078;
  v20[3] = &unk_1012E5F78;
  id v9 = a5;
  void v20[4] = self;
  id v21 = v9;
  unsigned __int8 v10 = [(RAPPresenter *)self presentOfflineAlertIfNecessaryWithCompletion:v20];

  if ((v10 & 1) == 0)
  {
    id v11 = [RAPAppStateCreator alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
    id v13 = [(RAPAppStateCreator *)v11 initWithSceneDelegate:WeakRetained];

    objc_initWeak(&location, self);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100D7B094;
    v14[3] = &unk_101323590;
    objc_copyWeak(&v17, &location);
    id v15 = v8;
    int v18 = a4;
    id v16 = v9;
    [(RAPAppStateCreator *)v13 createReportAProblemAppStateWithCompletion:v14];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

- (void)_presentChooseAPlaceWithAppState:(id)a3 entryPoint:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [v6 mapCamera];
  [v7 centerCoordinate];
  id v8 = [v6 mapCamera];

  [v8 centerCoordinate];
  GEOCoordinateRegionMakeWithDistance();
  id v16 = [objc_alloc((Class)GEOMapRegion) initWithCoordinateRegion:v9, v10, v11, v12];
  id v13 = +[RAPSearchAutocompleteViewController poiAutocompleteViewControllerWithBoundedMapRegion:v16 excludedMUIDs:&__NSArray0__struct];
  id v14 = +[NSBundle mainBundle];
  id v15 = [v14 localizedStringForKey:@"[RAP] Choose a Place" value:@"localized string not found" table:0];
  [v13 setTitleText:v15];

  [v13 setEntryPoint:v4];
  [(RAPPresenter *)self _presentAutocompleteViewController:v13 forItemKind:0];
}

- (void)_presentAutocompleteViewController:(id)a3 forItemKind:(int64_t)a4
{
  id v5 = a3;
  [v5 setDelegate:self];
  [v5 setModalInPresentation:1];
  id v6 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v5];

  [v6 setModalPresentationStyle:2];
  [(RAPPresenter *)self presentViewController:v6 animated:1];
}

- (void)rapSearchAutocompleteViewController:(id)a3 finishedPickingAutocompleteResult:(id)a4 isAutocompleteResult:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  double v9 = [RAPAppStateCreator alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
  double v11 = [(RAPAppStateCreator *)v9 initWithSceneDelegate:WeakRetained];

  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100D7B538;
  v14[3] = &unk_1013235B8;
  objc_copyWeak(&v17, &location);
  id v12 = v7;
  id v15 = v12;
  id v13 = v8;
  id v16 = v13;
  [(RAPAppStateCreator *)v11 createReportAProblemAppStateWithCompletion:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)rapSearchAutocompleteViewControllerDidCancel:(id)a3
{
}

- (void)presentAddAPlaceWithCompletion:(id)a3
{
}

- (void)presentAddAPlaceFromEntryPoint:(int)a3 completion:(id)a4
{
}

- (void)_createInitialNavigationRapStateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [RAPAppStateCreator alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
  id v7 = [(RAPAppStateCreator *)v5 initWithSceneDelegate:WeakRetained];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100D7B778;
  v9[3] = &unk_1013235E0;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [(RAPAppStateCreator *)v7 createReportAProblemAppStateWithCompletion:v9];
}

- (void)presentRouteListReportFromEntryPoint:(int)a3
{
  if (![(RAPPresenter *)self presentOfflineAlertIfNecessaryWithCompletion:0])
  {
    id v5 = sub_10057670C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Will try to present route list flow.", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100D7BB60;
    v6[3] = &unk_101323608;
    objc_copyWeak(&v7, buf);
    int v8 = a3;
    v6[4] = self;
    [(RAPPresenter *)self _createInitialNavigationRapStateWithCompletion:v6];
    objc_destroyWeak(&v7);
    objc_destroyWeak(buf);
  }
}

- (void)presentCurrentRouteIssueWithReport:(id)a3 fromEntryPoint:(int)a4
{
}

- (void)presentCurrentRouteIssueWithReport:(id)a3 fromEntryPoint:(int)a4 usingContaineePresentation:(BOOL)a5
{
  id v8 = a3;
  if (![(RAPPresenter *)self presentOfflineAlertIfNecessaryWithCompletion:0])
  {
    double v9 = sub_10057670C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Will try to present single route flow.", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100D7BED4;
    v16[3] = &unk_101323630;
    objc_copyWeak(&v17, buf);
    int v18 = a4;
    BOOL v19 = a5;
    void v16[4] = self;
    id v10 = objc_retainBlock(v16);
    if (v8)
    {
      double v11 = sub_10057670C();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)id v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "A report was passed to us so we'll present it without creating a new one.", v15, 2u);
      }

      ((void (*)(void *, id))v10[2])(v10, v8);
    }
    else
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100D7C038;
      v12[3] = &unk_101323658;
      objc_copyWeak(&v14, buf);
      id v13 = v10;
      [(RAPPresenter *)self _createInitialNavigationRapStateWithCompletion:v12];

      objc_destroyWeak(&v14);
    }

    objc_destroyWeak(&v17);
    objc_destroyWeak(buf);
  }
}

- (void)presentReportAProblemForRouteWithAppState:(id)a3
{
  id v4 = a3;
  if (![(RAPPresenter *)self presentOfflineAlertIfNecessaryWithCompletion:0])
  {
    id v5 = [RAPReport alloc];
    id v6 = [(RAPPresenter *)self submissionManager];
    id v7 = [(RAPReport *)v5 initWithContext:v4 submitter:v6];

    id v8 = [(RAPReport *)v7 combinedUserPath];
    [v8 addNativePath:37];

    if (v7)
    {
      double v9 = [(RAPReport *)v7 _context];
      id v10 = [v9 directionsHistory];
      double v11 = [v10 firstObject];
      id v12 = [v11 recording];

      if (v12)
      {
        id v13 = [[RAPWebBundleQuestion alloc] initWithReport:v7 directionsRecording:v12];
        [(RAPReport *)v7 setInitialQuestion:v13];
        id v14 = [[RAPDirectionsReportContaineeViewController alloc] initWithReport:v7 directionsReportContext:0];
        [(RAPPresenter *)self presentViewController:v14 animated:1];
      }
      else
      {
        id v15 = sub_10057670C();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)id v16 = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Can't present after nav flow because the latest route doesn't have a route recording.", v16, 2u);
        }

        id v12 = 0;
      }
    }
    else
    {
      id v12 = sub_10057670C();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to create report. Will abort RAP.", buf, 2u);
      }
    }
  }
}

- (void)presentReportAProblemForRouteFromEntryPoint:(int)a3
{
}

- (void)presentLookAroundRAPWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(RAPPresenter *)self presentOfflineAlertIfNecessaryWithCompletion:v7])
  {
    id v8 = [RAPAppStateCreator alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
    id v10 = [(RAPAppStateCreator *)v8 initWithSceneDelegate:WeakRetained];

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100D7C42C;
    v11[3] = &unk_1013235E0;
    void v11[4] = self;
    id v12 = v7;
    [(RAPAppStateCreator *)v10 createLookAroundReportAProblemAppStateWithLookAroundContext:v6 completion:v11];
  }
}

- (void)presentPlacecardImageryRAPWithContext:(id)a3 selectedIssueItem:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![(RAPPresenter *)self presentOfflineAlertIfNecessaryWithCompletion:v10])
  {
    double v11 = [RAPAppStateCreator alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
    id v13 = [(RAPAppStateCreator *)v11 initWithSceneDelegate:WeakRetained];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100D7C69C;
    v14[3] = &unk_101323680;
    void v14[4] = self;
    id v15 = v9;
    id v16 = v10;
    [(RAPAppStateCreator *)v13 createPlacecardImageryReportAProblemAppStateWithContext:v8 completion:v14];
  }
}

- (void)presentPlacecardImageryRAPWithContext:(id)a3 layoutManager:(id)a4 popoverPresentationBlock:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (![(RAPPresenter *)self presentOfflineAlertIfNecessaryWithCompletion:v13])
  {
    id v14 = [RAPAppStateCreator alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
    id v16 = [(RAPAppStateCreator *)v14 initWithSceneDelegate:WeakRetained];

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100D7C8CC;
    v17[3] = &unk_1013236D0;
    v17[4] = self;
    id v18 = v11;
    id v19 = v12;
    id v20 = v13;
    [(RAPAppStateCreator *)v16 createPlacecardImageryReportAProblemAppStateWithContext:v10 completion:v17];
  }
}

- (void)_presentPlacecardImageryCommentViewControllerWithReport:(id)a3 question:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = [RAPReportComposerViewController alloc];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100D7CD14;
  v15[3] = &unk_1013236F8;
  objc_copyWeak(&v17, &location);
  id v12 = v10;
  id v16 = v12;
  id v13 = [(RAPReportComposerViewController *)v11 initWithReport:v8 commentQuestion:v9 completion:v15];
  reportComposer = self->_reportComposer;
  self->_reportComposer = v13;

  [(RAPPresenter *)self _presentReportComposerWithCompletion:v12];
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)_submitLightweightReport:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100D7CE48;
  v8[3] = &unk_101323760;
  id v9 = a3;
  id v10 = self;
  id v11 = a4;
  id v6 = v11;
  id v7 = v9;
  +[RAPPrivacy performPrivacyCheckWithAppearance:1 completion:v8];
}

- (void)presentAddAPlaceViewControllerFromEntryPoint:(int)a3 withAppState:(id)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v25 = a4;
  id v8 = a5;
  if (![(RAPPresenter *)self presentOfflineAlertIfNecessaryWithCompletion:v8])
  {
    id v9 = [RAPReport alloc];
    id v10 = [(RAPPresenter *)self submissionManager];
    id v11 = [(RAPReport *)v9 initWithContext:v25 submitter:v10];

    id v12 = [(RAPReport *)v11 combinedUserPath];
    [v12 addNativePath:v6];

    int BOOL = GEOConfigGetBOOL();
    unsigned int v14 = [v25 isSprMap];
    uint64_t v15 = 5;
    if (v14) {
      uint64_t v15 = 6;
    }
    uint64_t v16 = 3;
    if (v14) {
      uint64_t v16 = 4;
    }
    if (BOOL) {
      uint64_t v17 = v15;
    }
    else {
      uint64_t v17 = v16;
    }
    id v18 = [(RAPReport *)v11 _context];
    id v19 = [v18 reportedPlace];
    id v20 = [v19 source];

    if (v20 == (id)1)
    {
      if ([v25 isSprMap]) {
        uint64_t v17 = 8;
      }
      else {
        uint64_t v17 = 7;
      }
    }
    id v21 = [RAPWebBundleQuestion alloc];
    id v22 = [(RAPReport *)v11 _context];
    id v23 = [v22 reportedPlace];
    id v24 = [(RAPWebBundleQuestion *)v21 initWithReport:v11 place:v23 questionType:v17];

    [(RAPReport *)v11 setInitialQuestion:v24];
    [(RAPPresenter *)self _presentWebBundleWithReport:v11 completion:v8];
  }
}

- (void)presentCuratedCollectionRAPWithContext:(id)a3 sourceView:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![(RAPPresenter *)self presentOfflineAlertIfNecessaryWithCompletion:v10])
  {
    id v11 = [RAPAppStateCreator alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
    id v13 = [(RAPAppStateCreator *)v11 initWithSceneDelegate:WeakRetained];

    objc_initWeak(&location, self);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100D7D274;
    v14[3] = &unk_1013237B0;
    objc_copyWeak(&v18, &location);
    id v17 = v10;
    id v15 = v9;
    uint64_t v16 = self;
    [(RAPAppStateCreator *)v13 createCuratedCollectionReportAProblemAppStateWithContext:v8 completion:v14];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

- (id)submissionManager
{
  v2 = +[UIApplication sharedMapsDelegate];
  BOOL v3 = [v2 submissionManager];

  return v3;
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 presentingViewController];

    if (!v8)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
      id v10 = [WeakRetained topMostPresentedViewController];

      if (v10
        && (([v10 isBeingDismissed] & 1) != 0
         || [v10 isBeingPresented]))
      {
        dispatch_time_t v11 = dispatch_time(0, 100000000);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100D7DDD8;
        block[3] = &unk_1012E5CE0;
        block[4] = self;
        id v20 = v7;
        BOOL v21 = v4;
        dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, block);
        id v12 = v20;
      }
      else
      {
        if (![(RAPPresenter *)self _isMACPlaceCardViewController:v10 tryingToPresent:v7])
        {
          id v15 = objc_loadWeakRetained((id *)&self->_sceneDelegate);
          [v15 presentViewController:v7 animated:v4];

          goto LABEL_11;
        }
        id v13 = v10;
        unsigned int v14 = [v13 placeCardDelegate];
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_100D7DDE8;
        v16[3] = &unk_1012E5CE0;
        void v16[4] = self;
        id v17 = v7;
        BOOL v18 = v4;
        [v14 placeCardViewController:v13 dismissAnimated:1 completion:v16];

        id v12 = v17;
      }

LABEL_11:
    }
  }
}

- (BOOL)_isMACPlaceCardViewController:(id)a3 tryingToPresent:(id)a4
{
  id v4 = a3;
  if (sub_1000BBB44(v4) == 5)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void)presentAddToMapsFromSearchEntryPoint:(int)a3 result:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (![(RAPPresenter *)self presentOfflineAlertIfNecessaryWithCompletion:v9])
  {
    objc_initWeak(&location, self);
    id v10 = [RAPAppStateCreator alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
    id v12 = [(RAPAppStateCreator *)v10 initWithSceneDelegate:WeakRetained];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100D7DFFC;
    v13[3] = &unk_101323590;
    objc_copyWeak(&v16, &location);
    int v17 = a3;
    id v14 = v8;
    id v15 = v9;
    [(RAPAppStateCreator *)v12 createReportAProblemAppStateWithCompletion:v13];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

- (void)presentAddToMapsFromSearchEntryPoint:(int)a3 result:(id)a4 withAppState:(id)a5 completion:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v17 = a4;
  id v10 = a5;
  id v11 = a6;
  if (![(RAPPresenter *)self presentOfflineAlertIfNecessaryWithCompletion:v11])
  {
    id v12 = [RAPReport alloc];
    id v13 = [(RAPPresenter *)self submissionManager];
    id v14 = [(RAPReport *)v12 initWithContext:v10 submitter:v13];

    id v15 = [(RAPReport *)v14 combinedUserPath];
    [v15 addNativePath:v8];

    id v16 = [[RAPWebBundleQuestion alloc] initWithReport:v14 place:v17 questionType:28];
    [(RAPReport *)v14 setInitialQuestion:v16];
    [(RAPPresenter *)self _presentWebBundleWithReport:v14 completion:v11];
  }
}

- (void)presentPlaceEnrichmentRAPWithTarget:(int)a3 fromPlacecardWithEditingContext:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (![(RAPPresenter *)self presentOfflineAlertIfNecessaryWithCompletion:v9])
  {
    objc_initWeak(&location, self);
    id v10 = [RAPAppStateCreator alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
    id v12 = [(RAPAppStateCreator *)v10 initWithSceneDelegate:WeakRetained];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100D7E4AC;
    v13[3] = &unk_101323540;
    id v14 = v8;
    objc_copyWeak(&v16, &location);
    int v17 = a3;
    id v15 = v9;
    [(RAPAppStateCreator *)v12 createReportAProblemAppStateWithCompletion:v13];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

- (void)presentPlaceEnrichmentRAPWithTarget:(int)a3 withAppState:(id)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v17 = a4;
  id v8 = a5;
  if (![(RAPPresenter *)self presentOfflineAlertIfNecessaryWithCompletion:v8])
  {
    id v9 = [RAPReport alloc];
    id v10 = [(RAPPresenter *)self submissionManager];
    id v11 = [(RAPReport *)v9 initWithContext:v17 submitter:v10];

    id v12 = [(RAPReport *)v11 combinedUserPath];
    [v12 addNativePath:v6];

    id v13 = [RAPWebBundleQuestion alloc];
    id v14 = [(RAPReport *)v11 _context];
    id v15 = [v14 reportedPlace];
    id v16 = [(RAPWebBundleQuestion *)v13 initWithReport:v11 place:v15 poiCorrectionType:2 questionType:29];

    [(RAPReport *)v11 setInitialQuestion:v16];
    [(RAPPresenter *)self _presentWebBundleWithReport:v11 completion:v8];
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sceneDelegate);
  objc_storeStrong((id *)&self->_placecardImageryController, 0);

  objc_storeStrong((id *)&self->_reportComposer, 0);
}

@end