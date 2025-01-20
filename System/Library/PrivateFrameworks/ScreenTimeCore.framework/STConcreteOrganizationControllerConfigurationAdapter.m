@interface STConcreteOrganizationControllerConfigurationAdapter
- (NSPersistentContainer)persistentContainer;
- (STConcreteOrganizationControllerConfigurationAdapter)initWithFamilySettingsManager:(id)a3 requestManager:(id)a4 persistentContainer:(id)a5;
- (STFamilySettingsManager)familySettingsManager;
- (STRequestManager)requestManager;
- (id)_handleConfigurationAsBlueprint:(id)a3 timeout:(unint64_t)a4;
- (id)_handleConfigurationAsSettings:(id)a3;
- (id)handleConfigurationChange:(id)a3;
@end

@implementation STConcreteOrganizationControllerConfigurationAdapter

- (STConcreteOrganizationControllerConfigurationAdapter)initWithFamilySettingsManager:(id)a3 requestManager:(id)a4 persistentContainer:(id)a5
{
  v8 = (STFamilySettingsManager *)a3;
  v9 = (STRequestManager *)a4;
  v10 = (NSPersistentContainer *)a5;
  v18.receiver = self;
  v18.super_class = (Class)STConcreteOrganizationControllerConfigurationAdapter;
  v11 = [(STConcreteOrganizationControllerConfigurationAdapter *)&v18 init];
  familySettingsManager = v11->_familySettingsManager;
  v11->_familySettingsManager = v8;
  v13 = v8;

  requestManager = v11->_requestManager;
  v11->_requestManager = v9;
  v15 = v9;

  persistentContainer = v11->_persistentContainer;
  v11->_persistentContainer = v10;

  return v11;
}

- (id)handleConfigurationChange:(id)a3
{
  id v4 = a3;
  v5 = [v4 configuration];
  unint64_t v6 = (unint64_t)[v4 configurationType];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v8 = +[STLog organizationControllerConfigurationAdapter];
  v9 = v8;
  if ((isKindOfClass & 1) == 0)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10025C830((uint64_t)v5, v9);
    }

    id v14 = objc_alloc((Class)NSError);
    uint64_t v15 = STErrorDomain;
    NSErrorUserInfoKey v35 = NSLocalizedDescriptionKey;
    v16 = +[NSString stringWithFormat:@"Unsupported configuration: %@", objc_opt_class()];
    v36 = v16;
    v17 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    id v10 = [v14 initWithDomain:v15 code:37 userInfo:v17];

    uint64_t v18 = +[STResult failure:v10];
    goto LABEL_21;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "handleConfigurationChange - configuration is a dictionary", buf, 2u);
  }

  id v10 = v5;
  v11 = +[STLog organizationControllerConfigurationAdapter];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    unint64_t v12 = (unint64_t)[v4 configurationType] - 1;
    if (v12 > 5) {
      CFStringRef v13 = @"Invalid";
    }
    else {
      CFStringRef v13 = off_1002FBB28[v12];
    }
    v19 = [v4 author];
    *(_DWORD *)buf = 138543618;
    CFStringRef v32 = v13;
    __int16 v33 = 2114;
    v34 = v19;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Handling configuration changes of type '%{public}@' by author: %{public}@", buf, 0x16u);
  }
  if (v6 <= 6)
  {
    if (((1 << v6) & 0x74) != 0)
    {
      v20 = +[STLog organizationControllerConfigurationAdapter];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Handling configuration changes as 'blueprint'", buf, 2u);
      }

      uint64_t v18 = [(STConcreteOrganizationControllerConfigurationAdapter *)self _handleConfigurationAsBlueprint:v10 timeout:60];
LABEL_21:
      unint64_t v6 = v18;
      goto LABEL_22;
    }
    if (((1 << v6) & 0xA) != 0)
    {
      v21 = +[STLog organizationControllerConfigurationAdapter];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Handling configuration changes as 'settings'", buf, 2u);
      }

      uint64_t v18 = [(STConcreteOrganizationControllerConfigurationAdapter *)self _handleConfigurationAsSettings:v10];
      goto LABEL_21;
    }
    id v23 = objc_alloc((Class)NSError);
    uint64_t v24 = STErrorDomain;
    v25 = +[NSString stringWithFormat:@"Unsupported configuration: %@ - %@", objc_opt_class(), @"Invalid", NSLocalizedDescriptionKey];
    v30 = v25;
    v26 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    id v27 = [v23 initWithDomain:v24 code:37 userInfo:v26];

    v28 = +[STLog organizationControllerConfigurationAdapter];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_10025C7C8();
    }

    unint64_t v6 = +[STResult failure:v27];
  }
