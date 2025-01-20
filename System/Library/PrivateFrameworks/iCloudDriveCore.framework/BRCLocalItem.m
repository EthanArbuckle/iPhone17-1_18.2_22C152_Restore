@interface BRCLocalItem
+ (BOOL)computeUserVisibleStatusOfLiveItemWithParentVisible:(BOOL)a3 parentIsNonDesktopRoot:(BOOL)a4 parentScope:(unsigned __int8)a5 itemFilename:(id)a6 parentFilename:(id)a7 appLibrary:(id)a8;
+ (BOOL)parseBookmarkData:(id)a3 inAccountSession:(id)a4 itemID:(id *)a5 mangledID:(id *)a6 unsaltedBookmarkData:(id *)a7 error:(id *)a8;
+ (BOOL)parseUnsaltedBookmarkData:(id)a3 itemID:(id *)a4 mangledID:(id *)a5 error:(id *)a6;
+ (id)_bookmarkDataWithItemResolutionString:(id)a3 serverZone:(id)a4 salted:(BOOL)a5;
+ (id)bookmarkDataWithItemResolutionString:(id)a3 serverZone:(id)a4;
+ (id)unsaltedBookmarkDataWithItemResolutionString:(id)a3 serverZone:(id)a4;
+ (unsigned)computeItemScopeFromParentIsRoot:(BOOL)a3 parentIsDocuments:(BOOL)a4 parentScope:(unsigned __int8)a5 logicalName:(id)a6;
- (BOOL)_deleteFromDB:(id)a3 keepAliases:(BOOL)a4;
- (BOOL)_hasFieldChangesNotDiffed;
- (BOOL)_insertInDB:(id)a3 dbRowID:(unint64_t)a4;
- (BOOL)_isIndexable;
- (BOOL)_isInterestingUpdateForNotifs;
- (BOOL)_isInterestingUpdateForNotifsWithDiffs:(unint64_t)a3;
- (BOOL)_updateInDB:(id)a3 diffs:(unint64_t)a4;
- (BOOL)checkIsInDocumentsScopeWithParent:(id)a3;
- (BOOL)dbItemIsMigratingToFPFS;
- (BOOL)forceNeedsSyncUpWithoutDiffs;
- (BOOL)fromReadOnlyDB;
- (BOOL)hasShareIDAndIsOwnedByMe;
- (BOOL)hasValidCKInfo;
- (BOOL)isAlmostDead;
- (BOOL)isBRAlias;
- (BOOL)isChildSharedItem;
- (BOOL)isCrossZoneMoveTombstone;
- (BOOL)isDead;
- (BOOL)isDeadOrMissingInServerTruth;
- (BOOL)isDirectory;
- (BOOL)isDirectoryFault;
- (BOOL)isDirectoryWithPackageName;
- (BOOL)isDocument;
- (BOOL)isDocumentBeingCopiedToNewZone;
- (BOOL)isFSRoot;
- (BOOL)isFinderBookmark;
- (BOOL)isFromInitialScan;
- (BOOL)isIWorkItem;
- (BOOL)isIdleOrRejected;
- (BOOL)isInDataScope;
- (BOOL)isInDocumentOrTrashScope;
- (BOOL)isInDocumentScope;
- (BOOL)isInTrashScope;
- (BOOL)isKnownByServer;
- (BOOL)isKnownByServerOrInFlight;
- (BOOL)isLive;
- (BOOL)isLost;
- (BOOL)isMigratingToFPFS;
- (BOOL)isNewToServer:(BOOL *)a3;
- (BOOL)isOnDisk;
- (BOOL)isOwnedByMe;
- (BOOL)isPackage;
- (BOOL)isReadAndUploaded;
- (BOOL)isRejected;
- (BOOL)isShareAcceptationFault;
- (BOOL)isShareableItem;
- (BOOL)isShared;
- (BOOL)isSharedByMe;
- (BOOL)isSharedToMe;
- (BOOL)isSharedToMeChildItem;
- (BOOL)isSharedToMeTopLevelItem;
- (BOOL)isSymLink;
- (BOOL)isTopLevelSharedItem;
- (BOOL)isUserVisible;
- (BOOL)isZoneRoot;
- (BOOL)logicalNameNeedsRename;
- (BOOL)markLatestSyncRequestAcknowledgedInZone:(id)a3;
- (BOOL)needsInsert;
- (BOOL)needsOSUpgradeToSyncUp;
- (BOOL)needsReading;
- (BOOL)needsSyncUp;
- (BOOL)needsUpload;
- (BOOL)requiresShareAlias;
- (BOOL)saveToDB;
- (BOOL)saveToDBAndValidateLocalDiffs;
- (BOOL)saveToDBForServerEdit:(BOOL)a3 keepAliases:(BOOL)a4;
- (BOOL)shouldUseEnhancedDrivePrivacyWhenNeedsPreserving:(BOOL)a3;
- (BOOL)startDownloadInTask:(id)a3 options:(unint64_t)a4 etagIfLoser:(id)a5 stageFileName:(id)a6 error:(id *)a7;
- (BOOL)updateFPCreationItemIdentifier:(id)a3;
- (BOOL)updateFromServerItem:(id)a3;
- (BOOL)updateWithImportObject:(id)a3 onlyContentDependentProperties:(BOOL)a4 error:(id *)a5;
- (BOOL)validateLoggingToFile:(__sFILE *)a3;
- (BRCAccountSessionFPFS)session;
- (BRCAliasItem)asBRAlias;
- (BRCAppLibrary)appLibrary;
- (BRCClientZone)clientZone;
- (BRCClientZone)parentClientZone;
- (BRCDirectoryItem)asDirectory;
- (BRCDocumentItem)asDocument;
- (BRCFSRooted)asFSRoot;
- (BRCFinderBookmarkItem)asFinderBookmark;
- (BRCItemGlobalID)itemGlobalID;
- (BRCItemID)itemID;
- (BRCItemID)serverPathMatchItemID;
- (BRCLocalItem)orig;
- (BRCLocalStatInfo)st;
- (BRCPQLConnection)db;
- (BRCServerZone)serverZone;
- (BRCShareAcceptationFault)asShareAcceptationFault;
- (BRCSharedToMeTopLevel)asSharedToMeTopLevelItem;
- (BRCSymlinkItem)asSymlink;
- (BRCTopLevelShareable)asShareableItem;
- (BRCUserRowID)ownerKey;
- (BRFileObjectID)fileObjectID;
- (BRFileObjectID)parentFileObjectID;
- (NSDictionary)extendedAttributes;
- (NSError)syncUpError;
- (NSNumber)fileID;
- (NSNumber)parentFileID;
- (NSString)appLibraryID;
- (NSString)bookmarkData;
- (NSString)collaborationIdentifierIfComputable;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)digestDescription;
- (NSString)extension;
- (NSString)logicalName;
- (NSString)path;
- (id)_initFromPQLResultSet:(id)a3 session:(id)a4 db:(id)a5 error:(id *)a6;
- (id)_initWithImportObject:(id)a3 error:(id *)a4;
- (id)_initWithLocalItem:(id)a3;
- (id)_initWithServerItem:(id)a3 dbRowID:(unint64_t)a4;
- (id)_syncZoneRowIDs;
- (id)_updateCrossZoneParent:(id)a3;
- (id)baseSideCarRecord;
- (id)baseStructureRecord;
- (id)computeItemPathRelativeToRoot;
- (id)computedDestinationFilenameFromServerItem:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithContext:(id)a3;
- (id)initFromPQLResultSet:(id)a3 error:(id *)a4;
- (id)initFromPQLResultSet:(id)a3 session:(id)a4 db:(id)a5 error:(id *)a6;
- (id)itemParentGlobalID;
- (id)jobsDescription;
- (id)liveStageFilename;
- (id)matchingJobsWhereSQLClause;
- (id)osNameNeededToSyncUp;
- (id)parentItemIDInZone;
- (id)parentItemOnFS;
- (id)setOfParentIDs;
- (id)sharedAliasItemID;
- (id)sideCarInfo;
- (id)sideCarRecordID;
- (id)structureRecordBeingDeadInServerTruth:(BOOL)a3 shouldPCSChainStatus:(unsigned __int8)a4 inZone:(id)a5;
- (id)structureRecordBeingDeadInServerTruth:(BOOL)a3 stageID:(id)a4 shouldPCSChainStatus:(unsigned __int8)a5 saltGetter:(id)a6 childBasehashSaltGetter:(id)a7;
- (id)structureRecordID;
- (id)structureRecordIDInZone:(id)a3;
- (id)unsaltedBookmarkData;
- (unint64_t)dbRowID;
- (unint64_t)diffAgainstLocalItem:(id)a3;
- (unint64_t)diffAgainstOriginalItem;
- (unint64_t)diffAgainstServerAliasItem:(id)a3;
- (unint64_t)diffAgainstServerItem:(id)a3;
- (unint64_t)localDiffs;
- (unint64_t)maskForDiffsToSyncUpForZone:(id)a3 sideCarZone:(BOOL)a4 whenClearing:(BOOL)a5;
- (unint64_t)metadataSyncUpMask:(BOOL)a3;
- (unint64_t)notifsRank;
- (unint64_t)sharingOptions;
- (unsigned)itemScope;
- (unsigned)syncUpState;
- (unsigned)uploadStatus;
- (void)_ascendItemHierarchyWithBlock:(id)a3;
- (void)_cheapCheckSavingItem;
- (void)_crossZoneMoveToParent:(id)a3;
- (void)_insertTombstoneForCrossZoneMove:(id)a3;
- (void)_learnItemID:(id)a3 serverItem:(id)a4;
- (void)_markAsDeadTombstoneWithPreviousGlobalID:(id)a3;
- (void)_markNeedsSyncingUp;
- (void)_moveToZoneWhenServerItemIsDead:(id)a3;
- (void)_recomputeUserVisibleAndItemScope;
- (void)_refreshAppLibraryFromParent;
- (void)_restorePreviousGlobalID:(id)a3;
- (void)_sendNotificationIfNeededWithDiffs:(unint64_t)a3 regather:(BOOL)a4;
- (void)_updateAppLibraryFromParent:(id)a3;
- (void)_updateAppLibraryPristineStatesAfterCreationOrUpdate;
- (void)_updateAppLibraryPristineStatesAfterMarkingDead;
- (void)_updateParent:(id)a3 forceTopLevelShareMove:(BOOL)a4;
- (void)_updatePropagatedInfoIfNeeded;
- (void)_updateSharedZoneBoostingWithDiffs:(unint64_t)a3;
- (void)_updateSyncUpSchedulerWithDiffs:(unint64_t)a3;
- (void)asBRAlias;
- (void)asDirectory;
- (void)asDocument;
- (void)asFSRoot;
- (void)asFinderBookmark;
- (void)asShareAcceptationFault;
- (void)asShareableItem;
- (void)asSharedToMeTopLevelItem;
- (void)asSymlink;
- (void)createSyncUpJob;
- (void)fileObjectID;
- (void)forceNeedsSyncUpWithoutDiffs;
- (void)handleUnknownItemError;
- (void)inheritOSUpgradeNeededFromItem:(id)a3;
- (void)insertTombstoneAliasRecordInZone:(id)a3;
- (void)isReadAndUploaded;
- (void)markBouncedToNextAvailableBounceNumber:(int)a3;
- (void)markCannotSynchronizeForTooDeepHierarchy;
- (void)markDead;
- (void)markDoneMigratingToFPFS;
- (void)markForceNeedsSyncUp;
- (void)markForceNotify;
- (void)markForceRejected;
- (void)markFromInitialScan;
- (void)markImportedItemAsSharedWithImportBookmark:(id)a3 parent:(id)a4;
- (void)markItemForgottenByServer;
- (void)markLatestSyncRequestFailedInZone:(id)a3;
- (void)markLatestSyncRequestRejectedInZone:(id)a3;
- (void)markNeedsDeleteForItemIDTransfer;
- (void)markNeedsDeleteForRescheduleOfItem:(id)a3;
- (void)markNeedsDeleteWhenAlreadyDeadInServerTruth;
- (void)markNeedsOSUpgradeToSyncUpWithName:(id)a3;
- (void)markNeedsUploadOrSyncingUp;
- (void)markRejectedItemRemotelyRevived;
- (void)markRemovedFromFilesystemForServerEdit:(BOOL)a3;
- (void)markRemovedFromFilesystemRecursively:(BOOL)a3;
- (void)moveAsideLocally;
- (void)parentFileObjectID;
- (void)parentItemIDInZone;
- (void)parentItemOnFS;
- (void)prepareForSyncUpInZone:(id)a3;
- (void)prepareForSyncUpSideCarZone;
- (void)resetWhileKeepingClientItemsAndWantsUnlink:(BOOL)a3;
- (void)scheduleSyncDownForOOBModifyRecordsAck;
- (void)serializeStructuralPluginHints:(id)a3;
- (void)setAppLibrary:(id)a3;
- (void)setSharingOptions:(unint64_t)a3;
- (void)sideCarInfo;
- (void)triggerNotificationIfNeeded;
- (void)updateItemMetadataFromServerItem:(id)a3 appliedSharingPermission:(BOOL)a4;
- (void)updateParentZoneRowID:(id)a3;
- (void)updateStatMetadataFromServerItem:(id)a3;
- (void)updateStructuralCKInfoFromServerItem:(id)a3;
- (void)updateToBeInTrashWithParent:(id)a3 trashPutBackPath:(id)a4 trashPutBackParentID:(id)a5;
- (void)updateToBeUntrashedWithParent:(id)a3;
- (void)updateWithCreationDate:(id)a3;
- (void)updateWithFavoriteRank:(unint64_t)a3;
- (void)updateWithFileSystemFlags:(unint64_t)a3;
- (void)updateWithFinderTagNames:(id)a3;
- (void)updateWithLastUsedDate:(id)a3;
- (void)updateWithLogicalName:(id)a3 newParent:(id)a4;
- (void)updateWithLogicalName:(id)a3 newParent:(id)a4 forceTopLevelShareMove:(BOOL)a5;
- (void)updateWithXattrs:(id)a3;
- (void)wasMarkedDead;
@end

@implementation BRCLocalItem

- (NSString)bookmarkData
{
  v3 = NSString;
  v4 = [(BRCItemID *)self->_itemID itemIDString];
  v5 = [v3 bookmarkDataWithItemResolutionString:v4 serverZone:self->_serverZone];

  return (NSString *)v5;
}

+ (id)_bookmarkDataWithItemResolutionString:(id)a3 serverZone:(id)a4 salted:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  v8 = NSString;
  id v9 = a3;
  v10 = [v7 zoneName];
  int v11 = [v7 isSharedZone];
  if (v11)
  {
    v12 = [v7 ownerName];
  }
  else
  {
    v12 = 0;
  }
  v13 = [v7 session];
  v14 = [v13 accountDSID];
  v15 = [v8 bookmarkDataWithItemResolutionString:v9 serverZoneName:v10 ownerName:v12 accountDSID:v14 salted:v5];

  if (v11) {
  return v15;
  }
}

+ (id)bookmarkDataWithItemResolutionString:(id)a3 serverZone:(id)a4
{
  return (id)[a1 _bookmarkDataWithItemResolutionString:a3 serverZone:a4 salted:1];
}

+ (id)unsaltedBookmarkDataWithItemResolutionString:(id)a3 serverZone:(id)a4
{
  return (id)[a1 _bookmarkDataWithItemResolutionString:a3 serverZone:a4 salted:0];
}

+ (BOOL)parseUnsaltedBookmarkData:(id)a3 itemID:(id *)a4 mangledID:(id *)a5 error:(id *)a6
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v9 = a3;
  v10 = [v9 componentsSeparatedByString:@"/"];
  if ([v10 count] == 2)
  {
    id v11 = objc_alloc(MEMORY[0x263F325E0]);
    v12 = [v10 objectAtIndexedSubscript:0];
    v13 = (BRCItemID *)[v11 initWithAliasTargetContainerString:v12];

    if (v13)
    {
      v14 = [BRCItemID alloc];
      v15 = [v10 objectAtIndexedSubscript:1];
      v16 = [(BRCItemID *)v14 initWithUUIDString:v15];

      if (v16)
      {
        if (a5) {
          objc_storeStrong(a5, v13);
        }
        if (a4) {
          objc_storeStrong(a4, v16);
        }
        BOOL v17 = 1;
        goto LABEL_27;
      }
      objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"unsaltedBookmarkData", v9);
      v22 = (BRCItemID *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v23 = brc_bread_crumbs();
        v24 = brc_default_log();
        if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
        {
          v28 = "(passed to caller)";
          int v29 = 136315906;
          v30 = "+[BRCLocalItem(BRCBookmarkAdditions) parseUnsaltedBookmarkData:itemID:mangledID:error:]";
          __int16 v31 = 2080;
          if (!a6) {
            v28 = "(ignored by caller)";
          }
          v32 = v28;
          __int16 v33 = 2112;
          v34 = v22;
          __int16 v35 = 2112;
          v36 = v23;
          _os_log_error_impl(&dword_23FA42000, v24, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", (uint8_t *)&v29, 0x2Au);
        }
      }
      if (a6) {
        *a6 = v22;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"unsaltedBookmarkData", v9);
      v16 = (BRCItemID *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v20 = brc_bread_crumbs();
        v21 = brc_default_log();
        if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
        {
          v27 = "(passed to caller)";
          int v29 = 136315906;
          v30 = "+[BRCLocalItem(BRCBookmarkAdditions) parseUnsaltedBookmarkData:itemID:mangledID:error:]";
          __int16 v31 = 2080;
          if (!a6) {
            v27 = "(ignored by caller)";
          }
          v32 = v27;
          __int16 v33 = 2112;
          v34 = v16;
          __int16 v35 = 2112;
          v36 = v20;
          _os_log_error_impl(&dword_23FA42000, v21, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", (uint8_t *)&v29, 0x2Au);
        }
      }
      if (a6)
      {
        v16 = v16;
        BOOL v17 = 0;
        *a6 = v16;
LABEL_27:

        goto LABEL_28;
      }
    }
    BOOL v17 = 0;
    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"unsaltedBookmarkData", v9);
  v13 = (BRCItemID *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v18 = brc_bread_crumbs();
    v19 = brc_default_log();
    if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
    {
      v26 = "(passed to caller)";
      int v29 = 136315906;
      v30 = "+[BRCLocalItem(BRCBookmarkAdditions) parseUnsaltedBookmarkData:itemID:mangledID:error:]";
      __int16 v31 = 2080;
      if (!a6) {
        v26 = "(ignored by caller)";
      }
      v32 = v26;
      __int16 v33 = 2112;
      v34 = v13;
      __int16 v35 = 2112;
      v36 = v18;
      _os_log_error_impl(&dword_23FA42000, v19, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", (uint8_t *)&v29, 0x2Au);
    }
  }
  if (a6)
  {
    v13 = v13;
    BOOL v17 = 0;
    *a6 = v13;
  }
  else
  {
    BOOL v17 = 0;
  }
LABEL_28:

  return v17;
}

+ (BOOL)parseBookmarkData:(id)a3 inAccountSession:(id)a4 itemID:(id *)a5 mangledID:(id *)a6 unsaltedBookmarkData:(id *)a7 error:(id *)a8
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  v15 = [v13 componentsSeparatedByString:@"/"];
  if ([v15 count] == 3)
  {
    id v16 = [v15 objectAtIndexedSubscript:0];
    BOOL v17 = [v15 objectAtIndexedSubscript:1];
    v18 = [v15 objectAtIndexedSubscript:2];
    id obj = (id)[objc_alloc(MEMORY[0x263F325E0]) initWithAliasTargetContainerString:v16];
    v48 = [v14 accountDSID];
    uint64_t v47 = objc_msgSend(v17, "brc_SHA1WithSalt:");
    if ((objc_msgSend(v18, "isEqualToString:") & 1) == 0
      && ([v18 isEqualToString:@"BRGetFileNameFromServerInfoBlob"] & 1) == 0)
    {
      v28 = v18;
      int v29 = brc_bread_crumbs();
      v30 = brc_default_log();
      __int16 v31 = (void *)v47;
      if (os_log_type_enabled(v30, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138413058;
        v51 = v28;
        __int16 v52 = 2112;
        uint64_t v53 = v47;
        __int16 v54 = 2112;
        id v55 = v13;
        __int16 v56 = 2112;
        v57 = v29;
        _os_log_error_impl(&dword_23FA42000, v30, (os_log_type_t)0x90u, "[ERROR] checksum from bookmark %@ is not equal to expected checksum %@ for %@%@", buf, 0x2Au);
      }

      if (a8)
      {
        objc_msgSend(MEMORY[0x263F087E8], "brc_errorAccountMismatch");
        BOOL v24 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v24 = 0;
      }
      v18 = (char *)v28;
      v34 = obj;
      goto LABEL_39;
    }
    if (a5)
    {
      v44 = [v17 componentsSeparatedByString:@":"];
      v45 = v18;
      v46 = a8;
      if ([v44 count] == 2 && objc_msgSend(v17, "hasPrefix:", @"docID:"))
      {
        id v19 = *a5;
        *a5 = 0;

        brc_bread_crumbs();
        v20 = (char *)objc_claimAutoreleasedReturnValue();
        v21 = brc_default_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v51 = v20;
          _os_log_impl(&dword_23FA42000, v21, OS_LOG_TYPE_DEFAULT, "[WARNING] can't parse docID based bookmark%@", buf, 0xCu);
        }
      }
      else
      {
        id v43 = v14;
        if ([obj isShared])
        {
          v25 = [v14 sharedClientZoneByMangledID:obj];
          v26 = [v25 dbRowID];
          v27 = 0;
        }
        else
        {
          v25 = [v14 appLibraryByMangledID:obj];
          v27 = [v25 dbRowID];
          v26 = 0;
        }

        v32 = [[BRCItemID alloc] initWithString:v17 libraryRowID:v27 sharedZoneRowID:v26];
        id v33 = *a5;
        *a5 = v32;

        id v14 = v43;
      }
      if (!*a5)
      {
        uint64_t v37 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"bookmarkData", v13);
        if (v37)
        {
          v38 = brc_bread_crumbs();
          v39 = brc_default_log();
          if (os_log_type_enabled(v39, (os_log_type_t)0x90u))
          {
            v42 = "(passed to caller)";
            *(_DWORD *)buf = 136315906;
            v51 = "+[BRCLocalItem(BRCBookmarkAdditions) parseBookmarkData:inAccountSession:itemID:mangledID:unsaltedBookmarkData:error:]";
            __int16 v52 = 2080;
            if (!v46) {
              v42 = "(ignored by caller)";
            }
            uint64_t v53 = (uint64_t)v42;
            __int16 v54 = 2112;
            id v55 = v37;
            __int16 v56 = 2112;
            v57 = v38;
            _os_log_error_impl(&dword_23FA42000, v39, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
          }
        }
        if (v46) {
          id *v46 = v37;
        }

        BOOL v24 = 0;
        v18 = v45;
        v34 = obj;
        __int16 v31 = (void *)v47;
        goto LABEL_39;
      }

      v18 = v45;
    }
    v34 = obj;
    if (a6) {
      objc_storeStrong(a6, obj);
    }
    __int16 v31 = (void *)v47;
    if (a7)
    {
      __int16 v35 = [v16 stringByAppendingPathComponent:v17];
      id v36 = *a7;
      *a7 = v35;
    }
    BOOL v24 = 1;
LABEL_39:

    goto LABEL_40;
  }
  objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"bookmarkData", v13);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v22 = brc_bread_crumbs();
    v23 = brc_default_log();
    if (os_log_type_enabled(v23, (os_log_type_t)0x90u))
    {
      v41 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v51 = "+[BRCLocalItem(BRCBookmarkAdditions) parseBookmarkData:inAccountSession:itemID:mangledID:unsaltedBookmarkData:error:]";
      __int16 v52 = 2080;
      if (!a8) {
        v41 = "(ignored by caller)";
      }
      uint64_t v53 = (uint64_t)v41;
      __int16 v54 = 2112;
      id v55 = v16;
      __int16 v56 = 2112;
      v57 = v22;
      _os_log_error_impl(&dword_23FA42000, v23, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }
  }
  if (a8)
  {
    id v16 = v16;
    BOOL v24 = 0;
    *a8 = v16;
  }
  else
  {
    BOOL v24 = 0;
  }
LABEL_40:

  return v24;
}

- (unint64_t)diffAgainstServerAliasItem:(id)a3
{
  id v4 = a3;
  if (![(BRCLocalItem *)self isSharedToMeTopLevelItem])
  {
    id v9 = brc_bread_crumbs();
    v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem(BRCSharedToMeTopLevel) diffAgainstServerAliasItem:]();
    }
  }
  BOOL v5 = [(BRCLocalItem *)self st];
  v6 = [v4 st];

  unint64_t v7 = [v5 diffAgainst:v6];
  return v7;
}

- (id)sharedAliasItemID
{
  if (![(BRCLocalItem *)self isSharedToMeTopLevelItem])
  {
    unint64_t v7 = brc_bread_crumbs();
    v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem(BRCSharedToMeTopLevel) diffAgainstServerAliasItem:]();
    }
  }
  itemID = self->_itemID;
  id v4 = [(BRCServerZone *)self->_serverZone ownerName];
  BOOL v5 = [(BRCItemID *)itemID derivedAliasItemIDWithOwnerName:v4];

  return v5;
}

- (id)structureRecordIDInZone:(id)a3
{
  id v4 = a3;
  if (![(BRCLocalItem *)self isSharedToMeTopLevelItem])
  {
    v10 = brc_bread_crumbs();
    id v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem(BRCSharedToMeTopLevel) diffAgainstServerAliasItem:]();
    }
  }
  BOOL v5 = [(BRCAccountSessionFPFS *)self->_session serverAliasItemForSharedItem:self inZone:v4];
  v6 = [v5 itemID];
  unint64_t v7 = [v5 st];
  v8 = objc_msgSend(v6, "structureRecordIDForItemType:zone:aliasTargetZoneIsShared:", objc_msgSend(v7, "type"), v4, 1);

  return v8;
}

