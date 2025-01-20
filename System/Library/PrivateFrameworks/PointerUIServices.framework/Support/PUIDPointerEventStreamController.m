@interface PUIDPointerEventStreamController
- (void)addPointerEventStreamObserver:(id)a3;
- (void)handleEvent:(id)a3;
- (void)removePointerEventStreamObserver:(id)a3;
@end

@implementation PUIDPointerEventStreamController

- (void)addPointerEventStreamObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    v6 = +[NSHashTable weakObjectsHashTable];
    v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)removePointerEventStreamObserver:(id)a3
{
  [(NSHashTable *)self->_observers removeObject:a3];
  if (![(NSHashTable *)self->_observers count])
  {
    observers = self->_observers;
    self->_observers = 0;
  }
}

- (void)handleEvent:(id)a3
{
  id v4 = [a3 _hidEvent];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = sub_10001663C((uint64_t)v4);
    v7 = [(NSHashTable *)self->_observers allObjects];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (v6) {
            [v12 pointerEventStreamProvider:self didReceivePointerEvent:v6];
          }
          else {
            [v12 pointerEventStreamProvider:self didReceiveNonPointerEvent:v5];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
}

- (void).cxx_destruct
{
}

@end