@interface SUDownloadOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)allowCellular;
- (BOOL)allowExpensiveNetwork;
- (BOOL)allowUnrestrictedCellularDownload;
- (BOOL)allowsUnrestrictedCellularDownload;
- (BOOL)isAppOffloadEnabled;
- (BOOL)isAutoDownload;
- (BOOL)isCacheDeleteSpecialCaseEnabled;
- (BOOL)isDownloadOnly;
- (BOOL)isEnabledForCellularRoaming;
- (BOOL)isEnabledForWifi;
- (BOOL)isEnabledOnBatteryPower;
- (BOOL)isEqual:(id)a3;
- (BOOL)userUpdateTonight;
- (NSString)clientName;
- (SUDescriptor)descriptor;
- (SUDescriptor)downloadDescriptor;
- (SUDownloadOptions)initWithCoder:(id)a3;
- (SUDownloadOptions)initWithDescriptor:(id)a3;
- (SUDownloadOptions)initWithMetadata:(id)a3 andDescriptor:(id)a4;
- (SUDownloadPolicy)activeDownloadPolicy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)activeDownloadPolicyType;
- (int)downloadFeeAgreementStatus;
- (int)termsAndConditionsAgreementStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveDownloadPolicy:(id)a3;
- (void)setActiveDownloadPolicyType:(int)a3;
- (void)setAllowUnrestrictedCellularDownload:(BOOL)a3;
- (void)setAutoDownload:(BOOL)a3;
- (void)setClientName:(id)a3;
- (void)setDownloadDescriptor:(id)a3;
- (void)setDownloadFeeAgreementStatus:(int)a3;
- (void)setDownloadOnly:(BOOL)a3;
- (void)setTermsAndConditionsAgreementStatus:(int)a3;
- (void)setUserUpdateTonight:(BOOL)a3;
@end

@implementation SUDownloadOptions

- (SUDownloadOptions)initWithDescriptor:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SUDownloadOptions;
  v6 = [(SUOptionsBase *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_descriptor, a3);
    v7->_downloadOnly = 0;
    v7->_autoDownload = 0;
    v7->_userUpdateTonight = 0;
    v7->_allowUnrestrictedCellularDownload = 0;
    v7->_downloadFeeAgreementStatus = 0;
    v7->_termsAndConditionsAgreementStatus = 0;
    v7->_activeDownloadPolicyType = 3;
    clientName = v7->_clientName;
    v7->_clientName = (NSString *)@"com.apple.softwareupdateservicesd";

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.softwareupdateservicesd.downloadoptionsqueue", 0);
    stateQueue = v7->_stateQueue;
    v7->_stateQueue = (OS_dispatch_queue *)v9;
  }
  return v7;
}

- (SUDownloadOptions)initWithMetadata:(id)a3 andDescriptor:(id)a4
{
  id v6 = a3;
  v7 = [(SUDownloadOptions *)self initWithDescriptor:a4];
  v8 = v7;
  if (v6 && v7)
  {
    v7->_downloadOnly = [v6 isDownloadOnly];
    v8->_autoDownload = [v6 isAutoDownload];
    v8->_userUpdateTonight = 0;
    v8->_allowUnrestrictedCellularDownload = 0;
    v8->_downloadFeeAgreementStatus = [v6 downloadFeeAgreementStatus];
    v8->_termsAndConditionsAgreementStatus = [v6 termsAndConditionsAgreementStatus];
    v8->_activeDownloadPolicyType = [v6 activeDownloadPolicyType];
    clientName = v8->_clientName;
    v8->_clientName = (NSString *)@"com.apple.softwareupdateservicesd";
  }
  return v8;
}

- (void)setActiveDownloadPolicyType:(int)a3
{
  stateQueue = self->_stateQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__SUDownloadOptions_setActiveDownloadPolicyType___block_invoke;
  v4[3] = &unk_26447CD48;
  v4[4] = self;
  int v5 = a3;
  dispatch_sync(stateQueue, v4);
}

