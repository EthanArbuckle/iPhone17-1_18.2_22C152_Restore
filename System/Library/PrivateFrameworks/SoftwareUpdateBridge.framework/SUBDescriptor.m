@interface SUBDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)backgroundDownloadDisabledByServer;
- (BOOL)displayTermsRequested;
- (BOOL)installTonightScheduled;
- (BOOL)isAwaitingAdmissionControlForInstallation;
- (BOOL)isEqual:(id)a3;
- (BOOL)stringsMatch:(id)a3 second:(id)a4;
- (BOOL)userDidAcceptTermsAndConditions;
- (BOOL)userDidManuallyTriggerInstall;
- (BOOL)willProceedWithInstallation;
- (NSData)manifest;
- (NSDate)autoSUEndTime;
- (NSDate)autoSUStartTime;
- (NSDate)dateOfLastScheduleOfAutoUpdate;
- (NSDate)dateOfLastScheduleOfAutoUpdateNotification;
- (NSDate)dateOfLastSentInstallNotification;
- (NSDictionary)updatePowerPolicy;
- (NSError)denialReasons;
- (NSString)documentationID;
- (NSString)humanReadableUpdateName;
- (NSString)marketingVersion;
- (NSString)osName;
- (NSString)productBuildVersion;
- (NSString)productSystemName;
- (NSString)productVersion;
- (NSString)publisher;
- (SUBDescriptor)initWithCoder:(id)a3;
- (SUBDocumentation)documentation;
- (id)copy;
- (id)description;
- (int64_t)compare:(id)a3;
- (int64_t)downloadSize;
- (int64_t)installationSize;
- (int64_t)msuPrepareSize;
- (int64_t)preparationSize;
- (int64_t)totalRequiredFreeSpace;
- (int64_t)unarchivedSize;
- (int64_t)userInstallRequestType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAutoSUEndTime:(id)a3;
- (void)setAutoSUStartTime:(id)a3;
- (void)setBackgroundDownloadDisabledByServer:(BOOL)a3;
- (void)setDateOfLastScheduleOfAutoUpdate:(id)a3;
- (void)setDateOfLastScheduleOfAutoUpdateNotification:(id)a3;
- (void)setDateOfLastSentInstallNotification:(id)a3;
- (void)setDenialReasons:(id)a3;
- (void)setDisplayTermsRequested:(BOOL)a3;
- (void)setDocumentation:(id)a3;
- (void)setDocumentationID:(id)a3;
- (void)setDownloadSize:(int64_t)a3;
- (void)setInstallTonightScheduled:(BOOL)a3;
- (void)setInstallationSize:(int64_t)a3;
- (void)setIsAwaitingAdmissionControlForInstallation:(BOOL)a3;
- (void)setManifest:(id)a3;
- (void)setMarketingVersion:(id)a3;
- (void)setMsuPrepareSize:(int64_t)a3;
- (void)setOsName:(id)a3;
- (void)setProductBuildVersion:(id)a3;
- (void)setProductSystemName:(id)a3;
- (void)setProductVersion:(id)a3;
- (void)setPublisher:(id)a3;
- (void)setTotalRequiredFreeSpace:(int64_t)a3;
- (void)setUnarchivedSize:(int64_t)a3;
- (void)setUpdatePowerPolicy:(id)a3;
- (void)setUserDidAcceptTermsAndConditions:(BOOL)a3;
- (void)setUserDidManuallyTriggerInstall:(BOOL)a3;
- (void)setUserInstallRequestType:(int64_t)a3;
- (void)setWillProceedWithInstallation:(BOOL)a3;
@end

@implementation SUBDescriptor

