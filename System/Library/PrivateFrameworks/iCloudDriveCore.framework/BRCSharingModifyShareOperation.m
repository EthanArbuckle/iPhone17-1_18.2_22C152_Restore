@interface BRCSharingModifyShareOperation
- (BOOL)_shouldFetchSharingIdentity:(BOOL)a3;
- (BRCSharingModifyShareOperation)initWithName:(id)a3 zone:(id)a4 share:(id)a5 sessionContext:(id)a6;
- (id)createActivity;
- (void)_performAfterCopyingPublicSharingKeyWithRecordID:(id)a3 completion:(id)a4;
- (void)_performAfterFetchingSharingIdentityOnDirectoryItem:(id)a3 wantRoutingKey:(BOOL)a4 completion:(id)a5;
- (void)_performAfterFetchingSharingIdentityOnDocumentItem:(id)a3 wantRoutingKey:(BOOL)a4 completion:(id)a5;
- (void)_performAfterFetchingiWorkRoutingTokenIfNecessary:(id)a3 completion:(id)a4;
- (void)_performAfterFetchingiWorkSharingIdentityOnItem:(id)a3 wantRoutingKey:(BOOL)a4 completion:(id)a5;
- (void)_performAfterGettingPublicSharingKeyForRecord:(id)a3 completion:(id)a4;
- (void)_performAfterPreparingSharingIdentityIfNecessaryWhenWantRoutingKey:(BOOL)a3 completion:(id)a4;
- (void)_updateDBAndSyncDownIfNeededWithShare:(id)a3 recordsToLearnCKInfo:(id)a4;
- (void)main;
- (void)performAfterPreparingSharingIdentityIfNecessary:(id)a3;
@end

@implementation BRCSharingModifyShareOperation

- (BRCSharingModifyShareOperation)initWithName:(id)a3 zone:(id)a4 share:(id)a5 sessionContext:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a3;
  v15 = [v11 metadataSyncContext];
  v27.receiver = self;
  v27.super_class = (Class)BRCSharingModifyShareOperation;
  v16 = [(_BRCOperation *)&v27 initWithName:v14 syncContext:v15 sessionContext:v13];

  if (v16)
  {
    v17 = objc_msgSend(MEMORY[0x263EFD780], "br_sharingMisc");
    [(_BRCOperation *)v16 setGroup:v17];

    [(_BRCOperation *)v16 setNonDiscretionary:1];
    objc_storeStrong((id *)&v16->_serverZone, a4);
    objc_storeStrong((id *)&v16->_share, a5);
    v18 = [v12 recordID];
    uint64_t v19 = objc_msgSend(v18, "brc_shareItemID");
    itemID = v16->_itemID;
    v16->_itemID = (BRCItemID *)v19;

    if (!v16->_itemID)
    {
      v25 = brc_bread_crumbs();
      v26 = brc_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
        -[BRCSharingModifyShareOperation initWithName:zone:share:sessionContext:]();
      }
    }
    v21 = [(_BRCOperation *)v16 callbackQueue];
    v22 = [v11 session];
    v23 = [v22 clientTruthWorkloop];
    dispatch_set_target_queue(v21, v23);
  }
  return v16;
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_23FA42000, "BRCSharingModifyShareOperation/? (subclass activity missing)", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)_updateDBAndSyncDownIfNeededWithShare:(id)a3 recordsToLearnCKInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(BRCServerZone *)self->_serverZone clientZone];
  v9 = [v8 db];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __93__BRCSharingModifyShareOperation__updateDBAndSyncDownIfNeededWithShare_recordsToLearnCKInfo___block_invoke;
  v17 = &unk_2650844B0;
  id v18 = v8;
  id v19 = v7;
  v20 = self;
  id v21 = v6;
  id v10 = v6;
  id v11 = v7;
  id v12 = v8;
  [v9 groupInBatch:&v14];

  id v13 = objc_msgSend(v12, "db", v14, v15, v16, v17);
  [v13 flushToMakeEditsVisibleToIPCReaders];
}

