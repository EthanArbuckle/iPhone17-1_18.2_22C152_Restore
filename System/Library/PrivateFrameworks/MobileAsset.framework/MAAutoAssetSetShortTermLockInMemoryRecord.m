@interface MAAutoAssetSetShortTermLockInMemoryRecord
- (BOOL)isCurrentlyValid;
- (MAAutoAssetSetShortTermLockInMemoryRecord)initWithPathAndSetStatus:(id)a3 setStatus:(id)a4;
- (MAAutoAssetSetStatus)setStatus;
- (NSDate)recordDate;
- (NSString)lockerFileRealPath;
- (id)summary;
- (void)isCurrentlyValid;
@end

@implementation MAAutoAssetSetShortTermLockInMemoryRecord

- (NSString)lockerFileRealPath
{
  return self->_lockerFileRealPath;
}

- (MAAutoAssetSetStatus)setStatus
{
  return self->_setStatus;
}

- (BOOL)isCurrentlyValid
{
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  v4 = [(MAAutoAssetSetShortTermLockInMemoryRecord *)self lockerFileRealPath];
  id v15 = 0;
  v5 = [v3 attributesOfItemAtPath:v4 error:&v15];
  id v6 = v15;

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7)
  {
    v8 = [MEMORY[0x1E4FA56C8] sharedLogger];
    v9 = [v8 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(MAAutoAssetSetShortTermLockInMemoryRecord *)self isCurrentlyValid];
    }
LABEL_11:
    BOOL v12 = 0;
    goto LABEL_12;
  }
  uint64_t v10 = [v5 objectForKey:*MEMORY[0x1E4F28310]];
  if (!v10)
  {
    v13 = [MEMORY[0x1E4FA56C8] sharedLogger];
    v9 = [v13 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(MAAutoAssetSetShortTermLockInMemoryRecord *)self isCurrentlyValid];
    }
    goto LABEL_11;
  }
  v9 = v10;
  v11 = [(MAAutoAssetSetShortTermLockInMemoryRecord *)self recordDate];
  BOOL v12 = [v9 compare:v11] == -1;

LABEL_12:
  return v12;
}

- (NSDate)recordDate
{
  return self->_recordDate;
}

- (MAAutoAssetSetShortTermLockInMemoryRecord)initWithPathAndSetStatus:(id)a3 setStatus:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MAAutoAssetSetShortTermLockInMemoryRecord;
  v9 = [(MAAutoAssetSetShortTermLockInMemoryRecord *)&v14 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_lockerFileRealPath, a3);
    objc_storeStrong((id *)&v10->_setStatus, a4);
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
    recordDate = v10->_recordDate;
    v10->_recordDate = (NSDate *)v11;
  }
  return v10;
}

- (id)summary
{
  v3 = NSString;
  v4 = [(MAAutoAssetSetShortTermLockInMemoryRecord *)self lockerFileRealPath];
  v5 = [(MAAutoAssetSetShortTermLockInMemoryRecord *)self recordDate];
  id v6 = [v5 description];
  id v7 = [v3 stringWithFormat:@"LockerFilePath: %@ RecordCreatedDate: %@", v4, v6];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setStatus, 0);
  objc_storeStrong((id *)&self->_recordDate, 0);
  objc_storeStrong((id *)&self->_lockerFileRealPath, 0);
}

- (void)isCurrentlyValid
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 summary];
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1B275B000, a2, OS_LOG_TYPE_ERROR, "[MAAutoAssetSetShortTermLockInMemoryRecord]: Unable to determine modification date for lock file tracked by %@", (uint8_t *)&v4, 0xCu);
}

@end