@interface BKLastOpenBookManager
+ (id)_backgroundTimeKey;
+ (id)sharedInstance;
- (BCJSConfiguration)config;
- (BKRecentBookOpenResultTracker)openResultTracker;
- (BOOL)_lastEngagedDateConsideredActive:(id)a3;
- (BOOL)lastKnownSuccessfullyOpenedBookForAssetID:(id)a3;
- (BOOL)shouldAutoOpenAsset:(id)a3;
- (NSMutableArray)lastOpenedBookAssetIDs;
- (NSMutableDictionary)sucessfullyOpenedBookForAssetID;
- (id)_computeAssetIDForSavingToUserDataLastBookKey;
- (id)_computeLastSuccessfullyOpenedBookAssetID;
- (id)_initWithConfiguration:(id)a3;
- (id)_lastKnownSuccessfullyOpenedBookForAssetIDMappings;
- (unint64_t)_currentBookOpenBehavior;
- (void)_clearCurrentBookIfNecessary;
- (void)_updateLastOpenBookUserData;
- (void)clearAllLastOpenBooks;
- (void)dealloc;
- (void)javascriptConfiguration:(id)a3 updatedKeys:(id)a4;
- (void)prewarmAppState;
- (void)removeSucessfullyOpenedBookAssetIDs:(id)a3;
- (void)saveCurrentBookState;
- (void)setConfig:(id)a3;
- (void)setLastOpenedBookAssetIDs:(id)a3;
- (void)setOpenResultTracker:(id)a3;
- (void)setSucessfullyOpenedBookForAssetID:(id)a3;
- (void)updateLastOpenBookByRemovingAssetID:(id)a3 addingAssetID:(id)a4;
- (void)updateSuccessfullyOpenedBookForAssetID:(id)a3 successfullyOpenedBook:(BOOL)a4;
@end

@implementation BKLastOpenBookManager

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C264;
  block[3] = &unk_100A43EF8;
  block[4] = a1;
  if (qword_100B4A548 != -1) {
    dispatch_once(&qword_100B4A548, block);
  }
  v2 = (void *)qword_100B4A550;

  return v2;
}

- (void)javascriptConfiguration:(id)a3 updatedKeys:(id)a4
{
}

- (void)_clearCurrentBookIfNecessary
{
  if ((char *)[(BKLastOpenBookManager *)self _currentBookOpenBehavior] - 1 <= (char *)1)
  {
    +[BKBasePresentingViewController clearLastKnownSuccessfullyOpenBookID];
  }
}

- (unint64_t)_currentBookOpenBehavior
{
  v3 = +[NSDate date];
  v4 = [(BKLastOpenBookManager *)self config];
  v5 = [v4 dateSinceLastActiveOverride];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v8 = +[NSUserDefaults standardUserDefaults];
    id v7 = [v8 objectForKey:@"BKApplicationDidEnterBackgroundTimeKey"];
  }
  v9 = +[BKBasePresentingViewController lastKnownSuccessfullyOpenBookID];
  id v10 = [v9 length];

  [v3 timeIntervalSinceDate:v7];
  double v12 = v11;
  v13 = [(BKLastOpenBookManager *)self config];
  [v13 openBookDefaultBehaviorOverride];
  double v15 = v14;

  v16 = [(BKLastOpenBookManager *)self config];
  [v16 openBookOpenBehaviorOverride];
  double v18 = v17;

  v19 = [(BKLastOpenBookManager *)self config];
  [v19 openBookClosedSpreadBehaviorOverride];
  double v21 = v20;

  if (v7)
  {
    double v22 = v12 / 86400.0;
    if (v12 / 86400.0 <= v15)
    {
      unint64_t v23 = 0;
    }
    else if (v10 && v22 <= v21)
    {
      unint64_t v23 = 3;
    }
    else if (v22 > v15 && v22 <= v18 && v10 == 0)
    {
      unint64_t v23 = 1;
    }
    else
    {
      unint64_t v23 = 2;
    }
  }
  else if (v10)
  {
    unint64_t v23 = 3;
  }
  else
  {
    unint64_t v23 = 1;
  }

  return v23;
}

- (BCJSConfiguration)config
{
  return self->_config;
}

