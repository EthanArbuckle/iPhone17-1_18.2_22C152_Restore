@interface BRCDirectoryItem
- (BOOL)_deleteFromDB:(id)a3 keepAliases:(BOOL)a4;
- (BOOL)_insertInDB:(id)a3 dbRowID:(unint64_t)a4;
- (BOOL)_insertRecursiveProperties;
- (BOOL)_recomputeChildItemCount;
- (BOOL)_repopulateRecursivePropertiesIfNecessary;
- (BOOL)_updateInDB:(id)a3 diffs:(unint64_t)a4;
- (BOOL)_updateRecursiveProperties;
- (BOOL)containsDirFault;
- (BOOL)containsOverQuotaItems;
- (BOOL)containsPendingDeleteDocuments;
- (BOOL)containsPendingUploadOrSyncUp;
- (BOOL)handlePathMatchConflictForDirectoryCreationIfNecessary;
- (BOOL)hasDeadChildren;
- (BOOL)hasLiveChildren;
- (BOOL)hasShareIDAndIsOwnedByMe;
- (BOOL)isAppLibraryTrashFolder;
- (BOOL)isCrossZoneMoveTombstone;
- (BOOL)isDirectory;
- (BOOL)isDirectoryFault;
- (BOOL)isDirectoryWithPackageName;
- (BOOL)isShareableItem;
- (BOOL)isSharedByMeOrContainsSharedByMeItem;
- (BOOL)isSharedToMeOrContainsSharedToMeItem;
- (BOOL)mergeContentsIntoDirectory:(id)a3;
- (BOOL)possiblyContainsSharedItem;
- (BOOL)updateFromServerItem:(id)a3;
- (BRCItemGlobalID)previousItemGlobalID;
- (id)_initFromPQLResultSet:(id)a3 session:(id)a4 db:(id)a5 error:(id *)a6;
- (id)_initWithLocalItem:(id)a3;
- (id)_initWithServerItem:(id)a3 dbRowID:(unint64_t)a4;
- (id)_serverChildItemCount;
- (id)_serverChildItemCountIncludingHiddenFiles;
- (id)asShareableItem;
- (id)childItemCount;
- (id)clientZonesChildrenNeedingSyncUpAreIn;
- (id)collaborationIdentifierIfComputable;
- (id)descriptionWithContext:(id)a3;
- (id)folderAppLibraryRootRecord;
- (id)folderRootStructureRecord;
- (id)serverQuotaUsage;
- (int64_t)mtime;
- (unint64_t)diffAgainstLocalItem:(id)a3;
- (unint64_t)diffAgainstServerItem:(id)a3;
- (void)_crossZoneMoveToParent:(id)a3;
- (void)_insertZombieForCrossZoneMove;
- (void)_learnItemID:(id)a3 serverItem:(id)a4;
- (void)_markZombieForCrossZoneMove;
- (void)_retryPostponedIfNeededForDiffs:(unint64_t)a3;
- (void)_signalPropagationToChildrenForce:(BOOL)a3;
- (void)_updateRecursiveProperties;
- (void)asShareableItem;
- (void)documentsDirectoryUpdatedDocumentsScopePublic;
- (void)forceSignalPropagationToChildren;
- (void)isDirectory;
- (void)markChildPropagationComplete;
- (void)markDirectoryMergeOrCrossZonePropagationComplete;
- (void)markNeedsDeleteForItemIDTransfer;
- (void)markRemovedFromFilesystemRecursively:(BOOL)a3;
- (void)prepareForSyncUpInZone:(id)a3;
- (void)setMtime:(int64_t)a3;
- (void)signalPropagationToChildren;
- (void)transformIntoFSRoot;
- (void)updateItemMetadataFromServerItem:(id)a3 appliedSharingPermission:(BOOL)a4;
- (void)updateWithContentModificationDate:(id)a3;
@end

@implementation BRCDirectoryItem

- (id)folderRootStructureRecord
{
  if ([(BRCDirectoryItem *)self isDirectory])
  {
    v3 = [(BRCLocalItem *)self itemID];
    v4 = objc_msgSend(v3, "structureRecordIDForItemType:zone:aliasTargetZoneIsShared:", -[BRCStatInfo type](self->super._st, "type"), self->super._serverZone, 1);

    v5 = (void *)[objc_alloc(MEMORY[0x263EFD7C8]) initWithRecordType:@"structure" recordID:v4];
  }
  else
  {
    v6 = brc_bread_crumbs();
    v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[BRCDirectoryItem(CKConversions) folderRootStructureRecord]();
    }

    v5 = 0;
  }
  return v5;
}

- (id)folderAppLibraryRootRecord
{
  v3 = [(BRCLocalItem *)self clientZone];
  if (![v3 isPrivateZone]) {
    goto LABEL_6;
  }
  v4 = [(BRCLocalItem *)self appLibrary];
  if (([v4 wasMovedToCloudDocs] & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  v5 = [(BRCLocalItem *)self appLibrary];
  char v6 = [v5 isCloudDocsAppLibrary];

  if ((v6 & 1) == 0)
  {
    v7 = (void *)MEMORY[0x263EFD7C8];
    v8 = [(BRCLocalItem *)self appLibrary];
    v9 = [v8 mangledID];
    v10 = [(BRCLocalItem *)self structureRecordID];
    v11 = [v10 zoneID];
    v12 = [v7 rootAppLibraryRecordForAppLibraryID:v9 zoneID:v11];

    goto LABEL_8;
  }
LABEL_7:
  v13 = (void *)MEMORY[0x263EFD7C8];
  v8 = [(BRCLocalItem *)self structureRecordID];
  v9 = [v8 zoneID];
  v12 = [v13 rootDirectoryRecordForZoneID:v9];
LABEL_8:

  return v12;
}

- (void)_signalPropagationToChildrenForce:(BOOL)a3
{
  if (!a3)
  {
    v4 = [(BRCLocalItem *)self->super._orig st];
    uint64_t v5 = [v4 processingStamp];
    if (v5)
    {
      char v6 = (void *)v5;
      v7 = [(BRCLocalStatInfo *)self->super._st processingStamp];

      if (!v7)
      {
        v8 = brc_bread_crumbs();
        v9 = brc_default_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
          [(BRCDirectoryItem(FPFSAdditions) *)self _signalPropagationToChildrenForce:v9];
        }

        return;
      }
    }
    else
    {
    }
  }
  [(BRCLocalStatInfo *)self->super._st _markNeedsPropertiesPropagatedToChildren];
  id v10 = [(BRCAccountSessionFPFS(FPFSAdditions) *)self->super._session fsImporter];
  [v10 signal];
}

- (void)forceSignalPropagationToChildren
{
}

- (void)signalPropagationToChildren
{
}

- (void)documentsDirectoryUpdatedDocumentsScopePublic
{
  if ([(BRCItemID *)self->super._itemID isDocumentsFolder])
  {
    v3 = [(BRCLocalItem *)self appLibrary];
    v4 = [v3 containerMetadata];
    self->super._isUserVisible = [v4 isDocumentScopePublic];

    self->super._localDiffs |= 0x8000000000uLL;
    [(BRCLocalItem *)self markForceNotify];
    [(BRCDirectoryItem *)self signalPropagationToChildren];
  }
  else
  {
    uint64_t v5 = brc_bread_crumbs();
    char v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCDirectoryItem(FPFSAdditions) documentsDirectoryUpdatedDocumentsScopePublic]();
    }
  }
}

- (void)markRemovedFromFilesystemRecursively:(BOOL)a3
{
  BOOL v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BRCDirectoryItem;
  -[BRCLocalItem markRemovedFromFilesystemRecursively:](&v12, sel_markRemovedFromFilesystemRecursively_);
  if (v3)
  {
    if ([(BRCDirectoryItem *)self containsDirFault])
    {
      uint64_t v5 = [(BRCStatInfo *)self->super._st ckInfo];
      if ([v5 hasDeletionChangeToken])
      {
LABEL_8:

        goto LABEL_9;
      }
      BOOL v6 = [(BRCLocalItem *)self isSharedToMeTopLevelItem];

      if (!v6)
      {
        v7 = brc_bread_crumbs();
        v8 = brc_default_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          [(BRCDirectoryItem(FPFSAdditions) *)(uint64_t)self markRemovedFromFilesystemRecursively:v8];
        }

        uint64_t v5 = [(BRCServerZone *)self->super._serverZone changeState];
        v9 = [v5 changeToken];
        id v10 = [v9 data];
        v11 = [(BRCStatInfo *)self->super._st ckInfo];
        [v11 setDeletionChangeToken:v10];

        goto LABEL_8;
      }
    }
LABEL_9:
    [(BRCLocalStatInfo *)self->super._st _markNeedsPropertiesPropagatedToChildren];
  }
}

