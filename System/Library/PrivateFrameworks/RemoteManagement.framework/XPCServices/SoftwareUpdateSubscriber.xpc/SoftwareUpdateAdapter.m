@interface SoftwareUpdateAdapter
- (BOOL)applyConfiguration:(id)a3 scope:(int64_t)a4 returningReasons:(id *)a5 error:(id *)a6;
- (BOOL)removeDeclarationKey:(id)a3 scope:(int64_t)a4 error:(id *)a5;
- (SUCoreDDMControllerProtocol)controller;
- (SoftwareUpdateAdapter)init;
- (id)allDeclarationKeysForScope:(int64_t)a3 error:(id *)a4;
- (id)configurationClasses;
- (id)declarationKeyForConfiguration:(id)a3;
- (void)configurationUIForConfiguration:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5;
- (void)setController:(id)a3;
@end

@implementation SoftwareUpdateAdapter

- (SoftwareUpdateAdapter)init
{
  v6.receiver = self;
  v6.super_class = (Class)SoftwareUpdateAdapter;
  v2 = [(SoftwareUpdateAdapter *)&v6 init];
  if (v2)
  {
    v3 = (SUCoreDDMControllerProtocol *)[objc_alloc((Class)SUManagerClient) initWithDelegate:0 queue:&_dispatch_main_q clientType:1];
    controller = v2->_controller;
    v2->_controller = v3;
  }
  return v2;
}

