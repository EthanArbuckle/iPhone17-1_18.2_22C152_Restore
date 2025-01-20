@interface WFDebugUtilities
+ (void)setupDebuggingForWindow:(id)a3;
+ (void)startLogStream;
- (WFDebugUtilities)init;
@end

@implementation WFDebugUtilities

+ (void)startLogStream
{
}

+ (void)setupDebuggingForWindow:(id)a3
{
  id v3 = a3;
  sub_10002C91C(v3);
}

- (WFDebugUtilities)init
{
  return (WFDebugUtilities *)sub_100045B98();
}

@end