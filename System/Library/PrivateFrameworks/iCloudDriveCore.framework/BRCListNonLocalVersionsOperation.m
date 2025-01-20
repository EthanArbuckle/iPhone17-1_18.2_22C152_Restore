@interface BRCListNonLocalVersionsOperation
- (BRCListNonLocalVersionsOperation)initWithDocumentItem:(id)a3 sessionContext:(id)a4;
- (BRCLocalItem)item;
- (BRCLocalVersion)currentVersion;
- (BRCNotification)notification;
- (BRCServerZone)serverZone;
- (CKRecordID)recordID;
- (CKRecordID)shareID;
- (id)createActivity;
- (void)main;
- (void)setCurrentVersion:(id)a3;
- (void)setItem:(id)a3;
- (void)setNotification:(id)a3;
- (void)setRecordID:(id)a3;
- (void)setServerZone:(id)a3;
- (void)setShareID:(id)a3;
@end

@implementation BRCListNonLocalVersionsOperation

- (BRCListNonLocalVersionsOperation)initWithDocumentItem:(id)a3 sessionContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 serverZone];
  v9 = [v8 metadataSyncContext];
  v20.receiver = self;
  v20.super_class = (Class)BRCListNonLocalVersionsOperation;
  v10 = [(_BRCOperation *)&v20 initWithName:@"versions/list-non-local-versions" syncContext:v9 sessionContext:v7];

  if (v10)
  {
    v11 = brc_bread_crumbs();
    v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[BRCListNonLocalVersionsOperation initWithDocumentItem:sessionContext:]((uint64_t)v6, (uint64_t)v11, v12);
    }

    [(BRCListNonLocalVersionsOperation *)v10 setItem:v6];
    v13 = [v6 documentRecordID];
    [(BRCListNonLocalVersionsOperation *)v10 setRecordID:v13];

    v14 = (void *)[objc_alloc(MEMORY[0x263EFD7E8]) initShareIDWithShareableItem:v6];
    [(BRCListNonLocalVersionsOperation *)v10 setShareID:v14];

    v15 = [v6 serverZone];
    [(BRCListNonLocalVersionsOperation *)v10 setServerZone:v15];

    v16 = [v6 currentVersion];
    [(BRCListNonLocalVersionsOperation *)v10 setCurrentVersion:v16];

    [(_BRCOperation *)v10 setNonDiscretionary:1];
    v17 = objc_msgSend(MEMORY[0x263EFD780], "br_sharingMisc");
    [(_BRCOperation *)v10 setGroup:v17];

    v18 = [[BRCNotification alloc] initWithLocalItem:v10->_item itemDiffs:0];
    [(BRCListNonLocalVersionsOperation *)v10 setNotification:v18];

    objc_storeStrong((id *)&v10->_sessionContext, a4);
  }

  return v10;
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_23FA42000, "versions/list-non-local-versions", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)main
{
  v25[1] = *MEMORY[0x263EF8340];
  v3 = [(BRCListNonLocalVersionsOperation *)self serverZone];
  v4 = [v3 clientZone];

  v5 = [(BRCListNonLocalVersionsOperation *)self recordID];
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v7 = objc_alloc(MEMORY[0x263EFD6A0]);
  v25[0] = v5;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
  v9 = (void *)[v7 initWithRecordIDs:v8];

  v10 = [MEMORY[0x263EFD7C8] desiredKeysWithMask:153];
  [v9 setDesiredKeys:v10];

  v11 = objc_msgSend(MEMORY[0x263EFD780], "br_fetchNonLocalVersions");
  [v9 setGroup:v11];

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __40__BRCListNonLocalVersionsOperation_main__block_invoke;
  v21[3] = &unk_2650857A8;
  v21[4] = self;
  id v12 = v5;
  id v22 = v12;
  id v23 = v4;
  id v13 = v6;
  id v24 = v13;
  id v14 = v4;
  [v9 setFetchRecordVersionsProgressBlock:v21];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __40__BRCListNonLocalVersionsOperation_main__block_invoke_10;
  v17[3] = &unk_265081AA8;
  id v18 = v12;
  v19 = self;
  id v20 = v13;
  id v15 = v13;
  id v16 = v12;
  [v9 setFetchRecordVersionsCompletionBlock:v17];
  [(_BRCOperation *)self addSubOperation:v9];
}

