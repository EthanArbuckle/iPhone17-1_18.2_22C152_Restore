@interface SWLogMessageHandler
- (SWLogMessageHandler)initWithLogger:(id)a3;
- (SWLogger)logger;
- (void)didReceiveMessage:(id)a3 securityOrigin:(id)a4;
@end

@implementation SWLogMessageHandler

- (SWLogMessageHandler)initWithLogger:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SWLogMessageHandler;
  v6 = [(SWLogMessageHandler *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_logger, a3);
  }

  return v7;
}

- (void)didReceiveMessage:(id)a3 securityOrigin:(id)a4
{
  id v5 = [a3 body];
  v10 = [v5 objectForKey:@"message"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = &stru_26D81E068;
    if (v10) {
      v6 = v10;
    }
    v7 = v6;
    v8 = [(SWLogMessageHandler *)self logger];
    objc_super v9 = [NSString stringWithFormat:@"Logging message for WebContent embed: %@", v7];

    [v8 log:v9];
  }
}

- (SWLogger)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
}

@end