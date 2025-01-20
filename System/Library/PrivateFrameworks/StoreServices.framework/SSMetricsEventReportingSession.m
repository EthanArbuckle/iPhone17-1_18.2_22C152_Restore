@interface SSMetricsEventReportingSession
- (BOOL)anyUnreportedEvents;
- (BOOL)markEventsAsReported;
- (SSMetricsEventReportingSession)initWithReportingURL:(id)a3 insertTimestamp:(int64_t)a4 eventController:(id)a5;
- (SSMetricsEventReportingSession)initWithReportingURL:(id)a3 insertTimestamp:(int64_t)a4 suppressUserInfo:(BOOL)a5 eventController:(id)a6;
- (id)_unreportedEvents;
- (id)sessionCanaryIdentifier;
- (id)writeEventsToStream:(id)a3;
- (id)writeEventsToStream:(id)a3 uncompressedMaxSize:(int64_t)a4;
- (int64_t)_estimateSizeOfJsonObject:(id)a3;
- (void)_writeString:(id)a3 toData:(id)a4;
@end

@implementation SSMetricsEventReportingSession

- (SSMetricsEventReportingSession)initWithReportingURL:(id)a3 insertTimestamp:(int64_t)a4 eventController:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v11 = [(SSMetricsEventReportingSession *)self init];
  v12 = v11;
  if (v11)
  {
    v11->_insertTimestamp = a4;
    unreportedEvents = v11->_unreportedEvents;
    v11->_unreportedEvents = 0;

    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unreportedEventPIDs = v12->_unreportedEventPIDs;
    v12->_unreportedEventPIDs = v14;

    objc_storeStrong((id *)&v12->_eventController, a5);
    objc_storeStrong((id *)&v12->_reportingURL, a3);
  }

  return v12;
}

- (SSMetricsEventReportingSession)initWithReportingURL:(id)a3 insertTimestamp:(int64_t)a4 suppressUserInfo:(BOOL)a5 eventController:(id)a6
{
  result = [(SSMetricsEventReportingSession *)self initWithReportingURL:a3 insertTimestamp:a4 eventController:a6];
  if (result) {
    result->_suppressUserInfo = a5;
  }
  return result;
}

- (BOOL)anyUnreportedEvents
{
  v2 = [(SSMetricsEventReportingSession *)self _unreportedEvents];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)markEventsAsReported
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  BOOL v3 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v3)
  {
    BOOL v3 = +[SSLogConfig sharedConfig];
  }
  int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    v5 &= 2u;
  }
  if (v5)
  {
    v7 = objc_opt_class();
    unreportedEventPIDs = self->_unreportedEventPIDs;
    id v9 = v7;
    int v22 = 138412546;
    v23 = v7;
    __int16 v24 = 1024;
    int v25 = [(NSMutableArray *)unreportedEventPIDs count];
    LODWORD(v21) = 18;
    id v10 = (void *)_os_log_send_and_compose_impl();

    if (!v10) {
      goto LABEL_12;
    }
    v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v22, v21);
    free(v10);
    SSFileLog(v3, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v6);
  }

LABEL_12:
  if (![(NSMutableArray *)self->_unreportedEventPIDs count]) {
    return 0;
  }
  BOOL v17 = [(SSMetricsEventController *)self->_eventController markEventsAsReported:self->_unreportedEventPIDs];
  v18 = self->_unreportedEventPIDs;
  self->_unreportedEventPIDs = 0;

  unreportedEvents = self->_unreportedEvents;
  self->_unreportedEvents = 0;

  return v17;
}

- (id)sessionCanaryIdentifier
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  sessionCanaryIdentifier = self->_sessionCanaryIdentifier;
  if (sessionCanaryIdentifier)
  {
    BOOL v3 = sessionCanaryIdentifier;
  }
  else
  {
    [(SSMetricsEventReportingSession *)self _unreportedEvents];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
LABEL_5:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v9), "reportingDictionary", (void)v15);
        uint64_t v11 = [v10 objectForKey:@"canary"];

        if (v11) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v7) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      uint64_t v11 = 0;
    }

    uint64_t v12 = (NSString *)[v11 copy];
    uint64_t v13 = self->_sessionCanaryIdentifier;
    self->_sessionCanaryIdentifier = v12;

    BOOL v3 = self->_sessionCanaryIdentifier;
  }
  return v3;
}

- (id)writeEventsToStream:(id)a3
{
  return [(SSMetricsEventReportingSession *)self writeEventsToStream:a3 uncompressedMaxSize:-1];
}

