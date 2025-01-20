@interface FMDCommandHandlerIdentityV5
- (void)handleCommand;
- (void)sendAckWithCompletion:(id)a3;
@end

@implementation FMDCommandHandlerIdentityV5

- (void)handleCommand
{
  v3 = +[FMXPCTransactionManager sharedInstance];
  [v3 beginTransaction:@"kFMDCommandHandlerIdentityV5TransactionName"];

  v4 = +[FMDStartupRegisterManager sharedInstance];
  [v4 eventDidOccur:11];

  v5 = [(FMDCommandHandler *)self commandParams];
  v6 = [v5 objectForKeyedSubscript:@"timeoutInSec"];
  if (v6)
  {
    v7 = [(FMDCommandHandler *)self commandParams];
    v8 = [v7 objectForKeyedSubscript:@"timeoutInSec"];
    uint64_t v9 = (uint64_t)[v8 integerValue];
  }
  else
  {
    uint64_t v9 = 60;
  }

  v10 = [(FMDCommandHandler *)self commandParams];
  v11 = [v10 objectForKeyedSubscript:@"id"];

  v12 = [[FMDIdentityInfo alloc] initWithVersion:5 timeoutIntervalInSec:v9 commandID:v11];
  dispatch_time_t v13 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005A44C;
  block[3] = &unk_1002D93F0;
  block[4] = self;
  v18 = v12;
  v14 = v12;
  dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, block);
  v15 = sub_100004238();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Scheduled identityV5", v16, 2u);
  }

  [(FMDCommandHandler *)self didHandleCommandWithAckData:0];
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
    uint64_t v9 = [FMDRequestAckIdentity alloc];
    v10 = [(FMDCommandHandler *)self commandParams];
    v11 = [(FMDRequestAckIdentity *)v9 initWithProvider:v7 identityCommand:v10 commandFailureReason:0 ackURL:v8];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10005A65C;
    v13[3] = &unk_1002D9180;
    id v14 = v4;
    [(FMDRequest *)v11 setCompletionHandler:v13];
    [v7 enqueueRequest:v11];
  }
  else
  {
    v8 = sub_100004238();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not acking the identity command because there is no ack URL", v12, 2u);
    }
  }
}

@end