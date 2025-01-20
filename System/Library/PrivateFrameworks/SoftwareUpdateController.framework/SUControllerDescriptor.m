@interface SUControllerDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)fullReplacement;
- (BOOL)hasBeenAbandoned;
- (BOOL)isAwaitingAdmissionControlForInstallation;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSupervisedPolicy;
- (BOOL)mandatoryUpdateEligible;
- (BOOL)mandatoryUpdateOptional;
- (BOOL)mandatoryUpdateRestrictedToOutOfTheBox;
- (BOOL)rampEnabled;
- (BOOL)userDidAcceptTermsAndConditions;
- (BOOL)willProceedWithInstallation;
- (MAAsset)documentationAsset;
- (MAAsset)softwareUpdateAsset;
- (NSDate)releaseDate;
- (NSError)denialReasons;
- (NSString)documentationID;
- (NSString)fullProductVersion;
- (NSString)humanReadableUpdateName;
- (NSString)mandatoryUpdateVersionMax;
- (NSString)mandatoryUpdateVersionMin;
- (NSString)marketingVersion;
- (NSString)productBuildVersion;
- (NSString)productSystemName;
- (NSString)productVersion;
- (NSString)publisher;
- (NSString)releaseType;
- (NSString)requestedPMV;
- (SUControllerDescriptor)init;
- (SUControllerDescriptor)initWithCoder:(id)a3;
- (SUControllerDocumentation)documentation;
- (SUCoreDescriptor)coreDescriptor;
- (id)copy;
- (id)description;
- (id)summary;
- (int64_t)compare:(id)a3;
- (int64_t)delayPeriod;
- (int64_t)downloadSize;
- (int64_t)installationSize;
- (int64_t)msuPrepareSize;
- (int64_t)preparationSize;
- (int64_t)totalRequiredFreeSpace;
- (int64_t)unarchivedSize;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCoreDescriptor:(id)a3;
- (void)setDelayPeriod:(int64_t)a3;
- (void)setDenialReasons:(id)a3;
- (void)setDocumentation:(id)a3;
- (void)setDocumentationAsset:(id)a3;
- (void)setDocumentationID:(id)a3;
- (void)setDownloadSize:(int64_t)a3;
- (void)setFullProductVersion:(id)a3;
- (void)setFullReplacement:(BOOL)a3;
- (void)setHasBeenAbandoned:(BOOL)a3;
- (void)setInstallationSize:(int64_t)a3;
- (void)setIsAwaitingAdmissionControlForInstallation:(BOOL)a3;
- (void)setIsSupervisedPolicy:(BOOL)a3;
- (void)setMandatoryUpdateEligible:(BOOL)a3;
- (void)setMandatoryUpdateOptional:(BOOL)a3;
- (void)setMandatoryUpdateRestrictedToOutOfTheBox:(BOOL)a3;
- (void)setMandatoryUpdateVersionMax:(id)a3;
- (void)setMandatoryUpdateVersionMin:(id)a3;
- (void)setMarketingVersion:(id)a3;
- (void)setMsuPrepareSize:(int64_t)a3;
- (void)setProductBuildVersion:(id)a3;
- (void)setProductSystemName:(id)a3;
- (void)setProductVersion:(id)a3;
- (void)setPublisher:(id)a3;
- (void)setRampEnabled:(BOOL)a3;
- (void)setReleaseDate:(id)a3;
- (void)setReleaseType:(id)a3;
- (void)setRequestedPMV:(id)a3;
- (void)setSoftwareUpdateAsset:(id)a3;
- (void)setTotalRequiredFreeSpace:(int64_t)a3;
- (void)setUnarchivedSize:(int64_t)a3;
- (void)setUserDidAcceptTermsAndConditions:(BOOL)a3;
- (void)setWillProceedWithInstallation:(BOOL)a3;
@end

@implementation SUControllerDescriptor

