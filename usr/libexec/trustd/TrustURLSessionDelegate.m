@interface TrustURLSessionDelegate
- (BOOL)fetchNext:(id)a3 context:(id)a4;
- (NSMutableDictionary)_serverMap;
- (NSMutableDictionary)_taskContextMap;
- (NSMutableDictionary)_timerMap;
- (OS_dispatch_queue)queue;
- (TrustURLSessionDelegate)init;
- (id)addTask:(id)a3;
- (id)contextForTask:(id)a3;
- (id)createNextRequest:(id)a3 context:(id)a4;
- (id)createTimerForTask:(id)a3;
- (id)timeoutEntryForServer:(id)a3;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)addServer:(id)a3;
- (void)cancelTimer:(id)a3;
- (void)incrementCountForServer:(id)a3;
- (void)removeServer:(id)a3;
- (void)removeTask:(id)a3;
- (void)setQueue:(id)a3;
- (void)set_serverMap:(id)a3;
- (void)set_taskContextMap:(id)a3;
- (void)set_timerMap:(id)a3;
@end

@implementation TrustURLSessionDelegate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__timerMap, 0);
  objc_storeStrong((id *)&self->__serverMap, 0);
  objc_storeStrong((id *)&self->__taskContextMap, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)set_timerMap:(id)a3
{
}

- (NSMutableDictionary)_timerMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)set_serverMap:(id)a3
{
}

- (NSMutableDictionary)_serverMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)set_taskContextMap:(id)a3
{
}

- (NSMutableDictionary)_taskContextMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v7 = a5;
  v8 = (void (**)(id, uint64_t, void))a6;
  v9 = [v7 protectionSpace];
  v10 = [v9 authenticationMethod];
  unsigned int v11 = [v10 isEqualToString:NSURLAuthenticationMethodServerTrust];

  if (!v11)
  {
    v8[2](v8, 1, 0);
    goto LABEL_6;
  }
  v12 = [v7 protectionSpace];
  v13 = (__SecTrust *)[v12 serverTrust];

  if (!SecTrustSetNetworkFetchAllowed(v13, 0))
  {
    CFErrorRef error = 0;
    if (SecTrustEvaluateWithError(v13, &error))
    {
      uint64_t v14 = 1;
      goto LABEL_4;
    }
    v15 = sub_10001CB28("SecError");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFErrorRef v19 = error;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "failed to connect to server: %@", buf, 0xCu);
    }

    CFErrorRef v16 = error;
    if (error)
    {
      CFErrorRef error = 0;
      CFRelease(v16);
    }
  }
  uint64_t v14 = 2;
LABEL_4:
  v8[2](v8, v14, 0);
