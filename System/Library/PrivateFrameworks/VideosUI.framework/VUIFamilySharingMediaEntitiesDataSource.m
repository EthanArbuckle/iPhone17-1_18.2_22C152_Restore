@interface VUIFamilySharingMediaEntitiesDataSource
+ (id)mediaCollectionWithAMSMediaItem:(id)a3;
- (BOOL)_grouping:(id)a3 containsMediaEntity:(id)a4;
- (BOOL)_hasNextBatch;
- (BOOL)_isAllowedToShowMediaItem:(id)a3;
- (BOOL)_processedEntitiesContainsEntityWithIdentifier:(id)a3;
- (BOOL)fetchAllEntities;
- (BOOL)loadingNextBatch;
- (BOOL)orderEpisodesByEpisodeNumber;
- (BOOL)shouldCoalesceEpisodesToSeasons;
- (BOOL)shouldCoalesceEpisodesToShows;
- (BOOL)shouldGroupBySeason;
- (NSMutableArray)processedEntities;
- (NSNumber)desiredBatchSize;
- (NSNumber)resultLimit;
- (NSString)seasonIdentifierFilter;
- (NSURLRequest)urlRequest;
- (VUIFamilySharingMediaEntitiesDataSource)initWithNSURLRequest:(id)a3;
- (VUIMediaAPIClient)mediaClient;
- (VUIMediaAPIResponseMetadata)responseMetadata;
- (id)_addSeasonNumber:(id)a3 toCollectionSeasonNumbers:(id)a4;
- (id)_applyContentRestrictionsFilterToMediaEntities:(id)a3;
- (id)_episodeOrderingComparator;
- (id)_getEntityInProcessedEntitiesWithIdentifier:(id)a3;
- (id)_getGroupingFrom:(id)a3 groupingIdentifier:(id)a4;
- (id)_getLimitFromURLRequest;
- (id)_updateOffsetQueryItemForQueryItems:(id)a3;
- (unint64_t)numberOfEntitiesProcessedInBatch;
- (void)_appendNextOffsetToURLRequest;
- (void)_applyContentRestrictionsFilter;
- (void)_applyContentRestrictionsFilterToGroupings;
- (void)_coalesceEpisodesToSeasonsFromParsedEntities:(id)a3;
- (void)_coalesceEpisodesToShowsFromParsedEntities:(id)a3;
- (void)_filterEntitiesBySeasonIdentifierIfNecessary;
- (void)_filterGroupingsBySeasonIdentifierIfNecessary;
- (void)_groupEpisodesbySeason:(id)a3;
- (void)_limitEntitiesReturnedIfNecessary;
- (void)_orderEpisodesIfNecessary;
- (void)_orderEpisodesInGroupings;
- (void)_orderSeasonsBySeasonNumber;
- (void)loadNextEntityBatch;
- (void)setDesiredBatchSize:(id)a3;
- (void)setFetchAllEntities:(BOOL)a3;
- (void)setLoadingNextBatch:(BOOL)a3;
- (void)setMediaClient:(id)a3;
- (void)setNumberOfEntitiesProcessedInBatch:(unint64_t)a3;
- (void)setOrderEpisodesByEpisodeNumber:(BOOL)a3;
- (void)setProcessedEntities:(id)a3;
- (void)setResponseMetadata:(id)a3;
- (void)setResultLimit:(id)a3;
- (void)setSeasonIdentifierFilter:(id)a3;
- (void)setShouldCoalesceEpisodesToSeasons:(BOOL)a3;
- (void)setShouldCoalesceEpisodesToShows:(BOOL)a3;
- (void)setShouldGroupBySeason:(BOOL)a3;
- (void)setUrlRequest:(id)a3;
- (void)startFetch;
@end

@implementation VUIFamilySharingMediaEntitiesDataSource

- (VUIFamilySharingMediaEntitiesDataSource)initWithNSURLRequest:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VUIFamilySharingMediaEntitiesDataSource;
  v6 = [(VUIFamilySharingMediaEntitiesDataSource *)&v14 init];
  if (v6)
  {
    +[VUIMediaAPIClient initializeWithAppleTVClientIdentifier];
    uint64_t v7 = +[VUIMediaAPIClient sharedInstance];
    mediaClient = v6->_mediaClient;
    v6->_mediaClient = (VUIMediaAPIClient *)v7;

    objc_storeStrong((id *)&v6->_urlRequest, a3);
    uint64_t v9 = [(VUIFamilySharingMediaEntitiesDataSource *)v6 _getLimitFromURLRequest];
    desiredBatchSize = v6->_desiredBatchSize;
    v6->_desiredBatchSize = (NSNumber *)v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    processedEntities = v6->_processedEntities;
    v6->_processedEntities = v11;

    v6->_loadingNextBatch = 0;
    v6->_numberOfEntitiesProcessedInBatch = 0;
  }

  return v6;
}

