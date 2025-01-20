@interface VUIPlaybackReporterVPAFPlaylist
- (BOOL)isLive;
- (NSArray)eventData;
- (NSArray)items;
- (TVPPlayback)player;
- (VUIPlaybackReporterVPAFPlaylist)initWithPlayer:(id)a3;
- (id)itemAtOverallPosition:(unint64_t)a3 rangeOptions:(int64_t)a4;
- (id)itemsBetweenStartOverallPosition:(unint64_t)a3 endOverallPosition:(unint64_t)a4;
- (void)setEventData:(id)a3;
- (void)setIsLive:(BOOL)a3;
- (void)setItems:(id)a3;
- (void)setPlayer:(id)a3;
@end

@implementation VUIPlaybackReporterVPAFPlaylist

- (VUIPlaybackReporterVPAFPlaylist)initWithPlayer:(id)a3
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v88.receiver = self;
  v88.super_class = (Class)VUIPlaybackReporterVPAFPlaylist;
  v5 = [(VUIPlaybackReporterVPAFPlaylist *)&v88 init];
  if (!v5) {
    goto LABEL_45;
  }
  v6 = [v4 currentMediaItem];
  v7 = [v6 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA108]];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ![(NSArray *)v7 count])
  {
    v27 = VUIDefaultLogObject();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v27, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAFPlaylist - Media item lacks valid VPAF dictionary. Will not track.", buf, 2u);
    }

    v28 = 0;
    goto LABEL_46;
  }
  v8 = VUIDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v93 = v7;
    _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAFPlaylist - Media item has VPAF dictionary. Will track. %@", buf, 0xCu);
  }

  v9 = [MEMORY[0x1E4F1CA60] dictionary];
  objc_storeWeak((id *)&v5->_player, v4);
  uint64_t v10 = [v6 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E28]];
  uint64_t v11 = [v6 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA080]];
  uint64_t v12 = [v6 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA058]];
  [(NSArray *)v9 addEntriesFromDictionary:v7];
  [(NSArray *)v9 vui_setObjectIfNotNil:v10 forKey:@"featureCanonicalId"];
  v13 = [v6 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA008]];
  [(NSArray *)v9 vui_setObjectIfNotNil:v13 forKey:@"featureReferenceId"];

  v14 = [v6 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9ED8]];
  [(NSArray *)v9 vui_setObjectIfNotNil:v14 forKey:@"featureExternalId"];

  v15 = [v6 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E10]];
  [(NSArray *)v9 vui_setObjectIfNotNil:v15 forKey:@"brandId"];

  uint64_t v73 = [v6 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0D8]];
  -[NSArray vui_setObjectIfNotNil:forKey:](v9, "vui_setObjectIfNotNil:forKey:");
  [(NSArray *)v9 vui_setObjectIfNotNil:v11 forKey:@"canonicalShowId"];
  v76 = (void *)v12;
  [(NSArray *)v9 vui_setObjectIfNotNil:v12 forKey:@"canonicalSeasonId"];
  v16 = +[VUIMetricsJetEngine sharedInstance];
  v75 = (void *)v10;
  v74 = (void *)v11;
  if (([v16 isSharedContent:v10] & 1) == 0)
  {
    v17 = +[VUIMetricsJetEngine sharedInstance];
    if (![v17 isSharedContent:v11])
    {
      v66 = +[VUIMetricsJetEngine sharedInstance];
      char v67 = [v66 isSharedContent:v76];

      if ((v67 & 1) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
LABEL_10:
  v18 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
  [(NSArray *)v9 setObject:v18 forKey:@"sharedContent"];

LABEL_11:
  BOOL v19 = +[VUIPlaybackUtilities playerIsLive:v4];
  v5->_isLive = v19;
  if (v19)
  {
    [(NSArray *)v9 setObject:@"live" forKeyedSubscript:@"programmingType"];
    v20 = [(NSArray *)v9 objectForKey:@"serviceId"];

    if (!v20)
    {
      v21 = [v6 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9F80]];
      [(NSArray *)v9 vui_setObjectIfNotNil:v21 forKey:@"serviceId"];
    }
    v22 = [[VUIPlaybackReporterVPAFPlaylistItem alloc] initWithPosition:0 duration:-1 eventData:0];
    v91 = v22;
    uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v91 count:1];
    items = v5->_items;
    v5->_items = (NSArray *)v23;
    v26 = (void *)v73;
    v25 = v74;
    goto LABEL_40;
  }
  v69 = v7;
  v71 = v5;
  id v72 = v4;
  [v4 duration];
  unint64_t v30 = vcvtad_u64_f64(v29 * 1000.0);
  v68 = [v6 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9F00]];
  [(VUIPlaybackReporterVPAFPlaylistItem *)v68 doubleValue];
  unint64_t v32 = vcvtad_u64_f64(v31 * 1000.0);
  [(NSArray *)v9 setObject:@"videoOnDemand" forKeyedSubscript:@"programmingType"];
  v33 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v30];
  [(NSArray *)v9 setObject:v33 forKeyedSubscript:@"overallLength"];

  objc_msgSend(MEMORY[0x1E4F28E60], "indexSetWithIndexesInRange:", v32, v30 - v32);
  v79 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v78 = [MEMORY[0x1E4F1CA48] array];
  v70 = v6;
  [v6 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA038]];
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v34 = [obj countByEnumeratingWithState:&v84 objects:v90 count:16];
  if (!v34) {
    goto LABEL_37;
  }
  uint64_t v35 = v34;
  uint64_t v80 = *(void *)v85;
  do
  {
    for (uint64_t i = 0; i != v35; ++i)
    {
      if (*(void *)v85 != v80) {
        objc_enumerationMutation(obj);
      }
      v37 = *(void **)(*((void *)&v84 + 1) + 8 * i);
      id v38 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v39 = [v37 adamID];
      v40 = [v37 dynamicSlotDataSetId];
      if (v39) {
        [v38 setObject:v39 forKeyedSubscript:@"assetId"];
      }
      if (v40) {
        [v38 setObject:v40 forKeyedSubscript:@"data.dynamicSlot.dataSetId"];
      }
      v41 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v37, "isSkippable"));
      [v38 setObject:v41 forKeyedSubscript:@"isSkippable"];

      v42 = @"unknown";
      uint64_t v43 = [v37 type];
      v44 = @"preroll";
      if (v43 == 1) {
        goto LABEL_32;
      }
      if (v43 == 3)
      {
        v44 = @"postroll";
LABEL_32:
        v45 = v44;

        v42 = v45;
        goto LABEL_33;
      }
      v44 = @"midroll";
      if (v43 == 2) {
        goto LABEL_32;
      }
