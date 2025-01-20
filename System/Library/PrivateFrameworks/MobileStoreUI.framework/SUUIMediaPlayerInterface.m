@interface SUUIMediaPlayerInterface
+ (BOOL)identifierMatches:(id)a3 item:(id)a4;
+ (BOOL)isRadioItemIdentifier:(id)a3;
+ (id)sharedInstance;
- (BOOL)identifierIsOnDeck:(id)a3;
- (BOOL)isItemWithIdentifierActive:(id)a3;
- (SUUIMediaPlayerInterface)init;
- (id)_itemFromNotification:(id)a3;
- (id)_playerForNotification:(id)a3;
- (id)playerForItemWithIdentifier:(id)a3;
- (void)_bufferingStateChangedNotification:(id)a3;
- (void)_cancelOnDeckItem;
- (void)_createPeriodicTimeObserverIfNeeded:(id)a3;
- (void)_currentItemDurationAvailableNotification:(id)a3;
- (void)_destroyPeridicTimeObseverIfNeeded:(id)a3;
- (void)_itemDidChange:(id)a3 incomingItem:(id)a4;
- (void)_notifiyObserversOfItemChange:(id)a3;
- (void)_notifyFinishedItem:(id)a3;
- (void)_notifyObserversOfItemStateChange;
- (void)_onDeckTimedOut;
- (void)_playbackErrorNotification:(id)a3;
- (void)_playerItemDidChangeNotification:(id)a3;
- (void)_playerItemReady:(id)a3;
- (void)_playerItemWillChangeNotification:(id)a3;
- (void)_playerRateDidChangeNotification:(id)a3;
- (void)_registerForNotificationsForCurrentItem:(id)a3;
- (void)_setCurrentTimeIfPossible:(double)a3 player:(id)a4;
- (void)_startOnDeckTimer;
- (void)_unregisterForNotificationsForCurrentItem:(id)a3;
- (void)_updateBufferingState:(unint64_t)a3 player:(id)a4;
- (void)_updateDurationForPlayerItem:(id)a3 withMPAVItem:(id)a4;
- (void)_updateItemForPlayer:(id)a3 currentTime:(double)a4;
- (void)_updateTimeValuesUsingItemTime:(BOOL)a3 player:(id)a4 item:(id)a5;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)notifyWillChangeToItemWithItemIdentifer:(id)a3;
- (void)removeObserver:(id)a3;
- (void)togglePlayStateForItemWithIdentifier:(id)a3;
@end

@implementation SUUIMediaPlayerInterface

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__SUUIMediaPlayerInterface_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_sOnce != -1) {
    dispatch_once(&sharedInstance_sOnce, block);
  }
  v2 = (void *)sharedInstance_smpi;
  return v2;
}

uint64_t __42__SUUIMediaPlayerInterface_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedInstance_smpi;
  sharedInstance_smpi = (uint64_t)v1;
  return MEMORY[0x270F9A758](v1, v2);
}

