@interface MAAutoAssetInfoStaging
+ (BOOL)supportsSecureCoding;
- (MAAutoAssetInfoStaging)initWithAvailableForStaging:(id)a3 withTotalExpectedBytes:(unint64_t)a4;
- (MAAutoAssetInfoStaging)initWithByGroupAvailableForStaging:(id)a3 withByGroupTotalExpectedBytes:(id)a4;
- (MAAutoAssetInfoStaging)initWithCoder:(id)a3;
- (MAAutoAssetInfoStaging)initWithUpdateAttributes:(id)a3;
- (MAAutoAssetInfoStaging)initWithUpdateAttributes:(id)a3 withByGroupAvailableForStaging:(id)a4 withAvailableForStaging:(id)a5 withByGroupTotalExpectedBytes:(id)a6 withTotalExpectedBytes:(unint64_t)a7;
- (MAAutoAssetInfoStaging)initWithUpdateAttributes:(id)a3 withByGroupAvailableForStaging:(id)a4 withByGroupTotalExpectedBytes:(id)a5;
- (NSDictionary)allAvailableForStagingAttributes;
- (NSDictionary)byGroupAvailableForStagingAttributes;
- (NSDictionary)byGroupTotalExpectedBytes;
- (NSDictionary)updateAttributes;
- (id)description;
- (id)summary;
- (unint64_t)totalExpectedBytes;
- (void)encodeWithCoder:(id)a3;
- (void)fullDescription:(id)a3 usingLogger:(id)a4;
@end

@implementation MAAutoAssetInfoStaging

- (MAAutoAssetInfoStaging)initWithUpdateAttributes:(id)a3 withByGroupAvailableForStaging:(id)a4 withByGroupTotalExpectedBytes:(id)a5
{
  return [(MAAutoAssetInfoStaging *)self initWithUpdateAttributes:a3 withByGroupAvailableForStaging:a4 withAvailableForStaging:0 withByGroupTotalExpectedBytes:a5 withTotalExpectedBytes:0];
}

- (MAAutoAssetInfoStaging)initWithByGroupAvailableForStaging:(id)a3 withByGroupTotalExpectedBytes:(id)a4
{
  return [(MAAutoAssetInfoStaging *)self initWithUpdateAttributes:0 withByGroupAvailableForStaging:a3 withAvailableForStaging:0 withByGroupTotalExpectedBytes:a4 withTotalExpectedBytes:0];
}

- (MAAutoAssetInfoStaging)initWithAvailableForStaging:(id)a3 withTotalExpectedBytes:(unint64_t)a4
{
  return [(MAAutoAssetInfoStaging *)self initWithUpdateAttributes:0 withByGroupAvailableForStaging:0 withAvailableForStaging:a3 withByGroupTotalExpectedBytes:0 withTotalExpectedBytes:a4];
}

- (MAAutoAssetInfoStaging)initWithUpdateAttributes:(id)a3
{
  return [(MAAutoAssetInfoStaging *)self initWithUpdateAttributes:a3 withByGroupAvailableForStaging:0 withAvailableForStaging:0 withByGroupTotalExpectedBytes:0 withTotalExpectedBytes:0];
}

- (MAAutoAssetInfoStaging)initWithUpdateAttributes:(id)a3 withByGroupAvailableForStaging:(id)a4 withAvailableForStaging:(id)a5 withByGroupTotalExpectedBytes:(id)a6 withTotalExpectedBytes:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)MAAutoAssetInfoStaging;
  v17 = [(MAAutoAssetInfoStaging *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_updateAttributes, a3);
    objc_storeStrong((id *)&v18->_byGroupAvailableForStagingAttributes, a4);
    objc_storeStrong((id *)&v18->_allAvailableForStagingAttributes, a5);
    objc_storeStrong((id *)&v18->_byGroupTotalExpectedBytes, a6);
    v18->_totalExpectedBytes = a7;
  }

  return v18;
}

