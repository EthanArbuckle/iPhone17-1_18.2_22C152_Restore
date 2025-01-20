@interface NFRemoteAdminConnectionHTTP
- (NFRemoteAdminConnectionHTTP)initWithURL:(id)a3 SEID:(id)a4;
- (NFRemoteAdminConnectionHTTP)initWithURL:(id)a3 SEID:(id)a4 showProprietaryHeaders:(BOOL)a5 disableEVTrustValidation:(BOOL)a6;
- (id)urlString;
- (unsigned)connect;
- (unsigned)disconnect;
- (unsigned)performRequest:(id)a3 body:(id)a4 header:(id)a5 response:(id)a6 responseHeader:(id)a7 httpStatus:(int64_t *)a8 duration:(double *)a9 sessionError:(id *)a10;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
@end

@implementation NFRemoteAdminConnectionHTTP

- (NFRemoteAdminConnectionHTTP)initWithURL:(id)a3 SEID:(id)a4
{
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v11 = 45;
    if (isMetaClass) {
      uint64_t v11 = 43;
    }
    v7(3, "%c[%{public}s %{public}s]:%i API is deprecated!!", v11, ClassName, Name, 95);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = object_getClass(self);
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v18 = v14;
    __int16 v19 = 2082;
    v20 = object_getClassName(self);
    __int16 v21 = 2082;
    v22 = sel_getName(a2);
    __int16 v23 = 1024;
    int v24 = 95;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i API is deprecated!!", buf, 0x22u);
  }

  return 0;
}

- (NFRemoteAdminConnectionHTTP)initWithURL:(id)a3 SEID:(id)a4 showProprietaryHeaders:(BOOL)a5 disableEVTrustValidation:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  v18.receiver = self;
  v18.super_class = (Class)NFRemoteAdminConnectionHTTP;
  v12 = [(NFRemoteAdminConnectionHTTP *)&v18 init];
  if (v12)
  {
    dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
    sem = v12->_sem;
    v12->_sem = (OS_dispatch_semaphore *)v13;

    if ([v11 length])
    {
      v15 = [v10 URLByAppendingPathComponent:v11];
    }
    else
    {
      v15 = (NSURL *)v10;
    }
    baseURL = v12->_baseURL;
    v12->_baseURL = v15;

    if (os_variant_has_internal_content()) {
      v12->_disableEVTrustValidation = a6;
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003D758;
    block[3] = &unk_100058AA0;
    block[4] = v12;
    block[5] = "_getSessionWithProprietaryHeaders";
    if (qword_100060428 != -1) {
      dispatch_once(&qword_100060428, block);
    }
    objc_storeStrong((id *)&v12->_netSession, (id)qword_100060430);
    v12->_proprietaryHeaders = a5;
  }

  return v12;
}

- (unsigned)connect
{
  return 0;
}

- (unsigned)disconnect
{
  v2 = self;
  objc_sync_enter(v2);
  [(NSURLSessionTask *)v2->_netSessionTask cancel];
  objc_sync_exit(v2);

  return 0;
}

- (id)urlString
{
  return [(NSURL *)self->_url absoluteString];
}

