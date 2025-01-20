@interface SBUnhideProtectedAppAlertControllerFor
@end

@implementation SBUnhideProtectedAppAlertControllerFor

void ___SBUnhideProtectedAppAlertControllerFor_block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F4B7F8] sharedManager];
  uint64_t v3 = *(void *)(a1 + 32);
  id v7 = 0;
  int v4 = [v2 setSubject:v3 isHidden:0 error:&v7];
  id v5 = v7;

  if (v4)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v6 = SBLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      ___SBUnhideProtectedAppAlertControllerFor_block_invoke_cold_1();
    }
  }
}

void ___SBUnhideProtectedAppAlertControllerFor_block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_5();
  _os_log_error_impl(&dword_1D85BA000, v0, OS_LOG_TYPE_ERROR, "Error unhiding subject when adding to home screen: %@ %@", v1, 0x16u);
}

@end