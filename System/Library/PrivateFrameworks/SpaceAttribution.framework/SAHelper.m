@interface SAHelper
+ (BOOL)isSAFSupported;
+ (id)dynamicRegistrationLock;
+ (int64_t)runAppSizerWithActivity:(id)a3 completionHandler:(id)a4;
+ (unint64_t)getOVPFileAndVolumeSize;
- (BOOL)isValidMountPoint:(id)a3;
- (void)addAppSizerHandler:(id)a3 reply:(id)a4;
- (void)addURLSizerHandler:(id)a3 withURLs:(id)a4 reply:(id)a5;
- (void)clearLastTelemetryData:(id)a3;
- (void)computeSizeOfSystemVolume:(id)a3;
- (void)computeSizeOfVolumeAtURL:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)disableAppSizerResultsFilteringWithReply:(id)a3;
- (void)getAppPaths:(id)a3 options:(int)a4 reply:(id)a5;
- (void)getLastTelemetryData:(id)a3;
- (void)getPurgeableInfo:(id)a3 options:(unint64_t)a4 reply:(id)a5;
- (void)importFromPlist:(id)a3 reply:(id)a4;
- (void)pingWithReply:(id)a3;
- (void)registerPaths:(id)a3 reply:(id)a4;
- (void)removeAppSizerHandler:(id)a3;
- (void)removeURLSizerHandler:(id)a3;
- (void)runAppSizer:(id)a3;
- (void)runAppSizerWithHandler:(id)a3 options:(unint64_t)a4 reply:(id)a5;
- (void)runAppSizerWithScanOptions:(unint64_t)a3 reply:(id)a4;
- (void)runFullScan:(id)a3;
- (void)runURLSizerWithID:(id)a3 reply:(id)a4;
- (void)setAppSizerMaxRerunTimeout:(unsigned int)a3 reply:(id)a4;
- (void)setAppSizerResultsFilteringOptionsToDefaultWithReply:(id)a3;
- (void)setEnableTTR:(BOOL)a3 reply:(id)a4;
- (void)setForceTTR:(BOOL)a3 reply:(id)a4;
- (void)setForceTelemetry:(id)a3;
- (void)unregisterPaths:(id)a3 reply:(id)a4;
@end

@implementation SAHelper

+ (id)dynamicRegistrationLock
{
  if (qword_10005AA10 != -1) {
    dispatch_once(&qword_10005AA10, &stru_10004C660);
  }
  v2 = (void *)qword_10005AA08;
  return v2;
}

- (void)pingWithReply:(id)a3
{
}

- (void)runFullScan:(id)a3
{
  v3 = (void (**)(id, id))a3;
  v4 = SALog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10002D690(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  v12 = objc_opt_new();
  [v12 setScanOptions:3];
  v13 = objc_opt_new();
  v14 = [v13 defaultList];

  v15 = objc_opt_new();
  [v15 updateWithAppPathList:v14];
  v16 = sub_10000F5C0();
  id v26 = 0;
  [v12 fullVolumeScanFromPath:v16 withPathList:v15 error:&v26];
  id v17 = v26;

  v18 = SALog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    sub_10002D618(v18, v19, v20, v21, v22, v23, v24, v25);
  }

  v3[2](v3, v17);
}

- (void)runAppSizer:(id)a3
{
}

- (void)runAppSizerWithScanOptions:(unint64_t)a3 reply:(id)a4
{
  (*((void (**)(id, void))a4 + 2))(a4, 0);
  uint64_t v5 = SALog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10002D780(v5, v6, v7, v8, v9, v10, v11, v12);
  }

  v13 = objc_opt_new();
  uint64_t v22 = 0;
  [v13 runAppSizerWithAsyncBlocksNum:4 withRunMode:2 withActivity:0 withScanOptions:a3 error:&v22];
  v14 = SALog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_10002D708(v14, v15, v16, v17, v18, v19, v20, v21);
  }
}