- (id)writeEventsToStream:(id)a3 uncompressedMaxSize:(int64_t)a4
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v89 = a3;
  id v5 = [(SSMetricsEventReportingSession *)self _unreportedEvents];
  uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unreportedEventPIDs = self->_unreportedEventPIDs;
  self->_unreportedEventPIDs = v6;

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v9 = [(SSMetricsEventReportingSession *)self sessionCanaryIdentifier];
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id obj = v5;
  id v90 = v8;
  v91 = self;
  uint64_t v94 = [obj countByEnumeratingWithState:&v98 objects:v108 count:16];
  if (v94)
  {
    int64_t v10 = 0;
    uint64_t v93 = *(void *)v99;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v99 != v93) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void **)(*((void *)&v98 + 1) + 8 * v11);
      if ((a4 & 0x8000000000000000) == 0 && v10 > a4) {
        goto LABEL_27;
      }
      uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v98 + 1) + 8 * v11), "reportingDictionary", v87, v88);
      uint64_t v14 = [v13 objectForKey:@"canary"];
      long long v15 = v14;
      if (v14 && ![v14 isEqualToString:v9])
      {

        goto LABEL_27;
      }
      long long v16 = self->_unreportedEventPIDs;
      long long v17 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v12, "persistentID"));
      [(NSMutableArray *)v16 addObject:v17];

      int64_t v18 = [(SSMetricsEventReportingSession *)self _estimateSizeOfJsonObject:v13];
      if (v18 < 0) {
        break;
      }
      v10 += v18;
      [v8 addObject:v13];
LABEL_23:

      if (v94 == ++v11)
      {
        uint64_t v94 = [obj countByEnumeratingWithState:&v98 objects:v108 count:16];
        if (v94) {
          goto LABEL_3;
        }
        goto LABEL_27;
      }
    }
    v19 = v9;
    uint64_t v20 = [v13 objectForKeyedSubscript:@"topic"];
    uint64_t v21 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v21)
    {
      uint64_t v21 = +[SSLogConfig sharedConfig];
    }
    int v22 = [v21 shouldLog];
    if ([v21 shouldLogToDisk]) {
      v22 |= 2u;
    }
    v23 = [v21 OSLogObject];
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      v22 &= 2u;
    }
    if (v22)
    {
      __int16 v24 = objc_opt_class();
      int v102 = 138412546;
      v103 = v24;
      __int16 v104 = 2112;
      v105[0] = v20;
      id v25 = v24;
      LODWORD(v88) = 22;
      v87 = &v102;
      uint64_t v26 = (void *)_os_log_send_and_compose_impl();

      id v8 = v90;
      if (!v26)
      {
LABEL_22:

        uint64_t v9 = v19;
        self = v91;
        goto LABEL_23;
      }
      v23 = objc_msgSend(NSString, "stringWithCString:encoding:", v26, 4, &v102, v88);
      free(v26);
      SSFileLog(v21, @"%@", v27, v28, v29, v30, v31, v32, (uint64_t)v23);
    }

    goto LABEL_22;
  }
LABEL_27:

  if ([v8 count])
  {
    v107[0] = &unk_1EF9A9A18;
    v106[0] = @"deliveryVersion";
    v106[1] = @"postTime";
    v33 = NSNumber;
    v34 = [MEMORY[0x1E4F1C9C8] date];
    [v34 timeIntervalSince1970];
    v36 = [v33 numberWithInteger:(uint64_t)(v35 * 1000.0)];
    v106[2] = @"events";
    v107[1] = v36;
    v107[2] = v8;
    v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v107 forKeys:v106 count:3];

    id v97 = 0;
    v38 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v37 options:0 error:&v97];
    v39 = v97;
    if (v39)
    {
      v40 = +[SSLogConfig sharedStoreServicesConfig];
      v41 = v89;
      if (!v40)
      {
        v40 = +[SSLogConfig sharedConfig];
      }
      int v42 = objc_msgSend(v40, "shouldLog", v87);
      if ([v40 shouldLogToDisk]) {
        v42 |= 2u;
      }
      v43 = [v40 OSLogObject];
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        int v44 = v42;
      }
      else {
        int v44 = v42 & 2;
      }
      if (!v44) {
        goto LABEL_74;
      }
      v45 = objc_opt_class();
      int v102 = 138543619;
      v103 = v45;
      __int16 v104 = 2113;
      v105[0] = v37;
      id v46 = v45;
      LODWORD(v88) = 22;
      v47 = (void *)_os_log_send_and_compose_impl();

      if (!v47) {
        goto LABEL_75;
      }
      goto LABEL_73;
    }
    v96 = v9;
    id v58 = v38;
    v41 = v89;
    uint64_t v59 = objc_msgSend(v89, "write:maxLength:", objc_msgSend(v58, "bytes"), objc_msgSend(v58, "length"));
    uint64_t v60 = [v58 length];
    uint64_t v61 = +[SSLogConfig sharedStoreServicesConfig];
    v40 = (void *)v61;
    if (v59 != v60)
    {
      if (!v61)
      {
        v40 = +[SSLogConfig sharedConfig];
      }
      int v75 = objc_msgSend(v40, "shouldLog", v87);
      if ([v40 shouldLogToDisk]) {
        v75 |= 2u;
      }
      v43 = [v40 OSLogObject];
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        int v76 = v75;
      }
      else {
        int v76 = v75 & 2;
      }
      if (!v76)
      {
        uint64_t v9 = v96;
        goto LABEL_74;
      }
      v77 = objc_opt_class();
      id v78 = v77;
      uint64_t v79 = [v58 length];
      int v102 = 138543874;
      v103 = v77;
      __int16 v104 = 1026;
      LODWORD(v105[0]) = v59;
      WORD2(v105[0]) = 2050;
      *(void *)((char *)v105 + 6) = v79;
      LODWORD(v88) = 28;
      v47 = (void *)_os_log_send_and_compose_impl();

      v41 = v89;
      uint64_t v9 = v96;
      if (!v47)
      {
LABEL_75:

        v51 = 0;
LABEL_76:

        id v8 = v90;
        goto LABEL_77;
      }
