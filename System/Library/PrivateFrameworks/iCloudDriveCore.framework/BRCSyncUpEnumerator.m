@interface BRCSyncUpEnumerator
- (BOOL)_checkForSharesWithinSharesWithItem:(id)a3;
- (BOOL)_checkIfParentNeedsRevivalWithParentItem:(id)a3 item:(id)a4;
- (BOOL)_checkIfShouldDenylistForChildrenOfItemBeingCopiedToNewZone:(id)a3;
- (BOOL)_checkIfShouldDenylistForParentDirectoryFaultWithItem:(id)a3 needsDirFaultCheck:(BOOL *)a4;
- (BOOL)_checkIfShouldDenylistForPathMatch:(id)a3;
- (BOOL)_denyListDescendantStackAndItemIfThrottledOrNeedsOSUpgrade:(id)a3 now:(unint64_t)a4;
- (BOOL)_handlePendingShareItemWithPendingDeleteChildren:(id)a3;
- (BOOL)_handleSharedItemWhichMovedToNewShare:(id)a3 rootItem:(id)a4;
- (BOOL)handleItemForOSUpgrade:(id)a3 parentItemID:(id)a4;
- (BOOL)isDenyListed:(id)a3;
- (BOOL)shouldDenylistRemainingDeletionParentStackForItem:(id)a3;
- (BRCSyncUpEnumerator)initWithClientZone:(id)a3;
- (NSMutableArray)itemsNeedingUnshare;
- (NSMutableSet)chainedParentIDAllowlist;
- (id)_documentsOrAliasesNeedingSyncUpEnumerator;
- (id)_liveDirectoriesNeedingSyncUpEnumerator;
- (id)_nextLiveItem;
- (id)_nextTombstone;
- (id)_tombstoneLeavesNeedingSyncUpEnumerator;
- (id)nextObject;
- (unint64_t)retryAfter;
- (unsigned)batchSize;
- (void)_denyListDescendantStack:(id)a3 parentItem:(id)a4 andAddToSet:(id)a5;
- (void)_denyListDescendantStack:(id)a3 parentItem:(id)a4 andAddToSet:(id)a5 descendantBlock:(id)a6;
- (void)_nextLiveItem;
- (void)invalidate;
@end

@implementation BRCSyncUpEnumerator

- (BRCSyncUpEnumerator)initWithClientZone:(id)a3
{
  NSMutableIndexSet *returned;
  uint64_t v27;
  NSMutableArray *stack;
  objc_super v30;

  id v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)BRCSyncUpEnumerator;
  v6 = [(BRCSyncUpEnumerator *)&v30 init];
  if (v6)
  {
    v7 = [v5 mangledID];
    v8 = +[BRCUserDefaults defaultsForMangledID:v7];

    v6->_batchSize = [v5 syncUpBatchSize];
    v6->_maxDepth = [v8 maxSyncPathDepth];
    v6->_should2PhasePCSChain = [v8 should2PhasePCSChain];
    v6->_retryAfter = 0x7FFFFFFFFFFFFFFFLL;
    objc_storeStrong((id *)&v6->_clientZone, a3);
    uint64_t v9 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:v6->_batchSize];
    visitedItemIDsToDepthMap = v6->_visitedItemIDsToDepthMap;
    v6->_visitedItemIDsToDepthMap = (NSMutableDictionary *)v9;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    itemIDsLostOrThrottled = v6->_itemIDsLostOrThrottled;
    v6->_itemIDsLostOrThrottled = v11;

    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    itemIDsNeedingOSUpgrade = v6->_itemIDsNeedingOSUpgrade;
    v6->_itemIDsNeedingOSUpgrade = v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    itemIDsNeedingDirectoryFetch = v6->_itemIDsNeedingDirectoryFetch;
    v6->_itemIDsNeedingDirectoryFetch = v15;

    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    itemIDsWithChildrenBeingCopiedToNewZone = v6->_itemIDsWithChildrenBeingCopiedToNewZone;
    v6->_itemIDsWithChildrenBeingCopiedToNewZone = v17;

    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    chainedParentIDAllowlist = v6->_chainedParentIDAllowlist;
    v6->_chainedParentIDAllowlist = v19;

    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    itemsNeedingUnshare = v6->_itemsNeedingUnshare;
    v6->_itemsNeedingUnshare = v21;

    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    tooDeepItems = v6->_tooDeepItems;
    v6->_tooDeepItems = v23;

    v25 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x263F089C8]);
    returned = v6->_returned;
    v6->_returned = v25;

    v27 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v6->_maxDepth];
    stack = v6->_stack;
    v6->_stack = (NSMutableArray *)v27;

    v6->_currentDepth = 0;
    v6->_stage = 0;
  }
  return v6;
}

- (void)invalidate
{
  [(PQLEnumeration *)self->_enumerator close];
  enumerator = self->_enumerator;
  self->_enumerator = 0;
}

- (id)_documentsOrAliasesNeedingSyncUpEnumerator
{
  v3 = [(BRCClientZone *)self->_clientZone db];
  v4 = [(BRCClientZone *)self->_clientZone dbRowID];
  id v5 = (void *)[v3 fetch:@"SELECT li.rowid, li.zone_rowid, li.item_id, li.item_creator_id, li.item_sharing_options, li.item_side_car_ckinfo, li.item_parent_zone_rowid, li.item_localsyncupstate, li.item_local_diffs, li.item_notifs_rank, li.app_library_rowid, li.item_min_supported_os_rowid, li.item_user_visible, li.item_stat_ckinfo, li.item_state, li.item_type, li.item_mode, li.item_birthtime, li.item_lastusedtime, li.item_favoriterank,li.item_parent_id, li.item_filename, li.item_hidden_ext, li.item_finder_tags, li.item_xattr_signature, li.item_trash_put_back_path, li.item_trash_put_back_parent_id, li.item_alias_target, li.item_creator, li.item_processing_stamp, li.item_bouncedname, li.item_scope, li.item_local_change_count, li.item_old_version_identifier, li.fp_creation_item_identifier, li.version_name, li.version_ckinfo, li.version_mtime, li.version_size, li.version_thumb_size, li.version_thumb_signature, li.version_content_signature, li.version_xattr_signature, li.version_edited_since_shared, li.version_device, li.version_conflict_loser_etags, li.version_quarantine_info, li.version_uploaded_assets, li.version_upload_error, li.version_old_zone_item_id, li.version_old_zone_rowid, li.version_local_change_count, li.version_old_version_identifier, li.item_live_conflict_loser_etags, li.item_file_id, li.item_generation FROM client_items AS li  INNER JOIN client_sync_up AS su    ON su.throttle_id = li.rowid  WHERE         su.throttle_state = 50    AND su.zone_rowid = %@    AND su.in_flight_diffs IS NULL    AND li.item_type IN (1, 2, 8, 5, 6, 7, 3)    AND li.item_state = 0    AND li.item_localsyncupstate = 4    AND li.item_min_supported_os_rowid IS NULL ORDER BY su.retry_count ASC", v4];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65__BRCSyncUpEnumerator__documentsOrAliasesNeedingSyncUpEnumerator__block_invoke;
  v8[3] = &unk_26507F1E8;
  v8[4] = self;
  v6 = [v5 enumerateObjects:v8];

  return v6;
}

id __65__BRCSyncUpEnumerator__documentsOrAliasesNeedingSyncUpEnumerator__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 24);
  id v6 = a2;
  v7 = [v5 session];
  v8 = [*(id *)(*(void *)(a1 + 32) + 24) session];
  uint64_t v9 = [v8 clientDB];
  v10 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:v9 error:a3];

  return v10;
}

- (id)_liveDirectoriesNeedingSyncUpEnumerator
{
  v3 = [(BRCClientZone *)self->_clientZone db];
  v4 = [(BRCClientZone *)self->_clientZone dbRowID];
  id v5 = (void *)[v3 fetch:@"SELECT li.rowid, li.zone_rowid, li.item_id, li.item_creator_id, li.item_sharing_options, li.item_side_car_ckinfo, li.item_parent_zone_rowid, li.item_localsyncupstate, li.item_local_diffs, li.item_notifs_rank, li.app_library_rowid, li.item_min_supported_os_rowid, li.item_user_visible, li.item_stat_ckinfo, li.item_state, li.item_type, li.item_mode, li.item_birthtime, li.item_lastusedtime, li.item_favoriterank,li.item_parent_id, li.item_filename, li.item_hidden_ext, li.item_finder_tags, li.item_xattr_signature, li.item_trash_put_back_path, li.item_trash_put_back_parent_id, li.item_alias_target, li.item_creator, li.item_processing_stamp, li.item_bouncedname, li.item_scope, li.item_local_change_count, li.item_old_version_identifier, li.fp_creation_item_identifier, li.version_name, li.version_ckinfo, li.version_mtime, li.version_size, li.version_thumb_size, li.version_thumb_signature, li.version_content_signature, li.version_xattr_signature, li.version_edited_since_shared, li.version_device, li.version_conflict_loser_etags, li.version_quarantine_info, li.version_uploaded_assets, li.version_upload_error, li.version_old_zone_item_id, li.version_old_zone_rowid, li.version_local_change_count, li.version_old_version_identifier, li.item_live_conflict_loser_etags, li.item_file_id, li.item_generation FROM client_items AS li  INNER JOIN client_sync_up AS su  ON su.throttle_id = li.rowid  WHERE         su.throttle_state = 50    AND su.zone_rowid = %@    AND su.in_flight_diffs IS NULL    AND li.item_type IN (0, 9, 10, 4)    AND (li.item_state = 0)    AND li.item_localsyncupstate = 4    AND li.item_min_supported_os_rowid IS NULL ORDER BY su.retry_count ASC", v4];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__BRCSyncUpEnumerator__liveDirectoriesNeedingSyncUpEnumerator__block_invoke;
  v8[3] = &unk_26507F1E8;
  v8[4] = self;
  id v6 = [v5 enumerateObjects:v8];

  return v6;
}

