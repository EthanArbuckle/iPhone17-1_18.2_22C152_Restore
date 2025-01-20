@interface BSUIDynamicArrayProvider
- (BOOL)loadsContent;
- (BSUIDynamicArrayProvider)initWithArray:(id)a3 options:(id)a4 dynamicArray:(id)a5;
- (NSString)uniqueId;
- (NSString)updateType;
- (OS_dispatch_queue)queue;
- (TUIMutableDynamicArray)dynamicArray;
- (id)arrayForGeneration:(id)a3;
- (id)currentGeneration;
- (id)objectAtIndex:(int64_t)a3 generation:(id)a4;
- (int64_t)countForGeneration:(id)a3;
- (void)_checkForDuplicates:(id)a3;
- (void)_moveUpdateForDynamicArray:(id)a3 newArray:(id)a4 updater:(id)a5;
- (void)_q_registerNewGenerationWithArray:(id)a3;
- (void)_replaceUpdateForDynamicArray:(id)a3 newArray:(id)a4 updater:(id)a5;
- (void)fetchDataForIndexes:(id)a3 generation:(id)a4 block:(id)a5;
- (void)fetchDataForRange:(_NSRange)a3 generation:(id)a4 block:(id)a5;
- (void)setDynamicArray:(id)a3;
- (void)setQueue:(id)a3;
- (void)setUniqueId:(id)a3;
- (void)setUpdateType:(id)a3;
- (void)updateArray:(id)a3 batchUpdatesBlock:(id)a4;
@end

@implementation BSUIDynamicArrayProvider

- (BSUIDynamicArrayProvider)initWithArray:(id)a3 options:(id)a4 dynamicArray:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)BSUIDynamicArrayProvider;
  v11 = [(BSUIDynamicArrayProvider *)&v23 init];
  if (v11)
  {
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("BSUIDynamicArrayProvider.queue", v12);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v13;

    uint64_t v15 = [v9 objectForKeyedSubscript:@"updateType"];
    v16 = (void *)v15;
    if (v15) {
      v17 = (__CFString *)v15;
    }
    else {
      v17 = @"replace";
    }
    objc_storeStrong((id *)&v11->_updateType, v17);

    uint64_t v18 = [v9 objectForKeyedSubscript:@"uniqueId"];
    uniqueId = v11->_uniqueId;
    v11->_uniqueId = (NSString *)v18;

    objc_opt_class();
    v20 = [v9 objectForKeyedSubscript:@"loadsContent"];
    v21 = BUDynamicCast();
    v11->_loadsContent = [v21 BOOLValue];

    [(BSUIDynamicArrayProvider *)v11 _checkForDuplicates:v8];
    [(BSUIDynamicArrayProvider *)v11 _q_registerNewGenerationWithArray:v8];
    objc_storeWeak((id *)&v11->_dynamicArray, v10);
  }

  return v11;
}

- (id)currentGeneration
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_22C34;
  id v10 = sub_22C44;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_22C4C;
  v5[3] = &unk_38E428;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)objectAtIndex:(int64_t)a3 generation:(id)a4
{
  v5 = [a4 data];
  uint64_t v6 = v5;
  if (a3 < 0 || (unint64_t)[v5 count] <= a3)
  {
    v7 = 0;
  }
  else
  {
    v7 = [v6 objectAtIndexedSubscript:a3];
  }

  return v7;
}

- (id)arrayForGeneration:(id)a3
{
  return [a3 data];
}

- (int64_t)countForGeneration:(id)a3
{
  id v3 = [a3 data];
  id v4 = [v3 count];

  return (int64_t)v4;
}

