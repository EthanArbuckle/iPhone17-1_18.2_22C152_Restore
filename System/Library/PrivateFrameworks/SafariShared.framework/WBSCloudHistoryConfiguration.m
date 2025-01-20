@interface WBSCloudHistoryConfiguration
- (BOOL)shouldBatchSaveRecords;
- (BOOL)shouldUseLongLivedOperationsToSaveRecords;
- (NSString)multipleDeviceFetchChangesThrottlingPolicyString;
- (NSString)multipleDeviceSaveChangesThrottlingPolicyString;
- (NSString)singleDeviceFetchChangesThrottlingPolicyString;
- (NSString)singleDeviceSaveChangesThrottlingPolicyString;
- (NSString)syncCircleSizeRetrievalThrottlingPolicyString;
- (WBSCloudHistoryConfiguration)init;
- (WBSCloudHistoryConfiguration)initWithDictionary:(id)a3;
- (double)syncWindow;
- (id)_builtInConfiguration;
- (id)_sharedBuiltInConfiguration;
- (id)dictionaryRepresentation;
- (id)platformBuiltInConfiguration;
- (id)remoteConfiguration;
- (unint64_t)maximumRequestCharacterCount;
- (void)_applyBuiltInConfiguration:(id)a3;
- (void)_applyConfiguration:(id)a3 withTolerance:(int64_t)a4;
- (void)applyRemoteConfiguration:(id)a3;
- (void)setMaximumRequestCharacterCount:(unint64_t)a3;
- (void)setMultipleDeviceFetchChangesThrottlingPolicyString:(id)a3;
- (void)setMultipleDeviceSaveChangesThrottlingPolicyString:(id)a3;
- (void)setSingleDeviceFetchChangesThrottlingPolicyString:(id)a3;
- (void)setSingleDeviceSaveChangesThrottlingPolicyString:(id)a3;
- (void)setSyncCircleSizeRetrievalThrottlingPolicyString:(id)a3;
- (void)setSyncWindow:(double)a3;
@end

@implementation WBSCloudHistoryConfiguration

- (WBSCloudHistoryConfiguration)init
{
  v11.receiver = self;
  v11.super_class = (Class)WBSCloudHistoryConfiguration;
  v2 = [(WBSCloudHistoryConfiguration *)&v11 init];
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_shouldBatchSaveRecords = 1;
    v4 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1A6B5F000, v4, OS_LOG_TYPE_INFO, "Applying built-in configuration", v10, 2u);
    }
    v5 = [(WBSCloudHistoryConfiguration *)v3 _builtInConfiguration];
    [(WBSCloudHistoryConfiguration *)v3 _applyBuiltInConfiguration:v5];

    v6 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1A6B5F000, v6, OS_LOG_TYPE_INFO, "Applying remote configuration", v10, 2u);
    }
    v7 = [(WBSCloudHistoryConfiguration *)v3 remoteConfiguration];
    [(WBSCloudHistoryConfiguration *)v3 applyRemoteConfiguration:v7];

    v8 = v3;
  }

  return v3;
}

