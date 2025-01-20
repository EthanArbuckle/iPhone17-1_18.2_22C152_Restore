@interface ICSharedListeningQueue
- (BOOL)hasActiveRadioStation;
- (BOOL)isAutoPlayAvailable;
- (BOOL)isAutoPlayEnabled;
- (ICLiveLink)liveLink;
- (ICSharedListeningQueue)initWithProtobuf:(id)a3 serverQueueContext:(id)a4 liveLink:(id)a5 playbackControlSettings:(id)a6;
- (MSVSectionedCollection)tracklist;
- (NSArray)items;
- (NSString)identifier;
- (NSString)serverQueueContext;
- (_ICLLPlaybackControlSettings)playbackControlSettings;
- (id)_itemForIdentifier:(id)a3 outIndexPath:(id *)a4;
- (id)_playbackItemProtosForTracklist:(id)a3 withPreferredStartItemIndexPath:(id)a4;
- (id)_tracklistForQueueProto:(id)a3;
- (id)containerForIdentifier:(id)a3;
- (id)description;
- (id)itemForIdentifier:(id)a3;
- (int64_t)_afterItemPositionForItemIdentifier:(id)a3;
- (int64_t)explicitContentState;
- (int64_t)serverRevision;
- (void)_detectTrackGenerationSourceForTracklist:(id)a3 detectedCompletion:(id)a4;
- (void)addMediaIdentifiers:(id)a3 afterItemIdentifier:(id)a4;
- (void)getExpectedCurrentItemWithCompletion:(id)a3;
- (void)insertTracklist:(id)a3 afterItemIdentifier:(id)a4 completion:(id)a5;
- (void)insertTracklist:(id)a3 afterItemIdentifier:(id)a4 playNowWithPreferredStartIndexPath:(id)a5 completion:(id)a6;
- (void)insertTracklist:(id)a3 afterItemIdentifier:(id)a4 playNowWithPreferredStartIndexPath:(id)a5 completionEx:(id)a6;
- (void)insertTracklist:(id)a3 atPosition:(id)a4 completion:(id)a5;
- (void)insertTracklist:(id)a3 atPosition:(id)a4 completionEx:(id)a5;
- (void)moveItemIdentifier:(id)a3 afterItemIdentifier:(id)a4;
- (void)moveItemIdentifier:(id)a3 beforeItemIdentifier:(id)a4;
- (void)removeAllItemIdentifiersAfterItemIdentifier:(id)a3;
- (void)removeItemIdentifier:(id)a3;
- (void)removeItemIdentifiers:(id)a3;
- (void)replaceTracklist:(id)a3 preferredStartIndexPath:(id)a4 completion:(id)a5;
- (void)setAutoPlayEnabled:(BOOL)a3 completion:(id)a4;
- (void)setLiveLink:(id)a3;
@end

@implementation ICSharedListeningQueue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackControlSettings, 0);
  objc_storeStrong((id *)&self->_serverQueueContext, 0);
  objc_destroyWeak((id *)&self->_liveLink);
  objc_storeStrong((id *)&self->_tracklist, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (_ICLLPlaybackControlSettings)playbackControlSettings
{
  return self->_playbackControlSettings;
}

- (NSString)serverQueueContext
{
  return self->_serverQueueContext;
}

- (int64_t)serverRevision
{
  return self->_serverRevision;
}

- (void)setLiveLink:(id)a3
{
}

- (ICLiveLink)liveLink
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_liveLink);

  return (ICLiveLink *)WeakRetained;
}

- (MSVSectionedCollection)tracklist
{
  return self->_tracklist;
}

- (int64_t)explicitContentState
{
  return self->_explicitContentState;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)_tracklistForQueueProto:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F779C0]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  if (v4) {
    v6 = (void *)v4[6];
  }
  else {
    v6 = 0;
  }
  id obj = v6;
  uint64_t v34 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  v30 = v4;
  v7 = 0;
  if (v34)
  {
    uint64_t v32 = *(void *)v36;
    location = (id *)&self->_liveLink;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v36 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v35 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x1A6240990]();
        v11 = [ICSharedListeningItem alloc];
        id WeakRetained = objc_loadWeakRetained(location);
        v13 = WeakRetained;
        if (v9) {
          uint64_t v14 = *(void *)(v9 + 8);
        }
        else {
          uint64_t v14 = 0;
        }
        v15 = [WeakRetained _participantForParticipantID:v14];
        v16 = [(ICSharedListeningItem *)v11 initWithProtobuf:v9 identity:v15];

        v17 = [v7 identifier];
        if (v9)
        {
          id v18 = *(id *)(v9 + 16);
          v19 = v18;
          if (v18)
          {
            v20 = (void *)*((void *)v18 + 1);
            goto LABEL_13;
          }
        }
        else
        {
          v19 = 0;
        }
        v20 = 0;
LABEL_13:
        id v21 = v20;
        char v22 = [v17 isEqual:v21];

        if ((v22 & 1) == 0)
        {
          v23 = [ICSharedListeningContainer alloc];
          if (v9) {
            v24 = *(void **)(v9 + 16);
          }
          else {
            v24 = 0;
          }
          id v25 = v24;
          uint64_t v26 = [(ICSharedListeningContainer *)v23 initWithProtobuf:v25];

          [v5 appendSection:v26];
          v7 = (void *)v26;
        }
        [v5 appendItem:v16];

        ++v8;
      }
      while (v34 != v8);
      uint64_t v27 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      uint64_t v34 = v27;
    }
    while (v27);
  }

  v28 = (void *)[v5 copy];

  return v28;
}

- (void)_detectTrackGenerationSourceForTracklist:(id)a3 detectedCompletion:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, uint64_t, uint64_t))a4;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__12471;
  id v18 = __Block_byref_object_dispose__12472;
  id v19 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__12471;
  v12 = __Block_byref_object_dispose__12472;
  id v13 = 0;
  if (_os_feature_enabled_impl())
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __86__ICSharedListeningQueue__detectTrackGenerationSourceForTracklist_detectedCompletion___block_invoke;
    v7[3] = &unk_1E5AC8A30;
    v7[4] = &v14;
    v7[5] = &v8;
    [v5 reverseEnumerateSectionsUsingBlock:v7];
  }
  v6[2](v6, v15[5], v9[5]);
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
}

void __86__ICSharedListeningQueue__detectTrackGenerationSourceForTracklist_detectedCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v23 = a2;
  if ([v23 kind] != 2)
  {
    if ([v23 kind] != 5) {
      goto LABEL_18;
    }
    uint64_t v14 = objc_opt_new();
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
    v12 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
    goto LABEL_16;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = [v23 featureName];
  uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v10) {
    objc_storeStrong((id *)(v10 + 8), v9);
  }

  v11 = [v23 mediaIdentifier];

  if (v11)
  {
    v12 = [v23 mediaIdentifier];
    uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (v13) {
      objc_storeStrong((id *)(v13 + 24), v12);
    }
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v16 = [v23 seedItem];

  if (v16)
  {
    v17 = objc_opt_new();
    uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (v18) {
      objc_storeStrong((id *)(v18 + 16), v17);
    }

    v12 = [v23 seedItem];
    id v19 = [v12 mediaIdentifier];
    uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (v20)
    {
      id v21 = (id *)*(id *)(v20 + 16);
      char v22 = v21;
      if (v21) {
        objc_storeStrong(v21 + 1, v19);
      }
    }
    else
    {
      char v22 = 0;
    }

    goto LABEL_16;
  }
LABEL_17:
  *a4 = 1;
LABEL_18:
}

- (id)_playbackItemProtosForTracklist:(id)a3 withPreferredStartItemIndexPath:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(v7, "msv_section");
  uint64_t v9 = objc_msgSend(v7, "msv_item");
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v33[3] = -1;
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "totalItemCount"));
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  id v25 = __90__ICSharedListeningQueue__playbackItemProtosForTracklist_withPreferredStartItemIndexPath___block_invoke;
  uint64_t v26 = &unk_1E5AC8A08;
  id v11 = v6;
  id v27 = v11;
  id v12 = v7;
  uint64_t v31 = v8;
  uint64_t v32 = v9;
  id v28 = v12;
  v30 = v33;
  id v13 = v10;
  id v29 = v13;
  [v11 enumerateSectionsUsingBlock:&v23];
  id v14 = v13;
  uint64_t v15 = v14;
  if ((unint64_t)objc_msgSend(v14, "count", v23, v24, v25, v26) >= 0x7D1)
  {
    if (v9 > 99)
    {
      uint64_t v18 = [v14 count] + ~v9;
      if (v18 >= 1900) {
        uint64_t v18 = 1900;
      }
      uint64_t v19 = 1999 - v18;
      if (v19 <= 99) {
        uint64_t v19 = 99;
      }
      uint64_t v17 = v9 - v19;
      uint64_t v16 = objc_msgSend(v14, "subarrayWithRange:", v17, 2000);
      uint64_t v15 = (void *)[v16 mutableCopy];
    }
    else
    {
      uint64_t v16 = objc_msgSend(v14, "subarrayWithRange:", 0, 2000);
      uint64_t v15 = (void *)[v16 mutableCopy];
      uint64_t v17 = 0;
    }

    uint64_t v20 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = [v14 count];
      *(_DWORD *)buf = 134219008;
      long long v35 = self;
      __int16 v36 = 2048;
      uint64_t v37 = v21;
      __int16 v38 = 1024;
      int v39 = 2000;
      __int16 v40 = 2048;
      uint64_t v41 = v17;
      __int16 v42 = 2048;
      uint64_t v43 = v17 + 2000;
      _os_log_impl(&dword_1A2D01000, v20, OS_LOG_TYPE_DEFAULT, "ILL %p: _playbackItemProtosForTracklist: trimming from %ld to %d items. Taking items from indices %ld to %ld.", buf, 0x30u);
    }
  }
  _Block_object_dispose(v33, 8);

  return v15;
}

void __90__ICSharedListeningQueue__playbackItemProtosForTracklist_withPreferredStartItemIndexPath___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = objc_alloc_init(_ICLLPlaybackItemContainer);
  id v7 = [v5 identifier];
  if (v6) {
    objc_storeStrong((id *)&v6->_containerId, v7);
  }

  uint64_t v8 = [v5 kind];
  if ((unint64_t)(v8 - 1) > 4) {
    int v9 = 0;
  }
  else {
    int v9 = dword_1A3032C68[v8 - 1];
  }
  if (v6)
  {
    *(unsigned char *)&v6->_has |= 1u;
    v6->_type = v9;
    uint64_t v10 = [v5 mediaIdentifier];
    objc_storeStrong((id *)&v6->_mediaId, v10);
  }
  else
  {
    uint64_t v10 = [v5 mediaIdentifier];
  }

  id v11 = [v5 featureName];
  if (v6) {
    objc_storeStrong((id *)&v6->_featureName, v11);
  }

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __90__ICSharedListeningQueue__playbackItemProtosForTracklist_withPreferredStartItemIndexPath___block_invoke_2;
  v16[3] = &unk_1E5AC89E0;
  uint64_t v17 = v6;
  id v12 = *(void **)(a1 + 32);
  id v18 = *(id *)(a1 + 40);
  uint64_t v20 = a3;
  long long v15 = *(_OWORD *)(a1 + 48);
  long long v21 = *(_OWORD *)(a1 + 64);
  id v13 = (id)v15;
  long long v19 = v15;
  id v14 = v6;
  [v12 enumerateItemsInSectionAtIndex:a3 usingBlock:v16];
}

void __90__ICSharedListeningQueue__playbackItemProtosForTracklist_withPreferredStartItemIndexPath___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  int v9 = objc_alloc_init(_ICLLPlaybackItem);
  container = [v5 identifier];
  if (v9)
  {
    objc_storeStrong((id *)&v9->_itemId, container);

    id v7 = (_ICLLPlaybackItemContainer *)*(id *)(a1 + 32);
    container = v9->_container;
    v9->_container = v7;
  }

  uint64_t v8 = [v5 mediaIdentifier];

  if (v9) {
    objc_storeStrong((id *)&v9->_mediaId, v8);
  }

  if (*(void *)(a1 + 40) && *(void *)(a1 + 64) == *(void *)(a1 + 72) && *(void *)(a1 + 80) == a3) {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 48) count];
  }
  [*(id *)(a1 + 48) addObject:v9];
}

