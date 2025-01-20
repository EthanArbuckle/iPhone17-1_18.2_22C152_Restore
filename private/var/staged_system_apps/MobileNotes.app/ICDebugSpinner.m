@interface ICDebugSpinner
- (NSMutableArray)windows;
- (void)hide;
- (void)setWindows:(id)a3;
- (void)show;
@end

@implementation ICDebugSpinner

- (void)show
{
  v3 = [(ICDebugSpinner *)self windows];

  v4 = os_log_create("com.apple.notes", "UI");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Trying to show debug spinner, but it's already showing", buf, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_1004D82F0(v5);
    }

    id v6 = objc_alloc_init((Class)NSMutableArray);
    [(ICDebugSpinner *)self setWindows:v6];

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v7 = +[ICAppDelegate sharedInstance];
    v5 = [v7 viewControllerManagers];

    id v8 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        v11 = 0;
        do
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v5);
          }
          v12 = [*(id *)(*((void *)&v21 + 1) + 8 * (void)v11) window];
          v13 = [v12 windowScene];

          if (v13)
          {
            id v14 = objc_alloc_init((Class)UIWindow);
            v15 = [(ICDebugSpinner *)self windows];
            [v15 addObject:v14];

            [v14 setWindowScene:v13];
            v16 = +[UIColor colorWithWhite:0.0 alpha:0.5];
            [v14 setBackgroundColor:v16];

            [v14 setWindowLevel:UIWindowLevelStatusBar];
            [v14 makeKeyAndVisible];
            [v14 setAlpha:0.0];
            id v17 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:101];
            [v14 bounds];
            TSDCenterOfRect();
            [v17 setCenter:];
            [v17 startAnimating];
            [v17 setHidden:0];
            [v14 addSubview:v17];
            v19[0] = _NSConcreteStackBlock;
            v19[1] = 3221225472;
            v19[2] = sub_100091FCC;
            v19[3] = &unk_100625AF0;
            id v20 = v14;
            id v18 = v14;
            +[UIView animateWithDuration:v19 animations:0.25];
          }
          else
          {
            +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((scene) != nil)", "-[ICDebugSpinner show]", 1, 0, @"Expected non-nil value for '%s'", "scene");
          }

          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v9);
    }
  }
}

- (void)hide
{
  v3 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1004D8334(v3);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v10 = self;
  v4 = [(ICDebugSpinner *)self windows];
  id v5 = [v4 copy];

  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_1000921D8;
        v13[3] = &unk_100625AF0;
        v13[4] = v12;
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_1000921E4;
        v11[3] = &unk_100626580;
        +[UIView animateWithDuration:v13 animations:v11 completion:0.25];
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  [(ICDebugSpinner *)v10 setWindows:0];
}

- (NSMutableArray)windows
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setWindows:(id)a3
{
}

- (void).cxx_destruct
{
}

@end