- (SUUIMediaPlayerInterface)init
{
  v24.receiver = self;
  v24.super_class = (Class)SUUIMediaPlayerInterface;
  uint64_t v2 = [(SUUIMediaPlayerInterface *)&v24 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0 valueOptions:0 capacity:0];
    players = v2->_players;
    v2->_players = (NSMapTable *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.iTunesStoreUI.SUUIMediaPlayerInterface", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.iTunesStoreUI.SUUIMediaPlayerInterface.dispatch", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.iTunesStoreUI.SUUIMediaPlayerInterface.observers", 0);
    observerQueue = v2->_observerQueue;
    v2->_observerQueue = (OS_dispatch_queue *)v9;

    v11 = [MEMORY[0x263F08A00] defaultCenter];
    v12 = (void *)SUUIMediaPlayerFramework();
    id v13 = *(id *)SUUIWeakLinkedSymbolForString("MPAVControllerItemChangedNotification", v12);
    [v11 addObserver:v2 selector:sel__playerItemDidChangeNotification_ name:v13 object:0];
    v14 = (void *)SUUIMediaPlayerFramework();
    id v15 = *(id *)SUUIWeakLinkedSymbolForString("MPAVControllerItemWillChangeNotification", v14);
    [v11 addObserver:v2 selector:sel__playerItemWillChangeNotification_ name:v15 object:0];
    v16 = (void *)SUUIMediaPlayerFramework();
    id v17 = *(id *)SUUIWeakLinkedSymbolForString("MPAVControllerItemReadyToPlayNotification", v16);
    [v11 addObserver:v2 selector:sel__playerItemReady_ name:v17 object:0];
    v18 = (void *)SUUIMediaPlayerFramework();
    id v19 = *(id *)SUUIWeakLinkedSymbolForString("MPAVControllerRateDidChangeNotification", v18);
    [v11 addObserver:v2 selector:sel__playerRateDidChangeNotification_ name:v19 object:0];
    v20 = (void *)SUUIMediaPlayerFramework();
    id v21 = *(id *)SUUIWeakLinkedSymbolForString("MPAVControllerBufferingStateChangedNotification", v20);
    [v11 addObserver:v2 selector:sel__bufferingStateChangedNotification_ name:v21 object:0];
    v22 = (void *)SUUIMediaPlayerFramework();
    objc_msgSend(v11, "addObserver:selector:name:object:", v2, sel__playbackErrorNotification_, *(void *)SUUIWeakLinkedSymbolForString("MPAVControllerPlaybackErrorNotification", v22), 0);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  v4 = (void *)SUUIMediaPlayerFramework();
  id v5 = *(id *)SUUIWeakLinkedSymbolForString("MPAVControllerItemChangedNotification", v4);
  [v3 removeObserver:self name:v5 object:0];
  v6 = (void *)SUUIMediaPlayerFramework();
  id v7 = *(id *)SUUIWeakLinkedSymbolForString("MPAVControllerItemWillChangeNotification", v6);
  [v3 removeObserver:self name:v7 object:0];
  v8 = (void *)SUUIMediaPlayerFramework();
  id v9 = *(id *)SUUIWeakLinkedSymbolForString("MPAVControllerItemReadyToPlayNotification", v8);
  [v3 removeObserver:self name:v9 object:0];
  v10 = (void *)SUUIMediaPlayerFramework();
  id v11 = *(id *)SUUIWeakLinkedSymbolForString("MPAVControllerRateDidChangeNotification", v10);
  [v3 removeObserver:self name:v11 object:0];
  v12 = (void *)SUUIMediaPlayerFramework();
  id v13 = *(id *)SUUIWeakLinkedSymbolForString("MPAVControllerBufferingStateChangedNotification", v12);
  [v3 removeObserver:self name:v13 object:0];
  v14 = (void *)SUUIMediaPlayerFramework();
  objc_msgSend(v3, "removeObserver:name:object:", self, *(void *)SUUIWeakLinkedSymbolForString("MPAVControllerPlaybackErrorNotification", v14), 0);

  v15.receiver = self;
  v15.super_class = (Class)SUUIMediaPlayerInterface;
  [(SUUIMediaPlayerInterface *)&v15 dealloc];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__SUUIMediaPlayerInterface_addObserver___block_invoke;
  v7[3] = &unk_265400890;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

uint64_t __40__SUUIMediaPlayerInterface_addObserver___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (!v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F088B0]) initWithOptions:517 capacity:0];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  return [v2 addObject:v6];
}

