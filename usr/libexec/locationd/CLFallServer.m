@interface CLFallServer
- (BOOL)_shouldLogValueForKey:(id)a3;
- (BOOL)dataCollectionEnabled;
- (BOOL)sendData:(id)a3 metaData:(id)a4 start:(id)a5 end:(id)a6;
- (id).cxx_construct;
- (id)_createKeyValuePairsDict:(id)a3 metaData:(id)a4;
- (id)_encryptData:(id)a3 metaData:(id)a4 start:(id)a5 end:(id)a6;
- (id)_initializeValueForKey:(id)a3 withDefault:(id)a4;
- (id)_loadSubjectAuth;
- (id)_loadSubjectUUID;
- (id)getUUID;
- (id)initInUniverse:(id)a3;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7;
- (void)_enableDataCollection;
- (void)_registerDevice;
- (void)_saveSubjectAuth:(id)a3;
- (void)_saveSubjectUUID:(id)a3;
- (void)cleanUp:(double)a3;
- (void)clearUUID;
- (void)dealloc;
- (void)onDataProtectionManagerNotification:(int)a3 data:(uint64_t)a4;
@end

@implementation CLFallServer

- (id)getUUID
{
  if (self->_subjectUUID)
  {
    subjectUUID = self->_subjectUUID;
    return [(NSUUID *)subjectUUID copy];
  }
  else
  {
    id v4 = [(CLFallServer *)self _loadSubjectUUID];
    return v4;
  }
}

- (void)clearUUID
{
}

