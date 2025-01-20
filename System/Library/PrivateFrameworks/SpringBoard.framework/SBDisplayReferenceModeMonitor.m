@interface SBDisplayReferenceModeMonitor
+ (BOOL)canAddObserverForDisplayWithConfiguration:(id)a3;
- (BOOL)_shouldNotifyObserversOfReferenceModeStatusChangeForDisplay:(id)a3;
- (id)_configurationForDisplay:(id)a3;
- (id)_displayForConfiguration:(id)a3;
- (id)_observersForDisplay:(id)a3;
- (int64_t)_cachedStatusForDisplay:(id)a3;
- (int64_t)_referenceModeStatusForDisplay:(id)a3;
- (int64_t)referenceModeStatusForDisplayWithConfiguration:(id)a3;
- (void)_addObserver:(id)a3 forDisplay:(id)a4;
- (void)_enumerateObserversOfDisplay:(id)a3 usingBlock:(id)a4;
- (void)_removeCachedStatusForDisplay:(id)a3;
- (void)_removeObserver:(id)a3 forDisplay:(id)a4;
- (void)_setCachedStatus:(int64_t)a3 forDisplay:(id)a4;
- (void)_setConfig:(id)a3 forDisplay:(id)a4;
- (void)_startObservingDisplayIfNeeded:(id)a3;
- (void)_stopObservingDisplay:(id)a3;
- (void)addReferenceModeStatusObserver:(id)a3 forDisplayWithConfiguration:(id)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeReferenceModeStatusObserver:(id)a3 forDisplayWithConfiguration:(id)a4;
@end

@implementation SBDisplayReferenceModeMonitor

- (int64_t)referenceModeStatusForDisplayWithConfiguration:(id)a3
{
  id v5 = a3;
  if (!+[SBDisplayReferenceModeMonitor canAddObserverForDisplayWithConfiguration:v5])
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SBDisplayReferenceModeMonitor.m", 86, @"Invalid parameter not satisfying: %@", @"[SBDisplayReferenceModeMonitor canAddObserverForDisplayWithConfiguration:configuration]" object file lineNumber description];
  }
  v6 = [(SBDisplayReferenceModeMonitor *)self _displayForConfiguration:v5];
  int64_t v7 = [(SBDisplayReferenceModeMonitor *)self _referenceModeStatusForDisplay:v6];

  return v7;
}

+ (BOOL)canAddObserverForDisplayWithConfiguration:(id)a3
{
  v3 = objc_msgSend(a3, "sb_referenceModeObserverUniqueIdentifier");
  BOOL v4 = v3 != 0;

  return v4;
}

- (int64_t)_referenceModeStatusForDisplay:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (([v3 isReference] & 1) != 0 || objc_msgSend(v3, "isReferenceLimited"))
  {
    if ([v3 isReferenceLimited]) {
      int64_t v4 = 2;
    }
    else {
      int64_t v4 = 3;
    }
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = objc_msgSend(v3, "availablePresets", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      int64_t v4 = 1;
LABEL_8:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * v9) isReference]) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
          if (v7) {
            goto LABEL_8;
          }
          goto LABEL_14;
        }
      }
    }
    else
    {
LABEL_14:
      int64_t v4 = 0;
    }
  }
  return v4;
}