void __93__BRCSharingModifyShareOperation__updateDBAndSyncDownIfNeededWithShare_recordsToLearnCKInfo___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) learnCKInfosFromSavedRecords:*(void *)(a1 + 40) isOutOfBandModifyRecords:1];
  os_activity_t v2 = [*(id *)(a1 + 32) itemByItemID:*(void *)(*(void *)(a1 + 48) + 536)];
  v3 = [v2 asShareableItem];

  if (v3)
  {
    uint64_t v4 = [v3 sharingOptions];
    if ((v4 & 0x7C) != 0 && !*(void *)(a1 + 56)) {
      v4 &= 0xFFFFFFFFFFFFFF83;
    }
    uint64_t v5 = v4 | 4;
    if (!*(void *)(a1 + 56)) {
      uint64_t v5 = v4;
    }
    if ((v4 & 4) != 0) {
      unint64_t v6 = v4;
    }
    else {
      unint64_t v6 = v5;
    }
    if (((v6 >> 3) & 1) != [*(id *)(a1 + 56) publicPermission] < 2) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = v6 ^ 8;
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v8 = objc_msgSend(*(id *)(a1 + 56), "participants", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v33 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if ([v12 role] != 1 && objc_msgSend(v12, "permission") > 1)
          {
            LODWORD(v9) = 1;
            goto LABEL_27;
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v33 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_27:

    if (((v7 & 0x40) == 0) != v9) {
      unint64_t v17 = v7;
    }
    else {
      unint64_t v17 = v7 ^ 0x40;
    }
    if (([*(id *)(a1 + 56) publicPermission] != 2) == ((v17 >> 4) & 1)) {
      v17 ^= 0x10uLL;
    }
    if (v17 != [v3 sharingOptions])
    {
      if (*(void *)(a1 + 56)
        || ([v3 clientZone],
            id v18 = objc_claimAutoreleasedReturnValue(),
            int v19 = [v18 isPrivateZone],
            v18,
            v19))
      {
        [v3 setSharingOptions:v17];
      }
    }
    v20 = [MEMORY[0x263EFF910] date];
    [v3 updateWithLastUsedDate:v20];

    [v3 markNeedsUploadOrSyncingUp];
    [v3 saveToDB];
  }
  else
  {
    id v13 = brc_bread_crumbs();
    uint64_t v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 536);
      uint64_t v16 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      uint64_t v28 = v15;
      __int16 v29 = 2112;
      uint64_t v30 = v16;
      __int16 v31 = 2112;
      v32 = v13;
      _os_log_impl(&dword_23FA42000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't find item %@ in zone %@%@", buf, 0x20u);
    }
  }
  id v21 = [*(id *)(a1 + 32) serverItemByItemID:*(void *)(*(void *)(a1 + 48) + 536)];
  v22 = v21;
  if (!v21 || (*(void *)(a1 + 56) == 0) == (((unint64_t)[v21 sharingOptions] >> 2) & 1)) {
    [*(id *)(a1 + 32) scheduleSyncDownFirst];
  }
}

- (void)_performAfterCopyingPublicSharingKeyWithRecordID:(id)a3 completion:(id)a4
{
  v18[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x263EFD6D8]);
  v18[0] = v6;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  uint64_t v10 = (void *)[v8 initWithRecordIDs:v9];

  [v10 setShouldFetchAssetContent:0];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __94__BRCSharingModifyShareOperation__performAfterCopyingPublicSharingKeyWithRecordID_completion___block_invoke;
  v14[3] = &unk_265083E18;
  id v15 = v6;
  uint64_t v16 = self;
  id v17 = v7;
  id v11 = v7;
  id v12 = v6;
  [v10 setFetchRecordsCompletionBlock:v14];
  id v13 = [(_BRCOperation *)self callbackQueue];
  [v10 setCallbackQueue:v13];

  [(_BRCOperation *)self addSubOperation:v10];
}

