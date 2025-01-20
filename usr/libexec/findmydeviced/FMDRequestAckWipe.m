@interface FMDRequestAckWipe
- (BOOL)canReplace:(id)a3;
- (FMDRequestAckWipe)initWithProvider:(id)a3 wipeCommand:(id)a4 cmdStatusCode:(int64_t)a5 ackURL:(id)a6;
- (FMDServiceProvider)provider;
- (NSDictionary)wipeCommand;
- (NSURL)ackURL;
- (id)requestBody;
- (id)requestUrl;
- (int64_t)cmdStatusCode;
- (void)setAckURL:(id)a3;
- (void)setCmdStatusCode:(int64_t)a3;
- (void)setProvider:(id)a3;
- (void)setWipeCommand:(id)a3;
@end

@implementation FMDRequestAckWipe

- (FMDRequestAckWipe)initWithProvider:(id)a3 wipeCommand:(id)a4 cmdStatusCode:(int64_t)a5 ackURL:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [v10 account];
  v16.receiver = self;
  v16.super_class = (Class)FMDRequestAckWipe;
  v14 = [(FMDRequest *)&v16 initWithAccount:v13];

  if (v14)
  {
    [(FMDRequestAckWipe *)v14 setProvider:v10];
    [(FMDRequestAckWipe *)v14 setWipeCommand:v11];
    [(FMDRequestAckWipe *)v14 setAckURL:v12];
    [(FMDRequestAckWipe *)v14 setCmdStatusCode:a5];
  }

  return v14;
}

- (id)requestUrl
{
  return [(FMDRequestAckWipe *)self ackURL];
}

- (id)requestBody
{
  v13.receiver = self;
  v13.super_class = (Class)FMDRequestAckWipe;
  v3 = [(FMDRequest *)&v13 requestBody];
  v4 = [(FMDRequestAckWipe *)self provider];
  if (v4)
  {
    v5 = objc_alloc_init(FMDActingRequestDecorator);
    v6 = [(FMDActingRequestDecorator *)v5 standardDeviceContext];

    [v3 fm_safelyMapKey:@"deviceContext" toObject:v6];
    v7 = +[ServerDeviceInfo sharedInstance];
    v8 = [v4 account];
    v9 = [v7 deviceInfoForAccount:v8];
    [v3 fm_safelyMapKey:@"deviceInfo" toObject:v9];
  }
  id v10 = +[NSNumber numberWithInteger:[(FMDRequestAckWipe *)self cmdStatusCode]];
  [v3 setObject:v10 forKeyedSubscript:@"statusCode"];

  id v11 = [(FMDRequestAckWipe *)self wipeCommand];
  [v3 setObject:v11 forKeyedSubscript:@"cmdContext"];

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
      v6 = [(FMDRequestAckWipe *)self wipeCommand];
      v7 = [v6 objectForKeyedSubscript:@"id"];
      v8 = [v5 wipeCommand];
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

- (int64_t)cmdStatusCode
{
  return self->_cmdStatusCode;
}

- (void)setCmdStatusCode:(int64_t)a3
{
  self->_cmdStatusCode = a3;
}

- (FMDServiceProvider)provider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);

  return (FMDServiceProvider *)WeakRetained;
}

- (void)setProvider:(id)a3
{
}

- (NSDictionary)wipeCommand
{
  return self->_wipeCommand;
}

- (void)setWipeCommand:(id)a3
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
  objc_storeStrong((id *)&self->_wipeCommand, 0);

  objc_destroyWeak((id *)&self->_provider);
}

@end