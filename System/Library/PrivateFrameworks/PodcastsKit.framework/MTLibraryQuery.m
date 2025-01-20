@interface MTLibraryQuery
- (BOOL)isActive;
- (MTLibraryQuery)init;
- (NSArray)channelResults;
- (NSArray)channelSortDescriptors;
- (NSArray)episodeResults;
- (NSArray)episodeSortDescriptors;
- (NSArray)podcastResults;
- (NSArray)podcastSortDescriptors;
- (NSPredicate)channelPredicate;
- (NSPredicate)episodePredicate;
- (NSPredicate)podcastPredicate;
- (id)action;
- (int64_t)fetchLimit;
- (void)runQuery;
- (void)runQueryInContext:(id)a3;
- (void)runQueryWithPodcastPredicate:(id)a3 episodePredicate:(id)a4 channelPredicate:(id)a5;
- (void)setAction:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setChannelPredicate:(id)a3;
- (void)setChannelResults:(id)a3;
- (void)setChannelSortDescriptors:(id)a3;
- (void)setEpisodePredicate:(id)a3;
- (void)setEpisodeResults:(id)a3;
- (void)setEpisodeSortDescriptors:(id)a3;
- (void)setFetchLimit:(int64_t)a3;
- (void)setPodcastPredicate:(id)a3;
- (void)setPodcastResults:(id)a3;
- (void)setPodcastSortDescriptors:(id)a3;
@end

@implementation MTLibraryQuery

- (MTLibraryQuery)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTLibraryQuery;
  v2 = [(MTLibraryQuery *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_active = 1;
    v2->_fetchLimit = 0;
    v4 = v2;
  }

  return v3;
}

- (void)runQueryWithPodcastPredicate:(id)a3 episodePredicate:(id)a4 channelPredicate:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  [(MTLibraryQuery *)self setPodcastPredicate:a3];
  [(MTLibraryQuery *)self setEpisodePredicate:v9];

  [(MTLibraryQuery *)self setChannelPredicate:v8];
  [(MTLibraryQuery *)self runQuery];
}

- (void)runQuery
{
  v3 = [MEMORY[0x263F5E9D0] sharedInstance];
  id v4 = [v3 mainOrPrivateContext];

  [(MTLibraryQuery *)self runQueryInContext:v4];
}

- (void)runQueryInContext:(id)a3
{
  id v4 = a3;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__4;
  v47 = __Block_byref_object_dispose__4;
  id v48 = 0;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__4;
  v41 = __Block_byref_object_dispose__4;
  id v42 = 0;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__4;
  v35 = __Block_byref_object_dispose__4;
  id v36 = [MEMORY[0x263EFF980] array];
  v5 = self->_episodeSortDescriptors;
  objc_super v6 = self->_podcastSortDescriptors;
  v7 = self->_channelSortDescriptors;
  id v8 = self->_podcastPredicate;
  id v9 = self->_episodePredicate;
  v10 = self->_channelPredicate;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __36__MTLibraryQuery_runQueryInContext___block_invoke;
  v19[3] = &unk_265055C28;
  v11 = v8;
  v20 = v11;
  v12 = v6;
  v21 = v12;
  v22 = self;
  v28 = &v37;
  id v13 = v4;
  id v23 = v13;
  v29 = &v31;
  v14 = v9;
  v24 = v14;
  v30 = &v43;
  v15 = v5;
  v25 = v15;
  v16 = v10;
  v26 = v16;
  v17 = v7;
  v27 = v17;
  [v13 performBlockAndWait:v19];
  action = (void (**)(id, uint64_t, uint64_t, uint64_t))self->_action;
  if (action) {
    action[2](action, v38[5], v44[5], v32[5]);
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v43, 8);
}