- (MAAutoAssetInfoStaging)initWithCoder:(id)a3
{
  v27[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MAAutoAssetInfoStaging;
  v5 = [(MAAutoAssetInfoStaging *)&v24 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    v27[2] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:3];
    v8 = [v6 setWithArray:v7];

    v9 = (void *)MEMORY[0x1E4F1CAD0];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    v26[2] = objc_opt_class();
    v26[3] = objc_opt_class();
    v26[4] = objc_opt_class();
    v26[5] = objc_opt_class();
    v26[6] = objc_opt_class();
    v26[7] = objc_opt_class();
    v26[8] = objc_opt_class();
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:9];
    v11 = [v9 setWithArray:v10];

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    v25[2] = objc_opt_class();
    v25[3] = objc_opt_class();
    v25[4] = objc_opt_class();
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:5];
    id v14 = [v12 setWithArray:v13];

    uint64_t v15 = [v4 decodeObjectOfClasses:v8 forKey:@"updateAttributes"];
    updateAttributes = v5->_updateAttributes;
    v5->_updateAttributes = (NSDictionary *)v15;

    uint64_t v17 = [v4 decodeObjectOfClasses:v11 forKey:@"byGroupAvailableForStagingAttributes"];
    byGroupAvailableForStagingAttributes = v5->_byGroupAvailableForStagingAttributes;
    v5->_byGroupAvailableForStagingAttributes = (NSDictionary *)v17;

    uint64_t v19 = [v4 decodeObjectOfClasses:v11 forKey:@"allAvailableForStagingAttributes"];
    allAvailableForStagingAttributes = v5->_allAvailableForStagingAttributes;
    v5->_allAvailableForStagingAttributes = (NSDictionary *)v19;

    uint64_t v21 = [v4 decodeObjectOfClasses:v14 forKey:@"byGroupTotalExpectedBytes"];
    byGroupTotalExpectedBytes = v5->_byGroupTotalExpectedBytes;
    v5->_byGroupTotalExpectedBytes = (NSDictionary *)v21;

    v5->_totalExpectedBytes = [v4 decodeIntegerForKey:@"totalExpectedBytes"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = [(MAAutoAssetInfoStaging *)self updateAttributes];
  [v8 encodeObject:v4 forKey:@"updateAttributes"];

  v5 = [(MAAutoAssetInfoStaging *)self byGroupAvailableForStagingAttributes];
  [v8 encodeObject:v5 forKey:@"byGroupAvailableForStagingAttributes"];

  v6 = [(MAAutoAssetInfoStaging *)self allAvailableForStagingAttributes];
  [v8 encodeObject:v6 forKey:@"allAvailableForStagingAttributes"];

  v7 = [(MAAutoAssetInfoStaging *)self byGroupTotalExpectedBytes];
  [v8 encodeObject:v7 forKey:@"byGroupTotalExpectedBytes"];

  objc_msgSend(v8, "encodeInteger:forKey:", -[MAAutoAssetInfoStaging totalExpectedBytes](self, "totalExpectedBytes"), @"totalExpectedBytes");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  objc_super v20 = NSString;
  v22 = [(MAAutoAssetInfoStaging *)self summary];
  id v4 = [(MAAutoAssetInfoStaging *)self updateAttributes];
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v19 = [(MAAutoAssetInfoStaging *)self updateAttributes];
    objc_msgSend(v5, "safeSummaryForDictionary:");
    uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v21 = @"N";
  }
  v6 = [(MAAutoAssetInfoStaging *)self byGroupAvailableForStagingAttributes];
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E4F1C9E8];
    v18 = [(MAAutoAssetInfoStaging *)self byGroupAvailableForStagingAttributes];
    objc_msgSend(v7, "safeSummaryForDictionary:");
    id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = @"N";
  }
  v9 = [(MAAutoAssetInfoStaging *)self allAvailableForStagingAttributes];
  if (v9)
  {
    v10 = (void *)MEMORY[0x1E4F1C9E8];
    v2 = [(MAAutoAssetInfoStaging *)self allAvailableForStagingAttributes];
    v11 = [v10 safeSummaryForDictionary:v2];
  }
  else
  {
    v11 = @"N";
  }
  v12 = [(MAAutoAssetInfoStaging *)self byGroupTotalExpectedBytes];
  if (v12)
  {
    id v13 = (void *)MEMORY[0x1E4F1C9E8];
    id v14 = [(MAAutoAssetInfoStaging *)self byGroupTotalExpectedBytes];
    uint64_t v15 = [v13 safeSummaryForDictionary:v14];
    id v16 = [v20 stringWithFormat:@"%@|updateAttributes:%@|byGroupAvailableForStaging:%@|allAvailableForStaging:%@|byGroupTotalExpectedBytes:%@", v22, v21, v8, v11, v15];
  }
  else
  {
    id v16 = [v20 stringWithFormat:@"%@|updateAttributes:%@|byGroupAvailableForStaging:%@|allAvailableForStaging:%@|byGroupTotalExpectedBytes:%@", v22, v21, v8, v11, @"N"];
  }

  if (v9)
  {
  }
  if (v6)
  {
  }
  if (v4)
  {
  }
  return v16;
}

