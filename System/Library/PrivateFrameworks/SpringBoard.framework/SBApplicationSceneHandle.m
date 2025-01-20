@interface SBApplicationSceneHandle
+ (id)lookupOrCreatePersistenceIDFromApplication:(id)a3 sceneID:(id)a4;
- (BOOL)isSceneUpdateInProgress;
- (BOOL)isSecure;
- (NSString)persistenceIdentifier;
- (SBApplication)application;
- (id)_createApplicationSceneClientSettingsFromContext:(id)a3 entity:(id)a4 initialSceneSettings:(id)a5;
- (id)_createApplicationSceneSettingsFromContext:(id)a3 entity:(id)a4;
- (id)_createApplicationSceneTransitionContextFromContext:(id)a3 entity:(id)a4;
- (id)_createParametersFromTransitionContext:(id)a3 entity:(id)a4;
- (id)_createProcessExecutionContextFromContext:(id)a3 entity:(id)a4;
- (id)_initWithApplication:(id)a3 scene:(id)a4 displayIdentity:(id)a5;
- (id)_initWithApplication:(id)a3 sceneDefinition:(id)a4 displayIdentity:(id)a5;
- (id)_initWithDefinition:(id)a3;
- (id)_initWithScene:(id)a3;
- (id)_persistenceIdentifier;
- (id)displayItemRepresentation;
- (id)newScenePlaceholderContentContextWithActivationSettings:(id)a3;
- (id)newSceneViewController;
- (id)newSceneViewWithReferenceSize:(CGSize)a3 contentOrientation:(int64_t)a4 containerOrientation:(int64_t)a5 hostRequester:(id)a6;
- (int64_t)layoutRole;
- (void)_applicationsDidChange:(id)a3;
- (void)_commonInit;
- (void)_commonInitWithApplication:(id)a3 sceneIdentifier:(id)a4 displayIdentity:(id)a5;
- (void)_noteDidMoveFromSceneManager:(id)a3;
- (void)addSceneUpdateContributer:(id)a3;
- (void)dealloc;
- (void)removeSceneUpdateContributer:(id)a3;
- (void)setLayoutRole:(int64_t)a3;
- (void)setSceneUpdateInProgress:(BOOL)a3;
@end

@implementation SBApplicationSceneHandle

- (SBApplication)application
{
  return self->_application;
}

