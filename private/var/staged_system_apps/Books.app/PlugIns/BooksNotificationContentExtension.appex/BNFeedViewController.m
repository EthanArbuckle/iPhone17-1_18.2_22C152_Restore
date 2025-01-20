@interface BNFeedViewController
- (BNFeedViewControllerDelegate)notificationDelegate;
- (BOOL)runningInExtension;
- (CGSize)_windowSize;
- (void)feedViewController:(id)a3 willTransitionToContentHeight:(double)a4;
- (void)setNotificationDelegate:(id)a3;
@end

@implementation BNFeedViewController

- (BOOL)runningInExtension
{
  return 1;
}

- (void)feedViewController:(id)a3 willTransitionToContentHeight:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)BNFeedViewController;
  -[BNFeedViewController feedViewController:willTransitionToContentHeight:](&v7, "feedViewController:willTransitionToContentHeight:", a3);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100002908;
  v6[3] = &unk_100008490;
  v6[4] = self;
  *(double *)&v6[5] = a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (CGSize)_windowSize
{
  v2 = +[BNJSAWindowProvider sharedInstance];
  v3 = [v2 window];

  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (BNFeedViewControllerDelegate)notificationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_notificationDelegate);

  return (BNFeedViewControllerDelegate *)WeakRetained;
}

- (void)setNotificationDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end