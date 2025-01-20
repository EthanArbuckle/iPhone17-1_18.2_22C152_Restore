@interface MapsTokenStorage
- (BOOL)_callbackQueueIsMainQueue;
- (MapsTokenStorage)initWithDelegate:(id)a3 tokenGroupName:(id)a4;
- (MapsTokenStorage)initWithDelegate:(id)a3 tokenGroupName:(id)a4 callbackQueue:(id)a5;
- (NSArray)allTokenReasons;
- (NSArray)tokens;
- (id)tokenWithReason:(id)a3;
- (id)tokenWithUserInfo:(id)a3;
- (unint64_t)count;
- (void)_performBlockOnCallbackQueue:(id)a3;
- (void)addToken:(id)a3;
- (void)decrementForToken:(id)a3;
- (void)incrementForToken:(id)a3;
- (void)notifyObserversAddedToken:(id)a3;
- (void)notifyObserversForRemovedToken:(id)a3;
- (void)registerObserver:(id)a3;
- (void)removeToken:(id)a3;
- (void)setObserverCallbackQueue:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation MapsTokenStorage

- (NSArray)allTokenReasons
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_100104580;
  v10 = sub_100104B30;
  id v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100025750;
  v5[3] = &unk_1012E73F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)removeToken:(id)a3
{
  id v4 = a3;
  v5 = sub_1000961C8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "REMOVE %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  isolationQueue = self->_isolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001696C;
  block[3] = &unk_1012EC608;
  block[4] = self;
  id v7 = v4;
  id v9 = v7;
  p_long long buf = &buf;
  dispatch_sync(isolationQueue, block);
  if (*(unsigned char *)(*((void *)&buf + 1) + 24)) {
    [(MapsTokenStorage *)self notifyObserversForRemovedToken:v7];
  }

  _Block_object_dispose(&buf, 8);
}

- (void)notifyObserversForRemovedToken:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_100104580;
  v17 = sub_100104B30;
  id v18 = 0;
  isolationQueue = self->_isolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010873C;
  block[3] = &unk_1012E73F0;
  block[4] = self;
  void block[5] = &v13;
  dispatch_sync(isolationQueue, block);
  uint64_t v6 = sub_1000961C8();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [(id)v14[5] count];
    *(_DWORD *)long long buf = 134218242;
    id v20 = v7;
    __int16 v21 = 2114;
    id v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "NOTIFY %lu observers DID REMOVE %{public}@", buf, 0x16u);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002B264;
  v9[3] = &unk_1012E73F0;
  id v11 = &v13;
  id v8 = v4;
  id v10 = v8;
  [(MapsTokenStorage *)self _performBlockOnCallbackQueue:v9];

  _Block_object_dispose(&v13, 8);
}

- (id)tokenWithReason:(id)a3
{
  id v4 = a3;
  v5 = [[MapsToken alloc] initWithDelegate:self tokenGroupName:self->_tokenGroupName reason:v4];

  return v5;
}

- (void)incrementForToken:(id)a3
{
}

- (void)_performBlockOnCallbackQueue:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (v4)
  {
    if (!self->_callbackQueue)
    {
LABEL_8:
      v4[2](v4);
      goto LABEL_16;
    }
    if ([(MapsTokenStorage *)self _callbackQueueIsMainQueue]
      && +[NSThread isMainThread])
    {
      v5 = sub_1000961C8();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        label = dispatch_queue_get_label((dispatch_queue_t)self->_callbackQueue);
        *(_DWORD *)long long buf = 136446210;
        v19 = label;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "ON MAIN THREAD %{public}s:", buf, 0xCu);
      }

      goto LABEL_8;
    }
    callbackQueue = self->_callbackQueue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v14 = sub_100D54AA8;
    uint64_t v15 = &unk_1012E76E8;
    v16 = self;
    v17 = v4;
    id v8 = callbackQueue;
    id v9 = v13;
    id v10 = dispatch_queue_get_label(v8);
    id v11 = dispatch_queue_get_label(0);
    if (v10 == v11 || v10 && v11 && !strcmp(v10, v11))
    {
      v14((uint64_t)v9);
    }
    else
    {
      dispatch_sync(v8, v9);
    }
  }
