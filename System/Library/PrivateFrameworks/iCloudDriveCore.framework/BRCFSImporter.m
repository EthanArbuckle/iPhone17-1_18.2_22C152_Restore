@interface BRCFSImporter
- (BOOL)_deleteAppLibrary:(id)a3 documentsFolder:(id)a4 error:(id *)a5;
- (BOOL)_doesAppLibraryMatchWithItemURL:(id)a3 appLibraryRowID:(id)a4;
- (BOOL)_isDesktopOrDocumentsItem:(id)a3;
- (BOOL)_processParentAndFilenameIfNecessaryWithLocalItem:(id)a3 changedFields:(unint64_t)a4 templateItem:(id)a5 error:(id *)a6;
- (BOOL)_shouldRejectItemDeleteDueToEtags:(id)a3 baseVersion:(id)a4 error:(id *)a5;
- (BOOL)_shouldRejectItemWithName:(id)a3 templateItem:(id)a4 existingItem:(id)a5 options:(unint64_t)a6 shouldRemoveItemFromDrive:(BOOL *)a7;
- (BOOL)_trashItem:(id)a3 error:(id *)a4;
- (BOOL)changeItem:(id)a3 baseVersion:(id)a4 changedFields:(unint64_t)a5 newValues:(id)a6 contents:(id)a7 additionalAttrs:(id)a8 clearCKInfoOnSyncUp:(BOOL)a9 stillPendingFields:(unint64_t *)a10 error:(id *)a11;
- (BOOL)deleteItem:(id)a3 recursively:(BOOL)a4 baseVersion:(id)a5 error:(id *)a6;
- (BOOL)isCancelled;
- (BOOL)isFPFSMigrationInProgress;
- (BOOL)trashItem:(id)a3 parentItemInTrash:(id)a4 error:(id *)a5;
- (BRCFSImporter)initWithAccountSession:(id)a3;
- (id)_createAndInsertNewItemWithImportObject:(id)a3 parentItem:(id)a4 fields:(unint64_t)a5 templateItem:(id)a6 fileURL:(id)a7 options:(unint64_t)a8 additionalAttrs:(id)a9 importBookmark:(id)a10 stillPendingFields:(unint64_t *)a11 error:(id *)a12;
- (id)_createBaseItemWithImportObject:(id)a3 importBookmark:(id)a4 parentItem:(id)a5 options:(unint64_t)a6 error:(id *)a7;
- (id)_findCollidingItemWithTemplateItem:(id)a3 parentItem:(id)a4 logicalName:(id)a5 error:(id *)a6;
- (id)_globalItemByDocumentID:(unsigned int)a3;
- (id)_globalItemByFileID:(unint64_t)a3;
- (id)_handleCollisionIfNecessaryWithTemplateItem:(id)a3 parentItem:(id)a4 logicalName:(id)a5 fileURL:(id)a6 options:(unint64_t)a7 error:(id *)a8;
- (id)_locateMatchingItemForTemplateItem:(id)a3 parentItem:(id)a4 options:(unint64_t)a5 fileURL:(id)a6 fields:(unint64_t *)a7 shouldReject:(BOOL *)a8 additionalAttrs:(id)a9 importBookmark:(id)a10 ignoreImportBookmark:(BOOL *)a11 stillPendingFields:(unint64_t *)a12 error:(id *)a13;
- (id)_locateTemplateItemFromFPFSMigration:(id)a3 fields:(unint64_t *)a4 documentHasChanges:(BOOL *)a5;
- (id)_parseImportBookmark:(id)a3 templateItem:(id)a4 fileURL:(id)a5 ignoreImportBookmark:(BOOL *)a6;
- (id)createAndImportNewDirectoryWithLogicalName:(id)a3 parentItem:(id)a4 error:(id *)a5;
- (id)getOrCreateTrashItemInAppLibrary:(id)a3 error:(id *)a4;
- (id)importAppLibraryRootFromTemplateItem:(id)a3;
- (id)importNewItemAtURL:(id)a3 parentItem:(id)a4 templateItem:(id)a5 fields:(unint64_t)a6 options:(unint64_t)a7 additionalItemAttributes:(id)a8 importBookmark:(id)a9 stillPendingFields:(unint64_t *)a10 error:(id *)a11;
- (unsigned)_itemTypeToFileObjectIDType:(char)a3 itemID:(id)a4;
- (unsigned)capabilityToMoveItem:(id)a3 toNewParentItem:(id)a4 error:(id *)a5;
- (void)_changeBasicFieldsOnItem:(id)a3 fields:(unint64_t)a4 template:(id)a5;
- (void)_childPropagationSchedule;
- (void)_cleanItemBatchAfterMigrationToFPFSIfNecessary;
- (void)_learnEtagsIfNecessaryWithItem:(id)a3 changedFields:(unint64_t)a4 baseVersion:(id)a5;
- (void)_markNextChildBatchDead:(id)a3 persistedState:(id)a4 batchSize:(int)a5;
- (void)_processIngestBatch:(id)a3 minRowID:(unint64_t)a4;
- (void)_propagateDirectoryMergeOrCrossZoneMove:(id)a3 persistedState:(id)a4 batchSize:(int)a5;
- (void)_propagateFieldsToNextChildBatch:(id)a3 persistedState:(id)a4 minRowID:(unint64_t)a5 batchSize:(int)a6;
- (void)_reportBouncingForMigration:(id)a3 existingItem:(id)a4;
- (void)_resolveConflictLosersForItem:(id)a3 localItem:(id)a4;
- (void)_updateFPFSMigrationStatsForBouncing:(id)a3 existingItem:(id)a4;
- (void)cancel;
- (void)resume;
- (void)signal;
- (void)suspend;
@end

@implementation BRCFSImporter

- (BRCFSImporter)initWithAccountSession:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BRCFSImporter;
  v6 = [(BRCFSImporter *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_session, a3);
    objc_initWeak(&location, v7);
    v8 = [BRCFairSource alloc];
    v9 = [(BRCAccountSessionFPFS *)v7->_session fairClientDBScheduler];
    uint64_t v10 = [(BRCFairSource *)v8 initWithName:@"child-propagation" scheduler:v9];
    childPropagationSource = v7->_childPropagationSource;
    v7->_childPropagationSource = (BRCFairSource *)v10;

    v12 = [v5 clientTruthWorkloop];
    [(BRCFairSource *)v7->_childPropagationSource setWorkloop:v12];

    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __40__BRCFSImporter_initWithAccountSession___block_invoke;
    v14[3] = &unk_26507ED20;
    objc_copyWeak(&v15, &location);
    [(BRCFairSource *)v7->_childPropagationSource setEventHandler:v14];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __40__BRCFSImporter_initWithAccountSession___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _childPropagationSchedule];
}

- (id)_createBaseItemWithImportObject:(id)a3 importBookmark:(id)a4 parentItem:(id)a5 options:(unint64_t)a6 error:(id *)a7
{
  char v8 = a6;
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if ([v12 isDocument])
  {
    id v15 = off_26507DBE0;
    goto LABEL_17;
  }
  if ([v12 isSymLink])
  {
    id v15 = off_26507DEC8;
    goto LABEL_17;
  }
  if (![v12 isBRAlias])
  {
    if ([v12 isFinderAlias])
    {
      id v15 = off_26507DC98;
    }
    else
    {
      if (([v12 isUnixDir] & 1) == 0)
      {
        v42 = brc_bread_crumbs();
        v43 = brc_default_log();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT)) {
          -[BRCFSImporter _createBaseItemWithImportObject:importBookmark:parentItem:options:error:].cold.4();
        }

        v18 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: Import object of unknown type %@", v12);
        if (!v18) {
          goto LABEL_46;
        }
        v19 = brc_bread_crumbs();
        v20 = brc_default_log();
        if (!os_log_type_enabled(v20, (os_log_type_t)0x90u)) {
          goto LABEL_45;
        }
        v21 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v46 = "-[BRCFSImporter _createBaseItemWithImportObject:importBookmark:parentItem:options:error:]";
        __int16 v47 = 2080;
        if (!a7) {
          v21 = "(ignored by caller)";
        }
        goto LABEL_12;
      }
      id v15 = off_26507DBD8;
    }
LABEL_17:
    v22 = (char *)[objc_alloc(*v15) _initWithImportObject:v12 error:a7];
    v23 = [v13 mangledID];
    int v24 = [v23 isShared];

    if (v24)
    {
      brc_bread_crumbs();
      v25 = (char *)objc_claimAutoreleasedReturnValue();
      v26 = brc_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v46 = v22;
        __int16 v47 = 2112;
        v48 = v25;
        _os_log_impl(&dword_23FA42000, v26, OS_LOG_TYPE_DEFAULT, "[WARNING] Marking %@ as a top level shared item because it has top level share bookmark data%@", buf, 0x16u);
      }

      [v22 markImportedItemAsSharedWithImportBookmark:v13 parent:v14];
    }
    if ((v8 & 1) == 0)
    {
      if ([(BRCFSImporter *)self _isDesktopOrDocumentsItem:v22])
      {
        v27 = brc_bread_crumbs();
        v28 = brc_default_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          -[BRCFSImporter _createBaseItemWithImportObject:importBookmark:parentItem:options:error:]();
        }

        v29 = [v12 logicalName];
        int v30 = [v29 isEqualToString:*MEMORY[0x263F32500]];

        if (v30)
        {
          uint64_t v31 = +[BRCItemID defaultDesktopItemID];
        }
        else
        {
          v37 = [v12 logicalName];
          int v38 = [v37 isEqualToString:*MEMORY[0x263F32510]];

          if (!v38)
          {
            v39 = 0;
            goto LABEL_38;
          }
          uint64_t v31 = +[BRCItemID defaultDocumentsItemID];
        }
        v39 = (void *)v31;
LABEL_38:
        v40 = [v22 clientZone];
        char v41 = [v40 existsByItemID:v39];

        if ((v41 & 1) == 0) {
          [v22 learnItemID:v39 serverItem:0];
        }
        [v22 markFromInitialScan];

        goto LABEL_49;
      }
      if ([v22 isUserVisible]) {
        goto LABEL_49;
      }
      if ([v22 isInDocumentScope])
      {
        v32 = [v22 appLibrary];
        v33 = [v32 containerMetadata];
        int v34 = [v33 isDocumentScopePublic];

        if (!v34) {
          goto LABEL_49;
        }
      }
      v35 = brc_bread_crumbs();
      v36 = brc_default_log();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
        -[BRCFSImporter _createBaseItemWithImportObject:importBookmark:parentItem:options:error:]();
      }
    }
    [v22 markFromInitialScan];
    goto LABEL_49;
  }
  v16 = brc_bread_crumbs();
  objc_super v17 = brc_default_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
    -[BRCFSImporter _createBaseItemWithImportObject:importBookmark:parentItem:options:error:]();
  }

  v18 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: Can't import br aliases anymore %@", v12);
  if (!v18) {
    goto LABEL_46;
  }
  v19 = brc_bread_crumbs();
  v20 = brc_default_log();
  if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
  {
    v21 = "(passed to caller)";
    *(_DWORD *)buf = 136315906;
    v46 = "-[BRCFSImporter _createBaseItemWithImportObject:importBookmark:parentItem:options:error:]";
    __int16 v47 = 2080;
    if (!a7) {
      v21 = "(ignored by caller)";
    }
LABEL_12:
    v48 = v21;
    __int16 v49 = 2112;
    v50 = v18;
    __int16 v51 = 2112;
    v52 = v19;
    _os_log_error_impl(&dword_23FA42000, v20, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
  }
LABEL_45:

LABEL_46:
  if (a7) {
    *a7 = v18;
  }

  v22 = 0;
LABEL_49:

  return v22;
}

- (BOOL)isFPFSMigrationInProgress
{
  return [(BRCAccountSessionFPFS *)self->_session fpfsMigrationState] == 1;
}

- (id)_globalItemByDocumentID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(BRCFSImporter *)self isFPFSMigrationInProgress])
  {
    id v5 = [(BRCAccountSessionFPFS *)self->_session clientDB];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __41__BRCFSImporter__globalItemByDocumentID___block_invoke;
    v12[3] = &unk_26507F210;
    v12[4] = self;
    id v13 = v5;
    id v6 = v5;
    v7 = (void *)[v6 fetchObject:v12, @"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation FROM client_items WHERE item_doc_id = %u   AND +item_state = 0   AND +item_type IN (1, 2, 8, 6, 7)", v3 sql];
    if ([v7 isMigratingToFPFS]) {
      char v8 = v7;
    }
    else {
      char v8 = 0;
    }
    id v9 = v8;
  }
  else
  {
    brc_bread_crumbs();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSImporter _globalItemByDocumentID:]();
    }

    id v9 = 0;
  }

  return v9;
}

id __41__BRCFSImporter__globalItemByDocumentID___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) newLocalItemFromPQLResultSet:a2 db:*(void *)(a1 + 40) error:a3];
  return v3;
}

- (id)_globalItemByFileID:(unint64_t)a3
{
  if ([(BRCFSImporter *)self isFPFSMigrationInProgress])
  {
    id v5 = [(BRCAccountSessionFPFS *)self->_session clientDB];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __37__BRCFSImporter__globalItemByFileID___block_invoke;
    v12[3] = &unk_26507F210;
    v12[4] = self;
    id v13 = v5;
    id v6 = v5;
    v7 = (void *)[v6 fetchObject:v12, @"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation FROM client_items  WHERE item_file_id = %lld    AND item_state IN (0, -1)", a3 sql];
    if ([v7 isMigratingToFPFS]) {
      char v8 = v7;
    }
    else {
      char v8 = 0;
    }
    id v9 = v8;
  }
  else
  {
    brc_bread_crumbs();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSImporter _globalItemByFileID:]();
    }

    id v9 = 0;
  }

  return v9;
}

id __37__BRCFSImporter__globalItemByFileID___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) newLocalItemFromPQLResultSet:a2 db:*(void *)(a1 + 40) error:a3];
  return v3;
}

- (BOOL)_shouldRejectItemWithName:(id)a3 templateItem:(id)a4 existingItem:(id)a5 options:(unint64_t)a6 shouldRemoveItemFromDrive:(BOOL *)a7
{
  char v8 = a6;
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = objc_msgSend(v11, "br_stringByDeletingPathBounceNo:", 0);
  if ((v8 & 1) == 0) {
    goto LABEL_10;
  }
  id v15 = [v12 extendedAttributes];
  v16 = [v15 objectForKeyedSubscript:@"com.apple.fpfs.fileid"];
  if (!v16 || ([v14 isEqualToString:@".Trash-from-provider"] & 1) == 0)
  {

    goto LABEL_10;
  }
  [v13 st];
  v40 = v14;
  v18 = objc_super v17 = v13;
  v19 = [v18 logicalName];
  v20 = objc_msgSend(v19, "br_stringByDeletingPathBounceNo:", 0);
  int v21 = [v20 isEqualToString:@".Trash-from-provider"];

  id v13 = v17;
  id v14 = v40;

  if (!v21)
  {
LABEL_10:
    if ([v14 isEqualToString:*MEMORY[0x263F32538]]
      && (!v13 || [v13 isInTrashScope]))
    {
      v25 = brc_bread_crumbs();
      v26 = brc_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v42 = v25;
        v27 = "[INFO] rejecting Trash folder%@";
LABEL_20:
        uint64_t v31 = v26;
        os_log_type_t v32 = OS_LOG_TYPE_INFO;
LABEL_26:
        _os_log_impl(&dword_23FA42000, v31, v32, v27, buf, 0xCu);
        goto LABEL_27;
      }
      goto LABEL_27;
    }
    if (v12)
    {
      v28 = [v12 contentType];
      if (objc_msgSend(v28, "br_isAliasFileType"))
      {
        v29 = [v12 extendedAttributes];
        int v30 = [v29 objectForKeyedSubscript:@"com.apple.clouddocs.security"];

        if (v30)
        {
          v25 = brc_bread_crumbs();
          v26 = brc_default_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v42 = v25;
            v27 = "[INFO] rejecting BRAlias%@";
            goto LABEL_20;
          }
LABEL_27:

          BOOL v24 = 1;
          goto LABEL_36;
        }
      }
      else
      {
      }
    }
    if ([v11 isEqualToString:*MEMORY[0x263F32530]])
    {
      v33 = [v12 parentItemIdentifier];
      int v34 = [v33 isEqualToString:*MEMORY[0x263F053F0]];

      if (v34)
      {
        v25 = brc_bread_crumbs();
        v26 = brc_default_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v42 = v25;
          v27 = "[WARNING] rejecting shared mangled containerID%@";
          uint64_t v31 = v26;
          os_log_type_t v32 = OS_LOG_TYPE_DEFAULT;
          goto LABEL_26;
        }
        goto LABEL_27;
      }
    }
    v25 = [v12 contentType];
    if (([v25 br_isDirectoryType] & 1) == 0)
    {
      int v35 = [v11 isEqualToString:*MEMORY[0x263F32510]];

      if (!v35)
      {
LABEL_35:
        BOOL v24 = 0;
        goto LABEL_36;
      }
      v36 = (void *)MEMORY[0x263F325B8];
      v37 = [v12 parentItemIdentifier];
      v25 = [v36 fileObjectIDWithString:v37];

      if ([v25 isAppLibraryRoot])
      {
        v26 = brc_bread_crumbs();
        int v38 = brc_default_log();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v42 = v26;
          _os_log_impl(&dword_23FA42000, v38, OS_LOG_TYPE_DEFAULT, "[WARNING] Rejecting documents folder to be anything other then directory%@", buf, 0xCu);
        }

        goto LABEL_27;
      }
    }

    goto LABEL_35;
  }
  v22 = brc_bread_crumbs();
  v23 = brc_default_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v42 = v13;
    __int16 v43 = 2112;
    v44 = v22;
    _os_log_impl(&dword_23FA42000, v23, OS_LOG_TYPE_DEFAULT, "[WARNING] Rejecting .Trash-from-provider item that was mapped to %@%@", buf, 0x16u);
  }

  BOOL v24 = 1;
  if (a7) {
    *a7 = 1;
  }
LABEL_36:

  return v24;
}

- (BOOL)_isDesktopOrDocumentsItem:(id)a3
{
  id v3 = a3;
  v4 = [v3 parentFileObjectID];
  if ([v4 isCloudDocsRoot]
    && [v3 isDirectory]
    && [v3 itemScope] == 2)
  {
    id v5 = [v3 st];
    id v6 = [v5 logicalName];
    if ([v6 isEqualToString:*MEMORY[0x263F32500]])
    {
      char v7 = 1;
    }
    else
    {
      id v9 = [v3 st];
      uint64_t v10 = [v9 logicalName];
      char v7 = [v10 isEqualToString:*MEMORY[0x263F32510]];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unsigned)capabilityToMoveItem:(id)a3 toNewParentItem:(id)a4 error:(id *)a5
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotFound:", 0);
      id v9 = (char *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        id v14 = brc_bread_crumbs();
        id v15 = brc_default_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          int v35 = "(passed to caller)";
          int v45 = 136315906;
          v46 = "-[BRCFSImporter capabilityToMoveItem:toNewParentItem:error:]";
          __int16 v47 = 2080;
          if (!a5) {
            int v35 = "(ignored by caller)";
          }
          v48 = v35;
          __int16 v49 = 2112;
          v50 = v9;
          __int16 v51 = 2112;
          v52 = v14;
          _os_log_debug_impl(&dword_23FA42000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] %s: %s error: %@%@", (uint8_t *)&v45, 0x2Au);
        }
      }
      if (a5)
      {
        id v9 = v9;
        *a5 = v9;
      }
      unsigned __int16 v13 = 1;
      goto LABEL_95;
    }
    id v9 = [v7 clientZone];
    uint64_t v10 = [v8 clientZone];
    if ([v7 isSharedToMeChildItem] && (objc_msgSend(v7, "sharingOptions") & 0x20) != 0)
    {
      brc_bread_crumbs();
      id v11 = (char *)objc_claimAutoreleasedReturnValue();
      id v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v45 = 138412546;
        v46 = (const char *)v7;
        __int16 v47 = 2112;
        v48 = v11;
        objc_super v17 = "[WARNING] Can't edit a readonly share for %@%@";
LABEL_36:
        _os_log_impl(&dword_23FA42000, v12, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v45, 0x16u);
      }
    }
    else
    {
      if (![v8 isSharedToMe] || (objc_msgSend(v8, "sharingOptions") & 0x20) == 0)
      {
        if ((([v7 isSharedToMeTopLevelItem] & 1) != 0
           || [v7 isSharedByMe]
           && [v7 hasShareIDAndIsOwnedByMe])
          && [v8 isInTrashScope])
        {
          brc_bread_crumbs();
          id v11 = (char *)objc_claimAutoreleasedReturnValue();
          id v12 = brc_default_log();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            int v45 = 138412802;
            v46 = (const char *)v7;
            __int16 v47 = 2112;
            v48 = (const char *)v8;
            __int16 v49 = 2112;
            v50 = v11;
            _os_log_impl(&dword_23FA42000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] Trying to move shared top item %@ into trash at parent %@%@", (uint8_t *)&v45, 0x20u);
          }
          unsigned __int16 v13 = 4096;
          goto LABEL_93;
        }
        if (([v9 isEqualToClientZone:v10] & 1) == 0)
        {
          if ([v7 isSharedToMeTopLevelItem])
          {
            if ([v10 isSharedZone])
            {
              brc_bread_crumbs();
              id v11 = (char *)objc_claimAutoreleasedReturnValue();
              id v12 = brc_default_log();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
              {
                int v45 = 138412802;
                v46 = (const char *)v7;
                __int16 v47 = 2112;
                v48 = (const char *)v8;
                __int16 v49 = 2112;
                v50 = v11;
                _os_log_impl(&dword_23FA42000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] Trying to move shared top item %@ into another shared item %@%@", (uint8_t *)&v45, 0x20u);
              }
              unsigned __int16 v13 = 2;
            }
            else
            {
              v27 = [v7 appLibrary];
              v28 = [v27 defaultClientZone];
              int v29 = [v28 isEqualToClientZone:v10];

              if (v29)
              {
                brc_bread_crumbs();
                id v11 = (char *)objc_claimAutoreleasedReturnValue();
                id v12 = brc_default_log();
                if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
                  -[BRCFSImporter capabilityToMoveItem:toNewParentItem:error:].cold.4();
                }
                unsigned __int16 v13 = 64;
              }
              else
              {
                brc_bread_crumbs();
                id v11 = (char *)objc_claimAutoreleasedReturnValue();
                id v12 = brc_default_log();
                if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
                {
                  int v45 = 138412546;
                  v46 = (const char *)v7;
                  __int16 v47 = 2112;
                  v48 = v11;
                  _os_log_impl(&dword_23FA42000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] Top level shared item %@ moved across zone boundaries.  Allowing it%@", (uint8_t *)&v45, 0x16u);
                }
                unsigned __int16 v13 = 256;
              }
            }
            goto LABEL_93;
          }
          if (([v9 isSharedZone] & 1) == 0 && !objc_msgSend(v10, "isSharedZone"))
          {
            brc_bread_crumbs();
            id v11 = (char *)objc_claimAutoreleasedReturnValue();
            id v12 = brc_default_log();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              int v45 = 138412802;
              v46 = (const char *)v7;
              __int16 v47 = 2112;
              v48 = (const char *)v8;
              __int16 v49 = 2112;
              v50 = v11;
              unsigned __int16 v13 = 32;
              _os_log_impl(&dword_23FA42000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] We need to download item %@ which is crossing zone boundaries to %@%@", (uint8_t *)&v45, 0x20u);
            }
            else
            {
              unsigned __int16 v13 = 32;
            }
            goto LABEL_93;
          }
          if (([v9 isSharedZone] & 1) != 0
            || ![v7 isDirectory]
            || ([v7 asDirectory],
                BOOL v24 = objc_claimAutoreleasedReturnValue(),
                int v25 = [v24 possiblyContainsSharedItem],
                v24,
                !v25))
          {
            brc_bread_crumbs();
            id v11 = (char *)objc_claimAutoreleasedReturnValue();
            id v12 = brc_default_log();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              int v45 = 138412802;
              v46 = (const char *)v7;
              __int16 v47 = 2112;
              v48 = (const char *)v8;
              __int16 v49 = 2112;
              v50 = v11;
              _os_log_impl(&dword_23FA42000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] We need to download item %@ which is moving in or out of a shared zone to parent %@%@", (uint8_t *)&v45, 0x20u);
            }
            unsigned __int16 v13 = 16;
            goto LABEL_93;
          }
          brc_bread_crumbs();
          id v11 = (char *)objc_claimAutoreleasedReturnValue();
          id v12 = brc_default_log();
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_80;
          }
          int v45 = 138412802;
          v46 = (const char *)v7;
          __int16 v47 = 2112;
          v48 = (const char *)v8;
          __int16 v49 = 2112;
          v50 = v11;
          v26 = "[WARNING] Moving an unshared directory %@ into a shared parent %@ where the source item has shared subitems%@";
          goto LABEL_79;
        }
        if ([v7 hasShareIDAndIsOwnedByMe])
        {
          if (([v8 isOwnedByMe] & 1) == 0)
          {
            v39 = brc_bread_crumbs();
            v40 = brc_default_log();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
              -[BRCDaemonContainerHelper br_capabilityToMoveFromLocalItem:toNewParent:session:error:]();
            }
          }
          if ([v8 isSharedByMe])
          {
            brc_bread_crumbs();
            id v11 = (char *)objc_claimAutoreleasedReturnValue();
            id v12 = brc_default_log();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              int v45 = 138412802;
              v46 = (const char *)v7;
              __int16 v47 = 2112;
              v48 = (const char *)v8;
              __int16 v49 = 2112;
              v50 = v11;
              v16 = "[WARNING] Trying to move shared top item %@ into another shared item %@%@";
LABEL_91:
              _os_log_impl(&dword_23FA42000, v12, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v45, 0x20u);
              goto LABEL_92;
            }
            goto LABEL_92;
          }
          goto LABEL_71;
        }
        if ([v7 isOwnedByMe])
        {
          if (![v7 isSharedByMe])
          {
            if ([v8 isSharedByMe])
            {
              brc_bread_crumbs();
              id v11 = (char *)objc_claimAutoreleasedReturnValue();
              id v12 = brc_default_log();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
              {
                int v45 = 138412802;
                v46 = (const char *)v7;
                __int16 v47 = 2112;
                v48 = (const char *)v8;
                __int16 v49 = 2112;
                v50 = v11;
                v16 = "[WARNING] Moving item %@ into a share with parent %@%@";
                goto LABEL_91;
              }
LABEL_92:
              unsigned __int16 v13 = 128;
              goto LABEL_93;
            }
LABEL_71:
            if ([v7 isDirectory]
              && ([v7 isSharedByMe] & 1) == 0
              && ([v7 isSharedToMe] & 1) == 0)
            {
              if (([v8 isSharedToMe] & 1) != 0 || objc_msgSend(v8, "isSharedByMe"))
              {
                v33 = [v7 asDirectory];
                int v34 = [v33 possiblyContainsSharedItem];

                if (v34)
                {
                  brc_bread_crumbs();
                  id v11 = (char *)objc_claimAutoreleasedReturnValue();
                  id v12 = brc_default_log();
                  if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
                  {
LABEL_80:
                    unsigned __int16 v13 = 1024;
                    goto LABEL_93;
                  }
                  int v45 = 138412802;
                  v46 = (const char *)v7;
                  __int16 v47 = 2112;
                  v48 = (const char *)v8;
                  __int16 v49 = 2112;
                  v50 = v11;
                  v26 = "[WARNING] Moving item with a shared child %@ into a share with parent %@%@";
LABEL_79:
                  _os_log_impl(&dword_23FA42000, v12, OS_LOG_TYPE_DEFAULT, v26, (uint8_t *)&v45, 0x20u);
                  goto LABEL_80;
                }
              }
              if ([v8 isInTrashScope])
              {
                v37 = [v7 asDirectory];
                int v38 = [v37 possiblyContainsSharedItem];

                if (v38)
                {
                  brc_bread_crumbs();
                  id v11 = (char *)objc_claimAutoreleasedReturnValue();
                  id v12 = brc_default_log();
                  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
                  {
                    int v45 = 138412802;
                    v46 = (const char *)v7;
                    __int16 v47 = 2112;
                    v48 = (const char *)v8;
                    __int16 v49 = 2112;
                    v50 = v11;
                    _os_log_impl(&dword_23FA42000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] Moving an item with a shared child %@ into trash at parent %@%@", (uint8_t *)&v45, 0x20u);
                  }
                  unsigned __int16 v13 = 2048;
                  goto LABEL_93;
                }
              }
            }
            unsigned __int16 v13 = 64;
            goto LABEL_94;
          }
          if (([v8 isOwnedByMe] & 1) == 0)
          {
            __int16 v43 = brc_bread_crumbs();
            v44 = brc_default_log();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT)) {
              -[BRCDaemonContainerHelper br_capabilityToMoveFromLocalItem:toNewParent:session:error:]();
            }
          }
          if (([v8 isSharedByMe] & 1) == 0)
          {
            brc_bread_crumbs();
            id v11 = (char *)objc_claimAutoreleasedReturnValue();
            id v12 = brc_default_log();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              int v45 = 138412802;
              v46 = (const char *)v7;
              __int16 v47 = 2112;
              v48 = (const char *)v8;
              __int16 v49 = 2112;
              v50 = v11;
              v16 = "[WARNING] Moving item %@ out of the share to new parent %@%@";
              goto LABEL_91;
            }
            goto LABEL_92;
          }
          objc_msgSend(MEMORY[0x263EFD7E8], "brc_fetchShareIDWithSharedItem:", v7);
          id v11 = (char *)objc_claimAutoreleasedReturnValue();
          id v12 = objc_msgSend(MEMORY[0x263EFD7E8], "brc_fetchShareIDWithSharedItem:", v8);
          if (!v12
            || ([v11 recordName],
                v18 = objc_claimAutoreleasedReturnValue(),
                [v12 recordName],
                v19 = objc_claimAutoreleasedReturnValue(),
                char v20 = [v18 isEqualToString:v19],
                v19,
                v18,
                (v20 & 1) == 0))
          {
            brc_bread_crumbs();
            int v21 = (char *)objc_claimAutoreleasedReturnValue();
            v22 = brc_default_log();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              int v45 = 138412802;
              v46 = (const char *)v7;
              __int16 v47 = 2112;
              v48 = (const char *)v8;
              __int16 v49 = 2112;
              v50 = v21;
              v23 = "[WARNING] Moving item %@ into a different share with parent %@%@";
LABEL_66:
              _os_log_impl(&dword_23FA42000, v22, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v45, 0x20u);
              goto LABEL_67;
            }
            goto LABEL_67;
          }
        }
        else
        {
          if ([v8 isOwnedByMe])
          {
            char v41 = brc_bread_crumbs();
            v42 = brc_default_log();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT)) {
              -[BRCFSImporter capabilityToMoveItem:toNewParentItem:error:]();
            }
          }
          objc_msgSend(MEMORY[0x263EFD7E8], "brc_fetchShareIDWithSharedItem:", v7);
          id v11 = (char *)objc_claimAutoreleasedReturnValue();
          id v12 = objc_msgSend(MEMORY[0x263EFD7E8], "brc_fetchShareIDWithSharedItem:", v8);
          if (!v12
            || ([v11 recordName],
                int v30 = objc_claimAutoreleasedReturnValue(),
                [v12 recordName],
                uint64_t v31 = objc_claimAutoreleasedReturnValue(),
                char v32 = [v30 isEqualToString:v31],
                v31,
                v30,
                (v32 & 1) == 0))
          {
            brc_bread_crumbs();
            int v21 = (char *)objc_claimAutoreleasedReturnValue();
            v22 = brc_default_log();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              int v45 = 138412802;
              v46 = (const char *)v7;
              __int16 v47 = 2112;
              v48 = (const char *)v8;
              __int16 v49 = 2112;
              v50 = v21;
              v23 = "[WARNING] Moving item %@ into another shared item %@%@";
              goto LABEL_66;
            }