id __62__BRCSyncUpEnumerator__liveDirectoriesNeedingSyncUpEnumerator__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 24);
  id v6 = a2;
  v7 = [v5 session];
  v8 = [*(id *)(*(void *)(a1 + 32) + 24) session];
  uint64_t v9 = [v8 clientDB];
  v10 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:v9 error:a3];

  return v10;
}

- (id)_tombstoneLeavesNeedingSyncUpEnumerator
{
  v3 = [(BRCClientZone *)self->_clientZone db];
  v4 = [(BRCClientZone *)self->_clientZone dbRowID];
  id v5 = (void *)[v3 fetch:@"SELECT li.rowid, li.zone_rowid, li.item_id, li.item_creator_id, li.item_sharing_options, li.item_side_car_ckinfo, li.item_parent_zone_rowid, li.item_localsyncupstate, li.item_local_diffs, li.item_notifs_rank, li.app_library_rowid, li.item_min_supported_os_rowid, li.item_user_visible, li.item_stat_ckinfo, li.item_state, li.item_type, li.item_mode, li.item_birthtime, li.item_lastusedtime, li.item_favoriterank,li.item_parent_id, li.item_filename, li.item_hidden_ext, li.item_finder_tags, li.item_xattr_signature, li.item_trash_put_back_path, li.item_trash_put_back_parent_id, li.item_alias_target, li.item_creator, li.item_processing_stamp, li.item_bouncedname, li.item_scope, li.item_local_change_count, li.item_old_version_identifier, li.fp_creation_item_identifier, li.version_name, li.version_ckinfo, li.version_mtime, li.version_size, li.version_thumb_size, li.version_thumb_signature, li.version_content_signature, li.version_xattr_signature, li.version_edited_since_shared, li.version_device, li.version_conflict_loser_etags, li.version_quarantine_info, li.version_uploaded_assets, li.version_upload_error, li.version_old_zone_item_id, li.version_old_zone_rowid, li.version_local_change_count, li.version_old_version_identifier, li.item_live_conflict_loser_etags, li.item_file_id, li.item_generation FROM client_items AS li  INNER JOIN client_sync_up AS su    ON su.throttle_id = li.rowid  WHERE         su.throttle_state = 50    AND su.zone_rowid = %@    AND su.in_flight_diffs IS NULL    AND li.item_state = 1    AND li.item_localsyncupstate = 4    AND NOT EXISTS(SELECT 1 FROM client_items AS ci                     WHERE li.item_id = ci.item_parent_id                      AND ci.zone_rowid = su.zone_rowid)    AND li.item_min_supported_os_rowid IS NULL ORDER BY su.retry_count ASC", v4];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__BRCSyncUpEnumerator__tombstoneLeavesNeedingSyncUpEnumerator__block_invoke;
  v8[3] = &unk_26507F1E8;
  v8[4] = self;
  id v6 = [v5 enumerateObjects:v8];

  return v6;
}

id __62__BRCSyncUpEnumerator__tombstoneLeavesNeedingSyncUpEnumerator__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 24);
  id v6 = a2;
  v7 = [v5 session];
  v8 = [*(id *)(*(void *)(a1 + 32) + 24) session];
  uint64_t v9 = [v8 clientDB];
  v10 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:v9 error:a3];

  return v10;
}

- (void)_denyListDescendantStack:(id)a3 parentItem:(id)a4 andAddToSet:(id)a5 descendantBlock:(id)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void (**)(id, void *))a6;
  if ([v10 isDirectory])
  {
    v13 = [v10 itemID];
    [v11 addObject:v13];
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v14 = v9;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v19, "isDirectory", (void)v22))
        {
          v20 = [v19 itemID];
          [v11 addObject:v20];
        }
        if (v12)
        {
          v21 = [v19 itemID];
          v12[2](v12, v21);
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v16);
  }

  [v14 removeAllObjects];
}

- (void)_denyListDescendantStack:(id)a3 parentItem:(id)a4 andAddToSet:(id)a5
{
}

- (BOOL)_denyListDescendantStackAndItemIfThrottledOrNeedsOSUpgrade:(id)a3 now:(unint64_t)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([v6 needsOSUpgradeToSyncUp])
  {
    v7 = brc_bread_crumbs();
    v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[BRCSyncUpEnumerator _denyListDescendantStackAndItemIfThrottledOrNeedsOSUpgrade:now:]();
    }

    [(BRCSyncUpEnumerator *)self _denyListDescendantStack:self->_stack parentItem:v6 andAddToSet:self->_itemIDsLostOrThrottled];
LABEL_23:
    BOOL v16 = 1;
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = [(BRCClientZone *)self->_clientZone syncThrottles];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v33 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          unint64_t v22 = 0;
          if ([v14 matchesItem:v6 nsecsToRetry:&v22 now:a4]) {
            BOOL v15 = v22 == 0;
          }
          else {
            BOOL v15 = 1;
          }
          if (!v15)
          {
            uint64_t v17 = brc_bread_crumbs();
            v18 = brc_default_log();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412802;
              id v28 = v6;
              __int16 v29 = 2048;
              unint64_t v30 = v22;
              __int16 v31 = 2112;
              v32 = v17;
              _os_log_debug_impl(&dword_23FA42000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: denylist %@ and all dependents because %llu nsecs to retry%@", buf, 0x20u);
            }

            unint64_t retryAfter = self->_retryAfter;
            if (retryAfter >= v22) {
              unint64_t retryAfter = v22;
            }
            self->_unint64_t retryAfter = retryAfter;
            [(BRCSyncUpEnumerator *)self _denyListDescendantStack:self->_stack parentItem:v6 andAddToSet:self->_itemIDsLostOrThrottled];

            goto LABEL_23;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v33 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)isDenyListed:(id)a3
{
  id v4 = a3;
  if (([(NSMutableSet *)self->_itemIDsLostOrThrottled containsObject:v4] & 1) != 0
    || ([(NSMutableSet *)self->_itemIDsNeedingOSUpgrade containsObject:v4] & 1) != 0
    || ([(NSMutableSet *)self->_itemIDsWithChildrenBeingCopiedToNewZone containsObject:v4] & 1) != 0)
  {
    char v5 = 1;
  }
  else
  {
    char v5 = [(NSMutableSet *)self->_itemIDsNeedingDirectoryFetch containsObject:v4];
  }

  return v5;
}

- (BOOL)shouldDenylistRemainingDeletionParentStackForItem:(id)a3
{
  id v4 = a3;
  if ([v4 isDead])
  {
    itemIDsNeedingDirectoryFetch = self->_itemIDsNeedingDirectoryFetch;
    id v6 = [v4 itemID];
    if ([(NSMutableSet *)itemIDsNeedingDirectoryFetch containsObject:v6])
    {
      char v7 = 1;
    }
    else
    {
      itemIDsWithChildrenBeingCopiedToNewZone = self->_itemIDsWithChildrenBeingCopiedToNewZone;
      id v9 = [v4 itemID];
      char v7 = [(NSMutableSet *)itemIDsWithChildrenBeingCopiedToNewZone containsObject:v9];
    }
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (BOOL)handleItemForOSUpgrade:(id)a3 parentItemID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 needsOSUpgradeToSyncUp] & 1) != 0
    || [(NSMutableSet *)self->_itemIDsNeedingOSUpgrade containsObject:v7])
  {
    v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[BRCSyncUpEnumerator handleItemForOSUpgrade:parentItemID:]();
    }

    if (![v6 needsOSUpgradeToSyncUp])
    {
      uint64_t v10 = [v6 parentItemIDInZone];
      uint64_t v11 = v10;
      if (v10 && ([v10 isNonDesktopRoot] & 1) == 0)
      {
        uint64_t v12 = [v6 clientZone];
        v13 = [v12 itemByItemID:v11];

        [v6 inheritOSUpgradeNeededFromItem:v13];
        [v6 saveToDB];
      }
      [(NSMutableArray *)self->_stack removeLastObject];
    }
    stack = self->_stack;
    itemIDsNeedingOSUpgrade = self->_itemIDsNeedingOSUpgrade;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __59__BRCSyncUpEnumerator_handleItemForOSUpgrade_parentItemID___block_invoke;
    v18[3] = &unk_265086FC8;
    v18[4] = self;
    id v19 = v6;
    [(BRCSyncUpEnumerator *)self _denyListDescendantStack:stack parentItem:v19 andAddToSet:itemIDsNeedingOSUpgrade descendantBlock:v18];

    BOOL v16 = 1;
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

