@interface SBPIPAnalytics
- (id)assistantForUUID:(id)a3;
- (void)pictureInPictureAnalyticsSourceWithUUID:(id)a3 didBecomePossible:(BOOL)a4;
- (void)pictureInPictureDidActivateAnalyticsSessionWithUUID:(id)a3 analyticsSourceUUID:(id)a4 automatically:(BOOL)a5;
- (void)pictureInPictureDidChangeStashStateForAnalyticsSessionWithUUID:(id)a3 stashed:(BOOL)a4;
- (void)pictureInPictureDidCreateAnalyticsSessionWithUUID:(id)a3 bundleIdentifier:(id)a4 contentType:(int64_t)a5;
- (void)pictureInPictureDidCreateAnalyticsSourceWithUUID:(id)a3 bundleIdentifier:(id)a4 contentType:(int64_t)a5;
- (void)pictureInPictureDidDeactivateAnalyticsSessionWithUUID:(id)a3 analyticsSourceUUID:(id)a4 appStoppedSession:(BOOL)a5 restoredFullScreen:(BOOL)a6;
- (void)pictureInPictureDidDestroyAnalyticsSessionWithUUID:(id)a3;
- (void)pictureInPictureDidDestroyAnalyticsSourceWithUUID:(id)a3;
@end

@implementation SBPIPAnalytics

- (id)assistantForUUID:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_analyticsSourceAssistants objectForKeyedSubscript:v4];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(NSMutableDictionary *)self->_analyticsSessionAssistants objectForKeyedSubscript:v4];
  }
  v8 = v7;

  return v8;
}

- (void)pictureInPictureDidCreateAnalyticsSourceWithUUID:(id)a3 bundleIdentifier:(id)a4 contentType:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = SBLogPIP();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[SBPIPAnalytics pictureInPictureDidCreateAnalyticsSourceWithUUID:bundleIdentifier:contentType:](v10, v11, v12, v13, v14, v15, v16, v17);
  }

  if (!self->_analyticsSourceAssistants)
  {
    v18 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    analyticsSourceAssistants = self->_analyticsSourceAssistants;
    self->_analyticsSourceAssistants = v18;
  }
  v20 = [SBPIPAnalyticsSourceSummaryAssistant alloc];
  v21 = +[SBDefaults localDefaults];
  v22 = [v21 pipDefaults];
  v23 = -[SBPIPAnalyticsSourceSummaryAssistant initWithBundleIdentifier:contentType:isAutoPIPEnabled:invalidationBlock:](v20, "initWithBundleIdentifier:contentType:isAutoPIPEnabled:invalidationBlock:", v8, a5, [v22 allowAutoPIP], &__block_literal_global_225);

  [(NSMutableDictionary *)self->_analyticsSourceAssistants setObject:v23 forKeyedSubscript:v9];
}

void __96__SBPIPAnalytics_pictureInPictureDidCreateAnalyticsSourceWithUUID_bundleIdentifier_contentType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v2 = v3;
  AnalyticsSendEventLazy();
}

uint64_t __96__SBPIPAnalytics_pictureInPictureDidCreateAnalyticsSourceWithUUID_bundleIdentifier_contentType___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) generateAnalyticsPayload];
}

- (void)pictureInPictureDidDestroyAnalyticsSourceWithUUID:(id)a3
{
  id v4 = a3;
  v5 = SBLogPIP();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SBPIPAnalytics pictureInPictureDidDestroyAnalyticsSourceWithUUID:](v5, v6, v7, v8, v9, v10, v11, v12);
  }

  uint64_t v13 = [(NSMutableDictionary *)self->_analyticsSourceAssistants objectForKeyedSubscript:v4];
  [v13 noteBecameInactiveAtTime:CFAbsoluteTimeGetCurrent()];

  uint64_t v14 = [(NSMutableDictionary *)self->_analyticsSourceAssistants objectForKeyedSubscript:v4];
  [v14 notePIPBecameProhibitedAtTime:CFAbsoluteTimeGetCurrent()];

  uint64_t v15 = [(NSMutableDictionary *)self->_analyticsSourceAssistants objectForKeyedSubscript:v4];
  [v15 invalidate];

  [(NSMutableDictionary *)self->_analyticsSourceAssistants setObject:0 forKeyedSubscript:v4];
}

