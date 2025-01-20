@interface BRCServerChangesApplier
- (BOOL)_handleServerItemBRAliasIfNeeded:(id)a3 li:(id)a4 jobID:(int64_t)a5 zone:(id)a6 diffs:(unint64_t)a7;
- (BRCAccountSessionFPFS)session;
- (BRCServerChangesApplier)initWithAccountSession:(id)a3;
- (void)applyChanges:(id)a3 localItem:(id)a4 rank:(int64_t)a5 zone:(id)a6;
@end

@implementation BRCServerChangesApplier

- (BRCServerChangesApplier)initWithAccountSession:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRCServerChangesApplier;
  v6 = [(BRCServerChangesApplier *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_session, a3);
  }

  return v7;
}

- (BOOL)_handleServerItemBRAliasIfNeeded:(id)a3 li:(id)a4 jobID:(int64_t)a5 zone:(id)a6 diffs:(unint64_t)a7
{
  id v11 = a3;
  id v12 = a6;
  if (([a4 isBRAlias] & 1) != 0 || objc_msgSend(v11, "isBRAlias"))
  {
    v13 = [(BRCAccountSessionFPFS *)self->_session applyScheduler];
    v14 = [v11 aliasTargetClientZone];
    if ([v14 isSharedZone])
    {
      v15 = [v11 aliasTargetItemID];
      uint64_t v16 = [v14 serverItemByItemID:v15];
      if (v16)
      {
        v17 = (void *)v16;
        v18 = brc_bread_crumbs();
        v19 = brc_default_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          -[BRCServerChangesApplier _handleServerItemBRAliasIfNeeded:li:jobID:zone:diffs:]();
        }

        v20 = [v14 itemByItemID:v15];
        [v13 createApplyJobFromServerItem:v17 localItem:v20 state:1 kind:2];

        goto LABEL_14;
      }
    }
    if (![v11 aliasTargetIsShared])
    {
LABEL_15:
      v24 = [v12 dbRowID];
      [v13 setState:0 forRank:a5 zoneRowID:v24];

      BOOL v21 = 1;
      goto LABEL_16;
    }
    v22 = brc_bread_crumbs();
    v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      -[BRCServerChangesApplier _handleServerItemBRAliasIfNeeded:li:jobID:zone:diffs:]();
    }

    v15 = [(BRCAccountSessionFPFS *)self->_session containerScheduler];
    [v15 scheduleSyncDownForSharedDatabaseImmediately:0];
LABEL_14:

    goto LABEL_15;
  }
  BOOL v21 = 0;
LABEL_16:

  return v21;
}

