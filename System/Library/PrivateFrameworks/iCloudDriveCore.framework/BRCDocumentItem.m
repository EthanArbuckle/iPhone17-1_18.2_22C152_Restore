@interface BRCDocumentItem
+ (BOOL)isDocumentAutomaticallyEvictableWithExtension:(id)a3;
+ (BOOL)isDocumentAutomaticallyEvictableWithName:(id)a3;
+ (BOOL)shouldDocumentBeGreedyWithName:(id)a3;
- (BOOL)_deleteFromDB:(id)a3 keepAliases:(BOOL)a4;
- (BOOL)_insertInDB:(id)a3 dbRowID:(unint64_t)a4;
- (BOOL)_isInterestingUpdateForNotifs;
- (BOOL)_needsSyncBubbleRecomputeForError:(id)a3 origError:(id)a4;
- (BOOL)_nukePackageItemsFromDB:(id)a3;
- (BOOL)_updateInDB:(id)a3 diffs:(unint64_t)a4;
- (BOOL)_updatePackageItemsIfNecessaryWithImportObject:(id)a3 error:(id *)a4;
- (BOOL)contentRecordNeedsForceAllFieldsWhenDeadInServerTruth:(BOOL)a3;
- (BOOL)hasFileIDForUpload;
- (BOOL)hasLocalContent;
- (BOOL)hasShareIDAndIsOwnedByMe;
- (BOOL)hasValidCKInfo;
- (BOOL)isAutomaticallyEvictable;
- (BOOL)isCrossZoneMoveTombstone;
- (BOOL)isDocument;
- (BOOL)isDocumentBeingCopiedToNewZone;
- (BOOL)isEvictable;
- (BOOL)isPackage;
- (BOOL)isShareableItem;
- (BOOL)isVisibleIniCloudDrive;
- (BOOL)markLatestSyncRequestAcknowledgedInZone:(id)a3;
- (BOOL)shouldBeGreedy;
- (BOOL)shouldHaveThumbnail;
- (BOOL)shouldTransferThumbnail;
- (BOOL)startDownloadInTask:(id)a3 options:(unint64_t)a4 etagIfLoser:(id)a5 stageFileName:(id)a6 error:(id *)a7;
- (BOOL)supportsServerSideAssetCopies;
- (BOOL)updateFromServerItem:(id)a3;
- (BOOL)updateWithImportObject:(id)a3 onlyContentDependentProperties:(BOOL)a4 error:(id *)a5;
- (BOOL)validateLoggingToFile:(__sFILE *)a3;
- (BRCGenerationID)generationIDForUpload;
- (BRCLocalVersion)currentVersion;
- (NSDictionary)conflictLoserState;
- (NSError)uploadError;
- (NSNumber)fileIDForUpload;
- (NSSet)resolvedConflictLoserEtags;
- (id)_initFromPQLResultSet:(id)a3 session:(id)a4 db:(id)a5 error:(id *)a6;
- (id)_initWithImportObject:(id)a3 error:(id *)a4;
- (id)_initWithLocalItem:(id)a3;
- (id)_initWithServerItem:(id)a3 dbRowID:(unint64_t)a4;
- (id)aliasItemID;
- (id)baseRecord;
- (id)baseRecordClearAllFields:(BOOL)a3;
- (id)collaborationIdentifierIfComputable;
- (id)descriptionWithContext:(id)a3;
- (id)documentRecordID;
- (id)syncContextUsedForTransfers;
- (unint64_t)diffAgainstLocalItem:(id)a3;
- (unint64_t)diffAgainstServerItem:(id)a3;
- (unsigned)downloadStatus;
- (unsigned)queryItemStatus;
- (void)_crossZoneMoveToParent:(id)a3;
- (void)_insertTombstoneForPreviousZoneGlobalID;
- (void)_markAsDeadTombstoneWithPreviousGlobalID;
- (void)_updateRecursivePropertiesInDB:(id)a3 dbRowID:(unint64_t)a4 diffs:(unint64_t)a5;
- (void)_updateUploadJobIfNeededWithDiffs:(unint64_t)a3;
- (void)addResolvedConflictLoserEtag:(id)a3;
- (void)appDidResolveConflictLoserWithEtag:(id)a3;
- (void)cancelDownloadWithEtag:(id)a3 downloadKind:(int)a4;
- (void)clearVersionSignatures:(unint64_t)a3 isPackage:(BOOL)a4;
- (void)forceVersionConflictByClearkingCKInfo;
- (void)forceiWorkConflictEtag:(id)a3;
- (void)forceiWorkSharingInfoResend;
- (void)handleUnknownItemError;
- (void)isPackage;
- (void)markCrossZoneMovedForServerAssetCopyWithParentItem:(id)a3;
- (void)markDead;
- (void)markDoneMigratingToFPFS;
- (void)markForceNeedsSyncUp;
- (void)markForceUpload;
- (void)markItemForgottenByServer;
- (void)markLatestSyncRequestRejectedInZone:(id)a3;
- (void)markNeedsReading;
- (void)markNeedsUploadOrSyncingUp;
- (void)markOverQuotaWithError:(id)a3;
- (void)markUploadedWithRecord:(id)a3;
- (void)reIngestFromFileProvider;
- (void)recoverDamagedDocumentIfNecessaryWithError:(id)a3;
- (void)shouldBeGreedy;
- (void)updateContentsCKInfoAndDeviceIDFromServerItem:(id)a3;
- (void)updateVersionMetadataFromServerItem:(id)a3 preventVersionDiffs:(BOOL)a4;
- (void)updateWithContentModificationDate:(id)a3;
- (void)updateWithLogicalName:(id)a3 newParent:(id)a4;
- (void)updateWithLogicalName:(id)a3 newParent:(id)a4 forceTopLevelShareMove:(BOOL)a5;
@end

@implementation BRCDocumentItem

- (BOOL)hasFileIDForUpload
{
  return self->_fileIDForUpload != 0;
}

- (id)aliasItemID
{
  if ([(BRCLocalItem *)self isSharedToMeTopLevelItem])
  {
    v3 = [(BRCLocalItem *)self asSharedToMeTopLevelItem];
    v4 = [v3 sharedAliasItemID];
  }
  else
  {
    v3 = [(BRCLocalItem *)self appLibrary];
    if ([v3 wasMovedToCloudDocs])
    {
      v4 = 0;
    }
    else
    {
      v5 = [BRCItemID alloc];
      v6 = [(BRCItemID *)self->super._itemID itemIDString];
      v4 = [(BRCItemID *)v5 initWithAliasUUID:v6];
    }
  }

  return v4;
}

- (NSError)uploadError
{
  v3 = [(BRCLocalItem *)self syncUpError];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = [(BRCDocumentItem *)self currentVersion];
    id v5 = [v6 uploadError];
  }
  return (NSError *)v5;
}

- (BOOL)isPackage
{
  if (![(BRCLocalItem *)self isFinderBookmark])
  {
    unsigned int v3 = [(BRCStatInfo *)self->super._st type];
    if (v3 > 8 || ((1 << v3) & 0x106) == 0)
    {
      id v5 = brc_bread_crumbs();
      v6 = brc_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        -[BRCDocumentItem isPackage]();
      }
    }
  }
  return [(BRCVersion *)self->_currentVersion isPackage];
}

- (BOOL)isDocument
{
  if (![(BRCLocalItem *)self isFinderBookmark])
  {
    unsigned int v3 = [(BRCStatInfo *)self->super._st type];
    if (v3 > 8 || ((1 << v3) & 0x106) == 0)
    {
      id v5 = brc_bread_crumbs();
      v6 = brc_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        -[BRCDocumentItem isPackage]();
      }
    }
  }
  return 1;
}

- (BOOL)isShareableItem
{
  return 1;
}

- (id)collaborationIdentifierIfComputable
{
  if ([(BRCDocumentItem *)self isShareableItem])
  {
    id v3 = objc_alloc(MEMORY[0x263EFD7E8]);
    v4 = [(BRCDocumentItem *)self asShareableItem];
    id v5 = (void *)[v3 initShareIDWithShareableItem:v4];

    v6 = [(BRCLocalItem *)self session];
    v7 = [v6 cachedCurrentUserRecordNameIfExists];
    v8 = objc_msgSend(v5, "brc_collaborationIdentifierWithCachedCurrentUserRecordName:", v7);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (BOOL)hasLocalContent
{
  return [(BRCStatInfo *)self->super._st state] == 0;
}

- (BOOL)isDocumentBeingCopiedToNewZone
{
  v2 = [(BRCLocalVersion *)self->_currentVersion previousItemGlobalID];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isCrossZoneMoveTombstone
{
  BOOL v3 = [(BRCLocalItem *)self->super._orig asDocument];
  if (![(BRCLocalItem *)self isDead]
    || [(BRCDocumentItem *)self isDocumentBeingCopiedToNewZone]
    || ([v3 isDead] & 1) != 0
    || ![v3 isDocumentBeingCopiedToNewZone])
  {
    char v7 = 0;
  }
  else
  {
    v4 = [(BRCLocalItem *)self itemGlobalID];
    id v5 = [v3 currentVersion];
    v6 = [v5 previousItemGlobalID];
    char v7 = [v4 isEqualToItemGlobalID:v6];
  }
  return v7;
}

- (BOOL)isEvictable
{
  BOOL v3 = [(BRCLocalItem *)self appLibrary];
  v4 = [v3 mangledID];
  id v5 = +[BRCUserDefaults defaultsForMangledID:v4];

  v6 = [(BRCLocalStatInfo *)self->super._st logicalName];
  char v7 = objc_msgSend(v6, "br_pathExtension");
  uint64_t v8 = [v7 lowercaseString];
  v9 = (void *)v8;
  v10 = &stru_26F3822F0;
  if (v8) {
    v10 = (__CFString *)v8;
  }
  v11 = v10;

  v12 = [v5 nonEvictableExtensions];
  char v13 = [v12 containsObject:v11];

  BOOL v14 = (v13 & 1) == 0 && [(BRCLocalItem *)self isIdleOrRejected];
  return v14;
}

+ (BOOL)isDocumentAutomaticallyEvictableWithExtension:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = +[BRCUserDefaults defaultsForMangledID:0];
  id v5 = [v4 nonEvictableExtensions];
  if (![v5 containsObject:v3])
  {
    v6 = [v4 nonAutoEvictableExtensions];
    char v7 = [v6 containsObject:v3];

    if (v7) {
      goto LABEL_4;
    }
    v9 = +[BRCUTITypeCache defaultCache];
    v10 = [v9 UTIForExtension:v3];

    if (!v10)
    {
      BOOL v8 = 1;
LABEL_27:

      goto LABEL_28;
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v11 = [v4 autoEvictableUTIs];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v26;
LABEL_8:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        if (UTTypeConformsTo(v10, *(CFStringRef *)(*((void *)&v25 + 1) + 8 * v15))) {
          break;
        }
        if (v13 == ++v15)
        {
          uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
          if (v13) {
            goto LABEL_8;
          }
          goto LABEL_14;
        }
      }
    }
    else
    {
LABEL_14:

      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      v11 = objc_msgSend(v4, "nonAutoEvictableUTIs", 0);
      uint64_t v16 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v22;
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v22 != v18) {
              objc_enumerationMutation(v11);
            }
            if (UTTypeConformsTo(v10, *(CFStringRef *)(*((void *)&v21 + 1) + 8 * i)))
            {
              BOOL v8 = 0;
              goto LABEL_26;
            }
          }
          uint64_t v17 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
          BOOL v8 = 1;
          if (v17) {
            continue;
          }
          goto LABEL_26;
        }
      }
    }
    BOOL v8 = 1;
LABEL_26:

    goto LABEL_27;
  }

LABEL_4:
  BOOL v8 = 0;
LABEL_28:

  return v8;
}

+ (BOOL)isDocumentAutomaticallyEvictableWithName:(id)a3
{
  v4 = objc_msgSend(a3, "br_pathExtension");
  id v5 = [v4 lowercaseString];

  LOBYTE(a1) = [a1 isDocumentAutomaticallyEvictableWithExtension:v5];
  return (char)a1;
}

- (BOOL)isAutomaticallyEvictable
{
  if (![(BRCDocumentItem *)self isEvictable]) {
    return 0;
  }
  if (![(BRCDocumentItem *)self hasLocalContent]) {
    return 0;
  }
  id v3 = objc_opt_class();
  v4 = [(BRCLocalStatInfo *)self->super._st logicalName];
  LODWORD(v3) = [v3 isDocumentAutomaticallyEvictableWithName:v4];

  if (!v3) {
    return 0;
  }
  id v5 = [(BRCLocalItem *)self appLibrary];
  v6 = [v5 mangledID];
  char v7 = +[BRCUserDefaults defaultsForMangledID:v6];

  uint64_t v8 = [v7 minAutomaticallyEvictableFilesize];
  BOOL v9 = [(BRCVersion *)self->_currentVersion size] >= v8;

  return v9;
}

- (BOOL)isVisibleIniCloudDrive
{
  if ([(BRCLocalItem *)self isInDocumentScope])
  {
    if ([(BRCClientZone *)self->super._clientZone isSharedZone])
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      v4 = [(BRCClientZone *)self->super._clientZone asPrivateClientZone];
      id v5 = [v4 defaultAppLibrary];

      v6 = [v5 containerMetadata];
      if ([v6 isDocumentScopePublic]) {
        int v3 = [v6 isCloudSyncTCCDisabled] ^ 1;
      }
      else {
        LOBYTE(v3) = 0;
      }
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)hasShareIDAndIsOwnedByMe
{
  BOOL v3 = [(BRCLocalItem *)self isOwnedByMe];
  if (v3) {
    return (LOBYTE(self->super._sharingOptions) >> 2) & 1;
  }
  return v3;
}

+ (BOOL)shouldDocumentBeGreedyWithName:(id)a3
{
  BOOL v3 = objc_msgSend(a3, "br_pathExtension");
  v4 = [v3 lowercaseString];

  id v5 = +[BRCUserDefaults defaultsForMangledID:0];
  v6 = [v5 nonEvictableExtensions];
  if ([v6 containsObject:v4])
  {
    char v7 = 1;
  }
  else
  {
    uint64_t v8 = [v5 shouldBeGreedyExtensions];
    char v7 = [v8 containsObject:v4];
  }
  return v7;
}

- (BOOL)shouldBeGreedy
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  BOOL v3 = [(BRCLocalItem *)self appLibrary];
  v4 = [v3 mangledID];
  id v5 = +[BRCUserDefaults defaultsForMangledID:v4];
  [v5 maximumDocumentAgeToBeGreedy];
  double v7 = v6;

  uint64_t v8 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-v7];
  [v8 timeIntervalSince1970];
  uint64_t v10 = (uint64_t)v9;

  v11 = [(BRCDocumentItem *)self currentVersion];
  uint64_t v12 = [v11 mtime];

  if (v12 >= v10)
  {
    uint64_t v16 = [(BRCLocalItem *)self appLibrary];
    char v17 = [v16 isDocumentScopePublic];

    if ((v17 & 1) == 0)
    {
      uint64_t v18 = brc_bread_crumbs();
      v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[BRCDocumentItem shouldBeGreedy]();
      }

      goto LABEL_13;
    }
    if (![(BRCLocalItem *)self isInTrashScope]
      && ![(BRCLocalItem *)self isInDataScope])
    {
      long long v22 = [(BRCLocalItem *)self appLibrary];
      int v20 = [v22 shouldEvictUploadedItems] ^ 1;

      return v20;
    }
    uint64_t v13 = brc_bread_crumbs();
    uint64_t v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[BRCDocumentItem shouldBeGreedy]();
    }
  }
  else
  {
    uint64_t v13 = brc_bread_crumbs();
    uint64_t v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = [(BRCDocumentItem *)self currentVersion];
      int v23 = 134218498;
      uint64_t v24 = [v15 mtime];
      __int16 v25 = 2048;
      uint64_t v26 = (uint64_t)(v7 / 86400.0);
      __int16 v27 = 2112;
      long long v28 = v13;
      _os_log_debug_impl(&dword_23FA42000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] don't be greedy because document is too old (mtime: %lld; max age: %lld days)%@",
        (uint8_t *)&v23,
        0x20u);
    }
  }

LABEL_13:
  LOBYTE(v20) = 0;
  return v20;
}

