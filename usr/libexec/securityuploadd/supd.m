@interface supd
+ (id)serializeLoggingEvent:(id)a3 error:(id *)a4;
- (BOOL)checkSupdEntitlement;
- (BOOL)uploadAnalyticsWithError:(id *)a3 force:(BOOL)a4;
- (NSArray)analyticsTopics;
- (NSDictionary)topicsSamplingRates;
- (NSXPCConnection)connection;
- (SFAnalyticsReporter)reporter;
- (id)getSysdiagnoseDump;
- (id)stringForEventClass:(int64_t)a3;
- (id)sysdiagnoseStringForEventRecord:(id)a3;
- (supd)initWithConnection:(id)a3;
- (supd)initWithConnection:(id)a3 reporter:(id)a4;
- (void)clientStatus:(id)a3;
- (void)createChunkedLoggingJSON:(BOOL)a3 topic:(id)a4 reply:(id)a5;
- (void)createLoggingJSON:(BOOL)a3 topic:(id)a4 reply:(id)a5;
- (void)fixFiles:(id)a3;
- (void)forceUploadWithReply:(id)a3;
- (void)getSysdiagnoseDumpWithReply:(id)a3;
- (void)performRegularlyScheduledUpload;
- (void)sendNotificationForOncePerReportSamplers;
- (void)setConnection:(id)a3;
- (void)setTopicsSamplingRates:(id)a3;
- (void)setUploadDateWith:(id)a3 reply:(id)a4;
- (void)setupSamplingRates;
- (void)setupTopics;
@end

@implementation supd

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_topicsSamplingRates, 0);
  objc_storeStrong((id *)&self->_reporter, 0);

  objc_storeStrong((id *)&self->_analyticsTopics, 0);
}

- (void)setConnection:(id)a3
{
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTopicsSamplingRates:(id)a3
{
}

- (NSDictionary)topicsSamplingRates
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (SFAnalyticsReporter)reporter
{
  return (SFAnalyticsReporter *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)analyticsTopics
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)fixFiles:(id)a3
{
  v4 = (void (**)(id, void))a3;
  v5 = [(supd *)self connection];
  v6 = [v5 valueForEntitlement:@"com.apple.private.trustd.FileHelp"];
  unsigned __int8 v7 = [v6 BOOLValue];

  if (v7)
  {
    v8 = objc_alloc_init(TrustdFileHelper);
    [(TrustdFileHelper *)v8 fixFiles:v4];
  }
  else
  {
    v8 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-34018 userInfo:0];
    v4[2](v4, 0);
  }
}

- (void)clientStatus:(id)a3
{
  v4 = (void (**)(id, void *, void))a3;
  if ([(supd *)self checkSupdEntitlement])
  {
    v5 = +[NSMutableDictionary dictionary];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    obj = self->_analyticsTopics;
    id v16 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v16)
    {
      uint64_t v15 = *(void *)v25;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(obj);
          }
          unsigned __int8 v7 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          v8 = [v7 topicClients];
          id v9 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
          if (v9)
          {
            id v10 = v9;
            uint64_t v11 = *(void *)v21;
            do
            {
              for (j = 0; j != v10; j = (char *)j + 1)
              {
                if (*(void *)v21 != v11) {
                  objc_enumerationMutation(v8);
                }
                v13 = *(void **)(*((void *)&v20 + 1) + 8 * (void)j);
                v17[0] = _NSConcreteStackBlock;
                v17[1] = 3221225472;
                v17[2] = sub_10000C3D0;
                v17[3] = &unk_1000188E8;
                id v18 = v5;
                v19 = v13;
                [v13 withStore:v17];
              }
              id v10 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
            }
            while (v10);
          }
        }
        id v16 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v16);
    }

    v4[2](v4, v5, 0);
  }
  else
  {
    v5 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-34018 userInfo:0];
    ((void (**)(id, void *, void *))v4)[2](v4, 0, v5);
  }
}

- (void)setUploadDateWith:(id)a3 reply:(id)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void (**)(id, uint64_t, void))a4;
  if ([(supd *)self checkSupdEntitlement])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v8 = self->_analyticsTopics;
    id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          v14 = [v13 topicClients:v16];
          [v13 updateUploadDateForClients:v14 date:v6 clearData:0];
        }
        id v10 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    v7[2](v7, 1, 0);
  }
  else
  {
    uint64_t v15 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-34018 userInfo:0];
    ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v15);
  }
}