- (id)_displayForConfiguration:(id)a3
{
  return (id)[a3 caDisplay];
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[(NSMutableSet *)self->_observedDisplays copy];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [(SBDisplayReferenceModeMonitor *)self _stopObservingDisplay:*(void *)(*((void *)&v10 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  v9.receiver = self;
  v9.super_class = (Class)SBDisplayReferenceModeMonitor;
  [(SBDisplayReferenceModeMonitor *)&v9 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([(NSMutableSet *)self->_observedDisplays containsObject:v11])
  {
    id v13 = v11;
    if ([(SBDisplayReferenceModeMonitor *)self _shouldNotifyObserversOfReferenceModeStatusChangeForDisplay:v13])
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __80__SBDisplayReferenceModeMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke;
      v15[3] = &unk_1E6B09C28;
      v15[4] = self;
      id v16 = v13;
      [(SBDisplayReferenceModeMonitor *)self _enumerateObserversOfDisplay:v16 usingBlock:v15];
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SBDisplayReferenceModeMonitor;
    [(SBDisplayReferenceModeMonitor *)&v14 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

uint64_t __80__SBDisplayReferenceModeMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend(a2, "displayReferenceModeStatusDidChangeForDisplayWithConfiguration:newStatus:");
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  return [v6 _setCachedStatus:a4 forDisplay:v7];
}

- (void)addReferenceModeStatusObserver:(id)a3 forDisplayWithConfiguration:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  if (!v11)
  {
    objc_super v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SBDisplayReferenceModeMonitor.m", 65, @"Invalid parameter not satisfying: %@", @"observer != nil" object file lineNumber description];
  }
  if (!+[SBDisplayReferenceModeMonitor canAddObserverForDisplayWithConfiguration:v7])
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBDisplayReferenceModeMonitor.m", 66, @"Invalid parameter not satisfying: %@", @"[SBDisplayReferenceModeMonitor canAddObserverForDisplayWithConfiguration:configuration]" object file lineNumber description];
  }
  uint64_t v8 = [(SBDisplayReferenceModeMonitor *)self _displayForConfiguration:v7];
  if (v8)
  {
    [(SBDisplayReferenceModeMonitor *)self _addObserver:v11 forDisplay:v8];
    [(SBDisplayReferenceModeMonitor *)self _startObservingDisplayIfNeeded:v8];
    [(SBDisplayReferenceModeMonitor *)self _setConfig:v7 forDisplay:v8];
  }
}

- (void)removeReferenceModeStatusObserver:(id)a3 forDisplayWithConfiguration:(id)a4
{
  id v13 = a3;
  id v7 = a4;
  if (!v13)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SBDisplayReferenceModeMonitor.m", 76, @"Invalid parameter not satisfying: %@", @"observer != nil" object file lineNumber description];
  }
  if (!+[SBDisplayReferenceModeMonitor canAddObserverForDisplayWithConfiguration:v7])
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SBDisplayReferenceModeMonitor.m", 77, @"Invalid parameter not satisfying: %@", @"[SBDisplayReferenceModeMonitor canAddObserverForDisplayWithConfiguration:configuration]" object file lineNumber description];
  }
  uint64_t v8 = [(SBDisplayReferenceModeMonitor *)self _displayForConfiguration:v7];
  [(SBDisplayReferenceModeMonitor *)self _removeObserver:v13 forDisplay:v8];
  objc_super v9 = [(SBDisplayReferenceModeMonitor *)self _observersForDisplay:v8];
  uint64_t v10 = [v9 count];

  if (!v10) {
    [(SBDisplayReferenceModeMonitor *)self _stopObservingDisplay:v8];
  }
}

- (BOOL)_shouldNotifyObserversOfReferenceModeStatusChangeForDisplay:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SBDisplayReferenceModeMonitor *)self _cachedStatusForDisplay:v4];
  int64_t v6 = [(SBDisplayReferenceModeMonitor *)self _referenceModeStatusForDisplay:v4];

  return v5 != v6;
}

- (void)_setCachedStatus:(int64_t)a3 forDisplay:(id)a4
{
  id v11 = a4;
  if (!self->_displayToCachedStatus)
  {
    int64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    displayToCachedStatus = self->_displayToCachedStatus;
    self->_displayToCachedStatus = v6;
  }
  uint64_t v8 = [NSNumber numberWithInteger:a3];
  objc_super v9 = self->_displayToCachedStatus;
  uint64_t v10 = objc_msgSend(v11, "sb_referenceModeObserverUniqueIdentifier");
  [(NSMutableDictionary *)v9 setObject:v8 forKeyedSubscript:v10];
}