- (void)addURLSizerHandler:(id)a3 withURLs:(id)a4 reply:(id)a5
{
  uint64_t v7 = (void (**)(id, void *))a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = SALog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10002D82C();
  }

  id v11 = +[SAURLSizerConfiguration newWithReplyController:v9 urls:v8];
  uint64_t v12 = +[SAURlSizersManager addURLSizerConfiguration:v11];
  v7[2](v7, v12);

  v13 = SALog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_10002D7F8();
  }
}

- (void)runURLSizerWithID:(id)a3 reply:(id)a4
{
  uint64_t v5 = (void (**)(id, void))a4;
  id v6 = a3;
  uint64_t v7 = SALog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10002D894();
  }

  id v8 = objc_opt_new();
  id v9 = +[SAURlSizersManager getURLSizerConfiguration:v6];

  [v8 setScanOptions:1];
  uint64_t v10 = [v9 urls];
  [v8 scanURLs:v10 withSizer:v9];

  v5[2](v5, 0);
  id v11 = SALog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_10002D860();
  }
}

+ (BOOL)isSAFSupported
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = [&off_10004FC28 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v2)
  {
    id v4 = v2;
    uint64_t v5 = *(void *)v15;
    char v6 = 1;
    *(void *)&long long v3 = 136315394;
    long long v13 = v3;
    char v7 = 1;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(&off_10004FC28);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (!+[SASupport volumeSupportsAttributionTags:](SASupport, "volumeSupportsAttributionTags:", v9, v13))
        {
          uint64_t v10 = SALog();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v13;
            uint64_t v19 = "+[SAHelper isSAFSupported]";
            __int16 v20 = 2112;
            uint64_t v21 = v9;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Volume (%@) doesn't support tagging", buf, 0x16u);
          }

          char v7 = 0;
        }
        if (!+[SASupport volumeSupportsAttributionTags:v9])
        {
          id v11 = SALog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v13;
            uint64_t v19 = "+[SAHelper isSAFSupported]";
            __int16 v20 = 2112;
            uint64_t v21 = v9;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Volume (%@) doesn't support clone mapping", buf, 0x16u);
          }

          char v6 = 0;
        }
      }
      id v4 = [&off_10004FC28 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v4);
  }
  else
  {
    char v6 = 1;
    char v7 = 1;
  }
  return v6 & v7 & 1;
}

+ (int64_t)runAppSizerWithActivity:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  char v7 = objc_opt_new();
  id v8 = +[SAActivity newWithActivity:v6 andCompletionHandler:v5];

  uint64_t v11 = 0;
  int64_t v9 = 1;
  if ([v7 runAppSizerWithAsyncBlocksNum:4 withRunMode:1 withActivity:v8 withScanOptions:18945 error:&v11] == 2)int64_t v9 = 2; {
  [v8 setActivityResult:v9];
  }

  return v9;
}

- (void)addAppSizerHandler:(id)a3 reply:(id)a4
{
  id v5 = (void (**)(id, id))a4;
  id v6 = +[SACallbackManager addAppSizerHandler:a3];
  v5[2](v5, v6);
}

- (void)removeAppSizerHandler:(id)a3
{
}

- (void)removeURLSizerHandler:(id)a3
{
}

- (void)setAppSizerResultsFilteringOptionsToDefaultWithReply:(id)a3
{
  long long v3 = (void (**)(id, void))a3;
  id v4 = SALog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10002D940(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  +[SAVolumeScanner setAppSizerResultsFilteringToDefault];
  +[SATelemetryManager setAppsFilteringToDefault];
  v3[2](v3, 0);

  uint64_t v12 = SALog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_10002D8C8(v12, v13, v14, v15, v16, v17, v18, v19);
  }
}

- (void)disableAppSizerResultsFilteringWithReply:(id)a3
{
  long long v3 = (void (**)(id, void))a3;
  id v4 = SALog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10002DA30(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  +[SAVolumeScanner disableAppSizerResultsFiltering];
  +[SATelemetryManager disableAppsFiltering];
  v3[2](v3, 0);

  uint64_t v12 = SALog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_10002D9B8(v12, v13, v14, v15, v16, v17, v18, v19);
  }
}