- (id)_createApplicationSceneSettingsFromContext:(id)a3 entity:(id)a4
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v70 = [MEMORY[0x1E4F28B00] currentHandler];
    [v70 handleFailureInMethod:a2, self, @"SBApplicationSceneHandle.m", 544, @"Invalid parameter not satisfying: %@", @"requestContext" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v71 = [MEMORY[0x1E4F28B00] currentHandler];
  [v71 handleFailureInMethod:a2, self, @"SBApplicationSceneHandle.m", 545, @"Invalid parameter not satisfying: %@", @"entity" object file lineNumber description];

LABEL_3:
  v75 = [v7 request];
  uint64_t v10 = [v75 displayConfiguration];
  v11 = [(SBApplicationSceneHandle *)self sceneIfExists];
  v12 = v11;
  if (v11)
  {
    v13 = [v11 settings];
    v14 = (void *)[v13 mutableCopy];
  }
  else
  {
    v13 = [(SBApplicationSceneHandle *)self _definition];
    [v13 specification];
    v16 = uint64_t v15 = v10;
    v17 = objc_msgSend((id)objc_msgSend(v16, "settingsClass"), "settings");
    v14 = (void *)[v17 mutableCopy];

    uint64_t v10 = v15;
  }

  v76 = (void *)v10;
  [v14 setDisplayConfiguration:v10];
  [v14 setPersistenceIdentifier:self->_persistenceIdentifier];
  if (_os_feature_enabled_impl()) {
    uint64_t v18 = 2;
  }
  else {
    uint64_t v18 = 0;
  }
  [v14 setInterruptionPolicy:v18];
  int v19 = [v7 isBackground];
  int v20 = v19;
  v21 = (double *)MEMORY[0x1E4F1DB30];
  SEL v73 = a2;
  v74 = v12;
  if (!v12 || (v19 & 1) == 0)
  {
    v22 = [(SBApplicationSceneHandle *)self application];
    uint64_t v23 = v20 ^ 1u;
    [v14 setForeground:v23];
    [v14 setLevel:1.0];
    if ((v23 & 1) != 0
      || ([v22 info],
          v24 = objc_claimAutoreleasedReturnValue(),
          int v25 = [v24 hasHiddenTag],
          v24,
          !v25))
    {
      [v7 frameForApplicationSceneEntity:v9];
      CGFloat v34 = v33;
      CGFloat v36 = v35;
      CGFloat v38 = v37;
      CGFloat v39 = v32;
      if (v37 == *v21 && v32 == v21[1])
      {
        v40 = SBLogAppSwitcher();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          v67 = SBMainWorkspaceTransitionSourceDescription([v75 source]);
          v68 = [v76 identity];
          v69 = [v7 layoutState];
          *(_DWORD *)buf = 138544386;
          v83 = v74;
          __int16 v84 = 2114;
          v85 = v67;
          __int16 v86 = 2114;
          v87 = v68;
          __int16 v88 = 2114;
          v89 = v9;
          __int16 v90 = 2114;
          v91 = v69;
          _os_log_error_impl(&dword_1D85BA000, v40, OS_LOG_TYPE_ERROR, "-_cASSFC:E: produced {0,0} with scene %{public}@, source %{public}@, display configuration %{public}@, entity %{public}@, request context %{public}@", buf, 0x34u);
        }
        v26 = v22;

        v41 = [MEMORY[0x1E4F28B00] currentHandler];
        v94.origin.x = v34;
        v94.origin.y = v36;
        v94.size.width = v38;
        v94.size.height = v39;
        v42 = NSStringFromCGRect(v94);
        [v41 handleFailureInMethod:v73, self, @"SBApplicationSceneHandle.m", 584, @"frame (%@) isn't valid", v42 object file lineNumber description];
      }
      else
      {
        v26 = v22;
      }
      v31 = v14;
      double v27 = v34;
      double v28 = v36;
      double v29 = v38;
      double v30 = v39;
    }
    else
    {
      v26 = v22;
      [v76 bounds];
      v31 = v14;
    }
    objc_msgSend(v31, "setFrame:", v27, v28, v29, v30);
    v43 = [v7 layoutState];
    v44 = [(SBApplicationSceneHandle *)self sceneIdentifier];
    v45 = [v43 elementWithIdentifier:v44];

    unint64_t v46 = [v14 interfaceOrientation];
    if (v46 <= 1) {
      uint64_t v47 = 1;
    }
    else {
      uint64_t v47 = v46;
    }
    uint64_t v48 = [v7 interfaceOrientation];
    uint64_t v49 = v48;
    if (v45)
    {
      v50 = [v7 layoutState];
      uint64_t v51 = [v50 interfaceOrientationForLayoutElement:v45 unknownAllowed:1];

      if (v49) {
        uint64_t v52 = v49;
      }
      else {
        uint64_t v52 = v47;
      }
      v53 = v26;
      if (!v51) {
        uint64_t v51 = v52;
      }
    }
    else
    {
      if (v48) {
        uint64_t v51 = v48;
      }
      else {
        uint64_t v51 = v47;
      }
      v53 = v26;
    }
    [v14 setInterfaceOrientation:v51];
    if ([v53 isMedusaCapable]) {
      uint64_t v54 = 2;
    }
    else {
      uint64_t v54 = 1;
    }
    [v14 setInterfaceOrientationMode:v54];
    objc_msgSend(v14, "setInLiveResize:", objc_msgSend(v7, "isInLiveResize"));
    v55 = [v9 objectForActivationSetting:61];
    if (v55)
    {
      v56 = [v14 ignoreOcclusionReasons];
      [v56 addObject:v55];
    }
    [(SBApplicationSceneHandle *)self _modifyApplicationSceneSettings:v14 fromRequestContext:v7 entity:v9];
  }
  v57 = [(NSHashTable *)self->_sceneUpdateContributers allObjects];
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  uint64_t v58 = [v57 countByEnumeratingWithState:&v77 objects:v81 count:16];
  if (v58)
  {
    uint64_t v59 = v58;
    uint64_t v60 = *(void *)v78;
    do
    {
      for (uint64_t i = 0; i != v59; ++i)
      {
        if (*(void *)v78 != v60) {
          objc_enumerationMutation(v57);
        }
        v62 = *(void **)(*((void *)&v77 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v62 applicationSceneHandle:self appendToSceneSettings:v14 fromRequestContext:v7 entity:v9];
        }
      }
      uint64_t v59 = [v57 countByEnumeratingWithState:&v77 objects:v81 count:16];
    }
    while (v59);
  }
  [v14 frame];
  if (v64 == *MEMORY[0x1E4F1DB30] && v63 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    v72 = [MEMORY[0x1E4F28B00] currentHandler];
    [v72 handleFailureInMethod:v73 object:self file:@"SBApplicationSceneHandle.m" lineNumber:614 description:@"Application scene settings frame should never be 0!"];
  }
  return v14;
}

- (id)displayItemRepresentation
{
  v3 = [(SBApplicationSceneHandle *)self application];
  v4 = [(SBApplicationSceneHandle *)self sceneIdentifier];
  if ([v3 isWebApplication])
  {
    v5 = +[SBDisplayItem webAppDisplayItemWithWebAppIdentifier:v4];
  }
  else
  {
    v6 = [v3 bundleIdentifier];
    int v7 = [v6 isEqualToString:@"com.apple.PrintKit.Print-Center"];

    id v8 = [v3 bundleIdentifier];
    if (v7) {
      +[SBDisplayItem switcherServiceDisplayItemWithServiceIdentifier:v8];
    }
    else {
    v5 = +[SBDisplayItem displayItemWithType:0 bundleIdentifier:v8 uniqueIdentifier:v4];
    }
  }
  return v5;
}