void __49__SUDownloadOptions_setActiveDownloadPolicyType___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(_DWORD *)(a1 + 40);
  if (*(_DWORD *)(v1 + 32) != v2)
  {
    *(_DWORD *)(v1 + 32) = v2;
    SUStringFromDownloadPolicyType(*(_DWORD *)(*(void *)(a1 + 32) + 32));
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    SULogInfo(@"Settings downloadPolicy to: %@", v3, v4, v5, v6, v7, v8, v9, (uint64_t)v10);
  }
}

- (int)activeDownloadPolicyType
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45__SUDownloadOptions_activeDownloadPolicyType__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__SUDownloadOptions_activeDownloadPolicyType__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 32);
  return result;
}

- (void)setDownloadFeeAgreementStatus:(int)a3
{
  stateQueue = self->_stateQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__SUDownloadOptions_setDownloadFeeAgreementStatus___block_invoke;
  v4[3] = &unk_26447CD48;
  v4[4] = self;
  int v5 = a3;
  dispatch_sync(stateQueue, v4);
}

uint64_t __51__SUDownloadOptions_setDownloadFeeAgreementStatus___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(_DWORD *)(result + 40);
  if (*(_DWORD *)(v1 + 12) != v2) {
    *(_DWORD *)(v1 + 12) = v2;
  }
  return result;
}

- (SUDownloadPolicy)activeDownloadPolicy
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__0;
  id v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41__SUDownloadOptions_activeDownloadPolicy__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SUDownloadPolicy *)v3;
}

uint64_t __41__SUDownloadOptions_activeDownloadPolicy__block_invoke(uint64_t a1)
{
  uint64_t v2 = +[SUDownloadPolicyFactory downloadPolicyForType:*(unsigned int *)(*(void *)(a1 + 32) + 32) forDescriptor:*(void *)(*(void *)(a1 + 32) + 24)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  int v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v6 = *(unsigned int *)(*(void *)(a1 + 32) + 12);
  return [v5 setCellularFeeAgreementStatus:v6];
}

- (void)setActiveDownloadPolicy:(id)a3
{
  id v4 = a3;
  int v5 = [(SUDownloadOptions *)self activeDownloadPolicy];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__SUDownloadOptions_setActiveDownloadPolicy___block_invoke;
  block[3] = &unk_26447CD70;
  id v10 = v5;
  id v11 = v4;
  objc_super v12 = self;
  id v7 = v4;
  id v8 = v5;
  dispatch_sync(stateQueue, block);
}

void __45__SUDownloadOptions_setActiveDownloadPolicy___block_invoke(uint64_t a1)
{
  int v2 = +[SUDownloadPolicyFactory downloadPolicyTypeForClass:*(void *)(a1 + 32)];
  int v3 = +[SUDownloadPolicyFactory downloadPolicyTypeForClass:*(void *)(a1 + 40)];
  if (v2 != v3
    || (int v4 = [*(id *)(a1 + 32) cellularFeeAgreementStatus],
        v4 != [*(id *)(a1 + 40) cellularFeeAgreementStatus]))
  {
    *(_DWORD *)(*(void *)(a1 + 48) + 32) = v3;
    *(_DWORD *)(*(void *)(a1 + 48) + 12) = [*(id *)(a1 + 40) cellularFeeAgreementStatus];
    SUStringFromDownloadPolicyType(*(_DWORD *)(*(void *)(a1 + 48) + 32));
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    SULogInfo(@"Settings downloadPolicy to: %@", v5, v6, v7, v8, v9, v10, v11, (uint64_t)v12);
  }
}

- (void)setAllowUnrestrictedCellularDownload:(BOOL)a3
{
  stateQueue = self->_stateQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __58__SUDownloadOptions_setAllowUnrestrictedCellularDownload___block_invoke;
  v4[3] = &unk_26447CD98;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(stateQueue, v4);
}

uint64_t __58__SUDownloadOptions_setAllowUnrestrictedCellularDownload___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 11) != v2) {
    *(unsigned char *)(v1 + 11) = v2;
  }
  return result;
}