- (void)applyChanges:(id)a3 localItem:(id)a4 rank:(int64_t)a5 zone:(id)a6
{
  uint64_t v112 = *MEMORY[0x263EF8340];
  int64_t v10 = (int64_t)a3;
  int64_t v11 = (int64_t)a4;
  id v12 = a6;
  v13 = [v12 clientZone];
  v93 = [(BRCAccountSessionFPFS *)self->_session applyScheduler];
  uint64_t v99 = [(id)v11 diffAgainstServerItem:v10];
  memset(v98, 0, sizeof(v98));
  __brc_create_section(0, (uint64_t)"-[BRCServerChangesApplier applyChanges:localItem:rank:zone:]", 106, v98);
  v14 = brc_bread_crumbs();
  v15 = brc_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v32 = v98[0];
    uint64_t v33 = BRCItemFieldsPrettyPrint();
    v34 = (void *)v33;
    v35 = "existing";
    *(_DWORD *)buf = 134219266;
    v101 = (BRCServerChangesApplier *)v32;
    __int16 v102 = 2048;
    if (!v11) {
      v35 = "new";
    }
    int64_t v103 = a5;
    __int16 v104 = 2080;
    v105 = v35;
    __int16 v106 = 2112;
    int64_t v107 = v10;
    __int16 v108 = 2112;
    uint64_t v109 = v33;
    __int16 v110 = 2112;
    v111 = v14;
    _os_log_debug_impl(&dword_23FA42000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Apply Changes[%lld]: %s item: %@\n diffs: %@%@", buf, 0x3Eu);
  }
  if (!(v10 | v11))
  {
    v84 = brc_bread_crumbs();
    v85 = brc_default_log();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_FAULT)) {
      -[BRCServerChangesApplier applyChanges:localItem:rank:zone:].cold.5((uint64_t)v84, v85);
    }
  }
  if (!v13)
  {
    brc_bread_crumbs();
    uint64_t v16 = (char *)objc_claimAutoreleasedReturnValue();
    v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      v101 = (BRCServerChangesApplier *)v10;
      __int16 v102 = 2112;
      int64_t v103 = v11;
      __int16 v104 = 2112;
      v105 = v16;
      _os_log_fault_impl(&dword_23FA42000, v17, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: no client zone when applying %@ and %@%@", buf, 0x20u);
    }
  }
  BOOL v18 = +[BRCServerChangesApplyUtil deletingShareRoot:v10 localItem:v11];
  BOOL v19 = [(BRCServerChangesApplier *)self _handleServerItemBRAliasIfNeeded:v10 li:v11 jobID:a5 zone:v12 diffs:v99];
  LOBYTE(v86) = v18;
  if (+[BRCServerChangesApplyUtil checkEarlyExitsPriorToApplying:v11 si:v10 rank:a5 scheduler:v93 zone:v12 session:self->_session isDeleteOfShareRoot:v86 diffs:v99 clientZone:v13]|| v19)
  {
    goto LABEL_80;
  }
  if (![(id)v10 isLive])
  {
    if (!+[BRCServerChangesApplyUtil handleApplyChangesForUnliveServerItem:v11 isDeleteOfShareRoot:v18 rank:a5 scheduler:v93 zone:v12 session:self->_session])
    {
      [(id)v11 markDead];
      [(id)v11 saveToDBForServerEdit:1 keepAliases:0];
      v31 = [(id)v11 clientZone];
      objc_msgSend(v31, "didApplyTombstoneForRank:", objc_msgSend((id)v10, "rank"));

      v92 = (void *)v11;
      goto LABEL_79;
    }
    goto LABEL_80;
  }
  char v97 = 0;
  if ([(id)v11 isShareAcceptationFault])
  {
    v20 = [(id)v11 asShareAcceptationFault];
    [v20 markNeedsTransformIntoNormalFault];

    char v97 = 1;
  }
  if ([(id)v10 isDirectoryFault])
  {
    BOOL v21 = [(id)v10 itemID];
    if ([v21 isDocumentsFolder])
    {
      v22 = [(id)v11 appLibrary];
      BOOL v23 = ([v22 state] & 0x4000000) == 0;

      if (v23) {
        goto LABEL_18;
      }
      v24 = [(id)v11 appLibrary];
      [v24 clearStateBits:0x4000000];

      BOOL v21 = brc_bread_crumbs();
      v25 = brc_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        -[BRCServerChangesApplier applyChanges:localItem:rank:zone:].cold.4((uint64_t)v21, v25);
      }
    }
  }
