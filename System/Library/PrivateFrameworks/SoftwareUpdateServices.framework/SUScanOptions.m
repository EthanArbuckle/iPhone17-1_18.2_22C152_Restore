@interface SUScanOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)MDMShowRapidSecurityResponse;
- (BOOL)MDMUseDelayPeriod;
- (BOOL)_identifierIsAllowedToSetManagedScanOptions;
- (BOOL)clientIsBuddy;
- (BOOL)clientIsDDM;
- (BOOL)containsType:(int)a3;
- (BOOL)disablePreSoftwareUpdateStaging;
- (BOOL)disableSplatCombo;
- (BOOL)findsAnyUpdate;
- (BOOL)ignoreNoUpdateFoundResult;
- (BOOL)isEmergencyOnlyScan;
- (BOOL)isForced;
- (BOOL)isPMVRequested;
- (BOOL)isSplatOnlyScan;
- (NSSet)types;
- (NSString)clientName;
- (NSString)identifier;
- (NSString)requestedBuild;
- (NSString)requestedPMV;
- (NSString)sessionID;
- (SUScanOptions)init;
- (SUScanOptions)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)managedScanOptions;
- (unint64_t)MDMSoftwareUpdatePath;
- (unint64_t)scanType;
- (void)addType:(int)a3;
- (void)clearTypes;
- (void)encodeWithCoder:(id)a3;
- (void)removeType:(int)a3;
- (void)setClientName:(id)a3;
- (void)setDisablePreSoftwareUpdateStaging:(BOOL)a3;
- (void)setDisableSplatCombo:(BOOL)a3;
- (void)setForced:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIgnoreNoUpdateFoundResult:(BOOL)a3;
- (void)setMDMShowRapidSecurityResponse:(BOOL)a3;
- (void)setMDMSoftwareUpdatePath:(unint64_t)a3;
- (void)setMDMUseDelayPeriod:(BOOL)a3;
- (void)setManagedScanOptions:(id)a3;
- (void)setRequestedBuild:(id)a3;
- (void)setRequestedPMV:(id)a3;
- (void)setScanType:(unint64_t)a3;
- (void)setSessionID:(id)a3;
- (void)setTypes:(id)a3;
@end

@implementation SUScanOptions

- (BOOL)_identifierIsAllowedToSetManagedScanOptions
{
  if (([@"com.apple.mdm" isEqualToString:self->_identifier] & 1) != 0
    || ([@"com.apple.SoftwareUpdateServices.DDM" isEqualToString:self->_identifier] & 1) != 0)
  {
    return 1;
  }
  identifier = self->_identifier;
  return [@"com.apple.sus_tool" isEqualToString:identifier];
}

- (NSString)requestedPMV
{
  return [(SUMDMScanOptions *)self->_managedScanOptions requestedProductMarketingVersion];
}

- (void)setRequestedPMV:(id)a3
{
}

- (NSString)requestedBuild
{
  return [(SUMDMScanOptions *)self->_managedScanOptions requestedBuildVersion];
}

- (void)setRequestedBuild:(id)a3
{
}

- (BOOL)MDMUseDelayPeriod
{
  managedScanOptions = self->_managedScanOptions;
  if (managedScanOptions) {
    LOBYTE(managedScanOptions) = [(SUMDMScanOptions *)managedScanOptions useDelayPeriod] == 1;
  }
  return (char)managedScanOptions;
}

- (void)setMDMUseDelayPeriod:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SUScanOptions *)self _identifierIsAllowedToSetManagedScanOptions])
  {
    managedScanOptions = self->_managedScanOptions;
    [(SUMDMScanOptions *)managedScanOptions setUseDelayPeriod:v3];
  }
}

- (BOOL)MDMShowRapidSecurityResponse
{
  managedScanOptions = self->_managedScanOptions;
  return !managedScanOptions || [(SUMDMScanOptions *)managedScanOptions allowSplat] != 0;
}

- (void)setMDMShowRapidSecurityResponse:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SUScanOptions *)self _identifierIsAllowedToSetManagedScanOptions])
  {
    managedScanOptions = self->_managedScanOptions;
    [(SUMDMScanOptions *)managedScanOptions setAllowSplat:v3];
  }
}

- (unint64_t)MDMSoftwareUpdatePath
{
  unint64_t result = [(SUMDMScanOptions *)self->_managedScanOptions MDMSoftwareUpdatePath];
  if (result == 3) {
    return 0;
  }
  return result;
}

- (void)setMDMSoftwareUpdatePath:(unint64_t)a3
{
  if ([(SUScanOptions *)self _identifierIsAllowedToSetManagedScanOptions])
  {
    managedScanOptions = self->_managedScanOptions;
    [(SUMDMScanOptions *)managedScanOptions setMDMSoftwareUpdatePath:a3];
  }
}

