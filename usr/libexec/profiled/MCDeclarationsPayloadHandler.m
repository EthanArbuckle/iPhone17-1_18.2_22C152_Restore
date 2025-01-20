@interface MCDeclarationsPayloadHandler
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (void)remove;
@end

@implementation MCDeclarationsPayloadHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [v11 objectForKeyedSubscript:kMCInstallProfileOptionIsInstalledByMDM];

  if (v13)
  {
    if (a6)
    {
      uint64_t v30 = kMCDeclarationsPayloadType;
      v14 = MCErrorArray();
      +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCInstallationErrorDomain, 4052, v14, MCErrorTypeFatal, v30, 0);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:
      *a6 = v15;

      goto LABEL_16;
    }
    goto LABEL_16;
  }
  if (!objc_opt_class() || !objc_opt_class())
  {
    if (a6)
    {
      v14 = MCErrorArray();
      +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCInternalErrorDomain, 4, v14, MCErrorTypeFatal, 0);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
LABEL_16:
    BOOL v23 = 0;
    goto LABEL_17;
  }
  v16 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Beginning installation of MCDeclarationsPayload.", buf, 2u);
  }
  v17 = [(MCNewPayloadHandler *)self payload];
  v31 = [v17 declarations];
  v18 = +[RMProfileStore profileStoreForOwner:@"MC.DeclarationsInProfile"];
  v19 = objc_opt_new();
  *(void *)buf = 0;
  v36 = buf;
  uint64_t v37 = 0x3032000000;
  v38 = sub_100045110;
  v39 = sub_100045120;
  id v40 = 0;
  v20 = [v17 identifier];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100045128;
  v32[3] = &unk_1000EB5F0;
  v34 = buf;
  id v21 = v19;
  id v33 = v21;
  [v18 installProfile:v20 declarations:v31 completionHandler:v32];

  [v21 waitForCompletion];
  uint64_t v22 = *((void *)v36 + 5);
  BOOL v23 = v22 == 0;
  v24 = _MCLogObjects[0];
  v25 = v24;
  if (v22)
  {
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v26 = [v17 friendlyName];
      uint64_t v27 = *((void *)v36 + 5);
      *(_DWORD *)v41 = 138543618;
      v42 = v26;
      __int16 v43 = 2114;
      uint64_t v44 = v27;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Failed to install declarations profile %{public}@: %{public}@", v41, 0x16u);
    }
    if (a6) {
      *a6 = *((id *)v36 + 5);
    }
  }
  else
  {
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v29 = [v17 friendlyName];
      *(_DWORD *)v41 = 138543362;
      v42 = v29;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Successfully installed declarations profile %{public}@", v41, 0xCu);
    }
  }

  _Block_object_dispose(buf, 8);
LABEL_17:

  return v23;
}

- (void)remove
{
  os_log_t v3 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    v4 = v3;
    v5 = [(MCNewPayloadHandler *)self payload];
    v6 = [v5 friendlyName];
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Removing declarations profile %{public}@.", (uint8_t *)&buf, 0xCu);
  }
  v7 = +[RMProfileStore profileStoreForOwner:@"MC.DeclarationsInProfile"];
  v8 = objc_opt_new();
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v31 = 0x3032000000;
  v32 = sub_100045110;
  id v33 = sub_100045120;
  id v34 = 0;
  v9 = [(MCNewPayloadHandler *)self payload];
  id v10 = [v9 identifier];
  v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472;
  uint64_t v22 = sub_1000454B0;
  BOOL v23 = &unk_1000EB5F0;
  p_long long buf = &buf;
  id v11 = v8;
  id v24 = v11;
  [v7 removeProfile:v10 completionHandler:&v20];

  [v11 waitForCompletion:v20, v21, v22, v23];
  uint64_t v12 = *(void *)(*((void *)&buf + 1) + 40);
  v13 = _MCLogObjects[0];
  v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v15 = [(MCNewPayloadHandler *)self payload];
      v16 = [v15 friendlyName];
      uint64_t v17 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)v26 = 138543618;
      uint64_t v27 = v16;
      __int16 v28 = 2114;
      uint64_t v29 = v17;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to remove declarations profile %{public}@: %{public}@", v26, 0x16u);
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v18 = [(MCNewPayloadHandler *)self payload];
    v19 = [v18 friendlyName];
    *(_DWORD *)v26 = 138543362;
    uint64_t v27 = v19;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Successfully removed declarations profile %{public}@", v26, 0xCu);
  }
  _Block_object_dispose(&buf, 8);
}

@end