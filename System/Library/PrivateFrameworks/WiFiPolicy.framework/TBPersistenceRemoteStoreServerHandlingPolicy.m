@interface TBPersistenceRemoteStoreServerHandlingPolicy
- (BOOL)shouldAcceptConnectionsFromClientWithContext:(id)a3;
@end

@implementation TBPersistenceRemoteStoreServerHandlingPolicy

- (BOOL)shouldAcceptConnectionsFromClientWithContext:(id)a3
{
  return 1;
}

@end