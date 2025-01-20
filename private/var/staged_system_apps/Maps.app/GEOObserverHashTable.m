@interface GEOObserverHashTable
- (id)observersSnapshot;
- (void)clearSnapshottedObservers;
- (void)removeSnapshottedObservers;
- (void)restoreOriginalObservers;
- (void)setObserversSnapshot:(id)a3;
- (void)snapshotCurrentObservers;
@end

@implementation GEOObserverHashTable

- (void)snapshotCurrentObservers
{
  id v3 = [(GEOObserverHashTable *)self allObservers];
  [(GEOObserverHashTable *)self setObserversSnapshot:v3];
}

- (void)restoreOriginalObservers
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(GEOObserverHashTable *)self observersSnapshot];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(GEOObserverHashTable *)self registerObserver:*(void *)(*((void *)&v8 + 1) + 8 * (void)v7)];
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(GEOObserverHashTable *)self setObserversSnapshot:0];
}

- (void)setObserversSnapshot:(id)a3
{
}

- (id)observersSnapshot
{
  return objc_getAssociatedObject(self, "observersSnapshot");
}

- (void)removeSnapshottedObservers
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(GEOObserverHashTable *)self observersSnapshot];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(GEOObserverHashTable *)self unregisterObserver:*(void *)(*((void *)&v8 + 1) + 8 * (void)v7)];
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)clearSnapshottedObservers
{
}

@end