void __40__BRCListNonLocalVersionsOperation_main__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v43 = a2;
  id v44 = a4;
  id v8 = a5;
  if (([*(id *)(a1 + 32) finishIfCancelled] & 1) == 0)
  {
    if (v8)
    {
      [*(id *)(a1 + 32) completedWithResult:0 error:v8];
      goto LABEL_32;
    }
    memset(v55, 0, sizeof(v55));
    __brc_create_section(0, (uint64_t)"-[BRCListNonLocalVersionsOperation main]_block_invoke", 85, v55);
    v9 = brc_bread_crumbs();
    v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v39 = v55[0];
      uint64_t v40 = [v44 count];
      v41 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 134218754;
      uint64_t v58 = v39;
      __int16 v59 = 2048;
      uint64_t v60 = v40;
      __int16 v61 = 2112;
      v62 = v41;
      __int16 v63 = 2112;
      v64 = v9;
      _os_log_debug_impl(&dword_23FA42000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Got %lu versions for (recordID:%@)%@", buf, 0x2Au);
    }

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id obj = v44;
    uint64_t v11 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
    id v8 = 0;
    if (!v11)
    {
LABEL_31:

      __brc_leave_section(v55);
      goto LABEL_32;
    }
    uint64_t v46 = *(void *)v52;
    *(void *)&long long v12 = 138412546;
    long long v42 = v12;
LABEL_8:
    uint64_t v47 = v11;
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v52 != v46) {
        objc_enumerationMutation(obj);
      }
      id v14 = *(void **)(*((void *)&v51 + 1) + 8 * v13);
      id v15 = brc_bread_crumbs();
      id v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v37 = [v14 etag];
        v38 = [v14 debugDescription];
        *(_DWORD *)buf = 138412802;
        uint64_t v58 = (uint64_t)v37;
        __int16 v59 = 2112;
        uint64_t v60 = (uint64_t)v38;
        __int16 v61 = 2112;
        v62 = v15;
        _os_log_debug_impl(&dword_23FA42000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] Considering etag %@ %@%@", buf, 0x20u);
      }
      v17 = [*(id *)(a1 + 32) currentVersion];
      id v18 = [v17 ckInfo];
      v19 = [v18 etag];
      id v20 = [v14 etag];
      int v21 = [v19 isEqualToString:v20];

      if (v21)
      {
        brc_bread_crumbs();
        id v22 = (id)objc_claimAutoreleasedReturnValue();
        id v23 = brc_default_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v58 = (uint64_t)v22;
          _os_log_debug_impl(&dword_23FA42000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] Skipping current version%@", buf, 0xCu);
        }
        goto LABEL_29;
      }
      id v49 = v8;
      id v50 = 0;
      int v24 = [v14 deserializeVersion:&v50 fakeStatInfo:0 contentBoundaryKey:0 clientZone:*(void *)(a1 + 48) error:&v49];
      id v22 = v50;
      id v25 = v49;

      if (v24)
      {
        v26 = [v22 originalPOSIXName];
        BOOL v27 = v26 == 0;

        if (!v27)
        {
          if (objc_msgSend(v14, "brc_currentUserOwnsLastEditorDeviceWithSessionContext:", *(void *)(*(void *)(a1 + 32) + 504)))
          {
            id v23 = objc_msgSend(v14, "brc_lastEditorDeviceName");
            id v28 = 0;
          }
          else
          {
            v30 = [*(id *)(*(void *)(a1 + 32) + 504) cachedCurrentUserRecordName];
            id v48 = 0;
            id v31 = (id)objc_msgSend(v14, "brc_lastModifiedUserRecordNameWithCurrentUserRecordName:personNameComponents:", v30, &v48);
            id v28 = v48;

            id v23 = 0;
          }
          v32 = objc_msgSend(*(id *)(a1 + 32), "notification", v42, v43);
          v33 = (void *)[v32 copy];

          v34 = [v14 etag];
          v35 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", (double)objc_msgSend(v22, "mtime"));
          v36 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v22, "size"));
          [v33 markAsLoserVersionWithEtag:v34 modificationDate:v35 editorNameComponents:v28 lastEditorDeviceName:v23 size:v36];

          [*(id *)(a1 + 56) addObject:v33];
          goto LABEL_28;
        }
        id v23 = brc_bread_crumbs();
        v29 = brc_default_log();
        if (os_log_type_enabled(v29, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v58 = (uint64_t)v23;
          _os_log_error_impl(&dword_23FA42000, v29, (os_log_type_t)0x90u, "[ERROR] Version is lacking a name%@", buf, 0xCu);
        }
      }
      else
      {
        id v23 = brc_bread_crumbs();
        v29 = brc_default_log();
        if (os_log_type_enabled(v29, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = v42;
          uint64_t v58 = (uint64_t)v25;
          __int16 v59 = 2112;
          uint64_t v60 = (uint64_t)v23;
          _os_log_error_impl(&dword_23FA42000, v29, (os_log_type_t)0x90u, "[ERROR] Unable to deserialize record: %@%@", buf, 0x16u);
        }
      }

LABEL_28:
      id v8 = v25;
LABEL_29:

      if (v47 == ++v13)
      {
        uint64_t v11 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
        if (!v11) {
          goto LABEL_31;
        }
        goto LABEL_8;
      }
    }
  }
LABEL_32:
}

void __40__BRCListNonLocalVersionsOperation_main__block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = brc_bread_crumbs();
  v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __40__BRCListNonLocalVersionsOperation_main__block_invoke_10_cold_1(a1, (uint64_t)v4, v5);
  }

  if (([*(id *)(a1 + 40) finishIfCancelled] & 1) == 0) {
    [*(id *)(a1 + 40) completedWithResult:*(void *)(a1 + 48) error:v3];
  }
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
}

- (BRCLocalItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (CKRecordID)shareID
{
  return self->_shareID;
}

- (void)setShareID:(id)a3
{
}

- (BRCServerZone)serverZone
{
  return self->_serverZone;
}

- (void)setServerZone:(id)a3
{
}

- (BRCLocalVersion)currentVersion
{
  return self->_currentVersion;
}

- (void)setCurrentVersion:(id)a3
{
}

- (BRCNotification)notification
{
  return self->_notification;
}

- (void)setNotification:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notification, 0);
  objc_storeStrong((id *)&self->_currentVersion, 0);
  objc_storeStrong((id *)&self->_serverZone, 0);
  objc_storeStrong((id *)&self->_shareID, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_sessionContext, 0);
}

- (void)initWithDocumentItem:(NSObject *)a3 sessionContext:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_23FA42000, a2, a3, "[DEBUG] Listing Non Local Versions for item: %@%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

void __40__BRCListNonLocalVersionsOperation_main__block_invoke_10_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_23FA42000, a2, a3, "[DEBUG] completed fetching non-local versions of %@%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

@end