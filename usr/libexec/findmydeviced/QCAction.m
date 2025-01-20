@interface QCAction
- (BOOL)shouldCancelAction:(id)a3;
- (BOOL)shouldWaitForAction:(id)a3;
- (BOOL)shutdownActivityPending;
- (FMDAccount)account;
- (FMDCommandContext)commandContext;
- (FMDNetworkAction)networkAction;
- (FMDRequestDecorator)requestDecorator;
- (FMDRequestQueueCheck)request;
- (FMDServerInteractionController)serverInteractionController;
- (NSString)description;
- (NSUUID)commandContextUUID;
- (QCAction)initWithAccount:(id)a3 shutdownActivityPending:(BOOL)a4 serverInteractionController:(id)a5;
- (id)_commandHandlers;
- (id)_copyHandlerForCommand:(id)a3 params:(id)a4;
- (id)actionType;
- (void)_didCompleteQueueCheckRequest:(id)a3 completion:(id)a4;
- (void)_handleQueueCheckResponseWithStatus:(int64_t)a3 andBody:(id)a4 completion:(id)a5;
- (void)runWithCompletion:(id)a3;
- (void)setAccount:(id)a3;
- (void)setCommandContext:(id)a3;
- (void)setCommandContextUUID:(id)a3;
- (void)setNetworkAction:(id)a3;
- (void)setRequest:(id)a3;
- (void)setRequestDecorator:(id)a3;
- (void)setServerInteractionController:(id)a3;
- (void)setShutdownActivityPending:(BOOL)a3;
- (void)willCancelAction;
@end

@implementation QCAction

- (QCAction)initWithAccount:(id)a3 shutdownActivityPending:(BOOL)a4 serverInteractionController:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)QCAction;
  v10 = [(QCAction *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(QCAction *)v10 setAccount:v8];
    [(QCAction *)v11 setShutdownActivityPending:v6];
    [(QCAction *)v11 setServerInteractionController:v9];
  }

  return v11;
}

- (id)actionType
{
  return @"QCAction";
}

- (void)runWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(QCAction *)self account];
  id v6 = [v5 unregisterState];

  if (!v6)
  {
    v7 = [(QCAction *)self commandContext];
    id v8 = [v7 pendingActionUUID];
    [(QCAction *)self setCommandContextUUID:v8];

    id v9 = [FMDRequestQueueCheck alloc];
    v10 = [(QCAction *)self account];
    v11 = [(FMDRequestQueueCheck *)v9 initWithAccount:v10 shutdownActivityPending:[(QCAction *)self shutdownActivityPending]];

    objc_initWeak(&location, self);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10005ABE8;
    v20[3] = &unk_1002D9EE0;
    objc_copyWeak(&v22, &location);
    id v21 = v4;
    [(FMDRequest *)v11 setCompletionHandler:v20];
    v12 = [(QCAction *)self requestDecorator];
    [(FMDRequest *)v11 setDecorator:v12];

    objc_super v13 = [(QCAction *)self serverInteractionController];
    v14 = [(QCAction *)self commandContext];
    v15 = [v14 accessory];

    if (v15)
    {
      v16 = [[FMDNetworkAction alloc] initWithRequest:v11 andServerInteractionController:v13];
      [(QCAction *)self setNetworkAction:v16];
      v17 = +[FMDOperationManager sharedManager];
      v18 = [v15 accessoryIdentifier];
      v19 = [v18 stringValue];
      [v17 addAction:v16 forIdentifier:v19];
    }
    else
    {
      [(QCAction *)self setRequest:v11];
      [v13 enqueueRequest:v11];
    }

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
}

- (void)willCancelAction
{
  v3 = [(QCAction *)self commandContext];
  id v4 = [v3 accessory];

  v5 = sub_100004238();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(QCAction *)self request];
    int v11 = 138412802;
    v12 = self;
    __int16 v13 = 2112;
    v14 = v6;
    __int16 v15 = 2112;
    v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "QCAction(%@) will cancel request(%@) with command context accessory(%@)", (uint8_t *)&v11, 0x20u);
  }
  if (v4)
  {
    v7 = +[FMDOperationManager sharedManager];
    id v8 = [(QCAction *)self networkAction];
    id v9 = [v4 accessoryIdentifier];
    v10 = [v9 stringValue];
    [v7 cancelAction:v8 forIdentifier:v10];
  }
  else
  {
    v7 = [(QCAction *)self serverInteractionController];
    id v8 = [(QCAction *)self request];
    [v7 cancelRequest:v8];
  }
}

- (BOOL)shouldCancelAction:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 serverInteractionController];
    id v6 = [(QCAction *)self serverInteractionController];
    BOOL v7 = v5 == v6;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)shouldWaitForAction:(id)a3
{
  return 0;
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"QC(0x%p)", self];
}

