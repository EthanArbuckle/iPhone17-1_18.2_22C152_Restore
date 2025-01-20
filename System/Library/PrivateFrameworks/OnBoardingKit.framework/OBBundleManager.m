@interface OBBundleManager
+ (id)sharedManager;
- (BOOL)_isPreconditionSatisfiedForReplacementBundle:(id)a3;
- (NSString)overrideBundleSearchPath;
- (id)_allLinkBundles;
- (id)_allPrivacyBundles;
- (id)_bundleSearchPath;
- (id)_bundleWithIdentifier:(id)a3 usingSearchPath:(id)a4 includePlaceholder:(BOOL)a5 isLinkBundle:(BOOL)a6 isReplacementBundle:(BOOL)a7;
- (id)_bundlesInSearchPath:(id)a3 withBundleCreationBlock:(id)a4;
- (id)_providersByBundleNames;
- (id)_subarrayHavingPreconditionSatisfiedOfReplacementBundles:(id)a3;
- (id)allBundles;
- (id)allReplacementBundles;
- (id)bundleWithIdentifier:(id)a3;
- (id)bundlesWithIdentifiers:(id)a3;
- (id)orderedPrivacyBundles;
- (id)orderedPrivacyBundlesWithInclusionOptions:(unint64_t)a3;
- (id)privacyLinkBundleForBundles:(id)a3;
- (id)privacyLinkBundleForIdentifiers:(id)a3;
- (void)_modifyBundles:(id)a3 asNecessaryWithReplacementBundles:(id)a4;
- (void)setOverrideBundleSearchPath:(id)a3;
@end

@implementation OBBundleManager

- (id)bundleWithIdentifier:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:&v10 count:1];

  v7 = -[OBBundleManager bundlesWithIdentifiers:](self, "bundlesWithIdentifiers:", v6, v10, v11);

  v8 = [v7 firstObject];

  return v8;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedManager_sharedInstance;
  return v2;
}

- (id)_bundlesInSearchPath:(id)a3 withBundleCreationBlock:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v24 = (void (**)(id, void *))a4;
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v29 = 0;
  v7 = [v6 contentsOfDirectoryAtPath:v5 error:&v29];
  id v8 = v29;

  if (v8)
  {
    v9 = _OBLoggingFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v5 lastPathComponent];
      *(_DWORD *)buf = 138412546;
      v32 = v10;
      __int16 v33 = 2112;
      id v34 = v8;
      _os_log_impl(&dword_19BF0F000, v9, OS_LOG_TYPE_DEFAULT, "OBPrivacy: Failed to get contents of %@ directory: %@", buf, 0x16u);
    }
  }
  else
  {
    if (![v7 count]) {
      goto LABEL_16;
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v9 = v7;
    uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      id v22 = v5;
      uint64_t v13 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v9);
          }
          v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          v16 = [v15 pathExtension];
          v17 = [v16 lowercaseString];
          int v18 = [v17 isEqualToString:@"bundle"];

          if (v18)
          {
            v19 = [v15 stringByDeletingPathExtension];
            v20 = v24[2](v24, v19);
            [v23 addObject:v20];
          }
        }
        uint64_t v12 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v12);
      id v5 = v22;
      id v8 = 0;
    }
  }

LABEL_16:
  return v23;
}

