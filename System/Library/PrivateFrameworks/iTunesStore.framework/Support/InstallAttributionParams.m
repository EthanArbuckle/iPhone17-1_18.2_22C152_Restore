@interface InstallAttributionParams
- (BOOL)isEqual:(id)a3;
- (NSNumber)appAdamId;
- (NSNumber)campaignId;
- (NSNumber)localTimestamp;
- (NSNumber)timestamp;
- (NSString)adNetworkId;
- (NSString)attributionSignature;
- (NSString)impressionId;
- (void)setAdNetworkId:(id)a3;
- (void)setAppAdamId:(id)a3;
- (void)setAttributionSignature:(id)a3;
- (void)setCampaignId:(id)a3;
- (void)setImpressionId:(id)a3;
- (void)setLocalTimestamp:(id)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation InstallAttributionParams

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    v6 = [(InstallAttributionParams *)self appAdamId];
    v7 = [v5 appAdamId];
    if ([v6 isEqual:v7])
    {
      v8 = [(InstallAttributionParams *)self adNetworkId];
      v9 = [v5 adNetworkId];
      if ([v8 isEqual:v9])
      {
        v10 = [(InstallAttributionParams *)self campaignId];
        v11 = [v5 campaignId];
        if ([v10 isEqual:v11])
        {
          v12 = [(InstallAttributionParams *)self timestamp];
          v25 = [v5 timestamp];
          v26 = v12;
          if ([v12 isEqual:v25])
          {
            v13 = [(InstallAttributionParams *)self impressionId];
            v23 = [v5 impressionId];
            v24 = v13;
            if ([v13 isEqual:v23])
            {
              uint64_t v14 = [(InstallAttributionParams *)self attributionSignature];
              uint64_t v15 = [v5 attributionSignature];
              v22 = (void *)v14;
              v16 = (void *)v14;
              v17 = (void *)v15;
              if ([v16 isEqual:v15])
              {
                v21 = [(InstallAttributionParams *)self localTimestamp];
                v20 = [v5 localTimestamp];
                unsigned __int8 v18 = [v21 isEqual:v20];
              }
              else
              {
                unsigned __int8 v18 = 0;
              }
            }
            else
            {
              unsigned __int8 v18 = 0;
            }
          }
          else
          {
            unsigned __int8 v18 = 0;
          }
        }
        else
        {
          unsigned __int8 v18 = 0;
        }
      }
      else
      {
        unsigned __int8 v18 = 0;
      }
    }
    else
    {
      unsigned __int8 v18 = 0;
    }
  }
  else
  {
    unsigned __int8 v18 = 0;
  }

  return v18;
}

- (NSNumber)appAdamId
{
  return self->_appAdamId;
}

- (void)setAppAdamId:(id)a3
{
}

- (NSString)adNetworkId
{
  return self->_adNetworkId;
}

- (void)setAdNetworkId:(id)a3
{
}

- (NSNumber)campaignId
{
  return self->_campaignId;
}

- (void)setCampaignId:(id)a3
{
}

- (NSString)impressionId
{
  return self->_impressionId;
}

- (void)setImpressionId:(id)a3
{
}

- (NSNumber)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (NSString)attributionSignature
{
  return self->_attributionSignature;
}

- (void)setAttributionSignature:(id)a3
{
}

- (NSNumber)localTimestamp
{
  return self->_localTimestamp;
}

- (void)setLocalTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localTimestamp, 0);
  objc_storeStrong((id *)&self->_attributionSignature, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_impressionId, 0);
  objc_storeStrong((id *)&self->_campaignId, 0);
  objc_storeStrong((id *)&self->_adNetworkId, 0);

  objc_storeStrong((id *)&self->_appAdamId, 0);
}

@end