- (id)_itemForIdentifier:(id)a3 outIndexPath:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  char v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__12471;
  id v25 = __Block_byref_object_dispose__12472;
  id v26 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__12471;
  long long v19 = __Block_byref_object_dispose__12472;
  id v20 = 0;
  tracklist = self->_tracklist;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__ICSharedListeningQueue__itemForIdentifier_outIndexPath___block_invoke;
  v11[3] = &unk_1E5AC89B8;
  id v8 = v6;
  id v12 = v8;
  id v13 = &v21;
  id v14 = &v15;
  [(MSVSectionedCollection *)tracklist enumerateItemsUsingBlock:v11];
  if (a4) {
    *a4 = (id) v16[5];
  }
  id v9 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __58__ICSharedListeningQueue__itemForIdentifier_outIndexPath___block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a2;
  id v8 = a3;
  id v9 = [v11 identifier];
  int v10 = [v9 isEqualToString:a1[4]];

  if (v10)
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
    *a4 = 1;
  }
}

- (int64_t)_afterItemPositionForItemIdentifier:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v12 = 0;
    id v6 = [(ICSharedListeningQueue *)self _itemForIdentifier:v5 outIndexPath:&v12];
    id v7 = v12;
    if (!v7
      || (id v8 = v7,
          int64_t v9 = [(MSVSectionedCollection *)self->_tracklist globalIndexForIndexPath:v7] + 1,
          v8,
          v9 == 0x7FFFFFFFFFFFFFFFLL))
    {
      int v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2, self, @"ICLiveLink.m", 2517, @"Could not find item to insert after: %@", v5 object file lineNumber description];

      int64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (void)getExpectedCurrentItemWithCompletion:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_liveLink);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__ICSharedListeningQueue_getExpectedCurrentItemWithCompletion___block_invoke;
  v7[3] = &unk_1E5AC8990;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [WeakRetained fetchPlaybackSyncStateWithCompletion:v7];
}

void __63__ICSharedListeningQueue_getExpectedCurrentItemWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if (a2) {
      id v5 = *(void **)(a2 + 8);
    }
    else {
      id v5 = 0;
    }
    id v6 = v5;
    if ([v6 length])
    {
      uint64_t v7 = [*(id *)(a1 + 32) itemForIdentifier:v6];
      if (v7)
      {
        id v8 = (void *)v7;
        int64_t v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_17:
        v9();

        return;
      }
      id v14 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *(void *)(a1 + 32);
        int v16 = 134217984;
        uint64_t v17 = v15;
        _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_DEFAULT, "ILL %p: getExpectedCurrentItemWithCompletion returning nil [currentItemID not in queue]", (uint8_t *)&v16, 0xCu);
      }

      id v12 = (void *)MEMORY[0x1E4F28C58];
      id v13 = @"currentItemID from the response is not in queue";
    }
    else
    {
      int v10 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        int v16 = 134217984;
        uint64_t v17 = v11;
        _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "ILL %p: getExpectedCurrentItemWithCompletion returning nil [currentItemID not in PlaybackSyncState]", (uint8_t *)&v16, 0xCu);
      }

      id v12 = (void *)MEMORY[0x1E4F28C58];
      id v13 = @"received no currentItemID in response";
    }
    id v8 = objc_msgSend(v12, "msv_errorWithDomain:code:debugDescription:", @"ICLiveLinkErrorDomain", 5, v13);
    int64_t v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_17;
  }
  id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);

  v4();
}

- (void)moveItemIdentifier:(id)a3 afterItemIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v47 = 0;
  id v9 = [(ICSharedListeningQueue *)self _itemForIdentifier:v7 outIndexPath:&v47];
  id v10 = v47;
  uint64_t v11 = [(MSVSectionedCollection *)self->_tracklist globalIndexForIndexPath:v10];
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"ICLiveLink.m", 2410, @"Could not find item to move: %@", v7 object file lineNumber description];

    if (v8) {
      goto LABEL_3;
    }
LABEL_10:
    int v15 = 0;
    goto LABEL_11;
  }
  if (!v8) {
    goto LABEL_10;
  }
LABEL_3:
  id v46 = 0;
  id v12 = [(ICSharedListeningQueue *)self _itemForIdentifier:v8 outIndexPath:&v46];
  id v13 = v46;
  uint64_t v14 = [(MSVSectionedCollection *)self->_tracklist globalIndexForIndexPath:v13];
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    __int16 v42 = [MEMORY[0x1E4F28B00] currentHandler];
    [v42 handleFailureInMethod:a2, self, @"ICLiveLink.m", 2437, @"Could not find item to insert after: %@", v8 object file lineNumber description];
  }
  if (v14 >= v11) {
    int v15 = v14;
  }
  else {
    int v15 = v14 + 1;
  }

LABEL_11:
  uint64_t v17 = objc_opt_new();
  uint64_t v18 = (id *)v17;
  if (v17)
  {
    *(unsigned char *)(v17 + 52) |= 1u;
    *(_DWORD *)(v17 + 48) = 1;
    long long v19 = objc_opt_new();
    -[_ICLLProtocolMessage setCommand:]((uint64_t)v18, v19);

    id v20 = v18[2];
    if (v20)
    {
      v20[104] |= 1u;
      *((_DWORD *)v20 + 6) = 4;
    }
  }
  else
  {
    uint64_t v43 = objc_opt_new();
    -[_ICLLProtocolMessage setCommand:](0, v43);

    id v20 = 0;
  }

  uint64_t v21 = objc_opt_new();
  if (v18) {
    id v22 = v18[2];
  }
  else {
    id v22 = 0;
  }
  id v23 = v22;
  -[_ICLLCommandMessage setMoveItem:]((uint64_t)v23, v21);

  serverQueueContext = self->_serverQueueContext;
  if (!v18)
  {
    id v26 = 0;
    goto LABEL_34;
  }
  id v25 = v18[2];
  id v26 = v25;
  if (!v25)
  {
LABEL_34:
    id v27 = 0;
    goto LABEL_19;
  }
  id v27 = (void *)*((void *)v25 + 6);
LABEL_19:
  id v28 = v27;
  -[_ICLLMoveQueueItemCommand setQueueContext:]((uint64_t)v28, serverQueueContext);

  if (v18 && (int serverRevision = self->_serverRevision, (v30 = (id *)v18[2]) != 0))
  {
    uint64_t v31 = v30;
    uint64_t v32 = v30[6];
    if (v32)
    {
      v32[36] |= 2u;
      *((_DWORD *)v32 + 8) = serverRevision;
    }
  }
  else if (!v18)
  {
    goto LABEL_36;
  }
  v33 = (id *)v18[2];
  if (v33)
  {
    uint64_t v34 = v33;
    long long v35 = v33[6];
    if (v35)
    {
      v35[36] |= 1u;
      *((_DWORD *)v35 + 4) = v15;
    }

    goto LABEL_28;
  }
LABEL_36:
  if (!v18)
  {
    uint64_t v37 = 0;
    goto LABEL_38;
  }
LABEL_28:
  id v36 = v18[2];
  uint64_t v37 = v36;
  if (!v36)
  {
LABEL_38:
    __int16 v38 = 0;
    goto LABEL_30;
  }
  __int16 v38 = (void *)*((void *)v36 + 6);
LABEL_30:
  id v39 = v38;
  -[_ICLLMoveQueueItemCommand setItemId:]((uint64_t)v39, v7);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_liveLink);
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __65__ICSharedListeningQueue_moveItemIdentifier_afterItemIdentifier___block_invoke;
  v44[3] = &unk_1E5AC8940;
  v44[4] = self;
  id v45 = WeakRetained;
  id v41 = WeakRetained;
  [v41 sendMessage:v18 completion:v44];
}

void __65__ICSharedListeningQueue_moveItemIdentifier_afterItemIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v26 = 134218242;
      uint64_t v27 = v8;
      __int16 v28 = 2114;
      id v29 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "ILL %p: [moveItemAfter] Received requestError=%{public}@", (uint8_t *)&v26, 0x16u);
    }

    id v9 = *(void **)(a1 + 40);
    id v10 = @"UpdateAfterRequestError";
    goto LABEL_5;
  }
  if (!v5 || (uint64_t v11 = (id *)v5[1]) == 0)
  {
    id v12 = 0;
    goto LABEL_18;
  }
  id v12 = v11;
  id v13 = v11[8];
  if (!v13)
  {
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v14 = v13[3];

  if (!v14)
  {
LABEL_19:
    id v9 = *(void **)(a1 + 40);
    id v10 = @"UpdateAfterMoveItemAfter";
LABEL_5:
    [v9 _updateQueueWithReason:v10 completion:0];
    goto LABEL_16;
  }
  int v15 = (id *)v5[1];
  int v16 = v15;
  if (!v15)
  {
    uint64_t v18 = 0;
    goto LABEL_21;
  }
  id v17 = v15[8];
  uint64_t v18 = v17;
  if (!v17)
  {
LABEL_21:
    long long v19 = 0;
    goto LABEL_13;
  }
  long long v19 = (void *)*((void *)v17 + 3);
LABEL_13:
  id v20 = v19;

  uint64_t v21 = *(void **)(a1 + 40);
  if (v20)
  {
    id v22 = v20[2];
    id v23 = v20[1];
    id v24 = v20[3];
  }
  else
  {
    id v23 = 0;
    id v22 = 0;
    id v24 = 0;
  }
  id v25 = v24;
  [v21 _handleUpdatedQueue:v22 playbackControlSettings:v23 serverQueueContext:v25];

LABEL_16:
}

- (void)moveItemIdentifier:(id)a3 beforeItemIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v47 = 0;
  id v9 = [(ICSharedListeningQueue *)self _itemForIdentifier:v7 outIndexPath:&v47];
  id v10 = v47;
  uint64_t v11 = [(MSVSectionedCollection *)self->_tracklist globalIndexForIndexPath:v10];
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"ICLiveLink.m", 2337, @"Could not find item to move: %@", v7 object file lineNumber description];

    if (v8) {
      goto LABEL_3;
    }
LABEL_7:
    int v15 = [(MSVSectionedCollection *)self->_tracklist totalItemCount] - 1;
    goto LABEL_8;
  }
  if (!v8) {
    goto LABEL_7;
  }
LABEL_3:
  id v46 = 0;
  id v12 = [(ICSharedListeningQueue *)self _itemForIdentifier:v8 outIndexPath:&v46];
  id v13 = v46;
  uint64_t v14 = [(MSVSectionedCollection *)self->_tracklist globalIndexForIndexPath:v13];
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    __int16 v42 = [MEMORY[0x1E4F28B00] currentHandler];
    [v42 handleFailureInMethod:a2, self, @"ICLiveLink.m", 2364, @"Could not find item to insert after: %@", v8 object file lineNumber description];
  }
  int v15 = v14 - (v14 > v11);

LABEL_8:
  uint64_t v17 = objc_opt_new();
  uint64_t v18 = (id *)v17;
  if (v17)
  {
    *(unsigned char *)(v17 + 52) |= 1u;
    *(_DWORD *)(v17 + 48) = 1;
    long long v19 = objc_opt_new();
    -[_ICLLProtocolMessage setCommand:]((uint64_t)v18, v19);

    id v20 = v18[2];
    if (v20)
    {
      v20[104] |= 1u;
      *((_DWORD *)v20 + 6) = 4;
    }
  }
  else
  {
    uint64_t v43 = objc_opt_new();
    -[_ICLLProtocolMessage setCommand:](0, v43);

    id v20 = 0;
  }

  uint64_t v21 = objc_opt_new();
  if (v18) {
    id v22 = v18[2];
  }
  else {
    id v22 = 0;
  }
  id v23 = v22;
  -[_ICLLCommandMessage setMoveItem:]((uint64_t)v23, v21);

  serverQueueContext = self->_serverQueueContext;
  if (!v18)
  {
    int v26 = 0;
    goto LABEL_31;
  }
  id v25 = v18[2];
  int v26 = v25;
  if (!v25)
  {
LABEL_31:
    uint64_t v27 = 0;
    goto LABEL_16;
  }
  uint64_t v27 = (void *)*((void *)v25 + 6);
