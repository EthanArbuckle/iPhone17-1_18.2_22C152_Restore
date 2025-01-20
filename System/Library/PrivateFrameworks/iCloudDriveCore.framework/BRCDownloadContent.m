@interface BRCDownloadContent
- (BOOL)_stageWithDownloadStager:(id)a3 error:(id *)a4;
- (BOOL)_stageWithDownloadStager:(id)a3 manifest:(id)a4 package:(id)a5 xattrsPackage:(id)a6 error:(id *)a7;
- (BOOL)isDocumentModifiedByOtherUser;
- (BOOL)isLoser;
- (BRCDownloadContent)initWithDocument:(id)a3 stageID:(id)a4 etagIfLoser:(id)a5 downloadKind:(int)a6;
- (id)description;
- (id)etagIfLoser;
- (int)kind;
- (void)setProgress:(id)a3;
@end

@implementation BRCDownloadContent

- (void)setProgress:(id)a3
{
}

- (id)etagIfLoser
{
  if (self->_isLoser) {
    return self->super._etag;
  }
  else {
    return 0;
  }
}

- (int)kind
{
  return self->_kind;
}

- (BRCDownloadContent)initWithDocument:(id)a3 stageID:(id)a4 etagIfLoser:(id)a5 downloadKind:(int)a6
{
  id v10 = a3;
  v11 = (NSString *)a5;
  v21.receiver = self;
  v21.super_class = (Class)BRCDownloadContent;
  v12 = [(BRCDownload *)&v21 initWithDocument:v10 stageID:a4];
  if (v12)
  {
    uint64_t v13 = [v10 serverZone];
    zone = v12->_zone;
    v12->_zone = (BRCServerZone *)v13;

    v15 = [v10 currentVersion];
    v12->super._totalSize = [v15 size];

    v12->_isFinderBookmark = [v10 isFinderBookmark];
    etag = v11;
    if (!v11) {
      etag = v12->super._etag;
    }
    objc_storeStrong((id *)&v12->super._etag, etag);
    v12->_isLoser = v11 != 0;
    v12->_kind = a6;
    v17 = [v10 currentVersion];
    v18 = [v10 db];
    v19 = [v17 lastEditorUserIdentityWithDB:v18];

    if (v19) {
      v12->_isDocumentModifiedByOtherUser = 1;
    }
  }

  return v12;
}

- (id)description
{
  if (self->_isLoser) {
    v2 = "loser";
  }
  else {
    v2 = "current";
  }
  return (id)[NSString stringWithFormat:@"<dl-content[%lld] %@_%@ %s>", self->super._throttleID, self->super._itemID, self->super._etag, v2];
}

- (BOOL)_stageWithDownloadStager:(id)a3 manifest:(id)a4 package:(id)a5 xattrsPackage:(id)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  stageID = self->super._stageID;
  id v16 = a3;
  v17 = [v16 createURLForDownloadWithStageID:stageID name:@"item"];
  v18 = [v16 createURLForDownloadWithStageID:self->super._stageID name:@"brpackage-extended"];

  v19 = [[BRCPackageManifestReader alloc] initWithAsset:v12];
  v20 = [BRCPackageManifestWriter alloc];
  objc_super v21 = [(BRCServerZone *)self->_zone clientZone];
  v22 = [(BRCPackageManifestWriter *)v20 initWithZone:v21 stageID:self->super._stageID url:v18];

  v23 = NSURL;
  uint64_t v35 = MEMORY[0x263EF8330];
  uint64_t v36 = 3221225472;
  v37 = __84__BRCDownloadContent__stageWithDownloadStager_manifest_package_xattrsPackage_error___block_invoke;
  v38 = &unk_2650843A8;
  v24 = v22;
  v39 = v24;
  v25 = v19;
  v40 = v25;
  id v26 = v13;
  id v41 = v26;
  id v27 = v14;
  id v42 = v27;
  id v28 = v17;
  int v46 = -1;
  id v43 = v28;
  v44 = self;
  v45 = a7;
  objc_msgSend(v23, "br_setIOPolicy:type:forBlock:", 1, 7, &v35);
  v29 = objc_msgSend(v12, "fileURL", v35, v36, v37, v38);

  if (v29)
  {
    v30 = [MEMORY[0x263F08850] defaultManager];
    v31 = [v12 fileURL];
    [v30 removeItemAtURL:v31 error:0];
  }
  v32 = [(BRCPackageManifestWriter *)v24 error];
  BOOL v33 = v32 == 0;

  return v33;
}

