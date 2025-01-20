@interface BLRetention
+ (id)retentionPolicyTypes;
+ (unint64_t)stripSequenceAtPath:(id)a3;
+ (void)applyCustomerPolicyForType:(id)a3 withSequenceDirs:(id)a4 withSize:(unint64_t *)a5;
+ (void)applyCustomerPolicyWithPath:(id)a3;
+ (void)applyPolicyForType:(id)a3 withSequenceDirs:(id)a4 withSize:(unint64_t *)a5;
+ (void)applyPolicyWithPath:(id)a3 sizeLimit:(unint64_t)a4 freeMissingSpace:(unint64_t)a5;
+ (void)applyPolicyWithPath:(id)a3 sizeLimit:(unint64_t)a4 freeSpaceLimit:(unint64_t)a5;
+ (void)initialize;
+ (void)limitSequenceDirs:(id)a3 withSize:(unint64_t *)a4;
+ (void)limitSequenceDirs:(id)a3 withSize:(unint64_t *)a4 removalMethod:(id)a5;
+ (void)limitSequenceDirs:(id)a3 withSize:(unint64_t *)a4 toCount:(unint64_t)a5 keepNewest:(BOOL)a6 removalMethod:(id)a7;
+ (void)limitSequenceDirs:(id)a3 withSize:(unint64_t *)a4 toCount:(unint64_t)a5 withReplaceInterval:(double)a6 removalMethod:(id)a7;
+ (void)removeItemAtPath:(id)a3;
+ (void)setPurgeableAtPath:(id)a3 directory:(BOOL)a4;
+ (void)setRetentionType:(id)a3 atPath:(id)a4;
@end

@implementation BLRetention

+ (void)initialize
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_222D7E000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Couldn't create OS Log for 'com.apple.BiometricKit.BioLog-Retention'!\n", v0, 2u);
}

+ (void)applyPolicyForType:(id)a3 withSequenceDirs:(id)a4 withSize:(unint64_t *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (([v8 isEqualToString:@"rp_none"] & 1) == 0
    && ([v8 isEqualToString:@"rp_enroll"] & 1) == 0)
  {
    if ([v8 isEqualToString:@"rp_noface"])
    {
      v10 = objc_opt_class();
      uint64_t v20 = MEMORY[0x263EF8330];
      uint64_t v21 = 3221225472;
      v22 = __60__BLRetention_applyPolicyForType_withSequenceDirs_withSize___block_invoke;
      v23 = &__block_descriptor_40_e17_Q16__0__NSArray_8l;
      id v24 = a1;
      v11 = &v20;
      id v12 = v9;
      v13 = a5;
      uint64_t v14 = 100;
    }
    else
    {
      if (![v8 isEqualToString:@"rp_nomatch"])
      {
        [v8 isEqualToString:@"rp_update"];
        goto LABEL_9;
      }
      v10 = objc_opt_class();
      uint64_t v15 = MEMORY[0x263EF8330];
      uint64_t v16 = 3221225472;
      v17 = __60__BLRetention_applyPolicyForType_withSequenceDirs_withSize___block_invoke_2;
      v18 = &__block_descriptor_40_e17_Q16__0__NSArray_8l;
      id v19 = a1;
      v11 = &v15;
      id v12 = v9;
      v13 = a5;
      uint64_t v14 = 40;
    }
    [v10 limitSequenceDirs:v12 withSize:v13 toCount:v14 keepNewest:1 removalMethod:v11, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24];
  }
LABEL_9:
}

uint64_t __60__BLRetention_applyPolicyForType_withSequenceDirs_withSize___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_opt_class();
  v4 = [v2 objectAtIndexedSubscript:0];
  [v3 removeItemAtPath:v4];

  v5 = [v2 objectAtIndexedSubscript:1];

  uint64_t v6 = [v5 unsignedIntegerValue];
  return v6;
}

uint64_t __60__BLRetention_applyPolicyForType_withSequenceDirs_withSize___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_opt_class();
  v4 = [v2 objectAtIndexedSubscript:0];
  uint64_t v5 = [v3 stripSequenceAtPath:v4];

  uint64_t v6 = objc_opt_class();
  v7 = [v2 objectAtIndexedSubscript:0];

  [v6 setRetentionType:@"rp_keep" atPath:v7];
  return v5;
}

+ (void)applyCustomerPolicyForType:(id)a3 withSequenceDirs:(id)a4 withSize:(unint64_t *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 isEqualToString:@"rp_enroll"])
  {
    v10 = objc_opt_class();
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __68__BLRetention_applyCustomerPolicyForType_withSequenceDirs_withSize___block_invoke;
    v32[3] = &__block_descriptor_40_e17_Q16__0__NSArray_8l;
    v32[4] = a1;
    v11 = v32;
    id v12 = v9;
    v13 = a5;
    uint64_t v14 = 3;
    uint64_t v15 = 1;
  }
  else
  {
    if (![v8 isEqualToString:@"rp_canceled"])
    {
      if ([v8 isEqualToString:@"rp_anyfailure"])
      {
        uint64_t v16 = objc_opt_class();
        uint64_t v26 = MEMORY[0x263EF8330];
        uint64_t v27 = 3221225472;
        v28 = __68__BLRetention_applyCustomerPolicyForType_withSequenceDirs_withSize___block_invoke_3;
        v29 = &__block_descriptor_40_e17_Q16__0__NSArray_8l;
        id v30 = a1;
        v17 = &v26;
        id v18 = v9;
        id v19 = a5;
        uint64_t v20 = 30;
      }
      else
      {
        if (![v8 isEqualToString:@"rp_anysuccess"]) {
          goto LABEL_11;
        }
        uint64_t v16 = objc_opt_class();
        uint64_t v21 = MEMORY[0x263EF8330];
        uint64_t v22 = 3221225472;
        v23 = __68__BLRetention_applyCustomerPolicyForType_withSequenceDirs_withSize___block_invoke_4;
        id v24 = &__block_descriptor_40_e17_Q16__0__NSArray_8l;
        id v25 = a1;
        v17 = &v21;
        id v18 = v9;
        id v19 = a5;
        uint64_t v20 = 10;
      }
      [v16 limitSequenceDirs:v18 withSize:v19 toCount:v20 withReplaceInterval:v17 removalMethod:14400.0 withReplaceInterval:v21 removalMethod:v22 removalMethod:v23 removalMethod:v24 removalMethod:v25 removalMethod:v26 removalMethod:v27 removalMethod:v28 removalMethod:v29 removalMethod:v30];
      goto LABEL_11;
    }
    v10 = objc_opt_class();
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __68__BLRetention_applyCustomerPolicyForType_withSequenceDirs_withSize___block_invoke_2;
    v31[3] = &__block_descriptor_40_e17_Q16__0__NSArray_8l;
    v31[4] = a1;
    v11 = v31;
    id v12 = v9;
    v13 = a5;
    uint64_t v14 = 10;
    uint64_t v15 = 0;
  }
  [v10 limitSequenceDirs:v12 withSize:v13 toCount:v14 keepNewest:v15 removalMethod:v11];
LABEL_11:
}

uint64_t __68__BLRetention_applyCustomerPolicyForType_withSequenceDirs_withSize___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_opt_class();
  v4 = [v2 objectAtIndexedSubscript:0];
  [v3 removeItemAtPath:v4];

  uint64_t v5 = [v2 objectAtIndexedSubscript:1];

  uint64_t v6 = [v5 unsignedIntegerValue];
  return v6;
}

uint64_t __68__BLRetention_applyCustomerPolicyForType_withSequenceDirs_withSize___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_opt_class();
  v4 = [v2 objectAtIndexedSubscript:0];
  uint64_t v5 = [v3 stripSequenceAtPath:v4];

  uint64_t v6 = objc_opt_class();
  v7 = [v2 objectAtIndexedSubscript:0];

  [v6 setRetentionType:@"rp_keep" atPath:v7];
  return v5;
}

