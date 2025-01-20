@interface BRCSharingSaveShareOperation
- (BRCSharingSaveShareOperation)initWithShare:(id)a3 zone:(id)a4 sessionContext:(id)a5;
- (id)createActivity;
- (void)main;
- (void)performAfterUnsharingParentShareTurdIfNecessary:(id)a3;
@end

@implementation BRCSharingSaveShareOperation

- (BRCSharingSaveShareOperation)initWithShare:(id)a3 zone:(id)a4 sessionContext:(id)a5
{
  v8 = (void *)MEMORY[0x263EFD780];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = objc_msgSend(v8, "br_sharingMisc");
  [(_BRCOperation *)self setGroup:v12];

  v13 = [v11 recordID];
  v14 = [v13 recordName];
  v15 = [@"sharing/save-share" stringByAppendingPathComponent:v14];

  v18.receiver = self;
  v18.super_class = (Class)BRCSharingSaveShareOperation;
  v16 = [(BRCSharingModifyShareOperation *)&v18 initWithName:v15 zone:v10 share:v11 sessionContext:v9];

  return v16;
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_23FA42000, "sharing/save-share", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)performAfterUnsharingParentShareTurdIfNecessary:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(BRCServerZone *)self->super._serverZone mangledID];
  v6 = +[BRCUserDefaults defaultsForMangledID:v5];
  uint64_t v7 = [v6 maxSyncPathDepth];

  v8 = [(BRCServerZone *)self->super._serverZone clientZone];
  id v9 = [v8 db];
  itemID = self->super._itemID;
  id v11 = [(BRCServerZone *)self->super._serverZone dbRowID];
  v12 = [(BRCServerZone *)self->super._serverZone dbRowID];
  v13 = (void *)[v9 itemIDWithSQL:@" WITH RECURSIVE item_parents (item_id, item_sharing_options, item_parent_id) AS(         SELECT item_id, item_sharing_options, item_parent_id FROM server_items           WHERE item_id = %@ AND zone_rowid = %@       UNION ALL          SELECT li.item_id, li.item_sharing_options, li.item_parent_id FROM server_items AS li     INNER JOIN item_parents AS p WHERE li.zone_rowid = %@ AND p.item_parent_id = li.item_id          LIMIT %u)        SELECT item_id FROM item_parents WHERE (item_sharing_options & %lu) == 4 AND item_id != %@ ", itemID, v11, v12, v7, 124, self->super._itemID];

  if (v13)
  {
    v14 = brc_bread_crumbs();
    v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v26 = v13;
      __int16 v27 = 2112;
      v28 = v14;
      _os_log_impl(&dword_23FA42000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] Unsharing turd folder share %@%@", buf, 0x16u);
    }

    id v16 = objc_alloc(MEMORY[0x263EFD7E8]);
    v17 = [(BRCServerZone *)self->super._serverZone zoneID];
    objc_super v18 = (void *)[v16 initShareIDWithItemID:v13 zoneID:v17];

    id v19 = objc_alloc(MEMORY[0x263EFD748]);
    v24 = v18;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
    v21 = (void *)[v19 initWithRecordsToSave:0 recordIDsToDelete:v20];

    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __80__BRCSharingSaveShareOperation_performAfterUnsharingParentShareTurdIfNecessary___block_invoke;
    v22[3] = &unk_2650823B0;
    v22[4] = self;
    id v23 = v4;
    [v21 setModifyRecordsCompletionBlock:v22];
    [(_BRCOperation *)self addSubOperation:v21];
  }
  else
  {
    (*((void (**)(id, BRCSharingSaveShareOperation *, void))v4 + 2))(v4, self, 0);
  }
}

uint64_t __80__BRCSharingSaveShareOperation_performAfterUnsharingParentShareTurdIfNecessary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a4);
}

- (void)main
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: no share record%@", v2, v3, v4, v5, v6);
}

