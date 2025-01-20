@interface RBLaunchdJobManager
+ (id)lastExitStatusForLabel:(id)a3 error:(id *)a4;
- (BOOL)_addAppPropertiesToData:(id)a3 forIdentity:(id)a4 context:(id)a5 actualIdentity:(id *)a6 error:(id *)a7;
- (BOOL)_addContainerPropertiesFromExtensionContext:(id)a3 toServiceDict:(id)a4;
- (BOOL)_addPersonaFromExtensionContext:(id)a3 toServiceDict:(id)a4;
- (BOOL)_isRunningBoardLaunched:(id)a3;
- (BOOL)_removeJobWithInstance:(id)a3 orJob:(id)a4 error:(id *)a5;
- (BOOL)removeJobWithInstance:(id)a3 error:(id *)a4;
- (RBLaunchdJobManager)initWithLaunchdInterface:(id)a3 personaManager:(id)a4 containerManager:(id)a5 bundlePropertiesManager:(id)a6;
- (id)_containerURLForExtensionContext:(id)a3;
- (id)_createAndSubmitExtensionJob:(id)a3 UUID:(id)a4 error:(id *)a5;
- (id)_createLaunchdJobWithIdentity:(id)a3 context:(id)a4 actualIdentity:(id *)a5 error:(id *)a6;
- (id)_generateDataWithIdentity:(id)a3 context:(id)a4 actualIdentity:(id *)a5 error:(id *)a6;
- (id)createAndLaunchWithIdentity:(id)a3 context:(id)a4 error:(id *)a5;
- (id)synchronizeJobs;
- (unint64_t)test_trackedJobCount;
- (void)_addDextPropertiesToData:(id)a3 forIdentity:(id)a4 context:(id)a5;
- (void)_addExtensionContainerURL:(id)a3 toServiceDict:(id)a4;
- (void)_addExtensionEnvironmentFromContainerURL:(id)a3 toServiceDict:(id)a4;
- (void)_addReslideIdentityIfNeeded:(id)a3 exitStatus:(id)a4;
- (void)_addSharedPropertiesToData:(id)a3 forIdentity:(id)a4 context:(id)a5;
- (void)_addStandardAppPropertiesToData:(id)a3;
- (void)invokeOnProcessDeath:(id)a3 handler:(id)a4 onQueue:(id)a5;
- (void)synchronizeJobs;
@end

@implementation RBLaunchdJobManager

- (void)_addSharedPropertiesToData:(id)a3 forIdentity:(id)a4 context:(id)a5
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v43 = a5;
  char v9 = [v43 executionOptions];
  xpc_dictionary_set_string(v7, "_ManagedBy", "com.apple.runningboard");
  v10 = [v8 applicationJobLabel];

  if (v10)
  {
    v11 = [v8 applicationJobLabel];
    goto LABEL_13;
  }
  id v12 = v8;
  if ([v12 isEmbeddedApplication])
  {
    v13 = NSString;
    v14 = [v12 embeddedApplicationIdentifier];
    v11 = [v13 stringWithFormat:@"UIKitApplication:%@[%04x][rb-legacy]", v14, arc4random() % 0xFFFF];
  }
  else
  {
    if ([v12 hasConsistentLaunchdJob])
    {
      uint64_t v15 = [v12 consistentLaunchdJobLabel];
    }
    else if ([v12 isApplication])
    {
      uint64_t v15 = [v12 applicationJobLabel];
    }
    else
    {
      if (![v12 isDext])
      {
        v11 = &stru_26DA9D688;
        goto LABEL_12;
      }
      uint64_t v15 = [v12 dextLabel];
    }
    v11 = (__CFString *)v15;
  }
LABEL_12:

LABEL_13:
  v16 = v11;
  xpc_dictionary_set_string(v7, "Label", (const char *)[(__CFString *)v16 UTF8String]);

  xpc_object_t v17 = xpc_array_create(0, 0);
  id v18 = [v43 _overrideExecutablePath];
  v19 = (const char *)[v18 fileSystemRepresentation];

  char v40 = v9;
  v41 = v8;
  if (v19)
  {
    xpc_array_set_string(v17, 0xFFFFFFFFFFFFFFFFLL, v19);
    xpc_dictionary_set_string(v7, "Program", v19);
  }
  else
  {
    v20 = rbs_process_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      -[RBLaunchdJobManager _addSharedPropertiesToData:forIdentity:context:](v43);
    }
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v21 = [v43 arguments];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v48 objects:v55 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v49 != v24) {
          objc_enumerationMutation(v21);
        }
        id v26 = [*(id *)(*((void *)&v48 + 1) + 8 * i) description];
        xpc_array_set_string(v17, 0xFFFFFFFFFFFFFFFFLL, (const char *)[v26 UTF8String]);
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v48 objects:v55 count:16];
    }
    while (v23);
  }

  v42 = v7;
  xpc_dictionary_set_value(v7, "ProgramArguments", v17);
  xpc_object_t v27 = xpc_dictionary_create(0, 0, 0);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v28 = [v43 _additionalEnvironment];
  uint64_t v29 = [v28 countByEnumeratingWithState:&v44 objects:v54 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v45 != v31) {
          objc_enumerationMutation(v28);
        }
        v33 = *(void **)(*((void *)&v44 + 1) + 8 * j);
        v34 = [v43 _additionalEnvironment];
        v35 = [v34 objectForKey:v33];

        id v36 = [v33 description];
        v37 = (const char *)[v36 UTF8String];
        id v38 = [v35 description];
        xpc_dictionary_set_string(v27, v37, (const char *)[v38 UTF8String]);
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v44 objects:v54 count:16];
    }
    while (v30);
  }

  if ((v40 & 4) != 0)
  {
    v39 = rbs_job_log();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v53 = v41;
      _os_log_impl(&dword_226AB3000, v39, OS_LOG_TYPE_DEFAULT, "Launching %{public}@ to build DYLD closure. The new process will exit as soon as the operation completes.", buf, 0xCu);
    }

    xpc_dictionary_set_string(v27, "DYLD_JUST_BUILD_CLOSURE", "1");
  }
  xpc_dictionary_set_value(v42, "EnvironmentVariables", v27);
  if (v40 < 0) {
    xpc_dictionary_set_BOOL(v42, "RunAtLoad", 1);
  }
}

- (BOOL)_addAppPropertiesToData:(id)a3 forIdentity:(id)a4 context:(id)a5 actualIdentity:(id *)a6 error:(id *)a7
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  char v14 = [v13 executionOptions];
  v78 = a6;
  *a6 = 0;
  [(RBLaunchdJobManager *)self _addStandardAppPropertiesToData:v11];
  if (([v13 lsSpawnFlags] & 4) == 0)
  {
    int v15 = [v13 spawnType];
    if (v15)
    {
      int v16 = v15;
      if (v15 == 1)
      {
        xpc_object_t v17 = "SystemApp";
      }
      else
      {
        id v18 = rbs_general_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
          -[RBLaunchdJobManager _addAppPropertiesToData:forIdentity:context:actualIdentity:error:](v16, v18);
        }

        xpc_object_t v17 = 0;
      }
    }
    else
    {
      xpc_object_t v17 = "App";
    }
    xpc_dictionary_set_string(v11, "ProcessType", v17);
    xpc_dictionary_set_int64(v11, "_LaunchType", 3);
  }
  id v19 = [v12 description];
  xpc_dictionary_set_string(v11, "_ResourceCoalition", (const char *)[v19 UTF8String]);

  v20 = [v13 bundleIdentifier];

  if (v20)
  {
    id v21 = [v13 bundleIdentifier];
    xpc_dictionary_set_string(v11, "CFBundleIdentifier", (const char *)[v21 UTF8String]);
  }
  uint64_t v22 = [v13 _additionalMachServices];
  if ((v14 & 0x10) != 0) {
    xpc_dictionary_set_BOOL(v11, "NSBuiltWithThreadSanitizer", 1);
  }
  v81 = v13;
  char v79 = v14;
  xpc_object_t v80 = v11;
  id v23 = v12;
  if ((v14 & 4) != 0)
  {

    uint64_t v22 = 0;
  }
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  obuint64_t j = v22;
  uint64_t v24 = [obj countByEnumeratingWithState:&v90 objects:v99 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v91;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v91 != v26) {
          objc_enumerationMutation(obj);
        }
        v28 = *(void **)(*((void *)&v90 + 1) + 8 * i);
        uint64_t v29 = rbs_general_log();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v96 = v28;
          __int16 v97 = 2114;
          v98 = v23;
          _os_log_impl(&dword_226AB3000, v29, OS_LOG_TYPE_DEFAULT, "Inserting mach service %{public}@ into job for %{public}@", buf, 0x16u);
        }

        xpc_object_t v30 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_BOOL(v30, "ResetAtClose", 1);
        xpc_dictionary_set_value(xdict, (const char *)[v28 UTF8String], v30);
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v90 objects:v99 count:16];
    }
    while (v25);
  }

  xpc_dictionary_set_value(v80, "MachServices", xdict);
  uint64_t v31 = [v81 standardOutputPath];

  if (v31)
  {
    id v32 = [v81 standardOutputPath];
    xpc_dictionary_set_string(v80, "StandardOutPath", (const char *)[v32 UTF8String]);
  }
  v33 = [v81 standardErrorPath];

  v34 = self;
  if (v33)
  {
    id v35 = [v81 standardErrorPath];
    xpc_dictionary_set_string(v80, "StandardErrorPath", (const char *)[v35 UTF8String]);
  }
  id v36 = [v81 standardInPath];

  if (v36)
  {
    id v37 = [v81 standardInPath];
    xpc_dictionary_set_string(v80, "StandardInPath", (const char *)[v37 UTF8String]);
  }
  id v38 = v23;
  if ((v79 & 5) == 1) {
    xpc_dictionary_set_BOOL(v80, "WaitForDebugger", 1);
  }
  if ((v79 & 6) == 2) {
    xpc_dictionary_set_BOOL(v80, "DisableASLR", 1);
  }
  if ([v81 lsSpawnFlags]) {
    xpc_dictionary_set_BOOL(v80, "WaitForDebugger", 1);
  }
  if ([v81 initialRole])
  {
    [v81 initialRole];
    int v39 = RBSDarwinRoleFromRBSRole();
    xpc_dictionary_set_int64(v80, "InitialTaskRole", v39);
  }
  uint64_t v40 = [v81 lsBinpref];
  if (v40
    && (v41 = (void *)v40,
        [v81 lsBinprefSubtype],
        v42 = objc_claimAutoreleasedReturnValue(),
        v42,
        v41,
        v42))
  {
    xpc_object_t v43 = xpc_array_create(0, 0);
    long long v44 = [v81 lsBinpref];
    uint64_t v45 = [v44 count];

    if (v45)
    {
      unint64_t v46 = 0;
      do
      {
        long long v47 = [v81 lsBinpref];
        long long v48 = [v47 objectAtIndex:v46];

        xpc_object_t v49 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_int64(v49, "CPUType", [v48 integerValue]);
        long long v50 = [v81 lsBinprefSubtype];
        unint64_t v51 = [v50 count];

        if (v51 <= v46)
        {
          int64_t v54 = -1;
        }
        else
        {
          v52 = [v81 lsBinprefSubtype];
          v53 = [v52 objectAtIndex:v46];
          int64_t v54 = [v53 integerValue];
        }
        xpc_dictionary_set_int64(v49, "CPUSubtype", v54);
        xpc_array_set_value(v43, 0xFFFFFFFFFFFFFFFFLL, v49);

        ++v46;
        v55 = [v81 lsBinpref];
        unint64_t v56 = [v55 count];
      }
      while (v56 > v46);
      id v38 = v23;
      v34 = self;
    }
  }
  else
  {
    v57 = [v81 lsBinpref];

    if (!v57) {
      goto LABEL_58;
    }
    xpc_object_t v43 = xpc_array_create(0, 0);
    *(_OWORD *)&value[1] = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    v58 = [v81 lsBinpref];
    uint64_t v59 = [v58 countByEnumeratingWithState:&value[1] objects:v94 count:16];
    if (v59)
    {
      uint64_t v60 = v59;
      uint64_t v61 = *(void *)v87;
      do
      {
        for (uint64_t j = 0; j != v60; ++j)
        {
          if (*(void *)v87 != v61) {
            objc_enumerationMutation(v58);
          }
          xpc_array_set_int64(v43, 0xFFFFFFFFFFFFFFFFLL, [*(id *)(*(void *)&value[3] + 8 * j) unsignedIntegerValue]);
        }
        uint64_t v60 = [v58 countByEnumeratingWithState:&value[1] objects:v94 count:16];
      }
      while (v60);
    }
  }
  xpc_dictionary_set_value(v80, "BinaryOrderPreference", v43);

