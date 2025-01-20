@interface MCFontPayloadHandler
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (id)_errorFontAlreadyInstalled;
- (id)_errorFontCollection;
- (id)_errorFontInvalid;
- (id)_errorFontUnknownWithUnderlyingError:(id)a3;
- (void)remove;
@end

@implementation MCFontPayloadHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v9 = a3;
  id v80 = a4;
  id v79 = a5;
  v10 = [(MCNewPayloadHandler *)self payload];
  CFTypeRef cf = 0;
  v11 = [v10 fontData];

  if (!v11)
  {
    id v18 = [(MCFontPayloadHandler *)self _errorFontInvalid];
    v20 = 0;
    v15 = 0;
    v21 = 0;
    v22 = 0;
    FontDescriptorsFromURL = 0;
LABEL_20:
    if (cf) {
      CFRelease(cf);
    }
    if (v18)
    {
      os_log_t v27 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        v28 = v27;
        v29 = [v18 MCVerboseDescription];
        *(_DWORD *)buf = 138543362;
        *(void *)v94 = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Cannot install font. Error: %{public}@", buf, 0xCu);
      }
      LOBYTE(v24) = 0;
      if (a6) {
        *a6 = [v18 MCCopyAsPrimaryError];
      }
    }
    else
    {
      LOBYTE(v24) = 1;
    }
    goto LABEL_28;
  }
  v12 = NSTemporaryDirectory();
  v13 = +[NSString MCMakeUUID];
  v14 = [v12 stringByAppendingPathComponent:v13];
  v15 = +[NSURL fileURLWithPath:v14];

  v16 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)v94 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Writing font to temporary URL %{public}@", buf, 0xCu);
  }
  v17 = [v10 fontData];
  id v87 = 0;
  [v17 writeToURL:v15 options:268435457 error:&v87];
  id v18 = v87;

  id v77 = v9;
  if (v18) {
    goto LABEL_5;
  }
  FontDescriptorsFromURL = (void *)MCCTFontManagerCreateFontDescriptorsFromURL();
  if (![FontDescriptorsFromURL count])
  {
    uint64_t v23 = [(MCFontPayloadHandler *)self _errorFontInvalid];
    goto LABEL_11;
  }
  if ((unint64_t)[FontDescriptorsFromURL count] >= 2)
  {
    uint64_t v23 = [(MCFontPayloadHandler *)self _errorFontCollection];
LABEL_11:
    id v18 = (id)v23;
    goto LABEL_12;
  }

  uint64_t v31 = MCCGDataProviderCreateWithURL();
  if (!v31)
  {
    v41 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "Could not specify font as data provider.", buf, 2u);
    }
    id v18 = [(MCFontPayloadHandler *)self _errorFontInvalid];
LABEL_5:
    FontDescriptorsFromURL = 0;
LABEL_12:
    v22 = 0;
    v21 = 0;
    v20 = 0;
    v24 = 0;
    v25 = 0;
LABEL_13:
    if (v15)
    {
      v26 = +[NSFileManager defaultManager];
      [v26 removeItemAtURL:v15 error:0];
    }
    if (v25) {
      CFRelease(v25);
    }
    if (v24) {
      CFRelease(v24);
    }
    id v9 = v77;
    goto LABEL_20;
  }
  v25 = (const void *)v31;
  uint64_t v32 = MCCGFontCreateWithDataProvider();
  if (!v32)
  {
    v42 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "Could not create font for introspection.", buf, 2u);
    }
    id v18 = [(MCFontPayloadHandler *)self _errorFontInvalid];
    FontDescriptorsFromURL = 0;
    v22 = 0;
    v21 = 0;
    v20 = 0;
    v24 = 0;
    goto LABEL_13;
  }
  v24 = (const void *)v32;
  v20 = (void *)MCCGFontCopyFullName();
  if (v20 || (v20 = (void *)MCCGFontCopyPostScriptName()) != 0) {
    [v10 setName:v20];
  }
  uint64_t v33 = GSFontCopyPersistentPostscriptURL();
  if (!v33)
  {
    v43 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Could not create persistent URL for font.", buf, 2u);
    }
    id v18 = [(MCFontPayloadHandler *)self _errorFontInvalid];
    FontDescriptorsFromURL = 0;
    v22 = 0;
    v21 = 0;
    goto LABEL_13;
  }
  v21 = (void *)v33;
  [v10 setPersistentURL:v33];
  v34 = +[MCDependencyManager sharedManager];
  uint64_t v69 = kMCDMFontURLToProfileIdentifierKey;
  v22 = [v34 parentsInDomain:];

  v35 = [v21 absoluteString];
  unsigned int v36 = [v22 containsObject:v35];

  v37 = _MCLogObjects[0];
  if (v36)
  {
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)v94 = v20;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "The font “%{public}@” has already been installed. Not installing again.", buf, 0xCu);
    }
    id v18 = 0;
LABEL_39:
    v73 = +[MCDependencyManager sharedManager];
    v38 = [v21 absoluteString];
    v70 = [v10 profile];
    v39 = [v70 identifier];
    [v73 addDependent:v38 ofParent:v39 inDomain:kMCDMProfileIdentifierToFontURLKey reciprocalDomain:v69];

    v40 = v73;
