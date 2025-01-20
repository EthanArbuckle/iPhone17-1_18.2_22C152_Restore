@interface BRCServerChangesApplyUtil
+ (BOOL)checkEarlyExitsPriorToApplying:(id)a3 si:(id)a4 rank:(int64_t)a5 scheduler:(id)a6 zone:(id)a7 session:(id)a8 isDeleteOfShareRoot:(BOOL)a9 diffs:(unint64_t)a10 clientZone:(id)a11;
+ (BOOL)deletingShareRoot:(id)a3 localItem:(id)a4;
+ (BOOL)handleApplyChangesForUnliveServerItem:(id)a3 isDeleteOfShareRoot:(BOOL)a4 rank:(int64_t)a5 scheduler:(id)a6 zone:(id)a7 session:(id)a8;
+ (BOOL)handleEtagsChangesOnly:(id)a3 si:(id)a4 rank:(int64_t)a5 scheduler:(id)a6 zone:(id)a7 diffs:(unint64_t *)a8 needsSave:(BOOL *)a9;
+ (BOOL)handleNonRevivedItemIfNecessary:(id)a3 si:(id)a4 rank:(int64_t)a5 scheduler:(id)a6 zone:(id)a7 hasInitialScanItemTypeMismatch:(BOOL *)a8;
+ (BOOL)shouldForceApplyContentForItem:(id)a3;
@end

@implementation BRCServerChangesApplyUtil

+ (BOOL)shouldForceApplyContentForItem:(id)a3
{
  return 0;
}

+ (BOOL)checkEarlyExitsPriorToApplying:(id)a3 si:(id)a4 rank:(int64_t)a5 scheduler:(id)a6 zone:(id)a7 session:(id)a8 isDeleteOfShareRoot:(BOOL)a9 diffs:(unint64_t)a10 clientZone:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a11;
  LOBYTE(v25) = a9;
  if (+[BRCServerChangesApplyUtil_Private localItemHasUnsyncedChanges:si:rank:scheduler:clientZone:zone:isDeleteOfShareRoot:session:](BRCServerChangesApplyUtil_Private, "localItemHasUnsyncedChanges:si:rank:scheduler:clientZone:zone:isDeleteOfShareRoot:session:", v16, v17, a5, v18, v21, v19, v25, v20)|| +[BRCServerChangesApplyUtil_Private serverItemDeadWithNoLiveLocalItem:v16 si:v17 rank:a5 scheduler:v18 clientZone:v21 zone:v19]
    || +[BRCServerChangesApplyUtil_Private serverItemWouldBeParentedToDeadFolder:v16 si:v17 rank:a5 scheduler:v18 zone:v19 diffs:a10])
  {
    BOOL v22 = 1;
  }
  else
  {
    v24 = [v17 parentItemIDOnFS];
    BOOL v22 = +[BRCServerChangesApplyUtil_Private appLibraryUndergoingCZM:zone:rank:parentID:scheduler:session:](BRCServerChangesApplyUtil_Private, "appLibraryUndergoingCZM:zone:rank:parentID:scheduler:session:", v16, v19, a5, v24, v18, v20)|| +[BRCServerChangesApplyUtil_Private itemUndergoingCZMToAnotherZone:v16 si:v17 clientZone:v21 rank:a5 scheduler:v18 zone:v19];
  }
  return v22;
}