+ (id)lookupOrCreatePersistenceIDFromApplication:(id)a3 sceneID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = [v5 _dataStore];
  id v8 = [v7 sceneStoreForIdentifier:v6 creatingIfNecessary:1];

  v9 = [v8 safeObjectForKey:@"persistenceIdentifier" ofType:objc_opt_class()];
  if (!v9)
  {
    uint64_t v10 = [v5 bundleIdentifier];
    id v11 = v6;
    v12 = [NSString stringWithFormat:@"sceneID:%@-", v10];
    unint64_t v13 = [v11 length];
    if (v13 >= [v12 length] && objc_msgSend(v11, "hasPrefix:", v12))
    {
      objc_msgSend(v11, "substringFromIndex:", objc_msgSend(v12, "length"));
      id v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v14 = v11;
    }
    v9 = v14;

    if ([v9 isEqualToString:@"default"])
    {
      uint64_t v15 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v16 = [v15 UUIDString];

      v9 = (void *)v16;
    }
    [v8 setObject:v9 forKey:@"persistenceIdentifier"];
  }

  return v9;
}

- (void)setSceneUpdateInProgress:(BOOL)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (self->_sceneUpdateInProgress != a3)
  {
    self->_sceneUpdateInProgress = a3;
    int v7 = @"SceneIdentifierKey";
    v4 = [(SBApplicationSceneHandle *)self sceneIdentifier];
    v8[0] = v4;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:@"SBApplicationSceneHandleProgressNotification" object:self userInfo:v5];
  }
}

- (void)setLayoutRole:(int64_t)a3
{
  self->_layoutRole = a3;
}

- (id)_createProcessExecutionContextFromContext:(id)a3 entity:(id)a4
{
  v77[4] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    uint64_t v60 = [MEMORY[0x1E4F28B00] currentHandler];
    [v60 handleFailureInMethod:a2, self, @"SBApplicationSceneHandle.m", 165, @"Invalid parameter not satisfying: %@", @"entity != nil" object file lineNumber description];
  }
  v9 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v10 = [v8 objectForProcessSetting:2];
  v67 = v9;
  [v9 addEntriesFromDictionary:v10];

  id v11 = [v7 request];
  double v63 = v11;
  if ([v11 isMainWorkspaceTransitionRequest]) {
    unint64_t v12 = [v11 source];
  }
  else {
    unint64_t v12 = 0;
  }
  unint64_t v13 = [v8 objectForActivationSetting:19];
  uint64_t v14 = [v13 unsignedIntegerValue];

  if (!v14)
  {
    uint64_t v15 = SBLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SBApplicationSceneHandle _createProcessExecutionContextFromContext:entity:]();
    }

    mach_continuous_time();
  }
  uint64_t v16 = [(SBApplicationSceneHandle *)self application];
  SBMainWorkspaceTransitionSourceDescription(v12);
  id v17 = objc_claimAutoreleasedReturnValue();
  [v17 cStringUsingEncoding:4];

  uint64_t v18 = [v16 info];
  id v19 = [v18 bundleVersion];
  [v19 cStringUsingEncoding:4];

  int v20 = [v16 info];
  id v21 = [v20 shortVersionString];
  [v21 cStringUsingEncoding:4];

  id obj = 0;
  id v22 = [v16 bundleIdentifier];
  [v22 cStringUsingEncoding:4];

  [v7 isBackground];
  alm_app_will_launch_with_details_and_metrics_payload();
  objc_storeStrong((id *)&self->_launchMetricsPayload, 0);
  uint64_t v23 = [v8 objectForActivationSetting:18];
  [v23 doubleValue];
  self->_userLaunchEventTime = v24;

  if (BSFloatIsZero())
  {
    int v25 = SBLogCommon();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[SBApplicationSceneHandle _createProcessExecutionContextFromContext:entity:]();
    }

    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    self->_userLaunchEventTime = v26;
  }
  if (__PPTTestInProgress)
  {
    v77[0] = MEMORY[0x1E4F1CC38];
    v76[0] = @"__PPT_ForTesting";
    v76[1] = @"__PPT_SignpostID";
    double v27 = [NSNumber numberWithUnsignedLongLong:self->_userLaunchSignpostID];
    v77[1] = v27;
    v76[2] = @"__PPT_LaunchTime";
    double v28 = [NSNumber numberWithDouble:self->_userLaunchEventTime];
    v77[2] = v28;
    v76[3] = @"__PPT_BackgroundLaunch";
    double v29 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "isBackground"));
    v77[3] = v29;
    double v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:v76 count:4];
    [v67 addEntriesFromDictionary:v30];

    if (__PPTUserSpecifiedEnvironment)
    {
      objc_msgSend(v67, "addEntriesFromDictionary:");
      v31 = (void *)__PPTUserSpecifiedEnvironment;
      __PPTUserSpecifiedEnvironment = 0;
    }
  }
  double v64 = v7;
  v66 = [v8 objectForProcessSetting:1];
  v65 = [v8 objectForProcessSetting:3];
  double v32 = [v8 objectForProcessSetting:4];
  uint64_t v33 = [v8 BOOLForProcessSetting:5];
  uint64_t v34 = [v8 BOOLForProcessSetting:6];
  int v62 = [v8 BOOLForProcessSetting:7];
  double v35 = [v8 objectForActivationSetting:33];
  uint64_t v36 = objc_opt_class();
  id v37 = v35;
  if (v36)
  {
    if (objc_opt_isKindOfClass()) {
      CGFloat v38 = v37;
    }
    else {
      CGFloat v38 = 0;
    }
  }
  else
  {
    CGFloat v38 = 0;
  }
  id v39 = v38;

  if (v39)
  {
    id v40 = objc_alloc(MEMORY[0x1E4F223B0]);
    v41 = [v16 bundleIdentifier];
    id v68 = 0;
    v42 = (void *)[v40 initWithBundleIdentifier:v41 allowPlaceholder:0 personaUniqueString:v39 error:&v68];
    id v43 = v68;

    if (v42)
    {
      v44 = [MEMORY[0x1E4F96408] identityForLSApplicationIdentity:v42];

      if (v44) {
        goto LABEL_30;
      }
    }
    else
    {
      v45 = SBLogCommon();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        v61 = [v16 bundleIdentifier];
        uint64_t v58 = [v43 descriptionWithMultilinePrefix:0];
        *(_DWORD *)buf = 138543874;
        v71 = v61;
        __int16 v72 = 2114;
        id v73 = v39;
        __int16 v74 = 2114;
        uint64_t v75 = v58;
        uint64_t v59 = (void *)v58;
        _os_log_error_impl(&dword_1D85BA000, v45, OS_LOG_TYPE_ERROR, "could not create LSApplicationIdentity for bundleID %{public}@ and persona %{public}@: %{public}@", buf, 0x20u);
      }
    }
  }
  unint64_t v46 = [v16 info];
  v44 = [v46 processIdentity];

