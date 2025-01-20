@interface PLComputeCachePolicy
- (BOOL)_isAssetCountWithinPolicy;
- (BOOL)_isLastSnapshotDateWithinPolicy;
- (BOOL)_isiCloudTierWithinPolicy;
- (BOOL)snapshotAllowed;
- (BOOL)snapshotRequired;
- (NSString)reason;
- (PLComputeCachePolicy)initWithPolicyData:(id)a3 configuration:(id)a4;
- (PLComputeCachePolicyConfiguration)configuration;
- (int64_t)_deriveAllowPolicy;
- (int64_t)_deriveDenyPolicy;
- (int64_t)allowPolicy;
- (int64_t)denyPolicy;
- (void)_checkAllowPolicy;
- (void)_checkDenyPolicy;
@end

@implementation PLComputeCachePolicy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (int64_t)allowPolicy
{
  return self->_allowPolicy;
}

- (int64_t)denyPolicy
{
  return self->_denyPolicy;
}

- (PLComputeCachePolicyConfiguration)configuration
{
  return self->_configuration;
}

- (NSString)reason
{
  return self->_reason;
}

- (BOOL)_isiCloudTierWithinPolicy
{
  unint64_t v3 = [(PLComputeCachePolicyDataSource *)self->_data iCloudStorageSizeInBytes];
  return v3 > [(PLComputeCachePolicyConfiguration *)self->_configuration minCloudStorageTier];
}

- (BOOL)_isLastSnapshotDateWithinPolicy
{
  unint64_t v3 = [(PLComputeCachePolicyDataSource *)self->_data lastSnapshotDate];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F1C9C8] now];
    [v4 timeIntervalSinceDate:v3];
    double v6 = v5;
    v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v8 = [v7 integerForKey:@"PLComputeCachePolicyMinSnapshotTimeInMinutes"];

    if (v8 < 1) {
      [(PLComputeCachePolicyConfiguration *)self->_configuration minSnapshotTimeInterval];
    }
    else {
      double v9 = (double)(60 * v8);
    }
    BOOL v10 = v6 < v9;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)_isAssetCountWithinPolicy
{
  unint64_t v3 = [(PLComputeCachePolicyDataSource *)self->_data assetCount];
  return v3 != 0x7FFFFFFFFFFFFFFFLL
      && v3 >= [(PLComputeCachePolicyConfiguration *)self->_configuration minAssetCount];
}

- (int64_t)_deriveAllowPolicy
{
  if (![(PLComputeCachePolicy *)self _isLastSnapshotDateWithinPolicy]) {
    return 1;
  }
  if ([(PLComputeCachePolicyDataSource *)self->_data hasAtLeastExpungedAssetCount:[(PLComputeCachePolicyConfiguration *)self->_configuration minExpungedAssetCount]])
  {
    return 2;
  }
  return 0;
}

- (int64_t)_deriveDenyPolicy
{
  if (![(PLComputeCachePolicyDataSource *)self->_data isEnabled]) {
    return 1;
  }
  if (![(PLComputeCachePolicyConfiguration *)self->_configuration isBackupEnabled]) {
    return 2;
  }
  if (([(PLComputeCachePolicyDataSource *)self->_data restoreState] & 0xFFFFFFFFFFFFFFFELL) == 2) {
    return 5;
  }
  v4 = [(PLComputeCachePolicyDataSource *)self->_data lastSnapshotDate];

  if (!v4 && ![(PLComputeCachePolicy *)self _isAssetCountWithinPolicy]) {
    return 3;
  }
  if ([(PLComputeCachePolicy *)self _isiCloudTierWithinPolicy]) {
    return 0;
  }
  return 4;
}

