@interface BRCPackageItem
+ (BOOL)dumpSession:(id)a3 toContext:(id)a4 db:(id)a5 error:(id *)a6;
+ (BOOL)updateSignaturesForFilesInItem:(id)a3 fromCKPackage:(id)a4 error:(id *)a5;
+ (id)newItemForSignatureCalculationWithURL:(id)a3 inPackage:(id)a4 boundaryKey:(id)a5 error:(id *)a6;
+ (id)packageItemsForFileObjectID:(id)a3 order:(unint64_t)a4 db:(id)a5;
+ (id)packageItemsForItem:(id)a3 order:(unint64_t)a4;
+ (id)packageItemsForItemRowID:(unint64_t)a3 order:(unint64_t)a4 db:(id)a5;
+ (int64_t)largestPackageItemSizeInItemRowID:(unint64_t)a3 session:(id)a4;
- (BOOL)isDirectory;
- (BOOL)isFile;
- (BOOL)isSymLink;
- (BOOL)saveToDBWithSession:(id)a3;
- (BOOL)updateContentSignature:(id)a3 boundaryKey:(id)a4 error:(id *)a5;
- (BRCGenerationID)generationID;
- (BRCPackageItem)initWithPBItem:(id)a3 forLocalItem:(id)a4;
- (NSData)contentSignature;
- (NSData)quarantineInfo;
- (NSData)xattrSignature;
- (NSString)description;
- (NSString)pathInPackage;
- (NSString)symlinkContent;
- (char)mode;
- (id)_initWithURL:(id)a3 inPackage:(id)a4 forItem:(id)a5 error:(id *)a6;
- (id)initFromPQLResultSet:(id)a3 error:(id *)a4;
- (int)type;
- (int64_t)assetRank;
- (int64_t)mtime;
- (int64_t)size;
- (unint64_t)fileID;
- (unint64_t)itemRowID;
- (void)_setXattrs:(id)a3 stageRegistry:(id)a4;
- (void)contentSignature;
- (void)description;
- (void)symlinkContent;
@end

@implementation BRCPackageItem

+ (id)newItemForSignatureCalculationWithURL:(id)a3 inPackage:(id)a4 boundaryKey:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  id v12 = [[BRCPackageItem alloc] _initWithURL:v9 inPackage:v11 forItem:0 error:a6];

  if (v12 && [v12 updateContentSignature:v9 boundaryKey:v10 error:a6]) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  return v13;
}

- (BOOL)updateContentSignature:(id)a3 boundaryKey:(id)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v8 = (char *)a3;
  id v9 = a4;
  if (self->_type != 2)
  {
    id v17 = 0;
    goto LABEL_19;
  }
  uint64_t v10 = [MEMORY[0x263F32600] open:v8 flags:0x8000];
  if ((v10 & 0x80000000) != 0)
  {
    v14 = objc_msgSend(MEMORY[0x263F087E8], "br_errorFromErrno");
    id v12 = brc_bread_crumbs();
    v18 = brc_default_log();
    if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138413058;
      v27 = self;
      __int16 v28 = 2112;
      v29 = v8;
      __int16 v30 = 2112;
      id v31 = v14;
      __int16 v32 = 2112;
      v33 = v12;
      _os_log_error_impl(&dword_23FA42000, v18, (os_log_type_t)0x90u, "[ERROR] %@ - Failed opening contents at '%@'. Error: %@%@", buf, 0x2Au);
    }
  }
  else
  {
    uint64_t v11 = v10;
    id v25 = 0;
    id v12 = objc_msgSend(MEMORY[0x263EFD858], "br_signatureWithFileDescriptor:boundaryKey:error:", v10, v9, &v25);
    id v13 = v25;
    v14 = v13;
    if (v12)
    {
      v15 = v12;
      contentSignature = self->_contentSignature;
      self->_contentSignature = v15;
    }
    else
    {
      if (!v13)
      {
        v14 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithPOSIXCode:", 22);
      }
      contentSignature = brc_bread_crumbs();
      v19 = brc_default_log();
      if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138413058;
        v27 = self;
        __int16 v28 = 2112;
        v29 = v8;
        __int16 v30 = 2112;
        id v31 = v14;
        __int16 v32 = 2112;
        v33 = contentSignature;
        _os_log_error_impl(&dword_23FA42000, v19, (os_log_type_t)0x90u, "[ERROR] %@ - Failed calculating content signature at '%@'. Error: %@%@", buf, 0x2Au);
      }
    }
    [MEMORY[0x263F32600] closeFD:v11];
  }

  id v17 = v14;
  if (!v17)
  {
LABEL_19:
    BOOL v22 = 1;
    if (!a5) {
      goto LABEL_21;
    }
LABEL_20:
    *a5 = v17;
    goto LABEL_21;
  }
  v20 = brc_bread_crumbs();
  v21 = brc_default_log();
  if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
  {
    v24 = "(passed to caller)";
    *(_DWORD *)buf = 136315906;
    v27 = (BRCPackageItem *)"-[BRCPackageItem(FPFSAdditions) updateContentSignature:boundaryKey:error:]";
    __int16 v28 = 2080;
    if (!a5) {
      v24 = "(ignored by caller)";
    }
    v29 = v24;
    __int16 v30 = 2112;
    id v31 = v17;
    __int16 v32 = 2112;
    v33 = v20;
    _os_log_error_impl(&dword_23FA42000, v21, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
  }

  BOOL v22 = 0;
  if (a5) {
    goto LABEL_20;
  }
LABEL_21:

  return v22;
}

