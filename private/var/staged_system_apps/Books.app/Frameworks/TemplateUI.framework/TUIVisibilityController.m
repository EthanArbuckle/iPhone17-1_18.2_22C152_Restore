@interface TUIVisibilityController
+ (id)sharedQueue;
- (CGRect)_computeClippedBoundsForProvider:(id)a3;
- (TUIVisibilityCollector)rootCollector;
- (TUIVisibilityController)initWithRootProvider:(id)a3 queue:(id)a4;
- (TUIVisibilityTracker)impressionTracker;
- (TUIVisibilityTracker)linkEntityTracker;
- (double)scrollingMaxUpdateInterval;
- (id)newCollectorForProvider:(id)a3 withIdentifier:(id)a4 parentIdentifier:(id)a5;
- (id)newTrackerWithDefaultThreshold:(double)a3 block:(id)a4;
- (void)_appendVisibilityUpdatesAtTime:(double)a3 forCollector:(id)a4 toUpdates:(id)a5;
- (void)_appendVisibleBoundsUpdatesAtTime:(double)a3 forCollector:(id)a4 toUpdates:(id)a5;
- (void)_scheduleUpdate:(id)a3;
- (void)_scheduleUpdates:(id)a3;
- (void)q_commitWithTime:(double)a3;
- (void)q_processUpdates;
- (void)q_setNeedsUpdateForCollector:(id)a3;
- (void)queueUpdateForCollector:(id)a3 time:(double)a4 block:(id)a5;
- (void)queueUpdateVisible:(BOOL)a3 forCollector:(id)a4 time:(double)a5;
- (void)queueUpdateWithBlock:(id)a3;
- (void)queueVisibleBoundsUpdateForCollector:(id)a3 time:(double)a4;
- (void)removeCollector:(id)a3;
- (void)removeTracker:(id)a3;
- (void)updateVisible;
- (void)updateVisibleAtTime:(double)a3;
@end

@implementation TUIVisibilityController

+ (id)sharedQueue
{
  if (qword_2DF1B8 != -1) {
    dispatch_once(&qword_2DF1B8, &stru_251C30);
  }
  v2 = (void *)qword_2DF1B0;

  return v2;
}

- (TUIVisibilityController)initWithRootProvider:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)TUIVisibilityController;
  v8 = [(TUIVisibilityController *)&v19 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queue, a4);
    v9->_lock._os_unfair_lock_opaque = 0;
    v10 = [[TUIVisibilityCollector alloc] initWithController:v9 provider:v6 identifier:0];
    rootCollector = v9->_rootCollector;
    v9->_rootCollector = v10;

    uint64_t v12 = +[NSHashTable hashTableWithOptions:0];
    q_trackers = v9->_q_trackers;
    v9->_q_trackers = (NSHashTable *)v12;

    uint64_t v14 = objc_opt_new();
    l_updates = v9->_l_updates;
    v9->_l_updates = (NSMutableArray *)v14;

    uint64_t v16 = objc_opt_new();
    collectorsMap = v9->_collectorsMap;
    v9->_collectorsMap = (NSMutableDictionary *)v16;
  }
  return v9;
}

- (id)newTrackerWithDefaultThreshold:(double)a3 block:(id)a4
{
  id v6 = a4;
  id v7 = [[TUIVisibilityTracker alloc] initWithThreshold:v6 block:self->_queue queue:a3];

  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1C1EC;
  v13[3] = &unk_251828;
  v13[4] = self;
  v9 = v7;
  uint64_t v14 = v9;
  dispatch_sync(queue, v13);
  v10 = v14;
  v11 = v9;

  return v11;
}