- (id)_bundleWithIdentifier:(id)a3 usingSearchPath:(id)a4 includePlaceholder:(BOOL)a5 isLinkBundle:(BOOL)a6 isReplacementBundle:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  v14 = v13;
  if ((v8 || v7) && v9)
  {
    id v31 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Placeholder bundles are only supported for regular bundles." userInfo:0];
    objc_exception_throw(v31);
  }
  v15 = [v13 stringByAppendingPathComponent:v12];
  v16 = [v15 stringByAppendingPathExtension:@"bundle"];

  v17 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v18 = [v17 fileExistsAtPath:v16];

  if (!v18)
  {
    if (v9)
    {
      if (os_variant_has_internal_ui())
      {
        long long v25 = [v14 stringByAppendingPathComponent:@"com.apple.onboarding.internalplaceholder"];
        uint64_t v26 = [v25 stringByAppendingPathExtension:@"bundle"];

        long long v27 = +[OBBundle bundleAtPath:v26 placeholderIdentifier:v12];
        v16 = (void *)v26;
        if (v27) {
          goto LABEL_17;
        }
      }
    }
    goto LABEL_14;
  }
  v19 = [(OBBundleManager *)self _providersByBundleNames];
  v20 = [v16 lastPathComponent];
  v21 = [v19 objectForKeyedSubscript:v20];
  id v22 = [v21 path];

  if (v22)
  {
    id v23 = v22;

    v24 = _OBLoggingFacility();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = 138412290;
      id v33 = v23;
      _os_log_impl(&dword_19BF0F000, v24, OS_LOG_TYPE_DEFAULT, "OBPrivacy: Using bundle path %@", (uint8_t *)&v32, 0xCu);
    }

    v16 = v23;
  }
  else
  {
    id v23 = v16;
  }
  long long v27 = +[OBBundle bundleAtPath:v23 isLinkBundle:v8 isReplacementBundle:v7];

  if (!v27)
  {
LABEL_14:
    long long v28 = _OBLoggingFacility();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v30 = [NSNumber numberWithBool:v9];
      int v32 = 138412802;
      id v33 = v12;
      __int16 v34 = 2112;
      uint64_t v35 = v30;
      __int16 v36 = 2112;
      v37 = v14;
      _os_log_error_impl(&dword_19BF0F000, v28, OS_LOG_TYPE_ERROR, "Failed to create bundle with identifier %@ including placeholder %@ using search path %@", (uint8_t *)&v32, 0x20u);
    }
    long long v27 = 0;
  }
LABEL_17:

  return v27;
}

- (id)_providersByBundleNames
{
  return 0;
}

uint64_t __40__OBBundleManager_allReplacementBundles__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _bundleWithIdentifier:a2 usingSearchPath:*(void *)(a1 + 40) includePlaceholder:0 isLinkBundle:0 isReplacementBundle:1];
}

- (id)bundlesWithIdentifiers:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(OBBundleManager *)self allReplacementBundles];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v39 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v32 + 1) + 8 * i) identifier];
        [v6 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v32 objects:v39 count:16];
    }
    while (v9);
  }

  uint64_t v26 = v7;
  long long v25 = [(OBBundleManager *)self _subarrayHavingPreconditionSatisfiedOfReplacementBundles:v7];
  id v13 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = v4;
  uint64_t v14 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v28 + 1) + 8 * j);
        if (objc_msgSend(v6, "containsObject:", v18, v25))
        {
          v19 = _OBLoggingFacility();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v37 = v18;
            _os_log_impl(&dword_19BF0F000, v19, OS_LOG_TYPE_DEFAULT, "OBPrivacy: Client directly requested placeholder bundle %@", buf, 0xCu);
          }

          v20 = [(OBBundleManager *)self _bundleSearchPath];
          v21 = [v20 stringByAppendingPathComponent:@"ReplacementBundles"];
          id v22 = [(OBBundleManager *)self _bundleWithIdentifier:v18 usingSearchPath:v21 includePlaceholder:0 isLinkBundle:0 isReplacementBundle:1];

          if (v22) {
            goto LABEL_18;
          }
        }
        id v23 = [(OBBundleManager *)self _bundleSearchPath];
        id v22 = [(OBBundleManager *)self _bundleWithIdentifier:v18 usingSearchPath:v23 includePlaceholder:1 isLinkBundle:0 isReplacementBundle:0];

        if (v22)
        {
LABEL_18:
          [v13 addObject:v22];
        }
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
    }
    while (v15);
  }

  if ([v25 count]) {
    [(OBBundleManager *)self _modifyBundles:v13 asNecessaryWithReplacementBundles:v25];
  }

  return v13;
}

- (id)_bundleSearchPath
{
  v3 = [(OBBundleManager *)self overrideBundleSearchPath];

  if (v3)
  {
    id v4 = [(OBBundleManager *)self overrideBundleSearchPath];
  }
  else
  {
    id v4 = @"/System/Library/OnBoardingBundles";
  }
  return v4;
}

- (NSString)overrideBundleSearchPath
{
  return self->_overrideBundleSearchPath;
}

- (id)allReplacementBundles
{
  v3 = [(OBBundleManager *)self _bundleSearchPath];
  id v4 = [v3 stringByAppendingPathComponent:@"ReplacementBundles"];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__OBBundleManager_allReplacementBundles__block_invoke;
  v8[3] = &unk_1E58AEAE0;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  id v6 = [(OBBundleManager *)self _bundlesInSearchPath:v5 withBundleCreationBlock:v8];

  return v6;
}