void __36__MTLibraryQuery_runQueryInContext___block_invoke(uint64_t a1)
{
  v33[1] = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    id v2 = objc_alloc(MEMORY[0x263EFF260]);
    v3 = (void *)[v2 initWithEntityName:*MEMORY[0x263F5EBB0]];
    [v3 setPredicate:*(void *)(a1 + 32)];
    [v3 setResultType:0];
    [v3 setSortDescriptors:*(void *)(a1 + 40)];
    objc_msgSend(v3, "setFetchLimit:", objc_msgSend(*(id *)(a1 + 48), "fetchLimit"));
    v33[0] = *MEMORY[0x263F5EC60];
    id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:1];
    [v3 setRelationshipKeyPathsForPrefetching:v4];

    [v3 setReturnsObjectsAsFaults:0];
    v5 = *(void **)(a1 + 56);
    id v31 = 0;
    uint64_t v6 = [v5 executeFetchRequest:v3 error:&v31];
    id v7 = v31;
    uint64_t v8 = *(void *)(*(void *)(a1 + 96) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v6;

    v10 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
    if (!v10)
    {
      [v7 logAndThrow:1];
      v10 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v28;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * v15), "channel", (void)v27);
          v17 = v16;
          if (v16
            && [v16 showCount] >= 2
            && ([*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) containsObject:v17] & 1) == 0)
          {
            [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) addObject:v17];
          }

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v13);
    }
  }
  uint64_t v18 = *(void *)(a1 + 64);
  if (v18)
  {
    uint64_t v19 = objc_msgSend(*(id *)(a1 + 56), "objectsInEntity:predicate:sortDescriptors:returnsObjectsAsFaults:limit:", *MEMORY[0x263F5EBA0], v18, *(void *)(a1 + 72), 0, objc_msgSend(*(id *)(a1 + 48), "fetchLimit"));
    uint64_t v20 = *(void *)(*(void *)(a1 + 112) + 8);
    v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;
  }
  uint64_t v22 = *(void *)(a1 + 80);
  if (v22)
  {
    id v23 = *(void **)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
    v24 = objc_msgSend(*(id *)(a1 + 56), "objectsInEntity:predicate:sortDescriptors:returnsObjectsAsFaults:limit:", *MEMORY[0x263F5EB98], v22, *(void *)(a1 + 88), 0, objc_msgSend(*(id *)(a1 + 48), "fetchLimit"));
    [v23 addObjectsFromArray:v24];
  }
  objc_msgSend(*(id *)(a1 + 48), "setPodcastResults:", *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), (void)v27);
  [*(id *)(a1 + 48) setEpisodeResults:*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40)];
  v25 = *(void **)(a1 + 48);
  v26 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) copy];
  [v25 setChannelResults:v26];
}

- (NSArray)podcastResults
{
  return self->_podcastResults;
}

- (void)setPodcastResults:(id)a3
{
}

- (NSArray)episodeResults
{
  return self->_episodeResults;
}

- (void)setEpisodeResults:(id)a3
{
}

- (NSArray)channelResults
{
  return self->_channelResults;
}

- (void)setChannelResults:(id)a3
{
}

- (NSPredicate)podcastPredicate
{
  return self->_podcastPredicate;
}

- (void)setPodcastPredicate:(id)a3
{
}

- (NSPredicate)episodePredicate
{
  return self->_episodePredicate;
}

- (void)setEpisodePredicate:(id)a3
{
}

- (NSPredicate)channelPredicate
{
  return self->_channelPredicate;
}

- (void)setChannelPredicate:(id)a3
{
}

- (NSArray)podcastSortDescriptors
{
  return self->_podcastSortDescriptors;
}

- (void)setPodcastSortDescriptors:(id)a3
{
}

- (NSArray)episodeSortDescriptors
{
  return self->_episodeSortDescriptors;
}

- (void)setEpisodeSortDescriptors:(id)a3
{
}

- (NSArray)channelSortDescriptors
{
  return self->_channelSortDescriptors;
}

- (void)setChannelSortDescriptors:(id)a3
{
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (int64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (void)setFetchLimit:(int64_t)a3
{
  self->_fetchLimit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_channelSortDescriptors, 0);
  objc_storeStrong((id *)&self->_episodeSortDescriptors, 0);
  objc_storeStrong((id *)&self->_podcastSortDescriptors, 0);
  objc_storeStrong((id *)&self->_channelPredicate, 0);
  objc_storeStrong((id *)&self->_episodePredicate, 0);
  objc_storeStrong((id *)&self->_podcastPredicate, 0);
  objc_storeStrong((id *)&self->_channelResults, 0);
  objc_storeStrong((id *)&self->_episodeResults, 0);
  objc_storeStrong((id *)&self->_podcastResults, 0);
}

@end