uint64_t __68__BLRetention_applyCustomerPolicyForType_withSequenceDirs_withSize___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_opt_class();
  v4 = [v2 objectAtIndexedSubscript:0];
  uint64_t v5 = [v3 stripSequenceAtPath:v4];

  uint64_t v6 = objc_opt_class();
  v7 = [v2 objectAtIndexedSubscript:0];

  [v6 setRetentionType:@"rp_keep" atPath:v7];
  return v5;
}

uint64_t __68__BLRetention_applyCustomerPolicyForType_withSequenceDirs_withSize___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_opt_class();
  v4 = [v2 objectAtIndexedSubscript:0];
  uint64_t v5 = [v3 stripSequenceAtPath:v4];

  uint64_t v6 = objc_opt_class();
  v7 = [v2 objectAtIndexedSubscript:0];

  [v6 setRetentionType:@"rp_keep" atPath:v7];
  return v5;
}

+ (id)retentionPolicyTypes
{
  if (retentionPolicyTypes_onceToken != -1) {
    dispatch_once(&retentionPolicyTypes_onceToken, &__block_literal_global_2);
  }
  id v2 = (void *)retentionPolicyTypes_types;

  return v2;
}

void __35__BLRetention_retentionPolicyTypes__block_invoke()
{
  v0 = (void *)retentionPolicyTypes_types;
  retentionPolicyTypes_types = (uint64_t)&unk_26D5C1080;
}

+ (void)applyPolicyWithPath:(id)a3 sizeLimit:(unint64_t)a4 freeSpaceLimit:(unint64_t)a5
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (!applyPolicyWithPath_sizeLimit_freeSpaceLimit__oldBioLogExists) {
    goto LABEL_12;
  }
  id v9 = [MEMORY[0x263F08850] defaultManager];
  int v10 = [v9 fileExistsAtPath:@"/var/mobile/Library/Logs/BioLog"];
  applyPolicyWithPath_sizeLimit_freeSpaceLimit__oldBioLogExists = v10;

  if (!v10) {
    goto LABEL_12;
  }
  v11 = [MEMORY[0x263F08850] defaultManager];
  applyPolicyWithPath_sizeLimit_freeSpaceLimit__oldBioLogExists = [v11 removeItemAtPath:@"/var/mobile/Library/Logs/BioLog" error:0] ^ 1;

  int v12 = applyPolicyWithPath_sizeLimit_freeSpaceLimit__oldBioLogExists;
  if (__osLog_BioLog_Retention) {
    v13 = __osLog_BioLog_Retention;
  }
  else {
    v13 = MEMORY[0x263EF8438];
  }
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
  if (v12)
  {
    if (!v14) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 138412290;
    v41 = @"/var/mobile/Library/Logs/BioLog";
    uint64_t v15 = "%@ still exists!\n";
  }
  else
  {
    if (!v14) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 138412290;
    v41 = @"/var/mobile/Library/Logs/BioLog";
    uint64_t v15 = "%@ was successfuly removed!\n";
  }
  _os_log_impl(&dword_222D7E000, v13, OS_LOG_TYPE_ERROR, v15, buf, 0xCu);
LABEL_12:
  if (a4) {
    unint64_t v16 = a4;
  }
  else {
    unint64_t v16 = 5120;
  }
  if (a5) {
    unint64_t v17 = a5;
  }
  else {
    unint64_t v17 = 5120;
  }
  id v18 = &OBJC_IVAR___PearlCoreAnalyticsDailyTemplateMatchCountsEvent__identity0BaseTemplateFeatureCountType1;
  if (v17 > 1)
  {
    id v19 = [MEMORY[0x263F08850] defaultManager];
    id v39 = 0;
    uint64_t v20 = [v19 attributesOfFileSystemForPath:v8 error:&v39];
    id v21 = v39;

    uint64_t v22 = [v20 objectForKeyedSubscript:*MEMORY[0x263F080C8]];
    v23 = v22;
    if (v22)
    {
      id v37 = v21;
      id v38 = a1;
      unint64_t v24 = (unint64_t)[v22 unsignedIntegerValue] >> 20;
      id v25 = MEMORY[0x263EF8438];
      if (__osLog_BioLog_Retention) {
        uint64_t v26 = __osLog_BioLog_Retention;
      }
      else {
        uint64_t v26 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218752;
        v41 = (__CFString *)applyPolicyWithPath_sizeLimit_freeSpaceLimit__lastSizeLimit;
        __int16 v42 = 2048;
        unint64_t v43 = v16;
        __int16 v44 = 2048;
        unint64_t v45 = v17;
        __int16 v46 = 2048;
        unint64_t v47 = v24;
        _os_log_impl(&dword_222D7E000, v26, OS_LOG_TYPE_DEFAULT, "Retention policy lastSizeLimit:%lu, newSizeLimit:%lu, freeSpaceLimit:%lu, freeSpace:%lu\n", buf, 0x2Au);
      }
      uint64_t v27 = (__CFString *)(v24 - v17);
      if (v24 < v17)
      {
        unint64_t v28 = v17 - v24;
        if (applyPolicyWithPath_sizeLimit_freeSpaceLimit__lastSizeLimit >= v16)
        {
          if (v16 <= v28)
          {
LABEL_49:
            if (__osLog_BioLog_Retention) {
              v35 = __osLog_BioLog_Retention;
            }
            else {
              v35 = v25;
            }
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218496;
              v41 = (__CFString *)(v17 - v24);
              __int16 v42 = 2048;
              unint64_t v43 = v17;
              __int16 v44 = 1024;
              LODWORD(v45) = 500;
              _os_log_impl(&dword_222D7E000, v35, OS_LOG_TYPE_DEFAULT, "Missing disk space %luMB of free space limit %luMB under minimal log size %dMB, removing entire BioLog...\n", buf, 0x1Cu);
            }
            a1 = v38;
            [v38 removeItemAtPath:v8];
            unint64_t v16 = 0;
            goto LABEL_55;
          }
        }
        else
        {
          unint64_t v16 = applyPolicyWithPath_sizeLimit_freeSpaceLimit__lastSizeLimit;
          if (applyPolicyWithPath_sizeLimit_freeSpaceLimit__lastSizeLimit <= v28) {
            goto LABEL_49;
          }
        }
        v16 -= v28;
        if (v16 <= 0x1F3) {
          goto LABEL_49;
        }
        if (__osLog_BioLog_Retention) {
          v36 = __osLog_BioLog_Retention;
        }
        else {
          v36 = v25;
        }
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218496;
          v41 = (__CFString *)v24;
          __int16 v42 = 2048;
          unint64_t v43 = v17;
          __int16 v44 = 2048;
          unint64_t v45 = v16;
          _os_log_impl(&dword_222D7E000, v36, OS_LOG_TYPE_DEFAULT, "Free disk space %luMB under %luMB limit, new size limit %luMB.\n", buf, 0x20u);
        }
LABEL_46:
        a1 = v38;
LABEL_55:
        id v18 = &OBJC_IVAR___PearlCoreAnalyticsDailyTemplateMatchCountsEvent__identity0BaseTemplateFeatureCountType1;
        id v21 = v37;
        goto LABEL_56;
      }
      if (applyPolicyWithPath_sizeLimit_freeSpaceLimit__lastSizeLimit >= v16
        || (unint64_t v32 = (unint64_t)v27 + applyPolicyWithPath_sizeLimit_freeSpaceLimit__lastSizeLimit,
            v16 <= (unint64_t)v27 + applyPolicyWithPath_sizeLimit_freeSpaceLimit__lastSizeLimit))
      {
        unint64_t v28 = 0;
        goto LABEL_46;
      }
      if (__osLog_BioLog_Retention) {
        v33 = __osLog_BioLog_Retention;
      }
      else {
        v33 = v25;
      }
      BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
      if (v32 >= 0x1F5)
      {
        a1 = v38;
        if (v34)
        {
          *(_DWORD *)buf = 134218496;
          v41 = (__CFString *)v24;
          __int16 v42 = 2048;
          unint64_t v43 = v17;
          __int16 v44 = 2048;
          unint64_t v45 = v32;
          _os_log_impl(&dword_222D7E000, v33, OS_LOG_TYPE_DEFAULT, "Free disk space %luMB over %luMB limit, new size limit %luMB.\n", buf, 0x20u);
        }
        unint64_t v28 = 0;
        unint64_t v16 = v32;
        goto LABEL_55;
      }
      id v21 = v37;
      a1 = v38;
      if (v34)
      {
        *(_DWORD *)buf = 134218496;
        v41 = v27;
        __int16 v42 = 2048;
        unint64_t v43 = v17;
        __int16 v44 = 1024;
        LODWORD(v45) = 500;
        _os_log_impl(&dword_222D7E000, v33, OS_LOG_TYPE_DEFAULT, "Available disk space %luMB on top of free space limit %luMB under minimal log size %dMB, removing BioLog...\n", buf, 0x1Cu);
      }
      [v38 removeItemAtPath:v8];
      unint64_t v28 = 0;
      unint64_t v16 = 0;
      id v18 = &OBJC_IVAR___PearlCoreAnalyticsDailyTemplateMatchCountsEvent__identity0BaseTemplateFeatureCountType1;
    }
    else
    {
      if (__osLog_BioLog_Retention) {
        v29 = __osLog_BioLog_Retention;
      }
      else {
        v29 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        id v30 = v29;
        v31 = [v21 localizedDescription];
        *(_DWORD *)buf = 138412290;
        v41 = v31;
        _os_log_impl(&dword_222D7E000, v30, OS_LOG_TYPE_ERROR, "Warning: Could not get free disk space! Free space unrelated. %@\n", buf, 0xCu);
      }
      unint64_t v28 = 0;
    }
