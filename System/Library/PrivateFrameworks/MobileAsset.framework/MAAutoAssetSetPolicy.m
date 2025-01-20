@interface MAAutoAssetSetPolicy
+ (BOOL)supportsSecureCoding;
- (BOOL)allowCheckDownloadOnBattery;
- (BOOL)allowCheckDownloadOverCellular;
- (BOOL)allowCheckDownloadOverExpensive;
- (BOOL)allowCheckDownloadWhenBatteryLow;
- (BOOL)allowCheckDownloadWhenCPUHigh;
- (BOOL)blockCheckDownload;
- (BOOL)blockCheckDownloadWhenRecentUserActivity;
- (BOOL)lockInhibitsEmergencyRemoval;
- (BOOL)preferCheckDownloadOverWiFi;
- (BOOL)restrictCheckDownloadToNetwork;
- (BOOL)supportingShortTermLocks;
- (BOOL)userInitiated;
- (MAAutoAssetSetPolicy)init;
- (MAAutoAssetSetPolicy)initWithCoder:(id)a3;
- (NSDictionary)additionalPolicyControl;
- (id)description;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalPolicyControl:(id)a3;
- (void)setAllowCheckDownloadOnBattery:(BOOL)a3;
- (void)setAllowCheckDownloadOverCellular:(BOOL)a3;
- (void)setAllowCheckDownloadOverExpensive:(BOOL)a3;
- (void)setAllowCheckDownloadWhenBatteryLow:(BOOL)a3;
- (void)setAllowCheckDownloadWhenCPUHigh:(BOOL)a3;
- (void)setBlockCheckDownload:(BOOL)a3;
- (void)setBlockCheckDownloadWhenRecentUserActivity:(BOOL)a3;
- (void)setLockInhibitsEmergencyRemoval:(BOOL)a3;
- (void)setPreferCheckDownloadOverWiFi:(BOOL)a3;
- (void)setRestrictCheckDownloadToNetwork:(BOOL)a3;
- (void)setSupportingShortTermLocks:(BOOL)a3;
- (void)setUserInitiated:(BOOL)a3;
@end

@implementation MAAutoAssetSetPolicy

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (void)setAllowCheckDownloadOverCellular:(BOOL)a3
{
  self->_allowCheckDownloadOverCellular = a3;
}

- (void)setAllowCheckDownloadOnBattery:(BOOL)a3
{
  self->_allowCheckDownloadOnBattery = a3;
}

- (MAAutoAssetSetPolicy)initWithCoder:(id)a3
{
  v13[8] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MAAutoAssetSetPolicy;
  v5 = [(MAAutoAssetSetPolicy *)&v12 init];
  if (v5)
  {
    v5->_userInitiated = [v4 decodeBoolForKey:@"userInitiated"];
    v5->_lockInhibitsEmergencyRemoval = [v4 decodeBoolForKey:@"lockInhibitsEmergencyRemoval"];
    v5->_supportingShortTermLocks = [v4 decodeBoolForKey:@"supportingShortTermLocks"];
    v5->_allowCheckDownloadOnBattery = [v4 decodeBoolForKey:@"allowCheckDownloadOnBattery"];
    v5->_allowCheckDownloadWhenBatteryLow = [v4 decodeBoolForKey:@"allowCheckDownloadWhenBatteryLow"];
    v5->_allowCheckDownloadWhenCPUHigh = [v4 decodeBoolForKey:@"allowCheckDownloadWhenCPUHigh"];
    v5->_allowCheckDownloadOverExpensive = [v4 decodeBoolForKey:@"allowCheckDownloadOverExpensive"];
    v5->_allowCheckDownloadOverCellular = [v4 decodeBoolForKey:@"allowCheckDownloadOverCellular"];
    v5->_blockCheckDownload = [v4 decodeBoolForKey:@"blockCheckDownload"];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v13[2] = objc_opt_class();
    v13[3] = objc_opt_class();
    v13[4] = objc_opt_class();
    v13[5] = objc_opt_class();
    v13[6] = objc_opt_class();
    v13[7] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:8];
    v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"additionalPolicyControl"];
    additionalPolicyControl = v5->_additionalPolicyControl;
    v5->_additionalPolicyControl = (NSDictionary *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSetPolicy userInitiated](self, "userInitiated"), @"userInitiated");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSetPolicy lockInhibitsEmergencyRemoval](self, "lockInhibitsEmergencyRemoval"), @"lockInhibitsEmergencyRemoval");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSetPolicy supportingShortTermLocks](self, "supportingShortTermLocks"), @"supportingShortTermLocks");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSetPolicy allowCheckDownloadOnBattery](self, "allowCheckDownloadOnBattery"), @"allowCheckDownloadOnBattery");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSetPolicy allowCheckDownloadWhenBatteryLow](self, "allowCheckDownloadWhenBatteryLow"), @"allowCheckDownloadWhenBatteryLow");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSetPolicy allowCheckDownloadWhenCPUHigh](self, "allowCheckDownloadWhenCPUHigh"), @"allowCheckDownloadWhenCPUHigh");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSetPolicy allowCheckDownloadOverExpensive](self, "allowCheckDownloadOverExpensive"), @"allowCheckDownloadOverExpensive");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSetPolicy allowCheckDownloadOverCellular](self, "allowCheckDownloadOverCellular"), @"allowCheckDownloadOverCellular");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSetPolicy blockCheckDownload](self, "blockCheckDownload"), @"blockCheckDownload");
  id v5 = [(MAAutoAssetSetPolicy *)self additionalPolicyControl];
  [v4 encodeObject:v5 forKey:@"additionalPolicyControl"];
}