LABEL_58:
  if ([v81 lsUMask]) {
    xpc_dictionary_set_int64(v80, "Umask", [v81 lsUMask]);
  }
  if ([v38 platform]) {
    xpc_dictionary_set_int64(v80, "Platform", (int)[v38 platform]);
  }
  os_unfair_lock_lock(&v34->_lock);
  if ([(NSMutableOrderedSet *)v34->_lock_reslideIdentities containsObject:v38]) {
    xpc_dictionary_set_BOOL(v80, "ReslideSharedCache", 1);
  }
  os_unfair_lock_unlock(&v34->_lock);
  value[0] = 0;
  personaManager = v34->_personaManager;
  id v85 = 0;
  BOOL v64 = [(RBPersonaManager *)personaManager personaForIdentity:v38 context:v81 personaUID:value personaUniqueString:&v85];
  id v65 = v85;
  if (v64)
  {
    xpc_dictionary_set_int64(v80, "PersonaEnterprise", value[0]);
    v66 = (void *)[v38 copyWithPersonaString:v65];

    id v38 = v66;
    id *v78 = v38;
    id v67 = [v38 description];
    xpc_dictionary_set_string(v80, "_ResourceCoalition", (const char *)[v67 UTF8String]);

    _addRBProperties(v80, v38, v81);
  }
  v68 = [v81 preventContainerization];
  char v69 = [v68 BOOLValue];

  if ((v69 & 1) == 0)
  {
    containerManager = v34->_containerManager;
    id v84 = 0;
    v72 = [(RBContainerManager *)containerManager containerPathForIdentity:v38 context:v81 persona:v65 error:&v84];
    v73 = v84;
    v70 = v73;
    if (v72)
    {
      v74 = (const char *)[v72 fileSystemRepresentation];
      xpc_dictionary_set_string(v80, "SandboxContainer", v74);
      v75 = xpc_dictionary_get_value(v80, "EnvironmentVariables");
      v76 = v75;
      if (v75)
      {
        xpc_dictionary_set_value(v75, "HOME", 0);
        xpc_dictionary_set_value(v76, "CFFIXED_USER_HOME", 0);
        xpc_dictionary_set_value(v76, "TMPDIR", 0);
        xpc_dictionary_set_value(v76, "_DYLD_CLOSURE_HOME", 0);
        xpc_dictionary_set_string(v76, "HOME", v74);
      }
    }
    else
    {
      if (!v73)
      {
LABEL_76:

        goto LABEL_77;
      }
      v76 = rbs_job_log();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_FAULT)) {
        -[RBLaunchdJobManager _addAppPropertiesToData:forIdentity:context:actualIdentity:error:]();
      }
    }

    goto LABEL_76;
  }
  v70 = rbs_job_log();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v96 = v38;
    __int16 v97 = 2114;
    v98 = v81;
    _os_log_impl(&dword_226AB3000, v70, OS_LOG_TYPE_DEFAULT, "'%{public}@' Skipping container path lookup because containerization was prevented (%{public}@)", buf, 0x16u);
  }
LABEL_77:

  return 1;
}

- (void)_addStandardAppPropertiesToData:(id)a3
{
  xpc_object_t xdict = a3;
  xpc_dictionary_set_string(xdict, "UserName", "mobile");
  xpc_dictionary_set_BOOL(xdict, "MaterializeDatalessFiles", 1);
  xpc_dictionary_set_BOOL(xdict, "EnablePressuredExit", 0);
  xpc_dictionary_set_BOOL(xdict, "EnableTransactions", 0);
  xpc_dictionary_set_int64(xdict, "ThrottleInterval", 0x7FFFFFFFLL);
  xpc_dictionary_set_int64(xdict, "ExitTimeOut", 1);
}

uint64_t __60__RBLaunchdJobManager_invokeOnProcessDeath_handler_onQueue___block_invoke_142(uint64_t a1)
{
  return [*(id *)(a1 + 32) monitorOnQueue:*(void *)(a1 + 40) withHandler:*(void *)(a1 + 48)];
}

