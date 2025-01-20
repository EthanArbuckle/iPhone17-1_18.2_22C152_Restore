@interface SBLayoutStateSceneIdentityProvider
- (SBLayoutStateSceneIdentityProvider)initWithDisplayIdentity:(id)a3;
- (SBLayoutStateSceneIdentityProviderDataSource)dataSource;
- (id)_identifierForApplication:(id)a3;
- (id)_sceneIdentityForApplication:(id)a3 uniqueIdentifier:(id)a4 targetContentIdentifier:(id)a5 allowCanMatches:(BOOL)a6 preferNewScene:(BOOL)a7 allowSceneCreation:(BOOL)a8 visibleIdentifiers:(id)a9 excludingIdentifiers:(id)a10 sceneSessionRole:(id)a11 preferredDisplay:(id)a12;
- (id)newSceneIdentityForApplication:(id)a3;
- (id)sceneIdentityForApplication:(id)a3;
- (id)sceneIdentityForApplication:(id)a3 createPrimaryIfRequired:(BOOL)a4 sceneSessionRole:(id)a5;
- (id)sceneIdentityForApplication:(id)a3 excludingIdentifiers:(id)a4;
- (id)sceneIdentityForApplication:(id)a3 targetContentIdentifier:(id)a4;
- (id)sceneIdentityForApplication:(id)a3 targetContentIdentifier:(id)a4 allowCanMatches:(BOOL)a5 preferNewScene:(BOOL)a6 allowSceneCreation:(BOOL)a7 visibleIdentifiers:(id)a8 preferredDisplay:(id)a9;
- (id)sceneIdentityForApplication:(id)a3 targetContentIdentifier:(id)a4 allowCanMatches:(BOOL)a5 preferNewScene:(BOOL)a6 visibleIdentifiers:(id)a7;
- (id)sceneIdentityForApplication:(id)a3 uniqueIdentifier:(id)a4;
- (id)sceneIdentityForApplication:(id)a3 uniqueIdentifier:(id)a4 targetContentIdentifier:(id)a5;
- (id)sceneIdentityForApplication:(id)a3 uniqueIdentifier:(id)a4 targetContentIdentifier:(id)a5 sceneSessionRole:(id)a6;
- (void)setDataSource:(id)a3;
@end

@implementation SBLayoutStateSceneIdentityProvider

- (id)sceneIdentityForApplication:(id)a3 uniqueIdentifier:(id)a4
{
  return [(SBLayoutStateSceneIdentityProvider *)self _sceneIdentityForApplication:a3 uniqueIdentifier:a4 targetContentIdentifier:0 allowCanMatches:1 preferNewScene:0 allowSceneCreation:1 visibleIdentifiers:0 excludingIdentifiers:0 sceneSessionRole:*MEMORY[0x1E4F43F38] preferredDisplay:0];
}