- (id)initInUniverse:(id)a3
{
  v23.receiver = self;
  v23.super_class = (Class)CLFallServer;
  id v4 = [(CLFallServer *)&v23 init];
  if (v4)
  {
    if (qword_1024190F0 != -1) {
      dispatch_once(&qword_1024190F0, &stru_10232B708);
    }
    v5 = qword_1024190F8;
    if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Initializing CLFallServer instance", (uint8_t *)buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024190F0 != -1) {
        dispatch_once(&qword_1024190F0, &stru_10232B708);
      }
      LOWORD(v24) = 0;
      v18 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLFallServer initInUniverse:]", "%s\n", v18);
      if (v18 != (char *)buf) {
        free(v18);
      }
    }
    v6 = (CLIntersiloUniverse *)a3;
    v4->_universe = v6;
    v4->_registrationTimer = (CLTimer *)[[-[CLIntersiloUniverse silo](v6, "silo") newTimer];
    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v4->_registrationTimerFireInterval = 3600;
    p_registrationTimerFireInterval = &v4->_registrationTimerFireInterval;
    v4->_responses = v7;
    uint64_t v9 = sub_1000D3E78();
    sub_10006B564(v9, buf);
    int v10 = sub_10013E418(*(uint64_t *)&buf[0], @"ServerRegistrationTimerFireInterval", &v4->_registrationTimerFireInterval);
    if (*((void *)&buf[0] + 1)) {
      sub_1000DB0A0(*((std::__shared_weak_count **)&buf[0] + 1));
    }
    if (v10)
    {
      if (qword_1024190F0 != -1) {
        dispatch_once(&qword_1024190F0, &stru_10232B708);
      }
      v11 = qword_1024190F8;
      if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_INFO))
      {
        int v12 = *p_registrationTimerFireInterval;
        LODWORD(buf[0]) = 67109120;
        DWORD1(buf[0]) = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Overriding registration timer fire interval: %d", (uint8_t *)buf, 8u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024190F0 != -1) {
          dispatch_once(&qword_1024190F0, &stru_10232B708);
        }
        int v19 = *p_registrationTimerFireInterval;
        int v24 = 67109120;
        LODWORD(v25) = v19;
        v20 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLFallServer initInUniverse:]", "%s\n", v20);
        if (v20 != (char *)buf) {
          free(v20);
        }
      }
    }
    v4->_logDirectory = (NSString *)[(CLFallServer *)v4 _initializeValueForKey:@"ServerLogDirectory" withDefault:@"/var/mobile/Library/locationd/Server"];
    v4->_host = (NSString *)[(CLFallServer *)v4 _initializeValueForKey:@"ServerHost" withDefault:@"https://ingest.apple-studies.com:8443"];
    v4->_registrationEndpoint = (NSString *)[(CLFallServer *)v4 _initializeValueForKey:@"ServerRegistrationEndpoint" withDefault:@"/ingest/v2/register"];
    v4->_submissionEndpoint = (NSString *)[(CLFallServer *)v4 _initializeValueForKey:@"ServerSubmissionEndpoint" withDefault:@"/ingest/v2/submit"];
    v4->_studyID = (NSString *)[(CLFallServer *)v4 _initializeValueForKey:@"ServerStudyID" withDefault:@"cf28ffed-271e-416f-9aff-f69bd999885a"];
    v4->_authorization = (NSString *)[(CLFallServer *)v4 _initializeValueForKey:@"ServerAuthorization" withDefault:@"RygmpPxtPG5B04FlpFT23YWMnqDhouPM0XANlLy3S3Asl5U6X7hu5eoJTl2CZFeK"];
    v4->_certificate = (NSString *)[(CLFallServer *)v4 _initializeValueForKey:@"ServerCertificate" withDefault:@"MIIDjTCCAnWgAwIBAgIEFN2TTjANBgkqhkiG9w0BAQsFADB3MQswCQYDVQQGEwJVUzELMAkGA1UECBMCQ0ExEjAQBgNVBAcTCUN1cGVydGlubzEXMBUGA1UEChMOQXBwbGUgSW50ZXJuYWwxDzANBgNVBAsTBkhlYWx0aDEdMBsGA1UEAxMUY29tLmFwcGxlLkhlYWx0aERhdGEwHhcNMTcwNDE4MTgzODI4WhcNMTgwNDE4MTgzODI4WjB3MQswCQYDVQQGEwJVUzELMAkGA1UECBMCQ0ExEjAQBgNVBAcTCUN1cGVydGlubzEXMBUGA1UEChMOQXBwbGUgSW50ZXJuYWwxDzANBgNVBAsTBkhlYWx0aDEdMBsGA1UEAxMUY29tLmFwcGxlLkhlYWx0aERhdGEwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDvR2JtAkPdG/BldPRT7EupiMo4ZvLOzztoDeul2awbM9fBU8kc3nlapOi2vooX62cyPJKsqCas465gy4U3JJBMVg/MjshfUIDBb1LQzGtvfYkirdpWOqJ7riQ0Wbe6LLRFD0963JNF1lyMHkf7OqZegIh8c+xGGgd2ynkdivaKOr2d7Qf67y2UarQc+qIgkljsaOugfBr3jsUcO0tE0j9LGOvTZZEZd3ykXUEChIkwGW+QWWd3Indit4ArSMGDjkrltGX88FBWgbPYe8dgjWcE2GkEEWhJFwIiTCHQZFHlizSzY5vyG0mcbgdl/HjbyswUn3kw8CvmSOuzi7YNolypAgMBAAGjITAfMB0GA1UdDgQWBBRaESD5M6MGBsOr4aMdm42SVZwycDANBgkqhkiG9w0BAQsFAAOCAQEAVg1mV0Zf9/o+cAbwvcQgdGIbeUghVdDybkVkeew/3dpdRN/S9k9BTusNL4gNKbRRIjJiESq68rP++8BP7xhIO3EsICFAo/fp87af1EncYIjwh9V6P77V+wnvU8Ehgj9tGj5GhU/o1tmCLmBsJi+uUz8vd7p8S/CbH0wUpe0uov4d79R1DGYrM+fansMd9JnmZfLeGU1sx2q+hEfAZyuSRJEf4+GbgEuthq0aBNC6VeXVmmNqd36at3F9O4DzJiJOZiEHXNYOXiyJYSBEvgKdd23G9tR1Pdqw//0sKv/C4b3FQWowN7uZzJ3SJTrolzpUGlTSy5PPeXsmsL7TKM27uA=="];
    id v13 = objc_alloc((Class)NSURL);
    long long v27 = *(_OWORD *)&v4->_host;
    studyID = v4->_studyID;
    v4->_registerURL = (NSURL *)[v13 initWithString:+[NSString pathWithComponents:](NSString, "pathWithComponents:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 3))];
    id v14 = objc_alloc((Class)NSURL);
    submissionEndpoint = v4->_submissionEndpoint;
    v26[0] = v4->_host;
    v26[1] = submissionEndpoint;
    v4->_ingestURL = (NSURL *)[v14 initWithString:[NSString pathWithComponents:+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 2)]];
    v4->_studyUUID = (NSUUID *)[objc_alloc((Class)NSUUID) initWithUUIDString:v4->_studyID];
    if ([+[NSFileManager defaultManager](NSFileManager, "defaultManager") fileExistsAtPath:v4->_logDirectory]|| (uint64_t v22 = 0, [+[NSFileManager defaultManager] createDirectoryAtPath:v4->_logDirectory withIntermediateDirectories:1 attributes:0 error:&v22], !v22))
    {
      sub_100EB2E6C();
    }
    if (qword_1024190F0 != -1) {
      dispatch_once(&qword_1024190F0, &stru_10232B708);
    }
    v16 = qword_1024190F8;
    if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf[0]) = 138412290;
      *(void *)((char *)buf + 4) = v22;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Unable to create log directory, error: %@", (uint8_t *)buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024190F0 != -1) {
        dispatch_once(&qword_1024190F0, &stru_10232B708);
      }
      int v24 = 138412290;
      uint64_t v25 = v22;
      v21 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLFallServer initInUniverse:]", "%s\n", v21);
      if (v21 != (char *)buf) {
        free(v21);
      }
    }
    return 0;
  }
  return v4;
}

- (void)dealloc
{
  if (qword_1024190F0 != -1) {
    dispatch_once(&qword_1024190F0, &stru_10232B708);
  }
  v3 = qword_1024190F8;
  if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Tearing down CLFallServer instance", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024190F0 != -1) {
      dispatch_once(&qword_1024190F0, &stru_10232B708);
    }
    __int16 v6 = 0;
    id v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLFallServer dealloc]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }

  self->_universe = 0;
  self->_urlSession = 0;

  self->_registrationTimer = 0;
  self->_registerURL = 0;

  self->_ingestURL = 0;
  self->_studyUUID = 0;

  self->_subjectUUID = 0;
  self->_subjectAuth = 0;

  self->_hcConfig = 0;
  self->_responses = 0;

  self->_logDirectory = 0;
  self->_host = 0;

  self->_registrationEndpoint = 0;
  self->_submissionEndpoint = 0;

  self->_studyID = 0;
  self->_authorization = 0;

  self->_certificate = 0;
  v5.receiver = self;
  v5.super_class = (Class)CLFallServer;
  [(CLFallServer *)&v5 dealloc];
}

