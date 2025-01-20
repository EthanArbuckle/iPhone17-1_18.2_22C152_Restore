@interface AnalyticsRecordingOperation
- (AnalyticsRecordingOperation)initWithMetricsEvents:(id)a3;
- (NSString)appBundleId;
- (NSString)eventTopicOverride;
- (void)run;
- (void)setAppBundleId:(id)a3;
- (void)setEventTopicOverride:(id)a3;
@end

@implementation AnalyticsRecordingOperation

- (AnalyticsRecordingOperation)initWithMetricsEvents:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AnalyticsRecordingOperation;
  v6 = [(AnalyticsRecordingOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_events, a3);
  }

  return v7;
}

- (void)run
{
  if (![(NSArray *)self->_events count])
  {
    v4 = +[SSLogConfig sharedDaemonConfig];
    if (!v4)
    {
      v4 = +[SSLogConfig sharedConfig];
    }
    unsigned int v5 = [v4 shouldLog];
    if ([v4 shouldLogToDisk]) {
      int v6 = v5 | 2;
    }
    else {
      int v6 = v5;
    }
    v7 = [v4 OSLogObject];
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      v6 &= 2u;
    }
    if (v6)
    {
      int v111 = 138412290;
      id v112 = (id)objc_opt_class();
      id v8 = v112;
      LODWORD(v80) = 12;
      objc_super v9 = (void *)_os_log_send_and_compose_impl();

      if (!v9)
      {
LABEL_15:

        [(AnalyticsRecordingOperation *)self setSuccess:1];
        return;
      }
      v7 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v9, 4, &v111, v80);
      free(v9);
      SSFileLog();
    }

    goto LABEL_15;
  }
  if ([(NSString *)self->_eventTopicOverride length]) {
    eventTopicOverride = (__CFString *)self->_eventTopicOverride;
  }
  else {
    eventTopicOverride = @"xp_its_main";
  }
  v87 = eventTopicOverride;
  v10 = +[SSAccountStore defaultStore];
  uint64_t v11 = [v10 activeAccount];

  v12 = +[SSVCookieStorage sharedStorage];
  v13 = [v12 allCookiesForAccount:v11];

  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  id v14 = v13;
  id v15 = [v14 countByEnumeratingWithState:&v103 objects:v110 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v104;
    while (2)
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v104 != v16) {
          objc_enumerationMutation(v14);
        }
        v18 = *(void **)(*((void *)&v103 + 1) + 8 * i);
        v19 = [v18 name];
        unsigned int v20 = [v19 isEqualToString:@"xp_ci"];

        if (v20)
        {
          id v15 = [v18 value];
          goto LABEL_27;
        }
      }
      id v15 = [v14 countByEnumeratingWithState:&v103 objects:v110 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
LABEL_27:

  v81 = (void *)v11;
  if ([v15 length])
  {
    id obj = v14;
  }
  else
  {
    v21 = +[SSVCookieStorage sharedStorage];
    v22 = [v21 allCookiesForUserIdentifier:&off_1003C9498];

    long long v101 = 0u;
    long long v102 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    id v23 = v22;
    id v24 = [v23 countByEnumeratingWithState:&v99 objects:v109 count:16];
    id obj = v23;
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v100;
      while (2)
      {
        for (j = 0; j != v25; j = (char *)j + 1)
        {
          if (*(void *)v100 != v26) {
            objc_enumerationMutation(obj);
          }
          v28 = *(void **)(*((void *)&v99 + 1) + 8 * (void)j);
          v29 = [v28 name];
          unsigned int v30 = [v29 isEqualToString:@"xp_ci"];

          if (v30)
          {
            uint64_t v31 = [v28 value];

            id v15 = (id)v31;
            id v23 = obj;
            goto LABEL_39;
          }
        }
        id v23 = obj;
        id v25 = [obj countByEnumeratingWithState:&v99 objects:v109 count:16];
        if (v25) {
          continue;
        }
        break;
      }
    }
LABEL_39:
  }
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  v32 = self->_events;
  id v33 = [(NSArray *)v32 countByEnumeratingWithState:&v95 objects:v108 count:16];
  if (v33)
  {
    id v34 = v33;
    uint64_t v35 = *(void *)v96;
    do
    {
      for (k = 0; k != v34; k = (char *)k + 1)
      {
        if (*(void *)v96 != v35) {
          objc_enumerationMutation(v32);
        }
        v37 = *(void **)(*((void *)&v95 + 1) + 8 * (void)k);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v37 setTopic:v87];
          if (v15) {
            [v37 setProperty:v15 forBodyKey:@"clientId"];
          }
          if (self->_appBundleId) {
            objc_msgSend(v37, "setApplicationIdentifier:");
          }
        }
      }
      id v34 = [(NSArray *)v32 countByEnumeratingWithState:&v95 objects:v108 count:16];
    }
    while (v34);
  }

  v38 = +[AMSMetrics bagSubProfile];
  v39 = +[AMSMetrics bagSubProfileVersion];
  v40 = +[AMSBag bagForProfile:v38 profileVersion:v39];

  if (_os_feature_enabled_impl() && objc_msgSend(v40, "asd_iTunesStoreMetricsIsEnabled"))
  {
    id v41 = [objc_alloc((Class)AMSMetrics) initWithContainerID:@"com.apple.AppleMediaServices" bag:v40];
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    v42 = self->_events;
    id v43 = [(NSArray *)v42 countByEnumeratingWithState:&v91 objects:v107 count:16];
    v82 = v41;
    if (v43)
    {
      id v44 = v43;
      v83 = v40;
      uint64_t v45 = *(void *)v92;
      do
      {
        for (m = 0; m != v44; m = (char *)m + 1)
        {
          if (*(void *)v92 != v45) {
            objc_enumerationMutation(v42);
          }
          v47 = *(void **)(*((void *)&v91 + 1) + 8 * (void)m);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v48 = objc_alloc((Class)AMSMetricsEvent);
            v49 = [v47 bodyDictionary];
            id v50 = [v48 initWithUnderlyingDictionary:v49];

            [v41 enqueueEvent:v50];
          }
        }
        id v44 = [(NSArray *)v42 countByEnumeratingWithState:&v91 objects:v107 count:16];
      }
      while (v44);
      v51 = (void *)v11;
      v40 = v83;
      v52 = obj;
    }
    else
    {
      v51 = (void *)v11;
      v52 = obj;
    }
    goto LABEL_96;
  }
  id v53 = objc_alloc_init((Class)ISLoadURLBagOperation);
  id v90 = 0;
  [(AnalyticsRecordingOperation *)self runSubOperation:v53 returningError:&v90];
  v42 = (NSArray *)v90;
  v54 = [v53 URLBag];
  v55 = v54;
  v82 = v53;
  if (!v42 && v54)
  {
    v56 = [v54 valueForKey:SSMetricsURLBagKey];
    if ([v56 count])
    {
      id v57 = [objc_alloc((Class)SSMetricsConfiguration) initWithGlobalConfiguration:v56];
      v58 = (SSMetricsController *)objc_alloc_init((Class)SSMetricsController);
      metricsController = self->_metricsController;
      self->_metricsController = v58;
      v60 = v58;

      [(SSMetricsController *)v60 setGlobalConfiguration:v57];
      events = self->_events;
      v89[0] = _NSConcreteStackBlock;
      v89[1] = 3221225472;
      v89[2] = sub_1001876AC;
      v89[3] = &unk_1003A3700;
      v89[4] = self;
      [(SSMetricsController *)v60 insertEvents:events withCompletionHandler:v89];
      v88[0] = _NSConcreteStackBlock;
      v88[1] = 3221225472;
      v88[2] = sub_100187848;
      v88[3] = &unk_1003A3700;
      v88[4] = self;
      [(SSMetricsController *)v60 flushUnreportedEventsWithCompletionHandler:v88];
      [(AnalyticsRecordingOperation *)self setSuccess:1];

      v51 = v81;
      v52 = obj;
LABEL_94:

      goto LABEL_95;
    }
    v85 = v55;
    v71 = +[SSLogConfig sharedDaemonConfig];
    v52 = obj;
    if (!v71)
    {
      v71 = +[SSLogConfig sharedConfig];
    }
    unsigned int v72 = [v71 shouldLog];
    if ([v71 shouldLogToDisk]) {
      int v73 = v72 | 2;
    }
    else {
      int v73 = v72;
    }
    v74 = [v71 OSLogObject];
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT)) {
      int v75 = v73;
    }
    else {
      int v75 = v73 & 2;
    }
    if (v75)
    {
      v76 = objc_opt_class();
      int v111 = 138412290;
      id v112 = v76;
      v77 = v40;
      id v78 = v76;
      LODWORD(v80) = 12;
      v79 = (void *)_os_log_send_and_compose_impl();

      v40 = v77;
      if (!v79)
      {
LABEL_93:

        [(AnalyticsRecordingOperation *)self setSuccess:0];
        v51 = v81;
        v55 = v85;
        goto LABEL_94;
      }
      v74 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v79, 4, &v111, v80);
      free(v79);
      SSFileLog();
    }

    goto LABEL_93;
  }
  v84 = v54;
  v62 = +[SSLogConfig sharedDaemonConfig];
  if (!v62)
  {
    v62 = +[SSLogConfig sharedConfig];
  }
  unsigned int v63 = [v62 shouldLog];
  if ([v62 shouldLogToDisk]) {
    int v64 = v63 | 2;
  }
  else {
    int v64 = v63;
  }
  v65 = [v62 OSLogObject];
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT)) {
    int v66 = v64;
  }
  else {
    int v66 = v64 & 2;
  }
  v52 = obj;
  if (!v66) {
    goto LABEL_79;
  }
  v67 = objc_opt_class();
  int v111 = 138412290;
  id v112 = v67;
  v68 = v40;
  id v69 = v67;
  LODWORD(v80) = 12;
  v70 = (void *)_os_log_send_and_compose_impl();

  v40 = v68;
  if (v70)
  {
    v65 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v70, 4, &v111, v80);
    free(v70);
    SSFileLog();
LABEL_79:
  }
  [(AnalyticsRecordingOperation *)self setSuccess:0];
  v51 = v81;
  v55 = v84;
LABEL_95:

LABEL_96:
}

- (NSString)eventTopicOverride
{
  return self->_eventTopicOverride;
}

- (void)setEventTopicOverride:(id)a3
{
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appBundleId, 0);
  objc_storeStrong((id *)&self->_eventTopicOverride, 0);
  objc_storeStrong((id *)&self->_metricsController, 0);

  objc_storeStrong((id *)&self->_events, 0);
}

@end