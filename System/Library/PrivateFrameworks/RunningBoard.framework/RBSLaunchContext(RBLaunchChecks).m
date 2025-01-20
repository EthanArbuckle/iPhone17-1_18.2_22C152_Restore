@interface RBSLaunchContext(RBLaunchChecks)
- (BOOL)_deviceIsEligibleForDomain:()RBLaunchChecks bundleID:;
- (id)_applicationRecordForLaunchCheck;
- (id)_sharedPreflightManager;
- (uint64_t)_launchAllowedBySystemState:()RBLaunchChecks error:;
- (uint64_t)_needsEligibilityCheck;
- (uint64_t)_passesEligibilityCheck;
- (uint64_t)_passesRegulatoryChecksWithError:()RBLaunchChecks;
- (uint64_t)_recordPassesEligibilityChecks:()RBLaunchChecks;
- (uint64_t)_requiresPreflightCheck;
- (void)_applicationRecordForLaunchCheck;
- (void)_passesEligibilityCheck;
- (void)_requiresPreflightCheck;
@end

@implementation RBSLaunchContext(RBLaunchChecks)

- (uint64_t)_passesRegulatoryChecksWithError:()RBLaunchChecks
{
  if ([a1 _requiresPreflightCheck])
  {
    if (a3)
    {
      uint64_t v5 = *MEMORY[0x263F646A8];
      v6 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
      [v6 setObject:@"Launch prevented due to user approval regulatory requirements" forKey:*MEMORY[0x263F08338]];
      v7 = (void *)MEMORY[0x263F087E8];
      uint64_t v8 = v5;
      uint64_t v9 = 8;
LABEL_8:
      v12 = [v7 errorWithDomain:v8 code:v9 userInfo:v6];

      id v13 = v12;
      uint64_t result = 0;
      *a3 = v13;
      return result;
    }
  }
  else
  {
    if ([a1 _passesEligibilityCheck]) {
      return 1;
    }
    if (a3)
    {
      uint64_t v11 = *MEMORY[0x263F646A8];
      v6 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
      [v6 setObject:@"Launch prevented due to device eligibility requirements" forKey:*MEMORY[0x263F08338]];
      v7 = (void *)MEMORY[0x263F087E8];
      uint64_t v8 = v11;
      uint64_t v9 = 9;
      goto LABEL_8;
    }
  }
  return 0;
}

- (uint64_t)_passesEligibilityCheck
{
  if (![a1 _needsEligibilityCheck]) {
    return 1;
  }
  v2 = [a1 identity];
  if ([v2 isApplication])
  {
    v3 = [a1 _applicationRecordForLaunchCheck];
    if (v3)
    {
      uint64_t v4 = [a1 _recordPassesEligibilityChecks:v3];
    }
    else
    {
      uint64_t v5 = rbs_process_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[RBSLaunchContext(RBLaunchChecks) _passesEligibilityCheck]();
      }

      uint64_t v4 = 1;
    }
  }
  else
  {
    uint64_t v4 = 1;
  }

  return v4;
}

- (uint64_t)_requiresPreflightCheck
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v2 = [a1 _sharedPreflightManager];
  if (v2)
  {
    uint64_t v3 = [a1 identity];
    uint64_t v4 = [a1 appID];
    if (!(v4 | v3))
    {
      uint64_t v5 = rbs_process_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[RBSLaunchContext(RBLaunchChecks) _requiresPreflightCheck].cold.4();
      }
      goto LABEL_40;
    }
    uint64_t v5 = v4;
    if ([(id)v3 isApplication])
    {
      if (v5)
      {
LABEL_5:
        uint64_t v6 = [v2 requiresPreflightForApplication:v5];
        v7 = rbs_process_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v8 = @"ALLOWED";
          if (v6) {
            uint64_t v8 = @"DISALLOWED";
          }
          *(_DWORD *)buf = 138543618;
          v33 = a1;
          __int16 v34 = 2114;
          v35 = v8;
          _os_log_impl(&dword_226AB3000, v7, OS_LOG_TYPE_DEFAULT, "preflightManager for %{public}@ -> %{public}@", buf, 0x16u);
        }

        goto LABEL_41;
      }
      uint64_t v9 = [a1 bundleIdentifier];
      if (!v9)
      {
        if (![(id)v3 isExtension]
          || ([(id)v3 xpcServiceIdentifier], (uint64_t v9 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          uint64_t v5 = rbs_process_log();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
            -[RBSLaunchContext(RBLaunchChecks) _requiresPreflightCheck]();
          }
          goto LABEL_40;
        }
      }
      id v31 = 0;
      v10 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v9 allowPlaceholder:0 error:&v31];
      uint64_t v5 = v31;
      if (v10)
      {
        v23 = v10;
        v24 = v9;
        v26 = (void *)v3;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id obj = [v10 identities];
        uint64_t v11 = [obj countByEnumeratingWithState:&v27 objects:v36 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v28;
LABEL_19:
          uint64_t v14 = 0;
          while (1)
          {
            if (*(void *)v28 != v13) {
              objc_enumerationMutation(obj);
            }
            v15 = *(void **)(*((void *)&v27 + 1) + 8 * v14);
            v16 = [v15 personaUniqueString];
            v17 = [v26 personaString];
            char v18 = [v16 isEqualToString:v17];

            if (v18) {
              break;
            }
            if (v12 == ++v14)
            {
              uint64_t v12 = [obj countByEnumeratingWithState:&v27 objects:v36 count:16];
              if (v12) {
                goto LABEL_19;
              }
              goto LABEL_25;
            }
          }
          v19 = v15;

          v10 = v23;
          if (v19) {
            goto LABEL_32;
          }
        }
        else
        {
LABEL_25:

          v10 = v23;
        }
        v20 = [v10 identities];
        v19 = [v20 firstObject];

        if (v19)
        {
LABEL_32:

          uint64_t v5 = v19;
          uint64_t v3 = (uint64_t)v26;
          goto LABEL_5;
        }
        v21 = rbs_process_log();
        uint64_t v3 = (uint64_t)v26;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[RBSLaunchContext(RBLaunchChecks) _requiresPreflightCheck]();
        }
        uint64_t v9 = v24;
      }
      else
      {
        v21 = rbs_process_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[RBSLaunchContext(RBLaunchChecks) _requiresPreflightCheck]();
        }
      }
    }
    else
    {
      uint64_t v9 = rbs_process_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v33 = a1;
        _os_log_impl(&dword_226AB3000, v9, OS_LOG_TYPE_DEFAULT, "Skipping preflight as %{public}@ is not an app", buf, 0xCu);
      }
    }

