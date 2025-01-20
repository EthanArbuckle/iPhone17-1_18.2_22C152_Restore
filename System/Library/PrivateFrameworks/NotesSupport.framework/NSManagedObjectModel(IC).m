@interface NSManagedObjectModel(IC)
- (id)ic_versionHash;
@end

@implementation NSManagedObjectModel(IC)

- (id)ic_versionHash
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF980] array];
  v3 = [a1 entityVersionHashesByName];
  v4 = [v3 allKeys];
  v5 = [v4 sortedArrayUsingSelector:sel_localizedCaseInsensitiveCompare_];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * v10);
        v12 = [a1 entityVersionHashesByName];
        v13 = [v12 objectForKeyedSubscript:v11];

        if (v13)
        {
          v14 = objc_msgSend(v13, "ic_md5");
          v15 = [NSString stringWithFormat:@"%@=%@", v11, v14];
          [v2 addObject:v15];
        }
        else
        {
          v14 = os_log_create("com.apple.notes", "CoreData");
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v24 = v11;
            _os_log_debug_impl(&dword_20C263000, v14, OS_LOG_TYPE_DEBUG, "No hash for entity %@ while generating version hash", buf, 0xCu);
          }
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v8);
  }

  v16 = [v2 componentsJoinedByString:@"-"];
  v17 = objc_msgSend(v16, "ic_md5");

  return v17;
}

@end