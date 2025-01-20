@interface ICPagesHandoffActivity
- (BOOL)canPerformWithActivityItems:(id)a3;
- (ICNAEventReporter)eventReporter;
- (ICNote)note;
- (ICPagesHandoffActivity)initWithNote:(id)a3 viewController:(id)a4;
- (UIViewController)viewController;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (id)performActivityBlock;
- (void)eventReporterLostSession:(id)a3;
- (void)performActivity;
- (void)setEventReporter:(id)a3;
- (void)setPerformActivityBlock:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation ICPagesHandoffActivity

- (ICNAEventReporter)eventReporter
{
  if (!self->_eventReporter)
  {
    if (+[ICNAEventReporter isOptedInForAnalytics])
    {
      v3 = [(ICPagesHandoffActivity *)self viewController];
      v4 = [v3 viewIfLoaded];

      if (v4)
      {
        id v5 = objc_alloc((Class)ICNAEventReporter);
        v6 = (objc_class *)objc_opt_class();
        v7 = NSStringFromClass(v6);
        v8 = [(ICPagesHandoffActivity *)self viewController];
        v9 = [v8 view];
        v10 = (ICNAEventReporter *)[v5 initWithSubTrackerName:v7 view:v9];
        eventReporter = self->_eventReporter;
        self->_eventReporter = v10;

        v12 = +[NSNotificationCenter defaultCenter];
        [v12 addObserver:self selector:"eventReporterLostSession:" name:ICNAEventReporterLostSessionNotification object:self->_eventReporter];
      }
    }
  }
  v13 = self->_eventReporter;

  return v13;
}

- (void)eventReporterLostSession:(id)a3
{
  eventReporter = self->_eventReporter;
  self->_eventReporter = 0;
  id v5 = a3;

  id v8 = +[NSNotificationCenter defaultCenter];
  uint64_t v6 = ICNAEventReporterLostSessionNotification;
  v7 = [v5 object];

  [v8 removeObserver:self name:v6 object:v7];
}

- (ICPagesHandoffActivity)initWithNote:(id)a3 viewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICPagesHandoffActivity;
  v9 = [(ICPagesHandoffActivity *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_note, a3);
    objc_storeWeak((id *)&v10->_viewController, v8);
  }

  return v10;
}

- (id)activityTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Open in Pages" value:&stru_10063F3D8 table:0];

  return v3;
}

- (id)activityImage
{
  return +[UIImage _systemImageNamed:@"apple.pages"];
}

- (id)activityType
{
  return @"com.apple.mobilenotes.PagesHandoff";
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
  v11 = objc_alloc_init(ICPagesHandoffManager);
  v3 = [(ICPagesHandoffActivity *)self note];
  v4 = [(ICPagesHandoffActivity *)self viewController];
  [(ICPagesHandoffManager *)v11 launchPagesWithArchiveFromNote:v3 viewController:v4];

  objc_opt_class();
  id v5 = [(ICPagesHandoffActivity *)self viewController];
  uint64_t v6 = ICDynamicCast();

  objc_opt_class();
  id v7 = [(ICPagesHandoffActivity *)self viewController];
  uint64_t v8 = ICDynamicCast();

  if (v6 | v8) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 1;
  }
  v10 = [(ICPagesHandoffActivity *)self eventReporter];
  [v10 submitNotesToPagesEventWithContextPath:v9];

  [(ICPagesHandoffActivity *)self activityDidFinish:1];
}

- (ICNote)note
{
  return self->_note;
}

- (UIViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);

  return (UIViewController *)WeakRetained;
}

- (void)setViewController:(id)a3
{
}

- (void)setEventReporter:(id)a3
{
}

- (id)performActivityBlock
{
  return self->_performActivityBlock;
}

- (void)setPerformActivityBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_performActivityBlock, 0);
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_destroyWeak((id *)&self->_viewController);

  objc_storeStrong((id *)&self->_note, 0);
}

@end