- (id)summary
{
  v3 = [(MAAutoAssetSetPolicy *)self additionalPolicyControl];
  id v4 = @"(w/additional)";
  if (!v3) {
    id v4 = &stru_1F0A75970;
  }
  id v5 = v4;

  v6 = @"N";
  if ([(MAAutoAssetSetPolicy *)self lockInhibitsEmergencyRemoval]
    && [(MAAutoAssetSetPolicy *)self supportingShortTermLocks]
    && [(MAAutoAssetSetPolicy *)self allowCheckDownloadOnBattery]
    && [(MAAutoAssetSetPolicy *)self allowCheckDownloadWhenBatteryLow]
    && [(MAAutoAssetSetPolicy *)self allowCheckDownloadWhenCPUHigh]
    && [(MAAutoAssetSetPolicy *)self allowCheckDownloadOverExpensive]
    && [(MAAutoAssetSetPolicy *)self allowCheckDownloadOverCellular]
    && [(MAAutoAssetSetPolicy *)self blockCheckDownload])
  {
    v7 = @"allOtherBool:Y";
  }
  else if ([(MAAutoAssetSetPolicy *)self lockInhibitsEmergencyRemoval] {
         || [(MAAutoAssetSetPolicy *)self supportingShortTermLocks]
  }
         || [(MAAutoAssetSetPolicy *)self allowCheckDownloadOnBattery]
         || [(MAAutoAssetSetPolicy *)self allowCheckDownloadWhenBatteryLow]
         || [(MAAutoAssetSetPolicy *)self allowCheckDownloadWhenCPUHigh]
         || [(MAAutoAssetSetPolicy *)self allowCheckDownloadOverExpensive]
         || [(MAAutoAssetSetPolicy *)self allowCheckDownloadOverCellular]
         || [(MAAutoAssetSetPolicy *)self blockCheckDownload])
  {
    id v20 = [NSString alloc];
    if ([(MAAutoAssetSetPolicy *)self lockInhibitsEmergencyRemoval]) {
      v8 = @"Y";
    }
    else {
      v8 = @"N";
    }
    v19 = v8;
    if ([(MAAutoAssetSetPolicy *)self supportingShortTermLocks]) {
      uint64_t v9 = @"Y";
    }
    else {
      uint64_t v9 = @"N";
    }
    if ([(MAAutoAssetSetPolicy *)self allowCheckDownloadOnBattery]) {
      v10 = @"Y";
    }
    else {
      v10 = @"N";
    }
    if ([(MAAutoAssetSetPolicy *)self allowCheckDownloadWhenBatteryLow]) {
      v11 = @"Y";
    }
    else {
      v11 = @"N";
    }
    if ([(MAAutoAssetSetPolicy *)self allowCheckDownloadWhenCPUHigh]) {
      objc_super v12 = @"Y";
    }
    else {
      objc_super v12 = @"N";
    }
    if ([(MAAutoAssetSetPolicy *)self allowCheckDownloadOverExpensive]) {
      v13 = @"Y";
    }
    else {
      v13 = @"N";
    }
    if ([(MAAutoAssetSetPolicy *)self allowCheckDownloadOverCellular]) {
      v6 = @"Y";
    }
    if ([(MAAutoAssetSetPolicy *)self blockCheckDownload]) {
      v14 = @"Y";
    }
    else {
      v14 = @"N";
    }
    v7 = (__CFString *)[v20 initWithFormat:@"|lockInhibitsRemoval:%@|supportingShortTermLocks:%@|allowCheckDownload(OnBattery:%@,WhenBatteryLow:%@,WhenCPUHigh:%@,OverExpensive:%@,OverCellular:%@)|blockCheckDownload:%@|", v19, v9, v10, v11, v12, v13, v6, v14];
  }
  else
  {
    v7 = @"allOtherBool:N";
  }
  v15 = NSString;
  if ([(MAAutoAssetSetPolicy *)self userInitiated]) {
    v16 = @"Y";
  }
  else {
    v16 = @"N";
  }
  v17 = [v15 stringWithFormat:@"user:%@|%@%@", v16, v7, v5];

  return v17;
}