- (void)markDirectoryMergeOrCrossZonePropagationComplete
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  BOOL v3 = [(BRCAccountSessionFPFS *)self->super._session itemByItemGlobalID:self->_previousItemGlobalID];
  v4 = [v3 asDirectory];

  if (!v4)
  {
    v15 = brc_bread_crumbs();
    v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[BRCDirectoryItem(FPFSAdditions) markDirectoryMergeOrCrossZonePropagationComplete]();
    }
  }
  if (([v4 isLost] & 1) == 0)
  {
    v17 = brc_bread_crumbs();
    v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      -[BRCDirectoryItem(FPFSAdditions) markDirectoryMergeOrCrossZonePropagationComplete]();
    }
  }
  uint64_t v5 = [(BRCItemGlobalID *)self->_previousItemGlobalID zoneRowID];
  BOOL v6 = [(BRCClientZone *)self->super._clientZone dbRowID];
  int v7 = objc_msgSend(v5, "br_isEqualToNumber:", v6);

  v8 = brc_bread_crumbs();
  v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v14 = "Cross zone move";
    int v19 = 136315906;
    if (v7) {
      v14 = "Directory merge";
    }
    v20 = v14;
    __int16 v21 = 2112;
    v22 = self;
    __int16 v23 = 2112;
    v24 = v4;
    __int16 v25 = 2112;
    v26 = v8;
    _os_log_debug_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] %s propagation completed for item %@. Deleting tombstone item %@%@", (uint8_t *)&v19, 0x2Au);
  }

  [v4 markDead];
  [v4 markNeedsUploadOrSyncingUp];
  [v4 saveToDB];
  id v10 = [(BRCAccountSessionFPFS *)self->super._session applyScheduler];
  v11 = [v4 serverZone];
  [v10 rescheduleSuspendedJobsMatching:v11 inState:17];

  objc_super v12 = [v4 clientZone];
  [v12 scheduleSyncUp];

  previousItemGlobalID = self->_previousItemGlobalID;
  self->_previousItemGlobalID = 0;
}

- (void)markChildPropagationComplete
{
  [(BRCLocalStatInfo *)self->super._st _markChildPropagationComplete];
  [(BRCLocalItem *)self markNeedsUploadOrSyncingUp];
  clientZone = self->super._clientZone;
  [(BRCClientZone *)clientZone scheduleSyncUp];
}

- (void)updateWithContentModificationDate:(id)a3
{
  [a3 timeIntervalSince1970];
  self->_mtime = (uint64_t)v4;
}

- (BOOL)handlePathMatchConflictForDirectoryCreationIfNecessary
{
  if (([(BRCPQLConnection *)self->super._db isBatchSuspended] & 1) == 0)
  {
    v38 = brc_bread_crumbs();
    v39 = brc_default_log();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem createSyncUpJob].cold.7();
    }
  }
  clientZone = self->super._clientZone;
  double v4 = [(BRCStatInfo *)self->super._st parentID];
  uint64_t v5 = [(BRCLocalStatInfo *)self->super._st logicalName];
  BOOL v6 = [(BRCClientZone *)clientZone itemByParentID:v4 andLogicalName:v5];

  int v7 = brc_bread_crumbs();
  v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[BRCDirectoryItem(FPFSAdditions) handlePathMatchConflictForDirectoryCreationIfNecessary].cold.5();
  }

  v9 = [(BRCStatInfo *)self->super._st ckInfo];
  uint64_t v10 = [v9 etag];
  if (v10)
  {
    v11 = v10;
    objc_super v12 = 0;
LABEL_9:

    goto LABEL_10;
  }
  v13 = [(BRCClientZone *)self->super._clientZone mangledID];
  v14 = +[BRCUserDefaults defaultsForMangledID:v13];
  int v15 = [v14 reviveDeadDirsOnNewDirCreations];

  if (v15)
  {
    v16 = self->super._clientZone;
    v17 = [(BRCStatInfo *)self->super._st parentID];
    v18 = [(BRCLocalStatInfo *)self->super._st logicalName];
    objc_super v12 = [(BRCClientZone *)v16 deadItemByParentID:v17 andUnbouncedLogicalName:v18];

    v9 = brc_bread_crumbs();
    v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[BRCDirectoryItem(FPFSAdditions) handlePathMatchConflictForDirectoryCreationIfNecessary].cold.4();
    }
    goto LABEL_9;
  }
  objc_super v12 = 0;
LABEL_10:
  if ([v12 isDead])
  {
    int v19 = [v12 st];
    v20 = [v19 processingStamp];
    BOOL v21 = !v20 && [v12 isDirectory] && (objc_msgSend(v12, "sharingOptions") & 4) == 0;

    if (!v6) {
      goto LABEL_24;
    }
  }
  else
  {
    BOOL v21 = 0;
    if (!v6) {
      goto LABEL_24;
    }
  }
  if ([v6 isDead]) {
    goto LABEL_24;
  }
  v22 = [(BRCLocalItem *)self itemID];
  if (([v22 isDocumentsFolder] & 1) == 0)
  {

LABEL_30:
    v35 = brc_bread_crumbs();
    v36 = brc_default_log();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
      -[BRCDirectoryItem(FPFSAdditions) handlePathMatchConflictForDirectoryCreationIfNecessary]();
    }

    [(BRCLocalItem *)self markBouncedToNextAvailableBounceNumber:510];
    if (v21) {
      goto LABEL_25;
    }
LABEL_33:
    char v34 = 0;
    goto LABEL_34;
  }
  __int16 v23 = [v6 itemID];
  char v24 = [v23 isDocumentsFolder];

  if (v24) {
    goto LABEL_30;
  }
  __int16 v25 = brc_bread_crumbs();
  v26 = brc_default_log();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    -[BRCDirectoryItem(FPFSAdditions) handlePathMatchConflictForDirectoryCreationIfNecessary]();
  }

  [v6 markBouncedToNextAvailableBounceNumber:511];
  [v6 saveToDB];
LABEL_24:
  if (!v21) {
    goto LABEL_33;
  }
LABEL_25:
  uint64_t v27 = brc_bread_crumbs();
  v28 = brc_default_log();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
    -[BRCDirectoryItem(FPFSAdditions) handlePathMatchConflictForDirectoryCreationIfNecessary]();
  }

  v29 = self->super._clientZone;
  v30 = [v12 itemID];
  v31 = [(BRCClientZone *)v29 serverItemByItemID:v30];

  db = self->super._db;
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __89__BRCDirectoryItem_FPFSAdditions__handlePathMatchConflictForDirectoryCreationIfNecessary__block_invoke;
  v40[3] = &unk_26507F760;
  id v41 = v12;
  v42 = self;
  id v43 = v31;
  id v33 = v31;
  char v34 = [(BRCPQLConnection *)db groupInTransaction:v40];

LABEL_34:
  return v34;
}

uint64_t __89__BRCDirectoryItem_FPFSAdditions__handlePathMatchConflictForDirectoryCreationIfNecessary__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) st];
  BOOL v3 = [v2 ckInfo];

  double v4 = [*(id *)(*(void *)(a1 + 40) + 72) ckInfo];
  uint64_t v5 = [v4 etagBeforeCrossZoneMove];
  [v3 setEtagBeforeCrossZoneMove:v5];

  BOOL v6 = [*(id *)(a1 + 32) itemID];
  [*(id *)(a1 + 32) markNeedsDeleteForItemIDTransfer];
  if ([*(id *)(a1 + 32) saveToDB])
  {
    [*(id *)(a1 + 40) learnItemID:v6 serverItem:*(void *)(a1 + 48)];
    [*(id *)(*(void *)(a1 + 40) + 72) setCkInfo:v3];
    *(_DWORD *)(*(void *)(a1 + 40) + 80) = 4;
    uint64_t v7 = [*(id *)(a1 + 40) saveToDB];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)updateFromServerItem:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRCDirectoryItem;
  BOOL v5 = [(BRCLocalItem *)&v9 updateFromServerItem:v4];
  if (v5)
  {
    self->_mtime = [v4 directoryMtime];
    if ([v4 isDirectoryFault])
    {
      if (![(BRCDirectoryItem *)self isDirectoryFault])
      {
        BOOL v6 = brc_bread_crumbs();
        uint64_t v7 = brc_default_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
          -[BRCDirectoryItem(FPFSAdditions) updateFromServerItem:]();
        }

        [(BRCStatInfo *)self->super._st setType:9];
      }
    }
  }

  return v5;
}

- (BOOL)mergeContentsIntoDirectory:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4 && !v4[25])
  {
    db = self->super._db;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __62__BRCDirectoryItem_FPFSAdditions__mergeContentsIntoDirectory___block_invoke;
    v11[3] = &unk_265080760;
    objc_super v12 = v4;
    v13 = self;
    char v8 = [(BRCPQLConnection *)db groupInTransaction:v11];
    BOOL v6 = v12;
  }
  else
  {
    BOOL v6 = brc_bread_crumbs();
    uint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[BRCDirectoryItem(FPFSAdditions) mergeContentsIntoDirectory:]();
    }

    char v8 = 0;
  }

  return v8;
}