LABEL_67:

            goto LABEL_92;
          }
        }

        goto LABEL_71;
      }
      brc_bread_crumbs();
      id v11 = (char *)objc_claimAutoreleasedReturnValue();
      id v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v45 = 138412546;
        v46 = (const char *)v8;
        __int16 v47 = 2112;
        v48 = v11;
        objc_super v17 = "[WARNING] Can't add a file to a readonly share with parent %@%@";
        goto LABEL_36;
      }
    }
    unsigned __int16 v13 = 512;
LABEL_93:

LABEL_94:
LABEL_95:

    goto LABEL_96;
  }
  unsigned __int16 v13 = 8;
LABEL_96:

  return v13;
}

- (void)_resolveConflictLosersForItem:(id)a3 localItem:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [a3 conflictingVersions];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v11 conflictResolved])
        {
          id v12 = [BRFieldContentSignature alloc];
          unsigned __int16 v13 = [v11 contentVersion];
          id v14 = [(BRFieldContentSignature *)v12 initWithData:v13];
          id v15 = [(BRFieldContentSignature *)v14 etag];

          v16 = [v5 asDocument];
          [v16 appDidResolveConflictLoserWithEtag:v15];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
}

- (void)_changeBasicFieldsOnItem:(id)a3 fields:(unint64_t)a4 template:(id)a5
{
  __int16 v6 = a4;
  id v17 = a3;
  id v7 = a5;
  uint64_t v8 = v7;
  if ((v6 & 8) != 0)
  {
    uint64_t v10 = [v7 lastUsedDate];
    [v17 updateWithLastUsedDate:v10];

    if ((v6 & 0x10) == 0)
    {
LABEL_3:
      if ((v6 & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((v6 & 0x10) == 0)
  {
    goto LABEL_3;
  }
  id v11 = [v8 tagData];
  id v12 = FPGetTagsFromTagsData();
  unsigned __int16 v13 = [v12 valueForKey:@"label"];

  [v17 updateWithFinderTagNames:v13];
  if ((v6 & 0x20) == 0)
  {
LABEL_4:
    if ((v6 & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  id v14 = [v8 favoriteRank];
  objc_msgSend(v17, "updateWithFavoriteRank:", objc_msgSend(v14, "longLongValue"));

  if ((v6 & 0x40) == 0)
  {
LABEL_5:
    if ((v6 & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  id v15 = [v8 creationDate];
  [v17 updateWithCreationDate:v15];

  if ((v6 & 0x80) == 0)
  {
LABEL_6:
    if ((v6 & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  v16 = [v8 contentModificationDate];
  [v17 updateWithContentModificationDate:v16];

  if ((v6 & 0x100) == 0)
  {
LABEL_7:
    if ((v6 & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  objc_msgSend(v17, "updateWithFileSystemFlags:", objc_msgSend(v8, "fileSystemFlags"));
  if ((v6 & 0x200) != 0)
  {
LABEL_8:
    uint64_t v9 = [v8 extendedAttributes];
    [v17 updateWithXattrs:v9];
  }
LABEL_9:
}

- (void)_updateFPFSMigrationStatsForBouncing:(id)a3 existingItem:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  id v7 = [v17 contentType];
  char v8 = objc_msgSend(v7, "br_isDirectoryType");

  if (v8)
  {
    char v9 = 0;
  }
  else
  {
    uint64_t v10 = [v17 contentType];
    char v11 = objc_msgSend(v10, "br_isSymbolicLinkType");

    if (v11)
    {
      char v9 = 4;
    }
    else
    {
      id v12 = [v17 contentType];
      char v13 = objc_msgSend(v12, "br_isAliasFileType");

      if (v13)
      {
        char v9 = 3;
      }
      else
      {
        id v14 = [v17 contentType];
        int v15 = objc_msgSend(v14, "br_isPackageType");

        if (v15) {
          char v9 = 2;
        }
        else {
          char v9 = 1;
        }
      }
    }
  }
  if ([v6 isDirectory])
  {
    char v16 = 0;
  }
  else if ([v6 isSymLink])
  {
    char v16 = 4;
  }
  else if ([v6 isFinderBookmark])
  {
    char v16 = 3;
  }
  else if ([v6 isPackage])
  {
    char v16 = 2;
  }
  else
  {
    char v16 = 1;
  }
  [(BRCAccountSessionFPFS *)self->_session _updateFPFSMigrationBouncedItemType:v9 withExistingItemType:v16];
}

- (void)_reportBouncingForMigration:(id)a3 existingItem:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a4;
  [(BRCFSImporter *)self _updateFPFSMigrationStatsForBouncing:a3 existingItem:v6];
  if ([(BRCFSImporter *)self isFPFSMigrationInProgress])
  {
    if ([v6 isDirectory])
    {
      id v7 = +[BRCUserDefaults defaultsForMangledID:0];
      int v8 = [v7 filterDecendantsOfNotMigratedFolders];

      if (v8)
      {
        char v9 = [(BRCAccountSessionFPFS *)self->_session clientDB];
        if (isFPFSMigrationNonMigratedFoldersExists(v9, v10))
        {
          char v11 = [v6 itemGlobalID];
          id v12 = brc_bread_crumbs();
          char v13 = brc_default_log();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
            -[BRCFSImporter _reportBouncingForMigration:existingItem:]();
          }

          id v14 = [v11 itemID];
          int v15 = [v11 zoneRowID];
          int v16 = [v9 execute:@"INSERT OR IGNORE INTO fpfs_folders_not_migrated (item_id, zone_rowid) VALUES (%@, %@)", v14, v15];

          if (!v16 || ![v9 changes])
          {
            id v17 = brc_bread_crumbs();
            long long v18 = brc_default_log();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              long long v19 = [v11 itemID];
              long long v20 = [v11 zoneRowID];
              int v21 = [v9 lastError];
              *(_DWORD *)buf = 138413058;
              v23 = v19;
              __int16 v24 = 2112;
              int v25 = v20;
              __int16 v26 = 2112;
              v27 = v21;
              __int16 v28 = 2112;
              int v29 = v17;
              _os_log_impl(&dword_23FA42000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed inserting to fpfs_folders_not_migrated with %@, %@. Error: %@%@", buf, 0x2Au);
            }
          }
        }
      }
    }
  }
}

- (id)_parseImportBookmark:(id)a3 templateItem:(id)a4 fileURL:(id)a5 ignoreImportBookmark:(BOOL *)a6
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v45 = a5;
  id v12 = [v10 mangledID];
  char v13 = [v10 itemID];
  id v14 = [(BRCAccountSessionFPFS *)self->_session clientZoneByMangledID:v12];
  if (![v10 isTrashBookmark])
  {
    id v24 = [v14 itemByItemID:v13];
    if (!v24)
    {
      brc_bread_crumbs();
      int v35 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      v36 = brc_default_log();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = [v13 debugItemIDString];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v37;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v12;
        *(_WORD *)&buf[22] = 2112;
        v50 = v35;
        _os_log_impl(&dword_23FA42000, v36, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't find item by bookmark data %@ (%@)%@", buf, 0x20u);
      }
      goto LABEL_31;
    }
    int v25 = brc_bread_crumbs();
    __int16 v26 = brc_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSImporter _parseImportBookmark:templateItem:fileURL:ignoreImportBookmark:]();
    }

    if ((itemsHaveTheSameKind(v24, v11) & 1) == 0)
    {
      char v41 = brc_bread_crumbs();
      v42 = brc_default_log();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v41;
        _os_log_impl(&dword_23FA42000, v42, OS_LOG_TYPE_DEFAULT, "[WARNING] The existing shared item doesn't have the right kind%@", buf, 0xCu);
      }

      if (a6)
      {
        long long v19 = 0;
        v40 = 0;
        *a6 = 1;
        goto LABEL_41;
      }
LABEL_32:
      long long v19 = 0;
      v40 = 0;
      goto LABEL_41;
    }
    if ([v24 isDocument])
    {
      v44 = [v24 asDocument];
      v27 = [v44 currentVersion];
      if ([v27 size] <= 0)
      {

LABEL_38:
        goto LABEL_39;
      }
      __int16 v28 = [v11 documentSize];
      BOOL v29 = [v28 longLongValue] == 0;

      if (v29)
      {
        uint64_t v30 = [MEMORY[0x263F08850] defaultManager];
        v44 = [v30 enumeratorAtURL:v45 includingPropertiesForKeys:0 options:0 errorHandler:0];

        uint64_t v31 = [v44 nextObject];
        BOOL v32 = v31 == 0;

        if (v32)
        {
          brc_bread_crumbs();
          v33 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
          int v34 = brc_default_log();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412802;
            *(void *)&uint8_t buf[4] = v11;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v24;
            *(_WORD *)&buf[22] = 2112;
            v50 = v33;
            _os_log_fault_impl(&dword_23FA42000, v34, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: can't match an empty shared package %@ to the existing shared package item %@%@", buf, 0x20u);
          }

          if (a6) {
            *a6 = 1;
          }

          goto LABEL_32;
        }
        goto LABEL_38;
      }
    }
LABEL_39:
    long long v19 = 0;
    goto LABEL_40;
  }
  if (([v14 isPrivateZone] & 1) == 0)
  {
    int v15 = brc_bread_crumbs();
    int v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v15;
      _os_log_impl(&dword_23FA42000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't find zone for trash putback %@, falling back to clouddocs zone%@", buf, 0x16u);
    }

    uint64_t v17 = [(BRCAccountSessionFPFS *)self->_session cloudDocsClientZone];

    id v14 = (void *)v17;
  }
  long long v18 = [v14 itemByItemID:v13];
  long long v19 = [v18 asDirectory];

  if (([v19 isInTrashScope] & 1) == 0)
  {
    long long v20 = brc_bread_crumbs();
    int v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v20;
      _os_log_impl(&dword_23FA42000, v21, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't find trash parent for %@, falling back to one at the zone root%@", buf, 0x16u);
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v50 = __Block_byref_object_copy__23;
    __int16 v51 = __Block_byref_object_dispose__23;
    id v52 = 0;
    uint64_t v22 = [v14 db];
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __80__BRCFSImporter__parseImportBookmark_templateItem_fileURL_ignoreImportBookmark___block_invoke;
    v46[3] = &unk_265082628;
    v48 = buf;
    v46[4] = self;
    id v47 = v14;
    [v22 groupInBatch:v46];

    id v23 = *(id *)(*(void *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);

    long long v19 = v23;
  }
  if (!v19)
  {
    int v38 = brc_bread_crumbs();
    v39 = brc_default_log();
    if (os_log_type_enabled(v39, (os_log_type_t)0x90u)) {
      -[BRCFSImporter _parseImportBookmark:templateItem:fileURL:ignoreImportBookmark:]();
    }

LABEL_31:
    id v24 = 0;
    goto LABEL_32;
  }
  id v24 = 0;
LABEL_40:
  [v24 markDoneMigratingToFPFS];
  id v24 = v24;
  v40 = v24;
LABEL_41:

  return v40;
}

void __80__BRCFSImporter__parseImportBookmark_templateItem_fileURL_ignoreImportBookmark___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) asPrivateClientZone];
  v4 = [v3 defaultAppLibrary];
  id v12 = 0;
  id v5 = [v2 getOrCreateTrashItemInAppLibrary:v4 error:&v12];
  id v6 = v12;
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  int v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    char v9 = brc_bread_crumbs();
    id v10 = brc_default_log();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
    {
      id v11 = v6;
      if (!v6)
      {
        id v5 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) db];
        id v11 = [v5 lastError];
      }
      *(_DWORD *)buf = 138412546;
      id v14 = v11;
      __int16 v15 = 2112;
      int v16 = v9;
      _os_log_error_impl(&dword_23FA42000, v10, (os_log_type_t)0x90u, "[ERROR] Can't create trash item - %@%@", buf, 0x16u);
      if (!v6)
      {
      }
    }
  }
}

- (id)_locateTemplateItemFromFPFSMigration:(id)a3 fields:(unint64_t *)a4 documentHasChanges:(BOOL *)a5
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (a5) {
    *a5 = 0;
  }
  if ([(BRCAccountSessionFPFS *)self->_session fpfsMigrationState] != 1)
  {
    id v12 = 0;
    goto LABEL_53;
  }
  int v8 = [v7 extendedAttributes];
  char v9 = [v8 objectForKeyedSubscript:@"com.apple.fpfs.fileid"];

  __int16 v43 = 0;
  int v42 = 0;
  uint64_t v41 = 0;
  if (!v9 || ![v9 getFileIDFromXattr:&v43 docID:&v42 genCount:&v41]) {
    goto LABEL_51;
  }
  id v10 = brc_bread_crumbs();
  id v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218754;
    uint64_t v45 = (uint64_t)v43;
    __int16 v46 = 1024;
    *(_DWORD *)id v47 = v42;
    *(_WORD *)&v47[4] = 2048;
    *(void *)&v47[6] = v41;
    *(_WORD *)&v47[14] = 2112;
    *(void *)&v47[16] = v10;
    _os_log_impl(&dword_23FA42000, v11, OS_LOG_TYPE_INFO, "[INFO] trying to import from on-disk ID: fileID=%llu docID=%u genCount=%llu%@", buf, 0x26u);
  }

  if (!v42)
  {
    id v12 = 0;
    goto LABEL_41;
  }
  id v12 = -[BRCFSImporter _globalItemByDocumentID:](self, "_globalItemByDocumentID:");
  uint64_t v13 = [v12 asDocument];
  id v14 = (void *)v13;
  if (v12)
  {
    if ((itemsHaveTheSameKind(v12, v7) & 1) == 0)
    {
      __int16 v15 = brc_bread_crumbs();
      int v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v45 = (uint64_t)v12;
        __int16 v46 = 2112;
        *(void *)id v47 = v15;
        _os_log_impl(&dword_23FA42000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] Mismatching type for the found item (%@), ignoring!%@", buf, 0x16u);
      }
      goto LABEL_25;
    }
    if (!v14)
    {
      __int16 v15 = brc_bread_crumbs();
      int v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[BRCFSImporter _locateTemplateItemFromFPFSMigration:fields:documentHasChanges:]();
      }
LABEL_25:

      goto LABEL_26;
    }
LABEL_17:
    uint64_t v17 = brc_bread_crumbs();
    long long v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSImporter _locateTemplateItemFromFPFSMigration:fields:documentHasChanges:]();
    }

    long long v19 = [v14 fileIDForUpload];
    uint64_t v20 = [v19 longLongValue];

    int v21 = [v14 generationIDForUpload];
    uint64_t v22 = [v21 fsGenerationID];
    uint64_t v23 = [v22 unsignedLongLongValue];

    if ((void *)v20 == v43)
    {
      if ([v14 isPackage])
      {
        uint64_t v40 = v23;
        id v24 = [v7 contentModificationDate];
        [v24 timeIntervalSince1970];
        uint64_t v26 = (uint64_t)v25;

        v27 = [v14 currentVersion];
        uint64_t v28 = [v27 mtime];

        if (v28 == v26)
        {
          BOOL v29 = 0;
        }
        else
        {
          v39 = brc_bread_crumbs();
          uint64_t v30 = brc_default_log();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218498;
            uint64_t v45 = v26;
            __int16 v46 = 2048;
            *(void *)id v47 = v28;
            *(_WORD *)&v47[8] = 2112;
            *(void *)&v47[10] = v39;
            _os_log_debug_impl(&dword_23FA42000, v30, OS_LOG_TYPE_DEBUG, "[DEBUG] mtimes don't match %lld vs %lld%@", buf, 0x20u);
          }

          BOOL v29 = 1;
        }
        uint64_t v23 = v40;
      }
      else
      {
        BOOL v29 = v23 != v41;
      }
    }
    else
    {
      BOOL v29 = 1;
    }
    if (a5) {
      *a5 = v29;
    }
    if (v29)
    {
      uint64_t v31 = brc_bread_crumbs();
      BOOL v32 = brc_default_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134219010;
        uint64_t v45 = v20;
        __int16 v46 = 2048;
        *(void *)id v47 = v43;
        *(_WORD *)&v47[8] = 2048;
        *(void *)&v47[10] = v23;
        *(_WORD *)&v47[18] = 2048;
        *(void *)&v47[20] = v41;
        __int16 v48 = 2112;
        __int16 v49 = v31;
        _os_log_debug_impl(&dword_23FA42000, v32, OS_LOG_TYPE_DEBUG, "[DEBUG] We have changes to upload on imported item f:(%llu vs %llu) g:(%llu vs %llu)%@", buf, 0x34u);
      }
    }
    [v14 markDoneMigratingToFPFS];
    goto LABEL_40;
  }
  if (v13) {
    goto LABEL_17;
  }
LABEL_26:
  id v12 = 0;
LABEL_40:

LABEL_41:
  if (v12) {
    goto LABEL_52;
  }
  if (!v43) {
    goto LABEL_52;
  }
  v33 = -[BRCFSImporter _globalItemByFileID:](self, "_globalItemByFileID:");
  id v12 = v33;
  if (!v33) {
    goto LABEL_52;
  }
  if (itemsHaveTheSameKind(v33, v7))
  {
    int v34 = brc_bread_crumbs();
    int v35 = brc_default_log();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSImporter _locateTemplateItemFromFPFSMigration:fields:documentHasChanges:]();
    }

    [v12 markDoneMigratingToFPFS];
    goto LABEL_52;
  }
  v36 = brc_bread_crumbs();
  v37 = brc_default_log();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v45 = (uint64_t)v12;
    __int16 v46 = 2112;
    *(void *)id v47 = v36;
    _os_log_impl(&dword_23FA42000, v37, OS_LOG_TYPE_DEFAULT, "[WARNING] Mismatching type for the found item (%@), ignoring!%@", buf, 0x16u);
  }

LABEL_51:
  id v12 = 0;
LABEL_52:

LABEL_53:
  return v12;
}

- (id)_findCollidingItemWithTemplateItem:(id)a3 parentItem:(id)a4 logicalName:(id)a5 error:(id *)a6
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [v10 parentItemIdentifier];
  int v14 = [v13 isEqualToString:*MEMORY[0x263F053F8]];

  __int16 v15 = [v11 itemID];
  if (v14)
  {
    uint64_t v40 = 0;
    uint64_t v41 = &v40;
    uint64_t v42 = 0x3032000000;
    __int16 v43 = __Block_byref_object_copy__23;
    v44 = __Block_byref_object_dispose__23;
    id v45 = 0;
    uint64_t v34 = 0;
    int v35 = &v34;
    uint64_t v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__23;
    int v38 = __Block_byref_object_dispose__23;
    id v39 = 0;
    int v16 = [v11 appLibrary];
    uint64_t v17 = [v16 db];
    uint64_t v26 = MEMORY[0x263EF8330];
    uint64_t v27 = 3221225472;
    uint64_t v28 = __81__BRCFSImporter__findCollidingItemWithTemplateItem_parentItem_logicalName_error___block_invoke;
    BOOL v29 = &unk_265082650;
    BOOL v32 = &v34;
    uint64_t v30 = self;
    id v31 = v11;
    v33 = &v40;
    [v17 groupInBatch:&v26];

    long long v18 = (void *)v41[5];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = brc_bread_crumbs();
      int v21 = brc_default_log();
      if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
      {
        double v25 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        id v47 = "-[BRCFSImporter _findCollidingItemWithTemplateItem:parentItem:logicalName:error:]";
        __int16 v48 = 2080;
        if (!a6) {
          double v25 = "(ignored by caller)";
        }
        __int16 v49 = v25;
        __int16 v50 = 2112;
        id v51 = v19;
        __int16 v52 = 2112;
        uint64_t v53 = v20;
        _os_log_error_impl(&dword_23FA42000, v21, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

      if (a6) {
        *a6 = v19;
      }
    }
    else
    {
      objc_msgSend((id)v35[5], "itemID", v26, v27, v28, v29, v30);
      __int16 v15 = v19 = v15;
    }

    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(&v40, 8);

    if (v18) {
      goto LABEL_10;
    }
  }
  if (!v15)
  {
LABEL_10:
    uint64_t v23 = 0;
  }
  else
  {
    uint64_t v22 = [v11 clientZone];
    uint64_t v23 = [v22 liveItemByParentID:v15 andLogicalName:v12 excludingItemID:0];
  }
  return v23;
}

