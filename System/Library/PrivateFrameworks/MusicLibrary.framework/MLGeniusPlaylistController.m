@interface MLGeniusPlaylistController
+ (BOOL)hasGeniusDataAvailable;
+ (BOOL)hasGeniusFeatureEnabled;
+ (BOOL)useFakeGeniusData;
+ (id)geniusTracksForSeedTrack:(id)a3 error:(id *)a4;
+ (id)playlistControllerWithSeedTracks:(id)a3 error:(id *)a4;
+ (unint64_t)defaultMinTrackCount;
+ (unint64_t)defaultTrackCount;
+ (void)ignoreUnusedWarnings;
+ (void)populateContainer:(id)a3 withSeedTrack:(id)a4 completionBlock:(id)a5;
- (BOOL)_canIncludeTrackInGeniusContainer:(id)a3;
- (BOOL)_createClusterPlaylistWithSeedTracks:(id)a3 error:(id *)a4;
- (BOOL)_onBackgroundQueue_fakePopulateContainer:(id)a3 withSeedTrack:(id)a4 error:(id *)a5;
- (BOOL)_onBackgroundQueue_populateContainer:(id)a3 seedTrack:(id)a4 error:(id *)a5;
- (MLGeniusPlaylistController)init;
- (id)_debugGetTracksStartingAtTrackWithPersistentID:(unint64_t)a3 maxTracks:(unint64_t)a4 stride:(int)a5;
- (id)_onBackgroundQueue_tracksFromClusterForPlaylistItemMax:(unint64_t)a3 error:(id *)a4;
- (id)_sharedBlobMutableData;
- (id)tracksFromClusterForCount:(unint64_t)a3 error:(id *)a4;
- (void)dealloc;
@end

@implementation MLGeniusPlaylistController

- (void).cxx_destruct
{
}

- (id)_onBackgroundQueue_tracksFromClusterForPlaylistItemMax:(unint64_t)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self->_echo_cluster_playlist)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *(void *)&long long v7 = 134217984;
    long long v20 = v7;
    while (1)
    {
      if (objc_msgSend(v6, "count", v20) >= a3) {
        goto LABEL_22;
      }
      v8 = (void *)MEMORY[0x1B3E93C70]();
      uint64_t track = echo_playlist_next_track((uint64_t)self->_echo_cluster_playlist);
      uint64_t v10 = track;
      if (track) {
        break;
      }
      int v12 = 4;
LABEL_14:
      if (v12 == 4) {
        goto LABEL_22;
      }
    }
    v11 = trackWithGlobalID(track, 1);
    if (v11)
    {
      if ([(MLGeniusPlaylistController *)self _canIncludeTrackInGeniusContainer:v11])
      {
        [v6 addObject:v11];
        int v12 = 0;
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {
      v13 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v20;
        uint64_t v22 = v10;
        _os_log_impl(&dword_1B022D000, v13, OS_LOG_TYPE_DEBUG, "Note: Could not locate track with globalID = %llu", buf, 0xCu);
      }
    }
    int v12 = 3;
    goto LABEL_13;
  }
  v15 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B022D000, v15, OS_LOG_TYPE_DEFAULT, "ERROR: Could not generate playlist tracks, no active cluster playlist.", buf, 2u);
  }

  if (a4 && !*a4)
  {
    MLCreateError_TooFewItemsReason(0);
    id v6 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = 0;
  }
LABEL_22:
  sharedBlobMutableData = self->_sharedBlobMutableData;
  p_sharedBlobMutableData = &self->_sharedBlobMutableData;
  *p_sharedBlobMutableData = 0;

  v18 = *p_sharedBlobMutableData;
  *p_sharedBlobMutableData = 0;

  return v6;
}

