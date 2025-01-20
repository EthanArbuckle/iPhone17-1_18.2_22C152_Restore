@interface VUIPlistMediaEntitiesFetchOperation
- (NSArray)requests;
- (NSArray)responses;
- (NSError)error;
- (VUIPlistMediaEntitiesFetchOperation)init;
- (VUIPlistMediaEntitiesFetchOperation)initWithMediaLibrary:(id)a3 requests:(id)a4;
- (VUIPlistMediaLibrary)mediaLibrary;
- (id)_collectionsFetchResponseWithRequest:(id)a3 error:(id *)a4;
- (id)_fetchResponseWithMediaEntities:(id)a3 request:(id)a4;
- (id)_itemsFetchResponseWithRequest:(id)a3 error:(id *)a4;
- (id)_mediaEntityKindForRequest:(id)a3;
- (void)executionDidBegin;
- (void)setError:(id)a3;
- (void)setMediaLibrary:(id)a3;
- (void)setRequests:(id)a3;
- (void)setResponses:(id)a3;
@end

@implementation VUIPlistMediaEntitiesFetchOperation

- (VUIPlistMediaEntitiesFetchOperation)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VUIPlistMediaEntitiesFetchOperation)initWithMediaLibrary:(id)a3 requests:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"mediaLibrary" format];
    if (v9) {
      goto LABEL_3;
    }
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"requests" format];
LABEL_3:
  v14.receiver = self;
  v14.super_class = (Class)VUIPlistMediaEntitiesFetchOperation;
  v10 = [(VUIPlistMediaEntitiesFetchOperation *)&v14 init];
  if (v10)
  {
    uint64_t v11 = objc_msgSend(v9, "vui_deepCopy");
    requests = v10->_requests;
    v10->_requests = (NSArray *)v11;

    objc_storeStrong((id *)&v10->_mediaLibrary, a3);
  }

  return v10;
}

- (void)executionDidBegin
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v20 = self;
  id obj = [(VUIPlistMediaEntitiesFetchOperation *)self requests];
  uint64_t v4 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v24;
    while (2)
    {
      uint64_t v8 = 0;
      v9 = v6;
      do
      {
        v10 = v3;
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v23 + 1) + 8 * v8);
        v12 = [v11 mediaEntityTypes];
        v13 = [v12 allObjects];
        objc_super v14 = [v13 firstObject];
        uint64_t v15 = [v14 subtype];

        if (v15 == 1)
        {
          v21 = v9;
          v16 = &v21;
          uint64_t v17 = [(VUIPlistMediaEntitiesFetchOperation *)v20 _collectionsFetchResponseWithRequest:v11 error:&v21];
        }
        else
        {
          if (v15)
          {
            id v6 = v9;
            id v3 = v10;
LABEL_16:

            id v3 = 0;
            goto LABEL_17;
          }
          v22 = v9;
          v16 = &v22;
          uint64_t v17 = [(VUIPlistMediaEntitiesFetchOperation *)v20 _itemsFetchResponseWithRequest:v11 error:&v22];
        }
        v18 = (void *)v17;
        id v6 = *v16;

        id v3 = v10;
        if (!v18) {
          goto LABEL_16;
        }
        [v10 addObject:v18];

        ++v8;
        v9 = v6;
      }
      while (v5 != v8);
      uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v6 = 0;
  }
LABEL_17:

  [(VUIPlistMediaEntitiesFetchOperation *)v20 setResponses:v3];
  [(VUIPlistMediaEntitiesFetchOperation *)v20 setError:v6];
  [(VUIAsynchronousOperation *)v20 finishExecutionIfPossible];
}

- (id)_mediaEntityKindForRequest:(id)a3
{
  id v3 = a3;
  if ([v3 _isItemsFetch])
  {
    uint64_t v4 = VUIPlistMediaItemKind();
LABEL_7:
    uint64_t v5 = (void *)v4;
    goto LABEL_8;
  }
  if ([v3 _isShowsFetch])
  {
    uint64_t v4 = VUIPlistShowMediaKind();
    goto LABEL_7;
  }
  if ([v3 _isSeasonsFetch])
  {
    uint64_t v4 = VUIPlistSeasonMediaKind();
    goto LABEL_7;
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Unable to determine the VUIMediaEntityKind to use for this request: %@", v3 format];
  uint64_t v5 = 0;
LABEL_8:

  return v5;
}

- (id)_itemsFetchResponseWithRequest:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v28 = self;
  id v6 = [(VUIPlistMediaEntitiesFetchOperation *)self mediaLibrary];
  uint64_t v7 = [v6 database];
  uint64_t v8 = [v5 mediaEntityTypes];
  v9 = [v8 allObjects];
  uint64_t v10 = [v9 firstObject];

  uint64_t v11 = +[VUIMediaEntityType movie];

  v27 = (void *)v10;
  if ((void *)v10 == v11)
  {
    uint64_t v16 = [v7 movies];
  }
  else
  {
    v12 = +[VUIMediaEntityType movieRental];

    if ((void *)v10 == v12)
    {
      uint64_t v16 = [v7 movieRentals];
    }
    else
    {
      v13 = +[VUIMediaEntityType homeVideo];

      if ((void *)v10 == v13)
      {
        uint64_t v16 = [v7 homeVideos];
      }
      else
      {
        objc_super v14 = +[VUIMediaEntityType episode];

        if ((void *)v10 != v14)
        {
          [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Unexpected media entity type!"];
          uint64_t v15 = 0;
          goto LABEL_11;
        }
        uint64_t v16 = [v7 episodes];
      }
    }
  }
  uint64_t v15 = (void *)v16;
LABEL_11:
  v29 = v7;
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v18 = [v5 properties];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v19 = v15;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(v19);
        }
        long long v24 = [[VUIPlistMediaItem alloc] initWithMediaLibrary:v6 databaseItem:*(void *)(*((void *)&v30 + 1) + 8 * i) requestedProperties:v18];
        [v17 addObject:v24];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v21);
  }

  long long v25 = [(VUIPlistMediaEntitiesFetchOperation *)v28 _fetchResponseWithMediaEntities:v17 request:v5];

  return v25;
}

