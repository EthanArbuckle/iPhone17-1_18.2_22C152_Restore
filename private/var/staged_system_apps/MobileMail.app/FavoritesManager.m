@interface FavoritesManager
+ (id)defaultsKeyForAutomaticMailboxVisibilityForSourceType:(unint64_t)a3;
- (BOOL)_isDictionaryRepresentationValid:(id)a3;
- (BOOL)hasLaunchedWithCollapsibleMailboxes;
- (BOOL)hasVisibleFavoriteMailboxes;
- (BOOL)showingOutbox;
- (BOOL)showingSingleAccount;
- (BOOL)updateCollections:(id)a3 withItems:(id)a4;
- (EDConversationSubscriptionProvider)conversationSubscriptionProvider;
- (EFCancelable)userDefaultsObserver;
- (EFDebouncer)reloadDebouncer;
- (FavoriteItem)lastSelectedItem;
- (FavoriteItem)previousSelectedItem;
- (FavoritesManager)initWithFavoritesPersistence:(id)a3 collections:(id)a4 conversationSubscriptionProvider:(id)a5;
- (FavoritesPersistence)favoritesPersistence;
- (NSArray)suggestedFavoriteItems;
- (NSMutableArray)expandedItems;
- (NSMutableArray)mailboxCollections;
- (NSMutableArray)visibleMailboxCollections;
- (NSRecursiveLock)lock;
- (id)accountsCollection;
- (id)collectionContainingItem:(id)a3;
- (id)dictionaryRepresentation;
- (id)favoriteMailboxesForAccount:(id)a3;
- (id)itemsContainingName:(id)a3;
- (id)itemsMatchingItemURLStrings:(id)a3;
- (id)itemsMatchingName:(id)a3;
- (id)itemsOfType:(int64_t)a3;
- (id)mailboxesCollection;
- (id)orderedFavoriteMailboxesForAccount:(id)a3 includeUnifiedMailboxes:(BOOL)a4;
- (id)visibleItemsOfType:(int64_t)a3;
- (void)_debounceReload:(id)a3;
- (void)_reload:(id)a3;
- (void)_reloadFromCollectionDictionaries:(id)a3;
- (void)_reportFollowUpFeatureSetting:(BOOL)a3;
- (void)_sharedMailboxControllerBadgeCountDidChange:(id)a3;
- (void)mf_resetMailboxVocabulary;
- (void)mf_updateMailboxVocabularyForCollections:(id)a3;
- (void)moveItemOfCollection:(id)a3 fromIndex:(int64_t)a4 toIndex:(int64_t)a5;
- (void)performTransaction:(id)a3;
- (void)refreshCollectionForItemExpansion:(id)a3;
- (void)refreshCollectionForItemExpansion:(id)a3 notify:(BOOL)a4;
- (void)scheduleItemChangeUpdateFavoritesPersistence:(id)a3 removedItems:(id)a4 withReason:(id)a5;
- (void)scheduleOrderChangeUpdateFavoritesPersistence:(unint64_t)a3 withReason:(id)a4;
- (void)scheduleSetVisibility:(BOOL)a3 forSourceType:(unint64_t)a4;
- (void)scheduleUpdateFavoritesPersistenceForChangeType:(unint64_t)a3 withReason:(id)a4;
- (void)setAccountsCollection:(id)a3;
- (void)setExpandedItems:(id)a3;
- (void)setHasLaunchedWithCollapsibleMailboxes:(BOOL)a3;
- (void)setLastSelectedItem:(id)a3;
- (void)setMailboxCollections:(id)a3;
- (void)setPreviousSelectedItem:(id)a3;
- (void)setShowingOutbox:(BOOL)a3;
- (void)setShowingSingleAccount:(BOOL)a3;
- (void)setUserDefaultsObserver:(id)a3;
- (void)setVisibleMailboxCollections:(id)a3;
@end

@implementation FavoritesManager

- (void)mf_resetMailboxVocabulary
{
  swift_getObjectType();
  v3 = self;
  sub_100058234();
}

- (void)setLastSelectedItem:(id)a3
{
  id v6 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  [(FavoritesManager *)self setPreviousSelectedItem:self->_lastSelectedItem];
  objc_storeStrong((id *)&self->_lastSelectedItem, a3);
  [(NSRecursiveLock *)self->_lock unlock];
  v5 = [(FavoritesManager *)self favoritesPersistence];
  [v5 setLastSelectedItem:v6];
}