- (void)_didCompleteQueueCheckRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 willRetry] & 1) == 0)
  {
    id v8 = [v6 httpResponseError];
    if (v8
      || (uint64_t)[v6 httpResponseStatus] < 200
      || (uint64_t)[v6 httpResponseStatus] > 399)
    {
    }
    else if (([v6 cancelled] & 1) == 0)
    {
      __int16 v15 = sub_100004238();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = [v6 fm_logID];
        int v18 = 138412546;
        v19 = v16;
        __int16 v20 = 2048;
        id v21 = [v6 httpResponseStatus];
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@: successful with status %ld.", (uint8_t *)&v18, 0x16u);
      }
      id v17 = [v6 httpResponseStatus];
      v10 = [v6 httpResponseBody];
      [(QCAction *)self _handleQueueCheckResponseWithStatus:v17 andBody:v10 completion:v7];
      goto LABEL_12;
    }
    unsigned int v9 = [v6 cancelled];
    v10 = sub_100004238();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        v12 = [v6 fm_logID];
        int v18 = 138412290;
        v19 = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@: Cancelled", (uint8_t *)&v18, 0xCu);
LABEL_11:
      }
    }
    else if (v11)
    {
      v12 = [v6 fm_logID];
      id v13 = [v6 httpResponseStatus];
      v14 = [v6 httpResponseError];
      int v18 = 138412802;
      v19 = v12;
      __int16 v20 = 2048;
      id v21 = v13;
      __int16 v22 = 2112;
      v23 = v14;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@: Error (%ld) %@", (uint8_t *)&v18, 0x20u);

      goto LABEL_11;
    }
LABEL_12:
  }
}

- (void)_handleQueueCheckResponseWithStatus:(int64_t)a3 andBody:(id)a4 completion:(id)a5
{
  id v8 = a4;
  unsigned int v9 = (void (**)(void))a5;
  switch(a3)
  {
    case 200:
      v10 = +[FMDStartupRegisterManager sharedInstance];
      BOOL v11 = v10;
      uint64_t v12 = 5;
LABEL_7:
      [v10 eventDidOccur:v12];

      break;
    case 210:
      v10 = +[FMDStartupRegisterManager sharedInstance];
      BOOL v11 = v10;
      uint64_t v12 = 7;
      goto LABEL_7;
    case 204:
      v10 = +[FMDStartupRegisterManager sharedInstance];
      BOOL v11 = v10;
      uint64_t v12 = 6;
      goto LABEL_7;
  }
  if (!v8 || ![v8 count])
  {
    BOOL v17 = 0;
    goto LABEL_20;
  }
  id v13 = [v8 objectForKeyedSubscript:@"cmd"];
  v14 = sub_100004238();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v38 = 138412290;
    *(void *)&v38[4] = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Command Received: %@", v38, 0xCu);
  }

  id v15 = [(QCAction *)self _copyHandlerForCommand:v13 params:v8];
  v16 = v15;
  BOOL v17 = v15 != 0;
  if (v15)
  {
    [v15 executeCommand];
    int v18 = sub_100004238();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v38 = 138412290;
      *(void *)&v38[4] = v13;
      v19 = "Successfully finished command %@";
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v19, v38, 0xCu);
    }
  }
  else
  {
    int v18 = sub_100004238();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v38 = 138412290;
      *(void *)&v38[4] = v13;
      v19 = "No handler found for command %@";
      goto LABEL_18;
    }
  }

LABEL_20:
  __int16 v20 = +[FMDStartupRegisterManager sharedInstance];
  [v20 eventDidOccur:8];

  if (v9) {
    v9[2](v9);
  }
  switch(a3)
  {
    case 200:
      id v21 = sub_100004238();
      BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
      if (v17)
      {
        if (v22)
        {
          *(_WORD *)v38 = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "More messages pending - checking now...", v38, 2u);
        }

        v23 = [QCAction alloc];
        v24 = [(QCAction *)self account];
        BOOL v25 = [(QCAction *)self shutdownActivityPending];
        v26 = [(QCAction *)self serverInteractionController];
        id v21 = [(QCAction *)v23 initWithAccount:v24 shutdownActivityPending:v25 serverInteractionController:v26];

        v27 = [(QCAction *)self requestDecorator];
        [v21 setRequestDecorator:v27];

        v28 = [(QCAction *)self commandContext];
        [v21 setCommandContext:v28];

        v29 = +[ActionManager sharedManager];
        id v30 = [v29 enqueueAction:v21];

        goto LABEL_40;
      }
      if (v22)
      {
        *(_WORD *)v38 = 0;
        v31 = "Not checking for new messages - previous command was not successful or duplicate";
        goto LABEL_33;
      }
      goto LABEL_40;
    case 204:
      v32 = sub_100004238();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v38 = 0;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "No more pending messages on the server 204...", v38, 2u);
      }

      v33 = [(QCAction *)self commandContext];
      id v21 = [v33 accessory];

      if ([v21 connectionState] == (id)1)
      {
        v34 = sub_100004238();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          v35 = [(QCAction *)self commandContextUUID];
          *(_DWORD *)v38 = 138412290;
          *(void *)&v38[4] = v35;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "QCAction marking command complete %@", v38, 0xCu);
        }
        v36 = [(QCAction *)self commandContext];
        v37 = [(QCAction *)self commandContextUUID];
        [v36 setActionCompleted:v37];
      }
      goto LABEL_40;
    case 210:
      id v21 = sub_100004238();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v38 = 0;
        v31 = "No more pending messages on the server 210...";
