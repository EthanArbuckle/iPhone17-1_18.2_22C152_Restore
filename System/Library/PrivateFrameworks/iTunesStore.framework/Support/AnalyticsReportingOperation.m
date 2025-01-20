@interface AnalyticsReportingOperation
- (AnalyticsReportingOperation)init;
- (AnalyticsReportingOperation)initWithController:(id)a3;
- (BOOL)_runForReportingURL:(id)a3 suppressUserInfo:(BOOL)a4 error:(id *)a5;
- (BOOL)_runSSMetrics;
- (BOOL)_shouldBackoffAfterError:(id)a3;
- (BOOL)_shouldClearEventsDespiteError:(id)a3;
- (id)_path;
- (id)_signatureWithData:(id)a3 error:(id *)a4;
- (id)finishBlock;
- (id)operation:(id)a3 needNewBodyStream:(id)a4;
- (id)uniqueKey;
- (void)_destroyOutputFile:(id)a3;
- (void)_runAMSMetrics;
- (void)run;
- (void)setFinishBlock:(id)a3;
@end

@implementation AnalyticsReportingOperation

- (AnalyticsReportingOperation)initWithController:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AnalyticsReportingOperation;
  v5 = [(AnalyticsReportingOperation *)&v14 init];
  if (v5)
  {
    +[NSDate timeIntervalSinceReferenceDate];
    v5->_insertTimestamp = vcvtpd_s64_f64(v6);
    if (v4) {
      v7 = (SSMetricsEventController *)v4;
    }
    else {
      v7 = (SSMetricsEventController *)objc_alloc_init((Class)SSMetricsEventController);
    }
    controller = v5->_controller;
    v5->_controller = v7;

    v15[0] = CPSharedResourcesDirectory();
    v15[1] = @"Library";
    v15[2] = @"Caches";
    v15[3] = @"com.apple.itunesstored";
    v15[4] = @"AnalyticsReportingOperation";
    v9 = +[NSArray arrayWithObjects:v15 count:5];
    uint64_t v10 = +[NSString pathWithComponents:v9];
    directory = v5->_directory;
    v5->_directory = (NSString *)v10;

    id v12 = objc_alloc_init((Class)NSFileManager);
    [v12 createDirectoryAtPath:v5->_directory withIntermediateDirectories:1 attributes:0 error:0];
  }
  return v5;
}

- (AnalyticsReportingOperation)init
{
  return [(AnalyticsReportingOperation *)self initWithController:0];
}

- (id)finishBlock
{
  [(AnalyticsReportingOperation *)self lock];
  id v3 = [self->_finishBlock copy];
  [(AnalyticsReportingOperation *)self unlock];
  id v4 = objc_retainBlock(v3);

  return v4;
}

- (void)setFinishBlock:(id)a3
{
  id v6 = a3;
  [(AnalyticsReportingOperation *)self lock];
  if (self->_finishBlock != v6)
  {
    id v4 = [v6 copy];
    id finishBlock = self->_finishBlock;
    self->_id finishBlock = v4;
  }
  [(AnalyticsReportingOperation *)self unlock];
}

- (void)run
{
  id v3 = +[AMSMetrics bagSubProfile];
  id v4 = +[AMSMetrics bagSubProfileVersion];
  v5 = +[AMSBag bagForProfile:v3 profileVersion:v4];

  if (_os_feature_enabled_impl() && objc_msgSend(v5, "asd_iTunesStoreMetricsIsEnabled"))
  {
    [(AnalyticsReportingOperation *)self _runAMSMetrics];
    BOOL v6 = 0;
  }
  else
  {
    BOOL v6 = [(AnalyticsReportingOperation *)self _runSSMetrics];
  }
  unsigned int v7 = [(SSMetricsEventController *)self->_controller deleteReportedEvents];
  v8 = +[SSLogConfig sharedDaemonConfig];
  if (!v8)
  {
    v8 = +[SSLogConfig sharedConfig];
  }
  unsigned int v9 = [v8 shouldLog];
  if ([v8 shouldLogToDisk]) {
    int v10 = v9 | 2;
  }
  else {
    int v10 = v9;
  }
  v11 = [v8 OSLogObject];
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
    v10 &= 2u;
  }
  if (v10)
  {
    *(_DWORD *)v26 = 138412546;
    *(void *)&v26[4] = objc_opt_class();
    *(_WORD *)&v26[12] = 1024;
    *(_DWORD *)&v26[14] = v7;
    id v12 = *(id *)&v26[4];
    LODWORD(v25) = 18;
    v24 = v26;
    v13 = (void *)_os_log_send_and_compose_impl();

    if (!v13) {
      goto LABEL_16;
    }
    v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, v26, v25, *(_OWORD *)v26, *(void *)&v26[16]);
    free(v13);
    v24 = v11;
    SSFileLog();
  }