- (FavoritesManager)initWithFavoritesPersistence:(id)a3 collections:(id)a4 conversationSubscriptionProvider:(id)a5
{
  id v35 = a3;
  id v37 = a4;
  id v36 = a5;
  v48.receiver = self;
  v48.super_class = (Class)FavoritesManager;
  v9 = [(FavoritesManager *)&v48 init];
  v10 = v9;
  v11 = &NSURLErrorDomain_ptr;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_favoritesPersistence, a3);
    objc_storeStrong((id *)&v10->_conversationSubscriptionProvider, a5);
    v12 = +[NSUserDefaults em_userDefaults];
    v10->_hasLaunchedWithCollapsibleMailboxes = [v12 BOOLForKey:@"FavoritesManagerDefaultKeyHasLaunchedWithCollapsibleMailboxes"];

    if (v37 && [(FavoritesManager *)v10 _isDictionaryRepresentationValid:v37])
    {
      v13 = v37;
    }
    else
    {
      uint64_t v14 = [(FavoritesPersistence *)v10->_favoritesPersistence dictionaryRepresentation];

      v13 = (void *)v14;
    }
    v34 = [v13 objectForKeyedSubscript:@"Collections"];
    id v37 = v13;
    v33 = [v13 objectForKeyedSubscript:@"LastSelectedItem"];
    if (v33)
    {
      uint64_t v15 = +[FavoriteItem itemFromDictionary:v33];
      lastSelectedItem = v10->_lastSelectedItem;
      v10->_lastSelectedItem = (FavoriteItem *)v15;
    }
    [(FavoritesManager *)v10 mf_resetMailboxVocabulary];
    [(FavoritesManager *)v10 _reloadFromCollectionDictionaries:v34];
    v17 = +[NSNotificationCenter defaultCenter];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v18 = [&off_10062B3C0 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v45;
      uint64_t v20 = SharedMailboxControllerBadgeCountDidChangeNotification;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v45 != v19) {
            objc_enumerationMutation(&off_10062B3C0);
          }
          v22 = +[SharedMailboxController sharedInstanceForSourceType:](SharedMailboxController, "sharedInstanceForSourceType:", [*(id *)(*((void *)&v44 + 1) + 8 * i) unsignedIntegerValue]);
          [v17 addObserver:v10 selector:"_sharedMailboxControllerBadgeCountDidChange:" name:v20 object:v22];
        }
        id v18 = [&off_10062B3C0 countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v18);
    }
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v10);
    id v23 = objc_alloc((Class)EFDebouncer);
    v24 = +[EFScheduler mainThreadScheduler];
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10000E1BC;
    v41[3] = &unk_100606C20;
    objc_copyWeak(&v42, &location);
    v25 = (EFDebouncer *)[v23 initWithTimeInterval:v24 scheduler:1 startAfter:v41 block:0.025];
    reloadDebouncer = v10->_reloadDebouncer;
    v10->_reloadDebouncer = v25;

    [v17 addObserver:v10 selector:"_debounceReload:" name:off_10068D1D0 object:0];
    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);

    v11 = &NSURLErrorDomain_ptr;
  }
  v27 = [(NSErrorDomain *)(id)v11[409] em_userDefaults];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v10);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_1000BDC98;
  v38[3] = &unk_100604B20;
  objc_copyWeak(&v40, &location);
  uint64_t v28 = EMUserDefaultDisableFollowUp;
  id v39 = v27;
  id v29 = v27;
  uint64_t v30 = [v29 ef_observeKeyPath:v28 options:1 autoCancelToken:1 usingBlock:v38];
  userDefaultsObserver = v10->_userDefaultsObserver;
  v10->_userDefaultsObserver = (EFCancelable *)v30;

  objc_destroyWeak(&v40);
  objc_destroyWeak(&location);

  return v10;
}

- (NSMutableArray)visibleMailboxCollections
{
  [(NSRecursiveLock *)self->_lock lock];
  visibleMailboxCollections = self->_visibleMailboxCollections;
  if (!visibleMailboxCollections)
  {
    v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_mailboxCollections, "count")];
    v5 = self->_visibleMailboxCollections;
    self->_visibleMailboxCollections = v4;

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = self->_mailboxCollections;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (!v7) {
      goto LABEL_19;
    }
    uint64_t v8 = *(void *)v19;
    while (1)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (![v10 isOutboxCollection])
        {
          if (![v10 isVisible]) {
            continue;
          }
          goto LABEL_13;
        }
        v11 = [(FavoritesManager *)self favoritesPersistence];
        unsigned int v12 = [v11 showingOutbox];

        if (v12)
        {
          v13 = MFLogGeneral();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v17 = 0;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#Favorites Adding outbox to visibleMailboxCollections", v17, 2u);
          }

LABEL_13:
          [(NSMutableArray *)self->_visibleMailboxCollections addObject:v10];
          continue;
        }
        uint64_t v14 = MFLogGeneral();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v17 = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#Favorites Did not add outbox to visibleMailboxCollections", v17, 2u);
        }
      }
      id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (!v7)
      {
LABEL_19:

        visibleMailboxCollections = self->_visibleMailboxCollections;
        break;
      }
    }
  }
  id v15 = [(NSMutableArray *)visibleMailboxCollections copy];
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSMutableArray *)v15;
}

- (FavoriteItem)lastSelectedItem
{
  [(NSRecursiveLock *)self->_lock lock];
  lastSelectedItem = self->_lastSelectedItem;
  if (lastSelectedItem) {
    id v4 = lastSelectedItem;
  }
  [(NSRecursiveLock *)self->_lock unlock];
  if (!lastSelectedItem)
  {
    v5 = [(FavoritesManager *)self favoritesPersistence];
    lastSelectedItem = [v5 lastSelectedItem];

    [(NSRecursiveLock *)self->_lock lock];
    id v6 = [(FavoritesManager *)self favoritesPersistence];
    id v7 = [v6 lastSelectedItem];
    uint64_t v8 = self->_lastSelectedItem;
    self->_lastSelectedItem = v7;

    [(NSRecursiveLock *)self->_lock unlock];
  }

  return (FavoriteItem *)lastSelectedItem;
}