- (void)forceUploadWithReply:(id)a3
{
  v4 = (void (**)(id, BOOL, id))a3;
  if ([(supd *)self checkSupdEntitlement])
  {
    v5 = sub_1000106A0("upload");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Performing upload in response to rpc message", buf, 2u);
    }

    id v11 = 0;
    BOOL v6 = [(supd *)self uploadAnalyticsWithError:&v11 force:1];
    id v7 = v11;
    v8 = sub_1000106A0("upload");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v9 = @"failure";
      if (v6) {
        CFStringRef v9 = @"success";
      }
      *(_DWORD *)buf = 138412546;
      CFStringRef v13 = v9;
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Result of manually triggered upload: %@, error: %@", buf, 0x16u);
    }

    v4[2](v4, v6, v7);
  }
  else
  {
    id v10 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-34018 userInfo:0];
    ((void (*)(void (**)(id, BOOL, id), void))v4[2])(v4, 0);
  }
}

- (void)createChunkedLoggingJSON:(BOOL)a3 topic:(id)a4 reply:(id)a5
{
  BOOL v26 = a3;
  id v7 = a4;
  v8 = (void (**)(id, void *, id))a5;
  if ([(supd *)self checkSupdEntitlement])
  {
    CFStringRef v9 = sub_1000106A0("rpcCreateChunkedLoggingJSON");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Building an array of JSON blobs resembling the one we would have uploaded", buf, 2u);
    }

    [(supd *)self sendNotificationForOncePerReportSamplers];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v10 = self->_analyticsTopics;
    id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v11)
    {
      id v12 = v11;
      long long v25 = v8;
      CFStringRef v13 = 0;
      __int16 v14 = 0;
      uint64_t v15 = *(void *)v30;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(v10);
          }
          long long v17 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          long long v18 = [v17 internalTopicName:v25];
          unsigned int v19 = [v18 isEqualToString:v7];

          if (v19)
          {
            v28 = v13;
            uint64_t v20 = [v17 createChunkedLoggingJSON:v26 forUpload:0 participatingClients:0 force:1 error:&v28];
            long long v21 = v28;

            CFStringRef v13 = v21;
            __int16 v14 = (void *)v20;
          }
        }
        id v12 = [(NSArray *)v10 countByEnumeratingWithState:&v29 objects:v35 count:16];
      }
      while (v12);

      if (v14)
      {
        long long v27 = v13;
        long long v23 = +[NSJSONSerialization dataWithJSONObject:v14 options:v26 error:&v27];
        long long v24 = v27;
        v8 = v25;
LABEL_21:

        v8[2](v8, v23, v24);

        goto LABEL_22;
      }
      long long v24 = v13;
      v8 = v25;
    }
    else
    {

      long long v24 = 0;
    }
    CFStringRef v13 = sub_1000106A0("SecError");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v24;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Unable to obtain JSON: %@", buf, 0xCu);
    }
    __int16 v14 = 0;
    long long v23 = 0;
    goto LABEL_21;
  }
  long long v24 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-34018 userInfo:0];
  v8[2](v8, 0, v24);
LABEL_22:
}

- (void)createLoggingJSON:(BOOL)a3 topic:(id)a4 reply:(id)a5
{
  BOOL v27 = a3;
  id v7 = a4;
  v8 = (void (**)(id, void *, void *))a5;
  if ([(supd *)self checkSupdEntitlement])
  {
    CFStringRef v9 = sub_1000106A0("rpcCreateLoggingJSON");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Building a JSON blob resembling the one we would have uploaded", buf, 2u);
    }

    [(supd *)self sendNotificationForOncePerReportSamplers];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v10 = self->_analyticsTopics;
    id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v11)
    {
      id v12 = v11;
      BOOL v26 = v8;
      CFStringRef v13 = 0;
      __int16 v14 = 0;
      uint64_t v15 = *(void *)v31;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v31 != v15) {
            objc_enumerationMutation(v10);
          }
          long long v17 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          long long v18 = [v17 internalTopicName:v26];
          unsigned int v19 = [v18 isEqualToString:v7];

          if (v19)
          {
            id v29 = v13;
            uint64_t v20 = [v17 createLoggingJSON:v27 forUpload:0 participatingClients:0 force:1 error:&v29];
            id v21 = v29;

            CFStringRef v13 = v21;
            __int16 v14 = (void *)v20;
          }
        }
        id v12 = [(NSArray *)v10 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v12);

      if (v14)
      {
        id v28 = v13;
        long long v23 = +[NSJSONSerialization dataWithJSONObject:v14 options:v27 error:&v28];
        id v24 = v28;

        CFStringRef v13 = v24;
        v8 = v26;
LABEL_21:
        v8[2](v8, v23, v13);

        goto LABEL_22;
      }
      v8 = v26;
    }
    else
    {

      CFStringRef v13 = 0;
    }
    long long v25 = sub_1000106A0("SecError");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v13;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Unable to obtain JSON: %@", buf, 0xCu);
    }

    __int16 v14 = 0;
    long long v23 = 0;
    goto LABEL_21;
  }
  CFStringRef v13 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-34018 userInfo:0];
  v8[2](v8, 0, v13);
