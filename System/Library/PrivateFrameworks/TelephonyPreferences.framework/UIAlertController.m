@interface UIAlertController
@end

@implementation UIAlertController

void __82__UIAlertController_TelephonyPreferences__tps_tapToRadarAlertControllerWithError___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __82__UIAlertController_TelephonyPreferences__tps_tapToRadarAlertControllerWithError___block_invoke_2;
  v4[3] = &unk_1E6EB2430;
  id v5 = v3;
  [v2 openURL:v5 configuration:0 completionHandler:v4];
}

void __82__UIAlertController_TelephonyPreferences__tps_tapToRadarAlertControllerWithError___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = TPSLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __82__UIAlertController_TelephonyPreferences__tps_tapToRadarAlertControllerWithError___block_invoke_2_cold_1(a1, (uint64_t)v4, v5);
    }
  }
}

void __82__UIAlertController_TelephonyPreferences__tps_tapToRadarAlertControllerWithError___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1E4DD4000, log, OS_LOG_TYPE_ERROR, "Opening URL %@ failed with error %@", (uint8_t *)&v4, 0x16u);
}

@end