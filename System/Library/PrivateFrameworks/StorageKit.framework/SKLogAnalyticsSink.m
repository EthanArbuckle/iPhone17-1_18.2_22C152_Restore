@interface SKLogAnalyticsSink
- (void)sendEventWithName:(id)a3 eventPayloadBuilder:(id)a4;
@end

@implementation SKLogAnalyticsSink

- (void)sendEventWithName:(id)a3 eventPayloadBuilder:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = (void (**)(void))a4;
  v7 = SKGetOSLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = v6[2](v6);
    int v9 = 138412546;
    id v10 = v5;
    __int16 v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_23F40C000, v7, OS_LOG_TYPE_INFO, "Sending event %@ with payload %@", (uint8_t *)&v9, 0x16u);
  }
}

@end