LABEL_40:
    uint64_t v6 = 0;
LABEL_41:

    goto LABEL_42;
  }
  uint64_t v6 = 0;
LABEL_42:

  return v6;
}

- (id)_sharedPreflightManager
{
  if (_sharedPreflightManager_onceToken != -1) {
    dispatch_once(&_sharedPreflightManager_onceToken, &__block_literal_global_17);
  }
  v0 = (void *)_sharedPreflightManager_preflightManager;
  return v0;
}

- (uint64_t)_needsEligibilityCheck
{
  if (_needsEligibilityCheck_onceToken != -1) {
    dispatch_once(&_needsEligibilityCheck_onceToken, &__block_literal_global_24);
  }
  v2 = (void *)_needsEligibilityCheck_allowed;
  uint64_t v3 = [a1 bundleIdentifier];
  LODWORD(v2) = [v2 containsObject:v3];

  return v2 ^ 1;
}

- (uint64_t)_launchAllowedBySystemState:()RBLaunchChecks error:
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = [v6 preventLaunch];
  uint64_t v8 = [v6 preventLaunchPredicates];
  uint64_t v9 = [v6 allowLaunchPredicates];
  v10 = (void *)[objc_alloc(MEMORY[0x263F64570]) initWithLaunchContext:a1];
  uint64_t v11 = rbs_process_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v10 executablePath];
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v42 = v7;
    *(_WORD *)&v42[4] = 2114;
    *(void *)&v42[6] = v12;
    __int16 v43 = 2114;
    v44 = v8;
    __int16 v45 = 2114;
    v46 = v9;
    _os_log_impl(&dword_226AB3000, v11, OS_LOG_TYPE_DEFAULT, "Checking PreventLaunch: global:%d exPath:%{public}@ predicates:%{public}@ allow:%{public}@", buf, 0x26u);
  }
  if (v7)
  {
LABEL_16:
    if ([v9 count])
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      v19 = objc_msgSend(v6, "allowLaunchPredicates", 0);
      uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v32;
        while (2)
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v32 != v22) {
              objc_enumerationMutation(v19);
            }
            v24 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            if ([v24 matchesProcess:v10])
            {
              v26 = rbs_process_log();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                *(void *)v42 = v24;
                _os_log_impl(&dword_226AB3000, v26, OS_LOG_TYPE_DEFAULT, "PreventLaunch overriden by Predicate: %{public}@", buf, 0xCu);
              }

              int v25 = 0;
              goto LABEL_29;
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v31 objects:v39 count:16];
          if (v21) {
            continue;
          }
          break;
        }
      }
      int v25 = 1;
