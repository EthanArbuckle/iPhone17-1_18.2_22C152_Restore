@interface PersonalizedSensingServiceDelegate
- (BOOL)clientConnection:(id)a3 hasEntitlement:(id)a4;
- (BOOL)isExecutableAllowed:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)executablePathOfConnection:(id)a3;
- (id)getClientAlternateIdentifierForConnection:(id)a3;
- (id)getClientBundleIdentifierForConnection:(id)a3;
- (id)processName:(id)a3;
@end

@implementation PersonalizedSensingServiceDelegate

- (BOOL)clientConnection:(id)a3 hasEntitlement:(id)a4
{
  v5 = [a3 valueForEntitlement:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    v7 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v29) = [v6 count];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "PSService,entitlementCheck,arrayEntriesCount,%d", buf, 8u);
    }
    v23 = v5;

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v24 objects:v36 count:16];
    if (v9)
    {
      id v10 = v9;
      char v11 = 0;
      uint64_t v12 = *(void *)v25;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            unsigned __int8 v15 = [@"NLData" isEqualToString:v14];
            p_BOOL hasEntitlementForNLData = &self->hasEntitlementForNLData;
            if ((v15 & 1) != 0
              || (unsigned int v17 = [@"StructuredData" isEqualToString:v14],
                  p_BOOL hasEntitlementForNLData = &self->hasEntitlementForStructuredData,
                  v17))
            {
              char v11 = 1;
              BOOL *p_hasEntitlementForNLData = 1;
            }
            v18 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              BOOL hasEntitlementForNLData = self->hasEntitlementForNLData;
              BOOL hasEntitlementForStructuredData = self->hasEntitlementForStructuredData;
              *(_DWORD *)buf = 138413058;
              uint64_t v29 = v14;
              __int16 v30 = 1024;
              int v31 = v11 & 1;
              __int16 v32 = 1024;
              BOOL v33 = hasEntitlementForNLData;
              __int16 v34 = 1024;
              BOOL v35 = hasEntitlementForStructuredData;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "PSService,entitlementCheck,entry,%@,returnValue,%d,hasEntitlementForNLData,%d,hasEntitlementForStructuredData,%d", buf, 0x1Eu);
            }
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v24 objects:v36 count:16];
      }
      while (v10);
    }
    else
    {
      char v11 = 0;
    }

    BOOL v21 = v11 & 1;
    v5 = v23;
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (id)executablePathOfConnection:(id)a3
{
  id v3 = a3;
  bzero(buffer, 0x1000uLL);
  memset(&v6, 0, sizeof(v6));
  if (v3) {
    objc_msgSend(v3, "auditToken", *(_OWORD *)v6.val, *(_OWORD *)&v6.val[4]);
  }
  if (proc_pidpath_audittoken(&v6, buffer, 0x1000u) < 1)
  {
    v4 = 0;
  }
  else
  {
    v4 = +[NSString stringWithUTF8String:buffer];
  }

  return v4;
}

- (id)processName:(id)a3
{
  id v3 = a3;
  bzero(buffer, 0x1000uLL);
  memset(v9, 0, sizeof(v9));
  if (v3) {
    pid_t v4 = [v3 processIdentifier];
  }
  else {
    pid_t v4 = getpid();
  }
  proc_pidpath(v4, buffer, 0x1000u);
  int v5 = strlen(buffer);
  if ((v5 & 0x80000000) == 0)
  {
    do
    {
      if (buffer[v5] == 47) {
        break;
      }
    }
    while (v5-- > 0);
  }
  __strlcpy_chk();
  id v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%s", v9);

  return v7;
}

- (BOOL)isExecutableAllowed:(id)a3
{
  id v4 = a3;
  int v5 = +[NSSet setWithObjects:@"photoanalysisd", @"momentsmotc", 0];
  audit_token_t v6 = [(PersonalizedSensingServiceDelegate *)self processName:v4];

  LOBYTE(v4) = [v5 containsObject:v6];
  return (char)v4;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  audit_token_t v6 = [(PersonalizedSensingServiceDelegate *)self processName:v5];
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v30 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "PSService, client name,%@", buf, 0xCu);
  }

  unint64_t v8 = +[MOPlatformInfo generativeModelsAvailabilityStatus];
  id v9 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v30) = v8 == 1;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "isGMSAvailable,%d", buf, 8u);
  }

  if ((_os_feature_enabled_impl() & 1) == 0 && v8 != 1)
  {
    id v10 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[PersonalizedSensingServiceDelegate listener:shouldAcceptNewConnection:]((uint64_t)v6, v10);
    }
