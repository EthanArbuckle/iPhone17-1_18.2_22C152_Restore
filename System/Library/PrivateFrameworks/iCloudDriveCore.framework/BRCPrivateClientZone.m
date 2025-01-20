@interface BRCPrivateClientZone
- (BOOL)dumpActivityToContext:(id)a3 includeExpensiveActivity:(BOOL)a4 error:(id *)a5;
- (BOOL)dumpTablesToContext:(id)a3 includeAllItems:(BOOL)a4 error:(id *)a5;
- (BOOL)hasDefaultAppLibrary;
- (BOOL)isDocumentScopePublic;
- (BOOL)isPrivateZone;
- (BOOL)parentIDHasLiveUnchainedChildren:(id)a3;
- (BOOL)recomputeAppSyncBlockState;
- (BOOL)resetFrequencyIsTooHigh;
- (BOOL)validateItemsLoggingToFile:(__sFILE *)a3 db:(id)a4;
- (BOOL)validateStructureLoggingToFile:(__sFILE *)a3 db:(id)a4;
- (BOOL)zoneHealthNeedsSyncUp;
- (BRCAppLibrary)defaultAppLibrary;
- (BRCPrivateClientZone)initWithMangledID:(id)a3 dbRowID:(id)a4 plist:(id)a5 session:(id)a6 initialCreation:(BOOL)a7;
- (BRCPrivateServerZone)privateServerZone;
- (BRCServerZoneHealthState)zoneHealthState;
- (NSSet)appLibraries;
- (NSSet)appLibraryIDs;
- (id)fetchZoneRootItemInDB:(id)a3;
- (id)pcsChainOperationForItemID:(id)a3;
- (id)plist;
- (id)prepareProblemReportForSyncWithRequestID:(int64_t)a3;
- (id)rootItemID;
- (id)serverAliasByUnsaltedBookmarkData:(id)a3;
- (id)unchainedItemInfoInServerTruthEnumeratorParentedTo:(id)a3;
- (unsigned)pcsChainStateForItem:(id)a3;
- (void)_checkResultSetIsEmpty:(id)a3 logToFile:(__sFILE *)a4 reason:(id)a5 result:(BOOL *)a6;
- (void)_createCloudKitZoneWithGroup:(id)a3 completion:(id)a4;
- (void)addAppLibrary:(id)a3;
- (void)addAppLibrary:(id)a3 offline:(BOOL)a4;
- (void)clearProblemReport;
- (void)close;
- (void)createCloudKitZoneWithGroup:(id)a3 completion:(id)a4;
- (void)defaultAppLibrary;
- (void)privateServerZone;
- (void)registerPCSChainingOperation:(id)a3;
- (void)removeAppLibrary:(id)a3;
- (void)reportProblemWithType:(int)a3 recordName:(id)a4;
- (void)resume;
- (void)setServerZone:(id)a3;
- (void)syncedDownZoneHealthRequestID:(int64_t)a3;
- (void)syncedDownZoneHealthState:(id)a3;
- (void)updateWithPlist:(id)a3;
- (void)zoneHealthWasReset;
@end

@implementation BRCPrivateClientZone

- (BOOL)isPrivateZone
{
  return 1;
}

- (BRCPrivateServerZone)privateServerZone
{
  serverZone = self->super._serverZone;
  if (!serverZone)
  {
    v6 = brc_bread_crumbs();
    v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[BRCPrivateClientZone privateServerZone]();
    }

    serverZone = self->super._serverZone;
  }
  v4 = [(BRCServerZone *)serverZone asPrivateZone];
  return (BRCPrivateServerZone *)v4;
}

- (id)rootItemID
{
  v2 = [(BRCPrivateClientZone *)self defaultAppLibrary];
  v3 = [v2 rootItemID];

  return v3;
}

- (id)fetchZoneRootItemInDB:(id)a3
{
  id v4 = a3;
  v5 = [(BRCPrivateClientZone *)self defaultAppLibrary];
  v6 = [v5 fetchRootItemInDB:v4];

  return v6;
}

- (BRCAppLibrary)defaultAppLibrary
{
  defaultAppLibrary = self->_defaultAppLibrary;
  if (!defaultAppLibrary)
  {
    v5 = brc_bread_crumbs();
    v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCPrivateClientZone defaultAppLibrary]();
    }

    defaultAppLibrary = self->_defaultAppLibrary;
  }
  return defaultAppLibrary;
}

- (BOOL)hasDefaultAppLibrary
{
  return self->_defaultAppLibrary != 0;
}

- (void)registerPCSChainingOperation:(id)a3
{
  id v9 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  pcsChainFolderOperations = v4->_pcsChainFolderOperations;
  if (!pcsChainFolderOperations)
  {
    uint64_t v6 = [MEMORY[0x263F08968] weakToWeakObjectsMapTable];
    v7 = v4->_pcsChainFolderOperations;
    v4->_pcsChainFolderOperations = (NSMapTable *)v6;

    pcsChainFolderOperations = v4->_pcsChainFolderOperations;
  }
  v8 = [v9 rootItemID];
  [(NSMapTable *)pcsChainFolderOperations setObject:v9 forKey:v8];

  objc_sync_exit(v4);
}

