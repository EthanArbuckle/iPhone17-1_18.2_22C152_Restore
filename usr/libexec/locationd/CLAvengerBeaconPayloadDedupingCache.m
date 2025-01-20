@interface CLAvengerBeaconPayloadDedupingCache
- (BOOL)isNewPayload:(id)a3;
- (CLAvengerBeaconPayloadDedupingCache)init;
- (NSMutableArray)beaconPayloadCache;
- (void)appendPayload:(id)a3;
- (void)dealloc;
- (void)pruneCache;
- (void)pruneCacheWithSize:(int64_t)a3;
- (void)removeAllObjects;
- (void)setBeaconPayloadCache:(id)a3;
@end

@implementation CLAvengerBeaconPayloadDedupingCache

- (CLAvengerBeaconPayloadDedupingCache)init
{
  v4.receiver = self;
  v4.super_class = (Class)CLAvengerBeaconPayloadDedupingCache;
  v2 = [(CLAvengerBeaconPayloadDedupingCache *)&v4 init];
  if (v2) {
    v2->_beaconPayloadCache = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLAvengerBeaconPayloadDedupingCache;
  [(CLAvengerBeaconPayloadDedupingCache *)&v3 dealloc];
}

- (BOOL)isNewPayload:(id)a3
{
  [(CLAvengerBeaconPayloadDedupingCache *)self pruneCache];
  if ([(NSMutableArray *)self->_beaconPayloadCache count])
  {
    id v5 = [(NSMutableArray *)self->_beaconPayloadCache reverseObjectEnumerator];
    while (1)
    {
      id v6 = [v5 nextObject];
      if (!v6) {
        break;
      }
      if ([a3 isEqualToPayload:v6]) {
        return 0;
      }
    }
  }
  [(CLAvengerBeaconPayloadDedupingCache *)self appendPayload:a3];
  return 1;
}

- (void)appendPayload:(id)a3
{
}

- (void)pruneCache
{
  [+[NSDate now] timeIntervalSinceReferenceDate];
  uint64_t v4 = v3;
  id v5 = objc_alloc_init((Class)NSMutableIndexSet);
  beaconPayloadCache = self->_beaconPayloadCache;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1011429B0;
  v7[3] = &unk_102313C20;
  v7[5] = v4;
  v7[4] = v5;
  [(NSMutableArray *)beaconPayloadCache enumerateObjectsUsingBlock:v7];
  [(NSMutableArray *)self->_beaconPayloadCache removeObjectsAtIndexes:v5];
}

- (void)pruneCacheWithSize:(int64_t)a3
{
  for (i = self->_beaconPayloadCache;
        (unint64_t)[(NSMutableArray *)i count] > a3;
        i = self->_beaconPayloadCache)
  {
    [(NSMutableArray *)self->_beaconPayloadCache removeObjectAtIndex:0];
  }
}

- (void)removeAllObjects
{
}

- (NSMutableArray)beaconPayloadCache
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setBeaconPayloadCache:(id)a3
{
}

@end