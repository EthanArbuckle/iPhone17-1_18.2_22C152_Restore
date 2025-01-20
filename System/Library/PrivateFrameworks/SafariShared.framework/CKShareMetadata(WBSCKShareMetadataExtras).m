@interface CKShareMetadata(WBSCKShareMetadataExtras)
- (uint64_t)safari_supportsSharedTabGroups;
@end

@implementation CKShareMetadata(WBSCKShareMetadataExtras)

- (uint64_t)safari_supportsSharedTabGroups
{
  v1 = [a1 share];
  v2 = [v1 recordID];
  v3 = [v2 zoneID];
  uint64_t v4 = objc_msgSend(v3, "safari_isTabGroupSecondaryRecordZoneID");

  return v4;
}

@end