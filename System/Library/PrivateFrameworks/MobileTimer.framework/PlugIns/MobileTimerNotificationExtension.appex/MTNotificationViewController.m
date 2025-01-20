@interface MTNotificationViewController
- (CADisplayLink)displayLink;
- (MTNotificationView)noteView;
- (NSDate)countDownDate;
- (NSDateComponentsFormatter)durationFormatter;
- (void)_setupDisplayLink;
- (void)_teardownDisplayLink;
- (void)_updateCountDown:(id)a3;
- (void)didReceiveNotification:(id)a3;
- (void)setCountDownDate:(id)a3;
- (void)setDisplayLink:(id)a3;
- (void)setDurationFormatter:(id)a3;
- (void)setNoteView:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MTNotificationViewController

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)MTNotificationViewController;
  [(MTNotificationViewController *)&v15 viewDidLoad];
  v3 = [(MTNotificationViewController *)self view];
  v4 = [(MTNotificationViewController *)self noteView];
  [v3 addSubview:v4];

  v5 = (NSDateComponentsFormatter *)objc_alloc_init((Class)NSDateComponentsFormatter);
  durationFormatter = self->_durationFormatter;
  self->_durationFormatter = v5;

  [(NSDateComponentsFormatter *)self->_durationFormatter setUnitsStyle:0];
  [(NSDateComponentsFormatter *)self->_durationFormatter setZeroFormattingBehavior:0x10000];
  [(NSDateComponentsFormatter *)self->_durationFormatter setAllowedUnits:192];
  CFStringRef v16 = @"noteView";
  v7 = [(MTNotificationViewController *)self noteView];
  v17 = v7;
  v8 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];

  v9 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[noteView]|" options:0 metrics:0 views:v8];
  +[NSLayoutConstraint activateConstraints:v9];

  v10 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[noteView]" options:0 metrics:0 views:v8];
  +[NSLayoutConstraint activateConstraints:v10];

  v11 = [(MTNotificationViewController *)self noteView];
  v12 = +[UIScreen mainScreen];
  [v12 bounds];
  objc_msgSend(v11, "systemLayoutSizeFittingSize:", v13, v14);
  -[MTNotificationViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MTNotificationViewController;
  [(MTNotificationViewController *)&v4 viewWillDisappear:a3];
  [(MTNotificationViewController *)self _teardownDisplayLink];
}

- (void)didReceiveNotification:(id)a3
{
  id v4 = a3;
  v5 = MTLogForCategory(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "RECEIVED NOTIFICATION: %@", (uint8_t *)&v10, 0xCu);
  }

  v6 = [v4 request];
  v7 = [v6 content];
  v8 = [v7 userInfo];
  v9 = [v8 objectForKey:MTAlarmScheduledFiredDateKey];
  [(MTNotificationViewController *)self setCountDownDate:v9];

  [(MTNotificationViewController *)self _setupDisplayLink];
}

- (MTNotificationView)noteView
{
  noteView = self->_noteView;
  if (!noteView)
  {
    id v4 = (MTNotificationView *)objc_opt_new();
    v5 = self->_noteView;
    self->_noteView = v4;

    [(MTNotificationView *)self->_noteView setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"SNOOZE_REMAINING" value:&stru_100004250 table:0];
    [(MTNotificationView *)self->_noteView setStatusString:v7];

    noteView = self->_noteView;
  }
  v8 = noteView;
  return v8;
}

- (void)_updateCountDown:(id)a3
{
  id v4 = [(MTNotificationViewController *)self countDownDate];

  if (!v4
    || ([(MTNotificationViewController *)self countDownDate],
        v5 = objc_claimAutoreleasedReturnValue(),
        +[NSDate date],
        v6 = objc_claimAutoreleasedReturnValue(),
        id v7 = [v5 compare:v6],
        v6,
        v5,
        v7 == (id)-1))
  {
    [(MTNotificationViewController *)self _teardownDisplayLink];
  }
  else
  {
    id v11 = [(MTNotificationViewController *)self durationFormatter];
    v8 = [(MTNotificationViewController *)self countDownDate];
    [v8 timeIntervalSinceNow];
    v9 = objc_msgSend(v11, "stringFromTimeInterval:");
    int v10 = [(MTNotificationViewController *)self noteView];
    [v10 setTimeString:v9];
  }
}

- (void)_setupDisplayLink
{
  v3 = [(MTNotificationViewController *)self displayLink];

  if (!v3)
  {
    id v4 = MTLogForCategory(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_1000026E8(v4);
    }

    v5 = +[CADisplayLink displayLinkWithTarget:self selector:"_updateCountDown:"];
    [(MTNotificationViewController *)self setDisplayLink:v5];

    v6 = [(MTNotificationViewController *)self displayLink];
    [v6 setPreferredFramesPerSecond:10];

    id v7 = [(MTNotificationViewController *)self displayLink];
    v8 = +[NSRunLoop mainRunLoop];
    [v7 addToRunLoop:v8 forMode:NSRunLoopCommonModes];
  }
}

- (void)_teardownDisplayLink
{
  v3 = [(MTNotificationViewController *)self displayLink];

  if (v3)
  {
    id v4 = MTLogForCategory(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_10000272C(v4);
    }

    v5 = [(MTNotificationViewController *)self displayLink];
    [v5 invalidate];

    [(MTNotificationViewController *)self setDisplayLink:0];
  }
}

- (void)setNoteView:(id)a3
{
}

- (NSDate)countDownDate
{
  return self->_countDownDate;
}

- (void)setCountDownDate:(id)a3
{
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
}

- (NSDateComponentsFormatter)durationFormatter
{
  return self->_durationFormatter;
}

- (void)setDurationFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_durationFormatter, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_countDownDate, 0);
  objc_storeStrong((id *)&self->_noteView, 0);
}

@end