LABEL_30:
  id v47 = objc_alloc_init(MEMORY[0x1E4F62440]);
  [v47 setIdentity:v44];
  [v47 setEnvironment:v67];
  [v47 setWaitForDebugger:v33];
  [v47 setDisableASLR:v34];
  [v47 setCheckForLeaks:__CheckForLeaks];
  [v47 setArguments:v66];
  uint64_t v48 = [MEMORY[0x1E4F1CB10] URLWithString:v65];
  [v47 setStandardOutputURL:v48];

  uint64_t v49 = [MEMORY[0x1E4F1CB10] URLWithString:v32];
  [v47 setStandardErrorURL:v49];

  v50 = [v8 objectForActivationSetting:30];
  uint64_t v51 = v50;
  if (v50)
  {
    uint64_t v52 = [v50 integerValue];
  }
  else
  {
    if ([v8 BOOLForActivationSetting:3])
    {
      v53 = [v16 info];
      int v54 = [v53 hasViewServicesEntitlement];

      if (v54) {
        uint64_t v52 = 3;
      }
      else {
        uint64_t v52 = 2;
      }
    }
    else
    {
      uint64_t v52 = 4;
    }
    v55 = [NSNumber numberWithInteger:v52];
    [v8 setObject:v55 forActivationSetting:30];
  }
  [v47 setLaunchIntent:v52];
  if (v62) {
    +[SBSceneWatchdogProvider disabledSceneWatchdogProvider];
  }
  else {
  v56 = +[SBSceneWatchdogProvider defaultSceneWatchdogProvider];
  }
  [v47 setWatchdogProvider:v56];

  [(SBApplicationSceneHandle *)self _modifyProcessExecutionContext:v47 fromRequestContext:v64 entity:v8];
  return v47;
}

