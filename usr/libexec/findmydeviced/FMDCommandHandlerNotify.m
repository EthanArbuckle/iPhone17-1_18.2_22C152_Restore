@interface FMDCommandHandlerNotify
- (void)handleCommand;
- (void)sendAckWithCompletion:(id)a3;
@end

@implementation FMDCommandHandlerNotify

- (void)handleCommand
{
  v3 = [(FMDCommandHandler *)self commandParams];
  v4 = [v3 objectForKeyedSubscript:@"title"];

  v5 = [(FMDCommandHandler *)self commandParams];
  v6 = [v5 objectForKeyedSubscript:@"body"];

  v7 = [(FMDCommandHandler *)self commandParams];
  v8 = [v7 objectForKeyedSubscript:@"category"];

  v9 = [(FMDCommandHandler *)self commandParams];
  v10 = [v9 objectForKeyedSubscript:@"deviceId"];

  if (v4)
  {
    if (v6)
    {
      if (v8)
      {
        if (v10)
        {
          v11 = objc_alloc_init(FMDUserNotificationContent);
          [(FMDUserNotificationContent *)v11 setTitle:v4];
          [(FMDUserNotificationContent *)v11 setBody:v6];
          [(FMDUserNotificationContent *)v11 setCategoryIdentifier:v8];
          [(FMDUserNotificationContent *)v11 setDeviceId:v10];
          v12 = +[FMDFMIPManager sharedInstance];
          [v12 addNotificationRequest:v11 completion:&stru_1002DACC0];

          [(FMDCommandHandler *)self didHandleCommandWithAckData:0];
          goto LABEL_13;
        }
        uint64_t v13 = 3;
      }
      else
      {
        uint64_t v13 = 2;
      }
    }
    else
    {
      uint64_t v13 = 1;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  v14 = sub_100004238();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134217984;
    uint64_t v16 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Notify command failed; missing : %lu",
      (uint8_t *)&v15,
      0xCu);
  }

  [(FMDCommandHandler *)self didHandleCommandWithAckData:0];
LABEL_13:
}

- (void)sendAckWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(FMDCommandHandler *)self commandParams];
  v6 = [v5 objectForKeyedSubscript:@"ackURL"];

  v7 = [(FMDCommandHandler *)self provider];
  if (v6)
  {
    v8 = +[NSURL URLWithString:v6];
    v9 = [(FMDCommandHandler *)self ackDataForCommand];
    v10 = [v9 objectForKeyedSubscript:@"status"];
    if (v10)
    {
      v11 = [v9 objectForKeyedSubscript:@"status"];
      uint64_t v26 = (int)[v11 intValue];
    }
    else
    {
      uint64_t v26 = 200;
    }

    v12 = [(FMDCommandHandler *)self commandParams];
    uint64_t v13 = [v12 objectForKey:@"udid"];
    v14 = [v13 fm_nullToNil];

    v27 = v9;
    v28 = v4;
    if ([v14 length])
    {
      id v15 = [objc_alloc((Class)FMDAccessoryIdentifier) initWithString:v14];
      uint64_t v16 = [v7 accessoryRegistry];
      v17 = [v16 accessoryForIdentifier:v15];
    }
    else
    {
      v17 = 0;
    }
    v18 = [FMDActingRequestDecorator alloc];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10003446C;
    v32[3] = &unk_1002D9DF8;
    id v33 = v17;
    id v19 = v7;
    id v34 = v19;
    id v20 = v17;
    v21 = [(FMDActingRequestDecorator *)v18 initWithDeviceContextGenerator:&stru_1002DACE0 deviceInfoGenerator:v32 serverContextGenerator:0 requestHeaderGenerator:0];
    v22 = [FMDRequestAckNotify alloc];
    v23 = [v19 account];
    v24 = [(FMDCommandHandler *)self commandParams];
    v25 = [(FMDRequestAckNotify *)v22 initWithAccount:v23 messageCommand:v24 cmdStatusCode:v26 ackURL:v8];

    [(FMDRequest *)v25 setDecorator:v21];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100034508;
    v30[3] = &unk_1002D9180;
    id v4 = v28;
    id v31 = v28;
    [(FMDRequest *)v25 setCompletionHandler:v30];
    [v19 enqueueRequest:v25];
  }
  else
  {
    v8 = sub_100004238();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not acking the message command because there is no ack URL", buf, 2u);
    }
  }
}

@end