- (BOOL)_shouldLogValueForKey:(id)a3
{
  uint64_t v4 = 0;
  do
  {
    BOOL result = [a3 isEqualToString:off_10232B6C0[v4]];
    if (result) {
      break;
    }
  }
  while (v4++ != 3);
  return result;
}

- (id)_initializeValueForKey:(id)a3 withDefault:(id)a4
{
  id result = 0;
  if (!a3) {
    return result;
  }
  __int16 v6 = (NSString *)a4;
  if (!a4) {
    return result;
  }
  memset(&__p, 0, sizeof(__p));
  uint64_t v8 = sub_1000D3E78();
  sub_10006B564(v8, buf);
  BOOL v9 = sub_1000A7CF8(*(uint64_t *)buf, (uint64_t)a3, &__p);
  if (*(void *)&buf[8]) {
    sub_1000DB0A0(*(std::__shared_weak_count **)&buf[8]);
  }
  if (v9)
  {
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      if (!__p.__r_.__value_.__l.__size_) {
        goto LABEL_25;
      }
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    else
    {
      if (!*((unsigned char *)&__p.__r_.__value_.__s + 23)) {
        goto LABEL_25;
      }
      p_p = &__p;
    }
    __int16 v6 = +[NSString stringWithUTF8String:p_p];
    if ([(CLFallServer *)self _shouldLogValueForKey:a3])
    {
      if (qword_1024190F0 != -1) {
        dispatch_once(&qword_1024190F0, &stru_10232B708);
      }
      v11 = qword_1024190F8;
      if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = a3;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v6;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Overriding %{public}@ to: %{public}@", buf, 0x16u);
      }
      if (!sub_10013D1A0(115, 2)) {
        goto LABEL_25;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1024190F0 != -1) {
        dispatch_once(&qword_1024190F0, &stru_10232B708);
      }
      int v15 = 138543618;
      id v16 = a3;
      __int16 v17 = 2114;
      v18 = v6;
      int v12 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLFallServer _initializeValueForKey:withDefault:]", "%s\n", v12);
    }
    else
    {
      if (qword_1024190F0 != -1) {
        dispatch_once(&qword_1024190F0, &stru_10232B708);
      }
      id v13 = qword_1024190F8;
      if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = a3;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Overriding %{public}@", buf, 0xCu);
      }
      if (!sub_10013D1A0(115, 2)) {
        goto LABEL_25;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1024190F0 != -1) {
        dispatch_once(&qword_1024190F0, &stru_10232B708);
      }
      int v15 = 138543362;
      id v16 = a3;
      int v12 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLFallServer _initializeValueForKey:withDefault:]", "%s\n", v12);
    }
    if (v12 != buf) {
      free(v12);
    }
  }
LABEL_25:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v6;
}

- (void)_registerDevice
{
  [(CLIntersiloUniverse *)self->_universe silo];
  if (qword_1024190F0 != -1) {
    dispatch_once(&qword_1024190F0, &stru_10232B708);
  }
  v3 = qword_1024190F8;
  if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Attempting to register device...", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024190F0 != -1) {
      dispatch_once(&qword_1024190F0, &stru_10232B708);
    }
    __int16 v7 = 0;
    objc_super v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLFallServer _registerDevice]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  uint64_t v4 = +[NSMutableURLRequest requestWithURL:self->_registerURL];
  [(NSMutableURLRequest *)v4 setAllowsCellularAccess:1];
  [(NSMutableURLRequest *)v4 setHTTPMethod:@"POST"];
  [(NSMutableURLRequest *)v4 setValue:self->_authorization forHTTPHeaderField:@"Authorization"];
  [(NSMutableURLRequest *)v4 setValue:@"application/octet-stream" forHTTPHeaderField:@"Content-Type"];
  [(NSMutableURLRequest *)v4 setValue:@"application/json" forHTTPHeaderField:@"Accept"];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1014FE3A0;
  v6[3] = &unk_10232B6E8;
  v6[4] = self;
  [(NSURLSessionDataTask *)[+[NSURLSession sharedSession] dataTaskWithRequest:v4 completionHandler:v6] resume];
}

- (id)_loadSubjectUUID
{
  CFTypeRef v5 = 0;
  uint64_t v2 = sub_1000A6958();
  int v3 = sub_1004D01D8(v2, @"HCSubjectUUID", &v5);
  id result = 0;
  if (v3) {
    return [objc_alloc((Class)NSUUID) initWithUUIDString:v5];
  }
  return result;
}

- (id)_loadSubjectAuth
{
  uint64_t v2 = [[CLKeychainItemWrapper alloc] initWithIdentifier:@"HCSubjectAuth" keyType:kSecAttrAccount];
  id v3 = [(CLKeychainItemWrapper *)v2 objectForKey:kSecValueData];

  if ([v3 length])
  {
    return v3;
  }
  else
  {

    return 0;
  }
}

- (void)_saveSubjectUUID:(id)a3
{
  uint64_t v4 = sub_1000A6958();
  [a3 UUIDString];
  sub_1004D258C(v4);
  CFTypeRef v5 = *(void (**)(void))(*(void *)sub_1000A6958() + 944);

  v5();
}