void __36__BRCSharingSaveShareOperation_main__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v99 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    id v7 = *(id *)(*(void *)(a1 + 32) + 536);
    id v8 = *(id *)(*(void *)(a1 + 32) + 520);
    id v9 = [v8 clientZone];
    if ([*(id *)(*(void *)(a1 + 32) + 528) isKnownToServer]) {
      int v10 = 0;
    }
    else {
      int v10 = [v9 isPrivateZone];
    }
    id v11 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
    [v11 addObject:*(void *)(*(void *)(a1 + 32) + 528)];
    v12 = [v9 itemByItemID:v7];
    v87 = [v9 serverItemByItemID:v7];
    if (([v12 isShareableItem] & 1) == 0)
    {
      v20 = *(void **)(a1 + 32);
      v21 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotShareable");
      [v20 completedWithResult:0 error:v21];

      goto LABEL_77;
    }
    int v80 = v10;
    v85 = v9;
    v86 = v11;
    id v84 = v8;
    uint64_t v13 = [v12 localDiffs];
    v14 = [*(id *)(a1 + 32) syncContext];
    v15 = [v14 session];
    id v16 = [v15 syncUpScheduler];
    uint64_t v17 = [v16 inFlightDiffsForItem:v12];

    if (([v12 sharingOptions] & 0x48) != 0 && (objc_msgSend(v12, "sharingOptions") & 4) == 0)
    {
      objc_super v18 = *(void **)(a1 + 32);
      id v19 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemAlreadyPartOfAShare");
      [v18 completedWithResult:0 error:v19];

LABEL_12:
      id v8 = v84;
      id v9 = v85;
LABEL_13:
      id v11 = v86;
LABEL_77:

      goto LABEL_78;
    }
    id v83 = v7;
    v22 = [v12 appLibrary];
    id v23 = [v22 mangledID];
    v24 = +[BRCUserDefaults defaultsForMangledID:v23];
    int v25 = [v24 preventSharingFolderWithPendingDelete];

    if (v25)
    {
      if ([v12 isDirectory])
      {
        if (([v12 isShared] & 1) == 0)
        {
          v26 = [v12 asDirectory];
          int v27 = [v26 containsPendingDeleteDocuments];

          if (v27)
          {
            v28 = *(void **)(a1 + 32);
            uint64_t v29 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorNotInCloud:", 0);
            [v28 completedWithResult:0 error:v29];

            id v7 = v83;
            goto LABEL_12;
          }
        }
      }
    }
    uint64_t v30 = v17 | v13;
    if ([v12 isDirectory]
      && ([v12 isSharedToMeTopLevelItem] & 1) == 0
      && [v87 pcsChainState] != 2
      && [v87 pcsChainState] != 3
      && (v30 & 0x1000000000000000) == 0)
    {
      v44 = *(void **)(a1 + 32);
      v45 = brc_bread_crumbs();
      v46 = brc_default_log();
      id v7 = v83;
      id v9 = v85;
      if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT)) {
        __36__BRCSharingSaveShareOperation_main__block_invoke_cold_2(v12, (uint64_t)v45, v46);
      }

      v47 = (void *)MEMORY[0x263F087E8];
      uint64_t v48 = *MEMORY[0x263F32430];
      v49 = [v12 itemID];
      v50 = objc_msgSend(v47, "br_errorWithDomain:code:description:", v48, 15, @"unreachable: directory %@ isn't pcs chained", v49);

      [v44 completedWithResult:0 error:v50];
      id v8 = v84;
      goto LABEL_13;
    }
    if ([v12 isInTrashScope])
    {
      v31 = *(void **)(a1 + 32);
      v32 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemInTrash");
      [v31 completedWithResult:0 error:v32];
    }
    id v7 = v83;
    if (!v87 || (v30 & 0x40) != 0) {
      v33 = v12;
    }
    else {
      v33 = v87;
    }
    v34 = [v33 st];
    uint64_t v35 = [v34 logicalName];

    v79 = (void *)v35;
    if ([v12 isDocument])
    {
      v36 = [v12 asDocument];
      v37 = [v36 currentVersion];
      v38 = [v37 originalPOSIXName];
      if ([v38 isEqualToString:v35])
      {
        int v39 = 0;
      }
      else
      {
        v40 = [v12 clientZone];
        int v39 = [v40 isPrivateZone];
      }
    }
    else
    {
      int v39 = 0;
    }
    char v41 = v39 | v80;
    if ((v39 | v80) == 1)
    {
      int v81 = v39;
      id v42 = *(id *)(*(void *)(a1 + 32) + 544);
      id v11 = v86;
      if (!v42)
      {
        if ([v12 isDocument])
        {
          v43 = [v12 asDocument];
          [v43 baseRecord];
        }
        else
        {
          v43 = [v12 asDirectory];
          [v43 folderRootStructureRecord];
        }
        id v42 = (id)objc_claimAutoreleasedReturnValue();

        if (!v42)
        {
          v68 = brc_bread_crumbs();
          v69 = brc_default_log();
          id v7 = v83;
          if (os_log_type_enabled(v69, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 138412802;
            id v94 = v83;
            __int16 v95 = 2112;
            v96 = v12;
            __int16 v97 = 2112;
            v98 = v68;
            _os_log_error_impl(&dword_23FA42000, v69, (os_log_type_t)0x90u, "[ERROR] Couldn't get base record for %@, %@%@", buf, 0x20u);
          }

          v70 = *(void **)(a1 + 32);
          v71 = brc_bread_crumbs();
          v72 = brc_default_log();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT)) {
            __36__BRCSharingSaveShareOperation_main__block_invoke_cold_1();
          }

          v73 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: couldn't get base record");
          [v70 completedWithResult:0 error:v73];

          id v9 = v85;
          goto LABEL_76;
        }
      }
      v51 = [v42 routingKey];
      if (v51)
      {
        [v42 setRoutingKey:v51];
      }
      else
      {
        v52 = [*(id *)(*(void *)(a1 + 32) + 528) routingKey];
        [v42 setRoutingKey:v52];
      }
      v53 = [v42 baseToken];
      if (v53)
      {
        [v42 setBaseToken:v53];
      }
      else
      {
        v54 = [*(id *)(*(void *)(a1 + 32) + 528) baseToken];
        [v42 setBaseToken:v54];
      }
      v55 = [v42 mutableEncryptedPublicSharingKeyData];
      if (v55)
      {
        [v42 setMutableEncryptedPublicSharingKeyData:v55];
      }
      else
      {
        v56 = [*(id *)(*(void *)(a1 + 32) + 528) publicSharingIdentity];
        [v42 setMutableEncryptedPublicSharingKeyData:v56];
      }
      if ([v12 isDocument])
      {
        v57 = [v12 asDocument];
        [v57 currentVersion];
      }
      else
      {
        v57 = [v12 asDirectory];
        [v57 st];
      v58 = };
      v59 = [v58 ckInfo];
      [v42 serializeSystemFields:v59];

      if (v81)
      {
        v60 = +[BRCUserDefaults defaultsForMangledID:0];
        uint64_t v61 = [v60 supportsEnhancedDrivePrivacy];

        if (v61)
        {
          v62 = [v85 asPrivateClientZone];
          v63 = [v62 childBaseSaltForItemID:v83];

          v64 = [v12 appLibrary];
          if ([v64 isCloudDocsAppLibrary])
          {
            v65 = [v12 clientZone];
            if ([v65 isCloudDocsZone])
            {
              [v12 parentItemIDInZone];
              v66 = v82 = v64;
              uint64_t v67 = [v66 isNonDesktopRoot];

              v64 = v82;
            }
            else
            {
              uint64_t v67 = 0;
            }
          }
          else
          {
            uint64_t v67 = 0;
          }

          v74 = [v12 parentItemIDInZone];
          uint64_t v61 = [v74 isDocumentsFolder];
        }
        else
        {
          v63 = 0;
          uint64_t v67 = 0;
        }
        [v42 serializeFilename:v79 forCreation:0 setExtension:0 basehashSalt:v63 parentIDIsCloudDocsRoot:v67 parentIDIsDocumentsFolder:v61];

        id v11 = v86;
      }
      [v11 addObject:v42];

      id v7 = v83;
    }
    v75 = *(void **)(*(void *)(a1 + 32) + 528);
    v76 = [v12 st];
    v77 = [v76 logicalName];
    objc_msgSend(v75, "brc_updateWithLogicalName:isFolder:", v77, objc_msgSend(v12, "isDirectory"));

    v78 = *(void **)(a1 + 32);
    v88[0] = MEMORY[0x263EF8330];
    v88[1] = 3221225472;
    v88[2] = __36__BRCSharingSaveShareOperation_main__block_invoke_136;
    v88[3] = &unk_265085520;
    v88[4] = v78;
    char v92 = v41;
    id v11 = v86;
    id v89 = v86;
    id v90 = v12;
    id v9 = v85;
    id v91 = v85;
    [v78 performAfterUnsharingParentShareTurdIfNecessary:v88];

