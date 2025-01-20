@interface SUSettingsFullScanResults
- (BOOL)emptyScanResults;
- (BOOL)isDelayingUpdate;
- (BOOL)isRollingBack;
- (NSArray)betaPrograms;
- (NSError)scanError;
- (SDBetaProgram)enrolledBetaProgram;
- (SDDevice)currentSeedingDevice;
- (SUCoreDDMDeclaration)ddmDeclaration;
- (SUDescriptor)alternateDescriptor;
- (SUDescriptor)preferredDescriptor;
- (SURollbackDescriptor)rollbackDescriptor;
- (id)description;
- (id)initFromScanParam:(id)a3 withUUID:(id)a4;
- (unint64_t)mdmPathRestrictions;
- (void)setAlternateDescriptor:(id)a3;
- (void)setBetaPrograms:(id)a3;
- (void)setCurrentSeedingDevice:(id)a3;
- (void)setDDMDeclaration:(id)a3;
- (void)setEmptyScanResults:(BOOL)a3;
- (void)setEnrolledBetaProgram:(id)a3;
- (void)setIsDelayingUpdate:(BOOL)a3;
- (void)setIsRollingBack:(BOOL)a3;
- (void)setMdmPathRestrictions:(unint64_t)a3;
- (void)setPreferredDescriptor:(id)a3;
- (void)setRollbackDescriptor:(id)a3;
- (void)setScanError:(id)a3;
@end

@implementation SUSettingsFullScanResults

- (id)initFromScanParam:(id)a3 withUUID:(id)a4
{
  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v21 = 0;
  objc_storeStrong(&v21, a4);
  v4 = v23;
  v23 = 0;
  v20.receiver = v4;
  v20.super_class = (Class)SUSettingsFullScanResults;
  v19 = [(SUSettingsScanResults *)&v20 initFromScanParam:location[0] withUUID:v21];
  v23 = v19;
  objc_storeStrong((id *)&v23, v19);
  if (v19)
  {
    id v10 = (id)[location[0] preferredDescriptor];
    -[SUSettingsFullScanResults setPreferredDescriptor:](v23, "setPreferredDescriptor:");

    id v11 = (id)[location[0] alternateDescriptor];
    -[SUSettingsFullScanResults setAlternateDescriptor:](v23, "setAlternateDescriptor:");

    id v12 = (id)[location[0] scanError];
    -[SUSettingsFullScanResults setScanError:](v23, "setScanError:");

    uint64_t v5 = [location[0] mdmPathRestrictions];
    [(SUSettingsFullScanResults *)v23 setMdmPathRestrictions:v5];
    char v6 = [location[0] isDelayingUpdate];
    [(SUSettingsFullScanResults *)v23 setIsDelayingUpdate:v6 & 1];
    char v7 = [location[0] isRollingBack];
    [(SUSettingsFullScanResults *)v23 setIsRollingBack:v7 & 1];
    id v13 = (id)[location[0] rollbackDescriptor];
    -[SUSettingsFullScanResults setRollbackDescriptor:](v23, "setRollbackDescriptor:");

    id v14 = (id)[location[0] currentSeedingDevice];
    -[SUSettingsFullScanResults setCurrentSeedingDevice:](v23, "setCurrentSeedingDevice:");

    id v15 = (id)[location[0] betaPrograms];
    -[SUSettingsFullScanResults setBetaPrograms:](v23, "setBetaPrograms:");

    id v16 = (id)[location[0] enrolledBetaProgram];
    -[SUSettingsFullScanResults setEnrolledBetaProgram:](v23, "setEnrolledBetaProgram:");

    id v17 = (id)[location[0] ddmDeclaration];
    -[SUSettingsFullScanResults setDDMDeclaration:](v23, "setDDMDeclaration:");
  }
  v9 = v23;
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v23, 0);
  return v9;
}

