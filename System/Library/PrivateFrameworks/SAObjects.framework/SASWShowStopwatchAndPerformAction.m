@interface SASWShowStopwatchAndPerformAction
+ (id)showStopwatchAndPerformAction;
- (NSString)stopwatchAction;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setStopwatchAction:(id)a3;
@end

@implementation SASWShowStopwatchAndPerformAction

- (id)groupIdentifier
{
  return @"com.apple.ace.stopwatch";
}

- (id)encodedClassName
{
  return @"ShowStopwatchAndPerformAction";
}

+ (id)showStopwatchAndPerformAction
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)stopwatchAction
{
  return (NSString *)[(AceObject *)self propertyForKey:@"stopwatchAction"];
}

- (void)setStopwatchAction:(id)a3
{
}

@end