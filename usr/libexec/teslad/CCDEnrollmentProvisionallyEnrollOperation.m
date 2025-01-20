@interface CCDEnrollmentProvisionallyEnrollOperation
- (BOOL)_validateEnrollmentResponse:(id)a3 error:(id *)a4;
- (id)errorForStatusCode:(int64_t)a3 responseData:(id)a4;
- (id)responseWithResponseData:(id)a3 contentType:(id)a4 outError:(id *)a5;
@end

@implementation CCDEnrollmentProvisionallyEnrollOperation

- (id)errorForStatusCode:(int64_t)a3 responseData:(id)a4
{
  id v5 = a4;
  if (a3 == 403 || a3 == 401)
  {
    v6 = +[CCDError cloudConfigErrorInResponse:v5];
    v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = +[CCDError internalErrorWithCode:34000];
    }
    v9 = v8;
  }
  else
  {
    if (a3 == 400) {
      +[CCDError invalidDeviceError];
    }
    else {
    v9 = +[CCDError teslaServiceDownError];
    }
  }

  return v9;
}

- (id)responseWithResponseData:(id)a3 contentType:(id)a4 outError:(id *)a5
{
  id v7 = a3;
  id v8 = *(NSObject **)(DEPLogObjects() + 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = v8;
    id v10 = [objc_alloc((Class)NSString) initWithData:v7 encoding:4];
    *(_DWORD *)buf = 138543362;
    id v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Enrollment Response: %{public}@", buf, 0xCu);
  }
  id v17 = 0;
  v11 = +[NSJSONSerialization JSONObjectWithData:v7 options:1 error:&v17];
  id v12 = v17;
  if (v12)
  {
    v13 = *(NSObject **)(DEPLogObjects() + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Error: %@", buf, 0xCu);
    }
    if (a5)
    {
      +[CCDError badFormatError];
      id v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v14 = 0;
    }
  }
  else
  {
    if ([(CCDEnrollmentProvisionallyEnrollOperation *)self _validateEnrollmentResponse:v11 error:a5])
    {
      v15 = v11;
    }
    else
    {
      v15 = 0;
    }
    id v14 = v15;
  }

  return v14;
}

- (BOOL)_validateEnrollmentResponse:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = *(NSObject **)(DEPLogObjects() + 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Validating enrollment response", v23, 2u);
  }
  id v7 = [v5 objectForKeyedSubscript:@"enrollment_type"];
  id v8 = *(NSObject **)(DEPLogObjects() + 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v9 = @"No enrollment type received";
    if (v7) {
      CFStringRef v9 = v7;
    }
    *(_DWORD *)v23 = 138543362;
    *(void *)&v23[4] = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Enrollment type: %{public}@", v23, 0xCu);
  }
  if (!v7)
  {
    id v12 = *(NSObject **)(DEPLogObjects() + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v23 = 138543362;
      *(void *)&v23[4] = @"enrollment_type";
      v13 = "No enrollment type information. There needs to be a %{public}@ section in the response.";
      id v14 = v12;
      uint32_t v15 = 12;
LABEL_19:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v13, v23, v15);
    }
LABEL_20:
    uint64_t v19 = +[CCDError badFormatError];
    goto LABEL_21;
  }
  if (![(__CFString *)v7 isEqualToString:@"PROVISIONAL_ENROLLMENT"])
  {
    unsigned int v16 = [(__CFString *)v7 isEqualToString:@"REGULAR_ENROLLMENT"];
    id v17 = *(NSObject **)(DEPLogObjects() + 8);
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (v16)
    {
      if (v18)
      {
        *(_WORD *)v23 = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "This device is already enrolled.", v23, 2u);
      }
      uint64_t v19 = +[CCDError deviceAlreadyEnrolledError];
LABEL_21:
      v11 = (void *)v19;
      if (!a4) {
        goto LABEL_29;
      }
      goto LABEL_27;
    }
    if (v18)
    {
      *(_WORD *)v23 = 0;
      v13 = "Enrollment type is not recognized.";
      id v14 = v17;
      uint32_t v15 = 2;
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  id v10 = [v5 objectForKeyedSubscript:@"ce_expiry_ts"];
  if (v10)
  {
    v11 = 0;
  }
  else
  {
    v20 = *(NSObject **)(DEPLogObjects() + 8);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "No expiry date received", v23, 2u);
    }
    v11 = +[CCDError badFormatError];
  }

  if (a4)
  {
LABEL_27:
    if (v11) {
      *a4 = v11;
    }
  }
LABEL_29:
  v21 = *(NSObject **)(DEPLogObjects() + 8);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Enrollment response is validated successfully.", v23, 2u);
  }

  return v11 == 0;
}

@end