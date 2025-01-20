@interface FCTodayFeedConfigResponse
- (FCTodayFeedConfigResponse)initWithCKConfigData:(id)a3 ckRecordsByType:(id)a4 newsEdgeConfigData:(id)a5;
- (NSData)ckConfigData;
- (NSData)newsEdgeConfigData;
- (NSDictionary)ckRecordsByType;
@end

@implementation FCTodayFeedConfigResponse

- (FCTodayFeedConfigResponse)initWithCKConfigData:(id)a3 ckRecordsByType:(id)a4 newsEdgeConfigData:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FCTodayFeedConfigResponse;
  v12 = [(FCTodayFeedConfigResponse *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_ckConfigData, a3);
    objc_storeStrong((id *)&v13->_ckRecordsByType, a4);
    objc_storeStrong((id *)&v13->_newsEdgeConfigData, a5);
  }

  return v13;
}

- (NSData)ckConfigData
{
  return self->_ckConfigData;
}

- (NSDictionary)ckRecordsByType
{
  return self->_ckRecordsByType;
}

- (NSData)newsEdgeConfigData
{
  return self->_newsEdgeConfigData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newsEdgeConfigData, 0);
  objc_storeStrong((id *)&self->_ckRecordsByType, 0);
  objc_storeStrong((id *)&self->_ckConfigData, 0);
}

@end