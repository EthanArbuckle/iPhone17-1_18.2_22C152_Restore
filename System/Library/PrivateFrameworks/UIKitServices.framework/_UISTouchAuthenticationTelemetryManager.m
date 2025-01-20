@interface _UISTouchAuthenticationTelemetryManager
- (_UISTouchAuthenticationTelemetryManager)initWithQueue:(id)a3;
- (void)enqueueRecordForAnalytics:(id)a3;
@end

@implementation _UISTouchAuthenticationTelemetryManager

- (_UISTouchAuthenticationTelemetryManager)initWithQueue:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UISTouchAuthenticationTelemetryManager;
  return [(_UISTouchAuthenticationTelemetryManager *)&v4 init];
}

- (void)enqueueRecordForAnalytics:(id)a3
{
}

@end