- (BOOL)isItemWithIdentifierActive:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(NSMapTable *)self->_players keyEnumerator];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = -[NSMapTable objectForKey:](self->_players, "objectForKey:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        id v11 = [v10 playerItem];
        v12 = [v10 player];
        id v13 = [v12 currentItem];

        if (v13
          && +[SUUIMediaPlayerInterface identifierMatches:v4 item:v11])
        {

          BOOL v14 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 0;
LABEL_12:

  return v14;
}

+ (BOOL)identifierMatches:(id)a3 item:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    v10 = [v8 storeID];
    if (v10)
    {
      id v4 = [v9 storeID];
      if ([v4 isEqualToString:v7])
      {
        char v11 = 1;
        goto LABEL_13;
      }
    }
    v12 = [v9 storeAlbumID];
    if (v12
      && ([v9 storeAlbumID],
          id v5 = objc_claimAutoreleasedReturnValue(),
          ([v5 isEqualToString:v7] & 1) != 0))
    {
      char v11 = 1;
    }
    else
    {
      uint64_t v13 = [v9 itemIdentifier];
      if (v13)
      {
        BOOL v14 = (void *)v13;
        objc_super v15 = [v9 itemIdentifier];
        char v11 = [v15 isEqualToString:v7];

        if (!v12) {
          goto LABEL_12;
        }
      }
      else
      {
        char v11 = 0;
        if (!v12)
        {
LABEL_12:
          if (!v10)
          {
LABEL_14:

            goto LABEL_15;
          }
LABEL_13:

          goto LABEL_14;
        }
      }
    }

    goto LABEL_12;
  }
  char v11 = 0;
LABEL_15:

  return v11;
}

+ (BOOL)isRadioItemIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    if ([v3 hasPrefix:@"ra."]) {
      char v5 = 1;
    }
    else {
      char v5 = [v4 hasPrefix:@"st."];
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)identifierIsOnDeck:(id)a3
{
  id v4 = a3;
  BOOL v8 = 0;
  if (v4)
  {
    onDeckItem = self->_onDeckItem;
    if (onDeckItem)
    {
      uint64_t v6 = [(SUUIMediaPlayerItemStatus *)onDeckItem itemIdentifier];
      char v7 = [v6 isEqualToString:v4];

      if (v7) {
        BOOL v8 = 1;
      }
    }
  }

  return v8;
}

- (void)notifyWillChangeToItemWithItemIdentifer:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(NSMapTable *)self->_players keyEnumerator];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = -[NSMapTable objectForKey:](self->_players, "objectForKey:", *(void *)(*((void *)&v18 + 1) + 8 * v9), (void)v18);
        char v11 = [v10 currentItem];
        v12 = [v10 playerItem];
        if (v12
          && +[SUUIMediaPlayerInterface identifierMatches:v4 item:v12])
        {

          goto LABEL_18;
        }
        if (v11) {
          [(SUUIMediaPlayerInterface *)self _unregisterForNotificationsForCurrentItem:v11];
        }
        [(SUUIMediaPlayerInterface *)self _destroyPeridicTimeObseverIfNeeded:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  onDeckItem = self->_onDeckItem;
  if (!onDeckItem) {
    goto LABEL_16;
  }
  BOOL v14 = [(SUUIMediaPlayerItemStatus *)onDeckItem itemIdentifier];
  char v15 = [v14 isEqualToString:v4];

  if ((v15 & 1) == 0)
  {
    if (self->_onDeckItem) {
      [(SUUIMediaPlayerInterface *)self _cancelOnDeckItem];
    }
LABEL_16:
    long long v16 = (SUUIMediaPlayerItemStatus *)objc_opt_new();
    long long v17 = self->_onDeckItem;
    self->_onDeckItem = v16;

    [(SUUIMediaPlayerItemStatus *)self->_onDeckItem setItemIdentifier:v4];
    [(SUUIMediaPlayerItemStatus *)self->_onDeckItem setPlayState:1];
    [(SUUIMediaPlayerInterface *)self _notifiyObserversOfItemChange:self->_onDeckItem];
    [(SUUIMediaPlayerInterface *)self _startOnDeckTimer];
  }
LABEL_18:
}

- (id)playerForItemWithIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(NSMapTable *)self->_players keyEnumerator];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = -[NSMapTable objectForKey:](self->_players, "objectForKey:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        char v11 = [v10 playerItem];
        v12 = [v10 player];
        uint64_t v13 = [v12 currentItem];

        if (v13
          && +[SUUIMediaPlayerInterface identifierMatches:v4 item:v11])
        {

          goto LABEL_12;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__SUUIMediaPlayerInterface_removeObserver___block_invoke;
  v7[3] = &unk_265400890;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, v7);
}

