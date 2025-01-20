@interface SUSettingsScanParam
- (BOOL)alternateUpdateDownloadable;
- (BOOL)emptyScanResults;
- (BOOL)isAutoUpdateScheduled;
- (BOOL)isClearingSpaceForDownload;
- (BOOL)isDelayingUpdate;
- (BOOL)isRollingBack;
- (BOOL)isUpdateReadyForInstallation;
- (BOOL)preferredUpdateDownloadable;
- (NSArray)betaPrograms;
- (NSError)alternateUpdateDownloadError;
- (NSError)operationError;
- (NSError)preferredUpdateDownloadError;
- (NSError)scanError;
- (NSError)thirdPartyDiscoveredScanError;
- (NSError)updateInstallationError;
- (SDBetaProgram)enrolledBetaProgram;
- (SDDevice)currentSeedingDevice;
- (SUAutoInstallOperation)currentAutoInstallOperation;
- (SUCoreDDMDeclaration)ddmDeclaration;
- (SUDescriptor)alternateDescriptor;
- (SUDescriptor)preferredDescriptor;
- (SUDownload)currentDownload;
- (SURollbackDescriptor)rollbackDescriptor;
- (SUSUIUpdateAgreementManager)agreementManager;
- (SUScanResults)thirdPartyDiscoveredScanResults;
- (SUSettingsScanOptions)options;
- (SUSettingsScanParam)initWithError:(id)a3;
- (SUSettingsScanParam)initWithPreferredDescriptor:(id)a3 andAlternateDescriptor:(id)a4;
- (SUSettingsScanParam)initWithPreferredDescriptor:(id)a3 andAlternateDescriptor:(id)a4 previouslyDiscoveredDownloadedUpdate:(id)a5 encounteredError:(id)a6;
- (SUSettingsScanParam)initWithPreferredDescriptor:(id)a3 andAlternateDescriptor:(id)a4 previouslyDiscoveredDownloadedUpdate:(id)a5 previouslyDiscoveredAutoInstallOperation:(id)a6 encounteredError:(id)a7;
- (SUSettingsScanParam)initWithScanOptions:(id)a3;
- (id)description;
- (unint64_t)mdmPathRestrictions;
- (void)setAgreementManager:(id)a3;
- (void)setAlternateDescriptor:(id)a3;
- (void)setAlternateUpdateDownloadError:(id)a3;
- (void)setAlternateUpdateDownloadable:(BOOL)a3;
- (void)setBetaPrograms:(id)a3;
- (void)setClearingSpaceForDownload:(BOOL)a3;
- (void)setCurrentAutoInstallOperation:(id)a3;
- (void)setCurrentDownload:(id)a3;
- (void)setCurrentSeedingDevice:(id)a3;
- (void)setDDMDeclaration:(id)a3;
- (void)setEmptyScanResults:(BOOL)a3;
- (void)setEnrolledBetaProgram:(id)a3;
- (void)setIsAutoUpdateScheduled:(BOOL)a3;
- (void)setIsDelayingUpdate:(BOOL)a3;
- (void)setIsRollingBack:(BOOL)a3;
- (void)setIsUpdateReadyForInstallation:(BOOL)a3;
- (void)setMdmPathRestrictions:(unint64_t)a3;
- (void)setOperationError:(id)a3;
- (void)setOptions:(id)a3;
- (void)setPreferredDescriptor:(id)a3;
- (void)setPreferredUpdateDownloadError:(id)a3;
- (void)setPreferredUpdateDownloadable:(BOOL)a3;
- (void)setRollbackDescriptor:(id)a3;
- (void)setScanError:(id)a3;
- (void)setThirdPartyDiscoveredScanError:(id)a3;
- (void)setThirdPartyDiscoveredScanResults:(id)a3;
- (void)setUpdateInstallationError:(id)a3;
@end

@implementation SUSettingsScanParam

