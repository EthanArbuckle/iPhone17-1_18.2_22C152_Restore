@interface PXStoryRecipeClipModuleProvider
- (PFStoryAutoEditConfiguration)configuration;
- (PXStoryRecipeClipModuleProvider)init;
- (PXStoryRecipeClipModuleProvider)initWithConfiguration:(id)a3;
- (id)_splitEmptySpaceInModules:(id)a3 maxEmptySpaceLength:(unint64_t)a4 momentClipRange:(_NSRange)a5 withClipCatalog:(id)a6;
- (id)computeRunsForModuleType:(int64_t)a3 momentClipRange:(_NSRange)a4 withClipCatalog:(id)a5 maxModuleLength:(unint64_t)a6;
- (id)mergeModulesFromRangesByModuleType:(id)a3 momentClipRange:(_NSRange)a4;
- (id)splitRanges:(id)a3 maxLength:(unint64_t)a4;
- (void)provideModulesForMomentClipRange:(_NSRange)a3 withClipCatalog:(id)a4 maxModuleLength:(unint64_t)a5 maxEmptySpaceLength:(unint64_t)a6 usingBlock:(id)a7;
@end

@implementation PXStoryRecipeClipModuleProvider

- (void).cxx_destruct
{
}

- (PFStoryAutoEditConfiguration)configuration
{
  return self->_configuration;
}

- (void)provideModulesForMomentClipRange:(_NSRange)a3 withClipCatalog:(id)a4 maxModuleLength:(unint64_t)a5 maxEmptySpaceLength:(unint64_t)a6 usingBlock:(id)a7
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a7;
  id v14 = v12;
  id v39 = v13;
  v15 = objc_opt_new();
  v16 = +[PXStorySettings sharedInstance];
  int v17 = [v16 autoEditUseMomentRecipes];

  if (v17) {
    uint64_t v18 = 4;
  }
  else {
    uint64_t v18 = 2;
  }
  v19 = &PXStoryAutoEditModuleTypes;
  do
  {
    uint64_t v20 = *v19++;
    v21 = -[PXStoryRecipeClipModuleProvider computeRunsForModuleType:momentClipRange:withClipCatalog:maxModuleLength:](self, "computeRunsForModuleType:momentClipRange:withClipCatalog:maxModuleLength:", v20, location, length, v14, a5);
    v22 = [(PXStoryRecipeClipModuleProvider *)self splitRanges:v21 maxLength:a5];
    [v15 addObject:v22];

    --v18;
  }
  while (v18);
  v23 = -[PXStoryRecipeClipModuleProvider mergeModulesFromRangesByModuleType:momentClipRange:](self, "mergeModulesFromRangesByModuleType:momentClipRange:", v15, location, length);
  unint64_t v24 = a6;
  v42 = v14;
  v25 = -[PXStoryRecipeClipModuleProvider _splitEmptySpaceInModules:maxEmptySpaceLength:momentClipRange:withClipCatalog:](self, "_splitEmptySpaceInModules:maxEmptySpaceLength:momentClipRange:withClipCatalog:", v23, v24, location, length, v14);
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __131__PXStoryRecipeClipModuleProvider_provideModulesForMomentClipRange_withClipCatalog_maxModuleLength_maxEmptySpaceLength_usingBlock___block_invoke;
  v47[3] = &unk_1E5DC4A30;
  id v26 = v39;
  id v48 = v26;
  v40 = v25;
  [v25 enumerateIndexesUsingBlock:v47];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v27 = v23;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v44 != v30) {
          objc_enumerationMutation(v27);
        }
        v32 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        uint64_t v33 = [v32 moduleType];
        unint64_t v34 = [v32 range];
        if (v34 < v34 + v35)
        {
          unint64_t v36 = v34;
          uint64_t v37 = v35;
          uint64_t v38 = 0;
          do
          {
            (*((void (**)(id, BOOL, uint64_t, void, unint64_t))v26 + 2))(v26, v38 == 0, v33, 0, v36 + v38);
            ++v38;
          }
          while (v37 != v38);
        }
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v29);
  }
}