- (id)_sceneIdentityForApplication:(id)a3 uniqueIdentifier:(id)a4 targetContentIdentifier:(id)a5 allowCanMatches:(BOOL)a6 preferNewScene:(BOOL)a7 allowSceneCreation:(BOOL)a8 visibleIdentifiers:(id)a9 excludingIdentifiers:(id)a10 sceneSessionRole:(id)a11 preferredDisplay:(id)a12
{
  BOOL v81 = a8;
  BOOL v12 = a7;
  BOOL v13 = a6;
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v94 = a5;
  id v100 = a9;
  id v99 = a10;
  id v90 = a11;
  v19 = self;
  id v20 = a12;
  v21 = [(SBLayoutStateSceneIdentityProvider *)self _identifierForApplication:v17];
  if (v18)
  {
    id v22 = [MEMORY[0x1E4F62A60] identityForIdentifier:v18];
    if (!v22) {
      goto LABEL_93;
    }
    goto LABEL_95;
  }
  BOOL v82 = v12;
  v23 = [v17 info];
  int v24 = [v23 supportsMultiwindow];

  if (!v24)
  {
    id v22 = 0;
    id v18 = 0;
    goto LABEL_93;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v25 = [WeakRetained layoutStateManager];
  id v26 = [v25 defaultSceneIdentifierForBundleIdentifier:v21 targetContentIdentifier:v94 allowCanMatches:v13 preferNewScene:v12 visibleSceneIdentifiers:v100 excludingSceneIdentifiers:v99 sceneSessionRole:v90 preferredDisplay:v20];

  if (v26) {
    goto LABEL_91;
  }
  v85 = [v17 _dataStore];
  v27 = [WeakRetained externalApplicationSceneHandles];
  v28 = [WeakRetained transientApplicationSceneHandlesForApplication:v17];
  v75 = v27;
  if (v28)
  {
    v29 = v28;
    id v30 = [v28 setByAddingObjectsFromSet:v27];
  }
  else
  {
    id v30 = v27;
  }
  v76 = v21;
  id v77 = v20;
  v78 = self;
  v98 = v17;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  id obj = v30;
  uint64_t v97 = [obj countByEnumeratingWithState:&v102 objects:v112 count:16];
  if (!v97)
  {
    v96 = 0;
    id v31 = 0;
    v32 = 0;
    id v26 = 0;
    goto LABEL_90;
  }
  v96 = 0;
  id v31 = 0;
  v32 = 0;
  id v26 = 0;
  BOOL v79 = !v13;
  uint64_t v95 = *(void *)v103;
  unint64_t v33 = 0x1E4F42000uLL;
  while (2)
  {
    uint64_t v34 = 0;
    v35 = v26;
    do
    {
      unint64_t v36 = v33;
      if (*(void *)v103 != v95) {
        objc_enumerationMutation(obj);
      }
      v37 = *(void **)(*((void *)&v102 + 1) + 8 * v34);
      v38 = [v37 sceneIdentifier];
      int v101 = [v99 containsObject:v38];
      int v39 = [v100 containsObject:v38];
      v40 = [v37 application];
      int v41 = [v40 isEqual:v98];

      if (!v41)
      {
        unint64_t v33 = v36;
        goto LABEL_77;
      }
      if (!__sb__runningInSpringBoard())
      {
        v43 = [MEMORY[0x1E4F42948] currentDevice];
        uint64_t v44 = [v43 userInterfaceIdiom];

        BOOL v45 = v44 == 1;
        unint64_t v33 = v36;
        if (!v45 || !v94) {
          goto LABEL_27;
        }
LABEL_24:
        v46 = [v37 sceneIdentifier];
        v47 = [v85 sceneStoreForIdentifier:v46 creatingIfNecessary:0];

        v48 = [v47 objectForKey:@"sceneSessionRole"];
        if (![v48 isEqual:v90])
        {
LABEL_75:

LABEL_76:
          goto LABEL_77;
        }
        v86 = v48;
        v84 = v47;
        uint64_t v83 = [v47 objectForKey:@"activationConditions"];
        v49 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v83 error:0];
        v87 = v49;
        if (v49) {
          id v50 = v49;
        }
        else {
          id v50 = objc_alloc_init(*(Class *)(v33 + 3424));
        }
        v89 = v50;
        id v92 = v94;
        v52 = +[SBFocusAppConfigurationContextMonitor sharedInstance];
        v53 = [v98 bundleIdentifier];
        v54 = [v52 targetContentIdentifierPrefixForBundleIdentifier:v53];

        v88 = v54;
        if (v54)
        {
          v55 = SBLogSceneResolution();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v107 = 0;
            __int16 v108 = 2114;
            v109 = v54;
            _os_log_impl(&dword_1D85BA000, v55, OS_LOG_TYPE_DEFAULT, "Found TCI Prefix for scene evaluation %{public}@:%{public}@", buf, 0x16u);
          }

          uint64_t v56 = [v54 stringByAppendingString:v92];

          id v57 = (id)v56;
        }
        else
        {
          id v57 = v92;
        }
        v93 = v57;
        uint64_t v58 = objc_msgSend(v89, "_suitabilityForTargetContentIdentifier:errorString:");
        id v59 = 0;
        v60 = v59;
        v48 = v86;
        if (v58 != 2)
        {
          if (v58 != 1)
          {
            if (v58)
            {
              unint64_t v33 = v36;
              v62 = (void *)v83;
              if (v59)
              {
LABEL_70:
                v70 = SBLogSceneResolution();
                if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
                {
                  v73 = [v98 bundleIdentifier];
                  *(_DWORD *)buf = 138543619;
                  v107 = v73;
                  __int16 v108 = 2113;
                  v109 = v60;
                  _os_log_error_impl(&dword_1D85BA000, v70, OS_LOG_TYPE_ERROR, "error evaluating UISceneActivationConditions for %{public}@: %{private}@", buf, 0x16u);

                  v48 = v86;
                }
              }
LABEL_73:

              if (v31)
              {

                id v26 = v35;
                goto LABEL_90;
              }
              v47 = v84;
              goto LABEL_75;
            }
            v61 = SBLogSceneResolution();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543874;
              v107 = 0;
              __int16 v108 = 2114;
              v109 = v87;
              __int16 v110 = 2114;
              v111 = v93;
              _os_log_impl(&dword_1D85BA000, v61, OS_LOG_TYPE_DEFAULT, "Scene is not suitable for activationConditions %{public}@:%{public}@ %{public}@", buf, 0x20u);
            }
            unint64_t v33 = v36;
            v62 = (void *)v83;
LABEL_69:

            if (v60) {
              goto LABEL_70;
            }
            goto LABEL_73;
          }
          if (((v101 | v39 | v79) & 1) == 0)
          {
            if (v32) {
              v63 = v32;
            }
            else {
              v63 = v38;
            }
            id v64 = v63;

            v32 = v64;
            v48 = v86;
          }
          unint64_t v33 = v36;
          v61 = SBLogSceneResolution();
          v62 = (void *)v83;
          if (!os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_69;
          }
          *(_DWORD *)buf = 138543874;
          v107 = 0;
          __int16 v108 = 2114;
          v109 = v87;
          __int16 v110 = 2114;
          v111 = v93;
          v65 = v61;
          v66 = "Scene is suitable for activationConditions %{public}@:%{public}@ %{public}@";
LABEL_68:
          _os_log_impl(&dword_1D85BA000, v65, OS_LOG_TYPE_DEFAULT, v66, buf, 0x20u);
          goto LABEL_69;
        }
        if ((v101 | v39))
        {
          unint64_t v33 = v36;
          if ((v101 | v39 ^ 1))
          {
            v62 = (void *)v83;
LABEL_66:
            v61 = SBLogSceneResolution();
            if (!os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_69;
            }
            *(_DWORD *)buf = 138543874;
            v107 = 0;
            __int16 v108 = 2114;
            v109 = v87;
            __int16 v110 = 2114;
            v111 = v93;
            v65 = v61;
            v66 = "Scene is preferred for activationConditions %{public}@:%{public}@ %{public}@";
            goto LABEL_68;
          }
          v68 = v96;
          if (v96) {
            v67 = v96;
          }
          else {
            v67 = v38;
          }
          v96 = v67;
        }
        else
        {
          if (v31) {
            v67 = v31;
          }
          else {
            v67 = v38;
          }
          v68 = v31;
          id v31 = v67;
          unint64_t v33 = v36;
        }
        v62 = (void *)v83;
        id v69 = v67;

        v48 = v86;
        goto LABEL_66;
      }
      int v42 = SBFEffectiveDeviceClass();
      unint64_t v33 = v36;
      if (v94 && v42 == 2) {
        goto LABEL_24;
      }
LABEL_27:
      if (((v101 | v39) & 1) == 0 && !v82)
      {
        if (v31) {
          v51 = v31;
        }
        else {
          v51 = v38;
        }
        v47 = v31;
        id v31 = v51;
        goto LABEL_76;
      }
LABEL_77:
      if (_os_feature_enabled_impl())
      {
        v71 = SBLogSceneResolution();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v107 = v32;
          _os_log_impl(&dword_1D85BA000, v71, OS_LOG_TYPE_DEFAULT, "PROTOTYPING: Not accepting CAN match, ignoring scene %{public}@", buf, 0xCu);
        }

        v32 = 0;
      }
      v72 = v96;
      if (v32) {
        v72 = v32;
      }
      if (v31) {
        v72 = v31;
      }
      id v26 = v72;

      ++v34;
      v35 = v26;
    }
    while (v97 != v34);
    uint64_t v97 = [obj countByEnumeratingWithState:&v102 objects:v112 count:16];
    if (v97) {
      continue;
    }
    break;
  }