- (SUBDescriptor)initWithCoder:(id)a3
{
  v33[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)SUBDescriptor;
  v5 = [(SUBDescriptor *)&v32 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    v33[0] = objc_opt_class();
    v33[1] = objc_opt_class();
    v33[2] = objc_opt_class();
    v33[3] = objc_opt_class();
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:4];
    v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"documentation"];
    documentation = v5->_documentation;
    v5->_documentation = (SUBDocumentation *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productVersion"];
    productVersion = v5->_productVersion;
    v5->_productVersion = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productBuildVersion"];
    productBuildVersion = v5->_productBuildVersion;
    v5->_productBuildVersion = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"documentationID"];
    documentationID = v5->_documentationID;
    v5->_documentationID = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MarketingVersion"];
    marketingVersion = v5->_marketingVersion;
    v5->_marketingVersion = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publisher"];
    publisher = v5->_publisher;
    v5->_publisher = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productSystemName"];
    productSystemName = v5->_productSystemName;
    v5->_productSystemName = (NSString *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"denialReasons"];
    denialReasons = v5->_denialReasons;
    v5->_denialReasons = (NSError *)v23;

    v5->_downloadSize = [v4 decodeInt64ForKey:@"downloadSize"];
    v5->_unarchivedSize = [v4 decodeInt64ForKey:@"unarchivedSize"];
    v5->_msuPrepareSize = [v4 decodeInt64ForKey:@"msuPrepareSize"];
    v5->_installationSize = [v4 decodeInt64ForKey:@"installationSize"];
    v5->_totalRequiredFreeSpace = [v4 decodeInt64ForKey:@"TotalRequiredFreeSpace"];
    v5->_userDidAcceptTermsAndConditions = [v4 decodeBoolForKey:@"userDidAcceptTermsAndConditions"];
    v5->_willProceedWithInstallation = [v4 decodeBoolForKey:@"willProceedWithInstallation"];
    v5->_isAwaitingAdmissionControlForInstallation = [v4 decodeBoolForKey:@"isAwaitingAdmissionControlForInstallation"];
    v5->_userInstallRequestType = [v4 decodeIntegerForKey:@"userInstallRequestType"];
    v5->_installTonightScheduled = [v4 decodeBoolForKey:@"installTonightScheduled"];
    v5->_displayTermsRequested = [v4 decodeBoolForKey:@"displayTermsRequested"];
    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"OSName"];
    osName = v5->_osName;
    v5->_osName = (NSString *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"manifest"];
    manifest = v5->_manifest;
    v5->_manifest = (NSData *)v27;

    uint64_t v29 = [v4 decodeObjectOfClasses:v8 forKey:@"updatePowerPolicy"];
    updatePowerPolicy = v5->_updatePowerPolicy;
    v5->_updatePowerPolicy = (NSDictionary *)v29;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  documentation = self->_documentation;
  id v5 = a3;
  [v5 encodeObject:documentation forKey:@"documentation"];
  [v5 encodeObject:self->_productVersion forKey:@"productVersion"];
  [v5 encodeObject:self->_productBuildVersion forKey:@"productBuildVersion"];
  [v5 encodeObject:self->_documentationID forKey:@"documentationID"];
  [v5 encodeObject:self->_marketingVersion forKey:@"MarketingVersion"];
  [v5 encodeObject:self->_publisher forKey:@"publisher"];
  [v5 encodeObject:self->_productSystemName forKey:@"productSystemName"];
  [v5 encodeObject:self->_denialReasons forKey:@"denialReasons"];
  [v5 encodeInt64:self->_downloadSize forKey:@"downloadSize"];
  [v5 encodeInt64:self->_unarchivedSize forKey:@"unarchivedSize"];
  [v5 encodeInt64:self->_msuPrepareSize forKey:@"msuPrepareSize"];
  [v5 encodeInt64:self->_installationSize forKey:@"installationSize"];
  [v5 encodeInt64:self->_totalRequiredFreeSpace forKey:@"TotalRequiredFreeSpace"];
  [v5 encodeBool:self->_userDidAcceptTermsAndConditions forKey:@"userDidAcceptTermsAndConditions"];
  [v5 encodeBool:self->_willProceedWithInstallation forKey:@"willProceedWithInstallation"];
  [v5 encodeBool:self->_isAwaitingAdmissionControlForInstallation forKey:@"isAwaitingAdmissionControlForInstallation"];
  [v5 encodeInteger:self->_userInstallRequestType forKey:@"userInstallRequestType"];
  [v5 encodeBool:self->_installTonightScheduled forKey:@"installTonightScheduled"];
  [v5 encodeBool:self->_displayTermsRequested forKey:@"displayTermsRequested"];
  [v5 encodeObject:self->_osName forKey:@"OSName"];
  [v5 encodeObject:self->_manifest forKey:@"manifest"];
  [v5 encodeObject:self->_updatePowerPolicy forKey:@"updatePowerPolicy"];
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

