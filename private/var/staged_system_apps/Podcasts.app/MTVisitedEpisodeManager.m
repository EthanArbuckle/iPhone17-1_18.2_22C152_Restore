@interface MTVisitedEpisodeManager
- (BOOL)hasEndedVisitingEpisode:(id)a3;
- (MTVisitedEpisodeManager)init;
- (NSMutableSet)endedEpisodeUuids;
- (NSMutableSet)startedEpisodeUuids;
- (unint64_t)countOfEndedEpisodes;
- (unint64_t)countOfStartedEpisodes;
- (void)endVisitingEpisode:(id)a3;
- (void)flushVisitedEpisodes;
- (void)setEndedEpisodeUuids:(id)a3;
- (void)setStartedEpisodeUuids:(id)a3;
- (void)startVisitingEpisode:(id)a3;
@end

@implementation MTVisitedEpisodeManager

- (MTVisitedEpisodeManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTVisitedEpisodeManager;
  v2 = [(MTVisitedEpisodeManager *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)NSMutableSet);
    [(MTVisitedEpisodeManager *)v2 setStartedEpisodeUuids:v3];

    id v4 = objc_alloc_init((Class)NSMutableSet);
    [(MTVisitedEpisodeManager *)v2 setEndedEpisodeUuids:v4];

    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v2 selector:"flushVisitedEpisodes" name:MTApplicationWillResignActiveNotification object:0];
  }
  return v2;
}

- (void)endVisitingEpisode:(id)a3
{
  id v6 = a3;
  if ([v6 isNew])
  {
    id v4 = [(MTVisitedEpisodeManager *)self endedEpisodeUuids];
    v5 = [v6 uuid];
    [v4 addObject:v5];
  }
}

- (void)startVisitingEpisode:(id)a3
{
  id v7 = a3;
  if ([v7 isNew])
  {
    id v4 = [(MTVisitedEpisodeManager *)self startedEpisodeUuids];
    v5 = [v7 uuid];
    [v4 addObject:v5];

    id v6 = +[MTApplication appController];
    [v6 updateUnplayedBadgeCount];
  }
}

- (BOOL)hasEndedVisitingEpisode:(id)a3
{
  id v4 = a3;
  v5 = [(MTVisitedEpisodeManager *)self endedEpisodeUuids];
  id v6 = [v4 uuid];

  LOBYTE(v4) = [v5 containsObject:v6];
  return (char)v4;
}

- (unint64_t)countOfStartedEpisodes
{
  v2 = [(MTVisitedEpisodeManager *)self startedEpisodeUuids];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (unint64_t)countOfEndedEpisodes
{
  v2 = [(MTVisitedEpisodeManager *)self endedEpisodeUuids];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (void)flushVisitedEpisodes
{
  id v3 = [(MTVisitedEpisodeManager *)self startedEpisodeUuids];
  id v4 = [v3 count];

  if (v4)
  {
    v5 = [(MTVisitedEpisodeManager *)self startedEpisodeUuids];
    id v6 = [v5 copy];

    id v7 = +[MTDB sharedInstance];
    v8 = [v7 privateQueueContext];

    v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    v15 = sub_1000F9010;
    v16 = &unk_10054D9B0;
    id v17 = v6;
    id v18 = v8;
    id v9 = v8;
    id v10 = v6;
    [v9 performBlock:&v13];
    v11 = [(MTVisitedEpisodeManager *)self startedEpisodeUuids];
    [v11 removeAllObjects];

    v12 = [(MTVisitedEpisodeManager *)self endedEpisodeUuids];
    [v12 removeAllObjects];
  }
}

- (NSMutableSet)startedEpisodeUuids
{
  return self->_startedEpisodeUuids;
}

- (void)setStartedEpisodeUuids:(id)a3
{
}

- (NSMutableSet)endedEpisodeUuids
{
  return self->_endedEpisodeUuids;
}

- (void)setEndedEpisodeUuids:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endedEpisodeUuids, 0);

  objc_storeStrong((id *)&self->_startedEpisodeUuids, 0);
}

@end