LABEL_16:
  id v28 = v27;
  -[_ICLLMoveQueueItemCommand setQueueContext:]((uint64_t)v28, serverQueueContext);

  if (v18 && (int serverRevision = self->_serverRevision, (v30 = (id *)v18[2]) != 0))
  {
    uint64_t v31 = v30;
    uint64_t v32 = v30[6];
    if (v32)
    {
      v32[36] |= 2u;
      *((_DWORD *)v32 + 8) = serverRevision;
    }
  }
  else if (!v18)
  {
    goto LABEL_33;
  }
  v33 = (id *)v18[2];
  if (v33)
  {
    uint64_t v34 = v33;
    long long v35 = v33[6];
    if (v35)
    {
      v35[36] |= 1u;
      *((_DWORD *)v35 + 4) = v15;
    }

    goto LABEL_25;
  }
LABEL_33:
  if (!v18)
  {
    uint64_t v37 = 0;
    goto LABEL_35;
  }
LABEL_25:
  id v36 = v18[2];
  uint64_t v37 = v36;
  if (!v36)
  {
LABEL_35:
    __int16 v38 = 0;
    goto LABEL_27;
  }
  __int16 v38 = (void *)*((void *)v36 + 6);
LABEL_27:
  id v39 = v38;
  -[_ICLLMoveQueueItemCommand setItemId:]((uint64_t)v39, v7);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_liveLink);
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __66__ICSharedListeningQueue_moveItemIdentifier_beforeItemIdentifier___block_invoke;
  v44[3] = &unk_1E5AC8940;
  v44[4] = self;
  id v45 = WeakRetained;
  id v41 = WeakRetained;
  [v41 sendMessage:v18 completion:v44];
}

void __66__ICSharedListeningQueue_moveItemIdentifier_beforeItemIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v26 = 134218242;
      uint64_t v27 = v8;
      __int16 v28 = 2114;
      id v29 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "ILL %p: [moveItemBefore] Received requestError=%{public}@", (uint8_t *)&v26, 0x16u);
    }

    id v9 = *(void **)(a1 + 40);
    id v10 = @"UpdateAfterRequestError";
    goto LABEL_5;
  }
  if (!v5 || (uint64_t v11 = (id *)v5[1]) == 0)
  {
    id v12 = 0;
    goto LABEL_18;
  }
  id v12 = v11;
  id v13 = v11[8];
  if (!v13)
  {
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v14 = v13[3];

  if (!v14)
  {
LABEL_19:
    id v9 = *(void **)(a1 + 40);
    id v10 = @"UpdateAfterMoveItemBefore";
LABEL_5:
    [v9 _updateQueueWithReason:v10 completion:0];
    goto LABEL_16;
  }
  int v15 = (id *)v5[1];
  int v16 = v15;
  if (!v15)
  {
    uint64_t v18 = 0;
    goto LABEL_21;
  }
  id v17 = v15[8];
  uint64_t v18 = v17;
  if (!v17)
  {
LABEL_21:
    long long v19 = 0;
    goto LABEL_13;
  }
  long long v19 = (void *)*((void *)v17 + 3);
LABEL_13:
  id v20 = v19;

  uint64_t v21 = *(void **)(a1 + 40);
  if (v20)
  {
    id v22 = v20[2];
    id v23 = v20[1];
    id v24 = v20[3];
  }
  else
  {
    id v23 = 0;
    id v22 = 0;
    id v24 = 0;
  }
  id v25 = v24;
  [v21 _handleUpdatedQueue:v22 playbackControlSettings:v23 serverQueueContext:v25];

LABEL_16:
}

- (void)removeAllItemIdentifiersAfterItemIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  id v6 = (id *)v5;
  if (v5)
  {
    *(unsigned char *)(v5 + 52) |= 1u;
    *(_DWORD *)(v5 + 48) = 1;
    id v7 = objc_opt_new();
    -[_ICLLProtocolMessage setCommand:]((uint64_t)v6, v7);

    uint64_t v8 = v6[2];
    if (v8)
    {
      v8[104] |= 1u;
      *((_DWORD *)v8 + 6) = 3;
    }
  }
  else
  {
    id v29 = objc_opt_new();
    -[_ICLLProtocolMessage setCommand:](0, v29);

    uint64_t v8 = 0;
  }

  id v9 = objc_opt_new();
  if (!v6)
  {
    -[_ICLLCommandMessage setRemoveItem:](0, v9);

    id v12 = 0;
    goto LABEL_21;
  }
  id v10 = v6[2];
  -[_ICLLCommandMessage setRemoveItem:]((uint64_t)v10, v9);

  id v11 = v6[2];
  id v12 = v11;
  if (!v11)
  {
LABEL_21:
    id v13 = 0;
    goto LABEL_7;
  }
  id v13 = (void *)*((void *)v11 + 11);
LABEL_7:
  id v14 = v13;
  -[_ICLLRemoveQueueItemCommand setItemId:]((uint64_t)v14, v4);

  if (v6 && (int v15 = (id *)v6[2]) != 0)
  {
    int v16 = v15;
    id v17 = v15[11];
    if (v17)
    {
      v17[40] |= 1u;
      *((_DWORD *)v17 + 8) = 2;
    }

    serverQueueContext = self->_serverQueueContext;
  }
  else
  {
    serverQueueContext = self->_serverQueueContext;
    if (!v6)
    {
      id v20 = 0;
      goto LABEL_24;
    }
  }
  id v19 = v6[2];
  id v20 = v19;
  if (!v19)
  {
LABEL_24:
    uint64_t v21 = 0;
    goto LABEL_14;
  }
  uint64_t v21 = (void *)*((void *)v19 + 11);
LABEL_14:
  id v22 = v21;
  -[_ICLLRemoveQueueItemCommand setQueueContext:]((uint64_t)v22, serverQueueContext);

  if (v6 && (serverRevision = self->_serverRevision, (id v24 = (id *)v6[2]) != 0))
  {
    id v25 = v24;
    int v26 = v24[11];
    if (v26)
    {
      v26[40] |= 2u;
      *((_DWORD *)v26 + 9) = serverRevision;
    }
  }
  else
  {
    int v26 = 0;
    id v25 = 0;
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_liveLink);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __70__ICSharedListeningQueue_removeAllItemIdentifiersAfterItemIdentifier___block_invoke;
  v30[3] = &unk_1E5AC8968;
  id v31 = WeakRetained;
  id v28 = WeakRetained;
  [v28 sendMessage:v6 completion:v30];
}

void __70__ICSharedListeningQueue_removeAllItemIdentifiersAfterItemIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a2;
  if (!a3)
  {
    uint64_t v21 = v5;
    if (v5 && (id v6 = (id *)v5[1]) != 0)
    {
      id v7 = v6;
      uint64_t v8 = v6[15];
      if (v8)
      {
        uint64_t v9 = v8[2];

        if (v9)
        {
          id v10 = (id *)v21[1];
          id v11 = v10;
          if (v10)
          {
            id v12 = v10[15];
            id v13 = v12;
            if (v12)
            {
              id v14 = (void *)*((void *)v12 + 2);
LABEL_9:
              int v15 = v14;

              int v16 = *(void **)(a1 + 32);
              if (v15)
              {
                id v17 = v15[2];
                id v18 = v15[1];
                id v19 = v15[3];
              }
              else
              {
                id v18 = 0;
                id v17 = 0;
                id v19 = 0;
              }
              id v20 = v19;
              [v16 _handleUpdatedQueue:v17 playbackControlSettings:v18 serverQueueContext:v20];

              goto LABEL_15;
            }
          }
          else
          {
            id v13 = 0;
          }
          id v14 = 0;
          goto LABEL_9;
        }
LABEL_14:
        [*(id *)(a1 + 32) _updateQueueWithReason:@"UpdateAfterRemoveAllItemsAfterItem" completion:0];
LABEL_15:
        uint64_t v5 = v21;
        goto LABEL_16;
      }
    }
    else
    {
      id v7 = 0;
    }

    goto LABEL_14;
  }
LABEL_16:
}

- (void)removeItemIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  id v6 = (id *)v5;
  if (v5)
  {
    *(unsigned char *)(v5 + 52) |= 1u;
    *(_DWORD *)(v5 + 48) = 1;
    id v7 = objc_opt_new();
    -[_ICLLProtocolMessage setCommand:]((uint64_t)v6, v7);

    uint64_t v8 = v6[2];
    if (v8)
    {
      v8[104] |= 1u;
      *((_DWORD *)v8 + 6) = 3;
    }
  }
  else
  {
    id v31 = objc_opt_new();
    -[_ICLLProtocolMessage setCommand:](0, v31);

    uint64_t v8 = 0;
  }

  uint64_t v9 = objc_opt_new();
  if (v6) {
    id v10 = v6[2];
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;
  -[_ICLLCommandMessage setRemoveItem:]((uint64_t)v11, v9);

  id v12 = (void *)[v4 mutableCopy];
  if (v6 && (id v13 = (id *)v6[2]) != 0)
  {
    id v14 = v13;
    int v15 = (id *)v13[11];
    int v16 = v15;
    if (v15) {
      objc_storeStrong(v15 + 2, v12);
    }
  }
  else
  {

    if (!v6) {
      goto LABEL_25;
    }
  }
  id v17 = (id *)v6[2];
  if (v17)
  {
    id v18 = v17;
    id v19 = v17[11];
    if (v19)
    {
      v19[40] |= 1u;
      *((_DWORD *)v19 + 8) = 4;
    }

    serverQueueContext = self->_serverQueueContext;
    goto LABEL_15;
  }
LABEL_25:
  serverQueueContext = self->_serverQueueContext;
  if (!v6)
  {
    id v22 = 0;
    goto LABEL_27;
  }
LABEL_15:
  id v21 = v6[2];
  id v22 = v21;
  if (!v21)
  {
LABEL_27:
    id v23 = 0;
    goto LABEL_17;
  }
  id v23 = (void *)*((void *)v21 + 11);
LABEL_17:
  id v24 = v23;
  -[_ICLLRemoveQueueItemCommand setQueueContext:]((uint64_t)v24, serverQueueContext);

  if (v6 && (serverRevision = self->_serverRevision, (int v26 = (id *)v6[2]) != 0))
  {
    uint64_t v27 = v26;
    id v28 = v26[11];
    if (v28)
    {
      v28[40] |= 2u;
      *((_DWORD *)v28 + 9) = serverRevision;
    }
  }
  else
  {
    id v28 = 0;
    uint64_t v27 = 0;
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_liveLink);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __48__ICSharedListeningQueue_removeItemIdentifiers___block_invoke;
  v32[3] = &unk_1E5AC8968;
  id v33 = WeakRetained;
  id v30 = WeakRetained;
  [v30 sendMessage:v6 completion:v32];
}

void __48__ICSharedListeningQueue_removeItemIdentifiers___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a2;
  if (!a3)
  {
    id v21 = v5;
    if (v5 && (id v6 = (id *)v5[1]) != 0)
    {
      id v7 = v6;
      uint64_t v8 = v6[15];
      if (v8)
      {
        uint64_t v9 = v8[2];

        if (v9)
        {
          id v10 = (id *)v21[1];
          id v11 = v10;
          if (v10)
          {
            id v12 = v10[15];
            id v13 = v12;
            if (v12)
            {
              id v14 = (void *)*((void *)v12 + 2);
LABEL_9:
              int v15 = v14;

              int v16 = *(void **)(a1 + 32);
              if (v15)
              {
                id v17 = v15[2];
                id v18 = v15[1];
                id v19 = v15[3];
              }
              else
              {
                id v18 = 0;
                id v17 = 0;
                id v19 = 0;
              }
              id v20 = v19;
              [v16 _handleUpdatedQueue:v17 playbackControlSettings:v18 serverQueueContext:v20];

              goto LABEL_15;
            }
          }
          else
          {
            id v13 = 0;
          }
          id v14 = 0;
          goto LABEL_9;
        }
LABEL_14:
        [*(id *)(a1 + 32) _updateQueueWithReason:@"UpdateAfterRemoveItems [bulk]" completion:0];
LABEL_15:
        uint64_t v5 = v21;
        goto LABEL_16;
      }
    }
    else
    {
      id v7 = 0;
    }

    goto LABEL_14;
  }
LABEL_16:
}