+ (BOOL)handleApplyChangesForUnliveServerItem:(id)a3 isDeleteOfShareRoot:(BOOL)a4 rank:(int64_t)a5 scheduler:(id)a6 zone:(id)a7 session:(id)a8
{
  BOOL v12 = a4;
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  id v17 = brc_bread_crumbs();
  id v18 = brc_default_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v49 = @"NO";
    *(_DWORD *)buf = 138412802;
    id v62 = v13;
    __int16 v63 = 2112;
    if (v12) {
      v49 = @"YES";
    }
    v64 = v49;
    __int16 v65 = 2112;
    v66 = v17;
    _os_log_debug_impl(&dword_23FA42000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] handleApplyChangesForUnliveServerItem for %@\ndelete share root: %@%@", buf, 0x20u);
  }

  if (![v13 isFSRoot])
  {
    if (!v12 || ![v13 isDocument]) {
      goto LABEL_34;
    }
    v23 = brc_bread_crumbs();
    v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      +[BRCServerChangesApplyUtil handleApplyChangesForUnliveServerItem:isDeleteOfShareRoot:rank:scheduler:zone:session:]();
    }

    unsigned int v25 = [v13 localDiffs];
    v26 = [v16 syncUpScheduler];
    int v27 = [v26 inFlightDiffsForItem:v13];

    if (([v13 needsUpload] & 1) == 0 && ((v27 | v25) & 0x180000) == 0)
    {
      v28 = [v13 asDocument];
      v29 = [v28 currentVersion];
      v30 = [v29 uploadError];
      int v31 = objc_msgSend(v30, "br_isCloudDocsErrorCode:", 43);

      if (!v31) {
        goto LABEL_34;
      }
    }
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = __115__BRCServerChangesApplyUtil_handleApplyChangesForUnliveServerItem_isDeleteOfShareRoot_rank_scheduler_zone_session___block_invoke;
    v55[3] = &unk_265082248;
    id v56 = v13;
    id v32 = v16;
    id v57 = v32;
    id v58 = v14;
    int64_t v60 = a5;
    id v59 = v15;
    v33 = (void *)MEMORY[0x2455D9A50](v55);
    v34 = [v32 clientDB];
    char v35 = [v34 groupInTransaction:v33];

    if ((v35 & 1) == 0)
    {
LABEL_34:
      if (![v13 isDirectory]
        || ([v13 asDirectory],
            v36 = objc_claimAutoreleasedReturnValue(),
            int v37 = [v36 hasLiveChildren],
            v36,
            !v37))
      {
        BOOL v22 = 0;
        goto LABEL_31;
      }
      v38 = brc_bread_crumbs();
      v39 = brc_default_log();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
        +[BRCServerChangesApplyUtil handleApplyChangesForUnliveServerItem:isDeleteOfShareRoot:rank:scheduler:zone:session:]();
      }

      if (v12)
      {
        int64_t v52 = a5;
        v40 = [v13 db];
        v41 = [v13 itemID];
        v42 = [v13 clientZone];
        v43 = [v42 dbRowID];
        v44 = (void *)[v40 fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation FROM client_items WHERE item_stat_ckinfo IS NULL AND item_parent_id = %@ AND zone_rowid = %@", v41, v43];

        if ([v44 next])
        {
          do
          {
            v45 = (void *)MEMORY[0x2455D97F0]();
            v53[0] = MEMORY[0x263EF8330];
            v53[1] = 3221225472;
            v53[2] = __115__BRCServerChangesApplyUtil_handleApplyChangesForUnliveServerItem_isDeleteOfShareRoot_rank_scheduler_zone_session___block_invoke_36;
            v53[3] = &unk_26507F1E8;
            id v54 = v16;
            v46 = [v44 object:v53];
            brc_bread_crumbs();
            v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v48 = brc_default_log();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              id v62 = v13;
              __int16 v63 = 2112;
              v64 = v47;
              _os_log_debug_impl(&dword_23FA42000, v48, OS_LOG_TYPE_DEBUG, "[DEBUG] Marking item unknown to server %@ as rejected%@", buf, 0x16u);
            }

            [v46 markForceRejected];
            [v46 saveToDB];
          }
          while (([v44 next] & 1) != 0);
        }

        a5 = v52;
      }
      v50 = [v15 dbRowID];
      [v14 setState:25 forRank:a5 zoneRowID:v50];
    }
    BOOL v22 = 1;
    goto LABEL_31;
  }
  id v19 = brc_bread_crumbs();
  id v20 = brc_default_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    +[BRCServerChangesApplyUtil handleApplyChangesForUnliveServerItem:isDeleteOfShareRoot:rank:scheduler:zone:session:]();
  }

  [v13 markItemForgottenByServer];
  [v13 markForceNeedsSyncUp];
  id v21 = [v15 dbRowID];
  [v14 setState:0 forRank:a5 zoneRowID:v21];

  BOOL v22 = 1;
  [v13 saveToDBForServerEdit:1 keepAliases:0];
