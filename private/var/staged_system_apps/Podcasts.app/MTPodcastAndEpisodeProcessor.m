@interface MTPodcastAndEpisodeProcessor
- (MTPodcastAndEpisodeProcessor)init;
- (NSMutableDictionary)episodeObservers;
- (id)createEpisodeObserverForPodcastUuid:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5;
- (id)entityName;
- (id)episodeObserverForPodcastUuid:(id)a3;
- (id)episodePredicateForPodcast:(id)a3;
- (id)episodeSortDescriptorsForPodcast:(id)a3;
- (id)episodeUuids;
- (id)podcastPredicate;
- (id)podcastUuids;
- (id)predicate;
- (void)addEpisodeObserverForPodcast:(id)a3;
- (void)episodeUuidObserver:(id)a3 resultsChangedForPodcast:(id)a4 withDeletedIds:(id)a5 andInsertIds:(id)a6;
- (void)removeEpisodeObserverForPodcast:(id)a3;
- (void)removeEpisodeObserverForPodcasts:(id)a3;
- (void)resultsChangedWithDeletedIds:(id)a3 insertIds:(id)a4 updatedIds:(id)a5;
- (void)setEpisodeObservers:(id)a3;
- (void)stop;
- (void)updateEpisodeObserverForPodcast:(id)a3;
- (void)updateEpisodePredicatesWithDeletedIds:(id)a3 andInsertIds:(id)a4 andUpdatedIds:(id)a5;
@end

@implementation MTPodcastAndEpisodeProcessor

- (MTPodcastAndEpisodeProcessor)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTPodcastAndEpisodeProcessor;
  v2 = [(MTBaseProcessor *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    episodeObservers = v2->_episodeObservers;
    v2->_episodeObservers = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)stop
{
  v5.receiver = self;
  v5.super_class = (Class)MTPodcastAndEpisodeProcessor;
  [(MTBaseProcessor *)&v5 stop];
  uint64_t v3 = [(MTPodcastAndEpisodeProcessor *)self episodeObservers];
  v4 = [v3 allValues];
  [v4 enumerateObjectsUsingBlock:&stru_100551688];
}

- (id)entityName
{
  return kMTPodcastEntityName;
}

- (id)predicate
{
  return [(MTPodcastAndEpisodeProcessor *)self podcastPredicate];
}

- (id)podcastPredicate
{
  id v2 = +[NSException exceptionWithName:NSGenericException reason:@"podcastPredicate must be implemented by subclasses" userInfo:0];
  objc_exception_throw(v2);
}

- (id)episodePredicateForPodcast:(id)a3
{
  id v3 = a3;
  id v4 = +[NSException exceptionWithName:NSGenericException reason:@"episodePredicateForPodcast must be implemented by subclasses" userInfo:0];
  objc_exception_throw(v4);
}

- (id)episodeSortDescriptorsForPodcast:(id)a3
{
  return &__NSArray0__struct;
}

- (void)resultsChangedWithDeletedIds:(id)a3 insertIds:(id)a4 updatedIds:(id)a5
{
}

- (void)updateEpisodePredicatesWithDeletedIds:(id)a3 andInsertIds:(id)a4 andUpdatedIds:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000FE204;
  v14[3] = &unk_100550DE0;
  objc_copyWeak(&v18, &location);
  id v11 = v8;
  id v15 = v11;
  id v12 = v10;
  id v16 = v12;
  id v13 = v9;
  id v17 = v13;
  [(MTBaseProcessor *)self enqueueWorkBlock:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)addEpisodeObserverForPodcast:(id)a3
{
  id v10 = a3;
  objc_super v5 = [(MTPodcastAndEpisodeProcessor *)self episodePredicateForPodcast:v10];
  if (!v5)
  {
    objc_super v5 = +[NSPredicate falsePredicate];
  }
  objc_super v6 = [(MTPodcastAndEpisodeProcessor *)self episodeSortDescriptorsForPodcast:v10];
  v7 = [(MTPodcastAndEpisodeProcessor *)self createEpisodeObserverForPodcastUuid:v10 predicate:v5 sortDescriptors:v6];
  [v7 setIdentifier:v10];
  id v8 = [(MTPodcastAndEpisodeProcessor *)self episodeObservers];
  objc_sync_enter(v8);
  id v9 = [(MTPodcastAndEpisodeProcessor *)self episodeObservers];
  [v9 setObject:v7 forKeyedSubscript:v10];

  objc_sync_exit(v8);
  [v7 startObserving];
}

- (void)updateEpisodeObserverForPodcast:(id)a3
{
  id v13 = a3;
  objc_super v5 = [(MTPodcastAndEpisodeProcessor *)self episodePredicateForPodcast:v13];
  if (!v5)
  {
    objc_super v5 = +[NSPredicate falsePredicate];
  }
  objc_super v6 = [(MTPodcastAndEpisodeProcessor *)self episodeObserverForPodcastUuid:v13];
  v7 = v6;
  if (!v6) {
    goto LABEL_7;
  }
  id v8 = [v6 predicate];
  id v9 = v8;
  if (!v8 || ([v8 isEqual:v5] & 1) == 0)
  {
    [v7 stop];

LABEL_7:
    id v9 = [(MTPodcastAndEpisodeProcessor *)self episodeSortDescriptorsForPodcast:v13];
    id v10 = [(MTPodcastAndEpisodeProcessor *)self createEpisodeObserverForPodcastUuid:v13 predicate:v5 sortDescriptors:v9];
    [v10 setIdentifier:v13];
    id v11 = [(MTPodcastAndEpisodeProcessor *)self episodeObservers];
    objc_sync_enter(v11);
    id v12 = [(MTPodcastAndEpisodeProcessor *)self episodeObservers];
    [v12 setObject:v10 forKeyedSubscript:v13];

    objc_sync_exit(v11);
    [v10 startObserving];
  }
}

- (void)removeEpisodeObserverForPodcast:(id)a3
{
  id v7 = a3;
  id v4 = a3;
  objc_super v5 = +[NSArray arrayWithObjects:&v7 count:1];
  objc_super v6 = +[NSSet setWithArray:](NSSet, "setWithArray:", v5, v7);

  [(MTPodcastAndEpisodeProcessor *)self removeEpisodeObserverForPodcasts:v6];
}

- (void)removeEpisodeObserverForPodcasts:(id)a3
{
  id v14 = a3;
  id v4 = [(MTPodcastAndEpisodeProcessor *)self episodeObservers];
  objc_sync_enter(v4);
  if ([v14 count])
  {
    objc_super v5 = objc_opt_new();
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v14;
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v16;
      do
      {
        id v9 = 0;
        do
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v9);
          id v11 = [(MTPodcastAndEpisodeProcessor *)self episodeObservers];
          id v12 = [v11 objectForKeyedSubscript:v10];

          if (v12)
          {
            [v12 stop];
            [v5 addObject:v10];
          }

          id v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }

    id v13 = [(MTPodcastAndEpisodeProcessor *)self episodeObservers];
    [v13 removeObjectsForKeys:v5];
  }
  objc_sync_exit(v4);
}