- (SUSettingsScanParam)initWithScanOptions:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v9;
  v9 = 0;
  v7.receiver = v3;
  v7.super_class = (Class)SUSettingsScanParam;
  v6 = [(SUSettingsScanParam *)&v7 init];
  v9 = v6;
  objc_storeStrong((id *)&v9, v6);
  if (v6) {
    [(SUSettingsScanParam *)v9 setOptions:location[0]];
  }
  v5 = v9;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v5;
}

- (SUSettingsScanParam)initWithError:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v9;
  v9 = 0;
  v7.receiver = v3;
  v7.super_class = (Class)SUSettingsScanParam;
  v6 = [(SUSettingsScanParam *)&v7 init];
  v9 = v6;
  objc_storeStrong((id *)&v9, v6);
  if (v6) {
    [(SUSettingsScanParam *)v9 setOperationError:location[0]];
  }
  v5 = v9;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v5;
}

- (SUSettingsScanParam)initWithPreferredDescriptor:(id)a3 andAlternateDescriptor:(id)a4
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  v4 = v12;
  v12 = 0;
  v9.receiver = v4;
  v9.super_class = (Class)SUSettingsScanParam;
  v8 = [(SUSettingsScanParam *)&v9 init];
  v12 = v8;
  objc_storeStrong((id *)&v12, v8);
  if (v8)
  {
    [(SUSettingsScanParam *)v12 setPreferredDescriptor:location[0]];
    [(SUSettingsScanParam *)v12 setAlternateDescriptor:v10];
  }
  v6 = v12;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v12, 0);
  return v6;
}

- (SUSettingsScanParam)initWithPreferredDescriptor:(id)a3 andAlternateDescriptor:(id)a4 previouslyDiscoveredDownloadedUpdate:(id)a5 previouslyDiscoveredAutoInstallOperation:(id)a6 encounteredError:(id)a7
{
  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = 0;
  objc_storeStrong(&v18, a4);
  id v17 = 0;
  objc_storeStrong(&v17, a5);
  id v16 = 0;
  objc_storeStrong(&v16, a6);
  id v15 = 0;
  objc_storeStrong(&v15, a7);
  objc_super v7 = v20;
  v20 = 0;
  v14 = [(SUSettingsScanParam *)v7 initWithPreferredDescriptor:location[0] andAlternateDescriptor:v18];
  v20 = v14;
  objc_storeStrong((id *)&v20, v14);
  if (v14)
  {
    [(SUSettingsScanParam *)v20 setCurrentDownload:v17];
    [(SUSettingsScanParam *)v20 setCurrentAutoInstallOperation:v16];
    [(SUSettingsScanParam *)v20 setIsAutoUpdateScheduled:v16 != 0];
    [(SUSettingsScanParam *)v20 setOperationError:v15];
  }
  objc_super v9 = v20;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v20, 0);
  return v9;
}

- (SUSettingsScanParam)initWithPreferredDescriptor:(id)a3 andAlternateDescriptor:(id)a4 previouslyDiscoveredDownloadedUpdate:(id)a5 encounteredError:(id)a6
{
  id v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  objc_storeStrong(&v15, a4);
  id v14 = 0;
  objc_storeStrong(&v14, a5);
  id v13 = 0;
  objc_storeStrong(&v13, a6);
  v6 = v17;
  id v17 = 0;
  v12 = [(SUSettingsScanParam *)v6 initWithPreferredDescriptor:location[0] andAlternateDescriptor:v15];
  id v17 = v12;
  objc_storeStrong((id *)&v17, v12);
  if (v12)
  {
    [(SUSettingsScanParam *)v17 setCurrentDownload:v14];
    [(SUSettingsScanParam *)v17 setOperationError:v13];
  }
  v8 = v17;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v17, 0);
  return v8;
}

