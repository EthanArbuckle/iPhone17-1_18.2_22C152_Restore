@interface NFTouchSensorMonitor
- (void)dealloc;
@end

@implementation NFTouchSensorMonitor

- (void)dealloc
{
  if (self && self->_started) {
    [(HIDEventSystemClient *)self->_eventMonitorClient cancel];
  }
  v3.receiver = self;
  v3.super_class = (Class)NFTouchSensorMonitor;
  [(NFTouchSensorMonitor *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_eventMonitorClient, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end