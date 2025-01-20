@interface ATXProactiveSuggestionFeedbackMetricsLogger(UIFeedback)
@end

@implementation ATXProactiveSuggestionFeedbackMetricsLogger(UIFeedback)

- (void)logClientModelEngagementMetricForFeedbackResult:()UIFeedback .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = [a2 uiCache];
  if (v7)
  {
    a2 = [a2 uiCache];
    v9 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v9);
  }
  else
  {
    v8 = 0;
  }
  int v10 = 138412546;
  v11 = v6;
  __int16 v12 = 2112;
  v13 = v8;
  _os_log_fault_impl(&dword_1AE67F000, a3, OS_LOG_TYPE_FAULT, "%@ Metrics - attempting to log metrics for invalid uicache class of %@", (uint8_t *)&v10, 0x16u);
  if (v7)
  {
  }
}

- (void)logClientModelEngagementMetricForFeedbackResult:()UIFeedback .cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = [a2 layoutType];
  v8 = [a2 consumerSubType];
  v9 = [a2 clientModelId];
  uint64_t v10 = [a2 engagementType];
  if ((v10 - 1) > 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = off_1E5F01868[(int)v10 - 1];
  }
  int v12 = [a2 numSuggestionsForClientModelInLayout];
  int v13 = [a2 positionInClientModelCacheOfEngagedSuggestion];
  uint64_t v14 = [a2 abGroup];
  v15 = [a2 clientModelABGroup];
  *(_DWORD *)buf = 138414338;
  id v19 = v6;
  OUTLINED_FUNCTION_0_9();
  __int16 v20 = v16;
  v21 = v9;
  __int16 v22 = v16;
  v23 = v11;
  __int16 v24 = 1024;
  int v25 = v12;
  __int16 v26 = 1024;
  int v27 = v13;
  __int16 v28 = v16;
  v29 = v14;
  __int16 v30 = v16;
  uint64_t v31 = v17;
  _os_log_debug_impl(&dword_1AE67F000, a3, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBBlendingClientModelEngagementTracker with layoutType: %@ consumerSubType: %@, clientModelId: %@, and engagementType: %@ numSuggestionsForClientModelInLayout: %u positionInClientModelCacheOfEngagedSuggestion: %u abGroup: %@ clientModelABGroup: %@", buf, 0x54u);
}

- (void)logClientModelEngagementMetricForFeedbackResult:()UIFeedback .cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  int v7 = 138412546;
  v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_1AE67F000, a3, OS_LOG_TYPE_ERROR, "%@ Metrics - could not find ATXSuggestionLayout for widget id: %@", (uint8_t *)&v7, 0x16u);
}

- (void)logSessionEngagementMetricForFeedbackResult:()UIFeedback .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  int v7 = [a2 consumerSubType];
  uint64_t v8 = [a2 engagementType];
  if ((v8 - 1) > 2)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
    __int16 v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v9 = off_1E5F018A8[(int)v8 - 1];
  }
  *(_DWORD *)buf = 138412802;
  id v11 = v6;
  OUTLINED_FUNCTION_0_9();
  _os_log_debug_impl(&dword_1AE67F000, a3, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBBlendingSessionEngagementTracker with consumerSubType: %@ and engagementType: %@", buf, 0x20u);
}

@end