- (id)_initWithURL:(id)a3 inPackage:(id)a4 forItem:(id)a5 error:(id *)a6
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v51.receiver = self;
  v51.super_class = (Class)BRCPackageItem;
  id v13 = [(BRCPackageItem *)&v51 init];
  if (!v13) {
    goto LABEL_36;
  }
  if (v12)
  {
    if ([v12 needsInsert])
    {
      v14 = [v12 session];
      v15 = +[BRCPersistedState loadFromClientStateInSession:v14];
      v13->_itemRowID = [v15 nextItemRowID];
    }
    else
    {
      v13->_itemRowID = [v12 dbRowID];
    }
  }
  id v50 = 0;
  uint64_t v16 = *MEMORY[0x263EFF5E0];
  int v17 = [v11 getResourceValue:&v50 forKey:*MEMORY[0x263EFF5E0] error:a6];
  id v18 = v50;
  v19 = 0;
  if (!v17
    || (id v49 = 0,
        char v20 = [v10 getResourceValue:&v49 forKey:v16 error:a6],
        id v21 = v49,
        v19 = v21,
        (v20 & 1) == 0))
  {
    v26 = brc_bread_crumbs();
    v27 = brc_default_log();
    if (os_log_type_enabled(v27, (os_log_type_t)0x90u)) {
      -[BRCPackageItem(FPFSAdditions) _initWithURL:inPackage:forItem:error:]();
    }

    goto LABEL_13;
  }
  uint64_t v22 = objc_msgSend(v21, "br_pathRelativeToPath:", v18);
  pathInPackage = v13->_pathInPackage;
  v13->_pathInPackage = (NSString *)v22;

  v24 = [BRCImportObject alloc];
  if (v12) {
    id v25 = [(BRCImportObject *)v24 initWithURL:v10 packageRoot:v12 error:a6];
  }
  else {
    id v25 = [(BRCImportObject *)v24 initWithPackageURL:v10 error:a6];
  }
  v29 = v25;
  if (v25)
  {
    if ([(BRCImportObject *)v25 isExcluded])
    {
      objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemIneligibleFromSyncForInode:", 0);
      id v30 = (id)objc_claimAutoreleasedReturnValue();
      if (!v30)
      {
LABEL_20:
        if (a6)
        {
          id v30 = v30;
          *a6 = v30;
        }

        goto LABEL_23;
      }
      v47 = brc_bread_crumbs();
      id v31 = brc_default_log();
      if (!os_log_type_enabled(v31, (os_log_type_t)0x90u))
      {
LABEL_19:

        goto LABEL_20;
      }
      v46 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      *(void *)v53 = "-[BRCPackageItem(FPFSAdditions) _initWithURL:inPackage:forItem:error:]";
      *(_WORD *)&v53[8] = 2080;
      if (!a6) {
        v46 = "(ignored by caller)";
      }
LABEL_49:
      *(void *)&v53[10] = v46;
      __int16 v54 = 2112;
      id v55 = v30;
      __int16 v56 = 2112;
      v57 = v47;
      _os_log_error_impl(&dword_23FA42000, v31, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      goto LABEL_19;
    }
    v13->_fileID = [(BRCImportObject *)v29 fileID];
    uint64_t v32 = [(BRCImportObject *)v29 quarantineInfo];
    quarantineInfo = v13->_quarantineInfo;
    v13->_quarantineInfo = (NSData *)v32;

    uint64_t v34 = [(BRCImportObject *)v29 xattrs];

    if (v34)
    {
      [(BRCImportObject *)v29 xattrs];
      v35 = v48 = v29;
      v36 = [v12 session];
      v37 = [v36 stageRegistry];
      [(BRCPackageItem *)v13 _setXattrs:v35 stageRegistry:v37];

      v29 = v48;
    }
    v13->_mtime = [(BRCImportObject *)v29 modificationTime];
    if ([(BRCImportObject *)v29 isFile])
    {
      v13->_type = 2;
      v13->_size = [(BRCImportObject *)v29 size];
      if ([(BRCImportObject *)v29 isWritable]) {
        v13->_mode |= 1u;
      }
      if ([(BRCImportObject *)v29 isExecutable]) {
        v13->_mode |= 2u;
      }
      uint64_t v38 = [(BRCImportObject *)v29 generationID];
      v39 = &OBJC_IVAR___BRCPackageItem__generationID;
    }
    else
    {
      if ([(BRCImportObject *)v29 isUnixDir])
      {
        v13->_type = 1;
        goto LABEL_35;
      }
      if (![(BRCImportObject *)v29 isSymLink])
      {
        v43 = brc_bread_crumbs();
        v44 = brc_default_log();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v45 = [(BRCImportObject *)v29 fileType];
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v53 = v45;
          *(_WORD *)&v53[4] = 2112;
          *(void *)&v53[6] = v43;
          _os_log_impl(&dword_23FA42000, v44, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't determine item type %d%@", buf, 0x12u);
        }

        objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemIneligibleFromSyncForInode:", 0);
        id v30 = (id)objc_claimAutoreleasedReturnValue();
        if (!v30) {
          goto LABEL_20;
        }
        v47 = brc_bread_crumbs();
        id v31 = brc_default_log();
        if (!os_log_type_enabled(v31, (os_log_type_t)0x90u)) {
          goto LABEL_19;
        }
        v46 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(void *)v53 = "-[BRCPackageItem(FPFSAdditions) _initWithURL:inPackage:forItem:error:]";
        *(_WORD *)&v53[8] = 2080;
        if (!a6) {
          v46 = "(ignored by caller)";
        }
        goto LABEL_49;
      }
      v13->_type = 3;
      uint64_t v38 = [(BRCImportObject *)v29 symlinkContent];
      v39 = &OBJC_IVAR___BRCPackageItem__symlinkContent;
    }
    uint64_t v40 = *v39;
    v41 = *(Class *)((char *)&v13->super.isa + v40);
    *(Class *)((char *)&v13->super.isa + v40) = (Class)v38;

LABEL_35:
LABEL_36:
    __int16 v28 = v13;
    goto LABEL_37;
  }
LABEL_23:

LABEL_13:
  __int16 v28 = 0;
LABEL_37:

  return v28;
}