- (void)_reloadFromCollectionDictionaries:(id)a3
{
  id v59 = a3;
  v3 = MFLogGeneral();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v117 = v59;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#Favorites _reloadFromCollectionDictionaries:%@", buf, 0xCu);
  }

  [(NSRecursiveLock *)self->_lock lock];
  if ([(NSMutableArray *)self->_mailboxCollections count])
  {
    id v4 = [(FavoritesManager *)self accountsCollection];
    v5 = [v4 items];
    v63 = [v5 ef_filter:&stru_100606C60];
  }
  else
  {
    v63 = 0;
  }
  [(NSRecursiveLock *)self->_lock unlock];
  int v6 = _os_feature_enabled_impl();
  unsigned int v74 = v6 & ~[(FavoritesManager *)self hasLaunchedWithCollapsibleMailboxes];
  if (v74 == 1) {
    sub_1000BDFA8((uint64_t)self, 1);
  }
  id v72 = objc_alloc_init((Class)NSMutableArray);
  id v71 = objc_alloc_init((Class)NSMutableArray);
  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  id obj = v59;
  id v7 = [obj countByEnumeratingWithState:&v104 objects:v115 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v105;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v105 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v104 + 1) + 8 * i);
        v11 = [[FavoritesCollection alloc] initWithDictionary:v10];
        [v72 addObject:v11];

        unsigned int v12 = [v10 objectForKey:@"expandedItems"];
        v13 = [v12 ef_compactMap:&stru_100606CA0];
        [v71 addObjectsFromArray:v13];
      }
      id v7 = [obj countByEnumeratingWithState:&v104 objects:v115 count:16];
    }
    while (v7);
  }

  uint64_t v14 = [v63 ef_filter:&stru_100606CC0];
  [v71 addObjectsFromArray:v14];

  id v15 = [v72 objectAtIndex:2];
  v58 = [v15 items];

  v57 = [v58 ef_filter:&stru_100606CE0];
  v73 = objc_opt_new();
  v75 = objc_opt_new();
  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id v68 = v71;
  id v16 = [v68 countByEnumeratingWithState:&v100 objects:v114 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v101;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v101 != v17) {
          objc_enumerationMutation(v68);
        }
        long long v19 = *(void **)(*((void *)&v100 + 1) + 8 * (void)j);
        long long v20 = [v19 itemUUID];
        if (v20) {
          [v75 setObject:v19 forKeyedSubscript:v20];
        }
      }
      id v16 = [v68 countByEnumeratingWithState:&v100 objects:v114 count:16];
    }
    while (v16);
  }

  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id v60 = v57;
  id v62 = [v60 countByEnumeratingWithState:&v96 objects:v113 count:16];
  if (v62)
  {
    uint64_t v61 = *(void *)v97;
    do
    {
      for (k = 0; k != v62; k = (char *)k + 1)
      {
        if (*(void *)v97 != v61) {
          objc_enumerationMutation(v60);
        }
        long long v21 = *(void **)(*((void *)&v96 + 1) + 8 * (void)k);
        v69 = [v21 account];
        v22 = +[MailChangeManager sharedChangeManager];
        id v23 = [(FavoritesManager *)self favoritesPersistence];
        v64 = v21;
        v65 = [v22 allMailboxUidsSortedWithSpecialsAtTopForAccount:v69 includingLocals:1 client:v23 outbox:0];

        v24 = +[NSMutableArray array];
        long long v94 = 0u;
        long long v95 = 0u;
        long long v92 = 0u;
        long long v93 = 0u;
        id v25 = v65;
        id v26 = [v25 countByEnumeratingWithState:&v92 objects:v112 count:16];
        if (v26)
        {
          uint64_t v27 = *(void *)v93;
          do
          {
            for (m = 0; m != v26; m = (char *)m + 1)
            {
              if (*(void *)v93 != v27) {
                objc_enumerationMutation(v25);
              }
              uint64_t v29 = *(void *)(*((void *)&v92 + 1) + 8 * (void)m);
              if (v6)
              {
                uint64_t v30 = +[FavoriteItem itemForMailbox:v29 selected:1];
                v31 = [v30 itemUUID];
                v32 = [v75 objectForKeyedSubscript:v31];

                if (v74) {
                  unsigned int v33 = [v30 isExpandable];
                }
                else {
                  unsigned int v33 = 0;
                }
                objc_msgSend(v30, "setExpanded:", objc_msgSend(v32, "isExpanded") | v33);
                [v24 addObject:v30];
                if ([v30 isExpanded]) {
                  [v73 addObject:v30];
                }
              }
              else
              {
                uint64_t v30 = +[FavoriteItem itemForMailbox:v29 selected:1];
                [v24 addObject:v30];
              }
            }
            id v26 = [v25 countByEnumeratingWithState:&v92 objects:v112 count:16];
          }
          while (v26);
        }

        v34 = MFLogGeneral();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          id v35 = [v69 ef_publicDescription];
          *(_DWORD *)buf = 138543362;
          id v117 = v35;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "#Favorites Settings mailbox items for account: %{public}@", buf, 0xCu);
        }
        [v64 setSubItems:v24];
      }
      id v62 = [v60 countByEnumeratingWithState:&v96 objects:v113 count:16];
    }
    while (v62);
  }

  if (v6)
  {
    id v36 = [v72 objectAtIndexedSubscript:2];
    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    id v37 = v73;
    id v38 = [v37 countByEnumeratingWithState:&v88 objects:v111 count:16];
    if (v38)
    {
      uint64_t v39 = *(void *)v89;
      do
      {
        for (n = 0; n != v38; n = (char *)n + 1)
        {
          if (*(void *)v89 != v39) {
            objc_enumerationMutation(v37);
          }
          [v36 addExpandedItem:*(void *)(*((void *)&v88 + 1) + 8 * (void)n)];
        }
        id v38 = [v37 countByEnumeratingWithState:&v88 objects:v111 count:16];
      }
      while (v38);
    }
  }
  id v41 = objc_alloc_init((Class)NSMutableArray);
  if (v63)
  {
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id v42 = v60;
    id v43 = [v42 countByEnumeratingWithState:&v84 objects:v110 count:16];
    if (!v43) {
      goto LABEL_70;
    }
    uint64_t v44 = *(void *)v85;
    while (1)
    {
      for (ii = 0; ii != v43; ii = (char *)ii + 1)
      {
        if (*(void *)v85 != v44) {
          objc_enumerationMutation(v42);
        }
        long long v46 = *(void **)(*((void *)&v84 + 1) + 8 * (void)ii);
        id v47 = [v63 containsObject:v46];
        if (!v47)
        {
          if (![v46 isExpanded]) {
            continue;
          }
LABEL_67:
          [v46 setExpanded:v47];
          [v41 addObject:v46];
          continue;
        }
        if (([v46 isExpanded] & 1) == 0) {
          goto LABEL_67;
        }
      }
      id v43 = [v42 countByEnumeratingWithState:&v84 objects:v110 count:16];
      if (!v43)
      {
LABEL_70:

        break;
      }
    }
  }
  [(NSRecursiveLock *)self->_lock lock];
  objc_storeStrong((id *)&self->_mailboxCollections, v72);
  visibleMailboxCollections = self->_visibleMailboxCollections;
  self->_visibleMailboxCollections = 0;

  [(NSRecursiveLock *)self->_lock unlock];
  if (v74)
  {
    [v60 ef_filter:&stru_100606D00];
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id v49 = (id)objc_claimAutoreleasedReturnValue();
    id v50 = [v49 countByEnumeratingWithState:&v80 objects:v109 count:16];
    if (v50)
    {
      uint64_t v51 = *(void *)v81;
      do
      {
        for (jj = 0; jj != v50; jj = (char *)jj + 1)
        {
          if (*(void *)v81 != v51) {
            objc_enumerationMutation(v49);
          }
          [(FavoritesManager *)self refreshCollectionForItemExpansion:*(void *)(*((void *)&v80 + 1) + 8 * (void)jj)];
        }
        id v50 = [v49 countByEnumeratingWithState:&v80 objects:v109 count:16];
      }
      while (v50);
    }
  }
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v53 = v41;
  id v54 = [v53 countByEnumeratingWithState:&v76 objects:v108 count:16];
  if (v54)
  {
    uint64_t v55 = *(void *)v77;
    do
    {
      for (kk = 0; kk != v54; kk = (char *)kk + 1)
      {
        if (*(void *)v77 != v55) {
          objc_enumerationMutation(v53);
        }
        [(FavoritesManager *)self refreshCollectionForItemExpansion:*(void *)(*((void *)&v76 + 1) + 8 * (void)kk) notify:0];
      }
      id v54 = [v53 countByEnumeratingWithState:&v76 objects:v108 count:16];
    }
    while (v54);
  }

  [(FavoritesManager *)self mf_updateMailboxVocabularyForCollections:v72];
}

