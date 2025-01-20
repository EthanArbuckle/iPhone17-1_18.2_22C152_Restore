@interface FMDRequestAckRegister
- (BOOL)canReplace:(id)a3;
- (FMDAccount)account;
- (FMDRequestAckRegister)initWithAccount:(id)a3 registerCommand:(id)a4 ackURL:(id)a5;
- (NSDictionary)registerCommand;
- (NSURL)ackURL;
- (id)requestBody;
- (id)requestUrl;
- (void)setAccount:(id)a3;
- (void)setAckURL:(id)a3;
- (void)setRegisterCommand:(id)a3;
@end

@implementation FMDRequestAckRegister

- (FMDRequestAckRegister)initWithAccount:(id)a3 registerCommand:(id)a4 ackURL:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)FMDRequestAckRegister;
  v11 = [(FMDRequest *)&v14 initWithAccount:v8];
  v12 = v11;
  if (v11)
  {
    [(FMDRequestAckRegister *)v11 setAccount:v8];
    [(FMDRequestAckRegister *)v12 setRegisterCommand:v9];
    [(FMDRequestAckRegister *)v12 setAckURL:v10];
  }

  return v12;
}

- (id)requestUrl
{
  return [(FMDRequestAckRegister *)self ackURL];
}

- (id)requestBody
{
  v6.receiver = self;
  v6.super_class = (Class)FMDRequestAckRegister;
  v3 = [(FMDRequest *)&v6 requestBody];
  [v3 setObject:&off_1002F1E58 forKeyedSubscript:@"statusCode"];
  v4 = [(FMDRequestAckRegister *)self registerCommand];
  [v3 setObject:v4 forKeyedSubscript:@"cmdContext"];

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
      objc_super v6 = [(FMDRequestAckRegister *)self registerCommand];
      v7 = [v6 objectForKeyedSubscript:@"id"];
      id v8 = [v5 registerCommand];
      id v9 = [v8 objectForKeyedSubscript:@"id"];
      unsigned __int8 v10 = [v7 isEqualToString:v9];
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (FMDAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
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

  objc_storeStrong((id *)&self->_account, 0);
}

@end