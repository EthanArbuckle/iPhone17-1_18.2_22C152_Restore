@interface SUDefaultDownloadPolicy
- (BOOL)_inexpensiveHDM;
- (BOOL)_isCellularCapable;
- (BOOL)_isDownloadableForNetworkType:(int)a3 error:(int64_t *)a4 cellularFeesApply:(BOOL *)a5 powerRequired:(BOOL *)a6;
- (BOOL)allowExpensiveNetwork;
- (BOOL)batteryPolicySatisfied;
- (BOOL)cellularDataIsEnabled;
- (BOOL)cellularDownloadFeesApply;
- (BOOL)hasEnoughDiskSpace;
- (BOOL)isCellularCapable;
- (BOOL)isDownloadAllowableForCellular;
- (BOOL)isDownloadAllowableForCellular2G;
- (BOOL)isDownloadAllowableForCellularIncludingInexpensiveHDM:(BOOL)a3;
- (BOOL)isDownloadAllowableForCellularRoaming;
- (BOOL)isDownloadAllowableForWiFi;
- (BOOL)isDownloadFreeForCellular;
- (BOOL)isDownloadable;
- (BOOL)isDownloadableForCurrentNetworkConditions:(int64_t *)a3 cellularFeesApply:(BOOL *)a4;
- (BOOL)isDownloadableForCurrentNetworkConditions:(int64_t *)a3 cellularFeesApply:(BOOL *)a4 powerRequired:(BOOL *)a5;
- (BOOL)isPowerRequired;
- (BOOL)isSamePolicy:(id)a3;
- (NSString)description;
- (SUCarrierDownloadPolicyProperties)carrierPolicy;
- (SUDefaultDownloadPolicy)initWithDescriptor:(id)a3;
- (SUDescriptor)descriptor;
- (SUNetworkMonitor)networkMonitor;
- (id)_stringForBool:(BOOL)a3;
- (id)createSpaceOptions;
- (id)updateDiscoveryDate;
- (int)cellularFeeAgreementStatus;
- (unint64_t)wifiOnlyPeriodInDays;
- (void)setCarrierPolicy:(id)a3;
- (void)setCellularCapable:(BOOL)a3;
- (void)setCellularFeeAgreementStatus:(int)a3;
- (void)setDescriptor:(id)a3;
- (void)setNetworkMonitor:(id)a3;
@end

@implementation SUDefaultDownloadPolicy

- (SUDefaultDownloadPolicy)initWithDescriptor:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SUDefaultDownloadPolicy;
  v5 = [(SUDefaultDownloadPolicy *)&v19 init];
  v6 = v5;
  if (v5)
  {
    [(SUDefaultDownloadPolicy *)v5 setDescriptor:v4];
    v7 = +[SUNetworkMonitor sharedInstance];
    [(SUDefaultDownloadPolicy *)v6 setNetworkMonitor:v7];

    BOOL v8 = [(SUDefaultDownloadPolicy *)v6 _isCellularCapable];
    v6->_cellularCapable = v8;
    v6->_cellularFeeAgreementStatus = 0;
    if (v8)
    {
      v9 = objc_alloc_init(SUCarrierDownloadPolicyProperties);
      carrierPolicy = v6->_carrierPolicy;
      v6->_carrierPolicy = v9;

      SULogInfo(@"Carrier SU download policy: %@", v11, v12, v13, v14, v15, v16, v17, (uint64_t)v6->_carrierPolicy);
    }
  }

  return v6;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = SUStringFromDownloadPolicyType(+[SUDownloadPolicyFactory downloadPolicyTypeForClass:self]);
  v5 = [(SUDefaultDownloadPolicy *)self _stringForBool:[(SUDefaultDownloadPolicy *)self isDownloadable]];
  v6 = [(SUDefaultDownloadPolicy *)self _stringForBool:[(SUDefaultDownloadPolicy *)self isDownloadFreeForCellular]];
  v7 = [(SUDefaultDownloadPolicy *)self _stringForBool:[(SUDefaultDownloadPolicy *)self isDownloadAllowableForCellular]];
  BOOL v8 = [(SUDefaultDownloadPolicy *)self _stringForBool:[(SUDefaultDownloadPolicy *)self isDownloadAllowableForCellular2G]];
  v9 = [(SUDefaultDownloadPolicy *)self _stringForBool:[(SUDefaultDownloadPolicy *)self isDownloadAllowableForCellularRoaming]];
  v10 = [(SUDefaultDownloadPolicy *)self _stringForBool:[(SUDefaultDownloadPolicy *)self isDownloadAllowableForWiFi]];
  uint64_t v11 = [v3 stringWithFormat:@"<%@>\n            \tisDownloadable: %@\n            \tCellularDownloadFree: %@\n            \tCellularDownloadAllowable: %@\n            \tCellularDownloadAllowableOver2G: %@\n            \tCellularDownloadAllowableWhileRoaming: %@\n            \tWiFiDownloadAllowable: %@", v4, v5, v6, v7, v8, v9, v10];

  return (NSString *)v11;
}

