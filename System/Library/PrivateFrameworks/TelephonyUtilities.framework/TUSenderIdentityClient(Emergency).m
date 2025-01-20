@interface TUSenderIdentityClient(Emergency)
@end

@implementation TUSenderIdentityClient(Emergency)

- (void)shouldShowEmergencyCallbackModeAlertForSenderIdentityUUID:()Emergency .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_19C496000, log, OS_LOG_TYPE_ERROR, "Could not determine whether emergency callback mode warning should be presented due to error %@ for sender identity UUID %@.", (uint8_t *)&v3, 0x16u);
}

@end