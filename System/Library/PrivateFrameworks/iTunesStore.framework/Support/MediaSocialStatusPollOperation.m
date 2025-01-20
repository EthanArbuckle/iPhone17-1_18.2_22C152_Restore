@interface MediaSocialStatusPollOperation
- (MediaSocialStatusPollOperation)initWithStatusPollRequests:(id)a3;
- (NSArray)statusPollRequests;
- (id)_requestURL;
- (id)responseBlock;
- (void)main;
- (void)setResponseBlock:(id)a3;
@end

@implementation MediaSocialStatusPollOperation

- (MediaSocialStatusPollOperation)initWithStatusPollRequests:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MediaSocialStatusPollOperation;
  v5 = [(MediaSocialStatusPollOperation *)&v9 init];
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    statusPollRequests = v5->_statusPollRequests;
    v5->_statusPollRequests = v6;
  }
  return v5;
}

- (id)responseBlock
{
  [(MediaSocialStatusPollOperation *)self lock];
  id v3 = [self->_responseBlock copy];
  [(MediaSocialStatusPollOperation *)self unlock];
  id v4 = objc_retainBlock(v3);

  return v4;
}

- (void)setResponseBlock:(id)a3
{
  id v6 = a3;
  [(MediaSocialStatusPollOperation *)self lock];
  if (self->_responseBlock != v6)
  {
    id v4 = [v6 copy];
    id responseBlock = self->_responseBlock;
    self->_id responseBlock = v4;
  }
  [(MediaSocialStatusPollOperation *)self unlock];
}

- (NSArray)statusPollRequests
{
  [(MediaSocialStatusPollOperation *)self lock];
  id v3 = [(NSArray *)self->_statusPollRequests copy];
  [(MediaSocialStatusPollOperation *)self unlock];

  return (NSArray *)v3;
}

- (void)main
{
  v2 = self;
  v65 = [(MediaSocialStatusPollOperation *)self _requestURL];
  id v3 = objc_opt_new();
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v4 = v2->_statusPollRequests;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v74 objects:v83 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v75;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v75 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = [*(id *)(*((void *)&v74 + 1) + 8 * i) activityIdentifier];
        if (v9) {
          [v3 addObject:v9];
        }
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v74 objects:v83 count:16];
    }
    while (v6);
  }

  v10 = [v3 componentsJoinedByString:@","];
  if (!v65)
  {
    v32 = SSError();
    id v33 = 0;
    goto LABEL_41;
  }
  v11 = v2;
  v12 = [(NSArray *)v2->_statusPollRequests firstObject];
  id v13 = objc_alloc_init((Class)ISStoreURLOperation);
  v14 = +[DaemonProtocolDataProvider provider];
  [v13 setDataProvider:v14];

  id v15 = objc_alloc((Class)SSAuthenticationContext);
  v16 = [v12 accountIdentifier];
  id v17 = [v15 initWithAccountIdentifier:v16];

  [v13 setAuthenticationContext:v17];
  id v18 = [objc_alloc((Class)SSMutableURLRequestProperties) initWithURL:v65];
  [v18 setAllowedRetryCount:0];
  [v18 setITunesStoreRequest:1];
  [v18 setTimeoutInterval:30.0];
  [v18 setValue:v10 forRequestParameter:@"activities"];
  SSVAddMediaSocialHeadersToURLRequestProperties();
  v19 = [v12 sourceApplicationIdentifier];
  v20 = v19;
  if (v19)
  {
    v21 = sub_1001765D8(v19);
    [v18 setValue:v21 forHTTPHeaderField:SSHTTPHeaderUserAgent];
  }
  v64 = v13;
  [v13 setRequestProperties:v18];
  v22 = +[SSLogConfig sharedDaemonConfig];
  if (!v22)
  {
    v22 = +[SSLogConfig sharedConfig];
  }
  unsigned int v23 = [v22 shouldLog];
  if ([v22 shouldLogToDisk]) {
    v23 |= 2u;
  }
  v24 = [v22 OSLogObject];
  if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO)) {
    v23 &= 2u;
  }
  if (!v23)
  {
    v31 = v12;
    v2 = v11;
    goto LABEL_24;
  }
  id v25 = v18;
  id v26 = v17;
  v27 = v10;
  v28 = objc_opt_class();
  id obja = v28;
  [v12 activityIdentifier];
  v29 = v62 = v12;
  int v79 = 138412546;
  v80 = v28;
  v10 = v27;
  id v17 = v26;
  id v18 = v25;
  __int16 v81 = 2112;
  v82 = v29;
  LODWORD(v55) = 22;
  v54 = &v79;
  v30 = (void *)_os_log_send_and_compose_impl();

  v2 = v11;
  v31 = v62;

  if (v30)
  {
    v24 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v30, 4, &v79, v55);
    free(v30);
    v54 = (int *)v24;
    SSFileLog();