- (id)summary
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v3 = [(MAAutoAssetInfoStaging *)self updateAttributes];
  id v4 = [v3 safeObjectForKey:@"OSVersion" ofClass:objc_opt_class()];

  v5 = [(MAAutoAssetInfoStaging *)self updateAttributes];
  v6 = [v5 safeObjectForKey:@"Build" ofClass:objc_opt_class()];

  v7 = [(MAAutoAssetInfoStaging *)self updateAttributes];
  id v8 = [v7 safeObjectForKey:@"TrainName" ofClass:objc_opt_class()];

  v9 = [(MAAutoAssetInfoStaging *)self updateAttributes];
  v10 = [v9 safeObjectForKey:@"RestoreVersion" ofClass:objc_opt_class()];

  v11 = [(MAAutoAssetInfoStaging *)self updateAttributes];
  v12 = [v11 safeObjectForKey:@"GroupNames" ofClass:objc_opt_class()];

  v34 = v12;
  if (v12)
  {
    v30 = v10;
    v31 = v8;
    v32 = v6;
    v33 = v4;
    id v13 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    id v14 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = v12;
    uint64_t v15 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      char v17 = 1;
      uint64_t v36 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v38 != v36) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          objc_super v20 = [(MAAutoAssetInfoStaging *)self byGroupAvailableForStagingAttributes];
          uint64_t v21 = [v20 safeObjectForKey:v19 ofClass:objc_opt_class()];

          v22 = [(MAAutoAssetInfoStaging *)self byGroupTotalExpectedBytes];
          v23 = [v22 safeObjectForKey:v19 ofClass:objc_opt_class()];

          objc_super v24 = v19;
          v25 = @"REQUIRED";
          if (([MEMORY[0x1E4FA56C0] stringIsEqual:v24 to:@"STAGE_GROUP_REQUIRED"] & 1) != 0
            || (v25 = @"OPTIONAL",
                [MEMORY[0x1E4FA56C0] stringIsEqual:v24 to:@"STAGE_GROUP_OPTIONAL"]))
          {

            objc_super v24 = v25;
          }
          if ((v17 & 1) == 0)
          {
            [v13 appendString:@","];
            [v14 appendString:@","];
          }
          [v13 appendFormat:@"%@:%ld", v24, objc_msgSend(v21, "count")];
          [v14 appendFormat:@"%@:%llu", v24, objc_msgSend(v23, "unsignedLongLongValue")];

          char v17 = 0;
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
        char v17 = 0;
      }
      while (v16);
    }

    v10 = v30;
    id v8 = v31;
    v6 = v32;
    id v4 = v33;
    v26 = [NSString stringWithFormat:@"staging[BY-GROUP]|osVersion:%@|build:%@|trainName:%@|restoreVersion:%@|byGroupAttributes:%@|byGroupExpectedBytes:%@", v33, v32, v31, v30, v13, v14];
  }
  else
  {
    v27 = NSString;
    v28 = [(MAAutoAssetInfoStaging *)self allAvailableForStagingAttributes];
    v26 = [v27 stringWithFormat:@"staging[ALL]|osVersion:%@|build:%@|trainName:%@|restoreVersion:%@|allAvailableForStaging:%ld|totalExpectedBytes:%llu", v4, v6, v8, v10, objc_msgSend(v28, "count"), -[MAAutoAssetInfoStaging totalExpectedBytes](self, "totalExpectedBytes")];
  }
  return v26;
}