void __59__BRCSyncUpEnumerator_handleItemForOSUpgrade_parentItemID___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 24) itemByItemID:a2];
  if (([v3 needsOSUpgradeToSyncUp] & 1) == 0)
  {
    [v3 inheritOSUpgradeNeededFromItem:*(void *)(a1 + 40)];
    [v3 saveToDB];
  }
}

- (BOOL)_handleSharedItemWhichMovedToNewShare:(id)a3 rootItem:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (([v6 sharingOptions] & 4) == 0)
  {
    v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[BRCSyncUpEnumerator _handleSharedItemWhichMovedToNewShare:rootItem:]();
    }

    goto LABEL_21;
  }
  uint64_t v10 = [v6 clientZone];
  if ([v10 isEqualToClientZone:self->_clientZone]) {
    BOOL v11 = [(BRCClientZone *)self->_clientZone isPrivateZone];
  }
  else {
    BOOL v11 = 0;
  }

  uint64_t v12 = brc_bread_crumbs();
  v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = " in the same zone";
    int v24 = 138413058;
    if (!v11) {
      id v14 = 0;
    }
    id v25 = v6;
    __int16 v26 = 2112;
    id v27 = v7;
    __int16 v28 = 2080;
    __int16 v29 = v14;
    __int16 v30 = 2112;
    __int16 v31 = v12;
    _os_log_impl(&dword_23FA42000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] item with shareID %@ is moving into a shared parent %@%s%@", (uint8_t *)&v24, 0x2Au);
  }

  if (!v11)
  {
    clientZone = self->_clientZone;
    v8 = [v7 itemGlobalID];
    [(BRCClientZone *)clientZone itemMovedIntoShareInThisZone:v6 associatedItemID:v8];
LABEL_21:
    BOOL v19 = 1;
    goto LABEL_22;
  }
  BOOL v15 = [v6 clientZone];
  BOOL v16 = [v6 itemID];
  v8 = [v15 serverItemByItemID:v16];

  if (([v8 sharingOptions] & 4) != 0)
  {
    v21 = brc_bread_crumbs();
    unint64_t v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[BRCSyncUpEnumerator _handleSharedItemWhichMovedToNewShare:rootItem:]();
    }

    [(NSMutableArray *)self->_itemsNeedingUnshare addObject:v6];
    goto LABEL_21;
  }
  uint64_t v17 = brc_bread_crumbs();
  v18 = brc_default_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[BRCSyncUpEnumerator _handleSharedItemWhichMovedToNewShare:rootItem:]();
  }

  [v6 updateItemMetadataFromServerItem:v8 appliedSharingPermission:0];
  [v6 saveToDBForServerEdit:1 keepAliases:0];
  BOOL v19 = 0;
LABEL_22:

  return v19;
}

- (BOOL)_checkForSharesWithinSharesWithItem:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 isDead] & 1) != 0 || (objc_msgSend(v4, "isFSRoot"))
  {
    char v5 = 0;
    BOOL v6 = 0;
    goto LABEL_4;
  }
  if (([v4 localDiffs] & 0x20) != 0 && (objc_msgSend(v4, "sharingOptions") & 4) != 0)
  {
    char v5 = [v4 parentItemOnFS];
    if (([v5 sharingOptions] & 0x48) != 0)
    {
      id v25 = [v4 asShareableItem];
      BOOL v26 = [(BRCSyncUpEnumerator *)self _handleSharedItemWhichMovedToNewShare:v25 rootItem:0];

      if (v26)
      {
        brc_bread_crumbs();
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        id v27 = brc_default_log();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
          [(BRCSyncUpEnumerator *)v4 _checkForSharesWithinSharesWithItem:v27];
        }

        BOOL v6 = 1;
        goto LABEL_34;
      }
    }
  }
  else
  {
    char v5 = 0;
  }
  if (([v4 localDiffs] & 0x20) != 0
    && [(BRCClientZone *)self->_clientZone isPrivateZone]
    && [v4 isDirectory])
  {
    if (!v5)
    {
      char v5 = [v4 parentItemOnFS];
    }
    if (([v5 sharingOptions] & 0x48) != 0)
    {
      v8 = [(BRCClientZone *)self->_clientZone session];
      uint64_t v39 = 0;
      v40 = &v39;
      uint64_t v41 = 0x2020000000;
      char v42 = 0;
      id v9 = [v4 asDirectory];
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __59__BRCSyncUpEnumerator__checkForSharesWithinSharesWithItem___block_invoke;
      v34[3] = &unk_265086FF0;
      id v10 = v8;
      v38 = &v39;
      id v35 = v10;
      v36 = self;
      id v11 = v4;
      id v37 = v11;
      [v10 enumerateItemsWithShareIDUnderParent:v9 block:v34];

      BOOL v6 = *((unsigned char *)v40 + 24) != 0;
      if (*((unsigned char *)v40 + 24))
      {
        uint64_t v12 = brc_bread_crumbs();
        v13 = brc_default_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          id v14 = [v11 itemID];
          -[BRCSyncUpEnumerator _checkForSharesWithinSharesWithItem:](v14, (uint64_t)v12, v47, v13);
        }
      }
      _Block_object_dispose(&v39, 8);
LABEL_34:

      goto LABEL_20;
    }
  }
  BOOL v6 = 0;
LABEL_20:
  if (([v4 sharingOptions] & 0x7C) == 4 && objc_msgSend(v4, "isDirectory"))
  {
    BOOL v15 = [v4 clientZone];
    BOOL v16 = [v4 itemID];
    uint64_t v17 = [v15 serverItemByItemID:v16];

    if (([v17 sharingOptions] & 0x7C) == 4)
    {
      v18 = [(BRCClientZone *)self->_clientZone session];
      uint64_t v39 = 0;
      v40 = &v39;
      uint64_t v41 = 0x2020000000;
      char v42 = 0;
      BOOL v19 = [v4 asDirectory];
      uint64_t v28 = MEMORY[0x263EF8330];
      uint64_t v29 = 3221225472;
      __int16 v30 = __59__BRCSyncUpEnumerator__checkForSharesWithinSharesWithItem___block_invoke_15;
      __int16 v31 = &unk_265087018;
      id v20 = v4;
      id v32 = v20;
      v33 = &v39;
      [v18 enumerateItemsWithShareIDUnderParent:v19 block:&v28];

      if (*((unsigned char *)v40 + 24))
      {
        v21 = brc_bread_crumbs();
        unint64_t v22 = brc_default_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v44 = v20;
          __int16 v45 = 2112;
          v46 = v21;
          _os_log_impl(&dword_23FA42000, v22, OS_LOG_TYPE_DEFAULT, "[WARNING] Unsharing turd folder share %@ because it now has shared children%@", buf, 0x16u);
        }

        itemsNeedingUnshare = self->_itemsNeedingUnshare;
        int v24 = objc_msgSend(v20, "asShareableItem", v28, v29, v30, v31);
        [(NSMutableArray *)itemsNeedingUnshare addObject:v24];

        BOOL v6 = 1;
      }

      _Block_object_dispose(&v39, 8);
    }
  }
LABEL_4:

  return v6;
}

void __59__BRCSyncUpEnumerator__checkForSharesWithinSharesWithItem___block_invoke(uint64_t a1, uint64_t a2)
{
  id v6 = [*(id *)(a1 + 32) itemByItemGlobalID:a2];
  if (([v6 isDead] & 1) == 0)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
    if (*(unsigned char *)(v3 + 24))
    {
      *(unsigned char *)(v3 + 24) = 1;
    }
    else
    {
      id v4 = *(void **)(a1 + 40);
      char v5 = [v6 asShareableItem];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v4 _handleSharedItemWhichMovedToNewShare:v5 rootItem:*(void *)(a1 + 48)];
    }
  }
}

void __59__BRCSyncUpEnumerator__checkForSharesWithinSharesWithItem___block_invoke_15(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  v8 = [v6 itemGlobalID];
  char v9 = [v8 isEqualToItemGlobalID:v7];

  if ((v9 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (BOOL)_checkIfParentNeedsRevivalWithParentItem:(id)a3 item:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (![v6 isRejected])
  {
    clientZone = self->_clientZone;
    v13 = [v6 clientZone];
    if ([(BRCClientZone *)clientZone isEqualToClientZone:v13]
      && [v6 isKnownByServer]
      && [v6 isIdleOrRejected])
    {
      int v14 = [v6 isDeadOrMissingInServerTruth];

      if (v14)
      {
        if ([v6 isSharedToMeChildItem]) {
          goto LABEL_13;
        }
        BOOL v15 = [v6 clientZone];
        int v16 = [v15 isPrivateZone];

        if (v16)
        {
          uint64_t v17 = [v6 clientZone];
          v18 = [v17 asPrivateClientZone];
          BOOL v19 = [v6 itemID];
          int v20 = [v18 pcsChainStateForItem:v19] & 0xFFFFFFFE;

          if (v20 == 2)
          {
LABEL_13:
            v8 = brc_bread_crumbs();
            char v9 = brc_default_log();
            if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_5;
            }
            int v22 = 138412546;
            id v23 = v6;
            __int16 v24 = 2112;
            id v25 = v8;
            id v10 = "[WARNING] Parent item needs to be revived to sync up %@%@";
            goto LABEL_4;
          }
        }
      }
    }
    else
    {
    }
    BOOL v11 = 0;
    goto LABEL_17;
  }
  v8 = brc_bread_crumbs();
  char v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412546;
    id v23 = v7;
    __int16 v24 = 2112;
    id v25 = v8;
    id v10 = "[WARNING] Parent item is rejected so we will reset if we try to sync up without syncing up the parent. Item: %@%@";
LABEL_4:
    _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v22, 0x16u);
  }
