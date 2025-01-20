@interface MCNewWebClipPayloadHandler
- (BOOL)_addWebClip:(id)a3;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (BOOL)isInstalled;
- (id)_findInstalledClipWithIdentifier:(id)a3;
- (id)_installedWebClip;
- (id)_webclipFailedToCreateOnDiskError;
- (id)savedWebClipIdentifier;
- (void)_removeWebClip:(id)a3;
- (void)remove;
- (void)setAside;
- (void)unsetAside;
@end

@implementation MCNewWebClipPayloadHandler

- (id)savedWebClipIdentifier
{
  v2 = [(MCNewPayloadHandler *)self payload];
  v3 = [v2 savedIdentifier];
  if (!v3)
  {
    unsigned int v4 = [v2 fullScreen];
    v5 = [v2 UUID];
    v3 = v5;
    if (v4)
    {
      uint64_t v6 = [v5 stringByReplacingOccurrencesOfString:@"-" withString:&stru_1000ECAD0];

      v3 = (void *)v6;
    }
    os_log_t v7 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      v9 = [v2 friendlyName];
      int v11 = 138543618;
      v12 = v9;
      __int16 v13 = 2114;
      v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "WebClipHandler missing saved ID for payload '%{public}@'. Falling back to identifier: %{public}@", (uint8_t *)&v11, 0x16u);
    }
  }

  return v3;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v8 = a4;
  v9 = [(MCNewPayloadHandler *)self payload];
  v10 = [v8 objectForKeyedSubscript:kMCInstallProfileOptionIsInstalledByMDM];

  unsigned int v11 = [v10 BOOLValue];
  v12 = +[NSString MCMakeUUID];
  __int16 v13 = [v12 stringByReplacingOccurrencesOfString:@"-" withString:&stru_1000ECAD0];

  v14 = +[UIWebClip webClipWithIdentifier:v13];
  [v14 setFullScreen:[v9 fullScreen]];
  v15 = [v9 URL];
  [v14 setPageURL:v15];

  v16 = [v9 label];
  [v14 setTitle:v16];

  [v14 setRemovalDisallowed:objc_msgSend(v9, "isRemovable") ^ 1];
  if (objc_opt_respondsToSelector()) {
    [v14 setConfigurationIsManaged:1];
  }
  if (objc_opt_respondsToSelector()) {
    [v14 setIgnoreManifestScope:[v9 ignoreManifestScope]];
  }
  if (objc_opt_respondsToSelector())
  {
    v17 = [v9 contentMode];
    [v14 setContentModeWithString:v17];
  }
  if (v11)
  {
    if (objc_opt_respondsToSelector())
    {
      v18 = [v9 targetApplicationBundleIdentifier];
      [v14 setApplicationBundleIdentifier:v18];
    }
  }
  else
  {
    v19 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "WebClipHandler ignoring target application identifier because the profile is not being installed by MDM", buf, 2u);
    }
    [v9 setTargetApplicationBundleIdentifier:0];
  }
  v20 = [v9 iconData];

  if (v20)
  {
    v21 = [v9 iconData];
    v22 = +[UIImage imageWithData:v21];
    [v14 setIconImage:v22 isPrecomposed:[v9 precomposed]];
  }
  if ([(MCNewWebClipPayloadHandler *)self _addWebClip:v14])
  {
    [v9 setSavedIdentifier:v13];

LABEL_23:
    os_log_t v34 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      v35 = v34;
      v36 = [v9 friendlyName];
      *(_DWORD *)buf = 138543362;
      v39 = v36;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "WebClipHandler successfully installed web clip for payload '%{public}@'", buf, 0xCu);
    }
    BOOL v33 = 1;
    goto LABEL_26;
  }
  v23 = [(MCNewWebClipPayloadHandler *)self _webclipFailedToCreateOnDiskError];

  if (!v23) {
    goto LABEL_23;
  }
  uint64_t v24 = MCInstallationErrorDomain;
  v25 = [(MCNewPayloadHandler *)self payload];
  v26 = [v25 friendlyName];
  v27 = MCErrorArray();
  v28 = +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v24, 4001, v27, v23, MCErrorTypeFatal, v26, 0);

  if (a6) {
    *a6 = v28;
  }
  os_log_t v29 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    v30 = v29;
    v31 = [v9 friendlyName];
    v32 = [v28 MCVerboseDescription];
    *(_DWORD *)buf = 138543618;
    v39 = v31;
    __int16 v40 = 2114;
    v41 = v32;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "WebClipHandler cannot install webclip for payload '%{public}@' with error: %{public}@", buf, 0x16u);
  }
  BOOL v33 = 0;
LABEL_26:

  return v33;
}

