@interface WorkspaceDownloadObserverClient
- (BOOL)canAccessDownload:(id)a3;
- (BOOL)hasEntitlements;
@end

@implementation WorkspaceDownloadObserverClient

- (BOOL)hasEntitlements
{
  return 1;
}

- (BOOL)canAccessDownload:(id)a3
{
  return 1;
}

@end