- (void)mf_updateMailboxVocabularyForCollections:(id)a3
{
  swift_getObjectType();
  id v4 = a3;
  v5 = self;
  sub_10004BA90();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10004BAF8();
  swift_bridgeObjectRelease();
}

- (BOOL)hasLaunchedWithCollapsibleMailboxes
{
  return self->_hasLaunchedWithCollapsibleMailboxes;
}

- (id)accountsCollection
{
  return [(NSMutableArray *)self->_mailboxCollections objectAtIndex:2];
}

- (void)_reload:(id)a3
{
  id v5 = a3;
  if (pthread_main_np() != 1)
  {
    v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"FavoritesManager.m" lineNumber:305 description:@"Current thread must be main"];
  }
  if (sub_1000531B8(self, v5))
  {
    int v6 = MFLogGeneral();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#Favorites _reload:%@", (uint8_t *)&v12, 0xCu);
    }

    id v7 = [(FavoritesManager *)self favoritesPersistence];
    uint64_t v8 = [v7 dictionaryRepresentation];
    v9 = [v8 objectForKeyedSubscript:@"Collections"];

    if (v9)
    {
      [(FavoritesManager *)self _reloadFromCollectionDictionaries:v9];
      v10 = +[NSNotificationCenter defaultCenter];
      [v10 postNotificationName:@"FavoritesManagerFavoritesDidChangeNotification" object:self userInfo:0];
    }
    else
    {
      v10 = MFLogGeneral();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        LOWORD(v12) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "#Favorites Attempting to reload from empty collection", (uint8_t *)&v12, 2u);
      }
    }
  }
}

