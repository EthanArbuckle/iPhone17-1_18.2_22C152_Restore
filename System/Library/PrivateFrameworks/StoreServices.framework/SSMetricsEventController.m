@interface SSMetricsEventController
- (BOOL)deleteEventsInsertedBefore:(int64_t)a3;
- (BOOL)deleteReportedEvents;
- (BOOL)insertEventSummaries:(id)a3 error:(id *)a4;
- (BOOL)markEventsAsReported:(id)a3;
- (SSMetricsEventController)init;
- (id)_collectUnreportedEventsFromDatabase:(id)a3 since:(int64_t)a4;
- (id)_collectUnreportedPIDsFromDatabase:(id)a3 matchingReportURLString:(id)a4 since:(int64_t)a5 suppressUserInfo:(BOOL)a6;
- (id)unreportedEventURLsSince:(int64_t)a3;
- (id)unreportedEventsForURL:(id)a3 since:(int64_t)a4 suppressUserInfo:(BOOL)a5;
- (id)unreportedEventsSince:(int64_t)a3;
- (int)_maximumUnreportedToSelect;
- (int64_t)countUnreportedEventsBefore:(int64_t)a3;
- (void)_serialQueueInsertEvents:(id)a3 withCompletionHandler:(id)a4;
- (void)flushUnreportedEventsWithCompletionHandler:(id)a3;
@end

@implementation SSMetricsEventController

- (SSMetricsEventController)init
{
  v6.receiver = self;
  v6.super_class = (Class)SSMetricsEventController;
  v2 = [(SSMetricsController *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(SSMetricsEventTable);
    table = v2->_table;
    v2->_table = v3;
  }
  return v2;
}

- (void)_serialQueueInsertEvents:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  v8 = [(SSMetricsController *)self configuration];
  v9 = [v8 reportingURLString];
  v10 = [(SSMetricsController *)self _cookieValuesForConfiguration:v8];
  if ([v10 count])
  {
    v11 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v10, @"cookies", 0);
  }
  else
  {
    v11 = 0;
  }
  table = self->_table;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __75__SSMetricsEventController__serialQueueInsertEvents_withCompletionHandler___block_invoke;
  v17[3] = &unk_1E5BAE7F0;
  id v18 = v6;
  id v19 = v8;
  id v20 = v11;
  id v21 = v9;
  v22 = self;
  id v13 = v9;
  id v14 = v11;
  id v15 = v8;
  id v16 = v6;
  [(SSMetricsEventTable *)table performTransactionWithBlock:v17];
  if (v7) {
    v7[2](v7, 0);
  }
}

