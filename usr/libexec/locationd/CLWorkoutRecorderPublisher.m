@interface CLWorkoutRecorderPublisher
- (BOOL)canPublish;
- (BOOL)isAutoRegistration;
- (CLWorkoutRecorderPublisher)initWithDelegate:(id)a3 settings:(void *)a4;
- (HKHealthWrapMessageConfiguration)healthWrapConfiguration;
- (NSString)subjectToken;
- (NSString)subjectUUID;
- (id)encryptData:(id)a3 metaData:(id)a4 start:(id)a5 end:(id)a6;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)dealloc;
- (void)handleConfigurationResponse:(id)a3 data:(id)a4 url:(id)a5 didCompleteWithError:(id)a6;
- (void)handleIngestResponse:(id)a3 data:(id)a4 url:(id)a5 didCompleteWithError:(id)a6;
- (void)handleRegistrationResponse:(id)a3 data:(id)a4 url:(id)a5 didCompleteWithError:(id)a6;
- (void)publishDataFiles:(id)a3 metadata:(id)a4 startDate:(id)a5 endDate:(id)a6 settings:(void *)a7;
- (void)registerDevice;
- (void)requestConfiguration;
- (void)reregisterDevice;
- (void)sendConfigurationRequest;
- (void)sendRegisterRequest;
- (void)setAutoRegistration:(BOOL)a3;
- (void)setHealthWrapConfiguration:(id)a3;
- (void)setSubjectToken:(id)a3;
- (void)setSubjectUUID:(id)a3;
- (void)setupConfigurationTimer;
- (void)unregisterDevice;
@end

@implementation CLWorkoutRecorderPublisher

