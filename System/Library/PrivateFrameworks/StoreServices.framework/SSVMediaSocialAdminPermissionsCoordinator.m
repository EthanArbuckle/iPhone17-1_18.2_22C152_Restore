@interface SSVMediaSocialAdminPermissionsCoordinator
+ (id)sharedCoordinator;
- (BOOL)_statusIsFresh:(id)a3;
- (BOOL)isCurrentUserAdmin;
- (SSVMediaSocialAdminPermissionsCoordinator)init;
- (double)refreshPeriod;
- (id)_adminStatusForAccountID:(id)a3;
- (void)_setAdminStatus:(id)a3 forAccountID:(id)a4;
- (void)getAdminStatusAndWaitWithOptions:(id)a3 resultBlock:(id)a4;
- (void)getAdminStatusWithOptions:(id)a3 resultBlock:(id)a4;
- (void)reset;
- (void)setRefreshPeriod:(double)a3;
@end

@implementation SSVMediaSocialAdminPermissionsCoordinator

- (SSVMediaSocialAdminPermissionsCoordinator)init
{
  v9.receiver = self;
  v9.super_class = (Class)SSVMediaSocialAdminPermissionsCoordinator;
  v2 = [(SSVMediaSocialAdminPermissionsCoordinator *)&v9 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.StoreKitUI.SKUIMediaSocialAdminPermissionsCoordinator", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    v5 = (void *)CFPreferencesCopyAppValue(@"MediaSocialRefreshPeriodKey", @"com.apple.itunesstored");
    v6 = v5;
    if (v5) {
      [v5 doubleValue];
    }
    else {
      uint64_t v7 = 0x404E000000000000;
    }
    *(void *)&v2->_refreshPeriod = v7;
  }
  return v2;
}

+ (id)sharedCoordinator
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__SSVMediaSocialAdminPermissionsCoordinator_sharedCoordinator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCoordinator_sOnce != -1) {
    dispatch_once(&sharedCoordinator_sOnce, block);
  }
  v2 = (void *)sharedCoordinator_sCoordinator;
  return v2;
}

void __62__SSVMediaSocialAdminPermissionsCoordinator_sharedCoordinator__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedCoordinator_sCoordinator;
  sharedCoordinator_sCoordinator = (uint64_t)v1;
}

- (void)getAdminStatusAndWaitWithOptions:(id)a3 resultBlock:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, void *))a4;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__66;
  v21 = __Block_byref_object_dispose__66;
  id v22 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __90__SSVMediaSocialAdminPermissionsCoordinator_getAdminStatusAndWaitWithOptions_resultBlock___block_invoke;
  v13[3] = &unk_1E5BA9918;
  v15 = &v23;
  v16 = &v17;
  objc_super v9 = v8;
  v14 = v9;
  [(SSVMediaSocialAdminPermissionsCoordinator *)self getAdminStatusWithOptions:v6 resultBlock:v13];
  dispatch_time_t v10 = dispatch_time(0, 10000000000);
  intptr_t v11 = dispatch_semaphore_wait(v9, v10);
  if (v7)
  {
    if (v11)
    {
      v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SSErrorDomain" code:140 userInfo:0];
      v7[2](v7, 0, v12);
    }
    else
    {
      v7[2](v7, *((unsigned __int8 *)v24 + 24), (void *)v18[5]);
    }
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
}

void __90__SSVMediaSocialAdminPermissionsCoordinator_getAdminStatusAndWaitWithOptions_resultBlock___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)getAdminStatusWithOptions:(id)a3 resultBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__SSVMediaSocialAdminPermissionsCoordinator_getAdminStatusWithOptions_resultBlock___block_invoke;
  block[3] = &unk_1E5BA6EB8;
  v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

