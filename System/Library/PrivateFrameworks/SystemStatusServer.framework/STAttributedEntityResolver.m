@interface STAttributedEntityResolver
- (NSArray)dynamicAttributions;
- (NSArray)preferredLocalizations;
- (STAttributedEntityResolver)init;
- (STAttributedEntityResolver)initWithPreferredLocalizations:(id)a3;
- (id)_localizedSystemStatusServerString:(void *)a1;
- (id)beginBatchResolutionSession;
- (id)resolveEntity:(id)a3;
- (void)setDynamicAttributions:(id)a3;
@end

@implementation STAttributedEntityResolver

- (id)resolveEntity:(id)a3
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self) {
    cache = self->_cache;
  }
  else {
    cache = 0;
  }
  id v6 = [(STReferenceCountedCache *)cache cachedObjectForKey:v4];
  if (!v6)
  {
    if (self) {
      identityResolver = self->_identityResolver;
    }
    else {
      identityResolver = 0;
    }
    v8 = identityResolver;
    v9 = [v4 executableIdentity];
    v10 = [(STExecutableIdentityResolver *)v8 resolvedIdentityForIdentity:v9];

    id v11 = [v4 localizedDisplayName];
    uint64_t v12 = [v4 localizedExecutableDisplayName];
    v13 = (void *)v12;
    if (v11) {
      BOOL v14 = v12 == 0;
    }
    else {
      BOOL v14 = 1;
    }
    int v15 = v14;
    if (!v14)
    {
      id v32 = objc_alloc(MEMORY[0x1E4FA9318]);
      v33 = [v4 website];
      v34 = objc_msgSend(v32, "initWithExecutableIdentity:website:systemService:localizedDisplayName:localizedExecutableDisplayName:", v10, v33, objc_msgSend(v4, "isSystemService"), v11, v13);

      id v35 = (id)[objc_alloc(MEMORY[0x1E4FA9310]) initWithAttributedEntity:v34];
      id v6 = 0;
      goto LABEL_101;
    }
    int v90 = v15;
    v92 = v8;
    int v94 = [v10 isSystemExecutable];
    v16 = [v10 executablePath];
    v17 = [(STAttributedEntityResolver *)self dynamicAttributions];
    v103[0] = MEMORY[0x1E4F143A8];
    v103[1] = 3221225472;
    v103[2] = __44__STAttributedEntityResolver_resolveEntity___block_invoke;
    v103[3] = &unk_1E6AD2360;
    id v102 = v16;
    id v104 = v102;
    v18 = objc_msgSend(v17, "bs_firstObjectPassingTest:", v103);

    v91 = v10;
    v19 = v10;
    id v20 = [v4 website];
    v101 = [v18 localizationKey];
    uint64_t v21 = (uint64_t)v20;
    v22 = v19;
    v96 = v18;
    v93 = v20;
    if (!v18 || (uint64_t v21 = (uint64_t)v20, v22 = v19, v101))
    {
LABEL_26:
      v36 = [v19 bundlePath];
      v98 = (void *)v21;
      v89 = v22;
      if ([v22 isEqual:v19])
      {
        if (v36)
        {
          v37 = (void *)[objc_alloc(MEMORY[0x1E4F4F6D0]) initWithPath:v36];
          v88 = 0;
          id v95 = v36;
        }
        else
        {
          v88 = 0;
          id v95 = 0;
          v37 = 0;
        }
      }
      else
      {
        uint64_t v38 = [v22 executablePath];

        v37 = [v22 bundlePath];

        id v95 = v37;
        if (v37) {
          v37 = (void *)[objc_alloc(MEMORY[0x1E4F4F6D0]) initWithPath:v37];
        }
        v88 = objc_msgSend(objc_alloc(MEMORY[0x1E4FA9318]), "initWithExecutableIdentity:website:systemService:localizedDisplayName:localizedExecutableDisplayName:", v19, v20, objc_msgSend(v4, "isSystemService"), 0, 0);
        id v102 = (id)v38;
      }
      v39 = -[STAttributedEntityResolver _localizedSystemStatusServerString:](self, @"UNKNOWN_ATTRIBUTION_STRING");
      v100 = v37;
      int v40 = v94;
      if (v37)
      {
        if (v94)
        {
          v41 = @"_STAttributionDisplayName";
          if (v101) {
            v41 = v101;
          }
          v42 = v41;
          v43 = [v37 infoDictionary];
          uint64_t v44 = [v43 objectForKey:v42];
          v45 = (void *)v44;
          if (v44) {
            v46 = (void *)v44;
          }
          else {
            v46 = v39;
          }
          id v47 = v46;

          v48 = (__CFBundle *)[v37 cfBundle];
          v49 = [(STAttributedEntityResolver *)self preferredLocalizations];
          uint64_t v50 = STAttributedEntityResolverLocalizedStringFromTableInCFBundle(v42, v48, v47, v49);

          v13 = (void *)v50;
        }
        if (!v13 || [v13 isEqualToString:v39])
        {
          v51 = [v37 infoDictionary];
          uint64_t v52 = [v51 objectForKey:@"CFBundleDisplayName"];
          v53 = (void *)v52;
          if (v52) {
            v54 = (void *)v52;
          }
          else {
            v54 = v39;
          }
          id v55 = v54;

          v56 = (__CFBundle *)[v37 cfBundle];
          v57 = [(STAttributedEntityResolver *)self preferredLocalizations];
          uint64_t v58 = STAttributedEntityResolverLocalizedStringFromTableInCFBundle(@"CFBundleDisplayName", v56, v55, v57);

          v13 = (void *)v58;
        }
        if ([v13 isEqualToString:v39])
        {
          v59 = [v37 infoDictionary];
          uint64_t v60 = [v59 objectForKey:@"CFBundleName"];
          v61 = (void *)v60;
          if (v60) {
            v62 = (void *)v60;
          }
          else {
            v62 = v39;
          }
          id v63 = v62;

          v64 = (__CFBundle *)[v37 cfBundle];
          v65 = [(STAttributedEntityResolver *)self preferredLocalizations];
          uint64_t v66 = STAttributedEntityResolverLocalizedStringFromTableInCFBundle(@"CFBundleName", v64, v63, v65);

          v13 = (void *)v66;
        }
        v67 = v89;
        int v40 = v94;
        if (v94)
        {
LABEL_64:
          int v72 = [v4 isSystemService];
          if (v72 && (!v13 || [v13 isEqualToString:v39]))
          {
            -[STAttributedEntityResolver _localizedSystemStatusServerString:](self, @"SYSTEM_SERVICES_ATTRIBUTION_STRING");
            id v35 = (id)objc_claimAutoreleasedReturnValue();

            v13 = v35;
            if (!v40) {
              goto LABEL_78;
            }
          }
          else
          {
            id v35 = 0;
            if (!v40) {
              goto LABEL_78;
            }
          }
          if (v13 && ![v13 isEqualToString:v39]) {
            goto LABEL_79;
          }
          uint64_t v73 = -[STAttributedEntityResolver _localizedSystemStatusServerString:](self, @"SYSTEM_ATTRIBUTION_STRING");

          v74 = STSystemStatusLogEntityResolving();
          v75 = v74;
          if (v95)
          {
            if (os_log_type_enabled(v74, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138543362;
              v106 = v67;
              _os_log_fault_impl(&dword_1D8320000, v75, OS_LOG_TYPE_FAULT, "Failed to create bundle for system executable with identity %{public}@", buf, 0xCu);
            }
          }
          else if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v106 = v67;
            _os_log_impl(&dword_1D8320000, v75, OS_LOG_TYPE_DEFAULT, "Failed to create bundle for system executable with identity %{public}@", buf, 0xCu);
          }

          v13 = (void *)v73;
LABEL_78:
          if (!v13)
          {
LABEL_80:
            id v76 = v39;

            v77 = STSystemStatusLogEntityResolving();
            if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138543362;
              v106 = v67;
              _os_log_fault_impl(&dword_1D8320000, v77, OS_LOG_TYPE_FAULT, "Failed to find any name for executable with identity %{public}@", buf, 0xCu);
            }

            v13 = v76;
LABEL_83:
            if (v72)
            {
              if (v35)
              {
                id v78 = v35;

                id v11 = v78;
                goto LABEL_100;
              }
              uint64_t v79 = -[STAttributedEntityResolver _localizedSystemStatusServerString:](self, @"SYSTEM_SERVICES_ATTRIBUTION_STRING");

              id v11 = (id)v79;
            }
            if (!v11)
            {
              v80 = [v96 formattedString];
              if (v80)
              {
                id v81 = v80;
                id v82 = v13;
                if (self && [v81 containsString:@"%@"])
                {
                  v83 = [v81 stringByReplacingOccurrencesOfString:@"%@" withString:v82];
                }
                else
                {
                  v83 = 0;
                }

                if (v83)
                {
                  id v11 = v83;

                  goto LABEL_100;
                }
              }
              else if (v98)
              {
                v84 = NSString;
                v85 = -[STAttributedEntityResolver _localizedSystemStatusServerString:](self, @"WEBSITE_IN_APP_ATTRIBUTION_FORMAT");
                objc_msgSend(v84, "localizedStringWithFormat:", v85, v98, v13);
                id v11 = (id)objc_claimAutoreleasedReturnValue();

                if (v11) {
                  goto LABEL_100;
                }
              }
              id v11 = v13;
            }
LABEL_100:
            v86 = objc_msgSend(objc_alloc(MEMORY[0x1E4FA9318]), "initWithExecutableIdentity:website:systemService:localizedDisplayName:localizedExecutableDisplayName:", v67, v98, objc_msgSend(v4, "isSystemService"), v11, v13);
            id v6 = (id)[objc_alloc(MEMORY[0x1E4FA9310]) initWithAttributedEntity:v86 activeEntity:v88];

            v10 = v91;
            v8 = v92;
            int v15 = v90;
LABEL_101:

            if (!v15) {
              goto LABEL_103;
            }
            goto LABEL_102;
          }
LABEL_79:
          if (![v13 isEqualToString:v39]) {
            goto LABEL_83;
          }
          goto LABEL_80;
        }
      }
      else
      {
        v67 = v89;
        if (v94) {
          goto LABEL_64;
        }
      }
      if (!v13 || [v13 isEqualToString:v39])
      {
        id v68 = v95 ? v95 : v102;
        if (v68)
        {
          v69 = [v68 lastPathComponent];
          uint64_t v70 = [v69 stringByDeletingPathExtension];

          v71 = STSystemStatusLogEntityResolving();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543362;
            v106 = v67;
            _os_log_fault_impl(&dword_1D8320000, v71, OS_LOG_TYPE_FAULT, "Generating name from path: failed to create bundle for executable with identity %{public}@", buf, 0xCu);
          }

          v13 = (void *)v70;
        }
      }
      goto LABEL_64;
    }
    uint64_t v21 = [v18 website];

    v23 = [v18 bundleIdentifier];
    uint64_t v24 = [v96 maskingClientExecutablePath];
    v25 = (void *)v24;
    if (v23)
    {
      uint64_t v97 = v21;
      v99 = (void *)v24;
      uint64_t v26 = [objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v23 allowPlaceholder:0 error:0];
      if (v26)
      {
        v27 = (void *)v26;
        id v28 = objc_alloc(MEMORY[0x1E4FA9390]);
        v29 = [v27 executableURL];
        v30 = [v29 path];
        v31 = [v28 initWithExecutablePath:v30];

        v22 = [(STExecutableIdentityResolver *)v92 resolvedIdentityForIdentity:v31];
      }
      else
      {
        v31 = STSystemStatusLogEntityResolving();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543362;
          v106 = v23;
          _os_log_fault_impl(&dword_1D8320000, v31, OS_LOG_TYPE_FAULT, "Failed to find app record for dynamic bundle ID: %{public}@", buf, 0xCu);
        }
        v27 = 0;
        v22 = v19;
      }
    }
    else
    {
      v22 = v19;
      if (!v24)
      {
LABEL_25:

        goto LABEL_26;
      }
      uint64_t v97 = v21;
      v99 = (void *)v24;
      v27 = (void *)[objc_alloc(MEMORY[0x1E4FA9390]) initWithExecutablePath:v24];
      v22 = [(STExecutableIdentityResolver *)v92 resolvedIdentityForIdentity:v27];
      v31 = v19;
    }

    id v20 = v93;
    uint64_t v21 = v97;
    v25 = v99;
    goto LABEL_25;
  }
