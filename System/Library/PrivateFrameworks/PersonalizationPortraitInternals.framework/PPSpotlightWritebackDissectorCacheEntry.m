@interface PPSpotlightWritebackDissectorCacheEntry
- (NSDate)cachingDate;
- (PPSpotlightWritebackDissectorCacheEntry)initWithCachingDate:(id)a3 score:(double)a4;
- (double)score;
@end

@implementation PPSpotlightWritebackDissectorCacheEntry

- (void).cxx_destruct
{
}

- (double)score
{
  return self->_score;
}

- (NSDate)cachingDate
{
  return self->_cachingDate;
}

- (PPSpotlightWritebackDissectorCacheEntry)initWithCachingDate:(id)a3 score:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PPSpotlightWritebackDissectorCacheEntry;
  v8 = [(PPSpotlightWritebackDissectorCacheEntry *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_cachingDate, a3);
    v9->_score = a4;
  }

  return v9;
}

@end