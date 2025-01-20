@interface UABestAppSuggestionController
- (BOOL)disableEntitlementsCheck;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)resume;
- (BOOL)suspend;
- (BOOL)terminate;
- (NSXPCListener)bestAppsListener;
- (UABestAppSuggestionController)initWithManager:(id)a3 name:(id)a4;
- (void)setBestAppsListener:(id)a3;
- (void)setDisableEntitlementsCheck:(BOOL)a3;
@end

@implementation UABestAppSuggestionController

- (UABestAppSuggestionController)initWithManager:(id)a3 name:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)UABestAppSuggestionController;
  v4 = [(UACornerActionManagerHandler *)&v11 initWithManager:a3 name:a4];
  if (v4)
  {
    id v5 = objc_alloc((Class)NSXPCListener);
    v6 = UABestAppSuggestionManagerServiceName();
    id v7 = [v5 initWithMachServiceName:v6];

    [v7 setDelegate:v4];
    [(UABestAppSuggestionController *)v4 setBestAppsListener:v7];
  }
  v8 = sub_10000BA18(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "BESTAPP: Created controller to handle connections to Springboard/Dock", v10, 2u);
  }

  return v4;
}

- (BOOL)suspend
{
  v8.receiver = self;
  v8.super_class = (Class)UABestAppSuggestionController;
  BOOL v3 = [(UACornerActionManagerHandler *)&v8 suspend];
  if (v3)
  {
    v4 = sub_10000BA18(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "BESTAPP: suspend", v7, 2u);
    }

    id v5 = [(UABestAppSuggestionController *)self bestAppsListener];
    [v5 suspend];
  }
  return v3;
}

- (BOOL)resume
{
  v8.receiver = self;
  v8.super_class = (Class)UABestAppSuggestionController;
  BOOL v3 = [(UACornerActionManagerHandler *)&v8 resume];
  if (v3)
  {
    v4 = sub_10000BA18(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "BESTAPP: resume", v7, 2u);
    }

    id v5 = [(UABestAppSuggestionController *)self bestAppsListener];
    [v5 resume];
  }
  return v3;
}

- (BOOL)terminate
{
  v8.receiver = self;
  v8.super_class = (Class)UABestAppSuggestionController;
  BOOL v3 = [(UACornerActionManagerHandler *)&v8 terminate];
  if (v3)
  {
    v4 = sub_10000BA18(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "BESTAPP: terminate", v7, 2u);
    }

    id v5 = [(UABestAppSuggestionController *)self bestAppsListener];
    [v5 invalidate];

    [(UABestAppSuggestionController *)self setBestAppsListener:0];
  }
  return v3;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = sub_10000BA18(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    if (v5) {
      [v5 auditToken];
    }
    else {
      memset(&v21, 0, sizeof(v21));
    }
    pid_t pidp = 0;
    audit_token_t atoken = v21;
    audit_token_to_au32(&atoken, 0, 0, 0, 0, 0, &pidp, 0, 0);
    atoken.val[0] = 134217984;
    *(void *)&atoken.val[1] = pidp;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "BESTAPP: received listener request from process %ld", (uint8_t *)&atoken, 0xCu);
  }

  id v7 = [v5 valueForEntitlement:@"com.apple.private.coreservices.lsuseractivityd.bestappsuggestion"];
  if (([v7 BOOLValue] & 1) != 0
    || ![v5 effectiveUserIdentifier])
  {
  }
  else
  {
    unsigned __int8 v8 = [(UABestAppSuggestionController *)self disableEntitlementsCheck];

    if ((v8 & 1) == 0)
    {
      v9 = sub_10000BA18(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = [UAAuditToken alloc];
        if (v5) {
          [v5 auditToken];
        }
        else {
          memset(v20, 0, 32);
        }
        v19 = [(UAAuditToken *)v10 initWithAuditToken:v20];
        atoken.val[0] = 138543618;
        *(void *)&atoken.val[1] = v19;
        LOWORD(atoken.val[3]) = 2114;
        *(void *)((char *)&atoken.val[3] + 2) = @"com.apple.private.coreservices.lsuseractivityd.bestappsuggestion";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "*** Attempt to access BestAppSuggestion xpc interface fror process %{public}@, which doesn't have the %{public}@ entitlement", (uint8_t *)&atoken, 0x16u);
      }
      [v5 invalidate];
      BOOL v17 = 0;
      goto LABEL_19;
    }
  }
  objc_super v11 = sub_10000BA18(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (v5) {
      [v5 auditToken];
    }
    else {
      memset(&v20[2], 0, 32);
    }
    pid_t pidp = 0;
    audit_token_t atoken = *(audit_token_t *)&v20[2];
    audit_token_to_au32(&atoken, 0, 0, 0, 0, 0, &pidp, 0, 0);
    atoken.val[0] = 134217984;
    *(void *)&atoken.val[1] = pidp;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "BESTAPP: Creating listening notifier for process %ld", (uint8_t *)&atoken, 0xCu);
  }

  v12 = [UABestAppSuggestionNotifier alloc];
  v13 = [(UACornerActionManagerHandler *)self manager];
  v14 = [(UABestAppSuggestionNotifier *)v12 initWithManager:v13 connection:v5];

  v15 = [(UACornerActionManagerHandler *)self manager];
  [v15 addActivityNotifier:v14];

  v16 = [(UACornerActionManagerHandler *)self manager];
  -[UACornerActionManagerHandler setSuspended:](v14, "setSuspended:", [v16 suspended]);

  BOOL v17 = 1;
LABEL_19:

  return v17;
}

- (BOOL)disableEntitlementsCheck
{
  return self->_disableEntitlementsCheck;
}

- (void)setDisableEntitlementsCheck:(BOOL)a3
{
  self->_disableEntitlementsCheck = a3;
}

- (NSXPCListener)bestAppsListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 56, 1);
}

- (void)setBestAppsListener:(id)a3
{
}

- (void).cxx_destruct
{
}

@end