- (id)_stringForBool:(BOOL)a3
{
  if (a3) {
    return @"Yes";
  }
  else {
    return @"No";
  }
}

- (BOOL)_isCellularCapable
{
  if (+[SUUtility currentReleaseTypeIsInternal])
  {
    v2 = +[SUPreferences sharedInstance];
    v3 = [v2 networkMonitorOverride];

    if (v3 && ([v3 intValue] & 0x80000000) == 0 && (int)objc_msgSend(v3, "intValue") < 10000)
    {
      uint64_t v4 = [v3 intValue];
      SULogDebug(@"device is considered cellular capable because networkMonitorOverride (%d) exists", v5, v6, v7, v8, v9, v10, v11, v4);

      LOBYTE(v12) = 1;
      return v12;
    }
  }
  BOOL v12 = +[SUUtility hasCellularRadio];
  if (v12)
  {
    LOBYTE(v12) = +[SUUtility isCellularDataCapable];
  }
  return v12;
}

- (BOOL)isSamePolicy:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  LODWORD(self) = +[SUDownloadPolicyFactory downloadPolicyTypeForClass:self];
  int v5 = +[SUDownloadPolicyFactory downloadPolicyTypeForClass:v4];

  return self == v5;
}

- (id)createSpaceOptions
{
  uint64_t v9 = [(SUDefaultDownloadPolicy *)self descriptor];
  if (v9)
  {
    uint64_t v10 = objc_alloc_init(SUSpacePurgeOptions);
    [(SUSpacePurgeOptions *)v10 setNeededBytes:+[SUUtility totalDiskSpaceForUpdate:v9]];
    [(SUSpacePurgeOptions *)v10 setEnableCacheDelete:1];
    [(SUSpacePurgeOptions *)v10 setEnableAppOffload:1];
    [(SUSpacePurgeOptions *)v10 setCacheDeleteUrgency:4];
    [(SUSpacePurgeOptions *)v10 setAppOffloadUrgency:4];
  }
  else
  {
    SULogInfo(@"Unable to create space options for null descriptor", v2, v3, v4, v5, v6, v7, v8, v12);
    uint64_t v10 = 0;
  }

  return v10;
}

- (BOOL)hasEnoughDiskSpace
{
  uint64_t v9 = [(SUDefaultDownloadPolicy *)self createSpaceOptions];
  if (v9)
  {
    uint64_t v10 = +[SUSpace hasSufficientSpaceWithOptions:v9 error:0];
    char v11 = [v10 hasSufficientFreeSpace];
  }
  else
  {
    SULogInfo(@"Unable to determine sufficient space with null space options", v2, v3, v4, v5, v6, v7, v8, v13);
    char v11 = 0;
  }

  return v11;
}

- (BOOL)isPowerRequired
{
  return 0;
}

- (BOOL)batteryPolicySatisfied
{
  return 1;
}