- (void)_saveSubjectAuth:(id)a3
{
  uint64_t v4 = [[CLKeychainItemWrapper alloc] initWithIdentifier:@"HCSubjectAuth" keyType:kSecAttrAccount];
  [(CLKeychainItemWrapper *)v4 setObject:&__kCFBooleanTrue forKey:kSecAttrIsInvisible];
  [(CLKeychainItemWrapper *)v4 setObject:kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly forKey:kSecAttrAccessible];
  [(CLKeychainItemWrapper *)v4 setObject:a3 forKey:kSecValueData];
}

- (void)_enableDataCollection
{
  [(CLIntersiloUniverse *)self->_universe silo];
  if (qword_1024190F0 != -1) {
    dispatch_once(&qword_1024190F0, &stru_10232B708);
  }
  id v3 = qword_1024190F8;
  if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Enabling data collection", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024190F0 != -1) {
      dispatch_once(&qword_1024190F0, &stru_10232B708);
    }
    int v15 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLFallServer _enableDataCollection]", "%s\n", v15);
    if (v15 != buf) {
      free(v15);
    }
  }
  if (objc_opt_class())
  {
    uint64_t v4 = HKHealthWrapCertificateFromString();
    if (v4)
    {

      id v5 = objc_alloc((Class)HKHealthWrapMessageConfiguration);
      studyUUID = self->_studyUUID;
      subjectUUID = self->_subjectUUID;
      sub_100103240();
      sub_10073ADA8((uint64_t)buf);
      if (v19 >= 0) {
        uint64_t v8 = buf;
      }
      else {
        uint64_t v8 = *(unsigned char **)buf;
      }
      self->_hcConfig = (HKHealthWrapMessageConfiguration *)[v5 initWithSubjectUUID:subjectUUID studyUUID:studyUUID channel:[NSString stringWithUTF8String:v8] payloadType:@"newtongm" certificate:v4];
      if (v19 < 0) {
        operator delete(*(void **)buf);
      }
      id v9 = [[-[CLIntersiloUniverse silo](self->_universe, "silo") operationQueue];
      int v10 = +[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"com.apple.locationd.CLFallServer"];
      [(NSURLSessionConfiguration *)v10 setAllowsCellularAccess:0];

      v11 = +[NSURLSession sessionWithConfiguration:v10 delegate:self delegateQueue:v9];
      self->_urlSession = v11;
      if (v11)
      {
        if (qword_1024190F0 != -1) {
          dispatch_once(&qword_1024190F0, &stru_10232B708);
        }
        int v12 = qword_1024190F8;
        if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Data collection enabled", buf, 2u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024190F0 != -1) {
            dispatch_once(&qword_1024190F0, &stru_10232B708);
          }
          id v16 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLFallServer _enableDataCollection]", "%s\n", v16);
          if (v16 != buf) {
            free(v16);
          }
        }
        self->_dataCollectionEnabled = 1;
        [(CLTimer *)self->_registrationTimer invalidate];
      }
    }
    else
    {
      if (qword_1024190F0 != -1) {
        dispatch_once(&qword_1024190F0, &stru_10232B708);
      }
      id v13 = qword_1024190F8;
      if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_FAULT))
      {
        certificate = self->_certificate;
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = certificate;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "NULL certificate for %{public}@", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024190F0 != -1) {
          dispatch_once(&qword_1024190F0, &stru_10232B708);
        }
        __int16 v17 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLFallServer _enableDataCollection]", "%s\n", v17);
        if (v17 != buf) {
          free(v17);
        }
      }
    }
  }
}

- (BOOL)sendData:(id)a3 metaData:(id)a4 start:(id)a5 end:(id)a6
{
  if (self->_dataCollectionEnabled)
  {
    if (qword_1024190F0 != -1) {
      dispatch_once(&qword_1024190F0, &stru_10232B708);
    }
    v11 = qword_1024190F8;
    if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Attempting to send data...", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024190F0 != -1) {
        dispatch_once(&qword_1024190F0, &stru_10232B708);
      }
      uint64_t v22 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLFallServer sendData:metaData:start:end:]", "%s\n", v22);
      if (v22 != (char *)buf) {
        free(v22);
      }
    }
    id v12 = [(CLFallServer *)self _encryptData:a3 metaData:a4 start:a5 end:a6];
    if (v12)
    {
      id v13 = v12;
      id v14 = +[NSMutableURLRequest requestWithURL:self->_ingestURL];
      [(NSMutableURLRequest *)v14 setHTTPMethod:@"POST"];
      [(NSMutableURLRequest *)v14 setValue:self->_authorization forHTTPHeaderField:@"Authorization"];
      [(NSMutableURLRequest *)v14 setValue:@"application/octet-stream" forHTTPHeaderField:@"Content-Type"];
      [(NSMutableURLRequest *)v14 setValue:@"application/json" forHTTPHeaderField:@"Accept"];
      [(NSMutableURLRequest *)v14 setValue:self->_subjectAuth forHTTPHeaderField:@"X-HDS-Subject-Authorization"];
      int v15 = [(NSURLSession *)self->_urlSession uploadTaskWithRequest:v14 fromFile:v13];
      -[NSURLSessionUploadTask setTaskDescription:](v15, "setTaskDescription:", [v13 path]);
      [(NSURLSessionUploadTask *)v15 resume];
      if (qword_1024190F0 != -1) {
        dispatch_once(&qword_1024190F0, &stru_10232B708);
      }
      id v16 = qword_1024190F8;
      if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_INFO))
      {
        id v17 = [v13 path];
        ingestURL = self->_ingestURL;
        *(_DWORD *)buf = 138412802;
        id v25 = v17;
        __int16 v26 = 2112;
        long long v27 = v15;
        __int16 v28 = 2112;
        v29 = ingestURL;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Created request for file: %@, task: %@, ingest URL: %@", buf, 0x20u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024190F0 != -1) {
          dispatch_once(&qword_1024190F0, &stru_10232B708);
        }
        [v13 path];
