@interface HKLoadingShareViewController
- (UIActivityIndicatorView)activityIndicatorView;
- (void)finishedLoading;
- (void)setActivityIndicatorView:(id)a3;
- (void)viewDidLoad;
@end

@implementation HKLoadingShareViewController

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)HKLoadingShareViewController;
  [(HKLoadingShareViewController *)&v7 viewDidLoad];
  v3 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
  activityIndicatorView = self->_activityIndicatorView;
  self->_activityIndicatorView = v3;

  [(UIActivityIndicatorView *)self->_activityIndicatorView setHidesWhenStopped:1];
  [(HKLoadingShareViewController *)self setView:self->_activityIndicatorView];
  dispatch_time_t v5 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005DDC;
  block[3] = &unk_100008280;
  block[4] = self;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)finishedLoading
{
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)setActivityIndicatorView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end