- (void)removeItemIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  id v6 = (id *)v5;
  if (v5)
  {
    *(unsigned char *)(v5 + 52) |= 1u;
    *(_DWORD *)(v5 + 48) = 1;
    id v7 = objc_opt_new();
    -[_ICLLProtocolMessage setCommand:]((uint64_t)v6, v7);

    uint64_t v8 = v6[2];
    if (v8)
    {
      v8[104] |= 1u;
      *((_DWORD *)v8 + 6) = 3;
    }
  }
  else
  {
    int v26 = objc_opt_new();
    -[_ICLLProtocolMessage setCommand:](0, v26);

    uint64_t v8 = 0;
  }

  uint64_t v9 = objc_opt_new();
  if (v6)
  {
    id v10 = v6[2];
    -[_ICLLCommandMessage setRemoveItem:]((uint64_t)v10, v9);

    id v11 = v6[2];
    id v12 = v11;
    if (v11)
    {
      id v13 = (void *)*((void *)v11 + 11);
      goto LABEL_7;
    }
  }
  else
  {
    -[_ICLLCommandMessage setRemoveItem:](0, v9);

    id v12 = 0;
  }
  id v13 = 0;
LABEL_7:
  id v14 = v13;
  -[_ICLLRemoveQueueItemCommand setItemId:]((uint64_t)v14, v4);

  serverQueueContext = self->_serverQueueContext;
  if (!v6)
  {
    id v17 = 0;
    goto LABEL_19;
  }
  id v16 = v6[2];
  id v17 = v16;
  if (!v16)
  {
LABEL_19:
    id v18 = 0;
    goto LABEL_10;
  }
  id v18 = (void *)*((void *)v16 + 11);
LABEL_10:
  id v19 = v18;
  -[_ICLLRemoveQueueItemCommand setQueueContext:]((uint64_t)v19, serverQueueContext);

  if (v6 && (serverRevision = self->_serverRevision, (id v21 = (id *)v6[2]) != 0))
  {
    id v22 = v21;
    id v23 = v21[11];
    if (v23)
    {
      v23[40] |= 2u;
      *((_DWORD *)v23 + 9) = serverRevision;
    }
  }
  else
  {
    id v23 = 0;
    id v22 = 0;
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_liveLink);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __47__ICSharedListeningQueue_removeItemIdentifier___block_invoke;
  v27[3] = &unk_1E5AC8940;
  v27[4] = self;
  id v28 = WeakRetained;
  id v25 = WeakRetained;
  [v25 sendMessage:v6 completion:v27];
}

void __47__ICSharedListeningQueue_removeItemIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v26 = 134218242;
      uint64_t v27 = v8;
      __int16 v28 = 2114;
      id v29 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "ILL %p: [removeItem] Received requestError=%{public}@", (uint8_t *)&v26, 0x16u);
    }

    uint64_t v9 = *(void **)(a1 + 40);
    id v10 = @"UpdateAfterRequestError";
    goto LABEL_5;
  }
  if (!v5 || (id v11 = (id *)v5[1]) == 0)
  {
    id v12 = 0;
    goto LABEL_18;
  }
  id v12 = v11;
  id v13 = v11[15];
  if (!v13)
  {
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v14 = v13[2];

  if (!v14)
  {
LABEL_19:
    uint64_t v9 = *(void **)(a1 + 40);
    id v10 = @"UpdateAfterRemoveItem";
LABEL_5:
    [v9 _updateQueueWithReason:v10 completion:0];
    goto LABEL_16;
  }
  int v15 = (id *)v5[1];
  id v16 = v15;
  if (!v15)
  {
    id v18 = 0;
    goto LABEL_21;
  }
  id v17 = v15[15];
  id v18 = v17;
  if (!v17)
  {
LABEL_21:
    id v19 = 0;
    goto LABEL_13;
  }
  id v19 = (void *)*((void *)v17 + 2);
LABEL_13:
  id v20 = v19;

  id v21 = *(void **)(a1 + 40);
  if (v20)
  {
    id v22 = v20[2];
    id v23 = v20[1];
    id v24 = v20[3];
  }
  else
  {
    id v23 = 0;
    id v22 = 0;
    id v24 = 0;
  }
  id v25 = v24;
  [v21 _handleUpdatedQueue:v22 playbackControlSettings:v23 serverQueueContext:v25];

LABEL_16:
}

- (void)insertTracklist:(id)a3 afterItemIdentifier:(id)a4 playNowWithPreferredStartIndexPath:(id)a5 completionEx:(id)a6
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v55 = a4;
  id v57 = a5;
  id v56 = a6;
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x2020000000;
  char v68 = 0;
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __110__ICSharedListeningQueue_insertTracklist_afterItemIdentifier_playNowWithPreferredStartIndexPath_completionEx___block_invoke;
  v64[3] = &unk_1E5AC88A0;
  v64[4] = &v65;
  [(ICSharedListeningQueue *)self _detectTrackGenerationSourceForTracklist:v11 detectedCompletion:v64];
  if ([v11 totalItemCount] || *((unsigned char *)v66 + 24))
  {
    id v12 = v57;
    if (v57)
    {
      uint64_t v13 = objc_msgSend(v57, "msv_section");
      if (v13 >= [v11 numberOfSections])
      {
        v52 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ICLiveLink.m", 2160, @"preferredStartIndexPath section out of bounds (%ld/%ld)", objc_msgSend(v57, "msv_section"), objc_msgSend(v11, "numberOfSections"));

        id v12 = v57;
      }
      uint64_t v14 = objc_msgSend(v12, "msv_item");
      if (v14 >= objc_msgSend(v11, "numberOfItemsInSection:", objc_msgSend(v12, "msv_section")))
      {
        v53 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ICLiveLink.m", 2161, @"preferredStartIndexPath item out of bounds (%ld/%ld)", objc_msgSend(v12, "msv_item"), objc_msgSend(v11, "numberOfItemsInSection:", objc_msgSend(v12, "msv_section")));

        id v12 = v57;
      }
      int v15 = [v11 itemAtIndexPath:v12];
      id obj = [v15 identifier];
    }
    else
    {
      id obj = 0;
    }
    uint64_t v16 = objc_opt_new();
    id v17 = (id *)v16;
    if (v16)
    {
      *(unsigned char *)(v16 + 52) |= 1u;
      *(_DWORD *)(v16 + 48) = 1;
    }
    id v18 = objc_opt_new();
    -[_ICLLProtocolMessage setCommand:]((uint64_t)v17, v18);

    if (v17)
    {
      id v19 = v17[2];
      if (v19)
      {
        v19[104] |= 1u;
        *((_DWORD *)v19 + 6) = 10;
      }
    }
    else
    {
      id v19 = 0;
    }

    id v20 = objc_opt_new();
    if (v17) {
      id v21 = v17[2];
    }
    else {
      id v21 = 0;
    }
    id v22 = v21;
    id v23 = v20;
    if (v22)
    {
      -[_ICLLCommandMessage clearOneofValuesForCommand]((uint64_t)v22);
      *((unsigned char *)v22 + 104) |= 1u;
      *((_DWORD *)v22 + 6) = 10;
      objc_storeStrong((id *)v22 + 7, v20);
    }

    int v24 = [(ICSharedListeningQueue *)self _afterItemPositionForItemIdentifier:v55];
    if (v17 && (int v25 = v24, (v26 = (id *)v17[2]) != 0))
    {
      uint64_t v27 = v26;
      __int16 v28 = v26[7];
      if (v28)
      {
        v28[52] |= 1u;
        *((_DWORD *)v28 + 4) = v25;
      }
    }
    else if (!v17)
    {
      goto LABEL_47;
    }
    serverQueueContext = self->_serverQueueContext;
    uint64_t v30 = (id *)v17[2];
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = (id *)v30[7];
      id v33 = v32;
      if (v32) {
        objc_storeStrong(v32 + 4, serverQueueContext);
      }

LABEL_28:
      int serverRevision = self->_serverRevision;
      long long v35 = (id *)v17[2];
      if (v35)
      {
        id v36 = v35;
        uint64_t v37 = v35[7];
        if (v37)
        {
          v37[52] |= 2u;
          *((_DWORD *)v37 + 12) = serverRevision;
        }
LABEL_31:

        __int16 v38 = [(ICSharedListeningQueue *)self _playbackItemProtosForTracklist:v11 withPreferredStartItemIndexPath:v57];
        if (v17 && (id v39 = (id *)v17[2]) != 0)
        {
          __int16 v40 = v39;
          id v41 = (id *)v39[7];
          __int16 v42 = v41;
          if (v41) {
            objc_storeStrong(v41 + 1, v38);
          }
        }
        else
        {

          if (!v17) {
            goto LABEL_50;
          }
        }
        uint64_t v43 = (id *)v17[2];
        if (v43)
        {
          uint64_t v44 = v43;
          id v45 = (id *)v43[7];
          id v46 = v45;
          if (v45) {
            objc_storeStrong(v45 + 3, obj);
          }
          goto LABEL_39;
        }
LABEL_50:
        id v46 = 0;
        uint64_t v44 = 0;
LABEL_39:

        v62[0] = MEMORY[0x1E4F143A8];
        v62[1] = 3221225472;
        v62[2] = __110__ICSharedListeningQueue_insertTracklist_afterItemIdentifier_playNowWithPreferredStartIndexPath_completionEx___block_invoke_621;
        v62[3] = &unk_1E5AC88C8;
        id v47 = v17;
        v63 = v47;
        [(ICSharedListeningQueue *)self _detectTrackGenerationSourceForTracklist:v11 detectedCompletion:v62];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_liveLink);
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __110__ICSharedListeningQueue_insertTracklist_afterItemIdentifier_playNowWithPreferredStartIndexPath_completionEx___block_invoke_2;
        v58[3] = &unk_1E5AC88F0;
        v58[4] = self;
        id v49 = WeakRetained;
        id v59 = v49;
        id v61 = v56;
        id v50 = obj;
        id v60 = v50;
        [v49 sendMessage:v47 completion:v58];

        goto LABEL_40;
      }
LABEL_48:
      uint64_t v37 = 0;
      id v36 = 0;
      goto LABEL_31;
    }
LABEL_47:
    if (!v17) {
      goto LABEL_48;
    }
    goto LABEL_28;
  }
  v51 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v70 = self;
    _os_log_impl(&dword_1A2D01000, v51, OS_LOG_TYPE_DEFAULT, "ILL %p: insertTracklistPlayNow completing immediately [tracklist.totalItemCount = 0, hasRadioTrackGenerationSource = NO]", buf, 0xCu);
  }

  (*((void (**)(id, void, void))v56 + 2))(v56, 0, 0);
LABEL_40:
  _Block_object_dispose(&v65, 8);
}

uint64_t __110__ICSharedListeningQueue_insertTracklist_afterItemIdentifier_playNowWithPreferredStartIndexPath_completionEx___block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2 != 0;
  return result;
}

void __110__ICSharedListeningQueue_insertTracklist_afterItemIdentifier_playNowWithPreferredStartIndexPath_completionEx___block_invoke_621(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  if (v3 && (uint64_t v5 = (id *)*(id *)(v3 + 16)) != 0)
  {
    uint64_t v8 = v5;
    id v6 = (id *)v5[7];
    id v7 = v6;
    if (v6) {
      objc_storeStrong(v6 + 5, a2);
    }
  }
  else
  {
    id v7 = 0;
    uint64_t v8 = 0;
  }
}

