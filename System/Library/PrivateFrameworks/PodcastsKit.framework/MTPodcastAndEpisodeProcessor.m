@interface MTPodcastAndEpisodeProcessor
- (MTPodcastAndEpisodeProcessor)init;
- (NSMutableDictionary)episodeObservers;
- (id)createEpisodeObserverForPodcastUuid:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5;
- (id)entityName;
- (id)episodeObserverForPodcastUuid:(id)a3;
- (id)episodePredicateForPodcast:(id)a3;
- (id)episodeSortDescriptorsForPodcast:(id)a3;
- (id)episodeUuids;
- (id)podcastPredicate;
- (id)podcastUuids;
- (void)addEpisodeObserverForPodcast:(id)a3;
- (void)episodeUuidObserver:(id)a3 resultsChangedForPodcast:(id)a4 withDeletedIds:(id)a5 andInsertIds:(id)a6;
- (void)removeEpisodeObserverForPodcast:(id)a3;
- (void)removeEpisodeObserverForPodcasts:(id)a3;
- (void)setEpisodeObservers:(id)a3;
- (void)stop;
- (void)updateEpisodeObserverForPodcast:(id)a3;
- (void)updateEpisodePredicatesWithDeletedIds:(id)a3 andInsertIds:(id)a4 andUpdatedIds:(id)a5;
@end

@implementation MTPodcastAndEpisodeProcessor

- (MTPodcastAndEpisodeProcessor)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTPodcastAndEpisodeProcessor;
  v2 = [(MTBaseProcessor *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    episodeObservers = v2->_episodeObservers;
    v2->_episodeObservers = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)stop
{
  v5.receiver = self;
  v5.super_class = (Class)MTPodcastAndEpisodeProcessor;
  [(MTBaseProcessor *)&v5 stop];
  uint64_t v3 = [(MTPodcastAndEpisodeProcessor *)self episodeObservers];
  v4 = [v3 allValues];
  [v4 enumerateObjectsUsingBlock:&__block_literal_global];
}

uint64_t __36__MTPodcastAndEpisodeProcessor_stop__block_invoke(uint64_t a1, void *a2)
{
  return [a2 stop];
}

- (id)entityName
{
  return (id)*MEMORY[0x263F5EBB0];
}

- (id)podcastPredicate
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF488] reason:@"podcastPredicate must be implemented by subclasses" userInfo:0];
  objc_exception_throw(v2);
}

- (id)episodePredicateForPodcast:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF488] reason:@"episodePredicateForPodcast must be implemented by subclasses" userInfo:0];
  objc_exception_throw(v4);
}

- (id)episodeSortDescriptorsForPodcast:(id)a3
{
  return (id)MEMORY[0x263EFFA68];
}

- (void)updateEpisodePredicatesWithDeletedIds:(id)a3 andInsertIds:(id)a4 andUpdatedIds:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __97__MTPodcastAndEpisodeProcessor_updateEpisodePredicatesWithDeletedIds_andInsertIds_andUpdatedIds___block_invoke;
  v14[3] = &unk_265055520;
  objc_copyWeak(&v18, &location);
  id v11 = v8;
  id v15 = v11;
  id v12 = v10;
  id v16 = v12;
  id v13 = v9;
  id v17 = v13;
  [(MTBaseProcessor *)self enqueueWorkBlock:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __97__MTPodcastAndEpisodeProcessor_updateEpisodePredicatesWithDeletedIds_andInsertIds_andUpdatedIds___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = (void *)MEMORY[0x2455C4050]();
    [WeakRetained removeEpisodeObserverForPodcasts:*(void *)(a1 + 32)];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v19;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v19 != v7) {
            objc_enumerationMutation(v4);
          }
          [WeakRetained updateEpisodeObserverForPodcast:*(void *)(*((void *)&v18 + 1) + 8 * v8++)];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v6);
    }

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v9 = *(id *)(a1 + 48);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(WeakRetained, "addEpisodeObserverForPodcast:", *(void *)(*((void *)&v14 + 1) + 8 * v13++), (void)v14);
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
      }
      while (v11);
    }
  }
}

