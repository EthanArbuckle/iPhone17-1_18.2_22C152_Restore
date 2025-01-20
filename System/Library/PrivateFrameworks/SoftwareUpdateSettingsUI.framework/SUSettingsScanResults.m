@interface SUSettingsScanResults
- (BOOL)alternateUpdateDownloadable;
- (BOOL)isAutoUpdateScheduled;
- (BOOL)isClearingSpaceForDownload;
- (BOOL)isUpdateReadyForInstallation;
- (BOOL)preferredUpdateDownloadable;
- (NSError)alternateUpdateDownloadError;
- (NSError)preferredUpdateDownloadError;
- (NSError)updateInstallationError;
- (NSString)scanUUID;
- (SUAutoInstallOperation)currentAutoInstallOperation;
- (SUDownload)currentDownload;
- (SUSUIUpdateAgreementManager)agreementManager;
- (id)description;
- (id)initFromScanParam:(id)a3 withUUID:(id)a4;
- (void)setAgreementManager:(id)a3;
- (void)setAlternateUpdateDownloadError:(id)a3;
- (void)setAlternateUpdateDownloadable:(BOOL)a3;
- (void)setClearingSpaceForDownload:(BOOL)a3;
- (void)setCurrentAutoInstallOperation:(id)a3;
- (void)setCurrentDownload:(id)a3;
- (void)setIsAutoUpdateScheduled:(BOOL)a3;
- (void)setIsUpdateReadyForInstallation:(BOOL)a3;
- (void)setPreferredUpdateDownloadError:(id)a3;
- (void)setPreferredUpdateDownloadable:(BOOL)a3;
- (void)setScanUUID:(id)a3;
- (void)setUpdateInstallationError:(id)a3;
@end

@implementation SUSettingsScanResults

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
  v20.super_class = (Class)SUSettingsScanResults;
  v19 = [(SUSettingsScanResults *)&v20 init];
  v23 = v19;
  objc_storeStrong((id *)&v23, v19);
  if (v19)
  {
    [(SUSettingsScanResults *)v23 setScanUUID:v21];
    char v5 = [location[0] preferredUpdateDownloadable];
    [(SUSettingsScanResults *)v23 setPreferredUpdateDownloadable:v5 & 1];
    char v6 = [location[0] alternateUpdateDownloadable];
    [(SUSettingsScanResults *)v23 setAlternateUpdateDownloadable:v6 & 1];
    id v12 = (id)[location[0] preferredUpdateDownloadError];
    -[SUSettingsScanResults setPreferredUpdateDownloadError:](v23, "setPreferredUpdateDownloadError:");

    id v13 = (id)[location[0] alternateUpdateDownloadError];
    -[SUSettingsScanResults setAlternateUpdateDownloadError:](v23, "setAlternateUpdateDownloadError:");

    id v14 = (id)[location[0] agreementManager];
    -[SUSettingsScanResults setAgreementManager:](v23, "setAgreementManager:");

    char v7 = [location[0] isClearingSpaceForDownload];
    [(SUSettingsScanResults *)v23 setClearingSpaceForDownload:v7 & 1];
    id v15 = (id)[location[0] currentDownload];
    -[SUSettingsScanResults setCurrentDownload:](v23, "setCurrentDownload:");

    char v8 = [location[0] isUpdateReadyForInstallation];
    [(SUSettingsScanResults *)v23 setIsUpdateReadyForInstallation:v8 & 1];
    id v16 = (id)[location[0] updateInstallationError];
    -[SUSettingsScanResults setUpdateInstallationError:](v23, "setUpdateInstallationError:");

    char v9 = [location[0] isAutoUpdateScheduled];
    [(SUSettingsScanResults *)v23 setIsAutoUpdateScheduled:v9 & 1];
    id v17 = (id)[location[0] currentAutoInstallOperation];
    -[SUSettingsScanResults setCurrentAutoInstallOperation:](v23, "setCurrentAutoInstallOperation:");
  }
  v11 = v23;
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v23, 0);
  return v11;
}

- (id)description
{
  v44 = self;
  v43[1] = (id)a2;
  v43[0] = @"(null)";
  v37 = [(SUSettingsScanResults *)v44 currentDownload];
  char v41 = 0;
  char v39 = 0;
  BOOL v38 = 0;
  if (v37)
  {
    v42 = [(SUSettingsScanResults *)v44 currentDownload];
    char v41 = 1;
    v40 = [(SUDownload *)v42 descriptor];
    char v39 = 1;
    BOOL v38 = v40 != 0;
  }
  if (v39) {

  }
  if (v41) {
  if (v38)
  }
  {
    v30 = NSString;
    v36 = [(SUSettingsScanResults *)v44 currentDownload];
    v35 = [(SUDownload *)v36 descriptor];
    id v34 = (id)[(SUDescriptor *)v35 humanReadableUpdateName];
    v33 = [(SUSettingsScanResults *)v44 currentDownload];
    v32 = [(SUSettingsScanResults *)v44 currentDownload];
    v31 = [(SUDownload *)v32 progress];
    id v2 = (id)[v30 stringWithFormat:@"%@ (%p) (progess: %@)", v34, v33, v31];
    id v3 = v43[0];
    v43[0] = v2;
  }
  id v21 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v28 = NSStringFromClass(v4);
  id v14 = v44;
  v27 = [(SUSettingsScanResults *)v44 scanUUID];
  BOOL v5 = [(SUSettingsScanResults *)v44 preferredUpdateDownloadable];
  char v6 = "YES";
  if (!v5) {
    char v6 = "NO";
  }
  id v15 = v6;
  BOOL v7 = [(SUSettingsScanResults *)v44 alternateUpdateDownloadable];
  char v8 = "YES";
  if (!v7) {
    char v8 = "NO";
  }
  id v16 = v8;
  v26 = [(SUSettingsScanResults *)v44 preferredUpdateDownloadError];
  v25 = [(SUSettingsScanResults *)v44 alternateUpdateDownloadError];
  v24 = [(SUSettingsScanResults *)v44 agreementManager];
  BOOL v17 = [(SUSettingsScanResults *)v44 isClearingSpaceForDownload];
  id v18 = v43[0];
  BOOL v9 = [(SUSettingsScanResults *)v44 isAutoUpdateScheduled];
  v10 = "YES";
  if (!v9) {
    v10 = "NO";
  }
  v19 = v10;
  v23 = [(SUSettingsScanResults *)v44 currentAutoInstallOperation];
  BOOL v11 = [(SUSettingsScanResults *)v44 isUpdateReadyForInstallation];
  id v12 = "YES";
  if (!v11) {
    id v12 = "NO";
  }
  objc_super v20 = v12;
  v22 = [(SUSettingsScanResults *)v44 updateInstallationError];
  id v29 = (id)[v21 stringWithFormat:@"<%@: %p, \n\tscanUUID: %@\n\tpreferredUpdateDownloadable: %s, \n\talternateUpdateDownloadable: %s, \n\tpreferredUpdateDownloadError: %@, \n\talternateUpdateDownloadError: %@, \n\tagreementManager: %@, \n\tisClearingSpaceForDownload: %d, \n\tcurrentDownload: %@, \n\tautoUpdateScheduled: %s (%p)\n\tisUpdateReadyForInstallation: %s\n\tupdateInstallationError: %@>", v28, v14, v27, v15, v16, v26, v25, v24, v17, v18, v19, v23, v20, v22];

  objc_storeStrong(v43, 0);
  return v29;
}

- (NSString)scanUUID
{
  return self->_scanUUID;
}

- (void)setScanUUID:(id)a3
{
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

- (void).cxx_destruct
{
}

@end