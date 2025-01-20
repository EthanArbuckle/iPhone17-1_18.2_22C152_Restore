@interface ButtonSpecificationSampleForFullLevel
@end

@implementation ButtonSpecificationSampleForFullLevel

void ___ButtonSpecificationSampleForFullLevel_block_invoke()
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v0 = objc_opt_new();
  v7[0] = @"com.apple.mobilemail";
  uint64_t v1 = MEMORY[0x1E4F1CC08];
  v2 = +[ICQLink linkWithText:@"Cannot Send or Receive Mail – Upgrade Storage [ENG]" options:1 action:3 parameters:MEMORY[0x1E4F1CC08]];
  v8[0] = v2;
  v7[1] = @"com.apple.iCloudDriveApp";
  v3 = +[ICQLink linkWithText:@"iCloud Storage is Full – Upgrade Storage [ENG]" options:1 action:3 parameters:v1];
  v8[1] = v3;
  v7[2] = @"com.apple.icloud.quota.ICQ-Adopt";
  v4 = +[ICQLink linkWithText:@"iCloud Storage is Full – Upgrade Storage [ENG]" options:1 action:3 parameters:v1];
  v8[2] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];
  [v0 setLinkForBundleIdentifier:v5];

  v6 = (void *)_ButtonSpecificationSampleForFullLevel_sButtonSpecification;
  _ButtonSpecificationSampleForFullLevel_sButtonSpecification = (uint64_t)v0;
}

@end