- (id)pcsChainOperationForItemID:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [(NSMapTable *)v5->_pcsChainFolderOperations objectForKey:v4];
  objc_sync_exit(v5);

  return v6;
}

- (NSSet)appLibraryIDs
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9C0] set];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BRCPrivateClientZone *)self appLibraries];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) appLibraryID];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSSet *)v3;
}

- (void)addAppLibrary:(id)a3
{
}

- (void)addAppLibrary:(id)a3 offline:(BOOL)a4
{
  id v10 = a3;
  if (!a4) {
    [(BRCPQLConnection *)self->super._db assertOnQueue];
  }
  [(NSMutableSet *)self->_appLibraries addObject:v10];
  uint64_t v7 = [(BRCClientZone *)self zoneName];
  v8 = [v10 appLibraryID];
  int v9 = [v7 isEqualToString:v8];

  if (v9) {
    objc_storeStrong((id *)&self->_defaultAppLibrary, a3);
  }
}

- (void)removeAppLibrary:(id)a3
{
  db = self->super._db;
  id v5 = a3;
  [(BRCPQLConnection *)db assertOnQueue];
  [(NSMutableSet *)self->_appLibraries removeObject:v5];
}

- (BRCPrivateClientZone)initWithMangledID:(id)a3 dbRowID:(id)a4 plist:(id)a5 session:(id)a6 initialCreation:(BOOL)a7
{
  v17.receiver = self;
  v17.super_class = (Class)BRCPrivateClientZone;
  uint64_t v7 = [(BRCClientZone *)&v17 initWithMangledID:a3 dbRowID:a4 plist:a5 session:a6 initialCreation:a7];
  if (v7)
  {
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    appLibraries = v7->_appLibraries;
    v7->_appLibraries = v8;

    id v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    zoneCreationCompletionBlocks = v7->_zoneCreationCompletionBlocks;
    v7->_zoneCreationCompletionBlocks = v10;

    long long v12 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    long long v13 = dispatch_queue_attr_make_with_autorelease_frequency(v12, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("client-zone/zone-creation", v13);

    createZoneQueue = v7->_createZoneQueue;
    v7->_createZoneQueue = (OS_dispatch_queue *)v14;
  }
  return v7;
}

- (void)createCloudKitZoneWithGroup:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  createZoneQueue = self->_createZoneQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__BRCPrivateClientZone_createCloudKitZoneWithGroup_completion___block_invoke;
  block[3] = &unk_26507F918;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(createZoneQueue, block);
}

uint64_t __63__BRCPrivateClientZone_createCloudKitZoneWithGroup_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _createCloudKitZoneWithGroup:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)_createCloudKitZoneWithGroup:(id)a3 completion:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_createZoneQueue);
  if (!self->_createZoneOperation)
  {
    objc_initWeak(&location, self);
    long long v20 = 0uLL;
    uint64_t v21 = 0;
    __brc_create_section(0, (uint64_t)"-[BRCPrivateClientZone _createCloudKitZoneWithGroup:completion:]", 172, &v20);
    v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = v20;
      v15 = [(BRCClientZone *)self zoneName];
      *(_DWORD *)buf = 134218498;
      uint64_t v26 = v14;
      __int16 v27 = 2112;
      v28 = v15;
      __int16 v29 = 2112;
      v30 = v8;
      _os_log_debug_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx scheduling zone creation operation for %@%@", buf, 0x20u);
    }
    long long v22 = v20;
    uint64_t v23 = v21;
    id v10 = [[BRCCreateZoneAndSubscribeOperation alloc] initWithServerZone:self->super._serverZone sessionContext:self->super._session];
    createZoneOperation = self->_createZoneOperation;
    self->_createZoneOperation = v10;

    [(_BRCOperation *)self->_createZoneOperation setGroup:v6];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __64__BRCPrivateClientZone__createCloudKitZoneWithGroup_completion___block_invoke;
    v16[3] = &unk_265083600;
    long long v18 = v22;
    uint64_t v19 = v23;
    objc_copyWeak(&v17, &location);
    [(BRCCreateZoneAndSubscribeOperation *)self->_createZoneOperation setCreateZoneAndSubscribeCompletionBlock:v16];
    [(_BRCOperation *)self->_createZoneOperation schedule];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  zoneCreationCompletionBlocks = self->_zoneCreationCompletionBlocks;
  id v13 = (void *)MEMORY[0x2455D9A50](v7);
  [(NSMutableArray *)zoneCreationCompletionBlocks addObject:v13];
}

void __64__BRCPrivateClientZone__createCloudKitZoneWithGroup_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v11 = *(_OWORD *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 56);
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v14 = v11;
    __int16 v15 = 2112;
    id v16 = v3;
    __int16 v17 = 2112;
    long long v18 = v4;
    _os_log_debug_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx finished zone creation with error: %@%@", buf, 0x20u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained[66];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __64__BRCPrivateClientZone__createCloudKitZoneWithGroup_completion___block_invoke_5;
  v9[3] = &unk_26507ED98;
  v9[4] = WeakRetained;
  id v10 = v3;
  id v8 = v3;
  dispatch_sync(v7, v9);

  __brc_leave_section((uint64_t *)&v11);
}