- (id)structureRecordBeingDeadInServerTruth:(BOOL)a3 shouldPCSChainStatus:(unsigned __int8)a4 inZone:(id)a5
{
  id v6 = a5;
  if (![(BRCLocalItem *)self isSharedToMeTopLevelItem])
  {
    uint64_t v58 = brc_bread_crumbs();
    v59 = brc_default_log();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem(BRCSharedToMeTopLevel) diffAgainstServerAliasItem:]();
    }
  }
  if (![(BRCServerZone *)self->_serverZone isSharedZone])
  {
    v60 = brc_bread_crumbs();
    v61 = brc_default_log();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem(BRCSharedToMeTopLevel) structureRecordBeingDeadInServerTruth:shouldPCSChainStatus:inZone:]();
    }
  }
  if (([v6 isPrivateZone] & 1) == 0)
  {
    v62 = brc_bread_crumbs();
    v63 = brc_default_log();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem(BRCSharedToMeTopLevel) structureRecordBeingDeadInServerTruth:shouldPCSChainStatus:inZone:]();
    }
  }
  unint64_t v7 = [(BRCAccountSessionFPFS *)self->_session serverAliasItemForSharedItem:self inZone:v6];
  v8 = [v7 itemID];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [(BRCLocalItem *)self sharedAliasItemID];
  }
  v70 = v10;

  unint64_t v11 = [(BRCLocalItem *)self diffAgainstOriginalItem];
  unint64_t localDiffs = self->_localDiffs;
  v69 = v7;
  if (v7)
  {
    id v13 = [(BRCStatInfo *)self->_st ckInfo];

    if (v13)
    {
      int v66 = 1;
      goto LABEL_17;
    }
  }
  id v14 = [(BRCServerZone *)self->_serverZone zoneName];
  uint64_t v15 = *MEMORY[0x263F324E8];
  char v16 = [v14 isEqualToString:*MEMORY[0x263F324E8]];

  if (v16)
  {
    int v66 = 0;
    goto LABEL_17;
  }
  id v17 = objc_alloc(MEMORY[0x263F325E0]);
  v18 = [(BRCServerZone *)self->_serverZone ownerName];
  id v19 = (void *)[v17 initWithZoneName:v15 ownerName:v18];

  v20 = NSString;
  v21 = [(BRCItemID *)self->_itemID itemIDString];
  v22 = [v20 unsaltedBookmarkDataWithItemResolutionString:v21 serverZoneMangledID:v19];

  v23 = [v6 clientZone];
  BOOL v24 = [v23 asPrivateClientZone];
  v25 = [v24 serverAliasByUnsaltedBookmarkData:v22];

  if (!v25)
  {

    int v66 = 0;
    unint64_t v7 = v69;
LABEL_17:
    unint64_t v32 = localDiffs | v11;
    uint64_t v67 = [v70 structureRecordIDForItemType:3 zone:v6 aliasTargetZoneIsShared:1];
    id v29 = (id)[objc_alloc(MEMORY[0x263EFD7C8]) initWithRecordType:@"structure" recordID:v67];
    id v33 = [(BRCStatInfo *)self->_st ckInfo];
    v34 = [(BRCStatInfo *)self->_st parentID];
    itemID = self->_itemID;
    serverZone = self->_serverZone;
    BYTE2(v65) = a4;
    BYTE1(v65) = v7 == 0;
    LOBYTE(v65) = [(BRCLocalItem *)self isDirectory];
    +[BRCAliasItem fillStructureRecord:inZone:itemID:ckInfo:parentID:targetItemID:targetZone:diffs:isFolderShare:beingDeadInServerTruth:shouldPCSChainStatus:](BRCAliasItem, "fillStructureRecord:inZone:itemID:ckInfo:parentID:targetItemID:targetZone:diffs:isFolderShare:beingDeadInServerTruth:shouldPCSChainStatus:", v29, v6, v70, v33, v34, itemID, serverZone, v32, v65);

    if (!v66 || (v32 & 0x800) != 0)
    {
      uint64_t v37 = [(BRCLocalItem *)self st];
      objc_msgSend(v29, "setLastUsedTime:", objc_msgSend(v37, "lastUsedTime"));
    }
    if ((v32 & 0x1000) != 0) {
      char v38 = 0;
    }
    else {
      char v38 = v66;
    }
    v28 = v69;
    if ((v38 & 1) == 0)
    {
      v39 = [(BRCLocalItem *)self st];
      if ([v39 favoriteRank])
      {
        v40 = NSNumber;
        v41 = [(BRCLocalItem *)self st];
        v42 = objc_msgSend(v40, "numberWithLongLong:", objc_msgSend(v41, "favoriteRank"));
        [v29 setObject:v42 forKeyedSubscript:@"favoriteRank"];
      }
      else
      {
        [v29 setObject:0 forKeyedSubscript:@"favoriteRank"];
      }
    }
    if ((v32 & 0x40) != 0)
    {
      id v43 = [(BRCLocalItem *)self appLibrary];
      if ([v43 isCloudDocsAppLibrary])
      {
        v44 = [(BRCLocalItem *)self clientZone];
        if ([v44 isCloudDocsZone])
        {
          v45 = [(BRCLocalItem *)self parentItemIDInZone];
          uint64_t v46 = [v45 isNonDesktopRoot];

          v28 = v69;
        }
        else
        {
          uint64_t v46 = 0;
        }
      }
      else
      {
        uint64_t v46 = 0;
      }
      BOOL v47 = v28 == 0;

      v48 = [(BRCLocalItem *)self parentItemIDInZone];
      char v49 = [v48 isDocumentsFolder];

      v50 = [(BRCLocalItem *)self st];
      v51 = [v50 logicalName];
      LOBYTE(v64) = v49;
      v28 = v69;
      [v29 serializeFilename:v51 forCreation:v47 setExtension:1 inSharedAlias:1 basehashSaltIfNotShareAlias:0 parentIDIsCloudDocsRoot:v46 parentIDIsDocumentsFolder:v64];
    }
    if ((v32 & 0x200) != 0) {
      char v52 = 0;
    }
    else {
      char v52 = v66;
    }
    if ((v52 & 1) == 0)
    {
      uint64_t v53 = [(BRCLocalItem *)self st];
      __int16 v54 = [v53 finderTags];
      [v29 serializeFinderTags:v54 forCreation:v28 == 0];
    }
    [(BRCLocalItem *)self serializeStructuralPluginHints:v29];
    id v55 = [(BRCLocalItem *)self session];
    int v56 = [v29 validateEnhancedDrivePrivacyFieldsWithSession:v55 error:0];

    if (v56)
    {
      id v29 = v29;
      __int16 v31 = v29;
    }
    else
    {
      __int16 v31 = 0;
    }
    v30 = (void *)v67;
    goto LABEL_45;
  }
  v26 = brc_bread_crumbs();
  v27 = brc_default_log();
  v28 = v69;
  if (os_log_type_enabled(v27, (os_log_type_t)0x90u)) {
    -[BRCLocalItem(BRCSharedToMeTopLevel) structureRecordBeingDeadInServerTruth:shouldPCSChainStatus:inZone:]();
  }

  id v29 = 0;
  v30 = 0;
  __int16 v31 = 0;
LABEL_45:

  return v31;
}

- (void)insertTombstoneAliasRecordInZone:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BRCAccountSessionFPFS *)self->_session serverAliasItemForSharedItem:self inZone:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 serverZone];

    v8 = [v7 clientZone];
    id v9 = [v6 itemID];
    id v10 = [v8 itemByItemID:v9];
    unint64_t v11 = [v10 asBRAlias];

    if ([v11 isDead])
    {
      v12 = brc_bread_crumbs();
      id v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[BRCLocalItem(BRCSharedToMeTopLevel) insertTombstoneAliasRecordInZone:]();
      }
    }
    else
    {
      if (v11)
      {
        id v14 = brc_bread_crumbs();
        uint64_t v15 = brc_default_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
          -[BRCLocalItem(BRCSharedToMeTopLevel) insertTombstoneAliasRecordInZone:].cold.4();
        }
      }
      else
      {
        id v14 = brc_bread_crumbs();
        uint64_t v15 = brc_default_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          -[BRCLocalItem(BRCSharedToMeTopLevel) insertTombstoneAliasRecordInZone:]();
        }
      }

      char v16 = [(BRCLocalItem *)self db];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __72__BRCLocalItem_BRCSharedToMeTopLevel__insertTombstoneAliasRecordInZone___block_invoke;
      v17[3] = &unk_26507F060;
      v18 = v6;
      id v7 = v7;
      id v19 = v7;
      v20 = self;
      [v16 groupInBatch:v17];

      v12 = v18;
    }
  }
  else
  {
    unint64_t v11 = brc_bread_crumbs();
    v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[BRCLocalItem(BRCSharedToMeTopLevel) insertTombstoneAliasRecordInZone:]();
    }
    id v7 = v4;
  }
}

void __72__BRCLocalItem_BRCSharedToMeTopLevel__insertTombstoneAliasRecordInZone___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) newLocalItemWithServerZone:*(void *)(a1 + 40) dbRowID:0];
  id v6 = [v2 asBRAlias];

  v3 = [*(id *)(*(void *)(a1 + 48) + 72) ckInfo];
  id v4 = [v6 st];
  [v4 setCkInfo:v3];

  BOOL v5 = [v6 st];
  [v5 setItemScope:2];

  [v6 saveToDB];
  [v6 markDead];
  [v6 markNeedsUploadOrSyncingUpWithAliasTarget:*(void *)(a1 + 48)];
  [v6 saveToDB];
}

- (void)updateParentZoneRowID:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([(BRCPQLConnection *)self->_db isBatchSuspended])
  {
    if (v5) {
      goto LABEL_3;
    }
LABEL_15:
    v8 = brc_bread_crumbs();
    id v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem(BRCSharedToMeTopLevel) updateParentZoneRowID:]();
    }
    goto LABEL_17;
  }
  uint64_t v15 = brc_bread_crumbs();
  char v16 = brc_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
    -[BRCLocalItem(BRCSharedToMeTopLevel) updateParentZoneRowID:].cold.4();
  }

  if (!v5) {
    goto LABEL_15;
  }
LABEL_3:
  if (([(BRCZoneRowID *)self->_parentZoneRowID br_isEqualToNumber:v5] & 1) == 0)
  {
    id v6 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412546;
      v20 = self;
      __int16 v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_23FA42000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] Parent zone updated on %@, clearing ckinfo and inserting dead item%@", (uint8_t *)&v19, 0x16u);
    }

    v8 = [(BRCAccountSessionFPFS *)self->_session serverZoneByRowID:self->_parentZoneRowID];
    [(BRCLocalItem *)self insertTombstoneAliasRecordInZone:v8];
    id v9 = [(BRCAccountSessionFPFS *)self->_session serverZoneByRowID:v5];
    id v10 = [v9 clientZone];

    unint64_t v11 = [(BRCAccountSessionFPFS *)self->_session localAliasForSharedItem:self inZone:v10];
    v12 = v11;
    if (v11)
    {
      if (([v11 isDead] & 1) == 0)
      {
        id v17 = brc_bread_crumbs();
        v18 = brc_default_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
          -[BRCLocalItem(BRCSharedToMeTopLevel) updateParentZoneRowID:]();
        }
      }
      id v13 = brc_bread_crumbs();
      id v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[BRCLocalItem(BRCSharedToMeTopLevel) updateParentZoneRowID:]();
      }

      [v12 markNeedsDeleteForRescheduleOfItem:0];
      [v12 saveToDB];
    }
    objc_storeStrong((id *)&self->_parentZoneRowID, a3);
    [(BRCStatInfo *)self->_st setCkInfo:0];

LABEL_17:
  }
}

- (BOOL)requiresShareAlias
{
  if ([(BRCStatInfo *)self->_st favoriteRank]
    || [(BRCStatInfo *)self->_st lastUsedTime]
    || ([(BRCStatInfo *)self->_st finderTags],
        v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v3 length],
        v3,
        v4))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    session = self->_session;
    v8 = [(BRCLocalItem *)self clientZone];
    id v9 = [v8 asSharedClientZone];
    id v10 = [(BRCLocalItem *)self st];
    unint64_t v11 = [v10 logicalName];
    v12 = objc_msgSend(v11, "br_pathExtension");
    id v13 = [v12 lowercaseString];
    id v14 = [(BRCAccountSessionFPFS *)session fallbackAppLibraryForClientZone:v9 extension:v13];

    uint64_t v15 = [(BRCStatInfo *)self->_st parentID];
    char v16 = [v14 documentsFolderItemID];
    int v5 = [v15 isEqualToItemID:v16] ^ 1;
  }
  return v5;
}

- (BRCAliasItem)asBRAlias
{
  v2 = brc_bread_crumbs();
  v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    -[BRCLocalItem asBRAlias]();
  }

  return 0;
}

- (BRCDirectoryItem)asDirectory
{
  v2 = brc_bread_crumbs();
  v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    -[BRCLocalItem asDirectory]();
  }

  return 0;
}

- (BRCDocumentItem)asDocument
{
  v2 = brc_bread_crumbs();
  v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    -[BRCLocalItem asDocument]();
  }

  return 0;
}

- (BOOL)isShareableItem
{
  return 0;
}

- (BRCTopLevelShareable)asShareableItem
{
  v2 = brc_bread_crumbs();
  v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    -[BRCLocalItem asShareableItem]();
  }

  return 0;
}

- (BRCFSRooted)asFSRoot
{
  if ([(BRCLocalItem *)self isDirectory] && [(BRCLocalItem *)self isFSRoot])
  {
    v3 = self;
  }
  else
  {
    uint64_t v4 = brc_bread_crumbs();
    int v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem asFSRoot]();
    }

    v3 = 0;
  }
  return (BRCFSRooted *)v3;
}

- (BRCSymlinkItem)asSymlink
{
  v2 = brc_bread_crumbs();
  v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    -[BRCLocalItem asSymlink]();
  }

  return 0;
}

- (BRCFinderBookmarkItem)asFinderBookmark
{
  v2 = brc_bread_crumbs();
  v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    -[BRCLocalItem asFinderBookmark]();
  }

  return 0;
}

- (BRCShareAcceptationFault)asShareAcceptationFault
{
  v2 = brc_bread_crumbs();
  v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    -[BRCLocalItem asShareAcceptationFault]();
  }

  return 0;
}

- (NSString)path
{
  if (self->_resolvedPath)
  {
    v3 = self->_path;
  }
  else
  {
    uint64_t v4 = dispatch_group_create();
    dispatch_group_enter(v4);
    int v5 = objc_msgSend(MEMORY[0x263F055B8], "br_sharedProviderManager");
    id v6 = [(BRCLocalItem *)self fileObjectID];
    id v7 = [v6 asString];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __20__BRCLocalItem_path__block_invoke;
    v11[3] = &unk_265081710;
    v11[4] = self;
    v12 = v4;
    v8 = v4;
    [v5 getUserVisibleURLForItemIdentifier:v7 completionHandler:v11];

    dispatch_time_t v9 = dispatch_time(0, 10000000000);
    dispatch_group_wait(v8, v9);
    self->_resolvedPath = 1;
    v3 = self->_path;
  }
  return v3;
}

void __20__BRCLocalItem_path__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = brc_bread_crumbs();
    v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v13 = 138412802;
      uint64_t v14 = v12;
      __int16 v15 = 2112;
      id v16 = v6;
      __int16 v17 = 2112;
      v18 = v7;
      _os_log_debug_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] Got an error while computing the URL of %@ - %@%@", (uint8_t *)&v13, 0x20u);
    }
  }
  if (v5)
  {
    uint64_t v9 = [v5 path];
    uint64_t v10 = *(void *)(a1 + 32);
    unint64_t v11 = *(void **)(v10 + 192);
    *(void *)(v10 + 192) = v9;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (NSString)logicalName
{
  return (NSString *)[(BRCLocalStatInfo *)self->_st logicalName];
}

- (NSString)extension
{
  v2 = [(BRCLocalItem *)self logicalName];
  v3 = objc_msgSend(v2, "br_pathExtension");

  return (NSString *)v3;
}

- (NSString)appLibraryID
{
  v2 = [(BRCLocalItem *)self appLibrary];
  v3 = [v2 appLibraryID];

  return (NSString *)v3;
}

- (BOOL)needsInsert
{
  return self->_dbRowID == 0;
}

- (BOOL)isFromInitialScan
{
  if ((self->_localDiffs & 0x8000000000000000) != 0) {
    return ![(BRCLocalItem *)self isKnownByServerOrInFlight];
  }
  else {
    return 0;
  }
}

- (BOOL)checkIsInDocumentsScopeWithParent:(id)a3
{
  id v4 = a3;
  isInDocumentScope = self->_isInDocumentScope;
  if (!isInDocumentScope)
  {
    id v7 = [(BRCLocalItem *)self appLibrary];
    if ([v7 includesDataScope])
    {
      char v8 = [v4 isFSRoot];
      uint64_t v9 = (NSNumber *)MEMORY[0x263EFFA80];
      if (v8)
      {
        char v6 = 0;
      }
      else
      {
        uint64_t v12 = [(BRCStatInfo *)self->_st parentID];
        char v13 = [v12 isDocumentsFolder];

        uint64_t v14 = (NSNumber *)MEMORY[0x263EFFA88];
        if ((v13 & 1) == 0)
        {
          if (v4)
          {
            if ([v4 checkIsInDocumentsScopeWithParent:0]) {
              __int16 v15 = v14;
            }
            else {
              __int16 v15 = v9;
            }
            id v16 = v15;
          }
          else
          {
            __int16 v17 = [(BRCLocalItem *)self clientZone];
            char v18 = [v17 isSharedZone];

            id v16 = (NSNumber *)MEMORY[0x263EFFA88];
            if ((v18 & 1) == 0)
            {
              session = self->_session;
              v26 = [(BRCLocalItem *)self itemGlobalID];
              uint64_t v19 = [BRCItemGlobalID alloc];
              v28 = [v7 defaultClientZone];
              v20 = [v28 dbRowID];
              __int16 v21 = [v7 dbRowID];
              v22 = +[BRCItemID documentsItemIDWithAppLibraryRowID:v21];
              uint64_t v23 = [(BRCItemGlobalID *)v19 initWithZoneRowID:v20 itemID:v22];
              BOOL v24 = [(BRCAccountSessionFPFS *)session globalID:v26 isStrictChildOfGlobalID:v23];

              if (!v24) {
                id v16 = v9;
              }
            }
          }
          v25 = self->_isInDocumentScope;
          self->_isInDocumentScope = v16;

          isInDocumentScope = self->_isInDocumentScope;
          goto LABEL_2;
        }
        char v6 = 1;
        uint64_t v9 = (NSNumber *)MEMORY[0x263EFFA88];
      }
    }
    else
    {
      char v6 = 1;
      uint64_t v9 = (NSNumber *)MEMORY[0x263EFFA88];
    }
    uint64_t v10 = self->_isInDocumentScope;
    self->_isInDocumentScope = v9;

    goto LABEL_8;
  }
LABEL_2:
  char v6 = [(NSNumber *)isInDocumentScope BOOLValue];
LABEL_8:

  return v6;
}

- (BOOL)isInDocumentScope
{
  return [(BRCLocalStatInfo *)self->_st itemScope] == 2;
}

- (BOOL)isInDocumentOrTrashScope
{
  if ([(BRCLocalItem *)self isInDocumentScope]) {
    return 1;
  }
  return [(BRCLocalItem *)self isInTrashScope];
}

- (BOOL)isInDataScope
{
  return [(BRCLocalStatInfo *)self->_st itemScope] == 1;
}

- (BOOL)isInTrashScope
{
  return [(BRCLocalStatInfo *)self->_st itemScope] == 3;
}

- (unsigned)itemScope
{
  return [(BRCLocalStatInfo *)self->_st itemScope];
}

- (NSNumber)parentFileID
{
  parentFileID = self->_parentFileID;
  if (!parentFileID)
  {
    id v4 = [(BRCLocalItem *)self parentItemOnFS];
    id v5 = [v4 fileID];
    char v6 = self->_parentFileID;
    self->_parentFileID = v5;

    parentFileID = self->_parentFileID;
  }
  id v7 = parentFileID;
  return v7;
}

- (BRFileObjectID)fileObjectID
{
  if ([(BRCLocalItem *)self isZoneRoot])
  {
    id v3 = objc_alloc(MEMORY[0x263F325A8]);
    id v4 = [(BRCAppLibrary *)self->_appLibrary dbRowID];
    uint64_t v5 = [v4 unsignedLongLongValue];
    char v6 = v3;
    uint64_t v7 = 1;
LABEL_5:
    uint64_t v9 = (void *)[v6 initWithRowID:v5 type:v7];

    goto LABEL_12;
  }
  if ([(BRCItemID *)self->_itemID isDocumentsFolder])
  {
    id v8 = objc_alloc(MEMORY[0x263F325A8]);
    id v4 = [(BRCAppLibrary *)self->_appLibrary dbRowID];
    uint64_t v5 = [v4 unsignedLongLongValue];
    char v6 = v8;
    uint64_t v7 = 4;
    goto LABEL_5;
  }
  uint64_t v10 = [(BRCLocalItem *)self st];
  unsigned int v11 = [v10 type];
  if (v11 > 0xA)
  {
    id v16 = brc_bread_crumbs();
    __int16 v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem fileObjectID]();
    }

    uint64_t v9 = 0;
  }
  else
  {
    if (((1 << v11) & 0x639) != 0)
    {
      id v12 = objc_alloc(MEMORY[0x263F325A8]);
      unint64_t dbRowID = self->_dbRowID;
      uint64_t v14 = 3;
    }
    else
    {
      id v12 = objc_alloc(MEMORY[0x263F325A8]);
      unint64_t dbRowID = self->_dbRowID;
      uint64_t v14 = 2;
    }
    uint64_t v9 = (void *)[v12 initWithRowID:dbRowID type:v14];
  }

LABEL_12:
  return (BRFileObjectID *)v9;
}

- (BRFileObjectID)parentFileObjectID
{
  id v3 = [(BRCStatInfo *)self->_st parentID];
  int v4 = [v3 isNonDesktopRoot];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F325A8]);
    id v6 = [(BRCStatInfo *)self->_st parentID];
    uint64_t v7 = [v6 appLibraryRowID];
    uint64_t v8 = [v7 unsignedLongLongValue];
    uint64_t v9 = v5;
    uint64_t v10 = 1;
LABEL_5:
    uint64_t v14 = (void *)[v9 initWithRowID:v8 type:v10];

LABEL_6:
    goto LABEL_7;
  }
  unsigned int v11 = [(BRCStatInfo *)self->_st parentID];
  int v12 = [v11 isDocumentsFolder];

  if (v12)
  {
    id v13 = objc_alloc(MEMORY[0x263F325A8]);
    id v6 = [(BRCStatInfo *)self->_st parentID];
    uint64_t v7 = [v6 appLibraryRowID];
    uint64_t v8 = [v7 unsignedLongLongValue];
    uint64_t v9 = v13;
    uint64_t v10 = 4;
    goto LABEL_5;
  }
  if (![(BRCLocalItem *)self isZoneRoot])
  {
    db = self->_db;
    uint64_t v19 = [(BRCStatInfo *)self->_st parentID];
    id v6 = [(PQLConnection *)db numberWithSQL:@"SELECT rowid FROM client_items WHERE item_id = %@ AND zone_rowid = %@", v19, self->_parentZoneRowID];

    if (v6)
    {
      uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x263F325A8]), "initWithRowID:type:", objc_msgSend(v6, "unsignedLongLongValue"), 3);
    }
    else
    {
      v20 = brc_bread_crumbs();
      __int16 v21 = brc_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
        -[BRCLocalItem parentFileObjectID]();
      }

      uint64_t v14 = 0;
    }
    goto LABEL_6;
  }
  id v16 = brc_bread_crumbs();
  __int16 v17 = brc_default_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
    -[BRCLocalItem parentFileObjectID]();
  }

  uint64_t v14 = 0;
LABEL_7:
  return (BRFileObjectID *)v14;
}

- (NSNumber)fileID
{
  if ([(BRCLocalItem *)self isDocument])
  {
    id v3 = [(BRCLocalItem *)self asDocument];
    int v4 = [v3 fileIDForUpload];
  }
  else
  {
    int v4 = 0;
  }
  return (NSNumber *)v4;
}

- (void)_refreshAppLibraryFromParent
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: hierarchy too deep to compute the app library root of %@%@");
}

- (BRCAppLibrary)appLibrary
{
  appLibrary = self->_appLibrary;
  if (!appLibrary)
  {
    [(BRCLocalItem *)self _refreshAppLibraryFromParent];
    appLibrary = self->_appLibrary;
  }
  int v4 = appLibrary;
  return v4;
}

- (BRCClientZone)parentClientZone
{
  v2 = [(BRCAccountSessionFPFS *)self->_session serverZoneByRowID:self->_parentZoneRowID];
  id v3 = [v2 clientZone];

  return (BRCClientZone *)v3;
}

- (BOOL)isKnownByServer
{
  if ([(BRCLocalItem *)self hasValidCKInfo]) {
    return 1;
  }
  knownByServer = self->_knownByServer;
  if (!knownByServer)
  {
    itemID = self->_itemID;
    db = self->_db;
    uint64_t v7 = [(BRCClientZone *)self->_clientZone dbRowID];
    uint64_t v8 = [(PQLConnection *)db numberWithSQL:@"SELECT 1 FROM server_items WHERE item_id = %@ AND zone_rowid = %@ LIMIT 1", itemID, v7];
    uint64_t v9 = self->_knownByServer;
    self->_knownByServer = v8;

    knownByServer = self->_knownByServer;
    if (!knownByServer)
    {
      self->_knownByServer = (NSNumber *)MEMORY[0x263EFFA80];

      knownByServer = self->_knownByServer;
    }
  }
  return [(NSNumber *)knownByServer BOOLValue];
}

- (BOOL)isKnownByServerOrInFlight
{
  id v3 = [(BRCAccountSessionFPFS *)self->_session syncUpScheduler];
  char v4 = [v3 isItemInSyncUpAndInFlight:self];

  if (v4) {
    return 1;
  }
  return [(BRCLocalItem *)self isKnownByServer];
}

- (BOOL)isDeadOrMissingInServerTruth
{
  itemID = self->_itemID;
  db = self->_db;
  char v4 = [(BRCClientZone *)self->_clientZone dbRowID];
  id v5 = [(PQLConnection *)db numberWithSQL:@"SELECT 1 FROM server_items WHERE item_id = %@ AND item_state = 0 AND zone_rowid = %@ LIMIT 1", itemID, v4];
  LOBYTE(itemID) = [v5 BOOLValue] ^ 1;

  return (char)itemID;
}

- (BRCItemID)serverPathMatchItemID
{
  id serverPathMatchID = self->_serverPathMatchID;
  if (!serverPathMatchID)
  {
    db = self->_db;
    itemID = self->_itemID;
    id v6 = [(BRCStatInfo *)self->_st parentID];
    uint64_t v7 = [(BRCLocalStatInfo *)self->_st logicalNameWithoutLocalBounce];
    uint64_t v8 = [(BRCClientZone *)self->_clientZone dbRowID];
    id v9 = [(PQLConnection *)db itemIDWithSQL:@"SELECT item_id FROM server_items WHERE item_id != %@ AND item_parent_id = %@ AND item_filename = %@ AND +zone_rowid = %@", itemID, v6, v7, v8];
    id v10 = self->_serverPathMatchID;
    self->_id serverPathMatchID = v9;

    id serverPathMatchID = self->_serverPathMatchID;
    if (!serverPathMatchID)
    {
      unsigned int v11 = [MEMORY[0x263EFF9D0] null];
      id v12 = self->_serverPathMatchID;
      self->_id serverPathMatchID = v11;

      id serverPathMatchID = self->_serverPathMatchID;
    }
  }
  id v13 = [MEMORY[0x263EFF9D0] null];

  if (serverPathMatchID == v13) {
    id v14 = 0;
  }
  else {
    id v14 = self->_serverPathMatchID;
  }
  return (BRCItemID *)v14;
}

- (BOOL)isNewToServer:(BOOL *)a3
{
  id v5 = [(BRCLocalItem *)self st];
  id v6 = [v5 ckInfo];
  uint64_t v7 = [v6 etag];

  if (v7)
  {
    BOOL result = [(BRCLocalItem *)self isDeadOrMissingInServerTruth];
    if (!a3) {
      return result;
    }
  }
  else
  {
    BOOL result = 1;
    if (!a3) {
      return result;
    }
  }
  *a3 = v7 == 0;
  return result;
}

- (BOOL)isLive
{
  return [(BRCStatInfo *)self->_st state] == 0;
}

- (BOOL)isDead
{
  return [(BRCStatInfo *)self->_st state] == 1;
}

- (BOOL)isAlmostDead
{
  int v3 = [(BRCStatInfo *)self->_st state];
  if (v3 != 1) {
    LOBYTE(v3) = [(BRCStatInfo *)self->_st state] == -3;
  }
  return v3;
}

