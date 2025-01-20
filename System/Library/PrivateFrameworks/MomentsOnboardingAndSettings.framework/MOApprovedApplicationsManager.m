@interface MOApprovedApplicationsManager
+ (id)sharedInstance;
- (BOOL)isApplicationUsingDataAccess:(id)a3;
- (BOOL)isClientUsingDataAccess:(id)a3;
- (BOOL)isJournalingSuggestionsAvailableForBundleIdentifier:(id)a3;
- (MOApprovedApplicationsManager)init;
- (id)_getApprovedApplicationsArray;
- (id)_getApprovedApplicationsArrayAndRequireAccess:(BOOL)a3;
- (id)_getApprovedApplicationsWithAccessArray;
- (id)getJournalingSuggestionsApprovedApplicationRecordForBundleIdentifier:(id)a3;
- (void)registerApplicationsForDataAccess:(id)a3;
- (void)registerClientsForDataAccess:(id)a3;
@end

@implementation MOApprovedApplicationsManager

- (id)_getApprovedApplicationsArray
{
  approvedApplications = self->_approvedApplications;
  if (!approvedApplications)
  {
    v4 = [(MOApprovedApplicationsManager *)self _getApprovedApplicationsArrayAndRequireAccess:0];
    v5 = self->_approvedApplications;
    self->_approvedApplications = v4;

    approvedApplications = self->_approvedApplications;
  }
  v6 = approvedApplications;
  return v6;
}

- (id)_getApprovedApplicationsWithAccessArray
{
  approvedApplicationsWithAccess = self->_approvedApplicationsWithAccess;
  if (!approvedApplicationsWithAccess)
  {
    v4 = [(MOApprovedApplicationsManager *)self _getApprovedApplicationsArrayAndRequireAccess:1];
    v5 = self->_approvedApplicationsWithAccess;
    self->_approvedApplicationsWithAccess = v4;

    approvedApplicationsWithAccess = self->_approvedApplicationsWithAccess;
  }
  v6 = approvedApplicationsWithAccess;
  return v6;
}

- (id)_getApprovedApplicationsArrayAndRequireAccess:(BOOL)a3
{
  v5 = +[MOOnboardingAndSettingsManager sharedInstance];
  v6 = [v5 defaultManager];

  v7 = [v6 objectForKey:@"ApprovedJournalingApplicationsOverrideForcedList"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;
  v10 = [MEMORY[0x263F01878] enumeratorWithOptions:0];
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  v19 = __79__MOApprovedApplicationsManager__getApprovedApplicationsArrayAndRequireAccess___block_invoke;
  v20 = &unk_265424EF0;
  id v11 = v9;
  id v21 = v11;
  v22 = @"Approved applications lookup";
  BOOL v24 = a3;
  v23 = self;
  [v10 setFilter:&v17];
  v12 = objc_opt_new();
  uint64_t v13 = objc_msgSend(v10, "nextObject", v17, v18, v19, v20);
  if (v13)
  {
    v14 = (void *)v13;
    do
    {
      [v12 addObject:v14];
      uint64_t v15 = [v10 nextObject];

      v14 = (void *)v15;
    }
    while (v15);
  }

  return v12;
}

uint64_t __79__MOApprovedApplicationsManager__getApprovedApplicationsArrayAndRequireAccess___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [v3 entitlements];
  v5 = [v3 bundleIdentifier];
  v6 = *(void **)(a1 + 32);
  if (!v6) {
    goto LABEL_15;
  }
  v60 = v4;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v79 objects:v94 count:16];
  if (!v8) {
    goto LABEL_14;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v80;
  uint64_t v56 = 138412546;
  while (2)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v80 != v10) {
        objc_enumerationMutation(v7);
      }
      v12 = *(void **)(*((void *)&v79 + 1) + 8 * i);
      if (objc_msgSend(v12, "isEqualToString:", v5, v56))
      {
        uint64_t v13 = [*(id *)(a1 + 32) objectForKey:v12];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v14 = _mo_log_facility_get_os_log(MOLogFacilitySettings);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v56;
            v87 = @"ApprovedJournalingApplicationsOverrideForcedList";
            __int16 v88 = 2112;
            v89 = v5;
            _os_log_error_impl(&dword_256D32000, v14, OS_LOG_TYPE_ERROR, "Invalid defaults value type in %@.%@", buf, 0x16u);
          }

          continue;
        }
        uint64_t v28 = [v13 BOOLValue];
        v30 = _mo_log_facility_get_os_log(MOLogFacilitySettings);
        BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
        if (v28)
        {
          v4 = v60;
          if (v31)
          {
            v32 = *(__CFString **)(a1 + 40);
            *(_DWORD *)buf = v56;
            v87 = v32;
            __int16 v88 = 2112;
            v89 = v5;
            v33 = "%@: [%@:OverrideForcedSelected]";
LABEL_46:
            _os_log_impl(&dword_256D32000, v30, OS_LOG_TYPE_DEFAULT, v33, buf, 0x16u);
          }
        }
        else
        {
          v4 = v60;
          if (v31)
          {
            v34 = *(__CFString **)(a1 + 40);
            *(_DWORD *)buf = v56;
            v87 = v34;
            __int16 v88 = 2112;
            v89 = v5;
            v33 = "%@: [%@:OverrideForcedUnselected]";
            goto LABEL_46;
          }
        }

        goto LABEL_97;
      }
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v79 objects:v94 count:16];
    if (v9) {
      continue;
    }
    break;
  }