BOOL __75__SSMetricsEventController__serialQueueInsertEvents_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v53 = a2;
  uint64_t v80 = 0;
  v81 = &v80;
  uint64_t v82 = 0x2020000000;
  char v83 = 0;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  v54 = objc_msgSend(NSNumber, "numberWithDouble:");
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v76 objects:v90 count:16];
  if (v3)
  {
    uint64_t v57 = *(void *)v77;
    do
    {
      uint64_t v62 = 0;
      do
      {
        if (*(void *)v77 != v57) {
          objc_enumerationMutation(obj);
        }
        v4 = *(void **)(*((void *)&v76 + 1) + 8 * v62);
        if (objc_msgSend(v4, "isBlacklistedByConfiguration:", *(void *)(a1 + 40), v51, v52))
        {
          v5 = +[SSLogConfig sharedStoreServicesConfig];
          if (!v5)
          {
            v5 = +[SSLogConfig sharedConfig];
          }
          int v6 = [v5 shouldLog];
          int v7 = [v5 shouldLogToDisk];
          v8 = [v5 OSLogObject];
          v9 = v8;
          if (v7) {
            int v10 = v6 | 2;
          }
          else {
            int v10 = v6;
          }
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
            int v11 = v10;
          }
          else {
            int v11 = v10 & 2;
          }
          if (v11)
          {
            v12 = objc_opt_class();
            int v84 = 138412546;
            v85 = v12;
            __int16 v86 = 2112;
            v87 = v4;
            id v13 = v12;
            LODWORD(v52) = 22;
            v51 = &v84;
            id v14 = (void *)_os_log_send_and_compose_impl();

            if (v14)
            {
              v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v84, v52);
              free(v14);
              SSFileLog(v5, @"%@", v15, v16, v17, v18, v19, v20, (uint64_t)v9);
              goto LABEL_18;
            }
          }
          else
          {
LABEL_18:
          }
          goto LABEL_37;
        }
        context = (void *)MEMORY[0x1A6267F60]();
        v59 = [v4 allTableEntityPropertiesPermittedByConfiguration:*(void *)(a1 + 40) externalValues:*(void *)(a1 + 48)];
        if ([v59 count])
        {
          v58 = [v4 decorateReportingURL:*(void *)(a1 + 56)];
          [v59 setObject:v54 forKey:@"timestampInserted"];
          [v59 setObject:&unk_1EF9A9948 forKey:@"timestampReported"];
          [v59 setObject:v58 forKey:@"report_url"];
          v60 = +[SSMetricsEventTableEntity databaseTable];
          id v21 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"INSERT OR REPLACE INTO "];
          [v21 appendString:v60];
          objc_msgSend(v21, "appendString:", @" (");
          [v21 appendString:@"pid"];
          uint64_t v22 = a1;
          long long v74 = 0u;
          long long v75 = 0u;
          long long v72 = 0u;
          long long v73 = 0u;
          id v23 = v59;
          uint64_t v24 = [v23 countByEnumeratingWithState:&v72 objects:v89 count:16];
          if (v24)
          {
            uint64_t v25 = *(void *)v73;
            do
            {
              for (uint64_t i = 0; i != v24; ++i)
              {
                if (*(void *)v73 != v25) {
                  objc_enumerationMutation(v23);
                }
                uint64_t v27 = *(void *)(*((void *)&v72 + 1) + 8 * i);
                [v21 appendString:@", "];
                [v21 appendString:v27];
              }
              uint64_t v24 = [v23 countByEnumeratingWithState:&v72 objects:v89 count:16];
            }
            while (v24);
          }

          a1 = v22;
          [v21 appendString:@") VALUES (?"];
          long long v70 = 0u;
          long long v71 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          id v28 = v23;
          uint64_t v29 = [v28 countByEnumeratingWithState:&v68 objects:v88 count:16];
          if (v29)
          {
            uint64_t v30 = *(void *)v69;
            while (1)
            {
              if (*(void *)v69 != v30) {
                objc_enumerationMutation(v28);
              }
              [v21 appendString:@", ?"];
              if (!--v29)
              {
                uint64_t v29 = [v28 countByEnumeratingWithState:&v68 objects:v88 count:16];
                if (!v29) {
                  break;
                }
              }
            }
          }

          [v21 appendString:@";"]);
          CFUUIDRef v31 = CFUUIDCreate(0);
          uint64_t v32 = *(_OWORD *)&CFUUIDGetUUIDBytes(v31);
          CFRelease(v31);
          v63[0] = MEMORY[0x1E4F143A8];
          v63[1] = 3221225472;
          v63[2] = __75__SSMetricsEventController__serialQueueInsertEvents_withCompletionHandler___block_invoke_25;
          v63[3] = &unk_1E5BAE7C8;
          uint64_t v67 = v32;
          id v64 = v28;
          v66 = &v80;
          id v65 = v53;
          [v65 prepareStatementForSQL:v21 cache:0 usingBlock:v63];

LABEL_35:
          goto LABEL_36;
        }
        v33 = +[SSLogConfig sharedStoreServicesConfig];
        if (!v33)
        {
          v33 = +[SSLogConfig sharedConfig];
        }
        int v34 = [v33 shouldLog];
        int v35 = [v33 shouldLogToDisk];
        v58 = v33;
        v36 = [v33 OSLogObject];
        if (v35) {
          int v37 = v34 | 2;
        }
        else {
          int v37 = v34;
        }
        v60 = v36;
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
          int v38 = v37;
        }
        else {
          int v38 = v37 & 2;
        }
        if (!v38) {
          goto LABEL_35;
        }
        v39 = objc_opt_class();
        int v84 = 138412546;
        v85 = v39;
        __int16 v86 = 2112;
        v87 = v4;
        id v40 = v39;
        LODWORD(v52) = 22;
        v51 = &v84;
        v41 = (void *)_os_log_send_and_compose_impl();

        if (v41)
        {
          v61 = objc_msgSend(NSString, "stringWithCString:encoding:", v41, 4, &v84, v52);
          free(v41);
          SSFileLog(v33, @"%@", v42, v43, v44, v45, v46, v47, (uint64_t)v61);
        }
LABEL_36:

        if (!*((unsigned char *)v81 + 24)) {
          goto LABEL_51;
        }
LABEL_37:
        ++v62;
      }
      while (v62 != v3);
      uint64_t v48 = [obj countByEnumeratingWithState:&v76 objects:v90 count:16];
      uint64_t v3 = v48;
    }
    while (v48);
  }
