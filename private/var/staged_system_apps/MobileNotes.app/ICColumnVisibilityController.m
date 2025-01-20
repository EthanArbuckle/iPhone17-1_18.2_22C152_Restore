@interface ICColumnVisibilityController
- (BOOL)shouldForceShowMainSplitViewColumn:(int64_t)a3;
- (ICColumnVisibilityController)initWithViewControllerManager:(id)a3;
- (ICMainSplitViewController)mainSplitViewController;
- (ICTrailingSidebarSplitViewController)trailingColumnSplitViewController;
- (ICViewControllerManager)viewControllerManager;
- (id)topViewControllerForMainSplitViewColumn:(int64_t)a3;
- (int64_t)mostRecentMainLandscapeDisplayMode;
- (int64_t)mostRecentTrailingColumnLandscapeDisplayMode;
- (void)setMostRecentMainLandscapeDisplayMode:(int64_t)a3;
- (void)setMostRecentTrailingColumnLandscapeDisplayMode:(int64_t)a3;
- (void)splitViewWillTransitionToSize:(id)a3;
@end

@implementation ICColumnVisibilityController

- (ICColumnVisibilityController)initWithViewControllerManager:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICColumnVisibilityController;
  v5 = [(ICColumnVisibilityController *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_viewControllerManager, v4);
    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v6 selector:"splitViewWillTransitionToSize:" name:@"ICSplitViewControllerWillTransitionToSizeNotification" object:0];
  }
  return v6;
}

- (ICMainSplitViewController)mainSplitViewController
{
  v2 = [(ICColumnVisibilityController *)self viewControllerManager];
  v3 = [v2 mainSplitViewController];

  return (ICMainSplitViewController *)v3;
}

- (ICTrailingSidebarSplitViewController)trailingColumnSplitViewController
{
  objc_opt_class();
  v3 = [(ICColumnVisibilityController *)self viewControllerManager];
  id v4 = [v3 trailingSidebarViewController];
  v5 = ICDynamicCast();

  return (ICTrailingSidebarSplitViewController *)v5;
}

- (void)splitViewWillTransitionToSize:(id)a3
{
  id v4 = a3;
  v5 = [v4 object];
  v6 = [v5 traitCollection];
  unsigned __int8 v7 = [v6 ic_hasCompactSize];

  if ((v7 & 1) == 0)
  {
    v8 = [v4 userInfo];
    objc_super v9 = [v8 objectForKeyedSubscript:@"ICSplitViewControllerWillTransitionToSizeNotificationNewSizeKey"];
    [v9 CGSizeValue];
    double v11 = v10;
    double v13 = v12;

    v14 = [v4 userInfo];
    v15 = [v14 objectForKeyedSubscript:@"ICSplitViewControllerWillTransitionToSizeNotificationTransitionCoordinatorKey"];

    v16 = [(ICColumnVisibilityController *)self trailingColumnSplitViewController];
    v17 = [v16 view];
    [v17 bounds];
    double v19 = v18;
    double v21 = v20;

    BOOL v22 = v19 < v21 && v11 > v13;
    v23 = [(ICColumnVisibilityController *)self trailingColumnSplitViewController];

    if (v5 == v23)
    {
      v26 = [(ICColumnVisibilityController *)self viewControllerManager];
      v27 = [v26 activityStreamSelection];

      if (v22)
      {
        id v28 = [v5 displayMode];
        BOOL v29 = 1;
        if (v28 != (id)3 && !v27)
        {
          if ((id)[(ICColumnVisibilityController *)self mostRecentTrailingColumnLandscapeDisplayMode] == (id)2)[(ICColumnVisibilityController *)self setMostRecentMainLandscapeDisplayMode:2]; {
          BOOL v29 = 0;
          }
        }
      }
      else
      {
        v54 = v15;
        v30 = [(ICColumnVisibilityController *)self viewControllerManager];
        v31 = [v30 window];
        v32 = [v31 rootViewController];
        v33 = [v32 ic_topViewController];
        unsigned __int8 v34 = [v33 ic_hasFullScreenModalPresentationStyle];

        if (v34)
        {
          BOOL v29 = 0;
        }
        else
        {
          -[ICColumnVisibilityController setMostRecentTrailingColumnLandscapeDisplayMode:](self, "setMostRecentTrailingColumnLandscapeDisplayMode:", [v5 displayMode]);
          BOOL v29 = [v5 displayMode] == (id)2 && v27 == 0;
        }
        v15 = v54;
      }
      v61[0] = _NSConcreteStackBlock;
      v61[1] = 3221225472;
      v61[2] = sub_100066D74;
      v61[3] = &unk_100626948;
      BOOL v64 = v22;
      v61[4] = self;
      id v62 = v27;
      BOOL v65 = v29;
      id v63 = v5;
      id v40 = v27;
      v41 = objc_retainBlock(v61);

      goto LABEL_47;
    }
    v24 = [(ICColumnVisibilityController *)self mainSplitViewController];

    if (v5 == v24)
    {
      v25 = [(ICColumnVisibilityController *)self trailingColumnSplitViewController];
      if ([v25 displayMode] == (id)1)
      {

        goto LABEL_18;
      }
      unsigned __int8 v35 = +[UIDevice ic_isiPad];

      if ((v35 & 1) == 0)
      {
LABEL_18:
        if (+[UIDevice ic_isVision])
        {
          v36 = [(ICColumnVisibilityController *)self viewControllerManager];
          if ([v36 noteContainerViewMode] == (id)1)
          {
            v37 = [(ICColumnVisibilityController *)self viewControllerManager];
            unsigned __int8 v38 = [v37 isNoteEditorVisible];

            if (v38) {
              goto LABEL_52;
            }
          }
          else
          {
          }
        }
        if (v11 != v19 && v13 != v21) {
          [v5 setPreferredDisplayMode:0];
        }
        v42 = &__kCFBooleanTrue;
        if (v22)
        {
          if ((id)[(ICColumnVisibilityController *)self mostRecentMainLandscapeDisplayMode] == (id)1)
          {
            v43 = &__kCFBooleanFalse;
            v44 = &__kCFBooleanFalse;
LABEL_39:
            if ([(ICColumnVisibilityController *)self shouldForceShowMainSplitViewColumn:0])
            {
              v43 = &__kCFBooleanTrue;
            }
            if (![(ICColumnVisibilityController *)self shouldForceShowMainSplitViewColumn:1])v42 = v44; {
            v57[0] = _NSConcreteStackBlock;
            }
            v57[1] = 3221225472;
            v57[2] = sub_100066E44;
            v57[3] = &unk_100625A00;
            v58 = v43;
            id v45 = v5;
            id v59 = v45;
            id v60 = v42;
            v41 = objc_retainBlock(v57);
            if (!v22)
            {
              v46 = +[UIApplication sharedApplication];
              id v47 = [v46 applicationState];

              if (!v47) {
                -[ICColumnVisibilityController setMostRecentMainLandscapeDisplayMode:](self, "setMostRecentMainLandscapeDisplayMode:", [v45 displayMode]);
              }
            }

            id v40 = v58;
LABEL_47:

            if (v41)
            {
              v48 = +[UIApplication sharedApplication];
              id v49 = [v48 applicationState];

              if (v49 == (id)2)
              {
                ((void (*)(void *))v41[2])(v41);
              }
              else
              {
                v55[0] = _NSConcreteStackBlock;
                v55[1] = 3221225472;
                v55[2] = sub_100066EE0;
                v55[3] = &unk_100625E18;
                id v56 = v41;
                v50 = v41;
                [v15 animateAlongsideTransition:v55 completion:0];
              }
            }
            goto LABEL_52;
          }
          v51 = [(ICColumnVisibilityController *)self viewControllerManager];
          id v52 = [v51 noteContainerViewMode];

          int64_t v53 = [(ICColumnVisibilityController *)self mostRecentMainLandscapeDisplayMode];
          if (v52 == (id)1)
          {
            v44 = 0;
            if (v53 == 2) {
              v43 = &__kCFBooleanTrue;
            }
            else {
              v43 = 0;
            }
            goto LABEL_39;
          }
          if (v53 == 4) {
            v43 = &__kCFBooleanTrue;
          }
          else {
            v43 = 0;
          }
          if ((id)[(ICColumnVisibilityController *)self mostRecentMainLandscapeDisplayMode] == (id)2|| (id)[(ICColumnVisibilityController *)self mostRecentMainLandscapeDisplayMode] == (id)4)
          {
            v44 = &__kCFBooleanTrue;
            goto LABEL_39;
          }
        }
        else
        {
          v43 = 0;
        }
        v44 = 0;
        goto LABEL_39;
      }
    }
LABEL_52:
  }
}