LABEL_16:
  unsigned int v14 = [(SSMetricsEventController *)self->_controller deleteEventsInsertedBefore:self->_insertTimestamp - 172800];
  v15 = +[SSLogConfig sharedDaemonConfig];
  if (!v15)
  {
    v15 = +[SSLogConfig sharedConfig];
  }
  unsigned int v16 = objc_msgSend(v15, "shouldLog", v24);
  if ([v15 shouldLogToDisk]) {
    int v17 = v16 | 2;
  }
  else {
    int v17 = v16;
  }
  v18 = [v15 OSLogObject];
  if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
    v17 &= 2u;
  }
  if (v17)
  {
    v19 = objc_opt_class();
    *(_DWORD *)v26 = 138412802;
    *(void *)&v26[4] = v19;
    *(_WORD *)&v26[12] = 2048;
    *(void *)&v26[14] = 172800;
    *(_WORD *)&v26[22] = 1024;
    unsigned int v27 = v14;
    id v20 = v19;
    LODWORD(v25) = 28;
    v21 = (void *)_os_log_send_and_compose_impl();

    if (!v21) {
      goto LABEL_27;
    }
    v18 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v21, 4, v26, v25);
    free(v21);
    SSFileLog();
  }

LABEL_27:
  [(AnalyticsReportingOperation *)self setSuccess:1];
  uint64_t v22 = [(AnalyticsReportingOperation *)self finishBlock];
  v23 = (void *)v22;
  if (v22)
  {
    (*(void (**)(uint64_t, BOOL))(v22 + 16))(v22, v6);
    [(AnalyticsReportingOperation *)self setFinishBlock:0];
  }
}

- (id)uniqueKey
{
  return @"com.apple.itunesstored.AnalyticsReportingOperation";
}

