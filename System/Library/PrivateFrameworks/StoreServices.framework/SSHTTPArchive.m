@interface SSHTTPArchive
+ (double)_timeIntervalFromFilename:(id)a3;
+ (id)_JSONObjectForEntries:(id)a3;
+ (id)_JSONObjectForTaskMetrics:(id)a3 requestData:(id)a4 responseData:(id)a5;
+ (id)_contentDictionaryForResponse:(id)a3 responseData:(id)a4;
+ (id)_creatorDictionary;
+ (id)_dateFormatterForTimeZone:(id)a3;
+ (id)_entriesArrayForTaskMetrics:(id)a3 requestData:(id)a4 responseData:(id)a5;
+ (id)_entryDictionaryForTaskMetrics:(id)a3 requestData:(id)a4 responseData:(id)a5;
+ (id)_generateCommentsForTaskMetrics:(id)a3;
+ (id)_headersArrayForHTTPHeaders:(id)a3;
+ (id)_localIPAddress;
+ (id)_requestDictionaryForTaskTransactionMetrics:(id)a3 requestData:(id)a4;
+ (id)_responseDictionaryForTaskMetrics:(id)a3 responseData:(id)a4;
+ (id)_stringFromDate:(id)a3;
+ (id)merge:(id)a3;
+ (id)merge:(id)a3 withEstimatedFileSizeLimit:(unint64_t)a4;
+ (id)outputDirectoryForLogConfig:(id)a3;
+ (void)removeLogsWithLogConfig:(id)a3 olderThanDate:(id)a4;
+ (void)sendWriteAllLogsToDiskDecompressedNotification;
+ (void)sendWriteAllLogsToDiskNotification;
- (BOOL)compressed;
- (BOOL)writeToDiskError:(id *)a3;
- (BOOL)writeToDiskWithLogConfig:(id)a3 compressed:(BOOL)a4 error:(id *)a5;
- (NSData)JSONData;
- (NSData)backingJSONData;
- (NSDictionary)JSONObject;
- (NSString)JSONString;
- (SSHTTPArchive)initWithJSONObject:(id)a3;
- (SSHTTPArchive)initWithTaskMetrics:(id)a3 requestData:(id)a4 responseData:(id)a5;
- (void)setBackingJSONData:(id)a3;
- (void)setCompressed:(BOOL)a3;
@end

@implementation SSHTTPArchive

- (SSHTTPArchive)initWithJSONObject:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SSHTTPArchive;
  v5 = [(SSHTTPArchive *)&v14 init];
  if (v5)
  {
    v6 = (void *)SSViTunesStoreFramework();
    v7 = (uint64_t (*)(void *))SSVWeakLinkedSymbolForString("ISCopyGzippedDataForData", v6);
    if ([MEMORY[0x1E4F28D90] isValidJSONObject:v4])
    {
      v8 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v4 options:0 error:0];
    }
    else
    {
      v8 = 0;
    }
    uint64_t v9 = v7(v8);
    v10 = (void *)v9;
    BOOL v11 = v9 != 0;
    if (v9) {
      v12 = (void *)v9;
    }
    else {
      v12 = v8;
    }
    objc_storeStrong((id *)&v5->_backingJSONData, v12);
    v5->_compressed = v11;
  }
  return v5;
}

- (SSHTTPArchive)initWithTaskMetrics:(id)a3 requestData:(id)a4 responseData:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  BOOL v11 = [(id)objc_opt_class() _JSONObjectForTaskMetrics:v10 requestData:v9 responseData:v8];

  v12 = [(SSHTTPArchive *)self initWithJSONObject:v11];
  return v12;
}

- (NSData)JSONData
{
  if ([(SSHTTPArchive *)self compressed])
  {
    v3 = (void *)SSViTunesStoreFramework();
    id v4 = (uint64_t (*)(void))SSVWeakLinkedSymbolForString("ISCopyDecompressedGZipDataForData", v3);
    v5 = [(SSHTTPArchive *)self backingJSONData];
    v6 = (void *)v4();
  }
  else
  {
    v6 = [(SSHTTPArchive *)self backingJSONData];
  }
  return (NSData *)v6;
}

- (NSDictionary)JSONObject
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(SSHTTPArchive *)self JSONData];
  id v4 = [v2 JSONObjectWithData:v3 options:0 error:0];

  return (NSDictionary *)v4;
}