- (id)_collectionsFetchResponseWithRequest:(id)a3 error:(id *)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(VUIPlistMediaEntitiesFetchOperation *)self mediaLibrary];
  uint64_t v7 = [v6 database];
  uint64_t v8 = [v5 properties];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v10 = [v5 mediaEntityTypes];
  uint64_t v11 = [v10 allObjects];
  v12 = [v11 firstObject];

  v13 = +[VUIMediaEntityType show];

  if (v12 == v13)
  {
    v29 = v12;
    long long v30 = self;
    long long v31 = v7;
    uint64_t v15 = [v7 shows];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v37 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = [[VUIPlistShowMediaCollection alloc] initWithMediaLibrary:v6 databaseShow:*(void *)(*((void *)&v36 + 1) + 8 * i) requestedProperties:v8];
          [v9 addObject:v20];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v17);
    }
  }
  else
  {
    objc_super v14 = +[VUIMediaEntityType season];

    if (v12 != v14)
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Unexpected media entity type!"];
      goto LABEL_20;
    }
    v29 = v12;
    long long v30 = self;
    long long v31 = v7;
    uint64_t v15 = [v7 seasons];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v21 = [v15 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v33 != v23) {
            objc_enumerationMutation(v15);
          }
          long long v25 = [[VUIPlistSeasonMediaCollection alloc] initWithMediaLibrary:v6 databaseSeason:*(void *)(*((void *)&v32 + 1) + 8 * j) requestedProperties:v8];
          [v9 addObject:v25];
        }
        uint64_t v22 = [v15 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v22);
    }
  }

  self = v30;
  uint64_t v7 = v31;
  v12 = v29;
LABEL_20:
  long long v26 = (void *)[v9 copy];
  v27 = [(VUIPlistMediaEntitiesFetchOperation *)self _fetchResponseWithMediaEntities:v26 request:v5];

  return v27;
}

- (id)_fetchResponseWithMediaEntities:(id)a3 request:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 predicate];
  id v9 = v6;
  uint64_t v10 = v9;
  uint64_t v11 = v9;
  if (v8)
  {
    uint64_t v11 = [v9 filteredArrayUsingPredicate:v8];
  }
  long long v33 = v10;
  uint64_t v12 = [(VUIPlistMediaEntitiesFetchOperation *)self _mediaEntityKindForRequest:v7];
  uint64_t v13 = [v7 _manualSortDescriptorsWithMediaEntityKind:v12 propertiesRequiredForSort:0];
  id v14 = v11;
  uint64_t v15 = v14;
  uint64_t v16 = v14;
  if (v13)
  {
    uint64_t v16 = [v14 sortedArrayUsingDescriptors:v13];
  }
  v29 = (void *)v13;
  uint64_t v17 = [v7 _sortIndexPropertyKeyWithMediaEntityKind:v12];
  if (v17)
  {
    uint64_t v27 = +[VUIMediaLibraryUtilities sortIndexesForMediaEntities:v16 sortIndexPropertyKey:v17];
  }
  else
  {
    uint64_t v27 = 0;
  }
  long long v30 = v15;
  long long v31 = (void *)v12;
  uint64_t v18 = objc_msgSend(v7, "groupingKeyPath", v27);
  long long v32 = (void *)v8;
  if (v18)
  {
    id v19 = [v7 groupingSortComparator];
    uint64_t v20 = +[VUIMediaLibraryUtilities groupingForMediaEntities:v16 groupingKeyPath:v18 groupingSortComparator:v19 performDefaultSort:1 sortIndexPropertyKey:v17];

    if ([v7 _shouldGenerateGroupingSortIndexes])
    {
      uint64_t v21 = +[VUIMediaLibraryUtilities sortIndexesForGrouping:v20];
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v20 = 0;
  }
  uint64_t v21 = 0;
LABEL_13:
  uint64_t v22 = objc_alloc_init(VUIMediaEntityFetchResponse);
  uint64_t v23 = [v7 mediaEntityTypes];
  long long v24 = [v23 allObjects];
  long long v25 = [v24 firstObject];
  -[VUIMediaEntityFetchResponse setMediaEntitySubtype:](v22, "setMediaEntitySubtype:", [v25 subtype]);

  [(VUIMediaEntityFetchResponse *)v22 setMediaEntities:v16];
  [(VUIMediaEntityFetchResponse *)v22 setSortIndexes:v28];
  [(VUIMediaEntityFetchResponse *)v22 setGrouping:v20];
  [(VUIMediaEntityFetchResponse *)v22 setGroupingSortIndexes:v21];

  return v22;
}

- (NSArray)requests
{
  return self->_requests;
}

- (void)setRequests:(id)a3
{
}

- (NSArray)responses
{
  return self->_responses;
}

- (void)setResponses:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (VUIPlistMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (void)setMediaLibrary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_responses, 0);
  objc_storeStrong((id *)&self->_requests, 0);
}

@end