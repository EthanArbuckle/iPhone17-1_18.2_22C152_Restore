@interface FBScene(PRScene)
+ (id)_pr_createPosterSceneWithRole:()PRScene path:processIdentity:;
+ (id)pr_createPosterSceneWithRole:()PRScene path:instance:;
+ (id)pr_createPosterSceneWithRole:()PRScene path:provider:;
+ (id)pr_createPosterSceneWithinCurrentProcessForRole:()PRScene path:;
+ (uint64_t)pr_createPosterSceneWithRole:()PRScene path:;
- (uint64_t)pr_setupSceneExtensionsForSceneRole:()PRScene;
- (void)pr_applyPosterPath:()PRScene toSettings:;
- (void)pr_updateWithPath:()PRScene inSettings:;
@end

@implementation FBScene(PRScene)

+ (uint64_t)pr_createPosterSceneWithRole:()PRScene path:
{
  return objc_msgSend(a1, "pr_createPosterSceneWithRole:path:provider:", a3, a4, 0);
}

+ (id)pr_createPosterSceneWithRole:()PRScene path:provider:
{
  id v8 = a3;
  id v9 = a4;
  v10 = a5;
  id v11 = v9;
  NSClassFromString(&cfstr_Pfserverposter_0.isa);
  if (!v11)
  {
    v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBScene(PRScene) pr_createPosterSceneWithRole:path:provider:]();
    }
LABEL_22:
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C2756BCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PFServerPosterPathClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBScene(PRScene) pr_createPosterSceneWithRole:path:provider:]();
    }
    goto LABEL_22;
  }

  if (v10)
  {
LABEL_4:
    id v12 = objc_alloc(MEMORY[0x1E4F924A8]);
    v13 = objc_msgSend(MEMORY[0x1E4F29128], "pf_defaultInstanceIdentifier");
    v14 = (void *)[v12 initWithExtension:v10 instanceIdentifier:v13];

    v15 = objc_msgSend(a1, "pr_createPosterSceneWithRole:path:instance:", v8, v11, v14);
    objc_setAssociatedObject(v15, "instance", v14, (void *)1);

    goto LABEL_14;
  }
  v16 = (void *)MEMORY[0x1E4F25888];
  id v17 = objc_alloc(MEMORY[0x1E4F25880]);
  v18 = (void *)MEMORY[0x1E4F28F60];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __63__FBScene_PRScene__pr_createPosterSceneWithRole_path_provider___block_invoke;
  v28[3] = &unk_1E54DC7D0;
  id v19 = v11;
  id v29 = v19;
  v20 = [v18 predicateWithBlock:v28];
  v21 = (void *)[v17 initWithExtensionPointIdentifier:@"com.apple.posterkit.provider" predicate:v20];
  v22 = [v16 executeQuery:v21];

  if ([v22 count])
  {
    v23 = (void *)MEMORY[0x1E4F924A0];
    v24 = [v22 firstObject];
    v10 = [v23 extensionWithIdentity:v24];

    if (v10) {
      goto LABEL_4;
    }
  }
  else
  {
    v25 = PRLogCommon();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      +[FBScene(PRScene) pr_createPosterSceneWithRole:path:provider:](v19);
    }
  }
  v10 = PRLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    +[FBScene(PRScene) pr_createPosterSceneWithRole:path:provider:](v19);
  }
  v15 = 0;
LABEL_14:

  return v15;
}

+ (id)pr_createPosterSceneWithRole:()PRScene path:instance:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"role"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBScene(PRScene) pr_createPosterSceneWithRole:path:instance:]();
    }
LABEL_15:
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C2758B0);
  }
  if (!v9)
  {
    v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"path"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBScene(PRScene) pr_createPosterSceneWithRole:path:instance:]();
    }
    [v16 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C275914);
  }
  id v11 = v10;
  if (!v10)
  {
    v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"instance"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBScene(PRScene) pr_createPosterSceneWithRole:path:instance:]();
    }
    goto LABEL_15;
  }
  id v12 = [v10 processIdentity];
  v13 = objc_msgSend(a1, "_pr_createPosterSceneWithRole:path:processIdentity:", v8, v9, v12);

  return v13;
}

+ (id)pr_createPosterSceneWithinCurrentProcessForRole:()PRScene path:
{
  v6 = (void *)MEMORY[0x1E4F96408];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 identityOfCurrentProcess];
  id v10 = objc_msgSend(a1, "_pr_createPosterSceneWithRole:path:processIdentity:", v8, v7, v9);

  return v10;
}