- (BOOL)shouldForceShowMainSplitViewColumn:(int64_t)a3
{
  id v4 = [(ICColumnVisibilityController *)self topViewControllerForMainSplitViewColumn:a3];
  v5 = [(ICColumnVisibilityController *)self viewControllerManager];
  if ([v5 isTrailingContentVisible])
  {
    unsigned __int8 v6 = 0;
  }
  else
  {
    unsigned __int8 v7 = [(ICColumnVisibilityController *)self mainSplitViewController];
    if ([v7 displayMode] == (id)1)
    {
      unsigned __int8 v6 = 0;
    }
    else if ([v4 isEditing])
    {
      unsigned __int8 v6 = 1;
    }
    else
    {
      v8 = [v4 navigationItem];
      objc_super v9 = [v8 searchController];
      unsigned __int8 v6 = [v9 isActive];
    }
  }

  return v6;
}

- (id)topViewControllerForMainSplitViewColumn:(int64_t)a3
{
  id v4 = [(ICColumnVisibilityController *)self mainSplitViewController];
  v5 = [v4 viewControllerForColumn:a3];

  objc_opt_class();
  unsigned __int8 v6 = ICDynamicCast();
  unsigned __int8 v7 = [v6 topViewController];

  return v7;
}

- (ICViewControllerManager)viewControllerManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerManager);

  return (ICViewControllerManager *)WeakRetained;
}

- (int64_t)mostRecentMainLandscapeDisplayMode
{
  return self->_mostRecentMainLandscapeDisplayMode;
}

- (void)setMostRecentMainLandscapeDisplayMode:(int64_t)a3
{
  self->_mostRecentMainLandscapeDisplayMode = a3;
}

- (int64_t)mostRecentTrailingColumnLandscapeDisplayMode
{
  return self->_mostRecentTrailingColumnLandscapeDisplayMode;
}

- (void)setMostRecentTrailingColumnLandscapeDisplayMode:(int64_t)a3
{
  self->_mostRecentTrailingColumnLandscapeDisplayMode = a3;
}

- (void).cxx_destruct
{
}

@end