- (CLWorkoutRecorderPublisher)initWithDelegate:(id)a3 settings:(void *)a4
{
  v32.receiver = self;
  v32.super_class = (Class)CLWorkoutRecorderPublisher;
  v6 = [(CLWorkoutRecorderPublisher *)&v32 init];
  if (v6)
  {
    if (qword_1024191A0 != -1) {
      dispatch_once(&qword_1024191A0, &stru_10234E090);
    }
    v7 = qword_1024191A8;
    if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Initializing CLWorkoutRecorderPublisher instance", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191A0 != -1) {
        dispatch_once(&qword_1024191A0, &stru_10234E090);
      }
      LOWORD(__p[0]) = 0;
      v23 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher initWithDelegate:settings:]", "%s\n", v23);
      if (v23 != (char *)buf) {
        free(v23);
      }
    }
    v6->_delegate = (CLWorkoutRecorderPublisherDelegate *)a3;
    sub_10006ACBC(buf, "WorkoutRecorderPublisherShowSubjectIDInLogs", byte_10247A3D0, 0);
    v6->_enableWritingRecordingIdentifiersToSysDiagnose = buf[1];
    sub_100134750(v30, "JoyrVmlPfjBQSCHspqiWf3vT2dfmqe2ij97pxMwH46stDDAL0PW5COcu3gGJ40B4");
    sub_101A2A6C0((BOOL *)buf, "WorkoutRecorderPublisherAuthorization", (long long *)v30, 0);
    if (SHIBYTE(v40) < 0)
    {
      sub_1000DC48C(__p, *(void **)&v39[4], *(unint64_t *)&v39[12]);
    }
    else
    {
      *(_OWORD *)__p = *(_OWORD *)&v39[4];
      uint64_t v37 = v40;
    }
    if (v37 >= 0) {
      v8 = __p;
    }
    else {
      v8 = (void **)__p[0];
    }
    v6->_authorization = (NSString *)[+[NSString stringWithUTF8String:v8] copy];
    if (SHIBYTE(v37) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v40) < 0) {
      operator delete(*(void **)&v39[4]);
    }
    if (v31 < 0) {
      operator delete(v30[0]);
    }
    sub_100134750(v30, "MIIDjTCCAnWgAwIBAgIEFN2TTjANBgkqhkiG9w0BAQsFADB3MQswCQYDVQQGEwJVUzELMAkGA1UECBMCQ0ExEjAQBgNVBAcTCUN1cGVydGlubzEXMBUGA1UEChMOQXBwbGUgSW50ZXJuYWwxDzANBgNVBAsTBkhlYWx0aDEdMBsGA1UEAxMUY29tLmFwcGxlLkhlYWx0aERhdGEwHhcNMTcwNDE4MTgzODI4WhcNMTgwNDE4MTgzODI4WjB3MQswCQYDVQQGEwJVUzELMAkGA1UECBMCQ0ExEjAQBgNVBAcTCUN1cGVydGlubzEXMBUGA1UEChMOQXBwbGUgSW50ZXJuYWwxDzANBgNVBAsTBkhlYWx0aDEdMBsGA1UEAxMUY29tLmFwcGxlLkhlYWx0aERhdGEwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDvR2JtAkPdG/BldPRT7EupiMo4ZvLOzztoDeul2awbM9fBU8kc3nlapOi2vooX62cyPJKsqCas465gy4U3JJBMVg/MjshfUIDBb1LQzGtvfYkirdpWOqJ7riQ0Wbe6LLRFD0963JNF1lyMHkf7OqZegIh8c+xGGgd2ynkdivaKOr2d7Qf67y2UarQc+qIgkljsaOugfBr3jsUcO0tE0j9LGOvTZZEZd3ykXUEChIkwGW+QWWd3Indit4ArSMGDjkrltGX88FBWgbPYe8dgjWcE2GkEEWhJFwIiTCHQZFHlizSzY5vyG0mcbgdl/HjbyswUn3kw8CvmSOuzi7YNolypAgMBAAGjITAfMB0GA1UdDgQWBBRaESD5M6MGBsOr4aMdm42SVZwycDANBgkqhkiG9w0BAQsFAAOCAQEAVg1mV0Zf9/o+cAbwvcQgdGIbeUghVdDybkVkeew/3dpdRN/S9k9BTusNL4gNKbRRIjJiESq68rP++8BP7xhIO3EsICFAo/fp87af1EncYIjwh9V6P77V+wnvU8Ehgj9tGj5GhU/o1tmCLmBsJi+uUz8vd7p8S/CbH0wUpe0uov4d79R1DGYrM+fansMd9JnmZfLeGU1sx2q+hEfAZyuSRJEf4+GbgEuthq0aBNC6VeXVmmNqd36at3F9O4DzJiJOZiEHXNYOXiyJYSBEvgKdd23G9tR1Pdqw//0sKv/C4b3FQWowN7uZzJ3SJTrolzpUGlTSy5PPeXsmsL7TKM27uA==");
    sub_101A2A6C0((BOOL *)buf, "WorkoutRecorderPublisherCertificate", (long long *)v30, 0);
    if (SHIBYTE(v40) < 0)
    {
      sub_1000DC48C(__p, *(void **)&v39[4], *(unint64_t *)&v39[12]);
    }
    else
    {
      *(_OWORD *)__p = *(_OWORD *)&v39[4];
      uint64_t v37 = v40;
    }
    if (v37 >= 0) {
      v9 = __p;
    }
    else {
      v9 = (void **)__p[0];
    }
    v6->_certificate = (NSString *)[+[NSString stringWithUTF8String:v9] copy];
    if (SHIBYTE(v37) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v40) < 0) {
      operator delete(*(void **)&v39[4]);
    }
    if (v31 < 0) {
      operator delete(v30[0]);
    }
    id v10 = objc_alloc((Class)NSUUID);
    sub_100134750(v30, "53681040-29d2-4420-988a-adbdf2f02905");
    sub_101A2A6C0((BOOL *)buf, "WorkoutRecorderPublisherStudyUUID", (long long *)v30, 0);
    if (SHIBYTE(v40) < 0)
    {
      sub_1000DC48C(__p, *(void **)&v39[4], *(unint64_t *)&v39[12]);
    }
    else
    {
      *(_OWORD *)__p = *(_OWORD *)&v39[4];
      uint64_t v37 = v40;
    }
    if (v37 >= 0) {
      v11 = __p;
    }
    else {
      v11 = (void **)__p[0];
    }
    v6->_studyUUID = (NSUUID *)[v10 initWithUUIDString:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v11)];
    if (SHIBYTE(v37) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v40) < 0) {
      operator delete(*(void **)&v39[4]);
    }
    if (v31 < 0) {
      operator delete(v30[0]);
    }
    v6->_subjectUUIDKey = (NSString *)[objc_alloc((Class)NSString) initWithFormat:@"%@%@", (*(uint64_t (**)(void))(**(void **)a4 + 24))(), -[NSUUID UUIDString](v6->_studyUUID, "UUIDString")];
    if (qword_1024191A0 != -1) {
      dispatch_once(&qword_1024191A0, &stru_10234E090);
    }
    v12 = qword_1024191A8;
    if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_DEBUG))
    {
      subjectUUIDKey = v6->_subjectUUIDKey;
      *(_DWORD *)buf = 138412290;
      *(void *)v39 = subjectUUIDKey;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Setting subjectID key : %@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191A0 != -1) {
        dispatch_once(&qword_1024191A0, &stru_10234E090);
      }
      v24 = v6->_subjectUUIDKey;
      LODWORD(__p[0]) = 138412290;
      *(void **)((char *)__p + 4) = v24;
      v25 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher initWithDelegate:settings:]", "%s\n", v25);
      if (v25 != (char *)buf) {
        free(v25);
      }
    }
    v6->_subjectAuthKey = (NSString *)[objc_alloc((Class)NSString) initWithFormat:@"%@%@", (*(uint64_t (**)(void))(**(void **)a4 + 32))(), -[NSUUID UUIDString](v6->_studyUUID, "UUIDString")];
    if (qword_1024191A0 != -1) {
      dispatch_once(&qword_1024191A0, &stru_10234E090);
    }
    v14 = qword_1024191A8;
    if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_DEBUG))
    {
      subjectAuthKey = v6->_subjectAuthKey;
      *(_DWORD *)buf = 138412290;
      *(void *)v39 = subjectAuthKey;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Setting subjectAuthKey key : %@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191A0 != -1) {
        dispatch_once(&qword_1024191A0, &stru_10234E090);
      }
      v26 = v6->_subjectAuthKey;
      LODWORD(__p[0]) = 138412290;
      *(void **)((char *)__p + 4) = v26;
      v27 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher initWithDelegate:settings:]", "%s\n", v27);
      if (v27 != (char *)buf) {
        free(v27);
      }
    }
    sub_100134750(v30, "https://ingest.apple-studies.com:8443");
    sub_101A2A6C0((BOOL *)buf, "WorkoutRecorderPublisherHost", (long long *)v30, 0);
    if (SHIBYTE(v40) < 0)
    {
      sub_1000DC48C(__p, *(void **)&v39[4], *(unint64_t *)&v39[12]);
    }
    else
    {
      *(_OWORD *)__p = *(_OWORD *)&v39[4];
      uint64_t v37 = v40;
    }
    if (v37 >= 0) {
      v16 = __p;
    }
    else {
      v16 = (void **)__p[0];
    }
    v17 = +[NSString stringWithUTF8String:v16];
    if (SHIBYTE(v37) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v40) < 0) {
      operator delete(*(void **)&v39[4]);
    }
    if (v31 < 0) {
      operator delete(v30[0]);
    }
    v35[0] = v17;
    v35[1] = @"/ingest/v2/register";
    v35[2] = [(NSUUID *)v6->_studyUUID UUIDString];
    v6->_registerURL = +[NSURL URLWithString:](NSURL, "URLWithString:", +[NSString pathWithComponents:](NSString, "pathWithComponents:", +[NSArray arrayWithObjects:v35 count:3]));
    v34[0] = v17;
    v34[1] = @"/ingest/v2/submit";
    v6->_ingestURL = +[NSURL URLWithString:](NSURL, "URLWithString:", +[NSString pathWithComponents:](NSString, "pathWithComponents:", +[NSArray arrayWithObjects:v34 count:2]));
    v33[0] = v17;
    v33[1] = @"/ingest/v1/config";
    v33[2] = [(NSString *)[(NSUUID *)v6->_studyUUID UUIDString] lowercaseString];
    v6->_configurationURL = +[NSURL URLWithString:](NSURL, "URLWithString:", +[NSString pathWithComponents:](NSString, "pathWithComponents:", +[NSArray arrayWithObjects:v33 count:3]));
    id v18 = [[-[CLWorkoutRecorderPublisherDelegate silo](v6->_delegate, "silo") operationQueue];
    v19 = +[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:(*(uint64_t (**)(void))(**(void **)a4 + 16))()];
    [(NSURLSessionConfiguration *)v19 setSessionSendsLaunchEvents:0];
    [(NSURLSessionConfiguration *)v19 setAllowsCellularAccess:0];
    [(NSURLSessionConfiguration *)v19 set_requiresPowerPluggedIn:1];
    v6->_urlSession = +[NSURLSession sessionWithConfiguration:v19 delegate:v6 delegateQueue:v18];
    v6->_responses = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    if ([+[NSFileManager defaultManager] fileExistsAtPath:@"/var/mobile/Library/locationd/WorkoutRecorder"])
    {
      v30[0] = 0;
      [+[NSFileManager defaultManager] removeItemAtPath:@"/var/mobile/Library/locationd/WorkoutRecorder" error:v30];
      if (v30[0])
      {
        if (qword_1024191A0 != -1) {
          dispatch_once(&qword_1024191A0, &stru_10234E090);
        }
        v20 = qword_1024191A8;
        if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(void **)v39 = v30[0];
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Unable to delete publishing directory directory, error: %{public}@", buf, 0xCu);
        }
        if (sub_10013D1A0(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024191A0 != -1) {
            dispatch_once(&qword_1024191A0, &stru_10234E090);
          }
          LODWORD(__p[0]) = 138543362;
          *(void **)((char *)__p + 4) = v30[0];
          v29 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 0, "-[CLWorkoutRecorderPublisher initWithDelegate:settings:]", "%s\n", v29);
          if (v29 != (char *)buf) {
            free(v29);
          }
        }
      }
    }
    v30[0] = 0;
    [+[NSFileManager defaultManager] createDirectoryAtPath:@"/var/mobile/Library/locationd/WorkoutRecorder" withIntermediateDirectories:1 attributes:0 error:v30];
    if (v30[0])
    {
      if (qword_1024191A0 != -1) {
        dispatch_once(&qword_1024191A0, &stru_10234E090);
      }
      v21 = qword_1024191A8;
      if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void **)v39 = v30[0];
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Unable to create publishing directory, error: %@", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191A0 != -1) {
          dispatch_once(&qword_1024191A0, &stru_10234E090);
        }
        LODWORD(__p[0]) = 138412290;
        *(void **)((char *)__p + 4) = v30[0];
        v28 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLWorkoutRecorderPublisher initWithDelegate:settings:]", "%s\n", v28);
        if (v28 != (char *)buf) {
          free(v28);
        }
      }
      return 0;
    }
    else
    {
      [(CLWorkoutRecorderPublisher *)v6 registerDevice];
      [(CLWorkoutRecorderPublisher *)v6 setupConfigurationTimer];
    }
  }
  return v6;
}