uint64_t __43__SUUIMediaPlayerInterface_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
}

- (void)togglePlayStateForItemWithIdentifier:(id)a3
{
  id v3 = [(SUUIMediaPlayerInterface *)self playerForItemWithIdentifier:a3];
  if (v3)
  {
    id v8 = v3;
    id v4 = [v3 player];
    int v5 = [v4 isPlaying];

    id v6 = [v8 player];
    uint64_t v7 = v6;
    if (v5) {
      [v6 pause];
    }
    else {
      [v6 play];
    }

    id v3 = v8;
  }
}

- (void)_bufferingStateChangedNotification:(id)a3
{
  id v4 = a3;
  int v5 = (void *)SUUIMediaPlayerFramework();
  id v6 = *(id *)SUUIWeakLinkedSymbolForString("MPAVControllerNewStateParameter", v5);
  uint64_t v7 = [v4 userInfo];
  id v8 = [v7 objectForKey:v6];

  uint64_t v9 = [v8 unsignedIntegerValue];
  id v10 = [(SUUIMediaPlayerInterface *)self _playerForNotification:v4];

  [(SUUIMediaPlayerInterface *)self _updateBufferingState:v9 player:v10];
  [(SUUIMediaPlayerInterface *)self _notifyObserversOfItemStateChange];
}

- (void)_currentItemDurationAvailableNotification:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = [a3 object];
  [(NSMapTable *)self->_players keyEnumerator];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = -[NSMapTable objectForKey:](self->_players, "objectForKey:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        char v11 = v10;
        if (v10)
        {
          v12 = [v10 currentItem];

          if (v12 == v4)
          {
            uint64_t v13 = [v11 playerItem];
            [(SUUIMediaPlayerInterface *)self _updateDurationForPlayerItem:v13 withMPAVItem:v4];

            [(SUUIMediaPlayerInterface *)self _notifyObserversOfItemStateChange];
            goto LABEL_12;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

- (void)_notifiyObserversOfItemChange:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = self->_observers;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          [v5 addObject:v11];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    observerQueue = self->_observerQueue;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __58__SUUIMediaPlayerInterface__notifiyObserversOfItemChange___block_invoke;
    v13[3] = &unk_265400890;
    id v14 = v5;
    id v15 = v4;
    dispatch_async(observerQueue, v13);
  }
}

void __58__SUUIMediaPlayerInterface__notifiyObserversOfItemChange___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "mediaPlayer:itemStateChanged:", 0, *(void *)(a1 + 40), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_playerItemReady:(id)a3
{
  id v4 = a3;
  id v7 = [(SUUIMediaPlayerInterface *)self _playerForNotification:v4];
  uint64_t v5 = [(SUUIMediaPlayerInterface *)self _itemFromNotification:v4];

  if (v5)
  {
    uint64_t v6 = [v7 currentItem];

    if (v6 != v5) {
      [(SUUIMediaPlayerInterface *)self _itemDidChange:v7 incomingItem:v5];
    }
  }
}

- (void)_playbackErrorNotification:(id)a3
{
  [(SUUIMediaPlayerInterface *)self _cancelOnDeckItem];
  id v4 = (id)objc_opt_new();
  [v4 setPlayState:4];
  [(SUUIMediaPlayerInterface *)self _notifiyObserversOfItemChange:v4];
}

- (void)_playerItemDidChangeNotification:(id)a3
{
  id v6 = [(SUUIMediaPlayerInterface *)self _playerForNotification:a3];
  id v4 = [v6 player];
  uint64_t v5 = [v4 currentItem];
  [(SUUIMediaPlayerInterface *)self _itemDidChange:v6 incomingItem:v5];
}

- (void)_playerItemWillChangeNotification:(id)a3
{
  id v4 = a3;
  id v9 = [(SUUIMediaPlayerInterface *)self _playerForNotification:v4];
  uint64_t v5 = [(SUUIMediaPlayerInterface *)self _itemFromNotification:v4];

  uint64_t v6 = SUUIMediaPlayerFramework();
  SUUIWeakLinkedClassForString(&cfstr_Mpplaceholdera.isa, v6);
  if (v5)
  {
    id v7 = [v9 currentItem];
    if (v7 == v5)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        goto LABEL_6;
      }
      id v7 = [v9 playerItem];
      [v7 setPlayState:5];
    }
  }
