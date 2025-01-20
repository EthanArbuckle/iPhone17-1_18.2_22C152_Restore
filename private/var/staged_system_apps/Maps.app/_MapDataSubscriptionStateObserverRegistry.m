@interface _MapDataSubscriptionStateObserverRegistry
- (_MapDataSubscriptionStateObserverRegistry)init;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation _MapDataSubscriptionStateObserverRegistry

- (_MapDataSubscriptionStateObserverRegistry)init
{
  v7.receiver = self;
  v7.super_class = (Class)_MapDataSubscriptionStateObserverRegistry;
  v2 = [(_MapDataSubscriptionStateObserverRegistry *)&v7 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    observing = v2->_observing;
    v2->_observing = (NSMutableDictionary *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [(NSMutableDictionary *)self->_observing allKeys];
  id v4 = [v3 copy];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        sub_100709104((uint64_t)self, *(void **)(*((void *)&v11 + 1) + 8 * (void)v9));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  v10.receiver = self;
  v10.super_class = (Class)_MapDataSubscriptionStateObserverRegistry;
  [(_MapDataSubscriptionStateObserverRegistry *)&v10 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a4;
  long long v11 = v10;
  if (off_1015EA260 == a6)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100709374;
    block[3] = &unk_1012E5D58;
    block[4] = self;
    id v14 = v10;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)_MapDataSubscriptionStateObserverRegistry;
    [(_MapDataSubscriptionStateObserverRegistry *)&v12 observeValueForKeyPath:a3 ofObject:v10 change:a5 context:a6];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);

  objc_storeStrong((id *)&self->_observing, 0);
}

@end