+ (id)_pr_createPosterSceneWithRole:()PRScene path:processIdentity:
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v39 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"role"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBScene(PRScene) _pr_createPosterSceneWithRole:path:processIdentity:](a2);
    }
LABEL_18:
    [v39 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C275E54);
  }
  if (!v10)
  {
    v40 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"path"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBScene(PRScene) _pr_createPosterSceneWithRole:path:processIdentity:](a2);
    }
    [v40 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C275EB8);
  }
  id v12 = v11;
  if (!v11)
  {
    v39 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"identity"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBScene(PRScene) _pr_createPosterSceneWithRole:path:processIdentity:](a2);
    }
    goto LABEL_18;
  }
  v13 = objc_msgSend(MEMORY[0x1E4F624B0], "pui_posterWorkspace");
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __71__FBScene_PRScene___pr_createPosterSceneWithRole_path_processIdentity___block_invoke;
  v51[3] = &unk_1E54DB760;
  id v42 = v12;
  id v52 = v42;
  v14 = [v13 createScene:v51];

  objc_msgSend(v14, "pr_setupSceneExtensionsForSceneRole:", v9);
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = __Block_byref_object_copy__3;
  v49[4] = __Block_byref_object_dispose__3;
  id v50 = 0;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __71__FBScene_PRScene___pr_createPosterSceneWithRole_path_processIdentity___block_invoke_357;
  v44[3] = &unk_1E54DC848;
  id v41 = v9;
  id v45 = v41;
  id v15 = v10;
  id v46 = v15;
  id v16 = v14;
  id v47 = v16;
  v48 = v49;
  [v16 configureParameters:v44];
  id v17 = objc_alloc(MEMORY[0x1E4F223A0]);
  v18 = [v15 serverIdentity];
  id v19 = [v18 provider];
  v20 = (void *)[v17 initWithBundleIdentifier:v19 error:0];

  v43 = [v20 infoDictionary];
  v21 = [v20 entitlements];
  v22 = [v15 serverIdentity];
  v23 = [v22 provider];
  v24 = [v23 componentsSeparatedByString:@"."];
  v25 = [v24 lastObject];

  v26 = NSString;
  v27 = [v16 identifier];
  v28 = [v27 componentsSeparatedByString:@"-"];
  id v29 = [v28 lastObject];
  v30 = [v26 stringWithFormat:@"<%@: %p; %@>", v25, a1, v29];
  objc_msgSend(v16, "pui_setShortDescription:", v30);

  if (objc_msgSend(v43, "pf_wantsLocation")) {
    uint64_t v31 = 2;
  }
  else {
    uint64_t v31 = 0;
  }
  v32 = [v21 objectForKey:@"com.apple.posterkit.enhanced-memory-limits" ofClass:objc_opt_class()];
  unsigned int v33 = [v32 BOOLValue];
  id v34 = objc_alloc(MEMORY[0x1E4F92808]);
  v35 = [v20 bundleIdentifier];
  v36 = (void *)[v34 initWithScene:v16 bundleIdentifier:v35 processIdentity:v42 options:v31 | v33];

  objc_msgSend(v16, "pui_setPosterComponent:", v36);
  id v37 = v16;

  _Block_object_dispose(v49, 8);
  return v37;
}

- (void)pr_applyPosterPath:()PRScene toSettings:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  NSClassFromString(&cfstr_Pfserverposter_0.isa);
  if (!v8)
  {
    v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBScene(PRScene) pr_applyPosterPath:toSettings:]();
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
LABEL_28:
    JUMPOUT(0x18C2764F0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PFServerPosterPathClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBScene(PRScene) pr_applyPosterPath:toSettings:]();
    }
    [v19 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C276554);
  }

  id v9 = v7;
  NSClassFromString(&cfstr_Fbsmutablescen.isa);
  if (!v9)
  {
    v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBScene(PRScene) pr_applyPosterPath:toSettings:]();
    }
    [v20 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C2765B8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSMutableSceneSettingsClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBScene(PRScene) pr_applyPosterPath:toSettings:]();
    }
    [v21 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C27661CLL);
  }

  id v24 = 0;
  id v10 = [v8 extendContentsReadAccessToAuditToken:0 error:&v24];
  id v11 = v24;
  if (!v10)
  {
    v22 = [NSString stringWithFormat:@"failed to create path for scene settings of %@ : %@", a1, v11];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBScene(PRScene) pr_applyPosterPath:toSettings:]();
    }
    [v22 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    goto LABEL_28;
  }
  id v12 = +[PRPosterPathModelObjectCache modelObjectCacheForPath:v10];
  uint64_t v13 = [v12 configuredProperties];
  if (v13)
  {
    v14 = (void *)v13;
    id v15 = 0;
LABEL_11:

    goto LABEL_12;
  }
  id v23 = 0;
  v14 = +[PRPosterPathUtilities loadConfiguredPropertiesForPath:v10 error:&v23];
  id v15 = v23;

  if (v15)
  {
    id v12 = PRLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[FBScene(PRScene) pr_applyPosterPath:toSettings:].cold.4((uint64_t)v8, (uint64_t)v15, v12);
    }
    goto LABEL_11;
  }
