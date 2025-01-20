@interface APMediaServiceRequestParameters
- (APClientInfo)clientInfo;
- (APContext)context;
- (APIDAccount_Private)idAccount;
- (BOOL)deliverEntireBatch;
- (BOOL)hasOdml;
- (BOOL)validate;
- (NSDate)requestTime;
- (NSDictionary)appMetadataFields;
- (NSString)adamId;
- (NSString)storeFront;
- (NSString)storeFrontLocale;
- (NSUUID)requestID;
- (unint64_t)placement;
- (void)setClientInfo:(id)a3;
- (void)setContext:(id)a3;
- (void)setDeliverEntireBatch:(BOOL)a3;
- (void)setIdAccount:(id)a3;
- (void)setPlacement:(unint64_t)a3;
- (void)setRequestID:(id)a3;
@end

@implementation APMediaServiceRequestParameters

- (BOOL)validate
{
  uint64_t v3 = [(APMediaServiceRequestParameters *)self context];
  if (!v3) {
    return v3;
  }
  v4 = (void *)v3;
  uint64_t v5 = [(APMediaServiceRequestParameters *)self requestID];
  if (!v5)
  {

    goto LABEL_9;
  }
  v6 = (void *)v5;
  v7 = [(APMediaServiceRequestParameters *)self idAccount];

  if (!v7)
  {
LABEL_9:
    LOBYTE(v3) = 0;
    return v3;
  }
  LOBYTE(v3) = (id)[(APMediaServiceRequestParameters *)self placement] == (id)7005
            || (id)[(APMediaServiceRequestParameters *)self placement] == (id)7006
            || (id)[(APMediaServiceRequestParameters *)self placement] == (id)7007
            || (id)[(APMediaServiceRequestParameters *)self placement] == (id)7008;
  return v3;
}

- (BOOL)hasOdml
{
  return (id)[(APMediaServiceRequestParameters *)self placement] == (id)7005;
}

- (NSString)storeFront
{
  v2 = [(APMediaServiceRequestParameters *)self context];
  uint64_t v3 = [v2 supplementalContext];
  v4 = [v3 objectForKey:@"storeFront"];

  return (NSString *)v4;
}

- (NSString)storeFrontLocale
{
  v2 = [(APMediaServiceRequestParameters *)self context];
  uint64_t v3 = [v2 supplementalContext];
  v4 = [v3 objectForKey:@"storeFrontLocale"];

  return (NSString *)v4;
}

- (NSDictionary)appMetadataFields
{
  v2 = [(APMediaServiceRequestParameters *)self context];
  uint64_t v3 = [v2 supplementalContext];
  v4 = [v3 objectForKey:@"appMetadataFields"];

  return (NSDictionary *)v4;
}

- (NSDate)requestTime
{
  v2 = [(APMediaServiceRequestParameters *)self context];
  uint64_t v3 = [v2 supplementalContext];
  v4 = [v3 objectForKey:@"requestTime"];

  return (NSDate *)v4;
}

- (NSString)adamId
{
  v2 = [(APMediaServiceRequestParameters *)self context];
  uint64_t v3 = [v2 supplementalContext];
  v4 = [v3 objectForKey:@"adamId"];

  return (NSString *)v4;
}

- (APContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSUUID)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
}

- (APClientInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
}

- (APIDAccount_Private)idAccount
{
  return self->_idAccount;
}

- (void)setIdAccount:(id)a3
{
}

- (unint64_t)placement
{
  return self->_placement;
}

- (void)setPlacement:(unint64_t)a3
{
  self->_placement = a3;
}

- (BOOL)deliverEntireBatch
{
  return self->_deliverEntireBatch;
}

- (void)setDeliverEntireBatch:(BOOL)a3
{
  self->_deliverEntireBatch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idAccount, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_requestID, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end