@interface CommandHandlerRegistration
- (void)_beginXPCTransaction;
- (void)_endXPCTransaction;
- (void)handleCommand;
- (void)sendAckWithCompletion:(id)a3;
@end

@implementation CommandHandlerRegistration

- (void)handleCommand
{
  [(CommandHandlerRegistration *)self _beginXPCTransaction];
  dispatch_time_t v3 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F9A8;
  block[3] = &unk_100059350;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
  [(CommandHandler *)self didHandleCommandWithAckData:0];
}

- (void)sendAckWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(CommandHandler *)self provider];
  v5 = [(CommandHandler *)self commandParams];
  [v6 ackRegisterCommand:v5 withCompletion:v4];
}

- (void)_beginXPCTransaction
{
  dispatch_time_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v6 = +[NSString stringWithFormat:@"%@-%X", v4, self];

  v5 = +[FMXPCTransactionManager sharedInstance];
  [v5 beginTransaction:v6];
}

- (void)_endXPCTransaction
{
  dispatch_time_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v6 = +[NSString stringWithFormat:@"%@-%X", v4, self];

  v5 = +[FMXPCTransactionManager sharedInstance];
  [v5 endTransaction:v6];
}

@end