@interface CLAppMonitorAppObserver
- (CLAppMonitorAppObserver)initWithAppMonitorProxy:(id)a3;
- (CLAppMonitorProtocol)appMonitor;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)dealloc;
- (void)setAppMonitor:(id)a3;
@end

@implementation CLAppMonitorAppObserver

- (CLAppMonitorAppObserver)initWithAppMonitorProxy:(id)a3
{
  if (!a3) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)CLAppMonitorAppObserver;
  v4 = [(CLAppMonitorAppObserver *)&v6 init];
  if (v4) {
    v4->_appMonitor = (CLAppMonitorProtocol *)a3;
  }
  return v4;
}

- (void)applicationsDidInstall:(id)a3
{
}

- (void)applicationsDidUninstall:(id)a3
{
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
}

- (void)dealloc
{
  self->_appMonitor = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLAppMonitorAppObserver;
  [(CLAppMonitorAppObserver *)&v3 dealloc];
}

- (CLAppMonitorProtocol)appMonitor
{
  return self->_appMonitor;
}

- (void)setAppMonitor:(id)a3
{
  self->_appMonitor = (CLAppMonitorProtocol *)a3;
}

@end