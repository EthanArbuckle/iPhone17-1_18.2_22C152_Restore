@interface MCDNSProxyPayloadHandler
+ (id)internalError;
+ (id)internalErrorWithUnderlyingError:(id)a3;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (MCDNSProxyPayloadHandler)initWithPayload:(id)a3 profileHandler:(id)a4;
- (void)remove;
- (void)setAside;
- (void)unsetAside;
@end

@implementation MCDNSProxyPayloadHandler

- (MCDNSProxyPayloadHandler)initWithPayload:(id)a3 profileHandler:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MCDNSProxyPayloadHandler;
  v7 = [(MCNewPayloadHandler *)&v11 initWithPayload:a3 profileHandler:v6];
  if (v7)
  {
    uint64_t v8 = [v6 profile];
    profile = v7->_profile;
    v7->_profile = (MCProfile *)v8;
  }
  return v7;
}

+ (id)internalError
{
  return [a1 internalErrorWithUnderlyingError:0];
}

+ (id)internalErrorWithUnderlyingError:(id)a3
{
  uint64_t v3 = MCDNSProxyErrorDomain;
  id v4 = a3;
  v5 = MCErrorArray();
  id v6 = +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v3, 51000, v5, v4, MCErrorTypeFatal, 0);

  return v6;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v9 = a4;
  v10 = [(MCNewPayloadHandler *)self payload];
  objc_super v11 = [v10 type];
  v12 = [v10 dnsProxyUUID];
  if (v12)
  {

    goto LABEL_7;
  }
  v13 = +[MDMConfiguration sharedConfiguration];
  unsigned int v14 = [v13 isUserEnrollment];

  if (!v14)
  {
LABEL_7:
    v18 = MCNEProfileIngestionHandlerClassForPayload();
    if (!v18)
    {
      v41 = +[NSAssertionHandler currentHandler];
      [v41 handleFailureInMethod:a2, self, @"MCDNSProxyPayloadHandler.m", 82, @"Invalid parameter not satisfying: %@", @"neProfileIngestionHandler" object file lineNumber description];
    }
    if (([v18 lockConfigurations] & 1) == 0)
    {
      if (a6)
      {
        [(id)objc_opt_class() internalError];
        unsigned __int8 v17 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        unsigned __int8 v17 = 0;
      }
      goto LABEL_37;
    }
    id v43 = v9;
    [v18 loadConfigurationsForceReloadFromDisk];
    v19 = [v10 configurationDictionary];
    v20 = +[MCVPNPayloadBase NEVPNPayloadBaseDelegateWithConfigurationDict:v19];

    if (!v20)
    {
      v42 = +[NSAssertionHandler currentHandler];
      [v42 handleFailureInMethod:a2, self, @"MCDNSProxyPayloadHandler.m", 91, @"Invalid parameter not satisfying: %@", @"payloadBase" object file lineNumber description];
    }
    [v18 createConfigurationFromPayload:v20 payloadType:v11];
    v21 = [v18 ingestedConfiguration];
    if (v21)
    {
      v22 = [v10 UUID];
      v23 = [v10 organization];
      [v21 setPayloadInfoCommon:v22 payloadOrganization:v23];

      uint64_t v24 = [v10 dnsProxyUUID];
      if (!v24
        || (v25 = (void *)v24,
            [v10 dnsProxyUUID],
            v26 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v27 = [v21 setPerAppUUID:v26 andSafariDomains:0],
            v26,
            v25,
            (v27 & 1) != 0))
      {
        id v28 = objc_alloc_init((Class)NSMutableDictionary);
        v29 = [(MCProfile *)self->_profile UUID];

        if (v29)
        {
          v30 = [(MCProfile *)self->_profile UUID];
          [v28 setObject:v30 forKeyedSubscript:kMCPayloadUUIDKey];
        }
        v31 = [(MCProfile *)self->_profile identifier];

        if (v31)
        {
          v32 = [(MCProfile *)self->_profile identifier];
          [v28 setObject:v32 forKeyedSubscript:kMCPayloadIdentifierKey];
        }
        if (v43) {
          [v28 addEntriesFromDictionary:];
        }
        [v21 setProfileInfo:v28];
        [v18 updateDefaultAfterAddingConfiguration];
        v33 = [v21 getConfigurationIdentifier];
        [v10 setPersistentResourceID:v33];

        id v44 = 0;
        unsigned __int8 v17 = [v18 saveIngestedConfiguration:&v44];
        id v34 = v44;
        if (a6 && (v17 & 1) == 0)
        {
          *a6 = [(id)objc_opt_class() internalErrorWithUnderlyingError:v34];
        }
        [v18 unlockConfigurations];

        goto LABEL_36;
      }
      v35 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Could not configure DNS proxy UUID", buf, 2u);
      }
      if (a6)
      {
        uint64_t v36 = MCDNSProxyErrorDomain;
        v37 = [(MCNewPayloadHandler *)self payload];
        v38 = [v37 displayName];
        v39 = MCErrorArray();
        +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v36, 51001, v39, MCErrorTypeFatal, v38, 0);
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      if (a6)
      {
        *a6 = [(id)objc_opt_class() internalError];
      }
      [v18 unlockConfigurations];
    }
    unsigned __int8 v17 = 0;
