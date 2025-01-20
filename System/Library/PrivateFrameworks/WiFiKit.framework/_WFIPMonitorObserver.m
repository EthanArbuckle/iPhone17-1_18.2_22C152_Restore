@interface _WFIPMonitorObserver
- (WFIPMonitor)ipMonitor;
- (void)setIpMonitor:(id)a3;
@end

@implementation _WFIPMonitorObserver

- (void)setIpMonitor:(id)a3
{
}

- (WFIPMonitor)ipMonitor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ipMonitor);
  return (WFIPMonitor *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end