LABEL_22:
}

- (void)getSysdiagnoseDumpWithReply:(id)a3
{
  v5 = (void (**)(id, void *))a3;
  if ([(supd *)self checkSupdEntitlement])
  {
    v4 = [(supd *)self getSysdiagnoseDump];
    v5[2](v5, v4);
  }
  else
  {
    v5[2](v5, @"client not entitled");
  }
}

- (BOOL)checkSupdEntitlement
{
  v2 = [(supd *)self connection];
  v3 = [v2 valueForEntitlement:@"com.apple.private.securityuploadd"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (id)stringForEventClass:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return @"EventUnknown";
  }
  else {
    return off_100018998[a3];
  }
}

- (id)getSysdiagnoseDump
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obj = self->_analyticsTopics;
  id v15 = [(NSArray *)obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v15)
  {
    uint64_t v14 = *(void *)v26;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = v4;
        v5 = *(void **)(*((void *)&v25 + 1) + 8 * v4);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        BOOL v6 = [v5 topicClients];
        id v7 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v22;
          do
          {
            for (i = 0; i != v8; i = (char *)i + 1)
            {
              if (*(void *)v22 != v9) {
                objc_enumerationMutation(v6);
              }
              id v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
              v17[0] = _NSConcreteStackBlock;
              v17[1] = 3221225472;
              v17[2] = sub_10000D1D4;
              v17[3] = &unk_1000188C0;
              id v18 = v3;
              unsigned int v19 = v11;
              uint64_t v20 = self;
              [v11 withStore:v17];
            }
            id v8 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v8);
        }

        uint64_t v4 = v16 + 1;
      }
      while ((id)(v16 + 1) != v15);
      id v15 = [(NSArray *)obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v15);
  }

  return v3;
}

- (id)sysdiagnoseStringForEventRecord:(id)a3
{
  id v4 = a3;
  id v5 = [v4 mutableCopy];
  [v5 removeObjectForKey:@"topic"];
  uint64_t v6 = SFAnalyticsEventTime;
  id v7 = [v4 valueForKey:SFAnalyticsEventTime];
  [v7 doubleValue];
  uint64_t v9 = +[NSDate dateWithTimeIntervalSince1970:v8 / 1000.0];

  [v5 removeObjectForKey:v6];
  uint64_t v10 = SFAnalyticsEventType;
  id v11 = [v4 objectForKeyedSubscript:SFAnalyticsEventType];
  [v5 removeObjectForKey:v10];
  uint64_t v12 = SFAnalyticsEventClassKey;
  CFStringRef v13 = [v4 valueForKey:SFAnalyticsEventClassKey];
  id v14 = [v13 integerValue];

  id v15 = [(supd *)self stringForEventClass:v14];
  [v5 removeObjectForKey:v12];
  uint64_t v16 = +[NSMutableString string];
  if ([v5 count])
  {
    [v16 appendString:@" - Attributes: {"];
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x2020000000;
    char v27 = 1;
    uint64_t v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    long long v22 = sub_10000D5D8;
    long long v23 = &unk_100018898;
    long long v25 = v26;
    id v17 = v16;
    id v24 = v17;
    [v5 enumerateKeysAndObjectsUsingBlock:&v20];
    [v17 appendString:@" }"];

    _Block_object_dispose(v26, 8);
  }
  id v18 = +[NSString stringWithFormat:@"%@ %@: %@%@", v9, v15, v11, v16, v20, v21, v22, v23];

  return v18;
}