void __94__BRCSharingModifyShareOperation__performAfterCopyingPublicSharingKeyWithRecordID_completion___block_invoke(void *a1, void *a2, void *a3)
{
  id v12 = a3;
  uint64_t v5 = [a2 objectForKeyedSubscript:a1[4]];
  uint64_t v6 = (uint64_t)v12;
  id v7 = v5;
  if (!v12)
  {
    id v8 = [v5 encryptedPublicSharingKey];

    if (v8
      || (objc_msgSend(MEMORY[0x263F087E8], "brc_errorPermissionError:", @"Couldn't get public sharing key"),
          (uint64_t v6 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_storeStrong((id *)(a1[5] + 544), v7);
      uint64_t v9 = [v7 encryptedPublicSharingKey];
      [*(id *)(a1[5] + 528) setPublicSharingIdentity:v9];

      uint64_t v10 = [v7 displayedHostname];
      [*(id *)(a1[5] + 528) setDisplayedHostname:v10];

      id v11 = [v7 routingKey];
      [*(id *)(a1[5] + 528) setRoutingKey:v11];

      uint64_t v6 = 0;
    }
  }
  id v13 = (id)v6;
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)_performAfterGettingPublicSharingKeyForRecord:(id)a3 completion:(id)a4
{
  v22[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[BRCSharingModifyShareOperation _performAfterGettingPublicSharingKeyForRecord:completion:]();
  }

  if (!v6)
  {
    id v17 = brc_bread_crumbs();
    id v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      -[BRCSharingModifyShareOperation _performAfterGettingPublicSharingKeyForRecord:completion:]();
    }
  }
  uint64_t v10 = [v6 recordID];
  [v6 setWantsPublicSharingKey:1];
  id v11 = objc_alloc(MEMORY[0x263EFD748]);
  v22[0] = v6;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
  id v13 = (void *)[v11 initWithRecordsToSave:v12 recordIDsToDelete:0];

  [v13 setAtomic:1];
  [v13 setSavePolicy:0];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __91__BRCSharingModifyShareOperation__performAfterGettingPublicSharingKeyForRecord_completion___block_invoke;
  v19[3] = &unk_265085458;
  id v20 = v10;
  id v21 = v7;
  v19[4] = self;
  id v14 = v10;
  id v15 = v7;
  [v13 setModifyRecordsCompletionBlock:v19];
  uint64_t v16 = [(_BRCOperation *)self callbackQueue];
  [v13 setCallbackQueue:v16];

  [(_BRCOperation *)self addSubOperation:v13];
}

void __91__BRCSharingModifyShareOperation__performAfterGettingPublicSharingKeyForRecord_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a2;
  uint64_t v7 = a4;
  if ([v6 count])
  {
    id v8 = [v6 objectAtIndexedSubscript:0];
  }
  else
  {
    id v8 = 0;
  }
  uint64_t v9 = [v6 count];
  if (!v7 && !v9)
  {
    uint64_t v10 = brc_bread_crumbs();
    id v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      __91__BRCSharingModifyShareOperation__performAfterGettingPublicSharingKeyForRecord_completion___block_invoke_cold_3();
    }

    uint64_t v7 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: no records and no error");
  }
  uint64_t v12 = [v8 encryptedPublicSharingKey];
  if (!(v12 | v7))
  {
    id v13 = brc_bread_crumbs();
    id v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      __91__BRCSharingModifyShareOperation__performAfterGettingPublicSharingKeyForRecord_completion___block_invoke_cold_2();
    }

    uint64_t v7 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: no error and no sharing key");
  }
  if (v7)
  {
    if ((objc_msgSend((id)v7, "brc_containsCloudKitErrorCode:", 12) & 1) != 0
      || objc_msgSend((id)v7, "brc_containsCloudKitErrorCode:", 10))
    {
      [*(id *)(a1 + 32) _performAfterCopyingPublicSharingKeyWithRecordID:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
    }
    else
    {
      v22 = brc_bread_crumbs();
      long long v23 = brc_default_log();
      if (os_log_type_enabled(v23, (os_log_type_t)0x90u)) {
        __91__BRCSharingModifyShareOperation__performAfterGettingPublicSharingKeyForRecord_completion___block_invoke_cold_1();
      }

      uint64_t v24 = *(void *)(a1 + 48);
      uint64_t v25 = *(void *)(a1 + 32);
      long long v26 = objc_msgSend((id)v7, "brc_cloudKitErrorForRecordID:", *(void *)(a1 + 40));
      (*(void (**)(uint64_t, uint64_t, void *))(v24 + 16))(v24, v25, v26);
    }
  }
  else
  {
    id v15 = [*(id *)(*(void *)(a1 + 32) + 520) clientZone];
    uint64_t v16 = [v15 db];
    uint64_t v28 = MEMORY[0x263EF8330];
    uint64_t v29 = 3221225472;
    uint64_t v30 = __91__BRCSharingModifyShareOperation__performAfterGettingPublicSharingKeyForRecord_completion___block_invoke_14;
    __int16 v31 = &unk_265084D78;
    uint64_t v32 = *(void *)(a1 + 32);
    id v33 = v6;
    [v16 groupInBatch:&v28];

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 544), v8);
    id v17 = objc_msgSend(v8, "encryptedPublicSharingKey", v28, v29, v30, v31, v32);
    [*(id *)(*(void *)(a1 + 32) + 528) setPublicSharingIdentity:v17];

    id v18 = [v8 displayedHostname];
    [*(id *)(*(void *)(a1 + 32) + 528) setDisplayedHostname:v18];

    int v19 = [v8 routingKey];
    [*(id *)(*(void *)(a1 + 32) + 528) setRoutingKey:v19];

    id v20 = brc_bread_crumbs();
    id v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v27 = *(void *)(*(void *)(a1 + 32) + 528);
      *(_DWORD *)buf = 138412546;
      uint64_t v35 = v27;
      __int16 v36 = 2112;
      v37 = v20;
      _os_log_debug_impl(&dword_23FA42000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] Got sharing identity for share - %@%@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __91__BRCSharingModifyShareOperation__performAfterGettingPublicSharingKeyForRecord_completion___block_invoke_14(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 520) clientZone];
  [v2 learnCKInfosFromSavedRecords:*(void *)(a1 + 40) isOutOfBandModifyRecords:1];
}