- (id)_createLaunchdJobWithIdentity:(id)a3 context:(id)a4 actualIdentity:(id *)a5 error:(id *)a6
{
  v125[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  int v11 = [v9 isApplication];
  if (!v10 && v11)
  {
    id v10 = [MEMORY[0x263F644E0] contextWithIdentity:v9];
  }
  if (![v9 isApplication])
  {
    id v19 = 0;
    goto LABEL_52;
  }
  if (!v10) {
    -[RBLaunchdJobManager _createLaunchdJobWithIdentity:context:actualIdentity:error:]();
  }
  id v12 = v10;
  uint64_t v13 = [v12 bundleIdentifier];
  char v14 = rbs_general_log();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  v110 = (void *)v13;
  if (!v13)
  {
    if (v15)
    {
      v20 = [v12 identity];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v20;
      _os_log_impl(&dword_226AB3000, v14, OS_LOG_TYPE_DEFAULT, "Bailing out of _mutateContextIfNeeded for %{public}@", buf, 0xCu);
    }
    id v21 = 0;
    char v22 = 1;
    goto LABEL_50;
  }
  if (v15)
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v13;
    _os_log_impl(&dword_226AB3000, v14, OS_LOG_TYPE_DEFAULT, "_mutateContextIfNeeded called for %{public}@", buf, 0xCu);
  }
  v107 = self;

  int v16 = [v12 _additionalEnvironment];

  xpc_object_t v17 = (void *)MEMORY[0x263EFF9A0];
  v106 = a5;
  if (v16)
  {
    id v18 = [v12 _additionalEnvironment];
    char v14 = [v17 dictionaryWithDictionary:v18];
  }
  else
  {
    char v14 = [MEMORY[0x263EFF9A0] dictionary];
  }
  id v23 = [v12 _overrideExecutablePath];
  if (os_variant_has_internal_content()) {
    int v24 = [v12 isTesting];
  }
  else {
    int v24 = 0;
  }
  uint64_t v25 = [v12 _additionalMachServices];

  uint64_t v26 = (void *)MEMORY[0x263EFF980];
  if (v25)
  {
    xpc_object_t v27 = [v12 _additionalMachServices];
    uint64_t v28 = [v26 arrayWithArray:v27];
  }
  else
  {
    uint64_t v28 = [MEMORY[0x263EFF980] array];
  }
  [v12 _setAdditionalMachServices:v28];
  int v29 = _os_feature_enabled_impl();
  if (v29) {
    int v29 = _os_feature_enabled_impl();
  }
  v108 = (void *)v28;
  if (((v29 | v24) & 1) == 0) {
    [v12 setPreventContainerization:MEMORY[0x263EFFA88]];
  }
  if (v23)
  {
    xpc_object_t v30 = [v12 preventContainerization];
    int v31 = [v30 BOOLValue];

    if (((v31 | v24) & 1) == 0)
    {
      id v32 = rbs_job_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = [v12 bundleIdentifier];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v33;
        __int16 v117 = 2114;
        v118 = v23;
        _os_log_impl(&dword_226AB3000, v32, OS_LOG_TYPE_DEFAULT, "Not pre-containerizing %{public}@ because executable file specified (%{public}@)", buf, 0x16u);
      }
      [v12 setPreventContainerization:MEMORY[0x263EFFA88]];
    }
  }
  v34 = [v12 requiredCacheUUID];
  uint64_t v35 = [v12 requiredSequenceNumber];
  id v36 = rbs_general_log();
  BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
  v109 = (void *)v35;
  if (v23 && !v34 && !v35)
  {
    if (v37)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226AB3000, v36, OS_LOG_TYPE_DEFAULT, "_mutateContextIfNeeded No proxy needed", buf, 2u);
    }
    id v21 = 0;
    char v22 = 1;
    goto LABEL_49;
  }
  v105 = v14;
  if (v37)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226AB3000, v36, OS_LOG_TYPE_DEFAULT, "_mutateContextIfNeeded using proxy", buf, 2u);
  }

  id v36 = [MEMORY[0x263F01868] applicationProxyForIdentifier:v13];
  v104 = [v36 appState];
  if (([v104 isInstalled] & 1) == 0)
  {
    long long v47 = v34;
    long long v48 = (void *)MEMORY[0x263F087E8];
    uint64_t v49 = *MEMORY[0x263F08438];
    v125[0] = *MEMORY[0x263F08320];
    *(void *)buf = @"Unable to load a valid LSApplicationProxy.";
    long long v50 = [NSDictionary dictionaryWithObjects:buf forKeys:v125 count:1];
    unint64_t v51 = [v48 errorWithDomain:v49 code:22 userInfo:v50];

    id v21 = v51;
    long long v44 = rbs_general_log();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226AB3000, v44, OS_LOG_TYPE_DEFAULT, "_mutateContextIfNeeded unable to load a valid LSApplicationProxy.", buf, 2u);
    }
    char v22 = 0;
    v34 = v47;
    goto LABEL_47;
  }
  id v38 = [v36 correspondingApplicationRecord];
  int v39 = [v38 jobLabel];

  if (!v39)
  {
    v68 = [v36 environmentVariables];
    [v14 addEntriesFromDictionary:v68];

    [v12 _setAdditionalEnvironment:v14];
    uint64_t v69 = [v36 canonicalExecutablePath];

    if (!v69)
    {
      _posixErrorWithCodeAndDescription(22, @"Unable to find executable path");
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      long long v44 = rbs_general_log();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226AB3000, v44, OS_LOG_TYPE_DEFAULT, "_mutateContextIfNeeded unable to find xecutable path.", buf, 2u);
      }
      id v23 = 0;
      char v22 = 0;
      goto LABEL_48;
    }
    id v23 = (void *)v69;
    [v12 _setOverrideExecutablePath:v69];
    if (v34)
    {
      long long v44 = [v36 cacheGUID];
    }
    else
    {
      long long v44 = 0;
    }
    if (v109)
    {
      uint64_t v70 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSObject sequenceNumber](v36, "sequenceNumber"));
    }
    else
    {
      uint64_t v70 = 0;
    }
    v101 = (void *)v70;
    if (v34 != v44 && (!v34 || !v44 || ![v34 isEqual:v44])
      || v109 != (void *)v70 && (!v109 || !v70 || ([v109 isEqual:v70] & 1) == 0))
    {
      long long v92 = rbs_job_log();
      if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
      {
        v95 = [v12 bundleIdentifier];
        [v34 UUIDString];
        v97 = id v96 = v34;
        *(_DWORD *)buf = 138544386;
        *(void *)&uint8_t buf[4] = v95;
        __int16 v117 = 2114;
        v118 = v97;
        __int16 v119 = 2114;
        v120 = v109;
        __int16 v121 = 2114;
        v122 = v44;
        __int16 v123 = 2114;
        v124 = v101;
        _os_log_error_impl(&dword_226AB3000, v92, OS_LOG_TYPE_ERROR, "LaunchServices database mismatch: Failed to lookup executable path for app %{public}@ with {UUID: %{public}@, Sequence: %{public}@} vs {UUID: %{public}@, Sequence: %{public}@", buf, 0x34u);

        v34 = v96;
        char v14 = v105;
      }
      _posixErrorWithCodeAndDescription(22, @"Failed to lookup executable path.");
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      char v22 = 0;
      goto LABEL_119;
    }
    v71 = v44;
    v103 = v34;
    v72 = [v36 applicationType];
    v73 = rbs_general_log();
    uint64_t v100 = v72;
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v74 = objc_opt_class();
      v75 = [v36 objectForInfoDictionaryKey:@"SBMachServices" ofClass:v74 valuesOfClass:objc_opt_class()];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v100;
      __int16 v117 = 2114;
      v118 = v75;
      _os_log_impl(&dword_226AB3000, v73, OS_LOG_TYPE_DEFAULT, "_mutateContextIfNeeded bundleType %{public}@ SBMachServices %{public}@", buf, 0x16u);

      v72 = v100;
    }

    if (([v72 isEqualToString:*MEMORY[0x263F01838]] & 1) != 0
      || ([v72 isEqualToString:*MEMORY[0x263F01810]] & 1) != 0
      || [v72 isEqualToString:*MEMORY[0x263F01818]])
    {
      [v12 setSpawnType:1];
      uint64_t v76 = objc_opt_class();
      v77 = [v36 objectForInfoDictionaryKey:@"SBMachServices" ofClass:v76 valuesOfClass:objc_opt_class()];
      if ([v77 count]) {
        [v108 addObjectsFromArray:v77];
      }
    }
    v78 = [v36 correspondingApplicationRecord];
    int v79 = [v78 wasBuiltWithThreadSanitizer];

    if (v79) {
      objc_msgSend(v12, "setExecutionOptions:", objc_msgSend(v12, "executionOptions") | 0x10);
    }
    [v12 _setAdditionalMachServices:v108];
    xpc_object_t v80 = [v12 preventContainerization];

    if (!v80)
    {
      int v81 = [v36 isContainerized];
      v82 = [NSNumber numberWithBool:v81 ^ 1u];
      [v12 setPreventContainerization:v82];
    }
    v83 = [v12 preventContainerization];
    if (([v83 BOOLValue] & 1) == 0)
    {
      id v84 = [v12 containerIdentifier];

      if (v84) {
        goto LABEL_104;
      }
      id v85 = self;
      v83 = [v36 entitlementValueForKey:@"com.apple.private.security.container-required" ofClass:v85];

      [v12 setContainerIdentifier:v83];
      [v12 setCalculatedContainerIdentifier:1];
    }

LABEL_104:
    v86 = [v36 managedPersonas];
    uint64_t v87 = [v86 count];
    v99 = v86;
    if (v87)
    {
      uint64_t v88 = v87;
      long long v89 = [v86 objectAtIndexedSubscript:0];
      long long v90 = rbs_job_log();
      v34 = v103;
      if (v88 != 1)
      {
        v98 = v90;
        long long v44 = v71;
        if (!os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
        {
          char v14 = v105;
          v94 = v100;
          long long v93 = v98;
          goto LABEL_118;
        }
        -[RBLaunchdJobManager _createLaunchdJobWithIdentity:context:actualIdentity:error:]();
        long long v93 = v98;
        char v14 = v105;
LABEL_115:
        v94 = v100;
LABEL_118:

        [v12 setManagedPersona:v89];
        id v21 = 0;
        char v22 = 1;
LABEL_119:

        goto LABEL_48;
      }
      long long v91 = v90;
      long long v44 = v71;
      if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v89;
        _os_log_impl(&dword_226AB3000, v91, OS_LOG_TYPE_INFO, "Persona chosen for bundle identifier: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      long long v91 = rbs_job_log();
      v34 = v103;
      if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v110;
        _os_log_impl(&dword_226AB3000, v91, OS_LOG_TYPE_INFO, "No personas found for bundle identifier: %{public}@", buf, 0xCu);
      }
      long long v89 = 0;
    }
    char v14 = v105;
    long long v93 = v91;
    goto LABEL_115;
  }
  v102 = v34;
  uint64_t v40 = (void *)MEMORY[0x263F087E8];
  uint64_t v41 = *MEMORY[0x263F08438];
  v125[0] = *MEMORY[0x263F08320];
  *(void *)buf = @"Trying to launch a daemon, agent, or angel as an app.";
  v42 = [NSDictionary dictionaryWithObjects:buf forKeys:v125 count:1];
  xpc_object_t v43 = [v40 errorWithDomain:v41 code:22 userInfo:v42];

  id v21 = v43;
  long long v44 = rbs_general_log();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v45 = [v36 correspondingApplicationRecord];
    unint64_t v46 = [v45 jobLabel];
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v46;
    _os_log_impl(&dword_226AB3000, v44, OS_LOG_TYPE_DEFAULT, "_mutateContextIfNeeded Trying to launch %{public}@ as an app", buf, 0xCu);
  }
  char v22 = 0;
  v34 = v102;
LABEL_47:
  char v14 = v105;
LABEL_48:

LABEL_49:
  a5 = v106;
  self = v107;
LABEL_50:

  id v52 = v21;
  id v53 = v52;
  if ((v22 & 1) == 0)
  {
    if (a6)
    {
      id v53 = v52;
      uint64_t v61 = 0;
      *a6 = v53;
    }
    else
    {
      uint64_t v61 = 0;
    }
    goto LABEL_67;
  }
  id v19 = v52;
LABEL_52:
  int64_t v54 = objc_msgSend(v10, "_overrideExecutablePath", v98);

  if (v54)
  {
    id v115 = v19;
    v55 = [(RBLaunchdJobManager *)self _generateDataWithIdentity:v9 context:v10 actualIdentity:a5 error:&v115];
    id v53 = v115;

    if (v55)
    {
      id v56 = *a5;
      if (!*a5) {
        id v56 = v9;
      }
      id v57 = v56;
      logQueue = self->_logQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __82__RBLaunchdJobManager__createLaunchdJobWithIdentity_context_actualIdentity_error___block_invoke;
      block[3] = &unk_2647C7B98;
      id v113 = v57;
      id v59 = v55;
      id v114 = v59;
      id v60 = v57;
      dispatch_async(logQueue, block);
      uint64_t v61 = [(RBLaunchdInterfacing *)self->_launchdInterface jobWithPlist:v59];
    }
    else
    {
      uint64_t v61 = 0;
      if (a6) {
        *a6 = v53;
      }
    }
  }
  else
  {
    if (a6)
    {
      v62 = (void *)MEMORY[0x263F087E8];
      uint64_t v63 = *MEMORY[0x263F08438];
      v125[0] = *MEMORY[0x263F08320];
      *(void *)buf = @"Unable to determine executable path.";
      BOOL v64 = [NSDictionary dictionaryWithObjects:buf forKeys:v125 count:1];
      id v65 = [v62 errorWithDomain:v63 code:22 userInfo:v64];

      id v66 = v65;
      uint64_t v61 = 0;
      *a6 = v66;
    }
    else
    {
      uint64_t v61 = 0;
    }
    id v53 = v19;
  }
LABEL_67:

  return v61;
}

- (id)_generateDataWithIdentity:(id)a3 context:(id)a4 actualIdentity:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
  uint64_t v13 = (void *)MEMORY[0x22A660FC0]();
  _addRBProperties(v12, v10, v11);
  [(RBLaunchdJobManager *)self _addSharedPropertiesToData:v12 forIdentity:v10 context:v11];
  if ([v10 isDext])
  {
    [(RBLaunchdJobManager *)self _addDextPropertiesToData:v12 forIdentity:v10 context:v11];
    id v14 = 0;
LABEL_3:
    id v15 = 0;
LABEL_7:
    id v19 = v12;
    id v17 = v15;
    goto LABEL_8;
  }
  id v21 = 0;
  id v22 = 0;
  BOOL v16 = [(RBLaunchdJobManager *)self _addAppPropertiesToData:v12 forIdentity:v10 context:v11 actualIdentity:&v22 error:&v21];
  id v17 = v22;
  id v14 = v21;
  if (v17)
  {
    id v18 = v17;
    *a5 = v18;
    if (v16)
    {
      id v15 = v18;
      goto LABEL_7;
    }
  }
  else if (v16)
  {
    goto LABEL_3;
  }
  if (a6)
  {
    id v14 = v14;
    id v19 = 0;
    *a6 = v14;
  }
  else
  {
    id v19 = 0;
  }
