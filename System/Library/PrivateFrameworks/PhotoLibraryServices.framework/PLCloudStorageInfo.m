@interface PLCloudStorageInfo
+ (id)storageInfoWithTotal:(int64_t)a3 available:(int64_t)a4 used:(int64_t)a5 cameraRollBackupBytes:(int64_t)a6 iCloudPhotosSize:(int64_t)a7 hasMaxQuotaTier:(BOOL)a8;
- (BOOL)hasMaxQuotaTier;
- (PLCloudStorageInfo)initWithTotalQuotaBytes:(int64_t)a3 totalAvailableBytes:(int64_t)a4 totalUsedBytes:(int64_t)a5 cameraRollBackupBytes:(int64_t)a6 iCloudPhotosSize:(int64_t)a7 hasMaxQuotaTier:(BOOL)a8;
- (id)description;
- (int64_t)availableBytes;
- (int64_t)cameraRollBackupBytes;
- (int64_t)iCloudPhotosBytes;
- (int64_t)totalBytes;
- (int64_t)usedBytes;
@end

@implementation PLCloudStorageInfo

- (BOOL)hasMaxQuotaTier
{
  return self->_hasMaxQuotaTier;
}

- (int64_t)iCloudPhotosBytes
{
  return self->_iCloudPhotosBytes;
}

- (int64_t)cameraRollBackupBytes
{
  return self->_cameraRollBackupBytes;
}

- (int64_t)usedBytes
{
  return self->_usedBytes;
}

- (int64_t)availableBytes
{
  return self->_availableBytes;
}

- (int64_t)totalBytes
{
  return self->_totalBytes;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"Total bytes: %llu Available byte: %llu Used bytes: %llu Camera roll bytes: %llu iCloud Photos bytes: %llu Max quota tier %d", self->_totalBytes, self->_availableBytes, self->_usedBytes, self->_cameraRollBackupBytes, self->_iCloudPhotosBytes, self->_hasMaxQuotaTier);
}

- (PLCloudStorageInfo)initWithTotalQuotaBytes:(int64_t)a3 totalAvailableBytes:(int64_t)a4 totalUsedBytes:(int64_t)a5 cameraRollBackupBytes:(int64_t)a6 iCloudPhotosSize:(int64_t)a7 hasMaxQuotaTier:(BOOL)a8
{
  v15.receiver = self;
  v15.super_class = (Class)PLCloudStorageInfo;
  result = [(PLCloudStorageInfo *)&v15 init];
  if (result)
  {
    result->_totalBytes = a3;
    result->_availableBytes = a4;
    result->_usedBytes = a5;
    result->_cameraRollBackupBytes = a6;
    result->_iCloudPhotosBytes = a7;
    result->_hasMaxQuotaTier = a8;
  }
  return result;
}

+ (id)storageInfoWithTotal:(int64_t)a3 available:(int64_t)a4 used:(int64_t)a5 cameraRollBackupBytes:(int64_t)a6 iCloudPhotosSize:(int64_t)a7 hasMaxQuotaTier:(BOOL)a8
{
  v8 = [[PLCloudStorageInfo alloc] initWithTotalQuotaBytes:a3 totalAvailableBytes:a4 totalUsedBytes:a5 cameraRollBackupBytes:a6 iCloudPhotosSize:a7 hasMaxQuotaTier:a8];
  return v8;
}

@end