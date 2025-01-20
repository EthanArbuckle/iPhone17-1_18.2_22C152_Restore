@interface TCCDServer
+ (id)newErrorWithCode:(int64_t)a3 format:(id)a4;
+ (id)newErrorWithCode:(int64_t)a3 format:(id)a4 arguments:(char *)a5;
- (BOOL)allowsInternalSecurityPolicies;
- (BOOL)canProcess:(id)a3 callFunction:(id)a4 forService:(id)a5 withAccessIdentity:(id)a6;
- (BOOL)canProcess:(id)a3 manageESClientServiceWith:(id)a4;
- (BOOL)evaluateAccessToService:(id)a3 defaultAccessAllowed:(BOOL)a4 by:(id)a5 checkCodeRequirements:(BOOL)a6 authorizationResult:(unint64_t *)a7 authorizationReason:(unint64_t *)a8 flags:(int *)a9 subjectCodeIdentityDataResult:(id *)a10;
- (BOOL)evaluateComposedAuthorizationToService:(id)a3 andAccessSubject:(id)a4 withRelation:(int64_t)a5 authorizationResult:(unint64_t *)a6 authorizationReason:(unint64_t *)a7 subjectCodeIdentityDataResult:(id *)a8;
- (BOOL)generateBacktraceOnPrompt;
- (BOOL)internalPreferenceBoolValueForName:(id)a3;
- (BOOL)internalPreferenceBoolValueForName:(id)a3 present:(BOOL *)a4;
- (BOOL)isAccessEntryWithAge:(int)a3 authorizationValue:(unint64_t)a4 expiredForService:(id)a5;
- (BOOL)isProcessServiceCompositionManager:(id)a3;
- (BOOL)macos_isSystemServer;
- (BOOL)sendRecordMetricsForService:(const char *)a3;
- (BOOL)targetAuditToken:(id *)a3 fromMessage:(id)a4 error:(id *)a5;
- (BOOL)testDoComposition;
- (BOOL)updateAccessRecord:(id)a3 replaceOnly:(BOOL)a4 doCompositionWithChildService:(BOOL)a5 withRequestingProcess:(id)a6 function:(id)a7 accessIdentity:(id)a8;
- (BOOL)updateAuthorizationRecordFromContext:(id)a3 forResult:(id)a4 syncedUpdate:(BOOL *)a5;
- (NSString)cacheDirectory;
- (NSString)stateDirectory;
- (NSString)temporaryDirectory;
- (NSString)userHomeDirectory;
- (OS_dispatch_source)macos_compatibilityFileVnodeSource;
- (OS_os_log)logHandle;
- (TCCDAssumedIdentityMonitor)assumedIdentityMonitor;
- (TCCDEventPublisher)eventPublisher;
- (TCCDPlatform)platform;
- (TCCDReminderMonitor)reminderMonitor;
- (TCCDServer)init;
- (id)_descriptionForXPCDictionary:(id)a3 depth:(int)a4;
- (id)_descriptionForXPCObject:(id)a3 depth:(int)a4;
- (id)_evaluateForProcess:(id)a3 entitlementName:(id)a4 containsService:(id)a5 options:(unint64_t)a6;
- (id)_indentForDepth:(int)a3;
- (id)accessRecordFromStep:(sqlite3_stmt *)a3;
- (id)descriptionDictionariesForAllAccessRecords;
- (id)descriptionForMessage:(id)a3;
- (id)evaluateUserIndependentEntitlementsForAccessByAttributionChain:(id)a3 forFunction:(id)a4 toService:(id)a5 error:(id *)a6;
- (id)fetchAllAccessRecords;
- (id)fetchAllActivePolicies;
- (id)fetchAllOverriddenServiceNames;
- (id)fetchAllPolicies;
- (id)recordFromMessage:(id)a3 accessIdentity:(id *)a4 indirectObjectIdentity:(id *)a5 error:(id *)a6;
- (id)serviceFromMessage:(id)a3 error:(id *)a4;
- (id)setupTemporaryDirectoryForName:(int)a3;
- (id)stateDumpDictionary;
- (id)stringFromErrorCode:(int64_t)a3;
- (id)translateAllFilesToEndpointSecurity:(id)a3 withClient:(id)a4 clientType:(int)a5 requestingProcess:(id)a6 function:(id)a7 attributionChain:(id)a8 executablePath:(id)a9;
- (unint64_t)numberOfRecordsForService:(id)a3;
- (unint64_t)numberOfRecordsForService:(id)a3 withAuthorizationValue:(unint64_t)a4;
- (void)buildErrorString:(id)a3 forError:(id)a4 contextString:(id)a5;
- (void)createStateHandler;
- (void)makeError:(id *)a3 withCode:(int64_t)a4 infoText:(id)a5;
- (void)publishAccessChangedEvent:(unint64_t)a3 forService:(id)a4 client:(id)a5 clientType:(int)a6 authValue:(unint64_t)a7 andKillClient:(BOOL)a8;
- (void)purgeAllExpiredAccessEntries;
- (void)purgeExpiredAccessEntriesForService:(id)a3;
- (void)scheduleAccessEntryExpiryCheckForService:(id)a3;
- (void)sendAnalyticsForEntitlement:(id)a3 withProcess:(id)a4 service:(id)a5 function:(id)a6;
- (void)sendAnalyticsIfMigrationPluginForProcess:(id)a3 withService:(id)a4 API:(id)a5;
- (void)setAllowsInternalSecurityPolicies:(BOOL)a3;
- (void)setAssumedIdentityMonitor:(id)a3;
- (void)setEventPublisher:(id)a3;
- (void)setGenerateBacktraceOnPrompt:(BOOL)a3;
- (void)setLogHandle:(id)a3;
- (void)setMacos_compatibilityFileVnodeSource:(id)a3;
- (void)setMacos_isSystemServer:(BOOL)a3;
- (void)setPlatform:(id)a3;
- (void)setTestDoComposition:(BOOL)a3;
- (void)setupTemporaryDirectories;
- (void)updateClient:(id)a3 client:(const char *)a4 clientType:(int)a5;
@end

@implementation TCCDServer

- (BOOL)canProcess:(id)a3 callFunction:(id)a4 forService:(id)a5 withAccessIdentity:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10)
  {
    BOOL v15 = 0;
    goto LABEL_22;
  }
  if (![v10 BOOLValueForEntitlement:@"com.apple.private.tcc.manager"])
  {
    BOOL v15 = 0;
    if (!v11 || !v12) {
      goto LABEL_22;
    }
    id v16 = v11;
    if (([v16 isEqualToString:@"TCCAccessSetOverride"] & 1) != 0
      || ([v16 isEqualToString:@"TCCAccessOverride"] & 1) != 0)
    {
      CFStringRef v17 = @"modify";
      CFStringRef v18 = @"service-override";
      goto LABEL_12;
    }
    if ([v16 hasPrefix:@"TCCExpirationCopy"])
    {
      CFStringRef v17 = @"read";
    }
    else
    {
      if (([v16 hasPrefix:@"TCCExpirationReset"] & 1) == 0)
      {
        if ([v16 hasPrefix:@"TCCAccessCopy"])
        {
          CFStringRef v17 = @"read";
        }
        else if (([v16 hasPrefix:@"TCCAccessSet"] & 1) != 0 {
               || ([v16 hasPrefix:@"TCCAccessSetWithPrompt"] & 1) != 0)
        }
        {
          CFStringRef v17 = @"modify";
        }
        else if ([v16 hasPrefix:@"TCCAccessReset"])
        {
          CFStringRef v17 = @"delete";
        }
        else
        {
          if (![v16 hasPrefix:@"TCCReportUse"])
          {
            if (([v16 isEqualToString:@"TCCAccessRequest"] & 1) == 0)
            {

              v19 = 0;
              goto LABEL_20;
            }
            goto LABEL_13;
          }
          CFStringRef v17 = @"report";
        }
        CFStringRef v18 = @"access";
LABEL_12:
        if (([v16 isEqualToString:@"TCCAccessRequest"] & 1) == 0)
        {
          +[NSString stringWithFormat:@"%@.%@.%@", @"com.apple.private.tcc.manager", v18, v17];
LABEL_15:
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            BOOL v15 = 1;
            if ([v10 hasEntitlement:v19 containsServiceAllOrService:v12 options:1])
            {
LABEL_21:

              goto LABEL_22;
            }
            v20 = [(TCCDServer *)self logHandle];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138544130;
              id v24 = v10;
              __int16 v25 = 2114;
              id v26 = v16;
              __int16 v27 = 2114;
              id v28 = v12;
              __int16 v29 = 2114;
              CFStringRef v30 = v19;
              _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}@ attempted to call %{public}@ for %{public}@ without the recommended %{public}@ entitlement", buf, 0x2Au);
            }
          }
LABEL_20:
          BOOL v15 = 0;
          goto LABEL_21;
        }
LABEL_13:
        +[NSString stringWithFormat:@"%@.%@", @"com.apple.private.tcc.manager", @"check-by-audit-token", v22];
        goto LABEL_15;
      }
      CFStringRef v17 = @"delete";
    }
    CFStringRef v18 = @"expiration";
    goto LABEL_12;
  }
  v14 = [(TCCDServer *)self logHandle];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138544130;
    id v24 = v10;
    __int16 v25 = 2114;
    id v26 = v11;
    __int16 v27 = 2114;
    id v28 = v12;
    __int16 v29 = 2114;
    CFStringRef v30 = @"com.apple.private.tcc.manager";
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%{public}@ was allowed to call %{public}@ for %{public}@ with the deprecated %{public}@ entitlement", buf, 0x2Au);
  }

  [(TCCDServer *)self sendAnalyticsForEntitlement:@"com.apple.private.tcc.manager" withProcess:v10 service:v12 function:v11];
  [(TCCDServer *)self sendAnalyticsIfMigrationPluginForProcess:v10 withService:v12 API:v11];
  BOOL v15 = 1;
LABEL_22:

  return v15;
}

- (OS_os_log)logHandle
{
  return self->_logHandle;
}