- (void)dealloc
{
  self->_delegate = 0;

  self->_urlSession = 0;
  self->_responses = 0;

  self->_registrationTimer = 0;
  self->_subjectUUID = 0;

  self->_subjectToken = 0;
  self->_authorization = 0;

  self->_certificate = 0;
  self->_studyUUID = 0;

  self->_registerURL = 0;
  self->_ingestURL = 0;

  self->_healthWrapConfiguration = 0;
  self->_subjectUUIDKey = 0;

  self->_subjectAuthKey = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLWorkoutRecorderPublisher;
  [(CLWorkoutRecorderPublisher *)&v3 dealloc];
}

- (void)publishDataFiles:(id)a3 metadata:(id)a4 startDate:(id)a5 endDate:(id)a6 settings:(void *)a7
{
  if (qword_1024191A0 != -1) {
    dispatch_once(&qword_1024191A0, &stru_10234E090);
  }
  v13 = qword_1024191A8;
  if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Publishing data files.", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191A0 != -1) {
      dispatch_once(&qword_1024191A0, &stru_10234E090);
    }
    LOWORD(v39) = 0;
    v33 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher publishDataFiles:metadata:startDate:endDate:settings:]", "%s\n", v33);
    if (v33 != (char *)buf) {
      free(v33);
    }
  }
  sub_1000E1294((uint64_t *)v38, (uint64_t)"WorkoutRecorder.CLWorkoutRecorderPublisher.publishDataFiles", 0);
  if ([(CLWorkoutRecorderPublisher *)self canPublish])
  {
    id v14 = [(CLWorkoutRecorderPublisher *)self encryptData:a3 metaData:a4 start:a5 end:a6];
    if (v14)
    {
      v15 = +[NSMutableURLRequest requestWithURL:self->_ingestURL];
      [(NSMutableURLRequest *)v15 setAllowsCellularAccess:0];
      [(NSMutableURLRequest *)v15 setHTTPMethod:@"POST"];
      authorization = self->_authorization;
      if (authorization) {
        [(NSMutableURLRequest *)v15 setValue:authorization forHTTPHeaderField:@"Authorization"];
      }
      [(NSMutableURLRequest *)v15 setValue:@"application/octet-stream" forHTTPHeaderField:@"Content-Type"];
      [(NSMutableURLRequest *)v15 setValue:@"application/json" forHTTPHeaderField:@"Accept"];
      [(NSMutableURLRequest *)v15 setValue:[(CLWorkoutRecorderPublisher *)self subjectToken] forHTTPHeaderField:@"X-HDS-Subject-Authorization"];
      v17 = [(NSURLSession *)self->_urlSession uploadTaskWithRequest:v15 fromFile:v14];
      -[NSURLSessionUploadTask setTaskDescription:](v17, "setTaskDescription:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@::%@", @"ingest", [v14 path]));
      [(NSURLSessionUploadTask *)v17 resume];
      if (qword_1024191A0 != -1) {
        dispatch_once(&qword_1024191A0, &stru_10234E090);
      }
      id v18 = qword_1024191A8;
      if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_DEBUG))
      {
        id v19 = [v14 path];
        *(_DWORD *)buf = 138412546;
        *(void *)v43 = v19;
        *(_WORD *)&v43[8] = 2112;
        v44 = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Created request for file: %@, task: %@", buf, 0x16u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191A0 != -1) {
          dispatch_once(&qword_1024191A0, &stru_10234E090);
        }
        id v34 = [v14 path];
        int v39 = 138412546;
        *(void *)uint64_t v40 = v34;
        *(_WORD *)&v40[8] = 2112;
        v41 = v17;
        v35 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher publishDataFiles:metadata:startDate:endDate:settings:]", "%s\n", v35);
        if (v35 != (char *)buf) {
          free(v35);
        }
      }
      int v20 = sub_101A211EC(*(uint64_t **)a7);
      uint64_t v21 = sub_1000A6958();
      uint64_t v22 = (*(uint64_t (**)(void))(**(void **)a7 + 48))();
      *(_DWORD *)buf = 0;
      if (sub_10013E418(v21, v22, buf)) {
        unsigned int v23 = *(_DWORD *)buf + 1;
      }
      else {
        unsigned int v23 = 1;
      }
      unsigned int v37 = v23;
      if (v20 - 1 >= v23)
      {
        uint64_t v30 = sub_1000A6958();
        CFStringRef v31 = (const __CFString *)(*(uint64_t (**)(void))(**(void **)a7 + 48))();
        sub_1004D2C30(v30, v31, &v37);
      }
      else
      {
        if (qword_1024191A0 != -1) {
          dispatch_once(&qword_1024191A0, &stru_10234E090);
        }
        v24 = qword_1024191A8;
        if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v43 = v23;
          *(_WORD *)&v43[4] = 1024;
          *(_DWORD *)&v43[6] = v20;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Reregistering the device as count: %d equals or exceeds maxCount: %d", buf, 0xEu);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024191A0 != -1) {
            dispatch_once(&qword_1024191A0, &stru_10234E090);
          }
          int v39 = 67109376;
          *(_DWORD *)uint64_t v40 = v23;
          *(_WORD *)&v40[4] = 1024;
          *(_DWORD *)&v40[6] = v20;
          v36 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher publishDataFiles:metadata:startDate:endDate:settings:]", "%s\n", v36);
          if (v36 != (char *)buf) {
            free(v36);
          }
        }
        [(CLWorkoutRecorderPublisher *)self reregisterDevice];
        uint64_t v25 = sub_1000A6958();
        CFStringRef v26 = (const __CFString *)(*(uint64_t (**)(void))(**(void **)a7 + 48))();
        *(_DWORD *)buf = 0;
        sub_1000EA2A4(v25, v26, buf);
      }
      uint64_t v32 = sub_1000A6958();
      (*(void (**)(uint64_t))(*(void *)v32 + 944))(v32);
      goto LABEL_45;
    }
    if (qword_1024191A0 != -1) {
      dispatch_once(&qword_1024191A0, &stru_10234E090);
    }
    v29 = qword_1024191A8;
    if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Unable to send file, unable to create message for server.", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191A0 != -1) {
        dispatch_once(&qword_1024191A0, &stru_10234E090);
      }
      LOWORD(v39) = 0;
      v28 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLWorkoutRecorderPublisher publishDataFiles:metadata:startDate:endDate:settings:]", "%s\n", v28);
LABEL_41:
      if (v28 != (char *)buf) {
        free(v28);
      }
    }
  }
  else
  {
    if (qword_1024191A0 != -1) {
      dispatch_once(&qword_1024191A0, &stru_10234E090);
    }
    v27 = qword_1024191A8;
    if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Unable to publish, publisher not active.", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191A0 != -1) {
        dispatch_once(&qword_1024191A0, &stru_10234E090);
      }
      LOWORD(v39) = 0;
      v28 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher publishDataFiles:metadata:startDate:endDate:settings:]", "%s\n", v28);
      goto LABEL_41;
    }
  }
LABEL_45:
  sub_1000E1098(v38);
}