- (id)_findInstalledClipWithIdentifier:(id)a3
{
  id v3 = a3;
  +[UIWebClip webClips];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v9 = [v8 identifier:v12];
        unsigned __int8 v10 = [v9 isEqualToString:v3];

        if (v10)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (id)_installedWebClip
{
  id v3 = [(MCNewWebClipPayloadHandler *)self savedWebClipIdentifier];
  uint64_t v4 = [(MCNewWebClipPayloadHandler *)self _findInstalledClipWithIdentifier:v3];
  if (v4)
  {
    id v5 = (void *)v4;
    uint64_t v6 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543362;
      long long v15 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "WebClipHandler found webclip for saved ID: %{public}@", (uint8_t *)&v14, 0xCu);
    }
    id v7 = v5;
  }
  else
  {
    id v8 = [(MCNewPayloadHandler *)self payload];
    v9 = [v8 UUID];

    id v7 = [(MCNewWebClipPayloadHandler *)self _findInstalledClipWithIdentifier:v9];
    unsigned __int8 v10 = _MCLogObjects[0];
    BOOL v11 = os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v11)
      {
        int v14 = 138543362;
        long long v15 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "WebClipHandler found webclip for payload UUID: %{public}@", (uint8_t *)&v14, 0xCu);
      }
      id v12 = v7;
    }
    else if (v11)
    {
      int v14 = 138543618;
      long long v15 = v3;
      __int16 v16 = 2114;
      v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "WebClipHandler could not find webclip for saved ID '%{public}@' or payload UUID '%{public}@'", (uint8_t *)&v14, 0x16u);
    }
  }

  return v7;
}

- (void)remove
{
  id v3 = [(MCNewPayloadHandler *)self profileHandler];
  unsigned int v4 = [v3 isSetAside];

  if (v4)
  {
    id v5 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "WebClipHandler ignoring remove because profile is set aside.", buf, 2u);
    }
  }
  else
  {
    uint64_t v6 = [(MCNewWebClipPayloadHandler *)self _installedWebClip];
    if (v6)
    {
      [(MCNewWebClipPayloadHandler *)self _removeWebClip:v6];
    }
    else
    {
      id v7 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "WebClipHandler ignoring remove because webclip is not installed.", v8, 2u);
      }
    }
  }
}

- (BOOL)isInstalled
{
  v2 = [(MCNewWebClipPayloadHandler *)self _installedWebClip];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setAside
{
  BOOL v3 = [(MCNewWebClipPayloadHandler *)self _installedWebClip];
  setAsideClip = self->_setAsideClip;
  self->_setAsideClip = v3;

  if (self->_setAsideClip)
  {
    -[MCNewWebClipPayloadHandler _removeWebClip:](self, "_removeWebClip:");
  }
  else
  {
    id v5 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "WebClipHandler ignoring set aside because webclip is not installed.", v6, 2u);
    }
  }
}

- (void)unsetAside
{
  setAsideClip = self->_setAsideClip;
  if (setAsideClip
    && ([(UIWebClip *)setAsideClip identifier],
        unsigned int v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    if ([(MCNewWebClipPayloadHandler *)self _addWebClip:self->_setAsideClip])
    {
      id v5 = self->_setAsideClip;
      self->_setAsideClip = 0;
    }
  }
  else
  {
    uint64_t v6 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "WebClipHandler ignoring unset aside because webclip is not set aside.", v7, 2u);
    }
  }
}

- (id)_webclipFailedToCreateOnDiskError
{
  uint64_t v2 = MCWebClipErrorDomain;
  BOOL v3 = MCErrorArray();
  unsigned int v4 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 8000, v3, MCErrorTypeFatal, 0);

  return v4;
}

- (BOOL)_addWebClip:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 identifier];
  unsigned int v5 = [v3 createOnDisk];

  if (v5)
  {
    MCSBSSpringBoardServerPort();
    id v6 = v4;
    [v6 UTF8String];
    MCSBAddWebClipToHomeScreen();
    os_log_t v7 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      id v14 = v6;
      id v8 = "WebClipHandler added webclip with identifier: %{public}@";
      v9 = v7;
      os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v9, v10, v8, (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    os_log_t v11 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      int v13 = 138543362;
      id v14 = v4;
      id v8 = "WebClipHandler failed to create webclip on disk with identifier: %{public}@";
      v9 = v11;
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
      goto LABEL_6;
    }
  }

  return v5;
}

- (void)_removeWebClip:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 identifier];
  MCSBSSpringBoardServerPort();
  id v5 = v4;
  [v5 UTF8String];
  MCSBRemoveWebClipFromHomeScreen();
  unsigned int v6 = [v3 removeFromDisk];

  os_log_t v7 = _MCLogObjects[0];
  if (v6)
  {
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      id v12 = v5;
      id v8 = "WebClipHandler removed webclip with identifier: %{public}@";
      v9 = v7;
      os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v9, v10, v8, (uint8_t *)&v11, 0xCu);
    }
  }
  else if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    int v11 = 138543362;
    id v12 = v5;
    id v8 = "WebClipHandler failed to remove webclip from disk with identifier: %{public}@";
    v9 = v7;
    os_log_type_t v10 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }
}

- (void).cxx_destruct
{
}

@end