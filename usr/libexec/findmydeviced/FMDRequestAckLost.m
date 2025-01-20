@interface FMDRequestAckLost
- (BOOL)canReplace:(id)a3;
- (BOOL)locationServicesStateChanged;
- (FMDRequestAckLost)initWithProvider:(id)a3 lostCommand:(id)a4 cmdStatusCode:(int64_t)a5 locationServicesStateChanged:(BOOL)a6 ackURL:(id)a7;
- (FMDServiceProvider)provider;
- (NSDictionary)lostCommand;
- (NSURL)ackURL;
- (id)requestBody;
- (id)requestUrl;
- (int64_t)cmdStatusCode;
- (void)setAckURL:(id)a3;
- (void)setCmdStatusCode:(int64_t)a3;
- (void)setLocationServicesStateChanged:(BOOL)a3;
- (void)setLostCommand:(id)a3;
- (void)setProvider:(id)a3;
@end

@implementation FMDRequestAckLost

- (FMDRequestAckLost)initWithProvider:(id)a3 lostCommand:(id)a4 cmdStatusCode:(int64_t)a5 locationServicesStateChanged:(BOOL)a6 ackURL:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  v15 = [v12 account];
  v18.receiver = self;
  v18.super_class = (Class)FMDRequestAckLost;
  v16 = [(FMDRequest *)&v18 initWithAccount:v15];

  if (v16)
  {
    [(FMDRequestAckLost *)v16 setProvider:v12];
    [(FMDRequestAckLost *)v16 setLostCommand:v13];
    [(FMDRequestAckLost *)v16 setAckURL:v14];
    [(FMDRequestAckLost *)v16 setCmdStatusCode:a5];
    [(FMDRequestAckLost *)v16 setLocationServicesStateChanged:v8];
  }

  return v16;
}

- (id)requestUrl
{
  return [(FMDRequestAckLost *)self ackURL];
}

- (id)requestBody
{
  v19.receiver = self;
  v19.super_class = (Class)FMDRequestAckLost;
  v3 = [(FMDRequest *)&v19 requestBody];
  v4 = [(FMDRequestAckLost *)self provider];
  if (v4)
  {
    v5 = objc_alloc_init(FMDActingRequestDecorator);
    v6 = [(FMDActingRequestDecorator *)v5 standardDeviceContext];

    [v3 fm_safelyMapKey:@"deviceContext" toObject:v6];
    v7 = +[ServerDeviceInfo sharedInstance];
    BOOL v8 = [v4 account];
    v9 = [v7 deviceInfoForAccount:v8];
    [v3 fm_safelyMapKey:@"deviceInfo" toObject:v9];
  }
  v10 = +[NSNumber numberWithInteger:[(FMDRequestAckLost *)self cmdStatusCode]];
  [v3 setObject:v10 forKeyedSubscript:@"statusCode"];

  if ([(FMDRequestAckLost *)self locationServicesStateChanged])
  {
    v11 = +[NSNumber numberWithBool:[(FMDRequestAckLost *)self locationServicesStateChanged]];
    [v3 setObject:v11 forKeyedSubscript:@"locationsServicesChanged"];
  }
  int64_t v12 = [(FMDRequestAckLost *)self cmdStatusCode];
  if (v12 == qword_10031CB48)
  {
    id v13 = +[MCProfileConnection sharedConnection];
    id v14 = [v13 localizedDescriptionOfCurrentPasscodeConstraints];
    [v3 setObject:v14 forKeyedSubscript:@"errorMsg"];

    v15 = +[FMDSystemConfig sharedInstance];
    v16 = [v15 currentPasscodeConstraintStr];
    [v3 setObject:v16 forKeyedSubscript:@"passcodeConstraint"];
  }
  v17 = [(FMDRequestAckLost *)self lostCommand];
  [v3 setObject:v17 forKeyedSubscript:@"cmdContext"];

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
      v6 = [(FMDRequestAckLost *)self lostCommand];
      v7 = [v6 objectForKeyedSubscript:@"id"];
      BOOL v8 = [v5 lostCommand];
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

- (FMDServiceProvider)provider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);

  return (FMDServiceProvider *)WeakRetained;
}

- (void)setProvider:(id)a3
{
}

- (NSDictionary)lostCommand
{
  return self->_lostCommand;
}

- (void)setLostCommand:(id)a3
{
}

- (NSURL)ackURL
{
  return self->_ackURL;
}

- (void)setAckURL:(id)a3
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

- (BOOL)locationServicesStateChanged
{
  return self->_locationServicesStateChanged;
}

- (void)setLocationServicesStateChanged:(BOOL)a3
{
  self->_locationServicesStateChanged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ackURL, 0);
  objc_storeStrong((id *)&self->_lostCommand, 0);

  objc_destroyWeak((id *)&self->_provider);
}

@end