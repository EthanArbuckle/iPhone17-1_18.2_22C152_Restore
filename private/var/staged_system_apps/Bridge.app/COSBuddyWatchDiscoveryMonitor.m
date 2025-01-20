@interface COSBuddyWatchDiscoveryMonitor
- (COSBuddyWatchDiscoveryMonitor)initWithPresentingViewController:(id)a3;
- (COSBuddyWatchDiscoveryMonitorDelegate)delegate;
- (COSScanWatchDynamicHelpViewController)dynamicHelpViewController;
- (COSWatchDiscoveryCoordinator)discoveryCoordinator;
- (NSTimer)discoveryTimeoutTimer;
- (UIViewController)presentingViewController;
- (void)discoverWatchesOrShowSpinner;
- (void)discoveredWatchNearby:(id)a3;
- (void)discoveryDidTimeout;
- (void)dynamicHelpControllerDidDisappear:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDiscoveryCoordinator:(id)a3;
- (void)setDiscoveryTimeoutTimer:(id)a3;
- (void)setDynamicHelpViewController:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)startDiscoveryCoordinator;
@end

@implementation COSBuddyWatchDiscoveryMonitor

- (COSBuddyWatchDiscoveryMonitor)initWithPresentingViewController:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)COSBuddyWatchDiscoveryMonitor;
  v5 = [(COSBuddyWatchDiscoveryMonitor *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_presentingViewController, v4);
    v7 = objc_alloc_init(COSWatchDiscoveryCoordinator);
    discoveryCoordinator = v6->_discoveryCoordinator;
    v6->_discoveryCoordinator = v7;

    [(COSWatchDiscoveryCoordinator *)v6->_discoveryCoordinator setDelegate:v6];
  }

  return v6;
}

- (void)startDiscoveryCoordinator
{
}

- (void)discoveryDidTimeout
{
  v3 = pbb_setupflow_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Timeout trying to Discover watch.  Stopping discovering, showing error.", v8, 2u);
  }

  [(NSTimer *)self->_discoveryTimeoutTimer invalidate];
  discoveryTimeoutTimer = self->_discoveryTimeoutTimer;
  self->_discoveryTimeoutTimer = 0;

  [(COSWatchDiscoveryCoordinator *)self->_discoveryCoordinator stopDiscoveringWatchNearby];
  v5 = objc_alloc_init(COSWatchDiscoveryTimeoutError);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  v7 = [WeakRetained navigationController];
  [v7 pushViewController:v5 animated:1];
}

- (void)discoveredWatchNearby:(id)a3
{
  id v4 = a3;
  [(NSTimer *)self->_discoveryTimeoutTimer invalidate];
  discoveryTimeoutTimer = self->_discoveryTimeoutTimer;
  self->_discoveryTimeoutTimer = 0;

  if (self->_dynamicHelpViewController)
  {
    v6 = pbb_setupflow_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Watch discovered nearby.  Dismissing help controller", v8, 2u);
    }

    [v4 stopDiscoveringWatchNearby];
    v7 = [(COSBuddyWatchDiscoveryMonitor *)self delegate];
    [v7 discoveryOperationComplete];
  }
  [(COSWatchDiscoveryCoordinator *)self->_discoveryCoordinator stopDiscoveringWatchNearby];
}

- (void)dynamicHelpControllerDidDisappear:(id)a3
{
  [(NSTimer *)self->_discoveryTimeoutTimer invalidate];
  discoveryTimeoutTimer = self->_discoveryTimeoutTimer;
  self->_discoveryTimeoutTimer = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  v6 = [WeakRetained navigationController];
  v7 = [v6 viewControllers];
  id v11 = [v7 mutableCopy];

  if ([v11 containsObject:self->_dynamicHelpViewController])
  {
    [v11 removeObjectIdenticalTo:self->_dynamicHelpViewController];
    id v8 = objc_loadWeakRetained((id *)&self->_presentingViewController);
    v9 = [v8 navigationController];
    [v9 setViewControllers:v11 animated:0];
  }
  dynamicHelpViewController = self->_dynamicHelpViewController;
  self->_dynamicHelpViewController = 0;
}

- (void)discoverWatchesOrShowSpinner
{
  if ([(COSWatchDiscoveryCoordinator *)self->_discoveryCoordinator discoveredWatchNearby])
  {
    id v10 = [(COSBuddyWatchDiscoveryMonitor *)self delegate];
    [v10 discoveryOperationComplete];
  }
  else
  {
    dynamicHelpViewController = self->_dynamicHelpViewController;
    if (!dynamicHelpViewController)
    {
      id v4 = objc_alloc_init(COSScanWatchDynamicHelpViewController);
      v5 = self->_dynamicHelpViewController;
      self->_dynamicHelpViewController = v4;

      dynamicHelpViewController = self->_dynamicHelpViewController;
    }
    [(COSScanWatchDynamicHelpViewController *)dynamicHelpViewController setScanDelegate:self];
    [(COSScanWatchDynamicHelpViewController *)self->_dynamicHelpViewController setDiscoveredWatchNearby:[(COSWatchDiscoveryCoordinator *)self->_discoveryCoordinator discoveredWatchNearby]];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
    v7 = [WeakRetained navigationController];
    [v7 pushViewController:self->_dynamicHelpViewController animated:1];

    id v8 = +[NSTimer timerWithTimeInterval:self target:"discoveryDidTimeout" selector:0 userInfo:0 repeats:60.0];
    discoveryTimeoutTimer = self->_discoveryTimeoutTimer;
    self->_discoveryTimeoutTimer = v8;

    id v10 = +[NSRunLoop currentRunLoop];
    [v10 addTimer:self->_discoveryTimeoutTimer forMode:NSRunLoopCommonModes];
  }
}

- (COSBuddyWatchDiscoveryMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (COSBuddyWatchDiscoveryMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (COSScanWatchDynamicHelpViewController)dynamicHelpViewController
{
  return self->_dynamicHelpViewController;
}

- (void)setDynamicHelpViewController:(id)a3
{
}

- (COSWatchDiscoveryCoordinator)discoveryCoordinator
{
  return self->_discoveryCoordinator;
}

- (void)setDiscoveryCoordinator:(id)a3
{
}

- (NSTimer)discoveryTimeoutTimer
{
  return self->_discoveryTimeoutTimer;
}

- (void)setDiscoveryTimeoutTimer:(id)a3
{
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_discoveryTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_discoveryCoordinator, 0);
  objc_storeStrong((id *)&self->_dynamicHelpViewController, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end