- (void)_scheduleUpdate:(id)a3
{
  id v4 = a3;
  [v4 time];
  double v6 = v5;
  if ([v4 flags]) {
    unint64_t v7 = ((unint64_t)[v4 flags] >> 1) & 1;
  }
  else {
    LOBYTE(v7) = 1;
  }
  os_unfair_lock_lock_with_options();
  if (!self->_l_processUpdatesScheduled && (v7 & 1) == 0)
  {
    if (v6 - self->_lastUpdate > 0.1 || ![(NSMutableArray *)self->_l_updates count]) {
      goto LABEL_8;
    }
LABEL_10:
    [(NSMutableArray *)self->_l_updates addObject:v4];
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_11;
  }
  if (self->_l_processUpdatesScheduled) {
    goto LABEL_10;
  }
LABEL_8:
  self->_l_processUpdatesScheduled = 1;
  [(NSMutableArray *)self->_l_updates addObject:v4];
  os_unfair_lock_unlock(&self->_lock);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1C330;
  block[3] = &unk_251990;
  block[4] = self;
  dispatch_async(queue, block);
LABEL_11:
}

- (void)_scheduleUpdates:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  if (self->_l_processUpdatesScheduled)
  {
    [(NSMutableArray *)self->_l_updates addObjectsFromArray:v5];

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_l_processUpdatesScheduled = 1;
    [(NSMutableArray *)self->_l_updates addObjectsFromArray:v5];

    os_unfair_lock_unlock(p_lock);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1C434;
    block[3] = &unk_251990;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)q_processUpdates
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSMutableArray *)self->_l_updates copy];
  [(NSMutableArray *)self->_l_updates removeAllObjects];
  char v5 = 0;
  double v6 = 0.0;
  if (![v4 count]) {
    goto LABEL_24;
  }
  do
  {
    os_unfair_lock_unlock(p_lock);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (!v8) {
      goto LABEL_23;
    }
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [v12 time];
        double v14 = v13;
        if (([v12 flags] & 2) != 0)
        {
          if (v5) {
            [(TUIVisibilityController *)self q_commitWithTime:v6];
          }
          uint64_t v16 = [v12 block];
          v16[2]();

          goto LABEL_19;
        }
        if ((v5 & 1) == 0) {
          double v6 = v14;
        }
        if ((v5 & 1 & (v14 - v6 > 0.01)) == 1)
        {
          [(TUIVisibilityController *)self q_commitWithTime:v6];
          char v5 = 0;
        }
        v15 = [v12 block];
        v15[2]();

        if ((v5 & 1) == 0) {
          double v6 = v14;
        }
        if (([v12 flags] & 1) == 0)
        {
          [(TUIVisibilityController *)self q_commitWithTime:v6];
LABEL_19:
          char v5 = 0;
          continue;
        }
        char v5 = 1;
      }
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
LABEL_23:

    os_unfair_lock_lock_with_options();
    id v4 = [(NSMutableArray *)self->_l_updates copy];
    [(NSMutableArray *)self->_l_updates removeAllObjects];
  }
  while ([v4 count]);
LABEL_24:
  self->_l_processUpdatesScheduled = 0;
  os_unfair_lock_unlock(p_lock);

  if (v5) {
    [(TUIVisibilityController *)self q_commitWithTime:v6];
  }
}

- (void)q_commitWithTime:(double)a3
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  char v5 = self->_q_trackers;
  id v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        char v16 = 0;
        rootCollector = self->_rootCollector;
        [(TUIVisibilityCollector *)rootCollector q_visibleBoundsSize];
        id v12 = -[TUIVisibilityCollector q_computeChangeNodeForTracker:anyChange:rootVisibleSize:needsUpdate:needUpdateSet:](rootCollector, "q_computeChangeNodeForTracker:anyChange:rootVisibleSize:needsUpdate:needUpdateSet:", v10, &v16, 0, self->_q_needsUpdate);
        double v13 = v12;
        if (v16) {
          BOOL v14 = v12 == 0;
        }
        else {
          BOOL v14 = 1;
        }
        if (!v14) {
          [v10 q_notifyObserversWithRootNode:v12 time:a3];
        }
      }
      id v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  q_needsUpdate = self->_q_needsUpdate;
  self->_q_needsUpdate = 0;
}