- (FavoritesPersistence)favoritesPersistence
{
  return self->_favoritesPersistence;
}

- (void)_debounceReload:(id)a3
{
  id v4 = a3;
  if (sub_1000531B8(self, v4)
    && ([(FavoritesManager *)self reloadDebouncer],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    int v6 = MFLogGeneral();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#Favorites _reload: debounced notification=%@", (uint8_t *)&v8, 0xCu);
    }

    id v7 = [(FavoritesManager *)self reloadDebouncer];
    [v7 debounceResult:v4];
  }
  else
  {
    [(FavoritesManager *)self _reload:v4];
  }
}

- (EFDebouncer)reloadDebouncer
{
  return self->_reloadDebouncer;
}

- (void)setPreviousSelectedItem:(id)a3
{
}

- (id)mailboxesCollection
{
  return [(NSMutableArray *)self->_mailboxCollections objectAtIndex:0];
}

- (void)_reportFollowUpFeatureSetting:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[SGSuggestionsService serviceForMail];
  [v4 setSyncTimeout:0.1];
  if (objc_opt_respondsToSelector())
  {
    id v10 = 0;
    id v5 = [v4 reportValue:!v3 forFeatureSetting:0 error:&v10];
    id v6 = v10;
    if (v6)
    {
      id v7 = v6;
      int v8 = MFLogGeneral();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = [v7 ef_publicDescription];
        sub_100459C38(v9, buf, v8);
      }
    }
  }
}

- (id)collectionContainingItem:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_mailboxCollections;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 items:v13];
        unsigned __int8 v11 = [v10 containsObject:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)setAccountsCollection:(id)a3
{
}

- (id)itemsOfType:(int64_t)a3
{
  id v5 = objc_alloc_init((Class)NSMutableArray);
  [(NSRecursiveLock *)self->_lock lock];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = self->_mailboxCollections;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) itemsOfType:a3, v12];
        [v5 addObjectsFromArray:v10];
      }
      id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [(NSRecursiveLock *)self->_lock unlock];

  return v5;
}

- (id)itemsMatchingName:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableOrderedSet);
  [(NSRecursiveLock *)self->_lock lock];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = self->_mailboxCollections;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) itemsMatchingName:v4 v13];
        [v5 addObjectsFromArray:v10];
      }
      id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  [(NSRecursiveLock *)self->_lock unlock];
  unsigned __int8 v11 = [v5 array];

  return v11;
}

- (id)itemsMatchingItemURLStrings:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableOrderedSet);
  [(NSRecursiveLock *)self->_lock lock];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = self->_mailboxCollections;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) itemsMatchingItemURLStrings:v4, v13];
        [v5 addObjectsFromArray:v10];
      }
      id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  [(NSRecursiveLock *)self->_lock unlock];
  unsigned __int8 v11 = [v5 array];

  return v11;
}

- (id)itemsContainingName:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableOrderedSet);
  [(NSRecursiveLock *)self->_lock lock];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = self->_mailboxCollections;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) itemsContainingName:v4 (void)v13];
        [v5 addObjectsFromArray:v10];
      }
      id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  [(NSRecursiveLock *)self->_lock unlock];
  unsigned __int8 v11 = [v5 array];

  return v11;
}

- (NSArray)suggestedFavoriteItems
{
  id v3 = objc_alloc_init((Class)NSMutableOrderedSet);
  [(NSRecursiveLock *)self->_lock lock];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_mailboxCollections;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = [*(id *)(*((void *)&v11 + 1) + 8 * i) itemsIncludingSubItems:v11];
        [v3 addObjectsFromArray:v8];
      }
      id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  [(NSRecursiveLock *)self->_lock unlock];
  id v9 = [v3 array];

  return (NSArray *)v9;
}

- (id)visibleItemsOfType:(int64_t)a3
{
  id v3 = [(FavoritesManager *)self itemsOfType:a3];
  id v4 = [v3 ef_filter:&stru_100606D20];

  return v4;
}

- (id)favoriteMailboxesForAccount:(id)a3
{
  id v4 = a3;
  id v5 = [(FavoritesManager *)self favoritesPersistence];
  uint64_t v6 = [v5 favoriteMailboxesForAccount:v4];

  return v6;
}

