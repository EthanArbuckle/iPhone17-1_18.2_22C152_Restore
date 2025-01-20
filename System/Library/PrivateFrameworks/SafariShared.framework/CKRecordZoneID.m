@interface CKRecordZoneID
@end

@implementation CKRecordZoneID

void __71__CKRecordZoneID_WBSCKRecordZoneIDExtras__safari_bookmarksRecordZoneID__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1A328]);
  uint64_t v1 = [v0 initWithZoneName:@"Bookmarks" ownerName:*MEMORY[0x1E4F19C00]];
  v2 = (void *)safari_bookmarksRecordZoneID_zoneID;
  safari_bookmarksRecordZoneID_zoneID = v1;
}

void __71__CKRecordZoneID_WBSCKRecordZoneIDExtras__safari_tabGroupsRecordZoneID__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1A328]);
  uint64_t v1 = [v0 initWithZoneName:@"TabGroups" ownerName:*MEMORY[0x1E4F19C00]];
  v2 = (void *)safari_tabGroupsRecordZoneID_zoneID;
  safari_tabGroupsRecordZoneID_zoneID = v1;
}

@end