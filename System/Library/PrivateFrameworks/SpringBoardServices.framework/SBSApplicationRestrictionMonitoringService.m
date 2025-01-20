@interface SBSApplicationRestrictionMonitoringService
+ (id)registerMonitor:(id)a3;
@end

@implementation SBSApplicationRestrictionMonitoringService

+ (id)registerMonitor:(id)a3
{
  id v3 = a3;
  v4 = -[SBSApplicationRestrictionMonitorProxy initWithMonitor:]((id *)[SBSApplicationRestrictionMonitorProxy alloc], v3);

  return v4;
}

@end