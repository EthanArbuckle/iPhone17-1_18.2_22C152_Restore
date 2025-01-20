@interface FCPrivateDataSyncAvailability
+ (id)defaultAvailability;
+ (id)notAvailable;
- (BOOL)isPrivateDataSyncingAllowed;
- (FCPrivateDataSyncAvailability)initWithConditions:(id)a3;
- (NSArray)conditions;
@end

@implementation FCPrivateDataSyncAvailability

uint64_t __60__FCPrivateDataSyncAvailability_isPrivateDataSyncingAllowed__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSatisfied] ^ 1;
}

- (void).cxx_destruct
{
}

+ (id)defaultAvailability
{
  v10[4] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc((Class)objc_opt_class());
  v3 = objc_opt_new();
  v10[0] = v3;
  v4 = objc_opt_new();
  v10[1] = v4;
  v5 = objc_opt_new();
  v10[2] = v5;
  v6 = objc_opt_new();
  v10[3] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:4];
  v8 = (void *)[v2 initWithConditions:v7];

  return v8;
}

- (FCPrivateDataSyncAvailability)initWithConditions:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCPrivateDataSyncAvailability;
  v5 = [(FCPrivateDataSyncAvailability *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    conditions = v5->_conditions;
    v5->_conditions = (NSArray *)v6;
  }
  return v5;
}

- (BOOL)isPrivateDataSyncingAllowed
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = [(FCPrivateDataSyncAvailability *)self conditions];
  v3 = objc_msgSend(v2, "fc_firstObjectPassingTest:", &__block_literal_global_50);

  uint64_t v4 = FCPrivateDataLog;
  BOOL v5 = os_log_type_enabled((os_log_t)FCPrivateDataLog, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v10 = 138543362;
      v11 = v3;
      uint64_t v6 = "private data syncing is not allowed because condition failed: %{public}@";
      v7 = v4;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl(&dword_1A460D000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v10, v8);
    }
  }
  else if (v5)
  {
    LOWORD(v10) = 0;
    uint64_t v6 = "private data syncing is allowed";
    v7 = v4;
    uint32_t v8 = 2;
    goto LABEL_6;
  }

  return v3 == 0;
}

- (NSArray)conditions
{
  return self->_conditions;
}

+ (id)notAvailable
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc((Class)objc_opt_class());
  v3 = objc_opt_new();
  v7[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  BOOL v5 = (void *)[v2 initWithConditions:v4];

  return v5;
}

@end