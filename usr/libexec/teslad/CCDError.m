@interface CCDError
+ (id)_cloudConfigErrorResponses;
+ (id)_errorStringForResponse:(id)a3;
+ (id)badFormatError;
+ (id)cleanNSError:(id)a3;
+ (id)cloudConfigErrorInResponse:(id)a3;
+ (id)deviceAlreadyEnrolledError;
+ (id)deviceNotEnrolledError;
+ (id)deviceNotFoundError;
+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5 errorType:(id)a6;
+ (id)internalErrorWithCode:(int64_t)a3;
+ (id)invalidDeviceError;
+ (id)invalidProfileError;
+ (id)invalidSignatureError;
+ (id)maxRetriesExceededErrorWithUnderlyingError:(id)a3;
+ (id)nonceExpiredError;
+ (id)profileNotActiveError;
+ (id)profileNotFoundError;
+ (id)serverTrustError;
+ (id)serviceBusyError;
+ (id)teslaServiceDownError;
@end

@implementation CCDError

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5 errorType:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  v12 = +[NSMutableDictionary dictionary];
  v13 = v12;
  if (v10)
  {
    [v12 setObject:v10 forKey:NSLocalizedDescriptionKey];
    if (!v11) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v16 = +[NSBundle bundleForClass:objc_opt_class()];
  v17 = [v16 localizedStringForKey:@"Unknown error" value:&stru_10001DAB0 table:0];
  [v13 setObject:v17 forKey:NSLocalizedDescriptionKey];

  if (v11) {
LABEL_3:
  }
    [v13 setObject:v11 forKey:@"CloudConfigurationErrorType"];
LABEL_4:
  v14 = +[NSError errorWithDomain:v9 code:a4 userInfo:v13];

  return v14;
}

+ (id)internalErrorWithCode:(int64_t)a3
{
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"The device failed to request configuration from the cloud." value:&stru_10001DAB0 table:0];
  v7 = [a1 errorWithDomain:@"MCCloudConfigurationErrorDomain" code:a3 description:v6 errorType:@"CloudConfigurationFatalError"];

  return v7;
}

+ (id)badFormatError
{
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"The cloud configuration for this device is invalid." value:&stru_10001DAB0 table:0];
  v5 = [a1 errorWithDomain:@"MCCloudConfigurationErrorDomain" code:34003 description:v4 errorType:@"CloudConfigurationFatalError"];

  return v5;
}

+ (id)maxRetriesExceededErrorWithUnderlyingError:(id)a3
{
  id v4 = a3;
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"The cloud configuration server is unavailable." value:&stru_10001DAB0 table:0];
  v7 = [a1 errorWithDomain:@"MCCloudConfigurationErrorDomain" code:34006 description:v6 errorType:@"CloudConfigurationFatalError"];

  if (v4)
  {
    uint64_t v8 = [v7 userInfo];
    id v9 = (void *)v8;
    if (v8) {
      id v10 = (void *)v8;
    }
    else {
      id v10 = &__NSDictionary0__struct;
    }
    id v11 = +[NSMutableDictionary dictionaryWithDictionary:v10];

    v12 = [a1 cleanNSError:v4];
    [v11 setObject:v12 forKeyedSubscript:NSUnderlyingErrorKey];

    v13 = [v7 domain];
    uint64_t v14 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v13, [v7 code], v11);

    v7 = (void *)v14;
  }

  return v7;
}

+ (id)invalidDeviceError
{
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"The cloud configuration service could not verify the identity of this device." value:&stru_10001DAB0 table:0];
  v5 = [a1 errorWithDomain:@"MCCloudConfigurationErrorDomain" code:33023 description:v4 errorType:@"CloudConfigurationFatalError"];

  return v5;
}

+ (id)teslaServiceDownError
{
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"The cloud configuration server is unavailable or busy." value:&stru_10001DAB0 table:0];
  v5 = [a1 errorWithDomain:@"MCCloudConfigurationErrorDomain" code:34004 description:v4 errorType:@"CloudConfigurationFatalError"];

  return v5;
}

+ (id)serviceBusyError
{
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"The cloud configuration server is busy. Please try again later." value:&stru_10001DAB0 table:0];
  v5 = [a1 errorWithDomain:@"MCCloudConfigurationErrorDomain" code:34005 description:v4 errorType:@"CloudConfigurationFatalError"];

  return v5;
}

+ (id)serverTrustError
{
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"The cloud configuration server could not be verified." value:&stru_10001DAB0 table:0];
  v5 = [a1 errorWithDomain:@"MCCloudConfigurationErrorDomain" code:34008 description:v4 errorType:@"CloudConfigurationFatalError"];

  return v5;
}