LABEL_28:
        objc_super v23 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLFallServer sendData:metaData:start:end:]", "%s\n", v23);
        if (v23 != (char *)buf) {
          free(v23);
        }
      }
    }
  }
  else
  {
    if (qword_1024190F0 != -1) {
      dispatch_once(&qword_1024190F0, &stru_10232B708);
    }
    char v19 = qword_1024190F8;
    if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_DEBUG))
    {
      BOOL dataCollectionEnabled = self->_dataCollectionEnabled;
      *(_DWORD *)buf = 67109120;
      LODWORD(v25) = dataCollectionEnabled;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Data not sent, IsDataCollectionEnabled: %d", buf, 8u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024190F0 != -1) {
        dispatch_once(&qword_1024190F0, &stru_10232B708);
      }
      goto LABEL_28;
    }
  }
  return self->_dataCollectionEnabled;
}

- (void)cleanUp:(double)a3
{
  if (qword_1024190F0 != -1) {
    dispatch_once(&qword_1024190F0, &stru_10232B708);
  }
  id v5 = qword_1024190F8;
  if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v28 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Cleaning up Server files older than %f(s)", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024190F0 != -1) {
      dispatch_once(&qword_1024190F0, &stru_10232B708);
    }
    int v25 = 134217984;
    double v26 = a3;
    id v17 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLFallServer cleanUp:]", "%s\n", v17);
    if (v17 != (char *)buf) {
      free(v17);
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  __int16 v6 = [+[NSFileManager defaultManager] contentsOfDirectoryAtPath:self->_logDirectory error:0];
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    int v9 = 0;
    uint64_t v10 = *(void *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = [(NSString *)self->_logDirectory stringByAppendingPathComponent:*(void *)(*((void *)&v20 + 1) + 8 * (void)v11)];
        if (a3 <= 0.0
          || (objc_msgSend(-[NSDictionary objectForKey:](-[NSFileManager attributesOfItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "attributesOfItemAtPath:error:", v12, 0), "objectForKey:", NSFileCreationDate), "timeIntervalSinceNow"), fabs(v13) >= a3))
        {
          double v19 = 0.0;
          [+[NSFileManager defaultManager] removeItemAtPath:v12 error:&v19];
          if (v19 == 0.0)
          {
            ++v9;
          }
          else
          {
            if (qword_1024190F0 != -1) {
              dispatch_once(&qword_1024190F0, &stru_10232B708);
            }
            id v14 = qword_1024190F8;
            if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              double v28 = v19;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Error removing data file, error: %@", buf, 0xCu);
            }
            if (sub_10013D1A0(115, 0))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1024190F0 != -1) {
                dispatch_once(&qword_1024190F0, &stru_10232B708);
              }
              int v25 = 138412290;
              double v26 = v19;
              int v15 = (char *)_os_log_send_and_compose_impl();
              sub_1004BA5E4("Generic", 1, 0, 0, "-[CLFallServer cleanUp:]", "%s\n", v15);
              if (v15 != (char *)buf) {
                free(v15);
              }
            }
          }
        }
        v11 = (char *)v11 + 1;
      }
      while (v8 != v11);
      id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }
  else
  {
    int v9 = 0;
  }
  if (qword_1024190F0 != -1) {
    dispatch_once(&qword_1024190F0, &stru_10232B708);
  }
  id v16 = qword_1024190F8;
  if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v28) = v9;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Removed %d Server files", buf, 8u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024190F0 != -1) {
      dispatch_once(&qword_1024190F0, &stru_10232B708);
    }
    int v25 = 67109120;
    LODWORD(v26) = v9;
    v18 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLFallServer cleanUp:]", "%s\n", v18);
    if (v18 != (char *)buf) {
      free(v18);
    }
  }
}

