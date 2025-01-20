@interface BRCAliasItem
+ (id)targetReferenceWithItemID:(id)a3 targetZone:(id)a4 isFolderShare:(BOOL)a5;
+ (void)fillStructureRecord:(id)a3 inZone:(id)a4 itemID:(id)a5 ckInfo:(id)a6 parentID:(id)a7 targetItemID:(id)a8 targetZone:(id)a9 diffs:(unint64_t)a10 isFolderShare:(BOOL)a11 beingDeadInServerTruth:(BOOL)a12 shouldPCSChainStatus:(unsigned __int8)a13;
- (BOOL)_insertInDB:(id)a3 dbRowID:(unint64_t)a4;
- (BOOL)_updateInDB:(id)a3 diffs:(unint64_t)a4;
- (BOOL)isBRAlias;
- (BRCClientZone)targetClientZone;
- (BRCItemID)targetItemID;
- (id)structureRecordBeingDeadInServerTruth:(BOOL)a3 stageID:(id)a4 shouldPCSChainStatus:(unsigned __int8)a5;
- (void)isBRAlias;
- (void)markLatestSyncRequestRejectedInZone:(id)a3;
- (void)markNeedsUploadOrSyncingUp;
@end

@implementation BRCAliasItem

+ (id)targetReferenceWithItemID:(id)a3 targetZone:(id)a4 isFolderShare:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v8 zoneID];
  if (a5)
  {
    v10 = @"directory/";
  }
  else
  {
    int v11 = [v8 isSharedZone];
    v10 = @"documentStructure/";
    if (v11) {
      v10 = @"documentContent/";
    }
  }
  v12 = v10;
  v13 = [v7 itemIDString];
  v14 = [(__CFString *)v12 stringByAppendingString:v13];

  v15 = (void *)[objc_alloc(MEMORY[0x263EFD7E8]) initWithRecordName:v14 zoneID:v9];
  v16 = (void *)[objc_alloc(MEMORY[0x263EFD820]) initWithRecordID:v15 action:0];

  return v16;
}

+ (void)fillStructureRecord:(id)a3 inZone:(id)a4 itemID:(id)a5 ckInfo:(id)a6 parentID:(id)a7 targetItemID:(id)a8 targetZone:(id)a9 diffs:(unint64_t)a10 isFolderShare:(BOOL)a11 beingDeadInServerTruth:(BOOL)a12 shouldPCSChainStatus:(unsigned __int8)a13
{
  id v33 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  if (a12)
  {
    BOOL v24 = 1;
  }
  else
  {
    v25 = [v20 etag];
    BOOL v24 = v25 == 0;
  }
  if ((a13 & 0x2C) != 0 || (a10 & 0x20) != 0 || v24)
  {
    v26 = [v21 validatingDirectoryReferenceInZone:v18];
    [v33 setObject:v26 forKeyedSubscript:@"parent"];

    if ((a13 & 0x3C) != 0)
    {
      v27 = [v21 pcsChainParentReferenceInZone:v18];
      [v33 setParent:v27];
    }
  }
  if (v24)
  {
    if ([v23 isPrivateZone]) {
      v28 = v22;
    }
    else {
      v28 = v19;
    }
    v29 = [v28 itemIDString];
    v30 = objc_msgSend(v29, "brc_SHA256");
    [v33 setObject:v30 forKeyedSubscript:@"basehash"];

    v31 = [a1 targetReferenceWithItemID:v22 targetZone:v23 isFolderShare:a11];
    [v33 setObject:v31 forKeyedSubscript:@"target"];
  }
  if (!a12) {
    [v33 serializeSystemFields:v20];
  }
}

- (id)structureRecordBeingDeadInServerTruth:(BOOL)a3 stageID:(id)a4 shouldPCSChainStatus:(unsigned __int8)a5
{
  v6 = [(BRCLocalItem *)self baseStructureRecord];
  id v7 = objc_opt_class();
  serverZone = self->super._serverZone;
  itemID = self->super._itemID;
  v10 = [(BRCStatInfo *)self->super._st ckInfo];
  int v11 = [(BRCStatInfo *)self->super._st parentID];
  v12 = [(BRCAliasItem *)self targetItemID];
  v13 = [(BRCAliasItem *)self targetClientZone];
  v14 = [v13 serverZone];
  BYTE2(v16) = a5;
  BYTE1(v16) = a3;
  LOBYTE(v16) = 0;
  objc_msgSend(v7, "fillStructureRecord:inZone:itemID:ckInfo:parentID:targetItemID:targetZone:diffs:isFolderShare:beingDeadInServerTruth:shouldPCSChainStatus:", v6, serverZone, itemID, v10, v11, v12, v14, self->super._localDiffs | -[BRCLocalItem diffAgainstOriginalItem](self, "diffAgainstOriginalItem"), v16);

  return v6;
}

- (BOOL)isBRAlias
{
  if ([(BRCStatInfo *)self->super._st type] != 3)
  {
    v3 = brc_bread_crumbs();
    v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      [(BRCAliasItem *)(uint64_t)v3 isBRAlias];
    }
  }
  return 1;
}