uint64_t __62__BRCDirectoryItem_FPFSAdditions__mergeContentsIntoDirectory___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) itemGlobalID];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 200);
  *(void *)(v3 + 200) = v2;

  BOOL v5 = [*(id *)(a1 + 40) st];
  BOOL v6 = [v5 ckInfo];
  uint64_t v7 = [v6 etag];
  char v8 = [*(id *)(*(void *)(a1 + 40) + 72) ckInfo];
  [v8 setEtagBeforeCrossZoneMove:v7];

  [*(id *)(a1 + 32) signalPropagationToChildren];
  uint64_t result = [*(id *)(a1 + 32) saveToDB];
  if (result)
  {
    [*(id *)(a1 + 40) _markZombieForCrossZoneMove];
    uint64_t v10 = *(void **)(a1 + 40);
    return [v10 saveToDB];
  }
  return result;
}

- (void)_markZombieForCrossZoneMove
{
  [(BRCLocalStatInfo *)self->super._st _markZombieForCrossZoneMove];
  self->super._isUserVisible = 0;
  previousItemGlobalID = self->_previousItemGlobalID;
  self->_previousItemGlobalID = 0;
}

- (void)_insertZombieForCrossZoneMove
{
  if (([(BRCPQLConnection *)self->super._db isBatchSuspended] & 1) == 0)
  {
    BOOL v5 = brc_bread_crumbs();
    BOOL v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem createSyncUpJob].cold.7();
    }
  }
  uint64_t v3 = (id *)[(BRCDirectoryItem *)self copy];
  [v3 _restorePreviousGlobalID:self->_previousItemGlobalID];
  id v4 = [v3[9] ckInfo];
  [v4 revertEtagsForOldZoneTombstone];

  [v3 _markZombieForCrossZoneMove];
  [v3 saveToDB];
}

- (void)_crossZoneMoveToParent:(id)a3
{
  id v4 = [(BRCLocalItem *)self _updateCrossZoneParent:a3];
  previousItemGlobalID = self->_previousItemGlobalID;
  self->_previousItemGlobalID = v4;

  [(BRCLocalItem *)self markForceNeedsSyncUp];
  [(BRCLocalItem *)self saveToDB];
  [(BRCDirectoryItem *)self _insertZombieForCrossZoneMove];
}

- (BOOL)isDirectory
{
  unsigned int v2 = [(BRCStatInfo *)self->super._st type];
  if (v2 > 0xA || ((1 << v2) & 0x611) == 0)
  {
    id v4 = brc_bread_crumbs();
    BOOL v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRCDirectoryItem isDirectory]();
    }
  }
  return 1;
}

- (BOOL)isDirectoryFault
{
  unsigned int v3 = [(BRCStatInfo *)self->super._st type];
  if (v3 > 0xA || ((1 << v3) & 0x611) == 0)
  {
    BOOL v5 = brc_bread_crumbs();
    BOOL v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCDirectoryItem isDirectory]();
    }
  }
  if (([(BRCStatInfo *)self->super._st type] - 9) < 2u) {
    return 1;
  }
  if (![(BRCLocalItem *)self isFSRoot]) {
    return 0;
  }
  char v8 = [(BRCLocalItem *)self appLibrary];
  BOOL v7 = ([v8 state] & 0x2000000) == 0;

  return v7;
}

- (BOOL)isDirectoryWithPackageName
{
  unsigned int v3 = [(BRCStatInfo *)self->super._st type];
  if (v3 > 0xA || ((1 << v3) & 0x611) == 0)
  {
    BOOL v5 = brc_bread_crumbs();
    BOOL v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCDirectoryItem isDirectory]();
    }
  }
  BOOL v7 = [(BRCLocalStatInfo *)self->super._st logicalNameWithoutLocalBounce];
  char v8 = objc_msgSend(v7, "br_isPackageRoot");

  return v8;
}

- (unint64_t)diffAgainstServerItem:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BRCDirectoryItem;
  unint64_t v5 = [(BRCLocalItem *)&v17 diffAgainstServerItem:v4];
  if ([(BRCDirectoryItem *)self isDirectoryWithPackageName])
  {
    BOOL v6 = [(BRCLocalStatInfo *)self->super._st logicalName];
    BOOL v7 = [v4 st];
    char v8 = [v7 logicalName];
    char v9 = [v6 isEqualToString:v8] & ((v5 & 0x40) != 0);

    unint64_t v10 = v5 & 0xFFFFFFFFFFFFFFBFLL;
    if (v9) {
      v5 &= ~0x40uLL;
    }
  }
  else
  {
    unint64_t v10 = v5 & 0xFFFFFFFFFFFFFFBFLL;
  }
  if ([(BRCDirectoryItem *)self isDirectoryWithPackageName])
  {
    v11 = [(BRCLocalStatInfo *)self->super._st logicalNameWithoutLocalBounce];
    objc_super v12 = [v4 st];
    v13 = [v12 logicalName];
    if ([v11 isEqualToString:v13])
    {

      if ((v5 & 0x40) != 0) {
        unint64_t v5 = v10;
      }
    }
    else
    {
    }
  }
  int64_t v14 = [(BRCDirectoryItem *)self mtime];
  if (v14 == [v4 directoryMtime]) {
    unint64_t v15 = v5;
  }
  else {
    unint64_t v15 = v5 | 0x4000;
  }

  return v15;
}

- (unint64_t)diffAgainstLocalItem:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BRCDirectoryItem;
  unint64_t v5 = [(BRCLocalItem *)&v14 diffAgainstLocalItem:v4];
  if ((v5 & 0x4000000000000) == 0)
  {
    previousItemGlobalID = self->_previousItemGlobalID;
    BOOL v7 = [v4 asDirectory];
    char v8 = (void *)v7[25];
    char v9 = previousItemGlobalID;
    unint64_t v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
      int v12 = 0;
    }
    else if (v10)
    {
      int v12 = ![(BRCItemGlobalID *)v9 isEqual:v10];
    }
    else
    {
      int v12 = 1;
    }

    if (v12) {
      v5 |= 0x4000000000000uLL;
    }
  }

  return v5;
}

- (BOOL)hasShareIDAndIsOwnedByMe
{
  BOOL v3 = [(BRCLocalItem *)self isOwnedByMe];
  if (v3) {
    return (LOBYTE(self->super._sharingOptions) >> 2) & 1;
  }
  return v3;
}

- (id)_initFromPQLResultSet:(id)a3 session:(id)a4 db:(id)a5 error:(id *)a6
{
  id v10 = a3;
  v19.receiver = self;
  v19.super_class = (Class)BRCDirectoryItem;
  v11 = [(BRCLocalItem *)&v19 _initFromPQLResultSet:v10 session:a4 db:a5 error:a6];
  if (v11)
  {
    int v12 = [v10 objectOfClass:objc_opt_class() atIndex:49];
    uint64_t v13 = [v10 numberAtIndex:50];
    objc_super v14 = (void *)v13;
    if (v12) {
      BOOL v15 = v13 == 0;
    }
    else {
      BOOL v15 = 1;
    }
    if (!v15)
    {
      v16 = [[BRCItemGlobalID alloc] initWithZoneRowID:v13 itemID:v12];
      objc_super v17 = (void *)v11[25];
      v11[25] = v16;
    }
    v11[26] = [v10 longLongAtIndex:37];
  }
  return v11;
}

- (id)_initWithServerItem:(id)a3 dbRowID:(unint64_t)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BRCDirectoryItem;
  id v7 = [(BRCLocalItem *)&v13 _initWithServerItem:v6 dbRowID:a4];
  if (v7)
  {
    *((void *)v7 + 26) = [v6 directoryMtime];
    char v8 = [v6 st];
    if ([v8 type])
    {
    }
    else
    {
      char v9 = [*((id *)v7 + 1) notificationManager];
      id v10 = [v6 itemGlobalID];
      char v11 = [v9 hasWatcherMatchingGlobalItemID:v10];

      if ((v11 & 1) == 0) {
        [*((id *)v7 + 9) setType:9];
      }
    }
  }

  return v7;
}

- (id)_initWithLocalItem:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BRCDirectoryItem;
  id v5 = [(BRCLocalItem *)&v8 _initWithLocalItem:v4];
  if (v5)
  {
    uint64_t v6 = [v4 asDirectory];
    *((void *)v5 + 26) = *(void *)(v6 + 208);
    objc_storeStrong((id *)v5 + 25, *(id *)(v6 + 200));
  }
  return v5;
}

- (void)updateItemMetadataFromServerItem:(id)a3 appliedSharingPermission:(BOOL)a4
{
  BOOL v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)BRCDirectoryItem;
  id v6 = a3;
  [(BRCLocalItem *)&v8 updateItemMetadataFromServerItem:v6 appliedSharingPermission:v4];
  int64_t v7 = objc_msgSend(v6, "directoryMtime", v8.receiver, v8.super_class);

  self->_mtime = v7;
}