- (id)encryptData:(id)a3 metaData:(id)a4 start:(id)a5 end:(id)a6
{
  v11 = [(CLWorkoutRecorderPublisher *)self healthWrapConfiguration];
  [(HKHealthWrapMessageConfiguration *)v11 setStartDate:a5];
  [(HKHealthWrapMessageConfiguration *)v11 setEndDate:a6];
  [(HKHealthWrapMessageConfiguration *)v11 setKeyValuePairs:a4];
  [(HKHealthWrapMessageConfiguration *)v11 setPayloadIdentifier:[+[NSUUID UUID] UUIDString]];
  id v12 = [objc_alloc((Class)HKHealthWrapMessage) initWithConfiguration:v11];
  v36 = 0;
  if (([v12 startWithError:&v36] & 1) == 0)
  {
    if (qword_1024191A0 != -1) {
      dispatch_once(&qword_1024191A0, &stru_10234E090);
    }
    uint64_t v25 = qword_1024191A8;
    if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v43 = v36;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Error starting message, error: %{public}@", buf, 0xCu);
    }
    if (!sub_10013D1A0(115, 2)) {
      goto LABEL_35;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1024191A0 != -1) {
      dispatch_once(&qword_1024191A0, &stru_10234E090);
    }
    int v37 = 138543362;
    v38 = v36;
LABEL_65:
    uint64_t v30 = (uint8_t *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher encryptData:metaData:start:end:]", "%s\n");
    goto LABEL_66;
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v13 = [a3 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v33;
LABEL_4:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v33 != v15) {
        objc_enumerationMutation(a3);
      }
      v17 = *(NSURL **)(*((void *)&v32 + 1) + 8 * v16);
      v36 = 0;
      if (([v12 appendDataFromFileURL:v17 error:&v36] & 1) == 0) {
        break;
      }
      if (v14 == (id)++v16)
      {
        id v14 = [a3 countByEnumeratingWithState:&v32 objects:v41 count:16];
        if (v14) {
          goto LABEL_4;
        }
        goto LABEL_10;
      }
    }
    if (qword_1024191A0 != -1) {
      dispatch_once(&qword_1024191A0, &stru_10234E090);
    }
    CFStringRef v26 = qword_1024191A8;
    if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v43 = v17;
      __int16 v44 = 2114;
      v45 = v36;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Error appending file to message, file: %{public}@, error: %{public}@", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191A0 != -1) {
        dispatch_once(&qword_1024191A0, &stru_10234E090);
      }
      int v37 = 138543618;
      v38 = v17;
      __int16 v39 = 2114;
      uint64_t v40 = v36;
      goto LABEL_65;
    }
    goto LABEL_35;
  }
LABEL_10:
  v36 = 0;
  id v18 = [v12 finalizeWithError:&v36];
  if (!v18)
  {
    if (qword_1024191A0 != -1) {
      dispatch_once(&qword_1024191A0, &stru_10234E090);
    }
    v28 = qword_1024191A8;
    if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v43 = v36;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Error finalizing message, error: %{public}@", buf, 0xCu);
    }
    if (!sub_10013D1A0(115, 2)) {
      goto LABEL_35;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1024191A0 != -1) {
      dispatch_once(&qword_1024191A0, &stru_10234E090);
    }
    int v37 = 138543362;
    v38 = v36;
    goto LABEL_65;
  }
  id v19 = v18;
  int v20 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", [@"/var/mobile/Library/locationd/WorkoutRecorder" stringByAppendingPathComponent:[v18 lastPathComponent]]);
  if (!-[NSFileManager moveItemAtPath:toPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "moveItemAtPath:toPath:error:", [v19 path], -[NSURL path](v20, "path"), &v36))
  {
    if (qword_1024191A0 != -1) {
      dispatch_once(&qword_1024191A0, &stru_10234E090);
    }
    v29 = qword_1024191A8;
    if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v43 = v36;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Unable to move publishing file, error: %@", buf, 0xCu);
    }
    if (!sub_10013D1A0(115, 0)) {
      goto LABEL_35;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1024191A0 != -1) {
      dispatch_once(&qword_1024191A0, &stru_10234E090);
    }
    int v37 = 138412290;
    v38 = v36;
    uint64_t v30 = (uint8_t *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLWorkoutRecorderPublisher encryptData:metaData:start:end:]", "%s\n");
LABEL_66:
    if (v30 != buf) {
      free(v30);
    }
LABEL_35:
    [v12 reset];
    int v20 = 0;
    goto LABEL_36;
  }
  if (self->_enableWritingRecordingIdentifiersToSysDiagnose)
  {
    if (qword_1024191A0 != -1) {
      dispatch_once(&qword_1024191A0, &stru_10234E090);
    }
    uint64_t v21 = qword_1024191A8;
    if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = (NSURL *)[(HKHealthWrapMessageConfiguration *)v11 payloadIdentifier];
      *(_DWORD *)buf = 138478083;
      v43 = v22;
      __int16 v44 = 2114;
      v45 = v20;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Successfully created message with UUID: %{private}@, URL: %{public}@", buf, 0x16u);
    }
    if (!sub_10013D1A0(115, 2)) {
      goto LABEL_36;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1024191A0 != -1) {
      dispatch_once(&qword_1024191A0, &stru_10234E090);
    }
    unsigned int v23 = (NSURL *)[(HKHealthWrapMessageConfiguration *)v11 payloadIdentifier];
    int v37 = 138478083;
    v38 = v23;
    __int16 v39 = 2114;
    uint64_t v40 = v20;
    v24 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher encryptData:metaData:start:end:]", "%s\n", v24);
    if (v24 == (char *)buf) {
      goto LABEL_36;
    }
LABEL_61:
    free(v24);
    goto LABEL_36;
  }
  if (qword_1024191A0 != -1) {
    dispatch_once(&qword_1024191A0, &stru_10234E090);
  }
  CFStringRef v31 = qword_1024191A8;
  if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v43 = v20;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Successfully created message with URL: %{public}@", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191A0 != -1) {
      dispatch_once(&qword_1024191A0, &stru_10234E090);
    }
    int v37 = 138543362;
    v38 = v20;
    v24 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher encryptData:metaData:start:end:]", "%s\n", v24);
    if (v24 != (char *)buf) {
      goto LABEL_61;
    }
  }
LABEL_36:

  return v20;
}

- (void)sendRegisterRequest
{
  urlSession = self->_urlSession;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_101A4097C;
  v3[3] = &unk_10234E070;
  v3[4] = self;
  [(NSURLSession *)urlSession getTasksWithCompletionHandler:v3];
}

- (void)sendConfigurationRequest
{
  urlSession = self->_urlSession;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_101A40F20;
  v3[3] = &unk_10234E070;
  v3[4] = self;
  [(NSURLSession *)urlSession getTasksWithCompletionHandler:v3];
}

- (void)unregisterDevice
{
  self->_healthWrapConfiguration = 0;
  [(CLWorkoutRecorderPublisher *)self setSubjectUUID:0];

  [(CLWorkoutRecorderPublisher *)self setSubjectToken:0];
}

- (void)registerDevice
{
  if ([(CLWorkoutRecorderPublisher *)self canPublish] || self->_registrationTimer)
  {
    if (qword_1024191A0 != -1) {
      dispatch_once(&qword_1024191A0, &stru_10234E090);
    }
    objc_super v3 = qword_1024191A8;
    if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Registration requiremets already met, will not register.", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191A0 != -1) {
        dispatch_once(&qword_1024191A0, &stru_10234E090);
      }
      __int16 v7 = 0;
      v5 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher registerDevice]", "%s\n", v5);
      if (v5 != (char *)buf) {
        free(v5);
      }
    }
  }
  else
  {
    v4 = (CLTimer *)[[-[CLWorkoutRecorderPublisherDelegate silo](self->_delegate, "silo") newTimer];
    self->_registrationTimer = v4;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_101A41558;
    v6[3] = &unk_10229FED8;
    v6[4] = self;
    [(CLTimer *)v4 setHandler:v6];
    sub_101A1F180(buf, "WorkoutRecorderPublisherRegistrationTimerInterval", &qword_10247A3D8, 0);
    [(CLTimer *)self->_registrationTimer setNextFireDelay:0.01 interval:v9];
  }
}

