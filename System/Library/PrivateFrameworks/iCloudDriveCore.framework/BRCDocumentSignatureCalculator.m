@interface BRCDocumentSignatureCalculator
+ (id)_calculateSignatureForFileAtURL:(id)a3 boundaryKey:(id)a4 error:(id *)a5;
+ (id)_calculateSignatureForPackageAtURL:(id)a3 boundaryKey:(id)a4 error:(id *)a5;
+ (id)calculateSignatureForURL:(id)a3 boundaryKey:(id)a4 error:(id *)a5;
@end

@implementation BRCDocumentSignatureCalculator

+ (id)calculateSignatureForURL:(id)a3 boundaryKey:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a3;
  v10 = [v9 url];
  v11 = (void *)MEMORY[0x263F32600];
  v12 = [v9 _scope];

  uint64_t v13 = [v11 consumeSandboxExtension:v12 error:a5];
  if (v13 < 0)
  {
    v17 = 0;
  }
  else
  {
    char v23 = 0;
    v14 = [MEMORY[0x263F08850] defaultManager];
    v15 = [v10 path];
    int v16 = [v14 fileExistsAtPath:v15 isDirectory:&v23];

    if (v16)
    {
      if (v23) {
        [a1 _calculateSignatureForPackageAtURL:v10 boundaryKey:v8 error:a5];
      }
      else {
      v17 = [a1 _calculateSignatureForFileAtURL:v10 boundaryKey:v8 error:a5];
      }
    }
    else
    {
      v18 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithPOSIXCode:", 2);
      if (v18)
      {
        v19 = brc_bread_crumbs();
        v20 = brc_default_log();
        if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
        {
          v22 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v25 = "+[BRCDocumentSignatureCalculator calculateSignatureForURL:boundaryKey:error:]";
          __int16 v26 = 2080;
          if (!a5) {
            v22 = "(ignored by caller)";
          }
          v27 = v22;
          __int16 v28 = 2112;
          v29 = v18;
          __int16 v30 = 2112;
          v31 = v19;
          _os_log_error_impl(&dword_23FA42000, v20, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }
      }
      if (a5) {
        *a5 = v18;
      }

      v17 = 0;
    }
    [MEMORY[0x263F32600] releaseSandboxExtensionHandle:v13];
  }

  return v17;
}

+ (id)_calculateSignatureForPackageAtURL:(id)a3 boundaryKey:(id)a4 error:(id *)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__49;
  v34 = __Block_byref_object_dispose__49;
  id v35 = 0;
  id v9 = [BRCFSPackageEnumerator alloc];
  v10 = (id *)(v31 + 5);
  id obj = (id)v31[5];
  id v11 = [(BRCFSPackageEnumerator *)v9 initForURL:v7 boundaryKey:v8 error:&obj];
  objc_storeStrong(v10, obj);
  v12 = (void *)v31[5];
  if (v12)
  {
    id v13 = v12;
    id v14 = 0;
  }
  else
  {
    v15 = objc_opt_new();
    int v16 = objc_opt_new();
    v17 = (id *)(v31 + 5);
    id v28 = (id)v31[5];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __87__BRCDocumentSignatureCalculator__calculateSignatureForPackageAtURL_boundaryKey_error___block_invoke;
    v24[3] = &unk_265086458;
    id v18 = v16;
    id v25 = v18;
    id v14 = v15;
    id v26 = v14;
    v27 = &v30;
    [v11 enumeratePackageItemsWithSortOrder:2 error:&v28 usingBlock:v24];
    objc_storeStrong(v17, v28);
    [v14 done];

    id v13 = (id)v31[5];
    if (!v13) {
      goto LABEL_6;
    }
  }
  v19 = brc_bread_crumbs();
  v20 = brc_default_log();
  if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
  {
    char v23 = "(passed to caller)";
    *(_DWORD *)buf = 136315906;
    v37 = "+[BRCDocumentSignatureCalculator _calculateSignatureForPackageAtURL:boundaryKey:error:]";
    __int16 v38 = 2080;
    if (!a5) {
      char v23 = "(ignored by caller)";
    }
    v39 = v23;
    __int16 v40 = 2112;
    id v41 = v13;
    __int16 v42 = 2112;
    v43 = v19;
    _os_log_error_impl(&dword_23FA42000, v20, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
  }

LABEL_6:
  if (a5) {
    *a5 = v13;
  }

  if (v31[5])
  {
    v21 = 0;
  }
  else
  {
    v21 = [v14 signature];
  }

  _Block_object_dispose(&v30, 8);
  return v21;
}