LABEL_56:

    *((void *)v18 + 479) = v16;
    if (!v16) {
      goto LABEL_59;
    }
    goto LABEL_57;
  }
  unint64_t v28 = 0;
  applyPolicyWithPath_sizeLimit_freeSpaceLimit__lastSizeLimit = v16;
LABEL_57:
  [a1 applyPolicyWithPath:v8 sizeLimit:v16 << 20 freeMissingSpace:v28 << 20];
  if (v28) {
    *((void *)v18 + 479) = (unint64_t)__retentionSizeLimit >> 20;
  }
LABEL_59:
}

+ (void)applyPolicyWithPath:(id)a3 sizeLimit:(unint64_t)a4 freeMissingSpace:(unint64_t)a5
{
  uint64_t v148 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (__osLog_BioLog_Retention) {
    id v8 = __osLog_BioLog_Retention;
  }
  else {
    id v8 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222D7E000, v8, OS_LOG_TYPE_DEFAULT, "Applying retention policy...\n", buf, 2u);
  }
  id v9 = [MEMORY[0x263EFF910] date];
  int v10 = [MEMORY[0x263EFF9A0] dictionary];
  v123 = [MEMORY[0x263EFF9A0] dictionary];
  unint64_t v136 = 0;
  __retentionSizeLimit = a4;
  id v11 = v7;
  int v12 = opendir((const char *)[v11 cStringUsingEncoding:1]);
  v13 = v12;
  if (!v12)
  {
    v61 = v123;
    goto LABEL_123;
  }
  BOOL v14 = readdir(v12);
  id v122 = a1;
  if (!v14)
  {
    unint64_t v120 = 0;
    unint64_t v16 = a5;
    goto LABEL_71;
  }
  uint64_t v15 = v14;
  unint64_t v120 = 0;
  unint64_t v16 = a5;
  do
  {
    if (v15->d_type != 4) {
      goto LABEL_13;
    }
    unint64_t v17 = (void *)MEMORY[0x223CA8CA0]();
    d_name = v15->d_name;
    if (!strcmp(d_name, ".") || !strcmp(d_name, "..")) {
      goto LABEL_12;
    }
    id v19 = [NSString stringWithCString:d_name encoding:1];
    uint64_t v20 = [v11 stringByAppendingPathComponent:v19];

    id v110 = v20;
    id v21 = opendir((const char *)[v110 cStringUsingEncoding:1]);
    if (!v21) {
      goto LABEL_68;
    }
    uint64_t v22 = v21;
    v23 = readdir(v21);
    if (!v23)
    {
      closedir(v22);
      goto LABEL_62;
    }
    uint64_t v106 = 0;
    while (1)
    {
      if (v23->d_type == 4)
      {
        unint64_t v24 = v23->d_name;
        if (strcmp(v23->d_name, "."))
        {
          if (strcmp(v24, ".."))
          {
            ++v106;
            if (strstr(v24, ".seq") || strstr(v24, ".evt")) {
              break;
            }
          }
        }
      }
LABEL_21:
      v23 = readdir(v22);
      if (!v23) {
        goto LABEL_61;
      }
    }
    context = (void *)MEMORY[0x223CA8CA0]();
    id v25 = [NSString stringWithUTF8String:v24];
    uint64_t v26 = [v110 stringByAppendingPathComponent:v25];

    uint64_t v27 = [MEMORY[0x263F08850] defaultManager];
    v105 = [v27 attributesOfItemAtPath:v26 error:0];

    __directorySize = 0;
    id v118 = v26;
    if (!ftw((const char *)[v118 cStringUsingEncoding:1], (int (__cdecl *)(const char *, const stat *, int))addDirectoryEntrySize, 1))
    {
      long long v134 = 0u;
      long long v135 = 0u;
      long long v132 = 0u;
      long long v133 = 0u;
      id obj = [(id)objc_opt_class() retentionPolicyTypes];
      uint64_t v28 = [obj countByEnumeratingWithState:&v132 objects:v147 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        id v111 = v11;
        v113 = v10;
        v115 = v9;
        uint64_t v30 = *(void *)v133;
        while (2)
        {
          for (uint64_t i = 0; i != v29; ++i)
          {
            if (*(void *)v133 != v30) {
              objc_enumerationMutation(obj);
            }
            unint64_t v32 = *(void **)(*((void *)&v132 + 1) + 8 * i);
            v33 = [v118 stringByAppendingPathComponent:v32];
            BOOL v34 = [MEMORY[0x263F08850] defaultManager];
            int v35 = [v34 fileExistsAtPath:v33];

            if (v35)
            {
              v36 = v32;

              goto LABEL_36;
            }
          }
          uint64_t v29 = [obj countByEnumeratingWithState:&v132 objects:v147 count:16];
          if (v29) {
            continue;
          }
          break;
        }
        v36 = @"rp_none";
LABEL_36:
        int v10 = v113;
        id v9 = v115;
        id v11 = v111;
      }
      else
      {
        v36 = @"rp_none";
      }

      id v37 = [v105 fileModificationDate];
      [v37 timeIntervalSinceNow];
      a1 = v122;
      v116 = v36;
      if (v38 <= -21600.0)
      {
      }
      else
      {
        char v39 = [(__CFString *)v36 isEqualToString:@"rp_keep"];

        if ((v39 & 1) == 0)
        {
          v146[0] = v118;
          v40 = &OBJC_IVAR___PearlCoreAnalyticsDailyTemplateMatchCountsEvent__identity0BaseTemplateFeatureCountType1;
          v114 = [NSNumber numberWithUnsignedInteger:__directorySize];
          v146[1] = v114;
          uint64_t v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v146 count:2];
          __int16 v42 = NSNumber;
          v112 = [v105 fileModificationDate];
          [v112 timeIntervalSince1970];
          unint64_t v43 = v42;
          __int16 v44 = (void *)v41;
          unint64_t v45 = [v43 numberWithDouble:x0];
          [v10 setObject:v44 forKeyedSubscript:v45];
LABEL_45:

          uint64_t v52 = *((void *)v40 + 503);
          v136 += v52;
          if (v136 > __retentionSizeLimit)
          {
            if (__osLog_BioLog_Retention) {
              v53 = __osLog_BioLog_Retention;
            }
            else {
              v53 = MEMORY[0x263EF8438];
            }
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
            {
              v54 = v53;
              v55 = [v123 objectForKeyedSubscript:@"rp_none"];
              uint64_t v56 = [v55 count];
              *(_DWORD *)buf = 134217984;
              unint64_t v139 = v56;
              _os_log_impl(&dword_222D7E000, v54, OS_LOG_TYPE_DEFAULT, "Limiting on the fly, count %lu ...\n", buf, 0xCu);
            }
            v57 = objc_opt_class();
            v58 = [v123 objectForKeyedSubscript:@"rp_none"];
            v131[0] = MEMORY[0x263EF8330];
            v131[1] = 3221225472;
            v131[2] = __62__BLRetention_applyPolicyWithPath_sizeLimit_freeMissingSpace___block_invoke;
            v131[3] = &__block_descriptor_40_e17_Q16__0__NSArray_8l;
            v131[4] = v122;
            [v57 limitSequenceDirs:v58 withSize:&v136 removalMethod:v131];
          }
          v120 += v52;

          unint64_t v16 = a5;
          goto LABEL_21;
        }
      }
      __int16 v46 = [v123 objectForKeyedSubscript:v36];

      if (v46)
      {
        v144[0] = v118;
        v114 = [NSNumber numberWithUnsignedInteger:__directorySize];
        v144[1] = v114;
        v144[2] = v36;
        id obja = [MEMORY[0x263EFF8C0] arrayWithObjects:v144 count:3];
        unint64_t v47 = [v123 objectForKeyedSubscript:v36];
        uint64_t v48 = NSNumber;
        unint64_t v45 = [v105 fileModificationDate];
        [v45 timeIntervalSince1970];
        v49 = [v48 numberWithDouble:x0];
        v112 = v47;
        [v47 setObject:obja forKeyedSubscript:v49];

        __int16 v44 = obja;
        v40 = &OBJC_IVAR___PearlCoreAnalyticsDailyTemplateMatchCountsEvent__identity0BaseTemplateFeatureCountType1;
      }
      else
      {
        v103 = (void *)MEMORY[0x263EFF9A0];
        v145[0] = v118;
        v114 = [NSNumber numberWithUnsignedInteger:__directorySize];
        v145[1] = v114;
        id objb = [MEMORY[0x263EFF8C0] arrayWithObjects:v145 count:2];
        v50 = NSNumber;
        v112 = [v105 fileModificationDate];
        [v112 timeIntervalSince1970];
        v40 = &OBJC_IVAR___PearlCoreAnalyticsDailyTemplateMatchCountsEvent__identity0BaseTemplateFeatureCountType1;
        unint64_t v45 = [v50 numberWithDouble:x0];
        v51 = [v103 dictionaryWithObject:objb forKey:v45];
        [v123 setObject:v51 forKeyedSubscript:v116];

        __int16 v44 = objb;
      }
      goto LABEL_45;
    }
    if (__osLog_BioLog_Retention) {
      v59 = __osLog_BioLog_Retention;
    }
    else {
      v59 = MEMORY[0x263EF8438];
    }
    unint64_t v16 = a5;
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v139 = (unint64_t)v118;
      _os_log_impl(&dword_222D7E000, v59, OS_LOG_TYPE_ERROR, "applyPolicyWithPath: Cannot count file sizes for sequence %@\n", buf, 0xCu);
    }

