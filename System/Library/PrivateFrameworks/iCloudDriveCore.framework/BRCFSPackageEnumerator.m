@interface BRCFSPackageEnumerator
- (BOOL)enumeratePackageItemsWithSortOrder:(unint64_t)a3 error:(id *)a4 usingBlock:(id)a5;
- (id)initForURL:(id)a3 boundaryKey:(id)a4 error:(id *)a5;
@end

@implementation BRCFSPackageEnumerator

- (id)initForURL:(id)a3 boundaryKey:(id)a4 error:(id *)a5
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v36 = a4;
  v45.receiver = self;
  v45.super_class = (Class)BRCFSPackageEnumerator;
  v10 = [(BRCFSPackageEnumerator *)&v45 init];
  if (!v10) {
    goto LABEL_17;
  }
  v11 = brc_bread_crumbs();
  v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[BRCFSPackageEnumerator initForURL:boundaryKey:error:]((uint64_t)v9, (uint64_t)v11, v12);
  }

  objc_storeStrong((id *)&v10->_rootURL, a3);
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__8;
  v43 = __Block_byref_object_dispose__8;
  id v44 = 0;
  v13 = [MEMORY[0x263F08850] defaultManager];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __55__BRCFSPackageEnumerator_initForURL_boundaryKey_error___block_invoke;
  v38[3] = &unk_265080670;
  v38[4] = &v39;
  v14 = [v13 enumeratorAtURL:v9 includingPropertiesForKeys:0 options:16 errorHandler:v38];

  uint64_t v15 = +[BRCSQLBackedSet createStringsSetWithError:a5];
  packageItems = v10->_packageItems;
  v10->_packageItems = (BRCSQLBackedSet *)v15;

  if (!v10->_packageItems) {
    goto LABEL_15;
  }
  v18 = 0;
  *(void *)&long long v17 = 138412546;
  long long v35 = v17;
  while (1)
  {
    objc_msgSend(v14, "nextObject", v35);
    v19 = (char *)objc_claimAutoreleasedReturnValue();

    if (!v19) {
      break;
    }
    v20 = (void *)MEMORY[0x2455D97F0]();
    brc_bread_crumbs();
    v21 = (char *)objc_claimAutoreleasedReturnValue();
    v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = v35;
      v47 = v19;
      __int16 v48 = 2112;
      v49 = v21;
      _os_log_debug_impl(&dword_23FA42000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] Enumerating %@%@", buf, 0x16u);
    }

    v23 = v10->_packageItems;
    v24 = [v19 relativePath];
    v25 = (id *)(v40 + 5);
    id obj = (id)v40[5];
    [(BRCSQLBackedSet *)v23 addObject:v24 error:&obj];
    objc_storeStrong(v25, obj);

    v18 = v19;
  }
  v26 = (void *)v40[5];
  if (!v26)
  {
    uint64_t v31 = [v36 copy];
    boundaryKey = v10->_boundaryKey;
    v10->_boundaryKey = (NSData *)v31;

    _Block_object_dispose(&v39, 8);
LABEL_17:
    v30 = v10;
    goto LABEL_18;
  }
  id v27 = v26;
  v28 = brc_bread_crumbs();
  v29 = brc_default_log();
  if (os_log_type_enabled(v29, (os_log_type_t)0x90u))
  {
    v34 = "(passed to caller)";
    *(_DWORD *)buf = 136315906;
    v47 = "-[BRCFSPackageEnumerator initForURL:boundaryKey:error:]";
    __int16 v48 = 2080;
    if (!a5) {
      v34 = "(ignored by caller)";
    }
    v49 = v34;
    __int16 v50 = 2112;
    id v51 = v27;
    __int16 v52 = 2112;
    v53 = v28;
    _os_log_error_impl(&dword_23FA42000, v29, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
  }

  if (a5) {
    *a5 = v27;
  }

LABEL_15:
  _Block_object_dispose(&v39, 8);

  v30 = 0;
LABEL_18:

  return v30;
}