LABEL_51:

  BOOL v49 = *((unsigned char *)v81 + 24) != 0;
  _Block_object_dispose(&v80, 8);

  return v49;
}

uint64_t __75__SSMetricsEventController__serialQueueInsertEvents_withCompletionHandler___block_invoke_25(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 56));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    int v8 = 2;
    do
    {
      uint64_t v9 = 0;
      int v10 = v8;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        int v11 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *(void *)(*((void *)&v13 + 1) + 8 * v9), (void)v13);
        SSSQLiteBindFoundationValueToStatement(a2, v10 + v9, v11);

        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      int v8 = v10 + v9;
    }
    while (v6);
  }

  uint64_t result = [*(id *)(a1 + 40) statementDidFinishAfterStepping:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (int64_t)countUnreportedEventsBefore:(int64_t)a3
{
  uint64_t v9 = 0;
  int v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  uint64_t v5 = [(SSMetricsController *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__SSMetricsEventController_countUnreportedEventsBefore___block_invoke;
  block[3] = &unk_1E5BA86A8;
  block[5] = &v9;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(v5, block);

  int64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __56__SSMetricsEventController_countUnreportedEventsBefore___block_invoke(void *a1)
{
  v1 = *(void **)(a1[4] + 72);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__SSMetricsEventController_countUnreportedEventsBefore___block_invoke_2;
  v4[3] = &unk_1E5BAE818;
  uint64_t v2 = a1[6];
  v4[4] = a1[5];
  v4[5] = v2;
  return [v1 performTransactionWithBlock:v4];
}

uint64_t __56__SSMetricsEventController_countUnreportedEventsBefore___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SSMetricsEventTableEntity databaseTable];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"SELECT COUNT(%@) FROM %@ WHERE %@ = 0 AND %@ < %lld", @"pid", v4, @"timestampReported", @"timestampInserted", *(void *)(a1 + 40)];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__SSMetricsEventController_countUnreportedEventsBefore___block_invoke_3;
  v7[3] = &unk_1E5BAE7A0;
  v7[4] = *(void *)(a1 + 32);
  [v3 prepareStatementForSQL:v5 cache:0 usingBlock:v7];

  return 1;
}

void __56__SSMetricsEventController_countUnreportedEventsBefore___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  if (+[SSSQLiteDatabase statementHasRowAfterStepping:a2])
  {
    id v4 = (id)SSSQLiteCopyFoundationValueForStatementColumn(a2, 0);
    if (objc_opt_respondsToSelector()) {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v4 integerValue];
    }
  }
}

- (BOOL)deleteEventsInsertedBefore:(int64_t)a3
{
  uint64_t v5 = +[SSMetricsEventTableEntity databaseTable];
  int64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"DELETE FROM %@ WHERE %@ < %lld;",
                 v5,
                 @"timestampInserted",
                 a3);
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v7 = [(SSMetricsController *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__SSMetricsEventController_deleteEventsInsertedBefore___block_invoke;
  block[3] = &unk_1E5BAE868;
  id v11 = v6;
  uint64_t v12 = &v13;
  block[4] = self;
  id v8 = v6;
  dispatch_sync(v7, block);

  LOBYTE(v6) = *((unsigned char *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return (char)v6;
}

void __55__SSMetricsEventController_deleteEventsInsertedBefore___block_invoke(void *a1)
{
  uint64_t v2 = *(void **)(a1[4] + 72);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__SSMetricsEventController_deleteEventsInsertedBefore___block_invoke_2;
  v6[3] = &unk_1E5BAE840;
  id v3 = (void *)a1[5];
  uint64_t v9 = a1[6];
  id v4 = v3;
  uint64_t v5 = a1[4];
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 performTransactionWithBlock:v6];
}

uint64_t __55__SSMetricsEventController_deleteEventsInsertedBefore___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v4 executeSQL:v3];
  int v5 = [v4 countChanges];

  int64_t v6 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v6)
  {
    int64_t v6 = +[SSLogConfig sharedConfig];
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
  if (!v8) {
    goto LABEL_11;
  }
  int v10 = objc_opt_class();
  int v11 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  *(_DWORD *)uint64_t v22 = 138412802;
  *(void *)&v22[4] = v10;
  *(_WORD *)&v22[12] = 1024;
  *(_DWORD *)&v22[14] = v11;
  *(_WORD *)&v22[18] = 1024;
  *(_DWORD *)&v22[20] = v5;
  id v12 = v10;
  LODWORD(v21) = 24;
  uint64_t v13 = (void *)_os_log_send_and_compose_impl();

  if (v13)
  {
    uint64_t v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, v22, v21, *(_OWORD *)v22, *(void *)&v22[16], v23);
    free(v13);
    SSFileLog(v6, @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v9);
LABEL_11:
  }
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

