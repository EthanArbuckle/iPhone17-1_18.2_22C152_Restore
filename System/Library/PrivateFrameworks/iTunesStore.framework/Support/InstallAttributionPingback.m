@interface InstallAttributionPingback
- (BOOL)isEqual:(id)a3;
- (InstallAttributionPingback)initWithAppAdamId:(id)a3 transactionId:(id)a4 campaignId:(id)a5 adNetworkId:(id)a6 attributionSignature:(id)a7 pingbackUrl:(id)a8 retryCount:(int64_t)a9 localTimestamp:(id)a10;
- (NSNumber)appAdamId;
- (NSNumber)campaignId;
- (NSNumber)localTimestamp;
- (NSString)adNetworkId;
- (NSString)attributionSignature;
- (NSString)transactionId;
- (NSURL)pingbackUrl;
- (id)description;
- (int64_t)retryCount;
@end

@implementation InstallAttributionPingback

- (InstallAttributionPingback)initWithAppAdamId:(id)a3 transactionId:(id)a4 campaignId:(id)a5 adNetworkId:(id)a6 attributionSignature:(id)a7 pingbackUrl:(id)a8 retryCount:(int64_t)a9 localTimestamp:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v51 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a10;
  v52.receiver = self;
  v52.super_class = (Class)InstallAttributionPingback;
  v22 = [(InstallAttributionPingback *)&v52 init];
  if (v22)
  {
    v23 = (NSNumber *)[v16 copy];
    appAdamId = v22->_appAdamId;
    v22->_appAdamId = v23;

    v25 = (NSString *)[v17 copy];
    transactionId = v22->_transactionId;
    v22->_transactionId = v25;

    v27 = (NSNumber *)[v51 copy];
    campaignId = v22->_campaignId;
    v22->_campaignId = v27;

    v29 = (NSString *)[v18 copy];
    adNetworkId = v22->_adNetworkId;
    v22->_adNetworkId = v29;

    v31 = (NSString *)[v19 copy];
    attributionSignature = v22->_attributionSignature;
    v22->_attributionSignature = v31;

    v33 = (NSURL *)[v20 copy];
    pingbackUrl = v22->_pingbackUrl;
    v22->_pingbackUrl = v33;

    v22->_retryCount = a9;
    v35 = (NSNumber *)[v21 copy];
    localTimestamp = v22->_localTimestamp;
    v22->_localTimestamp = v35;

    if (!v22->_appAdamId
      || !v22->_transactionId
      || !v22->_campaignId
      || !v22->_adNetworkId
      || !v22->_attributionSignature
      || !v21
      || !v22->_pingbackUrl)
    {
      id v50 = v16;
      v37 = +[SSLogConfig sharedDaemonConfig];
      if (!v37)
      {
        v37 = +[SSLogConfig sharedConfig];
      }
      unsigned int v38 = [v37 shouldLog];
      if ([v37 shouldLogToDisk]) {
        v38 |= 2u;
      }
      v39 = [v37 OSLogObject];
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        v38 &= 2u;
      }
      if (v38)
      {
        id v40 = v20;
        id v41 = v19;
        id v42 = v17;
        v43 = objc_opt_class();
        id v48 = v43;
        [(InstallAttributionPingback *)v22 description];
        v44 = id v49 = v18;
        int v53 = 138543618;
        v54 = v43;
        id v17 = v42;
        id v19 = v41;
        id v20 = v40;
        __int16 v55 = 2112;
        v56 = v44;
        LODWORD(v47) = 22;
        v45 = (void *)_os_log_send_and_compose_impl();

        id v18 = v49;
        if (!v45)
        {
LABEL_19:

          v22 = 0;
          id v16 = v50;
          goto LABEL_20;
        }
        v39 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v45, 4, &v53, v47);
        free(v45);
        SSFileLog();
      }

      goto LABEL_19;
    }
  }
LABEL_20:

  return v22;
}

- (id)description
{
  return +[NSString stringWithFormat:@"appAdamId: %@, adNetworkId: %@, campaignId: %@, transactionId: %@, attributionSignature: %@, pingbackUrl: %@, retryCount: %ld, localTimestamp: %@", self->_appAdamId, self->_adNetworkId, self->_campaignId, self->_transactionId, self->_attributionSignature, self->_pingbackUrl, self->_retryCount, self->_localTimestamp];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    v6 = [(InstallAttributionPingback *)self appAdamId];
    v7 = [v5 appAdamId];
    if ([v6 isEqual:v7])
    {
      v8 = [(InstallAttributionPingback *)self adNetworkId];
      v9 = [v5 adNetworkId];
      if ([v8 isEqual:v9])
      {
        v10 = [(InstallAttributionPingback *)self campaignId];
        v11 = [v5 campaignId];
        if ([v10 isEqual:v11])
        {
          v12 = [(InstallAttributionPingback *)self pingbackUrl];
          v26 = [v5 pingbackUrl];
          v27 = v12;
          if ([v12 isEqual:v26])
          {
            v13 = [(InstallAttributionPingback *)self transactionId];
            v24 = [v5 transactionId];
            v25 = v13;
            if ([v13 isEqual:v24])
            {
              uint64_t v14 = [(InstallAttributionPingback *)self attributionSignature];
              uint64_t v15 = [v5 attributionSignature];
              v23 = (void *)v14;
              id v16 = (void *)v14;
              id v17 = (void *)v15;
              if ([v16 isEqual:v15]
                && (id v21 = [(InstallAttributionPingback *)self retryCount],
                    v21 == [v5 retryCount]))
              {
                v22 = [(InstallAttributionPingback *)self localTimestamp];
                id v20 = [v5 localTimestamp];
                unsigned __int8 v18 = [v22 isEqual:v20];
              }
              else
              {
                unsigned __int8 v18 = 0;
              }
            }
            else
            {
              unsigned __int8 v18 = 0;
            }
          }
          else
          {
            unsigned __int8 v18 = 0;
          }
        }
        else
        {
          unsigned __int8 v18 = 0;
        }
      }
      else
      {
        unsigned __int8 v18 = 0;
      }
    }
    else
    {
      unsigned __int8 v18 = 0;
    }
  }
  else
  {
    unsigned __int8 v18 = 0;
  }

  return v18;
}

- (NSNumber)appAdamId
{
  return self->_appAdamId;
}

- (NSString)transactionId
{
  return self->_transactionId;
}

- (NSNumber)campaignId
{
  return self->_campaignId;
}

- (NSString)adNetworkId
{
  return self->_adNetworkId;
}

- (NSString)attributionSignature
{
  return self->_attributionSignature;
}

- (NSURL)pingbackUrl
{
  return self->_pingbackUrl;
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (NSNumber)localTimestamp
{
  return self->_localTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localTimestamp, 0);
  objc_storeStrong((id *)&self->_pingbackUrl, 0);
  objc_storeStrong((id *)&self->_attributionSignature, 0);
  objc_storeStrong((id *)&self->_adNetworkId, 0);
  objc_storeStrong((id *)&self->_campaignId, 0);
  objc_storeStrong((id *)&self->_transactionId, 0);

  objc_storeStrong((id *)&self->_appAdamId, 0);
}

@end