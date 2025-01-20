@interface TSRemotePlanWebsheetContext
- (BOOL)useLiveID;
- (CTXPCServiceSubscriptionContext)subscriptionContext;
- (NSDictionary)postdata;
- (NSString)carrierName;
- (NSString)iccid;
- (NSString)url;
- (TSRemotePlanWebsheetContext)init;
- (int)flowType;
- (void)setCarrierName:(id)a3;
- (void)setFlowType:(int)a3;
- (void)setIccid:(id)a3;
- (void)setPostdata:(id)a3;
- (void)setSubscriptionContext:(id)a3;
- (void)setUrl:(id)a3;
- (void)setUseLiveID:(BOOL)a3;
@end

@implementation TSRemotePlanWebsheetContext

- (TSRemotePlanWebsheetContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)TSRemotePlanWebsheetContext;
  return [(TSRemotePlanWebsheetContext *)&v3 init];
}

- (NSString)carrierName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCarrierName:(id)a3
{
}

- (CTXPCServiceSubscriptionContext)subscriptionContext
{
  return self->_subscriptionContext;
}

- (void)setSubscriptionContext:(id)a3
{
  self->_subscriptionContext = (CTXPCServiceSubscriptionContext *)a3;
}

- (BOOL)useLiveID
{
  return self->_useLiveID;
}

- (void)setUseLiveID:(BOOL)a3
{
  self->_useLiveID = a3;
}

- (NSString)iccid
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIccid:(id)a3
{
}

- (int)flowType
{
  return self->_flowType;
}

- (void)setFlowType:(int)a3
{
  self->_flowType = a3;
}

- (NSString)url
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUrl:(id)a3
{
}

- (NSDictionary)postdata
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPostdata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postdata, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_iccid, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
}

@end