@interface CarplayNavigationController
- (CarplayNavigationController)initWithModel:(id)a3;
- (id)undoManager;
- (void)_dismissModalView:(id)a3;
- (void)_dismissPresentedViewController;
- (void)_initializeAndPushListView;
- (void)_showEvent:(id)a3 animated:(BOOL)a4;
- (void)_showListScrolledToDate:(id)a3;
- (void)handleURL:(id)a3;
@end

@implementation CarplayNavigationController

- (CarplayNavigationController)initWithModel:(id)a3
{
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CarplayNavigationController;
  v6 = [(CarplayNavigationController *)&v25 init];
  v7 = v6;
  if (v6)
  {
    p_model = (id *)&v6->_model;
    objc_storeStrong((id *)&v6->_model, a3);
    v9 = [*p_model undoManager];
    v10 = [v9 undoableEditor];

    v11 = (EKUIIntegrationAlertDisplayer *)[objc_alloc((Class)EKUIIntegrationAlertDisplayer) initWithViewController:v7 options:0];
    alertDisplayer = v7->_alertDisplayer;
    v7->_alertDisplayer = v11;

    id v13 = objc_alloc((Class)CUIKIPendingReminderTracker);
    v14 = [*p_model eventStore];
    id v15 = [v13 initWithEventStore:v14];

    [v5 setPendingReminderTracker:v15];
    id v16 = objc_alloc((Class)CUIKIReminderEditor);
    v17 = [*p_model eventStore];
    v18 = [*p_model undoManager];
    id v19 = [v16 initWithEventStore:v17 undoManager:v18 alertDisplayer:v7->_alertDisplayer pendingReminderTracker:v15];

    id v20 = objc_alloc((Class)CUIKCompositeEditor);
    v26[0] = v10;
    v26[1] = v19;
    v21 = +[NSArray arrayWithObjects:v26 count:2];
    id v22 = [v20 initWithEditors:v21];

    v23 = [*p_model undoManager];
    [v23 setUndoableEditor:v22];

    [(CarplayNavigationController *)v7 _initializeAndPushListView];
  }

  return v7;
}

- (void)handleURL:(id)a3
{
  id v4 = a3;
  id v5 = self->_model;
  v6 = [v4 scheme];
  if ([v6 isEqualToString:_EKEventURLScheme])
  {
    v7 = [(CUIKCalendarModel *)v5 eventStore];
    v8 = [v7 _eventWithURI:v4 checkValid:1];

    if (v8)
    {
      v9 = kCalUILogCarplayHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogCarplayHandle, OS_LOG_TYPE_INFO))
      {
        int v15 = 138412290;
        id v16 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "handling url as showing event:%@", (uint8_t *)&v15, 0xCu);
      }
      [(CarplayNavigationController *)self _dismissPresentedViewController];
      [(CarplayNavigationController *)self _showEvent:v8 animated:1];
    }
LABEL_11:

    goto LABEL_12;
  }
  if ([v6 isEqualToString:@"calshow"])
  {
    v8 = [v4 resourceSpecifier];
    if ([v8 length])
    {
      v10 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", (double)(int)[v8 intValue]);
      v11 = kCalUILogCarplayHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogCarplayHandle, OS_LOG_TYPE_INFO))
      {
        int v15 = 138412290;
        id v16 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "handling url as scrolling to date:%@", (uint8_t *)&v15, 0xCu);
      }
      [(CarplayNavigationController *)self _dismissPresentedViewController];
      v12 = [(CUIKCalendarModel *)v5 calendar];
      id v13 = [v12 timeZone];
      v14 = +[EKCalendarDate calendarDateWithDate:v10 timeZone:v13];
      [(CarplayNavigationController *)self _showListScrolledToDate:v14];
    }
    goto LABEL_11;
  }
LABEL_12:
}

- (void)_dismissPresentedViewController
{
  id v4 = [(CarplayNavigationController *)self presentedViewController];
  if (v4) {
    [(CarplayNavigationController *)self dismissViewControllerAnimated:1 completion:0];
  }
  id v3 = [(CarplayNavigationController *)self popToRootViewControllerAnimated:1];
}

- (void)_showEvent:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(CarplayNavigationController *)self bottomViewController];
  id v8 = [v7 sectionForEvent:v6];
  v9 = kCalUILogCarplayHandle;
  BOOL v10 = os_log_type_enabled((os_log_t)kCalUILogCarplayHandle, OS_LOG_TYPE_DEBUG);
  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Showing detail view as modal", buf, 2u);
    }
    v11 = [[CarplayDetailViewController alloc] initWithEvent:v6 showDayName:1];
    id v12 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v11];
    id v13 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"_dismissModalView:"];
    v14 = [(CarplayDetailViewController *)v11 navigationItem];
    [v14 setLeftBarButtonItem:v13];

    [(CarplayNavigationController *)self presentViewController:v12 animated:v4 completion:0];
  }
  else
  {
    if (v10)
    {
      *(_WORD *)int v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Showing detail view on nav stack", v15, 2u);
    }
    [v7 setViewControllerTitleForSelectedEventInSection:v8];
    v11 = [[CarplayDetailViewController alloc] initWithEvent:v6 showDayName:0];
    [(CarplayNavigationController *)self pushViewController:v11 animated:v4];
  }
}

- (void)_dismissModalView:(id)a3
{
}

- (void)_showListScrolledToDate:(id)a3
{
  id v4 = a3;
  id v5 = [(CarplayNavigationController *)self bottomViewController];
  [v5 scrollToDate:v4];
}

- (void)_initializeAndPushListView
{
  id v3 = [[CarplayListViewController alloc] initWithModel:self->_model];
  [(CarplayNavigationController *)self pushViewController:v3 animated:0];
}

- (id)undoManager
{
  return [(CUIKCalendarModel *)self->_model undoManager];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertDisplayer, 0);

  objc_storeStrong((id *)&self->_model, 0);
}

@end