- (BOOL)isValidMountPoint:(id)a3
{
  uint64_t v3 = qword_10005AA20;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_10005AA20, &stru_10004C680);
  }
  unsigned __int8 v5 = [(id)qword_10005AA18 containsObject:v4];

  return v5;
}

- (void)setForceTelemetry:(id)a3
{
  uint64_t v3 = (void (**)(id, void))a3;
  id v4 = SALog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10002DB20(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  +[SAVolumeScanner setForceTelemetry];
  v3[2](v3, 0);

  uint64_t v12 = SALog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_10002DAA8(v12, v13, v14, v15, v16, v17, v18, v19);
  }
}

- (void)registerPaths:(id)a3 reply:(id)a4
{
  id v83 = a3;
  v82 = (void (**)(id, id))a4;
  v87 = objc_opt_new();
  v84 = objc_opt_new();
  uint64_t v5 = SALog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10002DDB0(v5, v6, v7, v8, v9, v10, v11, v12);
  }

  if (v83 && [v83 count])
  {
    id obj = +[SAHelper dynamicRegistrationLock];
    objc_sync_enter(obj);
    +[NSFileManager defaultManager];
    v78 = id v100 = 0;
    unsigned __int8 v13 = [v78 createDirectoryAtPath:@"/var/db/spaceattribution" withIntermediateDirectories:1 attributes:0 error:&v100];
    id v79 = v100;
    if ((v13 & 1) == 0)
    {
      v54 = SALog();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        v55 = [v79 description];
        sub_10002DD34(v55, buf, v54);
      }

      v56 = v79;
      v82[2](v82, v79);
      goto LABEL_59;
    }
    v88 = objc_opt_new();
    if (([v88 loadFromDisk] & 1) == 0)
    {
      uint64_t v14 = SALog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10002DD00();
      }
    }
    uint64_t v16 = objc_opt_new();
    long long v98 = 0u;
    long long v99 = 0u;
    long long v97 = 0u;
    long long v96 = 0u;
    id v17 = v83;
    id v18 = [v17 countByEnumeratingWithState:&v96 objects:v108 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v97;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v97 != v19) {
            objc_enumerationMutation(v17);
          }
          uint64_t v21 = [*(id *)(*((void *)&v96 + 1) + 8 * i) url];
          uint64_t v22 = [v21 path];
          uint64_t v23 = +[NSURL fileURLWithPath:v22 isDirectory:1];

          [v16 addObject:v23];
        }
        id v18 = [v17 countByEnumeratingWithState:&v96 objects:v108 count:16];
      }
      while (v18);
    }

    unsigned int v77 = [v88 checkURLsAreOverlappingWithURLs:v16];
    uint64_t v24 = v88;
    if ((v77 & 1) == 0)
    {
      long long v94 = 0u;
      long long v95 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      id v85 = v17;
      id v25 = [v85 countByEnumeratingWithState:&v92 objects:v107 count:16];
      if (v25)
      {
        uint64_t v26 = *(void *)v93;
        do
        {
          for (j = 0; j != v25; j = (char *)j + 1)
          {
            if (*(void *)v93 != v26) {
              objc_enumerationMutation(v85);
            }
            v28 = *(void **)(*((void *)&v92 + 1) + 8 * (void)j);
            v30 = [v28 bundleID];
            v31 = [[SAAppPath alloc] initWithBundleID:v30];
            v32 = [v28 url];
            v33 = [v32 path];
            v34 = +[NSURL fileURLWithPath:v33 isDirectory:1];

            v35 = [v88 appPathForBundleID:v30];
            LODWORD(v32) = v35 == 0;

            if (v32)
            {
              v36 = SALog();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v30;
                _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "New app in appPathList %@", buf, 0xCu);
              }
            }
            v37 = +[SASupport getURLMountPoint:v34];
            if (v37 && ![(SAHelper *)self isValidMountPoint:v37])
            {
              v38 = SALog();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              {
                uint64_t v40 = [v28 url];
                *(_DWORD *)buf = 136315650;
                *(void *)&uint8_t buf[4] = "-[SAHelper registerPaths:reply:]";
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v40;
                *(_WORD *)&buf[22] = 2112;
                v110 = v37;
                v81 = (void *)v40;
                _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%s: Rejecting URL (%@) - un-allowed mount point (%@).", buf, 0x20u);
              }
              v39 = [v28 url];
              [v84 addObject:v39];
            }
            else
            {
              *(void *)buf = 0;
              *(void *)&buf[8] = buf;
              *(void *)&buf[16] = 0x2020000000;
              LOBYTE(v110) = 0;
              v89[0] = _NSConcreteStackBlock;
              v89[1] = 3221225472;
              v89[2] = sub_100003754;
              v89[3] = &unk_10004C6A8;
              v89[4] = v28;
              id v90 = v87;
              v91 = buf;
              [v88 isPathInfoClaimedByAnotherApp:v28 reply:v89];
              if (!*(unsigned char *)(*(void *)&buf[8] + 24))
              {
                if ([v28 exclusive]) {
                  [(SAAppPath *)v31 addUniqueURL:v34];
                }
                else {
                  [(SAAppPath *)v31 addSharedURL:v34];
                }
                [v88 updateWithAppPath:v31];
              }

              _Block_object_dispose(buf, 8);
            }
          }
          id v25 = [v85 countByEnumeratingWithState:&v92 objects:v107 count:16];
        }
        while (v25);
      }

      uint64_t v24 = v88;
    }
    if ([v84 count])
    {
      id v41 = objc_alloc((Class)NSError);
      NSErrorUserInfoKey v105 = NSLocalizedFailureReasonErrorKey;
      v42 = +[NSString stringWithFormat:@"The following URLs are mounted on un-allowed mount points:\n%@\nAllowed mount points: %@", v84, &off_10004FC58];
      v106 = v42;
      v43 = +[NSDictionary dictionaryWithObjects:&v106 forKeys:&v105 count:1];
      id v44 = [v41 initWithDomain:NSPOSIXErrorDomain code:22 userInfo:v43];
    }
    else if ([v87 count])
    {
      id v57 = objc_alloc((Class)NSError);
      NSErrorUserInfoKey v103 = NSLocalizedFailureReasonErrorKey;
      v42 = +[NSString stringWithFormat:@"The following paths were already registered as unique for other apps OR supplied twice on the same request:\n %@", v87];
      v104 = v42;
      v43 = +[NSDictionary dictionaryWithObjects:&v104 forKeys:&v103 count:1];
      id v44 = [v57 initWithDomain:NSPOSIXErrorDomain code:17 userInfo:v43];
    }
    else
    {
      if (!v77)
      {
        v56 = v79;
        if (v79) {
          goto LABEL_55;
        }
LABEL_54:
        if (([v24 saveToDisk] & 1) == 0)
        {
          v68 = SALog();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
            sub_10002DC88(v68, v69, v70, v71, v72, v73, v74, v75);
          }

          v76 = +[NSError errorWithDomain:NSCocoaErrorDomain code:513 userInfo:0];
          v82[2](v82, v76);

          v67 = v88;
          goto LABEL_58;
        }
LABEL_55:
        v59 = SALog();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG)) {
          sub_10002DC10(v59, v60, v61, v62, v63, v64, v65, v66);
        }

        v82[2](v82, v56);
        v67 = v88;
