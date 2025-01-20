@interface JSAUserDefaults
+ (id)getInstance;
- (JSAUserDefaults)init;
- (id)registerOnDefaultsChange:(id)a3 keysToObserve:(id)a4 fromGroup:(BOOL)a5;
- (id)valuesForDefaults:(id)a3 fromGroup:(BOOL)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setValueForDefaults:(id)a3 forKey:(id)a4 fromGroup:(BOOL)a5;
- (void)unregisterOnDefaultsChangeFromGroup:(BOOL)a3;
@end

@implementation JSAUserDefaults

- (JSAUserDefaults)init
{
  v10.receiver = self;
  v10.super_class = (Class)JSAUserDefaults;
  v2 = [(JSAUserDefaults *)&v10 init];
  if (v2)
  {
    uint64_t v3 = +[NSMapTable weakToStrongObjectsMapTable];
    defaultsToCallback = v2->_defaultsToCallback;
    v2->_defaultsToCallback = (NSMapTable *)v3;

    uint64_t v5 = +[NSMapTable weakToStrongObjectsMapTable];
    defaultsToKeysToObserve = v2->_defaultsToKeysToObserve;
    v2->_defaultsToKeysToObserve = (NSMapTable *)v5;

    uint64_t v7 = +[NSMapTable weakToStrongObjectsMapTable];
    defaultsToCachedValues = v2->_defaultsToCachedValues;
    v2->_defaultsToCachedValues = (NSMapTable *)v7;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

+ (id)getInstance
{
  if (qword_CE290 != -1) {
    dispatch_once(&qword_CE290, &stru_B2090);
  }
  v2 = (void *)qword_CE298;

  return v2;
}

- (id)registerOnDefaultsChange:(id)a3 keysToObserve:(id)a4 fromGroup:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  objc_super v10 = +[JSABridge sharedInstance];
  [v10 debugAssertRunningOnJSAThread];

  v11 = JSALog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v28 = "-[JSAUserDefaults registerOnDefaultsChange:keysToObserve:fromGroup:]";
    __int16 v29 = 2048;
    id v30 = [v9 count];
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "%{public}s %lu keys", buf, 0x16u);
  }

  if (v5)
  {
    v12 = +[BUAppGroup books];
    v13 = [v12 userDefaults];
  }
  else
  {
    v13 = +[NSUserDefaults standardUserDefaults];
  }
  sub_4FB8(self, v9, 1, v5);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_51D4;
  v22[3] = &unk_B20B8;
  p_lock = &self->_lock;
  v22[4] = self;
  id v23 = v8;
  id v24 = v13;
  id v25 = v9;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v26 = v15;
  id v16 = v9;
  id v17 = v13;
  id v18 = v8;
  os_unfair_lock_lock_with_options();
  sub_51D4(v22);
  os_unfair_lock_unlock(p_lock);
  v19 = v26;
  id v20 = v15;

  return v20;
}

- (void)unregisterOnDefaultsChangeFromGroup:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = +[JSABridge sharedInstance];
  [v5 debugAssertRunningOnJSAThread];

  if (v3)
  {
    v6 = +[BUAppGroup books];
    uint64_t v7 = [v6 userDefaults];
  }
  else
  {
    uint64_t v7 = +[NSUserDefaults standardUserDefaults];
  }
  id v8 = [(NSMapTable *)self->_defaultsToKeysToObserve objectForKey:v7];
  id v9 = v8;
  objc_super v10 = (uint64_t *)&off_CB320;
  if (!v3) {
    objc_super v10 = (uint64_t *)&off_CB328;
  }
  uint64_t v11 = *v10;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v9);
        }
        [v7 removeObserver:self forKeyPath:*(void *)(*((void *)&v20 + 1) + 8 * (void)v15) context:v11];
        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_54B8;
  v18[3] = &unk_B2050;
  p_lock = &self->_lock;
  v18[4] = self;
  id v19 = v7;
  id v17 = v7;
  os_unfair_lock_lock_with_options();
  sub_54B8((uint64_t)v18);
  os_unfair_lock_unlock(p_lock);
}

- (id)valuesForDefaults:(id)a3 fromGroup:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = +[JSABridge sharedInstance];
  [v7 debugAssertRunningOnJSAThread];

  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x3032000000;
  long long v22 = sub_56B8;
  long long v23 = sub_56C8;
  id v24 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  uint64_t v14 = sub_56D0;
  id v15 = &unk_B20E0;
  id v16 = self;
  id v17 = &v19;
  BOOL v18 = v4;
  id v8 = v13;
  os_unfair_lock_lock_with_options();
  v14((uint64_t)v8);
  os_unfair_lock_unlock(&self->_lock);

  id v9 = [(id)v20[5] allKeys];
  LODWORD(v8) = [v9 isEqualToArray:v6];

  if (v8)
  {
    id v10 = (id)v20[5];
  }
  else
  {
    sub_4FB8(self, v6, 0, v4);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v11 = v10;
  _Block_object_dispose(&v19, 8);

  return v11;
}

- (void)setValueForDefaults:(id)a3 forKey:(id)a4 fromGroup:(BOOL)a5
{
  id v13 = a3;
  id v7 = a4;
  id v8 = +[JSABridge sharedInstance];
  [v8 debugAssertRunningOnJSAThread];

  if ([v13 isNull])
  {
    if (a5)
    {
      id v9 = +[BUAppGroup books];
      id v10 = [v9 userDefaults];
    }
    else
    {
      id v10 = +[NSUserDefaults standardUserDefaults];
    }
    [v10 removeObjectForKey:v7];
  }
  else
  {
    if (a5)
    {
      uint64_t v11 = +[BUAppGroup books];
      id v10 = [v11 userDefaults];
    }
    else
    {
      id v10 = +[NSUserDefaults standardUserDefaults];
    }
    uint64_t v12 = [v13 toObject];
    [v10 setObject:v12 forKey:v7];

    id v7 = (id)v12;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_CB328 == a6)
  {
    objc_initWeak(&location, self);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_6098;
    v26[3] = &unk_B2130;
    id v13 = &v29;
    objc_copyWeak(&v29, &location);
    id v27 = v10;
    id v28 = v12;
    uint64_t v14 = objc_retainBlock(v26);
    if (v14)
    {
      if (+[NSThread isMainThread])
      {
        ((void (*)(void *))v14[2])(v14);
      }
      else
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_6114;
        block[3] = &unk_B2028;
        id v25 = v14;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      }
    }

    id v16 = v27;
    goto LABEL_14;
  }
  if (off_CB320 == a6)
  {
    objc_initWeak(&location, self);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_6124;
    v20[3] = &unk_B2130;
    id v13 = &v23;
    objc_copyWeak(&v23, &location);
    id v21 = v10;
    id v22 = v12;
    id v15 = objc_retainBlock(v20);
    if (v15)
    {
      if (+[NSThread isMainThread])
      {
        ((void (*)(void *))v15[2])(v15);
      }
      else
      {
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_61A0;
        v18[3] = &unk_B2028;
        uint64_t v19 = v15;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v18);
      }
    }

    id v16 = v21;
LABEL_14:

    objc_destroyWeak(v13);
    objc_destroyWeak(&location);
    goto LABEL_15;
  }
  v17.receiver = self;
  v17.super_class = (Class)JSAUserDefaults;
  [(JSAUserDefaults *)&v17 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
LABEL_15:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsToCachedValues, 0);
  objc_storeStrong((id *)&self->_defaultsToKeysToObserve, 0);

  objc_storeStrong((id *)&self->_defaultsToCallback, 0);
}

@end