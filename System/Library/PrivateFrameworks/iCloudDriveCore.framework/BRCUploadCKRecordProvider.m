@interface BRCUploadCKRecordProvider
- (BRCUploadCKRecordProvider)initWithStageRegistry:(id)a3 deviceID:(id)a4;
- (id)_createFileRecordForURL:(id)a3 item:(id)a4 fileSize:(int64_t *)a5 boundaryKey:(id *)a6 error:(id *)a7;
- (id)_createPackageRecordForURL:(id)a3 item:(id)a4 stageID:(id)a5 fileSize:(int64_t *)a6 boundaryKey:(id *)a7 error:(id *)a8;
- (id)createCKRecordFor:(id)a3 document:(id)a4 stageID:(id)a5 mtime:(unint64_t)a6 etag:(id)a7 xattrSignature:(id)a8 transferSize:(int64_t *)a9 boundaryKey:(id *)a10 error:(id *)a11;
@end

@implementation BRCUploadCKRecordProvider

- (BRCUploadCKRecordProvider)initWithStageRegistry:(id)a3 deviceID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BRCUploadCKRecordProvider;
  v9 = [(BRCUploadCKRecordProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_stageRegistry, a3);
    objc_storeStrong((id *)&v10->_deviceID, a4);
  }

  return v10;
}