- (id)configurationClasses
{
  uint64_t v4 = objc_opt_class();
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (id)allDeclarationKeysForScope:(int64_t)a3 error:(id *)a4
{
  if (a3 == 1)
  {
    objc_super v6 = +[NSSet set];
    v7 = [(SoftwareUpdateAdapter *)self controller];
    char v8 = objc_opt_respondsToSelector();

    v9 = [(SoftwareUpdateAdapter *)self controller];
    v10 = v9;
    if (v8)
    {
      id v61 = 0;
      v11 = [v9 declarationsWithError:&v61];
      id v12 = v61;

      if (v12)
      {
        v13 = +[SUCoreDDMUtilities sharedLogger];
        v14 = [v13 oslog];

        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v63 = "-[SoftwareUpdateAdapter allDeclarationKeysForScope:error:]";
          __int16 v64 = 2114;
          int64_t v65 = (int64_t)v12;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: Failed to get declarations; error = %{public}@",
            buf,
            0x16u);
        }
      }
      else if (v11 && [v11 count])
      {
        v54 = a4;
        v30 = +[SUCoreDDMUtilities sharedLogger];
        v31 = [v30 oslog];

        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v63 = "-[SoftwareUpdateAdapter allDeclarationKeysForScope:error:]";
          __int16 v64 = 2114;
          int64_t v65 = (int64_t)v11;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%s: All declarations: %{public}@", buf, 0x16u);
        }
        v53 = v6;

        v55 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v11 count]);
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        v52 = v11;
        id v32 = v11;
        id v33 = [v32 countByEnumeratingWithState:&v57 objects:v68 count:16];
        if (v33)
        {
          id v34 = v33;
          id v12 = 0;
          uint64_t v35 = *(void *)v58;
          do
          {
            for (i = 0; i != v34; i = (char *)i + 1)
            {
              if (*(void *)v58 != v35) {
                objc_enumerationMutation(v32);
              }
              v37 = *(void **)(*((void *)&v57 + 1) + 8 * i);
              v38 = [v37 declarationKey];
              id v39 = +[RMStoreDeclarationKey newDeclarationKey:v38];

              if ([v39 isValid])
              {
                [v55 addObject:v39];
              }
              else
              {
                v40 = +[SUCoreDDMUtilities sharedLogger];
                v41 = [v40 oslog];

                if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                {
                  v46 = [v37 declarationKey];
                  *(_DWORD *)buf = 136315650;
                  v63 = "-[SoftwareUpdateAdapter allDeclarationKeysForScope:error:]";
                  __int16 v64 = 2114;
                  int64_t v65 = (int64_t)v37;
                  __int16 v66 = 2114;
                  v67 = v46;
                  _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%s: %{public}@ is invalid, not adding key (%{public}@)", buf, 0x20u);
                }
                v42 = [v37 declarationKey];
                v43 = +[NSString stringWithFormat:@"Invalid declaration detected: %@", v42];

                v44 = +[SUCore sharedCore];
                uint64_t v45 = [v44 buildError:9100 underlying:0 description:v43];

                id v12 = (id)v45;
              }
            }
            id v34 = [v32 countByEnumeratingWithState:&v57 objects:v68 count:16];
          }
          while (v34);
        }
        else
        {
          id v12 = 0;
        }

        v14 = v55;
        objc_super v6 = +[NSSet setWithArray:v55];

        a4 = v54;
        v11 = v52;
      }
      else
      {
        v47 = +[SUCoreDDMUtilities sharedLogger];
        v14 = [v47 oslog];

        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v63 = "-[SoftwareUpdateAdapter allDeclarationKeysForScope:error:]";
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: No declaration found, returning empty set", buf, 0xCu);
        }
        id v12 = 0;
      }

      goto LABEL_49;
    }
    char v19 = objc_opt_respondsToSelector();

    if ((v19 & 1) == 0)
    {
      v28 = +[SUCoreDDMUtilities sharedLogger];
      v29 = [v28 oslog];

      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v63 = "-[SoftwareUpdateAdapter allDeclarationKeysForScope:error:]";
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%s: Anomaly: No controller found to get declaration keys", buf, 0xCu);
      }

      v11 = +[SUCore sharedCore];
      id v12 = [v11 buildError:9101 underlying:0 description:@"No controller found to get keys"];
      goto LABEL_49;
    }
    v20 = [(SoftwareUpdateAdapter *)self controller];
    id v56 = 0;
    v11 = [v20 declarationWithError:&v56];
    id v12 = v56;

    v21 = +[SUCoreDDMUtilities sharedLogger];
    v22 = [v21 oslog];

    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v63 = "-[SoftwareUpdateAdapter allDeclarationKeysForScope:error:]";
      __int16 v64 = 2114;
      int64_t v65 = (int64_t)v11;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s: Declaration: %{public}@", buf, 0x16u);
    }

    if (v12)
    {
      v23 = +[SUCoreDDMUtilities sharedLogger];
      v24 = [v23 oslog];

      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
LABEL_45:

LABEL_49:
        if (a4 && v12) {
          *a4 = v12;
        }

        goto LABEL_53;
      }
      *(_DWORD *)buf = 136315394;
      v63 = "-[SoftwareUpdateAdapter allDeclarationKeysForScope:error:]";
      __int16 v64 = 2114;
      int64_t v65 = (int64_t)v12;
      v25 = "%s: Failed to get declaration; error = %{public}@";
      v26 = v24;
      uint32_t v27 = 22;
    }
    else
    {
      if (v11)
      {
        v24 = [v11 declarationKey];
        id v48 = +[RMStoreDeclarationKey newDeclarationKey:v24];
        uint64_t v49 = +[NSSet setWithObject:v48];

        objc_super v6 = (void *)v49;
        goto LABEL_45;
      }
      v50 = +[SUCoreDDMUtilities sharedLogger];
      v24 = [v50 oslog];

      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_45;
      }
      *(_DWORD *)buf = 136315138;
      v63 = "-[SoftwareUpdateAdapter allDeclarationKeysForScope:error:]";
      v25 = "%s: No declaration found, returning empty set";
      v26 = v24;
      uint32_t v27 = 12;
    }
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
    goto LABEL_45;
  }
  v16 = +[SUCoreDDMUtilities sharedLogger];
  v17 = [v16 oslog];

  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v63 = "-[SoftwareUpdateAdapter allDeclarationKeysForScope:error:]";
    __int16 v64 = 2048;
    int64_t v65 = a3;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s: Error, declarations required for non system scope: (long)%ld", buf, 0x16u);
  }

  if (a4)
  {
    v18 = +[SUCore sharedCore];
    *a4 = [v18 buildError:8114 underlying:0 description:@"Software update declarations only support system scope"];
  }
  objc_super v6 = objc_opt_new();