LABEL_8:

  return v19;
}

void __63__RBLaunchdJobManager__createAndSubmitExtensionJob_UUID_error___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = rbs_job_oversize_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = [*(id *)(a1 + 40) hostPid];
    uint64_t v5 = *(void *)(a1 + 48);
    v6 = _describeXPCObject();
    int v7 = 138544130;
    uint64_t v8 = v3;
    __int16 v9 = 1024;
    int v10 = v4;
    __int16 v11 = 2114;
    uint64_t v12 = v5;
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl(&dword_226AB3000, v2, OS_LOG_TYPE_DEFAULT, "'%{public}@' Submitting extension overlay (host PID %d, path %{public}@):\n%{public}@", (uint8_t *)&v7, 0x26u);
  }
}

void __82__RBLaunchdJobManager__createLaunchdJobWithIdentity_context_actualIdentity_error___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = rbs_job_oversize_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = _describeXPCObject();
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    _os_log_impl(&dword_226AB3000, v2, OS_LOG_TYPE_DEFAULT, "'%{public}@' Constructed job description:\n%{public}@", (uint8_t *)&v5, 0x16u);
  }
}

- (id)createAndLaunchWithIdentity:(id)a3 context:(id)a4 error:(id *)a5
{
  v115[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  int v10 = rbs_job_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v8;
    _os_log_impl(&dword_226AB3000, v10, OS_LOG_TYPE_DEFAULT, "Creating and launching job for: %{public}@", buf, 0xCu);
  }

  int v11 = [v8 hasConsistentLaunchdJob];
  if (v11)
  {
    uint64_t v12 = [v8 consistentLaunchdJobLabel];
    if (v12)
    {
      launchdInterface = self->_launchdInterface;
      id v14 = [MEMORY[0x263F252A0] currentDomain];
      uint64_t v15 = [(RBLaunchdInterfacing *)launchdInterface copyJobWithLabel:v12 domain:v14];

      if (v15)
      {
        BOOL v16 = self->_launchdInterface;
        id v93 = 0;
        id v17 = [(RBLaunchdInterfacing *)v16 propertiesForJob:v15 error:&v93];
        id v18 = v93;
        if (!v17)
        {
          id v32 = rbs_process_log();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
            -[RBLaunchdJobManager createAndLaunchWithIdentity:context:error:].cold.7();
          }
          goto LABEL_30;
        }
        if ([v8 osServiceType] == 3 && objc_msgSend(v17, "serviceType") != 3)
        {
          uint64_t v76 = rbs_process_log();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_FAULT)) {
            -[RBLaunchdJobManager createAndLaunchWithIdentity:context:error:].cold.9();
          }

          v82 = (void *)MEMORY[0x263F087E8];
          uint64_t v80 = *MEMORY[0x263F646B8];
          uint64_t v111 = *MEMORY[0x263F08320];
          id v85 = [NSString stringWithFormat:@"Launchd could not find angel job"];
          v112 = v85;
          v20 = NSDictionary;
          id v21 = &v112;
          id v22 = &v111;
        }
        else
        {
          if ([v8 osServiceType] != 2 || objc_msgSend(v17, "serviceType") != 3) {
            goto LABEL_31;
          }
          id v19 = rbs_process_log();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
            -[RBLaunchdJobManager createAndLaunchWithIdentity:context:error:].cold.8();
          }

          v82 = (void *)MEMORY[0x263F087E8];
          uint64_t v80 = *MEMORY[0x263F646B8];
          uint64_t v109 = *MEMORY[0x263F08320];
          id v85 = [NSString stringWithFormat:@"Launchd found an angel job for requested daemon launch"];
          v110 = v85;
          v20 = NSDictionary;
          id v21 = &v110;
          id v22 = &v109;
        }
        v77 = [v20 dictionaryWithObjects:v21 forKeys:v22 count:1];
        uint64_t v84 = [v82 errorWithDomain:v80 code:4 userInfo:v77];

        id v32 = v15;
        id v18 = (id)v84;
LABEL_29:
        uint64_t v15 = 0;
LABEL_30:

        goto LABEL_31;
      }
      id v36 = (void *)MEMORY[0x263F087E8];
      uint64_t v37 = *MEMORY[0x263F646B8];
      uint64_t v113 = *MEMORY[0x263F08320];
      id v17 = [NSString stringWithFormat:@"Launchd could not find job"];
      id v114 = v17;
      id v32 = [NSDictionary dictionaryWithObjects:&v114 forKeys:&v113 count:1];
      v33 = v36;
      uint64_t v34 = v37;
      uint64_t v35 = 4;
    }
    else
    {
      xpc_object_t v30 = (void *)MEMORY[0x263F087E8];
      uint64_t v31 = *MEMORY[0x263F646B8];
      uint64_t v107 = *MEMORY[0x263F08320];
      id v17 = [NSString stringWithFormat:@"Identity doesn't have required label"];
      v108 = v17;
      id v32 = [NSDictionary dictionaryWithObjects:&v108 forKeys:&v107 count:1];
      v33 = v30;
      uint64_t v34 = v31;
      uint64_t v35 = 3;
    }
    id v18 = [v33 errorWithDomain:v34 code:v35 userInfo:v32];
    goto LABEL_29;
  }
  if ([v8 isExtension])
  {
    id v23 = [v8 uuid];
    id v92 = 0;
    uint64_t v15 = [(RBLaunchdJobManager *)self _createAndSubmitExtensionJob:v9 UUID:v23 error:&v92];
    id v18 = v92;

    uint64_t v12 = rbs_general_log();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
      goto LABEL_32;
    }
    id v17 = [v15 handle];
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v17;
    _os_log_impl(&dword_226AB3000, v12, OS_LOG_TYPE_INFO, "submitted extension job %{public}@", buf, 0xCu);
LABEL_31:

LABEL_32:
    if (v15)
    {
      id v86 = v9;
      int v29 = v11 ^ 1;
      id v88 = v18;
      xpc_object_t v27 = &v88;
      uint64_t v28 = [v15 start:&v88];
LABEL_34:
      id v38 = *v27;

      if (v28)
      {
        if ([v28 state] == 2)
        {
          if ((int)[v28 pid] > 0) {
            goto LABEL_62;
          }
          v83 = self;
          int v39 = a5;
          int v40 = v29;
          uint64_t v41 = rbs_general_log();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
            -[RBLaunchdJobManager createAndLaunchWithIdentity:context:error:].cold.5(v28);
          }

          v42 = (void *)MEMORY[0x263F087E8];
          uint64_t v43 = *MEMORY[0x263F646B8];
          uint64_t v94 = *MEMORY[0x263F08320];
          uint64_t v44 = [NSString stringWithFormat:@"Launchd job spawn failed for unknown reason"];
          uint64_t v95 = v44;
          uint64_t v45 = NSDictionary;
          unint64_t v46 = &v95;
          long long v47 = &v94;
        }
        else
        {
          v83 = self;
          int v39 = a5;
          int v40 = v29;
          switch([v28 state])
          {
            case 1:
              goto LABEL_58;
            case 2:
              abort();
            case 3:
              uint64_t v55 = (int)[v28 lastSpawnError];
              id v56 = (void *)MEMORY[0x263F087E8];
              uint64_t v57 = *MEMORY[0x263F08438];
              v115[0] = *MEMORY[0x263F08320];
              *(void *)buf = @"Launchd job spawn failed";
              v58 = [NSDictionary dictionaryWithObjects:buf forKeys:v115 count:1];
              uint64_t v54 = [v56 errorWithDomain:v57 code:v55 userInfo:v58];

              goto LABEL_61;
            case 4:
              int v79 = (void *)MEMORY[0x263F087E8];
              uint64_t v78 = *MEMORY[0x263F646B8];
              uint64_t v98 = *MEMORY[0x263F08320];
              id v65 = NSString;
              int v81 = [v28 lastExitStatus];
              uint64_t v66 = objc_msgSend(v81, "os_reason_namespace");
              id v67 = [v28 lastExitStatus];
              v68 = objc_msgSend(v65, "stringWithFormat:", @"Launchd job spawn immediately exited with namespace %d code %lld", v66, objc_msgSend(v67, "os_reason_code"));
              v99 = v68;
              uint64_t v69 = [NSDictionary dictionaryWithObjects:&v99 forKeys:&v98 count:1];
              uint64_t v54 = [v79 errorWithDomain:v78 code:0 userInfo:v69];

              id v38 = v81;
              goto LABEL_61;
            default:
              uint64_t v63 = rbs_general_log();
              if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
                -[RBLaunchdJobManager createAndLaunchWithIdentity:context:error:].cold.6(v28);
              }
              int v40 = v29;

LABEL_58:
              v42 = (void *)MEMORY[0x263F087E8];
              uint64_t v43 = *MEMORY[0x263F646B8];
              uint64_t v96 = *MEMORY[0x263F08320];
              uint64_t v44 = [NSString stringWithFormat:@"Launchd job spawn failed for unknown reason"];
              uint64_t v97 = v44;
              uint64_t v45 = NSDictionary;
              unint64_t v46 = &v97;
              long long v47 = &v96;
              break;
          }
        }
        BOOL v64 = [v45 dictionaryWithObjects:v46 forKeys:v47 count:1];
        uint64_t v54 = [v42 errorWithDomain:v43 code:0 userInfo:v64];

        id v38 = (id)v44;
      }
      else
      {
        if (v38) {
          goto LABEL_63;
        }
        v83 = self;
        int v39 = a5;
        int v40 = v29;
        long long v50 = rbs_general_log();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
          -[RBLaunchdJobManager createAndLaunchWithIdentity:context:error:].cold.4(v50);
        }

        unint64_t v51 = (void *)MEMORY[0x263F087E8];
        uint64_t v52 = *MEMORY[0x263F646B8];
        uint64_t v100 = *MEMORY[0x263F08320];
        id v38 = [NSString stringWithFormat:@"Launchd job spawn failed for unknown reason"];
        id v101 = v38;
        id v53 = [NSDictionary dictionaryWithObjects:&v101 forKeys:&v100 count:1];
        uint64_t v54 = [v51 errorWithDomain:v52 code:0 userInfo:v53];
      }
LABEL_61:

      id v38 = (id)v54;
      int v29 = v40;
      a5 = v39;
      self = v83;