- (id)_encryptData:(id)a3 metaData:(id)a4 start:(id)a5 end:(id)a6
{
  id v11 = [[objc_msgSend(a3, "allKeys") sortedArrayUsingSelector:@"caseInsensitiveCompare:"];
  [a6 timeIntervalSinceReferenceDate];
  uint64_t v13 = (int)v12;
  [a5 timeIntervalSinceReferenceDate];
  int v15 = +[NSString stringWithFormat:@"%d_%d_newtongm.dat", v13, (int)v14];
  [(HKHealthWrapMessageConfiguration *)self->_hcConfig setStartDate:a5];
  [(HKHealthWrapMessageConfiguration *)self->_hcConfig setEndDate:a6];
  [(HKHealthWrapMessageConfiguration *)self->_hcConfig setKeyValuePairs:[(CLFallServer *)self _createKeyValuePairsDict:v11 metaData:a4]];
  [(HKHealthWrapMessageConfiguration *)self->_hcConfig setPayloadIdentifier:v15];
  id v16 = [objc_alloc((Class)HKHealthWrapMessage) initWithConfiguration:self->_hcConfig];
  v36 = 0;
  if (([v16 startWithError:&v36] & 1) == 0)
  {
    if (qword_1024190F0 != -1) {
      dispatch_once(&qword_1024190F0, &stru_10232B708);
    }
    double v26 = qword_1024190F8;
    if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v36;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Error starting Server message, error: %@", buf, 0xCu);
    }
    if (!sub_10013D1A0(115, 0)) {
      goto LABEL_34;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1024190F0 != -1) {
      dispatch_once(&qword_1024190F0, &stru_10232B708);
    }
    int v38 = 138412290;
    v39 = v36;
    goto LABEL_55;
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v17 = [v11 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v33;
LABEL_4:
    uint64_t v20 = 0;
    while (1)
    {
      if (*(void *)v33 != v19) {
        objc_enumerationMutation(v11);
      }
      if ([[v16 appendData:[a3 objectForKeyedSubscript:v32] error:&v36] & 1] == 0)break; {
      if (v18 == (id)++v20)
      }
      {
        id v18 = [v11 countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v18) {
          goto LABEL_4;
        }
        goto LABEL_10;
      }
    }
    if (qword_1024190F0 != -1) {
      dispatch_once(&qword_1024190F0, &stru_10232B708);
    }
    long long v27 = qword_1024190F8;
    if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v36;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Error appending data to Server message, error: %@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024190F0 != -1) {
        dispatch_once(&qword_1024190F0, &stru_10232B708);
      }
      int v38 = 138412290;
      v39 = v36;
      goto LABEL_55;
    }
    goto LABEL_34;
  }
LABEL_10:
  id v21 = [v16 finalizeWithError:&v36];
  if (!v21)
  {
    if (qword_1024190F0 != -1) {
      dispatch_once(&qword_1024190F0, &stru_10232B708);
    }
    v29 = qword_1024190F8;
    if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v36;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Error finalizing Server message, error: %@", buf, 0xCu);
    }
    if (!sub_10013D1A0(115, 0)) {
      goto LABEL_34;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1024190F0 != -1) {
      dispatch_once(&qword_1024190F0, &stru_10232B708);
    }
    int v38 = 138412290;
    v39 = v36;
    goto LABEL_55;
  }
  long long v22 = v21;
  long long v23 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", -[NSString stringByAppendingPathComponent:](self->_logDirectory, "stringByAppendingPathComponent:", [v21 lastPathComponent]));
  if (!-[NSFileManager moveItemAtPath:toPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "moveItemAtPath:toPath:error:", [v22 path], -[NSURL path](v23, "path"), &v36))
  {
    if (qword_1024190F0 != -1) {
      dispatch_once(&qword_1024190F0, &stru_10232B708);
    }
    v30 = qword_1024190F8;
    if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v36;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Unable to move Server message along side url, error: %@", buf, 0xCu);
    }
    if (!sub_10013D1A0(115, 0)) {
      goto LABEL_34;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1024190F0 != -1) {
      dispatch_once(&qword_1024190F0, &stru_10232B708);
    }
    int v38 = 138412290;
    v39 = v36;
LABEL_55:
    v31 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLFallServer _encryptData:metaData:start:end:]", "%s\n", v31);
    if (v31 != (char *)buf) {
      free(v31);
    }
LABEL_34:
    [v16 reset];

    return 0;
  }
  [v16 reset];

  if (qword_1024190F0 != -1) {
    dispatch_once(&qword_1024190F0, &stru_10232B708);
  }
  int v24 = qword_1024190F8;
  if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    v41 = v23;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Successfully encrypted and moved out URL: %{private}@", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024190F0 != -1) {
      dispatch_once(&qword_1024190F0, &stru_10232B708);
    }
    int v38 = 138477827;
    v39 = v23;
    int v25 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLFallServer _encryptData:metaData:start:end:]", "%s\n", v25);
    if (v25 != (char *)buf) {
      free(v25);
    }
  }
  return v23;
}

- (id)_createKeyValuePairsDict:(id)a3 metaData:(id)a4
{
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v7 = [a3 countByEnumeratingWithState:&v27 objects:v40 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v28;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(a3);
        }
        [v6 setObject:+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (char *)i + v9), [@"idx-" stringByAppendingString:*((void *)&v27 + 1) + 8 * i] forKey];
      }
      id v8 = [a3 countByEnumeratingWithState:&v27 objects:v40 count:16];
      uint64_t v9 = (v9 + i);
    }
    while (v8);
  }
  if (a4)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v12 = [a4 countByEnumeratingWithState:&v23 objects:v39 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v24;
      do
      {
        int v15 = 0;
        do
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(a4);
          }
          uint64_t v16 = *(void *)(*((void *)&v23 + 1) + 8 * (void)v15);
          id v17 = [a4 objectForKeyedSubscript:v16];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            [v6 setObject:v17 forKey:v16];
          }
          else
          {
            if (qword_1024190F0 != -1) {
              dispatch_once(&qword_1024190F0, &stru_10232B708);
            }
            id v18 = qword_1024190F8;
            if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v36 = v16;
              __int16 v37 = 2112;
              id v38 = v17;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Invalid value type for key: %@, val: %@", buf, 0x16u);
            }
            if (sub_10013D1A0(115, 0))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1024190F0 != -1) {
                dispatch_once(&qword_1024190F0, &stru_10232B708);
              }
              int v31 = 138412546;
              uint64_t v32 = v16;
              __int16 v33 = 2112;
              id v34 = v17;
              uint64_t v19 = (char *)_os_log_send_and_compose_impl();
              sub_1004BA5E4("Generic", 1, 0, 0, "-[CLFallServer _createKeyValuePairsDict:metaData:]", "%s\n", v19);
              if (v19 != (char *)buf) {
                free(v19);
              }
            }
          }
          int v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v20 = [a4 countByEnumeratingWithState:&v23 objects:v39 count:16];
        id v13 = v20;
      }
      while (v20);
    }
  }
  sub_100103240();
  if (sub_10073E30C()) {
    CFStringRef v21 = @"internal";
  }
  else {
    CFStringRef v21 = @"gm";
  }
  [v6 setObject:v21 forKey:@"buildType"];
  return v6;
}

