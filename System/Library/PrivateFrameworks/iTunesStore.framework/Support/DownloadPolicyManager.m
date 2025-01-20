@interface DownloadPolicyManager
- (BOOL)_isPolicyRuleCellularDataAllowed:(id)a3 networkType:(int64_t)a4;
- (BOOL)_isPolicyRuleNetworkTypeAllowed:(id)a3 networkType:(int64_t)a4;
- (BOOL)_isPolicyRuleSatisfied:(id)a3 forPolicy:(id)a4 networkType:(int64_t)a5;
- (DownloadPolicyManager)init;
- (DownloadPolicyManager)initWithDownloadsDatabase:(id)a3;
- (DownloadsDatabase)downloadsDatabase;
- (id)downloadPolicyForID:(int64_t)a3;
- (id)overrideDownloadSizeLimitForDownloadIdentifier:(int64_t)a3;
- (int64_t)_sizeLimitForPolicy:(id)a3 networkType:(int64_t)a4;
- (int64_t)addDownloadPolicy:(id)a3;
- (int64_t)downloadSizeLimitForPolicyWithID:(int64_t)a3;
- (int64_t)downloadSizeLimitForPolicyWithID:(int64_t)a3 networkType:(int64_t)a4;
- (void)_addPolicy:(id)a3;
- (void)_initializePolicy;
- (void)dealloc;
- (void)removeOverrideDownloadSizeLimitForDownloadIdentifier:(int64_t)a3;
- (void)setOverrideDownloadSizeLimit:(int64_t)a3 forDownloadIdentifier:(int64_t)a4;
@end

@implementation DownloadPolicyManager

- (DownloadPolicyManager)init
{
  id v3 = +[DownloadsDatabase downloadsDatabase];

  return [(DownloadPolicyManager *)self initWithDownloadsDatabase:v3];
}

- (DownloadPolicyManager)initWithDownloadsDatabase:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)DownloadPolicyManager;
  v4 = [(DownloadPolicyManager *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_database = (DownloadsDatabase *)a3;
    v4->_policies = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    database = v5->_database;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100162480;
    v8[3] = &unk_1003A33A8;
    v8[4] = v5;
    [(DownloadsDatabase *)database dispatchBlockAsync:v8];
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)DownloadPolicyManager;
  [(DownloadPolicyManager *)&v3 dealloc];
}

- (int64_t)addDownloadPolicy:(id)a3
{
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  policies = self->_policies;
  id v6 = [(NSMutableDictionary *)policies countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v26;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(policies);
        }
        objc_super v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if (objc_msgSend(objc_msgSend(-[NSMutableDictionary objectForKey:](self->_policies, "objectForKey:", v9), "downloadPolicy"), "isEqual:", a3))
        {
          id v10 = [v9 longLongValue];
          v30[3] = (uint64_t)v10;
          goto LABEL_11;
        }
      }
      id v6 = [(NSMutableDictionary *)policies countByEnumeratingWithState:&v25 objects:v37 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:
  int64_t v11 = v30[3];
  if (!v11)
  {
    uint64_t v24 = 0;
    v12 = +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v24];
    if (v24)
    {
      id v13 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v13) {
        id v13 = +[SSLogConfig sharedConfig];
      }
      unsigned int v14 = [v13 shouldLog];
      unsigned int v15 = [v13 shouldLogToDisk];
      v16 = [v13 OSLogObject];
      if (v15) {
        v14 |= 2u;
      }
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        v14 &= 2u;
      }
      if (v14)
      {
        uint64_t v17 = objc_opt_class();
        int v33 = 138543618;
        uint64_t v34 = v17;
        __int16 v35 = 2114;
        uint64_t v36 = v24;
        LODWORD(v22) = 22;
        uint64_t v18 = _os_log_send_and_compose_impl();
        if (v18)
        {
          v19 = (void *)v18;
          +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v18, 4, &v33, v22);
          free(v19);
          SSFileLog();
        }
      }
    }
    if (v12)
    {
      database = self->_database;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10016280C;
      v23[3] = &unk_1003A7FE0;
      v23[5] = self;
      v23[6] = &v29;
      v23[4] = v12;
      [(DownloadsDatabase *)database modifyUsingTransactionBlock:v23];
    }
    int64_t v11 = v30[3];
  }
  _Block_object_dispose(&v29, 8);
  return v11;
}

- (id)downloadPolicyForID:(int64_t)a3
{
  id v4 = [objc_alloc((Class)NSNumber) initWithLongLong:a3];
  id v5 = [(NSMutableDictionary *)self->_policies objectForKey:v4];

  return [v5 downloadPolicy];
}