void __110__ICSharedListeningQueue_insertTracklist_afterItemIdentifier_playNowWithPreferredStartIndexPath_completionEx___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    if (v5)
    {
      id v11 = (id *)v5[3];
      if (v11)
      {
        id v10 = v11;
        if (!*(void *)(a1 + 56)) {
          goto LABEL_47;
        }
        id v12 = (void *)MEMORY[0x1E4F28C58];
        if ((_BYTE)v11[3]) {
          uint64_t v13 = *((int *)v11 + 2);
        }
        else {
          uint64_t v13 = 0;
        }
        uint64_t v64 = *MEMORY[0x1E4F28568];
        id v20 = v11[2];
        id v21 = v20;
        if (!v20)
        {
          if ((_BYTE)v10[3]) {
            uint64_t v22 = *((int *)v10 + 2);
          }
          else {
            uint64_t v22 = 0;
          }
          id v21 = objc_msgSend(NSString, "stringWithFormat:", @"Error [%ld]", v22);
        }
        uint64_t v65 = v21;
        id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
        int v24 = objc_msgSend(v12, "msv_errorWithDomain:code:userInfo:debugDescription:", @"ICLiveLinkServerErrorDomain", v13, v23, @"Failed to insert tracklist after item");

        if (!v20) {
        int v25 = [*(id *)(a1 + 40) delegateQueue];
        }
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __110__ICSharedListeningQueue_insertTracklist_afterItemIdentifier_playNowWithPreferredStartIndexPath_completionEx___block_invoke_2_626;
        block[3] = &unk_1E5ACD2F0;
        int v26 = &v60;
        id v27 = *(id *)(a1 + 56);
        __int16 v28 = &v59;
        id v59 = v24;
        id v60 = v27;
        id v29 = v24;
        dispatch_async(v25, block);
LABEL_46:

        goto LABEL_47;
      }
      id v14 = *(id *)(a1 + 48);
      if (v14)
      {
LABEL_30:
        v54[0] = MEMORY[0x1E4F143A8];
        v54[1] = 3221225472;
        v54[2] = __110__ICSharedListeningQueue_insertTracklist_afterItemIdentifier_playNowWithPreferredStartIndexPath_completionEx___block_invoke_3;
        v54[3] = &unk_1E5ACB578;
        id v55 = *(id *)(a1 + 40);
        id v29 = v14;
        id v56 = v29;
        id v57 = *(id *)(a1 + 56);
        long long v35 = (void (**)(void, void))MEMORY[0x1A6240BF0](v54);
        if (v5 && (id v36 = (id *)v5[1]) != 0)
        {
          uint64_t v37 = v36;
          __int16 v38 = v36[11];
          if (v38)
          {
            uint64_t v39 = v38[4];

            if (v39)
            {
              __int16 v40 = (id *)v5[1];
              id v41 = v40;
              if (v40)
              {
                id v42 = v40[11];
                uint64_t v43 = v42;
                if (v42)
                {
                  uint64_t v44 = (void *)*((void *)v42 + 4);
LABEL_37:
                  id v45 = v44;

                  id v46 = *(void **)(a1 + 40);
                  int v26 = &v55;
                  if (v45)
                  {
                    id v47 = v45[2];
                    id v48 = v45[1];
                    id v49 = v45[3];
                  }
                  else
                  {
                    id v48 = 0;
                    id v47 = 0;
                    id v49 = 0;
                  }
                  id v50 = v49;
                  [v46 _handleUpdatedQueue:v47 playbackControlSettings:v48 serverQueueContext:v50];

                  v35[2](v35, 0);
                  goto LABEL_45;
                }
              }
              else
              {
                uint64_t v43 = 0;
              }
              uint64_t v44 = 0;
              goto LABEL_37;
            }
LABEL_44:
            v51 = *(void **)(a1 + 40);
            v52[0] = MEMORY[0x1E4F143A8];
            v52[1] = 3221225472;
            v52[2] = __110__ICSharedListeningQueue_insertTracklist_afterItemIdentifier_playNowWithPreferredStartIndexPath_completionEx___block_invoke_5;
            v52[3] = &unk_1E5ACAC90;
            v53 = v35;
            [v51 _updateQueueWithReason:@"UpdateAfterPlayNow" completion:v52];
            id v45 = v53;
            int v26 = &v55;
LABEL_45:

            id v10 = 0;
            int v25 = v57;
            __int16 v28 = &v56;
            goto LABEL_46;
          }
        }
        else
        {
          uint64_t v37 = 0;
        }

        goto LABEL_44;
      }
      id v15 = v5[1];
      id v14 = v15;
      if (v15)
      {
        uint64_t v16 = (void *)*((void *)v15 + 11);
        goto LABEL_13;
      }
    }
    else
    {
      id v14 = *(id *)(a1 + 48);
      if (v14) {
        goto LABEL_30;
      }
    }
    uint64_t v16 = 0;
LABEL_13:
    id v17 = v16;

    if (v17)
    {
      id v18 = v17[3];
      if (v18)
      {
        id v19 = v18;
        id v14 = v19;
LABEL_29:

        goto LABEL_30;
      }
      id v30 = v17[1];
    }
    else
    {
      id v30 = 0;
    }
    id v31 = v30;
    uint64_t v32 = [v31 firstObject];
    id v33 = (void *)v32;
    if (v32) {
      uint64_t v34 = *(void **)(v32 + 24);
    }
    else {
      uint64_t v34 = 0;
    }
    id v14 = v34;

    id v19 = 0;
    goto LABEL_29;
  }
  id v7 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218242;
    uint64_t v67 = v8;
    __int16 v68 = 2114;
    id v69 = v6;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "ILL %p: [insertTracklistAndPlayNow] Received requestError=%{public}@", buf, 0x16u);
  }

  uint64_t v9 = *(void **)(a1 + 40);
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __110__ICSharedListeningQueue_insertTracklist_afterItemIdentifier_playNowWithPreferredStartIndexPath_completionEx___block_invoke_622;
  v61[3] = &unk_1E5ACD8E0;
  v63 = (id *)*(id *)(a1 + 56);
  id v62 = v6;
  [v9 _updateQueueWithReason:@"UpdateAfterRequestError" completion:v61];

  id v10 = v63;
LABEL_47:
}

uint64_t __110__ICSharedListeningQueue_insertTracklist_afterItemIdentifier_playNowWithPreferredStartIndexPath_completionEx___block_invoke_622(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 32));
  }
  return result;
}

uint64_t __110__ICSharedListeningQueue_insertTracklist_afterItemIdentifier_playNowWithPreferredStartIndexPath_completionEx___block_invoke_2_626(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __110__ICSharedListeningQueue_insertTracklist_afterItemIdentifier_playNowWithPreferredStartIndexPath_completionEx___block_invoke_3(id *a1, void *a2)
{
  id v3 = a2;
  if (!v3) {
    [a1[4] receivedCurrentItemIdentifier:a1[5] fromParticipant:0];
  }
  if (a1[6])
  {
    id v4 = [a1[4] delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __110__ICSharedListeningQueue_insertTracklist_afterItemIdentifier_playNowWithPreferredStartIndexPath_completionEx___block_invoke_4;
    block[3] = &unk_1E5ACD250;
    id v8 = a1[6];
    id v6 = a1[5];
    id v7 = v3;
    dispatch_async(v4, block);
  }
}

uint64_t __110__ICSharedListeningQueue_insertTracklist_afterItemIdentifier_playNowWithPreferredStartIndexPath_completionEx___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __110__ICSharedListeningQueue_insertTracklist_afterItemIdentifier_playNowWithPreferredStartIndexPath_completionEx___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)insertTracklist:(id)a3 afterItemIdentifier:(id)a4 playNowWithPreferredStartIndexPath:(id)a5 completion:(id)a6
{
  id v11 = a6;
  id v12 = v11;
  if (v11)
  {
    uint64_t v13 = v18;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __108__ICSharedListeningQueue_insertTracklist_afterItemIdentifier_playNowWithPreferredStartIndexPath_completion___block_invoke;
    v18[3] = &unk_1E5AC9E60;
    id v6 = &v19;
    id v19 = v11;
  }
  else
  {
    uint64_t v13 = 0;
  }
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = (void *)MEMORY[0x1A6240BF0](v13);
  [(ICSharedListeningQueue *)self insertTracklist:v16 afterItemIdentifier:v15 playNowWithPreferredStartIndexPath:v14 completionEx:v17];

  if (v12) {
}
  }

uint64_t __108__ICSharedListeningQueue_insertTracklist_afterItemIdentifier_playNowWithPreferredStartIndexPath_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)insertTracklist:(id)a3 atPosition:(id)a4 completionEx:(id)a5
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v50 = a5;
  v51 = v10;
  if (!v10)
  {
    id v49 = [MEMORY[0x1E4F28B00] currentHandler];
    [v49 handleFailureInMethod:a2, self, @"ICLiveLink.m", 2054, @"Invalid parameter not satisfying: %@", @"position" object file lineNumber description];
  }
  uint64_t v58 = 0;
  id v59 = &v58;
  uint64_t v60 = 0x2020000000;
  char v61 = 0;
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __66__ICSharedListeningQueue_insertTracklist_atPosition_completionEx___block_invoke;
  v57[3] = &unk_1E5AC88A0;
  v57[4] = &v58;
  [(ICSharedListeningQueue *)self _detectTrackGenerationSourceForTracklist:v9 detectedCompletion:v57];
  if ([v9 totalItemCount] || *((unsigned char *)v59 + 24))
  {
    uint64_t v11 = objc_opt_new();
    id v12 = (id *)v11;
    if (v11)
    {
      *(unsigned char *)(v11 + 52) |= 1u;
      *(_DWORD *)(v11 + 48) = 1;
    }
    uint64_t v13 = objc_opt_new();
    -[_ICLLProtocolMessage setCommand:]((uint64_t)v12, v13);

    if (v12)
    {
      id v14 = v12[2];
      if (v14)
      {
        v14[104] |= 1u;
        *((_DWORD *)v14 + 6) = 2;
      }
    }
    else
    {
      id v14 = 0;
    }

    id v15 = objc_opt_new();
    if (v12) {
      id v16 = v12[2];
    }
    else {
      id v16 = 0;
    }
    id v17 = v16;
    id v18 = v15;
    if (v17)
    {
      -[_ICLLCommandMessage clearOneofValuesForCommand]((uint64_t)v17);
      *((unsigned char *)v17 + 104) |= 1u;
      *((_DWORD *)v17 + 6) = 2;
      objc_storeStrong((id *)v17 + 1, v15);
    }

    uint64_t v19 = [v10 type];
    if (v19 == 1) {
      int v20 = 2;
    }
    else {
      int v20 = 1;
    }
    if (v19 == 2) {
      int v21 = 3;
    }
    else {
      int v21 = v20;
    }
    if (v12 && (uint64_t v22 = (id *)v12[2]) != 0)
    {
      id v23 = v22;
      int v24 = v22[1];
      if (v24)
      {
        v24[52] |= 1u;
        *((_DWORD *)v24 + 2) = v21;
      }
    }
    else
    {
      int v24 = 0;
      id v23 = 0;
    }

    int v25 = [v51 afterItemIdentifier];
    int v26 = [(ICSharedListeningQueue *)self _afterItemPositionForItemIdentifier:v25];
    if (v12 && (int v27 = v26, (v28 = (id *)v12[2]) != 0))
    {
      id v29 = v28;
      id v30 = v28[1];
      if (v30)
      {
        v30[52] |= 2u;
        *((_DWORD *)v30 + 6) = v27;
      }
    }
    else
    {
      id v30 = 0;
      id v29 = 0;
    }

    if (v12 && (serverQueueContext = self->_serverQueueContext, (uint64_t v32 = (id *)v12[2]) != 0))
    {
      id v33 = v32;
      uint64_t v34 = (id *)v32[1];
      long long v35 = v34;
      if (v34) {
        objc_storeStrong(v34 + 4, serverQueueContext);
      }
    }
    else if (!v12)
    {
      goto LABEL_50;
    }
    int serverRevision = self->_serverRevision;
    uint64_t v37 = (id *)v12[2];
    if (v37)
    {
      __int16 v38 = v37;
      uint64_t v39 = v37[1];
      if (v39)
      {
        v39[52] |= 4u;
        *((_DWORD *)v39 + 12) = serverRevision;
      }
      goto LABEL_36;
    }
LABEL_50:
    uint64_t v39 = 0;
    __int16 v38 = 0;
LABEL_36:

    __int16 v40 = [(ICSharedListeningQueue *)self _playbackItemProtosForTracklist:v9 withPreferredStartItemIndexPath:0];
    if (v12 && (id v41 = (id *)v12[2]) != 0)
    {
      id v42 = v41;
      uint64_t v43 = (id *)v41[1];
      uint64_t v44 = v43;
      if (v43) {
        objc_storeStrong(v43 + 2, v40);
      }
    }
    else
    {
      uint64_t v44 = 0;
      id v42 = 0;
    }

    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __66__ICSharedListeningQueue_insertTracklist_atPosition_completionEx___block_invoke_611;
    v55[3] = &unk_1E5AC88C8;
    id v45 = v12;
    id v56 = v45;
    [(ICSharedListeningQueue *)self _detectTrackGenerationSourceForTracklist:v9 detectedCompletion:v55];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_liveLink);
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __66__ICSharedListeningQueue_insertTracklist_atPosition_completionEx___block_invoke_2;
    v52[3] = &unk_1E5AC8918;
    void v52[4] = self;
    id v47 = WeakRetained;
    id v53 = v47;
    id v54 = v50;
    [v47 sendMessage:v45 completion:v52];

    goto LABEL_41;
  }
  id v48 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v63 = self;
    _os_log_impl(&dword_1A2D01000, v48, OS_LOG_TYPE_DEFAULT, "ILL %p: insertTracklist completing immediately [tracklist.totalItemCount = 0, hasRadioTrackGenerationSource = NO]", buf, 0xCu);
  }

  (*((void (**)(id, void, void))v50 + 2))(v50, 0, 0);