- (id)operation:(id)a3 needNewBodyStream:(id)a4
{
  v5 = [(AnalyticsReportingOperation *)self _path];
  BOOL v6 = +[NSFileManager defaultManager];
  unsigned int v7 = [v6 fileExistsAtPath:self->_path];

  if (v7) {
    id v8 = [objc_alloc((Class)NSInputStream) initWithFileAtPath:self->_path];
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (void)_destroyOutputFile:(id)a3
{
  id v4 = a3;
  if (!CFPreferencesGetAppBooleanValue(@"DisableMetricsFileCleanup", kSSUserDefaultsIdentifier, 0))
  {
    id v3 = objc_alloc_init((Class)NSFileManager);
    [v3 removeItemAtPath:v4 error:0];
  }
}

- (id)_path
{
  path = self->_path;
  if (!path)
  {
    id v4 = +[NSUUID UUID];
    v5 = v4;
    if (v4)
    {
      id v6 = [v4 UUIDString];
    }
    else
    {
      id v6 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%p", self);
    }
    unsigned int v7 = v6;
    id v8 = [(NSString *)self->_directory stringByAppendingPathComponent:v6];
    unsigned int v9 = [v8 stringByAppendingPathExtension:@"gzip"];
    int v10 = self->_path;
    self->_path = v9;

    path = self->_path;
  }

  return path;
}

- (BOOL)_runForReportingURL:(id)a3 suppressUserInfo:(BOOL)a4 error:(id *)a5
{
  BOOL v70 = a4;
  id v72 = a3;
  id v67 = 0;
  char v65 = 1;
  uint64_t v66 = SSHTTPHeaderXAppleActionSignature;
  while (1)
  {
    id v6 = [objc_alloc((Class)SSMetricsEventReportingSession) initWithReportingURL:v72 insertTimestamp:self->_insertTimestamp suppressUserInfo:v70 eventController:self->_controller];
    if (([v6 anyUnreportedEvents] & 1) == 0) {
      break;
    }
    unsigned int v7 = [(AnalyticsReportingOperation *)self _path];
    id v8 = 0;
    unsigned int v9 = 1;
    do
    {
      [(AnalyticsReportingOperation *)self _destroyOutputFile:v7];
      id v10 = [objc_alloc((Class)SSGzipOutputStream) initToFileAtPath:v7 append:0];

      [v10 open];
      v11 = [v6 writeEventsToStream:v10 uncompressedMaxSize:0x80000];
      [v10 close];
      char v12 = 1;
      if (v11) {
        break;
      }
      id v8 = v10;
    }
    while (v9++ <= 1);
    if (!v11)
    {
      v53 = +[SSLogConfig sharedDaemonConfig];
      if (!v53)
      {
        v53 = +[SSLogConfig sharedConfig];
      }
      unsigned int v54 = [v53 shouldLog];
      if ([v53 shouldLogToDisk]) {
        int v55 = v54 | 2;
      }
      else {
        int v55 = v54;
      }
      v56 = [v53 OSLogObject];
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
        int v57 = v55;
      }
      else {
        int v57 = v55 & 2;
      }
      if (v57)
      {
        v58 = objc_opt_class();
        int v77 = 138412290;
        v78 = v58;
        id v59 = v58;
        LODWORD(v63) = 12;
        v62 = &v77;
        v60 = (void *)_os_log_send_and_compose_impl();

        if (v60)
        {
          v56 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v60, 4, &v77, v63);
          free(v60);
          v62 = (int *)v56;
          SSFileLog();
          goto LABEL_65;
        }
      }
      else
      {
LABEL_65:
      }
LABEL_67:
      char v12 = 0;
      goto LABEL_68;
    }
    id v14 = [v10 streamContentLength];

    if (!v14) {
      goto LABEL_67;
    }
    id v15 = v14;
    unsigned int v16 = +[SSLogConfig sharedDaemonConfig];
    if (!v16)
    {
      unsigned int v16 = +[SSLogConfig sharedConfig];
    }
    unsigned int v17 = [v16 shouldLog];
    unsigned int v18 = [v16 shouldLogToDisk];
    v19 = [v16 OSLogObject];
    id v20 = v19;
    if (v18) {
      v17 |= 2u;
    }
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      v17 &= 2u;
    }
    if (!v17) {
      goto LABEL_18;
    }
    v21 = objc_opt_class();
    int v77 = 138412546;
    v78 = v21;
    __int16 v79 = 2112;
    id v80 = v72;
    id v22 = v21;
    LODWORD(v63) = 22;
    v23 = (void *)_os_log_send_and_compose_impl();

    if (v23)
    {
      id v20 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v23, 4, &v77, v63);
      free(v23);
      SSFileLog();
LABEL_18:
    }
    id v24 = [objc_alloc((Class)SSMutableURLRequestProperties) initWithURL:v72];
    [v24 setAllowedRetryCount:0];
    [v24 setCachePolicy:1];
    [v24 setNetworkServiceType:3];
    [v24 setShouldDecodeResponse:0];
    [v24 setTimeoutInterval:10.0];
    [v24 setValue:@"gzip" forHTTPHeaderField:@"Content-Encoding"];
    [v24 setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    contexta = v24;
    v71 = [v6 sessionCanaryIdentifier];
    if (v71 && [v71 length]) {
      [v24 setValue:v71 forHTTPHeaderField:@"X-Apple-Canary-Id"];
    }
    uint64_t v25 = +[NSString stringWithFormat:@"%d", v15];
    [contexta setValue:v25 forHTTPHeaderField:@"Content-Length"];

    [contexta setHTTPMethod:@"POST"];
    if (SSDebugShouldLogFullMetricsRequest()
      && ([v72 absoluteString],
          v26 = objc_claimAutoreleasedReturnValue(),
          unsigned int v27 = [v26 containsString:@"xp.apple.com"],
          v26,
          v27))
    {
      id v28 = +[NSData dataWithContentsOfFile:v7];
      [contexta setHTTPBody:v28];
    }
    else
    {
      id v28 = [objc_alloc((Class)NSInputStream) initWithFileAtPath:v7];
      [contexta setHTTPBodyStream:v28];
    }

    v29 = [(AnalyticsReportingOperation *)self _signatureWithData:v11 error:0];
    v30 = v29;
    if (v29)
    {
      v31 = [v29 base64EncodedStringWithOptions:0];
      [contexta setValue:v31 forHTTPHeaderField:v66];
    }
    id v32 = objc_alloc_init((Class)ISStoreURLOperation);
    [v32 setDelegate:self];
    [v32 setShouldSuppressUserInfo:v70];
    [v32 setRequestProperties:contexta];
    [v32 setUrlKnownToBeTrusted:1];
    id v76 = 0;
    [(AnalyticsReportingOperation *)self runSubOperation:v32 returningError:&v76];
    v68 = v32;
    id v33 = v76;
    v69 = v33;
    if (v33
      && ![(AnalyticsReportingOperation *)self _shouldClearEventsDespiteError:v33])
    {
      v45 = +[SSLogConfig sharedDaemonConfig];
      if (!v45)
      {
        v45 = +[SSLogConfig sharedConfig];
      }
      unsigned int v46 = [v45 shouldLog];
      unsigned int v47 = [v45 shouldLogToDisk];
      v48 = [v45 OSLogObject];
      v49 = v48;
      if (v47) {
        v46 |= 2u;
      }
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        v46 &= 2u;
      }
      if (v46)
      {
        v50 = objc_opt_class();
        int v77 = 138412546;
        v78 = v50;
        __int16 v79 = 2112;
        id v80 = v69;
        id v51 = v50;
        LODWORD(v63) = 22;
        v62 = &v77;
        v52 = (void *)_os_log_send_and_compose_impl();

        if (v52)
        {
          v49 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v52, 4, &v77, v63);
          free(v52);
          v62 = (int *)v49;
          SSFileLog();
          goto LABEL_51;
        }
      }
      else
      {
LABEL_51:
      }
      char v12 = 0;
      char v65 = 0;
      v35 = v67;
      id v67 = v69;
      goto LABEL_53;
    }
    unsigned int v34 = [v6 markEventsAsReported];
    v35 = +[SSLogConfig sharedDaemonConfig];
    if (!v35)
    {
      v35 = +[SSLogConfig sharedConfig];
    }
    unsigned int v36 = [v35 shouldLog];
    unsigned int v37 = [v35 shouldLogToDisk];
    v38 = [v35 OSLogObject];
    v39 = v38;
    if (v37) {
      int v40 = v36 | 2;
    }
    else {
      int v40 = v36;
    }
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO)) {
      int v41 = v40;
    }
    else {
      int v41 = v40 & 2;
    }
    if (!v41) {
      goto LABEL_41;
    }
    v42 = objc_opt_class();
    int v77 = 138412546;
    v78 = v42;
    __int16 v79 = 1024;
    LODWORD(v80) = v34;
    id v43 = v42;
    LODWORD(v63) = 18;
    v62 = &v77;
    v44 = (void *)_os_log_send_and_compose_impl();

    if (v44)
    {
      v39 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v44, 4, &v77, v63);
      free(v44);
      v62 = (int *)v39;
      SSFileLog();
