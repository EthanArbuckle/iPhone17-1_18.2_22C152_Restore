@interface BRCAppLibrary
- (BOOL)containerMetadataNeedsSyncUp;
- (BOOL)hasActiveQueries;
- (BOOL)hasActiveRecursiveQueries;
- (BOOL)hasLocalChanges;
- (BOOL)hasUbiquitousDocuments;
- (BOOL)includesDataScope;
- (BOOL)integrityCheckBoosting;
- (BOOL)isAppInstalled;
- (BOOL)isCloudDocsAppLibrary;
- (BOOL)isDesktopAppLibrary;
- (BOOL)isDocumentScopePublic;
- (BOOL)isDocumentsAppLibrary;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAppLibrary:(id)a3;
- (BOOL)isForeground;
- (BOOL)isGreedy;
- (BOOL)isStillTargetingSharedServerZone:(id)a3;
- (BOOL)isiCloudDesktopAppLibrary;
- (BOOL)needsSave;
- (BOOL)recreateDocumentsFolderIfNeededInDB;
- (BOOL)rootRecordCreated;
- (BOOL)setStateBits:(unsigned int)a3;
- (BOOL)shouldEvictUploadedItems;
- (BOOL)shouldSaveContainerMetadataServerside;
- (BOOL)wasMovedToCloudDocs;
- (BOOL)zoneHasShareAlias;
- (BRCALRowID)dbRowID;
- (BRCAccountSessionFPFS)session;
- (BRCAppLibrary)init;
- (BRCAppLibrary)initWithMangledID:(id)a3 dbRowID:(id)a4 zoneRowID:(id)a5 db:(id)a6 plist:(id)a7 session:(id)a8 initialCreation:(BOOL)a9 createdRootOnDisk:(BOOL)a10 createdCZMMoved:(BOOL)a11 rootFileID:(id)a12 childBasehashSalt:(id)a13 saltingState:(unsigned int)a14;
- (BRCAppLibraryDelegate)delegate;
- (BRCPQLConnection)db;
- (BRCPrivateClientZone)defaultClientZone;
- (BRCSyncContext)transferSyncContext;
- (BRCSyncContext)transferSyncContextIfExists;
- (BRCZoneRowID)zoneRowID;
- (BRContainer)containerMetadata;
- (BRMangledID)mangledID;
- (NSData)childBasehashSalt;
- (NSMutableDictionary)plist;
- (NSNumber)fileID;
- (NSNumber)generationID;
- (NSNumber)rootQuotaUsage;
- (NSString)absolutePath;
- (NSString)appLibraryID;
- (NSString)containerMetadataEtag;
- (NSString)description;
- (NSString)identifier;
- (NSString)logName;
- (NSString)pathRelativeToRoot;
- (NSURL)url;
- (brc_task_tracker)tracker;
- (id)_recursivelyDeleteItemsUnderItemID:(id)a3 filterPredicate:(id)a4;
- (id)_targetSharedServerZonesEnumerator;
- (id)_unwrappedDescriptionWithContext:(id)a3;
- (id)containerMetadataFilledWithTCCInfo;
- (id)createDocumentsFolder;
- (id)deleteAppLibrary;
- (id)descriptionWithContext:(id)a3;
- (id)documentsFolder;
- (id)documentsFolderFileObjectID;
- (id)documentsFolderItemID;
- (id)documentsFolderWithDB:(id)a3;
- (id)enumerateChildrenOfItemGlobalID:(id)a3 sortOrder:(unsigned __int8)a4 offset:(unint64_t)a5 limit:(unint64_t)a6 db:(id)a7;
- (id)enumerateUserVisibleChildrenDirectoriesOfItemGlobalID:(id)a3 db:(id)a4;
- (id)fetchDocumentsDirectoryItem;
- (id)fetchDocumentsDirectoryItem:(id)a3;
- (id)fetchRootItem;
- (id)fetchRootItemInDB:(id)a3;
- (id)itemByRowID:(unint64_t)a3;
- (id)itemByRowID:(unint64_t)a3 db:(id)a4;
- (id)itemIDByRowID:(unint64_t)a3;
- (id)itemIDByRowID:(unint64_t)a3 db:(id)a4;
- (id)itemsEnumeratorChildOf:(id)a3 withDeadItems:(BOOL)a4 rankMin:(unint64_t)a5 rankMax:(unint64_t)a6 count:(unint64_t)a7 db:(id)a8;
- (id)itemsEnumeratorWithRankMin:(unint64_t)a3 rankMax:(unint64_t)a4 namePrefix:(id)a5 withDeadItems:(BOOL)a6 shouldIncludeFolders:(BOOL)a7 shouldIncludeOnlyFolders:(BOOL)a8 shouldIncludeDocumentsScope:(BOOL)a9 shouldIncludeDataScope:(BOOL)a10 shouldIncludeExternalScope:(BOOL)a11 shouldIncludeTrashScope:(BOOL)a12 count:(unint64_t)a13 db:(id)a14;
- (id)rootFileObjectID;
- (id)rootItemGlobalID;
- (id)rootItemID;
- (int64_t)throttleHashWithItemID:(id)a3;
- (unint64_t)containerMetadataSyncRequestID;
- (unint64_t)hash;
- (unint64_t)syncedFolderType;
- (unsigned)_activateState:(unsigned int)a3 origState:(unsigned int)a4;
- (unsigned)saltingState;
- (unsigned)state;
- (void)_addTargetSharedServerZone:(id)a3;
- (void)_addTargetSharedServerZoneForSharedItem:(id)a3;
- (void)_removeAllTargetSharedServerZonesWhenNoLongerForeground;
- (void)_removeTargetSharedServerZoneIfNecessary:(id)a3;
- (void)_resolveTargetSharedClientZonesWhenBecameForeground;
- (void)_updateContainerMetadataFromRecord:(id)a3 stripIcons:(BOOL)a4;
- (void)_updateIsInCloudDocsZone;
- (void)activate;
- (void)addForegroundClient:(id)a3;
- (void)associateWithClientZone:(id)a3;
- (void)associateWithClientZone:(id)a3 offline:(BOOL)a4;
- (void)clearStateBits:(unsigned int)a3;
- (void)close;
- (void)didCreateDataScopedItem;
- (void)didCreateDocumentScopedItem;
- (void)didReceiveHandoffRequest;
- (void)didRemoveDocumentsFolder;
- (void)didUpdateDocumentScopePublic;
- (void)dumpToContext:(id)a3;
- (void)fetchPristineness;
- (void)fetchTrashItems;
- (void)flushAndForceIngestRootAndDocumentsFolder;
- (void)integrityCheckBoosting;
- (void)isGreedy;
- (void)listOperation:(id)a3 wasReplacedByOperation:(id)a4;
- (void)recomputeShouldEvictState;
- (void)registerQueryIsRecursive:(BOOL)a3;
- (void)reimportLibraryRootAndFinishResetWithCompletion:(id)a3;
- (void)removeForegroundClient:(id)a3;
- (void)scheduleContainerMetadataSyncUp;
- (void)scheduleFullLibraryContentsFetch;
- (void)setChildBasehashSalt:(id)a3;
- (void)setContainerMetadataEtag:(id)a3;
- (void)setContainerMetadataNeedsSyncUp:(BOOL)a3;
- (void)setContainerMetadataSyncRequestID:(unint64_t)a3;
- (void)setDbRowID:(id)a3;
- (void)setDefaultClientZone:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFileID:(id)a3;
- (void)setGenerationID:(id)a3;
- (void)setNeedsSave:(BOOL)a3;
- (void)setRootQuotaUsage:(id)a3;
- (void)setSaltingState:(unsigned int)a3;
- (void)setSession:(id)a3;
- (void)setZoneRowID:(id)a3;
- (void)unregisterQueryIsRecursive:(BOOL)a3;
- (void)updateWithPlist:(id)a3;
- (void)waitForRootIngestionWithCompletion:(id)a3;
- (void)zoneDidChangeMovedToCloudDocsState;
@end

@implementation BRCAppLibrary

- (id)rootFileObjectID
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x263F325A8]), "initWithRowID:type:", -[BRCALRowID unsignedLongLongValue](self->_dbRowID, "unsignedLongLongValue"), 1);
  return v2;
}

- (id)documentsFolderFileObjectID
{
  if ([(BRCAppLibrary *)self includesDataScope])
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x263F325A8]), "initWithRowID:type:", -[BRCALRowID unsignedLongValue](self->_dbRowID, "unsignedLongValue"), 4);
  }
  else
  {
    v4 = brc_bread_crumbs();
    v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRCAppLibrary(FPFSAdditions) documentsFolderFileObjectID]();
    }

    v3 = 0;
  }
  return v3;
}

- (id)documentsFolder
{
  v3 = [(BRCAppLibrary *)self db];
  v4 = [(BRCAppLibrary *)self documentsFolderWithDB:v3];

  return v4;
}

- (id)documentsFolderWithDB:(id)a3
{
  id v4 = a3;
  if ([(BRCAppLibrary *)self includesDataScope])
  {
    v5 = [BRCItemGlobalID alloc];
    v6 = [(BRCAppLibrary *)self zoneRowID];
    v7 = [(BRCAppLibrary *)self documentsFolderItemID];
    v8 = [(BRCItemGlobalID *)v5 initWithZoneRowID:v6 itemID:v7];

    v9 = [(BRCAccountSessionFPFS *)self->_session itemByItemGlobalID:v8 db:v4];
    v10 = [v9 asDirectory];
  }
  else
  {
    v10 = [(BRCAppLibrary *)self fetchRootItem];
  }

  return v10;
}

- (id)createDocumentsFolder
{
  v3 = [(BRCAppLibrary *)self session];
  id v4 = [v3 fsImporter];
  uint64_t v5 = *MEMORY[0x263F32510];
  v6 = [(BRCAppLibrary *)self fetchRootItem];
  v7 = [v4 createAndImportNewDirectoryWithLogicalName:v5 parentItem:v6 error:0];

  return v7;
}

- (BOOL)recreateDocumentsFolderIfNeededInDB
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (![(BRCAppLibrary *)self includesDataScope]) {
    return 1;
  }
  v3 = [(BRCAppLibrary *)self documentsFolder];
  if (v3)
  {
LABEL_7:

    return 1;
  }
  memset(v10, 0, sizeof(v10));
  __brc_create_section(0, (uint64_t)"-[BRCAppLibrary(FPFSAdditions) recreateDocumentsFolderIfNeededInDB]", 62, v10);
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    mangledID = self->_mangledID;
    *(_DWORD *)buf = 134218498;
    uint64_t v12 = v10[0];
    __int16 v13 = 2112;
    v14 = mangledID;
    __int16 v15 = 2112;
    v16 = v4;
    _os_log_debug_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Creating a documents folder for app library %@%@", buf, 0x20u);
  }

  v3 = [(BRCAppLibrary *)self createDocumentsFolder];
  if (v3)
  {
    __brc_leave_section(v10);
    goto LABEL_7;
  }
  v7 = brc_bread_crumbs();
  v8 = brc_default_log();
  if (os_log_type_enabled(v8, (os_log_type_t)0x90u)) {
    [(BRCAppLibrary(FPFSAdditions) *)(uint64_t)self recreateDocumentsFolderIfNeededInDB];
  }

  __brc_leave_section(v10);
  return 0;
}

- (void)registerQueryIsRecursive:(BOOL)a3
{
  if (a3) {
    atomic_fetch_add((atomic_ullong *volatile)&self->_activeRecursiveQueries, 1uLL);
  }
}

- (void)unregisterQueryIsRecursive:(BOOL)a3
{
  if (a3) {
    atomic_fetch_add((atomic_ullong *volatile)&self->_activeRecursiveQueries, 0xFFFFFFFFFFFFFFFFLL);
  }
  atomic_fetch_add((atomic_ullong *volatile)&self->_activeQueries, 0xFFFFFFFFFFFFFFFFLL);
}

- (id)_recursivelyDeleteItemsUnderItemID:(id)a3 filterPredicate:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a4;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v7 = [(BRCAppLibrary *)self enumerateChildrenOfItemGlobalID:a3 sortOrder:0 offset:0 limit:0xFFFFFFFFLL db:self->_db];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v26;
    *(void *)&long long v9 = 138412546;
    long long v24 = v9;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v7);
        }
        __int16 v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if (objc_msgSend(v6, "evaluateWithObject:", v13, v24))
        {
          v14 = brc_bread_crumbs();
          __int16 v15 = brc_default_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v24;
            v30 = v13;
            __int16 v31 = 2112;
            v32 = v14;
            _os_log_debug_impl(&dword_23FA42000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] Recurisvely deleting %@%@", buf, 0x16u);
          }

          [v13 markRemovedFromFilesystemRecursively:1];
          if (([v13 saveToDB] & 1) == 0)
          {
            uint64_t v17 = [v13 db];
            v18 = [v17 lastError];
            v19 = v18;
            if (v18)
            {
              id v20 = v18;
            }
            else
            {
              v21 = brc_bread_crumbs();
              v22 = brc_default_log();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
                -[BRCAppLibrary(FPFSAdditions) _recursivelyDeleteItemsUnderItemID:filterPredicate:]((uint64_t)v21, v22);
              }

              objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: Failed to save to db without an error");
              id v20 = (id)objc_claimAutoreleasedReturnValue();
            }
            v16 = v20;

            goto LABEL_19;
          }
        }
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  v16 = 0;
LABEL_19:

  return v16;
}