- (void)reregisterDevice
{
  [(CLWorkoutRecorderPublisher *)self unregisterDevice];

  [(CLWorkoutRecorderPublisher *)self registerDevice];
}

- (void)setupConfigurationTimer
{
  objc_super v3 = (CLTimer *)[self->_delegate silo newTimer];
  self->_configurationTimer = v3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_101A41650;
  v6[3] = &unk_10229FED8;
  v6[4] = self;
  [(CLTimer *)v3 setHandler:v6];
  sub_101A1F180(v4, "WorkoutRecorderPublisherConfigurationTimerInterval", &qword_10247A3E0, 0);
  [(CLTimer *)self->_configurationTimer setNextFireDelay:0.01 interval:v5];
}

- (void)requestConfiguration
{
}

- (BOOL)canPublish
{
  if ([(CLWorkoutRecorderPublisher *)self subjectToken]) {
    BOOL v3 = [(CLWorkoutRecorderPublisher *)self healthWrapConfiguration] != 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (qword_1024191A0 != -1) {
    dispatch_once(&qword_1024191A0, &stru_10234E090);
  }
  v4 = qword_1024191A8;
  if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "can Publish %d", buf, 8u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191A0 != -1) {
      dispatch_once(&qword_1024191A0, &stru_10234E090);
    }
    v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher canPublish]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  return v3;
}

- (NSString)subjectToken
{
  result = self->_subjectToken;
  if (!result)
  {
    v4 = [[CLKeychainItemWrapper alloc] initWithIdentifier:self->_subjectAuthKey keyType:kSecAttrAccount];
    id v5 = [(CLKeychainItemWrapper *)v4 objectForKey:kSecValueData];
    if (v5 && (v6 = v5, ([v5 isEqualToString:&stru_10234F018] & 1) == 0))
    {
      self->_subjectToken = (NSString *)[v6 copy];
      if (qword_1024191A0 != -1) {
        dispatch_once(&qword_1024191A0, &stru_10234E090);
      }
      double v9 = qword_1024191A8;
      if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Succesfully acquired SubjectToken from keychain.", buf, 2u);
      }
      if (!sub_10013D1A0(115, 2)) {
        goto LABEL_17;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1024191A0 != -1) {
        dispatch_once(&qword_1024191A0, &stru_10234E090);
      }
      BOOL v8 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher subjectToken]", "%s\n");
    }
    else
    {
      if (qword_1024191A0 != -1) {
        dispatch_once(&qword_1024191A0, &stru_10234E090);
      }
      __int16 v7 = qword_1024191A8;
      if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Subject token was returned empty from keychain.", buf, 2u);
      }
      if (!sub_10013D1A0(115, 0)) {
        goto LABEL_17;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1024191A0 != -1) {
        dispatch_once(&qword_1024191A0, &stru_10234E090);
      }
      BOOL v8 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLWorkoutRecorderPublisher subjectToken]", "%s\n");
    }
    if (v8 != buf) {
      free(v8);
    }
LABEL_17:

    return self->_subjectToken;
  }
  return result;
}

- (void)setSubjectToken:(id)a3
{
  v4 = (NSString *)[a3 copy];
  id v5 = [[CLKeychainItemWrapper alloc] initWithIdentifier:self->_subjectAuthKey keyType:kSecAttrAccount];
  [(CLKeychainItemWrapper *)v5 setObject:&__kCFBooleanTrue forKey:kSecAttrIsInvisible];
  [(CLKeychainItemWrapper *)v5 setObject:kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly forKey:kSecAttrAccessible];
  if (v4) {
    CFStringRef v6 = (const __CFString *)v4;
  }
  else {
    CFStringRef v6 = &stru_10234F018;
  }
  [(CLKeychainItemWrapper *)v5 setObject:v6 forKey:kSecValueData];

  self->_subjectToken = v4;
  if (self->_enableWritingRecordingIdentifiersToSysDiagnose)
  {
    if (qword_1024191A0 != -1) {
      dispatch_once(&qword_1024191A0, &stru_10234E090);
    }
    __int16 v7 = qword_1024191A8;
    if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_DEBUG))
    {
      subjectAuthKey = self->_subjectAuthKey;
      *(_DWORD *)buf = 138412290;
      id v12 = subjectAuthKey;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Setting new SubjectToken for key %@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191A0 == -1)
      {
LABEL_19:
        id v10 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher setSubjectToken:]", "%s\n", v10);
        if (v10 != (char *)buf) {
          free(v10);
        }
        return;
      }
LABEL_21:
      dispatch_once(&qword_1024191A0, &stru_10234E090);
      goto LABEL_19;
    }
  }
  else
  {
    if (qword_1024191A0 != -1) {
      dispatch_once(&qword_1024191A0, &stru_10234E090);
    }
    double v9 = qword_1024191A8;
    if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Setting new SubjectToken.", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191A0 == -1) {
        goto LABEL_19;
      }
      goto LABEL_21;
    }
  }
}

- (NSString)subjectUUID
{
  result = self->_subjectUUID;
  if (!result)
  {
    uint64_t v16 = 0;
    uint64_t v4 = sub_1000A6958();
    if ((sub_1004D01D8(v4, (uint64_t)self->_subjectUUIDKey, (CFTypeRef *)&v16) & 1) == 0)
    {
      self->_subjectUUID = 0;
      if (qword_1024191A0 != -1) {
        dispatch_once(&qword_1024191A0, &stru_10234E090);
      }
      BOOL v8 = qword_1024191A8;
      if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No cached subjectUUID found,subjectUUID is set to nil", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191A0 != -1) {
          dispatch_once(&qword_1024191A0, &stru_10234E090);
        }
        LOWORD(v17) = 0;
        double v9 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher subjectUUID]", "%s\n", v9);
        if (v9 != (char *)buf) {
          free(v9);
        }
      }
      return self->_subjectUUID;
    }
    self->_subjectUUID = (NSString *)[v16 copy];
    if (self->_enableWritingRecordingIdentifiersToSysDiagnose)
    {
      if (qword_1024191A0 != -1) {
        dispatch_once(&qword_1024191A0, &stru_10234E090);
      }
      id v5 = qword_1024191A8;
      if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_DEBUG))
      {
        subjectUUID = self->_subjectUUID;
        *(_DWORD *)buf = 138412290;
        int v20 = subjectUUID;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "_subjectUUID cached copy %@", buf, 0xCu);
      }
      if (!sub_10013D1A0(115, 2)) {
        goto LABEL_26;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1024191A0 != -1) {
        dispatch_once(&qword_1024191A0, &stru_10234E090);
      }
      __int16 v7 = self->_subjectUUID;
      int v17 = 138412290;
      id v18 = v7;
    }
    else
    {
      if (qword_1024191A0 != -1) {
        dispatch_once(&qword_1024191A0, &stru_10234E090);
      }
      id v10 = qword_1024191A8;
      if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Successfully retrieved subjectUUID from cache", buf, 2u);
      }
      if (!sub_10013D1A0(115, 2)) {
        goto LABEL_26;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1024191A0 != -1) {
        dispatch_once(&qword_1024191A0, &stru_10234E090);
      }
      LOWORD(v17) = 0;
    }
    uint64_t v15 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher subjectUUID]", "%s\n", v15);
    if (v15 != (char *)buf) {
      free(v15);
    }