- (BOOL)isAccessEntryWithAge:(int)a3 authorizationValue:(unint64_t)a4 expiredForService:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [v8 expirySeconds];
  if (!v9) {
    goto LABEL_7;
  }
  id v10 = (void *)v9;
  id v11 = [v8 expirySeconds];
  if ((int)[v11 intValue] >= a3)
  {

    goto LABEL_7;
  }
  if ([v8 expireOnlyAllowedEntries])
  {
    unsigned __int8 v12 = [v8 isAuthorizationValue:a4 equalToRight:0];

    if ((v12 & 1) == 0) {
      goto LABEL_9;
    }
LABEL_7:
    BOOL v13 = 0;
    goto LABEL_12;
  }

LABEL_9:
  v14 = [(TCCDServer *)self logHandle];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    BOOL v15 = [v8 name];
    id v16 = [v8 expirySeconds];
    *(_DWORD *)buf = 136446978;
    uint64_t v22 = "-[TCCDServer isAccessEntryWithAge:authorizationValue:expiredForService:]";
    __int16 v23 = 2114;
    id v24 = v15;
    __int16 v25 = 1024;
    unsigned int v26 = [v16 intValue];
    __int16 v27 = 1024;
    int v28 = a3;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%{public}s for %{public}@ expiry time: %d, client age = %d", buf, 0x22u);
  }
  CFStringRef v17 = dispatch_get_global_queue(-32768, 0);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100039858;
  v19[3] = &unk_100094FE0;
  v19[4] = self;
  id v20 = v8;
  dispatch_async(v17, v19);

  BOOL v13 = 1;
LABEL_12:

  return v13;
}

- (id)serviceFromMessage:(id)a3 error:(id *)a4
{
  string = xpc_dictionary_get_string(a3, "service");
  if (string)
  {
    v7 = string;
    id v8 = +[NSString stringWithUTF8String:string];
    uint64_t v9 = [(TCCDServer *)self platform];
    id v10 = [v9 serviceByName:v8];

    if (!v10)
    {
      id v11 = +[NSString stringWithFormat:@"Invalid Service Name: %s", v7];
      [(TCCDServer *)self makeError:a4 withCode:2 infoText:v11];
    }
  }
  else
  {
    [(TCCDServer *)self makeError:a4 withCode:1 infoText:0];
    id v10 = 0;
  }
  return v10;
}

- (id)_indentForDepth:(int)a3
{
  v4 = objc_opt_new();
  if (a3 >= 1)
  {
    do
    {
      [v4 appendString:@"\t"];
      --a3;
    }
    while (a3);
  }
  id v5 = [v4 copy];

  return v5;
}

- (id)_descriptionForXPCObject:(id)a3 depth:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = objc_opt_new();
  if (xpc_get_type(v6) == (xpc_type_t)&_xpc_type_string)
  {
    objc_msgSend(v7, "appendFormat:", @"\"%s\"", xpc_string_get_string_ptr(v6), v18);
    goto LABEL_19;
  }
  if (xpc_get_type(v6) != (xpc_type_t)&_xpc_type_BOOL)
  {
    if (xpc_get_type(v6) == (xpc_type_t)&_xpc_type_uint64)
    {
      uint64_t value = xpc_uint64_get_value(v6);
      objc_msgSend(v7, "appendFormat:", @"%llu (0x%llx)", value, xpc_uint64_get_value(v6));
      goto LABEL_19;
    }
    if (xpc_get_type(v6) == (xpc_type_t)&_xpc_type_int64)
    {
      int64_t v12 = xpc_int64_get_value(v6);
      objc_msgSend(v7, "appendFormat:", @"%lld (0x%llx)", v12, xpc_int64_get_value(v6));
      goto LABEL_19;
    }
    if (xpc_get_type(v6) == (xpc_type_t)&_xpc_type_dictionary)
    {
      id v13 = [(TCCDServer *)self _descriptionForXPCDictionary:v6 depth:v4];
      [v7 appendFormat:@"%@", v13];
    }
    else
    {
      if (xpc_get_type(v6) != (xpc_type_t)&_xpc_type_array)
      {
        if (xpc_get_type(v6) == (xpc_type_t)&_xpc_type_null)
        {
          objc_msgSend(v7, "appendFormat:", @"<xpc_null>", v17, v18);
        }
        else
        {
          id v8 = xpc_copy_description(v6);
          objc_msgSend(v7, "appendFormat:", @"%s", v8);
          free(v8);
        }
        goto LABEL_19;
      }
      v14 = [(TCCDServer *)self _indentForDepth:v4];
      [v7 appendFormat:@"\n"];
      applier[0] = _NSConcreteStackBlock;
      applier[1] = 3221225472;
      applier[2] = sub_100003098;
      applier[3] = &unk_100095F78;
      applier[4] = self;
      int v22 = v4;
      id v20 = v7;
      id v21 = v14;
      id v13 = v14;
      xpc_array_apply(v6, applier);
    }
    goto LABEL_19;
  }
  BOOL v9 = xpc_BOOL_get_value(v6);
  id v10 = "false";
  if (v9) {
    id v10 = "true";
  }
  objc_msgSend(v7, "appendFormat:", @"%s", v10, v18);
LABEL_19:
  id v15 = [v7 copy];

  return v15;
}

- (id)_descriptionForXPCDictionary:(id)a3 depth:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 appendString:@"{\n"];
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 3221225472;
  applier[2] = sub_10000BC8C;
  applier[3] = &unk_100095F50;
  id v13 = v7;
  v14 = self;
  int v15 = v4;
  id v8 = v7;
  xpc_dictionary_apply(v6, applier);

  BOOL v9 = [(TCCDServer *)self _indentForDepth:v4];
  [v8 appendString:v9];

  [v8 appendString:@"}"];
  id v10 = [v8 copy];

  return v10;
}

- (id)descriptionForMessage:(id)a3
{
  return [(TCCDServer *)self _descriptionForXPCDictionary:a3 depth:0];
}

- (TCCDPlatform)platform
{
  return self->_platform;
}

- (id)translateAllFilesToEndpointSecurity:(id)a3 withClient:(id)a4 clientType:(int)a5 requestingProcess:(id)a6 function:(id)a7 attributionChain:(id)a8 executablePath:(id)a9
{
  id v9 = a3;
  return v9;
}

- (BOOL)canProcess:(id)a3 manageESClientServiceWith:(id)a4
{
  return 0;
}

+ (id)newErrorWithCode:(int64_t)a3 format:(id)a4
{
  return [a1 newErrorWithCode:a3 format:a4 arguments:&v5];
}

+ (id)newErrorWithCode:(int64_t)a3 format:(id)a4 arguments:(char *)a5
{
  if (a4)
  {
    id v7 = a4;
    id v8 = [objc_alloc((Class)NSString) initWithFormat:v7 locale:0 arguments:a5];

    NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
    id v13 = v8;
    id v9 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  }
  else
  {
    id v9 = 0;
  }
  id v10 = +[NSError errorWithDomain:@"kTCCErrorDomain" code:a3 userInfo:v9];

  return v10;
}

- (void)updateClient:(id)a3 client:(const char *)a4 clientType:(int)a5
{
  int v64 = 0;
  id v46 = a3;
  unsigned __int8 v7 = [v46 isRevocable];
  if (!a5 && (v7 & 1) == 0)
  {
    v45 = +[NSString stringWithUTF8String:a4];
    if (v45)
    {
      v44 = a4;
      if (&_SBSProcessIDForDisplayIdentifier && SBSProcessIDForDisplayIdentifier())
      {
        id v8 = [v46 name];
        id v9 = +[NSString stringWithFormat:@"Access to service %@ changed.", v8];

        id v10 = v9;
        [v10 UTF8String];
        LODWORD(v9) = terminate_with_reason();
        id v11 = [(TCCDServer *)self logHandle];
        NSErrorUserInfoKey v12 = v11;
        if (v9)
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            int v13 = *__error();
            v14 = __error();
            int v15 = strerror(*v14);
            id v16 = [v46 name];
            *(_DWORD *)buf = 136447234;
            v68 = v44;
            __int16 v69 = 1024;
            *(_DWORD *)v70 = v64;
            *(_WORD *)&v70[4] = 1024;
            *(_DWORD *)&v70[6] = v13;
            *(_WORD *)&v70[10] = 2082;
            *(void *)&v70[12] = v15;
            LOWORD(v71[0]) = 2114;
            *(void *)((char *)v71 + 2) = v16;
            _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Unable to terminate_with_reason() %{public}s[%d]: %d (%{public}s) for service %{public}@", buf, 0x2Cu);
          }
        }
        else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v17 = [v46 name];
          *(_DWORD *)buf = 136446722;
          v68 = a4;
          __int16 v69 = 1024;
          *(_DWORD *)v70 = v64;
          *(_WORD *)&v70[4] = 2114;
          *(void *)&v70[6] = v17;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Terminating %{public}s[%d] because access to the %{public}@ service changed.", buf, 0x1Cu);
        }
      }
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      uint64_t v18 = +[LSApplicationProxy applicationProxyForIdentifier:v45];
      v19 = [v18 plugInKitPlugins];

      id v20 = [v19 countByEnumeratingWithState:&v60 objects:v66 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v61;
        do
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(void *)v61 != v22) {
              objc_enumerationMutation(v19);
            }
            id v24 = *(void **)(*((void *)&v60 + 1) + 8 * i);
            id v25 = [v24 bundleIdentifier];
            [v25 UTF8String];

            id v26 = [v24 bundleVersion];
            [v26 UTF8String];

            __int16 v27 = dispatch_get_global_queue(0, 0);
            v52 = _NSConcreteStackBlock;
            uint64_t v53 = 3221225472;
            v54 = sub_100037984;
            v55 = &unk_100095F28;
            v56 = self;
            v57 = v24;
            id v58 = v45;
            id v59 = v46;
            launch_remove_external_service();
          }
          id v21 = [v19 countByEnumeratingWithState:&v60 objects:v66 count:16];
        }
        while (v21);
      }

      int v28 = [v46 name];
      __int16 v29 = +[NSString stringWithFormat:@"%@ authorization changed for assumed identity %@", v28, v45];

      CFStringRef v30 = [(TCCDServer *)self assumedIdentityMonitor];
      v31 = [v30 monitoredProcessesAssumingIdentityWithIdentifier:v45];

      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v32 = v31;
      id v33 = [v32 countByEnumeratingWithState:&v48 objects:v65 count:16];
      if (v33)
      {
        id v34 = v33;
        uint64_t v35 = *(void *)v49;
        do
        {
          for (j = 0; j != v34; j = (char *)j + 1)
          {
            if (*(void *)v49 != v35) {
              objc_enumerationMutation(v32);
            }
            v37 = *(void **)(*((void *)&v48 + 1) + 8 * (void)j);
            [v37 pid];
            [v29 UTF8String];
            int v38 = terminate_with_reason();
            v39 = tcc_assumed_identity_monitor_log();
            v40 = v39;
            if (v38)
            {
              if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
              {
                v41 = [v46 name];
                int v42 = *__error();
                *(_DWORD *)buf = 138544130;
                v68 = (const char *)v37;
                __int16 v69 = 2082;
                *(void *)v70 = v44;
                *(_WORD *)&v70[8] = 2114;
                *(void *)&v70[10] = v41;
                *(_WORD *)&v70[18] = 1024;
                v71[0] = v42;
                _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Unable to terminate_with_reason() %{public}@ assuming identity %{public}s for %{public}@: %{darwin.errno}d", buf, 0x26u);
              }
            }
            else
            {
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
              {
                v43 = [v46 name];
                *(_DWORD *)buf = 138543874;
                v68 = (const char *)v37;
                __int16 v69 = 2082;
                *(void *)v70 = v44;
                *(_WORD *)&v70[8] = 2114;
                *(void *)&v70[10] = v43;
                _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Terminated %{public}@ assuming identity %{public}s because the assumed identity's %{public}@ authorization changed.", buf, 0x20u);
              }
              v40 = [(TCCDServer *)self assumedIdentityMonitor];
              [v40 stopMonitoringProcess:v37];
            }
          }
          id v34 = [v32 countByEnumeratingWithState:&v48 objects:v65 count:16];
        }
        while (v34);
      }
    }
  }
}

