@interface NSString(ICQUI)
- (uint64_t)icqui_isCFUSkipPath;
- (uint64_t)icqui_isChangeStoragePlanPath;
- (uint64_t)icqui_isCurrentDeviceBackupPath;
- (uint64_t)icqui_isDeviceOffersPath;
- (uint64_t)icqui_isLocalDeviceBackupPath;
- (uint64_t)icqui_isPhotosPath;
- (uint64_t)icqui_isReviewLargeFilesPath;
- (uint64_t)icqui_isStorageUpgradePath;
@end

@implementation NSString(ICQUI)

- (uint64_t)icqui_isChangeStoragePlanPath
{
  return [a1 containsString:@"CHANGE_STORAGE_PLAN"];
}

- (uint64_t)icqui_isDeviceOffersPath
{
  return [a1 containsString:@"DEVICE_OFFERS"];
}

- (uint64_t)icqui_isStorageUpgradePath
{
  return [a1 containsString:@"STORAGE_UPGRADE"];
}

- (uint64_t)icqui_isPhotosPath
{
  v1 = [a1 lastPathComponent];
  uint64_t v2 = [v1 isEqualToString:@"PHOTOS"];

  return v2;
}

- (uint64_t)icqui_isCurrentDeviceBackupPath
{
  v1 = [a1 lastPathComponent];
  uint64_t v2 = [v1 isEqualToString:@"CURRENT_DEVICE_BACKUP"];

  return v2;
}

- (uint64_t)icqui_isLocalDeviceBackupPath
{
  v1 = [a1 lastPathComponent];
  uint64_t v2 = [v1 isEqualToString:@"LOCAL_BACKUP"];

  return v2;
}

- (uint64_t)icqui_isReviewLargeFilesPath
{
  v1 = [a1 lastPathComponent];
  uint64_t v2 = [v1 isEqualToString:@"REVIEW_LARGE_FILES"];

  return v2;
}

- (uint64_t)icqui_isCFUSkipPath
{
  v1 = [a1 lastPathComponent];
  uint64_t v2 = [v1 isEqualToString:*MEMORY[0x263F88818]];

  return v2;
}

@end