- (BOOL)shouldHaveThumbnail
{
  BOOL v3 = [(BRCLocalItem *)self st];
  v4 = [v3 logicalName];
  id v5 = objc_msgSend(v4, "br_pathExtension");
  uint64_t v6 = [v5 lowercaseString];
  double v7 = (void *)v6;
  uint64_t v8 = &stru_26F3822F0;
  if (v6) {
    uint64_t v8 = (__CFString *)v6;
  }
  double v9 = v8;

  uint64_t v10 = [(BRCLocalItem *)self appLibrary];
  v11 = [(id)v10 mangledID];
  uint64_t v12 = +[BRCUserDefaults defaultsForMangledID:v11];
  uint64_t v13 = [v12 blacklistedThumbnailExtensions];

  LOBYTE(v10) = [v13 containsObject:v9];
  BOOL v14 = (v10 & 1) == 0 && [(BRCLocalItem *)self isInDocumentScope];

  return v14;
}

- (BOOL)shouldTransferThumbnail
{
  if ([(BRCLocalItem *)self isFinderBookmark]
    || [(BRCDocumentItem *)self isDocumentBeingCopiedToNewZone]
    || ![(BRCDocumentItem *)self shouldHaveThumbnail])
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    BOOL v3 = [(BRCDocumentItem *)self currentVersion];
    int v4 = [v3 isSmallAndMostRecentClientsGenerateThumbnails] ^ 1;
  }
  return v4;
}

- (unsigned)queryItemStatus
{
  return [(BRCLocalItem *)self isDead];
}

- (unsigned)downloadStatus
{
  return 3;
}

- (BOOL)_isInterestingUpdateForNotifs
{
  BOOL v3 = self->super._orig;
  int v4 = [(BRCLocalItem *)v3 currentVersion];
  id v5 = [v4 uploadError];
  if (v5)
  {
  }
  else
  {
    uint64_t v10 = [(BRCLocalVersion *)self->_currentVersion uploadError];

    if (v10)
    {
LABEL_7:
      BOOL v9 = 1;
      goto LABEL_8;
    }
  }
  int v6 = [(BRCLocalItem *)v3 queryItemStatus];
  if (v6 != [(BRCDocumentItem *)self queryItemStatus]) {
    goto LABEL_7;
  }
  int v7 = [(BRCLocalItem *)v3 downloadStatus];
  if (v7 != [(BRCDocumentItem *)self downloadStatus]) {
    goto LABEL_7;
  }
  int v8 = [(BRCLocalItem *)v3 uploadStatus];
  BOOL v9 = v8 != [(BRCLocalItem *)self uploadStatus];
LABEL_8:

  return v9;
}

- (id)descriptionWithContext:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BRCDocumentItem;
  id v5 = [(BRCLocalItem *)&v12 descriptionWithContext:v4];
  int v6 = v5;
  if (self->_fileIDForUpload) {
    [v5 appendFormat:@" up-id{fid:%@, gen:%@}", self->_fileIDForUpload, self->_generationIDForUpload];
  }
  currentVersion = self->_currentVersion;
  if (currentVersion)
  {
    int v8 = [(BRCLocalVersion *)currentVersion descriptionWithContext:v4];
    [v6 appendFormat:@" ct{%@}", v8];
  }
  if ([(NSMutableSet *)self->_resolvedConflictLoserEtags count])
  {
    BOOL v9 = [(NSMutableSet *)self->_resolvedConflictLoserEtags allObjects];
    uint64_t v10 = [v9 componentsJoinedByString:@", "];
    [v6 appendFormat:@" resolved-losers:{%@}", v10];
  }
  return v6;
}

- (id)_initWithServerItem:(id)a3 dbRowID:(unint64_t)a4
{
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)BRCDocumentItem;
  id v7 = [(BRCLocalItem *)&v20 _initWithServerItem:v6 dbRowID:a4];
  if (v7)
  {
    int v8 = [v6 latestVersion];

    if (v8)
    {
      if (([v6 isDocument] & 1) == 0)
      {
        uint64_t v18 = brc_bread_crumbs();
        v19 = brc_default_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
          -[BRCDocumentItem _initWithServerItem:dbRowID:]();
        }
      }
      BOOL v9 = [BRCLocalVersion alloc];
      uint64_t v10 = [v6 latestVersion];
      uint64_t v11 = [(BRCLocalVersion *)v9 initWithVersion:v10];
      objc_super v12 = (void *)*((void *)v7 + 25);
      *((void *)v7 + 25) = v11;

      uint64_t v13 = [*((id *)v7 + 25) copy];
      uint64_t v14 = *((void *)v7 + 11);
      uint64_t v15 = *(void **)(v14 + 200);
      *(void *)(v14 + 200) = v13;
    }
    else
    {
      uint64_t v15 = brc_bread_crumbs();
      uint64_t v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        -[BRCDocumentItem _initWithServerItem:dbRowID:]((uint64_t)v6);
      }
    }
  }

  return v7;
}

- (id)_initWithLocalItem:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)BRCDocumentItem;
  id v5 = [(BRCLocalItem *)&v16 _initWithLocalItem:v4];
  if (v5)
  {
    id v6 = [v4 asDocument];
    uint64_t v7 = [v6[25] copy];
    int v8 = (void *)v5[25];
    v5[25] = v7;

    uint64_t v9 = [v6[27] copy];
    uint64_t v10 = (void *)v5[27];
    v5[27] = v9;

    uint64_t v11 = [v6[28] copy];
    objc_super v12 = (void *)v5[28];
    v5[28] = v11;

    uint64_t v13 = [v6[26] mutableCopy];
    uint64_t v14 = (void *)v5[26];
    v5[26] = v13;
  }
  return v5;
}

- (BOOL)hasValidCKInfo
{
  BOOL v3 = [(BRCLocalItem *)self isTopLevelSharedItem];
  uint64_t v4 = [(BRCVersion *)self->_currentVersion ckInfo];
  id v5 = (void *)v4;
  if (v3)
  {
    BOOL v6 = v4 != 0;
  }
  else if (v4)
  {
    uint64_t v7 = [(BRCStatInfo *)self->super._st ckInfo];
    BOOL v6 = v7 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)diffAgainstServerItem:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)BRCDocumentItem;
  unint64_t v5 = [(BRCLocalItem *)&v19 diffAgainstServerItem:v4];
  if (v4 && ([v4 isDocument] & 1) == 0)
  {
    char v17 = brc_bread_crumbs();
    uint64_t v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      -[BRCDocumentItem diffAgainstServerItem:]();
    }
  }
  if ([v4 isDocument])
  {
    if (self->_currentVersion)
    {
      BOOL v6 = [v4 latestVersion];

      if (v6)
      {
        uint64_t v7 = [v4 latestVersion];
        v5 |= [(BRCVersion *)self->_currentVersion diffAgainst:v7];
        if ([(BRCClientZone *)self->super._clientZone isSharedZone]) {
          v5 &= ~0x1000000uLL;
        }
        if ((v5 & 0x2000000) != 0)
        {
          int v8 = [(BRCVersion *)self->_currentVersion editedSinceShared];
          if ([v8 BOOLValue])
          {
            uint64_t v9 = [v7 editedSinceShared];
            int v10 = [v9 BOOLValue];

            if (!v10) {
              v5 &= ~0x2000000uLL;
            }
          }
          else
          {
          }
        }

        if ((v5 & 0x800000) != 0) {
          goto LABEL_20;
        }
LABEL_18:
        resolvedConflictLoserEtags = self->_resolvedConflictLoserEtags;
        uint64_t v14 = [v4 latestVersion];
        uint64_t v15 = [v14 conflictLoserEtags];
        LODWORD(resolvedConflictLoserEtags) = [(NSMutableSet *)resolvedConflictLoserEtags intersectsSet:v15];

        if (resolvedConflictLoserEtags) {
          v5 |= 0x800000uLL;
        }
        goto LABEL_20;
      }
      currentVersion = self->_currentVersion;
    }
    else
    {
      currentVersion = 0;
    }
    objc_super v12 = [v4 latestVersion];

    if (currentVersion != v12) {
      v5 |= 0x3FF0000uLL;
    }
    if ((v5 & 0x800000) == 0) {
      goto LABEL_18;
    }
  }
LABEL_20:

  return v5;
}

- (unint64_t)diffAgainstLocalItem:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)BRCDocumentItem;
  unint64_t v5 = [(BRCLocalItem *)&v32 diffAgainstLocalItem:v4];
  if (v4 && ([v4 isDocument] & 1) == 0)
  {
    v30 = brc_bread_crumbs();
    uint64_t v31 = brc_default_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
      -[BRCDocumentItem diffAgainstServerItem:]();
    }
  }
  if ([v4 isDocument])
  {
    BOOL v6 = [v4 asDocument];
    uint64_t v7 = v6;
    if (self->_currentVersion)
    {
      int v8 = [v6 currentVersion];

      currentVersion = self->_currentVersion;
      if (v8)
      {
        uint64_t v10 = [(BRCLocalVersion *)currentVersion diffAgainstLocalVersion:v7[25]] | v5;
        if ((v10 & 0x400000000) != 0) {
          goto LABEL_20;
        }
LABEL_13:
        fileIDForUpload = self->_fileIDForUpload;
        objc_super v12 = [v7 fileIDForUpload];
        uint64_t v13 = fileIDForUpload;
        uint64_t v14 = v12;
        uint64_t v15 = v14;
        if (v13 == v14)
        {
          int v16 = 0;
        }
        else if (v14)
        {
          int v16 = [(NSNumber *)v13 isEqual:v14] ^ 1;
        }
        else
        {
          int v16 = 1;
        }

        if (v16) {
          v10 |= 0x400000000uLL;
        }
LABEL_20:
        if ((v10 & 0x800000000) != 0)
        {
          if ((v10 & 0x800000) != 0)
          {
LABEL_38:
            if ([(BRCClientZone *)self->super._clientZone isSharedZone]) {
              unint64_t v5 = v10 & 0xFFFFFFFFFEFFFFFFLL;
            }
            else {
              unint64_t v5 = v10;
            }
            if ([(BRCLocalItem *)self isSharedToMeTopLevelItem]) {
              v5 &= ~0x40000uLL;
            }

            goto LABEL_44;
          }
        }
        else
        {
          generationIDForUpload = self->_generationIDForUpload;
          uint64_t v18 = [v7 generationIDForUpload];
          objc_super v19 = generationIDForUpload;
          objc_super v20 = v18;
          long long v21 = v20;
          if (v19 == v20)
          {
            int v22 = 0;
          }
          else if (v20)
          {
            int v22 = ![(BRCGenerationID *)v19 isEqual:v20];
          }
          else
          {
            int v22 = 1;
          }

          if (v22) {
            v10 |= 0x800000000uLL;
          }
          if ((v10 & 0x800000) != 0) {
            goto LABEL_38;
          }
        }
        resolvedConflictLoserEtags = self->_resolvedConflictLoserEtags;
        uint64_t v24 = [v7 resolvedConflictLoserEtags];
        __int16 v25 = resolvedConflictLoserEtags;
        uint64_t v26 = v24;
        __int16 v27 = v26;
        if (v25 == v26)
        {
          int v28 = 0;
        }
        else if (v26)
        {
          int v28 = [(NSMutableSet *)v25 isEqual:v26] ^ 1;
        }
        else
        {
          int v28 = 1;
        }

        if (v28) {
          v10 |= 0x800000uLL;
        }
        goto LABEL_38;
      }
    }
    else
    {
      currentVersion = 0;
    }
    if (currentVersion == (BRCLocalVersion *)v7[25]) {
      uint64_t v10 = v5;
    }
    else {
      uint64_t v10 = v5 | 0x7000003FF0000;
    }
    if ((v10 & 0x400000000) != 0) {
      goto LABEL_20;
    }
    goto LABEL_13;
  }
LABEL_44:

  return v5;
}

- (BOOL)validateLoggingToFile:(__sFILE *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BRCDocumentItem;
  unsigned int v5 = -[BRCLocalItem validateLoggingToFile:](&v8, sel_validateLoggingToFile_);
  currentVersion = self->_currentVersion;
  if (currentVersion)
  {
    if (v5) {
      LOBYTE(v5) = [(BRCVersion *)currentVersion check:self->super._itemID logToFile:a3];
    }
  }
  else if (![(BRCLocalItem *)self isDead])
  {
    fprintf(a3, "item %s is a live document without a version\n", [(BRCItemID *)self->super._itemID UTF8String]);
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)clearVersionSignatures:(unint64_t)a3 isPackage:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(BRCDocumentItem *)self isDocumentBeingCopiedToNewZone]) {
    [(BRCLocalVersion *)self->_currentVersion setUploadedAssets:0];
  }
  uint64_t v7 = brc_bread_crumbs();
  objc_super v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[BRCDocumentItem clearVersionSignatures:isPackage:]();
  }

  [(BRCLocalVersion *)self->_currentVersion _clearSignatures:a3 isPackage:v4];
}

- (id)syncContextUsedForTransfers
{
  serverZone = self->super._serverZone;
  BOOL v3 = [(BRCLocalItem *)self appLibrary];
  BOOL v4 = +[BRCSyncContext transferContextForServerZone:serverZone appLibrary:v3];

  return v4;
}

- (void)updateContentsCKInfoAndDeviceIDFromServerItem:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unsigned int v5 = [v4 latestVersion];
  BOOL v6 = [v5 ckInfo];

  uint64_t v7 = brc_bread_crumbs();
  objc_super v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = [v6 etag];
    int v22 = 138412802;
    int v23 = v13;
    __int16 v24 = 2112;
    id v25 = v4;
    __int16 v26 = 2112;
    __int16 v27 = v7;
    _os_log_debug_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] updating ct-etag:%@ from server item: %@%@", (uint8_t *)&v22, 0x20u);
  }
  if (!v4)
  {
    uint64_t v14 = brc_bread_crumbs();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[BRCDocumentItem updateContentsCKInfoAndDeviceIDFromServerItem:].cold.4();
    }
  }
  if (([v4 isDocument] & 1) == 0)
  {
    int v16 = brc_bread_crumbs();
    char v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[BRCDocumentItem updateContentsCKInfoAndDeviceIDFromServerItem:]();
    }
  }
  if ([(BRCDocumentItem *)self isDocument])
  {
    if (v6) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
  uint64_t v18 = brc_bread_crumbs();
  objc_super v19 = brc_default_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
    -[BRCDocumentItem updateContentsCKInfoAndDeviceIDFromServerItem:]();
  }

  if (!v6)
  {
LABEL_19:
    objc_super v20 = brc_bread_crumbs();
    long long v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      -[BRCDocumentItem updateContentsCKInfoAndDeviceIDFromServerItem:]();
    }
  }
LABEL_7:
  if ([(BRCDocumentItem *)self isDocumentBeingCopiedToNewZone])
  {
    uint64_t v9 = [(BRCVersion *)self->_currentVersion ckInfo];
    uint64_t v10 = [v9 etagBeforeCrossZoneMove];
    [v6 setEtagBeforeCrossZoneMove:v10];
  }
  [(BRCVersion *)self->_currentVersion setCkInfo:v6];
  uint64_t v11 = [v4 latestVersion];
  objc_super v12 = [v11 lastEditorDeviceOrUserRowID];
  [(BRCVersion *)self->_currentVersion setLastEditorDeviceOrUserRowID:v12];
}