LABEL_58:

LABEL_59:
        v53 = obj;
        objc_sync_exit(obj);
        goto LABEL_60;
      }
      id v58 = objc_alloc((Class)NSError);
      NSErrorUserInfoKey v101 = NSLocalizedFailureReasonErrorKey;
      v42 = +[NSString stringWithFormat:@"The provided paths contain overlapping paths or they overlap with existing paths."];
      v102 = v42;
      v43 = +[NSDictionary dictionaryWithObjects:&v102 forKeys:&v101 count:1];
      id v44 = [v58 initWithDomain:NSPOSIXErrorDomain code:17 userInfo:v43];
    }
    v56 = v44;

    uint64_t v24 = v88;
    if (v56) {
      goto LABEL_55;
    }
    goto LABEL_54;
  }
  v45 = SALog();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
    sub_10002DB98(v45, v46, v47, v48, v49, v50, v51, v52);
  }

  v53 = +[NSError errorWithDomain:NSCocoaErrorDomain code:1024 userInfo:0];
  v82[2](v82, v53);
LABEL_60:
}

- (void)runAppSizerWithHandler:(id)a3 options:(unint64_t)a4 reply:(id)a5
{
  uint64_t v8 = (void (**)(id, id))a5;
  id v9 = a3;
  uint64_t v10 = objc_opt_new();
  [(SAHelper *)self addAppSizerHandler:v9 reply:&stru_10004C6E8];

  id v12 = 0;
  [v10 runAppSizerWithAsyncBlocksNum:4 withRunMode:2 withActivity:0 withScanOptions:a4 error:&v12];
  id v11 = v12;
  v8[2](v8, v11);
}

