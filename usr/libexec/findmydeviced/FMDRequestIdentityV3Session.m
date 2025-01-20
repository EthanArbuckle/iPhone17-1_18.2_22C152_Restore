@interface FMDRequestIdentityV3Session
- (BOOL)canReplace:(id)a3;
- (BOOL)canRequestBeRetriedNow;
- (BOOL)requiresAuthentication;
- (FMDRequestIdentityV3Session)initWithProvider:(id)a3 activationLockRequestUUID:(id)a4 pscHelloMsg:(id)a5;
- (FMDServiceProvider)provider;
- (NSString)cause;
- (NSString)pscHelloMsg;
- (NSUUID)activationLockRequestUUID;
- (id)requestBody;
- (id)requestHeaders;
- (id)requestUrl;
- (unint64_t)type;
- (void)setActivationLockRequestUUID:(id)a3;
- (void)setCause:(id)a3;
- (void)setProvider:(id)a3;
- (void)setPscHelloMsg:(id)a3;
- (void)setRequiresAuthentication:(BOOL)a3;
@end

@implementation FMDRequestIdentityV3Session

- (FMDRequestIdentityV3Session)initWithProvider:(id)a3 activationLockRequestUUID:(id)a4 pscHelloMsg:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 account];
  v14.receiver = self;
  v14.super_class = (Class)FMDRequestIdentityV3Session;
  v12 = [(FMDRequest *)&v14 initWithAccount:v11];

  if (v12)
  {
    [(FMDRequestIdentityV3Session *)v12 setActivationLockRequestUUID:v9];
    [(FMDRequestIdentityV3Session *)v12 setProvider:v8];
    [(FMDRequestIdentityV3Session *)v12 setPscHelloMsg:v10];
    [(FMDRequestIdentityV3Session *)v12 setRequiresAuthentication:1];
  }

  return v12;
}

- (unint64_t)type
{
  if ([(FMDRequestIdentityV3Session *)self requiresAuthentication]) {
    return 1;
  }
  else {
    return 2;
  }
}

- (id)requestUrl
{
  if ([(FMDRequestIdentityV3Session *)self requiresAuthentication])
  {
    v3 = [(FMDRequestIdentityV3Session *)self provider];
    v4 = [v3 account];

    v5 = +[FMDSystemConfig sharedInstance];
    v6 = [v5 deviceUDID];

    v7 = objc_alloc_init(RequestTemplateURL);
    id v8 = [(RequestTemplateURL *)v7 urlFromTemplate:@"${scheme}://${hostname}/fmipservice/${service}/${dsid}/${udid}/identityV3Session" account:v4 udid:v6];
  }
  else
  {
    v4 = objc_alloc_init(RequestTemplateURL);
    id v8 = [(RequestTemplateURL *)v4 unauthenticatedURLFromTemplate:@"${scheme}://${hostname}/${service}/provision/init"];
  }

  return v8;
}

- (id)requestHeaders
{
  v7.receiver = self;
  v7.super_class = (Class)FMDRequestIdentityV3Session;
  v3 = [(FMDRequest *)&v7 requestHeaders];
  v4 = [(FMDRequestIdentityV3Session *)self activationLockRequestUUID];
  v5 = [v4 UUIDString];
  [v3 fm_safelyMapKey:@"X-Apple-AL-ID" toObject:v5];

  return v3;
}

- (id)requestBody
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = +[FMSystemInfo sharedInstance];
  v5 = [v4 serialNumber];
  [v3 fm_safelyMapKey:@"serialNumber" toObject:v5];

  v6 = +[FMSystemInfo sharedInstance];
  objc_super v7 = [v6 deviceUDID];
  [v3 fm_safelyMapKey:@"udid" toObject:v7];

  id v8 = +[FMSystemInfo sharedInstance];
  id v9 = [v8 osVersion];
  [v3 fm_safelyMapKey:@"osVersion" toObject:v9];

  id v10 = +[FMSystemInfo sharedInstance];
  v11 = [v10 osBuildVersion];
  [v3 fm_safelyMapKey:@"osBuildVersion" toObject:v11];

  v12 = +[FMSystemInfo sharedInstance];
  v13 = [v12 productType];
  [v3 fm_safelyMapKey:@"productType" toObject:v13];

  objc_super v14 = +[FMDAbsintheV3SigningInterface sharedInterface];
  id v23 = 0;
  v15 = [v14 inFieldCollectionReceipt:&v23];
  id v16 = v23;
  [v3 fm_safelyMapKey:@"ifcReceipt" toObject:v15];

  v17 = [v16 fm_commaSeparatedString];
  [v3 fm_safelyMapKey:@"collectionError" toObject:v17];

  v18 = +[FMSystemInfo sharedInstance];
  LODWORD(v15) = [v18 isInternalBuild];

  if (v15)
  {
    v19 = [v16 description];
    [v3 fm_safelyMapKey:@"collectionErrorDetail" toObject:v19];
  }
  v20 = [(FMDRequestIdentityV3Session *)self pscHelloMsg];
  [v3 fm_safelyMapKey:@"message" toObject:v20];

  v21 = [(FMDRequestIdentityV3Session *)self cause];
  [v3 fm_safelyMapKey:@"cause" toObject:v21];

  return v3;
}

- (BOOL)canRequestBeRetriedNow
{
  return 0;
}

- (BOOL)canReplace:(id)a3
{
  return 0;
}

- (NSString)cause
{
  return self->_cause;
}

- (void)setCause:(id)a3
{
}

- (BOOL)requiresAuthentication
{
  return self->_requiresAuthentication;
}

- (void)setRequiresAuthentication:(BOOL)a3
{
  self->_requiresAuthentication = a3;
}

- (FMDServiceProvider)provider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);

  return (FMDServiceProvider *)WeakRetained;
}

- (void)setProvider:(id)a3
{
}

- (NSString)pscHelloMsg
{
  return self->_pscHelloMsg;
}

- (void)setPscHelloMsg:(id)a3
{
}

- (NSUUID)activationLockRequestUUID
{
  return self->_activationLockRequestUUID;
}

- (void)setActivationLockRequestUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationLockRequestUUID, 0);
  objc_storeStrong((id *)&self->_pscHelloMsg, 0);
  objc_destroyWeak((id *)&self->_provider);

  objc_storeStrong((id *)&self->_cause, 0);
}

@end