+ (int64_t)largestPackageItemSizeInItemRowID:(unint64_t)a3 session:(id)a4
{
  v5 = [a4 clientDB];
  v6 = objc_msgSend(v5, "fetchObjectOfClass:sql:", objc_opt_class(), @"SELECT largest_file_size FROM client_pkg_upload_sizes WHERE item_rowid = %llu", a3);

  int64_t v7 = [v6 unsignedLongLongValue];
  return v7;
}

+ (id)packageItemsForItemRowID:(unint64_t)a3 order:(unint64_t)a4 db:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a5;
  v8 = brc_bread_crumbs();
  id v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    unint64_t v15 = a3;
    __int16 v16 = 2048;
    unint64_t v17 = a4;
    __int16 v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_INFO, "[INFO] packageItemsFor itemRowID [%llu] order [%lu]%@", buf, 0x20u);
  }

  if (a4 == 1)
  {
    id v10 = @"SELECT item_rowid, rel_path, item_type, asset_rank, file_id, quarantine_info, xattr_signature, mtime, signature_or_link, generation, size, mode FROM client_pkg_upload_items WHERE item_rowid = %llu ORDER BY asset_rank";
    goto LABEL_7;
  }
  if (a4 == 2)
  {
    id v10 = @"SELECT item_rowid, rel_path, item_type, asset_rank, file_id, quarantine_info, xattr_signature, mtime, signature_or_link, generation, size, mode FROM client_pkg_upload_items WHERE item_rowid = %llu ORDER BY rel_path";
LABEL_7:
    id v11 = objc_msgSend(v7, "fetch:", v10, a3);
    goto LABEL_9;
  }
  id v11 = 0;
LABEL_9:
  id v12 = [v11 enumerateObjects:&__block_literal_global_35];

  return v12;
}

id __67__BRCPackageItem_FPFSAdditions__packageItemsForItemRowID_order_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  id v5 = [[BRCPackageItem alloc] initFromPQLResultSet:v4 error:a3];

  return v5;
}

