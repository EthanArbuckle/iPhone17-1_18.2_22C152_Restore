@interface COSResetWatchNoticeViewController
+ (BOOL)controllerNeedsToRun;
- (BOOL)legacyButtonStyles;
- (COSResetWatchNoticeViewController)init;
- (OS_dispatch_source)discoveryTimer;
- (id)alternateButtonTitle;
- (id)detailString;
- (id)detailTitleString;
- (id)imageResource;
- (id)moreOptionsButtonString;
- (id)okayButtonTitle;
- (id)suggestedButtonTitle;
- (id)titleString;
- (void)beginDiscoveryTimer;
- (void)cancelDiscoveryTimer;
- (void)dealloc;
- (void)discoveredAdvertisingWatch:(id)a3;
- (void)okayButtonPressed:(id)a3;
- (void)setDiscoveryTimer:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation COSResetWatchNoticeViewController

+ (BOOL)controllerNeedsToRun
{
  return 0;
}

- (COSResetWatchNoticeViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)COSResetWatchNoticeViewController;
  v2 = [(COSResetWatchNoticeViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(COSResetWatchNoticeViewController *)v2 setStyle:96];
  }
  return v3;
}

- (void)dealloc
{
  v3 = +[PPDiscoveryManager sharedDiscoveryManager];
  [v3 end];

  v4.receiver = self;
  v4.super_class = (Class)COSResetWatchNoticeViewController;
  [(COSResetWatchNoticeViewController *)&v4 dealloc];
}

- (void)cancelDiscoveryTimer
{
  discoveryTimer = self->_discoveryTimer;
  if (discoveryTimer)
  {
    dispatch_source_cancel(discoveryTimer);
    objc_super v4 = self->_discoveryTimer;
    self->_discoveryTimer = 0;
  }
  objc_super v5 = +[PPDiscoveryManager sharedDiscoveryManager];
  [v5 end];

  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self name:PPDeviceWasDiscoveredNotification object:0];
}

- (void)beginDiscoveryTimer
{
  v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
  discoveryTimer = self->_discoveryTimer;
  self->_discoveryTimer = v3;

  objc_super v5 = self->_discoveryTimer;
  if (v5)
  {
    dispatch_time_t v6 = dispatch_time(0, 1000000000);
    dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    v7 = self->_discoveryTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10005C960;
    handler[3] = &unk_1002438A0;
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_resume((dispatch_object_t)self->_discoveryTimer);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)COSResetWatchNoticeViewController;
  [(COSResetWatchNoticeViewController *)&v4 viewDidAppear:a3];
  [(COSResetWatchNoticeViewController *)self cancelDiscoveryTimer];
  [(COSResetWatchNoticeViewController *)self beginDiscoveryTimer];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)COSResetWatchNoticeViewController;
  [(COSResetWatchNoticeViewController *)&v4 viewDidDisappear:a3];
  [(COSResetWatchNoticeViewController *)self cancelDiscoveryTimer];
}

- (id)titleString
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"RESET_WATCHES" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)detailTitleString
{
  return 0;
}

- (id)detailString
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"RESET_WATCHES_DETAIL" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)suggestedButtonTitle
{
  return 0;
}

- (id)alternateButtonTitle
{
  return 0;
}

- (BOOL)legacyButtonStyles
{
  return 1;
}

- (id)okayButtonTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"CONTINUE_SETUP" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)moreOptionsButtonString
{
  return 0;
}

- (id)imageResource
{
  return sub_1000328FC(@"Screen-MagicCode");
}

- (void)okayButtonPressed:(id)a3
{
  id v4 = [(COSResetWatchNoticeViewController *)self delegate];
  [v4 buddyControllerDone:self];
}

- (void)discoveredAdvertisingWatch:(id)a3
{
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:PPDeviceWasDiscoveredNotification object:0];

  objc_super v5 = pbb_bridge_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Discovered a nearby advertising watch, automatically continuing...", v7, 2u);
  }

  dispatch_time_t v6 = [(COSResetWatchNoticeViewController *)self delegate];
  [v6 buddyControllerDone:self];
}

- (OS_dispatch_source)discoveryTimer
{
  return self->_discoveryTimer;
}

- (void)setDiscoveryTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end