- (void)unregisterPaths:(id)a3 reply:(id)a4
{
  id v49 = a3;
  uint64_t v50 = (void (**)(id, id))a4;
  uint64_t v5 = SALog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10002E010(v5, v6, v7, v8, v9, v10, v11, v12);
  }

  id obj = +[SAHelper dynamicRegistrationLock];
  objc_sync_enter(obj);
  uint64_t v52 = objc_opt_new();
  if (([v52 loadFromDisk] & 1) == 0)
  {
    v31 = SALog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_10002DF98(v31, v32, v33, v34, v35, v36, v37, v38);
    }

    +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 260, 0, v49);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    v50[2](v50, v13);
    goto LABEL_25;
  }
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v13 = v49;
  id v14 = [v13 countByEnumeratingWithState:&v53 objects:v57 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v54;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v54 != v15) {
          objc_enumerationMutation(v13);
        }
        id v17 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        id v18 = objc_msgSend(v17, "bundleID", v49);
        uint64_t v19 = [v52 appPathForBundleID:v18];
        if (!v19)
        {
          v39 = SALog();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
            sub_10002DF18();
          }

          uint64_t v40 = +[NSError errorWithDomain:NSCocoaErrorDomain code:1024 userInfo:0];
          v50[2](v50, v40);

          goto LABEL_25;
        }
        __int16 v20 = [v17 url];
        uint64_t v21 = [v20 path];
        uint64_t v22 = +[NSURL fileURLWithPath:v21 isDirectory:1];

        [v19 removeUniqueURL:v22];
        [v19 removeSharedURL:v22];
      }
      id v14 = [v13 countByEnumeratingWithState:&v53 objects:v57 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  [v52 clearAppsWithZeroPath];
  if (([v52 saveToDisk] & 1) == 0)
  {
    id v41 = SALog();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      sub_10002DEA0(v41, v42, v43, v44, v45, v46, v47, v48);
    }

    id v13 = +[NSError errorWithDomain:NSCocoaErrorDomain code:513 userInfo:0];
    v50[2](v50, v13);
LABEL_25:

    goto LABEL_26;
  }
  uint64_t v23 = SALog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    sub_10002DE28(v23, v24, v25, v26, v27, v28, v29, v30);
  }

  v50[2](v50, 0);
LABEL_26:

  objc_sync_exit(obj);
}