LABEL_41:
  _Block_object_dispose(&v58, 8);
}

uint64_t __66__ICSharedListeningQueue_insertTracklist_atPosition_completionEx___block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2 != 0;
  return result;
}

void __66__ICSharedListeningQueue_insertTracklist_atPosition_completionEx___block_invoke_611(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  if (v3 && (uint64_t v5 = (id *)*(id *)(v3 + 16)) != 0)
  {
    id v8 = v5;
    id v6 = (id *)v5[1];
    id v7 = v6;
    if (v6) {
      objc_storeStrong(v6 + 5, a2);
    }
  }
  else
  {
    id v7 = 0;
    id v8 = 0;
  }
}

void __66__ICSharedListeningQueue_insertTracklist_atPosition_completionEx___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    if (!v5) {
      goto LABEL_34;
    }
    uint64_t v11 = (id *)v5[3];
    if (v11)
    {
      id v10 = v11;
      if (!*(void *)(a1 + 48)) {
        goto LABEL_42;
      }
      id v12 = (void *)MEMORY[0x1E4F28C58];
      if ((_BYTE)v11[3]) {
        uint64_t v13 = *((int *)v11 + 2);
      }
      else {
        uint64_t v13 = 0;
      }
      uint64_t v63 = *MEMORY[0x1E4F28568];
      id v41 = v11[2];
      id v42 = v41;
      if (!v41)
      {
        if ((_BYTE)v10[3]) {
          uint64_t v43 = *((int *)v10 + 2);
        }
        else {
          uint64_t v43 = 0;
        }
        id v42 = objc_msgSend(NSString, "stringWithFormat:", @"Error [%ld]", v43);
      }
      uint64_t v64 = v42;
      uint64_t v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
      id v45 = objc_msgSend(v12, "msv_errorWithDomain:code:userInfo:debugDescription:", @"ICLiveLinkServerErrorDomain", v13, v44, @"Failed to insert tracklist at position");

      if (!v41) {
      id v46 = [*(id *)(a1 + 40) delegateQueue];
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __66__ICSharedListeningQueue_insertTracklist_atPosition_completionEx___block_invoke_2_616;
      block[3] = &unk_1E5ACD2F0;
      id v47 = &v59;
      id v48 = *(id *)(a1 + 48);
      id v49 = &v58;
      uint64_t v58 = v45;
      id v59 = v48;
      int v24 = v45;
      dispatch_async(v46, block);
LABEL_41:

      goto LABEL_42;
    }
    id v14 = (id *)v5[1];
    if (v14)
    {
      id v15 = v14;
      id v16 = v14[3];
      id v17 = v16;
      if (v16)
      {
        id v18 = (void *)*((void *)v16 + 1);
        goto LABEL_13;
      }
    }
    else
    {
LABEL_34:
      id v17 = 0;
      id v15 = 0;
    }
    id v18 = 0;
LABEL_13:
    id v19 = v18;
    uint64_t v20 = [v19 firstObject];
    int v21 = (void *)v20;
    if (v20) {
      uint64_t v22 = *(void **)(v20 + 24);
    }
    else {
      uint64_t v22 = 0;
    }
    id v23 = v22;

    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __66__ICSharedListeningQueue_insertTracklist_atPosition_completionEx___block_invoke_3;
    v53[3] = &unk_1E5ACB578;
    id v56 = *(id *)(a1 + 48);
    id v54 = *(id *)(a1 + 40);
    int v24 = v23;
    id v55 = v24;
    int v25 = (void (**)(void, void))MEMORY[0x1A6240BF0](v53);
    if (v5 && (int v26 = (id *)v5[1]) != 0)
    {
      int v27 = v26;
      __int16 v28 = v26[3];
      if (v28)
      {
        uint64_t v29 = v28[3];

        if (v29)
        {
          id v30 = (id *)v5[1];
          id v31 = v30;
          if (v30)
          {
            id v32 = v30[3];
            id v33 = v32;
            if (v32)
            {
              uint64_t v34 = (void *)*((void *)v32 + 3);
LABEL_22:
              long long v35 = v34;

              id v36 = *(void **)(a1 + 40);
              if (v35)
              {
                id v37 = v35[2];
                id v38 = v35[1];
                id v39 = v35[3];
              }
              else
              {
                id v38 = 0;
                id v37 = 0;
                id v39 = 0;
              }
              id v40 = v39;
              [v36 _handleUpdatedQueue:v37 playbackControlSettings:v38 serverQueueContext:v40];

              v25[2](v25, 0);
              goto LABEL_40;
            }
          }
          else
          {
            id v33 = 0;
          }
          uint64_t v34 = 0;
          goto LABEL_22;
        }
LABEL_39:
        id v50 = *(void **)(a1 + 40);
        v51[0] = MEMORY[0x1E4F143A8];
        v51[1] = 3221225472;
        v51[2] = __66__ICSharedListeningQueue_insertTracklist_atPosition_completionEx___block_invoke_5;
        v51[3] = &unk_1E5ACAC90;
        v52 = v25;
        [v50 _updateQueueWithReason:@"UpdateAfterAddItems" completion:v51];
        long long v35 = v52;
LABEL_40:

        id v10 = 0;
        id v46 = v55;
        id v49 = &v54;
        id v47 = &v56;
        goto LABEL_41;
      }
    }
    else
    {
      int v27 = 0;
    }

    goto LABEL_39;
  }
  id v7 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218242;
    uint64_t v66 = v8;
    __int16 v67 = 2114;
    id v68 = v6;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "ILL %p: [insertTracklist] Received requestError=%{public}@", buf, 0x16u);
  }

  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __66__ICSharedListeningQueue_insertTracklist_atPosition_completionEx___block_invoke_612;
  v60[3] = &unk_1E5ACD8E0;
  id v9 = *(void **)(a1 + 40);
  id v62 = (id *)*(id *)(a1 + 48);
  id v61 = v6;
  [v9 _updateQueueWithReason:@"UpdateAfterRequestError" completion:v60];

  id v10 = v62;
LABEL_42:
}

uint64_t __66__ICSharedListeningQueue_insertTracklist_atPosition_completionEx___block_invoke_612(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 32));
  }
  return result;
}

uint64_t __66__ICSharedListeningQueue_insertTracklist_atPosition_completionEx___block_invoke_2_616(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __66__ICSharedListeningQueue_insertTracklist_atPosition_completionEx___block_invoke_3(id *a1, void *a2)
{
  id v3 = a2;
  if (a1[6])
  {
    id v4 = [a1[4] delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__ICSharedListeningQueue_insertTracklist_atPosition_completionEx___block_invoke_4;
    block[3] = &unk_1E5ACD250;
    id v6 = v3;
    id v7 = a1[5];
    id v8 = a1[6];
    dispatch_async(v4, block);
  }
}

uint64_t __66__ICSharedListeningQueue_insertTracklist_atPosition_completionEx___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __66__ICSharedListeningQueue_insertTracklist_atPosition_completionEx___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)insertTracklist:(id)a3 atPosition:(id)a4 completion:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = v12;
  if (v11)
  {
    if (v12)
    {
LABEL_3:
      id v14 = v16;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __64__ICSharedListeningQueue_insertTracklist_atPosition_completion___block_invoke;
      v16[3] = &unk_1E5AC9E60;
      uint64_t v5 = &v17;
      id v17 = v13;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"ICLiveLink.m", 2046, @"Invalid parameter not satisfying: %@", @"position" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
  }
  id v14 = 0;
LABEL_6:
  id v15 = (void *)MEMORY[0x1A6240BF0](v14);
  [(ICSharedListeningQueue *)self insertTracklist:v10 atPosition:v11 completionEx:v15];

  if (v13) {
}
  }

uint64_t __64__ICSharedListeningQueue_insertTracklist_atPosition_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)insertTracklist:(id)a3 afterItemIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = +[ICSharedTracklistPosition specifiedPositionAfterItemIdentifier:a4];
  [(ICSharedListeningQueue *)self insertTracklist:v9 atPosition:v10 completion:v8];
}

- (void)addMediaIdentifiers:(id)a3 afterItemIdentifier:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = v6;
    if ((unint64_t)[v8 count] >= 0x7D1)
    {
      id v9 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        int v25 = self;
        __int16 v26 = 2048;
        uint64_t v27 = [v8 count];
        __int16 v28 = 1024;
        int v29 = 2000;
        _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_DEFAULT, "ILL %p: addMediaIdentifiers:afterItemIdentifier: trimming from %ld to %d items.", buf, 0x1Cu);
      }

      uint64_t v10 = objc_msgSend(v8, "subarrayWithRange:", 0, 2000);

      id v8 = (id)v10;
    }
    id v11 = objc_alloc_init(MEMORY[0x1E4F779C0]);
    id v12 = +[ICSharedListeningContainer groupWithFeatureName:0];
    [v11 appendSection:v12];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v13 = v8;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = +[ICSharedListeningItem itemWithMediaIdentifier:](ICSharedListeningItem, "itemWithMediaIdentifier:", *(void *)(*((void *)&v19 + 1) + 8 * v17), (void)v19);
          [v11 appendItem:v18];

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v15);
    }

    [(ICSharedListeningQueue *)self insertTracklist:v11 afterItemIdentifier:v7 completion:0];
  }
}