LABEL_41:
    }
LABEL_53:

LABEL_68:
    -[AnalyticsReportingOperation _destroyOutputFile:](self, "_destroyOutputFile:", v7, v62);

    if ((v12 & 1) == 0) {
      goto LABEL_71;
    }
  }

LABEL_71:
  if (a5 && (v65 & 1) == 0) {
    *a5 = v67;
  }

  return v65 & 1;
}

- (void)_runAMSMetrics
{
  v2 = [(SSMetricsEventController *)self->_controller unreportedEventsSince:self->_insertTimestamp];
  id v3 = +[AMSMetrics bagSubProfile];
  id v4 = +[AMSMetrics bagSubProfileVersion];
  uint64_t v5 = +[AMSBag bagForProfile:v3 profileVersion:v4];

  id v28 = (void *)v5;
  id v6 = [objc_alloc((Class)AMSMetrics) initWithContainerID:@"com.apple.AppleMediaServices" bag:v5];
  id v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v2, "count"));
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v2;
  id v8 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v31;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(obj);
        }
        char v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v13 = objc_alloc((Class)AMSMetricsEvent);
        id v14 = [v12 reportingDictionary];
        id v15 = [v13 initWithUnderlyingDictionary:v14];

        [v6 enqueueEvent:v15];
        unsigned int v16 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v12 persistentID]);
        [v7 addObject:v16];
      }
      id v9 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v9);
  }

  unsigned int v17 = [(SSMetricsEventController *)self->_controller markEventsAsReported:v7];
  unsigned int v18 = +[SSLogConfig sharedDaemonConfig];
  if (!v18)
  {
    unsigned int v18 = +[SSLogConfig sharedConfig];
  }
  unsigned int v19 = [v18 shouldLog];
  if ([v18 shouldLogToDisk]) {
    int v20 = v19 | 2;
  }
  else {
    int v20 = v19;
  }
  v21 = [v18 OSLogObject];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
    int v22 = v20;
  }
  else {
    int v22 = v20 & 2;
  }
  if (!v22) {
    goto LABEL_19;
  }
  v23 = objc_opt_class();
  int v34 = 138412546;
  v35 = v23;
  __int16 v36 = 1024;
  unsigned int v37 = v17;
  id v24 = v23;
  LODWORD(v26) = 18;
  uint64_t v25 = (void *)_os_log_send_and_compose_impl();

  if (v25)
  {
    v21 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v25, 4, &v34, v26);
    free(v25);
    SSFileLog();