- (BOOL)_createClusterPlaylistWithSeedTracks:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__12527;
  long long v20 = __Block_byref_object_dispose__12528;
  id v21 = 0;
  long long v7 = +[MLITDBGeniusDatabase sharedGeniusDatabase];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__MLGeniusPlaylistController__createClusterPlaylistWithSeedTracks_error___block_invoke;
  v12[3] = &unk_1E5FB57C0;
  id v8 = v6;
  id v13 = v8;
  v14 = self;
  v15 = &v16;
  [v7 performGeniusDatabaseReadWithBlock:v12];

  if (a4 && !*a4) {
    *a4 = (id) v17[5];
  }
  sharedBlobMutableData = self->_sharedBlobMutableData;
  self->_sharedBlobMutableData = 0;

  BOOL v10 = self->_echo_cluster_playlist != 0;
  _Block_object_dispose(&v16, 8);

  return v10;
}

void __73__MLGeniusPlaylistController__createClusterPlaylistWithSeedTracks_error___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v2 = [*(id *)(a1 + 32) count];
    v3 = malloc_type_malloc(8 * [*(id *)(a1 + 32) count], 0x100004000313F17uLL);
    if (v2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        v5 = [*(id *)(a1 + 32) objectAtIndex:i];
        id v6 = [v5 valueForProperty:@"item_extra.genius_id"];
        v3[i] = [v6 unsignedLongLongValue];
      }
    }
    long long v7 = *(_echo_context **)(*(void *)(a1 + 40) + 8);
    unsigned int v8 = [*(id *)(a1 + 32) count];
    if (v7) {
      BOOL v9 = v3 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9 || v8 == 0)
    {
      free(v3);
    }
    else
    {
      if (v8 != 1)
      {
        __p = 0;
        v29 = 0;
        unint64_t v30 = 0;
        uint64_t v12 = v8;
        std::vector<unsigned long long>::reserve(&__p, v8);
        uint64_t v13 = 0;
        v15 = v29;
        unint64_t v14 = v30;
        uint64_t v16 = (char *)__p;
        while (1)
        {
          if ((unint64_t)v15 >= v14)
          {
            uint64_t v17 = (v15 - v16) >> 3;
            unint64_t v18 = v17 + 1;
            if ((unint64_t)(v17 + 1) >> 61)
            {
              __p = v16;
              std::vector<long long>::__throw_length_error[abi:ne180100]();
            }
            if ((uint64_t)(v14 - (void)v16) >> 2 > v18) {
              unint64_t v18 = (uint64_t)(v14 - (void)v16) >> 2;
            }
            if (v14 - (unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v19 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v19 = v18;
            }
            if (v19) {
              unint64_t v19 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<long long>>(v19);
            }
            else {
              uint64_t v20 = 0;
            }
            id v21 = (char *)(v19 + 8 * v17);
            *(void *)id v21 = v3[v13];
            uint64_t v22 = v21 + 8;
            while (v15 != v16)
            {
              uint64_t v23 = *((void *)v15 - 1);
              v15 -= 8;
              *((void *)v21 - 1) = v23;
              v21 -= 8;
            }
            unint64_t v14 = v19 + 8 * v20;
            if (v16) {
              operator delete(v16);
            }
            uint64_t v16 = v21;
            v15 = v22;
          }
          else
          {
            *(void *)v15 = v3[v13];
            v15 += 8;
          }
          if (++v13 == v12)
          {
            __p = v16;
            operator new();
          }
        }
      }
      uint64_t v11 = _echo_context::initialize_playlist(v7, *v3);
      free(v3);
      if (v11)
      {
        *(void *)(*(void *)(a1 + 40) + 24) = v11;
        return;
      }
    }
    v24 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(__p) = 0;
      _os_log_impl(&dword_1B022D000, v24, OS_LOG_TYPE_DEFAULT, "NOTE: Could not create cluster playlist", (uint8_t *)&__p, 2u);
    }

    uint64_t v25 = MLCreateError_TooFewItemsReason(0);
    uint64_t v26 = *(void *)(*(void *)(a1 + 48) + 8);
    v27 = *(void **)(v26 + 40);
    *(void *)(v26 + 40) = v25;
  }
}

