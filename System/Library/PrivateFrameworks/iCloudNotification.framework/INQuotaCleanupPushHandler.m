@interface INQuotaCleanupPushHandler
- (BOOL)_isValidPush:(id)a3;
- (INQuotaCleanupPushHandler)initWithAccountStore:(id)a3;
- (void)clearClientCacheWithCacheTypes:(id)a3;
- (void)handleIncomingPushNotification:(id)a3;
@end

@implementation INQuotaCleanupPushHandler

- (INQuotaCleanupPushHandler)initWithAccountStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INQuotaCleanupPushHandler;
  v6 = [(INQuotaCleanupPushHandler *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accountStore, a3);
  }

  return v7;
}

- (void)handleIncomingPushNotification:(id)a3
{
  id v6 = a3;
  if (-[INQuotaCleanupPushHandler _isValidPush:](self, "_isValidPush:"))
  {
    v4 = [v6 userInfo];
    id v5 = [v4 objectForKeyedSubscript:@"cacheTypes"];
    [(INQuotaCleanupPushHandler *)self clearClientCacheWithCacheTypes:v5];
  }
}

- (BOOL)_isValidPush:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"event"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [v4 userInfo];
    v8 = [v7 objectForKeyedSubscript:@"dsId"];

    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v9 = v8;
        goto LABEL_12;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v9 = [v8 stringValue];
LABEL_12:
        v10 = v9;
        accountStore = self->_accountStore;
        p_accountStore = &self->_accountStore;
        v19 = [(ACAccountStore *)accountStore aa_appleAccountWithPersonID:v9];
        unsigned __int8 v18 = [v19 aa_isAccountClass:AAAccountClassPrimary];
        if ((v18 & 1) == 0)
        {
          v29 = _INLogSystem();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
            sub_1000285B0((uint64_t)v10, (id *)p_accountStore, v29);
          }

          v30 = _INLogSystem();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            sub_100028578(v30, v31, v32, v33, v34, v35, v36, v37);
          }
        }
        goto LABEL_21;
      }
      v19 = _INLogSystem();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1000264D4((uint64_t)v8, v19);
      }
    }
    else
    {
      v19 = _INLogSystem();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100028540(v19, v20, v21, v22, v23, v24, v25, v26);
      }
    }
    v10 = 0;
    unsigned __int8 v18 = 0;
LABEL_21:

    goto LABEL_22;
  }
  v10 = _INLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_100028674(v10, v11, v12, v13, v14, v15, v16, v17);
  }
  unsigned __int8 v18 = 0;
LABEL_22:

  return v18;
}

- (void)clearClientCacheWithCacheTypes:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v3 enumerateObjectsUsingBlock:&stru_100041020];
  }
  else
  {
    id v4 = _INLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000286AC();
    }
  }
}

- (void).cxx_destruct
{
}

@end