- (void)publishAccessChangedEvent:(unint64_t)a3 forService:(id)a4 client:(id)a5 clientType:(int)a6 authValue:(unint64_t)a7 andKillClient:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v10 = *(void *)&a6;
  id v14 = a4;
  id v15 = a5;
  id v16 = [(TCCDServer *)self logHandle];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)name = 136316674;
    id v26 = "-[TCCDServer publishAccessChangedEvent:forService:client:clientType:authValue:andKillClient:]";
    __int16 v27 = 2048;
    unint64_t v28 = a3;
    __int16 v29 = 2112;
    id v30 = v14;
    __int16 v31 = 2112;
    id v32 = v15;
    __int16 v33 = 1024;
    int v34 = v10;
    __int16 v35 = 2048;
    unint64_t v36 = a7;
    __int16 v37 = 1024;
    BOOL v38 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s: event_type=%lld, service=%@, client=%@, client_type=%d, auth_value=%lld, kill_client=%d", (uint8_t *)name, 0x40u);
  }

  if (v14)
  {
    if (v8) {
      -[TCCDServer updateClient:client:clientType:](self, "updateClient:client:clientType:", v14, [v15 UTF8String], v10);
    }
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      uint64_t v17 = [v14 name];
      uint64_t v18 = tcc_service_singleton_for_CF_name();
      tcc_authorization_changed_for_service_notification_name();

      LODWORD(v18) = notify_post(name);
      v19 = [(TCCDServer *)self logHandle];
      id v20 = v19;
      if (v18)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_10003E300();
        }
      }
      else if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 136315138;
        id v24 = name;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Posted notification: %s", (uint8_t *)&v23, 0xCu);
      }
    }
    id v21 = [[TCCDEvent alloc] initWithEventType:a3 service:v14 subjectIdentifierType:(int)v10 subjectIdentifier:v15 authValue:a7];
    uint64_t v22 = [(TCCDServer *)self eventPublisher];
    [v22 publish:v21];
  }
  else
  {
    id v21 = [(TCCDServer *)self logHandle];
    if (os_log_type_enabled(&v21->super, OS_LOG_TYPE_ERROR)) {
      sub_10003E284(v15);
    }
  }
}

- (id)setupTemporaryDirectoryForName:(int)a3
{
  bzero(v8, 0x400uLL);
  if (!confstr(a3, v8, 0x400uLL)) {
    sub_10003E374();
  }
  if (mkdir(v8, 0x1C0u) && *__error() != 17) {
    sub_10003E3AC();
  }
  uint64_t v4 = realpath_DARWIN_EXTSN(v8, 0);
  if (!v4) {
    sub_10003E390();
  }
  uint64_t v5 = v4;
  id v6 = [objc_alloc((Class)NSString) initWithUTF8String:v4];
  free(v5);
  return v6;
}

- (void)setupTemporaryDirectories
{
  if ((_set_user_dir_suffix() & 1) == 0) {
    sub_10003E3C8();
  }
  self->_temporaryDirectory = [(TCCDServer *)self setupTemporaryDirectoryForName:65537];
  _objc_release_x1();
}

- (TCCDServer)init
{
  v14.receiver = self;
  v14.super_class = (Class)TCCDServer;
  v2 = [(TCCDServer *)&v14 init];
  v3 = v2;
  if (v2)
  {
    [(TCCDServer *)v2 setupTemporaryDirectories];
    [(TCCDServer *)v3 createStateHandler];
    uint64_t v4 = objc_alloc_init(TCCDReminderMonitor);
    reminderMonitor = v3->_reminderMonitor;
    v3->_reminderMonitor = v4;

    id v6 = dispatch_get_global_queue(-32768, 0);
    dispatch_source_t v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v6);
    authAnalyticsTimer = v3->_authAnalyticsTimer;
    v3->_authAnalyticsTimer = (OS_dispatch_source *)v7;

    dispatch_time_t v9 = dispatch_time(0, 86400000000000);
    dispatch_source_set_timer((dispatch_source_t)v3->_authAnalyticsTimer, v9, 0x4E94914F0000uLL, 0x34630B8A000uLL);
    uint64_t v10 = v3->_authAnalyticsTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100037FDC;
    handler[3] = &unk_100094E78;
    int v13 = v3;
    dispatch_source_set_event_handler(v10, handler);
    dispatch_activate((dispatch_object_t)v3->_authAnalyticsTimer);
  }
  return v3;
}

- (NSString)userHomeDirectory
{
  p_super = &self->super;
  if (self->_userHomeDirectory)
  {
LABEL_8:
    Class isa = p_super[1].isa;
    return (NSString *)isa;
  }
  if ([(TCCDServer *)self macos_isSystemServer])
  {
    Class v3 = p_super[1].isa;
    p_super[1].Class isa = (Class)@"/";

    goto LABEL_8;
  }
  uid_t v4 = getuid();
  uint64_t v5 = getpwuid(v4);
  if (!v5)
  {
    p_super = [p_super logHandle];
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
      sub_10003E3E4(p_super);
    }

    _os_crash();
    __break(1u);
    goto LABEL_14;
  }
  pw_dir = v5->pw_dir;
  if (!pw_dir)
  {
LABEL_14:
    p_super = [p_super logHandle];
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
      sub_10003E464(p_super);
    }

    _os_crash();
    __break(1u);
    goto LABEL_17;
  }
  dispatch_source_t v7 = +[NSString stringWithUTF8String:pw_dir];
  id v14 = 0;
  uint64_t v8 = [v7 stringByResolvingRealPathWithError:&v14];
  id v9 = v14;

  if (v8)
  {
    Class v10 = p_super[1].isa;
    p_super[1].Class isa = (Class)v8;

    goto LABEL_8;
  }
LABEL_17:
  int v13 = [p_super logHandle];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_10003E4E4();
  }

  result = (NSString *)_os_crash();
  __break(1u);
  return result;
}

- (NSString)stateDirectory
{
  stateDirectory = self->_stateDirectory;
  if (!stateDirectory)
  {
    uid_t v4 = [(TCCDServer *)self userHomeDirectory];
    uint64_t v5 = [(TCCDServer *)self platform];
    id v6 = [v5 homeRelativePathToStateDirectory];
    dispatch_source_t v7 = [v4 stringByAppendingPathComponent:v6];
    uint64_t v8 = self->_stateDirectory;
    self->_stateDirectory = v7;

    stateDirectory = self->_stateDirectory;
  }
  return stateDirectory;
}

