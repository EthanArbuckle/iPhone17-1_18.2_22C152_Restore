@interface SUSettingsUpdateParam
- (BOOL)bypassTermsAndConditions;
- (BOOL)createdKeybag;
- (BOOL)downloadStartedSuccessfully;
- (BOOL)installInitiatedSuccessfully;
- (BOOL)isUnattendedInstall;
- (BOOL)updateScheduledSuccessfully;
- (NSError)operationError;
- (NSError)scheduleError;
- (SUAutoInstallOperation)autoInstallOperation;
- (SUDescriptor)descriptor;
- (SUDownload)currentDownload;
- (SUSettingsUpdateOptions)options;
- (SUSettingsUpdateParam)initWithDescriptor:(id)a3 andUpdateOptions:(id)a4 forUnattendedInstall:(BOOL)a5;
- (id)description;
- (int)cellularAgreementStatus;
- (void)setAutoInstallOperation:(id)a3;
- (void)setBypassTermsAndConditions:(BOOL)a3;
- (void)setCellularAgreementStatus:(int)a3;
- (void)setCreatedKeybag:(BOOL)a3;
- (void)setCurrentDownload:(id)a3;
- (void)setDescriptor:(id)a3;
- (void)setDownloadStartedSuccessfully:(BOOL)a3;
- (void)setInstallInitiatedSuccessfully:(BOOL)a3;
- (void)setOperationError:(id)a3;
- (void)setOptions:(id)a3;
- (void)setScheduleError:(id)a3;
- (void)setUnattendedInstall:(BOOL)a3;
- (void)setUpdateScheduledSuccessfully:(BOOL)a3;
@end

@implementation SUSettingsUpdateParam

- (SUSettingsUpdateParam)initWithDescriptor:(id)a3 andUpdateOptions:(id)a4 forUnattendedInstall:(BOOL)a5
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  BOOL v12 = a5;
  v5 = v15;
  v15 = 0;
  v11.receiver = v5;
  v11.super_class = (Class)SUSettingsUpdateParam;
  v10 = [(SUSettingsUpdateParam *)&v11 init];
  v15 = v10;
  objc_storeStrong((id *)&v15, v10);
  if (v10)
  {
    [(SUSettingsUpdateParam *)v15 setDescriptor:location[0]];
    [(SUSettingsUpdateParam *)v15 setOptions:v13];
    [(SUSettingsUpdateParam *)v15 setUnattendedInstall:v12];
  }
  v7 = v15;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v15, 0);
  return v7;
}