- (void)startFetch
{
  objc_initWeak(&location, self);
  v3 = [(VUIFamilySharingMediaEntitiesDataSource *)self mediaClient];
  v4 = [(VUIFamilySharingMediaEntitiesDataSource *)self urlRequest];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__VUIFamilySharingMediaEntitiesDataSource_startFetch__block_invoke;
  v5[3] = &unk_1E6DF4FD0;
  objc_copyWeak(&v6, &location);
  [v3 fetchContentForUrl:v4 completion:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __53__VUIFamilySharingMediaEntitiesDataSource_startFetch__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!v6)
  {
    v25 = objc_alloc_init(VUIFamilySharingMediaEntitiesResponseMetadataParser);
    uint64_t v9 = [(VUIFamilySharingMediaEntitiesResponseMetadataParser *)v25 parseAMSURLResult:v5];
    [WeakRetained setResponseMetadata:v9];
    v10 = objc_alloc_init(VUIFamilySharingEntityRequestResponseParser);
    v11 = [(VUIFamilySharingEntityRequestResponseParser *)v10 parseAMSURLResult:v5];
    if ([WeakRetained shouldGroupBySeason])
    {
      [WeakRetained _groupEpisodesbySeason:v11];
      [WeakRetained _orderEpisodesInGroupings];
    }
    if ([WeakRetained shouldCoalesceEpisodesToShows])
    {
      [WeakRetained _coalesceEpisodesToShowsFromParsedEntities:v11];
    }
    else if ([WeakRetained shouldCoalesceEpisodesToSeasons])
    {
      [WeakRetained _coalesceEpisodesToSeasonsFromParsedEntities:v11];
      [WeakRetained _orderSeasonsBySeasonNumber];
    }
    else
    {
      id v12 = objc_alloc(MEMORY[0x1E4F1CA48]);
      v13 = [WeakRetained mediaEntities];
      objc_super v14 = (void *)[v12 initWithArray:v13];
      v15 = (void *)[v14 mutableCopy];

      [v15 addObjectsFromArray:v11];
      [WeakRetained setProcessedEntities:v15];
    }
    v16 = [WeakRetained processedEntities];
    uint64_t v17 = [v16 count];
    v18 = [WeakRetained mediaEntities];
    uint64_t v19 = v17 - [v18 count];

    objc_msgSend(WeakRetained, "setNumberOfEntitiesProcessedInBatch:", v19 + objc_msgSend(WeakRetained, "numberOfEntitiesProcessedInBatch"));
    v20 = [WeakRetained processedEntities];
    [WeakRetained setMediaEntities:v20];
  }
  if ([WeakRetained loadingNextBatch]) {
    [WeakRetained setLoadingNextBatch:0];
  }
  [WeakRetained _applyContentRestrictionsFilter];
  [WeakRetained _filterEntitiesBySeasonIdentifierIfNecessary];
  [WeakRetained _filterGroupingsBySeasonIdentifierIfNecessary];
  [WeakRetained _orderEpisodesIfNecessary];
  [WeakRetained _limitEntitiesReturnedIfNecessary];
  unint64_t v21 = [WeakRetained numberOfEntitiesProcessedInBatch];
  v22 = [WeakRetained desiredBatchSize];
  if (v21 < [v22 unsignedIntegerValue] || objc_msgSend(WeakRetained, "fetchAllEntities"))
  {
    char v23 = [WeakRetained _hasNextBatch];

    if (v23)
    {
      [WeakRetained loadNextEntityBatch];
      goto LABEL_21;
    }
  }
  else
  {
  }
  [WeakRetained setNumberOfEntitiesProcessedInBatch:0];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v27 = __53__VUIFamilySharingMediaEntitiesDataSource_startFetch__block_invoke_2;
  v28 = &unk_1E6DF4A30;
  objc_copyWeak(&v29, v7);
  v24 = v26;
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    v27((uint64_t)v24);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v24);
  }

  objc_destroyWeak(&v29);
LABEL_21:
}

void __53__VUIFamilySharingMediaEntitiesDataSource_startFetch__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  if (objc_opt_respondsToSelector()) {
    [v1 dataSourceDidFinishFetching:WeakRetained];
  }
}