- (void)replaceTracklist:(id)a3 preferredStartIndexPath:(id)a4 completion:(id)a5
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v50 = a4;
  id v48 = a5;
  uint64_t v58 = 0;
  id v59 = &v58;
  uint64_t v60 = 0x2020000000;
  char v61 = 0;
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __78__ICSharedListeningQueue_replaceTracklist_preferredStartIndexPath_completion___block_invoke;
  v57[3] = &unk_1E5AC88A0;
  v57[4] = &v58;
  [(ICSharedListeningQueue *)self _detectTrackGenerationSourceForTracklist:v9 detectedCompletion:v57];
  if ([v9 totalItemCount] || *((unsigned char *)v59 + 24))
  {
    uint64_t v10 = v50;
    if (v50)
    {
      uint64_t v11 = objc_msgSend(v50, "msv_section");
      if (v11 >= [v9 numberOfSections])
      {
        id v46 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ICLiveLink.m", 1932, @"preferredStartIndexPath section out of bounds (%ld/%ld)", objc_msgSend(v50, "msv_section"), objc_msgSend(v9, "numberOfSections"));

        uint64_t v10 = v50;
      }
      uint64_t v12 = objc_msgSend(v10, "msv_item");
      if (v12 >= objc_msgSend(v9, "numberOfItemsInSection:", objc_msgSend(v10, "msv_section")))
      {
        id v47 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ICLiveLink.m", 1933, @"preferredStartIndexPath item out of bounds (%ld/%ld)", objc_msgSend(v10, "msv_item"), objc_msgSend(v9, "numberOfItemsInSection:", objc_msgSend(v10, "msv_section")));

        uint64_t v10 = v50;
      }
      id v13 = [v9 itemAtIndexPath:v10];
      id obj = [v13 identifier];
    }
    else
    {
      id obj = 0;
    }
    uint64_t v14 = objc_opt_new();
    uint64_t v15 = (id *)v14;
    if (v14)
    {
      *(unsigned char *)(v14 + 52) |= 1u;
      *(_DWORD *)(v14 + 48) = 1;
    }
    uint64_t v16 = objc_opt_new();
    -[_ICLLProtocolMessage setCommand:]((uint64_t)v15, v16);

    if (v15)
    {
      uint64_t v17 = v15[2];
      if (v17)
      {
        v17[104] |= 1u;
        *((_DWORD *)v17 + 6) = 9;
      }
    }
    else
    {
      uint64_t v17 = 0;
    }

    id v18 = objc_opt_new();
    if (v15) {
      id v19 = v15[2];
    }
    else {
      id v19 = 0;
    }
    id v20 = v19;
    id v21 = v18;
    if (v20)
    {
      -[_ICLLCommandMessage clearOneofValuesForCommand]((uint64_t)v20);
      *((unsigned char *)v20 + 104) |= 1u;
      *((_DWORD *)v20 + 6) = 9;
      objc_storeStrong((id *)v20 + 12, v18);
    }

    if (v15 && (serverQueueContext = self->_serverQueueContext, (id v23 = (id *)v15[2]) != 0))
    {
      int v24 = v23;
      int v25 = (id *)v23[12];
      __int16 v26 = v25;
      if (v25) {
        objc_storeStrong(v25 + 4, serverQueueContext);
      }
    }
    else if (!v15)
    {
      goto LABEL_45;
    }
    int serverRevision = self->_serverRevision;
    __int16 v28 = (id *)v15[2];
    if (v28)
    {
      int v29 = v28;
      uint64_t v30 = v28[12];
      if (v30)
      {
        v30[56] |= 1u;
        *((_DWORD *)v30 + 12) = serverRevision;
      }
LABEL_27:

      id v31 = [(ICSharedListeningQueue *)self _playbackItemProtosForTracklist:v9 withPreferredStartItemIndexPath:v50];
      if (v15 && (id v32 = (id *)v15[2]) != 0)
      {
        id v33 = v32;
        uint64_t v34 = (id *)v32[12];
        long long v35 = v34;
        if (v34) {
          objc_storeStrong(v34 + 2, v31);
        }
      }
      else
      {

        if (!v15) {
          goto LABEL_47;
        }
      }
      id v36 = (id *)v15[2];
      if (v36)
      {
        id v37 = v36;
        id v38 = (id *)v36[12];
        id v39 = v38;
        if (v38) {
          objc_storeStrong(v38 + 3, obj);
        }
        goto LABEL_35;
      }
LABEL_47:
      id v39 = 0;
      id v37 = 0;
LABEL_35:

      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __78__ICSharedListeningQueue_replaceTracklist_preferredStartIndexPath_completion___block_invoke_592;
      v55[3] = &unk_1E5AC88C8;
      id v40 = v15;
      id v56 = v40;
      [(ICSharedListeningQueue *)self _detectTrackGenerationSourceForTracklist:v9 detectedCompletion:v55];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_liveLink);
      id v42 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218498;
        uint64_t v63 = self;
        __int16 v64 = 2114;
        id v65 = obj;
        __int16 v66 = 2114;
        id v67 = v9;
        _os_log_impl(&dword_1A2D01000, v42, OS_LOG_TYPE_DEFAULT, "ILL %p: [replaceTracklist] preferredStartItemID=%{public}@ tracklist=%{public}@", buf, 0x20u);
      }

      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __78__ICSharedListeningQueue_replaceTracklist_preferredStartIndexPath_completion___block_invoke_593;
      v51[3] = &unk_1E5AC88F0;
      void v51[4] = self;
      id v43 = WeakRetained;
      id v52 = v43;
      id v54 = v48;
      id v44 = obj;
      id v53 = v44;
      [v43 sendMessage:v40 completion:v51];

      goto LABEL_38;
    }
LABEL_45:
    uint64_t v30 = 0;
    int v29 = 0;
    goto LABEL_27;
  }
  id v45 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v63 = self;
    _os_log_impl(&dword_1A2D01000, v45, OS_LOG_TYPE_DEFAULT, "ILL %p: replaceTracklist completing immediately [tracklist.totalItemCount = 0, hasRadioTrackGenerationSource = NO]", buf, 0xCu);
  }

  (*((void (**)(id, void))v48 + 2))(v48, 0);
LABEL_38:
  _Block_object_dispose(&v58, 8);
}

uint64_t __78__ICSharedListeningQueue_replaceTracklist_preferredStartIndexPath_completion___block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2 != 0;
  return result;
}

void __78__ICSharedListeningQueue_replaceTracklist_preferredStartIndexPath_completion___block_invoke_592(uint64_t a1, void *a2, void *a3)
{
  id v19 = a2;
  id v6 = a3;
  if (!v19) {
    goto LABEL_8;
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (!v7)
  {
    id v9 = 0;
    goto LABEL_19;
  }
  id v8 = *(id *)(v7 + 16);
  id v9 = v8;
  if (!v8)
  {
LABEL_19:
    uint64_t v10 = 0;
    goto LABEL_5;
  }
  uint64_t v10 = (void *)*((void *)v8 + 12);
LABEL_5:
  id v11 = v10;
  id v12 = v19;
  if (v11)
  {
    -[_ICLLReplaceQueueItemsCommand clearOneofValuesForTrackGenerationSource]((uint64_t)v11);
    *((unsigned char *)v11 + 56) |= 2u;
    *((_DWORD *)v11 + 13) = 2;
    objc_storeStrong((id *)v11 + 5, a2);
  }

LABEL_8:
  if (!v6) {
    goto LABEL_15;
  }
  uint64_t v13 = *(void *)(a1 + 32);
  if (!v13)
  {
    uint64_t v15 = 0;
    goto LABEL_21;
  }
  id v14 = *(id *)(v13 + 16);
  uint64_t v15 = v14;
  if (!v14)
  {
LABEL_21:
    uint64_t v16 = 0;
    goto LABEL_12;
  }
  uint64_t v16 = (void *)*((void *)v14 + 12);
LABEL_12:
  id v17 = v16;
  id v18 = v6;
  if (v17)
  {
    -[_ICLLReplaceQueueItemsCommand clearOneofValuesForTrackGenerationSource]((uint64_t)v17);
    *((unsigned char *)v17 + 56) |= 2u;
    *((_DWORD *)v17 + 13) = 1;
    objc_storeStrong((id *)v17 + 1, a3);
  }

LABEL_15:
}

void __78__ICSharedListeningQueue_replaceTracklist_preferredStartIndexPath_completion___block_invoke_593(uint64_t a1, void *a2, void *a3)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    if (v5)
    {
      id v11 = (id *)v5[3];
      if (v11)
      {
        uint64_t v10 = v11;
        if (!*(void *)(a1 + 56)) {
          goto LABEL_47;
        }
        id v12 = (void *)MEMORY[0x1E4F28C58];
        if ((_BYTE)v11[3]) {
          uint64_t v13 = *((int *)v11 + 2);
        }
        else {
          uint64_t v13 = 0;
        }
        uint64_t v64 = *MEMORY[0x1E4F28568];
        id v20 = v11[2];
        id v21 = v20;
        if (!v20)
        {
          if ((_BYTE)v10[3]) {
            uint64_t v22 = *((int *)v10 + 2);
          }
          else {
            uint64_t v22 = 0;
          }
          id v21 = objc_msgSend(NSString, "stringWithFormat:", @"Error [%ld]", v22);
        }
        id v65 = v21;
        id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
        int v24 = objc_msgSend(v12, "msv_errorWithDomain:code:userInfo:debugDescription:", @"ICLiveLinkServerErrorDomain", v13, v23, @"Failed to replace tracklist");

        if (!v20) {
        int v25 = [*(id *)(a1 + 40) delegateQueue];
        }
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __78__ICSharedListeningQueue_replaceTracklist_preferredStartIndexPath_completion___block_invoke_2;
        block[3] = &unk_1E5ACD2F0;
        __int16 v26 = &v60;
        id v27 = *(id *)(a1 + 56);
        __int16 v28 = &v59;
        id v59 = v24;
        id v60 = v27;
        id v29 = v24;
        dispatch_async(v25, block);
LABEL_46:

        goto LABEL_47;
      }
      id v14 = *(id *)(a1 + 48);
      if (v14)
      {
LABEL_30:
        v54[0] = MEMORY[0x1E4F143A8];
        v54[1] = 3221225472;
        v54[2] = __78__ICSharedListeningQueue_replaceTracklist_preferredStartIndexPath_completion___block_invoke_3;
        v54[3] = &unk_1E5ACB578;
        id v55 = *(id *)(a1 + 40);
        id v29 = v14;
        id v56 = v29;
        id v57 = *(id *)(a1 + 56);
        long long v35 = (void (**)(void, void))MEMORY[0x1A6240BF0](v54);
        if (v5 && (id v36 = (id *)v5[1]) != 0)
        {
          id v37 = v36;
          id v38 = v36[16];
          if (v38)
          {
            uint64_t v39 = v38[4];

            if (v39)
            {
              id v40 = (id *)v5[1];
              id v41 = v40;
              if (v40)
              {
                id v42 = v40[16];
                id v43 = v42;
                if (v42)
                {
                  id v44 = (void *)*((void *)v42 + 4);
LABEL_37:
                  id v45 = v44;

                  id v46 = *(void **)(a1 + 40);
                  __int16 v26 = &v55;
                  if (v45)
                  {
                    id v47 = v45[2];
                    id v48 = v45[1];
                    id v49 = v45[3];
                  }
                  else
                  {
                    id v48 = 0;
                    id v47 = 0;
                    id v49 = 0;
                  }
                  id v50 = v49;
                  [v46 _handleUpdatedQueue:v47 playbackControlSettings:v48 serverQueueContext:v50];

                  v35[2](v35, 0);
                  goto LABEL_45;
                }
              }
              else
              {
                id v43 = 0;
              }
              id v44 = 0;
              goto LABEL_37;
            }
LABEL_44:
            v51 = *(void **)(a1 + 40);
            v52[0] = MEMORY[0x1E4F143A8];
            v52[1] = 3221225472;
            v52[2] = __78__ICSharedListeningQueue_replaceTracklist_preferredStartIndexPath_completion___block_invoke_5;
            v52[3] = &unk_1E5ACAC90;
            id v53 = v35;
            [v51 _updateQueueWithReason:@"UpdateAfterReplaceQueueItems" completion:v52];
            id v45 = v53;
            __int16 v26 = &v55;
LABEL_45:

            uint64_t v10 = 0;
            int v25 = v57;
            __int16 v28 = &v56;
            goto LABEL_46;
          }
        }
        else
        {
          id v37 = 0;
        }

        goto LABEL_44;
      }
      id v15 = v5[1];
      id v14 = v15;
      if (v15)
      {
        uint64_t v16 = (void *)*((void *)v15 + 16);
        goto LABEL_13;
      }
    }
    else
    {
      id v14 = *(id *)(a1 + 48);
      if (v14) {
        goto LABEL_30;
      }
    }
    uint64_t v16 = 0;
LABEL_13:
    id v17 = v16;

    if (v17)
    {
      id v18 = v17[3];
      if (v18)
      {
        id v19 = v18;
        id v14 = v19;
LABEL_29:

        goto LABEL_30;
      }
      id v30 = v17[2];
    }
    else
    {
      id v30 = 0;
    }
    id v31 = v30;
    uint64_t v32 = [v31 firstObject];
    id v33 = (void *)v32;
    if (v32) {
      uint64_t v34 = *(void **)(v32 + 24);
    }
    else {
      uint64_t v34 = 0;
    }
    id v14 = v34;

    id v19 = 0;
    goto LABEL_29;
  }
  uint64_t v7 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218242;
    uint64_t v67 = v8;
    __int16 v68 = 2114;
    id v69 = v6;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "ILL %p: [replaceTracklist] Received requestError=%{public}@", buf, 0x16u);
  }

  id v9 = *(void **)(a1 + 40);
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __78__ICSharedListeningQueue_replaceTracklist_preferredStartIndexPath_completion___block_invoke_597;
  v61[3] = &unk_1E5ACD8E0;
  uint64_t v63 = (id *)*(id *)(a1 + 56);
  id v62 = v6;
  [v9 _updateQueueWithReason:@"UpdateAfterRequestError" completion:v61];

  uint64_t v10 = v63;
LABEL_47:
}