- (void)fullDescription:(id)a3 usingLogger:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x1E4FA56C0] stringIsEqual:v6 to:@"MA-AUTO-STAGE:DETERMINE_GROUPS_AVAILABLE_FOR_UPDATE"])
  {
    id v8 = @"DETERMINE-GROUPS-REQUEST";
  }
  else if ([MEMORY[0x1E4FA56C0] stringIsEqual:v6 to:@"MA-AUTO-STAGE:DETERMINE_ALL_AVAILABLE_FOR_UPDATE"])
  {
    id v8 = @"DETERMINE-ALL-REQUEST";
  }
  else if ([MEMORY[0x1E4FA56C0] stringIsEqual:v6 to:@"MA-AUTO-STAGE:DETERMINE_ALL_AVAILABLE"])
  {
    id v8 = @"DETERMINE-ALL-LEGACY-REQUEST";
  }
  else if ([MEMORY[0x1E4FA56C0] stringIsEqual:v6 to:@"MA-AUTO-STAGE:DOWNLOAD_GROUPS"])
  {
    id v8 = @"DOWNLOAD-GROUPS-REQUEST";
  }
  else if ([MEMORY[0x1E4FA56C0] stringIsEqual:v6 to:@"MA-AUTO-STAGE:DOWNLOAD_ALL"])
  {
    id v8 = @"DOWNLOAD-ALL-REQUEST";
  }
  else if ([MEMORY[0x1E4FA56C0] stringIsEqual:v6 to:@"MA-AUTO-STAGE(REPLY):DETERMINE_GROUPS_AVAILABLE_FOR_UPDATE"])
  {
    id v8 = @"DETERMINE-GROUPS-REPLY";
  }
  else if ([MEMORY[0x1E4FA56C0] stringIsEqual:v6 to:@"MA-AUTO-STAGE(REPLY):DETERMINE_ALL_AVAILABLE_FOR_UPDATE"])
  {
    id v8 = @"DETERMINE-ALL-REPLY";
  }
  else if ([MEMORY[0x1E4FA56C0] stringIsEqual:v6 to:@"MA-AUTO-STAGE(REPLY):DETERMINE_ALL_AVAILABLE"])
  {
    id v8 = @"DETERMINE-ALL-LEGACY-REPLY";
  }
  else
  {
    id v8 = @"STAGING";
  }
  v9 = [(MAAutoAssetInfoStaging *)self updateAttributes];

  if (v9)
  {
    v10 = [v7 oslog];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [(MAAutoAssetInfoStaging *)self updateAttributes];
      int v30 = 138543618;
      v31 = v8;
      __int16 v32 = 2114;
      unint64_t v33 = (unint64_t)v11;
      _os_log_impl(&dword_1B275B000, v10, OS_LOG_TYPE_DEFAULT, "\n>%{public}@> updateAttributes:\n%{public}@", (uint8_t *)&v30, 0x16u);
    }
  }
  v12 = [(MAAutoAssetInfoStaging *)self byGroupAvailableForStagingAttributes];

  if (v12)
  {
    id v13 = [(MAAutoAssetInfoStaging *)self byGroupAvailableForStagingAttributes];
    id v14 = [v13 safeObjectForKey:@"STAGE_GROUP_REQUIRED" ofClass:objc_opt_class()];

    uint64_t v15 = [(MAAutoAssetInfoStaging *)self byGroupAvailableForStagingAttributes];
    uint64_t v16 = [v15 safeObjectForKey:@"STAGE_GROUP_OPTIONAL" ofClass:objc_opt_class()];

    if (v14 && [v14 count])
    {
      char v17 = [v7 oslog];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = [v14 safeSummary];
        int v30 = 138543618;
        v31 = v8;
        __int16 v32 = 2114;
        unint64_t v33 = (unint64_t)v18;
        _os_log_impl(&dword_1B275B000, v17, OS_LOG_TYPE_DEFAULT, "\n>%{public}@> byGroupAvailableForStaging[REQUIRED]:\n%{public}@", (uint8_t *)&v30, 0x16u);
      }
    }
    else
    {
      char v17 = [v7 oslog];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v30 = 138543362;
        v31 = v8;
        _os_log_impl(&dword_1B275B000, v17, OS_LOG_TYPE_DEFAULT, "\n>%{public}@> byGroupAvailableForStaging[REQUIRED]:NONE", (uint8_t *)&v30, 0xCu);
      }
    }

    if (v16 && [v16 count])
    {
      uint64_t v19 = [v7 oslog];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v20 = [v16 safeSummary];
        int v30 = 138543618;
        v31 = v8;
        __int16 v32 = 2114;
        unint64_t v33 = (unint64_t)v20;
        _os_log_impl(&dword_1B275B000, v19, OS_LOG_TYPE_DEFAULT, "\n>%{public}@> byGroupAvailableForStaging[OPTIONAL]:\n%{public}@", (uint8_t *)&v30, 0x16u);
      }
    }
    else
    {
      uint64_t v19 = [v7 oslog];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v30 = 138543362;
        v31 = v8;
        _os_log_impl(&dword_1B275B000, v19, OS_LOG_TYPE_DEFAULT, "\n>%{public}@> byGroupAvailableForStaging[OPTIONAL]:NONE", (uint8_t *)&v30, 0xCu);
      }
    }
  }
  uint64_t v21 = [(MAAutoAssetInfoStaging *)self allAvailableForStagingAttributes];

  if (v21)
  {
    v22 = [v7 oslog];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = [(MAAutoAssetInfoStaging *)self allAvailableForStagingAttributes];
      objc_super v24 = [v23 safeSummary];
      int v30 = 138543618;
      v31 = v8;
      __int16 v32 = 2114;
      unint64_t v33 = (unint64_t)v24;
      _os_log_impl(&dword_1B275B000, v22, OS_LOG_TYPE_DEFAULT, "\n>%{public}@> allAvailableForStagingAttributes:\n%{public}@", (uint8_t *)&v30, 0x16u);
    }
  }
  v25 = [(MAAutoAssetInfoStaging *)self byGroupTotalExpectedBytes];

  if (v25)
  {
    v26 = [v7 oslog];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = [(MAAutoAssetInfoStaging *)self byGroupTotalExpectedBytes];
      int v30 = 138543618;
      v31 = v8;
      __int16 v32 = 2114;
      unint64_t v33 = (unint64_t)v27;
      _os_log_impl(&dword_1B275B000, v26, OS_LOG_TYPE_DEFAULT, "\n>%{public}@> byGroupTotalExpectedBytes:\n%{public}@", (uint8_t *)&v30, 0x16u);
    }
  }
  v28 = [v7 oslog];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v29 = [(MAAutoAssetInfoStaging *)self totalExpectedBytes];
    int v30 = 138543618;
    v31 = v8;
    __int16 v32 = 2048;
    unint64_t v33 = v29;
    _os_log_impl(&dword_1B275B000, v28, OS_LOG_TYPE_DEFAULT, "\n>%{public}@> totalExpectedBytes:%llu", (uint8_t *)&v30, 0x16u);
  }
}

- (NSDictionary)updateAttributes
{
  return self->_updateAttributes;
}

- (NSDictionary)byGroupAvailableForStagingAttributes
{
  return self->_byGroupAvailableForStagingAttributes;
}

- (NSDictionary)allAvailableForStagingAttributes
{
  return self->_allAvailableForStagingAttributes;
}

- (NSDictionary)byGroupTotalExpectedBytes
{
  return self->_byGroupTotalExpectedBytes;
}

- (unint64_t)totalExpectedBytes
{
  return self->_totalExpectedBytes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_byGroupTotalExpectedBytes, 0);
  objc_storeStrong((id *)&self->_allAvailableForStagingAttributes, 0);
  objc_storeStrong((id *)&self->_byGroupAvailableForStagingAttributes, 0);
  objc_storeStrong((id *)&self->_updateAttributes, 0);
}

@end