- (SUControllerDescriptor)init
{
  v22.receiver = self;
  v22.super_class = (Class)SUControllerDescriptor;
  v2 = [(SUControllerDescriptor *)&v22 init];
  v3 = v2;
  if (v2)
  {
    documentation = v2->_documentation;
    v2->_documentation = 0;

    productVersion = v3->_productVersion;
    v3->_productVersion = 0;

    productBuildVersion = v3->_productBuildVersion;
    v3->_productBuildVersion = 0;

    documentationID = v3->_documentationID;
    v3->_documentationID = 0;

    marketingVersion = v3->_marketingVersion;
    v3->_marketingVersion = 0;

    publisher = v3->_publisher;
    v3->_publisher = 0;

    productSystemName = v3->_productSystemName;
    v3->_productSystemName = 0;

    fullProductVersion = v3->_fullProductVersion;
    v3->_fullProductVersion = 0;

    denialReasons = v3->_denialReasons;
    v3->_denialReasons = 0;

    *(_WORD *)&v3->_userDidAcceptTermsAndConditions = 0;
    v3->_rampEnabled = 0;
    *(_WORD *)&v3->_willProceedWithInstallation = 0;
    v3->_installationSize = 0;
    v3->_totalRequiredFreeSpace = 0;
    v3->_downloadSize = 0;
    v3->_unarchivedSize = 0;
    v3->_msuPrepareSize = 0;
    softwareUpdateAsset = v3->_softwareUpdateAsset;
    v3->_softwareUpdateAsset = 0;

    documentationAsset = v3->_documentationAsset;
    v3->_documentationAsset = 0;

    coreDescriptor = v3->_coreDescriptor;
    v3->_coreDescriptor = 0;

    v3->_hasBeenAbandoned = 0;
    v3->_isSupervisedPolicy = 0;
    requestedPMV = v3->_requestedPMV;
    v3->_requestedPMV = 0;

    v3->_delayPeriod = 0;
    releaseType = v3->_releaseType;
    v3->_releaseType = 0;

    releaseDate = v3->_releaseDate;
    v3->_releaseDate = 0;

    v3->_mandatoryUpdateEligible = 0;
    mandatoryUpdateVersionMin = v3->_mandatoryUpdateVersionMin;
    v3->_mandatoryUpdateVersionMin = 0;

    mandatoryUpdateVersionMax = v3->_mandatoryUpdateVersionMax;
    v3->_mandatoryUpdateVersionMax = 0;

    *(_WORD *)&v3->_mandatoryUpdateOptional = 0;
  }
  return v3;
}