- (void)getAppPaths:(id)a3 options:(int)a4 reply:(id)a5
{
  id v7 = a3;
  uint64_t v8 = (void (**)(id, void *, void *))a5;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  uint64_t v38 = sub_100004108;
  v39 = sub_100004118;
  id v40 = 0;
  if (a4 == 1)
  {
    id v17 = (id)objc_opt_new();
    id v23 = [v17 defaultList];
    uint64_t v22 = objc_opt_new();
    [v22 updateWithAppPathList:v17];
    uint64_t v9 = [v22 generateDictionary];
    id v10 = 0;
  }
  else
  {
    uint64_t v9 = 0;
    id v10 = 0;
    if (a4)
    {
LABEL_15:
      uint64_t v24 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 2, 0, (void)v25);

      uint64_t v9 = 0;
      goto LABEL_16;
    }
    uint64_t v11 = objc_opt_new();
    uint64_t v12 = objc_opt_new();
    id v13 = (void *)v36[5];
    v36[5] = v12;

    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100004120;
    v32[3] = &unk_10004C710;
    uint64_t v34 = &v35;
    id v14 = v11;
    id v33 = v14;
    +[SAQuery installedAppsAtVolume:0 sortForUrgency:4 options:1 block:v32];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100004354;
    v29[3] = &unk_10004C738;
    v31 = &v35;
    id v15 = v14;
    id v30 = v15;
    +[SAQuery installedAppGroupsAtVolume:v29];
    uint64_t v16 = objc_opt_new();
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v17 = v15;
    id v18 = [v17 countByEnumeratingWithState:&v25 objects:v41 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v26;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v26 != v19) {
            objc_enumerationMutation(v17);
          }
          uint64_t v21 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "getDictionary", (void)v25);
          [v16 addObject:v21];
        }
        id v18 = [v17 countByEnumeratingWithState:&v25 objects:v41 count:16];
      }
      while (v18);
    }

    id v10 = v16;
    uint64_t v22 = v33;
    uint64_t v9 = v10;
  }

  if (!v9 || ![v9 count]) {
    goto LABEL_15;
  }
  uint64_t v24 = 0;
LABEL_16:
  v8[2](v8, v9, v24);
  _Block_object_dispose(&v35, 8);
}

- (void)getPurgeableInfo:(id)a3 options:(unint64_t)a4 reply:(id)a5
{
  char v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void (**)(id, void *, void *))a5;
  uint64_t v9 = +[SAQuery getFSPurgeableInfo:v7 options:(2 * v6) & 4];
  if (v9)
  {
    id v10 = 0;
  }
  else
  {
    uint64_t v11 = SALog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10002E088();
    }

    id v10 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:2 userInfo:0];
  }
  v8[2](v8, v9, v10);
}

+ (unint64_t)getOVPFileAndVolumeSize
{
  uint64_t v24 = 0;
  CFArrayRef theArray = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  int v2 = APFSOverProvModel();
  uint64_t v3 = SALog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    long long v27 = "+[SAHelper getOVPFileAndVolumeSize]";
    __int16 v28 = 1024;
    LODWORD(v29) = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: overprovisioning model %d", buf, 0x12u);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100004BAC;
  v18[3] = &unk_10004C760;
  v18[4] = &v20;
  BOOL v19 = v2 == 1;
  +[SAUtilities getFileSize:@"/private/var/.overprovisioning_file" reply:v18];
  id v4 = SALog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    long long v27 = "+[SAHelper getOVPFileAndVolumeSize]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Try to get OVP volume reserved size", buf, 0xCu);
  }

  if (APFSContainerGetBootDevice())
  {
    uint64_t v5 = SALog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10002E22C();
    }
    char v6 = 0;
    id v7 = 0;
    CFArrayRef v8 = 0;
    id v9 = 0;
    goto LABEL_27;
  }
  id v9 = 0;
  [v9 UTF8String];
  int v10 = APFSVolumeRoleFind();
  if (v2 != 2 || !theArray)
  {
    uint64_t v5 = SALog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "No OVP volume found", buf, 2u);
    }
    goto LABEL_26;
  }
  if (v10)
  {
    if (v10 != 49245)
    {
      uint64_t v5 = SALog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_10002E0BC();
      }
LABEL_26:
      char v6 = 0;
      id v7 = 0;
      CFArrayRef v8 = 0;
      goto LABEL_27;
    }
