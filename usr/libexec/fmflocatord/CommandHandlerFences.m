@interface CommandHandlerFences
- (void)handleCommand;
- (void)sendAckWithCompletion:(id)a3;
@end

@implementation CommandHandlerFences

- (void)handleCommand
{
  v3 = [(CommandHandler *)self commandParams];
  v4 = [v3 objectForKeyedSubscript:@"fences"];

  v5 = [v4 fm_map:&stru_100059C18];
  v6 = sub_10001B6D4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100037F78((uint64_t)v5, v6);
  }

  v7 = [(CommandHandler *)self commandParams];
  v8 = [v7 objectForKeyedSubscript:@"fenceVersion"];

  v9 = [(CommandHandler *)self commandParams];
  v10 = [v9 objectForKeyedSubscript:@"triggerurl"];

  v11 = [(CommandHandler *)self commandParams];
  v12 = [v11 objectForKeyedSubscript:@"validityDurationInSecs"];

  if (v12) {
    [v12 doubleValue];
  }
  else {
    uint64_t v13 = 0x40BC200000000000;
  }
  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  v19 = sub_100019684;
  v20 = &unk_100059C40;
  id v21 = v5;
  id v22 = v8;
  uint64_t v24 = v13;
  id v23 = v10;
  id v14 = v10;
  id v15 = v8;
  id v16 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v17);
  -[CommandHandler didHandleCommandWithAckData:](self, "didHandleCommandWithAckData:", 0, v17, v18, v19, v20);
}

- (void)sendAckWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(CommandHandler *)self provider];
  v5 = [(CommandHandler *)self commandParams];
  [v6 ackFencesCommand:v5 withCompletion:v4];
}

@end