- (id)createEpisodeObserverForPodcastUuid:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MTUuidQueryObserver alloc];
  id v12 = [(MTUuidQueryObserver *)v11 initWithEntityName:kMTEpisodeEntityName predicate:v9 sortDescriptors:v10];
  objc_initWeak(&location, self);
  objc_initWeak(&from, v12);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000FEA98;
  v16[3] = &unk_1005516D8;
  objc_copyWeak(&v18, &location);
  objc_copyWeak(&v19, &from);
  id v13 = v8;
  id v17 = v13;
  id v14 = [(MTUuidQueryObserver *)v12 addResultsChangedHandler:v16];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v12;
}

- (void)episodeUuidObserver:(id)a3 resultsChangedForPodcast:(id)a4 withDeletedIds:(id)a5 andInsertIds:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = NSStringFromSelector(a2);
  uint64_t v15 = +[NSString stringWithFormat:@"%@ must be implemented by subclasses", v14];

  id v16 = +[NSException exceptionWithName:NSGenericException reason:v15 userInfo:0];
  objc_exception_throw(v16);
}

- (id)episodeObserverForPodcastUuid:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(MTPodcastAndEpisodeProcessor *)self episodeObservers];
  objc_sync_enter(v5);
  id v6 = [(MTPodcastAndEpisodeProcessor *)self episodeObservers];
  id v7 = [v6 objectForKeyedSubscript:v4];

  objc_sync_exit(v5);

  return v7;
}

- (id)podcastUuids
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_10005704C;
  id v9 = sub_1000572F0;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000FEE84;
  v4[3] = &unk_100550B38;
  v4[4] = &v5;
  [(MTBaseProcessor *)self results:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)episodeUuids
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_10005704C;
  id v12 = sub_1000572F0;
  id v13 = objc_alloc_init((Class)NSMutableSet);
  id v3 = [(MTPodcastAndEpisodeProcessor *)self episodeObservers];
  objc_sync_enter(v3);
  id v4 = [(MTPodcastAndEpisodeProcessor *)self episodeObservers];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000FF038;
  v7[3] = &unk_100551700;
  v7[4] = &v8;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];

  objc_sync_exit(v3);
  id v5 = [(id)v9[5] copy];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (NSMutableDictionary)episodeObservers
{
  return self->_episodeObservers;
}

- (void)setEpisodeObservers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end