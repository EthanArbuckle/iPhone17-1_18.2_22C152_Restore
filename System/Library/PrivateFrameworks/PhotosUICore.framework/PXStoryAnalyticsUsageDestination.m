@interface PXStoryAnalyticsUsageDestination
- (PXStoryAnalyticsUsageDestination)init;
- (id)_createDefaultPayloadForInfo:(id)a3;
- (id)_createInfoForEvent:(id)a3;
- (id)_existingInfoForEvent:(id)a3;
- (id)_existingInfoForEvent:(id)a3 pop:(BOOL)a4;
- (id)_popInfoForEndEvent:(id)a3;
- (void)_enumerateExistingInfosUsingBlock:(id)a3;
- (void)_sendSummaryEventsForInfo:(id)a3;
- (void)processEvent:(id)a3;
@end

@implementation PXStoryAnalyticsUsageDestination

- (PXStoryAnalyticsUsageDestination)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXStoryAnalyticsUsageDestination;
  v2 = [(PXStoryAnalyticsUsageDestination *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sessionInfosByIdentifier = v2->_sessionInfosByIdentifier;
    v2->_sessionInfosByIdentifier = v3;
  }
  return v2;
}

- (void).cxx_destruct
{
}

- (void)processEvent:(id)a3
{
  id v4 = a3;
  v5 = [v4 name];
  if ([v5 isEqualToString:@"com.apple.photos.memory.interactiveMemorySessionBegan"])
  {
    id v6 = [(PXStoryAnalyticsUsageDestination *)self _createInfoForEvent:v4];
  }
  else if ([v5 isEqualToString:@"com.apple.photos.memory.interactiveMemorySessionPaused"])
  {
    v7 = [(PXStoryAnalyticsUsageDestination *)self _existingInfoForEvent:v4];
    [v7 didPauseWithEvent:v4];
  }
  else if ([v5 isEqualToString:*MEMORY[0x1E4F563E8]])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __49__PXStoryAnalyticsUsageDestination_processEvent___block_invoke;
    v9[3] = &unk_1E5DB5660;
    id v10 = v4;
    [(PXStoryAnalyticsUsageDestination *)self _enumerateExistingInfosUsingBlock:v9];
  }
  else if ([v5 isEqualToString:@"com.apple.photos.memory.interactiveMemorySessionEnded"])
  {
    v8 = [(PXStoryAnalyticsUsageDestination *)self _popInfoForEndEvent:v4];
    [(PXStoryAnalyticsUsageDestination *)self _sendSummaryEventsForInfo:v8];
  }
}

uint64_t __49__PXStoryAnalyticsUsageDestination_processEvent___block_invoke(uint64_t a1, void *a2)
{
  return [a2 didSuspendAppWithEvent:*(void *)(a1 + 32)];
}

- (void)_sendSummaryEventsForInfo:(id)a3
{
  id v4 = a3;
  if (!v4) {
    PXAssertGetLog();
  }
  v5 = [(PXStoryAnalyticsUsageDestination *)self _createDefaultPayloadForInfo:v4];
  [MEMORY[0x1E4F56658] sendEvent:@"com.apple.photos.memory.interactiveMemoryPlaybackSummary" withPayload:v5];
  id v6 = (void *)MEMORY[0x1E4F56658];
  v7 = PXStoryAnalyticsEventForSummaryWithPauseCount([v4 pauseCount]);
  [v6 sendEvent:v7 withPayload:v5];
}

- (void)_enumerateExistingInfosUsingBlock:(id)a3
{
  id v4 = a3;
  sessionInfosByIdentifier = self->_sessionInfosByIdentifier;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__PXStoryAnalyticsUsageDestination__enumerateExistingInfosUsingBlock___block_invoke;
  v7[3] = &unk_1E5DB5630;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)sessionInfosByIdentifier enumerateKeysAndObjectsUsingBlock:v7];
}

uint64_t __70__PXStoryAnalyticsUsageDestination__enumerateExistingInfosUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_createDefaultPayloadForInfo:(id)a3
{
  id v3 = a3;
  id v4 = [v3 startEvent];
  v5 = (void *)[v4 copyRawPayload];
  id v6 = (void *)[v5 mutableCopy];

  if (!v6) {
    PXAssertGetLog();
  }
  v7 = [v3 endEvent];
  id v8 = (void *)[v7 copyRawPayload];
  [v6 addEntriesFromDictionary:v8];

  [v6 setObject:0 forKeyedSubscript:@"interactiveMemorySessionIdentifier"];
  v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "pauseCount"));
  [v6 setObject:v9 forKeyedSubscript:@"interactiveMemoryPlaybackSummaryPauseCount"];

  id v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "appSuspensionCount"));
  [v6 setObject:v10 forKeyedSubscript:@"interactiveMemoryPlaybackSummaryAppSuspensionCount"];

  return v6;
}

- (id)_existingInfoForEvent:(id)a3 pop:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 propertyForKey:@"interactiveMemorySessionIdentifier"];
  if (!v7) {
    PXAssertGetLog();
  }
  id v8 = [(NSMutableDictionary *)self->_sessionInfosByIdentifier objectForKeyedSubscript:v7];
  if (!v8) {
    PXAssertGetLog();
  }
  if (v4) {
    [(NSMutableDictionary *)self->_sessionInfosByIdentifier setObject:0 forKeyedSubscript:v7];
  }

  return v8;
}

- (id)_popInfoForEndEvent:(id)a3
{
  id v4 = a3;
  v5 = [(PXStoryAnalyticsUsageDestination *)self _existingInfoForEvent:v4 pop:1];
  [v5 finalizeWithEvent:v4];

  return v5;
}

- (id)_existingInfoForEvent:(id)a3
{
  return [(PXStoryAnalyticsUsageDestination *)self _existingInfoForEvent:a3 pop:0];
}

- (id)_createInfoForEvent:(id)a3
{
  id v4 = a3;
  v5 = [v4 propertyForKey:@"interactiveMemorySessionIdentifier"];
  if (!v5) {
    PXAssertGetLog();
  }
  id v6 = [(NSMutableDictionary *)self->_sessionInfosByIdentifier objectForKeyedSubscript:v5];

  if (v6) {
    PXAssertGetLog();
  }
  v7 = [[_PXStoryAnalyticsSessionInfo alloc] initWithEvent:v4];
  [(NSMutableDictionary *)self->_sessionInfosByIdentifier setObject:v7 forKeyedSubscript:v5];

  return v7;
}

@end