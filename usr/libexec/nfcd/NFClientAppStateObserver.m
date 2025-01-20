@interface NFClientAppStateObserver
- (void)dealloc;
@end

@implementation NFClientAppStateObserver

- (void)dealloc
{
  if (sub_10000A018()) {
    [(RBSProcessMonitor *)self->_monitor invalidate];
  }
  v3.receiver = self;
  v3.super_class = (Class)NFClientAppStateObserver;
  [(NFClientAppStateObserver *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connections, 0);

  objc_storeStrong((id *)&self->_monitor, 0);
}

@end