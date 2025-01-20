@interface CKKSListenerCollection
- (CKKSListenerCollection)initWithName:(id)a3;
- (NSMapTable)listeners;
- (NSString)name;
- (id)description;
- (void)iterateListeners:(id)a3;
- (void)registerListener:(id)a3;
- (void)setListeners:(id)a3;
- (void)setName:(id)a3;
@end

@implementation CKKSListenerCollection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeners, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setListeners:(id)a3
{
}

- (NSMapTable)listeners
{
  return (NSMapTable *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)iterateListeners:(id)a3
{
  id v4 = a3;
  id obj = [(CKKSListenerCollection *)self listeners];
  objc_sync_enter(obj);
  v5 = [(CKKSListenerCollection *)self listeners];
  v6 = [v5 keyEnumerator];

  for (i = 0; ; i = v8)
  {
    v8 = [v6 nextObject:obj];

    if (!v8) {
      break;
    }
    v9 = [(CKKSListenerCollection *)self listeners];
    v10 = [v9 objectForKey:v8];

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v10);
    if (v10)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1001260BC;
      block[3] = &unk_100306A38;
      objc_copyWeak(&v14, &location);
      id v13 = v4;
      dispatch_async(v8, block);

      objc_destroyWeak(&v14);
    }
    objc_destroyWeak(&location);
  }
  objc_sync_exit(obj);
}

- (void)registerListener:(id)a3
{
  id v17 = a3;
  id v4 = [(CKKSListenerCollection *)self listeners];
  objc_sync_enter(v4);
  v5 = [(CKKSListenerCollection *)self listeners];
  v6 = [v5 objectEnumerator];

  char v7 = 0;
  for (i = 0; ; i = (void *)v9)
  {
    uint64_t v9 = [v6 nextObject];

    if (!v9) {
      break;
    }
    v7 |= v9 == (void)v17;
  }
  if (!((v17 == 0) | v7 & 1))
  {
    v10 = [(CKKSListenerCollection *)self name];
    v11 = +[NSString stringWithFormat:@"%@-%@", v10, v17];

    id v12 = v11;
    id v13 = (const char *)[v12 UTF8String];
    id v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create(v13, v14);

    v16 = [(CKKSListenerCollection *)self listeners];
    [v16 setObject:v17 forKey:v15];
  }
  objc_sync_exit(v4);
}

- (id)description
{
  v3 = [(CKKSListenerCollection *)self listeners];
  objc_sync_enter(v3);
  id v4 = [(CKKSListenerCollection *)self name];
  v5 = [(CKKSListenerCollection *)self listeners];
  v6 = [v5 objectEnumerator];
  char v7 = [v6 allObjects];
  v8 = +[NSString stringWithFormat:@"<CKKSListenerCollection(%@): %@>", v4, v7];

  objc_sync_exit(v3);

  return v8;
}

- (CKKSListenerCollection)initWithName:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKKSListenerCollection;
  v6 = [(CKKSListenerCollection *)&v11 init];
  char v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    uint64_t v8 = +[NSMapTable strongToWeakObjectsMapTable];
    listeners = v7->_listeners;
    v7->_listeners = (NSMapTable *)v8;
  }
  return v7;
}

@end