@interface BSUILibraryItemStateCenter
- (BSUILibraryItemStateCenter)initWithProvider:(id)a3;
- (BSUILibraryItemStateProviding)provider;
- (NSMapTable)observers;
- (id)dynamicStateForKind:(id)a3 instance:(id)a4 parameters:(id)a5;
- (id)mapItemState:(id)a3;
- (id)observersToNotifyForItemIdentifier:(id)a3;
- (void)_notifyObserversItemUpdatedFor:(id)a3 itemState:(id)a4;
- (void)addObserver:(id)a3 forItemIdentifier:(id)a4;
- (void)addOrUpdateObserver:(id)a3 forSingleItemIdentifier:(id)a4;
- (void)aq_updateInterest;
- (void)insertOrUpdateItemWithIdentifier:(id)a3 state:(id)a4;
- (void)removeObserver:(id)a3;
- (void)removeObserver:(id)a3 forItemIdentifier:(id)a4;
- (void)setObservers:(id)a3;
- (void)updateItemWithIdentifier:(id)a3 state:(id)a4;
- (void)updateItemWithIdentifier:(id)a3 state:(id)a4 allowsInsert:(BOOL)a5;
@end

@implementation BSUILibraryItemStateCenter

- (BSUILibraryItemStateCenter)initWithProvider:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BSUILibraryItemStateCenter;
  v5 = [(BSUILibraryItemStateCenter *)&v14 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_provider, v4);
    uint64_t v7 = +[NSMapTable mapTableWithKeyOptions:0 valueOptions:517];
    instanceMap = v6->_instanceMap;
    v6->_instanceMap = (NSMapTable *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("BSUILibraryItemStateCenter.access", 0);
    access = v6->_access;
    v6->_access = (OS_dispatch_queue *)v9;

    uint64_t v11 = +[NSMapTable mapTableWithKeyOptions:517 valueOptions:0];
    observers = v6->_observers;
    v6->_observers = (NSMapTable *)v11;
  }
  return v6;
}

- (id)mapItemState:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  v5 = [v3 itemIdentifier];
  [v4 setObject:v5 forKeyedSubscript:@"itemIdentifier"];

  v6 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isSample]);
  [v4 setObject:v6 forKeyedSubscript:@"sample"];

  uint64_t v7 = [v3 readingProgress];
  [v4 setObject:v7 forKeyedSubscript:@"readingProgress"];

  v8 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 wantToRead]);
  [v4 setObject:v8 forKeyedSubscript:@"wantToRead"];

  dispatch_queue_t v9 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isUpdateAvailable]);
  [v4 setObject:v9 forKeyedSubscript:@"updateAvailable"];

  v10 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isStreamable]);
  [v4 setObject:v10 forKeyedSubscript:@"streamable"];

  if ((unint64_t)[v3 library] > 5) {
    CFStringRef v11 = @"unknown";
  }
  else {
    CFStringRef v11 = off_38E778[(void)[v3 library]];
  }
  [v4 setObject:v11 forKeyedSubscript:@"library"];
  if ((unint64_t)[v3 download] > 2) {
    CFStringRef v12 = @"unknown";
  }
  else {
    CFStringRef v12 = off_38E7A8[(void)[v3 download]];
  }
  [v4 setObject:v12 forKeyedSubscript:@"download"];
  if ((unint64_t)[v3 play] > 2) {
    CFStringRef v13 = @"unknown";
  }
  else {
    CFStringRef v13 = off_38E7C0[(void)[v3 play]];
  }
  [v4 setObject:v13 forKeyedSubscript:@"play"];
  objc_super v14 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isTrackedAsRecent]);
  [v4 setObject:v14 forKeyedSubscript:@"trackedAsRecent"];

  v15 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isPurchased]);
  [v4 setObject:v15 forKeyedSubscript:@"isPurchased"];

  return v4;
}

- (id)dynamicStateForKind:(id)a3 instance:(id)a4 parameters:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = sub_15EBC;
  v32 = sub_15ECC;
  id v33 = 0;
  objc_opt_class();
  CFStringRef v12 = BUDynamicCast();
  if (v12
    || (objc_opt_respondsToSelector() & 1) != 0
    && ([v9 stringValue], (CFStringRef v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    access = self->_access;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_15ED4;
    block[3] = &unk_38E388;
    v27 = &v28;
    block[4] = self;
    id v14 = v12;
    id v26 = v14;
    dispatch_sync(access, block);
    if (!v29[5])
    {
      v15 = [WeakRetained itemStateWithIdentifier:v14];
      if (v15)
      {
        v16 = [(BSUILibraryItemStateCenter *)self mapItemState:v15];
        uint64_t v17 = +[TUIMutableDynamicValue valueWithValue:v16];
        v18 = (void *)v29[5];
        v29[5] = v17;

        sub_15F24((uint64_t)self, (void *)v29[5], v14);
        v19 = self->_access;
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_16000;
        v22[3] = &unk_38E3B0;
        v22[4] = self;
        id v23 = v14;
        v24 = &v28;
        dispatch_sync(v19, v22);
      }
    }
  }
  else
  {
    id v14 = 0;
  }
  id v20 = (id)v29[5];

  _Block_object_dispose(&v28, 8);

  return v20;
}

- (void)updateItemWithIdentifier:(id)a3 state:(id)a4
{
}

- (void)insertOrUpdateItemWithIdentifier:(id)a3 state:(id)a4
{
}

- (void)updateItemWithIdentifier:(id)a3 state:(id)a4 allowsInsert:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_15EBC;
  v21 = sub_15ECC;
  id v22 = 0;
  id v10 = [(BSUILibraryItemStateCenter *)self mapItemState:v9];
  if (v8)
  {
    access = self->_access;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1621C;
    block[3] = &unk_38E7E0;
    v15 = &v17;
    block[4] = self;
    id v13 = v8;
    BOOL v16 = a5;
    id v14 = v10;
    dispatch_sync(access, block);
  }
  [(id)v18[5] updateWithValue:v10];
  [(BSUILibraryItemStateCenter *)self _notifyObserversItemUpdatedFor:v8 itemState:v9];

  _Block_object_dispose(&v17, 8);
}