void __64__BRCPrivateClientZone__createCloudKitZoneWithGroup_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 536) copy];
  [*(id *)(*(void *)(a1 + 32) + 536) removeAllObjects];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = v2;
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
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v7) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v7));
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 520);
  *(void *)(v8 + 520) = 0;
}

- (BOOL)dumpTablesToContext:(id)a3 includeAllItems:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BRCPrivateClientZone;
  BOOL v9 = [(BRCClientZone *)&v11 dumpTablesToContext:v8 includeAllItems:v6 error:a5];
  if (self->_zoneHealthState)
  {
    [v8 writeLineWithFormat:@"%@", self->_zoneHealthState];
    [v8 writeLineWithFormat:&stru_26F3822F0];
  }
  if (self->_problemReport)
  {
    [v8 writeLineWithFormat:@"%@", self->_problemReport];
    [v8 writeLineWithFormat:&stru_26F3822F0];
  }

  return v9;
}

- (void)setServerZone:(id)a3
{
  uint64_t v4 = (BRCServerZone *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v6 = brc_bread_crumbs();
    uint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[BRCPrivateClientZone setServerZone:]();
    }
  }
  serverZone = self->super._serverZone;
  self->super._serverZone = v4;
}

- (void)resume
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_23FA42000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Activation done%@", v1, 0xCu);
}

- (void)close
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_23FA42000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] zoneCreationOp finished%@", v1, 0xCu);
}

uint64_t __29__BRCPrivateClientZone_close__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 520));
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return [v2 cancel];
}

- (id)plist
{
  v8.receiver = self;
  v8.super_class = (Class)BRCPrivateClientZone;
  id v3 = [(BRCClientZone *)&v8 plist];
  uint64_t v4 = v3;
  problemReport = self->_problemReport;
  if (problemReport) {
    [v3 setObject:problemReport forKeyedSubscript:@"problemReport"];
  }
  zoneHealthState = self->_zoneHealthState;
  if (zoneHealthState) {
    [v4 setObject:zoneHealthState forKeyedSubscript:@"zoneHealthState"];
  }
  return v4;
}

- (void)updateWithPlist:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BRCPrivateClientZone;
  id v4 = a3;
  [(BRCClientZone *)&v9 updateWithPlist:v4];
  objc_msgSend(v4, "objectForKeyedSubscript:", @"problemReport", v9.receiver, v9.super_class);
  uint64_t v5 = (BRCProblemReport *)objc_claimAutoreleasedReturnValue();
  problemReport = self->_problemReport;
  self->_problemReport = v5;

  uint64_t v7 = [v4 objectForKeyedSubscript:@"zoneHealthState"];

  zoneHealthState = self->_zoneHealthState;
  self->_zoneHealthState = v7;
}

- (void)clearProblemReport
{
  [(BRCPQLConnection *)self->super._db assertOnQueue];
  problemReport = self->_problemReport;
  self->_problemReport = 0;

  [(BRCClientZone *)self setNeedsSave:1];
}

- (void)reportProblemWithType:(int)a3 recordName:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if (shouldReportProblemToHealthZone(v4))
  {
    uint64_t v7 = [(BRCPQLConnection *)self->super._db serialQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__BRCPrivateClientZone_reportProblemWithType_recordName___block_invoke;
    block[3] = &unk_265083628;
    block[4] = self;
    int v10 = v4;
    id v9 = v6;
    dispatch_async(v7, block);
  }
}

uint64_t __57__BRCPrivateClientZone_reportProblemWithType_recordName___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 560);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void **)(v2 + 560);
    *(void *)(v2 + 560) = v4;
  }
  else
  {
    id v6 = objc_alloc_init(BRCProblemReport);
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v7 + 560);
    *(void *)(v7 + 560) = v6;
  }

  [*(id *)(*(void *)(a1 + 32) + 560) addProblemWithType:*(unsigned int *)(a1 + 48) recordName:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setNeedsSave:1];
  objc_super v8 = *(void **)(*(void *)(a1 + 32) + 24);
  return objc_msgSend(v8, "didChangeSyncStatusForZoneHealthForContainer:");
}

- (id)prepareProblemReportForSyncWithRequestID:(int64_t)a3
{
  [(BRCPQLConnection *)self->super._db assertOnQueue];
  if ([(BRCProblemReport *)self->_problemReport needsSyncUp])
  {
    uint64_t v5 = [NSNumber numberWithLongLong:a3];
    [(BRCProblemReport *)self->_problemReport setPendingRequestID:v5];

    id v6 = (void *)[(BRCProblemReport *)self->_problemReport copy];
    [(BRCProblemReport *)self->_problemReport setNeedsSyncUp:0];
    [(BRCClientZone *)self setNeedsSave:1];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)syncedDownZoneHealthRequestID:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  [(BRCPQLConnection *)self->super._db assertOnQueue];
  uint64_t v5 = [(BRCProblemReport *)self->_problemReport pendingRequestID];

  if (v5)
  {
    id v6 = [(BRCProblemReport *)self->_problemReport pendingRequestID];
    int64_t v7 = [v6 longLongValue];

    if (v7 <= a3)
    {
      int v10 = brc_bread_crumbs();
      objc_super v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[BRCPrivateClientZone syncedDownZoneHealthRequestID:]();
      }

      [(BRCProblemReport *)self->_problemReport setPendingRequestID:0];
    }
    else
    {
      objc_super v8 = brc_bread_crumbs();
      id v9 = brc_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412546;
        long long v13 = self;
        __int16 v14 = 2112;
        uint64_t v15 = v8;
        _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] problem report for %@ wasn't acked%@", (uint8_t *)&v12, 0x16u);
      }

      [(BRCProblemReport *)self->_problemReport setPendingRequestID:0];
      [(BRCProblemReport *)self->_problemReport setNeedsSyncUp:1];
    }
  }
  [(BRCClientZone *)self setNeedsSave:1];
}