- (void)updateVersionMetadataFromServerItem:(id)a3 preventVersionDiffs:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (([v6 isDocument] & 1) == 0)
  {
    uint64_t v29 = brc_bread_crumbs();
    v30 = brc_default_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
      -[BRCDocumentItem updateContentsCKInfoAndDeviceIDFromServerItem:]();
    }
  }
  uint64_t v7 = [v6 latestVersion];

  if (!v7)
  {
    uint64_t v31 = brc_bread_crumbs();
    objc_super v32 = brc_default_log();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
      -[BRCDocumentItem updateVersionMetadataFromServerItem:preventVersionDiffs:]();
    }
  }
  objc_super v8 = [v6 latestVersion];
  uint64_t v9 = [v8 diffAgainst:self->_currentVersion];

  if ((v9 & 0x100000) != 0)
  {
    uint64_t v13 = brc_bread_crumbs();
    isa = brc_default_log();
    if (os_log_type_enabled(isa, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v6 latestVersion];
      currentVersion = self->_currentVersion;
      int v33 = 134218754;
      uint64_t v34 = v9;
      __int16 v35 = 2112;
      v36 = v15;
      __int16 v37 = 2112;
      v38 = currentVersion;
      __int16 v39 = 2112;
      v40 = v13;
      _os_log_impl(&dword_23FA42000, isa, OS_LOG_TYPE_DEFAULT, "[WARNING] We think this is a meta only update but it isn't (%llu)!\n latest-version: %@\n current-verions: %@%@", (uint8_t *)&v33, 0x2Au);
    }
    goto LABEL_23;
  }
  uint64_t v10 = [(BRCVersion *)self->_currentVersion editedSinceShared];
  char v11 = [v10 BOOLValue];

  if (v11)
  {
    BOOL v12 = 1;
    goto LABEL_17;
  }
  if ([(BRCLocalItem *)self isSharedToMe] || [(BRCLocalItem *)self isSharedByMe])
  {
    char v17 = [(BRCVersion *)self->_currentVersion ckInfo];
    uint64_t v18 = [v17 etag];
    BOOL v12 = v18 != 0;
    if (!v18)
    {
LABEL_15:

      goto LABEL_17;
    }
    objc_super v19 = (void *)v18;
    unint64_t v20 = [(BRCDocumentItem *)self diffAgainstServerItem:v6] & 0x1A0000;

    if (v20)
    {
      char v17 = brc_bread_crumbs();
      long long v21 = brc_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[BRCDocumentItem updateVersionMetadataFromServerItem:preventVersionDiffs:]();
      }

      goto LABEL_15;
    }
  }
  BOOL v12 = 0;
LABEL_17:
  uint64_t v13 = [(BRCLocalVersion *)self->_currentVersion uploadError];
  int v22 = [BRCLocalVersion alloc];
  int v23 = [v6 latestVersion];
  __int16 v24 = [(BRCLocalVersion *)v22 initWithServerVersion:v23];
  id v25 = self->_currentVersion;
  self->_currentVersion = v24;

  if (v12) {
    [(BRCVersion *)self->_currentVersion setEditedSinceShared:MEMORY[0x263EFFA88]];
  }
  if (objc_msgSend(v13, "br_isCloudDocsErrorCode:", 43)) {
    [(BRCLocalVersion *)self->_currentVersion setUploadError:v13];
  }
  if (v4)
  {
    __int16 v26 = self->_currentVersion;
    orig = self->super._orig;
    uint64_t v28 = v26;
    isa = orig[1].super.isa;
    orig[1].super.isa = (Class)v28;
LABEL_23:
  }
}

- (void)markItemForgottenByServer
{
  v3.receiver = self;
  v3.super_class = (Class)BRCDocumentItem;
  [(BRCLocalItem *)&v3 markItemForgottenByServer];
  [(BRCVersion *)self->_currentVersion setCkInfo:0];
}

- (void)forceiWorkConflictEtag:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unsigned int v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412802;
    uint64_t v9 = self;
    __int16 v10 = 2112;
    id v11 = v4;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    _os_log_debug_impl(&dword_23FA42000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] forcing iwork conflict etag on %@ to be %@%@", (uint8_t *)&v8, 0x20u);
  }

  [(BRCDocumentItem *)self markNeedsReading];
  uint64_t v7 = [(BRCVersion *)self->_currentVersion ckInfo];
  [v7 setEtag:v4];

  self->super._localDiffs |= 0x4000000000000000uLL;
}

- (void)forceVersionConflictByClearkingCKInfo
{
}

- (void)forceiWorkSharingInfoResend
{
  self->super._localDiffs |= 0x800000000000000uLL;
  [(BRCDocumentItem *)self markNeedsReading];
}

- (void)appDidResolveConflictLoserWithEtag:(id)a3
{
  id v4 = a3;
  int v5 = [(BRCPQLConnection *)self->super._db isBatchSuspended];
  db = self->super._db;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __54__BRCDocumentItem_appDidResolveConflictLoserWithEtag___block_invoke;
  v9[3] = &unk_265080760;
  if (v5) {
    uint64_t v7 = 4;
  }
  else {
    uint64_t v7 = 20;
  }
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [(BRCPQLConnection *)db performWithFlags:v7 action:v9];
}

uint64_t __54__BRCDocumentItem_appDidResolveConflictLoserWithEtag___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 200) conflictLoserEtags];
  int v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = brc_bread_crumbs();
    int v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __54__BRCDocumentItem_appDidResolveConflictLoserWithEtag___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) addResolvedConflictLoserEtag:*(void *)(a1 + 40)];
    if (([*(id *)(a1 + 32) needsReading] & 1) == 0) {
      [*(id *)(a1 + 32) markNeedsReading];
    }
  }
  else
  {
    id v6 = brc_bread_crumbs();
    uint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __54__BRCDocumentItem_appDidResolveConflictLoserWithEtag___block_invoke_cold_2();
    }
  }
  return [*(id *)(a1 + 32) saveToDB];
}

- (void)markDead
{
  v9.receiver = self;
  v9.super_class = (Class)BRCDocumentItem;
  [(BRCLocalItem *)&v9 markDead];
  if ([(BRCDocumentItem *)self isDocumentBeingCopiedToNewZone]) {
    [(BRCDocumentItem *)self _insertTombstoneForPreviousZoneGlobalID];
  }
  int v3 = [[BRCLocalVersion alloc] initForPackage:[(BRCVersion *)self->_currentVersion isPackage]];
  id v4 = [(BRCVersion *)self->_currentVersion originalPOSIXName];
  [(BRCVersion *)v3 setOriginalPOSIXName:v4];

  int v5 = [(BRCVersion *)self->_currentVersion ckInfo];
  [(BRCVersion *)v3 setCkInfo:v5];

  currentVersion = self->_currentVersion;
  self->_currentVersion = v3;
  uint64_t v7 = v3;

  id v8 = [(BRCAccountSessionFPFS *)self->super._session fsDownloader];

  [v8 cancelAndCleanupItemDownloads:self];
}

- (void)markNeedsReading
{
  if ([(BRCDocumentItem *)self isDocumentBeingCopiedToNewZone])
  {
    [(BRCDocumentItem *)self clearVersionSignatures:0 isPackage:[(BRCVersion *)self->_currentVersion isPackage]];
    [(BRCDocumentItem *)self _insertTombstoneForPreviousZoneGlobalID];
  }
  [(BRCDocumentItem *)self markNeedsUploadOrSyncingUp];
}

- (void)markLatestSyncRequestRejectedInZone:(id)a3
{
  id v4 = a3;
  unint64_t localDiffs = self->super._localDiffs;
  if (([(BRCLocalItem *)self metadataSyncUpMask:0] & localDiffs) == 0) {
    [(BRCLocalVersion *)self->_currentVersion setUploadedAssets:0];
  }
  v10.receiver = self;
  v10.super_class = (Class)BRCDocumentItem;
  [(BRCLocalItem *)&v10 markLatestSyncRequestRejectedInZone:v4];
  if (self->super._syncUpState != 1) {
    [(BRCDocumentItem *)self markForceUpload];
  }
  if ([(BRCDocumentItem *)self isDocumentBeingCopiedToNewZone])
  {
    id v6 = [(BRCClientZone *)self->super._clientZone dbRowID];
    int v7 = objc_msgSend(v4, "br_isEqualToNumber:", v6);

    if (v7)
    {
      id v8 = brc_bread_crumbs();
      objc_super v9 = brc_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[BRCDocumentItem markLatestSyncRequestRejectedInZone:]();
      }

      [(BRCDocumentItem *)self _insertTombstoneForPreviousZoneGlobalID];
    }
  }
}

- (BOOL)markLatestSyncRequestAcknowledgedInZone:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BRCDocumentItem;
  BOOL v5 = [(BRCLocalItem *)&v12 markLatestSyncRequestAcknowledgedInZone:v4];
  if (v5)
  {
    if (([(BRCLocalItem *)self localDiffs] & 0x800000) == 0)
    {
      resolvedConflictLoserEtags = self->_resolvedConflictLoserEtags;
      self->_resolvedConflictLoserEtags = 0;
    }
    if ((self->super._localDiffs & 0x1FE0000) == 0) {
      [(BRCLocalVersion *)self->_currentVersion setUploadedAssets:0];
    }
    if ([(BRCDocumentItem *)self isDocumentBeingCopiedToNewZone])
    {
      int v7 = [(BRCClientZone *)self->super._clientZone dbRowID];
      int v8 = objc_msgSend(v4, "br_isEqualToNumber:", v7);

      if (v8)
      {
        objc_super v9 = brc_bread_crumbs();
        objc_super v10 = brc_default_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          -[BRCDocumentItem markLatestSyncRequestRejectedInZone:]();
        }

        [(BRCDocumentItem *)self _insertTombstoneForPreviousZoneGlobalID];
      }
    }
  }

  return v5;
}

- (void)handleUnknownItemError
{
  [(BRCVersion *)self->_currentVersion setCkInfo:0];
  v3.receiver = self;
  v3.super_class = (Class)BRCDocumentItem;
  [(BRCLocalItem *)&v3 handleUnknownItemError];
}

- (void)markForceUpload
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  memset(v7, 0, sizeof(v7));
  __brc_create_section(0, (uint64_t)"-[BRCDocumentItem markForceUpload]", 1193, v7);
  objc_super v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = v7[0];
    id v6 = [(BRCLocalItem *)self itemID];
    *(_DWORD *)buf = 134218498;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    __int16 v12 = 2112;
    uint64_t v13 = v3;
    _os_log_debug_impl(&dword_23FA42000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx marking force upload: %@%@", buf, 0x20u);
  }
  if ([(BRCDocumentItem *)self hasFileIDForUpload]
    || [(BRCDocumentItem *)self isDocumentBeingCopiedToNewZone])
  {
    [(BRCDocumentItem *)self clearVersionSignatures:3 isPackage:[(BRCVersion *)self->_currentVersion isPackage]];
    [(BRCDocumentItem *)self markNeedsUploadOrSyncingUp];
  }
  else
  {
    [(BRCDocumentItem *)self reIngestFromFileProvider];
  }
  __brc_leave_section(v7);
}

- (void)markForceNeedsSyncUp
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  memset(v8, 0, sizeof(v8));
  __brc_create_section(0, (uint64_t)"-[BRCDocumentItem markForceNeedsSyncUp]", 1213, v8);
  objc_super v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = v8[0];
    id v6 = [(BRCLocalItem *)self itemID];
    *(_DWORD *)buf = 134218498;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    __int16 v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v3;
    _os_log_debug_impl(&dword_23FA42000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx marking force needs-syncup: %@%@", buf, 0x20u);
  }
  self->super._localDiffs |= 0x20000uLL;
  v7.receiver = self;
  v7.super_class = (Class)BRCDocumentItem;
  [(BRCLocalItem *)&v7 markForceNeedsSyncUp];
  __brc_leave_section(v8);
}

- (void)markUploadedWithRecord:(id)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v4 = a3;
  memset(v46, 0, sizeof(v46));
  __brc_create_section(0, (uint64_t)"-[BRCDocumentItem markUploadedWithRecord:]", 1231, v46);
  uint64_t v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v29 = v46[0];
    v30 = [(BRCLocalItem *)self itemID];
    *(_DWORD *)buf = 134218498;
    v48 = (BRCDocumentItem *)v29;
    __int16 v49 = 2112;
    int64_t v50 = (int64_t)v30;
    __int16 v51 = 2112;
    v52 = v5;
    _os_log_debug_impl(&dword_23FA42000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx marking uploaded %@%@", buf, 0x20u);
  }
  if (self->super._syncUpState == 3)
  {
    if (!v4)
    {
      int v33 = brc_bread_crumbs();
      uint64_t v34 = brc_default_log();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
        -[BRCDocumentItem markUploadedWithRecord:].cold.9();
      }
    }
    BOOL v7 = [(BRCLocalItem *)self isFinderBookmark];
    int v8 = kBRRecordKeyFinderBookmarkContent;
    if (!v7) {
      int v8 = kBRRecordKeyFileContent;
    }
    uint64_t v9 = [v4 objectForKeyedSubscript:*v8];
    uint64_t v10 = [v4 objectForKeyedSubscript:@"pkgSignature"];
    __int16 v11 = [v4 objectForKeyedSubscript:@"thumb1024"];
    if (v9)
    {
      __int16 v12 = [v9 signature];
    }
    else
    {
      __int16 v12 = v10;
    }
    __int16 v13 = v12;
    v45 = [v11 signature];
    if (v9)
    {
      if (self->_currentVersion)
      {
        if ([v9 isRereferencedAssetUpload]) {
          goto LABEL_14;
        }
        uint64_t v14 = [v9 size];
        if (v14 == [(BRCVersion *)self->_currentVersion size]) {
          goto LABEL_14;
        }
        __int16 v26 = brc_bread_crumbs();
        __int16 v27 = brc_default_log();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        {
          uint64_t v31 = [v9 size];
          int64_t v32 = [(BRCVersion *)self->_currentVersion size];
          *(_DWORD *)buf = 134218498;
          v48 = (BRCDocumentItem *)v31;
          __int16 v49 = 2048;
          int64_t v50 = v32;
          __int16 v51 = 2112;
          v52 = v26;
          _os_log_fault_impl(&dword_23FA42000, v27, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: CK disagrees on the item size: %lld != %lld%@", buf, 0x20u);
        }
      }
      else
      {
        __int16 v26 = brc_bread_crumbs();
        __int16 v27 = brc_default_log();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        {
          uint64_t v28 = [(BRCLocalItem *)self itemID];
          -[BRCDocumentItem markUploadedWithRecord:](v28, (uint64_t)v26, (uint64_t)buf, v27);
        }
      }

      [(BRCDocumentItem *)self markNeedsReading];
LABEL_36:

      goto LABEL_37;
    }
LABEL_14:
    uint64_t v15 = brc_bread_crumbs();
    int v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v48 = self;
      __int16 v49 = 2112;
      int64_t v50 = (int64_t)v13;
      __int16 v51 = 2112;
      v52 = v15;
      _os_log_debug_impl(&dword_23FA42000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] marking uploaded %@, signature:%@%@", buf, 0x20u);
    }

    if ((v9 != 0) == (v10 != 0))
    {
      __int16 v35 = brc_bread_crumbs();
      v36 = brc_default_log();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
        -[BRCDocumentItem markUploadedWithRecord:].cold.8();
      }
    }
    if (!v13)
    {
      __int16 v37 = brc_bread_crumbs();
      v38 = brc_default_log();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT)) {
        -[BRCDocumentItem markUploadedWithRecord:].cold.7();
      }
    }
    currentVersion = self->_currentVersion;
    if (!currentVersion)
    {
      __int16 v39 = brc_bread_crumbs();
      v40 = brc_default_log();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
        -[BRCDocumentItem markUploadedWithRecord:].cold.6();
      }

      currentVersion = self->_currentVersion;
    }
    uint64_t v18 = [(BRCVersion *)currentVersion contentSignature];
    if ((objc_msgSend(v18, "brc_signatureIsPendingPlaceHolder") & 1) == 0)
    {
      BOOL v19 = [(BRCDocumentItem *)self isDocumentBeingCopiedToNewZone];

      if (v19)
      {
LABEL_22:
        unint64_t v20 = [(BRCVersion *)self->_currentVersion thumbnailSignature];
        if ((objc_msgSend(v20, "brc_signatureIsPendingPlaceHolder") & 1) == 0)
        {
          BOOL v21 = [(BRCDocumentItem *)self isDocumentBeingCopiedToNewZone];

          if (v21) {
            goto LABEL_25;
          }
          unint64_t v20 = brc_bread_crumbs();
          v44 = brc_default_log();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT)) {
            -[BRCDocumentItem markUploadedWithRecord:].cold.4();
          }
        }
