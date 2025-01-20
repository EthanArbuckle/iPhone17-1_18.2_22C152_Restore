@interface _DASTaskDependencyGraph
- (NSMutableDictionary)graph;
- (NSMutableDictionary)taskNodeMap;
- (OS_dispatch_queue)queue;
- (id)constructTaskDependencyGraphForTask:(id)a3 dependencyDataMap:(id)a4;
- (id)initTaskGraph;
- (id)nodeForTaskIdentifier:(id)a3;
- (void)addDependencyEdgeFrom:(id)a3 to:(id)a4;
- (void)addTaskNodeToGraph:(id)a3;
- (void)setGraph:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTaskNodeMap:(id)a3;
@end

@implementation _DASTaskDependencyGraph

- (id)initTaskGraph
{
  v12.receiver = self;
  v12.super_class = (Class)_DASTaskDependencyGraph;
  v2 = [(_DASTaskDependencyGraph *)&v12 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    graph = v2->_graph;
    v2->_graph = (NSMutableDictionary *)v3;

    uint64_t v5 = +[NSMutableDictionary dictionary];
    taskNodeMap = v2->_taskNodeMap;
    v2->_taskNodeMap = (NSMutableDictionary *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.dasd.taskDependencyGraph", v8);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;
  }
  return v2;
}

- (void)addTaskNodeToGraph:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10008E564;
  v7[3] = &unk_100175570;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)addDependencyEdgeFrom:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10008E70C;
    block[3] = &unk_100175548;
    block[4] = self;
    id v11 = v6;
    id v12 = v8;
    dispatch_sync(queue, block);
  }
}

- (id)nodeForTaskIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_10008E96C;
  v16 = sub_10008E97C;
  id v17 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008E984;
  block[3] = &unk_100175B30;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)constructTaskDependencyGraphForTask:(id)a3 dependencyDataMap:(id)a4
{
  id v44 = a3;
  id v5 = a4;
  id v6 = +[NSMutableDictionary dictionary];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v7 = v5;
  v48 = v7;
  id v52 = [v7 countByEnumeratingWithState:&v66 objects:v73 count:16];
  if (v52)
  {
    uint64_t v50 = *(void *)v67;
    do
    {
      for (i = 0; i != v52; i = (char *)i + 1)
      {
        if (*(void *)v67 != v50) {
          objc_enumerationMutation(v7);
        }
        uint64_t v9 = *(void *)(*((void *)&v66 + 1) + 8 * i);
        id v10 = [v7 objectForKeyedSubscript:v9];
        id v11 = [v10 producedResultIdentifiers];

        long long v64 = 0u;
        long long v65 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        id v12 = v11;
        id v13 = [v12 countByEnumeratingWithState:&v62 objects:v72 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v63;
          do
          {
            for (j = 0; j != v14; j = (char *)j + 1)
            {
              if (*(void *)v63 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void *)(*((void *)&v62 + 1) + 8 * (void)j);
              v18 = [v6 objectForKeyedSubscript:v17];

              if (!v18)
              {
                v19 = +[NSMutableSet set];
                [v6 setObject:v19 forKeyedSubscript:v17];
              }
              v20 = [v6 objectForKeyedSubscript:v17];
              [v20 addObject:v9];
            }
            id v14 = [v12 countByEnumeratingWithState:&v62 objects:v72 count:16];
          }
          while (v14);
        }

        id v7 = v48;
      }
      id v52 = [v48 countByEnumeratingWithState:&v66 objects:v73 count:16];
    }
    while (v52);
  }
  v49 = v6;

  id v21 = [(_DASTaskDependencyGraph *)self initTaskGraph];
  v22 = [[_DASTaskDependencyGraphNode alloc] initWithIdentifier:v44];
  [v21 addTaskNodeToGraph:v22];
  v23 = +[NSMutableSet setWithObject:v22];
  v43 = v22;
  v24 = +[NSMutableArray arrayWithObject:v22];
  v25 = v24;
LABEL_18:
  if ([v24 count])
  {
    v26 = [v25 firstObject];
    v27 = [v26 taskIdentifier];
    v28 = [v7 objectForKeyedSubscript:v27];
    v29 = [v28 dependencyIdentifiers];

    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v30 = v29;
    id v51 = [v30 countByEnumeratingWithState:&v58 objects:v71 count:16];
    if (!v51) {
      goto LABEL_45;
    }
    uint64_t v31 = *(void *)v59;
    uint64_t v45 = *(void *)v59;
    id v47 = v30;
    while (1)
    {
      for (k = 0; k != v51; k = (char *)k + 1)
      {
        if (*(void *)v59 != v31) {
          objc_enumerationMutation(v30);
        }
        uint64_t v33 = *(void *)(*((void *)&v58 + 1) + 8 * (void)k);
        v34 = [v7 objectForKey:v33];

        if (v34)
        {
          v53 = k;
          v35 = [v21 nodeForTaskIdentifier:v33];
          if (!v35) {
            v35 = [[_DASTaskDependencyGraphNode alloc] initWithIdentifier:v33];
          }
          [v21 addDependencyEdgeFrom:v26 to:v35];
          if (([v23 containsObject:v35] & 1) == 0)
          {
            [v23 addObject:v35];
            [v25 addObject:v35];
          }
        }
        else
        {
          v36 = [v49 objectForKey:v33];

          if (!v36) {
            continue;
          }
          v53 = k;
          v35 = [v49 objectForKeyedSubscript:v33];
          long long v54 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          id v37 = [(_DASTaskDependencyGraphNode *)v35 countByEnumeratingWithState:&v54 objects:v70 count:16];
          if (v37)
          {
            id v38 = v37;
            uint64_t v39 = *(void *)v55;
            do
            {
              for (m = 0; m != v38; m = (char *)m + 1)
              {
                if (*(void *)v55 != v39) {
                  objc_enumerationMutation(v35);
                }
                v41 = [v21 nodeForTaskIdentifier:*(void *)(*((void *)&v54 + 1) + 8 * (void)m)];
                if (!v41) {
                  v41 = [[_DASTaskDependencyGraphNode alloc] initWithIdentifier:v33];
                }
                [v21 addDependencyEdgeFrom:v26 to:v41];
                if (([v23 containsObject:v41] & 1) == 0)
                {
                  [v23 addObject:v41];
                  [v25 addObject:v41];
                }
              }
              id v38 = [(_DASTaskDependencyGraphNode *)v35 countByEnumeratingWithState:&v54 objects:v70 count:16];
            }
            while (v38);
            id v30 = v47;
            id v7 = v48;
            uint64_t v31 = v45;
          }
        }

        k = v53;
      }
      id v51 = [v30 countByEnumeratingWithState:&v58 objects:v71 count:16];
      if (!v51)
      {
LABEL_45:

        [v25 removeObjectAtIndex:0];
        v24 = v25;
        goto LABEL_18;
      }
    }
  }

  return v21;
}

- (NSMutableDictionary)graph
{
  return self->_graph;
}

- (void)setGraph:(id)a3
{
}

- (NSMutableDictionary)taskNodeMap
{
  return self->_taskNodeMap;
}

- (void)setTaskNodeMap:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_taskNodeMap, 0);

  objc_storeStrong((id *)&self->_graph, 0);
}

@end