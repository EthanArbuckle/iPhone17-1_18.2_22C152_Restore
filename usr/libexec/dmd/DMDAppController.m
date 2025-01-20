@interface DMDAppController
+ (BOOL)_stateCanBeResetSafely:(unint64_t)a3;
+ (DMDAppController)sharedController;
+ (NSString)metadataPath;
+ (void)_sendAppStatusChangeNotification;
+ (void)_setTapToPayAttribute:(id)a3 forBundleIdentifier:(id)a4;
- (BOOL)_isManagedBundleIdentifier:(id)a3;
- (BOOL)_setMetadata:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)_updateMetadataSettingKey:(id)a3 toValue:(id)a4 forBundleIdentifier:(id)a5 error:(id *)a6;
- (BOOL)removePersonaMappingForBundleID:(id)a3 error:(id *)a4;
- (BOOL)setAllowUserToHide:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)setAllowUserToLock:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)setAssociatedDomains:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)setAssociatedDomainsEnableDirectDownloads:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)setCellularSliceUUIDString:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)setConfiguration:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)setContentFilterUUIDString:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)setDNSProxyUUIDString:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)setFeedback:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)setManagementInformation:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)setRelayUUIDString:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)setSourceIdentifier:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)setState:(unint64_t)a3 forBundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)setVPNUUIDString:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)writeManagementInformationToDiskWithError:(id *)a3;
- (DMFOSStateHandler)stateHandler;
- (NSArray)foregroundBundleIdentifiers;
- (NSArray)managedBundleIdentifiers;
- (NSMutableDictionary)manifest;
- (NSString)description;
- (OS_dispatch_queue)queue;
- (id)DNSProxyUUIDStringForBundleIdentifier:(id)a3;
- (id)VPNUUIDStringForBundleIdentifier:(id)a3;
- (id)_metadataByBundleIdentifier;
- (id)_metadataForBundleIdentifier:(id)a3;
- (id)_newMetadataDictionary;
- (id)allowUserToHideForBundleIdentifier:(id)a3;
- (id)allowUserToLockForBundleIdentifier:(id)a3;
- (id)associatedDomainsEnableDirectDownloadsForBundleIdentifier:(id)a3;
- (id)associatedDomainsForBundleIdentifier:(id)a3;
- (id)cellularSliceUUIDStringForBundleIdentifier:(id)a3;
- (id)configurationForBundleIdentifier:(id)a3;
- (id)contentFilterUUIDStringForBundleIdentifier:(id)a3;
- (id)feedbackForBundleIdentifier:(id)a3;
- (id)initPrivate;
- (id)managementInformationForBundleIdentifier:(id)a3;
- (id)relayUUIDStringForBundleIdentifier:(id)a3;
- (id)removabilityForBundleIdentifier:(id)a3;
- (id)sourceIdentifierForBundleIdentifier:(id)a3;
- (id)tapToPayScreenLockForBundleIdentifier:(id)a3;
- (unint64_t)stateForBundleIdentifier:(id)a3;
- (void)_applyChangeInLifeCycle:(id)a3 stateMap:(id)a4;
- (void)_cleanUpStaleManagementStatesAndStartObservingApps;
- (void)_getEnterpriseAppMetadataForManifestURL:(id)a3 completion:(id)a4;
- (void)_getEnterpriseAppMetadataFromData:(id)a3 completion:(id)a4;
- (void)_resetStateForChangeInLifeCycle:(id)a3 newState:(unint64_t)a4;
- (void)_stopObservingLifeCycle:(id)a3;
- (void)advanceTransientStates;
- (void)cancelAppInstallationWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)cancelAppUpdateWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)didFailInstallingForLifeCycle:(id)a3;
- (void)didFinishInstallingForLifeCycle:(id)a3;
- (void)didFinishUninstallingForLifeCycle:(id)a3;
- (void)didFinishUpdatingForLifeCycle:(id)a3;
- (void)didResetStateForLifeCycle:(id)a3 state:(unint64_t)a4;
- (void)didStartInstallingForLifeCycle:(id)a3;
- (void)didStartUpdatingForLifeCycle:(id)a3;
- (void)getBundleIdentifierForAppRequest:(id)a3 completion:(id)a4;
- (void)getBundleIdentifierForManifestURL:(id)a3 completion:(id)a4;
- (void)getBundleIdentifierForStoreItemIdentifier:(id)a3 personaIdentifier:(id)a4 completion:(id)a5;
- (void)getMetadataForAppRequest:(id)a3 completion:(id)a4;
- (void)getMetadataForNonEnterpriseAppRequest:(id)a3 completion:(id)a4;
- (void)handleFetchRequest:(id)a3 completion:(id)a4;
- (void)resumeAppInstallationWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)resumeAppUpdateWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)sendManagedAppsChangedNotification;
- (void)setRemovability:(id)a3 forBundleIdentifier:(id)a4 completion:(id)a5;
- (void)setTapToPayScreenLock:(id)a3 forBundleIdentifier:(id)a4 completion:(id)a5;
- (void)setVPNUUIDString:(id)a3 cellularSliceUUIDString:(id)a4 associatedDomains:(id)a5 enableDirectDownloads:(id)a6 configuration:(id)a7 options:(unint64_t)a8 forBundleIdentifier:(id)a9;
- (void)setVPNUUIDString:(id)a3 cellularSliceUUIDString:(id)a4 contentFilterUUIDString:(id)a5 DNSProxyUUIDString:(id)a6 relayUUIDString:(id)a7 associatedDomains:(id)a8 enableDirectDownloads:(id)a9 allowUserToHide:(id)a10 allowUserToLock:(id)a11 configuration:(id)a12 options:(unint64_t)a13 sourceIdentifier:(id)a14 forBundleIdentifier:(id)a15;
- (void)startInstallingEnterpriseAppWithManifestURL:(id)a3 completion:(id)a4;
- (void)startInstallingNonEnterpriseAppForRequest:(id)a3 completion:(id)a4;
- (void)startRedeemingAppWithCode:(id)a3 completion:(id)a4;
- (void)startUninstallingAppWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)startUpdatingAppForRequest:(id)a3 metadata:(id)a4 completion:(id)a5;
- (void)updateBundleIDPersonaIDMappingForPersonaID:(id)a3 addingBundleID:(id)a4 completionHandler:(id)a5;
@end

@implementation DMDAppController

+ (DMDAppController)sharedController
{
  if (qword_1000FB948 != -1) {
    dispatch_once(&qword_1000FB948, &stru_1000C9D28);
  }
  v2 = (void *)qword_1000FB940;

  return (DMDAppController *)v2;
}

- (id)initPrivate
{
  v33.receiver = self;
  v33.super_class = (Class)DMDAppController;
  v2 = [(DMDAppController *)&v33 init];
  if (v2)
  {
    id v3 = +[NSString stringWithFormat:@"com.apple.dmd.%@.%p", objc_opt_class(), v2];
    dispatch_queue_t v4 = dispatch_queue_create((const char *)[v3 UTF8String], 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = [(id)objc_opt_class() metadataPath];
    v7 = +[NSFileManager defaultManager];
    unsigned int v8 = [v7 fileExistsAtPath:v6];

    if (v8)
    {
      id v32 = 0;
      v9 = +[NSData dataWithContentsOfFile:v6 options:0 error:&v32];
      id v10 = v32;
      if (!v9)
      {
        uint64_t v25 = +[NSString stringWithFormat:@"Could not read app management plist at path: %@, error: %@", v6, v10];
        CFStringRef v36 = @"error";
        id v37 = v10;
        v26 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
        id v27 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v25 userInfo:v26];

        objc_exception_throw(v27);
      }
      id v31 = 0;
      v11 = +[NSPropertyListSerialization propertyListWithData:v9 options:1 format:0 error:&v31];
      id v12 = v31;
      v13 = v12;
      if (v11)
      {

        v14 = v11;
        manifest = v2->_manifest;
        v2->_manifest = v14;
LABEL_10:

        [(DMDAppController *)v2 _cleanUpStaleManagementStatesAndStartObservingApps];
        objc_initWeak(&location, v2);
        id v20 = objc_alloc((Class)DMFOSStateHandler);
        v21 = v2->_queue;
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_100014E70;
        v28[3] = &unk_1000C9D50;
        objc_copyWeak(&v29, &location);
        v22 = (DMFOSStateHandler *)[v20 initWithQueue:v21 name:@"Apps" stateHandlerBlock:v28];
        stateHandler = v2->_stateHandler;
        v2->_stateHandler = v22;

        objc_destroyWeak(&v29);
        objc_destroyWeak(&location);

        return v2;
      }
      v16 = DMFAppLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10007F220();
      }
    }
    CFStringRef v34 = @"metadataByBundleID";
    manifest = objc_opt_new();
    v35 = manifest;
    v17 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    v18 = (NSMutableDictionary *)[v17 mutableCopy];
    v19 = v2->_manifest;
    v2->_manifest = v18;

    v14 = 0;
    goto LABEL_10;
  }
  return v2;
}

