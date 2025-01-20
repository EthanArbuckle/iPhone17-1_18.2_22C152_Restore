@interface MTStoreInfoUpdater
+ (id)sharedInstance;
- (BOOL)updateAdamId:(id)a3 forEpisode:(id)a4;
- (MTStoreInfoUpdater)init;
- (NSOperationQueue)updateOperationQueue;
- (id)_fetchRequestForEpisodesWithMissingAdamIdsForPodcastUuid:(id)a3;
- (id)episodesWithMissingAdamIdsForPodcast:(id)a3 withContext:(id)a4;
- (void)getStoreInfoForEpisodesWithAdamIds:(id)a3 callback:(id)a4;
- (void)getStoreInfoForPodcastWithAdamId:(int64_t)a3 callback:(id)a4;
- (void)setUpdateOperationQueue:(id)a3;
- (void)updateStoreInfoForEpisodesAndPodcast:(id)a3 skipPodcastLastCheckDate:(BOOL)a4;
- (void)updateStoreInfoForEpisodesInPodcast:(id)a3 withEpisodeIds:(id)a4 andEpisodesWithGuid:(id)a5;
- (void)updateStoreInfoForPodcast:(id)a3;
@end

@implementation MTStoreInfoUpdater

- (MTStoreInfoUpdater)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTStoreInfoUpdater;
  v2 = [(MTStoreInfoUpdater *)&v6 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)NSOperationQueue);
    [(MTStoreInfoUpdater *)v2 setUpdateOperationQueue:v3];

    v4 = [(MTStoreInfoUpdater *)v2 updateOperationQueue];
    [v4 setMaxConcurrentOperationCount:1];
  }
  return v2;
}

- (NSOperationQueue)updateOperationQueue
{
  return self->_updateOperationQueue;
}

- (void)setUpdateOperationQueue:(id)a3
{
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000593A8;
  block[3] = &unk_10054D910;
  block[4] = a1;
  if (qword_10060A988 != -1) {
    dispatch_once(&qword_10060A988, block);
  }
  v2 = (void *)qword_10060A980;

  return v2;
}

- (void)updateStoreInfoForPodcast:(id)a3
{
  id v4 = a3;
  v5 = [(MTStoreInfoUpdater *)self updateOperationQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100162BBC;
  v7[3] = &unk_10054D9B0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  [v5 addOperationWithBlock:v7];
}

- (void)updateStoreInfoForEpisodesAndPodcast:(id)a3 skipPodcastLastCheckDate:(BOOL)a4
{
  id v6 = a3;
  v7 = +[MTDB sharedInstance];
  id v8 = [v7 importContext];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100162F48;
  v11[3] = &unk_10054EAB0;
  id v12 = v8;
  id v13 = v6;
  BOOL v15 = a4;
  v14 = self;
  id v9 = v6;
  id v10 = v8;
  [v10 performBlockAndWait:v11];
}

- (void)updateStoreInfoForEpisodesInPodcast:(id)a3 withEpisodeIds:(id)a4 andEpisodesWithGuid:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[MTDB sharedInstance];
  id v12 = [v11 importContext];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100163548;
  v17[3] = &unk_10054FE58;
  id v18 = v12;
  id v19 = v8;
  v20 = self;
  id v21 = v10;
  id v22 = v9;
  id v13 = v9;
  id v14 = v10;
  id v15 = v8;
  id v16 = v12;
  [v16 performBlockAndWait:v17];
}

- (BOOL)updateAdamId:(id)a3 forEpisode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5
    && (uint64_t)[v5 longLongValue] >= 1
    && (id v7 = [v5 longLongValue], objc_msgSend(v6, "storeTrackId") != v7))
  {
    id v10 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [v6 title];
      int v12 = 134218242;
      id v13 = v7;
      __int16 v14 = 2112;
      id v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Updating store track id %lld for episode %@", (uint8_t *)&v12, 0x16u);
    }
    [v6 setStoreTrackId:v7];
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)_fetchRequestForEpisodesWithMissingAdamIdsForPodcastUuid:(id)a3
{
  uint64_t v3 = kMTEpisodeEntityName;
  id v4 = a3;
  id v5 = +[NSFetchRequest fetchRequestWithEntityName:v3];
  [v5 setReturnsObjectsAsFaults:0];
  [v5 setFetchBatchSize:200];
  id v6 = +[MTEpisode predicateForAllEpisodesOnPodcastUuid:v4 includeNonAudioEpisodes:1];

  uint64_t v7 = kEpisodeStoreTrackId;
  BOOL v8 = +[NSNumber numberWithLongLong:kMTSerpentAdamIdOffset];
  id v9 = +[NSPredicate predicateWithFormat:@"(%K = 0 OR %K = %@)", v7, v7, v8];
  id v10 = [v6 AND:v9];

  [v5 setPredicate:v10];

  return v5;
}

- (id)episodesWithMissingAdamIdsForPodcast:(id)a3 withContext:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(MTStoreInfoUpdater *)self _fetchRequestForEpisodesWithMissingAdamIdsForPodcastUuid:a3];
  id v12 = 0;
  BOOL v8 = [v6 executeFetchRequest:v7 error:&v12];

  id v9 = v12;
  if (v9)
  {
    id v10 = +[IMLogCategory defaultCategory];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to fetch episodes for store info update - %@", buf, 0xCu);
    }
  }

  return v8;
}

- (void)getStoreInfoForPodcastWithAdamId:(int64_t)a3 callback:(id)a4
{
  id v5 = a4;
  id v6 = +[NSNumber numberWithLongLong:a3];
  id v7 = objc_alloc((Class)IMContentLookupService);
  BOOL v8 = [v6 stringValue];
  id v16 = v8;
  id v9 = +[NSArray arrayWithObjects:&v16 count:1];
  id v10 = [v7 initWithIds:v9];

  [v10 setProfile:kProductProfile];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100164064;
  v13[3] = &unk_100553408;
  id v14 = v6;
  id v15 = v5;
  id v11 = v5;
  id v12 = v6;
  [v10 request:v13];
}

- (void)getStoreInfoForEpisodesWithAdamIds:(id)a3 callback:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)IMContentLookupService) initWithIds:v5];
  [v7 setProfile:kMTStoreLookupPodcastProductProfile];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001645AC;
  v10[3] = &unk_100553408;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 request:v10];
}

- (void).cxx_destruct
{
}

@end