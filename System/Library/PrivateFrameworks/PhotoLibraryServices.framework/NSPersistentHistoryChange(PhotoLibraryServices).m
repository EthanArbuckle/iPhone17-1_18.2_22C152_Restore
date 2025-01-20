@interface NSPersistentHistoryChange(PhotoLibraryServices)
- (id)_pl_prettyDescriptionWithIndent:()PhotoLibraryServices;
@end

@implementation NSPersistentHistoryChange(PhotoLibraryServices)

- (id)_pl_prettyDescriptionWithIndent:()PhotoLibraryServices
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v2 = [a1 changedObjectID];
  v3 = objc_msgSend(v2, "pl_shortURI");

  if ([a1 changeType] == 1)
  {
    v4 = [a1 updatedProperties];
    PLDescriptionForUpdateProperties(v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ([a1 changeType] != 2)
    {
      v5 = &stru_1EEB2EB80;
      goto LABEL_17;
    }
    id v6 = [a1 tombstone];
    v4 = v6;
    if (v6)
    {
      v25 = v3;
      v7 = [v6 allKeys];
      v8 = [v7 sortedArrayUsingSelector:sel_compare_];

      v5 = [MEMORY[0x1E4F28E78] string];
      [(__CFString *)v5 appendString:@" {"];
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id obj = v8;
      uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v28;
        v12 = &stru_1EEB2EB80;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            v14 = v5;
            if (*(void *)v28 != v11) {
              objc_enumerationMutation(obj);
            }
            uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 8 * i);
            v16 = [v4 objectForKeyedSubscript:v15];
            uint64_t v24 = v15;
            v5 = v14;
            [(__CFString *)v14 appendFormat:@"%@%@: %@", v12, v24, v16];

            v12 = @", ";
          }
          uint64_t v10 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
          v12 = @", ";
        }
        while (v10);
      }

      [(__CFString *)v5 appendString:@"}"];
      v3 = v25;
    }
    else
    {
      v5 = &stru_1EEB2EB80;
    }
  }
LABEL_17:
  v17 = NSString;
  v18 = PLIndentToString();
  uint64_t v19 = [a1 changeID];
  uint64_t v20 = [a1 changeType];
  v21 = @"insert";
  if (v20 == 1) {
    v21 = @"update";
  }
  if (v20 == 2) {
    v21 = @"delete";
  }
  v22 = [v17 stringWithFormat:@"%@Change %08lld: %@ %@%@\n", v18, v19, v21, v3, v5];

  return v22;
}

@end