LABEL_24:
    uint64_t v5 = SALog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10002E124();
    }
    goto LABEL_26;
  }
  if (!CFArrayGetCount(theArray)) {
    goto LABEL_24;
  }
  CFArrayRef v8 = theArray;
  id v7 = [(__CFArray *)theArray objectAtIndexedSubscript:0];
  [v7 UTF8String];
  if (APFSExtendedSpaceInfo() || (uint64_t v5 = v24) == 0)
  {
    uint64_t v5 = SALog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10002E1C4();
    }
    char v6 = 0;
  }
  else
  {
    uint64_t v11 = [v24 objectForKey:@"fs_reserve"];
    char v6 = v11;
    if (v11)
    {
      id v12 = [v11 unsignedLongLongValue];
      id v13 = SALog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        long long v27 = "+[SAHelper getOVPFileAndVolumeSize]";
        __int16 v28 = 2048;
        id v29 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: OVP volume reserved size %llu", buf, 0x16u);
      }

      v21[3] += (uint64_t)v12;
    }
    else
    {
      uint64_t v16 = SALog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v17 = objc_opt_class();
        sub_10002E158(v17, (uint64_t)buf, v16);
      }
    }
  }
LABEL_27:

  unint64_t v14 = v21[3];
  _Block_object_dispose(&v20, 8);

  return v14;
}

- (void)computeSizeOfSystemVolume:(id)a3
{
  BOOL v19 = (void (**)(id, void *, void))a3;
  uint64_t v3 = SALog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10002E3BC(v3, v4, v5, v6, v7, v8, v9, v10);
  }

  uint64_t v33 = 0;
  v34[0] = &v33;
  v34[1] = 0x2020000000;
  v34[2] = 0;
  uint64_t v31 = 0;
  v32[0] = &v31;
  v32[1] = 0x2020000000;
  v32[2] = 0;
  uint64_t v25 = 0;
  long long v26 = &v25;
  uint64_t v27 = 0x3032000000;
  __int16 v28 = sub_100004108;
  id v29 = sub_100004118;
  id v30 = 0;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = [&off_10004FC70 countByEnumeratingWithState:&v21 objects:v35 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v22;
LABEL_5:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v22 != v12) {
        objc_enumerationMutation(&off_10004FC70);
      }
      id v14 = *(id *)(*((void *)&v21 + 1) + 8 * v13);
      id v15 = [v14 UTF8String];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100005018;
      v20[3] = &unk_10004C788;
      v20[4] = v14;
      v20[5] = &v33;
      v20[6] = &v31;
      v20[7] = &v25;
      +[SASupport getVolSizeFromAttrList:v15 completionHandler:v20];
      if (v26[5]) {
        break;
      }
      if (v11 == (id)++v13)
      {
        id v11 = [&off_10004FC70 countByEnumeratingWithState:&v21 objects:v35 count:16];
        if (v11) {
          goto LABEL_5;
        }
        break;
      }
    }
  }
  unint64_t v16 = +[SAHelper getOVPFileAndVolumeSize];
  *(void *)(v34[0] + 24) += v16;
  id v17 = SALog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_10002E314((uint64_t)v34, (uint64_t)v32, v17);
  }

  id v18 = objc_opt_new();
  [v18 setUsed:*(void *)(v34[0] + 24)];
  [v18 setCapacity:*(void *)(v32[0] + 24)];
  v19[2](v19, v18, v26[5]);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v33, 8);
}