- (void)loadNextEntityBatch
{
  if (![(VUIFamilySharingMediaEntitiesDataSource *)self loadingNextBatch])
  {
    if ([(VUIFamilySharingMediaEntitiesDataSource *)self _hasNextBatch])
    {
      uint64_t v3 = [(VUIFamilySharingMediaEntitiesDataSource *)self resultLimit];
      if (!v3) {
        goto LABEL_5;
      }
      v4 = (void *)v3;
      id v5 = [(VUIMediaEntitiesDataSource *)self mediaEntities];
      unint64_t v6 = [v5 count];
      uint64_t v7 = [(VUIFamilySharingMediaEntitiesDataSource *)self resultLimit];
      unint64_t v8 = [v7 unsignedIntegerValue];

      if (v6 < v8)
      {
LABEL_5:
        [(VUIFamilySharingMediaEntitiesDataSource *)self setLoadingNextBatch:1];
        [(VUIFamilySharingMediaEntitiesDataSource *)self _appendNextOffsetToURLRequest];
        [(VUIFamilySharingMediaEntitiesDataSource *)self startFetch];
      }
    }
  }
}

- (void)setShouldGroupBySeason:(BOOL)a3
{
  self->_shouldGroupBySeason = a3;
  if (a3) {
    self->_fetchAllEntities = 1;
  }
}

- (void)setShouldCoalesceEpisodesToSeasons:(BOOL)a3
{
  self->_shouldCoalesceEpisodesToSeasons = a3;
  if (a3) {
    self->_fetchAllEntities = 1;
  }
}

- (void)_coalesceEpisodesToShowsFromParsedEntities:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v32;
    unint64_t v8 = &off_1E6DF2000;
    uint64_t v29 = *(void *)v32;
    id v30 = v4;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "type", v29);
        id v12 = [v8[261] episode];

        if (v11 != v12)
        {
          v13 = [(VUIFamilySharingMediaEntitiesDataSource *)self processedEntities];
          [v13 addObject:v10];
          goto LABEL_18;
        }
        v13 = [v10 showIdentifier];
        if ([(VUIFamilySharingMediaEntitiesDataSource *)self _processedEntitiesContainsEntityWithIdentifier:v13])
        {
          objc_super v14 = [(VUIFamilySharingMediaEntitiesDataSource *)self _getEntityInProcessedEntitiesWithIdentifier:v13];
          v15 = [v10 seasonNumber];
          v16 = v15;
          if (v15)
          {
            uint64_t v17 = [v15 integerValue];
            v18 = [v14 seasonNumber];
            uint64_t v19 = [v18 integerValue];

            if (v17 > v19)
            {
              v20 = [(VUIFamilySharingMediaEntitiesDataSource *)self processedEntities];
              uint64_t v21 = [v20 indexOfObject:v14];

              v22 = +[VUIFamilySharingMediaEntitiesDataSource mediaCollectionWithAMSMediaItem:v10];
              char v23 = [v14 seasonNumbers];
              v24 = [(VUIFamilySharingMediaEntitiesDataSource *)self _addSeasonNumber:v16 toCollectionSeasonNumbers:v23];

              [v22 setSeasonNumbers:v24];
              v25 = [(VUIFamilySharingMediaEntitiesDataSource *)self processedEntities];
              [v25 replaceObjectAtIndex:v21 withObject:v22];

              uint64_t v7 = v29;
LABEL_16:
              unint64_t v8 = &off_1E6DF2000;

              id v4 = v30;
              goto LABEL_17;
            }
            v26 = [v14 seasonNumbers];
            char v27 = [v26 containsObject:v16];

            uint64_t v7 = v29;
            if ((v27 & 1) == 0)
            {
              v28 = [v14 seasonNumbers];
              v22 = [(VUIFamilySharingMediaEntitiesDataSource *)self _addSeasonNumber:v16 toCollectionSeasonNumbers:v28];

              [v14 setSeasonNumbers:v22];
              goto LABEL_16;
            }
            id v4 = v30;
            unint64_t v8 = &off_1E6DF2000;
          }
        }
        else
        {
          objc_super v14 = +[VUIFamilySharingMediaEntitiesDataSource mediaCollectionWithAMSMediaItem:v10];
          v16 = [(VUIFamilySharingMediaEntitiesDataSource *)self processedEntities];
          [v16 addObject:v14];
        }
LABEL_17:

LABEL_18:
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v6);
  }
}