LABEL_76:
    id v8 = v84;
    goto LABEL_77;
  }
  uint64_t v5 = brc_bread_crumbs();
  uint8_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, (os_log_type_t)0x90u)) {
    __36__BRCSharingSaveShareOperation_main__block_invoke_cold_3();
  }

  [*(id *)(a1 + 32) completedWithResult:0 error:v4];
LABEL_78:
}

void __36__BRCSharingSaveShareOperation_main__block_invoke_136(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v27 = v6;
      __int16 v28 = 2112;
      uint64_t v29 = v7;
      _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to unshare turd - %@%@", buf, 0x16u);
    }
  }
  id v9 = brc_bread_crumbs();
  int v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __36__BRCSharingSaveShareOperation_main__block_invoke_136_cold_1(a1, (uint64_t)v9, v10);
  }

  id v11 = (void *)[objc_alloc(MEMORY[0x263EFD748]) initWithRecordsToSave:*(void *)(a1 + 40) recordIDsToDelete:0];
  [v11 setSavePolicy:0];
  [v11 setAtomic:1];
  objc_initWeak((id *)buf, v11);
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  objc_super v18 = __36__BRCSharingSaveShareOperation_main__block_invoke_143;
  id v19 = &unk_2650854F8;
  objc_copyWeak(&v24, (id *)buf);
  id v12 = *(id *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 32);
  id v20 = v12;
  uint64_t v21 = v13;
  char v25 = *(unsigned char *)(a1 + 64);
  id v22 = *(id *)(a1 + 48);
  id v23 = *(id *)(a1 + 56);
  [v11 setModifyRecordsCompletionBlock:&v16];
  v14 = objc_msgSend(v11, "callbackQueue", v16, v17, v18, v19);
  v15 = [*(id *)(a1 + 32) callbackQueue];
  dispatch_set_target_queue(v14, v15);

  [*(id *)(a1 + 32) addSubOperation:v11];
  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)buf);
}