LABEL_18:
  v26 = [(BRCAccountSessionFPFS *)self->_session bouncingAnalyzer];
  [v26 analyzeServerBouncingOfItem:v11 withServerItem:v10];

  if ([(id)v11 logicalNameNeedsRename])
  {
    v27 = [(id)v11 st];
    [v27 clearBouncedName];
  }
  if (!+[BRCServerChangesApplyUtil handleEtagsChangesOnly:v11 si:v10 rank:a5 scheduler:v93 zone:v12 diffs:&v99 needsSave:&v97])
  {
    if (v11 && ![(id)v11 isDead])
    {
      if ([(id)v11 isIdleOrRejected])
      {
        v37 = brc_bread_crumbs();
        v38 = brc_default_log();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
          -[BRCServerChangesApplier applyChanges:localItem:rank:zone:]();
        }

        [(id)v11 updateFromServerItem:v10];
        char v97 = 1;
      }
      v92 = (void *)v11;
      goto LABEL_63;
    }
    v28 = [(id)v10 parentZoneOnFS];
    v90 = [v28 clientZone];

    if (v90) {
      BOOL v29 = v11 != 0;
    }
    else {
      BOOL v29 = 1;
    }
    if (v29)
    {
      int v30 = 0;
LABEL_51:
      v92 = objc_msgSend((id)v10, "newLocalItemWithServerZone:dbRowID:", v12, objc_msgSend((id)v11, "dbRowID"));

      char v97 = 1;
      if (v30) {
        [v92 markBouncedToNextAvailableBounceNumber:500];
      }
      if ([v92 isSharedToMeTopLevelItem])
      {
        v47 = [(id)v10 asSharedItem];
        v88 = [v47 fallbackParentAppLibraryOnFS];

        v48 = [v88 defaultClientZone];
        v49 = [v92 asShareableItem];
        v87 = [v49 unsaltedBookmarkData];

        v50 = [v48 serverAliasByUnsaltedBookmarkData:v87];
        LODWORD(v49) = v50 == 0;

        if (v49)
        {
          brc_bread_crumbs();
          v51 = (BRCServerChangesApplier *)objc_claimAutoreleasedReturnValue();
          v52 = brc_default_log();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v101 = v51;
            _os_log_impl(&dword_23FA42000, v52, OS_LOG_TYPE_DEFAULT, "[WARNING] No alias pointing to new item shared container, forcing sync down on private container%@", buf, 0xCu);
          }

          v53 = [v48 serverZone];
          char v54 = [v53 state];

          if ((v54 & 4) != 0)
          {
            [v48 scheduleSyncDown];
          }
          else
          {
            v55 = [(id)v10 itemGlobalID];
            v56 = [v48 serverZone];
            v57 = +[BRCItemID shareAliasRecordIDFromTargetItemID:v55 zone:v56 hasDerivedShareAlias:0];

            v58 = [v48 locateRecordIfNecessaryForRecordID:v57 isUserWaiting:0];
            v94[0] = MEMORY[0x263EF8330];
            v94[1] = 3221225472;
            v94[2] = __60__BRCServerChangesApplier_applyChanges_localItem_rank_zone___block_invoke;
            v94[3] = &unk_2650819D0;
            id v59 = v57;
            id v95 = v59;
            [v58 addLocateRecordCompletionBlock:v94];
          }
        }
      }
      brc_bread_crumbs();
      v60 = (char *)objc_claimAutoreleasedReturnValue();
      v61 = brc_default_log();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
      {
        v83 = @"new";
        *(_DWORD *)buf = 138412802;
        if (v11) {
          v83 = @"revived";
        }
        v101 = (BRCServerChangesApplier *)v83;
        __int16 v102 = 2112;
        int64_t v103 = (int64_t)v92;
        __int16 v104 = 2112;
        v105 = v60;
        _os_log_debug_impl(&dword_23FA42000, v61, OS_LOG_TYPE_DEBUG, "[DEBUG] Created reservation for %@ item: %@%@", buf, 0x20u);
      }

LABEL_63:
      if ((v99 & 0x60) != 0)
      {
        v62 = [v92 parentClientZone];
        v63 = [v92 st];
        v64 = [v63 parentID];
        v65 = [v92 st];
        v66 = [v65 logicalName];
        v91 = [v62 itemByParentID:v64 andLogicalName:v66];

        if (v91)
        {
          v67 = brc_bread_crumbs();
          v68 = brc_default_log();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG)) {
            -[BRCServerChangesApplier applyChanges:localItem:rank:zone:]();
          }

          [v91 markBouncedToNextAvailableBounceNumber:502];
          [v91 saveToDB];
          v89 = [v91 st];
          v69 = [v89 logicalNameWithoutLocalBounce];
          v70 = [v92 orig];
          v71 = [v70 st];
          v72 = [v71 logicalName];
          int v73 = [v69 isEqualToString:v72];

          if (v73)
          {
            v74 = brc_bread_crumbs();
            v75 = brc_default_log();
            if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG)) {
              -[BRCServerChangesApplier applyChanges:localItem:rank:zone:]((uint64_t)v74, v75);
            }

            v76 = [v91 clientZone];
            v77 = [v91 itemID];
            v78 = [v76 serverItemByItemID:v77];

            v79 = [(BRCAccountSessionFPFS *)self->_session applyScheduler];
            [v79 createApplyJobFromServerItem:v78 localItem:v91 state:1 kind:2];
          }
        }
      }
      if ([(id)v10 isLive] && objc_msgSend(v92, "isRejected"))
      {
        v80 = brc_bread_crumbs();
        v81 = brc_default_log();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v101 = self;
          __int16 v102 = 2112;
          int64_t v103 = (int64_t)v80;
          _os_log_impl(&dword_23FA42000, v81, OS_LOG_TYPE_DEFAULT, "[WARNING] Rejected item was revived.  Marking sync as idle to apply server version for %@%@", buf, 0x16u);
        }

        [v92 markRejectedItemRemotelyRevived];
        char v97 = 1;
        goto LABEL_78;
      }
      if (v97) {
LABEL_78:
      }
        [v92 saveToDBForServerEdit:1 keepAliases:0];
