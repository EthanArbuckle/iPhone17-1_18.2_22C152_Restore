@interface VKAnalyticsProcessor
- (BOOL)isPublicAPI;
- (VKAnalyticsSessionAccumulator)sessionAccumulator;
- (void)processAndSendEvent:(id)a3;
- (void)processAndSendSession:(id)a3;
- (void)sendCoreAnalyticsEvent:(id)a3 block:(id)a4;
- (void)setIsPublicAPI:(BOOL)a3;
- (void)setSessionAccumulator:(id)a3;
@end

@implementation VKAnalyticsProcessor

- (void)processAndSendEvent:(id)a3
{
  id v4 = a3;
  v5 = [v4 eventKey];

  if (v5)
  {
    v6 = [v4 coreAnalyticsDictionary];
    if (v6)
    {
      BOOL v7 = [(VKAnalyticsProcessor *)self isPublicAPI];
      v8 = [v4 eventKey];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __44__VKAnalyticsProcessor_processAndSendEvent___block_invoke;
      v9[3] = &unk_1E6BF3CF0;
      id v10 = v6;
      BOOL v11 = v7;
      [(VKAnalyticsProcessor *)self sendCoreAnalyticsEvent:v8 block:v9];
    }
  }
}

id __44__VKAnalyticsProcessor_processAndSendEvent___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) mutableCopy];
  v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  [v2 setObject:v3 forKeyedSubscript:@"publicAPI"];

  id v4 = (void *)[v2 copy];
  return v4;
}

- (void)processAndSendSession:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(VKAnalyticsProcessor *)self isPublicAPI];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__VKAnalyticsProcessor_processAndSendSession___block_invoke;
  v7[3] = &unk_1E6BF3CF0;
  id v8 = v4;
  BOOL v9 = v5;
  id v6 = v4;
  [(VKAnalyticsProcessor *)self sendCoreAnalyticsEvent:@"InteractionSessionEnded" block:v7];
}

id __46__VKAnalyticsProcessor_processAndSendSession___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) coreAnalyticsDictionary];
  v3 = (void *)[v2 mutableCopy];
  id v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  [v3 setObject:v4 forKeyedSubscript:@"publicAPI"];

  id v5 = v3;
  return v5;
}

- (void)sendCoreAnalyticsEvent:(id)a3 block:(id)a4
{
  id v5 = NSString;
  id v6 = a4;
  id v7 = [v5 stringWithFormat:@"com.apple.VisionKit.%@", a3];
  AnalyticsSendEventLazy();
}

- (BOOL)isPublicAPI
{
  return self->_isPublicAPI;
}

- (void)setIsPublicAPI:(BOOL)a3
{
  self->_isPublicAPI = a3;
}

- (VKAnalyticsSessionAccumulator)sessionAccumulator
{
  return self->_sessionAccumulator;
}

- (void)setSessionAccumulator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end