LABEL_19:
  }
}

- (BOOL)_runSSMetrics
{
  [(SSMetricsEventController *)self->_controller unreportedEventURLsSince:self->_insertTimestamp];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v3)
  {
    char v38 = 0;
    uint64_t v40 = *(void *)v44;
    while (1)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v44 != v40) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        id v6 = +[SSLogConfig sharedDaemonConfig];
        if (!v6)
        {
          id v6 = +[SSLogConfig sharedConfig];
        }
        unsigned int v7 = [v6 shouldLog];
        unsigned int v8 = [v6 shouldLogToDisk];
        id v9 = [v6 OSLogObject];
        uint64_t v10 = v9;
        if (v8) {
          v7 |= 2u;
        }
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
          v7 &= 2u;
        }
        if (!v7) {
          goto LABEL_15;
        }
        v11 = objc_opt_class();
        int v47 = 138412546;
        v48 = v11;
        __int16 v49 = 2112;
        uint64_t v50 = v5;
        id v12 = v11;
        LODWORD(v37) = 22;
        __int16 v36 = &v47;
        id v13 = (void *)_os_log_send_and_compose_impl();

        if (v13)
        {
          uint64_t v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, &v47, v37);
          free(v13);
          __int16 v36 = (int *)v10;
          SSFileLog();
