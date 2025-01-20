@interface GTObservableService
- (GTObservableService)init;
- (unint64_t)count;
- (unint64_t)registerObserver:(id)a3;
- (void)deregisterObserver:(unint64_t)a3;
- (void)deregisterObserversForConnection:(id)a3 path:(id)a4;
- (void)notifyAll:(id)a3;
@end

@implementation GTObservableService

- (GTObservableService)init
{
  v6.receiver = self;
  v6.super_class = (Class)GTObservableService;
  v2 = [(GTObservableService *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    observerIdToObserver = v2->_observerIdToObserver;
    v2->_observerIdToObserver = (NSMutableDictionary *)v3;

    v2->_nextObserverId = 1;
  }
  return v2;
}

- (unint64_t)registerObserver:(id)a3
{
  observerIdToObserver = self->_observerIdToObserver;
  unint64_t nextObserverId = self->_nextObserverId;
  self->_unint64_t nextObserverId = nextObserverId + 1;
  id v5 = a3;
  objc_super v6 = +[NSNumber numberWithUnsignedLongLong:nextObserverId];
  [(NSMutableDictionary *)observerIdToObserver setObject:v5 forKeyedSubscript:v6];

  return nextObserverId;
}

- (void)deregisterObserver:(unint64_t)a3
{
  observerIdToObserver = self->_observerIdToObserver;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)observerIdToObserver removeObjectForKey:v4];
}

- (void)deregisterObserversForConnection:(id)a3 path:(id)a4
{
  id v6 = a3;
  id v28 = a4;
  id v7 = objc_alloc((Class)NSMutableArray);
  id v8 = [(NSMutableDictionary *)self->_observerIdToObserver count];
  v9 = v7;
  v10 = v6;
  id v27 = [v9 initWithCapacity:v8];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obj = self->_observerIdToObserver;
  id v11 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  v29 = v6;
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v36;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        v16 = -[NSMutableDictionary objectForKeyedSubscript:](self->_observerIdToObserver, "objectForKeyedSubscript:", v15, v27);
        v17 = [v10 connection];
        v18 = [v16 connection];
        v19 = [v18 connection];
        if (v17 == v19)
        {
          v20 = [v16 replyPath];
          int v21 = MessagePathEndsWith(v20, v28);

          v10 = v29;
          if (v21) {
            [v27 addObject:v15];
          }
        }
        else
        {
        }
      }
      id v12 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v12);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v22 = v27;
  id v23 = [v22 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v32;
    do
    {
      for (j = 0; j != v24; j = (char *)j + 1)
      {
        if (*(void *)v32 != v25) {
          objc_enumerationMutation(v22);
        }
        -[GTObservableService deregisterObserver:](self, "deregisterObserver:", [*(id *)(*((void *)&v31 + 1) + 8 * (void)j) unsignedLongValue]);
      }
      id v24 = [v22 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v24);
  }
}

- (void)notifyAll:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_observerIdToObserver;
  id v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        v10 = -[NSMutableDictionary objectForKeyedSubscript:](self->_observerIdToObserver, "objectForKeyedSubscript:", *(void *)(*((void *)&v11 + 1) + 8 * (void)v9), (void)v11);
        v4[2](v4, v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (unint64_t)count
{
  return (unint64_t)[(NSMutableDictionary *)self->_observerIdToObserver count];
}

- (void).cxx_destruct
{
}

@end