- (NSString)JSONString
{
  id v3 = [NSString alloc];
  id v4 = [(SSHTTPArchive *)self JSONData];
  v5 = (void *)[v3 initWithData:v4 encoding:4];

  return (NSString *)v5;
}

+ (id)merge:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v10 = (void *)MEMORY[0x1A6267F60]();
        BOOL v11 = [v9 JSONObject];
        v12 = [v11 objectForKeyedSubscript:@"log"];
        v13 = [v12 objectForKeyedSubscript:@"entries"];

        if (v13) {
          [v17 addObjectsFromArray:v13];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  objc_super v14 = [(id)objc_opt_class() _JSONObjectForEntries:v17];
  v15 = (void *)[objc_alloc((Class)objc_opt_class()) initWithJSONObject:v14];

  return v15;
}

+ (id)merge:(id)a3 withEstimatedFileSizeLimit:(unint64_t)a4
{
  id v23 = a1;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unint64_t v9 = 0;
    unint64_t v26 = 1000 * a4;
    uint64_t v10 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x1A6267F60]();
        objc_super v14 = [v12 JSONObject];
        v15 = [v14 objectForKeyedSubscript:@"log"];
        v16 = [v15 objectForKeyedSubscript:@"entries"];

        if (v16) {
          [v6 addObjectsFromArray:v16];
        }
        id v17 = objc_msgSend(v12, "JSONData", v23);
        v9 += [v17 length];

        if (v9 > v26)
        {
          long long v18 = [(id)objc_opt_class() _JSONObjectForEntries:v6];
          long long v19 = (void *)[objc_alloc((Class)objc_opt_class()) initWithJSONObject:v18];
          [v24 addObject:v19];

          [v6 removeAllObjects];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v8);
  }

  if ([v6 count])
  {
    long long v20 = [(id)objc_opt_class() _JSONObjectForEntries:v6];
    long long v21 = (void *)[objc_alloc((Class)objc_opt_class()) initWithJSONObject:v20];
    [v24 addObject:v21];
  }
  return v24;
}

+ (id)outputDirectoryForLogConfig:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    id v3 = +[SSLogConfig sharedConfig];
  }
  id v4 = [v3 outputDirectory];
  id v5 = [v4 stringByAppendingPathComponent:@"HTTPArchives"];

  return v5;
}