LABEL_22:

  return (id)v6;
}

- (id)_handleConfigurationAsBlueprint:(id)a3 timeout:(unint64_t)a4
{
  id v6 = a3;
  v7 = +[STLog organizationControllerConfigurationAdapter];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134349056;
    *(void *)((char *)&buf + 4) = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Entered _handleConfigurationAsBlueprint with timeout: %{public}lld", (uint8_t *)&buf, 0xCu);
  }

  id v39 = v6;
  CFStringRef v40 = @"Blueprints";
  v8 = +[NSArray arrayWithObjects:&v39 count:1];
  v41 = v8;
  v9 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];

  id v10 = [STUnifiedTransportPayload alloc];
  CFStringRef v37 = @"TreatPayloadAsDelta";
  CFStringRef v38 = @"YES";
  v11 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
  unint64_t v12 = [(STUnifiedTransportPayload *)v10 initWithPayload:v9 type:@"RMUnifiedTransportPayloadTypeBlueprints" userInfo:v11];

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v33 = 0x3032000000;
  v34 = sub_10001AB24;
  NSErrorUserInfoKey v35 = sub_10001AB34;
  id v36 = 0;
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  id v14 = [(STConcreteOrganizationControllerConfigurationAdapter *)self requestManager];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10001AB3C;
  v27[3] = &unk_1002FBA80;
  p_long long buf = &buf;
  uint64_t v15 = v13;
  v28 = v15;
  [v14 persistBlueprintsFromBlueprintPayload:v12 withCompletion:v27];

  dispatch_time_t v16 = dispatch_time(0, 1000000000 * a4);
  if (dispatch_semaphore_wait(v15, v16))
  {
    v17 = +[STLog organizationControllerConfigurationAdapter];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10025C8C4(v17);
    }

    id v18 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
    CFStringRef v31 = @"Request manager persist blueprints operation timed out";
    v19 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    id v20 = [v18 initWithDomain:STErrorDomain code:38 userInfo:v19];

    uint64_t v21 = +[STResult failure:v20];
    v22 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v21;
  }
  id v23 = +[STLog organizationControllerConfigurationAdapter];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v26 = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Synchronous request manager persisting blueprints - succeeded", v26, 2u);
  }

  id v24 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return v24;
}

- (id)_handleConfigurationAsSettings:(id)a3
{
  id v4 = a3;
  v5 = +[STLog organizationControllerConfigurationAdapter];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Entered _handleConfigurationAsSettings", buf, 2u);
  }

  id v6 = [(STConcreteOrganizationControllerConfigurationAdapter *)self persistentContainer];
  id v7 = [v6 newBackgroundContext];

  *(void *)long long buf = 0;
  v19 = buf;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = sub_10001AB24;
  v22 = sub_10001AB34;
  id v23 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001AFCC;
  v14[3] = &unk_1002FBB08;
  v14[4] = self;
  id v8 = v4;
  id v15 = v8;
  id v9 = v7;
  id v16 = v9;
  v17 = buf;
  [v9 performBlockAndWait:v14];
  id v10 = +[STLog organizationControllerConfigurationAdapter];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_semaphore_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Exiting _handleConfigurationAsSettings - succeeded", v13, 2u);
  }

  id v11 = *((id *)v19 + 5);
  _Block_object_dispose(buf, 8);

  return v11;
}

- (STFamilySettingsManager)familySettingsManager
{
  return (STFamilySettingsManager *)objc_getProperty(self, a2, 8, 1);
}

- (STRequestManager)requestManager
{
  return (STRequestManager *)objc_getProperty(self, a2, 16, 1);
}

- (NSPersistentContainer)persistentContainer
{
  return (NSPersistentContainer *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentContainer, 0);
  objc_storeStrong((id *)&self->_requestManager, 0);
  objc_storeStrong((id *)&self->_familySettingsManager, 0);
}

@end