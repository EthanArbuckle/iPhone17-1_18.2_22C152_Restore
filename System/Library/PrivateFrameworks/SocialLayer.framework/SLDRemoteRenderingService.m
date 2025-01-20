@interface SLDRemoteRenderingService
+ (id)remoteObjectProtocol;
+ (id)sharedService;
- (BOOL)_hasConnections;
- (NSMapTable)connectionViewIDs;
- (NSMapTable)viewIDConnections;
- (NSMapTable)viewIdentifierMap;
- (NSMutableArray)viewLRUCache;
- (SLDRemoteRenderingService)init;
- (id)_remoteContentForViewIdentifier:(id)a3 layerContextID:(unint64_t)a4 connection:(id)a5;
- (id)_viewIDForStyle:(id)a3 tag:(id)a4;
- (id)slotMachineForViewIdentifier:(id)a3;
- (void)_allConnectionsDisconnected;
- (void)_connection:(id)a3 doesNotNeedViewWithIdentifier:(id)a4;
- (void)_connection:(id)a3 onlyNeedsViewWithIdentifier:(id)a4;
- (void)_connectionTouchedView:(id)a3;
- (void)_destroyViewWithID:(id)a3;
- (void)lostConnection:(id)a3;
- (void)receivedConnection:(id)a3;
- (void)setConnectionViewIDs:(id)a3;
- (void)setViewIDConnections:(id)a3;
- (void)setViewIdentifierMap:(id)a3;
- (void)setViewLRUCache:(id)a3;
@end

@implementation SLDRemoteRenderingService

- (SLDRemoteRenderingService)init
{
  v12.receiver = self;
  v12.super_class = (Class)SLDRemoteRenderingService;
  v2 = [(SLDRemoteRenderingService *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    connectionViewIDs = v2->_connectionViewIDs;
    v2->_connectionViewIDs = (NSMapTable *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    viewIDConnections = v2->_viewIDConnections;
    v2->_viewIDConnections = (NSMapTable *)v5;

    uint64_t v7 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    viewIdentifierMap = v2->_viewIdentifierMap;
    v2->_viewIdentifierMap = (NSMapTable *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    viewLRUCache = v2->_viewLRUCache;
    v2->_viewLRUCache = (NSMutableArray *)v9;
  }
  return v2;
}

+ (id)remoteObjectProtocol
{
  return 0;
}

+ (id)sharedService
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__SLDRemoteRenderingService_sharedService__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedService_onceToken_7 != -1) {
    dispatch_once(&sharedService_onceToken_7, block);
  }
  v2 = (void *)sharedService_sService_7;
  return v2;
}

uint64_t __42__SLDRemoteRenderingService_sharedService__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v1 = sharedService_sService_7;
  sharedService_sService_7 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)receivedConnection:(id)a3
{
  id v4 = a3;
  id v6 = [(SLDRemoteRenderingService *)self connectionViewIDs];
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  [v6 setObject:v5 forKey:v4];
}

- (void)lostConnection:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SLDRemoteRenderingService *)self connectionViewIDs];
  id v6 = [v5 objectForKey:v4];
  uint64_t v7 = (void *)[v6 copy];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        -[SLDRemoteRenderingService _connection:doesNotNeedViewWithIdentifier:](self, "_connection:doesNotNeedViewWithIdentifier:", v4, *(void *)(*((void *)&v14 + 1) + 8 * v12++), (void)v14);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  v13 = [(SLDRemoteRenderingService *)self connectionViewIDs];
  [v13 removeObjectForKey:v4];

  if (![(SLDRemoteRenderingService *)self _hasConnections]) {
    [(SLDRemoteRenderingService *)self _allConnectionsDisconnected];
  }
}

- (BOOL)_hasConnections
{
  v2 = [(SLDRemoteRenderingService *)self connectionViewIDs];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)_allConnectionsDisconnected
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  BOOL v3 = SLDaemonLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = self;
    _os_log_impl(&dword_19BE17000, v3, OS_LOG_TYPE_INFO, "[%@] All connections have disconnected. Clearing tracking objects and niling out slot machines.", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [(SLDRemoteRenderingService *)self connectionViewIDs];
  [v4 removeAllObjects];

  [(NSMapTable *)self->_viewIDConnections removeAllObjects];
  [(NSMapTable *)self->_viewIdentifierMap removeAllObjects];
}

- (void)_connection:(id)a3 doesNotNeedViewWithIdentifier:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = SLDaemonLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412802;
    long long v14 = self;
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_19BE17000, v8, OS_LOG_TYPE_DEFAULT, "[%@] Connection [%@] does not need viewID with identifier: %@", (uint8_t *)&v13, 0x20u);
  }

  uint64_t v9 = [(SLDRemoteRenderingService *)self viewIDConnections];
  uint64_t v10 = [v9 objectForKey:v7];

  uint64_t v11 = [(SLDRemoteRenderingService *)self connectionViewIDs];
  uint64_t v12 = [v11 objectForKey:v6];

  [v10 removeObject:v6];
  [v12 removeObject:v7];
  if (!v10 || ![v10 count]) {
    [(SLDRemoteRenderingService *)self _destroyViewWithID:v7];
  }
}

