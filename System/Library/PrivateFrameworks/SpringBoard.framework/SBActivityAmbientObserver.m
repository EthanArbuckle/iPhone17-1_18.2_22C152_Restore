@interface SBActivityAmbientObserver
- (BOOL)hasPendingItem;
- (BOOL)isActiveActivityItem:(id)a3;
- (BOOL)shouldHandleActivityItem:(id)a3;
- (NSMutableOrderedSet)activeActivityItems;
- (NSMutableOrderedSet)pendingItems;
- (SBActivityAmbientObserver)init;
- (SBActivityAmbientObserverDelegate)delegate;
- (SBActivityItem)nextPendingItem;
- (id)_sortActivityItems;
- (void)activityDidEnd:(id)a3;
- (void)activityDidStart:(id)a3;
- (void)activityProminenceChanged:(BOOL)a3 item:(id)a4;
- (void)addOverlaysForOngoingActivitiesIfNecessary;
- (void)addPendingItem:(id)a3;
- (void)dealloc;
- (void)dismissAlert:(id)a3;
- (void)presentAlert:(id)a3;
- (void)removePendingItem:(id)a3;
- (void)setActiveActivityItems:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPendingItems:(id)a3;
@end

@implementation SBActivityAmbientObserver

- (SBActivityAmbientObserver)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)SBActivityAmbientObserver;
  v2 = [(SBActivityAmbientObserver *)&v19 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    activeActivityItems = v2->_activeActivityItems;
    v2->_activeActivityItems = (NSMutableOrderedSet *)v3;

    uint64_t v5 = objc_opt_new();
    pendingItems = v2->_pendingItems;
    v2->_pendingItems = (NSMutableOrderedSet *)v5;

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v7 = +[SBActivityManager sharedInstance];
    v8 = [v7 activities];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          if ([(SBActivityAmbientObserver *)v2 shouldHandleActivityItem:v13]) {
            [(NSMutableOrderedSet *)v2->_activeActivityItems addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v10);
    }
  }
  return v2;
}

- (void)dealloc
{
  [(NSMutableOrderedSet *)self->_activeActivityItems removeAllObjects];
  activeActivityItems = self->_activeActivityItems;
  self->_activeActivityItems = 0;

  v4.receiver = self;
  v4.super_class = (Class)SBActivityAmbientObserver;
  [(SBActivityAmbientObserver *)&v4 dealloc];
}

- (void)addOverlaysForOngoingActivitiesIfNecessary
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SBActivityAmbientObserver *)self _sortActivityItems];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
        uint64_t v9 = [(SBActivityAmbientObserver *)self delegate];
        [v9 addActivityItem:v8 forOngoingActivity:1];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)addPendingItem:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = SBLogActivity();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [v4 identifier];
      int v7 = 138543362;
      uint64_t v8 = v6;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] adding ambient item to pending items", (uint8_t *)&v7, 0xCu);
    }
    [(NSMutableOrderedSet *)self->_pendingItems addObject:v4];
  }
}

- (void)removePendingItem:(id)a3
{
  if (a3) {
    -[NSMutableOrderedSet removeObject:](self->_pendingItems, "removeObject:");
  }
}

- (BOOL)hasPendingItem
{
  return [(NSMutableOrderedSet *)self->_pendingItems count] != 0;
}

- (SBActivityItem)nextPendingItem
{
  if ([(SBActivityAmbientObserver *)self hasPendingItem])
  {
    uint64_t v3 = [(NSMutableOrderedSet *)self->_pendingItems objectAtIndex:0];
  }
  else
  {
    uint64_t v3 = 0;
  }
  return (SBActivityItem *)v3;
}

- (BOOL)isActiveActivityItem:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  uint64_t v5 = [(SBActivityAmbientObserver *)self activeActivityItems];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (void)activityDidStart:(id)a3
{
  id v5 = a3;
  if ((-[NSMutableOrderedSet containsObject:](self->_activeActivityItems, "containsObject:") & 1) == 0) {
    [(NSMutableOrderedSet *)self->_activeActivityItems addObject:v5];
  }
  id v4 = [(SBActivityAmbientObserver *)self delegate];
  [v4 addActivityItem:v5 forOngoingActivity:0];
}

- (void)activityDidEnd:(id)a3
{
  id v5 = a3;
  if (-[NSMutableOrderedSet containsObject:](self->_activeActivityItems, "containsObject:"))
  {
    [(NSMutableOrderedSet *)self->_activeActivityItems removeObject:v5];
    [(NSMutableOrderedSet *)self->_pendingItems removeObject:v5];
    id v4 = [(SBActivityAmbientObserver *)self delegate];
    [v4 removeActivityItem:v5];
  }
}

