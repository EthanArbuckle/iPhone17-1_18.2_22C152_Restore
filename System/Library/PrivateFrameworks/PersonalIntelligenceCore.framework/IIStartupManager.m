@interface IIStartupManager
+ (void)start;
@end

@implementation IIStartupManager

+ (void)start
{
  id v2 = +[IIMetricsDispatcher sharedInstance];
  +[IIMetricsDispatcher registerXPCActivity];
}

@end