- (void)_learnItemID:(id)a3 serverItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BRCDirectoryItem;
  [(BRCLocalItem *)&v14 _learnItemID:v6 serverItem:v7];
  if (v7)
  {
    objc_super v8 = [(BRCLocalItem *)self st];
    char v9 = [v7 st];
    objc_msgSend(v8, "setType:", objc_msgSend(v9, "type"));

LABEL_8:
    goto LABEL_9;
  }
  if ([v6 isDocumentsFolder])
  {
    id v10 = [(BRCLocalItem *)self appLibrary];
    int v11 = [v10 state];

    int v12 = [(BRCLocalItem *)self st];
    objc_super v8 = v12;
    if ((v11 & 0x4000000) != 0) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = 9;
    }
    [v12 setType:v13];
    goto LABEL_8;
  }
LABEL_9:
}

- (BOOL)isAppLibraryTrashFolder
{
  BOOL v3 = [(BRCLocalStatInfo *)self->super._st logicalName];
  int v4 = [v3 isEqualToString:*MEMORY[0x263F32538]];

  if (!v4) {
    return 0;
  }
  id v5 = [(BRCLocalItem *)self appLibrary];
  int v6 = [v5 isCloudDocsAppLibrary];

  id v7 = [(BRCStatInfo *)self->super._st parentID];
  objc_super v8 = v7;
  if (v6) {
    char v9 = [v7 isNonDesktopRoot];
  }
  else {
    char v9 = [v7 isDocumentsFolder];
  }
  BOOL v10 = v9;

  return v10;
}

- (id)descriptionWithContext:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BRCDirectoryItem;
  int v4 = [(BRCLocalItem *)&v7 descriptionWithContext:a3];
  id v5 = (void *)[v4 mutableCopy];

  if (self->_previousItemGlobalID) {
    [v5 appendFormat:@" prev-glob{%@}", self->_previousItemGlobalID];
  }
  if (self->_childItemCount) {
    [v5 appendFormat:@" ch:%@", self->_childItemCount];
  }
  return v5;
}

- (BOOL)possiblyContainsSharedItem
{
  id v3 = [(BRCPQLConnection *)self->super._db fetch:@"SELECT shared_by_me_count | shared_to_me_count, dir_faults_count FROM item_recursive_properties WHERE item_rowid = %llu", self->super._dbRowID];
  if (![v3 next]) {
    goto LABEL_6;
  }
  if (([v3 BOOLAtIndex:0] & 1) == 0)
  {
    if ([v3 BOOLAtIndex:1])
    {
      db = self->super._db;
      itemID = self->super._itemID;
      objc_super v7 = [(BRCClientZone *)self->super._clientZone dbRowID];
      id v8 = [(PQLConnection *)db numberWithSQL:@"SELECT IFNULL(shared_children_count, 0) | IFNULL(shared_alias_count, 0) FROM server_items WHERE item_id = %@ AND zone_rowid = %@", itemID, v7];

      char v4 = [v8 BOOLValue];
      goto LABEL_7;
    }
LABEL_6:
    char v4 = 0;
    goto LABEL_7;
  }
  char v4 = 1;
LABEL_7:

  return v4;
}

- (BOOL)isSharedByMeOrContainsSharedByMeItem
{
  id v3 = [(BRCPQLConnection *)self->super._db fetch:@"SELECT shared_by_me_count, dir_faults_count FROM item_recursive_properties WHERE item_rowid = %llu", self->super._dbRowID];
  if (![v3 next]) {
    goto LABEL_6;
  }
  if (([v3 BOOLAtIndex:0] & 1) == 0)
  {
    if ([v3 BOOLAtIndex:1])
    {
      db = self->super._db;
      itemID = self->super._itemID;
      objc_super v7 = [(BRCClientZone *)self->super._clientZone dbRowID];
      id v8 = [(PQLConnection *)db numberWithSQL:@"SELECT shared_children_count FROM server_items WHERE item_id = %@ AND zone_rowid = %@", itemID, v7];

      char v4 = [v8 BOOLValue];
      goto LABEL_7;
    }
LABEL_6:
    char v4 = 0;
    goto LABEL_7;
  }
  char v4 = 1;
LABEL_7:

  return v4;
}

- (BOOL)isSharedToMeOrContainsSharedToMeItem
{
  id v3 = [(BRCPQLConnection *)self->super._db fetch:@"SELECT shared_to_me_count, dir_faults_count FROM item_recursive_properties WHERE item_rowid = %llu", self->super._dbRowID];
  if (![v3 next]) {
    goto LABEL_6;
  }
  if (([v3 BOOLAtIndex:0] & 1) == 0)
  {
    if ([v3 BOOLAtIndex:1])
    {
      db = self->super._db;
      itemID = self->super._itemID;
      objc_super v7 = [(BRCClientZone *)self->super._clientZone dbRowID];
      id v8 = [(PQLConnection *)db numberWithSQL:@"SELECT shared_alias_count FROM server_items WHERE item_id = %@ AND zone_rowid = %@", itemID, v7];

      char v4 = [v8 BOOLValue];
      goto LABEL_7;
    }
LABEL_6:
    char v4 = 0;
    goto LABEL_7;
  }
  char v4 = 1;
LABEL_7:

  return v4;
}

- (BOOL)containsOverQuotaItems
{
  id v2 = [(PQLConnection *)self->super._db numberWithSQL:@"SELECT over_quota_count FROM item_recursive_properties WHERE item_rowid = %llu", self->super._dbRowID];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)containsDirFault
{
  if ([(BRCDirectoryItem *)self isDirectoryFault]) {
    return 1;
  }
  id v4 = [(PQLConnection *)self->super._db numberWithSQL:@"SELECT dir_faults_count FROM item_recursive_properties WHERE item_rowid = %llu", self->super._dbRowID];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (BOOL)containsPendingUploadOrSyncUp
{
  id v2 = [(PQLConnection *)self->super._db numberWithSQL:@"SELECT 1 FROM item_recursive_properties WHERE item_rowid = %llu AND (needs_sync_up_count != 0 OR needs_upload_count != 0)", self->super._dbRowID];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)containsPendingDeleteDocuments
{
  db = self->super._db;
  unint64_t dbRowID = self->super._dbRowID;
  id v4 = [(BRCClientZone *)self->super._clientZone dbRowID];
  id v5 = [(PQLConnection *)db numberWithSQL:@"WITH RECURSIVE pending_delete_children (item_id, item_type, needs_delete_doc_count) AS(    SELECT item_id, item_type, needs_delete_doc_count FROM item_recursive_properties      WHERE item_rowid = %llu AND needs_delete_doc_count != 0  UNION ALL     SELECT ip.item_id, ip.item_type, ip.needs_delete_doc_count FROM item_recursive_properties AS ip INNER JOIN pending_delete_children AS p WHERE ip.item_parent_id = p.item_id AND ip.zone_rowid = %@ AND ip.needs_delete_doc_count != 0) SELECT 1 FROM pending_delete_children AS pdc WHERE pdc.needs_delete_doc_count != 0 AND pdc.item_type IN (1, 2, 8) LIMIT 1", dbRowID, v4];

  LOBYTE(v4) = [v5 BOOLValue];
  return (char)v4;
}

- (void)transformIntoFSRoot
{
  self->super._st->super._type = 4;
}

- (BOOL)hasDeadChildren
{
  db = self->super._db;
  itemID = self->super._itemID;
  id v4 = [(BRCClientZone *)self->super._clientZone dbRowID];
  id v5 = [(PQLConnection *)db numberWithSQL:@"SELECT 1 FROM client_items WHERE item_parent_id = %@ AND item_state = 1 AND item_parent_zone_rowid = %@ LIMIT 1", itemID, v4];

  LOBYTE(v4) = [v5 BOOLValue];
  return (char)v4;
}

- (BOOL)hasLiveChildren
{
  char v3 = [(BRCClientZone *)self->super._clientZone db];
  itemID = self->super._itemID;
  id v5 = [(BRCClientZone *)self->super._clientZone dbRowID];
  int v6 = (void *)[v3 numberWithSQL:@"SELECT 1 FROM client_items WHERE item_parent_id = %@    AND item_state IN (0)   AND item_parent_zone_rowid = %@ LIMIT 1", itemID, v5];

  LOBYTE(v5) = [v6 BOOLValue];
  return (char)v5;
}

- (id)_serverChildItemCountIncludingHiddenFiles
{
  clientZone = self->super._clientZone;
  itemID = self->super._itemID;
  id v4 = [(BRCLocalItem *)self db];
  id v5 = [(BRCClientZone *)clientZone serverChildCountWithParentID:itemID db:v4];

  return v5;
}

- (id)_serverChildItemCount
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(BRCDirectoryItem *)self _serverChildItemCountIncludingHiddenFiles];
  if (v3)
  {
    id v4 = (void *)v3;
    clientZone = self->super._clientZone;
    itemID = self->super._itemID;
    objc_super v7 = [(BRCLocalItem *)self db];
    id v8 = [(BRCClientZone *)clientZone serverHiddenChildCountWithParentID:itemID db:v7];

    uint64_t v9 = [v4 longLongValue];
    uint64_t v10 = v9 - [v8 longLongValue];
    if (v10 < 0)
    {
      int v11 = brc_bread_crumbs();
      int v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        int v15 = 138413058;
        v16 = v4;
        __int16 v17 = 2112;
        v18 = v8;
        __int16 v19 = 2112;
        v20 = self;
        __int16 v21 = 2112;
        v22 = v11;
        _os_log_fault_impl(&dword_23FA42000, v12, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: server count %@ minus hidden count %@ is less than 0 for %@%@", (uint8_t *)&v15, 0x2Au);
      }

      uint64_t v10 = 0;
    }
    uint64_t v13 = [NSNumber numberWithLongLong:v10];
  }
  else
  {
    uint64_t v13 = 0;
  }
  return v13;
}