- (BOOL)stringsMatch:(id)a3 second:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  v7 = (void *)v6;
  if (v5 | v6)
  {
    char v8 = 0;
    if (v5 && v6) {
      char v8 = [(id)v5 isEqualToString:v6];
    }
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = (SUBDescriptor *)a3;
  if (v4 == self)
  {
    LOBYTE(v17) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      unint64_t v6 = [(SUBDescriptor *)v5 productVersion];
      BOOL v7 = [(SUBDescriptor *)self stringsMatch:v6 second:self->_productVersion];

      char v8 = [(SUBDescriptor *)v5 productBuildVersion];
      BOOL v9 = [(SUBDescriptor *)self stringsMatch:v8 second:self->_productBuildVersion];

      v10 = [(SUBDescriptor *)v5 marketingVersion];
      BOOL v32 = [(SUBDescriptor *)self stringsMatch:v10 second:self->_marketingVersion];

      uint64_t v11 = [(SUBDescriptor *)v5 documentationID];
      BOOL v12 = [(SUBDescriptor *)self stringsMatch:v11 second:self->_documentationID];

      uint64_t v13 = [(SUBDescriptor *)v5 publisher];
      BOOL v14 = [(SUBDescriptor *)self stringsMatch:v13 second:self->_publisher];

      uint64_t v15 = [(SUBDescriptor *)v5 productSystemName];
      BOOL v16 = [(SUBDescriptor *)self stringsMatch:v15 second:self->_productSystemName];

      BOOL v17 = 0;
      if (v7 && v9 && v32 && v12 && v14 && v16) {
        BOOL v17 = [(SUBDescriptor *)v5 downloadSize] == self->_downloadSize;
      }
      v18 = (void *)softwareupdatebridge_log;
      if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
      {
        if (v17) {
          uint64_t v19 = "YES";
        }
        else {
          uint64_t v19 = "NO";
        }
        if (v7) {
          v20 = "YES";
        }
        else {
          v20 = "NO";
        }
        if (v9) {
          uint64_t v21 = "YES";
        }
        else {
          uint64_t v21 = "NO";
        }
        uint64_t v29 = v19;
        v30 = v21;
        if (v32) {
          v22 = "YES";
        }
        else {
          v22 = "NO";
        }
        v31 = v20;
        v33 = v22;
        if (v12) {
          uint64_t v23 = "YES";
        }
        else {
          uint64_t v23 = "NO";
        }
        if (v14) {
          v24 = "YES";
        }
        else {
          v24 = "NO";
        }
        if (v16) {
          uint64_t v25 = "YES";
        }
        else {
          uint64_t v25 = "NO";
        }
        v26 = v18;
        if ([(SUBDescriptor *)v5 downloadSize] == self->_downloadSize) {
          uint64_t v27 = "YES";
        }
        else {
          uint64_t v27 = "NO";
        }
        *(_DWORD *)buf = 136316930;
        v35 = v29;
        __int16 v36 = 2080;
        v37 = v31;
        __int16 v38 = 2080;
        v39 = v30;
        __int16 v40 = 2080;
        v41 = v33;
        __int16 v42 = 2080;
        v43 = v23;
        __int16 v44 = 2080;
        v45 = v24;
        __int16 v46 = 2080;
        v47 = v25;
        __int16 v48 = 2080;
        v49 = v27;
        _os_log_impl(&dword_23C27B000, v26, OS_LOG_TYPE_DEFAULT, "Comparison result: isEqual: %s productVersionsMatch: %s productBuildVersionsMatch: %s productMarketingVersionsMatch: %s documentationIDsMatch: %s publishersMatch: %s productSystemNamesMatch: %s DownloadSize: %s", buf, 0x52u);
      }
    }
    else
    {
      LOBYTE(v17) = 0;
    }
  }

  return v17;
}