- (BOOL)internalPreferenceBoolValueForName:(id)a3
{
  uid_t v4 = (__CFString *)a3;
  if ([(TCCDServer *)self allowsInternalSecurityPolicies]
    && (CFBooleanRef v5 = (const __CFBoolean *)CFPreferencesCopyValue(v4, @"com.apple.tccd", kCFPreferencesCurrentUser, kCFPreferencesAnyHost)) != 0)
  {
    CFBooleanRef v6 = v5;
    CFTypeID TypeID = CFBooleanGetTypeID();
    if (TypeID == CFGetTypeID(v6))
    {
      BOOL v8 = CFBooleanGetValue(v6) != 0;
      id v9 = [(TCCDServer *)self logHandle];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_10003E554();
      }
    }
    else
    {
      BOOL v8 = 0;
    }
    CFRelease(v6);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)internalPreferenceBoolValueForName:(id)a3 present:(BOOL *)a4
{
  CFBooleanRef v6 = (__CFString *)a3;
  *a4 = 0;
  BOOL v7 = 0;
  if ([(TCCDServer *)self allowsInternalSecurityPolicies])
  {
    CFBooleanRef v8 = (const __CFBoolean *)CFPreferencesCopyValue(v6, @"com.apple.tccd", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
    if (v8)
    {
      CFBooleanRef v9 = v8;
      *a4 = 1;
      CFTypeID TypeID = CFBooleanGetTypeID();
      if (TypeID == CFGetTypeID(v9))
      {
        BOOL v7 = CFBooleanGetValue(v9) != 0;
        id v11 = [(TCCDServer *)self logHandle];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          sub_10003E554();
        }
      }
      else
      {
        BOOL v7 = 0;
      }
      CFRelease(v9);
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (id)stringFromErrorCode:(int64_t)a3
{
  if ((unint64_t)a3 > 9) {
    return @"Unknown Error Code";
  }
  else {
    return (id)*((void *)&off_100096080 + a3);
  }
}

- (void)setPlatform:(id)a3
{
  objc_storeStrong((id *)&self->_platform, a3);
  id v5 = a3;
  [(TCCDPlatform *)self->_platform setServer:self];
}

- (void)makeError:(id *)a3 withCode:(int64_t)a4 infoText:(id)a5
{
  id v7 = a5;
  CFBooleanRef v8 = v7;
  if (a3)
  {
    if (v7)
    {
      NSErrorUserInfoKey v10 = NSLocalizedDescriptionKey;
      id v11 = v7;
      CFBooleanRef v9 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    }
    else
    {
      CFBooleanRef v9 = 0;
    }
    *a3 = +[NSError errorWithDomain:@"com.apple.tccd" code:a4 userInfo:v9];
  }
}

- (void)buildErrorString:(id)a3 forError:(id)a4 contextString:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  NSErrorUserInfoKey v10 = v9;
  if (v9) {
    [v13 appendFormat:@"%@, ", v9];
  }
  if (v8)
  {
    id v11 = [v8 localizedDescription];
    [v13 appendFormat:@"%@", v11];

    NSErrorUserInfoKey v12 = -[TCCDServer stringFromErrorCode:](self, "stringFromErrorCode:", [v8 code]);
    [v13 appendFormat:@"(%@) ", v12];
  }
}

- (BOOL)targetAuditToken:(id *)a3 fromMessage:(id)a4 error:(id *)a5
{
  size_t length = 0;
  data = xpc_dictionary_get_data(a4, "target_token", &length);
  if (data)
  {
    if (length == 32)
    {
      long long v9 = data[1];
      *(_OWORD *)a3->var0 = *data;
      *(_OWORD *)&a3->var0[4] = v9;
      return 1;
    }
    CFStringRef v11 = @"invalid size for target audit token";
    NSErrorUserInfoKey v12 = self;
    id v13 = a5;
    uint64_t v14 = 4;
  }
  else
  {
    CFStringRef v11 = @"missing target audit token";
    NSErrorUserInfoKey v12 = self;
    id v13 = a5;
    uint64_t v14 = 3;
  }
  [(TCCDServer *)v12 makeError:v13 withCode:v14 infoText:v11];
  return 0;
}

- (void)sendAnalyticsIfMigrationPluginForProcess:(id)a3 withService:(id)a4 API:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([(TCCDServer *)self allowsInternalSecurityPolicies])
  {
    if ([v15 isPlatformBinary])
    {
      NSErrorUserInfoKey v10 = [v15 binaryPath];
      unsigned int v11 = [v10 hasSuffix:@"com.apple.migrationpluginwrapper"];

      if (v11)
      {
        NSErrorUserInfoKey v12 = (void *)DMCopyMigrationPhaseDescription();
        if ([v12 hasPrefix:@"Running plugin "])
        {
          id v13 = [v12 substringFromIndex:objc_msgSend(@"Running plugin ", "length")];
          uint64_t v14 = [(TCCDServer *)self platform];
          [v14 sendAnalyticsForPlugin:v13 service:v8 API:v9];
        }
      }
    }
  }
}

- (void)sendAnalyticsForEntitlement:(id)a3 withProcess:(id)a4 service:(id)a5 function:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v15 = [(TCCDServer *)self platform];
  uint64_t v14 = [v12 identifier];

  [v15 sendAnalyticsForEntitlement:v13 withIdentifier:v14 service:v11 function:v10];
}

- (BOOL)generateBacktraceOnPrompt
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000389DC;
  block[3] = &unk_100094E78;
  block[4] = self;
  if (qword_1000AC630 != -1) {
    dispatch_once(&qword_1000AC630, block);
  }
  return self->_generateBacktraceOnPrompt;
}

- (void)setGenerateBacktraceOnPrompt:(BOOL)a3
{
  self->_generateBacktraceOnPrompt = a3;
}

- (BOOL)isProcessServiceCompositionManager:(id)a3
{
  id v4 = a3;
  if (([v4 BOOLValueForEntitlement:@"com.apple.private.tcc.manager.service-composition"] & 1) != 0|| -[TCCDServer testDoComposition](self, "testDoComposition")&& objc_msgSend(v4, "BOOLValueForEntitlement:", @"com.apple.private.tcc.test-manager.service-composition"))
  {
    id v5 = [(TCCDServer *)self logHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10003E5BC(v4, v5);
    }

    BOOL v6 = 1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)recordFromMessage:(id)a3 accessIdentity:(id *)a4 indirectObjectIdentity:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = [(TCCDServer *)self serviceFromMessage:v10 error:a6];
  if (!v11)
  {
    id v20 = 0;
    goto LABEL_30;
  }
  id v12 = [[TCCDAccessIdentity alloc] initWithMessage:v10];
  id v13 = v12;
  if (v12)
  {
    if (a4) {
      *a4 = v12;
    }
    uint64_t v14 = [TCCDCodeIdentity alloc];
    id v15 = [(TCCDAccessIdentity *)v13 identifier];
    v39 = [(TCCDCodeIdentity *)v14 initWithIdentifier:v15 authority:[(TCCDAccessIdentity *)v13 client_type] displayNamePolicyIdentifier:0 verifierType:0 verifierData:0];

    int int64 = xpc_dictionary_get_int64(v10, "indirect_object_type");
    string = xpc_dictionary_get_string(v10, "indirect_object_identifier");
    if (string)
    {
      uint64_t v18 = (TCCDAccessObject *)[objc_alloc((Class)NSString) initWithUTF8String:string];
      if (int64 == 3)
      {
        v19 = [[TCCDAccessFileProviderDomainIndirectObject alloc] initWithFileProviderDomainID:v18];
      }
      else
      {
        size_t length = 0;
        data = xpc_dictionary_get_data(v10, "indirect_object_code_requirement", &length);
        id v23 = 0;
        if (data && length)
        {
          id v24 = data;
          id v25 = objc_alloc((Class)NSData);
          id v23 = [v25 initWithBytes:v24 length:length];
        }
        id v26 = [[TCCDCodeIdentity alloc] initWithIdentifier:v18 authority:int64 displayNamePolicyIdentifier:0 verifierType:v23 != 0 verifierData:v23];
        BOOL v38 = [[TCCDAccessCodeIndirectObject alloc] initWithCodeIdentity:v26];
        __int16 v27 = [[TCCDAccessIdentity alloc] initWithBundleIdentifier:v18 isWK2Proxy:0];
        if (!v27)
        {
          unint64_t v36 = +[NSString stringWithFormat:@"Invalid indirect object identity from message"];
          [(TCCDServer *)self makeError:a6 withCode:6 infoText:v36];

          id v20 = 0;
          v19 = (TCCDAccessFileProviderDomainIndirectObject *)v38;
          int v34 = v39;
LABEL_28:

          goto LABEL_29;
        }
        unint64_t v28 = v27;
        if (a5) {
          *a5 = v27;
        }

        v19 = (TCCDAccessFileProviderDomainIndirectObject *)v38;
      }
    }
    else
    {
      v19 = +[TCCDAccessIndirectObject unusedIndirectObject];
    }
    uint64_t v18 = [[TCCDAccessObject alloc] initWithService:v11 indirectObject:v19];
    if (xpc_dictionary_get_BOOL(v10, "granted")) {
      uint int64 = 2;
    }
    else {
      uint int64 = 0;
    }
    id v30 = xpc_dictionary_get_value(v10, "auth_value");

    if (v30)
    {
      uint int64 = xpc_dictionary_get_uint64(v10, "auth_value");
      uint64_t v31 = (uint64_t)[v11 authorizationVersionNumber];
    }
    else
    {
      uint64_t v31 = 1;
    }
    id v23 = +[NSDate dateWithTimeIntervalSinceNow:0.0];
    int64_t v32 = xpc_dictionary_get_int64(v10, "modDate");
    if (v32)
    {
      id v33 = [objc_alloc((Class)NSDate) initWithTimeIntervalSince1970:(double)v32];

      id v23 = v33;
    }
    int v34 = v39;
    LOBYTE(v37) = 0;
    id v20 = [[TCCDAccessRecord alloc] initWithSubject:v39 object:v18 authorizationValue:uint64 authorizationReason:4 authorizationVersion:v31 lastModified:v23 flags:0 replaceStoredCodeRequirement:v37];
    goto LABEL_28;
  }
  id v21 = +[NSString stringWithFormat:@"Invalid Access Identity from message"];
  [(TCCDServer *)self makeError:a6 withCode:6 infoText:v21];

  id v20 = 0;
LABEL_29:

LABEL_30:
  return v20;
}

- (void)purgeExpiredAccessEntriesForService:(id)a3
{
  id v4 = a3;
  id v5 = [v4 expirySeconds];

  if (v5)
  {
    BOOL v6 = [(TCCDServer *)self logHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = [v4 name];
      id v8 = [v4 expirySeconds];
      *(_DWORD *)buf = 136446722;
      id v13 = "-[TCCDServer purgeExpiredAccessEntriesForService:]";
      __int16 v14 = 2114;
      id v15 = v7;
      __int16 v16 = 1024;
      unsigned int v17 = [v8 intValue];
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}s: invoked for %{public}@; expiry: %d",
        buf,
        0x1Cu);
    }
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10003905C;
    v9[3] = &unk_100095FC0;
    id v10 = v4;
    id v11 = self;
    db_transaction(v9);
  }
}