LABEL_73:
      v43 = objc_msgSend(NSString, "stringWithCString:encoding:", v47, 4, &v102, v88);
      free(v47);
      SSFileLog(v40, @"%@", v80, v81, v82, v83, v84, v85, (uint64_t)v43);
LABEL_74:

      goto LABEL_75;
    }
    if (!v61)
    {
      v40 = +[SSLogConfig sharedConfig];
    }
    int v62 = objc_msgSend(v40, "shouldLog", v87);
    if ([v40 shouldLogToDisk]) {
      v62 |= 2u;
    }
    v63 = [v40 OSLogObject];
    if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO)) {
      int v64 = v62;
    }
    else {
      int v64 = v62 & 2;
    }
    if (v64)
    {
      v65 = objc_opt_class();
      int v102 = 138543618;
      v103 = v65;
      __int16 v104 = 1026;
      LODWORD(v105[0]) = v59;
      id v66 = v65;
      LODWORD(v88) = 18;
      v67 = (void *)_os_log_send_and_compose_impl();

      if (!v67)
      {
LABEL_60:

        v74 = malloc_type_malloc(0x14uLL, 0x67FF8560uLL);
        v51 = v74;
        if (v74)
        {
          void *v74 = 0;
          v74[1] = 0;
          *((_DWORD *)v74 + 4) = 0;
          CC_SHA1((const void *)[v58 bytes], v59, (unsigned __int8 *)v74);
          v51 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v51 length:20];
        }
        uint64_t v9 = v96;
        goto LABEL_76;
      }
      v63 = objc_msgSend(NSString, "stringWithCString:encoding:", v67, 4, &v102, v88);
      free(v67);
      SSFileLog(v40, @"%@", v68, v69, v70, v71, v72, v73, (uint64_t)v63);
    }

    goto LABEL_60;
  }
  v37 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v37)
  {
    v37 = +[SSLogConfig sharedConfig];
  }
  int v48 = objc_msgSend(v37, "shouldLog", v87);
  if ([v37 shouldLogToDisk]) {
    v48 |= 2u;
  }
  v39 = [v37 OSLogObject];
  if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT)) {
    v48 &= 2u;
  }
  if (v48)
  {
    v49 = objc_opt_class();
    int v102 = 138543362;
    v103 = v49;
    id v50 = v49;
    LODWORD(v88) = 12;
    v51 = (void *)_os_log_send_and_compose_impl();

    v41 = v89;
    if (!v51) {
      goto LABEL_78;
    }
    v39 = objc_msgSend(NSString, "stringWithCString:encoding:", v51, 4, &v102, v88);
    free(v51);
    SSFileLog(v37, @"%@", v52, v53, v54, v55, v56, v57, (uint64_t)v39);
    v51 = 0;
  }
  else
  {
    v51 = 0;
    v41 = v89;
  }
LABEL_77:

LABEL_78:
  return v51;
}