- (BOOL)_shouldFetchSharingIdentity:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(CKShare *)self->_share publicSharingIdentity];
  BOOL v6 = v5 != 0;
  if (v5) {
    BOOL v7 = !v3;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    id v8 = [(CKShare *)self->_share routingKey];
    BOOL v6 = v8 != 0;
  }
  return !v6;
}

- (void)_performAfterFetchingSharingIdentityOnDocumentItem:(id)a3 wantRoutingKey:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v12 = a3;
  id v8 = (void (**)(id, BRCSharingModifyShareOperation *, void))a5;
  if ([(BRCSharingModifyShareOperation *)self _shouldFetchSharingIdentity:v6])
  {
    if (([v12 sharingOptions] & 4) != 0)
    {
      uint64_t v9 = [v12 documentRecordID];
      [(BRCSharingModifyShareOperation *)self _performAfterCopyingPublicSharingKeyWithRecordID:v9 completion:v8];
    }
    else
    {
      uint64_t v9 = [v12 baseRecord];
      uint64_t v10 = [v12 currentVersion];
      id v11 = [v10 ckInfo];
      [v9 serializeSystemFields:v11];

      [(BRCSharingModifyShareOperation *)self _performAfterGettingPublicSharingKeyForRecord:v9 completion:v8];
    }
  }
  else
  {
    v8[2](v8, self, 0);
  }
}

- (void)_performAfterFetchingSharingIdentityOnDirectoryItem:(id)a3 wantRoutingKey:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v17 = a3;
  id v8 = (void (**)(id, BRCSharingModifyShareOperation *, void))a5;
  if ([(BRCSharingModifyShareOperation *)self _shouldFetchSharingIdentity:v6])
  {
    if (([v17 sharingOptions] & 4) != 0)
    {
      id v12 = [v17 itemID];
      id v13 = [v17 st];
      uint64_t v14 = [v13 type];
      id v15 = [v17 serverZone];
      uint64_t v16 = [v12 structureRecordIDForItemType:v14 zone:v15 aliasTargetZoneIsShared:1];

      [(BRCSharingModifyShareOperation *)self _performAfterCopyingPublicSharingKeyWithRecordID:v16 completion:v8];
    }
    else
    {
      uint64_t v9 = [v17 folderRootStructureRecord];
      uint64_t v10 = [v17 st];
      id v11 = [v10 ckInfo];
      [v9 serializeSystemFields:v11];

      [(BRCSharingModifyShareOperation *)self _performAfterGettingPublicSharingKeyForRecord:v9 completion:v8];
    }
  }
  else
  {
    v8[2](v8, self, 0);
  }
}