- (unsigned)performRequest:(id)a3 body:(id)a4 header:(id)a5 response:(id)a6 responseHeader:(id)a7 httpStatus:(int64_t *)a8 duration:(double *)a9 sessionError:(id *)a10
{
  id v91 = a3;
  id v89 = a4;
  id v88 = a5;
  id v86 = a6;
  id v87 = a7;
  uint64_t v110 = 0;
  v111 = &v110;
  uint64_t v112 = 0x2020000000;
  int v113 = 6;
  uint64_t v104 = 0;
  v105 = &v104;
  uint64_t v106 = 0x3032000000;
  v107 = sub_10003E8E4;
  v108 = sub_10003E8F4;
  id v109 = 0;
  *(void *)v118 = 0;
  *(void *)v119 = v118;
  *(void *)&v119[8] = 0x3032000000;
  *(void *)&v119[16] = sub_10003E8E4;
  *(void *)&v119[24] = sub_10003E8F4;
  *(void *)&v119[32] = 0;
  id v14 = [v91 length];
  baseURL = self->_baseURL;
  if (v14)
  {
    v16 = [(NSURL *)baseURL URLByAppendingPathComponent:v91];
  }
  else
  {
    v16 = (NSURL *)[(NSURL *)baseURL copy];
  }
  url = self->_url;
  self->_url = v16;

  objc_storeStrong((id *)(*(void *)v119 + 40), self->_url);
  if (!v89)
  {
    v84 = 0;
    goto LABEL_8;
  }
  id v103 = 0;
  uint64_t v18 = +[NSJSONSerialization dataWithJSONObject:v89 options:0 error:&v103];
  id v19 = v103;
  v20 = v19;
  v84 = (void *)v18;
  if (v18)
  {

LABEL_8:
    __int16 v21 = +[NSMutableURLRequest requestWithURL:*(void *)(*(void *)v119 + 40) cachePolicy:1 timeoutInterval:30.0];
    [v21 setHTTPMethod:@"POST"];
    v92 = v21;
    id v90 = [objc_alloc((Class)NSMutableDictionary) initWithObjectsAndKeys:@"application/json", @"Content-Type", 0];
    if (v88) {
      [v90 addEntriesFromDictionary:v88];
    }
    if (self->_proprietaryHeaders)
    {
      if (NFIsSimulator()) {
        v81 = @"Simulator";
      }
      else {
        v81 = (__CFString *)MGCopyAnswer();
      }
      v80 = (void *)MGCopyAnswer();
      v79 = (void *)MGCopyAnswer();
      v22 = NFBuildVersion();
      id v78 = [objc_alloc((Class)NSString) initWithFormat:@"%@", v81];
      id v23 = [objc_alloc((Class)NSString) initWithFormat:@"%@;%@;%@", v80, v79, v22];
      int v24 = +[NSBundle bundleForClass:objc_opt_class()];
      v25 = [v24 infoDictionary];
      v26 = [v25 objectForKey:kCFBundleVersionKey];

      v27 = +[NSBundle mainBundle];
      v28 = [v27 infoDictionary];
      v29 = [v28 objectForKey:kCFBundleVersionKey];

      id v30 = objc_alloc((Class)NSString);
      v31 = [v24 bundleIdentifier];
      v32 = [v27 bundleIdentifier];
      id v33 = [v30 initWithFormat:@"%@/%@ (%@/%@)", v31, v26, v32, v29];

      id v34 = [objc_alloc((Class)NSString) initWithFormat:@"<%@> <%@> <%@>", v78, v23, v33];
      [v90 setObject:v34 forKey:@"X-Apple-Client-Info"];
    }
    [v92 setAllHTTPHeaderFields:v90];
    [v92 setHTTPBody:v84];
    if (byte_100060438)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
      {
        Class = object_getClass(self);
        if (class_isMetaClass(Class)) {
          uint64_t v37 = 43;
        }
        else {
          uint64_t v37 = 45;
        }
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        Logger(6, "%c[%{public}s %{public}s]:%i [TSM] Request Header: %@", v37, ClassName, Name, 300, v90);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v40 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = object_getClass(self);
        if (class_isMetaClass(v41)) {
          int v42 = 43;
        }
        else {
          int v42 = 45;
        }
        v43 = object_getClassName(self);
        v44 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)&uint8_t buf[4] = v42;
        *(_WORD *)v115 = 2082;
        *(void *)&v115[2] = v43;
        *(_WORD *)&v115[10] = 2082;
        *(void *)&v115[12] = v44;
        *(_WORD *)&v115[20] = 1024;
        *(_DWORD *)&v115[22] = 300;
        __int16 v116 = 2112;
        id v117 = v90;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Request Header: %@", buf, 0x2Cu);
      }

      sub_100031504("[TSM] Request Body: ", v89);
    }
    *(void *)buf = 0;
    *(void *)v115 = buf;
    *(void *)&v115[8] = 0x2020000000;
    *(void *)&v115[16] = 0;
    v45 = self;
    objc_sync_enter(v45);
    netSession = v45->_netSession;
    v94[0] = _NSConcreteStackBlock;
    v94[1] = 3221225472;
    v94[2] = sub_10003E8FC;
    v94[3] = &unk_100059088;
    v94[4] = v45;
    SEL v101 = a2;
    id v95 = v87;
    v97 = buf;
    v98 = &v104;
    v99 = v118;
    v102 = a8;
    v100 = &v110;
    id v47 = v86;
    id v96 = v47;
    uint64_t v48 = [(NSURLSession *)netSession dataTaskWithRequest:v92 completionHandler:v94];
    netSessionTask = v45->_netSessionTask;
    v45->_netSessionTask = (NSURLSessionTask *)v48;

    mach_continuous_time();
    [(NSURLSessionTask *)v45->_netSessionTask resume];

    objc_sync_exit(v45);
    if (v45->_netSessionTask) {
      dispatch_semaphore_wait((dispatch_semaphore_t)v45->_sem, 0xFFFFFFFFFFFFFFFFLL);
    }
    v50 = v45;
    objc_sync_enter(v50);
    v51 = v45->_netSessionTask;
    v45->_netSessionTask = 0;

    [(NSURLSession *)v45->_netSession flushWithCompletionHandler:&stru_1000590A8];
    objc_sync_exit(v50);

    if (a9) {
      *a9 = (double)(unint64_t)GetElapsedTimeInMillisecondsFromMachTime() / 1000.0;
    }
    if (byte_100060438 && [v47 count]) {
      sub_100031504("[TSM] Response Body: ", v47);
    }
    _Block_object_dispose(buf, 8);

    int v52 = 1;
    goto LABEL_46;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v53 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v53)
  {
    v54 = object_getClass(self);
    if (class_isMetaClass(v54)) {
      uint64_t v55 = 43;
    }
    else {
      uint64_t v55 = 45;
    }
    v56 = object_getClassName(self);
    v57 = sel_getName(a2);
    v53(3, "%c[%{public}s %{public}s]:%i JSON serialization failed: %{public}@", v55, v56, v57, 273, v20);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v58 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
  {
    v59 = object_getClass(self);
    if (class_isMetaClass(v59)) {
      int v60 = 43;
    }
    else {
      int v60 = 45;
    }
    v61 = object_getClassName(self);
    v62 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)&uint8_t buf[4] = v60;
    *(_WORD *)v115 = 2082;
    *(void *)&v115[2] = v61;
    *(_WORD *)&v115[10] = 2082;
    *(void *)&v115[12] = v62;
    *(_WORD *)&v115[20] = 1024;
    *(_DWORD *)&v115[22] = 273;
    __int16 v116 = 2114;
    id v117 = v20;
    _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i JSON serialization failed: %{public}@", buf, 0x2Cu);
  }

  int v52 = 0;
