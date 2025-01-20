@interface ClaimStoreKitClientOperation
- (ClaimStoreKitClientOperation)initWithClientIdentity:(id)a3;
- (NSData)clientAuditTokenData;
- (StoreKitClientIdentity)clientIdentity;
- (void)run;
- (void)setClientAuditTokenData:(id)a3;
@end

@implementation ClaimStoreKitClientOperation

- (ClaimStoreKitClientOperation)initWithClientIdentity:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ClaimStoreKitClientOperation;
  v5 = [(ClaimStoreKitClientOperation *)&v9 init];
  if (v5)
  {
    v6 = (StoreKitClientIdentity *)[v4 copy];
    clientIdentity = v5->_clientIdentity;
    v5->_clientIdentity = v6;
  }
  return v5;
}

- (NSData)clientAuditTokenData
{
  [(ClaimStoreKitClientOperation *)self lock];
  v3 = self->_clientAuditTokenData;
  [(ClaimStoreKitClientOperation *)self unlock];

  return v3;
}

- (StoreKitClientIdentity)clientIdentity
{
  [(ClaimStoreKitClientOperation *)self lock];
  id v3 = [(StoreKitClientIdentity *)self->_clientIdentity copy];
  [(ClaimStoreKitClientOperation *)self unlock];

  return (StoreKitClientIdentity *)v3;
}

- (void)setClientAuditTokenData:(id)a3
{
  v5 = (NSData *)a3;
  [(ClaimStoreKitClientOperation *)self lock];
  if (self->_clientAuditTokenData != v5) {
    objc_storeStrong((id *)&self->_clientAuditTokenData, a3);
  }
  [(ClaimStoreKitClientOperation *)self unlock];
}

- (void)run
{
  id v3 = [(StoreKitClientIdentity *)self->_clientIdentity storeIdentifier];
  if (!v3)
  {
    if ([(StoreKitClientIdentity *)self->_clientIdentity isSandboxed]) {
      goto LABEL_4;
    }
    v6 = [(StoreKitClientIdentity *)self->_clientIdentity bundleIdentifier];
    BOOL v5 = v6 != 0;
    if (!v6)
    {
      id v4 = +[NSError errorWithDomain:SSErrorDomain code:116 userInfo:0];
LABEL_37:

      goto LABEL_5;
    }
    v7 = +[LSApplicationProxy applicationProxyForIdentifier:v6];
    v8 = [v7 applicationType];
    unsigned int v9 = [v8 isEqualToString:LSSystemApplicationType];

    if (!v9)
    {
LABEL_36:

      id v4 = 0;
      goto LABEL_37;
    }
    id v10 = objc_alloc((Class)NSNumber);
    v11 = [v7 applicationDSID];
    id v37 = objc_msgSend(v10, "initWithLongLong:", objc_msgSend(v11, "longLongValue"));

    v12 = [v7 itemID];
    v38 = [v7 externalVersionIdentifier];
    v36 = v7;
    if (!v12 || !v38) {
      goto LABEL_19;
    }
    id v13 = [(StoreKitClientIdentity *)self->_clientIdentity accountIdentifier];
    if (v13 == v37)
    {
    }
    else
    {
      v14 = [(StoreKitClientIdentity *)self->_clientIdentity accountIdentifier];
      v15 = v14;
      if (!v14 || !v37)
      {

LABEL_19:
        +[SSLogConfig sharedDaemonConfig];
        v18 = v7 = v36;
        if (!v18)
        {
          v18 = +[SSLogConfig sharedConfig];
        }
        unsigned int v19 = [v18 shouldLog];
        if ([v18 shouldLogToDisk]) {
          v19 |= 2u;
        }
        v20 = [v18 OSLogObject];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
          int v21 = v19;
        }
        else {
          int v21 = v19 & 2;
        }
        if (v21)
        {
          *(_DWORD *)v42 = 138412546;
          *(void *)&v42[4] = objc_opt_class();
          *(_WORD *)&v42[12] = 2112;
          *(void *)&v42[14] = v6;
          id v22 = *(id *)&v42[4];
          LODWORD(v35) = 22;
          v34 = v42;
          v23 = (void *)_os_log_send_and_compose_impl();

          if (v23)
          {
            +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v23, 4, v42, v35);
            v24 = (unsigned char *)objc_claimAutoreleasedReturnValue();
            free(v23);
            v34 = v24;
            SSFileLog();
          }
        }
        else
        {
        }
        *(void *)v42 = 0;
        *(void *)&v42[8] = v42;
        *(void *)&v42[16] = 0x3032000000;
        v43 = sub_100175554;
        v44 = sub_100175564;
        id v45 = 0;
        dispatch_semaphore_t v25 = dispatch_semaphore_create(0);
        v26 = [(ClaimStoreKitClientOperation *)self clientAuditTokenData];
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_10017556C;
        v39[3] = &unk_1003A8400;
        v41 = v42;
        v27 = v25;
        v40 = v27;
        +[AppStoreUtility checkFirstPartyClaimsWithAuditTokenData:v26 completionBlock:v39];

        dispatch_semaphore_wait(v27, 0xFFFFFFFFFFFFFFFFLL);
        if ([*(id *)(*(void *)&v42[8] + 40) count])
        {
          v28 = [*(id *)(*(void *)&v42[8] + 40) firstObject];
          v29 = +[LSApplicationProxy applicationProxyForIdentifier:v28];
          if (v29)
          {
            [(ClaimStoreKitClientOperation *)self lock];
            clientIdentity = self->_clientIdentity;
            v31 = [v29 itemID];
            [(StoreKitClientIdentity *)clientIdentity setStoreIdentifier:v31];

            v32 = self->_clientIdentity;
            v33 = [v29 externalVersionIdentifier];
            [(StoreKitClientIdentity *)v32 setStoreVersion:v33];

            [(ClaimStoreKitClientOperation *)self unlock];
          }

          v7 = v36;
        }

        _Block_object_dispose(v42, 8);
        goto LABEL_35;
      }
      v16 = [(StoreKitClientIdentity *)self->_clientIdentity accountIdentifier];
      unsigned int v17 = [v16 isEqualToNumber:v37];

      if (!v17) {
        goto LABEL_19;
      }
    }
    [(ClaimStoreKitClientOperation *)self lock];
    [(StoreKitClientIdentity *)self->_clientIdentity setStoreIdentifier:v12];
    [(StoreKitClientIdentity *)self->_clientIdentity setStoreVersion:v38];
    [(ClaimStoreKitClientOperation *)self unlock];
    v7 = v36;
LABEL_35:

    goto LABEL_36;
  }

LABEL_4:
  id v4 = 0;
  BOOL v5 = 1;
LABEL_5:
  -[ClaimStoreKitClientOperation setError:](self, "setError:", v4, v34);
  [(ClaimStoreKitClientOperation *)self setSuccess:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentity, 0);

  objc_storeStrong((id *)&self->_clientAuditTokenData, 0);
}

@end