+ (BOOL)updateSignaturesForFilesInItem:(id)a3 fromCKPackage:(id)a4 error:(id *)a5
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 session];
  id v9 = objc_alloc_init(MEMORY[0x263F089C8]);
  id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 1;
  id v11 = [v8 clientDB];
  id v12 = (void *)[v11 fetch:@"SELECT asset_rank, generation  FROM client_pkg_upload_items WHERE item_rowid = %llu AND item_type = %d", objc_msgSend(v6, "dbRowID"), 2];
  while (1)
  {

    if (![v12 next]) {
      break;
    }
    id v11 = [v12 numberAtIndex:0];
    id v13 = [v12 objectOfClass:objc_opt_class() atIndex:1];
    v14 = [v13 signature];
    if (v14) {
      [v10 setObject:v14 forKeyedSubscript:v11];
    }
    objc_msgSend(v9, "addIndex:", objc_msgSend(v11, "unsignedIntegerValue"));
  }
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v40[3] = 0;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__28;
  uint64_t v38 = __Block_byref_object_dispose__28;
  id v39 = 0;
  uint64_t v15 = [v7 itemCount];
  if (v15 == [v9 count])
  {
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __86__BRCPackageItem_DatabaseMethods__updateSignaturesForFilesInItem_fromCKPackage_error___block_invoke;
    v26[3] = &unk_265083840;
    id v27 = v7;
    id v31 = v40;
    id v28 = v10;
    id v29 = v6;
    uint64_t v32 = &v41;
    v33 = &v34;
    id v30 = v8;
    [v9 enumerateIndexesUsingBlock:v26];

    __int16 v16 = v27;
  }
  else
  {
    unint64_t v17 = brc_bread_crumbs();
    __int16 v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      uint64_t v23 = [v7 itemCount];
      uint64_t v24 = [v9 count];
      *(_DWORD *)buf = 134218498;
      uint64_t v46 = v23;
      __int16 v47 = 2048;
      uint64_t v48 = v24;
      __int16 v49 = 2112;
      id v50 = v17;
      _os_log_fault_impl(&dword_23FA42000, v18, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: wrong number of items in package. pkg [%lu] assetRanks [%lu]%@", buf, 0x20u);
    }

    *((unsigned char *)v42 + 24) = 0;
    uint64_t v19 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFD498] code:17 userInfo:0];
    __int16 v16 = (void *)v35[5];
    v35[5] = v19;
  }

  int v20 = *((unsigned __int8 *)v42 + 24);
  if (a5 && !*((unsigned char *)v42 + 24))
  {
    *a5 = (id) v35[5];
    int v20 = *((unsigned __int8 *)v42 + 24);
  }
  BOOL v21 = v20 != 0;
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(&v41, 8);

  return v21;
}

void __86__BRCPackageItem_DatabaseMethods__updateSignaturesForFilesInItem_fromCKPackage_error___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = (void *)MEMORY[0x2455D97F0]();
  id v7 = *(void **)(a1 + 32);
  ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  v8 = objc_msgSend(v7, "itemAtIndex:");
  id v9 = *(void **)(a1 + 40);
  id v10 = [NSNumber numberWithUnsignedInteger:a2];
  id v11 = [v9 objectForKeyedSubscript:v10];

  id v12 = brc_bread_crumbs();
  id v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    id v29 = [v8 signature];
    *(_DWORD *)buf = 134218754;
    uint64_t v34 = a2;
    __int16 v35 = 2112;
    uint64_t v36 = v29;
    __int16 v37 = 2112;
    uint64_t v38 = v8;
    __int16 v39 = 2112;
    uint64_t v40 = v12;
    _os_log_debug_impl(&dword_23FA42000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] Learning signature for rank %ld, signature:%@, asset %@%@", buf, 0x2Au);
  }
  v14 = [v8 signature];

  if (v14)
  {
    if (!v11) {
      goto LABEL_6;
    }
  }
  else
  {
    id v31 = brc_bread_crumbs();
    uint64_t v32 = brc_default_log();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
      __86__BRCPackageItem_DatabaseMethods__updateSignaturesForFilesInItem_fromCKPackage_error___block_invoke_cold_2();
    }

    if (!v11) {
      goto LABEL_6;
    }
  }
  uint64_t v15 = [v8 signature];
  char v16 = [v11 isEqualToData:v15];

  if ((v16 & 1) == 0)
  {
    id v25 = brc_bread_crumbs();
    v26 = brc_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      id v30 = [*(id *)(a1 + 48) itemID];
      *(_DWORD *)buf = 138412802;
      uint64_t v34 = v30;
      __int16 v35 = 2048;
      uint64_t v36 = a2;
      __int16 v37 = 2112;
      uint64_t v38 = v25;
      _os_log_debug_impl(&dword_23FA42000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] Failing updates of signatures for item %@ because pkg item with rank %lu changed%@", buf, 0x20u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    *a3 = 1;
    uint64_t v27 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFD498] code:17 userInfo:0];
    uint64_t v28 = *(void *)(*(void *)(a1 + 80) + 8);
    uint64_t v23 = *(void **)(v28 + 40);
    *(void *)(v28 + 40) = v27;
    goto LABEL_13;
  }
LABEL_6:
  unint64_t v17 = [*(id *)(a1 + 56) clientDB];
  __int16 v18 = [v8 signature];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v17 execute:@"UPDATE client_pkg_upload_items SET signature_or_link = %@ WHERE item_rowid = %llu AND asset_rank = %ld", v18, objc_msgSend(*(id *)(a1 + 48), "dbRowID"), a2];

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    *a3 = 1;
    uint64_t v19 = [*(id *)(a1 + 56) clientDB];
    uint64_t v20 = [v19 lastError];
    uint64_t v21 = *(void *)(*(void *)(a1 + 80) + 8);
    uint64_t v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;

    uint64_t v23 = brc_bread_crumbs();
    uint64_t v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      __86__BRCPackageItem_DatabaseMethods__updateSignaturesForFilesInItem_fromCKPackage_error___block_invoke_cold_1();
    }