LABEL_5:

  [v6 markForceNeedsSyncUp];
  [v6 saveToDB];
  BOOL v11 = 1;
LABEL_17:

  return v11;
}

- (BOOL)_handlePendingShareItemWithPendingDeleteChildren:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 appLibrary];
  char v5 = [v4 mangledID];
  id v6 = +[BRCUserDefaults defaultsForMangledID:v5];
  char v7 = [v6 preventSharingFolderWithPendingDelete];

  if ((v7 & 1) == 0)
  {
    uint64_t v12 = brc_bread_crumbs();
    uint64_t v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[BRCSyncUpEnumerator _handlePendingShareItemWithPendingDeleteChildren:]((uint64_t)v12, v17);
    }

    goto LABEL_13;
  }
  if (![v3 isChildSharedItem]) {
    goto LABEL_14;
  }
  if (![v3 isSharedByMe]) {
    goto LABEL_14;
  }
  if (![v3 isDirectory]) {
    goto LABEL_14;
  }
  v8 = [v3 asDirectory];
  int v9 = [v8 containsPendingDeleteDocuments];

  if (!v9) {
    goto LABEL_14;
  }
  id v10 = [v3 clientZone];
  BOOL v11 = [v3 itemID];
  uint64_t v12 = [v10 serverItemByItemID:v11];

  if ([v12 isChildSharedItem])
  {
LABEL_13:

LABEL_14:
    BOOL v16 = 0;
    goto LABEL_15;
  }
  v13 = brc_bread_crumbs();
  int v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v15 = [v3 itemID];
    int v19 = 138412546;
    int v20 = v15;
    __int16 v21 = 2112;
    int v22 = v13;
    _os_log_impl(&dword_23FA42000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] Sync: denylist %@ until the delete of its child%@", (uint8_t *)&v19, 0x16u);
  }
  BOOL v16 = 1;
LABEL_15:

  return v16;
}

- (BOOL)_checkIfShouldDenylistForPathMatch:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 isDirectory] && (objc_msgSend(v4, "isKnownByServerOrInFlight") & 1) == 0)
  {
    char v5 = [v4 serverPathMatchItemID];
    if (v5)
    {
      if (![(BRCClientZone *)self->_clientZone existsByItemID:v5])
      {
        id v6 = [(BRCClientZone *)self->_clientZone serverItemByItemID:v5];
        char v7 = [v6 isBRAlias];

        if ((v7 & 1) == 0)
        {
          v8 = brc_bread_crumbs();
          LOBYTE(v9) = 1;
          id v10 = brc_default_log();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            int v9 = [v4 itemID];
            int v14 = 138412802;
            BOOL v15 = v9;
            __int16 v16 = 2112;
            uint64_t v17 = v5;
            __int16 v18 = 2112;
            int v19 = v8;
            _os_log_debug_impl(&dword_23FA42000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: denylist %@ because it's an unresolved path-match with %@%@", (uint8_t *)&v14, 0x20u);

            LOBYTE(v9) = 1;
          }
          goto LABEL_13;
        }
      }
    }
  }
  if (([v4 localDiffs] & 0x1000000060) != 0)
  {
    char v5 = [v4 serverPathMatchItemID];
    if (!v5)
    {
      LOBYTE(v9) = 0;
      goto LABEL_17;
    }
    v8 = [(BRCClientZone *)self->_clientZone itemByItemID:v5];
    LODWORD(v9) = [v8 isLost];
    if (!v9)
    {
LABEL_14:

LABEL_17:
      goto LABEL_18;
    }
    id v10 = brc_bread_crumbs();
    BOOL v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v13 = [v4 itemID];
      int v14 = 138412802;
      BOOL v15 = v13;
      __int16 v16 = 2112;
      uint64_t v17 = v5;
      __int16 v18 = 2112;
      int v19 = v10;
      _os_log_debug_impl(&dword_23FA42000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: denylist %@ because we have a lost item at the same path in the server truth - %@%@", (uint8_t *)&v14, 0x20u);
    }
LABEL_13:

    goto LABEL_14;
  }
  LOBYTE(v9) = 0;
LABEL_18:

  return (char)v9;
}

- (BOOL)_checkIfShouldDenylistForParentDirectoryFaultWithItem:(id)a3 needsDirFaultCheck:(BOOL *)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  char v7 = [(BRCClientZone *)self->_clientZone serverZone];
  if (([v7 state] & 4) != 0
    || ([v7 hasFetchedServerZoneState] & 1) == 0
    || [(BRCClientZone *)self->_clientZone isSharedZone]
    && [v6 isSharedToMeTopLevelItem])
  {
    BOOL v8 = 0;
    *a4 = 0;
  }
  else
  {
    id v10 = [v6 st];
    BOOL v11 = [v10 parentID];

    clientZone = self->_clientZone;
    v13 = [v6 db];
    int v14 = [(BRCClientZone *)clientZone serverItemTypeByItemID:v11 db:v13];

    if (v14 == 9)
    {
      BOOL v15 = brc_bread_crumbs();
      __int16 v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138412546;
        id v20 = v6;
        __int16 v21 = 2112;
        int v22 = v15;
        _os_log_impl(&dword_23FA42000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] denylist %@ because parent is a directory fault in the server truth%@", (uint8_t *)&v19, 0x16u);
      }

      uint64_t v17 = self->_clientZone;
      BOOL v8 = 1;
      __int16 v18 = [(BRCClientZone *)v17 fetchDirectoryContentsIfNecessary:v11 isUserWaiting:0 rescheduleApplyScheduler:1];
      [v18 beginObservingChangesWithDelegate:0];
      *a4 = 0;
    }
    else
    {
      BOOL v8 = 0;
      if (!(_BYTE)v14) {
        *a4 = 0;
      }
    }
  }
  return v8;
}

- (BOOL)_checkIfShouldDenylistForChildrenOfItemBeingCopiedToNewZone:(id)a3
{
  id v4 = a3;
  itemIDsWithChildrenBeingCopiedToNewZone = self->_itemIDsWithChildrenBeingCopiedToNewZone;
  id v6 = [v4 itemID];
  LOBYTE(itemIDsWithChildrenBeingCopiedToNewZone) = [(NSMutableSet *)itemIDsWithChildrenBeingCopiedToNewZone containsObject:v6];

  if (itemIDsWithChildrenBeingCopiedToNewZone)
  {
    char v7 = 1;
  }
  else
  {
    BOOL v8 = [(BRCClientZone *)self->_clientZone db];
    int v9 = [v4 itemID];
    id v10 = [(BRCClientZone *)self->_clientZone dbRowID];
    BOOL v11 = (void *)[v8 numberWithSQL:@"SELECT 1 FROM client_items AS ci INNER JOIN server_items AS si ON ci.version_old_zone_item_id = si.item_id AND ci.version_old_zone_rowid = si.zone_rowid  WHERE si.item_parent_id = %@ AND si.zone_rowid = %@ LIMIT 1", v9, v10];

    char v7 = [v11 BOOLValue];
  }

  return v7;
}

- (id)_nextLiveItem
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  uint64_t v64 = brc_current_date_nsec();
  uint64_t v3 = [(NSMutableArray *)self->_stack lastObject];
  if (v3)
  {
    id v4 = (void *)v3;
    do
    {
      char v5 = (void *)MEMORY[0x2455D97F0]();
      ++self->_currentDepth;
      [(NSMutableArray *)self->_stack removeLastObject];
      if (self->_currentDepth >= self->_maxDepth)
      {
        tooDeepItems = self->_tooDeepItems;
        id v10 = [v4 itemID];
        [(NSMutableArray *)tooDeepItems addObject:v10];

        [v4 markCannotSynchronizeForTooDeepHierarchy];
        [v4 saveToDB];
      }
      else
      {
        if ([v4 isDirectory])
        {
          id v6 = [NSNumber numberWithUnsignedInt:self->_currentDepth];
          visitedItemIDsToDepthMap = self->_visitedItemIDsToDepthMap;
          BOOL v8 = [v4 itemID];
          [(NSMutableDictionary *)visitedItemIDsToDepthMap setObject:v6 forKeyedSubscript:v8];
        }
        if ((-[NSMutableIndexSet containsIndex:](self->_returned, "containsIndex:", [v4 dbRowID]) & 1) == 0
          && [v4 syncUpState] == 4
          && ![(BRCSyncUpEnumerator *)self _denyListDescendantStackAndItemIfThrottledOrNeedsOSUpgrade:v4 now:v64])
        {
          -[NSMutableIndexSet addIndex:](self->_returned, "addIndex:", [v4 dbRowID]);
          v56 = v4;
          v57 = v56;
          goto LABEL_70;
        }
      }
      uint64_t v11 = [(NSMutableArray *)self->_stack lastObject];

      id v4 = (void *)v11;
    }
    while (v11);
  }
  self->_currentDepth = 0;
  if ([(NSMutableArray *)self->_stack count])
  {
    v59 = brc_bread_crumbs();
    v60 = brc_default_log();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT)) {
      [(BRCSyncUpEnumerator *)(uint64_t)v59 _nextLiveItem];
    }
  }
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  uint64_t v12 = self->_enumerator;
  uint64_t v65 = [(PQLEnumeration *)v12 countByEnumeratingWithState:&v67 objects:v77 count:16];
  if (!v65) {
    goto LABEL_60;
  }
  int v14 = 0;
  uint64_t v15 = *(void *)v68;
  *(void *)&long long v13 = 138412546;
  long long v61 = v13;
  uint64_t v62 = *(void *)v68;
  v63 = v12;