LABEL_31:

  return v22;
}

uint64_t __115__BRCServerChangesApplyUtil_handleApplyChangesForUnliveServerItem_isDeleteOfShareRoot_rank_scheduler_zone_session___block_invoke(uint64_t a1)
{
  v91[1] = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 32);
  if (![*(id *)(a1 + 32) isTopLevelSharedItem])
  {
    v8 = brc_bread_crumbs();
    v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __115__BRCServerChangesApplyUtil_handleApplyChangesForUnliveServerItem_isDeleteOfShareRoot_rank_scheduler_zone_session___block_invoke_cold_8();
    }

    v10 = objc_msgSend(MEMORY[0x263EFD7E8], "brc_fetchShareIDWithSharedItem:", *v2);
    v11 = [*v2 clientZone];
    BOOL v12 = objc_msgSend(v10, "brc_shareItemID");
    id v13 = [v11 itemByItemID:v12];

    if (!v13)
    {
      v23 = brc_bread_crumbs();
      v24 = brc_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v25 = objc_msgSend(v10, "brc_shareItemID");
        v26 = [*v2 itemID];
        int v27 = [v26 debugItemIDString];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v25;
        __int16 v84 = 2112;
        v85 = v27;
        __int16 v86 = 2112;
        v87 = v23;
        _os_log_impl(&dword_23FA42000, v24, OS_LOG_TYPE_DEFAULT, "[WARNING] Could not find share root item %@ for item %@. Just trash ...%@", buf, 0x20u);
      }
      id v17 = [*v2 appLibrary];
      v5 = [v17 defaultClientZone];
      v6 = 0;
      id v7 = 0;
      goto LABEL_35;
    }
    id v14 = brc_bread_crumbs();
    id v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      __115__BRCServerChangesApplyUtil_handleApplyChangesForUnliveServerItem_isDeleteOfShareRoot_rank_scheduler_zone_session___block_invoke_cold_7();
    }

    id v16 = [v13 extendedAttributes];
    id v17 = [v16 objectForKeyedSubscript:@"com.apple.clouddocs.private.recovered-bookmark#N"];

    if (v17)
    {
      id v18 = (void *)[[NSString alloc] initWithData:v17 encoding:4];
      *(void *)buf = 0;
      [v18 parseUnsaltedBookmarkDataWithItemID:buf mangledID:0 error:0];
      id v19 = [v13 parentClientZone];
      id v20 = [v19 itemByItemID:*(void *)buf];
      v6 = [v20 asDirectory];

      if (v6)
      {
        id v21 = brc_bread_crumbs();
        BOOL v22 = brc_default_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          __115__BRCServerChangesApplyUtil_handleApplyChangesForUnliveServerItem_isDeleteOfShareRoot_rank_scheduler_zone_session___block_invoke_cold_6(v6);
        }

        id v7 = 0;
        goto LABEL_29;
      }
      v28 = brc_bread_crumbs();
      v29 = brc_default_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        __115__BRCServerChangesApplyUtil_handleApplyChangesForUnliveServerItem_isDeleteOfShareRoot_rank_scheduler_zone_session___block_invoke_cold_5((id *)buf);
      }
    }
    v78 = v10;
    v30 = brc_bread_crumbs();
    int v31 = brc_default_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      __115__BRCServerChangesApplyUtil_handleApplyChangesForUnliveServerItem_isDeleteOfShareRoot_rank_scheduler_zone_session___block_invoke_cold_4(v13);
    }

    id v32 = [*(id *)(a1 + 40) fsImporter];
    v33 = [v13 appLibrary];
    id v82 = 0;
    uint64_t v34 = [v32 getOrCreateTrashItemInAppLibrary:v33 error:&v82];
    id v35 = v82;

    v36 = [*(id *)(a1 + 40) fsImporter];
    int v37 = [v13 st];
    v38 = [v37 logicalNameWithoutLocalBounce];
    id v81 = v35;
    v76 = (void *)v34;
    v6 = [v36 createAndImportNewDirectoryWithLogicalName:v38 parentItem:v34 error:&v81];
    id v7 = v81;

    v39 = [v13 computeItemPathRelativeToRoot];
    v40 = [v6 st];
    [v40 setTrashPutBackPath:v39];

    v41 = [v13 st];
    v42 = [v41 parentID];
    v43 = [v6 st];
    [v43 setTrashPutBackParentID:v42];

    if ([v6 saveToDB])
    {
      v74 = v17;
      v44 = NSString;
      v45 = [v6 itemID];
      v46 = [v45 itemIDString];
      v47 = [v6 clientZone];
      v48 = [v47 mangledID];
      uint64_t v49 = [v44 unsaltedBookmarkDataWithItemResolutionString:v46 serverZoneMangledID:v48];

      v50 = (void *)v49;
      v51 = brc_bread_crumbs();
      int64_t v52 = brc_default_log();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
        __115__BRCServerChangesApplyUtil_handleApplyChangesForUnliveServerItem_isDeleteOfShareRoot_rank_scheduler_zone_session___block_invoke_cold_3();
      }

      v90 = @"com.apple.clouddocs.private.recovered-bookmark#N";
      v53 = [v50 dataUsingEncoding:4];
      v91[0] = v53;
      id v54 = [NSDictionary dictionaryWithObjects:v91 forKeys:&v90 count:1];
      [v13 updateWithXattrs:v54];

      [v13 saveToDB];
      id v17 = v74;
    }

    if (!v6)
    {
      id v57 = brc_bread_crumbs();
      id v58 = brc_default_log();
      v10 = v78;
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v57;
        _os_log_impl(&dword_23FA42000, v58, OS_LOG_TYPE_DEFAULT, "[WARNING] Could not create parent item in trash. Just trash ...%@", buf, 0xCu);
      }

      id v59 = [*v2 appLibrary];
      v5 = [v59 defaultClientZone];

      v6 = 0;
      goto LABEL_35;
    }
    v10 = v78;