- (BOOL)_onBackgroundQueue_populateContainer:(id)a3 seedTrack:(id)a4 error:(id *)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v9 = a4;
  BOOL v10 = +[MLITDBGeniusDatabase sharedGeniusDatabase];
  unint64_t v11 = [v10 defaultMinTrackCount];

  uint64_t v12 = +[MLITDBGeniusDatabase sharedGeniusDatabase];
  uint64_t v13 = [v12 defaultTrackCount];

  unint64_t v14 = [v9 valueForProperty:@"item_extra.genius_id"];
  uint64_t v15 = [v14 unsignedLongLongValue];

  if (v15)
  {
    uint64_t v16 = [v29 library];
    uint64_t v17 = [v9 library];

    if (v16 != v17)
    {
      v28 = [MEMORY[0x1E4F28B00] currentHandler];
      [v28 handleFailureInMethod:a2 object:self file:@"MLGeniusPlaylistController.m" lineNumber:571 description:&stru_1F08D4D70];
    }
    uint64_t v45 = 0;
    v46 = &v45;
    uint64_t v47 = 0x2020000000;
    uint64_t v48 = 0;
    *(void *)v39 = 0;
    v40 = v39;
    uint64_t v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__12527;
    v43 = __Block_byref_object_dispose__12528;
    id v44 = 0;
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unint64_t v19 = +[MLITDBGeniusDatabase sharedGeniusDatabase];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __83__MLGeniusPlaylistController__onBackgroundQueue_populateContainer_seedTrack_error___block_invoke;
    v33[3] = &unk_1E5FB5798;
    v35 = &v45;
    v33[4] = self;
    v36 = v39;
    uint64_t v37 = v15;
    id v20 = v18;
    id v34 = v20;
    uint64_t v38 = v13;
    [v19 performGeniusDatabaseReadWithBlock:v33];

    if (a5 && !*a5) {
      *a5 = *((id *)v40 + 5);
    }
    if (v46[3])
    {
      unint64_t v21 = [v20 count];
      if (v21 && ([v20 replaceObjectAtIndex:0 withObject:v9], v21 >= v11))
      {
        uint64_t v25 = [v9 valueForProperty:@"ROWID"];
        [v29 setValue:v25 forProperty:@"container_seed.item_pid"];

        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __83__MLGeniusPlaylistController__onBackgroundQueue_populateContainer_seedTrack_error___block_invoke_105;
        v30[3] = &unk_1E5FB58B8;
        id v31 = v29;
        id v32 = v20;
        [v16 performDatabaseTransactionWithBlock:v30];

        BOOL v22 = 1;
      }
      else
      {
        BOOL v22 = 0;
        if (a5 && !*a5 && v21 < v11)
        {
          uint64_t v23 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218240;
            unint64_t v50 = v11;
            __int16 v51 = 2048;
            unint64_t v52 = v21;
            _os_log_impl(&dword_1B022D000, v23, OS_LOG_TYPE_DEFAULT, "NOTE: Could not create playlist, too few results (min=%ld, found=%ld)", buf, 0x16u);
          }

          MLCreateError_TooFewItemsReason(v21);
          BOOL v22 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      echo_playlist_close(v46[3]);
      v46[3] = 0;
      sharedBlobMutableData = self->_sharedBlobMutableData;
      self->_sharedBlobMutableData = 0;
    }
    else
    {
      BOOL v22 = 0;
    }

    _Block_object_dispose(v39, 8);
    _Block_object_dispose(&v45, 8);
  }
  else
  {
    v24 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v39 = 0;
      _os_log_impl(&dword_1B022D000, v24, OS_LOG_TYPE_DEFAULT, "NOTE: Could not create playlist, seedTrackGlobalID == 0.", v39, 2u);
    }

    if (a5 && !*a5)
    {
      MLCreateError_TooFewItemsReason(0);
      BOOL v22 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v22 = 0;
    }
  }

  return v22;
}