LABEL_62:
      if (!v38)
      {
        uint64_t v74 = objc_msgSend(MEMORY[0x263F64580], "identifierWithPid:", objc_msgSend(v28, "pid"));
        if (v29)
        {
          os_unfair_lock_lock(&self->_lock);
          [(NSMutableDictionary *)self->_lock_jobsByIdentifier setObject:v15 forKey:v74];
          os_unfair_lock_unlock(&self->_lock);
        }
        uint64_t v49 = [MEMORY[0x263F645A8] instanceWithIdentifier:v74 identity:v8];
        id v73 = 0;
        id v9 = v86;
        goto LABEL_79;
      }
LABEL_63:
      uint64_t v70 = rbs_general_log();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
        -[RBLaunchdJobManager createAndLaunchWithIdentity:context:error:]();
      }

      id v9 = v86;
      if (a5) {
        *a5 = v38;
      }
      if (!v29)
      {
        uint64_t v49 = 0;
        goto LABEL_80;
      }
      v71 = rbs_general_log();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226AB3000, v71, OS_LOG_TYPE_INFO, "Removing job after failed start", buf, 2u);
      }

      id v87 = v38;
      char v72 = [v15 remove:&v87];
      id v73 = v87;

      if (v72)
      {
        uint64_t v49 = 0;
        id v38 = v73;
        id v9 = v86;
LABEL_80:

        id v18 = v38;
        goto LABEL_81;
      }
      uint64_t v74 = rbs_general_log();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
        -[RBLaunchdJobManager createAndLaunchWithIdentity:context:error:]();
      }
      uint64_t v49 = 0;
      id v9 = v86;
LABEL_79:

      id v38 = v73;
      goto LABEL_80;
    }
    goto LABEL_40;
  }
  id v90 = 0;
  id v91 = 0;
  uint64_t v15 = [(RBLaunchdJobManager *)self _createLaunchdJobWithIdentity:v8 context:v9 actualIdentity:&v91 error:&v90];
  id v24 = v91;
  id v18 = v90;
  if (_os_feature_enabled_impl() && v24 && v24 != v8 && ([v24 isEqual:v8] & 1) == 0)
  {
    uint64_t v25 = rbs_job_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v8;
      __int16 v105 = 2114;
      id v106 = v24;
      _os_log_impl(&dword_226AB3000, v25, OS_LOG_TYPE_DEFAULT, "Adjusting identity of job from %{public}@ to %{public}@", buf, 0x16u);
    }

    id v26 = v24;
    id v8 = v26;
  }

  if (v15)
  {
    id v86 = v9;
    id v89 = v18;
    xpc_object_t v27 = &v89;
    uint64_t v28 = [v15 submitAndStart:&v89];
    int v29 = 1;
    goto LABEL_34;
  }
LABEL_40:
  long long v48 = rbs_general_log();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
    -[RBLaunchdJobManager createAndLaunchWithIdentity:context:error:]();
  }

  if (a5)
  {
    if (v18)
    {
      id v18 = v18;
      uint64_t v49 = 0;
      *a5 = v18;
      goto LABEL_81;
    }
    id v59 = (void *)MEMORY[0x263F087E8];
    uint64_t v60 = *MEMORY[0x263F646B8];
    uint64_t v102 = *MEMORY[0x263F08320];
    uint64_t v61 = [NSString stringWithFormat:@"Launchd job spawn failed to create job"];
    v103 = v61;
    v62 = [NSDictionary dictionaryWithObjects:&v103 forKeys:&v102 count:1];
    *a5 = [v59 errorWithDomain:v60 code:0 userInfo:v62];

    id v18 = 0;
  }
  uint64_t v49 = 0;
LABEL_81:

  return v49;
}

void __60__RBLaunchdJobManager_invokeOnProcessDeath_handler_onQueue___block_invoke(uint64_t a1, void *a2, int a3)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = v5;
  if (v5)
  {
    if ([v5 pid])
    {
      int v7 = [v6 pid];
      id v8 = (id *)(a1 + 32);
      if (v7 != objc_msgSend(*(id *)(a1 + 32), "rbs_pid"))
      {
        id v9 = [*v8 identity];
        int v10 = [v9 isApplication];

        int v11 = rbs_general_log();
        uint64_t v12 = v11;
        if (v10)
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
            __60__RBLaunchdJobManager_invokeOnProcessDeath_handler_onQueue___block_invoke_cold_4((uint64_t *)(a1 + 32), v6, v12);
          }
        }
        else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          id v22 = *v8;
          int v35 = 138543618;
          id v36 = v22;
          __int16 v37 = 1024;
          int v38 = [v6 pid];
          _os_log_impl(&dword_226AB3000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ reported with incorrect pid %d", (uint8_t *)&v35, 0x12u);
        }
      }
    }
    id v14 = 0;
    switch([v6 state])
    {
      case 1:
        id v14 = rbs_general_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v23 = *(void **)(a1 + 32);
          int v35 = 138543362;
          id v36 = v23;
          id v24 = "%{public}@ reported to RB as never ran";
          goto LABEL_21;
        }
        break;
      case 2:
        id v14 = rbs_general_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v25 = *(void **)(a1 + 32);
          int v35 = 138543362;
          id v36 = v25;
          id v24 = "%{public}@ reported to RB as running";
LABEL_21:
          _os_log_impl(&dword_226AB3000, v14, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&v35, 0xCu);
        }
        break;
      case 3:
        goto LABEL_26;
      case 4:
        id v14 = [v6 lastExitStatus];
        if (!v14)
        {
          id v26 = rbs_general_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
            __60__RBLaunchdJobManager_invokeOnProcessDeath_handler_onQueue___block_invoke_cold_3(a1, v26, v27, v28, v29, v30, v31, v32);
          }

          id v14 = 0;
        }
LABEL_26:
        v33 = *(void **)(a1 + 48);
        uint64_t v34 = [*(id *)(a1 + 32) identity];
        [v33 _addReslideIdentityIfNeeded:v34 exitStatus:v14];

        _handleDeath(*(void **)(a1 + 32), *(void **)(a1 + 56), v14);
        [*(id *)(a1 + 40) cancelMonitor];
        break;
      default:
        id v14 = rbs_general_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
          __60__RBLaunchdJobManager_invokeOnProcessDeath_handler_onQueue___block_invoke_cold_2(a1, v6, v14);
        }
        break;
    }
LABEL_29:

    goto LABEL_30;
  }
  __int16 v13 = rbs_general_log();
  id v14 = v13;
  if (a3 != 113)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      __60__RBLaunchdJobManager_invokeOnProcessDeath_handler_onQueue___block_invoke_cold_1(a1, v14, v16, v17, v18, v19, v20, v21);
    }
    goto LABEL_29;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = *(void **)(a1 + 32);
    int v35 = 138543362;
    id v36 = v15;
    _os_log_impl(&dword_226AB3000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ job reported to RB as removed", (uint8_t *)&v35, 0xCu);
  }

  _handleDeath(*(void **)(a1 + 32), *(void **)(a1 + 56), 0);
  [*(id *)(a1 + 40) cancelMonitor];
LABEL_30:
}

- (void)invokeOnProcessDeath:(id)a3 handler:(id)a4 onQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  os_unfair_lock_lock(&self->_lock);
  int v11 = [v8 identifier];
  uint64_t v12 = [(NSMutableDictionary *)self->_lock_monitoredJobsByIdentifier objectForKey:v11];

  if (v12)
  {
    __int16 v13 = rbs_process_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[RBLaunchdJobManager invokeOnProcessDeath:handler:onQueue:](v8);
    }
  }
  uint64_t v14 = [(NSMutableDictionary *)self->_lock_jobsByIdentifier objectForKey:v11];
  if (!v14)
  {
    if ((int)[v11 pid] <= 0)
    {
      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      uint64_t v15 = (void *)-[RBLaunchdInterfacing copyJobWithPid:](self->_launchdInterface, "copyJobWithPid:", [v11 pid]);
      os_unfair_lock_unlock(&self->_lock);
      if (v15) {
        goto LABEL_7;
      }
    }
    [v8 invokeHandlerOnProcessDeath:v9 onQueue:v10];
    goto LABEL_13;
  }
  uint64_t v15 = (void *)v14;
  [(NSMutableDictionary *)self->_lock_monitoredJobsByIdentifier setObject:v14 forKey:v11];
  [(NSMutableDictionary *)self->_lock_jobsByIdentifier removeObjectForKey:v11];
  os_unfair_lock_unlock(&self->_lock);
LABEL_7:
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __60__RBLaunchdJobManager_invokeOnProcessDeath_handler_onQueue___block_invoke;
  v24[3] = &unk_2647C8180;
  id v25 = v8;
  id v28 = v9;
  id v16 = v15;
  id v26 = v16;
  uint64_t v27 = self;
  uint64_t v17 = (void *)MEMORY[0x22A6611D0](v24);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__RBLaunchdJobManager_invokeOnProcessDeath_handler_onQueue___block_invoke_142;
  block[3] = &unk_2647C7F68;
  id v21 = v16;
  id v22 = v10;
  id v23 = v17;
  id v18 = v17;
  id v19 = v16;
  dispatch_async(v22, block);

LABEL_13:
}

