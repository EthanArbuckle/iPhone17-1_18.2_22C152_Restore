@interface COSSetupPageViewController
- (COSBuddyControllerDelegate)delegate;
- (COSSetupPageViewController)init;
- (NSUserActivity)tapToRadarActivity;
- (id)tapToRadarMetadata;
- (id)titleLabel;
- (void)_endTapToRadarActivity;
- (void)_startTapToRadarActivity;
- (void)openTapToRadar;
- (void)setDelegate:(id)a3;
- (void)setTapToRadarActivity:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation COSSetupPageViewController

- (COSSetupPageViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)COSSetupPageViewController;
  return [(COSSetupPageViewController *)&v3 initWithTitle:&stru_100249230 detailText:0 symbolName:0 adoptTableViewScrollView:0];
}

- (id)titleLabel
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_100015E1C;
  v11 = sub_100015D8C;
  id v12 = 0;
  v2 = [(COSSetupPageViewController *)self headerView];
  objc_super v3 = [v2 subviews];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001133C4;
  v6[3] = &unk_1002477D0;
  v6[4] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)COSSetupPageViewController;
  [(COSSetupPageViewController *)&v4 viewDidAppear:a3];
  [(COSSetupPageViewController *)self _startTapToRadarActivity];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)COSSetupPageViewController;
  [(COSSetupPageViewController *)&v4 viewWillDisappear:a3];
  [(COSSetupPageViewController *)self _endTapToRadarActivity];
}

- (id)tapToRadarMetadata
{
  id v2 = [objc_alloc((Class)BPSTTRMetadata) initWithComponent:0];

  return v2;
}

- (void)openTapToRadar
{
  uint64_t v2 = [(COSSetupPageViewController *)self tapToRadarMetadata];
  id v3 = (id)v2;
  if (v2) {
    +[BPSTapToRadarCoordinator openTapToRadarWithInitialMetadata:v2];
  }
  else {
    NSLog(@"Error!! Could not retrieve metadata for tap to radar!");
  }
}

- (void)_startTapToRadarActivity
{
  if (PBIsInternalInstall())
  {
    id v3 = [(COSSetupPageViewController *)self tapToRadarMetadata];

    if (v3)
    {
      objc_super v4 = [(COSSetupPageViewController *)self tapToRadarMetadata];
      v5 = +[BPSTapToRadarCoordinator tapToRadarUserActivityWithInitialMetadata:v4];
      tapToRadarActivity = self->_tapToRadarActivity;
      self->_tapToRadarActivity = v5;

      uint64_t v7 = self->_tapToRadarActivity;
      if (v7)
      {
        [(NSUserActivity *)v7 becomeCurrent];
      }
      else
      {
        NSLog(@"Error: We're eligible to raise a TTR NSUserActivity but it could not be generated, so we're aborting.");
      }
    }
  }
}

- (void)_endTapToRadarActivity
{
  tapToRadarActivity = self->_tapToRadarActivity;
  if (tapToRadarActivity)
  {
    [(NSUserActivity *)tapToRadarActivity invalidate];
    objc_super v4 = self->_tapToRadarActivity;
    self->_tapToRadarActivity = 0;
  }
}

- (COSBuddyControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (COSBuddyControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSUserActivity)tapToRadarActivity
{
  return self->_tapToRadarActivity;
}

- (void)setTapToRadarActivity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapToRadarActivity, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end