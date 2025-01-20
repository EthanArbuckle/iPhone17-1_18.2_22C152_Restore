@interface MILimitedConcurrencyQueue
- (MILimitedConcurrencyQueue)initWithName:(id)a3 width:(unint64_t)a4;
- (NSMutableArray)identifierQueue;
- (NSMutableDictionary)waitingOperations;
- (NSMutableSet)activeIdentifiers;
- (OS_dispatch_queue)internalQueue;
- (unint64_t)width;
- (void)_onQueue_deQueueIfNeeded;
- (void)_onQueue_runAsyncForIdentifier:(id)a3 description:(id)a4 operation:(id)a5;
- (void)runAsyncForIdentifier:(id)a3 description:(id)a4 operation:(id)a5;
@end

@implementation MILimitedConcurrencyQueue

- (MILimitedConcurrencyQueue)initWithName:(id)a3 width:(unint64_t)a4
{
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MILimitedConcurrencyQueue;
  v7 = [(MILimitedConcurrencyQueue *)&v20 init];
  v8 = v7;
  if (v7)
  {
    v7->_width = a4;
    v9 = (const char *)[v6 UTF8String];
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create(v9, v10);
    internalQueue = v8->_internalQueue;
    v8->_internalQueue = (OS_dispatch_queue *)v11;

    uint64_t v13 = +[NSMutableDictionary dictionaryWithCapacity:0];
    waitingOperations = v8->_waitingOperations;
    v8->_waitingOperations = (NSMutableDictionary *)v13;

    uint64_t v15 = +[NSMutableSet setWithCapacity:0];
    activeIdentifiers = v8->_activeIdentifiers;
    v8->_activeIdentifiers = (NSMutableSet *)v15;

    uint64_t v17 = +[NSMutableArray arrayWithCapacity:0];
    identifierQueue = v8->_identifierQueue;
    v8->_identifierQueue = (NSMutableArray *)v17;
  }
  return v8;
}

- (void)runAsyncForIdentifier:(id)a3 description:(id)a4 operation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_queue_t v11 = [(MILimitedConcurrencyQueue *)self internalQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000B528;
  v15[3] = &unk_100020AE8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)_onQueue_deQueueIfNeeded
{
  v3 = [(MILimitedConcurrencyQueue *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  v4 = [(MILimitedConcurrencyQueue *)self waitingOperations];
  id v5 = [v4 count];

  if (v5)
  {
    id v6 = [(MILimitedConcurrencyQueue *)self activeIdentifiers];
    id v7 = [v6 count];
    unint64_t v8 = [(MILimitedConcurrencyQueue *)self width];

    if ((unint64_t)v7 >= v8)
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
      {
        id v32 = [(MILimitedConcurrencyQueue *)self activeIdentifiers];
        [v32 count];
        [(MILimitedConcurrencyQueue *)self width];
        MOLogWrite();
      }
    }
    else
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v9 = [(MILimitedConcurrencyQueue *)self identifierQueue];
      id v10 = [v9 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v38;
LABEL_5:
        uint64_t v13 = 0;
        while (1)
        {
          if (*(void *)v38 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v37 + 1) + 8 * v13);
          uint64_t v15 = [(MILimitedConcurrencyQueue *)self activeIdentifiers];
          unsigned int v16 = [v15 containsObject:v14];

          if (!v16) {
            break;
          }
          if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
          {
            id v30 = v14;
            MOLogWrite();
          }
          if (v11 == (id)++v13)
          {
            id v11 = [v9 countByEnumeratingWithState:&v37 objects:v41 count:16];
            if (v11) {
              goto LABEL_5;
            }
            goto LABEL_14;
          }
        }
        id v17 = v14;

        if (!v17) {
          goto LABEL_34;
        }
        id v18 = [(MILimitedConcurrencyQueue *)self waitingOperations];
        v19 = [v18 objectForKeyedSubscript:v17];

        if (v19)
        {
          if ([v19 count])
          {
            objc_super v20 = [v19 objectAtIndex:0];
            [v19 removeObjectAtIndex:0];
            if ([v19 count])
            {
              v21 = [(MILimitedConcurrencyQueue *)self identifierQueue];
              id v22 = [v21 count];

              if (v22 == (id)1) {
                goto LABEL_48;
              }
              if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
              {
                id v30 = v17;
                MOLogWrite();
              }
              v23 = [(MILimitedConcurrencyQueue *)self identifierQueue];
              [v23 removeObject:v17];

              v24 = [(MILimitedConcurrencyQueue *)self identifierQueue];
              [v24 addObject:v17];
            }
            else
            {
              if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
              {
                id v30 = v17;
                MOLogWrite();
              }
              v25 = [(MILimitedConcurrencyQueue *)self waitingOperations];
              [v25 removeObjectForKey:v17];

              v24 = [(MILimitedConcurrencyQueue *)self identifierQueue];
              [v24 removeObject:v17];
            }

LABEL_48:
            if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
            {
              [v20 descString];
              v31 = id v30 = v17;
              MOLogWrite();
            }
            v26 = [(MILimitedConcurrencyQueue *)self activeIdentifiers];
            [v26 addObject:v17];

            qos_class_t v27 = qos_class_self();
            v28 = dispatch_get_global_queue(v27, 0);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_10000BB1C;
            block[3] = &unk_100020B10;
            id v34 = v20;
            v35 = self;
            id v36 = v17;
            id v29 = v20;
            dispatch_async(v28, block);

            goto LABEL_52;
          }
          if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
          {
LABEL_52:

            return;
          }
        }
        else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        {
          goto LABEL_52;
        }
        MOLogWrite();
        goto LABEL_52;
      }
LABEL_14:

LABEL_34:
      if (gLogHandle)
      {
        if (*(int *)(gLogHandle + 44) >= 7) {
          MOLogWrite();
        }
      }
    }
  }
  else if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    MOLogWrite();
  }
}

- (void)_onQueue_runAsyncForIdentifier:(id)a3 description:(id)a4 operation:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(MILimitedConcurrencyQueue *)self internalQueue];
  dispatch_assert_queue_V2(v10);

  if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    id v18 = v20;
    id v19 = v8;
    MOLogWrite();
  }
  id v11 = [(MILimitedConcurrencyQueue *)self waitingOperations];
  uint64_t v12 = [v11 objectForKeyedSubscript:v20];

  if (!v12)
  {
    uint64_t v12 = +[NSMutableArray arrayWithCapacity:1];
    uint64_t v13 = [(MILimitedConcurrencyQueue *)self waitingOperations];
    [v13 setObject:v12 forKeyedSubscript:v20];
  }
  id v14 = [[MILimitedConcurrencyOperation alloc] initWithBlock:v9 description:v8];

  [v12 addObject:v14];
  uint64_t v15 = [(MILimitedConcurrencyQueue *)self identifierQueue];
  unsigned __int8 v16 = [v15 containsObject:v20];

  if ((v16 & 1) == 0)
  {
    id v17 = [(MILimitedConcurrencyQueue *)self identifierQueue];
    [v17 addObject:v20];
  }
  [(MILimitedConcurrencyQueue *)self _onQueue_deQueueIfNeeded];
}

- (unint64_t)width
{
  return self->_width;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (NSMutableDictionary)waitingOperations
{
  return self->_waitingOperations;
}

- (NSMutableSet)activeIdentifiers
{
  return self->_activeIdentifiers;
}

- (NSMutableArray)identifierQueue
{
  return self->_identifierQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierQueue, 0);
  objc_storeStrong((id *)&self->_activeIdentifiers, 0);
  objc_storeStrong((id *)&self->_waitingOperations, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end