+ (id)mediaCollectionWithAMSMediaItem:(id)a3
{
  id v3 = a3;
  id v4 = [v3 relationships];
  uint64_t v5 = objc_alloc_init(VUIFamilySharingEntity);
  uint64_t v6 = [v3 showTitle];
  [(VUIFamilySharingEntity *)v5 setShowTitle:v6];

  uint64_t v7 = [v4 show];
  unint64_t v8 = [v7 identifier];
  [(VUIFamilySharingEntity *)v5 setIdentifier:v8];

  uint64_t v9 = [v3 artworkURL];
  v10 = [v7 artworkURL];

  if (v10)
  {
    uint64_t v11 = [v7 artworkURL];

    uint64_t v9 = (void *)v11;
  }
  [(VUIFamilySharingEntity *)v5 setArtworkURL:v9];
  id v12 = [v7 standardDescription];
  [(VUIFamilySharingEntity *)v5 setStandardDescription:v12];

  v13 = [v7 contentRating];
  [(VUIFamilySharingEntity *)v5 setContentRating:v13];

  objc_super v14 = [v3 seasonNumber];
  [(VUIFamilySharingEntity *)v5 setSeasonNumber:v14];

  v15 = [v7 releaseDate];
  [(VUIFamilySharingEntity *)v5 setReleaseDate:v15];

  v16 = [v7 genreTitle];
  [(VUIFamilySharingEntity *)v5 setGenreTitle:v16];

  uint64_t v17 = objc_alloc_init(VUIFamilySharingRelationships);
  v18 = [v4 show];
  [(VUIFamilySharingRelationships *)v17 setShow:v18];

  [(VUIFamilySharingEntity *)v5 setRelationships:v17];
  uint64_t v19 = [VUIFamilySharingMediaCollection alloc];
  v20 = VUIMediaEntityFetchRequestAllPropertiesSet();
  uint64_t v21 = +[VUIMediaEntityType show];
  v22 = [(VUIFamilySharingMediaCollection *)v19 initWithAMSEntity:v5 requestedProperties:v20 mediaEntityType:v21];

  return v22;
}

- (id)_addSeasonNumber:(id)a3 toCollectionSeasonNumbers:(id)a4
{
  uint64_t v5 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = (void *)[[v5 alloc] initWithArray:v6];

  [v8 addObject:v7];
  uint64_t v9 = (void *)[v8 copy];

  return v9;
}

- (void)_coalesceEpisodesToSeasonsFromParsedEntities:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v43;
    unint64_t v8 = &off_1E6DF2000;
    id v38 = v4;
    v39 = self;
    uint64_t v37 = *(void *)v43;
    do
    {
      uint64_t v9 = 0;
      uint64_t v40 = v6;
      do
      {
        if (*(void *)v43 != v7) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v42 + 1) + 8 * v9);
        uint64_t v11 = [v10 type];
        id v12 = [v8[261] episode];

        if (v11 == v12)
        {
          v13 = [v10 seasonIdentifier];
          if (![(VUIFamilySharingMediaEntitiesDataSource *)self _processedEntitiesContainsEntityWithIdentifier:v13])
          {
            objc_super v14 = v8;
            v15 = [v10 relationships];
            v16 = [v15 season];
            uint64_t v17 = objc_alloc_init(VUIFamilySharingEntity);
            v18 = [v10 showTitle];
            [(VUIFamilySharingEntity *)v17 setShowTitle:v18];

            uint64_t v19 = [v16 identifier];
            [(VUIFamilySharingEntity *)v17 setIdentifier:v19];

            v20 = [v10 artworkURL];
            uint64_t v21 = [v16 artworkURL];

            if (v21)
            {
              uint64_t v22 = [v16 artworkURL];

              v20 = (void *)v22;
            }
            [(VUIFamilySharingEntity *)v17 setArtworkURL:v20];
            char v23 = [v16 standardDescription];
            [(VUIFamilySharingEntity *)v17 setStandardDescription:v23];

            v24 = [v16 contentRating];
            [(VUIFamilySharingEntity *)v17 setContentRating:v24];

            v25 = [v10 seasonNumber];
            [(VUIFamilySharingEntity *)v17 setSeasonNumber:v25];

            v26 = [v16 releaseDate];
            [(VUIFamilySharingEntity *)v17 setReleaseDate:v26];

            char v27 = [v16 genreTitle];
            [(VUIFamilySharingEntity *)v17 setGenreTitle:v27];

            v28 = objc_alloc_init(VUIFamilySharingRelationships);
            uint64_t v29 = [v15 show];
            [(VUIFamilySharingRelationships *)v28 setShow:v29];

            id v30 = [v15 season];
            [(VUIFamilySharingRelationships *)v28 setSeason:v30];

            [(VUIFamilySharingEntity *)v17 setRelationships:v28];
            long long v31 = [VUIFamilySharingMediaCollection alloc];
            VUIMediaEntityFetchRequestAllPropertiesSet();
            long long v32 = v41 = v15;
            long long v33 = v14;
            long long v34 = [v14[261] season];
            v35 = [(VUIFamilySharingMediaCollection *)v31 initWithAMSEntity:v17 requestedProperties:v32 mediaEntityType:v34];

            self = v39;
            uint64_t v36 = [(VUIFamilySharingMediaEntitiesDataSource *)v39 processedEntities];
            [v36 addObject:v35];

            unint64_t v8 = v33;
            uint64_t v7 = v37;
            id v4 = v38;
            uint64_t v6 = v40;
          }
        }
        else
        {
          v13 = [(VUIFamilySharingMediaEntitiesDataSource *)self processedEntities];
          [v13 addObject:v10];
        }

        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v6);
  }
}

