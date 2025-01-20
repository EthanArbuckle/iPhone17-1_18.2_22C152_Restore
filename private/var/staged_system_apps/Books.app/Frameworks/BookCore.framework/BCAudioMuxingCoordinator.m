@interface BCAudioMuxingCoordinator
+ (id)sharedInstance;
- (BCAudioMuxingCoordinator)init;
- (NSHashTable)observers;
- (os_unfair_lock_s)lock;
- (void)addAudioMuxingObserver:(id)a3;
- (void)beginLongAudioSessionWithIdentifier:(id)a3 completion:(id)a4;
- (void)notifyPlaybackWillStart:(id)a3;
- (void)removeAudioMuxingObserver:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setObservers:(id)a3;
@end

@implementation BCAudioMuxingCoordinator

- (BCAudioMuxingCoordinator)init
{
  v6.receiver = self;
  v6.super_class = (Class)BCAudioMuxingCoordinator;
  v2 = [(BCAudioMuxingCoordinator *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSHashTable weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_345BD0 != -1) {
    dispatch_once(&qword_345BD0, &stru_2C7F20);
  }
  v2 = (void *)qword_345BC8;

  return v2;
}

- (void)addAudioMuxingObserver:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_9D9B8;
    v6[3] = &unk_2C3AF8;
    v6[4] = self;
    id v7 = v4;
    os_unfair_lock_lock(&self->_lock);
    sub_9D9B8((uint64_t)v6);
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)removeAudioMuxingObserver:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_9DA74;
  v5[3] = &unk_2C3AF8;
  p_lock = &self->_lock;
  v5[4] = self;
  id v6 = a3;
  id v4 = v6;
  os_unfair_lock_lock(p_lock);
  sub_9DA74((uint64_t)v5);
  os_unfair_lock_unlock(p_lock);
}

- (void)notifyPlaybackWillStart:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_9DC74;
  v24 = sub_9DC84;
  id v25 = 0;
  p_lock = &self->_lock;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v16 = sub_9DC8C;
  v17 = &unk_2C39F0;
  v18 = self;
  v19 = &v20;
  id v6 = v15;
  os_unfair_lock_lock(p_lock);
  v16((uint64_t)v6);
  os_unfair_lock_unlock(p_lock);

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v7 = (id)v21[5];
  id v8 = [v7 countByEnumeratingWithState:&v11 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) audioPlaybackWillStart:v4 v11];
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v7 countByEnumeratingWithState:&v11 objects:v26 count:16];
    }
    while (v8);
  }

  _Block_object_dispose(&v20, 8);
}

- (void)beginLongAudioSessionWithIdentifier:(id)a3 completion:(id)a4
{
  id v4 = (void (**)(void))objc_retainBlock(a4);
  if (v4)
  {
    v5 = v4;
    v4[2]();
    id v4 = v5;
  }
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
}

@end