- (void)_checkForDuplicates:(id)a3
{
  id v4 = a3;
  v5 = [(BSUIDynamicArrayProvider *)self uniqueId];

  if (v5)
  {
    uint64_t v6 = [(BSUIDynamicArrayProvider *)self uniqueId];
    v7 = [v4 valueForKey:v6];

    uint64_t v8 = +[NSCountedSet setWithArray:v7];
    id v9 = +[NSMutableArray array];
    id v10 = [v8 count];
    if (v10 != [v7 count])
    {
      v19 = v7;
      id v20 = v4;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      uint64_t v18 = v8;
      id v11 = v8;
      id v12 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v22;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v22 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * i);
            if ((unint64_t)[v11 countForObject:v16] >= 2)
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                v17 = [(BSUIDynamicArrayProvider *)self uniqueId];
                *(_DWORD *)buf = 138412546;
                v26 = v17;
                __int16 v27 = 2112;
                uint64_t v28 = v16;
                _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "BSUIDynamicArrayProvider: entries with duplicate uniqueID (%@): %@", buf, 0x16u);
              }
              [v9 addObject:v16];
            }
          }
          id v13 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
        }
        while (v13);
      }

      v7 = v19;
      id v4 = v20;
      uint64_t v8 = v18;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
        sub_2DD384(v9);
      }
    }
  }
}

- (void)updateArray:(id)a3 batchUpdatesBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(BSUIDynamicArrayProvider *)self _checkForDuplicates:v6];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_23058;
  block[3] = &unk_38EC50;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

- (void)_q_registerNewGenerationWithArray:(id)a3
{
  id v4 = a3;
  v5 = [[_BSUIDynamicArrayGeneration alloc] initWithData:v4];

  id q_currentGeneration = self->q_currentGeneration;
  self->id q_currentGeneration = v5;
}

- (void)fetchDataForIndexes:(id)a3 generation:(id)a4 block:(id)a5
{
  id v7 = a4;
  uint64_t v8 = (void (**)(id, id))a5;
  id v9 = a3;
  id v10 = objc_opt_new();
  id v11 = [v7 data];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_233A0;
  v14[3] = &unk_38EC78;
  id v17 = [v11 count];
  id v15 = v11;
  id v12 = v10;
  id v16 = v12;
  id v13 = v11;
  [v9 enumerateIndexesUsingBlock:v14];

  if (v8) {
    v8[2](v8, v12);
  }
}

- (void)fetchDataForRange:(_NSRange)a3 generation:(id)a4 block:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v10 = (void (**)(id, void *))a5;
  uint64_t v8 = [a4 data];
  if (location + length <= (unint64_t)[v8 count])
  {
    id v9 = [v8 subarrayWithRange:location, length];
  }
  else
  {
    id v9 = 0;
  }
  if (v10) {
    v10[2](v10, v9);
  }
}