- (WBSCloudHistoryConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WBSCloudHistoryConfiguration;
  v5 = [(WBSCloudHistoryConfiguration *)&v8 init];
  if (v5)
  {
    v5->_shouldBatchSaveRecords = objc_msgSend(v4, "safari_BOOLForKey:", @"ShouldBatchSaveRecords");
    v5->_shouldUseLongLivedOperationsToSaveRecords = objc_msgSend(v4, "safari_BOOLForKey:", @"ShouldUseLongLivedOperationsToSaveRecords");
    [(WBSCloudHistoryConfiguration *)v5 _applyConfiguration:v4 withTolerance:0];
    v6 = v5;
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v12[0] = @"ShouldBatchSaveRecords";
  v3 = objc_msgSend(NSNumber, "numberWithBool:", -[WBSCloudHistoryConfiguration shouldBatchSaveRecords](self, "shouldBatchSaveRecords"));
  v13[0] = v3;
  v12[1] = @"ShouldUseLongLivedOperationsToSaveRecords";
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[WBSCloudHistoryConfiguration shouldUseLongLivedOperationsToSaveRecords](self, "shouldUseLongLivedOperationsToSaveRecords"));
  singleDeviceSaveChangesThrottlingPolicyString = self->_singleDeviceSaveChangesThrottlingPolicyString;
  multipleDeviceSaveChangesThrottlingPolicyString = self->_multipleDeviceSaveChangesThrottlingPolicyString;
  v13[1] = v4;
  v13[2] = singleDeviceSaveChangesThrottlingPolicyString;
  v12[2] = @"SingleDeviceSaveChangesThrottlingPolicy";
  v12[3] = @"MultipleDeviceSaveChangesThrottlingPolicy";
  v13[3] = multipleDeviceSaveChangesThrottlingPolicyString;
  long long v14 = *(_OWORD *)&self->_singleDeviceFetchChangesThrottlingPolicyString;
  v12[4] = @"SingleDeviceFetchChangesThrottlingPolicy";
  v12[5] = @"MultipleDeviceFetchChangesThrottlingPolicy";
  unint64_t maximumRequestCharacterCount = self->_maximumRequestCharacterCount;
  syncCircleSizeRetrievalThrottlingPolicyString = self->_syncCircleSizeRetrievalThrottlingPolicyString;
  v12[6] = @"SyncCircleSizeRetrievalThrottlingPolicy";
  v12[7] = @"MaximumRequestLimitCharacterCount";
  objc_super v8 = [NSNumber numberWithUnsignedInteger:maximumRequestCharacterCount];
  v16 = v8;
  v12[8] = @"SyncWindow";
  v9 = [NSNumber numberWithDouble:self->_syncWindow];
  v17 = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:9];

  return v10;
}

- (id)_builtInConfiguration
{
  v3 = [(WBSCloudHistoryConfiguration *)self _sharedBuiltInConfiguration];
  id v4 = [(WBSCloudHistoryConfiguration *)self platformBuiltInConfiguration];
  if (v4)
  {
    v5 = (void *)[v3 mutableCopy];
    [v5 addEntriesFromDictionary:v4];
  }
  else
  {
    v5 = v3;
  }

  return v5;
}

- (void)_applyBuiltInConfiguration:(id)a3
{
  id v4 = a3;
  -[WBSCloudHistoryConfiguration applyPlatformConfiguration:withTolerance:](self, "applyPlatformConfiguration:withTolerance:");
  [(WBSCloudHistoryConfiguration *)self _applyConfiguration:v4 withTolerance:0];
}

- (void)_applyConfiguration:(id)a3 withTolerance:(int64_t)a4
{
  id v6 = a3;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke;
  v23[3] = &unk_1E5C8DB38;
  id v7 = v6;
  id v24 = v7;
  int64_t v25 = a4;
  objc_super v8 = (void *)MEMORY[0x1AD0C4F80](v23);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_31;
  v20[3] = &unk_1E5C8DB60;
  id v9 = v7;
  id v21 = v9;
  int64_t v22 = a4;
  v10 = (void *)MEMORY[0x1AD0C4F80](v20);
  v19[2] = __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_33;
  v19[3] = &unk_1E5C8DB88;
  v19[4] = self;
  objc_super v11 = (void (*)(void *, __CFString *, void *))v8[2];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v11(v8, @"SingleDeviceSaveChangesThrottlingPolicy", v19);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_35;
  v18[3] = &unk_1E5C8DB88;
  v18[4] = self;
  ((void (*)(void *, __CFString *, void *))v8[2])(v8, @"MultipleDeviceSaveChangesThrottlingPolicy", v18);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_36;
  v17[3] = &unk_1E5C8DB88;
  v17[4] = self;
  ((void (*)(void *, __CFString *, void *))v8[2])(v8, @"SingleDeviceFetchChangesThrottlingPolicy", v17);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_37;
  v16[3] = &unk_1E5C8DB88;
  v16[4] = self;
  ((void (*)(void *, __CFString *, void *))v8[2])(v8, @"MultipleDeviceFetchChangesThrottlingPolicy", v16);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_38;
  v15[3] = &unk_1E5C8DB88;
  v15[4] = self;
  ((void (*)(void *, __CFString *, void *))v8[2])(v8, @"SyncCircleSizeRetrievalThrottlingPolicy", v15);
  v14[2] = __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_39;
  v14[3] = &unk_1E5C8DBB0;
  v14[4] = self;
  v12 = (void (*)(void *, __CFString *, void *))v10[2];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v12(v10, @"MaximumRequestLimitCharacterCount", v14);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_41;
  v13[3] = &unk_1E5C8DBB0;
  void v13[4] = self;
  ((void (*)(void *, __CFString *, void *))v10[2])(v10, @"SyncWindow", v13);
}