LABEL_14:

  v4 = v60;
LABEL_15:
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  uint64_t v15 = [&unk_270628FA8 countByEnumeratingWithState:&v75 objects:v93 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    v7 = 0;
    uint64_t v17 = *(void *)v76;
    while (2)
    {
      uint64_t v18 = 0;
      v19 = v7;
      do
      {
        if (*(void *)v76 != v17) {
          objc_enumerationMutation(&unk_270628FA8);
        }
        v7 = *(id *)(*((void *)&v75 + 1) + 8 * v18);

        if ([v5 isEqualToString:v7])
        {
          uint64_t v13 = _mo_log_facility_get_os_log(MOLogFacilitySettings);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v29 = *(__CFString **)(a1 + 40);
            *(_DWORD *)buf = 138412546;
            v87 = v29;
            __int16 v88 = 2112;
            v89 = v5;
            _os_log_impl(&dword_256D32000, v13, OS_LOG_TYPE_DEFAULT, "%@: [%@:SpecialCaseUnselected]", buf, 0x16u);
          }
          uint64_t v28 = 0;
          goto LABEL_97;
        }
        ++v18;
        v19 = v7;
      }
      while (v16 != v18);
      uint64_t v16 = [&unk_270628FA8 countByEnumeratingWithState:&v75 objects:v93 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  uint64_t v20 = [&unk_270628FC0 countByEnumeratingWithState:&v71 objects:v92 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    v7 = 0;
    uint64_t v22 = *(void *)v72;
    while (2)
    {
      uint64_t v23 = 0;
      BOOL v24 = v7;
      do
      {
        if (*(void *)v72 != v22) {
          objc_enumerationMutation(&unk_270628FC0);
        }
        v7 = *(id *)(*((void *)&v71 + 1) + 8 * v23);

        if ([v5 isEqualToString:v7])
        {
          if (*(unsigned char *)(a1 + 56)) {
            uint64_t v28 = [*(id *)(a1 + 48) isApplicationUsingDataAccess:v5];
          }
          else {
            uint64_t v28 = 1;
          }
          uint64_t v13 = _mo_log_facility_get_os_log(MOLogFacilitySettings);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v49 = *(__CFString **)(a1 + 40);
            v50 = @"AccessBasedUnselected";
            *(_DWORD *)buf = 138412802;
            if (v28) {
              v50 = @"Selected";
            }
            v87 = v49;
            __int16 v88 = 2112;
            v89 = v5;
            __int16 v90 = 2112;
            v91 = v50;
            _os_log_impl(&dword_256D32000, v13, OS_LOG_TYPE_DEFAULT, "%@: [%@:Access%@]", buf, 0x20u);
          }
          goto LABEL_97;
        }
        ++v23;
        BOOL v24 = v7;
      }
      while (v21 != v23);
      uint64_t v21 = [&unk_270628FC0 countByEnumeratingWithState:&v71 objects:v92 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }
  v25 = [v4 objectForKey:@"com.apple.momentsd.internal" ofClass:objc_opt_class()];
  uint64_t v13 = v25;
  if (v25
    && (memset(v70, 0, sizeof(v70)),
        [v25 countByEnumeratingWithState:v70 objects:v85 count:16]))
  {
    v7 = **((id **)&v70[0] + 1);
    v26 = _mo_log_facility_get_os_log(MOLogFacilitySettings);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = *(__CFString **)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v87 = v27;
      __int16 v88 = 2112;
      v89 = v5;
      _os_log_impl(&dword_256D32000, v26, OS_LOG_TYPE_DEFAULT, "%@: [%@:InternalEntitlementSelected]", buf, 0x16u);
    }
    uint64_t v28 = 1;
  }
  else
  {
    v26 = [v4 objectForKey:@"com.apple.developer.moments.allow" ofClass:objc_opt_class()];
    v61 = v4;
    if (v26)
    {
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      v35 = v13;
      uint64_t v36 = [v35 countByEnumeratingWithState:&v66 objects:v84 count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        v57 = v26;
        id v59 = v3;
        v7 = 0;
        uint64_t v38 = *(void *)v67;
        while (2)
        {
          uint64_t v39 = 0;
          v40 = v7;
          do
          {
            if (*(void *)v67 != v38) {
              objc_enumerationMutation(v35);
            }
            v7 = *(id *)(*((void *)&v66 + 1) + 8 * v39);

            if ([v7 isEqualToString:@"suggestions"])
            {
              if (*(unsigned char *)(a1 + 56)) {
                uint64_t v28 = [*(id *)(a1 + 48) isApplicationUsingDataAccess:v5];
              }
              else {
                uint64_t v28 = 1;
              }
              v26 = v57;
              v42 = _mo_log_facility_get_os_log(MOLogFacilitySettings);
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                v51 = *(__CFString **)(a1 + 40);
                v52 = @"Unselected";
                *(_DWORD *)buf = 138412802;
                if (v28) {
                  v52 = @"Selected";
                }
                v87 = v51;
                __int16 v88 = 2112;
                v89 = v5;
                __int16 v90 = 2112;
                v91 = v52;
                _os_log_impl(&dword_256D32000, v42, OS_LOG_TYPE_DEFAULT, "%@: [%@:EntitlementAccess%@]", buf, 0x20u);
              }
              goto LABEL_94;
            }
            ++v39;
            v40 = v7;
          }
          while (v37 != v39);
          uint64_t v37 = [v35 countByEnumeratingWithState:&v66 objects:v84 count:16];
          if (v37) {
            continue;
          }
          break;
        }

        v26 = v57;
      }

      v4 = v61;
    }
    v41 = [v4 objectForKey:@"com.apple.developer.journal.allow" ofClass:objc_opt_class()];
    v35 = v41;
    if (v41)
    {
      id v59 = v3;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      v42 = v41;
      uint64_t v43 = [v42 countByEnumeratingWithState:&v62 objects:v83 count:16];
      if (v43)
      {
        uint64_t v44 = v43;
        v58 = v26;
        v7 = 0;
        uint64_t v45 = *(void *)v63;
        while (2)
        {
          uint64_t v46 = 0;
          v47 = v7;
          do
          {
            if (*(void *)v63 != v45) {
              objc_enumerationMutation(v42);
            }
            v7 = *(id *)(*((void *)&v62 + 1) + 8 * v46);

            if ([v7 isEqualToString:@"suggestions"])
            {
              if (*(unsigned char *)(a1 + 56)) {
                uint64_t v28 = [*(id *)(a1 + 48) isApplicationUsingDataAccess:v5];
              }
              else {
                uint64_t v28 = 1;
              }
              v26 = v58;
              v48 = _mo_log_facility_get_os_log(MOLogFacilitySettings);
              if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
              {
                v53 = *(__CFString **)(a1 + 40);
                v54 = @"Unselected";
                *(_DWORD *)buf = 138412802;
                if (v28) {
                  v54 = @"Selected";
                }
                v87 = v53;
                __int16 v88 = 2112;
                v89 = v5;
                __int16 v90 = 2112;
                v91 = v54;
                _os_log_impl(&dword_256D32000, v48, OS_LOG_TYPE_DEFAULT, "%@: [%@:EntitlementAccess%@]", buf, 0x20u);
              }
              goto LABEL_92;
            }
            ++v46;
            v47 = v7;
          }
          while (v44 != v46);
          uint64_t v44 = [v42 countByEnumeratingWithState:&v62 objects:v83 count:16];
          if (v44) {
            continue;
          }
          break;
        }
        uint64_t v28 = 0;
        v48 = v7;
        v7 = 0;
        v26 = v58;
LABEL_92:
      }
      else
      {
        v7 = 0;
        uint64_t v28 = 0;
      }
      v35 = v42;
LABEL_94:

      id v3 = v59;
    }
    else
    {
      v7 = 0;
      uint64_t v28 = 0;
    }

    v4 = v61;
  }

LABEL_97:
  return v28;
}

