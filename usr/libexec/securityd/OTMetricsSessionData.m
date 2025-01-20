@interface OTMetricsSessionData
- (NSString)deviceSessionID;
- (NSString)flowID;
- (OTMetricsSessionData)initWithFlowID:(id)a3 deviceSessionID:(id)a4;
@end

@implementation OTMetricsSessionData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceSessionID, 0);

  objc_storeStrong((id *)&self->_flowID, 0);
}

- (NSString)deviceSessionID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)flowID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (OTMetricsSessionData)initWithFlowID:(id)a3 deviceSessionID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)OTMetricsSessionData;
  v9 = [(OTMetricsSessionData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_flowID, a3);
    objc_storeStrong((id *)&v10->_deviceSessionID, a4);
  }

  return v10;
}

@end