void __81__BRCFSImporter__findCollidingItemWithTemplateItem_parentItem_logicalName_error___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = *(void **)(a1 + 32);
  v4 = [*(id *)(a1 + 40) appLibrary];
  id v13 = 0;
  uint64_t v5 = [v3 getOrCreateTrashItemInAppLibrary:v4 error:&v13];
  id v6 = v13;
  id v7 = v13;
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  char v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v10 = brc_bread_crumbs();
    id v11 = brc_default_log();
    if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
    {
      id v12 = v7;
      if (!v7)
      {
        v1 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) db];
        id v12 = [v1 lastError];
      }
      *(_DWORD *)buf = 138412546;
      __int16 v15 = v12;
      __int16 v16 = 2112;
      uint64_t v17 = v10;
      _os_log_error_impl(&dword_23FA42000, v11, (os_log_type_t)0x90u, "[ERROR] Can't create trash item - %@%@", buf, 0x16u);
      if (!v7)
      {
      }
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v6);
  }
}

- (id)_handleCollisionIfNecessaryWithTemplateItem:(id)a3 parentItem:(id)a4 logicalName:(id)a5 fileURL:(id)a6 options:(unint64_t)a7 error:(id *)a8
{
  char v9 = a7;
  uint64_t v74 = *MEMORY[0x263EF8340];
  int v14 = a3;
  id v15 = a6;
  __int16 v16 = [(BRCFSImporter *)self _findCollidingItemWithTemplateItem:v14 parentItem:a4 logicalName:a5 error:a8];
  if (!v16) {
    goto LABEL_57;
  }
  if (v15)
  {
    char v17 = 0;
    if (v9) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v18 = [v14 contentType];
    char v17 = objc_msgSend(v18, "br_isDocumentType");

    if (v9)
    {
LABEL_9:
      int v19 = 0;
      goto LABEL_10;
    }
  }
  if (([v16 isInDataScope] & 1) != 0
    || ![v16 isUserVisible]
    || [(BRCFSImporter *)self _isDesktopOrDocumentsItem:v16])
  {
    goto LABEL_9;
  }
  uint64_t v54 = [v16 itemID];
  if ([v54 isDocumentsFolder])
  {
    v65 = v54;
    int v19 = 1;
LABEL_10:
    uint64_t v20 = v16;
    int v21 = v14;
    id v66 = v15;
    uint64_t v22 = [v21 parentItemIdentifier];
    if ([v22 isEqualToString:*MEMORY[0x263F053F8]])
    {
      char v23 = [v20 isInTrashScope];

      if ((v23 & 1) == 0)
      {
        v67 = brc_bread_crumbs();
        id v24 = brc_default_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          v69 = v21;
          __int16 v70 = 2112;
          v71 = v20;
          __int16 v72 = 2112;
          v73 = v67;
          double v25 = "[DEBUG] template item %@ differs in trash-ness from %@%@";
LABEL_20:
          _os_log_debug_impl(&dword_23FA42000, v24, OS_LOG_TYPE_DEBUG, v25, buf, 0x20u);
          goto LABEL_29;
        }
        goto LABEL_29;
      }
    }
    else
    {
    }
    if (itemsHaveTheSameKind(v20, v21))
    {
      uint64_t v26 = [v21 extendedAttributes];
      uint64_t v27 = [v26 objectForKeyedSubscript:@"com.apple.clouddocs.private.share-bookmark#B"];
      uint64_t v28 = v27;
      if (v27)
      {
        v67 = v27;
      }
      else
      {
        [v21 extendedAttributes];
        v63 = v14;
        int v29 = v19;
        id v30 = v15;
        id v31 = self;
        v33 = char v32 = v17;
        v67 = [v33 objectForKeyedSubscript:@"com.apple.finder.copy.preserveinbackups.com.apple.clouddocs.private.share-bookmark#N"];

        char v17 = v32;
        self = v31;
        id v15 = v30;
        int v19 = v29;
        int v14 = v63;
      }

      if ((![v20 isSharedToMeTopLevelItem] || v67)
        && (([v20 isSharedToMe] & 1) != 0 || !v67))
      {
        if (![v20 isDocument])
        {
          int v35 = 1;
LABEL_31:

          if (v19)
          {

            if ((v35 & 1) == 0) {
              goto LABEL_33;
            }
          }
          else if (!v35)
          {
LABEL_33:
            if (v17) {
              goto LABEL_57;
            }
            goto LABEL_34;
          }
          __int16 v43 = brc_bread_crumbs();
          v44 = brc_default_log();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v69 = v20;
            __int16 v70 = 2112;
            v71 = v43;
            _os_log_impl(&dword_23FA42000, v44, OS_LOG_TYPE_INFO, "[INFO] found item that seems to match template: %@%@", buf, 0x16u);
          }

          [v20 markDoneMigratingToFPFS];
          uint64_t v42 = v20;
          goto LABEL_43;
        }
        id v24 = [v20 asDocument];
        int v46 = [v24 isPackage];
        int v35 = 1;
        if (!v66 || !v46)
        {
LABEL_30:

          goto LABEL_31;
        }
        id v47 = [v21 documentSize];
        if ([v47 longLongValue])
        {
        }
        else
        {
          char v64 = v17;
          v55 = [v24 currentVersion];
          uint64_t v61 = [v55 size];

          if (!v61)
          {
            int v35 = 1;
            char v17 = v64;
            goto LABEL_30;
          }
          v56 = [MEMORY[0x263F08850] defaultManager];
          v57 = [v56 enumeratorAtURL:v66 includingPropertiesForKeys:0 options:0 errorHandler:0];

          v62 = v57;
          v58 = [v57 nextObject];

          char v17 = v64;
          if (!v58)
          {
            v60 = brc_bread_crumbs();
            v59 = brc_default_log();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412802;
              v69 = v21;
              __int16 v70 = 2112;
              v71 = v24;
              __int16 v72 = 2112;
              v73 = v60;
              _os_log_fault_impl(&dword_23FA42000, v59, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: can't path-match an empty package %@ to the existing package item %@%@", buf, 0x20u);
            }

            goto LABEL_29;
          }
        }
        int v35 = 1;
        goto LABEL_30;
      }
      id v24 = brc_bread_crumbs();
      uint64_t v34 = brc_default_log();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v69 = v21;
        __int16 v70 = 2112;
        v71 = v20;
        __int16 v72 = 2112;
        v73 = v24;
        _os_log_debug_impl(&dword_23FA42000, v34, OS_LOG_TYPE_DEBUG, "[DEBUG] template item %@ differs in share-bookmark from %@%@", buf, 0x20u);
      }
    }
    else
    {
      v67 = brc_bread_crumbs();
      id v24 = brc_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v69 = v21;
        __int16 v70 = 2112;
        v71 = v20;
        __int16 v72 = 2112;
        v73 = v67;
        double v25 = "[DEBUG] template item %@ differs in kind from %@%@";
        goto LABEL_20;
      }
    }
LABEL_29:
    int v35 = 0;
    goto LABEL_30;
  }

  if (v17) {
    goto LABEL_57;
  }
LABEL_34:
  uint64_t v36 = [v16 st];
  v37 = [v36 fpCreationItemIdentifier];
  int v38 = [v14 itemIdentifier];
  int v39 = [v37 isEqualToString:v38];

  if (v39)
  {
    if (itemsHaveTheSameKind(v16, v14))
    {
      uint64_t v40 = brc_bread_crumbs();
      uint64_t v41 = brc_default_log();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
        -[BRCFSImporter _handleCollisionIfNecessaryWithTemplateItem:parentItem:logicalName:fileURL:options:error:]();
      }

      uint64_t v42 = v16;
LABEL_43:
      id v45 = v42;
      goto LABEL_58;
    }
    __int16 v48 = brc_bread_crumbs();
    __int16 v49 = brc_default_log();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      v69 = v16;
      __int16 v70 = 2112;
      v71 = v14;
      __int16 v72 = 2112;
      v73 = v48;
      _os_log_fault_impl(&dword_23FA42000, v49, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Items have the same creation identifier but are of differnt kinds %@ vs %@%@", buf, 0x20u);
    }
  }
  __int16 v50 = brc_bread_crumbs();
  id v51 = brc_default_log();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v69 = v16;
    __int16 v70 = 2112;
    v71 = v14;
    __int16 v72 = 2112;
    v73 = v50;
    _os_log_impl(&dword_23FA42000, v51, OS_LOG_TYPE_INFO, "[INFO] Bouncing item %@ because of %@%@", buf, 0x20u);
  }

  __int16 v52 = [(BRCAccountSessionFPFS *)self->_session bouncingAnalyzer];
  [v52 analyzeBouncingOfItem:v16 withTemplateItem:v14];

  [v16 markBouncedToNextAvailableBounceNumber:504];
  LODWORD(v52) = [v16 isMigratingToFPFS];
  [v16 markDoneMigratingToFPFS];
  [v16 saveToDB];
  if (v52) {
    [(BRCFSImporter *)self _reportBouncingForMigration:v14 existingItem:v16];
  }
LABEL_57:
  id v45 = 0;
LABEL_58:

  return v45;
}

- (id)_locateMatchingItemForTemplateItem:(id)a3 parentItem:(id)a4 options:(unint64_t)a5 fileURL:(id)a6 fields:(unint64_t *)a7 shouldReject:(BOOL *)a8 additionalAttrs:(id)a9 importBookmark:(id)a10 ignoreImportBookmark:(BOOL *)a11 stillPendingFields:(unint64_t *)a12 error:(id *)a13
{
  uint64_t v135 = *MEMORY[0x263EF8340];
  id v19 = a3;
  id v107 = a4;
  id v20 = a6;
  id v105 = a9;
  id v106 = a10;
  uint64_t v121 = 0;
  v122[0] = &v121;
  v122[1] = 0x3032000000;
  v122[2] = __Block_byref_object_copy__23;
  v122[3] = __Block_byref_object_dispose__23;
  id v123 = 0;
  char v120 = 0;
  v108 = [v19 filename];
  if ((a5 & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t v21 = [(BRCFSImporter *)self _locateTemplateItemFromFPFSMigration:v19 fields:a7 documentHasChanges:&v120];
  uint64_t v22 = *(void **)(v122[0] + 40);
  *(void *)(v122[0] + 40) = v21;

  uint64_t v23 = *(void *)(v122[0] + 40);
  BOOL v24 = v23 != 0;
  if (v106 && !v23)
  {
    uint64_t v25 = [(BRCFSImporter *)self _parseImportBookmark:v106 templateItem:v19 fileURL:v20 ignoreImportBookmark:a11];
    uint64_t v26 = *(void **)(v122[0] + 40);
    *(void *)(v122[0] + 40) = v25;

LABEL_5:
    BOOL v24 = 0;
  }
  BOOL v104 = v24;
  uint64_t v27 = *(void **)(v122[0] + 40);
  if (v27 && (itemsHaveTheSameKind(v27, v19) & 1) == 0)
  {
    brc_bread_crumbs();
    uint64_t v28 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    int v29 = brc_default_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
    {
      uint64_t v97 = *(void *)(v122[0] + 40);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v97;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v19;
      *(_WORD *)&buf[22] = 2112;
      v133 = v28;
      _os_log_fault_impl(&dword_23FA42000, v29, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Items dont have the same kind so can't be matched! %@ vs %@%@", buf, 0x20u);
    }

    id v30 = *(void **)(v122[0] + 40);
    *(void *)(v122[0] + 40) = 0;
  }
  int v31 = 0;
  *a8 = 0;
  if (!v20)
  {
    char v32 = [v19 contentType];
    if (objc_msgSend(v32, "br_isDocumentType"))
    {
      int v31 = 1;
    }
    else
    {
      v33 = [v19 contentType];
      int v31 = objc_msgSend(v33, "br_isAliasFileType");
    }
    if ((((a5 & 1) == 0) & v31) == 1)
    {
      v102 = brc_bread_crumbs();
      v103 = brc_default_log();
      if (os_log_type_enabled(v103, OS_LOG_TYPE_FAULT)) {
        -[BRCFSImporter _locateMatchingItemForTemplateItem:parentItem:options:fileURL:fields:shouldReject:additionalAttrs:importBookmark:ignoreImportBookmark:stillPendingFields:error:].cold.4();
      }

      int v31 = 1;
    }
  }
  char v119 = 0;
  if ([(BRCFSImporter *)self _shouldRejectItemWithName:v108 templateItem:v19 existingItem:*(void *)(v122[0] + 40) options:a5 shouldRemoveItemFromDrive:&v119])
  {
    *a8 = 1;
    uint64_t v34 = *(void **)(v122[0] + 40);
    if (v34 && v119)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v133 = __Block_byref_object_copy__23;
      *(void *)&long long v134 = __Block_byref_object_dispose__23;
      *((void *)&v134 + 1) = 0;
      int v35 = [v34 db];
      v118[0] = MEMORY[0x263EF8330];
      v118[1] = 3221225472;
      v118[2] = __176__BRCFSImporter__locateMatchingItemForTemplateItem_parentItem_options_fileURL_fields_shouldReject_additionalAttrs_importBookmark_ignoreImportBookmark_stillPendingFields_error___block_invoke;
      v118[3] = &unk_265082678;
      v118[5] = &v121;
      v118[6] = buf;
      v118[4] = self;
      [v35 groupInBatch:v118];

      uint64_t v36 = *(void **)(*(void *)&buf[8] + 40);
      if (v36)
      {
        id v37 = v36;
        int v38 = brc_bread_crumbs();
        int v39 = brc_default_log();
        if (os_log_type_enabled(v39, (os_log_type_t)0x90u))
        {
          v98 = "(passed to caller)";
          *(_DWORD *)v124 = 136315906;
          v125 = "-[BRCFSImporter _locateMatchingItemForTemplateItem:parentItem:options:fileURL:fields:shouldReject:addit"
                 "ionalAttrs:importBookmark:ignoreImportBookmark:stillPendingFields:error:]";
          __int16 v126 = 2080;
          if (!a13) {
            v98 = "(ignored by caller)";
          }
          v127 = v98;
          __int16 v128 = 2112;
          id v129 = v37;
          __int16 v130 = 2112;
          v131 = v38;
          _os_log_error_impl(&dword_23FA42000, v39, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", v124, 0x2Au);
        }

        if (a13) {
          *a13 = v37;
        }
      }
      _Block_object_dispose(buf, 8);
    }
    else if (v34 && ([v34 saveToDB] & 1) == 0)
    {
      v57 = [(BRCAccountSessionFPFS *)self->_session clientDB];
      v58 = [v57 lastError];

      if (v58)
      {
        v59 = brc_bread_crumbs();
        v60 = brc_default_log();
        if (os_log_type_enabled(v60, (os_log_type_t)0x90u))
        {
          v101 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          *(void *)&uint8_t buf[4] = "-[BRCFSImporter _locateMatchingItemForTemplateItem:parentItem:options:fileURL:fields:shou"
                               "ldReject:additionalAttrs:importBookmark:ignoreImportBookmark:stillPendingFields:error:]";
          *(_WORD *)&buf[12] = 2080;
          if (!a13) {
            v101 = "(ignored by caller)";
          }
          *(void *)&buf[14] = v101;
          *(_WORD *)&buf[22] = 2112;
          v133 = v58;
          LOWORD(v134) = 2112;
          *(void *)((char *)&v134 + 2) = v59;
          _os_log_error_impl(&dword_23FA42000, v60, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }
      }
      if (a13) {
        *a13 = v58;
      }
    }
    goto LABEL_93;
  }
  uint64_t v40 = v122[0];
  uint64_t v41 = *(void **)(v122[0] + 40);
  if (v41) {
    goto LABEL_32;
  }
  uint64_t v42 = [(BRCFSImporter *)self _handleCollisionIfNecessaryWithTemplateItem:v19 parentItem:v107 logicalName:v108 fileURL:v20 options:a5 error:a13];
  __int16 v43 = *(void **)(v122[0] + 40);
  *(void *)(v122[0] + 40) = v42;

  v44 = *(void **)(v122[0] + 40);
  if (v44 && (itemsHaveTheSameKind(v44, v19) & 1) == 0)
  {
    brc_bread_crumbs();
    id v45 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    int v46 = brc_default_log();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
    {
      uint64_t v100 = *(void *)(v122[0] + 40);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v100;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v19;
      *(_WORD *)&buf[22] = 2112;
      v133 = v45;
      _os_log_fault_impl(&dword_23FA42000, v46, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Can't match items of different kind! %@ vs %@%@", buf, 0x20u);
    }

    id v47 = *(void **)(v122[0] + 40);
    *(void *)(v122[0] + 40) = 0;
  }
  uint64_t v40 = v122[0];
  uint64_t v41 = *(void **)(v122[0] + 40);
  if (v41)
  {
LABEL_32:
    if (v31)
    {
      *a7 &= ~1uLL;
      uint64_t v41 = *(void **)(v40 + 40);
    }
    int v48 = [v41 syncUpState];
    if (!v20 && v48 == 7)
    {
      __int16 v49 = [*(id *)(v122[0] + 40) clientZone];
      __int16 v50 = [*(id *)(v122[0] + 40) itemID];
      id v51 = [v49 serverItemByItemID:v50];

      __int16 v52 = brc_bread_crumbs();
      uint64_t v53 = brc_default_log();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v51;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v52;
        _os_log_impl(&dword_23FA42000, v53, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't find file id for %@.  Updating from server item because we have no way to get its content%@", buf, 0x16u);
      }

      uint64_t v54 = objc_msgSend(v51, "newLocalItemWithDBRowID:", objc_msgSend(*(id *)(v122[0] + 40), "dbRowID"));
      v55 = *(void **)(v122[0] + 40);
      *(void *)(v122[0] + 40) = v54;
    }
    if ([*(id *)(v122[0] + 40) syncUpState]) {
      int v56 = [*(id *)(v122[0] + 40) isMigratingToFPFS];
    }
    else {
      int v56 = 1;
    }
    if ([*(id *)(v122[0] + 40) isDocument] & v56) == 1 && (*(unsigned char *)a7)
    {
      uint64_t v61 = [*(id *)(v122[0] + 40) asDocument];
      v62 = [v61 currentVersion];
      uint64_t v63 = [v62 mtime];
      char v64 = [v19 contentModificationDate];
      [v64 timeIntervalSince1970];
      double v66 = v65;

      v67 = [v61 currentVersion];
      v68 = [v67 versionSignature];
      char v69 = [v68 isPendingSignature];

      uint64_t v70 = [v61 localDiffs];
      if (trunc(v66) == (double)v63 && v120 == 0) {
        char v72 = v69;
      }
      else {
        char v72 = 1;
      }
      if ((v72 & 1) == 0 && (v70 & 0x180000) == 0)
      {
        if ([v61 isPackage]) {
          goto LABEL_62;
        }
        v73 = [v61 currentVersion];
        uint64_t v74 = [v73 size];
        v75 = [v19 documentSize];
        LODWORD(v74) = v74 == [v75 longLongValue];

        if (v74)
        {
LABEL_62:
          v76 = brc_bread_crumbs();
          v77 = brc_default_log();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG)) {
            -[BRCFSImporter _locateMatchingItemForTemplateItem:parentItem:options:fileURL:fields:shouldReject:additionalAttrs:importBookmark:ignoreImportBookmark:stillPendingFields:error:]();
          }

          *a7 &= ~1uLL;
        }
      }
    }
    if ([v107 isSharedToMe] && (objc_msgSend(v107, "sharingOptions") & 0x20) != 0)
    {
      v87 = brc_bread_crumbs();
      v88 = brc_default_log();
      if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v87;
        _os_log_impl(&dword_23FA42000, v88, OS_LOG_TYPE_DEFAULT, "[WARNING] This isn't implemented yet in FPFS%@", buf, 0xCu);
      }

      v89 = brc_bread_crumbs();
      v90 = brc_default_log();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG)) {
        -[BRCFSImporter _locateMatchingItemForTemplateItem:parentItem:options:fileURL:fields:shouldReject:additionalAttrs:importBookmark:ignoreImportBookmark:stillPendingFields:error:]((uint64_t)v122);
      }

      [*(id *)(v122[0] + 40) saveToDB];
      if ((a5 & 1) == 0)
      {
        v91 = brc_bread_crumbs();
        v92 = brc_default_log();
        if (os_log_type_enabled(v92, OS_LOG_TYPE_FAULT)) {
          -[BRCFSImporter _locateMatchingItemForTemplateItem:parentItem:options:fileURL:fields:shouldReject:additionalAttrs:importBookmark:ignoreImportBookmark:stillPendingFields:error:]((uint64_t)v122);
        }
      }
    }
    else
    {
      v78 = *(void **)(v122[0] + 40);
      if (!v78)
      {
LABEL_88:
        id v93 = v78;
        goto LABEL_94;
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v133 = __Block_byref_object_copy__23;
      *(void *)&long long v134 = __Block_byref_object_dispose__23;
      *((void *)&v134 + 1) = 0;
      v79 = [(BRCAccountSessionFPFS *)self->_session clientDB];
      v109[0] = MEMORY[0x263EF8330];
      v109[1] = 3221225472;
      v109[2] = __176__BRCFSImporter__locateMatchingItemForTemplateItem_parentItem_options_fileURL_fields_shouldReject_additionalAttrs_importBookmark_ignoreImportBookmark_stillPendingFields_error___block_invoke_44;
      v109[3] = &unk_2650826A0;
      v109[4] = self;
      v113 = &v121;
      v115 = a7;
      id v80 = v19;
      id v110 = v80;
      id v111 = v20;
      BOOL v117 = v104;
      v116 = a12;
      id v112 = v105;
      v114 = buf;
      [v79 groupInTransaction:v109];

      id v81 = *(id *)(*(void *)&buf[8] + 40);
      if (v81)
      {
        v82 = brc_bread_crumbs();
        v83 = brc_default_log();
        if (os_log_type_enabled(v83, (os_log_type_t)0x90u))
        {
          v99 = "(passed to caller)";
          *(_DWORD *)v124 = 136315906;
          v125 = "-[BRCFSImporter _locateMatchingItemForTemplateItem:parentItem:options:fileURL:fields:shouldReject:addit"
                 "ionalAttrs:importBookmark:ignoreImportBookmark:stillPendingFields:error:]";
          __int16 v126 = 2080;
          if (!a13) {
            v99 = "(ignored by caller)";
          }
          v127 = v99;
          __int16 v128 = 2112;
          id v129 = v81;
          __int16 v130 = 2112;
          v131 = v82;
          _os_log_error_impl(&dword_23FA42000, v83, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", v124, 0x2Au);
        }
      }
      if (a13) {
        *a13 = v81;
      }

      if ((a5 & 1) == 0)
      {
        v84 = brc_bread_crumbs();
        v85 = brc_default_log();
        if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
        {
          v86 = *(const char **)(v122[0] + 40);
          *(_DWORD *)v124 = 138412802;
          v125 = v86;
          __int16 v126 = 2112;
          v127 = (const char *)v80;
          __int16 v128 = 2112;
          id v129 = v84;
          _os_log_impl(&dword_23FA42000, v85, OS_LOG_TYPE_DEFAULT, "[WARNING] Merging existing item without may already exist flag %@ with template %@%@", v124, 0x20u);
        }
      }
      _Block_object_dispose(buf, 8);
    }
    v78 = *(void **)(v122[0] + 40);
    goto LABEL_88;
  }
  if (!v31)
  {
LABEL_93:
    id v93 = 0;
    goto LABEL_94;
  }
  v94 = brc_bread_crumbs();
  v95 = brc_default_log();
  if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v94;
    _os_log_impl(&dword_23FA42000, v95, OS_LOG_TYPE_DEFAULT, "[WARNING] Rejecting dataless item which doesn't exist in our db%@", buf, 0xCu);
  }

  id v93 = 0;
  *a8 = 1;
LABEL_94:

  _Block_object_dispose(&v121, 8);
  return v93;
}

void __176__BRCFSImporter__locateMatchingItemForTemplateItem_parentItem_options_fileURL_fields_shouldReject_additionalAttrs_importBookmark_ignoreImportBookmark_stillPendingFields_error___block_invoke(void *a1)
{
  [*(id *)(*(void *)(a1[5] + 8) + 40) markRemovedFromFilesystemRecursively:1];
  if (([*(id *)(*(void *)(a1[5] + 8) + 40) saveToDB] & 1) == 0)
  {
    id v5 = [*(id *)(a1[4] + 8) clientDB];
    uint64_t v2 = [v5 lastError];
    uint64_t v3 = *(void *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
}

uint64_t __176__BRCFSImporter__locateMatchingItemForTemplateItem_parentItem_options_fileURL_fields_shouldReject_additionalAttrs_importBookmark_ignoreImportBookmark_stillPendingFields_error___block_invoke_44(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  uint64_t v4 = *(void *)(a1 + 88);
  uint64_t v5 = **(void **)(a1 + 80);
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  BOOL v10 = *(unsigned char *)(a1 + 96) == 0;
  uint64_t v11 = *(void *)(v2 + 8);
  id obj = *(id *)(v11 + 40);
  LOBYTE(v16) = v10;
  uint64_t v12 = [v6 changeItem:v3 baseVersion:0 changedFields:v5 newValues:v7 contents:v8 additionalAttrs:v9 clearCKInfoOnSyncUp:v16 stillPendingFields:v4 error:&obj];
  objc_storeStrong((id *)(v11 + 40), obj);
  if ((v12 & 1) == 0)
  {
    uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
    int v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = 0;
  }
  return v12;
}

- (id)_createAndInsertNewItemWithImportObject:(id)a3 parentItem:(id)a4 fields:(unint64_t)a5 templateItem:(id)a6 fileURL:(id)a7 options:(unint64_t)a8 additionalAttrs:(id)a9 importBookmark:(id)a10 stillPendingFields:(unint64_t *)a11 error:(id *)a12
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v36 = a4;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  id v21 = a10;
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__23;
  uint64_t v61 = __Block_byref_object_dispose__23;
  id v62 = 0;
  uint64_t v51 = 0;
  __int16 v52 = &v51;
  uint64_t v53 = 0x3032000000;
  uint64_t v54 = __Block_byref_object_copy__23;
  v55 = __Block_byref_object_dispose__23;
  id v56 = 0;
  uint64_t v22 = [(BRCAccountSessionFPFS *)self->_session clientDB];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __160__BRCFSImporter__createAndInsertNewItemWithImportObject_parentItem_fields_templateItem_fileURL_options_additionalAttrs_importBookmark_stillPendingFields_error___block_invoke;
  v38[3] = &unk_2650826C8;
  id v23 = v17;
  id v39 = v23;
  uint64_t v40 = self;
  int v46 = &v57;
  unint64_t v48 = a5;
  id v24 = v18;
  id v41 = v24;
  id v25 = v19;
  id v42 = v25;
  id v26 = v20;
  __int16 v49 = a11;
  id v43 = v26;
  id v47 = &v51;
  id v27 = v21;
  id v44 = v27;
  id v28 = v36;
  id v45 = v28;
  unint64_t v50 = a8;
  int v29 = [v22 groupInTransaction:v38];

  if ((v29 & 1) == 0)
  {
    id v30 = (id)v52[5];
    if (v30)
    {
      int v31 = brc_bread_crumbs();
      char v32 = brc_default_log();
      if (os_log_type_enabled(v32, (os_log_type_t)0x90u))
      {
        int v35 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        char v64 = "-[BRCFSImporter _createAndInsertNewItemWithImportObject:parentItem:fields:templateItem:fileURL:options:add"
              "itionalAttrs:importBookmark:stillPendingFields:error:]";
        __int16 v65 = 2080;
        if (!a12) {
          int v35 = "(ignored by caller)";
        }
        double v66 = v35;
        __int16 v67 = 2112;
        id v68 = v30;
        __int16 v69 = 2112;
        uint64_t v70 = v31;
        _os_log_error_impl(&dword_23FA42000, v32, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a12) {
      *a12 = v30;
    }
  }
  if (v29) {
    id v33 = (id)v58[5];
  }
  else {
    id v33 = 0;
  }
  _Block_object_dispose(&v51, 8);

  _Block_object_dispose(&v57, 8);
  return v33;
}

uint64_t __160__BRCFSImporter__createAndInsertNewItemWithImportObject_parentItem_fields_templateItem_fileURL_options_additionalAttrs_importBookmark_stillPendingFields_error___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isDocumentsFolder])
  {
    uint64_t v2 = [*(id *)(a1 + 32) appLibrary];
    uint64_t v3 = [v2 documentsFolder];
    uint64_t v4 = *(void *)(*(void *)(a1 + 88) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    if (*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40))
    {
      id v6 = brc_bread_crumbs();
      uint64_t v7 = brc_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        __160__BRCFSImporter__createAndInsertNewItemWithImportObject_parentItem_fields_templateItem_fileURL_options_additionalAttrs_importBookmark_stillPendingFields_error___block_invoke_cold_3();
      }

      uint64_t v8 = brc_bread_crumbs();
      uint64_t v9 = brc_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __160__BRCFSImporter__createAndInsertNewItemWithImportObject_parentItem_fields_templateItem_fileURL_options_additionalAttrs_importBookmark_stillPendingFields_error___block_invoke_cold_2(a1 + 88);
      }

      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
      uint64_t v11 = *(void **)(a1 + 40);
      uint64_t v12 = *(void *)(a1 + 48);
      uint64_t v13 = *(void *)(a1 + 56);
      uint64_t v14 = *(void *)(a1 + 64);
      uint64_t v15 = *(void *)(a1 + 104);
      uint64_t v16 = *(void *)(a1 + 112);
      uint64_t v17 = *(void *)(*(void *)(a1 + 96) + 8);
      id v56 = *(id *)(v17 + 40);
      LOBYTE(v52) = 1;
      uint64_t v18 = [v11 changeItem:v10 baseVersion:0 changedFields:v15 newValues:v12 contents:v13 additionalAttrs:v14 clearCKInfoOnSyncUp:v52 stillPendingFields:v16 error:&v56];
      id v19 = v56;
      id v20 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v19;
LABEL_29:

      return v18;
    }
  }
  uint64_t v22 = *(void *)(a1 + 32);
  id v21 = *(void **)(a1 + 40);
  uint64_t v23 = *(void *)(a1 + 72);
  uint64_t v24 = *(void *)(a1 + 80);
  uint64_t v25 = *(void *)(a1 + 120);
  uint64_t v26 = *(void *)(*(void *)(a1 + 96) + 8);
  id obj = *(id *)(v26 + 40);
  uint64_t v27 = [v21 _createBaseItemWithImportObject:v22 importBookmark:v23 parentItem:v24 options:v25 error:&obj];
  objc_storeStrong((id *)(v26 + 40), obj);
  uint64_t v28 = *(void *)(*(void *)(a1 + 88) + 8);
  int v29 = *(void **)(v28 + 40);
  *(void *)(v28 + 40) = v27;

  if (!*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)) {
    return 0;
  }
  if (*(void *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 40), "_changeBasicFieldsOnItem:fields:template:");
    id v30 = [*(id *)(a1 + 48) parentItemIdentifier];
    if ([v30 isEqualToString:*MEMORY[0x263F053F8]])
    {
      char v31 = [*(id *)(a1 + 80) isInTrashScope];

      if ((v31 & 1) == 0)
      {
        char v32 = *(void **)(a1 + 40);
        uint64_t v33 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
        uint64_t v34 = *(void *)(*(void *)(a1 + 96) + 8);
        id v54 = *(id *)(v34 + 40);
        char v35 = [v32 _trashItem:v33 error:&v54];
        objc_storeStrong((id *)(v34 + 40), v54);
        if ((v35 & 1) == 0) {
          return 0;
        }
      }
    }
    else
    {
    }
  }
  if (![*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) isDirectory]
    || ([*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) asDirectory],
        id v36 = objc_claimAutoreleasedReturnValue(),
        char v37 = [v36 handlePathMatchConflictForDirectoryCreationIfNecessary],
        v36,
        (v37 & 1) == 0))
  {
    [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) markNeedsUploadOrSyncingUp];
    if (([*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) saveToDB] & 1) == 0)
    {
      int v46 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) db];
      uint64_t v47 = [v46 lastError];

      if (v47)
      {
        unint64_t v48 = brc_bread_crumbs();
        __int16 v49 = brc_default_log();
        if (os_log_type_enabled(v49, (os_log_type_t)0x90u)) {
          __160__BRCFSImporter__createAndInsertNewItemWithImportObject_parentItem_fields_templateItem_fileURL_options_additionalAttrs_importBookmark_stillPendingFields_error___block_invoke_cold_1(v47, (uint64_t)v48, v49);
        }
      }
      uint64_t v18 = 0;
      uint64_t v50 = *(void *)(*(void *)(a1 + 96) + 8);
      id v20 = *(void **)(v50 + 40);
      *(void *)(v50 + 40) = v47;
      goto LABEL_29;
    }
  }
  if (!*(void *)(a1 + 56)) {
    goto LABEL_22;
  }
  if (![*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) isDocument]) {
    goto LABEL_22;
  }
  if (![*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) needsUpload]) {
    goto LABEL_22;
  }
  int v38 = [*(id *)(*(void *)(a1 + 40) + 8) stageRegistry];
  uint64_t v39 = *(void *)(a1 + 56);
  uint64_t v40 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) liveStageFilename];
  uint64_t v41 = *(void *)(*(void *)(a1 + 96) + 8);
  id v53 = *(id *)(v41 + 40);
  uint64_t v18 = [v38 moveFromURLToLiveStage:v39 liveStageFilename:v40 error:&v53];
  objc_storeStrong((id *)(v41 + 40), v53);

  if (v18)
  {
LABEL_22:
    if (*(unsigned char *)(a1 + 120)) {
      return 1;
    }
    id v42 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
    id v43 = [*(id *)(a1 + 48) itemIdentifier];
    [v42 updateFPCreationItemIdentifier:v43];

    id v44 = [MEMORY[0x263EFF910] date];
    id v45 = [*(id *)(*(void *)(a1 + 40) + 8) clientState];
    [v45 setObject:v44 forKeyedSubscript:@"most-recent-item-creation-date"];

    id v20 = [*(id *)(*(void *)(a1 + 40) + 8) clientDB];
    [v20 forceBatchStart];
    uint64_t v18 = 1;
    goto LABEL_29;
  }
  return v18;
}