- (void)removeTracker:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1C898;
  v7[3] = &unk_251828;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)queueUpdateWithBlock:(id)a3
{
  id v4 = a3;
  char v5 = [[_TUIVisibilityUpdate alloc] initWithTime:2 flags:v4 block:0.0];

  [(TUIVisibilityController *)self _scheduleUpdate:v5];
}

- (void)q_setNeedsUpdateForCollector:(id)a3
{
  id v4 = a3;
  q_needsUpdate = self->_q_needsUpdate;
  id v8 = v4;
  if (!q_needsUpdate)
  {
    id v6 = +[NSHashTable hashTableWithOptions:512];
    id v7 = self->_q_needsUpdate;
    self->_q_needsUpdate = v6;

    id v4 = v8;
    q_needsUpdate = self->_q_needsUpdate;
  }
  [(NSHashTable *)q_needsUpdate addObject:v4];
}

- (void)queueUpdateForCollector:(id)a3 time:(double)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [v8 provider];
  [(TUIVisibilityController *)self _computeClippedBoundsForProvider:v10];
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;

  long long v19 = [_TUIVisibilityUpdate alloc];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1CAE8;
  v23[3] = &unk_251C58;
  uint64_t v27 = v12;
  uint64_t v28 = v14;
  uint64_t v29 = v16;
  uint64_t v30 = v18;
  v25 = self;
  id v26 = v9;
  id v24 = v8;
  id v20 = v9;
  id v21 = v8;
  v22 = [(_TUIVisibilityUpdate *)v19 initWithTime:1 flags:v23 block:a4];
  [(TUIVisibilityController *)self _scheduleUpdate:v22];
}

- (void)queueVisibleBoundsUpdateForCollector:(id)a3 time:(double)a4
{
  id v6 = a3;
  id v7 = (id)objc_opt_new();
  [(TUIVisibilityController *)self _appendVisibleBoundsUpdatesAtTime:v6 forCollector:v7 toUpdates:a4];

  [(TUIVisibilityController *)self _scheduleUpdates:v7];
}

- (void)queueUpdateVisible:(BOOL)a3 forCollector:(id)a4 time:(double)a5
{
  id v8 = a4;
  id v9 = [v8 provider];
  [(TUIVisibilityController *)self _computeClippedBoundsForProvider:v9];
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;

  uint64_t v18 = [_TUIVisibilityUpdate alloc];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1CCF0;
  v21[3] = &unk_251C80;
  uint64_t v24 = v11;
  uint64_t v25 = v13;
  uint64_t v26 = v15;
  uint64_t v27 = v17;
  BOOL v28 = a3;
  id v22 = v8;
  v23 = self;
  id v19 = v8;
  id v20 = [(_TUIVisibilityUpdate *)v18 initWithTime:0 flags:v21 block:a5];
  [(TUIVisibilityController *)self _scheduleUpdate:v20];
}