- (void)removeSucessfullyOpenedBookAssetIDs:(id)a3
{
  id v9 = a3;
  v4 = +[NSUserDefaults standardUserDefaults];
  v5 = [v4 objectForKey:@"BKMainViewControllerLastBook"];
  if ([v5 length] && objc_msgSend(v9, "containsObject:", v5)) {
    [v4 removeObjectForKey:@"BKMainViewControllerSuccessfullyOpenedBook"];
  }
  v6 = [(BKLastOpenBookManager *)self sucessfullyOpenedBookForAssetID];
  id v7 = [v9 allObjects];
  [v6 removeObjectsForKeys:v7];

  v8 = [(BKLastOpenBookManager *)self sucessfullyOpenedBookForAssetID];
  [v4 setObject:v8 forKey:@"BKSuccessfullyOpenedBookForAssetIDMappings"];

  [v4 synchronize];
}

- (NSMutableDictionary)sucessfullyOpenedBookForAssetID
{
  return self->_sucessfullyOpenedBookForAssetID;
}

- (void)prewarmAppState
{
}

- (id)_lastKnownSuccessfullyOpenedBookForAssetIDMappings
{
  v2 = +[NSUserDefaults standardUserDefaults];
  v3 = [v2 objectForKey:@"BKSuccessfullyOpenedBookForAssetIDMappings"];
  v4 = v3;
  if (!v3) {
    v3 = &__NSDictionary0__struct;
  }
  id v5 = v3;

  return v5;
}

- (id)_initWithConfiguration:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)BKLastOpenBookManager;
  v6 = [(BKLastOpenBookManager *)&v16 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_config, a3);
    [v5 addObserver:v7];
    uint64_t v8 = objc_opt_new();
    openResultTracker = v7->_openResultTracker;
    v7->_openResultTracker = (BKRecentBookOpenResultTracker *)v8;

    id v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    lastOpenedBookAssetIDs = v7->_lastOpenedBookAssetIDs;
    v7->_lastOpenedBookAssetIDs = v10;

    double v12 = [(BKLastOpenBookManager *)v7 _lastKnownSuccessfullyOpenedBookForAssetIDMappings];
    v13 = (NSMutableDictionary *)[v12 mutableCopy];
    sucessfullyOpenedBookForAssetID = v7->_sucessfullyOpenedBookForAssetID;
    v7->_sucessfullyOpenedBookForAssetID = v13;
  }
  return v7;
}

- (void)dealloc
{
  v3 = [(BKLastOpenBookManager *)self config];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)BKLastOpenBookManager;
  [(BKLastOpenBookManager *)&v4 dealloc];
}

- (void)saveCurrentBookState
{
  id v3 = +[NSDate date];
  v2 = +[NSUserDefaults standardUserDefaults];
  [v2 setObject:v3 forKey:@"BKApplicationDidEnterBackgroundTimeKey"];
}