LABEL_61:
    closedir(v22);
    if (!v106)
    {
LABEL_62:
      if (__osLog_BioLog_Retention) {
        v60 = __osLog_BioLog_Retention;
      }
      else {
        v60 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v139 = (unint64_t)v110;
        _os_log_impl(&dword_222D7E000, v60, OS_LOG_TYPE_DEFAULT, "Removing empty log %@ ...\n", buf, 0xCu);
      }
      [(id)objc_opt_class() removeItemAtPath:v110];
    }
LABEL_68:

LABEL_12:
LABEL_13:
    uint64_t v15 = readdir(v13);
  }
  while (v15);
LABEL_71:
  closedir(v13);
  v13 = (DIR *)v120;
  v61 = v123;
  if (v120 - v136 < v16)
  {
    if (v120 <= v16 + 500)
    {
      __retentionSizeLimit = 0;
      if (__osLog_BioLog_Retention) {
        v63 = __osLog_BioLog_Retention;
      }
      else {
        v63 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        unint64_t v139 = v16 >> 20;
        __int16 v140 = 2048;
        *(void *)&double v141 = v120 - 500;
        _os_log_impl(&dword_222D7E000, v63, OS_LOG_TYPE_DEFAULT, "Missing disk space %luMB over removable log size %ldMB, removing BioLog...\n", buf, 0x16u);
      }
      [a1 removeItemAtPath:v11];
      unint64_t v136 = 0;
    }
    else
    {
      __retentionSizeLimit = v120 - v16;
      if (__osLog_BioLog_Retention) {
        v62 = __osLog_BioLog_Retention;
      }
      else {
        v62 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        unint64_t v139 = v136 >> 20;
        __int16 v140 = 2048;
        *(void *)&double v141 = v16 >> 20;
        __int16 v142 = 2048;
        unint64_t v143 = (unint64_t)__retentionSizeLimit >> 20;
        _os_log_impl(&dword_222D7E000, v62, OS_LOG_TYPE_DEFAULT, "Log size %luMB over free space limit by %luMB, new size limit %luMB\n", buf, 0x20u);
      }
    }
  }
  if (__retentionSizeLimit)
  {
    unint64_t v64 = __retentionSizeLimit;
    unint64_t v65 = __retentionSizeLimit / 0x4600000uLL;
    v66 = [v123 objectForKeyedSubscript:@"rp_keep"];
    unint64_t v67 = [v66 count];

    if (v67 > v65)
    {
      if (__osLog_BioLog_Retention) {
        v68 = __osLog_BioLog_Retention;
      }
      else {
        v68 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        v69 = v68;
        v70 = [v123 objectForKeyedSubscript:@"rp_keep"];
        double v71 = COERCE_DOUBLE([v70 count]);
        *(_DWORD *)buf = 136315650;
        unint64_t v139 = (unint64_t)"rp_keep";
        __int16 v140 = 2048;
        double v141 = v71;
        __int16 v142 = 2048;
        unint64_t v143 = v64 / 0x4600000;
        _os_log_impl(&dword_222D7E000, v69, OS_LOG_TYPE_DEFAULT, "Limiting %s, count %lu to %lu ...\n", buf, 0x20u);
      }
      v72 = objc_opt_class();
      v73 = [v123 objectForKeyedSubscript:@"rp_keep"];
      v130[0] = MEMORY[0x263EF8330];
      v130[1] = 3221225472;
      v130[2] = __62__BLRetention_applyPolicyWithPath_sizeLimit_freeMissingSpace___block_invoke_48;
      v130[3] = &__block_descriptor_40_e17_Q16__0__NSArray_8l;
      v130[4] = a1;
      [v72 limitSequenceDirs:v73 withSize:&v136 toCount:v64 / 0x4600000 keepNewest:1 removalMethod:v130];
    }
  }
  v74 = [MEMORY[0x263EFF9A0] dictionary];
  v75 = [v123 objectForKeyedSubscript:@"rp_noface"];

  if (v75)
  {
    v76 = [v123 objectForKeyedSubscript:@"rp_noface"];
    [v74 addEntriesFromDictionary:v76];
  }
  v77 = [v123 objectForKeyedSubscript:@"rp_keep"];

  if (v77)
  {
    v78 = [v123 objectForKeyedSubscript:@"rp_keep"];
    [v74 addEntriesFromDictionary:v78];
  }
  v79 = [v123 objectForKeyedSubscript:@"rp_nomatch"];

  if (v79)
  {
    v80 = [v123 objectForKeyedSubscript:@"rp_nomatch"];
    [v74 addEntriesFromDictionary:v80];
  }
  v81 = [v123 objectForKeyedSubscript:@"rp_matchfailure"];

  if (v81)
  {
    v82 = [v123 objectForKeyedSubscript:@"rp_matchfailure"];
    [v74 addEntriesFromDictionary:v82];
  }
  v83 = [v123 objectForKeyedSubscript:@"rp_passcode"];

  if (v83)
  {
    v84 = [v123 objectForKeyedSubscript:@"rp_passcode"];
    [v74 addEntriesFromDictionary:v84];
  }
  [v123 setObject:v74 forKeyedSubscript:@"rp_anyfailure"];
  [v123 removeObjectForKey:@"rp_noface"];
  [v123 removeObjectForKey:@"rp_keep"];
  [v123 removeObjectForKey:@"rp_nomatch"];
  [v123 removeObjectForKey:@"rp_matchfailure"];
  [v123 removeObjectForKey:@"rp_passcode"];
  if (v136 > __retentionSizeLimit)
  {
    v117 = v9;
    v119 = v74;
    long long v128 = 0u;
    long long v129 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    v85 = [(id)objc_opt_class() retentionPolicyTypes];
    uint64_t v86 = [v85 countByEnumeratingWithState:&v126 objects:v137 count:16];
    if (v86)
    {
      uint64_t v87 = v86;
      uint64_t v88 = *(void *)v127;
LABEL_105:
      uint64_t v89 = 0;
      while (1)
      {
        if (*(void *)v127 != v88) {
          objc_enumerationMutation(v85);
        }
        v90 = *(char **)(*((void *)&v126 + 1) + 8 * v89);
        if (__osLog_BioLog_Retention) {
          v91 = __osLog_BioLog_Retention;
        }
        else {
          v91 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
        {
          v92 = v91;
          v93 = [v123 objectForKeyedSubscript:v90];
          double v94 = COERCE_DOUBLE([v93 count]);
          *(_DWORD *)buf = 138412546;
          unint64_t v139 = (unint64_t)v90;
          __int16 v140 = 2048;
          double v141 = v94;
          _os_log_impl(&dword_222D7E000, v92, OS_LOG_TYPE_DEFAULT, "Limiting %@, count %lu ...\n", buf, 0x16u);
        }
        int v95 = [v90 isEqualToString:@"rp_anyfailure"];
        v96 = objc_opt_class();
        v97 = [v123 objectForKeyedSubscript:v90];
        if (v95)
        {
          [v96 limitSequenceDirs:v97 withSize:&v136];
        }
        else
        {
          v125[0] = MEMORY[0x263EF8330];
          v125[1] = 3221225472;
          v125[2] = __62__BLRetention_applyPolicyWithPath_sizeLimit_freeMissingSpace___block_invoke_49;
          v125[3] = &__block_descriptor_40_e17_Q16__0__NSArray_8l;
          v125[4] = v122;
          [v96 limitSequenceDirs:v97 withSize:&v136 removalMethod:v125];
        }

        if (v136 < __retentionSizeLimit) {
          break;
        }
        if (v87 == ++v89)
        {
          uint64_t v87 = [v85 countByEnumeratingWithState:&v126 objects:v137 count:16];
          if (v87) {
            goto LABEL_105;
          }
          break;
        }
      }
    }

    id v9 = v117;
    a1 = v122;
    v61 = v123;
    v74 = v119;
    v13 = (DIR *)v120;
  }
  if (v136 > __retentionSizeLimit)
  {
    v98 = objc_opt_class();
    v124[0] = MEMORY[0x263EF8330];
    v124[1] = 3221225472;
    v124[2] = __62__BLRetention_applyPolicyWithPath_sizeLimit_freeMissingSpace___block_invoke_2;
    v124[3] = &__block_descriptor_40_e17_Q16__0__NSArray_8l;
    v124[4] = a1;
    [v98 limitSequenceDirs:v10 withSize:&v136 removalMethod:v124];
  }

LABEL_123:
  if (__osLog_BioLog_Retention) {
    v99 = __osLog_BioLog_Retention;
  }
  else {
    v99 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
  {
    double v100 = (double)((unint64_t)v13 - v136) * 0.000000953674316;
    v101 = v99;
    [v9 timeIntervalSinceNow];
    *(_DWORD *)buf = 134218496;
    unint64_t v139 = *(void *)&v100;
    __int16 v140 = 2048;
    double v141 = -v102;
    __int16 v142 = 2048;
    unint64_t v143 = v136 >> 20;
    _os_log_impl(&dword_222D7E000, v101, OS_LOG_TYPE_DEFAULT, "Retention policy removed %.3fMB in %fs, resulting size %luMB\n", buf, 0x20u);
  }
}

uint64_t __62__BLRetention_applyPolicyWithPath_sizeLimit_freeMissingSpace___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_opt_class();
  v4 = [v2 objectAtIndexedSubscript:0];
  uint64_t v5 = [v3 stripSequenceAtPath:v4];

  uint64_t v6 = objc_opt_class();
  id v7 = [v2 objectAtIndexedSubscript:0];

  [v6 setRetentionType:@"rp_keep" atPath:v7];
  return v5;
}

