@interface BRCServerChangesApplyUtil_Private
+ (BOOL)_handleApplyingDeletedUnlistedDirectoryIfNecessary:(id)a3 localItem:(id)a4 parent:(id)a5;
+ (BOOL)appLibraryUndergoingCZM:(id)a3 zone:(id)a4 rank:(int64_t)a5 parentID:(id)a6 scheduler:(id)a7 session:(id)a8;
+ (BOOL)itemUndergoingCZMToAnotherZone:(id)a3 si:(id)a4 clientZone:(id)a5 rank:(int64_t)a6 scheduler:(id)a7 zone:(id)a8;
+ (BOOL)localItemHasUnsyncedChanges:(id)a3 si:(id)a4 rank:(int64_t)a5 scheduler:(id)a6 clientZone:(id)a7 zone:(id)a8 isDeleteOfShareRoot:(BOOL)a9 session:(id)a10;
+ (BOOL)serverItemDeadWithNoLiveLocalItem:(id)a3 si:(id)a4 rank:(int64_t)a5 scheduler:(id)a6 clientZone:(id)a7 zone:(id)a8;
+ (BOOL)serverItemWouldBeParentedToDeadFolder:(id)a3 si:(id)a4 rank:(int64_t)a5 scheduler:(id)a6 zone:(id)a7 diffs:(unint64_t)a8;
@end

@implementation BRCServerChangesApplyUtil_Private

+ (BOOL)itemUndergoingCZMToAnotherZone:(id)a3 si:(id)a4 clientZone:(id)a5 rank:(int64_t)a6 scheduler:(id)a7 zone:(id)a8
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = a8;
  int v17 = [v13 isDocument];
  BOOL v18 = 0;
  if (!a3 && v17)
  {
    int64_t v29 = a6;
    v19 = [v14 db];
    v20 = [v13 itemID];
    v21 = [v13 clientZone];
    v22 = [v21 dbRowID];
    v23 = (void *)[v19 numberWithSQL:@"SELECT 1 FROM client_items WHERE version_old_zone_item_id = %@ AND version_old_zone_rowid = %@", v20, v22];
    int v24 = [v23 BOOLValue];

    if (v24)
    {
      v25 = brc_bread_crumbs();
      v26 = brc_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        +[BRCServerChangesApplyUtil_Private itemUndergoingCZMToAnotherZone:si:clientZone:rank:scheduler:zone:]();
      }

      v27 = [v16 dbRowID];
      [v15 setState:17 forRank:v29 zoneRowID:v27];

      BOOL v18 = 1;
    }
    else
    {
      BOOL v18 = 0;
    }
  }

  return v18;
}

+ (BOOL)appLibraryUndergoingCZM:(id)a3 zone:(id)a4 rank:(int64_t)a5 parentID:(id)a6 scheduler:(id)a7 session:(id)a8
{
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  if (a3) {
    goto LABEL_10;
  }
  if (![v14 isNonDesktopRoot]) {
    goto LABEL_10;
  }
  if (![v13 isCloudDocsZone]) {
    goto LABEL_10;
  }
  int64_t v29 = [v14 appLibraryRowID];
  int v17 = [v13 clientZone];
  BOOL v18 = [v17 asPrivateClientZone];
  v19 = [v18 defaultAppLibrary];
  v20 = [v19 dbRowID];
  char v21 = [v29 isEqual:v20];

  if (v21) {
    goto LABEL_10;
  }
  v22 = [v14 appLibraryRowID];
  v23 = [v16 appLibraryByRowID:v22];

  if (([v23 state] & 0x200000) != 0)
  {

LABEL_10:
    BOOL v27 = 0;
    goto LABEL_11;
  }
  int v24 = brc_bread_crumbs();
  v25 = brc_default_log();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    +[BRCServerChangesApplyUtil_Private appLibraryUndergoingCZM:zone:rank:parentID:scheduler:session:]();
  }

  v26 = [v13 dbRowID];
  [v15 setState:27 forRank:a5 zoneRowID:v26];

  BOOL v27 = 1;
LABEL_11:

  return v27;
}