- (id)childItemCount
{
  if (!self->_childItemCount)
  {
    if ([(BRCDirectoryItem *)self isDirectoryFault])
    {
      uint64_t v3 = [(BRCDirectoryItem *)self _serverChildItemCount];
      childItemCount = self->_childItemCount;
      self->_childItemCount = v3;
    }
    else
    {
      clientZone = self->super._clientZone;
      itemID = self->super._itemID;
      childItemCount = [(BRCLocalItem *)self db];
      objc_super v7 = [(BRCClientZone *)clientZone clientChildCountWithParentID:itemID db:childItemCount];
      id v8 = self->_childItemCount;
      self->_childItemCount = v7;
    }
  }
  uint64_t v9 = self->_childItemCount;
  return v9;
}

- (id)serverQuotaUsage
{
  clientZone = self->super._clientZone;
  itemID = self->super._itemID;
  id v4 = [(BRCLocalItem *)self db];
  id v5 = [(BRCClientZone *)clientZone serverQuotaUsageWithParentID:itemID db:v4];

  return v5;
}

- (id)clientZonesChildrenNeedingSyncUpAreIn
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v20 = objc_opt_new();
  db = self->super._db;
  itemID = self->super._itemID;
  id v5 = [(BRCClientZone *)self->super._clientZone dbRowID];
  id v6 = [(BRCPQLConnection *)db fetch:@"SELECT DISTINCT zone_rowid FROM client_items WHERE item_parent_id = %@   AND item_parent_zone_rowid = %@    AND item_localsyncupstate = 4   AND item_state IN (0, 1)", itemID, v5];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = [v6 enumerateObjectsOfClass:objc_opt_class()];
  uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        int v12 = [(BRCAccountSessionFPFS *)self->super._session serverZoneByRowID:v11];
        uint64_t v13 = [v12 clientZone];
        if (v13)
        {
          [v20 addObject:v13];
        }
        else
        {
          objc_super v14 = brc_bread_crumbs();
          int v15 = brc_default_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v26 = v11;
            __int16 v27 = 2112;
            v28 = v14;
            _os_log_fault_impl(&dword_23FA42000, v15, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Can't find clientZone for zoneID %@%@", buf, 0x16u);
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v8);
  }

  if ([v20 count]) {
    v16 = v20;
  }
  else {
    v16 = 0;
  }
  id v17 = v16;

  return v17;
}

- (void)_retryPostponedIfNeededForDiffs:(unint64_t)a3
{
  int v3 = a3;
  if ([(BRCLocalItem *)self isDead])
  {
    if ([(BRCLocalItem *)self isKnownByServerOrInFlight]) {
      return;
    }
  }
  else if ((v3 & 0x80000000) == 0)
  {
    if (![(BRCLocalItem *)self isOnDisk]) {
      return;
    }
    id v5 = [(BRCLocalItem *)self orig];
    char v6 = [v5 isOnDisk];

    if ((v6 & 1) != 0 || ![(BRCLocalItem *)self isKnownByServerOrInFlight]) {
      return;
    }
  }
  id v7 = [(BRCAccountSessionFPFS *)self->super._session applyScheduler];
  [v7 didCreateMissingParentID:self->super._itemID zone:self->super._serverZone];
}

- (BOOL)_repopulateRecursivePropertiesIfNecessary
{
  db = self->super._db;
  itemID = self->super._itemID;
  id v5 = [(BRCClientZone *)self->super._clientZone dbRowID];
  id v6 = [(BRCPQLConnection *)db fetch:@"SELECT SUM(dir_faults_count), SUM(uploaded_size), SUM(needs_upload_size), SUM(uploaded_count), SUM(needs_upload_count), SUM(synced_up_count), SUM(needs_sync_up_count), SUM(over_quota_count), SUM(shared_by_me_count), SUM(shared_to_me_count), SUM(needs_delete_doc_count) FROM item_recursive_properties WHERE item_parent_id = %@ AND item_parent_zone_rowid = %@", itemID, v5];

  if ([v6 next]) {
    BOOL v7 = -[BRCPQLConnection execute:](self->super._db, "execute:", @"UPDATE item_recursive_properties SET  dir_faults_count = %lld, uploaded_size = %lld, needs_upload_size = %lld, uploaded_count = %lld, needs_upload_count = %lld, synced_up_count = %lld, needs_sync_up_count = %lld, over_quota_count = %lld, shared_by_me_count = %lld, shared_to_me_count = %lld, needs_delete_doc_count = %lld  WHERE item_rowid = %llu ", [v6 unsignedLongLongAtIndex:0]+ -[BRCDirectoryItem isDirectoryFault](self, "isDirectoryFault"), objc_msgSend(v6, "unsignedLongLongAtIndex:", 1), objc_msgSend(v6, "unsignedLongLongAtIndex:", 2), objc_msgSend(v6, "unsignedLongLongAtIndex:", 3), objc_msgSend(v6, "unsignedLongLongAtIndex:", 4), objc_msgSend(v6, "unsignedLongLongAtIndex:", 5), objc_msgSend(v6, "unsignedLongLongAtIndex:", 6), objc_msgSend(v6, "unsignedLongLongAtIndex:", 7), objc_msgSend(v6, "unsignedLongLongAtIndex:", 8)+ -[BRCDirectoryItem hasShareIDAndIsOwnedByMe](self, "hasShareIDAndIsOwnedByMe"), objc_msgSend(v6, "unsignedLongLongAtIndex:", 9)+ -[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem"), objc_msgSend(v6, "unsignedLongLongAtIndex:", 10), self->super._dbRowID);
  }
  else {
    BOOL v7 = 1;
  }

  return v7;
}

- (BOOL)_insertRecursiveProperties
{
  int v3 = [(BRCStatInfo *)self->super._st parentID];
  if ([(BRCItemID *)self->super._itemID isDocumentsFolder]
    || ([(BRCLocalStatInfo *)self->super._st logicalName],
        id v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 isEqualToString:*MEMORY[0x263F32538]],
        v4,
        v5))
  {

    int v3 = 0;
  }
  db = self->super._db;
  unint64_t dbRowID = self->super._dbRowID;
  itemID = self->super._itemID;
  int v9 = [(BRCStatInfo *)self->super._st type];
  uint64_t v10 = [(BRCClientZone *)self->super._clientZone dbRowID];
  LODWORD(db) = [(BRCPQLConnection *)db execute:@"INSERT OR REPLACE INTO item_recursive_properties (item_rowid, item_id, item_parent_id, item_type, zone_rowid, item_parent_zone_rowid) VALUES (%llu, %@, %@, %u, %@, %@)", dbRowID, itemID, v3, v9, v10, self->super._parentZoneRowID];

  if (db) {
    BOOL v11 = [(BRCDirectoryItem *)self _repopulateRecursivePropertiesIfNecessary];
  }
  else {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)_updateRecursiveProperties
{
  int v3 = [(BRCStatInfo *)self->super._st type];
  id v4 = [(BRCLocalItem *)self->super._orig st];
  int v5 = [v4 type];

  if (v3 == v5)
  {
    BOOL v6 = 1;
    goto LABEL_17;
  }
  if (([(BRCStatInfo *)self->super._st type] - 9) <= 1u)
  {
    BOOL v7 = [(BRCLocalItem *)self->super._orig st];
    int v8 = [v7 type];

    if (!v8)
    {
      BOOL v11 = [(BRCPQLConnection *)self->super._db execute:@"UPDATE item_recursive_properties SET item_type = %d, dir_faults_count = dir_faults_count + 1 WHERE item_rowid = %llu", [(BRCStatInfo *)self->super._st type], self->super._dbRowID];
      goto LABEL_16;
    }
  }
  if (![(BRCStatInfo *)self->super._st type])
  {
    int v9 = [(BRCLocalItem *)self->super._orig st];
    unsigned int v10 = ([v9 type] - 9);

    if (v10 <= 1)
    {
      BOOL v11 = [(BRCPQLConnection *)self->super._db execute:@"UPDATE item_recursive_properties SET item_type = %d, dir_faults_count = dir_faults_count - 1 WHERE item_rowid = %llu", [(BRCStatInfo *)self->super._st type], self->super._dbRowID];
LABEL_16:
      BOOL v6 = v11;
      goto LABEL_17;
    }
  }
  BOOL v6 = [(BRCPQLConnection *)self->super._db execute:@"UPDATE item_recursive_properties SET item_type = %d WHERE item_rowid = %llu", [(BRCStatInfo *)self->super._st type], self->super._dbRowID];
  if ([(BRCStatInfo *)self->super._st type] == 4) {
    goto LABEL_17;
  }
  int v12 = [(BRCLocalItem *)self->super._orig st];
  if ([v12 type] != 4)
  {
    uint64_t v13 = [(BRCLocalItem *)self->super._orig st];
    int v14 = [v13 type];

    if (v14 == 10) {
      goto LABEL_17;
    }
    int v12 = brc_bread_crumbs();
    int v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[BRCDirectoryItem _updateRecursiveProperties]();
    }
  }
LABEL_17:
  int sharingOptions = self->super._sharingOptions;
  if ((([(BRCLocalItem *)self->super._orig sharingOptions] ^ sharingOptions) & 4) != 0)
  {
    if (([(BRCPQLConnection *)self->super._db isBatchSuspended] & 1) == 0)
    {
      long long v22 = brc_bread_crumbs();
      long long v23 = brc_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
        -[BRCLocalItem createSyncUpJob].cold.7();
      }
    }
    if ((self->super._sharingOptions & 4) != 0)
    {
      if ([(BRCServerZone *)self->super._serverZone isSharedZone]) {
        v20 = "shared_to_me_count = shared_to_me_count + 1";
      }
      else {
        v20 = "shared_by_me_count = shared_by_me_count + 1";
      }
      __int16 v19 = [MEMORY[0x263F8C720] rawInjection:v20 length:43];
      if (!v6)
      {
        LOBYTE(v6) = 0;
        goto LABEL_31;
      }
    }
    else
    {
      id v17 = [(BRCLocalItem *)self->super._orig serverZone];
      if ([v17 isSharedZone]) {
        v18 = "shared_to_me_count = shared_to_me_count - 1";
      }
      else {
        v18 = "shared_by_me_count = shared_by_me_count - 1";
      }
      __int16 v19 = [MEMORY[0x263F8C720] rawInjection:v18 length:43];

      if (!v6) {
        goto LABEL_31;
      }
    }
    LOBYTE(v6) = [(BRCPQLConnection *)self->super._db execute:@"UPDATE item_recursive_properties SET %@ WHERE item_rowid = %llu", v19, self->super._dbRowID];
LABEL_31:
  }
  return v6;
}