- (id)description
{
  v84 = self;
  location[1] = (id)a2;
  location[0] = @"(null)";
  v69 = [(SUSettingsScanParam *)v84 currentDownload];
  char v81 = 0;
  char v79 = 0;
  BOOL v70 = 0;
  if (v69)
  {
    v82 = [(SUSettingsScanParam *)v84 currentDownload];
    int v68 = 1;
    char v81 = 1;
    v80 = [(SUDownload *)v82 descriptor];
    char v79 = 1;
    BOOL v70 = v80 != 0;
  }
  BOOL v67 = v70;
  if (v79) {

  }
  if (v81) {
  if (v67)
  }
  {
    id v60 = (id)NSString;
    v66 = [(SUSettingsScanParam *)v84 currentDownload];
    v65 = [(SUDownload *)v66 descriptor];
    id v64 = (id)[(SUDescriptor *)v65 humanReadableUpdateName];
    id v63 = [(SUSettingsScanParam *)v84 currentDownload];
    id v62 = [(SUSettingsScanParam *)v84 currentDownload];
    id v61 = (id)[v62 progress];
    id v2 = (id)[v60 stringWithFormat:@"%@ (%p) (progess: %@)", v64, v63, v61];
    id v3 = location[0];
    location[0] = v2;
  }
  id v54 = (id)NSString;
  v4 = (objc_class *)objc_opt_class();
  id v55 = NSStringFromClass(v4);
  v56 = v84;
  id v57 = [(SUSettingsScanParam *)v84 options];
  id v58 = [(SUSettingsScanParam *)v84 operationError];
  id v59 = [(SUSettingsScanParam *)v84 preferredDescriptor];
  char v77 = 0;
  char v75 = 0;
  if (v59)
  {
    v78 = [(SUSettingsScanParam *)v84 preferredDescriptor];
    int v52 = 1;
    char v77 = 1;
    v76 = (__CFString *)(id)[(SUDescriptor *)v78 humanReadableUpdateName];
    char v75 = 1;
    v53 = v76;
  }
  else
  {
    v53 = @"(null)";
  }
  v49 = v53;
  id v50 = [(SUSettingsScanParam *)v84 preferredDescriptor];
  id v51 = [(SUSettingsScanParam *)v84 alternateDescriptor];
  char v73 = 0;
  char v71 = 0;
  if (v51)
  {
    v74 = [(SUSettingsScanParam *)v84 alternateDescriptor];
    int v47 = 1;
    char v73 = 1;
    v72 = (__CFString *)(id)[(SUDescriptor *)v74 humanReadableUpdateName];
    char v71 = 1;
    v48 = v72;
  }
  else
  {
    v48 = @"(null)";
  }
  v5 = [(SUSettingsScanParam *)v84 alternateDescriptor];
  id v46 = v5;
  v6 = [(SUSettingsScanParam *)v84 scanError];
  id v45 = v6;
  v24 = "NO";
  v25 = "YES";
  if ([(SUSettingsScanParam *)v84 emptyScanResults]) {
    objc_super v7 = "YES";
  }
  else {
    objc_super v7 = "NO";
  }
  if ([(SUSettingsScanParam *)v84 preferredUpdateDownloadable]) {
    v8 = v25;
  }
  else {
    v8 = v24;
  }
  if ([(SUSettingsScanParam *)v84 alternateUpdateDownloadable]) {
    objc_super v9 = v25;
  }
  else {
    objc_super v9 = v24;
  }
  id v10 = [(SUSettingsScanParam *)v84 preferredUpdateDownloadError];
  id v44 = v10;
  v11 = [(SUSettingsScanParam *)v84 alternateUpdateDownloadError];
  id v43 = v11;
  id v42 = [(SUSettingsScanParam *)v84 agreementManager];
  BOOL v26 = [(SUSettingsScanParam *)v84 isClearingSpaceForDownload];
  id v27 = location[0];
  [(SUSettingsScanParam *)v84 mdmPathRestrictions];
  id v41 = (id)SUStringFromMDMSUPath();
  uint64_t v28 = [(SUSettingsScanParam *)v84 mdmPathRestrictions];
  BOOL v12 = [(SUSettingsScanParam *)v84 isDelayingUpdate];
  id v13 = v25;
  if (!v12) {
    id v13 = v24;
  }
  v29 = v13;
  BOOL v14 = [(SUSettingsScanParam *)v84 isRollingBack];
  id v15 = v25;
  if (!v14) {
    id v15 = v24;
  }
  v30 = v15;
  id v40 = [(SUSettingsScanParam *)v84 rollbackDescriptor];
  id v39 = [(SUSettingsScanParam *)v84 currentSeedingDevice];
  id v38 = [(SUSettingsScanParam *)v84 betaPrograms];
  id v37 = [(SUSettingsScanParam *)v84 betaPrograms];
  uint64_t v31 = [v37 count];
  id v36 = [(SUSettingsScanParam *)v84 enrolledBetaProgram];
  BOOL v16 = [(SUSettingsScanParam *)v84 isAutoUpdateScheduled];
  id v17 = v25;
  if (!v16) {
    id v17 = v24;
  }
  v32 = v17;
  BOOL v18 = [(SUSettingsScanParam *)v84 isUpdateReadyForInstallation];
  v19 = v25;
  if (!v18) {
    v19 = v24;
  }
  v33 = v19;
  id v35 = [(SUSettingsScanParam *)v84 updateInstallationError];
  v34 = &v22;
  BOOL v23 = v26;
  id v85 = objc_retainAutoreleasedReturnValue((id)objc_msgSend(v54, "stringWithFormat:", @"<%@: %p, \n\tscanOptions: %@\n\toperationError: %@\n\tpreferredDescriptor: %@ (%p), \n\talternateDescriptor: %@ (%p), \n\tscanError: %@, \n\temptyScanResults: %s, \n\tpreferredUpdateDownloadable: %s, \n\talternateUpdateDownloadable: %s, \n\tpreferredUpdateDownloadError: %@, \n\talternateUpdateDownloadError: %@, \n\tagreementManager: %@, \n\tisClearingSpaceForDownload: %d, \n\tcurrentDownload: %@, \n\tmdmPathRestrictions: %@ (%ld), \n\tisDelayingUpdate: %s\n\tisRollingBack: %s\n\trollbackDescriptor: %p\n\tcurrentSeedingDevice: %p\n\tbetaPrograms: %p (count: %ld)\n\tenrolledBetaProgram: %p\n\tautoUpdateScheduled: %s\n\tisUpdateReadyForInstallation: %s\n\tupdateInstallationError: %@>", v55, v56, v57, v58, v49, v50, v48, v5, v6, v7, v8, v9, v10, v11, v42, v23,
                                                 v27,
                                                 v41,
                                                 v28,
                                                 v29,
                                                 v30,
                                                 v40,
                                                 v39,
                                                 v38,
                                                 v31,
                                                 v36,
                                                 v32,
                                                 v33,
                                                 v35));

  if (v71) {
  if (v73)
  }

  if (v75) {
  if (v77)
  }

  objc_storeStrong(location, 0);
  v20 = v85;
  return v20;
}

