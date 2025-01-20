@interface FMDCommandHandler
- (BOOL)isPreviouslyHandledCommand;
- (BOOL)requiresAsynchronousAck;
- (FMDCommandContext)commandContext;
- (FMDCommandHandler)initWithParams:(id)a3 provider:(id)a4;
- (FMDServiceProvider)provider;
- (NSDictionary)ackDataForCommand;
- (NSDictionary)commandParams;
- (NSString)commandID;
- (NSString)commandName;
- (id)fm_logID;
- (void)dealloc;
- (void)didHandleCommandWithAckData:(id)a3;
- (void)executeCommand;
- (void)sendAckWithCompletion:(id)a3;
- (void)setAckDataForCommand:(id)a3;
- (void)setCommandContext:(id)a3;
- (void)setCommandParams:(id)a3;
- (void)setProvider:(id)a3;
- (void)setRequiresAsynchronousAck:(BOOL)a3;
@end

@implementation FMDCommandHandler

- (FMDCommandHandler)initWithParams:(id)a3 provider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FMDCommandHandler;
  v8 = [(FMDCommandHandler *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(FMDCommandHandler *)v8 setCommandParams:v6];
    [(FMDCommandHandler *)v9 setProvider:v7];
    [(FMDCommandHandler *)v9 setRequiresAsynchronousAck:0];
  }

  return v9;
}

- (void)executeCommand
{
  v3 = sub_100004238();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10023D790(self, v3);
  }

  v4 = +[FMDStartupRegisterManager sharedInstance];
  [v4 eventDidOccur:9];

  if ([(FMDCommandHandler *)self isPreviouslyHandledCommand])
  {
    v5 = sub_100004238();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(FMDCommandHandler *)self fm_logID];
      *(_DWORD *)buf = 138412290;
      v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ already seen before. Ignoring this & sending the same ack as last time...", buf, 0xCu);
    }
    [(FMDCommandHandler *)self requiresAsynchronousAck];
  }
  else
  {
    [(FMDCommandHandler *)self handleCommand];
    if ([(FMDCommandHandler *)self requiresAsynchronousAck]) {
      return;
    }
  }
  id v7 = [(FMDCommandHandler *)self provider];
  v8 = [(FMDCommandHandler *)self commandID];
  v9 = [v7 futureForCommandId:v8];

  if (v9)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10003C534;
    v11[3] = &unk_1002D96C0;
    v11[4] = self;
    id v10 = [v9 addCompletionBlock:v11];
  }
  else
  {
    [(FMDCommandHandler *)self sendAckWithCompletion:&stru_1002DAD80];
  }
}

- (void)dealloc
{
  [(FMDCommandHandler *)self setProvider:0];
  v3.receiver = self;
  v3.super_class = (Class)FMDCommandHandler;
  [(FMDCommandHandler *)&v3 dealloc];
}

- (NSString)commandName
{
  v2 = [(FMDCommandHandler *)self commandParams];
  objc_super v3 = [v2 objectForKeyedSubscript:@"cmd"];

  return (NSString *)v3;
}

- (NSString)commandID
{
  v2 = [(FMDCommandHandler *)self commandParams];
  objc_super v3 = [v2 objectForKeyedSubscript:@"id"];

  return (NSString *)v3;
}

- (BOOL)isPreviouslyHandledCommand
{
  objc_super v3 = [(FMDCommandHandler *)self commandName];
  v4 = +[NSString stringWithFormat:@"command-%@-id", v3];

  v5 = +[FMPreferencesUtil stringForKey:v4 inDomain:kFMDPrefDomain];
  if (v5
    && ([(FMDCommandHandler *)self commandID],
        id v6 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v7 = [v6 isEqualToString:v5],
        v6,
        (v7 & 1) != 0))
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    v9 = [(FMDCommandHandler *)self commandContext];
    id v10 = [v9 lastCompletedIntentDictionary];
    objc_super v11 = [v10 objectForKeyedSubscript:@"id"];

    if (v11)
    {
      v12 = [(FMDCommandHandler *)self commandID];
      unsigned __int8 v8 = [v12 isEqualToString:v11];
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }
  return v8;
}

- (NSDictionary)ackDataForCommand
{
  objc_super v3 = self->_ackDataForCommand;
  if (!v3)
  {
    v4 = [(FMDCommandHandler *)self commandContext];

    if (v4)
    {
      objc_super v3 = (NSDictionary *)&off_1002F3240;
    }
    else
    {
      v5 = [(FMDCommandHandler *)self commandName];
      id v6 = +[NSString stringWithFormat:@"command-%@-ackData", v5];

      objc_super v3 = +[FMPreferencesUtil dictionaryForKey:v6 inDomain:kFMDPrefDomain];
    }
  }

  return v3;
}

- (void)didHandleCommandWithAckData:(id)a3
{
  id v12 = a3;
  v4 = [(FMDCommandHandler *)self commandContext];

  if (!v4)
  {
    v5 = [(FMDCommandHandler *)self commandName];
    id v6 = +[NSString stringWithFormat:@"command-%@-id", v5];

    unsigned __int8 v7 = [(FMDCommandHandler *)self commandName];
    unsigned __int8 v8 = +[NSString stringWithFormat:@"command-%@-ackData", v7];

    v9 = [(FMDCommandHandler *)self commandID];
    +[FMPreferencesUtil setString:v9 forKey:v6 inDomain:kFMDPrefDomain];

    id v10 = [(FMDCommandHandler *)self commandID];
    if (v10) {
      id v11 = v12;
    }
    else {
      id v11 = 0;
    }
    +[FMPreferencesUtil setDictionary:v11 forKey:v8 inDomain:kFMDPrefDomain];
  }
  [(FMDCommandHandler *)self setAckDataForCommand:v12];
  if ([(FMDCommandHandler *)self requiresAsynchronousAck]) {
    [(FMDCommandHandler *)self sendAckWithCompletion:&stru_1002DADA0];
  }
}

- (void)sendAckWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
  }
}

- (id)fm_logID
{
  objc_super v3 = [(FMDCommandHandler *)self commandName];
  v4 = +[NSString stringWithFormat:@"Command-%@(0x%p)", v3, self];

  return v4;
}

- (NSDictionary)commandParams
{
  return self->_commandParams;
}

- (void)setCommandParams:(id)a3
{
}

- (FMDCommandContext)commandContext
{
  return self->_commandContext;
}

- (void)setCommandContext:(id)a3
{
}

- (FMDServiceProvider)provider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);

  return (FMDServiceProvider *)WeakRetained;
}

- (void)setProvider:(id)a3
{
}

- (void)setAckDataForCommand:(id)a3
{
}

- (BOOL)requiresAsynchronousAck
{
  return self->_requiresAsynchronousAck;
}

- (void)setRequiresAsynchronousAck:(BOOL)a3
{
  self->_requiresAsynchronousAck = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ackDataForCommand, 0);
  objc_destroyWeak((id *)&self->_provider);
  objc_storeStrong((id *)&self->_commandContext, 0);

  objc_storeStrong((id *)&self->_commandParams, 0);
}

@end