- (BOOL)uploadAnalyticsWithError:(id *)a3 force:(BOOL)a4
{
  uint64_t v4 = a4;
  [(supd *)self sendNotificationForOncePerReportSamplers];
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  v69 = self;
  id v7 = self->_analyticsTopics;
  id v68 = [(NSArray *)v7 countByEnumeratingWithState:&v79 objects:v88 count:16];
  double v8 = 0;
  id v9 = 0;
  if (!v68)
  {
    char v63 = 0;
    goto LABEL_83;
  }
  char v63 = 0;
  uint64_t v67 = *(void *)v80;
  v60 = v7;
  unsigned int v59 = v4;
  v58 = a3;
  do
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v80 != v67) {
        objc_enumerationMutation(v7);
      }
      id v11 = *(void **)(*((void *)&v79 + 1) + 8 * (void)v10);
      if (!v8)
      {
        double v8 = [v11 getSession];
      }
      CFStringRef v13 = [v11 splunkUploadURL:v4 urlSession:v8];
      context = v12;
      if (!v13)
      {
        id v14 = sub_1000106A0("upload");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          [v11 internalTopicName];
          v16 = id v15 = v8;
          *(_DWORD *)buf = 138412290;
          v85 = v16;
          id v17 = v14;
          id v18 = "Skipping upload for %@ because no endpoint";
LABEL_14:
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);

          double v8 = v15;
        }
LABEL_15:

        goto LABEL_16;
      }
      if ([v11 disableUploads])
      {
        id v14 = sub_1000106A0("upload");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          [v11 internalTopicName];
          v16 = id v15 = v8;
          *(_DWORD *)buf = 138412290;
          v85 = v16;
          id v17 = v14;
          id v18 = "Aborting upload task for %@ because uploads are disabled";
          goto LABEL_14;
        }
        goto LABEL_15;
      }
      unsigned int v19 = a3;
      uint64_t v20 = v7;
      uint64_t v21 = +[NSMutableArray array];
      id v78 = v9;
      v65 = (void *)v21;
      long long v22 = [v11 createChunkedLoggingJSON:0 forUpload:1 participatingClients:nil force:nil error:nil];
      id v23 = v78;

      v62 = v22;
      if (v22) {
        BOOL v24 = v23 == 0;
      }
      else {
        BOOL v24 = 0;
      }
      char v25 = v24;
      v71 = v8;
      char v61 = v25;
      if (!v24)
      {
        v42 = [v23 domain];
        if ([v42 isEqualToString:@"com.apple.security.supd"])
        {
          id v44 = [v23 code];

          BOOL v24 = v44 == (id)2;
          id v7 = v60;
          a3 = v19;
          if (!v24)
          {
LABEL_59:
            v47 = sub_1000106A0("SecError");
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              v48 = [v11 internalTopicName];
              *(_DWORD *)buf = 138412546;
              v85 = v48;
              __int16 v86 = 2112;
              id v87 = v23;
              _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "upload: failed to create chunked log events for logging topic %@: %@", buf, 0x16u);
            }
            goto LABEL_73;
          }
          v42 = +[NSDate date];
          [v11 updateUploadDateForClients:v65 date:v42 clearData:1];
        }
        else
        {
          id v7 = v20;
          a3 = v19;
        }

        goto LABEL_59;
      }
      if ([v11 isSampledUpload])
      {
        long long v76 = 0u;
        long long v77 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        id obj = v22;
        id v26 = [obj countByEnumeratingWithState:&v74 objects:v83 count:16];
        if (v26)
        {
          id v27 = v26;
          id v28 = 0;
          uint64_t v29 = *(void *)v75;
          uint64_t v64 = *(void *)v75;
LABEL_29:
          uint64_t v30 = 0;
          while (1)
          {
            if (*(void *)v75 != v29) {
              objc_enumerationMutation(obj);
            }
            uint64_t v31 = *(void *)(*((void *)&v74 + 1) + 8 * v30);
            id v73 = v28;
            long long v33 = +[supd serializeLoggingEvent:v31 error:&v73];
            id v9 = v73;

            if (!v33 || v9 != 0) {
              break;
            }
            reporter = v69->_reporter;
            v36 = [v11 internalTopicName];
            LOBYTE(reporter) = [(SFAnalyticsReporter *)reporter saveReport:v33 fileName:v36];

            if ((reporter & 1) == 0)
            {
              v37 = sub_1000106A0("SecError");
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "upload: failed to write analytics data to log", buf, 2u);
              }
            }
            id v72 = 0;
            unsigned int v38 = [v11 postJSON:v33 toEndpoint:v13 postSession:v71 error:&v72];
            id v28 = v72;
            if (v38)
            {
              v39 = sub_1000106A0("upload");
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
              {
                v40 = [v11 internalTopicName];
                *(_DWORD *)buf = 138412290;
                v85 = v40;
                _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Successfully posted JSON for %@", buf, 0xCu);

                uint64_t v29 = v64;
              }
              char v63 = 1;
            }
            else
            {
              v39 = sub_1000106A0("SecError");
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
              {
                v41 = [v11 internalTopicName];
                *(_DWORD *)buf = 138412546;
                v85 = v41;
                __int16 v86 = 2112;
                id v87 = v28;
                _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "upload: Failed to post JSON for %@: %@", buf, 0x16u);

                uint64_t v29 = v64;
              }
            }

            if (v27 == (id)++v30)
            {
              id v27 = [obj countByEnumeratingWithState:&v74 objects:v83 count:16];
              if (v27) {
                goto LABEL_29;
              }
              goto LABEL_65;
            }
          }
          v49 = [v9 domain];
          unsigned int v50 = [v49 isEqualToString:@"com.apple.security.supd"];
          char v51 = v50;
          if (v50)
          {
            id v52 = [v9 code];

            id v7 = v60;
            if (v52 == (id)2)
            {
              v49 = +[NSDate date];
              [v11 updateUploadDateForClients:v65 date:v49 clearData:1];
              goto LABEL_67;
            }
            char v51 = 0;
          }
          else
          {
            id v7 = v60;
LABEL_67:
          }
          v53 = sub_1000106A0("SecError");
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            v54 = [v11 internalTopicName];
            *(_DWORD *)buf = 138412546;
            v85 = v54;
            __int16 v86 = 2112;
            id v87 = v9;
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "upload: failed to serialized chunked log events for logging topic %@: %@", buf, 0x16u);
          }

          uint64_t v4 = v59;
          a3 = v58;
          if (v51) {
            goto LABEL_74;
          }
        }
        else
        {
          id v28 = 0;
LABEL_65:

          id v9 = v28;
          uint64_t v4 = v59;
          a3 = v58;
          id v7 = v60;
        }
        v47 = +[NSDate date];
        [v11 updateUploadDateForClients:v65 date:v47 clearData:1];
        id v23 = v9;
        goto LABEL_73;
      }
      id v7 = v20;
      v45 = sub_1000106A0("upload");
      a3 = v19;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        v46 = [v11 internalTopicName];
        *(_DWORD *)buf = 138412290;
        v85 = v46;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "skipping unsampled upload for %@ and clearing data", buf, 0xCu);
      }
      v47 = +[NSDate date];
      [v11 updateUploadDateForClients:v65 date:v47 clearData:1];
      id v23 = 0;
