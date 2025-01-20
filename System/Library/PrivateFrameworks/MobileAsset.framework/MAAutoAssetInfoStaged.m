@interface MAAutoAssetInfoStaged
+ (BOOL)supportsSecureCoding;
- (MAAutoAssetInfoStaged)initWithByGroupTotalStagedBytes:(id)a3 withByGroupAssetsSuccessfullyStaged:(id)a4;
- (MAAutoAssetInfoStaged)initWithCoder:(id)a3;
- (MAAutoAssetInfoStaged)initWithTotalStagedBytes:(int64_t)a3 withAssetsSuccessfullyStaged:(unint64_t)a4;
- (MAAutoAssetInfoStaged)initWithTotalStagedBytes:(int64_t)a3 withAssetsSuccessfullyStaged:(unint64_t)a4 withByGroupTotalStagedBytes:(id)a5 withByGroupAssetsSuccessfullyStaged:(id)a6;
- (NSDictionary)byGroupAssetsSuccessfullyStaged;
- (NSDictionary)byGroupTotalStagedBytes;
- (id)summary;
- (int64_t)totalStagedBytes;
- (unint64_t)assetsSuccessfullyStaged;
- (void)encodeWithCoder:(id)a3;
- (void)fullDescription:(id)a3 usingLogger:(id)a4;
@end

@implementation MAAutoAssetInfoStaged

- (MAAutoAssetInfoStaged)initWithByGroupTotalStagedBytes:(id)a3 withByGroupAssetsSuccessfullyStaged:(id)a4
{
  return [(MAAutoAssetInfoStaged *)self initWithTotalStagedBytes:0 withAssetsSuccessfullyStaged:0 withByGroupTotalStagedBytes:a3 withByGroupAssetsSuccessfullyStaged:a4];
}

- (MAAutoAssetInfoStaged)initWithTotalStagedBytes:(int64_t)a3 withAssetsSuccessfullyStaged:(unint64_t)a4
{
  return [(MAAutoAssetInfoStaged *)self initWithTotalStagedBytes:a3 withAssetsSuccessfullyStaged:a4 withByGroupTotalStagedBytes:0 withByGroupAssetsSuccessfullyStaged:0];
}

- (MAAutoAssetInfoStaged)initWithTotalStagedBytes:(int64_t)a3 withAssetsSuccessfullyStaged:(unint64_t)a4 withByGroupTotalStagedBytes:(id)a5 withByGroupAssetsSuccessfullyStaged:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)MAAutoAssetInfoStaged;
  v13 = [(MAAutoAssetInfoStaged *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_totalStagedBytes = a3;
    v13->_assetsSuccessfullyStaged = a4;
    objc_storeStrong((id *)&v13->_byGroupTotalStagedBytes, a5);
    objc_storeStrong((id *)&v14->_byGroupAssetsSuccessfullyStaged, a6);
  }

  return v14;
}

- (MAAutoAssetInfoStaged)initWithCoder:(id)a3
{
  v15[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MAAutoAssetInfoStaged;
  v5 = [(MAAutoAssetInfoStaged *)&v14 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v15[2] = objc_opt_class();
    v15[3] = objc_opt_class();
    v15[4] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:5];
    v8 = [v6 setWithArray:v7];

    v5->_totalStagedBytes = [v4 decodeIntegerForKey:@"totalStagedBytes"];
    v5->_assetsSuccessfullyStaged = [v4 decodeIntegerForKey:@"assetsSuccessfullyStaged"];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"byGroupTotalStagedBytes"];
    byGroupTotalStagedBytes = v5->_byGroupTotalStagedBytes;
    v5->_byGroupTotalStagedBytes = (NSDictionary *)v9;

    uint64_t v11 = [v4 decodeObjectOfClasses:v8 forKey:@"byGroupAssetsSuccessfullyStaged"];
    byGroupAssetsSuccessfullyStaged = v5->_byGroupAssetsSuccessfullyStaged;
    v5->_byGroupAssetsSuccessfullyStaged = (NSDictionary *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetInfoStaged totalStagedBytes](self, "totalStagedBytes"), @"totalStagedBytes");
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetInfoStaged assetsSuccessfullyStaged](self, "assetsSuccessfullyStaged"), @"assetsSuccessfullyStaged");
  v5 = [(MAAutoAssetInfoStaged *)self byGroupTotalStagedBytes];
  [v4 encodeObject:v5 forKey:@"byGroupTotalStagedBytes"];

  id v6 = [(MAAutoAssetInfoStaged *)self byGroupAssetsSuccessfullyStaged];
  [v4 encodeObject:v6 forKey:@"byGroupAssetsSuccessfullyStaged"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)summary
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [(MAAutoAssetInfoStaged *)self byGroupTotalStagedBytes];

  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id obj = [(MAAutoAssetInfoStaged *)self byGroupTotalStagedBytes];
    uint64_t v19 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v19)
    {
      char v6 = 1;
      uint64_t v18 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v21 != v18) {
            objc_enumerationMutation(obj);
          }
          v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v9 = [(MAAutoAssetInfoStaged *)self byGroupTotalStagedBytes];
          v10 = [v9 safeObjectForKey:v8 ofClass:objc_opt_class()];

          uint64_t v11 = [(MAAutoAssetInfoStaged *)self byGroupAssetsSuccessfullyStaged];
          id v12 = [v11 safeObjectForKey:v8 ofClass:objc_opt_class()];

          v13 = v8;
          objc_super v14 = @"REQUIRED";
          if (([MEMORY[0x1E4FA56C0] stringIsEqual:v13 to:@"STAGE_GROUP_REQUIRED"] & 1) != 0
            || (objc_super v14 = @"OPTIONAL",
                [MEMORY[0x1E4FA56C0] stringIsEqual:v13 to:@"STAGE_GROUP_OPTIONAL"]))
          {

            v13 = v14;
          }
          if ((v6 & 1) == 0)
          {
            [v4 appendString:@","];
            [v5 appendString:@","];
          }
          [v4 appendFormat:@"%@:%llu", v13, objc_msgSend(v10, "unsignedLongLongValue")];
          [v5 appendFormat:@"%@:%llu", v13, objc_msgSend(v12, "unsignedLongLongValue")];

          char v6 = 0;
        }
        char v6 = 0;
        uint64_t v19 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v19);
    }

    v15 = [NSString stringWithFormat:@"staged[BY-GROUP]|byGroupAttributes:%@|byGroupExpectedBytes:%@", v4, v5];
  }
  else
  {
    v15 = objc_msgSend(NSString, "stringWithFormat:", @"staged|totalStagedBytes:%ld|assetsSuccessfullyStaged:%lu", -[MAAutoAssetInfoStaged totalStagedBytes](self, "totalStagedBytes"), -[MAAutoAssetInfoStaged assetsSuccessfullyStaged](self, "assetsSuccessfullyStaged"));
  }
  return v15;
}