LABEL_15:
  uint64_t v16 = 0;
  while (1)
  {
    if (*(void *)v68 != v15) {
      objc_enumerationMutation(v12);
    }
    v56 = (PQLEnumeration *)*(id *)(*((void *)&v67 + 1) + 8 * v16);

    if ([(NSMutableIndexSet *)self->_returned containsIndex:[(PQLEnumeration *)v56 dbRowID]])
    {
      int v14 = v56;
      goto LABEL_55;
    }
    uint64_t v17 = [(PQLEnumeration *)v56 itemID];
    BOOL v18 = [(BRCSyncUpEnumerator *)self isDenyListed:v17];

    if (!v18) {
      break;
    }
LABEL_54:
    int v14 = v56;
    uint64_t v15 = v62;
    uint64_t v12 = v63;
LABEL_55:
    if (++v16 == v65)
    {
      uint64_t v49 = [(PQLEnumeration *)v12 countByEnumeratingWithState:&v67 objects:v77 count:16];
      uint64_t v65 = v49;
      if (!v49)
      {

LABEL_60:
        v57 = 0;
        v56 = v12;
        goto LABEL_70;
      }
      goto LABEL_15;
    }
  }
  while (2)
  {
    char v66 = 0;
    int v19 = [(PQLEnumeration *)v56 itemID];
    char v20 = [v19 isDocumentsFolder] ^ 1;

    char v66 = v20;
    __int16 v21 = [(PQLEnumeration *)v56 clientZone];
    if ([v21 isEqualToClientZone:self->_clientZone])
    {
    }
    else
    {
      int v22 = [(PQLEnumeration *)v56 parentClientZone];
      int v23 = [v22 isEqualToClientZone:self->_clientZone];

      if (v23)
      {
        __int16 v24 = [(PQLEnumeration *)v56 parentItemOnFS];
        id v25 = [v24 itemID];
        id v26 = v24;
        goto LABEL_26;
      }
    }
    id v25 = [(PQLEnumeration *)v56 parentItemIDInZone];
    id v26 = 0;
LABEL_26:
    id v27 = self->_tooDeepItems;
    uint64_t v28 = [(PQLEnumeration *)v56 itemID];
    LODWORD(v27) = [(NSMutableArray *)v27 containsObject:v28];

    if (v27)
    {
      self->_currentDepth = self->_maxDepth + 1;
      goto LABEL_53;
    }
    [(NSMutableArray *)self->_stack addObject:v56];
    int v29 = [(PQLEnumeration *)v56 isLost];
    char v30 = v29;
    if (v29)
    {
      brc_bread_crumbs();
      __int16 v31 = (PQLEnumeration *)objc_claimAutoreleasedReturnValue();
      id v32 = brc_default_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        id v44 = [(PQLEnumeration *)v56 itemID];
        *(_DWORD *)buf = v61;
        v72 = v44;
        __int16 v73 = 2112;
        v74 = v31;
        _os_log_debug_impl(&dword_23FA42000, v32, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: denylist %@ because it's lost%@", buf, 0x16u);
      }
    }
    v33 = [(BRCClientZone *)self->_clientZone itemIDsBlockedFromSyncForCZMProcessing];
    uint64_t v34 = [(PQLEnumeration *)v56 itemGlobalID];
    int v35 = [v33 containsObject:v34];

    if (!v35)
    {
      if (v30) {
        goto LABEL_52;
      }
      BOOL v36 = [(BRCSyncUpEnumerator *)self _checkForSharesWithinSharesWithItem:v56];
      if (!v36 && v66) {
        BOOL v36 = [(BRCSyncUpEnumerator *)self _checkIfShouldDenylistForParentDirectoryFaultWithItem:v56 needsDirFaultCheck:&v66];
      }
      if (v36
        || [(BRCSyncUpEnumerator *)self _checkIfShouldDenylistForPathMatch:v56]
        || [(NSMutableSet *)self->_itemIDsLostOrThrottled containsObject:v25])
      {
        goto LABEL_52;
      }
      if ([(BRCSyncUpEnumerator *)self handleItemForOSUpgrade:v56 parentItemID:v25]|| [(BRCSyncUpEnumerator *)self _handlePendingShareItemWithPendingDeleteChildren:v56])
      {
        goto LABEL_53;
      }
      id v37 = [(NSMutableDictionary *)self->_visitedItemIDsToDepthMap objectForKey:v25];

      if (v37)
      {
        v47 = [(NSMutableDictionary *)self->_visitedItemIDsToDepthMap objectForKeyedSubscript:v25];
        self->_currentDepth = [v47 intValue];

        goto LABEL_53;
      }
      if ([v25 isNonDesktopRoot]) {
        goto LABEL_53;
      }
      v38 = v26;
      if (!v26)
      {
        uint64_t v39 = [0 clientZone];
        v40 = [(PQLEnumeration *)v56 clientZone];
        char v41 = [v39 isEqualToClientZone:v40];

        if (v41) {
          goto LABEL_61;
        }
        if (!v25) {
          goto LABEL_62;
        }
        char v42 = [(PQLEnumeration *)v56 clientZone];
        v38 = [v42 itemByItemID:v25];

        if (!v38)
        {
LABEL_61:

LABEL_62:
          v50 = brc_bread_crumbs();
          v51 = brc_default_log();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
          {
            clientZone = self->_clientZone;
            *(_DWORD *)buf = 138412802;
            v72 = clientZone;
            __int16 v73 = 2112;
            v74 = v56;
            __int16 v75 = 2112;
            v76 = v50;
            _os_log_fault_impl(&dword_23FA42000, v51, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: reset needed for %@ because of orphan %@%@", buf, 0x20u);
          }

          [(BRCClientZone *)self->_clientZone scheduleResetServerAndClientTruthsForReason:@"orphan.live"];
          v57 = 0;
          goto LABEL_69;
        }
      }
      [(BRCSyncUpEnumerator *)self _checkIfParentNeedsRevivalWithParentItem:v38 item:v56];
      id v43 = v38;

      v56 = (PQLEnumeration *)v43;
      continue;
    }
    break;
  }
  brc_bread_crumbs();
  __int16 v45 = (PQLEnumeration *)objc_claimAutoreleasedReturnValue();
  v46 = brc_default_log();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v48 = [(PQLEnumeration *)v56 itemID];
    *(_DWORD *)buf = v61;
    v72 = v48;
    __int16 v73 = 2112;
    v74 = v45;
    _os_log_debug_impl(&dword_23FA42000, v46, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: denylist %@ because it's already being processed for CZM%@", buf, 0x16u);
  }
LABEL_52:
  [(BRCSyncUpEnumerator *)self _denyListDescendantStack:self->_stack parentItem:v56 andAddToSet:self->_itemIDsLostOrThrottled];
LABEL_53:

  if (![(NSMutableArray *)self->_stack count]) {
    goto LABEL_54;
  }
  if ((unint64_t)[(NSMutableArray *)self->_stack count] >= 2)
  {
    unint64_t v52 = 1;
    do
    {
      v53 = [(NSMutableArray *)self->_stack objectAtIndexedSubscript:v52];
      v54 = [(NSMutableArray *)self->_stack objectAtIndexedSubscript:v52 - 1];
      [v53 checkIsInDocumentsScopeWithParent:v54];

      ++v52;
    }
    while (v52 < [(NSMutableArray *)self->_stack count]);
  }
  v57 = [(BRCSyncUpEnumerator *)self _nextLiveItem];
LABEL_69:

LABEL_70:
  return v57;
}