LABEL_53:

  return v6;
}

- (BOOL)applyConfiguration:(id)a3 scope:(int64_t)a4 returningReasons:(id *)a5 error:(id *)a6
{
  id v9 = a3;
  if (a4 == 1)
  {
    v10 = [(SoftwareUpdateAdapter *)self declarationKeyForConfiguration:v9];
    v11 = +[SUCoreDDMUtilities sharedLogger];
    id v12 = [v11 oslog];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v41 = "-[SoftwareUpdateAdapter applyConfiguration:scope:returningReasons:error:]";
      __int16 v42 = 2114;
      v43[0] = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: Applying configuration with key: %{public}@", buf, 0x16u);
    }

    v13 = [v9 declaration];
    v14 = +[NSMutableDictionary dictionary];
    v15 = [v10 key];
    [v14 setSafeObject:v15 forKey:SUCorePolicyDDMConfigurationKeyRMStoreDeclarationKey];

    v16 = [v13 payloadTargetLocalDateTime];
    [v14 setSafeObject:v16 forKey:SUCorePolicyDDMConfigurationKeyTargetLocalDateTime];

    v17 = [v13 payloadTargetOSVersion];
    [v14 setSafeObject:v17 forKey:SUCorePolicyDDMConfigurationKeyTargetVersion];

    v18 = [v13 payloadTargetBuildVersion];
    [v14 setSafeObject:v18 forKey:SUCorePolicyDDMConfigurationKeyTargetBuildVersion];

    char v19 = [v13 payloadDetailsURL];
    [v14 setSafeObject:v19 forKey:SUCorePolicyDDMConfigurationKeyDetailsURL];

    v20 = +[SUCoreDDMUtilities sharedLogger];
    v21 = [v20 oslog];

    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v41 = "-[SoftwareUpdateAdapter applyConfiguration:scope:returningReasons:error:]";
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s: Scheduling update", buf, 0xCu);
    }

    v22 = [(SoftwareUpdateAdapter *)self controller];
    char v23 = objc_opt_respondsToSelector();

    if (v23)
    {
      id v24 = [objc_alloc((Class)SUCoreDDMDeclaration) initWithDeclarationKeys:v14];
      v25 = [(SoftwareUpdateAdapter *)self controller];
      id v39 = 0;
      unsigned int v26 = [v25 scheduleUpdate:v24 withError:&v39];
      id v27 = v39;
    }
    else
    {
      v30 = [(SoftwareUpdateAdapter *)self controller];
      char v31 = objc_opt_respondsToSelector();

      if ((v31 & 1) == 0)
      {
        id v34 = +[SUCoreDDMUtilities sharedLogger];
        uint64_t v35 = [v34 oslog];

        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v41 = "-[SoftwareUpdateAdapter applyConfiguration:scope:returningReasons:error:]";
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%s: Anomaly: No controller found to enforce declaration", buf, 0xCu);
        }

        id v24 = +[SUCore sharedCore];
        id v33 = [v24 buildError:9101 underlying:0 description:@"No controller found to enforce declaration"];
        unsigned int v26 = 0;
        goto LABEL_21;
      }
      id v24 = [objc_alloc((Class)SUCoreDDMDeclaration) initWithDeclarationKeys:v14];
      id v32 = [(SoftwareUpdateAdapter *)self controller];
      unsigned int v26 = [v32 scheduleUpdate:v24];

      if (v26)
      {
        id v33 = 0;
LABEL_21:

        v36 = +[SUCoreDDMUtilities sharedLogger];
        v37 = [v36 oslog];

        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v41 = "-[SoftwareUpdateAdapter applyConfiguration:scope:returningReasons:error:]";
          __int16 v42 = 1024;
          LODWORD(v43[0]) = v26;
          WORD2(v43[0]) = 2114;
          *(void *)((char *)v43 + 6) = v33;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%s: Scheduled update, result = %d, error = %{public}@", buf, 0x1Cu);
        }

        if (a6 && v33) {
          *a6 = v33;
        }

        goto LABEL_27;
      }
      v25 = +[SUCore sharedCore];
      id v27 = [v25 buildError:9102 underlying:0 description:@"Failed to schedule update"];
    }
    id v33 = v27;

    goto LABEL_21;
  }
  v28 = +[SUCoreDDMUtilities sharedLogger];
  v29 = [v28 oslog];

  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v41 = "-[SoftwareUpdateAdapter applyConfiguration:scope:returningReasons:error:]";
    __int16 v42 = 2048;
    v43[0] = a4;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%s: Error, declarations required for non system scope: (long)%ld", buf, 0x16u);
  }

  if (a6)
  {
    v10 = +[SUCore sharedCore];
    [v10 buildError:8114 underlying:0 description:@"Software update declarations only support system scope"];
    LOBYTE(v26) = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:

    goto LABEL_28;
  }
  LOBYTE(v26) = 0;
