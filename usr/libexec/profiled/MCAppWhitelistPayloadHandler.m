@interface MCAppWhitelistPayloadHandler
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (void)_postNotification;
- (void)didInstallOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4;
- (void)didRemoveOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4;
@end

@implementation MCAppWhitelistPayloadHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  v8 = [(MCNewPayloadHandler *)self payload];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return 1;
  }
  v10 = [(MCNewPayloadHandler *)self payload];
  v11 = +[MCRestrictionManager sharedManager];
  v12 = [v10 applicationBundleID];
  unsigned int v13 = [v11 allowedToRunAppWithBundleID:v12];

  if (v13)
  {

    return 1;
  }
  uint64_t v14 = MCAppWhitelistErrorDomain;
  v15 = MCErrorArray();
  uint64_t v16 = MCErrorTypeFatal;
  v17 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v14, 48000, v15, MCErrorTypeFatal, 0);
  id v18 = [v17 MCCopyAsPrimaryError];

  if (!v18) {
    return 1;
  }
  uint64_t v19 = MCInstallationErrorDomain;
  v20 = [(MCNewPayloadHandler *)self payload];
  v21 = [v20 friendlyName];
  v22 = MCErrorArray();
  v23 = +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v19, 4001, v22, v18, v16, v21, 0);

  if (a6) {
    *a6 = v23;
  }
  os_log_t v24 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    v25 = v24;
    v26 = [(MCNewPayloadHandler *)self payload];
    v27 = [v26 friendlyName];
    v28 = [v23 MCVerboseDescription];
    *(_DWORD *)buf = 138543618;
    v31 = v27;
    __int16 v32 = 2114;
    v33 = v28;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Cannot install app whitelist payload “%{public}@”. Error: %{public}@", buf, 0x16u);
  }
  return 0;
}

- (void)_postNotification
{
  v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Sending App Whitelist change notification", v3, 2u);
  }
  notify_post((const char *)[MCAppWhitelistDidChangeNotification UTF8String]);
}

- (void)didInstallOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4
{
}

- (void)didRemoveOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4
{
}

@end