LABEL_6:
}

- (void)_playerRateDidChangeNotification:(id)a3
{
  id v17 = [(SUUIMediaPlayerInterface *)self _playerForNotification:a3];
  id v4 = [v17 player];
  uint64_t v5 = [v4 currentItem];
  uint64_t v6 = [v17 currentItem];

  if (v5 == v6)
  {
    id v7 = [v17 currentItem];
    [(SUUIMediaPlayerInterface *)self _updateTimeValuesUsingItemTime:0 player:v17 item:v7];

    long long v8 = [v17 playerItem];
    uint64_t v9 = [v8 playState];

    long long v10 = [v17 player];
    char v11 = [v10 shouldDisplayAsPlaying];

    if (v11)
    {
      uint64_t v9 = 2;
    }
    else
    {
      [(SUUIMediaPlayerInterface *)self _cancelOnDeckItem];
      uint64_t v12 = [v17 player];
      uint64_t v13 = [v12 state];

      if (v13 == 1)
      {
        uint64_t v9 = 3;
      }
      else if (v13 == 7)
      {
        uint64_t v9 = 4;
      }
    }
    id v14 = [v17 playerItem];
    uint64_t v15 = [v14 playState];

    if (v9 != v15)
    {
      long long v16 = [v17 playerItem];
      [v16 setPlayState:v9];

      [(SUUIMediaPlayerInterface *)self _notifyObserversOfItemStateChange];
    }
  }
}

- (id)_itemFromNotification:(id)a3
{
  id v3 = a3;
  id v4 = (void *)SUUIMediaPlayerFramework();
  id v5 = *(id *)SUUIWeakLinkedSymbolForString("MPAVControllerItemParameter", v4);
  uint64_t v6 = [v3 userInfo];

  id v7 = [v6 objectForKey:v5];

  uint64_t v8 = SUUIMediaPlayerFramework();
  SUUIWeakLinkedClassForString(&cfstr_Mpavitem.isa, v8);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v7;
  }
  else {
    id v9 = 0;
  }

  return v9;
}

- (id)_playerForNotification:(id)a3
{
  id v4 = [a3 object];
  uint64_t v5 = SUUIMediaPlayerFramework();
  SUUIWeakLinkedClassForString(&cfstr_Mpavcontroller_7.isa, v5);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v4;
    id v7 = [(NSMapTable *)self->_players objectForKey:v6];
    if (!v7)
    {
      id v7 = objc_alloc_init(SUUIMediaPlayer);
      [(SUUIMediaPlayer *)v7 setPlayer:v6];
      [(NSMapTable *)self->_players setObject:v7 forKey:v6];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_createPeriodicTimeObserverIfNeeded:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 player];
  [v4 rate];
  float v7 = v6;
  if (v6 > 0.00000011921)
  {
    uint64_t v8 = [v4 periodicTimeObserver];

    if (!v8)
    {
      objc_initWeak(&location, self);
      objc_initWeak(&from, v4);
      uint64_t v11 = 3221225472;
      uint64_t v10 = MEMORY[0x263EF8330];
      uint64_t v12 = __64__SUUIMediaPlayerInterface__createPeriodicTimeObserverIfNeeded___block_invoke;
      uint64_t v13 = &unk_265407198;
      objc_copyWeak(&v14, &location);
      objc_copyWeak(&v15, &from);
      id v9 = [v5 addPeriodicTimeObserverForInterval:&v10 usingBlock:1.0 / v7];
      objc_msgSend(v4, "setPeriodicTimeObserver:", v9, v10, v11, v12, v13);

      objc_destroyWeak(&v15);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }
}

void __64__SUUIMediaPlayerInterface__createPeriodicTimeObserverIfNeeded___block_invoke(uint64_t a1, double a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v4) {
    [WeakRetained _setCurrentTimeIfPossible:v4 player:a2];
  }
}

