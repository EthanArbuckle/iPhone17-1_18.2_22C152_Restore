@interface PDWebServiceConnectionTask
+ (BOOL)supportsSecureCoding;
- (NSString)passTypeIdentifier;
- (PDWebService)webService;
- (PDWebServiceConnectionTask)initWithCoder:(id)a3;
- (PDWebServiceConnectionTask)initWithWebService:(id)a3;
- (id)bodyDictionary;
- (id)endpointComponents;
- (id)headerFields;
- (id)method;
- (id)queryFields;
- (id)request;
- (id)teamIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)reportAuthenticationFailure;
- (void)reportMalformedResponseError:(id)a3;
- (void)reportNSURLConnectionError:(id)a3;
- (void)reportUnexpectedResponseCode:(int64_t)a3;
@end

@implementation PDWebServiceConnectionTask

- (PDWebServiceConnectionTask)initWithWebService:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDWebServiceConnectionTask;
  v6 = [(PDNetworkTask *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_webService, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDWebServiceConnectionTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDWebServiceConnectionTask;
  id v5 = [(PDNetworkTask *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"webService"];
    webService = v5->_webService;
    v5->_webService = (PDWebService *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDWebServiceConnectionTask;
  id v4 = a3;
  [(PDNetworkTask *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_webService, @"webService", v5.receiver, v5.super_class);
}

- (id)request
{
  v3 = [(PDWebServiceConnectionTask *)self webService];
  id v4 = [v3 serviceURL];

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  objc_super v5 = [(PDWebServiceConnectionTask *)self endpointComponents];
  id v6 = [v5 countByEnumeratingWithState:&v61 objects:v71 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v62;
    do
    {
      objc_super v9 = 0;
      v10 = v4;
      do
      {
        if (*(void *)v62 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v61 + 1) + 8 * (void)v9);
        v12 = +[NSCharacterSet URLPathAllowedCharacterSet];
        v13 = [v11 stringByAddingPercentEncodingWithAllowedCharacters:v12];
        id v4 = [v10 URLByAppendingPathComponent:v13];

        objc_super v9 = (char *)v9 + 1;
        v10 = v4;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v61 objects:v71 count:16];
    }
    while (v7);
  }

  v48 = self;
  v14 = [(PDWebServiceConnectionTask *)self queryFields];
  +[NSMutableString string];
  v51 = v50 = v14;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  obj = [v14 allKeys];
  id v15 = [obj countByEnumeratingWithState:&v57 objects:v70 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v58;
    CFStringRef v18 = @"?";
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v58 != v17) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        v21 = +[NSCharacterSet URLQueryAllowedCharacterSet];
        v22 = [v20 stringByAddingPercentEncodingWithAllowedCharacters:v21];

        v23 = [v50 objectForKey:v20];
        v24 = +[NSCharacterSet URLQueryAllowedCharacterSet];
        v25 = [v23 stringByAddingPercentEncodingWithAllowedCharacters:v24];

        [v51 appendFormat:@"%@%@=%@", v18, v22, v25];
        CFStringRef v18 = @"&";
      }
      id v16 = [obj countByEnumeratingWithState:&v57 objects:v70 count:16];
    }
    while (v16);
  }

  v47 = [v4 absoluteString];
  v26 = [v47 stringByAppendingString:v51];
  uint64_t v27 = +[NSURL URLWithString:v26];

  if (PKDeveloperLoggingEnabled() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100516FE4(v48);
  }
  v28 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = [(PDWebServiceConnectionTask *)v48 method];
    *(_DWORD *)buf = 138412546;
    v67 = v29;
    __int16 v68 = 2112;
    uint64_t v69 = v27;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Generating %@ request with URL <%@>", buf, 0x16u);
  }
  v46 = (void *)v27;
  id v30 = [objc_alloc((Class)NSMutableURLRequest) initWithURL:v27];
  v31 = [(PDWebServiceConnectionTask *)v48 method];
  [v30 setHTTPMethod:v31];

  [v30 setHTTPShouldHandleCookies:0];
  [v30 setCachePolicy:1];
  v32 = [(PDWebServiceConnectionTask *)v48 headerFields];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  v33 = [v32 allKeys];
  id v34 = [v33 countByEnumeratingWithState:&v53 objects:v65 count:16];
  if (v34)
  {
    id v35 = v34;
    uint64_t v36 = *(void *)v54;
    do
    {
      for (j = 0; j != v35; j = (char *)j + 1)
      {
        if (*(void *)v54 != v36) {
          objc_enumerationMutation(v33);
        }
        v38 = *(void **)(*((void *)&v53 + 1) + 8 * (void)j);
        v39 = [v32 objectForKey:v38];
        [v30 setValue:v39 forHTTPHeaderField:v38];

        if (PKDeveloperLoggingEnabled()
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          v41 = [v32 objectForKey:v38];
          *(_DWORD *)buf = 138412546;
          v67 = v38;
          __int16 v68 = 2112;
          uint64_t v69 = (uint64_t)v41;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Request contains header field <%@: %@>", buf, 0x16u);
        }
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v40 = [v32 objectForKey:v38];
          *(_DWORD *)buf = 138412546;
          v67 = v38;
          __int16 v68 = 2112;
          uint64_t v69 = (uint64_t)v40;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Request contains header field <%@: %@>", buf, 0x16u);
        }
      }
      id v35 = [v33 countByEnumeratingWithState:&v53 objects:v65 count:16];
    }
    while (v35);
  }

  v42 = [(PDWebServiceConnectionTask *)v48 bodyDictionary];
  if (v42)
  {
    if (PKDeveloperLoggingEnabled() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100516F64((uint64_t)v42);
    }
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v67 = v42;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Request contains body dictionary %@", buf, 0xCu);
    }

    id v52 = 0;
    v43 = +[NSJSONSerialization dataWithJSONObject:v42 options:0 error:&v52];
    id v44 = v52;
    if (!v43) {
      +[NSException raise:NSInternalInconsistencyException, @"Could not create json data for %@: %@", objc_opt_class(), v44 format];
    }
    [v30 setHTTPBody:v43];
    [v30 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  }
  return v30;
}

- (void)reportAuthenticationFailure
{
  PDTaskError(0, self, 0, @"Authentication failure", v2, v3, v4, v5, v7);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(PDNetworkTask *)self reportError:v8];
}

- (void)reportUnexpectedResponseCode:(int64_t)a3
{
  PDTaskError(1, self, 0, @"Unexpected response code %ld", v3, v4, v5, v6, a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(PDNetworkTask *)self reportError:v8];
}

- (void)reportNSURLConnectionError:(id)a3
{
  PDTaskError(2, self, a3, @"Connection error", v3, v4, v5, v6, v8);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [(PDNetworkTask *)self reportError:v9];
}

- (void)reportMalformedResponseError:(id)a3
{
  PDTaskError(3, self, a3, @"Server response was malformed", v3, v4, v5, v6, v8);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [(PDNetworkTask *)self reportError:v9];
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
  return 0;
}

- (id)bodyDictionary
{
  return 0;
}

- (NSString)passTypeIdentifier
{
  uint64_t v2 = [(PDWebServiceConnectionTask *)self webService];
  uint64_t v3 = [v2 passTypeIdentifier];

  return (NSString *)v3;
}

- (id)teamIdentifier
{
  uint64_t v2 = [(PDWebServiceConnectionTask *)self webService];
  uint64_t v3 = [v2 teamIdentifier];

  return v3;
}

- (PDWebService)webService
{
  return self->_webService;
}

- (void).cxx_destruct
{
}

@end