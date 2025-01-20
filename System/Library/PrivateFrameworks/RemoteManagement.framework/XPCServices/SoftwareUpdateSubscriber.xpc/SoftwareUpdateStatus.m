@interface SoftwareUpdateStatus
+ (id)supportedStatusClasses;
+ (id)supportedStatusKeys;
- (SoftwareUpdateStatus)init;
- (void)queryForStatusWithKeyPaths:(id)a3 store:(id)a4 completionHandler:(id)a5;
@end

@implementation SoftwareUpdateStatus

- (SoftwareUpdateStatus)init
{
  v6.receiver = self;
  v6.super_class = (Class)SoftwareUpdateStatus;
  v2 = [(SoftwareUpdateStatus *)&v6 init];
  if (v2)
  {
    v3 = (SUCoreDDMControllerProtocol *)[objc_alloc((Class)SUManagerClient) initWithDelegate:0 clientType:1];
    controller = v2->_controller;
    v2->_controller = v3;
  }
  return v2;
}

+ (id)supportedStatusKeys
{
  v5[0] = SUCorePolicyDDMStatusKeyInstallReason;
  v5[1] = SUCorePolicyDDMStatusKeyPendingVersion;
  v5[2] = SUCorePolicyDDMStatusKeyInstallState;
  v5[3] = SUCorePolicyDDMStatusKeyFailureReason;
  v5[4] = SUCorePolicyDDMStatusKeyDeviceID;
  v5[5] = SUCorePolicyDDMStatusKeyBetaEnrollment;
  v2 = +[NSArray arrayWithObjects:v5 count:6];
  v3 = +[NSSet setWithArray:v2];

  return v3;
}

+ (id)supportedStatusClasses
{
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v2 = +[NSArray arrayWithObjects:v4 count:6];

  return v2;
}

- (void)queryForStatusWithKeyPaths:(id)a3 store:(id)a4 completionHandler:(id)a5
{
  objc_super v6 = (__CFString *)a3;
  id v33 = a5;
  v7 = +[SUCoreDDMUtilities sharedLogger];
  v8 = [v7 oslog];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v44 = "-[SoftwareUpdateStatus queryForStatusWithKeyPaths:store:completionHandler:]";
    __int16 v45 = 2114;
    v46 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Querying status for key paths: %{public}@", buf, 0x16u);
  }

  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obj = v6;
  id v10 = [(__CFString *)obj countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v39;
    uint64_t v13 = SUCorePolicyDDMStatusKeyDeviceID;
    uint64_t v14 = SUCorePolicyDDMStatusKeyBetaEnrollment;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v39 != v12) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        if ([v16 isEqualToString:v13])
        {
          v17 = +[SUUtility currentProductType];
          [v9 setObject:v17 forKeyedSubscript:v13];
        }
        if ([v16 isEqualToString:v14])
        {
          v18 = +[SDBetaManager sharedManager];
          v19 = [v18 enrolledBetaProgramForCurrentDevice];

          v20 = [v19 title];
          [v9 setObject:v20 forKeyedSubscript:v14];
        }
      }
      id v11 = [(__CFString *)obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v11);
  }

  if (self->_controller)
  {
    v21 = (void (**)(void, void, void))v33;
    if (objc_opt_respondsToSelector())
    {
      v22 = +[SUCoreDDMUtilities sharedLogger];
      v23 = [v22 oslog];

      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v44 = "-[SoftwareUpdateStatus queryForStatusWithKeyPaths:store:completionHandler:]";
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s: Querying for status", buf, 0xCu);
      }

      controller = self->_controller;
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = __75__SoftwareUpdateStatus_queryForStatusWithKeyPaths_store_completionHandler___block_invoke;
      v35[3] = &unk_10000C338;
      v36 = (__CFString *)v9;
      id v37 = v33;
      [(SUCoreDDMControllerProtocol *)controller getDDMStatusWithKeys:obj completion:v35];

      v25 = v36;
      goto LABEL_26;
    }
    if (self->_controller)
    {
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = @"nil";
    }
  }
  else
  {
    v25 = @"nil";
    v21 = (void (**)(void, void, void))v33;
  }
  v27 = +[SUCoreDDMUtilities sharedLogger];
  v28 = [v27 oslog];

  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v44 = "-[SoftwareUpdateStatus queryForStatusWithKeyPaths:store:completionHandler:]";
    __int16 v45 = 2114;
    v46 = v25;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%s: No valid controller (%{public}@)", buf, 0x16u);
  }

  v29 = +[SUCore sharedCore];
  v30 = +[NSString stringWithFormat:@"No valid controller: %@", v25];
  v31 = [v29 buildError:8122 underlying:0 description:v30];

  ((void (**)(void, void, void *))v21)[2](v21, 0, v31);
LABEL_26:
}

void __75__SoftwareUpdateStatus_queryForStatusWithKeyPaths_store_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) addEntriesFromDictionary:a2];
  objc_super v6 = +[SUCoreDDMUtilities sharedLogger];
  v7 = [v6 oslog];

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 136315650;
    id v10 = "-[SoftwareUpdateStatus queryForStatusWithKeyPaths:store:completionHandler:]_block_invoke";
    __int16 v11 = 2114;
    uint64_t v12 = v8;
    __int16 v13 = 2114;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Reporting status %{public}@ %{public}@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
}

@end