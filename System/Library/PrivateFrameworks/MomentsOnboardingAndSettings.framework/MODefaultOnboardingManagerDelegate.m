@interface MODefaultOnboardingManagerDelegate
- (void)onOnboardingFlowCompletionChange:(unint64_t)a3 isComplete:(BOOL)a4;
@end

@implementation MODefaultOnboardingManagerDelegate

- (void)onOnboardingFlowCompletionChange:(unint64_t)a3 isComplete:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v13 = *MEMORY[0x263EF8340];
  v6 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [NSNumber numberWithUnsignedInteger:a3];
    v8 = [NSNumber numberWithBool:v4];
    int v9 = 138412546;
    v10 = v7;
    __int16 v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_256D32000, v6, OS_LOG_TYPE_DEFAULT, "MODefaultOnboardingManagerDelegate onOnboardingFlowCompletionChange:%@ isComplete:%@", (uint8_t *)&v9, 0x16u);
  }
}

@end