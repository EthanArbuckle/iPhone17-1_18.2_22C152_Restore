@interface BSUIFeedTriggerBlockObserver
- (BSUIFeedTriggerBlockObserver)init;
- (NSMutableDictionary)observersByTrigger;
- (void)addObserver:(id)a3 forTrigger:(id)a4 inStateManager:(id)a5;
- (void)handleTrigger:(id)a3 didChangeState:(unint64_t)a4 updateEvent:(unint64_t)a5;
- (void)removeObserver:(id)a3 forTrigger:(id)a4 inStateManager:(id)a5;
- (void)setObserversByTrigger:(id)a3;
@end

@implementation BSUIFeedTriggerBlockObserver

- (BSUIFeedTriggerBlockObserver)init
{
  v6.receiver = self;
  v6.super_class = (Class)BSUIFeedTriggerBlockObserver;
  v2 = [(BSUIFeedTriggerBlockObserver *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    observersByTrigger = v2->_observersByTrigger;
    v2->_observersByTrigger = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)addObserver:(id)a3 forTrigger:(id)a4 inStateManager:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [(BSUIFeedTriggerBlockObserver *)self observersByTrigger];
  v11 = [v10 objectForKeyedSubscript:v8];

  if ([v11 count])
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    [v9 addObserver:self forTrigger:v8];
    if (v11) {
      goto LABEL_3;
    }
  }
  v11 = +[NSMutableSet set];
LABEL_3:
  id v12 = objc_retainBlock(v14);
  [v11 addObject:v12];

  v13 = [(BSUIFeedTriggerBlockObserver *)self observersByTrigger];
  [v13 setObject:v11 forKeyedSubscript:v8];
}

- (void)removeObserver:(id)a3 forTrigger:(id)a4 inStateManager:(id)a5
{
  id v14 = a4;
  id v7 = a3;
  id v8 = [(BSUIFeedTriggerBlockObserver *)self observersByTrigger];
  id v9 = [v8 objectForKeyedSubscript:v14];

  id v10 = objc_retainBlock(v7);
  [v9 removeObject:v10];

  id v11 = [v9 count];
  id v12 = [(BSUIFeedTriggerBlockObserver *)self observersByTrigger];
  v13 = v12;
  if (v11) {
    [v12 setObject:v9 forKeyedSubscript:v14];
  }
  else {
    [v12 removeObjectForKey:v14];
  }
}

- (void)handleTrigger:(id)a3 didChangeState:(unint64_t)a4 updateEvent:(unint64_t)a5
{
  id v6 = a3;
  id v7 = [(BSUIFeedTriggerBlockObserver *)self observersByTrigger];
  id v8 = [v7 objectForKeyedSubscript:v6];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = (void (**)(id, void *))objc_retainBlock(*(id *)(*((void *)&v16 + 1) + 8 * (void)v13));
        if (v14)
        {
          v15 = NSStringFromTUITriggerState();
          v14[2](v14, v15);
        }
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
}

- (NSMutableDictionary)observersByTrigger
{
  return self->_observersByTrigger;
}

- (void)setObserversByTrigger:(id)a3
{
}

- (void).cxx_destruct
{
}

@end