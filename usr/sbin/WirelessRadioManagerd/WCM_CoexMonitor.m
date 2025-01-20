@interface WCM_CoexMonitor
+ (id)create;
- (WCM_CoexMonitor)init;
- (unint64_t)getCoexBandErrorCountFor:(int)a3;
- (unint64_t)getCoexCountDurationFor:(int)a3;
- (unint64_t)getCoexCountFor:(int)a3;
- (unint64_t)getCoexErrorCountFor:(int)a3;
@end

@implementation WCM_CoexMonitor

- (WCM_CoexMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)WCM_CoexMonitor;
  return [(WCM_CoexMonitor *)&v3 init];
}

- (unint64_t)getCoexCountFor:(int)a3
{
  return 0;
}

- (unint64_t)getCoexCountDurationFor:(int)a3
{
  return 0;
}

- (unint64_t)getCoexErrorCountFor:(int)a3
{
  return 0;
}

- (unint64_t)getCoexBandErrorCountFor:(int)a3
{
  return 0;
}

+ (id)create
{
  return objc_alloc_init(WCM_CoexMonitorIOS);
}

@end