- (BOOL)isLost
{
  return [(BRCStatInfo *)self->_st state] == -3;
}

- (BOOL)isOnDisk
{
  return [(BRCStatInfo *)self->_st state] == 0;
}

- (BOOL)isBRAlias
{
  return 0;
}

- (BOOL)isDirectory
{
  return 0;
}

- (BOOL)isDirectoryFault
{
  return 0;
}

- (BOOL)isDirectoryWithPackageName
{
  return 0;
}

- (BOOL)isPackage
{
  return 0;
}

- (BOOL)isDocument
{
  return 0;
}

- (BOOL)isZoneRoot
{
  return 0;
}

- (BOOL)isFSRoot
{
  return [(BRCStatInfo *)self->_st type] == 4;
}

- (BOOL)isSymLink
{
  return 0;
}

- (BOOL)isFinderBookmark
{
  return 0;
}

- (BOOL)isShareAcceptationFault
{
  return 0;
}

- (BOOL)isSharedToMe
{
  if ([(BRCLocalItem *)self isSharedToMeTopLevelItem]) {
    return 1;
  }
  return [(BRCLocalItem *)self isSharedToMeChildItem];
}

- (BOOL)isSharedToMeTopLevelItem
{
  BOOL v3 = [(BRCClientZone *)self->_clientZone isSharedZone];
  if (v3) {
    return (LOBYTE(self->_sharingOptions) >> 2) & 1;
  }
  return v3;
}

- (BOOL)isSharedToMeChildItem
{
  BOOL v3 = [(BRCClientZone *)self->_clientZone isSharedZone];
  if (v3) {
    LOBYTE(v3) = (self->_sharingOptions & 4) == 0;
  }
  return v3;
}

- (BRCSharedToMeTopLevel)asSharedToMeTopLevelItem
{
  if ([(BRCLocalItem *)self isSharedToMeTopLevelItem])
  {
    BOOL v3 = self;
  }
  else
  {
    char v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem asSharedToMeTopLevelItem]();
    }

    BOOL v3 = 0;
  }
  return (BRCSharedToMeTopLevel *)v3;
}

- (BOOL)isOwnedByMe
{
  return ![(BRCClientZone *)self->_clientZone isSharedZone];
}

- (BOOL)isSharedByMe
{
  BOOL v3 = [(BRCLocalItem *)self isOwnedByMe];
  if (v3)
  {
    LOBYTE(v3) = [(BRCLocalItem *)self isShared];
  }
  return v3;
}

- (BOOL)isShared
{
  return (self->_sharingOptions & 0x48) != 0;
}

- (BOOL)isTopLevelSharedItem
{
  return (self->_sharingOptions & 4) != 0 && [(BRCLocalItem *)self isShared];
}

- (BOOL)isChildSharedItem
{
  return (self->_sharingOptions & 4) == 0 && [(BRCLocalItem *)self isShared];
}

- (BOOL)hasShareIDAndIsOwnedByMe
{
  return 0;
}

- (NSString)collaborationIdentifierIfComputable
{
  return 0;
}

- (BOOL)isDocumentBeingCopiedToNewZone
{
  return 0;
}

- (BOOL)isCrossZoneMoveTombstone
{
  return 0;
}

- (BOOL)shouldUseEnhancedDrivePrivacyWhenNeedsPreserving:(BOOL)a3
{
  if (a3)
  {
    BOOL v3 = +[BRCUserDefaults defaultsForMangledID:0];
    char v4 = [v3 supportsEnhancedDrivePrivacy];

    return v4;
  }
  else
  {
    clientZone = self->_clientZone;
    return [(BRCClientZone *)clientZone enhancedDrivePrivacyEnabled];
  }
}

- (void)inheritOSUpgradeNeededFromItem:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  char v4 = (id *)a3;
  if (!v4[13])
  {
    id v10 = brc_bread_crumbs();
    unsigned int v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem inheritOSUpgradeNeededFromItem:]();
    }
  }
  p_minimumSupportedOSRowID = &self->_minimumSupportedOSRowID;
  if (self->_minimumSupportedOSRowID)
  {
    id v12 = brc_bread_crumbs();
    id v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem inheritOSUpgradeNeededFromItem:]();
    }
  }
  id v6 = brc_bread_crumbs();
  uint64_t v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = [(BRCLocalItem *)self itemID];
    id v9 = v4[13];
    int v14 = 138412802;
    __int16 v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    __int16 v18 = 2112;
    uint64_t v19 = v6;
    _os_log_debug_impl(&dword_23FA42000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: inheriting %@ minimum supported OS%@", (uint8_t *)&v14, 0x20u);
  }
  objc_storeStrong((id *)p_minimumSupportedOSRowID, v4[13]);
}

- (BOOL)needsOSUpgradeToSyncUp
{
  return self->_minimumSupportedOSRowID != 0;
}

- (id)osNameNeededToSyncUp
{
  if (self->_minimumSupportedOSRowID) {
    id v2 = [(BRCPQLConnection *)self->_db fetchObjectOfClass:objc_opt_class(), @"SELECT name FROM os_names WHERE rowid = %@", self->_minimumSupportedOSRowID sql];
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)markNeedsOSUpgradeToSyncUpWithName:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v12 = self;
    __int16 v13 = 2112;
    id v14 = v4;
    __int16 v15 = 2112;
    __int16 v16 = v5;
    _os_log_debug_impl(&dword_23FA42000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ needs %@ to sync-up%@", buf, 0x20u);
  }

  if (![(BRCPQLConnection *)self->_db execute:@"INSERT OR IGNORE INTO os_names (name) VALUES (%@)", v4])
  {
    uint64_t v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem markNeedsOSUpgradeToSyncUpWithName:]();
    }
  }
  id v9 = [(PQLConnection *)self->_db numberWithSQL:@"SELECT rowid FROM os_names WHERE name = %@", v4];
  minimumSupportedOSRowID = self->_minimumSupportedOSRowID;
  self->_minimumSupportedOSRowID = v9;
}

- (id)descriptionWithContext:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithCapacity:128];
  objc_msgSend(v5, "appendFormat:", @"r:%lld ", self->_dbRowID);
  if (v4)
  {
    id v6 = +[BRCDumpContext stringFromItemID:self->_itemID context:v4];
    [v5 appendFormat:@"i:%@ ", v6];
  }
  else
  {
    id v6 = [(BRCClientZone *)self->_clientZone mangledID];
    uint64_t v7 = [(BRCItemID *)self->_itemID debugItemIDString];
    [v5 appendFormat:@"i:%@:%@ ", v6, v7];
  }
  uint64_t v8 = [(BRCAppLibrary *)self->_appLibrary dbRowID];
  [v5 appendFormat:@"al:%@ ", v8];

  if ([(BRCUserRowID *)self->_ownerKey BOOLValue]) {
    [v5 appendFormat:@"o:%@ ", self->_ownerKey];
  }
  id v9 = [(BRCLocalItem *)self fileObjectID];
  [v5 appendFormat:@"foid:%@ ", v9];

  if (self->_localDiffs)
  {
    id v10 = BRCItemFieldsPrettyPrint();
    [v5 appendFormat:@"ld{%@} ", v10];
  }
  unsigned int v11 = BRCPrettyPrintEnumWithContext(self->_syncUpState, (uint64_t)&brc_sync_up_state_pretty_entries, v4);
  [v5 appendFormat:@"up:%@", v11];

  if (self->_minimumSupportedOSRowID)
  {
    id v12 = +[BRCDumpContext highlightedString:@"needs-os-upgrade" type:3 context:v4];
    [v5 appendFormat:@" %@:%@", v12, self->_minimumSupportedOSRowID];
  }
  objc_msgSend(v5, "appendFormat:", @" uv:%d", self->_isUserVisible);
  if ([(BRCLocalItem *)self isDirectory])
  {
    __int16 v13 = [(BRCLocalItem *)self asDirectory];
    objc_msgSend(v5, "appendFormat:", @" mt:%lld", objc_msgSend(v13, "mtime"));
  }
  parentZoneRowID = self->_parentZoneRowID;
  __int16 v15 = [(BRCClientZone *)self->_clientZone dbRowID];
  LOBYTE(parentZoneRowID) = [(BRCZoneRowID *)parentZoneRowID br_isEqualToNumber:v15];

  if ((parentZoneRowID & 1) == 0) {
    [v5 appendFormat:@" pzone:%@", self->_parentZoneRowID];
  }
  sideCarCKInfo = self->_sideCarCKInfo;
  if (sideCarCKInfo)
  {
    uint64_t v17 = [(BRFieldCKInfo *)sideCarCKInfo etag];
    [v5 appendFormat:@" ppm:%@", v17];
  }
  __int16 v18 = [(BRCLocalStatInfo *)self->_st descriptionWithContext:v4 origName:0];
  [v5 appendFormat:@" st{%@", v18];

  if (self->_parentFileID) {
    [v5 appendFormat:@" pino:%@", self->_parentFileID];
  }
  [v5 appendString:@"}"];
  if (self->_sharingOptions)
  {
    uint64_t v19 = BRCPrettyPrintBitmap();
    [v5 appendFormat:@" sharing-options:{%@}", v19];
  }
  return v5;
}

- (NSString)description
{
  return (NSString *)[(BRCLocalItem *)self descriptionWithContext:0];
}

- (NSString)debugDescription
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  itemID = self->_itemID;
  id v6 = [(BRCLocalStatInfo *)self->_st filename];
  uint64_t v7 = [v3 stringWithFormat:@"<%@:%p {ID : %@; name : %@}>", v4, self, itemID, v6];

  return (NSString *)v7;
}

- (NSString)digestDescription
{
  BOOL v3 = NSString;
  uint64_t v4 = [(BRCLocalStatInfo *)self->_st filename];
  id v5 = [v3 stringWithFormat:@"\"%@\" id:%@", v4, self->_itemID];

  return (NSString *)v5;
}

- (id)_initWithServerItem:(id)a3 dbRowID:(unint64_t)a4
{
  id v6 = a3;
  v33.receiver = self;
  v33.super_class = (Class)BRCLocalItem;
  uint64_t v7 = [(BRCLocalItem *)&v33 init];
  uint64_t v8 = v7;
  if (v7)
  {
    v7->_unint64_t dbRowID = a4;
    uint64_t v9 = [v6 itemID];
    itemID = v8->_itemID;
    v8->_itemID = (BRCItemID *)v9;

    uint64_t v11 = [v6 ownerKey];
    ownerKey = v8->_ownerKey;
    v8->_ownerKey = (BRCUserRowID *)v11;

    __int16 v13 = [v6 sideCarInfo];
    uint64_t v14 = [v13 ckInfo];
    sideCarCKInfo = v8->_sideCarCKInfo;
    v8->_sideCarCKInfo = (BRFieldCKInfo *)v14;

    v8->_sharingOptions = [v6 sharingOptions];
    v8->_serverZone = (BRCServerZone *)(id)[v6 serverZone];
    uint64_t v16 = [v6 clientZone];
    clientZone = v8->_clientZone;
    v8->_clientZone = (BRCClientZone *)v16;

    uint64_t v18 = [(BRCClientZone *)v8->_clientZone db];
    db = v8->_db;
    v8->_db = (BRCPQLConnection *)v18;

    v8->_session = (BRCAccountSessionFPFS *)(id)[v6 session];
    uint64_t v20 = [BRCLocalStatInfo alloc];
    __int16 v21 = [v6 st];
    uint64_t v22 = [(BRCStatInfo *)v20 initWithStatInfo:v21];
    st = v8->_st;
    v8->_st = (BRCLocalStatInfo *)v22;

    BOOL v24 = [v6 parentItemIDOnFS];
    [(BRCStatInfo *)v8->_st setParentID:v24];

    v25 = [v6 parentZoneOnFS];
    uint64_t v26 = [v25 dbRowID];
    parentZoneRowID = v8->_parentZoneRowID;
    v8->_parentZoneRowID = (BRCZoneRowID *)v26;

    uint64_t v28 = [v6 predictedAppLibrary];
    appLibrary = v8->_appLibrary;
    v8->_appLibrary = (BRCAppLibrary *)v28;

    [(BRCLocalItem *)v8 _recomputeUserVisibleAndItemScope];
    uint64_t v30 = [(BRCLocalItem *)v8 copy];
    orig = v8->_orig;
    v8->_orig = (BRCLocalItem *)v30;
  }
  return v8;
}

- (id)_initWithLocalItem:(id)a3
{
  uint64_t v4 = (id *)a3;
  v10.receiver = self;
  v10.super_class = (Class)BRCLocalItem;
  id v5 = [(BRCLocalItem *)&v10 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_clientZone, v4[3]);
    objc_storeStrong((id *)&v6->_db, v4[4]);
    objc_storeStrong((id *)&v6->_sideCarCKInfo, v4[20]);
    objc_storeStrong((id *)&v6->_appLibrary, v4[5]);
    v6->_serverZone = (BRCServerZone *)v4[2];
    v6->_session = (BRCAccountSessionFPFS *)v4[1];
    v6->_unint64_t dbRowID = (unint64_t)v4[15];
    objc_storeStrong((id *)&v6->_itemID, v4[6]);
    objc_storeStrong((id *)&v6->_parentFileID, v4[19]);
    uint64_t v7 = [v4[9] copy];
    st = v6->_st;
    v6->_st = (BRCLocalStatInfo *)v7;

    objc_storeStrong((id *)&v6->_parentZoneRowID, v4[7]);
    v6->_syncUpState = *((_DWORD *)v4 + 20);
    objc_storeStrong((id *)&v6->_ownerKey, v4[8]);
    v6->_sharingOptions = (unint64_t)v4[17];
    objc_storeStrong((id *)&v6->_orig, v4[11]);
    v6->_unint64_t localDiffs = (unint64_t)v4[12];
    objc_storeStrong((id *)&v6->_parentZoneRowID, v4[7]);
    objc_storeStrong((id *)&v6->_minimumSupportedOSRowID, v4[13]);
    v6->_isUserVisible = *((unsigned char *)v4 + 112);
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 _initWithLocalItem:self];
}

- (id)initFromPQLResultSet:(id)a3 error:(id *)a4
{
  id v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    -[BRCLocalItem initFromPQLResultSet:error:]();
  }

  return 0;
}

- (id)_initFromPQLResultSet:(id)a3 session:(id)a4 db:(id)a5 error:(id *)a6
{
  id v9 = a3;
  objc_super v10 = (BRCAccountSessionFPFS *)a4;
  id v11 = a5;
  v34.receiver = self;
  v34.super_class = (Class)BRCLocalItem;
  id v12 = [(BRCLocalItem *)&v34 init];
  __int16 v13 = v12;
  if (v12)
  {
    v12->_session = v10;
    v12->_unint64_t dbRowID = [v9 unsignedLongAtIndex:0];
    uint64_t v14 = [v9 numberAtIndex:1];
    v13->_serverZone = (BRCServerZone *)[(BRCAccountSessionFPFS *)v10 serverZoneByRowID:v14];

    uint64_t v15 = [(BRCServerZone *)v13->_serverZone clientZone];
    clientZone = v13->_clientZone;
    v13->_clientZone = (BRCClientZone *)v15;

    objc_storeStrong((id *)&v13->_db, a5);
    uint64_t v17 = [v9 objectOfClass:objc_opt_class() atIndex:2];
    itemID = v13->_itemID;
    v13->_itemID = (BRCItemID *)v17;

    uint64_t v19 = [v9 numberAtIndex:3];
    ownerKey = v13->_ownerKey;
    v13->_ownerKey = (BRCUserRowID *)v19;

    v13->_sharingOptions = [v9 integerAtIndex:4];
    uint64_t v21 = [v9 objectOfClass:objc_opt_class() atIndex:5];
    sideCarCKInfo = v13->_sideCarCKInfo;
    v13->_sideCarCKInfo = (BRFieldCKInfo *)v21;

    uint64_t v23 = [v9 numberAtIndex:6];
    parentZoneRowID = v13->_parentZoneRowID;
    v13->_parentZoneRowID = (BRCZoneRowID *)v23;

    v13->_syncUpState = [v9 unsignedIntAtIndex:7];
    v13->_unint64_t localDiffs = [v9 unsignedLongLongAtIndex:8];
    v13->_notifsRank = [v9 longLongAtIndex:9];
    v25 = [v9 numberAtIndex:10];
    uint64_t v26 = [v9 numberAtIndex:11];
    minimumSupportedOSRowID = v13->_minimumSupportedOSRowID;
    v13->_minimumSupportedOSRowID = (NSNumber *)v26;

    v13->_isUserVisible = [v9 BOOLAtIndex:12];
    uint64_t v28 = [[BRCLocalStatInfo alloc] initFromResultSet:v9 pos:13];
    st = v13->_st;
    v13->_st = v28;

    if (v25)
    {
      uint64_t v30 = [(BRCAccountSessionFPFS *)v10 appLibraryByRowID:v25];
      appLibrary = v13->_appLibrary;
      v13->_appLibrary = (BRCAppLibrary *)v30;
    }
    else
    {
      appLibrary = brc_bread_crumbs();
      unint64_t v32 = brc_default_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
        -[BRCLocalItem _initFromPQLResultSet:session:db:error:]();
      }
    }
  }

  return v13;
}

- (id)initFromPQLResultSet:(id)a3 session:(id)a4 db:(id)a5 error:(id *)a6
{
  id v6 = [(BRCLocalItem *)self _initFromPQLResultSet:a3 session:a4 db:a5 error:a6];
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 copy];
    id v9 = (void *)v7[11];
    v7[11] = v8;
  }
  return v7;
}

- (BOOL)validateLoggingToFile:(__sFILE *)a3
{
  return [(BRCStatInfo *)self->_st check:self->_itemID logToFile:a3];
}

- (BRCItemGlobalID)itemGlobalID
{
  BOOL v3 = [BRCItemGlobalID alloc];
  uint64_t v4 = [(BRCClientZone *)self->_clientZone dbRowID];
  id v5 = [(BRCItemGlobalID *)v3 initWithZoneRowID:v4 itemID:self->_itemID];

  return v5;
}

- (id)itemParentGlobalID
{
  BOOL v3 = [BRCItemGlobalID alloc];
  uint64_t v4 = [(BRCLocalItem *)self parentClientZone];
  id v5 = [v4 dbRowID];
  id v6 = [(BRCStatInfo *)self->_st parentID];
  uint64_t v7 = [(BRCItemGlobalID *)v3 initWithZoneRowID:v5 itemID:v6];

  return v7;
}

- (id)sideCarInfo
{
  if ([(BRCLocalItem *)self isSharedToMeChildItem])
  {
    BOOL v3 = objc_alloc_init(BRCSideCarInfo);
    [(BRCSideCarInfo *)v3 setLastUsedTime:[(BRCStatInfo *)self->_st lastUsedTime]];
    [(BRCSideCarInfo *)v3 setFavoriteRank:[(BRCStatInfo *)self->_st favoriteRank]];
    uint64_t v4 = [(BRCStatInfo *)self->_st finderTags];
    [(BRCSideCarInfo *)v3 setFinderTags:v4];

    [(BRCSideCarInfo *)v3 setCkInfo:self->_sideCarCKInfo];
  }
  else
  {
    id v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem sideCarInfo]();
    }

    BOOL v3 = 0;
  }
  return v3;
}

- (id)parentItemIDInZone
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  BOOL v3 = [(BRCLocalItem *)self itemID];
  int v4 = [v3 isNonDesktopRoot];

  if (v4)
  {
    uint64_t v20 = brc_bread_crumbs();
    uint64_t v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem parentItemIDInZone]();
    }
  }
  if ([(BRCLocalItem *)self isSharedToMeTopLevelItem])
  {
    id v5 = [BRCItemID alloc];
    id v6 = [(BRCServerZone *)self->_serverZone dbRowID];
    id v7 = [(BRCItemID *)v5 _initAsZoneRootWithZoneRowID:v6];

    if (v7) {
      goto LABEL_4;
    }
LABEL_9:
    objc_super v10 = brc_bread_crumbs();
    id v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem parentItemIDInZone]();
    }

    goto LABEL_18;
  }
  id v7 = [(BRCStatInfo *)self->_st parentID];
  if (!v7) {
    goto LABEL_9;
  }
LABEL_4:
  if ([v7 isNonDesktopRoot]
    || (unsigned int v8 = [(BRCClientZone *)self->_clientZone itemTypeByItemID:v7 db:self->_db], v8 <= 0xA)
    && ((1 << v8) & 0x611) != 0)
  {
    id v9 = v7;
    goto LABEL_19;
  }
  if (v8 == 255)
  {
    id v12 = brc_bread_crumbs();
    __int16 v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      uint64_t v14 = [(BRCItemID *)self->_itemID debugItemIDString];
      uint64_t v15 = [v7 debugItemIDString];
      clientZone = self->_clientZone;
      int v22 = 138413058;
      uint64_t v23 = v14;
      __int16 v24 = 2112;
      v25 = v15;
      __int16 v26 = 2112;
      v27 = clientZone;
      __int16 v28 = 2112;
      id v29 = v12;
      _os_log_fault_impl(&dword_23FA42000, v13, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: orphan detected %@ under parent %@ in %@%@", (uint8_t *)&v22, 0x2Au);
    }
  }
  else
  {
    id v12 = brc_bread_crumbs();
    __int16 v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      uint64_t v18 = [v7 debugItemIDString];
      BRCPrettyPrintEnumWithContext((int)v8, (uint64_t)&brc_item_type_pretty_entries, 0);
      uint64_t v19 = (BRCClientZone *)objc_claimAutoreleasedReturnValue();
      int v22 = 138413058;
      uint64_t v23 = self;
      __int16 v24 = 2112;
      v25 = v18;
      __int16 v26 = 2112;
      v27 = v19;
      __int16 v28 = 2112;
      id v29 = v12;
      _os_log_fault_impl(&dword_23FA42000, v13, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: item parented to a document: %@ parented to %@ type %@%@", (uint8_t *)&v22, 0x2Au);
    }
  }

LABEL_18:
  id v9 = 0;
LABEL_19:

  return v9;
}

- (id)parentItemOnFS
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if ([(BRCLocalItem *)self isFSRoot])
  {
    BOOL v3 = brc_bread_crumbs();
    int v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem parentItemOnFS]();
    }
    id v5 = 0;
  }
  else
  {
    id v6 = [(BRCClientZone *)self->_clientZone parentsOfCZMFaults];
    id v7 = [v6 objectForKeyedSubscript:self->_itemID];

    if (v7 && ![(BRCPQLConnection *)self->_db isReadonly])
    {
      objc_super v10 = brc_bread_crumbs();
      id v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        itemID = self->_itemID;
        int v24 = 138412802;
        v25 = v7;
        __int16 v26 = 2112;
        v27 = itemID;
        __int16 v28 = 2112;
        id v29 = v10;
        _os_log_debug_impl(&dword_23FA42000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] Using parent %@ for %@ because it's in the CZM fault list%@", (uint8_t *)&v24, 0x20u);
      }

      BOOL v3 = [(BRCLocalItem *)v7 itemID];
      session = self->_session;
      __int16 v13 = [(BRCLocalItem *)v7 zoneRowID];
      int v4 = [(BRCAccountSessionFPFS *)session serverZoneByRowID:v13];
    }
    else
    {
      BOOL v3 = [(BRCStatInfo *)self->_st parentID];
      if (!v3)
      {
        unsigned int v8 = brc_bread_crumbs();
        id v9 = brc_default_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
          -[BRCLocalItem parentItemOnFS]();
        }
      }
      int v4 = [(BRCAccountSessionFPFS *)self->_session serverZoneByRowID:self->_parentZoneRowID];
    }
    uint64_t v14 = [v4 clientZone];
    uint64_t v15 = [v14 itemByItemID:v3 db:self->_db];

    if (!v15)
    {
      uint64_t v16 = brc_bread_crumbs();
      uint64_t v17 = brc_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        uint64_t v21 = [(BRCItemID *)self->_itemID debugItemIDString];
        int v22 = [v3 debugItemIDString];
        int v24 = 138413058;
        v25 = v21;
        __int16 v26 = 2112;
        v27 = v22;
        __int16 v28 = 2112;
        id v29 = v4;
        __int16 v30 = 2112;
        __int16 v31 = v16;
        _os_log_fault_impl(&dword_23FA42000, v17, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: orphan detected %@ under parent %@ in %@%@", (uint8_t *)&v24, 0x2Au);
      }
    }
    if ([(BRCItemID *)v15 isDocument])
    {
      uint64_t v18 = brc_bread_crumbs();
      uint64_t v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        int v24 = 138412802;
        v25 = self;
        __int16 v26 = 2112;
        v27 = v15;
        __int16 v28 = 2112;
        id v29 = v18;
        _os_log_fault_impl(&dword_23FA42000, v19, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: item parented to a document: %@ parented to %@%@", (uint8_t *)&v24, 0x20u);
      }

      uint64_t v15 = 0;
    }
    id v5 = [(BRCItemID *)v15 asDirectory];
  }
  return v5;
}

- (void)_updateAppLibraryPristineStatesAfterMarkingDead
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] remove documents folder%@", v2, v3, v4, v5, v6);
}

- (void)_updateAppLibraryPristineStatesAfterCreationOrUpdate
{
  if (![(BRCLocalItem *)self isFSRoot] && [(BRCLocalItem *)self isLive])
  {
    uint64_t v3 = [(BRCLocalItem *)self appLibrary];
    if (v3)
    {
      id v10 = v3;
      uint64_t v4 = [(BRCLocalItem *)self appLibrary];
      uint64_t v5 = [v4 dbRowID];
      uint8_t v6 = +[BRCItemID documentsItemIDWithAppLibraryRowID:v5];

      id v7 = [(BRCStatInfo *)self->_st parentID];
      LODWORD(v5) = [v7 isEqualToItemID:v6];

      if (v5)
      {
        [v10 didCreateDocumentScopedItem];
      }
      else if (![(BRCItemID *)self->_itemID isEqualToItemID:v6])
      {
        unsigned int v8 = [(BRCStatInfo *)self->_st parentID];
        int v9 = [v8 isNonDesktopRoot];

        if (v9) {
          [v10 didCreateDataScopedItem];
        }
      }

      uint64_t v3 = v10;
    }
  }
}

- (unint64_t)metadataSyncUpMask:(BOOL)a3
{
  if ([(BRCLocalItem *)self isSharedToMeTopLevelItem]) {
    unint64_t v4 = 33430122;
  }
  else {
    unint64_t v4 = 33439742;
  }
  uint64_t v5 = [(BRCClientZone *)self->_clientZone mangledID];
  uint8_t v6 = +[BRCUserDefaults defaultsForMangledID:v5];
  int v7 = [v6 stripBirthtimeFromSyncUpMaskOnDocuments];

  if (v7)
  {
    unsigned int v8 = [(BRCLocalItem *)self itemID];
    int v9 = [v8 isDocumentsFolder];

    if (v9) {
      return v4 & 0x1FE3FEE;
    }
  }
  return v4;
}

- (unint64_t)maskForDiffsToSyncUpForZone:(id)a3 sideCarZone:(BOOL)a4 whenClearing:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  if ([(BRCLocalItem *)self isSharedToMeTopLevelItem])
  {
    int v9 = [v8 isPrivateZone];
    unint64_t v10 = 0xFCFF00BFF2FB0002;
    if (v5) {
      unint64_t v10 = 0xFCFF00BFF3FF0002;
    }
    if (v9) {
      unint64_t v11 = 32765;
    }
    else {
      unint64_t v11 = v10;
    }
  }
  else
  {
    BOOL v12 = [(BRCLocalItem *)self isSharedToMeChildItem];
    unint64_t v13 = 6656;
    if (!v6) {
      unint64_t v13 = 0xFCFF00BFF3FF65FFLL;
    }
    if (v12) {
      unint64_t v11 = v13;
    }
    else {
      unint64_t v11 = 0xFCFF00BFF3FF7FFFLL;
    }
  }

  return v11;
}