- (CGRect)_computeClippedBoundsForProvider:(id)a3
{
  id v4 = a3;
  [v4 visibilityProviderVisibleBounds];
  CGFloat x = v5;
  CGFloat y = v7;
  CGFloat width = v9;
  CGFloat height = v11;
  uint64_t v13 = [(TUIVisibilityCollector *)self->_rootCollector provider];
  uint64_t v14 = [v13 visibilityProviderHostingLayer];

  uint64_t v15 = [v4 visibilityProviderHostingLayer];
  uint64_t v16 = (void *)v15;
  if (v14) {
    BOOL v17 = v15 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  if (!v17 && v14 != (void *)v15)
  {
    v49.origin.CGFloat x = x;
    v49.origin.CGFloat y = y;
    v49.size.CGFloat width = width;
    v49.size.CGFloat height = height;
    if (!CGRectIsEmpty(v49))
    {
      id v19 = [(TUIVisibilityCollector *)self->_rootCollector provider];
      [v19 visibilityProviderVisibleBounds];
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;

      [v14 convertRect:v16 toLayer:v21, v23, v25, v27];
      v59.origin.CGFloat x = v28;
      v59.origin.CGFloat y = v29;
      v59.size.CGFloat width = v30;
      v59.size.CGFloat height = v31;
      v50.origin.CGFloat x = x;
      v50.origin.CGFloat y = y;
      v50.size.CGFloat width = width;
      v50.size.CGFloat height = height;
      CGRect v51 = CGRectIntersection(v50, v59);
      CGFloat x = v51.origin.x;
      CGFloat y = v51.origin.y;
      CGFloat width = v51.size.width;
      CGFloat height = v51.size.height;
    }
    v52.origin.CGFloat x = x;
    v52.origin.CGFloat y = y;
    v52.size.CGFloat width = width;
    v52.size.CGFloat height = height;
    if (!CGRectIsEmpty(v52))
    {
      uint64_t v32 = [v16 superlayer];
      if (v32)
      {
        v33 = (void *)v32;
        do
        {
          if ([v33 masksToBounds])
          {
            [v33 bounds];
            [v33 convertRect:v16 toLayer:];
            v60.origin.CGFloat x = v34;
            v60.origin.CGFloat y = v35;
            v60.size.CGFloat width = v36;
            v60.size.CGFloat height = v37;
            v53.origin.CGFloat x = x;
            v53.origin.CGFloat y = y;
            v53.size.CGFloat width = width;
            v53.size.CGFloat height = height;
            CGRect v54 = CGRectIntersection(v53, v60);
            CGFloat x = v54.origin.x;
            CGFloat y = v54.origin.y;
            CGFloat width = v54.size.width;
            CGFloat height = v54.size.height;
            if (CGRectIsEmpty(v54)) {
              break;
            }
          }
          if (v33 == v14)
          {
            v33 = v14;
            break;
          }
          uint64_t v38 = [v33 superlayer];

          v33 = (void *)v38;
        }
        while (v38);
      }
    }
  }
  v39 = [(TUIVisibilityCollector *)self->_rootCollector provider];
  v40 = [v39 visibilityProviderWindowLayer];

  if (v40)
  {
    if (v16)
    {
      v55.origin.CGFloat x = x;
      v55.origin.CGFloat y = y;
      v55.size.CGFloat width = width;
      v55.size.CGFloat height = height;
      if (!CGRectIsEmpty(v55))
      {
        [v40 bounds];
        [v40 convertRect:v16 toLayer:];
        v61.origin.CGFloat x = v41;
        v61.origin.CGFloat y = v42;
        v61.size.CGFloat width = v43;
        v61.size.CGFloat height = v44;
        v56.origin.CGFloat x = x;
        v56.origin.CGFloat y = y;
        v56.size.CGFloat width = width;
        v56.size.CGFloat height = height;
        CGRect v57 = CGRectIntersection(v56, v61);
        CGFloat x = v57.origin.x;
        CGFloat y = v57.origin.y;
        CGFloat width = v57.size.width;
        CGFloat height = v57.size.height;
      }
    }
  }

  double v45 = x;
  double v46 = y;
  double v47 = width;
  double v48 = height;
  result.size.CGFloat height = v48;
  result.size.CGFloat width = v47;
  result.origin.CGFloat y = v46;
  result.origin.CGFloat x = v45;
  return result;
}

- (id)newCollectorForProvider:(id)a3 withIdentifier:(id)a4 parentIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5)
  {
    uint64_t v10 = [(NSMutableDictionary *)self->_collectorsMap objectForKeyedSubscript:a5];
  }
  else
  {
    uint64_t v10 = self->_rootCollector;
  }
  double v11 = v10;
  uint64_t v12 = [[TUIVisibilityCollector alloc] initWithController:self provider:v8 identifier:v9];
  [(NSMutableDictionary *)self->_collectorsMap setObject:v12 forKeyedSubscript:v9];
  [(TUIVisibilityCollector *)v11 _addChild:v12];

  return v12;
}

- (void)removeCollector:(id)a3
{
  id v4 = [a3 identifier];
  [(NSMutableDictionary *)self->_collectorsMap removeObjectForKey:v4];
}

- (void)updateVisible
{
  double v3 = sub_1A768();

  [(TUIVisibilityController *)self updateVisibleAtTime:v3];
}