- (id)_subarrayHavingPreconditionSatisfiedOfReplacementBundles:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
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
        if (-[OBBundleManager _isPreconditionSatisfiedForReplacementBundle:](self, "_isPreconditionSatisfiedForReplacementBundle:", v11, (void)v13))
        {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)_isPreconditionSatisfiedForReplacementBundle:(id)a3
{
  id v3 = a3;
  id v4 = [v3 replacementPreconditionCache];
  int v5 = [v4 isEqualToString:@"chlorine"];

  if (!v5)
  {
    uint64_t v9 = NSString;
    uint64_t v10 = [v3 identifier];
    uint64_t v11 = [v3 replacementPreconditionCache];
    uint64_t v12 = [v9 stringWithFormat:@"Replacement bundle %@ has unsupported precondition %@", v10, v11];

    id v13 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v12 userInfo:0];
    objc_exception_throw(v13);
  }
  id v6 = +[OBCapabilities sharedCapabilities];
  char v7 = [v6 eligibleForChlorine];

  return v7;
}

uint64_t __32__OBBundleManager_sharedManager__block_invoke()
{
  sharedManager_sharedInstance = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (id)allBundles
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v28 = (id)objc_opt_new();
  uint64_t v3 = [(OBBundleManager *)self _bundleSearchPath];
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v33 = 0;
  long long v27 = (void *)v3;
  int v5 = [v4 contentsOfDirectoryAtPath:v3 error:&v33];
  id v6 = v33;

  if (v6)
  {
    char v7 = _OBLoggingFacility();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 138412290;
    id v36 = v6;
    uint64_t v8 = "OBPrivacy: Error getting bundles list: %@";
    uint64_t v9 = v7;
    uint32_t v10 = 12;
    goto LABEL_4;
  }
  if ([v5 count])
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    char v7 = v5;
    uint64_t v11 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      long long v25 = v5;
      uint64_t v26 = 0;
      uint64_t v13 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v30 != v13) {
            objc_enumerationMutation(v7);
          }
          long long v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          long long v16 = objc_msgSend(v15, "pathExtension", v25, v26);
          v17 = [v16 lowercaseString];
          int v18 = [v17 isEqualToString:@"bundle"];

          if (v18)
          {
            v19 = [(OBBundleManager *)self _providersByBundleNames];
            v20 = [v19 objectForKeyedSubscript:v15];
            v21 = [v20 path];

            if (v21)
            {
              id v22 = _OBLoggingFacility();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v36 = v21;
                _os_log_impl(&dword_19BF0F000, v22, OS_LOG_TYPE_DEFAULT, "OBPrivacy: Using bundle path %@", buf, 0xCu);
              }
            }
            else
            {
              v21 = [v27 stringByAppendingPathComponent:v15];
            }
            id v23 = +[OBBundle bundleAtPath:v21];
            [v28 addObject:v23];
          }
        }
        uint64_t v12 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v12);
      int v5 = v25;
      id v6 = v26;
    }
  }
  else
  {
    char v7 = _OBLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v8 = "OBPrivacy: No bundles";
      uint64_t v9 = v7;
      uint32_t v10 = 2;
LABEL_4:
      _os_log_impl(&dword_19BF0F000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
    }
  }
LABEL_23:

  return v28;
}

- (id)_allPrivacyBundles
{
  v2 = [(OBBundleManager *)self allBundles];
  uint64_t v3 = (void *)[v2 mutableCopy];

  uint64_t v4 = [v3 count];
  if (v4 - 1 >= 0)
  {
    uint64_t v5 = v4;
    do
    {
      id v6 = [v3 objectAtIndexedSubscript:--v5];
      char v7 = [v6 privacyFlow];

      if (!v7) {
        [v3 removeObjectAtIndex:v5];
      }
    }
    while (v5 > 0);
  }
  return v3;
}

- (id)orderedPrivacyBundles
{
  return [(OBBundleManager *)self orderedPrivacyBundlesWithInclusionOptions:3];
}