LABEL_56:

    FontDescriptorsFromURL = 0;
    goto LABEL_13;
  }
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)v94 = v20;
    *(_WORD *)&v94[8] = 2114;
    *(void *)&v94[10] = v21;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "Installing font “%{public}@” to URL %{public}@", buf, 0x16u);
  }
  v44 = +[NSFileManager defaultManager];
  v45 = [v21 path];
  v65 = v44;
  LODWORD(v44) = [v44 fileExistsAtPath:v45];

  if (v44) {
    [v65 removeItemAtURL:v21 error:0];
  }
  v46 = +[NSFileManager defaultManager];
  id v86 = 0;
  [v46 copyItemAtURL:v15 toURL:v21 error:&v86];
  id v18 = v86;

  if (v18) {
    goto LABEL_55;
  }
  v74 = +[NSFileManager defaultManager];
  NSFileAttributeKey v91 = NSFileProtectionKey;
  NSFileProtectionType v92 = NSFileProtectionNone;
  v71 = +[NSDictionary dictionaryWithObjects:&v92 forKeys:&v91 count:1];
  v47 = [v21 path];
  id v85 = 0;
  [v74 setAttributes:v71 ofItemAtPath:v47 error:&v85];
  id v18 = v85;

  if (v18)
  {
LABEL_55:
    v40 = v65;
    goto LABEL_56;
  }
  v90 = v21;
  +[NSArray arrayWithObjects:&v90 count:1];
  GSFontRegisterPersistentURLs();
  if (!cf)
  {
    id v18 = 0;
    goto LABEL_84;
  }
  v48 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)v94 = cf;
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEBUG, "Results: %{public}@", buf, 0xCu);
  }
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id obj = (id)cf;
  id v64 = [obj countByEnumeratingWithState:&v81 objects:v89 count:16];
  id v18 = 0;
  if (!v64)
  {
LABEL_81:

LABEL_84:
    v57 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)v94 = v20;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Installed font “%{public}@”.", buf, 0xCu);
    }

    goto LABEL_39;
  }
  uint64_t v63 = *(void *)v82;
  *(void *)&long long v49 = 67240450;
  long long v60 = v49;
LABEL_62:
  uint64_t v50 = 0;
  while (1)
  {
    if (*(void *)v82 != v63) {
      objc_enumerationMutation(obj);
    }
    uint64_t v72 = v50;
    v66 = *(void **)(*((void *)&v81 + 1) + 8 * v50);
    v51 = [v66 objectForKeyedSubscript:@"result" v60];
    unsigned int v75 = [v51 intValue];

    if (!v75 || v75 == 105)
    {
      v54 = _MCLogObjects[0];
      int v68 = 1;
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        int v68 = 1;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "Successfully installed font.", buf, 2u);
      }
      char v53 = 0;
    }
    else
    {
      if (v75 == 305)
      {
        v76 = [v66 objectForKeyedSubscript:@"error"];
        v58 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)v94 = v76;
          _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "Failed to install font with 305 'Font Already Installed' error: %{public}@", buf, 0xCu);
        }
        uint64_t v59 = [(MCFontPayloadHandler *)self _errorFontAlreadyInstalled];

        id v18 = (id)v59;
        goto LABEL_55;
      }
      v67 = [v66 objectForKeyedSubscript:@"error"];
      v52 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v60;
        *(_DWORD *)v94 = v75;
        *(_WORD *)&v94[4] = 2114;
        *(void *)&v94[6] = v67;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "Failed to install font with %{public}d error: %{public}@", buf, 0x12u);
      }
      uint64_t v62 = [(MCFontPayloadHandler *)self _errorFontUnknownWithUnderlyingError:v67];

      int v68 = 0;
      char v53 = 1;
      id v18 = (id)v62;
    }
    if (v75 != 105 && v75 != 0) {
      break;
    }
    uint64_t v50 = v72 + 1;
    if (v64 == (id)(v72 + 1))
    {
      id v64 = [obj countByEnumeratingWithState:&v81 objects:v89 count:16];
      if (v64) {
        goto LABEL_62;
      }
      goto LABEL_81;
    }
  }
  char v56 = v53;

  if (v68) {
    goto LABEL_84;
  }

  FontDescriptorsFromURL = 0;
  if (v56) {
    goto LABEL_13;
  }
  id v9 = v77;
LABEL_28:

  return v24 & 1;
}

- (void)remove
{
  id v7 = [(MCNewPayloadHandler *)self payload];
  v2 = +[MCDependencyManager sharedManager];
  v3 = [v7 persistentURL];
  v4 = [v3 absoluteString];
  v5 = [v7 profile];
  v6 = [v5 identifier];
  [v2 removeDependent:v4 fromParent:v6 inDomain:kMCDMProfileIdentifierToFontURLKey reciprocalDomain:kMCDMFontURLToProfileIdentifierKey];
}

- (id)_errorFontInvalid
{
  uint64_t v2 = MCFontErrorDomain;
  v3 = MCErrorArray();
  v4 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 35000, v3, MCErrorTypeFatal, 0);

  return v4;
}

- (id)_errorFontCollection
{
  uint64_t v2 = MCFontErrorDomain;
  v3 = MCErrorArray();
  v4 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 35002, v3, MCErrorTypeFatal, 0);

  return v4;
}

- (id)_errorFontAlreadyInstalled
{
  uint64_t v2 = MCFontErrorDomain;
  v3 = MCErrorArray();
  v4 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 35003, v3, MCErrorTypeFatal, 0);

  return v4;
}

- (id)_errorFontUnknownWithUnderlyingError:(id)a3
{
  uint64_t v3 = MCFontErrorDomain;
  id v4 = a3;
  v5 = MCErrorArray();
  v6 = +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v3, 35001, v5, v4, MCErrorTypeFatal, 0);

  return v6;
}

@end