- (id)importAppLibraryRootFromTemplateItem:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F325E0]);
  id v6 = [v4 filename];
  uint64_t v7 = (void *)[v5 initWithMangledString:v6];

  uint64_t v8 = [(BRCAccountSessionFPFS *)self->_session appLibraryByMangledID:v7];
  if (v8)
  {
    brc_bread_crumbs();
    uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v7;
      *(_WORD *)&buf[22] = 2112;
      id v20 = v9;
      _os_log_debug_impl(&dword_23FA42000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] Importing an existing app library %@ with mangledID %@%@", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v8 = [(BRCAccountSessionFPFS *)self->_session getOrCreateAppLibraryAndPrivateZonesIfNecessary:v7];
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v20 = __Block_byref_object_copy__23;
  id v21 = __Block_byref_object_dispose__23;
  id v22 = 0;
  uint64_t v11 = [(BRCAccountSessionFPFS *)self->_session clientTruthWorkloop];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__BRCFSImporter_importAppLibraryRootFromTemplateItem___block_invoke;
  block[3] = &unk_265081E88;
  id v16 = v8;
  uint64_t v17 = self;
  uint64_t v18 = buf;
  id v12 = v8;
  dispatch_async_and_wait(v11, block);

  id v13 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v13;
}

void __54__BRCFSImporter_importAppLibraryRootFromTemplateItem___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(*(void *)(a1 + 40) + 8) clientDB];
  id v10 = [v2 fetchRootItemInDB:v3];

  id v4 = [[BRCNotification alloc] initWithLocalItem:v10 itemDiffs:0];
  id v5 = (void *)MEMORY[0x263F32610];
  id v6 = [*(id *)(a1 + 32) containerMetadata];
  uint64_t v7 = [v5 containerItemForContainer:v6 withRepresentativeItem:v4];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (id)importNewItemAtURL:(id)a3 parentItem:(id)a4 templateItem:(id)a5 fields:(unint64_t)a6 options:(unint64_t)a7 additionalItemAttributes:(id)a8 importBookmark:(id)a9 stillPendingFields:(unint64_t *)a10 error:(id *)a11
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v50 = a3;
  id v17 = a4;
  id v18 = a5;
  unint64_t v55 = a6;
  id v19 = a8;
  id v20 = a9;
  char v54 = 0;
  __int16 v49 = [v18 filename];
  char v53 = 0;
  uint64_t v51 = v17;
  id v52 = 0;
  id v21 = [(BRCFSImporter *)self _locateMatchingItemForTemplateItem:v18 parentItem:v17 options:a7 fileURL:v50 fields:&v55 shouldReject:&v54 additionalAttrs:v19 importBookmark:v20 ignoreImportBookmark:&v53 stillPendingFields:a10 error:&v52];
  id v22 = v52;
  uint64_t v23 = v22;
  if (v22)
  {
    if (a11)
    {
      id v24 = 0;
      *a11 = v22;
LABEL_6:
      uint64_t v25 = v21;
      goto LABEL_7;
    }
LABEL_5:
    id v24 = 0;
    goto LABEL_6;
  }
  if (v54) {
    goto LABEL_5;
  }
  if (v53)
  {

    id v20 = 0;
  }
  if (!v21)
  {
    [(BRCAccountSessionFPFS *)self->_session updateFPFSMigrationNewItemsInDB];
    id v29 = v50;
    if (v50)
    {
      id v30 = [[BRCImportObject alloc] initWithURL:v50 logicalName:v49 quarantineInfo:0 parentItem:v51 error:a11];
      if (!v30) {
        goto LABEL_5;
      }
    }
    else
    {
      int v38 = [v18 contentType];
      int v46 = objc_msgSend(v38, "br_isSymbolicLinkType");

      if (v46)
      {
        uint64_t v39 = [v18 symlinkTargetPath];
        if (!v39)
        {
          uint64_t v39 = [v19 objectForKey:@"symlink-target"];
        }
        uint64_t v47 = (void *)v39;
        uint64_t v40 = [[BRCImportObject alloc] initAsSymlinkWithTarget:v39 parentItem:v51 logicalName:v49 error:a11];

        id v30 = v40;
      }
      else
      {
        uint64_t v41 = [v18 contentType];
        int v48 = objc_msgSend(v41, "br_isDirectoryType");

        if (!v48)
        {
          id v42 = brc_bread_crumbs();
          id v43 = brc_default_log();
          if (os_log_type_enabled(v43, (os_log_type_t)0x90u)) {
            -[BRCFSImporter importNewItemAtURL:parentItem:templateItem:fields:options:additionalItemAttributes:importBookmark:stillPendingFields:error:]();
          }

          id v24 = 0;
          goto LABEL_32;
        }
        id v30 = [[BRCImportObject alloc] initAsNewDirectoryWithLogicalName:v49 parentItem:v51];
      }
      id v29 = 0;
      if (!v30) {
        goto LABEL_5;
      }
    }
    id v42 = v30;
    id v24 = [(BRCFSImporter *)self _createAndInsertNewItemWithImportObject:v30 parentItem:v51 fields:v55 templateItem:v18 fileURL:v29 options:a7 additionalAttrs:v19 importBookmark:v20 stillPendingFields:a10 error:a11];
LABEL_32:
    uint64_t v25 = 0;

    goto LABEL_7;
  }
  uint64_t v25 = v21;
  int v27 = [v21 isPackage];
  session = self->_session;
  if (v27)
  {
    [(BRCAccountSessionFPFS *)self->_session updateFPFSMigrationMigratedTypesWithPackage];
  }
  else
  {
    char v31 = [v21 st];
    -[BRCAccountSessionFPFS updateFPFSMigrationMigratedTypes:](session, "updateFPFSMigrationMigratedTypes:", [v31 type]);
  }
  int v32 = [v21 isMigratingToFPFS];
  int v33 = [v21 dbItemIsMigratingToFPFS];
  int v34 = v33;
  if ((v32 & 1) != 0 || v33)
  {
    char v35 = brc_bread_crumbs();
    id v36 = brc_default_log();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
    {
      id v44 = "not-migrating";
      *(_DWORD *)buf = 138413058;
      uint64_t v57 = v25;
      if (v32) {
        id v45 = "migrating";
      }
      else {
        id v45 = "not-migrating";
      }
      __int16 v58 = 2080;
      uint64_t v59 = v45;
      if (v34) {
        id v44 = "migrating";
      }
      __int16 v60 = 2080;
      uint64_t v61 = v44;
      __int16 v62 = 2112;
      uint64_t v63 = v35;
      _os_log_fault_impl(&dword_23FA42000, v36, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: item %@ local state: %s db state: %s%@", buf, 0x2Au);
    }

    char v37 = +[BRCAutoBugCaptureReporter sharedABCReporter];
    [v37 captureLogsForOperationType:@"FPFSMigration" ofSubtype:@"MigratingItem" forError:0];
  }
  id v24 = v25;
LABEL_7:

  return v24;
}

- (id)createAndImportNewDirectoryWithLogicalName:(id)a3 parentItem:(id)a4 error:(id *)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = [[BRCImportObject alloc] initAsNewDirectoryWithLogicalName:v8 parentItem:v9];
  uint64_t v11 = v10;
  if (v10)
  {
    if (([v10 isUnixDir] & 1) == 0) {
      -[BRCFSImporter createAndImportNewDirectoryWithLogicalName:parentItem:error:]();
    }
    id v12 = [(BRCFSImporter *)self _createBaseItemWithImportObject:v11 importBookmark:0 parentItem:v9 options:0 error:a5];
    id v13 = [v12 asDirectory];

    if ([v13 handlePathMatchConflictForDirectoryCreationIfNecessary]
      || ([v13 markNeedsUploadOrSyncingUp], (objc_msgSend(v13, "saveToDB") & 1) != 0))
    {
      id v14 = v13;
      id v15 = 0;
    }
    else
    {
      id v19 = [v13 db];
      id v20 = [v19 lastError];
      id v21 = v20;
      if (v20)
      {
        id v15 = v20;
      }
      else
      {
        id v22 = (void *)MEMORY[0x263F087E8];
        uint64_t v23 = [v9 itemID];
        id v24 = [v23 debugItemIDString];
        objc_msgSend(v22, "brc_errorItemNotFound:", v24);
        id v15 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (a5) {
        *a5 = v15;
      }
      uint64_t v25 = brc_bread_crumbs();
      uint64_t v26 = brc_default_log();
      if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
      {
        id v29 = [v9 itemID];
        int v30 = 138413058;
        id v31 = v8;
        __int16 v32 = 2112;
        int v33 = v29;
        __int16 v34 = 2112;
        id v35 = v15;
        __int16 v36 = 2112;
        char v37 = v25;
        _os_log_error_impl(&dword_23FA42000, v26, (os_log_type_t)0x90u, "[ERROR] Fail to create new directory with name %@ and parent %@. Returning error %@%@", (uint8_t *)&v30, 0x2Au);
      }
      id v14 = 0;
    }
  }
  else
  {
    id v16 = brc_bread_crumbs();
    id v17 = brc_default_log();
    if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
    {
      uint64_t v28 = [v9 itemID];
      int v30 = 138412802;
      id v31 = v8;
      __int16 v32 = 2112;
      int v33 = v28;
      __int16 v34 = 2112;
      id v35 = v16;
      _os_log_error_impl(&dword_23FA42000, v17, (os_log_type_t)0x90u, "[ERROR] Fail to create directory import object with name %@ and parent %@%@", (uint8_t *)&v30, 0x20u);
    }
    id v18 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithPOSIXCode:", 22);
    id v15 = v18;
    if (a5)
    {
      id v15 = v18;
      id v14 = 0;
      *a5 = v15;
    }
    else
    {
      id v14 = 0;
    }
  }

  return v14;
}

- (id)getOrCreateTrashItemInAppLibrary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 db];
  char v8 = [v7 isBatchSuspended];

  if ((v8 & 1) == 0)
  {
    id v19 = brc_bread_crumbs();
    id v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      -[BRCFSImporter getOrCreateTrashItemInAppLibrary:error:]();
    }
  }
  id v9 = [v6 documentsFolderItemID];
  id v10 = [v6 defaultClientZone];
  uint64_t v11 = *MEMORY[0x263F32538];
  id v12 = [v10 itemByParentID:v9 andLogicalName:*MEMORY[0x263F32538]];
  id v13 = [v12 asDirectory];

  if (!v13)
  {
    id v14 = [v6 defaultClientZone];
    id v15 = [v14 itemByItemID:v9];
    id v16 = [v15 asDirectory];

    if (v16 || ([v6 createDocumentsFolder], (id v16 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v13 = [(BRCFSImporter *)self createAndImportNewDirectoryWithLogicalName:v11 parentItem:v16 error:a4];
    }
    else
    {
      id v16 = brc_bread_crumbs();
      id v18 = brc_default_log();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u)) {
        -[BRCFSImporter getOrCreateTrashItemInAppLibrary:error:]();
      }

      id v13 = 0;
    }
  }
  return v13;
}

- (BOOL)trashItem:(id)a3 parentItemInTrash:(id)a4 error:(id *)a5
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(BRCAccountSessionFPFS *)self->_session clientDB];
  char v11 = [v10 isInTransaction];

  if ((v11 & 1) == 0)
  {
    id v44 = brc_bread_crumbs();
    id v45 = brc_default_log();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT)) {
      -[BRCFSImporter trashItem:parentItemInTrash:error:].cold.4();
    }
  }
  if ([v8 isSharedToMe])
  {
    brc_bread_crumbs();
    id v12 = (char *)objc_claimAutoreleasedReturnValue();
    id v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      char v54 = v12;
      _os_log_impl(&dword_23FA42000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] We can't trash shared-to-me items. Marking dead%@", buf, 0xCu);
    }

    BOOL v14 = 1;
    [v8 markRemovedFromFilesystemRecursively:1];
  }
  else
  {
    id v15 = [v8 appLibrary];
    id v52 = 0;
    id v16 = [(BRCFSImporter *)self getOrCreateTrashItemInAppLibrary:v15 error:&v52];
    id v17 = v52;

    BOOL v14 = v16 != 0;
    if (v16)
    {
      if (v9
        && ([v16 itemGlobalID],
            id v18 = objc_claimAutoreleasedReturnValue(),
            [v9 itemGlobalID],
            id v19 = objc_claimAutoreleasedReturnValue(),
            int v20 = [v18 isEqual:v19],
            v19,
            v18,
            !v20))
      {
        uint64_t v21 = 0;
        uint64_t v23 = 0;
      }
      else
      {
        uint64_t v21 = [v8 computeItemPathRelativeToRoot];
        id v22 = [v8 st];
        uint64_t v23 = [v22 parentID];

        id v24 = v16;
        id v9 = v24;
      }
      id v29 = brc_bread_crumbs();
      int v30 = brc_default_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v51 = [v8 itemID];
        id v50 = [v51 debugItemIDString];
        uint64_t v41 = [v23 debugItemIDString];
        *(_DWORD *)buf = 138413058;
        char v54 = v50;
        __int16 v55 = 2112;
        uint64_t v56 = v21;
        __int16 v57 = 2112;
        uint64_t v58 = v41;
        id v42 = (void *)v41;
        __int16 v59 = 2112;
        __int16 v60 = v29;
        _os_log_debug_impl(&dword_23FA42000, v30, OS_LOG_TYPE_DEBUG, "[DEBUG] item %@ put back: path [%@] parentID [%@]%@", buf, 0x2Au);
      }
      id v49 = v17;

      if ([v9 itemScope] != 3)
      {
        int v46 = brc_bread_crumbs();
        uint64_t v47 = brc_default_log();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT)) {
          -[BRCFSImporter trashItem:parentItemInTrash:error:]();
        }
      }
      id v31 = objc_msgSend(v9, "clientZone", v21);
      __int16 v32 = [v9 itemID];
      int v33 = [v8 st];
      __int16 v34 = [v33 logicalName];
      id v35 = [v8 itemID];
      int v36 = [v31 existsByParentID:v32 andLogicalName:v34 excludingItemID:v35];

      char v37 = [v9 itemGlobalID];
      uint64_t v28 = v48;
      [v8 updateToBeInTrashWithParent:v37 trashPutBackPath:v48 trashPutBackParentID:v23];

      if (v36) {
        [v8 markBouncedToNextAvailableBounceNumber:508];
      }
      uint64_t v38 = brc_bread_crumbs();
      uint64_t v39 = brc_default_log();
      id v17 = v49;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
        -[BRCFSImporter trashItem:parentItemInTrash:error:]();
      }

      BOOL v14 = v16 != 0;
    }
    else
    {
      id v25 = v17;
      if (v25)
      {
        uint64_t v26 = brc_bread_crumbs();
        int v27 = brc_default_log();
        if (os_log_type_enabled(v27, (os_log_type_t)0x90u))
        {
          id v43 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          char v54 = "-[BRCFSImporter trashItem:parentItemInTrash:error:]";
          __int16 v55 = 2080;
          if (!a5) {
            id v43 = "(ignored by caller)";
          }
          uint64_t v56 = (uint64_t)v43;
          __int16 v57 = 2112;
          uint64_t v58 = (uint64_t)v25;
          __int16 v59 = 2112;
          __int16 v60 = v26;
          _os_log_error_impl(&dword_23FA42000, v27, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }
      }
      if (a5) {
        *a5 = v25;
      }

      uint64_t v28 = brc_bread_crumbs();
      uint64_t v23 = brc_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        -[BRCFSImporter trashItem:parentItemInTrash:error:]();
      }
    }
  }
  return v14;
}

- (BOOL)_trashItem:(id)a3 error:(id *)a4
{
  return [(BRCFSImporter *)self trashItem:a3 parentItemInTrash:0 error:a4];
}