- (BOOL)lockInhibitsEmergencyRemoval
{
  return self->_lockInhibitsEmergencyRemoval;
}

- (BOOL)supportingShortTermLocks
{
  return self->_supportingShortTermLocks;
}

- (BOOL)allowCheckDownloadOnBattery
{
  return self->_allowCheckDownloadOnBattery;
}

- (BOOL)allowCheckDownloadOverCellular
{
  return self->_allowCheckDownloadOverCellular;
}

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

- (BOOL)blockCheckDownload
{
  return self->_blockCheckDownload;
}

- (BOOL)allowCheckDownloadWhenCPUHigh
{
  return self->_allowCheckDownloadWhenCPUHigh;
}

- (BOOL)allowCheckDownloadWhenBatteryLow
{
  return self->_allowCheckDownloadWhenBatteryLow;
}

- (BOOL)allowCheckDownloadOverExpensive
{
  return self->_allowCheckDownloadOverExpensive;
}

- (NSDictionary)additionalPolicyControl
{
  return self->_additionalPolicyControl;
}

- (MAAutoAssetSetPolicy)init
{
  v6.receiver = self;
  v6.super_class = (Class)MAAutoAssetSetPolicy;
  v2 = [(MAAutoAssetSetPolicy *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_blockCheckDownload = 0;
    *(void *)&v2->_userInitiated = 0;
    additionalPolicyControl = v2->_additionalPolicyControl;
    v2->_additionalPolicyControl = 0;
  }
  return v3;
}

- (id)description
{
  v3 = [(MAAutoAssetSetPolicy *)self additionalPolicyControl];

  if (v3)
  {
    id v4 = NSString;
    id v5 = [(MAAutoAssetSetPolicy *)self summary];
    objc_super v6 = [(MAAutoAssetSetPolicy *)self additionalPolicyControl];
    v7 = [v6 description];
    v8 = [v4 stringWithFormat:@"%@|additional:\n%@", v5, v7];
  }
  else
  {
    v8 = [(MAAutoAssetSetPolicy *)self summary];
  }
  return v8;
}

- (void)setLockInhibitsEmergencyRemoval:(BOOL)a3
{
  self->_lockInhibitsEmergencyRemoval = a3;
}

- (void)setSupportingShortTermLocks:(BOOL)a3
{
  self->_supportingShortTermLocks = a3;
}

- (void)setAllowCheckDownloadWhenBatteryLow:(BOOL)a3
{
  self->_allowCheckDownloadWhenBatteryLow = a3;
}

- (void)setAllowCheckDownloadWhenCPUHigh:(BOOL)a3
{
  self->_allowCheckDownloadWhenCPUHigh = a3;
}

- (void)setAllowCheckDownloadOverExpensive:(BOOL)a3
{
  self->_allowCheckDownloadOverExpensive = a3;
}

- (void)setBlockCheckDownload:(BOOL)a3
{
  self->_blockCheckDownload = a3;
}

- (BOOL)blockCheckDownloadWhenRecentUserActivity
{
  return self->_blockCheckDownloadWhenRecentUserActivity;
}

- (void)setBlockCheckDownloadWhenRecentUserActivity:(BOOL)a3
{
  self->_blockCheckDownloadWhenRecentUserActivity = a3;
}

- (BOOL)preferCheckDownloadOverWiFi
{
  return self->_preferCheckDownloadOverWiFi;
}

- (void)setPreferCheckDownloadOverWiFi:(BOOL)a3
{
  self->_preferCheckDownloadOverWiFi = a3;
}

- (BOOL)restrictCheckDownloadToNetwork
{
  return self->_restrictCheckDownloadToNetwork;
}

- (void)setRestrictCheckDownloadToNetwork:(BOOL)a3
{
  self->_restrictCheckDownloadToNetwork = a3;
}

- (void)setAdditionalPolicyControl:(id)a3
{
}

@end