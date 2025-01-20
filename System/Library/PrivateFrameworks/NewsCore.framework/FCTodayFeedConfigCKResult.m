@interface FCTodayFeedConfigCKResult
- (FCTodayFeedConfigCKResult)initWithRecordsByType:(id)a3;
- (NSData)configData;
- (NSDictionary)recordsByType;
@end

@implementation FCTodayFeedConfigCKResult

- (FCTodayFeedConfigCKResult)initWithRecordsByType:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FCTodayFeedConfigCKResult;
  v6 = [(FCTodayFeedConfigCKResult *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_recordsByType, a3);
    v8 = [v5 objectForKeyedSubscript:&unk_1EF8D7D10];
    v9 = [v8 onlyRecord];

    v10 = [v9 todayFeedConfiguration];
    uint64_t v11 = [v10 dataUsingEncoding:4];
    configData = v7->_configData;
    v7->_configData = (NSData *)v11;
  }
  return v7;
}

- (NSData)configData
{
  return self->_configData;
}

- (NSDictionary)recordsByType
{
  return self->_recordsByType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordsByType, 0);
  objc_storeStrong((id *)&self->_configData, 0);
}

@end