uint64_t __62__BLRetention_applyPolicyWithPath_sizeLimit_freeMissingSpace___block_invoke_48(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_opt_class();
  v4 = [v2 objectAtIndexedSubscript:0];
  [v3 removeItemAtPath:v4];

  uint64_t v5 = [v2 objectAtIndexedSubscript:1];

  uint64_t v6 = [v5 unsignedIntegerValue];
  return v6;
}

uint64_t __62__BLRetention_applyPolicyWithPath_sizeLimit_freeMissingSpace___block_invoke_49(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_opt_class();
  v4 = [v2 objectAtIndexedSubscript:0];
  uint64_t v5 = [v3 stripSequenceAtPath:v4];

  uint64_t v6 = objc_opt_class();
  id v7 = [v2 objectAtIndexedSubscript:0];

  [v6 setRetentionType:@"rp_keep" atPath:v7];
  return v5;
}

uint64_t __62__BLRetention_applyPolicyWithPath_sizeLimit_freeMissingSpace___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_opt_class();
  v4 = [v2 objectAtIndexedSubscript:0];
  uint64_t v5 = [v3 stripSequenceAtPath:v4];

  uint64_t v6 = objc_opt_class();
  id v7 = [v2 objectAtIndexedSubscript:0];

  [v6 setRetentionType:@"rp_keep" atPath:v7];
  return v5;
}