- (SUControllerDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)SUControllerDescriptor;
  v5 = [(SUControllerDescriptor *)&v38 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"documentation"];
    documentation = v5->_documentation;
    v5->_documentation = (SUControllerDocumentation *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productVersion"];
    productVersion = v5->_productVersion;
    v5->_productVersion = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productBuildVersion"];
    productBuildVersion = v5->_productBuildVersion;
    v5->_productBuildVersion = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"documentationID"];
    documentationID = v5->_documentationID;
    v5->_documentationID = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MarketingVersion"];
    marketingVersion = v5->_marketingVersion;
    v5->_marketingVersion = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publisher"];
    publisher = v5->_publisher;
    v5->_publisher = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productSystemName"];
    productSystemName = v5->_productSystemName;
    v5->_productSystemName = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"denialReasons"];
    denialReasons = v5->_denialReasons;
    v5->_denialReasons = (NSError *)v20;

    v5->_downloadSize = [v4 decodeInt64ForKey:@"downloadSize"];
    v5->_unarchivedSize = [v4 decodeInt64ForKey:@"unarchivedSize"];
    v5->_msuPrepareSize = [v4 decodeInt64ForKey:@"msuPrepareSize"];
    v5->_installationSize = [v4 decodeInt64ForKey:@"installationSize"];
    v5->_totalRequiredFreeSpace = [v4 decodeInt64ForKey:@"TotalRequiredFreeSpace"];
    v5->_userDidAcceptTermsAndConditions = [v4 decodeBoolForKey:@"userDidAcceptTermsAndConditions"];
    v5->_fullReplacement = [v4 decodeBoolForKey:@"fullReplacement"];
    v5->_rampEnabled = [v4 decodeBoolForKey:@"rampEnabled"];
    v5->_willProceedWithInstallation = [v4 decodeBoolForKey:@"willProceedWithInstallation"];
    v5->_isAwaitingAdmissionControlForInstallation = [v4 decodeBoolForKey:@"isAwaitingAdmissionControlForInstallation"];
    fullProductVersion = v5->_fullProductVersion;
    v5->_fullProductVersion = 0;

    softwareUpdateAsset = v5->_softwareUpdateAsset;
    v5->_softwareUpdateAsset = 0;

    documentationAsset = v5->_documentationAsset;
    v5->_documentationAsset = 0;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"coreDescriptor"];
    coreDescriptor = v5->_coreDescriptor;
    v5->_coreDescriptor = (SUCoreDescriptor *)v25;

    v5->_hasBeenAbandoned = 0;
    v5->_isSupervisedPolicy = [v4 decodeBoolForKey:@"isSupervisedPolicy"];
    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestedPMV"];
    requestedPMV = v5->_requestedPMV;
    v5->_requestedPMV = (NSString *)v27;

    v5->_delayPeriod = [v4 decodeIntegerForKey:@"delayPeriod"];
    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"releaseType"];
    releaseType = v5->_releaseType;
    v5->_releaseType = (NSString *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"releaseDate"];
    releaseDate = v5->_releaseDate;
    v5->_releaseDate = (NSDate *)v31;

    v5->_mandatoryUpdateEligible = [v4 decodeBoolForKey:@"mandatoryUpdateEligible"];
    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mandatoryUpdateVersionMin"];
    mandatoryUpdateVersionMin = v5->_mandatoryUpdateVersionMin;
    v5->_mandatoryUpdateVersionMin = (NSString *)v33;

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mandatoryUpdateVersionMax"];
    mandatoryUpdateVersionMax = v5->_mandatoryUpdateVersionMax;
    v5->_mandatoryUpdateVersionMax = (NSString *)v35;

    v5->_mandatoryUpdateOptional = [v4 decodeBoolForKey:@"mandatoryUpdateOptional"];
    v5->_mandatoryUpdateRestrictedToOutOfTheBox = [v4 decodeBoolForKey:@"mandatoryUpdateRestrictedToOutOfTheBox"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v18 = a3;
  id v4 = [(SUControllerDescriptor *)self documentation];
  [v18 encodeObject:v4 forKey:@"documentation"];

  v5 = [(SUControllerDescriptor *)self productVersion];
  [v18 encodeObject:v5 forKey:@"productVersion"];

  uint64_t v6 = [(SUControllerDescriptor *)self productBuildVersion];
  [v18 encodeObject:v6 forKey:@"productBuildVersion"];

  v7 = [(SUControllerDescriptor *)self documentationID];
  [v18 encodeObject:v7 forKey:@"documentationID"];

  uint64_t v8 = [(SUControllerDescriptor *)self marketingVersion];
  [v18 encodeObject:v8 forKey:@"MarketingVersion"];

  v9 = [(SUControllerDescriptor *)self publisher];
  [v18 encodeObject:v9 forKey:@"publisher"];

  uint64_t v10 = [(SUControllerDescriptor *)self productSystemName];
  [v18 encodeObject:v10 forKey:@"productSystemName"];

  v11 = [(SUControllerDescriptor *)self denialReasons];
  [v18 encodeObject:v11 forKey:@"denialReasons"];

  objc_msgSend(v18, "encodeInt64:forKey:", -[SUControllerDescriptor downloadSize](self, "downloadSize"), @"downloadSize");
  objc_msgSend(v18, "encodeInt64:forKey:", -[SUControllerDescriptor unarchivedSize](self, "unarchivedSize"), @"unarchivedSize");
  objc_msgSend(v18, "encodeInt64:forKey:", -[SUControllerDescriptor msuPrepareSize](self, "msuPrepareSize"), @"msuPrepareSize");
  objc_msgSend(v18, "encodeInt64:forKey:", -[SUControllerDescriptor installationSize](self, "installationSize"), @"installationSize");
  objc_msgSend(v18, "encodeInt64:forKey:", -[SUControllerDescriptor totalRequiredFreeSpace](self, "totalRequiredFreeSpace"), @"TotalRequiredFreeSpace");
  objc_msgSend(v18, "encodeBool:forKey:", -[SUControllerDescriptor userDidAcceptTermsAndConditions](self, "userDidAcceptTermsAndConditions"), @"userDidAcceptTermsAndConditions");
  objc_msgSend(v18, "encodeBool:forKey:", -[SUControllerDescriptor fullReplacement](self, "fullReplacement"), @"fullReplacement");
  objc_msgSend(v18, "encodeBool:forKey:", -[SUControllerDescriptor rampEnabled](self, "rampEnabled"), @"rampEnabled");
  objc_msgSend(v18, "encodeBool:forKey:", -[SUControllerDescriptor willProceedWithInstallation](self, "willProceedWithInstallation"), @"willProceedWithInstallation");
  objc_msgSend(v18, "encodeBool:forKey:", -[SUControllerDescriptor isAwaitingAdmissionControlForInstallation](self, "isAwaitingAdmissionControlForInstallation"), @"isAwaitingAdmissionControlForInstallation");
  uint64_t v12 = [(SUControllerDescriptor *)self coreDescriptor];
  [v18 encodeObject:v12 forKey:@"coreDescriptor"];

  objc_msgSend(v18, "encodeBool:forKey:", -[SUControllerDescriptor isSupervisedPolicy](self, "isSupervisedPolicy"), @"isSupervisedPolicy");
  v13 = [(SUControllerDescriptor *)self requestedPMV];
  [v18 encodeObject:v13 forKey:@"requestedPMV"];

  objc_msgSend(v18, "encodeInteger:forKey:", -[SUControllerDescriptor delayPeriod](self, "delayPeriod"), @"delayPeriod");
  uint64_t v14 = [(SUControllerDescriptor *)self releaseType];
  [v18 encodeObject:v14 forKey:@"releaseType"];

  v15 = [(SUControllerDescriptor *)self releaseDate];
  [v18 encodeObject:v15 forKey:@"releaseDate"];

  objc_msgSend(v18, "encodeBool:forKey:", -[SUControllerDescriptor mandatoryUpdateEligible](self, "mandatoryUpdateEligible"), @"mandatoryUpdateEligible");
  uint64_t v16 = [(SUControllerDescriptor *)self mandatoryUpdateVersionMin];
  [v18 encodeObject:v16 forKey:@"mandatoryUpdateVersionMin"];

  v17 = [(SUControllerDescriptor *)self mandatoryUpdateVersionMax];
  [v18 encodeObject:v17 forKey:@"mandatoryUpdateVersionMax"];

  objc_msgSend(v18, "encodeBool:forKey:", -[SUControllerDescriptor mandatoryUpdateOptional](self, "mandatoryUpdateOptional"), @"mandatoryUpdateOptional");
  objc_msgSend(v18, "encodeBool:forKey:", -[SUControllerDescriptor mandatoryUpdateRestrictedToOutOfTheBox](self, "mandatoryUpdateRestrictedToOutOfTheBox"), @"mandatoryUpdateRestrictedToOutOfTheBox");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  v2 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  v3 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:0];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SUControllerDescriptor *)a3;
  if (v4 == self)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(SUControllerDescriptor *)v5 productVersion];
      v7 = [(SUControllerDescriptor *)self productVersion];
      if ([v6 isEqualToString:v7])
      {
        uint64_t v8 = [(SUControllerDescriptor *)v5 productBuildVersion];
        v9 = [(SUControllerDescriptor *)self productBuildVersion];
        if ([v8 isEqualToString:v9])
        {
          BOOL v10 = [(SUControllerDescriptor *)v5 isSupervisedPolicy];
          int v11 = v10 ^ [(SUControllerDescriptor *)self isSupervisedPolicy] ^ 1;
        }
        else
        {
          LOBYTE(v11) = 0;
        }
      }
      else
      {
        LOBYTE(v11) = 0;
      }
    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = NSString;
  id v4 = [(SUControllerDescriptor *)self productVersion];
  v5 = [(SUControllerDescriptor *)self productBuildVersion];
  uint64_t v6 = [v3 stringWithFormat:@"%@/%@", v4, v5];
  unint64_t v7 = [v6 hash];

  return v7;
}