void __83__MLGeniusPlaylistController__onBackgroundQueue_populateContainer_seedTrack_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = *(_echo_context **)(*(void *)(a1 + 32) + 8);
  if (v4) {
    v4 = (_echo_context *)_echo_context::initialize_playlist(v4, *(void *)(a1 + 64));
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    if ((unint64_t)[*(id *)(a1 + 40) count] < *(void *)(a1 + 72))
    {
      while (1)
      {
        v5 = (void *)MEMORY[0x1B3E93C70]();
        uint64_t track = echo_playlist_next_track(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
        if (!track) {
          break;
        }
        uint64_t v7 = track;
        unsigned int v8 = trackWithGlobalID(track, 1);
        if (v8)
        {
          if ([*(id *)(a1 + 32) _canIncludeTrackInGeniusContainer:v8]) {
            [*(id *)(a1 + 40) addObject:v8];
          }
        }
        else
        {
          id v9 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v15 = v7;
            _os_log_impl(&dword_1B022D000, v9, OS_LOG_TYPE_DEBUG, "Note: Could not locate track with globalID = %llu", buf, 0xCu);
          }
        }
        if ((unint64_t)[*(id *)(a1 + 40) count] >= *(void *)(a1 + 72)) {
          goto LABEL_18;
        }
      }
    }
  }
  else
  {
    BOOL v10 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_DEFAULT, "NOTE: Could not create playlist, seedTrackGlobalID == 0.", buf, 2u);
    }

    uint64_t v11 = MLCreateError_TooFewItemsReason(0);
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
LABEL_18:
}

uint64_t __83__MLGeniusPlaylistController__onBackgroundQueue_populateContainer_seedTrack_error___block_invoke_105(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) removeAllTracks];
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = *(id *)(a1 + 40);
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
        unsigned int v8 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v7), "persistentID", (void)v10));
        [v2 addObject:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [*(id *)(a1 + 32) appendTracksWithPersistentIDs:v2 notify:1];
  return 1;
}

- (BOOL)_onBackgroundQueue_fakePopulateContainer:(id)a3 withSeedTrack:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  long long v10 = +[MLITDBGeniusDatabase sharedGeniusDatabase];
  unint64_t v11 = [v10 defaultMinTrackCount];

  long long v12 = +[MLITDBGeniusDatabase sharedGeniusDatabase];
  uint64_t v13 = [v12 defaultTrackCount];

  uint64_t v14 = (_onBackgroundQueue_fakePopulateContainer_withSeedTrack_error__gStride & 1u) + 1;
  uint64_t v15 = [v9 persistentID];
  uint64_t v16 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B022D000, v16, OS_LOG_TYPE_DEFAULT, "NOTE: Fake echo data being used, ignoring genius database", buf, 2u);
  }

  uint64_t v17 = [v8 library];
  id v18 = [v9 library];

  if (v17 != v18)
  {
    uint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2 object:self file:@"MLGeniusPlaylistController.m" lineNumber:521 description:&stru_1F08D4D70];
  }
  unint64_t v19 = [(MLGeniusPlaylistController *)self _debugGetTracksStartingAtTrackWithPersistentID:v15 maxTracks:v13 stride:v14];
  id v20 = (void *)[v19 mutableCopy];

  unint64_t v21 = [v20 count];
  if (v21) {
    BOOL v22 = v21 >= v11;
  }
  else {
    BOOL v22 = 0;
  }
  char v23 = !v22;
  if (v22)
  {
    v24 = [v9 valueForProperty:@"ROWID"];
    [v8 setValue:v24 forProperty:@"container_seed.item_pid"];

    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __91__MLGeniusPlaylistController__onBackgroundQueue_fakePopulateContainer_withSeedTrack_error___block_invoke;
    v28[3] = &unk_1E5FB58B8;
    id v29 = v8;
    id v30 = v20;
    [v17 performDatabaseTransactionWithBlock:v28];
  }
  else if (a5 && !*a5 && v21 < v11)
  {
    MLCreateError_TooFewItemsReason(v21);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  ++_onBackgroundQueue_fakePopulateContainer_withSeedTrack_error__gStride;

  return v23 ^ 1;
}

