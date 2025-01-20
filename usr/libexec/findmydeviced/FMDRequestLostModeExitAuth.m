@interface FMDRequestLostModeExitAuth
- (BOOL)canReplace:(id)a3;
- (BOOL)canRequestBeRetriedNow;
- (BOOL)showAuthFailedMessage;
- (FMDRequestLostModeExitAuth)initWithProvider:(id)a3 lostModeExitAuthToken:(id)a4;
- (FMDServiceProvider)provider;
- (NSString)lostModeExitAuthToken;
- (id)authToken;
- (id)requestBody;
- (id)requestUrl;
- (void)setLostModeExitAuthToken:(id)a3;
- (void)setProvider:(id)a3;
@end

@implementation FMDRequestLostModeExitAuth

- (FMDRequestLostModeExitAuth)initWithProvider:(id)a3 lostModeExitAuthToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 account];
  v11.receiver = self;
  v11.super_class = (Class)FMDRequestLostModeExitAuth;
  v9 = [(FMDRequest *)&v11 initWithAccount:v8];

  if (v9)
  {
    objc_storeWeak((id *)&v9->_provider, v6);
    objc_storeStrong((id *)&v9->_lostModeExitAuthToken, a4);
  }

  return v9;
}

- (id)requestUrl
{
  v3 = +[FMDSystemConfig sharedInstance];
  v4 = [v3 deviceUDID];

  v5 = objc_alloc_init(RequestTemplateURL);
  id v6 = [(FMDRequestLostModeExitAuth *)self provider];
  id v7 = [v6 account];
  v8 = [(RequestTemplateURL *)v5 urlFromTemplate:@"${scheme}://${hostname}/fmipservice/${service}/${dsid}/${udid}/authAfterLostMode" account:v7 udid:v4];

  return v8;
}

- (id)requestBody
{
  v11.receiver = self;
  v11.super_class = (Class)FMDRequestLostModeExitAuth;
  v3 = [(FMDRequest *)&v11 requestBody];
  v4 = [(FMDRequestLostModeExitAuth *)self provider];
  if (v4)
  {
    v5 = objc_alloc_init(FMDActingRequestDecorator);
    id v6 = [(FMDActingRequestDecorator *)v5 standardDeviceContext];

    [v3 fm_safelyMapKey:@"deviceContext" toObject:v6];
  }
  id v7 = +[NSMutableDictionary dictionary];
  v8 = +[FMDSystemConfig sharedInstance];
  v9 = [v8 deviceUDID];
  [v7 fm_safelyMapKey:@"udid" toObject:v9];

  [v3 setObject:v7 forKeyedSubscript:@"deviceInfo"];

  return v3;
}

- (id)authToken
{
  return [(FMDRequestLostModeExitAuth *)self lostModeExitAuthToken];
}

- (BOOL)showAuthFailedMessage
{
  return 0;
}

- (BOOL)canRequestBeRetriedNow
{
  return 0;
}

- (BOOL)canReplace:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (FMDServiceProvider)provider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);

  return (FMDServiceProvider *)WeakRetained;
}

- (void)setProvider:(id)a3
{
}

- (NSString)lostModeExitAuthToken
{
  return self->_lostModeExitAuthToken;
}

- (void)setLostModeExitAuthToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lostModeExitAuthToken, 0);

  objc_destroyWeak((id *)&self->_provider);
}

@end