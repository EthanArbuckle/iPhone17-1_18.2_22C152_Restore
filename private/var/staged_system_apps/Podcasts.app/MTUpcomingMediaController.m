@interface MTUpcomingMediaController
- (BOOL)pendingDeferredUpdate;
- (MTCoalescableWorkController)suggestedEpisodesWorkController;
- (MTCoalescableWorkController)suggestedStationsWorkController;
- (MTUpcomingMediaController)init;
- (NSArray)deferredEpisodeUuids;
- (NSArray)episodeIntents;
- (NSArray)stationIntents;
- (void)_setSuggestedEpisodeUuidsImmediately:(id)a3;
- (void)setDeferredEpisodeUuids:(id)a3;
- (void)setEpisodeIntents:(id)a3;
- (void)setIntents:(id)a3;
- (void)setPendingDeferredUpdate:(BOOL)a3;
- (void)setStationIntents:(id)a3;
- (void)setSuggestedEpisodeUuids:(id)a3;
- (void)setSuggestedEpisodesWorkController:(id)a3;
- (void)setSuggestedStationUuids:(id)a3;
- (void)setSuggestedStationsWorkController:(id)a3;
@end

@implementation MTUpcomingMediaController

- (MTUpcomingMediaController)init
{
  v10.receiver = self;
  v10.super_class = (Class)MTUpcomingMediaController;
  v2 = [(MTUpcomingMediaController *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v4 = dispatch_queue_create("MTUpcomingMediaController.upcoming_media_queue", v3);
    v5 = (MTCoalescableWorkController *)[objc_alloc((Class)MTCoalescableWorkController) initWithWorkQueue:v4 identifier:@"MTUpcomingMediaController.setSuggestedEpisodes"];
    suggestedEpisodesWorkController = v2->_suggestedEpisodesWorkController;
    v2->_suggestedEpisodesWorkController = v5;

    v7 = (MTCoalescableWorkController *)[objc_alloc((Class)MTCoalescableWorkController) initWithWorkQueue:v4 identifier:@"MTUpcomingMediaController.setSuggestedStations"];
    suggestedStationsWorkController = v2->_suggestedStationsWorkController;
    v2->_suggestedStationsWorkController = v7;

    v2->_pendingDeferredUpdate = 0;
  }
  return v2;
}

- (void)setSuggestedEpisodeUuids:(id)a3
{
  id v4 = a3;
  [(MTUpcomingMediaController *)self setDeferredEpisodeUuids:v4];
  v5 = _MTLogCategorySiri();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v11 = [v4 count];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Upcoming Media: Deferring update of %lu suggested episode UUIDs", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v6 = self;
  objc_sync_enter(v6);
  if (![(MTUpcomingMediaController *)v6 pendingDeferredUpdate])
  {
    [(MTUpcomingMediaController *)v6 setPendingDeferredUpdate:1];
    dispatch_time_t v7 = dispatch_time(0, 10000000000);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000E3E64;
    v8[3] = &unk_100550DB8;
    v8[4] = v6;
    objc_copyWeak(&v9, (id *)buf);
    dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, v8);
    objc_destroyWeak(&v9);
  }
  objc_sync_exit(v6);

  objc_destroyWeak((id *)buf);
}

- (void)setPendingDeferredUpdate:(BOOL)a3
{
  self->_pendingDeferredUpdate = a3;
}

- (void)setDeferredEpisodeUuids:(id)a3
{
}

- (BOOL)pendingDeferredUpdate
{
  return self->_pendingDeferredUpdate;
}

- (void)_setSuggestedEpisodeUuidsImmediately:(id)a3
{
  id v4 = a3;
  v5 = _MTLogCategorySiri();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v12 = [v4 count];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Upcoming Media: Setting %lu suggested episode UUIDs", buf, 0xCu);
  }

  suggestedEpisodesWorkController = self->_suggestedEpisodesWorkController;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000E4040;
  v8[3] = &unk_10054D9B0;
  id v9 = v4;
  objc_super v10 = self;
  id v7 = v4;
  [(MTCoalescableWorkController *)suggestedEpisodesWorkController schedule:v8];
}