- (NSArray)foregroundBundleIdentifiers
{
  return (NSArray *)&__NSArray0__struct;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  dispatch_queue_t v4 = [(DMDAppController *)self _metadataByBundleIdentifier];
  v5 = +[NSString stringWithFormat:@"<%@: %p; Apps: %@>", v3, self, v4];

  return (NSString *)v5;
}

- (void)getBundleIdentifierForManifestURL:(id)a3 completion:(id)a4
{
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
    v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2, self, @"DMDAppController.m", 161, @"Invalid parameter not satisfying: %@", @"manifestURL" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v14 = +[NSAssertionHandler currentHandler];
  [v14 handleFailureInMethod:a2, self, @"DMDAppController.m", 162, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  id v10 = DMFAppLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [v7 host];
    *(_DWORD *)buf = 138543362;
    v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Get bundle identifier for manifest URL from: %{public}@", buf, 0xCu);
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100015138;
  v15[3] = &unk_1000C9D78;
  id v16 = v9;
  id v12 = v9;
  [(DMDAppController *)self _getEnterpriseAppMetadataForManifestURL:v7 completion:v15];
}

- (void)getBundleIdentifierForAppRequest:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void (**)(void, void, void))v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v16 = +[NSAssertionHandler currentHandler];
    [v16 handleFailureInMethod:a2, self, @"DMDAppController.m", 174, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v17 = +[NSAssertionHandler currentHandler];
  [v17 handleFailureInMethod:a2, self, @"DMDAppController.m", 175, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  id v10 = DMFAppLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Get bundle identifier for request: %{public}@", buf, 0xCu);
  }

  v11 = [v7 bundleIdentifier];
  if (v11)
  {
    ((void (**)(void, void *, void))v9)[2](v9, v11, 0);
  }
  else
  {
    id v12 = [v7 storeItemIdentifier];
    if (v12)
    {
      v13 = DMFAppLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v19 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Get bundle identifier for store item identifier: %{public}@", buf, 0xCu);
      }

      v14 = [v7 storeItemIdentifier];
      v15 = [v7 personaIdentifier];
      [(DMDAppController *)self getBundleIdentifierForStoreItemIdentifier:v14 personaIdentifier:v15 completion:v9];
    }
    else
    {
      v14 = [v7 manifestURL];
      [(DMDAppController *)self getBundleIdentifierForManifestURL:v14 completion:v9];
    }
  }
}

- (void)getMetadataForAppRequest:(id)a3 completion:(id)a4
{
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
    v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2, self, @"DMDAppController.m", 200, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v14 = +[NSAssertionHandler currentHandler];
  [v14 handleFailureInMethod:a2, self, @"DMDAppController.m", 201, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  id v10 = [v7 manifestURL];

  if (v10)
  {
    v11 = [v7 manifestURL];
    [(DMDAppController *)self _getEnterpriseAppMetadataForManifestURL:v11 completion:v9];
  }
  else
  {
    id v12 = DMFAppLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Get metadata for non-enterprise app request: %{public}@", buf, 0xCu);
    }

    [(DMDAppController *)self getMetadataForNonEnterpriseAppRequest:v7 completion:v9];
  }
}

- (id)managementInformationForBundleIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2, self, @"DMDAppController.m", 216, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];
  }
  v6 = [(DMDAppController *)self _metadataForBundleIdentifier:v5];
  if (v6)
  {
    id v7 = objc_opt_new();
    id v8 = [v6 objectForKeyedSubscript:@"state"];
    [v7 setState:[v8 unsignedIntegerValue]];

    v9 = [v6 objectForKeyedSubscript:@"flags"];
    [v7 setOptions:[v9 unsignedIntegerValue]];

    id v10 = [v6 objectForKeyedSubscript:@"RedemptionCode"];
    [v7 setRedemptionCode:v10];

    v11 = [v6 objectForKeyedSubscript:@"UnusedRedemptionCode"];
    [v7 setUnusedRedemptionCode:v11];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)setManagementInformation:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v10)
  {
    id v16 = +[NSAssertionHandler currentHandler];
    [v16 handleFailureInMethod:a2, self, @"DMDAppController.m", 235, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_7:
    id v11 = 0;
    goto LABEL_8;
  }
  if (!v9) {
    goto LABEL_7;
  }
LABEL_3:
  id v11 = [(DMDAppController *)self _metadataForBundleIdentifier:v10];
  if (!v11) {
    id v11 = [(DMDAppController *)self _newMetadataDictionary];
  }
  id v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 state]);
  [v11 setObject:v12 forKeyedSubscript:@"state"];

  v13 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 options]);
  [v11 setObject:v13 forKeyedSubscript:@"flags"];

  v14 = [v9 redemptionCode];
  [v11 setObject:v14 forKeyedSubscript:@"RedemptionCode"];

  v15 = [v9 unusedRedemptionCode];
  [v11 setObject:v15 forKeyedSubscript:@"UnusedRedemptionCode"];

LABEL_8:
  BOOL v17 = [(DMDAppController *)self _setMetadata:v11 forBundleIdentifier:v10 error:a5];

  return v17;
}

- (BOOL)writeManagementInformationToDiskWithError:(id *)a3
{
  dispatch_queue_t v4 = [(DMDAppController *)self manifest];
  id v5 = +[NSPropertyListSerialization dataWithPropertyList:v4 format:200 options:0 error:a3];

  if (v5)
  {
    v6 = [(id)objc_opt_class() metadataPath];
    id v7 = +[NSURL fileURLWithPath:v6 isDirectory:0];

    id v15 = 0;
    unsigned __int8 v8 = [v5 dm_atomicWriteToURL:v7 error:&v15];
    id v9 = v15;
    if ((v8 & 1) == 0)
    {
      id v10 = DMFAppLog();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
      if (v9)
      {
        if (v11) {
          sub_10007F2CC((uint64_t)v9, v10);
        }

        if (!a3) {
          goto LABEL_14;
        }
        NSErrorUserInfoKey v16 = NSUnderlyingErrorKey;
        id v17 = v9;
        id v12 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
        DMFErrorWithCodeAndUserInfo();
        id v13 = objc_claimAutoreleasedReturnValue();
        *a3 = v13;
      }
      else
      {
        if (v11) {
          sub_10007F288(v10);
        }

        if (!a3) {
          goto LABEL_14;
        }
        DMFErrorWithCodeAndUserInfo();
        id v12 = objc_claimAutoreleasedReturnValue();
        *a3 = v12;
      }
    }
LABEL_14:

    goto LABEL_15;
  }
  unsigned __int8 v8 = 0;
LABEL_15:

  return v8;
}

- (void)updateBundleIDPersonaIDMappingForPersonaID:(id)a3 addingBundleID:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = v10;
  if (v8)
  {
    id v12 = [(DMDAppController *)self managedBundleIdentifiers];
    id v13 = v12;
    if (v9)
    {
      uint64_t v14 = [v12 arrayByAddingObject:v9];

      id v13 = (void *)v14;
    }
    id v15 = +[UMUserManager sharedManager];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100015C58;
    v17[3] = &unk_1000C9DA0;
    id v18 = v13;
    id v19 = v8;
    id v20 = v11;
    id v16 = v13;
    [v15 setBundlesIdentifiers:v16 forPersonaWithPersonaUniqueString:v19 completionHandler:v17];
  }
  else if (v10)
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