LABEL_79:
      v82 = [v12 dbRowID];
      [v93 setState:0 forRank:a5 zoneRowID:v82];

      int64_t v11 = (int64_t)v92;
      goto LABEL_80;
    }
    v36 = [(id)v10 parentItemIDOnFS];
    char v96 = 0;
    if (+[BRCServerChangesApplyUtil handleNonRevivedItemIfNecessary:0 si:v10 rank:a5 scheduler:v93 zone:v12 hasInitialScanItemTypeMismatch:&v96])
    {

      goto LABEL_80;
    }
    if (v96)
    {
      v39 = [(BRCAccountSessionFPFS *)self->_session bouncingAnalyzer];
      [v39 reportInitialScanItemTypeMismatch:v10];
    }
    v40 = [(id)v10 st];
    v41 = [v40 logicalName];
    v42 = [v90 itemByParentID:v36 andLogicalName:v41];

    if (v42)
    {
      brc_bread_crumbs();
      v43 = (char *)objc_claimAutoreleasedReturnValue();
      v44 = brc_default_log();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v101 = v42;
        __int16 v102 = 2112;
        int64_t v103 = v10;
        __int16 v104 = 2112;
        v105 = v43;
        _os_log_debug_impl(&dword_23FA42000, v44, OS_LOG_TYPE_DEBUG, "[DEBUG] Found item %@ that collides with %@%@", buf, 0x20u);
      }

      if (([(BRCServerChangesApplier *)v42 isDead] & 1) == 0
        && ([(id)v10 isSharedToMeTopLevelItem] & 1) != 0)
      {
        int v30 = 1;
LABEL_50:

        goto LABEL_51;
      }
      v45 = [(BRCAccountSessionFPFS *)self->_session bouncingAnalyzer];
      uint64_t v46 = [v45 analyzeBouncingOfItem:v42 withServerItem:v10 bounceReason:501];

      [(BRCServerChangesApplier *)v42 markBouncedToNextAvailableBounceNumber:v46];
      [(BRCServerChangesApplier *)v42 saveToDB];
    }
    int v30 = 0;
    goto LABEL_50;
  }
LABEL_80:
  __brc_leave_section(v98);
}

void __60__BRCServerChangesApplier_applyChanges_localItem_rank_zone___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = brc_bread_crumbs();
  v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = @"fail";
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138413058;
    if (a2) {
      v8 = @"success";
    }
    uint64_t v11 = v9;
    __int16 v12 = 2112;
    v13 = v8;
    __int16 v14 = 2112;
    id v15 = v5;
    __int16 v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_23FA42000, v7, OS_LOG_TYPE_INFO, "[INFO] Fetch share alias for share alias record ID [%@]: %@ with error %@%@", (uint8_t *)&v10, 0x2Au);
  }
}

- (BRCAccountSessionFPFS)session
{
  return self->_session;
}

- (void).cxx_destruct
{
}

- (void)_handleServerItemBRAliasIfNeeded:li:jobID:zone:diffs:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Encountered a share alias, syncing down shared database to detect %@%@");
}

- (void)_handleServerItemBRAliasIfNeeded:li:jobID:zone:diffs:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Forwarding server alias rank bump to target item %@%@");
}

- (void)applyChanges:(uint64_t)a1 localItem:(NSObject *)a2 rank:zone:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_23FA42000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] We are vacating where the bypath item want's to be. Scheduling apply%@", (uint8_t *)&v2, 0xCu);
}

- (void)applyChanges:localItem:rank:zone:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Bouncing by path item %@%@");
}

- (void)applyChanges:localItem:rank:zone:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Updating item %@ from server item%@");
}

- (void)applyChanges:(uint64_t)a1 localItem:(NSObject *)a2 rank:zone:.cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_23FA42000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Clearing the listed docs bit on the documents folder because the documents folder is a dir-fault%@", (uint8_t *)&v2, 0xCu);
}

- (void)applyChanges:(uint64_t)a1 localItem:(NSObject *)a2 rank:zone:.cold.5(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_23FA42000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: li || si%@", (uint8_t *)&v2, 0xCu);
}

@end