void __87__BRCDocumentSignatureCalculator__calculateSignatureForPackageAtURL_boundaryKey_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  [*(id *)(a1 + 32) updateWithPkgItem:a2];
  uint64_t v9 = *(void *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v10 + 40);
  char v11 = [v8 addItem:v9 error:&obj];
  objc_storeStrong((id *)(v10 + 40), obj);
  if (v11)
  {
    [*(id *)(a1 + 32) clear];
  }
  else
  {
    v12 = brc_bread_crumbs();
    id v13 = brc_default_log();
    if (os_log_type_enabled(v13, (os_log_type_t)0x90u)) {
      __87__BRCDocumentSignatureCalculator__calculateSignatureForPackageAtURL_boundaryKey_error___block_invoke_cold_1(v7, (uint64_t)v12, v13);
    }

    *a4 = 1;
  }
}

+ (id)_calculateSignatureForFileAtURL:(id)a3 boundaryKey:(id)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = (char *)a3;
  id v9 = a4;
  uint64_t v10 = [MEMORY[0x263F32600] open:v8 flags:33028];
  if ((v10 & 0x80000000) != 0)
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x263F087E8], "br_errorFromErrno");
    id v14 = brc_bread_crumbs();
    v15 = brc_default_log();
    if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138413058;
      char v23 = (const char *)a1;
      __int16 v24 = 2112;
      id v25 = v8;
      __int16 v26 = 2112;
      uint64_t v27 = v13;
      __int16 v28 = 2112;
      v29 = v14;
      _os_log_error_impl(&dword_23FA42000, v15, (os_log_type_t)0x90u, "[ERROR] %@ - Failed opening contents at '%@'. Error: %@%@", buf, 0x2Au);
    }

    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v11 = v10;
    id v21 = 0;
    uint64_t v12 = objc_msgSend(MEMORY[0x263EFD858], "br_signatureWithFileDescriptor:boundaryKey:error:", v10, v9, &v21);
    uint64_t v13 = (uint64_t)v21;
    if (!(v12 | v13))
    {
      uint64_t v13 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithPOSIXCode:", 22);
    }
    [MEMORY[0x263F32600] closeFD:v11];
  }
  id v16 = (id)v13;
  if (v16)
  {
    v17 = brc_bread_crumbs();
    id v18 = brc_default_log();
    if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
    {
      v20 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      char v23 = "+[BRCDocumentSignatureCalculator _calculateSignatureForFileAtURL:boundaryKey:error:]";
      __int16 v24 = 2080;
      if (!a5) {
        v20 = "(ignored by caller)";
      }
      id v25 = v20;
      __int16 v26 = 2112;
      uint64_t v27 = (uint64_t)v16;
      __int16 v28 = 2112;
      v29 = v17;
      _os_log_error_impl(&dword_23FA42000, v18, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }
  }
  if (a5) {
    *a5 = v16;
  }

  return (id)v12;
}

void __87__BRCDocumentSignatureCalculator__calculateSignatureForPackageAtURL_boundaryKey_error___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v5 = [a1 path];
  v6 = objc_msgSend(v5, "fp_obfuscatedPath");
  int v7 = 138412546;
  id v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_23FA42000, a3, (os_log_type_t)0x90u, "[ERROR] Couldn't add item for checksumming at %@%@", (uint8_t *)&v7, 0x16u);
}

@end