LABEL_26:
    if ([(NSString *)self->_subjectUUID isEqualToString:&stru_10234F018])
    {
      if (qword_1024191A0 != -1) {
        dispatch_once(&qword_1024191A0, &stru_10234E090);
      }
      v11 = qword_1024191A8;
      if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "subjectUUID is empty.Clearing uuid saved to cache", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191A0 != -1) {
          dispatch_once(&qword_1024191A0, &stru_10234E090);
        }
        LOWORD(v17) = 0;
        id v14 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher subjectUUID]", "%s\n", v14);
        if (v14 != (char *)buf) {
          free(v14);
        }
      }
      uint64_t v12 = sub_1000A6958();
      sub_1004CF870(v12);
      uint64_t v13 = *(void *)sub_1000A6958();
      (*(void (**)(void))(v13 + 944))();

      self->_subjectUUID = 0;
    }
    return self->_subjectUUID;
  }
  return result;
}

- (void)setSubjectUUID:(id)a3
{
  uint64_t v4 = (NSString *)[a3 copy];
  if (v4)
  {
    uint64_t v5 = sub_1000A6958();
    if (sub_1004D258C(v5))
    {
      if (qword_1024191A0 != -1) {
        dispatch_once(&qword_1024191A0, &stru_10234E090);
      }
      CFStringRef v6 = qword_1024191A8;
      if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Setting subject id", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191A0 == -1)
        {
LABEL_27:
          uint64_t v12 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher setSubjectUUID:]", "%s\n", v12);
          if (v12 != (char *)buf) {
            free(v12);
          }
          goto LABEL_21;
        }
LABEL_29:
        dispatch_once(&qword_1024191A0, &stru_10234E090);
        goto LABEL_27;
      }
    }
    else
    {
      if (qword_1024191A0 != -1) {
        dispatch_once(&qword_1024191A0, &stru_10234E090);
      }
      double v9 = qword_1024191A8;
      if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Unable to set subject id in CLDaemonCache", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191A0 == -1) {
          goto LABEL_27;
        }
        goto LABEL_29;
      }
    }
  }
  else
  {
    if (qword_1024191A0 != -1) {
      dispatch_once(&qword_1024191A0, &stru_10234E090);
    }
    __int16 v7 = qword_1024191A8;
    if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "subjectUUID from server is empty", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191A0 != -1) {
        dispatch_once(&qword_1024191A0, &stru_10234E090);
      }
      v11 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher setSubjectUUID:]", "%s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
    uint64_t v8 = sub_1000A6958();
    sub_1004CF870(v8);
  }
LABEL_21:
  uint64_t v10 = sub_1000A6958();
  (*(void (**)(uint64_t))(*(void *)v10 + 944))(v10);

  self->_subjectUUID = v4;
}

- (HKHealthWrapMessageConfiguration)healthWrapConfiguration
{
  if (self->_healthWrapConfiguration || ![(CLWorkoutRecorderPublisher *)self subjectUUID]) {
    return self->_healthWrapConfiguration;
  }
  sub_100103240();
  sub_10073ADA8((uint64_t)__p);
  if (v13 >= 0) {
    uint64_t v4 = __p;
  }
  else {
    uint64_t v4 = *(unsigned char **)__p;
  }
  uint64_t v5 = +[NSString stringWithUTF8String:v4];
  if (v13 < 0) {
    operator delete(*(void **)__p);
  }
  uint64_t v6 = HKHealthWrapCertificateFromString();
  if (v6)
  {
    self->_healthWrapConfiguration = (HKHealthWrapMessageConfiguration *)[objc_alloc((Class)HKHealthWrapMessageConfiguration) initWithSubjectUUID:[objc_alloc((Class)NSUUID) initWithUUIDString:[CLWorkoutRecorderPublisher subjectUUID](self, "subjectUUID")] studyUUID:self->_studyUUID channel:v5 payloadType:@"workout" certificate:v6];
    if (qword_1024191A0 != -1) {
      dispatch_once(&qword_1024191A0, &stru_10234E090);
    }
    __int16 v7 = qword_1024191A8;
    if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__p = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Creating new healthwrapConfiguration", __p, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1024191A0 != -1) {
        dispatch_once(&qword_1024191A0, &stru_10234E090);
      }
      uint64_t v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher healthWrapConfiguration]", "%s\n", v8);
      if (v8 != __p) {
        free(v8);
      }
    }
    return self->_healthWrapConfiguration;
  }
  if (qword_1024191A0 != -1) {
    dispatch_once(&qword_1024191A0, &stru_10234E090);
  }
  double v9 = qword_1024191A8;
  if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_FAULT))
  {
    certificate = self->_certificate;
    *(_DWORD *)__p = 138543362;
    *(void *)&__p[4] = certificate;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "NULL certificate for %{public}@", __p, 0xCu);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(__p, 0x65CuLL);
    if (qword_1024191A0 != -1) {
      dispatch_once(&qword_1024191A0, &stru_10234E090);
    }
    v11 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLWorkoutRecorderPublisher healthWrapConfiguration]", "%s\n", v11);
    if (v11 != __p) {
      free(v11);
    }
  }
  return 0;
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  if (qword_1024191A0 != -1) {
    dispatch_once(&qword_1024191A0, &stru_10234E090);
  }
  uint64_t v8 = qword_1024191A8;
  if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v44 = [a4 taskDescription];
    __int16 v45 = 2048;
    id v46 = [a4 taskIdentifier];
    __int16 v47 = 2112;
    id v48 = a5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Download task completed with task: %@ and task id: %lu and location: %@", buf, 0x20u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191A0 != -1) {
      dispatch_once(&qword_1024191A0, &stru_10234E090);
    }
    int v37 = 138412802;
    id v38 = [a4 taskDescription];
    __int16 v39 = 2048;
    id v40 = [a4 taskIdentifier];
    __int16 v41 = 2112;
    id v42 = a5;
    long long v32 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher URLSession:downloadTask:didFinishDownloadingToURL:]", "%s\n", v32);
    if (v32 != (char *)buf) {
      free(v32);
    }
  }
  id v9 = [a4 response];
  if ([a4 error]
    || (uint64_t)[v9 statusCode] < 200
    || (uint64_t)[v9 statusCode] >= 300)
  {
    if (qword_1024191A0 != -1) {
      dispatch_once(&qword_1024191A0, &stru_10234E090);
    }
    id v18 = qword_1024191A8;
    if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_DEBUG))
    {
      id v19 = [a4 taskDescription];
      id v20 = [v9 statusCode];
      id v21 = [a4 error];
      *(_DWORD *)buf = 138412802;
      id v44 = v19;
      __int16 v45 = 2048;
      id v46 = v20;
      __int16 v47 = 2112;
      id v48 = v21;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Error in download task:%@, statusCode: %ld, error: %@", buf, 0x20u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191A0 != -1) {
        dispatch_once(&qword_1024191A0, &stru_10234E090);
      }
      int v37 = 138412802;
      id v38 = [a4 taskDescription];
      __int16 v39 = 2048;
      id v40 = [v9 statusCode];
      __int16 v41 = 2112;
      id v42 = [a4 error];
      CFStringRef v31 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher URLSession:downloadTask:didFinishDownloadingToURL:]", "%s\n");
      goto LABEL_84;
    }
  }
  else
  {
    long long v35 = 0;
    id v36 = 0;
    sub_101A40D64([a4 taskDescription], &v36, &v35);
    if ([v36 isEqualToString:@"registration"])
    {
      long long v34 = 0;
      id v10 = +[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", +[NSData dataWithContentsOfURL:a5], 1, &v34);
      if (v10 && !v34)
      {
        v11 = v10;
        id v12 = [v10 objectForKey:@"subjectId"];
        id v13 = [v11 objectForKey:@"token"];
        if (v12)
        {
          id v14 = v13;
          if (v13)
          {
            if (qword_1024191A0 != -1) {
              dispatch_once(&qword_1024191A0, &stru_10234E090);
            }
            uint64_t v15 = qword_1024191A8;
            if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Setting new subject ID and subject token.", buf, 2u);
            }
            if (sub_10013D1A0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1024191A0 != -1) {
                dispatch_once(&qword_1024191A0, &stru_10234E090);
              }
              LOWORD(v37) = 0;
              long long v33 = (char *)_os_log_send_and_compose_impl();
              sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher URLSession:downloadTask:didFinishDownloadingToURL:]", "%s\n", v33);
              if (v33 != (char *)buf) {
                free(v33);
              }
            }
            [(CLWorkoutRecorderPublisher *)self setSubjectUUID:v12];
            [(CLWorkoutRecorderPublisher *)self setSubjectToken:v14];
            [(CLTimer *)self->_registrationTimer invalidate];

            self->_registrationTimer = 0;
            if (qword_1024191A0 != -1) {
              dispatch_once(&qword_1024191A0, &stru_10234E090);
            }
            uint64_t v16 = qword_1024191A8;
            if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Successfully registered device.", buf, 2u);
            }
            if (!sub_10013D1A0(115, 2)) {
              goto LABEL_59;
            }
            bzero(buf, 0x65CuLL);
            if (qword_1024191A0 != -1) {
              dispatch_once(&qword_1024191A0, &stru_10234E090);
            }
            LOWORD(v37) = 0;
            int v17 = (uint8_t *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher URLSession:downloadTask:didFinishDownloadingToURL:]", "%s\n");
            goto LABEL_94;
          }
        }
        if (qword_1024191A0 != -1) {
          dispatch_once(&qword_1024191A0, &stru_10234E090);
        }
        v28 = qword_1024191A8;
        if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Got invalid response from server on registration. subjectId or token nil.", buf, 2u);
        }
        if (!sub_10013D1A0(115, 0)) {
          goto LABEL_59;
        }
        bzero(buf, 0x65CuLL);
        if (qword_1024191A0 != -1) {
          dispatch_once(&qword_1024191A0, &stru_10234E090);
        }
        LOWORD(v37) = 0;