- (BOOL)isDownloadable
{
  if ([(SUDefaultDownloadPolicy *)self isDownloadAllowableForWiFi]) {
    return 1;
  }
  return [(SUDefaultDownloadPolicy *)self isDownloadAllowableForCellular];
}

- (BOOL)isDownloadAllowableForWiFi
{
  BOOL v2 = [(SUDescriptor *)self->_descriptor isDownloadable];
  if (v2)
  {
    if (+[SUUtility isWiFiCapable])
    {
      LOBYTE(v2) = 1;
    }
    else
    {
      LOBYTE(v2) = +[SUUtility isVirtualDevice];
    }
  }
  return v2;
}

- (BOOL)allowExpensiveNetwork
{
  return [(SUDefaultDownloadPolicy *)self isDownloadAllowableForCellularIncludingInexpensiveHDM:0];
}

- (BOOL)isDownloadAllowableForCellularRoaming
{
  if ([(SUDefaultDownloadPolicy *)self isDownloadAllowableForCellular]) {
    return 1;
  }
  return [(SUDefaultDownloadPolicy *)self isDownloadAllowableForCellular2G];
}

- (BOOL)isDownloadFreeForCellular
{
  return !self->_cellularCapable
      || [(SUCarrierDownloadPolicyProperties *)self->_carrierPolicy isDownloadFree];
}

- (BOOL)isDownloadableForCurrentNetworkConditions:(int64_t *)a3 cellularFeesApply:(BOOL *)a4
{
  return [(SUDefaultDownloadPolicy *)self isDownloadableForCurrentNetworkConditions:a3 cellularFeesApply:a4 powerRequired:0];
}

- (BOOL)isDownloadableForCurrentNetworkConditions:(int64_t *)a3 cellularFeesApply:(BOOL *)a4 powerRequired:(BOOL *)a5
{
  uint64_t v9 = [(SUDefaultDownloadPolicy *)self networkMonitor];
  uint64_t v10 = [v9 currentNetworkType];

  return [(SUDefaultDownloadPolicy *)self _isDownloadableForNetworkType:v10 error:a3 cellularFeesApply:a4 powerRequired:a5];
}

- (BOOL)isDownloadAllowableForCellular
{
  BOOL v3 = [(SUCarrierDownloadPolicyProperties *)self->_carrierPolicy allowInexpensiveHDMUnlimited];
  return [(SUDefaultDownloadPolicy *)self isDownloadAllowableForCellularIncludingInexpensiveHDM:v3];
}

- (id)updateDiscoveryDate
{
  BOOL v3 = objc_alloc_init(SUState);
  uint64_t v4 = [(SUState *)v3 updateDiscoveryDates];
  uint64_t v5 = [(SUDescriptor *)self->_descriptor productBuildVersion];
  uint64_t v6 = [v4 objectForKey:v5];

  return v6;
}

- (BOOL)cellularDataIsEnabled
{
  if (+[SUUtility currentReleaseTypeIsInternal])
  {
    BOOL v2 = +[SUPreferences sharedInstance];
    BOOL v3 = [v2 networkMonitorOverride];

    if (v3 && ([v3 intValue] & 0x80000000) == 0 && (int)objc_msgSend(v3, "intValue") < 10000)
    {
      uint64_t v4 = [v3 intValue];
      SULogDebug(@"device is considered cellular capable because networkMonitorOverride (%d) exists", v5, v6, v7, v8, v9, v10, v11, v4);

      return 1;
    }
  }
  return +[SUUtility cellularDataIsEnabled];
}