- (id)deleteAppLibrary
{
  v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[BRCAppLibrary(FPFSAdditions) deleteAppLibrary]();
  }

  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy_;
  __int16 v13 = __Block_byref_object_dispose_;
  id v14 = 0;
  db = self->_db;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__BRCAppLibrary_FPFSAdditions__deleteAppLibrary__block_invoke;
  v8[3] = &unk_26507E928;
  v8[4] = self;
  v8[5] = &v9;
  [(BRCPQLConnection *)db groupInBatch:v8];
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __48__BRCAppLibrary_FPFSAdditions__deleteAppLibrary__block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (([*(id *)(a1 + 32) includesDataScope] & 1) == 0)
  {
    uint64_t v12 = *(void **)(a1 + 32);
    __int16 v13 = [v12 rootItemGlobalID];
    id v14 = [MEMORY[0x263F08A98] predicateWithValue:1];
    id v4 = [v12 _recursivelyDeleteItemsUnderItemID:v13 filterPredicate:v14];

    if (v4) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4);
    }
    brc_bread_crumbs();
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      long long v25 = [*(id *)(a1 + 32) rootItemGlobalID];
      int v27 = 138412802;
      long long v28 = v25;
      __int16 v29 = 2112;
      uint64_t v30 = (uint64_t)v4;
      __int16 v31 = 2112;
      id v32 = v15;
      _os_log_debug_impl(&dword_23FA42000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] Recursively delete items under rootItemGlobalID %@ - %@%@", (uint8_t *)&v27, 0x20u);
    }
    goto LABEL_12;
  }
  v2 = brc_bread_crumbs();
  v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __48__BRCAppLibrary_FPFSAdditions__deleteAppLibrary__block_invoke_cold_1((uint64_t)v2, v3);
  }

  id v4 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global];
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = [v5 rootItemGlobalID];
  uint64_t v7 = [v5 _recursivelyDeleteItemsUnderItemID:v6 filterPredicate:v4];

  uint64_t v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    long long v24 = [*(id *)(a1 + 32) rootItemGlobalID];
    int v27 = 138412802;
    long long v28 = v24;
    __int16 v29 = 2112;
    uint64_t v30 = v7;
    __int16 v31 = 2112;
    id v32 = v8;
    _os_log_debug_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] Recursively delete items under rootItemGlobalID %@ - %@%@", (uint8_t *)&v27, 0x20u);
  }
  if (v7)
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v7;

    return;
  }
  uint64_t v17 = *(void **)(a1 + 32);
  v18 = [v17 documentsFolder];
  v19 = [v18 itemGlobalID];
  id v20 = [MEMORY[0x263F08A98] predicateWithValue:1];
  id v15 = [v17 _recursivelyDeleteItemsUnderItemID:v19 filterPredicate:v20];

  v21 = brc_bread_crumbs();
  v22 = brc_default_log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    long long v26 = [*(id *)(a1 + 32) rootItemGlobalID];
    int v27 = 138412802;
    long long v28 = v26;
    __int16 v29 = 2112;
    uint64_t v30 = (uint64_t)v15;
    __int16 v31 = 2112;
    id v32 = v21;
    _os_log_debug_impl(&dword_23FA42000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] Recursively delete items under rootItemGlobalID %@ - %@%@", (uint8_t *)&v27, 0x20u);
  }
  if (v15)
  {
    uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8);
    id v15 = v15;
    v16 = *(NSObject **)(v23 + 40);
    *(void *)(v23 + 40) = v15;
LABEL_12:
  }
  [*(id *)(*(void *)(a1 + 32) + 64) flush];
}

uint64_t __48__BRCAppLibrary_FPFSAdditions__deleteAppLibrary__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 itemID];
  uint64_t v3 = [v2 isDocumentsFolder] ^ 1;

  return v3;
}

- (NSString)logName
{
  return self->_appLibraryID;
}

- (BOOL)isCloudDocsAppLibrary
{
  return [(NSString *)self->_appLibraryID isEqualToString:*MEMORY[0x263F324E8]];
}

- (BOOL)isDesktopAppLibrary
{
  return 0;
}

- (BOOL)isDocumentsAppLibrary
{
  return 0;
}

- (BOOL)isiCloudDesktopAppLibrary
{
  if ([(BRCAppLibrary *)self isDesktopAppLibrary]) {
    return 1;
  }
  return [(BRCAppLibrary *)self isDocumentsAppLibrary];
}

- (unint64_t)syncedFolderType
{
  return 1;
}

- (BOOL)includesDataScope
{
  return ![(BRCAppLibrary *)self isCloudDocsAppLibrary];
}

- (BOOL)rootRecordCreated
{
  return (LOBYTE(self->_state) >> 1) & 1;
}

- (void)setNeedsSave:(BOOL)a3
{
  if (self->_needsSave != a3)
  {
    if (a3)
    {
      [(BRCPQLConnection *)self->_db forceBatchStart];
      uint64_t v5 = brc_bread_crumbs();
      id v6 = brc_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        -[BRCAppLibrary setNeedsSave:]();
      }
    }
    self->_needsSave = a3;
  }
}

- (NSString)absolutePath
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_msgSend(NSString, "br_currentMobileDocumentsDir");
  id v4 = [(BRCAppLibrary *)self pathRelativeToRoot];
  uint64_t v5 = [v3 stringByAppendingPathComponent:v4];

  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    uint64_t v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      uint64_t v11 = v7;
      _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] no path for an app library%@", (uint8_t *)&v10, 0xCu);
    }
  }
  return (NSString *)v5;
}

- (NSURL)url
{
  v2 = [(BRCAppLibrary *)self absolutePath];
  if (v2) {
    uint64_t v3 = (void *)[objc_alloc(NSURL) initFileURLWithPath:v2 isDirectory:1];
  }
  else {
    uint64_t v3 = 0;
  }

  return (NSURL *)v3;
}

- (BOOL)hasActiveQueries
{
  return atomic_load_explicit((atomic_ullong *volatile)&self->_activeQueries, memory_order_acquire) != 0;
}

- (BOOL)hasActiveRecursiveQueries
{
  return atomic_load_explicit((atomic_ullong *volatile)&self->_activeRecursiveQueries, memory_order_acquire) != 0;
}

- (BRCAppLibrary)init
{
  uint64_t v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  uint64_t v5 = [NSString stringWithUTF8String:"-[BRCAppLibrary init]"];
  [v3 raise:v4, @"Don't call %@.", v5 format];

  return 0;
}

- (BRCAppLibrary)initWithMangledID:(id)a3 dbRowID:(id)a4 zoneRowID:(id)a5 db:(id)a6 plist:(id)a7 session:(id)a8 initialCreation:(BOOL)a9 createdRootOnDisk:(BOOL)a10 createdCZMMoved:(BOOL)a11 rootFileID:(id)a12 childBasehashSalt:(id)a13 saltingState:(unsigned int)a14
{
  id v20 = a3;
  id v21 = a4;
  id obj = a5;
  id v22 = a5;
  id v65 = a6;
  id v23 = a7;
  id v64 = a8;
  id v63 = a12;
  id v24 = a13;
  if (v21)
  {
    if (v22) {
      goto LABEL_3;
    }
    goto LABEL_20;
  }
  id v58 = v23;
  id v44 = v22;
  v45 = brc_bread_crumbs();
  v46 = brc_default_log();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT)) {
    -[BRCAppLibrary initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:]();
  }

  id v22 = v44;
  id v23 = v58;
  if (!v22)
  {
LABEL_20:
    id v59 = v23;
    id v47 = v22;
    v48 = brc_bread_crumbs();
    v49 = brc_default_log();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT)) {
      -[BRCAppLibrary initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:].cold.4();
    }

    id v22 = v47;
    id v23 = v59;
  }
LABEL_3:
  if (([v20 isPrivate] & 1) == 0)
  {
    id v60 = v23;
    id v50 = v22;
    v51 = brc_bread_crumbs();
    v52 = brc_default_log();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT)) {
      -[BRCAppLibrary initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:]();
    }

    id v22 = v50;
    id v23 = v60;
  }
  v66.receiver = self;
  v66.super_class = (Class)BRCAppLibrary;
  long long v25 = [(BRCAppLibrary *)&v66 init];
  if (v25)
  {
    id v56 = v22;
    id v57 = v23;
    if (v23 && a9)
    {
      long long v26 = brc_bread_crumbs();
      int v27 = brc_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
        -[BRCAppLibrary initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:]();
      }
    }
    id v28 = [v20 appLibraryOrZoneName];
    uint64_t v29 = brc_task_tracker_create((const char *)[v28 UTF8String]);
    tracker = v25->_tracker;
    v25->_tracker = (brc_task_tracker *)v29;

    objc_storeStrong((id *)&v25->_db, a6);
    objc_storeStrong((id *)&v25->_dbRowID, a4);
    objc_storeStrong((id *)&v25->_zoneRowID, obj);
    objc_storeStrong((id *)&v25->_session, a8);
    uint64_t v31 = objc_opt_new();
    targetSharedServerZones = v25->_targetSharedServerZones;
    v25->_targetSharedServerZones = (NSMutableSet *)v31;

    uint64_t v33 = [MEMORY[0x263EFF9C0] set];
    foregroundClients = v25->_foregroundClients;
    v25->_foregroundClients = (NSMutableSet *)v33;

    objc_storeStrong((id *)&v25->_fileID, a12);
    objc_storeStrong((id *)&v25->_mangledID, a3);
    uint64_t v35 = [v20 appLibraryOrZoneName];
    appLibraryID = v25->_appLibraryID;
    v25->_appLibraryID = (NSString *)v35;

    if (a9)
    {
      unsigned int state = v25->_state;
      v25->_unsigned int state = state | 0x140000;
      id v23 = v57;
      id v38 = a13;
      if (a11) {
        v25->_unsigned int state = state | 0x340000;
      }
    }
    else
    {
      id v23 = v57;
      id v38 = a13;
      if (!v21)
      {
        id v53 = v24;
        v54 = brc_bread_crumbs();
        v55 = brc_default_log();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT)) {
          -[BRCAppLibrary initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:]();
        }

        id v23 = v57;
        id v24 = v53;
      }
      [(BRCAppLibrary *)v25 updateWithPlist:v23];
    }
    uint64_t v39 = [MEMORY[0x263F32588] containerForMangledID:v20];
    containerMetadata = v25->_containerMetadata;
    v25->_containerMetadata = (BRContainer *)v39;

    [(BRCAppLibrary *)v25 _updateIsInCloudDocsZone];
    v25->_saltingState = a14;
    objc_storeStrong((id *)&v25->_childBasehashSalt, v38);
    dispatch_group_t v41 = dispatch_group_create();
    forceIngestionGroup = v25->_forceIngestionGroup;
    v25->_forceIngestionGroup = (OS_dispatch_group *)v41;

    id v22 = v56;
  }

  return v25;
}

- (void)updateWithPlist:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"state"];
  self->_unsigned int state = [v5 unsignedIntValue];

  id v6 = [v4 objectForKeyedSubscript:@"fileID"];
  fileID = self->_fileID;
  self->_fileID = v6;

  uint64_t v8 = [v4 objectForKeyedSubscript:@"generationID"];
  generationID = self->_generationID;
  self->_generationID = v8;

  int v10 = [v4 objectForKeyedSubscript:@"metadataChangetag"];
  containerMetadataEtag = self->_containerMetadataEtag;
  self->_containerMetadataEtag = v10;

  uint64_t v12 = [v4 objectForKeyedSubscript:@"metadataNeedsSyncUp"];

  self->_containerMetadataNeedsSyncUp = [v12 BOOLValue];
  uint64_t v13 = ([(BRCAppLibrary *)self state] >> 18) & 1;
  containerMetadata = self->_containerMetadata;
  [(BRContainer *)containerMetadata setIsInInitialState:v13];
}

- (void)associateWithClientZone:(id)a3
{
}

- (void)associateWithClientZone:(id)a3 offline:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!v4) {
    [(BRCPQLConnection *)self->_db assertOnQueue];
  }
  if (!v6)
  {
    uint64_t v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[BRCAppLibrary associateWithClientZone:offline:]();
    }
  }
  uint64_t v9 = self;
  objc_sync_enter(v9);
  if ([(NSMutableSet *)v9->_foregroundClients count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v9->_defaultClientZone);
    uint64_t v11 = [WeakRetained serverZone];
    [v11 removeForegroundClient:v9];

    uint64_t v12 = [v6 serverZone];
    [v12 addForegroundClient:v9];
  }
  objc_storeWeak((id *)&v9->_defaultClientZone, v6);
  uint64_t v13 = [v6 dbRowID];
  zoneRowID = v9->_zoneRowID;
  v9->_zoneRowID = (BRCZoneRowID *)v13;

  objc_sync_exit(v9);
  [v6 addAppLibrary:v9 offline:v4];
  [(BRCAppLibrary *)v9 _updateIsInCloudDocsZone];
}