+ (BOOL)_handleApplyingDeletedUnlistedDirectoryIfNecessary:(id)a3 localItem:(id)a4 parent:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = [v9 isDead];
  BOOL v11 = 0;
  if (v8 || !v10) {
    goto LABEL_12;
  }
  v12 = [v9 st];
  id v13 = [v12 ckInfo];
  if (([v13 hasDeletionChangeToken] & 1) == 0)
  {

    goto LABEL_11;
  }
  id v14 = [v7 clientZone];
  id v15 = [v9 clientZone];
  int v16 = [v14 isEqualToClientZone:v15];

  if (!v16)
  {
LABEL_11:
    BOOL v11 = 0;
    id v8 = 0;
    goto LABEL_12;
  }
  int v17 = brc_bread_crumbs();
  BOOL v18 = brc_default_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    int v29 = 138412802;
    id v30 = v7;
    __int16 v31 = 2112;
    id v32 = v9;
    __int16 v33 = 2112;
    v34 = v17;
    _os_log_debug_impl(&dword_23FA42000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] New item %@ older than a deleted directory %@ so marking dead%@", (uint8_t *)&v29, 0x20u);
  }

  v19 = [v7 serverZone];
  id v8 = (id)objc_msgSend(v7, "newLocalItemWithServerZone:dbRowID:", v19, objc_msgSend(0, "dbRowID"));

  [v8 markDead];
  v20 = [v9 st];
  char v21 = [v20 ckInfo];
  v22 = [v21 deletionChangeToken];

  if ([v8 isDocument])
  {
    v23 = [v8 asDocument];
    int v24 = [v23 currentVersion];
    v25 = [v24 ckInfo];
    [v25 setDeletionChangeToken:v22];
  }
  v26 = [v8 st];
  BOOL v27 = [v26 ckInfo];
  [v27 setDeletionChangeToken:v22];

  [v8 markNeedsUploadOrSyncingUp];
  [v8 saveToDB];

  BOOL v11 = 1;
LABEL_12:

  return v11;
}

+ (BOOL)serverItemWouldBeParentedToDeadFolder:(id)a3 si:(id)a4 rank:(int64_t)a5 scheduler:(id)a6 zone:(id)a7 diffs:(unint64_t)a8
{
  char v8 = a8;
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  if (v14 && (v8 & 0x20) == 0 || ![v15 isLive]) {
    goto LABEL_8;
  }
  BOOL v18 = [v15 parentLocalItemOnFS];
  v19 = v18;
  if (!v18)
  {
    if (([a1 _handleApplyingDeletedUnlistedDirectoryIfNecessary:v15 localItem:v14 parent:0] & 1) == 0)
    {
      if ([v15 shouldBeGreedyForApply])
      {
        v22 = [v15 clientZone];
        v23 = [v15 parentItemIDOnFS];
        int v24 = [v22 serverItemByItemID:v23];

        if (!v24)
        {
          int v29 = brc_bread_crumbs();
          id v30 = brc_default_log();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
            +[BRCServerChangesApplyUtil_Private serverItemWouldBeParentedToDeadFolder:si:rank:scheduler:zone:diffs:]();
          }

          __int16 v31 = [v17 dbRowID];
          [v16 setState:16 forRank:a5 zoneRowID:v31];

          BOOL v27 = [v15 parentZoneOnFS];
          id v32 = [v27 clientZone];
          __int16 v33 = [v15 parentItemIDOnFS];
          id v34 = (id)[v32 fetchParentChainIfNecessaryWithParentItemID:v33 isUserWaiting:0];

          goto LABEL_14;
        }
      }
LABEL_12:
      v25 = brc_bread_crumbs();
      v26 = brc_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        if (v19)
        {
          [NSString stringWithFormat:@" parent = %@", v19];
          uint64_t v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v35 = &stru_26F3822F0;
        }
        *(_DWORD *)buf = 134218498;
        int64_t v37 = a5;
        __int16 v38 = 2112;
        v39 = v35;
        __int16 v40 = 2112;
        v41 = v25;
        _os_log_debug_impl(&dword_23FA42000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] Apply Changes[%lld]: postponing rank (missing parent)%@%@", buf, 0x20u);
        if (v19) {
      }
        }
      BOOL v27 = [v17 dbRowID];
      [v16 setState:21 forRank:a5 zoneRowID:v27];
LABEL_14:
    }