- (id)description
{
  uint64_t v31 = NSString;
  v30 = [(SUControllerDescriptor *)self humanReadableUpdateName];
  uint64_t v29 = [(SUControllerDescriptor *)self productVersion];
  v28 = [(SUControllerDescriptor *)self productBuildVersion];
  uint64_t v27 = [(SUControllerDescriptor *)self productSystemName];
  v26 = [(SUControllerDescriptor *)self publisher];
  int64_t v25 = [(SUControllerDescriptor *)self downloadSize];
  int64_t v24 = [(SUControllerDescriptor *)self preparationSize];
  int64_t v23 = [(SUControllerDescriptor *)self installationSize];
  int64_t v22 = [(SUControllerDescriptor *)self totalRequiredFreeSpace];
  v21 = [(SUControllerDescriptor *)self documentationID];
  uint64_t v20 = [(SUControllerDescriptor *)self marketingVersion];
  if ([(SUControllerDescriptor *)self fullReplacement]) {
    v3 = @"YES";
  }
  else {
    v3 = @"NO";
  }
  v19 = v3;
  if ([(SUControllerDescriptor *)self rampEnabled]) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  id v18 = v4;
  v17 = [(SUControllerDescriptor *)self denialReasons];
  v5 = [(SUControllerDescriptor *)self releaseType];
  uint64_t v16 = [(SUControllerDescriptor *)self releaseDate];
  if ([(SUControllerDescriptor *)self isSupervisedPolicy]) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  v15 = v6;
  unint64_t v7 = [(SUControllerDescriptor *)self requestedPMV];
  int64_t v8 = [(SUControllerDescriptor *)self delayPeriod];
  if ([(SUControllerDescriptor *)self mandatoryUpdateEligible]) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  BOOL v10 = [(SUControllerDescriptor *)self mandatoryUpdateVersionMin];
  int v11 = [(SUControllerDescriptor *)self mandatoryUpdateVersionMax];
  if ([(SUControllerDescriptor *)self mandatoryUpdateOptional]) {
    uint64_t v12 = @"YES";
  }
  else {
    uint64_t v12 = @"NO";
  }
  if ([(SUControllerDescriptor *)self mandatoryUpdateRestrictedToOutOfTheBox]) {
    v13 = @"YES";
  }
  else {
    v13 = @"NO";
  }
  objc_msgSend(v31, "stringWithFormat:", @"\n            HumanReadableUpdateName: %@\n            ProductVersion: %@\n            ProductBuildVersion: %@\n            ProductSystemName: %@\n            Publisher: %@\n            DownloadSize: %lld\n            PreparationSize: %lld\n            InstallationSize: %lld\n            TotalRequiredFreeSpace: %lld\n            DocumentationID: %@\n            MarketingVersion: %@\n            FullReplacement: %@\n            RampEnabled: %@\n            CurrentDenialReasons: %@\n            ReleaseType: %@\n            ReleaseDate: %@\n            IsSupervisedPolicy: %@\n            RequestedPMV: %@\n            DelayPeriod: %d days\n            MandatoryUpdateEligible: %@\n            MandatoryUpdateVersionMin: %@\n            MandatoryUpdateVersionMax: %@\n            MandatoryUpdateOptional: %@\n            mandatoryUpdateRestrictedToOutOfTheBox: %@", v30, v29, v28, v27, v26, v25, v24, v23, v22, v21, v20, v19, v18, v17, v5, v16,
    v15,
    v7,
    v8,
    v9,
    v10,
    v11,
    v12,
  v32 = v13);

  return v32;
}

