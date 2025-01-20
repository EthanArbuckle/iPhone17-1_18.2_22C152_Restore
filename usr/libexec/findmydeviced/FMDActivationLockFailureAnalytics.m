@interface FMDActivationLockFailureAnalytics
- (BOOL)canRequestBeRetriedNow;
- (FMDAccount)account;
- (FMDActivationLockFailureAnalytics)initWithAccountAndError:(id)a3 error:(id)a4;
- (NSError)error;
- (id)requestBody;
- (id)requestHeaders;
- (id)requestUrl;
- (unint64_t)type;
- (void)setAccount:(id)a3;
- (void)setError:(id)a3;
@end

@implementation FMDActivationLockFailureAnalytics

- (FMDActivationLockFailureAnalytics)initWithAccountAndError:(id)a3 error:(id)a4
{
  id v7 = a4;
  if (self)
  {
    id v8 = a3;
    objc_storeWeak((id *)&self->_account, v8);
    objc_storeStrong((id *)&self->_error, a4);
    v10.receiver = self;
    v10.super_class = (Class)FMDActivationLockFailureAnalytics;
    self = [(FMDRequest *)&v10 initWithAccount:v8];
  }
  return self;
}

- (id)requestUrl
{
  v3 = +[FMSystemInfo sharedInstance];
  v4 = [v3 deviceUDID];
  v5 = objc_alloc_init(RequestTemplateURL);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_account);
  id v7 = [(RequestTemplateURL *)v5 urlFromTemplate:@"${scheme}://${hostname}/fmipservice/findme/metrics" account:WeakRetained udid:v4];

  return v7;
}

- (id)requestBody
{
  v19.receiver = self;
  v19.super_class = (Class)FMDActivationLockFailureAnalytics;
  v3 = [(FMDRequest *)&v19 requestBody];
  v4 = +[FMDSystemConfig sharedInstance];
  [v3 setObject:@"findmyd" forKeyedSubscript:@"source"];
  v5 = +[NSDate date];
  v6 = [NSNumber numberWithLongLong:[v5 fm_epoch]];
  [v3 setObject:v6 forKeyedSubscript:@"timestamp"];

  id v7 = [v4 deviceUDID];
  [v3 fm_safelyMapKey:@"udid" toObject:v7];

  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  v9 = [v4 serialNumber];
  [v8 fm_safelyMapKey:@"serialNumber" toObject:v9];

  objc_super v10 = [v4 productType];
  [v8 fm_safelyMapKey:@"productType" toObject:v10];

  v11 = [v4 internationalMobileEquipmentIdentity];
  [v8 fm_safelyMapKey:@"imei" toObject:v11];

  v12 = [v4 internationalMobileEquipmentIdentityTwo];
  [v8 fm_safelyMapKey:@"imei2" toObject:v12];

  v13 = [v4 mobileEquipmentIdentifier];
  [v8 fm_safelyMapKey:@"meid" toObject:v13];

  id v14 = objc_alloc_init((Class)NSMutableDictionary);
  v15 = +[NSNumber numberWithInteger:[(NSError *)self->_error code]];
  [v14 fm_safelyMapKey:@"errorCode" toObject:v15];

  v16 = [(NSError *)self->_error description];
  [v14 fm_safelyMapKey:@"errorMessage" toObject:v16];

  v17 = [(NSError *)self->_error domain];
  [v14 fm_safelyMapKey:@"errorCategory" toObject:v17];

  [v8 fm_safelyMapKey:@"errorDetails" toObject:v14];
  [v3 fm_safelyMapKey:@"activationLockFailure" toObject:v8];

  return v3;
}

- (id)requestHeaders
{
  v4.receiver = self;
  v4.super_class = (Class)FMDActivationLockFailureAnalytics;
  v2 = [(FMDRequest *)&v4 requestHeaders];

  return v2;
}

- (unint64_t)type
{
  return 1;
}

- (BOOL)canRequestBeRetriedNow
{
  return 0;
}

- (FMDAccount)account
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_account);

  return (FMDAccount *)WeakRetained;
}

- (void)setAccount:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_destroyWeak((id *)&self->_account);
}

@end