LABEL_25:
        int v22 = [(BRCLocalVersion *)self->_currentVersion uploadedAssets];
        BOOL v23 = v22 == 0;

        if (!v23)
        {
          uint64_t v41 = brc_bread_crumbs();
          v42 = brc_default_log();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT)) {
            -[BRCDocumentItem markUploadedWithRecord:]();
          }
        }
        [(BRCLocalVersion *)self->_currentVersion setUploadError:0];
        [(BRCVersion *)self->_currentVersion setContentSignature:v13];
        [(BRCLocalVersion *)self->_currentVersion setUploadedAssets:v4];
        [(BRCVersion *)self->_currentVersion setThumbnailSignature:v45];
        -[BRCVersion setThumbnailSize:](self->_currentVersion, "setThumbnailSize:", [v11 size]);
        [(BRCLocalItem *)self _markNeedsSyncingUp];
        if (![(BRCLocalItem *)self needsSyncUp]) {
          [(BRCLocalVersion *)self->_currentVersion setUploadedAssets:0];
        }
        __int16 v24 = brc_bread_crumbs();
        id v25 = brc_default_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          -[BRCDocumentItem markUploadedWithRecord:]((uint64_t)self);
        }

        goto LABEL_36;
      }
      uint64_t v18 = brc_bread_crumbs();
      v43 = brc_default_log();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT)) {
        -[BRCDocumentItem markUploadedWithRecord:].cold.5();
      }
    }
    goto LABEL_22;
  }
  uint64_t v9 = brc_bread_crumbs();
  uint64_t v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
    -[BRCDocumentItem markUploadedWithRecord:]0();
  }
LABEL_37:

  __brc_leave_section(v46);
}

- (void)markNeedsUploadOrSyncingUp
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: self.needsUpload%@", v2, v3, v4, v5, v6);
}

- (void)markOverQuotaWithError:(id)a3
{
  currentVersion = self->_currentVersion;
  id v5 = a3;
  [(BRCLocalVersion *)currentVersion _clearSignatures:3 isPackage:[(BRCVersion *)currentVersion isPackage]];
  self->super._syncUpState = 3;
  [(BRCLocalVersion *)self->_currentVersion setUploadError:v5];
}

- (void)_markAsDeadTombstoneWithPreviousGlobalID
{
  uint64_t v3 = [(BRCLocalVersion *)self->_currentVersion previousItemGlobalID];
  [(BRCLocalVersion *)self->_currentVersion setPreviousItemGlobalID:0];
  uint64_t v4 = [(BRCVersion *)self->_currentVersion ckInfo];
  [v4 revertEtagsForOldZoneTombstone];

  v5.receiver = self;
  v5.super_class = (Class)BRCDocumentItem;
  [(BRCLocalItem *)&v5 _markAsDeadTombstoneWithPreviousGlobalID:v3];
}

- (void)_insertTombstoneForPreviousZoneGlobalID
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (([(BRCPQLConnection *)self->super._db isBatchSuspended] & 1) == 0)
  {
    uint64_t v14 = brc_bread_crumbs();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem createSyncUpJob].cold.7();
    }
  }
  uint64_t v3 = (void *)[(BRCDocumentItem *)self copy];
  [v3 _markAsDeadTombstoneWithPreviousGlobalID];
  [v3 markNeedsUploadOrSyncingUp];
  uint64_t v4 = [v3 clientZone];
  objc_super v5 = [v3 itemID];
  int v6 = [v4 existsByItemID:v5];

  if (v6)
  {
    BOOL v7 = brc_bread_crumbs();
    int v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [v3 itemGlobalID];
      int v16 = 138412546;
      char v17 = v9;
      __int16 v18 = 2112;
      BOOL v19 = v7;
      _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] Not inserting dead tombstone because the item was already revived for %@%@", (uint8_t *)&v16, 0x16u);
    }
  }
  else
  {
    [v3 saveToDB];
  }
  uint64_t v10 = [(BRCAccountSessionFPFS *)self->super._session applyScheduler];
  __int16 v11 = [v3 serverZone];
  [v10 rescheduleSuspendedJobsMatching:v11 inState:17];

  [(BRCLocalVersion *)self->_currentVersion setPreviousItemGlobalID:0];
  __int16 v12 = [(BRCStatInfo *)self->super._st ckInfo];
  [v12 clearCrossZoneMoveEtag];

  __int16 v13 = [(BRCVersion *)self->_currentVersion ckInfo];
  [v13 clearCrossZoneMoveEtag];
}

- (BOOL)supportsServerSideAssetCopies
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  unint64_t localDiffs = self->super._localDiffs;
  if ((localDiffs & 0x180000) == 0)
  {
    uint64_t v4 = [(BRCVersion *)self->_currentVersion contentSignature];
    char v5 = objc_msgSend(v4, "brc_signatureIsValid");

    if (v5)
    {
      int v6 = [(BRCClientZone *)self->super._clientZone mangledID];
      BOOL v7 = +[BRCUserDefaults defaultsForMangledID:v6];

      LOBYTE(v6) = [v7 supportsServerSideAssetCopies];
      return (char)v6;
    }
    unint64_t localDiffs = self->super._localDiffs;
  }
  uint64_t v9 = [(BRCVersion *)self->_currentVersion contentSignature];

  uint64_t v10 = [(BRCVersion *)self->_currentVersion contentSignature];
  uint64_t v11 = objc_msgSend(v10, "brc_signatureIsValid");

  __int16 v12 = brc_bread_crumbs();
  __int16 v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    BOOL v14 = v9 != 0;
    uint64_t v15 = [NSNumber numberWithBool:(localDiffs & 0x180000) != 0];
    int v16 = [NSNumber numberWithBool:v14];
    char v17 = [NSNumber numberWithBool:v11];
    int v18 = 138413314;
    BOOL v19 = v15;
    __int16 v20 = 2112;
    BOOL v21 = v16;
    __int16 v22 = 2112;
    BOOL v23 = v17;
    __int16 v24 = 2112;
    id v25 = self;
    __int16 v26 = 2112;
    __int16 v27 = v12;
    _os_log_debug_impl(&dword_23FA42000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] skip supportsServerSideAssetCopies: has local diffs [%@], content signature [%@] valid [%@] --> NO\n item: %@%@", (uint8_t *)&v18, 0x34u);
  }
  return 0;
}

- (void)markCrossZoneMovedForServerAssetCopyWithParentItem:(id)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    v45 = brc_bread_crumbs();
    v46 = brc_default_log();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT)) {
      -[BRCDocumentItem markCrossZoneMovedForServerAssetCopyWithParentItem:]();
    }
  }
  if (![(BRCDocumentItem *)self supportsServerSideAssetCopies])
  {
    v47 = brc_bread_crumbs();
    v48 = brc_default_log();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT)) {
      -[BRCDocumentItem markCrossZoneMovedForServerAssetCopyWithParentItem:]();
    }
  }
  uint64_t v51 = [(BRCLocalItem *)self itemGlobalID];
  char v5 = [v4 itemGlobalID];
  session = self->super._session;
  BOOL v7 = [v5 zoneRowID];
  int v8 = [(BRCAccountSessionFPFS *)session serverZoneByRowID:v7];
  uint64_t v9 = [v8 clientZone];

  uint64_t v10 = [(BRCLocalVersion *)self->_currentVersion previousItemGlobalID];
  uint64_t v11 = [v5 itemID];
  [(BRCStatInfo *)self->super._st setParentID:v11];

  int64_t v50 = v5;
  __int16 v12 = [v5 zoneRowID];
  parentZoneRowID = self->super._parentZoneRowID;
  self->super._parentZoneRowID = v12;

  objc_storeStrong((id *)&self->super._clientZone, v9);
  self->super._serverZone = (BRCServerZone *)(id)[v9 serverZone];
  self->super._orig->_syncUpState = 0;
  if (v10)
  {
    BOOL v14 = [v10 zoneRowID];
    uint64_t v15 = [v9 dbRowID];
    int v16 = objc_msgSend(v14, "br_isEqualToNumber:", v15);

    if (v16)
    {
      char v17 = [v10 itemID];
      int v18 = [v9 serverItemByItemID:v17];

      BOOL v19 = brc_bread_crumbs();
      __int16 v20 = brc_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v53 = self;
        __int16 v54 = 2112;
        id v55 = v18;
        __int16 v56 = 2112;
        v57 = v19;
        _os_log_impl(&dword_23FA42000, v20, OS_LOG_TYPE_DEFAULT, "[WARNING] Item moved back into its original zone %@ si: %@%@", buf, 0x20u);
      }

      [(BRCLocalVersion *)self->_currentVersion setPreviousItemGlobalID:0];
      BOOL v21 = [(BRCAccountSessionFPFS *)self->super._session syncUpScheduler];
      uint64_t v22 = [v21 inFlightDiffsForItem:self];

      if (v22)
      {
        id v49 = v4;
        brc_bread_crumbs();
        BOOL v23 = (BRCDocumentItem *)objc_claimAutoreleasedReturnValue();
        __int16 v24 = brc_default_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v53 = v23;
          _os_log_impl(&dword_23FA42000, v24, OS_LOG_TYPE_DEFAULT, "[WARNING] Item has in-flight diffs in the current zone. We need to be sure to insert a tombstone%@", buf, 0xCu);
        }

        id v25 = (void *)[(BRCDocumentItem *)self copy];
        __int16 v26 = [v25 currentVersion];
        __int16 v27 = [v26 ckInfo];
        [v27 clearCrossZoneMoveEtag];

        uint64_t v28 = [v25 st];
        uint64_t v29 = [v28 ckInfo];
        [v29 clearCrossZoneMoveEtag];

        v30 = [(BRCLocalItem *)self->super._orig itemGlobalID];
        [v25 _restorePreviousGlobalID:v30];

        [v25 markDead];
        [v25 markNeedsUploadOrSyncingUp];
        id v4 = v49;
      }
      else
      {
        id v25 = 0;
      }
      uint64_t v41 = [(BRCStatInfo *)self->super._st ckInfo];
      [v41 revertEtagsForOldZoneTombstone];

      v42 = [(BRCVersion *)self->_currentVersion ckInfo];
      [v42 revertEtagsForOldZoneTombstone];

      v43 = [v10 itemID];
      [(BRCLocalItem *)self learnItemID:v43 serverItem:v18];

      [(BRCDocumentItem *)self markNeedsUploadOrSyncingUp];
      v40 = v25;
      int v33 = (void *)v51;
      if (!v22) {
        goto LABEL_21;
      }
LABEL_20:
      [(BRCLocalItem *)self saveToDB];
      [v25 saveToDB];
      v40 = v25;
      goto LABEL_21;
    }
    __int16 v35 = brc_bread_crumbs();
    v36 = brc_default_log();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v53 = self;
      __int16 v54 = 2112;
      id v55 = v35;
      _os_log_impl(&dword_23FA42000, v36, OS_LOG_TYPE_DEFAULT, "[WARNING] Item already has a previous zone so ignore the existing zone for %@%@", buf, 0x16u);
    }

    int v33 = (void *)v51;
  }
  else
  {
    uint64_t v31 = brc_bread_crumbs();
    int64_t v32 = brc_default_log();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v53 = self;
      __int16 v54 = 2112;
      id v55 = v9;
      __int16 v56 = 2112;
      v57 = v31;
      _os_log_impl(&dword_23FA42000, v32, OS_LOG_TYPE_DEFAULT, "[WARNING] Item %@ moved into new zone which supports server side asset copies %@%@", buf, 0x20u);
    }

    int v33 = (void *)v51;
    [(BRCLocalVersion *)self->_currentVersion setPreviousItemGlobalID:v51];
    uint64_t v34 = [(BRCStatInfo *)self->super._st ckInfo];
    [v34 markCrossZoneMoved];

    __int16 v35 = [(BRCVersion *)self->_currentVersion ckInfo];
    [v35 markCrossZoneMoved];
  }

  __int16 v37 = objc_opt_new();
  [(BRCLocalItem *)self learnItemID:v37 serverItem:0];

  self->super._sharingOptions = [v4 sharingOptions] & 0x78;
  v38 = brc_bread_crumbs();
  __int16 v39 = brc_default_log();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
  {
    BRCPrettyPrintBitmap();
    v44 = (BRCDocumentItem *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    uint64_t v53 = v44;
    __int16 v54 = 2112;
    id v55 = v4;
    __int16 v56 = 2112;
    v57 = v38;
    _os_log_debug_impl(&dword_23FA42000, v39, OS_LOG_TYPE_DEBUG, "[DEBUG] learning sharing options %@ from parent %@%@", buf, 0x20u);
  }
  [(BRCDocumentItem *)self markNeedsUploadOrSyncingUp];
  id v25 = 0;
  v40 = 0;
  if (!v10) {
    goto LABEL_20;
  }
LABEL_21:
}

- (void)_crossZoneMoveToParent:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [(BRCLocalItem *)self clientZone];
  int v6 = [v5 enhancedDrivePrivacyEnabled];
  BOOL v7 = [v4 clientZone];
  int v8 = v6 ^ [v7 enhancedDrivePrivacyEnabled];

  if (![(BRCDocumentItem *)self supportsServerSideAssetCopies] || (v8 & 1) != 0)
  {
    if ((self->super._localDiffs & 0x180000) == 0)
    {
      uint64_t v9 = [(BRCVersion *)self->_currentVersion contentSignature];
      int v10 = objc_msgSend(v9, "brc_signatureIsValid");

      if (((v10 ^ 1 | v8) & 1) == 0)
      {
        uint64_t v11 = brc_bread_crumbs();
        __int16 v12 = brc_default_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
          -[BRCDocumentItem _crossZoneMoveToParent:]();
        }
      }
    }
    __int16 v13 = brc_bread_crumbs();
    BOOL v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[BRCDocumentItem _crossZoneMoveToParent:]((uint64_t)self);
    }

    uint64_t v15 = (void *)[(BRCDocumentItem *)self copy];
    [v15 markDead];
    int v16 = [v15 itemGlobalID];
    [v15 _restorePreviousGlobalID:v16];

    [v15 markNeedsUploadOrSyncingUp];
    char v17 = [v4 itemGlobalID];
    session = self->super._session;
    BOOL v19 = [v17 zoneRowID];
    __int16 v20 = [(BRCAccountSessionFPFS *)session serverZoneByRowID:v19];
    BOOL v21 = [v20 clientZone];

    uint64_t v22 = [v17 itemID];
    [(BRCStatInfo *)self->super._st setParentID:v22];

    BOOL v23 = [v17 zoneRowID];
    parentZoneRowID = self->super._parentZoneRowID;
    self->super._parentZoneRowID = v23;

    objc_storeStrong((id *)&self->super._clientZone, v21);
    self->super._serverZone = (BRCServerZone *)(id)[v21 serverZone];
    self->super._orig->_syncUpState = 0;
    id v25 = objc_opt_new();
    [(BRCLocalItem *)self learnItemID:v25 serverItem:0];

    [(BRCDocumentItem *)self markItemForgottenByServer];
    self->super._sharingOptions = [v4 sharingOptions] & 0x78;
    __int16 v26 = brc_bread_crumbs();
    __int16 v27 = brc_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      v30 = BRCPrettyPrintBitmap();
      *(_DWORD *)buf = 138412802;
      uint64_t v34 = v30;
      __int16 v35 = 2112;
      id v36 = v4;
      __int16 v37 = 2112;
      v38 = v26;
      _os_log_debug_impl(&dword_23FA42000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] learning sharing options %@ from parent %@%@", buf, 0x20u);
    }
    [(BRCDocumentItem *)self markForceUpload];
    db = self->super._db;
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __42__BRCDocumentItem__crossZoneMoveToParent___block_invoke;
    v31[3] = &unk_265080760;
    v31[4] = self;
    id v32 = v15;
    id v29 = v15;
    [(BRCPQLConnection *)db groupInTransaction:v31];
  }
  else
  {
    [(BRCDocumentItem *)self markCrossZoneMovedForServerAssetCopyWithParentItem:v4];
  }
}

uint64_t __42__BRCDocumentItem__crossZoneMoveToParent___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) saveToDB];
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 40);
    return [v3 saveToDB];
  }
  return result;
}

- (BOOL)contentRecordNeedsForceAllFieldsWhenDeadInServerTruth:(BOOL)a3
{
  if (a3 || (self->super._localDiffs & 0x900000) != 0) {
    return 1;
  }
  id v4 = [(BRCVersion *)self->_currentVersion ckInfo];
  char v5 = [v4 etag];
  BOOL v3 = v5 == 0;

  return v3;
}

- (NSDictionary)conflictLoserState
{
  v7[1] = *MEMORY[0x263EF8340];
  BOOL v3 = (void *)[(NSMutableSet *)self->_resolvedConflictLoserEtags count];
  if (v3)
  {
    resolvedConflictLoserEtags = self->_resolvedConflictLoserEtags;
    int v6 = @"r";
    v7[0] = resolvedConflictLoserEtags;
    BOOL v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  }
  return (NSDictionary *)v3;
}