+ (void)removeLogsWithLogConfig:(id)a3 olderThanDate:(id)a4
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v6 = +[SSLogConfig sharedConfig];
  }
  uint64_t v8 = [(id)objc_opt_class() outputDirectoryForLogConfig:v6];
  unint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v10 = [v9 fileExistsAtPath:v8];

  if ((v10 & 1) == 0)
  {
    id v15 = v6;
    if (!v15)
    {
      id v15 = +[SSLogConfig sharedConfig];
    }
    int v55 = [v15 shouldLog];
    if ([v15 shouldLogToDisk]) {
      int v56 = v55 | 2;
    }
    else {
      int v56 = v55;
    }
    v57 = [v15 OSLogObject];
    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO)) {
      int v58 = v56;
    }
    else {
      int v58 = v56 & 2;
    }
    if (v58)
    {
      int v76 = 138412290;
      v77 = v8;
      LODWORD(v67) = 12;
      v59 = (void *)_os_log_send_and_compose_impl();

      if (!v59) {
        goto LABEL_53;
      }
      v57 = objc_msgSend(NSString, "stringWithCString:encoding:", v59, 4, &v76, v67);
      free(v59);
      SSFileLog(v15, @"%@", v60, v61, v62, v63, v64, v65, (uint64_t)v57);
    }

    goto LABEL_53;
  }
  id v68 = v7;
  [v7 timeIntervalSinceReferenceDate];
  double v12 = v11;
  v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  objc_super v14 = [v13 enumeratorAtPath:v8];

  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v72 objects:v80 count:16];
  if (!v16) {
    goto LABEL_40;
  }
  uint64_t v17 = v16;
  uint64_t v18 = *(void *)v73;
  uint64_t v69 = *(void *)v73;
  do
  {
    uint64_t v19 = 0;
    uint64_t v70 = v17;
    do
    {
      if (*(void *)v73 != v18) {
        objc_enumerationMutation(v15);
      }
      uint64_t v20 = *(void *)(*((void *)&v72 + 1) + 8 * v19);
      objc_msgSend(a1, "_timeIntervalFromFilename:", v20, v66);
      if (v21 != 1.79769313e308 && v21 <= v12)
      {
        id v23 = a1;
        id v24 = v15;
        v25 = v8;
        unint64_t v26 = [v8 stringByAppendingPathComponent:v20];
        id v27 = v6;
        long long v28 = v27;
        id v29 = v6;
        if (!v6)
        {
          long long v28 = +[SSLogConfig sharedConfig];
        }
        int v30 = [v28 shouldLog];
        if ([v28 shouldLogToDisk]) {
          v30 |= 2u;
        }
        v31 = [v28 OSLogObject];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO)) {
          int v32 = v30;
        }
        else {
          int v32 = v30 & 2;
        }
        if (v32)
        {
          int v76 = 138412290;
          v77 = v26;
          LODWORD(v67) = 12;
          v66 = &v76;
          v33 = (void *)_os_log_send_and_compose_impl();

          if (v33)
          {
            v31 = objc_msgSend(NSString, "stringWithCString:encoding:", v33, 4, &v76, v67);
            free(v33);
            SSFileLog(v28, @"%@", v34, v35, v36, v37, v38, v39, (uint64_t)v31);
            goto LABEL_23;
          }
        }
        else
        {
LABEL_23:
        }
        v40 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v71 = 0;
        char v41 = [v40 removeItemAtPath:v26 error:&v71];
        id v42 = v71;

        if ((v41 & 1) == 0)
        {
          id v43 = v27;
          if (!v29)
          {
            id v43 = +[SSLogConfig sharedConfig];
          }
          v44 = v43;
          int v45 = objc_msgSend(v43, "shouldLog", v66);
          if ([v44 shouldLogToDisk]) {
            v45 |= 2u;
          }
          v46 = [v44 OSLogObject];
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
            int v47 = v45;
          }
          else {
            int v47 = v45 & 2;
          }
          if (v47)
          {
            int v76 = 138412546;
            v77 = v26;
            __int16 v78 = 2112;
            id v79 = v42;
            LODWORD(v67) = 22;
            v66 = &v76;
            v48 = (void *)_os_log_send_and_compose_impl();

            if (v48)
            {
              v46 = objc_msgSend(NSString, "stringWithCString:encoding:", v48, 4, &v76, v67);
              free(v48);
              SSFileLog(v44, @"%@", v49, v50, v51, v52, v53, v54, (uint64_t)v46);
              goto LABEL_35;
            }
          }
          else
          {
LABEL_35:
          }
        }

        uint64_t v8 = v25;
        id v6 = v29;
        id v15 = v24;
        a1 = v23;
        uint64_t v18 = v69;
        uint64_t v17 = v70;
      }
      ++v19;
    }
    while (v17 != v19);
    uint64_t v17 = [v15 countByEnumeratingWithState:&v72 objects:v80 count:16];
  }
  while (v17);
LABEL_40:

  id v7 = v68;
LABEL_53:
}

+ (void)sendWriteAllLogsToDiskNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"SSHTTPArchiveShouldSaveToDiskNotification", 0, 0, 1u);
}

+ (void)sendWriteAllLogsToDiskDecompressedNotification
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F4E278]);
  uint64_t v3 = [v2 applicationStateForApplication:@"com.apple.AppStore"];
  int v4 = v3;
  NSLog(&cfstr_AppStoreStates.isa, v3);
  if (v4 == 2)
  {
    id v5 = (void *)SSVFrontBoardServicesFramework();
    id v6 = SSVWeakLinkedStringConstantForString("FBSOpenApplicationOptionKeyActivateSuspended", v5);
    if (v6)
    {
      id v7 = objc_alloc(MEMORY[0x1E4F1CA60]);
      uint64_t v8 = objc_msgSend(v7, "initWithObjectsAndKeys:", MEMORY[0x1E4F1CC38], v6, 0);
      uint64_t v9 = SSVFrontBoardServicesFramework();
      id v10 = objc_alloc_init((Class)SSVWeakLinkedClassForString(&cfstr_Fbssystemservi.isa, v9));
      dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __63__SSHTTPArchive_sendWriteAllLogsToDiskDecompressedNotification__block_invoke;
      v14[3] = &unk_1E5BACC08;
      id v15 = v2;
      dispatch_semaphore_t v16 = v11;
      double v12 = v11;
      [v10 openApplication:@"com.apple.AppStore" options:v8 withResult:v14];
      dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      [v2 invalidate];
    }
  }
  else
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"SSHTTPArchiveShouldSaveToDiskDecompressedNotification", 0, 0, 1u);
    [v2 invalidate];
  }
}