uint64_t __131__PXStoryRecipeClipModuleProvider_provideModulesForMomentClipRange_withClipCatalog_maxModuleLength_maxEmptySpaceLength_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_splitEmptySpaceInModules:(id)a3 maxEmptySpaceLength:(unint64_t)a4 momentClipRange:(_NSRange)a5 withClipCatalog:(id)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  id v13 = objc_msgSend(MEMORY[0x1E4F28E60], "indexSetWithIndexesInRange:", location, length);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v14 = v11;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v34;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v34 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = [*(id *)(*((void *)&v33 + 1) + 8 * v18) range];
        objc_msgSend(v13, "removeIndexesInRange:", v19, v20);
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v16);
  }

  NSUInteger v21 = length - 1 + location;
  if (!__CFADD__(length - 1, location))
  {
    do
    {
      v22 = [v12 clipAtIndex:location];
      v23 = [v22 displayAssets];
      uint64_t v24 = [v23 count];

      if (v24 != 1 || (unint64_t)([v22 playbackStyle] - 2) <= 3) {
        [v13 removeIndex:location];
      }

      ++location;
    }
    while (location <= v21);
  }
  v25 = objc_opt_new();
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __113__PXStoryRecipeClipModuleProvider__splitEmptySpaceInModules_maxEmptySpaceLength_momentClipRange_withClipCatalog___block_invoke;
  v30[3] = &unk_1E5DB0CB0;
  unint64_t v32 = a4;
  v30[4] = self;
  id v26 = v25;
  id v31 = v26;
  [v13 enumerateRangesUsingBlock:v30];
  id v27 = v31;
  id v28 = v26;

  return v28;
}

void __113__PXStoryRecipeClipModuleProvider__splitEmptySpaceInModules_maxEmptySpaceLength_momentClipRange_withClipCatalog___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if (a3 > *(void *)(a1 + 48))
  {
    v5 = *(void **)(a1 + 32);
    v6 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a2, a3);
    v20[0] = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    v8 = [v5 splitRanges:v7 maxLength:*(void *)(a1 + 48)];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v13), "rangeValue", (void)v15);
          if (v14 != a2) {
            [*(id *)(a1 + 40) addIndex:v14];
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
}