- (void)_moveUpdateForDynamicArray:(id)a3 newArray:(id)a4 updater:(id)a5
{
  id v57 = a3;
  id v8 = a4;
  id v53 = a5;
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  id v10 = objc_alloc_init((Class)NSMutableDictionary);
  id v56 = [v57 mutableCopy];
  id v11 = objc_alloc_init((Class)NSMutableSet);
  if ([v57 count])
  {
    unint64_t v12 = 0;
    do
    {
      id v13 = [v57 objectAtIndexedSubscript:v12, v53];
      uint64_t v14 = [(BSUIDynamicArrayProvider *)self uniqueId];
      id v15 = [v13 objectForKeyedSubscript:v14];
      [v11 addObject:v15];

      id v16 = [v57 objectAtIndexedSubscript:v12];
      id v17 = [(BSUIDynamicArrayProvider *)self uniqueId];
      uint64_t v18 = [v16 objectForKeyedSubscript:v17];
      [v9 setObject:0 forKeyedSubscript:v18];

      ++v12;
    }
    while (v12 < (unint64_t)[v57 count]);
  }
  v55 = v11;
  if (objc_msgSend(v8, "count", v53))
  {
    unint64_t v19 = 0;
    do
    {
      id v20 = [v8 objectAtIndexedSubscript:v19];
      long long v21 = [(BSUIDynamicArrayProvider *)self uniqueId];
      long long v22 = [v20 objectForKeyedSubscript:v21];
      unsigned int v23 = [v11 containsObject:v22];

      long long v24 = +[NSNumber numberWithUnsignedInteger:v19];
      v25 = [v8 objectAtIndexedSubscript:v19];
      v26 = [(BSUIDynamicArrayProvider *)self uniqueId];
      __int16 v27 = [v25 objectForKeyedSubscript:v26];
      if (v23) {
        uint64_t v28 = v9;
      }
      else {
        uint64_t v28 = v10;
      }
      [v28 setObject:v24 forKeyedSubscript:v27];

      id v11 = v55;
      ++v19;
    }
    while (v19 < (unint64_t)[v8 count]);
  }
  v29 = (char *)[v57 count];
  if (v29)
  {
    v30 = v29 - 1;
    do
    {
      v31 = [v57 objectAtIndexedSubscript:v30];
      v32 = [(BSUIDynamicArrayProvider *)self uniqueId];
      v33 = [v31 objectForKeyedSubscript:v32];
      v34 = [v9 objectForKeyedSubscript:v33];

      if (!v34)
      {
        [v54 deleteItemAtIndex:v30];
        [v56 removeObjectAtIndex:v30];
      }
      --v30;
    }
    while (v30 != (char *)-1);
  }
  if ([v8 count])
  {
    unint64_t v35 = 0;
    do
    {
      v36 = [v8 objectAtIndexedSubscript:v35];
      v37 = [(BSUIDynamicArrayProvider *)self uniqueId];
      v38 = [v36 objectForKeyedSubscript:v37];
      v39 = [v10 objectForKeyedSubscript:v38];

      if (v39)
      {
        [v54 insertItemAtIndex:v35];
        v40 = [v8 objectAtIndexedSubscript:v35];
        [v56 insertObject:v40 atIndex:v35];
      }
      ++v35;
    }
    while (v35 < (unint64_t)[v8 count]);
  }
  if ([v57 count])
  {
    unint64_t v41 = 0;
    do
    {
      v42 = [v57 objectAtIndexedSubscript:v41];
      v43 = [(BSUIDynamicArrayProvider *)self uniqueId];
      v44 = [v42 objectForKeyedSubscript:v43];
      v45 = [v9 objectForKeyedSubscript:v44];

      v46 = v57;
      if (v45)
      {
        v47 = [v57 objectAtIndexedSubscript:v41];
        v48 = [v47 objectForKeyedSubscript:self->_uniqueId];
        v49 = [v9 objectForKeyedSubscript:v48];
        id v50 = [v49 unsignedIntegerValue];

        if ((id)v41 == v50
          || ([v56 objectAtIndexedSubscript:v50],
              v51 = objc_claimAutoreleasedReturnValue(),
              [v8 objectAtIndexedSubscript:v50],
              v52 = objc_claimAutoreleasedReturnValue(),
              v52,
              v51,
              v51 == v52))
        {
          [v54 updateItemAtIndex:v41];
        }
        else
        {
          [v54 moveItemFromIndex:v41 toIndex:v50];
        }
        v46 = v57;
      }
      ++v41;
    }
    while (v41 < (unint64_t)[v46 count]);
  }
}

- (void)_replaceUpdateForDynamicArray:(id)a3 newArray:(id)a4 updater:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  id v8 = (char *)[a3 count];
  if (v8)
  {
    id v9 = v8 - 1;
    do
      [v7 deleteItemAtIndex:v9--];
    while (v9 != (char *)-1);
  }
  if ([v11 count])
  {
    unint64_t v10 = 0;
    do
      [v7 insertItemAtIndex:v10++];
    while (v10 < (unint64_t)[v11 count]);
  }
}

- (BOOL)loadsContent
{
  return self->_loadsContent;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (TUIMutableDynamicArray)dynamicArray
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dynamicArray);

  return (TUIMutableDynamicArray *)WeakRetained;
}

- (void)setDynamicArray:(id)a3
{
}

- (NSString)updateType
{
  return self->_updateType;
}

- (void)setUpdateType:(id)a3
{
}

- (NSString)uniqueId
{
  return self->_uniqueId;
}

- (void)setUniqueId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueId, 0);
  objc_storeStrong((id *)&self->_updateType, 0);
  objc_destroyWeak((id *)&self->_dynamicArray);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong(&self->q_currentGeneration, 0);
}

@end