intptr_t __63__SSHTTPArchive_sendWriteAllLogsToDiskDecompressedNotification__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  NSLog(&cfstr_LaunchedAppSto.isa, v4, [v3 applicationStateForApplication:@"com.apple.AppStore"]);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"SSHTTPArchiveShouldSaveToDiskDecompressedNotification", 0, 0, 1u);
  [*(id *)(a1 + 32) invalidate];
  id v6 = *(NSObject **)(a1 + 40);
  return dispatch_semaphore_signal(v6);
}

- (BOOL)writeToDiskError:(id *)a3
{
  return [(SSHTTPArchive *)self writeToDiskWithLogConfig:0 compressed:1 error:a3];
}

- (BOOL)writeToDiskWithLogConfig:(id)a3 compressed:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!v8)
  {
    id v8 = +[SSLogConfig sharedConfig];
  }
  uint64_t v9 = [(id)objc_opt_class() outputDirectoryForLogConfig:v8];
  id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v11 = [v10 fileExistsAtPath:v9];

  if (v11)
  {
    double v12 = 0;
    goto LABEL_6;
  }
  v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v60 = 0;
  char v14 = [v13 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:&v60];
  double v12 = (__CFString *)v60;

  if ((v14 & 1) == 0)
  {
    id v24 = v8;
    if (!v24)
    {
      id v24 = +[SSLogConfig sharedConfig];
    }
    int v25 = [v24 shouldLog];
    if ([v24 shouldLogToDisk]) {
      v25 |= 2u;
    }
    unint64_t v26 = [v24 OSLogObject];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      int v27 = v25;
    }
    else {
      int v27 = v25 & 2;
    }
    if (v27)
    {
      int v61 = 138412546;
      uint64_t v62 = v9;
      __int16 v63 = 2112;
      uint64_t v64 = v12;
      LODWORD(v54) = 22;
      long long v28 = (void *)_os_log_send_and_compose_impl();

      if (!v28) {
        goto LABEL_23;
      }
      unint64_t v26 = objc_msgSend(NSString, "stringWithCString:encoding:", v28, 4, &v61, v54);
      free(v28);
      SSFileLog(v24, @"%@", v29, v30, v31, v32, v33, v34, (uint64_t)v26);
    }

LABEL_23:
    if (SSFileIsLocalWritable(v9))
    {
      char v35 = 0;
      if (!a5) {
        goto LABEL_53;
      }
      goto LABEL_52;
    }
    goto LABEL_26;
  }