- (void)_removeCachedStatusForDisplay:(id)a3
{
  displayToCachedStatus = self->_displayToCachedStatus;
  int64_t v5 = objc_msgSend(a3, "sb_referenceModeObserverUniqueIdentifier");
  [(NSMutableDictionary *)displayToCachedStatus setObject:0 forKeyedSubscript:v5];

  if (![(NSMutableDictionary *)self->_displayToCachedStatus count])
  {
    int64_t v6 = self->_displayToCachedStatus;
    self->_displayToCachedStatus = 0;
  }
}

- (int64_t)_cachedStatusForDisplay:(id)a3
{
  displayToCachedStatus = self->_displayToCachedStatus;
  id v4 = objc_msgSend(a3, "sb_referenceModeObserverUniqueIdentifier");
  int64_t v5 = [(NSMutableDictionary *)displayToCachedStatus objectForKeyedSubscript:v4];
  int64_t v6 = [v5 integerValue];

  return v6;
}

- (id)_configurationForDisplay:(id)a3
{
  CADisplayIdentifierToFBSDisplayConfig = self->_CADisplayIdentifierToFBSDisplayConfig;
  id v4 = objc_msgSend(a3, "sb_referenceModeObserverUniqueIdentifier");
  int64_t v5 = [(NSMutableDictionary *)CADisplayIdentifierToFBSDisplayConfig objectForKeyedSubscript:v4];

  return v5;
}

- (void)_setConfig:(id)a3 forDisplay:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  CADisplayIdentifierToFBSDisplayConfig = self->_CADisplayIdentifierToFBSDisplayConfig;
  if (v12 && !CADisplayIdentifierToFBSDisplayConfig)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    objc_super v9 = self->_CADisplayIdentifierToFBSDisplayConfig;
    self->_CADisplayIdentifierToFBSDisplayConfig = v8;

    CADisplayIdentifierToFBSDisplayConfig = self->_CADisplayIdentifierToFBSDisplayConfig;
  }
  uint64_t v10 = objc_msgSend(v6, "sb_referenceModeObserverUniqueIdentifier");
  [(NSMutableDictionary *)CADisplayIdentifierToFBSDisplayConfig setObject:v12 forKeyedSubscript:v10];

  if (![(NSMutableDictionary *)self->_CADisplayIdentifierToFBSDisplayConfig count])
  {
    id v11 = self->_CADisplayIdentifierToFBSDisplayConfig;
    self->_CADisplayIdentifierToFBSDisplayConfig = 0;
  }
}

- (void)_addObserver:(id)a3 forDisplay:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  CADisplayIdentifierToObservers = self->_CADisplayIdentifierToObservers;
  if (!CADisplayIdentifierToObservers)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    objc_super v9 = self->_CADisplayIdentifierToObservers;
    self->_CADisplayIdentifierToObservers = v8;

    CADisplayIdentifierToObservers = self->_CADisplayIdentifierToObservers;
  }
  uint64_t v10 = objc_msgSend(v6, "sb_referenceModeObserverUniqueIdentifier");
  id v11 = [(NSMutableDictionary *)CADisplayIdentifierToObservers objectForKeyedSubscript:v10];

  if (!v11)
  {
    id v11 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v12 = self->_CADisplayIdentifierToObservers;
    id v13 = objc_msgSend(v6, "sb_referenceModeObserverUniqueIdentifier");
    [(NSMutableDictionary *)v12 setObject:v11 forKeyedSubscript:v13];
  }
  [v11 addObject:v14];
}

