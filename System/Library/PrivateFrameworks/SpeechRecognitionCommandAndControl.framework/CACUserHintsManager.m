@interface CACUserHintsManager
+ (id)sharedManager;
- (BOOL)shouldDisplayUserHintAfterRegisteringIdentifier:(id)a3;
- (CACUserHintsManager)init;
- (id)suggestedCommandIdentifiersFromActiveCommandIdentifiers:(id)a3 maximumCount:(int64_t)a4;
- (unint64_t)_countAfterRegisteringUserHintIdentifier:(id)a3;
- (void)clearHistory;
@end

@implementation CACUserHintsManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_0 != -1) {
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_22);
  }
  v2 = (void *)sUserHintsManager;
  return v2;
}

uint64_t __36__CACUserHintsManager_sharedManager__block_invoke()
{
  sUserHintsManager = [objc_allocWithZone((Class)CACUserHintsManager) init];
  return MEMORY[0x270F9A758]();
}

- (CACUserHintsManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)CACUserHintsManager;
  return [(CACUserHintsManager *)&v3 init];
}

- (BOOL)shouldDisplayUserHintAfterRegisteringIdentifier:(id)a3
{
  id v4 = a3;
  if (v4
    && [(CACUserHintsManager *)self _countAfterRegisteringUserHintIdentifier:v4] <= 0xA)
  {
    v5 = +[CACPreferences sharedPreferences];
    v6 = [v5 commandCounts];
    v7 = [v6 objectForKey:v4];
    BOOL v8 = (unint64_t)[v7 unsignedLongLongValue] < 0xB;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)suggestedCommandIdentifiersFromActiveCommandIdentifiers:(id)a3 maximumCount:(int64_t)a4
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = +[CACPreferences sharedPreferences];
  v6 = [v5 builtInCommandsTable];
  uint64_t v7 = [v6 objectForKey:@"HistoricalCommandFrequencies"];

  v65 = (void *)v7;
  if (v7) {
    uint64_t v8 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v7];
  }
  else {
    uint64_t v8 = objc_opt_new();
  }
  v9 = (void *)v8;
  v10 = +[CACPreferences sharedPreferences];
  v67 = [v10 userHintsHistory];

  v11 = +[CACPreferences sharedPreferences];
  v12 = [v11 commandCounts];

  v62 = v4;
  v13 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v4];
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  v14 = [v9 allKeys];
  v15 = (void *)[v14 copy];

  uint64_t v16 = [v15 countByEnumeratingWithState:&v82 objects:v89 count:16];
  v66 = v12;
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v83;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v83 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v82 + 1) + 8 * v19);
        if ([v13 containsObject:v20]
          && ([v12 objectForKey:v20],
              v21 = objc_claimAutoreleasedReturnValue(),
              unint64_t v22 = [v21 unsignedLongLongValue],
              v21,
              v22 < 0xB))
        {
          v23 = [v67 objectForKey:v20];
          uint64_t v24 = [v23 unsignedLongLongValue];
          v25 = [v12 objectForKey:v20];
          unint64_t v26 = [v25 unsignedLongLongValue] + v24;

          v12 = v66;
          if (v26)
          {
            uint32_t v27 = arc4random() % 0x64 + 1;
            double v28 = (double)v27 / 10.0 + (float)v26;
            if (v26 >= 0x65) {
              double v28 = (double)v27;
            }
            float v29 = v28;
            v30 = [v9 objectForKey:v20];
            [v30 floatValue];
            float v32 = v31 / v29;

            *(float *)&double v33 = v32;
            v34 = [NSNumber numberWithFloat:v33];
            [v9 setObject:v34 forKey:v20];
          }
        }
        else
        {
          [v9 removeObjectForKey:v20];
        }
        ++v19;
      }
      while (v17 != v19);
      uint64_t v35 = [v15 countByEnumeratingWithState:&v82 objects:v89 count:16];
      uint64_t v17 = v35;
    }
    while (v35);
  }

  LODWORD(v36) = 841731191;
  v37 = [NSNumber numberWithFloat:v36];
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v38 = v62;
  uint64_t v39 = [v38 countByEnumeratingWithState:&v78 objects:v88 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v79;
    do
    {
      for (uint64_t i = 0; i != v40; ++i)
      {
        if (*(void *)v79 != v41) {
          objc_enumerationMutation(v38);
        }
        uint64_t v43 = *(void *)(*((void *)&v78 + 1) + 8 * i);
        v44 = [v9 objectForKey:v43];

        if (!v44) {
          [v9 setObject:v37 forKey:v43];
        }
      }
      uint64_t v40 = [v38 countByEnumeratingWithState:&v78 objects:v88 count:16];
    }
    while (v40);
  }

  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  v45 = +[CACPreferences sharedPreferences];
  v46 = [v45 builtInCommandsTable];
  v47 = [v46 objectForKey:@"ExcludedSuggestedCommands"];

  uint64_t v48 = [v47 countByEnumeratingWithState:&v74 objects:v87 count:16];
  if (v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = *(void *)v75;
    do
    {
      for (uint64_t j = 0; j != v49; ++j)
      {
        if (*(void *)v75 != v50) {
          objc_enumerationMutation(v47);
        }
        [v9 removeObjectForKey:*(void *)(*((void *)&v74 + 1) + 8 * j)];
      }
      uint64_t v49 = [v47 countByEnumeratingWithState:&v74 objects:v87 count:16];
    }
    while (v49);
  }

  id v52 = objc_alloc(MEMORY[0x263EFF980]);
  v53 = [v9 allKeys];
  v54 = (void *)[v52 initWithArray:v53];

  v72[0] = MEMORY[0x263EF8330];
  v72[1] = 3221225472;
  v72[2] = __92__CACUserHintsManager_suggestedCommandIdentifiersFromActiveCommandIdentifiers_maximumCount___block_invoke;
  v72[3] = &unk_264D11A90;
  id v55 = v9;
  id v73 = v55;
  [v54 sortUsingComparator:v72];
  if ([v54 count] > (unint64_t)a4) {
    objc_msgSend(v54, "removeObjectsInRange:", a4, objc_msgSend(v54, "count") - a4);
  }
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v56 = v54;
  uint64_t v57 = [v56 countByEnumeratingWithState:&v68 objects:v86 count:16];
  if (v57)
  {
    uint64_t v58 = v57;
    uint64_t v59 = *(void *)v69;
    do
    {
      for (uint64_t k = 0; k != v58; ++k)
      {
        if (*(void *)v69 != v59) {
          objc_enumerationMutation(v56);
        }
        [(CACUserHintsManager *)self _countAfterRegisteringUserHintIdentifier:*(void *)(*((void *)&v68 + 1) + 8 * k)];
      }
      uint64_t v58 = [v56 countByEnumeratingWithState:&v68 objects:v86 count:16];
    }
    while (v58);
  }

  return v56;
}