- (id)summary
{
  v3 = NSString;
  id v4 = [(SUControllerDescriptor *)self humanReadableUpdateName];
  v5 = [(SUControllerDescriptor *)self productBuildVersion];
  BOOL v6 = [(SUControllerDescriptor *)self isSupervisedPolicy];
  unint64_t v7 = @"Not Supervised";
  if (v6) {
    unint64_t v7 = @"Supervised";
  }
  int64_t v8 = [v3 stringWithFormat:@"%@ %@ (%@)", v4, v5, v7];

  return v8;
}

- (int64_t)compare:(id)a3
{
  id v4 = (SUControllerDescriptor *)a3;
  v5 = v4;
  if (self == v4)
  {
    int64_t v8 = 0;
  }
  else if (v4)
  {
    BOOL v6 = [(SUControllerDescriptor *)self productVersion];
    unint64_t v7 = [(SUControllerDescriptor *)v5 productVersion];
    int64_t v8 = [v6 compare:v7 options:64];

    if (v8 != 1 && v8 != -1)
    {
      v9 = [(SUControllerDescriptor *)self productBuildVersion];
      BOOL v10 = [(SUControllerDescriptor *)v5 productBuildVersion];
      int64_t v8 = [v9 compare:v10 options:64];
    }
  }
  else
  {
    int64_t v8 = 1;
  }

  return v8;
}