void __83__SSVMediaSocialAdminPermissionsCoordinator_getAdminStatusWithOptions_resultBlock___block_invoke(uint64_t a1)
{
  v2 = +[SSAccountStore defaultStore];
  dispatch_queue_t v3 = [v2 activeAccount];
  v4 = [v3 uniqueIdentifier];

  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    if (v5
      && ([v5 objectForKey:@"SSVMediaSocialAdminPermissionsOptionIgnoreCache"],
          id v6 = objc_claimAutoreleasedReturnValue(),
          char v7 = [v6 BOOLValue],
          v6,
          (v7 & 1) != 0))
    {
      dispatch_semaphore_t v8 = 0;
    }
    else
    {
      dispatch_semaphore_t v8 = [*(id *)(a1 + 40) _adminStatusForAccountID:v4];
      if (v8)
      {
        if ([*(id *)(a1 + 40) _statusIsFresh:v8])
        {
          uint64_t v9 = *(void *)(a1 + 48);
          if (v9)
          {
            (*(void (**)(uint64_t, uint64_t, void))(v9 + 16))(v9, [v8 isAdmin], 0);
LABEL_12:

            goto LABEL_13;
          }
        }
      }
    }
    id v10 = +[SSURLBagContext contextWithBagType:0];
    intptr_t v11 = SSVDefaultUserAgent();
    [v10 setValue:v11 forHTTPHeaderField:@"User-Agent"];

    id v12 = [[SSURLBag alloc] initWithURLBagContext:v10];
    v13 = objc_alloc_init(SSVMediaSocialAdminStatusOperation);
    [(SSVComplexOperation *)v13 configureWithURLBag:v12];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __83__SSVMediaSocialAdminPermissionsCoordinator_getAdminStatusWithOptions_resultBlock___block_invoke_2;
    v14[3] = &unk_1E5BADB10;
    v14[4] = *(void *)(a1 + 40);
    id v15 = v4;
    id v16 = *(id *)(a1 + 48);
    [(SSVMediaSocialAdminStatusOperation *)v13 setOutputBlock:v14];
    [(SSVMediaSocialAdminStatusOperation *)v13 main];

    goto LABEL_12;
  }
  if (*(void *)(a1 + 48))
  {
    dispatch_semaphore_t v8 = SSError(@"SSErrorDomain", 119, 0, 0);
    (*(void (**)(void, void, void *))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 0, v8);
    goto LABEL_12;
  }
LABEL_13:
}

void __83__SSVMediaSocialAdminPermissionsCoordinator_getAdminStatusWithOptions_resultBlock___block_invoke_2(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v11 = a4;
  if (a2)
  {
    char v7 = [SSVMediaSocialAdminStatus alloc];
    dispatch_semaphore_t v8 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v9 = [(SSVMediaSocialAdminStatus *)v7 initWithAdminStatus:a3 dateUpdated:v8];

    [*(id *)(a1 + 32) _setAdminStatus:v9 forAccountID:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(void *)(a1 + 48);
  if (v10) {
    (*(void (**)(uint64_t, BOOL, id))(v10 + 16))(v10, [(SSVMediaSocialAdminStatus *)v9 isAdmin], v11);
  }
}

- (BOOL)isCurrentUserAdmin
{
  dispatch_queue_t v3 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  v4 = objc_msgSend(v3, "ams_activeiTunesAccount");
  id v5 = objc_msgSend(v4, "ams_DSID");

  if (v5)
  {
    id v6 = [(SSVMediaSocialAdminPermissionsCoordinator *)self _adminStatusForAccountID:v5];
    char v7 = [v6 isAdmin];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)reset
{
  CFPreferencesSetAppValue(@"MediaSocialSavedAdminStatusesKey", 0, @"com.apple.itunesstored");
  [(SSVMediaSocialAdminPermissionsCoordinator *)self setRefreshPeriod:60.0];
}

- (id)_adminStatusForAccountID:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"SSVMediaSocialAdminPermissionsCoordinator.m", 135, @"Invalid parameter not satisfying: %@", @"accountID" object file lineNumber description];
  }
  id v6 = (void *)CFPreferencesCopyAppValue(@"MediaSocialSavedAdminStatusesKey", @"com.apple.itunesstored");
  if (v6)
  {
    char v7 = (void *)MEMORY[0x1E4F28DC0];
    dispatch_semaphore_t v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    id v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    id v31 = 0;
    id v12 = [v7 unarchivedObjectOfClasses:v11 fromData:v6 error:&v31];
    id v13 = v31;

    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = [v12 objectForKeyedSubscript:v5];
LABEL_19:

        goto LABEL_21;
      }
    }
    id v15 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v15)
    {
      id v15 = +[SSLogConfig sharedConfig];
    }
    int v16 = [v15 shouldLog];
    if ([v15 shouldLogToDisk]) {
      int v17 = v16 | 2;
    }
    else {
      int v17 = v16;
    }
    v18 = [v15 OSLogObject];
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      v17 &= 2u;
    }
    if (v17)
    {
      uint64_t v19 = objc_opt_class();
      int v32 = 138543618;
      v33 = v19;
      __int16 v34 = 2114;
      id v35 = v13;
      id v20 = v19;
      LODWORD(v30) = 22;
      v21 = (void *)_os_log_send_and_compose_impl();

      if (!v21)
      {
LABEL_18:

        id v14 = 0;
        goto LABEL_19;
      }
      v18 = objc_msgSend(NSString, "stringWithCString:encoding:", v21, 4, &v32, v30);
      free(v21);
      SSFileLog(v15, @"%@", v22, v23, v24, v25, v26, v27, (uint64_t)v18);
    }

    goto LABEL_18;
  }
  id v14 = 0;
