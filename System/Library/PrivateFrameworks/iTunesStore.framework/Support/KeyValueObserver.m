@interface KeyValueObserver
- (KeyValueObserver)init;
- (id)observeObject:(id)a3 keyPath:(id)a4 options:(unint64_t)a5 usingBlock:(id)a6;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeObserver:(id)a3;
@end

@implementation KeyValueObserver

- (KeyValueObserver)init
{
  v4.receiver = self;
  v4.super_class = (Class)KeyValueObserver;
  v2 = [(KeyValueObserver *)&v4 init];
  if (v2)
  {
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunesstored.KeyValueObserver", 0);
    v2->_observers = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  return v2;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_dispatchQueue);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  observers = self->_observers;
  id v4 = [(NSMutableArray *)observers countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(observers);
        }
        objc_msgSend(objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "object"), "removeObserver:forKeyPath:context:", self, objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "keyPath"), *(void *)(*((void *)&v9 + 1) + 8 * i));
      }
      id v5 = [(NSMutableArray *)observers countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)KeyValueObserver;
  [(KeyValueObserver *)&v8 dealloc];
}

- (id)observeObject:(id)a3 keyPath:(id)a4 options:(unint64_t)a5 usingBlock:(id)a6
{
  long long v10 = [[KeyValueObserverItem alloc] initWithObject:a3 keyPath:a4 block:a6];
  dispatchQueue = self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10011B8A8;
  v13[3] = &unk_1003A3380;
  v13[4] = self;
  v13[5] = v10;
  dispatch_sync(dispatchQueue, v13);
  [a3 addObserver:self forKeyPath:a4 options:a5 context:v10];
  return v10;
}

- (void)removeObserver:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10011B928;
  v4[3] = &unk_1003A3380;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v8 = objc_msgSend(a6, "block", a3, a4);
  if (v8)
  {
    long long v9 = v8;
    long long v10 = self;
    long long v11 = (void (*)(void *, id))v9[2];
    v11(v9, a5);
  }
}

@end