@interface PALAccessorResolver
- (PALAccessorResolver)initWithSettings:(id)a3 tccAttributionResolver:(id)a4 applicationMetadataResolver:(id)a5;
- (PALApplicationMetadataResolver)applicationMetadataResolver;
- (PALTCCAttributionResolverProtocol)tccAttributionResolver;
- (id)resolveAccessorForAccess:(id)a3 senderAuditToken:(id *)a4 withError:(id *)a5;
- (void)setApplicationMetadataResolver:(id)a3;
- (void)setTccAttributionResolver:(id)a3;
@end

@implementation PALAccessorResolver

- (PALAccessorResolver)initWithSettings:(id)a3 tccAttributionResolver:(id)a4 applicationMetadataResolver:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PALAccessorResolver;
  v12 = [(PALAccessorResolver *)&v18 init];
  if (v12)
  {
    os_log_t v13 = os_log_create("com.apple.PrivacyAccounting", "PALAccessorResolver");
    logger = v12->_logger;
    v12->_logger = (OS_os_log *)v13;

    objc_storeStrong((id *)&v12->_settings, a3);
    objc_storeStrong((id *)&v12->_tccAttributionResolver, a4);
    objc_storeStrong((id *)&v12->_applicationMetadataResolver, a5);
    v15 = (NSCache *)objc_alloc_init((Class)NSCache);
    resolvedAccessorCache = v12->_resolvedAccessorCache;
    v12->_resolvedAccessorCache = v15;

    [(NSCache *)v12->_resolvedAccessorCache setName:@"com.apple.PrivacyAccounting.ResolvedAccessorCache"];
  }

  return v12;
}

- (id)resolveAccessorForAccess:(id)a3 senderAuditToken:(id *)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = [v8 accessor];
  id v10 = [v9 identifierType];

  if (v10 == (id)3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v8;
      v16 = [v8 tccService];
      unsigned __int8 v17 = [v16 isEqualToString:kTCCServiceMicrophone];

      if (v17)
      {
        *(_OWORD *)task_info_out = 0u;
        long long v60 = 0u;
        objc_super v18 = [v8 accessor];
        int v19 = [v18 insecureProcessIdentifier];
        target_task[0] = 0;
        BOOL v20 = 0;
        if (!task_name_for_pid(mach_task_self_, v19, target_task))
        {
          mach_msg_type_number_t task_info_outCnt = 8;
          BOOL v20 = task_info(target_task[0], 0xFu, task_info_out, &task_info_outCnt) == 0;
        }
        if (target_task[0] - 1 <= 0xFFFFFFFD) {
          mach_port_deallocate(mach_task_self_, target_task[0]);
        }

        if (v20)
        {
          *(_OWORD *)target_task = *(_OWORD *)task_info_out;
          long long v58 = v60;
          v21 = +[PAApplication applicationWithAuditToken:target_task];
          id v15 = [v8 copyWithNewAccessor:v21];

          v12 = 0;
          goto LABEL_4;
        }
        logger = self->_logger;
        if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR)) {
          sub_100004118(logger, v8);
        }
      }
      else if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
      {
        sub_1000041D8();
      }
      v29 = +[NSError errorWithDomain:@"PAErrorDomain" code:5 userInfo:0];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
        sub_100004240();
      }
      v29 = +[NSError errorWithDomain:@"PAErrorDomain" code:5 userInfo:0];
    }
    id v30 = 0;
    v25 = 0;
    v24 = 0;
    v12 = 0;
    goto LABEL_56;
  }
  if (v10 == (id)4)
  {
    id v11 = [v8 accessor];
    v12 = [v11 bridgedAssumedIdentity];

    long long v13 = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)task_info_out = *(_OWORD *)a4->var0;
    long long v60 = v13;
    uint64_t v14 = +[PAApplication applicationWithAuditToken:task_info_out];
    id v15 = [v8 copyWithNewAccessor:v14];

    id v8 = (id)v14;
LABEL_4:

    id v8 = v15;
    goto LABEL_14;
  }
  v12 = 0;