- (int64_t)downloadSizeLimitForPolicyWithID:(int64_t)a3
{
  id v5 = [+[ISNetworkObserver sharedInstance] networkType];

  return [(DownloadPolicyManager *)self downloadSizeLimitForPolicyWithID:a3 networkType:v5];
}

- (int64_t)downloadSizeLimitForPolicyWithID:(int64_t)a3 networkType:(int64_t)a4
{
  id v6 = [objc_alloc((Class)NSNumber) initWithLongLong:a3];
  id v7 = [(NSMutableDictionary *)self->_policies objectForKey:v6];
  if (v7) {
    int64_t v8 = [(DownloadPolicyManager *)self _sizeLimitForPolicy:v7 networkType:a4];
  }
  else {
    int64_t v8 = SSDownloadSizeLimitDisabled;
  }

  return v8;
}

- (id)overrideDownloadSizeLimitForDownloadIdentifier:(int64_t)a3
{
  id v4 = [objc_alloc((Class)NSNumber) initWithLongLong:a3];
  id v5 = [(NSMutableDictionary *)self->_sizeLimitOverrides objectForKey:v4];

  return v5;
}

- (void)removeOverrideDownloadSizeLimitForDownloadIdentifier:(int64_t)a3
{
  if (self->_sizeLimitOverrides)
  {
    id v4 = [objc_alloc((Class)NSNumber) initWithLongLong:a3];
    -[NSMutableDictionary removeObjectForKey:](self->_sizeLimitOverrides, "removeObjectForKey:");
    if (![(NSMutableDictionary *)self->_sizeLimitOverrides count])
    {

      self->_sizeLimitOverrides = 0;
    }
  }
}

- (void)setOverrideDownloadSizeLimit:(int64_t)a3 forDownloadIdentifier:(int64_t)a4
{
  if (!self->_sizeLimitOverrides) {
    self->_sizeLimitOverrides = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  }
  id v8 = [objc_alloc((Class)NSNumber) initWithLongLong:a4];
  id v7 = [objc_alloc((Class)NSNumber) initWithLongLong:a3];
  [(NSMutableDictionary *)self->_sizeLimitOverrides setObject:v7 forKey:v8];
}

- (void)_addPolicy:(id)a3
{
  id v5 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithLongLong:", objc_msgSend(a3, "databaseID"));
  if (![(NSMutableDictionary *)self->_policies objectForKey:v5])
  {
    int64_t v6 = [(DownloadPolicyManager *)self _sizeLimitForPolicy:a3 networkType:[+[ISNetworkObserver sharedInstance] networkType]];
    id v7 = +[SSLogConfig sharedDaemonConfig];
    if (!v7) {
      id v7 = +[SSLogConfig sharedConfig];
    }
    unsigned int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    if (!os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_INFO)) {
      v9 &= 2u;
    }
    if (v9)
    {
      int v15 = 138412802;
      uint64_t v16 = objc_opt_class();
      __int16 v17 = 2112;
      id v18 = v5;
      __int16 v19 = 2048;
      int64_t v20 = v6;
      LODWORD(v14) = 32;
      id v13 = &v15;
      uint64_t v10 = _os_log_send_and_compose_impl();
      if (v10)
      {
        int64_t v11 = (void *)v10;
        v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, &v15, v14);
        free(v11);
        id v13 = (int *)v12;
        SSFileLog();
      }
    }
    -[NSMutableDictionary setObject:forKey:](self->_policies, "setObject:forKey:", a3, v5, v13);
  }
}

- (void)_initializePolicy
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  database = self->_database;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100163024;
  v23[3] = &unk_1003A6690;
  v23[4] = v3;
  [(DownloadsDatabase *)database readUsingTransactionBlock:v23];
  id v5 = +[SSLogConfig sharedDaemonConfig];
  if (!v5) {
    id v5 = +[SSLogConfig sharedConfig];
  }
  unsigned int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  if (!os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_INFO)) {
    v7 &= 2u;
  }
  if (v7)
  {
    uint64_t v8 = objc_opt_class();
    id v9 = [v3 count];
    int v25 = 138412546;
    uint64_t v26 = v8;
    __int16 v27 = 2048;
    id v28 = v9;
    LODWORD(v18) = 22;
    __int16 v17 = &v25;
    uint64_t v10 = _os_log_send_and_compose_impl();
    if (v10)
    {
      int64_t v11 = (void *)v10;
      v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, &v25, v18);
      free(v11);
      __int16 v17 = (int *)v12;
      SSFileLog();
    }
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v13 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16, v17);
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v3);
        }
        [(DownloadPolicyManager *)self _addPolicy:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      id v14 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v14);
  }
}

