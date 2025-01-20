@interface GKPurgeableCacheObject
- (BOOL)purgeable;
- (void)purge;
@end

@implementation GKPurgeableCacheObject

- (BOOL)purgeable
{
  return 1;
}

- (void)purge
{
  if ([(GKPurgeableCacheObject *)self purgeable])
  {
    id v4 = [(GKPurgeableCacheObject *)self managedObjectContext];
    [v4 deleteObject:self];
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v3 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
      sub_1000FB504();
    }
  }
}

@end