- (id)_createAndSubmitExtensionJob:(id)a3 UUID:(id)a4 error:(id *)a5
{
  v62[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 extensionOverlay];
  if (v10)
  {
    uint64_t v11 = _CFXPCCreateXPCObjectFromCFObject();
    uint64_t v12 = (void *)v11;
    if (!v11 || (uint64_t v13 = MEMORY[0x22A661A50](v11), v14 = MEMORY[0x263EF8708], v13 != MEMORY[0x263EF8708]))
    {
      if (a5)
      {
        uint64_t v15 = (void *)MEMORY[0x263F087E8];
        uint64_t v16 = *MEMORY[0x263F08438];
        *(void *)buf = *MEMORY[0x263F08320];
        v62[0] = @"Unable to launch extension using invalid overlay (not a dictionary)";
        uint64_t v17 = [NSDictionary dictionaryWithObjects:v62 forKeys:buf count:1];
        id v18 = [v15 errorWithDomain:v16 code:22 userInfo:v17];

        id v19 = 0;
        *a5 = v18;
      }
      else
      {
        id v19 = 0;
      }
      goto LABEL_44;
    }
    uint64_t v24 = xpc_dictionary_get_dictionary(v12, "XPCService");
    id v25 = (void *)v24;
    if (!v24 || MEMORY[0x22A661A50](v24) != v14)
    {
      if (a5)
      {
        id v26 = (void *)MEMORY[0x263F087E8];
        uint64_t v27 = *MEMORY[0x263F08438];
        *(void *)buf = *MEMORY[0x263F08320];
        v62[0] = @"Unable to launch extension using invalid overlay (missing XPCService dict)";
        id v28 = [NSDictionary dictionaryWithObjects:v62 forKeys:buf count:1];
        uint64_t v29 = [v26 errorWithDomain:v27 code:22 userInfo:v28];

        uint64_t v30 = (void *)v29;
LABEL_13:
        id v19 = 0;
        *a5 = v30;
LABEL_43:

LABEL_44:
        goto LABEL_45;
      }
LABEL_35:
      id v19 = 0;
      goto LABEL_43;
    }
    xpc_dictionary_set_string(v25, "_ManagedBy", "com.apple.runningboard");
    uint64_t v31 = [v8 identity];
    _addRBProperties(v25, v31, v8);

    uint64_t v32 = [v8 identity];
    v33 = [v32 personaString];

    if (v33)
    {
      if ([(RBLaunchdJobManager *)self _addPersonaFromExtensionContext:v8 toServiceDict:v25])
      {
        if ([(RBLaunchdJobManager *)self _addContainerPropertiesFromExtensionContext:v8 toServiceDict:v25])
        {
          goto LABEL_18;
        }
        if (!a5) {
          goto LABEL_35;
        }
        long long v47 = @"Unable to launch extension (could not add container path to overlay)";
      }
      else
      {
        if (!a5) {
          goto LABEL_35;
        }
        long long v47 = @"Unable to launch extension (could not get persona values for overlay)";
      }
      uint64_t v30 = _posixErrorWithCodeAndDescription(22, v47);
      goto LABEL_13;
    }
LABEL_18:
    uint64_t v34 = [v8 _overrideExecutablePath];
    if (v34)
    {
      logQueue = self->_logQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __63__RBLaunchdJobManager__createAndSubmitExtensionJob_UUID_error___block_invoke;
      block[3] = &unk_2647C8130;
      id v9 = v9;
      id v57 = v9;
      id v36 = v8;
      id v58 = v36;
      long long v50 = v34;
      id v51 = v34;
      id v59 = v51;
      id v37 = v12;
      id v60 = v37;
      dispatch_async(logQueue, block);
      uint64_t v49 = v36;
      uint64_t v38 = -[RBLaunchdInterfacing domainForPid:](self->_launchdInterface, "domainForPid:", [v36 hostPid]);
      launchdInterface = self->_launchdInterface;
      id v55 = 0;
      int v40 = [(RBLaunchdInterfacing *)launchdInterface submitExtension:v51 overlay:v37 domain:v38 error:&v55];
      id v41 = v55;
      id v42 = v41;
      id v53 = (void *)v38;
      if (v40)
      {
        if (v9 || ([v49 oneShotUUID], (id v9 = (id)objc_claimAutoreleasedReturnValue()) != 0))
        {
          uint64_t v52 = v42;
          v62[0] = 0;
          v62[1] = 0;
          [v9 getUUIDBytes:v62];
          uint64_t v43 = rbs_job_log();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v9;
            _os_log_impl(&dword_226AB3000, v43, OS_LOG_TYPE_INFO, "Setting one-shot instance on launch: %{public}@", buf, 0xCu);
          }

          uint64_t v44 = [(RBLaunchdInterfacing *)self->_launchdInterface instancePropertiesFromOverlay:v10];
          uint64_t v45 = self->_launchdInterface;
          id v54 = 0;
          id v19 = [(RBLaunchdInterfacing *)v45 forJob:v40 createInstance:v62 properties:v44 error:&v54];
          id v46 = v54;

          if (a5 && !v19) {
            *a5 = v46;
          }
        }
        else
        {
          id v46 = v42;
          id v19 = v40;
        }
      }
      else if (a5)
      {
        id v46 = v41;
        id v19 = 0;
        *a5 = v46;
      }
      else
      {
        id v19 = 0;
        id v46 = v41;
      }
      uint64_t v34 = v50;
    }
    else if (a5)
    {
      _posixErrorWithCodeAndDescription(22, @"Unable to launch extension without path");
      id v19 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v19 = 0;
    }

    goto LABEL_43;
  }
  if (a5)
  {
    uint64_t v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v21 = *MEMORY[0x263F08438];
    *(void *)buf = *MEMORY[0x263F08320];
    v62[0] = @"Unable to launch extension without overlay";
    id v22 = [NSDictionary dictionaryWithObjects:v62 forKeys:buf count:1];
    id v23 = [v20 errorWithDomain:v21 code:22 userInfo:v22];

    id v19 = 0;
    *a5 = v23;
  }
  else
  {
    id v19 = 0;
  }
LABEL_45:

  return v19;
}

- (BOOL)_addPersonaFromExtensionContext:(id)a3 toServiceDict:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(RBPersonaManager *)self->_personaManager personaRequiredForExtensionContext:v6 serviceDict:v7])goto LABEL_4; {
  LODWORD(value) = -1;
  }
  personaManager = self->_personaManager;
  id v9 = [v6 identity];
  BOOL v10 = [(RBPersonaManager *)personaManager personaForIdentity:v9 context:v6 personaUID:&value personaUniqueString:0];

  if (v10)
  {
    xpc_dictionary_set_int64(v7, "PersonaEnterprise", value);
LABEL_4:
    LOBYTE(v10) = 1;
  }

  return v10;
}

- (BOOL)_addContainerPropertiesFromExtensionContext:(id)a3 toServiceDict:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(RBContainerManager *)self->_containerManager containerRequiredForServiceDict:v7])
  {
    uint64_t v8 = [(RBContainerManager *)self->_containerManager sandboxContainerURLForExtensionContext:v6 containerOverrideIdentifier:0];
    if (!v8)
    {
      BOOL v10 = 0;
      goto LABEL_6;
    }
    id v9 = (void *)v8;
    [(RBLaunchdJobManager *)self _addExtensionContainerURL:v8 toServiceDict:v7];
    [(RBLaunchdJobManager *)self _addExtensionEnvironmentFromContainerURL:v9 toServiceDict:v7];
  }
  BOOL v10 = 1;
LABEL_6:

  return v10;
}

- (void)_addReslideIdentityIfNeeded:(id)a3 exitStatus:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([v7 isApplication] && (objc_msgSend(v6, "os_reason_flags") & 0x400) != 0)
  {
    os_unfair_lock_lock(&self->_lock);
    [(NSMutableOrderedSet *)self->_lock_reslideIdentities removeObject:v7];
    [(NSMutableOrderedSet *)self->_lock_reslideIdentities addObject:v7];
    if ((unint64_t)[(NSMutableOrderedSet *)self->_lock_reslideIdentities count] >= 0x1A) {
      [(NSMutableOrderedSet *)self->_lock_reslideIdentities removeObjectAtIndex:0];
    }
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (BOOL)removeJobWithInstance:(id)a3 error:(id *)a4
{
  return [(RBLaunchdJobManager *)self _removeJobWithInstance:a3 orJob:0 error:a4];
}

- (BOOL)_removeJobWithInstance:(id)a3 orJob:(id)a4 error:(id *)a5
{
  v45[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  BOOL v10 = a4;
  if (!v9)
  {
    id v42 = [MEMORY[0x263F08690] currentHandler];
    [v42 handleFailureInMethod:a2, self, @"RBLaunchdJobManager.m", 1166, @"Invalid parameter not satisfying: %@", @"instance" object file lineNumber description];
  }
  uint64_t v11 = rbs_job_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v9;
    _os_log_impl(&dword_226AB3000, v11, OS_LOG_TYPE_INFO, "Cleaning out %{public}@ from job manager", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  if (v10)
  {
LABEL_9:
    os_unfair_lock_unlock(&self->_lock);
    uint64_t v20 = [v9 identity];
    if (([v20 isApplication] & 1) == 0 && !objc_msgSend(v20, "isDext"))
    {
      BOOL v26 = 1;
LABEL_32:

      goto LABEL_33;
    }
    if (([v20 isXPCService] & 1) != 0
      || [(RBLaunchdJobManager *)self _isRunningBoardLaunched:v10])
    {
      uint64_t v21 = rbs_job_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v9;
        _os_log_impl(&dword_226AB3000, v21, OS_LOG_TYPE_DEFAULT, "Removing launch job for: %{public}@", buf, 0xCu);
      }

      id v43 = 0;
      char v22 = [v10 remove:&v43];
      id v23 = v43;
      uint64_t v24 = v23;
      if ((v22 & 1) != 0 || [v23 code] == 36)
      {
        id v25 = rbs_job_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v9;
          _os_log_impl(&dword_226AB3000, v25, OS_LOG_TYPE_DEFAULT, "Removed job for %{public}@", buf, 0xCu);
        }
        BOOL v26 = 1;
        goto LABEL_30;
      }
      v33 = rbs_general_log();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
        -[RBLaunchdJobManager _removeJobWithInstance:orJob:error:]();
      }

      if (a5)
      {
        uint64_t v34 = [NSString stringWithFormat:@"Unable to delete job with label %@", v9];
        uint64_t v35 = [v24 code];
        id v36 = (void *)MEMORY[0x263F087E8];
        uint64_t v37 = *MEMORY[0x263F08438];
        v45[0] = *MEMORY[0x263F08320];
        *(void *)buf = v34;
        uint64_t v38 = NSDictionary;
        id v25 = v34;
        uint64_t v39 = [v38 dictionaryWithObjects:buf forKeys:v45 count:1];
        int v40 = [v36 errorWithDomain:v37 code:v35 userInfo:v39];

        id v32 = v40;
        goto LABEL_29;
      }
    }
    else
    {
      uint64_t v27 = rbs_general_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
        -[RBLaunchdJobManager _removeJobWithInstance:orJob:error:]();
      }

      if (a5)
      {
        id v25 = [NSString stringWithFormat:@"Unable to delete job not submitted by RunningBoard"];
        id v28 = (void *)MEMORY[0x263F087E8];
        uint64_t v29 = *MEMORY[0x263F08438];
        v45[0] = *MEMORY[0x263F08320];
        *(void *)buf = v25;
        uint64_t v30 = [NSDictionary dictionaryWithObjects:buf forKeys:v45 count:1];
        uint64_t v31 = [v28 errorWithDomain:v29 code:-1 userInfo:v30];

        id v32 = v31;
        uint64_t v24 = 0;
LABEL_29:
        BOOL v26 = 0;
        *a5 = v32;
LABEL_30:

LABEL_31:
        goto LABEL_32;
      }
      uint64_t v24 = 0;
    }
    BOOL v26 = 0;
    goto LABEL_31;
  }
  lock_monitoredJobsByIdentifier = self->_lock_monitoredJobsByIdentifier;
  uint64_t v13 = [v9 identifier];
  BOOL v10 = [(NSMutableDictionary *)lock_monitoredJobsByIdentifier objectForKey:v13];

  if (v10
    || (uint64_t v14 = self->_lock_jobsByIdentifier,
        [v9 identifier],
        uint64_t v15 = objc_claimAutoreleasedReturnValue(),
        [(NSMutableDictionary *)v14 objectForKey:v15],
        BOOL v10 = objc_claimAutoreleasedReturnValue(),
        v15,
        v10))
  {
    lock_jobsByIdentifier = self->_lock_jobsByIdentifier;
    uint64_t v17 = [v9 identifier];
    [(NSMutableDictionary *)lock_jobsByIdentifier removeObjectForKey:v17];

    id v18 = self->_lock_monitoredJobsByIdentifier;
    id v19 = [v9 identifier];
    [(NSMutableDictionary *)v18 removeObjectForKey:v19];

    goto LABEL_9;
  }
  os_unfair_lock_unlock(&self->_lock);
  BOOL v10 = rbs_general_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v9;
    _os_log_impl(&dword_226AB3000, v10, OS_LOG_TYPE_DEFAULT, "removeJobWithInstance called for identity without existing job %{public}@", buf, 0xCu);
  }
  BOOL v26 = 1;
