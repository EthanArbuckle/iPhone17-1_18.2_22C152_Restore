@interface UIKitDragAndDropStatistics
@end

@implementation UIKitDragAndDropStatistics

void __92___UIKitDragAndDropStatistics_incrementUIKitScalarValueForKnownInternalAppsForKey_bundleID___block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"com.apple.MobileAddressBook", @"com.apple.DocumentsApp", @"com.apple.mobilecal", @"com.apple.Maps", @"com.apple.MailCompositionService", @"com.apple.MobileSMS", @"com.apple.mobilesafari", @"com.apple.mobileslideshow", @"com.apple.Music", @"com.apple.reminders", @"com.apple.iBooks", @"com.apple.mobilemail", @"com.apple.news", @"com.apple.mobilenotes", @"com.apple.iCloudDriveApp", 0);
  v1 = (void *)qword_1EB264D38;
  qword_1EB264D38 = v0;
}

@end