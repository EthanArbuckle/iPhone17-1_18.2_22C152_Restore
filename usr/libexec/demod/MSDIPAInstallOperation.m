@interface MSDIPAInstallOperation
- (BOOL)_IXInstallAppIPA;
- (BOOL)_fulfillIXSZTransferPromise:(id)a3 withFile:(id)a4 outError:(id *)a5;
- (BOOL)_verifyInstalledApp;
- (BOOL)rollback;
- (BOOL)runInstallInParallel;
- (MSDContentCacheManagerProtocol)contentCacheProtocol;
- (MSDIPAInstallOperation)initWithContext:(id)a3;
- (MSDIPAInstallOperation)initWithContext:(id)a3 andContentCacheManager:(id)a4;
- (NSError)installError;
- (OS_dispatch_semaphore)semaphore;
- (id)methodSelectors;
- (int64_t)type;
- (void)_createFullIPAInstallOperationsAsFallback;
- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5;
- (void)coordinatorDidCompleteSuccessfully:(id)a3;
- (void)setContentCacheProtocol:(id)a3;
- (void)setInstallError:(id)a3;
- (void)setSemaphore:(id)a3;
@end

@implementation MSDIPAInstallOperation

- (MSDIPAInstallOperation)initWithContext:(id)a3
{
  id v4 = a3;
  v5 = +[MSDContentCacheManager sharedInstance];
  v6 = [(MSDIPAInstallOperation *)self initWithContext:v4 andContentCacheManager:v5];

  return v6;
}

- (MSDIPAInstallOperation)initWithContext:(id)a3 andContentCacheManager:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MSDIPAInstallOperation;
  v7 = [(MSDOperation *)&v11 initWithContext:a3];
  v8 = v7;
  if (v7)
  {
    [(MSDIPAInstallOperation *)v7 setContentCacheProtocol:v6];
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    [(MSDIPAInstallOperation *)v8 setSemaphore:v9];

    [(MSDIPAInstallOperation *)v8 setInstallError:0];
  }

  return v8;
}

- (id)methodSelectors
{
  v2 = +[NSValue valueWithPointer:"_IXInstallAppIPA"];
  v3 = +[NSValue valueWithPointer:"_verifyInstalledApp"];
  id v4 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v2, v3, 0);

  return v4;
}

- (BOOL)rollback
{
  v3 = [(MSDOperation *)self context];
  id v4 = +[MSDOperationRepository createOperationFromIdentifier:@"MSDIPAUninstallOperation" withContext:v3];

  [(MSDOperation *)self produceNewDependentOperation:v4 forRollback:1];
  return 1;
}

- (int64_t)type
{
  return 3;
}

- (BOOL)runInstallInParallel
{
  return 1;
}

