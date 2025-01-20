@interface MCHomeScreenLayoutPayloadHandler
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (id)homeScreenLayoutFilePath;
- (void)remove;
- (void)setAside;
- (void)unsetAside;
@end

@implementation MCHomeScreenLayoutPayloadHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v8 = a4;
  v9 = [(MCNewPayloadHandler *)self payload];
  v10 = [v8 objectForKeyedSubscript:kMCInstallProfileOptionInstallationType];

  LODWORD(v8) = [v10 intValue];
  if (v8 == 2) {
    MCUserHomeScreenLayoutFilePath();
  }
  else {
  v11 = MCSystemHomeScreenLayoutFilePath();
  }
  v12 = +[NSFileManager defaultManager];
  if (([v12 fileExistsAtPath:v11] & 1) == 0)
  {
    v29 = [v9 layout];
    v30 = v29;
    if (v29) {
      [v29 writeToFile:v11 atomically:1];
    }

    goto LABEL_14;
  }
  uint64_t v13 = MCHomeScreenLayoutErrorDomain;
  v14 = MCErrorArray();
  uint64_t v15 = MCErrorTypeFatal;
  v16 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v13, 43000, v14, MCErrorTypeFatal, 0);
  id v17 = [v16 MCCopyAsPrimaryError];

  if (!v17)
  {
LABEL_14:
    MCSendHomeScreenLayoutChangedNotification();
    BOOL v28 = 1;
    goto LABEL_15;
  }
  uint64_t v18 = MCInstallationErrorDomain;
  v19 = [(MCNewPayloadHandler *)self payload];
  [v19 friendlyName];
  v21 = v20 = a6;
  v22 = MCErrorArray();
  v23 = +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v18, 4001, v22, v17, v15, v21, 0);

  if (v20) {
    id *v20 = v23;
  }
  os_log_t v24 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    v25 = v24;
    v26 = [v9 friendlyName];
    v27 = [v23 MCVerboseDescription];
    *(_DWORD *)buf = 138543618;
    v33 = v26;
    __int16 v34 = 2114;
    v35 = v27;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Cannot install home screen layout “%{public}@”. Error: %{public}@", buf, 0x16u);
  }
  BOOL v28 = 0;
LABEL_15:

  return v28;
}

- (void)remove
{
  v3 = [(MCNewPayloadHandler *)self profileHandler];
  unsigned __int8 v4 = [v3 isSetAside];

  if ((v4 & 1) == 0)
  {
    v5 = +[NSFileManager defaultManager];
    v6 = [(MCHomeScreenLayoutPayloadHandler *)self homeScreenLayoutFilePath];
    [v5 removeItemAtPath:v6 error:0];

    MCSendHomeScreenLayoutChangedNotification();
  }
}

- (void)setAside
{
  id v4 = +[NSFileManager defaultManager];
  v3 = [(MCHomeScreenLayoutPayloadHandler *)self homeScreenLayoutFilePath];
  [v4 removeItemAtPath:v3 error:0];
}

- (void)unsetAside
{
  id v5 = [(MCNewPayloadHandler *)self payload];
  v3 = [v5 layout];
  if (v3)
  {
    id v4 = [(MCHomeScreenLayoutPayloadHandler *)self homeScreenLayoutFilePath];
    [v3 writeToFile:v4 atomically:1];
  }
}

- (id)homeScreenLayoutFilePath
{
  v2 = [(MCNewPayloadHandler *)self profileHandler];
  v3 = [v2 profile];
  id v4 = [v3 installType];

  if (v4 == (id)2) {
    MCUserHomeScreenLayoutFilePath();
  }
  else {
  id v5 = MCSystemHomeScreenLayoutFilePath();
  }

  return v5;
}

@end