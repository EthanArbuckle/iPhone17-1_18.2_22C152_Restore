@interface SaveInstallAttributionParamsOperation
- (SaveInstallAttributionParamsOperation)initWithRequest:(id)a3;
- (void)run;
@end

@implementation SaveInstallAttributionParamsOperation

- (SaveInstallAttributionParamsOperation)initWithRequest:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SaveInstallAttributionParamsOperation;
  v5 = [(SaveInstallAttributionParamsOperation *)&v27 init];
  if (v5)
  {
    v6 = objc_alloc_init(InstallAttributionParams);
    params = v5->_params;
    v5->_params = v6;

    v8 = v5->_params;
    v9 = [v4 appAdamId];
    [(InstallAttributionParams *)v8 setAppAdamId:v9];

    v10 = v5->_params;
    v11 = [v4 adNetworkId];
    [(InstallAttributionParams *)v10 setAdNetworkId:v11];

    v12 = v5->_params;
    v13 = [v4 campaignId];
    [(InstallAttributionParams *)v12 setCampaignId:v13];

    v14 = v5->_params;
    v15 = [v4 impressionId];
    [(InstallAttributionParams *)v14 setImpressionId:v15];

    v16 = v5->_params;
    v17 = [v4 timestamp];
    [(InstallAttributionParams *)v16 setTimestamp:v17];

    v18 = v5->_params;
    v19 = [v4 attributionSignature];
    [(InstallAttributionParams *)v18 setAttributionSignature:v19];

    v20 = +[NSDate date];
    [v20 timeIntervalSince1970];
    uint64_t v22 = (uint64_t)(v21 * 1000.0);

    v23 = +[NSNumber numberWithLongLong:v22];
    [(InstallAttributionParams *)v5->_params setLocalTimestamp:v23];
    uint64_t v24 = [v4 originatingBundleId];
    originatingBundleId = v5->_originatingBundleId;
    v5->_originatingBundleId = (NSString *)v24;

    v5->_overrideCampaignLimit = [v4 overrideCampaignLimit];
  }

  return v5;
}

- (void)run
{
  if (!self->_originatingBundleId) {
    goto LABEL_67;
  }
  v3 = +[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:");
  id v4 = [v3 bundleURL];
  v5 = [v4 path];
  v6 = [v5 stringByAppendingPathComponent:@"Info.plist"];

  v7 = &syslog_ptr;
  id v8 = [objc_alloc((Class)NSDictionary) initWithContentsOfFile:v6];
  v9 = v8;
  if (!v8)
  {
    v40 = +[SSLogConfig sharedDaemonConfig];
    if (!v40)
    {
      v40 = +[SSLogConfig sharedConfig];
    }
    unsigned int v41 = [v40 shouldLog];
    if ([v40 shouldLogToDisk]) {
      int v42 = v41 | 2;
    }
    else {
      int v42 = v41;
    }
    v43 = [v40 OSLogObject];
    if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      v42 &= 2u;
    }
    if (v42)
    {
      v44 = objc_opt_class();
      originatingBundleId = self->_originatingBundleId;
      int v76 = 138543618;
      v77 = v44;
      __int16 v78 = 2112;
      v79 = originatingBundleId;
      id v46 = v44;
      LODWORD(v65) = 22;
      v47 = (void *)_os_log_send_and_compose_impl();

      if (!v47)
      {
LABEL_48:

        [(SaveInstallAttributionParamsOperation *)self setSuccess:0];
        v10 = SSError();
        [(SaveInstallAttributionParamsOperation *)self setError:v10];
        int v56 = 1;
        goto LABEL_66;
      }
      v43 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v47, 4, &v76, v65);
      free(v47);
      SSFileLog();
    }

    goto LABEL_48;
  }
  v10 = [v8 objectForKeyedSubscript:@"SKAdNetworkItems"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v48 = +[SSLogConfig sharedDaemonConfig];
    if (!v48)
    {
      v48 = +[SSLogConfig sharedConfig];
    }
    unsigned int v49 = [v48 shouldLog];
    if ([v48 shouldLogToDisk]) {
      int v50 = v49 | 2;
    }
    else {
      int v50 = v49;
    }
    v51 = [v48 OSLogObject];
    if (!os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
      v50 &= 2u;
    }
    if (v50)
    {
      v52 = objc_opt_class();
      v53 = self->_originatingBundleId;
      int v76 = 138543618;
      v77 = v52;
      __int16 v78 = 2112;
      v79 = v53;
      id v54 = v52;
      LODWORD(v65) = 22;
      v55 = (void *)_os_log_send_and_compose_impl();

      if (!v55)
      {
LABEL_60:

        [(SaveInstallAttributionParamsOperation *)self setSuccess:0];
        goto LABEL_64;
      }
      v51 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v55, 4, &v76, v65);
      free(v55);
      SSFileLog();
    }

    goto LABEL_60;
  }
  v67 = v9;
  v68 = v6;
  v69 = v3;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  v66 = v10;
  id v11 = v10;
  id v12 = [v11 countByEnumeratingWithState:&v72 objects:v82 count:16];
  if (!v12) {
    goto LABEL_27;
  }
  id v13 = v12;
  uint64_t v14 = *(void *)v73;
  do
  {
    for (i = 0; i != v13; i = (char *)i + 1)
    {
      if (*(void *)v73 != v14) {
        objc_enumerationMutation(v11);
      }
      v16 = *(void **)(*((void *)&v72 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v20 = v7;
        double v21 = +[SSLogConfig sharedDaemonConfig];
        if (!v21)
        {
          double v21 = +[SSLogConfig sharedConfig];
        }
        unsigned int v22 = objc_msgSend(v21, "shouldLog", v64, v65);
        if ([v21 shouldLogToDisk]) {
          int v23 = v22 | 2;
        }
        else {
          int v23 = v22;
        }
        uint64_t v24 = [v21 OSLogObject];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          int v25 = v23;
        }
        else {
          int v25 = v23 & 2;
        }
        if (v25)
        {
          v26 = objc_opt_class();
          objc_super v27 = self->_originatingBundleId;
          int v76 = 138543618;
          v77 = v26;
          __int16 v78 = 2112;
          v79 = v27;
          id v28 = v26;
          LODWORD(v65) = 22;
          v64 = &v76;
          v29 = (void *)_os_log_send_and_compose_impl();

          if (v29)
          {
            uint64_t v24 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v29, 4, &v76, v65);
            free(v29);
            v64 = (int *)v24;
            SSFileLog();
            goto LABEL_23;
          }
        }
        else
        {
LABEL_23:
        }
        v7 = v20;
        continue;
      }
      v17 = [v16 objectForKeyedSubscript:@"SKAdNetworkIdentifier"];
      v18 = [(InstallAttributionParams *)self->_params adNetworkId];
      unsigned __int8 v19 = [v17 isEqualToString:v18];

      if (v19)
      {
        int v56 = 0;
        v6 = v68;
        v3 = v69;
        v10 = v66;
        v9 = v67;
        goto LABEL_65;
      }
    }
    id v13 = [v11 countByEnumeratingWithState:&v72 objects:v82 count:16];
  }
  while (v13);