LABEL_29:
    }
    else
    {
      int v25 = 1;
    }
    uint64_t v18 = v25 ^ 1u;
    if (a4 && v25)
    {
      uint64_t v27 = *MEMORY[0x263F646A8];
      long long v28 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
      [v28 setObject:@"Launch prevented due to \"prevent launch\" assertion" forKey:*MEMORY[0x263F08338]];
      long long v29 = [MEMORY[0x263F087E8] errorWithDomain:v27 code:7 userInfo:v28];

      *a4 = v29;
    }
  }
  else
  {
    if ([v8 count])
    {
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      uint64_t v13 = [v6 preventLaunchPredicates];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v36;
        while (2)
        {
          for (uint64_t j = 0; j != v15; ++j)
          {
            if (*(void *)v36 != v16) {
              objc_enumerationMutation(v13);
            }
            if ([*(id *)(*((void *)&v35 + 1) + 8 * j) matchesProcess:v10])
            {

              goto LABEL_16;
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v35 objects:v40 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }
    }
    uint64_t v18 = 1;
  }

  return v18;
}

- (uint64_t)_recordPassesEligibilityChecks:()RBLaunchChecks
{
  id v4 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  uint64_t v5 = [v4 entitlements];
  id v6 = [v4 bundleIdentifier];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __67__RBSLaunchContext_RBLaunchChecks___recordPassesEligibilityChecks___block_invoke;
  v11[3] = &unk_2647C8AC8;
  id v7 = v5;
  id v12 = v7;
  uint64_t v13 = a1;
  id v8 = v6;
  id v14 = v8;
  uint64_t v15 = &v16;
  [&unk_26DAB1548 enumerateKeysAndObjectsUsingBlock:v11];
  uint64_t v9 = *((unsigned __int8 *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return v9;
}

- (id)_applicationRecordForLaunchCheck
{
  v2 = [a1 appID];
  uint64_t v3 = v2;
  if (!v2)
  {
    id v6 = [a1 bundleIdentifier];
    if (v6)
    {
      id v9 = 0;
      id v4 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v6 allowPlaceholder:0 error:&v9];
      id v5 = v9;
      if (v4) {
        goto LABEL_13;
      }
      id v7 = rbs_process_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[RBSLaunchContext(RBLaunchChecks) _applicationRecordForLaunchCheck]();
      }
    }
    else
    {
      id v7 = rbs_process_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[RBSLaunchContext(RBLaunchChecks) _applicationRecordForLaunchCheck]();
      }
      id v5 = 0;
      id v4 = 0;
    }

    goto LABEL_13;
  }
  id v10 = 0;
  id v4 = [v2 findApplicationRecordWithError:&v10];
  id v5 = v10;
  if (v4) {
    goto LABEL_14;
  }
  id v6 = rbs_process_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[RBSLaunchContext(RBLaunchChecks) _applicationRecordForLaunchCheck]();
  }
LABEL_13:

LABEL_14:
  return v4;
}

- (BOOL)_deviceIsEligibleForDomain:()RBLaunchChecks bundleID:
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = [a3 unsignedLongLongValue];
    id v8 = [a1 identity];
    id v9 = [v8 personaString];

    id v10 = rbs_process_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      uint64_t v21 = v7;
      __int16 v22 = 2112;
      id v23 = v6;
      __int16 v24 = 2112;
      int v25 = v9;
      _os_log_impl(&dword_226AB3000, v10, OS_LOG_TYPE_DEFAULT, "Making eligibility query with domain: %llu, bundle ID: %@, persona: %@", buf, 0x20u);
    }

    id v11 = objc_alloc(MEMORY[0x263F5B658]);
    id v12 = [a1 identity];
    uint64_t v13 = [v12 personaString];
    id v19 = 0;
    id v14 = (void *)[v11 initWithDomain:v7 bundleID:v6 persona:v13 error:&v19];
    uint64_t v15 = v19;

    if (v14)
    {
      BOOL v16 = [v14 answer] == 4;
    }
    else
    {
      v17 = rbs_process_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[RBSLaunchContext(RBLaunchChecks) _deviceIsEligibleForDomain:bundleID:]((uint64_t)v15, v7, v17);
      }

      BOOL v16 = 0;
    }
  }
  else
  {
    uint64_t v15 = rbs_process_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[RBSLaunchContext(RBLaunchChecks) _deviceIsEligibleForDomain:bundleID:](v15);
    }
    BOOL v16 = 1;
  }

  return v16;
}

- (void)_requiresPreflightCheck
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_226AB3000, v0, v1, "No LSApplicationIdentity or RBSProcessIdentity in %{public}@", v2, v3, v4, v5, v6);
}

- (void)_deviceIsEligibleForDomain:()RBLaunchChecks bundleID:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_226AB3000, log, OS_LOG_TYPE_ERROR, "Bundle ID on LSApplication record is nil, defaulting to eligible", v1, 2u);
}

- (void)_deviceIsEligibleForDomain:()RBLaunchChecks bundleID:.cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 134218242;
  *(void *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  OUTLINED_FUNCTION_17(&dword_226AB3000, a2, a3, "failure getting eligibility info for domain %qu with error: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)_applicationRecordForLaunchCheck
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_17(&dword_226AB3000, v0, v1, "unable to find LSApplicationRecord for identity %@: %@");
}

- (void)_passesEligibilityCheck
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_226AB3000, v0, v1, "Could not find LS record for %@", v2, v3, v4, v5, v6);
}

@end