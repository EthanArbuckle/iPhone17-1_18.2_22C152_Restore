@interface UIAlertController(SleepHealthUI)
+ (uint64_t)hksp_notificationsWontFireAlertControllerWithLocalizedTitle:()SleepHealthUI localizedDismiss:completion:;
@end

@implementation UIAlertController(SleepHealthUI)

+ (uint64_t)hksp_notificationsWontFireAlertControllerWithLocalizedTitle:()SleepHealthUI localizedDismiss:completion:
{
  return objc_msgSend(MEMORY[0x1E4FB1418], "notificationsWontFireAlertControllerWithLocalizedTitle:localizedDismiss:completion:");
}

@end