- (id)createCKRecordFor:(id)a3 document:(id)a4 stageID:(id)a5 mtime:(unint64_t)a6 etag:(id)a7 xattrSignature:(id)a8 transferSize:(int64_t *)a9 boundaryKey:(id *)a10 error:(id *)a11
{
  v39 = a9;
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a4;
  id v41 = a5;
  id v18 = a7;
  id v19 = a8;
  char v44 = 0;
  v20 = [MEMORY[0x263F08850] defaultManager];
  v21 = [v16 path];
  LODWORD(a5) = [v20 fileExistsAtPath:v21 isDirectory:&v44];

  if (a5)
  {
    *(void *)buf = 0;
    if (v44)
    {
      uint64_t v43 = 0;
      v22 = (id *)&v43;
      uint64_t v23 = [(BRCUploadCKRecordProvider *)self _createPackageRecordForURL:v16 item:v17 stageID:v41 fileSize:buf boundaryKey:&v43 error:a11];
    }
    else
    {
      uint64_t v42 = 0;
      v22 = (id *)&v42;
      uint64_t v23 = [(BRCUploadCKRecordProvider *)self _createFileRecordForURL:v16 item:v17 fileSize:buf boundaryKey:&v42 error:a11];
    }
    id v27 = (id)v23;
    id v28 = *v22;
    id v24 = v28;
    if (v27)
    {
      if (a10) {
        *a10 = v28;
      }
      uint64_t v29 = [v17 shouldUseEnhancedDrivePrivacyWhenNeedsPreserving:v24 != 0];
      if (![v27 serializeForContentUpload:v17 size:*(void *)buf mtime:a6 etag:v18 shouldUseEnhancedDrivePrivacy:v29 error:a11])
      {

        v35 = 0;
        goto LABEL_30;
      }
      if (v19)
      {
        v30 = [(BRCStageRegistry *)self->_stageRegistry urlForXattrSignature:v19];
        if (v30)
        {
          v31 = objc_msgSend(MEMORY[0x263EFD5E0], "br_assetWithFileURL:boundaryKey:", v30, v24);
          [v27 setObject:v31 forKeyedSubscript:@"xattr"];
          if (v24) {
            id v32 = v19;
          }
          else {
            id v32 = 0;
          }
          v33 = objc_msgSend(v27, "encryptedValues", a9);
          [v33 setObject:v32 forKeyedSubscript:@"xattrSignature"];

          uint64_t v34 = [v31 size];
        }
        else
        {
          v31 = brc_bread_crumbs();
          v36 = brc_default_log();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
            -[BRCUploadCKRecordProvider createCKRecordFor:document:stageID:mtime:etag:xattrSignature:transferSize:boundaryKey:error:]();
          }

          uint64_t v34 = 0;
        }
      }
      else
      {
        uint64_t v34 = 0;
      }
      if (v39) {
        int64_t *v39 = *(void *)buf + v34;
      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "br_errorWithPOSIXCode:", 2);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v25 = brc_bread_crumbs();
      v26 = brc_default_log();
      if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
      {
        v38 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(void *)&buf[4] = "-[BRCUploadCKRecordProvider createCKRecordFor:document:stageID:mtime:etag:xattrSignature:tr"
                             "ansferSize:boundaryKey:error:]";
        __int16 v46 = 2080;
        if (!a11) {
          v38 = "(ignored by caller)";
        }
        v47 = v38;
        __int16 v48 = 2112;
        id v49 = v24;
        __int16 v50 = 2112;
        v51 = v25;
        _os_log_error_impl(&dword_23FA42000, v26, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a11)
    {
      id v24 = v24;
      id v27 = 0;
      *a11 = v24;
    }
    else
    {
      id v27 = 0;
    }
  }

  id v27 = v27;
  v35 = v27;
LABEL_30:

  return v35;
}

- (id)_createFileRecordForURL:(id)a3 item:(id)a4 fileSize:(int64_t *)a5 boundaryKey:(id *)a6 error:(id *)a7
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  v13 = brc_bread_crumbs();
  v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[BRCUploadCKRecordProvider _createFileRecordForURL:item:fileSize:boundaryKey:error:](v11);
  }

  v15 = [v12 baseRecordClearAllFields:1];
  id v38 = 0;
  uint64_t v16 = *MEMORY[0x263EFF688];
  id v37 = 0;
  char v17 = [v11 getResourceValue:&v38 forKey:v16 error:&v37];
  id v18 = v38;
  id v19 = v37;
  v20 = v19;
  if (v17)
  {
    id v21 = [v15 getAndUpdateBoundaryKeyForItem:v12];
    int v22 = [v12 shouldUseEnhancedDrivePrivacyWhenNeedsPreserving:v21 != 0];
    if (a6) {
      *a6 = v21;
    }
    v36 = v20;
    uint64_t v23 = v18;
    id v24 = a5;
    if ([v12 isFinderBookmark])
    {
      if (v22)
      {
        uint64_t v25 = objc_msgSend(MEMORY[0x263EFF8F8], "brc_generateSaltingKey");
      }
      else
      {
        uint64_t v25 = 0;
      }

      uint64_t v29 = kBRRecordKeyFinderBookmarkContent;
      id v21 = (id)v25;
    }
    else
    {
      uint64_t v29 = kBRRecordKeyFileContent;
    }
    v30 = objc_msgSend(MEMORY[0x263EFD5E0], "br_assetWithFileURL:boundaryKey:", v11, v21);
    [v15 setObject:v30 forKeyedSubscript:*v29];
    v31 = [v12 st];
    id v32 = [v31 logicalName];
    v33 = objc_msgSend(v32, "br_pathExtension");
    [v30 setItemTypeHint:v33];

    if (v24) {
      *id v24 = [v23 longLongValue];
    }
    id v28 = v15;

    id v18 = v23;
    v20 = v36;
  }
  else
  {
    id v21 = v19;
    if (v21)
    {
      v26 = brc_bread_crumbs();
      id v27 = brc_default_log();
      if (os_log_type_enabled(v27, (os_log_type_t)0x90u))
      {
        v35 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v40 = "-[BRCUploadCKRecordProvider _createFileRecordForURL:item:fileSize:boundaryKey:error:]";
        __int16 v41 = 2080;
        if (!a7) {
          v35 = "(ignored by caller)";
        }
        uint64_t v42 = v35;
        __int16 v43 = 2112;
        id v44 = v21;
        __int16 v45 = 2112;
        __int16 v46 = v26;
        _os_log_error_impl(&dword_23FA42000, v27, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a7)
    {
      id v21 = v21;
      id v28 = 0;
      *a7 = v21;
    }
    else
    {
      id v28 = 0;
    }
  }

  return v28;
}

- (id)_createPackageRecordForURL:(id)a3 item:(id)a4 stageID:(id)a5 fileSize:(int64_t *)a6 boundaryKey:(id *)a7 error:(id *)a8
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v66 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = brc_bread_crumbs();
  uint64_t v16 = brc_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[BRCUploadCKRecordProvider _createPackageRecordForURL:item:stageID:fileSize:boundaryKey:error:](v66);
  }

  char v17 = [v13 baseRecordClearAllFields:1];
  id v18 = [(BRCStageRegistry *)self->_stageRegistry createURLForUploadWithStageID:v14 name:@"brpackage"];
  v65 = [(BRCStageRegistry *)self->_stageRegistry createURLForUploadWithStageID:v14 name:@"ckpackage"];
  if ([v13 isFinderBookmark])
  {
    v51 = brc_bread_crumbs();
    uint64_t v52 = brc_default_log();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT)) {
      -[BRCUploadCKRecordProvider _createPackageRecordForURL:item:stageID:fileSize:boundaryKey:error:]((uint64_t)v51, v52);
    }
  }
  id v19 = [v17 getAndUpdateBoundaryKeyForItem:v13];
  v20 = v19;
  if (a7) {
    *a7 = v19;
  }
  [v13 shouldUseEnhancedDrivePrivacyWhenNeedsPreserving:v20 != 0];
  id v21 = [BRCPackageManifestWriter alloc];
  int v22 = [v13 clientZone];
  uint64_t v23 = [(BRCPackageManifestWriter *)v21 initWithZone:v22 stageID:v14 url:v18];

  id v24 = [(BRCPackageManifestWriter *)v23 error];

  if (!v24)
  {
    id v78 = 0;
    v63 = objc_msgSend(MEMORY[0x263EFD790], "br_packageWithBoundaryKey:error:", v20, &v78);
    id v28 = v78;
    if (v63)
    {
      id v77 = v28;
      char v29 = [v63 anchorAtURL:v65 error:&v77];
      id v57 = v77;

      if (v29)
      {
        v30 = [[BRCLazyPackage alloc] initWithRegistry:self->_stageRegistry stageID:v14 name:@"ckpackage-xattrs" boundaryKey:v20];
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        id v86 = 0;
        v31 = objc_opt_new();
        v67[0] = MEMORY[0x263EF8330];
        v67[1] = 3221225472;
        v67[2] = __96__BRCUploadCKRecordProvider__createPackageRecordForURL_item_stageID_fileSize_boundaryKey_error___block_invoke;
        v67[3] = &unk_265080648;
        id v68 = v66;
        id v53 = v20;
        id v69 = v53;
        v70 = self;
        id v32 = v63;
        id v71 = v32;
        v76 = buf;
        id v55 = v31;
        id v72 = v55;
        v56 = v30;
        v73 = v56;
        v54 = v23;
        v74 = v54;
        id v33 = v18;
        id v75 = v33;
        id v28 = [v32 performTransactionBlock:v67];

        if (v28)
        {
          v61 = brc_bread_crumbs();
          uint64_t v34 = brc_default_log();
          if (os_log_type_enabled(v34, (os_log_type_t)0x90u))
          {
            *(_DWORD *)v79 = 138412802;
            uint64_t v80 = (uint64_t)v32;
            __int16 v81 = 2112;
            uint64_t v82 = (uint64_t)v28;
            __int16 v83 = 2112;
            v84 = v61;
            _os_log_error_impl(&dword_23FA42000, v34, (os_log_type_t)0x90u, "[ERROR] Fail to performTransactionBlock for package [%@] with error [%@]%@", v79, 0x20u);
          }

          if (a8)
          {
            id v35 = v28;
LABEL_40:
            id v27 = 0;
            *a8 = v35;
LABEL_42:

            _Block_object_dispose(buf, 8);
            goto LABEL_43;
          }
        }
        else
        {
          [v32 close];
          if ([(BRCPackageManifestWriter *)v54 done])
          {
            uint64_t v42 = [(BRCLazyPackage *)v56 closeAndReturn];
            if (v42) {
              [v17 setObject:v42 forKeyedSubscript:@"pkgXattrs"];
            }
            id v58 = (id)v42;
            __int16 v43 = objc_msgSend(MEMORY[0x263EFD5E0], "br_assetWithFileURL:boundaryKey:", v33, v53, v53);
            [v17 setObject:v32 forKeyedSubscript:@"pkgContent"];
            [v17 setObject:v43 forKeyedSubscript:@"pkgManifest"];
            id v44 = [v55 signature];
            [v17 setObject:v44 forKeyedSubscript:@"pkgSignature"];

            if (a6) {
              *a6 = *(void *)(*(void *)&buf[8] + 24);
            }
            id v27 = v17;

            goto LABEL_42;
          }
          v62 = brc_bread_crumbs();
          __int16 v46 = brc_default_log();
          if (os_log_type_enabled(v46, (os_log_type_t)0x90u))
          {
            uint64_t v48 = [v33 path];
            uint64_t v49 = [(BRCPackageManifestWriter *)v54 error];
            *(_DWORD *)v79 = 138412802;
            id v59 = (id)v48;
            uint64_t v80 = v48;
            __int16 v81 = 2112;
            uint64_t v82 = v49;
            __int16 v83 = 2112;
            v84 = v62;
            __int16 v50 = (void *)v49;
            _os_log_error_impl(&dword_23FA42000, v46, (os_log_type_t)0x90u, "[ERROR] failed to create manifest at %@: %@%@", v79, 0x20u);
          }
          if (a8)
          {
            id v35 = [(BRCPackageManifestWriter *)v54 error];
            goto LABEL_40;
          }
        }
        id v27 = 0;
        goto LABEL_42;
      }
      v39 = brc_bread_crumbs();
      v40 = brc_default_log();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v41 = [v65 path];
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = v63;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v41;
        *(_WORD *)&buf[22] = 2112;
        id v86 = v57;
        __int16 v87 = 2112;
        v88 = v39;
        _os_log_impl(&dword_23FA42000, v40, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to anchor package %@ at %@: %@%@", buf, 0x2Au);
      }
      if (!a8)
      {
        id v27 = 0;
        id v28 = v57;
        goto LABEL_43;
      }
      id v38 = v57;
    }
    else
    {
      v36 = brc_bread_crumbs();
      id v37 = brc_default_log();
      if (os_log_type_enabled(v37, (os_log_type_t)0x90u)) {
        -[BRCUploadCKRecordProvider _createPackageRecordForURL:item:stageID:fileSize:boundaryKey:error:]();
      }

      if (!a8)
      {
        id v27 = 0;
        goto LABEL_43;
      }
      id v38 = v28;
    }
    id v28 = v38;
    id v27 = 0;
    *a8 = v38;
LABEL_43:

    goto LABEL_44;
  }
  uint64_t v25 = brc_bread_crumbs();
  v26 = brc_default_log();
  if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
  {
    v64 = [v18 path];
    __int16 v45 = [(BRCPackageManifestWriter *)v23 error];
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v64;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v45;
    *(_WORD *)&buf[22] = 2112;
    id v86 = v25;
    _os_log_error_impl(&dword_23FA42000, v26, (os_log_type_t)0x90u, "[ERROR] failed to create manifest at %@: %@%@", buf, 0x20u);
  }
  if (a8)
  {
    [(BRCPackageManifestWriter *)v23 error];
    id v27 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v27 = 0;
  }
