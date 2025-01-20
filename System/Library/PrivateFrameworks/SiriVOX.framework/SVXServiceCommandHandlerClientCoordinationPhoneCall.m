@interface SVXServiceCommandHandlerClientCoordinationPhoneCall
+ (Class)supportedCommandClass;
- (BOOL)isCommandUUFR:(id)a3;
- (NSString)identifier;
- (SVXServiceCommandHandlerClientCoordinationPhoneCall)initWithSessionManager:(id)a3;
- (void)handleCommand:(id)a3 withContext:(id)a4 taskTracker:(id)a5 completion:(id)a6;
@end

@implementation SVXServiceCommandHandlerClientCoordinationPhoneCall

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_sessionManager, 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)handleCommand:(id)a3 withContext:(id)a4 taskTracker:(id)a5 completion:(id)a6
{
  id v12 = a3;
  v9 = (void (**)(id, void *))a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SVXServiceCommandHandlerClientCoordinationPhoneCall.m", 46, @"Invalid parameter not satisfying: %@", @"[command isKindOfClass:[SAPhoneClientCoordinationPhoneCall class]]" object file lineNumber description];
  }
  if ([v12 emergencyCall])
  {
    if (objc_opt_respondsToSelector()) {
      [(SVXSessionManager *)self->_sessionManager initiateEmergency:v9];
    }
  }
  else if (v9)
  {
    v10 = +[SVXServiceCommandResult resultFailureWithErrorCode:-1 reason:@"unsupported type"];
    v9[2](v9, v10);
  }
}

- (BOOL)isCommandUUFR:(id)a3
{
  return 0;
}

- (SVXServiceCommandHandlerClientCoordinationPhoneCall)initWithSessionManager:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SVXServiceCommandHandlerClientCoordinationPhoneCall;
  v6 = [(SVXServiceCommandHandlerClientCoordinationPhoneCall *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sessionManager, a3);
    id v8 = [NSString alloc];
    v9 = (objc_class *)[(id)objc_opt_class() supportedCommandClass];
    v10 = NSStringFromClass(v9);
    uint64_t v11 = [v8 initWithFormat:@"com.apple.SiriVOXService.service-command.%@", v10];
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v11;
  }
  return v7;
}

+ (Class)supportedCommandClass
{
  return (Class)objc_opt_class();
}

@end