- (void)setSuggestedStationUuids:(id)a3
{
  id v4 = a3;
  suggestedStationsWorkController = self->_suggestedStationsWorkController;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000E4664;
  v7[3] = &unk_10054D9B0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [(MTCoalescableWorkController *)suggestedStationsWorkController schedule:v7];
}

- (void)setStationIntents:(id)a3
{
  id v14 = a3;
  v5 = self;
  objc_sync_enter(v5);
  p_stationIntents = (void **)&v5->_stationIntents;
  objc_storeStrong((id *)&v5->_stationIntents, a3);
  uint64_t v7 = [(MTUpcomingMediaController *)v5 episodeIntents];
  id v8 = (void *)v7;
  if (v7) {
    id v9 = (void *)v7;
  }
  else {
    id v9 = &__NSArray0__struct;
  }
  id v10 = v9;

  id v11 = *p_stationIntents;
  if (!*p_stationIntents) {
    id v11 = &__NSArray0__struct;
  }
  id v12 = v11;
  v13 = [v10 arrayByAddingObjectsFromArray:v12];
  [(MTUpcomingMediaController *)v5 setIntents:v13];

  objc_sync_exit(v5);
}

- (void)setEpisodeIntents:(id)a3
{
  id v13 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_storeStrong((id *)&v5->_episodeIntents, a3);
  episodeIntents = v5->_episodeIntents;
  if (!episodeIntents) {
    episodeIntents = (NSArray *)&__NSArray0__struct;
  }
  uint64_t v7 = episodeIntents;
  uint64_t v8 = [(MTUpcomingMediaController *)v5 stationIntents];
  id v9 = (void *)v8;
  if (v8) {
    id v10 = (void *)v8;
  }
  else {
    id v10 = &__NSArray0__struct;
  }
  id v11 = v10;

  id v12 = [(NSArray *)v7 arrayByAddingObjectsFromArray:v11];
  [(MTUpcomingMediaController *)v5 setIntents:v12];

  objc_sync_exit(v5);
}

- (void)setIntents:(id)a3
{
  id v4 = a3;
  v22 = self;
  objc_sync_enter(v22);
  v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v25;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v8);
        id v10 = [objc_alloc((Class)INShortcut) initWithIntent:v9];
        id v11 = [objc_alloc((Class)INRelevantShortcut) initWithShortcut:v10];
        id v12 = [v9 mediaContainer];
        id v13 = [v12 title];

        id v14 = [v9 keyImage];
        id v15 = [objc_alloc((Class)INDefaultCardTemplate) initWithTitle:v13];
        [v15 setImage:v14];
        [v11 setWatchTemplate:v15];
        [v5 addObject:v11];

        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v6);
  }

  v16 = +[INRelevantShortcutStore defaultStore];
  [v16 setRelevantShortcuts:v5 completionHandler:&stru_100551068];

  v17 = +[NSOrderedSet orderedSetWithArray:obj];
  v18 = +[INUpcomingMediaManager sharedManager];
  [v18 setPredictionMode:1 forType:6];

  v19 = +[INUpcomingMediaManager sharedManager];
  [v19 setPredictionMode:1 forType:7];

  v20 = +[INUpcomingMediaManager sharedManager];
  [v20 setPredictionMode:1 forType:8];

  v21 = +[INUpcomingMediaManager sharedManager];
  [v21 setSuggestedMediaIntents:v17];

  objc_sync_exit(v22);
}

- (MTCoalescableWorkController)suggestedEpisodesWorkController
{
  return self->_suggestedEpisodesWorkController;
}

- (void)setSuggestedEpisodesWorkController:(id)a3
{
}

- (MTCoalescableWorkController)suggestedStationsWorkController
{
  return self->_suggestedStationsWorkController;
}

- (void)setSuggestedStationsWorkController:(id)a3
{
}

- (NSArray)episodeIntents
{
  return self->_episodeIntents;
}

- (NSArray)stationIntents
{
  return self->_stationIntents;
}

- (NSArray)deferredEpisodeUuids
{
  return self->_deferredEpisodeUuids;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredEpisodeUuids, 0);
  objc_storeStrong((id *)&self->_stationIntents, 0);
  objc_storeStrong((id *)&self->_episodeIntents, 0);
  objc_storeStrong((id *)&self->_suggestedStationsWorkController, 0);

  objc_storeStrong((id *)&self->_suggestedEpisodesWorkController, 0);
}

@end