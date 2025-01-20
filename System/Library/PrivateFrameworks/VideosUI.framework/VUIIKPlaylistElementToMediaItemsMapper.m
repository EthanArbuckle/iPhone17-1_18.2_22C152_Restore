@interface VUIIKPlaylistElementToMediaItemsMapper
- (BOOL)_shouldDisableResumeMenuForAsset:(id)a3;
- (VUIIKPlaylistElementToMediaItemsMapper)init;
- (id)_clipMediaItemsMediaItem:(id)a3 fromTimelineElement:(id)a4;
- (id)_createClipMediaItemsIfTimeExists:(id)a3 fromMediaElement:(id)a4;
- (id)_storeAuxMediaItemForIKMediaElement:(id)a3 isExtrasContent:(BOOL)a4;
- (id)_storeMediaItemsForAdamID:(int64_t)a3 IKMediaElement:(id)a4;
- (id)playlistForIKMediaElements:(id)a3 isExtrasContent:(BOOL)a4;
- (id)playlistForIKMediaElements:(id)a3 withMediaItem:(id)a4 isExtrasContent:(BOOL)a5;
- (unint64_t)resumeMenuBehavior;
- (void)_populateMediaItem:(id)a3 withMetadatafromRelatedContentElement:(id)a4;
- (void)_populateMediaItem:(id)a3 withMetadatafromTimelineEventElement:(id)a4;
- (void)_populateMediaItem:(id)a3 withMetadatafromVideoElement:(id)a4;
- (void)setResumeMenuBehavior:(unint64_t)a3;
@end

@implementation VUIIKPlaylistElementToMediaItemsMapper

- (VUIIKPlaylistElementToMediaItemsMapper)init
{
  v3.receiver = self;
  v3.super_class = (Class)VUIIKPlaylistElementToMediaItemsMapper;
  result = [(VUIIKPlaylistElementToMediaItemsMapper *)&v3 init];
  if (result) {
    result->_resumeMenuBehavior = 1;
  }
  return result;
}

- (BOOL)_shouldDisableResumeMenuForAsset:(id)a3
{
  id v4 = a3;
  if ([(VUIIKPlaylistElementToMediaItemsMapper *)self resumeMenuBehavior]) {
    char v5 = objc_msgSend(v4, "vui_disableResumeMenu");
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (id)playlistForIKMediaElements:(id)a3 withMediaItem:(id)a4 isExtrasContent:(BOOL)a5
{
  BOOL v30 = a5;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v7;
  uint64_t v10 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v33;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v32 + 1) + 8 * v13);
        v15 = [v14 assets];
        v16 = [v15 firstObject];

        v17 = [v16 adamID];
        uint64_t v18 = [v17 longLongValue];

        if (v18
          || (objc_msgSend(v16, "vui_rentalAdamIDString"),
              v19 = objc_claimAutoreleasedReturnValue(),
              uint64_t v18 = [v19 longLongValue],
              v19,
              v18))
        {
          if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v20 = [(VUIIKPlaylistElementToMediaItemsMapper *)self _createClipMediaItemsIfTimeExists:v8 fromMediaElement:v14];
          }
          else
          {
            v20 = [(VUIIKPlaylistElementToMediaItemsMapper *)self _storeMediaItemsForAdamID:v18 IKMediaElement:v14];
          }
          v21 = v20;
          if ([v20 count]) {
            [v9 addObjectsFromArray:v21];
          }
        }
        else
        {
          v22 = objc_msgSend(v16, "vui_persistentID");
          uint64_t v23 = [v22 longLongValue];

          if (v23)
          {
            v24 = (void *)MEMORY[0x1E4F31928];
            v25 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v23];
            v21 = objc_msgSend(v24, "vui_mediaItemForPersistentIdentifier:", v25);

            v26 = [[VUILibraryMediaItem_iOS alloc] initWithMPMediaItem:v21];
            [v9 addObject:v26];
          }
          else
          {
            v21 = [(VUIIKPlaylistElementToMediaItemsMapper *)self _storeAuxMediaItemForIKMediaElement:v14 isExtrasContent:v30];
            if (v21) {
              [v9 addObject:v21];
            }
          }
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v27 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      uint64_t v11 = v27;
    }
    while (v27);
  }

  v28 = (void *)[objc_alloc(MEMORY[0x1E4FA9DA0]) initWithMediaItems:v9 index:0 isCollection:0];
  return v28;
}