- (id)_nextTombstone
{
  uint64_t v130 = *MEMORY[0x263EF8340];
  uint64_t v115 = brc_current_date_nsec();
  uint64_t v3 = 0;
  id v4 = 0;
  char v5 = &OBJC_IVAR___BRCRecentsEnumeratorBatch__deletedItemIDs;
  id v6 = &OBJC_IVAR___BRCRecentsEnumeratorBatch__deletedItemIDs;
  while (2)
  {
    while (1)
    {
      char v7 = v4;
      id v4 = [(NSMutableArray *)self->_stack firstObject];

      if (!v4) {
        break;
      }
      BOOL v8 = (void *)MEMORY[0x2455D97F0]();
      BOOL v9 = [(BRCSyncUpEnumerator *)self shouldDenylistRemainingDeletionParentStackForItem:v4];
      stack = self->_stack;
      if (v9)
      {
        [(NSMutableArray *)stack removeAllObjects];
        break;
      }
      [(NSMutableArray *)stack removeObjectAtIndex:0];
      if (![v4 isDirectory]) {
        goto LABEL_37;
      }
      uint64_t v11 = [v4 itemID];
      [(NSMutableDictionary *)self->_visitedItemIDsToDepthMap setObject:&unk_26F3DDAC0 forKeyedSubscript:v11];
      if ([v4 syncUpState] == 4)
      {
        uint64_t v12 = v3;
        uint64_t v13 = v6[655];
        if ((objc_msgSend(*(id *)((char *)&self->super.super.isa + v13), "containsIndex:", objc_msgSend(v4, "dbRowID")) & 1) == 0)
        {
          uint64_t v15 = [(NSMutableDictionary *)self->_tombstonesEmbargo objectForKeyedSubscript:v11];

          uint64_t v16 = (void *)v15;
          if (v15) {
            goto LABEL_11;
          }
          int v19 = [(BRCClientZone *)self->_clientZone db];
          uint64_t v20 = *(uint64_t *)((char *)&self->super.super.isa + v13);
          __int16 v21 = [(BRCClientZone *)self->_clientZone dbRowID];
          uint64_t v22 = [v19 numberWithSQL:@"SELECT COUNT(*) FROM client_items  WHERE item_parent_id = %@     AND item_localsyncupstate = 4    AND NOT indexset_contains(%p, rowid)    AND zone_rowid = %@", v11, v20, v21];

          v116 = (void *)v22;
          if (!v22)
          {
            v105 = brc_bread_crumbs();
            v106 = brc_default_log();
            if (os_log_type_enabled(v106, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v129 = v105;
              _os_log_fault_impl(&dword_23FA42000, v106, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: n%@", buf, 0xCu);
            }
          }
          int v23 = [(BRCClientZone *)self->_clientZone mangledID];
          __int16 v24 = +[BRCUserDefaults defaultsForMangledID:v23];
          int v25 = [v24 checkTombstoneEmbargoReparents];

          if (v25)
          {
            id v26 = [(BRCClientZone *)self->_clientZone db];
            id v27 = [(BRCClientZone *)self->_clientZone dbRowID];
            uint64_t v28 = (void *)[v26 numberWithSQL:@"SELECT COUNT(*) FROM server_items AS si INNER JOIN client_items AS ci USING (item_id, zone_rowid) WHERE si.item_parent_id = %@ AND si.zone_rowid = %@ AND ci.item_parent_id != si.item_parent_id AND ci.item_localsyncupstate != 0 AND NOT indexset_contains(%p, ci.rowid)", v11, v27, *(Class *)((char *)&self->super.super.isa + v13)];

            if (!v28)
            {
              v107 = brc_bread_crumbs();
              v108 = brc_default_log();
              if (os_log_type_enabled(v108, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)v129 = v107;
                _os_log_fault_impl(&dword_23FA42000, v108, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: reparentedOutCount%@", buf, 0xCu);
              }
            }
            uint64_t v3 = v116;
            if ([v28 unsignedLongLongValue])
            {
              int v29 = brc_bread_crumbs();
              char v30 = brc_default_log();
              id v6 = &OBJC_IVAR___BRCRecentsEnumeratorBatch__deletedItemIDs;
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v31 = [v28 unsignedLongLongValue];
                *(_DWORD *)buf = 138412802;
                *(void *)v129 = v11;
                *(_WORD *)&v129[8] = 2048;
                *(void *)&v129[10] = v31;
                *(_WORD *)&v129[18] = 2112;
                *(void *)&v129[20] = v29;
                _os_log_impl(&dword_23FA42000, v30, OS_LOG_TYPE_DEFAULT, "[WARNING] Item %@ has %llu items with a new parent%@", buf, 0x20u);
              }

              uint64_t v32 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v28, "unsignedLongLongValue") + objc_msgSend(v116, "unsignedLongLongValue"));

              uint64_t v3 = (void *)v32;
            }
            else
            {
              id v6 = &OBJC_IVAR___BRCRecentsEnumeratorBatch__deletedItemIDs;
            }
          }
          else
          {
            uint64_t v3 = v116;
            id v6 = &OBJC_IVAR___BRCRecentsEnumeratorBatch__deletedItemIDs;
          }
          if ([v3 BOOLValue])
          {
            if (!self->_tombstonesEmbargo)
            {
              int v35 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
              tombstonesEmbargo = self->_tombstonesEmbargo;
              self->_tombstonesEmbargo = v35;
            }
            id v37 = brc_bread_crumbs();
            v38 = brc_default_log();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412802;
              *(void *)v129 = v11;
              *(_WORD *)&v129[8] = 2112;
              *(void *)&v129[10] = v3;
              *(_WORD *)&v129[18] = 2112;
              *(void *)&v129[20] = v37;
              _os_log_debug_impl(&dword_23FA42000, v38, OS_LOG_TYPE_DEBUG, "[DEBUG] Embargoing item %@: it has %@ unsynced children%@", buf, 0x20u);
            }

            [(NSMutableDictionary *)self->_tombstonesEmbargo setObject:v3 forKeyedSubscript:v11];
            uint64_t v16 = v3;
            if (!v3) {
              goto LABEL_36;
            }
LABEL_11:
            uint64_t v3 = v16;
            if ([v16 integerValue])
            {
              uint64_t v17 = brc_bread_crumbs();
              BOOL v18 = brc_default_log();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412802;
                *(void *)v129 = v11;
                *(_WORD *)&v129[8] = 2112;
                *(void *)&v129[10] = v16;
                *(_WORD *)&v129[18] = 2112;
                *(void *)&v129[20] = v17;
                _os_log_debug_impl(&dword_23FA42000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] Item %@ is embargoed: %@ unsynced children%@", buf, 0x20u);
              }

              [(NSMutableArray *)self->_stack removeAllObjects];
              goto LABEL_45;
            }
            v33 = brc_bread_crumbs();
            uint64_t v34 = brc_default_log();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)v129 = v11;
              *(_WORD *)&v129[8] = 2112;
              *(void *)&v129[10] = v33;
              _os_log_debug_impl(&dword_23FA42000, v34, OS_LOG_TYPE_DEBUG, "[DEBUG] Item %@ is un-embargoed%@", buf, 0x16u);
            }

            [(NSMutableDictionary *)self->_tombstonesEmbargo removeObjectForKey:v11];
          }
          else
          {

            uint64_t v3 = 0;
          }
LABEL_36:

LABEL_37:
          uint64_t v39 = [v4 st];
          uint64_t v11 = [v39 parentID];

          v40 = [(NSMutableDictionary *)self->_tombstonesEmbargo objectForKeyedSubscript:v11];

          if (v40)
          {
            uint64_t v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v40, "integerValue") - 1);

            char v41 = brc_bread_crumbs();
            char v42 = brc_default_log();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412802;
              *(void *)v129 = v11;
              *(_WORD *)&v129[8] = 2112;
              *(void *)&v129[10] = v3;
              *(_WORD *)&v129[18] = 2112;
              *(void *)&v129[20] = v41;
              _os_log_debug_impl(&dword_23FA42000, v42, OS_LOG_TYPE_DEBUG, "[DEBUG] Embargoed item %@ has now %@ unreturned dead children left%@", buf, 0x20u);
            }

            [(NSMutableDictionary *)self->_tombstonesEmbargo setObject:v3 forKeyedSubscript:v11];
          }
          else
          {
            id v43 = brc_bread_crumbs();
            id v44 = brc_default_log();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)v129 = v11;
              *(_WORD *)&v129[8] = 2112;
              *(void *)&v129[10] = v43;
              _os_log_debug_impl(&dword_23FA42000, v44, OS_LOG_TYPE_DEBUG, "[DEBUG] item %@ isn't embargoed%@", buf, 0x16u);
            }

            uint64_t v3 = 0;
          }
          if (![(BRCSyncUpEnumerator *)self _denyListDescendantStackAndItemIfThrottledOrNeedsOSUpgrade:v4 now:v115])
          {
            objc_msgSend(*(id *)((char *)&self->super.super.isa + v6[655]), "addIndex:", objc_msgSend(v4, "dbRowID"));
            id v114 = v4;
            int v14 = 1;
            goto LABEL_47;
          }
LABEL_45:
          int v14 = 4;
          goto LABEL_47;
        }
        int v14 = 3;
        uint64_t v3 = v12;
      }
      else
      {
        int v14 = 3;
      }