uint64_t __92__CACUserHintsManager_suggestedCommandIdentifiersFromActiveCommandIdentifiers_maximumCount___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [v5 objectForKey:a2];
  [v7 floatValue];
  float v9 = v8;

  v10 = [*(id *)(a1 + 32) objectForKey:v6];

  [v10 floatValue];
  float v12 = v11;

  if (v9 <= v12) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = -1;
  }
  if (v9 < v12) {
    return 1;
  }
  else {
    return v13;
  }
}

- (unint64_t)_countAfterRegisteringUserHintIdentifier:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    v5 = +[CACPreferences sharedPreferences];
    id v6 = [v5 userHintsHistory];

    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    if (v7 > self->_lastPruneTime + 3481.0)
    {
      float v8 = objc_opt_new();
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      float v9 = [v6 allKeys];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v26 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            if ([v14 hasPrefix:@"System.PressItem_"]) {
              [v8 addObject:v14];
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v11);
      }

      if ((unint64_t)[v8 count] >= 0x29)
      {
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        v23[2] = __64__CACUserHintsManager__countAfterRegisteringUserHintIdentifier___block_invoke;
        v23[3] = &unk_264D11A90;
        id v15 = v6;
        id v24 = v15;
        [v8 sortUsingComparator:v23];
        uint64_t v16 = objc_msgSend(v8, "subarrayWithRange:", 0, 20);
        [v15 removeObjectsForKeys:v16];
      }
      [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
      self->_lastPruneTime = v17;
    }
    uint64_t v18 = [v6 objectForKey:v4];
    unint64_t v19 = [v18 unsignedLongLongValue] + 1;

    uint64_t v20 = [NSNumber numberWithUnsignedLongLong:v19];
    [v6 setObject:v20 forKey:v4];

    v21 = +[CACPreferences sharedPreferences];
    [v21 setUserHintsHistory:v6];
  }
  else
  {
    unint64_t v19 = 1;
  }

  return v19;
}

uint64_t __64__CACUserHintsManager__countAfterRegisteringUserHintIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  double v7 = [v5 objectForKey:a2];
  uint64_t v8 = [v7 integerValue];

  float v9 = [*(id *)(a1 + 32) objectForKey:v6];

  uint64_t v10 = [v9 integerValue];
  if (v8 < v10) {
    return -1;
  }
  else {
    return v8 > v10;
  }
}

- (void)clearHistory
{
  id v3 = +[CACPreferences sharedPreferences];
  v2 = [NSDictionary dictionary];
  [v3 setUserHintsHistory:v2];
}

@end