- (void)onDataProtectionManagerNotification:(int)a3 data:(uint64_t)a4
{
  [*(id *)(a1 + 8) silo];
  if (!*(unsigned char *)(a1 + 152) && (!*(void *)(a1 + 40) || !*(void *)(a1 + 32)) && a3 == 1 && !*(unsigned char *)(a1 + 168))
  {
    if (qword_1024190F0 != -1) {
      dispatch_once(&qword_1024190F0, &stru_10232B708);
    }
    id v7 = qword_1024190F8;
    if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v21) = BYTE4(a4) & 1;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Received CLDataProtectionManager notification, deviceUnlockedSinceBoot: %d", buf, 8u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024190F0 != -1) {
        dispatch_once(&qword_1024190F0, &stru_10232B708);
      }
      int v16 = 67109120;
      LODWORD(v17) = BYTE4(a4) & 1;
      id v11 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLFallServer onDataProtectionManagerNotification:data:]", "%s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
    if ((a4 & 0x100000000) != 0)
    {
      *(unsigned char *)(a1 + 152) = 1;
      [*(id *)(*(void *)(a1 + 160) + 16) unregister:*(void *)(*(void *)(a1 + 160) + 8) forNotification:1];
      *(void *)(a1 + 40) = [(id)a1 _loadSubjectAuth];
      *(void *)(a1 + 32) = [(id)a1 _loadSubjectUUID];
      if (qword_1024190F0 != -1) {
        dispatch_once(&qword_1024190F0, &stru_10232B708);
      }
      id v8 = qword_1024190F8;
      if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        uint64_t v10 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138478083;
        uint64_t v21 = v9;
        __int16 v22 = 2113;
        uint64_t v23 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Cached subject credentials, _subjectUUID: %{private}@, _subjectAuth: %{private}@", buf, 0x16u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024190F0 != -1) {
          dispatch_once(&qword_1024190F0, &stru_10232B708);
        }
        uint64_t v12 = *(void *)(a1 + 32);
        uint64_t v13 = *(void *)(a1 + 40);
        int v16 = 138478083;
        uint64_t v17 = v12;
        __int16 v18 = 2113;
        uint64_t v19 = v13;
        uint64_t v14 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLFallServer onDataProtectionManagerNotification:data:]", "%s\n", v14);
        if (v14 != (char *)buf) {
          free(v14);
        }
      }
      if (*(void *)(a1 + 40) && *(void *)(a1 + 32))
      {
        [(id)a1 _enableDataCollection];
      }
      else
      {
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_101500EE4;
        v15[3] = &unk_10229FED8;
        v15[4] = a1;
        [*(id *)(a1 + 48) setHandler:v15];
        [*(id *)(a1 + 48) setNextFireDelay:1.0 interval:(double)*(int *)(a1 + 80)];
      }
    }
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  if (qword_1024190F0 != -1) {
    dispatch_once(&qword_1024190F0, &stru_10232B708);
  }
  uint64_t v10 = qword_1024190F8;
  if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    uint64_t v14 = NSStringFromSelector(a2);
    __int16 v15 = 2112;
    id v16 = a4;
    __int16 v17 = 2048;
    id v18 = [a5 length];
    __int16 v19 = 2112;
    id v20 = [[objc_msgSend(a3, "configuration") identifier];
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Got called back for %@ with task: %@ and data of length: %lu and id: %@", buf, 0x2Au);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024190F0 != -1) {
      dispatch_once(&qword_1024190F0, &stru_10232B708);
    }
    NSStringFromSelector(a2);
    [a5 length];
    [objc_msgSend(a3, "configuration") identifier];
    uint64_t v12 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLFallServer URLSession:dataTask:didReceiveData:]", "%s\n", v12);
    if (v12 != (char *)buf) {
      free(v12);
    }
  }
  id v11 = -[NSMutableDictionary objectForKey:](self->_responses, "objectForKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a4 taskIdentifier]));
  if (!v11)
  {
    id v11 = objc_alloc_init((Class)NSMutableData);
    -[NSMutableDictionary setObject:forKey:](self->_responses, "setObject:forKey:", v11, +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a4 taskIdentifier]));
  }
  [v11 appendData:a5];
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  objc_sync_enter(self);
  if (qword_1024190F0 != -1) {
    dispatch_once(&qword_1024190F0, &stru_10232B708);
  }
  uint64_t v10 = qword_1024190F8;
  if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    *(void *)long long v29 = NSStringFromSelector(a2);
    *(_WORD *)&v29[8] = 2112;
    *(void *)&v29[10] = a4;
    *(_WORD *)&v29[18] = 2112;
    *(void *)&v29[20] = a5;
    __int16 v30 = 2112;
    id v31 = [[[a3 configuration] identifier];
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Got called back for %@ with task: %@ and error: %@ and id: %@", buf, 0x2Au);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024190F0 != -1) {
      dispatch_once(&qword_1024190F0, &stru_10232B708);
    }
    int v24 = 138413058;
    *(void *)long long v25 = NSStringFromSelector(a2);
    *(_WORD *)&v25[8] = 2112;
    *(void *)&v25[10] = a4;
    *(_WORD *)&v25[18] = 2112;
    *(void *)&v25[20] = a5;
    __int16 v26 = 2112;
    id v27 = [objc_msgSend(a3, "configuration") identifier];
    id v20 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLFallServer URLSession:task:didCompleteWithError:]", "%s\n", v20);
    if (v20 != (char *)buf) {
      free(v20);
    }
  }
  id v11 = [a4 taskDescription];
  if ([a4 state] == (id)3 && objc_msgSend(v11, "length"))
  {
    id v12 = -[NSMutableDictionary objectForKey:](self->_responses, "objectForKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a4 taskIdentifier]));
    id v13 = [objc_alloc((Class)NSString) initWithBytesNoCopy:[v12 bytes] length:[v12 length] encoding:4 freeWhenDone:0];
    -[NSMutableDictionary removeObjectForKey:](self->_responses, "removeObjectForKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a4 taskIdentifier]));
    id v14 = [a4 response];
    if (qword_1024190F0 != -1) {
      dispatch_once(&qword_1024190F0, &stru_10232B708);
    }
    __int16 v15 = qword_1024190F8;
    if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_INFO))
    {
      unsigned int v16 = [v14 statusCode];
      *(_DWORD *)buf = 67240706;
      *(_DWORD *)long long v29 = v16;
      *(_WORD *)&v29[4] = 2112;
      *(void *)&v29[6] = v11;
      *(_WORD *)&v29[14] = 2112;
      *(void *)&v29[16] = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "HTTP Response, statusCode: %{public}d, filePath: %@, response: %@", buf, 0x1Cu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024190F0 != -1) {
        dispatch_once(&qword_1024190F0, &stru_10232B708);
      }
      int v24 = 67240706;
      *(_DWORD *)long long v25 = [v14 statusCode];
      *(_WORD *)&v25[4] = 2112;
      *(void *)&v25[6] = v11;
      *(_WORD *)&v25[14] = 2112;
      *(void *)&v25[16] = v13;
      uint64_t v21 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLFallServer URLSession:task:didCompleteWithError:]", "%s\n", v21);
      if (v21 != (char *)buf) {
        free(v21);
      }
    }

    uint64_t v23 = 0;
    unsigned __int8 v17 = [+[NSFileManager defaultManager] removeItemAtPath:v11 error:&v23];
    if (v23) {
      unsigned __int8 v18 = 0;
    }
    else {
      unsigned __int8 v18 = v17;
    }
    if ((v18 & 1) == 0)
    {
      if (qword_1024190F0 != -1) {
        dispatch_once(&qword_1024190F0, &stru_10232B708);
      }
      __int16 v19 = qword_1024190F8;
      if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)long long v29 = v11;
        *(_WORD *)&v29[8] = 2112;
        *(void *)&v29[10] = v23;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Unable to remove file after upload attempt, filePath: %@, error: %@", buf, 0x16u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024190F0 != -1) {
          dispatch_once(&qword_1024190F0, &stru_10232B708);
        }
        int v24 = 138412546;
        *(void *)long long v25 = v11;
        *(_WORD *)&v25[8] = 2112;
        *(void *)&v25[10] = v23;
        __int16 v22 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLFallServer URLSession:task:didCompleteWithError:]", "%s\n", v22);
        if (v22 != (char *)buf) {
          free(v22);
        }
      }
    }
  }
  objc_sync_exit(self);
}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  if (qword_1024190F0 != -1) {
    dispatch_once(&qword_1024190F0, &stru_10232B708);
  }
  id v13 = qword_1024190F8;
  if (os_log_type_enabled((os_log_t)qword_1024190F8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413570;
    unsigned int v16 = NSStringFromSelector(a2);
    __int16 v17 = 2112;
    id v18 = a4;
    __int16 v19 = 2048;
    int64_t v20 = a5;
    __int16 v21 = 2048;
    int64_t v22 = a6;
    __int16 v23 = 2048;
    int64_t v24 = a7;
    __int16 v25 = 2112;
    id v26 = [objc_msgSend(a3, "configuration") identifier];
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Got called back for %@ with task: %@ and bytesSent: %lld and totalBytesSent: %lld and totalBytesExpectedToSend: %lld and id: %@", buf, 0x3Eu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024190F0 != -1) {
      dispatch_once(&qword_1024190F0, &stru_10232B708);
    }
    NSStringFromSelector(a2);
    [objc_msgSend(a3, "configuration") identifier];
    id v14 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLFallServer URLSession:task:didSendBodyData:totalBytesSent:totalBytesExpectedToSend:]", "%s\n", v14);
    if (v14 != (char *)buf) {
      free(v14);
    }
  }
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
}

- (BOOL)dataCollectionEnabled
{
  return self->_dataCollectionEnabled;
}

- (void).cxx_destruct
{
  value = self->_dataProtectionManagerClient.__ptr_.__value_;
  self->_dataProtectionManagerClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void))(*(void *)value + 8))();
  }
}

- (id).cxx_construct
{
  *((void *)self + 20) = 0;
  return self;
}

@end