- (BOOL)resetFrequencyIsTooHigh
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF910] now];
  lastResets = self->_lastResets;
  if (!lastResets)
  {
    uint64_t v21 = [MEMORY[0x263EFF980] arrayWithObject:v3];
    long long v22 = self->_lastResets;
    self->_lastResets = v21;

    goto LABEL_9;
  }
  [(NSMutableArray *)lastResets addObject:v3];
  unint64_t v5 = [(NSMutableArray *)self->_lastResets count];
  id v6 = +[BRCUserDefaults defaultsForMangledID:0];
  unint64_t v7 = [v6 healthZoneMaxNumberOfResets];

  if (v5 <= v7)
  {
LABEL_9:
    BOOL v20 = 0;
    goto LABEL_10;
  }
  objc_super v8 = [(NSMutableArray *)self->_lastResets objectAtIndex:0];
  [v3 timeIntervalSinceDate:v8];
  double v10 = v9;
  objc_super v11 = +[BRCUserDefaults defaultsForMangledID:0];
  [v11 healthZoneTimeIntervalForMaxNumberOfResets];
  double v13 = v12;

  if (v10 >= v13)
  {
    [(NSMutableArray *)self->_lastResets removeObjectAtIndex:0];
    goto LABEL_9;
  }
  __int16 v14 = brc_bread_crumbs();
  uint64_t v15 = brc_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = +[BRCUserDefaults defaultsForMangledID:0];
    uint64_t v17 = [v16 healthZoneMaxNumberOfResets];
    long long v18 = +[BRCUserDefaults defaultsForMangledID:0];
    [v18 healthZoneTimeIntervalForMaxNumberOfResets];
    int v24 = 134218498;
    uint64_t v25 = v17;
    __int16 v26 = 2048;
    uint64_t v27 = v19;
    __int16 v28 = 2112;
    __int16 v29 = v14;
    _os_log_impl(&dword_23FA42000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] Zone has resetted more than %lu times during the last %f seconds%@", (uint8_t *)&v24, 0x20u);
  }
  [(NSMutableArray *)self->_lastResets removeObjectAtIndex:0];
  BOOL v20 = 1;
LABEL_10:

  return v20;
}

- (void)syncedDownZoneHealthState:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  [(BRCPQLConnection *)self->super._db assertOnQueue];
  id v6 = self->_zoneHealthState;
  objc_storeStrong((id *)&self->_zoneHealthState, a3);
  [(BRCClientZone *)self setNeedsSave:1];
  unint64_t v7 = brc_bread_crumbs();
  objc_super v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    zoneHealthState = self->_zoneHealthState;
    int v17 = 138413058;
    long long v18 = self;
    __int16 v19 = 2112;
    BOOL v20 = v6;
    __int16 v21 = 2112;
    long long v22 = zoneHealthState;
    __int16 v23 = 2112;
    int v24 = v7;
    _os_log_debug_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] zone-health changed for %@ previous %@ new %@%@", (uint8_t *)&v17, 0x2Au);
  }

  if (-[BRCServerZoneHealthState state](v6, "state") >= 1 && ![v5 state])
  {
    problemReport = self->_problemReport;
    if (problemReport && [(BRCProblemReport *)problemReport shouldResetAfterFixingState]
      || (self->super._state & 0x10000) != 0)
    {
      if ([(BRCPrivateClientZone *)self resetFrequencyIsTooHigh])
      {
        [(BRCPrivateClientZone *)self reportProblemWithType:19 recordName:0];
      }
      else
      {
        brc_bread_crumbs();
        __int16 v14 = (BRCPrivateClientZone *)objc_claimAutoreleasedReturnValue();
        uint64_t v15 = brc_default_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          int v17 = 138412290;
          long long v18 = v14;
          _os_log_impl(&dword_23FA42000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] We had a problem and the zone is healthy again, resetting the zone%@", (uint8_t *)&v17, 0xCu);
        }

        [(BRCClientZone *)self scheduleResetServerAndClientTruthsForReason:@"zone became healthy"];
      }
      goto LABEL_5;
    }
    double v10 = self->_problemReport;
    if (v10 && ![(BRCProblemReport *)v10 shouldResetAfterFixingState])
    {
      brc_bread_crumbs();
      objc_super v11 = (BRCPrivateClientZone *)objc_claimAutoreleasedReturnValue();
      double v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412290;
        long long v18 = v11;
        double v13 = "[WARNING] We had a problem and the zone is healthy again, no need to reset the zone%@";
        goto LABEL_20;
      }
    }
    else
    {
      brc_bread_crumbs();
      objc_super v11 = (BRCPrivateClientZone *)objc_claimAutoreleasedReturnValue();
      double v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412290;
        long long v18 = v11;
        double v13 = "[WARNING] Server told us the zone is healthy again, but we didn't have a problem%@";
LABEL_20:
        _os_log_impl(&dword_23FA42000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v17, 0xCu);
      }
    }
  }