- (BOOL)deleteReportedEvents
{
  uint64_t v3 = +[SSMetricsEventTableEntity databaseTable];
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"DELETE FROM %@ WHERE %@ != 0;",
                 v3,
                 @"timestampReported");
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  int v5 = [(SSMetricsController *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__SSMetricsEventController_deleteReportedEvents__block_invoke;
  block[3] = &unk_1E5BAE868;
  id v9 = v4;
  int v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v4;
}

void __48__SSMetricsEventController_deleteReportedEvents__block_invoke(void *a1)
{
  uint64_t v2 = *(void **)(a1[4] + 72);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__SSMetricsEventController_deleteReportedEvents__block_invoke_2;
  v6[3] = &unk_1E5BAE840;
  uint64_t v3 = (void *)a1[5];
  uint64_t v9 = a1[6];
  id v4 = v3;
  uint64_t v5 = a1[4];
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 performTransactionWithBlock:v6];
}

uint64_t __48__SSMetricsEventController_deleteReportedEvents__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v4 executeSQL:v3];
  int v5 = [v4 countChanges];

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
  if (!v8) {
    goto LABEL_11;
  }
  int v10 = objc_opt_class();
  int v11 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  *(_DWORD *)uint64_t v22 = 138412802;
  *(void *)&v22[4] = v10;
  *(_WORD *)&v22[12] = 1024;
  *(_DWORD *)&v22[14] = v11;
  *(_WORD *)&v22[18] = 1024;
  *(_DWORD *)&v22[20] = v5;
  id v12 = v10;
  LODWORD(v21) = 24;
  uint64_t v13 = (void *)_os_log_send_and_compose_impl();

  if (v13)
  {
    uint64_t v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, v22, v21, *(_OWORD *)v22, *(void *)&v22[16], v23);
    free(v13);
    SSFileLog(v6, @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v9);
LABEL_11:
  }
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

- (void)flushUnreportedEventsWithCompletionHandler:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v5)
  {
    int v5 = +[SSLogConfig sharedConfig];
  }
  int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  int v8 = [v5 OSLogObject];
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    v7 &= 2u;
  }
  if (!v7) {
    goto LABEL_11;
  }
  int v19 = 138412290;
  id v20 = (id)objc_opt_class();
  id v9 = v20;
  LODWORD(v17) = 12;
  int v10 = (void *)_os_log_send_and_compose_impl();

  if (v10)
  {
    int v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v19, v17);
    free(v10);
    SSFileLog(v5, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v8);
LABEL_11:
  }
  v18.receiver = self;
  v18.super_class = (Class)SSMetricsEventController;
  [(SSMetricsController *)&v18 flushUnreportedEventsWithCompletionHandler:v4];
}

- (BOOL)insertEventSummaries:(id)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v33 = 0;
  int v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__82;
  int v37 = __Block_byref_object_dispose__82;
  id v38 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 1;
  if ([v6 count])
  {
    int v7 = [(SSMetricsController *)self serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__SSMetricsEventController_insertEventSummaries_error___block_invoke;
    block[3] = &unk_1E5BAE8E0;
    block[4] = self;
    id v26 = v6;
    uint64_t v27 = &v33;
    id v28 = &v29;
    dispatch_sync(v7, block);

    goto LABEL_14;
  }
  int v8 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v8)
  {
    int v8 = +[SSLogConfig sharedConfig];
  }
  int v9 = [v8 shouldLog];
  int v10 = [v8 shouldLogToDisk];
  uint64_t v11 = [v8 OSLogObject];
  uint64_t v12 = v11;
  if (v10) {
    v9 |= 2u;
  }
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
    v9 &= 2u;
  }
  if (!v9) {
    goto LABEL_12;
  }
  uint64_t v13 = objc_opt_class();
  int v39 = 138412290;
  id v40 = v13;
  id v14 = v13;
  LODWORD(v24) = 12;
  uint64_t v15 = (void *)_os_log_send_and_compose_impl();

  if (v15)
  {
    uint64_t v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v39, v24);
    free(v15);
    SSFileLog(v8, @"%@", v16, v17, v18, v19, v20, v21, (uint64_t)v12);
LABEL_12:
  }
LABEL_14:
  if (a4) {
    *a4 = (id) v34[5];
  }
  BOOL v22 = *((unsigned char *)v30 + 24) != 0;
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  return v22;
}