- (BOOL)removePersonaMappingForBundleID:(id)a3 error:(id *)a4
{
  id v18 = a4;
  id v5 = a3;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = sub_100015F6C;
  v28 = sub_100015F7C;
  id v29 = 0;
  v6 = +[UMUserManager sharedManager];
  [v6 listAllPersonaWithAttributes];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v7);
        }
        BOOL v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v12 = [v11 userPersonaBundleIDList:v18];
        unsigned int v13 = [v12 containsObject:v5];

        if (v13)
        {
          id v15 = [v11 userPersonaUniqueString];
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472;
          v19[2] = sub_100015F84;
          v19[3] = &unk_1000C9DC8;
          v19[4] = &v24;
          [(DMDAppController *)self updateBundleIDPersonaIDMappingForPersonaID:v15 addingBundleID:0 completionHandler:v19];

          id v16 = (void *)v25[5];
          if (v16)
          {
            LOBYTE(v8) = 0;
            char v14 = 0;
            if (v18) {
              id *v18 = v16;
            }
          }
          else
          {
            char v14 = 0;
            LOBYTE(v8) = 1;
          }
          goto LABEL_14;
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v20 objects:v30 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  char v14 = 1;
LABEL_14:

  _Block_object_dispose(&v24, 8);
  return (v8 | v14) & 1;
}

- (id)VPNUUIDStringForBundleIdentifier:(id)a3
{
  uint64_t v3 = [(DMDAppController *)self _metadataForBundleIdentifier:a3];
  dispatch_queue_t v4 = [v3 objectForKeyedSubscript:@"Attributes"];
  id v5 = [v4 objectForKeyedSubscript:@"VPNUUID"];

  return v5;
}

- (BOOL)setVPNUUIDString:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = DMFAppLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v17 = v9;
    __int16 v18 = 2114;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Set VPN UUID for bundle identifier %{public}@: %{public}@", buf, 0x16u);
  }

  id v15 = 0;
  BOOL v11 = [(DMDAppController *)self _updateMetadataSettingKey:@"VPNUUID" toValue:v8 forBundleIdentifier:v9 error:&v15];
  id v12 = v15;
  unsigned int v13 = v12;
  if (a5 && !v11) {
    *a5 = v12;
  }

  return v11;
}

- (id)cellularSliceUUIDStringForBundleIdentifier:(id)a3
{
  uint64_t v3 = [(DMDAppController *)self _metadataForBundleIdentifier:a3];
  dispatch_queue_t v4 = [v3 objectForKeyedSubscript:@"Attributes"];
  id v5 = [v4 objectForKeyedSubscript:@"CellularSliceUUID"];

  return v5;
}

- (BOOL)setCellularSliceUUIDString:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = DMFAppLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v17 = v9;
    __int16 v18 = 2114;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Set cellular slice UUID for bundle identifier %{public}@: %{public}@", buf, 0x16u);
  }

  id v15 = 0;
  BOOL v11 = [(DMDAppController *)self _updateMetadataSettingKey:@"CellularSliceUUID" toValue:v8 forBundleIdentifier:v9 error:&v15];
  id v12 = v15;
  unsigned int v13 = v12;
  if (a5 && !v11) {
    *a5 = v12;
  }

  return v11;
}

- (id)contentFilterUUIDStringForBundleIdentifier:(id)a3
{
  uint64_t v3 = [(DMDAppController *)self _metadataForBundleIdentifier:a3];
  dispatch_queue_t v4 = [v3 objectForKeyedSubscript:@"Attributes"];
  id v5 = [v4 objectForKeyedSubscript:@"ContentFilterUUID"];

  return v5;
}

- (BOOL)setContentFilterUUIDString:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = DMFAppLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v17 = v9;
    __int16 v18 = 2114;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Set content filter UUID for bundle identifier %{public}@: %{public}@", buf, 0x16u);
  }

  id v15 = 0;
  BOOL v11 = [(DMDAppController *)self _updateMetadataSettingKey:@"ContentFilterUUID" toValue:v8 forBundleIdentifier:v9 error:&v15];
  id v12 = v15;
  unsigned int v13 = v12;
  if (a5 && !v11) {
    *a5 = v12;
  }

  return v11;
}

- (id)DNSProxyUUIDStringForBundleIdentifier:(id)a3
{
  uint64_t v3 = [(DMDAppController *)self _metadataForBundleIdentifier:a3];
  dispatch_queue_t v4 = [v3 objectForKeyedSubscript:@"Attributes"];
  id v5 = [v4 objectForKeyedSubscript:@"DNSProxyUUID"];

  return v5;
}

- (BOOL)setDNSProxyUUIDString:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = DMFAppLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v17 = v9;
    __int16 v18 = 2114;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Set DNS proxy UUID for bundle identifier %{public}@: %{public}@", buf, 0x16u);
  }

  id v15 = 0;
  BOOL v11 = [(DMDAppController *)self _updateMetadataSettingKey:@"DNSProxyUUID" toValue:v8 forBundleIdentifier:v9 error:&v15];
  id v12 = v15;
  unsigned int v13 = v12;
  if (a5 && !v11) {
    *a5 = v12;
  }

  return v11;
}

- (id)relayUUIDStringForBundleIdentifier:(id)a3
{
  uint64_t v3 = [(DMDAppController *)self _metadataForBundleIdentifier:a3];
  dispatch_queue_t v4 = [v3 objectForKeyedSubscript:@"Attributes"];
  id v5 = [v4 objectForKeyedSubscript:@"RelayUUID"];

  return v5;
}

- (BOOL)setRelayUUIDString:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = DMFAppLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v17 = v9;
    __int16 v18 = 2114;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Set relay UUID for bundle identifier %{public}@: %{public}@", buf, 0x16u);
  }

  id v15 = 0;
  BOOL v11 = [(DMDAppController *)self _updateMetadataSettingKey:@"RelayUUID" toValue:v8 forBundleIdentifier:v9 error:&v15];
  id v12 = v15;
  unsigned int v13 = v12;
  if (a5 && !v11) {
    *a5 = v12;
  }

  return v11;
}

- (id)associatedDomainsForBundleIdentifier:(id)a3
{
  uint64_t v3 = [(DMDAppController *)self _metadataForBundleIdentifier:a3];
  dispatch_queue_t v4 = [v3 objectForKeyedSubscript:@"Attributes"];
  id v5 = [v4 objectForKeyedSubscript:@"AssociatedDomains"];

  return v5;
}

- (BOOL)setAssociatedDomains:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = DMFAppLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v11 = [v8 debugDescription];
    *(_DWORD *)buf = 138543618;
    id v18 = v9;
    __int16 v19 = 2114;
    long long v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Set associated domains for bundle identifier %{public}@: %{public}@", buf, 0x16u);
  }
  id v16 = 0;
  BOOL v12 = [(DMDAppController *)self _updateMetadataSettingKey:@"AssociatedDomains" toValue:v8 forBundleIdentifier:v9 error:&v16];
  id v13 = v16;
  char v14 = v13;
  if (a5 && !v12) {
    *a5 = v13;
  }

  return v12;
}

- (id)associatedDomainsEnableDirectDownloadsForBundleIdentifier:(id)a3
{
  uint64_t v3 = [(DMDAppController *)self _metadataForBundleIdentifier:a3];
  dispatch_queue_t v4 = [v3 objectForKeyedSubscript:@"Attributes"];
  id v5 = [v4 objectForKeyedSubscript:@"AssociatedDomainsEnableDirectDownloads"];

  return v5;
}

- (BOOL)setAssociatedDomainsEnableDirectDownloads:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = DMFAppLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v17 = v9;
    __int16 v18 = 2114;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Set associated domains enable direct downloads for bundle identifier %{public}@: %{public}@", buf, 0x16u);
  }

  id v15 = 0;
  BOOL v11 = [(DMDAppController *)self _updateMetadataSettingKey:@"AssociatedDomainsEnableDirectDownloads" toValue:v8 forBundleIdentifier:v9 error:&v15];
  id v12 = v15;
  id v13 = v12;
  if (a5 && !v11) {
    *a5 = v12;
  }

  return v11;
}

