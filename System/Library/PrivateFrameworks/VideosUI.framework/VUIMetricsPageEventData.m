@interface VUIMetricsPageEventData
+ (id)createWithMetricsData:(id)a3;
+ (id)createWithPageId:(id)a3 andPageType:(id)a4 andEventData:(id)a5;
+ (id)createWithPageType:(id)a3;
- (NSDictionary)eventData;
- (NSString)pageId;
- (NSString)pageType;
- (id)generateMetricsDataDictionary;
- (void)setEventData:(id)a3;
- (void)setPageId:(id)a3;
- (void)setPageType:(id)a3;
@end

@implementation VUIMetricsPageEventData

- (NSDictionary)eventData
{
  return self->_eventData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventData, 0);
  objc_storeStrong((id *)&self->_pageType, 0);
  objc_storeStrong((id *)&self->_pageId, 0);
}

- (id)generateMetricsDataDictionary
{
  v10[2] = *MEMORY[0x1E4F143B8];
  pageType = &stru_1F3E921E0;
  v9[0] = @"pageId";
  v9[1] = @"pageType";
  pageId = (__CFString *)self->_pageId;
  if (!pageId) {
    pageId = &stru_1F3E921E0;
  }
  if (self->_pageType) {
    pageType = (__CFString *)self->_pageType;
  }
  v10[0] = pageId;
  v10[1] = pageType;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (self->_eventData)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:");
    [v6 addEntriesFromDictionary:v5];
    uint64_t v7 = [v6 copy];

    v5 = (void *)v7;
  }
  return v5;
}

+ (id)createWithMetricsData:(id)a3
{
  v11[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"pageId"];
  v6 = [v4 objectForKeyedSubscript:@"pageType"];
  uint64_t v7 = (void *)[v4 mutableCopy];

  v11[0] = @"pageId";
  v11[1] = @"pageType";
  v11[2] = @"eventType";
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
  [v7 removeObjectsForKeys:v8];

  v9 = [a1 createWithPageId:v5 andPageType:v6 andEventData:v7];

  return v9;
}

+ (id)createWithPageId:(id)a3 andPageType:(id)a4 andEventData:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)a1);
  [v11 setPageId:v10];

  [v11 setPageType:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v11 setEventData:v8];
  }

  return v11;
}

- (void)setPageType:(id)a3
{
}

- (void)setPageId:(id)a3
{
}

- (void)setEventData:(id)a3
{
}

- (NSString)pageType
{
  return self->_pageType;
}

- (NSString)pageId
{
  return self->_pageId;
}

+ (id)createWithPageType:(id)a3
{
  return (id)[a1 createWithPageId:a3 andPageType:a3 andEventData:0];
}

@end