- (void)createSyncUpJob
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _db.isBatchSuspended%@", v2, v3, v4, v5, v6);
}

- (id)unsaltedBookmarkData
{
  uint64_t v3 = NSString;
  uint64_t v4 = [(BRCItemID *)self->_itemID itemIDString];
  uint64_t v5 = [(BRCServerZone *)self->_serverZone mangledID];
  uint8_t v6 = [v3 unsaltedBookmarkDataWithItemResolutionString:v4 serverZoneMangledID:v5];

  return v6;
}

- (id)_syncZoneRowIDs
{
  v17[2] = *MEMORY[0x263EF8340];
  if ([(BRCLocalItem *)self isSharedToMeTopLevelItem])
  {
    uint64_t v3 = [(BRCLocalItem *)self clientZone];
    uint64_t v4 = [v3 dbRowID];
    v17[0] = v4;
    uint64_t v5 = [(BRCLocalItem *)self parentClientZone];
    uint8_t v6 = [v5 dbRowID];
    v17[1] = v6;
    int v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
  }
  else
  {
    BOOL v8 = [(BRCLocalItem *)self isSharedToMeChildItem];
    uint64_t v3 = [(BRCLocalItem *)self clientZone];
    uint64_t v9 = [v3 dbRowID];
    uint64_t v4 = (void *)v9;
    if (v8)
    {
      uint64_t v15 = v9;
      uint64_t v16 = &unk_26F3DD190;
      unint64_t v10 = (void *)MEMORY[0x263EFF8C0];
      unint64_t v11 = &v15;
      uint64_t v12 = 2;
    }
    else
    {
      uint64_t v14 = v9;
      unint64_t v10 = (void *)MEMORY[0x263EFF8C0];
      unint64_t v11 = &v14;
      uint64_t v12 = 1;
    }
    int v7 = objc_msgSend(v10, "arrayWithObjects:count:", v11, v12, v14, v15, v16);
  }

  return v7;
}

- (void)_updateSyncUpSchedulerWithDiffs:(unint64_t)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  if ((a3 & 0x20000000000000) == 0
    && (![(BRCLocalItem *)self isSharedToMe] || self->_syncUpState != 4))
  {
    clientZone = self->_clientZone;
    uint64_t v5 = [(BRCLocalItem *)self->_orig clientZone];
    LOBYTE(clientZone) = [(BRCClientZone *)clientZone isEqualToClientZone:v5];

    if (clientZone)
    {
      if ([(BRCLocalItem *)self->_orig syncUpState] == 4 && self->_syncUpState != 4)
      {
        uint8_t v6 = brc_bread_crumbs();
        int v7 = brc_default_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
          -[BRCLocalItem _updateSyncUpSchedulerWithDiffs:]();
        }

        goto LABEL_40;
      }
      return;
    }
  }
  BOOL v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[BRCLocalItem _updateSyncUpSchedulerWithDiffs:]();
  }

  unsigned int syncUpState = self->_syncUpState;
  if (!syncUpState)
  {
    uint8_t v6 = [(BRCAccountSessionFPFS *)self->_session syncUpScheduler];
    [v6 deleteSyncUpJobsForItem:self];
    goto LABEL_40;
  }
  if (syncUpState == 4)
  {
    [(BRCLocalItem *)self createSyncUpJob];
    return;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  unint64_t v11 = [(BRCLocalItem *)self _syncZoneRowIDs];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v41 count:16];
  if (!v12)
  {
    char v15 = 0;
    goto LABEL_35;
  }
  uint64_t v14 = v12;
  char v15 = 0;
  uint64_t v16 = *(void *)v32;
  *(void *)&long long v13 = 138412290;
  long long v30 = v13;
  do
  {
    uint64_t v17 = 0;
    do
    {
      if (*(void *)v32 != v16) {
        objc_enumerationMutation(v11);
      }
      uint64_t v18 = *(BRCLocalItem **)(*((void *)&v31 + 1) + 8 * v17);
      uint64_t v19 = [(BRCAccountSessionFPFS *)self->_session syncUpScheduler];
      char v20 = [v19 isItemInSyncUpAndInFlight:self inZone:v18];

      if (v20)
      {
        brc_bread_crumbs();
        uint64_t v21 = (BRCLocalItem *)objc_claimAutoreleasedReturnValue();
        char v15 = 1;
        int v22 = brc_default_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          id v36 = v18;
          __int16 v37 = 2112;
          char v38 = v21;
          _os_log_debug_impl(&dword_23FA42000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] Not finishing sync up because item is in-flight in %@%@", buf, 0x16u);
        }
LABEL_24:

        goto LABEL_28;
      }
      uint64_t v23 = brc_bread_crumbs();
      int v24 = brc_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        id v36 = self;
        __int16 v37 = 2112;
        char v38 = v18;
        __int16 v39 = 2112;
        v40 = v23;
        _os_log_debug_impl(&dword_23FA42000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] Finishing sync up for %@ in %@%@", buf, 0x20u);
      }

      v25 = [(BRCAccountSessionFPFS *)self->_session syncUpScheduler];
      uint64_t v26 = [v25 finishSyncUpForItem:self inZone:v18 success:1];

      if (v26)
      {
        brc_bread_crumbs();
        uint64_t v21 = (BRCLocalItem *)objc_claimAutoreleasedReturnValue();
        int v22 = brc_default_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = v30;
          id v36 = v21;
          _os_log_fault_impl(&dword_23FA42000, v22, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: syncUpDiffs == 0%@", buf, 0xCu);
        }
        goto LABEL_24;
      }
LABEL_28:
      ++v17;
    }
    while (v14 != v17);
    uint64_t v27 = [v11 countByEnumeratingWithState:&v31 objects:v41 count:16];
    uint64_t v14 = v27;
  }
  while (v27);
LABEL_35:

  if (self->_syncUpState == 3 && (v15 & 1) == 0)
  {
    __int16 v28 = brc_bread_crumbs();
    id v29 = brc_default_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      -[BRCLocalItem _updateSyncUpSchedulerWithDiffs:]();
    }

    uint8_t v6 = [(BRCAccountSessionFPFS *)self->_session fsUploader];
    [v6 rescheduleSuspendedJobsMatching:self inState:31];
LABEL_40:
  }
}

- (void)_updateSharedZoneBoostingWithDiffs:(unint64_t)a3
{
  if ([(BRCLocalItem *)self isSharedToMeTopLevelItem])
  {
    if ((a3 & 0x40000000000000) != 0
      && [(BRCLocalItem *)self isOnDisk]
      && [(BRCLocalItem *)self->_orig isOnDisk])
    {
      uint64_t v5 = [(BRCLocalItem *)self->_orig appLibrary];
      uint8_t v6 = [(BRCServerZone *)self->_serverZone asSharedZone];
      [v5 _removeTargetSharedServerZoneIfNecessary:v6];

      appLibrary = self->_appLibrary;
      BOOL v8 = [(BRCLocalItem *)self asSharedToMeTopLevelItem];
      [(BRCAppLibrary *)appLibrary _addTargetSharedServerZoneForSharedItem:v8];
    }
    if ([(BRCLocalItem *)self isOnDisk]
      && (![(BRCLocalItem *)self->_orig isOnDisk] || [(BRCLocalItem *)self->_orig needsInsert]))
    {
      uint64_t v9 = self->_appLibrary;
      id v13 = [(BRCLocalItem *)self asSharedToMeTopLevelItem];
      [(BRCAppLibrary *)v9 _addTargetSharedServerZoneForSharedItem:v13];
    }
    else
    {
      if (![(BRCLocalItem *)self->_orig isOnDisk] || [(BRCLocalItem *)self isOnDisk]) {
        return;
      }
      uint64_t v12 = self->_appLibrary;
      id v13 = [(BRCServerZone *)self->_serverZone asSharedZone];
      [(BRCAppLibrary *)v12 _removeTargetSharedServerZoneIfNecessary:v13];
    }
  }
  else
  {
    if (![(BRCLocalItem *)self->_orig isSharedToMeTopLevelItem]) {
      return;
    }
    unint64_t v10 = self->_appLibrary;
    id v13 = [(BRCLocalItem *)self->_orig serverZone];
    unint64_t v11 = [v13 asSharedZone];
    [(BRCAppLibrary *)v10 _removeTargetSharedServerZoneIfNecessary:v11];
  }
}

- (void)wasMarkedDead
{
  id v6 = [(BRCAccountSessionFPFS *)self->_session applyScheduler];
  itemID = self->_itemID;
  uint64_t v4 = [(BRCLocalItem *)self->_orig st];
  uint64_t v5 = [v4 parentID];
  [v6 didReparentOrKillItemID:itemID parentItemID:v5 zone:self->_serverZone];

  [(BRCLocalItem *)self _updateAppLibraryPristineStatesAfterMarkingDead];
}

- (BOOL)_insertInDB:(id)a3 dbRowID:(unint64_t)a4
{
  if (!self->_appLibrary)
  {
    int v7 = brc_bread_crumbs();
    BOOL v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem _refreshAppLibraryFromParent]();
    }
  }
  self->_unint64_t dbRowID = a4;
  [(BRCLocalItem *)self _updateAppLibraryPristineStatesAfterCreationOrUpdate];
  [(BRCLocalItem *)self _updateSyncUpSchedulerWithDiffs:0xFCFF00BFF3FF7FFFLL];
  [(BRCLocalItem *)self _updateSharedZoneBoostingWithDiffs:0];
  return 1;
}

- (BOOL)_updateInDB:(id)a3 diffs:(unint64_t)a4
{
  clientZone = self->_clientZone;
  int v7 = [(BRCLocalItem *)self->_orig clientZone];
  LOBYTE(clientZone) = [(BRCClientZone *)clientZone isEqualToClientZone:v7];

  if ((clientZone & 1) == 0)
  {
    BOOL v8 = brc_bread_crumbs();
    uint64_t v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[BRCLocalItem _updateInDB:diffs:]();
    }

    unint64_t v10 = [(BRCLocalItem *)self itemID];
    unint64_t v11 = [(BRCLocalItem *)self orig];
    uint64_t v12 = [v11 itemID];
    int v13 = [v10 isEqualToItemID:v12];

    if (v13)
    {
      id v43 = brc_bread_crumbs();
      v44 = brc_default_log();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT)) {
        -[BRCLocalItem _updateInDB:diffs:]();
      }
    }
    uint64_t v14 = [(BRCStatInfo *)self->_st ckInfo];
    uint64_t v15 = [v14 etag];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = [(BRCLocalItem *)self->_orig st];
      uint64_t v18 = [v17 ckInfo];
      uint64_t v19 = [v18 etagBeforeCrossZoneMove];
      char v20 = [(BRCStatInfo *)self->_st ckInfo];
      uint64_t v21 = [v20 etag];
      if ([v19 isEqualToString:v21])
      {
      }
      else
      {
        BOOL v22 = [(BRCLocalItem *)self isDirectory];

        if (v22)
        {
LABEL_13:
          uint64_t v23 = [BRCItemDBRowIDAndZoneJobIdentifier alloc];
          unint64_t dbRowID = self->_dbRowID;
          v25 = [(BRCLocalItem *)self->_orig clientZone];
          uint64_t v26 = [v25 dbRowID];
          uint64_t v27 = [(BRCItemDBRowIDAndZoneJobIdentifier *)v23 initWithItemDBRowID:dbRowID zoneRowID:v26];

          __int16 v28 = [(BRCAccountSessionFPFS *)self->_session syncUpScheduler];
          [v28 deleteJobsMatching:v27];

          goto LABEL_14;
        }
        uint64_t v14 = brc_bread_crumbs();
        uint64_t v16 = brc_default_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
          -[BRCLocalItem _updateInDB:diffs:]();
        }
      }
    }
    goto LABEL_13;
  }
LABEL_14:
  if (![(BRCLocalItem *)self->_orig isDead] && [(BRCLocalItem *)self isDead]) {
    [(BRCLocalItem *)self wasMarkedDead];
  }
  if ((a4 & 0x20) != 0)
  {
    id v29 = [(BRCAccountSessionFPFS *)self->_session applyScheduler];
    itemID = self->_itemID;
    long long v31 = [(BRCLocalItem *)self->_orig st];
    long long v32 = [v31 parentID];
    [v29 didReparentOrKillItemID:itemID parentItemID:v32 zone:self->_serverZone];
  }
  if (![(BRCLocalItem *)self->_orig isRejected] && [(BRCLocalItem *)self isRejected])
  {
    long long v33 = [(BRCAccountSessionFPFS *)self->_session applyScheduler];
    [v33 createApplyJobFromServerItem:0 localItem:self state:1 kind:0];
  }
  if ([(BRCLocalItem *)self->_orig isMigratingToFPFS])
  {
    if (![(BRCLocalItem *)self isMigratingToFPFS])
    {
      int64_t v34 = [(BRCClientZone *)self->_clientZone serverRankByItemID:self->_itemID];
      if (v34)
      {
        int64_t v35 = v34;
        id v36 = [(BRCAccountSessionFPFS *)self->_session applyScheduler];
        __int16 v37 = [(BRCServerZone *)self->_serverZone dbRowID];
        [v36 rescheduleItemRank:v35 zoneRowID:v37 matchingState:15];
      }
    }
  }
  if ([(BRCLocalItem *)self isIdleOrRejected])
  {
    if (![(BRCLocalItem *)self->_orig isIdleOrRejected])
    {
      int64_t v38 = [(BRCClientZone *)self->_clientZone serverRankByItemID:self->_itemID];
      if (v38)
      {
        int64_t v39 = v38;
        v40 = [(BRCAccountSessionFPFS *)self->_session applyScheduler];
        v41 = [(BRCServerZone *)self->_serverZone dbRowID];
        [v40 rescheduleItemRank:v39 zoneRowID:v41 matchingState:22];
      }
    }
  }
  [(BRCLocalItem *)self _updateSharedZoneBoostingWithDiffs:a4];
  [(BRCLocalItem *)self _updateSyncUpSchedulerWithDiffs:a4];
  [(BRCLocalItem *)self _updateAppLibraryPristineStatesAfterCreationOrUpdate];
  return 1;
}

- (BOOL)_deleteFromDB:(id)a3 keepAliases:(BOOL)a4
{
  id v5 = a3;
  id v6 = v5;
  if (self->_dbRowID)
  {
    if (!objc_msgSend(v5, "execute:", @"DELETE FROM client_items WHERE rowid = %lld", self->_dbRowID))
    {
      BOOL v20 = 0;
      goto LABEL_14;
    }
    if (![(BRCLocalItem *)self->_orig isDead]) {
      [(BRCLocalItem *)self wasMarkedDead];
    }
    int v7 = [(BRCAccountSessionFPFS *)self->_session fsDownloader];
    [v7 deleteDownloadingJobForItem:self];

    BOOL v8 = [(BRCAccountSessionFPFS *)self->_session fsUploader];
    [v8 deleteUploadingJobForItem:self];

    uint64_t v9 = [(BRCAccountSessionFPFS *)self->_session syncUpScheduler];
    [v9 deleteSyncUpJobsForItem:self];

    if ([(BRCLocalItem *)self isMigratingToFPFS])
    {
      int64_t v10 = [(BRCClientZone *)self->_clientZone serverRankByItemID:self->_itemID];
      if (v10)
      {
        int64_t v11 = v10;
        uint64_t v12 = [(BRCAccountSessionFPFS *)self->_session applyScheduler];
        int v13 = [(BRCClientZone *)self->_clientZone dbRowID];
        [v12 rescheduleItemRank:v11 zoneRowID:v13 matchingState:15];
      }
    }
    uint64_t v14 = [(BRCAccountSessionFPFS *)self->_session recentsEnumerator];
    uint64_t v15 = [(BRCLocalItem *)self fileObjectID];
    objc_msgSend(v14, "itemWasDeletedWithFileObjectID:notifRank:", v15, -[BRCLocalItem notifsRank](self, "notifsRank"));

    if (![(BRCLocalItem *)self isIdleOrRejected])
    {
      int64_t v16 = [(BRCClientZone *)self->_clientZone serverRankByItemID:self->_itemID];
      if (v16)
      {
        int64_t v17 = v16;
        uint64_t v18 = [(BRCAccountSessionFPFS *)self->_session applyScheduler];
        uint64_t v19 = [(BRCServerZone *)self->_serverZone dbRowID];
        [v18 rescheduleItemRank:v17 zoneRowID:v19 matchingState:22];
      }
    }
    [(BRCLocalItem *)self _updateSharedZoneBoostingWithDiffs:0];
    self->_unint64_t dbRowID = 0;
  }
  BOOL v20 = 1;
LABEL_14:

  return v20;
}

- (BOOL)_isInterestingUpdateForNotifs
{
  return 0;
}

- (BOOL)_isInterestingUpdateForNotifsWithDiffs:(unint64_t)a3
{
  if (self->_forceNotif) {
    goto LABEL_2;
  }
  if ([(BRCLocalItem *)self isOnDisk] || (BOOL v3 = [(BRCLocalItem *)self->_orig isOnDisk]))
  {
    if ([(BRCLocalItem *)self needsInsert] && [(BRCLocalItem *)self isDead])
    {
LABEL_17:
      LOBYTE(v3) = 0;
      return v3;
    }
    BOOL v6 = [(BRCLocalItem *)self needsInsert];
    LOBYTE(v3) = 1;
    if ((a3 & 0x80000000) == 0 && !v6)
    {
      if ([(BRCLocalItem *)self isLost])
      {
        BOOL v7 = [(BRCLocalItem *)self isOnDisk];
        if ((a3 & 0x80001040000060) == 0 && v7) {
          goto LABEL_17;
        }
      }
      if ((a3 & 0x100000000) == 0 && [(BRCLocalItem *)self isDead]
        || [(BRCLocalItem *)self isDirectory] && [(BRCLocalItem *)self->_orig isAlmostDead])
      {
        goto LABEL_17;
      }
      if ((a3 & 0xF8001DF04A5B64) != 0) {
        goto LABEL_2;
      }
      BOOL v8 = [(BRCLocalItem *)self orig];
      int v9 = [v8 needsOSUpgradeToSyncUp];
      int v10 = [(BRCLocalItem *)self needsOSUpgradeToSyncUp];

      if (v9 != v10) {
        goto LABEL_2;
      }
      int64_t v11 = [(BRCStatInfo *)self->_st ckInfo];
      uint64_t v12 = [v11 etag];
      if (v12)
      {
        int v13 = (void *)v12;
        uint64_t v14 = [(BRCLocalItem *)self orig];
        uint64_t v15 = [v14 st];
        int64_t v16 = [v15 ckInfo];
        int64_t v17 = [v16 etag];
        uint64_t v18 = [(BRCStatInfo *)self->_st ckInfo];
        uint64_t v19 = [v18 etag];
        int v20 = [v17 isEqualToString:v19];

        if (!v20) {
          goto LABEL_2;
        }
      }
      else
      {
      }
      if ([(BRCLocalItem *)self isDocument])
      {
        uint64_t v21 = [(BRCLocalItem *)self asDocument];
        BOOL v22 = [v21 currentVersion];
        uint64_t v23 = [v22 ckInfo];
        uint64_t v24 = [v23 etag];
        if (v24)
        {
          v25 = (void *)v24;
          id v36 = [v21 orig];
          int64_t v35 = [v36 asDocument];
          uint64_t v26 = [v35 currentVersion];
          uint64_t v27 = [v26 ckInfo];
          __int16 v28 = [v27 etag];
          id v29 = [v21 currentVersion];
          long long v30 = [v29 ckInfo];
          [v30 etag];
          long long v31 = v34 = v22;
          char v33 = [v28 isEqualToString:v31];

          if (v33) {
            goto LABEL_29;
          }
LABEL_2:
          LOBYTE(v3) = 1;
          return v3;
        }
      }
LABEL_29:
      LOBYTE(v3) = [(BRCLocalItem *)self _isInterestingUpdateForNotifs];
    }
  }
  return v3;
}

- (void)_ascendItemHierarchyWithBlock:(id)a3
{
  uint64_t v15 = (uint64_t (**)(id, BRCItemGlobalID *, void *))a3;
  uint64_t v4 = [(BRCLocalItem *)self appLibrary];
  id v5 = [v4 mangledID];
  BOOL v6 = +[BRCUserDefaults defaultsForMangledID:v5];
  uint64_t v7 = [v6 maxSyncPathDepth];

  db = self->_db;
  int v9 = [(BRCStatInfo *)self->_st parentID];
  id v10 = [(BRCPQLConnection *)db fetch:@" WITH RECURSIVE item_parents (item_id, zone_rowid, item_file_id) AS(    SELECT item_parent_id, item_parent_zone_rowid, item_file_id FROM client_items      WHERE item_id = %@ AND zone_rowid = %@  UNION ALL     SELECT li.item_parent_id, li.item_parent_zone_rowid, li.item_file_id FROM client_items AS li  INNER JOIN item_parents AS p USING (item_id, zone_rowid)      LIMIT %u) SELECT item_file_id, item_id, zone_rowid FROM item_parents", v9, self->_parentZoneRowID, v7];

  if ([v10 next])
  {
    while (1)
    {
      int64_t v11 = [v10 objectOfClass:objc_opt_class() atIndex:0];
      uint64_t v12 = [v10 objectOfClass:objc_opt_class() atIndex:1];
      int v13 = [v10 objectOfClass:objc_opt_class() atIndex:2];
      uint64_t v14 = [[BRCItemGlobalID alloc] initWithZoneRowID:v13 itemID:v12];
      if ((v15[2](v15, v14, v11) & 1) == 0) {
        break;
      }

      if (![v10 next]) {
        goto LABEL_6;
      }
    }
    [v10 close];
  }
LABEL_6:
}

- (id)setOfParentIDs
{
  id v3 = objc_alloc(MEMORY[0x263EFF9C0]);
  uint64_t v4 = [(BRCLocalItem *)self itemGlobalID];
  id v5 = objc_msgSend(v3, "initWithObjects:", v4, 0);

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __30__BRCLocalItem_setOfParentIDs__block_invoke;
  v8[3] = &unk_265081738;
  id v6 = v5;
  id v9 = v6;
  [(BRCLocalItem *)self _ascendItemHierarchyWithBlock:v8];

  return v6;
}

uint64_t __30__BRCLocalItem_setOfParentIDs__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) containsObject:v3];
  if (v4)
  {
    id v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      __30__BRCLocalItem_setOfParentIDs__block_invoke_cold_2();
    }

    uint64_t v7 = brc_bread_crumbs();
    BOOL v8 = brc_default_log();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u)) {
      __30__BRCLocalItem_setOfParentIDs__block_invoke_cold_1();
    }
  }
  else
  {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return v4 ^ 1u;
}

- (BOOL)hasValidCKInfo
{
  uint64_t v2 = [(BRCStatInfo *)self->_st ckInfo];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isIWorkItem
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  BOOL v3 = [(BRCLocalStatInfo *)self->_st filename];
  int v4 = objc_msgSend(v3, "br_pathExtension");

  id v5 = [(BRCClientZone *)self->_clientZone mangledID];
  id v6 = +[BRCUserDefaults defaultsForMangledID:v5];
  uint64_t v7 = [v6 iworkShareableExtensions];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v8);
        }
        if (objc_msgSend(v4, "isEqualToString:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13))
        {
          LOBYTE(v9) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v9;
}

- (void)_sendNotificationIfNeededWithDiffs:(unint64_t)a3 regather:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v7 = [(BRCAccountSessionFPFS *)self->_session notificationManager];
  if (![(BRCLocalItem *)self isBRAlias]
    && ![(BRCLocalItem *)self isZoneRoot]
    && ([(BRCLocalItem *)self isOnDisk] || [(BRCLocalItem *)self->_orig isOnDisk]))
  {
    id v8 = [(BRCLocalItem *)self itemID];
    char v9 = [v8 isDocumentsFolder];

    uint64_t v10 = [(BRCLocalItem *)self appLibrary];
    if ([v10 hasActiveQueries])
    {
LABEL_8:

      goto LABEL_9;
    }
    int64_t v11 = [(BRCLocalItem *)self orig];
    uint64_t v12 = [v11 appLibrary];
    if ([v12 hasActiveQueries])
    {

      goto LABEL_8;
    }
    if (![(BRCLocalItem *)self isOnDisk])
    {
      long long v16 = [(BRCLocalItem *)self orig];
      v9 |= [v16 isOnDisk];
    }
    if (v9)
    {
LABEL_9:
      if (v4)
      {
        long long v13 = +[BRCNotification notificationGatheredFromItem:self];
      }
      else
      {
        if ([(BRCLocalItem *)self isBRAlias])
        {
          long long v14 = brc_bread_crumbs();
          long long v15 = brc_default_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
            -[BRCLocalItem _sendNotificationIfNeededWithDiffs:regather:]();
          }

          goto LABEL_28;
        }
        long long v13 = [[BRCNotification alloc] initWithLocalItem:self itemDiffs:a3];
      }
      long long v14 = v13;
      if (([(BRCNotification *)v13 isDead] & 1) == 0)
      {
        int64_t v17 = [(BRCLocalItem *)self appLibrary];
        if ([v17 hasActiveRecursiveQueries])
        {

LABEL_24:
          uint64_t v21 = [(BRCLocalItem *)self setOfParentIDs];
          [v14 setParentGlobalIDs:v21];

          goto LABEL_25;
        }
        uint64_t v18 = [(BRCLocalItem *)self orig];
        uint64_t v19 = [v18 appLibrary];
        int v20 = [v19 hasActiveRecursiveQueries];

        if (v20) {
          goto LABEL_24;
        }
      }
LABEL_25:
      BOOL v22 = brc_bread_crumbs();
      uint64_t v23 = brc_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        int v24 = 138412802;
        v25 = v14;
        __int16 v26 = 2048;
        unint64_t v27 = [(BRCLocalItem *)self notifsRank];
        __int16 v28 = 2112;
        id v29 = v22;
        _os_log_debug_impl(&dword_23FA42000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] Queueing notification %@ for rank: %lld%@", (uint8_t *)&v24, 0x20u);
      }

      [v7 queueUpdate:v14];
LABEL_28:
    }
  }
}

- (void)triggerNotificationIfNeeded
{
  if (![(BRCLocalItem *)self isDead])
  {
    [(BRCLocalItem *)self _sendNotificationIfNeededWithDiffs:0 regather:1];
  }
}

- (void)markForceNotify
{
  self->_forceNotif = 1;
}

- (NSError)syncUpError
{
  v16[1] = *MEMORY[0x263EF8340];
  if (self->_syncUpState == 8)
  {
    uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v3 = _BRLocalizedStringWithFormat();

    if (v3)
    {
LABEL_12:
      id v8 = (void *)MEMORY[0x263F087E8];
      uint64_t v9 = *MEMORY[0x263F07F70];
      uint64_t v15 = *MEMORY[0x263F08320];
      v16[0] = v3;
      uint64_t v10 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, &v15, 1, v14);
      int64_t v11 = [v8 errorWithDomain:v9 code:3328 userInfo:v10];

      id v12 = v11;
      goto LABEL_13;
    }
    goto LABEL_10;
  }
  if ([(BRCClientZone *)self->_clientZone isSyncBlockedBecauseOSNeedsUpgrade])
  {
    uint64_t v5 = [(BRCClientZone *)self->_clientZone osNameRequiredToSync];
    goto LABEL_8;
  }
  if ([(BRCLocalItem *)self needsOSUpgradeToSyncUp])
  {
    uint64_t v5 = [(BRCLocalItem *)self osNameNeededToSyncUp];
LABEL_8:
    id v6 = (void *)v5;
    if (v5)
    {
      uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      long long v14 = v6;
      BOOL v3 = _BRLocalizedStringWithFormat();

LABEL_11:
      goto LABEL_12;
    }
LABEL_10:
    id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v3 = _BRLocalizedStringWithFormat();
    goto LABEL_11;
  }
  id v12 = 0;