- (void)fullDescription:(id)a3 usingLogger:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x1E4FA56C0] stringIsEqual:v6 to:@"MA-AUTO-STAGE(REPLY):DOWNLOAD_GROUPS"])
  {
    v8 = @"DOWNLOAD-GROUPS-REPLY";
  }
  else if ([MEMORY[0x1E4FA56C0] stringIsEqual:v6 to:@"MA-AUTO-STAGE(REPLY):DOWNLOAD_ALL"])
  {
    v8 = @"DOWNLOAD-ALL-REPLY";
  }
  else
  {
    v8 = @"STAGED";
  }
  uint64_t v9 = [v7 oslog];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138543874;
    v24 = v8;
    __int16 v25 = 2048;
    int64_t v26 = [(MAAutoAssetInfoStaged *)self totalStagedBytes];
    __int16 v27 = 2048;
    unint64_t v28 = [(MAAutoAssetInfoStaged *)self assetsSuccessfullyStaged];
    _os_log_impl(&dword_1B275B000, v9, OS_LOG_TYPE_DEFAULT, "\n>%{public}@> totalStagedBytes:%llu | assetsSuccessfullyStaged:%llu", (uint8_t *)&v23, 0x20u);
  }

  uint64_t v10 = [(MAAutoAssetInfoStaged *)self byGroupTotalStagedBytes];
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    id v12 = [(MAAutoAssetInfoStaged *)self byGroupTotalStagedBytes];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      objc_super v14 = [v7 oslog];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = [(MAAutoAssetInfoStaged *)self byGroupTotalStagedBytes];
        int v23 = 138543618;
        v24 = v8;
        __int16 v25 = 2114;
        int64_t v26 = (int64_t)v15;
        _os_log_impl(&dword_1B275B000, v14, OS_LOG_TYPE_DEFAULT, "\n>%{public}@> byGroupTotalStagedBytes:\n%{public}@", (uint8_t *)&v23, 0x16u);
      }
    }
  }
  uint64_t v16 = [(MAAutoAssetInfoStaged *)self byGroupAssetsSuccessfullyStaged];
  if (v16)
  {
    v17 = (void *)v16;
    uint64_t v18 = [(MAAutoAssetInfoStaged *)self byGroupAssetsSuccessfullyStaged];
    uint64_t v19 = [v18 count];

    if (v19)
    {
      long long v20 = [v7 oslog];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        long long v21 = [(MAAutoAssetInfoStaged *)self byGroupAssetsSuccessfullyStaged];
        long long v22 = [v21 safeSummary];
        int v23 = 138543618;
        v24 = v8;
        __int16 v25 = 2114;
        int64_t v26 = (int64_t)v22;
        _os_log_impl(&dword_1B275B000, v20, OS_LOG_TYPE_DEFAULT, "\n>%{public}@> byGroupAssetsSuccessfullyStaged:\n%{public}@", (uint8_t *)&v23, 0x16u);
      }
    }
  }
}

- (int64_t)totalStagedBytes
{
  return self->_totalStagedBytes;
}

- (unint64_t)assetsSuccessfullyStaged
{
  return self->_assetsSuccessfullyStaged;
}

- (NSDictionary)byGroupTotalStagedBytes
{
  return self->_byGroupTotalStagedBytes;
}

- (NSDictionary)byGroupAssetsSuccessfullyStaged
{
  return self->_byGroupAssetsSuccessfullyStaged;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_byGroupAssetsSuccessfullyStaged, 0);
  objc_storeStrong((id *)&self->_byGroupTotalStagedBytes, 0);
}

@end