- (void)addResolvedConflictLoserEtag:(id)a3
{
  resolvedConflictLoserEtags = self->_resolvedConflictLoserEtags;
  if (resolvedConflictLoserEtags)
  {
    uint64_t v9 = (NSMutableSet *)a3;
    [(NSMutableSet *)resolvedConflictLoserEtags addObject:v9];
    id v4 = v9;
  }
  else
  {
    int v6 = (objc_class *)MEMORY[0x263EFF9C0];
    id v7 = a3;
    int v8 = (NSMutableSet *)objc_msgSend([v6 alloc], "initWithObjects:", v7, 0);

    id v4 = self->_resolvedConflictLoserEtags;
    self->_resolvedConflictLoserEtags = v8;
  }
}

- (void)_updateUploadJobIfNeededWithDiffs:(unint64_t)a3
{
  if (self->super._syncUpState == 3)
  {
    if ([(BRCLocalVersion *)self->_currentVersion shouldRecreateUploadJobGivenDiffs:a3]|| (clientZone = self->super._clientZone, [(BRCLocalItem *)self->super._orig clientZone], int v6 = objc_claimAutoreleasedReturnValue(), LOBYTE(clientZone) = [(BRCClientZone *)clientZone isEqualToClientZone:v6], v6, (clientZone & 1) == 0))
    {
      id v7 = [(BRCAccountSessionFPFS *)self->super._session fsUploader];
      [v7 cancelAndCleanupItemUpload:self];

LABEL_7:
      memset(v24, 0, sizeof(v24));
      __brc_create_section(0, (uint64_t)"-[BRCDocumentItem _updateUploadJobIfNeededWithDiffs:]", 1668, v24);
      int v8 = brc_bread_crumbs();
      uint64_t v9 = brc_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[BRCDocumentItem _updateUploadJobIfNeededWithDiffs:]();
      }

      if (([(BRCPQLConnection *)self->super._db isBatchSuspended] & 1) == 0)
      {
        __int16 v20 = brc_bread_crumbs();
        BOOL v21 = brc_default_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
          -[BRCLocalItem createSyncUpJob].cold.7();
        }
      }
      int v10 = [(BRCAccountSessionFPFS *)self->super._session syncUpScheduler];
      uint64_t v11 = [(BRCLocalItem *)self serverZone];
      __int16 v12 = [v11 dbRowID];
      int v13 = [v10 isItemInSyncUpAndInFlight:self inZone:v12];

      unsigned int syncUpState = self->super._syncUpState;
      if (syncUpState == 3)
      {
        if ([(BRCLocalItem *)self isDead])
        {
          uint64_t v22 = brc_bread_crumbs();
          BOOL v23 = brc_default_log();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
            -[BRCDocumentItem _updateUploadJobIfNeededWithDiffs:]();
          }
        }
        [(BRCAccountSessionFPFS *)self->super._session fsUploader];
        if (v13) {
          generationIDForUpload = {;
        }
          [generationIDForUpload setState:31 forItem:self];
        }
        else {
          generationIDForUpload = {;
        }
          [generationIDForUpload uploadItem:self];
        }
      }
      else if (syncUpState == 4)
      {
        generationIDForUpload = [(BRCAccountSessionFPFS *)self->super._session fsUploader];
        [generationIDForUpload setState:31 forItem:self];
      }
      else
      {
        int v16 = [(BRCAccountSessionFPFS *)self->super._session fsUploader];
        [v16 cancelAndCleanupItemUpload:self];

        if (!self->_fileIDForUpload || [(BRCLocalItem *)self isMigratingToFPFS]) {
          goto LABEL_21;
        }
        char v17 = [(BRCAccountSessionFPFS *)self->super._session stageRegistry];
        int v18 = [(BRCLocalItem *)self liveStageFilename];
        [v17 unlinkLiveStageFilename:v18];

        fileIDForUpload = self->_fileIDForUpload;
        self->_fileIDForUpload = 0;

        generationIDForUpload = self->_generationIDForUpload;
        self->_generationIDForUpload = 0;
      }

LABEL_21:
      __brc_leave_section(v24);
      return;
    }
  }
  if ((a3 & 0x20000000000000) != 0) {
    goto LABEL_7;
  }
}

- (BOOL)_nukePackageItemsFromDB:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = objc_msgSend(v4, "execute:", @"DELETE FROM client_pkg_upload_items WHERE item_rowid = %llu", self->super._dbRowID);
  if (v5 && [v4 changes] >= 1)
  {
    int v6 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = [v4 changes];
      unint64_t dbRowID = self->super._dbRowID;
      *(_DWORD *)buf = 134218498;
      uint64_t v14 = v9;
      __int16 v15 = 2048;
      unint64_t v16 = dbRowID;
      __int16 v17 = 2112;
      int v18 = v6;
      _os_log_debug_impl(&dword_23FA42000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] removed %lld items in pkg [%llu]%@", buf, 0x20u);
    }

    if (([(BRCPQLConnection *)self->super._db isBatchSuspended] & 1) == 0)
    {
      uint64_t v11 = brc_bread_crumbs();
      __int16 v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[BRCLocalItem createSyncUpJob].cold.7();
      }
    }
  }

  return v5;
}

- (void)_updateRecursivePropertiesInDB:(id)a3 dbRowID:(unint64_t)a4 diffs:(unint64_t)a5
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (([v7 isBatchSuspended] & 1) == 0)
  {
    v42 = brc_bread_crumbs();
    v43 = brc_default_log();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT)) {
      -[BRCDocumentItem _updateRecursivePropertiesInDB:dbRowID:diffs:]();
    }
  }
  int v8 = [(BRCLocalItem *)self->super._orig asDocument];
  if ((self->super._sharingOptions & 4) != 0
    || ([(BRCLocalItem *)self->super._orig sharingOptions] & 4) != 0)
  {
    uint64_t v9 = 1073741826;
  }
  else
  {
    uint64_t v9 = 2;
  }
  if (((v9 & 0xFFFFFFFFFFFFLL | 0x22000000000000) & a5) != 0
    || ([(BRCLocalItem *)self->super._orig clientZone],
        int v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 isEqualToClientZone:self->super._clientZone],
        v10,
        (v11 & 1) == 0))
  {
    if ([(BRCLocalItem *)self needsUpload])
    {
      __int16 v12 = [(BRCDocumentItem *)self currentVersion];
      uint64_t v13 = [v12 size];

      uint64_t v14 = 1;
    }
    else
    {
      uint64_t v14 = 0;
      uint64_t v13 = 0;
    }
    BOOL v15 = [(BRCLocalItem *)self needsSyncUp];
    BOOL v16 = [(BRCLocalItem *)self->super._orig needsUpload];
    if (v16 != [(BRCLocalItem *)self needsUpload]
      && [(BRCLocalItem *)self->super._orig needsUpload]
      && [(BRCLocalItem *)self needsSyncUp])
    {
      __int16 v17 = [v8 currentVersion];
      uint64_t v18 = [v17 size];
    }
    else
    {
      uint64_t v18 = 0;
    }
    BOOL v19 = [(BRCLocalItem *)self->super._orig needsSyncUp];
    if (v19 == [(BRCLocalItem *)self needsSyncUp]) {
      uint64_t v20 = 0;
    }
    else {
      uint64_t v20 = [(BRCLocalItem *)self->super._orig needsSyncUp];
    }
    BOOL v50 = v15;
    BOOL v21 = [(BRCDocumentItem *)self uploadError];
    unsigned int v22 = objc_msgSend(v21, "brc_isCloudKitOutOfQuota");

    uint64_t v23 = v22;
    if ((self->super._sharingOptions & 4) != 0)
    {
      BOOL v24 = [(BRCServerZone *)self->super._serverZone isSharedZone];
      BOOL v48 = !v24;
      BOOL v47 = v24;
    }
    else
    {
      BOOL v47 = 0;
      BOOL v48 = 0;
    }
    uint64_t v51 = v8;
    BOOL v44 = [(BRCLocalItem *)self isAlmostDead];
    if (v13) {
      uint64_t v25 = 1;
    }
    else {
      uint64_t v25 = v14;
    }
    __int16 v26 = brc_bread_crumbs();
    __int16 v27 = brc_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      itemID = self->super._itemID;
      *(_DWORD *)buf = 138414338;
      __int16 v54 = itemID;
      __int16 v55 = 2048;
      uint64_t v56 = v23;
      __int16 v57 = 2048;
      uint64_t v58 = v25;
      __int16 v59 = 2048;
      uint64_t v60 = v13;
      __int16 v61 = 2048;
      BOOL v62 = v18 != 0;
      __int16 v63 = 2048;
      uint64_t v64 = v18;
      __int16 v65 = 2048;
      BOOL v66 = v50;
      __int16 v67 = 2048;
      uint64_t v68 = v20;
      __int16 v69 = 2112;
      v70 = v26;
      _os_log_debug_impl(&dword_23FA42000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] updating recursive properties starting from document %@:\n quota:    %lld\n upload:   {needs:(count:%lld size:%lld) done:(count:%lld size:%lld)}\n sync-up:  {needs:%lld done:%lld}\n%@", buf, 0x5Cu);
    }
    uint64_t v45 = v25;
    BOOL v46 = v18 != 0;
    uint64_t v49 = v18;
    uint64_t v28 = v13;

    int v29 = [(BRCStatInfo *)self->super._st type];
    if (v29 == 8 || v29 == 2) {
      int v31 = 1;
    }
    else {
      int v31 = v29;
    }
    if (v31 == 7) {
      int v32 = 6;
    }
    else {
      int v32 = v31;
    }
    int v33 = [(BRCStatInfo *)self->super._st parentID];
    uint64_t v34 = self->super._itemID;
    __int16 v35 = [(BRCClientZone *)self->super._clientZone dbRowID];
    id v36 = [(BRCLocalItem *)self parentClientZone];
    __int16 v37 = [v36 dbRowID];
    char v38 = [v7 execute:@"INSERT OR IGNORE INTO item_recursive_properties (item_rowid, item_parent_id, item_id, zone_rowid, item_type, item_parent_zone_rowid) VALUES  (%lld, %@, %@, %@, %d, %@)", a4, v33, v34, v35, v32, v37];

    if ((v38 & 1) == 0)
    {
      uint64_t v39 = brc_bread_crumbs();
      v40 = brc_default_log();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
        -[BRCDocumentItem _updateRecursivePropertiesInDB:dbRowID:diffs:]();
      }
      int v8 = v51;
      goto LABEL_43;
    }
    int v8 = v51;
    if (([v7 execute:@"UPDATE item_recursive_properties SET  dir_faults_count = %lld, uploaded_size = %lld, needs_upload_size = %lld, uploaded_count = %lld, needs_upload_count = %lld, synced_up_count = %lld, needs_sync_up_count = %lld, over_quota_count = %lld, shared_by_me_count = %lld, shared_to_me_count = %lld, needs_delete_doc_count = %lld  WHERE item_rowid = %llu ", 0, v49, v28, v46, v45, v20, v50, v23, v48, v47, v44, a4] & 1) == 0)
    {
      uint64_t v39 = brc_bread_crumbs();
      v40 = brc_default_log();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
        -[BRCDocumentItem _updateRecursivePropertiesInDB:dbRowID:diffs:]();
      }
LABEL_43:
    }
  }
}