LABEL_29:
    v55 = brc_bread_crumbs();
    id v56 = brc_default_log();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    {
      id v71 = *v2;
      v77 = [v13 st];
      [v77 logicalNameWithoutLocalBounce];
      v72 = v75 = v17;
      [v6 itemGlobalID];
      v73 = v79 = v10;
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v71;
      __int16 v84 = 2112;
      v85 = v72;
      __int16 v86 = 2112;
      v87 = v73;
      __int16 v88 = 2112;
      v89 = v55;
      _os_log_debug_impl(&dword_23FA42000, v56, OS_LOG_TYPE_DEBUG, "[DEBUG] Trash item %@ under folder %@ with id %@%@", buf, 0x2Au);

      v10 = v79;
      id v17 = v75;
    }
    v5 = [v6 clientZone];
LABEL_35:

    goto LABEL_36;
  }
  v3 = brc_bread_crumbs();
  v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __115__BRCServerChangesApplyUtil_handleApplyChangesForUnliveServerItem_isDeleteOfShareRoot_rank_scheduler_zone_session___block_invoke_cold_2();
  }

  v5 = [*v2 parentClientZone];
  v6 = 0;
  id v7 = 0;
LABEL_36:
  [*(id *)(a1 + 32) _moveToZoneWhenServerItemIsDead:v5];
  int64_t v60 = [*(id *)(a1 + 40) fsImporter];
  uint64_t v61 = *(void *)(a1 + 32);
  id v80 = v7;
  int v62 = [v60 trashItem:v61 parentItemInTrash:v6 error:&v80];
  id v63 = v80;

  if (v62 && ([*v2 markNeedsUploadOrSyncingUp], objc_msgSend(*v2, "saveToDB")))
  {
    v64 = brc_bread_crumbs();
    __int16 v65 = brc_default_log();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG)) {
      __115__BRCServerChangesApplyUtil_handleApplyChangesForUnliveServerItem_isDeleteOfShareRoot_rank_scheduler_zone_session___block_invoke_cold_1(v2, (uint64_t)v64, v65);
    }

    uint64_t v66 = *(void *)(a1 + 64);
    uint64_t v67 = *(void **)(a1 + 48);
    v68 = [*(id *)(a1 + 56) dbRowID];
    [v67 setState:0 forRank:v66 zoneRowID:v68];

    uint64_t v69 = 1;
  }
  else
  {
    uint64_t v69 = 0;
  }

  return v69;
}