void __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];

  if (v7)
  {
    objc_super v8 = objc_msgSend(*(id *)(a1 + 32), "safari_stringForKey:", v5);
    if (v8)
    {
      if ([MEMORY[0x1E4F97E68] policyStringRepresentsValidPolicy:v8])
      {
        id v9 = (void *)[v8 copy];
        v6[2](v6, v9);
      }
    }
    else
    {
      objc_super v11 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_cold_2();
      }
    }
  }
  else if (*(void *)(a1 + 40))
  {
    v10 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v13 = 138543362;
      id v14 = v5;
      _os_log_impl(&dword_1A6B5F000, v10, OS_LOG_TYPE_INFO, "Configuration did not contain key: %{public}@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    v12 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_cold_1();
    }
  }
}

void __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];

  if (v7)
  {
    objc_super v8 = objc_msgSend(*(id *)(a1 + 32), "safari_numberForKey:", v5);
    uint64_t v9 = [v8 unsignedIntegerValue];

    if (v9)
    {
      v6[2](v6, v9);
    }
    else
    {
      objc_super v11 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_31_cold_2();
      }
    }
  }
  else if (*(void *)(a1 + 40))
  {
    v10 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v13 = 138543362;
      id v14 = v5;
      _os_log_impl(&dword_1A6B5F000, v10, OS_LOG_TYPE_INFO, "Configuration did not contain key: %{public}@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    v12 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_cold_1();
    }
  }
}

void __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_33(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138543618;
    id v6 = v3;
    __int16 v7 = 2114;
    objc_super v8 = @"SingleDeviceSaveChangesThrottlingPolicy";
    _os_log_impl(&dword_1A6B5F000, v4, OS_LOG_TYPE_INFO, "Retrieved value: %{public}@ for key: %{public}@", (uint8_t *)&v5, 0x16u);
  }
  [*(id *)(a1 + 32) setSingleDeviceSaveChangesThrottlingPolicyString:v3];
}

void __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_35(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138543618;
    id v6 = v3;
    __int16 v7 = 2114;
    objc_super v8 = @"MultipleDeviceSaveChangesThrottlingPolicy";
    _os_log_impl(&dword_1A6B5F000, v4, OS_LOG_TYPE_INFO, "Retrieved value: %{public}@ for key: %{public}@", (uint8_t *)&v5, 0x16u);
  }
  [*(id *)(a1 + 32) setMultipleDeviceSaveChangesThrottlingPolicyString:v3];
}

void __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_36(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138543618;
    id v6 = v3;
    __int16 v7 = 2114;
    objc_super v8 = @"SingleDeviceFetchChangesThrottlingPolicy";
    _os_log_impl(&dword_1A6B5F000, v4, OS_LOG_TYPE_INFO, "Retrieved value: %{public}@ for key: %{public}@", (uint8_t *)&v5, 0x16u);
  }
  [*(id *)(a1 + 32) setSingleDeviceFetchChangesThrottlingPolicyString:v3];
}

void __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_37(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138543618;
    id v6 = v3;
    __int16 v7 = 2114;
    objc_super v8 = @"MultipleDeviceFetchChangesThrottlingPolicy";
    _os_log_impl(&dword_1A6B5F000, v4, OS_LOG_TYPE_INFO, "Retrieved value: %{public}@ for key: %{public}@", (uint8_t *)&v5, 0x16u);
  }
  [*(id *)(a1 + 32) setMultipleDeviceFetchChangesThrottlingPolicyString:v3];
}

void __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_38(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138543618;
    id v6 = v3;
    __int16 v7 = 2114;
    objc_super v8 = @"SyncCircleSizeRetrievalThrottlingPolicy";
    _os_log_impl(&dword_1A6B5F000, v4, OS_LOG_TYPE_INFO, "Retrieved value: %{public}@ for key: %{public}@", (uint8_t *)&v5, 0x16u);
  }
  [*(id *)(a1 + 32) setSyncCircleSizeRetrievalThrottlingPolicyString:v3];
}

