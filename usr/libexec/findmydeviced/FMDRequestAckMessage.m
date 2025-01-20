@interface FMDRequestAckMessage
- (BOOL)canReplace:(id)a3;
- (FMDAccount)account;
- (FMDRequestAckMessage)initWithAccount:(id)a3 messageCommand:(id)a4 cmdStatusCode:(int64_t)a5 ackURL:(id)a6;
- (NSDictionary)messageCommand;
- (NSError)timeoutError;
- (NSString)safetyAlertType;
- (NSURL)ackURL;
- (id)requestBody;
- (id)requestHeaders;
- (id)requestUrl;
- (int64_t)cmdStatusCode;
- (void)setAccount:(id)a3;
- (void)setAckURL:(id)a3;
- (void)setCmdStatusCode:(int64_t)a3;
- (void)setMessageCommand:(id)a3;
- (void)setSafetyAlertType:(id)a3;
- (void)setTimeoutError:(id)a3;
@end

@implementation FMDRequestAckMessage

- (FMDRequestAckMessage)initWithAccount:(id)a3 messageCommand:(id)a4 cmdStatusCode:(int64_t)a5 ackURL:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)FMDRequestAckMessage;
  v13 = [(FMDRequest *)&v16 initWithAccount:v10];
  v14 = v13;
  if (v13)
  {
    [(FMDRequestAckMessage *)v13 setAccount:v10];
    [(FMDRequestAckMessage *)v14 setMessageCommand:v11];
    [(FMDRequestAckMessage *)v14 setCmdStatusCode:a5];
    [(FMDRequestAckMessage *)v14 setAckURL:v12];
  }

  return v14;
}

- (id)requestUrl
{
  return [(FMDRequestAckMessage *)self ackURL];
}

- (id)requestHeaders
{
  v7.receiver = self;
  v7.super_class = (Class)FMDRequestAckMessage;
  v3 = [(FMDRequest *)&v7 requestHeaders];
  v4 = +[FMSystemInfo sharedInstance];
  if ([v4 isInternalBuild])
  {
    v5 = [(FMDRequestAckMessage *)self timeoutError];

    if (v5) {
      [v3 setObject:@"Timeout Error" forKeyedSubscript:@"X-Apple-Timeout-Error"];
    }
  }
  else
  {
  }

  return v3;
}

- (id)requestBody
{
  v8.receiver = self;
  v8.super_class = (Class)FMDRequestAckMessage;
  v3 = [(FMDRequest *)&v8 requestBody];
  v4 = +[NSNumber numberWithInteger:[(FMDRequestAckMessage *)self cmdStatusCode]];
  [v3 setObject:v4 forKeyedSubscript:@"statusCode"];

  v5 = [(FMDRequestAckMessage *)self messageCommand];
  [v3 setObject:v5 forKeyedSubscript:@"cmdContext"];

  v6 = [(FMDRequestAckMessage *)self safetyAlertType];
  [v3 setObject:v6 forKeyedSubscript:@"safetyAlertType"];

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
      v6 = [(FMDRequestAckMessage *)self messageCommand];
      objc_super v7 = [v6 objectForKeyedSubscript:@"id"];
      objc_super v8 = [v5 messageCommand];
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

- (NSError)timeoutError
{
  return self->_timeoutError;
}

- (void)setTimeoutError:(id)a3
{
}

- (NSString)safetyAlertType
{
  return self->_safetyAlertType;
}

- (void)setSafetyAlertType:(id)a3
{
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
  objc_storeStrong((id *)&self->_safetyAlertType, 0);

  objc_storeStrong((id *)&self->_timeoutError, 0);
}

@end