LABEL_47:

      char v5 = &OBJC_IVAR___BRCRecentsEnumeratorBatch__deletedItemIDs;
      if (v14 != 3)
      {
        if (v14 != 4)
        {
          id v113 = v114;
          goto LABEL_152;
        }
        break;
      }
    }
    if ([(NSMutableArray *)self->_stack count])
    {
      v103 = brc_bread_crumbs();
      v104 = brc_default_log();
      if (os_log_type_enabled(v104, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v129 = v103;
        _os_log_fault_impl(&dword_23FA42000, v104, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: _stack.count == 0%@", buf, 0xCu);
      }

      char v5 = &OBJC_IVAR___BRCRecentsEnumeratorBatch__deletedItemIDs;
    }
    long long v125 = 0u;
    long long v126 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    id obj = *(id *)((char *)&self->super.super.isa + v5[659]);
    uint64_t v45 = [obj countByEnumeratingWithState:&v123 objects:v127 count:16];
    if (!v45)
    {
      v53 = 0;
      id v113 = 0;
      uint64_t v48 = v4;
      goto LABEL_151;
    }
    uint64_t v46 = v45;
    v117 = v3;
    uint64_t v47 = *(void *)v124;
    uint64_t v48 = v4;
    uint64_t v120 = *(void *)v124;
    while (2)
    {
      uint64_t v49 = 0;
      uint64_t v121 = v46;
LABEL_53:
      if (*(void *)v124 != v47) {
        objc_enumerationMutation(obj);
      }
      id v4 = *(id *)(*((void *)&v123 + 1) + 8 * v49);

      uint64_t v50 = v6[655];
      if (objc_msgSend(*(id *)((char *)&self->super.super.isa + v50), "containsIndex:", objc_msgSend(v4, "dbRowID")))
      {
        uint64_t v48 = v4;
        goto LABEL_125;
      }
      uint64_t v119 = v50;
      v51 = [v4 itemID];
      BOOL v52 = [(BRCSyncUpEnumerator *)self isDenyListed:v51];

      if (v52)
      {
LABEL_124:
        uint64_t v48 = v4;
        uint64_t v47 = v120;
        uint64_t v46 = v121;
LABEL_125:
        if (++v49 == v46)
        {
          uint64_t v99 = [obj countByEnumeratingWithState:&v123 objects:v127 count:16];
          uint64_t v46 = v99;
          if (!v99)
          {
            v53 = 0;
            id v113 = 0;
            uint64_t v3 = v117;
            goto LABEL_151;
          }
          continue;
        }
        goto LABEL_53;
      }
      break;
    }
    [(NSMutableArray *)self->_stack addObject:v4];
    if ([(NSMutableArray *)self->_stack count] >= (unint64_t)self->_maxDepth)
    {
      uint64_t v48 = 0;
LABEL_110:
      v55 = brc_bread_crumbs();
      v87 = brc_default_log();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int maxDepth = self->_maxDepth;
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v129 = maxDepth;
        *(_WORD *)&v129[4] = 2112;
        *(void *)&v129[6] = v4;
        *(_WORD *)&v129[14] = 2112;
        *(void *)&v129[16] = v55;
        _os_log_impl(&dword_23FA42000, v87, OS_LOG_TYPE_DEFAULT, "[WARNING] max depth %u reached at %@%@", buf, 0x1Cu);
      }

LABEL_118:
      id v6 = &OBJC_IVAR___BRCRecentsEnumeratorBatch__deletedItemIDs;
      if (v48)
      {
        v91 = brc_bread_crumbs();
        v92 = brc_default_log();
        if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
        {
          v94 = [v48 debugItemIDString];
          *(_DWORD *)buf = 138412546;
          *(void *)v129 = v94;
          *(_WORD *)&v129[8] = 2112;
          *(void *)&v129[10] = v91;
          _os_log_debug_impl(&dword_23FA42000, v92, OS_LOG_TYPE_DEBUG, "[DEBUG] Fetching recursive contents of %@ because it is the highest dead parent dir-fault%@", buf, 0x16u);
        }
        v93 = [(BRCClientZone *)self->_clientZone fetchRecursiveDirectoryContentsIfNecessary:v48 isUserWaiting:0 rescheduleApply:1];
        [v93 beginObservingChanges];
      }
      if ([(NSMutableArray *)self->_stack count])
      {
        if ((unint64_t)[(NSMutableArray *)self->_stack count] >= 2)
        {
          unint64_t v100 = 1;
          do
          {
            v101 = [(NSMutableArray *)self->_stack objectAtIndexedSubscript:v100];
            v102 = [(NSMutableArray *)self->_stack objectAtIndexedSubscript:v100 - 1];
            [v101 checkIsInDocumentsScopeWithParent:v102];

            ++v100;
          }
          while (v100 < [(NSMutableArray *)self->_stack count]);
        }

        uint64_t v3 = v117;
        char v5 = &OBJC_IVAR___BRCRecentsEnumeratorBatch__deletedItemIDs;
        continue;
      }

      goto LABEL_124;
    }
    break;
  }
  uint64_t v48 = 0;
  char v118 = 0;
  v53 = v4;
  while (1)
  {
    v54 = [v53 st];
    v55 = [v54 parentID];

    if ([v53 isLost])
    {
      BOOL v56 = 1;
    }
    else if ([v53 isDirectory] && objc_msgSend(v53, "isDead"))
    {
      v57 = [v53 st];
      v58 = [v57 processingStamp];
      BOOL v56 = v58 != 0;
    }
    else
    {
      BOOL v56 = 0;
    }
    if ([v53 isDead] && objc_msgSend(v53, "isDirectory"))
    {
      if ((v118 & 1) != 0
        || ([v53 asDirectory],
            v59 = objc_claimAutoreleasedReturnValue(),
            BOOL v60 = [(BRCSyncUpEnumerator *)self _checkIfShouldDenylistForChildrenOfItemBeingCopiedToNewZone:v59], v59, v60))
      {
        long long v61 = brc_bread_crumbs();
        uint64_t v62 = brc_default_log();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)v129 = v53;
          *(_WORD *)&v129[8] = 2112;
          *(void *)&v129[10] = v61;
          _os_log_debug_impl(&dword_23FA42000, v62, OS_LOG_TYPE_DEBUG, "[DEBUG] denylist all deletes for item which has children being copied to a new zone %@%@", buf, 0x16u);
        }

        itemIDsWithChildrenBeingCopiedToNewZone = self->_itemIDsWithChildrenBeingCopiedToNewZone;
        uint64_t v64 = [v53 itemID];
        [(NSMutableSet *)itemIDsWithChildrenBeingCopiedToNewZone addObject:v64];

        char v118 = 1;
        if (v48)
        {
LABEL_73:
          uint64_t v65 = [v53 asDirectory];
          int v66 = [v65 isDirectoryFault];

          if (!v66)
          {
LABEL_87:
            itemIDsNeedingDirectoryFetch = self->_itemIDsNeedingDirectoryFetch;
            v77 = [v53 itemID];
            [(NSMutableSet *)itemIDsNeedingDirectoryFetch addObject:v77];

            goto LABEL_88;
          }
LABEL_79:
          if ([v53 isSharedToMeTopLevelItem])
          {
            v71 = brc_bread_crumbs();
            v72 = brc_default_log();
            if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)v129 = v53;
              *(_WORD *)&v129[8] = 2112;
              *(void *)&v129[10] = v71;
              _os_log_debug_impl(&dword_23FA42000, v72, OS_LOG_TYPE_DEBUG, "[DEBUG] Highest parent dead fault is nil because it's a shared-to-me top level item - %@%@", buf, 0x16u);
            }

            uint64_t v73 = 0;
          }
          else
          {
            v74 = brc_bread_crumbs();
            __int16 v75 = brc_default_log();
            if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
            {
              v83 = [v53 itemID];
              v84 = [v83 itemIDString];
              *(_DWORD *)buf = 138412546;
              *(void *)v129 = v84;
              *(_WORD *)&v129[8] = 2112;
              *(void *)&v129[10] = v74;
              _os_log_debug_impl(&dword_23FA42000, v75, OS_LOG_TYPE_DEBUG, "[DEBUG] Highest parent dead fault is %@%@", buf, 0x16u);
            }
            uint64_t v73 = [v53 itemID];
          }

          uint64_t v48 = (void *)v73;
          goto LABEL_87;
        }
      }
      else
      {
        char v118 = 0;
        if (v48) {
          goto LABEL_73;
        }
      }
      long long v67 = self->_itemIDsNeedingDirectoryFetch;
      long long v68 = [v53 itemID];
      if ([(NSMutableSet *)v67 containsObject:v68])
      {
      }
      else
      {
        long long v69 = [v53 asDirectory];
        char v70 = [v69 containsDirFault];

        if ((v70 & 1) == 0)
        {
          uint64_t v48 = 0;
          goto LABEL_88;
        }
      }
      goto LABEL_79;
    }