- (void)purgeAllExpiredAccessEntries
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  Class v3 = +[TCCDService allServices];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(TCCDServer *)self purgeExpiredAccessEntriesForService:*(void *)(*((void *)&v8 + 1) + 8 * (void)v7)];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)scheduleAccessEntryExpiryCheckForService:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 expirySeconds];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = [v4 expirySeconds];
    if (((unint64_t)[v7 integerValue] & 0x8000000000000000) != 0)
    {

      goto LABEL_6;
    }
    long long v8 = [v4 expirySeconds];
    uint64_t v9 = (uint64_t)[v8 integerValue];

    if (v9 <= 604800)
    {
      uint64_t v6 = dispatch_get_global_queue(-32768, 0);
      long long v10 = [v4 expirySeconds];
      dispatch_time_t v11 = dispatch_time(0, 1000000000 * (void)[v10 integerValue] + 1000000000);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10003984C;
      v12[3] = &unk_100094FE0;
      v12[4] = self;
      id v13 = v4;
      dispatch_after(v11, v6, v12);

LABEL_6:
    }
  }
}

- (id)_evaluateForProcess:(id)a3 entitlementName:(id)a4 containsService:(id)a5 options:(unint64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [v11 authorizationRightStateForValue:1 reason:0];
  if (v12)
  {
    id v13 = [v9 arrayValueForEntitlement:v10];

    if (v13)
    {
      if (![v9 hasEntitlement:v10 containsService:v11 options:a6])
      {
LABEL_7:
        id v16 = v12;
        goto LABEL_8;
      }
      uint64_t v14 = 11;
      uint64_t v15 = 2;
    }
    else
    {
      uint64_t v15 = 0;
      uint64_t v14 = 1;
    }
    [v12 setRight:v15];
    [v12 setReason:v14];
    goto LABEL_7;
  }
LABEL_8:

  return v12;
}

- (id)evaluateUserIndependentEntitlementsForAccessByAttributionChain:(id)a3 forFunction:(id)a4 toService:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [v12 authorizationRightStateForValue:1 reason:0];
  if (!v13)
  {
    id v18 = 0;
    goto LABEL_45;
  }
  uint64_t v14 = (void *)v13;
  uint64_t v15 = [v10 requestingProcess];
  if (v15)
  {
    id v49 = v11;
    if ([v10 accessingProcessSpecified])
    {
      if ([(TCCDServer *)self canProcess:v15 callFunction:v11 forService:v12 withAccessIdentity:0])
      {
        char v16 = 0;
        CFStringRef v17 = @"IsTCCManager";
      }
      else if ([v12 shouldAllowUnrestrictedCheckAuditToken])
      {
        char v16 = 0;
        CFStringRef v17 = @"ServiceAllowsUnrestrictedCheck";
      }
      else if ([v15 euid])
      {
        if ([v15 hasEntitlement:@"com.apple.private.tcc.manager.check-by-audit-token" containsServiceAllOrService:v12 options:0])
        {
          char v16 = 0;
          CFStringRef v17 = @"IsEntitledToCheckByAuditToken";
        }
        else
        {
          id v21 = [(TCCDServer *)self logHandle];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            uint64_t v37 = [v10 accessingProcess];
            BOOL v38 = [v37 description];
            v39 = [v15 description];
            [v12 name];
            v40 = long long v48 = a6;
            *(_DWORD *)buf = 138543874;
            long long v51 = v38;
            __int16 v52 = 2114;
            uint64_t v53 = v39;
            __int16 v54 = 2114;
            v55 = v40;
            _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Request message contains a target_token to accessing_process (%{public}@) but %{public}@ is not a TCC manager for service: %{public}@.", buf, 0x20u);

            a6 = v48;
          }

          [v14 setRight:0];
          char v16 = 1;
          [v14 setReason:1];
          CFStringRef v17 = 0;
        }
      }
      else
      {
        v19 = [(TCCDServer *)self logHandle];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          id v20 = [v15 description];
          *(_DWORD *)buf = 138543362;
          long long v51 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "WARNING: allowing root %{public}@ to check entitlments without being a TCC manager.", buf, 0xCu);
        }
        char v16 = 0;
        CFStringRef v17 = @"IsRoot";
      }
      if ([v14 right] == (id)1 && (objc_msgSend(v10, "accessingProcessIsValid") & 1) == 0)
      {
        [v14 setRight:0];
        [v14 setReason:1];
      }
      if (v16)
      {
        uint64_t v22 = v14;
        goto LABEL_29;
      }
    }
    else
    {
      CFStringRef v17 = @"IsRequestor";
    }
    id v23 = [v10 accessingProcess];
    uint64_t v22 = [(TCCDServer *)self _evaluateForProcess:v23 entitlementName:@"com.apple.private.tcc.allow" containsService:v12 options:1];

    if ([v22 right] != (id)1)
    {
      id v24 = [(TCCDServer *)self logHandle];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        int v42 = [v22 description];
        v41 = [v12 name];
        v44 = [v10 accessingProcess];
        id v25 = [v44 description];
        [v15 description];
        id v26 = v46 = a6;
        *(_DWORD *)buf = 138544386;
        long long v51 = v42;
        __int16 v52 = 2114;
        uint64_t v53 = v41;
        __int16 v54 = 2114;
        v55 = v25;
        __int16 v56 = 2114;
        v57 = v26;
        __int16 v58 = 2114;
        CFStringRef v59 = v17;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Auth:%{public}@ to %{public}@ for %{public}@; checked by %{public}@ because: %{public}@",
          buf,
          0x34u);

        a6 = v46;
      }
    }
LABEL_29:
    id v11 = v49;
    if ([v22 right] == (id)1)
    {
      if ([v12 checkAllowEntitlementOnResponsibleProcess]) {
        goto LABEL_31;
      }
      uint64_t v33 = [v10 accessingProcess];
      if (v33)
      {
        unint64_t v28 = v33;
        int v34 = [v10 accessingProcess];
        if (([v34 hasEntitlement:@"com.apple.private.tcc.check-allow-on-responsible-process" containsServiceAllOrService:v12 options:1] & 1) == 0)
        {

LABEL_40:
          goto LABEL_41;
        }
        __int16 v35 = [v10 responsibleProcess];

        if (!v35) {
          goto LABEL_41;
        }
LABEL_31:
        __int16 v27 = [v10 responsibleProcess];
        uint64_t v14 = [(TCCDServer *)self _evaluateForProcess:v27 entitlementName:@"com.apple.private.tcc.allow" containsService:v12 options:1];

        if ([v14 right] == (id)1) {
          goto LABEL_42;
        }
        unint64_t v28 = [(TCCDServer *)self logHandle];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          __int16 v29 = [v14 description];
          id v30 = [v12 name];
          v45 = [v10 accessingProcess];
          v47 = a6;
          uint64_t v31 = [v45 description];
          v43 = [v10 responsibleProcess];
          int64_t v32 = [v43 description];
          *(_DWORD *)buf = 138544130;
          long long v51 = v29;
          __int16 v52 = 2114;
          uint64_t v53 = v30;
          __int16 v54 = 2114;
          v55 = v31;
          __int16 v56 = 2114;
          v57 = v32;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Auth:%{public}@ to %{public}@ because accessing process %{public}@ has the check-allow-on-responsible-process entitlement and responsible process %{public}@ has corresponding allow entitlement", buf, 0x2Au);

          a6 = v47;
        }
        uint64_t v22 = v14;
        goto LABEL_40;
      }
    }
LABEL_41:
    uint64_t v14 = v22;
LABEL_42:
    if (a6) {
      *a6 = 0;
    }
    goto LABEL_44;
  }
  [(TCCDServer *)self makeError:a6 withCode:5 infoText:0];
  [v14 setRight:0];
  [v14 setReason:1];
LABEL_44:
  id v18 = v14;

LABEL_45:
  return v18;
}

- (BOOL)evaluateAccessToService:(id)a3 defaultAccessAllowed:(BOOL)a4 by:(id)a5 checkCodeRequirements:(BOOL)a6 authorizationResult:(unint64_t *)a7 authorizationReason:(unint64_t *)a8 flags:(int *)a9 subjectCodeIdentityDataResult:(id *)a10
{
  id v14 = a3;
  id v15 = a5;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = sub_10000F8F4;
  v34[4] = sub_10000F88C;
  id v35 = 0;
  if (a10) {
    *a10 = 0;
  }
  *a7 = 1;
  *a8 = 0;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10003A2AC;
  v31[3] = &unk_100095228;
  id v32 = v14;
  id v33 = v15;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10003A398;
  v24[3] = &unk_100095FE8;
  __int16 v29 = a8;
  id v30 = a9;
  unint64_t v28 = a7;
  v24[4] = self;
  id v16 = v32;
  id v25 = v16;
  __int16 v27 = v34;
  id v17 = v33;
  id v26 = v17;
  int v18 = db_eval((uint64_t)"SELECT auth_value, auth_reason, csreq, strftime('%s','now') - last_modified AS age, flags FROM access WHERE service = ? AND client = ? AND client_type = ?", v31, v24);
  if (v18)
  {
    v19 = [(TCCDServer *)self logHandle];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = [v16 name];
      id v23 = [v17 identifier];
      *(_DWORD *)buf = 67109634;
      int v37 = v18;
      __int16 v38 = 2114;
      v39 = v22;
      __int16 v40 = 2114;
      v41 = v23;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Query for current DB state returns error: %d; Service: %{public}@), client: %{public}@",
        buf,
        0x1Cu);
    }
    BOOL v20 = 0;
    *a7 = 0;
    *a8 = 1;
  }
  else
  {
    BOOL v20 = *a8 != 1;
  }

  _Block_object_dispose(v34, 8);
  return v20;
}