- (void)addEpisodeObserverForPodcast:(id)a3
{
  id v10 = a3;
  id v4 = (void *)MEMORY[0x2455C4050]();
  uint64_t v5 = [(MTPodcastAndEpisodeProcessor *)self episodePredicateForPodcast:v10];
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x263F08A98] falsePredicate];
  }
  uint64_t v6 = [(MTPodcastAndEpisodeProcessor *)self episodeSortDescriptorsForPodcast:v10];
  uint64_t v7 = [(MTPodcastAndEpisodeProcessor *)self createEpisodeObserverForPodcastUuid:v10 predicate:v5 sortDescriptors:v6];
  [v7 setIdentifier:v10];
  uint64_t v8 = [(MTPodcastAndEpisodeProcessor *)self episodeObservers];
  objc_sync_enter(v8);
  id v9 = [(MTPodcastAndEpisodeProcessor *)self episodeObservers];
  [v9 setObject:v7 forKeyedSubscript:v10];

  objc_sync_exit(v8);
  [v7 startObserving];
}

- (void)updateEpisodeObserverForPodcast:(id)a3
{
  id v13 = a3;
  id v4 = (void *)MEMORY[0x2455C4050]();
  uint64_t v5 = [(MTPodcastAndEpisodeProcessor *)self episodePredicateForPodcast:v13];
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x263F08A98] falsePredicate];
  }
  uint64_t v6 = [(MTPodcastAndEpisodeProcessor *)self episodeObserverForPodcastUuid:v13];
  uint64_t v7 = v6;
  if (!v6) {
    goto LABEL_7;
  }
  uint64_t v8 = [v6 predicate];
  id v9 = v8;
  if (!v8 || ([v8 isEqual:v5] & 1) == 0)
  {
    [v7 stop];

LABEL_7:
    id v9 = [(MTPodcastAndEpisodeProcessor *)self episodeSortDescriptorsForPodcast:v13];
    id v10 = [(MTPodcastAndEpisodeProcessor *)self createEpisodeObserverForPodcastUuid:v13 predicate:v5 sortDescriptors:v9];
    [v10 setIdentifier:v13];
    uint64_t v11 = [(MTPodcastAndEpisodeProcessor *)self episodeObservers];
    objc_sync_enter(v11);
    uint64_t v12 = [(MTPodcastAndEpisodeProcessor *)self episodeObservers];
    [v12 setObject:v10 forKeyedSubscript:v13];

    objc_sync_exit(v11);
    [v10 startObserving];
  }
}

- (void)removeEpisodeObserverForPodcast:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263EFFA08];
  id v9 = a3;
  uint64_t v5 = (void *)MEMORY[0x263EFF8C0];
  id v6 = a3;
  uint64_t v7 = [v5 arrayWithObjects:&v9 count:1];
  uint64_t v8 = objc_msgSend(v4, "setWithArray:", v7, v9, v10);

  [(MTPodcastAndEpisodeProcessor *)self removeEpisodeObserverForPodcasts:v8];
}

- (void)removeEpisodeObserverForPodcasts:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v4 = [(MTPodcastAndEpisodeProcessor *)self episodeObservers];
  objc_sync_enter(v4);
  if ([v14 count])
  {
    uint64_t v5 = objc_opt_new();
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v14;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v16;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * v9);
          uint64_t v11 = [(MTPodcastAndEpisodeProcessor *)self episodeObservers];
          uint64_t v12 = [v11 objectForKeyedSubscript:v10];

          if (v12)
          {
            [v12 stop];
            [v5 addObject:v10];
          }

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }

    id v13 = [(MTPodcastAndEpisodeProcessor *)self episodeObservers];
    [v13 removeObjectsForKeys:v5];
  }
  objc_sync_exit(v4);
}