- (id)orderedPrivacyBundlesWithInclusionOptions:(unint64_t)a3
{
  char v3 = a3;
  uint64_t v5 = [(OBBundleManager *)self _allPrivacyBundles];
  uint64_t v6 = [v5 count];
  if (v6 - 1 >= 0)
  {
    uint64_t v7 = v6;
    do
    {
      uint64_t v8 = [v5 objectAtIndexedSubscript:--v7];
      uint64_t v9 = [v8 identifier];
      if ([v9 isEqualToString:@"com.apple.onboarding.privacypane"])
      {
      }
      else
      {
        uint32_t v10 = [v8 identifier];
        int v11 = [v10 isEqualToString:@"com.apple.onboarding.privacypanemini"];

        if (!v11)
        {
          if (v3) {
            goto LABEL_8;
          }
LABEL_7:
          [v5 removeObjectAtIndex:v7];
          goto LABEL_8;
        }
      }
      if ((v3 & 2) == 0) {
        goto LABEL_7;
      }
LABEL_8:
    }
    while (v7 > 0);
  }
  if ((v3 & 0x10) != 0)
  {
    uint64_t v12 = [(OBBundleManager *)self _allLinkBundles];
    [v5 addObjectsFromArray:v12];

    if ((v3 & 4) == 0)
    {
LABEL_14:
      if ((v3 & 8) == 0) {
        goto LABEL_21;
      }
      goto LABEL_18;
    }
  }
  else if ((v3 & 4) == 0)
  {
    goto LABEL_14;
  }
  uint64_t v13 = [(OBBundleManager *)self allReplacementBundles];
  [v5 addObjectsFromArray:v13];

  if ((v3 & 8) == 0) {
    goto LABEL_21;
  }
LABEL_18:
  long long v14 = [(OBBundleManager *)self allReplacementBundles];
  long long v15 = [(OBBundleManager *)self _subarrayHavingPreconditionSatisfiedOfReplacementBundles:v14];

  if ([v15 count]) {
    [(OBBundleManager *)self _modifyBundles:v5 asNecessaryWithReplacementBundles:v15];
  }

LABEL_21:
  [v5 sortUsingComparator:&__block_literal_global_16];
  return v5;
}

uint64_t __61__OBBundleManager_orderedPrivacyBundlesWithInclusionOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 privacyFlow];
  uint64_t v6 = [v5 localizedShortTitle];
  uint64_t v7 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
  uint64_t v8 = [v6 stringByTrimmingCharactersInSet:v7];

  uint64_t v9 = [v4 privacyFlow];

  uint32_t v10 = [v9 localizedShortTitle];
  int v11 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
  uint64_t v12 = [v10 stringByTrimmingCharactersInSet:v11];

  uint64_t v13 = [v8 localizedCompare:v12];
  return v13;
}

- (id)privacyLinkBundleForBundles:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "identifier", (void)v17);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  uint64_t v12 = [(OBBundleManager *)self privacyLinkBundleForIdentifiers:v5];
  uint64_t v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [v6 firstObject];
  }
  long long v15 = v14;

  return v15;
}

- (id)privacyLinkBundleForIdentifiers:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((unint64_t)[v4 count] < 2)
  {
    long long v16 = 0;
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          int v11 = +[OBBundle nameFromIdentifier:](OBBundle, "nameFromIdentifier:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
          [v5 addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }

    [v5 sortUsingComparator:&__block_literal_global_34];
    uint64_t v12 = [v5 componentsJoinedByString:@"."];
    uint64_t v13 = +[OBBundle identifierWithName:v12];
    id v14 = [(OBBundleManager *)self _bundleSearchPath];
    long long v15 = [v14 stringByAppendingPathComponent:@"LinkBundles"];

    long long v16 = [(OBBundleManager *)self _bundleWithIdentifier:v13 usingSearchPath:v15 includePlaceholder:0 isLinkBundle:1 isReplacementBundle:0];
  }
  return v16;
}

uint64_t __51__OBBundleManager_privacyLinkBundleForIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedCompare:");
}

- (id)_allLinkBundles
{
  char v3 = [(OBBundleManager *)self _bundleSearchPath];
  id v4 = [v3 stringByAppendingPathComponent:@"LinkBundles"];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __34__OBBundleManager__allLinkBundles__block_invoke;
  v8[3] = &unk_1E58AEAE0;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  id v6 = [(OBBundleManager *)self _bundlesInSearchPath:v5 withBundleCreationBlock:v8];

  return v6;
}

uint64_t __34__OBBundleManager__allLinkBundles__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _bundleWithIdentifier:a2 usingSearchPath:*(void *)(a1 + 40) includePlaceholder:0 isLinkBundle:1 isReplacementBundle:0];
}