- (BOOL)isDocumentScopePublic
{
  v2 = [(BRCAppLibrary *)self containerMetadata];
  char v3 = [v2 isDocumentScopePublic];

  return v3;
}

- (NSMutableDictionary)plist
{
  char v3 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:12];
  BOOL v4 = [NSNumber numberWithUnsignedInt:self->_state];
  [v3 setObject:v4 forKeyedSubscript:@"state"];

  fileID = self->_fileID;
  if (fileID) {
    [v3 setObject:fileID forKeyedSubscript:@"fileID"];
  }
  generationID = self->_generationID;
  if (generationID) {
    [v3 setObject:generationID forKeyedSubscript:@"generationID"];
  }
  containerMetadataEtag = self->_containerMetadataEtag;
  if (containerMetadataEtag) {
    [v3 setObject:containerMetadataEtag forKeyedSubscript:@"metadataChangetag"];
  }
  if (self->_containerMetadataNeedsSyncUp) {
    [v3 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"metadataNeedsSyncUp"];
  }
  [v3 setObject:self->_rootQuotaUsage forKeyedSubscript:@"rootQuota"];
  return (NSMutableDictionary *)v3;
}

- (void)close
{
  OUTLINED_FUNCTION_12();
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2 = [v1 appLibraryID];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_23FA42000, v0, v3, "[DEBUG] closing app library: %@%@", v4);
}

- (BOOL)isAppInstalled
{
  return (self->_state & 0x800000) == 0;
}

- (void)activate
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: !_activated%@", v2, v3, v4, v5, v6);
}

- (unsigned)_activateState:(unsigned int)a3 origState:(unsigned int)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  [(BRCPQLConnection *)self->_db assertOnQueue];
  uint64_t v7 = [(BRCAppLibrary *)self defaultClientZone];
  if (a3 != 0x1000000 && (a3 & 0x1000000) != 0)
  {
    dispatch_group_t v41 = brc_bread_crumbs();
    v42 = brc_default_log();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT)) {
      -[BRCAppLibrary _activateState:origState:]();
    }
  }
  if (self->_state != a3)
  {
    [(BRCAppLibrary *)self setNeedsSave:1];
    self->_unsigned int state = a3;
  }
  if ([(BRCAppLibrary *)self isCloudDocsAppLibrary]
    || [(BRCAppLibrary *)self isiCloudDesktopAppLibrary])
  {
    unsigned int state = self->_state & 0xFFFBFFFF;
    self->_unsigned int state = state;
  }
  else
  {
    unsigned int state = self->_state;
  }
  unsigned int v9 = state ^ a4;
  if (state != a4)
  {
    if (self->_needsSave)
    {
      int v10 = brc_bread_crumbs();
      uint64_t v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v40 = BRCPrettyPrintBitmapWithContext(a4, (uint64_t)&applibrary_state_entries, 0);
        *(_DWORD *)buf = 138412802;
        v46 = self;
        __int16 v47 = 2112;
        v48 = v40;
        __int16 v49 = 2112;
        id v50 = v10;
        _os_log_debug_impl(&dword_23FA42000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ state changed, was %@%@", buf, 0x20u);
      }
    }
    if ((v9 & 0x1000000) != 0 && (self->_state & 8) != 0) {
      [(BRCAppLibrary *)self reimportLibraryRootAndFinishResetWithCompletion:0];
    }
    if ((v9 & 0x80000) != 0 && (self->_state & 0x80000) == 0) {
      [v7 scheduleSyncUp];
    }
    if ((v9 & 0x1800000) == 0x800000)
    {
      uint64_t v12 = [(BRCAppLibrary *)self fetchRootItem];
      uint64_t v13 = [v12 fileObjectID];
      id v14 = [v13 asString];
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __42__BRCAppLibrary__activateState_origState___block_invoke;
      v44[3] = &unk_26507EBD8;
      v44[4] = self;
      +[BRCImportUtil forceIngestionForItemID:v14 completionHandler:v44];

      if ((a4 & 0x800000) == 0)
      {
        id v15 = brc_bread_crumbs();
        v16 = brc_default_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v46 = self;
          __int16 v47 = 2112;
          v48 = v15;
          _os_log_impl(&dword_23FA42000, v16, OS_LOG_TYPE_DEFAULT, "[NOTICE] evicting everything in %@ because the app was removed%@", buf, 0x16u);
        }

        uint64_t v17 = objc_msgSend(MEMORY[0x263F055B8], "br_sharedProviderManager");
        v18 = [(BRCAppLibrary *)self rootFileObjectID];
        v19 = [v18 asString];
        v43[0] = MEMORY[0x263EF8330];
        v43[1] = 3221225472;
        v43[2] = __42__BRCAppLibrary__activateState_origState___block_invoke_28;
        v43[3] = &unk_26507EBD8;
        v43[4] = self;
        [v17 evictItemWithIdentifier:v19 completionHandler:v43];
      }
    }
    if ((v9 & 0x40000) != 0)
    {
      unsigned int v20 = [(BRCAppLibrary *)self state];
      [(BRContainer *)self->_containerMetadata setIsInInitialState:(v20 >> 18) & 1];
      [MEMORY[0x263F32588] postContainerListUpdateNotification];
      if ([(BRContainer *)self->_containerMetadata isInInitialState])
      {
        if ([(NSString *)self->_appLibraryID isEqualToString:*MEMORY[0x263F32320]])
        {
          id v21 = [(BRCAppLibrary *)self defaultClientZone];
          char v22 = [v21 hasCompletedInitialSyncDownOnce];

          if ((v22 & 1) == 0) {
            [(BRCAppLibrary *)self addForegroundClient:self];
          }
        }
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_pristineFetchOp);
      id v24 = WeakRetained;
      if ((v20 & 0x40000) == 0 && WeakRetained)
      {
        [WeakRetained endObservingChangesWithDelegate:self];
        objc_storeWeak((id *)&self->_pristineFetchOp, 0);
      }
    }
    if ((v9 & 0x4000000) != 0 && ([(BRCAppLibrary *)self state] & 0x4000000) != 0)
    {
      BOOL v25 = [(BRCAppLibrary *)self includesDataScope];
      if ((a4 & 0x1000000) == 0 && v25)
      {
        long long v26 = [(BRCAppLibrary *)self defaultClientZone];
        int v27 = [(BRCAppLibrary *)self documentsFolderItemID];
        id v28 = [v26 itemByItemID:v27];
        uint64_t v29 = [v28 asDirectory];

        uint64_t v30 = [v29 clientZone];
        uint64_t v31 = [v29 itemID];
        id v32 = [v30 serverItemByItemID:v31];

        uint64_t v33 = [v29 st];
        uint64_t v34 = v33;
        if (v32)
        {
          uint64_t v35 = [v32 st];
          objc_msgSend(v34, "setType:", objc_msgSend(v35, "type"));
        }
        else
        {
          [v33 setType:0];
        }

        v36 = brc_bread_crumbs();
        v37 = brc_default_log();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
          -[BRCAppLibrary _activateState:origState:]();
        }

        [v29 saveToDB];
      }
    }
    if (([(BRCAppLibrary *)self state] & 0x4040000) == 0x40000) {
      [(BRCAppLibrary *)self fetchPristineness];
    }
    if ((v9 & 0x4000000) != 0 && ([(BRCAppLibrary *)self state] & 0x14000000) == 0x4000000) {
      [(BRCAppLibrary *)self fetchTrashItems];
    }
    if ((a4 & 0x140000) != 0 && (v9 & 0x140000) != 0) {
      [v7 scheduleSyncUp];
    }
    if ((v9 & 0x200000) != 0 && ![(BRCAppLibrary *)self isCloudDocsAppLibrary])
    {
      [(BRCAppLibrary *)self zoneDidChangeMovedToCloudDocsState];
      if ([(BRCAppLibrary *)self wasMovedToCloudDocs])
      {
        id v38 = [(BRCAccountSessionFPFS *)self->_session applyScheduler];
        [v38 didCompleteCrossZoneMigrationForAppLibrary:self];
      }
    }
  }
  [v7 _flushIdleBlocksIfNeeded];

  return v9;
}

void __42__BRCAppLibrary__activateState_origState___block_invoke()
{
  v0 = brc_bread_crumbs();
  uint64_t v1 = brc_default_log();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    __42__BRCAppLibrary__activateState_origState___block_invoke_cold_1();
  }
}

void __42__BRCAppLibrary__activateState_origState___block_invoke_28(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_debug_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] Finish evicting %@ with error %@%@", (uint8_t *)&v7, 0x20u);
  }
}

- (BOOL)setStateBits:(unsigned int)a3
{
  unsigned int state = self->_state;
  BOOL v4 = (a3 & ~state) != 0;
  -[BRCAppLibrary _activateState:origState:](self, "_activateState:origState:", state | a3);
  return v4;
}

- (void)clearStateBits:(unsigned int)a3
{
}

- (void)didUpdateDocumentScopePublic
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = brc_bread_crumbs();
  BOOL v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = [(BRCAppLibrary *)self appLibraryID];
    uint64_t v6 = [(BRCAppLibrary *)self containerMetadata];
    int v7 = [v6 isDocumentScopePublic];
    uint64_t v8 = @"private";
    *(_DWORD *)uint64_t v13 = 138412802;
    *(void *)&v13[4] = v5;
    *(_WORD *)&v13[12] = 2112;
    if (v7) {
      uint64_t v8 = @"public";
    }
    *(void *)&v13[14] = v8;
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_impl(&dword_23FA42000, v4, OS_LOG_TYPE_INFO, "[INFO] %@ becomes %@%@", v13, 0x20u);
  }
  __int16 v9 = [(BRCAppLibrary *)self defaultClientZone];
  [(BRCAccountSessionFPFS *)self->_session recomputeAppSyncBlockStateForPrivateClientZone:v9];
  [(BRCAppLibrary *)self fetchPristineness];
  id v10 = [(BRCAppLibrary *)self containerMetadata];
  if ([v10 isDocumentScopePublic])
  {
    BOOL v11 = [(BRCAppLibrary *)self wasMovedToCloudDocs];

    if (!v11) {
      [v9 clearAndRefetchRecentAndFavoriteDocuments];
    }
  }
  else
  {
  }
  uint64_t v12 = [(BRCAppLibrary *)self documentsFolder];
  [v12 documentsDirectoryUpdatedDocumentsScopePublic];
  [v12 saveToDB];
}

- (BOOL)isGreedy
{
  id v3 = [(BRCAppLibrary *)self session];
  char v4 = [v3 hasOptimizeStorageEnabled];

  if (v4)
  {
    uint64_t v5 = +[BRCUserDefaults defaultsForMangledID:self->_mangledID];
    if ([v5 shouldAppLibraryBeGreedy])
    {
      uint64_t v6 = brc_bread_crumbs();
      int v7 = brc_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[BRCAppLibrary isGreedy]();
      }

LABEL_16:
      char v10 = 1;
      goto LABEL_18;
    }
    if (![(BRCAppLibrary *)self shouldEvictUploadedItems])
    {
      BOOL v11 = [(BRCAppLibrary *)self session];
      char v10 = [v11 isGreedy];

      goto LABEL_18;
    }
    uint64_t v8 = brc_bread_crumbs();
    __int16 v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[BRCAppLibrary isGreedy]();
    }
  }
  else
  {
    if (![(BRCAppLibrary *)self shouldEvictUploadedItems])
    {
      uint64_t v5 = brc_bread_crumbs();
      uint64_t v6 = brc_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        -[BRCAppLibrary isGreedy].cold.4();
      }
      goto LABEL_16;
    }
    uint64_t v5 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[BRCAppLibrary isGreedy]();
    }
  }

  char v10 = 0;
LABEL_18:

  return v10;
}

- (BOOL)isEqualToAppLibrary:(id)a3
{
  char v4 = a3;
  uint64_t v5 = [v4 mangledID];
  if (v5) {
    char v6 = [(BRMangledID *)self->_mangledID isEqualToMangledID:v4[6]];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(BRMangledID *)self->_mangledID hash];
}

- (BOOL)isEqual:(id)a3
{
  char v4 = (BRCAppLibrary *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(BRCAppLibrary *)self isEqualToAppLibrary:v4];
  }

  return v5;
}

- (NSString)description
{
  return (NSString *)[(BRCAppLibrary *)self descriptionWithContext:0];
}

- (id)_unwrappedDescriptionWithContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BRCAppLibrary *)self transferSyncContextIfExists];

  if (v5)
  {
    if ([(BRCAppLibrary *)self isForeground])
    {
      char v6 = @"foreground";
      uint64_t v7 = 7;
      goto LABEL_7;
    }
    char v6 = @"background";
  }
  else
  {
    char v6 = @"NA";
  }
  uint64_t v7 = 2;
