@interface BKAlternateSystemApp
+ (id)_bundleInfoOverrides;
- (BKAlternateSystemApp)initWithBundleId:(id)a3 options:(id)a4 queue:(id)a5;
- (BOOL)launchWithResultBlock:(id)a3 exitBlock:(id)a4;
- (BOOL)terminate;
- (NSDictionary)options;
- (NSString)bundleID;
- (NSString)description;
- (OS_dispatch_queue)queue;
- (RBSAssertion)visibilityAssertion;
- (RBSProcessHandle)processHandle;
- (id)pendingExitBlock;
- (void)_noteExitedWithContext:(id)a3;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setOptions:(id)a3;
- (void)setPendingExitBlock:(id)a3;
- (void)setProcessHandle:(id)a3;
- (void)setQueue:(id)a3;
- (void)setVisibilityAssertion:(id)a3;
@end

@implementation BKAlternateSystemApp

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingExitBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_visibilityAssertion, 0);
  objc_storeStrong((id *)&self->_processHandle, 0);
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

- (void)setPendingExitBlock:(id)a3
{
}

- (id)pendingExitBlock
{
  return self->_pendingExitBlock;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setVisibilityAssertion:(id)a3
{
}

- (RBSAssertion)visibilityAssertion
{
  return self->_visibilityAssertion;
}

- (void)setProcessHandle:(id)a3
{
}

- (RBSProcessHandle)processHandle
{
  return self->_processHandle;
}

- (void)setOptions:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)_noteExitedWithContext:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = BKLogAlternateSystemApp();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    v11 = self;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_noteExitedWithContext: app:%{public}@ exitContext:%{public}@", (uint8_t *)&v10, 0x16u);
  }

  pendingExitBlock = (void (**)(id, id))self->_pendingExitBlock;
  if (pendingExitBlock)
  {
    pendingExitBlock[2](pendingExitBlock, v4);
    id v7 = self->_pendingExitBlock;
    self->_pendingExitBlock = 0;
  }
  [(RBSAssertion *)self->_visibilityAssertion invalidate];
  visibilityAssertion = self->_visibilityAssertion;
  self->_visibilityAssertion = 0;

  processHandle = self->_processHandle;
  self->_processHandle = 0;
}

- (BOOL)terminate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id pendingExitBlock = self->_pendingExitBlock;
  self->_id pendingExitBlock = 0;

  [(RBSAssertion *)self->_visibilityAssertion invalidate];
  visibilityAssertion = self->_visibilityAssertion;
  self->_visibilityAssertion = 0;

  processHandle = self->_processHandle;
  if (processHandle)
  {
    id v6 = [(RBSProcessHandle *)processHandle pid];
    id v7 = [objc_alloc((Class)RBSTerminateContext) initWithExplanation:@"Alternate system app termination requested."];
    [v7 setReportType:0];
    [v7 setMaximumTerminationResistance:40];
    id v8 = objc_alloc((Class)RBSTerminateRequest);
    v9 = +[NSNumber numberWithInt:v6];
    uint64_t v10 = +[RBSProcessPredicate predicateMatchingIdentifier:v9];
    id v11 = [v8 initWithPredicate:v10 context:v7];

    id v17 = 0;
    LOBYTE(v10) = [v11 execute:&v17];
    id v12 = v17;
    if ((v10 & 1) == 0)
    {
      id v13 = BKLogAlternateSystemApp();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        bundleID = self->_bundleID;
        *(_DWORD *)buf = 138543618;
        v19 = bundleID;
        __int16 v20 = 2114;
        id v21 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to terminate %{public}@ with error: %{public}@", buf, 0x16u);
      }
    }
    v14 = self->_processHandle;
    self->_processHandle = 0;
  }
  return 1;
}