LABEL_15:

    BOOL v21 = 1;
    goto LABEL_16;
  }
  char v20 = [v18 isDead];
  if ([a1 _handleApplyingDeletedUnlistedDirectoryIfNecessary:v15 localItem:v14 parent:v19]) {
    goto LABEL_15;
  }
  if (v20) {
    goto LABEL_12;
  }

LABEL_8:
  BOOL v21 = 0;
LABEL_16:

  return v21;
}

+ (BOOL)serverItemDeadWithNoLiveLocalItem:(id)a3 si:(id)a4 rank:(int64_t)a5 scheduler:(id)a6 clientZone:(id)a7 zone:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  if (v14 && ![v14 isDead] || v13 && !objc_msgSend(v13, "isDead"))
  {
    BOOL v22 = 0;
  }
  else
  {
    [v13 markNeedsDeleteForRescheduleOfItem:0];
    if ([v13 isSharedToMeTopLevelItem])
    {
      BOOL v18 = [v13 asSharedToMeTopLevelItem];
      [v18 insertTombstoneAliasRecordInZone:0];
    }
    [v13 saveToDBForServerEdit:1 keepAliases:0];
    v19 = brc_bread_crumbs();
    char v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      +[BRCServerChangesApplyUtil_Private serverItemDeadWithNoLiveLocalItem:si:rank:scheduler:clientZone:zone:]();
    }

    BOOL v21 = [v17 dbRowID];
    [v15 setState:0 forRank:a5 zoneRowID:v21];

    [v16 didApplyTombstoneForRank:a5];
    BOOL v22 = 1;
  }

  return v22;
}