LABEL_24:
  }
  id v73 = 0;
  v34 = v64;
  unsigned int v35 = [(MediaSocialStatusPollOperation *)v2 runSubOperation:v64 returningError:&v73];
  id v36 = v73;
  id v33 = 0;
  if (v35)
  {
    v61 = v10;
    v37 = v31;
    id v33 = objc_alloc_init((Class)NSMutableDictionary);
    v38 = [v64 dataProvider];
    uint64_t v39 = [v38 output];

    v40 = (void *)v39;
    v41 = &syslog_ptr;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v60 = v36;
      v42 = [v40 objectForKey:@"activities"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v56 = v40;
        id v57 = v18;
        v66 = v33;
        id v58 = v17;
        v59 = v2;
        v63 = v37;
        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        obj = v2->_statusPollRequests;
        id v43 = [(NSArray *)obj countByEnumeratingWithState:&v69 objects:v78 count:16];
        if (v43)
        {
          id v44 = v43;
          uint64_t v45 = *(void *)v70;
          do
          {
            for (j = 0; j != v44; j = (char *)j + 1)
            {
              if (*(void *)v70 != v45) {
                objc_enumerationMutation(obj);
              }
              v47 = *(void **)(*((void *)&v69 + 1) + 8 * (void)j);
              v48 = objc_msgSend(v47, "activityIdentifier", v54);
              v49 = [v42 objectForKey:v48];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v50 = v41;
                v51 = objc_alloc_init(MediaSocialPostResponse);
                [(MediaSocialPostResponse *)v51 setActivityIdentifier:v48];
                [v47 pollingInterval];
                -[MediaSocialPostResponse setPollingInterval:](v51, "setPollingInterval:");
                [v47 pollingDuration];
                -[MediaSocialPostResponse setPollDuration:](v51, "setPollDuration:");
                -[MediaSocialPostResponse setPostIdentifier:](v51, "setPostIdentifier:", [v47 postIdentifier]);
                [(MediaSocialPostResponse *)v51 setValuesWithResponseDictionary:v49];
                [v66 setObject:v51 forKey:v48];

                v41 = v50;
              }
            }
            id v44 = [(NSArray *)obj countByEnumeratingWithState:&v69 objects:v78 count:16];
          }
          while (v44);
        }

        id v17 = v58;
        v2 = v59;
        v37 = v63;
        v34 = v64;
        v40 = v56;
        id v18 = v57;
        id v33 = v66;
      }

      id v36 = v60;
    }

    v31 = v37;
    v10 = v61;
  }

  v32 = 0;
LABEL_41:
  uint64_t v52 = [(MediaSocialStatusPollOperation *)v2 responseBlock];
  v53 = (void *)v52;
  if (v52)
  {
    (*(void (**)(uint64_t, id, void *))(v52 + 16))(v52, v33, v32);
    [(MediaSocialStatusPollOperation *)v2 setResponseBlock:0];
  }
}

- (id)_requestURL
{
  id v3 = +[SSURLBagContext contextWithBagType:0];
  id v4 = [(MediaSocialStatusPollOperation *)self loadedURLBagWithContext:v3 returningError:0];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 valueForKey:SSVURLBagKeyMusicConnect];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [v6 objectForKey:@"activityStatus"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v8 = [objc_alloc((Class)NSURL) initWithString:v7];
      }
      else {
        id v8 = 0;
      }
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusPollRequests, 0);

  objc_storeStrong(&self->_responseBlock, 0);
}

@end