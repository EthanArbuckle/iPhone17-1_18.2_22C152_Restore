@interface TUIVisibilityTracker
- (TUIVisibilityTracker)initWithThreshold:(double)a3 block:(id)a4 queue:(id)a5;
- (void)addVisibilityObserver:(id)a3;
- (void)enumerateAttributesInSection:(id)a3 block:(id)a4;
- (void)q_notifyObserversWithRootNode:(id)a3 time:(double)a4;
- (void)removeVisibilityObserver:(id)a3;
@end

@implementation TUIVisibilityTracker

- (TUIVisibilityTracker)initWithThreshold:(double)a3 block:(id)a4 queue:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TUIVisibilityTracker;
  v10 = [(TUIVisibilityTracker *)&v17 init];
  v11 = v10;
  if (v10)
  {
    v10->_threshold = a3;
    id v12 = [v8 copy];
    id block = v11->_block;
    v11->_id block = v12;

    objc_storeStrong((id *)&v11->_queue, a5);
    uint64_t v14 = +[NSHashTable hashTableWithOptions:517];
    q_observers = v11->_q_observers;
    v11->_q_observers = (NSHashTable *)v14;
  }
  return v11;
}

- (void)addVisibilityObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, v4);
  double v5 = sub_1A768();
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1A7B0;
  v7[3] = &unk_251BE8;
  objc_copyWeak(v8, &location);
  v7[4] = self;
  v8[1] = *(id *)&v5;
  dispatch_async(queue, v7);
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

- (void)removeVisibilityObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, v4);
  double v5 = sub_1A768();
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1A96C;
  v7[3] = &unk_251BE8;
  objc_copyWeak(v8, &location);
  v7[4] = self;
  v8[1] = *(id *)&v5;
  dispatch_async(queue, v7);
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

- (void)q_notifyObserversWithRootNode:(id)a3 time:(double)a4
{
  id v6 = a3;
  v7 = [[TUIVisibilityChangeRecord alloc] initWithLastTimestamp:v6 timestamp:self->_q_lastTimestamp rootNode:a4];
  self->_q_lastTimestamp = a4;
  id v8 = [(TUIVisibilityChangeRecord *)v7 rootNode];
  q_lastVisible = self->_q_lastVisible;
  self->_q_lastVisible = v8;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_q_observers;
  id v11 = [(NSHashTable *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * (void)v14) visibleContentsChanged:v7 (void)v15];
        uint64_t v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [(NSHashTable *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (void)enumerateAttributesInSection:(id)a3 block:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_q_lastVisible, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_q_observers, 0);

  objc_storeStrong(&self->_block, 0);
}

@end