@interface CKRecordZoneID(WBSCKRecordZoneIDExtras)
+ (id)safari_bookmarksRecordZoneID;
+ (id)safari_tabGroupSecondaryRecordZoneIDWithRootRecordName:()WBSCKRecordZoneIDExtras;
+ (id)safari_tabGroupsRecordZoneID;
+ (uint64_t)safari_tabGroupSecondaryRecordZoneNameWithRootRecordName:()WBSCKRecordZoneIDExtras;
- (id)safari_tabGroupRootRecordName;
- (uint64_t)safari_isInPrivateDatabase;
- (uint64_t)safari_isTabGroupSecondaryRecordZoneID;
@end

@implementation CKRecordZoneID(WBSCKRecordZoneIDExtras)

+ (id)safari_bookmarksRecordZoneID
{
  if (safari_bookmarksRecordZoneID_onceToken != -1) {
    dispatch_once(&safari_bookmarksRecordZoneID_onceToken, &__block_literal_global_13);
  }
  v0 = (void *)safari_bookmarksRecordZoneID_zoneID;
  return v0;
}

+ (id)safari_tabGroupsRecordZoneID
{
  if (safari_tabGroupsRecordZoneID_onceToken != -1) {
    dispatch_once(&safari_tabGroupsRecordZoneID_onceToken, &__block_literal_global_9);
  }
  v0 = (void *)safari_tabGroupsRecordZoneID_zoneID;
  return v0;
}

+ (uint64_t)safari_tabGroupSecondaryRecordZoneNameWithRootRecordName:()WBSCKRecordZoneIDExtras
{
  return objc_msgSend(@"TabGroup_", "stringByAppendingString:");
}

+ (id)safari_tabGroupSecondaryRecordZoneIDWithRootRecordName:()WBSCKRecordZoneIDExtras
{
  v4 = (objc_class *)MEMORY[0x1E4F1A328];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = objc_msgSend(a1, "safari_tabGroupSecondaryRecordZoneNameWithRootRecordName:", v5);

  v8 = (void *)[v6 initWithZoneName:v7 ownerName:*MEMORY[0x1E4F19C00]];
  return v8;
}

- (uint64_t)safari_isTabGroupSecondaryRecordZoneID
{
  v1 = [a1 zoneName];
  uint64_t v2 = [v1 hasPrefix:@"TabGroup_"];

  return v2;
}

- (id)safari_tabGroupRootRecordName
{
  v1 = [a1 zoneName];
  uint64_t v2 = objc_msgSend(v1, "safari_substringFromPrefix:", @"TabGroup_");

  return v2;
}

- (uint64_t)safari_isInPrivateDatabase
{
  v1 = [a1 ownerName];
  uint64_t v2 = [v1 isEqualToString:*MEMORY[0x1E4F19C00]];

  return v2;
}

@end