@interface AEBookProtocolCacheItemProvider
+ (AEBookProtocolCacheItemProvider)sharedInstance;
- (AEBookProtocolCacheItemProvider)init;
- (NSMutableDictionary)bookCache;
- (id)cacheItemForDatabaseKey:(id)a3;
- (os_unfair_lock_s)unfairLock;
- (void)_performWithLock:(id)a3;
- (void)clearCache;
- (void)clearCacheForDatabaseKey:(id)a3;
- (void)clearCacheForDatabaseKeys:(id)a3;
- (void)setBookCache:(id)a3;
- (void)setUnfairLock:(os_unfair_lock_s)a3;
@end

@implementation AEBookProtocolCacheItemProvider

+ (AEBookProtocolCacheItemProvider)sharedInstance
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_22B5B8);
  id WeakRetained = objc_loadWeakRetained(&qword_22B5C0);

  if (WeakRetained)
  {
    v3 = (AEBookProtocolCacheItemProvider *)objc_loadWeakRetained(&qword_22B5C0);
  }
  else
  {
    v3 = objc_alloc_init(AEBookProtocolCacheItemProvider);
    objc_storeWeak(&qword_22B5C0, v3);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_22B5B8);

  return v3;
}

- (AEBookProtocolCacheItemProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)AEBookProtocolCacheItemProvider;
  v2 = [(AEBookProtocolCacheItemProvider *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    bookCache = v2->_bookCache;
    v2->_bookCache = v3;

    v2->_unfairLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)clearCache
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_93FE8;
  v2[3] = &unk_1DAB88;
  v2[4] = self;
  [(AEBookProtocolCacheItemProvider *)self _performWithLock:v2];
}

- (void)clearCacheForDatabaseKey:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_94094;
    v5[3] = &unk_1DBF08;
    v5[4] = self;
    id v6 = v4;
    [(AEBookProtocolCacheItemProvider *)self _performWithLock:v5];
  }
}

- (void)clearCacheForDatabaseKeys:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_94140;
    v5[3] = &unk_1DBF08;
    v5[4] = self;
    id v6 = v4;
    [(AEBookProtocolCacheItemProvider *)self _performWithLock:v5];
  }
}

- (id)cacheItemForDatabaseKey:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x3032000000;
    v13 = sub_942A8;
    v14 = sub_942B8;
    id v15 = 0;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_942C0;
    v7[3] = &unk_1DCE38;
    v9 = &v10;
    v7[4] = self;
    id v8 = v4;
    [(AEBookProtocolCacheItemProvider *)self _performWithLock:v7];
    id v5 = (id)v11[5];

    _Block_object_dispose(&v10, 8);
  }
  else
  {
    BCReportAssertionFailureWithMessage();
    id v5 = 0;
  }

  return v5;
}

- (void)_performWithLock:(id)a3
{
  if (a3)
  {
    p_unfairLock = &self->_unfairLock;
    id v4 = (void (**)(void))a3;
    os_unfair_lock_lock(p_unfairLock);
    v4[2](v4);

    os_unfair_lock_unlock(p_unfairLock);
  }
}

- (NSMutableDictionary)bookCache
{
  return self->_bookCache;
}

- (void)setBookCache:(id)a3
{
}

- (os_unfair_lock_s)unfairLock
{
  return self->_unfairLock;
}

- (void)setUnfairLock:(os_unfair_lock_s)a3
{
  self->_unfairLock = a3;
}

- (void).cxx_destruct
{
}

@end