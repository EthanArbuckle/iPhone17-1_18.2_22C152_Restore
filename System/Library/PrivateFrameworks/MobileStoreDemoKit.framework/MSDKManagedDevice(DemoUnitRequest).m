@interface MSDKManagedDevice(DemoUnitRequest)
@end

@implementation MSDKManagedDevice(DemoUnitRequest)

- (void)checkInWithCompletion:()DemoUnitRequest .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)checkInWithCompletion:()DemoUnitRequest .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)markAsNotDemoWithCompletion:()DemoUnitRequest .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)markAsNotDemoWithCompletion:()DemoUnitRequest .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)searchStoreWithOptions:()DemoUnitRequest completion:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)searchStoreWithOptions:()DemoUnitRequest completion:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_handleCheckInXPCResponse:()DemoUnitRequest withCompletion:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_handleSearchXPCResponse:()DemoUnitRequest withCompletion:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_handleSearchXPCResponse:()DemoUnitRequest withCompletion:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_handleSearchXPCResponse:()DemoUnitRequest withCompletion:.cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v4 = 136315394;
  v5 = "-[MSDKManagedDevice(DemoUnitRequest) _handleSearchXPCResponse:withCompletion:]";
  __int16 v6 = 2114;
  id v7 = (id)objc_opt_class();
  id v3 = v7;
  _os_log_error_impl(&dword_21EF08000, a2, OS_LOG_TYPE_ERROR, "%s - Store Search result format not correct: %{public}@", (uint8_t *)&v4, 0x16u);
}

- (void)_handleSearchXPCResponse:()DemoUnitRequest withCompletion:.cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_handleSearchXPCResponse:()DemoUnitRequest withCompletion:.cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end