void __55__SSMetricsEventController_insertEventSummaries_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 72);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__SSMetricsEventController_insertEventSummaries_error___block_invoke_2;
  v5[3] = &unk_1E5BAE8B8;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  long long v8 = *(_OWORD *)(a1 + 48);
  [v2 performTransactionWithBlock:v5];
}

BOOL __55__SSMetricsEventController_insertEventSummaries_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v45 = a2;
  uint64_t v70 = 0;
  long long v71 = &v70;
  uint64_t v72 = 0x2020000000;
  char v73 = 1;
  uint64_t v46 = +[SSMetricsEventTableEntity databaseTable];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v66 objects:v82 count:16];
  if (v3)
  {
    uint64_t v48 = *(void *)v67;
    do
    {
      uint64_t v5 = 0;
      uint64_t v49 = v3;
      do
      {
        if (*(void *)v67 != v48) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v66 + 1) + 8 * v5);
        context = (void *)MEMORY[0x1A6267F60](v3, v4);
        v51 = [v6 objectForKey:@"report_url"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || ![v51 length])
        {
          uint64_t v23 = +[SSLogConfig sharedStoreServicesConfig];
          if (!v23)
          {
            uint64_t v23 = +[SSLogConfig sharedConfig];
          }
          int v24 = [v23 shouldLog];
          int v25 = [v23 shouldLogToDisk];
          id v26 = [v23 OSLogObject];
          uint64_t v27 = v26;
          if (v25) {
            v24 |= 2u;
          }
          if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            v24 &= 2u;
          }
          if (v24)
          {
            id v28 = objc_opt_class();
            int v74 = 138412802;
            long long v75 = v28;
            __int16 v76 = 2112;
            long long v77 = @"report_url";
            __int16 v78 = 2112;
            long long v79 = v6;
            id v29 = v28;
            LODWORD(v44) = 32;
            uint64_t v43 = &v74;
            uint64_t v30 = (void *)_os_log_send_and_compose_impl();

            if (v30)
            {
              uint64_t v27 = objc_msgSend(NSString, "stringWithCString:encoding:", v30, 4, &v74, v44);
              free(v30);
              SSFileLog(v23, @"%@", v31, v32, v33, v34, v35, v36, (uint64_t)v27);
              goto LABEL_32;
            }
          }
          else
          {
LABEL_32:
          }
LABEL_36:
          int v22 = 0;
          goto LABEL_37;
        }
        uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"INSERT OR REPLACE INTO "];
        [v7 appendString:v46];
        objc_msgSend(v7, "appendString:", @" (");
        [v7 appendString:@"pid"];
        long long v64 = 0u;
        long long v65 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        id v8 = v6;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v62 objects:v81 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v63;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v63 != v10) {
                objc_enumerationMutation(v8);
              }
              uint64_t v12 = *(void *)(*((void *)&v62 + 1) + 8 * i);
              [v7 appendString:@", ", v43];
              [v7 appendString:v12];
            }
            uint64_t v9 = [v8 countByEnumeratingWithState:&v62 objects:v81 count:16];
          }
          while (v9);
        }

        [v7 appendString:@") VALUES (?"];
        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        id v13 = v8;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v58 objects:v80 count:16];
        if (v14)
        {
          uint64_t v15 = *(void *)v59;
          while (1)
          {
            if (*(void *)v59 != v15) {
              objc_enumerationMutation(v13);
            }
            [v7 appendString:@", ?", v43];
            if (!--v14)
            {
              uint64_t v14 = [v13 countByEnumeratingWithState:&v58 objects:v80 count:16];
              if (!v14) {
                break;
              }
            }
          }
        }

        [v7 appendString:@";"]);
        CFUUIDRef v16 = CFUUIDCreate(0);
        uint64_t v17 = *(_OWORD *)&CFUUIDGetUUIDBytes(v16);
        CFRelease(v16);
        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v52[2] = __55__SSMetricsEventController_insertEventSummaries_error___block_invoke_3;
        v52[3] = &unk_1E5BAE890;
        v52[4] = v13;
        v56 = &v70;
        uint64_t v57 = v17;
        id v18 = v45;
        uint64_t v19 = *(void *)(a1 + 40);
        id v53 = v18;
        uint64_t v54 = v19;
        id v20 = v7;
        id v55 = v20;
        [v18 prepareStatementForSQL:v20 cache:1 usingBlock:v52];
        int v21 = *((unsigned __int8 *)v71 + 24);
        if (*((unsigned char *)v71 + 24))
        {
          int v22 = 0;
        }
        else
        {
          uint64_t v37 = SSError(@"SSErrorDomain", 100, 0, 0);
          uint64_t v38 = *(void *)(*(void *)(a1 + 48) + 8);
          int v39 = *(void **)(v38 + 40);
          *(void *)(v38 + 40) = v37;

          int v22 = 2;
        }

        if (v21) {
          goto LABEL_36;
        }
