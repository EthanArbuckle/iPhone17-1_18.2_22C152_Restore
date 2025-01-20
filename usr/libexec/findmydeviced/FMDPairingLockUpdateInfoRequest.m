@interface FMDPairingLockUpdateInfoRequest
- (BOOL)canReplace:(id)a3;
- (FMDPairingLockUpdateInfoRequest)initWithAccount:(id)a3 updateRequestInfo:(id)a4;
- (FMDPairingLockUpdateRequestInfo)updateRequestInfo;
- (NSString)baseURL;
- (id)requestBody;
- (id)requestHeaders;
- (id)requestUrl;
- (unint64_t)type;
- (void)setBaseURL:(id)a3;
- (void)setUpdateRequestInfo:(id)a3;
@end

@implementation FMDPairingLockUpdateInfoRequest

- (FMDPairingLockUpdateInfoRequest)initWithAccount:(id)a3 updateRequestInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FMDPairingLockUpdateInfoRequest;
  v8 = [(FMDRequest *)&v12 initWithAccount:v6];
  if (v8)
  {
    uint64_t v9 = [v6 accessoryPairingURL];
    baseURL = v8->_baseURL;
    v8->_baseURL = (NSString *)v9;

    objc_storeStrong((id *)&v8->_updateRequestInfo, a4);
  }

  return v8;
}

- (id)requestHeaders
{
  v4.receiver = self;
  v4.super_class = (Class)FMDPairingLockUpdateInfoRequest;
  v2 = [(FMDRequest *)&v4 requestHeaders];

  return v2;
}

- (id)requestUrl
{
  v2 = [(FMDPairingLockUpdateInfoRequest *)self baseURL];
  v3 = +[NSString stringWithFormat:@"%@/type5/pairinglock/updatePairingInfo", v2];

  objc_super v4 = +[NSURL URLWithString:v3];

  return v4;
}

- (id)requestBody
{
  v13.receiver = self;
  v13.super_class = (Class)FMDPairingLockUpdateInfoRequest;
  v3 = [(FMDRequest *)&v13 requestBody];
  objc_super v4 = [(FMDPairingLockUpdateInfoRequest *)self updateRequestInfo];
  v5 = [v4 pairingCheckToken];
  [v3 fm_safelyMapKey:@"pairingCheckToken" toObject:v5];

  id v6 = [(FMDPairingLockUpdateInfoRequest *)self updateRequestInfo];
  id v7 = [v6 lostModePubKey];
  [v3 fm_safelyMapKey:@"lostModePubKey" toObject:v7];

  v8 = [(FMDPairingLockUpdateInfoRequest *)self updateRequestInfo];
  uint64_t v9 = [v8 userPrivateKey];
  [v3 fm_safelyMapKey:@"userPrivateKey" toObject:v9];

  v10 = [(FMDPairingLockUpdateInfoRequest *)self updateRequestInfo];
  v11 = [v10 timeStamp];
  [v3 fm_safelyMapKey:@"timestamp" toObject:v11];

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

- (FMDPairingLockUpdateRequestInfo)updateRequestInfo
{
  return self->_updateRequestInfo;
}

- (void)setUpdateRequestInfo:(id)a3
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

  objc_storeStrong((id *)&self->_updateRequestInfo, 0);
}

@end