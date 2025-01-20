@interface PPAppLaunchMonitorGuardedData
@end

@implementation PPAppLaunchMonitorGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->clientContext, 0);
  objc_storeStrong((id *)&self->handlers, 0);
}

@end