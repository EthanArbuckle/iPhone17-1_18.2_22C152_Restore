@interface VMVoicemailGreetingController
- (OS_dispatch_queue)queue;
- (VMVoicemailGreetingController)initWithService:(id)a3;
- (VVService)voicemailService;
- (id)setVoicemailReply;
- (void)_greetingFetchEnded:(id)a3;
- (void)_greetingSaveCompleted:(id)a3;
- (void)_handleGreetingTaskNotification:(id)a3;
- (void)dealloc;
- (void)greetingWithCompletion:(id)a3;
- (void)setGreeting:(id)a3 completion:(id)a4;
- (void)setSetVoicemailReply:(id)a3;
- (void)setVoicemailService:(id)a3;
@end

@implementation VMVoicemailGreetingController

- (VMVoicemailGreetingController)initWithService:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)VMVoicemailGreetingController;
  v5 = [(VMVoicemailGreetingController *)&v26 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_voicemailService, v4);
    v7 = +[NSBundle bundleForClass:objc_opt_class()];
    v8 = [v7 bundleIdentifier];
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    v11 = NSStringFromSelector("queue");
    v12 = +[NSString stringWithFormat:@"%@.%@.%@", v8, v10, v11];

    id v13 = v12;
    dispatch_queue_t v14 = dispatch_queue_create((const char *)[v13 UTF8String], 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v14;

    v16 = vm_vmd_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [(VMVoicemailGreetingController *)v6 voicemailService];
      v18 = [v17 serviceLabelID];
      v19 = [(VMVoicemailGreetingController *)v6 voicemailService];
      v20 = [v19 contextInfo];
      *(_DWORD *)buf = 138412546;
      v28 = v18;
      __int16 v29 = 2112;
      v30 = v20;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Adding greeting observers for account %@, subscription %@", buf, 0x16u);
    }
    v21 = +[NSNotificationCenter defaultCenter];
    v22 = [(VMVoicemailGreetingController *)v6 voicemailService];
    [v21 addObserver:v6 selector:"_handleGreetingTaskNotification:" name:@"VVServiceTaskEndedNotification" object:v22];

    v23 = +[NSNotificationCenter defaultCenter];
    v24 = [(VMVoicemailGreetingController *)v6 voicemailService];
    [v23 addObserver:v6 selector:"_handleGreetingTaskNotification:" name:@"VVServiceTaskCancelledNotification" object:v24];
  }
  return v6;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VMVoicemailGreetingController;
  [(VMVoicemailGreetingController *)&v4 dealloc];
}

- (void)greetingWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = vm_vmd_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(VMVoicemailGreetingController *)self voicemailService];
    v7 = [v6 serviceLabelID];
    v8 = [(VMVoicemailGreetingController *)self voicemailService];
    v9 = [v8 contextInfo];
    int v11 = 138412546;
    v12 = v7;
    __int16 v13 = 2112;
    dispatch_queue_t v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Get greeting for account %@, subscription %@", (uint8_t *)&v11, 0x16u);
  }
  v10 = [(VMVoicemailGreetingController *)self voicemailService];
  [v10 retrieveGreeting:v4];
}

- (void)setGreeting:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  v8 = vm_vmd_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v7;
    if ([v6 type] == (id)2) {
      CFStringRef v10 = @"custom";
    }
    else {
      CFStringRef v10 = @"standard";
    }
    v23 = [(VMVoicemailGreetingController *)self voicemailService];
    int v11 = [v23 serviceLabelID];
    v12 = [(VMVoicemailGreetingController *)self voicemailService];
    __int16 v13 = [v12 contextInfo];
    dispatch_queue_t v14 = [v6 url];
    v15 = [v14 path];
    *(_DWORD *)buf = 138413314;
    CFStringRef v25 = v10;
    v7 = v9;
    __int16 v26 = 2112;
    id v27 = v6;
    __int16 v28 = 2112;
    __int16 v29 = v11;
    __int16 v30 = 2112;
    v31 = v13;
    __int16 v32 = 2112;
    v33 = v15;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Set %@ greeting %@ for account %@, subscription %@ from file at %@", buf, 0x34u);
  }
  if ([v6 type] != (id)2)
  {
    [v6 setDuration:0.0];
    v17 = 0;
    goto LABEL_12;
  }
  v16 = [v6 url];
  v17 = +[NSData dataWithContentsOfURL:v16];

  if (v17)
  {
LABEL_12:
    [(VMVoicemailGreetingController *)self setSetVoicemailReply:v7];
    v19 = [(VMVoicemailGreetingController *)self voicemailService];
    id v20 = [v6 type];
    if ((unint64_t)v20 >= 3) {
      uint64_t v21 = 3;
    }
    else {
      uint64_t v21 = (uint64_t)v20;
    }
    [v6 duration];
    [v19 setGreetingType:v21 data:v17 duration:(unint64_t)v22];

    goto LABEL_16;
  }
  v18 = vm_vmd_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    sub_100081870(v6, self, v18);
  }

  v17 = +[NSError errorWithDomain:kVVErrorDomain code:1032 userInfo:0];
  v7[2](v7, 0, v17);
LABEL_16:
}