- (id)orderedFavoriteMailboxesForAccount:(id)a3 includeUnifiedMailboxes:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(FavoritesManager *)self favoritesPersistence];
  uint64_t v8 = [v7 orderedFavoriteMailboxesForAccount:v6 includeUnifiedMailboxes:v4];

  return v8;
}

- (void)performTransaction:(id)a3
{
  BOOL v4 = (void (**)(id, FavoritesManager *))a3;
  [(NSRecursiveLock *)self->_lock lock];
  if (v4) {
    v4[2](v4, self);
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)moveItemOfCollection:(id)a3 fromIndex:(int64_t)a4 toIndex:(int64_t)a5
{
  id v8 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  id v9 = [v8 visibleItems];
  id v10 = [v9 objectAtIndex:a4];
  long long v11 = [v9 objectAtIndex:a5];
  if ([v8 isAccountsCollection] && objc_msgSend(v11, "type") != (id)1)
  {
    if (a5 < 1)
    {
LABEL_8:
      long long v12 = v11;
    }
    else
    {
      int64_t v13 = a5 + 1;
      while (1)
      {
        long long v12 = [v9 objectAtIndexedSubscript:v13 - 2];
        if ([v12 type] == (id)1) {
          break;
        }

        if ((unint64_t)--v13 <= 1) {
          goto LABEL_8;
        }
      }
    }
    long long v14 = MFLogGeneral();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v22 = v9;
      __int16 v23 = 2112;
      v24 = v10;
      __int16 v25 = 2112;
      id v26 = v12;
      _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "#Favorites visibleItems:%@ fromItem:%@ toItem:%@", buf, 0x20u);
    }
  }
  else
  {
    long long v12 = v11;
  }
  long long v15 = [v8 items];
  id v16 = [v15 mutableCopy];

  id v17 = [v16 indexOfObject:v10];
  id v18 = [v16 indexOfObject:v12];
  [v16 ef_moveObjectAtIndex:v17 toIndex:v18];
  [v8 setItems:v16];
  unsigned int v19 = [v8 isAccountsCollection];
  [(NSRecursiveLock *)self->_lock unlock];
  long long v20 = +[NSString stringWithFormat:@"moveItemOfCollection:%@ from:%ld to:%ld", v8, v17, v18];
  [(FavoritesManager *)self scheduleOrderChangeUpdateFavoritesPersistence:v19 ^ 1 withReason:v20];
}

- (BOOL)updateCollections:(id)a3 withItems:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v34 = v6;
  id v8 = v6;
  id v9 = v7;
  id v10 = [v8 count];
  if (v10 != [v9 count]) {
    __assert_rtn("-[FavoritesManager updateCollections:withItems:]", "FavoritesManager.m", 539, "collections.count == itemArrays.count");
  }
  v31 = self;
  v32 = v9;
  id v35 = +[NSMutableArray array];
  long long v11 = +[NSMutableArray array];
  long long v12 = MFLogGeneral();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v47 = v34;
    __int16 v48 = 2112;
    id v49 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#Favorites updateCollections:%@ withItems:%@", buf, 0x16u);
  }

  [(NSRecursiveLock *)self->_lock lock];
  char v13 = 0;
  for (unint64_t i = 0; i < (unint64_t)[v34 count]; unint64_t i = v33 + 1)
  {
    long long v15 = [v34 objectAtIndex:i];
    id v16 = [v32 objectAtIndex:i];
    id v17 = [v15 items];
    id v18 = +[NSArray arrayWithArray:v17];

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v19 = v18;
    id v20 = [v19 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v41;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v41 != v21) {
            objc_enumerationMutation(v19);
          }
          __int16 v23 = *(void **)(*((void *)&v40 + 1) + 8 * (void)j);
          if (([v16 containsObject:v23] & 1) == 0
            && [v23 isDeletable])
          {
            id v24 = [v15 removeItem:v23];
            [v35 addObject:v23];
            char v13 = 1;
          }
        }
        id v20 = [v19 countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v20);
    }

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v25 = v16;
    id v26 = [v25 countByEnumeratingWithState:&v36 objects:v44 count:16];
    unint64_t v33 = i;
    if (v26)
    {
      uint64_t v27 = *(void *)v37;
      do
      {
        for (k = 0; k != v26; k = (char *)k + 1)
        {
          if (*(void *)v37 != v27) {
            objc_enumerationMutation(v25);
          }
          uint64_t v29 = *(void *)(*((void *)&v36 + 1) + 8 * (void)k);
          if (([v19 containsObject:v29] & 1) == 0)
          {
            [v15 addItem:v29 ordered:1];
            [v11 addObject:v29];
            char v13 = 1;
          }
        }
        id v26 = [v25 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v26);
    }
  }
  [(NSRecursiveLock *)v31->_lock unlock];
  [(FavoritesManager *)v31 scheduleItemChangeUpdateFavoritesPersistence:v11 removedItems:v35 withReason:@"updateCollections:withItems:"];

  return v13 & 1;
}

- (void)refreshCollectionForItemExpansion:(id)a3
{
}