LABEL_6:
  if (!SSFileIsLocalWritable(v9))
  {
LABEL_26:
    SSError(@"SSErrorDomain", 107, 0, 0);
    uint64_t v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
    char v35 = 0;
    uint64_t v37 = v12;
    goto LABEL_51;
  }
  id v15 = @".har";
  int v58 = a5;
  if ([(SSHTTPArchive *)self compressed] && v6)
  {
    id v15 = [@".har" stringByAppendingString:@".compressed"];
  }
  dispatch_semaphore_t v16 = NSString;
  uint64_t v17 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v18 = [v17 bundleIdentifier];
  uint64_t v19 = [MEMORY[0x1E4F1C9C8] date];
  [v19 timeIntervalSinceReferenceDate];
  int v56 = v15;
  uint64_t v21 = [v16 stringWithFormat:@"%@_%f%@", v18, v20, v15];

  v22 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9];
  v57 = (void *)v21;
  id v23 = [v22 URLByAppendingPathComponent:v21];

  if (v6) {
    [(SSHTTPArchive *)self backingJSONData];
  }
  else {
  uint64_t v38 = [(SSHTTPArchive *)self JSONData];
  }
  v59 = v12;
  char v35 = [v38 writeToURL:v23 options:1 error:&v59];
  uint64_t v36 = v59;

  id v39 = v8;
  v40 = v39;
  uint64_t v37 = v56;
  if (v35)
  {
    if (!v39)
    {
      v40 = +[SSLogConfig sharedConfig];
    }
    int v41 = [v40 shouldLog];
    if ([v40 shouldLogToDisk]) {
      v41 |= 2u;
    }
    id v42 = [v40 OSLogObject];
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
      int v43 = v41;
    }
    else {
      int v43 = v41 & 2;
    }
    if (!v43) {
      goto LABEL_49;
    }
    int v61 = 138412290;
    uint64_t v62 = v23;
    LODWORD(v55) = 12;
  }
  else
  {
    if (!v39)
    {
      v40 = +[SSLogConfig sharedConfig];
    }
    int v44 = [v40 shouldLog];
    if ([v40 shouldLogToDisk]) {
      v44 |= 2u;
    }
    id v42 = [v40 OSLogObject];
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      int v45 = v44;
    }
    else {
      int v45 = v44 & 2;
    }
    if (!v45) {
      goto LABEL_49;
    }
    int v61 = 138412290;
    uint64_t v62 = v36;
    LODWORD(v55) = 12;
  }
  v46 = (void *)_os_log_send_and_compose_impl();

  if (v46)
  {
    id v42 = objc_msgSend(NSString, "stringWithCString:encoding:", v46, 4, &v61, v55);
    free(v46);
    SSFileLog(v40, @"%@", v47, v48, v49, v50, v51, v52, (uint64_t)v42);
LABEL_49:
  }
  a5 = v58;
LABEL_51:

  double v12 = v36;
  if (a5) {
LABEL_52:
  }
    *a5 = v12;
LABEL_53:

  return v35;
}

+ (id)_contentDictionaryForResponse:(id)a3 responseData:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    BOOL v6 = (objc_class *)MEMORY[0x1E4F1CA60];
    id v7 = a3;
    id v8 = objc_alloc_init(v6);
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v7, "expectedContentLength"));
    [v8 setObject:v9 forKeyedSubscript:@"bodySize"];

    id v10 = [v7 MIMEType];

    if ([v10 length]) {
      [v8 setObject:v10 forKeyedSubscript:@"mimeType"];
    }
    char v11 = (void *)[[NSString alloc] initWithData:v5 encoding:4];
    uint64_t v12 = [v11 length];
    if (v12)
    {
      unint64_t v13 = v12;
      char ShouldIncludeFullResponseBodiesInNetworkLogs = SSDebugShouldIncludeFullResponseBodiesInNetworkLogs();
      unint64_t v15 = [v5 length];
      if ((ShouldIncludeFullResponseBodiesInNetworkLogs & 1) == 0 && v15 >= 0x9C41)
      {
        if (v13 <= (unint64_t)((double)v13 / (double)(unint64_t)[v5 length] * 40000.0))
        {
          uint64_t v16 = 0;
        }
        else
        {
          uint64_t v16 = objc_msgSend(v11, "substringToIndex:");
        }

        char v11 = (void *)v16;
      }
    }
    if ([v11 length]) {
      [v8 setObject:v11 forKeyedSubscript:@"text"];
    }
  }
  else
  {
    id v8 = (id)MEMORY[0x1E4F1CC08];
  }

  return v8;
}

+ (id)_creatorDictionary
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v2 = +[SSDevice currentDevice];
  uint64_t v3 = [v2 userAgent];

  id v4 = +[SSDevice currentDevice];
  id v5 = [v4 clientVersion];

  if (!v3) {
    uint64_t v3 = @"UNKNOWN";
  }
  if (!v5) {
    id v5 = @"UNKNOWN";
  }
  v8[0] = @"name";
  v8[1] = @"version";
  v9[0] = v3;
  v9[1] = v5;
  BOOL v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

