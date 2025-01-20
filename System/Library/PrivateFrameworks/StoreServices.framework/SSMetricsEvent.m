@interface SSMetricsEvent
+ (id)_globalCanaryLock;
+ (id)globalEventCanary;
+ (void)setGlobalEventCanary:(id)a3;
- (BOOL)isBlacklistedByConfiguration:(id)a3;
- (BOOL)isFieldBlacklistEnabled;
- (BOOL)requiresDiagnosticSendingPermission;
- (BOOL)shouldSuppressDSIDHeader;
- (BOOL)shouldSuppressUserInfo;
- (NSString)eventType;
- (double)timeIntervalFromMilliseconds:(id)a3;
- (id)_dictionaryRepresentationOfBody;
- (id)allTableEntityPropertiesPermittedByConfiguration:(id)a3;
- (id)allTableEntityPropertiesPermittedByConfiguration:(id)a3 externalValues:(id)a4;
- (id)decorateReportingURL:(id)a3;
- (id)millisecondsFromTimeInterval:(double)a3;
@end

@implementation SSMetricsEvent

+ (id)globalEventCanary
{
  v3 = [a1 _globalCanaryLock];
  [v3 lock];

  v4 = (void *)[(id)_globalEventCanary copy];
  v5 = [a1 _globalCanaryLock];
  [v5 unlock];

  return v4;
}

+ (id)_globalCanaryLock
{
  if (_globalCanaryLock_onceToken != -1) {
    dispatch_once(&_globalCanaryLock_onceToken, &__block_literal_global_41);
  }
  v2 = (void *)_globalCanaryLock__canaryLock;
  return v2;
}

- (id)millisecondsFromTimeInterval:(double)a3
{
  return (id)[NSNumber numberWithLongLong:(uint64_t)(a3 * 1000.0)];
}

uint64_t __35__SSMetricsEvent__globalCanaryLock__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28E08]);
  v1 = (void *)_globalCanaryLock__canaryLock;
  _globalCanaryLock__canaryLock = (uint64_t)v0;

  v2 = (void *)_globalCanaryLock__canaryLock;
  return [v2 setName:@"com.StoreServices.globalEventCanaryLock"];
}

+ (void)setGlobalEventCanary:(id)a3
{
  uint64_t v4 = [a3 copy];
  v5 = [a1 _globalCanaryLock];
  [v5 lock];

  v6 = (void *)_globalEventCanary;
  _globalEventCanary = v4;

  id v7 = [a1 _globalCanaryLock];
  [v7 unlock];
}

- (id)allTableEntityPropertiesPermittedByConfiguration:(id)a3
{
  return [(SSMetricsEvent *)self allTableEntityPropertiesPermittedByConfiguration:a3 externalValues:0];
}