uint64_t __91__MLGeniusPlaylistController__onBackgroundQueue_fakePopulateContainer_withSeedTrack_error___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) removeAllTracks];
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = *(id *)(a1 + 40);
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
        id v8 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v7), "persistentID", (void)v10));
        [v2 addObject:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [*(id *)(a1 + 32) appendTracksWithPersistentIDs:v2 notify:1];
  return 1;
}

- (id)_debugGetTracksStartingAtTrackWithPersistentID:(unint64_t)a3 maxTracks:(unint64_t)a4 stride:(int)a5
{
  if (a4)
  {
    id v8 = [MEMORY[0x1E4F1CA48] array];
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x2020000000;
    if (a5 <= 1) {
      int v9 = 1;
    }
    else {
      int v9 = a5;
    }
    int v33 = v9;
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    char v31 = 0;
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    int v29 = 0;
    long long v10 = +[MLITDBGeniusDatabase sharedGeniusDatabase];
    long long v11 = [v10 musicLibrary];

    long long v12 = +[ML3BitMaskPredicate predicateWithProperty:@"media_type" mask:8 value:8];
    long long v13 = +[ML3Track defaultOrderingTerms];
    uint64_t v14 = +[ML3Entity queryWithLibrary:v11 predicate:v12 orderingTerms:v13];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __94__MLGeniusPlaylistController__debugGetTracksStartingAtTrackWithPersistentID_maxTracks_stride___block_invoke;
    v20[3] = &unk_1E5FB5770;
    id v15 = v11;
    id v21 = v15;
    char v23 = v30;
    v24 = v28;
    uint64_t v25 = v32;
    unint64_t v26 = a3;
    id v16 = v8;
    id v22 = v16;
    unint64_t v27 = a4;
    [v14 enumeratePersistentIDsUsingBlock:v20];
    uint64_t v17 = v22;
    id v18 = v16;

    _Block_object_dispose(v28, 8);
    _Block_object_dispose(v30, 8);
    _Block_object_dispose(v32, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1C978], "array", a3, 0, *(void *)&a5);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

void __94__MLGeniusPlaylistController__debugGetTracksStartingAtTrackWithPersistentID_maxTracks_stride___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = [(ML3Entity *)[ML3Track alloc] initWithPersistentID:a2 inLibrary:*(void *)(a1 + 32)];
  if ([(ML3Entity *)v7 persistentID] == *(void *)(a1 + 72))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  --*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    if (*(int *)(v6 + 24) <= 0)
    {
      *(_DWORD *)(v6 + 24) = *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      [*(id *)(a1 + 40) addObject:v7];
      if ((unint64_t)[*(id *)(a1 + 40) count] >= *(void *)(a1 + 80)) {
        *a4 = 1;
      }
    }
  }
}

- (BOOL)_canIncludeTrackInGeniusContainer:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 valueForProperty:@"item_video.is_rental"];
  uint64_t v5 = [NSNumber numberWithInt:0];
  LOBYTE(v6) = 0;
  if ([v4 isEqual:v5])
  {
    uint64_t v7 = [v3 valueForProperty:@"item_stats.hidden"];
    if ([v7 BOOLValue])
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      id v8 = [v3 valueForProperty:@"ML3IsCurrentlyRestrictedMedia(item.media_type, item_extra.content_rating, item_extra.content_rating_level, (SELECT value FROM _MLDatabaseProperties WHERE key='MPExplicitContentAllowedBoolean'))"];
      int v6 = [v8 BOOLValue] ^ 1;
    }
  }

  return v6;
}

