@interface PSDClientConnection
- (void)startSyncWithOptions:(id)a3;
@end

@implementation PSDClientConnection

- (void)startSyncWithOptions:(id)a3
{
  id v3 = a3;
  id v4 = +[PSDSyncInitiator sharedSyncInitiator];
  [v4 startExternalSyncWithOptions:v3];
}

@end