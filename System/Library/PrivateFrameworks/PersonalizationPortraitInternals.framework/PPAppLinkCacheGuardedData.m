@interface PPAppLinkCacheGuardedData
@end

@implementation PPAppLinkCacheGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableURLToAppID, 0);
  objc_storeStrong((id *)&self->_urlToAppID, 0);
  objc_storeStrong((id *)&self->_enabledAppIDs, 0);
}

@end