LABEL_14:
  v22 = [PALResolvedAccessorCacheKey alloc];
  v23 = [v8 accessor];
  v24 = [(PALResolvedAccessorCacheKey *)v22 initWithAccessor:v23 clientProvidedIdentity:v12];

  v25 = [(NSCache *)self->_resolvedAccessorCache objectForKey:v24];
  v26 = +[NSNull null];
  unsigned int v27 = [v25 isEqual:v26];

  if (!v27)
  {
    if (v25)
    {
      v31 = self->_logger;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        sub_100004084(v31, v8);
      }
      id v30 = [v8 copyWithNewAccessor:v25];
      goto LABEL_22;
    }
    v32 = [v8 accessor];
    id v33 = [v32 identifierType];

    if (v33 != (id)2) {
      goto LABEL_33;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
          sub_10000401C();
        }
        goto LABEL_54;
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      tccAttributionResolver = self->_tccAttributionResolver;
      v35 = [v12 identity];
      v36 = [(PALTCCAttributionResolverProtocol *)tccAttributionResolver resolveAttributionForTCCAccess:v8 clientProvidedIdentity:v35];

      if (!v36)
      {
        if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
          sub_100003FB4();
        }
LABEL_54:
        uint64_t v46 = 5;
        goto LABEL_55;
      }
    }
    else
    {
LABEL_33:
      v36 = 0;
    }
    if (v36) {
      id v37 = v36;
    }
    else {
      id v37 = v8;
    }
    v38 = [(PALApplicationMetadataResolver *)self->_applicationMetadataResolver resolveApplicationMetadataForAccess:v37];

    if (v38)
    {
      id v39 = v38;
      v40 = [PALResolvedAccessorCacheKey alloc];
      v41 = [v39 accessor];
      v42 = [(PALResolvedAccessorCacheKey *)v40 initWithAccessor:v41 clientProvidedIdentity:0];

      if (qword_10001F240 != -1) {
        dispatch_once(&qword_10001F240, &stru_1000187B8);
      }
      v43 = [(id)qword_10001F238 objectForKeyedSubscript:v42];
      id v44 = v43 ? [v39 copyWithNewAccessor:v43] : v39;
      id v30 = v44;

      if (v30)
      {
        v25 = 0;
LABEL_22:
        v29 = 0;
        goto LABEL_56;
      }
    }
    uint64_t v46 = 14;
LABEL_55:
    v29 = +[NSError errorWithDomain:@"PAErrorDomain" code:v46 userInfo:0];
    id v30 = 0;
    v25 = 0;
    goto LABEL_56;
  }
  v28 = self->_logger;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
    sub_100003F20(v28, v8);
  }
  v29 = +[NSError errorWithDomain:@"PAErrorDomain" code:16 userInfo:0];
  id v30 = 0;
LABEL_56:
  if ((id)[(PALSettings *)self->_settings accessFilteringPolicy] == (id)2
    && ([v30 accessor],
        v47 = objc_claimAutoreleasedReturnValue(),
        id v48 = [v47 identifierType],
        v47,
        v48))
  {
    v49 = self->_logger;
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
      sub_100003E60((uint64_t)v8, v49, v30);
    }

    uint64_t v50 = +[NSError errorWithDomain:@"PAErrorDomain" code:5 userInfo:0];

    v29 = (void *)v50;
  }
  else if (v30)
  {
    resolvedAccessorCache = self->_resolvedAccessorCache;
    v52 = [v30 accessor];
    [(NSCache *)resolvedAccessorCache setObject:v52 forKey:v24];

    if (!v29)
    {
      id v53 = 0;
      goto LABEL_70;
    }
    goto LABEL_68;
  }
  if (v29)
  {
    if ([v29 code] == (id)5)
    {
      v54 = self->_resolvedAccessorCache;
      v55 = +[NSNull null];
      [(NSCache *)v54 setObject:v55 forKey:v24];
    }
    id v30 = 0;
LABEL_68:
    id v53 = v29;
    *a5 = v53;
    goto LABEL_70;
  }
  id v53 = 0;
  id v30 = 0;
LABEL_70:

  return v30;
}

- (PALTCCAttributionResolverProtocol)tccAttributionResolver
{
  return (PALTCCAttributionResolverProtocol *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTccAttributionResolver:(id)a3
{
}

- (PALApplicationMetadataResolver)applicationMetadataResolver
{
  return (PALApplicationMetadataResolver *)objc_getProperty(self, a2, 40, 1);
}

- (void)setApplicationMetadataResolver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationMetadataResolver, 0);
  objc_storeStrong((id *)&self->_tccAttributionResolver, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_resolvedAccessorCache, 0);

  objc_storeStrong((id *)&self->_logger, 0);
}

@end