- (void)_checkAllowPolicy
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(PLComputeCachePolicy *)self _deriveAllowPolicy];
  self->_int64_t allowPolicy = v3;
  if ((unint64_t)(v3 - 1) < 2)
  {
    v4 = NSString;
    uint64_t v5 = PLStringFromPLComputeCacheSnapshotAllowPolicyShort(v3);
    double v6 = (void *)v5;
    int64_t allowPolicy = self->_allowPolicy;
    uint64_t v8 = @"Snapshot disabled. Snapshot is current";
    if (allowPolicy == 1) {
      uint64_t v8 = @"Snapshot required. Snapshot is out of date";
    }
    if (allowPolicy == 2) {
      double v9 = @"Snapshot required. Snapshot has deleted asset records";
    }
    else {
      double v9 = v8;
    }
    BOOL v10 = [v4 stringWithFormat:@"Snapshot required. Policy: %@ (%@)", v5, v9];
    reason = self->_reason;
    self->_reason = v10;

    v12 = PLMigrationGetLog();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
      goto LABEL_18;
    }
    v13 = self->_reason;
    *(_DWORD *)buf = 138543362;
    v24 = v13;
    goto LABEL_17;
  }
  if (v3) {
    return;
  }
  v14 = NSString;
  uint64_t v15 = PLStringFromPLComputeCacheSnapshotAllowPolicyShort(0);
  v16 = (void *)v15;
  int64_t v17 = self->_allowPolicy;
  v18 = @"Snapshot disabled. Snapshot is current";
  if (v17 == 1) {
    v18 = @"Snapshot required. Snapshot is out of date";
  }
  if (v17 == 2) {
    v19 = @"Snapshot required. Snapshot has deleted asset records";
  }
  else {
    v19 = v18;
  }
  v20 = [v14 stringWithFormat:@"Snapshot is current. Update not required. Policy: %@ (%@)", v15, v19];
  v21 = self->_reason;
  self->_reason = v20;

  v12 = PLMigrationGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v22 = self->_reason;
    *(_DWORD *)buf = 138543362;
    v24 = v22;
LABEL_17:
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_INFO, "ComputeCachePolicy: %{public}@", buf, 0xCu);
  }
LABEL_18:
}

- (void)_checkDenyPolicy
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(PLComputeCachePolicy *)self _deriveDenyPolicy];
  self->_denyPolicy = v3;
  if ((unint64_t)(v3 - 1) <= 4)
  {
    v4 = NSString;
    uint64_t v5 = PLStringFromPLComputeCacheSnapshotDenyPolicyShort(v3);
    double v6 = (void *)v5;
    unint64_t v7 = self->_denyPolicy - 1;
    if (v7 > 4) {
      uint64_t v8 = @"Snapshot enabled. Check allow policy";
    }
    else {
      uint64_t v8 = off_1E5870060[v7];
    }
    double v9 = [v4 stringWithFormat:@"Snapshot deny policy triggered. Policy: %@ (%@)", v5, v8];
    reason = self->_reason;
    self->_reason = v9;

    v11 = PLMigrationGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = self->_reason;
      *(_DWORD *)buf = 138543362;
      v14 = v12;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_INFO, "ComputeCachePolicy: %{public}@", buf, 0xCu);
    }
  }
}

- (BOOL)snapshotAllowed
{
  return self->_denyPolicy == 0;
}

- (BOOL)snapshotRequired
{
  BOOL v3 = [(PLComputeCachePolicy *)self snapshotAllowed];
  if (v3) {
    LOBYTE(v3) = self->_allowPolicy != 0;
  }
  return v3;
}

- (PLComputeCachePolicy)initWithPolicyData:(id)a3 configuration:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PLComputeCachePolicy.m", 106, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)PLComputeCachePolicy;
  BOOL v10 = [(PLComputeCachePolicy *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_data, a3);
    objc_storeStrong((id *)&v11->_configuration, a4);
    [(PLComputeCachePolicy *)v11 _checkDenyPolicy];
    if ([(PLComputeCachePolicy *)v11 snapshotAllowed]) {
      [(PLComputeCachePolicy *)v11 _checkAllowPolicy];
    }
  }

  return v11;
}

@end