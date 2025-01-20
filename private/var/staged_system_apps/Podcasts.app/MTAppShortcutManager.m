@interface MTAppShortcutManager
- (MTAppShortcutManager)init;
- (OS_dispatch_queue)workQueue;
- (id)_fetchShortcutItems;
- (id)_fetchStationShortcutItems;
- (unint64_t)backgroundTaskIdentifier;
- (unint64_t)shortcutsKind;
- (unint64_t)updateCount;
- (void)_beginBackgroundTask;
- (void)_endBackgroundTask;
- (void)_endBackgroundTask:(BOOL)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performActionForShortcutItem:(id)a3 completionHandler:(id)a4;
- (void)performEpisodeUpdateAction:(id)a3;
- (void)performPlayActionForShortcutItem:(id)a3 completionHandler:(id)a4;
- (void)performSearchAction:(id)a3;
- (void)playerStateChanged:(id)a3;
- (void)setBackgroundTaskIdentifier:(unint64_t)a3;
- (void)setUpdateCount:(unint64_t)a3;
- (void)setWorkQueue:(id)a3;
- (void)startObservingChanges;
- (void)stopObservingChanges;
- (void)updateDockShortcuts;
- (void)updateMacPlaybackShortcutItemsForPlaybackState:(BOOL)a3;
- (void)updateShortcutItems;
- (void)updateSpringboardShortcuts;
@end

@implementation MTAppShortcutManager

- (void)startObservingChanges
{
  id v7 = +[NSNotificationCenter defaultCenter];
  if ((id)[(MTAppShortcutManager *)self shortcutsKind] == (id)1)
  {
    [v7 addObserver:self selector:"updateShortcutItems" name:IMAVPlayerNotification_StateDidChange object:0];
  }
  else
  {
    v3 = +[PodcastsPlayerAdapter sharedInstance];
    if (os_feature_enabled_bluemoon())
    {
      v4 = +[UIApplication sharedPlaybackController];
      v5 = +[MTSharedPlaybackController kIsPlayingKeyPath];
      [v4 addObserver:self forKeyPath:v5 options:3 context:0];
    }
    else
    {
      [v7 addObserver:self selector:"playerStateChanged:" name:IMAVPlayerNotification_StateDidChange object:0];
    }
    v6 = [v3 PlayerNotification_JumpDurationDidChange_String];
    [v7 addObserver:self selector:"updateShortcutItems" name:v6 object:0];
  }
  [v7 addObserver:self selector:"updateShortcutItems" name:@"MTSyncControllerOperationCompleted" object:0];
}

- (MTAppShortcutManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTAppShortcutManager;
  v2 = [(MTAppShortcutManager *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_backgroundTaskIdentifier = UIBackgroundTaskInvalid;
    dispatch_queue_t v4 = dispatch_queue_create("MTAppShortcutManager-updateShortcutItems", 0);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v4;

    [(MTAppShortcutManager *)v3 startObservingChanges];
  }
  return v3;
}

- (unint64_t)shortcutsKind
{
  return 1;
}

- (void)dealloc
{
  [(MTAppShortcutManager *)self stopObservingChanges];
  v3.receiver = self;
  v3.super_class = (Class)MTAppShortcutManager;
  [(MTAppShortcutManager *)&v3 dealloc];
}

- (void)stopObservingChanges
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];
}

- (void)playerStateChanged:(id)a3
{
  dispatch_queue_t v4 = [a3 userInfo];
  id v6 = [v4 objectForKeyedSubscript:IMAVPlayerNotificationKey_NewPlayerState];

  v5 = v6;
  if (v6)
  {
    -[MTAppShortcutManager updateMacPlaybackShortcutItemsForPlaybackState:](self, "updateMacPlaybackShortcutItemsForPlaybackState:", [v6 integerValue] == (id)1);
    v5 = v6;
  }
}

