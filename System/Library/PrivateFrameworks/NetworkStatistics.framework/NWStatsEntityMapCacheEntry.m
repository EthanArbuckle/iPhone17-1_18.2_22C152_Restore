@interface NWStatsEntityMapCacheEntry
- (NSDate)expiryTime;
- (NSObject)entityName;
- (id)description;
- (void)setEntityName:(id)a3;
- (void)setExpiryTime:(id)a3;
@end

@implementation NWStatsEntityMapCacheEntry

- (NSObject)entityName
{
  return objc_getProperty(self, a2, 16, 1);
}

- (NSDate)expiryTime
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setExpiryTime:(id)a3
{
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(NWStatsEntityMapCacheEntry *)self expiryTime];
  [v4 timeIntervalSince1970];
  uint64_t v6 = v5;
  v7 = [(NWStatsEntityMapCacheEntry *)self entityName];
  v8 = (void *)[v3 initWithFormat:@"CacheEntry expiryTime %f, --> %@", v6, v7];

  return v8;
}

- (void)setEntityName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityName, 0);
  objc_storeStrong((id *)&self->_expiryTime, 0);
}

@end