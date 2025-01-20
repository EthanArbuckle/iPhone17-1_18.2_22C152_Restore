@interface BKSnapshotViewController
- (BKSnapshotViewController)initWithViewController:(id)a3;
- (BOOL)shouldAutorotate;
- (UIView)snapshotView;
- (int64_t)preferredStatusBarStyle;
- (int64_t)statusBarStyle;
- (void)didReceiveMemoryWarning;
- (void)loadView;
- (void)setSnapshotView:(id)a3;
- (void)setStatusBarStyle:(int64_t)a3;
- (void)viewDidLoad;
@end

@implementation BKSnapshotViewController

- (BKSnapshotViewController)initWithViewController:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BKSnapshotViewController;
  v5 = [(BKSnapshotViewController *)&v10 init];
  if (v5)
  {
    v6 = [v4 viewIfLoaded];
    uint64_t v7 = [v6 snapshotViewAfterScreenUpdates:0];
    snapshotView = v5->_snapshotView;
    v5->_snapshotView = (UIView *)v7;

    v5->_statusBarStyle = (int64_t)[v4 preferredStatusBarStyle];
  }

  return v5;
}

- (void)loadView
{
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)BKSnapshotViewController;
  [(BKSnapshotViewController *)&v2 viewDidLoad];
}

- (int64_t)preferredStatusBarStyle
{
  return [(BKSnapshotViewController *)self statusBarStyle];
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)BKSnapshotViewController;
  [(BKSnapshotViewController *)&v2 didReceiveMemoryWarning];
}

- (UIView)snapshotView
{
  return self->_snapshotView;
}

- (void)setSnapshotView:(id)a3
{
}

- (int64_t)statusBarStyle
{
  return self->_statusBarStyle;
}

- (void)setStatusBarStyle:(int64_t)a3
{
  self->_statusBarStyle = a3;
}

- (void).cxx_destruct
{
}

@end