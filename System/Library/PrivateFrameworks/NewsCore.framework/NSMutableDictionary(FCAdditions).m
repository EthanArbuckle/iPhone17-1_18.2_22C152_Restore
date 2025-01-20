@interface NSMutableDictionary(FCAdditions)
- (void)fc_mergeWithDictionary:()FCAdditions withValueCombiner:;
- (void)fc_removeObjectsForKeysNotInArray:()FCAdditions;
- (void)fc_removeObjectsForKeysNotInSet:()FCAdditions;
- (void)fc_removeObjectsForKeysPassingTest:()FCAdditions;
- (void)fc_safelySetObject:()FCAdditions forKey:;
- (void)fc_safelySetObjectAllowingNil:()FCAdditions forKey:;
- (void)fc_safelySetObjectAllowingNil:()FCAdditions forKeyAllowingNil:;
- (void)fc_transformValuesWithKeyAndValueBlock:()FCAdditions;
@end

@implementation NSMutableDictionary(FCAdditions)

- (void)fc_safelySetObject:()FCAdditions forKey:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6)
    {
      [a1 setObject:v6 forKey:v7];
      goto LABEL_10;
    }
LABEL_7:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)[[NSString alloc] initWithFormat:@"nil value trying to be assigned to %@", v7];
      *(_DWORD *)buf = 136315906;
      v11 = "-[NSMutableDictionary(FCAdditions) fc_safelySetObject:forKey:]";
      __int16 v12 = 2080;
      v13 = "NSDictionary+FCAdditions.m";
      __int16 v14 = 1024;
      int v15 = 389;
      __int16 v16 = 2114;
      v17 = v9;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      if (!v7) {
        goto LABEL_10;
      }
    }
    else if (!v7)
    {
      goto LABEL_10;
    }
    [a1 removeObjectForKey:v7];
    goto LABEL_10;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)[[NSString alloc] initWithFormat:@"nil key trying to be associated with %@", v6];
    *(_DWORD *)buf = 136315906;
    v11 = "-[NSMutableDictionary(FCAdditions) fc_safelySetObject:forKey:]";
    __int16 v12 = 2080;
    v13 = "NSDictionary+FCAdditions.m";
    __int16 v14 = 1024;
    int v15 = 388;
    __int16 v16 = 2114;
    v17 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  if (!v6) {
    goto LABEL_7;
  }
LABEL_10:
}

- (void)fc_removeObjectsForKeysNotInSet:()FCAdditions
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = objc_msgSend(a1, "allKeys", 0);
  id v6 = (void *)[v5 copy];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if (([v4 containsObject:v11] & 1) == 0) {
          [a1 removeObjectForKey:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)fc_safelySetObjectAllowingNil:()FCAdditions forKeyAllowingNil:
{
  id v7 = a3;
  id v6 = a4;
  if (v6)
  {
    if (v7) {
      [a1 setObject:v7 forKey:v6];
    }
    else {
      [a1 removeObjectForKey:v6];
    }
  }
}

- (void)fc_removeObjectsForKeysPassingTest:()FCAdditions
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = objc_msgSend(a1, "allKeys", 0);
  id v6 = (void *)[v5 copy];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        long long v12 = [a1 objectForKey:v11];
        if (v4[2](v4, v11, v12)) {
          [a1 removeObjectForKey:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)fc_safelySetObjectAllowingNil:()FCAdditions forKey:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6) {
      [a1 setObject:v6 forKey:v7];
    }
    else {
      [a1 removeObjectForKey:v7];
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "key");
    *(_DWORD *)buf = 136315906;
    v10 = "-[NSMutableDictionary(FCAdditions) fc_safelySetObjectAllowingNil:forKey:]";
    __int16 v11 = 2080;
    long long v12 = "NSDictionary+FCAdditions.m";
    __int16 v13 = 1024;
    int v14 = 438;
    __int16 v15 = 2114;
    long long v16 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
}

- (void)fc_transformValuesWithKeyAndValueBlock:()FCAdditions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = objc_msgSend(a1, "allKeys", 0);
  id v6 = (void *)[v5 copy];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        long long v12 = [a1 objectForKeyedSubscript:v11];
        __int16 v13 = v4[2](v4, v11, v12);
        if (v13) {
          [a1 setObject:v13 forKeyedSubscript:v11];
        }
        else {
          [a1 removeObjectForKey:0];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)fc_removeObjectsForKeysNotInArray:()FCAdditions
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = objc_msgSend(a1, "allKeys", 0);
  id v6 = (void *)[v5 copy];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if (([v4 containsObject:v11] & 1) == 0) {
          [a1 removeObjectForKey:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)fc_mergeWithDictionary:()FCAdditions withValueCombiner:
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__NSMutableDictionary_FCAdditions__fc_mergeWithDictionary_withValueCombiner___block_invoke;
  v8[3] = &unk_1E5B59128;
  v8[4] = a1;
  id v9 = v6;
  id v7 = v6;
  [a3 enumerateKeysAndObjectsUsingBlock:v8];
}

@end