- (BOOL)_insertInDB:(id)a3 dbRowID:(unint64_t)a4
{
  id v45 = a3;
  v27 = [(BRCServerZone *)self->super._serverZone dbRowID];
  itemID = self->super._itemID;
  ownerKey = self->super._ownerKey;
  unint64_t sharingOptions = self->super._sharingOptions;
  sideCarCKInfo = self->super._sideCarCKInfo;
  parentZoneRowID = self->super._parentZoneRowID;
  unint64_t localDiffs = self->super._localDiffs;
  unint64_t notifsRank = self->super._notifsRank;
  uint64_t syncUpState = self->super._syncUpState;
  v39 = [(BRCLocalItem *)self appLibrary];
  v43 = [v39 dbRowID];
  minimumSupportedOSRowID = self->super._minimumSupportedOSRowID;
  BOOL isUserVisible = self->super._isUserVisible;
  v44 = [(BRCStatInfo *)self->super._st ckInfo];
  int v26 = [(BRCStatInfo *)self->super._st state];
  int v21 = [(BRCStatInfo *)self->super._st type];
  int v25 = [(BRCStatInfo *)self->super._st mode];
  int64_t v24 = [(BRCStatInfo *)self->super._st birthtime];
  int64_t v23 = [(BRCStatInfo *)self->super._st lastUsedTime];
  int64_t v22 = [(BRCStatInfo *)self->super._st favoriteRank];
  v42 = [(BRCStatInfo *)self->super._st parentID];
  st = self->super._st;
  logicalName = (__CFString *)st->super._logicalName;
  if (!logicalName) {
    logicalName = &stru_26F3822F0;
  }
  id v20 = logicalName;
  BOOL v7 = [(BRCStatInfo *)st isHiddenExt];
  id v8 = [(BRCStatInfo *)self->super._st finderTags];
  v41 = [(BRCStatInfo *)self->super._st xattrSignature];
  v40 = [(BRCStatInfo *)self->super._st trashPutBackPath];
  id v19 = [(BRCStatInfo *)self->super._st trashPutBackParentID];
  id v18 = [(BRCStatInfo *)self->super._st aliasTarget];
  v9 = [(BRCStatInfo *)self->super._st creatorRowID];
  v10 = [(BRCLocalStatInfo *)self->super._st processingStamp];
  int v11 = [(BRCLocalStatInfo *)self->super._st rawBouncedLogicalName];
  unsigned int v12 = [(BRCLocalStatInfo *)self->super._st itemScope];
  unint64_t v13 = [(BRCLocalStatInfo *)self->super._st localChangeCount];
  v14 = [(BRCLocalStatInfo *)self->super._st oldVersionIdentifier];
  v15 = [(BRCLocalStatInfo *)self->super._st fpCreationItemIdentifier];
  if (objc_msgSend(v45, "execute:", @"INSERT INTO client_items(rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier) VALUES(%lld, %@, %@, %@, %ld, %@, %@, %d, %lld, %lld, %@, %@, %d, %@, %d, %d, %d, %lld, %lld, %lld, %@, %@, %d, %@, %@, %@, %@, %@, %@, %@, %@, %d, %llu, %@, %@)", a4, v27, itemID, ownerKey, sharingOptions, sideCarCKInfo, parentZoneRowID, syncUpState, localDiffs, notifsRank, v43, minimumSupportedOSRowID, isUserVisible, v44, v26, v21,
                       v25,
                       v24,
                       v23,
                       v22,
                       v42,
                       v20,
                       v7,
                       v8,
                       v41,
                       v40,
                       v19,
                       v18,
                       v9,
                       v10,
                       v11,
                       v12,
                       v13,
                       v14,
                       v15))
  {
    v46.receiver = self;
    v46.super_class = (Class)BRCAliasItem;
    BOOL v16 = [(BRCLocalItem *)&v46 _insertInDB:v45 dbRowID:a4];
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)_updateInDB:(id)a3 diffs:(unint64_t)a4
{
  id v35 = a3;
  id v45 = [(BRCClientZone *)self->super._clientZone dbRowID];
  itemID = self->super._itemID;
  ownerKey = self->super._ownerKey;
  unint64_t sharingOptions = self->super._sharingOptions;
  sideCarCKInfo = self->super._sideCarCKInfo;
  parentZoneRowID = self->super._parentZoneRowID;
  unint64_t localDiffs = self->super._localDiffs;
  unint64_t notifsRank = self->super._notifsRank;
  uint64_t syncUpState = self->super._syncUpState;
  v40 = [(BRCLocalItem *)self appLibrary];
  v44 = [v40 dbRowID];
  minimumSupportedOSRowID = self->super._minimumSupportedOSRowID;
  BOOL isUserVisible = self->super._isUserVisible;
  v43 = [(BRCStatInfo *)self->super._st ckInfo];
  int v19 = [(BRCStatInfo *)self->super._st state];
  int v29 = [(BRCStatInfo *)self->super._st type];
  int v28 = [(BRCStatInfo *)self->super._st mode];
  int64_t v5 = [(BRCStatInfo *)self->super._st birthtime];
  int64_t v26 = [(BRCStatInfo *)self->super._st lastUsedTime];
  int64_t v25 = [(BRCStatInfo *)self->super._st favoriteRank];
  v6 = [(BRCStatInfo *)self->super._st parentID];
  st = self->super._st;
  logicalName = (__CFString *)st->super._logicalName;
  if (!logicalName) {
    logicalName = &stru_26F3822F0;
  }
  int64_t v23 = logicalName;
  BOOL v21 = [(BRCStatInfo *)st isHiddenExt];
  v42 = [(BRCStatInfo *)self->super._st finderTags];
  v41 = [(BRCStatInfo *)self->super._st xattrSignature];
  int64_t v24 = [(BRCStatInfo *)self->super._st trashPutBackPath];
  int64_t v22 = [(BRCStatInfo *)self->super._st trashPutBackParentID];
  id v20 = [(BRCStatInfo *)self->super._st aliasTarget];
  v9 = [(BRCStatInfo *)self->super._st creatorRowID];
  v10 = [(BRCLocalStatInfo *)self->super._st processingStamp];
  int v11 = [(BRCLocalStatInfo *)self->super._st rawBouncedLogicalName];
  unsigned int v12 = [(BRCLocalStatInfo *)self->super._st itemScope];
  unint64_t v13 = [(BRCLocalStatInfo *)self->super._st localChangeCount];
  v14 = [(BRCLocalStatInfo *)self->super._st oldVersionIdentifier];
  v15 = [(BRCLocalStatInfo *)self->super._st fpCreationItemIdentifier];
  if (objc_msgSend(v35, "execute:", @"UPDATE client_items SET  zone_rowid = %@, item_id = %@, item_creator_id = %@, item_sharing_options = %ld, item_side_car_ckinfo = %@, item_parent_zone_rowid = %@, item_localsyncupstate = %d, item_local_diffs = %llu, item_notifs_rank = %lld, app_library_rowid = %@, item_min_supported_os_rowid = %@, item_user_visible = %d, item_stat_ckinfo = %@, item_state = %d, item_type = %d, item_mode = %d, item_birthtime = %lld, item_lastusedtime = %lld, item_favoriterank = %lld, item_parent_id = %@, item_filename = %@, item_hidden_ext = %d, item_finder_tags = %@, item_xattr_signature = %@, item_trash_put_back_path = %@, item_trash_put_back_parent_id = %@, item_alias_target = %@, item_creator = %@, item_processing_stamp = %@, item_bouncedname = %@, item_scope = %d,item_local_change_count = %llu, item_old_version_identifier = %@,fp_creation_item_identifier = %@  WHERE rowid = %llu", v45, itemID, ownerKey, sharingOptions, sideCarCKInfo, parentZoneRowID, syncUpState, localDiffs, notifsRank, v44, minimumSupportedOSRowID, isUserVisible, v43, v19, v29, v28,
                       v5,
                       v26,
                       v25,
                       v6,
                       v23,
                       v21,
                       v42,
                       v41,
                       v24,
                       v22,
                       v20,
                       v9,
                       v10,
                       v11,
                       v12,
                       v13,
                       v14,
                       v15,
                       self->super._dbRowID))
  {
    v46.receiver = self;
    v46.super_class = (Class)BRCAliasItem;
    BOOL v16 = [(BRCLocalItem *)&v46 _updateInDB:v35 diffs:a4];
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (BRCClientZone)targetClientZone
{
  session = self->super._session;
  v3 = [(BRCStatInfo *)self->super._st _aliasTargetMangledID];
  v4 = [(BRCAccountSessionFPFS *)session clientZoneByMangledID:v3];

  return (BRCClientZone *)v4;
}

- (BRCItemID)targetItemID
{
  return (BRCItemID *)[(BRCStatInfo *)self->super._st _aliasTargetItemID];
}

- (void)markNeedsUploadOrSyncingUp
{
}

- (void)markLatestSyncRequestRejectedInZone:(id)a3
{
  self->super._unint64_t localDiffs = 0;
  id v4 = a3;
  int64_t v5 = brc_bread_crumbs();
  v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[BRCAliasItem markLatestSyncRequestRejectedInZone:]((uint64_t)v5, v6);
  }

  v7.receiver = self;
  v7.super_class = (Class)BRCAliasItem;
  [(BRCLocalItem *)&v7 markLatestSyncRequestRejectedInZone:v4];
}

- (void)isBRAlias
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_23FA42000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: _st.type == BRC_ITEM_TYPE_ALIAS%@", (uint8_t *)&v2, 0xCu);
}

- (void)markLatestSyncRequestRejectedInZone:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_23FA42000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Forcing rejection of alias item%@", (uint8_t *)&v2, 0xCu);
}

@end