+ (id)_dateFormatterForTimeZone:(id)a3
{
  id v3 = a3;
  if (_dateFormatterForTimeZone__onceToken != -1) {
    dispatch_once(&_dateFormatterForTimeZone__onceToken, &__block_literal_global_24);
  }
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__53;
  uint64_t v20 = __Block_byref_object_dispose__53;
  id v21 = 0;
  id v4 = _dateFormatterForTimeZone__dateFormatterAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__SSHTTPArchive__dateFormatterForTimeZone___block_invoke_76;
  block[3] = &unk_1E5BA6F30;
  unint64_t v15 = &v16;
  id v5 = v3;
  id v14 = v5;
  dispatch_sync(v4, block);
  BOOL v6 = (void *)v17[5];
  if (!v6)
  {
    id v7 = _dateFormatterForTimeZone__dateFormatterAccessQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __43__SSHTTPArchive__dateFormatterForTimeZone___block_invoke_2;
    v10[3] = &unk_1E5BA6F30;
    uint64_t v12 = &v16;
    id v11 = v5;
    dispatch_barrier_sync(v7, v10);

    BOOL v6 = (void *)v17[5];
  }
  id v8 = v6;

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __43__SSHTTPArchive__dateFormatterForTimeZone___block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.StoreServices.SSHTTPArchive", MEMORY[0x1E4F14430]);
  v1 = (void *)_dateFormatterForTimeZone__dateFormatterAccessQueue;
  _dateFormatterForTimeZone__dateFormatterAccessQueue = (uint64_t)v0;

  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = (void *)_dateFormatterForTimeZone__dateFormatters;
  _dateFormatterForTimeZone__dateFormatters = (uint64_t)v2;
}

void __43__SSHTTPArchive__dateFormatterForTimeZone___block_invoke_76(uint64_t a1)
{
  uint64_t v2 = [(id)_dateFormatterForTimeZone__dateFormatters objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __43__SSHTTPArchive__dateFormatterForTimeZone___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setDateFormat:@"uuuu-MM-dd'T'HH:mm:ss.sXXX"];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setTimeZone:*(void *)(a1 + 32)];
  id v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  BOOL v6 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v5 setLocale:v6];

  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v9 = (void *)_dateFormatterForTimeZone__dateFormatters;
  return [v9 setObject:v8 forKeyedSubscript:v7];
}

+ (id)_entriesArrayForTaskMetrics:(id)a3 requestData:(id)a4 responseData:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v12 = objc_msgSend(v8, "transactionMetrics", 0);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = [a1 _entryDictionaryForTaskMetrics:*(void *)(*((void *)&v19 + 1) + 8 * i) requestData:v9 responseData:v10];
        [v11 addObject:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  return v11;
}

+ (id)_entryDictionaryForTaskMetrics:(id)a3 requestData:(id)a4 responseData:(id)a5
{
  id v8 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_alloc_init(v8);
  uint64_t v13 = [v11 fetchStartDate];
  uint64_t v14 = [a1 _stringFromDate:v13];
  [v12 setObject:v14 forKeyedSubscript:@"startedDateTime"];

  uint64_t v15 = [v11 responseEndDate];
  uint64_t v16 = [v11 requestStartDate];
  [v15 timeIntervalSinceDate:v16];
  double v18 = v17 * 1000.0;

  long long v19 = [NSNumber numberWithDouble:v18];
  [v12 setObject:v19 forKeyedSubscript:@"time"];

  long long v20 = [a1 _requestDictionaryForTaskTransactionMetrics:v11 requestData:v10];

  [v12 setObject:v20 forKeyedSubscript:@"request"];
  long long v21 = [a1 _responseDictionaryForTaskMetrics:v11 responseData:v9];

  [v12 setObject:v21 forKeyedSubscript:@"response"];
  long long v22 = [a1 _generateCommentsForTaskMetrics:v11];

  [v12 setObject:v22 forKeyedSubscript:@"comment"];
  return v12;
}

+ (id)_headersArrayForHTTPHeaders:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = [v3 allKeys];
  uint64_t v5 = [obj countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v18[1] = @"value";
        v19[0] = v9;
        v18[0] = @"name";
        id v10 = objc_msgSend(v3, "objectForKeyedSubscript:");
        v19[1] = v10;
        id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
        [v4 addObject:v11];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v6);
  }

  return v4;
}

+ (id)_JSONObjectForEntries:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setObject:@"1.2" forKeyedSubscript:@"version"];
  uint64_t v7 = [a1 _creatorDictionary];
  [v6 setObject:v7 forKeyedSubscript:@"creator"];

  [v6 setObject:v5 forKeyedSubscript:@"entries"];
  id v10 = @"log";
  v11[0] = v6;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

  return v8;
}

