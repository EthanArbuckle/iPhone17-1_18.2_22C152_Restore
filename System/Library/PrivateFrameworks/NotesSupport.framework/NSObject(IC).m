@interface NSObject(IC)
- (uint64_t)ic_addObserver:()IC forKeyPath:context:;
- (uint64_t)ic_addObserver:()IC forKeyPath:context:explicitOptions:;
- (uint64_t)ic_didAddObserverForContext:()IC inScope:;
- (uint64_t)ic_shouldIgnoreObserveValue:()IC ofObject:forKeyPath:;
- (void)ic_removeObserver:()IC forKeyPath:context:;
@end

@implementation NSObject(IC)

- (uint64_t)ic_addObserver:()IC forKeyPath:context:
{
  return objc_msgSend(a1, "ic_addObserver:forKeyPath:context:explicitOptions:", a3, a4, a5, 3);
}

- (uint64_t)ic_addObserver:()IC forKeyPath:context:explicitOptions:
{
  return [a1 addObserver:a3 forKeyPath:a4 options:a6 context:a5];
}

- (uint64_t)ic_shouldIgnoreObserveValue:()IC ofObject:forKeyPath:
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v7 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
  uint64_t v11 = [v7 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
  v12 = (void *)v11;
  if (v10) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13) {
    goto LABEL_11;
  }
  uint64_t v14 = [MEMORY[0x263EFF9D0] null];
  v15 = v10;
  if (v10 == (void *)v14) {
    goto LABEL_10;
  }
  v16 = (void *)v14;
  uint64_t v17 = [MEMORY[0x263EFF9D0] null];
  if (v12 == (void *)v17)
  {

    v15 = v16;
LABEL_10:

    goto LABEL_11;
  }
  v18 = (void *)v17;
  char v19 = [v10 isEqual:v12];

  if (v19)
  {
    uint64_t v20 = 1;
    goto LABEL_35;
  }
LABEL_11:
  v36 = v12;
  v21 = [MEMORY[0x263EFF980] array];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v21 addObject:v8];
  }
  id v37 = v9;
  id v38 = v7;
  v22 = [v9 componentsSeparatedByString:@"."];
  id v23 = v8;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v24 = [v22 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v44;
    do
    {
      uint64_t v27 = 0;
      v28 = v23;
      do
      {
        if (*(void *)v44 != v26) {
          objc_enumerationMutation(v22);
        }
        id v23 = [v28 valueForKey:*(void *)(*((void *)&v43 + 1) + 8 * v27)];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v21 addObject:v23];
        }
        ++v27;
        v28 = v23;
      }
      while (v25 != v27);
      uint64_t v25 = [v22 countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v25);
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v29 = v21;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v40;
    id v7 = v38;
    while (2)
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v40 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        if (([v34 isFault] & 1) != 0 || objc_msgSend(v34, "faultingState"))
        {
          uint64_t v20 = 1;
          goto LABEL_34;
        }
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v39 objects:v47 count:16];
      uint64_t v20 = 0;
      if (v31) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v20 = 0;
    id v7 = v38;
  }
LABEL_34:

  v12 = v36;
  id v9 = v37;
LABEL_35:

  return v20;
}

- (uint64_t)ic_didAddObserverForContext:()IC inScope:
{
  if (a3)
  {
    v4 = a4;
    if (*a3)
    {
      v5 = objc_msgSend(NSString, "stringWithUTF8String:");
      if (!v4)
      {
LABEL_5:
        uint64_t v6 = [v5 isEqualToString:v4];

        return v6;
      }
    }
    else
    {
      v5 = 0;
      if (!a4) {
        goto LABEL_5;
      }
    }
    v4 = [NSString stringWithUTF8String:v4];
    goto LABEL_5;
  }
  return 0;
}

- (void)ic_removeObserver:()IC forKeyPath:context:
{
  id v8 = a3;
  id v9 = a4;
  [a1 removeObserver:v8 forKeyPath:v9 context:a5];
}

- (void)ic_removeObserver:()IC forKeyPath:context:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  objc_begin_catch(a1);
  v4 = os_log_create("com.apple.notes", "SimulatedCrash");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    int v5 = 138412290;
    uint64_t v6 = a3;
    _os_log_fault_impl(&dword_20C263000, v4, OS_LOG_TYPE_FAULT, "Attempting to remove a non-existent observer for key path '%@'", (uint8_t *)&v5, 0xCu);
  }

  objc_end_catch();
}

@end