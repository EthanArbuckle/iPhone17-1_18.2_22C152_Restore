@interface CKRecord(BRCContainerMetadataAdditions)
+ (id)brc_containerMetadataRecordWithContainer:()BRCContainerMetadataAdditions;
- (id)brc_containerMetadataIconNames;
- (id)brc_containerMetadataIconPaths;
- (id)brc_containerMetadataPropertiesData;
@end

@implementation CKRecord(BRCContainerMetadataAdditions)

+ (id)brc_containerMetadataRecordWithContainer:()BRCContainerMetadataAdditions
{
  id v3 = a3;
  v4 = [v3 containerMetadata];
  if (v4)
  {
    v5 = objc_msgSend(MEMORY[0x263EFD808], "brc_containerMetadataZoneID");
    id v6 = objc_alloc(MEMORY[0x263EFD7E8]);
    v7 = [v3 appLibraryID];
    v8 = (void *)[v6 initWithRecordName:v7 zoneID:v5];

    v9 = (void *)[objc_alloc(MEMORY[0x263EFD7C8]) initWithRecordType:@"AppContainer" recordID:v8];
    v10 = (void *)[v4 copyDataRepresentation];
    if (!v10)
    {
      v17 = brc_bread_crumbs();
      v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        +[CKRecord(BRCContainerMetadataAdditions) brc_containerMetadataRecordWithContainer:]();
      }
    }
    [v9 setObject:v10 forKeyedSubscript:@"infoPlist"];
    v11 = [v3 containerMetadata];
    v12 = [v11 iconURLs];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __84__CKRecord_BRCContainerMetadataAdditions__brc_containerMetadataRecordWithContainer___block_invoke;
    v19[3] = &unk_265080F30;
    id v13 = v9;
    id v20 = v13;
    [v12 enumerateKeysAndObjectsUsingBlock:v19];

    v14 = [v3 containerMetadataEtag];

    if (v14)
    {
      v15 = [v3 containerMetadataEtag];
      [v13 setEtag:v15];

      [v13 setKnownToServer:1];
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)brc_containerMetadataPropertiesData
{
  v1 = [a1 objectForKeyedSubscript:@"infoPlist"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (id)brc_containerMetadataIconNames
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263EFF980] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = BRContainerIconCKAssetKeys();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = objc_msgSend(a1, "objectForKeyedSubscript:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v9 = BRContainerIconNameForCKAssetKey();
          [v2 addObject:v9];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  return v2;
}

- (id)brc_containerMetadataIconPaths
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v12 = [MEMORY[0x263EFF9A0] dictionary];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = BRContainerIconCKAssetKeys();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = [a1 objectForKeyedSubscript:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v8 = [v7 fileURL];
          if ([v8 isFileURL])
          {
            v9 = [v8 path];
            v10 = BRContainerIconNameForCKAssetKey();
            [v12 setObject:v9 forKeyedSubscript:v10];
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }

  return v12;
}

+ (void)brc_containerMetadataRecordWithContainer:()BRCContainerMetadataAdditions .cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: dataRepresentation != nil%@", v2, v3, v4, v5, v6);
}

@end