LABEL_5:
}

- (void)zoneHealthWasReset
{
  [(BRCPQLConnection *)self->super._db assertOnQueue];
  zoneHealthState = self->_zoneHealthState;
  self->_zoneHealthState = 0;

  [(BRCProblemReport *)self->_problemReport setNeedsSyncUp:1];
  [(BRCClientZone *)self setNeedsSave:1];
}

- (BOOL)zoneHealthNeedsSyncUp
{
  return [(BRCProblemReport *)self->_problemReport needsSyncUp];
}

- (BOOL)recomputeAppSyncBlockState
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = +[BRCCloudDocsAppsMonitor cloudDocsAppsMonitor];
  char v4 = [v3 hasFetchedInitialApps];

  BOOL v5 = [(BRCClientZone *)self isSyncBlockedBecauseAppNotInstalled];
  BOOL v6 = v5;
  if (v4)
  {
    unint64_t v7 = [(BRCClientZone *)self mangledID];
    int v8 = [(BRCClientZone *)self shouldSyncMangledID:v7];
  }
  else
  {
    int v8 = !v5;
  }
  memset(v27, 0, sizeof(v27));
  __brc_create_section(0, (uint64_t)"-[BRCPrivateClientZone recomputeAppSyncBlockState]", 396, v27);
  double v9 = brc_bread_crumbs();
  double v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v30 = v27[0];
    __int16 v31 = 2112;
    v32 = self;
    __int16 v33 = 2112;
    v34 = v9;
    _os_log_debug_impl(&dword_23FA42000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx recomputing app sync block state for %@%@", buf, 0x20u);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  objc_super v11 = self->_appLibraries;
  uint64_t v12 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v24;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v14++), "recomputeShouldEvictState", (void)v23);
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v12);
  }

  char v15 = v6 ^ v8;
  if ((v6 ^ v8))
  {
    uint64_t v16 = brc_bread_crumbs();
    int v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      __int16 v21 = "enabled";
      *(_DWORD *)buf = 136315650;
      if (v6) {
        __int16 v21 = "disabled";
      }
      uint64_t v30 = (uint64_t)v21;
      __int16 v31 = 2112;
      v32 = self;
      __int16 v33 = 2112;
      v34 = v16;
      _os_log_debug_impl(&dword_23FA42000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] sync remaining %s for %@%@", buf, 0x20u);
    }
  }
  else
  {
    long long v18 = brc_bread_crumbs();
    __int16 v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      long long v22 = "disabled";
      *(_DWORD *)buf = 136315650;
      if (v8) {
        long long v22 = "enabled";
      }
      uint64_t v30 = (uint64_t)v22;
      __int16 v31 = 2112;
      v32 = self;
      __int16 v33 = 2112;
      v34 = v18;
      _os_log_debug_impl(&dword_23FA42000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] updating sync state to be %s for %@%@", buf, 0x20u);
    }

    if (v8) {
      [(BRCClientZone *)self clearStateBits:4096];
    }
    else {
      [(BRCClientZone *)self setStateBits:4096];
    }
    -[BRCClientZone setNeedsSave:](self, "setNeedsSave:", 1, (void)v23);
  }
  __brc_leave_section(v27);
  return v15 ^ 1;
}

- (id)serverAliasByUnsaltedBookmarkData:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    int v8 = brc_bread_crumbs();
    double v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[BRCPrivateClientZone serverAliasByUnsaltedBookmarkData:]();
    }
  }
  db = self->super._db;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __58__BRCPrivateClientZone_serverAliasByUnsaltedBookmarkData___block_invoke;
  v10[3] = &unk_26507F1E8;
  v10[4] = self;
  id v6 = [(BRCPQLConnection *)db fetchObject:v10, @"SELECT zone_rowid, item_rank, item_origname, pcs_state, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, child_basehash_salt, salting_state, basehash_salt_validation_key, quota_used, recursive_child_count, shared_children_count, shared_alias_count, child_count FROM server_items WHERE item_filename = %@ AND item_type = 3 AND zone_rowid = %@", v4, self->super._dbRowID sql];

  return v6;
}

id __58__BRCPrivateClientZone_serverAliasByUnsaltedBookmarkData___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 session];
  unint64_t v7 = (void *)[v6 newServerItemFromPQLResultSet:v5 error:a3];

  return v7;
}

- (BOOL)isDocumentScopePublic
{
  uint64_t v2 = [(BRCPrivateClientZone *)self defaultAppLibrary];
  id v3 = [v2 containerMetadata];
  char v4 = [v3 isDocumentScopePublic];

  return v4;
}

