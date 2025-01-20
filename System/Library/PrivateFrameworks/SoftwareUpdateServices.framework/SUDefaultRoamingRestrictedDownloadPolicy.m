@interface SUDefaultRoamingRestrictedDownloadPolicy
- (BOOL)isDownloadAllowableForCellularRoaming;
@end

@implementation SUDefaultRoamingRestrictedDownloadPolicy

- (BOOL)isDownloadAllowableForCellularRoaming
{
  return 0;
}

@end