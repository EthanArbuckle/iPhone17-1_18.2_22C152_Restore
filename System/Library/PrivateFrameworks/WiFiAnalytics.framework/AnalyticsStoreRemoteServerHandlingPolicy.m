@interface AnalyticsStoreRemoteServerHandlingPolicy
- (BOOL)shouldAcceptConnectionsFromClientWithContext:(id)a3;
@end

@implementation AnalyticsStoreRemoteServerHandlingPolicy

- (BOOL)shouldAcceptConnectionsFromClientWithContext:(id)a3
{
  return 1;
}

@end