uint64_t __55__BRCFSPackageEnumerator_initForURL_boundaryKey_error___block_invoke(uint64_t a1, int a2, id obj)
{
  return 0;
}

- (BOOL)enumeratePackageItemsWithSortOrder:(unint64_t)a3 error:(id *)a4 usingBlock:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = a5;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__8;
  v22 = __Block_byref_object_dispose__8;
  id v23 = 0;
  packageItems = self->_packageItems;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __78__BRCFSPackageEnumerator_enumeratePackageItemsWithSortOrder_error_usingBlock___block_invoke;
  v15[3] = &unk_265080698;
  v15[4] = self;
  long long v17 = &v18;
  id v9 = v7;
  id v16 = v9;
  [(BRCSQLBackedSet *)packageItems enumerateObjectsWithSortOrder:2 usingBlock:v15];
  id v10 = (id)v19[5];
  if (v10)
  {
    v11 = brc_bread_crumbs();
    v12 = brc_default_log();
    if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
    {
      v14 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v25 = "-[BRCFSPackageEnumerator enumeratePackageItemsWithSortOrder:error:usingBlock:]";
      __int16 v26 = 2080;
      if (!a4) {
        v14 = "(ignored by caller)";
      }
      id v27 = v14;
      __int16 v28 = 2112;
      id v29 = v10;
      __int16 v30 = 2112;
      uint64_t v31 = v11;
      _os_log_error_impl(&dword_23FA42000, v12, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }
  }
  if (a4) {
    *a4 = v10;
  }

  _Block_object_dispose(&v18, 8);
  return v10 == 0;
}

void __78__BRCFSPackageEnumerator_enumeratePackageItemsWithSortOrder_error_usingBlock___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a2;
  v6 = (void *)MEMORY[0x2455D97F0]();
  id v7 = [*(id *)(a1[4] + 8) URLByAppendingPathComponent:v5];
  uint64_t v8 = a1[4];
  uint64_t v9 = *(void *)(v8 + 8);
  uint64_t v10 = *(void *)(v8 + 24);
  uint64_t v11 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v11 + 40);
  id v12 = +[BRCPackageItem newItemForSignatureCalculationWithURL:v7 inPackage:v9 boundaryKey:v10 error:&obj];
  objc_storeStrong((id *)(v11 + 40), obj);
  if (v12)
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
  else if (objc_msgSend(*(id *)(*(void *)(a1[6] + 8) + 40), "br_isCloudDocsErrorCode:", 43))
  {
    v13 = brc_bread_crumbs();
    v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v7 path];
      id v16 = objc_msgSend(v15, "fp_obfuscatedPath");
      *(_DWORD *)buf = 138412546;
      __int16 v26 = v16;
      __int16 v27 = 2112;
      __int16 v28 = v13;
      _os_log_impl(&dword_23FA42000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] Ignoring excluded package item from sync %@%@", buf, 0x16u);
    }
    uint64_t v17 = *(void *)(a1[6] + 8);
    uint64_t v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = 0;
  }
  else
  {
    v19 = brc_bread_crumbs();
    uint64_t v20 = brc_default_log();
    if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
    {
      v21 = [v7 path];
      v22 = objc_msgSend(v21, "fp_obfuscatedPath");
      id v23 = *(void **)(*(void *)(a1[6] + 8) + 40);
      *(_DWORD *)buf = 138412802;
      __int16 v26 = v22;
      __int16 v27 = 2112;
      __int16 v28 = v23;
      __int16 v29 = 2112;
      __int16 v30 = v19;
      _os_log_error_impl(&dword_23FA42000, v20, (os_log_type_t)0x90u, "[ERROR] Couldn't create import item for %@ - %@%@", buf, 0x20u);
    }
    *a3 = 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boundaryKey, 0);
  objc_storeStrong((id *)&self->_packageItems, 0);
  objc_storeStrong((id *)&self->_rootURL, 0);
}

- (void)initForURL:(uint64_t)a1 boundaryKey:(uint64_t)a2 error:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_23FA42000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Creating BRCFSPackageEnumerator for %@%@", (uint8_t *)&v3, 0x16u);
}

@end