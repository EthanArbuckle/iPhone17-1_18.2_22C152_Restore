@interface FMDRequestMissingDevice
- (BOOL)canReplace:(id)a3;
- (BOOL)canRequestBeRetriedNow;
- (BOOL)showAuthFailedMessage;
- (FMDAccount)account;
- (FMDFMIPMissingDeviceInfo)missingDeviceInfo;
- (FMDRequestMissingDevice)initWithAccount:(id)a3 token:(id)a4 andMissingDeviceInfo:(id)a5;
- (NSString)shortLivedToken;
- (id)authToken;
- (id)requestBody;
- (id)urlTemplateType;
- (void)setAccount:(id)a3;
- (void)setMissingDeviceInfo:(id)a3;
- (void)setShortLivedToken:(id)a3;
@end

@implementation FMDRequestMissingDevice

- (FMDRequestMissingDevice)initWithAccount:(id)a3 token:(id)a4 andMissingDeviceInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)FMDRequestMissingDevice;
  v11 = [(FMDRequest *)&v14 initWithAccount:v8];
  v12 = v11;
  if (v11)
  {
    [(FMDRequestMissingDevice *)v11 setAccount:v8];
    objc_storeStrong((id *)&v12->_missingDeviceInfo, a5);
    objc_storeStrong((id *)&v12->_shortLivedToken, a4);
  }

  return v12;
}

- (id)urlTemplateType
{
  return @"missingDevice";
}

- (id)requestBody
{
  v18.receiver = self;
  v18.super_class = (Class)FMDRequestMissingDevice;
  v3 = [(FMDRequest *)&v18 requestBody];
  v4 = objc_alloc_init(FMDActingRequestDecorator);
  v5 = [(FMDActingRequestDecorator *)v4 standardDeviceContext];

  [v3 fm_safelyMapKey:@"deviceContext" toObject:v5];
  v6 = [(FMDRequestMissingDevice *)self missingDeviceInfo];
  v7 = +[NSMutableDictionary dictionary];
  id v8 = [v6 udid];
  [v7 fm_safelyMapKey:@"udid" toObject:v8];

  id v9 = [v6 productType];
  [v7 fm_safelyMapKey:@"productType" toObject:v9];

  id v10 = [v6 buildVersion];
  [v7 fm_safelyMapKey:@"buildVersion" toObject:v10];

  v11 = [v6 productVersion];
  [v7 fm_safelyMapKey:@"productVersion" toObject:v11];

  [v3 setObject:v7 forKeyedSubscript:@"deviceInfo"];
  v12 = [v6 imei];
  [v3 fm_safelyMapKey:@"imei" toObject:v12];

  v13 = [v6 meid];
  [v3 fm_safelyMapKey:@"meid" toObject:v13];

  objc_super v14 = [v6 serialNumber];
  [v3 fm_safelyMapKey:@"serialNumber" toObject:v14];

  v15 = +[FMDSystemConfig sharedInstance];
  v16 = [v15 deviceUDID];
  [v3 fm_safelyMapKey:@"hostDeviceUdid" toObject:v16];

  return v3;
}

- (id)authToken
{
  return [(FMDRequestMissingDevice *)self shortLivedToken];
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
  BOOL v4 = 1;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      BOOL v4 = 0;
    }
  }

  return v4;
}

- (FMDAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (FMDFMIPMissingDeviceInfo)missingDeviceInfo
{
  return self->_missingDeviceInfo;
}

- (void)setMissingDeviceInfo:(id)a3
{
}

- (NSString)shortLivedToken
{
  return self->_shortLivedToken;
}

- (void)setShortLivedToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortLivedToken, 0);
  objc_storeStrong((id *)&self->_missingDeviceInfo, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end