- (BOOL)shouldHandleActivityItem:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v3 = [a3 descriptor];
  id v4 = [v3 presentationOptions];
  id v5 = [v4 destinations];
  char v6 = objc_msgSend(v5, "bs_containsObjectPassingTest:", &__block_literal_global_178);

  int v7 = +[SBLiveActivityDomain rootSettings];
  char v8 = [v7 hideActivitiesInAmbient];

  char v9 = v6 & ~v8;
  return v9;
}

BOOL __54__SBActivityAmbientObserver_shouldHandleActivityItem___block_invoke(uint64_t a1, void *a2)
{
  return [a2 destination] == 3;
}

- (void)presentAlert:(id)a3
{
  id v4 = a3;
  activeActivityItems = self->_activeActivityItems;
  id v8 = v4;
  char v6 = [v4 item];
  LODWORD(activeActivityItems) = [(NSMutableOrderedSet *)activeActivityItems containsObject:v6];

  if (activeActivityItems)
  {
    int v7 = [(SBActivityAmbientObserver *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v7 presentAmbientActivityAlert:v8];
    }
  }
}

- (void)dismissAlert:(id)a3
{
  id v4 = a3;
  activeActivityItems = self->_activeActivityItems;
  id v8 = v4;
  char v6 = [v4 item];
  LODWORD(activeActivityItems) = [(NSMutableOrderedSet *)activeActivityItems containsObject:v6];

  if (activeActivityItems)
  {
    int v7 = [(SBActivityAmbientObserver *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v7 dismissAmbientActivityAlert:v8];
    }
  }
}

- (void)activityProminenceChanged:(BOOL)a3 item:(id)a4
{
  BOOL v4 = a3;
  char v6 = [a4 identifier];
  activeActivityItems = self->_activeActivityItems;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__SBActivityAmbientObserver_activityProminenceChanged_item___block_invoke;
  v11[3] = &unk_1E6B02D30;
  id v8 = v6;
  id v12 = v8;
  char v9 = [(NSMutableOrderedSet *)activeActivityItems bs_firstObjectPassingTest:v11];
  if (v9)
  {
    long long v10 = [[SBActivityAlert alloc] initWithItem:v9 payloadIdentifier:0 options:0 title:0 body:0];
    if (v4) {
      [(SBActivityAmbientObserver *)self presentAlert:v10];
    }
    else {
      [(SBActivityAmbientObserver *)self dismissAlert:v10];
    }
  }
}

uint64_t __60__SBActivityAmbientObserver_activityProminenceChanged_item___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)_sortActivityItems
{
  objc_initWeak(&location, self);
  activeActivityItems = self->_activeActivityItems;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__SBActivityAmbientObserver__sortActivityItems__block_invoke;
  v6[3] = &unk_1E6B02D58;
  objc_copyWeak(&v7, &location);
  uint64_t v4 = [(NSMutableOrderedSet *)activeActivityItems sortedArrayUsingComparator:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v4;
}

uint64_t __47__SBActivityAmbientObserver__sortActivityItems__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [v5 descriptor];
  char v9 = [v8 platterTargetBundleIdentifier];

  long long v10 = [v6 descriptor];
  long long v11 = [v10 platterTargetBundleIdentifier];

  if (WeakRetained)
  {
    if ([v9 isEqualToString:v11])
    {
      [v5 relevanceScore];
      double v13 = v12;
      [v6 relevanceScore];
      uint64_t v15 = v13 < v14;
    }
    else
    {
      long long v16 = +[SBActivityManager sharedInstance];
      long long v17 = [v16 firstPartyActivityGroupingIdentifiers];

      unint64_t v18 = [v17 indexOfObject:v9];
      unint64_t v19 = [v17 indexOfObject:v11];
      if (v19 == 0x7FFFFFFFFFFFFFFFLL || v18 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v19 == 0x7FFFFFFFFFFFFFFFLL || v18 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (v18 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v20 = [v5 descriptor];
            uint64_t v21 = [v20 createdDate];

            v22 = [v6 descriptor];
            v23 = [v22 createdDate];

            uint64_t v15 = [v21 compare:v23];
          }
          else
          {
            uint64_t v15 = -1;
          }
        }
        else if (v19 < v18)
        {
          uint64_t v15 = 1;
        }
        else
        {
          uint64_t v15 = -1;
        }
      }
      else
      {
        uint64_t v15 = 1;
      }
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (SBActivityAmbientObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBActivityAmbientObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableOrderedSet)activeActivityItems
{
  return self->_activeActivityItems;
}

- (void)setActiveActivityItems:(id)a3
{
}

- (NSMutableOrderedSet)pendingItems
{
  return self->_pendingItems;
}

- (void)setPendingItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingItems, 0);
  objc_storeStrong((id *)&self->_activeActivityItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end