- (void)_removeObserver:(id)a3 forDisplay:(id)a4
{
  id v17 = a4;
  CADisplayIdentifierToObservers = self->_CADisplayIdentifierToObservers;
  id v7 = a3;
  uint64_t v8 = objc_msgSend(v17, "sb_referenceModeObserverUniqueIdentifier");
  objc_super v9 = [(NSMutableDictionary *)CADisplayIdentifierToObservers objectForKeyedSubscript:v8];
  [v9 removeObject:v7];

  uint64_t v10 = self->_CADisplayIdentifierToObservers;
  id v11 = objc_msgSend(v17, "sb_referenceModeObserverUniqueIdentifier");
  id v12 = [(NSMutableDictionary *)v10 objectForKeyedSubscript:v11];
  uint64_t v13 = [v12 count];

  if (!v13)
  {
    id v14 = self->_CADisplayIdentifierToObservers;
    uint64_t v15 = objc_msgSend(v17, "sb_referenceModeObserverUniqueIdentifier");
    [(NSMutableDictionary *)v14 setObject:0 forKeyedSubscript:v15];
  }
  if (![(NSMutableDictionary *)self->_CADisplayIdentifierToObservers count])
  {
    id v16 = self->_CADisplayIdentifierToObservers;
    self->_CADisplayIdentifierToObservers = 0;
  }
}

- (id)_observersForDisplay:(id)a3
{
  CADisplayIdentifierToObservers = self->_CADisplayIdentifierToObservers;
  id v4 = objc_msgSend(a3, "sb_referenceModeObserverUniqueIdentifier");
  int64_t v5 = [(NSMutableDictionary *)CADisplayIdentifierToObservers objectForKeyedSubscript:v4];
  id v6 = [v5 allObjects];

  return v6;
}

- (void)_enumerateObserversOfDisplay:(id)a3 usingBlock:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *, int64_t))a4;
  uint64_t v8 = [(SBDisplayReferenceModeMonitor *)self _configurationForDisplay:v6];
  objc_super v9 = [(SBDisplayReferenceModeMonitor *)self _observersForDisplay:v6];
  int64_t v10 = [(SBDisplayReferenceModeMonitor *)self referenceModeStatusForDisplayWithConfiguration:v8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        v7[2](v7, *(void *)(*((void *)&v16 + 1) + 8 * v15++), v8, v10);
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (void)_startObservingDisplayIfNeeded:(id)a3
{
  id v4 = a3;
  observedDisplays = self->_observedDisplays;
  id v8 = v4;
  if (!observedDisplays)
  {
    id v6 = [MEMORY[0x1E4F1CA80] set];
    id v7 = self->_observedDisplays;
    self->_observedDisplays = v6;

    id v4 = v8;
    observedDisplays = self->_observedDisplays;
  }
  if (([(NSMutableSet *)observedDisplays containsObject:v4] & 1) == 0)
  {
    [(NSMutableSet *)self->_observedDisplays addObject:v8];
    [v8 addObserver:self forKeyPath:@"isReference" options:0 context:0];
    [v8 addObserver:self forKeyPath:@"isReferenceLimited" options:0 context:0];
    [(SBDisplayReferenceModeMonitor *)self _setCachedStatus:[(SBDisplayReferenceModeMonitor *)self _referenceModeStatusForDisplay:v8] forDisplay:v8];
  }
}

- (void)_stopObservingDisplay:(id)a3
{
  id v6 = a3;
  int v4 = [(NSMutableSet *)self->_observedDisplays containsObject:v6];
  [(SBDisplayReferenceModeMonitor *)self _setConfig:0 forDisplay:v6];
  [(SBDisplayReferenceModeMonitor *)self _removeCachedStatusForDisplay:v6];
  [(NSMutableSet *)self->_observedDisplays removeObject:v6];
  if ([(NSMutableSet *)self->_observedDisplays count])
  {
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  observedDisplays = self->_observedDisplays;
  self->_observedDisplays = 0;

  if (v4)
  {
LABEL_3:
    [v6 removeObserver:self forKeyPath:@"isReference" context:0];
    [v6 removeObserver:self forKeyPath:@"isReferenceLimited" context:0];
  }
LABEL_4:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedDisplays, 0);
  objc_storeStrong((id *)&self->_CADisplayIdentifierToFBSDisplayConfig, 0);
  objc_storeStrong((id *)&self->_CADisplayIdentifierToObservers, 0);
  objc_storeStrong((id *)&self->_displayToCachedStatus, 0);
}

@end