LABEL_37:

        uint64_t v3 = v49;
        if (v22) {
          goto LABEL_40;
        }
        ++v5;
      }
      while (v5 != v49);
      uint64_t v3 = [obj countByEnumeratingWithState:&v66 objects:v82 count:16];
    }
    while (v3);
  }
LABEL_40:

  id v40 = v71;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *((unsigned char *)v71 + 24);
  BOOL v41 = *((unsigned __int8 *)v40 + 24) != 0;

  _Block_object_dispose(&v70, 8);
  return v41;
}

void __55__SSMetricsEventController_insertEventSummaries_error___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 72));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v29;
    int v8 = 2;
    do
    {
      uint64_t v9 = 0;
      int v10 = v8;
      do
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = [*(id *)(a1 + 32) objectForKey:*(void *)(*((void *)&v28 + 1) + 8 * v9)];
        SSSQLiteBindFoundationValueToStatement(a2, v10 + v9, v11);

        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v28 objects:v38 count:16];
      int v8 = v10 + v9;
    }
    while (v6);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(a1 + 40) statementDidFinishAfterStepping:a2];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    uint64_t v12 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v12)
    {
      uint64_t v12 = +[SSLogConfig sharedConfig];
    }
    int v13 = [v12 shouldLog];
    if ([v12 shouldLogToDisk]) {
      int v14 = v13 | 2;
    }
    else {
      int v14 = v13;
    }
    uint64_t v15 = [v12 OSLogObject];
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      v14 &= 2u;
    }
    if (v14)
    {
      CFUUIDRef v16 = objc_opt_class();
      uint64_t v17 = *(void *)(a1 + 56);
      uint64_t v18 = *(void *)(a1 + 32);
      int v32 = 138412802;
      uint64_t v33 = v16;
      __int16 v34 = 2112;
      uint64_t v35 = v17;
      __int16 v36 = 2112;
      uint64_t v37 = v18;
      id v19 = v16;
      LODWORD(v27) = 32;
      id v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20)
      {
LABEL_20:

        return;
      }
      uint64_t v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v20, 4, &v32, v27, (void)v28);
      free(v20);
      SSFileLog(v12, @"%@", v21, v22, v23, v24, v25, v26, (uint64_t)v15);
    }

    goto LABEL_20;
  }
}

- (BOOL)markEventsAsReported:(id)a3
{
  id v4 = a3;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  uint64_t v6 = (uint64_t)v5;
  uint64_t v7 = +[SSMetricsEventTableEntity databaseTable];
  int v8 = [v4 componentsJoinedByString:@","];
  uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"UPDATE %@ SET %@ = %lld WHERE (%@ IN (%@)) AND %@ = 0;",
                 v7,
                 @"timestampReported",
                 v6,
                 @"pid",
                 v8,
                 @"timestampReported");
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  int v10 = [(SSMetricsController *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__SSMetricsEventController_markEventsAsReported___block_invoke;
  block[3] = &unk_1E5BAE868;
  id v14 = v9;
  uint64_t v15 = &v16;
  block[4] = self;
  id v11 = v9;
  dispatch_sync(v10, block);

  LOBYTE(v9) = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return (char)v9;
}

void __49__SSMetricsEventController_markEventsAsReported___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 72);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__SSMetricsEventController_markEventsAsReported___block_invoke_2;
  v4[3] = &unk_1E5BAE908;
  long long v3 = *(_OWORD *)(a1 + 40);
  id v2 = (id)v3;
  long long v5 = v3;
  [v1 performTransactionWithBlock:v4];
}