LABEL_6:
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v8 = a4;
  v9 = (void (**)(id, void))a7;
  v10 = sub_10001CB28("http");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v11 = [v8 originalRequest];
    v12 = [v11 URL];
    int v13 = 138412290;
    uint64_t v14 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "failed redirection for %@", (uint8_t *)&v13, 0xCu);
  }
  v9[2](v9, 0);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_opt_class();
  if (v11 == objc_opt_class())
  {
    id v67 = +[NSException exceptionWithName:@"AbstractClassException" reason:@"This is an abstract class. To use it, please subclass and override didCompleteWithError." userInfo:0];
    objc_exception_throw(v67);
  }
  v12 = [v9 originalRequest];
  int v13 = [v12 taskId];

  [(TrustURLSessionDelegate *)self cancelTimer:v13];
  uint64_t v14 = [(TrustURLSessionDelegate *)self contextForTask:v13];
  v15 = v14;
  if (v14)
  {
    [v14 setMaxAge:86400.0];
    CFErrorRef v16 = [v15 response];
    v73 = self;
    if (![v16 length])
    {

      goto LABEL_94;
    }
    v17 = [v9 response];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      CFErrorRef v19 = [v9 response];
      v20 = [v19 allHeaderFields];
      v21 = [v20 objectForKey:@"cache-control"];

      if (!v21)
      {
        v59 = 0;
        goto LABEL_93;
      }
      v68 = v15;
      v69 = v13;
      id v70 = v10;
      id v71 = v9;
      id v72 = v8;
      long long v84 = 0u;
      long long v85 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      *(_OWORD *)buffer = 0u;
      long long v79 = 0u;
      CFIndex Length = CFStringGetLength(v21);
      CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespace);
      CFStringRef theString = v21;
      uint64_t v89 = 0;
      CFIndex v90 = Length;
      CharactersPtr = CFStringGetCharactersPtr(v21);
      CStringPtr = 0;
      v87 = (UniChar *)CharactersPtr;
      if (!CharactersPtr) {
        CStringPtr = CFStringGetCStringPtr(v21, 0x600u);
      }
      CFIndex v26 = 0;
      int v27 = 0;
      CFStringRef v28 = 0;
      int64_t v91 = 0;
      int64_t v92 = 0;
      v88 = CStringPtr;
      CFStringRef v74 = v21;
      while (1)
      {
        result.location = 0xAAAAAAAAAAAAAAAALL;
        result.length = 0xAAAAAAAAAAAAAAAALL;
        if (v26 >= Length) {
          break;
        }
        int v75 = v27;
        CFStringRef v76 = v28;
        char v29 = 0;
        char v30 = 0;
        CFIndex v31 = -v26;
        CFIndex v32 = v26 + 64;
        uint64_t v33 = -1;
        int64_t v34 = v26;
        do
        {
          if ((unint64_t)v34 >= 4) {
            uint64_t v35 = 4;
          }
          else {
            uint64_t v35 = v34;
          }
          if (v34 < 0 || (CFIndex v36 = v90, v90 <= v34))
          {
            UniChar v37 = 0;
          }
          else
          {
            if (v87)
            {
              UniChar v37 = v87[v34 + v89];
            }
            else if (v88)
            {
              UniChar v37 = v88[v89 + v34];
            }
            else
            {
              if (v92 <= v34 || (int64_t v38 = v91, v91 > v34))
              {
                uint64_t v39 = v35 + v31;
                CFIndex v40 = v32 - v35;
                int64_t v41 = v34 - v35;
                CFIndex v42 = v41 + 64;
                if (v41 + 64 >= v90) {
                  CFIndex v42 = v90;
                }
                int64_t v91 = v41;
                int64_t v92 = v42;
                if (v90 >= v40) {
                  CFIndex v36 = v40;
                }
                v93.length = v36 + v39;
                v93.location = v41 + v89;
                CFStringGetCharacters(theString, v93, buffer);
                int64_t v38 = v91;
              }
              UniChar v37 = buffer[v34 - v38];
            }
            if (!(v30 & 1 | (v37 != 44))) {
              goto LABEL_40;
            }
          }
          int v43 = v37;
          int IsCharacterMember = CFCharacterSetIsCharacterMember(Predefined, v37);
          if (v29) {
            int64_t v45 = v34;
          }
          else {
            int64_t v45 = v33;
          }
          if (v29) {
            CFIndex v46 = v26;
          }
          else {
            CFIndex v46 = v34;
          }
          if (!IsCharacterMember)
          {
            v30 ^= v43 == 34;
            char v29 = 1;
            uint64_t v33 = v45;
            CFIndex v26 = v46;
          }
          ++v34;
          --v31;
          ++v32;
        }
        while (Length != v34);
        int64_t v34 = Length;
LABEL_40:
        BOOL v47 = __CFADD__(v33, 1);
        CFIndex v48 = v33 + 1;
        v21 = (__CFString *)v74;
        CFStringRef v28 = v76;
        int v27 = v75;
        if (v47) {
          goto LABEL_43;
        }
LABEL_44:
        if (v34 == Length) {
          int v49 = 1;
        }
        else {
          int v49 = v27;
        }
        if (!v28)
        {
          v95.length = v48 - v26;
          v95.location = v26;
          if (CFStringFindWithOptions(v21, @"max-age", v95, 9uLL, &result))
          {
            CFIndex v50 = result.length + result.location;
            if (result.length + result.location < v48)
            {
              CFStringRef v28 = 0;
              while (1)
              {
                if (v50 < 0 || (CFIndex v51 = v90, v90 <= v50))
                {
                  UniChar v54 = 0;
LABEL_57:
                  if (!CFCharacterSetIsCharacterMember(Predefined, v54)) {
                    goto LABEL_77;
                  }
                  goto LABEL_58;
                }
                v52 = v87;
                if (v87) {
                  break;
                }
                if (!v88)
                {
                  if (v92 <= v50 || (int64_t v56 = v91, v91 > v50))
                  {
                    CFIndex v57 = v50 - 4;
                    if ((unint64_t)v50 < 4) {
                      CFIndex v57 = 0;
                    }
                    if (v57 + 64 < v90) {
                      CFIndex v51 = v57 + 64;
                    }
                    int64_t v91 = v57;
                    int64_t v92 = v51;
                    v94.location = v89 + v57;
                    v94.length = v51 - v57;
                    CFStringGetCharacters(theString, v94, buffer);
                    int64_t v56 = v91;
                  }
                  CFIndex v53 = v50 - v56;
                  v52 = buffer;
                  goto LABEL_55;
                }
                UniChar v54 = v88[v89 + v50];
LABEL_62:
                if (v54 != 61) {
                  goto LABEL_57;
                }
                while (++v50 < v48)
                {
                  UniChar CharacterAtIndex = CFStringGetCharacterAtIndex(v21, v50);
                  if (!CFCharacterSetIsCharacterMember(Predefined, CharacterAtIndex))
                  {
                    if (v28) {
                      CFRelease(v28);
                    }
                    v96.length = v48 - v50;
                    v96.location = v50;
                    CFStringRef v28 = CFStringCreateWithSubstring(kCFAllocatorDefault, v21, v96);
                    break;
                  }
                }
LABEL_58:
                if (++v50 >= v48) {
                  goto LABEL_77;
                }
              }
              CFIndex v53 = v89 + v50;
LABEL_55:
              UniChar v54 = v52[v53];
              goto LABEL_62;
            }
          }
          CFStringRef v28 = 0;
        }
LABEL_77:
        if (v28) {
          BOOL v58 = (v49 & 1) == 0;
        }
        else {
          BOOL v58 = 0;
        }
        if (v58) {
          int v27 = 1;
        }
        else {
          int v27 = v49;
        }
        CFIndex v26 = v34 + 1;
        if (v27)
        {
          v59 = (__CFString *)v28;
          id v8 = v72;
          int v13 = v69;
          id v10 = v70;
          if (v59)
          {
            [(__CFString *)v59 doubleValue];
            id v9 = v71;
            v15 = v68;
            if (v60 >= 3600.0)
            {
              [(__CFString *)v59 doubleValue];
              if (v61 <= 604800.0)
              {
                [(__CFString *)v59 doubleValue];
                [v68 setMaxAge:];
              }
            }
          }
          else
          {
            id v9 = v71;
            v15 = v68;
          }
LABEL_93:

          goto LABEL_94;
        }
      }
      int64_t v34 = v26;