uint64_t __84__BRCDownloadContent__stageWithDownloadStager_manifest_package_xattrsPackage_error___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(unsigned int *)(a1 + 88);
  uint64_t v7 = *(void *)(a1 + 64);
  v8 = [*(id *)(a1 + 72) recordID];
  v9 = [v8 recordName];
  LOBYTE(v17) = *(unsigned char *)(*(void *)(a1 + 72) + 117);
  LOBYTE(v2) = [v2 stagePackageWithReader:v3 package:v4 xattrsPackage:v5 stageItemURL:v7 livefd:v6 recordName:v9 isDocumentModifiedByOtherUser:v17];

  if ((v2 & 1) == 0)
  {
    id v10 = [*(id *)(a1 + 32) error];
    if (v10)
    {
      v11 = brc_bread_crumbs();
      id v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v15 = *(void *)(a1 + 80);
        *(_DWORD *)buf = 136315906;
        if (v15) {
          id v16 = "(passed to caller)";
        }
        else {
          id v16 = "(ignored by caller)";
        }
        v19 = "-[BRCDownloadContent _stageWithDownloadStager:manifest:package:xattrsPackage:error:]_block_invoke";
        __int16 v20 = 2080;
        objc_super v21 = v16;
        __int16 v22 = 2112;
        v23 = v10;
        __int16 v24 = 2112;
        v25 = v11;
        _os_log_debug_impl(&dword_23FA42000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    id v13 = *(id **)(a1 + 80);
    if (v13) {
      objc_storeStrong(v13, v10);
    }
  }
  uint64_t result = *(unsigned int *)(a1 + 88);
  if ((result & 0x80000000) == 0) {
    return close(result);
  }
  return result;
}

- (BOOL)_stageWithDownloadStager:(id)a3 error:(id *)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v6 = a3;
  p_record = &self->super._record;
  if (self->_isFinderBookmark) {
    v8 = kBRRecordKeyFinderBookmarkContent;
  }
  else {
    v8 = kBRRecordKeyFileContent;
  }
  uint64_t v9 = [(CKRecord *)self->super._record objectForKeyedSubscript:*v8];
  if (v9)
  {
    id v10 = (id)v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v25 = brc_bread_crumbs();
      uint64_t v26 = brc_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
        -[BRCDownloadContent _stageWithDownloadStager:error:].cold.6();
      }

      v11 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: file content is not a CKAsset: %@", *p_record);
      if (v11)
      {
        id v27 = brc_bread_crumbs();
        id v28 = brc_default_log();
        if (os_log_type_enabled(v28, (os_log_type_t)0x90u))
        {
          v44 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v52 = "-[BRCDownloadContent _stageWithDownloadStager:error:]";
          __int16 v53 = 2080;
          if (!a4) {
            v44 = "(ignored by caller)";
          }
          v54 = v44;
          __int16 v55 = 2112;
          id v56 = v11;
          __int16 v57 = 2112;
          v58 = v27;
          _os_log_error_impl(&dword_23FA42000, v28, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }
      }
      if (a4) {
        objc_storeStrong(a4, v11);
      }
      goto LABEL_86;
    }
    v11 = [v6 createURLForDownloadWithStageID:self->super._stageID name:@"item"];
    id v12 = [v10 fileURL];

    if (v12) {
      BOOL v13 = v11 == 0;
    }
    else {
      BOOL v13 = 1;
    }
    if (v13)
    {
      id v14 = brc_bread_crumbs();
      uint64_t v15 = brc_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        v45 = [v10 fileURL];
        *(_DWORD *)buf = 138412802;
        v52 = v45;
        __int16 v53 = 2112;
        v54 = (const char *)v11;
        __int16 v55 = 2112;
        id v56 = v14;
        _os_log_fault_impl(&dword_23FA42000, v15, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: asset has a missing url (%@), or we can't compute the stage url %@%@", buf, 0x20u);
      }
      id v16 = (void *)MEMORY[0x263F087E8];
      uint64_t v17 = *MEMORY[0x263F32430];
      v18 = [v10 fileURL];
      objc_msgSend(v16, "br_errorWithDomain:code:description:", v17, 15, @"unreachable: asset has a missing url (%@), or we can't compute the stage url %@", v18, v11);
      id v31 = (id)objc_claimAutoreleasedReturnValue();

      if (!v31) {
        goto LABEL_34;
      }
      v29 = brc_bread_crumbs();
      v30 = brc_default_log();
      if (os_log_type_enabled(v30, (os_log_type_t)0x90u))
      {
        v19 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v52 = "-[BRCDownloadContent _stageWithDownloadStager:error:]";
        __int16 v53 = 2080;
        if (!a4) {
          v19 = "(ignored by caller)";
        }
        v54 = v19;
        __int16 v55 = 2112;
        id v56 = v31;
        __int16 v57 = 2112;
        v58 = v29;
        _os_log_error_impl(&dword_23FA42000, v30, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    else
    {
      v29 = [MEMORY[0x263F08850] defaultManager];
      v30 = [v10 fileURL];
      id v50 = 0;
      objc_msgSend(v29, "br_forceMoveItemAtURL:toURL:error:", v30, v11, &v50);
      id v31 = v50;
    }

LABEL_34:
    if (a4) {
      objc_storeStrong(a4, v31);
    }
LABEL_85:

LABEL_86:
    BOOL v24 = 0;
    goto LABEL_87;
  }
  if (!self->_isFinderBookmark)
  {
    v11 = [(CKRecord *)*p_record objectForKeyedSubscript:@"pkgContent"];
    id v10 = [(CKRecord *)*p_record objectForKeyedSubscript:@"pkgManifest"];
    id v31 = [(CKRecord *)*p_record objectForKeyedSubscript:@"pkgXattrs"];
    if (v11) {
      BOOL v32 = v10 == 0;
    }
    else {
      BOOL v32 = 1;
    }
    if (v32)
    {
      BOOL v33 = brc_bread_crumbs();
      v34 = brc_default_log();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
        -[BRCDownloadContent _stageWithDownloadStager:error:].cold.4();
      }

      uint64_t v35 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: unknown type for downloaded object %@", *p_record);
      if (!v35) {
        goto LABEL_82;
      }
      uint64_t v36 = brc_bread_crumbs();
      v37 = brc_default_log();
      if (!os_log_type_enabled(v37, (os_log_type_t)0x90u)) {
        goto LABEL_81;
      }
      v38 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v52 = "-[BRCDownloadContent _stageWithDownloadStager:error:]";
      __int16 v53 = 2080;
      if (!a4) {
        v38 = "(ignored by caller)";
      }
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!v31 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            BOOL v24 = [(BRCDownloadContent *)self _stageWithDownloadStager:v6 manifest:v10 package:v11 xattrsPackage:v31 error:a4];

            goto LABEL_87;
          }
          v47 = brc_bread_crumbs();
          v48 = brc_default_log();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT)) {
            -[BRCDownloadContent _stageWithDownloadStager:error:]();
          }

          uint64_t v35 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: xattrs package is not a CKAsset: %@", *p_record);
          if (!v35)
          {
LABEL_82:
            if (a4) {
              objc_storeStrong(a4, v35);
            }

            goto LABEL_85;
          }
          uint64_t v36 = brc_bread_crumbs();
          v37 = brc_default_log();
          if (!os_log_type_enabled(v37, (os_log_type_t)0x90u))
          {
LABEL_81:

            goto LABEL_82;
          }
          v38 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v52 = "-[BRCDownloadContent _stageWithDownloadStager:error:]";
          __int16 v53 = 2080;
          if (!a4) {
            v38 = "(ignored by caller)";
          }
        }
        else
        {
          id v42 = brc_bread_crumbs();
          id v43 = brc_default_log();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT)) {
            -[BRCDownloadContent _stageWithDownloadStager:error:]();
          }

          uint64_t v35 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: package manifest is not a CKAsset: %@", *p_record);
          if (!v35) {
            goto LABEL_82;
          }
          uint64_t v36 = brc_bread_crumbs();
          v37 = brc_default_log();
          if (!os_log_type_enabled(v37, (os_log_type_t)0x90u)) {
            goto LABEL_81;
          }
          v38 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v52 = "-[BRCDownloadContent _stageWithDownloadStager:error:]";
          __int16 v53 = 2080;
          if (!a4) {
            v38 = "(ignored by caller)";
          }
        }
      }
      else
      {
        v40 = brc_bread_crumbs();
        id v41 = brc_default_log();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT)) {
          -[BRCDownloadContent _stageWithDownloadStager:error:]();
        }

        uint64_t v35 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: pkg content is not a CKPackage: %@", *p_record);
        if (!v35) {
          goto LABEL_82;
        }
        uint64_t v36 = brc_bread_crumbs();
        v37 = brc_default_log();
        if (!os_log_type_enabled(v37, (os_log_type_t)0x90u)) {
          goto LABEL_81;
        }
        v38 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v52 = "-[BRCDownloadContent _stageWithDownloadStager:error:]";
        __int16 v53 = 2080;
        if (!a4) {
          v38 = "(ignored by caller)";
        }
      }
    }
    v54 = v38;
    __int16 v55 = 2112;
    id v56 = v35;
    __int16 v57 = 2112;
    v58 = v36;
    _os_log_error_impl(&dword_23FA42000, v37, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    goto LABEL_81;
  }
  __int16 v20 = brc_bread_crumbs();
  objc_super v21 = brc_default_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
    -[BRCDownloadContent _stageWithDownloadStager:error:].cold.5();
  }

  objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: finder bookmark without content: %@", *p_record);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    __int16 v22 = brc_bread_crumbs();
    v23 = brc_default_log();
    if (os_log_type_enabled(v23, (os_log_type_t)0x90u))
    {
      int v46 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v52 = "-[BRCDownloadContent _stageWithDownloadStager:error:]";
      __int16 v53 = 2080;
      if (!a4) {
        int v46 = "(ignored by caller)";
      }
      v54 = v46;
      __int16 v55 = 2112;
      id v56 = v10;
      __int16 v57 = 2112;
      v58 = v22;
      _os_log_error_impl(&dword_23FA42000, v23, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }
  }
  if (a4)
  {
    id v10 = v10;
    BOOL v24 = 0;
    v11 = *a4;
    *a4 = v10;
LABEL_87:

    goto LABEL_88;
  }
  BOOL v24 = 0;
LABEL_88:

  return v24;
}

- (BOOL)isLoser
{
  return self->_isLoser;
}

- (BOOL)isDocumentModifiedByOtherUser
{
  return self->_isDocumentModifiedByOtherUser;
}

- (void).cxx_destruct
{
}

- (void)_stageWithDownloadStager:error:.cold.1()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: xattrs package is not a CKAsset: %@%@");
}

- (void)_stageWithDownloadStager:error:.cold.2()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: package manifest is not a CKAsset: %@%@");
}

- (void)_stageWithDownloadStager:error:.cold.3()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: pkg content is not a CKPackage: %@%@");
}

- (void)_stageWithDownloadStager:error:.cold.4()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: unknown type for downloaded object %@%@");
}

- (void)_stageWithDownloadStager:error:.cold.5()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: finder bookmark without content: %@%@");
}

- (void)_stageWithDownloadStager:error:.cold.6()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: file content is not a CKAsset: %@%@");
}

@end