uint64_t __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_39(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 134218242;
    uint64_t v7 = a2;
    __int16 v8 = 2114;
    uint64_t v9 = @"MaximumRequestLimitCharacterCount";
    _os_log_impl(&dword_1A6B5F000, v4, OS_LOG_TYPE_INFO, "Retrieved value: %lu for key: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return [*(id *)(a1 + 32) setMaximumRequestCharacterCount:a2];
}

uint64_t __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_41(uint64_t a1, unint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 134218242;
    unint64_t v7 = a2;
    __int16 v8 = 2114;
    uint64_t v9 = @"SyncWindow";
    _os_log_impl(&dword_1A6B5F000, v4, OS_LOG_TYPE_INFO, "Retrieved value: %lu for key: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return [*(id *)(a1 + 32) setSyncWindow:(double)a2];
}

- (id)_sharedBuiltInConfiguration
{
  v5[5] = *MEMORY[0x1E4F143B8];
  v4[0] = @"SingleDeviceFetchChangesThrottlingPolicy";
  v4[1] = @"MultipleDeviceFetchChangesThrottlingPolicy";
  v5[0] = @"11:15 | 1:1275";
  v5[1] = @"50:1 | 50:3 | 20:4 | 20:5 | 20:15 | 20:18 | 20:20";
  v4[2] = @"SyncCircleSizeRetrievalThrottlingPolicy";
  v4[3] = @"MaximumRequestLimitCharacterCount";
  v5[2] = @"1:1440";
  v5[3] = &unk_1EFC22558;
  v4[4] = @"SyncWindow";
  v5[4] = &unk_1EFC229A8;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:5];
  return v2;
}

- (id)platformBuiltInConfiguration
{
  return 0;
}

- (id)remoteConfiguration
{
  return 0;
}

- (void)applyRemoteConfiguration:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(WBSCloudHistoryConfiguration *)self applyPlatformConfiguration:v5 withTolerance:1];
    [(WBSCloudHistoryConfiguration *)self _applyConfiguration:v5 withTolerance:1];
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:@"WBSCloudHistoryConfigurationChangedNotification" object:self userInfo:0];
  }
}

- (NSString)singleDeviceSaveChangesThrottlingPolicyString
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSingleDeviceSaveChangesThrottlingPolicyString:(id)a3
{
}

- (NSString)multipleDeviceSaveChangesThrottlingPolicyString
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMultipleDeviceSaveChangesThrottlingPolicyString:(id)a3
{
}

- (NSString)singleDeviceFetchChangesThrottlingPolicyString
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSingleDeviceFetchChangesThrottlingPolicyString:(id)a3
{
}

- (NSString)multipleDeviceFetchChangesThrottlingPolicyString
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMultipleDeviceFetchChangesThrottlingPolicyString:(id)a3
{
}

- (NSString)syncCircleSizeRetrievalThrottlingPolicyString
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSyncCircleSizeRetrievalThrottlingPolicyString:(id)a3
{
}

- (unint64_t)maximumRequestCharacterCount
{
  return self->_maximumRequestCharacterCount;
}

- (void)setMaximumRequestCharacterCount:(unint64_t)a3
{
  self->_unint64_t maximumRequestCharacterCount = a3;
}

- (double)syncWindow
{
  return self->_syncWindow;
}

- (void)setSyncWindow:(double)a3
{
  self->_syncWindow = a3;
}

- (BOOL)shouldBatchSaveRecords
{
  return self->_shouldBatchSaveRecords;
}

- (BOOL)shouldUseLongLivedOperationsToSaveRecords
{
  return self->_shouldUseLongLivedOperationsToSaveRecords;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncCircleSizeRetrievalThrottlingPolicyString, 0);
  objc_storeStrong((id *)&self->_multipleDeviceFetchChangesThrottlingPolicyString, 0);
  objc_storeStrong((id *)&self->_singleDeviceFetchChangesThrottlingPolicyString, 0);
  objc_storeStrong((id *)&self->_multipleDeviceSaveChangesThrottlingPolicyString, 0);
  objc_storeStrong((id *)&self->_singleDeviceSaveChangesThrottlingPolicyString, 0);
}

void __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_4(&dword_1A6B5F000, v0, v1, "Configuration did not contain key: %{public}@", v2, v3, v4, v5, v6);
}

void __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_4(&dword_1A6B5F000, v0, v1, "Configuration did not contain string value for key: %{public}@", v2, v3, v4, v5, v6);
}

void __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_31_cold_2()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_4(&dword_1A6B5F000, v0, v1, "Configuration did not contain unsigned integer for key: %{public}@", v2, v3, v4, v5, v6);
}

@end