LABEL_43:
      CFIndex v48 = v34;
      goto LABEL_44;
    }
LABEL_94:
    v63 = [v9 originalRequest];
    v64 = [v63 URL];
    v62 = [v64 host];

    if (v10 && v62)
    {
      v65 = [v10 domain];
      if ([v65 isEqualToString:NSURLErrorDomain])
      {
        id v66 = [v10 code];

        if (v66 == (id)-1001)
        {
          [(TrustURLSessionDelegate *)v73 incrementCountForServer:v62];
          goto LABEL_103;
        }
      }
      else
      {
      }
    }
    else if (!v62)
    {
      goto LABEL_103;
    }
    [(TrustURLSessionDelegate *)v73 removeServer:v62];
    goto LABEL_103;
  }
  v62 = sub_10001CB28("http");
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buffer = 138412290;
    *(void *)&buffer[2] = v13;
    _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "failed to find task for taskId: %@", (uint8_t *)buffer, 0xCu);
  }
LABEL_103:
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v7 = a5;
  id v8 = [a4 originalRequest];
  id v9 = [v8 taskId];

  id v10 = [(TrustURLSessionDelegate *)self contextForTask:v9];
  uint64_t v11 = v10;
  if (v10)
  {
    v12 = [v10 response];

    if (!v12)
    {
      int v13 = +[NSMutableData data];
      [v11 setResponse:v13];
    }
    uint64_t v14 = [v11 response];
    [v14 appendData:v7];
  }
  else
  {
    uint64_t v14 = sub_10001CB28("http");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      CFErrorRef v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "failed to find task for taskId: %@", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (BOOL)fetchNext:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 numTasks];
  BOOL v9 = (unint64_t)v8 > 2;
  if ((unint64_t)v8 >= 3)
  {
    id v10 = sub_10001CB28("http");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v45 = (id)objc_opt_class();
      id v11 = v45;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Too many fetch %@ requests for this cert", buf, 0xCu);
    }
    goto LABEL_21;
  }
  v12 = (char *)[v7 URIix];
  int v13 = [v7 URIs];
  uint64_t v14 = (char *)[v13 count];

  if (v12 >= v14)
  {
    BOOL v9 = 1;
    goto LABEL_22;
  }
  BOOL v38 = v9;
  while (1)
  {
    int v15 = [v7 URIs];
    CFErrorRef v16 = [v15 objectAtIndexedSubscript:v12];

    v17 = [v16 host];
    v18 = [(TrustURLSessionDelegate *)self timeoutEntryForServer:v17];

    if (v18)
    {
      if ((unint64_t)[v18 timeoutCounter] >= 2)
      {
        CFErrorRef v19 = [v18 lastAttemptDate];
        [v19 timeIntervalSinceNow];
        double v21 = v20;

        if (v21 >= -60.0)
        {
          v24 = sub_10001CB28("http");
          if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_13;
          }
          v25 = [v16 host];
          *(_DWORD *)buf = 138412290;
          id v45 = v25;
          CFIndex v26 = v24;
          int v27 = "skipping host due to too many recent timeouts: %@";
          goto LABEL_12;
        }
      }
    }
    v22 = [v16 scheme];
    unsigned int v23 = [v22 isEqualToString:@"http"];

    if (v23) {
      break;
    }
    v24 = sub_10001CB28("http");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = [v16 scheme];
      *(_DWORD *)buf = 138412290;
      id v45 = v25;
      CFIndex v26 = v24;
      int v27 = "skipping unsupported scheme %@";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v27, buf, 0xCu);
    }