uint64_t __78__ICSharedListeningQueue_replaceTracklist_preferredStartIndexPath_completion___block_invoke_597(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

uint64_t __78__ICSharedListeningQueue_replaceTracklist_preferredStartIndexPath_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __78__ICSharedListeningQueue_replaceTracklist_preferredStartIndexPath_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [v4 identity];
    [v4 receivedCurrentItemIdentifier:v5 fromParticipant:v6];
  }
  if (*(void *)(a1 + 48))
  {
    uint64_t v7 = [*(id *)(a1 + 32) delegateQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __78__ICSharedListeningQueue_replaceTracklist_preferredStartIndexPath_completion___block_invoke_4;
    v8[3] = &unk_1E5ACD2F0;
    id v10 = *(id *)(a1 + 48);
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

uint64_t __78__ICSharedListeningQueue_replaceTracklist_preferredStartIndexPath_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __78__ICSharedListeningQueue_replaceTracklist_preferredStartIndexPath_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)itemForIdentifier:(id)a3
{
  return [(ICSharedListeningQueue *)self _itemForIdentifier:a3 outIndexPath:0];
}

- (void)setAutoPlayEnabled:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (_os_feature_enabled_impl())
  {
    uint64_t v7 = objc_opt_new();
    uint64_t v8 = (id *)v7;
    if (v7)
    {
      *(unsigned char *)(v7 + 52) |= 1u;
      *(_DWORD *)(v7 + 48) = 1;
    }
    id v9 = objc_opt_new();
    -[_ICLLProtocolMessage setCommand:]((uint64_t)v8, v9);

    id v10 = objc_opt_new();
    if (v8) {
      id v11 = v8[2];
    }
    else {
      id v11 = 0;
    }
    id v12 = v11;
    id v13 = v10;
    if (v12)
    {
      -[_ICLLCommandMessage clearOneofValuesForCommand]((uint64_t)v12);
      *((unsigned char *)v12 + 104) |= 1u;
      *((_DWORD *)v12 + 6) = 6;
      objc_storeStrong((id *)v12 + 8, v10);
    }

    id v14 = objc_opt_new();
    if (v8 && (id v15 = (id *)v8[2]) != 0)
    {
      uint64_t v16 = v15;
      id v17 = (id *)v15[8];
      id v18 = v17;
      if (v17) {
        objc_storeStrong(v17 + 1, v14);
      }
    }
    else
    {
      id v18 = 0;
      uint64_t v16 = 0;
    }

    if (v4)
    {
      id v19 = objc_opt_new();
      if (v8 && (id v20 = (id *)v8[2]) != 0)
      {
        id v21 = v20;
        id v22 = v20[8];
        id v23 = v22;
        if (v22)
        {
          int v24 = (void *)*((void *)v22 + 1);
          goto LABEL_17;
        }
      }
      else
      {
        id v23 = 0;
        id v21 = 0;
      }
      int v24 = 0;
LABEL_17:
      int v25 = self;
      __int16 v26 = v24;
      id v27 = v19;
      if (v26)
      {
        -[_ICLLPlaybackControlSettings clearOneofValuesForTrackGenerationSource]((uint64_t)v26);
        v26[52] |= 4u;
        *((_DWORD *)v26 + 12) = 1;
        uint64_t v28 = 8;
LABEL_28:
        id v27 = v27;
        long long v35 = *(void **)&v26[v28];
        *(void *)&v26[v28] = v27;

        goto LABEL_29;
      }
      goto LABEL_29;
    }
    id v31 = objc_opt_new();
    if (v8 && (uint64_t v32 = (id *)v8[2]) != 0)
    {
      id v21 = v32;
      id v33 = v32[8];
      id v23 = v33;
      if (v33)
      {
        uint64_t v34 = (void *)*((void *)v33 + 1);
        goto LABEL_26;
      }
    }
    else
    {
      id v23 = 0;
      id v21 = 0;
    }
    uint64_t v34 = 0;
LABEL_26:
    int v25 = self;
    __int16 v26 = v34;
    id v27 = v31;
    if (v26)
    {
      -[_ICLLPlaybackControlSettings clearOneofValuesForTrackGenerationSource]((uint64_t)v26);
      v26[52] |= 4u;
      *((_DWORD *)v26 + 12) = 3;
      uint64_t v28 = 24;
      goto LABEL_28;
    }
LABEL_29:

    id WeakRetained = objc_loadWeakRetained((id *)&v25->_liveLink);
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __56__ICSharedListeningQueue_setAutoPlayEnabled_completion___block_invoke;
    v38[3] = &unk_1E5AC8878;
    id v39 = WeakRetained;
    id v40 = v6;
    BOOL v41 = v4;
    id v37 = WeakRetained;
    [v37 sendMessage:v8 completion:v38];

    goto LABEL_30;
  }
  id v29 = @"OFF";
  if (v4) {
    id v29 = @"ON";
  }
  id v30 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ICLiveLinkErrorDomain", 0, @"Failed to turn AutoPlay %@, Feature not enabled", v29);
  (*((void (**)(id, void *))v6 + 2))(v6, v30);

LABEL_30:
}

void __56__ICSharedListeningQueue_setAutoPlayEnabled_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v38[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    if (v5 && (id v9 = (id *)v5[3]) != 0)
    {
      uint64_t v8 = v9;
      if (!*(void *)(a1 + 40)) {
        goto LABEL_26;
      }
      id v10 = (void *)MEMORY[0x1E4F28C58];
      if ((_BYTE)v9[3]) {
        uint64_t v11 = *((int *)v9 + 2);
      }
      else {
        uint64_t v11 = 0;
      }
      uint64_t v37 = *MEMORY[0x1E4F28568];
      id v12 = v9[2];
      id v13 = v12;
      if (!v12)
      {
        if ((_BYTE)v8[3]) {
          uint64_t v14 = *((int *)v8 + 2);
        }
        else {
          uint64_t v14 = 0;
        }
        id v13 = objc_msgSend(NSString, "stringWithFormat:", @"Error [%ld]", v14);
      }
      v38[0] = v13;
      id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
      if (*(unsigned char *)(a1 + 48)) {
        uint64_t v16 = @"ON";
      }
      else {
        uint64_t v16 = @"OFF";
      }
      id v17 = objc_msgSend(v10, "msv_errorWithDomain:code:userInfo:debugDescription:", @"ICLiveLinkServerErrorDomain", v11, v15, @"Failed to turn AutoPlay %@", v16);

      if (!v12) {
      id v18 = [*(id *)(a1 + 32) delegateQueue];
      }
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __56__ICSharedListeningQueue_setAutoPlayEnabled_completion___block_invoke_3;
      v31[3] = &unk_1E5ACD2F0;
      id v19 = *(id *)(a1 + 40);
      id v32 = v17;
      id v33 = v19;
      id v20 = v17;
      dispatch_async(v18, v31);
    }
    else
    {
      uint64_t v25 = MEMORY[0x1E4F143A8];
      uint64_t v26 = 3221225472;
      id v27 = __56__ICSharedListeningQueue_setAutoPlayEnabled_completion___block_invoke_4;
      uint64_t v28 = &unk_1E5ACD8E0;
      id v30 = *(id *)(a1 + 40);
      id v29 = *(id *)(a1 + 32);
      id v21 = (void *)MEMORY[0x1A6240BF0](&v25);
      id v22 = *(void **)(a1 + 32);
      if (*(unsigned char *)(a1 + 48)) {
        id v23 = @"ON";
      }
      else {
        id v23 = @"OFF";
      }
      int v24 = [NSString stringWithFormat:@"UpdateAfterAutoplayToggled%@", v23, v25, v26, v27, v28];
      [v22 _updateQueueWithReason:v24 completion:v21];

      uint64_t v8 = 0;
      id v20 = v30;
    }

    goto LABEL_26;
  }
  if (*(void *)(a1 + 40))
  {
    uint64_t v7 = [*(id *)(a1 + 32) delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__ICSharedListeningQueue_setAutoPlayEnabled_completion___block_invoke_2;
    block[3] = &unk_1E5ACD2F0;
    id v36 = (id *)*(id *)(a1 + 40);
    id v35 = v6;
    dispatch_async(v7, block);

    uint64_t v8 = v36;
LABEL_26:
  }
}

uint64_t __56__ICSharedListeningQueue_setAutoPlayEnabled_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __56__ICSharedListeningQueue_setAutoPlayEnabled_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __56__ICSharedListeningQueue_setAutoPlayEnabled_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 40))
  {
    BOOL v4 = [*(id *)(a1 + 32) delegateQueue];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __56__ICSharedListeningQueue_setAutoPlayEnabled_completion___block_invoke_5;
    v5[3] = &unk_1E5ACD2F0;
    id v7 = *(id *)(a1 + 40);
    id v6 = v3;
    dispatch_async(v4, v5);
  }
}

uint64_t __56__ICSharedListeningQueue_setAutoPlayEnabled_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (BOOL)isAutoPlayEnabled
{
  if (!_os_feature_enabled_impl()
    || ![(ICSharedListeningQueue *)self isAutoPlayAvailable])
  {
    return 0;
  }
  uint64_t v3 = [(ICSharedListeningQueue *)self playbackControlSettings];
  BOOL v4 = v3 && (*(unsigned char *)(v3 + 52) & 4) != 0 && *(_DWORD *)(v3 + 48) == 1;

  return v4;
}

- (BOOL)isAutoPlayAvailable
{
  if (!_os_feature_enabled_impl()) {
    return 0;
  }
  uint64_t v3 = [(ICSharedListeningQueue *)self playbackControlSettings];
  BOOL v4 = (void *)v3;
  if (!v3)
  {
    uint64_t v5 = 0;
    goto LABEL_9;
  }
  uint64_t v5 = *(id *)(v3 + 16);
  if (!v5)
  {
LABEL_9:
    BOOL v6 = 0;
    goto LABEL_5;
  }
  BOOL v6 = v5[56] != 0;
LABEL_5:

  return v6;
}

- (BOOL)hasActiveRadioStation
{
  if (!_os_feature_enabled_impl()) {
    return 0;
  }
  uint64_t v3 = [(ICSharedListeningQueue *)self playbackControlSettings];
  BOOL v4 = v3 && (*(unsigned char *)(v3 + 52) & 4) != 0 && *(_DWORD *)(v3 + 48) == 2;

  return v4;
}

- (id)containerForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MSVSectionedCollection *)self->_tracklist allSections];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__ICSharedListeningQueue_containerForIdentifier___block_invoke;
  v9[3] = &unk_1E5AC8850;
  id v10 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "msv_firstWhere:", v9);

  return v7;
}

uint64_t __49__ICSharedListeningQueue_containerForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (NSArray)items
{
  return (NSArray *)[(MSVSectionedCollection *)self->_tracklist allItems];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p identifier=%@ queueContext=%@ revision=%ld> (%@)", objc_opt_class(), self, self->_identifier, self->_serverQueueContext, self->_serverRevision, self->_tracklist];
}

- (ICSharedListeningQueue)initWithProtobuf:(id)a3 serverQueueContext:(id)a4 liveLink:(id)a5 playbackControlSettings:(id)a6
{
  id v10 = (id *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)ICSharedListeningQueue;
  uint64_t v14 = [(ICSharedListeningQueue *)&v26 init];
  id v15 = v14;
  if (!v14) {
    goto LABEL_10;
  }
  objc_storeWeak((id *)&v14->_liveLink, v12);
  if (v10)
  {
    objc_storeStrong((id *)&v15->_identifier, v10[7]);
    if ((*((unsigned char *)v10 + 68) & 2) != 0)
    {
      int v17 = *((_DWORD *)v10 + 11);
      BOOL v18 = v17 == 1;
      BOOL v19 = v17 == 2;
      uint64_t v16 = 2;
      if (!v19) {
        uint64_t v16 = v18;
      }
      goto LABEL_7;
    }
  }
  else
  {
    objc_storeStrong((id *)&v15->_identifier, 0);
  }
  uint64_t v16 = 0;
LABEL_7:
  v15->_explicitContentState = v16;
  uint64_t v20 = [v11 copy];
  serverQueueContext = v15->_serverQueueContext;
  v15->_serverQueueContext = (NSString *)v20;

  if (v10) {
    int64_t v22 = *((int *)v10 + 16);
  }
  else {
    int64_t v22 = 0;
  }
  v15->_int serverRevision = v22;
  uint64_t v23 = [(ICSharedListeningQueue *)v15 _tracklistForQueueProto:v10];
  tracklist = v15->_tracklist;
  v15->_tracklist = (MSVSectionedCollection *)v23;

  objc_storeStrong((id *)&v15->_playbackControlSettings, a6);
LABEL_10:

  return v15;
}

@end