- (id)_sharedBlobMutableData
{
  sharedBlobMutableData = self->_sharedBlobMutableData;
  if (!sharedBlobMutableData)
  {
    uint64_t v4 = (NSMutableData *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:0];
    uint64_t v5 = self->_sharedBlobMutableData;
    self->_sharedBlobMutableData = v4;

    sharedBlobMutableData = self->_sharedBlobMutableData;
  }

  return sharedBlobMutableData;
}

- (id)tracksFromClusterForCount:(unint64_t)a3 error:(id *)a4
{
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  unint64_t v26 = __Block_byref_object_copy__12527;
  unint64_t v27 = __Block_byref_object_dispose__12528;
  id v28 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__12527;
  id v21 = __Block_byref_object_dispose__12528;
  id v22 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  id v8 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__MLGeniusPlaylistController_tracksFromClusterForCount_error___block_invoke;
  block[3] = &unk_1E5FB5740;
  uint64_t v14 = &v17;
  id v15 = &v23;
  block[4] = self;
  unint64_t v16 = a3;
  int v9 = v7;
  long long v13 = v9;
  dispatch_async(v8, block);

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  if (a4) {
    *a4 = (id) v24[5];
  }
  id v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v10;
}

intptr_t __62__MLGeniusPlaylistController_tracksFromClusterForCount_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = objc_msgSend(v2, "_onBackgroundQueue_tracksFromClusterForPlaylistItemMax:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_semaphore_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (![*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count]
    && !*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    uint64_t v8 = MLCreateError_UnknownReason();
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)dealloc
{
  echo_cluster_playlist = self->_echo_cluster_playlist;
  if (echo_cluster_playlist) {
    echo_playlist_close((uint64_t)echo_cluster_playlist);
  }
  echo = self->_echo;
  if (echo)
  {
    uint64_t v5 = (FILE *)echo[2];
    if (v5) {
      fprintf(v5, "sim fetches = %lu, successful sim fetches = %lu, metadata fetches = %lu, successful metadata fetches = %lu\n", echo[3], echo[4], echo[5], echo[6]);
    }
    uint64_t v6 = echo[9] - echo[8];
    if (v6)
    {
      uint64_t v7 = 0;
      unint64_t v8 = v6 >> 3;
      if (v8 <= 1) {
        uint64_t v9 = 1;
      }
      else {
        uint64_t v9 = v8;
      }
      do
      {
        uint64_t v10 = *(void *)(echo[8] + 8 * v7);
        if (v10) {
          (*(void (**)(uint64_t, SEL))(*(void *)v10 + 8))(v10, a2);
        }
        ++v7;
      }
      while (v9 != v7);
    }
    uint64_t v11 = echo[7];
    if (v11)
    {
      long long v12 = *(void **)(v11 + 16);
      if (!v12) {
        goto LABEL_19;
      }
      do
      {
        uint64_t v13 = v12[3];
        if (v13) {
          (*(void (**)(uint64_t, SEL))(*(void *)v13 + 8))(v13, a2);
        }
        long long v12 = (void *)*v12;
      }
      while (v12);
      uint64_t v11 = echo[7];
      if (v11)
      {
LABEL_19:
        uint64_t v14 = std::__hash_table<unsigned long long,echo_hash_shift<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table(v11);
        MEMORY[0x1B3E93610](v14, 0x10A0C408EF24B1CLL);
      }
    }
    id v15 = (void *)echo[8];
    if (v15)
    {
      echo[9] = v15;
      operator delete(v15);
    }
    MEMORY[0x1B3E93610](echo, 0x10A0C4091C5D4D3);
  }
  sharedBlobMutableData = self->_sharedBlobMutableData;
  self->_sharedBlobMutableData = 0;

  v17.receiver = self;
  v17.super_class = (Class)MLGeniusPlaylistController;
  [(MLGeniusPlaylistController *)&v17 dealloc];
}

