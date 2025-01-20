@interface NRSimpleReferenceCounter
- (BOOL)containsObject:(id)a3;
- (NRSimpleReferenceCounter)initWithIdentifier:(id)a3 allocateBlock:(id)a4 freeBlock:(id)a5 queue:(id)a6 async:(BOOL)a7;
- (id)description;
- (id)didAddBlock;
- (id)didRemoveBlock;
- (unint64_t)count;
- (void)_clearWithCleanupBlock:(id)a3;
- (void)_justDoItWithBlock:(id)a3;
- (void)addObject:(id)a3;
- (void)addObject:(id)a3 withAllocationBlock:(id)a4;
- (void)clear;
- (void)clearWithCleanupBlock:(id)a3;
- (void)enumerateObjects:(id)a3;
- (void)removeAllObjectsWithCleanupBlock:(id)a3;
- (void)removeObject:(id)a3;
- (void)removeObject:(id)a3 withCleanupBlock:(id)a4;
- (void)setDidAddBlock:(id)a3;
- (void)setDidRemoveBlock:(id)a3;
@end

@implementation NRSimpleReferenceCounter

- (NRSimpleReferenceCounter)initWithIdentifier:(id)a3 allocateBlock:(id)a4 freeBlock:(id)a5 queue:(id)a6 async:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v26.receiver = self;
  v26.super_class = (Class)NRSimpleReferenceCounter;
  v17 = [(NRSimpleReferenceCounter *)&v26 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_identifier, a3);
    id v19 = objc_retainBlock(v14);
    id allocateBlock = v18->_allocateBlock;
    v18->_id allocateBlock = v19;

    id v21 = objc_retainBlock(v15);
    id freeBlock = v18->_freeBlock;
    v18->_id freeBlock = v21;

    objc_storeStrong((id *)&v18->_queue, a6);
    v18->_async = a7;
    v18->_mapLock._os_unfair_lock_opaque = 0;
    uint64_t v23 = +[NSMapTable strongToStrongObjectsMapTable];
    map = v18->_map;
    v18->_map = (NSMapTable *)v23;
  }
  return v18;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 initWithFormat:@"%@[%@]", v5, self->_identifier];

  return v6;
}

- (void)_justDoItWithBlock:(id)a3
{
  v4 = (uint64_t (**)(void))a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    dispatch_block_t block = v5;
    if (queue)
    {
      if (self->_async)
      {
        dispatch_async((dispatch_queue_t)queue, v5);
      }
      else
      {
        dispatch_assert_queue_not_V2((dispatch_queue_t)queue);
        dispatch_sync((dispatch_queue_t)self->_queue, block);
      }
    }
    else
    {
      v4 = (uint64_t (**)(void))v5[2](v5);
    }
    v5 = (uint64_t (**)(void))block;
  }

  _objc_release_x1(v4, v5);
}

- (void)_clearWithCleanupBlock:(id)a3
{
  v4 = (void (**)(id, uint64_t))a3;
  os_unfair_lock_lock(&self->_mapLock);
  v5 = [(NSMapTable *)self->_map dictionaryRepresentation];
  [(NSMapTable *)self->_map removeAllObjects];
  os_unfair_lock_unlock(&self->_mapLock);
  if ([v5 count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v5;
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [v6 objectForKeyedSubscript:*(void *)(*((void *)&v14 + 1) + 8 * (void)v10), (void)v14];
          didRemoveBlock = (void (**)(id, void *))self->_didRemoveBlock;
          if (didRemoveBlock) {
            didRemoveBlock[2](didRemoveBlock, v11);
          }

          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    if (v4) {
      v4[2](v4, 1);
    }
    id freeBlock = (void (**)(void))self->_freeBlock;
    if (freeBlock) {
      freeBlock[2]();
    }
  }
  else if (v4)
  {
    v4[2](v4, 0);
  }
}

- (void)clearWithCleanupBlock:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10009DF84;
  v4[3] = &unk_100166210;
  v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(NRSimpleReferenceCounter *)v5 _justDoItWithBlock:v4];
}

- (void)clear
{
}

- (void)addObject:(id)a3
{
}

- (void)addObject:(id)a3 withAllocationBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = nr_daemon_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    v10 = nr_daemon_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      *(_DWORD *)buf = 138412802;
      v20 = v12;
      __int16 v21 = 2048;
      id v22 = v6;
      __int16 v23 = 2112;
      v24 = self;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Requesting to add object %@[%p] to %@", buf, 0x20u);
    }
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10009E138;
  v15[3] = &unk_100166838;
  id v16 = v6;
  long long v17 = self;
  id v18 = v7;
  id v13 = v7;
  id v14 = v6;
  [(NRSimpleReferenceCounter *)self _justDoItWithBlock:v15];
}

- (void)removeObject:(id)a3 withCleanupBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = nr_daemon_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    v10 = nr_daemon_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      *(_DWORD *)buf = 138412802;
      v20 = v12;
      __int16 v21 = 2048;
      id v22 = v6;
      __int16 v23 = 2112;
      v24 = self;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Requesting to remove object %@[%p] from %@", buf, 0x20u);
    }
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10009E5D0;
  v15[3] = &unk_100166838;
  id v16 = v6;
  long long v17 = self;
  id v18 = v7;
  id v13 = v7;
  id v14 = v6;
  [(NRSimpleReferenceCounter *)self _justDoItWithBlock:v15];
}

- (void)removeObject:(id)a3
{
}

- (void)removeAllObjectsWithCleanupBlock:(id)a3
{
}

- (void)enumerateObjects:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10009EB30;
    v6[3] = &unk_100166210;
    v6[4] = self;
    id v7 = v4;
    [(NRSimpleReferenceCounter *)self _justDoItWithBlock:v6];
  }
}

- (BOOL)containsObject:(id)a3
{
  id v4 = +[NSValue valueWithNonretainedObject:a3];
  p_mapLock = &self->_mapLock;
  os_unfair_lock_lock(&self->_mapLock);
  id v6 = [(NSMapTable *)self->_map objectForKey:v4];
  LOBYTE(self) = v6 != 0;

  os_unfair_lock_unlock(p_mapLock);
  return (char)self;
}

- (unint64_t)count
{
  p_mapLock = &self->_mapLock;
  os_unfair_lock_lock(&self->_mapLock);
  unint64_t v4 = [(NSMapTable *)self->_map count];
  os_unfair_lock_unlock(p_mapLock);
  return v4;
}

- (id)didAddBlock
{
  return self->_didAddBlock;
}

- (void)setDidAddBlock:(id)a3
{
}

- (id)didRemoveBlock
{
  return self->_didRemoveBlock;
}

- (void)setDidRemoveBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didRemoveBlock, 0);
  objc_storeStrong(&self->_didAddBlock, 0);
  objc_storeStrong((id *)&self->_map, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_freeBlock, 0);
  objc_storeStrong(&self->_allocateBlock, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end