- (BOOL)isDownloadAllowableForCellularIncludingInexpensiveHDM:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(SUDescriptor *)self->_descriptor isDownloadable]
    || ![(SUDescriptor *)self->_descriptor isDownloadableOverCellular])
  {
    uint64_t v13 = @"Cellular download not allowable due to SU asset configuration";
    goto LABEL_10;
  }
  if (!self->_cellularCapable)
  {
    uint64_t v13 = @"Cellular download not allowed because device is not cellular capable";
    goto LABEL_10;
  }
  if (![(SUDefaultDownloadPolicy *)self cellularDataIsEnabled])
  {
    uint64_t v13 = @"Cellular download not allowed because cellular data not enabled for device";
    goto LABEL_10;
  }
  carrierPolicy = self->_carrierPolicy;
  if (!carrierPolicy)
  {
    uint64_t v13 = @"Cellular download not allowed because we have no carrier policy";
    goto LABEL_10;
  }
  if (![(SUCarrierDownloadPolicyProperties *)carrierPolicy isDownloadAllowable])
  {
    uint64_t v13 = @"Cellular download not allowed because carrier policy prevents cellular download";
    goto LABEL_10;
  }
  if (self->_cellularFeeAgreementStatus == 2)
  {
    uint64_t v13 = @"Cellular download not allowed because cellular fee agreement declined";
LABEL_10:
    SULogInfo(v13, v5, v6, v7, v8, v9, v10, v11, v54);
    return 0;
  }
  if (v3 && [(SUDefaultDownloadPolicy *)self _inexpensiveHDM])
  {
    SULogInfo(@"Network type is inexpensive HDM. SU download allowed", v15, v16, v17, v18, v19, v20, v21, v54);
    return 1;
  }
  v22 = +[SUPreferences sharedInstance];
  int v23 = [v22 disableUserWiFiOnlyPeriod];

  if (!v23)
  {
    v31 = [(SUDefaultDownloadPolicy *)self updateDiscoveryDate];
    unint64_t v32 = [(SUCarrierDownloadPolicyProperties *)self->_carrierPolicy numberOfDaysToWaitForCellularDownload];
    unint64_t v40 = v32;
    if (v31)
    {
      v41 = [MEMORY[0x263EFF910] date];
      v42 = +[SUUtility addToDate:v31 numberOfDays:v40];
      v43 = [v41 laterDate:v42];
      int v44 = [v43 isEqualToDate:v42];

      if (v44)
      {
        v45 = +[SUUtility prettyPrintDate:v31];
        v55 = +[SUUtility prettyPrintDate:v41];
        SULogInfo(@"Cellular download not allowed because wifi-only days unmet. Discovery date: %@ Current date: %@ DaysToWait: %lu", v46, v47, v48, v49, v50, v51, v52, (uint64_t)v45);

LABEL_26:
        return 0;
      }
    }
    else if (v32)
    {
      SULogInfo(@"Cellular download not allowed because unknown update discovery date", v33, v34, v35, v36, v37, v38, v39, v54);
      goto LABEL_26;
    }

    goto LABEL_29;
  }
  SULogInfo(@"SUDisableUserWiFiOnlyPeriod is set; will not apply the wifi-only-period check",
    v24,
    v25,
    v26,
    v27,
    v28,
    v29,
    v30,
    v54);
LABEL_29:
  unint64_t v53 = [(SUCarrierDownloadPolicyProperties *)self->_carrierPolicy maximumDownloadSizeInBytes];
  if ((v53 & 0x8000000000000000) == 0 && v53 < [(SUDescriptor *)self->_descriptor downloadSize])
  {
    uint64_t v13 = @"Cellular download not allowed because update is larger than carrier maximum download size";
    goto LABEL_10;
  }
  return 1;
}

- (BOOL)cellularDownloadFeesApply
{
  return ![(SUDefaultDownloadPolicy *)self isDownloadFreeForCellular];
}