uint64_t __49__SSMetricsEventController_markEventsAsReported___block_invoke_2(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [a2 executeSQL:*(void *)(a1 + 32)];
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (id)unreportedEventsForURL:(id)a3 since:(int64_t)a4 suppressUserInfo:(BOOL)a5
{
  id v8 = a3;
  uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[SSMetricsEventController _maximumUnreportedToSelect](self, "_maximumUnreportedToSelect"));
  int v10 = [(SSMetricsController *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__SSMetricsEventController_unreportedEventsForURL_since_suppressUserInfo___block_invoke;
  block[3] = &unk_1E5BAE958;
  block[4] = self;
  id v17 = v8;
  int64_t v19 = a4;
  BOOL v20 = a5;
  id v11 = v9;
  id v18 = v11;
  id v12 = v8;
  dispatch_sync(v10, block);

  int v13 = v18;
  id v14 = v11;

  return v14;
}

void __74__SSMetricsEventController_unreportedEventsForURL_since_suppressUserInfo___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  long long v3 = *(void **)(v2 + 72);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__SSMetricsEventController_unreportedEventsForURL_since_suppressUserInfo___block_invoke_2;
  v7[3] = &unk_1E5BAE930;
  v7[4] = v2;
  id v4 = *(id *)(a1 + 40);
  uint64_t v6 = *(void **)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v8 = v4;
  uint64_t v10 = v5;
  char v11 = *(unsigned char *)(a1 + 64);
  id v9 = v6;
  [v3 performTransactionWithBlock:v7];
}

uint64_t __74__SSMetricsEventController_unreportedEventsForURL_since_suppressUserInfo___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1A6267F60]();
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = [*(id *)(a1 + 40) absoluteString];
  uint64_t v7 = [v5 _collectUnreportedPIDsFromDatabase:v3 matchingReportURLString:v6 since:*(void *)(a1 + 56) suppressUserInfo:*(unsigned __int8 *)(a1 + 64)];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        int v13 = *(void **)(*((void *)&v17 + 1) + 8 * v12);
        id v14 = [SSMetricsEventTableEntity alloc];
        uint64_t v15 = -[SSSQLiteEntity initWithPersistentID:inDatabase:](v14, "initWithPersistentID:inDatabase:", objc_msgSend(v13, "longLongValue", (void)v17), v3);
        [*(id *)(a1 + 48) addObject:v15];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return 1;
}

- (id)unreportedEventsSince:(int64_t)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__82;
  int v13 = __Block_byref_object_dispose__82;
  id v14 = 0;
  uint64_t v5 = [(SSMetricsController *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__SSMetricsEventController_unreportedEventsSince___block_invoke;
  block[3] = &unk_1E5BA86A8;
  block[4] = self;
  void block[5] = &v9;
  block[6] = a3;
  dispatch_sync(v5, block);

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __50__SSMetricsEventController_unreportedEventsSince___block_invoke(uint64_t a1)
{
  long long v1 = *(_OWORD *)(a1 + 32);
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 72);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__SSMetricsEventController_unreportedEventsSince___block_invoke_2;
  v4[3] = &unk_1E5BAE980;
  long long v5 = v1;
  uint64_t v6 = *(void *)(a1 + 48);
  return [v2 performTransactionWithBlock:v4];
}

uint64_t __50__SSMetricsEventController_unreportedEventsSince___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1A6267F60]();
  uint64_t v5 = [*(id *)(a1 + 32) _collectUnreportedEventsFromDatabase:v3 since:*(void *)(a1 + 48)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  return 1;
}

- (id)unreportedEventURLsSince:(int64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = [(SSMetricsController *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__SSMetricsEventController_unreportedEventURLsSince___block_invoke;
  block[3] = &unk_1E5BA86D0;
  block[4] = self;
  int64_t v13 = a3;
  id v7 = v5;
  id v12 = v7;
  dispatch_sync(v6, block);

  id v8 = v12;
  id v9 = v7;

  return v9;
}

void __53__SSMetricsEventController_unreportedEventURLsSince___block_invoke(void *a1)
{
  long long v1 = *(void **)(a1[4] + 72);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__SSMetricsEventController_unreportedEventURLsSince___block_invoke_2;
  v3[3] = &unk_1E5BAE9A8;
  uint64_t v2 = (void *)a1[5];
  uint64_t v5 = a1[6];
  id v4 = v2;
  [v1 performTransactionWithBlock:v3];
}

uint64_t __53__SSMetricsEventController_unreportedEventURLsSince___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1A6267F60]();
  uint64_t v5 = +[SSMetricsEventTableEntity databaseTable];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"SELECT DISTINCT(%@) FROM %@ WHERE %@ = 0 AND %@ <= %lld ORDER BY %@ ASC", @"report_url", v5, @"timestampReported", @"timestampInserted", *(void *)(a1 + 40), @"timestampInserted"];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__SSMetricsEventController_unreportedEventURLsSince___block_invoke_3;
  v9[3] = &unk_1E5BAE350;
  id v7 = v3;
  id v10 = v7;
  id v11 = *(id *)(a1 + 32);
  [v7 prepareStatementForSQL:v6 cache:0 usingBlock:v9];

  return 1;
}