+ (void)applyCustomerPolicyWithPath:(id)a3
{
  uint64_t v107 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = &OBJC_METACLASS___BiometricKitXPCServerPearl;
  uint64_t v5 = MEMORY[0x263EF8438];
  if (__osLog_BioLog_Retention) {
    uint64_t v6 = __osLog_BioLog_Retention;
  }
  else {
    uint64_t v6 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222D7E000, v6, OS_LOG_TYPE_DEFAULT, "Applying customer retention policy...\n", buf, 2u);
  }
  id v7 = [MEMORY[0x263EFF910] date];
  unint64_t v8 = 0x263EFF000uLL;
  id v9 = [MEMORY[0x263EFF9A0] dictionary];
  unint64_t v96 = 0;
  id v10 = v3;
  id v11 = opendir((const char *)[v10 cStringUsingEncoding:1]);
  if (!v11)
  {
    uint64_t v44 = 0;
    goto LABEL_81;
  }
  int v12 = v11;
  v85 = v7;
  v13 = readdir(v11);
  id v86 = v10;
  if (!v13)
  {
    uint64_t v87 = 0;
    goto LABEL_54;
  }
  uint64_t v87 = 0;
  do
  {
    if (v13->d_type != 4) {
      goto LABEL_12;
    }
    d_name = v13->d_name;
    if (!strcmp(v13->d_name, ".") || !strcmp(d_name, "..")) {
      goto LABEL_12;
    }
    uint64_t v15 = [NSString stringWithCString:d_name encoding:1];
    unint64_t v16 = [v10 stringByAppendingPathComponent:v15];

    id v77 = v16;
    unint64_t v17 = opendir((const char *)[v77 cStringUsingEncoding:1]);
    if (!v17) {
      goto LABEL_51;
    }
    id v18 = v17;
    id v19 = readdir(v17);
    if (!v19) {
      goto LABEL_50;
    }
    while (1)
    {
      while (v19->d_type != 4)
      {
LABEL_41:
        id v19 = readdir(v18);
        if (!v19) {
          goto LABEL_50;
        }
      }
      uint64_t v20 = v18;
      id v21 = v19->d_name;
      if (strcmp(v19->d_name, "."))
      {
        if (strcmp(v21, "..")) {
          break;
        }
      }
      id v18 = v20;
      id v19 = readdir(v20);
      if (!v19) {
        goto LABEL_50;
      }
    }
    if (!strstr(v21, ".seq") && !strstr(v21, ".evt")) {
      goto LABEL_40;
    }
    uint64_t v22 = [NSString stringWithUTF8String:v21];
    v23 = [v77 stringByAppendingPathComponent:v22];

    unint64_t v24 = [MEMORY[0x263F08850] defaultManager];
    v76 = [v24 attributesOfItemAtPath:v23 error:0];

    __directorySize = 0;
    id v25 = v23;
    if (!ftw((const char *)[v25 cStringUsingEncoding:1], (int (__cdecl *)(const char *, const stat *, int))addDirectoryEntrySize, 1))
    {
      long long v94 = 0u;
      long long v95 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      id obj = [(id)objc_opt_class() retentionPolicyTypes];
      uint64_t v82 = [obj countByEnumeratingWithState:&v92 objects:v106 count:16];
      if (v82)
      {
        uint64_t v80 = *(void *)v93;
        while (2)
        {
          for (uint64_t i = 0; i != v82; ++i)
          {
            if (*(void *)v93 != v80) {
              objc_enumerationMutation(obj);
            }
            uint64_t v27 = *(void **)(*((void *)&v92 + 1) + 8 * i);
            id v28 = v25;
            uint64_t v29 = [v25 stringByAppendingPathComponent:v27];
            uint64_t v30 = [MEMORY[0x263F08850] defaultManager];
            int v31 = [v30 fileExistsAtPath:v29];

            if (v31)
            {
              v83 = v27;

              goto LABEL_34;
            }

            id v25 = v28;
          }
          uint64_t v82 = [obj countByEnumeratingWithState:&v92 objects:v106 count:16];
          if (v82) {
            continue;
          }
          break;
        }
        v83 = @"rp_none";
LABEL_34:
        id v10 = v86;
        v4 = &OBJC_METACLASS___BiometricKitXPCServerPearl;
        uint64_t v5 = MEMORY[0x263EF8438];
        unint64_t v8 = 0x263EFF000;
      }
      else
      {
        id v28 = v25;
        v83 = @"rp_none";
      }

      unint64_t v32 = [v9 objectForKeyedSubscript:v83];

      v75 = v28;
      if (v32)
      {
        v104[0] = v28;
        id obja = [NSNumber numberWithUnsignedInteger:__directorySize];
        v104[1] = obja;
        v104[2] = v83;
        uint64_t v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v104 count:3];
        v81 = [v9 objectForKeyedSubscript:v83];
        BOOL v34 = NSNumber;
        int v35 = [v76 fileModificationDate];
        [v35 timeIntervalSince1970];
        [v34 numberWithDouble:];
        v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
        id v37 = v81;
        v74 = (void *)v33;
        double v38 = (void *)v33;
        char v39 = v36;
      }
      else
      {
        v40 = *(void **)(v8 + 2464);
        v105[0] = v28;
        id obja = [NSNumber numberWithUnsignedInteger:__directorySize];
        v105[1] = obja;
        uint64_t v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v105 count:2];
        __int16 v42 = NSNumber;
        v81 = [v76 fileModificationDate];
        [v81 timeIntervalSince1970];
        int v35 = [v42 numberWithDouble:];
        v74 = (void *)v41;
        v36 = [v40 dictionaryWithObject:v41 forKey:v35];
        id v37 = v9;
        double v38 = v36;
        char v39 = v83;
      }
      [v37 setObject:v38 forKeyedSubscript:v39];

      v96 += __directorySize;
      v87 += __directorySize;

      unint64_t v8 = 0x263EFF000;
LABEL_40:
      id v18 = v20;
      goto LABEL_41;
    }
    if (v4[9].isa) {
      isa = v4[9].isa;
    }
    else {
      isa = v5;
    }
    if (os_log_type_enabled(isa, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      double v98 = *(double *)&v25;
      _os_log_impl(&dword_222D7E000, isa, OS_LOG_TYPE_ERROR, "applyPolicyWithPath: Cannot count file sizes for sequence %@\n", buf, 0xCu);
    }

    id v18 = v20;
LABEL_50:
    closedir(v18);
LABEL_51:

LABEL_12:
    v13 = readdir(v12);
  }
  while (v13);
LABEL_54:
  closedir(v12);
  unint64_t v45 = [*(id *)(v8 + 2464) dictionary];
  __int16 v46 = [v9 objectForKeyedSubscript:@"rp_noface"];

  if (v46)
  {
    unint64_t v47 = [v9 objectForKeyedSubscript:@"rp_noface"];
    [v45 addEntriesFromDictionary:v47];
  }
  uint64_t v48 = [v9 objectForKeyedSubscript:@"rp_nomatch"];

  if (v48)
  {
    v49 = [v9 objectForKeyedSubscript:@"rp_nomatch"];
    [v45 addEntriesFromDictionary:v49];
  }
  v50 = [v9 objectForKeyedSubscript:@"rp_matchfailure"];

  if (v50)
  {
    v51 = [v9 objectForKeyedSubscript:@"rp_matchfailure"];
    [v45 addEntriesFromDictionary:v51];
  }
  [v9 setObject:v45 forKeyedSubscript:@"rp_anyfailure"];
  [v9 removeObjectForKey:@"rp_noface"];
  [v9 removeObjectForKey:@"rp_nomatch"];
  [v9 removeObjectForKey:@"rp_matchfailure"];
  uint64_t v52 = [*(id *)(v8 + 2464) dictionary];
  v53 = [v9 objectForKeyedSubscript:@"rp_none"];

  if (v53)
  {
    v54 = [v9 objectForKeyedSubscript:@"rp_none"];
    [v52 addEntriesFromDictionary:v54];
  }
  v84 = v45;
  v55 = [v9 objectForKeyedSubscript:@"rp_update"];

  if (v55)
  {
    uint64_t v56 = [v9 objectForKeyedSubscript:@"rp_update"];
    [v52 addEntriesFromDictionary:v56];
  }
  [v9 setObject:v52 forKeyedSubscript:@"rp_anysuccess"];
  [v9 removeObjectForKey:@"rp_none"];
  [v9 removeObjectForKey:@"rp_update"];
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  v57 = [(id)objc_opt_class() retentionPolicyTypes];
  uint64_t v58 = [v57 countByEnumeratingWithState:&v88 objects:v103 count:16];
  if (v58)
  {
    uint64_t v59 = v58;
    uint64_t v60 = *(void *)v89;
    do
    {
      for (uint64_t j = 0; j != v59; ++j)
      {
        if (*(void *)v89 != v60) {
          objc_enumerationMutation(v57);
        }
        uint64_t v62 = *(void *)(*((void *)&v88 + 1) + 8 * j);
        v63 = objc_opt_class();
        unint64_t v64 = [v9 objectForKeyedSubscript:v62];
        [v63 applyCustomerPolicyForType:v62 withSequenceDirs:v64 withSize:&v96];
      }
      uint64_t v59 = [v57 countByEnumeratingWithState:&v88 objects:v103 count:16];
    }
    while (v59);
  }

  unint64_t v65 = [v9 objectForKeyedSubscript:@"rp_anyfailure"];
  if ((unint64_t)[v65 count] <= 0x1D)
  {

    id v10 = v86;
    uint64_t v44 = v87;
    uint64_t v5 = MEMORY[0x263EF8438];
  }
  else
  {
    v66 = [v9 objectForKeyedSubscript:@"rp_anysuccess"];
    unint64_t v67 = [v66 count];

    BOOL v68 = v67 >= 0xA;
    id v10 = v86;
    uint64_t v44 = v87;
    uint64_t v5 = MEMORY[0x263EF8438];
    if (v68)
    {
      v69 = (__osLog_BioLog_Retention ? __osLog_BioLog_Retention : MEMORY[0x263EF8438]);
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222D7E000, v69, OS_LOG_TYPE_DEFAULT, "Customer retention fullfilled! Turn customer logging off for some time?\n", buf, 2u);
      }
    }
  }

  id v7 = v85;