- (id)allTableEntityPropertiesPermittedByConfiguration:(id)a3 externalValues:(id)a4
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v67 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v8 = (void *)MEMORY[0x1A6267F60]();
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (([v6 disableEventDecoration] & 1) == 0)
  {
    v10 = [v6 eventFields];
    if ([v10 count]) {
      [v9 addEntriesFromDictionary:v10];
    }
  }
  v11 = [(SSMetricsEvent *)self _dictionaryRepresentationOfBody];
  if ([v11 count]) {
    [v9 addEntriesFromDictionary:v11];
  }
  if (([v6 disableEventDecoration] & 1) == 0 && objc_msgSend(v7, "count")) {
    [v9 addEntriesFromDictionary:v7];
  }
  v12 = [v6 blacklistedEventFields];
  if ([(SSMetricsEvent *)self isFieldBlacklistEnabled])
  {
    if ([v12 count])
    {
      uint64_t v13 = [v9 count];
      [v9 removeObjectsForKeys:v12];
      uint64_t v14 = [v9 count];
      if (v13 != v14)
      {
        int v15 = v14;
        v60 = v8;
        id v62 = v7;
        v16 = +[SSLogConfig sharedStoreServicesConfig];
        if (!v16)
        {
          v16 = +[SSLogConfig sharedConfig];
        }
        int v17 = [v16 shouldLog];
        if ([v16 shouldLogToDisk]) {
          v17 |= 2u;
        }
        v18 = [v16 OSLogObject];
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
          v17 &= 2u;
        }
        if (v17)
        {
          v64 = v12;
          v19 = objc_opt_class();
          int v20 = v13 - v15;
          id v59 = v19;
          v21 = [v9 objectForKey:@"eventType"];
          int v69 = 138412802;
          v70 = v19;
          v12 = v64;
          __int16 v71 = 1024;
          *(_DWORD *)v72 = v20;
          *(_WORD *)&v72[4] = 2112;
          *(void *)&v72[6] = v21;
          LODWORD(v58) = 28;
          v57 = &v69;
          v22 = (void *)_os_log_send_and_compose_impl();

          if (v22)
          {
            v23 = objc_msgSend(NSString, "stringWithCString:encoding:", v22, 4, &v69, v58);
            free(v22);
            SSFileLog(v16, @"%@", v24, v25, v26, v27, v28, v29, (uint64_t)v23);
          }
        }
        else
        {
        }
        v8 = v60;
        id v7 = v62;
      }
    }
  }
  if (objc_msgSend(v9, "count", v57))
  {
    id v68 = 0;
    v30 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v9 format:200 options:0 error:&v68];
    id v31 = v68;
    if (v30)
    {
      [v67 setObject:v30 forKey:@"eventBody"];
      goto LABEL_49;
    }
    id v63 = v7;
    v66 = v12;
    v61 = v8;
    v43 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v43)
    {
      v43 = +[SSLogConfig sharedConfig];
    }
    int v44 = [v43 shouldLog];
    if ([v43 shouldLogToDisk]) {
      int v45 = v44 | 2;
    }
    else {
      int v45 = v44;
    }
    v46 = [v43 OSLogObject];
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT)) {
      v45 &= 2u;
    }
    if (v45)
    {
      v47 = objc_opt_class();
      int v69 = 138412802;
      v70 = v47;
      __int16 v71 = 2112;
      *(void *)v72 = v31;
      *(_WORD *)&v72[8] = 2112;
      *(void *)&v72[10] = v9;
      id v48 = v47;
      LODWORD(v58) = 32;
      v49 = (void *)_os_log_send_and_compose_impl();

      v12 = v66;
      if (!v49)
      {
LABEL_48:

        v8 = v61;
        id v7 = v63;
        goto LABEL_49;
      }
      v46 = objc_msgSend(NSString, "stringWithCString:encoding:", v49, 4, &v69, v58);
      free(v49);
      SSFileLog(v43, @"%@", v50, v51, v52, v53, v54, v55, (uint64_t)v46);
    }

    goto LABEL_48;
  }
  id v31 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v31)
  {
    id v31 = +[SSLogConfig sharedConfig];
  }
  int v32 = [v31 shouldLog];
  if ([v31 shouldLogToDisk]) {
    v32 |= 2u;
  }
  v30 = [v31 OSLogObject];
  if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
    v32 &= 2u;
  }
  if (v32)
  {
    v65 = v12;
    v33 = v8;
    v34 = objc_opt_class();
    int v69 = 138412546;
    v70 = v34;
    __int16 v71 = 2112;
    *(void *)v72 = self;
    id v35 = v34;
    LODWORD(v58) = 22;
    v36 = (void *)_os_log_send_and_compose_impl();

    if (!v36)
    {
      v8 = v33;
      v12 = v65;
      goto LABEL_50;
    }
    v30 = objc_msgSend(NSString, "stringWithCString:encoding:", v36, 4, &v69, v58);
    free(v36);
    SSFileLog(v31, @"%@", v37, v38, v39, v40, v41, v42, (uint64_t)v30);
    v8 = v33;
    v12 = v65;
  }
LABEL_49:

LABEL_50:

  return v67;
}

- (BOOL)isBlacklistedByConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [(SSMetricsEvent *)self eventType];
  char v6 = [v4 isEventTypeBlacklisted:v5];

  return v6;
}

- (BOOL)isFieldBlacklistEnabled
{
  return 1;
}

- (BOOL)requiresDiagnosticSendingPermission
{
  return 0;
}

- (id)_dictionaryRepresentationOfBody
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(SSMetricsEvent *)self appendPropertiesToBody:v3];
  return v3;
}

- (double)timeIntervalFromMilliseconds:(id)a3
{
  return (double)[a3 longLongValue] / 1000.0;
}

- (id)decorateReportingURL:(id)a3
{
  id v3 = a3;
  return v3;
}

- (NSString)eventType
{
  return self->_eventType;
}

- (BOOL)shouldSuppressUserInfo
{
  return self->_shouldSuppressUserInfo;
}

- (BOOL)shouldSuppressDSIDHeader
{
  return self->_shouldSuppressDSIDHeader;
}

- (void).cxx_destruct
{
}

@end