id __115__BRCServerChangesApplyUtil_handleApplyChangesForUnliveServerItem_isDeleteOfShareRoot_rank_scheduler_zone_session___block_invoke_36(uint64_t a1, void *a2, uint64_t a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  v6 = [v4 clientDB];
  id v7 = (void *)[v4 newLocalItemFromPQLResultSet:v5 db:v6 error:a3];

  return v7;
}

+ (BOOL)deletingShareRoot:(id)a3 localItem:(id)a4
{
  id v5 = a4;
  int v6 = [a3 isDead];
  if (a3 && !v6) {
    goto LABEL_8;
  }
  if ([v5 isSharedToMeTopLevelItem])
  {
    char v7 = 1;
    goto LABEL_9;
  }
  if (![v5 isSharedToMeChildItem])
  {
LABEL_8:
    char v7 = 0;
    goto LABEL_9;
  }
  v8 = objc_msgSend(MEMORY[0x263EFD7E8], "brc_fetchShareIDWithSharedItem:", v5);
  v9 = objc_msgSend(v8, "brc_shareItemID");
  v10 = [v5 clientZone];
  v11 = [v10 serverItemByItemID:v9];

  if (v11) {
    char v7 = [v11 isDead];
  }
  else {
    char v7 = 1;
  }

LABEL_9:
  return v7;
}