- (void)_connection:(id)a3 onlyNeedsViewWithIdentifier:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SLDRemoteRenderingService *)self connectionViewIDs];
  uint64_t v9 = [v8 objectForKey:v6];
  uint64_t v10 = (void *)[v9 copy];

  if ([v10 count])
  {
    uint64_t v11 = SLDaemonLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v24 = self;
      __int16 v25 = 2112;
      id v26 = v6;
      __int16 v27 = 2112;
      id v28 = v7;
      _os_log_impl(&dword_19BE17000, v11, OS_LOG_TYPE_DEFAULT, "[%@] Connection [%@] only needs view with ID: %@", buf, 0x20u);
    }

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          __int16 v17 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if ((objc_msgSend(v17, "isEqual:", v7, (void)v18) & 1) == 0) {
            [(SLDRemoteRenderingService *)self _connection:v6 doesNotNeedViewWithIdentifier:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v14);
    }
  }
}

- (void)_connectionTouchedView:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(SLDRemoteRenderingService *)self viewLRUCache];
  [v5 removeObject:v4];

  id v6 = [(SLDRemoteRenderingService *)self viewLRUCache];
  [v6 addObject:v4];

  id v7 = SLDaemonLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[SLDRemoteRenderingService _connectionTouchedView:](self, v7);
  }

  id v8 = [(SLDRemoteRenderingService *)self viewLRUCache];
  unint64_t v9 = [v8 count];

  if (v9 >= 0x21)
  {
    uint64_t v10 = SLDaemonLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[SLDRemoteRenderingService _connectionTouchedView:]((uint64_t)self, v10);
    }
  }
  uint64_t v11 = [(SLDRemoteRenderingService *)self viewLRUCache];
  unint64_t v12 = [v11 count];

  if (v12 >= 0x21)
  {
    do
    {
      uint64_t v13 = [(SLDRemoteRenderingService *)self viewLRUCache];
      uint64_t v14 = [v13 firstObject];

      uint64_t v15 = [(SLDRemoteRenderingService *)self viewIDConnections];
      id v16 = [v15 objectForKey:v14];
      __int16 v17 = (void *)[v16 copy];

      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v18 = v17;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v28;
        do
        {
          uint64_t v22 = 0;
          do
          {
            if (*(void *)v28 != v21) {
              objc_enumerationMutation(v18);
            }
            [(SLDRemoteRenderingService *)self _connection:*(void *)(*((void *)&v27 + 1) + 8 * v22++) doesNotNeedViewWithIdentifier:v14];
          }
          while (v20 != v22);
          uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v20);
      }

      v23 = [(SLDRemoteRenderingService *)self viewLRUCache];
      [v23 removeObject:v14];

      v24 = [(SLDRemoteRenderingService *)self viewLRUCache];
      unint64_t v25 = [v24 count];
    }
    while (v25 > 0x20);
  }
  if (v9 >= 0x21)
  {
    id v26 = SLDaemonLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      -[SLDRemoteRenderingService _connectionTouchedView:]((uint64_t)self, v26);
    }
  }
}

- (void)_destroyViewWithID:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = SLDaemonLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412546;
    v23 = self;
    __int16 v24 = 2112;
    id v25 = v4;
    _os_log_impl(&dword_19BE17000, v5, OS_LOG_TYPE_DEFAULT, "[%@] Releasing view no longer needed by any connection: %@", (uint8_t *)&v22, 0x16u);
  }

  id v6 = [(SLDRemoteRenderingService *)self slotMachineForViewIdentifier:v4];
  id v7 = [v4 style];
  id v8 = [v4 tag];
  [v6 removeContentForStyle:v7 tag:v8];

  unint64_t v9 = [(SLDRemoteRenderingService *)self viewIDConnections];
  [v9 removeObjectForKey:v4];

  uint64_t v10 = [(SLDRemoteRenderingService *)self viewLRUCache];
  [v10 removeObject:v4];

  viewIdentifierMap = self->_viewIdentifierMap;
  unint64_t v12 = [v4 style];
  uint64_t v13 = [(NSMapTable *)viewIdentifierMap objectForKey:v12];
  uint64_t v14 = [v4 tag];
  uint64_t v15 = [v13 objectForKey:v14];

  if (v15)
  {
    id v16 = self->_viewIdentifierMap;
    __int16 v17 = [v4 style];
    id v18 = [(NSMapTable *)v16 objectForKey:v17];

    uint64_t v19 = [v4 tag];
    [v18 removeObjectForKey:v19];

    if (![v18 count])
    {
      uint64_t v20 = self->_viewIdentifierMap;
      uint64_t v21 = [v4 style];
      [(NSMapTable *)v20 removeObjectForKey:v21];
    }
  }
}