- (BOOL)_processParentAndFilenameIfNecessaryWithLocalItem:(id)a3 changedFields:(unint64_t)a4 templateItem:(id)a5 error:(id *)a6
{
  char v8 = a4;
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  v66[0] = MEMORY[0x263EF8330];
  v66[1] = 3221225472;
  v66[2] = __100__BRCFSImporter__processParentAndFilenameIfNecessaryWithLocalItem_changedFields_templateItem_error___block_invoke;
  v66[3] = &unk_2650826F0;
  id v12 = v10;
  id v67 = v12;
  id v13 = v11;
  id v68 = v13;
  __int16 v69 = self;
  BOOL v14 = (uint64_t (**)(void, void, void, void, void))MEMORY[0x2455D9A50](v66);
  if ((v8 & 4) != 0)
  {
    int v20 = [v13 parentItemIdentifier];
    int v21 = [v20 isEqualToString:*MEMORY[0x263F053F8]];

    if (v21)
    {
      if ((v8 & 2) != 0)
      {
        id v22 = [v13 filename];
        [v12 updateWithLogicalName:v22 newParent:0];
      }
      if ([(BRCFSImporter *)self _trashItem:v12 error:a6]) {
        goto LABEL_54;
      }
      goto LABEL_48;
    }
    uint64_t v23 = [v13 parentItemIdentifier];
    int v24 = [v23 isEqualToString:*MEMORY[0x263F053F0]];

    if (v24)
    {
      id v25 = brc_bread_crumbs();
      uint64_t v26 = brc_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        -[BRCFSImporter _processParentAndFilenameIfNecessaryWithLocalItem:changedFields:templateItem:error:].cold.4();
      }

      if (([v12 isInTrashScope] & 1) == 0)
      {
        uint64_t v64 = brc_bread_crumbs();
        __int16 v65 = brc_default_log();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_FAULT)) {
          -[BRCFSImporter _processParentAndFilenameIfNecessaryWithLocalItem:changedFields:templateItem:error:]();
        }
      }
      int v27 = [v12 appLibrary];
      uint64_t v28 = [v27 fetchDocumentsDirectoryItem];
      id v29 = [v28 fileObjectID];
    }
    else
    {
      int v30 = (void *)MEMORY[0x263F325B8];
      int v27 = [v13 parentItemIdentifier];
      id v29 = [v30 fileObjectIDWithString:v27];
    }

    if (!v29)
    {
      id v45 = (void *)MEMORY[0x263F087E8];
      int v46 = [v13 parentItemIdentifier];
      id v29 = objc_msgSend(v45, "brc_errorInvalidParameter:value:", @"parentItemIdentifier", v46);

      if (v29)
      {
        uint64_t v47 = brc_bread_crumbs();
        int v48 = brc_default_log();
        if (os_log_type_enabled(v48, (os_log_type_t)0x90u))
        {
          uint64_t v63 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          uint64_t v71 = "-[BRCFSImporter _processParentAndFilenameIfNecessaryWithLocalItem:changedFields:templateItem:error:]";
          __int16 v72 = 2080;
          if (!a6) {
            uint64_t v63 = "(ignored by caller)";
          }
          v73 = v63;
          __int16 v74 = 2112;
          id v75 = v29;
          __int16 v76 = 2112;
          v77 = v47;
          _os_log_error_impl(&dword_23FA42000, v48, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }
      }
      if (a6) {
        *a6 = v29;
      }
      goto LABEL_47;
    }
    id v31 = [v12 session];
    __int16 v32 = [v31 itemByFileObjectID:v29];
    int v33 = [v32 asDirectory];

    if (v33 && ![v33 isDead])
    {
      unsigned __int16 v49 = [(BRCFSImporter *)self capabilityToMoveItem:v12 toNewParentItem:v33 error:0];
      if ((v8 & 6) == 0 || (v49 & 0x35FB) != 0)
      {
        if ((v8 & 2) != 0)
        {
          uint64_t v58 = [v13 filename];
        }
        else
        {
          __int16 v57 = [v12 st];
          uint64_t v58 = [v57 logicalName];
        }
        __int16 v59 = [v33 clientZone];
        __int16 v60 = [v33 itemID];
        char v61 = ((uint64_t (**)(void, void *, void *, void *, void *))v14)[2](v14, v58, v59, v60, v33);

        if ((v61 & 1) == 0)
        {
LABEL_46:

LABEL_47:
          goto LABEL_48;
        }
      }
      else
      {
        id v50 = brc_bread_crumbs();
        uint64_t v51 = brc_default_log();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          uint64_t v71 = (const char *)v12;
          __int16 v72 = 2112;
          v73 = (const char *)v33;
          __int16 v74 = 2112;
          id v75 = v50;
          _os_log_debug_impl(&dword_23FA42000, v51, OS_LOG_TYPE_DEBUG, "[DEBUG] Can't reparent to folder: undoing reparent on %@ to %@%@", buf, 0x20u);
        }

        int v33 = 0;
      }

LABEL_54:
      BOOL v56 = 1;
      goto LABEL_55;
    }
    if (([v33 isDead] & 1) != 0
      || ([v12 session],
          __int16 v34 = objc_claimAutoreleasedReturnValue(),
          [v34 recentsEnumerator],
          id v35 = objc_claimAutoreleasedReturnValue(),
          int v36 = [v35 hasDeletedFileObjectID:v29],
          v35,
          v34,
          v36))
    {
      char v37 = brc_bread_crumbs();
      uint64_t v38 = brc_default_log();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
        -[BRCFSImporter _processParentAndFilenameIfNecessaryWithLocalItem:changedFields:templateItem:error:]();
      }

      uint64_t v39 = (void *)MEMORY[0x263F087E8];
      uint64_t v40 = [v13 parentItemIdentifier];
      objc_msgSend(v39, "brc_errorParentItemRemotelyDeleted:", v40);
      id v41 = (id)objc_claimAutoreleasedReturnValue();

      if (!v41) {
        goto LABEL_43;
      }
      id v42 = brc_bread_crumbs();
      id v43 = brc_default_log();
      if (!os_log_type_enabled(v43, (os_log_type_t)0x90u))
      {
LABEL_42:

LABEL_43:
        if (a6)
        {
          id v41 = v41;
          *a6 = v41;
        }

        goto LABEL_46;
      }
      id v44 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      uint64_t v71 = "-[BRCFSImporter _processParentAndFilenameIfNecessaryWithLocalItem:changedFields:templateItem:error:]";
      __int16 v72 = 2080;
      if (!a6) {
        id v44 = "(ignored by caller)";
      }
    }
    else
    {
      id v52 = brc_bread_crumbs();
      char v53 = brc_default_log();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG)) {
        -[BRCFSImporter _processParentAndFilenameIfNecessaryWithLocalItem:changedFields:templateItem:error:]();
      }

      char v54 = (void *)MEMORY[0x263F087E8];
      __int16 v55 = [v13 parentItemIdentifier];
      objc_msgSend(v54, "brc_errorItemNotFound:", v55);
      id v41 = (id)objc_claimAutoreleasedReturnValue();

      if (!v41) {
        goto LABEL_43;
      }
      id v42 = brc_bread_crumbs();
      id v43 = brc_default_log();
      if (!os_log_type_enabled(v43, (os_log_type_t)0x90u)) {
        goto LABEL_42;
      }
      id v44 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      uint64_t v71 = "-[BRCFSImporter _processParentAndFilenameIfNecessaryWithLocalItem:changedFields:templateItem:error:]";
      __int16 v72 = 2080;
      if (!a6) {
        id v44 = "(ignored by caller)";
      }
    }
    v73 = v44;
    __int16 v74 = 2112;
    id v75 = v41;
    __int16 v76 = 2112;
    v77 = v42;
    _os_log_error_impl(&dword_23FA42000, v43, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    goto LABEL_42;
  }
  if ((v8 & 2) == 0) {
    goto LABEL_54;
  }
  id v15 = [v13 filename];
  id v16 = [v12 parentClientZone];
  id v17 = [v12 st];
  id v18 = [v17 parentID];
  int v19 = ((uint64_t (**)(void, void *, void *, void *, void))v14)[2](v14, v15, v16, v18, 0);

  if (v19) {
    goto LABEL_54;
  }
LABEL_48:
  BOOL v56 = 0;
LABEL_55:

  return v56;
}

uint64_t __100__BRCFSImporter__processParentAndFilenameIfNecessaryWithLocalItem_changedFields_templateItem_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a5;
  id v11 = *(void **)(a1 + 32);
  id v12 = a4;
  id v13 = a3;
  BOOL v14 = [v11 itemID];
  id v15 = [v13 liveItemByParentID:v12 andLogicalName:v9 excludingItemID:v14];

  if (v15)
  {
    id v16 = brc_bread_crumbs();
    id v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = *(void *)(a1 + 40);
      int v21 = 138412802;
      id v22 = v15;
      __int16 v23 = 2112;
      uint64_t v24 = v18;
      __int16 v25 = 2112;
      uint64_t v26 = v16;
      _os_log_impl(&dword_23FA42000, v17, OS_LOG_TYPE_INFO, "[INFO] Bouncing item %@ because of %@%@", (uint8_t *)&v21, 0x20u);
    }

    [v15 markBouncedToNextAvailableBounceNumber:505];
    int v19 = [v15 isMigratingToFPFS];
    [v15 markDoneMigratingToFPFS];
    [v15 saveToDB];
    if (v19) {
      [*(id *)(a1 + 48) _reportBouncingForMigration:*(void *)(a1 + 40) existingItem:v15];
    }
  }
  [*(id *)(a1 + 32) updateWithLogicalName:v9 newParent:v10];

  return 1;
}

- (void)_learnEtagsIfNecessaryWithItem:(id)a3 changedFields:(unint64_t)a4 baseVersion:(id)a5
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  if ([v7 isDocument])
  {
    id v9 = [v7 asDocument];
    char v10 = [v9 isDocumentBeingCopiedToNewZone];

    if (v10) {
      goto LABEL_19;
    }
  }
  if (a4)
  {
    id v11 = [v8 contentVersion];
    if (![(BRFieldContentSignature *)v11 length])
    {
LABEL_11:

      goto LABEL_12;
    }
    int v12 = [v7 isDocument];

    if (v12)
    {
      id v13 = [BRFieldContentSignature alloc];
      BOOL v14 = [v8 contentVersion];
      id v11 = [(BRFieldContentSignature *)v13 initWithData:v14];

      id v15 = [v7 asDocument];
      id v16 = [v15 currentVersion];
      id v17 = [v16 versionSignature];

      if (![(BRFieldContentSignature *)v11 isEquivalentToSignature:v17])
      {
        uint64_t v18 = brc_bread_crumbs();
        int v19 = brc_default_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = [(BRFieldContentSignature *)v11 versionIdentifier];
          int v21 = [v17 versionIdentifier];
          int v40 = 138412802;
          id v41 = v20;
          __int16 v42 = 2112;
          id v43 = v21;
          __int16 v44 = 2112;
          id v45 = v18;
          _os_log_impl(&dword_23FA42000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] Base version differs from local version content! overwriting our local version (%@ vs %@)%@", (uint8_t *)&v40, 0x20u);
        }
        id v22 = [v7 asDocument];
        __int16 v23 = [v22 currentVersion];
        uint64_t v24 = [v23 ckInfo];
        __int16 v25 = [(BRFieldContentSignature *)v11 etag];
        [v24 setEtag:v25];
      }
      goto LABEL_11;
    }
  }
LABEL_12:
  if (a4 >= 2)
  {
    uint64_t v26 = [v8 metadataVersion];
    uint64_t v27 = [v26 length];

    if (v27)
    {
      uint64_t v28 = [BRFieldStructureSignature alloc];
      id v29 = [v8 metadataVersion];
      int v30 = [(BRFieldStructureSignature *)v28 initWithData:v29];

      id v31 = [v7 st];
      __int16 v32 = [v31 versionSignature];

      if (![(BRFieldStructureSignature *)v30 isEquivalentToSignature:v32])
      {
        int v33 = brc_bread_crumbs();
        __int16 v34 = brc_default_log();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          id v35 = [(BRFieldStructureSignature *)v30 versionIdentifier];
          int v36 = [v32 versionIdentifier];
          int v40 = 138412802;
          id v41 = v35;
          __int16 v42 = 2112;
          id v43 = v36;
          __int16 v44 = 2112;
          id v45 = v33;
          _os_log_impl(&dword_23FA42000, v34, OS_LOG_TYPE_DEFAULT, "[WARNING] Base version differs from local version structure! overwriting our local version (%@ vs %@)%@", (uint8_t *)&v40, 0x20u);
        }
        char v37 = [v7 st];
        uint64_t v38 = [v37 ckInfo];
        uint64_t v39 = [(BRFieldStructureSignature *)v30 etag];
        [v38 setEtag:v39];
      }
    }
  }
LABEL_19:
}

- (BOOL)changeItem:(id)a3 baseVersion:(id)a4 changedFields:(unint64_t)a5 newValues:(id)a6 contents:(id)a7 additionalAttrs:(id)a8 clearCKInfoOnSyncUp:(BOOL)a9 stillPendingFields:(unint64_t *)a10 error:(id *)a11
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v18 = a4;
  id v19 = a6;
  id v20 = a7;
  id v74 = a8;
  int v21 = [(BRCAccountSessionFPFS *)self->_session clientDB];
  char v22 = [v21 isInTransaction];

  if ((v22 & 1) == 0)
  {
    double v66 = brc_bread_crumbs();
    id v67 = brc_default_log();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_FAULT)) {
      -[BRCFSImporter trashItem:parentItemInTrash:error:].cold.4();
    }
  }
  if (![v17 isZoneRoot])
  {
    if ([v17 isShareAcceptationFault])
    {
      brc_bread_crumbs();
      __int16 v23 = (BRCImportObject *)objc_claimAutoreleasedReturnValue();
      uint64_t v24 = brc_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        -[BRCFSImporter changeItem:baseVersion:changedFields:newValues:contents:additionalAttrs:clearCKInfoOnSyncUp:stillPendingFields:error:]();
      }
      goto LABEL_8;
    }
    uint64_t v28 = [v17 parentFileObjectID];
    if ([v28 isAppLibraryRoot])
    {
      id v29 = [v17 itemID];
      BOOL v30 = ([v29 isDocumentsFolder] & 1) != 0
         || [(BRCFSImporter *)self _isDesktopOrDocumentsItem:v17];
    }
    else
    {
      BOOL v30 = [(BRCFSImporter *)self _isDesktopOrDocumentsItem:v17];
    }

    if ((a5 & 6) != 0 && v30)
    {
      id v31 = brc_bread_crumbs();
      __int16 v32 = brc_default_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
        -[BRCFSImporter changeItem:baseVersion:changedFields:newValues:contents:additionalAttrs:clearCKInfoOnSyncUp:stillPendingFields:error:].cold.5();
      }

      a5 &= 0xFFFFFFFFFFFFFFF9;
    }
    if ((a5 & 1) == 0)
    {
      __int16 v25 = 0;
      goto LABEL_56;
    }
    if (v20)
    {
      if (([v17 isDocument] & 1) == 0)
      {
        id v68 = brc_bread_crumbs();
        __int16 v69 = brc_default_log();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT)) {
          -[BRCFSImporter changeItem:baseVersion:changedFields:newValues:contents:additionalAttrs:clearCKInfoOnSyncUp:stillPendingFields:error:].cold.4();
        }
      }
      if ([v17 isDocument])
      {
        int v33 = [v17 asDocument];
        __int16 v34 = [v33 currentVersion];
        id v35 = [v34 quarantineInfo];
      }
      else
      {
        id v35 = 0;
      }
      id v78 = 0;
      __int16 v23 = [[BRCImportObject alloc] initWithURL:v20 existingItem:v17 quarantineInfo:v35 error:&v78];
      int v40 = (BRCImportObject *)v78;
    }
    else
    {
      int v36 = [v19 contentType];
      int v37 = objc_msgSend(v36, "br_isSymbolicLinkType");

      if (!v37)
      {
        brc_bread_crumbs();
        uint64_t v46 = (char *)objc_claimAutoreleasedReturnValue();
        uint64_t v47 = brc_default_log();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v80 = v46;
          _os_log_impl(&dword_23FA42000, v47, OS_LOG_TYPE_DEFAULT, "[NOTICE] Got nil content URL and the item is not a symbolic link. Ignoring the content change field%@", buf, 0xCu);
        }

        int v40 = 0;
        __int16 v23 = 0;
        __int16 v25 = 0;
        if (!objc_msgSend(0, "br_isPOSIXErrorCode:", 1)) {
          goto LABEL_55;
        }
        goto LABEL_50;
      }
      id v35 = [v19 symlinkTargetPath];
      if (!v35)
      {
        id v35 = [v74 objectForKey:@"symlink-target"];
      }
      uint64_t v38 = [BRCImportObject alloc];
      uint64_t v70 = [v17 parentItemOnFS];
      uint64_t v71 = [v17 st];
      uint64_t v39 = [v71 logicalName];
      id v77 = 0;
      __int16 v23 = [(BRCImportObject *)v38 initAsSymlinkWithTarget:v35 parentItem:v70 logicalName:v39 error:&v77];
      int v40 = (BRCImportObject *)v77;
    }
    if (v23)
    {
      __int16 v76 = v40;
      char v41 = [v17 updateWithImportObject:v23 onlyContentDependentProperties:v19 != 0 error:&v76];
      __int16 v25 = v76;

      if (v41)
      {
        if (v20)
        {
          __int16 v42 = [(BRCAccountSessionFPFS *)self->_session stageRegistry];
          id v43 = [v17 liveStageFilename];
          int v72 = [v42 moveFromURLToLiveStage:v20 liveStageFilename:v43 error:a11];

          if (!v72) {
            goto LABEL_82;
          }
        }
        goto LABEL_55;
      }
      int v40 = v25;
    }
    if (([(BRCImportObject *)v40 br_isPOSIXErrorCode:1] & 1) == 0)
    {
      __int16 v25 = v40;
      if (v25)
      {
        __int16 v44 = brc_bread_crumbs();
        id v45 = brc_default_log();
        if (os_log_type_enabled(v45, (os_log_type_t)0x90u))
        {
          __int16 v65 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          id v80 = "-[BRCFSImporter changeItem:baseVersion:changedFields:newValues:contents:additionalAttrs:clearCKInfoOnSyn"
                "cUp:stillPendingFields:error:]";
          __int16 v81 = 2080;
          if (!a11) {
            __int16 v65 = "(ignored by caller)";
          }
          v82 = v65;
          __int16 v83 = 2112;
          v84 = v25;
          __int16 v85 = 2112;
          v86 = v44;
          _os_log_error_impl(&dword_23FA42000, v45, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }
      }
      if (a11) {
        *a11 = v25;
      }

      goto LABEL_82;
    }
LABEL_50:
    brc_bread_crumbs();
    v73 = (char *)objc_claimAutoreleasedReturnValue();
    int v48 = brc_default_log();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v80 = (const char *)v17;
      __int16 v81 = 2112;
      v82 = v73;
      _os_log_impl(&dword_23FA42000, v48, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed updating the content of the item %@ from the template due to EPERM error, will continue and flag the content of the item as pending%@", buf, 0x16u);
    }

    if (a10) {
      *a10 |= 1uLL;
    }

    __int16 v25 = 0;
LABEL_55:

LABEL_56:
    unsigned __int16 v49 = v25;
    [(BRCFSImporter *)self _learnEtagsIfNecessaryWithItem:v17 changedFields:a5 baseVersion:v18];
    id v75 = v25;
    BOOL v50 = [(BRCFSImporter *)self _processParentAndFilenameIfNecessaryWithLocalItem:v17 changedFields:a5 templateItem:v19 error:&v75];
    __int16 v25 = v75;

    if (!v50)
    {
      __int16 v23 = v25;
      if (v23)
      {
        uint64_t v58 = brc_bread_crumbs();
        __int16 v59 = brc_default_log();
        if (os_log_type_enabled(v59, (os_log_type_t)0x90u))
        {
          uint64_t v63 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          id v80 = "-[BRCFSImporter changeItem:baseVersion:changedFields:newValues:contents:additionalAttrs:clearCKInfoOnSyn"
                "cUp:stillPendingFields:error:]";
          __int16 v81 = 2080;
          if (!a11) {
            uint64_t v63 = "(ignored by caller)";
          }
          v82 = v63;
          __int16 v83 = 2112;
          v84 = v23;
          __int16 v85 = 2112;
          v86 = v58;
          _os_log_error_impl(&dword_23FA42000, v59, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }
      }
      if (a11)
      {
        __int16 v23 = v23;
        BOOL v26 = 0;
        *a11 = v23;
      }
      else
      {
        BOOL v26 = 0;
      }
      __int16 v25 = v23;
      goto LABEL_9;
    }
    [(BRCFSImporter *)self _changeBasicFieldsOnItem:v17 fields:a5 template:v19];
    if ((a5 & 0x80000000) != 0 && [v17 isDocument]) {
      [(BRCFSImporter *)self _resolveConflictLosersForItem:v19 localItem:v17];
    }
    [v17 markNeedsUploadOrSyncingUp];
    if (a9 && ([v17 isIdleOrRejected] & 1) == 0)
    {
      uint64_t v51 = brc_bread_crumbs();
      id v52 = brc_default_log();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
        -[BRCFSImporter changeItem:baseVersion:changedFields:newValues:contents:additionalAttrs:clearCKInfoOnSyncUp:stillPendingFields:error:]();
      }

      int v53 = [v17 localDiffs];
      int v54 = [v17 diffAgainstOriginalItem] | v53;
      if ([v17 isDocument] && (v54 & 0x1FE0000) != 0)
      {
        __int16 v55 = [v17 asDocument];
        BOOL v56 = [v55 currentVersion];
        [v56 clearCKInfo];
      }
      if ((v54 & 0x3FFE) != 0)
      {
        __int16 v57 = [v17 st];
        [v57 clearCKInfo];
      }
    }
    if ([v17 saveToDB])
    {
      BOOL v26 = 1;
      goto LABEL_10;
    }
    __int16 v60 = [v17 db];
    __int16 v23 = [v60 lastError];

    if (v23)
    {
      char v61 = brc_bread_crumbs();
      __int16 v62 = brc_default_log();
      if (os_log_type_enabled(v62, (os_log_type_t)0x90u))
      {
        uint64_t v64 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        id v80 = "-[BRCFSImporter changeItem:baseVersion:changedFields:newValues:contents:additionalAttrs:clearCKInfoOnSyncU"
              "p:stillPendingFields:error:]";
        __int16 v81 = 2080;
        if (!a11) {
          uint64_t v64 = "(ignored by caller)";
        }
        v82 = v64;
        __int16 v83 = 2112;
        v84 = v23;
        __int16 v85 = 2112;
        v86 = v61;
        _os_log_error_impl(&dword_23FA42000, v62, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a11)
    {
      __int16 v23 = v23;
      BOOL v26 = 0;
      *a11 = v23;
      goto LABEL_9;
    }
LABEL_82:
    BOOL v26 = 0;
    goto LABEL_9;
  }
  brc_bread_crumbs();
  __int16 v23 = (BRCImportObject *)objc_claimAutoreleasedReturnValue();
  uint64_t v24 = brc_default_log();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
    -[BRCFSImporter changeItem:baseVersion:changedFields:newValues:contents:additionalAttrs:clearCKInfoOnSyncUp:stillPendingFields:error:]();
  }
LABEL_8:

  __int16 v25 = 0;
  BOOL v26 = 1;
LABEL_9:

LABEL_10:
  return v26;
}

- (unsigned)_itemTypeToFileObjectIDType:(char)a3 itemID:(id)a4
{
  unsigned int v4 = a3;
  if ([a4 isDocumentsFolder]) {
    return 4;
  }
  if (v4 > 0xA) {
    return 5;
  }
  return byte_23FD343D4[v4];
}

- (BOOL)_deleteAppLibrary:(id)a3 documentsFolder:(id)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    id v9 = [v7 deleteAppLibrary];
    char v10 = v9;
    if (v9)
    {
      id v11 = v9;
      int v12 = brc_bread_crumbs();
      id v13 = brc_default_log();
      if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
      {
        char v22 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        uint64_t v27 = "-[BRCFSImporter _deleteAppLibrary:documentsFolder:error:]";
        __int16 v28 = 2080;
        if (!a5) {
          char v22 = "(ignored by caller)";
        }
        id v29 = v22;
        __int16 v30 = 2112;
        id v31 = v11;
        __int16 v32 = 2112;
        int v33 = v12;
        _os_log_error_impl(&dword_23FA42000, v13, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

      if (a5) {
        *a5 = v11;
      }
    }
    else
    {
      [v7 didRemoveDocumentsFolder];
      BOOL v14 = [v7 rootFileObjectID];
      id v15 = [v14 asString];
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __57__BRCFSImporter__deleteAppLibrary_documentsFolder_error___block_invoke;
      v24[3] = &unk_26507EBD8;
      id v16 = v8;
      id v25 = v16;
      +[BRCImportUtil forceIngestionForItemID:v15 completionHandler:v24];

      id v17 = [[BRCNotification alloc] initWithLocalItem:v16 itemDiffs:0];
      id v18 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorForRejectedDeletionOfItem:", v17);
      if (v18)
      {
        id v19 = brc_bread_crumbs();
        id v20 = brc_default_log();
        if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
        {
          __int16 v23 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          uint64_t v27 = "-[BRCFSImporter _deleteAppLibrary:documentsFolder:error:]";
          __int16 v28 = 2080;
          if (!a5) {
            __int16 v23 = "(ignored by caller)";
          }
          id v29 = v23;
          __int16 v30 = 2112;
          id v31 = v18;
          __int16 v32 = 2112;
          int v33 = v19;
          _os_log_error_impl(&dword_23FA42000, v20, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }
      }
      if (a5) {
        *a5 = v18;
      }

      id v11 = v25;
    }
  }
  else if (a5)
  {
    *a5 = 0;
  }

  return 0;
}

void __57__BRCFSImporter__deleteAppLibrary_documentsFolder_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    unsigned int v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = [*(id *)(a1 + 32) appLibrary];
      int v7 = 138412802;
      id v8 = v6;
      __int16 v9 = 2112;
      id v10 = v3;
      __int16 v11 = 2112;
      int v12 = v4;
      _os_log_debug_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] Failed force ingesting the root of the app library %@ - %@%@", (uint8_t *)&v7, 0x20u);
    }
  }
}

- (BOOL)_shouldRejectItemDeleteDueToEtags:(id)a3 baseVersion:(id)a4 error:(id *)a5
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  __int16 v9 = [v7 appLibrary];
  id v10 = [v9 mangledID];
  __int16 v11 = +[BRCUserDefaults defaultsForMangledID:v10];
  int v12 = [v11 rejectDeletionsBasedOnEtag];

  if (!v12 || ([v7 isSharedToMeTopLevelItem] & 1) != 0) {
    goto LABEL_8;
  }
  uint64_t v13 = [BRFieldStructureSignature alloc];
  BOOL v14 = [v8 metadataVersion];
  id v15 = [(BRFieldStructureSignature *)v13 initWithData:v14];

  id v16 = [v7 st];
  id v17 = [v16 versionSignature];

  if (([v17 isEquivalentToSignature:v15] & 1) == 0)
  {
    BOOL v26 = brc_bread_crumbs();
    uint64_t v27 = brc_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v39 = v17;
      __int16 v40 = 2112;
      char v41 = (const char *)v15;
      __int16 v42 = 2112;
      id v43 = v26;
      _os_log_debug_impl(&dword_23FA42000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] Structure signature mismatch for deletion %@ vs %@%@", buf, 0x20u);
    }

    id v20 = [[BRCNotification alloc] initWithLocalItem:v7 itemDiffs:0];
    objc_msgSend(MEMORY[0x263F087E8], "brc_errorForRejectedDeletionOfItem:", v20);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      __int16 v28 = brc_bread_crumbs();
      id v29 = brc_default_log();
      if (os_log_type_enabled(v29, (os_log_type_t)0x90u))
      {
        id v35 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        uint64_t v39 = "-[BRCFSImporter _shouldRejectItemDeleteDueToEtags:baseVersion:error:]";
        __int16 v40 = 2080;
        if (!a5) {
          id v35 = "(ignored by caller)";
        }
        char v41 = v35;
        __int16 v42 = 2112;
        id v43 = v23;
        __int16 v44 = 2112;
        id v45 = v28;
        _os_log_error_impl(&dword_23FA42000, v29, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a5)
    {
      id v23 = v23;
      *a5 = v23;
    }
    goto LABEL_25;
  }
  if ([v7 isDocument])
  {
    id v18 = [BRFieldContentSignature alloc];
    id v19 = [v8 contentVersion];
    id v20 = [(BRFieldContentSignature *)v18 initWithData:v19];

    int v21 = [v7 asDocument];
    char v22 = [v21 currentVersion];
    id v23 = [v22 versionSignature];

    if ([v23 isEquivalentToSignature:v20])
    {

      goto LABEL_7;
    }
    __int16 v30 = brc_bread_crumbs();
    id v31 = brc_default_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v39 = (const char *)v20;
      __int16 v40 = 2112;
      char v41 = (const char *)v23;
      __int16 v42 = 2112;
      id v43 = v30;
      _os_log_debug_impl(&dword_23FA42000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] Content signature mismatch for deletion %@ vs %@%@", buf, 0x20u);
    }

    __int16 v32 = [[BRCNotification alloc] initWithLocalItem:v7 itemDiffs:0];
    int v33 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorForRejectedDeletionOfItem:", v32);
    if (v33)
    {
      int v37 = brc_bread_crumbs();
      uint64_t v34 = brc_default_log();
      if (os_log_type_enabled(v34, (os_log_type_t)0x90u))
      {
        int v36 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        uint64_t v39 = "-[BRCFSImporter _shouldRejectItemDeleteDueToEtags:baseVersion:error:]";
        __int16 v40 = 2080;
        if (!a5) {
          int v36 = "(ignored by caller)";
        }
        char v41 = v36;
        __int16 v42 = 2112;
        id v43 = v33;
        __int16 v44 = 2112;
        id v45 = v37;
        _os_log_error_impl(&dword_23FA42000, v34, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a5) {
      *a5 = v33;
    }

LABEL_25:
    BOOL v24 = 1;
    goto LABEL_9;
  }
LABEL_7:

LABEL_8:
  BOOL v24 = 0;
LABEL_9:

  return v24;
}