- (void)_modifyBundles:(id)a3 asNecessaryWithReplacementBundles:(id)a4
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  obuint64_t j = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v73 objects:v82 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v74;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v74 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = [*(id *)(*((void *)&v73 + 1) + 8 * i) identifier];
        [v7 addObject:v12];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v73 objects:v82 count:16];
    }
    while (v9);
  }

  id v51 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v52 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v45 = v6;
  uint64_t v13 = [v45 countByEnumeratingWithState:&v69 objects:v81 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v70;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v70 != v15) {
          objc_enumerationMutation(v45);
        }
        long long v17 = *(void **)(*((void *)&v69 + 1) + 8 * j);
        long long v65 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        long long v18 = [v17 replaceeIdentifierSetsCache];
        uint64_t v19 = [v18 countByEnumeratingWithState:&v65 objects:v80 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v66;
          do
          {
            for (uint64_t k = 0; k != v20; ++k)
            {
              if (*(void *)v66 != v21) {
                objc_enumerationMutation(v18);
              }
              uint64_t v23 = *(void **)(*((void *)&v65 + 1) + 8 * k);
              if ([v23 isSubsetOfSet:v7])
              {
                [v51 unionSet:v23];
                [v52 addObject:v17];
              }
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v65 objects:v80 count:16];
          }
          while (v20);
        }
      }
      uint64_t v14 = [v45 countByEnumeratingWithState:&v69 objects:v81 count:16];
    }
    while (v14);
  }

  if ([v52 count])
  {
    v24 = (void *)[obj copy];
    [obj removeAllObjects];
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v44 = v24;
    uint64_t v25 = [v44 countByEnumeratingWithState:&v61 objects:v79 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v62;
      uint64_t v42 = *(void *)v62;
      do
      {
        uint64_t v28 = 0;
        uint64_t v43 = v26;
        do
        {
          if (*(void *)v62 != v27) {
            objc_enumerationMutation(v44);
          }
          long long v29 = *(void **)(*((void *)&v61 + 1) + 8 * v28);
          long long v30 = [v29 identifier];
          char v31 = [v51 containsObject:v30];

          if (v31)
          {
            uint64_t v46 = v28;
            long long v59 = 0u;
            long long v60 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            id v47 = (id)[v52 copy];
            uint64_t v50 = [v47 countByEnumeratingWithState:&v57 objects:v78 count:16];
            if (v50)
            {
              uint64_t v49 = *(void *)v58;
              do
              {
                for (uint64_t m = 0; m != v50; ++m)
                {
                  if (*(void *)v58 != v49) {
                    objc_enumerationMutation(v47);
                  }
                  id v33 = *(void **)(*((void *)&v57 + 1) + 8 * m);
                  long long v53 = 0u;
                  long long v54 = 0u;
                  long long v55 = 0u;
                  long long v56 = 0u;
                  long long v34 = [v33 replaceeIdentifierSetsCache];
                  uint64_t v35 = [v34 countByEnumeratingWithState:&v53 objects:v77 count:16];
                  if (v35)
                  {
                    uint64_t v36 = v35;
                    uint64_t v37 = *(void *)v54;
                    do
                    {
                      for (uint64_t n = 0; n != v36; ++n)
                      {
                        if (*(void *)v54 != v37) {
                          objc_enumerationMutation(v34);
                        }
                        v39 = *(void **)(*((void *)&v53 + 1) + 8 * n);
                        uint64_t v40 = [v29 identifier];
                        if ([v39 containsObject:v40])
                        {
                          int v41 = [v39 isSubsetOfSet:v7];

                          if (v41)
                          {
                            [obj addObject:v33];
                            [v52 removeObject:v33];
                            goto LABEL_47;
                          }
                        }
                        else
                        {
                        }
                      }
                      uint64_t v36 = [v34 countByEnumeratingWithState:&v53 objects:v77 count:16];
                    }
                    while (v36);
                  }
LABEL_47:
                }
                uint64_t v50 = [v47 countByEnumeratingWithState:&v57 objects:v78 count:16];
              }
              while (v50);
            }

            uint64_t v27 = v42;
            uint64_t v26 = v43;
            uint64_t v28 = v46;
          }
          else
          {
            [obj addObject:v29];
          }
          ++v28;
        }
        while (v28 != v26);
        uint64_t v26 = [v44 countByEnumeratingWithState:&v61 objects:v79 count:16];
      }
      while (v26);
    }
  }
}

- (void)setOverrideBundleSearchPath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end