- (void)_performAfterFetchingiWorkRoutingTokenIfNecessary:(id)a3 completion:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, BRCSharingModifyShareOperation *, void))a4;
  id v8 = [(CKShare *)self->_share routingKey];

  if (v8) {
    goto LABEL_4;
  }
  uint64_t v9 = [v6 routingKey];

  if (v9)
  {
    uint64_t v10 = [v6 routingKey];
    [(CKShare *)self->_share setRoutingKey:v10];

LABEL_4:
    v7[2](v7, self, 0);
    goto LABEL_5;
  }
  uint64_t v11 = [(CKShare *)self->_share publicSharingIdentity];
  if (v11
    && (id v12 = (void *)v11,
        [(CKShare *)self->_share baseToken],
        id v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        v12,
        v13))
  {
    uint64_t v14 = brc_bread_crumbs();
    id v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[BRCSharingModifyShareOperation _performAfterFetchingiWorkRoutingTokenIfNecessary:completion:]();
    }

    uint64_t v16 = [(CKShare *)self->_share publicSharingIdentity];
    [v6 setMutableEncryptedPublicSharingKeyData:v16];

    id v17 = [(CKShare *)self->_share baseToken];
    [v6 setBaseToken:v17];

    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __95__BRCSharingModifyShareOperation__performAfterFetchingiWorkRoutingTokenIfNecessary_completion___block_invoke;
    v21[3] = &unk_265085480;
    v21[4] = self;
    v22 = v7;
    [(BRCSharingModifyShareOperation *)self _performAfterGettingPublicSharingKeyForRecord:v6 completion:v21];
  }
  else
  {
    id v18 = brc_bread_crumbs();
    int v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[BRCSharingModifyShareOperation _performAfterFetchingiWorkRoutingTokenIfNecessary:completion:]();
    }

    id v20 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: no public sharing identity. avoiding breaking iwork shares");
    ((void (**)(id, BRCSharingModifyShareOperation *, void *))v7)[2](v7, self, v20);
  }
LABEL_5:
}

void __95__BRCSharingModifyShareOperation__performAfterFetchingiWorkRoutingTokenIfNecessary_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a3;
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 544) routingKey];
  if (!(v4 | v5))
  {
    id v6 = brc_bread_crumbs();
    BOOL v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      __95__BRCSharingModifyShareOperation__performAfterFetchingiWorkRoutingTokenIfNecessary_completion___block_invoke_cold_2();
    }

    uint64_t v4 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: no routing key on share identity prepared record");
  }
  id v8 = [*(id *)(*(void *)(a1 + 32) + 528) publicSharingIdentity];
  uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 544) encryptedPublicSharingKey];
  char v10 = [v8 isEqualToData:v9];

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = brc_bread_crumbs();
    id v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      __95__BRCSharingModifyShareOperation__performAfterFetchingiWorkRoutingTokenIfNecessary_completion___block_invoke_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_performAfterFetchingiWorkSharingIdentityOnItem:(id)a3 wantRoutingKey:(BOOL)a4 completion:(id)a5
{
  v32[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = (void (**)(id, BRCSharingModifyShareOperation *, void))a5;
  uint64_t v10 = [(CKShare *)self->_share baseToken];
  if (!v10) {
    goto LABEL_7;
  }
  uint64_t v11 = (void *)v10;
  id v12 = [(CKShare *)self->_share publicSharingIdentity];
  if (v12)
  {
    id v13 = v12;
    if (a4)
    {
      uint64_t v14 = [(CKShare *)self->_share routingKey];

      if (!v14) {
        goto LABEL_7;
      }
    }
    else
    {
    }
    v9[2](v9, self, 0);
    goto LABEL_12;
  }

LABEL_7:
  id v15 = brc_bread_crumbs();
  uint64_t v16 = brc_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[BRCSharingModifyShareOperation _performAfterFetchingiWorkSharingIdentityOnItem:wantRoutingKey:completion:]();
  }

  id v17 = [v8 documentRecordID];
  id v18 = objc_alloc(MEMORY[0x263EFD6D8]);
  v32[0] = v17;
  int v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:1];
  id v20 = (void *)[v18 initWithRecordIDs:v19];

  uint64_t v21 = *MEMORY[0x263EFD5B0];
  v31[0] = *MEMORY[0x263EFD598];
  v31[1] = v21;
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:2];
  [v20 setDesiredKeys:v22];

  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __108__BRCSharingModifyShareOperation__performAfterFetchingiWorkSharingIdentityOnItem_wantRoutingKey_completion___block_invoke;
  v25[3] = &unk_2650854A8;
  id v26 = v17;
  id v27 = v8;
  uint64_t v28 = self;
  BOOL v30 = a4;
  uint64_t v29 = v9;
  id v23 = v17;
  [v20 setFetchRecordsCompletionBlock:v25];
  uint64_t v24 = [(_BRCOperation *)self callbackQueue];
  [v20 setCallbackQueue:v24];

  [(_BRCOperation *)self addSubOperation:v20];