+ (id)_JSONObjectForTaskMetrics:(id)a3 requestData:(id)a4 responseData:(id)a5
{
  id v6 = [a1 _entriesArrayForTaskMetrics:a3 requestData:a4 responseData:a5];
  uint64_t v7 = [a1 _JSONObjectForEntries:v6];

  return v7;
}

+ (id)_generateCommentsForTaskMetrics:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "_apsRelayAttempted"));
  [v6 setObject:v7 forKeyedSubscript:@"APS-Attempted"];

  id v8 = NSNumber;
  uint64_t v9 = [v5 _apsRelaySucceeded];

  id v10 = [v8 numberWithBool:v9];
  [v6 setObject:v10 forKeyedSubscript:@"APS-Succeeded"];

  id v11 = [a1 _localIPAddress];
  [v6 setObject:v11 forKeyedSubscript:@"clientIPAddress"];

  id v12 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v6 options:1 error:0];
  if (v12) {
    uint64_t v13 = (__CFString *)[[NSString alloc] initWithData:v12 encoding:4];
  }
  else {
    uint64_t v13 = 0;
  }
  if (v13) {
    long long v14 = v13;
  }
  else {
    long long v14 = &stru_1EF96DA90;
  }
  long long v15 = v14;

  return v15;
}

+ (id)_localIPAddress
{
  id v10 = 0;
  int v2 = getifaddrs(&v10);
  id v3 = v10;
  id v4 = @"error";
  if (!v2 && v10)
  {
    do
    {
      if (v3->ifa_addr->sa_family == 2)
      {
        id v5 = [NSString stringWithUTF8String:v3->ifa_name];
        int v6 = [v5 isEqualToString:@"en0"];

        if (v6)
        {
          v7.s_addr = *(_DWORD *)&v3->ifa_addr->sa_data[2];
          uint64_t v8 = [NSString stringWithUTF8String:inet_ntoa(v7)];

          id v4 = (__CFString *)v8;
        }
      }
      id v3 = v3->ifa_next;
    }
    while (v3);
    id v3 = v10;
  }
  MEMORY[0x1A6267DD0](v3);
  return v4;
}

+ (id)_requestDictionaryForTaskTransactionMetrics:(id)a3 requestData:(id)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  in_addr v7 = [a3 request];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "length"));
  [v8 setObject:v9 forKeyedSubscript:@"bodySize"];

  id v10 = [v7 allHTTPHeaderFields];
  id v11 = [a1 _headersArrayForHTTPHeaders:v10];
  [v8 setObject:v11 forKeyedSubscript:@"headers"];

  [v8 setObject:&unk_1EF9A9900 forKeyedSubscript:@"headersSize"];
  [v8 setObject:@"HTTP/1.1" forKeyedSubscript:@"httpVersion"];
  id v12 = [v7 HTTPMethod];
  if ([v12 length]) {
    [v8 setObject:v12 forKeyedSubscript:@"method"];
  }
  uint64_t v13 = [v7 URL];
  long long v14 = [v13 absoluteString];

  if ([v14 length]) {
    [v8 setObject:v14 forKeyedSubscript:@"url"];
  }
  if (SSDebugShouldLogFullMetricsRequest())
  {
    int v15 = [v14 containsString:@"xp.apple.com"];
    if (!v6) {
      goto LABEL_15;
    }
  }
  else
  {
    int v15 = 0;
    if (!v6)
    {
LABEL_15:
      id v19 = 0;
      goto LABEL_16;
    }
  }
  if ((unint64_t)[v6 length] < 0x9C41) {
    int v16 = 1;
  }
  else {
    int v16 = v15;
  }
  if (v16 != 1) {
    goto LABEL_15;
  }
  long long v17 = (void *)SSViTunesStoreFramework();
  double v18 = (uint64_t (*)(id))SSVWeakLinkedSymbolForString("ISCopyDecompressedGZipDataForData", v17);
  id v19 = (id)v18(v6);
  if (!v19) {
    id v19 = v6;
  }
