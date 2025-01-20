@interface SPFinderInterface
- (SPAdvertisementCache)advertisementCache;
- (id)beaconPayloadCache;
- (id)finderStateManager;
- (id)stateManager;
- (void)setAdvertisementCache:(id)a3;
@end

@implementation SPFinderInterface

- (SPAdvertisementCache)advertisementCache
{
  advertisementCache = self->_advertisementCache;
  if (!advertisementCache)
  {
    v4 = (SPAdvertisementCache *)objc_opt_new();
    v5 = self->_advertisementCache;
    self->_advertisementCache = v4;

    advertisementCache = self->_advertisementCache;
  }
  return advertisementCache;
}

- (id)beaconPayloadCache
{
  advertisementCache = self->_advertisementCache;
  if (!advertisementCache)
  {
    v4 = (SPAdvertisementCache *)objc_opt_new();
    v5 = self->_advertisementCache;
    self->_advertisementCache = v4;

    advertisementCache = self->_advertisementCache;
  }
  return advertisementCache;
}

- (id)finderStateManager
{
  v2 = objc_opt_new();
  return v2;
}

- (id)stateManager
{
  v2 = objc_opt_new();
  return v2;
}

- (void)setAdvertisementCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end