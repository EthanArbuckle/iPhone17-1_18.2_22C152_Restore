@interface PPAppLaunchMonitorRegistrationContext
@end

@implementation PPAppLaunchMonitorRegistrationContext

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

@end