- (id)mergeModulesFromRangesByModuleType:(id)a3 momentClipRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  if ([v6 count])
  {
    unint64_t v8 = 0;
    do
    {
      [v7 addObject:&unk_1F02D5C08];
      ++v8;
    }
    while (v8 < [v6 count]);
  }
  v54 = v7;
  v55 = objc_opt_new();
  NSUInteger v49 = location;
  NSUInteger v50 = location + length;
  v53 = v6;
  if ([v6 count])
  {
    uint64_t v9 = 0;
    do
    {
      uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v50];
      for (NSUInteger i = v50; i; --i)
        objc_msgSend(v10, "addObject:", &unk_1F02D5C08, v49);
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      uint64_t v51 = v9;
      uint64_t v12 = objc_msgSend(v53, "objectAtIndexedSubscript:", v9, v49);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v56 objects:v60 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v57;
        do
        {
          for (uint64_t j = 0; j != v14; ++j)
          {
            if (*(void *)v57 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = [*(id *)(*((void *)&v56 + 1) + 8 * j) rangeValue];
            if (v18)
            {
              uint64_t v19 = v17;
              uint64_t v20 = v18;
              do
              {
                NSUInteger v21 = [NSNumber numberWithUnsignedInteger:v20];
                [v10 setObject:v21 atIndexedSubscript:v19];

                ++v19;
                --v20;
              }
              while (v20);
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v56 objects:v60 count:16];
        }
        while (v14);
      }

      [v55 addObject:v10];
      id v6 = v53;
      uint64_t v9 = v51 + 1;
    }
    while (v51 + 1 < (unint64_t)[v53 count]);
  }
  v52 = objc_opt_new();
  NSUInteger v22 = v49;
  for (k = v54; v22 < v50; v22 += v25)
  {
    if ((unint64_t)objc_msgSend(v6, "count", v49) < 2)
    {
      unint64_t v25 = 0;
      uint64_t v24 = 0;
    }
    else
    {
      uint64_t v24 = 0;
      unint64_t v25 = 0;
      unint64_t v26 = -1;
      unint64_t v27 = 1;
      do
      {
        id v28 = [k objectAtIndexedSubscript:v27];
        unint64_t v29 = [v28 unsignedIntegerValue];

        uint64_t v30 = [v55 objectAtIndexedSubscript:v27];
        id v31 = [v30 objectAtIndexedSubscript:v22];
        NSUInteger v32 = v22;
        unint64_t v33 = [v31 integerValue];

        BOOL v35 = v29 < v26 || v33 > v25;
        BOOL v36 = !v35;
        if (v35) {
          unint64_t v37 = v33;
        }
        else {
          unint64_t v37 = v25;
        }
        if (v36) {
          unint64_t v38 = v26;
        }
        else {
          unint64_t v38 = v29;
        }
        if (v36) {
          unint64_t v39 = v24;
        }
        else {
          unint64_t v39 = v27;
        }
        if (v29 > v26)
        {
          unint64_t v37 = v25;
          unint64_t v38 = v26;
          unint64_t v39 = v24;
        }
        BOOL v40 = v33 >= 2;
        NSUInteger v22 = v32;
        k = v54;
        if (v40) {
          unint64_t v25 = v37;
        }
        if (v40) {
          unint64_t v26 = v38;
        }
        if (v40) {
          uint64_t v24 = v39;
        }
        ++v27;
      }
      while (v27 < [v53 count]);
    }
    uint64_t v41 = PXStoryAutoEditModuleTypes[v24];
    if (v41)
    {
      v42 = -[PXStoryAutoEditModule initWithModuleType:range:]([PXStoryAutoEditModule alloc], "initWithModuleType:range:", v41, v22, v25);
      [v52 addObject:v42];
      long long v43 = NSNumber;
      long long v44 = [k objectAtIndexedSubscript:v24];
      long long v45 = objc_msgSend(v43, "numberWithUnsignedInteger:", objc_msgSend(v44, "unsignedIntegerValue") + 1);
      [k setObject:v45 atIndexedSubscript:v24];
    }
    else
    {
      unint64_t v25 = 1;
    }
    id v6 = v53;
  }
  long long v46 = v6;
  v47 = objc_msgSend(v52, "copy", v49);

  return v47;
}