LABEL_81:
  if (__osLog_BioLog_Retention) {
    v70 = __osLog_BioLog_Retention;
  }
  else {
    v70 = v5;
  }
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    double v71 = (double)(v44 - v96) * 0.000000953674316;
    v72 = v70;
    [v7 timeIntervalSinceNow];
    *(_DWORD *)buf = 134218496;
    double v98 = v71;
    __int16 v99 = 2048;
    double v100 = -v73;
    __int16 v101 = 2048;
    unint64_t v102 = v96 >> 20;
    _os_log_impl(&dword_222D7E000, v72, OS_LOG_TYPE_DEFAULT, "Customer retention policy removed %.3fMB in %fs, resulting size %luMB\n", buf, 0x20u);
  }
}

+ (void)limitSequenceDirs:(id)a3 withSize:(unint64_t *)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  unint64_t v8 = &OBJC_IVAR___PearlCoreAnalyticsDailyTemplateMatchCountsEvent__identity0BaseTemplateFeatureCountType1;
  if (*a4 > __retentionSizeLimit)
  {
    id v9 = sel_compare_;
    *(void *)&long long v7 = 138412546;
    long long v28 = v7;
    uint64_t v29 = a4;
    do
    {
      if (!objc_msgSend(v6, "count", v28)) {
        break;
      }
      id v10 = [v6 allKeys];
      id v11 = [v10 sortedArrayUsingSelector:v9];
      int v12 = [v11 firstObject];

      v13 = (__osLog_BioLog_Retention ? __osLog_BioLog_Retention : MEMORY[0x263EF8438]);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v14 = v13;
        uint64_t v15 = [v6 objectForKeyedSubscript:v12];
        [v15 objectAtIndexedSubscript:0];
        unint64_t v16 = v9;
        id v17 = a1;
        id v19 = v18 = v8;
        uint64_t v20 = [v6 objectForKeyedSubscript:v12];
        id v21 = [v20 objectAtIndexedSubscript:1];
        unint64_t v22 = [v21 unsignedIntegerValue];
        *(_DWORD *)buf = v28;
        int v31 = v19;
        __int16 v32 = 2048;
        double v33 = (double)v22 * 0.000000953674316;
        _os_log_impl(&dword_222D7E000, v14, OS_LOG_TYPE_DEFAULT, "Sequences exceeded limit size, removing %@ of size %.3fMB ...\n", buf, 0x16u);

        unint64_t v8 = v18;
        a1 = v17;
        id v9 = v16;
        a4 = v29;
      }
      v23 = objc_opt_class();
      unint64_t v24 = [v6 objectForKeyedSubscript:v12];
      id v25 = [v24 objectAtIndexedSubscript:0];
      [v23 removeItemAtPath:v25];

      uint64_t v26 = [v6 objectForKeyedSubscript:v12];
      uint64_t v27 = [v26 objectAtIndexedSubscript:1];
      *a4 -= [v27 unsignedLongValue];

      [v6 removeObjectForKey:v12];
    }
    while (*a4 > *((void *)v8 + 504));
  }
}

+ (void)limitSequenceDirs:(id)a3 withSize:(unint64_t *)a4 removalMethod:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  id v10 = (uint64_t (**)(void, void))v8;
  id v11 = &OBJC_IVAR___PearlCoreAnalyticsDailyTemplateMatchCountsEvent__identity0BaseTemplateFeatureCountType1;
  if (*a4 > __retentionSizeLimit)
  {
    int v12 = sel_compare_;
    *(void *)&long long v9 = 138412546;
    long long v27 = v9;
    long long v28 = (uint64_t (**)(void, void))v8;
    do
    {
      if (!objc_msgSend(v7, "count", v27)) {
        break;
      }
      v13 = [v7 allKeys];
      BOOL v14 = [v13 sortedArrayUsingSelector:v12];
      uint64_t v15 = [v14 firstObject];

      unint64_t v16 = (__osLog_BioLog_Retention ? __osLog_BioLog_Retention : MEMORY[0x263EF8438]);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = v16;
        id v18 = [v7 objectForKeyedSubscript:v15];
        [v18 objectAtIndexedSubscript:0];
        id v19 = v12;
        v21 = uint64_t v20 = v11;
        unint64_t v22 = [v7 objectForKeyedSubscript:v15];
        v23 = [v22 objectAtIndexedSubscript:1];
        unint64_t v24 = [v23 unsignedIntegerValue];
        *(_DWORD *)buf = v27;
        uint64_t v30 = v21;
        __int16 v31 = 2048;
        double v32 = (double)v24 * 0.000000953674316;
        _os_log_impl(&dword_222D7E000, v17, OS_LOG_TYPE_DEFAULT, "Sequences exceeded limit size, processing %@ of size %.3fMB ...\n", buf, 0x16u);

        id v11 = v20;
        int v12 = v19;
        id v10 = v28;
      }
      id v25 = [v7 objectForKeyedSubscript:v15];
      uint64_t v26 = ((uint64_t (**)(void, void *))v10)[2](v10, v25);

      *a4 -= v26;
      [v7 removeObjectForKey:v15];
    }
    while (*a4 > *((void *)v11 + 504));
  }
}

+ (void)limitSequenceDirs:(id)a3 withSize:(unint64_t *)a4 toCount:(unint64_t)a5 keepNewest:(BOOL)a6 removalMethod:(id)a7
{
  BOOL v8 = a6;
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v11 = a3;
  int v12 = (uint64_t (**)(id, void *))a7;
  unint64_t v32 = a5;
  if ([v11 count] > a5)
  {
    *(void *)&long long v13 = 134218498;
    long long v30 = v13;
    __int16 v31 = v12;
    do
    {
      BOOL v14 = [v11 allKeys:v30];
      uint64_t v15 = [v14 sortedArrayUsingSelector:sel_compare_];

      if (!v8)
      {
        unint64_t v16 = [v15 reverseObjectEnumerator];
        uint64_t v17 = [v16 allObjects];

        uint64_t v15 = (void *)v17;
      }
      id v18 = [v15 firstObject];
      if (__osLog_BioLog_Retention) {
        id v19 = __osLog_BioLog_Retention;
      }
      else {
        id v19 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = v19;
        id v21 = [v11 objectForKeyedSubscript:v18];
        unint64_t v22 = [v21 objectAtIndexedSubscript:0];
        [v11 objectForKeyedSubscript:v18];
        v23 = a4;
        v25 = BOOL v24 = v8;
        uint64_t v26 = [v25 objectAtIndexedSubscript:1];
        unint64_t v27 = [v26 unsignedIntegerValue];
        *(_DWORD *)buf = v30;
        unint64_t v34 = v32;
        __int16 v35 = 2112;
        v36 = v22;
        __int16 v37 = 2048;
        double v38 = (double)v27 * 0.000000953674316;
        _os_log_impl(&dword_222D7E000, v20, OS_LOG_TYPE_DEFAULT, "Sequences exceeded limit count %lu, processing %@ of size %.3fMB...\n", buf, 0x20u);

        BOOL v8 = v24;
        a4 = v23;
        int v12 = v31;
      }
      long long v28 = [v11 objectForKeyedSubscript:v18];
      uint64_t v29 = v12[2](v12, v28);

      *a4 -= v29;
      [v11 removeObjectForKey:v18];
    }
    while ([v11 count] > v32);
  }
}