- (id)createEpisodeObserverForPodcastUuid:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [MTUuidQueryObserver alloc];
  uint64_t v12 = [(MTBaseQueryObserver *)v11 initWithEntityName:*MEMORY[0x263F5EBA0] predicate:v9 sortDescriptors:v10];
  objc_initWeak(&location, self);
  objc_initWeak(&from, v12);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __94__MTPodcastAndEpisodeProcessor_createEpisodeObserverForPodcastUuid_predicate_sortDescriptors___block_invoke;
  v16[3] = &unk_265055570;
  objc_copyWeak(&v18, &location);
  objc_copyWeak(&v19, &from);
  id v13 = v8;
  id v17 = v13;
  id v14 = [(MTUuidQueryObserver *)v12 addResultsChangedHandler:v16];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v12;
}

void __94__MTPodcastAndEpisodeProcessor_createEpisodeObserverForPodcastUuid_predicate_sortDescriptors___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __94__MTPodcastAndEpisodeProcessor_createEpisodeObserverForPodcastUuid_predicate_sortDescriptors___block_invoke_2;
  v10[3] = &unk_265055548;
  objc_copyWeak(&v14, a1 + 6);
  objc_copyWeak(&v15, a1 + 5);
  id v11 = a1[4];
  id v8 = v5;
  id v12 = v8;
  id v9 = v6;
  id v13 = v9;
  [WeakRetained enqueueWorkBlock:v10];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v14);
}

void __94__MTPodcastAndEpisodeProcessor_createEpisodeObserverForPodcastUuid_predicate_sortDescriptors___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v2 = objc_loadWeakRetained((id *)(a1 + 64));
  [v2 episodeUuidObserver:WeakRetained resultsChangedForPodcast:*(void *)(a1 + 32) withDeletedIds:*(void *)(a1 + 40) andInsertIds:*(void *)(a1 + 48)];
}

- (void)episodeUuidObserver:(id)a3 resultsChangedForPodcast:(id)a4 withDeletedIds:(id)a5 andInsertIds:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = NSString;
  id v15 = NSStringFromSelector(a2);
  uint64_t v16 = [v14 stringWithFormat:@"%@ must be implemented by subclasses", v15];

  id v17 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF488] reason:v16 userInfo:0];
  objc_exception_throw(v17);
}

- (id)episodeObserverForPodcastUuid:(id)a3
{
  id v4 = a3;
  id v5 = [(MTPodcastAndEpisodeProcessor *)self episodeObservers];
  objc_sync_enter(v5);
  id v6 = [(MTPodcastAndEpisodeProcessor *)self episodeObservers];
  uint64_t v7 = [v6 objectForKeyedSubscript:v4];

  objc_sync_exit(v5);
  return v7;
}

- (id)podcastUuids
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy_;
  id v9 = __Block_byref_object_dispose_;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__MTPodcastAndEpisodeProcessor_podcastUuids__block_invoke;
  v4[3] = &unk_265055598;
  v4[4] = &v5;
  [(MTBaseProcessor *)self results:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __44__MTPodcastAndEpisodeProcessor_podcastUuids__block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 valueForKey:*MEMORY[0x263F5ED38]];
  return MEMORY[0x270F9A758]();
}

- (id)episodeUuids
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy_;
  id v12 = __Block_byref_object_dispose_;
  id v13 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v3 = [(MTPodcastAndEpisodeProcessor *)self episodeObservers];
  objc_sync_enter(v3);
  id v4 = [(MTPodcastAndEpisodeProcessor *)self episodeObservers];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__MTPodcastAndEpisodeProcessor_episodeUuids__block_invoke;
  v7[3] = &unk_2650555C0;
  v7[4] = &v8;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];

  objc_sync_exit(v3);
  uint64_t v5 = (void *)[(id)v9[5] copy];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __44__MTPodcastAndEpisodeProcessor_episodeUuids__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v4 = [a3 uuids];
  [v3 unionSet:v4];
}

- (NSMutableDictionary)episodeObservers
{
  return self->_episodeObservers;
}

- (void)setEpisodeObservers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end