LABEL_13:

    ++v12;
    CFStringRef v28 = [v7 URIs];
    char v29 = (char *)[v28 count];

    if (v12 >= v29)
    {
      BOOL v9 = 1;
      goto LABEL_22;
    }
  }
  [v7 setURIix:v12 + 1];
  [v7 setNumTasks:((char *)[v7 numTasks] + 1)];
  char v30 = [(TrustURLSessionDelegate *)self createNextRequest:v16 context:v7];
  CFIndex v31 = [v6 dataTaskWithRequest:v30];

  CFIndex v32 = [v31 originalRequest];
  uint64_t v33 = [v32 taskId];
  int64_t v34 = [(TrustURLSessionDelegate *)self createTimerForTask:v33];

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100059E9C;
  handler[3] = &unk_100081410;
  id v35 = v31;
  id v40 = v35;
  id v10 = v16;
  int64_t v41 = v10;
  CFIndex v42 = self;
  id v43 = v6;
  dispatch_source_set_event_handler(v34, handler);
  dispatch_resume(v34);
  [v35 resume];
  CFIndex v36 = sub_10001CB28("http");
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v45 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "request for uri: %@", buf, 0xCu);
  }

  BOOL v9 = v38;
LABEL_21:

LABEL_22:
  return v9;
}

- (id)createNextRequest:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = +[NSURLComponents componentsWithURL:a3 resolvingAgainstBaseURL:1];
  id v8 = [v7 host];
  unsigned int v9 = [v8 isEqualToString:@"ocsp-uat.corp.apple.com"];

  if (v9)
  {
    [v7 setScheme:@"https"];
  }
  else
  {
    id v10 = [v7 host];
    unsigned int v11 = [v10 isEqualToString:@"ocsp.apple.com"];

    if (v11)
    {
      [v7 setScheme:@"https"];
      [v7 setHost:@"ocsp2.apple.com"];
    }
  }
  v12 = [v7 URL];
  int v13 = [(TrustURLSessionDelegate *)self addTask:v6];
  uint64_t v14 = +[NSMutableURLRequest requestWithURL:v12];
  int v15 = [v13 UUIDString];
  [v14 addValue:v15 forHTTPHeaderField:@"X-Apple-Request-UUID"];

  id v16 = [v6 attribution];
  [v14 setAttribution:v16];

  return v14;
}

- (id)timeoutEntryForServer:(id)a3
{
  id v4 = a3;
  v5 = [(TrustURLSessionDelegate *)self _serverMap];
  objc_sync_enter(v5);
  id v6 = [(TrustURLSessionDelegate *)self _serverMap];
  id v7 = [v6 objectForKeyedSubscript:v4];

  objc_sync_exit(v5);

  return v7;
}

- (void)incrementCountForServer:(id)a3
{
  unsigned int v9 = (__CFString *)a3;
  if ([(__CFString *)v9 isEqualToString:@"ocsp2.apple.com"])
  {

    unsigned int v9 = @"ocsp.apple.com";
  }
  id v4 = [(TrustURLSessionDelegate *)self _serverMap];
  objc_sync_enter(v4);
  v5 = [(TrustURLSessionDelegate *)self _serverMap];
  id v6 = [v5 objectForKeyedSubscript:v9];

  if (v6)
  {
    [v6 setTimeoutCounter:((char *)[v6 timeoutCounter] + 1)];
    id v7 = +[NSDate date];
    [v6 setLastAttemptDate:v7];

    id v8 = [(TrustURLSessionDelegate *)self _serverMap];
    [v8 setObject:v6 forKeyedSubscript:v9];
  }
  else
  {
    [(TrustURLSessionDelegate *)self addServer:v9];
  }

  objc_sync_exit(v4);
}

