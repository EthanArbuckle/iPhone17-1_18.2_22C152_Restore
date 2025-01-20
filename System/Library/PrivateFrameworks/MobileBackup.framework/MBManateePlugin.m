@interface MBManateePlugin
- (id)_standardizePath:(id)a3 fromDomain:(id)a4;
- (id)startingBackupWithEngine:(id)a3;
@end

@implementation MBManateePlugin

- (id)_standardizePath:(id)a3 fromDomain:(id)a4
{
  id v7 = a4;
  v8 = [a3 stringByStandardizingPath];
  if ([v8 isAbsolutePath])
  {
    v9 = [v7 rootPath];
    unsigned __int8 v10 = [v8 hasPrefix:v9];

    if ((v10 & 1) == 0)
    {
      v14 = +[NSAssertionHandler currentHandler];
      v15 = [v7 rootPath];
      [v14 handleFailureInMethod:a2, self, @"MBManateePlugin.m", 33, @"Absolute path doesn't have domain root %@ as prefix: %@", v15, v8 object file lineNumber description];
    }
    v11 = [v7 rootPath];
    uint64_t v12 = objc_msgSend(v8, "substringFromIndex:", (char *)objc_msgSend(v11, "length") + 1);

    v8 = (void *)v12;
  }

  return v8;
}