- (id)computeRunsForModuleType:(int64_t)a3 momentClipRange:(_NSRange)a4 withClipCatalog:(id)a5 maxModuleLength:(unint64_t)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  if (a3)
  {
    unint64_t v33 = objc_opt_new();
    unint64_t v11 = length - 1 + location;
    if (!__CFADD__(length - 1, location))
    {
      uint64_t v14 = 0;
      NSUInteger v35 = 0;
      *(void *)&long long v10 = 138412546;
      long long v32 = v10;
      NSUInteger v15 = location;
      NSUInteger v34 = location;
      while (1)
      {
        NSUInteger v16 = v15;
        if (v15 <= location)
        {
          BOOL v18 = 1;
        }
        else
        {
          uint64_t v17 = [v9 clipAtIndex:v15 - 1];
          BOOL v18 = !clipIsModuleType(v17, a3);
        }
        uint64_t v19 = objc_msgSend(v9, "clipAtIndex:", v15, v32);
        BOOL IsModuleType = clipIsModuleType(v19, a3);

        NSUInteger v15 = v16 + 1;
        if (v16 + 1 > v11) {
          break;
        }
        NSUInteger v22 = [v9 clipAtIndex:v16 + 1];
        BOOL v23 = clipIsModuleType(v22, a3);

        int v21 = v18 && IsModuleType && v23;
        if (v18 || !IsModuleType || !v23)
        {
          if (v14) {
            goto LABEL_20;
          }
          uint64_t v24 = 0;
          if (v21) {
            goto LABEL_25;
          }
        }
        else
        {
          uint64_t v24 = ++v14;
          if (v21) {
            goto LABEL_25;
          }
        }
LABEL_30:
        NSUInteger location = v34;
        if (v15 > v11) {
          goto LABEL_4;
        }
      }
      if (!v14) {
        goto LABEL_4;
      }
      LOBYTE(v21) = 0;
LABEL_20:
      unint64_t v25 = PLStoryGetLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        unint64_t v26 = @"??";
        if ((unint64_t)a3 <= 3) {
          unint64_t v26 = off_1E5DB4F20[a3];
        }
        unint64_t v27 = v26;
        *(_DWORD *)buf = v32;
        unint64_t v37 = v27;
        __int16 v38 = 1024;
        LODWORD(v39) = v14 + 1;
        _os_log_impl(&dword_1A9AE7000, v25, OS_LOG_TYPE_DEBUG, "%@ run ended after %d assets", buf, 0x12u);
      }
      id v28 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v35, v14 + 1);
      [v33 addObject:v28];

      uint64_t v24 = 0;
      uint64_t v14 = 0;
      if ((v21 & 1) == 0) {
        goto LABEL_30;
      }
LABEL_25:
      unint64_t v29 = PLStoryGetLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v30 = @"??";
        if ((unint64_t)a3 <= 3) {
          uint64_t v30 = off_1E5DB4F20[a3];
        }
        id v31 = v30;
        *(_DWORD *)buf = v32;
        unint64_t v37 = v31;
        __int16 v38 = 2048;
        NSUInteger v39 = v16;
        _os_log_impl(&dword_1A9AE7000, v29, OS_LOG_TYPE_DEBUG, "Starting a run of %@ assets at clip index %ld", buf, 0x16u);
      }
      uint64_t v14 = v24 + 1;
      NSUInteger v35 = v16;
      goto LABEL_30;
    }
LABEL_4:
    uint64_t v12 = (void *)[v33 copy];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v12;
}

- (id)splitRanges:(id)a3 maxLength:(unint64_t)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v25 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v25) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v10 = [v9 rangeValue];
        if (v11 <= a4)
        {
          [v5 addObject:v9];
        }
        else
        {
          unint64_t v12 = v11;
          double v13 = (double)v11;
          unint64_t v14 = vcvtpd_u64_f64((double)v11 / (double)a4);
          if (v14)
          {
            uint64_t v15 = v10;
            unint64_t v16 = 0;
            double v17 = (double)v14;
            do
            {
              unint64_t v18 = (unint64_t)((double)v16 / v17 * v13);
              if (!v16) {
                unint64_t v18 = 0;
              }
              unint64_t v19 = v16 + 1;
              if (v14 - 1 == v16) {
                unint64_t v20 = v12;
              }
              else {
                unint64_t v20 = (unint64_t)(((double)v16 + 1.0) / v17 * v13);
              }
              int v21 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v18 + v15, v20 - v18);
              [v5 addObject:v21];

              unint64_t v16 = v19;
            }
            while (v14 != v19);
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v7);
  }

  NSUInteger v22 = (void *)[v5 copy];
  return v22;
}

- (PXStoryRecipeClipModuleProvider)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryRecipeClipModuleProvider;
  uint64_t v6 = [(PXStoryRecipeClipModuleProvider *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_configuration, a3);
  }

  return v7;
}

- (PXStoryRecipeClipModuleProvider)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryRecipeClipModuleProvider.m", 36, @"%s is not available as initializer", "-[PXStoryRecipeClipModuleProvider init]");

  abort();
}

@end