- (BOOL)deleteItem:(id)a3 recursively:(BOOL)a4 baseVersion:(id)a5 error:(id *)a6
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  int v12 = [(BRCAccountSessionFPFS *)self->_session clientDB];
  [v12 assertOnQueue];

  if (!v10 || [v10 isDead])
  {
    if (a6)
    {
      BOOL v13 = 0;
      *a6 = 0;
      goto LABEL_22;
    }
LABEL_21:
    BOOL v13 = 0;
    goto LABEL_22;
  }
  if (!a4 && [v10 isDirectory])
  {
    BOOL v14 = [v10 asDirectory];
    if ([v14 hasLiveChildren])
    {

LABEL_11:
      objc_msgSend(MEMORY[0x263F087E8], "brc_errorDeletingNonEmptyDirectoryNonRecursively");
      id v18 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        id v19 = brc_bread_crumbs();
        id v20 = brc_default_log();
        if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
        {
          __int16 v30 = "(passed to caller)";
          *(_DWORD *)__int16 v44 = 136315906;
          *(void *)&v44[4] = "-[BRCFSImporter deleteItem:recursively:baseVersion:error:]";
          *(_WORD *)&v44[12] = 2080;
          if (!a6) {
            __int16 v30 = "(ignored by caller)";
          }
          *(void *)&v44[14] = v30;
          *(_WORD *)&v44[22] = 2112;
          id v45 = v18;
          LOWORD(v46) = 2112;
          *(void *)((char *)&v46 + 2) = v19;
          _os_log_error_impl(&dword_23FA42000, v20, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", v44, 0x2Au);
        }
      }
      if (a6) {
        *a6 = v18;
      }

      goto LABEL_21;
    }
    if ([v10 isDirectoryFault])
    {
      id v15 = [v10 asDirectory];
      id v16 = [v15 childItemCount];
      uint64_t v17 = [v16 longLongValue];

      if (v17 > 0) {
        goto LABEL_11;
      }
    }
    else
    {
    }
  }
  int v21 = [v10 fileObjectID];
  int v22 = [v21 isAppLibraryDocumentsFolder];

  if (v22)
  {
    id v23 = [v10 appLibrary];
    [(BRCFSImporter *)self _deleteAppLibrary:v23 documentsFolder:v10 error:a6];

    goto LABEL_21;
  }
  if ([(BRCFSImporter *)self _shouldRejectItemDeleteDueToEtags:v10 baseVersion:v11 error:a6])
  {
    goto LABEL_21;
  }
  *(void *)__int16 v44 = 0;
  *(void *)&v44[8] = v44;
  *(void *)&v44[16] = 0x3032000000;
  id v45 = __Block_byref_object_copy__23;
  *(void *)&long long v46 = __Block_byref_object_dispose__23;
  *((void *)&v46 + 1) = 0;
  id v25 = [v10 db];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __58__BRCFSImporter_deleteItem_recursively_baseVersion_error___block_invoke;
  v31[3] = &unk_265082718;
  BOOL v35 = a4;
  int v33 = self;
  uint64_t v34 = v44;
  id v32 = v10;
  [v25 groupInBatch:v31];

  id v26 = *(id *)(*(void *)&v44[8] + 40);
  if (v26)
  {
    uint64_t v27 = brc_bread_crumbs();
    __int16 v28 = brc_default_log();
    if (os_log_type_enabled(v28, (os_log_type_t)0x90u))
    {
      id v29 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      int v37 = "-[BRCFSImporter deleteItem:recursively:baseVersion:error:]";
      __int16 v38 = 2080;
      if (!a6) {
        id v29 = "(ignored by caller)";
      }
      uint64_t v39 = v29;
      __int16 v40 = 2112;
      id v41 = v26;
      __int16 v42 = 2112;
      id v43 = v27;
      _os_log_error_impl(&dword_23FA42000, v28, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }
  }
  if (a6) {
    *a6 = v26;
  }

  BOOL v13 = *(void *)(*(void *)&v44[8] + 40) == 0;
  _Block_object_dispose(v44, 8);

LABEL_22:
  return v13;
}

void __58__BRCFSImporter_deleteItem_recursively_baseVersion_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) markRemovedFromFilesystemRecursively:*(unsigned __int8 *)(a1 + 56)];
  if ([*(id *)(a1 + 32) saveToDB])
  {
    id v7 = [*(id *)(a1 + 32) db];
    [v7 flush];
  }
  else
  {
    uint64_t v2 = [*(id *)(*(void *)(a1 + 40) + 8) clientDB];
    id v3 = [v2 lastError];
    unsigned int v4 = v3;
    if (!v3)
    {
      id v5 = brc_bread_crumbs();
      id v6 = brc_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        __58__BRCFSImporter_deleteItem_recursively_baseVersion_error___block_invoke_cold_1();
      }

      unsigned int v4 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: Failed to save to db without an error");
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v4);
    if (!v3) {
  }
    }
}

- (void)_markNextChildBatchDead:(id)a3 persistedState:(id)a4 batchSize:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = brc_bread_crumbs();
  id v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[BRCFSImporter _markNextChildBatchDead:persistedState:batchSize:].cold.4();
  }

  id v43 = v9;
  uint64_t v61 = [v9 nextNotifRank];
  uint64_t v41 = (int)v5;
  uint64_t v42 = v5;
  int v12 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:");
  BOOL v13 = objc_opt_new();
  BOOL v14 = [v8 clientZone];
  id v15 = [v14 dbRowID];

  __int16 v40 = v15;
  uint64_t v16 = [v15 longLongValue];
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x2020000000;
  uint64_t v60 = 0;
  uint64_t v60 = brc_current_date_nsec();
  v54[0] = MEMORY[0x263EF8330];
  v54[1] = 3221225472;
  v54[2] = __66__BRCFSImporter__markNextChildBatchDead_persistedState_batchSize___block_invoke;
  v54[3] = &unk_265082740;
  v54[4] = self;
  id v47 = v12;
  id v55 = v47;
  uint64_t v58 = v16;
  id v39 = v13;
  id v56 = v39;
  __int16 v57 = v59;
  long long v46 = (void *)MEMORY[0x2455D9A50](v54);
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = __66__BRCFSImporter__markNextChildBatchDead_persistedState_batchSize___block_invoke_84;
  v52[3] = &unk_26507F148;
  id v17 = v8;
  id v53 = v17;
  id v45 = (void *)MEMORY[0x2455D9A50](v52);
  v51[0] = MEMORY[0x263EF8330];
  v51[1] = 3221225472;
  v51[2] = __66__BRCFSImporter__markNextChildBatchDead_persistedState_batchSize___block_invoke_87;
  v51[3] = &__block_descriptor_40_e48_v28__0__sqlite3_context__8i16___sqlite3_value_20l;
  v51[4] = v16;
  __int16 v44 = (void *)MEMORY[0x2455D9A50](v51);
  id v18 = [(BRCAccountSessionFPFS *)self->_session clientDB];
  id v19 = (void *)MEMORY[0x2455D9A50](v46);
  id v20 = (void *)MEMORY[0x2455D9A50](v44);
  int v21 = (void *)MEMORY[0x2455D9A50](v45);
  int v22 = (void *)MEMORY[0x2455D9A50](v45);
  id v23 = [v17 itemID];
  BOOL v24 = [v17 clientZone];
  id v25 = [v24 dbRowID];
  [v18 execute:@"UPDATE client_items SET item_notifs_rank = fetch_and_inc64(%p), item_state = 1, item_processing_stamp = call_block(%p, item_type, rowid, zone_rowid, item_id, item_filename), item_localsyncupstate = 4, item_file_id = NULL, item_doc_id = NULL, item_generation = NULL, item_bouncedname = NULL, item_filename = call_block(%p, item_id), item_staged_file_id = NULL, item_staged_generation = NULL, item_local_diffs = call_block(%p, item_local_diffs, zone_rowid), item_stat_ckinfo = call_block(%p, item_stat_ckinfo), version_ckinfo = call_block(%p, version_ckinfo), item_user_visible = 0  WHERE item_parent_id = %@ AND item_parent_zone_rowid = %@ AND item_state = 0 LIMIT %d", &v61, v19, &__block_literal_global_29, v20, v21, v22, v23, v25, v42];

  id v26 = [(BRCAccountSessionFPFS *)self->_session clientDB];
  uint64_t v27 = [v26 changes];

  if (v27 != [v47 count])
  {
    int v37 = brc_bread_crumbs();
    __int16 v38 = brc_default_log();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT)) {
      -[BRCFSImporter _markNextChildBatchDead:persistedState:batchSize:]();
    }
  }
  [v43 setNextNotifRank:v61];
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __66__BRCFSImporter__markNextChildBatchDead_persistedState_batchSize___block_invoke_91;
  v48[3] = &unk_265082788;
  v48[4] = self;
  id v28 = v40;
  id v49 = v28;
  id v29 = v39;
  id v50 = v29;
  [v47 enumerateKeysAndObjectsUsingBlock:v48];
  if (v27 == v41)
  {
    __int16 v30 = brc_bread_crumbs();
    id v31 = brc_default_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSImporter _markNextChildBatchDead:persistedState:batchSize:]();
    }

    id v32 = [v17 fileObjectID];
    currentPropagationObject = self->_currentPropagationObject;
    self->_currentPropagationObject = v32;

    self->_currentPropagationMinRowID = 0;
  }
  else
  {
    uint64_t v34 = brc_bread_crumbs();
    BOOL v35 = brc_default_log();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSImporter _markNextChildBatchDead:persistedState:batchSize:]();
    }

    int v36 = self->_currentPropagationObject;
    self->_currentPropagationObject = 0;

    self->_currentPropagationMinRowID = 0;
    [v17 markChildPropagationComplete];
    [v17 saveToDB];
  }

  _Block_object_dispose(v59, 8);
}

void __66__BRCFSImporter__markNextChildBatchDead_persistedState_batchSize___block_invoke(uint64_t a1, sqlite3_context *a2, int a3, uint64_t a4)
{
  if (a3 != 5)
  {
    id v19 = brc_bread_crumbs();
    id v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      __66__BRCFSImporter__markNextChildBatchDead_persistedState_batchSize___block_invoke_cold_1();
    }
  }
  unsigned __int8 v7 = sqlite3_value_int(*(sqlite3_value **)a4);
  id v8 = +[BRCItemID newFromSqliteValue:*(void *)(a4 + 24)];
  uint64_t v9 = [*(id *)(a1 + 32) _itemTypeToFileObjectIDType:(char)v7 itemID:v8];
  sqlite3_int64 v10 = sqlite3_value_int64(*(sqlite3_value **)(a4 + 8));
  sqlite3_int64 v11 = sqlite3_value_int64(*(sqlite3_value **)(a4 + 16));
  int v12 = (void *)[objc_alloc(MEMORY[0x263F325A8]) initWithRowID:v10 type:v9];
  BOOL v13 = [NSString stringWithUTF8String:sqlite3_value_text(*(sqlite3_value **)(a4 + 32))];
  BOOL v14 = objc_msgSend(v13, "br_pathExtension");
  if (v14)
  {
    [*(id *)(a1 + 40) setObject:v14 forKeyedSubscript:v12];
  }
  else
  {
    id v15 = [MEMORY[0x263EFF9D0] null];
    [*(id *)(a1 + 40) setObject:v15 forKeyedSubscript:v12];
  }
  if (v11 != *(void *)(a1 + 64))
  {
    uint64_t v16 = [NSNumber numberWithLongLong:v11];
    [*(id *)(a1 + 48) setObject:v16 forKeyedSubscript:v12];
  }
  if (v7 <= 0xAu && ((1 << v7) & 0x611) != 0)
  {
    uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
    sqlite3_int64 v18 = *(void *)(v17 + 24);
    *(void *)(v17 + 24) = v18 + 1;
    sqlite3_result_int64(a2, v18);
  }
  else
  {
    sqlite3_result_null(a2);
  }
}

void __66__BRCFSImporter__markNextChildBatchDead_persistedState_batchSize___block_invoke_84(uint64_t a1, sqlite3_context *a2, int a3, sqlite3_value **a4)
{
  if (a3 != 1)
  {
    uint64_t v16 = brc_bread_crumbs();
    uint64_t v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      __recursive_table_recreate_schema_block_invoke_cold_1();
    }
  }
  unsigned __int8 v7 = [*(id *)(a1 + 32) st];
  id v8 = [v7 ckInfo];
  char v9 = [v8 hasDeletionChangeToken];

  if (v9)
  {
    id v10 = +[BRFieldCKInfo newFromSqliteValue:*a4];
    sqlite3_int64 v11 = v10;
    if (v10)
    {
      if ([v10 hasDeletionChangeToken])
      {
        sqlite3_result_value(a2, *a4);
      }
      else
      {
        int v12 = [*(id *)(a1 + 32) st];
        BOOL v13 = [v12 ckInfo];
        BOOL v14 = [v13 deletionChangeToken];
        [v11 setDeletionChangeToken:v14];

        id v15 = [v11 data];
        sqlite3_result_blob(a2, (const void *)[v15 bytes], objc_msgSend(v15, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      }
    }
    else
    {
      sqlite3_result_null(a2);
    }
  }
  else
  {
    sqlite3_result_value(a2, *a4);
  }
}

void __66__BRCFSImporter__markNextChildBatchDead_persistedState_batchSize___block_invoke_86(uint64_t a1, sqlite3_context *a2, int a3, void *a4)
{
  if (a3 != 1)
  {
    id v8 = brc_bread_crumbs();
    char v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      __recursive_table_recreate_schema_block_invoke_cold_1();
    }
  }
  id v6 = +[BRCItemID newFromSqliteValue:*a4];
  id v7 = [v6 itemIDString];
  sqlite3_result_text(a2, (const char *)[v7 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

void __66__BRCFSImporter__markNextChildBatchDead_persistedState_batchSize___block_invoke_87(uint64_t a1, sqlite3_context *a2, int a3, sqlite3_value **a4)
{
  if (a3 != 2)
  {
    char v9 = brc_bread_crumbs();
    id v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      __br_update_tables_30_000_block_invoke_2_cold_2();
    }
  }
  sqlite3_int64 v7 = sqlite3_value_int64(*a4);
  if (sqlite3_value_int64(a4[1]) == *(void *)(a1 + 32)) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = v7 | 8;
  }
  sqlite3_result_int64(a2, v8 | 2);
}

void __66__BRCFSImporter__markNextChildBatchDead_persistedState_batchSize___block_invoke_91(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  sqlite3_int64 v7 = [*(id *)(*(void *)(a1 + 32) + 8) syncUpScheduler];
  objc_msgSend(v7, "createSyncUpJobForRowID:inZone:", objc_msgSend(v5, "rawID"), *(void *)(a1 + 40));

  uint64_t v8 = [*(id *)(a1 + 48) objectForKeyedSubscript:v5];
  if (v8)
  {
    char v9 = [*(id *)(*(void *)(a1 + 32) + 8) syncUpScheduler];
    objc_msgSend(v9, "createSyncUpJobForRowID:inZone:", objc_msgSend(v5, "rawID"), v8);
  }
  if ([v5 type] == 2)
  {
    id v10 = brc_bread_crumbs();
    sqlite3_int64 v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __66__BRCFSImporter__markNextChildBatchDead_persistedState_batchSize___block_invoke_91_cold_2();
    }

    int v12 = [*(id *)(*(void *)(a1 + 32) + 8) clientDB];
    BOOL v13 = [v5 itemDBRowID];
    [v12 execute:@"INSERT OR IGNORE INTO item_recursive_properties (item_rowid, item_id, item_parent_id, item_type, zone_rowid, item_parent_zone_rowid, needs_delete_doc_count, needs_sync_up_count) SELECT rowid, item_id, item_parent_id, item_type, zone_rowid, item_parent_zone_rowid, 0, 0 FROM client_items WHERE rowid = %@", v13];

    BOOL v14 = brc_bread_crumbs();
    id v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      __66__BRCFSImporter__markNextChildBatchDead_persistedState_batchSize___block_invoke_91_cold_1();
    }

    uint64_t v16 = [*(id *)(*(void *)(a1 + 32) + 8) clientDB];
    uint64_t v17 = [v5 itemDBRowID];
    [v16 execute:@"UPDATE item_recursive_properties SET needs_delete_doc_count =  1, needs_sync_up_count = 1 WHERE item_rowid = %@", v17];
  }
  sqlite3_int64 v18 = [v5 asString];
  id v19 = [MEMORY[0x263EFF9D0] null];
  if (v19 != v6)
  {
    uint64_t v20 = [v18 stringByAppendingPathExtension:v6];

    sqlite3_int64 v18 = (void *)v20;
  }

  int v21 = [*(id *)(*(void *)(a1 + 32) + 8) stageRegistry];
  [v21 unlinkLiveStageFilename:v18];
}

- (void)_propagateDirectoryMergeOrCrossZoneMove:(id)a3 persistedState:(id)a4 batchSize:(int)a5
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = [v7 clientZone];
  char v9 = [v8 dbRowID];
  id v10 = [v7 previousItemGlobalID];
  sqlite3_int64 v11 = [v10 zoneRowID];
  uint64_t v12 = objc_msgSend(v9, "br_isEqualToNumber:", v11);

  BOOL v13 = "cross-zone move";
  if (v12) {
    BOOL v13 = "directory merge";
  }
  id v43 = v13;
  BOOL v14 = brc_bread_crumbs();
  id v15 = brc_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    id v53 = v43;
    __int16 v54 = 2112;
    id v55 = v7;
    __int16 v56 = 2112;
    __int16 v57 = v14;
    _os_log_debug_impl(&dword_23FA42000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] Propagating %s of %@ to children%@", buf, 0x20u);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v16 = [v7 appLibrary];
  uint64_t v17 = [v7 previousItemGlobalID];
  int v41 = a5;
  uint64_t v42 = self;
  sqlite3_int64 v18 = [(BRCAccountSessionFPFS *)self->_session clientDB];
  id v19 = [v16 enumerateChildrenOfItemGlobalID:v17 sortOrder:0 offset:0 limit:a5 db:v18];

  id obj = v19;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    int v22 = 0;
    uint64_t v23 = *(void *)v48;
    uint64_t v45 = *(void *)v48;
    do
    {
      int v44 = v22;
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v48 != v23) {
          objc_enumerationMutation(obj);
        }
        id v25 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        id v26 = brc_bread_crumbs();
        uint64_t v27 = brc_default_log();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          id v53 = v43;
          __int16 v54 = 2112;
          id v55 = v25;
          __int16 v56 = 2112;
          __int16 v57 = v26;
          _os_log_debug_impl(&dword_23FA42000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] Propagating %s to item: %@%@", buf, 0x20u);
        }

        [v25 updateWithLogicalName:0 newParent:v7];
        if (v12)
        {
          id v28 = [v7 clientZone];
          id v29 = [v7 itemID];
          [v25 st];
          id v30 = v7;
          v32 = uint64_t v31 = v12;
          [v32 logicalName];
          uint64_t v34 = v33 = v21;
          int v35 = [v28 existsByParentID:v29 andLogicalName:v34];

          uint64_t v21 = v33;
          uint64_t v12 = v31;
          id v7 = v30;
          uint64_t v23 = v45;

          if (v35) {
            [v25 markBouncedToNextAvailableBounceNumber:509];
          }
        }
        [v25 saveToDB];
      }
      int v22 = v44 + v21;
      uint64_t v21 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
    }
    while (v21);
  }
  else
  {
    int v22 = 0;
  }

  if (v22 == v41)
  {
    uint64_t v36 = [v7 fileObjectID];
    currentPropagationObject = v42->_currentPropagationObject;
    v42->_currentPropagationObject = (BRFileObjectID *)v36;

    v42->_currentPropagationMinRowID = 0;
  }
  else
  {
    __int16 v38 = brc_bread_crumbs();
    id v39 = brc_default_log();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      id v53 = v43;
      __int16 v54 = 2112;
      id v55 = v7;
      __int16 v56 = 2112;
      __int16 v57 = v38;
      _os_log_debug_impl(&dword_23FA42000, v39, OS_LOG_TYPE_DEBUG, "[DEBUG] Finished propagating %s of %@ to children%@", buf, 0x20u);
    }

    __int16 v40 = v42->_currentPropagationObject;
    v42->_currentPropagationObject = 0;

    v42->_currentPropagationMinRowID = 0;
    [v7 markDirectoryMergeOrCrossZonePropagationComplete];
    [v7 markChildPropagationComplete];
    [v7 saveToDB];
  }
}