- (BOOL)dumpActivityToContext:(id)a3 includeExpensiveActivity:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  double v9 = [(BRCPrivateClientZone *)self privateServerZone];
  v24.receiver = self;
  v24.super_class = (Class)BRCPrivateClientZone;
  BOOL v10 = [(BRCClientZone *)&v24 dumpActivityToContext:v8 includeExpensiveActivity:v6 error:a5];
  if (v10)
  {
    uint64_t v11 = [v9 deleteAllContentsOperation];
    uint64_t v12 = [v9 deleteAllContentsOperationLastError];
    if (v11 | v12)
    {
      uint64_t v13 = @"idle";
      if (v11) {
        uint64_t v13 = (__CFString *)v11;
      }
      [v8 writeLineWithFormat:@"+ delete-content: %@", v13];
      if (v12) {
        [v8 writeLineWithFormat:@"     (last-error: %@)", v12];
      }
    }
    if ([(NSMapTable *)self->_pcsChainFolderOperations count])
    {
      [v8 writeLineWithFormat:@"+ pcs chain operation:"];
      [v8 pushIndentation];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      uint64_t v14 = [(NSMapTable *)self->_pcsChainFolderOperations objectEnumerator];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v21;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v21 != v17) {
              objc_enumerationMutation(v14);
            }
            [v8 writeLineWithFormat:@"%@", *(void *)(*((void *)&v20 + 1) + 8 * v18++)];
          }
          while (v16 != v18);
          uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v16);
      }

      [v8 popIndentation];
    }
  }
  return v10;
}

- (void)_checkResultSetIsEmpty:(id)a3 logToFile:(__sFILE *)a4 reason:(id)a5 result:(BOOL *)a6
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v11 = [v9 enumerateObjectsOfClass:objc_opt_class()];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        *a6 = 0;
        fprintf(a4, "itemID %s %s\n", (const char *)[v16 UTF8String], (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"));
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  uint64_t v17 = [v9 error];

  if (v17)
  {
    *a6 = 0;
    uint64_t v18 = [v9 error];
    id v19 = [v18 description];
    fprintf(a4, "SQL error: %s\n", (const char *)[v19 UTF8String]);
  }
}

- (BOOL)validateStructureLoggingToFile:(__sFILE *)a3 db:(id)a4
{
  id v6 = a4;
  char v19 = 1;
  unint64_t v7 = [(BRCPrivateClientZone *)self defaultAppLibrary];
  id v8 = [v7 rootItemID];

  fprintf(a3, "client truth structure validation (%s)\n=================================\n", [(NSString *)self->super._zoneName UTF8String]);
  if (([v6 execute:@"DROP TABLE IF EXISTS items_checks"] & 1) != 0
    && ([v6 execute:@"CREATE TABLE items_checks (item_id blob PRIMARY KEY, depth integer not null)"] & 1) != 0&& (objc_msgSend(v6, "execute:", @"CREATE INDEX items_checks__depth__idx ON items_checks (depth)") & 1) != 0&& objc_msgSend(v6, "execute:", @"INSERT INTO items_checks (item_id, depth) VALUES (%@, 0)", v8))
  {
    uint64_t v9 = 0;
    while ([v6 changes])
    {
      char v10 = [v6 execute:@"INSERT INTO items_checks    SELECT c.item_id, %lld      FROM items_checks AS p INNER JOIN client_items AS c ON (p.item_id = c.item_parent_id)     WHERE zone_rowid = %@ AND p.depth = %lld", v9 + 1, self->super._dbRowID, v9];
      ++v9;
      if ((v10 & 1) == 0) {
        goto LABEL_8;
      }
    }
    uint64_t v15 = (void *)[v6 fetch:@"SELECT item_id FROM client_items WHERE zone_rowid = %@   AND item_id NOT IN(SELECT item_id FROM items_checks)", self->super._dbRowID];
    [(BRCPrivateClientZone *)self _checkResultSetIsEmpty:v15 logToFile:a3 reason:@"is an orphan or part of a cycle" result:&v19];
    uint64_t v16 = (void *)[v6 fetch:@"SELECT c.item_id      FROM client_items AS c INNER JOIN client_items AS p ON (c.item_parent_id = p.item_id)     WHERE c.item_state != 1 AND p.item_state = 1       AND c.zone_rowid = %@ AND p.zone_rowid = %@", self->super._dbRowID, self->super._dbRowID];

    [(BRCPrivateClientZone *)self _checkResultSetIsEmpty:v16 logToFile:a3 reason:@"is a live item parented to a tombstone" result:&v19];
    uint64_t v17 = (void *)[v6 fetch:@"SELECT c.item_id      FROM client_items AS c INNER JOIN client_items AS p ON (c.item_parent_id = p.item_id)     WHERE p.item_type IN (1, 2, 8, 5, 6, 7)       AND c.zone_rowid = %@ AND p.zone_rowid = %@", self->super._dbRowID, self->super._dbRowID];

    [(BRCPrivateClientZone *)self _checkResultSetIsEmpty:v17 logToFile:a3 reason:@"is parented to a document" result:&v19];
    uint64_t v18 = (void *)[v6 fetch:@"SELECT o.item_id       FROM client_items AS o  WHERE zone_rowid = %@ AND EXISTS(SELECT 1 FROM client_items AS n WHERE ((   n.item_parent_id = o.item_parent_id      AND item_filename = IFNULL(o.item_localname, o.item_filename)      AND item_localname IS NULL)  OR(   n.item_parent_id = o.item_parent_id      AND item_localname = IFNULL(o.item_localname, o.item_filename)) )  AND n.item_id != o.item_id  AND n.zone_rowid = %@)", self->super._dbRowID, self->super._dbRowID];

    [(BRCPrivateClientZone *)self _checkResultSetIsEmpty:v18 logToFile:a3 reason:@"is parented to a document" result:&v19];
    if (v19) {
      fputs("OK\n", a3);
    }
    fputc(10, a3);
    BOOL v13 = v19 != 0;
  }
  else
  {
LABEL_8:
    uint64_t v11 = [v6 lastError];
    id v12 = [v11 description];
    fprintf(a3, "SQL error: %s\n", (const char *)[v12 UTF8String]);

    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)validateItemsLoggingToFile:(__sFILE *)a3 db:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  fprintf(a3, "local items checks (%s)\n===================\n", [(NSString *)self->super._zoneName UTF8String]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  unint64_t v7 = [(BRCClientZone *)self itemsEnumeratorWithDB:v6];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v8)
  {

LABEL_11:
    fputs("OK\n", a3);
    BOOL v13 = 1;
    goto LABEL_12;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v16;
  int v11 = 1;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v16 != v10) {
        objc_enumerationMutation(v7);
      }
      v11 &= [*(id *)(*((void *)&v15 + 1) + 8 * i) validateLoggingToFile:a3];
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  }
  while (v9);

  if (v11) {
    goto LABEL_11;
  }
  BOOL v13 = 0;
LABEL_12:
  fputc(10, a3);

  return v13;
}

