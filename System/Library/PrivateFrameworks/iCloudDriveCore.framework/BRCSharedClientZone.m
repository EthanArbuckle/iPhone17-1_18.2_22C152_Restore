@interface BRCSharedClientZone
- (BOOL)isSharedZone;
- (BRCSharedServerZone)sharedZone;
- (NSString)ownerName;
- (id)rootItemID;
- (id)shareAcceptOperationForItemID:(id)a3;
- (id)shareAcceptationSidefaultEnumerator;
- (void)addAcceptOperation:(id)a3 forItemID:(id)a4;
- (void)removeAllShareAcceptationSidefaults;
- (void)setServerZone:(id)a3;
@end

@implementation BRCSharedClientZone

- (NSString)ownerName
{
  return self->super._ownerName;
}

- (BOOL)isSharedZone
{
  return 1;
}

- (BRCSharedServerZone)sharedZone
{
  return (BRCSharedServerZone *)self->super._serverZone;
}

- (void)setServerZone:(id)a3
{
  v4 = (BRCServerZone *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = brc_bread_crumbs();
    v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[BRCSharedClientZone setServerZone:]((uint64_t)v6, v7);
    }
  }
  serverZone = self->super._serverZone;
  self->super._serverZone = v4;
}

- (id)rootItemID
{
  v3 = [BRCItemID alloc];
  v4 = [(BRCClientZone *)self dbRowID];
  id v5 = [(BRCItemID *)v3 _initAsZoneRootWithZoneRowID:v4];

  return v5;
}

- (id)shareAcceptationSidefaultEnumerator
{
  id v3 = [(BRCPQLConnection *)self->super._db fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation FROM client_items WHERE item_type IN (8, 10) AND zone_rowid = %@", self->super._dbRowID];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__BRCSharedClientZone_shareAcceptationSidefaultEnumerator__block_invoke;
  v6[3] = &unk_26507F1E8;
  v6[4] = self;
  v4 = [v3 enumerateObjects:v6];

  return v4;
}

id __58__BRCSharedClientZone_shareAcceptationSidefaultEnumerator__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  v7 = [v5 session];
  v8 = [*(id *)(a1 + 32) session];
  v9 = [v8 clientDB];
  v10 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:v9 error:a3];

  return v10;
}

- (void)addAcceptOperation:(id)a3 forItemID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  shareAcceptationByItemID = v8->_shareAcceptationByItemID;
  if (!shareAcceptationByItemID)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v11 = v8->_shareAcceptationByItemID;
    v8->_shareAcceptationByItemID = v10;

    shareAcceptationByItemID = v8->_shareAcceptationByItemID;
  }
  v12 = [(NSMutableDictionary *)shareAcceptationByItemID objectForKeyedSubscript:v7];
  if (v12)
  {
    v13 = brc_bread_crumbs();
    v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[BRCSharedClientZone addAcceptOperation:forItemID:]((uint64_t)v12, (uint64_t)v13, v14);
    }
  }
  [(NSMutableDictionary *)v8->_shareAcceptationByItemID setObject:v6 forKeyedSubscript:v7];
  v15 = [v6 completionBlock];
  objc_initWeak(&location, v6);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __52__BRCSharedClientZone_addAcceptOperation_forItemID___block_invoke;
  v18[3] = &unk_265086D98;
  objc_copyWeak(&v21, &location);
  v18[4] = v8;
  id v16 = v7;
  id v19 = v16;
  id v17 = v15;
  id v20 = v17;
  [v6 setCompletionBlock:v18];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  objc_sync_exit(v8);
  [(BRCClientZone *)v8 addSyncDownDependency:v6];
}

void __52__BRCSharedClientZone_addAcceptOperation_forItemID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  id v3 = [*(id *)(*(void *)(a1 + 32) + 520) objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v3 == WeakRetained) {
    [*(id *)(*(void *)(a1 + 32) + 520) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  if (![*(id *)(*(void *)(a1 + 32) + 520) count])
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 520);
    *(void *)(v4 + 520) = 0;
  }
  objc_sync_exit(v2);

  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
}

- (id)shareAcceptOperationForItemID:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [(NSMutableDictionary *)v5->_shareAcceptationByItemID objectForKeyedSubscript:v4];
  objc_sync_exit(v5);

  return v6;
}

- (void)removeAllShareAcceptationSidefaults
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = [(BRCSharedClientZone *)self shareAcceptationSidefaultEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v19;
    *(void *)&long long v5 = 138412290;
    long long v17 = v5;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v18 + 1) + 8 * v8);
        if ((objc_msgSend(v9, "isShareAcceptationFault", v17) & 1) == 0)
        {
          v14 = brc_bread_crumbs();
          v15 = brc_default_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v17;
            v23 = v14;
            _os_log_fault_impl(&dword_23FA42000, v15, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: item.isShareAcceptationFault%@", buf, 0xCu);
          }
        }
        v10 = [v9 itemID];
        v11 = [(BRCClientZone *)self serverItemByItemID:v10];

        v12 = [v9 asShareAcceptationFault];
        v13 = v12;
        if (v11)
        {
          [v12 markNeedsTransformIntoNormalFault];

          [v9 saveToDB];
        }
        else
        {
          [v12 deleteShareAcceptationFault];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v16 = [v3 countByEnumeratingWithState:&v18 objects:v24 count:16];
      uint64_t v6 = v16;
    }
    while (v16);
  }
}

- (void).cxx_destruct
{
}

- (void)setServerZone:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_23FA42000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: [serverZone isKindOfClass:[BRCSharedServerZone class]]%@", (uint8_t *)&v2, 0xCu);
}

- (void)addAcceptOperation:(os_log_t)log forItemID:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_23FA42000, log, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: there is already a share acceptation running for that itemID; %@%@",
    (uint8_t *)&v3,
    0x16u);
}

@end