- (MLGeniusPlaylistController)init
{
  v4.receiver = self;
  v4.super_class = (Class)MLGeniusPlaylistController;
  if ([(MLGeniusPlaylistController *)&v4 init])
  {
    unsigned int v2 = time(0);
    srandom(v2);
    operator new();
  }
  return 0;
}

+ (id)geniusTracksForSeedTrack:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = +[MLITDBGeniusDatabase sharedGeniusDatabase];
  uint64_t v7 = [v6 defaultTrackCount];

  unint64_t v8 = [v5 valueForProperty:@"item_extra.genius_id"];
  uint64_t v9 = [v8 unsignedLongLongValue];

  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__12527;
  v24 = __Block_byref_object_dispose__12528;
  id v25 = 0;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v11 = +[MLITDBGeniusDatabase sharedGeniusDatabase];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__MLGeniusPlaylistController_geniusTracksForSeedTrack_error___block_invoke;
  v14[3] = &unk_1E5FB57E8;
  unint64_t v16 = v26;
  objc_super v17 = &v20;
  uint64_t v18 = v9;
  id v12 = v10;
  id v15 = v12;
  uint64_t v19 = v7;
  [v11 performGeniusDatabaseReadWithBlock:v14];

  if (a4 && !*a4) {
    *a4 = (id) v21[5];
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(v26, 8);

  return v12;
}

void __61__MLGeniusPlaylistController_geniusTracksForSeedTrack_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_super v4 = objc_alloc_init(MLGeniusPlaylistController);
  echo = (_echo_context *)v4->_echo;
  if (echo) {
    echo = (_echo_context *)_echo_context::initialize_playlist(echo, *(void *)(a1 + 56));
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = echo;
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    if ((unint64_t)[*(id *)(a1 + 32) count] < *(void *)(a1 + 64))
    {
      while (1)
      {
        uint64_t v6 = (void *)MEMORY[0x1B3E93C70]();
        uint64_t track = echo_playlist_next_track(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
        if (!track) {
          break;
        }
        uint64_t v8 = track;
        uint64_t v9 = trackWithGlobalID(track, 1);
        if (v9)
        {
          if ([(MLGeniusPlaylistController *)v4 _canIncludeTrackInGeniusContainer:v9])
          {
            [*(id *)(a1 + 32) addObject:v9];
          }
        }
        else
        {
          id v10 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v16 = v8;
            _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_DEBUG, "Note: Could not locate track with globalID = %llu", buf, 0xCu);
          }
        }
        if ((unint64_t)[*(id *)(a1 + 32) count] >= *(void *)(a1 + 64)) {
          goto LABEL_18;
        }
      }
    }
  }
  else
  {
    uint64_t v11 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B022D000, v11, OS_LOG_TYPE_DEFAULT, "NOTE: Could not create playlist, seedTrackGlobalID == 0.", buf, 2u);
    }

    uint64_t v12 = MLCreateError_TooFewItemsReason(0);
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
LABEL_18:
}

+ (id)playlistControllerWithSeedTracks:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = objc_alloc_init(MLGeniusPlaylistController);
  LOBYTE(a4) = [(MLGeniusPlaylistController *)v6 _createClusterPlaylistWithSeedTracks:v5 error:a4];

  if ((a4 & 1) == 0)
  {

    uint64_t v6 = 0;
  }

  return v6;
}

+ (void)populateContainer:(id)a3 withSeedTrack:(id)a4 completionBlock:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __78__MLGeniusPlaylistController_populateContainer_withSeedTrack_completionBlock___block_invoke;
  v19[3] = &unk_1E5FB5718;
  id v10 = v9;
  id v20 = v10;
  uint64_t v11 = (void (**)(void, void, void))MEMORY[0x1B3E93EE0](v19);
  if (v8 && (uint64_t v12 = [v8 persistentID], v7) && v12)
  {
    uint64_t v13 = dispatch_get_global_queue(0, 0);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __78__MLGeniusPlaylistController_populateContainer_withSeedTrack_completionBlock___block_invoke_2;
    v15[3] = &unk_1E5FB7BD8;
    id v16 = v7;
    id v17 = v8;
    uint64_t v18 = v11;
    dispatch_async(v13, v15);

    uint64_t v14 = v16;
  }
  else
  {
    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MLMusicLibraryErrorDomain" code:1 userInfo:0];
    ((void (**)(void, void, void *))v11)[2](v11, 0, v14);
  }
}