- (BOOL)updateAccessRecord:(id)a3 replaceOnly:(BOOL)a4 doCompositionWithChildService:(BOOL)a5 withRequestingProcess:(id)a6 function:(id)a7 accessIdentity:(id)a8
{
  BOOL v11 = a5;
  BOOL v12 = a4;
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  int v18 = [v14 subjectIdentity];
  id v19 = [v18 identityType];

  if (!v19)
  {
    v82 = self;
    BOOL v20 = [v14 subjectIdentity];
    uint64_t v22 = [v14 accessObject];
    id v23 = [v22 serviceObject];
    v83 = objc_msgSend(v23, "macos_compositionChildService");

    id v80 = v15;
    id v81 = v16;
    if (v11 && v83)
    {
      id v24 = [TCCDAccessObject alloc];
      id v25 = [v14 accessObject];
      id v26 = [v25 indirectObject];
      __int16 v27 = [(TCCDAccessObject *)v24 initWithService:v83 indirectObject:v26];

      id v28 = [v14 copy];
      [v28 setAccessObject:v27];
      __int16 v29 = [(TCCDServer *)self logHandle];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        id v30 = [v83 name];
        uint64_t v31 = [v14 accessObject];
        [v31 serviceObject];
        v33 = id v32 = v17;
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v30;
        __int16 v94 = 2114;
        v95 = v33;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Update Access Record: checking child service %{public}@ of %{public}@", buf, 0x16u);

        id v17 = v32;
        id v16 = v81;

        id v15 = v80;
      }

      [(TCCDServer *)v82 updateAccessRecord:v28 replaceOnly:1 doCompositionWithChildService:1 withRequestingProcess:v15 function:v16 accessIdentity:v17];
    }
    v79 = v17;
    if (v12)
    {
      int v34 = [v14 accessObject];
      id v35 = [v34 serviceObject];

      uint64_t v92 = 0;
      *(void *)buf = 1;
      id v36 = [v35 isAccessAllowedByDefault];
      int v37 = [v20 accessIdentity];
      LODWORD(v36) = [(TCCDServer *)v82 evaluateAccessToService:v35 defaultAccessAllowed:v36 by:v37 checkCodeRequirements:1 authorizationResult:buf authorizationReason:&v92 flags:0 subjectCodeIdentityDataResult:0];

      uint64_t v38 = *(void *)buf;
      id v16 = v81;
      if (v36)
      {
        if (v38 == 1)
        {
          BOOL v21 = 0;
          id v17 = v79;
          id v15 = v80;
LABEL_64:

          goto LABEL_65;
        }
      }
    }
    v39 = [v14 accessObject];
    __int16 v40 = [v39 serviceObject];

    v41 = [v14 lastModifiedDate];
    [v41 timeIntervalSince1970];
    double v43 = v42;

    v44 = [v14 accessObject];
    v45 = [v44 indirectObject];

    if (v45 && [v45 type] && objc_msgSend(v45, "type") != (id)1 && objc_msgSend(v45, "type") != (id)2)
    {
      __int16 v56 = [(TCCDServer *)v82 logHandle];
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
        sub_10003E72C(v45, v14, v56);
      }
      BOOL v21 = 0;
      id v17 = v79;
      id v15 = v80;
      goto LABEL_63;
    }
    uint64_t v76 = (uint64_t)v43;
    if ([v45 type] == (id)1)
    {
      id v46 = [v14 accessObject];
      v47 = [v46 indirectObject];
      long long v48 = [v47 codeIdentity];

      id v49 = 0;
    }
    else
    {
      if ([v45 type] == (id)2)
      {
        id v49 = [v45 fileProviderDomainID];
      }
      else
      {
        id v49 = 0;
      }
      long long v48 = 0;
    }
    v78 = v40;
    long long v50 = [v40 name];
    long long v51 = [v20 identifier];
    id v52 = [v20 identifierAuthority];
    uint64_t v53 = [v79 attributionPath];
    __int16 v54 = [(TCCDServer *)v82 translateAllFilesToEndpointSecurity:v50 withClient:v51 clientType:v52 requestingProcess:v80 function:v81 attributionChain:0 executablePath:v53];

    v84[0] = _NSConcreteStackBlock;
    v84[1] = 3221225472;
    v84[2] = sub_10003AE3C;
    v84[3] = &unk_100096010;
    id v77 = v54;
    id v85 = v77;
    v75 = v20;
    v86 = v75;
    id v55 = v14;
    id v87 = v55;
    uint64_t v91 = (uint64_t)v43;
    id v74 = v45;
    id v88 = v74;
    __int16 v56 = v48;
    v89 = v56;
    id v57 = v49;
    id v90 = v57;
    int v58 = db_eval((uint64_t)"INSERT OR REPLACE INTO access   (service, client, client_type, auth_value, auth_reason, auth_version, csreq, indirect_object_identifier_type, indirect_object_identifier, indirect_object_code_identity, flags, last_modified) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", v84, 0);
    BOOL v21 = v58 == 0;
    if (v58
      || ([(TCCDServer *)v82 logHandle],
          id v73 = v57,
          CFStringRef v59 = objc_claimAutoreleasedReturnValue(),
          BOOL v60 = os_log_type_enabled(v59, OS_LOG_TYPE_INFO),
          v59,
          id v57 = v73,
          !v60))
    {
LABEL_62:

      id v15 = v80;
      id v16 = v81;
      __int16 v40 = v78;
      id v17 = v79;
LABEL_63:

      goto LABEL_64;
    }
    long long v61 = +[NSDate dateWithTimeIntervalSince1970:(double)v76];
    v72 = objc_opt_new();
    long long v62 = [v75 identifier];
    long long v63 = objc_msgSend(v78, "descriptionForAuthorizationValue:reason:", objc_msgSend(v55, "authorizationValue"), objc_msgSend(v55, "authorizationReason"));
    [v72 appendFormat:@"Update Access Record: %@ for %@ to %@ (v%llu) at %lld (%@)", v77, v62, v63, objc_msgSend(v55, "authorizationVersion"), v76, v61];

    if (![v55 flags])
    {
LABEL_54:
      v66 = v56;
      v67 = [v75 verifierDescription];
      [v72 appendFormat:@"\n\t CodeReq: %@", v67];

      if (v45)
      {
        if (v56)
        {
          v68 = [v56 identifier];
          __int16 v69 = [v66 verifierDescription];
          [v72 appendFormat:@"\n\t Indirect %@ : %@", v68, v69];
        }
        else
        {
          v68 = [v74 description];
          [v72 appendFormat:@"\n\t Indirect : %@", v68];
        }
      }
      v70 = [(TCCDServer *)v82 logHandle];
      id v57 = v73;
      if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v72;
        _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_INFO, "%{public}@", buf, 0xCu);
      }

      __int16 v56 = v66;
      goto LABEL_62;
    }
    [v72 appendFormat:@" {"];
    if ([v55 flags])
    {
      [v72 appendFormat:@"Timeout"];
      if (([v55 flags] & 2) == 0)
      {
        int v64 = 1;
        goto LABEL_38;
      }
      [v72 appendFormat:@" | "];
      int v64 = 2;
    }
    else
    {
      if (([v55 flags] & 2) == 0)
      {
        int v64 = 0;
        goto LABEL_38;
      }
      int v64 = 1;
    }
    [v72 appendFormat:@"SB Ext"];
LABEL_38:
    if (([v55 flags] & 4) != 0)
    {
      if (v64) {
        [v72 appendFormat:@" | "];
      }
      [v72 appendFormat:@"Allow Standard User to Set System Service"];
      ++v64;
    }
    if (([v55 flags] & 8) != 0)
    {
      if (v64) {
        [v72 appendFormat:@" | "];
      }
      [v72 appendFormat:@"Next Request Should Prompt"];
      int v64 = 1;
    }
    if (([v55 flags] & 0x10) != 0)
    {
      if (v64) {
        [v72 appendFormat:@" | "];
      }
      CFStringRef v65 = @"Has Prompted For Allow";
    }
    else
    {
      if (v64)
      {
LABEL_53:
        [v72 appendFormat:@"}"];
        goto LABEL_54;
      }
      CFStringRef v65 = @"Default";
    }
    [v72 appendFormat:v65];
    goto LABEL_53;
  }
  BOOL v20 = [(TCCDServer *)self logHandle];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    sub_10003E7D8(v14, v20);
  }
  BOOL v21 = 0;
LABEL_65:

  return v21;
}

- (BOOL)evaluateComposedAuthorizationToService:(id)a3 andAccessSubject:(id)a4 withRelation:(int64_t)a5 authorizationResult:(unint64_t *)a6 authorizationReason:(unint64_t *)a7 subjectCodeIdentityDataResult:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  if (a5)
  {
    id v16 = objc_msgSend(v14, "macos_compositionChildService");
    id v17 = "child";
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    id v16 = objc_msgSend(v14, "macos_compositionParentService");
    id v17 = "parent";
    if (v16)
    {
LABEL_3:
      id v36 = a7;
      id v37 = v15;
      unsigned int v18 = -[TCCDServer evaluateAccessToService:defaultAccessAllowed:by:checkCodeRequirements:authorizationResult:authorizationReason:flags:subjectCodeIdentityDataResult:](self, "evaluateAccessToService:defaultAccessAllowed:by:checkCodeRequirements:authorizationResult:authorizationReason:flags:subjectCodeIdentityDataResult:", v16, [v16 isAccessAllowedByDefault], v15, 1, a6, a7, 0, a8);
      id v19 = [(TCCDServer *)self logHandle];
      BOOL v20 = v19;
      if (v18)
      {
        if (*a6 == 1) {
          os_log_type_t v21 = OS_LOG_TYPE_DEBUG;
        }
        else {
          os_log_type_t v21 = OS_LOG_TYPE_INFO;
        }
        if (os_log_type_enabled(v19, v21))
        {
          id v35 = [v14 name];
          int v34 = [v16 name];
          [v16 descriptionForAuthorizationValue:*a6 reason:*v36];
          *(_DWORD *)buf = 138544130;
          __int16 v40 = v35;
          __int16 v41 = 2082;
          double v42 = v17;
          __int16 v43 = 2114;
          v44 = v34;
          uint64_t v46 = v45 = 2114;
          uint64_t v22 = (void *)v46;
          _os_log_impl((void *)&_mh_execute_header, v20, v21, "Evaluated composed authorization from %{public}@ to %{public}s service %{public}@: Auth:%{public}@", buf, 0x2Au);
        }
        BOOL v23 = 1;
        if (!a5)
        {
          id v15 = v37;
          if (*a6 == 1)
          {
            id v24 = objc_msgSend(v16, "macos_compositionParentService");

            if (v24) {
              BOOL v23 = [(TCCDServer *)self evaluateComposedAuthorizationToService:v16 andAccessSubject:v37 withRelation:0 authorizationResult:a6 authorizationReason:v36 subjectCodeIdentityDataResult:a8];
            }
          }
          goto LABEL_21;
        }
      }
      else
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          id v32 = [v14 name];
          id v33 = [v16 name];
          *(_DWORD *)buf = 138543874;
          __int16 v40 = v32;
          __int16 v41 = 2082;
          double v42 = v17;
          __int16 v43 = 2114;
          v44 = v33;
          _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to evaluate composed authorization from %{public}@ to %{public}s service %{public}@", buf, 0x20u);
        }
        BOOL v23 = 0;
      }
      id v15 = v37;
      goto LABEL_21;
    }
  }
  id v25 = a7;
  id v38 = 0;
  id v26 = [v14 name];
  __int16 v27 = +[NSString stringWithFormat:@"Service: %@ has an invalid %s composed service.", v26, v17];
  [(TCCDServer *)self makeError:&v38 withCode:2 infoText:v27];
  id v28 = v38;

  __int16 v29 = objc_opt_new();
  [(TCCDServer *)self buildErrorString:v29 forError:v28 contextString:0];
  id v30 = [(TCCDServer *)self logHandle];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
    sub_10003E894();
  }

  *a6 = 0;
  *id v25 = 1;

  BOOL v23 = 0;