- (id)_remoteContentForViewIdentifier:(id)a3 layerContextID:(unint64_t)a4 connection:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(SLDRemoteRenderingService *)self slotMachineForViewIdentifier:v8];
  uint64_t v11 = SLGeneralTelemetryLogHandle();
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  uint64_t v13 = SLGeneralTelemetryLogHandle();
  uint64_t v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(v26) = 0;
    _os_signpost_emit_with_name_impl(&dword_19BE17000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "SlotMachineRetrieveRemoteContent", "", (uint8_t *)&v26, 2u);
  }

  uint64_t v15 = [v8 style];
  id v16 = [v8 tag];
  __int16 v17 = [v10 remoteContentForLayerContextWithId:a4 style:v15 tag:v16];

  id v18 = SLGeneralTelemetryLogHandle();
  uint64_t v19 = v18;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    LOWORD(v26) = 0;
    _os_signpost_emit_with_name_impl(&dword_19BE17000, v19, OS_SIGNPOST_INTERVAL_END, v12, "SlotMachineRetrieveRemoteContent", "", (uint8_t *)&v26, 2u);
  }

  if (v17)
  {
    uint64_t v20 = [(SLDRemoteRenderingService *)self connectionViewIDs];
    uint64_t v21 = [v20 objectForKey:v9];

    if (([v21 containsObject:v8] & 1) == 0) {
      [v21 addObject:v8];
    }
    int v22 = [(SLDRemoteRenderingService *)self viewIDConnections];
    v23 = [v22 objectForKey:v8];

    if (!v23)
    {
      v23 = [MEMORY[0x1E4F1CA48] array];
      __int16 v24 = [(SLDRemoteRenderingService *)self viewIDConnections];
      [v24 setObject:v23 forKey:v8];
    }
    if (([v23 containsObject:v9] & 1) == 0) {
      [v23 addObject:v9];
    }
  }
  else
  {
    uint64_t v21 = SLDaemonLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v26 = 138412802;
      long long v27 = self;
      __int16 v28 = 2112;
      long long v29 = v10;
      __int16 v30 = 2112;
      id v31 = v8;
      _os_log_error_impl(&dword_19BE17000, v21, OS_LOG_TYPE_ERROR, "[%@] Slot machine [%@] did not return any rendered content for viewID: %@", (uint8_t *)&v26, 0x20u);
    }
  }

  return v17;
}

- (id)_viewIDForStyle:(id)a3 tag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SLDRemoteRenderingService *)self viewIdentifierMap];
  id v9 = [v8 objectForKey:v6];
  uint64_t v10 = [v9 objectForKey:v7];

  if (!v10)
  {
    uint64_t v11 = [(SLDRemoteRenderingService *)self viewIdentifierMap];
    os_signpost_id_t v12 = [v11 objectForKey:v6];

    if (!v12)
    {
      os_signpost_id_t v12 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
      uint64_t v13 = [(SLDRemoteRenderingService *)self viewIdentifierMap];
      [v13 setObject:v12 forKey:v6];
    }
    uint64_t v10 = +[SLDRemoteViewIdentifier identifierForStyle:v6 tag:v7];
    [v12 setObject:v10 forKey:v7];
  }
  return v10;
}

- (id)slotMachineForViewIdentifier:(id)a3
{
  return 0;
}

- (NSMapTable)connectionViewIDs
{
  return self->_connectionViewIDs;
}

- (void)setConnectionViewIDs:(id)a3
{
}

- (NSMapTable)viewIDConnections
{
  return self->_viewIDConnections;
}

- (void)setViewIDConnections:(id)a3
{
}

- (NSMapTable)viewIdentifierMap
{
  return self->_viewIdentifierMap;
}

- (void)setViewIdentifierMap:(id)a3
{
}

- (NSMutableArray)viewLRUCache
{
  return self->_viewLRUCache;
}

- (void)setViewLRUCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewLRUCache, 0);
  objc_storeStrong((id *)&self->_viewIdentifierMap, 0);
  objc_storeStrong((id *)&self->_viewIDConnections, 0);
  objc_storeStrong((id *)&self->_connectionViewIDs, 0);
}

- (void)_connectionTouchedView:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_19BE17000, a2, OS_LOG_TYPE_DEBUG, "[%@] Finished pruning lru cache.", (uint8_t *)&v2, 0xCu);
}

- (void)_connectionTouchedView:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_19BE17000, a2, OS_LOG_TYPE_DEBUG, "[%@] Pruning lru cache since we've reached the limit.", (uint8_t *)&v2, 0xCu);
}

- (void)_connectionTouchedView:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 viewLRUCache];
  int v5 = 138412546;
  id v6 = a1;
  __int16 v7 = 2048;
  uint64_t v8 = [v4 count];
  _os_log_debug_impl(&dword_19BE17000, a2, OS_LOG_TYPE_DEBUG, "[%@] Current unique pill count: %lu", (uint8_t *)&v5, 0x16u);
}

@end