- (BOOL)isDownloadAllowableForCellular2G
{
  BOOL v3 = [(SUDefaultDownloadPolicy *)self isDownloadAllowableForCellular];
  if (v3)
  {
    if (self->_cellularCapable)
    {
      carrierPolicy = self->_carrierPolicy;
      LOBYTE(v3) = [(SUCarrierDownloadPolicyProperties *)carrierPolicy isDownloadAllowableOver2G];
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (unint64_t)wifiOnlyPeriodInDays
{
  if ([(SUDescriptor *)self->_descriptor updateType] != 3 && self->_cellularCapable)
  {
    carrierPolicy = self->_carrierPolicy;
    if (carrierPolicy) {
      [(SUCarrierDownloadPolicyProperties *)carrierPolicy numberOfDaysToWaitForCellularDownload];
    }
  }
  return 0;
}

- (BOOL)_isDownloadableForNetworkType:(int)a3 error:(int64_t *)a4 cellularFeesApply:(BOOL *)a5 powerRequired:(BOOL *)a6
{
  if (!a4)
  {
    if (![(SUDefaultDownloadPolicy *)self isDownloadable]) {
      return 0;
    }
LABEL_5:
    if (a5) {
      *a5 = [(SUDefaultDownloadPolicy *)self cellularDownloadFeesApply];
    }
    BOOL v11 = [(SUDefaultDownloadPolicy *)self batteryPolicySatisfied];
    if (a6) {
      *a6 = !v11;
    }
    if (![(SUDefaultDownloadPolicy *)self hasEnoughDiskSpace])
    {
      if (a4)
      {
        BOOL v11 = 0;
        int64_t v12 = 6;
        goto LABEL_16;
      }
      return 0;
    }
    if (![(SUDefaultDownloadPolicy *)self allowExpensiveNetwork]
      && [(SUNetworkMonitor *)self->_networkMonitor isCurrentNetworkTypeExpensive])
    {
      SULogInfo(@"%s preventing download on expensive network", v13, v14, v15, v16, v17, v18, v19, (uint64_t)"-[SUDefaultDownloadPolicy _isDownloadableForNetworkType:error:cellularFeesApply:powerRequired:]");
      if (a4)
      {
        BOOL v11 = 0;
        int64_t v12 = 83;
        goto LABEL_16;
      }
      return 0;
    }
    uint64_t v20 = [(SUDefaultDownloadPolicy *)self networkMonitor];
    int v47 = [v20 isBootstrap];

    uint64_t v21 = [(SUDefaultDownloadPolicy *)self networkMonitor];
    int v46 = a3;
    int v22 = [v21 isPathSatisfied];

    int v23 = [(SUDefaultDownloadPolicy *)self networkMonitor];
    int v24 = [v23 isCellularRoaming];

    uint64_t v25 = [(SUDefaultDownloadPolicy *)self networkMonitor];
    int v26 = [v25 isCellularDataRoamingEnabled];

    BOOL v27 = [(SUDefaultDownloadPolicy *)self isDownloadAllowableForCellularRoaming];
    BOOL v28 = [(SUDefaultDownloadPolicy *)self isDownloadAllowableForCellular];
    BOOL v29 = [(SUDefaultDownloadPolicy *)self isDownloadAllowableForCellular2G];
    BOOL v30 = [(SUDefaultDownloadPolicy *)self isDownloadAllowableForWiFi];
    int v45 = v26;
    SULogInfo(@"%s networkType:%d, powerRequired:%d, isBootstrap:%d, isPathSatisfied:%d, isRoaming:%d, isRoamingDataEnabled:%d, isRoamingDataAllowed:%d, allowedOverCellular:%d, allowedOverCellular2G:%d, allowedOverWiFi:%d", v31, v32, v33, v34, v35, v36, v37, (uint64_t)"-[SUDefaultDownloadPolicy _isDownloadableForNetworkType:error:cellularFeesApply:powerRequired:]");
    v54[0] = MEMORY[0x263EF8330];
    v54[1] = 3221225472;
    v54[2] = __95__SUDefaultDownloadPolicy__isDownloadableForNetworkType_error_cellularFeesApply_powerRequired___block_invoke;
    v54[3] = &__block_descriptor_33_e11_q24__0q8q16l;
    BOOL v55 = v27;
    uint64_t v38 = (void *)MEMORY[0x223C18480](v54);
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __95__SUDefaultDownloadPolicy__isDownloadableForNetworkType_error_cellularFeesApply_powerRequired___block_invoke_2;
    v48[3] = &unk_26447ED68;
    BOOL v51 = v28;
    BOOL v52 = v29;
    BOOL v53 = v30;
    id v49 = v38;
    uint64_t v50 = a4;
    id v39 = v38;
    uint64_t v40 = MEMORY[0x223C18480](v48);
    v41 = (void *)v40;
    if ((v46 - 2) >= 8)
    {
      if (v46 != 1)
      {
        if (v46) {
          goto LABEL_38;
        }
        goto LABEL_37;
      }
      if (!v30)
      {
LABEL_37:
        (*(void (**)(uint64_t))(v40 + 16))(v40);
LABEL_38:
        BOOL v11 = 0;
LABEL_39:

        return v11;
      }
    }
    else
    {
      if (!v28 || v24 && (v45 & v27) == 0) {
        goto LABEL_37;
      }
      BOOL v42 = v46 != 2 || v29;
      if (!v42 || !(v47 ^ 1 | v22)) {
        goto LABEL_37;
      }
    }
    if (a4) {
      char v43 = v11;
    }
    else {
      char v43 = 1;
    }
    if ((v43 & 1) == 0)
    {
      BOOL v11 = 0;
      *a4 = 24;
    }
    goto LABEL_39;
  }
  *a4 = 0;
  if ([(SUDefaultDownloadPolicy *)self isDownloadable]) {
    goto LABEL_5;
  }
  BOOL v11 = 0;
  int64_t v12 = 31;
LABEL_16:
  *a4 = v12;
  return v11;
}

uint64_t __95__SUDefaultDownloadPolicy__isDownloadableForNetworkType_error_cellularFeesApply_powerRequired___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)(a1 + 32)) {
    return a2;
  }
  else {
    return a3;
  }
}

