@interface BKEntitlementCachePerProcessEntry
- (BSProcessDeathWatcher)deathWatcher;
- (NSMutableDictionary)entitlementCache;
- (void)setDeathWatcher:(id)a3;
- (void)setEntitlementCache:(id)a3;
@end

@implementation BKEntitlementCachePerProcessEntry

- (NSMutableDictionary)entitlementCache
{
  return self->_entitlementCache;
}

- (void)setEntitlementCache:(id)a3
{
}

- (void)setDeathWatcher:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deathWatcher, 0);

  objc_storeStrong((id *)&self->_entitlementCache, 0);
}

- (BSProcessDeathWatcher)deathWatcher
{
  return self->_deathWatcher;
}

@end