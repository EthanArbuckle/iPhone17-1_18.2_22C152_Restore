@interface PBFPriorityQueue
- (BOOL)isEmpty;
- (BOOL)removeActiveItem:(id)a3 forIdentifier:(id)a4;
- (BOOL)removeEnqueuedItem:(id)a3 forIdentifier:(id)a4;
- (NSSet)activeIdentifiers;
- (NSSet)enqueuedIdentifiers;
- (NSSet)identifiers;
- (PBFPriorityQueue)init;
- (id)activeItemsForIdentifier:(id)a3;
- (id)enqueuedItemsForIdentifier:(id)a3;
- (id)filterEnqueuedItemForIdentifier:(id)a3 passingTest:(id)a4;
- (id)firstActiveItemForIdentifier:(id)a3 passingTest:(id)a4;
- (unint64_t)numberOfActiveItemForIdentifier:(id)a3;
- (unint64_t)numberOfActiveItems;
- (unint64_t)numberOfEnqueuedItems;
- (unint64_t)numberOfEnqueuedUpItemsForIdentifier:(id)a3;
- (void)enqueueItem:(id)a3 forIdentifier:(id)a4;
- (void)markItemActive:(id)a3 forIdentifier:(id)a4;
- (void)removeAllActiveItems;
- (void)removeAllEnqueuedItems;
- (void)sortItemsForIdentifier:(id)a3 usingComparator:(id)a4;
@end

@implementation PBFPriorityQueue

- (PBFPriorityQueue)init
{
  v8.receiver = self;
  v8.super_class = (Class)PBFPriorityQueue;
  v2 = [(PBFPriorityQueue *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    activeItemsForIdentifier = v2->_activeItemsForIdentifier;
    v2->_activeItemsForIdentifier = (NSMapTable *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    priorityQueueForIdentifier = v2->_priorityQueueForIdentifier;
    v2->_priorityQueueForIdentifier = (NSMapTable *)v5;
  }
  return v2;
}

- (unint64_t)numberOfEnqueuedItems
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(NSMapTable *)self->_priorityQueueForIdentifier objectEnumerator];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += [*(id *)(*((void *)&v9 + 1) + 8 * i) count];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (NSSet)identifiers
{
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [(PBFPriorityQueue *)self enqueuedIdentifiers];
  [v3 unionSet:v4];

  unint64_t v5 = [(PBFPriorityQueue *)self activeIdentifiers];
  [v3 unionSet:v5];

  uint64_t v6 = (void *)[v3 copy];
  return (NSSet *)v6;
}

- (NSSet)enqueuedIdentifiers
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = [(NSMapTable *)self->_priorityQueueForIdentifier keyEnumerator];
  uint64_t v4 = [v3 allObjects];
  unint64_t v5 = (void *)v4;
  if (v4) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = MEMORY[0x1E4F1CBF0];
  }
  v7 = [v2 setWithArray:v6];

  return (NSSet *)v7;
}

- (NSSet)activeIdentifiers
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = [(NSMapTable *)self->_activeItemsForIdentifier keyEnumerator];
  uint64_t v4 = [v3 allObjects];
  unint64_t v5 = (void *)v4;
  if (v4) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = MEMORY[0x1E4F1CBF0];
  }
  v7 = [v2 setWithArray:v6];

  return (NSSet *)v7;
}

- (void)removeAllEnqueuedItems
{
}

- (void)removeAllActiveItems
{
}

- (unint64_t)numberOfEnqueuedUpItemsForIdentifier:(id)a3
{
  uint64_t v3 = [(NSMapTable *)self->_priorityQueueForIdentifier objectForKey:a3];
  unint64_t v4 = [v3 count];

  return v4;
}

- (unint64_t)numberOfActiveItemForIdentifier:(id)a3
{
  uint64_t v3 = [(NSMapTable *)self->_activeItemsForIdentifier objectForKey:a3];
  unint64_t v4 = [v3 count];

  return v4;
}

- (unint64_t)numberOfActiveItems
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(NSMapTable *)self->_activeItemsForIdentifier objectEnumerator];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += [*(id *)(*((void *)&v9 + 1) + 8 * i) count];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)isEmpty
{
  return ![(NSMapTable *)self->_priorityQueueForIdentifier count]
      && [(NSMapTable *)self->_activeItemsForIdentifier count] == 0;
}

- (id)activeItemsForIdentifier:(id)a3
{
  uint64_t v3 = [(NSMapTable *)self->_activeItemsForIdentifier objectForKey:a3];
  uint64_t v4 = (void *)[v3 copy];

  return v4;
}