void __36__BRCSharingSaveShareOperation_main__block_invoke_143(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v9 = v7;
  uint64_t v10 = [v6 count];
  uint64_t v11 = [*(id *)(a1 + 32) count];
  id v12 = v9;
  if (!v9)
  {
    id v12 = 0;
    if (v10 != v11)
    {
      uint64_t v13 = brc_bread_crumbs();
      v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        __36__BRCSharingSaveShareOperation_main__block_invoke_143_cold_4();
      }

      id v12 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: got an unexpected number of shares saved");
    }
  }
  if (v12)
  {
    v15 = brc_bread_crumbs();
    uint64_t v16 = brc_default_log();
    if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      id v58 = WeakRetained;
      __int16 v59 = 2112;
      v60 = v12;
      __int16 v61 = 2112;
      v62 = v15;
      _os_log_error_impl(&dword_23FA42000, v16, (os_log_type_t)0x90u, "[ERROR] failed saving share %@: %@%@", buf, 0x20u);
    }

    uint64_t v17 = [*(id *)(*(void *)(a1 + 40) + 528) recordID];
    objc_super v18 = objc_msgSend(v12, "brc_cloudKitErrorForRecordID:", v17);

    if (*(unsigned char *)(a1 + 72) && objc_msgSend(v18, "brc_containsCloudKitInternalErrorCode:", 2024))
    {
      id v19 = [*(id *)(a1 + 32) objectAtIndexedSubscript:1];
      id v20 = [v19 recordID];
      objc_msgSend(v12, "brc_cloudKitErrorForRecordID:", v20);
      id v21 = (id)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v21, "brc_isStaleRecordUpdateError"))
      {
        id v22 = [*(id *)(a1 + 48) clientZone];
        [v22 scheduleSyncDown];
      }
    }
    else
    {
      id v21 = v18;
    }
    [*(id *)(a1 + 40) completedWithResult:0 error:v21];
    goto LABEL_31;
  }
  id v23 = brc_bread_crumbs();
  id v24 = brc_default_log();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
    __36__BRCSharingSaveShareOperation_main__block_invoke_143_cold_3();
  }

  char v25 = &OBJC_INSTANCE_METHODS__BRCTransferInfo;
  if (*(unsigned char *)(a1 + 72))
  {
    v26 = [v6 objectAtIndexedSubscript:1];
    id v27 = [v26 recordType];
    if (([v27 isEqualToString:@"content"] & 1) == 0)
    {
      __int16 v28 = [v6 objectAtIndexedSubscript:1];
      uint64_t v29 = [v28 recordType];
      char v30 = [v29 isEqualToString:@"structure"];

      if (v30)
      {
LABEL_23:
        v31 = [*(id *)(a1 + 56) db];
        v53[0] = MEMORY[0x263EF8330];
        char v25 = &OBJC_INSTANCE_METHODS__BRCTransferInfo;
        v53[1] = 3221225472;
        v53[2] = __36__BRCSharingSaveShareOperation_main__block_invoke_147;
        v53[3] = &unk_265084D78;
        id v54 = *(id *)(a1 + 56);
        id v55 = v6;
        [v31 groupInBatch:v53];

        goto LABEL_24;
      }
      v26 = brc_bread_crumbs();
      id v27 = brc_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
        __36__BRCSharingSaveShareOperation_main__block_invoke_143_cold_2();
      }
    }

    goto LABEL_23;
  }