- (BOOL)_isPolicyRuleCellularDataAllowed:(id)a3 networkType:(int64_t)a4
{
  id v5 = [a3 cellularDataStates];
  if (v5 == (id)3
    || (char v6 = (char)v5, !SSNetworkTypeIsCellularType())
    || (int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"AllowAutoDownloadOnCellular", kSSUserDefaultsIdentifier, 0), (v6 & 2) != 0)&& AppBooleanValue)
  {
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = v6 & (AppBooleanValue == 0);
  }
  if (SSNetworkTypeIsCellularType())
  {
    if ([a3 isCellularAllowed])
    {
      id v9 = [a3 userDefaultStates];
      if ([v9 count])
      {
        long long v18 = 0u;
        long long v19 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v17;
          while (2)
          {
            for (i = 0; i != v11; i = (char *)i + 1)
            {
              if (*(void *)v17 != v12) {
                objc_enumerationMutation(v9);
              }
              if ([*(id *)(*((void *)&v16 + 1) + 8 * i) currentBoolValue])
              {
                id v14 = [a3 downloadSizeLimit];
                if (v14 == (id)SSDownloadSizeLimitDisabled) {
                  return 0;
                }
                return v8;
              }
            }
            id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }
      }
    }
  }
  return v8;
}

- (BOOL)_isPolicyRuleNetworkTypeAllowed:(id)a3 networkType:(int64_t)a4
{
  id v5 = [a3 networkTypes];
  if (![v5 count]) {
    return 1;
  }
  id v6 = [objc_alloc((Class)NSNumber) initWithInteger:a4];
  unsigned __int8 v7 = [v5 containsObject:v6];

  return v7;
}

- (BOOL)_isPolicyRuleSatisfied:(id)a3 forPolicy:(id)a4 networkType:(int64_t)a5
{
  BOOL v8 = [(DownloadPolicyManager *)self _isPolicyRuleNetworkTypeAllowed:a3 networkType:a5];
  if (v8)
  {
    LOBYTE(v8) = [(DownloadPolicyManager *)self _isPolicyRuleCellularDataAllowed:a3 networkType:a5];
  }
  return v8;
}

- (int64_t)_sizeLimitForPolicy:(id)a3 networkType:(int64_t)a4
{
  int64_t v7 = SSDownloadSizeLimitDisabled;
  id v8 = [a3 downloadPolicy];
  id v9 = [v8 policyRules];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  id v11 = (id)v7;
  if (v10)
  {
    id v12 = v10;
    uint64_t v13 = *(void *)v24;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([(DownloadPolicyManager *)self _isPolicyRuleSatisfied:v15 forPolicy:a3 networkType:a4])
        {
          id v11 = [v15 downloadSizeLimit];
          goto LABEL_11;
        }
      }
      id v12 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v12) {
        continue;
      }
      break;
    }
    id v11 = (id)v7;
  }
LABEL_11:
  id v16 = [v8 downloadKind];
  if (!v16) {
    return (int64_t)v11;
  }
  id v17 = v16;
  if (![v9 count] || v11 != (id)v7)
  {
    id v18 = objc_msgSend(objc_msgSend(+[ISURLBagCache sharedCache](ISURLBagCache, "sharedCache"), "URLBagForContext:", +[SSURLBagContext contextWithBagType:](SSURLBagContext, "contextWithBagType:", objc_msgSend(v8, "URLBagType"))), "networkConstraintsForDownloadKind:", v17);
    if (v18)
    {
      id v19 = [v18 sizeLimitForNetworkType:a4];
      if ((uint64_t)v11 >= (uint64_t)v19) {
        int64_t v20 = (int64_t)v19;
      }
      else {
        int64_t v20 = (int64_t)v11;
      }
      if (v11 == (id)SSDownloadSizeLimitNoLimit || v11 == (id)v7) {
        return (int64_t)v19;
      }
      else {
        return v20;
      }
    }
    else if (a4)
    {
      if (SSNetworkTypeIsCellularType()) {
        return 104857600;
      }
      else {
        return SSDownloadSizeLimitNoLimit;
      }
    }
  }
  return v7;
}

- (DownloadsDatabase)downloadsDatabase
{
  return self->_database;
}

@end