LABEL_13:
  return (NSError *)v12;
}

- (BOOL)fromReadOnlyDB
{
  db = self->_db;
  BOOL v3 = [(BRCAccountSessionFPFS *)self->_session readOnlyDB];
  LOBYTE(db) = db == v3;

  return (char)db;
}

- (unsigned)uploadStatus
{
  if ([(BRCLocalItem *)self isIdleOrRejected]) {
    return 3;
  }
  BOOL v3 = [(BRCLocalItem *)self itemID];
  if ([v3 isDocumentsFolder])
  {

    return 3;
  }
  BOOL v4 = [(BRCLocalItem *)self isMigratingToFPFS];

  if (v4) {
    return 3;
  }
  if ([(BRCLocalItem *)self syncUpState] == 4)
  {
    unsigned __int16 v5 = 2;
    if (![(BRCLocalItem *)self isDeadOrMissingInServerTruth])
    {
      unint64_t localDiffs = self->_localDiffs;
      id v8 = [(BRCAccountSessionFPFS *)self->_session syncUpScheduler];
      uint64_t v9 = [v8 inFlightDiffsForItem:self] | localDiffs;

      if ((v9 & 0xEFFFFFFFFFFFF7FFLL) != 0) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
  else if ([(BRCLocalItem *)self isDocument])
  {
    return 1;
  }
  else
  {
    return 2;
  }
  return v5;
}

- (BOOL)_hasFieldChangesNotDiffed
{
  unint64_t localDiffs = self->_localDiffs;
  if (localDiffs != [(BRCLocalItem *)self->_orig localDiffs]) {
    return 1;
  }
  int v4 = [(BRCStatInfo *)self->_st type];
  unsigned __int16 v5 = [(BRCLocalItem *)self->_orig st];
  int v6 = [v5 type];

  if (v4 != v6) {
    return 1;
  }
  uint64_t v7 = [(BRCLocalStatInfo *)self->_st processingStamp];
  id v8 = [(BRCLocalItem *)self->_orig st];
  uint64_t v9 = [v8 processingStamp];

  if (v7 != v9) {
    return 1;
  }
  unint64_t notifsRank = self->_notifsRank;
  return notifsRank != [(BRCLocalItem *)self->_orig notifsRank];
}

- (void)_learnItemID:(id)a3 serverItem:(id)a4
{
  id v17 = a3;
  id v7 = a4;
  knownByServer = self->_knownByServer;
  self->_knownByServer = 0;

  self->_localDiffs &= ~0x8000000000000000;
  objc_storeStrong((id *)&self->_itemID, a3);
  self->_sharingOptions = [v7 sharingOptions];
  uint64_t v9 = [v7 ownerKey];

  if (v9)
  {
    uint64_t v10 = [v7 ownerKey];
    ownerKey = self->_ownerKey;
    self->_ownerKey = v10;
  }
  id v12 = [v7 st];
  long long v13 = [v12 creatorRowID];

  if (v13)
  {
    long long v14 = [v7 st];
    uint64_t v15 = [v14 creatorRowID];
    [(BRCStatInfo *)self->_st setCreatorRowID:v15];
  }
  long long v16 = [(BRCAccountSessionFPFS *)self->_session applyScheduler];
  [v16 rescheduleSuspendedJobsMatching:self->_serverZone inState:22];
}

- (void)_restorePreviousGlobalID:(id)a3
{
  id v4 = a3;
  self->_unint64_t dbRowID = 0;
  session = self->_session;
  int v6 = [v4 zoneRowID];
  self->_serverZone = (BRCServerZone *)[(BRCAccountSessionFPFS *)session serverZoneByRowID:v6];

  id v7 = [(BRCServerZone *)self->_serverZone clientZone];
  clientZone = self->_clientZone;
  self->_clientZone = v7;

  uint64_t v9 = self->_clientZone;
  uint64_t v10 = [v4 itemID];
  int64_t v11 = [(BRCClientZone *)v9 serverItemByItemID:v10];

  id v12 = brc_bread_crumbs();
  long long v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[BRCLocalItem _restorePreviousGlobalID:]();
  }

  if ([v11 isLive]
    && ([v11 isSharedToMeTopLevelItem] & 1) == 0
    && (long long v14 = self->_clientZone,
        [v11 parentItemIDOnServer],
        uint64_t v15 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v14) = [(BRCClientZone *)v14 existsByItemID:v15],
        v15,
        v14))
  {
    long long v16 = [v11 parentItemIDOnServer];
    [(BRCStatInfo *)self->_st setParentID:v16];

    id v17 = [(BRCClientZone *)self->_clientZone dbRowID];
    parentZoneRowID = self->_parentZoneRowID;
    self->_parentZoneRowID = v17;
  }
  else
  {
    if ([(BRCClientZone *)self->_clientZone isPrivateZone])
    {
      parentZoneRowID = [(BRCClientZone *)self->_clientZone asPrivateClientZone];
      uint64_t v19 = [parentZoneRowID dbRowID];
      int v20 = self->_parentZoneRowID;
      self->_parentZoneRowID = v19;

      uint64_t v21 = [parentZoneRowID defaultAppLibrary];
      BOOL v22 = [v21 rootItemID];
      [(BRCStatInfo *)self->_st setParentID:v22];
    }
    else
    {
      uint64_t v23 = [(BRCLocalItem *)self appLibrary];
      int v24 = [v23 defaultClientZone];
      v25 = [v24 dbRowID];
      __int16 v26 = self->_parentZoneRowID;
      self->_parentZoneRowID = v25;

      parentZoneRowID = [(BRCLocalItem *)self appLibrary];
      uint64_t v21 = [parentZoneRowID rootItemID];
      [(BRCStatInfo *)self->_st setParentID:v21];
    }
  }
  unint64_t v27 = [v4 itemID];
  [(BRCLocalItem *)self learnItemID:v27 serverItem:v11];
}

- (void)_markAsDeadTombstoneWithPreviousGlobalID:(id)a3
{
  id v4 = a3;
  [(BRCLocalItem *)self markDead];
  [(BRCLocalItem *)self _restorePreviousGlobalID:v4];

  unsigned __int16 v5 = [(BRCStatInfo *)self->_st ckInfo];
  [v5 revertEtagsForOldZoneTombstone];

  self->_unsigned int syncUpState = 4;
}

- (void)_cheapCheckSavingItem
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: self.appLibrary%@", v2, v3, v4, v5, v6);
}

- (BOOL)saveToDBAndValidateLocalDiffs
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(BRCLocalItem *)self orig];
  uint64_t v4 = [v3 localDiffs];

  BOOL v5 = [(BRCLocalItem *)self saveToDB];
  if (([(BRCLocalItem *)self localDiffs] | v4) != v4)
  {
    uint8_t v6 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      uint64_t v9 = BRCItemFieldsPrettyPrint();
      int v10 = 138412546;
      int64_t v11 = v9;
      __int16 v12 = 2112;
      long long v13 = v6;
      _os_log_fault_impl(&dword_23FA42000, v7, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Item got saved before sync up and a new local diff bit was added: %@%@", (uint8_t *)&v10, 0x16u);
    }
  }
  return v5;
}

- (BOOL)saveToDB
{
  return [(BRCLocalItem *)self saveToDBForServerEdit:0 keepAliases:0];
}

- (BOOL)saveToDBForServerEdit:(BOOL)a3 keepAliases:(BOOL)a4
{
  BOOL v5 = a3;
  uint64_t v35 = *MEMORY[0x263EF8340];
  p_session = &self->_session;
  id v8 = [(BRCAccountSessionFPFS *)self->_session clientDB];
  [v8 assertOnQueue];

  uint64_t v9 = *p_session;
  memset(v26, 0, sizeof(v26));
  __brc_create_section(0, (uint64_t)"-[BRCLocalItem saveToDBForServerEdit:keepAliases:]", 2384, v26);
  int v10 = brc_bread_crumbs();
  int64_t v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    uint64_t v28 = v26[0];
    __int16 v29 = 2112;
    uint64_t v30 = self;
    __int16 v31 = 1024;
    BOOL v32 = v5;
    __int16 v33 = 2112;
    int64_t v34 = v10;
    _os_log_debug_impl(&dword_23FA42000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Saving item %@, serverUpdate = %d%@", buf, 0x26u);
  }

  orig = self->_orig;
  if (orig && !self->_syncUpState)
  {
    unsigned int v19 = [(BRCLocalItem *)orig syncUpState];
    if (v19) {
      char v13 = 1;
    }
    else {
      char v13 = v5;
    }
    if (v19 && !v5)
    {
      int v20 = brc_bread_crumbs();
      uint64_t v21 = brc_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[BRCLocalItem saveToDBForServerEdit:keepAliases:]();
      }

      char v13 = 1;
    }
  }
  else
  {
    char v13 = v5;
  }
  if (self->_forceDeletedAlready)
  {
    uint64_t v14 = brc_bread_crumbs();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[BRCLocalItem saveToDBForServerEdit:keepAliases:]();
    }

    char v16 = 1;
  }
  else
  {
    db = self->_db;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke;
    v22[3] = &unk_265081760;
    v22[4] = self;
    char v24 = v13;
    uint64_t v23 = v9;
    BOOL v25 = a4;
    char v16 = [(BRCPQLConnection *)db groupInTransaction:v22];
  }
  __brc_leave_section(v26);

  return v16;
}

uint64_t __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v114 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (id *)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 32) diffAgainstOriginalItem];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 96);
  if ([*(id *)(a1 + 32) isDirectory])
  {
    if (*(unsigned char *)(a1 + 48))
    {
      id v7 = [*v4 asDirectory];
      uint64_t v8 = [v7 mtime];
      uint64_t v9 = [*v4 orig];
      int v10 = [v9 asDirectory];
      BOOL v11 = v8 != [v10 mtime];

      if (v11) {
        v5 |= 0x4000uLL;
      }
    }
  }
  if ((v5 & 0x100000000) != 0
    && [*((id *)*v4 + 11) isLost]
    && ([*v4 isLost] & 1) == 0)
  {
    int v12 = [*v4 isDead] ^ 1;
  }
  else
  {
    int v12 = 0;
  }
  if ([*v4 isDead])
  {
    if (*(unsigned char *)(a1 + 48)
      && ([*((id *)*v4 + 11) isDead] & 1) == 0
      && [*v4 isSharedToMeTopLevelItem])
    {
      char v13 = brc_bread_crumbs();
      uint64_t v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_13((void *)(a1 + 32));
      }

      uint64_t v15 = [*v4 asSharedToMeTopLevelItem];
      [v15 insertTombstoneAliasRecordInZone:0];
    }
    if (*((unsigned char *)*v4 + 185))
    {
      char v16 = brc_bread_crumbs();
      int v17 = 1;
      uint64_t v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_12();
      }
LABEL_31:

      goto LABEL_32;
    }
    unsigned int v19 = [*((id *)*v4 + 9) processingStamp];

    if (v19)
    {
      char v16 = brc_bread_crumbs();
      uint64_t v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_11();
      }
      int v17 = 0;
      goto LABEL_31;
    }
    if ([*v4 isIdleOrRejected])
    {
      char v16 = brc_bread_crumbs();
      int v17 = 1;
      uint64_t v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_9();
      }
      goto LABEL_31;
    }
    if (([*v4 isKnownByServerOrInFlight] & 1) == 0)
    {
      char v16 = brc_bread_crumbs();
      int v17 = 1;
      uint64_t v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_10();
      }
      goto LABEL_31;
    }
  }
  int v17 = 0;
LABEL_32:
  if (*((void *)*v4 + 13))
  {
    int v20 = [*v4 orig];
    uint64_t v21 = v20[13];

    if (v21)
    {
      BOOL v22 = brc_bread_crumbs();
      uint64_t v23 = brc_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_8();
      }

      if (v12 && ([*v4 isIdleOrRejected] & 1) == 0)
      {
        char v24 = brc_bread_crumbs();
        BOOL v25 = brc_default_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_7();
        }
        goto LABEL_43;
      }
      if ((v5 & 0x3FF7FFF) != 0)
      {
        char v24 = brc_bread_crumbs();
        BOOL v25 = brc_default_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_6();
        }
LABEL_43:

        v5 |= 0x8000000000000uLL;
        __int16 v26 = (void *)*((void *)*v4 + 13);
        *((void *)*v4 + 13) = 0;

        [*((id *)*v4 + 3) scheduleSyncUp];
      }
    }
  }
  if (([*v4 isCrossZoneMoveTombstone] & 1) != 0
    || ![*v4 _isInterestingUpdateForNotifsWithDiffs:v5])
  {
    int v28 = 0;
  }
  else
  {
    unint64_t v27 = +[BRCPersistedState loadFromClientStateInSession:*(void *)(a1 + 40)];
    *(void *)(*(void *)(a1 + 32) + 128) = [v27 allocateNotifRank];

    int v28 = 1;
  }
  if (!*(unsigned char *)(a1 + 48))
  {
    int v29 = [*v4 isSharedToMeChildItem];
    if ((v5 & 0x40) != 0)
    {
      if (v29)
      {
        uint64_t v30 = [*((id *)*v4 + 20) etag];
        if (v30)
        {
          __int16 v31 = (void *)v30;
          uint64_t v101 = v6;
          id v102 = v3;
          BOOL v32 = [*((id *)*v4 + 9) logicalName];
          __int16 v33 = objc_msgSend(v32, "br_pathExtension");
          v103 = [*((id *)*v4 + 11) st];
          int64_t v34 = [v103 logicalName];
          uint64_t v35 = objc_msgSend(v34, "br_pathExtension");
          if (v33 == (void *)v35)
          {

            id v3 = v102;
          }
          else
          {
            id v36 = (void *)v35;
            int v99 = v28;
            v94 = [*((id *)*v4 + 9) logicalName];
            objc_msgSend(v94, "br_pathExtension");
            __int16 v37 = v98 = v32;
            [*((id *)*v4 + 11) st];
            int64_t v38 = v97 = v33;
            int64_t v39 = [v38 logicalName];
            objc_msgSend(v39, "br_pathExtension");
            v40 = v96 = v31;
            char v95 = [v37 isEqualToString:v40];

            if (v95)
            {
              uint64_t v6 = v101;
              id v3 = v102;
              int v28 = v99;
            }
            else
            {
              v41 = brc_bread_crumbs();
              uint64_t v42 = brc_default_log();
              uint64_t v6 = v101;
              id v3 = v102;
              int v28 = v99;
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
                __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_5();
              }

              if ([*((id *)*v4 + 9) favoriteRank])
              {
                v5 |= 0x1000uLL;
              }
              else if ([*((id *)*v4 + 9) lastUsedTime])
              {
                v5 |= 0x800uLL;
              }
            }
          }
        }
      }
    }
    *((void *)*v4 + 12) |= [*v4 metadataSyncUpMask:1] & v5;
  }
  id v43 = *v4;
  if (v17)
  {
    if ([v43 _deleteFromDB:v3 keepAliases:*(unsigned __int8 *)(a1 + 49)])
    {
      v44 = "Deleted from DB";
LABEL_107:
      [*v4 _cheapCheckSavingItem];
      v76 = brc_bread_crumbs();
      v77 = brc_default_log();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v81 = BRCItemFieldsPrettyPrint();
        v82 = (void *)v81;
        int v83 = *(unsigned __int8 *)(a1 + 48);
        *(_DWORD *)buf = 136316162;
        v105 = v44;
        if (v28) {
          v84 = "YES";
        }
        else {
          v84 = "NO";
        }
        __int16 v106 = 2112;
        if (v83) {
          v85 = "YES";
        }
        else {
          v85 = "NO";
        }
        uint64_t v107 = v81;
        __int16 v108 = 2080;
        v109 = v84;
        __int16 v110 = 2080;
        v111 = v85;
        __int16 v112 = 2112;
        v113 = v76;
        _os_log_debug_impl(&dword_23FA42000, v77, OS_LOG_TYPE_DEBUG, "[DEBUG] %s. changedFields:%@ sendNotif:%s serverUpdate:%s%@", buf, 0x34u);
      }
      if (v28) {
        [*v4 _sendNotificationIfNeededWithDiffs:v5 regather:0];
      }
      uint64_t v78 = [*v4 copy];
      v73 = (void *)*((void *)*v4 + 11);
      *((void *)*v4 + 11) = v78;
      uint64_t v75 = 1;
      goto LABEL_111;
    }
  }
  else if ([v43 needsInsert])
  {
    v45 = +[BRCPersistedState loadFromClientStateInSession:*(void *)(a1 + 40)];
    uint64_t v46 = [v45 allocateItemRowID];

    if ([*(id *)(a1 + 32) isSharedToMeChildItem])
    {
      BOOL v47 = [*((id *)*v4 + 1) containerScheduler];
      v48 = [v47 sideCarSyncPersistedState];
      char v49 = [v48 lastSyncDownDate];

      if (!v49)
      {
        v50 = brc_bread_crumbs();
        v51 = brc_default_log();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
          __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_3();
        }

        char v52 = [*((id *)*v4 + 1) containerScheduler];
        uint64_t v53 = objc_msgSend(MEMORY[0x263EFD780], "br_syncDownInitial");
        [v52 scheduleSyncDownForSideCarWithGroup:v53];
      }
    }
    __int16 v54 = brc_bread_crumbs();
    id v55 = brc_default_log();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG)) {
      __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_2((uint64_t)v54, v46, v55);
    }

    if ([*v4 _insertInDB:v3 dbRowID:v46])
    {
      v44 = "Inserted into DB";
      goto LABEL_107;
    }
  }
  else
  {
    if (!v5 && ![*v4 _hasFieldChangesNotDiffed])
    {
      v44 = "Ignored";
      goto LABEL_107;
    }
    if (!*(unsigned char *)(a1 + 48))
    {
      if ((v5 & 0x7FFE) != 0) {
        [*((id *)*v4 + 9) bumpLocalChangeCount];
      }
      if ([*v4 isDocument])
      {
        int v56 = [*((id *)*v4 + 11) asDocument];
        v57 = [v56 currentVersion];

        uint64_t v58 = [v57 contentSignature];
        int v59 = objc_msgSend(v58, "brc_signatureIsPendingPlaceHolder");

        v60 = [v57 thumbnailSignature];
        int v61 = objc_msgSend(v60, "brc_signatureIsPendingPlaceHolder");

        if (v59) {
          int v62 = 1114112;
        }
        else {
          int v62 = 0x10000;
        }
        if (v61) {
          v62 |= 0x400000u;
        }
        uint64_t v63 = v5 & ~v62 & 0x3FE0000;
        uint64_t v64 = [*v4 asDocument];
        int v65 = [v64 hasFileIDForUpload];

        if (v63 || ((v5 & 0xC00000000) != 0 ? (int v66 = v65) : (int v66 = 0), v66 == 1))
        {
          uint64_t v67 = [*v4 asDocument];
          v68 = [v67 currentVersion];
          [v68 bumpLocalChangeCount];
        }
      }
    }
    if ([*v4 isSharedToMeTopLevelItem] && (*((_WORD *)*v4 + 48) & 0x1A69) != 0)
    {
      v69 = [*v4 parentClientZone];
      if ([v69 isPrivateZone] && (v70 = *v4, (*((_WORD *)*v4 + 48) & 0x1A60) == 0))
      {
        v88 = (void *)v70[1];
        v89 = [*v4 parentClientZone];
        [v89 serverZone];
        v90 = int v100 = v28;
        v91 = [v88 serverAliasItemForSharedItem:v70 inZone:v90];

        int v28 = v100;
        if (!v91)
        {
          v92 = brc_bread_crumbs();
          v93 = brc_default_log();
          if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG)) {
            __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_4();
          }

          *((void *)*v4 + 12) &= 0xFFFFFFFFFFFF8002;
        }
      }
      else
      {
      }
    }
    if ([*v4 _updateInDB:v3 diffs:v5])
    {
      v44 = "Saved into DB";
      goto LABEL_107;
    }
  }
  *((void *)*v4 + 12) = v6;
  brc_bread_crumbs();
  v71 = (char *)objc_claimAutoreleasedReturnValue();
  v72 = brc_default_log();
  if (os_log_type_enabled(v72, (os_log_type_t)0x90u))
  {
    v86 = [*v4 itemID];
    v87 = [v3 lastError];
    *(_DWORD *)buf = 138412802;
    v105 = v86;
    __int16 v106 = 2112;
    uint64_t v107 = (uint64_t)v87;
    __int16 v108 = 2112;
    v109 = v71;
    _os_log_error_impl(&dword_23FA42000, v72, (os_log_type_t)0x90u, "[ERROR] failed to save item %@ to DB: %@%@", buf, 0x20u);
  }
  v73 = brc_bread_crumbs();
  v74 = brc_default_log();
  if (os_log_type_enabled(v74, OS_LOG_TYPE_FAULT)) {
    __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_1();
  }

  uint64_t v75 = 0;
LABEL_111:

  v79 = *v4;
  if (*((unsigned char *)*v4 + 185))
  {
    v79[186] = v75;
    v79 = *v4;
  }
  v79[187] = 0;

  return v75;
}

- (BOOL)_isIndexable
{
  return 1;
}

- (unint64_t)diffAgainstServerItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4)
  {
    if ([(BRCLocalItem *)self isDocument]) {
      unint64_t v32 = 4093607935;
    }
    else {
      unint64_t v32 = 4026564607;
    }
    goto LABEL_30;
  }
  itemID = self->_itemID;
  id v7 = [v4 itemID];
  uint64_t v8 = itemID;
  uint64_t v9 = v7;
  if (v8 == v9)
  {
  }
  else
  {
    int v10 = v9;
    if (!v9)
    {

LABEL_9:
      uint64_t v12 = 0x80000000;
      goto LABEL_10;
    }
    BOOL v11 = [(BRCItemID *)v8 isEqual:v9];

    if (!v11) {
      goto LABEL_9;
    }
  }
  uint64_t v12 = 0;
LABEL_10:
  ownerKey = self->_ownerKey;
  uint64_t v14 = [v5 ownerKey];
  uint64_t v15 = ownerKey;
  char v16 = v14;
  int v17 = v16;
  if (v15 == v16)
  {
    int v18 = 0;
  }
  else if (v16)
  {
    int v18 = [(BRCUserRowID *)v15 isEqual:v16] ^ 1;
  }
  else
  {
    int v18 = 1;
  }

  if (v18) {
    uint64_t v19 = v12 | 0x20000000;
  }
  else {
    uint64_t v19 = v12;
  }
  unint64_t sharingOptions = self->_sharingOptions;
  if (sharingOptions == [v5 sharingOptions]) {
    uint64_t v21 = v19;
  }
  else {
    uint64_t v21 = v19 | 0x40000000;
  }
  sideCarCKInfo = self->_sideCarCKInfo;
  uint64_t v23 = [v5 sideCarInfo];
  char v24 = [v23 ckInfo];
  BOOL v25 = sideCarCKInfo;
  __int16 v26 = v24;
  unint64_t v27 = v26;
  if (v25 == v26)
  {
    int v28 = 0;
  }
  else if (v26)
  {
    int v28 = ![(BRFieldCKInfo *)v25 isEqual:v26];
  }
  else
  {
    int v28 = 1;
  }

  if (v28) {
    uint64_t v29 = v21 | 0x100000000000000;
  }
  else {
    uint64_t v29 = v21;
  }
  st = self->_st;
  __int16 v31 = [v5 st];
  unint64_t v32 = [(BRCStatInfo *)st diffAgainst:v31] | v29;

LABEL_30:
  if ([(BRCLocalItem *)self isSharedToMeTopLevelItem]
    && [v5 isSharedToMeTopLevelItem])
  {
    unint64_t v33 = v32 & 0xFFFFFFFFFFFFFFDFLL;
    int64_t v34 = [(BRCAccountSessionFPFS *)self->_session serverAliasItemForSharedItem:self db:self->_db];
    if (v34)
    {
      uint64_t v35 = [(BRCLocalItem *)self asSharedToMeTopLevelItem];
      uint64_t v36 = [v35 diffAgainstServerAliasItem:v34] & 0x20;
    }
    else
    {
      __int16 v37 = [(BRCLocalItem *)self st];
      int64_t v38 = [v37 parentID];
      int64_t v39 = [(BRCAppLibrary *)self->_appLibrary documentsFolderItemID];
      int v40 = [v38 isEqualToItemID:v39];

      if (v40) {
        uint64_t v36 = 0;
      }
      else {
        uint64_t v36 = 32;
      }
    }
    unint64_t v32 = v36 | v33;
  }
  return v32;
}

- (unint64_t)diffAgainstLocalItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4)
  {
    unint64_t v38 = 0xFF003FF3FF7FFFLL;
    goto LABEL_51;
  }
  uint64_t v6 = (void *)v4[6];
  id v7 = self->_itemID;
  uint64_t v8 = v6;
  if (v7 == v8)
  {

    goto LABEL_7;
  }
  uint64_t v9 = v8;
  if (v8)
  {
    BOOL v10 = [(BRCItemID *)v7 isEqual:v8];

    if (!v10) {
      goto LABEL_9;
    }
LABEL_7:
    uint64_t v11 = 0;
    goto LABEL_10;
  }

LABEL_9:
  uint64_t v11 = 0x80000000;
LABEL_10:
  uint64_t v12 = (void *)v5[8];
  char v13 = self->_ownerKey;
  uint64_t v14 = v12;
  if (v13 == v14)
  {

    goto LABEL_17;
  }
  uint64_t v15 = v14;
  if (!v14)
  {

    goto LABEL_16;
  }
  char v16 = [(BRCUserRowID *)v13 isEqual:v14];

  if ((v16 & 1) == 0) {
LABEL_16:
  }
    v11 |= 0x20000000uLL;
LABEL_17:
  if (self->_sharingOptions == v5[17]) {
    uint64_t v17 = v11;
  }
  else {
    uint64_t v17 = v11 | 0x40000000;
  }
  if (self->_syncUpState != *((_DWORD *)v5 + 20)) {
    v17 |= 0x20000000000000uLL;
  }
  if (self->_isUserVisible == *((unsigned __int8 *)v5 + 112)) {
    uint64_t v18 = v17;
  }
  else {
    uint64_t v18 = v17 | 0x80000000000000;
  }
  if ((v18 & 0x40000000000000) == 0)
  {
    uint64_t v19 = [(BRCLocalItem *)self appLibrary];
    int v20 = [v19 dbRowID];
    uint64_t v21 = [v5 appLibrary];
    BOOL v22 = [v21 dbRowID];
    id v23 = v20;
    id v24 = v22;
    BOOL v25 = v24;
    if (v23 == v24) {
      int v26 = 0;
    }
    else {
      int v26 = v24 ? [v23 isEqual:v24] ^ 1 : 1;
    }

    if (v26) {
      v18 |= 0x40000000000000uLL;
    }
  }
  if ((v18 & 0x8000000000000) == 0)
  {
    unint64_t v27 = (void *)v5[13];
    int v28 = self->_minimumSupportedOSRowID;
    uint64_t v29 = v27;
    if (v28 == v29)
    {

      goto LABEL_41;
    }
    uint64_t v30 = v29;
    if (v29)
    {
      char v31 = [(NSNumber *)v28 isEqual:v29];

      if (v31) {
        goto LABEL_41;
      }
    }
    else
    {
    }
    v18 |= 0x8000000000000uLL;
  }
