@interface FMDRequestAckNotify
- (BOOL)canReplace:(id)a3;
- (FMDAccount)account;
- (FMDRequestAckNotify)initWithAccount:(id)a3 messageCommand:(id)a4 cmdStatusCode:(int64_t)a5 ackURL:(id)a6;
- (NSDictionary)messageCommand;
- (NSURL)ackURL;
- (id)requestBody;
- (id)requestUrl;
- (int64_t)cmdStatusCode;
- (void)setAccount:(id)a3;
- (void)setAckURL:(id)a3;
- (void)setCmdStatusCode:(int64_t)a3;
- (void)setMessageCommand:(id)a3;
@end

@implementation FMDRequestAckNotify

- (FMDRequestAckNotify)initWithAccount:(id)a3 messageCommand:(id)a4 cmdStatusCode:(int64_t)a5 ackURL:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)FMDRequestAckNotify;
  v13 = [(FMDRequest *)&v16 initWithAccount:v10];
  v14 = v13;
  if (v13)
  {
    [(FMDRequestAckNotify *)v13 setAccount:v10];
    [(FMDRequestAckNotify *)v14 setMessageCommand:v11];
    [(FMDRequestAckNotify *)v14 setCmdStatusCode:a5];
    [(FMDRequestAckNotify *)v14 setAckURL:v12];
  }

  return v14;
}

- (id)requestUrl
{
  return [(FMDRequestAckNotify *)self ackURL];
}

- (id)requestBody
{
  v7.receiver = self;
  v7.super_class = (Class)FMDRequestAckNotify;
  v3 = [(FMDRequest *)&v7 requestBody];
  v4 = +[NSNumber numberWithInteger:[(FMDRequestAckNotify *)self cmdStatusCode]];
  [v3 setObject:v4 forKeyedSubscript:@"statusCode"];

  v5 = [(FMDRequestAckNotify *)self messageCommand];
  [v3 setObject:v5 forKeyedSubscript:@"cmdContext"];

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
      v6 = [(FMDRequestAckNotify *)self messageCommand];
      objc_super v7 = [v6 objectForKeyedSubscript:@"id"];
      v8 = [v5 messageCommand];
      v9 = [v8 objectForKeyedSubscript:@"id"];
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

- (NSDictionary)messageCommand
{
  return self->_messageCommand;
}

- (void)setMessageCommand:(id)a3
{
}

- (int64_t)cmdStatusCode
{
  return self->_cmdStatusCode;
}

- (void)setCmdStatusCode:(int64_t)a3
{
  self->_cmdStatusCode = a3;
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
  objc_storeStrong((id *)&self->_messageCommand, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end