- (void)_propagateFieldsToNextChildBatch:(id)a3 persistedState:(id)a4 minRowID:(unint64_t)a5 batchSize:(int)a6
{
  uint64_t v154 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v82 = a4;
  char v9 = [v8 itemID];
  char v75 = [v9 isNonDesktopRoot];

  id v10 = [v8 itemID];
  char v71 = [v10 isDocumentsFolder];

  char v69 = [v8 sharingOptions];
  char v67 = [v8 itemScope];
  id v80 = [v8 appLibrary];
  char v65 = [v8 isUserVisible];
  sqlite3_int64 v11 = [v8 st];
  uint64_t v63 = [v11 logicalName];

  unint64_t v57 = [v8 localDiffs];
  if ([v8 isSharedToMe]) {
    BOOL v61 = ([v8 sharingOptions] & 0x20) == 0;
  }
  else {
    BOOL v61 = 0;
  }
  uint64_t v12 = objc_opt_new();
  BOOL v13 = objc_opt_new();
  BOOL v14 = objc_opt_new();
  id v15 = objc_opt_new();
  uint64_t v16 = objc_opt_new();
  id v59 = objc_alloc_init(MEMORY[0x263F089C8]);
  uint64_t v17 = [v80 dbRowID];
  uint64_t v78 = [v17 longLongValue];

  v151[0] = 0;
  v151[1] = v151;
  v151[2] = 0x2020000000;
  uint64_t v152 = 0;
  uint64_t v152 = brc_current_date_nsec();
  uint64_t v147 = 0;
  v148 = &v147;
  uint64_t v149 = 0x2020000000;
  uint64_t v150 = 0;
  uint64_t v150 = [v82 nextNotifRank];
  uint64_t v143 = 0;
  v144 = &v143;
  uint64_t v145 = 0x2020000000;
  uint64_t v146 = 0;
  v141[0] = 0;
  v141[1] = v141;
  v141[2] = 0x2020000000;
  char v142 = 0;
  sqlite3_int64 v18 = brc_bread_crumbs();
  id v19 = brc_default_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    -[BRCFSImporter _propagateFieldsToNextChildBatch:persistedState:minRowID:batchSize:]();
  }

  v138[0] = MEMORY[0x263EF8330];
  v138[1] = 3221225472;
  v138[2] = __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke;
  v138[3] = &unk_265082590;
  id v20 = v12;
  id v139 = v20;
  v140 = v141;
  __int16 v56 = (void *)MEMORY[0x2455D9A50](v138);
  v135[0] = MEMORY[0x263EF8330];
  v135[1] = 3221225472;
  v135[2] = __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_102;
  v135[3] = &unk_265082590;
  id v21 = v13;
  id v136 = v21;
  v137 = v141;
  id v55 = (void *)MEMORY[0x2455D9A50](v135);
  v132[0] = MEMORY[0x263EF8330];
  v132[1] = 3221225472;
  v132[2] = __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_103;
  v132[3] = &unk_265082590;
  id v22 = v14;
  id v133 = v22;
  long long v134 = v141;
  __int16 v54 = (void *)MEMORY[0x2455D9A50](v132);
  v129[0] = MEMORY[0x263EF8330];
  v129[1] = 3221225472;
  v129[2] = __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_104;
  v129[3] = &unk_265082590;
  id v23 = v16;
  id v130 = v23;
  v131 = v141;
  id v53 = (void *)MEMORY[0x2455D9A50](v129);
  v126[0] = MEMORY[0x263EF8330];
  v126[1] = 3221225472;
  v126[2] = __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_105;
  v126[3] = &unk_265082590;
  id v24 = v15;
  id v127 = v24;
  __int16 v128 = v141;
  id v52 = (void *)MEMORY[0x2455D9A50](v126);
  v123[0] = MEMORY[0x263EF8330];
  v123[1] = 3221225472;
  v123[2] = __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_106;
  v123[3] = &unk_2650827B0;
  BOOL v125 = v61;
  id v25 = v59;
  id v124 = v25;
  id v26 = (void *)MEMORY[0x2455D9A50](v123);
  v104[0] = MEMORY[0x263EF8330];
  v104[1] = 3221225472;
  v104[2] = __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_107;
  v104[3] = &unk_2650827D8;
  uint64_t v27 = (v57 >> 39) & 1;
  v113 = &v143;
  uint64_t v116 = v69 & 0x78;
  char v118 = v65;
  char v119 = v75;
  char v120 = v67;
  id v49 = v63;
  id v105 = v49;
  id v48 = v80;
  id v106 = v48;
  char v121 = v71;
  BOOL v122 = (v57 & 0x8000000000) != 0;
  id v81 = v25;
  id v107 = v81;
  v114 = v151;
  uint64_t v117 = v78;
  v115 = &v147;
  id v50 = v20;
  id v108 = v50;
  id v51 = v21;
  id v109 = v51;
  id v58 = v22;
  id v110 = v58;
  id v60 = v24;
  id v111 = v60;
  id v62 = v23;
  id v112 = v62;
  id v28 = (void *)MEMORY[0x2455D9A50](v104);
  id v29 = [(BRCAccountSessionFPFS *)self->_session clientDB];
  v90[0] = MEMORY[0x263EF8330];
  v90[1] = 3221225472;
  v90[2] = __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_109;
  v90[3] = &unk_265082800;
  id v64 = v56;
  id v92 = v64;
  id v66 = v55;
  id v93 = v66;
  id v68 = v54;
  id v94 = v68;
  uint64_t v100 = v78;
  id v70 = v53;
  id v95 = v70;
  id v72 = v52;
  id v96 = v72;
  id v76 = v26;
  id v97 = v76;
  char v103 = v27;
  id v30 = v8;
  id v91 = v30;
  unint64_t v101 = a5;
  int v102 = a6;
  id v79 = v28;
  id v98 = v79;
  v99 = v141;
  [v29 groupInTransaction:v90];

  uint64_t v31 = [(BRCAccountSessionFPFS *)self->_session clientDB];
  uint64_t v32 = [v31 changes];

  uint64_t v33 = v148[3];
  if (v33 != [v82 nextNotifRank])
  {
    uint64_t v34 = [v30 appLibrary];
    int v35 = [v34 hasActiveQueries];

    if (v35)
    {
      uint64_t v36 = [(BRCAccountSessionFPFS *)self->_session clientDB];
      uint64_t v37 = [v82 nextNotifRank];
      id v74 = (void *)[v36 fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation FROM client_items WHERE item_notifs_rank >= %lld AND item_notifs_rank < %lld ORDER BY item_notifs_rank", v37, v148[3], v48, v49, v50, v51];

      long long v88 = 0u;
      long long v89 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      v85[0] = MEMORY[0x263EF8330];
      v85[1] = 3221225472;
      v85[2] = __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_2;
      v85[3] = &unk_26507F1E8;
      v85[4] = self;
      __int16 v38 = [v74 enumerateObjects:v85];
      uint64_t v39 = [v38 countByEnumeratingWithState:&v86 objects:v153 count:16];
      if (v39)
      {
        uint64_t v40 = *(void *)v87;
        do
        {
          for (uint64_t i = 0; i != v39; ++i)
          {
            if (*(void *)v87 != v40) {
              objc_enumerationMutation(v38);
            }
            uint64_t v42 = +[BRCNotification notificationFromItem:*(void *)(*((void *)&v86 + 1) + 8 * i)];
            id v43 = [(BRCAccountSessionFPFS *)self->_session notificationManager];
            [v43 queueUpdate:v42];
          }
          uint64_t v39 = [v38 countByEnumeratingWithState:&v86 objects:v153 count:16];
        }
        while (v39);
      }
    }
    [v82 setNextNotifRank:v148[3]];
  }
  v83[0] = MEMORY[0x263EF8330];
  v83[1] = 3221225472;
  v83[2] = __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_3;
  v83[3] = &unk_265082828;
  v83[4] = self;
  id v44 = v30;
  id v84 = v44;
  [v81 enumerateIndexesUsingBlock:v83];
  if (v32 == a6)
  {
    uint64_t v45 = [v44 fileObjectID];
    currentPropagationObject = self->_currentPropagationObject;
    self->_currentPropagationObject = v45;

    self->_currentPropagationMinRowID = v144[3];
  }
  else
  {
    long long v47 = self->_currentPropagationObject;
    self->_currentPropagationObject = 0;

    self->_currentPropagationMinRowID = 0;
    [v44 markChildPropagationComplete];
    [v44 saveToDB];
  }

  _Block_object_dispose(v141, 8);
  _Block_object_dispose(&v143, 8);
  _Block_object_dispose(&v147, 8);
  _Block_object_dispose(v151, 8);
}

void __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke(uint64_t a1, sqlite3_context *a2, int a3, sqlite3_value **a4)
{
  if (a3 != 1)
  {
    BOOL v13 = brc_bread_crumbs();
    BOOL v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      __recursive_table_recreate_schema_block_invoke_cold_1();
    }
  }
  sqlite3_int64 v7 = sqlite3_value_int64(*a4);
  id v8 = *(void **)(a1 + 32);
  char v9 = [NSNumber numberWithUnsignedLongLong:v7];
  id v10 = [v8 objectForKeyedSubscript:v9];

  if (!v10)
  {
    sqlite3_int64 v11 = brc_bread_crumbs();
    uint64_t v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_cold_1();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  sqlite3_result_int(a2, [v10 intValue]);
}

void __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_102(uint64_t a1, sqlite3_context *a2, int a3, sqlite3_value **a4)
{
  if (a3 != 1)
  {
    BOOL v13 = brc_bread_crumbs();
    BOOL v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      __recursive_table_recreate_schema_block_invoke_cold_1();
    }
  }
  sqlite3_int64 v7 = sqlite3_value_int64(*a4);
  id v8 = *(void **)(a1 + 32);
  char v9 = [NSNumber numberWithUnsignedLongLong:v7];
  id v10 = [v8 objectForKeyedSubscript:v9];

  if (!v10)
  {
    sqlite3_int64 v11 = brc_bread_crumbs();
    uint64_t v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_102_cold_1();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  sqlite3_result_int(a2, [v10 intValue]);
}

void __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_103(uint64_t a1, sqlite3_context *a2, int a3, sqlite3_value **a4)
{
  if (a3 != 1)
  {
    BOOL v13 = brc_bread_crumbs();
    BOOL v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      __recursive_table_recreate_schema_block_invoke_cold_1();
    }
  }
  sqlite3_int64 v7 = sqlite3_value_int64(*a4);
  id v8 = *(void **)(a1 + 32);
  char v9 = [NSNumber numberWithUnsignedLongLong:v7];
  id v10 = [v8 objectForKeyedSubscript:v9];

  if (!v10)
  {
    sqlite3_int64 v11 = brc_bread_crumbs();
    uint64_t v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_103_cold_1();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  sqlite3_result_int(a2, [v10 intValue]);
}

void __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_104(uint64_t a1, sqlite3_context *a2, int a3, sqlite3_value **a4)
{
  if (a3 != 1)
  {
    BOOL v14 = brc_bread_crumbs();
    id v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      __recursive_table_recreate_schema_block_invoke_cold_1();
    }
  }
  sqlite3_int64 v7 = sqlite3_value_int64(*a4);
  id v8 = *(void **)(a1 + 32);
  char v9 = [NSNumber numberWithUnsignedLongLong:v7];
  id v10 = [v8 objectForKeyedSubscript:v9];

  if (!v10)
  {
    sqlite3_int64 v11 = brc_bread_crumbs();
    uint64_t v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_104_cold_1();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  sqlite3_int64 v13 = [v10 longLongValue];
  if (v13) {
    sqlite3_result_int64(a2, v13);
  }
  else {
    sqlite3_result_null(a2);
  }
}

void __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_105(uint64_t a1, sqlite3_context *a2, int a3, sqlite3_value **a4)
{
  if (a3 != 1)
  {
    sqlite3_int64 v13 = brc_bread_crumbs();
    BOOL v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      __recursive_table_recreate_schema_block_invoke_cold_1();
    }
  }
  sqlite3_int64 v7 = sqlite3_value_int64(*a4);
  id v8 = *(void **)(a1 + 32);
  char v9 = [NSNumber numberWithUnsignedLongLong:v7];
  id v10 = [v8 objectForKeyedSubscript:v9];

  if (!v10)
  {
    sqlite3_int64 v11 = brc_bread_crumbs();
    uint64_t v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_105_cold_1();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  sqlite3_result_int64(a2, [v10 longLongValue]);
}

void __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_106(uint64_t a1, sqlite3_context *a2, int a3, sqlite3_value **a4)
{
  if (a3 != 2)
  {
    sqlite3_int64 v13 = brc_bread_crumbs();
    BOOL v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      __br_update_tables_30_000_block_invoke_2_cold_2();
    }
  }
  sqlite3_int64 v7 = sqlite3_value_int64(*a4);
  if (*(unsigned char *)(a1 + 40)
    && (sqlite3_int64 v8 = v7,
        char v9 = (void *)[MEMORY[0x263F087E8] newFromSqliteValue:a4[1]],
        int v10 = objc_msgSend(v9, "br_isCloudDocsErrorCode:", 43),
        v9,
        v10))
  {
    sqlite3_int64 v11 = brc_bread_crumbs();
    uint64_t v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_106_cold_1();
    }

    sqlite3_result_null(a2);
    [*(id *)(a1 + 32) addIndex:v8];
  }
  else
  {
    sqlite3_result_value(a2, a4[1]);
  }
}

void __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_107(uint64_t a1, sqlite3_context *a2, int a3, uint64_t a4)
{
  if (a3 != 9)
  {
    id v29 = brc_bread_crumbs();
    id v30 = brc_default_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
      __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_107_cold_1();
    }
  }
  uint64_t v7 = sqlite3_value_int(*(sqlite3_value **)a4);
  int v8 = sqlite3_value_int(*(sqlite3_value **)(a4 + 8));
  int v35 = (void *)[NSString newFromSqliteValue:*(void *)(a4 + 16)];
  unsigned __int8 v9 = sqlite3_value_int(*(sqlite3_value **)(a4 + 24));
  sqlite3_int64 v10 = sqlite3_value_int64(*(sqlite3_value **)(a4 + 32));
  unsigned __int8 v11 = sqlite3_value_int(*(sqlite3_value **)(a4 + 40));
  sqlite3_int64 v31 = sqlite3_value_int64(*(sqlite3_value **)(a4 + 48));
  int v12 = sqlite3_value_int(*(sqlite3_value **)(a4 + 56));
  *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = sqlite3_value_int64(*(sqlite3_value **)(a4 + 64));
  sqlite3_int64 v13 = [NSNumber numberWithUnsignedLongLong:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)];
  uint64_t v34 = a2;
  unsigned __int8 v32 = v9;
  unsigned __int8 v33 = v11;
  int v14 = v8;
  if ((v7 & 4) != 0)
  {
    uint64_t v16 = v7 & 4;
    uint64_t v15 = v7;
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 120);
    uint64_t v16 = v15 & 4;
  }
  BOOL v17 = +[BRCLocalItem computeUserVisibleStatusOfLiveItemWithParentVisible:*(unsigned __int8 *)(a1 + 136) parentIsNonDesktopRoot:*(unsigned __int8 *)(a1 + 137) parentScope:*(unsigned __int8 *)(a1 + 138) itemFilename:v35 parentFilename:*(void *)(a1 + 32) appLibrary:*(void *)(a1 + 40)];
  uint64_t v18 = +[BRCLocalItem computeItemScopeFromParentIsRoot:*(unsigned __int8 *)(a1 + 137) parentIsDocuments:*(unsigned __int8 *)(a1 + 139) parentScope:*(unsigned __int8 *)(a1 + 138) logicalName:v35];
  if (v18 == 3 && v16) {
    objc_msgSend(*(id *)(a1 + 48), "addIndex:", objc_msgSend(v13, "longLongValue"));
  }
  if (v12 == 8) {
    objc_msgSend(*(id *)(a1 + 48), "addIndex:", objc_msgSend(v13, "longLongValue"));
  }
  if (v15 == v7 && (v14 == 0) != v17 && v18 == v32 && *(void *)(a1 + 128) == v10 && !*(unsigned char *)(a1 + 140))
  {
    uint64_t v19 = 0;
    int v23 = 0;
    sqlite3_int64 v22 = v31;
  }
  else
  {
    uint64_t v19 = 0;
    if (v33 <= 0xAu && ((1 << v33) & 0x611) != 0)
    {
      uint64_t v20 = *(void *)(*(void *)(a1 + 104) + 8);
      uint64_t v19 = *(void *)(v20 + 24);
      *(void *)(v20 + 24) = v19 + 1;
    }
    uint64_t v21 = *(void *)(*(void *)(a1 + 112) + 8);
    sqlite3_int64 v22 = *(void *)(v21 + 24);
    *(void *)(v21 + 24) = v22 + 1;
    int v23 = 1;
  }
  id v24 = [NSNumber numberWithUnsignedInteger:v15];
  [*(id *)(a1 + 56) setObject:v24 forKeyedSubscript:v13];

  id v25 = [NSNumber numberWithBool:v17];
  [*(id *)(a1 + 64) setObject:v25 forKeyedSubscript:v13];

  id v26 = [NSNumber numberWithUnsignedChar:v18];
  [*(id *)(a1 + 72) setObject:v26 forKeyedSubscript:v13];

  uint64_t v27 = [NSNumber numberWithUnsignedLongLong:v22];
  [*(id *)(a1 + 80) setObject:v27 forKeyedSubscript:v13];

  id v28 = [NSNumber numberWithLongLong:v19];
  [*(id *)(a1 + 88) setObject:v28 forKeyedSubscript:v13];

  sqlite3_result_int(v34, v23);
}

BOOL __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_109(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v18 = a2;
  BOOL v17 = (void *)MEMORY[0x2455D9A50](v3);
  uint64_t v16 = (void *)MEMORY[0x2455D9A50](*(void *)(a1 + 48));
  int v14 = (void *)MEMORY[0x2455D9A50](*(void *)(a1 + 56));
  uint64_t v15 = *(void *)(a1 + 104);
  unsigned int v4 = (void *)MEMORY[0x2455D9A50](*(void *)(a1 + 64));
  id v5 = (void *)MEMORY[0x2455D9A50](*(void *)(a1 + 72));
  id v6 = (void *)MEMORY[0x2455D9A50](*(void *)(a1 + 80));
  unint64_t v13 = (unint64_t)*(unsigned __int8 *)(a1 + 124) << 39;
  uint64_t v7 = [*(id *)(a1 + 32) itemID];
  int v8 = [*(id *)(a1 + 32) clientZone];
  unsigned __int8 v9 = [v8 dbRowID];
  uint64_t v10 = *(void *)(a1 + 112);
  unsigned __int8 v11 = (void *)MEMORY[0x2455D9A50](*(void *)(a1 + 88));
  LODWORD(v15) = [v18 execute:@"UPDATE client_items SET item_sharing_options = call_block(%p, rowid), item_user_visible = call_block(%p, rowid), item_scope = call_block(%p, rowid), app_library_rowid = %llu, item_processing_stamp = call_block(%p, rowid), item_notifs_rank = call_block(%p, rowid), version_upload_error = call_block(%p, rowid, version_upload_error), item_local_diffs = (item_local_diffs | %lld) WHERE item_parent_id = %@ AND item_parent_zone_rowid = %@ AND item_state = 0 AND rowid > %lld  AND call_block(%p, item_sharing_options, item_user_visible, item_filename, item_scope, app_library_rowid, item_type, item_notifs_rank, item_localsyncupstate, rowid) ORDER BY rowid LIMIT %d", v17, v16, v14, v15, v4, v5, v6, v13, v7, v9, v10, v11, *(unsigned int *)(a1 + 120)];

  return v15 && *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) == 0;
}

id __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  unsigned int v4 = *(void **)(*(void *)(a1 + 32) + 8);
  id v5 = a2;
  id v6 = [v4 clientDB];
  uint64_t v7 = (void *)[v4 newLocalItemFromPQLResultSet:v5 db:v6 error:a3];

  return v7;
}

void __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_3(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = (void *)MEMORY[0x2455D97F0]();
  id v5 = [*(id *)(*(void *)(a1 + 32) + 8) itemByRowID:a2];
  id v6 = [v5 st];
  uint64_t v7 = [v6 logicalName];
  [v5 updateWithLogicalName:v7 newParent:*(void *)(a1 + 40)];

  if ([v5 isInTrashScope] && objc_msgSend(v5, "isSharedToMeTopLevelItem")) {
    [v5 markRemovedFromFilesystemRecursively:1];
  }
  [v5 markNeedsUploadOrSyncingUp];
  [v5 saveToDB];
}

- (void)_processIngestBatch:(id)a3 minRowID:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = +[BRCUserDefaults defaultsForMangledID:0];
  int v8 = [v7 readerScanBatchSize];

  unsigned __int8 v9 = +[BRCPersistedState loadFromClientStateInSession:self->_session];
  uint64_t v10 = [(BRCAccountSessionFPFS *)self->_session clientDB];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __46__BRCFSImporter__processIngestBatch_minRowID___block_invoke;
  v13[3] = &unk_265082850;
  id v14 = v6;
  uint64_t v15 = self;
  int v18 = v8;
  id v16 = v9;
  unint64_t v17 = a4;
  id v11 = v9;
  id v12 = v6;
  [v10 groupInBatch:v13];
}

uint64_t __46__BRCFSImporter__processIngestBatch_minRowID___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isDead])
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v2 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(unsigned int *)(a1 + 64);
    return [v2 _markNextChildBatchDead:v3 persistedState:v4 batchSize:v5];
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) previousItemGlobalID];

    uint64_t v9 = *(void *)(a1 + 32);
    int v8 = *(void **)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    if (v7)
    {
      uint64_t v11 = *(unsigned int *)(a1 + 64);
      return [v8 _propagateDirectoryMergeOrCrossZoneMove:v9 persistedState:v10 batchSize:v11];
    }
    else
    {
      uint64_t v12 = *(void *)(a1 + 56);
      uint64_t v13 = *(unsigned int *)(a1 + 64);
      return [v8 _propagateFieldsToNextChildBatch:v9 persistedState:v10 minRowID:v12 batchSize:v13];
    }
  }
}

- (void)signal
{
}

- (void)resume
{
  [(BRCFairSource *)self->_childPropagationSource resume];
  childPropagationSource = self->_childPropagationSource;
  [(BRCFairSource *)childPropagationSource signal];
}

- (void)suspend
{
}

- (void)cancel
{
}

- (void)_childPropagationSchedule
{
  if (self->_currentPropagationObject
    && (-[BRCAccountSessionFPFS itemByFileObjectID:](self->_session, "itemByFileObjectID:"),
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        [v3 asDirectory],
        id v33 = (id)objc_claimAutoreleasedReturnValue(),
        v3,
        v33))
  {
    [(BRCFSImporter *)self _processIngestBatch:v33 minRowID:self->_currentPropagationMinRowID];
    [(BRCFairSource *)self->_childPropagationSource signal];
  }
  else
  {
    uint64_t v4 = +[BRCUserDefaults defaultsForMangledID:0];
    uint64_t v5 = [v4 maxSyncPathDepth];

    id v6 = [(BRCAccountSessionFPFS *)self->_session clientDB];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __42__BRCFSImporter__childPropagationSchedule__block_invoke;
    v34[3] = &unk_26507F1E8;
    v34[4] = self;
    uint64_t v7 = (void *)[v6 fetchObject:v34, @"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation FROM client_items WHERE item_processing_stamp IS NOT NULL ORDER BY item_processing_stamp ASC LIMIT 1" sql];
    int v8 = [v7 asDirectory];

    if (v8)
    {
      uint64_t v9 = [(BRCAccountSessionFPFS *)self->_session clientDB];
      uint64_t v10 = [v8 st];
      uint64_t v11 = [v10 parentID];
      uint64_t v12 = [v8 parentClientZone];
      uint64_t v13 = [v12 dbRowID];
      id v14 = (void *)[v9 fetch:@"WITH RECURSIVE item_parents  (rowid, item_parent_id, item_parent_zone_rowid, item_state, item_processing_stamp) AS( SELECT rowid, item_parent_id, item_parent_zone_rowid, item_state, item_processing_stamp FROM client_items      WHERE item_id = %@ AND zone_rowid = %@  UNION ALL     SELECT li.rowid, li.item_parent_id, li.item_parent_zone_rowid, li.item_state, li.item_processing_stamp FROM client_items AS li  INNER JOIN item_parents AS p WHERE p.item_parent_id = li.item_id AND p.item_parent_zone_rowid = li.zone_rowid      LIMIT %u) SELECT rowid, item_processing_stamp FROM item_parents WHERE item_processing_stamp IS NOT NULL", v11, v13, v5];

      uint64_t v15 = objc_opt_new();
      id v16 = objc_opt_new();
      if ([v14 next])
      {
        do
        {
          unint64_t v17 = (void *)MEMORY[0x2455D97F0]();
          int v18 = [v14 numberAtIndex:0];
          uint64_t v19 = [v14 numberAtIndex:1];
          [v15 insertObject:v18 atIndex:0];
          [v16 insertObject:v19 atIndex:0];
        }
        while (([v14 next] & 1) != 0);
      }
      if ([v16 count])
      {
        uint64_t v20 = [v16 objectAtIndexedSubscript:0];
        unint64_t v21 = [v20 unsignedLongLongValue];
      }
      else
      {
        unint64_t v21 = 0;
      }
      if ((unint64_t)[v15 count] >= 2)
      {
        unint64_t v22 = 1;
        do
        {
          int v23 = [v16 objectAtIndexedSubscript:v22];
          unint64_t v24 = [v23 unsignedLongLongValue];

          if (v24 >= v21)
          {
            unint64_t v21 = v24 + 1;
          }
          else
          {
            if (v21 < 0x7FFFFFFFFFFFFFFFLL) {
              ++v21;
            }
            else {
              unint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
            }
            id v25 = [(BRCAccountSessionFPFS *)self->_session clientDB];
            id v26 = [v15 objectAtIndexedSubscript:v22];
            objc_msgSend(v25, "execute:", @"UPDATE client_items SET item_processing_stamp = %lld WHERE rowid = %llu", v21, objc_msgSend(v26, "unsignedLongLongValue"));
          }
          ++v22;
        }
        while (v22 < [v15 count]);
      }
      if ([v15 count])
      {
        session = self->_session;
        id v28 = [v15 objectAtIndexedSubscript:0];
        id v29 = -[BRCAccountSessionFPFS itemByRowID:](session, "itemByRowID:", [v28 unsignedLongLongValue]);
        id v30 = [v29 asDirectory];
      }
      else
      {
        id v30 = v8;
      }
      sqlite3_int64 v31 = [v30 fileObjectID];
      currentPropagationObject = self->_currentPropagationObject;
      self->_currentPropagationObject = v31;

      [(BRCFSImporter *)self _processIngestBatch:v30 minRowID:0];
      [(BRCFairSource *)self->_childPropagationSource signal];
    }
    else
    {
      [(BRCFSImporter *)self _cleanItemBatchAfterMigrationToFPFSIfNecessary];
    }
  }
}

id __42__BRCFSImporter__childPropagationSchedule__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8);
  id v5 = a2;
  id v6 = [v4 clientDB];
  uint64_t v7 = (void *)[v4 newLocalItemFromPQLResultSet:v5 db:v6 error:a3];

  return v7;
}

- (BOOL)_doesAppLibraryMatchWithItemURL:(id)a3 appLibraryRowID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    int v8 = [(BRCAccountSessionFPFS *)self->_session appLibraryByRowID:v7];
    uint64_t v9 = [v8 mangledID];

    id v10 = objc_alloc(MEMORY[0x263F325E0]);
    uint64_t v11 = objc_msgSend(v6, "br_containerID");
    uint64_t v12 = (void *)[v10 initWithAppLibraryName:v11];

    char v13 = 0;
    if (v9 && v12) {
      char v13 = [v12 isEqualToMangledID:v9];
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (void)_cleanItemBatchAfterMigrationToFPFSIfNecessary
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Done scanning for now%@", v2, v3, v4, v5, v6);
}

