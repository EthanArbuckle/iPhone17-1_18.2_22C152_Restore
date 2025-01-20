@interface WFWorkflowSceneDelegate
- (UIWindow)window;
- (WFComposeViewController)composeViewController;
- (id)stateRestorationActivityForScene:(id)a3;
- (void)composeViewControllerRequestsDismissal:(id)a3 forTutorial:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)setComposeViewController:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation WFWorkflowSceneDelegate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composeViewController, 0);

  objc_storeStrong((id *)&self->_window, 0);
}

- (void)setComposeViewController:(id)a3
{
}

- (WFComposeViewController)composeViewController
{
  return self->_composeViewController;
}

- (void)setWindow:(id)a3
{
}

- (UIWindow)window
{
  return self->_window;
}

- (id)stateRestorationActivityForScene:(id)a3
{
  v3 = [(WFWorkflowSceneDelegate *)self composeViewController];
  v4 = [v3 workflow];
  v5 = [v4 reference];

  if (v5)
  {
    v6 = +[WFWindowSceneManager userActivityForEditingWorkflow:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)composeViewControllerRequestsDismissal:(id)a3 forTutorial:(BOOL)a4 withCompletionHandler:(id)a5
{
  v11 = (void (**)(void))a5;
  v6 = [a3 view];
  v7 = [v6 window];
  v8 = [v7 windowScene];
  v9 = [v8 session];

  if (v9)
  {
    v10 = +[UIApplication sharedApplication];
    [v10 requestSceneSessionDestruction:v9 options:0 errorHandler:0];
  }
  if (v11) {
    v11[2]();
  }
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v39 = a5;
  v10 = +[WFDatabase defaultDatabase];
  v11 = [v9 stateRestorationActivity];
  v12 = +[WFWindowSceneManager workflowIdentifierFromUserActivity:v11];

  if (v12)
  {
LABEL_12:
    v19 = [v10 referenceForWorkflowID:v12];
    v20 = +[WFWorkflow workflowWithReference:v19 database:v10 error:0];
    +[WFWindowSceneManager setupSession:v9 forEditingWorkflow:v19];
    v21 = (WFComposeViewController *)[objc_alloc((Class)WFComposeViewController) initWithWorkflow:v20 database:v10];
    composeViewController = self->_composeViewController;
    self->_composeViewController = v21;

    [(WFComposeViewController *)self->_composeViewController setDelegate:self];
    v23 = [v20 name];
    [v8 setTitle:v23];

    uint64_t v24 = objc_opt_class();
    id v38 = v8;
    id v25 = v8;
    if (v25 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      v27 = getWFGeneralLogObject();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        v28 = objc_opt_class();
        *(_DWORD *)buf = 136315906;
        v46 = "WFEnforceClass";
        __int16 v47 = 2114;
        id v48 = v25;
        __int16 v49 = 2114;
        v50 = v28;
        __int16 v51 = 2114;
        uint64_t v52 = v24;
        id v29 = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);
      }
      id v26 = 0;
    }
    else
    {
      id v26 = v25;
    }

    id v30 = [objc_alloc((Class)UIWindow) initWithWindowScene:v26];
    [(WFWorkflowSceneDelegate *)self setWindow:v30];

    v31 = +[UIColor systemBackgroundColor];
    v32 = [(WFWorkflowSceneDelegate *)self window];
    [v32 setBackgroundColor:v31];

    id v33 = objc_alloc((Class)WFComposePresentingViewController);
    v34 = [(WFWorkflowSceneDelegate *)self composeViewController];
    id v35 = [v33 initWithComposeViewController:v34];
    v36 = [(WFWorkflowSceneDelegate *)self window];
    [v36 setRootViewController:v35];

    v37 = [(WFWorkflowSceneDelegate *)self window];
    [v37 makeKeyAndVisible];

    id v8 = v38;
  }
  else
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v13 = [v39 userActivities];
    id v14 = [v13 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v41;
      while (2)
      {
        v17 = 0;
        do
        {
          if (*(void *)v41 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = +[WFWindowSceneManager workflowIdentifierFromUserActivity:*(void *)(*((void *)&v40 + 1) + 8 * (void)v17)];
          if (v18)
          {
            v12 = (void *)v18;

            goto LABEL_12;
          }
          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v40 objects:v44 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    v12 = +[UIApplication sharedApplication];
    [v12 requestSceneSessionDestruction:v9 options:0 errorHandler:0];
  }
}

@end