- (unint64_t)hash
{
  v2 = [NSString stringWithFormat:@"%@/%@", self->_productVersion, self->_productBuildVersion];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = [(SUBDocumentation *)self->_documentation preferencesIcon];
  id v4 = @"YES";
  if (!v3) {
    id v4 = @"NO";
  }
  __int16 v36 = v4;

  v35 = NSString;
  BOOL userDidAcceptTermsAndConditions = self->_userDidAcceptTermsAndConditions;
  v34 = SUBStringForUserInstallRequestType(self->_userInstallRequestType);
  BOOL installTonightScheduled = self->_installTonightScheduled;
  BOOL displayTermsRequested = self->_displayTermsRequested;
  productBuildVersion = self->_productBuildVersion;
  productVersion = self->_productVersion;
  publisher = self->_publisher;
  productSystemName = self->_productSystemName;
  int64_t downloadSize = self->_downloadSize;
  int64_t v5 = [(SUBDescriptor *)self preparationSize];
  int64_t installationSize = self->_installationSize;
  int64_t v27 = v5;
  int64_t totalRequiredFreeSpace = self->_totalRequiredFreeSpace;
  marketingVersion = self->_marketingVersion;
  documentationID = self->_documentationID;
  unint64_t v6 = [(NSError *)self->_denialReasons description];
  osName = self->_osName;
  NSUInteger v8 = [(NSData *)self->_manifest length];
  BOOL v9 = [(SUBDocumentation *)self->_documentation licenseAgreement];
  uint64_t v10 = [v9 length];
  uint64_t v11 = [(SUBDocumentation *)self->_documentation releaseNotes];
  uint64_t v12 = [v11 length];
  uint64_t v13 = [(SUBDocumentation *)self->_documentation releaseNotesSummary];
  uint64_t v14 = [v13 length];
  if (objc_opt_respondsToSelector()) {
    updatePowerPolicy = self->_updatePowerPolicy;
  }
  else {
    updatePowerPolicy = (NSDictionary *)@"Legacy Policy";
  }
  BOOL v16 = "YES";
  if (displayTermsRequested) {
    BOOL v17 = "YES";
  }
  else {
    BOOL v17 = "NO";
  }
  if (installTonightScheduled) {
    v18 = "YES";
  }
  else {
    v18 = "NO";
  }
  if (!userDidAcceptTermsAndConditions) {
    BOOL v16 = "NO";
  }
  objc_msgSend(v35, "stringWithFormat:", @"\n            terms: %s userInstallRequestType: %s installTonightScheduled: %s displayTermsRequested: %s\n            ProductVersion: %@\n            ProductBuildVersion: %@\n            ProductSystemName: %@\n            Publisher: %@\n            DownloadSize: %lld\n            PreparationSize: %lld\n            InstallationSize: %lld\n            TotalRequiredFreeSpace: %lld\n            DocumentationID: %@\n            MarketingVersion: %@\n            CurrentDenialReasons: %@\n            OSName: %@\n            Manifest Length: %lu\n             Terms Length: %lu\n            Release Note Length: %lu\n            Release Note Summary Length: %lu \n            SUIconPresent: %@\n             Power Policy: %@", v16, v34, v18, v17, productVersion, productBuildVersion, productSystemName, publisher, downloadSize, v27, installationSize, totalRequiredFreeSpace, documentationID, marketingVersion, v6, osName,
    v8,
    v10,
    v12,
    v14,
    v36,
  uint64_t v19 = updatePowerPolicy);

  return v19;
}