LABEL_7:
  uint64_t v8 = +[BRCDumpContext highlightedString:v6 type:v7 context:v4];
  id v9 = objc_alloc(MEMORY[0x263F089D8]);
  appLibraryID = self->_appLibraryID;
  dbRowID = self->_dbRowID;
  uint64_t v12 = BRCPrettyPrintBitmapWithContext(self->_state, (uint64_t)&applibrary_state_entries, v4);
  uint64_t v13 = (void *)[v9 initWithFormat:@"%@[%@] %@ {s:%@} ino:%@ gen:%@", appLibraryID, dbRowID, v8, v12, self->_fileID, self->_generationID];

  [v13 appendString:@" queries:"];
  if ([(BRCAppLibrary *)self hasActiveQueries]) {
    [v13 appendString:@"q"];
  }
  if ([(BRCAppLibrary *)self hasActiveRecursiveQueries]) {
    [v13 appendString:@"r"];
  }
  if ([(BRCAppLibrary *)self containerMetadataNeedsSyncUp]) {
    __int16 v14 = "needs-sync-up";
  }
  else {
    __int16 v14 = "idle";
  }
  id v15 = [(BRCAppLibrary *)self containerMetadataEtag];
  uint64_t v16 = [(BRCAppLibrary *)self containerMetadata];
  uint64_t v17 = [v16 shortDescription];
  [v13 appendFormat:@" metadata:%s etag:%@ %@", v14, v15, v17];

  v18 = [(BRCAppLibrary *)self containerMetadata];
  v19 = [v18 bundleIdentifiers];

  if ([v19 count])
  {
    unsigned int v20 = [v19 allObjects];
    id v21 = [v20 componentsJoinedByString:@", "];
    [v13 appendFormat:@" bundles:{%@}", v21];
  }
  char v22 = +[BRCUserDefaults defaultsForMangledID:0];
  int v23 = [v22 supportsEnhancedDrivePrivacy];

  if (v23)
  {
    uint64_t saltingState = (int)self->_saltingState;
    BOOL v25 = saltingState > 3 ? @"no server item" : off_265081498[saltingState];
    [v13 appendFormat:@" salt-st{%@}", v25];
    childBasehashSalt = self->_childBasehashSalt;
    if (childBasehashSalt)
    {
      int v27 = [(NSData *)childBasehashSalt brc_truncatedSHA256];
      id v28 = objc_msgSend(v27, "brc_hexadecimalString");
      [v13 appendFormat:@" child-base-salt-validation{%@}", v28];
    }
  }

  return v13;
}

- (id)descriptionWithContext:(id)a3
{
  id v4 = (objc_class *)NSString;
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v7 = [(BRCAppLibrary *)self _unwrappedDescriptionWithContext:v5];

  uint64_t v8 = (void *)[v6 initWithFormat:@"<%@>", v7];
  return v8;
}

- (void)dumpToContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(BRCAppLibrary *)self descriptionWithContext:v4];
  [v4 writeLineWithFormat:@"+ app library: %@", v5];

  if ([(BRCAppLibrary *)self isForeground])
  {
    [v4 pushIndentation];
    [v4 writeLineWithFormat:@"+ foreground clients:"];
    [v4 pushIndentation];
    id v6 = self;
    objc_sync_enter(v6);
    uint64_t v7 = (void *)[(NSMutableSet *)v6->_foregroundClients copy];
    objc_sync_exit(v6);

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v8);
          }
          [v4 writeLineWithFormat:@"%@", *(void *)(*((void *)&v12 + 1) + 8 * v11++)];
        }
        while (v9 != v11);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }

    [v4 popIndentation];
    [v4 popIndentation];
  }
}

- (id)itemsEnumeratorWithRankMin:(unint64_t)a3 rankMax:(unint64_t)a4 namePrefix:(id)a5 withDeadItems:(BOOL)a6 shouldIncludeFolders:(BOOL)a7 shouldIncludeOnlyFolders:(BOOL)a8 shouldIncludeDocumentsScope:(BOOL)a9 shouldIncludeDataScope:(BOOL)a10 shouldIncludeExternalScope:(BOOL)a11 shouldIncludeTrashScope:(BOOL)a12 count:(unint64_t)a13 db:(id)a14
{
  BOOL v61 = a6;
  BOOL v62 = a8;
  BOOL v14 = a7;
  id v17 = a5;
  id v18 = a14;
  if (itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__once == -1)
  {
    if (a9) {
      goto LABEL_9;
    }
  }
  else
  {
    dispatch_once(&itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__once, &__block_literal_global_19);
    if (a9) {
      goto LABEL_9;
    }
  }
  if (a10 || a11)
  {
LABEL_9:
    BOOL v60 = v14;
    unint64_t v58 = a4;
    unint64_t v59 = a3;
    if ([v17 length])
    {
      id v22 = v17;
      int v23 = objc_msgSend(v17, "br_stringByBackslashEscapingCharactersInString:", @"\\_%");
      id v24 = [NSString stringWithFormat:@"%@%%", v23];
      BOOL v25 = [NSString stringWithFormat:@"%% %@%%", v23];
      v19 = [MEMORY[0x263F8C710] formatInjection:@"AND (item_filename LIKE %@ ESCAPE '\\' OR item_filename LIKE %@ ESCAPE '\\')", v24, v25];

      if (a9) {
        goto LABEL_15;
      }
    }
    else
    {
      id v22 = v17;
      v19 = [MEMORY[0x263F8C720] rawInjection:"" length:0];
      if (a9) {
        goto LABEL_15;
      }
    }
    if (!a10)
    {
      uint64_t v20 = 0;
      goto LABEL_20;
    }
LABEL_15:
    long long v26 = &itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInEitherScope;
    if (!a9 || !a10) {
      long long v26 = &itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInDocumentScope;
    }
    if (!a9) {
      long long v26 = &itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInDataScope;
    }
    uint64_t v20 = (uint64_t)(id)*v26;
LABEL_20:
    id v17 = v22;
    int v27 = (void *)itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInExternalScope;
    if (a11) {
      id v28 = (void *)itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInExternalScope;
    }
    else {
      id v28 = 0;
    }
    unint64_t v29 = v28;
    if (v20 | v29)
    {
      uint64_t v30 = (void *)itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInTrashScope;
      if (!a12) {
        uint64_t v30 = 0;
      }
      id v31 = v30;
      id v32 = (void *)MEMORY[0x263F8C710];
      uint64_t v33 = (void *)v20;
      if (v20)
      {
        if (v29) {
          goto LABEL_28;
        }
        goto LABEL_56;
      }
    }
    else
    {
      id v44 = brc_bread_crumbs();
      v45 = brc_default_log();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT)) {
        -[BRCAppLibrary itemsEnumeratorWithRankMin:rankMax:namePrefix:withDeadItems:shouldIncludeFolders:shouldIncludeOnlyFolders:shouldIncludeDocumentsScope:shouldIncludeDataScope:shouldIncludeExternalScope:shouldIncludeTrashScope:count:db:]();
      }

      v46 = (void *)itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInTrashScope;
      if (!a12) {
        v46 = 0;
      }
      id v31 = v46;
      id v32 = (void *)MEMORY[0x263F8C710];
    }
    uint64_t v33 = [MEMORY[0x263F8C720] rawInjection:"0" length:1];
    if (v29)
    {
LABEL_28:
      if (v31) {
        goto LABEL_29;
      }
      goto LABEL_57;
    }
LABEL_56:
    int v27 = [MEMORY[0x263F8C720] rawInjection:"0" length:1];
    if (v31)
    {
LABEL_29:
      uint64_t v34 = [v32 formatInjection:@"AND ((%@) OR (%@) OR (%@))", v33, v27, v31];
      if (v29) {
        goto LABEL_31;
      }
      goto LABEL_30;
    }
LABEL_57:
    __int16 v47 = [MEMORY[0x263F8C720] rawInjection:"0" length:1];
    uint64_t v34 = [v32 formatInjection:@"AND ((%@) OR (%@) OR (%@))", v33, v27, v47];

    if (v29)
    {
LABEL_31:
      if (!v20) {

      }
      dbRowID = self->_dbRowID;
      int v36 = !v60 || v62;
      if (v61)
      {
        if (v36)
        {
          v37 = &itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isFolder;
          if (!v60) {
            v37 = &itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isDocument;
          }
          v54 = v34;
          unint64_t v56 = a13;
          id v50 = v19;
          uint64_t v52 = *v37;
          v48 = self->_dbRowID;
          id v38 = @"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation    FROM client_items   WHERE item_notifs_rank >= %lld     AND item_notifs_rank < %lld     AND +app_library_rowid = %@     AND item_state IN (0, 1)     %@      %@      %@ ORDER BY item_notifs_rank   LIMIT %lld";
LABEL_42:
          v40 = objc_msgSend(v18, "fetch:", v38, v59, v58, v48, v50, v52, v54, v56);
LABEL_46:
          v64[0] = MEMORY[0x263EF8330];
          v64[1] = 3221225472;
          v64[2] = __234__BRCAppLibrary_itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db___block_invoke_131;
          v64[3] = &unk_26507F210;
          v64[4] = self;
          id v65 = v18;
          id v21 = [v40 enumerateObjects:v64];

          goto LABEL_47;
        }
        dispatch_group_t v41 = [MEMORY[0x263F8C720] rawInjection:"" length:0];
        v55 = v34;
        unint64_t v57 = a13;
        uint64_t v51 = v19;
        id v53 = v41;
        __int16 v49 = dbRowID;
        v42 = @"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation    FROM client_items   WHERE item_notifs_rank >= %lld     AND item_notifs_rank < %lld     AND +app_library_rowid = %@     AND item_state IN (0, 1)     %@      %@      %@ ORDER BY item_notifs_rank   LIMIT %lld";
      }
      else
      {
        if (v36)
        {
          uint64_t v39 = &itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isFolder;
          if (!v60) {
            uint64_t v39 = &itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isDocument;
          }
          v54 = v34;
          unint64_t v56 = a13;
          id v50 = v19;
          uint64_t v52 = *v39;
          v48 = self->_dbRowID;
          id v38 = @"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation    FROM client_items   WHERE item_notifs_rank >= %lld     AND item_notifs_rank < %lld     AND +app_library_rowid = %@     AND item_state IN (0)     %@      %@      %@ ORDER BY item_notifs_rank   LIMIT %lld";
          goto LABEL_42;
        }
        dispatch_group_t v41 = [MEMORY[0x263F8C720] rawInjection:"" length:0];
        v55 = v34;
        unint64_t v57 = a13;
        uint64_t v51 = v19;
        id v53 = v41;
        __int16 v49 = dbRowID;
        v42 = @"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation    FROM client_items   WHERE item_notifs_rank >= %lld     AND item_notifs_rank < %lld     AND +app_library_rowid = %@     AND item_state IN (0)     %@      %@      %@ ORDER BY item_notifs_rank   LIMIT %lld";
      }
      v40 = objc_msgSend(v18, "fetch:", v42, v59, v58, v49, v51, v53, v55, v57);

      goto LABEL_46;
    }
LABEL_30:

    goto LABEL_31;
  }
  v19 = brc_bread_crumbs();
  uint64_t v20 = brc_default_log();
  if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_FAULT)) {
    -[BRCAppLibrary itemsEnumeratorWithRankMin:rankMax:namePrefix:withDeadItems:shouldIncludeFolders:shouldIncludeOnlyFolders:shouldIncludeDocumentsScope:shouldIncludeDataScope:shouldIncludeExternalScope:shouldIncludeTrashScope:count:db:]();
  }
  id v21 = 0;
LABEL_47:

  return v21;
}

void __234__BRCAppLibrary_itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db___block_invoke()
{
  [MEMORY[0x263F8C720] rawInjection:"item_type != 3" length:14];
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [MEMORY[0x263F8C710] formatInjection:@"item_scope = 2 AND %@", v14];
  uint64_t v1 = (void *)itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInDocumentScope;
  itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInDocumentScope = v0;

  uint64_t v2 = [MEMORY[0x263F8C710] formatInjection:@"item_scope = 1 AND %@", v14];
  id v3 = (void *)itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInDataScope;
  itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInDataScope = v2;

  uint64_t v4 = [MEMORY[0x263F8C710] formatInjection:@"(%@) OR (%@)", itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInDocumentScope, itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInDataScope];
  id v5 = (void *)itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInEitherScope;
  itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInEitherScope = v4;

  uint64_t v6 = [MEMORY[0x263F8C710] formatInjection:@"(   item_scope = 2 OR item_scope = 1) AND item_type = 3"];
  uint64_t v7 = (void *)itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInExternalScope;
  itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInExternalScope = v6;

  uint64_t v8 = [MEMORY[0x263F8C720] rawInjection:"item_scope = 3" length:14];
  uint64_t v9 = (void *)itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInTrashScope;
  itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInTrashScope = v8;

  uint64_t v10 = objc_msgSend(MEMORY[0x263F8C720], "rawInjection:length:", "AND item_type IN (1, 2, 8, 5, 6, 7)", 35);
  uint64_t v11 = (void *)itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isDocument;
  itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isDocument = v10;

  uint64_t v12 = [MEMORY[0x263F8C720] rawInjection:"AND item_type = 0" length:17];
  long long v13 = (void *)itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isFolder;
  itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isFolder = v12;
}