+ (BOOL)localItemHasUnsyncedChanges:(id)a3 si:(id)a4 rank:(int64_t)a5 scheduler:(id)a6 clientZone:(id)a7 zone:(id)a8 isDeleteOfShareRoot:(BOOL)a9 session:(id)a10
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a10;
  if (!a9)
  {
    if (([v15 localDiffs] & 0x1000000000000000) != 0)
    {
      int v24 = brc_bread_crumbs();
      v25 = brc_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        +[BRCServerChangesApplyUtil_Private localItemHasUnsyncedChanges:si:rank:scheduler:clientZone:zone:isDeleteOfShareRoot:session:].cold.6();
      }

      BOOL v21 = [v19 dbRowID];
      v26 = v17;
      uint64_t v27 = 22;
      goto LABEL_12;
    }
    if (+[BRCServerChangesApplyUtil shouldForceApplyContentForItem:v15])
    {
      BOOL v21 = brc_bread_crumbs();
      BOOL v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        +[BRCServerChangesApplyUtil_Private localItemHasUnsyncedChanges:si:rank:scheduler:clientZone:zone:isDeleteOfShareRoot:session:]();
      }
      goto LABEL_4;
    }
    if (!v15 || ([v15 isIdleOrRejected] & 1) != 0)
    {
      BOOL v23 = 0;
      goto LABEL_15;
    }
    if ([v16 isDead])
    {
      int v29 = [v15 isDead];
      if (([v15 isDirectory] & 1) == 0 && v29)
      {
        id v30 = brc_bread_crumbs();
        __int16 v31 = brc_default_log();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
          +[BRCServerChangesApplyUtil_Private localItemHasUnsyncedChanges:si:rank:scheduler:clientZone:zone:isDeleteOfShareRoot:session:].cold.5();
        }

        [v15 markNeedsDeleteForRescheduleOfItem:0];
        [v15 saveToDB];
LABEL_42:
        [v18 didApplyTombstoneForRank:a5];
        BOOL v21 = [v19 dbRowID];
        v26 = v17;
        uint64_t v27 = 0;
LABEL_12:
        [v26 setState:v27 forRank:a5 zoneRowID:v21];
LABEL_13:
        BOOL v23 = 1;
        goto LABEL_14;
      }
      if (([v16 isBRAlias] & v29) == 1)
      {
        uint64_t v42 = brc_bread_crumbs();
        v43 = brc_default_log();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
          +[BRCServerChangesApplyUtil_Private localItemHasUnsyncedChanges:si:rank:scheduler:clientZone:zone:isDeleteOfShareRoot:session:]();
        }

        goto LABEL_42;
      }
    }
    else
    {
      [v15 isDirectory];
      [v16 isBRAlias];
    }
    id v32 = brc_bread_crumbs();
    __int16 v33 = brc_default_log();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      int v62 = [v16 isDead];
      v63 = "";
      *(_DWORD *)buf = 138412802;
      id v73 = v15;
      if (v62) {
        v63 = "\n(dead in server truth)";
      }
      __int16 v74 = 2080;
      v75 = v63;
      __int16 v76 = 2112;
      v77 = v32;
      _os_log_debug_impl(&dword_23FA42000, v33, OS_LOG_TYPE_DEBUG, "[DEBUG] Suspending rank for item with conflicts: %@%s%@", buf, 0x20u);
    }

    if ([v15 isMigratingToFPFS]) {
      uint64_t v34 = 15;
    }
    else {
      uint64_t v34 = 22;
    }
    uint64_t v35 = [v19 dbRowID];
    [v17 setState:v34 forRank:a5 zoneRowID:v35];

    if (!v16)
    {
LABEL_53:
      if (objc_msgSend(v15, "isSharedToMeChildItem", v69))
      {
        v47 = [v15 st];
        v48 = [v47 ckInfo];

        if (!v48)
        {
          uint64_t v49 = [v15 localDiffs];
          v50 = [v20 syncUpScheduler];
          v51 = [v15 clientZone];
          v52 = [v51 dbRowID];
          uint64_t v53 = [v50 inFlightDiffsForItem:v15 zoneRowID:v52] | v49;

          if (v53)
          {
            if ((v53 & 0xFEFFFFFFFFFFE5FFLL) == 0)
            {
              v54 = brc_bread_crumbs();
              v55 = brc_default_log();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG)) {
                +[BRCServerChangesApplyUtil_Private localItemHasUnsyncedChanges:si:rank:scheduler:clientZone:zone:isDeleteOfShareRoot:session:].cold.4();
              }

              v56 = [v16 st];
              v57 = [v56 ckInfo];
              v58 = [v15 st];
              [v58 setCkInfo:v57];

              [v15 saveToDBForServerEdit:1 keepAliases:1];
              v59 = [v20 containerScheduler];
              [v59 scheduleSyncUpForSideCar];
            }
          }
        }
      }
      BOOL v21 = [v15 appLibrary];
      if (([v21 state] & 4) != 0 || !objc_msgSend(v15, "needsSyncUp")) {
        goto LABEL_13;
      }
      v60 = [v15 clientZone];
      if ([v60 isSyncBlocked]) {
        goto LABEL_65;
      }
      v61 = [v15 clientZone];
      if (([v61 syncState] & 5) != 0)
      {

LABEL_65:
        goto LABEL_13;
      }
      v64 = [v20 syncUpScheduler];
      int v71 = [v64 jobStateFor:v15];

      if (v71 != 50)
      {
        BOOL v23 = 1;
        goto LABEL_15;
      }
      v65 = [v15 itemID];
      if (([v65 isDocumentsFolder] & 1) == 0)
      {
        char v66 = [v15 isSharedToMe];

        if (v66)
        {
LABEL_76:
          BOOL v21 = [v15 clientZone];
          [v21 scheduleSyncUp];
          goto LABEL_13;
        }
        v65 = brc_bread_crumbs();
        v67 = brc_default_log();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          v68 = [v15 clientZone];
          *(_DWORD *)buf = 138412546;
          id v73 = v68;
          __int16 v74 = 2112;
          v75 = (const char *)v65;
          _os_log_impl(&dword_23FA42000, v67, OS_LOG_TYPE_DEFAULT, "[WARNING] client zone %@ forgot to sync up!%@", buf, 0x16u);
        }
      }

      goto LABEL_76;
    }
    v36 = [v15 st];
    int64_t v37 = [v36 ckInfo];
    if (v37 || ([v19 isPrivateZone] & 1) == 0)
    {
      if (![v15 isDocument])
      {
        if (([v15 sharingOptions] & 0x7C) != 4)
        {

          goto LABEL_53;
        }
        uint64_t v44 = [v15 localDiffs];

        if ((v44 & 0x1000000000000000) != 0) {
          goto LABEL_53;
        }
        goto LABEL_49;
      }
      v70 = v36;
      __int16 v38 = [v15 asDocument];
      v39 = [v38 currentVersion];
      uint64_t v40 = [v39 ckInfo];
      if (v40)
      {
        v41 = (void *)v40;
        if (([v15 sharingOptions] & 0x7C) != 4)
        {

          goto LABEL_53;
        }
        uint64_t v69 = [v15 localDiffs];

        if ((v69 & 0x1000000000000000) != 0) {
          goto LABEL_53;
        }
        goto LABEL_49;
      }

      v36 = v70;
    }