LABEL_24:
  v32 = [v6 objectAtIndexedSubscript:0];
  v33 = [v32 recordType];
  char v34 = [v33 isEqualToString:*MEMORY[0x263EFD510]];

  if ((v34 & 1) == 0)
  {
    uint64_t v48 = brc_bread_crumbs();
    v49 = brc_default_log();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT)) {
      __36__BRCSharingSaveShareOperation_main__block_invoke_143_cold_1();
    }
  }
  uint64_t v35 = [v6 objectAtIndexedSubscript:0];
  uint64_t v36 = *(void *)(a1 + 40);
  v37 = *(void **)(v36 + 528);
  *(void *)(v36 + 528) = v35;

  [*(id *)(a1 + 56) scheduleSyncDownFirst];
  v38 = brc_bread_crumbs();
  int v39 = brc_default_log();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
  {
    v47 = *(void **)(*(void *)(a1 + 40) + 528);
    *(_DWORD *)buf = 138412546;
    id v58 = v47;
    __int16 v59 = 2112;
    v60 = v38;
    _os_log_debug_impl(&dword_23FA42000, v39, OS_LOG_TYPE_DEBUG, "[DEBUG] Saved share %@%@", buf, 0x16u);
  }

  v40 = *(void **)(a1 + 40);
  uint64_t v41 = v40[66];
  if (*(unsigned char *)(a1 + 72))
  {
    id v42 = [v6 lastObject];
    v56 = v42;
    v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v56 count:1];
    [v40 _updateDBAndSyncDownIfNeededWithShare:v41 recordsToLearnCKInfo:v43];
  }
  else
  {
    [*(id *)(a1 + 40) _updateDBAndSyncDownIfNeededWithShare:v40[66] recordsToLearnCKInfo:0];
  }
  v44 = [*(id *)(a1 + 48) fileObjectID];
  v45 = [v44 asString];
  v50[0] = MEMORY[0x263EF8330];
  v50[1] = v25[55];
  v50[2] = __36__BRCSharingSaveShareOperation_main__block_invoke_149;
  v50[3] = &unk_26507F7B0;
  uint64_t v46 = *(void *)(a1 + 40);
  id v51 = v44;
  uint64_t v52 = v46;
  id v21 = v44;
  +[BRCImportUtil forceIngestionForItemID:v45 completionHandler:v50];