- (BOOL)_IXInstallAppIPA
{
  v80 = +[NSFileManager defaultManager];
  v3 = [(MSDOperation *)self context];
  id v4 = [v3 stagingRootPath];

  v5 = [(MSDOperation *)self context];
  id v6 = [v5 identifier];

  v7 = [(MSDOperation *)self context];
  uint64_t v8 = [v7 uniqueIdentifier];

  dispatch_semaphore_t v9 = [(MSDOperation *)self context];
  uint64_t v10 = [v9 currentUniqueIdentifier];

  objc_super v11 = [(MSDOperation *)self context];
  unsigned int v12 = [v11 alreadyInstalled];

  v13 = [(MSDOperation *)self context];
  unsigned int v14 = [v13 useDiffPatch];

  v15 = sub_100068600();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v96 = v6;
    __int16 v97 = 2114;
    *(void *)v98 = v8;
    *(_WORD *)&v98[8] = 2114;
    uint64_t v99 = v10;
    __int16 v100 = 1026;
    unsigned int v101 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Installing IPA for app: %{public}@ <UID %{public}@, CurrentUID: %{public}@, DiffPatch: %{public, BOOL}d>", buf, 0x26u);
  }

  v16 = +[MSDAppHelper sharedInstance];
  uint64_t v17 = [v16 acquireAppTerminationAssertionForApp:v6];

  if (v14)
  {
    v18 = [(MSDIPAInstallOperation *)self contentCacheProtocol];
    [v18 appDiffPatchFileForSourceAppUID:v10 targetAppUID:v8];
  }
  else
  {
    v18 = [(MSDOperation *)self context];
    [v18 fileHash];
  v81 = };

  v19 = [v6 stringByAppendingPathExtension:@"ipa"];
  v82 = [v4 stringByAppendingPathComponent:v19];

  v20 = sub_100068600();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v96 = v81;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "IPA/Patch file hash to use: %{public}@", buf, 0xCu);
  }

  v77 = v4;
  v78 = (void *)v10;
  v79 = (void *)v8;
  v76 = (void *)v17;
  if (v12)
  {
    id v94 = 0;
    v21 = +[IXUpdatingAppInstallCoordinator coordinatorForAppWithBundleID:v6 withClientID:9 createIfNotExisting:1 created:0 error:&v94];
    id v22 = v94;
    if (!v21)
    {
      v23 = sub_100068600();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_1000D3CBC(v22);
      }
LABEL_83:

      BOOL v44 = 0;
      id v40 = 0;
      id v74 = 0;
      id v29 = 0;
      v21 = 0;
      goto LABEL_33;
    }
  }
  else
  {
    id v93 = 0;
    v21 = +[IXInitiatingAppInstallCoordinator coordinatorForAppWithBundleID:v6 withClientID:9 createIfNotExisting:1 created:0 error:&v93];
    id v22 = v93;
    if (!v21)
    {
      v23 = sub_100068600();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_1000D3D40(v22);
      }
      goto LABEL_83;
    }
  }
  v24 = v22;
  [v21 setObserver:self];
  id v92 = v22;
  unsigned __int8 v25 = [v21 setImportance:3 error:&v92];
  id v22 = v92;

  if ((v25 & 1) == 0)
  {
    v62 = sub_100068600();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      v63 = [v22 localizedDescription];
      *(_DWORD *)buf = 138543362;
      v96 = v63;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "Could not set coordinator importance with error - %{public}@", buf, 0xCu);
    }
    BOOL v44 = 0;
    id v40 = 0;
    id v74 = 0;
    id v29 = 0;
    goto LABEL_33;
  }
  v26 = +[NSArray array];
  id v91 = v22;
  unsigned __int8 v27 = [v21 setInitialODRAssetPromises:v26 error:&v91];
  id v28 = v91;

  if ((v27 & 1) == 0)
  {
    v64 = sub_100068600();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      v65 = [v28 localizedDescription];
      *(_DWORD *)buf = 138543362;
      v96 = v65;
      _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "Could not setInitialODRAssetPromises with error - %{public}@", buf, 0xCu);
    }
    BOOL v44 = 0;
    id v40 = 0;
    id v74 = 0;
    id v29 = 0;
    goto LABEL_80;
  }
  if (v14)
  {
    id v29 = [objc_alloc((Class)IXPromisedStreamingZipTransfer) initWithName:@"IPAPromise" client:9 streamingZipOptions:&__NSDictionary0__struct archiveSize:0 diskSpaceNeeded:0];
  }
  else
  {
    id v30 = objc_alloc((Class)IXPromisedTransferToPath);
    v31 = +[NSURL fileURLWithString:v82];
    id v29 = [v30 initWithName:@"IPAPromise" client:9 transferPath:v31 diskSpaceNeeded:0];
  }
  id v32 = [objc_alloc((Class)IXPlaceholder) initAppPlaceholderWithBundleName:@"TempApp" bundleID:v6 installType:1 client:9];
  id v90 = v28;
  unsigned __int8 v33 = [v21 setPlaceholderPromise:v32 error:&v90];
  id v22 = v90;

  id v74 = v32;
  if ((v33 & 1) == 0)
  {
    v66 = sub_100068600();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      v67 = [v22 localizedDescription:v74];
      *(_DWORD *)buf = 138543362;
      v96 = v67;
      v68 = "Could not set place holder promise with error - %{public}@";
LABEL_71:
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, v68, buf, 0xCu);
    }
LABEL_72:

LABEL_76:
    BOOL v44 = 0;
    id v40 = 0;
    goto LABEL_33;
  }
  id v89 = v22;
  unsigned __int8 v34 = [v21 setAppAssetPromise:v29 error:&v89];
  id v28 = v89;

  if ((v34 & 1) == 0)
  {
    v69 = sub_100068600();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      v70 = [v28 localizedDescription];
      *(_DWORD *)buf = 138543362;
      v96 = v70;
      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "Could not set app asset promise with error - %{public}@", buf, 0xCu);
    }
    BOOL v44 = 0;
    id v40 = 0;
    goto LABEL_80;
  }
  id v88 = v28;
  unsigned __int8 v35 = [v32 setConfigurationCompleteWithError:&v88];
  id v22 = v88;

  if ((v35 & 1) == 0)
  {
    v66 = sub_100068600();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      v67 = [v22 localizedDescription];
      *(_DWORD *)buf = 138543362;
      v96 = v67;
      v68 = "Could not set configuration comlete with error - %{public}@";
      goto LABEL_71;
    }
    goto LABEL_72;
  }
  v36 = [(MSDIPAInstallOperation *)self contentCacheProtocol];
  v37 = [(MSDOperation *)self context];
  unsigned __int8 v38 = [v36 copyFileIfPresentInCache:v81 toLocation:v82 verifyHash:[v37 verifyFileHash]];

  if ((v38 & 1) == 0)
  {
    v71 = sub_100068600();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v96 = v81;
      _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "Could not copy IPA/Patch file from cache: %{public}@", buf, 0xCu);
    }

    goto LABEL_76;
  }
  if (([v6 isEqualToString:@"com.retailtech.arkenstone"] & 1) != 0
    || ([v6 isEqualToString:@"com.apple.ist.windward"] & 1) != 0
    || [v6 isEqualToString:@"com.apple.ist.DemoDiscoveryApp"])
  {
    v39 = +[F13Server sharedInstance];
    [v39 windwardAppInstallationStarted];
  }
  id v40 = objc_alloc_init((Class)MIInstallOptions);
  [v40 setInstallTargetType:1];
  id v87 = v22;
  unsigned __int8 v41 = [v21 setInstallOptions:v40 error:&v87];
  id v28 = v87;

  if ((v41 & 1) == 0)
  {
    v72 = sub_100068600();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      v73 = [v28 localizedDescription];
      *(_DWORD *)buf = 138543362;
      v96 = v73;
      _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "Set install options failed with error - %{public}@", buf, 0xCu);
    }
    BOOL v44 = 0;
LABEL_80:
    id v22 = v28;
    goto LABEL_33;
  }
  if (v14)
  {
    id v86 = v28;
    unsigned __int8 v42 = [(MSDIPAInstallOperation *)self _fulfillIXSZTransferPromise:v29 withFile:v82 outError:&v86];
    id v22 = v86;

    if ((v42 & 1) == 0)
    {
      BOOL v44 = 0;
      goto LABEL_33;
    }
    id v28 = v22;
  }
  else
  {
    [v29 setComplete:1];
  }
  v43 = [(MSDIPAInstallOperation *)self semaphore];
  dispatch_semaphore_wait(v43, 0xFFFFFFFFFFFFFFFFLL);

  id v22 = [(MSDIPAInstallOperation *)self installError];

  BOOL v44 = v22 == 0;
LABEL_33:
  v45 = sub_1000687C8();
  unint64_t v46 = [(MSDOperation *)self signpostId];
  if (v46 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v47 = v46;
    if (os_signpost_enabled(v45))
    {
      *(_DWORD *)buf = 138412802;
      v96 = v6;
      __int16 v97 = 1024;
      *(_DWORD *)v98 = v14;
      *(_WORD *)&v98[4] = 1024;
      *(_DWORD *)&v98[6] = v44;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v45, OS_SIGNPOST_EVENT, v47, "Install IPA", "App identifier: %{xcode:string}@ Use diff patch: %{xcode:BOOLean}d Install Result: %{xcode:BOOLean}d", buf, 0x18u);
    }
  }

  if (v44)
  {
    id v48 = v22;
  }
  else
  {
    id v85 = v22;
    sub_1000C31D4(&v85, 3727740962, @"Cannot install app.");
    id v48 = v85;

    [(MSDOperation *)self setError:v48];
    if (v29)
    {
      v84[0] = _NSConcreteStackBlock;
      v84[1] = 3221225472;
      v84[2] = sub_10007ADD4;
      v84[3] = &unk_100152AF0;
      v84[4] = self;
      [v29 cancelForReason:v48 client:9 completion:v84];
      v49 = [(MSDIPAInstallOperation *)self semaphore];
      dispatch_semaphore_wait(v49, 0xFFFFFFFFFFFFFFFFLL);
    }
    [(MSDIPAInstallOperation *)self _createFullIPAInstallOperationsAsFallback];
  }
  if (objc_msgSend(v80, "fileExistsAtPath:", v82, v74))
  {
    id v83 = v48;
    unsigned __int8 v50 = [v80 removeItemAtPath:v82 error:&v83];
    id v51 = v83;

    if ((v50 & 1) == 0)
    {
      v52 = sub_100068600();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
        sub_1000D3C08((uint64_t)v82, v51, v52);
      }
    }
  }
  else
  {
    id v51 = v48;
  }
  if (v14)
  {
    v53 = [(MSDIPAInstallOperation *)self contentCacheProtocol];
    [v53 removeAppDiffPatchFileForSourceAppUID:v78 targetAppUID:v79];
  }
  v54 = [(MSDOperation *)self context];
  unsigned int v55 = [v54 deleteInstallableFileAfterInstall];

  if (!v55)
  {
    v59 = sub_100068600();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v96 = v81;
      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "Skipping deletion of IPA/Patch file from cache: %{public}@", buf, 0xCu);
    }
    v58 = v76;
    goto LABEL_56;
  }
  v56 = [(MSDIPAInstallOperation *)self contentCacheProtocol];
  unsigned __int8 v57 = [v56 deleteFromCache:v81];

  v58 = v76;
  if ((v57 & 1) == 0)
  {
    v59 = sub_100068600();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
      sub_1000D3BA0();
    }