LABEL_16:
  if ([v14 containsString:@"/WebObjects/MZFinance.woa/wa/authenticate"])
  {
    long long v20 = [MEMORY[0x1E4F28F98] propertyListWithData:v19 options:1 format:0 error:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v21 = v20;
      long long v22 = [v21 valueForKey:@"password"];

      if (v22)
      {
        [v21 setValue:@"REDACTED" forKey:@"password"];
        uint64_t v23 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v21 format:100 options:0 error:0];

        id v19 = (id)v23;
      }
    }
  }
  uint64_t v24 = (void *)[[NSString alloc] initWithData:v19 encoding:4];
  if ([v24 length])
  {
    int v27 = @"text";
    v28[0] = v24;
    int v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    [v8 setObject:v25 forKeyedSubscript:@"postData"];
  }
  return v8;
}

+ (id)_responseDictionaryForTaskMetrics:(id)a3 responseData:(id)a4
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 response];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = v9;
  if (v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v12 = [a1 _contentDictionaryForResponse:v10 responseData:v7];
    [v11 setObject:v12 forKeyedSubscript:@"content"];

    uint64_t v13 = (void *)MEMORY[0x1E4F1CA48];
    long long v14 = [v10 allHeaderFields];
    int v15 = [a1 _headersArrayForHTTPHeaders:v14];
    int v16 = [v13 arrayWithArray:v15];

    uint64_t v17 = [v6 resourceFetchType];
    v28[0] = @"name";
    v28[1] = @"value";
    double v18 = @"false";
    if (v17 == 3) {
      double v18 = @"true";
    }
    v29[0] = @"X-Apple-Connection-Reused";
    v29[1] = v18;
    id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
    [v16 addObject:v19];

    [v11 setObject:v16 forKeyedSubscript:@"headers"];
    [v11 setObject:&unk_1EF9A9900 forKeyedSubscript:@"headersSize"];
    [v11 setObject:@"HTTP/1.1" forKeyedSubscript:@"httpVersion"];
    long long v20 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "statusCode"));
    [v11 setObject:v20 forKeyedSubscript:@"status"];

    id v21 = objc_msgSend(MEMORY[0x1E4F28D20], "localizedStringForStatusCode:", objc_msgSend(v10, "statusCode"));
    if ([v21 length]) {
      [v11 setObject:v21 forKeyedSubscript:@"statusText"];
    }
    long long v22 = [v10 allHeaderFields];
    uint64_t v23 = [v22 objectForKeyedSubscript:@"Content-Length"];

    uint64_t v24 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v23, "integerValue"));
    int v25 = (void *)v24;
    if (v24) {
      unint64_t v26 = (void *)v24;
    }
    else {
      unint64_t v26 = &unk_1EF9A9900;
    }
    [v11 setObject:v26 forKeyedSubscript:@"bodySize"];
  }
  else
  {
    id v11 = (id)MEMORY[0x1E4F1CC08];
  }

  return v11;
}

+ (id)_stringFromDate:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAF0];
  id v5 = a3;
  id v6 = [v4 systemTimeZone];
  id v7 = [a1 _dateFormatterForTimeZone:v6];
  id v8 = [v7 stringFromDate:v5];

  return v8;
}

+ (double)_timeIntervalFromFilename:(id)a3
{
  id v3 = a3;
  if ([v3 containsString:@".har"])
  {
    id v4 = (void *)MEMORY[0x1A6267F60]();
    id v5 = [v3 stringByReplacingOccurrencesOfString:@".har" withString:&stru_1EF96DA90];

    id v3 = [v5 stringByReplacingOccurrencesOfString:@".compressed" withString:&stru_1EF96DA90];

    id v6 = [v3 componentsSeparatedByString:@"_"];
    if ([v6 count] == 2)
    {
      id v7 = [v6 objectAtIndexedSubscript:1];
      id v8 = [MEMORY[0x1E4F28FE8] scannerWithString:v7];
      double v11 = 0.0;
      if ([v8 scanDouble:&v11]) {
        double v9 = v11;
      }
      else {
        double v9 = 1.79769313e308;
      }
    }
    else
    {
      double v9 = 1.79769313e308;
    }
  }
  else
  {
    double v9 = 1.79769313e308;
  }

  return v9;
}

- (NSData)backingJSONData
{
  return self->_backingJSONData;
}

- (void)setBackingJSONData:(id)a3
{
}

- (BOOL)compressed
{
  return self->_compressed;
}

- (void)setCompressed:(BOOL)a3
{
  self->_compressed = a3;
}

- (void).cxx_destruct
{
}

@end