LABEL_21:

  return v23;
}

- (unint64_t)numberOfRecordsForService:(id)a3 withAuthorizationValue:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  id v7 = [v6 name];
  if (a4 == 1) {
    +[NSString stringWithFormat:@"SELECT COUNT(*) FROM access WHERE service = '%@'", v7];
  }
  else {
  long long v8 = +[NSString stringWithFormat:@"SELECT COUNT(*) FROM access WHERE service = '%@' AND auth_value = %lld", v7, a4];
  }

  if (v8)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10003BBFC;
    v12[3] = &unk_1000951B8;
    v12[4] = &v13;
    if (db_eval((uint64_t)[v8 UTF8String], 0, v12))
    {
      id v9 = [(TCCDServer *)self logHandle];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10003E910();
      }

      _db_error(0);
    }
  }
  unint64_t v10 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v10;
}

- (unint64_t)numberOfRecordsForService:(id)a3
{
  return [(TCCDServer *)self numberOfRecordsForService:a3 withAuthorizationValue:1];
}

- (id)accessRecordFromStep:(sqlite3_stmt *)a3
{
  id v5 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", sqlite3_column_text(a3, 0));
  id v6 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", sqlite3_column_text(a3, 1));
  uint64_t v7 = sqlite3_column_int(a3, 2);
  sqlite3_int64 v31 = sqlite3_column_int64(a3, 3);
  sqlite3_int64 v30 = sqlite3_column_int64(a3, 4);
  sqlite3_int64 v29 = sqlite3_column_int64(a3, 5);
  if (sqlite3_column_type(a3, 6) == 5)
  {
    id v8 = 0;
  }
  else
  {
    id v9 = sqlite3_column_blob(a3, 6);
    id v8 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v9, sqlite3_column_bytes(a3, 6));
  }
  int v10 = sqlite3_column_int(a3, 7);
  int v28 = sqlite3_column_int(a3, 11);
  HIDWORD(v27) = sqlite3_column_int(a3, 12);
  BOOL v11 = [[TCCDCodeIdentity alloc] initWithIdentifier:v6 authority:v7 displayNamePolicyIdentifier:v10 verifierType:v8 != 0 verifierData:v8];
  int v12 = sqlite3_column_int(a3, 8);
  uint64_t v13 = sqlite3_column_text(a3, 9);
  if (v13)
  {
    id v14 = (__CFString *)[objc_alloc((Class)NSString) initWithUTF8String:v13];
  }
  else
  {
    uint64_t v15 = [(TCCDServer *)self logHandle];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10003EA00();
    }

    id v14 = @"UNUSED";
  }
  if ([(__CFString *)v14 isEqualToString:@"UNUSED"])
  {
    uint64_t v16 = +[TCCDAccessIndirectObject unusedIndirectObject];
LABEL_13:
    id v17 = (TCCDAccessCodeIndirectObject *)v16;
    goto LABEL_18;
  }
  if (v12 == 3)
  {
    uint64_t v16 = [[TCCDAccessFileProviderDomainIndirectObject alloc] initWithFileProviderDomainID:v14];
    goto LABEL_13;
  }
  if (sqlite3_column_type(a3, 10) == 5)
  {
    id v18 = 0;
  }
  else
  {
    id v19 = sqlite3_column_blob(a3, 10);
    id v18 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v19, sqlite3_column_bytes(a3, 10));
  }
  BOOL v20 = [[TCCDCodeIdentity alloc] initWithIdentifier:v14 authority:v12 displayNamePolicyIdentifier:0 verifierType:v18 != 0 verifierData:v18];
  id v17 = [[TCCDAccessCodeIndirectObject alloc] initWithCodeIdentity:v20];

LABEL_18:
  os_log_type_t v21 = [(TCCDServer *)self platform];
  uint64_t v22 = [v21 serviceByName:v5];

  if (v22)
  {
    BOOL v23 = [[TCCDAccessObject alloc] initWithService:v22 indirectObject:v17];
    id v24 = [objc_alloc((Class)NSDate) initWithTimeIntervalSince1970:(double)SHIDWORD(v27)];
    LOBYTE(v27) = 0;
    id v25 = [[TCCDAccessRecord alloc] initWithSubject:v11 object:v23 authorizationValue:v31 authorizationReason:v30 authorizationVersion:v29 lastModified:v24 flags:v28 replaceStoredCodeRequirement:v27];
  }
  else
  {
    BOOL v23 = [(TCCDServer *)self logHandle];
    if (os_log_type_enabled(&v23->super, OS_LOG_TYPE_ERROR)) {
      sub_10003E98C();
    }
    id v25 = 0;
  }

  return v25;
}

- (id)fetchAllAccessRecords
{
  uint64_t v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  id v9 = sub_10003C13C;
  int v10 = &unk_100095228;
  BOOL v11 = self;
  id v12 = objc_alloc_init((Class)NSMutableArray);
  id v3 = v12;
  if (db_eval((uint64_t)"SELECT * FROM access", 0, &v7))
  {
    id v4 = [(TCCDServer *)self logHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10003EA70();
    }
  }
  id v5 = objc_msgSend(v3, "copy", v7, v8, v9, v10, v11);

  return v5;
}

- (id)descriptionDictionariesForAllAccessRecords
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = [(TCCDServer *)self fetchAllAccessRecords];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003C27C;
  v8[3] = &unk_100096038;
  id v9 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v8];
  id v6 = [v5 copy];

  return v6;
}

- (id)fetchAllOverriddenServiceNames
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003C3DC;
  v7[3] = &unk_1000950A8;
  id v8 = objc_alloc_init((Class)NSMutableArray);
  id v3 = v8;
  if (db_eval((uint64_t)"SELECT service FROM access_overrides", 0, v7))
  {
    id v4 = [(TCCDServer *)self logHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10003EADC();
    }

    _db_error(0);
  }
  id v5 = [v3 copy];

  return v5;
}

- (id)fetchAllPolicies
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003C570;
  v7[3] = &unk_1000950A8;
  id v8 = objc_alloc_init((Class)NSMutableArray);
  id v3 = v8;
  if (db_eval((uint64_t)"SELECT * FROM policies", 0, v7))
  {
    id v4 = [(TCCDServer *)self logHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10003EB54();
    }

    _db_error(0);
  }
  id v5 = [v3 copy];

  return v5;
}

- (id)fetchAllActivePolicies
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003C800;
  v7[3] = &unk_1000950A8;
  id v8 = objc_alloc_init((Class)NSMutableArray);
  id v3 = v8;
  if (db_eval((uint64_t)"SELECT * FROM active_policy", 0, v7))
  {
    id v4 = [(TCCDServer *)self logHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10003EBCC();
    }

    _db_error(0);
  }
  id v5 = [v3 copy];

  return v5;
}

- (id)stateDumpDictionary
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = +[NSNumber numberWithInt:getpid()];
  [v3 setObject:v4 forKeyedSubscript:@"PID"];

  id v5 = +[NSNumber numberWithUnsignedInt:geteuid()];
  [v3 setObject:v5 forKeyedSubscript:@"UID"];

  uint64_t database_error_code = db_get_database_error_code();
  uint64_t v7 = +[NSNumber numberWithInt:database_error_code];
  [v3 setObject:v7 forKeyedSubscript:@"STATUS"];

  if (!database_error_code)
  {
    id v8 = +[NSNumber numberWithInt:db_get_current_version()];
    [v3 setObject:v8 forKeyedSubscript:@"VERS"];

    filename = db_get_filename();
    if (filename)
    {
      int v10 = db_get_file_metadata(filename);
      [v3 setObject:v10 forKeyedSubscript:@"DB_FILE_METADATA"];
    }
  }
  BOOL v11 = [(TCCDServer *)self descriptionDictionariesForAllAccessRecords];
  [v3 setObject:v11 forKeyedSubscript:@"RECORDS"];

  id v12 = [(TCCDServer *)self fetchAllOverriddenServiceNames];
  [v3 setObject:v12 forKeyedSubscript:@"OVERRIDES"];

  uint64_t v13 = [(TCCDServer *)self fetchAllPolicies];
  [v3 setObject:v13 forKeyedSubscript:@"POLICIES"];

  id v14 = [(TCCDServer *)self fetchAllActivePolicies];
  [v3 setObject:v14 forKeyedSubscript:@"ACTIVE_POLICIES"];

  id v15 = [v3 copy];
  return v15;
}

- (void)createStateHandler
{
  v2 = dispatch_get_global_queue(0, 0);
  os_state_add_handler();
}

- (BOOL)updateAuthorizationRecordFromContext:(id)a3 forResult:(id)a4 syncedUpdate:(BOOL *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 service];
  unsigned int v10 = [v8 databaseFlags];
  uint64_t v11 = (uint64_t)[v8 authorizationValue];
  id v12 = [v9 name];
  if (![v12 isEqualToString:@"kTCCServicePhotos"])
  {
LABEL_8:

    goto LABEL_9;
  }
  id v13 = [v8 promptType];

  if (v13 == (id)2)
  {
    if ([v8 authorizationValue] == (id)4)
    {
      id v14 = +[TCCDPlatform currentPlatform];
      uint64_t v15 = [v14 serviceByName:@"kTCCServicePhotosAdd"];

      uint64_t v62 = 2;
      uint64_t v11 = 2;
      id v9 = (void *)v15;
      goto LABEL_10;
    }
    if (![v8 authorizationValue])
    {
      id v12 = [(TCCDServer *)self logHandle];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10003EE04(v7);
      }
      goto LABEL_8;
    }
  }