LABEL_13:
  }
}

- (BOOL)saveToDBWithSession:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_assetRank)
  {
    id v5 = +[BRCPersistedState loadFromClientStateInSession:v4];
    self->_assetRank = [v5 allocatePackageItemRank];
  }
  switch(self->_type)
  {
    case 1:
      id v6 = v37;
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      id v7 = __55__BRCPackageItem_DatabaseMethods__saveToDBWithSession___block_invoke_2;
      goto LABEL_7;
    case 2:
      id v6 = v38;
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      id v7 = __55__BRCPackageItem_DatabaseMethods__saveToDBWithSession___block_invoke;
      goto LABEL_7;
    case 3:
      id v6 = v36;
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      id v7 = __55__BRCPackageItem_DatabaseMethods__saveToDBWithSession___block_invoke_3;
LABEL_7:
      v6[2] = v7;
      v6[3] = &unk_265083868;
      v6[4] = self;
      v8 = (uint64_t (**)(void, void, void))MEMORY[0x2455D9A50]();
      if (!v8) {
        goto LABEL_8;
      }
      goto LABEL_11;
    case 4:
      uint64_t v28 = brc_bread_crumbs();
      id v29 = brc_default_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v40 = self;
        __int16 v41 = 2112;
        v42 = v28;
        _os_log_impl(&dword_23FA42000, v29, OS_LOG_TYPE_DEFAULT, "[NOTICE] Ignoring tombstone pkg item %@%@", buf, 0x16u);
      }

      brc_bread_crumbs();
      v8 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[BRCPackageItem(DatabaseMethods) saveToDBWithSession:]();
      }
      BOOL v15 = 1;
      goto LABEL_23;
    default:
LABEL_8:
      id v9 = brc_bread_crumbs();
      id v10 = brc_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[BRCPackageItem(DatabaseMethods) saveToDBWithSession:]();
      }

      v8 = 0;
LABEL_11:
      id v11 = [v4 clientDB];
      uint64_t v12 = [v11 sqliteErrorHandler];

      id v13 = [v4 clientDB];
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __55__BRCPackageItem_DatabaseMethods__saveToDBWithSession___block_invoke_45;
      v34[3] = &unk_26507F3E0;
      v14 = (id)v12;
      __int16 v35 = v14;
      LOBYTE(v12) = ((uint64_t (**)(void, void *, void *))v8)[2](v8, v13, v34);

      if (v12) {
        goto LABEL_12;
      }
      char v16 = [v4 clientDB];
      unint64_t v17 = [v16 lastError];
      int v18 = [v17 isSqliteErrorCode:19];

      if (!v18) {
        goto LABEL_17;
      }
      uint64_t v19 = brc_bread_crumbs();
      uint64_t v20 = brc_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v40 = self;
        __int16 v41 = 2112;
        v42 = v19;
        _os_log_impl(&dword_23FA42000, v20, OS_LOG_TYPE_DEFAULT, "[NOTICE] Overriding an already declared item %@%@", buf, 0x16u);
      }

      uint64_t v21 = [v4 clientDB];
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __55__BRCPackageItem_DatabaseMethods__saveToDBWithSession___block_invoke_47;
      v32[3] = &unk_265083890;
      v32[4] = self;
      v33 = v8;
      char v22 = [v21 groupInTransaction:v32];

      if (v22)
      {
LABEL_12:
        BOOL v15 = 1;
      }
      else
      {
LABEL_17:
        uint64_t v23 = brc_bread_crumbs();
        uint64_t v24 = brc_default_log();
        if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
        {
          id v30 = [v4 clientDB];
          id v31 = [v30 lastError];
          *(_DWORD *)buf = 138412802;
          uint64_t v40 = self;
          __int16 v41 = 2112;
          v42 = v31;
          __int16 v43 = 2112;
          char v44 = v23;
          _os_log_error_impl(&dword_23FA42000, v24, (os_log_type_t)0x90u, "[ERROR] failed to save item %@ to DB: %@%@", buf, 0x20u);
        }
        id v25 = brc_bread_crumbs();
        v26 = brc_default_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
          -[BRCPackageItem(DatabaseMethods) saveToDBWithSession:]();
        }

        BOOL v15 = 0;
      }

LABEL_23:
      return v15;
  }
}

uint64_t __55__BRCPackageItem_DatabaseMethods__saveToDBWithSession___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  return [a2 executeWithErrorHandler:a3, @"INSERT INTO client_pkg_upload_items (item_rowid, rel_path, item_type, asset_rank, file_id, quarantine_info, xattr_signature, mtime, signature_or_link, generation, size, mode) VALUES (%llu, %@, %u, %llu, %llu, %@, %@, %llu, %@, %@, %llu, %u)", *(void *)(v3 + 8), *(void *)(v3 + 32), *(unsigned int *)(v3 + 56), *(void *)(v3 + 64), *(void *)(v3 + 16), *(void *)(v3 + 88), *(void *)(v3 + 96), *(void *)(v3 + 40), *(void *)(v3 + 80), *(void *)(v3 + 24), *(void *)(v3 + 48), *(char *)(v3 + 60) sql];
}