- (id)_createApplicationSceneTransitionContextFromContext:(id)a3 entity:(id)a4
{
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v99 = [MEMORY[0x1E4F28B00] currentHandler];
    [v99 handleFailureInMethod:a2, self, @"SBApplicationSceneHandle.m", 294, @"Invalid parameter not satisfying: %@", @"requestContext" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v100 = [MEMORY[0x1E4F28B00] currentHandler];
  [v100 handleFailureInMethod:a2, self, @"SBApplicationSceneHandle.m", 295, @"Invalid parameter not satisfying: %@", @"entity" object file lineNumber description];

LABEL_3:
  uint64_t v10 = [(SBApplicationSceneHandle *)self application];
  id v11 = [(SBApplicationSceneHandle *)self _definition];
  unint64_t v12 = [v11 specification];
  id v13 = objc_alloc_init((Class)[v12 transitionContextClass]);

  if (!v13) {
    id v13 = objc_alloc_init(MEMORY[0x1E4F42790]);
  }
  uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v15 = [v9 objectForActivationSetting:14];
  uint64_t v16 = objc_opt_class();
  id v17 = v15;
  if (v16)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v18 = v17;
    }
    else {
      uint64_t v18 = 0;
    }
  }
  else
  {
    uint64_t v18 = 0;
  }
  id v19 = v18;

  if ([v19 length]
    && [v10 shouldReceiveSourceApplicationContextFromOriginatingApplication:v19])
  {
    [v14 setObject:v19 forKey:*MEMORY[0x1E4F43688]];
  }
  v107 = v19;
  int v20 = [v9 objectForActivationSetting:5];
  uint64_t v21 = objc_opt_class();
  id v22 = v20;
  if (v21)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v23 = v22;
    }
    else {
      uint64_t v23 = 0;
    }
  }
  else
  {
    uint64_t v23 = 0;
  }
  id v24 = v23;

  v109 = v24;
  int v25 = [v24 relativeString];
  if ([v25 length]) {
    [v14 setObject:v25 forKey:*MEMORY[0x1E4F43690]];
  }
  v106 = v25;
  double v26 = [v9 objectForActivationSetting:34];
  Class v27 = NSClassFromString(&cfstr_Uispastesharin.isa);
  id v28 = v26;
  if (v27)
  {
    if (objc_opt_isKindOfClass()) {
      double v29 = v28;
    }
    else {
      double v29 = 0;
    }
  }
  else
  {
    double v29 = 0;
  }
  id v30 = v29;

  if (v30) {
    [v14 setObject:v30 forKey:@"__PasteSharingToken"];
  }
  v105 = v30;
  v31 = [v7 request];
  v110 = v31;
  if ([v31 isMainWorkspaceTransitionRequest])
  {
    id v32 = v31;
    unint64_t v33 = [v32 source];
  }
  else
  {
    unint64_t v33 = 0;
  }
  v111 = v14;
  v112 = v10;
  uint64_t v34 = [v9 objectForActivationSetting:19];
  uint64_t v35 = [v34 unsignedIntegerValue];

  if (!v35)
  {
    uint64_t v36 = SBLogCommon();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      -[SBApplicationSceneHandle _createProcessExecutionContextFromContext:entity:]();
    }

    mach_continuous_time();
  }
  int v37 = [v7 isBackground];
  SBMainWorkspaceTransitionSourceDescription(v33);
  id v38 = objc_claimAutoreleasedReturnValue();
  [v38 cStringUsingEncoding:4];

  id v39 = [v112 info];
  id v40 = [v39 bundleVersion];
  [v40 cStringUsingEncoding:4];

  v41 = [v112 info];
  id v42 = [v41 shortVersionString];
  [v42 cStringUsingEncoding:4];

  p_userLaunchSignpostID = &self->_userLaunchSignpostID;
  int v108 = v37;
  if (self->_userLaunchSignpostID)
  {
    alm_app_will_activate_with_signpost_id();
    v45 = v111;
    v44 = v112;
  }
  else
  {
    unint64_t v46 = [(SBApplicationSceneHandle *)self sceneIfExists];
    id v47 = [v109 scheme];
    int v48 = [v47 isEqualToString:@"test"];

    if (v46) {
      int v49 = [v46 isActive] ^ 1;
    }
    else {
      int v49 = 1;
    }
    v50 = [v46 settings];
    int v51 = [v50 isForeground];

    int v52 = [v9 BOOLForActivationSetting:52];
    if (((v48 | v49) & 1) != 0 || !(v51 | v108) || v52) {
      alm_app_will_activate_with_details();
    }

    v45 = v111;
    v44 = v112;
    p_userLaunchSignpostID = &self->_userLaunchSignpostID;
  }
  v53 = [v9 objectForActivationSetting:15];
  uint64_t v54 = objc_opt_class();
  id v55 = v53;
  if (v54)
  {
    if (objc_opt_isKindOfClass()) {
      v56 = v55;
    }
    else {
      v56 = 0;
    }
  }
  else
  {
    v56 = 0;
  }
  id v57 = v56;

  if ([v57 count]) {
    [v45 setObject:v57 forKey:*MEMORY[0x1E4F43678]];
  }
  v104 = v57;
  uint64_t v58 = [v9 objectForActivationSetting:16];
  uint64_t v59 = objc_opt_class();
  id v60 = v58;
  if (v59)
  {
    if (objc_opt_isKindOfClass()) {
      v61 = v60;
    }
    else {
      v61 = 0;
    }
  }
  else
  {
    v61 = 0;
  }
  id v62 = v61;

  if ([v62 count]) {
    [v45 addEntriesFromDictionary:v62];
  }
  v103 = v62;
  if ([v45 count]) {
    [v13 setPayload:v45];
  }
  double v63 = [v9 objectForActivationSetting:32];
  [v13 setClickAttribution:v63];

  [v9 translateActivationSettingsToActions];
  if (+[SBCaptureHardwareButton deviceSupportsCaptureButton]()) {
    int v64 = +[SBCaptureHardwareButton isCaptureFeatureEnabled]();
  }
  else {
    int v64 = 0;
  }
  if ((LCSFeatureEnabled() & 1) != 0 || v64)
  {
    v65 = p_userLaunchSignpostID;
    v66 = [v9 activationSettings];
    int v67 = [v66 BOOLForActivationSetting:36];

    id v68 = [v9 application];
    v69 = [v68 bundleIdentifier];

    v70 = +[SBCaptureApplicationCenter sharedInstance];
    v71 = [v70 captureApplicationForBundleIdentifier:v69];

    __int16 v72 = SBLogCommon();
    BOOL v73 = os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT);
    if (v67 && v71)
    {
      if (v73)
      {
        *(_DWORD *)buf = 138412290;
        v119 = v69;
        _os_log_impl(&dword_1D85BA000, v72, OS_LOG_TYPE_DEFAULT, "Adding launch actions for the capture application (%@)", buf, 0xCu);
      }

      __int16 v72 = [v71 launchActions];
      [v9 addActions:v72];
    }
    else if (v73)
    {
      *(_DWORD *)buf = 138412802;
      v119 = v69;
      __int16 v120 = 1024;
      int v121 = v67;
      __int16 v122 = 1024;
      BOOL v123 = v71 != 0;
      _os_log_impl(&dword_1D85BA000, v72, OS_LOG_TYPE_DEFAULT, "No capture application found for the %@, launchCameraCapture: %{BOOL}u, isCaptureApplication: %{BOOL}u", buf, 0x18u);
    }
    p_userLaunchSignpostID = v65;

    v44 = v112;
  }
  __int16 v74 = [v9 actions];
  if ([v74 count]) {
    [v13 setActions:v74];
  }
  [v9 removeAllActions];
  uint64_t v75 = [v7 animationSettings];
  if (v75) {
    [v13 setAnimationSettings:v75];
  }
  v101 = (void *)v75;
  v102 = v74;
  if ((v108 & 1) == 0)
  {
    v76 = [v7 animationFence];
    if (([v7 fencesAnimations] & 1) != 0 || v76)
    {
      long long v77 = [v13 animationFence];
      if (v77)
      {
      }
      else
      {
        long long v78 = [(SBApplicationSceneHandle *)self sceneIfExists];
        [v78 clientProcess];
        v80 = long long v79 = p_userLaunchSignpostID;
        int v81 = [v80 isForeground];

        p_userLaunchSignpostID = v79;
        if (v81)
        {
          if (v76)
          {
            [v13 setAnimationFence:v76];
          }
          else
          {
            v82 = [(id)*MEMORY[0x1E4F43630] _systemAnimationFenceCreatingIfNecessary:1];
            [v13 setAnimationFence:v82];
          }
        }
      }
    }
  }
  if (([v9 BOOLForActivationSetting:49] & 1) != 0
    || [v9 BOOLForActivationSetting:62])
  {
    [v13 setShouldTakeKeyboardFocus:1];
  }
  if (__PPTTestInProgress)
  {
    [v13 setForTesting:1];
    [v13 setUserLaunchEventTime:self->_userLaunchEventTime];
    __PPTTestInProgress = 0;
    if (BSFloatIsZero())
    {
      v83 = SBLogCommon();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_FAULT)) {
        -[SBApplicationSceneHandle _createApplicationSceneTransitionContextFromContext:entity:]();
      }
    }
  }
  if (*p_userLaunchSignpostID)
  {
    [v13 setUserLaunchEventTime:self->_userLaunchEventTime];
    [v13 setSignpostID:*p_userLaunchSignpostID];
    unint64_t *p_userLaunchSignpostID = 0;
    [v13 setLaunchMetricsPayload:self->_launchMetricsPayload];
    launchMetricsPayload = self->_launchMetricsPayload;
    self->_launchMetricsPayload = 0;
  }
  v85 = [v44 info];
  int v86 = [v85 isAppleApplication];

  if (v86)
  {
    v87 = [v110 originatingProcess];
    [v13 setOriginatingProcess:v87];
  }
  [v7 watchdogScaleFactor];
  objc_msgSend(v13, "setWatchdogScaleFactor:");
  if ([v7 alwaysRunsWatchdog])
  {
    __int16 v88 = [v13 watchdogTransitionContext];
    [v88 setWatchdogBehavior:1];
  }
  v89 = [v9 objectForActivationSetting:30];
  uint64_t v90 = [v89 integerValue];

  if (v90 == 1) {
    [v13 setAllowCPUThrottling:1];
  }
  [(SBApplicationSceneHandle *)self _modifyApplicationTransitionContext:v13 fromRequestContext:v7 entity:v9];
  [(NSHashTable *)self->_sceneUpdateContributers allObjects];
  long long v113 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  id v91 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v92 = [v91 countByEnumeratingWithState:&v113 objects:v117 count:16];
  if (v92)
  {
    uint64_t v93 = v92;
    uint64_t v94 = *(void *)v114;
    do
    {
      for (uint64_t i = 0; i != v93; ++i)
      {
        if (*(void *)v114 != v94) {
          objc_enumerationMutation(v91);
        }
        v96 = *(void **)(*((void *)&v113 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v96 applicationSceneHandle:self appendToTransitionContext:v13 fromRequestContext:v7 entity:v9];
        }
      }
      uint64_t v93 = [v91 countByEnumeratingWithState:&v113 objects:v117 count:16];
    }
    while (v93);
  }

  id v97 = v13;
  return v97;
}