- (id)removabilityForBundleIdentifier:(id)a3
{
  uint64_t v3 = [(DMDAppController *)self _metadataForBundleIdentifier:a3];
  dispatch_queue_t v4 = [v3 objectForKeyedSubscript:@"Attributes"];
  id v5 = [v4 objectForKeyedSubscript:@"Removable"];

  return v5;
}

- (void)setRemovability:(id)a3 forBundleIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = DMFAppLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v29 = v9;
    __int16 v30 = 2114;
    id v31 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Set removability for bundle identifier %{public}@: %{public}@", buf, 0x16u);
  }

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100016DE8;
  v25[3] = &unk_1000C9DF0;
  v25[4] = self;
  id v12 = v9;
  id v26 = v12;
  id v27 = v10;
  id v13 = v10;
  char v14 = objc_retainBlock(v25);
  if (v8)
  {
    unsigned int v15 = [v8 BOOLValue];
    uint64_t v16 = 1;
    if (!v15) {
      uint64_t v16 = 2;
    }
  }
  else
  {
    uint64_t v16 = 1;
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100016F0C;
  v20[3] = &unk_1000C9E40;
  id v23 = v14;
  uint64_t v24 = v16;
  id v21 = v12;
  id v22 = v8;
  id v17 = v8;
  __int16 v18 = v14;
  id v19 = v12;
  +[IXAppInstallCoordinator removabilityForAppWithBundleID:v19 completion:v20];
}

- (id)tapToPayScreenLockForBundleIdentifier:(id)a3
{
  uint64_t v3 = [(DMDAppController *)self _metadataForBundleIdentifier:a3];
  dispatch_queue_t v4 = [v3 objectForKeyedSubscript:@"Attributes"];
  id v5 = [v4 objectForKeyedSubscript:@"TapToPayScreenLock"];

  return v5;
}

+ (void)_setTapToPayAttribute:(id)a3 forBundleIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = DMFAppLog();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      sub_10007F504((uint64_t)v5, v7);
    }

    [sub_100017298() setMDMAppAttribute:0 withValue:[v5 BOOLValue] forBundleID:v6];
  }
  else
  {
    if (v8) {
      sub_10007F4C0(v7);
    }

    [sub_100017298() removeMDMAppAttribute:0 forBundleID:v6];
  }
}

- (void)setTapToPayScreenLock:(id)a3 forBundleIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a5;
  BOOL v11 = DMFAppLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v15 = v9;
    __int16 v16 = 2114;
    id v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "setTapToPayScreenLock for bundle identifier %{public}@: %{public}@", buf, 0x16u);
  }

  [(id)objc_opt_class() _setTapToPayAttribute:v8 forBundleIdentifier:v9];
  id v13 = 0;
  [(DMDAppController *)self _updateMetadataSettingKey:@"TapToPayScreenLock" toValue:v8 forBundleIdentifier:v9 error:&v13];
  id v12 = v13;
  if (v10) {
    v10[2](v10, v12);
  }
}

- (id)allowUserToHideForBundleIdentifier:(id)a3
{
  uint64_t v3 = [(DMDAppController *)self _metadataForBundleIdentifier:a3];
  dispatch_queue_t v4 = [v3 objectForKeyedSubscript:@"Attributes"];
  id v5 = [v4 objectForKeyedSubscript:@"AllowUserToHide"];

  return v5;
}

- (BOOL)setAllowUserToHide:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = DMFAppLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v17 = v8;
    __int16 v18 = 2114;
    id v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Set allow user to hide (%@) for bundle identifier: %{public}@", buf, 0x16u);
  }

  id v15 = 0;
  BOOL v11 = [(DMDAppController *)self _updateMetadataSettingKey:@"AllowUserToHide" toValue:v8 forBundleIdentifier:v9 error:&v15];
  id v12 = v15;
  id v13 = v12;
  if (a5 && !v11) {
    *a5 = v12;
  }

  return v11;
}

- (id)allowUserToLockForBundleIdentifier:(id)a3
{
  uint64_t v3 = [(DMDAppController *)self _metadataForBundleIdentifier:a3];
  dispatch_queue_t v4 = [v3 objectForKeyedSubscript:@"Attributes"];
  id v5 = [v4 objectForKeyedSubscript:@"AllowUserToLock"];

  return v5;
}

- (BOOL)setAllowUserToLock:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = DMFAppLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v17 = v8;
    __int16 v18 = 2114;
    id v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Set allow user to lock (%@) for bundle identifier: %{public}@", buf, 0x16u);
  }

  id v15 = 0;
  BOOL v11 = [(DMDAppController *)self _updateMetadataSettingKey:@"AllowUserToLock" toValue:v8 forBundleIdentifier:v9 error:&v15];
  id v12 = v15;
  id v13 = v12;
  if (a5 && !v11) {
    *a5 = v12;
  }

  return v11;
}

- (BOOL)_updateMetadataSettingKey:(id)a3 toValue:(id)a4 forBundleIdentifier:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [(DMDAppController *)self _metadataForBundleIdentifier:v12];
  if (!v13)
  {
    if (!v11)
    {
      BOOL v15 = 1;
      goto LABEL_10;
    }
    id v13 = [(DMDAppController *)self _newMetadataDictionary];
  }
  char v14 = [v13 objectForKeyedSubscript:@"Attributes"];
  [v14 setObject:v11 forKeyedSubscript:v10];

  id v18 = 0;
  BOOL v15 = [(DMDAppController *)self _setMetadata:v13 forBundleIdentifier:v12 error:&v18];
  id v16 = v18;
  if (!v15)
  {
    if (!v16)
    {
      DMFErrorWithCodeAndUserInfo();
      id v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (a6)
    {
      id v16 = v16;
      *a6 = v16;
    }
  }

LABEL_10:
  return v15;
}

- (id)configurationForBundleIdentifier:(id)a3
{
  id v5 = +[NSAssertionHandler currentHandler];
  uint64_t v6 = objc_opt_class();
  id v7 = NSStringFromSelector(a2);
  [v5 handleFailureInMethod:a2, self, @"DMDAppController.m", 628, @"%@ must implement %@", v6, v7 object file lineNumber description];

  return 0;
}

- (BOOL)setConfiguration:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v7 = +[NSAssertionHandler currentHandler];
  uint64_t v8 = objc_opt_class();
  id v9 = NSStringFromSelector(a2);
  [v7 handleFailureInMethod:a2, self, @"DMDAppController.m", 633, @"%@ must implement %@", v8, v9 object file lineNumber description];

  return 0;
}

- (id)feedbackForBundleIdentifier:(id)a3
{
  id v5 = +[NSAssertionHandler currentHandler];
  uint64_t v6 = objc_opt_class();
  id v7 = NSStringFromSelector(a2);
  [v5 handleFailureInMethod:a2, self, @"DMDAppController.m", 638, @"%@ must implement %@", v6, v7 object file lineNumber description];

  return 0;
}

- (BOOL)setFeedback:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v7 = +[NSAssertionHandler currentHandler];
  uint64_t v8 = objc_opt_class();
  id v9 = NSStringFromSelector(a2);
  [v7 handleFailureInMethod:a2, self, @"DMDAppController.m", 643, @"%@ must implement %@", v8, v9 object file lineNumber description];

  return 0;
}

- (BOOL)setSourceIdentifier:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = DMFAppLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412546;
    id v18 = v8;
    __int16 v19 = 2114;
    id v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Set source ID %@ for bundle identifier: %{public}@", (uint8_t *)&v17, 0x16u);
  }

  id v11 = [(DMDAppController *)self _metadataForBundleIdentifier:v9];
  if (v11)
  {
    id v12 = v11;
    id v13 = [v11 objectForKeyedSubscript:@"source"];
  }
  else
  {
    if (!v8)
    {
      BOOL v15 = 1;
      goto LABEL_12;
    }
    id v12 = [(DMDAppController *)self _newMetadataDictionary];
    id v13 = v8;
  }
  char v14 = v13;
  [v12 setObject:v8 forKeyedSubscript:@"source"];
  if ((v8 == 0) != (v14 == 0) || v14 && ([v8 isEqualToString:v14] & 1) == 0) {
    [(id)objc_opt_class() _sendAppStatusChangeNotification];
  }
  BOOL v15 = [(DMDAppController *)self _setMetadata:v12 forBundleIdentifier:v9 error:a5];

