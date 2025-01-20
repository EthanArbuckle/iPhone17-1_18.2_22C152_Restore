@interface FMDCommandHandlerRemoteLock
- (void)handleCommand;
- (void)sendAckWithCompletion:(id)a3;
@end

@implementation FMDCommandHandlerRemoteLock

- (void)handleCommand
{
  v3 = [(FMDCommandHandler *)self provider];
  uint64_t v8 = qword_10031EE88;
  v4 = [(FMDCommandHandler *)self commandParams];
  v5 = [v4 objectForKeyedSubscript:@"newPasscode"];

  [v3 setPasscodeLock:v5 statusCode:&v8];
  v6 = +[NSMutableDictionary dictionary];
  v7 = +[NSNumber numberWithInteger:v8];
  [v6 setObject:v7 forKeyedSubscript:@"status"];

  [(FMDCommandHandler *)self didHandleCommandWithAckData:v6];
}

- (void)sendAckWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(FMDCommandHandler *)self commandParams];
  v6 = [v5 objectForKeyedSubscript:@"ackURL"];

  v7 = [(FMDCommandHandler *)self provider];
  uint64_t v8 = [(FMDCommandHandler *)self ackDataForCommand];
  v9 = [v8 objectForKeyedSubscript:@"status"];
  signed int v10 = [v9 intValue];

  if (v6)
  {
    uint64_t v11 = v10;
    v12 = +[NSURL URLWithString:v6];
    v13 = [FMDRequestAckLock alloc];
    v14 = [(FMDCommandHandler *)self commandParams];
    v15 = [(FMDRequestAckLock *)v13 initWithProvider:v7 lockCommand:v14 cmdStatusCode:v11 ackURL:v12];

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100023DD8;
    v17[3] = &unk_1002D9180;
    id v18 = v4;
    [(FMDRequest *)v15 setCompletionHandler:v17];
    [v7 enqueueRequest:v15];
  }
  else
  {
    v12 = sub_100004238();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Not acking the lock command because there is no ack URL", v16, 2u);
    }
  }
}

@end