- (id)_createParametersFromTransitionContext:(id)a3 entity:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F629B8];
  id v7 = a4;
  id v8 = a3;
  v9 = [(SBApplicationSceneHandle *)self _definition];
  uint64_t v10 = [v9 specification];
  id v11 = [v6 parametersForSpecification:v10];

  unint64_t v12 = [(SBApplicationSceneHandle *)self _createApplicationSceneSettingsFromContext:v8 entity:v7];
  [v11 setSettings:v12];

  id v13 = [v11 settings];
  uint64_t v14 = [(SBApplicationSceneHandle *)self _createApplicationSceneClientSettingsFromContext:v8 entity:v7 initialSceneSettings:v13];

  [v11 setClientSettings:v14];
  return v11;
}

- (id)_createApplicationSceneClientSettingsFromContext:(id)a3 entity:(id)a4 initialSceneSettings:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  unint64_t v12 = v11;
  if (v9)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SBApplicationSceneHandle.m", 622, @"Invalid parameter not satisfying: %@", @"requestContext" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  id v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"SBApplicationSceneHandle.m", 623, @"Invalid parameter not satisfying: %@", @"settings" object file lineNumber description];

LABEL_3:
  id v13 = [(SBApplicationSceneHandle *)self _definition];
  uint64_t v14 = [v13 specification];
  uint64_t v15 = objc_msgSend((id)objc_msgSend(v14, "clientSettingsClass"), "settings");
  uint64_t v16 = (void *)[v15 mutableCopy];

  [(SBApplicationSceneHandle *)self _modifyApplicationSceneClientSettings:v16 fromRequestContext:v9 entity:v10 initialSceneSettings:v12];
  return v16;
}