+ (BOOL)handleNonRevivedItemIfNecessary:(id)a3 si:(id)a4 rank:(int64_t)a5 scheduler:(id)a6 zone:(id)a7 hasInitialScanItemTypeMismatch:(BOOL *)a8
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (!a3)
  {
    if (a8) {
      *a8 = 0;
    }
    id v17 = [v13 parentItemIDOnFS];
    id v18 = [v13 clientZone];
    id v19 = [v13 st];
    id v20 = [v19 logicalName];
    id v21 = [v18 itemByParentID:v17 andLogicalName:v20];

    if (![v21 isFromInitialScan]) {
      goto LABEL_40;
    }
    BOOL v22 = brc_bread_crumbs();
    v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v41 = v21;
      __int16 v42 = 2112;
      id v43 = v13;
      __int16 v44 = 2112;
      v45 = v22;
      _os_log_debug_impl(&dword_23FA42000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] Found a freshly scanned item from an initial scan that path matches: %@ for server item: %@%@", buf, 0x20u);
    }

    v24 = [v21 clientZone];
    unsigned int v25 = [v13 clientZone];
    if (![v24 isEqualToClientZone:v25]) {
      goto LABEL_35;
    }
    if [v21 isFSRoot] && (objc_msgSend(v13, "isDirectory")) {
      goto LABEL_22;
    }
    v39 = [v21 st];
    unsigned int v26 = [v39 type];
    v38 = [v13 st];
    unsigned int v27 = [v38 type];
    if (v26 != v27)
    {
      if (v26 > 0xA) {
        goto LABEL_34;
      }
      if (((1 << v26) & 0x611) == 0)
      {
        if (((1 << v26) & 0x106) != 0)
        {
LABEL_15:
          if (v27 > 8 || ((1 << v27) & 0x106) == 0)
          {
            if (v26 != 6) {
              goto LABEL_34;
            }
            goto LABEL_29;
          }
          goto LABEL_21;
        }
        if (v26 == 6)
        {
LABEL_29:
          unsigned int v34 = v27;

          if (v34 != 6)
          {
LABEL_36:
            id v35 = brc_bread_crumbs();
            v36 = brc_default_log();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
              +[BRCServerChangesApplyUtil handleNonRevivedItemIfNecessary:si:rank:scheduler:zone:hasInitialScanItemTypeMismatch:]();
            }

            if (a8)
            {
              BOOL v16 = 0;
              *a8 = 1;
LABEL_41:

              goto LABEL_42;
            }
LABEL_40:
            BOOL v16 = 0;
            goto LABEL_41;
          }
LABEL_23:
          v28 = brc_bread_crumbs();
          v29 = brc_default_log();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
            +[BRCServerChangesApplyUtil handleNonRevivedItemIfNecessary:si:rank:scheduler:zone:hasInitialScanItemTypeMismatch:]();
          }

          v30 = [v13 itemID];
          [v21 learnItemID:v30 serverItem:v13];

          [v21 saveToDBForServerEdit:1 keepAliases:0];
          int v31 = brc_bread_crumbs();
          id v32 = brc_default_log();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
            +[BRCServerChangesApplyUtil handleNonRevivedItemIfNecessary:si:rank:scheduler:zone:hasInitialScanItemTypeMismatch:]();
          }

          v33 = [v15 dbRowID];
          [v14 setState:22 forRank:a5 zoneRowID:v33];

          BOOL v16 = 1;
          goto LABEL_41;
        }
LABEL_34:

LABEL_35:
        goto LABEL_36;
      }
      if (v27 > 0xA || ((1 << v27) & 0x611) == 0)
      {
        if (v26 - 1 < 2) {
          goto LABEL_15;
        }
        if (v26 == 6) {
          goto LABEL_29;
        }
        if (v26 == 8) {
          goto LABEL_15;
        }
        goto LABEL_34;
      }
    }
LABEL_21:

LABEL_22:
    goto LABEL_23;
  }
  BOOL v16 = 0;
LABEL_42:

  return v16;
}

+ (BOOL)handleEtagsChangesOnly:(id)a3 si:(id)a4 rank:(int64_t)a5 scheduler:(id)a6 zone:(id)a7 diffs:(unint64_t *)a8 needsSave:(BOOL *)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  if (!v14) {
    goto LABEL_8;
  }
  unint64_t v18 = *a8;
  if ((*a8 & 0x7FFF) == 1)
  {
    id v19 = brc_bread_crumbs();
    id v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      +[BRCServerChangesApplyUtil handleEtagsChangesOnly:si:rank:scheduler:zone:diffs:needsSave:]();
    }

    [v14 updateStructuralCKInfoFromServerItem:v15];
    *a9 = 1;
    unint64_t v18 = *a8 & 0xFFFFFFFFFFFFFFFELL;
    *a8 = v18;
  }
  if (v18 || ([v14 isDocument] & 1) != 0)
  {
LABEL_8:
    BOOL v21 = 0;
  }
  else
  {
    v23 = brc_bread_crumbs();
    v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      +[BRCServerChangesApplyUtil handleEtagsChangesOnly:si:rank:scheduler:zone:diffs:needsSave:]();
    }

    unsigned int v25 = [v17 dbRowID];
    [v16 setState:0 forRank:a5 zoneRowID:v25];

    BOOL v21 = 1;
    if (a9) {
      [v14 saveToDBForServerEdit:1 keepAliases:0];
    }
  }

  return v21;
}

+ (void)handleApplyChangesForUnliveServerItem:isDeleteOfShareRoot:rank:scheduler:zone:session:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] the fs root was remotely deleted, we need to recreate it and reupload it%@", v2, v3, v4, v5, v6);
}