+ (id)invalidSignatureError
{
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"Invalid signature." value:&stru_10001DAB0 table:0];
  v5 = [a1 errorWithDomain:@"MCCloudConfigurationErrorDomain" code:33016 description:v4 errorType:@"CloudConfigurationFatalError"];

  return v5;
}

+ (id)invalidProfileError
{
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"Invalid Device Enrollment Program configuration." value:&stru_10001DAB0 table:0];
  v5 = [a1 errorWithDomain:@"MCCloudConfigurationErrorDomain" code:33002 description:v4 errorType:@"CloudConfigurationFatalError"];

  return v5;
}

+ (id)profileNotActiveError
{
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"Device Enrollment Program configuration is not active." value:&stru_10001DAB0 table:0];
  v5 = [a1 errorWithDomain:@"MCCloudConfigurationErrorDomain" code:33017 description:v4 errorType:@"CloudConfigurationFatalError"];

  return v5;
}

+ (id)profileNotFoundError
{
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"Device Enrollment Program configuration can not be found." value:&stru_10001DAB0 table:0];
  v5 = [a1 errorWithDomain:@"MCCloudConfigurationErrorDomain" code:33024 description:v4 errorType:@"CloudConfigurationFatalError"];

  return v5;
}

+ (id)deviceNotFoundError
{
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"Device can not be found." value:&stru_10001DAB0 table:0];
  v5 = [a1 errorWithDomain:@"MCCloudConfigurationErrorDomain" code:33025 description:v4 errorType:@"CloudConfigurationFatalError"];

  return v5;
}

+ (id)deviceAlreadyEnrolledError
{
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"This device is already enrolled in the Device Enrollment Program." value:&stru_10001DAB0 table:0];
  v5 = [a1 errorWithDomain:@"MCCloudConfigurationErrorDomain" code:33018 description:v4 errorType:@"CloudConfigurationFatalError"];

  return v5;
}

+ (id)deviceNotEnrolledError
{
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"This device is not enrolled in the Device Enrollment Program." value:&stru_10001DAB0 table:0];
  v5 = [a1 errorWithDomain:@"MCCloudConfigurationErrorDomain" code:33005 description:v4 errorType:@"CloudConfigurationFatalError"];

  return v5;
}

+ (id)nonceExpiredError
{
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"Nonce expired." value:&stru_10001DAB0 table:0];
  v5 = [a1 errorWithDomain:@"MCCloudConfigurationErrorDomain" code:33014 description:v4 errorType:@"CloudConfigurationFatalError"];

  return v5;
}

+ (id)_errorStringForResponse:(id)a3
{
  id v3 = a3;
  if (v3 && (id v4 = [objc_alloc((Class)NSString) initWithData:v3 encoding:4]) != 0)
  {
    v5 = v4;
    v6 = +[NSCharacterSet whitespaceCharacterSet];
    v7 = [v5 stringByTrimmingCharactersInSet:v6];

    uint64_t v8 = *(NSObject **)(DEPLogObjects() + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Error response for request: %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)cloudConfigErrorInResponse:(id)a3
{
  id v4 = [a1 _errorStringForResponse:a3];
  v5 = [a1 _cloudConfigErrorResponses];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

+ (id)_cloudConfigErrorResponses
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A380;
  block[3] = &unk_10001C658;
  block[4] = a1;
  if (qword_100025620 != -1) {
    dispatch_once(&qword_100025620, block);
  }
  v2 = (void *)qword_100025628;

  return v2;
}

+ (id)cleanNSError:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    id v18 = 0;
    goto LABEL_23;
  }
  v5 = [v3 userInfo];

  if (!v5)
  {
    id v18 = v4;
    goto LABEL_23;
  }
  v6 = +[NSMutableDictionary dictionary];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v7 = [v4 userInfo];
  uint64_t v8 = [v7 allKeys];

  id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v9) {
    goto LABEL_18;
  }
  id v10 = v9;
  uint64_t v11 = *(void *)v22;
  do
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v22 != v11) {
        objc_enumerationMutation(v8);
      }
      v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
      uint64_t v14 = [v4 userInfo];
      v15 = [v14 objectForKeyedSubscript:v13];

      if ([v13 isEqualToString:NSUnderlyingErrorKey])
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_15;
        }
        uint64_t v16 = [a1 cleanNSError:v15];

        v15 = (void *)v16;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_15;
          }
        }
      }
      if (!v15) {
        continue;
      }
      [v6 setObject:v15 forKeyedSubscript:v13];
LABEL_15:
    }
    id v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  }
  while (v10);
LABEL_18:

  if (![v6 count])
  {

    v6 = 0;
  }
  v17 = [v4 domain];
  +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v17, [v4 code], v6);
  id v18 = (id)objc_claimAutoreleasedReturnValue();

LABEL_23:

  return v18;
}

@end