LABEL_41:
  unint64_t v32 = (void *)v5[20];
  unint64_t v33 = self->_sideCarCKInfo;
  int64_t v34 = v32;
  if (v33 == v34)
  {
  }
  else
  {
    uint64_t v35 = v34;
    if (v34)
    {
      BOOL v36 = [(BRFieldCKInfo *)v33 isEqual:v34];

      if (v36) {
        goto LABEL_48;
      }
    }
    else
    {
    }
    v18 |= 0x100000000000000uLL;
  }
LABEL_48:
  unint64_t v37 = [(BRCLocalStatInfo *)self->_st diffAgainstLocalInfo:v5[9]];
  unint64_t v38 = v37 | v18;
  if (((v37 | v18) & 8) != 0
    && ![(BRCLocalItem *)self isSharedToMeTopLevelItem])
  {
    v38 &= ~8uLL;
  }
LABEL_51:

  return v38;
}

- (unint64_t)diffAgainstOriginalItem
{
  if (self->_orig) {
    return -[BRCLocalItem diffAgainstLocalItem:](self, "diffAgainstLocalItem:");
  }
  else {
    return 0xFF003FF3FF7FFFLL;
  }
}

+ (BOOL)computeUserVisibleStatusOfLiveItemWithParentVisible:(BOOL)a3 parentIsNonDesktopRoot:(BOOL)a4 parentScope:(unsigned __int8)a5 itemFilename:(id)a6 parentFilename:(id)a7 appLibrary:(id)a8
{
  int v10 = a5;
  BOOL v11 = a4;
  int v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = a8;
  if (([v15 supportsSpotlightIndexing] & 1) == 0)
  {
    if ([v15 isCloudDocsAppLibrary])
    {
      uint64_t v17 = brc_bread_crumbs();
      uint64_t v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        +[BRCLocalItem computeUserVisibleStatusOfLiveItemWithParentVisible:parentIsNonDesktopRoot:parentScope:itemFilename:parentFilename:appLibrary:]();
      }
    }
    goto LABEL_12;
  }
  if (v10 == 1 && v11 && ([v13 isEqualToString:*MEMORY[0x263F324D0]] & 1) != 0) {
    goto LABEL_10;
  }
  if (v10 == 1 && v12)
  {
    uint64_t v19 = brc_bread_crumbs();
    int v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      +[BRCLocalItem computeUserVisibleStatusOfLiveItemWithParentVisible:parentIsNonDesktopRoot:parentScope:itemFilename:parentFilename:appLibrary:]();
    }
  }
  if ([v13 hasPrefix:@"."])
  {
LABEL_12:
    LOBYTE(v12) = 0;
    goto LABEL_13;
  }
  if (v10 == 2 && v11)
  {
LABEL_10:
    LOBYTE(v12) = 1;
    goto LABEL_13;
  }
  if (v10 == 3) {
    LOBYTE(v12) = [v14 isEqualToString:*MEMORY[0x263F32538]];
  }
LABEL_13:

  return v12;
}

- (NSDictionary)extendedAttributes
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__15;
  uint64_t v18 = __Block_byref_object_dispose__15;
  id v19 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __34__BRCLocalItem_extendedAttributes__block_invoke;
  v13[3] = &unk_265081788;
  v13[4] = &v14;
  id v3 = (void (**)(void, void))MEMORY[0x2455D9A50](v13);
  st = self->_st;
  uint64_t v5 = [(BRCAccountSessionFPFS *)self->_session stageRegistry];
  uint64_t v6 = [(BRCStatInfo *)st lazyXattrWithStageRegistry:v5];
  ((void (**)(void, void *))v3)[2](v3, v6);

  if ([(BRCLocalItem *)self isDocument])
  {
    id v7 = [(BRCLocalItem *)self asDocument];
    uint64_t v8 = [v7 currentVersion];
    uint64_t v9 = [(BRCAccountSessionFPFS *)self->_session stageRegistry];
    int v10 = [v8 lazyXattrWithStageRegistry:v9];
    ((void (**)(void, void *))v3)[2](v3, v10);
  }
  if ([(id)v15[5] count]) {
    id v11 = (id)v15[5];
  }
  else {
    id v11 = 0;
  }

  _Block_object_dispose(&v14, 8);
  return (NSDictionary *)v11;
}

void __34__BRCLocalItem_extendedAttributes__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = [[BRFieldXattrBlob alloc] initWithData:v3];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v5 = [(BRFieldXattrBlob *)v4 xattrs];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          int v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          id v11 = [v10 value];
          int v12 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
          id v13 = [v10 name];
          [v12 setObject:v11 forKeyedSubscript:v13];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
}

- (void)markForceNeedsSyncUp
{
  self->_localDiffs |= 0x3FFEuLL;
  [(BRCLocalItem *)self _markNeedsSyncingUp];
}

- (void)markForceRejected
{
  self->_unsigned int syncUpState = 1;
}

- (void)markRejectedItemRemotelyRevived
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _syncUpState == BRC_SUS_REJECTED%@", v2, v3, v4, v5, v6);
}

- (BOOL)forceNeedsSyncUpWithoutDiffs
{
  BOOL v3 = [(BRCLocalItem *)self hasShareIDAndIsOwnedByMe];
  if (v3)
  {
    if (([(BRCLocalItem *)self sharingOptions] & 0x48) != 0)
    {
      BOOL v3 = [(BRCLocalItem *)self isInTrashScope];
      if (v3)
      {
        uint64_t v4 = brc_bread_crumbs();
        uint64_t v5 = brc_default_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
          -[BRCLocalItem forceNeedsSyncUpWithoutDiffs]();
        }

        LOBYTE(v3) = 1;
      }
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)_markNeedsSyncingUp
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Local item is missing a share alias which it should have. Trying to create one%@", v2, v3, v4, v5, v6);
}

- (void)markNeedsUploadOrSyncingUp
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (![(BRCLocalItem *)self isRejected])
  {
LABEL_17:
    [(BRCLocalItem *)self _markNeedsSyncingUp];
    return;
  }
  if ([(BRCLocalItem *)self isSharedToMeTopLevelItem])
  {
    uint64_t v3 = brc_bread_crumbs();
    uint64_t v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412546;
      long long v15 = self;
      __int16 v16 = 2112;
      long long v17 = v3;
      _os_log_impl(&dword_23FA42000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] Not forcing sync up of share-to-me top level item %@%@", (uint8_t *)&v14, 0x16u);
    }

    self->_unint64_t localDiffs = 0;
    return;
  }
  if (![(BRCLocalItem *)self isSharedToMeChildItem])
  {
LABEL_13:
    unint64_t v11 = self->_localDiffs | [(BRCLocalItem *)self diffAgainstOriginalItem];
    if ((v11 & [(BRCLocalItem *)self metadataSyncUpMask:0]) != 0)
    {
      int v12 = brc_bread_crumbs();
      id v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412546;
        long long v15 = self;
        __int16 v16 = 2112;
        long long v17 = v12;
        _os_log_impl(&dword_23FA42000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] Rejected item %@ has meaningful local diffs.  Forcing re-sync of all fields%@", (uint8_t *)&v14, 0x16u);
      }

      self->_unint64_t localDiffs = 0xFF003FF3FF7FFFLL;
    }
    goto LABEL_17;
  }
  uint64_t v5 = objc_msgSend(MEMORY[0x263EFD7E8], "brc_fetchShareIDWithSharedItem:", self);
  uint8_t v6 = objc_msgSend(v5, "brc_shareItemID");
  uint64_t v7 = [(BRCClientZone *)self->_clientZone serverItemByItemID:v6];
  uint64_t v8 = v7;
  if (v7 && ![v7 isDead])
  {

    goto LABEL_13;
  }
  uint64_t v9 = brc_bread_crumbs();
  int v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    long long v15 = self;
    __int16 v16 = 2112;
    long long v17 = v9;
    _os_log_impl(&dword_23FA42000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] Not forcing sync up of share-to-me child item with a dead root share %@%@", (uint8_t *)&v14, 0x16u);
  }

  self->_unint64_t localDiffs = 0;
}

- (void)scheduleSyncDownForOOBModifyRecordsAck
{
  self->_localDiffs |= 0x1000000000000000uLL;
  [(BRCClientZone *)self->_clientZone scheduleSyncDownForOOBModifyRecordsAck];
}

- (void)prepareForSyncUpSideCarZone
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: self.isReadAndUploaded || self.isKnownByServerOrInFlight%@", v2, v3, v4, v5, v6);
}

- (void)prepareForSyncUpInZone:(id)a3
{
  id v4 = a3;
  if (([(BRCPQLConnection *)self->_db isBatchSuspended] & 1) == 0)
  {
    int v10 = brc_bread_crumbs();
    unint64_t v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem createSyncUpJob].cold.7();
    }
  }
  if (![(BRCLocalItem *)self isReadAndUploaded]
    && ![(BRCLocalItem *)self isKnownByServerOrInFlight])
  {
    int v12 = brc_bread_crumbs();
    id v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem prepareForSyncUpSideCarZone]();
    }
  }
  unint64_t v5 = [(BRCLocalItem *)self maskForDiffsToSyncUpForZone:v4 sideCarZone:0 whenClearing:1];
  unint64_t localDiffs = self->_localDiffs;
  self->_unint64_t localDiffs = localDiffs & ~v5;
  if ([v4 isPrivateZone]
    && [(BRCLocalItem *)self isSharedToMeTopLevelItem])
  {
    self->_localDiffs &= 0xFFFFFFFFFFFF8000;
  }
  unint64_t v7 = localDiffs & v5;
  uint64_t v8 = [(BRCAccountSessionFPFS *)self->_session syncUpScheduler];
  uint64_t v9 = [v4 dbRowID];
  [v8 prepareItemForSyncUp:self inFlightDiffs:v7 inZone:v9];
}

- (void)markLatestSyncRequestFailedInZone:(id)a3
{
  id v4 = a3;
  if (([(BRCPQLConnection *)self->_db isBatchSuspended] & 1) == 0)
  {
    int v12 = brc_bread_crumbs();
    id v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem createSyncUpJob].cold.7();
    }
  }
  unint64_t v5 = [(BRCAccountSessionFPFS *)self->_session syncUpScheduler];
  uint64_t v6 = [v5 finishSyncUpForItem:self inZone:v4 success:0];

  unsigned int syncUpState = self->_syncUpState;
  if (syncUpState >= 2)
  {
    self->_localDiffs |= v6;
    if (syncUpState == 4)
    {
      [(BRCLocalItem *)self createSyncUpJob];
      int v8 = objc_msgSend(v4, "br_isEqualToNumber:", &unk_26F3DD190);
      session = self->_session;
      if (v8)
      {
        int v10 = [(BRCAccountSessionFPFS *)session containerScheduler];
        [v10 scheduleSyncUpForSideCar];
      }
      else
      {
        int v10 = [(BRCAccountSessionFPFS *)session serverZoneByRowID:v4];
        unint64_t v11 = [v10 clientZone];
        [v11 scheduleSyncUp];
      }
    }
  }
}

- (void)markLatestSyncRequestRejectedInZone:(id)a3
{
  db = self->_db;
  id v5 = a3;
  if (([(BRCPQLConnection *)db isBatchSuspended] & 1) == 0)
  {
    int v12 = brc_bread_crumbs();
    id v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem createSyncUpJob].cold.7();
    }
  }
  uint64_t v6 = [(BRCAccountSessionFPFS *)self->_session syncUpScheduler];
  [v6 finishSyncUpForItem:self inZone:v5 success:1];

  if ([(BRCItemID *)self->_itemID isDocumentsFolder])
  {
    unint64_t v7 = brc_bread_crumbs();
    int v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem markLatestSyncRequestRejectedInZone:]();
    }

    [(BRCAppLibrary *)self->_appLibrary clearStateBits:0x4000000];
LABEL_10:
    self->_unint64_t localDiffs = 0xFF003FF3FF7FFFLL;
    [(BRCLocalItem *)self createSyncUpJob];
    return;
  }
  unint64_t localDiffs = self->_localDiffs;
  if (([(BRCLocalItem *)self metadataSyncUpMask:0] & localDiffs) != 0)
  {
    int v10 = brc_bread_crumbs();
    unint64_t v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[BRCLocalItem markLatestSyncRequestRejectedInZone:]();
    }

    goto LABEL_10;
  }
  self->_unsigned int syncUpState = 1;
}

- (BOOL)markLatestSyncRequestAcknowledgedInZone:(id)a3
{
  db = self->_db;
  id v5 = a3;
  if (([(BRCPQLConnection *)db isBatchSuspended] & 1) == 0)
  {
    long long v17 = brc_bread_crumbs();
    uint64_t v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem createSyncUpJob].cold.7();
    }
  }
  uint64_t v6 = [(BRCAccountSessionFPFS *)self->_session syncUpScheduler];
  [v6 finishSyncUpForItem:self inZone:v5 success:1];

  unint64_t v7 = [(BRCAccountSessionFPFS *)self->_session syncUpScheduler];
  int v8 = [v7 isItemPendingSyncUp:self];

  if (v8)
  {
    uint64_t v9 = brc_bread_crumbs();
    int v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[BRCLocalItem markLatestSyncRequestAcknowledgedInZone:]();
    }

    if ([(BRCLocalItem *)self isSharedToMeChildItem])
    {
      unint64_t v11 = [(BRCAccountSessionFPFS *)self->_session containerScheduler];
      [v11 scheduleSyncUpForSideCar];
LABEL_7:
    }
  }
  else
  {
    unint64_t localDiffs = self->_localDiffs;
    if ((([(BRCLocalItem *)self metadataSyncUpMask:0] | 0x1000000000000000) & localDiffs) == 0)
    {
      self->_unsigned int syncUpState = 0;
      return v8 ^ 1;
    }
    unsigned int syncUpState = self->_syncUpState;
    if (syncUpState != 4)
    {
      if (syncUpState) {
        return v8 ^ 1;
      }
      unint64_t v11 = brc_bread_crumbs();
      uint64_t v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        -[BRCLocalItem markLatestSyncRequestAcknowledgedInZone:]();
      }

      goto LABEL_7;
    }
    int v14 = brc_bread_crumbs();
    long long v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[BRCLocalItem markLatestSyncRequestAcknowledgedInZone:]();
    }

    [(BRCLocalItem *)self createSyncUpJob];
  }
  return v8 ^ 1;
}

- (void)resetWhileKeepingClientItemsAndWantsUnlink:(BOOL)a3
{
  BOOL v3 = a3;
  self->_orig->_unsigned int syncUpState = 0;
  [(BRCLocalItem *)self markItemForgottenByServer];
  self->_localDiffs |= 0x400000000000000uLL;
  if (!v3
    || ([(BRCLocalItem *)self itemID],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isDocumentsFolder],
        v5,
        v6))
  {
    id v7 = [(BRCLocalItem *)self serverZone];
    self->_localDiffs |= [(BRCLocalItem *)self maskForDiffsToSyncUpForZone:v7 sideCarZone:0 whenClearing:0] & 0xFF003FF3FF7FFFLL;
  }
}

- (void)markItemForgottenByServer
{
  knownByServer = self->_knownByServer;
  self->_knownByServer = 0;

  st = self->_st;
  [(BRCStatInfo *)st setCkInfo:0];
}

- (void)handleUnknownItemError
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  BOOL v3 = [(BRCStatInfo *)self->_st ckInfo];
  if (v3 || ![(BRCLocalItem *)self isSharedToMeChildItem])
  {

    goto LABEL_8;
  }
  id v4 = [(BRCClientZone *)self->_clientZone mangledID];
  id v5 = +[BRCUserDefaults defaultsForMangledID:v4];
  int v6 = [v5 changeItemIDOnUnknownItem];

  if (!v6)
  {
LABEL_8:
    [(BRCLocalItem *)self markItemForgottenByServer];
    goto LABEL_9;
  }
  id v7 = brc_bread_crumbs();
  int v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    int v12 = v7;
    _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] Unknown item must need an itemID change%@", (uint8_t *)&v11, 0xCu);
  }

  unint64_t sharingOptions = self->_sharingOptions;
  int v10 = objc_alloc_init(BRCItemID);
  [(BRCLocalItem *)self learnItemID:v10 serverItem:0];

  self->_unint64_t sharingOptions = sharingOptions;
  self->_localDiffs |= 0x8000000000000000;
LABEL_9:
  [(BRCClientZone *)self->_clientZone scheduleSyncDownFirst];
}

- (void)markDead
{
  BOOL v3 = [(BRCLocalItem *)self isSharedToMeTopLevelItem];
  st = self->_st;
  if (v3)
  {
    id v5 = [(BRCAppLibrary *)self->_appLibrary documentsFolderItemID];
    [(BRCLocalStatInfo *)st _markDeadAsSharedTopLevelItemWithDocumentsItemID:v5];
  }
  else
  {
    [(BRCLocalStatInfo *)self->_st _markDead];
  }
  [(BRCLocalStatInfo *)self->_st _moveItemAsideWithUUIDString];
  self->_isUserVisible = 0;
}

- (void)markNeedsDeleteForRescheduleOfItem:(id)a3
{
  id v5 = a3;
  id v4 = [(BRCAccountSessionFPFS *)self->_session applyScheduler];
  if (![(BRCLocalItem *)self isDead]) {
    [(BRCLocalItem *)self markDead];
  }
  self->_forceDelete = 1;
  if (v5) {
    [v4 createApplyJobFromServerItem:v5 localItem:0 state:1 kind:1];
  }
}

- (void)markNeedsDeleteWhenAlreadyDeadInServerTruth
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: self.isDead && self.isDeadOrMissingInServerTruth%@", v2, v3, v4, v5, v6);
}

- (void)markNeedsDeleteForItemIDTransfer
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: self.isDead%@", v2, v3, v4, v5, v6);
}

- (void)moveAsideLocally
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _st.state == BRC_ITEM_STATE_TOMBSTONE%@", v2, v3, v4, v5, v6);
}

- (void)markRemovedFromFilesystemForServerEdit:(BOOL)a3
{
  [(BRCLocalItem *)self markDead];
  if (!a3)
  {
    [(BRCLocalItem *)self markNeedsUploadOrSyncingUp];
  }
}

- (void)updateStatMetadataFromServerItem:(id)a3
{
  st = self->_st;
  id v4 = [a3 st];
  [(BRCLocalStatInfo *)st _updateStatMeta:v4];
}

- (void)updateItemMetadataFromServerItem:(id)a3 appliedSharingPermission:(BOOL)a4
{
  id v6 = a3;
  id v7 = v6;
  if (!a4
    && (int sharingOptions = self->_sharingOptions,
        (([v6 sharingOptions] ^ sharingOptions) & 0x20) != 0))
  {
    unint64_t v9 = [v7 sharingOptions] ^ 0x20;
  }
  else
  {
    unint64_t v9 = [v7 sharingOptions];
  }
  self->_int sharingOptions = v9;
  if ((v9 & 4) == 0)
  {
    parentZoneRowID = self->_parentZoneRowID;
    int v11 = [(BRCClientZone *)self->_clientZone dbRowID];
    LODWORD(parentZoneRowID) = [(BRCZoneRowID *)parentZoneRowID br_isEqualToNumber:v11];

    if (parentZoneRowID)
    {
      int v12 = brc_bread_crumbs();
      uint64_t v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[BRCLocalItem updateItemMetadataFromServerItem:appliedSharingPermission:]();
      }

      int v14 = [(BRCClientZone *)self->_clientZone db];
      long long v15 = [v7 parentItemIDOnFS];
      __int16 v16 = [(BRCClientZone *)self->_clientZone dbRowID];
      long long v17 = (void *)[v14 numberWithSQL:@"SELECT item_sharing_options FROM client_items WHERE item_id = %@ AND zone_rowid = %@", v15, v16];

      self->_int sharingOptions = self->_sharingOptions & 0xFFFFFFFFFFFFFF83 | [v17 longLongValue] & 0x78;
    }
  }
  uint64_t v18 = [v7 ownerKey];
  ownerKey = self->_ownerKey;
  self->_ownerKey = v18;
}

- (id)computedDestinationFilenameFromServerItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 st];
  id v6 = [v5 logicalName];
  id v7 = [(BRCLocalItem *)self st];
  int v8 = [v7 logicalNameWithoutLocalBounce];
  if ([v6 isEqualToString:v8])
  {
    unint64_t v9 = [v4 parentItemIDOnFS];
    int v10 = [(BRCLocalItem *)self st];
    int v11 = [v10 parentID];
    int v12 = [v9 isEqualToItemID:v11];

    if (v12)
    {
      uint64_t v13 = [(BRCLocalItem *)self st];
      uint64_t v14 = [v13 logicalName];
      goto LABEL_6;
    }
  }
  else
  {
  }
  uint64_t v13 = [v4 st];
  uint64_t v14 = [v13 representableName];
LABEL_6:
  long long v15 = (void *)v14;

  return v15;
}

- (void)updateStructuralCKInfoFromServerItem:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 st];
  id v6 = [v5 ckInfo];

  id v7 = brc_bread_crumbs();
  int v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v18 = [v6 etag];
    int v23 = 138412802;
    id v24 = v18;
    __int16 v25 = 2112;
    id v26 = v4;
    __int16 v27 = 2112;
    int v28 = v7;
    _os_log_debug_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] updating st-etag:%@ from server item: %@%@", (uint8_t *)&v23, 0x20u);
  }
  if (!v4)
  {
    uint64_t v19 = brc_bread_crumbs();
    int v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem updateStructuralCKInfoFromServerItem:]();
    }
  }
  if (([v4 isSharedToMeTopLevelItem] & 1) == 0 && !v6)
  {
    uint64_t v21 = brc_bread_crumbs();
    BOOL v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem updateStructuralCKInfoFromServerItem:]();
    }
  }
  if ([(BRCLocalItem *)self isDocumentBeingCopiedToNewZone])
  {
    unint64_t v9 = [(BRCStatInfo *)self->_st ckInfo];
    int v10 = [v9 etagBeforeCrossZoneMove];
    [v6 setEtagBeforeCrossZoneMove:v10];
  }
  [(BRCLocalStatInfo *)self->_st _setCKInfo:v6];
  int v11 = [v4 st];
  int v12 = [v11 creatorRowID];
  [(BRCStatInfo *)self->_st setCreatorRowID:v12];

  if ([(BRCLocalItem *)self isSharedToMeChildItem])
  {
    uint64_t v13 = [v4 sideCarInfo];
    uint64_t v14 = [v13 ckInfo];
    sideCarCKInfo = self->_sideCarCKInfo;
    self->_sideCarCKInfo = v14;

    __int16 v16 = brc_bread_crumbs();
    long long v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[BRCLocalItem updateStructuralCKInfoFromServerItem:]();
    }
  }
}

- (id)_updateCrossZoneParent:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    int v23 = brc_bread_crumbs();
    id v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem _updateCrossZoneParent:]();
    }
  }
  uint64_t v5 = [(BRCLocalItem *)self itemGlobalID];
  id v6 = [v4 itemGlobalID];
  session = self->_session;
  int v8 = [v6 zoneRowID];
  unint64_t v9 = [(BRCAccountSessionFPFS *)session serverZoneByRowID:v8];
  int v10 = [v9 clientZone];

  int v11 = [v6 itemID];
  [(BRCStatInfo *)self->_st setParentID:v11];

  int v12 = [v6 zoneRowID];
  parentZoneRowID = self->_parentZoneRowID;
  self->_parentZoneRowID = v12;

  objc_storeStrong((id *)&self->_clientZone, v10);
  self->_serverZone = (BRCServerZone *)(id)[v10 serverZone];
  self->_orig->_unsigned int syncUpState = 0;
  uint64_t v14 = [(BRCStatInfo *)self->_st ckInfo];
  [v14 markCrossZoneMoved];

  if ([(BRCLocalItem *)self isDirectory]
    && ([(BRCLocalItem *)self asDirectory],
        long long v15 = objc_claimAutoreleasedReturnValue(),
        int v16 = [v15 handlePathMatchConflictForDirectoryCreationIfNecessary],
        v15,
        v16))
  {
    long long v17 = brc_bread_crumbs();
    uint64_t v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[BRCLocalItem _updateCrossZoneParent:]();
    }
  }
  else
  {
    long long v17 = objc_opt_new();
    [(BRCLocalItem *)self learnItemID:v17 serverItem:0];
  }

  self->_int sharingOptions = [v4 sharingOptions] & 0x78;
  uint64_t v19 = brc_bread_crumbs();
  int v20 = brc_default_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    BOOL v22 = BRCPrettyPrintBitmap();
    int v25 = 138412802;
    id v26 = v22;
    __int16 v27 = 2112;
    id v28 = v4;
    __int16 v29 = 2112;
    uint64_t v30 = v19;
    _os_log_debug_impl(&dword_23FA42000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] learning sharing options %@ from parent %@%@", (uint8_t *)&v25, 0x20u);
  }
  return v5;
}

- (void)_insertTombstoneForCrossZoneMove:(id)a3
{
  id v4 = a3;
  id v7 = (id)[(BRCLocalItem *)self copy];
  [v7 _markAsDeadTombstoneWithPreviousGlobalID:v4];

  [v7 markNeedsUploadOrSyncingUp];
  [v7 saveToDB];
  uint64_t v5 = [(BRCAccountSessionFPFS *)self->_session applyScheduler];
  id v6 = [v7 serverZone];
  [v5 rescheduleSuspendedJobsMatching:v6 inState:17];
}

- (void)_crossZoneMoveToParent:(id)a3
{
  id v4 = [(BRCLocalItem *)self _updateCrossZoneParent:a3];
  [(BRCLocalItem *)self saveToDB];
  [(BRCLocalItem *)self _insertTombstoneForCrossZoneMove:v4];
}

- (BOOL)needsReading
{
  return self->_syncUpState == 2;
}

- (BOOL)needsUpload
{
  return self->_syncUpState == 3;
}

- (BOOL)needsSyncUp
{
  return self->_syncUpState == 4;
}

- (BOOL)isReadAndUploaded
{
  unsigned int syncUpState = self->_syncUpState;
  if (syncUpState >= 9)
  {
    id v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem isReadAndUploaded]();
    }

    LOBYTE(v3) = 0;
  }
  else
  {
    return (0x73u >> syncUpState) & 1;
  }
  return v3;
}

- (BOOL)isIdleOrRejected
{
  return self->_syncUpState < 2;
}

- (BOOL)isRejected
{
  return self->_syncUpState == 1;
}