id __234__BRCAppLibrary_itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db___block_invoke_131(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 session];
  uint64_t v8 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:*(void *)(a1 + 40) error:a3];

  return v8;
}

- (id)itemsEnumeratorChildOf:(id)a3 withDeadItems:(BOOL)a4 rankMin:(unint64_t)a5 rankMax:(unint64_t)a6 count:(unint64_t)a7 db:(id)a8
{
  BOOL v11 = a4;
  id v14 = a8;
  id v15 = a3;
  uint64_t v16 = [v15 itemID];
  if (v11)
  {
    id v17 = "";
    uint64_t v18 = 0;
  }
  else
  {
    id v17 = "AND item_state IN (0)";
    uint64_t v18 = 21;
  }
  v19 = [MEMORY[0x263F8C720] rawInjection:v17 length:v18];
  uint64_t v20 = [v15 zoneRowID];

  id v21 = (void *)[v14 fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation    FROM client_items   WHERE item_parent_id = %@      AND item_notifs_rank >= %lld      AND item_notifs_rank < %lld     %@      AND item_parent_zone_rowid = %@ ORDER BY item_notifs_rank   LIMIT %lld", v16, a5, a6, v19, v20, a7];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __79__BRCAppLibrary_itemsEnumeratorChildOf_withDeadItems_rankMin_rankMax_count_db___block_invoke;
  v25[3] = &unk_26507F210;
  v25[4] = self;
  id v26 = v14;
  id v22 = v14;
  int v23 = [v21 enumerateObjects:v25];

  return v23;
}

id __79__BRCAppLibrary_itemsEnumeratorChildOf_withDeadItems_rankMin_rankMax_count_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 session];
  uint64_t v8 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:*(void *)(a1 + 40) error:a3];

  return v8;
}

- (id)enumerateChildrenOfItemGlobalID:(id)a3 sortOrder:(unsigned __int8)a4 offset:(unint64_t)a5 limit:(unint64_t)a6 db:(id)a7
{
  int v10 = a4;
  id v12 = a3;
  id v13 = a7;
  if (v10 == 1)
  {
    id v14 = (void *)MEMORY[0x263F8C720];
    id v15 = "version_mtime DESC";
    uint64_t v16 = 18;
    goto LABEL_5;
  }
  if (!v10)
  {
    id v14 = (void *)MEMORY[0x263F8C720];
    id v15 = "item_filename";
    uint64_t v16 = 13;
LABEL_5:
    id v17 = [v14 rawInjection:v15 length:v16];
    goto LABEL_7;
  }
  id v17 = 0;
LABEL_7:
  uint64_t v18 = [v12 itemID];
  v19 = [v12 zoneRowID];
  uint64_t v20 = (void *)[v13 fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation    FROM client_items   WHERE item_parent_id = %@      AND item_state IN (0)     AND item_parent_zone_rowid = %@ ORDER BY %@   LIMIT  %lld   OFFSET %lld", v18, v19, v17, a6, a5];

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __75__BRCAppLibrary_enumerateChildrenOfItemGlobalID_sortOrder_offset_limit_db___block_invoke;
  v24[3] = &unk_26507F210;
  v24[4] = self;
  id v25 = v13;
  id v21 = v13;
  id v22 = [v20 enumerateObjects:v24];

  return v22;
}

id __75__BRCAppLibrary_enumerateChildrenOfItemGlobalID_sortOrder_offset_limit_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 session];
  uint64_t v8 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:*(void *)(a1 + 40) error:a3];

  return v8;
}

- (id)enumerateUserVisibleChildrenDirectoriesOfItemGlobalID:(id)a3 db:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 itemID];
  uint64_t v9 = [v7 zoneRowID];

  int v10 = (void *)[v6 fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation     FROM client_items    WHERE item_parent_id = %@       AND item_state IN (0)      AND item_type = 0      AND item_parent_zone_rowid = %@       AND item_user_visible = 1  ORDER BY item_filename    LIMIT %lld", v8, v9, 1000];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __74__BRCAppLibrary_enumerateUserVisibleChildrenDirectoriesOfItemGlobalID_db___block_invoke;
  v14[3] = &unk_26507F210;
  v14[4] = self;
  id v15 = v6;
  id v11 = v6;
  id v12 = [v10 enumerateObjects:v14];

  return v12;
}

id __74__BRCAppLibrary_enumerateUserVisibleChildrenDirectoriesOfItemGlobalID_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 session];
  uint64_t v8 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:*(void *)(a1 + 40) error:a3];

  return v8;
}

- (void)didRemoveDocumentsFolder
{
}

- (void)didCreateDocumentScopedItem
{
}

- (void)didCreateDataScopedItem
{
}

- (void)fetchPristineness
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Listing documents folder to fetch pristineness for %@%@");
}

- (void)scheduleFullLibraryContentsFetch
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: We shouldn't be scheduling a full app library contents fetch when sync is blocked for %@%@");
}

- (void)fetchTrashItems
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Listing trash folder for %@%@");
}

void __32__BRCAppLibrary_fetchTrashItems__block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    block[7] = v2;
    block[8] = v3;
    id v5 = [*(id *)(*(void *)(a1 + 32) + 64) serialQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __32__BRCAppLibrary_fetchTrashItems__block_invoke_2;
    block[3] = &unk_26507ED70;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(v5, block);
  }
}

uint64_t __32__BRCAppLibrary_fetchTrashItems__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setStateBits:0x10000000];
}

- (void)listOperation:(id)a3 wasReplacedByOperation:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  p_pristineFetchOp = &self->_pristineFetchOp;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pristineFetchOp);

  if (WeakRetained == v10
    || (p_pristineFetchOp = &self->_trashFetchOp,
        id v9 = objc_loadWeakRetained((id *)&self->_trashFetchOp),
        v9,
        v9 == v10))
  {
    objc_storeWeak((id *)p_pristineFetchOp, v6);
  }
}

- (int64_t)throttleHashWithItemID:(id)a3
{
  id v4 = a3;
  id v5 = [(BRCAppLibrary *)self appLibraryID];
  uint64_t v6 = [v5 hash];
  uint64_t v7 = [v4 hash];

  return v7 ^ v6;
}

- (BOOL)hasUbiquitousDocuments
{
  id v2 = [(PQLConnection *)self->_db numberWithSQL:@"SELECT 1 FROM client_items  WHERE item_type NOT IN (0, 9, 10, 4)    AND item_state IN (0)    AND app_library_rowid = %@ LIMIT 1", self->_dbRowID];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)hasLocalChanges
{
  id v2 = [(PQLConnection *)self->_db numberWithSQL:@"SELECT auto_document_with_local_changes_count > 0 FROM app_libraries WHERE rowid = %@", self->_dbRowID];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)zoneHasShareAlias
{
  id v2 = [(PQLConnection *)self->_db numberWithSQL:@"SELECT EXISTS (SELECT 1 FROM server_items WHERE zone_rowid = %@ AND item_type = 3 AND item_alias_target like '%%:\\_%%' ESCAPE '\\')", self->_dbRowID];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)addForegroundClient:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v20 = brc_bread_crumbs();
    id v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      -[BRCAppLibrary addForegroundClient:]();
    }
  }
  id v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = brc_bread_crumbs();
  uint64_t v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v26 = v5;
    __int16 v27 = 2112;
    id v28 = v4;
    __int16 v29 = 2112;
    uint64_t v30 = v6;
    _os_log_debug_impl(&dword_23FA42000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - adding foreground client %@%@", buf, 0x20u);
  }

  uint64_t v8 = [(NSMutableSet *)v5->_foregroundClients count];
  if ([(NSMutableSet *)v5->_foregroundClients containsObject:v4])
  {
    id v22 = brc_bread_crumbs();
    int v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      -[BRCAppLibrary addForegroundClient:]();
    }
  }
  [(NSMutableSet *)v5->_foregroundClients addObject:v4];
  if (!v8)
  {
    id v9 = brc_bread_crumbs();
    id v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[BRCAppLibrary addForegroundClient:]();
    }

    [(BRCAppLibrary *)v5 _resolveTargetSharedClientZonesWhenBecameForeground];
    id v11 = [(BRCAppLibrary *)v5 defaultClientZone];
    id v12 = [v11 serverZone];

    if ([v12 isCloudDocsZone]
      && ([(BRCAppLibrary *)v5 mangledID],
          id v13 = objc_claimAutoreleasedReturnValue(),
          +[BRCUserDefaults defaultsForMangledID:v13],
          id v14 = objc_claimAutoreleasedReturnValue(),
          char v15 = [v14 shouldBoostDefaultZone],
          v14,
          v13,
          (v15 & 1) == 0))
    {
      brc_bread_crumbs();
      uint64_t v16 = (BRCAppLibrary *)objc_claimAutoreleasedReturnValue();
      id v17 = brc_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v16;
        _os_log_impl(&dword_23FA42000, v17, OS_LOG_TYPE_DEFAULT, "[WARNING] Preventing boosting default server zone%@", buf, 0xCu);
      }
    }
    else
    {
      [v12 addForegroundClient:v5];
    }
    uint64_t v18 = [(BRCAppLibrary *)v5 transferSyncContext];
    [v18 addForegroundClient:v5];
    if (![(NSMutableSet *)v5->_targetSharedServerZones count])
    {
      v19 = [(BRCPQLConnection *)v5->_db serialQueue];
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __37__BRCAppLibrary_addForegroundClient___block_invoke;
      v24[3] = &unk_26507ED70;
      v24[4] = v5;
      dispatch_async_with_logs_2(v19, v24);
    }
  }
  objc_sync_exit(v5);
}

void __37__BRCAppLibrary_addForegroundClient___block_invoke(uint64_t a1)
{
  os_log_t v1 = (void *)(a1 + 32);
  if ([*(id *)(a1 + 32) zoneHasShareAlias])
  {
    *(unsigned char *)(*v1 + 81) = 1;
    id v2 = [*(id *)(*v1 + 56) syncContextProvider];
    char v3 = [v2 sharedMetadataSyncContext];

    [v3 addForegroundClient:*v1];
    id v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __37__BRCAppLibrary_addForegroundClient___block_invoke_cold_1(v1);
    }
  }
}

- (void)removeForegroundClient:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v16 = brc_bread_crumbs();
    id v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[BRCAppLibrary addForegroundClient:]();
    }
  }
  id v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = brc_bread_crumbs();
  uint64_t v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v22 = v5;
    __int16 v23 = 2112;
    id v24 = v4;
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_debug_impl(&dword_23FA42000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - removing foreground client %@%@", buf, 0x20u);
  }

  uint64_t v8 = [(NSMutableSet *)v5->_foregroundClients count];
  if (([(NSMutableSet *)v5->_foregroundClients containsObject:v4] & 1) == 0)
  {
    uint64_t v18 = brc_bread_crumbs();
    v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[BRCAppLibrary removeForegroundClient:]();
    }
  }
  [(NSMutableSet *)v5->_foregroundClients removeObject:v4];
  if (v8 && ![(NSMutableSet *)v5->_foregroundClients count])
  {
    id v9 = brc_bread_crumbs();
    id v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[BRCAppLibrary removeForegroundClient:]();
    }

    [(BRCAppLibrary *)v5 _removeAllTargetSharedServerZonesWhenNoLongerForeground];
    id v11 = [(BRCAppLibrary *)v5 defaultClientZone];
    id v12 = [v11 serverZone];

    [v12 removeForegroundClient:v5];
    id v13 = [(BRCAppLibrary *)v5 transferSyncContext];
    [v13 removeForegroundClient:v5];
    id v14 = [(BRCAccountSessionFPFS *)v5->_session clientDB];
    char v15 = [v14 serialQueue];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __40__BRCAppLibrary_removeForegroundClient___block_invoke;
    v20[3] = &unk_26507ED70;
    v20[4] = v5;
    dispatch_async_with_logs_2(v15, v20);
  }
  objc_sync_exit(v5);
}

void __40__BRCAppLibrary_removeForegroundClient___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 81))
  {
    char v3 = [*(id *)(v1 + 56) syncContextProvider];
    id v4 = [v3 sharedMetadataSyncContext];

    [v4 removeForegroundClient:*(void *)(a1 + 32)];
    *(unsigned char *)(*(void *)(a1 + 32) + 81) = 0;
  }
}

- (BOOL)isForeground
{
  id v2 = [(BRCAppLibrary *)self transferSyncContextIfExists];
  char v3 = [v2 isForeground];

  return v3;
}