LABEL_27:

  v30 = +[SSLogConfig sharedDaemonConfig];
  if (!v30)
  {
    v30 = +[SSLogConfig sharedConfig];
  }
  unsigned int v31 = objc_msgSend(v30, "shouldLog", v64);
  if ([v30 shouldLogToDisk]) {
    int v32 = v31 | 2;
  }
  else {
    int v32 = v31;
  }
  v33 = [v30 OSLogObject];
  if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
    v32 &= 2u;
  }
  if (v32)
  {
    v34 = objc_opt_class();
    v35 = self->_originatingBundleId;
    params = self->_params;
    id v37 = v34;
    v38 = [(InstallAttributionParams *)params adNetworkId];
    int v76 = 138543874;
    v77 = v34;
    __int16 v78 = 2112;
    v79 = v35;
    __int16 v80 = 2112;
    v81 = v38;
    LODWORD(v65) = 32;
    v39 = (void *)_os_log_send_and_compose_impl();

    v6 = v68;
    v3 = v69;
    v10 = v66;
    v9 = v67;
    if (v39)
    {
      v33 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v39, 4, &v76, v65);
      free(v39);
      SSFileLog();
      goto LABEL_62;
    }
  }
  else
  {
    v6 = v68;
    v3 = v69;
    v10 = v66;
    v9 = v67;
LABEL_62:
  }
  [(SaveInstallAttributionParamsOperation *)self setSuccess:0];
LABEL_64:
  SSError();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [(SaveInstallAttributionParamsOperation *)self setError:v11];
  int v56 = 1;
LABEL_65:

LABEL_66:
  if (!v56)
  {
LABEL_67:
    dispatch_semaphore_t v57 = dispatch_semaphore_create(0);
    v58 = +[PurchaseActionsManager sharedInstance];
    v59 = self->_params;
    BOOL overrideCampaignLimit = self->_overrideCampaignLimit;
    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472;
    v70[2] = sub_100174CF4;
    v70[3] = &unk_1003A7F18;
    v70[4] = self;
    v61 = v57;
    v71 = v61;
    [v58 insertInstallAttributionParams:v59 overrideCampaignLimit:overrideCampaignLimit completionHandler:v70];

    dispatch_time_t v62 = dispatch_time(0, 30000000000);
    if (dispatch_semaphore_wait(v61, v62))
    {
      [(SaveInstallAttributionParamsOperation *)self setSuccess:0];
      v63 = SSError();
      [(SaveInstallAttributionParamsOperation *)self setError:v63];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingBundleId, 0);

  objc_storeStrong((id *)&self->_params, 0);
}

@end