LABEL_56:
  }
  v60 = +[MSDAppHelper sharedInstance];
  [v60 releaseAppTerminationAssertion:v58 forApp:v6];

  return v44;
}

- (BOOL)_verifyInstalledApp
{
  v3 = [(MSDOperation *)self context];
  id v4 = [v3 identifier];

  v5 = [(MSDOperation *)self context];
  id v6 = [v5 uniqueIdentifier];

  v7 = +[MSDAppHelper sharedInstance];
  uint64_t v8 = [v7 bundlePathForInstalledApp:v4];

  dispatch_semaphore_t v9 = +[MSDiOSApp appWithPath:v8];
  uint64_t v10 = v9;
  if (!v9)
  {
    unsigned int v14 = sub_100068600();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543362;
      v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Cannot create MSDiOSApp from bundle path %{public}@", (uint8_t *)&v15, 0xCu);
    }
    objc_super v11 = 0;
    goto LABEL_10;
  }
  objc_super v11 = [v9 uniqueIdentifier];
  if (([v11 isEqualToString:v6] & 1) == 0)
  {
    unsigned int v14 = sub_100068600();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543618;
      v16 = v11;
      __int16 v17 = 2114;
      v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "The installed app has UID %{public}@ but the expected UID is %{public}@", (uint8_t *)&v15, 0x16u);
    }
LABEL_10:

    [(MSDIPAInstallOperation *)self _createFullIPAInstallOperationsAsFallback];
    BOOL v12 = 0;
    goto LABEL_4;
  }
  BOOL v12 = 1;
LABEL_4:

  return v12;
}

- (BOOL)_fulfillIXSZTransferPromise:(id)a3 withFile:(id)a4 outError:(id *)a5
{
  id v25 = a3;
  id v7 = a4;
  uint64_t v34 = 0;
  unsigned __int8 v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = sub_10007B520;
  unsigned __int8 v38 = sub_10007B530;
  id v39 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  memset(&v29, 0, sizeof(v29));
  uint64_t v8 = sub_100068600();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v41 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sending bytes to IXPromisedStreamingZipTransfer from file: %{public}@", buf, 0xCu);
  }

  id v23 = v7;
  int v9 = open((const char *)[v23 fileSystemRepresentation], 0);
  int v24 = v9;
  if (v9 < 0)
  {
    v20 = sub_100068600();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = __error();
      sub_1000D3E48((uint64_t)v23, v21, buf, v20);
    }

