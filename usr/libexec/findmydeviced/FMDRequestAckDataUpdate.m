@interface FMDRequestAckDataUpdate
- (BOOL)canReplace:(id)a3;
- (FMDAccount)account;
- (FMDRequestAckDataUpdate)initWithAccount:(id)a3 dataUpdateCommand:(id)a4 ackURL:(id)a5;
- (NSDictionary)dataUpdateCommand;
- (NSURL)ackURL;
- (id)requestBody;
- (id)requestUrl;
- (void)setAccount:(id)a3;
- (void)setAckURL:(id)a3;
- (void)setDataUpdateCommand:(id)a3;
@end

@implementation FMDRequestAckDataUpdate

- (FMDRequestAckDataUpdate)initWithAccount:(id)a3 dataUpdateCommand:(id)a4 ackURL:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)FMDRequestAckDataUpdate;
  v11 = [(FMDRequest *)&v14 initWithAccount:v8];
  v12 = v11;
  if (v11)
  {
    [(FMDRequestAckDataUpdate *)v11 setAccount:v8];
    [(FMDRequestAckDataUpdate *)v12 setDataUpdateCommand:v9];
    [(FMDRequestAckDataUpdate *)v12 setAckURL:v10];
  }

  return v12;
}

- (id)requestUrl
{
  return [(FMDRequestAckDataUpdate *)self ackURL];
}

- (id)requestBody
{
  v12.receiver = self;
  v12.super_class = (Class)FMDRequestAckDataUpdate;
  v3 = [(FMDRequest *)&v12 requestBody];
  v4 = +[FMDServiceProvider activeServiceProvider];
  if (v4)
  {
    v5 = objc_alloc_init(FMDActingRequestDecorator);
    v6 = [(FMDActingRequestDecorator *)v5 standardDeviceContext];

    [v3 fm_safelyMapKey:@"deviceContext" toObject:v6];
    v7 = +[ServerDeviceInfo sharedInstance];
    id v8 = [v4 account];
    id v9 = [v7 deviceInfoForAccount:v8];
    [v3 fm_safelyMapKey:@"deviceInfo" toObject:v9];
  }
  [v3 setObject:&off_1002F20C8 forKeyedSubscript:@"statusCode"];
  id v10 = [(FMDRequestAckDataUpdate *)self dataUpdateCommand];
  [v3 setObject:v10 forKeyedSubscript:@"cmdContext"];

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
      v6 = [(FMDRequestAckDataUpdate *)self dataUpdateCommand];
      v7 = [v6 objectForKeyedSubscript:@"id"];
      id v8 = [v5 dataUpdateCommand];
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

- (NSDictionary)dataUpdateCommand
{
  return self->_dataUpdateCommand;
}

- (void)setDataUpdateCommand:(id)a3
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
  objc_storeStrong((id *)&self->_dataUpdateCommand, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end