- (BOOL)_recomputeChildItemCount
{
  db = self->super._db;
  id v4 = [(BRCLocalItem *)self itemID];
  int v5 = [(BRCClientZone *)self->super._clientZone dbRowID];
  LOBYTE(db) = [(BRCPQLConnection *)db execute:@"UPDATE client_items AS parent SET visible_child_count = (SELECT COUNT(*) FROM client_items AS child WHERE child.item_parent_id = parent.item_id AND child.item_parent_zone_rowid = parent.zone_rowid AND (child.item_user_visible = 1 OR (child.item_scope == 3 AND child.item_filename != \".Trash\"))) WHERE parent.item_id = %@ AND parent.zone_rowid = %@", v4, v5];

  return (char)db;
}

- (BOOL)_insertInDB:(id)a3 dbRowID:(unint64_t)a4
{
  id v47 = a3;
  [(BRCDirectoryItem *)self _retryPostponedIfNeededForDiffs:0xFF003FF3FF7FFFLL];
  v46 = [(BRCClientZone *)self->super._clientZone dbRowID];
  int64_t mtime = self->_mtime;
  itemID = self->super._itemID;
  ownerKey = self->super._ownerKey;
  unint64_t sharingOptions = self->super._sharingOptions;
  sideCarCKInfo = self->super._sideCarCKInfo;
  parentZoneRowID = self->super._parentZoneRowID;
  unint64_t localDiffs = self->super._localDiffs;
  unint64_t notifsRank = self->super._notifsRank;
  uint64_t syncUpState = self->super._syncUpState;
  id v41 = [(BRCLocalItem *)self appLibrary];
  v45 = [v41 dbRowID];
  minimumSupportedOSRowID = self->super._minimumSupportedOSRowID;
  BOOL isUserVisible = self->super._isUserVisible;
  v44 = [(BRCStatInfo *)self->super._st ckInfo];
  int v29 = [(BRCStatInfo *)self->super._st state];
  int v26 = [(BRCStatInfo *)self->super._st type];
  int v28 = [(BRCStatInfo *)self->super._st mode];
  int64_t v27 = [(BRCStatInfo *)self->super._st birthtime];
  int64_t v25 = [(BRCStatInfo *)self->super._st lastUsedTime];
  int64_t v23 = [(BRCStatInfo *)self->super._st favoriteRank];
  id v43 = [(BRCStatInfo *)self->super._st parentID];
  st = self->super._st;
  logicalName = (__CFString *)st->super._logicalName;
  if (!logicalName) {
    logicalName = &stru_26F3822F0;
  }
  v20 = logicalName;
  BOOL v19 = [(BRCStatInfo *)st isHiddenExt];
  long long v24 = [(BRCStatInfo *)self->super._st finderTags];
  long long v21 = [(BRCStatInfo *)self->super._st xattrSignature];
  v18 = [(BRCStatInfo *)self->super._st trashPutBackPath];
  id v17 = [(BRCStatInfo *)self->super._st trashPutBackParentID];
  BOOL v7 = [(BRCStatInfo *)self->super._st aliasTarget];
  int v8 = [(BRCStatInfo *)self->super._st creatorRowID];
  int v9 = [(BRCLocalStatInfo *)self->super._st processingStamp];
  unsigned int v10 = [(BRCLocalStatInfo *)self->super._st rawBouncedLogicalName];
  unsigned int v11 = [(BRCLocalStatInfo *)self->super._st itemScope];
  unint64_t v12 = [(BRCLocalStatInfo *)self->super._st localChangeCount];
  v16 = [(BRCLocalStatInfo *)self->super._st oldVersionIdentifier];
  uint64_t v13 = [(BRCLocalStatInfo *)self->super._st fpCreationItemIdentifier];
  int v40 = objc_msgSend(v47, "execute:", @"INSERT INTO client_items(rowid, zone_rowid, version_mtime, visible_child_count, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier) VALUES(%lld, %@, %lld, 0, %@, %@, %ld, %@, %@, %d, %lld, %lld, %@, %@, %d, %@, %d, %d, %d, %lld, %lld, %lld, %@, %@, %d, %@, %@, %@, %@, %@, %@, %@, %@, %d, %llu, %@, %@)", a4, v46, mtime, itemID, ownerKey, sharingOptions, sideCarCKInfo, parentZoneRowID, syncUpState, localDiffs, notifsRank, v45, minimumSupportedOSRowID, isUserVisible, v44, v29,
          v26,
          v28,
          v27,
          v25,
          v23,
          v43,
          v20,
          v19,
          v24,
          v21,
          v18,
          v17,
          v7,
          v8,
          v9,
          v10,
          v11,
          v12,
          v16,
          v13);

  BOOL v14 = v40
     && (v48.receiver = self,
         v48.super_class = (Class)BRCDirectoryItem,
         [(BRCLocalItem *)&v48 _insertInDB:v47 dbRowID:a4])
     && [(BRCDirectoryItem *)self _insertRecursiveProperties]
     && [(BRCDirectoryItem *)self _recomputeChildItemCount];

  return v14;
}

