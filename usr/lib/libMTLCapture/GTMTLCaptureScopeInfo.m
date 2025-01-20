@interface GTMTLCaptureScopeInfo
+ (id)allCaptureScopes;
+ (id)getInfoWithAddress:(unint64_t)a3;
+ (id)getInfoWithStreamRef:(unint64_t)a3;
+ (void)addScope:(id)a3;
+ (void)initialize;
+ (void)removeScope:(id)a3;
+ (void)sendAll:(os_unfair_lock_s *)a3;
+ (void)updateAll;
@end

@implementation GTMTLCaptureScopeInfo

+ (id)getInfoWithAddress:(unint64_t)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&lock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = (id)_scopes;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v14 != v7) {
        objc_enumerationMutation(v4);
      }
      v9 = [_scopes objectForKey:*(void *)(*((void *)&v13 + 1) + 8 * v8), (void)v13];
      v10 = v9;
      if (v9 == (void *)a3) {
        break;
      }

      if (v6 == (id)++v8)
      {
        id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    if (!v10) {
      goto LABEL_12;
    }
    v11 = newDYMTLCaptureScopeInfo(v10);
  }
  else
  {
LABEL_9:

    v10 = 0;
LABEL_12:
    v11 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&lock);

  return v11;
}

+ (id)getInfoWithStreamRef:(unint64_t)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&lock);
  id v4 = (void *)_scopes;
  id v5 = +[NSNumber numberWithUnsignedLongLong:a3];
  id v6 = [v4 objectForKey:v5];

  if (v6)
  {
    uint64_t v7 = newDYMTLCaptureScopeInfo(v6);
  }
  else
  {
    uint64_t v7 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&lock);

  return v7;
}

+ (void)updateAll
{
  os_unfair_lock_lock((os_unfair_lock_t)&lock);
  +[GTMTLCaptureScopeInfo sendAll:&lock];

  os_unfair_lock_assert_not_owner((const os_unfair_lock *)&lock);
}

+ (void)removeScope:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&lock);
  id v4 = (void *)_scopes;
  id v5 = [v3 streamReference];

  id v6 = +[NSNumber numberWithUnsignedLongLong:v5];
  [v4 removeObjectForKey:v6];

  +[GTMTLCaptureScopeInfo sendAll:&lock];

  os_unfair_lock_assert_not_owner((const os_unfair_lock *)&lock);
}

+ (void)addScope:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&lock);
  id v4 = (void *)_scopes;
  id v5 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v3 streamReference]);
  [v4 setObject:v3 forKey:v5];

  +[GTMTLCaptureScopeInfo sendAll:&lock];

  os_unfair_lock_assert_not_owner((const os_unfair_lock *)&lock);
}

+ (void)sendAll:(os_unfair_lock_s *)a3
{
  os_unfair_lock_assert_owner(a3);
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = (id)_scopes;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [_scopes objectForKey:*(void *)(*((void *)&v12 + 1) + 8 * (void)v9) count:v12];
        v11 = newDYMTLCaptureScopeInfo(v10);
        [v4 addObject:v11];

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(a3);
  GTMTLGuestAppClientSendMTLCaptureScopeInfo(g_guestAppClientMTL, v4);
}

+ (id)allCaptureScopes
{
  os_unfair_lock_lock((os_unfair_lock_t)&lock);
  id v2 = objc_alloc((Class)NSMutableArray);
  id v3 = [v2 initWithCapacity:[_scopes count]];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = (id)_scopes;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [_scopes objectForKey:*(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13];
        v10 = newDYMTLCaptureScopeInfo(v9);
        [v3 addObject:v10];
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&lock);
  id v11 = [v3 copy];

  return v11;
}

+ (void)initialize
{
  +[NSKeyedArchiver setClassName:@"DYMTLCaptureScopeInfo" forClass:objc_opt_class()];
  uint64_t v2 = +[NSMapTable strongToWeakObjectsMapTable];
  uint64_t v3 = _scopes;
  _scopes = v2;

  _objc_release_x1(v2, v3);
}

@end