LABEL_44:

  return v27;
}

id __96__BRCUploadCKRecordProvider__createPackageRecordForURL_item_stageID_fileSize_boundaryKey_error___block_invoke(uint64_t a1)
{
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v35[3] = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = __Block_byref_object_copy__7;
  id v33 = __Block_byref_object_dispose__7;
  id v34 = 0;
  v2 = [BRCFSPackageEnumerator alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5 = (id *)(v30 + 5);
  id obj = (id)v30[5];
  id v6 = [(BRCFSPackageEnumerator *)v2 initForURL:v3 boundaryKey:v4 error:&obj];
  objc_storeStrong(v5, obj);
  if (v6)
  {
    id v7 = objc_alloc_init(BRFieldPkgItem);
    id v8 = (id *)(v30 + 5);
    id v27 = (id)v30[5];
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    v15 = __96__BRCUploadCKRecordProvider__createPackageRecordForURL_item_stageID_fileSize_boundaryKey_error___block_invoke_18;
    uint64_t v16 = &unk_265080620;
    v9 = *(void **)(a1 + 56);
    uint64_t v17 = *(void *)(a1 + 48);
    id v24 = v35;
    id v18 = v9;
    uint64_t v25 = &v29;
    uint64_t v26 = *(void *)(a1 + 96);
    v10 = v7;
    id v19 = v10;
    id v20 = *(id *)(a1 + 64);
    id v21 = *(id *)(a1 + 72);
    id v22 = *(id *)(a1 + 80);
    id v23 = *(id *)(a1 + 88);
    [v6 enumeratePackageItemsWithSortOrder:2 error:&v27 usingBlock:&v13];
    objc_storeStrong(v8, v27);
    objc_msgSend(*(id *)(a1 + 64), "done", v13, v14, v15, v16, v17);
    id v11 = (id)v30[5];
  }
  else
  {
    id v11 = (id)v30[5];
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(v35, 8);
  return v11;
}

void __96__BRCUploadCKRecordProvider__createPackageRecordForURL_item_stageID_fileSize_boundaryKey_error___block_invoke_18(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  if ([v7 isFile])
  {
    id v9 = objc_alloc(MEMORY[0x263EFD798]);
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 16);
    id v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v7, "fileID"));
    id v12 = [v7 generationID];
    uint64_t v13 = [v12 fsGenerationID];
    uint64_t v14 = (void *)[v9 initWithDeviceID:v10 fileID:v11 generationID:v13];

    ++*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
    objc_msgSend(v14, "setPackageIndex:");
    v15 = [v7 pathInPackage];
    uint64_t v16 = [v15 lastPathComponent];
    uint64_t v17 = objc_msgSend(v16, "br_pathExtension");
    [v14 setItemTypeHint:v17];

    if (([*(id *)(a1 + 40) addItem:v14] & 1) == 0)
    {
      id v34 = brc_bread_crumbs();
      id v35 = brc_default_log();
      if (os_log_type_enabled(v35, (os_log_type_t)0x90u)) {
        __96__BRCUploadCKRecordProvider__createPackageRecordForURL_item_stageID_fileSize_boundaryKey_error___block_invoke_18_cold_2((uint64_t)v34, v35);
      }

      v36 = [MEMORY[0x263EFD710] errorWithCode:1000 format:@"Failed to add item to package"];
      uint64_t v37 = [v36 CKClientSuitableError];
      uint64_t v38 = *(void *)(*(void *)(a1 + 96) + 8);
      v39 = *(void **)(v38 + 40);
      *(void *)(v38 + 40) = v37;

      goto LABEL_29;
    }
    *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) += [v7 size];
  }
  else
  {
    uint64_t v14 = 0;
  }
  [*(id *)(a1 + 48) updateWithPkgItem:v7];
  uint64_t v19 = *(void *)(a1 + 48);
  id v18 = *(void **)(a1 + 56);
  uint64_t v20 = *(void *)(*(void *)(a1 + 96) + 8);
  id obj = *(id *)(v20 + 40);
  char v21 = [v18 addItem:v19 error:&obj];
  objc_storeStrong((id *)(v20 + 40), obj);
  if ((v21 & 1) == 0)
  {
    id v32 = brc_bread_crumbs();
    id v33 = brc_default_log();
    if (os_log_type_enabled(v33, (os_log_type_t)0x90u)) {
      __96__BRCUploadCKRecordProvider__createPackageRecordForURL_item_stageID_fileSize_boundaryKey_error___block_invoke_18_cold_1(v8, (uint64_t)v32, v33);
    }

    goto LABEL_30;
  }
  id v22 = [v7 xattrSignature];

  if (v22)
  {
    id v23 = *(void **)(*(void *)(a1 + 32) + 8);
    uint64_t v24 = [v7 xattrSignature];
    uint64_t v25 = [v23 urlForXattrSignature:v24];

    id v52 = 0;
    LOBYTE(v24) = [v25 checkResourceIsReachableAndReturnError:&v52];
    id v26 = v52;
    if (v24)
    {
      __int16 v50 = a4;
      id v27 = (void *)[objc_alloc(MEMORY[0x263EFD798]) initWithFileURL:v25];
      uint64_t v28 = [*(id *)(a1 + 64) itemCount];
      [v14 setPackageIndex:v28];
      uint64_t v29 = *(void **)(a1 + 64);
      id v51 = v26;
      char v30 = [v29 addItem:v27 error:&v51];
      id v31 = v51;

      if (v30)
      {
        [*(id *)(a1 + 48) setXattrIndex:v28];
      }
      else
      {
        __int16 v41 = brc_bread_crumbs();
        uint64_t v42 = brc_default_log();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v55 = v31;
          __int16 v56 = 2112;
          id v57 = v41;
          _os_log_impl(&dword_23FA42000, v42, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to add xattrs to xattrs package: %@%@", buf, 0x16u);
        }
      }
      id v26 = v31;
      a4 = v50;
    }
    else
    {
      id v27 = brc_bread_crumbs();
      v40 = brc_default_log();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
      {
        uint64_t v49 = [v7 xattrSignature];
        *(_DWORD *)buf = 138412802;
        id v55 = v49;
        __int16 v56 = 2112;
        id v57 = v26;
        __int16 v58 = 2112;
        id v59 = v27;
        _os_log_fault_impl(&dword_23FA42000, v40, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: We're missing a package xattr for signature %@ - %@%@", buf, 0x20u);
      }
    }
  }
  if ((objc_msgSend(*(id *)(a1 + 72), "addItem:", *(void *)(a1 + 48), v50) & 1) == 0)
  {
    uint64_t v43 = [*(id *)(a1 + 72) error];
    uint64_t v44 = *(void *)(*(void *)(a1 + 96) + 8);
    __int16 v45 = *(void **)(v44 + 40);
    *(void *)(v44 + 40) = v43;

    v36 = brc_bread_crumbs();
    __int16 v46 = brc_default_log();
    if (os_log_type_enabled(v46, (os_log_type_t)0x90u))
    {
      uint64_t v47 = [*(id *)(a1 + 80) path];
      uint64_t v48 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
      *(_DWORD *)buf = 138412802;
      id v55 = v47;
      __int16 v56 = 2112;
      id v57 = v48;
      __int16 v58 = 2112;
      id v59 = v36;
      _os_log_error_impl(&dword_23FA42000, v46, (os_log_type_t)0x90u, "[ERROR] failed to create manifest at %@: %@%@", buf, 0x20u);
    }
LABEL_29:

LABEL_30:
    *a4 = 1;
    goto LABEL_31;
  }
  [*(id *)(a1 + 48) clear];
LABEL_31:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_stageRegistry, 0);
}

