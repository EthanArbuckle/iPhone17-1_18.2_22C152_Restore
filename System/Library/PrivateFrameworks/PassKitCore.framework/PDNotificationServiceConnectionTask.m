@interface PDNotificationServiceConnectionTask
+ (BOOL)supportsSecureCoding;
- (BOOL)matchesTask:(id)a3;
- (BOOL)pertainsToNotificationService:(id)a3;
- (PDNotificationService)notificationService;
- (PDNotificationServiceConnectionTask)initWithCoder:(id)a3;
- (PDNotificationServiceConnectionTask)initWithNotificationService:(id)a3;
- (const)backoffLevels;
- (id)bodyDictionary;
- (id)endpointComponents;
- (id)headerFields;
- (id)method;
- (id)queryFields;
- (id)request;
- (int64_t)actionForActiveTask:(id)a3;
- (int64_t)taskType;
- (unint64_t)numberOfBackoffLevels;
- (void)encodeWithCoder:(id)a3;
- (void)setNotificationService:(id)a3;
@end

@implementation PDNotificationServiceConnectionTask

- (PDNotificationServiceConnectionTask)initWithNotificationService:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDNotificationServiceConnectionTask;
  v6 = [(PDNetworkTask *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_notificationService, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDNotificationServiceConnectionTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDNotificationServiceConnectionTask;
  id v5 = [(PDNetworkTask *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"notificationService"];
    notificationService = v5->_notificationService;
    v5->_notificationService = (PDNotificationService *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PDNotificationServiceConnectionTask;
  id v4 = a3;
  [(PDNetworkTask *)&v6 encodeWithCoder:v4];
  id v5 = [(PDNotificationServiceConnectionTask *)self notificationService];
  [v4 encodeObject:v5 forKey:@"notificationService"];
}

- (id)request
{
  v3 = [(PDNotificationServiceConnectionTask *)self notificationService];
  id v4 = [v3 serviceURL];

  if ((id)[(PDNotificationServiceConnectionTask *)self taskType] == (id)1)
  {
    id v5 = [(PDNotificationServiceConnectionTask *)self notificationService];
    uint64_t v6 = [v5 registrationURL];
    v7 = (void *)v6;
    if (v6) {
      v8 = (void *)v6;
    }
    else {
      v8 = v4;
    }
    id v9 = v8;

    id v4 = v9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = +[NSURL URLWithString:v4];

    id v4 = (void *)v10;
  }
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  v11 = [(PDNotificationServiceConnectionTask *)self endpointComponents];
  id v12 = [v11 countByEnumeratingWithState:&v66 objects:v76 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v67;
    do
    {
      v15 = 0;
      v16 = v4;
      do
      {
        if (*(void *)v67 != v14) {
          objc_enumerationMutation(v11);
        }
        v17 = *(void **)(*((void *)&v66 + 1) + 8 * (void)v15);
        v18 = +[NSCharacterSet URLPathAllowedCharacterSet];
        v19 = [v17 stringByAddingPercentEncodingWithAllowedCharacters:v18];
        id v4 = [v16 URLByAppendingPathComponent:v19];

        v15 = (char *)v15 + 1;
        v16 = v4;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v66 objects:v76 count:16];
    }
    while (v13);
  }

  v53 = self;
  v20 = [(PDNotificationServiceConnectionTask *)self queryFields];
  +[NSMutableString string];
  v56 = v55 = v20;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  obj = [v20 allKeys];
  id v21 = [obj countByEnumeratingWithState:&v62 objects:v75 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v63;
    CFStringRef v24 = @"?";
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v63 != v23) {
          objc_enumerationMutation(obj);
        }
        v26 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        v27 = +[NSCharacterSet URLQueryAllowedCharacterSet];
        v28 = [v26 stringByAddingPercentEncodingWithAllowedCharacters:v27];

        v29 = [v55 objectForKey:v26];
        v30 = +[NSCharacterSet URLQueryAllowedCharacterSet];
        v31 = [v29 stringByAddingPercentEncodingWithAllowedCharacters:v30];

        [v56 appendFormat:@"%@%@=%@", v24, v28, v31];
        CFStringRef v24 = @"&";
      }
      id v22 = [obj countByEnumeratingWithState:&v62 objects:v75 count:16];
    }
    while (v22);
  }

  v32 = [v4 absoluteString];
  v33 = [v32 stringByAppendingString:v56];
  uint64_t v34 = +[NSURL URLWithString:v33];

  v35 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    v36 = [(PDNotificationServiceConnectionTask *)v53 method];
    *(_DWORD *)buf = 138412546;
    v72 = v36;
    __int16 v73 = 2112;
    uint64_t v74 = v34;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Generating %@ request with URL <%@>", buf, 0x16u);
  }
  v52 = (void *)v34;
  id v37 = [objc_alloc((Class)NSMutableURLRequest) initWithURL:v34];
  v38 = [(PDNotificationServiceConnectionTask *)v53 method];
  [v37 setHTTPMethod:v38];

  [v37 setHTTPShouldHandleCookies:0];
  [v37 setCachePolicy:1];
  v39 = [(PDNotificationServiceConnectionTask *)v53 headerFields];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  v40 = [v39 allKeys];
  id v41 = [v40 countByEnumeratingWithState:&v58 objects:v70 count:16];
  if (v41)
  {
    id v42 = v41;
    uint64_t v43 = *(void *)v59;
    do
    {
      for (j = 0; j != v42; j = (char *)j + 1)
      {
        if (*(void *)v59 != v43) {
          objc_enumerationMutation(v40);
        }
        v45 = *(void **)(*((void *)&v58 + 1) + 8 * (void)j);
        v46 = [v39 objectForKey:v45];
        [v37 setValue:v46 forHTTPHeaderField:v45];

        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          v47 = [v39 objectForKey:v45];
          *(_DWORD *)buf = 138412546;
          v72 = v45;
          __int16 v73 = 2112;
          uint64_t v74 = (uint64_t)v47;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Request contains header field <%@: %@>", buf, 0x16u);
        }
      }
      id v42 = [v40 countByEnumeratingWithState:&v58 objects:v70 count:16];
    }
    while (v42);
  }

  v48 = [(PDNotificationServiceConnectionTask *)v53 bodyDictionary];
  if (v48)
  {
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v72 = v48;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Request contains body dictionary %@", buf, 0xCu);
    }

    id v57 = 0;
    v49 = +[NSJSONSerialization dataWithJSONObject:v48 options:0 error:&v57];
    id v50 = v57;
    if (!v49) {
      +[NSException raise:NSInternalInconsistencyException, @"Could not create json data for %@: %@", objc_opt_class(), v50 format];
    }
    [v37 setHTTPBody:v49];
    [v37 setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [v37 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  }
  return v37;
}

