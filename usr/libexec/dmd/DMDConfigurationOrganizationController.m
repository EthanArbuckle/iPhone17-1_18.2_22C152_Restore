@interface DMDConfigurationOrganizationController
- (DMDConfigurationOrganizationController)initWithOrganization:(id)a3 delegate:(id)a4;
- (DMDConfigurationOrganizationControllerDelegate)delegate;
- (DMFConfigurationOrganization)organization;
- (NSArray)configurationSourceControllers;
- (NSArray)ephemeralConfigurationSources;
- (NSArray)persistentConfigurationSources;
- (NSMutableDictionary)ephemeralConfigurationSourceControllersByIdentifier;
- (NSMutableDictionary)persistentConfigurationSourceControllersByIdentifier;
- (NSString)description;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)type;
- (id)configurationSourceWithIdentifier:(id)a3;
- (id)registerConfigurationSource:(id)a3;
- (void)configurationSourceController:(id)a3 fetchEventsWithCompletionHandler:(id)a4;
- (void)configurationSourceController:(id)a3 fetchStatusUpdatesWithCompletionHandler:(id)a4;
- (void)resolveAssetWithContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setEphemeralConfigurationSourceControllersByIdentifier:(id)a3;
- (void)setPersistentConfigurationSourceControllersByIdentifier:(id)a3;
- (void)setType:(id)a3;
- (void)unregisterConfigurationSource:(id)a3;
- (void)updateWithOrganization:(id)a3;
@end

@implementation DMDConfigurationOrganizationController

- (DMDConfigurationOrganizationController)initWithOrganization:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)DMDConfigurationOrganizationController;
  v8 = [(DMDConfigurationOrganizationController *)&v16 init];
  if (v8)
  {
    uint64_t v9 = [v6 identifier];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    objc_storeWeak((id *)&v8->_delegate, v7);
    uint64_t v11 = objc_opt_new();
    persistentConfigurationSourceControllersByIdentifier = v8->_persistentConfigurationSourceControllersByIdentifier;
    v8->_persistentConfigurationSourceControllersByIdentifier = (NSMutableDictionary *)v11;

    uint64_t v13 = objc_opt_new();
    ephemeralConfigurationSourceControllersByIdentifier = v8->_ephemeralConfigurationSourceControllersByIdentifier;
    v8->_ephemeralConfigurationSourceControllersByIdentifier = (NSMutableDictionary *)v13;

    [(DMDConfigurationOrganizationController *)v8 updateWithOrganization:v6];
  }

  return v8;
}

- (void)updateWithOrganization:(id)a3
{
  id v5 = a3;
  if (!+[NSThread isMainThread])
  {
    v32 = +[NSAssertionHandler currentHandler];
    v33 = NSStringFromSelector(a2);
    [v32 handleFailureInMethod:a2, self, @"DMDConfigurationOrganizationController.m", 44, @"%@ must be called from the main thread", v33 object file lineNumber description];
  }
  id v6 = [(DMDConfigurationOrganizationController *)self identifier];
  id v7 = [v5 identifier];
  unsigned __int8 v8 = [v6 isEqualToString:v7];

  if ((v8 & 1) == 0)
  {
    v34 = +[NSAssertionHandler currentHandler];
    [v34 handleFailureInMethod:a2, self, @"DMDConfigurationOrganizationController.m", 45, @"Invalid parameter not satisfying: %@", @"[self.identifier isEqualToString:organization.identifier]" object file lineNumber description];
  }
  uint64_t v9 = [v5 displayName];
  [(DMDConfigurationOrganizationController *)self setDisplayName:v9];

  v10 = [v5 type];
  [(DMDConfigurationOrganizationController *)self setType:v10];

  v35 = v5;
  uint64_t v11 = [v5 persistentConfigurationSources];
  v12 = [v11 valueForKey:@"identifier"];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v13 = [(DMDConfigurationOrganizationController *)self persistentConfigurationSourceControllersByIdentifier];
  v14 = [v13 allKeys];

  id v15 = [v14 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v41;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v41 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v40 + 1) + 8 * i);
        if (([v12 containsObject:v19] & 1) == 0)
        {
          v20 = [(DMDConfigurationOrganizationController *)self persistentConfigurationSourceControllersByIdentifier];
          [v20 removeObjectForKey:v19];
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v16);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v21 = v11;
  id v22 = [v21 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v37;
    do
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(void *)v37 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v36 + 1) + 8 * (void)j);
        v27 = [(DMDConfigurationOrganizationController *)self persistentConfigurationSourceControllersByIdentifier];
        v28 = [v26 identifier];
        v29 = [v27 objectForKeyedSubscript:v28];

        if (v29) {
          [(DMDConfigurationSourceController *)v29 updateWithConfigurationSource:v26];
        }
        else {
          v29 = [[DMDConfigurationSourceController alloc] initWithConfigurationSource:v26 delegate:self];
        }
        v30 = [(DMDConfigurationOrganizationController *)self persistentConfigurationSourceControllersByIdentifier];
        v31 = [v26 identifier];
        [v30 setObject:v29 forKeyedSubscript:v31];
      }
      id v23 = [v21 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v23);
  }
}

- (NSString)description
{
  CFStringRef v5 = @"organization";
  v2 = +[NSArray arrayWithObjects:&v5 count:1];
  v3 = DMFObjectDescriptionWithProperties();

  return (NSString *)v3;
}