LABEL_16:
}

- (void)addToken:(id)a3
{
  id v4 = a3;
  v5 = sub_1000961C8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "ADD %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  isolationQueue = self->_isolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100095240;
  block[3] = &unk_1012EC608;
  id v7 = v4;
  id v9 = v7;
  id v10 = self;
  p_long long buf = &buf;
  dispatch_sync(isolationQueue, block);
  if (*(unsigned char *)(*((void *)&buf + 1) + 24)) {
    [(MapsTokenStorage *)self notifyObserversAddedToken:v7];
  }

  _Block_object_dispose(&buf, 8);
}

- (void)notifyObserversAddedToken:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_100104580;
  v17 = sub_100104B30;
  id v18 = 0;
  isolationQueue = self->_isolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001CC6C;
  block[3] = &unk_1012E73F0;
  void block[4] = self;
  void block[5] = &v13;
  dispatch_sync(isolationQueue, block);
  uint64_t v6 = sub_1000961C8();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [(id)v14[5] count];
    *(_DWORD *)long long buf = 134218242;
    id v20 = v7;
    __int16 v21 = 2114;
    id v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "NOTIFY %lu observers DID ADD %{public}@", buf, 0x16u);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000957E4;
  v9[3] = &unk_1012E73F0;
  id v11 = &v13;
  id v8 = v4;
  id v10 = v8;
  [(MapsTokenStorage *)self _performBlockOnCallbackQueue:v9];

  _Block_object_dispose(&v13, 8);
}

- (MapsTokenStorage)initWithDelegate:(id)a3 tokenGroupName:(id)a4 callbackQueue:(id)a5
{
  id v8 = a5;
  id v9 = [(MapsTokenStorage *)self initWithDelegate:a3 tokenGroupName:a4];
  id v10 = v9;
  if (v9) {
    [(MapsTokenStorage *)v9 setObserverCallbackQueue:v8];
  }

  return v10;
}

- (void)setObserverCallbackQueue:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_callbackQueue, a3);
  uint64_t v6 = sub_1000961C8();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      tokenGroupName = self->_tokenGroupName;
      int v13 = 138543618;
      char v14 = tokenGroupName;
      __int16 v15 = 2114;
      id v16 = v5;
      id v9 = "Updated callback queue for %{public}@: %{public}@";
      id v10 = v6;
      uint32_t v11 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v13, v11);
    }
  }
  else if (v7)
  {
    uint64_t v12 = self->_tokenGroupName;
    int v13 = 138543362;
    char v14 = v12;
    id v9 = "Removing custom callback queue for %{public}@";
    id v10 = v6;
    uint32_t v11 = 12;
    goto LABEL_6;
  }
}

- (MapsTokenStorage)initWithDelegate:(id)a3 tokenGroupName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)MapsTokenStorage;
  id v8 = [(MapsTokenStorage *)&v28 init];
  if (v8)
  {
    id v9 = sub_1000961C8();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
LABEL_12:

      id v16 = (NSString *)[v7 copy];
      tokenGroupName = v8->_tokenGroupName;
      v8->_tokenGroupName = v16;

      uint64_t v18 = +[NSHashTable weakObjectsHashTable];
      observers = v8->_observers;
      v8->_observers = (NSHashTable *)v18;

      [(NSHashTable *)v8->_observers addObject:v6];
      id v20 = +[NSString stringWithFormat:@"com.apple.Maps.Tokens.%@", v7];
      __int16 v21 = (const char *)[v20 UTF8String];
      id v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v23 = dispatch_queue_create(v21, v22);
      isolationQueue = v8->_isolationQueue;
      v8->_isolationQueue = (OS_dispatch_queue *)v23;

      uint64_t v25 = +[NSHashTable weakObjectsHashTable];
      tokens = v8->_tokens;
      v8->_tokens = (NSHashTable *)v25;

      goto LABEL_13;
    }
    id v10 = v6;
    if (!v10)
    {
      __int16 v15 = @"<nil>";
      goto LABEL_11;
    }
    uint32_t v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    if (objc_opt_respondsToSelector())
    {
      int v13 = [v10 performSelector:"accessibilityIdentifier"];
      char v14 = v13;
      if (v13 && ![v13 isEqualToString:v12])
      {
        __int16 v15 = +[NSString stringWithFormat:@"%@<%p, %@>", v12, v10, v14];

        goto LABEL_9;
      }
    }
    __int16 v15 = +[NSString stringWithFormat:@"%@<%p>", v12, v10];