LABEL_36:
    id v9 = v43;

LABEL_37:
    goto LABEL_38;
  }
  if (a6)
  {
    uint64_t v15 = MCDNSProxyErrorDomain;
    v16 = MCErrorArray();
    +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v15, 51002, v16, MCErrorTypeFatal, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  unsigned __int8 v17 = 0;
LABEL_38:

  return v17;
}

- (void)setAside
{
  uint64_t v3 = [(MCNewPayloadHandler *)self payload];
  id v4 = [v3 type];
  v5 = MCNEProfileIngestionHandlerClassForPayload();

  if ([v5 lockConfigurations])
  {
    [v5 loadConfigurationsForceReloadFromDisk];
    id v6 = [(MCNewPayloadHandler *)self payload];
    v7 = [v6 persistentResourceID];
    id v8 = [v5 setAsideConfigurationName:v7 unsetAside:0];

    [v5 unlockConfigurations];
  }
  else
  {
    id v9 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Could not get NetworkExtension store lock.", v10, 2u);
    }
  }
}

- (void)unsetAside
{
  uint64_t v3 = [(MCNewPayloadHandler *)self payload];
  id v4 = [v3 type];
  v5 = MCNEProfileIngestionHandlerClassForPayload();

  if ([v5 lockConfigurations])
  {
    [v5 loadConfigurationsForceReloadFromDisk];
    id v6 = [(MCNewPayloadHandler *)self payload];
    v7 = [v6 persistentResourceID];
    id v8 = [v5 setAsideConfigurationName:v7 unsetAside:0];

    [v5 unlockConfigurations];
  }
  else
  {
    id v9 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Could not get NetworkExtension store lock.", v10, 2u);
    }
  }
}

- (void)remove
{
  uint64_t v3 = [(MCNewPayloadHandler *)self payload];
  id v4 = [v3 persistentResourceID];

  v5 = [(MCNewPayloadHandler *)self payload];
  id v6 = [v5 type];
  v7 = MCNEProfileIngestionHandlerClassForPayload();

  if ([v7 lockConfigurations])
  {
    [v7 loadConfigurationsForceReloadFromDisk];
    if (v4)
    {
      [v7 removeConfigurationWithIdentifier:v4];
    }
    else
    {
      id v9 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "NetworkUsageRules remove failed: empty configuration id", buf, 2u);
      }
    }
    [v7 updateDefaultAfterDeletingConfiguration];
    [v7 unlockConfigurations];
  }
  else
  {
    id v8 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Could not get NetworkExtension store lock. Skipping removal.", v10, 2u);
    }
  }
}

- (void).cxx_destruct
{
}

@end