LABEL_12:
}

void __108__BRCSharingModifyShareOperation__performAfterFetchingiWorkSharingIdentityOnItem_wantRoutingKey_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  BOOL v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263EFD598]];
  id v8 = [v6 mutableEncryptedPublicSharingKeyData];
  if (v8
    || ([v6 encryptedValues],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        [v9 objectForKeyedSubscript:*MEMORY[0x263EFD5B0]],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v10 = brc_bread_crumbs();
      uint64_t v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        __108__BRCSharingModifyShareOperation__performAfterFetchingiWorkSharingIdentityOnItem_wantRoutingKey_completion___block_invoke_cold_3();
      }

      uint64_t v12 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: sharing identity isn't encrypted data");

      id v8 = 0;
      id v5 = (id)v12;
    }
  }
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v13 = brc_bread_crumbs();
      uint64_t v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        __108__BRCSharingModifyShareOperation__performAfterFetchingiWorkSharingIdentityOnItem_wantRoutingKey_completion___block_invoke_cold_2();
      }

      uint64_t v15 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: base token isn't a string");

      BOOL v7 = 0;
      id v5 = (id)v15;
    }
  }
  if (v8) {
    BOOL v16 = v7 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  if (v16 && !v5)
  {
    id v17 = brc_bread_crumbs();
    id v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      v39 = v7;
      __int16 v40 = 2112;
      v41 = v8;
      __int16 v42 = 2112;
      v43 = v17;
      _os_log_fault_impl(&dword_23FA42000, v18, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: no base token %@ or sharing identity %@ and no error%@", buf, 0x20u);
    }

    objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: no base token %@ or sharing identity %@ and no error", v7, v8);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    int v19 = [*(id *)(a1 + 40) clientZone];
    id v20 = objc_msgSend(v19, "itemByRowID:", objc_msgSend(*(id *)(a1 + 40), "dbRowID"));
    uint64_t v21 = [v20 asDocument];

    [v21 forceiWorkSharingInfoResend];
    [v21 saveToDB];
  }
  if (v5)
  {
    v22 = brc_bread_crumbs();
    id v23 = brc_default_log();
    if (os_log_type_enabled(v23, (os_log_type_t)0x90u)) {
      __108__BRCSharingModifyShareOperation__performAfterFetchingiWorkSharingIdentityOnItem_wantRoutingKey_completion___block_invoke_cold_1();
    }
  }
  else
  {
    id v26 = [v6 encryptedValues];
    uint64_t v27 = *MEMORY[0x263EFD5B0];
    v22 = [v26 objectForKeyedSubscript:*MEMORY[0x263EFD5B0]];

    if (!v22 || ([v8 isEqualToData:v22] & 1) == 0)
    {
      uint64_t v28 = brc_bread_crumbs();
      uint64_t v29 = brc_default_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        v39 = v8;
        __int16 v40 = 2112;
        v41 = v22;
        __int16 v42 = 2112;
        v43 = v28;
        _os_log_fault_impl(&dword_23FA42000, v29, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Sharing identities don't match (%@ vs %@)! Trying to fix up the identities%@", buf, 0x20u);
      }

      if (v8)
      {
        BOOL v30 = [v6 encryptedValues];
        [v30 setObject:v8 forKeyedSubscript:v27];
      }
    }
    [*(id *)(*(void *)(a1 + 48) + 528) setBaseToken:v7];
    [*(id *)(*(void *)(a1 + 48) + 528) setPublicSharingIdentity:v8];
    __int16 v31 = [v6 displayedHostname];
    [*(id *)(*(void *)(a1 + 48) + 528) setDisplayedHostname:v31];

    objc_storeStrong((id *)(*(void *)(a1 + 48) + 544), v6);
    [*(id *)(*(void *)(a1 + 48) + 544) setBaseToken:v7];
    uint64_t v32 = [*(id *)(*(void *)(a1 + 48) + 544) mutableEncryptedPublicSharingKeyData];
    id v33 = (void *)v32;
    if (v32) {
      uint64_t v34 = (void *)v32;
    }
    else {
      uint64_t v34 = v8;
    }
    [*(id *)(*(void *)(a1 + 48) + 544) setMutableEncryptedPublicSharingKeyData:v34];

    uint64_t v35 = brc_bread_crumbs();
    __int16 v36 = brc_default_log();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      v37 = *(void **)(*(void *)(a1 + 48) + 528);
      *(_DWORD *)buf = 138412546;
      v39 = v37;
      __int16 v40 = 2112;
      v41 = v35;
      _os_log_debug_impl(&dword_23FA42000, v36, OS_LOG_TYPE_DEBUG, "[DEBUG] Got iWork sharing identify for share - %@%@", buf, 0x16u);
    }

    if (*(unsigned char *)(a1 + 64))
    {
      [*(id *)(a1 + 48) _performAfterFetchingiWorkRoutingTokenIfNecessary:v6 completion:*(void *)(a1 + 56)];
      goto LABEL_39;
    }
  }

  uint64_t v25 = *(void *)(a1 + 48);
  uint64_t v24 = *(void *)(a1 + 56);
  v22 = objc_msgSend(v5, "brc_cloudKitErrorForRecordID:", *(void *)(a1 + 32));
  (*(void (**)(uint64_t, uint64_t, void *))(v24 + 16))(v24, v25, v22);
