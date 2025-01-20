@interface FMDPairingLockRegisterRequest
- (BOOL)canReplace:(id)a3;
- (FMDPairingLockRegisterRequest)initWithAccount:(id)a3 registerRequestInfo:(id)a4;
- (FMDPairingLockRegisterRequestInfo)registerRequestInfo;
- (NSString)baseURL;
- (id)requestBody;
- (id)requestHeaders;
- (id)requestUrl;
- (unint64_t)type;
- (void)setBaseURL:(id)a3;
- (void)setRegisterRequestInfo:(id)a3;
@end

@implementation FMDPairingLockRegisterRequest

- (FMDPairingLockRegisterRequest)initWithAccount:(id)a3 registerRequestInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FMDPairingLockRegisterRequest;
  v8 = [(FMDRequest *)&v12 initWithAccount:v6];
  if (v8)
  {
    uint64_t v9 = [v6 accessoryPairingURL];
    baseURL = v8->_baseURL;
    v8->_baseURL = (NSString *)v9;

    objc_storeStrong((id *)&v8->_registerRequestInfo, a4);
  }

  return v8;
}

- (id)requestHeaders
{
  v4.receiver = self;
  v4.super_class = (Class)FMDPairingLockRegisterRequest;
  v2 = [(FMDRequest *)&v4 requestHeaders];

  return v2;
}

- (id)requestUrl
{
  v2 = [(FMDPairingLockRegisterRequest *)self baseURL];
  v3 = +[NSString stringWithFormat:@"%@/type5/pairinglock/register", v2];

  objc_super v4 = +[NSURL URLWithString:v3];

  return v4;
}

- (id)requestBody
{
  v9.receiver = self;
  v9.super_class = (Class)FMDPairingLockRegisterRequest;
  v3 = [(FMDRequest *)&v9 requestBody];
  objc_super v4 = [(FMDPairingLockRegisterRequest *)self registerRequestInfo];
  v5 = [v4 serialNumber];
  [v3 fm_safelyMapKey:@"serialNumber" toObject:v5];

  id v6 = [(FMDPairingLockRegisterRequest *)self registerRequestInfo];
  id v7 = [v6 accessoryType];
  [v3 fm_safelyMapKey:@"accessoryType" toObject:v7];

  [v3 fm_safelyMapKey:@"specVersion" toObject:@"1.0.0"];

  return v3;
}

- (unint64_t)type
{
  return 1;
}

- (BOOL)canReplace:(id)a3
{
  return 0;
}

- (FMDPairingLockRegisterRequestInfo)registerRequestInfo
{
  return self->_registerRequestInfo;
}

- (void)setRegisterRequestInfo:(id)a3
{
}

- (NSString)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);

  objc_storeStrong((id *)&self->_registerRequestInfo, 0);
}

@end