@interface VCRecordZoneParser
+ (BOOL)parseZoneID:(id)a3 intoIndex:(int64_t *)a4;
+ (BOOL)shouldIgnoreZoneID:(id)a3;
+ (id)activeRecordZone:(id)a3;
+ (id)sortedVoiceShortcutZoneIDsFromZoneIDs:(id)a3;
@end

@implementation VCRecordZoneParser

+ (id)activeRecordZone:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"VCRecordZoneParser.m", 87, @"Invalid parameter not satisfying: %@", @"completionBlock" object file lineNumber description];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __39__VCRecordZoneParser_activeRecordZone___block_invoke;
  aBlock[3] = &unk_1E6558160;
  id v11 = v5;
  id v12 = a1;
  id v6 = v5;
  v7 = _Block_copy(aBlock);

  return v7;
}

void __39__VCRecordZoneParser_activeRecordZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v20 = a3;
  id v5 = *(void **)(a1 + 40);
  id v6 = a2;
  v7 = [v6 allKeys];
  v8 = [v5 sortedVoiceShortcutZoneIDsFromZoneIDs:v7];
  v9 = [v8 lastObject];

  v10 = [v6 objectForKeyedSubscript:v9];

  id v11 = [v20 userInfo];
  id v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];

  v13 = *(void **)(a1 + 40);
  v14 = [v12 allKeys];
  v15 = [v13 sortedVoiceShortcutZoneIDsFromZoneIDs:v14];
  v16 = [v15 lastObject];

  if (v10)
  {
    id v17 = 0;
  }
  else
  {
    v18 = [v12 objectForKeyedSubscript:v16];
    if (v18) {
      v19 = v18;
    }
    else {
      v19 = v20;
    }
    id v17 = v19;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)sortedVoiceShortcutZoneIDsFromZoneIDs:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (!v7) {
      goto LABEL_16;
    }
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    while (1)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v23 + 1) + 8 * v10);
        uint64_t v22 = 0;
        if ([a1 parseZoneID:v11 intoIndex:&v22])
        {
          id v12 = [NSNumber numberWithInteger:v22];
          [v5 setObject:v11 forKeyedSubscript:v12];
LABEL_9:

          goto LABEL_11;
        }
        if (([a1 shouldIgnoreZoneID:v11] & 1) == 0)
        {
          id v12 = getWFPeaceMigrationLogObject();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            v13 = [v11 zoneName];
            *(_DWORD *)buf = 136315394;
            v28 = "+[VCRecordZoneParser sortedVoiceShortcutZoneIDsFromZoneIDs:]";
            __int16 v29 = 2112;
            v30 = v13;
            _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_ERROR, "%s Ignoring zone with unexpected name: (%@)", buf, 0x16u);
          }
          goto LABEL_9;
        }
LABEL_11:
        ++v10;
      }
      while (v8 != v10);
      uint64_t v14 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
      uint64_t v8 = v14;
      if (!v14)
      {
LABEL_16:

        v15 = [v5 allKeys];
        v16 = [v15 sortedArrayUsingSelector:sel_compare_];

        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __60__VCRecordZoneParser_sortedVoiceShortcutZoneIDsFromZoneIDs___block_invoke;
        v20[3] = &unk_1E6558138;
        id v21 = v5;
        id v17 = v5;
        v18 = objc_msgSend(v16, "if_compactMap:", v20);

        goto LABEL_18;
      }
    }
  }
  v18 = 0;
LABEL_18:

  return v18;
}

uint64_t __60__VCRecordZoneParser_sortedVoiceShortcutZoneIDsFromZoneIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
}

+ (BOOL)parseZoneID:(id)a3 intoIndex:(int64_t *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 zoneName];
  if ([v7 length] && (objc_msgSend(a1, "shouldIgnoreZoneID:", v6) & 1) == 0)
  {
    if ([v7 isEqualToString:@"VoiceShortcuts"])
    {
      *a4 = 0;
      BOOL v8 = 1;
    }
    else
    {
      uint64_t v10 = [v7 componentsSeparatedByString:@"-"];
      if ((unint64_t)[v10 count] >= 2)
      {
        id v11 = [v10 lastObject];
        if ([v11 length]
          && ([MEMORY[0x1E4F28B88] decimalDigitCharacterSet],
              id v12 = objc_claimAutoreleasedReturnValue(),
              [v12 invertedSet],
              v13 = objc_claimAutoreleasedReturnValue(),
              uint64_t v14 = [v11 rangeOfCharacterFromSet:v13],
              v13,
              v12,
              v14 == 0x7FFFFFFFFFFFFFFFLL))
        {
          v15 = [v10 lastObject];
          *a4 = [v15 integerValue];

          BOOL v8 = 1;
        }
        else
        {
          BOOL v8 = 0;
        }
      }
      else
      {
        BOOL v8 = 0;
      }
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (BOOL)shouldIgnoreZoneID:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"VCRecordZoneParser.m", 22, @"Invalid parameter not satisfying: %@", @"zoneID" object file lineNumber description];
  }
  id v6 = [v5 zoneName];
  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"_defaultZone", @"metadata_zone", 0);
  char v8 = [v7 containsObject:v6];

  return v8;
}

@end