LABEL_33:

  return v26;
}

+ (id)lastExitStatusForLabel:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = v5;
  if (!v5)
  {
LABEL_10:
    BOOL v10 = 0;
    goto LABEL_11;
  }
  id v7 = v5;
  [v7 UTF8String];
  int last_exit_reason_4SB = _launch_get_last_exit_reason_4SB();
  if (!last_exit_reason_4SB)
  {
    id v19 = rbs_job_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v24 = v7;
      _os_log_impl(&dword_226AB3000, v19, OS_LOG_TYPE_DEFAULT, "Launchd says label %{public}@ has never exited", buf, 0xCu);
    }

    goto LABEL_10;
  }
  int v9 = last_exit_reason_4SB;
  BOOL v10 = [MEMORY[0x263F64568] statusWithDomain:0 code:0];
  uint64_t v11 = xpc_strerror();
  uint64_t v12 = rbs_job_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543874;
    id v24 = v7;
    __int16 v25 = 2080;
    uint64_t v26 = v11;
    __int16 v27 = 1024;
    int v28 = v9;
    _os_log_error_impl(&dword_226AB3000, v12, OS_LOG_TYPE_ERROR, "failed to get process exit details for %{public}@ : %s (%d)", buf, 0x1Cu);
  }

  if (a4)
  {
    uint64_t v13 = [NSString stringWithFormat:@"Unable to get process exit details for label %@", v7];
    uint64_t v14 = [NSString stringWithUTF8String:v11];
    uint64_t v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = *MEMORY[0x263F08438];
    uint64_t v17 = *MEMORY[0x263F08338];
    v21[0] = *MEMORY[0x263F08320];
    v21[1] = v17;
    v22[0] = v13;
    v22[1] = v14;
    id v18 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    *a4 = [v15 errorWithDomain:v16 code:v9 userInfo:v18];
  }
LABEL_11:

  return v10;
}

- (RBLaunchdJobManager)initWithLaunchdInterface:(id)a3 personaManager:(id)a4 containerManager:(id)a5 bundlePropertiesManager:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v27.receiver = self;
  v27.super_class = (Class)RBLaunchdJobManager;
  uint64_t v15 = [(RBLaunchdJobManager *)&v27 init];
  if (v15)
  {
    uint64_t v16 = [MEMORY[0x263EFF9A0] dictionary];
    lock_jobsByIdentifier = v15->_lock_jobsByIdentifier;
    v15->_lock_jobsByIdentifier = (NSMutableDictionary *)v16;

    uint64_t v18 = [MEMORY[0x263EFF9A0] dictionary];
    lock_monitoredJobsByIdentifier = v15->_lock_monitoredJobsByIdentifier;
    v15->_lock_monitoredJobsByIdentifier = (NSMutableDictionary *)v18;

    v15->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v15->_launchdInterface, a3);
    objc_storeStrong((id *)&v15->_personaManager, a4);
    objc_storeStrong((id *)&v15->_containerManager, a5);
    objc_storeStrong((id *)&v15->_bundlePropertiesManager, a6);
    uint64_t v20 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x263EFF9B0]);
    lock_reslideIdentities = v15->_lock_reslideIdentities;
    v15->_lock_reslideIdentities = v20;

    char v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v23 = dispatch_queue_create("com.apple.runningboard.launchdLogging", v22);
    logQueue = v15->_logQueue;
    v15->_logQueue = (OS_dispatch_queue *)v23;

    __int16 v25 = v15;
  }

  return v15;
}

- (void)_addDextPropertiesToData:(id)a3 forIdentity:(id)a4 context:(id)a5
{
  xpc_object_t xdict = a3;
  id v7 = a4;
  id v8 = a5;
  char v9 = [v8 executionOptions];
  xpc_dictionary_set_string(xdict, "ProcessType", "Driver");
  xpc_dictionary_set_BOOL(xdict, "RunAtLoad", 1);
  xpc_dictionary_set_BOOL(xdict, "LaunchOnlyOnce", 1);
  xpc_dictionary_set_string(xdict, "UserName", "_driverkit");
  xpc_dictionary_set_string(xdict, "SandboxProfile", "com.apple.dext");
  xpc_dictionary_set_BOOL(xdict, "_NullBootstrapPort", 1);
  if ((v9 & 0x40) != 0)
  {
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v10, "Core", 0x7FFFFFFFFFFFFFFFuLL);
    xpc_dictionary_set_value(xdict, "HardResourceLimits", v10);
    xpc_dictionary_set_value(xdict, "SoftResourceLimits", v10);
  }
  id v11 = [v7 dextServerName];

  if (v11)
  {
    id v12 = [v7 dextServerName];
    xpc_dictionary_set_string(xdict, "_JetsamPropertiesIdentifier", (const char *)[v12 UTF8String]);
  }
  if ((v9 & 0x20) != 0) {
    xpc_dictionary_set_BOOL(xdict, "ReslideSharedCache", 1);
  }
  [v8 dextCheckInPort];
  xpc_dictionary_set_mach_send();
}

- (void)_addExtensionEnvironmentFromContainerURL:(id)a3 toServiceDict:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v10 = v5;
  id v7 = (const char *)[v10 fileSystemRepresentation];
  id v8 = xpc_dictionary_get_dictionary(v6, "EnvironmentVariables");
  if (!v8)
  {
    id v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(v6, "EnvironmentVariables", v8);
  }
  if (!xpc_dictionary_get_string(v8, "HOME"))
  {
    xpc_dictionary_set_string(v8, "HOME", v7);
    xpc_dictionary_set_string(v8, "CFFIXED_USER_HOME", v7);
    id v9 = [v10 URLByAppendingPathComponent:@"tmp"];
    xpc_dictionary_set_string(v8, "TMPDIR", (const char *)[v9 fileSystemRepresentation]);
  }
}

- (void)_addExtensionContainerURL:(id)a3 toServiceDict:(id)a4
{
  id v5 = a3;
  xpc_object_t xdict = a4;
  xpc_dictionary_set_string(xdict, "_SandboxContainer", (const char *)[v5 fileSystemRepresentation]);
}

- (id)_containerURLForExtensionContext:(id)a3
{
  id v4 = a3;
  bundlePropertiesManager = self->_bundlePropertiesManager;
  id v6 = [v4 identity];
  id v7 = [(RBBundlePropertiesManaging *)bundlePropertiesManager propertiesForIdentity:v6 identifier:0];

  uint64_t v8 = [v7 containerOverrideIdentifier];
  id v9 = [v4 identity];
  uint64_t v10 = [v9 personaString];
  uint64_t v11 = v10 | v8;

  if (v11) {
    [(RBContainerManager *)self->_containerManager sandboxContainerURLForExtensionContext:v4 containerOverrideIdentifier:v8];
  }
  else {
  id v12 = [v7 dataContainerURL];
  }

  return v12;
}

- (BOOL)_isRunningBoardLaunched:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  launchdInterface = self->_launchdInterface;
  id v15 = 0;
  id v4 = [(RBLaunchdInterfacing *)launchdInterface propertiesForJob:a3 error:&v15];
  id v5 = v15;
  if (v4)
  {
    uint64_t v6 = [v4 additionalProperties];
    id v7 = v6;
    if (v6 && (uint64_t v8 = MEMORY[0x22A661A50](v6), v9 = MEMORY[0x263EF8708], v8 == MEMORY[0x263EF8708]))
    {
      uint64_t v12 = xpc_dictionary_get_value(v7, "RunningBoard");
      uint64_t v10 = v12;
      if (v12 && MEMORY[0x22A661A50](v12) == v9)
      {
        BOOL v11 = xpc_dictionary_get_BOOL(v10, "RunningBoardLaunched");
        goto LABEL_15;
      }
      id v13 = rbs_general_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226AB3000, v13, OS_LOG_TYPE_INFO, "_isRunningBoardLaunched has no RBProperties", buf, 2u);
      }
    }
    else
    {
      uint64_t v10 = rbs_general_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226AB3000, v10, OS_LOG_TYPE_INFO, "_isRunningBoardLaunched has no additionalProperties", buf, 2u);
      }
    }
    BOOL v11 = 0;
LABEL_15:

    goto LABEL_16;
  }
  id v7 = rbs_general_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = v5;
    _os_log_impl(&dword_226AB3000, v7, OS_LOG_TYPE_DEFAULT, "propertiesForJob failed for _isRunningBoardLaunched %{public}@", buf, 0xCu);
  }
  BOOL v11 = 1;
LABEL_16:

  return v11;
}