+ (void)handleApplyChangesForUnliveServerItem:isDeleteOfShareRoot:rank:scheduler:zone:session:.cold.2()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Apply Changes[%lld]: postponing rank (live child)%@");
}

+ (void)handleApplyChangesForUnliveServerItem:isDeleteOfShareRoot:rank:scheduler:zone:session:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Deleting share root for document %@%@");
}

void __115__BRCServerChangesApplyUtil_handleApplyChangesForUnliveServerItem_isDeleteOfShareRoot_rank_scheduler_zone_session___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_23FA42000, a2, a3, "[DEBUG] Item after trash %@%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

void __115__BRCServerChangesApplyUtil_handleApplyChangesForUnliveServerItem_isDeleteOfShareRoot_rank_scheduler_zone_session___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Document is top level shared --> Just trash%@", v2, v3, v4, v5, v6);
}

void __115__BRCServerChangesApplyUtil_handleApplyChangesForUnliveServerItem_isDeleteOfShareRoot_rank_scheduler_zone_session___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Saving trashURLBookmarkDataToSet: %@%@");
}

void __115__BRCServerChangesApplyUtil_handleApplyChangesForUnliveServerItem_isDeleteOfShareRoot_rank_scheduler_zone_session___block_invoke_cold_4(void *a1)
{
  os_log_t v1 = [a1 st];
  uint64_t v2 = [v1 logicalNameWithoutLocalBounce];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_1(&dword_23FA42000, v3, v4, "[DEBUG] Create folder %@ under trash%@", v5, v6, v7, v8, v9);
}

void __115__BRCServerChangesApplyUtil_handleApplyChangesForUnliveServerItem_isDeleteOfShareRoot_rank_scheduler_zone_session___block_invoke_cold_5(id *a1)
{
  os_log_t v1 = [*a1 debugItemIDString];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_1(&dword_23FA42000, v2, v3, "[DEBUG] Could not find previously created folder in trash: %@%@", v4, v5, v6, v7, v8);
}

void __115__BRCServerChangesApplyUtil_handleApplyChangesForUnliveServerItem_isDeleteOfShareRoot_rank_scheduler_zone_session___block_invoke_cold_6(void *a1)
{
  os_log_t v1 = [a1 itemID];
  uint64_t v2 = [v1 debugItemIDString];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_1(&dword_23FA42000, v3, v4, "[DEBUG] Found previously created folder in trash: %@%@", v5, v6, v7, v8, v9);
}

void __115__BRCServerChangesApplyUtil_handleApplyChangesForUnliveServerItem_isDeleteOfShareRoot_rank_scheduler_zone_session___block_invoke_cold_7()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Found share root %@%@");
}

void __115__BRCServerChangesApplyUtil_handleApplyChangesForUnliveServerItem_isDeleteOfShareRoot_rank_scheduler_zone_session___block_invoke_cold_8()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Document is under some share root%@", v2, v3, v4, v5, v6);
}

+ (void)handleNonRevivedItemIfNecessary:si:rank:scheduler:zone:hasInitialScanItemTypeMismatch:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Suspending rank since freshly scanned means either same content or conflict: %@%@");
}

+ (void)handleNonRevivedItemIfNecessary:si:rank:scheduler:zone:hasInitialScanItemTypeMismatch:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Item type matches with the server item type%@", v2, v3, v4, v5, v6);
}

+ (void)handleNonRevivedItemIfNecessary:si:rank:scheduler:zone:hasInitialScanItemTypeMismatch:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Item type does not match with the server item type%@", v2, v3, v4, v5, v6);
}

+ (void)handleEtagsChangesOnly:si:rank:scheduler:zone:diffs:needsSave:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Remove rank for item with no real changes: %@%@");
}

+ (void)handleEtagsChangesOnly:si:rank:scheduler:zone:diffs:needsSave:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Accepting Structural Etag update for %@%@");
}

@end