- (void)_handleGreetingTaskNotification:(id)a3
{
  id v4 = a3;
  v5 = vm_vmd_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v12 = 138412546;
    *(void *)&v12[4] = objc_opt_class();
    *(_WORD *)&v12[12] = 2112;
    *(void *)&v12[14] = v4;
    id v6 = *(id *)&v12[4];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", v12, 0x16u);
  }
  v7 = [v4 userInfo];
  v8 = [v7 valueForKey:@"VVTaskWillBeRetried"];
  unsigned int v9 = [v8 BOOLValue];

  CFStringRef v10 = [v4 userInfo];
  int v11 = [v10 valueForKey:@"VVTaskType"];

  if (![v11 isEqual:&off_1000C8648] || (v9 & 1) != 0)
  {
    if (objc_msgSend(v11, "isEqual:", &off_1000C8660, *(_OWORD *)v12, *(void *)&v12[16]))
    {
      if (v9) {
        goto LABEL_11;
      }
    }
    else if (([v11 isEqual:&off_1000C8678] ^ 1 | v9))
    {
      goto LABEL_11;
    }
    [(VMVoicemailGreetingController *)self _greetingSaveCompleted:v4];
    goto LABEL_11;
  }
  [(VMVoicemailGreetingController *)self _greetingFetchEnded:v4];
LABEL_11:
}

- (void)_greetingFetchEnded:(id)a3
{
  id v4 = a3;
  v5 = vm_vmd_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 userInfo];
    int v33 = 138412290;
    v34 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Retrieving greeting finished with user info %@", (uint8_t *)&v33, 0xCu);
  }
  v7 = [v4 userInfo];
  v8 = [v7 objectForKeyedSubscript:@"VVBlock"];

  if (v8)
  {
    unsigned int v9 = [v4 userInfo];
    CFStringRef v10 = [v9 objectForKeyedSubscript:@"VVError"];

    if (v10)
    {
      int v11 = [v4 userInfo];
      v12 = [v11 objectForKeyedSubscript:@"VVError"];

      __int16 v13 = [v12 domain];
      if ([v13 isEqualToString:kVVErrorDomain])
      {
        id v14 = [v12 code];

        if (v14 == (id)1033)
        {
          v15 = vm_vmd_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            int v33 = 138412290;
            v34 = v12;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Greeting did not exist on server, even though we expected custom greeting: %@", (uint8_t *)&v33, 0xCu);
          }

          v16 = vm_vmd_log();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v17 = [(VMVoicemailGreetingController *)self voicemailService];
            v18 = [v17 contextInfo];
            int v33 = 138412290;
            v34 = v18;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Retrieving greeting completed, but greeting message does not exist for subscription %@", (uint8_t *)&v33, 0xCu);
          }
          id v19 = (id)objc_opt_new();
          [v19 setType:0];
          [v19 setUrl:0];
LABEL_18:
          ((void (**)(void, id, void))v8)[2](v8, v19, 0);
LABEL_23:

          goto LABEL_24;
        }
      }
      else
      {
      }
      __int16 v30 = vm_vmd_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = [(VMVoicemailGreetingController *)self voicemailService];
        __int16 v32 = [v31 contextInfo];
        int v33 = 138412290;
        v34 = v32;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Retrieving greeting failed for subscription %@", (uint8_t *)&v33, 0xCu);
      }
      id v19 = +[NSError errorWithDomain:@"com.apple.mobilephone" code:1034 userInfo:0];
      ((void (**)(void, void, id))v8)[2](v8, 0, v19);
      goto LABEL_23;
    }
    id v20 = vm_vmd_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = [(VMVoicemailGreetingController *)self voicemailService];
      double v22 = [v21 contextInfo];
      int v33 = 138412290;
      v34 = v22;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Retrieved greeting successfully for subscription %@", (uint8_t *)&v33, 0xCu);
    }
    id v19 = objc_alloc_init((Class)VMVoicemailGreeting);
    v23 = [(VMVoicemailGreetingController *)self voicemailService];
    id v24 = [v23 mailboxGreetingType];
    if ((unint64_t)v24 >= 3) {
      uint64_t v25 = 3;
    }
    else {
      uint64_t v25 = (uint64_t)v24;
    }
    [v19 setType:v25];

    __int16 v26 = [(VMVoicemailGreetingController *)self voicemailService];
    id v27 = [v26 accountDir];
    __int16 v29 = sub_10006D9E8(v27, v28);
    [v19 setUrl:v29];

    goto LABEL_18;
  }
LABEL_24:
}

- (void)_greetingSaveCompleted:(id)a3
{
  id v4 = a3;
  v5 = vm_vmd_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(VMVoicemailGreetingController *)self voicemailService];
    v7 = [v6 contextInfo];
    v8 = [v4 userInfo];
    int v14 = 138412546;
    v15 = v7;
    __int16 v16 = 2112;
    v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Saving greeting completed for subscription %@ with user info %@", (uint8_t *)&v14, 0x16u);
  }
  unsigned int v9 = [v4 userInfo];
  CFStringRef v10 = [v9 objectForKeyedSubscript:@"VVError"];

  if (v10)
  {
    int v11 = +[NSError errorWithDomain:@"com.apple.mobilephone" code:1035 userInfo:0];
  }
  else
  {
    int v11 = 0;
  }
  v12 = [(VMVoicemailGreetingController *)self setVoicemailReply];

  if (v12)
  {
    __int16 v13 = [(VMVoicemailGreetingController *)self setVoicemailReply];
    ((void (**)(void, BOOL, void *))v13)[2](v13, v11 == 0, v11);
  }
}

- (id)setVoicemailReply
{
  return self->_setVoicemailReply;
}

- (void)setSetVoicemailReply:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (VVService)voicemailService
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_voicemailService);
  return (VVService *)WeakRetained;
}

- (void)setVoicemailService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_voicemailService);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_setVoicemailReply, 0);
}

@end