- (id)managedScanOptions
{
  return self->_managedScanOptions;
}

- (void)setManagedScanOptions:(id)a3
{
}

- (SUScanOptions)init
{
  v10.receiver = self;
  v10.super_class = (Class)SUScanOptions;
  v2 = [(SUOptionsBase *)&v10 init];
  if (v2)
  {
    BOOL v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    types = v2->_types;
    v2->_types = v3;

    sessionID = v2->_sessionID;
    v2->_sessionID = 0;

    v2->_ignoreNoUpdateFoundResult = 0;
    clientName = v2->_clientName;
    v2->_clientName = (NSString *)@"com.apple.softwareupdateservicesd";

    v2->_scanType = 0;
    uint64_t v7 = objc_opt_new();
    managedScanOptions = v2->_managedScanOptions;
    v2->_managedScanOptions = (SUMDMScanOptions *)v7;

    v2->_disableSplatCombo = 0;
    v2->_disablePreSoftwareUpdateStaging = 0;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUScanOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SUScanOptions;
  v5 = [(SUOptionsBase *)&v15 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    [(SUScanOptions *)v5 setIdentifier:v6];

    -[SUScanOptions setForced:](v5, "setForced:", [v4 decodeBoolForKey:@"forced"]);
    uint64_t v7 = (void *)MEMORY[0x263EFFA08];
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    objc_super v10 = [v4 decodeObjectOfClasses:v9 forKey:@"types"];
    [(SUScanOptions *)v5 setTypes:v10];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionID"];
    [(SUScanOptions *)v5 setSessionID:v11];

    -[SUScanOptions setIgnoreNoUpdateFoundResult:](v5, "setIgnoreNoUpdateFoundResult:", [v4 decodeBoolForKey:@"ignoreNoUpdateFoundResult"]);
    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SUScanClientNameKey"];
    [(SUScanOptions *)v5 setClientName:v12];

    -[SUScanOptions setScanType:](v5, "setScanType:", (int)[v4 decodeIntForKey:@"SUScanTaskTypeKey"]);
    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"managedScanOptions"];
    [(SUScanOptions *)v5 setManagedScanOptions:v13];

    -[SUScanOptions setDisableSplatCombo:](v5, "setDisableSplatCombo:", [v4 decodeBoolForKey:@"disableSplombo"]);
    -[SUScanOptions setDisablePreSoftwareUpdateStaging:](v5, "setDisablePreSoftwareUpdateStaging:", [v4 decodeBoolForKey:@"disablePSUS"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeBool:self->_forced forKey:@"forced"];
  [v5 encodeObject:self->_types forKey:@"types"];
  [v5 encodeObject:self->_sessionID forKey:@"sessionID"];
  [v5 encodeBool:self->_ignoreNoUpdateFoundResult forKey:@"ignoreNoUpdateFoundResult"];
  [v5 encodeObject:self->_clientName forKey:@"SUScanClientNameKey"];
  [v5 encodeInt:LODWORD(self->_scanType) forKey:@"SUScanTaskTypeKey"];
  [v5 encodeObject:self->_managedScanOptions forKey:@"managedScanOptions"];
  [v5 encodeBool:self->_disableSplatCombo forKey:@"disableSplombo"];
  [v5 encodeBool:self->_disablePreSoftwareUpdateStaging forKey:@"disablePSUS"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  id v5 = (void *)[(NSString *)self->_identifier copy];
  [v4 setIdentifier:v5];

  [v4 setForced:self->_forced];
  v6 = (void *)[(NSMutableSet *)self->_types copy];
  [v4 setTypes:v6];

  uint64_t v7 = (void *)[(NSString *)self->_sessionID copy];
  [v4 setSessionID:v7];

  [v4 setIgnoreNoUpdateFoundResult:self->_ignoreNoUpdateFoundResult];
  uint64_t v8 = (void *)[(NSString *)self->_clientName copy];
  [v4 setClientName:v8];

  [v4 setScanType:self->_scanType];
  v9 = (void *)[(SUMDMScanOptions *)self->_managedScanOptions copy];
  [v4 setManagedScanOptions:v9];

  [v4 setDisableSplatCombo:self->_disableSplatCombo];
  [v4 setDisablePreSoftwareUpdateStaging:self->_disablePreSoftwareUpdateStaging];
  return v4;
}

- (BOOL)isSplatOnlyScan
{
  BOOL v3 = [(SUScanOptions *)self types];
  if ([v3 count] == 1)
  {
    id v4 = [(SUScanOptions *)self types];
    char v5 = [v4 containsObject:&unk_26CEBCFB8];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)addType:(int)a3
{
  id v4 = [NSNumber numberWithInt:*(void *)&a3];
  [(NSMutableSet *)self->_types addObject:v4];
}

- (void)removeType:(int)a3
{
  id v4 = [NSNumber numberWithInt:*(void *)&a3];
  [(NSMutableSet *)self->_types removeObject:v4];
}

- (BOOL)containsType:(int)a3
{
  id v4 = [NSNumber numberWithInt:*(void *)&a3];
  LOBYTE(self) = [(NSMutableSet *)self->_types containsObject:v4];

  return (char)self;
}

- (BOOL)findsAnyUpdate
{
  types = self->_types;
  if (!types || ![(NSMutableSet *)types count]) {
    return 1;
  }
  return [(SUScanOptions *)self containsType:0];
}

- (void)clearTypes
{
}

- (id)description
{
  v19 = NSString;
  v17 = [(SUScanOptions *)self clientName];
  v16 = [(SUScanOptions *)self identifier];
  if ([(SUScanOptions *)self isForced]) {
    BOOL v3 = @"YES";
  }
  else {
    BOOL v3 = @"NO";
  }
  objc_super v15 = v3;
  unint64_t v14 = [(SUScanOptions *)self scanType];
  v18 = [(SUScanOptions *)self types];
  id v4 = SUStringFromUpdateTypes(v18);
  char v5 = [(SUScanOptions *)self requestedPMV];
  v6 = [(SUScanOptions *)self requestedBuild];
  uint64_t v7 = [(SUScanOptions *)self sessionID];
  if ([(SUScanOptions *)self MDMUseDelayPeriod]) {
    uint64_t v8 = @"YES";
  }
  else {
    uint64_t v8 = @"NO";
  }
  if ([(SUScanOptions *)self MDMShowRapidSecurityResponse]) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  objc_super v10 = [(SUScanOptions *)self managedScanOptions];
  if ([(SUScanOptions *)self ignoreNoUpdateFoundResult]) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  v12 = [v19 stringWithFormat:@"\n            ClientName: %@\n            Identifier: %@\n            Forced: %@\n            ScanType: %d\n            Types: %@\n            Requested PMV: %@\n            Requested Build: %@\n            SessionID: %@\n            MDM use delay: %@\n            MDM show RSR: %@\n            =============== MDM: %@ \n            ===================\n            Ignore NoUpdateFound response: %@\n", v17, v16, v15, v14, v4, v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)isForced
{
  return self->_forced;
}

- (void)setForced:(BOOL)a3
{
  self->_forced = a3;
}

- (NSSet)types
{
  return &self->_types->super;
}

- (void)setTypes:(id)a3
{
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (BOOL)ignoreNoUpdateFoundResult
{
  return self->_ignoreNoUpdateFoundResult;
}

- (void)setIgnoreNoUpdateFoundResult:(BOOL)a3
{
  self->_ignoreNoUpdateFoundResult = a3;
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
}

- (unint64_t)scanType
{
  return self->_scanType;
}

- (void)setScanType:(unint64_t)a3
{
  self->_scanType = a3;
}

- (BOOL)disableSplatCombo
{
  return self->_disableSplatCombo;
}

- (void)setDisableSplatCombo:(BOOL)a3
{
  self->_disableSplatCombo = a3;
}

- (BOOL)disablePreSoftwareUpdateStaging
{
  return self->_disablePreSoftwareUpdateStaging;
}

- (void)setDisablePreSoftwareUpdateStaging:(BOOL)a3
{
  self->_disablePreSoftwareUpdateStaging = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedScanOptions, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_types, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)isEmergencyOnlyScan
{
  BOOL v3 = [(SUScanOptions *)self types];
  if ([v3 count] == 1)
  {
    id v4 = [(SUScanOptions *)self types];
    char v5 = [v4 containsObject:&unk_26CEBD078];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)isPMVRequested
{
  v2 = [(SUScanOptions *)self requestedPMV];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)clientIsBuddy
{
  BOOL v3 = +[SUPreferences sharedInstance];
  int v4 = [v3 buddyInitiatedScan];

  if (v4)
  {
    SULogInfo(@"%s: Overriding result to YES by SUBuddyInitiatedScan", v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUScanOptions(SUS) clientIsBuddy]");
    return 1;
  }
  else
  {
    v13 = [(SUScanOptions *)self clientName];
    char v14 = [v13 isEqualToString:@"com.apple.purplebuddy"];

    return v14;
  }
}

- (BOOL)clientIsDDM
{
  v2 = [(SUScanOptions *)self identifier];
  char v3 = [v2 isEqualToString:@"com.apple.SoftwareUpdateServices.DDM"];

  return v3;
}

@end