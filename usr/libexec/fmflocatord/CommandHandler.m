@interface CommandHandler
- (BOOL)isPreviouslyHandledCommand;
- (CommandHandler)initWithParams:(id)a3 provider:(id)a4;
- (FindBaseServiceProvider)provider;
- (NSDictionary)ackDataForCommand;
- (NSDictionary)commandParams;
- (NSString)commandID;
- (NSString)commandName;
- (id)loggingID;
- (void)_beginXPCTransaction;
- (void)_endXPCTransaction;
- (void)dealloc;
- (void)didHandleCommandWithAckData:(id)a3;
- (void)executeCommand;
- (void)sendAckWithCompletion:(id)a3;
- (void)setCommandParams:(id)a3;
- (void)setProvider:(id)a3;
@end

@implementation CommandHandler

- (CommandHandler)initWithParams:(id)a3 provider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CommandHandler;
  v8 = [(CommandHandler *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(CommandHandler *)v8 setCommandParams:v6];
    [(CommandHandler *)v9 setProvider:v7];
  }

  return v9;
}

- (void)executeCommand
{
  v3 = sub_10001B6D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100036EE8(self, v3);
  }

  [(CommandHandler *)self _beginXPCTransaction];
  v4 = +[StartupRegisterManager sharedInstance];
  [v4 eventDidOccur:9];

  if ([(CommandHandler *)self isPreviouslyHandledCommand])
  {
    v5 = sub_10001B6D4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_100036E50(self, v5);
    }
  }
  else
  {
    [(CommandHandler *)self handleCommand];
  }
  [(CommandHandler *)self sendAckWithCompletion:&stru_1000594E0];
  [(CommandHandler *)self _endXPCTransaction];
}

- (void)dealloc
{
  [(CommandHandler *)self setProvider:0];
  v3.receiver = self;
  v3.super_class = (Class)CommandHandler;
  [(CommandHandler *)&v3 dealloc];
}

- (NSString)commandName
{
  v2 = [(CommandHandler *)self commandParams];
  objc_super v3 = [v2 objectForKeyedSubscript:@"cmd"];

  return (NSString *)v3;
}

- (NSString)commandID
{
  v2 = [(CommandHandler *)self commandParams];
  objc_super v3 = [v2 objectForKeyedSubscript:@"id"];

  return (NSString *)v3;
}

- (BOOL)isPreviouslyHandledCommand
{
  objc_super v3 = [(CommandHandler *)self commandName];
  v4 = +[NSString stringWithFormat:@"command-%@-id", v3];

  v5 = +[FMPreferencesUtil stringForKey:v4 inDomain:@"com.apple.icloud.fmflocatord"];
  if (v5)
  {
    id v6 = [(CommandHandler *)self commandID];
    unsigned __int8 v7 = [v6 isEqualToString:v5];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (NSDictionary)ackDataForCommand
{
  v2 = [(CommandHandler *)self commandName];
  objc_super v3 = +[NSString stringWithFormat:@"command-%@-ackData", v2];

  v4 = +[FMPreferencesUtil dictionaryForKey:v3 inDomain:@"com.apple.icloud.fmflocatord"];

  return (NSDictionary *)v4;
}

- (void)didHandleCommandWithAckData:(id)a3
{
  id v4 = a3;
  v5 = [(CommandHandler *)self commandName];
  id v11 = +[NSString stringWithFormat:@"command-%@-id", v5];

  id v6 = [(CommandHandler *)self commandName];
  unsigned __int8 v7 = +[NSString stringWithFormat:@"command-%@-ackData", v6];

  v8 = [(CommandHandler *)self commandID];
  +[FMPreferencesUtil setString:v8 forKey:v11 inDomain:@"com.apple.icloud.fmflocatord"];

  v9 = [(CommandHandler *)self commandID];
  if (v9) {
    id v10 = v4;
  }
  else {
    id v10 = 0;
  }
  +[FMPreferencesUtil setDictionary:v10 forKey:v7 inDomain:@"com.apple.icloud.fmflocatord"];
}

- (void)sendAckWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
  }
}

- (id)loggingID
{
  objc_super v3 = [(CommandHandler *)self commandName];
  id v4 = +[NSString stringWithFormat:@"Command-%@(0x%X)", v3, self];

  return v4;
}

- (void)_beginXPCTransaction
{
  objc_super v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v6 = +[NSString stringWithFormat:@"%@-%X", v4, self];

  v5 = +[FMXPCTransactionManager sharedInstance];
  [v5 beginTransaction:v6];
}

- (void)_endXPCTransaction
{
  objc_super v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v6 = +[NSString stringWithFormat:@"%@-%X", v4, self];

  v5 = +[FMXPCTransactionManager sharedInstance];
  [v5 endTransaction:v6];
}

- (NSDictionary)commandParams
{
  return self->_commandParams;
}

- (void)setCommandParams:(id)a3
{
}

- (FindBaseServiceProvider)provider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);

  return (FindBaseServiceProvider *)WeakRetained;
}

- (void)setProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_provider);

  objc_storeStrong((id *)&self->_commandParams, 0);
}

@end