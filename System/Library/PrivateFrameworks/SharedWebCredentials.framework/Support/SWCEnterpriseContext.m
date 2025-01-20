@interface SWCEnterpriseContext
- (BOOL)isManaging;
- (NSData)state;
- (SWCEnterpriseContext)init;
- (id)isApplicationIdentifierEligibleForManagedMode:(id)a3 error:(id *)a4;
- (id)serviceSpecifiersForApplicationIdentifier:(id)a3 error:(id *)a4;
- (void)_loadEnterpriseData;
@end

@implementation SWCEnterpriseContext

- (SWCEnterpriseContext)init
{
  v5.receiver = self;
  v5.super_class = (Class)SWCEnterpriseContext;
  v2 = [(SWCEnterpriseContext *)&v5 init];
  if (v2)
  {
    v3 = +[_SWCPrefs sharedPrefs];
    v2->_appleInternal = [v3 isAppleInternal];

    [(SWCEnterpriseContext *)v2 _loadEnterpriseData];
  }
  return v2;
}

- (id)serviceSpecifiersForApplicationIdentifier:(id)a3 error:(id *)a4
{
  id v7 = a3;
  v8 = v7;
  if (!self->_associatedDomains)
  {
    v12 = self->_highLevelError;
    v11 = 0;
    if (!a4) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  v9 = [v7 bundleIdentifier];
  if (!v9)
  {
    v15 = +[NSAssertionHandler currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SWCEnterpriseContext.mm", 93, @"Failed to get a string value from %@", v8 object file lineNumber description];
  }
  v10 = [(NSDictionary *)self->_associatedDomains objectForKeyedSubscript:v9];
  if (v10)
  {
    id v16 = 0;
    v11 = +[_SWCServiceSpecifier serviceSpecifiersWithEntitlementValue:v10 error:&v16];
    v12 = (NSError *)v16;
    if (v11) {
      id v13 = v11;
    }
  }
  else
  {
    v12 = 0;
    v11 = &__NSArray0__struct;
  }

  if (a4)
  {
LABEL_12:
    if (!v11) {
      *a4 = v12;
    }
  }
LABEL_14:

  return v11;
}

- (id)isApplicationIdentifierEligibleForManagedMode:(id)a3 error:(id *)a4
{
  id v7 = a3;
  v8 = (void *)_SWCDiagnosticStorage[1];
  if (v8 && self->_appleInternal)
  {
    v9 = v8;
  }
  else
  {
    v9 = self->_managedModeAppIDs;
    if (!v9)
    {
      v11 = 0;
      if (!a4) {
        goto LABEL_12;
      }
      goto LABEL_10;
    }
  }
  v10 = [v7 bundleIdentifier];
  if (!v10)
  {
    id v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SWCEnterpriseContext.mm", 142, @"Failed to get a string value from %@", v7 object file lineNumber description];
  }
  v11 = +[NSNumber numberWithBool:[(NSSet *)v9 containsObject:v10]];

  if (a4)
  {
LABEL_10:
    if (!v11) {
      *a4 = self->_highLevelError;
    }
  }
LABEL_12:

  return v11;
}

- (NSData)state
{
  if ([(NSDictionary *)self->_associatedDomains count] || [(NSSet *)self->_managedModeAppIDs count])
  {
    id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
    if ([(NSDictionary *)self->_associatedDomains count]) {
      [v4 addObject:self->_associatedDomains];
    }
    if ([(NSSet *)self->_managedModeAppIDs count])
    {
      objc_super v5 = [(NSSet *)self->_managedModeAppIDs allObjects];
      [v4 addObject:v5];
    }
    v6 = +[NSJSONSerialization dataWithJSONObject:v4 options:2 error:0];
    id v7 = v6;
    if (v6)
    {
      memset(v11, 0, sizeof(v11));
      id v8 = v6;
      CC_SHA256(objc_msgSend(v8, "bytes", 0, 0, 0, 0), (CC_LONG)objc_msgSend(v8, "length"), (unsigned __int8 *)v11);
      id v9 = [objc_alloc((Class)NSData) initWithBytes:v11 length:32];
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
  return (NSData *)v9;
}

- (BOOL)isManaging
{
  return self->_managing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highLevelError, 0);
  objc_storeStrong((id *)&self->_managedModeAppIDs, 0);
  objc_storeStrong((id *)&self->_associatedDomains, 0);
}

- (void)_loadEnterpriseData
{
  if (qword_100032878 != -1) {
    dispatch_once(&qword_100032878, &stru_10002C908);
  }
  if (qword_100032880)
  {
    v33 = [(id)qword_100032880 sharedConnection];
    uint64_t v2 = [v33 associatedDomainsForManagedApps];
    v3 = (void *)v2;
    if (v2)
    {
      uint64_t v32 = v2;
      id v4 = objc_alloc_init((Class)NSMutableDictionary);
      id v36 = objc_alloc_init((Class)NSMutableSet);
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id obj = v3;
      id v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v48, 16, v32);
      if (v5)
      {
        uint64_t v6 = *(void *)v39;
        do
        {
          for (i = 0; i != v5; i = (char *)i + 1)
          {
            if (*(void *)v39 != v6) {
              objc_enumerationMutation(obj);
            }
            id v8 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            id v9 = [v8 objectForKeyedSubscript:@"BundleID"];
            v10 = [v8 objectForKeyedSubscript:@"AssociatedDomains"];
            [v4 setObject:v10 forKeyedSubscript:v9];
            v11 = [v8 objectForKeyedSubscript:@"AssociatedDomainsEnableDirectDownloads"];
            if ([v11 BOOLValue]) {
              [v36 addObject:v9];
            }
          }
          id v5 = [obj countByEnumeratingWithState:&v38 objects:v48 count:16];
        }
        while (v5);
      }

      unint64_t v12 = (unint64_t)[v4 copy];
      unint64_t v13 = (unint64_t)[v36 copy];

      id v14 = 0;
      int v15 = 1;
      goto LABEL_22;
    }
    id v16 = objc_alloc((Class)NSError);
    v47[0] = &off_10002E650;
    v46[0] = @"Line";
    v46[1] = @"Function";
    v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCEnterpriseContext(CPMCInterop) _loadEnterpriseData]");
    v46[2] = NSDebugDescriptionErrorKey;
    v47[1] = v17;
    v47[2] = @"Failed to get associated domain data from ManagedConfiguration framework.";
    v18 = +[NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:3];
    id v14 = [v16 initWithDomain:_SWCErrorDomain code:1701 userInfo:v18];
  }
  else
  {
    id v14 = (id)qword_100032870;
  }
  if (qword_100032890 != -1) {
    dispatch_once(&qword_100032890, &stru_10002C928);
  }
  v19 = qword_100032888;
  if (os_log_type_enabled((os_log_t)qword_100032888, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v45 = v14;
    _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Error getting enterprise-managed associated domains data. If this device is not enterprise-managed, this is normal: %@", buf, 0xCu);
  }
  int v15 = 0;
  unint64_t v12 = 0;
  unint64_t v13 = 0;
LABEL_22:
  if (v15)
  {
    id v20 = [(id)v12 copy];
    v21 = v20;
    if (v20) {
      v22 = v20;
    }
    else {
      v22 = &__NSDictionary0__struct;
    }
    objc_storeStrong((id *)&self->_associatedDomains, v22);

    id v23 = [(id)v13 copy];
    v24 = v23;
    if (v23)
    {
      v25 = (NSSet *)v23;
    }
    else
    {
      v25 = +[NSSet set];
    }
    managedModeAppIDs = self->_managedModeAppIDs;
    self->_managedModeAppIDs = v25;

    self->_managing = (v12 | v13) != 0;
  }
  else if (v14)
  {
    objc_storeStrong((id *)&self->_highLevelError, v14);
  }
  else
  {
    id v26 = objc_alloc((Class)NSError);
    v42[0] = @"Line";
    v42[1] = @"Function";
    v43[0] = &off_10002E668;
    v27 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCEnterpriseContext(CPMCInterop) _loadEnterpriseData]");
    v43[1] = v27;
    v28 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
    v29 = (NSError *)[v26 initWithDomain:_SWCErrorDomain code:-1 userInfo:v28];
    highLevelError = self->_highLevelError;
    self->_highLevelError = v29;
  }
}

@end