uint64_t __55__BRCPackageItem_DatabaseMethods__saveToDBWithSession___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  return [a2 executeWithErrorHandler:a3, @"INSERT INTO client_pkg_upload_items (item_rowid, rel_path, item_type, asset_rank, file_id, quarantine_info, xattr_signature, mtime) VALUES (%llu, %@, %u, %llu, %llu, %@, %@, %llu)", *(void *)(v3 + 8), *(void *)(v3 + 32), *(unsigned int *)(v3 + 56), *(void *)(v3 + 64), *(void *)(v3 + 16), *(void *)(v3 + 88), *(void *)(v3 + 96), *(void *)(v3 + 40) sql];
}

uint64_t __55__BRCPackageItem_DatabaseMethods__saveToDBWithSession___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  return [a2 executeWithErrorHandler:a3, @"INSERT INTO client_pkg_upload_items (item_rowid, rel_path, item_type, asset_rank, file_id, quarantine_info, xattr_signature, mtime, signature_or_link) VALUES (%llu, %@, %u, %llu, %llu, %@, %@, %llu, %@)", *(void *)(v3 + 8), *(void *)(v3 + 32), *(unsigned int *)(v3 + 56), *(void *)(v3 + 64), *(void *)(v3 + 16), *(void *)(v3 + 88), *(void *)(v3 + 96), *(void *)(v3 + 40), *(void *)(v3 + 72) sql];
}

void __55__BRCPackageItem_DatabaseMethods__saveToDBWithSession___block_invoke_45(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  if (([v8 isSqliteErrorCode:19] & 1) == 0)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      (*(void (**)(uint64_t, id, id, id))(v9 + 16))(v9, v10, v7, v8);
    }
  }
}

uint64_t __55__BRCPackageItem_DatabaseMethods__saveToDBWithSession___block_invoke_47(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 execute:@"DELETE FROM client_pkg_upload_items WHERE item_rowid = %llu AND rel_path = %@", *(void *)(*(void *)(a1 + 32) + 8), *(void *)(*(void *)(a1 + 32) + 32)])uint64_t v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))(); {
  else
  }
    uint64_t v4 = 0;

  return v4;
}

- (id)initFromPQLResultSet:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)BRCPackageItem;
  id v6 = [(BRCPackageItem *)&v21 init];
  if (v6)
  {
    v6->_itemRowID = [v5 longLongAtIndex:0];
    uint64_t v7 = [v5 stringAtIndex:1];
    pathInPackage = v6->_pathInPackage;
    v6->_pathInPackage = (NSString *)v7;

    v6->_int type = [v5 intAtIndex:2];
    v6->_assetRank = [v5 longLongAtIndex:3];
    v6->_fileID = [v5 longLongAtIndex:4];
    uint64_t v9 = [v5 dataAtIndex:5];
    quarantineInfo = v6->_quarantineInfo;
    v6->_quarantineInfo = (NSData *)v9;

    uint64_t v11 = [v5 dataAtIndex:6];
    xattrSignature = v6->_xattrSignature;
    v6->_xattrSignature = (NSData *)v11;

    v6->_mtime = [v5 longLongAtIndex:7];
    int type = v6->_type;
    if (type == 2)
    {
      uint64_t v16 = [v5 dataAtIndex:8];
      contentSignature = v6->_contentSignature;
      v6->_contentSignature = (NSData *)v16;

      uint64_t v18 = [v5 objectOfClass:objc_opt_class() atIndex:9];
      generationID = v6->_generationID;
      v6->_generationID = (BRCGenerationID *)v18;

      v6->_size = [v5 unsignedLongLongAtIndex:10];
      v6->_mode = [v5 intAtIndex:11];
    }
    else if (type == 3)
    {
      uint64_t v14 = [v5 stringAtIndex:8];
      symlinkContent = v6->_symlinkContent;
      v6->_symlinkContent = (NSString *)v14;
    }
  }

  return v6;
}