LABEL_18:
    close(v24);
    goto LABEL_19;
  }
  fstat(v9, &v29);
  unint64_t st_size = v29.st_size;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10007B538;
  v28[3] = &unk_100153420;
  v28[4] = self;
  v28[5] = &v34;
  [v25 prepareForExtraction:v28];
  objc_super v11 = [(MSDIPAInstallOperation *)self semaphore];
  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);

  if (!v35[5])
  {
    if (st_size)
    {
      while (!*((unsigned char *)v31 + 24))
      {
        if (st_size >= 0x19000) {
          size_t v12 = 102400;
        }
        else {
          size_t v12 = st_size;
        }
        v13 = malloc_type_malloc(v12, 0xDF1B4414uLL);
        if (!v13)
        {
          unsigned int v14 = sub_100068600();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            sub_1000D3EA4();
          }
          goto LABEL_16;
        }
        if (read(v24, v13, v12) != v12)
        {
          unsigned int v14 = sub_100068600();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            v19 = __error();
            sub_1000D3F50(v19, buf, v14);
          }
          goto LABEL_16;
        }
        unsigned int v14 = +[NSData dataWithBytesNoCopy:v13 length:v12 freeWhenDone:1];
        if (!v14)
        {
          unsigned int v14 = sub_100068600();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            sub_1000D3F0C(v14);
          }
          goto LABEL_16;
        }
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_10007B5CC;
        v27[3] = &unk_100153448;
        v27[5] = &v34;
        v27[6] = &v30;
        v27[4] = self;
        [v25 supplyBytes:v14 withCompletionBlock:v27];
        int v15 = [(MSDIPAInstallOperation *)self semaphore];
        dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);

        if (v35[5]) {
          goto LABEL_16;
        }

        st_size -= v12;
        if (!st_size) {
          break;
        }
      }
    }
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10007B678;
    v26[3] = &unk_100151CE0;
    v26[4] = self;
    v26[5] = &v34;
    [v25 finishStreamWithCompletionBlock:v26];
    unsigned int v14 = [(MSDIPAInstallOperation *)self semaphore];
    dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
LABEL_16:
  }
  if (v24) {
    goto LABEL_18;
  }
LABEL_19:
  if (a5)
  {
    v16 = (void *)v35[5];
    if (v16) {
      *a5 = v16;
    }
  }
  BOOL v17 = *((unsigned char *)v31 + 24) != 0;
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);

  return v17;
}

- (void)_createFullIPAInstallOperationsAsFallback
{
  v3 = [(MSDOperation *)self context];
  id v4 = [v3 identifier];

  v5 = [(MSDOperation *)self dependents];
  id v6 = [v5 copy];

  id v7 = [(MSDOperation *)self context];
  unsigned int v8 = [v7 useDiffPatch];

  if (v8)
  {
    int v9 = sub_100068600();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v25 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Falling back to install full IPA for app: %{public}@", buf, 0xCu);
    }

    uint64_t v10 = [(MSDOperation *)self context];
    id v11 = [v10 copy];

    [v11 setAlreadyInstalled:0];
    [v11 setCurrentUniqueIdentifier:0];
    [v11 setUseDiffPatch:0];
    size_t v12 = +[MSDOperationRepository createOperationFromIdentifier:@"MSDInstallableFileDownloadOperation" withContext:v11];
    v13 = +[MSDOperationRepository createOperationFromIdentifier:@"MSDIPAInstallOperation" withContext:v11];
    [v13 addDependency:v12];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v14 = v6;
    id v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v20;
      do
      {
        v18 = 0;
        do
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v19 + 1) + 8 * (void)v18) addDependency:v13, (void)v19];
          v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        id v16 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v16);
    }

    [(MSDOperation *)self produceNewDependentOperation:v12 forRollback:0];
    [(MSDOperation *)self produceNewDependentOperation:v13 forRollback:0];
    [(MSDOperation *)self setSkipped:1];
  }
}

- (void)coordinatorDidCompleteSuccessfully:(id)a3
{
  id v4 = a3;
  v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 bundleID];
    int v8 = 138543362;
    int v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "App %{public}@ successfully installed.", (uint8_t *)&v8, 0xCu);
  }
  [(MSDIPAInstallOperation *)self setInstallError:0];
  id v7 = [(MSDIPAInstallOperation *)self semaphore];
  dispatch_semaphore_signal(v7);
}

- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  int v9 = sub_100068600();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v7 bundleID];
    id v11 = [v8 localizedDescription];
    int v13 = 138543618;
    id v14 = v10;
    __int16 v15 = 2114;
    id v16 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "App %{public}@ cannot be installed: %{public}@", (uint8_t *)&v13, 0x16u);
  }
  [(MSDIPAInstallOperation *)self setInstallError:v8];
  size_t v12 = [(MSDIPAInstallOperation *)self semaphore];
  dispatch_semaphore_signal(v12);
}

- (MSDContentCacheManagerProtocol)contentCacheProtocol
{
  return self->_contentCacheProtocol;
}

- (void)setContentCacheProtocol:(id)a3
{
}

- (OS_dispatch_semaphore)semaphore
{
  return self->_semaphore;
}

- (void)setSemaphore:(id)a3
{
}

- (NSError)installError
{
  return self->_installError;
}

- (void)setInstallError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installError, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);

  objc_storeStrong((id *)&self->_contentCacheProtocol, 0);
}

@end