LABEL_88:
    if ([v53 isSharedToMeTopLevelItem]
      && [v53 isDirectory]
      && [v53 isAlmostDead]
      && [(BRCClientZone *)self->_clientZone isSharedZone])
    {
      break;
    }
    uint64_t v78 = [(NSMutableDictionary *)self->_visitedItemIDsToDepthMap objectForKey:v55];
    if (v78 && (v79 = (void *)v78, char v80 = [v53 isLost], v79, (v80 & 1) == 0))
    {
      if ([v53 isLive]) {
        goto LABEL_117;
      }
      if (([v53 isDead] & 1) == 0)
      {
        v85 = brc_bread_crumbs();
        v86 = brc_default_log();
        if (os_log_type_enabled(v86, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v129 = v85;
          _os_log_fault_impl(&dword_23FA42000, v86, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: item.isDead%@", buf, 0xCu);
        }
      }
    }
    else
    {
      if (v56 || [(NSMutableSet *)self->_itemIDsLostOrThrottled containsObject:v55])
      {
        v89 = brc_bread_crumbs();
        v90 = brc_default_log();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)v129 = v53;
          *(_WORD *)&v129[8] = 2112;
          *(void *)&v129[10] = v89;
          _os_log_debug_impl(&dword_23FA42000, v90, OS_LOG_TYPE_DEBUG, "[DEBUG] denylisting %@ and its descendants%@", buf, 0x16u);
        }

        [(BRCSyncUpEnumerator *)self _denyListDescendantStack:self->_stack parentItem:v53 andAddToSet:self->_itemIDsLostOrThrottled];
        goto LABEL_117;
      }
      if ([(BRCSyncUpEnumerator *)self handleItemForOSUpgrade:v53 parentItemID:v55])
      {
        goto LABEL_117;
      }
    }
    v81 = [v53 parentItemIDInZone];
    if ([v81 isNonDesktopRoot])
    {

LABEL_117:
      id v4 = v53;
      goto LABEL_118;
    }
    if (!v81
      || ([v53 clientZone],
          v82 = objc_claimAutoreleasedReturnValue(),
          [v82 itemByItemID:v81],
          id v4 = (id)objc_claimAutoreleasedReturnValue(),
          v82,
          !v4))
    {
      v109 = brc_bread_crumbs();
      v110 = brc_default_log();
      if (os_log_type_enabled(v110, OS_LOG_TYPE_FAULT))
      {
        clientZone = self->_clientZone;
        *(_DWORD *)buf = 138412802;
        *(void *)v129 = clientZone;
        *(_WORD *)&v129[8] = 2112;
        *(void *)&v129[10] = v53;
        *(_WORD *)&v129[18] = 2112;
        *(void *)&v129[20] = v109;
        _os_log_fault_impl(&dword_23FA42000, v110, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: reset needed for %@ because of orphan %@%@", buf, 0x20u);
      }

      [(BRCClientZone *)self->_clientZone scheduleResetServerAndClientTruthsForReason:@"orphan.tombstone"];
      id v113 = 0;
      goto LABEL_150;
    }

    [(NSMutableArray *)self->_stack addObject:v4];
    v53 = v4;
    if ([(NSMutableArray *)self->_stack count] >= (unint64_t)self->_maxDepth) {
      goto LABEL_110;
    }
  }
  v95 = brc_bread_crumbs();
  v96 = brc_default_log();
  if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)v129 = v53;
    *(_WORD *)&v129[8] = 2112;
    *(void *)&v129[10] = v95;
    _os_log_debug_impl(&dword_23FA42000, v96, OS_LOG_TYPE_DEBUG, "[DEBUG] denylist all children deletes when leaving top level folder share %@%@", buf, 0x16u);
  }

  [(BRCSyncUpEnumerator *)self _denyListDescendantStack:self->_stack parentItem:v53 andAddToSet:self->_itemIDsLostOrThrottled];
  if (v118 & 1 | (([v53 isDead] & 1) == 0)) {
    goto LABEL_117;
  }
  v97 = self->_itemIDsWithChildrenBeingCopiedToNewZone;
  v98 = [v53 itemID];
  LOBYTE(v97) = [(NSMutableSet *)v97 containsObject:v98];

  if (v97)
  {
    id v4 = v53;
    goto LABEL_118;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.isa + v119), "addIndex:", objc_msgSend(v53, "dbRowID"));
  id v113 = v53;
LABEL_150:
  uint64_t v3 = v117;

LABEL_151:
  id v4 = v53;
LABEL_152:

  return v113;
}

- (id)nextObject
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int stage = self->_stage;
  if (stage <= 3)
  {
    do
    {
      if ((stage - 1) > 1)
      {
        if (stage == 3)
        {
          id v4 = [(BRCSyncUpEnumerator *)self _nextTombstone];
          if (v4) {
            goto LABEL_26;
          }
        }
      }
      else
      {
        id v4 = [(BRCSyncUpEnumerator *)self _nextLiveItem];
        if (v4) {
          goto LABEL_26;
        }
      }
      int stage = self->_stage + 1;
      self->_int stage = stage;
      switch(stage)
      {
        case 0:
          enumerator = brc_bread_crumbs();
          id v6 = brc_default_log();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v16 = enumerator;
            _os_log_fault_impl(&dword_23FA42000, v6, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Sync: shouldn't be here%@", buf, 0xCu);
          }
          goto LABEL_22;
        case 1:
          char v7 = brc_bread_crumbs();
          BOOL v8 = brc_default_log();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v16 = v7;
            _os_log_debug_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: enumerating documents needing sync up%@", buf, 0xCu);
          }

          BOOL v9 = [(BRCSyncUpEnumerator *)self _documentsOrAliasesNeedingSyncUpEnumerator];
          goto LABEL_19;
        case 2:
          id v10 = brc_bread_crumbs();
          uint64_t v11 = brc_default_log();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v16 = v10;
            _os_log_debug_impl(&dword_23FA42000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: enumerating live or new directories%@", buf, 0xCu);
          }

          BOOL v9 = [(BRCSyncUpEnumerator *)self _liveDirectoriesNeedingSyncUpEnumerator];
          goto LABEL_19;
        case 3:
          uint64_t v12 = brc_bread_crumbs();
          uint64_t v13 = brc_default_log();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v16 = v12;
            _os_log_debug_impl(&dword_23FA42000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: enumerating tombstones%@", buf, 0xCu);
          }

          BOOL v9 = [(BRCSyncUpEnumerator *)self _tombstoneLeavesNeedingSyncUpEnumerator];
LABEL_19:
          enumerator = self->_enumerator;
          self->_enumerator = v9;
          goto LABEL_23;
        case 4:
          enumerator = brc_bread_crumbs();
          id v6 = brc_default_log();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v16 = enumerator;
            _os_log_debug_impl(&dword_23FA42000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: done enumerating all stages%@", buf, 0xCu);
          }
LABEL_22:

LABEL_23:
          int stage = self->_stage;
          break;
        default:
          break;
      }
    }
    while (stage < 4);
  }
  id v4 = 0;
LABEL_26:
  return v4;
}

- (unsigned)batchSize
{
  return self->_batchSize;
}

- (unint64_t)retryAfter
{
  return self->_retryAfter;
}

- (NSMutableSet)chainedParentIDAllowlist
{
  return self->_chainedParentIDAllowlist;
}

- (NSMutableArray)itemsNeedingUnshare
{
  return self->_itemsNeedingUnshare;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsNeedingUnshare, 0);
  objc_storeStrong((id *)&self->_chainedParentIDAllowlist, 0);
  objc_storeStrong((id *)&self->_tooDeepItems, 0);
  objc_storeStrong((id *)&self->_stack, 0);
  objc_storeStrong((id *)&self->_enumerator, 0);
  objc_storeStrong((id *)&self->_returned, 0);
  objc_storeStrong((id *)&self->_tombstonesEmbargo, 0);
  objc_storeStrong((id *)&self->_itemIDsWithChildrenBeingCopiedToNewZone, 0);
  objc_storeStrong((id *)&self->_itemIDsNeedingDirectoryFetch, 0);
  objc_storeStrong((id *)&self->_itemIDsNeedingOSUpgrade, 0);
  objc_storeStrong((id *)&self->_itemIDsLostOrThrottled, 0);
  objc_storeStrong((id *)&self->_visitedItemIDsToDepthMap, 0);
  objc_storeStrong((id *)&self->_clientZone, 0);
}

- (void)_denyListDescendantStackAndItemIfThrottledOrNeedsOSUpgrade:now:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Sync: denylist %@ because it needs a newer OS to sync up%@");
}

- (void)handleItemForOSUpgrade:parentItemID:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] marking needs-upgrade %@ and its descendants%@");
}

- (void)_handleSharedItemWhichMovedToNewShare:rootItem:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_23FA42000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Unexpected item %@. Ignoring%@", v1, 0x16u);
}

- (void)_handleSharedItemWhichMovedToNewShare:rootItem:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Just learning share property changes from %@%@");
}

- (void)_handleSharedItemWhichMovedToNewShare:rootItem:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] We need to unshare %@%@");
}

- (void)_checkForSharesWithinSharesWithItem:(uint8_t *)buf .cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_23FA42000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: denylist %@ because it is moving into a share and has shared children%@", buf, 0x16u);
}

- (void)_checkForSharesWithinSharesWithItem:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  char v5 = [a1 itemID];
  int v6 = 138412546;
  char v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_23FA42000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: denylist %@ for item share-within-share processing%@", (uint8_t *)&v6, 0x16u);
}

- (void)_handlePendingShareItemWithPendingDeleteChildren:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_23FA42000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Not waiting for deletes because of a default%@", (uint8_t *)&v2, 0xCu);
}

- (void)_nextLiveItem
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_23FA42000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: _stack.count == 0%@", (uint8_t *)&v2, 0xCu);
}

@end