- (BOOL)startDownloadInTask:(id)a3 options:(unint64_t)a4 etagIfLoser:(id)a5 stageFileName:(id)a6 error:(id *)a7
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  memset(v33, 0, sizeof(v33));
  __brc_create_section(0, (uint64_t)"-[BRCLocalItem startDownloadInTask:options:etagIfLoser:stageFileName:error:]", 3446, v33);
  uint64_t v14 = brc_bread_crumbs();
  long long v15 = brc_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v31 = v33[0];
    unint64_t v32 = [(BRCLocalItem *)self appLibrary];
    __int16 v27 = [v32 logName];
    id v28 = [(BRCLocalItem *)self itemID];
    __int16 v29 = BRCPrettyPrintBitmap();
    *(_DWORD *)buf = 134219010;
    uint64_t v35 = (const char *)v31;
    __int16 v36 = 2112;
    unint64_t v37 = v27;
    __int16 v38 = 2112;
    int64_t v39 = v28;
    __int16 v40 = 2112;
    v41 = v29;
    __int16 v42 = 2112;
    id v43 = v14;
    _os_log_debug_impl(&dword_23FA42000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx request to download client item %@:%@ with options %@%@", buf, 0x34u);
  }
  BOOL v16 = [(BRCLocalItem *)self isDead];
  if (v16)
  {
    brc_bread_crumbs();
    long long v17 = (char *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = [(BRCLocalItem *)self itemID];
      *(_DWORD *)buf = 138412546;
      uint64_t v35 = v19;
      __int16 v36 = 2112;
      unint64_t v37 = v17;
      _os_log_impl(&dword_23FA42000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] ignoring download request for %@ because item is dead%@", buf, 0x16u);
    }
    int v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v21 = [(BRCLocalItem *)self itemID];
    BOOL v22 = [v21 itemIDString];
    int v23 = objc_msgSend(v20, "brc_errorItemNotFound:", v22);

    if (v23)
    {
      id v24 = brc_bread_crumbs();
      int v25 = brc_default_log();
      if (os_log_type_enabled(v25, (os_log_type_t)0x90u))
      {
        uint64_t v30 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        uint64_t v35 = "-[BRCLocalItem startDownloadInTask:options:etagIfLoser:stageFileName:error:]";
        __int16 v36 = 2080;
        if (!a7) {
          uint64_t v30 = "(ignored by caller)";
        }
        unint64_t v37 = v30;
        __int16 v38 = 2112;
        int64_t v39 = v23;
        __int16 v40 = 2112;
        v41 = v24;
        _os_log_error_impl(&dword_23FA42000, v25, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a7) {
      *a7 = v23;
    }
  }
  __brc_leave_section(v33);

  return !v16;
}

- (unint64_t)dbRowID
{
  return self->_dbRowID;
}

- (BRCItemID)itemID
{
  return self->_itemID;
}

- (BRCUserRowID)ownerKey
{
  return self->_ownerKey;
}

- (BRCLocalStatInfo)st
{
  return self->_st;
}

- (unsigned)syncUpState
{
  return self->_syncUpState;
}

- (BRCLocalItem)orig
{
  return self->_orig;
}

- (unint64_t)localDiffs
{
  return self->_localDiffs;
}

- (unint64_t)notifsRank
{
  return self->_notifsRank;
}

- (BRCServerZone)serverZone
{
  return self->_serverZone;
}

- (BRCClientZone)clientZone
{
  return self->_clientZone;
}

- (BRCAccountSessionFPFS)session
{
  return self->_session;
}

- (unint64_t)sharingOptions
{
  return self->_sharingOptions;
}

- (void)setSharingOptions:(unint64_t)a3
{
  self->_int sharingOptions = a3;
}

- (void)setAppLibrary:(id)a3
{
}

- (BRCPQLConnection)db
{
  return self->_db;
}

- (BOOL)isUserVisible
{
  return self->_isUserVisible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong(&self->_serverPathMatchID, 0);
  objc_storeStrong((id *)&self->_isInDocumentScope, 0);
  objc_storeStrong((id *)&self->_sideCarCKInfo, 0);
  objc_storeStrong((id *)&self->_parentFileID, 0);
  objc_storeStrong((id *)&self->_knownByServer, 0);
  objc_storeStrong((id *)&self->_minimumSupportedOSRowID, 0);
  objc_storeStrong((id *)&self->_orig, 0);
  objc_storeStrong((id *)&self->_st, 0);
  objc_storeStrong((id *)&self->_ownerKey, 0);
  objc_storeStrong((id *)&self->_parentZoneRowID, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_appLibrary, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_clientZone, 0);
}

- (id)baseStructureRecord
{
  if ([(BRCLocalItem *)self isSharedToMeTopLevelItem])
  {
    BOOL v3 = brc_bread_crumbs();
    id v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem(CKConversions) baseStructureRecord]();
    }

    uint64_t v5 = 0;
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x263EFD7C8]);
    id v7 = [(BRCLocalItem *)self structureRecordID];
    uint64_t v5 = (void *)[v6 initWithRecordType:@"structure" recordID:v7];
  }
  return v5;
}

- (id)structureRecordBeingDeadInServerTruth:(BOOL)a3 stageID:(id)a4 shouldPCSChainStatus:(unsigned __int8)a5 saltGetter:(id)a6 childBasehashSaltGetter:(id)a7
{
  uint64_t v9 = a5;
  BOOL v10 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  if ([(BRCLocalItem *)self isSharedToMeTopLevelItem])
  {
    brc_bread_crumbs();
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem(CKConversions) baseStructureRecord]();
    }
  }
  else
  {
    id v15 = [(BRCLocalItem *)self baseStructureRecord];
    unint64_t localDiffs = self->_localDiffs;
    id v23 = 0;
    char v18 = [v15 serializeStatInfo:self diffs:localDiffs stageID:v12 deadInServerTruth:v10 shouldPCSChainStatus:v9 basehashSaltGetter:v13 childBasehashSaltGetter:v14 error:&v23];
    BOOL v16 = v23;
    if (v18)
    {
      [(BRCLocalItem *)self serializeStructuralPluginHints:v15];
      id v15 = v15;
      uint64_t v19 = v15;
      goto LABEL_10;
    }
    int v20 = brc_bread_crumbs();
    uint64_t v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[BRCLocalItem(CKConversions) structureRecordBeingDeadInServerTruth:stageID:shouldPCSChainStatus:saltGetter:childBasehashSaltGetter:]();
    }
  }
  uint64_t v19 = 0;
LABEL_10:

  return v19;
}

- (id)sideCarRecordID
{
  if ([(BRCLocalItem *)self isSharedToMeChildItem])
  {
    BOOL v3 = [(BRCLocalItem *)self itemID];
    id v4 = [(BRCLocalItem *)self serverZone];
    uint64_t v5 = [v4 asSharedZone];
    id v6 = [v3 sideCarRecordIDWithZone:v5];
  }
  else
  {
    id v7 = brc_bread_crumbs();
    int v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem(CKConversions) sideCarRecordID]();
    }

    id v6 = 0;
  }
  return v6;
}

- (id)baseSideCarRecord
{
  id v3 = objc_alloc(MEMORY[0x263EFD7C8]);
  id v4 = [(BRCLocalItem *)self sideCarRecordID];
  uint64_t v5 = (void *)[v3 initWithRecordType:@"perParticipantMetadata" recordID:v4];

  return v5;
}

- (void)serializeStructuralPluginHints:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(BRCLocalItem *)self isFromInitialScan];
  id v6 = [(BRCLocalItem *)self serverPathMatchItemID];
  if (v6)
  {
    id v7 = [(BRCClientZone *)self->_clientZone itemByItemID:v6];
    int v8 = v7;
    if (!v7 || ![(BRCLocalItem *)v7 isDead] && v5)
    {
      uint64_t v9 = 0;
      BOOL v10 = 0;
      goto LABEL_20;
    }
    id v11 = [(BRCLocalItem *)v8 structureRecordID];
    id v12 = brc_bread_crumbs();
    id v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      int v23 = 138412802;
      id v24 = self;
      __int16 v25 = 2112;
      id v26 = v8;
      __int16 v27 = 2112;
      id v28 = v12;
      _os_log_debug_impl(&dword_23FA42000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] path match info for %@ is %@%@", (uint8_t *)&v23, 0x20u);
    }

    BOOL v10 = (void *)[objc_alloc(MEMORY[0x263EFD820]) initWithRecordID:v11 action:0];
    id v14 = [(BRCLocalItem *)v8 st];
    id v15 = [v14 ckInfo];
    uint64_t v9 = [v15 etag];

    if (v9)
    {
      if (v10)
      {
LABEL_19:

LABEL_20:
        if (!v5) {
          goto LABEL_21;
        }
        goto LABEL_23;
      }
    }
    else
    {
      BOOL v16 = brc_bread_crumbs();
      long long v17 = brc_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 138412802;
        id v24 = v8;
        __int16 v25 = 2112;
        id v26 = self;
        __int16 v27 = 2112;
        id v28 = v16;
        _os_log_impl(&dword_23FA42000, v17, OS_LOG_TYPE_DEFAULT, "[WARNING] we have no etag for %@\npath matching: %@%@", (uint8_t *)&v23, 0x20u);
      }

      if (v10) {
        goto LABEL_19;
      }
    }
    char v18 = brc_bread_crumbs();
    uint64_t v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138412802;
      id v24 = v8;
      __int16 v25 = 2112;
      id v26 = self;
      __int16 v27 = 2112;
      id v28 = v18;
      _os_log_impl(&dword_23FA42000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] we have no reference for %@\npath matching: %@%@", (uint8_t *)&v23, 0x20u);
    }

    goto LABEL_19;
  }
  uint64_t v9 = 0;
  BOOL v10 = 0;
  if (!v5)
  {
LABEL_21:
    if (!v10 || !v9) {
      goto LABEL_32;
    }
  }
LABEL_23:
  int v20 = [v4 pluginFields];
  if (v20)
  {
    uint64_t v21 = [v4 pluginFields];
    BOOL v22 = (void *)[v21 mutableCopy];
  }
  else
  {
    BOOL v22 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:3];
  }

  if (v5) {
    [v22 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"br_initialItem"];
  }
  if (v10 && v9)
  {
    [v22 setObject:v10 forKeyedSubscript:@"br_pathMatchID"];
    [v22 setObject:v9 forKeyedSubscript:@"br_pathMatchEtag"];
  }
  [v4 setPluginFields:v22];

LABEL_32:
}

- (id)structureRecordID
{
  if ([(BRCLocalItem *)self isSharedToMeTopLevelItem])
  {
    id v3 = brc_bread_crumbs();
    id v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem(CKConversions) structureRecordID]();
    }

    BOOL v5 = 0;
  }
  else
  {
    id v6 = [(BRCLocalItem *)self itemID];
    uint64_t v7 = [(BRCStatInfo *)self->_st type];
    serverZone = self->_serverZone;
    if ([(BRCLocalItem *)self isBRAlias])
    {
      uint64_t v9 = [(BRCLocalItem *)self asBRAlias];
      BOOL v10 = [v9 targetClientZone];
      BOOL v5 = objc_msgSend(v6, "structureRecordIDForItemType:zone:aliasTargetZoneIsShared:", v7, serverZone, objc_msgSend(v10, "isSharedZone"));
    }
    else
    {
      BOOL v5 = [v6 structureRecordIDForItemType:v7 zone:serverZone aliasTargetZoneIsShared:1];
    }
  }
  return v5;
}

- (BOOL)logicalNameNeedsRename
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(BRCLocalStatInfo *)self->_st rawBouncedLogicalName];
  if (v3)
  {
    id v4 = (void *)v3;
    BOOL v5 = [(BRCLocalStatInfo *)self->_st rawBouncedLogicalName];
    id v6 = [(BRCLocalStatInfo *)self->_st logicalNameWithoutLocalBounce];
    char v7 = [v5 isEqualToString:v6];

    if (v7)
    {
LABEL_3:
      LOBYTE(v3) = 0;
      return v3;
    }
    uint64_t v22 = 0;
    int v8 = [(BRCLocalStatInfo *)self->_st logicalNameWithoutLocalBounce];
    uint64_t v9 = objc_msgSend(v8, "br_stringByDeletingPathBounceNo:", &v22);

    BOOL v10 = [(BRCLocalStatInfo *)self->_st logicalName];
    id v11 = objc_msgSend(v10, "br_stringByDeletingPathBounceNo:", &v22);

    if ([v9 isEqualToString:v11])
    {
      id v12 = [(BRCAccountSessionFPFS *)self->_session serverZoneByRowID:self->_parentZoneRowID];
      id v13 = [v12 clientZone];

      id v14 = [(BRCStatInfo *)self->_st parentID];
      id v15 = [(BRCLocalStatInfo *)self->_st logicalNameWithoutLocalBounce];
      char v16 = [v13 existsByParentID:v14 andLogicalName:v15 excludingItemID:self->_itemID];

      if (v16)
      {

        goto LABEL_3;
      }
      uint64_t v19 = brc_bread_crumbs();
      int v20 = brc_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[BRCLocalItem(FPFSAdditions) logicalNameNeedsRename]();
      }
    }
    else
    {
      long long v17 = brc_bread_crumbs();
      char v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        id v24 = v9;
        __int16 v25 = 2112;
        id v26 = v11;
        __int16 v27 = 2112;
        id v28 = v17;
        _os_log_debug_impl(&dword_23FA42000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] Needs rename because local name %@ differs from real name %@%@", buf, 0x20u);
      }
    }
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)isMigratingToFPFS
{
  return self->_syncUpState - 5 < 2;
}

- (BOOL)dbItemIsMigratingToFPFS
{
  id v2 = [(PQLConnection *)self->_db numberWithSQL:@"SELECT item_localsyncupstate FROM client_items WHERE rowid = %llu", self->_dbRowID];
  int v3 = [v2 intValue];

  return (v3 - 5) < 2;
}

- (void)markFromInitialScan
{
  int v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[BRCLocalItem(FPFSAdditions) markFromInitialScan]();
  }

  self->_localDiffs |= 0x8000000000000000;
}

- (void)markDoneMigratingToFPFS
{
  if ([(BRCLocalItem *)self isMigratingToFPFS])
  {
    if ([(BRCLocalItem *)self hasValidCKInfo]) {
      unsigned int v3 = 0;
    }
    else {
      unsigned int v3 = 4;
    }
    self->_unsigned int syncUpState = v3;
  }
}

- (void)markCannotSynchronizeForTooDeepHierarchy
{
  self->_unsigned int syncUpState = 8;
}

- (void)markBouncedToNextAvailableBounceNumber:(int)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = [(BRCLocalStatInfo *)self->_st logicalNameWithoutLocalBounce];
  BOOL v5 = [(BRCLocalStatInfo *)self->_st rawBouncedLogicalName];
  id v6 = v5;
  id v37 = 0;
  uint64_t v38 = 0;
  if (!v5) {
    BOOL v5 = v4;
  }
  __int16 v36 = objc_msgSend(v5, "br_stringByDeletingPathBounceNo:andPathExtension:", &v38, &v37);
  id v35 = v37;
  if ((unint64_t)(v38 + 1) > 2) {
    unint64_t v7 = v38 + 1;
  }
  else {
    unint64_t v7 = 2;
  }
  int64_t v34 = self;
  int v8 = [(BRCAppLibrary *)self->_appLibrary mangledID];
  uint64_t v9 = +[BRCUserDefaults defaultsForMangledID:v8];
  uint64_t v10 = [v9 ubiquitousMigrationMaxBouncingAttempts];

  if (v6)
  {
    *(void *)buf = 0;
    id v12 = (id)objc_msgSend(v4, "br_stringByDeletingPathBounceNo:", buf);
    uint64_t v13 = v38;
    if (*(void *)buf != v38) {
      unint64_t v7 = *(void *)buf;
    }
  }
  else
  {
    uint64_t v13 = v38;
  }
  if (v7 < v13 + v10)
  {
    *(void *)&long long v11 = 138412290;
    long long v31 = v11;
    uint64_t v33 = v10;
    do
    {
      if (v6) {
        BOOL v14 = v7 == v13;
      }
      else {
        BOOL v14 = 0;
      }
      char v15 = v14;
      if (v7 != 1 && (v15 & 1) == 0)
      {
        if (v7)
        {
          char v16 = [NSNumber numberWithUnsignedInteger:v7];
        }
        else
        {
          char v16 = 0;
        }
        long long v17 = v4;
        char v18 = objc_msgSend(v16, "stringValue", v31);
        uint64_t v19 = objc_msgSend(v36, "brc_representableHFSFileNameWithSuffix:addedExtension:makeDotFile:", v18, v35, 0);

        if ([v6 isEqualToString:v19])
        {
          __int16 v25 = brc_bread_crumbs();
          id v26 = brc_default_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v31;
            *(void *)&uint8_t buf[4] = v25;
            _os_log_fault_impl(&dword_23FA42000, v26, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: ![alreadyBouncedName isEqualToString:bouncedLogicalName]%@", buf, 0xCu);
          }
        }
        int v20 = [(BRCLocalItem *)v34 parentClientZone];
        uint64_t v21 = [(BRCLocalItem *)v34 st];
        uint64_t v22 = [v21 parentID];
        int v23 = [(BRCLocalItem *)v34 itemID];
        id v24 = [v20 liveItemByParentID:v22 andCaseInsensitiveLogicalName:v19 excludingItemID:v23];

        if (!v24)
        {
          id v4 = v17;
          if ([v17 isEqualToString:v19]) {
            __int16 v27 = 0;
          }
          else {
            __int16 v27 = v19;
          }
          [(BRCLocalStatInfo *)v34->_st setRawBouncedLogicalName:v27];
          id v28 = brc_bread_crumbs();
          uint64_t v29 = brc_default_log();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v34;
            __int16 v40 = 2112;
            v41 = v28;
            _os_log_debug_impl(&dword_23FA42000, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] Locally bounced %@%@", buf, 0x16u);
          }

          break;
        }

        id v4 = v17;
        uint64_t v10 = v33;
      }
      ++v7;
      uint64_t v13 = v38;
    }
    while (v7 < v38 + v10);
  }
  if (a3)
  {
    uint64_t v30 = [(BRCAccountSessionFPFS *)v34->_session analyticsReporter];
    [v30 aggregateReportForAppTelemetryIdentifier:a3 error:0];
  }
}

- (void)_updateAppLibraryFromParent:(id)a3
{
  id v4 = [a3 appLibrary];
  appLibrary = self->_appLibrary;
  self->_appLibrary = v4;

  if (!self->_appLibrary)
  {
    id v6 = brc_bread_crumbs();
    unint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem _refreshAppLibraryFromParent]();
    }
  }
}

- (void)_updateParent:(id)a3 forceTopLevelShareMove:(BOOL)a4
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(BRCLocalItem *)self clientZone];
  uint64_t v8 = [v6 clientZone];
  if (!a4 && [(BRCLocalItem *)self isSharedToMeTopLevelItem])
  {
    uint64_t v9 = [v6 clientZone];
    int v10 = [v9 isSharedZone];

    if (!v10) {
      goto LABEL_4;
    }
LABEL_8:
    brc_bread_crumbs();
    long long v11 = (BRCLocalItem *)objc_claimAutoreleasedReturnValue();
    id v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v48 = self;
      __int16 v49 = 2112;
      uint64_t v50 = v7;
      __int16 v51 = 2112;
      uint64_t v52 = v8;
      __int16 v53 = 2112;
      __int16 v54 = v11;
      _os_log_impl(&dword_23FA42000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] Item %@ is moving across zones from %@ to %@%@", buf, 0x2Au);
    }
    goto LABEL_10;
  }
  if (v7 != v8) {
    goto LABEL_8;
  }
LABEL_4:
  if ([(BRCLocalItem *)self isSharedToMeTopLevelItem])
  {
    long long v11 = [(BRCLocalItem *)self asSharedToMeTopLevelItem];
    id v12 = [v6 clientZone];
    uint64_t v13 = [v12 dbRowID];
    [(BRCLocalItem *)v11 updateParentZoneRowID:v13];

    goto LABEL_6;
  }
  if (![(BRCLocalItem *)self isSharedToMeChildItem]) {
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x263EFD7E8], "brc_fetchShareIDWithSharedItem:", self);
  long long v11 = (BRCLocalItem *)objc_claimAutoreleasedReturnValue();
  id v12 = objc_msgSend(MEMORY[0x263EFD7E8], "brc_fetchShareIDWithSharedItem:", v6);
  if (!v12
    || ([(BRCLocalItem *)v11 recordName],
        BOOL v14 = objc_claimAutoreleasedReturnValue(),
        [v12 recordName],
        char v15 = objc_claimAutoreleasedReturnValue(),
        char v16 = [v14 isEqualToString:v15],
        v15,
        v14,
        (v16 & 1) == 0))
  {
    long long v17 = brc_bread_crumbs();
    char v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v48 = v11;
      __int16 v49 = 2112;
      uint64_t v50 = (uint64_t)v12;
      __int16 v51 = 2112;
      uint64_t v52 = (uint64_t)v17;
      _os_log_impl(&dword_23FA42000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] This is a cross share move from %@ to %@%@", buf, 0x20u);
    }

LABEL_10:
    [(BRCLocalItem *)self _crossZoneMoveToParent:v6];
    goto LABEL_18;
  }
LABEL_6:

LABEL_17:
  uint64_t v19 = [v6 itemID];
  [(BRCStatInfo *)self->_st setParentID:v19];

  int v20 = [v6 clientZone];
  uint64_t v21 = [v20 dbRowID];
  parentZoneRowID = self->_parentZoneRowID;
  self->_parentZoneRowID = v21;

LABEL_18:
  [(BRCLocalItem *)self _updateAppLibraryFromParent:v6];
  int v23 = [v6 itemScope];
  id v24 = [v6 clientZone];
  __int16 v25 = [v24 zoneName];
  uint64_t v46 = self;
  id v43 = (void *)v8;
  uint64_t v44 = (void *)v7;
  if ([v25 isEqualToString:*MEMORY[0x263F32320]])
  {
    [v6 st];
    v27 = int v26 = v23;
    id v28 = [v27 logicalName];
    int v29 = [v28 isEqualToString:*MEMORY[0x263F324D0]];

    if (v29) {
      int v26 = 2;
    }
    unsigned int v45 = v26;
  }
  else
  {
    unsigned int v45 = v23;
  }
  uint64_t v30 = [v6 isUserVisible];
  long long v31 = [v6 itemID];
  uint64_t v32 = [v31 isNonDesktopRoot];
  uint64_t v33 = [(BRCLocalStatInfo *)v46->_st logicalName];
  char v34 = [v6 isZoneRoot];
  if (v34)
  {
    id v35 = 0;
  }
  else
  {
    uint64_t v42 = [v6 st];
    id v35 = [v42 logicalName];
  }
  __int16 v36 = [v6 appLibrary];
  v46->_isUserVisible = +[BRCLocalItem computeUserVisibleStatusOfLiveItemWithParentVisible:v30 parentIsNonDesktopRoot:v32 parentScope:v45 itemFilename:v33 parentFilename:v35 appLibrary:v36];

  if ((v34 & 1) == 0)
  {
  }
  id v37 = [v6 itemID];
  uint64_t v38 = [v37 isNonDesktopRoot];
  int64_t v39 = [v6 itemID];
  uint64_t v40 = [v39 isDocumentsFolder];
  v41 = [(BRCLocalStatInfo *)v46->_st logicalName];
  [(BRCLocalStatInfo *)v46->_st setItemScope:+[BRCLocalItem computeItemScopeFromParentIsRoot:v38 parentIsDocuments:v40 parentScope:v45 logicalName:v41]];

  if ((v46->_sharingOptions & 4) == 0) {
    v46->_int sharingOptions = [v6 sharingOptions] & 0x78;
  }
}

- (void)updateWithLogicalName:(id)a3 newParent:(id)a4
{
}

- (void)updateWithLogicalName:(id)a3 newParent:(id)a4 forceTopLevelShareMove:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  int v10 = [(BRCLocalItem *)self itemID];
  int v11 = [v10 isDocumentsFolder];

  if (v11)
  {
    id v12 = brc_bread_crumbs();
    uint64_t v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[BRCLocalItem(FPFSAdditions) updateWithLogicalName:newParent:forceTopLevelShareMove:]();
    }
  }
  else
  {
    if (v8) {
      [(BRCLocalStatInfo *)self->_st setFilename:v8];
    }
    if (v9) {
      [(BRCLocalItem *)self _updateParent:v9 forceTopLevelShareMove:v5];
    }
  }
}

- (void)_updatePropagatedInfoIfNeeded
{
  if (([(BRCLocalItem *)self diffAgainstOriginalItem] & 0x1000000060) != 0)
  {
    [(BRCLocalItem *)self _refreshAppLibraryFromParent];
    [(BRCLocalItem *)self _recomputeUserVisibleAndItemScope];
  }
}

- (BOOL)updateFromServerItem:(id)a3
{
  id v4 = a3;
  if ([(BRCLocalItem *)self isIdleOrRejected]
    || [(BRCLocalItem *)self isShareAcceptationFault])
  {
    BOOL v5 = [v4 parentZoneOnFS];
    id v6 = [v5 dbRowID];
    parentZoneRowID = self->_parentZoneRowID;
    self->_parentZoneRowID = v6;

    if ([v4 isBRAlias])
    {
      [(BRCLocalStatInfo *)self->_st _updateStatAliasMeta:v4];
    }
    else
    {
      id v8 = [v4 ownerKey];
      ownerKey = self->_ownerKey;
      self->_ownerKey = v8;

      self->_int sharingOptions = [v4 sharingOptions];
      [(BRCLocalStatInfo *)self->_st _updateStatMetaFromServer:v4];
      uint64_t v10 = [(BRCLocalStatInfo *)self->_st rawBouncedLogicalName];
      if (v10)
      {
        int v11 = (void *)v10;
        id v12 = [(BRCLocalItem *)self parentClientZone];
        uint64_t v13 = [(BRCLocalItem *)self st];
        BOOL v14 = [v13 parentID];
        char v15 = [(BRCLocalItem *)self st];
        char v16 = [v15 logicalNameWithoutLocalBounce];
        long long v17 = [(BRCLocalItem *)self itemID];
        char v22 = [v12 existsByParentID:v14 andLogicalName:v16 excludingItemID:v17];

        if ((v22 & 1) == 0) {
          [(BRCLocalStatInfo *)self->_st clearBouncedName];
        }
      }
      [(BRCLocalItem *)self updateItemMetadataFromServerItem:v4 appliedSharingPermission:0];
    }
    [(BRCLocalItem *)self _updatePropagatedInfoIfNeeded];
    BOOL v18 = 1;
  }
  else
  {
    uint64_t v19 = brc_bread_crumbs();
    int v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem(FPFSAdditions) updateFromServerItem:]();
    }

    BOOL v18 = 0;
  }

  return v18;
}

- (void)_moveToZoneWhenServerItemIsDead:(id)a3
{
  id v9 = a3;
  BOOL v5 = objc_opt_new();
  [(BRCLocalItem *)self learnItemID:v5 serverItem:0];

  [(BRCLocalItem *)self markItemForgottenByServer];
  objc_storeStrong((id *)&self->_clientZone, a3);
  self->_serverZone = (BRCServerZone *)(id)[v9 serverZone];
  id v6 = [(BRCLocalStatInfo *)self->_st rawBouncedLogicalName];
  st = self->_st;
  if (v6)
  {
    [(BRCStatInfo *)st setLogicalName:v6];
  }
  else
  {
    id v8 = [(BRCLocalStatInfo *)st logicalName];
    [(BRCStatInfo *)self->_st setLogicalName:v8];
  }
}

- (void)updateWithFavoriteRank:(unint64_t)a3
{
}

- (void)updateWithFinderTagNames:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    BOOL v5 = objc_alloc_init(BRFieldFinderTags);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          -[BRFieldFinderTags addTags:](v5, "addTags:", *(void *)(*((void *)&v13 + 1) + 8 * v10++), (void)v13);
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    st = self->_st;
    id v12 = [(BRFieldFinderTags *)v5 data];
    [(BRCStatInfo *)st setFinderTags:v12];
  }
  else
  {
    [(BRCStatInfo *)self->_st setFinderTags:0];
  }
}