- (id)synchronizeJobs
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v29 = [MEMORY[0x263EFF980] array];
  launchdInterface = self->_launchdInterface;
  id v52 = 0;
  objc_super v27 = (void *)[(RBLaunchdInterfacing *)launchdInterface copyJobsManagedBy:@"com.apple.runningboard" error:&v52];
  id v3 = v52;
  if (v27)
  {
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    obuint64_t j = v27;
    uint64_t v4 = [obj countByEnumeratingWithState:&v48 objects:v59 count:16];
    if (v4)
    {
      os_unfair_lock_t lock = &self->_lock;
      uint64_t v34 = *(void *)v49;
      do
      {
        uint64_t v5 = 0;
        uint64_t v6 = v3;
        do
        {
          if (*(void *)v49 != v34) {
            objc_enumerationMutation(obj);
          }
          id v7 = *(void **)(*((void *)&v48 + 1) + 8 * v5);
          uint64_t v44 = 0;
          uint64_t v45 = &v44;
          uint64_t v46 = 0x2020000000;
          int v47 = 0;
          if (_synchronizeJobsQueue_onceToken != -1) {
            dispatch_once(&_synchronizeJobsQueue_onceToken, &__block_literal_global_6);
          }
          id v8 = (id)_synchronizeJobsQueue_queue;
          v43[0] = MEMORY[0x263EF8330];
          v43[1] = 3221225472;
          v43[2] = __38__RBLaunchdJobManager_synchronizeJobs__block_invoke;
          v43[3] = &unk_2647C8158;
          v43[4] = v7;
          v43[5] = &v44;
          [v7 monitorOnQueue:v8 withHandler:v43];

          [v7 cancelMonitor];
          uint64_t v9 = self->_launchdInterface;
          id v42 = 0;
          uint64_t v10 = [(RBLaunchdInterfacing *)v9 propertiesForJob:v7 error:&v42];
          id v3 = v42;

          if (v10)
          {
            uint64_t v11 = [v10 additionalProperties];
            uint64_t v12 = v11;
            if (v11 && MEMORY[0x22A661A50](v11) == MEMORY[0x263EF8708])
            {
              uint64_t v14 = xpc_dictionary_get_value(v12, "RunningBoard");
              id v13 = v14;
              if (v14 && MEMORY[0x22A661A50](v14) == MEMORY[0x263EF8708])
              {
                id v15 = xpc_dictionary_get_value(v13, "RunningBoardLaunchedIdentity");
                if (v15)
                {
                  id v16 = objc_alloc(MEMORY[0x263F64580]);
                  uint64_t v17 = *((unsigned int *)v45 + 6);
                  if (!v17) {
                    uint64_t v17 = getpid();
                  }
                  uint64_t v31 = [v16 initWithPid:v17];
                  uint64_t v18 = (void *)MEMORY[0x263F64598];
                  id v19 = [v10 instance];
                  id v32 = [v18 decodeFromJob:v15 uuid:v19];

                  uint64_t v20 = v31;
                  if (v32)
                  {
                    uint64_t v21 = objc_msgSend(MEMORY[0x263F645A8], "instanceWithIdentifier:identity:", v31);
                    if (*((_DWORD *)v45 + 6))
                    {
                      [v29 addObject:v21];
                      os_unfair_lock_lock(lock);
                      [(NSMutableDictionary *)self->_lock_jobsByIdentifier setObject:v7 forKey:v31];
                      os_unfair_lock_unlock(lock);
                    }
                    else
                    {
                      log = rbs_general_log();
                      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
                      {
                        dispatch_queue_t v23 = [v7 handle];
                        [(RBLaunchdJobManager *)v23 synchronizeJobs];
                      }

                      [(RBLaunchdJobManager *)self _removeJobWithInstance:v21 orJob:v7 error:0];
                    }
                  }
                  else
                  {
                    uint64_t v21 = rbs_general_log();
                    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                    {
                      char v22 = [v7 handle];
                      [(RBLaunchdJobManager *)v22 synchronizeJobs];
                    }
                  }
                }
                else
                {
                  uint64_t v20 = rbs_general_log();
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
                    [(RBLaunchdJobManager *)&v36 synchronizeJobs];
                  }
                }
              }
              else
              {
                id v15 = rbs_general_log();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
                  [(RBLaunchdJobManager *)&v38 synchronizeJobs];
                }
              }
            }
            else
            {
              id v13 = rbs_general_log();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
                [(RBLaunchdJobManager *)&v40 synchronizeJobs];
              }
            }
          }
          else
          {
            uint64_t v12 = rbs_general_log();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138543362;
              id v58 = v3;
              _os_log_fault_impl(&dword_226AB3000, v12, OS_LOG_TYPE_FAULT, "propertiesForPid failed for job %{public}@", buf, 0xCu);
            }
          }

          _Block_object_dispose(&v44, 8);
          ++v5;
          uint64_t v6 = v3;
        }
        while (v4 != v5);
        uint64_t v4 = [obj countByEnumeratingWithState:&v48 objects:v59 count:16];
      }
      while (v4);
    }
    id v24 = obj;
  }
  else
  {
    __int16 v25 = rbs_general_log();
    id v24 = v25;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      -[RBLaunchdJobManager synchronizeJobs]();
      id v24 = v25;
    }
  }

  return v29;
}

void __38__RBLaunchdJobManager_synchronizeJobs__block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [a2 pid];
  }
  else
  {
    id v3 = rbs_general_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __38__RBLaunchdJobManager_synchronizeJobs__block_invoke_cold_1(a1);
    }
  }
}

- (unint64_t)test_trackedJobCount
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(NSMutableDictionary *)self->_lock_monitoredJobsByIdentifier count];
  unint64_t v5 = [(NSMutableDictionary *)self->_lock_jobsByIdentifier count] + v4;
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logQueue, 0);
  objc_storeStrong((id *)&self->_lock_reslideIdentities, 0);
  objc_storeStrong((id *)&self->_bundlePropertiesManager, 0);
  objc_storeStrong((id *)&self->_containerManager, 0);
  objc_storeStrong((id *)&self->_personaManager, 0);
  objc_storeStrong((id *)&self->_launchdInterface, 0);
  objc_storeStrong((id *)&self->_lock_monitoredJobsByIdentifier, 0);
  objc_storeStrong((id *)&self->_lock_jobsByIdentifier, 0);
}

+ (void)lastExitStatusForLabel:error:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_226AB3000, v1, OS_LOG_TYPE_ERROR, "Unexpected exit reason from launchd %{public}@: %llu", v2, 0x16u);
}

- (void)_addSharedPropertiesToData:(void *)a1 forIdentity:context:.cold.1(void *a1)
{
  os_log_t v1 = [a1 identity];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_226AB3000, v2, v3, "During job creation, executable path NULL for %{public}@", v4, v5, v6, v7, v8);
}

- (void)_addAppPropertiesToData:forIdentity:context:actualIdentity:error:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_fault_impl(&dword_226AB3000, v1, OS_LOG_TYPE_FAULT, "'%{public}@' container path lookup failed: %{public}@", v2, 0x16u);
}

- (void)_addAppPropertiesToData:(int)a1 forIdentity:(NSObject *)a2 context:actualIdentity:error:.cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_226AB3000, a2, OS_LOG_TYPE_FAULT, "Unrecognized RBSLaunchSpawnType %d", (uint8_t *)v2, 8u);
}

- (void)_createLaunchdJobWithIdentity:context:actualIdentity:error:.cold.1()
{
}

- (void)_createLaunchdJobWithIdentity:context:actualIdentity:error:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_226AB3000, v0, v1, "Multiple personas available for %{public}@", v2, v3, v4, v5, v6);
}

- (void)createAndLaunchWithIdentity:context:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_226AB3000, v0, v1, "Process start failed to launch/find job with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)createAndLaunchWithIdentity:context:error:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_226AB3000, v0, v1, "Job remove after failed start failed with %{public}@", v2, v3, v4, v5, v6);
}

- (void)createAndLaunchWithIdentity:context:error:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_226AB3000, v0, v1, "Process start failed with %{public}@", v2, v3, v4, v5, v6);
}

- (void)createAndLaunchWithIdentity:(os_log_t)log context:error:.cold.4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_226AB3000, log, OS_LOG_TYPE_ERROR, "Process start failed to return either error or jobInfo", v1, 2u);
}

- (void)createAndLaunchWithIdentity:(void *)a1 context:error:.cold.5(void *a1)
{
  [a1 pid];
  [a1 state];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x18u);
}

- (void)createAndLaunchWithIdentity:(void *)a1 context:error:.cold.6(void *a1)
{
  [a1 pid];
  [a1 state];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0xEu);
}

- (void)createAndLaunchWithIdentity:context:error:.cold.7()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_2(&dword_226AB3000, v0, v1, "Failed to fetch properties for job for %{public}@", v2, v3, v4, v5, v6);
}

- (void)createAndLaunchWithIdentity:context:error:.cold.8()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_2(&dword_226AB3000, v0, v1, "Attempted to launch daemon found an angel job: %{public}@", v2, v3, v4, v5, v6);
}

- (void)createAndLaunchWithIdentity:context:error:.cold.9()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_2(&dword_226AB3000, v0, v1, "Attempted to launch angel found a non-angel job: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_removeJobWithInstance:orJob:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_2(&dword_226AB3000, v0, v1, "Job removal failed with %{public}@", v2, v3, v4, v5, v6);
}

- (void)_removeJobWithInstance:orJob:error:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_2(&dword_226AB3000, v0, v1, "About to attempt job removal for job not submitted by RunningBoard: %{public}@", v2, v3, v4, v5, v6);
}

- (void)synchronizeJobs
{
  *(_DWORD *)buf = 138543362;
  *a3 = a1;
  _os_log_error_impl(&dword_226AB3000, log, OS_LOG_TYPE_ERROR, "Skipping recovery for already exited process %{public}@", buf, 0xCu);
}

void __38__RBLaunchdJobManager_synchronizeJobs__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) handle];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x12u);
}

- (void)invokeOnProcessDeath:(void *)a1 handler:onQueue:.cold.1(void *a1)
{
  uint64_t v1 = [a1 description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_226AB3000, v2, v3, "%{public}@ had monitoring configured twice", v4, v5, v6, v7, v8);
}

void __60__RBLaunchdJobManager_invokeOnProcessDeath_handler_onQueue___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __60__RBLaunchdJobManager_invokeOnProcessDeath_handler_onQueue___block_invoke_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = 138543618;
  uint64_t v6 = v4;
  __int16 v7 = 2048;
  uint64_t v8 = [a2 state];
  _os_log_fault_impl(&dword_226AB3000, a3, OS_LOG_TYPE_FAULT, "%{public}@ reported to RB in an invalid state %ld", (uint8_t *)&v5, 0x16u);
}

void __60__RBLaunchdJobManager_invokeOnProcessDeath_handler_onQueue___block_invoke_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __60__RBLaunchdJobManager_invokeOnProcessDeath_handler_onQueue___block_invoke_cold_4(uint64_t *a1, void *a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = *a1;
  int v5 = 138543618;
  uint64_t v6 = v4;
  __int16 v7 = 1024;
  int v8 = [a2 pid];
  _os_log_fault_impl(&dword_226AB3000, a3, OS_LOG_TYPE_FAULT, "%{public}@ reported with incorrect pid %d", (uint8_t *)&v5, 0x12u);
}

@end