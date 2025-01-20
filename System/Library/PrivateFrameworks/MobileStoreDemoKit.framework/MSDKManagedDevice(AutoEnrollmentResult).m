@interface MSDKManagedDevice(AutoEnrollmentResult)
@end

@implementation MSDKManagedDevice(AutoEnrollmentResult)

- (void)sendAutoEnrollmentResult:()AutoEnrollmentResult withStoreId:withHelpMenuRowSelection:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[MSDKManagedDevice(AutoEnrollmentResult) sendAutoEnrollmentResult:withStoreId:withHelpMenuRowSelection:]";
  _os_log_error_impl(&dword_21EF08000, log, OS_LOG_TYPE_ERROR, "%s - Failed to setup XPC connection.", (uint8_t *)&v1, 0xCu);
}

- (void)sendAutoEnrollmentAbortEvent:()AutoEnrollmentResult countryCode:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[MSDKManagedDevice(AutoEnrollmentResult) sendAutoEnrollmentAbortEvent:countryCode:]";
  _os_log_error_impl(&dword_21EF08000, log, OS_LOG_TYPE_ERROR, "%s - Failed to setup XPC connection.", (uint8_t *)&v1, 0xCu);
}

@end