LABEL_28:

  return v26;
}

- (BOOL)removeDeclarationKey:(id)a3 scope:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = +[SUCoreDDMUtilities sharedLogger];
  v10 = [v9 oslog];

  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (a4 == 1)
  {
    if (v11)
    {
      *(_DWORD *)buf = 136315394;
      v41 = "-[SoftwareUpdateAdapter removeDeclarationKey:scope:error:]";
      __int16 v42 = 2114;
      v43[0] = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Canceling update for key %{public}@", buf, 0x16u);
    }

    id v12 = [(SoftwareUpdateAdapter *)self controller];
    char v13 = objc_opt_respondsToSelector();

    v14 = [(SoftwareUpdateAdapter *)self controller];
    if (v13)
    {
      v15 = [v8 key];
      id v39 = 0;
      unsigned int v16 = [v14 cancelUpdateForKey:v15 withError:&v39];
      id v17 = v39;
LABEL_6:

LABEL_25:
      char v31 = +[SUCoreDDMUtilities sharedLogger];
      id v32 = [v31 oslog];

      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v41 = "-[SoftwareUpdateAdapter removeDeclarationKey:scope:error:]";
        __int16 v42 = 1024;
        LODWORD(v43[0]) = v16;
        WORD2(v43[0]) = 2114;
        *(void *)((char *)v43 + 6) = v17;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%s: Canceled update, result = %d; error = %{public}@",
          buf,
          0x1Cu);
      }

      if (!a5 || !v17) {
        goto LABEL_31;
      }
      id v18 = v17;
      id v17 = v18;
LABEL_30:
      *a5 = v18;