- (void)_groupEpisodesbySeason:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = [(VUIMediaEntitiesDataSource *)self grouping];
  uint64_t v7 = (void *)[v5 initWithArray:v6];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v8 = v4;
  uint64_t v27 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v27)
  {
    uint64_t v9 = *(void *)v29;
    v10 = &off_1E6DF2000;
    uint64_t v11 = VUICollectionViewFeaturedView;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        objc_super v14 = [v13 type];
        v15 = [v10[261] episode];

        if (v14 == v15)
        {
          v16 = [v13 seasonIdentifier];
          uint64_t v17 = [(VUIFamilySharingMediaEntitiesDataSource *)self _getGroupingFrom:v7 groupingIdentifier:v16];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (![(VUIFamilySharingMediaEntitiesDataSource *)self _grouping:v17 containsMediaEntity:v13])
            {
              [v17 mediaEntities];
              uint64_t v18 = v9;
              id v19 = v8;
              v20 = v7;
              v22 = uint64_t v21 = self;
              char v23 = (void *)[v22 mutableCopy];

              self = v21;
              uint64_t v7 = v20;
              id v8 = v19;
              uint64_t v9 = v18;
              v10 = &off_1E6DF2000;
              [v23 addObject:v13];
              v24 = (void *)[v23 copy];
              [v17 setMediaEntities:v24];

              goto LABEL_11;
            }
          }
          else
          {
            char v23 = (void *)[objc_alloc(&v11[85]) initWithIdentifier:v16];
            long long v32 = v13;
            v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
            [v23 setMediaEntities:v25];

            [v7 addObject:v23];
LABEL_11:

            uint64_t v11 = VUICollectionViewFeaturedView;
          }

          continue;
        }
      }
      uint64_t v27 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v27);
  }

  v26 = (void *)[v7 copy];
  [(VUIMediaEntitiesDataSource *)self setGrouping:v26];
}

- (id)_getLimitFromURLRequest
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [(VUIFamilySharingMediaEntitiesDataSource *)self urlRequest];
  id v3 = [v2 URL];

  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v3 resolvingAgainstBaseURL:0];
  [v4 queryItems];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "name", (void)v17);
        int v12 = [v11 isEqualToString:@"limit"];

        if (v12)
        {
          objc_super v14 = [v10 value];
          id v15 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
          v13 = [v15 numberFromString:v14];

          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)_processedEntitiesContainsEntityWithIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(VUIFamilySharingMediaEntitiesDataSource *)self processedEntities];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) identifier];
        char v10 = [v9 isEqual:v4];

        if (v10)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_getEntityInProcessedEntitiesWithIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(VUIFamilySharingMediaEntitiesDataSource *)self processedEntities];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        char v10 = [v9 identifier];
        int v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)_grouping:(id)a3 containsMediaEntity:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = objc_msgSend(a3, "mediaEntities", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        char v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) identifier];
        int v11 = [v5 identifier];
        char v12 = [v10 isEqual:v11];

        if (v12)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)_getGroupingFrom:(id)a3 groupingIdentifier:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        int v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        char v12 = objc_msgSend(v11, "identifier", (void)v15);
        int v13 = [v12 isEqual:v6];

        if (v13)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)_appendNextOffsetToURLRequest
{
  id v3 = [(VUIFamilySharingMediaEntitiesDataSource *)self urlRequest];
  id v9 = [v3 URL];

  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v9 resolvingAgainstBaseURL:0];
  id v5 = [v4 queryItems];
  id v6 = [(VUIFamilySharingMediaEntitiesDataSource *)self _updateOffsetQueryItemForQueryItems:v5];

  [v4 setQueryItems:v6];
  id v7 = [v4 URL];
  id v8 = [MEMORY[0x1E4F290D0] requestWithURL:v7];
  [(VUIFamilySharingMediaEntitiesDataSource *)self setUrlRequest:v8];
}