- (void)updateMacPlaybackShortcutItemsForPlaybackState:(BOOL)a3
{
  BOOL v3 = a3;
  id v17 = +[PodcastsPlayerAdapter sharedInstance];
  dispatch_queue_t v4 = +[NSMutableArray array];
  id v5 = objc_alloc((Class)UIApplicationShortcutItem);
  id v6 = +[NSBundle mainBundle];
  objc_super v7 = v6;
  if (v3)
  {
    v8 = [v6 localizedStringForKey:@"EPISODE_ACTION_PAUSE" value:&stru_10056A8A0 table:0];
    id v9 = [v5 initWithType:@"kMTShortcutItemTypePause" localizedTitle:v8];
    [v4 addObject:v9];

    id v10 = objc_alloc((Class)UIApplicationShortcutItem);
    v11 = [v17 localizedStringForSkipForward];
    id v12 = [v10 initWithType:@"kMTShortcutItemTypeSkipForward" localizedTitle:v11];
    [v4 addObject:v12];

    id v13 = objc_alloc((Class)UIApplicationShortcutItem);
    objc_super v7 = [v17 localizedStringForSkipBackwards];
    id v14 = [v13 initWithType:@"kMTShortcutItemTypeSkipBackward" localizedTitle:v7];
    [v4 addObject:v14];
  }
  else
  {
    id v14 = [v6 localizedStringForKey:@"EPISODE_ACTION_PLAY" value:&stru_10056A8A0 table:0];
    id v15 = [v5 initWithType:@"kMTShortcutItemTypePlay" localizedTitle:v14];
    [v4 addObject:v15];
  }
  v16 = +[UIApplication sharedApplication];
  [v16 setShortcutItems:v4];
}

- (void)updateShortcutItems
{
  unint64_t v3 = [(MTAppShortcutManager *)self shortcutsKind];
  if (v3 == 1)
  {
    [(MTAppShortcutManager *)self updateSpringboardShortcuts];
  }
  else if (!v3)
  {
    [(MTAppShortcutManager *)self updateDockShortcuts];
  }
}

- (void)updateDockShortcuts
{
  id v3 = +[PodcastsPlayerAdapter sharedInstance];
  -[MTAppShortcutManager updateMacPlaybackShortcutItemsForPlaybackState:](self, "updateMacPlaybackShortcutItemsForPlaybackState:", [v3 isTargetPlaying]);
}

- (void)updateSpringboardShortcuts
{
  id v3 = +[UIApplication sharedApplication];
  id v4 = [v3 applicationState];

  if (v4 == (id)2)
  {
    [(MTAppShortcutManager *)self _beginBackgroundTask];
    id v5 = [(MTAppShortcutManager *)self workQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000863E0;
    block[3] = &unk_10054D570;
    block[4] = self;
    dispatch_async(v5, block);
  }
}

- (void)performActionForShortcutItem:(id)a3 completionHandler:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  objc_super v7 = +[PodcastsPlayerAdapter sharedInstance];
  v8 = [v22 type];
  unsigned int v9 = [v8 isEqualToString:@"kMTShortcutItemTypeSearchStore"];

  if (v9)
  {
    [(MTAppShortcutManager *)self performSearchAction:v6];
  }
  else
  {
    id v10 = [v22 type];
    unsigned int v11 = [v10 isEqualToString:@"kMTShortcutItemTypeCheckNewEpisodes"];

    if (v11)
    {
      [(MTAppShortcutManager *)self performEpisodeUpdateAction:v6];
    }
    else
    {
      id v12 = [v22 type];
      unsigned int v13 = [v12 isEqualToString:@"kMTShortcutItemTypeStation"];

      if (v13)
      {
        [(MTAppShortcutManager *)self performPlayActionForShortcutItem:v22 completionHandler:v6];
      }
      else
      {
        id v14 = [v22 type];
        unsigned int v15 = [v14 isEqualToString:@"kMTShortcutItemTypePlay"];

        if (v15)
        {
          [v7 playWithCompletion:0];
        }
        else
        {
          v16 = [v22 type];
          unsigned int v17 = [v16 isEqualToString:@"kMTShortcutItemTypePause"];

          if (v17)
          {
            [v7 pauseWithCompletion:0];
          }
          else
          {
            v18 = [v22 type];
            unsigned int v19 = [v18 isEqualToString:@"kMTShortcutItemTypeSkipForward"];

            if (v19)
            {
              [v7 jumpForwardsWithCompletion:0];
            }
            else
            {
              v20 = [v22 type];
              unsigned int v21 = [v20 isEqualToString:@"kMTShortcutItemTypeSkipBackward"];

              if (v21) {
                [v7 jumpBackwardsWithCompletion:0];
              }
            }
          }
        }
      }
    }
  }
}

- (void)performSearchAction:(id)a3
{
  id v3 = (void (**)(id, uint64_t))a3;
  id v5 = +[MTURLResolver searchUrlForSearchText:0];
  id v4 = +[UIApplication sharedApplication];
  [v4 openURL:v5 options:&__NSDictionary0__struct completionHandler:0];

  v3[2](v3, 1);
}