- (void)_appendVisibleBoundsUpdatesAtTime:(double)a3 forCollector:(id)a4 toUpdates:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v8 provider];
  [(TUIVisibilityController *)self _computeClippedBoundsForProvider:v10];
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;

  id v19 = [_TUIVisibilityUpdate alloc];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1D334;
  v31[3] = &unk_251CA8;
  id v20 = v8;
  uint64_t v34 = v12;
  uint64_t v35 = v14;
  uint64_t v36 = v16;
  uint64_t v37 = v18;
  id v32 = v20;
  v33 = self;
  double v21 = [(_TUIVisibilityUpdate *)v19 initWithTime:1 flags:v31 block:a3];
  [v9 addObject:v21];
  double v22 = [v20 children];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v23 = [v22 countByEnumeratingWithState:&v27 objects:v38 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v28;
    do
    {
      double v26 = 0;
      do
      {
        if (*(void *)v28 != v25) {
          objc_enumerationMutation(v22);
        }
        [(TUIVisibilityController *)self _appendVisibleBoundsUpdatesAtTime:*(void *)(*((void *)&v27 + 1) + 8 * (void)v26) forCollector:v9 toUpdates:a3];
        double v26 = (char *)v26 + 1;
      }
      while (v24 != v26);
      id v24 = [v22 countByEnumeratingWithState:&v27 objects:v38 count:16];
    }
    while (v24);
  }
}

- (void)_appendVisibilityUpdatesAtTime:(double)a3 forCollector:(id)a4 toUpdates:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v8 provider];
  [(TUIVisibilityController *)self _computeClippedBoundsForProvider:v10];
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;

  LOBYTE(v10) = [v8 _computeVisible];
  id v19 = [_TUIVisibilityUpdate alloc];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1D598;
  v31[3] = &unk_251C80;
  id v20 = v8;
  uint64_t v34 = v12;
  uint64_t v35 = v14;
  uint64_t v36 = v16;
  uint64_t v37 = v18;
  char v38 = (char)v10;
  id v32 = v20;
  v33 = self;
  double v21 = [(_TUIVisibilityUpdate *)v19 initWithTime:1 flags:v31 block:a3];
  [v9 addObject:v21];
  double v22 = [v20 children];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v23 = [v22 countByEnumeratingWithState:&v27 objects:v39 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v28;
    do
    {
      double v26 = 0;
      do
      {
        if (*(void *)v28 != v25) {
          objc_enumerationMutation(v22);
        }
        [(TUIVisibilityController *)self _appendVisibilityUpdatesAtTime:*(void *)(*((void *)&v27 + 1) + 8 * (void)v26) forCollector:v9 toUpdates:a3];
        double v26 = (char *)v26 + 1;
      }
      while (v24 != v26);
      id v24 = [v22 countByEnumeratingWithState:&v27 objects:v39 count:16];
    }
    while (v24);
  }
}

- (void)updateVisibleAtTime:(double)a3
{
  id v5 = (id)objc_opt_new();
  [(TUIVisibilityController *)self _appendVisibilityUpdatesAtTime:self->_rootCollector forCollector:v5 toUpdates:a3];
  [(TUIVisibilityController *)self _scheduleUpdates:v5];
}

- (TUIVisibilityCollector)rootCollector
{
  return self->_rootCollector;
}

- (TUIVisibilityTracker)impressionTracker
{
  return self->_impressionTracker;
}

- (TUIVisibilityTracker)linkEntityTracker
{
  return self->_linkEntityTracker;
}

- (double)scrollingMaxUpdateInterval
{
  return self->_scrollingMaxUpdateInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkEntityTracker, 0);
  objc_storeStrong((id *)&self->_impressionTracker, 0);
  objc_storeStrong((id *)&self->_rootCollector, 0);
  objc_storeStrong((id *)&self->_collectorsMap, 0);
  objc_storeStrong((id *)&self->_q_needsUpdate, 0);
  objc_storeStrong((id *)&self->_l_updates, 0);
  objc_storeStrong((id *)&self->_q_trackers, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end