LABEL_12:
  return v15;
}

- (id)sourceIdentifierForBundleIdentifier:(id)a3
{
  uint64_t v3 = [(DMDAppController *)self _metadataForBundleIdentifier:a3];
  dispatch_queue_t v4 = [v3 objectForKeyedSubscript:@"source"];

  return v4;
}

+ (NSString)metadataPath
{
  return 0;
}

- (void)getBundleIdentifierForStoreItemIdentifier:(id)a3 personaIdentifier:(id)a4 completion:(id)a5
{
  id v9 = +[NSAssertionHandler currentHandler];
  uint64_t v7 = objc_opt_class();
  id v8 = NSStringFromSelector(a2);
  [v9 handleFailureInMethod:a2, self, @"DMDAppController.m", 696, @"%@ must implement %@", v7, v8 object file lineNumber description];
}

- (void)getMetadataForNonEnterpriseAppRequest:(id)a3 completion:(id)a4
{
  id v8 = +[NSAssertionHandler currentHandler];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = NSStringFromSelector(a2);
  [v8 handleFailureInMethod:a2, self, @"DMDAppController.m", 701, @"%@ must implement %@", v6, v7 object file lineNumber description];
}

- (void)handleFetchRequest:(id)a3 completion:(id)a4
{
  id v8 = +[NSAssertionHandler currentHandler];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = NSStringFromSelector(a2);
  [v8 handleFailureInMethod:a2, self, @"DMDAppController.m", 706, @"%@ must implement %@", v6, v7 object file lineNumber description];
}

- (void)startInstallingEnterpriseAppWithManifestURL:(id)a3 completion:(id)a4
{
  id v8 = +[NSAssertionHandler currentHandler];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = NSStringFromSelector(a2);
  [v8 handleFailureInMethod:a2, self, @"DMDAppController.m", 711, @"%@ must implement %@", v6, v7 object file lineNumber description];
}

- (void)startInstallingNonEnterpriseAppForRequest:(id)a3 completion:(id)a4
{
  id v8 = +[NSAssertionHandler currentHandler];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = NSStringFromSelector(a2);
  [v8 handleFailureInMethod:a2, self, @"DMDAppController.m", 716, @"%@ must implement %@", v6, v7 object file lineNumber description];
}

- (void)startRedeemingAppWithCode:(id)a3 completion:(id)a4
{
  id v8 = +[NSAssertionHandler currentHandler];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = NSStringFromSelector(a2);
  [v8 handleFailureInMethod:a2, self, @"DMDAppController.m", 721, @"%@ must implement %@", v6, v7 object file lineNumber description];
}

- (void)cancelAppInstallationWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v8 = +[NSAssertionHandler currentHandler];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = NSStringFromSelector(a2);
  [v8 handleFailureInMethod:a2, self, @"DMDAppController.m", 726, @"%@ must implement %@", v6, v7 object file lineNumber description];
}

- (void)resumeAppInstallationWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v8 = +[NSAssertionHandler currentHandler];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = NSStringFromSelector(a2);
  [v8 handleFailureInMethod:a2, self, @"DMDAppController.m", 731, @"%@ must implement %@", v6, v7 object file lineNumber description];
}

- (void)startUpdatingAppForRequest:(id)a3 metadata:(id)a4 completion:(id)a5
{
  id v9 = +[NSAssertionHandler currentHandler];
  uint64_t v7 = objc_opt_class();
  id v8 = NSStringFromSelector(a2);
  [v9 handleFailureInMethod:a2, self, @"DMDAppController.m", 737, @"%@ must implement %@", v7, v8 object file lineNumber description];
}

- (void)cancelAppUpdateWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v8 = +[NSAssertionHandler currentHandler];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = NSStringFromSelector(a2);
  [v8 handleFailureInMethod:a2, self, @"DMDAppController.m", 742, @"%@ must implement %@", v6, v7 object file lineNumber description];
}

- (void)resumeAppUpdateWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v8 = +[NSAssertionHandler currentHandler];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = NSStringFromSelector(a2);
  [v8 handleFailureInMethod:a2, self, @"DMDAppController.m", 747, @"%@ must implement %@", v6, v7 object file lineNumber description];
}

- (void)startUninstallingAppWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v8 = +[NSAssertionHandler currentHandler];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = NSStringFromSelector(a2);
  [v8 handleFailureInMethod:a2, self, @"DMDAppController.m", 752, @"%@ must implement %@", v6, v7 object file lineNumber description];
}

- (void)sendManagedAppsChangedNotification
{
  id v6 = +[NSAssertionHandler currentHandler];
  uint64_t v4 = objc_opt_class();
  id v5 = NSStringFromSelector(a2);
  [v6 handleFailureInMethod:a2, self, @"DMDAppController.m", 756, @"%@ must implement %@", v4, v5 object file lineNumber description];
}

- (void)didStartInstallingForLifeCycle:(id)a3
{
  v6[0] = &off_1000D3380;
  v6[1] = &off_1000D33B0;
  v7[0] = &off_1000D3398;
  v7[1] = &off_1000D3398;
  v6[2] = &off_1000D33C8;
  v7[2] = &off_1000D33E0;
  id v4 = a3;
  id v5 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:3];
  [(DMDAppController *)self _applyChangeInLifeCycle:v4 stateMap:v5];
}

- (void)didFailInstallingForLifeCycle:(id)a3
{
  id v6 = &off_1000D3398;
  uint64_t v7 = &off_1000D33F8;
  id v4 = a3;
  id v5 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  [(DMDAppController *)self _applyChangeInLifeCycle:v4 stateMap:v5];
}

- (void)didFinishInstallingForLifeCycle:(id)a3
{
  id v6 = &off_1000D3398;
  uint64_t v7 = &off_1000D3410;
  id v4 = a3;
  id v5 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  [(DMDAppController *)self _applyChangeInLifeCycle:v4 stateMap:v5];
}

- (void)didStartUpdatingForLifeCycle:(id)a3
{
  id v6 = &off_1000D3410;
  uint64_t v7 = &off_1000D3428;
  id v4 = a3;
  id v5 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  [(DMDAppController *)self _applyChangeInLifeCycle:v4 stateMap:v5];
}

- (void)didFinishUpdatingForLifeCycle:(id)a3
{
  id v6 = &off_1000D3428;
  uint64_t v7 = &off_1000D3410;
  id v4 = a3;
  id v5 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  [(DMDAppController *)self _applyChangeInLifeCycle:v4 stateMap:v5];
}

- (void)didFinishUninstallingForLifeCycle:(id)a3
{
  id v6 = &off_1000D3410;
  uint64_t v7 = &off_1000D3380;
  id v4 = a3;
  id v5 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  [(DMDAppController *)self _applyChangeInLifeCycle:v4 stateMap:v5];
}

- (void)didResetStateForLifeCycle:(id)a3 state:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = DMFAppLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 bundleIdentifier];
    int v9 = 138543362;
    id v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "DMDAppController::didResetStateForLifeCycle(%{public}@)", (uint8_t *)&v9, 0xCu);
  }
  [(DMDAppController *)self _resetStateForChangeInLifeCycle:v6 newState:a4];
}

- (NSArray)managedBundleIdentifiers
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_100015F6C;
  id v13 = sub_100015F7C;
  id v14 = 0;
  objc_initWeak(&location, self);
  uint64_t v3 = [(DMDAppController *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018C88;
  block[3] = &unk_1000C9E68;
  block[4] = &v9;
  objc_copyWeak(&v7, &location);
  dispatch_sync(v3, block);

  id v4 = (id)v10[5];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v9, 8);

  return (NSArray *)v4;
}

- (void)setVPNUUIDString:(id)a3 cellularSliceUUIDString:(id)a4 associatedDomains:(id)a5 enableDirectDownloads:(id)a6 configuration:(id)a7 options:(unint64_t)a8 forBundleIdentifier:(id)a9
{
}