- (id)_updateOffsetQueryItemForQueryItems:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        char v12 = objc_msgSend(v11, "name", (void)v20);
        char v13 = [v12 isEqualToString:@"offset"];

        if ((v13 & 1) == 0) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  id v14 = objc_alloc(MEMORY[0x1E4F290C8]);
  long long v15 = [(VUIFamilySharingMediaEntitiesDataSource *)self responseMetadata];
  long long v16 = [v15 offset];
  long long v17 = (void *)[v14 initWithName:@"offset" value:v16];

  [v5 addObject:v17];
  long long v18 = (void *)[v5 copy];

  return v18;
}

- (BOOL)_hasNextBatch
{
  v2 = [(VUIFamilySharingMediaEntitiesDataSource *)self responseMetadata];
  id v3 = [v2 offset];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)_limitEntitiesReturnedIfNecessary
{
  uint64_t v3 = [(VUIFamilySharingMediaEntitiesDataSource *)self resultLimit];
  if (v3)
  {
    BOOL v4 = (void *)v3;
    id v5 = [(VUIMediaEntitiesDataSource *)self mediaEntities];
    unint64_t v6 = [v5 count];
    uint64_t v7 = [(VUIFamilySharingMediaEntitiesDataSource *)self resultLimit];
    unint64_t v8 = [v7 unsignedIntegerValue];

    if (v6 > v8)
    {
      uint64_t v9 = [(VUIMediaEntitiesDataSource *)self mediaEntities];
      char v10 = [(VUIFamilySharingMediaEntitiesDataSource *)self resultLimit];
      objc_msgSend(v9, "subarrayWithRange:", 0, (int)objc_msgSend(v10, "intValue"));
      id v12 = (id)objc_claimAutoreleasedReturnValue();

      int v11 = (void *)[v12 copy];
      [(VUIMediaEntitiesDataSource *)self setMediaEntities:v11];
    }
  }
}

- (void)_orderSeasonsBySeasonNumber
{
  uint64_t v3 = [(VUIFamilySharingMediaEntitiesDataSource *)self processedEntities];
  id v5 = (id)[v3 mutableCopy];

  [v5 sortUsingComparator:&__block_literal_global_109];
  BOOL v4 = (void *)[v5 mutableCopy];
  [(VUIFamilySharingMediaEntitiesDataSource *)self setProcessedEntities:v4];
}

uint64_t __70__VUIFamilySharingMediaEntitiesDataSource__orderSeasonsBySeasonNumber__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 seasonNumber];
  unint64_t v6 = [v4 seasonNumber];

  if (v5)
  {
    if (v6) {
      uint64_t v7 = [v5 compare:v6];
    }
    else {
      uint64_t v7 = -1;
    }
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

- (void)_orderEpisodesInGroupings
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(VUIFamilySharingMediaEntitiesDataSource *)self _episodeOrderingComparator];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(VUIMediaEntitiesDataSource *)self grouping];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        char v10 = [v9 mediaEntities];
        int v11 = (void *)[v10 mutableCopy];

        [v11 sortUsingComparator:v3];
        id v12 = (void *)[v11 copy];
        [v9 setMediaEntities:v12];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)_orderEpisodesIfNecessary
{
  if ([(VUIFamilySharingMediaEntitiesDataSource *)self orderEpisodesByEpisodeNumber])
  {
    id v6 = [(VUIFamilySharingMediaEntitiesDataSource *)self _episodeOrderingComparator];
    uint64_t v3 = [(VUIMediaEntitiesDataSource *)self mediaEntities];
    id v4 = (void *)[v3 mutableCopy];

    [v4 sortUsingComparator:v6];
    uint64_t v5 = (void *)[v4 copy];
    [(VUIMediaEntitiesDataSource *)self setMediaEntities:v5];
  }
}

- (id)_episodeOrderingComparator
{
  return &__block_literal_global_25_0;
}

uint64_t __69__VUIFamilySharingMediaEntitiesDataSource__episodeOrderingComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 episodeNumber];
  id v6 = [v4 episodeNumber];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)_filterEntitiesBySeasonIdentifierIfNecessary
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(VUIFamilySharingMediaEntitiesDataSource *)self seasonIdentifierFilter];

  if (v3)
  {
    id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v4 = [(VUIMediaEntitiesDataSource *)self mediaEntities];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v26;
      unint64_t v8 = &unk_1EBF73000;
      do
      {
        uint64_t v9 = 0;
        uint64_t v23 = v6;
        do
        {
          if (*(void *)v26 != v7) {
            objc_enumerationMutation(v4);
          }
          char v10 = *(void **)(*((void *)&v25 + 1) + 8 * v9);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int v11 = [v10 amsSeasonIdentifier];
            id v12 = [(VUIFamilySharingMediaEntitiesDataSource *)self seasonIdentifierFilter];
            int v13 = [v11 isEqualToString:v12];

            if (v13) {
              [v24 addObject:v10];
            }
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v14 = v7;
              long long v15 = v8;
              long long v16 = v4;
              long long v17 = [v10 relationships];
              uint64_t v18 = [v17 season];

              if (v18)
              {
                uint64_t v19 = [v18 identifier];
                long long v20 = [(VUIFamilySharingMediaEntitiesDataSource *)self seasonIdentifierFilter];
                int v21 = [v19 isEqualToString:v20];

                if (v21) {
                  [v24 addObject:v10];
                }
              }

              id v4 = v16;
              unint64_t v8 = v15;
              uint64_t v7 = v14;
              uint64_t v6 = v23;
            }
          }
          ++v9;
        }
        while (v6 != v9);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v6);
    }

    long long v22 = (void *)[v24 copy];
    [(VUIMediaEntitiesDataSource *)self setMediaEntities:v22];
  }
}