- (id)method
{
  return 0;
}

- (id)endpointComponents
{
  return 0;
}

- (id)queryFields
{
  return 0;
}

- (id)headerFields
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = +[NSDate date];
  id v5 = PKRFC1123StringForDate();
  [v3 setObject:v5 forKeyedSubscript:@"Date"];

  [v3 setObject:@"1" forKey:@"x-compatibility-version"];
  uint64_t v6 = [(PDNotificationServiceConnectionTask *)self notificationService];
  v7 = [v6 authenticationToken];

  if (v7)
  {
    v8 = +[NSString stringWithFormat:@"AuthenticationToken %@", v7];
    [v3 setObject:v8 forKeyedSubscript:@"Authorization"];
  }
  return v3;
}

- (id)bodyDictionary
{
  return 0;
}

- (const)backoffLevels
{
  return (const $82EDB067EE6F192B39F18594CC8676AD *)&_FasterBackoffLevels;
}

- (unint64_t)numberOfBackoffLevels
{
  return 7;
}

- (int64_t)actionForActiveTask:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(PDNetworkTask *)self actionForInactiveTask:v4];
  LODWORD(self) = [(PDNotificationServiceConnectionTask *)self matchesTask:v4];

  if (self) {
    return 3;
  }
  else {
    return v5;
  }
}

- (BOOL)matchesTask:(id)a3
{
  return sub_100302700(self, a3);
}

- (BOOL)pertainsToNotificationService:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(PDNotificationServiceConnectionTask *)self notificationService];
  unsigned __int8 v6 = [v5 matchesNotificationService:v4];

  return v6;
}

- (PDNotificationService)notificationService
{
  return self->_notificationService;
}

- (void)setNotificationService:(id)a3
{
}

- (int64_t)taskType
{
  return self->_taskType;
}

- (void).cxx_destruct
{
}

@end