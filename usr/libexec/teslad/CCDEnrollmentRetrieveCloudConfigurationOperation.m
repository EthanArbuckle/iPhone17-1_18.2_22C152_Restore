@interface CCDEnrollmentRetrieveCloudConfigurationOperation
- (BOOL)_convertCloudConfigDictionary:(id)a3 toManagedConfiguration:(id *)a4;
- (id)errorForStatusCode:(int64_t)a3 responseData:(id)a4;
- (id)responseWithResponseData:(id)a3 contentType:(id)a4 outError:(id *)a5;
- (void)_setEnrolledDeviceRequirementsIfNeededForCloudConfigurationDictionary:(id)a3;
- (void)_setLockdownCloudConfigAvailableKeyIfNeededWithError:(id)a3;
@end

@implementation CCDEnrollmentRetrieveCloudConfigurationOperation

- (id)errorForStatusCode:(int64_t)a3 responseData:(id)a4
{
  id v6 = a4;
  if (a3 == 401)
  {
    v8 = +[CCDError cloudConfigErrorInResponse:v6];
    v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = +[CCDError internalErrorWithCode:34000];
    }
    v7 = v10;
  }
  else if (a3 == 400)
  {
    v7 = +[CCDError cloudConfigErrorInResponse:v6];
    [(CCDEnrollmentRetrieveCloudConfigurationOperation *)self _setLockdownCloudConfigAvailableKeyIfNeededWithError:v7];
  }
  else
  {
    v7 = +[CCDError teslaServiceDownError];
  }

  return v7;
}

- (id)responseWithResponseData:(id)a3 contentType:(id)a4 outError:(id *)a5
{
  id v8 = a4;
  v9 = +[CCDFeatures depResponseDataFromData:a3];
  id v10 = +[CCDFeatures depResponseContentTypeFromContentType:v8];

  if (![v10 containsString:@"text/plain"])
  {
    v15 = *(NSObject **)(DEPLogObjects() + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v16 = v15;
      id v17 = [objc_alloc((Class)NSString) initWithData:v9 encoding:4];
      *(_DWORD *)buf = 138543362;
      id v30 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Enrollment Response: %{public}@", buf, 0xCu);
    }
    id v28 = 0;
    v18 = +[NSJSONSerialization JSONObjectWithData:v9 options:1 error:&v28];
    id v11 = v28;
    v19 = *(NSObject **)(DEPLogObjects() + 8);
    if (v11)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v11;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Error: %@", buf, 0xCu);
      }
      id v20 = 0;
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Validating cloud configuration", buf, 2u);
      }
      id v27 = 0;
      unsigned __int8 v22 = [(CCDEnrollmentRetrieveCloudConfigurationOperation *)self _convertCloudConfigDictionary:v18 toManagedConfiguration:&v27];
      id v20 = v27;
      if (v22)
      {
        CFPreferencesSetAppValue(@"LockdownCloudConfigurationAvailable", kCFBooleanTrue, @"com.apple.managedconfiguration.notbackedup");
        v23 = *(NSObject **)(DEPLogObjects() + 8);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Wait for preferences to flush its caches", buf, 2u);
        }
        _CFPreferencesFlushCachesForIdentifier();
        v24 = *(NSObject **)(DEPLogObjects() + 8);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Disk is updated with the cloud configuration preference.", buf, 2u);
        }

        id v11 = 0;
        goto LABEL_20;
      }
      v25 = *(NSObject **)(DEPLogObjects() + 8);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Cloud configuration is invalid.", buf, 2u);
      }
    }
    if (a5)
    {
      *a5 = +[CCDError badFormatError];
    }

    goto LABEL_19;
  }
  id v11 = +[CCDError cloudConfigErrorInResponse:v9];
  v12 = *(NSObject **)(DEPLogObjects() + 8);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Got 200 response with error: %@", buf, 0xCu);
  }
  v13 = [v11 domain];
  if (![v13 isEqualToString:@"MCCloudConfigurationErrorDomain"]
    || [v11 code] == (id)33024
    || [v11 code] == (id)33025)
  {

    goto LABEL_8;
  }
  id v26 = [v11 code];

  if (v26 == (id)33017)
  {
LABEL_8:
    v14 = *(NSObject **)(DEPLogObjects() + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Return an empty configuration and ignore the MDM server error: %@ ", buf, 0xCu);
    }
    goto LABEL_19;
  }
  if (!a5)
  {
LABEL_19:
    id v20 = 0;
    goto LABEL_20;
  }
  id v11 = v11;
  id v20 = 0;
  *a5 = v11;
LABEL_20:

  return v20;
}

- (BOOL)_convertCloudConfigDictionary:(id)a3 toManagedConfiguration:(id *)a4
{
  id v6 = a3;
  v7 = +[NSMutableDictionary dictionary];
  BOOL v8 = +[CCDValidation validateCloudConfiguration:v6 withResultDictionary:v7];

  if (v8)
  {
    [(CCDEnrollmentRetrieveCloudConfigurationOperation *)self _setEnrolledDeviceRequirementsIfNeededForCloudConfigurationDictionary:v7];
    if (a4) {
      *a4 = v7;
    }
  }

  return v8;
}

- (void)_setEnrolledDeviceRequirementsIfNeededForCloudConfigurationDictionary:(id)a3
{
  id v3 = a3;
  v4 = *(NSObject **)(DEPLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Enrolled devices require supervision and enrollment should be mandatory. Setting supervision and mandatory keys.", v7, 2u);
  }
  [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"IsSupervised"];
  [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"IsMandatory"];
  v5 = [v3 objectForKeyedSubscript:@"IsMultiUser"];
  unsigned int v6 = [v5 BOOLValue];

  if (v6)
  {
    [v3 removeObjectForKey:@"MAIDHasCredential"];
    [v3 removeObjectForKey:@"MAIDUsername"];
  }
}

- (void)_setLockdownCloudConfigAvailableKeyIfNeededWithError:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v5 = v3;
    BOOL v4 = [v3 code] == (id)33005;
    id v3 = v5;
    if (v4)
    {
      CFPreferencesSetAppValue(@"LockdownCloudConfigurationAvailable", kCFBooleanFalse, @"com.apple.managedconfiguration.notbackedup");
      CFPreferencesAppSynchronize(@"com.apple.managedconfiguration.notbackedup");
      id v3 = v5;
    }
  }
}

@end