+ (BOOL)dumpSession:(id)a3 toContext:(id)a4 db:(id)a5 error:(id *)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = (void *)[v11 fetch:@"SELECT item_rowid, rel_path, item_type, asset_rank, file_id, quarantine_info, xattr_signature, mtime, signature_or_link, generation, size, mode  FROM client_pkg_upload_items  ORDER BY item_rowid, rel_path"];
  [v10 writeLineWithFormat:@"client_pkg_upload_items"];
  [v10 writeLineWithFormat:@"================"];
  if ([v12 next])
  {
    do
    {
      id v13 = (void *)MEMORY[0x2455D97F0]();
      id v14 = [[BRCPackageItem alloc] initFromPQLResultSet:v12 error:0];
      [v10 writeLineWithFormat:@"%@", v14];
    }
    while (([v12 next] & 1) != 0);
  }
  [v10 writeLineWithFormat:&stru_26F3822F0];
  BOOL v15 = [v12 error];

  if (v15)
  {
    uint64_t v16 = [v12 error];
    if (v16)
    {
      unint64_t v17 = brc_bread_crumbs();
      uint64_t v18 = brc_default_log();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
      {
        uint64_t v20 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        char v22 = "+[BRCPackageItem(DatabaseMethods) dumpSession:toContext:db:error:]";
        __int16 v23 = 2080;
        if (!a6) {
          uint64_t v20 = "(ignored by caller)";
        }
        uint64_t v24 = v20;
        __int16 v25 = 2112;
        v26 = v16;
        __int16 v27 = 2112;
        uint64_t v28 = v17;
        _os_log_error_impl(&dword_23FA42000, v18, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a6) {
      *a6 = v16;
    }
  }
  return v15 == 0;
}

- (BOOL)isFile
{
  return self->_type == 2;
}

- (BOOL)isSymLink
{
  return self->_type == 3;
}

- (BOOL)isDirectory
{
  return self->_type == 1;
}

- (NSString)symlinkContent
{
  if (![(BRCPackageItem *)self isSymLink])
  {
    id v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      [(BRCPackageItem *)(uint64_t)v5 symlinkContent];
    }
  }
  symlinkContent = self->_symlinkContent;
  return symlinkContent;
}

- (NSData)contentSignature
{
  if (![(BRCPackageItem *)self isFile])
  {
    id v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      [(BRCPackageItem *)(uint64_t)v5 contentSignature];
    }
  }
  contentSignature = self->_contentSignature;
  return contentSignature;
}

- (NSString)description
{
  id v3 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithCapacity:32];
  unint64_t itemRowID = self->_itemRowID;
  if (self->_isDirty) {
    id v5 = " (dirty)";
  }
  else {
    id v5 = "";
  }
  id v6 = [(NSString *)self->_pathInPackage fp_obfuscatedPath];
  [v3 appendFormat:@"pkg:%lld%s p:'%@' rank:%lld ino:%lld", itemRowID, v5, v6, self->_assetRank, self->_fileID];

  switch(self->_type)
  {
    case 1:
      [v3 appendString:@" dir"];
      break;
    case 2:
      generationID = self->_generationID;
      int64_t mtime = self->_mtime;
      int64_t size = self->_size;
      v26[0] = 114;
      int mode = self->_mode;
      if (mode) {
        char v11 = 119;
      }
      else {
        char v11 = 45;
      }
      v26[1] = v11;
      if ((mode & 2) != 0) {
        char v12 = 120;
      }
      else {
        char v12 = 45;
      }
      v26[2] = v12;
      v26[3] = (mode << 29 >> 31) & 0x4C;
      void v26[4] = 0;
      [v3 appendFormat:@" file gen:%@ size:%llu mtime:%llu mode:%s", generationID, size, mtime, v26];
      contentSignature = self->_contentSignature;
      if (contentSignature)
      {
        id v14 = [(NSData *)contentSignature brc_hexadecimalString];
        [v3 appendFormat:@" sig:%@", v14];
        goto LABEL_18;
      }
      break;
    case 3:
      id v14 = [(NSString *)self->_symlinkContent fp_obfuscatedPath];
      [v3 appendFormat:@" link to:'%@'", v14];
      goto LABEL_18;
    case 4:
      id v14 = brc_bread_crumbs();
      BOOL v15 = brc_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        [(BRCPackageItem *)(uint64_t)v14 description];
      }

LABEL_18:
      break;
    default:
      break;
  }
  quarantineInfo = self->_quarantineInfo;
  if (quarantineInfo) {
    objc_msgSend(v3, "appendFormat:", @" quarantine:%u ", -[NSData br_qtnFlags](quarantineInfo, "br_qtnFlags"));
  }
  xattrSignature = self->_xattrSignature;
  if (xattrSignature)
  {
    uint64_t v24 = [(NSData *)xattrSignature brc_hexadecimalString];
    [v3 appendFormat:@" xattrSig:%@", v24];
  }
  return (NSString *)v3;
}

- (void)_setXattrs:(id)a3 stageRegistry:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  objc_msgSend(v9, "brc_signature");
  uint64_t v7 = (NSData *)objc_claimAutoreleasedReturnValue();
  xattrSignature = self->_xattrSignature;
  self->_xattrSignature = v7;

  if (v9 && v6) {
    [v6 saveXattrBlob:v9 forSignature:self->_xattrSignature error:0];
  }
}