- (void)setVPNUUIDString:(id)a3 cellularSliceUUIDString:(id)a4 contentFilterUUIDString:(id)a5 DNSProxyUUIDString:(id)a6 relayUUIDString:(id)a7 associatedDomains:(id)a8 enableDirectDownloads:(id)a9 allowUserToHide:(id)a10 allowUserToLock:(id)a11 configuration:(id)a12 options:(unint64_t)a13 sourceIdentifier:(id)a14 forBundleIdentifier:(id)a15
{
  id v67 = a4;
  id v19 = a5;
  id v72 = a6;
  id v71 = a7;
  id v70 = a8;
  id v69 = a9;
  id v20 = a10;
  id v21 = a11;
  id v68 = a12;
  id v22 = a14;
  id v23 = a15;
  id v24 = a3;
  uint64_t v25 = DMFAppLog();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v87 = v23;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Bulk set app attributes, configuration, source ID, and management information for bundle identifier: %{public}@", buf, 0xCu);
  }

  id v85 = 0;
  unsigned __int8 v26 = [(DMDAppController *)self setVPNUUIDString:v24 forBundleIdentifier:v23 error:&v85];

  id v27 = v85;
  if ((v26 & 1) == 0)
  {
    v28 = DMFAppLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_10007F9F4();
    }
  }
  id v84 = v27;
  unsigned __int8 v29 = -[DMDAppController setCellularSliceUUIDString:forBundleIdentifier:error:](self, "setCellularSliceUUIDString:forBundleIdentifier:error:", v67, v23, &v84, a3);
  id v30 = v84;

  if ((v29 & 1) == 0)
  {
    id v31 = DMFAppLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_10007F98C();
    }
  }
  id v83 = v30;
  unsigned __int8 v32 = [(DMDAppController *)self setContentFilterUUIDString:v19 forBundleIdentifier:v23 error:&v83];
  id v33 = v83;

  if ((v32 & 1) == 0)
  {
    CFStringRef v34 = DMFAppLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_10007F924();
    }
  }
  id v82 = v33;
  unsigned __int8 v35 = [(DMDAppController *)self setDNSProxyUUIDString:v72 forBundleIdentifier:v23 error:&v82];
  id v36 = v82;

  if ((v35 & 1) == 0)
  {
    id v37 = DMFAppLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      sub_10007F8BC();
    }
  }
  id v81 = v36;
  unsigned __int8 v38 = [(DMDAppController *)self setRelayUUIDString:v71 forBundleIdentifier:v23 error:&v81];
  id v39 = v81;

  if ((v38 & 1) == 0)
  {
    v40 = DMFAppLog();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      sub_10007F854();
    }
  }
  id v80 = v39;
  unsigned __int8 v41 = [(DMDAppController *)self setAssociatedDomains:v70 forBundleIdentifier:v23 error:&v80];
  id v42 = v80;

  if ((v41 & 1) == 0)
  {
    v43 = DMFAppLog();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      sub_10007F7EC();
    }
  }
  id v79 = v42;
  unsigned __int8 v44 = [(DMDAppController *)self setAssociatedDomainsEnableDirectDownloads:v69 forBundleIdentifier:v23 error:&v79];
  id v45 = v79;

  if ((v44 & 1) == 0)
  {
    v46 = DMFAppLog();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      sub_10007F784();
    }
  }
  id v78 = v45;
  unsigned __int8 v47 = [(DMDAppController *)self setAllowUserToHide:v20 forBundleIdentifier:v23 error:&v78];
  id v48 = v78;

  if ((v47 & 1) == 0)
  {
    v49 = DMFAppLog();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      sub_10007F71C();
    }
  }
  id v77 = v48;
  unsigned __int8 v50 = [(DMDAppController *)self setAllowUserToLock:v21 forBundleIdentifier:v23 error:&v77];
  id v51 = v77;

  if ((v50 & 1) == 0)
  {
    v52 = DMFAppLog();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
      sub_10007F6B4();
    }
  }
  v53 = v21;
  v54 = v19;
  id v76 = v51;
  unsigned __int8 v55 = [(DMDAppController *)self setConfiguration:v68 forBundleIdentifier:v23 error:&v76];
  id v56 = v76;

  if ((v55 & 1) == 0)
  {
    v57 = DMFAppLog();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
      sub_10007F64C();
    }
  }
  id v75 = v56;
  unsigned __int8 v58 = [(DMDAppController *)self setSourceIdentifier:v22 forBundleIdentifier:v23 error:&v75];
  id v59 = v75;

  if ((v58 & 1) == 0)
  {
    v60 = DMFAppLog();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
      sub_10007F5E4();
    }
  }
  v61 = v20;
  v62 = [(DMDAppController *)self managementInformationForBundleIdentifier:v23];
  if (!v62) {
    v62 = objc_opt_new();
  }
  [v62 setOptions:a13];
  id v74 = v59;
  unsigned __int8 v63 = [(DMDAppController *)self setManagementInformation:v62 forBundleIdentifier:v23 error:&v74];
  id v64 = v74;

  if ((v63 & 1) == 0)
  {
    v65 = DMFAppLog();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
      sub_10007F57C();
    }
  }
}

- (unint64_t)stateForBundleIdentifier:(id)a3
{
  uint64_t v3 = [(DMDAppController *)self _metadataForBundleIdentifier:a3];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 objectForKeyedSubscript:@"state"];
    unint64_t v6 = (unint64_t)[v5 unsignedIntegerValue];
  }
  else
  {
    unint64_t v6 = 19;
  }

  return v6;
}

- (BOOL)setState:(unint64_t)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v9 = DMFAppLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = +[DMFAppManagementInformation stringForState:a3];
    int v18 = 138543618;
    id v19 = v10;
    __int16 v20 = 2114;
    id v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Set state: %{public}@, for bundle identifier: %{public}@", (uint8_t *)&v18, 0x16u);
  }
  id v11 = [(DMDAppController *)self _metadataForBundleIdentifier:v8];
  if (!v11) {
    id v11 = [(DMDAppController *)self _newMetadataDictionary];
  }
  id v12 = [v11 objectForKeyedSubscript:@"state"];
  id v13 = v12;
  if (v12) {
    uint64_t v14 = (uint64_t)[v12 unsignedIntegerValue];
  }
  else {
    uint64_t v14 = 19;
  }
  BOOL v15 = +[NSNumber numberWithUnsignedInteger:a3];
  [v11 setObject:v15 forKeyedSubscript:@"state"];

  BOOL v16 = [(DMDAppController *)self _setMetadata:v11 forBundleIdentifier:v8 error:a5];
  if (v14 != a3) {
    [(id)objc_opt_class() _sendAppStatusChangeNotification];
  }

  return v16;
}

