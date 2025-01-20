@interface NSDictionary(ShareSheet)
- (id)sh_removingUnsupportedTypes;
@end

@implementation NSDictionary(ShareSheet)

- (id)sh_removingUnsupportedTypes
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v16 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a1];
  v2 = [a1 objectForKey:@"attachments"];
  v17 = (void *)[v2 mutableCopy];
  if ([v2 count])
  {
    unint64_t v3 = 0;
    v18 = v2;
    do
    {
      v4 = [v2 objectAtIndex:v3];
      v5 = [v4 objectForKey:@"registeredTypeIdentifiers"];
      v6 = [MEMORY[0x1E4F1CA48] arrayWithArray:v5];
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v7 = v5;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      v9 = v7;
      if (v8)
      {
        uint64_t v10 = v8;
        char v11 = 0;
        uint64_t v12 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v7);
            }
            v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            if ([v14 isEqualToString:@"com.apple.group-activities.activity"])
            {
              [v6 removeObject:v14];
              char v11 = 1;
            }
          }
          uint64_t v10 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v10);

        v2 = v18;
        if ((v11 & 1) == 0) {
          goto LABEL_15;
        }
        v9 = (void *)[v4 mutableCopy];
        [v9 setObject:v6 forKey:@"registeredTypeIdentifiers"];
        [v17 setObject:v9 atIndexedSubscript:v3];
      }

LABEL_15:
      ++v3;
    }
    while (v3 < [v2 count]);
  }
  [v16 setObject:v17 forKey:@"attachments"];

  return v16;
}

@end