uint64_t __78__MLGeniusPlaylistController_populateContainer_withSeedTrack_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __78__MLGeniusPlaylistController_populateContainer_withSeedTrack_completionBlock___block_invoke_2(void *a1)
{
  unsigned int v2 = objc_alloc_init(MLGeniusPlaylistController);
  BOOL v3 = +[MLGeniusPlaylistController useFakeGeniusData];
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  if (v3)
  {
    uint64_t v11 = 0;
    BOOL v6 = [(MLGeniusPlaylistController *)v2 _onBackgroundQueue_fakePopulateContainer:v4 withSeedTrack:v5 error:&v11];
    id v7 = v11;
  }
  else
  {
    id v10 = 0;
    BOOL v6 = [(MLGeniusPlaylistController *)v2 _onBackgroundQueue_populateContainer:v4 seedTrack:v5 error:&v10];
    id v7 = v10;
  }
  id v8 = v7;
  id v9 = v8;
  if (!v6 && !v8)
  {
    id v9 = MLCreateError_UnknownReason();
  }
  (*(void (**)(void))(a1[6] + 16))();
}

+ (unint64_t)defaultMinTrackCount
{
  unsigned int v2 = +[MLITDBGeniusDatabase sharedGeniusDatabase];
  unint64_t v3 = [v2 defaultMinTrackCount];

  return v3;
}

+ (unint64_t)defaultTrackCount
{
  unsigned int v2 = +[MLITDBGeniusDatabase sharedGeniusDatabase];
  unint64_t v3 = [v2 defaultTrackCount];

  return v3;
}

+ (BOOL)hasGeniusDataAvailable
{
  unint64_t v3 = +[MLITDBGeniusDatabase sharedGeniusDatabase];
  if ([v3 hasGeniusDataAvailable]) {
    char v4 = 1;
  }
  else {
    char v4 = [a1 useFakeGeniusData];
  }

  return v4;
}

+ (BOOL)hasGeniusFeatureEnabled
{
  unint64_t v3 = +[MLITDBGeniusDatabase sharedGeniusDatabase];
  if ([v3 hasGeniusFeatureEnabled]) {
    char v4 = 1;
  }
  else {
    char v4 = [a1 useFakeGeniusData];
  }

  return v4;
}

+ (BOOL)useFakeGeniusData
{
  return 0;
}

+ (void)ignoreUnusedWarnings
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  long long v4 = 0u;
  long long v5 = 0u;
  *(_OWORD *)__str = 0u;
  long long v3 = 0u;
  __sprintf_chk(__str, 0, 0x80uLL, "%.16llX", 0);
  [NSString stringWithUTF8String:__str];

  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  long long v4 = 0u;
  long long v5 = 0u;
  *(_OWORD *)__str = 0u;
  long long v3 = 0u;
  [0 getCString:__str maxLength:127 encoding:1];
  strtoull(__str, 0, 16);
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  long long v4 = 0u;
  long long v5 = 0u;
  *(_OWORD *)__str = 0u;
  long long v3 = 0u;
  __sprintf_chk(__str, 0, 0x80uLL, "%llu", 0);
  [NSString stringWithUTF8String:__str];

  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  long long v4 = 0u;
  long long v5 = 0u;
  *(_OWORD *)__str = 0u;
  long long v3 = 0u;
  [0 getCString:__str maxLength:127 encoding:1];
  strtoull(__str, 0, 10);
}

@end