LABEL_39:
}

- (void)_performAfterPreparingSharingIdentityIfNecessaryWhenWantRoutingKey:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(_BRCOperation *)self callbackQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __112__BRCSharingModifyShareOperation__performAfterPreparingSharingIdentityIfNecessaryWhenWantRoutingKey_completion___block_invoke;
  block[3] = &unk_2650854D0;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __112__BRCSharingModifyShareOperation__performAfterPreparingSharingIdentityIfNecessaryWhenWantRoutingKey_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 520) clientZone];
  BOOL v3 = [v2 itemByItemID:*(void *)(*(void *)(a1 + 32) + 536)];

  uint64_t v4 = [v3 st];
  int v5 = [v4 iWorkShareable];

  if (v5)
  {
    id v6 = *(void **)(a1 + 32);
    BOOL v7 = [v3 asDocument];
    [v6 _performAfterFetchingiWorkSharingIdentityOnItem:v7 wantRoutingKey:*(unsigned __int8 *)(a1 + 48) completion:*(void *)(a1 + 40)];
LABEL_7:

    goto LABEL_8;
  }
  if ([v3 isDocument])
  {
    id v8 = *(void **)(a1 + 32);
    BOOL v7 = [v3 asDocument];
    [v8 _performAfterFetchingSharingIdentityOnDocumentItem:v7 wantRoutingKey:*(unsigned __int8 *)(a1 + 48) completion:*(void *)(a1 + 40)];
    goto LABEL_7;
  }
  if ([v3 isDirectory])
  {
    uint64_t v9 = *(void **)(a1 + 32);
    BOOL v7 = [v3 asDirectory];
    [v9 _performAfterFetchingSharingIdentityOnDirectoryItem:v7 wantRoutingKey:*(unsigned __int8 *)(a1 + 48) completion:*(void *)(a1 + 40)];
    goto LABEL_7;
  }
  uint64_t v10 = *(void *)(a1 + 40);
  BOOL v11 = brc_bread_crumbs();
  uint64_t v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
    __112__BRCSharingModifyShareOperation__performAfterPreparingSharingIdentityIfNecessaryWhenWantRoutingKey_completion___block_invoke_cold_1();
  }

  id v13 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: not a directory nor a document");
  (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v13);