- (BOOL)_updateInDB:(id)a3 diffs:(unint64_t)a4
{
  uint64_t v104 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ((a4 & 0x80000000) != 0
    && (previousItemGlobalID = self->_previousItemGlobalID,
        [(BRCLocalItem *)self->super._orig itemGlobalID],
        int v8 = objc_claimAutoreleasedReturnValue(),
        LOBYTE(previousItemGlobalID) = [(BRCItemGlobalID *)previousItemGlobalID isEqualToItemGlobalID:v8], v8, (previousItemGlobalID & 1) == 0))
  {
    if (([v6 isBatchSuspended] & 1) == 0)
    {
      v52 = brc_bread_crumbs();
      v53 = brc_default_log();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT)) {
        -[BRCDirectoryItem _updateInDB:diffs:]();
      }
    }
    itemID = self->super._itemID;
    v16 = [(BRCClientZone *)self->super._clientZone dbRowID];
    id v17 = [(BRCLocalItem *)self->super._orig itemID];
    v18 = [(BRCClientZone *)self->super._clientZone dbRowID];
    int v9 = [v6 execute:@"UPDATE client_items   SET item_parent_id = %@, item_parent_zone_rowid = %@ WHERE item_parent_id = %@   AND item_parent_zone_rowid = %@", itemID, v16, v17, v18];

    uint64_t v19 = [v6 changes];
    if (v19 >= 1)
    {
      uint64_t v20 = v19;
      long long v21 = brc_bread_crumbs();
      long long v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        v50 = [(BRCLocalItem *)self->super._orig itemID];
        v51 = self->super._itemID;
        *(_DWORD *)buf = 134218754;
        uint64_t v97 = v20;
        __int16 v98 = 2112;
        v99 = v50;
        __int16 v100 = 2112;
        v101 = v51;
        __int16 v102 = 2112;
        v103 = v21;
        _os_log_debug_impl(&dword_23FA42000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] Updated %llu items from parent %@ to %@%@", buf, 0x2Au);
      }
    }
  }
  else
  {
    int v9 = 1;
  }
  if ((a4 & 0x4000000000000) != 0)
  {
    unsigned int v10 = [(BRCItemGlobalID *)self->_previousItemGlobalID itemID];
    unsigned int v11 = [(BRCItemGlobalID *)self->_previousItemGlobalID zoneRowID];
    char v12 = [v6 execute:@"UPDATE client_items   SET version_old_zone_item_id = %@, version_old_zone_rowid = %@ WHERE rowid = %llu", v10, v11, self->super._dbRowID];

    if ((v12 & 1) == 0)
    {
      LOBYTE(v9) = 0;
      goto LABEL_17;
    }
  }
  else if (!v9)
  {
    goto LABEL_17;
  }
  if ([(BRCLocalItem *)self isAlmostDead])
  {
    uint64_t v13 = [(BRCLocalItem *)self orig];
    char v14 = [v13 isAlmostDead];

    if ((v14 & 1) == 0)
    {
      if (([v6 isBatchSuspended] & 1) == 0)
      {
        v54 = brc_bread_crumbs();
        v55 = brc_default_log();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT)) {
          -[BRCDirectoryItem _updateInDB:diffs:]();
        }
      }
      unint64_t v57 = a4;
      id v86 = v6;
      long long v24 = [(BRCClientZone *)self->super._clientZone db];
      int64_t v25 = [(BRCLocalItem *)self itemID];
      int v26 = [(BRCClientZone *)self->super._clientZone dbRowID];
      int64_t v27 = (void *)[v24 fetch:@"SELECT si.rowid FROM server_items AS si INNER JOIN client_unapplied_table AS ap ON si.item_rank = ap.throttle_id WHERE si.item_parent_id = %@   AND si.zone_rowid = %@   AND si.item_type = 3   AND ap.throttle_state = 24", v25, v26];

      long long v93 = 0u;
      long long v94 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      v84 = v27;
      id obj = [v27 enumerateObjectsOfClass:objc_opt_class()];
      uint64_t v28 = [obj countByEnumeratingWithState:&v91 objects:v95 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v92;
        do
        {
          uint64_t v31 = 0;
          do
          {
            if (*(void *)v92 != v30) {
              objc_enumerationMutation(obj);
            }
            v32 = -[BRCClientZone serverItemByRowID:](self->super._clientZone, "serverItemByRowID:", [*(id *)(*((void *)&v91 + 1) + 8 * v31) longLongValue]);
            id v33 = brc_bread_crumbs();
            brc_default_log();
            v35 = char v34 = self;
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v97 = (uint64_t)v32;
              __int16 v98 = 2112;
              v99 = v33;
              _os_log_debug_impl(&dword_23FA42000, v35, OS_LOG_TYPE_DEBUG, "[DEBUG] Inserting tombstone for alias %@ which is pending target%@", buf, 0x16u);
            }

            v36 = (void *)[v32 newLocalItemWithServerZone:v34->super._serverZone dbRowID:0];
            [v36 markDead];
            [v36 markForceNeedsSyncUp];
            [v36 saveToDB];

            ++v31;
            self = v34;
          }
          while (v29 != v31);
          uint64_t v29 = [obj countByEnumeratingWithState:&v91 objects:v95 count:16];
        }
        while (v29);
      }

      [(BRCDirectoryItem *)self signalPropagationToChildren];
      a4 = v57;
      [(BRCDirectoryItem *)self _retryPostponedIfNeededForDiffs:v57];
      id v6 = v86;
      goto LABEL_33;
    }
  }
  LOBYTE(v9) = 1;
LABEL_17:
  BOOL v23 = [(BRCLocalItem *)self isLive];
  if ((a4 & 0x40001040000060) != 0 && v23) {
    [(BRCDirectoryItem *)self signalPropagationToChildren];
  }
  [(BRCDirectoryItem *)self _retryPostponedIfNeededForDiffs:a4];
  if ((v9 & 1) == 0)
  {
LABEL_43:
    BOOL v48 = 0;
    goto LABEL_45;
  }
LABEL_33:
  unint64_t v58 = a4;
  id obja = [(BRCClientZone *)self->super._clientZone dbRowID];
  v80 = self->super._itemID;
  ownerKey = self->super._ownerKey;
  unint64_t sharingOptions = self->super._sharingOptions;
  sideCarCKInfo = self->super._sideCarCKInfo;
  parentZoneRowID = self->super._parentZoneRowID;
  unint64_t localDiffs = self->super._localDiffs;
  unint64_t notifsRank = self->super._notifsRank;
  uint64_t syncUpState = self->super._syncUpState;
  v82 = [(BRCLocalItem *)self appLibrary];
  v87 = [v82 dbRowID];
  minimumSupportedOSRowID = self->super._minimumSupportedOSRowID;
  BOOL isUserVisible = self->super._isUserVisible;
  v85 = [(BRCStatInfo *)self->super._st ckInfo];
  int v71 = [(BRCStatInfo *)self->super._st state];
  int v70 = [(BRCStatInfo *)self->super._st type];
  int v69 = [(BRCStatInfo *)self->super._st mode];
  int64_t v68 = [(BRCStatInfo *)self->super._st birthtime];
  int64_t v67 = [(BRCStatInfo *)self->super._st lastUsedTime];
  int64_t v64 = [(BRCStatInfo *)self->super._st favoriteRank];
  v83 = [(BRCStatInfo *)self->super._st parentID];
  st = self->super._st;
  logicalName = (__CFString *)st->super._logicalName;
  if (!logicalName) {
    logicalName = &stru_26F3822F0;
  }
  v62 = logicalName;
  BOOL v61 = [(BRCStatInfo *)st isHiddenExt];
  v65 = [(BRCStatInfo *)self->super._st finderTags];
  v63 = [(BRCStatInfo *)self->super._st xattrSignature];
  v60 = [(BRCStatInfo *)self->super._st trashPutBackPath];
  v39 = [(BRCStatInfo *)self->super._st trashPutBackParentID];
  int v40 = [(BRCStatInfo *)self->super._st aliasTarget];
  id v41 = [(BRCStatInfo *)self->super._st creatorRowID];
  v42 = [(BRCLocalStatInfo *)self->super._st processingStamp];
  id v43 = [(BRCLocalStatInfo *)self->super._st rawBouncedLogicalName];
  unsigned int v44 = [(BRCLocalStatInfo *)self->super._st itemScope];
  unint64_t v45 = [(BRCLocalStatInfo *)self->super._st localChangeCount];
  v59 = [(BRCLocalStatInfo *)self->super._st oldVersionIdentifier];
  [(BRCLocalStatInfo *)self->super._st fpCreationItemIdentifier];
  v46 = uint64_t v56 = v44;
  v81 = objc_msgSend(v6, "execute:", @"UPDATE client_items SET zone_rowid = %@, item_id = %@, item_creator_id = %@, item_sharing_options = %ld, item_side_car_ckinfo = %@, item_parent_zone_rowid = %@, item_localsyncupstate = %d, item_local_diffs = %llu, item_notifs_rank = %lld, app_library_rowid = %@, item_min_supported_os_rowid = %@, item_user_visible = %d, item_stat_ckinfo = %@, item_state = %d, item_type = %d, item_mode = %d, item_birthtime = %lld, item_lastusedtime = %lld, item_favoriterank = %lld, item_parent_id = %@, item_filename = %@, item_hidden_ext = %d, item_finder_tags = %@, item_xattr_signature = %@, item_trash_put_back_path = %@, item_trash_put_back_parent_id = %@, item_alias_target = %@, item_creator = %@, item_processing_stamp = %@, item_bouncedname = %@, item_scope = %d,item_local_change_count = %llu, item_old_version_identifier = %@,fp_creation_item_identifier = %@, version_int64_t mtime = %lld  WHERE rowid = %llu", obja, v80, ownerKey, sharingOptions, sideCarCKInfo, parentZoneRowID, syncUpState, localDiffs, notifsRank, v87, minimumSupportedOSRowID, isUserVisible, v85, v71, v70, v69,
          v68,
          v67,
          v64,
          v83,
          v62,
          v61,
          v65,
          v63,
          v60,
          v39,
          v40,
          v41,
          v42,
          v43,
          v56,
          v45,
          v59,
          v46,
          self->_mtime,
          self->super._dbRowID);

  if (!v81)
  {
    BOOL v48 = 0;
    goto LABEL_45;
  }
  v90.receiver = self;
  v90.super_class = (Class)BRCDirectoryItem;
  if (![(BRCLocalItem *)&v90 _updateInDB:v6 diffs:v58]) {
    goto LABEL_43;
  }
  BOOL v47 = [(BRCDirectoryItem *)self _updateRecursiveProperties];
  BOOL v48 = (v58 & 0x80000000) == 0 && v47;
  if ((v58 & 0x80000000) != 0 && v47) {
    BOOL v48 = [(BRCDirectoryItem *)self _recomputeChildItemCount];
  }