- (void)addServer:(id)a3
{
  id v7 = a3;
  id v4 = objc_alloc_init(TimeoutEntry);
  v5 = [(TrustURLSessionDelegate *)self _serverMap];
  objc_sync_enter(v5);
  id v6 = [(TrustURLSessionDelegate *)self _serverMap];
  [v6 setObject:v4 forKeyedSubscript:v7];

  objc_sync_exit(v5);
}

- (void)removeServer:(id)a3
{
  id v6 = (__CFString *)a3;
  if ([(__CFString *)v6 isEqualToString:@"ocsp2.apple.com"])
  {

    id v6 = @"ocsp.apple.com";
  }
  id v4 = [(TrustURLSessionDelegate *)self _serverMap];
  objc_sync_enter(v4);
  v5 = [(TrustURLSessionDelegate *)self _serverMap];
  [v5 removeObjectForKey:v6];

  objc_sync_exit(v4);
}

- (id)createTimerForTask:(id)a3
{
  id v4 = a3;
  v5 = [(TrustURLSessionDelegate *)self queue];
  id v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v5);

  double v7 = 3.0;
  if (SecIsInternalRelease())
  {
    Boolean keyExistsAndHasValidFormat = 0;
    CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"DefaultHTTPTimeout", @"com.apple.security", &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
    {
      uint64_t v9 = AppIntegerValue;
      id v10 = sub_10001CB28("http");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v17 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Retrieved DefaultHTTPTimeout setting for %ld seconds", buf, 0xCu);
      }

      double v7 = (double)v9;
    }
  }
  dispatch_time_t v11 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
  dispatch_source_set_timer(v6, v11, 0xFFFFFFFFFFFFFFFFLL, 0);
  v12 = [(TrustURLSessionDelegate *)self _timerMap];
  objc_sync_enter(v12);
  [(TrustURLSessionDelegate *)self cancelTimer:v4];
  int v13 = [(TrustURLSessionDelegate *)self _timerMap];
  [v13 setObject:v6 forKey:v4];

  objc_sync_exit(v12);

  return v6;
}

- (void)cancelTimer:(id)a3
{
  id v8 = a3;
  id v4 = [(TrustURLSessionDelegate *)self _timerMap];
  objc_sync_enter(v4);
  v5 = [(TrustURLSessionDelegate *)self _timerMap];
  id v6 = [v5 objectForKey:v8];

  if (v6)
  {
    dispatch_source_cancel(v6);
    double v7 = [(TrustURLSessionDelegate *)self _timerMap];
    [v7 removeObjectForKey:v8];
  }
  objc_sync_exit(v4);
}

- (id)addTask:(id)a3
{
  id v4 = a3;
  v5 = +[NSUUID UUID];
  id v6 = [(TrustURLSessionDelegate *)self _taskContextMap];
  objc_sync_enter(v6);
  double v7 = [(TrustURLSessionDelegate *)self _taskContextMap];
  [v7 setObject:v4 forKey:v5];

  objc_sync_exit(v6);

  return v5;
}

- (void)removeTask:(id)a3
{
  id v6 = a3;
  id v4 = [(TrustURLSessionDelegate *)self _taskContextMap];
  objc_sync_enter(v4);
  v5 = [(TrustURLSessionDelegate *)self _taskContextMap];
  [v5 removeObjectForKey:v6];

  objc_sync_exit(v4);
}

- (id)contextForTask:(id)a3
{
  id v4 = a3;
  v5 = [(TrustURLSessionDelegate *)self _taskContextMap];
  objc_sync_enter(v5);
  id v6 = [(TrustURLSessionDelegate *)self _taskContextMap];
  double v7 = [v6 objectForKey:v4];

  objc_sync_exit(v5);

  return v7;
}

- (TrustURLSessionDelegate)init
{
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    id v10 = +[NSException exceptionWithName:@"AbstractClassException" reason:@"This is an abstract class. To use it, please subclass." userInfo:0];
    objc_exception_throw(v10);
  }
  id v4 = +[NSMutableDictionary dictionary];
  [(TrustURLSessionDelegate *)self set_taskContextMap:v4];

  v5 = +[NSMutableDictionary dictionary];
  [(TrustURLSessionDelegate *)self set_serverMap:v5];

  id v6 = +[NSMutableDictionary dictionary];
  [(TrustURLSessionDelegate *)self set_timerMap:v6];

  double v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v8 = dispatch_queue_create("com.apple.trustd.TrustURLSessionDelegate", v7);
  [(TrustURLSessionDelegate *)self setQueue:v8];

  v11.receiver = self;
  v11.super_class = (Class)TrustURLSessionDelegate;
  return [(TrustURLSessionDelegate *)&v11 init];
}

@end