void __53__SSMetricsEventController_unreportedEventURLsSince___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = (void *)MEMORY[0x1A6267F60]();
  if ([*(id *)(a1 + 32) statementHasRowAfterStepping:a2])
  {
    do
    {
      if (sqlite3_column_type(a2, 0) == 3)
      {
        uint64_t v5 = sqlite3_column_text(a2, 0);
        if (v5)
        {
          if (*v5)
          {
            uint64_t v6 = (void *)[[NSString alloc] initWithUTF8String:v5];
            id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v6];
            [*(id *)(a1 + 40) addObject:v7];
          }
        }
      }
    }
    while (([*(id *)(a1 + 32) statementHasRowAfterStepping:a2] & 1) != 0);
  }
}

- (id)_collectUnreportedEventsFromDatabase:(id)a3 since:(int64_t)a4
{
  id v6 = a3;
  id v7 = +[SSMetricsEventTableEntity databaseTable];
  uint64_t v8 = [(SSMetricsEventController *)self _maximumUnreportedToSelect];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"SELECT %@ FROM %@ WHERE %@ = 0 AND %@ <= %lld ORDER BY %@ ASC LIMIT %d", @"pid", v7, @"timestampReported", @"timestampInserted", a4, @"timestampInserted", v8];
  id v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:(int)v8];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __71__SSMetricsEventController__collectUnreportedEventsFromDatabase_since___block_invoke;
  v16[3] = &unk_1E5BAE350;
  id v17 = v6;
  id v11 = v10;
  id v18 = v11;
  id v12 = v6;
  [v12 prepareStatementForSQL:v9 cache:0 usingBlock:v16];
  int64_t v13 = v18;
  id v14 = v11;

  return v14;
}

void __71__SSMetricsEventController__collectUnreportedEventsFromDatabase_since___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = (void *)MEMORY[0x1A6267F60]();
  if ([*(id *)(a1 + 32) statementHasRowAfterStepping:a2])
  {
    do
    {
      if (sqlite3_column_type(a2, 0) == 1)
      {
        uint64_t v5 = [(SSSQLiteEntity *)[SSMetricsEventTableEntity alloc] initWithPersistentID:sqlite3_column_int64(a2, 0) inDatabase:*(void *)(a1 + 32)];
        [*(id *)(a1 + 40) addObject:v5];
      }
    }
    while (([*(id *)(a1 + 32) statementHasRowAfterStepping:a2] & 1) != 0);
  }
}

- (id)_collectUnreportedPIDsFromDatabase:(id)a3 matchingReportURLString:(id)a4 since:(int64_t)a5 suppressUserInfo:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = +[SSMetricsEventTableEntity databaseTable];
  uint64_t v13 = [(SSMetricsEventController *)self _maximumUnreportedToSelect];
  id v14 = objc_alloc(MEMORY[0x1E4F28E78]);
  uint64_t v15 = @"0";
  if (v6) {
    uint64_t v15 = @"1";
  }
  uint64_t v16 = (void *)[v14 initWithFormat:@"SELECT %@ FROM %@ WHERE %@ = '%@' AND %@ = 0 AND %@ <= %lld AND %@ = %@ ORDER BY %@ ASC LIMIT %d", @"pid", v12, @"report_url", v11, @"timestampReported", @"timestampInserted", a5, @"supressDsid", v15, @"timestampInserted", v13];

  id v17 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:(int)v13];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __110__SSMetricsEventController__collectUnreportedPIDsFromDatabase_matchingReportURLString_since_suppressUserInfo___block_invoke;
  v23[3] = &unk_1E5BAE350;
  id v24 = v10;
  id v18 = v17;
  id v25 = v18;
  id v19 = v10;
  [v19 prepareStatementForSQL:v16 cache:0 usingBlock:v23];
  long long v20 = v25;
  id v21 = v18;

  return v21;
}

void __110__SSMetricsEventController__collectUnreportedPIDsFromDatabase_matchingReportURLString_since_suppressUserInfo___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = (void *)MEMORY[0x1A6267F60]();
  if ([*(id *)(a1 + 32) statementHasRowAfterStepping:a2])
  {
    do
    {
      if (sqlite3_column_type(a2, 0) == 1)
      {
        uint64_t v5 = objc_msgSend(objc_alloc(NSNumber), "initWithLongLong:", sqlite3_column_int64(a2, 0));
        [*(id *)(a1 + 40) addObject:v5];
      }
    }
    while (([*(id *)(a1 + 32) statementHasRowAfterStepping:a2] & 1) != 0);
  }
}

- (int)_maximumUnreportedToSelect
{
  return 1000;
}

- (void).cxx_destruct
{
}

@end