- (void)advanceTransientStates
{
  uint64_t v3 = DMFAppLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Advance transient app states", buf, 2u);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = [(DMDAppController *)self managedBundleIdentifiers];
  id v4 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v4)
  {
    id v6 = v4;
    id v7 = 0;
    uint64_t v29 = *(void *)v34;
    *(void *)&long long v5 = 138543874;
    long long v27 = v5;
    while (1)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v34 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v11 = [(DMDAppController *)self managementInformationForBundleIdentifier:v9];
        id v12 = (char *)[v11 state];
        if ((unint64_t)(v12 - 9) >= 3)
        {
          if (v12 == (char *)15)
          {
            BOOL v16 = +[DMDAppLifeCycle lifeCycleForBundleIdentifier:v9];
            id v17 = [v16 currentState];

            if (v17) {
              uint64_t v18 = 7;
            }
            else {
              uint64_t v18 = 8;
            }
            id v31 = v7;
            unsigned __int8 v19 = -[DMDAppController setState:forBundleIdentifier:error:](self, "setState:forBundleIdentifier:error:", v18, v9, &v31, v27);
            id v20 = v31;

            if ((v19 & 1) == 0)
            {
              id v21 = DMFAppLog();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                unsigned __int8 v26 = +[DMFAppManagementInformation stringForState:v18];
                *(_DWORD *)buf = v27;
                unsigned __int8 v38 = v26;
                __int16 v39 = 2114;
                id v40 = v9;
                __int16 v41 = 2114;
                id v42 = v20;
                _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Could not set state to %{public}@ for bundle identifier: %{public}@, error: %{public}@", buf, 0x20u);
              }
            }
            goto LABEL_22;
          }
          if (v12 != (char *)18)
          {
            id v20 = v7;
LABEL_22:
            BOOL v15 = [v11 unusedRedemptionCode:v27];
            if (v15)
            {
              [v11 setUnusedRedemptionCode:0];
              id v22 = [v11 redemptionCode];
              unsigned int v23 = [v22 isEqualToString:v15];

              if (v23) {
                [v11 setRedemptionCode:0];
              }
              id v30 = v20;
              unsigned __int8 v24 = [(DMDAppController *)self setManagementInformation:v11 forBundleIdentifier:v9 error:&v30];
              id v14 = v30;

              if ((v24 & 1) == 0)
              {
                uint64_t v25 = DMFAppLog();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543618;
                  unsigned __int8 v38 = v9;
                  __int16 v39 = 2114;
                  id v40 = v14;
                  _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Could not set management information for bundle identifier: %{public}@, error: %{public}@", buf, 0x16u);
                }
              }
            }
            else
            {
              id v14 = v20;
            }
            goto LABEL_30;
          }
        }
        id v32 = v7;
        unsigned __int8 v13 = -[DMDAppController setManagementInformation:forBundleIdentifier:error:](self, "setManagementInformation:forBundleIdentifier:error:", 0, v9, &v32, v27);
        id v14 = v32;

        if (v13) {
          goto LABEL_31;
        }
        BOOL v15 = DMFAppLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          unsigned __int8 v38 = v9;
          __int16 v39 = 2114;
          id v40 = v14;
          _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Could not remove management information for bundle identifier: %{public}@, error: %{public}@", buf, 0x16u);
        }
LABEL_30:

LABEL_31:
        id v7 = v14;
      }
      id v6 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
      if (!v6) {
        goto LABEL_35;
      }
    }
  }
  id v7 = 0;
LABEL_35:
}

- (void)_cleanUpStaleManagementStatesAndStartObservingApps
{
  uint64_t v3 = DMFAppLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Clean up stale app states", buf, 2u);
  }

  if (qword_1000FB958 != -1) {
    dispatch_once(&qword_1000FB958, &stru_1000C9E88);
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = [(DMDAppController *)self managedBundleIdentifiers];
  id v23 = [obj countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v23)
  {
    unsigned __int8 v24 = 0;
    uint64_t v22 = *(void *)v27;
    id v4 = CATOperationQueue_ptr;
    id v21 = self;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v27 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        id v8 = [(DMDAppController *)self managementInformationForBundleIdentifier:v6];
        uint64_t v9 = +[DMDAppLifeCycle lifeCycleForBundleIdentifier:v6];
        [v9 addObserver:self];
        id v10 = (void *)qword_1000FB950;
        id v11 = [v4[233] numberWithUnsignedInteger:[v8 state]];
        id v12 = [v10 objectForKeyedSubscript:v11];

        if (v12)
        {
          unsigned __int8 v13 = [v4[233] numberWithUnsignedInteger:[v9 currentState]];
          id v14 = [v12 objectForKeyedSubscript:v13];

          if (v14)
          {
            id v15 = [v14 unsignedIntegerValue];
            id v25 = v24;
            unsigned __int8 v16 = [(DMDAppController *)self setState:v15 forBundleIdentifier:v6 error:&v25];
            id v17 = v25;

            if ((v16 & 1) == 0)
            {
              uint64_t v18 = DMFAppLog();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                unsigned __int8 v19 = +[DMFAppManagementInformation stringForState:v15];
                *(_DWORD *)buf = 138543874;
                id v31 = v19;
                __int16 v32 = 2114;
                uint64_t v33 = v6;
                __int16 v34 = 2114;
                id v35 = v17;
                _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Could not set state to %{public}@ for bundle identifier: %{public}@, error: %{public}@", buf, 0x20u);
              }
            }
          }
          else
          {
            id v17 = v24;
          }

          unsigned __int8 v24 = v17;
          self = v21;
          id v4 = CATOperationQueue_ptr;
        }
      }
      id v23 = [obj countByEnumeratingWithState:&v26 objects:v36 count:16];
    }
    while (v23);
  }
  else
  {
    unsigned __int8 v24 = 0;
  }
}

- (void)_applyChangeInLifeCycle:(id)a3 stateMap:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 bundleIdentifier];
  unsigned __int8 v9 = [(DMDAppController *)self _isManagedBundleIdentifier:v8];

  if (v9)
  {
    id v10 = [v7 bundleIdentifier];

    unint64_t v11 = [(DMDAppController *)self stateForBundleIdentifier:v10];
    id v12 = +[NSNumber numberWithUnsignedInteger:v11];
    unsigned __int8 v13 = [v6 objectForKeyedSubscript:v12];

    if (v13)
    {
      id v14 = [v13 unsignedIntegerValue];
      id v15 = DMFAppLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        unsigned __int8 v16 = +[DMFAppManagementInformation stringForState:v11];
        id v17 = +[DMFAppManagementInformation stringForState:v14];
        *(_DWORD *)buf = 138543874;
        long long v26 = v16;
        __int16 v27 = 2114;
        long long v28 = v17;
        __int16 v29 = 2114;
        id v30 = v10;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Observed change in life cycle from old state: %{public}@ to new state: %{public}@ for bundle identifier: %{public}@", buf, 0x20u);
      }
      id v24 = 0;
      unsigned __int8 v18 = [(DMDAppController *)self setState:v14 forBundleIdentifier:v10 error:&v24];
      id v19 = v24;
      if ((v18 & 1) == 0)
      {
        id v20 = DMFAppLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          id v23 = +[DMFAppManagementInformation stringForState:v14];
          *(_DWORD *)buf = 138543874;
          long long v26 = v23;
          __int16 v27 = 2114;
          long long v28 = v10;
          __int16 v29 = 2114;
          id v30 = v19;
          _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Could not set new state: %{public}@, for bundle identifier: %{public}@, error: %{public}@", buf, 0x20u);
        }
      }
      [(id)objc_opt_class() _sendAppStatusChangeNotification];
    }
    else
    {
      id v21 = DMFAppLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = +[DMFAppManagementInformation stringForState:v11];
        *(_DWORD *)buf = 138543618;
        long long v26 = v22;
        __int16 v27 = 2114;
        long long v28 = v10;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Observed change in life cycle from old state: %{public}@ to missing new state for bundle identifier: %{public}@", buf, 0x16u);
      }
      [(id)objc_opt_class() _sendAppStatusChangeNotification];
    }
  }
  else
  {
    [(DMDAppController *)self _stopObservingLifeCycle:v7];
    id v10 = v7;
  }
}

