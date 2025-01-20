@interface MLSyncKeepLocalEvaluationResult
- (BOOL)addTrackWithPersistentId:(int64_t)a3 properties:(id)a4 downloadType:(int)a5;
- (MLSyncKeepLocalEvaluationResult)init;
- (NSDictionary)trackProperties;
- (NSError)error;
- (NSOrderedSet)automaticDownloads;
- (NSOrderedSet)manualDownloads;
- (id)getTrackPropertiesForPersistentID:(int64_t)a3;
- (unint64_t)totalSizeOfAutomaticDownloads;
- (unint64_t)totalSizeOfManualDownloads;
- (void)setAutomaticDownloads:(id)a3;
- (void)setError:(id)a3;
- (void)setManualDownloads:(id)a3;
- (void)setTotalSizeOfAutomaticDownloads:(unint64_t)a3;
- (void)setTotalSizeOfManualDownloads:(unint64_t)a3;
- (void)setTrackProperties:(id)a3;
- (void)updateTrackProperties:(id)a3 forPersistendID:(int64_t)a4;
@end

@implementation MLSyncKeepLocalEvaluationResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_trackProperties, 0);
  objc_storeStrong((id *)&self->_manualDownloads, 0);

  objc_storeStrong((id *)&self->_automaticDownloads, 0);
}

- (void)setTotalSizeOfAutomaticDownloads:(unint64_t)a3
{
  self->_totalSizeOfAutomaticDownloads = a3;
}

- (void)setTotalSizeOfManualDownloads:(unint64_t)a3
{
  self->_totalSizeOfManualDownloads = a3;
}

- (void)setTrackProperties:(id)a3
{
}

- (void)setManualDownloads:(id)a3
{
}

- (void)setAutomaticDownloads:(id)a3
{
}

- (unint64_t)totalSizeOfManualDownloads
{
  return self->_totalSizeOfManualDownloads;
}

- (unint64_t)totalSizeOfAutomaticDownloads
{
  return self->_totalSizeOfAutomaticDownloads;
}

- (NSError)error
{
  return self->_error;
}

- (void)updateTrackProperties:(id)a3 forPersistendID:(int64_t)a4
{
  trackProperties = self->_trackProperties;
  id v6 = a3;
  id v7 = +[NSNumber numberWithLongLong:a4];
  [(NSMutableDictionary *)trackProperties setObject:v6 forKey:v7];
}

- (id)getTrackPropertiesForPersistentID:(int64_t)a3
{
  trackProperties = self->_trackProperties;
  v4 = +[NSNumber numberWithLongLong:a3];
  v5 = [(NSMutableDictionary *)trackProperties objectForKey:v4];

  return v5;
}

- (NSDictionary)trackProperties
{
  id v2 = [(NSMutableDictionary *)self->_trackProperties copy];

  return (NSDictionary *)v2;
}

- (NSOrderedSet)manualDownloads
{
  id v2 = [(NSMutableOrderedSet *)self->_manualDownloads copy];

  return (NSOrderedSet *)v2;
}

- (NSOrderedSet)automaticDownloads
{
  id v2 = [(NSMutableOrderedSet *)self->_automaticDownloads copy];

  return (NSOrderedSet *)v2;
}

- (void)setError:(id)a3
{
}

- (BOOL)addTrackWithPersistentId:(int64_t)a3 properties:(id)a4 downloadType:(int)a5
{
  id v8 = a4;
  v9 = +[NSNumber numberWithLongLong:a3];
  v10 = [v8 objectForKey:ML3TrackPropertyTotalSize];
  id v11 = [v10 longLongValue];

  v12 = [(NSMutableDictionary *)self->_trackProperties objectForKey:v9];

  if (!v12)
  {
    [(NSMutableDictionary *)self->_trackProperties setObject:v8 forKey:v9];
    if (a5 == 1)
    {
      uint64_t v13 = 40;
      uint64_t v14 = 16;
      goto LABEL_6;
    }
    if (!a5)
    {
      uint64_t v13 = 56;
      uint64_t v14 = 8;
LABEL_6:
      [*(id *)((char *)&self->super.isa + v14) addObject:v9];
      *(Class *)((char *)&self->super.isa + v13) = (Class)(*(char **)((char *)&self->super.isa + v13)
                                                         + (unint64_t)v11);
    }
  }

  return v12 == 0;
}

- (MLSyncKeepLocalEvaluationResult)init
{
  v10.receiver = self;
  v10.super_class = (Class)MLSyncKeepLocalEvaluationResult;
  id v2 = [(MLSyncKeepLocalEvaluationResult *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    automaticDownloads = v2->_automaticDownloads;
    v2->_automaticDownloads = v3;

    v5 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    manualDownloads = v2->_manualDownloads;
    v2->_manualDownloads = v5;

    uint64_t v7 = +[NSMutableDictionary dictionary];
    trackProperties = v2->_trackProperties;
    v2->_trackProperties = (NSMutableDictionary *)v7;
  }
  return v2;
}

@end