LABEL_21:

  return v14;
}

- (void)_setAdminStatus:(id)a3 forAccountID:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6) {
      goto LABEL_3;
    }
  }
  else
  {
    v45 = [MEMORY[0x1E4F28B00] currentHandler];
    [v45 handleFailureInMethod:a2, self, @"SSVMediaSocialAdminPermissionsCoordinator.m", 153, @"Invalid parameter not satisfying: %@", @"accountID" object file lineNumber description];

    if (v6) {
      goto LABEL_3;
    }
  }
  v46 = [MEMORY[0x1E4F28B00] currentHandler];
  [v46 handleFailureInMethod:a2, self, @"SSVMediaSocialAdminPermissionsCoordinator.m", 154, @"Invalid parameter not satisfying: %@", @"adminStatus" object file lineNumber description];

LABEL_3:
  dispatch_semaphore_t v8 = (void *)CFPreferencesCopyAppValue(@"MediaSocialSavedAdminStatusesKey", @"com.apple.itunesstored");
  uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
  if (!v8) {
    goto LABEL_20;
  }
  uint64_t v10 = (void *)MEMORY[0x1E4F28DC0];
  id v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  id v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  id v51 = 0;
  id v14 = [v10 unarchivedObjectOfClasses:v13 fromData:v8 error:&v51];
  id v15 = v51;

  if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    int v16 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v16)
    {
      int v16 = +[SSLogConfig sharedConfig];
    }
    int v17 = [v16 shouldLog];
    if ([v16 shouldLogToDisk]) {
      int v18 = v17 | 2;
    }
    else {
      int v18 = v17;
    }
    uint64_t v19 = [v16 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      int v20 = v18;
    }
    else {
      int v20 = v18 & 2;
    }
    if (v20)
    {
      v21 = objc_opt_class();
      int v52 = 138543618;
      v53 = v21;
      __int16 v54 = 2114;
      id v55 = v15;
      id v22 = v21;
      LODWORD(v48) = 22;
      v47 = &v52;
      uint64_t v23 = (void *)_os_log_send_and_compose_impl();

      if (!v23) {
        goto LABEL_19;
      }
      uint64_t v19 = objc_msgSend(NSString, "stringWithCString:encoding:", v23, 4, &v52, v48);
      free(v23);
      SSFileLog(v16, @"%@", v24, v25, v26, v27, v28, v29, (uint64_t)v19);
    }

    goto LABEL_19;
  }
  int v16 = v9;
  uint64_t v9 = (void *)[v14 mutableCopy];
LABEL_19:

LABEL_20:
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, v7, v47);
  id v50 = 0;
  uint64_t v30 = (const void *)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v9 requiringSecureCoding:1 error:&v50];
  id v31 = v50;
  if (v31)
  {
    int v32 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v32)
    {
      int v32 = +[SSLogConfig sharedConfig];
    }
    int v33 = [v32 shouldLog];
    if ([v32 shouldLogToDisk]) {
      v33 |= 2u;
    }
    __int16 v34 = [v32 OSLogObject];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      int v35 = v33;
    }
    else {
      int v35 = v33 & 2;
    }
    if (v35)
    {
      uint64_t v36 = objc_opt_class();
      int v52 = 138543618;
      v53 = v36;
      __int16 v54 = 2114;
      id v55 = v31;
      id v37 = v36;
      LODWORD(v48) = 22;
      v38 = (void *)_os_log_send_and_compose_impl();

      if (!v38)
      {
LABEL_32:

        goto LABEL_33;
      }
      __int16 v34 = objc_msgSend(NSString, "stringWithCString:encoding:", v38, 4, &v52, v48);
      free(v38);
      SSFileLog(v32, @"%@", v39, v40, v41, v42, v43, v44, (uint64_t)v34);
    }

    goto LABEL_32;
  }
LABEL_33:
  CFPreferencesSetAppValue(@"MediaSocialSavedAdminStatusesKey", v30, @"com.apple.itunesstored");
}

- (BOOL)_statusIsFresh:(id)a3
{
  if (!a3) {
    return 0;
  }
  v4 = [a3 dateUpdated];
  [v4 timeIntervalSinceNow];
  double v6 = fabs(v5);
  [(SSVMediaSocialAdminPermissionsCoordinator *)self refreshPeriod];
  BOOL v8 = v6 < v7;

  return v8;
}

- (double)refreshPeriod
{
  return self->_refreshPeriod;
}

- (void)setRefreshPeriod:(double)a3
{
  self->_refreshPeriod = a3;
}

- (void).cxx_destruct
{
}

@end