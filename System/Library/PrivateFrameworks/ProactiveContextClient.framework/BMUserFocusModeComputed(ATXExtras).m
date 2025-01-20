@interface BMUserFocusModeComputed(ATXExtras)
- (__CFString)modeSemanticTypeAsString;
- (__CFString)modeUpdateReasonAsString;
- (__CFString)modeUpdateSourceAsString;
- (uint64_t)atx_dndModeSemanticType;
- (void)atx_dndModeSemanticType;
- (void)modeSemanticTypeAsString;
- (void)modeUpdateReasonAsString;
- (void)modeUpdateSourceAsString;
@end

@implementation BMUserFocusModeComputed(ATXExtras)

- (__CFString)modeUpdateSourceAsString
{
  unsigned int v2 = [a1 updateSource];
  if (v2 < 4) {
    return off_1E6BE7690[v2];
  }
  v4 = __atxlog_handle_modes();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    -[BMUserFocusModeComputed(ATXExtras) modeUpdateSourceAsString](a1);
  }

  return @"Unknown";
}

- (__CFString)modeUpdateReasonAsString
{
  unsigned int v2 = [a1 updateReason];
  if (v2 < 4) {
    return off_1E6BE76B0[v2];
  }
  v4 = __atxlog_handle_modes();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    -[BMUserFocusModeComputed(ATXExtras) modeUpdateReasonAsString](a1);
  }

  return @"Unknown";
}

- (__CFString)modeSemanticTypeAsString
{
  unsigned int v2 = [a1 semanticType] - 1;
  if (v2 < 0xB) {
    return off_1E6BE76D0[v2];
  }
  v4 = __atxlog_handle_modes();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    -[BMUserFocusModeComputed(ATXExtras) modeSemanticTypeAsString](a1);
  }

  return @"Unknown";
}

- (uint64_t)atx_dndModeSemanticType
{
  return 2;
}

- (void)modeUpdateSourceAsString
{
  [a1 updateSource];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_4(&dword_1DAFF9000, v1, v2, "BMUserFocusModeComputedUpdateSource modeUpdateSourceAsString: undefined mode update source: %lu. Returning Unknown", v3, v4, v5, v6, v7);
}

- (void)modeUpdateReasonAsString
{
  [a1 updateReason];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_4(&dword_1DAFF9000, v1, v2, "BMUserFocusModeComputedUpdateReason modeUpdateReasonAsString: undefined mode update reason: %lu. Returning Unknown", v3, v4, v5, v6, v7);
}

- (void)modeSemanticTypeAsString
{
  [a1 semanticType];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_4(&dword_1DAFF9000, v1, v2, "BMUserFocusModeComputedSemanticType modeSemanticTypeAsString: undefined mode semantic type: %lu. Returning Unknown", v3, v4, v5, v6, v7);
}

- (void)atx_dndModeSemanticType
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_1DAFF9000, log, OS_LOG_TYPE_FAULT, "atx_dndModeSemanticType: Encountered BMUserFocusModeComputedSemanticTypeUnknown in computed mode stream. Returning DNDModeSemanticTypeDefault", v1, 2u);
}

@end