- (id)description
{
  v64 = self;
  location[1] = (id)a2;
  location[0] = @"(null)";
  v53 = [(SUSettingsUpdateParam *)v64 currentDownload];
  char v61 = 0;
  char v59 = 0;
  BOOL v54 = 0;
  if (v53)
  {
    v62 = [(SUSettingsUpdateParam *)v64 currentDownload];
    int v52 = 1;
    char v61 = 1;
    v60 = [(SUDownload *)v62 descriptor];
    char v59 = 1;
    BOOL v54 = v60 != 0;
  }
  BOOL v51 = v54;
  if (v59) {

  }
  if (v61) {
  if (v51)
  }
  {
    id v44 = (id)NSString;
    v50 = [(SUSettingsUpdateParam *)v64 currentDownload];
    v49 = [(SUDownload *)v50 descriptor];
    id v48 = (id)[(SUDescriptor *)v49 humanReadableUpdateName];
    v47 = [(SUSettingsUpdateParam *)v64 currentDownload];
    v46 = [(SUSettingsUpdateParam *)v64 currentDownload];
    v45 = [(SUDownload *)v46 progress];
    id v2 = (id)[v44 stringWithFormat:@"%@ (%p) (progress: %@)", v48, v47, v45];
    id v3 = location[0];
    location[0] = v2;
  }
  id v40 = (id)NSString;
  v4 = (objc_class *)objc_opt_class();
  v41 = NSStringFromClass(v4);
  v42 = v64;
  v43 = [(SUSettingsUpdateParam *)v64 descriptor];
  char v57 = 0;
  char v55 = 0;
  if (v43)
  {
    v58 = [(SUSettingsUpdateParam *)v64 descriptor];
    int v38 = 1;
    char v57 = 1;
    v56 = (__CFString *)(id)[(SUDescriptor *)v58 humanReadableUpdateName];
    char v55 = 1;
    v39 = v56;
  }
  else
  {
    v39 = @"(null)";
  }
  v22 = v39;
  id v37 = [(SUSettingsUpdateParam *)v64 descriptor];
  id v36 = [(SUSettingsUpdateParam *)v64 operationError];
  id v35 = [(SUSettingsUpdateParam *)v64 options];
  id v23 = location[0];
  BOOL v5 = [(SUSettingsUpdateParam *)v64 isUnattendedInstall];
  v20 = "NO";
  v6 = "YES";
  v21 = "YES";
  if (!v5) {
    v6 = "NO";
  }
  v24 = v6;
  BOOL v7 = [(SUSettingsUpdateParam *)v64 bypassTermsAndConditions];
  v8 = v21;
  if (!v7) {
    v8 = v20;
  }
  v25 = v8;
  BOOL v9 = [(SUSettingsUpdateParam *)v64 createdKeybag];
  v10 = v21;
  if (!v9) {
    v10 = v20;
  }
  v26 = v10;
  uint64_t v27 = [(SUSettingsUpdateParam *)v64 cellularAgreementStatus];
  BOOL v11 = [(SUSettingsUpdateParam *)v64 downloadStartedSuccessfully];
  BOOL v12 = v21;
  if (!v11) {
    BOOL v12 = v20;
  }
  v28 = v12;
  BOOL v13 = [(SUSettingsUpdateParam *)v64 updateScheduledSuccessfully];
  v14 = v21;
  if (!v13) {
    v14 = v20;
  }
  v29 = v14;
  BOOL v15 = [(SUSettingsUpdateParam *)v64 installInitiatedSuccessfully];
  v16 = v21;
  if (!v15) {
    v16 = v20;
  }
  v30 = v16;
  id v34 = [(SUSettingsUpdateParam *)v64 autoInstallOperation];
  id v33 = [(SUSettingsUpdateParam *)v64 autoInstallOperation];
  id v32 = [(SUSettingsUpdateParam *)v64 scheduleError];
  v31 = &v19;
  id v65 = objc_retainAutoreleasedReturnValue((id)objc_msgSend(v40, "stringWithFormat:", @"<%@: %p, \n\tdescriptor: %@ (%p), \n\toperationError: %@, \n\toptions: %@, \n\tcurrentDownload: %@, \n\tunattendedInstall: %s, \n\tbypassTermsAndConditions: %s, \n\tcreatedKeybag: %s, \n\tcellularAgreementStatus: %ld, \n\tdownloadStartSuccessfully: %s, \n\tupdateScheduledSuccessfully: %s, \n\tinstallInitiatedSuccessfully: %s, \n\tautoInstallOperation: %@ (%p), \n\tscheduleError: %@>", v41, v42, v22, v37, v36, v35, v23, v24, v25, v26, v27, v28, v29, v30, v34, v33,
                                                 v32));

  if (v55) {
  if (v57)
  }

  objc_storeStrong(location, 0);
  v17 = v65;
  return v17;
}

- (SUDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
}

- (NSError)operationError
{
  return self->_operationError;
}

- (void)setOperationError:(id)a3
{
}

- (SUSettingsUpdateOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (BOOL)createdKeybag
{
  return self->_createdKeybag;
}

- (void)setCreatedKeybag:(BOOL)a3
{
  self->_createdKeybag = a3;
}

- (SUDownload)currentDownload
{
  return self->_currentDownload;
}

- (void)setCurrentDownload:(id)a3
{
}

- (BOOL)isUnattendedInstall
{
  return self->_unattendedInstall;
}

- (void)setUnattendedInstall:(BOOL)a3
{
  self->_unattendedInstall = a3;
}

- (BOOL)bypassTermsAndConditions
{
  return self->_bypassTermsAndConditions;
}

- (void)setBypassTermsAndConditions:(BOOL)a3
{
  self->_bypassTermsAndConditions = a3;
}

- (int)cellularAgreementStatus
{
  return self->_cellularAgreementStatus;
}

- (void)setCellularAgreementStatus:(int)a3
{
  self->_cellularAgreementStatus = a3;
}

- (BOOL)downloadStartedSuccessfully
{
  return self->_downloadStartedSuccessfully;
}

- (void)setDownloadStartedSuccessfully:(BOOL)a3
{
  self->_downloadStartedSuccessfully = a3;
}

- (BOOL)updateScheduledSuccessfully
{
  return self->_updateScheduledSuccessfully;
}

- (void)setUpdateScheduledSuccessfully:(BOOL)a3
{
  self->_updateScheduledSuccessfully = a3;
}

- (SUAutoInstallOperation)autoInstallOperation
{
  return self->_autoInstallOperation;
}

- (void)setAutoInstallOperation:(id)a3
{
}

- (NSError)scheduleError
{
  return self->_scheduleError;
}

- (void)setScheduleError:(id)a3
{
}

- (BOOL)installInitiatedSuccessfully
{
  return self->_installInitiatedSuccessfully;
}

- (void)setInstallInitiatedSuccessfully:(BOOL)a3
{
  self->_installInitiatedSuccessfully = a3;
}

- (void).cxx_destruct
{
}

@end