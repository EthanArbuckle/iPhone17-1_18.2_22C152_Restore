@interface BCActivityViewController
- (BCActivityViewController)initWithRootActivityItems:(id)a3 expandedActivityItems:(id)a4 applicationActivities:(id)a5 sharingStyle:(int64_t)a6 customActivityTypeOrder:(id)a7 customShareActivityTitle:(id)a8 appAnalyticsProvider:(id)a9 tracker:(id)a10;
- (BOOL)isContentManaged;
- (BOOL)isManagedBook;
- (NSArray)applicationActivities;
- (NSArray)rootActivityItems;
- (NSString)customShareActivityTitle;
- (UIActivity)selectedActivity;
- (id)_titleForActivity:(id)a3;
- (int64_t)overrideUserInterfaceStyle;
- (void)_performActivity:(id)a3;
- (void)setCustomShareActivityTitle:(id)a3;
- (void)setManagedBook:(BOOL)a3;
- (void)setRootActivityItems:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BCActivityViewController

- (BCActivityViewController)initWithRootActivityItems:(id)a3 expandedActivityItems:(id)a4 applicationActivities:(id)a5 sharingStyle:(int64_t)a6 customActivityTypeOrder:(id)a7 customShareActivityTitle:(id)a8 appAnalyticsProvider:(id)a9 tracker:(id)a10
{
  id v30 = a3;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  id v29 = a9;
  id v20 = a10;
  v31.receiver = self;
  v31.super_class = (Class)BCActivityViewController;
  v21 = [(BCActivityViewController *)&v31 initWithActivityItems:a4 applicationActivities:v17];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_rootActivityItems, a3);
    v23 = [v19 copy:v29, v30];
    customShareActivityTitle = v22->_customShareActivityTitle;
    v22->_customShareActivityTitle = v23;

    objc_storeStrong((id *)&v22->_applicationActivities, a5);
    objc_storeStrong((id *)&v22->_appAnalyticsProvider, a9);
    uint64_t v25 = [v20 chainWithName:@"ContextualActionSheet"];
    tracker = v22->_tracker;
    v22->_tracker = (_TtC13BookAnalytics9BATracker *)v25;

    [(BCActivityViewController *)v22 setActivityTypeOrder:v18];
    if (a6 == 1) {
      uint64_t v27 = 1;
    }
    else {
      uint64_t v27 = 2 * (a6 != 0);
    }
    [(BCActivityViewController *)v22 setSharingStyle:v27];
  }

  return v22;
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)BCActivityViewController;
  [(BCActivityViewController *)&v3 viewWillAppear:a3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v17.receiver = self;
  v17.super_class = (Class)BCActivityViewController;
  [(BCActivityViewController *)&v17 viewDidAppear:a3];
  v4 = +[NSDate date];
  analyticsAppearDate = self->_analyticsAppearDate;
  self->_analyticsAppearDate = v4;

  if (!self->_tracker)
  {
    v6 = [(BCActivityViewController *)self presentingViewController];
    v7 = [v6 viewIfLoaded];
    v8 = [v7 window];
    v9 = [v8 rootViewController];
    v10 = [v9 bc_deepestVisibleChildViewControllerIncludePresented:1];

    v11 = [v10 ba_effectiveAnalyticsTracker];
    v12 = [v11 chainWithName:@"ContextualActionSheet"];
    tracker = self->_tracker;
    self->_tracker = v12;
  }
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_DE344;
  v14[3] = &unk_2C8CE8;
  objc_copyWeak(&v15, &location);
  [(BCActivityViewController *)self setPreCompletionHandler:v14];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BCActivityViewController;
  [(BCActivityViewController *)&v5 viewDidDisappear:a3];
  if (self->_tracker && self->_analyticsAppearDate)
  {
    if (self->_appAnalyticsProvider)
    {
      v4 = +[BAEventReporter sharedReporter];
      [v4 emitShareSheetExposureEventWithTracker:self->_tracker startDate:self->_analyticsAppearDate propertyProvider:self->_appAnalyticsProvider];
    }
  }
}

- (id)_titleForActivity:(id)a3
{
  if ([a3 isEqualToString:UIActivityTypeShare])
  {
    v4 = [(BCActivityViewController *)self customShareActivityTitle];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_performActivity:(id)a3
{
  v4 = (UIActivity *)a3;
  v6.receiver = self;
  v6.super_class = (Class)BCActivityViewController;
  [(BCActivityViewController *)&v6 _performActivity:v4];
  selectedActivity = self->_selectedActivity;
  self->_selectedActivity = v4;
}

- (BOOL)isContentManaged
{
  return self->_managedBook;
}

- (int64_t)overrideUserInterfaceStyle
{
  v2 = [(BCActivityViewController *)self presentingViewController];
  objc_super v3 = [v2 traitCollection];
  id v4 = [v3 userInterfaceStyle];

  return (int64_t)v4;
}

- (NSArray)applicationActivities
{
  return self->_applicationActivities;
}

- (UIActivity)selectedActivity
{
  return self->_selectedActivity;
}

- (BOOL)isManagedBook
{
  return self->_managedBook;
}

- (void)setManagedBook:(BOOL)a3
{
  self->_managedBook = a3;
}

- (NSArray)rootActivityItems
{
  return self->_rootActivityItems;
}

- (void)setRootActivityItems:(id)a3
{
}

- (NSString)customShareActivityTitle
{
  return self->_customShareActivityTitle;
}

- (void)setCustomShareActivityTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customShareActivityTitle, 0);
  objc_storeStrong((id *)&self->_rootActivityItems, 0);
  objc_storeStrong((id *)&self->_selectedActivity, 0);
  objc_storeStrong((id *)&self->_applicationActivities, 0);
  objc_storeStrong((id *)&self->_appAnalyticsProvider, 0);
  objc_storeStrong((id *)&self->_tracker, 0);

  objc_storeStrong((id *)&self->_analyticsAppearDate, 0);
}

@end