LABEL_93:
        int v17 = (uint8_t *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLWorkoutRecorderPublisher URLSession:downloadTask:didFinishDownloadingToURL:]", "%s\n");
LABEL_94:
        if (v17 != buf) {
          free(v17);
        }
        goto LABEL_59;
      }
      if (qword_1024191A0 != -1) {
        dispatch_once(&qword_1024191A0, &stru_10234E090);
      }
      v24 = qword_1024191A8;
      if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v44 = v34;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Unable to parse response for register subject, error: %@", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191A0 != -1) {
          dispatch_once(&qword_1024191A0, &stru_10234E090);
        }
        int v37 = 138412290;
        id v38 = v34;
LABEL_76:
        CFStringRef v31 = (uint8_t *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLWorkoutRecorderPublisher URLSession:downloadTask:didFinishDownloadingToURL:]", "%s\n");
LABEL_84:
        if (v31 != buf) {
          free(v31);
        }
      }
    }
    else
    {
      if (![v36 isEqualToString:@"configuration"])
      {
        if (qword_1024191A0 != -1) {
          dispatch_once(&qword_1024191A0, &stru_10234E090);
        }
        uint64_t v25 = qword_1024191A8;
        if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_ERROR))
        {
          id v26 = [a4 taskDescription];
          *(_DWORD *)buf = 138543362;
          id v44 = v26;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Received callback for unexpected download task: %{public}@", buf, 0xCu);
        }
        if (!sub_10013D1A0(115, 0)) {
          goto LABEL_59;
        }
        bzero(buf, 0x65CuLL);
        if (qword_1024191A0 != -1) {
          dispatch_once(&qword_1024191A0, &stru_10234E090);
        }
        id v27 = [a4 taskDescription];
        int v37 = 138543362;
        id v38 = v27;
        goto LABEL_93;
      }
      uint64_t v22 = +[NSData dataWithContentsOfURL:a5];
      if (v22)
      {
        long long v34 = 0;
        id v23 = +[NSJSONSerialization JSONObjectWithData:v22 options:1 error:&v34];
        if (v23 && !v34)
        {
          [(CLWorkoutRecorderPublisherDelegate *)self->_delegate handleResponse:v23];
LABEL_59:
          [+[NSFileManager defaultManager] removeItemAtURL:a5 error:0];
          return;
        }
        if (qword_1024191A0 != -1) {
          dispatch_once(&qword_1024191A0, &stru_10234E090);
        }
        uint64_t v30 = qword_1024191A8;
        if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v44 = v34;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Unable to parse response for configuration request, error: %@", buf, 0xCu);
        }
        if (sub_10013D1A0(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024191A0 != -1) {
            dispatch_once(&qword_1024191A0, &stru_10234E090);
          }
          int v37 = 138412290;
          id v38 = v34;
          goto LABEL_76;
        }
      }
      else
      {
        if (qword_1024191A0 != -1) {
          dispatch_once(&qword_1024191A0, &stru_10234E090);
        }
        v29 = qword_1024191A8;
        if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Data from URL is nil, cannot serialize", buf, 2u);
        }
        if (sub_10013D1A0(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024191A0 != -1) {
            dispatch_once(&qword_1024191A0, &stru_10234E090);
          }
          LOWORD(v37) = 0;
          goto LABEL_76;
        }
      }
    }
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v8 = [[self->_responses objectForKey:[+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a4, "taskIdentifier", a3))]
  if (!v8)
  {
    id v8 = objc_alloc_init((Class)NSMutableData);
    -[NSMutableDictionary setObject:forKey:](self->_responses, "setObject:forKey:", v8, +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a4 taskIdentifier]));
  }

  [v8 appendData:a5];
}

- (void)handleRegistrationResponse:(id)a3 data:(id)a4 url:(id)a5 didCompleteWithError:(id)a6
{
  if (!sub_101A42BBC(a5))
  {
    if (qword_1024191A0 != -1) {
      dispatch_once(&qword_1024191A0, &stru_10234E090);
    }
    id v9 = qword_1024191A8;
    if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Registration request sent to non default endpoint", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191A0 != -1) {
        dispatch_once(&qword_1024191A0, &stru_10234E090);
      }
      id v14 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher handleRegistrationResponse:data:url:didCompleteWithError:]", "%s\n", v14);
      if (v14 != (char *)buf) {
        free(v14);
      }
    }
  }
  if (a6 || (uint64_t)[a3 statusCode] < 200 || (uint64_t)objc_msgSend(a3, "statusCode") >= 300)
  {
    id v10 = [objc_alloc((Class)NSString) initWithData:a4 encoding:4];
    if (qword_1024191A0 != -1) {
      dispatch_once(&qword_1024191A0, &stru_10234E090);
    }
    v11 = qword_1024191A8;
    if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_ERROR))
    {
      id v12 = [a3 statusCode];
      *(_DWORD *)buf = 134349570;
      id v16 = v12;
      __int16 v17 = 2114;
      id v18 = a6;
      __int16 v19 = 2114;
      id v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Unable to register subject, statusCode: %{public}ld, error: %{public}@, response: %{public}@", buf, 0x20u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191A0 != -1) {
        dispatch_once(&qword_1024191A0, &stru_10234E090);
      }
      [a3 statusCode];
      id v13 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLWorkoutRecorderPublisher handleRegistrationResponse:data:url:didCompleteWithError:]", "%s\n", v13);
      if (v13 != (char *)buf) {
        free(v13);
      }
    }
  }
}