LABEL_12:
  objc_msgSend(v9, "pui_setPosterContents:", v10);
  objc_msgSend(v9, "pr_setPosterConfiguredProperties:", v14);
  id v16 = [v14 titleStyleConfiguration];
  objc_msgSend(v9, "pr_setPosterTitleStyleConfiguration:", v16);

  id v17 = [v14 ambientConfiguration];
  objc_msgSend(v9, "pr_setPosterAmbientConfiguration:", v17);

  objc_msgSend(a1, "pui_setPosterPath:", v8);
}

- (void)pr_updateWithPath:()PRScene inSettings:
{
  id v13 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(a1, "pui_posterPath");
  id v8 = [v7 serverIdentity];
  id v9 = [v8 posterUUID];

  id v10 = [v13 serverIdentity];
  id v11 = [v10 posterUUID];

  if ([v9 isEqual:v11])
  {
    objc_msgSend(a1, "pr_applyPosterPath:toSettings:", v13, v6);
  }
  else
  {
    id v12 = [NSString stringWithFormat:@"new path is not the same poster as the current path"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBScene(PRScene) pr_updateWithPath:inSettings:]();
    }
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (uint64_t)pr_setupSceneExtensionsForSceneRole:()PRScene
{
  [a1 addExtension:objc_opt_class()];
  v2 = objc_msgSend(a1, "pui_posterPath");
  v3 = [v2 role];
  int v4 = [v3 isEqual:@"PRPosterRoleAmbient"];

  uint64_t v5 = objc_opt_class();
  if (v4)
  {
    return [a1 addExtension:v5];
  }
  else
  {
    return [a1 removeExtension:v5];
  }
}

+ (void)pr_createPosterSceneWithRole:()PRScene path:provider:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)pr_createPosterSceneWithRole:()PRScene path:provider:.cold.2(void *a1)
{
  SEL v1 = [a1 serverIdentity];
  v2 = [v1 provider];
  OUTLINED_FUNCTION_7(&dword_18C1C4000, v3, v4, "cannot create a scene without a provider \"%{public}@\"", v5, v6, v7, v8, 2u);
}

+ (void)pr_createPosterSceneWithRole:()PRScene path:provider:.cold.3(void *a1)
{
  SEL v1 = [a1 serverIdentity];
  v2 = [v1 provider];
  OUTLINED_FUNCTION_7(&dword_18C1C4000, v3, v4, "No poster providers were found for \"%{public}@\"", v5, v6, v7, v8, 2u);
}

+ (void)pr_createPosterSceneWithRole:()PRScene path:instance:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)pr_createPosterSceneWithRole:()PRScene path:instance:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)pr_createPosterSceneWithRole:()PRScene path:instance:.cold.3()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)_pr_createPosterSceneWithRole:()PRScene path:processIdentity:.cold.1(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)_pr_createPosterSceneWithRole:()PRScene path:processIdentity:.cold.2(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)_pr_createPosterSceneWithRole:()PRScene path:processIdentity:.cold.3(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)pr_applyPosterPath:()PRScene toSettings:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)pr_applyPosterPath:()PRScene toSettings:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)pr_applyPosterPath:()PRScene toSettings:.cold.3()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)pr_applyPosterPath:()PRScene toSettings:.cold.4(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_18C1C4000, log, OS_LOG_TYPE_ERROR, "Error loading configured properties for %@: %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)pr_updateWithPath:()PRScene inSettings:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  int v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end