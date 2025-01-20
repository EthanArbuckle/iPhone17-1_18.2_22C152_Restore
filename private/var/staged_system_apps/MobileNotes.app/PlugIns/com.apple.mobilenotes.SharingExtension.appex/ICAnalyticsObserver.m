@interface ICAnalyticsObserver
+ (id)sharedObserver;
- (ICAnalyticsObserver)init;
- (ICNAEventReporter)eventReporter;
- (void)dealloc;
- (void)noteAddAttachment:(id)a3;
- (void)setEventReporter:(id)a3;
@end

@implementation ICAnalyticsObserver

+ (id)sharedObserver
{
  if (qword_1001056F8 != -1) {
    dispatch_once(&qword_1001056F8, &stru_1000EDFB8);
  }
  v2 = (void *)qword_1001056F0;

  return v2;
}

- (ICAnalyticsObserver)init
{
  v5.receiver = self;
  v5.super_class = (Class)ICAnalyticsObserver;
  v2 = [(ICAnalyticsObserver *)&v5 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"noteAddAttachment:" name:ICNoteAnalyticsAddAttachmentNotification object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICAnalyticsObserver;
  [(ICAnalyticsObserver *)&v4 dealloc];
}

- (void)noteAddAttachment:(id)a3
{
  objc_super v4 = [a3 userInfo];
  id v7 = [v4 objectForKeyedSubscript:ICNoteAnalyticsAddAttachmentNotificationAttachmentKey];

  if (v7)
  {
    objc_super v5 = [v7 parentAttachment];

    if (!v5)
    {
      v6 = [(ICAnalyticsObserver *)self eventReporter];
      [v6 submitAttachmentAddEventForAttachment:v7];
    }
  }
}

- (ICNAEventReporter)eventReporter
{
  eventReporter = self->_eventReporter;
  if (!eventReporter)
  {
    id v4 = objc_alloc((Class)ICNAEventReporter);
    objc_super v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    id v7 = (ICNAEventReporter *)[v4 initWithSubTrackerName:v6];
    v8 = self->_eventReporter;
    self->_eventReporter = v7;

    eventReporter = self->_eventReporter;
  }

  return eventReporter;
}

- (void)setEventReporter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end