- (void)_resetStateForChangeInLifeCycle:(id)a3 newState:(unint64_t)a4
{
  id v6 = a3;
  id v7 = DMFAppLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 bundleIdentifier];
    *(_DWORD *)buf = 138543362;
    __int16 v27 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "DMDAppController::_resetStateForChangeInLifeCycle(%{public}@)", buf, 0xCu);
  }
  if (qword_1000FB968 != -1) {
    dispatch_once(&qword_1000FB968, &stru_1000C9EA8);
  }
  unsigned __int8 v9 = [v6 bundleIdentifier];
  unsigned __int8 v10 = [(DMDAppController *)self _isManagedBundleIdentifier:v9];

  if (v10)
  {
    unint64_t v11 = [v6 bundleIdentifier];
    unint64_t v12 = [(DMDAppController *)self stateForBundleIdentifier:v11];
    if ([(id)objc_opt_class() _stateCanBeResetSafely:v12])
    {
      unsigned __int8 v13 = (void *)qword_1000FB960;
      id v14 = +[NSNumber numberWithUnsignedInteger:a4];
      id v15 = [v13 objectForKeyedSubscript:v14];
      id v16 = [v15 unsignedIntegerValue];

      id v17 = DMFAppLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        unsigned __int8 v18 = +[DMFAppManagementInformation stringForState:v12];
        id v19 = +[DMFAppManagementInformation stringForState:v16];
        *(_DWORD *)buf = 138543874;
        __int16 v27 = v18;
        __int16 v28 = 2114;
        __int16 v29 = v19;
        __int16 v30 = 2114;
        id v31 = v11;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Reset state due to change in life cycle, old state: %{public}@ to new state: %{public}@ for bundle identifier: %{public}@", buf, 0x20u);
      }
      id v25 = 0;
      unsigned __int8 v20 = [(DMDAppController *)self setState:v16 forBundleIdentifier:v11 error:&v25];
      id v21 = v25;
      if ((v20 & 1) == 0)
      {
        uint64_t v22 = DMFAppLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          id v24 = +[DMFAppManagementInformation stringForState:v16];
          *(_DWORD *)buf = 138543874;
          __int16 v27 = v24;
          __int16 v28 = 2114;
          __int16 v29 = v11;
          __int16 v30 = 2114;
          id v31 = v21;
          _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Could not set new state: %{public}@, for bundle identifier: %{public}@, error: %{public}@", buf, 0x20u);
        }
      }
    }
    else
    {
      id v21 = DMFAppLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = +[DMFAppManagementInformation stringForState:v12];
        *(_DWORD *)buf = 138543618;
        __int16 v27 = v23;
        __int16 v28 = 2114;
        __int16 v29 = v11;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Reset state due to change in life cycle, old state preserved: %{public}@, for bundle identifier: %{public}@", buf, 0x16u);
      }
    }

    [(id)objc_opt_class() _sendAppStatusChangeNotification];
  }
  else
  {
    [(DMDAppController *)self _stopObservingLifeCycle:v6];
  }
}

+ (BOOL)_stateCanBeResetSafely:(unint64_t)a3
{
  return (a3 > 0x11) | (0x1CFE7u >> a3) & 1;
}

- (BOOL)_isManagedBundleIdentifier:(id)a3
{
  id v4 = a3;
  long long v5 = [(DMDAppController *)self managedBundleIdentifiers];
  id v6 = +[NSPredicate predicateWithFormat:@"self == %@", v4];

  id v7 = [v5 filteredArrayUsingPredicate:v6];
  id v8 = [v7 firstObject];
  BOOL v9 = v8 != 0;

  return v9;
}

- (void)_stopObservingLifeCycle:(id)a3
{
  id v4 = a3;
  long long v5 = DMFAppLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 bundleIdentifier];
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing lifecycle observer for an app that is no longer managed: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  [v4 removeObserver:self];
  [(id)objc_opt_class() _sendAppStatusChangeNotification];
}

+ (void)_sendAppStatusChangeNotification
{
  v2 = (const char *)[DMFAppStatusDidChangeNotificationName UTF8String];

  notify_post(v2);
}

- (id)_metadataForBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_100015F6C;
  unsigned __int8 v18 = sub_100015F7C;
  id v19 = 0;
  objc_initWeak(&location, self);
  long long v5 = [(DMDAppController *)self queue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001AA70;
  v9[3] = &unk_1000C9ED0;
  unint64_t v11 = &v14;
  objc_copyWeak(&v12, &location);
  id v10 = v4;
  id v6 = v4;
  dispatch_sync(v5, v9);

  id v7 = (id)v15[5];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v14, 8);

  return v7;
}

- (BOOL)_setMetadata:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = DMFAppLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Set metadata for bundle identifier: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v28 = 0x3032000000;
  __int16 v29 = sub_100015F6C;
  __int16 v30 = sub_100015F7C;
  id v31 = 0;
  objc_initWeak(&location, self);
  unint64_t v11 = [(DMDAppController *)self queue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10001AD50;
  v16[3] = &unk_1000C9EF8;
  objc_copyWeak(&v21, &location);
  id v12 = v9;
  id v17 = v12;
  id v13 = v8;
  id v18 = v13;
  id v19 = &v23;
  p_long long buf = &buf;
  dispatch_sync(v11, v16);

  if (a5) {
    *a5 = *(id *)(*((void *)&buf + 1) + 40);
  }
  BOOL v14 = *((unsigned char *)v24 + 24) != 0;

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v23, 8);
  return v14;
}

- (id)_metadataByBundleIdentifier
{
  v2 = [(DMDAppController *)self manifest];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"metadataByBundleID"];

  return v3;
}

- (id)_newMetadataDictionary
{
  v2 = +[NSMutableDictionary dictionaryWithCapacity:5];
  uint64_t v3 = +[NSMutableDictionary dictionaryWithCapacity:1];
  [v2 setObject:v3 forKeyedSubscript:@"Attributes"];

  return v2;
}

- (void)_getEnterpriseAppMetadataForManifestURL:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v17 = +[NSAssertionHandler currentHandler];
    [v17 handleFailureInMethod:a2, self, @"DMDAppController.m", 1224, @"Invalid parameter not satisfying: %@", @"manifestURL" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v18 = +[NSAssertionHandler currentHandler];
  [v18 handleFailureInMethod:a2, self, @"DMDAppController.m", 1225, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  id v10 = DMFAppLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v11 = [v7 host];
    *(_DWORD *)long long buf = 138543362;
    uint64_t v22 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Get metadata for manifest URL from: %{public}@", buf, 0xCu);
  }
  id v12 = +[NSURLRequest requestWithURL:v7];
  id v13 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
  BOOL v14 = +[NSURLSession sessionWithConfiguration:v13];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10001B140;
  v19[3] = &unk_1000C9F20;
  v19[4] = self;
  id v20 = v9;
  id v15 = v9;
  uint64_t v16 = [v14 dataTaskWithRequest:v12 completionHandler:v19];
  [v16 resume];
}

- (void)_getEnterpriseAppMetadataFromData:(id)a3 completion:(id)a4
{
  long long v5 = (void (**)(id, void *, void))a4;
  uint64_t v14 = 0;
  id v6 = +[NSPropertyListSerialization propertyListWithData:a3 options:0 format:0 error:&v14];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v6 objectForKeyedSubscript:@"items"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && [v7 count]
      && (unint64_t)[v7 count] < 2)
    {
      id v8 = [v7 firstObject];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = [v8 objectForKeyedSubscript:@"metadata"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = [v9 objectForKeyedSubscript:@"kind"];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && ([v10 isEqualToString:@"software"] & 1) != 0)
          {
            unint64_t v11 = [v9 objectForKeyedSubscript:@"bundle-identifier"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v12 = [v9 objectForKeyedSubscript:@"title"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v13 = objc_opt_new();
                [v13 setBundleIdentifier:v11];
                [v13 setStoreItemIdentifier:0];
                [v13 setDisplayName:v12];
                [v13 setIsStoreApp:0];
                [v13 setIsFree:0];
                [v13 setIsUserLicensed:0];
                v5[2](v5, v13, 0);
              }
              else
              {
                id v13 = DMFErrorWithCodeAndUserInfo();
                ((void (**)(id, void *, void *))v5)[2](v5, 0, v13);
              }
            }
            else
            {
              id v12 = DMFErrorWithCodeAndUserInfo();
              ((void (**)(id, void *, void *))v5)[2](v5, 0, v12);
            }
          }
          else
          {
            unint64_t v11 = DMFErrorWithCodeAndUserInfo();
            ((void (**)(id, void *, void *))v5)[2](v5, 0, v11);
          }
        }
        else
        {
          id v10 = DMFErrorWithCodeAndUserInfo();
          ((void (**)(id, void *, void *))v5)[2](v5, 0, v10);
        }
      }
      else
      {
        id v9 = DMFErrorWithCodeAndUserInfo();
        ((void (**)(id, void *, void *))v5)[2](v5, 0, v9);
      }
    }
    else
    {
      id v8 = DMFErrorWithCodeAndUserInfo();
      ((void (**)(id, void *, void *))v5)[2](v5, 0, v8);
    }
  }
  else
  {
    id v7 = DMFErrorWithCodeAndUserInfo();
    ((void (**)(id, void *, void *))v5)[2](v5, 0, v7);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableDictionary)manifest
{
  return self->_manifest;
}

- (DMFOSStateHandler)stateHandler
{
  return self->_stateHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateHandler, 0);
  objc_storeStrong((id *)&self->_manifest, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end