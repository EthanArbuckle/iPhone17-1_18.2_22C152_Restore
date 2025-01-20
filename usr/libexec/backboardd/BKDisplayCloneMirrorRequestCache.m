@interface BKDisplayCloneMirrorRequestCache
- (void)_lock_addDeathWatcherForPid:(int)a3;
- (void)_lock_rebuildModeCache;
@end

@implementation BKDisplayCloneMirrorRequestCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pidToDeathWatcher, 0);
  objc_storeStrong((id *)&self->_modeRequestsInOrder, 0);
  objc_storeStrong((id *)&self->_pidToRequests, 0);
  objc_storeStrong((id *)&self->_displayUUIDToModeRequest, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_lock_rebuildModeCache
{
  os_unfair_lock_assert_owner(&self->_lock);
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v4 = self->_modeRequestsInOrder;
  id v5 = [(NSMutableOrderedSet *)v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v8);
        if (v9) {
          v10 = *(void **)(v9 + 16);
        }
        else {
          v10 = 0;
        }
        id v11 = v10;
        v12 = [v3 objectForKey:v11];

        if (!v12) {
          [v3 setObject:v9 forKey:v11];
        }

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v13 = [(NSMutableOrderedSet *)v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
      id v6 = v13;
    }
    while (v13);
  }

  objc_storeStrong((id *)&self->_displayUUIDToModeRequest, v3);
  v14 = BKLogDisplay();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = +[BSDescriptionStream descriptionForRootObject:v3];
    *(_DWORD *)buf = 138543362;
    v21 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "clone mirror cache is now %{public}@", buf, 0xCu);
  }
}

- (void)_lock_addDeathWatcherForPid:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (!self->_pidToDeathWatcher)
  {
    id v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pidToDeathWatcher = self->_pidToDeathWatcher;
    self->_pidToDeathWatcher = v5;
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10004A040;
  v10[3] = &unk_1000F8A20;
  v10[4] = self;
  int v11 = v3;
  id v7 = [objc_alloc((Class)BSProcessDeathWatcher) initWithPID:v3 queue:&_dispatch_main_q deathHandler:v10];
  v8 = self->_pidToDeathWatcher;
  uint64_t v9 = +[NSNumber numberWithInt:v3];
  [(NSMutableDictionary *)v8 setObject:v7 forKey:v9];
}

@end