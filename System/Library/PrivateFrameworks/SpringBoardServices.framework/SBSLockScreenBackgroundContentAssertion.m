@interface SBSLockScreenBackgroundContentAssertion
+ (id)acquireBackgroundContentAssertionWithDefinition:(id)a3 errorHandler:(id)a4;
- (BOOL)_supportsReacquisition;
@end

@implementation SBSLockScreenBackgroundContentAssertion

+ (id)acquireBackgroundContentAssertionWithDefinition:(id)a3 errorHandler:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (_os_feature_enabled_impl())
  {
    v8 = SBLogCoverSheet();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_18FBC5000, v8, OS_LOG_TYPE_DEFAULT, "Acquiring SBSLockScreenBackgroundContentAssertion", (uint8_t *)&v14, 2u);
    }

    v9 = [a1 acquireContentProviderAssertionForType:2 slot:@"Background" identifier:@"SBDashBoardBackgroundContentAssertionIdentifier" configurationObject:v6 errorHandler:v7];
  }
  else
  {
    uint64_t v16 = *MEMORY[0x1E4F28588];
    v17[0] = @"Feature not enabled";
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SBSLockScreenContentAssertionErrorDomain" code:4 userInfo:v10];
    v12 = SBLogCoverSheet();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      v15 = v11;
      _os_log_impl(&dword_18FBC5000, v12, OS_LOG_TYPE_DEFAULT, "Failed to acquire SBSLockScreenBackgroundContentAssertion: %@", (uint8_t *)&v14, 0xCu);
    }

    if (v7) {
      v7[2](v7, v11);
    }

    v9 = 0;
  }

  return v9;
}

- (BOOL)_supportsReacquisition
{
  return 1;
}

@end