LABEL_33:
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v31, v38, 2u);
      }
LABEL_40:

      break;
  }
}

- (id)_copyHandlerForCommand:(id)a3 params:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(QCAction *)self _commandHandlers];
  unsigned int v9 = (objc_class *)[v8 objectForKeyedSubscript:v6];
  v10 = sub_100004238();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412546;
    v16 = v9;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Using handler %@ for command type %@", (uint8_t *)&v15, 0x16u);
  }

  if (v9)
  {
    BOOL v11 = +[FMDServiceProvider activeServiceProvider];
    id v12 = [[v9 alloc] initWithParams:v7 provider:v11];
    id v13 = [(QCAction *)self commandContext];
    [v12 setCommandContext:v13];
  }
  else
  {
    BOOL v11 = sub_100004238();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_10023F5AC((uint64_t)v6, v11);
    }
    id v12 = 0;
  }

  return v12;
}

- (id)_commandHandlers
{
  v2 = (void *)qword_10031E958;
  if (qword_10031E958) {
    goto LABEL_10;
  }
  v12[0] = @"register";
  v13[0] = objc_opt_class();
  v12[1] = @"message";
  v13[1] = objc_opt_class();
  v12[2] = @"locate";
  v13[2] = objc_opt_class();
  v12[3] = @"dataUpdate";
  v13[3] = objc_opt_class();
  v12[4] = @"wipe";
  v13[4] = objc_opt_class();
  v12[5] = @"notify";
  v13[5] = objc_opt_class();
  v12[6] = @"lock";
  v13[6] = objc_opt_class();
  v12[7] = @"identityV5";
  v13[7] = objc_opt_class();
  v12[8] = @"lost";
  v13[8] = objc_opt_class();
  v3 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:9];
  id v4 = [v3 mutableCopy];
  v5 = (void *)qword_10031E958;
  qword_10031E958 = (uint64_t)v4;

  id v6 = +[FMSystemInfo sharedInstance];
  if ([v6 isInternalBuild])
  {
    unsigned __int8 v7 = +[FMPreferencesUtil BOOLForKey:@"DisableRemoteAccessoryConfig" inDomain:kFMDNotBackedUpPrefDomain];

    if (v7) {
      goto LABEL_7;
    }
  }
  else
  {
  }
  [objc_msgSend((id)qword_10031E958, "fm_safeSetObject:forKey:", objc_opt_class(), @"accessory_config")];
LABEL_7:
  id v8 = sub_100004238();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    uint64_t v11 = qword_10031E958;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Command handlers : %@", (uint8_t *)&v10, 0xCu);
  }

  v2 = (void *)qword_10031E958;
LABEL_10:

  return v2;
}

- (FMDCommandContext)commandContext
{
  return self->_commandContext;
}

- (void)setCommandContext:(id)a3
{
}

- (FMDRequestDecorator)requestDecorator
{
  return self->_requestDecorator;
}

- (void)setRequestDecorator:(id)a3
{
}

- (FMDRequestQueueCheck)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (FMDNetworkAction)networkAction
{
  return self->_networkAction;
}

- (void)setNetworkAction:(id)a3
{
}

- (FMDAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (BOOL)shutdownActivityPending
{
  return self->_shutdownActivityPending;
}

- (void)setShutdownActivityPending:(BOOL)a3
{
  self->_shutdownActivityPending = a3;
}

- (FMDServerInteractionController)serverInteractionController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serverInteractionController);

  return (FMDServerInteractionController *)WeakRetained;
}

- (void)setServerInteractionController:(id)a3
{
}

- (NSUUID)commandContextUUID
{
  return self->_commandContextUUID;
}

- (void)setCommandContextUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandContextUUID, 0);
  objc_destroyWeak((id *)&self->_serverInteractionController);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_networkAction, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_requestDecorator, 0);

  objc_storeStrong((id *)&self->_commandContext, 0);
}

@end