- (DMFConfigurationOrganization)organization
{
  v3 = objc_opt_new();
  v4 = [(DMDConfigurationOrganizationController *)self identifier];
  [v3 setIdentifier:v4];

  CFStringRef v5 = [(DMDConfigurationOrganizationController *)self displayName];
  [v3 setDisplayName:v5];

  id v6 = [(DMDConfigurationOrganizationController *)self type];
  [v3 setType:v6];

  id v7 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  unsigned __int8 v8 = [(DMDConfigurationOrganizationController *)self configurationSourceControllers];
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [*(id *)(*((void *)&v15 + 1) + 8 * i) configurationSource];
        [v7 addObject:v13];
      }
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  [v3 setRegisteredConfigurationSources:v7];

  return (DMFConfigurationOrganization *)v3;
}

- (NSArray)configurationSourceControllers
{
  v3 = objc_opt_new();
  v4 = [(DMDConfigurationOrganizationController *)self persistentConfigurationSources];
  [v3 addObjectsFromArray:v4];

  CFStringRef v5 = [(DMDConfigurationOrganizationController *)self ephemeralConfigurationSources];
  [v3 addObjectsFromArray:v5];

  id v6 = [v3 copy];

  return (NSArray *)v6;
}

- (NSArray)persistentConfigurationSources
{
  v2 = [(DMDConfigurationOrganizationController *)self persistentConfigurationSourceControllersByIdentifier];
  v3 = [v2 allValues];

  return (NSArray *)v3;
}

- (NSArray)ephemeralConfigurationSources
{
  v2 = [(DMDConfigurationOrganizationController *)self ephemeralConfigurationSourceControllersByIdentifier];
  v3 = [v2 allValues];

  return (NSArray *)v3;
}

- (id)configurationSourceWithIdentifier:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [(DMDConfigurationOrganizationController *)self persistentConfigurationSourceControllersByIdentifier];
  id v6 = [v5 objectForKeyedSubscript:v4];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = [(DMDConfigurationOrganizationController *)self ephemeralConfigurationSourceControllersByIdentifier];
    id v8 = [v9 objectForKeyedSubscript:v4];
  }

  return v8;
}

- (id)registerConfigurationSource:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [(DMDConfigurationOrganizationController *)self persistentConfigurationSourceControllersByIdentifier];
  id v6 = [v4 identifier];
  id v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    [(DMDConfigurationSourceController *)v7 updateWithConfigurationSource:v4];
  }
  else
  {
    id v8 = [(DMDConfigurationOrganizationController *)self ephemeralConfigurationSourceControllersByIdentifier];
    id v9 = [v4 identifier];
    id v7 = [v8 objectForKeyedSubscript:v9];

    if (v7) {
      [(DMDConfigurationSourceController *)v7 updateWithConfigurationSource:v4];
    }
    else {
      id v7 = [[DMDConfigurationSourceController alloc] initWithConfigurationSource:v4 delegate:self];
    }
    id v10 = [(DMDConfigurationOrganizationController *)self ephemeralConfigurationSourceControllersByIdentifier];
    uint64_t v11 = [v4 identifier];
    [v10 setObject:v7 forKeyedSubscript:v11];
  }
  v12 = v7;

  return v12;
}

- (void)unregisterConfigurationSource:(id)a3
{
  id v4 = a3;
  id v6 = [(DMDConfigurationOrganizationController *)self ephemeralConfigurationSourceControllersByIdentifier];
  CFStringRef v5 = [v4 organizationIdentifier];

  [v6 removeObjectForKey:v5];
}

- (void)configurationSourceController:(id)a3 fetchStatusUpdatesWithCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DMDConfigurationOrganizationController *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(DMDConfigurationOrganizationController *)self delegate];
    [v10 configurationSourceController:v6 fetchStatusUpdatesWithCompletionHandler:v7];
  }
  else
  {
    uint64_t v11 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100081C88(self, "configurationSourceController:fetchStatusUpdatesWithCompletionHandler:");
    }

    (*((void (**)(id, void, void, void))v7 + 2))(v7, 0, 0, 0);
  }
}

- (void)configurationSourceController:(id)a3 fetchEventsWithCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DMDConfigurationOrganizationController *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(DMDConfigurationOrganizationController *)self delegate];
    [v10 configurationSourceController:v6 fetchEventsWithCompletionHandler:v7];
  }
  else
  {
    uint64_t v11 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100081C88(self, "configurationSourceController:fetchEventsWithCompletionHandler:");
    }

    (*((void (**)(id, void, void, void))v7 + 2))(v7, 0, 0, 0);
  }
}

- (void)resolveAssetWithContext:(id)a3
{
  id v8 = a3;
  id v4 = [(DMDConfigurationOrganizationController *)self persistentConfigurationSources];
  uint64_t v5 = [v4 firstObject];
  if (v5)
  {
    id v6 = (void *)v5;

LABEL_4:
    [v6 resolveAssetWithContext:v8];
    goto LABEL_5;
  }
  id v7 = [(DMDConfigurationOrganizationController *)self ephemeralConfigurationSources];
  id v6 = [v7 firstObject];

  if (v6) {
    goto LABEL_4;
  }
  id v6 = DMFErrorWithCodeAndUserInfo();
  [v8 assetResolutionFailedWithError:v6];
LABEL_5:
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (DMDConfigurationOrganizationControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DMDConfigurationOrganizationControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)persistentConfigurationSourceControllersByIdentifier
{
  return self->_persistentConfigurationSourceControllersByIdentifier;
}

- (void)setPersistentConfigurationSourceControllersByIdentifier:(id)a3
{
}

- (NSMutableDictionary)ephemeralConfigurationSourceControllersByIdentifier
{
  return self->_ephemeralConfigurationSourceControllersByIdentifier;
}

- (void)setEphemeralConfigurationSourceControllersByIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ephemeralConfigurationSourceControllersByIdentifier, 0);
  objc_storeStrong((id *)&self->_persistentConfigurationSourceControllersByIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end