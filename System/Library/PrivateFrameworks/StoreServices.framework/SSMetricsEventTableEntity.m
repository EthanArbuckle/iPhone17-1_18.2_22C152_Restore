@interface SSMetricsEventTableEntity
+ (id)databaseTable;
- (id)reportingCanaryIdentifier;
- (id)reportingDictionary;
- (id)reportingJSON;
- (void)dealloc;
@end

@implementation SSMetricsEventTableEntity

+ (id)databaseTable
{
  return @"events";
}

- (void)dealloc
{
  reportingDictionary = self->_reportingDictionary;
  self->_reportingDictionary = 0;

  v4.receiver = self;
  v4.super_class = (Class)SSMetricsEventTableEntity;
  [(SSMetricsEventTableEntity *)&v4 dealloc];
}

- (id)reportingCanaryIdentifier
{
  v2 = [(SSMetricsEventTableEntity *)self reportingDictionary];
  v3 = [v2 objectForKey:@"canary"];

  return v3;
}

- (id)reportingDictionary
{
  v36[2] = *MEMORY[0x1E4F143B8];
  reportingDictionary = self->_reportingDictionary;
  if (reportingDictionary)
  {
    v3 = reportingDictionary;
    goto LABEL_27;
  }
  uint64_t v5 = [(SSSQLiteEntity *)self database];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [(SSSQLiteEntity *)self persistentID];

    if (v7)
    {
      v8 = (void *)MEMORY[0x1A6267F60]();
      v36[0] = @"eventBody";
      v36[1] = @"timestampReported";
      uint64_t v34 = 0;
      id v35 = 0;
      [(SSSQLiteEntity *)self getValues:&v34 forProperties:v36 count:2];
      if (![v35 intValue])
      {
        if (v34)
        {
          uint64_t v22 = [MEMORY[0x1E4F28F98] propertyListWithData:v34 options:2 format:0 error:0];
        }
        else
        {
          uint64_t v22 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:5];
        }
        v7 = (NSDictionary *)v22;
        goto LABEL_23;
      }
      v9 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v9)
      {
        v9 = +[SSLogConfig sharedConfig];
      }
      int v10 = [v9 shouldLog];
      if ([v9 shouldLogToDisk]) {
        int v11 = v10 | 2;
      }
      else {
        int v11 = v10;
      }
      v12 = [v9 OSLogObject];
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        v11 &= 2u;
      }
      if (v11)
      {
        v13 = objc_opt_class();
        id v14 = v13;
        int v28 = 138412802;
        v29 = v13;
        __int16 v30 = 2048;
        int64_t v31 = [(SSSQLiteEntity *)self persistentID];
        __int16 v32 = 2112;
        id v33 = v35;
        LODWORD(v27) = 32;
        v15 = (void *)_os_log_send_and_compose_impl();

        if (!v15)
        {
LABEL_17:

          v7 = 0;
LABEL_23:
          for (uint64_t i = 1; i != -1; --i)

          goto LABEL_26;
        }
        v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v28, v27);
        free(v15);
        SSFileLog(v9, @"%@", v16, v17, v18, v19, v20, v21, (uint64_t)v12);
      }

      goto LABEL_17;
    }
  }
  else
  {
    v7 = 0;
  }
LABEL_26:
  v24 = self->_reportingDictionary;
  self->_reportingDictionary = v7;
  v25 = v7;

  v3 = self->_reportingDictionary;
LABEL_27:
  return v3;
}

- (id)reportingJSON
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1A6267F60](self, a2);
  objc_super v4 = [(SSMetricsEventTableEntity *)self reportingDictionary];
  if (v4)
  {
    id v33 = 0;
    uint64_t v5 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v4 options:1 error:&v33];
    v6 = (SSMetricsEventTableEntity *)v33;
    if (v5) {
      goto LABEL_27;
    }
    v7 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v7)
    {
      v7 = +[SSLogConfig sharedConfig];
    }
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    int v10 = [v7 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      v9 &= 2u;
    }
    if (v9)
    {
      int v11 = objc_opt_class();
      int v34 = 138412802;
      id v35 = v11;
      __int16 v36 = 2112;
      v37 = v6;
      __int16 v38 = 2112;
      v39 = v4;
      id v12 = v11;
      LODWORD(v32) = 32;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_14:

        goto LABEL_27;
      }
      int v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v34, v32);
      free(v13);
      SSFileLog(v7, @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v10);
    }

    goto LABEL_14;
  }
  v6 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v6)
  {
    v6 = +[SSLogConfig sharedConfig];
  }
  int v20 = [(SSMetricsEventTableEntity *)v6 shouldLog];
  if ([(SSMetricsEventTableEntity *)v6 shouldLogToDisk]) {
    int v21 = v20 | 2;
  }
  else {
    int v21 = v20;
  }
  uint64_t v22 = [(SSMetricsEventTableEntity *)v6 OSLogObject];
  if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
    v21 &= 2u;
  }
  if (!v21) {
    goto LABEL_25;
  }
  int v34 = 138412546;
  id v35 = (id)objc_opt_class();
  __int16 v36 = 2112;
  v37 = self;
  id v23 = v35;
  LODWORD(v32) = 22;
  v24 = (void *)_os_log_send_and_compose_impl();

  if (v24)
  {
    uint64_t v22 = objc_msgSend(NSString, "stringWithCString:encoding:", v24, 4, &v34, v32);
    free(v24);
    SSFileLog(v6, @"%@", v25, v26, v27, v28, v29, v30, (uint64_t)v22);
LABEL_25:
  }
  uint64_t v5 = 0;
LABEL_27:

  return v5;
}

- (void).cxx_destruct
{
}

@end