- (void)computeSizeOfVolumeAtURL:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  int v6 = a4;
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void, void *))a5;
  id v10 = v8;
  if (!strcmp((const char *)[v10 fileSystemRepresentation], "/"))
  {
    [(SAHelper *)self computeSizeOfSystemVolume:v9];
  }
  else
  {
    id v11 = SALog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_10002E548(v10, v11);
    }

    bzero(&v44, 0x878uLL);
    id v12 = v10;
    if (statfs((const char *)[v12 fileSystemRepresentation], &v44))
    {
      uint64_t v13 = *__error();
      id v14 = SALog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10002E4A4(v12, v13, v14);
      }

      id v15 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v13 userInfo:0];
      v9[2](v9, 0, v15);
    }
    else
    {
      uint64_t v32 = 0;
      uint64_t v33 = &v32;
      uint64_t v34 = 0x2020000000;
      uint64_t v35 = 0;
      uint64_t v28 = 0;
      id v29 = &v28;
      uint64_t v30 = 0x2020000000;
      uint64_t v31 = 0;
      uint64_t v22 = 0;
      long long v23 = &v22;
      uint64_t v24 = 0x3032000000;
      uint64_t v25 = sub_100004108;
      long long v26 = sub_100004118;
      id v27 = 0;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100005564;
      v21[3] = &unk_10004C7B0;
      v21[4] = &v32;
      v21[5] = &v28;
      v21[6] = &v22;
      +[SASupport getVolSizeFromAttrList:v44.f_mntonname completionHandler:v21];
      if (v23[5])
      {
        ((void (*)(void (**)(id, void, void *), void))v9[2])(v9, 0);
      }
      else
      {
        unint64_t v16 = SALog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v19 = v33[3];
          uint64_t v20 = v29[3];
          *(_DWORD *)buf = 136315906;
          uint64_t v37 = "-[SAHelper computeSizeOfVolumeAtURL:options:completionHandler:]";
          __int16 v38 = 1024;
          int v39 = v6;
          __int16 v40 = 2048;
          uint64_t v41 = v19;
          __int16 v42 = 2048;
          uint64_t v43 = v20;
          _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s:with options = %u, attrListUsed  = %llu, capacity = %llu", buf, 0x26u);
        }

        id v17 = objc_opt_new();
        [v17 setUsed:v33[3]];
        [v17 setRawUsed:v33[3]];
        [v17 setCapacity:v29[3]];
        id v18 = +[NSString stringWithUTF8String:v44.f_mntonname];
        [v17 setMountedOn:v18];

        ((void (**)(id, void *, void *))v9)[2](v9, v17, 0);
      }
      _Block_object_dispose(&v22, 8);

      _Block_object_dispose(&v28, 8);
      _Block_object_dispose(&v32, 8);
    }
  }
}

- (void)setForceTTR:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  uint64_t v5 = (void (**)(id, void))a4;
  int v6 = SALog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10002E664();
  }

  +[SATapToRadar setForceTTR:v4];
  v5[2](v5, 0);

  uint64_t v7 = SALog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10002E5EC(v7, v8, v9, v10, v11, v12, v13, v14);
  }
}

- (void)setEnableTTR:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  uint64_t v5 = (void (**)(id, void))a4;
  int v6 = SALog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10002E760();
  }

  +[SATapToRadar setEnableTTR:v4];
  v5[2](v5, 0);

  uint64_t v7 = SALog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10002E6E8(v7, v8, v9, v10, v11, v12, v13, v14);
  }
}

- (void)setAppSizerMaxRerunTimeout:(unsigned int)a3 reply:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v5 = (void (**)(id, void))a4;
  int v6 = SALog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10002E7E4();
  }

  uint64_t v7 = objc_opt_new();
  [v7 setAppSizerMaxRerunTimeout:v4];

  v5[2](v5, 0);
}

- (void)getLastTelemetryData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = SALog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10002E858(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  +[SATelemetryManager getLastTelemetryData:v3];
}

- (void)importFromPlist:(id)a3 reply:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (void (**)(id, void *))a4;
  uint64_t v7 = SALog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10002E8D0();
  }

  uint64_t v8 = objc_opt_new();
  [v8 loadFromDisk];
  uint64_t v9 = [v8 importFromPlists:v5];
  [v8 saveToDisk];
  v6[2](v6, v9);
}

- (void)clearLastTelemetryData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = SALog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10002E950(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  +[SATelemetryManager clearLastTelemetryData:v3];
}

@end