- (BOOL)_lastEngagedDateConsideredActive:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLastOpenBookManager *)self config];
  v6 = v5;
  if (v4)
  {
    id v7 = [v5 dateRequiredForActiveBook];
    BOOL v8 = [v7 compare:v4] != (id)1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (id)_backgroundTimeKey
{
  return @"BKApplicationDidEnterBackgroundTimeKey";
}

- (id)_computeLastSuccessfullyOpenedBookAssetID
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = [(BKLastOpenBookManager *)self lastOpenedBookAssetIDs];
  id v4 = [v3 reverseObjectEnumerator];

  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v10 = [(BKLastOpenBookManager *)self sucessfullyOpenedBookForAssetID];
        double v11 = [v10 objectForKeyedSubscript:v9];
        unsigned int v12 = [v11 BOOLValue];

        if (v12)
        {
          id v13 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_11:

  return v13;
}

- (id)_computeAssetIDForSavingToUserDataLastBookKey
{
  id v3 = [(BKLastOpenBookManager *)self _computeLastSuccessfullyOpenedBookAssetID];
  if (!v3)
  {
    id v4 = [(BKLastOpenBookManager *)self lastOpenedBookAssetIDs];
    id v3 = [v4 lastObject];
  }

  return v3;
}

- (void)_updateLastOpenBookUserData
{
  id v3 = [(BKLastOpenBookManager *)self _computeAssetIDForSavingToUserDataLastBookKey];
  if (v3)
  {
    id v4 = [(BKLastOpenBookManager *)self sucessfullyOpenedBookForAssetID];
    id v5 = [v4 objectForKeyedSubscript:v3];
    id v6 = [v5 BOOLValue];
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v7 = BCSceneLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    unsigned int v12 = v3;
    __int16 v13 = 1024;
    int v14 = (int)v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Scene update last open book ID to %{public}@, successful? %d", (uint8_t *)&v11, 0x12u);
  }

  BOOL v8 = +[NSUserDefaults standardUserDefaults];
  id v9 = v8;
  if (v3)
  {
    [v8 setObject:v3 forKey:@"BKMainViewControllerLastBook"];
    [v9 setBool:v6 forKey:@"BKMainViewControllerSuccessfullyOpenedBook"];
  }
  else
  {
    [v8 removeObjectForKey:@"BKMainViewControllerLastBook"];
    [v9 removeObjectForKey:@"BKMainViewControllerSuccessfullyOpenedBook"];
  }
  id v10 = [(BKLastOpenBookManager *)self sucessfullyOpenedBookForAssetID];
  [v9 setObject:v10 forKey:@"BKSuccessfullyOpenedBookForAssetIDMappings"];

  [v9 synchronize];
}

- (void)updateLastOpenBookByRemovingAssetID:(id)a3 addingAssetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = BCSceneLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543618;
    id v15 = v6;
    __int16 v16 = 2114;
    id v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Scene removing last open book ID=%{public}@, adding ID=%{public}@", (uint8_t *)&v14, 0x16u);
  }

  if (v6)
  {
    id v9 = [(BKLastOpenBookManager *)self lastOpenedBookAssetIDs];
    [v9 removeObject:v6];

    id v10 = [(BKLastOpenBookManager *)self sucessfullyOpenedBookForAssetID];
    [v10 removeObjectForKey:v6];
  }
  if (v7)
  {
    int v11 = [(BKLastOpenBookManager *)self lastOpenedBookAssetIDs];
    unsigned __int8 v12 = [v11 containsObject:v7];

    if ((v12 & 1) == 0)
    {
      __int16 v13 = [(BKLastOpenBookManager *)self lastOpenedBookAssetIDs];
      [v13 addObject:v7];
    }
  }
  [(BKLastOpenBookManager *)self _updateLastOpenBookUserData];
}

- (void)updateSuccessfullyOpenedBookForAssetID:(id)a3 successfullyOpenedBook:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  if ([v9 length])
  {
    openResultTracker = self->_openResultTracker;
    if (v4) {
      [(BKRecentBookOpenResultTracker *)openResultTracker openDidFinishForAsset:v9];
    }
    else {
      [(BKRecentBookOpenResultTracker *)openResultTracker openDidStartForAsset:v9];
    }
  }
  id v7 = +[NSNumber numberWithBool:v4];
  BOOL v8 = [(BKLastOpenBookManager *)self sucessfullyOpenedBookForAssetID];
  [v8 setObject:v7 forKeyedSubscript:v9];

  [(BKLastOpenBookManager *)self _updateLastOpenBookUserData];
}

- (BOOL)shouldAutoOpenAsset:(id)a3
{
  BOOL v3 = [(BKRecentBookOpenResultTracker *)self->_openResultTracker shouldAutoOpenAsset:a3];
  BOOL v4 = BCCurrentBookLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "auto-open logic said open? %d.", (uint8_t *)v6, 8u);
  }

  return v3;
}

- (BOOL)lastKnownSuccessfullyOpenedBookForAssetID:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLastOpenBookManager *)self _lastKnownSuccessfullyOpenedBookForAssetIDMappings];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 objectForKeyedSubscript:v4];
    unsigned __int8 v8 = [v7 BOOLValue];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (void)clearAllLastOpenBooks
{
  BOOL v3 = BCSceneLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Clearing all known last open books", v5, 2u);
  }

  id v4 = [(BKLastOpenBookManager *)self lastOpenedBookAssetIDs];
  [v4 removeAllObjects];

  [(BKLastOpenBookManager *)self _updateLastOpenBookUserData];
}

- (void)setConfig:(id)a3
{
}

- (BKRecentBookOpenResultTracker)openResultTracker
{
  return self->_openResultTracker;
}

- (void)setOpenResultTracker:(id)a3
{
}

- (NSMutableArray)lastOpenedBookAssetIDs
{
  return self->_lastOpenedBookAssetIDs;
}

- (void)setLastOpenedBookAssetIDs:(id)a3
{
}

- (void)setSucessfullyOpenedBookForAssetID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sucessfullyOpenedBookForAssetID, 0);
  objc_storeStrong((id *)&self->_lastOpenedBookAssetIDs, 0);
  objc_storeStrong((id *)&self->_openResultTracker, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end