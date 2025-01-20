@interface TLAlert(UserNotificationsCore)
+ (uint64_t)unc_toneLibraryAlertTypeForSectionID:()UserNotificationsCore;
@end

@implementation TLAlert(UserNotificationsCore)

+ (uint64_t)unc_toneLibraryAlertTypeForSectionID:()UserNotificationsCore
{
  uint64_t v3 = unc_toneLibraryAlertTypeForSectionID__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&unc_toneLibraryAlertTypeForSectionID__onceToken, &__block_literal_global_6);
  }
  v5 = [(id)unc_toneLibraryAlertTypeForSectionID____sectionIDToAlertType objectForKey:v4];

  uint64_t v6 = [v5 integerValue];
  return v6;
}

@end