- (void)_destroyPeridicTimeObseverIfNeeded:(id)a3
{
  id v6 = a3;
  id v3 = [v6 periodicTimeObserver];

  if (v3)
  {
    id v4 = [v6 player];
    uint64_t v5 = [v6 periodicTimeObserver];
    [v4 removeTimeObserver:v5];

    [v6 setPeriodicTimeObserver:0];
  }
}

- (void)_notifyObserversOfItemStateChange
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v4 = self->_observers;
  uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v24 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v3 addObject:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v6);
  }

  if ([v3 count])
  {
    uint64_t v10 = [(NSMapTable *)self->_players keyEnumerator];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = [(NSMapTable *)self->_players objectForKey:*(void *)(*((void *)&v20 + 1) + 8 * v14)];
          if (v15)
          {
            observerQueue = self->_observerQueue;
            v17[0] = MEMORY[0x263EF8330];
            v17[1] = 3221225472;
            v17[2] = __61__SUUIMediaPlayerInterface__notifyObserversOfItemStateChange__block_invoke;
            v17[3] = &unk_265400890;
            id v18 = v3;
            id v19 = v15;
            dispatch_async(observerQueue, v17);
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v12);
    }
  }
}

void __61__SUUIMediaPlayerInterface__notifyObserversOfItemStateChange__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
        uint64_t v8 = objc_msgSend(*(id *)(a1 + 40), "playerItem", (void)v9);
        if (v8) {
          [v7 mediaPlayer:*(void *)(a1 + 40) itemStateChanged:v8];
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)_notifyFinishedItem:(id)a3
{
  [a3 setPlayState:5];
  [(SUUIMediaPlayerInterface *)self _notifyObserversOfItemStateChange];
}

- (void)_itemDidChange:(id)a3 incomingItem:(id)a4
{
  id v28 = a3;
  id v6 = a4;
  uint64_t v7 = [v28 currentItem];
  uint64_t v8 = (void *)v7;
  if ((id)v7 != v6)
  {
    if (v7) {
      [(SUUIMediaPlayerInterface *)self _unregisterForNotificationsForCurrentItem:v7];
    }
    uint64_t v9 = SUUIMediaPlayerFramework();
    SUUIWeakLinkedClassForString(&cfstr_Mpplaceholdera.isa, v9);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [v28 setCurrentItem:v6];
      SUUIMPUFoundationFramework();
      long long v10 = [v6 feeder];
      long long v11 = objc_msgSend(v10, "MPU_contentItemIdentifierCollection");

      long long v12 = objc_msgSend(v6, "MPU_contentItemIdentifierCollection");
      uint64_t v13 = [v12 identifierForIdentifierType:1];
      uint64_t v14 = [v13 longLongValue];

      if (!v14)
      {
        id v15 = [v12 identifierForIdentifierType:8];
        uint64_t v14 = [v15 longLongValue];
      }
      if ([v11 itemType] == 4)
      {
        long long v16 = [v11 identifierForIdentifierType:1];
        uint64_t v17 = [v16 longLongValue];

        if (!v17)
        {
          id v18 = [v11 identifierForIdentifierType:8];
          uint64_t v17 = [v18 longLongValue];
        }
      }
      else
      {
        uint64_t v17 = 0;
      }
      id v19 = [v11 identifierForIdentifierType:3];
      uint64_t v20 = [v11 identifierForIdentifierType:2];
      long long v21 = (void *)v20;
      if (!v14 && !v17 && !v19 && !v20)
      {
        long long v22 = 0;
LABEL_26:
        [(SUUIMediaPlayerInterface *)self _updateDurationForPlayerItem:v22 withMPAVItem:v6];
        if (v6)
        {
          [(SUUIMediaPlayerInterface *)self _updateTimeValuesUsingItemTime:1 player:v28 item:v6];
          [(SUUIMediaPlayerInterface *)self _registerForNotificationsForCurrentItem:v6];
        }

        goto LABEL_29;
      }
      long long v22 = objc_alloc_init(SUUIMediaPlayerItemStatus);
      long long v27 = v12;
      if (v14)
      {
        long long v23 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", v14);
        [(SUUIMediaPlayerItemStatus *)v22 setStoreID:v23];
        if (v17) {
          goto LABEL_18;
        }
      }
      else
      {
        long long v23 = 0;
        if (v17)
        {
LABEL_18:
          objc_msgSend(NSString, "stringWithFormat:", @"%lld", v17);
          id v24 = (id)objc_claimAutoreleasedReturnValue();

          [(SUUIMediaPlayerItemStatus *)v22 setStoreAlbumID:v24];
          if (v14) {
            uint64_t v25 = 1;
          }
          else {
            uint64_t v25 = 2;
          }
          goto LABEL_24;
        }
      }
      if (!v21)
      {
        if (v19)
        {
          id v26 = v19;

          uint64_t v25 = 4;
          long long v23 = v26;
        }
        else
        {
          uint64_t v25 = 0;
        }
        goto LABEL_25;
      }
      id v24 = v21;

      uint64_t v25 = 3;
LABEL_24:
      long long v23 = v24;
LABEL_25:
      [(SUUIMediaPlayerItemStatus *)v22 setItemType:v25];
      [(SUUIMediaPlayerItemStatus *)v22 setItemIdentifier:v23];
      [(SUUIMediaPlayerItemStatus *)v22 setPlayState:1];
      [v28 setPlayerItem:v22];

      long long v12 = v27;
      goto LABEL_26;
    }
  }