- (int64_t)preparationSize
{
  int64_t v3 = [(SUControllerDescriptor *)self unarchivedSize];
  return [(SUControllerDescriptor *)self msuPrepareSize] + v3;
}

- (NSString)humanReadableUpdateName
{
  int64_t v3 = [(SUControllerDescriptor *)self documentation];
  id v4 = [v3 humanReadableUpdateName];

  if (v4)
  {
    v5 = [(SUControllerDescriptor *)self documentation];
    BOOL v6 = [v5 humanReadableUpdateName];
LABEL_6:

    goto LABEL_8;
  }
  uint64_t v7 = [(SUControllerDescriptor *)self productSystemName];
  if (v7)
  {
    int64_t v8 = (void *)v7;
    v9 = [(SUControllerDescriptor *)self productVersion];

    if (v9)
    {
      BOOL v10 = NSString;
      v5 = [(SUControllerDescriptor *)self productSystemName];
      int v11 = [(SUControllerDescriptor *)self productVersion];
      BOOL v6 = [v10 stringWithFormat:@"%@ %@", v5, v11];

      goto LABEL_6;
    }
  }
  BOOL v6 = @"Software Update";
LABEL_8:

  return (NSString *)v6;
}

- (SUControllerDocumentation)documentation
{
  return self->_documentation;
}