LABEL_9:

LABEL_11:
    *(_DWORD *)long long buf = 138543618;
    id v30 = v7;
    __int16 v31 = 2114;
    v32 = v15;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "CREATE %{public}@ storage for %{public}@", buf, 0x16u);

    goto LABEL_12;
  }
LABEL_13:

  return v8;
}

- (BOOL)_callbackQueueIsMainQueue
{
  if (!self->_checkedCallbackQueue)
  {
    callbackQueue = self->_callbackQueue;
    if (callbackQueue)
    {
      label = dispatch_queue_get_label(callbackQueue);
      id v5 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
      if (label == v5 || label && v5 && !strcmp(label, v5)) {
        self->_callbackQueueIsMainQueue = 1;
      }
    }
    self->_checkedCallbackQueue = 1;
  }
  return self->_callbackQueueIsMainQueue;
}

- (unint64_t)count
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000252CC;
  v5[3] = &unk_1012E73F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)decrementForToken:(id)a3
{
}

- (id)tokenWithUserInfo:(id)a3
{
  id v4 = a3;
  id v5 = [[MapsToken alloc] initWithDelegate:self tokenGroupName:self->_tokenGroupName userInfo:v4];

  return v5;
}

- (NSArray)tokens
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_100104580;
  id v10 = sub_100104B30;
  id v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100D54514;
  v5[3] = &unk_1012E67C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000961C8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = v4;
    if (!v6)
    {
      id v11 = @"<nil>";
      goto LABEL_10;
    }
    id v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v9 = [v6 performSelector:"accessibilityIdentifier"];
      id v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        id v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    id v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

LABEL_10:
    tokenGroupName = self->_tokenGroupName;
    *(_DWORD *)long long buf = 138543618;
    uint64_t v18 = v11;
    __int16 v19 = 2114;
    id v20 = tokenGroupName;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "REGISTER %{public}@ for %{public}@", buf, 0x16u);
  }
  isolationQueue = self->_isolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100D547E8;
  block[3] = &unk_1012E5D58;
  void block[4] = self;
  id v16 = v4;
  id v14 = v4;
  dispatch_sync(isolationQueue, block);
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000961C8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = v4;
    if (!v6)
    {
      id v11 = @"<nil>";
      goto LABEL_10;
    }
    id v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v9 = [v6 performSelector:"accessibilityIdentifier"];
      id v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        id v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    id v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

LABEL_10:
    tokenGroupName = self->_tokenGroupName;
    *(_DWORD *)long long buf = 138543618;
    uint64_t v18 = v11;
    __int16 v19 = 2114;
    id v20 = tokenGroupName;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "UNREGISTER %{public}@ for %{public}@", buf, 0x16u);
  }
  isolationQueue = self->_isolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100D54A44;
  block[3] = &unk_1012E5D58;
  void block[4] = self;
  id v16 = v4;
  id v14 = v4;
  dispatch_sync(isolationQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);

  objc_storeStrong((id *)&self->_tokenGroupName, 0);
}

@end