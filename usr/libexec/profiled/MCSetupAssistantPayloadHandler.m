@interface MCSetupAssistantPayloadHandler
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (void)_removeSetupAssistantSettings;
- (void)_saveSetupAssistantSettings;
- (void)remove;
- (void)setAside;
@end

@implementation MCSetupAssistantPayloadHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  v8 = +[NSFileManager defaultManager];
  v9 = MCSetupAssistantSettingsFilePath();
  unsigned __int8 v10 = [v8 fileExistsAtPath:v9];

  if ((v10 & 1) == 0)
  {
    [(MCSetupAssistantPayloadHandler *)self _saveSetupAssistantSettings];
    goto LABEL_9;
  }
  uint64_t v11 = MCSetupAssistantErrorDomain;
  v12 = MCErrorArray();
  uint64_t v13 = MCErrorTypeFatal;
  v14 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v11, 56000, v12, MCErrorTypeFatal, 0);
  id v15 = [v14 MCCopyAsPrimaryError];

  if (!v15)
  {
LABEL_9:
    BOOL v26 = 1;
    goto LABEL_10;
  }
  uint64_t v16 = MCInstallationErrorDomain;
  v17 = [(MCNewPayloadHandler *)self payload];
  v18 = [v17 friendlyName];
  v19 = MCErrorArray();
  v20 = +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v16, 4001, v19, v15, v13, v18, 0);

  if (a6) {
    *a6 = v20;
  }
  os_log_t v21 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    v22 = v21;
    v23 = [(MCNewPayloadHandler *)self payload];
    v24 = [v23 friendlyName];
    v25 = [v20 MCVerboseDescription];
    *(_DWORD *)buf = 138543618;
    v29 = v24;
    __int16 v30 = 2114;
    v31 = v25;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Cannot install shared device configuration “%{public}@”. Error: %{public}@", buf, 0x16u);
  }
  BOOL v26 = 0;
LABEL_10:

  return v26;
}

- (void)remove
{
  v3 = [(MCNewPayloadHandler *)self profileHandler];
  unsigned __int8 v4 = [v3 isSetAside];

  if ((v4 & 1) == 0)
  {
    [(MCSetupAssistantPayloadHandler *)self _removeSetupAssistantSettings];
  }
}

- (void)setAside
{
}

- (void)_saveSetupAssistantSettings
{
  id v4 = [(MCNewPayloadHandler *)self payload];
  v2 = [v4 configuration];
  v3 = MCSetupAssistantSettingsFilePath();
  [v2 MCWriteToBinaryFile:v3];
}

- (void)_removeSetupAssistantSettings
{
  id v3 = +[NSFileManager defaultManager];
  v2 = MCSetupAssistantSettingsFilePath();
  [v3 removeItemAtPath:v2 error:0];
}

@end