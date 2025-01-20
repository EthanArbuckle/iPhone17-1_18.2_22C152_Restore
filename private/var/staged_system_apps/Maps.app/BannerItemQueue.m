@interface BannerItemQueue
- (BannerItemQueue)init;
- (id)popItem;
- (void)addItem:(id)a3;
- (void)removeAllItems;
- (void)removeItemsOfType:(Class)a3;
@end

@implementation BannerItemQueue

- (BannerItemQueue)init
{
  v8.receiver = self;
  v8.super_class = (Class)BannerItemQueue;
  v2 = [(BannerItemQueue *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    dequeuedOrder = v2->_dequeuedOrder;
    v2->_dequeuedOrder = (NSMutableOrderedSet *)v3;

    uint64_t v5 = objc_opt_new();
    queueByClass = v2->_queueByClass;
    v2->_queueByClass = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (void)addItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_queueByClass objectForKeyedSubscript:objc_opt_class()];
  v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = (id)objc_opt_new();
  }
  objc_super v8 = v7;

  if (![v8 count]) {
    goto LABEL_10;
  }
  uint64_t v9 = 0;
  while (1)
  {
    v10 = [v8 objectAtIndexedSubscript:v9];
    v11 = [v10 uniqueId];
    v12 = [v4 uniqueId];
    unsigned __int8 v13 = [v11 isEqualToString:v12];

    if (v13) {
      break;
    }
    if (++v9 >= (unint64_t)[v8 count]) {
      goto LABEL_10;
    }
  }
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = sub_1000AD30C();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = [v8 objectAtIndexedSubscript:v9];
      int v17 = 138412546;
      id v18 = v16;
      __int16 v19 = 2112;
      id v20 = v4;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Replacing item %@ with %@", (uint8_t *)&v17, 0x16u);
    }
    [v8 replaceObjectAtIndex:v9 withObject:v4];
  }
  else
  {
LABEL_10:
    v14 = sub_1000AD30C();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v17 = 138412290;
      id v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Adding item %@", (uint8_t *)&v17, 0xCu);
    }

    [v8 addObject:v4];
  }
  [(NSMutableDictionary *)self->_queueByClass setObject:v8 forKeyedSubscript:objc_opt_class()];
}

- (void)removeItemsOfType:(Class)a3
{
  uint64_t v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_queueByClass, "objectForKeyedSubscript:");
  id v6 = [v5 count];

  if (v6)
  {
    id v7 = sub_1000AD30C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 134218242;
      id v10 = v6;
      __int16 v11 = 2112;
      Class v12 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Removing %lu instance(s) of %@", (uint8_t *)&v9, 0x16u);
    }

    objc_super v8 = [(NSMutableDictionary *)self->_queueByClass objectForKeyedSubscript:a3];
    [v8 removeAllObjects];
  }
}

- (void)removeAllItems
{
  uint64_t v3 = sub_1000AD30C();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);

  if (v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = [(NSMutableDictionary *)self->_queueByClass allValues];
    id v6 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v5);
          }
          v8 += (uint64_t)[*(id *)(*((void *)&v12 + 1) + 8 * i) count];
        }
        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
      }
      while (v7);
    }
    else
    {
      uint64_t v8 = 0;
    }

    __int16 v11 = sub_1000AD30C();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Removing all (%lu) instance(s)", buf, 0xCu);
    }
  }
  [(NSMutableDictionary *)self->_queueByClass removeAllObjects];
}

- (id)popItem
{
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v3 = self->_queueByClass;
  id v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v28 objects:v35 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v29;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v29 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = *(void *)(*((void *)&v28 + 1) + 8 * v7);
      uint64_t v9 = [(NSMutableDictionary *)self->_queueByClass objectForKeyedSubscript:v8];
      if ([v9 count])
      {
        if (([(NSMutableOrderedSet *)self->_dequeuedOrder containsObject:v8] & 1) == 0) {
          break;
        }
      }

      if (v5 == (id)++v7)
      {
        id v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v28 objects:v35 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    id v10 = sub_1000AD30C();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Dequeuing from new queue: %@", buf, 0xCu);
    }

    if (v9) {
      goto LABEL_27;
    }
  }
  else
  {
LABEL_10:
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  __int16 v11 = [(NSMutableOrderedSet *)self->_dequeuedOrder reverseObjectEnumerator];
  id v12 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v25;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v9 = [(NSMutableDictionary *)self->_queueByClass objectForKeyedSubscript:*(void *)(*((void *)&v24 + 1) + 8 * i)];
        if ([v9 count])
        {
          v16 = sub_1000AD30C();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v34 = v9;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Dequeuing from oldest queue: %@", buf, 0xCu);
          }

          goto LABEL_26;
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  uint64_t v9 = 0;
LABEL_26:

LABEL_27:
  uint64_t v17 = [v9 firstObject];
  if (v17)
  {
    uint64_t v18 = objc_opt_class();
    [(NSMutableOrderedSet *)self->_dequeuedOrder removeObject:v18];
    [(NSMutableOrderedSet *)self->_dequeuedOrder insertObject:v18 atIndex:0];
    [v9 removeObjectAtIndex:0];
    __int16 v19 = sub_1000AD30C();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      goto LABEL_33;
    }
    *(_DWORD *)buf = 138412290;
    v34 = v17;
    id v20 = "Dequeued item: %@";
    v21 = v19;
    uint32_t v22 = 12;
  }
  else
  {
    __int16 v19 = sub_1000AD30C();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      goto LABEL_33;
    }
    *(_WORD *)buf = 0;
    id v20 = "No items to dequeue";
    v21 = v19;
    uint32_t v22 = 2;
  }
  _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, v20, buf, v22);
LABEL_33:

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queueByClass, 0);

  objc_storeStrong((id *)&self->_dequeuedOrder, 0);
}

@end