- (void)performEpisodeUpdateAction:(id)a3
{
  id v3 = a3;
  id v4 = +[MTFeedUpdateManager sharedInstance];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100086924;
  v12[3] = &unk_10054ECB8;
  id v5 = v3;
  id v13 = v5;
  [v4 updateAllPodcastsUserInitiated:1 forced:1 source:3 started:v12];

  id v6 = +[MTApplication appController];
  if ([v6 isMyPodcastsTabSelected])
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10008693C;
    v10[3] = &unk_10054D570;
    objc_super v7 = &v11;
    unsigned int v11 = v6;
    [v6 selectMyPodcastsTabAndPopToRoot:1 animated:1 completion:v10];
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100086994;
    v8[3] = &unk_10054D570;
    objc_super v7 = &v9;
    unsigned int v9 = v6;
    [v6 selectUnplayedTabAndPopToRoot:1 animated:1 completion:v8];
  }
}

- (void)performPlayActionForShortcutItem:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_super v7 = [v6 userInfo];
  v8 = [v7 objectForKeyedSubscript:@"stationUuid"];

  unsigned int v9 = [v6 userInfo];

  id v10 = [v9 objectForKeyedSubscript:@"episodeUuid"];

  unsigned int v11 = +[MTPlaybackQueueFactory playStationUuid:v8 episodeUuid:v10];
  if (os_feature_enabled_bluemoon())
  {
    id v12 = +[UIApplication sharedPlaybackController];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100086BD4;
    v17[3] = &unk_10054ECB8;
    id v18 = v5;
    id v13 = v5;
    [v12 playManifest:v11 waitingForEngine:1 completion:v17];
  }
  else
  {
    id v14 = +[MTPlayerController defaultInstance];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100086BF4;
    v15[3] = &unk_10054ECB8;
    id v16 = v5;
    id v12 = v5;
    [v14 playManifest:v11 reason:10 interactive:1 presentationType:2 completion:v15];

    id v13 = v16;
  }
}

- (void)_beginBackgroundTask
{
  v2 = self;
  objc_sync_enter(v2);
  [(MTAppShortcutManager *)v2 setUpdateCount:(char *)[(MTAppShortcutManager *)v2 updateCount] + 1];
  if ([(MTAppShortcutManager *)v2 backgroundTaskIdentifier] == UIBackgroundTaskInvalid)
  {
    id v3 = +[UIApplication sharedApplication];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100086D10;
    v4[3] = &unk_10054D570;
    v4[4] = v2;
    -[MTAppShortcutManager setBackgroundTaskIdentifier:](v2, "setBackgroundTaskIdentifier:", [v3 beginBackgroundTaskWithName:@"MTAppShortcutManager" expirationHandler:v4]);
  }
  objc_sync_exit(v2);
}

- (void)_endBackgroundTask
{
}

- (void)_endBackgroundTask:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  [(MTAppShortcutManager *)obj setUpdateCount:(char *)[(MTAppShortcutManager *)obj updateCount] - 1];
  if ((![(MTAppShortcutManager *)obj updateCount] || v3)
    && [(MTAppShortcutManager *)obj backgroundTaskIdentifier] != UIBackgroundTaskInvalid)
  {
    id v4 = +[UIApplication sharedApplication];
    [v4 endBackgroundTask:[obj backgroundTaskIdentifier]];

    [(MTAppShortcutManager *)obj setBackgroundTaskIdentifier:UIBackgroundTaskInvalid];
  }
  if ([(MTAppShortcutManager *)obj backgroundTaskIdentifier] == UIBackgroundTaskInvalid) {
    [(MTAppShortcutManager *)obj setUpdateCount:0];
  }
  objc_sync_exit(obj);
}

- (id)_fetchShortcutItems
{
  return [(MTAppShortcutManager *)self _fetchStationShortcutItems];
}

- (id)_fetchStationShortcutItems
{
  uint64_t v10 = 0;
  unsigned int v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = sub_100056EC0;
  id v14 = sub_100057238;
  id v15 = 0;
  v2 = +[MTDB sharedInstance];
  BOOL v3 = [v2 privateQueueContext];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100086F68;
  v7[3] = &unk_10054DF08;
  id v4 = v3;
  id v8 = v4;
  unsigned int v9 = &v10;
  [v4 performBlockAndWait:v7];
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a3;
  id v8 = +[MTSharedPlaybackController kIsPlayingKeyPath];
  unsigned int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    [(MTAppShortcutManager *)self updateShortcutItems];
  }
}

- (unint64_t)backgroundTaskIdentifier
{
  return self->_backgroundTaskIdentifier;
}

- (void)setBackgroundTaskIdentifier:(unint64_t)a3
{
  self->_backgroundTaskIdentifier = a3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (unint64_t)updateCount
{
  return self->_updateCount;
}

- (void)setUpdateCount:(unint64_t)a3
{
  self->_updateCount = a3;
}

- (void).cxx_destruct
{
}

@end