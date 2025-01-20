@interface _UISceneHostingGraph
+ (id)sharedInstance;
- (id)_init;
- (id)_localWindowGraphHostingContextID:(unsigned int)a3;
- (id)_rawWindowHostingContextID:(unsigned int)a3;
- (id)localWindowGraphHostingContextID:(unsigned int)a3;
- (id)observeLocalWindowGraphHostingContextID:(unsigned int)a3 withHandler:(id)a4;
- (void)_noteContextID:(unsigned int)a3 hostedByWindow:(id)a4;
@end

@implementation _UISceneHostingGraph

- (void)_noteContextID:(unsigned int)a3 hostedByWindow:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  BSDispatchQueueAssertMain();
  hostingGraph = self->_hostingGraph;
  v8 = [NSNumber numberWithUnsignedInt:v4];
  if (v6) {
    [(NSMapTable *)hostingGraph setObject:v6 forKey:v8];
  }
  else {
    [(NSMapTable *)hostingGraph removeObjectForKey:v8];
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v9 = self->_lazy_contextTrackingAssertions;
  uint64_t v10 = [(NSHashTable *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v14, "isContextIDRelevant:", v4, (void)v16))
        {
          v15 = -[_UISceneHostingGraph localWindowGraphHostingContextID:](self, "localWindowGraphHostingContextID:", [v14 contextID]);
          [v14 setWindowGraph:v15];
        }
      }
      uint64_t v11 = [(NSHashTable *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
}

+ (id)sharedInstance
{
  if (qword_1EB25BDA8 != -1) {
    dispatch_once(&qword_1EB25BDA8, &__block_literal_global_256);
  }
  v2 = (void *)_MergedGlobals_1_13;
  return v2;
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)_UISceneHostingGraph;
  v2 = [(_UISceneHostingGraph *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    hostingGraph = v2->_hostingGraph;
    v2->_hostingGraph = (NSMapTable *)v3;
  }
  return v2;
}

- (id)localWindowGraphHostingContextID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  BSDispatchQueueAssertMain();
  return [(_UISceneHostingGraph *)self _localWindowGraphHostingContextID:v3];
}

- (id)observeLocalWindowGraphHostingContextID:(unsigned int)a3 withHandler:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  BSDispatchQueueAssertMain();
  v7 = [(_UISceneHostingGraph *)self localWindowGraphHostingContextID:v4];
  if (!self->_lazy_contextTrackingAssertions)
  {
    v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    lazy_contextTrackingAssertions = self->_lazy_contextTrackingAssertions;
    self->_lazy_contextTrackingAssertions = v8;
  }
  objc_initWeak(&location, self);
  uint64_t v10 = [_UIContextGraphTrackingAssertion alloc];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __76___UISceneHostingGraph_observeLocalWindowGraphHostingContextID_withHandler___block_invoke;
  long long v16 = &unk_1E52E04F8;
  objc_copyWeak(&v17, &location);
  uint64_t v11 = [(_UIContextGraphTrackingAssertion *)v10 initWithContextID:v4 windowGraph:v7 clientHandlerBlock:v6 invalidationBlock:&v13];
  -[NSHashTable addObject:](self->_lazy_contextTrackingAssertions, "addObject:", v11, v13, v14, v15, v16);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v11;
}

- (id)_rawWindowHostingContextID:(unsigned int)a3
{
  hostingGraph = self->_hostingGraph;
  uint64_t v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  v5 = [(NSMapTable *)hostingGraph objectForKey:v4];

  return v5;
}

- (id)_localWindowGraphHostingContextID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  id v5 = 0;
  id v6 = 0;
  v7 = 0;
  while (1)
  {
    v8 = v6;
    id v6 = v5;

    v9 = +[UIWindow allWindowsIncludingInternalWindows:1 onlyVisibleWindows:0];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = v9;
    id v5 = (id)[v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      uint64_t v11 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v10);
          }
          uint64_t v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if ([v13 _contextId] == v3)
          {
            id v5 = v13;
            goto LABEL_12;
          }
        }
        id v5 = (id)[v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    if (v6 == v5)
    {
    }
    else if (v5)
    {
      goto LABEL_17;
    }
    hostingGraph = self->_hostingGraph;
    v15 = [NSNumber numberWithUnsignedInt:v3];
    id v5 = [(NSMapTable *)hostingGraph objectForKey:v15];

    if (!v5) {
      break;
    }
LABEL_17:
    if (!v7)
    {
      v7 = [MEMORY[0x1E4F1CA48] array];
    }
    [v7 addObject:v5];
    uint64_t v3 = [v5 _contextId];
  }
  [0 _contextId];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lazy_contextTrackingAssertions, 0);
  objc_storeStrong((id *)&self->_hostingGraph, 0);
}

@end