- (void)createCKRecordFor:document:stageID:mtime:etag:xattrSignature:transferSize:boundaryKey:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_23FA42000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: No xattr url found for signature %@%@", v1, 0x16u);
}

- (void)_createFileRecordForURL:(void *)a1 item:fileSize:boundaryKey:error:.cold.1(void *a1)
{
  v1 = [a1 path];
  uint64_t v2 = objc_msgSend(v1, "fp_prettyPath");
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_1(&dword_23FA42000, v3, v4, "[DEBUG] Creating CK record for URL: %@%@", v5, v6, v7, v8, v9);
}

- (void)_createPackageRecordForURL:item:stageID:fileSize:boundaryKey:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_23FA42000, v0, (os_log_type_t)0x90u, "[ERROR] Failed to create package: %@%@", v1, 0x16u);
}

- (void)_createPackageRecordForURL:(uint64_t)a1 item:(NSObject *)a2 stageID:fileSize:boundaryKey:error:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_23FA42000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: !document.isFinderBookmark%@", (uint8_t *)&v2, 0xCu);
}

- (void)_createPackageRecordForURL:(void *)a1 item:stageID:fileSize:boundaryKey:error:.cold.3(void *a1)
{
  v1 = [a1 path];
  int v2 = objc_msgSend(v1, "fp_prettyPath");
  OUTLINED_FUNCTION_3_1(&dword_23FA42000, v3, v4, "[DEBUG] Creating CK record for URL: %@%@", v5, v6, v7, v8, 2u);
}

void __96__BRCUploadCKRecordProvider__createPackageRecordForURL_item_stageID_fileSize_boundaryKey_error___block_invoke_18_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 path];
  uint64_t v5 = objc_msgSend(v4, "fp_obfuscatedPath");
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_23FA42000, a3, (os_log_type_t)0x90u, "[ERROR] Couldn't add item for checksumming at %@%@", v6, 0x16u);
}

void __96__BRCUploadCKRecordProvider__createPackageRecordForURL_item_stageID_fileSize_boundaryKey_error___block_invoke_18_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23FA42000, a2, (os_log_type_t)0x90u, "[ERROR] Failed to add item to package%@", (uint8_t *)&v2, 0xCu);
}

@end