LABEL_90:

  id v17 = v98;
  v19 = v78;
  v21 = v76;
  id v20 = v77;
  if (v26)
  {
LABEL_91:
    id v22 = [MEMORY[0x1E4F62A60] identityForIdentifier:v26];
  }
  else
  {
    id v22 = 0;
  }
  id v18 = 0;

  if (!v22)
  {
LABEL_93:
    if (v81) {
      id v22 = [(SBLayoutStateSceneIdentityProvider *)v19 newSceneIdentityForApplication:v17];
    }
  }
LABEL_95:

  return v22;
}

- (id)_identifierForApplication:(id)a3
{
  return (id)[a3 bundleIdentifier];
}

- (id)newSceneIdentityForApplication:(id)a3
{
  id v4 = a3;
  v5 = [v4 bundleIdentifier];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v7 = [v4 info];

  v8 = objc_msgSend(WeakRetained, "newSceneIdentifierForBundleIdentifier:supportsMultiwindow:", v5, objc_msgSend(v7, "supportsMultiwindow"));
  if ([v5 isEqualToString:@"com.apple.LoginUI"]) {
    v9 = @"LoginWorkspace";
  }
  else {
    v9 = 0;
  }
  v10 = [MEMORY[0x1E4F62A60] identityForIdentifier:v8 workspaceIdentifier:v9];

  return v10;
}

