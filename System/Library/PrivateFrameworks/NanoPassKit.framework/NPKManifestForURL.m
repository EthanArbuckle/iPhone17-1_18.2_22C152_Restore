@interface NPKManifestForURL
@end

@implementation NPKManifestForURL

void ___NPKManifestForURL_block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = pk_Payment_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      v11 = pk_Payment_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        int v24 = 138412546;
        uint64_t v25 = v12;
        __int16 v26 = 2112;
        id v27 = (id)objc_opt_class();
        id v13 = v27;
        _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Warning: manifest.json for unique ID %@ should map filenames to SHA1 hash strings. Found key of class %@", (uint8_t *)&v24, 0x16u);
      }
    }
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = 0;

    *a4 = 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = pk_Payment_log();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

    if (v17)
    {
      v18 = pk_Payment_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = *(void *)(a1 + 32);
        v20 = objc_opt_class();
        int v24 = 138412546;
        uint64_t v25 = v19;
        __int16 v26 = 2112;
        id v27 = v20;
        id v21 = v20;
        _os_log_impl(&dword_21E92F000, v18, OS_LOG_TYPE_DEFAULT, "Warning: manifest.json for unique ID %@ should map filenames to SHA1 hash strings. Found object of class %@", (uint8_t *)&v24, 0x16u);
      }
    }
    uint64_t v22 = *(void *)(*(void *)(a1 + 40) + 8);
    v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = 0;

    *a4 = 1;
  }
}

@end