- (id)startingBackupWithEngine:(id)a3
{
  id v3 = a3;
  if (![v3 backsUpPrimaryAccount])
  {
    v6 = 0;
    goto LABEL_80;
  }
  char v89 = 0;
  if (![v3 isCloudKitEngine])
  {
    id v57 = 0;
    goto LABEL_7;
  }
  id v88 = 0;
  unsigned __int8 v4 = [v3 fetchDeviceToDeviceEncryptionSupportedByAccount:&v89 error:&v88];
  id v5 = v88;
  if (v4)
  {
    id v57 = v5;
LABEL_7:
    id v7 = [v3 domainManager];
    v8 = [v7 allDomains];

    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id obj = v8;
    id v60 = [obj countByEnumeratingWithState:&v84 objects:v98 count:16];
    if (v60)
    {
      uint64_t v59 = *(void *)v85;
      v62 = v3;
      do
      {
        v9 = 0;
        do
        {
          if (*(void *)v85 != v59) {
            objc_enumerationMutation(obj);
          }
          unsigned __int8 v10 = *(void **)(*((void *)&v84 + 1) + 8 * (void)v9);
          v11 = [v10 relativePathsToBackupToDriveAndStandardAccount];

          if (v11)
          {
            uint64_t v12 = [v10 relativePathsToBackupToDriveAndStandardAccount];
            id v13 = [v12 mutableCopy];

            v14 = [v10 relativePathsToBackupAndRestore];

            v61 = v9;
            if (v14)
            {
              v15 = [v10 relativePathsToBackupAndRestore];
              id v16 = [v15 mutableCopy];
            }
            else
            {
              id v16 = (id)objc_opt_new();
            }
            long long v82 = 0u;
            long long v83 = 0u;
            long long v80 = 0u;
            long long v81 = 0u;
            id v17 = v13;
            id v18 = [v17 countByEnumeratingWithState:&v80 objects:v97 count:16];
            if (v18)
            {
              id v19 = v18;
              uint64_t v20 = *(void *)v81;
              do
              {
                for (i = 0; i != v19; i = (char *)i + 1)
                {
                  if (*(void *)v81 != v20) {
                    objc_enumerationMutation(v17);
                  }
                  v22 = *(void **)(*((void *)&v80 + 1) + 8 * i);
                  v23 = -[MBManateePlugin _standardizePath:fromDomain:](self, "_standardizePath:fromDomain:", v22, v10, v54);
                  if ([v16 containsObject:v23])
                  {
                    v24 = MBGetDefaultLog();
                    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      v93 = v22;
                      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Removing manatee path: %@", buf, 0xCu);
                      v54 = v22;
                      _MBLog();
                    }

                    [v16 removeObject:v23];
                  }
                }
                id v19 = [v17 countByEnumeratingWithState:&v80 objects:v97 count:16];
              }
              while (v19);
            }

            id v3 = v62;
            if ([v62 isCloudKitEngine])
            {
              if (qword_100482640 != -1) {
                dispatch_once(&qword_100482640, &stru_100415978);
              }
              v25 = ATClientController_ptr;
              id v26 = (id)qword_100482638;
              long long v76 = 0u;
              long long v77 = 0u;
              long long v78 = 0u;
              long long v79 = 0u;
              id v65 = [v26 countByEnumeratingWithState:&v76 objects:v96 count:16];
              if (v65)
              {
                uint64_t v27 = *(void *)v77;
                id v63 = v26;
                uint64_t v64 = *(void *)v77;
                do
                {
                  uint64_t v28 = 0;
                  do
                  {
                    if (*(void *)v77 != v27) {
                      objc_enumerationMutation(v26);
                    }
                    uint64_t v66 = v28;
                    v29 = *(void **)(*((void *)&v76 + 1) + 8 * v28);
                    v30 = objc_msgSend(v10, "rootPath", v54);
                    unsigned int v31 = [v29 hasPrefix:v30];

                    if (v31)
                    {
                      v32 = [v25[113] defaultManager];
                      unsigned __int8 v33 = [v32 fileExistsAtPath:v29];

                      v34 = MBGetDefaultLog();
                      BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_INFO);
                      if (v33)
                      {
                        if (v35)
                        {
                          *(_DWORD *)buf = 138412546;
                          v93 = v10;
                          __int16 v94 = 2112;
                          v95 = v29;
                          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Marker found for %@ at %@", buf, 0x16u);
                          v54 = v10;
                          v56 = v29;
                          _MBLog();
                        }

                        v34 = [v26 objectForKeyedSubscript:v29];
                        long long v72 = 0u;
                        long long v73 = 0u;
                        long long v74 = 0u;
                        long long v75 = 0u;
                        id v36 = [v34 countByEnumeratingWithState:&v72 objects:v91 count:16];
                        if (v36)
                        {
                          id v37 = v36;
                          uint64_t v38 = *(void *)v73;
                          do
                          {
                            for (j = 0; j != v37; j = (char *)j + 1)
                            {
                              if (*(void *)v73 != v38) {
                                objc_enumerationMutation(v34);
                              }
                              v40 = *(void **)(*((void *)&v72 + 1) + 8 * (void)j);
                              unsigned __int8 v41 = objc_msgSend(v17, "containsObject:", v40, v54);
                              v42 = MBGetDefaultLog();
                              v43 = v42;
                              if (v41)
                              {
                                if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
                                {
                                  *(_DWORD *)buf = 138412290;
                                  v93 = v40;
                                  _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "Adding manatee path (marker detected): %@", buf, 0xCu);
                                  v54 = v40;
                                  _MBLog();
                                }

                                v43 = [(MBManateePlugin *)self _standardizePath:v40 fromDomain:v10];
                                [v16 addObject:v43];
                                [v17 removeObject:v43];
                              }
                              else if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                              {
                                *(_DWORD *)buf = 138412290;
                                v93 = v40;
                                _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Domains plist does not contain path found in hardcoded manatee exclusion list: %@", buf, 0xCu);
                                v54 = v40;
                                _MBLog();
                              }
                            }
                            id v37 = [v34 countByEnumeratingWithState:&v72 objects:v91 count:16];
                          }
                          while (v37);
                          v25 = ATClientController_ptr;
                          id v26 = v63;
                        }
                      }
                      else if (v35)
                      {
                        *(_DWORD *)buf = 138412546;
                        v93 = v10;
                        __int16 v94 = 2112;
                        v95 = v29;
                        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Marker not found for %@ at %@", buf, 0x16u);
                        v54 = v10;
                        v56 = v29;
                        _MBLog();
                      }
                      uint64_t v27 = v64;
                    }
                    uint64_t v28 = v66 + 1;
                  }
                  while ((id)(v66 + 1) != v65);
                  id v65 = [v26 countByEnumeratingWithState:&v76 objects:v96 count:16];
                }
                while (v65);
              }

              id v3 = v62;
            }
            if ((objc_msgSend(v3, "isDeviceTransferEngine", v54, v56) & 1) != 0
              || [v3 isDriveEngine]
              && ([v3 encrypted] & 1) != 0
              || [v3 isCloudKitEngine] && !v89)
            {
              long long v70 = 0u;
              long long v71 = 0u;
              long long v68 = 0u;
              long long v69 = 0u;
              id v44 = v17;
              id v45 = [v44 countByEnumeratingWithState:&v68 objects:v90 count:16];
              if (v45)
              {
                id v46 = v45;
                uint64_t v47 = *(void *)v69;
                do
                {
                  for (k = 0; k != v46; k = (char *)k + 1)
                  {
                    if (*(void *)v69 != v47) {
                      objc_enumerationMutation(v44);
                    }
                    v49 = *(void **)(*((void *)&v68 + 1) + 8 * (void)k);
                    v50 = MBGetDefaultLog();
                    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      v93 = v49;
                      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "Adding manatee path: %@", buf, 0xCu);
                      v55 = v49;
                      _MBLog();
                    }

                    v51 = [(MBManateePlugin *)self _standardizePath:v49 fromDomain:v10];
                    [v16 addObject:v51];
                  }
                  id v46 = [v44 countByEnumeratingWithState:&v68 objects:v90 count:16];
                }
                while (v46);
              }

              id v3 = v62;
            }
            objc_msgSend(v10, "setRelativePathsToBackupAndRestore:", v16, v55);

            v9 = v61;
          }
          v9 = (char *)v9 + 1;
        }
        while (v9 != v60);
        id v60 = [obj countByEnumeratingWithState:&v84 objects:v98 count:16];
      }
      while (v60);
    }

    v6 = 0;
    id v52 = v57;
    goto LABEL_79;
  }
  id v52 = v5;
  v6 = v52;
LABEL_79:

LABEL_80:
  return v6;
}

@end