- (BOOL)integrityCheckBoosting
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  char v3 = [(BRCAccountSessionFPFS *)self->_session clientDB];
  [v3 assertOnQueue];

  id v4 = [(BRCAppLibrary *)self defaultClientZone];
  id v5 = [v4 serverZone];
  uint64_t v6 = [v5 metadataSyncContextIfExists];

  uint64_t v7 = [(BRCAppLibrary *)self transferSyncContextIfExists];
  uint64_t v8 = [(NSMutableSet *)self->_foregroundClients count];
  id v9 = [v7 foregroundClients];
  int v10 = [v9 containsObject:self];

  if (v8)
  {
    if ((v10 & 1) == 0)
    {
      char v15 = brc_bread_crumbs();
      id v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[BRCAppLibrary integrityCheckBoosting].cold.4();
      }
      goto LABEL_36;
    }
    id v11 = [v6 foregroundClients];
    char v12 = [v11 containsObject:self];

    if ((v12 & 1) == 0)
    {
      char v15 = brc_bread_crumbs();
      id v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[BRCAppLibrary integrityCheckBoosting]();
      }
      goto LABEL_36;
    }
    int v36 = v6;
    id v13 = [(BRCAppLibrary *)self _targetSharedServerZonesEnumerator];
    id v14 = [(NSMutableSet *)self->_targetSharedServerZones mutableCopy];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    char v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v37 objects:v47 count:16];
    if (!v16) {
      goto LABEL_14;
    }
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v38;
    uint64_t v35 = v7;
LABEL_6:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v38 != v18) {
        objc_enumerationMutation(v15);
      }
      uint64_t v20 = *(BRCAppLibrary **)(*((void *)&v37 + 1) + 8 * v19);
      if ((-[NSObject containsObject:](v14, "containsObject:", v20, v35) & 1) == 0) {
        break;
      }
      [v14 removeObject:v20];
      id v21 = [(BRCAppLibrary *)v20 transferSyncContextIfExists];
      id v22 = [v21 foregroundClients];
      char v23 = [v22 containsObject:self];

      if ((v23 & 1) == 0)
      {
        id v28 = brc_bread_crumbs();
        id v32 = brc_default_log();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
          goto LABEL_40;
        }
        goto LABEL_34;
      }
      id v24 = [(BRCAppLibrary *)v20 metadataSyncContextIfExists];
      __int16 v25 = [v24 foregroundClients];
      char v26 = [v25 containsObject:self];

      if ((v26 & 1) == 0)
      {
        id v28 = brc_bread_crumbs();
        id v32 = brc_default_log();
        if (!os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
          goto LABEL_34;
        }
LABEL_40:
        *(_DWORD *)buf = 138412802;
        v42 = v20;
        __int16 v43 = 2112;
        id v44 = self;
        __int16 v45 = 2112;
        v46 = v28;
        uint64_t v33 = "[CRIT] UNREACHABLE: target shared zone %@ of %@ should be boosted%@";
LABEL_41:
        _os_log_fault_impl(&dword_23FA42000, v32, OS_LOG_TYPE_FAULT, v33, buf, 0x20u);
        goto LABEL_34;
      }
      if (v17 == ++v19)
      {
        uint64_t v17 = [v15 countByEnumeratingWithState:&v37 objects:v47 count:16];
        uint64_t v7 = v35;
        if (v17) {
          goto LABEL_6;
        }
LABEL_14:

        if ([v14 count])
        {
          uint64_t v27 = brc_bread_crumbs();
          id v28 = brc_default_log();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412802;
            v42 = self;
            __int16 v43 = 2112;
            id v44 = (BRCAppLibrary *)v14;
            __int16 v45 = 2112;
            v46 = v27;
            _os_log_fault_impl(&dword_23FA42000, v28, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: %@ has too many target shared server zones %@%@", buf, 0x20u);
          }
          uint64_t v6 = v36;
LABEL_35:

LABEL_36:
          BOOL v31 = 0;
        }
        else
        {
          BOOL v31 = 1;
          uint64_t v6 = v36;
        }

        goto LABEL_38;
      }
    }
    id v28 = brc_bread_crumbs();
    id v32 = brc_default_log();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      v42 = self;
      __int16 v43 = 2112;
      id v44 = v20;
      __int16 v45 = 2112;
      v46 = v28;
      uint64_t v33 = "[CRIT] UNREACHABLE: %@ has foreground clients but target shared zone %@ isn't targeted%@";
      goto LABEL_41;
    }
LABEL_34:
    uint64_t v7 = v35;
    uint64_t v6 = v36;

    uint64_t v27 = v15;
    goto LABEL_35;
  }
  if (v10)
  {
    char v15 = brc_bread_crumbs();
    id v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[BRCAppLibrary integrityCheckBoosting]();
    }
    goto LABEL_36;
  }
  __int16 v29 = [v6 foregroundClients];
  int v30 = [v29 containsObject:self];

  if (v30)
  {
    char v15 = brc_bread_crumbs();
    id v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[BRCAppLibrary integrityCheckBoosting]();
    }
    goto LABEL_36;
  }
  BOOL v31 = 1;
LABEL_38:

  return v31;
}

- (BOOL)shouldEvictUploadedItems
{
  return BYTE2(self->_state) >> 7;
}

- (void)recomputeShouldEvictState
{
  uint64_t v1 = "evicting uploaded items";
  if ((a1 & 1) == 0) {
    uint64_t v1 = "not evicting uploaded items";
  }
  LODWORD(v4) = 136315394;
  *(void *)((char *)&v4 + 4) = v1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v2, v3, "[DEBUG] evict status remains: %s%@", (void)v4, DWORD2(v4));
}

- (BRCSyncContext)transferSyncContextIfExists
{
  os_log_t v3 = [(BRCAccountSessionFPFS *)self->_session syncContextProvider];
  long long v4 = [(BRCAppLibrary *)self mangledID];
  id v5 = [v3 transferSyncContextForMangledID:v4 createIfNeeded:0];

  return (BRCSyncContext *)v5;
}

- (BRCSyncContext)transferSyncContext
{
  os_log_t v3 = [(BRCAccountSessionFPFS *)self->_session syncContextProvider];
  long long v4 = [(BRCAppLibrary *)self mangledID];
  id v5 = [v3 transferSyncContextForMangledID:v4];

  return (BRCSyncContext *)v5;
}

- (void)didReceiveHandoffRequest
{
  os_log_t v3 = [(BRCAppLibrary *)self defaultClientZone];
  long long v4 = [v3 serverZone];
  id v6 = [v4 metadataSyncContext];

  id v5 = [(BRCAppLibrary *)self transferSyncContext];
  if (v6 != v5) {
    [v6 didReceiveHandoffRequest];
  }
  [v5 didReceiveHandoffRequest];
}

- (NSString)identifier
{
  uint64_t v2 = [(BRCAppLibrary *)self mangledID];
  os_log_t v3 = [v2 mangledIDString];

  return (NSString *)v3;
}

- (id)_targetSharedServerZonesEnumerator
{
  id v3 = [(BRCPQLConnection *)self->_db fetch:@"SELECT DISTINCT ci.zone_rowid FROM client_items AS ci INNER JOIN client_zones AS cz ON ci.zone_rowid = cz.rowid WHERE ci.app_library_rowid = %@   AND ci.item_state IN (0)   AND (ci.item_sharing_options & 4) != 0   AND cz.zone_owner != %@", self->_dbRowID, *MEMORY[0x263EFD488]];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__BRCAppLibrary__targetSharedServerZonesEnumerator__block_invoke;
  v6[3] = &unk_26507F1E8;
  v6[4] = self;
  long long v4 = [v3 enumerateObjects:v6];

  return v4;
}

id __51__BRCAppLibrary__targetSharedServerZonesEnumerator__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 numberAtIndex:0];
  long long v4 = [*(id *)(*(void *)(a1 + 32) + 56) serverZoneByRowID:v3];
  id v5 = [v4 asSharedZone];

  return v5;
}

- (BOOL)isStillTargetingSharedServerZone:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  db = self->_db;
  dbRowID = self->_dbRowID;
  uint64_t v7 = [v4 dbRowID];
  id v8 = [(PQLConnection *)db numberWithSQL:@"SELECT rowid FROM client_items WHERE app_library_rowid = %@ AND zone_rowid = %@ AND (item_sharing_options & 4) != 0 AND item_state IN (0) LIMIT 1", dbRowID, v7];

  uint64_t v9 = [v8 unsignedLongLongValue];
  if (v9)
  {
    int v10 = brc_bread_crumbs();
    id v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218754;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      uint64_t v16 = self;
      __int16 v17 = 2112;
      id v18 = v4;
      __int16 v19 = 2112;
      uint64_t v20 = v10;
      _os_log_debug_impl(&dword_23FA42000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] Item with rowid %llu is still targeting %@ for %@%@", buf, 0x2Au);
    }
  }
  return v9 != 0;
}

- (void)_resolveTargetSharedClientZonesWhenBecameForeground
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] resolving target shared zones for app library %@%@");
}

void __68__BRCAppLibrary__resolveTargetSharedClientZonesWhenBecameForeground__block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFF9C0] set];
  id v4 = *(void **)(a1 + 32);
  id v3 = (id *)(a1 + 32);
  [v4 _targetSharedServerZonesEnumerator];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        [v2 addObject:*(void *)(*((void *)&v23 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v2;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * v14);
        uint64_t v16 = (void *)MEMORY[0x2455D97F0](v11);
        objc_msgSend(*v3, "_addTargetSharedServerZone:", v15, (void)v19);
        ++v14;
      }
      while (v12 != v14);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
      uint64_t v12 = v11;
    }
    while (v11);
  }

  __int16 v17 = brc_bread_crumbs();
  id v18 = brc_default_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    __68__BRCAppLibrary__resolveTargetSharedClientZonesWhenBecameForeground__block_invoke_cold_1((uint64_t)v3, (uint64_t)v17, v18);
  }
}

- (void)_removeAllTargetSharedServerZonesWhenNoLongerForeground
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _foregroundClients.count == 0%@", v2, v3, v4, v5, v6);
}

uint64_t __72__BRCAppLibrary__removeAllTargetSharedServerZonesWhenNoLongerForeground__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 88);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "removeForegroundClient:", *(void *)(a1 + 32), (void)v8);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return [*(id *)(*(void *)(a1 + 32) + 88) removeAllObjects];
}

- (void)_addTargetSharedServerZoneForSharedItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BRCAccountSessionFPFS *)self->_session clientTruthWorkloop];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__BRCAppLibrary__addTargetSharedServerZoneForSharedItem___block_invoke;
  v7[3] = &unk_26507ED98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async_with_logs_2(v5, v7);
}

void __57__BRCAppLibrary__addTargetSharedServerZoneForSharedItem___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) serverZone];
  id v2 = [v3 asSharedZone];
  [v1 _addTargetSharedServerZone:v2];
}

- (void)_removeTargetSharedServerZoneIfNecessary:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 clientZone];
  id v6 = brc_bread_crumbs();
  uint64_t v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v16 = v5;
    __int16 v17 = 2112;
    id v18 = self;
    __int16 v19 = 2112;
    long long v20 = v6;
    _os_log_debug_impl(&dword_23FA42000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] attempting to remove target server zone %@ from %@%@", buf, 0x20u);
  }

  id v8 = [(BRCAccountSessionFPFS *)self->_session clientTruthWorkloop];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __58__BRCAppLibrary__removeTargetSharedServerZoneIfNecessary___block_invoke;
  v11[3] = &unk_26507EDC0;
  id v12 = v4;
  uint64_t v13 = self;
  id v14 = v5;
  id v9 = v5;
  id v10 = v4;
  dispatch_async_with_logs_2(v8, v11);
}

void __58__BRCAppLibrary__removeTargetSharedServerZoneIfNecessary___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32) && (objc_msgSend(*(id *)(*(void *)(a1 + 40) + 88), "containsObject:") & 1) != 0)
  {
    if ([*(id *)(a1 + 40) isStillTargetingSharedServerZone:*(void *)(a1 + 32)])
    {
      id v2 = brc_bread_crumbs();
      id v3 = brc_default_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v5 = *(void *)(a1 + 40);
        uint64_t v4 = *(void *)(a1 + 48);
        int v9 = 138412802;
        uint64_t v10 = v4;
        __int16 v11 = 2112;
        uint64_t v12 = v5;
        __int16 v13 = 2112;
        id v14 = v2;
        id v6 = "[DEBUG] not removing target shared zone %@ from %@, because it's still targeting it%@";
LABEL_13:
        _os_log_debug_impl(&dword_23FA42000, v3, OS_LOG_TYPE_DEBUG, v6, (uint8_t *)&v9, 0x20u);
      }
    }
    else
    {
      if ([*(id *)(*(void *)(a1 + 40) + 96) count]) {
        [*(id *)(a1 + 32) removeForegroundClient:*(void *)(a1 + 40)];
      }
      [*(id *)(*(void *)(a1 + 40) + 88) removeObject:*(void *)(a1 + 32)];
      id v2 = brc_bread_crumbs();
      id v3 = brc_default_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v8 = *(void *)(a1 + 40);
        uint64_t v7 = *(void *)(a1 + 48);
        int v9 = 138412802;
        uint64_t v10 = v7;
        __int16 v11 = 2112;
        uint64_t v12 = v8;
        __int16 v13 = 2112;
        id v14 = v2;
        id v6 = "[DEBUG] %@ is not a target shared zone of %@ anymore%@";
        goto LABEL_13;
      }
    }
  }
  else
  {
    id v2 = brc_bread_crumbs();
    id v3 = brc_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __58__BRCAppLibrary__removeTargetSharedServerZoneIfNecessary___block_invoke_cold_1();
    }
  }
}