- (BOOL)_insertInDB:(id)a3 dbRowID:(unint64_t)a4
{
  id v71 = a3;
  v70 = [(BRCClientZone *)self->super._clientZone dbRowID];
  itemID = self->super._itemID;
  ownerKey = self->super._ownerKey;
  unint64_t sharingOptions = self->super._sharingOptions;
  sideCarCKInfo = self->super._sideCarCKInfo;
  parentZoneRowID = self->super._parentZoneRowID;
  unint64_t localDiffs = self->super._localDiffs;
  unint64_t notifsRank = self->super._notifsRank;
  uint64_t syncUpState = self->super._syncUpState;
  uint64_t v53 = [(BRCLocalItem *)self appLibrary];
  __int16 v69 = [v53 dbRowID];
  minimumSupportedOSRowID = self->super._minimumSupportedOSRowID;
  BOOL isUserVisible = self->super._isUserVisible;
  BOOL v66 = [(BRCStatInfo *)self->super._st ckInfo];
  int v41 = [(BRCStatInfo *)self->super._st state];
  int v40 = [(BRCStatInfo *)self->super._st type];
  int v39 = [(BRCStatInfo *)self->super._st mode];
  int64_t v38 = [(BRCStatInfo *)self->super._st birthtime];
  int64_t v37 = [(BRCStatInfo *)self->super._st lastUsedTime];
  int64_t v36 = [(BRCStatInfo *)self->super._st favoriteRank];
  uint64_t v68 = [(BRCStatInfo *)self->super._st parentID];
  st = self->super._st;
  logicalName = (__CFString *)st->super._logicalName;
  if (!logicalName) {
    logicalName = &stru_26F3822F0;
  }
  __int16 v35 = logicalName;
  BOOL v34 = [(BRCStatInfo *)st isHiddenExt];
  __int16 v65 = [(BRCStatInfo *)self->super._st finderTags];
  __int16 v67 = [(BRCStatInfo *)self->super._st xattrSignature];
  uint64_t v64 = [(BRCStatInfo *)self->super._st trashPutBackPath];
  __int16 v63 = [(BRCStatInfo *)self->super._st trashPutBackParentID];
  BOOL v62 = [(BRCStatInfo *)self->super._st aliasTarget];
  __int16 v59 = [(BRCStatInfo *)self->super._st creatorRowID];
  __int16 v61 = [(BRCLocalStatInfo *)self->super._st processingStamp];
  uint64_t v60 = [(BRCLocalStatInfo *)self->super._st rawBouncedLogicalName];
  unsigned int v29 = [(BRCLocalStatInfo *)self->super._st itemScope];
  unint64_t v33 = [(BRCLocalStatInfo *)self->super._st localChangeCount];
  uint64_t v56 = [(BRCLocalStatInfo *)self->super._st oldVersionIdentifier];
  __int16 v57 = [(BRCLocalStatInfo *)self->super._st fpCreationItemIdentifier];
  uint64_t v58 = [(BRCVersion *)self->_currentVersion originalPOSIXName];
  __int16 v55 = [(BRCVersion *)self->_currentVersion ckInfo];
  int64_t v25 = [(BRCVersion *)self->_currentVersion mtime];
  int64_t v23 = [(BRCVersion *)self->_currentVersion size];
  int64_t v21 = [(BRCVersion *)self->_currentVersion thumbnailSize];
  int v32 = [(BRCVersion *)self->_currentVersion thumbnailSignature];
  uint64_t v18 = [(BRCVersion *)self->_currentVersion contentSignature];
  v30 = [(BRCVersion *)self->_currentVersion xattrSignature];
  uint64_t v28 = [(BRCVersion *)self->_currentVersion editedSinceShared];
  __int16 v27 = [(BRCVersion *)self->_currentVersion lastEditorDeviceOrUserRowID];
  __int16 v17 = [(BRCVersion *)self->_currentVersion conflictLoserEtags];
  BOOL v24 = [(BRCVersion *)self->_currentVersion quarantineInfo];
  uint64_t v20 = [(BRCLocalVersion *)self->_currentVersion uploadedAssets];
  int v31 = [(BRCLocalVersion *)self->_currentVersion uploadError];
  BOOL v19 = objc_msgSend(v31, "brc_strippedError");
  __int16 v26 = [(BRCLocalVersion *)self->_currentVersion previousItemGlobalID];
  id v7 = [v26 itemID];
  unsigned int v22 = [(BRCLocalVersion *)self->_currentVersion previousItemGlobalID];
  BOOL v16 = [v22 zoneRowID];
  unint64_t v8 = [(BRCLocalVersion *)self->_currentVersion localChangeCount];
  BOOL v15 = [(BRCLocalVersion *)self->_currentVersion oldVersionIdentifier];
  uint64_t v14 = [(BRCDocumentItem *)self conflictLoserState];
  uint64_t v13 = [(BRCDocumentItem *)self fileIDForUpload];
  uint64_t v9 = [(BRCDocumentItem *)self generationIDForUpload];
  int v52 = objc_msgSend(v71, "execute:", @"INSERT INTO client_items(rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation) VALUES(%lld, %@, %@, %@, %ld, %@, %@, %d, %lld, %lld, %@, %@, %d, %@, %d, %d, %d, %lld, %lld, %lld, %@, %@, %d, %@, %@, %@, %@, %@, %@, %@, %@, %d, %llu, %@, %@, %@, %@, %lld, %lld, %lld, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %llu, %@, %@, %@, %@)", a4, v70, itemID, ownerKey, sharingOptions, sideCarCKInfo, parentZoneRowID, syncUpState, localDiffs, notifsRank, v69, minimumSupportedOSRowID, isUserVisible, v66, v41, v40,
          v39,
          v38,
          v37,
          v36,
          v68,
          v35,
          v34,
          v65,
          v67,
          v64,
          v63,
          v62,
          v59,
          v61,
          v60,
          v29,
          v33,
          v56,
          v57,
          v58,
          v55,
          v25,
          v23,
          v21,
          v32,
          v18,
          v30,
          v28,
          v27,
          v17,
          v24,
          v20,
          v19,
          v7,
          v16,
          v8,
          v15,
          v14,
          v13,
          v9);

  if (v52
    && (v72.receiver = self,
        v72.super_class = (Class)BRCDocumentItem,
        [(BRCLocalItem *)&v72 _insertInDB:v71 dbRowID:a4]))
  {
    [(BRCDocumentItem *)self _updateUploadJobIfNeededWithDiffs:0xFF003FF3FF7FFFLL];
    int v10 = [(BRCAccountSessionFPFS *)self->super._session globalProgress];
    [v10 didUpdateDocument:self];

    [(BRCDocumentItem *)self _updateRecursivePropertiesInDB:v71 dbRowID:a4 diffs:0xFF003FF3FF7FFFLL];
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)_updateInDB:(id)a3 diffs:(unint64_t)a4
{
  uint64_t v115 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ((a4 & 0x100000000) != 0 && [(BRCLocalItem *)self isDead]) {
    [(BRCDocumentItem *)self _nukePackageItemsFromDB:v6];
  }
  v107 = v6;
  if ([(BRCDocumentItem *)self isDocumentBeingCopiedToNewZone]
    || [(BRCLocalItem *)self->super._orig isDocumentBeingCopiedToNewZone])
  {
    clientZone = self->super._clientZone;
    unint64_t v8 = [(BRCLocalItem *)self->super._orig clientZone];
    LOBYTE(clientZone) = [(BRCClientZone *)clientZone isEqualToClientZone:v8];

    if ((clientZone & 1) == 0)
    {
      uint64_t v9 = brc_bread_crumbs();
      int v10 = brc_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[BRCDocumentItem _updateInDB:diffs:]();
      }

      BOOL v11 = [BRCItemDBRowIDAndZoneJobIdentifier alloc];
      unint64_t dbRowID = self->super._dbRowID;
      uint64_t v13 = [(BRCLocalItem *)self->super._orig clientZone];
      uint64_t v14 = [v13 dbRowID];
      BOOL v15 = [(BRCItemDBRowIDAndZoneJobIdentifier *)v11 initWithItemDBRowID:dbRowID zoneRowID:v14];

      BOOL v16 = [(BRCAccountSessionFPFS *)self->super._session fsDownloader];
      [v16 deleteJobsMatching:v15];

      __int16 v17 = [(BRCAccountSessionFPFS *)self->super._session fsUploader];
      [v17 deleteJobsMatching:v15];
    }
  }
  [(BRCDocumentItem *)self _updateUploadJobIfNeededWithDiffs:a4];
  unint64_t v51 = a4;
  if ((a4 & 0x2010000) != 0)
  {
    uint64_t v18 = [(BRCVersion *)self->_currentVersion conflictLoserEtags];
    uint64_t v19 = [v18 count];

    if (v19)
    {
      uint64_t v20 = [(BRCAccountSessionFPFS *)self->super._session fsDownloader];
      [v20 rescheduleJobsPendingWinnerForItem:self];
    }
  }
  v106 = [(BRCClientZone *)self->super._clientZone dbRowID];
  itemID = self->super._itemID;
  ownerKey = self->super._ownerKey;
  unint64_t sharingOptions = self->super._sharingOptions;
  sideCarCKInfo = self->super._sideCarCKInfo;
  parentZoneRowID = self->super._parentZoneRowID;
  unint64_t localDiffs = self->super._localDiffs;
  unint64_t notifsRank = self->super._notifsRank;
  uint64_t syncUpState = self->super._syncUpState;
  v89 = [(BRCLocalItem *)self appLibrary];
  v105 = [v89 dbRowID];
  minimumSupportedOSRowID = self->super._minimumSupportedOSRowID;
  BOOL isUserVisible = self->super._isUserVisible;
  v104 = [(BRCStatInfo *)self->super._st ckInfo];
  int v77 = [(BRCStatInfo *)self->super._st state];
  int v76 = [(BRCStatInfo *)self->super._st type];
  int v75 = [(BRCStatInfo *)self->super._st mode];
  int64_t v74 = [(BRCStatInfo *)self->super._st birthtime];
  int64_t v73 = [(BRCStatInfo *)self->super._st lastUsedTime];
  int64_t v70 = [(BRCStatInfo *)self->super._st favoriteRank];
  v96 = [(BRCStatInfo *)self->super._st parentID];
  st = self->super._st;
  logicalName = (__CFString *)st->super._logicalName;
  if (!logicalName) {
    logicalName = &stru_26F3822F0;
  }
  objc_super v72 = logicalName;
  BOOL v71 = [(BRCStatInfo *)st isHiddenExt];
  v102 = [(BRCStatInfo *)self->super._st finderTags];
  v101 = [(BRCStatInfo *)self->super._st xattrSignature];
  v99 = [(BRCStatInfo *)self->super._st trashPutBackPath];
  v103 = [(BRCStatInfo *)self->super._st trashPutBackParentID];
  v100 = [(BRCStatInfo *)self->super._st aliasTarget];
  v98 = [(BRCStatInfo *)self->super._st creatorRowID];
  v97 = [(BRCLocalStatInfo *)self->super._st processingStamp];
  v93 = [(BRCLocalStatInfo *)self->super._st rawBouncedLogicalName];
  unsigned int v68 = [(BRCLocalStatInfo *)self->super._st itemScope];
  unint64_t v69 = [(BRCLocalStatInfo *)self->super._st localChangeCount];
  v95 = [(BRCLocalStatInfo *)self->super._st oldVersionIdentifier];
  v91 = [(BRCLocalStatInfo *)self->super._st fpCreationItemIdentifier];
  v94 = [(BRCVersion *)self->_currentVersion originalPOSIXName];
  v92 = [(BRCVersion *)self->_currentVersion ckInfo];
  int64_t v62 = [(BRCVersion *)self->_currentVersion mtime];
  int64_t v61 = [(BRCVersion *)self->_currentVersion size];
  int64_t v59 = [(BRCVersion *)self->_currentVersion thumbnailSize];
  uint64_t v56 = [(BRCVersion *)self->_currentVersion thumbnailSignature];
  __int16 v67 = [(BRCVersion *)self->_currentVersion contentSignature];
  v90 = [(BRCVersion *)self->_currentVersion xattrSignature];
  __int16 v65 = [(BRCVersion *)self->_currentVersion editedSinceShared];
  __int16 v55 = [(BRCVersion *)self->_currentVersion lastEditorDeviceOrUserRowID];
  __int16 v54 = [(BRCVersion *)self->_currentVersion conflictLoserEtags];
  __int16 v63 = [(BRCVersion *)self->_currentVersion quarantineInfo];
  uint64_t v58 = [(BRCLocalVersion *)self->_currentVersion uploadedAssets];
  BOOL v66 = [(BRCLocalVersion *)self->_currentVersion uploadError];
  __int16 v57 = objc_msgSend(v66, "brc_strippedError");
  uint64_t v64 = [(BRCLocalVersion *)self->_currentVersion previousItemGlobalID];
  int64_t v23 = [v64 itemID];
  uint64_t v60 = [(BRCLocalVersion *)self->_currentVersion previousItemGlobalID];
  BOOL v24 = [v60 zoneRowID];
  unint64_t v25 = [(BRCLocalVersion *)self->_currentVersion localChangeCount];
  uint64_t v53 = [(BRCLocalVersion *)self->_currentVersion oldVersionIdentifier];
  __int16 v26 = [(BRCDocumentItem *)self conflictLoserState];
  __int16 v27 = [(BRCDocumentItem *)self fileIDForUpload];
  int v52 = [(BRCDocumentItem *)self generationIDForUpload];
  int v88 = objc_msgSend(v107, "execute:", @"UPDATE client_items SET  zone_rowid = %@, item_id = %@, item_creator_id = %@, item_sharing_options = %ld, item_side_car_ckinfo = %@, item_parent_zone_rowid = %@, item_localsyncupstate = %d, item_local_diffs = %llu, item_notifs_rank = %lld, app_library_rowid = %@, item_min_supported_os_rowid = %@, item_user_visible = %d, item_stat_ckinfo = %@, item_state = %d, item_type = %d, item_mode = %d, item_birthtime = %lld, item_lastusedtime = %lld, item_favoriterank = %lld, item_parent_id = %@, item_filename = %@, item_hidden_ext = %d, item_finder_tags = %@, item_xattr_signature = %@, item_trash_put_back_path = %@, item_trash_put_back_parent_id = %@, item_alias_target = %@, item_creator = %@, item_processing_stamp = %@, item_bouncedname = %@, item_scope = %d,item_local_change_count = %llu, item_old_version_identifier = %@,fp_creation_item_identifier = %@, version_name = %@, version_ckinfo = %@, version_mtime = %lld, version_size = %lld, version_thumb_size = %lld, version_thumb_signature = %@, version_content_signature = %@, version_xattr_signature = %@, version_edited_since_shared = %@, version_device = %@, version_conflict_loser_etags = %@, version_quarantine_info = %@, version_uploaded_assets = %@, version_upload_error = %@, version_old_zone_item_id = %@, version_old_zone_rowid = %@, version_local_change_count = %llu, version_old_version_identifier = %@, item_live_conflict_loser_etags = %@, item_file_id = %@, item_generation = %@  WHERE rowid = %llu", v106, itemID, ownerKey, sharingOptions, sideCarCKInfo, parentZoneRowID, syncUpState, localDiffs, notifsRank, v105, minimumSupportedOSRowID, isUserVisible, v104, v77, v76, v75,
          v74,
          v73,
          v70,
          v96,
          v72,
          v71,
          v102,
          v101,
          v99,
          v103,
          v100,
          v98,
          v97,
          v93,
          v68,
          v69,
          v95,
          v91,
          v94,
          v92,
          v62,
          v61,
          v59,
          v56,
          v67,
          v90,
          v65,
          v55,
          v54,
          v63,
          v58,
          v57,
          v23,
          v24,
          v25,
          v53,
          v26,
          v27,
          v52,
          self->super._dbRowID);

  if (v88)
  {
    unint64_t v28 = v51;
    [(BRCDocumentItem *)self _updateRecursivePropertiesInDB:v107 dbRowID:self->super._dbRowID diffs:v51];
    if ((v51 & 0x100000) != 0)
    {
      unsigned int v29 = [(BRCAccountSessionFPFS *)self->super._session fsDownloader];
      [v29 cancelAndCleanupItemDownload:self kind:0 etag:0 andNotifyDownloadTrackers:1 cancelReason:1];
    }
    if ((v51 & 0x80000000) != 0)
    {
      v30 = [(BRCAccountSessionFPFS *)self->super._session applyScheduler];
      int v31 = [(BRCLocalItem *)self unsaltedBookmarkData];
      int v32 = (void *)[v107 fetch:@"SELECT zone_rowid, item_rank FROM server_items WHERE item_alias_target = %@ AND item_type = 3", v31];

      if ([v32 next])
      {
        do
        {
          unint64_t v33 = [v32 numberAtIndex:0];
          BOOL v34 = [(BRCAccountSessionFPFS *)self->super._session serverZoneByRowID:v33];
          uint64_t v35 = [v32 longLongAtIndex:1];
          int64_t v36 = brc_bread_crumbs();
          int64_t v37 = brc_default_log();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          {
            int64_t v38 = [v34 zoneName];
            *(_DWORD *)buf = 134218498;
            uint64_t v110 = v35;
            __int16 v111 = 2112;
            v112 = v38;
            __int16 v113 = 2112;
            v114 = v36;
            _os_log_debug_impl(&dword_23FA42000, v37, OS_LOG_TYPE_DEBUG, "[DEBUG] Apply Changes[%lld]: Rescheduling reverse-alias in %@%@", buf, 0x20u);
          }
          [v30 setState:1 andApplyKind:1 forRank:v35 zoneRowID:v33];
        }
        while (([v32 next] & 1) != 0);
      }

      unint64_t v28 = v51;
    }
    [(BRCDocumentItem *)self _updateReadThrottleIfNeededForRowID:self->super._dbRowID forCreation:0];
    int v41 = [(BRCLocalItem *)self session];
    v42 = [v41 globalProgress];
    [v42 didUpdateDocument:self];

    v43 = [(BRCLocalVersion *)self->_currentVersion uploadError];
    BOOL v44 = [(BRCLocalItem *)self->super._orig asDocument];
    uint64_t v45 = [v44 currentVersion];
    BOOL v46 = [v45 uploadError];
    BOOL v47 = [(BRCDocumentItem *)self _needsSyncBubbleRecomputeForError:v43 origError:v46];

    if (v47) {
      [(BRCClientZone *)self->super._clientZone recomputeAllItemsDidUploadState];
    }
    orig = self->super._orig;
    int v40 = v107;
    if (orig && ![(BRCLocalItem *)orig isOnDisk] && [(BRCLocalItem *)self isOnDisk])
    {
      uint64_t v49 = [(BRCAccountSessionFPFS *)self->super._session applyScheduler];
      [v49 rescheduleMissingTargetAliasesWithTarget:self];
    }
    v108.receiver = self;
    v108.super_class = (Class)BRCDocumentItem;
    BOOL v39 = [(BRCLocalItem *)&v108 _updateInDB:v107 diffs:v28];
  }
  else
  {
    BOOL v39 = 0;
    int v40 = v107;
  }

  return v39;
}

- (BOOL)_needsSyncBubbleRecomputeForError:(id)a3 origError:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5
    || (objc_msgSend(v5, "brc_isEverRetriable") & 1) != 0
    || v6 && (objc_msgSend(v6, "brc_isEverRetriable") & 1) == 0)
  {
    unint64_t v8 = +[BRCAccountsManager sharedManager];
    [v8 retrySyncBubbleLaterIfNeededWithError:v5];

    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (BOOL)_deleteFromDB:(id)a3 keepAliases:(BOOL)a4
{
  uint64_t v4 = a4;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([(BRCDocumentItem *)self _nukePackageItemsFromDB:v6])
  {
    if (self->super._dbRowID)
    {
      BOOL v7 = [(BRCLocalItem *)self session];
      unint64_t v8 = [v7 globalProgress];
      [v8 didDeleteDocument:self];

      uint64_t v9 = [(BRCLocalItem *)self clientZone];
      int v10 = [(BRCLocalItem *)self itemID];
      BOOL v11 = [v9 popOnDiskBlockForItemID:v10];

      if (v11) {
        v11[2](v11, 0);
      }
      __int16 v12 = [(BRCLocalItem *)self clientZone];
      uint64_t v13 = [(BRCLocalItem *)self itemID];
      uint64_t v14 = [v12 popDownloadedBlockForItemID:v13];

      if (v14) {
        ((void (**)(void, BRCDocumentItem *))v14)[2](v14, self);
      }
      if ([(BRCLocalItem *)self->super._orig isDocumentBeingCopiedToNewZone])
      {
        unsigned int v29 = [(BRCLocalItem *)self clientZone];
        BOOL v15 = [v29 dbRowID];
        [(BRCLocalItem *)self->super._orig asDocument];
        BOOL v16 = v31 = v4;
        [v16 currentVersion];
        v30 = v14;
        v18 = __int16 v17 = v11;
        uint64_t v19 = [v18 previousItemGlobalID];
        uint64_t v20 = [v19 zoneRowID];
        char v21 = objc_msgSend(v15, "br_isEqualToNumber:", v20);

        BOOL v11 = v17;
        uint64_t v14 = v30;

        uint64_t v4 = v31;
        if ((v21 & 1) == 0)
        {
          unsigned int v22 = brc_bread_crumbs();
          int64_t v23 = brc_default_log();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            BOOL v34 = v22;
            _os_log_impl(&dword_23FA42000, v23, OS_LOG_TYPE_DEFAULT, "[WARNING] Deleted item was copied from another zone, insert tombstone in the old zone%@", buf, 0xCu);
          }

          BOOL v24 = [(BRCLocalItem *)self->super._orig asDocument];
          [v24 _insertTombstoneForPreviousZoneGlobalID];
        }
      }
      unint64_t v25 = [(BRCAccountSessionFPFS *)self->super._session fsDownloader];
      [v25 deleteDownloadingJobForItem:self];

      __int16 v26 = [(BRCAccountSessionFPFS *)self->super._session fsUploader];
      [v26 deleteUploadingJobForItem:self];

      v32.receiver = self;
      v32.super_class = (Class)BRCDocumentItem;
      BOOL v27 = [(BRCLocalItem *)&v32 _deleteFromDB:v6 keepAliases:v4];
    }
    else
    {
      BOOL v27 = 1;
    }
  }
  else
  {
    BOOL v27 = 0;
  }

  return v27;
}