LABEL_31:

      goto LABEL_32;
    }
    if (objc_opt_respondsToSelector())
    {
      char v19 = [(SoftwareUpdateAdapter *)self controller];
      char v20 = objc_opt_respondsToSelector();

      if (v20)
      {
        v21 = [(SoftwareUpdateAdapter *)self controller];
        id v38 = 0;
        v14 = [v21 declarationWithError:&v38];
        id v17 = v38;

        v22 = +[SUCoreDDMUtilities sharedLogger];
        char v23 = [v22 oslog];

        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v41 = "-[SoftwareUpdateAdapter removeDeclarationKey:scope:error:]";
          __int16 v42 = 2114;
          v43[0] = v14;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s: Found declaration %{public}@", buf, 0x16u);
        }

        if (!v14 || v17)
        {
          if (v17)
          {
LABEL_35:
            uint64_t v35 = +[SUCoreDDMUtilities sharedLogger];
            v15 = [v35 oslog];

            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v41 = "-[SoftwareUpdateAdapter removeDeclarationKey:scope:error:]";
              __int16 v42 = 2114;
              v43[0] = v17;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s: No declaration found, error = %{public}@", buf, 0x16u);
            }
            unsigned int v16 = 0;
            goto LABEL_6;
          }
        }
        else
        {
          id v24 = [v14 declarationKey];
          v25 = [v8 key];
          unsigned int v26 = [v24 isEqualToString:v25];

          if (v26)
          {
            id v27 = [(SoftwareUpdateAdapter *)self controller];
            unsigned int v16 = [v27 cancelUpdate:v14];

            if (v16)
            {
              id v17 = 0;
            }
            else
            {
              v36 = +[SUCore sharedCore];
              id v17 = [v36 buildError:9102 underlying:0 description:@"Failed to cancel update"];
            }
            v37 = +[SUCoreDDMUtilities sharedLogger];
            v15 = [v37 oslog];

            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v41 = "-[SoftwareUpdateAdapter removeDeclarationKey:scope:error:]";
              __int16 v42 = 1024;
              LODWORD(v43[0]) = v16;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s: Canceled update: %d", buf, 0x12u);
            }
            goto LABEL_6;
          }
        }
        id v34 = +[SUCore sharedCore];
        id v17 = [v34 buildError:9100 underlying:0 description:@"No declaration found"];

        goto LABEL_35;
      }
    }
    else
    {
    }
    v28 = +[SUCore sharedCore];
    id v17 = [v28 buildError:9101 underlying:0 description:@"No controller found to remove declaration"];

    v29 = +[SUCoreDDMUtilities sharedLogger];
    v14 = [v29 oslog];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v30 = [v8 key];
      *(_DWORD *)buf = 136315394;
      v41 = "-[SoftwareUpdateAdapter removeDeclarationKey:scope:error:]";
      __int16 v42 = 2114;
      v43[0] = v30;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: Anomaly: No controller found to cancel declaration for key %{public}@", buf, 0x16u);
    }
    unsigned int v16 = 0;
    goto LABEL_25;
  }
  if (v11)
  {
    *(_DWORD *)buf = 136315394;
    v41 = "-[SoftwareUpdateAdapter removeDeclarationKey:scope:error:]";
    __int16 v42 = 2048;
    v43[0] = a4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Error, declarations required for non system scope: (long)%ld", buf, 0x16u);
  }

  if (a5)
  {
    id v17 = +[SUCore sharedCore];
    id v18 = [v17 buildError:8114 underlying:0 description:@"Software update declarations only support system scope"];
    LOBYTE(v16) = 0;
    goto LABEL_30;
  }
  LOBYTE(v16) = 0;
LABEL_32:

  return v16;
}

- (id)declarationKeyForConfiguration:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 store];
  v5 = [v3 declaration];

  id v6 = +[RMStoreDeclarationKey newDeclarationKeyWithSubscriberIdentifier:@"com.apple.RemoteManagement.SoftwareUpdateExtension" store:v4 declaration:v5];

  return v6;
}

