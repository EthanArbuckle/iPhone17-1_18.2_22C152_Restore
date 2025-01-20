@interface FMRequestAckRegister
- (BOOL)canReplace:(id)a3;
- (FMRequestAckRegister)initWithProvider:(id)a3 registerCommand:(id)a4 ackURL:(id)a5;
- (NSDictionary)registerCommand;
- (NSURL)ackURL;
- (id)requestBody;
- (id)requestUrl;
- (void)deinitializeRequest;
- (void)setAckURL:(id)a3;
- (void)setRegisterCommand:(id)a3;
@end

@implementation FMRequestAckRegister

- (void)deinitializeRequest
{
  v3.receiver = self;
  v3.super_class = (Class)FMRequestAckRegister;
  [(FMRequest *)&v3 deinitializeRequest];
  [(FMRequestAckRegister *)self setRegisterCommand:0];
  [(FMRequestAckRegister *)self setAckURL:0];
}

- (FMRequestAckRegister)initWithProvider:(id)a3 registerCommand:(id)a4 ackURL:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)FMRequestAckRegister;
  v10 = [(FMRequest *)&v13 initWithProvider:a3];
  v11 = v10;
  if (v10)
  {
    [(FMRequestAckRegister *)v10 setRegisterCommand:v8];
    [(FMRequestAckRegister *)v11 setAckURL:v9];
  }

  return v11;
}

- (id)requestUrl
{
  return [(FMRequestAckRegister *)self ackURL];
}

- (id)requestBody
{
  v10.receiver = self;
  v10.super_class = (Class)FMRequestAckRegister;
  objc_super v3 = [(FMRequest *)&v10 requestBody];
  v4 = [(FMRequest *)self provider];
  v5 = [v4 standardDeviceContext];
  [v3 setObject:v5 forKeyedSubscript:@"deviceContext"];

  v6 = [(FMRequest *)self provider];
  v7 = [v6 fullDeviceInfo];
  [v3 setObject:v7 forKeyedSubscript:@"deviceInfo"];

  [v3 setObject:&off_10005EF48 forKeyedSubscript:@"statusCode"];
  id v8 = [(FMRequestAckRegister *)self registerCommand];
  [v3 setObject:v8 forKeyedSubscript:@"cmdContext"];

  return v3;
}

- (BOOL)canReplace:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [(FMRequest *)self delegate];
      v7 = [v5 delegate];
      if (v6 == v7)
      {
        id v9 = [(FMRequestAckRegister *)self registerCommand];
        objc_super v10 = [v9 objectForKeyedSubscript:@"id"];
        v11 = [v5 registerCommand];
        v12 = [v11 objectForKeyedSubscript:@"id"];
        unsigned __int8 v8 = [v10 isEqualToString:v12];
      }
      else
      {
        unsigned __int8 v8 = 0;
      }
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (NSDictionary)registerCommand
{
  return self->_registerCommand;
}

- (void)setRegisterCommand:(id)a3
{
}

- (NSURL)ackURL
{
  return self->_ackURL;
}

- (void)setAckURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ackURL, 0);

  objc_storeStrong((id *)&self->_registerCommand, 0);
}

@end