- (BOOL)startDownloadInTask:(id)a3 options:(unint64_t)a4 etagIfLoser:(id)a5 stageFileName:(id)a6 error:(id *)a7
{
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)BRCDocumentItem;
  if ([(BRCLocalItem *)&v22 startDownloadInTask:a3 options:a4 etagIfLoser:v12 stageFileName:v13 error:a7])
  {
    db = self->super._db;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __79__BRCDocumentItem_startDownloadInTask_options_etagIfLoser_stageFileName_error___block_invoke;
    v17[3] = &unk_265081AD0;
    v17[4] = self;
    unint64_t v20 = a4;
    id v18 = v12;
    id v19 = v13;
    char v21 = a7;
    char v15 = [(BRCPQLConnection *)db groupInTransaction:v17];
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

uint64_t __79__BRCDocumentItem_startDownloadInTask_options_etagIfLoser_stageFileName_error___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 8) fsDownloader];
  uint64_t v3 = [v2 scheduleContentDownloadForItem:a1[4] serverItem:0 options:a1[7] etagIfLoser:a1[5] stageFileName:a1[6] error:a1[8]];

  return v3;
}

- (BRCLocalVersion)currentVersion
{
  return self->_currentVersion;
}

- (NSSet)resolvedConflictLoserEtags
{
  return &self->_resolvedConflictLoserEtags->super;
}

- (NSNumber)fileIDForUpload
{
  return self->_fileIDForUpload;
}

- (BRCGenerationID)generationIDForUpload
{
  return self->_generationIDForUpload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generationIDForUpload, 0);
  objc_storeStrong((id *)&self->_fileIDForUpload, 0);
  objc_storeStrong((id *)&self->_resolvedConflictLoserEtags, 0);
  objc_storeStrong((id *)&self->_currentVersion, 0);
}

- (id)documentRecordID
{
  itemID = self->super._itemID;
  uint64_t v3 = [(BRCServerZone *)self->super._serverZone zoneID];
  uint64_t v4 = [(BRCItemID *)itemID contentsRecordIDInZoneID:v3];

  return v4;
}

- (id)baseRecord
{
  return [(BRCDocumentItem *)self baseRecordClearAllFields:0];
}

- (id)baseRecordClearAllFields:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(BRCLocalItem *)self isFinderBookmark];
  id v6 = @"content";
  if (v5) {
    id v6 = @"structure";
  }
  BOOL v7 = (objc_class *)MEMORY[0x263EFD7C8];
  unint64_t v8 = v6;
  id v9 = [v7 alloc];
  int v10 = [(BRCDocumentItem *)self documentRecordID];
  BOOL v11 = (void *)[v9 initWithRecordType:v8 recordID:v10];

  if (v3)
  {
    [v11 setObject:0 forKeyedSubscript:@"fileContent"];
    [v11 setObject:0 forKeyedSubscript:@"bookmarkContent"];
    [v11 setObject:0 forKeyedSubscript:@"pkgSignature"];
    [v11 setObject:0 forKeyedSubscript:@"pkgContent"];
    [v11 setObject:0 forKeyedSubscript:@"pkgXattrs"];
    [v11 setObject:0 forKeyedSubscript:@"pkgManifest"];
    [v11 setObject:0 forKeyedSubscript:@"pkgSignature"];
    [v11 setObject:0 forKeyedSubscript:@"thumb1024"];
    [v11 setObject:0 forKeyedSubscript:@"thumbQLMetadata"];
  }
  return v11;
}

- (id)_initFromPQLResultSet:(id)a3 session:(id)a4 db:(id)a5 error:(id *)a6
{
  id v10 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BRCDocumentItem;
  id v11 = [(BRCLocalItem *)&v25 _initFromPQLResultSet:v10 session:a4 db:a5 error:a6];
  if (v11)
  {
    id v12 = [[BRCLocalVersion alloc] initFromResultSet:v10 pos:35];
    id v13 = (void *)*((void *)v11 + 25);
    *((void *)v11 + 25) = v12;

    if ([*((id *)v11 + 9) isExecutable]
      && ([v11 isDead] & 1) == 0
      && [*((id *)v11 + 25) isPackage])
    {
      *(unsigned char *)(*((void *)v11 + 9) + 26) &= ~2u;
    }
    if (_allowedClassesForEtags_once != -1) {
      dispatch_once(&_allowedClassesForEtags_once, &__block_literal_global_47);
    }
    id v14 = (id)_allowedClassesForEtags_allowedClasses;
    char v15 = [v10 unarchivedObjectOfClasses:v14 atIndex:53];

    if (!v15
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      BOOL v16 = [v15 objectForKeyedSubscript:@"r"];
      uint64_t v17 = [v16 mutableCopy];
      id v18 = (void *)*((void *)v11 + 26);
      *((void *)v11 + 26) = v17;
    }
    else
    {
      id v18 = brc_bread_crumbs();
      BOOL v24 = brc_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        -[BRCDocumentItem(BRCFPFSAdditions) _initFromPQLResultSet:session:db:error:]((uint64_t)v15);
      }

      BOOL v16 = v15;
      char v15 = 0;
    }

    uint64_t v19 = [v10 numberAtIndex:54];
    unint64_t v20 = (void *)*((void *)v11 + 27);
    *((void *)v11 + 27) = v19;

    uint64_t v21 = [v10 objectOfClass:objc_opt_class() atIndex:55];
    objc_super v22 = (void *)*((void *)v11 + 28);
    *((void *)v11 + 28) = v21;
  }
  return v11;
}

- (id)_initWithImportObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BRCDocumentItem;
  BOOL v7 = [(BRCLocalItem *)&v15 _initWithImportObject:v6 error:a4];
  if (v7)
  {
    unint64_t v8 = [[BRCLocalVersion alloc] initWithImportObject:v6];
    id v9 = (void *)v7[25];
    v7[25] = v8;

    if ([v7 _updatePackageItemsIfNecessaryWithImportObject:v6 error:a4])
    {
      uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v6, "fileID"));
      id v11 = (void *)v7[27];
      v7[27] = v10;

      uint64_t v12 = [v6 generationID];
      id v13 = (void *)v7[28];
      v7[28] = v12;
    }
    else
    {
      id v13 = v7;
      BOOL v7 = 0;
    }
  }
  return v7;
}

- (void)updateWithContentModificationDate:(id)a3
{
  [a3 timeIntervalSince1970];
  currentVersion = self->_currentVersion;
  [(BRCVersion *)currentVersion setMtime:(uint64_t)v4];
}

- (BOOL)_updatePackageItemsIfNecessaryWithImportObject:(id)a3 error:(id *)a4
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v43 = a3;
  if (![(BRCLocalItem *)self needsInsert]
    && ![(BRCLocalItem *)self isIdleOrRejected]
    && ![(BRCPQLConnection *)self->super._db execute:@"DELETE FROM client_pkg_upload_items WHERE item_rowid = %llu", self->super._dbRowID])
  {
    BOOL v39 = [(BRCPQLConnection *)self->super._db lastError];
    if (v39)
    {
      objc_super v32 = brc_bread_crumbs();
      unint64_t v33 = brc_default_log();
      if (os_log_type_enabled(v33, (os_log_type_t)0x90u))
      {
        int64_t v37 = "(passed to caller)";
        *(_DWORD *)int64_t v59 = 136315906;
        *(void *)&v59[4] = "-[BRCDocumentItem(BRCFPFSAdditions) _updatePackageItemsIfNecessaryWithImportObject:error:]";
        *(_WORD *)&v59[12] = 2080;
        if (!a4) {
          int64_t v37 = "(ignored by caller)";
        }
        *(void *)&v59[14] = v37;
        *(_WORD *)&v59[22] = 2112;
        uint64_t v60 = v39;
        LOWORD(v61) = 2112;
        *(void *)((char *)&v61 + 2) = v32;
        _os_log_error_impl(&dword_23FA42000, v33, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", v59, 0x2Au);
      }
    }
    if (!a4) {
      goto LABEL_39;
    }
    int v40 = v39;
    BOOL v27 = 0;
    *a4 = v40;

    goto LABEL_47;
  }
  if (![v43 isPackageRoot])
  {
    BOOL v27 = 1;
    goto LABEL_47;
  }
  BOOL v39 = [MEMORY[0x263F08850] defaultManager];
  *(void *)int64_t v59 = 0;
  *(void *)&v59[8] = v59;
  *(void *)&v59[16] = 0x3032000000;
  uint64_t v60 = __Block_byref_object_copy__37;
  *(void *)&long long v61 = __Block_byref_object_dispose__37;
  *((void *)&v61 + 1) = 0;
  BOOL v5 = [v43 fileURL];
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __90__BRCDocumentItem_BRCFPFSAdditions___updatePackageItemsIfNecessaryWithImportObject_error___block_invoke;
  v49[3] = &unk_265080670;
  v49[4] = v59;
  id v6 = [v39 enumeratorAtURL:v5 includingPropertiesForKeys:0 options:0 errorHandler:v49];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v45 objects:v58 count:16];
  if (!v7)
  {

    uint64_t v42 = 0;
    goto LABEL_33;
  }
  id v8 = 0;
  uint64_t v42 = 0;
  uint64_t v9 = *(void *)v46;
  do
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v46 != v9) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(void **)(*((void *)&v45 + 1) + 8 * v10);
      uint64_t v12 = (void *)MEMORY[0x2455D97F0]();
      id v13 = [BRCPackageItem alloc];
      id v14 = [v43 fileURL];
      id v44 = v8;
      objc_super v15 = [(BRCPackageItem *)v13 initWithURL:v11 inPackage:v14 forItem:self error:&v44];
      id v16 = v44;

      if (v15)
      {
        if ([(BRCPackageItem *)v15 saveToDBWithSession:self->super._session])
        {
          int v17 = 0;
          v42 += [(BRCPackageItem *)v15 size];
LABEL_23:
          id v8 = v16;
          goto LABEL_24;
        }
        uint64_t v21 = [(BRCAccountSessionFPFS *)self->super._session clientDB];
        id v8 = [v21 lastError];

        brc_bread_crumbs();
        objc_super v22 = (char *)objc_claimAutoreleasedReturnValue();
        int64_t v23 = brc_default_log();
        if (os_log_type_enabled(v23, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = 138412546;
          unint64_t v51 = (const char *)v8;
          __int16 v52 = 2112;
          uint64_t v53 = v22;
          _os_log_error_impl(&dword_23FA42000, v23, (os_log_type_t)0x90u, "[ERROR] Failed saving package item to db - %@%@", buf, 0x16u);
        }

        int v17 = 6;
      }
      else
      {
        if (!objc_msgSend(v16, "br_isCloudDocsErrorCode:", 43))
        {
          BOOL v24 = brc_bread_crumbs();
          objc_super v25 = brc_default_log();
          if (os_log_type_enabled(v25, (os_log_type_t)0x90u))
          {
            __int16 v26 = [v11 path];
            *(_DWORD *)buf = 138412802;
            unint64_t v51 = v26;
            __int16 v52 = 2112;
            uint64_t v53 = (const char *)v16;
            __int16 v54 = 2112;
            id v55 = v24;
            _os_log_error_impl(&dword_23FA42000, v25, (os_log_type_t)0x90u, "[ERROR] Couldn't create import item for %@ - %@%@", buf, 0x20u);
          }
          int v17 = 6;
          goto LABEL_23;
        }
        brc_bread_crumbs();
        id v18 = (char *)objc_claimAutoreleasedReturnValue();
        uint64_t v19 = brc_default_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v20 = [v11 path];
          *(_DWORD *)buf = 138412546;
          unint64_t v51 = v20;
          __int16 v52 = 2112;
          uint64_t v53 = v18;
          _os_log_impl(&dword_23FA42000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] Ignoring excluded package item from sync %@%@", buf, 0x16u);
        }
        id v8 = 0;
        int v17 = 7;
      }
LABEL_24:

      if (v17 != 7 && v17) {
        goto LABEL_28;
      }
      ++v10;
    }
    while (v7 != v10);
    uint64_t v7 = [obj countByEnumeratingWithState:&v45 objects:v58 count:16];
  }
  while (v7);
LABEL_28:

  if (v8)
  {
    if (a4)
    {
      id v8 = v8;
      *a4 = v8;
    }
    goto LABEL_38;
  }
LABEL_33:
  unint64_t v28 = *(void **)(*(void *)&v59[8] + 40);
  if (v28)
  {
    id v29 = v28;
    v30 = brc_bread_crumbs();
    unsigned int v31 = brc_default_log();
    if (os_log_type_enabled(v31, (os_log_type_t)0x90u))
    {
      int64_t v36 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      unint64_t v51 = "-[BRCDocumentItem(BRCFPFSAdditions) _updatePackageItemsIfNecessaryWithImportObject:error:]";
      __int16 v52 = 2080;
      if (!a4) {
        int64_t v36 = "(ignored by caller)";
      }
      uint64_t v53 = v36;
      __int16 v54 = 2112;
      id v55 = v29;
      __int16 v56 = 2112;
      __int16 v57 = v30;
      _os_log_error_impl(&dword_23FA42000, v31, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

    if (a4) {
      *a4 = v29;
    }

    id v8 = 0;
LABEL_38:

    _Block_object_dispose(v59, 8);
LABEL_39:
    BOOL v27 = 0;
  }
  else
  {
    BOOL v34 = [(BRCDocumentItem *)self currentVersion];
    [v34 updateWithPackageSize:v42];

    _Block_object_dispose(v59, 8);
    BOOL v27 = 1;
  }

LABEL_47:
  return v27;
}

uint64_t __90__BRCDocumentItem_BRCFPFSAdditions___updatePackageItemsIfNecessaryWithImportObject_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  uint64_t v7 = brc_bread_crumbs();
  id v8 = brc_default_log();
  if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
  {
    uint64_t v10 = [v5 path];
    int v11 = 138412802;
    uint64_t v12 = v10;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_error_impl(&dword_23FA42000, v8, (os_log_type_t)0x90u, "[ERROR] Failed enumerating item at url %@ - %@%@", (uint8_t *)&v11, 0x20u);
  }
  return 0;
}

- (void)markDoneMigratingToFPFS
{
  if ([(BRCLocalItem *)self isMigratingToFPFS])
  {
    v5.receiver = self;
    v5.super_class = (Class)BRCDocumentItem;
    [(BRCLocalItem *)&v5 markDoneMigratingToFPFS];
    fileIDForUpload = self->_fileIDForUpload;
    self->_fileIDForUpload = 0;

    generationIDForUpload = self->_generationIDForUpload;
    self->_generationIDForUpload = 0;
  }
}