+ (void)limitSequenceDirs:(id)a3 withSize:(unint64_t *)a4 toCount:(unint64_t)a5 withReplaceInterval:(double)a6 removalMethod:(id)a7
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v11 = a3;
  int v12 = (uint64_t (**)(id, void *))a7;
  unint64_t v37 = a5;
  if ([v11 count] > a5)
  {
    *(void *)&long long v13 = 134218498;
    long long v34 = v13;
    __int16 v35 = a4;
    do
    {
      BOOL v14 = [v11 allKeys:v34];
      uint64_t v15 = [v14 sortedArrayUsingSelector:sel_compare_];

      unint64_t v16 = [v15 firstObject];
      uint64_t v17 = [v15 reverseObjectEnumerator];
      id v18 = [v17 allObjects];
      id v19 = [v18 firstObject];

      [v16 floatValue];
      double v21 = v20;
      [v19 floatValue];
      if (v22 - a6 >= v21) {
        v23 = v16;
      }
      else {
        v23 = v19;
      }
      id v24 = v23;
      if (__osLog_BioLog_Retention) {
        id v25 = __osLog_BioLog_Retention;
      }
      else {
        id v25 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v26 = v25;
        v36 = [v11 objectForKeyedSubscript:v24];
        unint64_t v27 = [v36 objectAtIndexedSubscript:0];
        long long v28 = [v11 objectForKeyedSubscript:v24];
        [v28 objectAtIndexedSubscript:1];
        long long v30 = v29 = v12;
        unint64_t v31 = [v30 unsignedIntegerValue];
        *(_DWORD *)buf = v34;
        unint64_t v39 = v37;
        __int16 v40 = 2112;
        uint64_t v41 = v27;
        __int16 v42 = 2048;
        double v43 = (double)v31 * 0.000000953674316;
        _os_log_impl(&dword_222D7E000, v26, OS_LOG_TYPE_DEBUG, "Sequences exceeded limit count %lu, processing %@ of size %.3fMB...\n", buf, 0x20u);

        int v12 = v29;
        a4 = v35;
      }
      unint64_t v32 = [v11 objectForKeyedSubscript:v24];
      uint64_t v33 = v12[2](v12, v32);

      *a4 -= v33;
      [v11 removeObjectForKey:v24];
    }
    while ([v11 count] > v37);
  }
}

+ (void)removeItemAtPath:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263F08850] defaultManager];
  id v10 = 0;
  char v5 = [v4 removeItemAtPath:v3 error:&v10];
  id v6 = v10;

  if ((v5 & 1) == 0)
  {
    if (__osLog_BioLog_Retention) {
      id v7 = __osLog_BioLog_Retention;
    }
    else {
      id v7 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      BOOL v8 = v7;
      long long v9 = [v6 localizedFailureReason];
      *(_DWORD *)buf = 138412546;
      id v12 = v3;
      __int16 v13 = 2112;
      BOOL v14 = v9;
      _os_log_impl(&dword_222D7E000, v8, OS_LOG_TYPE_ERROR, "Warning: Could not remove item %@! %@\n", buf, 0x16u);
    }
  }
}

+ (unint64_t)stripSequenceAtPath:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263F08850] defaultManager];
  id v41 = 0;
  char v5 = [v4 contentsOfDirectoryAtPath:v3 error:&v41];
  id v6 = v41;

  if ([v5 count])
  {
    id v32 = v6;
    uint64_t v33 = v5;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v37 objects:v46 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      unint64_t v36 = 0;
      id v10 = @".";
      uint64_t v11 = *(void *)v38;
      uint64_t v35 = *(void *)v38;
      do
      {
        uint64_t v12 = 0;
        uint64_t v34 = v9;
        do
        {
          if (*(void *)v38 != v11) {
            objc_enumerationMutation(v7);
          }
          __int16 v13 = *(void **)(*((void *)&v37 + 1) + 8 * v12);
          BOOL v14 = (void *)MEMORY[0x223CA8CA0]();
          uint64_t v15 = [v13 pathExtension];
          unint64_t v16 = [(__CFString *)v10 stringByAppendingString:v15];

          uint64_t v17 = [v3 stringByAppendingPathComponent:v13];
          if (([v16 isEqualToString:@".json"] & 1) == 0
            && ([v16 isEqualToString:@".prle"] & 1) == 0)
          {
            id v18 = v10;
            id v19 = v7;
            id v20 = v3;
            if (__osLog_BioLog_Retention) {
              double v21 = __osLog_BioLog_Retention;
            }
            else {
              double v21 = MEMORY[0x263EF8438];
            }
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              id v43 = v17;
              _os_log_impl(&dword_222D7E000, v21, OS_LOG_TYPE_DEBUG, "Removing data %@\n", buf, 0xCu);
            }
            float v22 = [[MEMORY[0x263F08850] defaultManager:v32, v33];
            v23 = [v22 attributesOfItemAtPath:v17 error:0];
            v36 += [v23 fileSize];

            [(id)objc_opt_class() removeItemAtPath:v17];
            id v3 = v20;
            id v7 = v19;
            id v10 = v18;
            uint64_t v9 = v34;
            uint64_t v11 = v35;
          }
          if (objc_msgSend(v16, "isEqualToString:", @".json", v32, v33)
            && ([v13 containsString:@"seq-"] & 1) == 0)
          {
            if (__osLog_BioLog_Retention) {
              id v24 = __osLog_BioLog_Retention;
            }
            else {
              id v24 = MEMORY[0x263EF8438];
            }
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              id v43 = v17;
              _os_log_impl(&dword_222D7E000, v24, OS_LOG_TYPE_DEBUG, "Removing frame context %@\n", buf, 0xCu);
            }
            id v25 = [MEMORY[0x263F08850] defaultManager];
            uint64_t v26 = [v25 attributesOfItemAtPath:v17 error:0];
            v36 += [v26 fileSize];

            [(id)objc_opt_class() removeItemAtPath:v17];
            uint64_t v11 = v35;
          }

          ++v12;
        }
        while (v9 != v12);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v37 objects:v46 count:16];
      }
      while (v9);
    }
    else
    {
      unint64_t v36 = 0;
    }

    id v6 = v32;
    char v5 = v33;
    unint64_t v30 = v36;
  }
  else
  {
    if (__osLog_BioLog_Retention) {
      unint64_t v27 = __osLog_BioLog_Retention;
    }
    else {
      unint64_t v27 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      long long v28 = v27;
      uint64_t v29 = [v6 localizedFailureReason];
      *(_DWORD *)buf = 138412546;
      id v43 = v3;
      __int16 v44 = 2112;
      unint64_t v45 = v29;
      _os_log_impl(&dword_222D7E000, v28, OS_LOG_TYPE_ERROR, "Warning: Could not strip sequence at %@! %@\n", buf, 0x16u);
    }
    unint64_t v30 = 0;
  }

  return v30;
}

+ (void)setPurgeableAtPath:(id)a3 directory:(BOOL)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = v5;
  uint64_t v9 = 66053;
  if (!a4)
  {
    id v7 = v5;
    if (fsctl((const char *)[v7 UTF8String], 0xC0084A44uLL, &v9, 0))
    {
      if (__osLog_BioLog_Retention) {
        uint64_t v8 = __osLog_BioLog_Retention;
      }
      else {
        uint64_t v8 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v11 = v7;
        _os_log_impl(&dword_222D7E000, v8, OS_LOG_TYPE_DEFAULT, "Warning: Could not mark file purgeable: %@\n", buf, 0xCu);
      }
    }
  }
}

+ (void)setRetentionType:(id)a3 atPath:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v23 = a3;
  id v6 = a4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v7 = [(id)objc_opt_class() retentionPolicyTypes];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [v6 stringByAppendingPathComponent:*(void *)(*((void *)&v24 + 1) + 8 * i)];
        __int16 v13 = [MEMORY[0x263F08850] defaultManager];
        int v14 = [v13 fileExistsAtPath:v12];

        if (v14) {
          [(id)objc_opt_class() removeItemAtPath:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v34 count:16];
    }
    while (v9);
  }

  if (v23)
  {
    uint64_t v15 = [MEMORY[0x263F08850] defaultManager];
    unint64_t v16 = [v6 stringByAppendingPathComponent:v23];
    uint64_t v17 = *MEMORY[0x263F080A8];
    v32[0] = *MEMORY[0x263F08060];
    v32[1] = v17;
    uint64_t v18 = *MEMORY[0x263F08088];
    v33[0] = @"mobile";
    v33[1] = v18;
    id v19 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
    char v20 = [v15 createFileAtPath:v16 contents:0 attributes:v19];

    if (v20)
    {
      double v21 = [v6 stringByAppendingPathComponent:v23];
      [a1 setPurgeableAtPath:v21 directory:0];
    }
    else
    {
      if (__osLog_BioLog_Retention) {
        float v22 = __osLog_BioLog_Retention;
      }
      else {
        float v22 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v29 = v23;
        __int16 v30 = 2112;
        id v31 = v6;
        _os_log_impl(&dword_222D7E000, v22, OS_LOG_TYPE_ERROR, "Warning: Could not create retention type file %@ at path %@!\n", buf, 0x16u);
      }
    }
  }
}

@end