- (void)handleConfigurationResponse:(id)a3 data:(id)a4 url:(id)a5 didCompleteWithError:(id)a6
{
  if (!sub_101A42BBC(a5))
  {
    if (qword_1024191A0 != -1) {
      dispatch_once(&qword_1024191A0, &stru_10234E090);
    }
    id v9 = qword_1024191A8;
    if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Configuration request sent to non default endpoint", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191A0 != -1) {
        dispatch_once(&qword_1024191A0, &stru_10234E090);
      }
      id v14 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher handleConfigurationResponse:data:url:didCompleteWithError:]", "%s\n", v14);
      if (v14 != (char *)buf) {
        free(v14);
      }
    }
  }
  if (a6 || (uint64_t)[a3 statusCode] < 200 || (uint64_t)objc_msgSend(a3, "statusCode") >= 300)
  {
    id v10 = [objc_alloc((Class)NSString) initWithData:a4 encoding:4];
    if (qword_1024191A0 != -1) {
      dispatch_once(&qword_1024191A0, &stru_10234E090);
    }
    v11 = qword_1024191A8;
    if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_ERROR))
    {
      id v12 = [a3 statusCode];
      *(_DWORD *)buf = 134349570;
      id v16 = v12;
      __int16 v17 = 2114;
      id v18 = a6;
      __int16 v19 = 2114;
      id v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Unable to get configuration, statusCode: %{public}ld, error: %{public}@, response: %{public}@", buf, 0x20u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191A0 != -1) {
        dispatch_once(&qword_1024191A0, &stru_10234E090);
      }
      [a3 statusCode];
      id v13 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLWorkoutRecorderPublisher handleConfigurationResponse:data:url:didCompleteWithError:]", "%s\n", v13);
      if (v13 != (char *)buf) {
        free(v13);
      }
    }
  }
}

- (void)handleIngestResponse:(id)a3 data:(id)a4 url:(id)a5 didCompleteWithError:(id)a6
{
  id v9 = [objc_alloc((Class)NSString) initWithData:a4 encoding:4];
  id v21 = 0;
  if (!-[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", [a5 path], &v21))
  {
    if (qword_1024191A0 != -1) {
      dispatch_once(&qword_1024191A0, &stru_10234E090);
    }
    id v10 = qword_1024191A8;
    if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_ERROR))
    {
      id v11 = [a5 path];
      *(_DWORD *)buf = 138543618;
      id v31 = v11;
      __int16 v32 = 2114;
      id v33 = v21;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Unable to remove file: %{public}@, error: %{public}@", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191A0 != -1) {
        dispatch_once(&qword_1024191A0, &stru_10234E090);
      }
      id v19 = [a5 path];
      int v22 = 138543618;
      id v23 = v19;
      __int16 v24 = 2114;
      id v25 = v21;
      id v20 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLWorkoutRecorderPublisher handleIngestResponse:data:url:didCompleteWithError:]", "%s\n", v20);
      if (v20 != (char *)buf) {
        free(v20);
      }
    }
  }
  if (!a6 && (uint64_t)[a3 statusCode] >= 200 && (uint64_t)objc_msgSend(a3, "statusCode") <= 299)
  {
    if (qword_1024191A0 != -1) {
      dispatch_once(&qword_1024191A0, &stru_10234E090);
    }
    id v12 = qword_1024191A8;
    if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [a5 path];
      *(_DWORD *)buf = 138412546;
      id v31 = v13;
      __int16 v32 = 2112;
      id v33 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Successfully uploaded file: %@, response: %@", buf, 0x16u);
    }
    if (!sub_10013D1A0(115, 2)) {
      goto LABEL_24;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1024191A0 != -1) {
      dispatch_once(&qword_1024191A0, &stru_10234E090);
    }
    id v14 = [a5 path];
    int v22 = 138412546;
    id v23 = v14;
    __int16 v24 = 2112;
    id v25 = v9;
    uint64_t v15 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher handleIngestResponse:data:url:didCompleteWithError:]", "%s\n", v15);
    if (v15 == (char *)buf) {
      goto LABEL_24;
    }
LABEL_28:
    free(v15);
    goto LABEL_24;
  }
  if (qword_1024191A0 != -1) {
    dispatch_once(&qword_1024191A0, &stru_10234E090);
  }
  id v16 = qword_1024191A8;
  if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_ERROR))
  {
    id v17 = [a5 path];
    *(_DWORD *)buf = 138544130;
    id v31 = v17;
    __int16 v32 = 2114;
    id v33 = a6;
    __int16 v34 = 2114;
    id v35 = a3;
    __int16 v36 = 2114;
    id v37 = v9;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Error when uploading file, file: %{public}@, error: %{public}@, response: %{public}@, responseBody: %{public}@", buf, 0x2Au);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191A0 != -1) {
      dispatch_once(&qword_1024191A0, &stru_10234E090);
    }
    id v18 = [a5 path];
    int v22 = 138544130;
    id v23 = v18;
    __int16 v24 = 2114;
    id v25 = a6;
    __int16 v26 = 2114;
    id v27 = a3;
    __int16 v28 = 2114;
    id v29 = v9;
    uint64_t v15 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLWorkoutRecorderPublisher handleIngestResponse:data:url:didCompleteWithError:]", "%s\n", v15);
    if (v15 != (char *)buf) {
      goto LABEL_28;
    }
  }
LABEL_24:
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  objc_sync_enter(self);
  if (qword_1024191A0 != -1) {
    dispatch_once(&qword_1024191A0, &stru_10234E090);
  }
  id v9 = qword_1024191A8;
  if (os_log_type_enabled((os_log_t)qword_1024191A8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = a4;
    __int16 v21 = 2112;
    id v22 = [a4 description];
    __int16 v23 = 2112;
    id v24 = a5;
    __int16 v25 = 2112;
    id v26 = [objc_msgSend(a3, "configuration") identifier];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Request completed with task: %@ and description: %@ and error: %@ and id: %@", buf, 0x2Au);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191A0 != -1) {
      dispatch_once(&qword_1024191A0, &stru_10234E090);
    }
    *(_DWORD *)id v13 = 138413058;
    *(void *)&v13[4] = a4;
    __int16 v14 = 2112;
    id v15 = [a4 description];
    __int16 v16 = 2112;
    id v17 = a5;
    __int16 v18 = 2112;
    id v19 = [[objc_msgSend(a3, "configuration") identifier];
    id v12 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher URLSession:task:didCompleteWithError:]", "%s\n", v12);
    if (v12 != buf) {
      free(v12);
    }
  }
  if ([a4 state] == (id)3)
  {
    id v10 = -[NSMutableDictionary objectForKey:](self->_responses, "objectForKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a4 taskIdentifier]));
    -[NSMutableDictionary removeObjectForKey:](self->_responses, "removeObjectForKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a4 taskIdentifier]));
    *(void *)buf = 0;
    *(void *)id v13 = 0;
    sub_101A40D64([a4 taskDescription], buf, (NSURL **)v13);
    id v11 = [a4 response];
    if ([*(id *)buf isEqualToString:@"ingest"])
    {
      [(CLWorkoutRecorderPublisher *)self handleIngestResponse:v11 data:v10 url:*(void *)v13 didCompleteWithError:a5];
    }
    else if ([*(id *)buf isEqualToString:@"registration"])
    {
      [(CLWorkoutRecorderPublisher *)self handleRegistrationResponse:v11 data:v10 url:*(void *)v13 didCompleteWithError:a5];
    }
    else if ([*(id *)buf isEqualToString:@"configuration"])
    {
      [(CLWorkoutRecorderPublisher *)self handleConfigurationResponse:v11 data:v10 url:*(void *)v13 didCompleteWithError:a5];
    }
  }
  objc_sync_exit(self);
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
}

- (void)setHealthWrapConfiguration:(id)a3
{
}

- (BOOL)isAutoRegistration
{
  return self->_autoRegistration;
}

- (void)setAutoRegistration:(BOOL)a3
{
  self->_autoRegistration = a3;
}

@end