- (BOOL)updateWithImportObject:(id)a3 onlyContentDependentProperties:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if ([(BRCDocumentItem *)self _updatePackageItemsIfNecessaryWithImportObject:v8 error:a5])
  {
    [(BRCLocalVersion *)self->_currentVersion updateWithImportObject:v8 onlyContentDependentProperties:v6];
    objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v8, "fileID"));
    uint64_t v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    fileIDForUpload = self->_fileIDForUpload;
    self->_fileIDForUpload = v9;

    int v11 = [v8 generationID];
    generationIDForUpload = self->_generationIDForUpload;
    self->_generationIDForUpload = v11;

    v15.receiver = self;
    v15.super_class = (Class)BRCDocumentItem;
    BOOL v13 = [(BRCLocalItem *)&v15 updateWithImportObject:v8 onlyContentDependentProperties:v6 error:a5];
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (void)updateWithLogicalName:(id)a3 newParent:(id)a4
{
}

- (void)updateWithLogicalName:(id)a3 newParent:(id)a4 forceTopLevelShareMove:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRCDocumentItem;
  [(BRCLocalItem *)&v9 updateWithLogicalName:v8 newParent:a4 forceTopLevelShareMove:v5];
  if ([(BRCDocumentItem *)self hasShareIDAndIsOwnedByMe]) {
    [(BRCVersion *)self->_currentVersion setOriginalPOSIXName:v8];
  }
}

- (void)reIngestFromFileProvider
{
  self->super._uint64_t syncUpState = 7;
  BOOL v3 = [(BRCLocalItem *)self fileObjectID];
  double v4 = self->super._session;
  fileIDForUpload = self->_fileIDForUpload;
  self->_fileIDForUpload = 0;

  generationIDForUpload = self->_generationIDForUpload;
  self->_generationIDForUpload = 0;

  uint64_t v7 = [v3 asString];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__BRCDocumentItem_BRCFPFSAdditions__reIngestFromFileProvider__block_invoke;
  v10[3] = &unk_26507F7B0;
  id v11 = v3;
  uint64_t v12 = v4;
  id v8 = v4;
  id v9 = v3;
  +[BRCImportUtil requestModificationOfItemIdentifier:v7 completionHandler:v10];
}

void __61__BRCDocumentItem_BRCFPFSAdditions__reIngestFromFileProvider__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ((objc_msgSend(v3, "fp_isFileProviderError:", -1005) & 1) != 0
    || objc_msgSend(v3, "br_isCocoaErrorCode:", 4353))
  {
    double v4 = brc_bread_crumbs();
    BOOL v5 = brc_default_log();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u)) {
      __61__BRCDocumentItem_BRCFPFSAdditions__reIngestFromFileProvider__block_invoke_cold_1(a1);
    }

    BOOL v6 = [*(id *)(a1 + 40) clientTruthWorkloop];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __61__BRCDocumentItem_BRCFPFSAdditions__reIngestFromFileProvider__block_invoke_22;
    v10[3] = &unk_26507ED98;
    id v11 = *(id *)(a1 + 40);
    id v12 = *(id *)(a1 + 32);
    dispatch_async(v6, v10);

    uint64_t v7 = v11;
  }
  else
  {
    if (v3)
    {
      uint64_t v7 = brc_bread_crumbs();
      id v8 = brc_default_log();
      if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        uint64_t v14 = v9;
        __int16 v15 = 2112;
        id v16 = v3;
        __int16 v17 = 2112;
        id v18 = v7;
        _os_log_error_impl(&dword_23FA42000, v8, (os_log_type_t)0x90u, "[ERROR] Failed to re-ingest item %@ - %@%@", buf, 0x20u);
      }
    }
    else
    {
      uint64_t v7 = brc_bread_crumbs();
      id v8 = brc_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        __61__BRCDocumentItem_BRCFPFSAdditions__reIngestFromFileProvider__block_invoke_cold_2(a1);
      }
    }
  }
}

void __61__BRCDocumentItem_BRCFPFSAdditions__reIngestFromFileProvider__block_invoke_22(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v1 = [*(id *)(a1 + 32) itemByFileObjectID:*(void *)(a1 + 40)];
  uint64_t v2 = [v1 asDocument];

  if ([v2 syncUpState] == 7)
  {
    id v3 = brc_bread_crumbs();
    double v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412546;
      uint64_t v9 = v2;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_23FA42000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] Marking %@ as delete for re-apply %@", (uint8_t *)&v8, 0x16u);
    }

    BOOL v5 = [v2 clientZone];
    BOOL v6 = [v2 itemID];
    uint64_t v7 = [v5 serverItemByItemID:v6];

    [v2 markNeedsDeleteForRescheduleOfItem:v7];
    [v2 saveToDB];
  }
}

- (BOOL)updateFromServerItem:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)BRCDocumentItem;
  BOOL v5 = [(BRCLocalItem *)&v35 updateFromServerItem:v4];
  if (v5 && ([v4 isBRAlias] & 1) == 0)
  {
    if (!v4)
    {
      __int16 v26 = brc_bread_crumbs();
      BOOL v27 = brc_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
        -[BRCDocumentItem(BRCFPFSAdditions) updateFromServerItem:].cold.5();
      }
    }
    if (([v4 isDocument] & 1) == 0)
    {
      unint64_t v28 = brc_bread_crumbs();
      id v29 = brc_default_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
        -[BRCDocumentItem updateContentsCKInfoAndDeviceIDFromServerItem:]();
      }
    }
    if (![(BRCDocumentItem *)self isDocument])
    {
      v30 = brc_bread_crumbs();
      unsigned int v31 = brc_default_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
        -[BRCDocumentItem(BRCFPFSAdditions) updateFromServerItem:]();
      }
    }
    if (![(BRCLocalItem *)self isIdleOrRejected])
    {
      objc_super v32 = brc_bread_crumbs();
      unint64_t v33 = brc_default_log();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
        -[BRCDocumentItem(BRCFPFSAdditions) updateFromServerItem:]();
      }
    }
    BOOL v6 = [(BRCVersion *)self->_currentVersion ckInfo];
    uint64_t v7 = [v6 etag];

    int v8 = [v4 latestVersion];
    uint64_t v9 = [v8 ckInfo];
    __int16 v10 = [v9 etag];

    if (!v10)
    {
      uint64_t v14 = brc_bread_crumbs();
      __int16 v15 = brc_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        -[BRCDocumentItem(BRCFPFSAdditions) updateFromServerItem:]((uint64_t)v4);
      }

      currentVersion = self->_currentVersion;
      self->_currentVersion = 0;
      goto LABEL_27;
    }
    id v11 = [(BRCVersion *)self->_currentVersion editedSinceShared];
    char v12 = [v11 BOOLValue];

    if (v12)
    {
      BOOL v13 = 1;
LABEL_19:
      __int16 v17 = [v4 latestVersion];

      if (!v17)
      {
LABEL_28:

        goto LABEL_29;
      }
      BOOL v34 = v13;
      currentVersion = [(BRCLocalVersion *)self->_currentVersion uploadError];
      id v18 = [(BRCLocalVersion *)self->_currentVersion oldVersionIdentifier];
      uint64_t v19 = v7;
      unint64_t v20 = [BRCLocalVersion alloc];
      uint64_t v21 = [v4 latestVersion];
      objc_super v22 = v20;
      uint64_t v7 = v19;
      int64_t v23 = [(BRCLocalVersion *)v22 initWithServerVersion:v21];
      BOOL v24 = self->_currentVersion;
      self->_currentVersion = v23;

      if ([v19 isEqual:v10]) {
        [(BRCLocalVersion *)self->_currentVersion setOldVersionIdentifier:v18];
      }
      if (v34) {
        [(BRCVersion *)self->_currentVersion setEditedSinceShared:MEMORY[0x263EFFA88]];
      }
      if (objc_msgSend(currentVersion, "br_isCloudDocsErrorCode:", 43)) {
        [(BRCLocalVersion *)self->_currentVersion setUploadError:currentVersion];
      }

LABEL_27:
      goto LABEL_28;
    }
    if ([(BRCLocalItem *)self isSharedToMe])
    {
      if (!v7)
      {
        BOOL v13 = 0;
        goto LABEL_19;
      }
    }
    else
    {
      BOOL v13 = 0;
      if (![(BRCLocalItem *)self isSharedByMe] || !v7) {
        goto LABEL_19;
      }
    }
    BOOL v13 = ([(BRCDocumentItem *)self diffAgainstServerItem:v4] & 0x1A0000) != 0;
    goto LABEL_19;
  }
LABEL_29:

  return v5;
}

- (void)cancelDownloadWithEtag:(id)a3 downloadKind:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (v6 && v4 != 2)
  {
    int v8 = brc_bread_crumbs();
    uint64_t v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[BRCDocumentItem(BRCFPFSAdditions) cancelDownloadWithEtag:downloadKind:]();
    }
  }
  uint64_t v7 = [(BRCAccountSessionFPFS *)self->super._session fsDownloader];
  [v7 cancelAndCleanupItemDownload:self kind:v4 etag:v6 andNotifyDownloadTrackers:1];
}

- (void)recoverDamagedDocumentIfNecessaryWithError:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = +[BRCUserDefaults defaultsForMangledID:0];
  int v6 = [v5 recoverDamagedDocumentOnDisk];

  if (v6 && objc_msgSend(v4, "br_isCloudDocsErrorCode:", 151))
  {
    uint64_t v7 = brc_bread_crumbs();
    int v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412802;
      id v16 = self;
      __int16 v17 = 2112;
      id v18 = v4;
      __int16 v19 = 2112;
      unint64_t v20 = v7;
      _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_INFO, "[INFO] Recovering damaged document %@ with error %@%@", (uint8_t *)&v15, 0x20u);
    }

    uint64_t v9 = [(BRCLocalItem *)self clientZone];
    __int16 v10 = [(BRCLocalItem *)self itemID];
    id v11 = [v9 itemByItemID:v10];

    char v12 = [(BRCLocalItem *)self clientZone];
    BOOL v13 = [(BRCLocalItem *)self itemID];
    uint64_t v14 = [v12 serverItemByItemID:v13];

    [v11 markNeedsDeleteForRescheduleOfItem:v14];
    [v11 saveToDB];
  }
}

- (void)isPackage
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: self.isFinderBookmark || BRCItemTypeIsDocument(_st.type)%@", v2, v3, v4, v5, v6);
}

- (void)shouldBeGreedy
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] don't be greedy because the app is document scope private%@", v2, v3, v4, v5, v6);
}

- (void)_initWithServerItem:(uint64_t)a1 dbRowID:.cold.1(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_8(&dword_23FA42000, v1, (uint64_t)v1, "[CRIT] UNREACHABLE: document without a version:\n    %@\n\n   this typically indicates either of two problems:\n    - either we failed processing the last sync down and we\n      saved the structure record but not the contents record,\n    - or the server forgot to send us a contents record.%@", (uint8_t *)&v2);
}

- (void)_initWithServerItem:dbRowID:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: item.isDocument%@", v2, v3, v4, v5, v6);
}

- (void)diffAgainstServerItem:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: !info || info.isDocument%@", v2, v3, v4, v5, v6);
}

- (void)clearVersionSignatures:isPackage:.cold.1()
{
  OUTLINED_FUNCTION_12();
  v0 = BRCPrettyPrintBitmap();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_1(&dword_23FA42000, v1, v2, "[DEBUG] Clearing signatures: %@%@", v3, v4, v5, v6, v7);
}

- (void)updateContentsCKInfoAndDeviceIDFromServerItem:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: ckInfo%@", v2, v3, v4, v5, v6);
}

- (void)updateContentsCKInfoAndDeviceIDFromServerItem:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: self.isDocument%@", v2, v3, v4, v5, v6);
}

- (void)updateContentsCKInfoAndDeviceIDFromServerItem:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: serverItem.isDocument%@", v2, v3, v4, v5, v6);
}

- (void)updateContentsCKInfoAndDeviceIDFromServerItem:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: serverItem%@", v2, v3, v4, v5, v6);
}

- (void)updateVersionMetadataFromServerItem:preventVersionDiffs:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Marking %@ as edited since shared because the item differs in edit mask%@");
}

- (void)updateVersionMetadataFromServerItem:preventVersionDiffs:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: serverItem.latestVersion%@", v2, v3, v4, v5, v6);
}

void __54__BRCDocumentItem_appDidResolveConflictLoserWithEtag___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] removing conflict loser with etag %@%@");
}

void __54__BRCDocumentItem_appDidResolveConflictLoserWithEtag___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] there is no conflict loser with etag %@%@");
}

- (void)markLatestSyncRequestRejectedInZone:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Clearing prev zone rowID and inserting tombstone for item which finished syncing to the new zone%@", v2, v3, v4, v5, v6);
}

- (void)markUploadedWithRecord:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_8(&dword_23FA42000, a4, a3, "[CRIT] UNREACHABLE: no version on uploaded document %@%@", (uint8_t *)a3);
}

- (void)markUploadedWithRecord:(uint64_t)a1 .cold.2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] item is now uploaded: %@%@", (void)v3, DWORD2(v3));
}

- (void)markUploadedWithRecord:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _currentVersion.uploadedAssets == nil%@", v2, v3, v4, v5, v6);
}

- (void)markUploadedWithRecord:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _currentVersion.thumbnailSignature.brc_signatureIsPendingPlaceHolder || self.isDocumentBeingCopiedToNewZone%@", v2, v3, v4, v5, v6);
}

- (void)markUploadedWithRecord:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _currentVersion.contentSignature.brc_signatureIsPendingPlaceHolder || self.isDocumentBeingCopiedToNewZone%@", v2, v3, v4, v5, v6);
}

- (void)markUploadedWithRecord:.cold.6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _currentVersion%@", v2, v3, v4, v5, v6);
}

- (void)markUploadedWithRecord:.cold.7()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: signature%@", v2, v3, v4, v5, v6);
}

- (void)markUploadedWithRecord:.cold.8()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: (fileAsset && !pkgSignature) || (!fileAsset && pkgSignature)%@", v2, v3, v4, v5, v6);
}

- (void)markUploadedWithRecord:.cold.9()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: record%@", v2, v3, v4, v5, v6);
}

- (void)markUploadedWithRecord:.cold.10()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] API MISUSE: state isn't needs-upload%@", v2, v3, v4, v5, v6);
}

- (void)markCrossZoneMovedForServerAssetCopyWithParentItem:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: self.supportsServerSideAssetCopies%@", v2, v3, v4, v5, v6);
}

- (void)markCrossZoneMovedForServerAssetCopyWithParentItem:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: parentItem%@", v2, v3, v4, v5, v6);
}

- (void)_crossZoneMoveToParent:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] Document %@ is being cross zone moved with local changes or enhanced drive privacy mismatch%@", (void)v3, DWORD2(v3));
}

- (void)_crossZoneMoveToParent:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: (_localDiffs & (BRC_IF_CONTENT_SIZE|BRC_IF_CONTENT_SIGNATURE)) != 0 || !_currentVersion.contentSignature.brc_signatureIsValid || !enhancedDrivePrivacyMatches%@", v2, v3, v4, v5, v6);
}

- (void)_updateUploadJobIfNeededWithDiffs:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: !self.isDead && (!isFault || self.isDocumentBeingCopiedToNewZone)%@", v2, v3, v4, v5, v6);
}

- (void)_updateUploadJobIfNeededWithDiffs:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] ┏%llx updating upload jobs%@");
}

- (void)_updateRecursivePropertiesInDB:dbRowID:diffs:.cold.1()
{
  OUTLINED_FUNCTION_12();
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = [v1 lastError];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8(&dword_23FA42000, v0, v3, "[CRIT] UNREACHABLE: can't update recursive properties: %@%@", v4);
}

- (void)_updateRecursivePropertiesInDB:dbRowID:diffs:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: db.isBatchSuspended%@", v2, v3, v4, v5, v6);
}

- (void)_updateInDB:diffs:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Updating zone info for a CZM item and deleting old zone jobs%@", v2, v3, v4, v5, v6);
}

void __61__BRCDocumentItem_BRCFPFSAdditions__reIngestFromFileProvider__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  int v3 = 138412546;
  uint64_t v4 = v1;
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_23FA42000, v2, (os_log_type_t)0x90u, "[ERROR] Failed to find item to re-ingest %@%@", (uint8_t *)&v3, 0x16u);
}

void __61__BRCDocumentItem_BRCFPFSAdditions__reIngestFromFileProvider__block_invoke_cold_2(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  int v3 = 138412546;
  uint64_t v4 = v1;
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_23FA42000, v2, OS_LOG_TYPE_DEBUG, "[DEBUG] Asked to re-ingest %@ for a file ID%@", (uint8_t *)&v3, 0x16u);
}

@end