- (MOApprovedApplicationsManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)MOApprovedApplicationsManager;
  v2 = [(MOApprovedApplicationsManager *)&v7 init];
  id v3 = v2;
  if (v2)
  {
    approvedApplications = v2->_approvedApplications;
    v2->_approvedApplications = 0;

    v5 = v3;
  }

  return v3;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__MOApprovedApplicationsManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, block);
  }
  v2 = (void *)sharedInstance_shared_0;
  return v2;
}

uint64_t __47__MOApprovedApplicationsManager_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_shared_0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (BOOL)isJournalingSuggestionsAvailableForBundleIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (v4 && ([v4 isEqualToString:&stru_270625C18] & 1) == 0)
  {
    [(MOApprovedApplicationsManager *)self _getApprovedApplicationsArray];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v7);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "bundleIdentifier", (void)v13);
          char v11 = [v5 isEqualToString:v10];

          if (v11)
          {
            LOBYTE(v6) = 1;
            goto LABEL_14;
          }
        }
        uint64_t v6 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)getJournalingSuggestionsApprovedApplicationRecordForBundleIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (v4 && ([v4 isEqualToString:&stru_270625C18] & 1) == 0)
  {
    [(MOApprovedApplicationsManager *)self _getApprovedApplicationsWithAccessArray];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = (void *)[v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v7);
          }
          uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          char v11 = objc_msgSend(v10, "bundleIdentifier", (void)v14);
          char v12 = [v5 isEqualToString:v11];

          if (v12)
          {
            uint64_t v6 = (void *)[v10 copy];
            goto LABEL_14;
          }
        }
        uint64_t v6 = (void *)[v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)isApplicationUsingDataAccess:(id)a3
{
  id v3 = a3;
  id v4 = +[MOOnboardingAndSettingsManager sharedInstance];
  char v5 = [v4 isApplicationUsingDataAccess:v3];

  return v5;
}

- (void)registerApplicationsForDataAccess:(id)a3
{
  id v3 = a3;
  id v4 = +[MOOnboardingAndSettingsManager sharedInstance];
  [v4 registerApplicationsForDataAccess:v3];
}

- (BOOL)isClientUsingDataAccess:(id)a3
{
  id v3 = a3;
  id v4 = +[MOOnboardingAndSettingsManager sharedInstance];
  char v5 = [v4 isClientUsingDataAccess:v3];

  return v5;
}

- (void)registerClientsForDataAccess:(id)a3
{
  id v3 = a3;
  id v4 = +[MOOnboardingAndSettingsManager sharedInstance];
  [v4 registerClientsForDataAccess:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_approvedApplicationsWithAccess, 0);
  objc_storeStrong((id *)&self->_approvedApplications, 0);
}

@end