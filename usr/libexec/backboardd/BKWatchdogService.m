@interface BKWatchdogService
- (BKHIDSystemInterface)hidSystem;
- (BKSystemShellSentinel)systemAppSentinel;
- (BKTVOutController)tvOutController;
- (BKWatchdogService)init;
- (BOOL)isAlive;
- (void)registerClientsForMonitoring;
- (void)setHidSystem:(id)a3;
- (void)setSystemAppSentinel:(id)a3;
- (void)setTvOutController:(id)a3;
@end

@implementation BKWatchdogService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tvOutController, 0);
  objc_storeStrong((id *)&self->_hidSystem, 0);

  objc_storeStrong((id *)&self->_systemAppSentinel, 0);
}

- (void)setTvOutController:(id)a3
{
}

- (BKTVOutController)tvOutController
{
  return self->_tvOutController;
}

- (void)setHidSystem:(id)a3
{
}

- (BKHIDSystemInterface)hidSystem
{
  return self->_hidSystem;
}

- (void)setSystemAppSentinel:(id)a3
{
}

- (BKSystemShellSentinel)systemAppSentinel
{
  return self->_systemAppSentinel;
}

- (BOOL)isAlive
{
  return [(BKSystemShellSentinel *)self->_systemAppSentinel collectiveWatchdogPing];
}

- (void)registerClientsForMonitoring
{
  [(BKHIDSystemInterface *)self->_hidSystem registerWatchdog];
  tvOutController = self->_tvOutController;
  if (tvOutController)
  {
    workQueue = tvOutController->_workQueue;
    _wd_endpoint_add_queue(workQueue);
  }
}

- (BKWatchdogService)init
{
  v10.receiver = self;
  v10.super_class = (Class)BKWatchdogService;
  v2 = [(BKWatchdogService *)&v10 init];
  if (v2)
  {
    uint64_t v3 = +[BKSystemShellSentinel sharedInstance];
    systemAppSentinel = v2->_systemAppSentinel;
    v2->_systemAppSentinel = (BKSystemShellSentinel *)v3;

    uint64_t v5 = +[BKHIDSystemInterface sharedInstance];
    hidSystem = v2->_hidSystem;
    v2->_hidSystem = (BKHIDSystemInterface *)v5;

    uint64_t v7 = sub_1000668EC();
    tvOutController = v2->_tvOutController;
    v2->_tvOutController = (BKTVOutController *)v7;
  }
  return v2;
}

@end