- (NSSet)appLibraries
{
  return &self->_appLibraries->super;
}

- (BRCServerZoneHealthState)zoneHealthState
{
  return self->_zoneHealthState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pcsChainFolderOperations, 0);
  objc_storeStrong((id *)&self->_defaultAppLibrary, 0);
  objc_storeStrong((id *)&self->_appLibraries, 0);
  objc_storeStrong((id *)&self->_lastResets, 0);
  objc_storeStrong((id *)&self->_problemReport, 0);
  objc_storeStrong((id *)&self->_zoneHealthState, 0);
  objc_storeStrong((id *)&self->_syncBarriers, 0);
  objc_storeStrong((id *)&self->_zoneCreationCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_createZoneQueue, 0);
  objc_storeStrong((id *)&self->_createZoneOperation, 0);
}

- (unsigned)pcsChainStateForItem:(id)a3
{
  id v4 = a3;
  if ([v4 isNonDesktopRoot])
  {
    session = self->super._session;
    id v6 = [v4 appLibraryRowID];
    unint64_t v7 = [(BRCAccountSessionFPFS *)session appLibraryByRowID:v6];
    if (([v7 state] & 0x8000000) != 0) {
      unsigned int v8 = 4;
    }
    else {
      unsigned int v8 = 1;
    }
  }
  else
  {
    uint64_t v9 = [(BRCClientZone *)self db];
    uint64_t v10 = [(BRCClientZone *)self dbRowID];
    id v6 = (void *)[v9 numberWithSQL:@"SELECT pcs_state FROM server_items WHERE item_id = %@   AND zone_rowid = %@ LIMIT 1", v4, v10];

    unsigned int v8 = [v6 intValue];
  }

  return v8;
}

- (BOOL)parentIDHasLiveUnchainedChildren:(id)a3
{
  id v4 = a3;
  id v5 = [(BRCClientZone *)self db];
  id v6 = [(BRCClientZone *)self dbRowID];
  unint64_t v7 = (void *)[v5 fetch:@"SELECT item_type, pcs_state FROM server_items WHERE item_id = %@ and zone_rowid = %@", v4, v6];

  if (![v7 next]
    || [v7 integerAtIndex:0] != 9
    || (char v8 = 1, [v7 integerAtIndex:1] == 2))
  {
    uint64_t v9 = [(BRCClientZone *)self db];
    uint64_t v10 = [(BRCClientZone *)self dbRowID];
    int v11 = (void *)[v9 numberWithSQL:@"SELECT 1 FROM server_items WHERE item_parent_id = %@   AND zone_rowid = %@   AND pcs_state NOT IN (2, 3)   AND item_state = 0 LIMIT 1", v4, v10];

    char v8 = [v11 BOOLValue];
  }

  return v8;
}