- (id)playlistForIKMediaElements:(id)a3 isExtrasContent:(BOOL)a4
{
  return [(VUIIKPlaylistElementToMediaItemsMapper *)self playlistForIKMediaElements:a3 withMediaItem:0 isExtrasContent:a4];
}

- (id)_storeMediaItemsForAdamID:(int64_t)a3 IKMediaElement:(id)a4
{
  id v6 = a4;
  id v7 = [v6 assets];
  id v8 = [v7 firstObject];

  id v9 = [[VUIStoreMediaItem_iOS alloc] initWithAdamID:a3 videoManagedObject:0 isForStartingDownload:0];
  uint64_t v10 = objc_msgSend(v8, "vui_fpsCertificateURL");
  [(VUIStoreMediaItem_iOS *)v9 setFpsCertificateURL:v10];

  uint64_t v11 = objc_msgSend(v8, "vui_fpsKeyServerURL");
  [(VUIStoreMediaItem_iOS *)v9 setFpsKeyServerURL:v11];

  uint64_t v12 = [(VUIStoreMediaItem_iOS *)v9 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FB0]];
  uint64_t v13 = +[VUIMetricsController sharedInstance];
  v14 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a3];
  v15 = [v13 iTunesLibraryPlaybackMediaMetricsForAdamID:v14 mediaType:v12];

  [(VUIStoreMediaItem_iOS *)v9 setMediaItemMetadata:v15 forProperty:*MEMORY[0x1E4FA9FA8]];
  v16 = +[VUIMetricsController sharedInstance];
  v17 = [v16 iTunesVPAF];
  [(VUIStoreMediaItem_iOS *)v9 setMediaItemMetadata:v17 forProperty:*MEMORY[0x1E4FAA108]];

  uint64_t v18 = objc_msgSend(v8, "vui_resumeTime");
  if (v18)
  {
    v19 = [VUIMediaStartTimeInfo alloc];
    v20 = [MEMORY[0x1E4F1C9C8] date];
    v21 = [(VUIMediaStartTimeInfo *)v19 initWithStartTime:v18 timestamp:v20 type:0 source:@"ITML/XML"];

    v22 = [(VUIBaseMediaItem *)v9 startTimeCollection];
    [v22 addStartTimeInfo:v21];
  }
  if (objc_msgSend(v8, "vui_disableLocalAsset")) {
    [(VUIStoreMediaItem_iOS *)v9 setMediaItemMetadata:MEMORY[0x1E4F1CC38] forProperty:*MEMORY[0x1E4FA9F10]];
  }
  uint64_t v23 = [(VUIIKPlaylistElementToMediaItemsMapper *)self _createClipMediaItemsIfTimeExists:v9 fromMediaElement:v6];

  return v23;
}

- (id)_storeAuxMediaItemForIKMediaElement:(id)a3 isExtrasContent:(BOOL)a4
{
  id v5 = a3;
  id v6 = [v5 assets];
  id v7 = [v6 firstObject];

  id v8 = [VUIStoreAuxMediaItem alloc];
  id v9 = [v7 url];
  uint64_t v10 = [(VUIStoreAuxMediaItem *)v8 initWithURL:v9];

  uint64_t v11 = objc_msgSend(v7, "vui_fpsCertificateURL");
  [(VUIStoreAuxMediaItem *)v10 setFpsCertificateURL:v11];

  uint64_t v12 = objc_msgSend(v7, "vui_fpsKeyServerURL");
  [(VUIStoreAuxMediaItem *)v10 setFpsKeyServerURL:v12];

  objc_opt_class();
  [(VUIStoreAuxMediaItem *)v10 setIsAudioOnly:objc_opt_isKindOfClass() & 1];
  uint64_t v13 = [v7 bookmarkID];
  [(VUIStoreAuxMediaItem *)v10 setBookmarkID:v13];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __94__VUIIKPlaylistElementToMediaItemsMapper__storeAuxMediaItemForIKMediaElement_isExtrasContent___block_invoke;
  v20[3] = &unk_1E6DF4ED0;
  v14 = v10;
  v21 = v14;
  id v22 = v7;
  id v23 = v5;
  BOOL v24 = a4;
  id v15 = v5;
  id v16 = v7;
  [(TVPBaseMediaItem *)v14 performMediaItemMetadataTransactionWithBlock:v20];
  v17 = v23;
  uint64_t v18 = v14;

  return v18;
}