LABEL_8:
}

- (void)performAfterPreparingSharingIdentityIfNecessary:(id)a3
{
}

- (void)main
{
  v2.receiver = self;
  v2.super_class = (Class)BRCSharingModifyShareOperation;
  [(_BRCOperation *)&v2 main];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingIdentityPreparedRecord, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_share, 0);
  objc_storeStrong((id *)&self->_serverZone, 0);
}

- (void)initWithName:zone:share:sessionContext:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _itemID%@", v2, v3, v4, v5, v6);
}

- (void)_performAfterGettingPublicSharingKeyForRecord:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: contentsRecord%@", v2, v3, v4, v5, v6);
}

- (void)_performAfterGettingPublicSharingKeyForRecord:completion:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] requesting sharing identity on %@%@");
}

void __91__BRCSharingModifyShareOperation__performAfterGettingPublicSharingKeyForRecord_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_23FA42000, v0, v1, "[ERROR] Fetching sharing identity failed - %@%@");
}

void __91__BRCSharingModifyShareOperation__performAfterGettingPublicSharingKeyForRecord_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: no error and no sharing key%@", v2, v3, v4, v5, v6);
}

void __91__BRCSharingModifyShareOperation__performAfterGettingPublicSharingKeyForRecord_completion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: no records and no error%@", v2, v3, v4, v5, v6);
}

- (void)_performAfterFetchingiWorkRoutingTokenIfNecessary:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: no public sharing identity. avoiding breaking iwork shares%@", v2, v3, v4, v5, v6);
}

- (void)_performAfterFetchingiWorkRoutingTokenIfNecessary:completion:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Yanking the routing key from the server for %@%@");
}

void __95__BRCSharingModifyShareOperation__performAfterFetchingiWorkRoutingTokenIfNecessary_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: [self->_share.publicSharingIdentity isEqualToData:self->_sharingIdentityPreparedRecord.encryptedPublicSharingKey]%@", v2, v3, v4, v5, v6);
}

void __95__BRCSharingModifyShareOperation__performAfterFetchingiWorkRoutingTokenIfNecessary_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: no routing key on share identity prepared record%@", v2, v3, v4, v5, v6);
}

- (void)_performAfterFetchingiWorkSharingIdentityOnItem:wantRoutingKey:completion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Requesting iwork sharing identity on %@%@");
}

void __108__BRCSharingModifyShareOperation__performAfterFetchingiWorkSharingIdentityOnItem_wantRoutingKey_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_23FA42000, v0, v1, "[ERROR] Fetching iWork sharing identity failed - %@%@");
}

void __108__BRCSharingModifyShareOperation__performAfterFetchingiWorkSharingIdentityOnItem_wantRoutingKey_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: base token isn't a string%@", v2, v3, v4, v5, v6);
}

void __108__BRCSharingModifyShareOperation__performAfterFetchingiWorkSharingIdentityOnItem_wantRoutingKey_completion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: sharing identity isn't encrypted data%@", v2, v3, v4, v5, v6);
}

void __112__BRCSharingModifyShareOperation__performAfterPreparingSharingIdentityIfNecessaryWhenWantRoutingKey_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: not a directory nor a document%@", v2, v3, v4, v5, v6);
}

@end