- (id)_initWithScene:(id)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"SBApplicationSceneHandle.m" lineNumber:102 description:@"This initializer is unavailable."];

  return 0;
}

- (id)_initWithDefinition:(id)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"SBApplicationSceneHandle.m" lineNumber:107 description:@"This initializer is unavailable."];

  return 0;
}

- (id)_initWithApplication:(id)a3 scene:(id)a4 displayIdentity:(id)a5
{
  id v9 = (SBApplication *)a3;
  id v10 = a4;
  id v11 = a5;
  unint64_t v12 = [v10 settings];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    int v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"SBApplicationSceneHandle.m" lineNumber:112 description:@"Cannot create an application scene handle with settings that aren't a type of UIApplicationSceneSettings."];
  }
  uint64_t v14 = [v10 clientSettings];
  objc_opt_class();
  char v15 = objc_opt_isKindOfClass();

  if ((v15 & 1) == 0)
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"SBApplicationSceneHandle.m" lineNumber:113 description:@"Cannot create an application scene handle with settings that aren't a type of UIApplicationSceneClientSettings."];
  }
  application = self->_application;
  self->_application = v9;
  id v17 = v9;

  v22.receiver = self;
  v22.super_class = (Class)SBApplicationSceneHandle;
  id v18 = [(SBApplicationSceneHandle *)&v22 _initWithScene:v10 displayIdentity:v11];

  return v18;
}

- (id)_initWithApplication:(id)a3 sceneDefinition:(id)a4 displayIdentity:(id)a5
{
  objc_storeStrong((id *)&self->_application, a3);
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBApplicationSceneHandle;
  id v12 = [(SBApplicationSceneHandle *)&v14 _initWithDefinition:v11 displayIdentity:v10];

  return v12;
}

- (void)_commonInit
{
  v8.receiver = self;
  v8.super_class = (Class)SBApplicationSceneHandle;
  [(SBApplicationSceneHandle *)&v8 _commonInit];
  v3 = [(SBApplicationSceneHandle *)self _definition];
  v4 = [v3 identity];
  id v5 = [v4 identifier];

  application = self->_application;
  id v7 = [(SBApplicationSceneHandle *)self displayIdentity];
  [(SBApplicationSceneHandle *)self _commonInitWithApplication:application sceneIdentifier:v5 displayIdentity:v7];
}

- (void)_commonInitWithApplication:(id)a3 sceneIdentifier:(id)a4 displayIdentity:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  self->_isSecure = [a5 expectsSecureRendering];
  id v10 = [(id)objc_opt_class() lookupOrCreatePersistenceIDFromApplication:v9 sceneID:v8];

  persistenceIdentifier = self->_persistenceIdentifier;
  self->_persistenceIdentifier = v10;

  self->_layoutRole = 0;
  id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v12 addObserver:self selector:sel__applicationsDidChange_ name:@"SBInstalledApplicationsDidChangeNotification" object:0];
}