void __94__VUIIKPlaylistElementToMediaItemsMapper__storeAuxMediaItemForIKMediaElement_isExtrasContent___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  objc_super v3 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  id v4 = objc_msgSend(v3, "ams_activeiTunesAccount");
  id v5 = objc_msgSend(v4, "ams_DSID");
  [v2 setMediaItemMetadata:v5 forProperty:*MEMORY[0x1E4FA9E70]];

  id v6 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) adamID];
  [v6 setMediaItemMetadata:v7 forProperty:*MEMORY[0x1E4FAA0D8]];

  id v8 = *(void **)(a1 + 32);
  id v9 = [*(id *)(a1 + 40) externalID];
  [v8 setMediaItemMetadata:v9 forProperty:*MEMORY[0x1E4FA9ED8]];

  uint64_t v10 = *(void **)(a1 + 32);
  uint64_t v11 = objc_msgSend(*(id *)(a1 + 48), "vui_title");
  [v10 setMediaItemMetadata:v11 forProperty:*MEMORY[0x1E4FAA0E8]];

  uint64_t v12 = *(void **)(a1 + 32);
  uint64_t v13 = objc_msgSend(*(id *)(a1 + 48), "vui_imageURL");
  v14 = [v13 absoluteString];
  [v12 setMediaItemMetadata:v14 forProperty:*MEMORY[0x1E4FA9E08]];

  id v15 = *(void **)(a1 + 32);
  id v16 = objc_msgSend(*(id *)(a1 + 48), "vui_description");
  [v15 setMediaItemMetadata:v16 forProperty:*MEMORY[0x1E4FA9F90]];

  id v22 = [*(id *)(a1 + 40) serviceID];
  if (![(__CFString *)v22 length] && *(unsigned char *)(a1 + 56))
  {

    id v22 = @"com.apple.itunes.extras";
  }
  [*(id *)(a1 + 32) setMediaItemMetadata:v22 forProperty:*MEMORY[0x1E4FAA070]];
  v17 = objc_msgSend(*(id *)(a1 + 40), "vui_resumeTime");
  if (v17)
  {
    uint64_t v18 = [VUIMediaStartTimeInfo alloc];
    v19 = [MEMORY[0x1E4F1C9C8] date];
    v20 = [(VUIMediaStartTimeInfo *)v18 initWithStartTime:v17 timestamp:v19 type:0 source:@"ITML/XML"];

    v21 = [*(id *)(a1 + 32) startTimeCollection];
    [v21 addStartTimeInfo:v20];
  }
}

- (id)_createClipMediaItemsIfTimeExists:(id)a3 fromMediaElement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CA48] array];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v7 timelines];
    uint64_t v10 = [v9 firstObject];

    if (v10)
    {
      if (v6)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v6 setBookmarkDisabled:1];
        }
      }
      uint64_t v11 = [(VUIIKPlaylistElementToMediaItemsMapper *)self _clipMediaItemsMediaItem:v6 fromTimelineElement:v10];
      if ([v11 count]) {
        [v8 addObjectsFromArray:v11];
      }
    }
    else
    {
      [v8 addObject:v6];
    }
  }
  return v8;
}

- (id)_clipMediaItemsMediaItem:(id)a3 fromTimelineElement:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 events];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    uint64_t v10 = objc_opt_new();
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v24 = v7;
    id obj = [v7 events];
    uint64_t v11 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v27 != v13) {
            objc_enumerationMutation(obj);
          }
          id v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          [v15 offset];
          double v17 = v16;
          [v15 duration];
          double v19 = v18;
          id v20 = objc_alloc(MEMORY[0x1E4FA9D40]);
          v21 = (void *)[objc_alloc(MEMORY[0x1E4FA9DB0]) initWithStartTime:v17 duration:v19];
          id v22 = (void *)[v20 initWithMediaItem:v6 clipTimeRange:v21];

          [(VUIIKPlaylistElementToMediaItemsMapper *)self _populateMediaItem:v22 withMetadatafromTimelineEventElement:v15];
          [v10 addObject:v22];
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v12);
    }

    id v7 = v24;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)_populateMediaItem:(id)a3 withMetadatafromVideoElement:(id)a4
{
  id v6 = a3;
  id v7 = [a4 relatedContent];
  [(VUIIKPlaylistElementToMediaItemsMapper *)self _populateMediaItem:v6 withMetadatafromRelatedContentElement:v7];
}