- (BRCPackageItem)initWithPBItem:(id)a3 forLocalItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v34.receiver = self;
  v34.super_class = (Class)BRCPackageItem;
  uint64_t v8 = [(BRCPackageItem *)&v34 init];
  if (v8)
  {
    v8->_unint64_t itemRowID = [v7 dbRowID];
    id v9 = [v6 item];
    uint64_t v10 = [v9 path];
    pathInPackage = v8->_pathInPackage;
    v8->_pathInPackage = (NSString *)v10;

    v8->_fileID = [v6 fileID];
    char v12 = [v6 item];
    uint64_t v13 = [v12 quarantineInfo];
    quarantineInfo = v8->_quarantineInfo;
    v8->_quarantineInfo = (NSData *)v13;

    BOOL v15 = [v6 item];
    v8->_int type = [v15 type];

    int type = v8->_type;
    if (type == 4)
    {
      id v30 = v8;
      uint64_t v8 = 0;
      goto LABEL_14;
    }
    if (type == 3)
    {
      uint64_t v17 = [v6 item];
      uint64_t v18 = [v17 symlinkContent];
      symlinkContent = v8->_symlinkContent;
      v8->_symlinkContent = (NSString *)v18;

      int type = v8->_type;
    }
    if (type == 2)
    {
      v8->_int mode = 0;
      uint64_t v20 = [v6 item];
      int v21 = [v20 isWritable];

      if (v21) {
        v8->_mode |= 1u;
      }
      char v22 = [v6 item];
      int v23 = [v22 isExecutable];

      if (v23) {
        v8->_mode |= 2u;
      }
      uint64_t v24 = -[BRCGenerationID initWithFSGenerationID:]([BRCGenerationID alloc], "initWithFSGenerationID:", [v6 generationID]);
      generationID = v8->_generationID;
      v8->_generationID = v24;

      v8->_int64_t size = [v6 size];
      v26 = [v6 item];
      v8->_int64_t mtime = [v26 mtime];

      __int16 v27 = [v6 item];
      uint64_t v28 = [v27 signature];
      contentSignature = v8->_contentSignature;
      v8->_contentSignature = (NSData *)v28;
    }
    if ([v6 hasXattrs])
    {
      id v30 = [v6 xattrs];
      id v31 = [v7 session];
      uint64_t v32 = [v31 stageRegistry];
      [(BRCPackageItem *)v8 _setXattrs:v30 stageRegistry:v32];

LABEL_14:
    }
  }

  return v8;
}

+ (id)packageItemsForItem:(id)a3 order:(unint64_t)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412802;
    id v14 = v6;
    __int16 v15 = 2048;
    uint64_t v16 = [v6 dbRowID];
    __int16 v17 = 2112;
    uint64_t v18 = v7;
    _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_INFO, "[INFO] calling packageItemsForItem %@ item_rowid %llu%@", (uint8_t *)&v13, 0x20u);
  }

  uint64_t v9 = [v6 dbRowID];
  uint64_t v10 = [v6 db];
  char v11 = [a1 packageItemsForItemRowID:v9 order:a4 db:v10];

  return v11;
}

+ (id)packageItemsForFileObjectID:(id)a3 order:(unint64_t)a4 db:(id)a5
{
  id v8 = a5;
  uint64_t v9 = objc_msgSend(a1, "packageItemsForItemRowID:order:db:", objc_msgSend(a3, "rawID"), a4, v8);

  return v9;
}

- (int)type
{
  return self->_type;
}

- (int64_t)assetRank
{
  return self->_assetRank;
}

- (unint64_t)itemRowID
{
  return self->_itemRowID;
}

- (unint64_t)fileID
{
  return self->_fileID;
}

- (BRCGenerationID)generationID
{
  return self->_generationID;
}

- (NSString)pathInPackage
{
  return self->_pathInPackage;
}

- (int64_t)mtime
{
  return self->_mtime;
}

- (char)mode
{
  return self->_mode;
}

- (int64_t)size
{
  return self->_size;
}

- (NSData)quarantineInfo
{
  return self->_quarantineInfo;
}

- (NSData)xattrSignature
{
  return self->_xattrSignature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xattrSignature, 0);
  objc_storeStrong((id *)&self->_quarantineInfo, 0);
  objc_storeStrong((id *)&self->_contentSignature, 0);
  objc_storeStrong((id *)&self->_symlinkContent, 0);
  objc_storeStrong((id *)&self->_pathInPackage, 0);
  objc_storeStrong((id *)&self->_generationID, 0);
}

void __86__BRCPackageItem_DatabaseMethods__updateSignaturesForFilesInItem_fromCKPackage_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: updating asset signature should work%@", v2, v3, v4, v5, v6);
}

void __86__BRCPackageItem_DatabaseMethods__updateSignaturesForFilesInItem_fromCKPackage_error___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: cpi.signature%@", v2, v3, v4, v5, v6);
}

- (void)symlinkContent
{
}

- (void)contentSignature
{
}

- (void)description
{
}

@end