- (void)_addTargetSharedServerZone:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 clientZone];
  id v6 = brc_bread_crumbs();
  uint64_t v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412802;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    id v14 = self;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    _os_log_debug_impl(&dword_23FA42000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] attempting to add target shared server zone %@ to %@%@", (uint8_t *)&v11, 0x20u);
  }

  uint64_t v8 = [(BRCAccountSessionFPFS *)self->_session clientTruthWorkloop];
  dispatch_assert_queue_V2(v8);

  if (v4)
  {
    if ([(NSMutableSet *)self->_foregroundClients count])
    {
      int v9 = brc_bread_crumbs();
      uint64_t v10 = brc_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        int v11 = 138412802;
        uint64_t v12 = self;
        __int16 v13 = 2112;
        id v14 = v5;
        __int16 v15 = 2112;
        uint64_t v16 = v9;
        _os_log_debug_impl(&dword_23FA42000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] Added %@ as foreground client to %@%@", (uint8_t *)&v11, 0x20u);
      }

      [v4 addForegroundClient:self];
    }
    [(NSMutableSet *)self->_targetSharedServerZones addObject:v4];
  }
}

- (id)itemIDByRowID:(unint64_t)a3 db:(id)a4
{
  return [(BRCAccountSessionFPFS *)self->_session itemIDByRowID:a3 db:a4];
}

- (id)itemIDByRowID:(unint64_t)a3
{
  return [(BRCAccountSessionFPFS *)self->_session itemIDByRowID:a3 db:self->_db];
}

- (id)itemByRowID:(unint64_t)a3 db:(id)a4
{
  return [(BRCAccountSessionFPFS *)self->_session itemByRowID:a3 db:a4];
}

- (id)itemByRowID:(unint64_t)a3
{
  return [(BRCAccountSessionFPFS *)self->_session itemByRowID:a3];
}

- (id)containerMetadataFilledWithTCCInfo
{
  id v2 = [(BRCAppLibrary *)self containerMetadata];
  id v3 = +[BRCDaemonContainerHelper sharedHelper];
  objc_msgSend(v2, "setIsCloudSyncTCCDisabled:", objc_msgSend(v3, "cloudSyncTCCDisabledForContainerMeta:", v2));

  return v2;
}

- (BOOL)wasMovedToCloudDocs
{
  return ([(BRCAppLibrary *)self state] >> 21) & 1;
}

- (BOOL)shouldSaveContainerMetadataServerside
{
  return ![(BRCAppLibrary *)self isCloudDocsAppLibrary];
}

- (id)documentsFolderItemID
{
  BOOL v3 = [(BRCAppLibrary *)self includesDataScope];
  id v4 = [BRCItemID alloc];
  uint64_t v5 = [(BRCAppLibrary *)self dbRowID];
  if (v3) {
    uint64_t v6 = [(BRCItemID *)v4 initAsDocumentsWithAppLibraryRowID:v5];
  }
  else {
    uint64_t v6 = [(BRCItemID *)v4 _initAsLibraryRootWithAppLibraryRowID:v5];
  }
  uint64_t v7 = (void *)v6;

  return v7;
}

- (id)fetchRootItemInDB:(id)a3
{
  id v4 = [(BRCAppLibrary *)self dbRowID];
  if (v4)
  {
    id v5 = [[BRCItemID alloc] _initAsLibraryRootWithAppLibraryRowID:v4];
    uint64_t v6 = [[BRCZoneRootItem alloc] initWithZoneRootItemID:v5 session:self->_session];
  }
  else
  {
    uint64_t v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[BRCAppLibrary fetchRootItemInDB:]();
    }

    uint64_t v6 = 0;
  }

  return v6;
}

- (id)fetchRootItem
{
  BOOL v3 = [(BRCAppLibrary *)self db];
  [v3 assertOnQueue];

  id v4 = [(BRCAppLibrary *)self db];
  id v5 = [(BRCAppLibrary *)self fetchRootItemInDB:v4];

  return v5;
}

- (id)fetchDocumentsDirectoryItem:(id)a3
{
  id v4 = a3;
  id v5 = [(BRCAppLibrary *)self defaultClientZone];
  uint64_t v6 = [(BRCAppLibrary *)self documentsFolderItemID];
  uint64_t v7 = [v5 itemByItemID:v6 db:v4];

  uint64_t v8 = [v7 asDirectory];

  return v8;
}

- (id)fetchDocumentsDirectoryItem
{
  BOOL v3 = [(BRCAppLibrary *)self db];
  id v4 = [(BRCAppLibrary *)self fetchDocumentsDirectoryItem:v3];

  return v4;
}

- (id)rootItemID
{
  id v2 = [(BRCAppLibrary *)self dbRowID];
  if (v2)
  {
    id v3 = [[BRCItemID alloc] _initAsLibraryRootWithAppLibraryRowID:v2];
  }
  else
  {
    id v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRCAppLibrary fetchRootItemInDB:]();
    }

    id v3 = 0;
  }

  return v3;
}

- (id)rootItemGlobalID
{
  id v3 = [BRCItemGlobalID alloc];
  id v4 = [(BRCAppLibrary *)self defaultClientZone];
  id v5 = [v4 dbRowID];
  uint64_t v6 = [(BRCAppLibrary *)self rootItemID];
  uint64_t v7 = [(BRCItemGlobalID *)v3 initWithZoneRowID:v5 itemID:v6];

  return v7;
}

- (void)zoneDidChangeMovedToCloudDocsState
{
  [(BRCAppLibrary *)self _updateIsInCloudDocsZone];
  id v2 = (void *)MEMORY[0x263F32588];
  [v2 postContainerListUpdateNotification];
}

- (void)_updateIsInCloudDocsZone
{
  id v3 = [(BRCAppLibrary *)self defaultClientZone];
  -[BRContainer setIsInCloudDocsZone:](self->_containerMetadata, "setIsInCloudDocsZone:", [v3 isCloudDocsZone]);
}

- (void)setContainerMetadataEtag:(id)a3
{
  objc_storeStrong((id *)&self->_containerMetadataEtag, a3);
  [(BRCAppLibrary *)self setNeedsSave:1];
}

- (void)setContainerMetadataNeedsSyncUp:(BOOL)a3
{
  self->_containerMetadataNeedsSyncUp = a3;
  [(BRCAppLibrary *)self setNeedsSave:1];
}

- (void)scheduleContainerMetadataSyncUp
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] container-metadata needs sync up for %@%@");
}

- (void)flushAndForceIngestRootAndDocumentsFolder
{
  dispatch_group_enter((dispatch_group_t)self->_forceIngestionGroup);
  objc_initWeak(&location, self);
  id v3 = [(BRCAccountSessionFPFS *)self->_session clientDB];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __58__BRCAppLibrary_flushAndForceIngestRootAndDocumentsFolder__block_invoke;
  v4[3] = &unk_26507ED20;
  objc_copyWeak(&v5, &location);
  [v3 scheduleFlushWithCheckpoint:0 whenFlushed:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __58__BRCAppLibrary_flushAndForceIngestRootAndDocumentsFolder__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained rootFileObjectID];
    id v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __58__BRCAppLibrary_flushAndForceIngestRootAndDocumentsFolder__block_invoke_cold_2();
    }

    uint64_t v6 = [v3 asString];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __58__BRCAppLibrary_flushAndForceIngestRootAndDocumentsFolder__block_invoke_169;
    v15[3] = &unk_26507F7B0;
    v15[4] = v2;
    id v7 = v3;
    id v16 = v7;
    +[BRCImportUtil forceIngestionForItemID:v6 completionHandler:v15];

    if ([v2 includesDataScope])
    {
      uint64_t v8 = [v2 documentsFolderFileObjectID];
      int v9 = brc_bread_crumbs();
      uint64_t v10 = brc_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        __58__BRCAppLibrary_flushAndForceIngestRootAndDocumentsFolder__block_invoke_cold_1();
      }

      int v11 = [v8 asString];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __58__BRCAppLibrary_flushAndForceIngestRootAndDocumentsFolder__block_invoke_170;
      v13[3] = &unk_26507F7B0;
      v13[4] = v2;
      id v14 = v8;
      id v12 = v8;
      +[BRCImportUtil forceIngestionForItemID:v11 completionHandler:v13];
    }
  }
}

void __58__BRCAppLibrary_flushAndForceIngestRootAndDocumentsFolder__block_invoke_169(uint64_t a1)
{
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __58__BRCAppLibrary_flushAndForceIngestRootAndDocumentsFolder__block_invoke_169_cold_1();
  }

  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 32));
}

void __58__BRCAppLibrary_flushAndForceIngestRootAndDocumentsFolder__block_invoke_170()
{
  uint64_t v0 = brc_bread_crumbs();
  os_log_t v1 = brc_default_log();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    __58__BRCAppLibrary_flushAndForceIngestRootAndDocumentsFolder__block_invoke_170_cold_1();
  }
}

- (void)waitForRootIngestionWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (dispatch_group_wait((dispatch_group_t)self->_forceIngestionGroup, 0))
  {
    id v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[BRCAppLibrary waitForRootIngestionWithCompletion:].cold.4();
    }

    id v7 = [(BRCAppLibrary *)self rootFileObjectID];
    uint64_t v8 = brc_bread_crumbs();
    int v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[BRCAppLibrary waitForRootIngestionWithCompletion:]();
    }

    uint64_t v10 = [v7 asString];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __52__BRCAppLibrary_waitForRootIngestionWithCompletion___block_invoke;
    v17[3] = &unk_265081478;
    id v18 = v4;
    +[BRCImportUtil forceIngestionForItemID:v10 completionHandler:v17];

    if ([(BRCAppLibrary *)self includesDataScope])
    {
      int v11 = [(BRCAppLibrary *)self documentsFolderFileObjectID];
      id v12 = brc_bread_crumbs();
      __int16 v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[BRCAppLibrary waitForRootIngestionWithCompletion:]();
      }

      id v14 = [v11 asString];
      +[BRCImportUtil forceIngestionForItemID:v14 completionHandler:&__block_literal_global_173];
    }
  }
  else
  {
    __int16 v15 = brc_bread_crumbs();
    id v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[BRCAppLibrary waitForRootIngestionWithCompletion:]();
    }

    v4[2](v4);
  }
}

uint64_t __52__BRCAppLibrary_waitForRootIngestionWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSString)pathRelativeToRoot
{
  return (NSString *)[(BRMangledID *)self->_mangledID mangledIDString];
}

- (void)setChildBasehashSalt:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = (NSData *)a3;
  uint64_t v6 = v5;
  if (self->_childBasehashSalt != v5 && !-[NSData isEqualToData:](v5, "isEqualToData:"))
  {
    id v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      __int16 v15 = [(NSData *)v6 brc_truncatedSHA256];
      int v9 = objc_msgSend(v15, "brc_hexadecimalString");
      uint64_t v10 = [(NSData *)self->_childBasehashSalt brc_truncatedSHA256];
      int v11 = objc_msgSend(v10, "brc_hexadecimalString");
      id v12 = [(BRCAppLibrary *)self mangledID];
      *(_DWORD *)buf = 138413058;
      uint64_t v17 = v9;
      __int16 v18 = 2112;
      __int16 v19 = v11;
      __int16 v20 = 2112;
      uint64_t v21 = v12;
      __int16 v22 = 2112;
      long long v23 = v7;
      _os_log_debug_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] Learning new child basehash salt %@ from %@ for %@%@", buf, 0x2Au);
    }
    if (self->_childBasehashSalt)
    {
      __int16 v13 = brc_bread_crumbs();
      id v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[BRCAppLibrary setChildBasehashSalt:]();
      }
    }
    objc_storeStrong((id *)&self->_childBasehashSalt, a3);
    [(BRCAppLibrary *)self setNeedsSave:1];
  }
}

- (void)setSaltingState:(unsigned int)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (self->_saltingState != a3)
  {
    id v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      if (a3 > 3) {
        id v7 = @"no server item";
      }
      else {
        id v7 = off_265081498[a3];
      }
      uint64_t saltingState = (int)self->_saltingState;
      if (saltingState > 3) {
        int v9 = @"no server item";
      }
      else {
        int v9 = off_265081498[saltingState];
      }
      uint64_t v10 = [(BRCAppLibrary *)self mangledID];
      int v11 = 138413058;
      id v12 = v7;
      __int16 v13 = 2112;
      id v14 = v9;
      __int16 v15 = 2112;
      id v16 = v10;
      __int16 v17 = 2112;
      __int16 v18 = v5;
      _os_log_debug_impl(&dword_23FA42000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] Learning salt state %@ from %@ for %@%@", (uint8_t *)&v11, 0x2Au);
    }
    self->_uint64_t saltingState = a3;
    [(BRCAppLibrary *)self setNeedsSave:1];
  }
}