uint64_t __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = v3;
  if (!*(void *)(a1 + 136))
  {
    dropFPFSMigrationTablesWithDB(v3);
    if ([*(id *)(a1 + 32) filterDecendantsOfNotMigratedFolders]) {
      fillFPFSMigrationNonMigratedFoldersTable(v4);
    }
  }
  v72[0] = MEMORY[0x263EF8330];
  v72[1] = 3221225472;
  v72[2] = __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke_2;
  v72[3] = &unk_26507F148;
  id v73 = *(id *)(a1 + 40);
  uint64_t v5 = (void *)MEMORY[0x2455D9A50](v72);
  uint64_t v68 = 0;
  char v69 = &v68;
  uint64_t v70 = 0x2020000000;
  uint64_t v71 = 0;
  v60[0] = MEMORY[0x263EF8330];
  v60[1] = 3221225472;
  v60[2] = __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke_141;
  v60[3] = &unk_265082878;
  id v66 = &v68;
  id v61 = *(id *)(a1 + 48);
  id v62 = *(id *)(a1 + 32);
  id v63 = *(id *)(a1 + 56);
  long long v67 = *(_OWORD *)(a1 + 88);
  id v64 = *(id *)(a1 + 64);
  id v65 = *(id *)(a1 + 72);
  uint8_t v6 = (void *)MEMORY[0x2455D9A50](v60);
  id v7 = (void *)MEMORY[0x2455D9A50](v5);
  int v8 = (void *)MEMORY[0x2455D9A50](v5);
  uint64_t v9 = (void *)MEMORY[0x2455D9A50](v6);
  [v4 execute:@"UPDATE client_items SET item_file_id = call_block(%p, item_file_id, item_type, item_localsyncupstate, rowid, item_generation, item_local_diffs, item_doc_id, app_library_rowid), item_generation = call_block(%p, item_generation, item_type, item_localsyncupstate), item_localsyncupstate = call_block(%p, item_localsyncupstate, rowid, item_stat_ckinfo IS NULL, item_type, item_birthtime, item_id, item_filename, version_content_signature, item_parent_zone_rowid, item_parent_id), item_doc_id = NULL WHERE rowid > %llu ORDER BY rowid ASC LIMIT %llu", v7, v8, v9, *(void *)(a1 + 136), *(void *)(a1 + 144)];

  id v10 = [v4 lastError];

  if (v10)
  {
    brc_bread_crumbs();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = brc_default_log();
    if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
    {
      char v13 = [v4 lastError];
      __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke_cold_3(v13, (uint64_t)v11, (uint64_t)v77, v12);
    }

LABEL_8:
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v42 = [v4 changes];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v11 = *(id *)(a1 + 64);
    uint64_t v16 = [v11 countByEnumeratingWithState:&v56 objects:v76 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v57;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v57 != v17) {
            objc_enumerationMutation(v11);
          }
          uint64_t v19 = objc_msgSend(*(id *)(a1 + 72), "itemByRowID:", objc_msgSend(*(id *)(*((void *)&v56 + 1) + 8 * i), "unsignedLongLongValue"));
          uint64_t v20 = v19;
          if (!v19)
          {
            uint64_t v40 = brc_bread_crumbs();
            int v41 = brc_default_log();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT)) {
              __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke_cold_2();
            }

            goto LABEL_8;
          }
          [v19 markNeedsUploadOrSyncingUp];
          int v21 = [v20 saveToDB];

          if (!v21) {
            goto LABEL_8;
          }
        }
        uint64_t v16 = [v11 countByEnumeratingWithState:&v56 objects:v76 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

    if ([*(id *)(a1 + 32) filterDecendantsOfNotMigratedFolders]
      && isFPFSMigrationNonMigratedFoldersExists(v4, v22))
    {
      int v23 = *(void **)(a1 + 56);
      v52[0] = MEMORY[0x263EF8330];
      v52[1] = 3221225472;
      v52[2] = __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke_148;
      v52[3] = &unk_2650828A0;
      id v53 = v4;
      id v24 = *(id *)(a1 + 48);
      uint64_t v25 = *(void *)(a1 + 104);
      id v54 = v24;
      uint64_t v55 = v25;
      [v23 enumerateKeysAndObjectsUsingBlock:v52];
    }
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke_153;
    v43[3] = &unk_2650828C8;
    id v26 = *(void **)(a1 + 48);
    id v27 = *(id *)(a1 + 40);
    uint64_t v28 = *(void *)(a1 + 112);
    id v44 = v27;
    uint64_t v47 = v28;
    uint64_t v50 = *(void *)(a1 + 152);
    id v29 = *(id *)(a1 + 72);
    int8x16_t v30 = vextq_s8(*(int8x16_t *)(a1 + 88), *(int8x16_t *)(a1 + 88), 8uLL);
    uint64_t v51 = *(void *)(a1 + 160);
    uint64_t v31 = *(void *)(a1 + 80);
    id v45 = v29;
    uint64_t v46 = v31;
    long long v32 = *(_OWORD *)(a1 + 120);
    int8x16_t v48 = v30;
    long long v49 = v32;
    [v26 enumerateKeysAndObjectsUsingBlock:v43];
    id v33 = brc_bread_crumbs();
    uint64_t v34 = brc_default_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
      __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke_cold_1();
    }

    [*(id *)(a1 + 72) updateFPFSMigrationCleanupLastRowID:v69[3] lostItemCount:*(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 24) childLostItemCount:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) busyDateLostItemCount:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) ignoredFromSyncLostItemCount:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) investigatedItemsCount:*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) notMigratedItems:*(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 40)];
    if (v42 < *(void *)(a1 + 144))
    {
      int v35 = NSNumber;
      uint64_t v36 = [NSNumber numberWithUnsignedLongLong:*(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 24)];
      uint64_t v37 = objc_msgSend(v35, "numberWithLongLong:", objc_msgSend(v36, "br_roundedLongLongValue"));

      v74[0] = @"ProcessingComplete";
      v74[1] = @"LostItemCount";
      v75[0] = MEMORY[0x263EFFA88];
      v75[1] = v37;
      __int16 v38 = [NSDictionary dictionaryWithObjects:v75 forKeys:v74 count:2];
      AnalyticsSendEvent();

      uint64_t v39 = [*(id *)(a1 + 72) applyScheduler];
      [v39 rescheduleAllItemsPendingMigration];

      [*(id *)(a1 + 72) sendNonMigratedItemTelemetryWithfileIDs:*(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 40)];
      [*(id *)(a1 + 72) markMigrationToFPFSCleanupComplete];
      dropFPFSMigrationNonMigratedFoldersTable(v4);
    }
    uint64_t v14 = 1;
    id v11 = v44;
  }

  _Block_object_dispose(&v68, 8);
  return v14;
}

void __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke_2(uint64_t a1, sqlite3_context *a2, int a3, sqlite3_value **a4)
{
  v30[5] = *MEMORY[0x263EF8340];
  if (a3 != 3 && a3 != 8)
  {
    int v8 = brc_bread_crumbs();
    uint64_t v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke_2_cold_1();
    }
  }
  int v10 = sqlite3_value_int(a4[1]);
  unsigned int v11 = sqlite3_value_int(a4[2]);
  if (a3 == 8)
  {
    sqlite3_int64 v29 = sqlite3_value_int64(a4[3]);
    sqlite3_int64 v12 = sqlite3_value_int64(*a4);
    sqlite3_int64 v13 = sqlite3_value_int64(a4[4]);
    sqlite3_int64 v14 = sqlite3_value_int64(a4[5]);
    sqlite3_int64 v15 = sqlite3_value_int64(a4[6]);
    sqlite3_int64 v16 = sqlite3_value_int64(a4[7]);
    if (v12)
    {
      sqlite3_int64 v17 = v16;
      id v27 = *(void **)(a1 + 32);
      uint64_t v28 = a2;
      int v18 = [NSNumber numberWithUnsignedLongLong:v12];
      v30[0] = v18;
      uint64_t v19 = [NSNumber numberWithUnsignedLongLong:v13];
      v30[1] = v19;
      uint64_t v20 = [NSNumber numberWithUnsignedLongLong:v14];
      v30[2] = v20;
      int v21 = [NSNumber numberWithUnsignedLongLong:v15];
      v30[3] = v21;
      unint64_t v22 = [NSNumber numberWithUnsignedLongLong:v17];
      v30[4] = v22;
      int v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:5];
      id v24 = [NSNumber numberWithUnsignedLongLong:v29];
      [v27 setObject:v23 forKey:v24];

      a2 = v28;
    }
  }
  BOOL v25 = (v10 - 3) >= 0xFFFFFFFE || v10 == 8;
  if (v25 && (v11 <= 6 ? (BOOL v26 = ((1 << v11) & 0x63) == 0) : (BOOL v26 = 1), v26)) {
    sqlite3_result_value(a2, *a4);
  }
  else {
    sqlite3_result_null(a2);
  }
}

void __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke_141(uint64_t a1, sqlite3_context *a2, int a3, uint64_t a4)
{
  if (a3 != 10)
  {
    int v41 = brc_bread_crumbs();
    uint64_t v42 = brc_default_log();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT)) {
      __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke_141_cold_2();
    }
  }
  int v7 = sqlite3_value_int(*(sqlite3_value **)a4);
  unint64_t v8 = sqlite3_value_int64(*(sqlite3_value **)(a4 + 8));
  unint64_t v9 = v8;
  uint64_t v10 = *(void *)(*(void *)(a1 + 72) + 8);
  if (v8 > *(void *)(v10 + 24)) {
    *(void *)(v10 + 24) = v8;
  }
  char v11 = sqlite3_value_int(*(sqlite3_value **)(a4 + 24));
  sqlite3_int64 v12 = sqlite3_value_int64(*(sqlite3_value **)(a4 + 32));
  if (v7 == 6)
  {
    int v23 = brc_bread_crumbs();
    id v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke_141_cold_1();
    }

    [*(id *)(a1 + 64) updateFPFSMigrationNonMigratedTypes:v11];
    BOOL v25 = a2;
    int v26 = 1;
    goto LABEL_15;
  }
  if (v7 != 5)
  {
    BOOL v25 = a2;
    int v26 = v7;
LABEL_15:
    sqlite3_result_int(v25, v26);
    return;
  }
  uint64_t v13 = v12;
  BOOL v14 = +[BRCItemID isDocumentsItemIDWithSQLiteValue:*(void *)(a4 + 40)];
  sqlite3_int64 v15 = [NSString stringWithUTF8String:sqlite3_value_text(*(sqlite3_value **)(a4 + 48))];
  id v16 = objc_alloc(MEMORY[0x263EFF8F8]);
  sqlite3_int64 v17 = sqlite3_value_blob(*(sqlite3_value **)(a4 + 56));
  int v18 = (void *)[v16 initWithBytesNoCopy:v17 length:sqlite3_value_bytes(*(sqlite3_value **)(a4 + 56)) freeWhenDone:0];
  uint64_t v19 = v18;
  uint64_t v20 = 0;
  if (v11 == 1) {
    uint64_t v20 = objc_msgSend(v18, "brc_signatureIsPackage") ^ 1;
  }
  int busy = BRCIsBusyDate(v13);
  if (((busy | v14) & 1) == 0)
  {
    BOOL v27 = +[BRCImportUtil isFileNameIgnoredForSync:v15 isRegFile:v20];
    if (![v15 length] || !v27)
    {
      id v43 = *(void **)(a1 + 32);
      uint64_t v28 = (void *)MEMORY[0x263F325F0];
      sqlite3_int64 v29 = [NSNumber numberWithBool:v20];
      int8x16_t v30 = [NSNumber numberWithChar:v11];
      uint64_t v31 = [v28 pairWithLeft:v29 andRight:v30];
      long long v32 = [NSNumber numberWithUnsignedLongLong:v9];
      [v43 setObject:v31 forKey:v32];

      if ([*(id *)(a1 + 40) filterDecendantsOfNotMigratedFolders])
      {
        sqlite3_int64 v33 = sqlite3_value_int64(*(sqlite3_value **)(a4 + 64));
        id v34 = +[BRCItemID newFromSqliteValue:*(void *)(a4 + 72)];
        id v44 = *(void **)(a1 + 48);
        int v35 = [BRCItemGlobalID alloc];
        uint64_t v36 = [NSNumber numberWithUnsignedLongLong:v33];
        uint64_t v37 = [(BRCItemGlobalID *)v35 initWithZoneRowID:v36 itemID:v34];
        __int16 v38 = [NSNumber numberWithUnsignedLongLong:v9];
        [v44 setObject:v37 forKey:v38];
      }
      goto LABEL_22;
    }
    uint64_t v22 = *(void *)(a1 + 80);
    goto LABEL_19;
  }
  if (busy)
  {
    uint64_t v22 = *(void *)(a1 + 88);
LABEL_19:
    ++*(void *)(*(void *)(v22 + 8) + 24);
  }
LABEL_22:
  sqlite3_result_int(a2, 0);
  if (sqlite3_value_int(*(sqlite3_value **)(a4 + 16)))
  {
    uint64_t v39 = *(void **)(a1 + 56);
    uint64_t v40 = [NSNumber numberWithUnsignedLongLong:v9];
    [v39 addObject:v40];
  }
}

void __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke_148(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = *(void **)(a1 + 32);
  unint64_t v8 = [v6 itemID];
  unint64_t v9 = [v6 zoneRowID];
  uint64_t v10 = (void *)[v7 numberWithSQL:@"SELECT 1 from fpfs_folders_not_migrated WHERE item_id = %@ and zone_rowid = %@", v8, v9];
  int v11 = [v10 BOOLValue];

  if (v11)
  {
    [*(id *)(a1 + 40) removeObjectForKey:v5];
    sqlite3_int64 v12 = brc_bread_crumbs();
    uint64_t v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v15 = v5;
      __int16 v16 = 2112;
      id v17 = v6;
      __int16 v18 = 2112;
      uint64_t v19 = v12;
      _os_log_impl(&dword_23FA42000, v13, OS_LOG_TYPE_DEFAULT, "[NOTICE] item with rowID %@ was not migrated but it's parent %@ was also not migrated%@", buf, 0x20u);
    }

    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
}

void __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke_153(uint64_t a1, void *a2, void *a3)
{
  v40[5] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  id v7 = a3;
  unint64_t v8 = [v6 objectForKey:v5];
  unint64_t v9 = [v8 objectAtIndexedSubscript:0];

  uint64_t v10 = [*(id *)(a1 + 32) objectForKey:v5];
  int v11 = [v10 objectAtIndexedSubscript:3];

  sqlite3_int64 v12 = [v7 left];
  uint64_t v13 = [v12 BOOLValue];

  BOOL v14 = [v7 right];

  char v15 = [v14 intValue];
  uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
  unint64_t v17 = *(void *)(v16 + 24);
  if (v17 > *(void *)(a1 + 96) || v9 == 0)
  {
    uint64_t v19 = brc_bread_crumbs();
    uint64_t v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke_153_cold_1();
    }

    id v27 = 0;
    goto LABEL_9;
  }
  *(void *)(v16 + 24) = v17 + 1;
  __int16 v39 = 0;
  int v23 = NSNumber;
  id v24 = [*(id *)(a1 + 40) volume];
  BOOL v25 = objc_msgSend(v23, "numberWithInt:", objc_msgSend(v24, "deviceID"));
  id v38 = 0;
  BOOL v26 = +[BRCImportUtil shouldFileIDBeIgnoredAsNonMigrated:v9 docID:v11 deviceID:v25 isRegFile:v13 rowid:v5 outItemURL:&v38 isBusyDate:(char *)&v39 + 1 isIgnoredFromSync:&v39];
  id v27 = v38;

  if (!v26)
  {
    uint64_t v28 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    if (v28 && (unint64_t)[v28 count] < *(void *)(a1 + 104))
    {
      uint64_t v36 = [*(id *)(a1 + 32) objectForKey:v5];
      uint64_t v37 = [v36 objectAtIndexedSubscript:1];
      int v35 = [v36 objectAtIndexedSubscript:2];
      sqlite3_int64 v29 = *(void **)(a1 + 48);
      int8x16_t v30 = [v36 objectAtIndexedSubscript:4];
      uint64_t v31 = [v29 _doesAppLibraryMatchWithItemURL:v27 appLibraryRowID:v30];

      id v34 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
      v40[0] = v5;
      v40[1] = v37;
      v40[2] = v35;
      v40[3] = v11;
      long long v32 = [NSNumber numberWithBool:v31];
      v40[4] = v32;
      sqlite3_int64 v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:5];
      [v34 setObject:v33 forKey:v9];
    }
LABEL_9:
    ++*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
    if (v15 == 1) {
      char v21 = v13;
    }
    else {
      char v21 = 1;
    }
    uint64_t v22 = *(void **)(a1 + 40);
    if (v21) {
      [v22 updateFPFSMigrationNonMigratedTypes:v15];
    }
    else {
      [v22 updateFPFSMigrationNonMigratedTypesWithPackage];
    }
    goto LABEL_20;
  }
  if (HIBYTE(v39)) {
    ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  }
  if ((_BYTE)v39) {
    ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  }
LABEL_20:
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPropagationObject, 0);
  objc_storeStrong((id *)&self->_childPropagationSource, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)_createBaseItemWithImportObject:importBookmark:parentItem:options:error:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Marking desktop or documents item as from initial scan %@ to avoid bounce%@");
}

- (void)_createBaseItemWithImportObject:importBookmark:parentItem:options:error:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Marking user invisible item as from initial scan %@ to avoid bounce%@");
}

- (void)_createBaseItemWithImportObject:importBookmark:parentItem:options:error:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: Can't import br aliases anymore %@%@");
}

- (void)_createBaseItemWithImportObject:importBookmark:parentItem:options:error:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: Import object of unknown type %@%@");
}

- (void)_globalItemByDocumentID:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Returning nil when looking up by documentID and no migration is in progress%@", v2, v3, v4, v5, v6);
}

- (void)_globalItemByFileID:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Returning nil when looking up by fileID and no migration is in progress%@", v2, v3, v4, v5, v6);
}

- (void)capabilityToMoveItem:toNewParentItem:error:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: !parent.isOwnedByMe%@", v2, v3, v4, v5, v6);
}

- (void)capabilityToMoveItem:toNewParentItem:error:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Allowing move of top level folder share item %@%@");
}

- (void)_reportBouncingForMigration:existingItem:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Going to insert bounced folder into fpfs_folders_not_migrated: %@%@");
}

- (void)_parseImportBookmark:templateItem:fileURL:ignoreImportBookmark:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_2(&dword_23FA42000, v0, (uint64_t)v0, "[ERROR] Can't find a parent for trashed item %@%@", v1);
}

- (void)_parseImportBookmark:templateItem:fileURL:ignoreImportBookmark:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Found shared item by bookmark data %@%@");
}

- (void)_locateTemplateItemFromFPFSMigration:fields:documentHasChanges:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Found existing item by fileID %@%@");
}

- (void)_locateTemplateItemFromFPFSMigration:fields:documentHasChanges:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Found existing item by docID %@%@");
}

- (void)_locateTemplateItemFromFPFSMigration:fields:documentHasChanges:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Existing item isn't a document! %@%@");
}

- (void)_handleCollisionIfNecessaryWithTemplateItem:parentItem:logicalName:fileURL:options:error:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Found a colliding item that has the same FP item identifier, returning it - %@%@");
}

- (void)_locateMatchingItemForTemplateItem:(uint64_t)a1 parentItem:options:fileURL:fields:shouldReject:additionalAttrs:importBookmark:ignoreImportBookmark:stillPendingFields:error:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(*(void *)a1 + 40);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v1, v2, "[CRIT] UNREACHABLE: Child of readonly share path-match should always already exist - %@%@", (void)v3, DWORD2(v3));
}

- (void)_locateMatchingItemForTemplateItem:(uint64_t)a1 parentItem:options:fileURL:fields:shouldReject:additionalAttrs:importBookmark:ignoreImportBookmark:stillPendingFields:error:.cold.2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(*(void *)a1 + 40);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] forcing child of read-only share to match what exists in our db %@%@", (void)v3, DWORD2(v3));
}

- (void)_locateMatchingItemForTemplateItem:parentItem:options:fileURL:fields:shouldReject:additionalAttrs:importBookmark:ignoreImportBookmark:stillPendingFields:error:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Item doesn't appear to be edited so stripping the content edited bit for %@%@");
}

- (void)_locateMatchingItemForTemplateItem:parentItem:options:fileURL:fields:shouldReject:additionalAttrs:importBookmark:ignoreImportBookmark:stillPendingFields:error:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: options & NSFileProviderCreateItemMayAlreadyExist%@", v2, v3, v4, v5, v6);
}

void __160__BRCFSImporter__createAndInsertNewItemWithImportObject_parentItem_fields_templateItem_fileURL_options_additionalAttrs_importBookmark_stillPendingFields_error___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v3 = 136315906;
  uint64_t v4 = "-[BRCFSImporter _createAndInsertNewItemWithImportObject:parentItem:fields:templateItem:fileURL:options:additional"
       "Attrs:importBookmark:stillPendingFields:error:]_block_invoke";
  __int16 v5 = 2080;
  uint8_t v6 = "(passed to caller)";
  __int16 v7 = 2112;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_23FA42000, log, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", (uint8_t *)&v3, 0x2Au);
}

void __160__BRCFSImporter__createAndInsertNewItemWithImportObject_parentItem_fields_templateItem_fileURL_options_additionalAttrs_importBookmark_stillPendingFields_error___block_invoke_cold_2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(*(void *)(*(void *)a1 + 8) + 40);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] Found existing documents folder %@%@", (void)v3, DWORD2(v3));
}

void __160__BRCFSImporter__createAndInsertNewItemWithImportObject_parentItem_fields_templateItem_fileURL_options_additionalAttrs_importBookmark_stillPendingFields_error___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: We shouldn't have an existing documents folder%@", v2, v3, v4, v5, v6);
}

- (void)importNewItemAtURL:parentItem:templateItem:fields:options:additionalItemAttributes:importBookmark:stillPendingFields:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_2(&dword_23FA42000, v0, (uint64_t)v0, "[ERROR] Received item with unexpected type and no content %@. Rejecting it%@", v1);
}

- (void)createAndImportNewDirectoryWithLogicalName:parentItem:error:.cold.1()
{
}

- (void)getOrCreateTrashItemInAppLibrary:error:.cold.1()
{
  OUTLINED_FUNCTION_12();
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = [v1 mangledID];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_2(&dword_23FA42000, v0, v3, "[ERROR] Failed to create documents folder for app library %@%@", v4);
}

- (void)getOrCreateTrashItemInAppLibrary:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: appLibrary.db.isBatchSuspended%@", v2, v3, v4, v5, v6);
}

- (void)trashItem:parentItemInTrash:error:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] item after trash: %@%@");
}

- (void)trashItem:parentItemInTrash:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: parentItemInTrash.itemScope == BRC_ITEM_SCOPE_TRASH%@", v2, v3, v4, v5, v6);
}

- (void)trashItem:parentItemInTrash:error:.cold.3()
{
  OUTLINED_FUNCTION_12();
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = [v1 appLibrary];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_23FA42000, v0, v3, "[DEBUG] could not find trash item for app library: %@%@", v4);
}

- (void)trashItem:parentItemInTrash:error:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _session.clientDB.isInTransaction%@", v2, v3, v4, v5, v6);
}

- (void)_processParentAndFilenameIfNecessaryWithLocalItem:changedFields:templateItem:error:.cold.1()
{
  OUTLINED_FUNCTION_12();
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = [v1 parentItemIdentifier];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_23FA42000, v0, v3, "[DEBUG] Parent item remotely deleted: %@%@", v4);
}

- (void)_processParentAndFilenameIfNecessaryWithLocalItem:changedFields:templateItem:error:.cold.2()
{
  OUTLINED_FUNCTION_12();
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = [v1 parentItemIdentifier];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_23FA42000, v0, v3, "[DEBUG] Failed to find parent with item identifier: %@%@", v4);
}

- (void)_processParentAndFilenameIfNecessaryWithLocalItem:changedFields:templateItem:error:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: li.isInTrashScope%@", v2, v3, v4, v5, v6);
}

- (void)_processParentAndFilenameIfNecessaryWithLocalItem:changedFields:templateItem:error:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Received a reparent request to the root item. Overwriting to the app library documents directory%@", v2, v3, v4, v5, v6);
}

- (void)changeItem:baseVersion:changedFields:newValues:contents:additionalAttrs:clearCKInfoOnSyncUp:stillPendingFields:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] We can't save a zone root so don't modify it%@", v2, v3, v4, v5, v6);
}

- (void)changeItem:baseVersion:changedFields:newValues:contents:additionalAttrs:clearCKInfoOnSyncUp:stillPendingFields:error:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] We can't update a share acceptation fault %@%@");
}

- (void)changeItem:baseVersion:changedFields:newValues:contents:additionalAttrs:clearCKInfoOnSyncUp:stillPendingFields:error:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Marking %@ as forgotten because we matched based on template%@");
}

- (void)changeItem:baseVersion:changedFields:newValues:contents:additionalAttrs:clearCKInfoOnSyncUp:stillPendingFields:error:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: li.isDocument%@", v2, v3, v4, v5, v6);
}

- (void)changeItem:baseVersion:changedFields:newValues:contents:additionalAttrs:clearCKInfoOnSyncUp:stillPendingFields:error:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Attempting to rename/reparent/trash special folder: undoing this operation on %@%@");
}

void __58__BRCFSImporter_deleteItem_recursively_baseVersion_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: Failed to save to db without an error%@", v2, v3, v4, v5, v6);
}

- (void)_markNextChildBatchDead:persistedState:batchSize:.cold.1()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Propagating removal to %llu dead children%@");
}

- (void)_markNextChildBatchDead:persistedState:batchSize:.cold.2()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Finished propagating removal to %llu dead children%@");
}

- (void)_markNextChildBatchDead:persistedState:batchSize:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: changes == (int64_t)newlyDeadFileObjectIDsToExtension.count%@", v2, v3, v4, v5, v6);
}

- (void)_markNextChildBatchDead:persistedState:batchSize:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Marking next child batch dead for %@%@");
}

void __66__BRCFSImporter__markNextChildBatchDead_persistedState_batchSize___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: argc == 5%@", v2, v3, v4, v5, v6);
}

void __66__BRCFSImporter__markNextChildBatchDead_persistedState_batchSize___block_invoke_91_cold_1()
{
  OUTLINED_FUNCTION_12();
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = [v1 itemDBRowID];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_23FA42000, v0, v3, "[DEBUG] Updating recursive properties table for %@%@", v4);
}

void __66__BRCFSImporter__markNextChildBatchDead_persistedState_batchSize___block_invoke_91_cold_2()
{
  OUTLINED_FUNCTION_12();
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 138412802;
  uint64_t v4 = v2;
  __int16 v5 = 1024;
  int v6 = [v2 type];
  __int16 v7 = 2112;
  uint64_t v8 = v1;
  _os_log_debug_impl(&dword_23FA42000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Inserting recursive properties job for %@ type %d%@", (uint8_t *)&v3, 0x1Cu);
}

- (void)_propagateFieldsToNextChildBatch:persistedState:minRowID:batchSize:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Propagating fields of %@ to child%@");
}

void __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: no sharing options for %llu%@");
}

void __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_102_cold_1()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: no visible for %llu%@");
}

void __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_103_cold_1()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: no scope for %llu%@");
}

void __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_104_cold_1()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: no timestamp for %llu%@");
}

void __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_105_cold_1()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: no notif rank for %llu%@");
}

void __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_106_cold_1()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Clearing upload error for rowid %llu%@");
}

void __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_107_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: argc == 9%@", v2, v3, v4, v5, v6);
}

void __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Processed %lld items needing clean after migration%@");
}

void __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: Couldn't find rowid %@%@");
}

void __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke_cold_3(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_5_2(&dword_23FA42000, a4, a3, "[ERROR] Failed to update client items - %@%@", (uint8_t *)a3);
}

void __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: argc == 3 || argc == 8%@", v2, v3, v4, v5, v6);
}

void __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke_141_cold_1()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] rejected item with rowid %llu got left behind when migrating%@");
}

void __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke_141_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: argc == 10%@", v2, v3, v4, v5, v6);
}

void __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke_153_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: item with rowID %@ got left behind when migrating%@");
}

@end