- (void)configurationUIForConfiguration:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  id v6 = a3;
  v46 = (void (**)(id, uint64_t, void *, void *))a5;
  v7 = +[SUCoreDDMUtilities sharedLogger];
  id v8 = [v7 oslog];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 declaration];
    v10 = [v9 declarationIdentifier];
    *(_DWORD *)buf = 136315394;
    v50 = "-[SoftwareUpdateAdapter configurationUIForConfiguration:scope:completionHandler:]";
    __int16 v51 = 2114;
    v52 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Get configuration UI for: %{public}@", buf, 0x16u);
  }
  BOOL v11 = [v6 declaration];
  id v12 = +[NSMutableArray array];
  char v13 = [v11 payloadTargetOSVersion];

  if (v13)
  {
    v14 = +[NSBundle bundleForClass:objc_opt_class()];
    v15 = [v14 localizedStringForKey:@"SU_CONFIGURATION_OS_VERSION" value:&stru_10000C498 table:0];
    v58[0] = v15;
    unsigned int v16 = [v11 payloadTargetOSVersion];
    v58[1] = v16;
    id v17 = +[NSArray arrayWithObjects:v58 count:2];
    [v12 addObject:v17];
  }
  id v18 = [v11 payloadTargetBuildVersion];

  if (v18)
  {
    char v19 = +[NSBundle bundleForClass:objc_opt_class()];
    char v20 = [v19 localizedStringForKey:@"SU_CONFIGURATION_BUILD_VERSION" value:&stru_10000C498 table:0];
    v57[0] = v20;
    v21 = [v11 payloadTargetBuildVersion];
    v57[1] = v21;
    v22 = +[NSArray arrayWithObjects:v57 count:2];
    [v12 addObject:v22];
  }
  char v23 = [v11 payloadTargetLocalDateTime];

  v47 = v6;
  if (v23)
  {
    id v24 = objc_alloc_init((Class)NSDateFormatter);
    [v24 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
    v25 = [v11 payloadTargetLocalDateTime];
    unsigned int v26 = [v24 dateFromString:v25];

    uint64_t v27 = +[NSDateFormatter localizedStringFromDate:v26 dateStyle:2 timeStyle:1];
    v28 = (void *)v27;
    if (v26 && v27)
    {
      v29 = +[NSBundle bundleForClass:objc_opt_class()];
      v30 = [v29 localizedStringForKey:@"SU_CONFIGURATION_TARGET_DATE_TIME" value:&stru_10000C498 table:0];
      v48[0] = v30;
      v48[1] = v28;
      char v31 = +[NSArray arrayWithObjects:v48 count:2];
      [v12 addObject:v31];

      uint64_t v45 = 0;
    }
    else
    {
      id v32 = +[SUCoreDDMUtilities sharedLogger];
      id v33 = [v32 oslog];

      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315906;
        v50 = "-[SoftwareUpdateAdapter configurationUIForConfiguration:scope:completionHandler:]";
        __int16 v51 = 2114;
        v52 = v11;
        __int16 v53 = 2114;
        v54 = v26;
        __int16 v55 = 2114;
        id v56 = v28;
        _os_log_fault_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_FAULT, "%s: ANOMALY: No date found for declaration? %{public}@, date: %{public}@, formattedDateString: %{public}@", buf, 0x2Au);
      }

      v29 = +[SUCore sharedCore];
      uint64_t v45 = [v29 buildError:9103 underlying:0 description:@"Invalid declaration payload"];
    }
  }
  else
  {
    uint64_t v45 = 0;
  }
  id v34 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v35 = [v34 localizedStringForKey:@"SU_CONFIGURATION_TITLE" value:&stru_10000C498 table:0];
  v36 = [v11 payloadTargetOSVersion];
  v37 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v35, v36);
  id v38 = +[NSBundle bundleForClass:objc_opt_class()];
  id v39 = [v38 localizedStringForKey:@"SU_CONFIGURATION_DESCRIPTION" value:&stru_10000C498 table:0];
  v40 = v12;
  id v41 = [v12 copy];
  __int16 v42 = +[RMConfigurationUIDetails configurationUIWithTitle:v37 description:v39 details:v41];

  v43 = +[SUCoreDDMUtilities sharedLogger];
  v44 = [v43 oslog];

  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v50 = "-[SoftwareUpdateAdapter configurationUIForConfiguration:scope:completionHandler:]";
    __int16 v51 = 2114;
    v52 = v40;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%s: Applying configuration UI: %{public}@", buf, 0x16u);
  }

  v46[2](v46, 1, v42, v45);
}

- (SUCoreDDMControllerProtocol)controller
{
  return (SUCoreDDMControllerProtocol *)objc_getProperty(self, a2, 8, 1);
}

- (void)setController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end