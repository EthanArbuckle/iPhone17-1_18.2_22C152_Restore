@interface TLAlert
@end

@implementation TLAlert

void __71__TLAlert_UserNotificationsCore__unc_toneLibraryAlertTypeForSectionID___block_invoke()
{
  v3[6] = *MEMORY[0x263EF8340];
  v2[0] = @"com.apple.mobilemail";
  v2[1] = @"com.apple.MobileSMS";
  v3[0] = &unk_270CE1250;
  v3[1] = &unk_270CE1268;
  v2[2] = @"com.apple.mobilephone";
  v2[3] = @"com.apple.facetime";
  v3[2] = &unk_270CE1280;
  v3[3] = &unk_270CE1280;
  v2[4] = @"com.apple.mobilecal";
  v2[5] = @"com.apple.reminders";
  v3[4] = &unk_270CE1298;
  v3[5] = &unk_270CE12B0;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:6];
  v1 = (void *)unc_toneLibraryAlertTypeForSectionID____sectionIDToAlertType;
  unc_toneLibraryAlertTypeForSectionID____sectionIDToAlertType = v0;
}

@end