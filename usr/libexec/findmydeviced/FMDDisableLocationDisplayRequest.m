@interface FMDDisableLocationDisplayRequest
- (BOOL)canReplace:(id)a3;
- (BOOL)canRequestBeRetriedNow;
- (FMDAccount)account;
- (FMDDisableLocationDisplayRequest)initWithAccount:(id)a3;
- (id)requestBody;
- (id)requestHeaders;
- (id)requestUrl;
- (unint64_t)type;
- (void)setAccount:(id)a3;
@end

@implementation FMDDisableLocationDisplayRequest

- (FMDDisableLocationDisplayRequest)initWithAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FMDDisableLocationDisplayRequest;
  v6 = [(FMDRequest *)&v9 initWithAccount:v5];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_account, a3);
  }

  return v7;
}

- (id)requestHeaders
{
  v4.receiver = self;
  v4.super_class = (Class)FMDDisableLocationDisplayRequest;
  v2 = [(FMDRequest *)&v4 requestHeaders];

  return v2;
}

- (id)requestUrl
{
  v3 = +[FMDSystemConfig sharedInstance];
  objc_super v4 = [v3 deviceUDID];

  id v5 = objc_alloc_init(RequestTemplateURL);
  v6 = [(FMDDisableLocationDisplayRequest *)self account];
  v7 = [(RequestTemplateURL *)v5 urlFromTemplate:@"${scheme}://${hostname}/fmipservice/${service}/disableLocations" account:v6 udid:v4];

  return v7;
}

- (id)requestBody
{
  v4.receiver = self;
  v4.super_class = (Class)FMDDisableLocationDisplayRequest;
  v2 = [(FMDRequest *)&v4 requestBody];

  return v2;
}

- (unint64_t)type
{
  return 1;
}

- (BOOL)canReplace:(id)a3
{
  return 0;
}

- (BOOL)canRequestBeRetriedNow
{
  return 0;
}

- (FMDAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (void).cxx_destruct
{
}

@end