LABEL_33:
      [v38 setObject:v42 forKeyedSubscript:@"assetPlacement"];
      v46 = [VUIPlaybackReporterVPAFPlaylistItem alloc];
      [v37 start];
      unint64_t v48 = vcvtad_u64_f64(v47 * 1000.0);
      [v37 duration];
      v50 = [(VUIPlaybackReporterVPAFPlaylistItem *)v46 initWithPosition:v48 duration:vcvtad_u64_f64(v49 * 1000.0) eventData:v38];
      v51 = v50;
      if (v50)
      {
        uint64_t v52 = [(VUIPlaybackReporterVPAFPlaylistItem *)v50 timeRange];
        -[NSArray removeIndexesInRange:](v79, "removeIndexesInRange:", v52, v53);
        [v78 addObject:v51];
      }
    }
    uint64_t v35 = [obj countByEnumeratingWithState:&v84 objects:v90 count:16];
  }
  while (v35);
LABEL_37:
  v54 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(NSArray *)v54 setObject:@"feature" forKeyedSubscript:@"assetPlacement"];
  v26 = (void *)v73;
  [(NSArray *)v54 vui_setObjectIfNotNil:v73 forKey:@"assetId"];
  v55 = VUIDefaultLogObject();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v93 = v54;
    _os_log_impl(&dword_1E2BD7000, v55, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAFPlaylist - Feature metrics: %@", buf, 0xCu);
  }

  v81[0] = MEMORY[0x1E4F143A8];
  v81[1] = 3221225472;
  v81[2] = __50__VUIPlaybackReporterVPAFPlaylist_initWithPlayer___block_invoke;
  v81[3] = &unk_1E6DFACE0;
  v82 = v54;
  v56 = v78;
  v83 = v56;
  v57 = v54;
  [(NSArray *)v79 enumerateRangesUsingBlock:v81];
  v5 = v71;
  v58 = v71->_items;
  v71->_items = v56;
  v59 = v56;

  items = v79;
  id v4 = v72;
  v7 = v69;
  v6 = v70;
  v22 = v68;
  v25 = v74;
