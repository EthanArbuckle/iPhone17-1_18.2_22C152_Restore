@interface SBAppInteractionEventSourceManager
+ (id)sharedInstance;
- (NSHashTable)observers;
- (NSMapTable)windowScenesToEventSources;
- (SBAppInteractionEventSourceManager)init;
- (id)eventSourceForWindowScene:(id)a3;
- (void)addObserver:(id)a3;
- (void)eventSource:(id)a3 applicationsBecameHidden:(id)a4;
- (void)eventSource:(id)a3 applicationsBecameVisible:(id)a4;
- (void)eventSource:(id)a3 didBeginTransitionToMode:(int64_t)a4 withLayoutState:(id)a5 activatingElement:(id)a6 triggeredBy:(int64_t)a7;
- (void)eventSource:(id)a3 didFinishTransitionToMode:(int64_t)a4 withLayoutState:(id)a5 activatingElement:(id)a6 triggeredBy:(int64_t)a7;
- (void)eventSource:(id)a3 keyboardFocusChangedToApplication:(id)a4;
- (void)eventSource:(id)a3 userDeletedApplications:(id)a4;
- (void)eventSource:(id)a3 userDeletedWebBookmark:(id)a4;
- (void)eventSource:(id)a3 userQuitApplicationInSwitcher:(id)a4;
- (void)eventSource:(id)a3 userRemovedSuggestions:(id)a4;
- (void)eventSource:(id)a3 userTouchedApplication:(id)a4;
- (void)eventSource:(id)a3 userTouchedApplication:(id)a4 pid:(int)a5 inContext:(unsigned int)a6;
- (void)removeObserver:(id)a3;
- (void)windowSceneDidConnect:(id)a3;
- (void)windowSceneDidDisconnect:(id)a3;
@end

@implementation SBAppInteractionEventSourceManager

- (void)eventSource:(id)a3 didBeginTransitionToMode:(int64_t)a4 withLayoutState:(id)a5 activatingElement:(id)a6 triggeredBy:(int64_t)a7
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v12 = self->_observers;
  uint64_t v13 = [(NSHashTable *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v19 + 1) + 8 * v16);
        if (objc_opt_respondsToSelector()) {
          [v17 eventSource:self didBeginTransitionToMode:a4 withLayoutState:v10 activatingElement:v11 triggeredBy:a7];
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSHashTable *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }
}

- (void)eventSource:(id)a3 didFinishTransitionToMode:(int64_t)a4 withLayoutState:(id)a5 activatingElement:(id)a6 triggeredBy:(int64_t)a7
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v12 = self->_observers;
  uint64_t v13 = [(NSHashTable *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v19 + 1) + 8 * v16);
        if (objc_opt_respondsToSelector()) {
          [v17 eventSource:self didFinishTransitionToMode:a4 withLayoutState:v10 activatingElement:v11 triggeredBy:a7];
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSHashTable *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }
}

- (void)eventSource:(id)a3 userTouchedApplication:(id)a4 pid:(int)a5 inContext:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = self->_observers;
  uint64_t v11 = [(NSHashTable *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v16 + 1) + 8 * v14);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v15, "eventSource:userTouchedApplication:pid:inContext:", self, v9, v7, v6, (void)v16);
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSHashTable *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }
}

+ (id)sharedInstance
{
  if (sharedInstance___once_5 != -1) {
    dispatch_once(&sharedInstance___once_5, &__block_literal_global_187);
  }
  v2 = (void *)sharedInstance___controller_0;
  return v2;
}

void __52__SBAppInteractionEventSourceManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SBAppInteractionEventSourceManager);
  v1 = (void *)sharedInstance___controller_0;
  sharedInstance___controller_0 = (uint64_t)v0;
}

- (SBAppInteractionEventSourceManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBAppInteractionEventSourceManager;
  v2 = [(SBAppInteractionEventSourceManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    windowScenesToEventSources = v2->_windowScenesToEventSources;
    v2->_windowScenesToEventSources = (NSMapTable *)v3;
  }
  return v2;
}

- (id)eventSourceForWindowScene:(id)a3
{
  id v4 = a3;
  v5 = [(NSMapTable *)self->_windowScenesToEventSources objectForKey:v4];
  if (!v5)
  {
    v5 = objc_alloc_init(SBDisplayAppInteractionEventSource);
    [(NSMapTable *)self->_windowScenesToEventSources setObject:v5 forKey:v4];
  }

  return v5;
}

- (void)windowSceneDidConnect:(id)a3
{
  id v4 = a3;
  id v5 = [(SBAppInteractionEventSourceManager *)self eventSourceForWindowScene:v4];
  [v5 windowSceneDidConnect:v4];

  [v5 addObserver:self];
}

- (void)windowSceneDidDisconnect:(id)a3
{
  id v6 = a3;
  id v4 = -[NSMapTable objectForKey:](self->_windowScenesToEventSources, "objectForKey:");
  id v5 = v4;
  if (v4) {
    [v4 removeObserver:self];
  }
  [(NSMapTable *)self->_windowScenesToEventSources removeObjectForKey:v6];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    id v6 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    uint64_t v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)removeObserver:(id)a3
{
}

- (void)eventSource:(id)a3 userRemovedSuggestions:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->_observers;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v11, "eventSource:userRemovedSuggestions:", self, v5, (void)v12);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)eventSource:(id)a3 userDeletedApplications:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->_observers;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v11, "eventSource:userDeletedApplications:", self, v5, (void)v12);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)eventSource:(id)a3 userQuitApplicationInSwitcher:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->_observers;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v11, "eventSource:userQuitApplicationInSwitcher:", self, v5, (void)v12);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)eventSource:(id)a3 applicationsBecameHidden:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->_observers;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v11, "eventSource:applicationsBecameHidden:", self, v5, (void)v12);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)eventSource:(id)a3 applicationsBecameVisible:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->_observers;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v11, "eventSource:applicationsBecameVisible:", self, v5, (void)v12);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)eventSource:(id)a3 userDeletedWebBookmark:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->_observers;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v11, "eventSource:userDeletedWebBookmark:", self, v5, (void)v12);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)eventSource:(id)a3 userTouchedApplication:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->_observers;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v11, "eventSource:userTouchedApplication:", self, v5, (void)v12);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)eventSource:(id)a3 keyboardFocusChangedToApplication:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->_observers;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v11, "eventSource:keyboardFocusChangedToApplication:", self, v5, (void)v12);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (NSMapTable)windowScenesToEventSources
{
  return self->_windowScenesToEventSources;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_windowScenesToEventSources, 0);
}

@end