- (void)_populateMediaItem:(id)a3 withMetadatafromTimelineEventElement:(id)a4
{
  id v6 = a3;
  id v7 = [a4 relatedContent];
  [(VUIIKPlaylistElementToMediaItemsMapper *)self _populateMediaItem:v6 withMetadatafromRelatedContentElement:v7];
}

- (void)_populateMediaItem:(id)a3 withMetadatafromRelatedContentElement:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  v47 = v5;
  char isKindOfClass = objc_opt_isKindOfClass();
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v36 = v6;
  id obj = [v6 children];
  uint64_t v8 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v53;
    uint64_t v11 = *MEMORY[0x1E4F6EEA8];
    uint64_t v12 = *MEMORY[0x1E4F6EF58];
    uint64_t v46 = *MEMORY[0x1E4F6EE30];
    uint64_t v44 = *MEMORY[0x1E4F6EE78];
    uint64_t v42 = *MEMORY[0x1E4FA9E08];
    uint64_t v43 = *MEMORY[0x1E4FA9F90];
    uint64_t v45 = *MEMORY[0x1E4FAA0E8];
    uint64_t v37 = *MEMORY[0x1E4F6EEA8];
    uint64_t v38 = *(void *)v53;
    do
    {
      uint64_t v13 = 0;
      uint64_t v39 = v9;
      do
      {
        if (*(void *)v53 != v10) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v52 + 1) + 8 * v13);
        id v15 = [v14 elementName];
        int v16 = [v15 isEqualToString:v11];

        if (v16)
        {
          uint64_t v41 = v13;
          long long v50 = 0u;
          long long v51 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          double v17 = [v14 children];
          uint64_t v18 = [v17 countByEnumeratingWithState:&v48 objects:v56 count:16];
          if (!v18) {
            goto LABEL_25;
          }
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v49;
          while (1)
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v49 != v20) {
                objc_enumerationMutation(v17);
              }
              id v22 = *(void **)(*((void *)&v48 + 1) + 8 * i);
              id v23 = [v22 elementName];
              int v24 = [v23 isEqualToString:v12];

              if (v24)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  continue;
                }
                v25 = [v22 text];
                long long v26 = [v25 string];

                long long v27 = v47;
                long long v28 = v26;
                uint64_t v29 = v45;
                goto LABEL_15;
              }
              if (isKindOfClass)
              {
                BOOL v30 = [v22 elementName];
                int v31 = [v30 isEqualToString:v46];

                if (v31)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    long long v32 = [v22 text];
                    long long v26 = [v32 string];

                    long long v27 = v47;
                    long long v28 = v26;
                    uint64_t v29 = v43;
LABEL_15:
                    [v27 setMediaItemMetadata:v28 forProperty:v29];

                    continue;
                  }
                }
                else
                {
                  long long v33 = [v22 elementName];
                  int v34 = [v33 isEqualToString:v44];

                  if (v34)
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v35 = [v22 url];
                      long long v26 = [v35 absoluteString];

                      long long v27 = v47;
                      long long v28 = v26;
                      uint64_t v29 = v42;
                      goto LABEL_15;
                    }
                  }
                }
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v48 objects:v56 count:16];
            if (!v19)
            {
LABEL_25:

              uint64_t v11 = v37;
              uint64_t v10 = v38;
              uint64_t v9 = v39;
              uint64_t v13 = v41;
              break;
            }
          }
        }
        ++v13;
      }
      while (v13 != v9);
      uint64_t v9 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
    }
    while (v9);
  }
}

- (unint64_t)resumeMenuBehavior
{
  return self->_resumeMenuBehavior;
}

- (void)setResumeMenuBehavior:(unint64_t)a3
{
  self->_resumeMenuBehavior = a3;
}

@end