- (void)_noteDidMoveFromSceneManager:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBApplicationSceneHandle;
  [(SBApplicationSceneHandle *)&v6 _noteDidMoveFromSceneManager:a3];
  v4 = [(SBApplicationSceneHandle *)self sceneManager];
  id v5 = [v4 displayIdentity];
  self->_isSecure = [v5 expectsSecureRendering];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"SBInstalledApplicationsDidChangeNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)SBApplicationSceneHandle;
  [(SBApplicationSceneHandle *)&v4 dealloc];
}

- (id)_persistenceIdentifier
{
  return self->_persistenceIdentifier;
}

- (void)_applicationsDidChange:(id)a3
{
  id v16 = a3;
  id v5 = [MEMORY[0x1E4F1CA80] set];
  objc_super v6 = [v16 userInfo];
  id v7 = [v6 objectForKey:@"SBInstalledApplicationsReplacedBundleIDs"];

  if ([v7 count]) {
    [v5 unionSet:v7];
  }
  id v8 = [v16 userInfo];
  id v9 = [v8 objectForKey:@"SBInstalledApplicationsAddedBundleIDs"];

  if ([v9 count]) {
    [v5 unionSet:v9];
  }
  if ([v5 count])
  {
    id v10 = [(SBApplicationSceneHandle *)self application];
    id v11 = [v10 bundleIdentifier];

    if ([v5 containsObject:v11])
    {
      id v12 = +[SBApplicationController sharedInstance];
      id v13 = [v12 applicationWithBundleIdentifier:v11];

      if (!v13)
      {
        char v15 = [MEMORY[0x1E4F28B00] currentHandler];
        [v15 handleFailureInMethod:a2 object:self file:@"SBApplicationSceneHandle.m" lineNumber:536 description:@"Application cannot be nil if we were told it's been modified."];
      }
      application = self->_application;
      self->_application = v13;
    }
  }
}

- (id)newSceneViewWithReferenceSize:(CGSize)a3 contentOrientation:(int64_t)a4 containerOrientation:(int64_t)a5 hostRequester:(id)a6
{
  double height = a3.height;
  double width = a3.width;
  id v11 = a6;
  id v12 = -[SBApplicationSceneView initWithSceneHandle:referenceSize:contentOrientation:containerOrientation:hostRequester:]([SBApplicationSceneView alloc], "initWithSceneHandle:referenceSize:contentOrientation:containerOrientation:hostRequester:", self, a4, a5, v11, width, height);

  return v12;
}

- (id)newScenePlaceholderContentContextWithActivationSettings:(id)a3
{
  return 0;
}

- (id)newSceneViewController
{
  v3 = [SBApplicationSceneViewController alloc];
  return [(SBApplicationSceneViewController *)v3 initWithSceneHandle:self];
}

- (void)addSceneUpdateContributer:(id)a3
{
  id v4 = a3;
  sceneUpdateContributers = self->_sceneUpdateContributers;
  id v8 = v4;
  if (!sceneUpdateContributers)
  {
    objc_super v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v7 = self->_sceneUpdateContributers;
    self->_sceneUpdateContributers = v6;

    id v4 = v8;
    sceneUpdateContributers = self->_sceneUpdateContributers;
  }
  [(NSHashTable *)sceneUpdateContributers addObject:v4];
}

- (void)removeSceneUpdateContributer:(id)a3
{
  [(NSHashTable *)self->_sceneUpdateContributers removeObject:a3];
  if (![(NSHashTable *)self->_sceneUpdateContributers count])
  {
    sceneUpdateContributers = self->_sceneUpdateContributers;
    self->_sceneUpdateContributers = 0;
  }
}

- (NSString)persistenceIdentifier
{
  return self->_persistenceIdentifier;
}

- (BOOL)isSecure
{
  return self->_isSecure;
}

- (int64_t)layoutRole
{
  return self->_layoutRole;
}

- (BOOL)isSceneUpdateInProgress
{
  return self->_sceneUpdateInProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchMetricsPayload, 0);
  objc_storeStrong((id *)&self->_sceneUpdateContributers, 0);
  objc_storeStrong((id *)&self->_persistenceIdentifier, 0);
  objc_storeStrong((id *)&self->_application, 0);
}

- (void)_createProcessExecutionContextFromContext:entity:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_1D85BA000, v0, v1, "No UserLaunchEventTime", v2, v3, v4, v5, v6);
}

- (void)_createProcessExecutionContextFromContext:entity:.cold.2()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_1D85BA000, v0, v1, "No ContinuousUserLaunchEventTime", v2, v3, v4, v5, v6);
}

- (void)_createApplicationSceneTransitionContextFromContext:entity:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  _os_log_fault_impl(&dword_1D85BA000, v0, OS_LOG_TYPE_FAULT, "UserLaunchEventTime was not configured while testing", v1, 2u);
}

@end