LABEL_15:
        }
        id v42 = 0;
        unsigned __int8 v14 = [(AnalyticsReportingOperation *)self _runForReportingURL:v5 suppressUserInfo:0 error:&v42];
        id v15 = v42;
        if ((v14 & 1) == 0
          && [(AnalyticsReportingOperation *)self _shouldBackoffAfterError:v15])
        {
          unsigned int v16 = +[SSLogConfig sharedDaemonConfig];
          if (!v16)
          {
            unsigned int v16 = +[SSLogConfig sharedConfig];
          }
          unsigned int v17 = objc_msgSend(v16, "shouldLog", v36);
          unsigned int v18 = [v16 shouldLogToDisk];
          unsigned int v19 = [v16 OSLogObject];
          int v20 = v19;
          if (v18) {
            v17 |= 2u;
          }
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
            v17 &= 2u;
          }
          if (v17)
          {
            v21 = objc_opt_class();
            int v47 = 138412546;
            v48 = v21;
            __int16 v49 = 2112;
            uint64_t v50 = v5;
            id v22 = v21;
            LODWORD(v37) = 22;
            __int16 v36 = &v47;
            v23 = (void *)_os_log_send_and_compose_impl();

            if (v23)
            {
              int v20 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v23, 4, &v47, v37);
              free(v23);
              __int16 v36 = (int *)v20;
              SSFileLog();
              goto LABEL_27;
            }
          }
          else
          {
LABEL_27:
          }
          char v38 = 1;
        }
        id v41 = v15;
        unsigned __int8 v24 = -[AnalyticsReportingOperation _runForReportingURL:suppressUserInfo:error:](self, "_runForReportingURL:suppressUserInfo:error:", v5, 1, &v41, v36);
        id v25 = v41;

        if ((v24 & 1) == 0
          && [(AnalyticsReportingOperation *)self _shouldBackoffAfterError:v25])
        {
          uint64_t v26 = +[SSLogConfig sharedDaemonConfig];
          if (!v26)
          {
            uint64_t v26 = +[SSLogConfig sharedConfig];
          }
          unsigned int v27 = [v26 shouldLog];
          unsigned int v28 = [v26 shouldLogToDisk];
          v29 = [v26 OSLogObject];
          long long v30 = v29;
          if (v28) {
            v27 |= 2u;
          }
          if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
            v27 &= 2u;
          }
          if (v27)
          {
            long long v31 = objc_opt_class();
            int v47 = 138412546;
            v48 = v31;
            __int16 v49 = 2112;
            uint64_t v50 = v5;
            id v32 = v31;
            LODWORD(v37) = 22;
            v35 = &v47;
            long long v33 = (void *)_os_log_send_and_compose_impl();

            if (v33)
            {
              long long v30 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v33, 4, &v47, v37);
              free(v33);
              v35 = (int *)v30;
              SSFileLog();
              goto LABEL_40;
            }
          }
          else
          {
LABEL_40:
          }
          char v38 = 1;
        }
      }
      id v3 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
      if (!v3) {
        goto LABEL_46;
      }
    }
  }
  char v38 = 0;
LABEL_46:

  return v38 & 1;
}

- (BOOL)_shouldBackoffAfterError:(id)a3
{
  id v3 = [a3 userInfo];
  id v4 = [v3 objectForKey:SSErrorHTTPStatusCodeKey];

  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && (char *)[v4 integerValue] - 500 < (char *)0x64;

  return v5;
}

- (BOOL)_shouldClearEventsDespiteError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 userInfo];
  BOOL v5 = [v4 objectForKey:SSErrorHTTPStatusCodeKey];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char IsEqual = (char *)[v5 integerValue] - 400 < (char *)0x64;
  }
  else {
    char IsEqual = ISErrorIsEqual();
  }

  return IsEqual;
}

- (id)_signatureWithData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v23 = 0;
  unsigned __int8 v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = sub_1001B49D0;
  unsigned int v27 = sub_1001B49E0;
  id v28 = 0;
  uint64_t v17 = 0;
  unsigned int v18 = &v17;
  uint64_t v19 = 0x3032000000;
  int v20 = sub_1001B49D0;
  v21 = sub_1001B49E0;
  id v22 = 0;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  unsigned int v7 = +[SSVFairPlaySAPSession sharedDefaultSession];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001B49E8;
  v13[3] = &unk_1003A9200;
  id v15 = &v23;
  unsigned int v16 = &v17;
  unsigned int v8 = v6;
  unsigned __int8 v14 = v8;
  [v7 signData:v5 completionBlock:v13];
  dispatch_time_t v9 = dispatch_time(0, 60000000000);
  dispatch_semaphore_wait(v8, v9);
  uint64_t v10 = (void *)v18[5];
  if (a4 && !v10)
  {
    *a4 = (id) v24[5];
    uint64_t v10 = (void *)v18[5];
  }
  id v11 = v10;

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong(&self->_finishBlock, 0);
  objc_storeStrong((id *)&self->_directory, 0);

  objc_storeStrong((id *)&self->_controller, 0);
}

@end