LABEL_45:

  return v48;
}

- (BOOL)_deleteFromDB:(id)a3 keepAliases:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [(BRCLocalItem *)self isSharedToMeTopLevelItem]
    || [(BRCLocalItem *)self isSharedToMeChildItem];
  if (self->_needsDeleteForItemIDTransfer)
  {
    if (([(BRCPQLConnection *)self->super._db isInTransaction] & 1) == 0)
    {
      int v8 = brc_bread_crumbs();
      int v9 = brc_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        -[BRCDirectoryItem _deleteFromDB:keepAliases:]();
      }
    }
  }
  else
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __46__BRCDirectoryItem__deleteFromDB_keepAliases___block_invoke;
    v16[3] = &__block_descriptor_33_e48_v28__0__sqlite3_context__8i16___sqlite3_value_20l;
    BOOL v17 = v7;
    unsigned int v10 = (void *)MEMORY[0x2455D9A50](v16);
    itemID = self->super._itemID;
    char v12 = [(BRCClientZone *)self->super._clientZone dbRowID];
    LOBYTE(itemID) = [v6 execute:@"UPDATE client_items SET item_parent_id = call_block(%@, item_state, app_library_rowid, zone_rowid, rowid), item_localname = call_block(%@) WHERE item_parent_id = %@   AND item_parent_zone_rowid = %@", v10, &__block_literal_global_58, itemID, v12];

    if ((itemID & 1) == 0)
    {
      BOOL v13 = 0;
      goto LABEL_11;
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)BRCDirectoryItem;
  BOOL v13 = [(BRCLocalItem *)&v15 _deleteFromDB:v6 keepAliases:v4];
LABEL_11:

  return v13;
}

void __46__BRCDirectoryItem__deleteFromDB_keepAliases___block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  BOOL v7 = brc_bread_crumbs();
  int v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __46__BRCDirectoryItem__deleteFromDB_keepAliases___block_invoke_cold_2((uint64_t)a4, (uint64_t)v7, v8);
  }

  if (sqlite3_value_int(*a4) != 1)
  {
    unsigned int v11 = brc_bread_crumbs();
    char v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      __46__BRCDirectoryItem__deleteFromDB_keepAliases___block_invoke_cold_1();
    }
  }
  if (*(unsigned char *)(a1 + 32)) {
    char v9 = 5;
  }
  else {
    char v9 = 1;
  }
  uint64_t v10 = 2;
  if (!*(unsigned char *)(a1 + 32)) {
    uint64_t v10 = 1;
  }
  char v13 = v9;
  int v14 = sqlite3_value_int(a4[v10]);
  sqlite3_result_blob(a2, &v13, 5, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

void __46__BRCDirectoryItem__deleteFromDB_keepAliases___block_invoke_116(uint64_t a1, sqlite3_context *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  memset(out, 0, sizeof(out));
  memset(v3, 0, sizeof(v3));
  uuid_generate_random(out);
  uuid_unparse(out, v3);
  sqlite3_result_text(a2, v3, 36, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

- (void)prepareForSyncUpInZone:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BRCDirectoryItem;
  id v4 = a3;
  [(BRCLocalItem *)&v6 prepareForSyncUpInZone:v4];
  uint64_t v5 = objc_msgSend(v4, "clientZone", v6.receiver, v6.super_class);

  [v5 prepareDirectoryForSyncUp:self];
}

- (BOOL)isShareableItem
{
  if ((self->super._sharingOptions & 4) != 0)
  {
    LOBYTE(v3) = 1;
    return v3;
  }
  if (![(BRCItemID *)self->super._itemID isDocumentsFolder])
  {
    id v4 = [(BRCLocalItem *)self clientZone];
    if ([v4 isCloudDocsZone])
    {
      uint64_t v5 = [(BRCLocalItem *)self st];
      objc_super v6 = [v5 parentID];
      if ([v6 isNonDesktopRoot])
      {
        BOOL v7 = [(BRCLocalStatInfo *)self->super._st logicalName];
        if ([v7 isEqualToString:*MEMORY[0x263F32500]])
        {

          LOBYTE(v3) = 0;
LABEL_12:

          return v3;
        }
        char v9 = [(BRCLocalStatInfo *)self->super._st logicalName];
        char v10 = [v9 isEqualToString:*MEMORY[0x263F32510]];

        if (v10) {
          goto LABEL_3;
        }
LABEL_11:
        id v4 = [(BRCLocalItem *)self appLibrary];
        uint64_t v5 = [v4 mangledID];
        objc_super v6 = +[BRCUserDefaults defaultsForMangledID:v5];
        int v3 = [v6 isBlacklistedFromFolderSharing] ^ 1;
        goto LABEL_12;
      }
    }
    goto LABEL_11;
  }
LABEL_3:
  LOBYTE(v3) = 0;
  return v3;
}

- (id)asShareableItem
{
  if ([(BRCDirectoryItem *)self isShareableItem])
  {
    int v3 = self;
  }
  else
  {
    id v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRCDirectoryItem asShareableItem]();
    }

    int v3 = 0;
  }
  return v3;
}

- (id)collaborationIdentifierIfComputable
{
  if ([(BRCDirectoryItem *)self isShareableItem])
  {
    id v3 = objc_alloc(MEMORY[0x263EFD7E8]);
    id v4 = [(BRCDirectoryItem *)self asShareableItem];
    uint64_t v5 = (void *)[v3 initShareIDWithShareableItem:v4];

    objc_super v6 = [(BRCLocalItem *)self session];
    BOOL v7 = [v6 cachedCurrentUserRecordNameIfExists];
    int v8 = objc_msgSend(v5, "brc_collaborationIdentifierWithCachedCurrentUserRecordName:", v7);
  }
  else
  {
    int v8 = 0;
  }
  return v8;
}

- (void)markNeedsDeleteForItemIDTransfer
{
  v3.receiver = self;
  v3.super_class = (Class)BRCDirectoryItem;
  [(BRCLocalItem *)&v3 markNeedsDeleteForItemIDTransfer];
  self->_needsDeleteForItemIDTransfer = 1;
}

- (BOOL)isCrossZoneMoveTombstone
{
  objc_super v3 = [(BRCLocalItem *)self->super._orig asDirectory];
  if (-[BRCLocalItem isDead](self, "isDead") && ([v3 isDead] & 1) == 0)
  {
    uint64_t v5 = [(BRCLocalItem *)self itemGlobalID];
    char v4 = [v5 isEqualToItemGlobalID:v3[25]];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (int64_t)mtime
{
  return self->_mtime;
}

- (void)setMtime:(int64_t)a3
{
  self->_int64_t mtime = a3;
}

- (BRCItemGlobalID)previousItemGlobalID
{
  return self->_previousItemGlobalID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childItemCount, 0);
  objc_storeStrong((id *)&self->_previousItemGlobalID, 0);
}

- (void)isDirectory
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: BRCItemTypeIsDirectory(_st.type)%@", v2, v3, v4, v5, v6);
}

- (void)_updateRecursiveProperties
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _st.type == BRC_ITEM_TYPE_FS_ROOT || _orig.st.type == BRC_ITEM_TYPE_FS_ROOT || _orig.st.type == BRC_ITEM_TYPE_DIRECTORY_SHARE_ACCEPT_FAULT%@", v2, v3, v4, v5, v6);
}

- (void)_updateInDB:diffs:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: [db isBatchSuspended]%@", v2, v3, v4, v5, v6);
}

- (void)_deleteFromDB:keepAliases:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _db.isInTransaction%@", v2, v3, v4, v5, v6);
}

void __46__BRCDirectoryItem__deleteFromDB_keepAliases___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: sqlite3_value_int(argv[0]) == BRC_ITEM_STATE_TOMBSTONE%@", v2, v3, v4, v5, v6);
}

void __46__BRCDirectoryItem__deleteFromDB_keepAliases___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v5 = sqlite3_value_int(*(sqlite3_value **)(a1 + 24));
  v6[0] = 67109378;
  v6[1] = v5;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_23FA42000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] _deleteFromDB: Updating item parent id for item rowid: %d%@", (uint8_t *)v6, 0x12u);
}

- (void)asShareableItem
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: asShareableItem called on a non-shareable item%@", v2, v3, v4, v5, v6);
}

@end