- (void)refreshCollectionForItemExpansion:(id)a3 notify:(BOOL)a4
{
  BOOL v17 = a4;
  id v5 = a3;
  id v18 = self;
  [(FavoritesManager *)self visibleMailboxCollections];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v20;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v20 != v8) {
        objc_enumerationMutation(v6);
      }
      id v10 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
      long long v11 = [v10 items];
      id v12 = [v11 indexOfObject:v5];

      if (v12 != (id)0x7FFFFFFFFFFFFFFFLL
        || ([v10 expandedItems],
            char v13 = objc_claimAutoreleasedReturnValue(),
            id v14 = [v13 indexOfObject:v5],
            v13,
            v14 != (id)0x7FFFFFFFFFFFFFFFLL))
      {
        if (([v10 isMailboxesCollection] & 1) == 0) {
          break;
        }
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_11;
      }
    }
    id v15 = v10;

    if (!v15) {
      goto LABEL_15;
    }
    [(NSRecursiveLock *)v18->_lock lock];
    if (v12 == (id)0x7FFFFFFFFFFFFFFFLL) {
      [v15 addOrUpdateExpandedItem:v5 replacedItem:0];
    }
    else {
      [v15 addOrUpdateItem:v5 replacedItem:0];
    }
    [(NSRecursiveLock *)v18->_lock unlock];
    if (v17) {
      [(FavoritesManager *)v18 scheduleUpdateFavoritesPersistenceForChangeType:2 withReason:@"refreshCollectionForItemExpansion"];
    }
  }
  else
  {
LABEL_11:

LABEL_15:
    id v16 = MFLogGeneral();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100459C90((uint64_t)v5, v16);
    }

    id v15 = 0;
  }
}

- (void)scheduleUpdateFavoritesPersistenceForChangeType:(unint64_t)a3 withReason:(id)a4
{
  id v6 = a4;
  id v7 = [(FavoritesManager *)self favoritesPersistence];
  uint64_t v8 = self->_mailboxCollections;
  uint64_t v9 = +[EFScheduler globalAsyncScheduler];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000BF7B8;
  v13[3] = &unk_100606D48;
  id v10 = v7;
  id v14 = v10;
  long long v11 = v8;
  id v15 = v11;
  unint64_t v18 = a3;
  id v12 = v6;
  id v16 = v12;
  BOOL v17 = self;
  [v9 performBlock:v13];
}

- (void)scheduleOrderChangeUpdateFavoritesPersistence:(unint64_t)a3 withReason:(id)a4
{
  id v6 = a4;
  id v7 = [(FavoritesManager *)self favoritesPersistence];
  uint64_t v8 = self->_mailboxCollections;
  uint64_t v9 = +[EFScheduler globalAsyncScheduler];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000BF92C;
  v13[3] = &unk_100606D48;
  id v10 = v7;
  id v14 = v10;
  long long v11 = v8;
  id v15 = v11;
  unint64_t v18 = a3;
  id v12 = v6;
  id v16 = v12;
  BOOL v17 = self;
  [v9 performBlock:v13];
}

- (void)scheduleItemChangeUpdateFavoritesPersistence:(id)a3 removedItems:(id)a4 withReason:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = [(FavoritesManager *)self favoritesPersistence];
  id v12 = self->_mailboxCollections;
  char v13 = +[EFScheduler globalAsyncScheduler];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000BFB14;
  v21[3] = &unk_100606D70;
  id v14 = v11;
  id v22 = v14;
  id v15 = v12;
  __int16 v23 = v15;
  long long v19 = v11;
  id v20 = v8;
  id v16 = v8;
  id v24 = v16;
  id v17 = v9;
  id v25 = v17;
  id v18 = v10;
  id v26 = v18;
  uint64_t v27 = self;
  [v13 performBlock:v21, v19, v20];
}

- (void)scheduleSetVisibility:(BOOL)a3 forSourceType:(unint64_t)a4
{
  id v6 = [(FavoritesManager *)self favoritesPersistence];
  id v7 = +[EFScheduler globalAsyncScheduler];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000BFC18;
  v9[3] = &unk_100606D98;
  id v8 = v6;
  BOOL v12 = a3;
  id v10 = v8;
  unint64_t v11 = a4;
  [v7 performBlock:v9];
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self->_mailboxCollections;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (unint64_t i = 0; i != v6; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v9, "transient", (void)v14) & 1) == 0)
        {
          id v10 = [v9 dictionaryRepresentation];
          [v4 addObject:v10];
        }
      }
      id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  [v3 setObject:v4 forKeyedSubscript:@"Collections"];
  lastSelectedItem = self->_lastSelectedItem;
  if (lastSelectedItem)
  {
    BOOL v12 = [(FavoriteItem *)lastSelectedItem dictionaryRepresentation];
    [v3 setObject:v12 forKeyedSubscript:@"LastSelectedItem"];
  }

  return v3;
}