- (void)pictureInPictureAnalyticsSourceWithUUID:(id)a3 didBecomePossible:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = SBLogPIP();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[SBPIPAnalytics pictureInPictureAnalyticsSourceWithUUID:didBecomePossible:](v7, v8, v9, v10, v11, v12, v13, v14);
  }

  uint64_t v15 = [(NSMutableDictionary *)self->_analyticsSourceAssistants objectForKeyedSubscript:v6];
  double Current = CFAbsoluteTimeGetCurrent();
  if (v4) {
    [v15 notePIPBecamePossibleAtTime:Current];
  }
  else {
    [v15 notePIPBecameProhibitedAtTime:Current];
  }
}

- (void)pictureInPictureDidCreateAnalyticsSessionWithUUID:(id)a3 bundleIdentifier:(id)a4 contentType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!self->_analyticsSessionAssistants)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    analyticsSessionAssistants = self->_analyticsSessionAssistants;
    self->_analyticsSessionAssistants = v10;
  }
  uint64_t v12 = SBLogPIP();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[SBPIPAnalytics pictureInPictureDidCreateAnalyticsSessionWithUUID:bundleIdentifier:contentType:](v12, v13, v14, v15, v16, v17, v18, v19);
  }

  v20 = [SBPIPAnalyticsSessionSummaryAssistant alloc];
  v21 = +[SBDefaults localDefaults];
  v22 = [v21 pipDefaults];
  v23 = -[SBPIPAnalyticsSessionSummaryAssistant initWithBundleIdentifier:contentType:isAutoPIPEnabled:invalidationBlock:](v20, "initWithBundleIdentifier:contentType:isAutoPIPEnabled:invalidationBlock:", v9, a5, [v22 allowAutoPIP], &__block_literal_global_6_1);
  [(NSMutableDictionary *)self->_analyticsSessionAssistants setObject:v23 forKeyedSubscript:v8];
}

void __97__SBPIPAnalytics_pictureInPictureDidCreateAnalyticsSessionWithUUID_bundleIdentifier_contentType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v2 = v3;
  AnalyticsSendEventLazy();
}

uint64_t __97__SBPIPAnalytics_pictureInPictureDidCreateAnalyticsSessionWithUUID_bundleIdentifier_contentType___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) generateAnalyticsPayload];
}

- (void)pictureInPictureDidDestroyAnalyticsSessionWithUUID:(id)a3
{
  id v4 = a3;
  v5 = SBLogPIP();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SBPIPAnalytics pictureInPictureDidDestroyAnalyticsSessionWithUUID:](v5, v6, v7, v8, v9, v10, v11, v12);
  }

  uint64_t v13 = [(NSMutableDictionary *)self->_analyticsSessionAssistants objectForKeyedSubscript:v4];
  [v13 noteBecameInactiveAtTime:CFAbsoluteTimeGetCurrent()];

  uint64_t v14 = [(NSMutableDictionary *)self->_analyticsSessionAssistants objectForKeyedSubscript:v4];
  [v14 invalidate];

  [(NSMutableDictionary *)self->_analyticsSessionAssistants setObject:0 forKeyedSubscript:v4];
}

- (void)pictureInPictureDidActivateAnalyticsSessionWithUUID:(id)a3 analyticsSourceUUID:(id)a4 automatically:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = SBLogPIP();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[SBPIPAnalytics pictureInPictureDidActivateAnalyticsSessionWithUUID:analyticsSourceUUID:automatically:](v10, v11, v12, v13, v14, v15, v16, v17);
  }

  uint64_t v18 = [(NSMutableDictionary *)self->_analyticsSessionAssistants objectForKeyedSubscript:v9];
  [v18 noteBecameActiveAtTime:CFAbsoluteTimeGetCurrent()];

  uint64_t v19 = [(NSMutableDictionary *)self->_analyticsSessionAssistants objectForKeyedSubscript:v9];

  [v19 noteStartedAutomatically:v5];
  v20 = [(NSMutableDictionary *)self->_analyticsSourceAssistants objectForKeyedSubscript:v8];

  [v20 noteBecameActiveAtTime:CFAbsoluteTimeGetCurrent()];
}