- (void)_filterGroupingsBySeasonIdentifierIfNecessary
{
  v2 = self;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(VUIFamilySharingMediaEntitiesDataSource *)self seasonIdentifierFilter];

  if (v3)
  {
    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v4 = [(VUIMediaEntitiesDataSource *)v2 grouping];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v24;
      do
      {
        uint64_t v8 = 0;
        uint64_t v22 = v6;
        do
        {
          if (*(void *)v24 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v23 + 1) + 8 * v8);
          char v10 = [v9 mediaEntities];
          int v11 = [v10 firstObject];

          if (v11)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v12 = [v11 relationships];
              int v13 = [v12 season];

              if (v13)
              {
                uint64_t v14 = [v13 identifier];
                [(VUIFamilySharingMediaEntitiesDataSource *)v2 seasonIdentifierFilter];
                uint64_t v15 = v7;
                long long v16 = v4;
                v18 = long long v17 = v2;
                int v19 = [v14 isEqualToString:v18];

                v2 = v17;
                id v4 = v16;
                uint64_t v7 = v15;
                uint64_t v6 = v22;

                if (v19) {
                  [v21 addObject:v9];
                }
              }
            }
          }

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v6);
    }

    long long v20 = (void *)[v21 copy];
    [(VUIMediaEntitiesDataSource *)v2 setGrouping:v20];
  }
}

- (void)_applyContentRestrictionsFilter
{
  uint64_t v3 = [(VUIMediaEntitiesDataSource *)self mediaEntities];
  id v4 = [(VUIFamilySharingMediaEntitiesDataSource *)self _applyContentRestrictionsFilterToMediaEntities:v3];
  [(VUIMediaEntitiesDataSource *)self setMediaEntities:v4];

  [(VUIFamilySharingMediaEntitiesDataSource *)self _applyContentRestrictionsFilterToGroupings];
}

- (id)_applyContentRestrictionsFilterToMediaEntities:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28F60];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __90__VUIFamilySharingMediaEntitiesDataSource__applyContentRestrictionsFilterToMediaEntities___block_invoke;
  v10[3] = &unk_1E6DFA098;
  v10[4] = self;
  id v4 = a3;
  uint64_t v5 = [v3 predicateWithBlock:v10];
  uint64_t v6 = (void *)[v4 mutableCopy];

  uint64_t v7 = [v6 filteredArrayUsingPredicate:v5];
  uint64_t v8 = (void *)[v7 copy];

  return v8;
}

uint64_t __90__VUIFamilySharingMediaEntitiesDataSource__applyContentRestrictionsFilterToMediaEntities___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _isAllowedToShowMediaItem:a2];
}

- (void)_applyContentRestrictionsFilterToGroupings
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(VUIMediaEntitiesDataSource *)self grouping];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        char v10 = [v9 mediaEntities];
        int v11 = [(VUIFamilySharingMediaEntitiesDataSource *)self _applyContentRestrictionsFilterToMediaEntities:v10];

        if ([v11 count])
        {
          [v9 setMediaEntities:v11];
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  id v12 = (void *)[v3 copy];
  [(VUIMediaEntitiesDataSource *)self setGrouping:v12];
}

