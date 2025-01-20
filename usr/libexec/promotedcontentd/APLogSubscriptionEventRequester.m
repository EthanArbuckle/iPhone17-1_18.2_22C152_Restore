@interface APLogSubscriptionEventRequester
- (APLogSubscriptionEventRequester)initWithMetric:(id)a3 bundleID:(id)a4;
- (Class)responseClass;
- (NSMutableArray)parameters;
- (NSString)qToken;
- (NSString)subscriptionSourceID;
- (id)protoBuffer;
- (int)subscriptionType;
- (void)addParameter:(id)a3 value:(id)a4 parameters:(id)a5;
- (void)setParameters:(id)a3;
- (void)setQToken:(id)a3;
- (void)setSubscriptionSourceID:(id)a3;
- (void)setSubscriptionType:(int)a3;
@end

@implementation APLogSubscriptionEventRequester

- (APLogSubscriptionEventRequester)initWithMetric:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[NSUUID UUID];
  v9 = +[APIDAccountProvider privateUserAccount];
  v10 = [(APServerRequester *)self initWithBundleID:v7 requestIdentifier:v8 contextIdentifier:0 contentIdentifier:0 idAccount:v9];

  if (v10)
  {
    v11 = metricPropertyValue(v6, (void *)0x24);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {
      v13 = metricPropertyValue(v6, (void *)0x24);
    }
    else
    {
      v13 = 0;
    }
    objc_storeStrong((id *)&v10->_qToken, v13);
    if (isKindOfClass) {

    }
    v14 = metricPropertyValue(v6, (void *)0x23);
    objc_opt_class();
    char v15 = objc_opt_isKindOfClass();
    if (v15)
    {
      v16 = metricPropertyValue(v6, (void *)0x23);
    }
    else
    {
      v16 = 0;
    }
    objc_storeStrong((id *)&v10->_subscriptionSourceID, v16);
    if (v15) {

    }
    id v30 = v7;
    v17 = metricPropertyValue(v6, (void *)0x25);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = metricPropertyValue(v6, (void *)0x25);
      v10->_subscriptionType = [v18 intValue];
    }
    else
    {
      v10->_subscriptionType = 0;
    }

    uint64_t v19 = +[NSMutableArray array];
    parameters = v10->_parameters;
    v10->_parameters = (NSMutableArray *)v19;

    v36[0] = kAPMetricSubscriptionPrice;
    v36[1] = kAPMetricSubscriptionCurrency;
    v36[2] = kAPMetricSubscriptionPurchase;
    v36[3] = kAPMetricSubscriptionIdentifier;
    +[NSArray arrayWithObjects:v36 count:4];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    id v22 = [v21 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v32;
      do
      {
        v25 = 0;
        do
        {
          if (*(void *)v32 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v31 + 1) + 8 * (void)v25);
          v27 = [v6 internalProperties];
          v28 = [v27 objectForKeyedSubscript:v26];

          if (v28) {
            [(APLogSubscriptionEventRequester *)v10 addParameter:v26 value:v28 parameters:v10->_parameters];
          }

          v25 = (char *)v25 + 1;
        }
        while (v23 != v25);
        id v23 = [v21 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v23);
    }

    id v7 = v30;
  }

  return v10;
}

- (void)addParameter:(id)a3 value:(id)a4 parameters:(id)a5
{
  if (a3 && a4)
  {
    id v7 = a5;
    id v8 = a4;
    id v9 = a3;
    v10 = objc_alloc_init(APPBParameter);
    [(APPBParameter *)v10 setKey:v9];

    [(APPBParameter *)v10 setValue:v8];
    [v7 addObject:v10];
  }
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)protoBuffer
{
  v3 = objc_alloc_init(APPBLogSubscriptionEventRequest);
  v4 = +[APEncryptedIDProvider provider];
  v5 = [(APServerRequester *)self idAccount];
  id v6 = [v4 encryptedIDsForIDAccountPrivate:v5];

  id v7 = [v6 anonymousDemandID];
  [(APPBLogSubscriptionEventRequest *)v3 setAnonymousDemandiAdID:v7];

  id v8 = [v6 contentID];
  [(APPBLogSubscriptionEventRequest *)v3 setContentiAdID:v8];

  [(APPBLogSubscriptionEventRequest *)v3 setEvent:[(APLogSubscriptionEventRequester *)self subscriptionType]];
  id v9 = +[NSDate date];
  [v9 timeIntervalSince1970];
  -[APPBLogSubscriptionEventRequest setEventTime:](v3, "setEventTime:");

  v10 = [v6 iAdID];
  [(APPBLogSubscriptionEventRequest *)v3 setIAdID:v10];

  v11 = [(APLogSubscriptionEventRequester *)self qToken];
  [(APPBLogSubscriptionEventRequest *)v3 setQToken:v11];

  v12 = [(APLogSubscriptionEventRequester *)self subscriptionSourceID];
  [(APPBLogSubscriptionEventRequest *)v3 setSubscriptionSourceID:v12];

  v13 = [(APLogSubscriptionEventRequester *)self parameters];
  [(APPBLogSubscriptionEventRequest *)v3 setInfos:v13];

  return v3;
}

- (NSString)qToken
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setQToken:(id)a3
{
}

- (NSString)subscriptionSourceID
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setSubscriptionSourceID:(id)a3
{
}

- (int)subscriptionType
{
  return self->_subscriptionType;
}

- (void)setSubscriptionType:(int)a3
{
  self->_subscriptionType = a3;
}

- (NSMutableArray)parameters
{
  return (NSMutableArray *)objc_getProperty(self, a2, 152, 1);
}

- (void)setParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_subscriptionSourceID, 0);

  objc_storeStrong((id *)&self->_qToken, 0);
}

@end