@interface CKRecord(CloudSettingsExtras)
- (id)safari_encodedRecordData;
- (uint64_t)safari_isCloudBackgroundImageRecord;
- (uint64_t)safari_isCloudPerSiteSettingRecord;
- (uint64_t)safari_isCloudSettingRecord;
@end

@implementation CKRecord(CloudSettingsExtras)

- (uint64_t)safari_isCloudPerSiteSettingRecord
{
  v1 = [a1 recordType];
  uint64_t v2 = [v1 isEqualToString:@"PerSiteSetting"];

  return v2;
}

- (uint64_t)safari_isCloudSettingRecord
{
  v1 = [a1 recordType];
  uint64_t v2 = [v1 isEqualToString:@"Setting"];

  return v2;
}

- (uint64_t)safari_isCloudBackgroundImageRecord
{
  v1 = [a1 recordID];
  uint64_t v2 = [v1 recordName];
  uint64_t v3 = [v2 isEqualToString:@"StartPageBackgroundImage"];

  return v3;
}

- (id)safari_encodedRecordData
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [a1 encodeWithCoder:v2];
  uint64_t v3 = [v2 encodedData];

  return v3;
}

@end