- (BOOL)_isAllowedToShowMediaItem:(id)a3
{
  id v3 = a3;
  id v4 = [v3 contentRating];
  unint64_t v5 = [v4 rank];
  uint64_t v6 = [v3 type];
  uint64_t v7 = +[VUIMediaEntityType movie];

  if (v6 == v7)
  {
    uint64_t v18 = VUIDefaultLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[VUIFamilySharingMediaEntitiesDataSource _isAllowedToShowMediaItem:](v18);
    }

    int v19 = +[VUISettingsManager sharedInstance];
    uint64_t v20 = [v19 maxMovieRank];
    goto LABEL_14;
  }
  uint64_t v8 = [v3 type];
  uint64_t v9 = +[VUIMediaEntityType episode];
  char v10 = v8;
  if (v8 != (void *)v9)
  {
    int v11 = (void *)v9;
    id v12 = [v3 type];
    uint64_t v13 = +[VUIMediaEntityType show];
    if (v12 != (void *)v13)
    {
      long long v14 = (void *)v13;
      long long v15 = [v3 type];
      long long v16 = +[VUIMediaEntityType season];

      if (v15 != v16)
      {
        long long v17 = 0;
        goto LABEL_15;
      }
      goto LABEL_11;
    }

    char v10 = v11;
  }

LABEL_11:
  id v21 = VUIDefaultLogObject();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    -[VUIFamilySharingMediaEntitiesDataSource _isAllowedToShowMediaItem:](v21);
  }

  int v19 = +[VUISettingsManager sharedInstance];
  uint64_t v20 = [v19 maxTVShowRank];
LABEL_14:
  long long v17 = (void *)v20;

LABEL_15:
  unint64_t v22 = [v17 unsignedIntegerValue];
  if (v17) {
    BOOL v23 = v5 == 0;
  }
  else {
    BOOL v23 = 1;
  }
  BOOL v25 = v23 || v22 >= v5;

  return v25;
}

- (NSNumber)resultLimit
{
  return self->_resultLimit;
}

- (void)setResultLimit:(id)a3
{
}

- (BOOL)shouldCoalesceEpisodesToShows
{
  return self->_shouldCoalesceEpisodesToShows;
}

- (void)setShouldCoalesceEpisodesToShows:(BOOL)a3
{
  self->_shouldCoalesceEpisodesToShows = a3;
}

- (BOOL)shouldCoalesceEpisodesToSeasons
{
  return self->_shouldCoalesceEpisodesToSeasons;
}

- (BOOL)shouldGroupBySeason
{
  return self->_shouldGroupBySeason;
}

- (BOOL)orderEpisodesByEpisodeNumber
{
  return self->_orderEpisodesByEpisodeNumber;
}

- (void)setOrderEpisodesByEpisodeNumber:(BOOL)a3
{
  self->_orderEpisodesByEpisodeNumber = a3;
}

- (NSString)seasonIdentifierFilter
{
  return self->_seasonIdentifierFilter;
}

- (void)setSeasonIdentifierFilter:(id)a3
{
}

- (VUIMediaAPIClient)mediaClient
{
  return self->_mediaClient;
}

- (void)setMediaClient:(id)a3
{
}

- (NSURLRequest)urlRequest
{
  return self->_urlRequest;
}

- (void)setUrlRequest:(id)a3
{
}

- (VUIMediaAPIResponseMetadata)responseMetadata
{
  return self->_responseMetadata;
}

- (void)setResponseMetadata:(id)a3
{
}

- (NSNumber)desiredBatchSize
{
  return self->_desiredBatchSize;
}

- (void)setDesiredBatchSize:(id)a3
{
}

- (NSMutableArray)processedEntities
{
  return self->_processedEntities;
}

- (void)setProcessedEntities:(id)a3
{
}

- (BOOL)loadingNextBatch
{
  return self->_loadingNextBatch;
}

- (void)setLoadingNextBatch:(BOOL)a3
{
  self->_loadingNextBatch = a3;
}

- (BOOL)fetchAllEntities
{
  return self->_fetchAllEntities;
}

- (void)setFetchAllEntities:(BOOL)a3
{
  self->_fetchAllEntities = a3;
}

- (unint64_t)numberOfEntitiesProcessedInBatch
{
  return self->_numberOfEntitiesProcessedInBatch;
}

- (void)setNumberOfEntitiesProcessedInBatch:(unint64_t)a3
{
  self->_numberOfEntitiesProcessedInBatch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processedEntities, 0);
  objc_storeStrong((id *)&self->_desiredBatchSize, 0);
  objc_storeStrong((id *)&self->_responseMetadata, 0);
  objc_storeStrong((id *)&self->_urlRequest, 0);
  objc_storeStrong((id *)&self->_mediaClient, 0);
  objc_storeStrong((id *)&self->_seasonIdentifierFilter, 0);
  objc_storeStrong((id *)&self->_resultLimit, 0);
}

- (void)_isAllowedToShowMediaItem:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "VUIFamilySharingMediaEntitiesDataSource::looking up movie restriction ranking from settings", v1, 2u);
}

- (void)_isAllowedToShowMediaItem:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "VUIFamilySharingMediaEntitiesDataSource::looking up tv show restriction ranking from settings", v1, 2u);
}

@end