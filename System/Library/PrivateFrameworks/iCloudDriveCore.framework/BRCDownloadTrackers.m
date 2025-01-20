@interface BRCDownloadTrackers
- (BRCAccountSessionFPFS)session;
- (BRCDownloadTrackers)initWithSession:(id)a3;
- (id)trackedFileObjectIDs;
- (void)addDownloadTracker:(id)a3 forFileObjectID:(id)a4 withEtagIfLoser:(id)a5;
- (void)document:(id)a3 didCompleteDownloadEtagIfLoser:(id)a4 kind:(int)a5 withError:(id)a6;
- (void)removeDownloadTracker:(id)a3;
@end

@implementation BRCDownloadTrackers

- (BRCDownloadTrackers)initWithSession:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BRCDownloadTrackers;
  v5 = [(BRCDownloadTrackers *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_session, v4);
  }

  return v6;
}

- (id)trackedFileObjectIDs
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(NSMutableDictionary *)v2->_trackersByFileObjectID allKeys];
  objc_sync_exit(v2);

  return v3;
}

- (void)addDownloadTracker:(id)a3 forFileObjectID:(id)a4 withEtagIfLoser:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  objc_sync_enter(v11);
  v12 = brc_bread_crumbs();
  v13 = brc_notifications_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v22 = 134219010;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 2112;
    id v29 = v10;
    __int16 v30 = 2112;
    v31 = v12;
    _os_log_debug_impl(&dword_23FA42000, v13, OS_LOG_TYPE_DEBUG, "[NOTIF] addDownloadTracker %p %@ forFileObjectID %@ withEtagIfLoser %@%@", (uint8_t *)&v22, 0x34u);
  }

  if (!v11->_trackersByFileObjectID)
  {
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    trackersByFileObjectID = v11->_trackersByFileObjectID;
    v11->_trackersByFileObjectID = v14;
  }
  v16 = +[BRCTrackedVersion trackedVersionFor:withEtagIfLoser:kind:](BRCTrackedVersion, "trackedVersionFor:withEtagIfLoser:kind:", v9, v10, [v8 kind]);
  id v17 = [(NSMutableDictionary *)v11->_trackersByFileObjectID objectForKeyedSubscript:v16];
  if (!v17)
  {
    id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(NSMutableDictionary *)v11->_trackersByFileObjectID setObject:v17 forKeyedSubscript:v16];
  }
  [v17 addObject:v8];
  fileObjectIDsByTracker = v11->_fileObjectIDsByTracker;
  if (!fileObjectIDsByTracker)
  {
    uint64_t v19 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    v20 = v11->_fileObjectIDsByTracker;
    v11->_fileObjectIDsByTracker = (NSMapTable *)v19;

    fileObjectIDsByTracker = v11->_fileObjectIDsByTracker;
  }
  id v21 = [(NSMapTable *)fileObjectIDsByTracker objectForKey:v8];
  if (!v21)
  {
    id v21 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(NSMapTable *)v11->_fileObjectIDsByTracker setObject:v21 forKey:v8];
  }
  [v21 addObject:v16];

  objc_sync_exit(v11);
}

- (void)removeDownloadTracker:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = brc_bread_crumbs();
  v7 = brc_notifications_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    [(BRCDownloadTrackers *)(uint64_t)v4 removeDownloadTracker:v7];
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = -[NSMapTable objectForKey:](v5->_fileObjectIDsByTracker, "objectForKey:", v4, 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v13 = [(NSMutableDictionary *)v5->_trackersByFileObjectID objectForKeyedSubscript:v12];
        [v13 removeObject:v4];
        if (![v13 count]) {
          [(NSMutableDictionary *)v5->_trackersByFileObjectID removeObjectForKey:v12];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  if (![(NSMutableDictionary *)v5->_trackersByFileObjectID count])
  {
    trackersByFileObjectID = v5->_trackersByFileObjectID;
    v5->_trackersByFileObjectID = 0;
  }
  [(NSMapTable *)v5->_fileObjectIDsByTracker removeObjectForKey:v4];
  if (![(NSMapTable *)v5->_fileObjectIDsByTracker count])
  {
    fileObjectIDsByTracker = v5->_fileObjectIDsByTracker;
    v5->_fileObjectIDsByTracker = 0;
  }
  objc_sync_exit(v5);
}

- (void)document:(id)a3 didCompleteDownloadEtagIfLoser:(id)a4 kind:(int)a5 withError:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [v10 fileObjectID];
  if (v13
    || ([v10 orig],
        v14 = objc_claimAutoreleasedReturnValue(),
        [v14 fileObjectID],
        v13 = objc_claimAutoreleasedReturnValue(),
        v14,
        v13))
  {
    v15 = self;
    objc_sync_enter(v15);
    trackersByFileObjectID = v15->_trackersByFileObjectID;
    long long v17 = +[BRCTrackedVersion trackedVersionFor:v13 withEtagIfLoser:v11 kind:v7];
    long long v18 = [(NSMutableDictionary *)trackersByFileObjectID objectForKeyedSubscript:v17];
    long long v19 = (void *)[v18 copy];

    objc_sync_exit(v15);
    if (v19)
    {
      v20 = brc_bread_crumbs();
      uint64_t v21 = brc_notifications_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138413058;
        id v32 = v10;
        __int16 v33 = 2112;
        id v34 = v11;
        __int16 v35 = 2112;
        id v36 = v12;
        __int16 v37 = 2112;
        v38 = v20;
        _os_log_debug_impl(&dword_23FA42000, v21, OS_LOG_TYPE_DEBUG, "[NOTIF] document %@ didCompleteDownloadEtagIfLoser %@ withError %@ -- notifying trackers%@", buf, 0x2Au);
      }
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v22 = v19;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v27;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v27 != v24) {
            objc_enumerationMutation(v22);
          }
          objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * v25++), "downloadTrackedForFileObjectID:withEtagIfLoser:didFinishWithError:", v13, v11, v12, (void)v26);
        }
        while (v23 != v25);
        uint64_t v23 = [v22 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v23);
    }
  }
}

- (BRCAccountSessionFPFS)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  return (BRCAccountSessionFPFS *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileObjectIDsByTracker, 0);
  objc_storeStrong((id *)&self->_trackersByFileObjectID, 0);
  objc_destroyWeak((id *)&self->_session);
}

- (void)removeDownloadTracker:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 134218498;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_23FA42000, log, OS_LOG_TYPE_DEBUG, "[NOTIF] Removing download tracker %p %@%@", (uint8_t *)&v3, 0x20u);
}

@end