LABEL_49:
    v45 = brc_bread_crumbs();
    v46 = brc_default_log();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v73 = v15;
      __int16 v74 = 2112;
      v75 = (const char *)v16;
      __int16 v76 = 2112;
      v77 = v45;
      _os_log_debug_impl(&dword_23FA42000, v46, OS_LOG_TYPE_DEBUG, "[DEBUG] Learning sharing options on local item %@ from %@%@", buf, 0x20u);
    }

    objc_msgSend(v15, "setSharingOptions:", objc_msgSend(v16, "sharingOptions"));
    [v15 saveToDBForServerEdit:1 keepAliases:1];
    goto LABEL_53;
  }
  BOOL v21 = brc_bread_crumbs();
  BOOL v22 = brc_default_log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    +[BRCServerChangesApplyUtil_Private localItemHasUnsyncedChanges:si:rank:scheduler:clientZone:zone:isDeleteOfShareRoot:session:]();
  }
LABEL_4:

  BOOL v23 = 0;
LABEL_14:

LABEL_15:
  return v23;
}

+ (void)itemUndergoingCZMToAnotherZone:si:clientZone:rank:scheduler:zone:.cold.1()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Apply Changes[%lld]: postponing rank (item CZM processing)%@");
}

+ (void)appLibraryUndergoingCZM:zone:rank:parentID:scheduler:session:.cold.1()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Apply Changes[%lld]: postponing rank (ongoing cross-zone migration)%@");
}

+ (void)serverItemWouldBeParentedToDeadFolder:si:rank:scheduler:zone:diffs:.cold.1()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Apply Changes[%lld]: postponing rank (missing parent while greedy)%@");
}

+ (void)serverItemDeadWithNoLiveLocalItem:si:rank:scheduler:clientZone:zone:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Dead item doesn't need any action%@", v2, v3, v4, v5, v6);
}

+ (void)localItemHasUnsyncedChanges:si:rank:scheduler:clientZone:zone:isDeleteOfShareRoot:session:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Don't suspend delete of shared to me item %@%@");
}

+ (void)localItemHasUnsyncedChanges:si:rank:scheduler:clientZone:zone:isDeleteOfShareRoot:session:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Not suspending download of an item that needs CZM processing %@%@");
}

+ (void)localItemHasUnsyncedChanges:si:rank:scheduler:clientZone:zone:isDeleteOfShareRoot:session:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Ignoring deletion of share alias with a locally dead item%@", v2, v3, v4, v5, v6);
}

+ (void)localItemHasUnsyncedChanges:si:rank:scheduler:clientZone:zone:isDeleteOfShareRoot:session:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Learning structure etag on item with only side car diffs %@%@");
}

+ (void)localItemHasUnsyncedChanges:si:rank:scheduler:clientZone:zone:isDeleteOfShareRoot:session:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Forcing deletion of item dead in both client and server truth %@%@");
}

+ (void)localItemHasUnsyncedChanges:si:rank:scheduler:clientZone:zone:isDeleteOfShareRoot:session:.cold.6()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Suspending rank for item which needs an OOB sync ack %@%@");
}

@end