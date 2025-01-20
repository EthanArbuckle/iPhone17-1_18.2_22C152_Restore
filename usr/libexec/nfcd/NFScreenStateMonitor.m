@interface NFScreenStateMonitor
@end

@implementation NFScreenStateMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fbsConfiguration, 0);
  objc_storeStrong((id *)&self->_fbsMonitor, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end