LABEL_9:
  uint64_t v62 = 1;
LABEL_10:
  uint64_t v16 = [v7 service];
  id v17 = [v16 name];

  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = sub_10003D4D0;
  v72[3] = &unk_100096060;
  id v18 = v9;
  id v73 = v18;
  id v19 = v17;
  id v74 = v19;
  id v20 = v7;
  id v75 = v20;
  uint64_t v78 = v11;
  id v21 = v8;
  unsigned int v79 = v10;
  id v76 = v21;
  id v77 = 0;
  int v22 = db_eval((uint64_t)"INSERT OR REPLACE INTO access   (service, client, client_type, auth_value, auth_reason, auth_version, csreq, policy_id, indirect_object_identifier, flags, pid, pid_version, boot_uuid, last_reminded) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", v72, 0);
  if (v22) {
    goto LABEL_42;
  }
  BOOL v23 = [v20 service];
  unsigned int v24 = [v23 supportsStagedPrompting];

  BOOL v60 = a5;
  id v61 = (id)v11;
  unsigned int v59 = v10;
  if (!v24)
  {
LABEL_29:
    uint64_t v25 = 0;
    goto LABEL_31;
  }
  if ([v21 previousAuthorization] == (id)1)
  {
    uint64_t v25 = 0;
  }
  else
  {
    id v26 = [v21 previousAuthorization];
    uint64_t v25 = v26 != [v21 authorizationValue];
  }
  uint64_t v27 = [v20 service];
  int v28 = [v27 name];
  unsigned int v29 = [v28 isEqualToString:@"kTCCServiceCalendar"];

  if (v29 && [v21 previousAuthorization] == (id)4)
  {
    if ([v21 authorizationValue] == (id)2) {
      uint64_t v25 = 0;
    }
    else {
      uint64_t v25 = v25;
    }
  }
  sqlite3_int64 v30 = [v20 service];
  sqlite3_int64 v31 = [v30 name];
  if ([v31 isEqualToString:@"kTCCServicePhotos"])
  {
    id v32 = [v21 promptType];

    if (v32 != (id)2) {
      goto LABEL_31;
    }
    if ([v21 authorizationValue] == (id)3 || objc_msgSend(v21, "authorizationValue") == (id)2)
    {
      id v33 = [(TCCDServer *)self platform];
      int v34 = [v33 serviceByName:@"kTCCServicePhotosAdd"];

      v69[0] = _NSConcreteStackBlock;
      v69[1] = 3221225472;
      v69[2] = sub_10003D7F4;
      v69[3] = &unk_100095228;
      id v35 = v34;
      id v70 = v35;
      id v36 = v20;
      id v71 = v36;
      id v37 = objc_retainBlock(v69);
      v66[0] = _NSConcreteStackBlock;
      v66[1] = 3221225472;
      v66[2] = sub_10003D910;
      v66[3] = &unk_100095CA0;
      v66[4] = self;
      id v67 = v35;
      id v38 = v36;
      id v68 = v38;
      id v39 = v35;
      if (db_eval((uint64_t)"DELETE FROM access WHERE service = ? AND client = ? AND client_type = ?", v37, v66))
      {
        __int16 v40 = [(TCCDServer *)self logHandle];
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
          sub_10003ED68(v38);
        }
      }
    }
    else if ([v21 authorizationValue] == (id)4)
    {
      [v21 setAuthorizationValue:0];
    }
    goto LABEL_29;
  }

LABEL_31:
  __int16 v41 = [v20 service];
  [(TCCDServer *)self scheduleAccessEntryExpiryCheckForService:v41];

  access_changed();
  double v42 = [v20 subjectIdentity];
  __int16 v43 = [v42 identifier];
  v44 = [v20 subjectIdentity];
  -[TCCDServer publishAccessChangedEvent:forService:client:clientType:authValue:andKillClient:](self, "publishAccessChangedEvent:forService:client:clientType:authValue:andKillClient:", v62, v18, v43, objc_msgSend(v44, "client_type"), v61, v25);

  __int16 v45 = [(TCCDServer *)self platform];
  uint64_t v46 = [v45 syncController];

  if (v46
    && [v46 isSyncingEnabled]
    && [v18 accessActionStatusForAuthorizationValue:v61])
  {
    id v47 = [v21 authorizationVersion];
    long long v48 = [v18 name];
    unsigned __int8 v49 = [v46 peerSupportsService:v48 authVersion:v47];

    if (v49)
    {
      uint64_t v65 = (uint64_t)v47;
    }
    else
    {
      long long v50 = [v20 service];
      id v51 = [v50 translateAuth:v61 versionUpgrade:0];

      id v52 = [(TCCDServer *)self logHandle];
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v53 = [v20 service];
        __int16 v54 = [v53 name];
        *(_DWORD *)buf = 138412546;
        id v81 = v54;
        __int16 v82 = 2048;
        id v83 = v51;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "downgrading %@ add auth to %lu", buf, 0x16u);
      }
      id v61 = v51;
      uint64_t v65 = 1;
    }
    id v55 = [v18 name];
    long long v63 = [v20 subjectIdentity];
    __int16 v56 = [v63 identifier];
    id v57 = [v20 subjectIdentity];
    objc_msgSend(v46, "syncAccessUpdateForServiceIdentifier:clientIdentifier:clientType:accessStatus:authorizationVersion:flags:updateType:", v55, v56, objc_msgSend(v57, "client_type"), objc_msgSend(v18, "accessActionStatusForAuthorizationValue:", v61), v65, v59, 1);

    if (v60) {
      *BOOL v60 = 1;
    }
  }

LABEL_42:
  return v22 == 0;
}

- (BOOL)sendRecordMetricsForService:(const char *)a3
{
  id v3 = a3;
  if (a3)
  {
    id v5 = [(TCCDServer *)self platform];
    id v6 = +[NSString stringWithUTF8String:v3];
    id v7 = [v5 serviceByName:v6];

    id v8 = [(TCCDServer *)self logHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "-[TCCDServer sendRecordMetricsForService:]";
      *(_WORD *)&unsigned char buf[12] = 2082;
      *(void *)&buf[14] = v3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}s: invoked for %{public}s;", buf, 0x16u);
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    id v26 = sub_10000F8F4;
    uint64_t v27 = sub_10000F88C;
    id v28 = objc_alloc_init((Class)NSMutableArray);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10003DD04;
    v23[3] = &unk_1000951B8;
    v23[4] = buf;
    id v17 = objc_retainBlock(v23);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10003DFA0;
    v22[3] = &unk_1000958C0;
    v22[4] = v3;
    int v9 = db_eval((uint64_t)"SELECT client, client_type, auth_value, csreq, last_modified, strftime('%s','now') - last_modified AS age, indirect_object_identifier, indirect_object_identifier_type, indirect_object_code_identity, auth_reason, auth_version, flags, pid, pid_version, boot_uuid FROM access WHERE service = ?", v22, v17);
    LOBYTE(v3) = v9 == 0;
    if (!v9)
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v10 = *(id *)(*(void *)&buf[8] + 40);
      id v11 = [v10 countByEnumeratingWithState:&v18 objects:v24 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v19;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v10);
            }
            id v14 = [v7 populateRecordMetricWithFields:*(void *)(*((void *)&v18 + 1) + 8 * i)];
            if (v14)
            {
              uint64_t v15 = [(TCCDServer *)self platform];
              [v15 sendAnalyticsWithEventName:@"com.apple.TCC.authorization_audit" fields:v14];
            }
          }
          id v11 = [v10 countByEnumeratingWithState:&v18 objects:v24 count:16];
        }
        while (v11);
      }
    }
    _Block_object_dispose(buf, 8);
  }
  return (char)v3;
}

- (void)setLogHandle:(id)a3
{
}

- (BOOL)macos_isSystemServer
{
  return self->_macos_isSystemServer;
}

- (void)setMacos_isSystemServer:(BOOL)a3
{
  self->_macos_isSystemServer = a3;
}

- (NSString)temporaryDirectory
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)cacheDirectory
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)allowsInternalSecurityPolicies
{
  return self->_allowsInternalSecurityPolicies;
}

- (void)setAllowsInternalSecurityPolicies:(BOOL)a3
{
  self->_allowsInternalSecurityPolicies = a3;
}

- (OS_dispatch_source)macos_compatibilityFileVnodeSource
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 80, 1);
}

- (void)setMacos_compatibilityFileVnodeSource:(id)a3
{
}

- (BOOL)testDoComposition
{
  return self->_testDoComposition;
}

- (void)setTestDoComposition:(BOOL)a3
{
  self->_testDoComposition = a3;
}

- (TCCDEventPublisher)eventPublisher
{
  return (TCCDEventPublisher *)objc_getProperty(self, a2, 88, 1);
}

- (void)setEventPublisher:(id)a3
{
}

- (TCCDReminderMonitor)reminderMonitor
{
  return (TCCDReminderMonitor *)objc_getProperty(self, a2, 96, 1);
}

- (TCCDAssumedIdentityMonitor)assumedIdentityMonitor
{
  return (TCCDAssumedIdentityMonitor *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAssumedIdentityMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assumedIdentityMonitor, 0);
  objc_storeStrong((id *)&self->_reminderMonitor, 0);
  objc_storeStrong((id *)&self->_eventPublisher, 0);
  objc_storeStrong((id *)&self->_macos_compatibilityFileVnodeSource, 0);
  objc_storeStrong((id *)&self->_logHandle, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_authAnalyticsTimer, 0);
  objc_storeStrong((id *)&self->_cacheDirectory, 0);
  objc_storeStrong((id *)&self->_temporaryDirectory, 0);
  objc_storeStrong((id *)&self->_stateDirectory, 0);
  objc_storeStrong((id *)&self->_userHomeDirectory, 0);
}

@end