@interface SubscriptionEntitlementsOperation
- (BOOL)ignoreCaches;
- (NSString)clientIdentifier;
- (id)_fetchSubscriptionEntitlements:(id *)a3;
- (id)subscriptionEntitlementsBlock;
- (void)run;
- (void)setClientIdentifier:(id)a3;
- (void)setIgnoreCaches:(BOOL)a3;
- (void)setSubscriptionEntitlementsBlock:(id)a3;
@end

@implementation SubscriptionEntitlementsOperation

- (void)run
{
  v3 = [(SubscriptionEntitlementsOperation *)self subscriptionEntitlementsBlock];
  char v18 = 0;
  if ([(SubscriptionEntitlementsOperation *)self ignoreCaches])
  {
    v4 = 0;
  }
  else
  {
    v4 = +[SSVSubscriptionEntitlementsCoordinator cachedSubscriptionEntitlementsExpired:&v18];
    if (v4) {
      BOOL v5 = v18 == 0;
    }
    else {
      BOOL v5 = 0;
    }
    if (v5)
    {
      id v14 = 0;
      goto LABEL_22;
    }
  }
  v6 = +[SSLogConfig sharedDaemonConfig];
  if (!v6)
  {
    v6 = +[SSLogConfig sharedConfig];
  }
  unsigned int v7 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v8 = v7 | 2;
  }
  else {
    int v8 = v7;
  }
  v9 = [v6 OSLogObject];
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
    v8 &= 2u;
  }
  if (!v8) {
    goto LABEL_17;
  }
  v10 = objc_opt_class();
  int v19 = 138412290;
  v20 = v10;
  id v11 = v10;
  LODWORD(v16) = 12;
  v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v19, v16);
    free(v12);
    SSFileLog();
LABEL_17:
  }
  id v17 = 0;
  v13 = [(SubscriptionEntitlementsOperation *)self _fetchSubscriptionEntitlements:&v17];
  id v14 = v17;
  if (!v14)
  {
    id v15 = v13;

    v4 = v15;
  }

LABEL_22:
  ((void (**)(void, void *, id))v3)[2](v3, v4, v14);
  [(SubscriptionEntitlementsOperation *)self setError:v14];
  [(SubscriptionEntitlementsOperation *)self setSubscriptionEntitlementsBlock:0];
  [(SubscriptionEntitlementsOperation *)self setSuccess:1];
}

- (id)_fetchSubscriptionEntitlements:(id *)a3
{
  id v5 = objc_alloc_init((Class)ISStoreURLOperation);
  [v5 setCanSendGUIDParameter:0];
  v6 = +[DaemonProtocolDataProvider provider];
  [v5 setDataProvider:v6];

  id v7 = objc_alloc_init((Class)SSMutableURLRequestProperties);
  [v7 setURLBagKey:@"fsEntitlementsSrv"];
  [v5 setRequestProperties:v7];
  id v24 = 0;
  unsigned int v8 = [(SubscriptionEntitlementsOperation *)self runSubOperation:v5 returningError:&v24];
  id v9 = v24;
  v10 = [v5 response];
  objc_opt_class();
  objc_opt_class();
  id v11 = 0;
  if (objc_opt_isKindOfClass())
  {
    id v11 = [v5 response];
  }

  id v12 = [v11 statusCode];
  if (v12 == (id)200) {
    unsigned int v13 = v8;
  }
  else {
    unsigned int v13 = 0;
  }
  if (v13 == 1)
  {
    id v14 = [v5 dataProvider];
    id v15 = [v14 output];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v20 = 0;
      goto LABEL_22;
    }
    uint64_t v16 = [v15 objectForKey:@"status"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v16 integerValue])
    {
      id v17 = [v15 objectForKey:@"errorNumber"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        char v18 = v17;
      }
      else {
        char v18 = v16;
      }
      [v18 integerValue];
      int v19 = [v15 objectForKey:@"errorMessage"];
      uint64_t v23 = SSError();

      v20 = 0;
      id v9 = (id)v23;
    }
    else
    {
      id v17 = [v15 objectForKeyedSubscript:@"entitlements"];
      v20 = +[SSVSubscriptionEntitlements _parseJSONDictionary:v17];
      +[SSVSubscriptionEntitlementsCoordinator setCachedSubscriptionEntitlements:v17];
    }
  }
  else
  {
    if (v9)
    {
      v20 = 0;
      if (!a3) {
        goto LABEL_25;
      }
      goto LABEL_23;
    }
    id v21 = v12;
    uint64_t v16 = SSError();
    id v15 = +[NSNumber numberWithInteger:v21];
    SSErrorBySettingUserInfoValue();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    v20 = 0;
  }

LABEL_22:
  if (!a3) {
    goto LABEL_25;
  }
LABEL_23:
  if (!v20) {
    *a3 = v9;
  }
LABEL_25:

  return v20;
}

- (NSString)clientIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setClientIdentifier:(id)a3
{
}

- (BOOL)ignoreCaches
{
  return self->_ignoreCaches;
}

- (void)setIgnoreCaches:(BOOL)a3
{
  self->_ignoreCaches = a3;
}

- (id)subscriptionEntitlementsBlock
{
  return objc_getProperty(self, a2, 104, 1);
}

- (void)setSubscriptionEntitlementsBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_subscriptionEntitlementsBlock, 0);

  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end