- (id)enqueuedItemsForIdentifier:(id)a3
{
  uint64_t v3 = [(NSMapTable *)self->_priorityQueueForIdentifier objectForKey:a3];
  uint64_t v4 = [v3 array];
  unint64_t v5 = (void *)[v4 copy];

  return v5;
}

- (void)enqueueItem:(id)a3 forIdentifier:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = [(NSMapTable *)self->_priorityQueueForIdentifier objectForKey:v6];
  if (!v7)
  {
    v7 = objc_opt_new();
    [(NSMapTable *)self->_priorityQueueForIdentifier setObject:v7 forKey:v6];
  }
  [v7 addObject:v8];
}

- (BOOL)removeEnqueuedItem:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSMapTable *)self->_priorityQueueForIdentifier objectForKey:v7];
  int v9 = [v8 containsObject:v6];
  if (v9)
  {
    [v8 removeObject:v6];
    if (![v8 count]) {
      [(NSMapTable *)self->_priorityQueueForIdentifier removeObjectForKey:v7];
    }
  }

  return v9;
}

- (id)filterEnqueuedItemForIdentifier:(id)a3 passingTest:(id)a4
{
  id v6 = a3;
  priorityQueueForIdentifier = self->_priorityQueueForIdentifier;
  id v8 = a4;
  int v9 = [(NSMapTable *)priorityQueueForIdentifier objectForKey:v6];
  long long v10 = (void *)MEMORY[0x1E4F1CAD0];
  long long v11 = [v9 array];
  long long v12 = (void *)[v11 copy];
  v13 = objc_msgSend(v12, "bs_filter:", v8);

  if (v13) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v15 = [v10 setWithArray:v14];

  [v9 minusSet:v15];
  if (![v9 count]) {
    [(NSMapTable *)self->_priorityQueueForIdentifier removeObjectForKey:v6];
  }
  v16 = (void *)[v15 copy];

  return v16;
}

- (BOOL)removeActiveItem:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSMapTable *)self->_activeItemsForIdentifier objectForKey:v7];
  int v9 = [v8 containsObject:v6];
  if (v9)
  {
    [v8 removeObject:v6];
    if (![v8 count]) {
      [(NSMapTable *)self->_activeItemsForIdentifier removeObjectForKey:v7];
    }
  }

  return v9;
}

- (void)markItemActive:(id)a3 forIdentifier:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  id v8 = [(NSMapTable *)self->_activeItemsForIdentifier objectForKey:v7];
  char v9 = [v8 containsObject:v12];

  if (v9)
  {
LABEL_6:

    return;
  }
  if ([(PBFPriorityQueue *)self removeEnqueuedItem:v12 forIdentifier:v7])
  {
    long long v10 = [(NSMapTable *)self->_activeItemsForIdentifier objectForKey:v7];
    if (!v10)
    {
      long long v10 = objc_opt_new();
      [(NSMapTable *)self->_activeItemsForIdentifier setObject:v10 forKey:v7];
    }
    [v10 addObject:v12];

    goto LABEL_6;
  }
  long long v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[self removeEnqueuedItem:item forIdentifier:identifier]"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[PBFPriorityQueue markItemActive:forIdentifier:](a2, (uint64_t)self, (uint64_t)v11);
  }
  [v11 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (id)firstActiveItemForIdentifier:(id)a3 passingTest:(id)a4
{
  activeItemsForIdentifier = self->_activeItemsForIdentifier;
  id v6 = a4;
  id v7 = [(NSMapTable *)activeItemsForIdentifier objectForKey:a3];
  id v8 = objc_msgSend(v7, "bs_firstObjectPassingTest:", v6);

  return v8;
}

- (void)sortItemsForIdentifier:(id)a3 usingComparator:(id)a4
{
  priorityQueueForIdentifier = self->_priorityQueueForIdentifier;
  id v6 = a4;
  id v7 = [(NSMapTable *)priorityQueueForIdentifier objectForKey:a3];
  [v7 sortUsingComparator:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeItemsForIdentifier, 0);
  objc_storeStrong((id *)&self->_priorityQueueForIdentifier, 0);
}

- (void)markItemActive:(uint64_t)a3 forIdentifier:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  char v9 = v5;
  __int16 v10 = 2114;
  long long v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"PBFPriorityQueue.m";
  __int16 v16 = 1024;
  int v17 = 141;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D31CE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end