@interface SAMetrics
+ (id)metrics;
- (BOOL)requiresResponse;
- (NSDictionary)eventInformation;
- (NSDictionary)timings;
- (NSString)assistantId;
- (NSString)category;
- (NSString)originalCommandId;
- (NSString)speechId;
- (id)_descriptionHint;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAssistantId:(id)a3;
- (void)setCategory:(id)a3;
- (void)setEventInformation:(id)a3;
- (void)setOriginalCommandId:(id)a3;
- (void)setSpeechId:(id)a3;
- (void)setTimings:(id)a3;
@end

@implementation SAMetrics

- (id)_descriptionHint
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v2 = [(SAMetrics *)self timings];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 allKeys];
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    v10 = __45__SAMetrics_PrettyPrinting___descriptionHint__block_invoke;
    v11 = &unk_1E5CDD760;
    id v12 = v3;
    v5 = [v4 sortedArrayUsingComparator:&v8];

    v13[0] = @"timings";
    v13[1] = @"eventInformation";
    v14[0] = v5;
    v14[1] = v5;
    v6 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v14, v13, 2, v8, v9, v10, v11);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __45__SAMetrics_PrettyPrinting___descriptionHint__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  v7 = [v5 objectForKeyedSubscript:a2];
  uint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

  uint64_t v9 = [v7 compare:v8];
  return v9;
}

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"Metrics";
}

+ (id)metrics
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)assistantId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"assistantId"];
}

- (void)setAssistantId:(id)a3
{
}

- (NSString)category
{
  return (NSString *)[(AceObject *)self propertyForKey:@"category"];
}

- (void)setCategory:(id)a3
{
}

- (NSDictionary)eventInformation
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"eventInformation"];
}

- (void)setEventInformation:(id)a3
{
}

- (NSString)originalCommandId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"originalCommandId"];
}

- (void)setOriginalCommandId:(id)a3
{
}

- (NSString)speechId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"speechId"];
}

- (void)setSpeechId:(id)a3
{
}

- (NSDictionary)timings
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"timings"];
}

- (void)setTimings:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end