- (id)unchainedItemInfoInServerTruthEnumeratorParentedTo:(id)a3
{
  id v4 = a3;
  id v5 = [(BRCServerZone *)self->super._serverZone mangledID];
  id v6 = +[BRCUserDefaults defaultsForMangledID:v5];
  int v7 = [v6 pcsChainShareAliases];

  if (v7) {
    [MEMORY[0x263F8C720] rawInjection:"" length:0];
  }
  else {
  char v8 = [MEMORY[0x263F8C710] formatInjection:@"AND NOT (item_type = 3 AND item_alias_target like '%%:\\_%%' ESCAPE '\\')"];
  }
  uint64_t v9 = [(BRCClientZone *)self db];
  uint64_t v10 = [(BRCClientZone *)self dbRowID];
  int v11 = (void *)[v9 fetch:@"SELECT item_id, item_type, item_stat_ckinfo, version_ckinfo, pcs_state, item_alias_target FROM server_items WHERE item_parent_id = %@   AND zone_rowid = %@   AND pcs_state NOT IN (2, 3)   AND item_state = 0 %@", v4, v10, v8];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __97__BRCPrivateClientZone_BRCPCSChainAdditions__unchainedItemInfoInServerTruthEnumeratorParentedTo___block_invoke;
  v15[3] = &unk_26507F210;
  v15[4] = self;
  id v16 = v4;
  id v12 = v4;
  BOOL v13 = [v11 enumerateObjects:v15];

  return v13;
}

BRCPCSChainInfo *__97__BRCPrivateClientZone_BRCPCSChainAdditions__unchainedItemInfoInServerTruthEnumeratorParentedTo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 objectOfClass:objc_opt_class() atIndex:0];
  uint64_t v5 = 1;
  char v6 = [v3 intAtIndex:1];
  uint64_t v26 = [v3 objectOfClass:objc_opt_class() atIndex:2];
  uint64_t v25 = [v3 objectOfClass:objc_opt_class() atIndex:3];
  int v24 = [v3 intAtIndex:4];
  if (v6 == 3)
  {
    int v7 = [v3 stringAtIndex:5];
    id v27 = 0;
    id v28 = 0;
    char v8 = [v7 parseUnsaltedBookmarkDataWithItemID:0 mangledID:&v28 error:&v27];
    id v9 = v27;
    if ((v8 & 1) == 0)
    {
      uint64_t v10 = brc_bread_crumbs();
      int v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v30 = v7;
        __int16 v31 = 2112;
        id v32 = v9;
        __int16 v33 = 2112;
        v34 = v10;
        _os_log_impl(&dword_23FA42000, v11, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't parse unsalted bookmark data %@ - %@%@", buf, 0x20u);
      }
    }
    if (v28)
    {
      uint64_t v5 = [v28 isShared];
    }
    else
    {
      id v12 = brc_bread_crumbs();
      BOOL v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        __97__BRCPrivateClientZone_BRCPCSChainAdditions__unchainedItemInfoInServerTruthEnumeratorParentedTo___block_invoke_cold_1();
      }
    }
  }
  uint64_t v14 = [*(id *)(a1 + 32) db];
  long long v15 = [*(id *)(a1 + 32) dbRowID];
  id v16 = (void *)[v14 fetch:@"SELECT item_stat_ckinfo, version_ckinfo FROM client_items WHERE item_id = %@  AND zone_rowid = %@  AND (item_local_diffs & %lld) != 0", v4, v15, 0x1000000000000000];

  if ([v16 next])
  {
    long long v17 = [v16 objectOfClass:objc_opt_class() atIndex:0];
    long long v18 = [v16 objectOfClass:objc_opt_class() atIndex:1];
    char v19 = brc_bread_crumbs();
    uint64_t v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413314;
      uint64_t v30 = v26;
      __int16 v31 = 2112;
      id v32 = v25;
      __int16 v33 = 2112;
      v34 = v17;
      __int16 v35 = 2112;
      v36 = v18;
      __int16 v37 = 2112;
      v38 = v19;
      _os_log_debug_impl(&dword_23FA42000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] Overriding structural and content info from (%@, %@) -> (%@, %@) because the item is OOB sync%@", buf, 0x34u);
    }
  }
  else
  {
    long long v18 = v25;
    long long v17 = v26;
  }
  LODWORD(v23) = v24;
  long long v21 = [[BRCPCSChainInfo alloc] initWithItemID:v4 parentID:*(void *)(a1 + 40) structuralCKInfo:v17 contentCKInfo:v18 itemType:v6 aliasTargetZoneIsShared:v5 chainState:v23];

  return v21;
}

- (void)privateServerZone
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _serverZone%@", v2, v3, v4, v5, v6);
}

- (void)defaultAppLibrary
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _defaultAppLibrary%@", v2, v3, v4, v5, v6);
}

- (void)setServerZone:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: [serverZone isKindOfClass:[BRCPrivateServerZone class]]%@", v2, v3, v4, v5, v6);
}

- (void)syncedDownZoneHealthRequestID:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_23FA42000, v1, OS_LOG_TYPE_DEBUG, "[DEBUG] problem report for %@ completed%@", v2, 0x16u);
}

- (void)serverAliasByUnsaltedBookmarkData:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: unsaltedBookmarkData%@", v2, v3, v4, v5, v6);
}

void __97__BRCPrivateClientZone_BRCPCSChainAdditions__unchainedItemInfoInServerTruthEnumeratorParentedTo___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_23FA42000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Can't locate target server zone from bookmark data %@%@", v1, 0x16u);
}

@end