LABEL_29:
}

- (void)_registerForNotificationsForCurrentItem:(id)a3
{
  if (a3)
  {
    uint64_t v4 = (void *)MEMORY[0x263F08A00];
    id v5 = a3;
    id v7 = [v4 defaultCenter];
    id v6 = (void *)SUUIMediaPlayerFramework();
    objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__currentItemDurationAvailableNotification_, *(void *)SUUIWeakLinkedSymbolForString("MPAVItemDurationAvailableNotification", v6), v5);
  }
}

- (void)_setCurrentTimeIfPossible:(double)a3 player:(id)a4
{
  id v8 = a4;
  id v6 = [v8 playerItem];
  [v6 currentTime];
  if (v7 != a3)
  {
    [(SUUIMediaPlayerInterface *)self _updateItemForPlayer:v8 currentTime:a3];
    [(SUUIMediaPlayerInterface *)self _notifyObserversOfItemStateChange];
  }
}

- (void)_unregisterForNotificationsForCurrentItem:(id)a3
{
  if (a3)
  {
    uint64_t v4 = (void *)MEMORY[0x263F08A00];
    id v5 = a3;
    id v7 = [v4 defaultCenter];
    id v6 = (void *)SUUIMediaPlayerFramework();
    objc_msgSend(v7, "removeObserver:name:object:", self, *(void *)SUUIWeakLinkedSymbolForString("MPAVItemDurationAvailableNotification", v6), v5);
  }
}

- (void)_updateBufferingState:(unint64_t)a3 player:(id)a4
{
  char v4 = a3;
  id v7 = [a4 playerItem];
  if ([v7 playState] != 5)
  {
    if ((v4 & 0xB) != 0)
    {
      [(SUUIMediaPlayerInterface *)self _cancelOnDeckItem];
      uint64_t v6 = 2;
    }
    else
    {
      uint64_t v6 = 1;
    }
    if (v6 != [v7 playState]) {
      [v7 setPlayState:v6];
    }
  }
}

- (void)_cancelOnDeckItem
{
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    dispatch_source_cancel(timeoutTimer);
    char v4 = self->_timeoutTimer;
    self->_timeoutTimer = 0;
  }
  onDeckItem = self->_onDeckItem;
  self->_onDeckItem = 0;
}