LABEL_46:
  _Block_object_dispose(v118, 8);

  if (v52)
  {
    if (a10) {
      *a10 = (id) v105[5];
    }
    if (v105[5])
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v63 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v63)
      {
        v64 = object_getClass(self);
        if (class_isMetaClass(v64)) {
          uint64_t v65 = 43;
        }
        else {
          uint64_t v65 = 45;
        }
        v66 = object_getClassName(self);
        v67 = sel_getName(a2);
        v68 = [(id)v105[5] description];
        v63(3, "%c[%{public}s %{public}s]:%i NetSessionError=%{public}@", v65, v66, v67, 454, v68);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v69 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
      {
        v70 = object_getClass(self);
        if (class_isMetaClass(v70)) {
          int v71 = 43;
        }
        else {
          int v71 = 45;
        }
        v72 = object_getClassName(self);
        v73 = sel_getName(a2);
        v74 = [(id)v105[5] description];
        *(_DWORD *)v118 = 67110146;
        *(_DWORD *)&v118[4] = v71;
        *(_WORD *)v119 = 2082;
        *(void *)&v119[2] = v72;
        *(_WORD *)&v119[10] = 2082;
        *(void *)&v119[12] = v73;
        *(_WORD *)&v119[20] = 1024;
        *(_DWORD *)&v119[22] = 454;
        *(_WORD *)&v119[26] = 2114;
        *(void *)&v119[28] = v74;
        _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i NetSessionError=%{public}@", v118, 0x2Cu);
      }
    }
    unsigned int v75 = *((_DWORD *)v111 + 6);
  }
  else
  {
    unsigned int v75 = 22;
  }
  _Block_object_dispose(&v104, 8);

  _Block_object_dispose(&v110, 8);
  return v75;
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v10 protectionSpace];
  dispatch_semaphore_t v13 = [v12 authenticationMethod];
  if ([v13 isEqualToString:NSURLAuthenticationMethodServerTrust])
  {
    id v14 = [v9 delegateQueue];
    v15 = [v14 underlyingQueue];

    if (!v15)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        v35 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v39 = 45;
        if (isMetaClass) {
          uint64_t v39 = 43;
        }
        v35(3, "%c[%{public}s %{public}s]:%i session delegate queue is nil", v39, ClassName, Name, 549);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v40 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v41 = object_getClass(self);
        if (class_isMetaClass(v41)) {
          int v42 = 43;
        }
        else {
          int v42 = 45;
        }
        LODWORD(result) = 67109890;
        HIDWORD(result) = v42;
        *(_WORD *)uint64_t v65 = 2082;
        *(void *)&v65[2] = object_getClassName(self);
        *(_WORD *)&v65[10] = 2082;
        *(void *)&v65[12] = sel_getName(a2);
        *(_WORD *)&v65[20] = 1024;
        *(_DWORD *)&v65[22] = 549;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i session delegate queue is nil", (uint8_t *)&result, 0x22u);
      }

      NFSimulateCrash();
      exit(-1);
    }
    v16 = (__SecTrust *)[v12 serverTrust];
    v17 = [v9 delegateQueue];
    uint64_t v18 = [v17 underlyingQueue];
    v49[1] = 3221225472;
    v49[0] = _NSConcreteStackBlock;
    v50 = sub_100040774;
    v51 = &unk_1000590F8;
    id v53 = v11;
    id v52 = v12;
    id v19 = v18;
    v20 = v49;
    __int16 v21 = v20;
    if (self)
    {
      if (v16)
      {
        result = _NSConcreteStackBlock;
        *(void *)uint64_t v65 = 3221225472;
        *(void *)&v65[8] = sub_10003FC10;
        *(void *)&v65[16] = &unk_1000590D0;
        *(void *)&v65[24] = self;
        v67 = "_trustPassesExtendedValidation:queue:completionHandler:";
        uint64_t v48 = v20;
        id v66 = v48;
        uint64_t v22 = SecTrustEvaluateAsyncWithError(v16, v19, &result);
        if (v22)
        {
          uint64_t v23 = v22;
          id v47 = v17;
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v24 = NFLogGetLogger();
          if (v24)
          {
            v25 = (void (*)(uint64_t, const char *, ...))v24;
            v26 = object_getClass(self);
            BOOL v44 = class_isMetaClass(v26);
            v45 = object_getClassName(self);
            v27 = sel_getName("_trustPassesExtendedValidation:queue:completionHandler:");
            uint64_t v28 = 45;
            if (v44) {
              uint64_t v28 = 43;
            }
            v25(3, "%c[%{public}s %{public}s]:%i Trust eval error: %d", v28, v45, v27, 536, v23);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v29 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            id v30 = object_getClass(self);
            if (class_isMetaClass(v30)) {
              int v31 = 43;
            }
            else {
              int v31 = 45;
            }
            int v46 = v31;
            v32 = object_getClassName(self);
            id v33 = sel_getName("_trustPassesExtendedValidation:queue:completionHandler:");
            *(_DWORD *)buf = 67110146;
            int v55 = v46;
            __int16 v56 = 2082;
            v57 = v32;
            __int16 v58 = 2082;
            v59 = v33;
            __int16 v60 = 1024;
            int v61 = 536;
            __int16 v62 = 1024;
            int v63 = v23;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Trust eval error: %d", buf, 0x28u);
          }

          v50((uint64_t)v48, 0);
          v17 = v47;
        }
      }
      else
      {
        v50((uint64_t)v20, 0);
      }
    }
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v11 + 2))(v11, 1, 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_netSessionTask, 0);
  objc_storeStrong((id *)&self->_netSession, 0);
  objc_storeStrong((id *)&self->_sem, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end