- (void)updateWithLastUsedDate:(id)a3
{
  st = self->_st;
  [a3 timeIntervalSince1970];
  [(BRCStatInfo *)st setLastUsedTime:(unint64_t)v4];
}

- (void)updateToBeInTrashWithParent:(id)a3 trashPutBackPath:(id)a4 trashPutBackParentID:(id)a5
{
  id v8 = a4;
  parentZoneRowID = self->_parentZoneRowID;
  id v10 = a5;
  id v11 = a3;
  id v12 = [v11 zoneRowID];
  if ([(BRCZoneRowID *)parentZoneRowID br_isEqualToNumber:v12])
  {
LABEL_6:

    goto LABEL_7;
  }
  long long v13 = [(BRCAccountSessionFPFS *)self->_session serverZoneByRowID:self->_parentZoneRowID];
  char v14 = [v13 isSharedZone];

  if ((v14 & 1) == 0)
  {
    id v12 = brc_bread_crumbs();
    long long v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem(FPFSAdditions) updateToBeInTrashWithParent:trashPutBackPath:trashPutBackParentID:]();
    }

    goto LABEL_6;
  }
LABEL_7:
  [(BRCStatInfo *)self->_st setTrashPutBackPath:v8];
  [(BRCStatInfo *)self->_st setTrashPutBackParentID:v10];

  st = self->_st;
  long long v17 = [v11 itemID];
  [(BRCStatInfo *)st setParentID:v17];

  uint64_t v18 = [v11 zoneRowID];

  uint64_t v19 = self->_parentZoneRowID;
  self->_parentZoneRowID = v18;

  [(BRCLocalStatInfo *)self->_st setItemScope:3];
  [(BRCLocalItem *)self _recomputeUserVisibleAndItemScope];
}

- (void)updateToBeUntrashedWithParent:(id)a3
{
  parentZoneRowID = self->_parentZoneRowID;
  id v5 = a3;
  id v6 = [v5 zoneRowID];
  LOBYTE(parentZoneRowID) = [(BRCZoneRowID *)parentZoneRowID br_isEqualToNumber:v6];

  if ((parentZoneRowID & 1) == 0)
  {
    id v11 = brc_bread_crumbs();
    id v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem(FPFSAdditions) updateToBeUntrashedWithParent:]();
    }
  }
  [(BRCStatInfo *)self->_st setTrashPutBackPath:0];
  [(BRCStatInfo *)self->_st setTrashPutBackParentID:0];
  st = self->_st;
  id v8 = [v5 itemID];
  [(BRCStatInfo *)st setParentID:v8];

  uint64_t v9 = [v5 zoneRowID];

  id v10 = self->_parentZoneRowID;
  self->_parentZoneRowID = v9;

  [(BRCLocalStatInfo *)self->_st setItemScope:2];
  [(BRCLocalItem *)self _recomputeUserVisibleAndItemScope];
}

- (BOOL)updateWithImportObject:(id)a3 onlyContentDependentProperties:(BOOL)a4 error:(id *)a5
{
  BOOL v5 = a4;
  id v7 = a3;
  id v8 = [v7 appLibrary];
  appLibrary = self->_appLibrary;
  self->_appLibrary = v8;

  id v10 = [v7 parentItemGlobalID];
  id v11 = [v10 zoneRowID];
  parentZoneRowID = self->_parentZoneRowID;
  self->_parentZoneRowID = v11;

  if (!v5)
  {
    self->_isUserVisible = [v7 isUserVisible];
    self->_int sharingOptions = [v7 sharingOptions];
    -[BRCLocalStatInfo setItemScope:](self->_st, "setItemScope:", [v7 itemScope]);
  }
  [(BRCLocalStatInfo *)self->_st updateFromImportObject:v7 onlyContentDependentProperties:v5];

  return 1;
}

- (void)updateWithCreationDate:(id)a3
{
  [a3 timeIntervalSince1970];
  st = self->_st;
  [(BRCStatInfo *)st setBirthtime:(uint64_t)v4];
}

- (void)updateWithFileSystemFlags:(unint64_t)a3
{
  st = self->_st;
  BOOL v6 = [(BRCLocalItem *)self isPackage] || [(BRCLocalItem *)self isDirectory];
  [(BRCLocalStatInfo *)st updateWithFileSystemFlags:a3 ignoreExecutable:v6];
  if ((a3 & 8) != 0)
  {
    self->_isUserVisible = 0;
  }
  else if (!self->_isUserVisible && ![(BRCLocalItem *)self isInDataScope])
  {
    [(BRCLocalItem *)self _recomputeUserVisibleAndItemScope];
  }
}

- (void)updateWithXattrs:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v22 = 0;
  id obj = 0;
  +[BRFieldXattrBlob loadXattrsFromDictionary:a3 structuralBlob:&obj contentBlob:&v22];
  double v4 = [(BRCAccountSessionFPFS *)self->_session stageRegistry];
  objc_storeStrong((id *)&self->_st->super._lazyXattr, obj);
  uint64_t v5 = objc_msgSend(obj, "brc_signature");
  st = self->_st;
  xattrSignature = st->super._xattrSignature;
  st->super._xattrSignature = (NSData *)v5;

  if (obj)
  {
    id v21 = 0;
    if (([v4 saveXattrBlob:obj forSignature:self->_st->super._xattrSignature error:&v21] & 1) == 0)
    {
      id v8 = brc_bread_crumbs();
      uint64_t v9 = brc_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        uint64_t v19 = [(BRCStatInfo *)self->_st xattrSignature];
        *(_DWORD *)buf = 138412802;
        __int16 v25 = v19;
        __int16 v26 = 2112;
        id v27 = v21;
        __int16 v28 = 2112;
        int v29 = v8;
        _os_log_fault_impl(&dword_23FA42000, v9, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Failed to save xattr blob to stage for signature %@ - %@%@", buf, 0x20u);
      }
    }
  }
  if ([(BRCLocalItem *)self isDocument])
  {
    id v10 = [(BRCLocalItem *)self asDocument];
    uint64_t v11 = [v10 currentVersion];
    id v12 = (void *)v11;
    if (v11)
    {
      objc_storeStrong((id *)(v11 + 72), v22);
      long long v13 = objc_msgSend(v22, "brc_signature");
      [v12 setXattrSignature:v13];

      if (v22)
      {
        id v21 = 0;
        char v14 = [(BRCAccountSessionFPFS *)self->_session stageRegistry];
        id v15 = v22;
        long long v16 = [v12 xattrSignature];
        LOBYTE(v15) = [v14 saveXattrBlob:v15 forSignature:v16 error:&v21];

        if ((v15 & 1) == 0)
        {
          long long v17 = brc_bread_crumbs();
          uint64_t v18 = brc_default_log();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          {
            int v20 = [(BRCStatInfo *)self->_st xattrSignature];
            *(_DWORD *)buf = 138412802;
            __int16 v25 = v20;
            __int16 v26 = 2112;
            id v27 = v21;
            __int16 v28 = 2112;
            int v29 = v17;
            _os_log_fault_impl(&dword_23FA42000, v18, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Failed to save xattr blob to stage for signature %@ - %@%@", buf, 0x20u);
          }
        }
      }
    }
  }
}

- (id)_initWithImportObject:(id)a3 error:(id *)a4
{
  id v7 = a3;
  v31.receiver = self;
  v31.super_class = (Class)BRCLocalItem;
  id v8 = [(BRCLocalItem *)&v31 init];
  if (!v8) {
    goto LABEL_12;
  }
  uint64_t v9 = (BRCAccountSessionFPFS *)(id)[v7 session];
  v8->_session = v9;
  uint64_t v10 = [(BRCAccountSessionFPFS *)v9 clientDB];
  db = v8->_db;
  v8->_db = (BRCPQLConnection *)v10;

  uint64_t v12 = [v7 appLibrary];
  appLibrary = v8->_appLibrary;
  v8->_appLibrary = (BRCAppLibrary *)v12;

  if ([v7 isDocumentsFolder])
  {
    uint64_t v14 = [(BRCAppLibrary *)v8->_appLibrary defaultClientZone];
    uint64_t v15 = 24;
    clientZone = v8->_clientZone;
    v8->_clientZone = (BRCClientZone *)v14;

    v8->_serverZone = (BRCServerZone *)[(BRCClientZone *)v8->_clientZone serverZone];
    long long v17 = [(BRCAppLibrary *)v8->_appLibrary documentsFolderItemID];
  }
  else
  {
    session = v8->_session;
    uint64_t v15 = [v7 parentItemGlobalID];
    double v4 = [(id)v15 zoneRowID];
    v8->_serverZone = (BRCServerZone *)[(BRCAccountSessionFPFS *)session serverZoneByRowID:v4];

    uint64_t v19 = [(BRCServerZone *)v8->_serverZone clientZone];
    int v20 = v8->_clientZone;
    v8->_clientZone = (BRCClientZone *)v19;

    long long v17 = objc_alloc_init(BRCItemID);
  }
  itemID = v8->_itemID;
  v8->_itemID = v17;

  id v22 = [v7 parentItemGlobalID];
  uint64_t v23 = [v22 zoneRowID];
  parentZoneRowID = v8->_parentZoneRowID;
  v8->_parentZoneRowID = (BRCZoneRowID *)v23;

  BOOL v25 = [(BRCServerZone *)v8->_serverZone isPrivateZone];
  if (v25)
  {
    __int16 v26 = &unk_26F3DD280;
  }
  else
  {
    id v27 = v8->_session;
    uint64_t v15 = [(BRCServerZone *)v8->_serverZone asSharedZone];
    double v4 = [(id)v15 ownerName];
    __int16 v26 = [(BRCAccountSessionFPFS *)v27 userKeyForOwnerName:v4 db:v8->_db];
  }
  objc_storeStrong((id *)&v8->_ownerKey, v26);
  if (!v25)
  {
  }
  __int16 v28 = [[BRCLocalStatInfo alloc] initWithImportObject:v7 error:a4];
  st = v8->_st;
  v8->_st = v28;

  if (v28)
  {
    v8->_isUserVisible = [v7 isUserVisible];
    v8->_int sharingOptions = [v7 sharingOptions];
    -[BRCLocalStatInfo setItemScope:](v8->_st, "setItemScope:", [v7 itemScope]);
LABEL_12:
    __int16 v28 = v8;
  }

  return v28;
}

- (id)computeItemPathRelativeToRoot
{
  unsigned int v3 = [(BRCLocalItem *)self appLibrary];
  double v4 = [v3 mangledID];
  uint64_t v5 = +[BRCUserDefaults defaultsForMangledID:v4];
  uint64_t v6 = [v5 maxSyncPathDepth];

  id v7 = objc_opt_new();
  if ([(BRCLocalItem *)self isFSRoot])
  {
    id v8 = @"/";
  }
  else
  {
    db = self->_db;
    uint64_t v10 = [(BRCStatInfo *)self->_st parentID];
    id v11 = [(BRCPQLConnection *)db fetch:@" WITH RECURSIVE item_parents (item_id, zone_rowid, item_filename) AS(    SELECT item_parent_id, item_parent_zone_rowid, item_filename FROM client_items      WHERE item_id = %@ AND zone_rowid = %@ AND NOT item_id_is_documents(item_id)  UNION ALL     SELECT li.item_parent_id, li.item_parent_zone_rowid, li.item_filename FROM client_items AS li  INNER JOIN item_parents AS p USING (item_id, zone_rowid)      WHERE NOT item_id_is_documents(li.item_id)      LIMIT %u) SELECT item_filename FROM item_parents", v10, self->_parentZoneRowID, v6];

    if ([v11 next])
    {
      do
      {
        uint64_t v12 = [v11 stringAtIndex:0];
        [v7 insertObject:v12 atIndex:0];
      }
      while (([v11 next] & 1) != 0);
    }
    long long v13 = [(BRCLocalItem *)self st];
    uint64_t v14 = [v13 logicalName];
    [v7 addObject:v14];

    id v8 = [NSString pathWithComponents:v7];
  }
  return v8;
}

- (void)markRemovedFromFilesystemRecursively:(BOOL)a3
{
  [(BRCLocalItem *)self markDead];
  [(BRCLocalItem *)self markNeedsUploadOrSyncingUp];
  [(BRCLocalItem *)self moveAsideLocally];
}

- (id)liveStageFilename
{
  unsigned int v3 = [(BRCLocalItem *)self fileObjectID];
  double v4 = [v3 asString];

  uint64_t v5 = [(BRCLocalItem *)self st];
  uint64_t v6 = [v5 filename];
  id v7 = objc_msgSend(v6, "br_pathExtension");

  if (v7)
  {
    id v8 = [v4 stringByAppendingPathExtension:v7];
  }
  else
  {
    id v8 = v4;
  }
  uint64_t v9 = v8;

  return v9;
}

- (void)markImportedItemAsSharedWithImportBookmark:(id)a3 parent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  session = self->_session;
  uint64_t v9 = [v6 mangledID];
  self->_serverZone = (BRCServerZone *)[(BRCAccountSessionFPFS *)session serverZoneByMangledID:v9];

  uint64_t v10 = [(BRCServerZone *)self->_serverZone clientZone];
  clientZone = self->_clientZone;
  self->_clientZone = v10;

  if (!self->_clientZone)
  {
    long long v17 = brc_bread_crumbs();
    uint64_t v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem(FPFSAdditions) markImportedItemAsSharedWithImportBookmark:parent:]();
    }
  }
  uint64_t v12 = [v6 itemID];
  itemID = self->_itemID;
  self->_itemID = v12;

  uint64_t v14 = [v7 clientZone];
  int v15 = [v14 isEqualToClientZone:self->_clientZone];

  if (v15) {
    unint64_t v16 = [v7 sharingOptions] & 0xFFFFFFFFFFFFFFFBLL;
  }
  else {
    unint64_t v16 = 68;
  }
  self->_int sharingOptions = v16;
}

- (BOOL)updateFPCreationItemIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    unsigned int v3 = [(BRCLocalStatInfo *)self->_st fpCreationItemIdentifier];
    if (!v3) {
      goto LABEL_5;
    }
  }
  id v6 = [(BRCLocalStatInfo *)self->_st fpCreationItemIdentifier];
  char v7 = [v5 isEqualToString:v6];

  if (!v5)
  {

    if (v7) {
      goto LABEL_5;
    }
LABEL_7:
    [(BRCLocalStatInfo *)self->_st setFpCreationItemIdentifier:v5];
    BOOL v8 = [(BRCPQLConnection *)self->_db execute:@"UPDATE client_items SET fp_creation_item_identifier = %@ WHERE rowid = %llu", v5, self->_dbRowID];
    goto LABEL_8;
  }
  if ((v7 & 1) == 0) {
    goto LABEL_7;
  }
LABEL_5:
  BOOL v8 = 1;
LABEL_8:

  return v8;
}

- (void)_recomputeUserVisibleAndItemScope
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  unsigned int v3 = [(BRCStatInfo *)self->_st parentID];
  unsigned int v17 = [v3 isNonDesktopRoot];
  if (v17)
  {
    uint64_t v4 = [(BRCAppLibrary *)self->_appLibrary includesDataScope] ^ 1;
    if ([(BRCAppLibrary *)self->_appLibrary includesDataScope]) {
      unsigned __int8 v5 = 1;
    }
    else {
      unsigned __int8 v5 = 2;
    }
    id v6 = (__CFString *)(id)*MEMORY[0x263F324E0];
LABEL_14:
    uint64_t v7 = 0;
    goto LABEL_15;
  }
  if (![v3 isDocumentsFolder])
  {
    db = self->_db;
    uint64_t v9 = [(BRCStatInfo *)self->_st parentID];
    id v10 = [(BRCPQLConnection *)db fetch:@"SELECT item_user_visible, item_scope, item_filename FROM client_items WHERE item_id = %@ AND zone_rowid = %@", v9, self->_parentZoneRowID];

    if ([v10 next])
    {
      uint64_t v4 = [v10 BOOLAtIndex:0];
      unsigned __int8 v5 = [v10 intAtIndex:1];
      id v6 = [v10 stringAtIndex:2];
    }
    else
    {
      id v11 = brc_bread_crumbs();
      uint64_t v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        int v15 = [(BRCStatInfo *)self->_st parentID];
        parentZoneRowID = self->_parentZoneRowID;
        *(_DWORD *)buf = 138412802;
        uint64_t v19 = v15;
        __int16 v20 = 2112;
        id v21 = parentZoneRowID;
        __int16 v22 = 2112;
        uint64_t v23 = v11;
        _os_log_fault_impl(&dword_23FA42000, v12, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Can't find parent %@(%@)%@", buf, 0x20u);
      }
      unsigned __int8 v5 = 0;
      uint64_t v4 = 0;
      id v6 = @"UNKNOWN";
    }

    goto LABEL_14;
  }
  id v6 = (__CFString *)(id)*MEMORY[0x263F324D0];
  unsigned __int8 v5 = 2;
  uint64_t v7 = 1;
  uint64_t v4 = 1;
LABEL_15:
  long long v13 = [(BRCLocalStatInfo *)self->_st logicalName];
  self->_isUserVisible = +[BRCLocalItem computeUserVisibleStatusOfLiveItemWithParentVisible:v4 parentIsNonDesktopRoot:v17 parentScope:v5 itemFilename:v13 parentFilename:v6 appLibrary:self->_appLibrary];

  uint64_t v14 = [(BRCLocalStatInfo *)self->_st logicalName];
  [(BRCLocalStatInfo *)self->_st setItemScope:+[BRCLocalItem computeItemScopeFromParentIsRoot:v17 parentIsDocuments:v7 parentScope:v5 logicalName:v14]];
}

+ (unsigned)computeItemScopeFromParentIsRoot:(BOOL)a3 parentIsDocuments:(BOOL)a4 parentScope:(unsigned __int8)a5 logicalName:(id)a6
{
  int v6 = a5;
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v9 = a6;
  id v10 = v9;
  if (v6 == 1 && v8)
  {
    if ([v9 isEqualToString:*MEMORY[0x263F32510]])
    {
LABEL_4:
      LOBYTE(v6) = 2;
      goto LABEL_15;
    }
    BOOL v11 = 0;
  }
  else
  {
    BOOL v11 = v6 == 2;
    if ((v8 || v7) && v6 == 2)
    {
      if ([v9 isEqualToString:*MEMORY[0x263F32538]]) {
        LOBYTE(v6) = 3;
      }
      else {
        LOBYTE(v6) = 2;
      }
      goto LABEL_15;
    }
  }
  if (v7) {
    LOBYTE(v6) = 2;
  }
  if (!v11 && v7)
  {
    long long v13 = brc_bread_crumbs();
    uint64_t v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      +[BRCLocalItem(FPFSAdditions) computeItemScopeFromParentIsRoot:parentIsDocuments:parentScope:logicalName:]();
    }

    goto LABEL_4;
  }
LABEL_15:

  return v6;
}

- (id)jobsDescription
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"r:%lld", -[BRCLocalItem dbRowID](self, "dbRowID"));
}

- (id)matchingJobsWhereSQLClause
{
  return (id)objc_msgSend(MEMORY[0x263F8C710], "formatInjection:", @"throttle_id = %lld", -[BRCLocalItem dbRowID](self, "dbRowID"));
}

- (void)asBRAlias
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: -asBRAlias called on a non alias%@", v2, v3, v4, v5, v6);
}

- (void)asDirectory
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: -asDirectory called on a non directory%@", v2, v3, v4, v5, v6);
}

- (void)asDocument
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: -asDocument called on a non document%@", v2, v3, v4, v5, v6);
}

- (void)asShareableItem
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: -asShareableItem called on a non shareable item%@", v2, v3, v4, v5, v6);
}

- (void)asFSRoot
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: -asFSRoot called on a non root%@", v2, v3, v4, v5, v6);
}

- (void)asSymlink
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: -asSymlink called on a non symlink%@", v2, v3, v4, v5, v6);
}

- (void)asFinderBookmark
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: -asFinderBookmark called on a non symlink%@", v2, v3, v4, v5, v6);
}

- (void)asShareAcceptationFault
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: -asShareAcceptationFault called on a non fault%@", v2, v3, v4, v5, v6);
}

- (void)fileObjectID
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: unknown item type%@", v2, v3, v4, v5, v6);
}

- (void)parentFileObjectID
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: Can't find parent file objectID%@", v2, v3, v4, v5, v6);
}

- (void)asSharedToMeTopLevelItem
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: Asked to get the top-level item of a non shared top level item: %@%@");
}

- (void)inheritOSUpgradeNeededFromItem:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: !_minimumSupportedOSRowID%@", v2, v3, v4, v5, v6);
}

- (void)inheritOSUpgradeNeededFromItem:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: parentItem->_minimumSupportedOSRowID%@", v2, v3, v4, v5, v6);
}

- (void)markNeedsOSUpgradeToSyncUpWithName:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: can't add the OS NAME%@", v2, v3, v4, v5, v6);
}

- (void)initFromPQLResultSet:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: Local items must be initialized with initFromPQLResultSet:container:error:%@", v2, v3, v4, v5, v6);
}

- (void)_initFromPQLResultSet:session:db:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: Can't find app library%@", v2, v3, v4, v5, v6);
}

- (void)sideCarInfo
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: Asked for side car info on an item that doesn't have side cars%@", v2, v3, v4, v5, v6);
}

- (void)parentItemIDInZone
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: !self.itemID.isNonDesktopRoot%@", v2, v3, v4, v5, v6);
}

- (void)parentItemOnFS
{
  uint64_t v0 = [0 debugItemIDString];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_23FA42000, v1, v2, "[CRIT] UNREACHABLE: item without parentID under parent %@%@", v3, v4, v5, v6, v7);
}

- (void)_updateSyncUpSchedulerWithDiffs:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Rescheduling upload for %@%@");
}

- (void)_updateSyncUpSchedulerWithDiffs:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Detected sync up state change%@", v2, v3, v4, v5, v6);
}

- (void)_updateSyncUpSchedulerWithDiffs:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: Didn't detect the local sync up state change for %@%@");
}

- (void)_updateInDB:diffs:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _st.ckInfo.etag == nil || [_orig.st.ckInfo.etagBeforeCrossZoneMove isEqualToString:_st.ckInfo.etag] || self.isDirectory%@", v2, v3, v4, v5, v6);
}

- (void)_updateInDB:diffs:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: ![self.itemID isEqualToItemID:self.orig.itemID]%@", v2, v3, v4, v5, v6);
}

- (void)_updateInDB:diffs:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Deleting old zone sync up job for a CZM item: %@%@");
}

void __30__BRCLocalItem_setOfParentIDs__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_23FA42000, v0, (os_log_type_t)0x90u, "[ERROR] Encountered circular parenting chain%@", v1, 0xCu);
}

void __30__BRCLocalItem_setOfParentIDs__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: Circular parenting chain%@", v2, v3, v4, v5, v6);
}

- (void)_sendNotificationIfNeededWithDiffs:regather:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: Can't create a notification out of an alias item%@", v2, v3, v4, v5, v6);
}

- (void)_restorePreviousGlobalID:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Existing server item %@%@");
}

- (void)saveToDBForServerEdit:keepAliases:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Item is already force-deleted, skipping save%@", v2, v3, v4, v5, v6);
}

- (void)saveToDBForServerEdit:keepAliases:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] overwriting serverUpdate to YES because the item is moving to IDLE%@", v2, v3, v4, v5, v6);
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = [v0 lastError];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_23FA42000, v2, v3, "[CRIT] UNREACHABLE: saving items should really always work: %@%@", v4, v5, v6, v7, v8);
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 134218242;
  *(void *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  OUTLINED_FUNCTION_1(&dword_23FA42000, a2, a3, "[DEBUG] Inserting item with rowid = %llu%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] We received our first shared to me child item, schedulding side car sync%@", v2, v3, v4, v5, v6);
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] we don't have a corresponding alias item, and the diffs do not require alias creation, dropping the diffs%@", v2, v3, v4, v5, v6);
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Forcing sync up of side car zone when item changed path extension%@", v2, v3, v4, v5, v6);
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] this item changed significantly%@", v2, v3, v4, v5, v6);
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_7()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] item went out of lost state%@", v2, v3, v4, v5, v6);
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_8()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] item with a minimum supported OS just changed, checking if we need to reattempt upload%@", v2, v3, v4, v5, v6);
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_9()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Deleting tombstone because it's synced up%@", v2, v3, v4, v5, v6);
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_10()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Deleting tombstone because it's no known to server%@", v2, v3, v4, v5, v6);
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_11()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Not deleting until we send the delete to children%@", v2, v3, v4, v5, v6);
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_12()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Force deletion has been asked, comply%@", v2, v3, v4, v5, v6);
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_13(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] Inserting a tombstone for the alias of %@ if necessary%@", (void)v3, DWORD2(v3));
}

+ (void)computeUserVisibleStatusOfLiveItemWithParentVisible:parentIsNonDesktopRoot:parentScope:itemFilename:parentFilename:appLibrary:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: parentScope != BRC_ITEM_SCOPE_DATA || !parentVisible%@", v2, v3, v4, v5, v6);
}

+ (void)computeUserVisibleStatusOfLiveItemWithParentVisible:parentIsNonDesktopRoot:parentScope:itemFilename:parentFilename:appLibrary:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: !appLibrary.isCloudDocsAppLibrary%@", v2, v3, v4, v5, v6);
}

- (void)forceNeedsSyncUpWithoutDiffs
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Forcing sync up of shared item in the trash %@%@");
}

- (void)markLatestSyncRequestRejectedInZone:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: Rejected item %@ is documents folder.  Force syncing on all%@");
}

- (void)markLatestSyncRequestRejectedInZone:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Rejected item %@ has meaningful local diffs.  Forcing sync on all%@");
}

- (void)markLatestSyncRequestAcknowledgedInZone:.cold.1()
{
  OUTLINED_FUNCTION_12();
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = [v1 itemID];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_23FA42000, v0, v3, "[DEBUG] we are still syncing %@%@", v4);
}

- (void)markLatestSyncRequestAcknowledgedInZone:.cold.2()
{
  OUTLINED_FUNCTION_12();
  uint64_t v4 = *MEMORY[0x263EF8340];
  id v1 = BRCItemFieldsPrettyPrint();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_23FA42000, v0, v2, "[DEBUG] we still have diffs to send: %@%@", v3);
}

- (void)markLatestSyncRequestAcknowledgedInZone:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _syncUpState != BRC_SUS_IDLE%@", v2, v3, v4, v5, v6);
}

- (void)updateItemMetadataFromServerItem:appliedSharingPermission:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Learning parent sharing options because there is no shareID on this item%@", v2, v3, v4, v5, v6);
}

- (void)updateStructuralCKInfoFromServerItem:.cold.1()
{
  OUTLINED_FUNCTION_12();
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*v1 etag];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_23FA42000, v0, v3, "[DEBUG] Also updating side car ckinfo:%@%@", v4);
}

- (void)updateStructuralCKInfoFromServerItem:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: ckInfo%@", v2, v3, v4, v5, v6);
}

- (void)updateStructuralCKInfoFromServerItem:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: serverItem%@", v2, v3, v4, v5, v6);
}

- (void)_updateCrossZoneParent:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Skipping learning new itemID because we handled the conflict with a revival%@", v2, v3, v4, v5, v6);
}

- (void)_updateCrossZoneParent:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: parentItem%@", v2, v3, v4, v5, v6);
}

- (void)isReadAndUploaded
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: invalid sync up state%@", v2, v3, v4, v5, v6);
}

@end