LABEL_40:

  v89 = v9;
  uint64_t v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v89 count:1];
  eventData = v5->_eventData;
  v5->_eventData = (NSArray *)v60;

  v62 = VUIDefaultLogObject();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
  {
    v63 = v5->_items;
    *(_DWORD *)buf = 138412290;
    v93 = v63;
    _os_log_impl(&dword_1E2BD7000, v62, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAFPlaylist - Parsed items: %@", buf, 0xCu);
  }

  v64 = VUIDefaultLogObject();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v93 = v9;
    _os_log_impl(&dword_1E2BD7000, v64, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAFPlaylist - Playlist metrics: %@", buf, 0xCu);
  }

LABEL_45:
  v28 = v5;
LABEL_46:

  return v28;
}

void __50__VUIPlaybackReporterVPAFPlaylist_initWithPlayer___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = [[VUIPlaybackReporterVPAFPlaylistItem alloc] initWithPosition:a2 duration:a3 eventData:*(void *)(a1 + 32)];
  if (v4)
  {
    v5 = v4;
    [*(id *)(a1 + 40) addObject:v4];
    id v4 = v5;
  }
}

- (id)itemAtOverallPosition:(unint64_t)a3 rangeOptions:(int64_t)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v6 = [(VUIPlaybackReporterVPAFPlaylist *)self items];
  v7 = [v6 firstObject];

  v8 = [(VUIPlaybackReporterVPAFPlaylist *)self player];
  v9 = [v8 currentMediaItem];
  uint64_t v10 = [v9 mediaItemMetadataForProperty:@"VUIMediaItemMetadataClipId"];
  uint64_t v11 = [v9 mediaItemMetadataForProperty:@"VUIMediaItemMetadataClipDuration"];
  if (![(VUIPlaybackReporterVPAFPlaylist *)self isLive]
    || ([v10 length] ? (BOOL v12 = v11 == 0) : (BOOL v12 = 1), v12))
  {
    if (![(VUIPlaybackReporterVPAFPlaylist *)self isLive])
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      v13 = [(VUIPlaybackReporterVPAFPlaylist *)self items];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        unint64_t v32 = v10;
        uint64_t v16 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v34 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            unint64_t v19 = [v18 timeRange];
            if (a3 >= v19 && a3 - v19 < v20)
            {
              unint64_t v30 = v18;

              v7 = v30;
              goto LABEL_24;
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v33 objects:v37 count:16];
        }
        while (v15);
LABEL_24:
        uint64_t v10 = v32;
      }
    }
    v7 = v7;
    double v29 = v7;
  }
  else
  {
    v22 = [MEMORY[0x1E4F1CA60] dictionary];
    objc_msgSend(v22, "vui_setObjectIfNotNil:forKey:", *MEMORY[0x1E4F71880], @"assetPlacement");
    objc_msgSend(v22, "vui_setObjectIfNotNil:forKey:", @"CatchUpToLive", @"extraType");
    uint64_t v23 = VUIDefaultLogObject();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v39 = v10;
      __int16 v40 = 2112;
      v41 = v22;
      _os_log_impl(&dword_1E2BD7000, v23, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAFPlaylist - Clip (%@) metadata %@", buf, 0x16u);
    }

    v25 = [VUIPlaybackReporterVPAFPlaylistItem alloc];
    [v11 doubleValue];
    unint64_t v27 = (unint64_t)(v26 * 1000.0);
    v28 = (void *)[v22 copy];
    double v29 = [(VUIPlaybackReporterVPAFPlaylistItem *)v25 initWithPosition:0 duration:v27 eventData:v28];
  }
  return v29;
}

- (id)itemsBetweenStartOverallPosition:(unint64_t)a3 endOverallPosition:(unint64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (![(VUIPlaybackReporterVPAFPlaylist *)self isLive])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    if (a4 >= a3) {
      NSUInteger v8 = a4 - a3;
    }
    else {
      NSUInteger v8 = a3 - a4;
    }
    if (a4 >= a3) {
      a4 = a3;
    }
    *((void *)&v17 + 1) = 0;
    long long v18 = 0uLL;
    v9 = [(VUIPlaybackReporterVPAFPlaylist *)self items];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          v25.location = [v14 timeRange];
          v25.length = v15;
          v24.location = a4;
          v24.length = v8;
          if (NSIntersectionRange(v24, v25).length) {
            [v7 addObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }
  }
  return v7;
}

- (NSArray)eventData
{
  return self->_eventData;
}

- (void)setEventData:(id)a3
{
}

- (TVPPlayback)player
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_player);
  return (TVPPlayback *)WeakRetained;
}

- (void)setPlayer:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (BOOL)isLive
{
  return self->_isLive;
}

- (void)setIsLive:(BOOL)a3
{
  self->_isLive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_destroyWeak((id *)&self->_player);
  objc_storeStrong((id *)&self->_eventData, 0);
}

@end