- (int64_t)_estimateSizeOfJsonObject:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v32 = v3;
  [v4 addObject:v3];
  uint64_t v41 = 0;
  int v42 = &v41;
  uint64_t v43 = 0x2020000000;
  uint64_t v44 = 0;
  while (1)
  {
    if (![v4 count])
    {
      int64_t v12 = v42[3];
      goto LABEL_16;
    }
    uint64_t v5 = [v4 count] - 1;
    uint64_t v6 = [v4 objectAtIndex:v5];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v42[3] += 2;
      uint64_t v7 = [v6 lengthOfBytesUsingEncoding:4];
      id v8 = v42;
      uint64_t v9 = v42[3] + v7;
LABEL_5:
      v8[3] = v9;
      goto LABEL_8;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v10 = [v6 stringValue];
      uint64_t v11 = [v10 lengthOfBytesUsingEncoding:4];
      v42[3] += v11;

      goto LABEL_8;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v42;
      uint64_t v9 = v42[3] + 4;
      goto LABEL_5;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v42[3] += 2;
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __60__SSMetricsEventReportingSession__estimateSizeOfJsonObject___block_invoke;
      v37[3] = &unk_1E5BAEA00;
      char v40 = 1;
      v39 = &v41;
      id v38 = v4;
      [v6 enumerateKeysAndObjectsUsingBlock:v37];

      goto LABEL_8;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
    v42[3] += 2;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __60__SSMetricsEventReportingSession__estimateSizeOfJsonObject___block_invoke_2;
    v33[3] = &unk_1E5BAEA28;
    char v36 = 1;
    double v35 = &v41;
    id v34 = v4;
    [v6 enumerateObjectsUsingBlock:v33];

LABEL_8:
    [v4 removeObjectAtIndex:v5];
  }
  uint64_t v14 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v14)
  {
    uint64_t v14 = +[SSLogConfig sharedConfig];
  }
  int v15 = [v14 shouldLog];
  int v16 = [v14 shouldLogToDisk];
  long long v17 = [v14 OSLogObject];
  int64_t v18 = v17;
  if (v16) {
    int v19 = v15 | 2;
  }
  else {
    int v19 = v15;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    int v20 = v19;
  }
  else {
    int v20 = v19 & 2;
  }
  if (v20)
  {
    id v21 = (id)objc_opt_class();
    int v22 = objc_opt_class();
    int v45 = 138543874;
    id v46 = v21;
    __int16 v47 = 2112;
    int v48 = v6;
    __int16 v49 = 2114;
    id v50 = v22;
    id v23 = v22;
    LODWORD(v31) = 32;
    __int16 v24 = (void *)_os_log_send_and_compose_impl();

    if (v24)
    {
      int64_t v18 = objc_msgSend(NSString, "stringWithCString:encoding:", v24, 4, &v45, v31);
      free(v24);
      SSFileLog(v14, @"%@", v25, v26, v27, v28, v29, v30, (uint64_t)v18);
      goto LABEL_28;
    }
  }
  else
  {
LABEL_28:
  }
  int64_t v12 = -1;
LABEL_16:
  _Block_object_dispose(&v41, 8);

  return v12;
}

void __60__SSMetricsEventReportingSession__estimateSizeOfJsonObject___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (!*(unsigned char *)(a1 + 48)) {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 addObject:a2];
  [*(id *)(a1 + 32) addObject:v6];
}

uint64_t __60__SSMetricsEventReportingSession__estimateSizeOfJsonObject___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a1 + 48)) {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)_unreportedEvents
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  unreportedEvents = self->_unreportedEvents;
  if (!unreportedEvents)
  {
    id v4 = [(SSMetricsEventController *)self->_eventController unreportedEventsForURL:self->_reportingURL since:self->_insertTimestamp suppressUserInfo:self->_suppressUserInfo];
    uint64_t v5 = self->_unreportedEvents;
    self->_unreportedEvents = v4;

    id v6 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v6)
    {
      id v6 = +[SSLogConfig sharedConfig];
    }
    int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    uint64_t v9 = [v6 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      v8 &= 2u;
    }
    if (v8)
    {
      int64_t v10 = objc_opt_class();
      uint64_t v11 = self->_unreportedEvents;
      id v12 = v10;
      int v22 = 138412546;
      id v23 = v10;
      __int16 v24 = 1024;
      int v25 = [(NSArray *)v11 count];
      LODWORD(v21) = 18;
      uint64_t v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_13:

        unreportedEvents = self->_unreportedEvents;
        goto LABEL_14;
      }
      uint64_t v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v22, v21);
      free(v13);
      SSFileLog(v6, @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v9);
    }

    goto LABEL_13;
  }
LABEL_14:
  return unreportedEvents;
}

- (void)_writeString:(id)a3 toData:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  id v6 = (void *)MEMORY[0x1A6267F60]();
  int v7 = [v8 dataUsingEncoding:4];
  [v5 appendData:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionCanaryIdentifier, 0);
  objc_storeStrong((id *)&self->_eventController, 0);
  objc_storeStrong((id *)&self->_unreportedEventPIDs, 0);
  objc_storeStrong((id *)&self->_unreportedEvents, 0);
  objc_storeStrong((id *)&self->_reportingURL, 0);
}

@end