- (id)description
{
  v86 = self;
  location[1] = (id)a2;
  location[0] = @"(null)";
  v71 = [(SUSettingsScanResults *)v86 currentDownload];
  char v83 = 0;
  char v81 = 0;
  BOOL v72 = 0;
  if (v71)
  {
    v84 = [(SUSettingsScanResults *)v86 currentDownload];
    int v70 = 1;
    char v83 = 1;
    v82 = [(SUDownload *)v84 descriptor];
    char v81 = 1;
    BOOL v72 = v82 != 0;
  }
  BOOL v69 = v72;
  if (v81) {

  }
  if (v83) {
  if (v69)
  }
  {
    id v62 = (id)NSString;
    v68 = [(SUSettingsScanResults *)v86 currentDownload];
    v67 = [(SUDownload *)v68 descriptor];
    id v66 = (id)[(SUDescriptor *)v67 humanReadableUpdateName];
    id v65 = [(SUSettingsScanResults *)v86 currentDownload];
    id v64 = [(SUSettingsScanResults *)v86 currentDownload];
    id v63 = (id)[v64 progress];
    id v2 = (id)[v62 stringWithFormat:@"%@ (%p) (progess: %@)", v66, v65, v63];
    id v3 = location[0];
    location[0] = v2;
  }
  id v57 = (id)NSString;
  v4 = (objc_class *)objc_opt_class();
  id v58 = NSStringFromClass(v4);
  v59 = v86;
  id v60 = [(SUSettingsScanResults *)v86 scanUUID];
  id v61 = [(SUSettingsFullScanResults *)v86 preferredDescriptor];
  char v79 = 0;
  char v77 = 0;
  if (v61)
  {
    v80 = [(SUSettingsFullScanResults *)v86 preferredDescriptor];
    int v55 = 1;
    char v79 = 1;
    v78 = (__CFString *)(id)[(SUDescriptor *)v80 humanReadableUpdateName];
    char v77 = 1;
    v56 = v78;
  }
  else
  {
    v56 = @"(null)";
  }
  v52 = v56;
  id v53 = [(SUSettingsFullScanResults *)v86 preferredDescriptor];
  id v54 = [(SUSettingsFullScanResults *)v86 alternateDescriptor];
  char v75 = 0;
  char v73 = 0;
  if (v54)
  {
    v76 = [(SUSettingsFullScanResults *)v86 alternateDescriptor];
    int v50 = 1;
    char v75 = 1;
    v74 = (__CFString *)(id)[(SUDescriptor *)v76 humanReadableUpdateName];
    char v73 = 1;
    v51 = v74;
  }
  else
  {
    v51 = @"(null)";
  }
  uint64_t v5 = [(SUSettingsFullScanResults *)v86 alternateDescriptor];
  id v49 = v5;
  char v6 = [(SUSettingsFullScanResults *)v86 scanError];
  id v48 = v6;
  v26 = "NO";
  v27 = "YES";
  if ([(SUSettingsFullScanResults *)v86 emptyScanResults]) {
    char v7 = "YES";
  }
  else {
    char v7 = "NO";
  }
  if ([(SUSettingsScanResults *)v86 preferredUpdateDownloadable]) {
    v8 = v27;
  }
  else {
    v8 = v26;
  }
  if ([(SUSettingsScanResults *)v86 alternateUpdateDownloadable]) {
    v9 = v27;
  }
  else {
    v9 = v26;
  }
  id v10 = [(SUSettingsScanResults *)v86 preferredUpdateDownloadError];
  id v47 = v10;
  id v11 = [(SUSettingsScanResults *)v86 alternateUpdateDownloadError];
  id v46 = v11;
  id v12 = [(SUSettingsScanResults *)v86 agreementManager];
  id v45 = v12;
  BOOL v13 = [(SUSettingsScanResults *)v86 isClearingSpaceForDownload];
  id v28 = location[0];
  [(SUSettingsFullScanResults *)v86 mdmPathRestrictions];
  id v44 = (id)SUStringFromMDMSUPath();
  uint64_t v29 = [(SUSettingsFullScanResults *)v86 mdmPathRestrictions];
  id v43 = [(SUSettingsFullScanResults *)v86 ddmDeclaration];
  BOOL v14 = [(SUSettingsFullScanResults *)v86 isDelayingUpdate];
  id v15 = v27;
  if (!v14) {
    id v15 = v26;
  }
  v30 = v15;
  BOOL v16 = [(SUSettingsFullScanResults *)v86 isRollingBack];
  id v17 = v27;
  if (!v16) {
    id v17 = v26;
  }
  v31 = v17;
  id v42 = [(SUSettingsFullScanResults *)v86 rollbackDescriptor];
  id v41 = [(SUSettingsFullScanResults *)v86 currentSeedingDevice];
  id v40 = [(SUSettingsFullScanResults *)v86 betaPrograms];
  id v39 = [(SUSettingsFullScanResults *)v86 betaPrograms];
  uint64_t v32 = [v39 count];
  id v38 = [(SUSettingsFullScanResults *)v86 enrolledBetaProgram];
  BOOL v18 = [(SUSettingsScanResults *)v86 isAutoUpdateScheduled];
  v19 = v27;
  if (!v18) {
    v19 = v26;
  }
  v33 = v19;
  id v37 = [(SUSettingsScanResults *)v86 currentAutoInstallOperation];
  BOOL v20 = [(SUSettingsScanResults *)v86 isUpdateReadyForInstallation];
  id v21 = v27;
  if (!v20) {
    id v21 = v26;
  }
  v34 = v21;
  id v36 = [(SUSettingsScanResults *)v86 updateInstallationError];
  v35 = &v24;
  BOOL v25 = v13;
  id v87 = objc_retainAutoreleasedReturnValue((id)objc_msgSend(v57, "stringWithFormat:", @"<%@: %p, \n\tscanUUID: %@, \n\tpreferredDescriptor: %@ (%p), \n\talternateDescriptor: %@ (%p), \n\tscanError: %@, \n\temptyScanResults: %s, \n\tpreferredUpdateDownloadable: %s, \n\talternateUpdateDownloadable: %s, \n\tpreferredUpdateDownloadError: %@, \n\talternateUpdateDownloadError: %@, \n\tagreementManager: %@, \n\tisClearingSpaceForDownload: %d, \n\tcurrentDownload: %@, \n\tmdmPathRestrictions: %@ (%ld), \n\tddmDeclaration: %p\n\tisDelayingUpdate: %s\n\tisRollingBack: %s\n\trollbackDescriptor: %p\n\tcurrentSeedingDevice: %p\n\tbetaPrograms: %p (count: %ld)\n\tenrolledBetaProgram: %p\n\tautoUpdateScheduled: %s (%p)\n\tisUpdateReadyForInstallation: %s\n\tupdateInstallationError: %@>", v58, v59, v60, v52, v53, v51, v5, v6, v7, v8, v9, v10, v11, v12, v25, v28,
                                                 v44,
                                                 v29,
                                                 v43,
                                                 v30,
                                                 v31,
                                                 v42,
                                                 v41,
                                                 v40,
                                                 v32,
                                                 v38,
                                                 v33,
                                                 v37,
                                                 v34,
                                                 v36));

  if (v73) {
  if (v75)
  }

  if (v77) {
  if (v79)
  }

  objc_storeStrong(location, 0);
  v22 = v87;
  return v22;
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
  return (SDDevice *)objc_getProperty(self, a2, 120, 1);
}

- (void)setCurrentSeedingDevice:(id)a3
{
}

- (NSArray)betaPrograms
{
  return (NSArray *)objc_getProperty(self, a2, 128, 1);
}

- (void)setBetaPrograms:(id)a3
{
}

- (SDBetaProgram)enrolledBetaProgram
{
  return (SDBetaProgram *)objc_getProperty(self, a2, 136, 1);
}

- (void)setEnrolledBetaProgram:(id)a3
{
}

- (SUCoreDDMDeclaration)ddmDeclaration
{
  return self->_ddmDeclaration;
}

- (void)setDDMDeclaration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end