- (void)_onDeckTimedOut
{
  if (self->_onDeckItem)
  {
    uint64_t v3 = objc_opt_new();
    [v3 setPlayState:4];
    [(SUUIMediaPlayerInterface *)self _notifiyObserversOfItemChange:v3];

    onDeckItem = self->_onDeckItem;
  }
  else
  {
    onDeckItem = 0;
  }
  self->_onDeckItem = 0;
}

- (void)_startOnDeckTimer
{
  objc_initWeak(&location, self);
  uint64_t v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = v3;

  id v5 = self->_timeoutTimer;
  dispatch_time_t v6 = dispatch_time(0, 30000000000);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  id v7 = self->_timeoutTimer;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__SUUIMediaPlayerInterface__startOnDeckTimer__block_invoke;
  v8[3] = &unk_265401538;
  objc_copyWeak(&v9, &location);
  dispatch_source_set_event_handler(v7, v8);
  dispatch_resume((dispatch_object_t)self->_timeoutTimer);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __45__SUUIMediaPlayerInterface__startOnDeckTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _onDeckTimedOut];
    id WeakRetained = v2;
  }
}

- (void)_updateDurationForPlayerItem:(id)a3 withMPAVItem:(id)a4
{
  if (a3)
  {
    id v5 = a4;
    id v10 = a3;
    [v5 durationIfAvailable];
    double v7 = v6;
    uint64_t v8 = [v5 isAlwaysLive];

    [v10 setHideDuration:v8];
    double v9 = 0.0;
    if (v7 >= 2.22044605e-16) {
      double v9 = v7;
    }
    [v10 setDuration:v9];
  }
}

- (void)_updateItemForPlayer:(id)a3 currentTime:(double)a4
{
  id v5 = [a3 playerItem];
  [v5 setCurrentTime:a4];
}

- (void)_updateTimeValuesUsingItemTime:(BOOL)a3 player:(id)a4 item:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  [v8 rate];
  float v11 = v10;
  long long v12 = [v8 player];
  [v12 rate];
  float v14 = v13;

  float v15 = vabds_f32(v11, v14);
  HIDWORD(v16) = 872415232;
  if (v15 > 0.00000011921)
  {
    *(float *)&double v16 = v14;
    [v8 setRate:v16];
  }
  [v9 currentTimeDisplayOverride];
  double v18 = v17;
  if (v17 <= 2.22044605e-16)
  {
    if (!v6)
    {
      uint64_t v20 = [v8 player];
      [v20 currentTime];
      goto LABEL_12;
    }
    double v18 = 0.0;
    if ([v9 isAssetLoaded])
    {
      id v19 = [v9 playerItem];
      uint64_t v20 = v19;
      if (v19)
      {
        [v19 currentTime];
      }
      else
      {
        long long v25 = 0uLL;
        uint64_t v26 = 0;
      }
      long long v22 = (void *)SUUICoreMediaFramework();
      long long v23 = (double (*)(long long *))SUUIWeakLinkedSymbolForString("CMTimeGetSeconds", v22);
      if (!v23) {
        goto LABEL_13;
      }
      long long v27 = v25;
      uint64_t v28 = v26;
      double v21 = v23(&v27);
LABEL_12:
      double v18 = v21;
LABEL_13:
    }
  }
  [(SUUIMediaPlayerInterface *)self _setCurrentTimeIfPossible:v8 player:v18];
  if (v15 > 0.00000011921
    || ([v8 periodicTimeObserver],
        id v24 = objc_claimAutoreleasedReturnValue(),
        v24,
        !v24))
  {
    [(SUUIMediaPlayerInterface *)self _destroyPeridicTimeObseverIfNeeded:v8];
    [(SUUIMediaPlayerInterface *)self _createPeriodicTimeObserverIfNeeded:v8];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_players, 0);
  objc_storeStrong((id *)&self->_onDeckItem, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end