LABEL_102:
  id v6 = v6;
  id v35 = v6;
LABEL_103:

  return v35;
}

- (NSArray)preferredLocalizations
{
  return self->_preferredLocalizations;
}

- (NSArray)dynamicAttributions
{
  return self->_dynamicAttributions;
}

- (id)_localizedSystemStatusServerString:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v5 = [v4 localizations];
    id v6 = (void *)MEMORY[0x1E4F28B50];
    v7 = [a1 preferredLocalizations];
    v8 = [v6 preferredLocalizationsFromArray:v5 forPreferences:v7];
    v9 = [v8 firstObject];

    if (!v9
      || ([v4 localizedStringForKey:v3 value:0 table:@"SystemStatusServer" localization:v9],
          (v10 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v10 = [v4 localizedStringForKey:v3 value:&stru_1F300FB98 table:@"SystemStatusServer"];
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __44__STAttributedEntityResolver_resolveEntity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 clientExecutablePath];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (STAttributedEntityResolver)init
{
  id v3 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v4 = [v3 preferredLocalizations];
  v5 = [(STAttributedEntityResolver *)self initWithPreferredLocalizations:v4];

  return v5;
}

- (STAttributedEntityResolver)initWithPreferredLocalizations:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STAttributedEntityResolver;
  v5 = [(STAttributedEntityResolver *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    preferredLocalizations = v5->_preferredLocalizations;
    v5->_preferredLocalizations = (NSArray *)v6;

    v8 = objc_alloc_init(STExecutableIdentityResolver);
    identityResolver = v5->_identityResolver;
    v5->_identityResolver = v8;

    v10 = objc_alloc_init(STReferenceCountedCache);
    cache = v5->_cache;
    v5->_cache = v10;
  }
  return v5;
}

- (void)setDynamicAttributions:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (STSystemStatusIsInternalLoggingEnabled())
  {
    v5 = STSystemStatusLogEntityResolving();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(STAttributedEntityResolver *)self dynamicAttributions];
      *(_DWORD *)buf = 138543874;
      v64 = self;
      __int16 v65 = 2114;
      uint64_t v66 = v6;
      __int16 v67 = 2114;
      id v68 = v4;
      _os_log_impl(&dword_1D8320000, v5, OS_LOG_TYPE_DEFAULT, "Entity resolver: %{public}@ -- updating dynamic attributions from: %{public}@ to: %{public}@", buf, 0x20u);
    }
  }
  v7 = [(STAttributedEntityResolver *)self dynamicAttributions];
  char v8 = [v7 isEqualToArray:v4];

  if ((v8 & 1) == 0)
  {
    v9 = [(STAttributedEntityResolver *)self dynamicAttributions];
    v10 = (void *)[v9 mutableCopy];
    id v11 = (NSArray *)[v4 copy];
    dynamicAttributions = self->_dynamicAttributions;
    self->_dynamicAttributions = v11;

    if (v4) {
      [v10 removeObjectsInArray:v4];
    }
    id v45 = v4;
    objc_super v13 = (void *)[v4 mutableCopy];
    BOOL v14 = v13;
    if (v9) {
      [v13 removeObjectsInArray:v9];
    }
    uint64_t v44 = v9;
    int v15 = [MEMORY[0x1E4F1CA80] set];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v16 = v10;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v56 objects:v62 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v57 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          id v22 = objc_alloc(MEMORY[0x1E4FA9390]);
          if (v21) {
            [v21 clientAuditToken];
          }
          else {
            memset(v55, 0, sizeof(v55));
          }
          v23 = (void *)[v22 initWithAuditToken:v55];
          [v15 addObject:v23];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v56 objects:v62 count:16];
      }
      while (v18);
    }

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v24 = v14;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v51 objects:v61 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v52;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v52 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = *(void **)(*((void *)&v51 + 1) + 8 * j);
          id v30 = objc_alloc(MEMORY[0x1E4FA9390]);
          if (v29) {
            [v29 clientAuditToken];
          }
          else {
            memset(v50, 0, sizeof(v50));
          }
          v31 = (void *)[v30 initWithAuditToken:v50];
          [v15 addObject:v31];
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v51 objects:v61 count:16];
      }
      while (v26);
    }

    v43 = v16;
    if (self) {
      cache = self->_cache;
    }
    else {
      cache = 0;
    }
    v33 = cache;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v34 = v15;
    uint64_t v35 = [v34 countByEnumeratingWithState:&v46 objects:v60 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v47;
      do
      {
        uint64_t v38 = 0;
        do
        {
          if (*(void *)v47 != v37) {
            objc_enumerationMutation(v34);
          }
          if (self) {
            identityResolver = self->_identityResolver;
          }
          else {
            identityResolver = 0;
          }
          int v40 = [(STExecutableIdentityResolver *)identityResolver resolvedIdentityForIdentity:*(void *)(*((void *)&v46 + 1) + 8 * v38)];
          v41 = (void *)[objc_alloc(MEMORY[0x1E4FA9318]) initWithExecutableIdentity:v40];
          [(STReferenceCountedCache *)v33 clearObjectForKey:v41];

          ++v38;
        }
        while (v36 != v38);
        uint64_t v42 = [v34 countByEnumeratingWithState:&v46 objects:v60 count:16];
        uint64_t v36 = v42;
      }
      while (v42);
    }

    id v4 = v45;
  }
}

- (id)beginBatchResolutionSession
{
  id v3 = [STAttributedEntityResolutionSession alloc];
  if (self) {
    identityResolver = self->_identityResolver;
  }
  else {
    identityResolver = 0;
  }
  v5 = identityResolver;
  uint64_t v6 = [(STExecutableIdentityResolver *)v5 beginBatchResolutionSession];
  if (self) {
    cache = self->_cache;
  }
  else {
    cache = 0;
  }
  char v8 = [(STAttributedEntityResolutionSession *)v3 initWithEntityResolver:self identityResolver:v6 cache:cache];

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_identityResolver, 0);
  objc_storeStrong((id *)&self->_dynamicAttributions, 0);
  objc_storeStrong((id *)&self->_preferredLocalizations, 0);
}

@end