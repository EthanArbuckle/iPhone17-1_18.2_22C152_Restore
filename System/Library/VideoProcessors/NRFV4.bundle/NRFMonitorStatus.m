@interface NRFMonitorStatus
+ (BOOL)isActive;
+ (void)setActive;
@end

@implementation NRFMonitorStatus

+ (void)setActive
{
  _isActive = 1;
}

+ (BOOL)isActive
{
  return _isActive;
}

@end