- (void)setDocumentation:(id)a3
{
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (void)setProductVersion:(id)a3
{
}

- (NSString)productBuildVersion
{
  return self->_productBuildVersion;
}

- (void)setProductBuildVersion:(id)a3
{
}

- (NSString)documentationID
{
  return self->_documentationID;
}

- (void)setDocumentationID:(id)a3
{
}

- (NSString)marketingVersion
{
  return self->_marketingVersion;
}

- (void)setMarketingVersion:(id)a3
{
}

- (NSString)publisher
{
  return self->_publisher;
}

- (void)setPublisher:(id)a3
{
}

- (NSString)productSystemName
{
  return self->_productSystemName;
}

- (void)setProductSystemName:(id)a3
{
}

- (int64_t)downloadSize
{
  return self->_downloadSize;
}

- (void)setDownloadSize:(int64_t)a3
{
  self->_downloadSize = a3;
}

- (int64_t)installationSize
{
  return self->_installationSize;
}

- (void)setInstallationSize:(int64_t)a3
{
  self->_installationSize = a3;
}

- (int64_t)totalRequiredFreeSpace
{
  return self->_totalRequiredFreeSpace;
}

- (void)setTotalRequiredFreeSpace:(int64_t)a3
{
  self->_totalRequiredFreeSpace = a3;
}

- (BOOL)userDidAcceptTermsAndConditions
{
  return self->_userDidAcceptTermsAndConditions;
}

- (void)setUserDidAcceptTermsAndConditions:(BOOL)a3
{
  self->_userDidAcceptTermsAndConditions = a3;
}

- (BOOL)fullReplacement
{
  return self->_fullReplacement;
}

- (void)setFullReplacement:(BOOL)a3
{
  self->_fullReplacement = a3;
}

- (BOOL)rampEnabled
{
  return self->_rampEnabled;
}

- (void)setRampEnabled:(BOOL)a3
{
  self->_rampEnabled = a3;
}

- (NSError)denialReasons
{
  return self->_denialReasons;
}

- (void)setDenialReasons:(id)a3
{
}

- (NSString)releaseType
{
  return self->_releaseType;
}

- (void)setReleaseType:(id)a3
{
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (void)setReleaseDate:(id)a3
{
}

- (BOOL)isSupervisedPolicy
{
  return self->_isSupervisedPolicy;
}

- (void)setIsSupervisedPolicy:(BOOL)a3
{
  self->_isSupervisedPolicy = a3;
}

- (NSString)requestedPMV
{
  return self->_requestedPMV;
}

- (void)setRequestedPMV:(id)a3
{
}

- (int64_t)delayPeriod
{
  return self->_delayPeriod;
}

- (void)setDelayPeriod:(int64_t)a3
{
  self->_delayPeriod = a3;
}

- (BOOL)mandatoryUpdateEligible
{
  return self->_mandatoryUpdateEligible;
}

- (void)setMandatoryUpdateEligible:(BOOL)a3
{
  self->_mandatoryUpdateEligible = a3;
}

- (NSString)mandatoryUpdateVersionMin
{
  return self->_mandatoryUpdateVersionMin;
}

- (void)setMandatoryUpdateVersionMin:(id)a3
{
}

- (NSString)mandatoryUpdateVersionMax
{
  return self->_mandatoryUpdateVersionMax;
}

- (void)setMandatoryUpdateVersionMax:(id)a3
{
}

- (BOOL)mandatoryUpdateOptional
{
  return self->_mandatoryUpdateOptional;
}

- (void)setMandatoryUpdateOptional:(BOOL)a3
{
  self->_mandatoryUpdateOptional = a3;
}

- (BOOL)mandatoryUpdateRestrictedToOutOfTheBox
{
  return self->_mandatoryUpdateRestrictedToOutOfTheBox;
}

- (void)setMandatoryUpdateRestrictedToOutOfTheBox:(BOOL)a3
{
  self->_mandatoryUpdateRestrictedToOutOfTheBox = a3;
}

- (NSString)fullProductVersion
{
  return self->_fullProductVersion;
}

- (void)setFullProductVersion:(id)a3
{
}

- (int64_t)unarchivedSize
{
  return self->_unarchivedSize;
}

- (void)setUnarchivedSize:(int64_t)a3
{
  self->_unarchivedSize = a3;
}

- (int64_t)msuPrepareSize
{
  return self->_msuPrepareSize;
}

- (void)setMsuPrepareSize:(int64_t)a3
{
  self->_msuPrepareSize = a3;
}

- (BOOL)willProceedWithInstallation
{
  return self->_willProceedWithInstallation;
}

- (void)setWillProceedWithInstallation:(BOOL)a3
{
  self->_willProceedWithInstallation = a3;
}

- (BOOL)isAwaitingAdmissionControlForInstallation
{
  return self->_isAwaitingAdmissionControlForInstallation;
}

- (void)setIsAwaitingAdmissionControlForInstallation:(BOOL)a3
{
  self->_isAwaitingAdmissionControlForInstallation = a3;
}

- (MAAsset)softwareUpdateAsset
{
  return self->_softwareUpdateAsset;
}

- (void)setSoftwareUpdateAsset:(id)a3
{
}

- (MAAsset)documentationAsset
{
  return self->_documentationAsset;
}

- (void)setDocumentationAsset:(id)a3
{
}

- (SUCoreDescriptor)coreDescriptor
{
  return self->_coreDescriptor;
}

- (void)setCoreDescriptor:(id)a3
{
}

- (BOOL)hasBeenAbandoned
{
  return self->_hasBeenAbandoned;
}

- (void)setHasBeenAbandoned:(BOOL)a3
{
  self->_hasBeenAbandoned = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreDescriptor, 0);
  objc_storeStrong((id *)&self->_documentationAsset, 0);
  objc_storeStrong((id *)&self->_softwareUpdateAsset, 0);
  objc_storeStrong((id *)&self->_fullProductVersion, 0);
  objc_storeStrong((id *)&self->_mandatoryUpdateVersionMax, 0);
  objc_storeStrong((id *)&self->_mandatoryUpdateVersionMin, 0);
  objc_storeStrong((id *)&self->_requestedPMV, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_releaseType, 0);
  objc_storeStrong((id *)&self->_denialReasons, 0);
  objc_storeStrong((id *)&self->_productSystemName, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_marketingVersion, 0);
  objc_storeStrong((id *)&self->_documentationID, 0);
  objc_storeStrong((id *)&self->_productBuildVersion, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);

  objc_storeStrong((id *)&self->_documentation, 0);
}

@end