LABEL_73:

      id v9 = v23;
LABEL_74:

      char v55 = v61 ^ 1;
      if (!a3) {
        char v55 = 1;
      }
      if (v55)
      {
        double v8 = v71;
      }
      else
      {
        double v8 = v71;
        if (v9)
        {
          id v9 = v9;
          *a3 = v9;
        }
      }
LABEL_16:
      uint64_t v10 = (char *)v10 + 1;
    }
    while (v10 != v68);
    id v56 = [(NSArray *)v7 countByEnumeratingWithState:&v79 objects:v88 count:16];
    id v68 = v56;
  }
  while (v56);
LABEL_83:

  return v63 & 1;
}

- (void)performRegularlyScheduledUpload
{
  id v3 = sub_1000106A0("upload");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting uploads in response to regular trigger", buf, 2u);
  }

  id v10 = 0;
  unsigned int v4 = [(supd *)self uploadAnalyticsWithError:&v10 force:0];
  id v5 = v10;
  if (v4)
  {
    uint64_t v6 = sub_1000106A0("upload");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v7 = "Regularly scheduled upload successful";
      double v8 = v6;
      uint32_t v9 = 2;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
    }
  }
  else
  {
    uint64_t v6 = sub_1000106A0("SecError");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v5;
      id v7 = "upload: Failed to complete regularly scheduled upload: %@";
      double v8 = v6;
      uint32_t v9 = 12;
      goto LABEL_8;
    }
  }
}

- (void)sendNotificationForOncePerReportSamplers
{
  notify_post(SFAnalyticsFireSamplersNotification);

  +[NSThread sleepForTimeInterval:3.0];
}

- (supd)initWithConnection:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(SFAnalyticsReporter);
  uint64_t v6 = [(supd *)self initWithConnection:v4 reporter:v5];

  return v6;
}