- (BOOL)_isDictionaryRepresentationValid:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = [v3 ef_objectOfClass:objc_opt_class() forKey:@"Collections"];
    id v5 = v4;
    if (v4 && (objc_msgSend(v4, "ef_all:", &stru_100606DB8) & 1) != 0)
    {
      id v6 = [v3 ef_objectOfClass:objc_opt_class() forKey:@"LastSelectedItem"];
      BOOL v7 = v6 != 0;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (id)defaultsKeyForAutomaticMailboxVisibilityForSourceType:(unint64_t)a3
{
  CFStringRef v3 = @"ReadLaterMailboxWasDismissed";
  CFStringRef v4 = @"SendLaterMailboxWasDismissed";
  if (a3 != 25) {
    CFStringRef v4 = 0;
  }
  if (a3 != 15) {
    CFStringRef v3 = v4;
  }
  CFStringRef v5 = @"FlaggedMailboxWasDismissed";
  CFStringRef v6 = @"ThreadNotificationsMailboxWasDismissed";
  if (a3 != 6) {
    CFStringRef v6 = 0;
  }
  if (a3 != 2) {
    CFStringRef v5 = v6;
  }
  if ((uint64_t)a3 <= 14) {
    return (id)v5;
  }
  else {
    return (id)v3;
  }
}

- (void)_sharedMailboxControllerBadgeCountDidChange:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [v4 object];
  uint64_t v6 = (uint64_t)[v5 sourceType];
  BOOL v7 = [v4 userInfo];
  id v8 = [(id)objc_opt_class() defaultsKeyForAutomaticMailboxVisibilityForSourceType:v6];
  unint64_t v9 = 0;
  if (v6 > 14)
  {
    if (v6 != 15)
    {
      BOOL v10 = 0;
      if (v6 != 25) {
        goto LABEL_8;
      }
    }
LABEL_7:
    BOOL v10 = v6 != 2;
    BOOL v12 = [v7 objectForKeyedSubscript:SharedNetworkControllerBadgeCountKey];
    id v13 = [v12 integerValue];

    unint64_t v9 = (uint64_t)v13 > 0;
    goto LABEL_8;
  }
  if (v6 == 2) {
    goto LABEL_7;
  }
  BOOL v10 = 0;
  if (v6 == 6)
  {
    unint64_t v11 = [(FavoritesManager *)self conversationSubscriptionProvider];
    unint64_t v9 = (unint64_t)[v11 hasSubscribedConversations];

    BOOL v10 = 0;
  }
LABEL_8:
  long long v14 = +[NSUserDefaults standardUserDefaults];
  unsigned int v15 = [v14 BOOLForKey:v8];

  long long v16 = MFLogGeneral();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17[0] = 67109890;
    v17[1] = v9;
    __int16 v18 = 1024;
    BOOL v19 = v10;
    __int16 v20 = 1024;
    unsigned int v21 = v15;
    __int16 v22 = 2112;
    id v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "#Favorites FavoritesManager _sharedMailboxControllerBadgeCountDidChange doShow:%{BOOL}d setHiddenVisibility:%{BOOL}d defaultsValue:%{BOOL}d notification:%@ ", (uint8_t *)v17, 0x1Eu);
  }

  if (v8 && (((v9 | v10) ^ 1 | v15) & 1) == 0) {
    [(FavoritesManager *)self scheduleSetVisibility:v9 forSourceType:v6];
  }
}

- (FavoriteItem)previousSelectedItem
{
  return self->_previousSelectedItem;
}

- (void)setHasLaunchedWithCollapsibleMailboxes:(BOOL)a3
{
  self->_hasLaunchedWithCollapsibleMailboxes = a3;
}

- (BOOL)hasVisibleFavoriteMailboxes
{
  return self->_hasVisibleFavoriteMailboxes;
}

- (NSRecursiveLock)lock
{
  return self->_lock;
}

- (EDConversationSubscriptionProvider)conversationSubscriptionProvider
{
  return self->_conversationSubscriptionProvider;
}

- (NSMutableArray)mailboxCollections
{
  return self->_mailboxCollections;
}

- (void)setMailboxCollections:(id)a3
{
}

- (void)setVisibleMailboxCollections:(id)a3
{
}

- (NSMutableArray)expandedItems
{
  return self->_expandedItems;
}

- (void)setExpandedItems:(id)a3
{
}

- (BOOL)showingOutbox
{
  return self->_showingOutbox;
}

- (void)setShowingOutbox:(BOOL)a3
{
  self->_showingOutbox = a3;
}

- (BOOL)showingSingleAccount
{
  return self->_showingSingleAccount;
}

- (void)setShowingSingleAccount:(BOOL)a3
{
  self->_showingSingleAccount = a3;
}

- (EFCancelable)userDefaultsObserver
{
  return self->_userDefaultsObserver;
}

- (void)setUserDefaultsObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaultsObserver, 0);
  objc_storeStrong((id *)&self->_reloadDebouncer, 0);
  objc_storeStrong((id *)&self->_expandedItems, 0);
  objc_storeStrong((id *)&self->_visibleMailboxCollections, 0);
  objc_storeStrong((id *)&self->_mailboxCollections, 0);
  objc_storeStrong((id *)&self->_conversationSubscriptionProvider, 0);
  objc_storeStrong((id *)&self->_favoritesPersistence, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_previousSelectedItem, 0);

  objc_storeStrong((id *)&self->_lastSelectedItem, 0);
}

@end