- (int64_t)compare:(id)a3
{
  id v4 = (SUBDescriptor *)a3;
  int64_t v5 = v4;
  if (self == v4)
  {
    int64_t v8 = 0;
  }
  else if (v4)
  {
    productVersion = self->_productVersion;
    BOOL v7 = [(SUBDescriptor *)v4 productVersion];
    int64_t v8 = [(NSString *)productVersion compare:v7 options:64];

    if (v8 != 1 && v8 != -1)
    {
      productBuildVersion = self->_productBuildVersion;
      uint64_t v10 = [(SUBDescriptor *)v5 productBuildVersion];
      int64_t v8 = [(NSString *)productBuildVersion compare:v10 options:64];
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
  return self->_msuPrepareSize + self->_unarchivedSize;
}

- (NSString)humanReadableUpdateName
{
  unint64_t v3 = [(SUBDocumentation *)self->_documentation humanReadableUpdateName];

  if (v3)
  {
    id v4 = [(SUBDocumentation *)self->_documentation humanReadableUpdateName];
  }
  else
  {
    osName = self->_osName;
    if (osName && self->_productVersion)
    {
      unint64_t v6 = [(NSString *)osName stringByReplacingOccurrencesOfString:@" " withString:&stru_26EFEAA10];
      id v4 = [NSString stringWithFormat:@"%@ %@", v6, self->_productVersion];
    }
    else
    {
      id v4 = @"Software Update";
    }
  }
  return (NSString *)v4;
}

- (SUBDocumentation)documentation
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
  self->_int64_t downloadSize = a3;
}

- (int64_t)installationSize
{
  return self->_installationSize;
}

- (void)setInstallationSize:(int64_t)a3
{
  self->_int64_t installationSize = a3;
}

- (int64_t)totalRequiredFreeSpace
{
  return self->_totalRequiredFreeSpace;
}

- (void)setTotalRequiredFreeSpace:(int64_t)a3
{
  self->_int64_t totalRequiredFreeSpace = a3;
}

- (BOOL)userDidAcceptTermsAndConditions
{
  return self->_userDidAcceptTermsAndConditions;
}

- (void)setUserDidAcceptTermsAndConditions:(BOOL)a3
{
  self->_BOOL userDidAcceptTermsAndConditions = a3;
}

- (int64_t)userInstallRequestType
{
  return self->_userInstallRequestType;
}

- (void)setUserInstallRequestType:(int64_t)a3
{
  self->_userInstallRequestType = a3;
}

- (NSError)denialReasons
{
  return self->_denialReasons;
}

- (void)setDenialReasons:(id)a3
{
}

- (NSDate)dateOfLastSentInstallNotification
{
  return self->_dateOfLastSentInstallNotification;
}

- (void)setDateOfLastSentInstallNotification:(id)a3
{
}

- (NSDate)dateOfLastScheduleOfAutoUpdateNotification
{
  return self->_dateOfLastScheduleOfAutoUpdateNotification;
}

- (void)setDateOfLastScheduleOfAutoUpdateNotification:(id)a3
{
}

- (NSDate)dateOfLastScheduleOfAutoUpdate
{
  return self->_dateOfLastScheduleOfAutoUpdate;
}

- (void)setDateOfLastScheduleOfAutoUpdate:(id)a3
{
}

- (NSData)manifest
{
  return self->_manifest;
}

- (void)setManifest:(id)a3
{
}

- (BOOL)displayTermsRequested
{
  return self->_displayTermsRequested;
}

- (void)setDisplayTermsRequested:(BOOL)a3
{
  self->_BOOL displayTermsRequested = a3;
}

- (BOOL)backgroundDownloadDisabledByServer
{
  return self->_backgroundDownloadDisabledByServer;
}

- (void)setBackgroundDownloadDisabledByServer:(BOOL)a3
{
  self->_backgroundDownloadDisabledByServer = a3;
}

- (BOOL)userDidManuallyTriggerInstall
{
  return self->_userDidManuallyTriggerInstall;
}

- (void)setUserDidManuallyTriggerInstall:(BOOL)a3
{
  self->_userDidManuallyTriggerInstall = a3;
}

- (NSDictionary)updatePowerPolicy
{
  return self->_updatePowerPolicy;
}

- (void)setUpdatePowerPolicy:(id)a3
{
}

- (NSString)osName
{
  return self->_osName;
}

- (void)setOsName:(id)a3
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

- (NSDate)autoSUStartTime
{
  return self->_autoSUStartTime;
}

- (void)setAutoSUStartTime:(id)a3
{
}

- (NSDate)autoSUEndTime
{
  return self->_autoSUEndTime;
}

- (void)setAutoSUEndTime:(id)a3
{
}

- (BOOL)installTonightScheduled
{
  return self->_installTonightScheduled;
}

- (void)setInstallTonightScheduled:(BOOL)a3
{
  self->_BOOL installTonightScheduled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoSUEndTime, 0);
  objc_storeStrong((id *)&self->_autoSUStartTime, 0);
  objc_storeStrong((id *)&self->_osName, 0);
  objc_storeStrong((id *)&self->_updatePowerPolicy, 0);
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_dateOfLastScheduleOfAutoUpdate, 0);
  objc_storeStrong((id *)&self->_dateOfLastScheduleOfAutoUpdateNotification, 0);
  objc_storeStrong((id *)&self->_dateOfLastSentInstallNotification, 0);
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