uint64_t __95__SUDefaultDownloadPolicy__isDownloadableForNetworkType_error_cellularFeesApply_powerRequired___block_invoke_2(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(result + 48))
  {
    uint64_t v2 = *(void *)(result + 40);
    if (*(unsigned char *)(result + 49))
    {
      if (!v2) {
        return result;
      }
      BOOL v3 = *(uint64_t (**)(void))(*(void *)(result + 32) + 16);
    }
    else
    {
      if (!v2) {
        return result;
      }
      BOOL v3 = *(uint64_t (**)(void))(*(void *)(result + 32) + 16);
    }
    result = v3();
    **(void **)(v1 + 40) = result;
  }
  else
  {
    uint64_t v4 = *(uint64_t **)(result + 40);
    if (v4)
    {
      uint64_t v5 = 9;
      if (!*(unsigned char *)(result + 50)) {
        uint64_t v5 = 31;
      }
      *uint64_t v4 = v5;
    }
  }
  return result;
}

- (BOOL)_inexpensiveHDM
{
  unsigned int v3 = [(SUNetworkMonitor *)self->_networkMonitor currentCellularType];
  BOOL v4 = [(SUNetworkMonitor *)self->_networkMonitor isCurrentNetworkTypeExpensive];
  BOOL v5 = v3 == 5 && !v4;
  if (!v5)
  {
    uint64_t v6 = SUStringFromNetworkType(v3);
    SULogInfo(@"Device does not currently fall within 5G HDM policy: Network type: %@ NWPath isExpensive: %@", v7, v8, v9, v10, v11, v12, v13, (uint64_t)v6);
  }
  return v5;
}

- (SUDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
}

- (SUCarrierDownloadPolicyProperties)carrierPolicy
{
  return self->_carrierPolicy;
}

- (void)setCarrierPolicy:(id)a3
{
}

- (BOOL)isCellularCapable
{
  return self->_cellularCapable;
}

- (void)setCellularCapable:(BOOL)a3
{
  self->_cellularCapable = a3;
}

- (SUNetworkMonitor)networkMonitor
{
  return self->_networkMonitor;
}

- (void)setNetworkMonitor:(id)a3
{
}

- (int)cellularFeeAgreementStatus
{
  return self->_cellularFeeAgreementStatus;
}

- (void)setCellularFeeAgreementStatus:(int)a3
{
  self->_cellularFeeAgreementStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkMonitor, 0);
  objc_storeStrong((id *)&self->_carrierPolicy, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end