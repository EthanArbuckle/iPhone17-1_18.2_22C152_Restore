@interface ICNAViewController
- (ICNAEventReporter)eventReporter;
- (void)dealloc;
- (void)eventReporterLostSession:(id)a3;
- (void)setEventReporter:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ICNAViewController

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICNAViewController;
  [(ICNAViewController *)&v4 dealloc];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(ICNAViewController *)self view];
  v6 = [v5 window];

  if (v6)
  {
    [(ICNAViewController *)self eventReporter];
  }
  v7.receiver = self;
  v7.super_class = (Class)ICNAViewController;
  [(ICNAViewController *)&v7 viewWillAppear:v3];
}

- (ICNAEventReporter)eventReporter
{
  if (!self->_eventReporter)
  {
    if (+[ICNAOptedInObject isOptedInForAnalytics])
    {
      BOOL v3 = [(ICNAViewController *)self viewForEventReporterIfLoaded];

      if (v3)
      {
        objc_super v4 = [ICNAEventReporter alloc];
        v5 = (objc_class *)objc_opt_class();
        v6 = NSStringFromClass(v5);
        objc_super v7 = [(ICNAViewController *)self viewForEventReporter];
        v8 = [(ICNAEventReporter *)v4 initWithSubTrackerName:v6 view:v7];
        eventReporter = self->_eventReporter;
        self->_eventReporter = v8;

        v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v10 addObserver:self selector:sel_eventReporterLostSession_ name:@"ICNAEventReporterLostSessionNotification" object:self->_eventReporter];
      }
    }
  }
  v11 = self->_eventReporter;
  return v11;
}

- (void)eventReporterLostSession:(id)a3
{
  eventReporter = self->_eventReporter;
  self->_eventReporter = 0;
  id v5 = a3;

  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v6 = [v5 object];

  [v7 removeObserver:self name:@"ICNAEventReporterLostSessionNotification" object:v6];
}

- (void)setEventReporter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end