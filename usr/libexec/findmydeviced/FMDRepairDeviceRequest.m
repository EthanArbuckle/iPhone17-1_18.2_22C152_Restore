@interface FMDRepairDeviceRequest
- (BOOL)canReplace:(id)a3;
- (BOOL)canRequestBeRetriedNow;
- (FMDAccount)accountForRepair;
- (FMDRepairDeviceRequest)initWithDeviceIdentifier:(id)a3 ephemeralToken:(id)a4 dsid:(id)a5 callingClient:(id)a6 mode:(int64_t)a7;
- (NSString)callingClient;
- (NSString)dsid;
- (NSString)ephemeralToken;
- (id)repairContextString:(int64_t)a3;
- (id)requestBody;
- (id)requestHeaders;
- (id)requestUrl;
- (int64_t)mode;
- (unint64_t)type;
- (void)setAccountForRepair:(id)a3;
- (void)setCallingClient:(id)a3;
- (void)setDsid:(id)a3;
- (void)setEphemeralToken:(id)a3;
@end

@implementation FMDRepairDeviceRequest

- (id)requestHeaders
{
  v4.receiver = self;
  v4.super_class = (Class)FMDRepairDeviceRequest;
  v2 = [(FMDRequest *)&v4 requestHeaders];

  return v2;
}

- (FMDRepairDeviceRequest)initWithDeviceIdentifier:(id)a3 ephemeralToken:(id)a4 dsid:(id)a5 callingClient:(id)a6 mode:(int64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)FMDRepairDeviceRequest;
  v17 = [(FMDRequest *)&v20 initWithAccount:v13];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_accountForRepair, a3);
    objc_storeStrong((id *)&v18->_ephemeralToken, a4);
    objc_storeStrong((id *)&v18->_dsid, a5);
    objc_storeStrong((id *)&v18->_callingClient, a6);
    v18->_mode = a7;
  }

  return v18;
}

- (id)requestUrl
{
  v3 = +[FMSystemInfo sharedInstance];
  objc_super v4 = [v3 deviceUDID];
  v5 = [(FMDRepairDeviceRequest *)self dsid];
  v6 = +[NSString stringWithFormat:@"${scheme}://${hostname}/fmipservice/findme/%@/${udid}/repairDeviceV2", v5];

  v7 = objc_alloc_init(RequestTemplateURL);
  v8 = [(FMDRepairDeviceRequest *)self accountForRepair];
  v9 = [(RequestTemplateURL *)v7 urlFromTemplate:v6 account:v8 udid:v4];

  return v9;
}

- (id)requestBody
{
  v10.receiver = self;
  v10.super_class = (Class)FMDRepairDeviceRequest;
  v3 = [(FMDRequest *)&v10 requestBody];
  objc_super v4 = +[FMSystemInfo sharedInstance];
  v5 = [(FMDRepairDeviceRequest *)self ephemeralToken];
  [v3 setObject:v5 forKeyedSubscript:@"authToken"];

  v6 = [v4 deviceUDID];
  [v3 setObject:v6 forKeyedSubscript:@"device"];

  v7 = [(FMDRequest *)self authId];
  [v3 setObject:v7 forKeyedSubscript:@"requestingUserPrsId"];

  [v3 setObject:self->_callingClient forKeyedSubscript:@"originClient"];
  v8 = [(FMDRepairDeviceRequest *)self repairContextString:self->_mode];
  [v3 setObject:v8 forKeyedSubscript:@"reason"];

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

- (BOOL)canRequestBeRetriedNow
{
  return 0;
}

- (id)repairContextString:(int64_t)a3
{
  CFStringRef v3 = @"repair";
  if (a3 == 2) {
    CFStringRef v3 = @"tradeIn";
  }
  if (a3) {
    return (id)v3;
  }
  else {
    return @"unknown";
  }
}

- (FMDAccount)accountForRepair
{
  return self->_accountForRepair;
}

- (void)setAccountForRepair:(id)a3
{
}

- (NSString)ephemeralToken
{
  return self->_ephemeralToken;
}

- (void)setEphemeralToken:(id)a3
{
}

- (NSString)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
}

- (NSString)callingClient
{
  return self->_callingClient;
}

- (void)setCallingClient:(id)a3
{
}

- (int64_t)mode
{
  return self->_mode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callingClient, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_ephemeralToken, 0);

  objc_storeStrong((id *)&self->_accountForRepair, 0);
}

@end