- (void)pictureInPictureDidDeactivateAnalyticsSessionWithUUID:(id)a3 analyticsSourceUUID:(id)a4 appStoppedSession:(BOOL)a5 restoredFullScreen:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = SBLogPIP();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[SBPIPAnalytics pictureInPictureDidDeactivateAnalyticsSessionWithUUID:analyticsSourceUUID:appStoppedSession:restoredFullScreen:](v12, v13, v14, v15, v16, v17, v18, v19);
  }

  v20 = [(NSMutableDictionary *)self->_analyticsSessionAssistants objectForKeyedSubscript:v11];
  [v20 noteBecameInactiveAtTime:CFAbsoluteTimeGetCurrent()];

  v21 = [(NSMutableDictionary *)self->_analyticsSessionAssistants objectForKeyedSubscript:v11];
  [v21 noteBecameUnstashedAtTime:CFAbsoluteTimeGetCurrent()];

  v22 = [(NSMutableDictionary *)self->_analyticsSessionAssistants objectForKeyedSubscript:v11];
  [v22 noteAppStoppedSession:v7];

  v23 = [(NSMutableDictionary *)self->_analyticsSessionAssistants objectForKeyedSubscript:v11];
  [v23 noteRestoredFullScreen:v6];

  v24 = [(NSMutableDictionary *)self->_analyticsSessionAssistants objectForKeyedSubscript:v11];
  [v24 invalidate];

  [(NSMutableDictionary *)self->_analyticsSessionAssistants setObject:0 forKeyedSubscript:v11];
  v25 = [(NSMutableDictionary *)self->_analyticsSourceAssistants objectForKeyedSubscript:v10];

  [v25 noteBecameInactiveAtTime:CFAbsoluteTimeGetCurrent()];
}

- (void)pictureInPictureDidChangeStashStateForAnalyticsSessionWithUUID:(id)a3 stashed:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = SBLogPIP();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[SBPIPAnalytics pictureInPictureDidChangeStashStateForAnalyticsSessionWithUUID:stashed:](v7, v8, v9, v10, v11, v12, v13, v14);
  }

  uint64_t v15 = [(NSMutableDictionary *)self->_analyticsSessionAssistants objectForKeyedSubscript:v6];
  double Current = CFAbsoluteTimeGetCurrent();
  if (v4) {
    [v15 noteBecameStashedAtTime:Current];
  }
  else {
    [v15 noteBecameUnstashedAtTime:Current];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsSessionAssistants, 0);
  objc_storeStrong((id *)&self->_analyticsSourceAssistants, 0);
}

- (void)pictureInPictureDidCreateAnalyticsSourceWithUUID:(uint64_t)a3 bundleIdentifier:(uint64_t)a4 contentType:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)pictureInPictureDidDestroyAnalyticsSourceWithUUID:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)pictureInPictureAnalyticsSourceWithUUID:(uint64_t)a3 didBecomePossible:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)pictureInPictureDidCreateAnalyticsSessionWithUUID:(uint64_t)a3 bundleIdentifier:(uint64_t)a4 contentType:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)pictureInPictureDidDestroyAnalyticsSessionWithUUID:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)pictureInPictureDidActivateAnalyticsSessionWithUUID:(uint64_t)a3 analyticsSourceUUID:(uint64_t)a4 automatically:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)pictureInPictureDidDeactivateAnalyticsSessionWithUUID:(uint64_t)a3 analyticsSourceUUID:(uint64_t)a4 appStoppedSession:(uint64_t)a5 restoredFullScreen:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)pictureInPictureDidChangeStashStateForAnalyticsSessionWithUUID:(uint64_t)a3 stashed:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end