LABEL_14:

    [v5 invalidate];
    BOOL v11 = 0;
    goto LABEL_19;
  }
  if (![(PersonalizedSensingServiceDelegate *)self clientConnection:v5 hasEntitlement:@"com.apple.personalized-sensing-service"])
  {
    id v10 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[PersonalizedSensingServiceDelegate listener:shouldAcceptNewConnection:](v10);
    }
    goto LABEL_14;
  }
  if (v5) {
    [v5 auditToken];
  }
  else {
    memset(v28, 0, sizeof(v28));
  }
  id v27 = 0;
  uint64_t v12 = +[LSBundleRecord bundleRecordForAuditToken:v28 error:&v27];
  id v13 = v27;
  uint64_t v14 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    unsigned __int8 v15 = [v12 bundleIdentifier];
    unsigned int v16 = [v5 processIdentifier];
    *(_DWORD *)buf = 138412802;
    __int16 v30 = v15;
    __int16 v31 = 1024;
    unsigned int v32 = v16;
    __int16 v33 = 2112;
    id v34 = v5;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "PSService,Accepting connection from process %@:%d (%@)", buf, 0x1Cu);
  }
  unsigned int v17 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___PersonalizedSensingServiceProtocol];
  [v5 setExportedInterface:v17];
  v18 = [[PersonalizedSensingService alloc] initWithClientID:@"com.apple.photoanalysisd"];
  [v5 setExportedObject:v18];
  [(PersonalizedSensingService *)v18 setEntitlementsForNLData:self->hasEntitlementForNLData];
  [(PersonalizedSensingService *)v18 setEntitlementsForStructuredData:self->hasEntitlementForStructuredData];
  v19 = [(PersonalizedSensingServiceDelegate *)self getClientAlternateIdentifierForConnection:v5];
  [(PersonalizedSensingService *)v18 setClientAlternateIdentifier:v19];

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = __73__PersonalizedSensingServiceDelegate_listener_shouldAcceptNewConnection___block_invoke;
  v25[3] = &unk_1000A7360;
  v20 = v18;
  long long v26 = v20;
  [v5 setInterruptionHandler:v25];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __73__PersonalizedSensingServiceDelegate_listener_shouldAcceptNewConnection___block_invoke_2;
  v23[3] = &unk_1000A7360;
  long long v24 = v20;
  BOOL v21 = v20;
  [v5 setInvalidationHandler:v23];
  [v5 resume];

  BOOL v11 = 1;
LABEL_19:

  return v11;
}

id __73__PersonalizedSensingServiceDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) interruptionHandler];
}

id __73__PersonalizedSensingServiceDelegate_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidationHandler];
}

- (id)getClientBundleIdentifierForConnection:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3) {
    [v3 auditToken];
  }
  else {
    memset(&v13, 0, sizeof(v13));
  }
  id v5 = SecTaskCreateWithAuditToken(0, &v13);
  if (v5)
  {
    audit_token_t v6 = v5;
    id v7 = (__CFString *)SecTaskCopySigningIdentifier(v5, 0);
    objc_opt_class();
    unint64_t v8 = 0;
    if (objc_opt_isKindOfClass())
    {
      id v9 = v7;
      unint64_t v8 = v9;
      if (v9)
      {
        if (![(__CFString *)v9 length])
        {

          unint64_t v8 = 0;
        }
      }
    }
    CFRelease(v6);
    id v10 = v8;

    BOOL v11 = v10;
  }
  else
  {
    id v10 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[PersonalizedSensingServiceDelegate getClientBundleIdentifierForConnection:](v10);
    }
    BOOL v11 = 0;
  }

  return v11;
}

- (id)getClientAlternateIdentifierForConnection:(id)a3
{
  id v4 = a3;
  id v5 = [v4 valueForEntitlement:@"application-identifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
  }
  else
  {
    id v6 = [(PersonalizedSensingServiceDelegate *)self executablePathOfConnection:v4];
  }
  id v7 = v6;

  return v7;
}

- (void)listener:(os_log_t)log shouldAcceptNewConnection:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "PSService, client does not have correct entitlement", v1, 2u);
}

- (void)listener:(uint64_t)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "PersonalizedSensingService, client not allowed to establish connection,%@", (uint8_t *)&v2, 0xCu);
}

- (void)getClientBundleIdentifierForConnection:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Can't create client secTask from audit Token", v1, 2u);
}

@end