- (supd)initWithConnection:(id)a3 reporter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)supd;
  uint32_t v9 = [(supd *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    objc_storeStrong((id *)&v10->_reporter, a4);
    [(supd *)v10 setupSamplingRates];
    [(supd *)v10 setupTopics];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000E27C;
    block[3] = &unk_100018870;
    CFStringRef v13 = v10;
    if (qword_10001DB88 != -1) {
      dispatch_once(&qword_10001DB88, block);
    }
  }
  return v10;
}

- (void)setupSamplingRates
{
  id v3 = +[NSBundle bundleWithPath:@"/System/Library/Security/Certificates.bundle"];
  CFURLRef v4 = sub_1000107C0(@"private/var/protected/", @"trustd/");
  id v5 = [(__CFURL *)v4 URLByAppendingPathComponent:@"SupplementalsAssets/" isDirectory:1];
  uint64_t v6 = [v3 URLForResource:@"AssetVersion" withExtension:@"plist"];
  id v7 = +[NSDictionary dictionaryWithContentsOfURL:v6];

  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = [v7 objectForKeyedSubscript:@"MobileAssetContentVersion"];
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  id v10 = [v5 URLByAppendingPathComponent:@"OTAPKIContext.plist"];
  id v11 = +[NSDictionary dictionaryWithContentsOfURL:v10];

  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v12 = [v11 objectForKeyedSubscript:@"MobileAssetContentVersion"];
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }

  if (!v9 || !v13)
  {

    goto LABEL_27;
  }
  id v14 = [v13 compare:v9];

  if (v14 != (id)1) {
    goto LABEL_27;
  }
  id v15 = +[NSString stringWithFormat:@"%@.plist", @"AnalyticsSamplingRates"];
  uint64_t v16 = [v5 URLByAppendingPathComponent:v15];

  id v17 = +[NSDictionary dictionaryWithContentsOfURL:v16];
  id v18 = sub_1000106A0("supd");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "read sampling rates from SupplementalsAssets dir", buf, 2u);
  }

  if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

LABEL_27:
    unsigned int v19 = [v3 URLForResource:@"AnalyticsSamplingRates" withExtension:@"plist"];
    id v17 = +[NSDictionary dictionaryWithContentsOfURL:v19];

    if (!v17) {
      goto LABEL_33;
    }
    goto LABEL_28;
  }

LABEL_28:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v20 = [v17 objectForKeyedSubscript:@"Topics"];
    topicsSamplingRates = self->_topicsSamplingRates;
    self->_topicsSamplingRates = v20;

    long long v22 = self->_topicsSamplingRates;
    if (!v22)
    {
LABEL_32:
      self->_topicsSamplingRates = 0;

      goto LABEL_33;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      long long v22 = self->_topicsSamplingRates;
      goto LABEL_32;
    }
  }
LABEL_33:
}

- (void)setupTopics
{
  id v3 = +[NSBundle bundleWithPath:@"/System/Library/Frameworks/Security.framework"];
  CFURLRef v4 = [v3 pathForResource:@"SFAnalytics" ofType:@"plist"];
  id v5 = +[NSDictionary dictionaryWithContentsOfFile:v4];

  uint64_t v6 = +[NSMutableArray array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v13 = -[NSDictionary objectForKeyedSubscript:](self->_topicsSamplingRates, "objectForKeyedSubscript:", v12, (void)v19);
        id v14 = [SFAnalyticsTopic alloc];
        id v15 = [v7 objectForKeyedSubscript:v12];
        uint64_t v16 = [(SFAnalyticsTopic *)v14 initWithDictionary:v15 name:v12 samplingRates:v13];

        [v6 addObject:v16];
      }
      id v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  id v17 = +[NSArray arrayWithArray:v6];
  analyticsTopics = self->_analyticsTopics;
  self->_analyticsTopics = v17;
}

+ (id)serializeLoggingEvent:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (v5)
  {
    id v12 = 0;
    id v7 = +[NSJSONSerialization dataWithJSONObject:v5 options:0 error:&v12];
    id v8 = v12;
    if (v7) {
      BOOL v9 = v8 == 0;
    }
    else {
      BOOL v9 = 0;
    }
    if (v9)
    {
      id v10 = v7;
    }
    else
    {
      id v10 = 0;
      if (a4) {
        *a4 = v8;
      }
    }
  }
  else if (a4)
  {
    +[NSError errorWithDomain:@"com.apple.security.supd" code:3 userInfo:0];
    id v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

@end