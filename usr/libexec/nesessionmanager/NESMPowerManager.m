@interface NESMPowerManager
@end

@implementation NESMPowerManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_sleepCompletionHandler, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end