- (BOOL)launchWithResultBlock:(id)a3 exitBlock:(id)a4
{
  id v7 = a3;
  id v80 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  val = self;
  location = (id *)&self->_processHandle;
  if (self->_processHandle)
  {
    v61 = +[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_processHandle == nil"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v62 = (BKAlternateSystemApp *)objc_claimAutoreleasedReturnValue();
      v63 = (objc_class *)objc_opt_class();
      NSStringFromClass(v63);
      v64 = (BKAlternateSystemApp *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v109 = v62;
      __int16 v110 = 2114;
      v111 = v64;
      __int16 v112 = 2048;
      v113 = self;
      __int16 v114 = 2114;
      CFStringRef v115 = @"BKAlternateSystemApp.m";
      __int16 v116 = 1024;
      int v117 = 89;
      __int16 v118 = 2114;
      v119 = v61;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v61 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x100042080);
  }
  id v8 = BKLogAlternateSystemApp();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v109 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "launchWithResultBlock: %{public}@", buf, 0xCu);
  }

  v103[0] = _NSConcreteStackBlock;
  v103[1] = 3221225472;
  v103[2] = sub_1000420BC;
  v103[3] = &unk_1000F7FC8;
  v103[4] = self;
  id v75 = v7;
  id v104 = v75;
  v76 = objc_retainBlock(v103);
  id v9 = [v80 copy];
  id pendingExitBlock = self->_pendingExitBlock;
  self->_id pendingExitBlock = v9;

  v79 = [(id)objc_opt_class() _bundleInfoOverrides];
  id v11 = [v79 objectForKey:self->_bundleID];
  v82 = v11;
  if (v11)
  {
    id v12 = [v11 objectForKey:@"OverrideURL"];
    v81 = +[NSURL URLWithString:v12];

    v83 = [v82 objectForKey:@"OverrideAppType"];
    id v13 = BKLogAlternateSystemApp();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      bundleID = self->_bundleID;
      *(_DWORD *)buf = 134218754;
      v109 = self;
      __int16 v110 = 2114;
      v111 = (BKAlternateSystemApp *)bundleID;
      __int16 v112 = 2114;
      v113 = v81;
      __int16 v114 = 2114;
      CFStringRef v115 = v83;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "launchWithResultBlock %p: Using built-in information for bundle ID %{public}@: URL=\"%{public}@\" appType=\"%{public}@\"", buf, 0x2Au);
    }

    goto LABEL_11;
  }
  v15 = self->_bundleID;
  id v102 = 0;
  v83 = +[LSBundleRecord bundleRecordWithBundleIdentifier:v15 allowPlaceholder:0 error:&v102];
  v16 = (BKAlternateSystemApp *)v102;
  if (v83 && !v16)
  {
    v81 = [(__CFString *)v83 URL];
LABEL_11:

    v83 = [(BKAlternateSystemApp *)v81 path];
    id v78 = [objc_alloc((Class)BSCFBundle) initWithPath:v83];
    v77 = [v78 executablePath];
    if (v77)
    {
      id v17 = +[NSMutableDictionary dictionary];
      v86 = +[BSMutableMachServiceAliases new];
      v74 = [(NSString *)self->_bundleID stringByAppendingString:@".jail."];
      v73 = [v74 stringByAppendingString:@"com.apple.frontboard.systemappservices"];
      v72 = [v74 stringByAppendingString:@"com.apple.frontboard.workspace"];
      [v17 setObject:&__kCFBooleanTrue forKey:v73];
      [v17 setObject:&__kCFBooleanTrue forKey:v72];
      [(BSMutableMachServiceAliases *)v86 setService:v73 forAlias:@"com.apple.frontboard.systemappservices"];
      [(BSMutableMachServiceAliases *)v86 setService:v72 forAlias:@"com.apple.frontboard.workspace"];
      v70 = [v78 infoDictionary];
      v71 = [v70 bs_safeDictionaryForKey:@"BKSLaunchdPlist"];
      [v71 bs_safeDictionaryForKey:@"MachServices"];
      long long v100 = 0u;
      long long v101 = 0u;
      long long v98 = 0u;
      long long v99 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue();
      id v18 = [obj countByEnumeratingWithState:&v98 objects:v107 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v99;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v99 != v19) {
              objc_enumerationMutation(obj);
            }
            id v21 = *(void **)(*((void *)&v98 + 1) + 8 * i);
            if ([v21 length]) {
              [v17 setObject:&__kCFBooleanTrue forKey:v21];
            }
          }
          id v18 = [obj countByEnumeratingWithState:&v98 objects:v107 count:16];
        }
        while (v18);
      }

      [v71 bs_safeDictionaryForKey:@"AlternateMachServices"];
      long long v96 = 0u;
      long long v97 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      id v22 = (id)objc_claimAutoreleasedReturnValue();
      id v23 = [v22 countByEnumeratingWithState:&v94 objects:v106 count:16];
      if (v23)
      {
        uint64_t v24 = *(void *)v95;
        do
        {
          for (j = 0; j != v23; j = (char *)j + 1)
          {
            if (*(void *)v95 != v24) {
              objc_enumerationMutation(v22);
            }
            v26 = *(BKAlternateSystemApp **)(*((void *)&v94 + 1) + 8 * (void)j);
            if ([(BKAlternateSystemApp *)v26 length])
            {
              [v22 bs_safeStringForKey:v26];
              v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
              if ([(__CFString *)v27 length])
              {
                v28 = [v17 objectForKey:v27];
                BOOL v29 = v28 == 0;

                v30 = BKLogAlternateSystemApp();
                v31 = v30;
                if (v29)
                {
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                  {
                    v33 = val->_bundleID;
                    *(_DWORD *)buf = 134218754;
                    v109 = val;
                    __int16 v110 = 2114;
                    v111 = (BKAlternateSystemApp *)v33;
                    __int16 v112 = 2114;
                    v113 = v26;
                    __int16 v114 = 2114;
                    CFStringRef v115 = v27;
                    _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "launchWithResultBlock %p: [%{public}@] Ignoring alternate mach service for \"%{public}@\" because mapped service \"%{public}@\" does not exist.", buf, 0x2Au);
                  }
                }
                else
                {
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                  {
                    v32 = val->_bundleID;
                    *(_DWORD *)buf = 134218754;
                    v109 = val;
                    __int16 v110 = 2114;
                    v111 = (BKAlternateSystemApp *)v32;
                    __int16 v112 = 2112;
                    v113 = (BKAlternateSystemApp *)v27;
                    __int16 v114 = 2112;
                    CFStringRef v115 = (const __CFString *)v26;
                    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "launchWithResultBlock %p: [%{public}@] Registering alternate mach service \"%@\" in place of \"%@\".", buf, 0x2Au);
                  }

                  [(BSMutableMachServiceAliases *)v86 setService:v27 forAlias:v26];
                }
              }
            }
          }
          id v23 = [v22 countByEnumeratingWithState:&v94 objects:v106 count:16];
        }
        while (v23);
      }

      v69 = +[RBSProcessIdentity identityForEmbeddedApplicationIdentifier:val->_bundleID];
      v34 = +[RBSLaunchContext contextWithIdentity:v69];
      [v34 setSpawnType:1];
      [v34 _setOverrideExecutablePath:v77];
      v35 = [(BSMutableMachServiceAliases *)v86 environmentRepresentation];
      [v34 _setAdditionalEnvironment:v35];

      v36 = [v17 allKeys];
      [v34 _setAdditionalMachServices:v36];

      id v68 = [objc_alloc((Class)RBSLaunchRequest) initWithContext:v34];
      id v92 = 0;
      id v93 = 0;
      unsigned __int8 v37 = [v68 execute:&v93 error:&v92];
      id v38 = v93;
      id v65 = v93;
      id v84 = v92;
      if (v37)
      {
        objc_storeStrong(location, v38);
        objc_initWeak(&from, val);
        processHandle = val->_processHandle;
        v89[0] = _NSConcreteStackBlock;
        v89[1] = 3221225472;
        v89[2] = sub_1000421A8;
        v89[3] = &unk_1000F69A8;
        objc_copyWeak(&v90, &from);
        [(RBSProcessHandle *)processHandle monitorForDeath:v89];
        +[RBSTarget targetWithPid:environmentIdentifier:](RBSTarget, "targetWithPid:environmentIdentifier:", [*location pid], @"com.apple.backboard.alternateSystemApp");
        locationa = (id *)objc_claimAutoreleasedReturnValue();
        id v40 = objc_alloc((Class)RBSAssertion);
        v41 = +[RBSEndowmentGrant grantWithNamespace:@"com.apple.frontboard.visibility" endowment:&__kCFBooleanTrue];
        v105[0] = v41;
        v42 = +[RBSJetsamPriorityGrant grantWithForegroundPriority];
        v105[1] = v42;
        v43 = +[RBSCPUAccessGrant grantWithUserInteractivity];
        v105[2] = v43;
        v44 = +[RBSGPUAccessGrant grant];
        v105[3] = v44;
        v45 = +[RBSResistTerminationGrant grantWithResistance:40];
        v105[4] = v45;
        v46 = +[NSArray arrayWithObjects:v105 count:5];
        v47 = (RBSAssertion *)[v40 initWithExplanation:@"Alternate system app" target:locationa attributes:v46];
        visibilityAssertion = val->_visibilityAssertion;
        val->_visibilityAssertion = v47;

        v49 = val->_visibilityAssertion;
        id v88 = 0;
        unsigned __int8 v50 = [(RBSAssertion *)v49 acquireWithError:&v88];
        id v51 = v88;

        if (v50)
        {
          v52 = BKLogAlternateSystemApp();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            v109 = val;
            __int16 v110 = 2114;
            v111 = val;
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "launchSucceeded %p: %{public}@", buf, 0x16u);
          }

          (*((void (**)(id, void))v75 + 2))(v75, 0);
        }
        else
        {
          v56 = BKLogAlternateSystemApp();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            v60 = [v51 descriptionWithMultilinePrefix:0];
            *(_DWORD *)buf = 134218242;
            v109 = val;
            __int16 v110 = 2114;
            v111 = v60;
            _os_log_error_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "launchWithResultBlock %p: launch succeeded but app was not made visible: %{public}@", buf, 0x16u);
          }
          [(BKAlternateSystemApp *)val terminate];
          ((void (*)(void))v76[2])();
        }

        objc_destroyWeak(&v90);
        objc_destroyWeak(&from);
        id v84 = v51;
      }
      else
      {
        v54 = BKLogAlternateSystemApp();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          v58 = [v84 descriptionWithMultilinePrefix:0];
          *(_DWORD *)buf = 134218242;
          v109 = val;
          __int16 v110 = 2114;
          v111 = v58;
          _os_log_error_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "launchWithResultBlock %p: launch failed: %{public}@", buf, 0x16u);
        }
        ((void (*)(void))v76[2])();
        unsigned __int8 v50 = 0;
      }
    }
    else
    {
      v53 = BKLogAlternateSystemApp();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        v109 = self;
        __int16 v110 = 2114;
        v111 = (BKAlternateSystemApp *)v83;
        _os_log_error_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "launchWithResultBlock %p: launch failed: no executable path for bundle at path %{public}@", buf, 0x16u);
      }

      ((void (*)(void))v76[2])();
      unsigned __int8 v50 = 0;
    }

    goto LABEL_58;
  }
  v81 = v16;
  v55 = BKLogAlternateSystemApp();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
  {
    v59 = self->_bundleID;
    *(_DWORD *)buf = 134218498;
    v109 = self;
    __int16 v110 = 2114;
    v111 = (BKAlternateSystemApp *)v59;
    __int16 v112 = 2114;
    v113 = v81;
    _os_log_error_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "launchWithResultBlock %p: launch failed: error from LS %{public}@ -- %{public}@", buf, 0x20u);
  }

  ((void (*)(void))v76[2])();
  unsigned __int8 v50 = 0;
LABEL_58:

  return v50;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100042300;
  v5[3] = &unk_1000F8E50;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  [v4 appendProem:self block:v5];
}

- (NSString)description
{
  return (NSString *)+[BSDescriptionStream descriptionForRootObject:self];
}

- (BKAlternateSystemApp)initWithBundleId:(id)a3 options:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BKAlternateSystemApp;
  id v11 = [(BKAlternateSystemApp *)&v14 init];
  id v12 = v11;
  if (v11)
  {
    [(BKAlternateSystemApp *)v11 setBundleID:v8];
    [(BKAlternateSystemApp *)v12 setOptions:v9];
    [(BKAlternateSystemApp *)v12 setQueue:v10];
  }

  return v12;
}

+ (id)_bundleInfoOverrides
{
  v5[0] = @"OverrideURL";
  v5[1] = @"OverrideAppType";
  v6[0] = @"file:///Applications/PreBoard.app";
  v6[1] = @"System";
  CFStringRef v7 = @"com.apple.PreBoard";
  v2 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  id v8 = v2;
  v3 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];

  return v3;
}

@end