- (void)aq_updateInterest
{
  id v3 = [(NSMapTable *)self->_instanceMap keyEnumerator];
  id v4 = [v3 allObjects];
  v5 = +[NSMutableSet setWithArray:v4];

  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_163F4;
  CFStringRef v11 = &unk_38E1F8;
  CFStringRef v12 = self;
  id v13 = v5;
  id v6 = v5;
  os_unfair_lock_lock_with_options();
  sub_163F4((uint64_t)&v8);
  os_unfair_lock_unlock(&self->_accessLock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  [WeakRetained updateInterest:v6, v8, v9];
}

- (id)observersToNotifyForItemIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_15EBC;
  id v20 = sub_15ECC;
  id v21 = +[NSMutableArray array];
  p_accessLock = &self->_accessLock;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  CFStringRef v11 = sub_16670;
  CFStringRef v12 = &unk_38E3B0;
  id v13 = self;
  id v6 = v4;
  id v14 = v6;
  v15 = &v16;
  uint64_t v7 = v10;
  os_unfair_lock_lock_with_options();
  v11((uint64_t)v7);
  os_unfair_lock_unlock(p_accessLock);

  id v8 = [(id)v17[5] copy];
  _Block_object_dispose(&v16, 8);

  return v8;
}

- (void)addObserver:(id)a3 forItemIdentifier:(id)a4
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  void v10[2] = sub_168F0;
  v10[3] = &unk_38E360;
  v10[4] = self;
  id v11 = a3;
  id v12 = a4;
  id v6 = v12;
  id v7 = v11;
  os_unfair_lock_lock_with_options();
  sub_168F0((uint64_t)v10);
  os_unfair_lock_unlock(&self->_accessLock);
  access = self->_access;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_169B4;
  v9[3] = &unk_38E738;
  v9[4] = self;
  dispatch_sync(access, v9);
}

- (void)addOrUpdateObserver:(id)a3 forSingleItemIdentifier:(id)a4
{
  id v6 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_16AF4;
  v11[3] = &unk_38E360;
  v11[4] = self;
  id v12 = a4;
  id v13 = v6;
  id v7 = v6;
  id v8 = v12;
  os_unfair_lock_lock_with_options();
  sub_16AF4((uint64_t)v11);
  os_unfair_lock_unlock(&self->_accessLock);
  access = self->_access;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  void v10[2] = sub_16B6C;
  v10[3] = &unk_38E738;
  v10[4] = self;
  dispatch_sync(access, v10);
}

- (void)removeObserver:(id)a3 forItemIdentifier:(id)a4
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  void v10[2] = sub_16CA8;
  v10[3] = &unk_38E360;
  v10[4] = self;
  id v11 = a3;
  id v12 = a4;
  id v6 = v12;
  id v7 = v11;
  os_unfair_lock_lock_with_options();
  sub_16CA8((uint64_t)v10);
  os_unfair_lock_unlock(&self->_accessLock);
  access = self->_access;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_16DA0;
  v9[3] = &unk_38E738;
  v9[4] = self;
  dispatch_sync(access, v9);
}

- (void)removeObserver:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_16EB0;
  v7[3] = &unk_38E1F8;
  v7[4] = self;
  id v8 = a3;
  id v4 = v8;
  os_unfair_lock_lock_with_options();
  sub_16EB0((uint64_t)v7);
  os_unfair_lock_unlock(&self->_accessLock);
  access = self->_access;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_16F04;
  block[3] = &unk_38E738;
  block[4] = self;
  dispatch_sync(access, block);
}

- (void)_notifyObserversItemUpdatedFor:(id)a3 itemState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = -[BSUILibraryItemStateCenter observersToNotifyForItemIdentifier:](self, "observersToNotifyForItemIdentifier:", v6, 0);
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) libraryItemStateCenter:self didUpdateItemState:v7 forIdentifier:v6];
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (BSUILibraryItemStateProviding)provider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);

  return (BSUILibraryItemStateProviding *)WeakRetained;
}

- (NSMapTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_provider);
  objc_storeStrong((id *)&self->_access, 0);

  objc_storeStrong((id *)&self->_instanceMap, 0);
}

@end