LABEL_31:
}

void __36__BRCSharingSaveShareOperation_main__block_invoke_147(uint64_t a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 40) objectAtIndexedSubscript:1];
  v4[0] = v2;
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  [v1 learnCKInfosFromSavedRecords:v3 isOutOfBandModifyRecords:1];
}

void __36__BRCSharingSaveShareOperation_main__block_invoke_149(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_debug_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] Done forceIngestionForItemID %@ with error - %@%@", (uint8_t *)&v7, 0x20u);
  }

  [*(id *)(a1 + 40) completedWithResult:*(void *)(*(void *)(a1 + 40) + 528) error:0];
}

void __36__BRCSharingSaveShareOperation_main__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: couldn't get base record%@", v2, v3, v4, v5, v6);
}

void __36__BRCSharingSaveShareOperation_main__block_invoke_cold_2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 itemID];
  int v6 = 138412546;
  int v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_fault_impl(&dword_23FA42000, a3, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: directory %@ isn't pcs chained%@", (uint8_t *)&v6, 0x16u);
}

void __36__BRCSharingSaveShareOperation_main__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_23FA42000, v0, v1, "[ERROR] Failed with baseTokenError=%@%@");
}

void __36__BRCSharingSaveShareOperation_main__block_invoke_136_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = [*(id *)(*(void *)(a1 + 32) + 528) debugDescription];
  int v8 = *(unsigned __int8 *)(a1 + 64);
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v10 = NSString;
    uint64_t v3 = [*(id *)(a1 + 40) objectAtIndexedSubscript:1];
    uint64_t v9 = [v10 stringWithFormat:@" and %@", v3];
  }
  else
  {
    uint64_t v9 = &stru_26F3822F0;
  }
  uint64_t v11 = *(void *)(a1 + 32);
  *(_DWORD *)buf = 138413058;
  id v13 = v7;
  __int16 v14 = 2112;
  v15 = v9;
  __int16 v16 = 2112;
  uint64_t v17 = v11;
  __int16 v18 = 2112;
  uint64_t v19 = a2;
  _os_log_debug_impl(&dword_23FA42000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Saving %@%@ for share op %@%@", buf, 0x2Au);
  if (v8)
  {
  }
}

void __36__BRCSharingSaveShareOperation_main__block_invoke_143_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: [save[0].recordType isEqualToString:CKRecordTypeShare]%@", v2, v3, v4, v5, v6);
}

void __36__BRCSharingSaveShareOperation_main__block_invoke_143_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: [save[1].recordType isEqualToString:kBRRecordTypeContent] || [save[1].recordType isEqualToString:kBRRecordTypeStructure]%@", v2, v3, v4, v5, v6);
}

void __36__BRCSharingSaveShareOperation_main__block_invoke_143_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] finished saving share %@%@");
}

void __36__BRCSharingSaveShareOperation_main__block_invoke_143_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: got an unexpected number of shares saved%@", v2, v3, v4, v5, v6);
}

@end