- (BOOL)allowsUnrestrictedCellularDownload
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __55__SUDownloadOptions_allowsUnrestrictedCellularDownload__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __55__SUDownloadOptions_allowsUnrestrictedCellularDownload__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 11);
  return result;
}

- (BOOL)allowCellular
{
  char v3 = [(SUDownloadOptions *)self activeDownloadPolicy];
  int v4 = [v3 isDownloadAllowableForCellular];

  if (!v4) {
    return 0;
  }
  int v5 = [(SUDownloadOptions *)self downloadFeeAgreementStatus];
  if (v5 == 1) {
    return 1;
  }
  if (v5) {
    return 0;
  }
  uint64_t v6 = [(SUDownloadOptions *)self activeDownloadPolicy];
  if ([v6 isDownloadFreeForCellular])
  {
    char v7 = 1;
  }
  else
  {
    char v9 = [(SUDownloadOptions *)self activeDownloadPolicy];
    char v7 = [v9 is5GDownloadAllowed];
  }
  return v7;
}

- (BOOL)allowExpensiveNetwork
{
  char v3 = [(SUDownloadOptions *)self activeDownloadPolicy];
  int v4 = [v3 allowExpensiveNetwork];

  if (!v4) {
    goto LABEL_5;
  }
  int v5 = [(SUDownloadOptions *)self downloadFeeAgreementStatus];
  if (v5 != 1)
  {
    if (!v5)
    {
      uint64_t v6 = [(SUDownloadOptions *)self activeDownloadPolicy];
      char v7 = [v6 isDownloadFreeForCellular];

      LOBYTE(v5) = v7;
      return v5;
    }
LABEL_5:
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)isEnabledForCellularRoaming
{
  BOOL v3 = [(SUDownloadOptions *)self allowCellular];
  if (v3)
  {
    int v4 = [(SUDownloadOptions *)self activeDownloadPolicy];
    char v5 = [v4 isDownloadAllowableForCellularRoaming];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isEnabledForWifi
{
  int v2 = [(SUDownloadOptions *)self activeDownloadPolicy];
  char v3 = [v2 isDownloadAllowableForWiFi];

  return v3;
}

- (BOOL)isEnabledOnBatteryPower
{
  int v2 = [(SUDownloadOptions *)self activeDownloadPolicy];
  char v3 = [v2 isPowerRequired] ^ 1;

  return v3;
}

- (BOOL)isCacheDeleteSpecialCaseEnabled
{
  int v2 = [(SUDownloadOptions *)self descriptor];
  char v3 = [v2 cdLevel4Disabled] ^ 1;

  return v3;
}

- (BOOL)isAppOffloadEnabled
{
  int v2 = [(SUDownloadOptions *)self descriptor];
  char v3 = [v2 appDemotionDisabled] ^ 1;

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  int v4 = (SUDownloadOptions *)a3;
  if (v4 == self)
  {
    LOBYTE(v15) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v5 = v4;
      uint64_t v6 = [(SUDownloadOptions *)v5 descriptor];
      char v7 = [(SUDownloadOptions *)self descriptor];
      if ([v6 isEqual:v7]
        && (BOOL v8 = [(SUDownloadOptions *)v5 isAutoDownload],
            v8 == [(SUDownloadOptions *)self isAutoDownload])
        && (BOOL v9 = [(SUDownloadOptions *)v5 isDownloadOnly],
            v9 == [(SUDownloadOptions *)self isDownloadOnly])
        && (BOOL v10 = [(SUDownloadOptions *)v5 userUpdateTonight],
            v10 == [(SUDownloadOptions *)self userUpdateTonight])
        && (int v11 = [(SUDownloadOptions *)v5 downloadFeeAgreementStatus],
            v11 == [(SUDownloadOptions *)self downloadFeeAgreementStatus])
        && (int v12 = [(SUDownloadOptions *)v5 termsAndConditionsAgreementStatus],
            v12 == [(SUDownloadOptions *)self termsAndConditionsAgreementStatus]))
      {
        v13 = [(SUDownloadOptions *)v5 activeDownloadPolicy];
        v14 = [(SUDownloadOptions *)self activeDownloadPolicy];
        if (v13 == v14)
        {
          BOOL v17 = [(SUDownloadOptions *)v5 allowUnrestrictedCellularDownload];
          int v15 = v17 ^ [(SUDownloadOptions *)self allowUnrestrictedCellularDownload] ^ 1;
        }
        else
        {
          LOBYTE(v15) = 0;
        }
      }
      else
      {
        LOBYTE(v15) = 0;
      }
    }
    else
    {
      LOBYTE(v15) = 0;
    }
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUDownloadOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SUDownloadOptions;
  char v5 = [(SUOptionsBase *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"descriptor"];
    char v5 = [(SUDownloadOptions *)v5 initWithDescriptor:v6];
    -[SUDownloadOptions setDownloadOnly:](v5, "setDownloadOnly:", [v4 decodeBoolForKey:@"downloadOnly"]);
    -[SUDownloadOptions setAutoDownload:](v5, "setAutoDownload:", [v4 decodeBoolForKey:@"autoDownload"]);
    -[SUDownloadOptions setUserUpdateTonight:](v5, "setUserUpdateTonight:", [v4 decodeBoolForKey:@"userUpdateTonight"]);
    -[SUDownloadOptions setAllowUnrestrictedCellularDownload:](v5, "setAllowUnrestrictedCellularDownload:", [v4 decodeBoolForKey:@"allowUnrestrictedCellularDownload"]);
    -[SUDownloadOptions setDownloadFeeAgreementStatus:](v5, "setDownloadFeeAgreementStatus:", [v4 decodeIntForKey:@"feeAgreementStatus"]);
    -[SUDownloadOptions setTermsAndConditionsAgreementStatus:](v5, "setTermsAndConditionsAgreementStatus:", [v4 decodeIntForKey:@"termsAgreementStatus"]);
    char v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"descriptor"];
    [(SUDownloadOptions *)v5 setDownloadDescriptor:v7];

    -[SUDownloadOptions setActiveDownloadPolicyType:](v5, "setActiveDownloadPolicyType:", [v4 decodeIntForKey:@"policyType"]);
    BOOL v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SUDownloadClientNameKey"];
    [(SUDownloadOptions *)v5 setClientName:v8];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL downloadOnly = self->_downloadOnly;
  id v5 = a3;
  [v5 encodeBool:downloadOnly forKey:@"downloadOnly"];
  [v5 encodeBool:self->_autoDownload forKey:@"autoDownload"];
  [v5 encodeBool:self->_userUpdateTonight forKey:@"userUpdateTonight"];
  [v5 encodeBool:self->_allowUnrestrictedCellularDownload forKey:@"allowUnrestrictedCellularDownload"];
  [v5 encodeInt:self->_downloadFeeAgreementStatus forKey:@"feeAgreementStatus"];
  [v5 encodeInt:self->_termsAndConditionsAgreementStatus forKey:@"termsAgreementStatus"];
  [v5 encodeObject:self->_descriptor forKey:@"descriptor"];
  [v5 encodeInt:self->_activeDownloadPolicyType forKey:@"policyType"];
  [v5 encodeObject:self->_clientName forKey:@"SUDownloadClientNameKey"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDescriptor:self->_descriptor];
  [v4 setAutoDownload:self->_autoDownload];
  [v4 setDownloadOnly:self->_downloadOnly];
  [v4 setUserUpdateTonight:self->_userUpdateTonight];
  [v4 setAllowUnrestrictedCellularDownload:self->_allowUnrestrictedCellularDownload];
  [v4 setActiveDownloadPolicyType:self->_activeDownloadPolicyType];
  [v4 setDownloadFeeAgreementStatus:self->_downloadFeeAgreementStatus];
  [v4 setTermsAndConditionsAgreementStatus:self->_termsAndConditionsAgreementStatus];
  id v5 = (void *)[(SUDescriptor *)self->_descriptor copy];
  [v4 setDownloadDescriptor:v5];

  [v4 setClientName:self->_clientName];
  return v4;
}

- (id)description
{
  v21 = NSString;
  v20 = [(SUDownloadOptions *)self clientName];
  char v3 = @"YES";
  if ([(SUDownloadOptions *)self isDownloadOnly]) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  v19 = v4;
  if ([(SUDownloadOptions *)self isAutoDownload]) {
    id v5 = @"YES";
  }
  else {
    id v5 = @"NO";
  }
  v18 = v5;
  if ([(SUDownloadOptions *)self userUpdateTonight]) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  BOOL v17 = v6;
  if ([(SUDownloadOptions *)self allowsUnrestrictedCellularDownload]) {
    char v7 = @"YES";
  }
  else {
    char v7 = @"NO";
  }
  BOOL v8 = SUStringFromAgreementStatus([(SUDownloadOptions *)self downloadFeeAgreementStatus]);
  BOOL v9 = SUStringFromAgreementStatus([(SUDownloadOptions *)self termsAndConditionsAgreementStatus]);
  objc_super v10 = SUStringFromDownloadPolicyType([(SUDownloadOptions *)self activeDownloadPolicyType]);
  if ([(SUDownloadOptions *)self isEnabledForCellular]) {
    int v11 = @"YES";
  }
  else {
    int v11 = @"NO";
  }
  if ([(SUDownloadOptions *)self isEnabledForWifi]) {
    int v12 = @"YES";
  }
  else {
    int v12 = @"NO";
  }
  if ([(SUDownloadOptions *)self isEnabledOnBatteryPower]) {
    v13 = @"YES";
  }
  else {
    v13 = @"NO";
  }
  if (![(SUDownloadOptions *)self isEnabledForCellularRoaming]) {
    char v3 = @"NO";
  }
  v14 = [(SUDownloadOptions *)self descriptor];
  int v15 = [v21 stringWithFormat:@"\n            ClientName: %@\n            downloadOnly: %@\n            autoDownoad: %@\n            userUpdateTonight: %@\n            allowUnrestrictedCellularDownload: %@\n            downloadFeeAgreementStatus: %@\n            termsAndConditionsAgreementStatus: %@\n            activeDownloadPolicyType: %@\n            enabledForCellular: %@\n            enabledForWifi: %@\n            enabledOnBatteryPower: %@\n            enabledForCellularRoaming: %@\n            descriptor: %@\n", v20, v19, v18, v17, v7, v8, v9, v10, v11, v12, v13, v3, v14];

  return v15;
}

- (BOOL)isDownloadOnly
{
  return self->_downloadOnly;
}

- (void)setDownloadOnly:(BOOL)a3
{
  self->_BOOL downloadOnly = a3;
}

- (BOOL)isAutoDownload
{
  return self->_autoDownload;
}

- (void)setAutoDownload:(BOOL)a3
{
  self->_autoDownload = a3;
}

- (BOOL)userUpdateTonight
{
  return self->_userUpdateTonight;
}

- (void)setUserUpdateTonight:(BOOL)a3
{
  self->_userUpdateTonight = a3;
}

- (BOOL)allowUnrestrictedCellularDownload
{
  return self->_allowUnrestrictedCellularDownload;
}

- (int)downloadFeeAgreementStatus
{
  return self->_downloadFeeAgreementStatus;
}

- (int)termsAndConditionsAgreementStatus
{
  return self->_termsAndConditionsAgreementStatus;
}

- (void)setTermsAndConditionsAgreementStatus:(int)a3
{
  self->_termsAndConditionsAgreementStatus = a3;
}

- (SUDescriptor)descriptor
{
  return self->_descriptor;
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
}

- (SUDescriptor)downloadDescriptor
{
  return self->_downloadDescriptor;
}

- (void)setDownloadDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadDescriptor, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end