- (SUSettingsScanOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (NSError)operationError
{
  return self->_operationError;
}

- (void)setOperationError:(id)a3
{
}

- (SUDescriptor)preferredDescriptor
{
  return self->_preferredDescriptor;
}

- (void)setPreferredDescriptor:(id)a3
{
}

- (SUDescriptor)alternateDescriptor
{
  return self->_alternateDescriptor;
}

- (void)setAlternateDescriptor:(id)a3
{
}

- (NSError)scanError
{
  return self->_scanError;
}

- (void)setScanError:(id)a3
{
}

- (BOOL)emptyScanResults
{
  return self->_emptyScanResults;
}

- (void)setEmptyScanResults:(BOOL)a3
{
  self->_emptyScanResults = a3;
}

- (BOOL)preferredUpdateDownloadable
{
  return self->_preferredUpdateDownloadable;
}

- (void)setPreferredUpdateDownloadable:(BOOL)a3
{
  self->_preferredUpdateDownloadable = a3;
}

- (BOOL)alternateUpdateDownloadable
{
  return self->_alternateUpdateDownloadable;
}

- (void)setAlternateUpdateDownloadable:(BOOL)a3
{
  self->_alternateUpdateDownloadable = a3;
}

- (NSError)preferredUpdateDownloadError
{
  return self->_preferredUpdateDownloadError;
}

- (void)setPreferredUpdateDownloadError:(id)a3
{
}

- (NSError)alternateUpdateDownloadError
{
  return self->_alternateUpdateDownloadError;
}

- (void)setAlternateUpdateDownloadError:(id)a3
{
}

- (SUSUIUpdateAgreementManager)agreementManager
{
  return self->_agreementManager;
}

- (void)setAgreementManager:(id)a3
{
  self->_agreementManager = (SUSUIUpdateAgreementManager *)a3;
}

- (BOOL)isClearingSpaceForDownload
{
  return self->_clearingSpaceForDownload;
}

- (void)setClearingSpaceForDownload:(BOOL)a3
{
  self->_clearingSpaceForDownload = a3;
}

- (SUDownload)currentDownload
{
  return self->_currentDownload;
}

- (void)setCurrentDownload:(id)a3
{
}

- (SUCoreDDMDeclaration)ddmDeclaration
{
  return self->_ddmDeclaration;
}

- (void)setDDMDeclaration:(id)a3
{
}

- (unint64_t)mdmPathRestrictions
{
  return self->_mdmPathRestrictions;
}

- (void)setMdmPathRestrictions:(unint64_t)a3
{
  self->_mdmPathRestrictions = a3;
}

- (BOOL)isDelayingUpdate
{
  return self->_isDelayingUpdate;
}

- (void)setIsDelayingUpdate:(BOOL)a3
{
  self->_isDelayingUpdate = a3;
}

- (BOOL)isRollingBack
{
  return self->_isRollingBack;
}

- (void)setIsRollingBack:(BOOL)a3
{
  self->_isRollingBack = a3;
}

- (SURollbackDescriptor)rollbackDescriptor
{
  return self->_rollbackDescriptor;
}

- (void)setRollbackDescriptor:(id)a3
{
}

- (SDDevice)currentSeedingDevice
{
  return self->_currentSeedingDevice;
}

- (void)setCurrentSeedingDevice:(id)a3
{
}

- (NSArray)betaPrograms
{
  return self->_betaPrograms;
}

- (void)setBetaPrograms:(id)a3
{
}

- (SDBetaProgram)enrolledBetaProgram
{
  return self->_enrolledBetaProgram;
}

- (void)setEnrolledBetaProgram:(id)a3
{
}

- (BOOL)isAutoUpdateScheduled
{
  return self->_isAutoUpdateScheduled;
}

- (void)setIsAutoUpdateScheduled:(BOOL)a3
{
  self->_isAutoUpdateScheduled = a3;
}

- (SUAutoInstallOperation)currentAutoInstallOperation
{
  return self->_currentAutoInstallOperation;
}

- (void)setCurrentAutoInstallOperation:(id)a3
{
}

- (BOOL)isUpdateReadyForInstallation
{
  return self->_isUpdateReadyForInstallation;
}

- (void)setIsUpdateReadyForInstallation:(BOOL)a3
{
  self->_isUpdateReadyForInstallation = a3;
}

- (NSError)updateInstallationError
{
  return self->_updateInstallationError;
}

- (void)setUpdateInstallationError:(id)a3
{
}

- (SUScanResults)thirdPartyDiscoveredScanResults
{
  return self->_thirdPartyDiscoveredScanResults;
}

- (void)setThirdPartyDiscoveredScanResults:(id)a3
{
}

- (NSError)thirdPartyDiscoveredScanError
{
  return self->_thirdPartyDiscoveredScanError;
}

- (void)setThirdPartyDiscoveredScanError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end