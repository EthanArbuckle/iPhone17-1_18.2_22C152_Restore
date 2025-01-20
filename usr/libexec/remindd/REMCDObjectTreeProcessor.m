@interface REMCDObjectTreeProcessor
- (REMCDObjectTreeProcessor)initWithTraversalOrder:(unint64_t)a3 batchSize:(unint64_t)a4 delegate:(id)a5;
- (REMCDObjectTreeProcessorDelegate)delegate;
- (id)_flushIfNeeded:(id)a3;
- (id)_flushRemaining:(id)a3;
- (id)traverse:(id)a3;
- (id)traverseByPostOrder:(id)a3;
- (unint64_t)batchSize;
- (unint64_t)traversalOrder;
- (void)setDelegate:(id)a3;
@end

@implementation REMCDObjectTreeProcessor

- (REMCDObjectTreeProcessor)initWithTraversalOrder:(unint64_t)a3 batchSize:(unint64_t)a4 delegate:(id)a5
{
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)REMCDObjectTreeProcessor;
  v9 = [(REMCDObjectTreeProcessor *)&v12 init];
  v10 = v9;
  if (v9)
  {
    v9->_traversalOrder = a3;
    v9->_batchSize = a4;
    objc_storeWeak((id *)&v9->_delegate, v8);
  }

  return v10;
}

- (id)traverse:(id)a3
{
  id v4 = a3;
  if ([(REMCDObjectTreeProcessor *)self traversalOrder])
  {
    +[NSException raise:NSInternalInconsistencyException, @"REMCDObjectTreeProcessor: Unsupported traversal order {%ld}", [(REMCDObjectTreeProcessor *)self traversalOrder] format];
    v5 = &__NSArray0__struct;
  }
  else
  {
    v5 = [(REMCDObjectTreeProcessor *)self traverseByPostOrder:v4];
  }

  return v5;
}

- (id)traverseByPostOrder:(id)a3
{
  id v4 = a3;
  v5 = +[NSDate date];
  v6 = INDateRelevanceProvider_ptr;
  v7 = +[REMLogStore write];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = [v4 identifier];
    *(_DWORD *)buf = 138543618;
    id v45 = v8;
    __int16 v46 = 2048;
    unint64_t v47 = [(REMCDObjectTreeProcessor *)self batchSize];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "REMCDObjectTreeProcessor: START traversing post-order from {rootNode: %{public}@, batchSize: %ld}", buf, 0x16u);
  }
  v9 = +[NSMutableArray array];
  id v10 = objc_alloc_init((Class)NSMutableOrderedSet);
  v11 = +[NSMutableArray arrayWithObject:v4];
  id v12 = v4;
  v43 = v12;
  if ([v11 count])
  {
    v13 = 0;
    v39 = &v53;
    v40 = v5;
    v14 = v12;
    v41 = v9;
    do
    {
      if ([v14 expanded])
      {

        v13 = 0;
      }
      else
      {
        v16 = [(REMCDObjectTreeProcessor *)self delegate];
        unsigned int v17 = [v16 preprocessTreeNode:v14];

        if (v17)
        {
          v18 = [v14 childrenNodes];
          v19 = [v18 reverseObjectEnumerator];
          uint64_t v20 = [v19 allObjects];

          v6 = INDateRelevanceProvider_ptr;
          v13 = v18;
        }
        else
        {
          uint64_t v20 = 0;
        }

        [v14 setExpanded:1];
        v13 = (void *)v20;
      }
      if (objc_msgSend(v13, "count", v39))
      {
        [v11 addObjectsFromArray:v13];
      }
      else
      {
        v21 = [v14 identifier];
        unsigned int v22 = [v10 containsObject:v21];

        if (v22)
        {
          v23 = [v6[202] write];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            sub_1007560E8(v52, v14, v39, v23);
          }
        }
        else
        {
          [v9 addObject:v14];
          v23 = [v14 identifier];
          [v10 addObject:v23];
        }

        [v11 removeLastObject];
      }
      id v12 = [v11 lastObject];

      v24 = [v6[202] write];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        id v42 = [v11 count];
        id v26 = [v9 count];
        id v27 = [v10 count];
        v28 = [v12 identifier];
        *(_DWORD *)buf = 134218754;
        id v45 = v42;
        __int16 v46 = 2048;
        unint64_t v47 = (unint64_t)v26;
        v6 = INDateRelevanceProvider_ptr;
        __int16 v48 = 2048;
        id v49 = v27;
        __int16 v50 = 2114;
        v51 = v28;
        _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "REMCDObjectTreeProcessor: \tSTATUS {traversalStack.count: %ld, flushQueue.count: %ld, flushed.count: %ld, tailNode: %{public}@}", buf, 0x2Au);

        v9 = v41;
      }

      v25 = [(REMCDObjectTreeProcessor *)self _flushIfNeeded:v9];
      [v10 addObjectsFromArray:v25];

      v14 = v12;
    }
    while ([v11 count]);

    v5 = v40;
  }
  v29 = [(REMCDObjectTreeProcessor *)self _flushRemaining:v9];
  [v10 addObjectsFromArray:v29];

  v30 = [v6[202] write];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    id v31 = [v10 count];
    +[NSDate date];
    v33 = v32 = v9;
    [v33 timeIntervalSinceDate:v5];
    *(double *)&unint64_t v35 = v34 * 1000.0;
    v36 = [v43 identifier];
    *(_DWORD *)buf = 134218498;
    id v45 = v31;
    __int16 v46 = 2048;
    unint64_t v47 = v35;
    __int16 v48 = 2114;
    id v49 = v36;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "REMCDObjectTreeProcessor: END traversal for {processed.count: %ld, elapsed: %.4f ms, rootNode: %{public}@}", buf, 0x20u);

    v9 = v32;
  }

  v37 = [v10 array];

  return v37;
}

- (id)_flushIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = [v4 count];
  if (v5 >= (id)[(REMCDObjectTreeProcessor *)self batchSize])
  {
    v6 = [(REMCDObjectTreeProcessor *)self _flushRemaining:v4];
  }
  else
  {
    v6 = &__NSArray0__struct;
  }

  return v6;
}

- (id)_flushRemaining:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = +[REMLogStore write];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_100756160(v4, v5);
    }

    v6 = [(REMCDObjectTreeProcessor *)self delegate];
    [v6 processBatchOfTreeNodes:v4];

    v7 = [v4 valueForKey:@"identifier"];
    [v4 removeAllObjects];
  }
  else
  {
    v7 = &__NSArray0__struct;
  }

  return v7;
}

- (unint64_t)traversalOrder
{
  return self->_traversalOrder;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (REMCDObjectTreeProcessorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (REMCDObjectTreeProcessorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end