- (id)sceneIdentityForApplication:(id)a3 createPrimaryIfRequired:(BOOL)a4 sceneSessionRole:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v10 = [(SBLayoutStateSceneIdentityProvider *)self _identifierForApplication:v8];
  v11 = [(SBLayoutStateSceneIdentityProvider *)self dataSource];
  BOOL v12 = [v11 currentLayoutState];
  BOOL v13 = [v12 appLayout];
  if ([v12 unlockedEnvironmentMode] != 3) {
    goto LABEL_6;
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __107__SBLayoutStateSceneIdentityProvider_sceneIdentityForApplication_createPrimaryIfRequired_sceneSessionRole___block_invoke;
  v24[3] = &unk_1E6AF4B38;
  id v25 = v8;
  v14 = [v13 latestItemPassingTest:v24];
  if (!v14)
  {

    goto LABEL_6;
  }
  v15 = v14;
  v16 = [v14 uniqueIdentifier];

  if (!v16)
  {
LABEL_6:
    id v18 = [v8 info];
    int v19 = [v18 supportsMultiwindow];

    if (v19 && v6)
    {
      id v20 = [v11 layoutStateManager];
      v21 = [v20 primarySceneIdentifierForBundleIdentifier:v10 sceneSessionRole:v9 displayIdentity:self->_displayIdentity];

      if (v21)
      {
        id v22 = [MEMORY[0x1E4F62A60] identityForIdentifier:v21];
      }
      else
      {
        id v22 = [(SBLayoutStateSceneIdentityProvider *)self newSceneIdentityForApplication:v8];
      }
      id v17 = v22;
    }
    else
    {
      id v17 = [(SBLayoutStateSceneIdentityProvider *)self sceneIdentityForApplication:v8];
    }
    goto LABEL_13;
  }
  id v17 = [MEMORY[0x1E4F62A60] identityForIdentifier:v16];

LABEL_13:
  return v17;
}

- (id)sceneIdentityForApplication:(id)a3
{
  return [(SBLayoutStateSceneIdentityProvider *)self _sceneIdentityForApplication:a3 uniqueIdentifier:0 targetContentIdentifier:0 allowCanMatches:1 preferNewScene:0 allowSceneCreation:1 visibleIdentifiers:0 excludingIdentifiers:0 sceneSessionRole:*MEMORY[0x1E4F43F38] preferredDisplay:0];
}

- (SBLayoutStateSceneIdentityProviderDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (SBLayoutStateSceneIdentityProviderDataSource *)WeakRetained;
}

- (id)sceneIdentityForApplication:(id)a3 uniqueIdentifier:(id)a4 targetContentIdentifier:(id)a5
{
  return [(SBLayoutStateSceneIdentityProvider *)self _sceneIdentityForApplication:a3 uniqueIdentifier:a4 targetContentIdentifier:a5 allowCanMatches:1 preferNewScene:0 allowSceneCreation:1 visibleIdentifiers:0 excludingIdentifiers:0 sceneSessionRole:*MEMORY[0x1E4F43F38] preferredDisplay:0];
}

- (id)sceneIdentityForApplication:(id)a3 targetContentIdentifier:(id)a4 allowCanMatches:(BOOL)a5 preferNewScene:(BOOL)a6 allowSceneCreation:(BOOL)a7 visibleIdentifiers:(id)a8 preferredDisplay:(id)a9
{
  return [(SBLayoutStateSceneIdentityProvider *)self _sceneIdentityForApplication:a3 uniqueIdentifier:0 targetContentIdentifier:a4 allowCanMatches:a5 preferNewScene:a6 allowSceneCreation:a7 visibleIdentifiers:a8 excludingIdentifiers:0 sceneSessionRole:*MEMORY[0x1E4F43F38] preferredDisplay:a9];
}

- (SBLayoutStateSceneIdentityProvider)initWithDisplayIdentity:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBLayoutStateSceneIdentityProvider;
  BOOL v6 = [(SBLayoutStateSceneIdentityProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_displayIdentity, a3);
  }

  return v7;
}

- (id)sceneIdentityForApplication:(id)a3 excludingIdentifiers:(id)a4
{
  return [(SBLayoutStateSceneIdentityProvider *)self _sceneIdentityForApplication:a3 uniqueIdentifier:0 targetContentIdentifier:0 allowCanMatches:1 preferNewScene:0 allowSceneCreation:1 visibleIdentifiers:0 excludingIdentifiers:a4 sceneSessionRole:*MEMORY[0x1E4F43F38] preferredDisplay:0];
}

- (id)sceneIdentityForApplication:(id)a3 targetContentIdentifier:(id)a4
{
  return [(SBLayoutStateSceneIdentityProvider *)self _sceneIdentityForApplication:a3 uniqueIdentifier:0 targetContentIdentifier:a4 allowCanMatches:1 preferNewScene:0 allowSceneCreation:1 visibleIdentifiers:0 excludingIdentifiers:0 sceneSessionRole:*MEMORY[0x1E4F43F38] preferredDisplay:0];
}

- (id)sceneIdentityForApplication:(id)a3 targetContentIdentifier:(id)a4 allowCanMatches:(BOOL)a5 preferNewScene:(BOOL)a6 visibleIdentifiers:(id)a7
{
  return [(SBLayoutStateSceneIdentityProvider *)self _sceneIdentityForApplication:a3 uniqueIdentifier:0 targetContentIdentifier:a4 allowCanMatches:a5 preferNewScene:a6 allowSceneCreation:1 visibleIdentifiers:a7 excludingIdentifiers:0 sceneSessionRole:*MEMORY[0x1E4F43F38] preferredDisplay:0];
}

- (id)sceneIdentityForApplication:(id)a3 uniqueIdentifier:(id)a4 targetContentIdentifier:(id)a5 sceneSessionRole:(id)a6
{
  return [(SBLayoutStateSceneIdentityProvider *)self _sceneIdentityForApplication:a3 uniqueIdentifier:a4 targetContentIdentifier:a5 allowCanMatches:1 preferNewScene:0 allowSceneCreation:1 visibleIdentifiers:0 excludingIdentifiers:0 sceneSessionRole:a6 preferredDisplay:0];
}

uint64_t __107__SBLayoutStateSceneIdentityProvider_sceneIdentityForApplication_createPrimaryIfRequired_sceneSessionRole___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 bundleIdentifier];
  id v4 = [*(id *)(a1 + 32) bundleIdentifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_displayIdentity, 0);
}

@end