- (brc_task_tracker)tracker
{
  return self->_tracker;
}

- (BRCAppLibraryDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (BRCPQLConnection)db
{
  return self->_db;
}

- (BOOL)needsSave
{
  return self->_needsSave;
}

- (unsigned)state
{
  return self->_state;
}

- (BRCALRowID)dbRowID
{
  return self->_dbRowID;
}

- (void)setDbRowID:(id)a3
{
}

- (BRCZoneRowID)zoneRowID
{
  return self->_zoneRowID;
}

- (void)setZoneRowID:(id)a3
{
}

- (NSString)appLibraryID
{
  return self->_appLibraryID;
}

- (BRMangledID)mangledID
{
  return self->_mangledID;
}

- (NSNumber)fileID
{
  return self->_fileID;
}

- (void)setFileID:(id)a3
{
}

- (NSNumber)generationID
{
  return self->_generationID;
}

- (void)setGenerationID:(id)a3
{
}

- (BRCAccountSessionFPFS)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (BRCPrivateClientZone)defaultClientZone
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_defaultClientZone);
  return (BRCPrivateClientZone *)WeakRetained;
}

- (void)setDefaultClientZone:(id)a3
{
}

- (BRContainer)containerMetadata
{
  return self->_containerMetadata;
}

- (NSString)containerMetadataEtag
{
  return self->_containerMetadataEtag;
}

- (BOOL)containerMetadataNeedsSyncUp
{
  return self->_containerMetadataNeedsSyncUp;
}

- (unint64_t)containerMetadataSyncRequestID
{
  return self->_containerMetadataSyncRequestID;
}

- (void)setContainerMetadataSyncRequestID:(unint64_t)a3
{
  self->_containerMetadataSyncRequestID = a3;
}

- (NSNumber)rootQuotaUsage
{
  return self->_rootQuotaUsage;
}

- (void)setRootQuotaUsage:(id)a3
{
}

- (NSData)childBasehashSalt
{
  return self->_childBasehashSalt;
}

- (unsigned)saltingState
{
  return self->_saltingState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childBasehashSalt, 0);
  objc_storeStrong((id *)&self->_rootQuotaUsage, 0);
  objc_storeStrong((id *)&self->_containerMetadataEtag, 0);
  objc_storeStrong((id *)&self->_containerMetadata, 0);
  objc_storeStrong((id *)&self->_generationID, 0);
  objc_storeStrong((id *)&self->_fileID, 0);
  objc_storeStrong((id *)&self->_appLibraryID, 0);
  objc_storeStrong((id *)&self->_zoneRowID, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_destroyWeak((id *)&self->_trashFetchOp);
  objc_destroyWeak((id *)&self->_pristineFetchOp);
  objc_storeStrong((id *)&self->_foregroundClients, 0);
  objc_storeStrong((id *)&self->_targetSharedServerZones, 0);
  objc_destroyWeak((id *)&self->_defaultClientZone);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_mangledID, 0);
  objc_storeStrong((id *)&self->_dbRowID, 0);
  objc_storeStrong((id *)&self->_forceIngestionGroup, 0);
}

- (void)reimportLibraryRootAndFinishResetWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BRCAppLibrary *)self rootFileObjectID];
  uint64_t v6 = [v5 asString];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __79__BRCAppLibrary_BRCZoneReset__reimportLibraryRootAndFinishResetWithCompletion___block_invoke;
  v8[3] = &unk_265080B38;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  +[BRCImportUtil reimportItemsBelowItemWithIdentifier:v6 completionHandler:v8];
}

void __79__BRCAppLibrary_BRCZoneReset__reimportLibraryRootAndFinishResetWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3 && !objc_msgSend(v3, "fp_isFileProviderError:", -1005))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v4);
    }
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) session];
    uint64_t v6 = [v5 clientTruthWorkloop];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __79__BRCAppLibrary_BRCZoneReset__reimportLibraryRootAndFinishResetWithCompletion___block_invoke_2;
    v9[3] = &unk_26507F850;
    id v7 = *(void **)(a1 + 40);
    v9[4] = *(void *)(a1 + 32);
    id v10 = v7;
    dispatch_async(v6, v9);
  }
}

uint64_t __79__BRCAppLibrary_BRCZoneReset__reimportLibraryRootAndFinishResetWithCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) clearStateBits:8];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_updateContainerMetadataFromRecord:(id)a3 stripIcons:(BOOL)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(BRCAppLibrary *)self session];
  uint64_t v8 = [v7 clientDB];
  id v9 = [v8 serialQueue];

  if (v9)
  {
    id v10 = objc_msgSend(v6, "brc_containerMetadataPropertiesData");
    if (v10)
    {
      if (![(BRCAppLibrary *)self shouldSaveContainerMetadataServerside])
      {
LABEL_16:
        objc_initWeak((id *)buf, self);
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __102__BRCAppLibrary_BRCContainerMetadataSyncDownAdditions___updateContainerMetadataFromRecord_stripIcons___block_invoke_1;
        v20[3] = &unk_26507F678;
        objc_copyWeak(&v22, (id *)buf);
        id v21 = v6;
        dispatch_async(v9, v20);

        objc_destroyWeak(&v22);
        objc_destroyWeak((id *)buf);
        goto LABEL_17;
      }
      if (a4)
      {
        int v11 = 0;
      }
      else
      {
        int v11 = objc_msgSend(v6, "brc_containerMetadataIconPaths");
      }
      __int16 v15 = [(BRCAppLibrary *)self containerMetadata];
      int v16 = [v15 isDocumentScopePublic];

      __int16 v17 = [(BRCAppLibrary *)self containerMetadata];
      [v17 updateMetadataWithRecordData:v10 iconPaths:v11];

      __int16 v18 = [(BRCAppLibrary *)self containerMetadata];
      int v19 = [v18 isDocumentScopePublic];

      if (v16 != v19)
      {
        objc_initWeak((id *)buf, self);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __102__BRCAppLibrary_BRCContainerMetadataSyncDownAdditions___updateContainerMetadataFromRecord_stripIcons___block_invoke;
        block[3] = &unk_26507ED20;
        objc_copyWeak(&v24, (id *)buf);
        dispatch_async(v9, block);
        objc_destroyWeak(&v24);
        objc_destroyWeak((id *)buf);
      }
    }
    else
    {
      int v11 = brc_bread_crumbs();
      id v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v26 = v6;
        __int16 v27 = 2112;
        id v28 = v11;
        _os_log_impl(&dword_23FA42000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] no data in record %@%@", buf, 0x16u);
      }
    }
    goto LABEL_16;
  }
  id v10 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v13 = [(BRCAppLibrary *)self session];
    *(_DWORD *)buf = 138412546;
    id v26 = v13;
    __int16 v27 = 2112;
    id v28 = v10;
    _os_log_impl(&dword_23FA42000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] Serial queue for session %@ is nil%@", buf, 0x16u);
  }
LABEL_17:
}

void __102__BRCAppLibrary_BRCContainerMetadataSyncDownAdditions___updateContainerMetadataFromRecord_stripIcons___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained didUpdateDocumentScopePublic];
}

void __102__BRCAppLibrary_BRCContainerMetadataSyncDownAdditions___updateContainerMetadataFromRecord_stripIcons___block_invoke_1(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [*(id *)(a1 + 32) recordChangeTag];
  [WeakRetained setContainerMetadataEtag:v2];
}

void __48__BRCAppLibrary_FPFSAdditions__deleteAppLibrary__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_23FA42000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] App Library includes data scope%@", (uint8_t *)&v2, 0xCu);
}

- (void)setNeedsSave:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] container state now needs flush: %@%@");
}

- (void)initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: dbRowID%@", v2, v3, v4, v5, v6);
}

- (void)initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] API MISUSE: unexpected parameter%@", v2, v3, v4, v5, v6);
}

- (void)initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: mangledID.isPrivate%@", v2, v3, v4, v5, v6);
}

- (void)initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: zoneRowID%@", v2, v3, v4, v5, v6);
}

- (void)associateWithClientZone:offline:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: associating nil client zone for %@%@");
}

- (void)_activateState:origState:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Updating documents folder to be of server type %@%@");
}

- (void)_activateState:origState:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: state == BRCAppLibraryStateNotActivated || !(state & BRCAppLibraryStateNotActivated)%@", v2, v3, v4, v5, v6);
}

void __42__BRCAppLibrary__activateState_origState___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_12();
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(v1 + 32) mangledID];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_23FA42000, v0, v3, "[DEBUG] Done Force Ingestion app library %@ container to update the contentPolicy%@", v4);
}

- (void)isGreedy
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] greediness enforced because optimize storage is disabled%@", v2, v3, v4, v5, v6);
}

- (void)itemsEnumeratorWithRankMin:rankMax:namePrefix:withDeadItems:shouldIncludeFolders:shouldIncludeOnlyFolders:shouldIncludeDocumentsScope:shouldIncludeDataScope:shouldIncludeExternalScope:shouldIncludeTrashScope:count:db:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: docsOrDataScopeInjection || externalScopeInjection%@", v2, v3, v4, v5, v6);
}

- (void)itemsEnumeratorWithRankMin:rankMax:namePrefix:withDeadItems:shouldIncludeFolders:shouldIncludeOnlyFolders:shouldIncludeDocumentsScope:shouldIncludeDataScope:shouldIncludeExternalScope:shouldIncludeTrashScope:count:db:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: asking for no scopes?%@", v2, v3, v4, v5, v6);
}

- (void)addForegroundClient:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] %@ - app library became foreground%@");
}

- (void)addForegroundClient:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: ![_foregroundClients containsObject:client]%@", v2, v3, v4, v5, v6);
}

- (void)addForegroundClient:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: client%@", v2, v3, v4, v5, v6);
}

void __37__BRCAppLibrary_addForegroundClient___block_invoke_cold_1(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] %@ - SharedDocs became foreground%@", (void)v3, DWORD2(v3));
}

- (void)removeForegroundClient:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] %@ - app library moved to background%@");
}

- (void)removeForegroundClient:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: [_foregroundClients containsObject:client]%@", v2, v3, v4, v5, v6);
}

- (void)integrityCheckBoosting
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: %@ has foreground clients but the transfer sync context doesn't contain self%@");
}

void __68__BRCAppLibrary__resolveTargetSharedClientZonesWhenBecameForeground__block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412802;
  *(void *)&v3[4] = *(void *)(*(void *)a1 + 88);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *(void *)a1;
  *(_WORD *)&v3[22] = 2112;
  OUTLINED_FUNCTION_9_1(&dword_23FA42000, a2, a3, "[DEBUG] resolved target shared zones %@ for app library %@%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], a2);
}

void __58__BRCAppLibrary__removeTargetSharedServerZoneIfNecessary___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_9_1(&dword_23FA42000, v0, v1, "[DEBUG] not removing target shared zone %@ from %@%@");
}

- (void)fetchRootItemInDB:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: nil dbRowID for %@%@");
}

void __58__BRCAppLibrary_flushAndForceIngestRootAndDocumentsFolder__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Forcing ingesting documents %@%@");
}

void __58__BRCAppLibrary_flushAndForceIngestRootAndDocumentsFolder__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Forcing ingesting root %@%@");
}

void __58__BRCAppLibrary_flushAndForceIngestRootAndDocumentsFolder__block_invoke_169_cold_1()
{
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_9_1(&dword_23FA42000, v0, v1, "[DEBUG] Done Force Ingestion of app library %@ with itemIdentifier = %@%@");
}

void __58__BRCAppLibrary_flushAndForceIngestRootAndDocumentsFolder__block_invoke_170_cold_1()
{
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_9_1(&dword_23FA42000, v0, v1, "[DEBUG] Done Force Ingestion documents of app library %@ with itemIdentifier = %@%@");
}

- (void)waitForRootIngestionWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_12();
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = [v1 mangledID];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_23FA42000, v0, v3, "[DEBUG] Finished waiting for force ingestion of %@%@", v4);
}

- (void)waitForRootIngestionWithCompletion:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Boost force ingesting documents %@%@");
}

- (void)waitForRootIngestionWithCompletion:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Boost force ingesting root %@%@");
}

- (void)waitForRootIngestionWithCompletion:.cold.4()
{
  OUTLINED_FUNCTION_12();
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = [v1 mangledID];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_23FA42000, v0, v3, "[DEBUG] Force ingestion was not done for %@, let's invoke another force ingest to boost the job in FP%@", v4);
}

- (void)setChildBasehashSalt:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _childBasehashSalt == nil%@", v2, v3, v4, v5, v6);
}

@end