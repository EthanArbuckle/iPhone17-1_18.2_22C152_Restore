@interface IWXPCPackageConverter
- (id)convertWithConverter:(id)a3 toSFFAtURL:(id)a4 queue:(id)a5 completion:(id)a6;
- (id)entriesToRemove;
- (id)prepareFileForUploadingAtURL:(id)a3 originalURLExtension:(id)a4 inDirectory:(id)a5 destinationSandboxExtension:(id)a6 completionHandler:(id)a7;
- (void)consumeSandboxInputURLExtension:(id)a3 outputURLExtension:(id)a4 inputSandBoxToken:(int64_t *)a5 outputSandBoxToken:(int64_t *)a6;
- (void)convertIWorkPackageAtURL:(id)a3 toSFFAtURL:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)releaseInputSandboxExtensionToken:(int64_t)a3 outputSandBoxToken:(int64_t)a4;
@end

@implementation IWXPCPackageConverter

- (id)entriesToRemove
{
  return +[TSPPackageConverter regularRexpressionsForCachedCollaborationData];
}

- (id)convertWithConverter:(id)a3 toSFFAtURL:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = +[NSProgress progressWithTotalUnitCount:1];
  v15 = dispatch_get_global_queue(0, 0);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10015DE28;
  v24[3] = &unk_1001D3560;
  id v25 = v10;
  id v16 = v14;
  id v26 = v16;
  id v27 = v11;
  id v29 = v12;
  id v30 = v13;
  v28 = self;
  id v17 = v12;
  id v18 = v13;
  id v19 = v11;
  id v20 = v10;
  dispatch_async(v15, v24);

  v21 = v29;
  id v22 = v16;

  return v22;
}

- (void)convertIWorkPackageAtURL:(id)a3 toSFFAtURL:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10015E0A4;
  block[3] = &unk_1001D3588;
  id v20 = v10;
  v21 = self;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

- (void)consumeSandboxInputURLExtension:(id)a3 outputURLExtension:(id)a4 inputSandBoxToken:(int64_t *)a5 outputSandBoxToken:(int64_t *)a6
{
  id v9 = a3;
  id v10 = a4;
  if ([v9 length])
  {
    [v9 bytes];
    int64_t v11 = sandbox_extension_consume();
    if (v11 < 0)
    {
      if (TSUDefaultCat_init_token != -1) {
        dispatch_once(&TSUDefaultCat_init_token, &stru_1001D35A8);
      }
      id v12 = TSUDefaultCat_log_t;
      if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR)) {
        sub_10015EFA8(v12);
      }
    }
    *a5 = v11;
  }
  if ([v10 length])
  {
    [v10 bytes];
    int64_t v13 = sandbox_extension_consume();
    if (v13 < 0)
    {
      if (TSUDefaultCat_init_token != -1) {
        dispatch_once(&TSUDefaultCat_init_token, &stru_1001D35C8);
      }
      v14 = TSUDefaultCat_log_t;
      if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR)) {
        sub_10015EF08(v14);
      }
    }
    *a6 = v13;
  }
}

- (void)releaseInputSandboxExtensionToken:(int64_t)a3 outputSandBoxToken:(int64_t)a4
{
  if ((a3 & 0x8000000000000000) == 0) {
    sandbox_extension_release();
  }
  if ((a4 & 0x8000000000000000) == 0)
  {
    sandbox_extension_release();
  }
}

- (id)prepareFileForUploadingAtURL:(id)a3 originalURLExtension:(id)a4 inDirectory:(id)a5 destinationSandboxExtension:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  int64_t v13 = (void (**)(id, void, void *))a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = +[NSProgress progressWithTotalUnitCount:1];
  uint64_t v56 = 0;
  uint64_t v57 = 0;
  [(IWXPCPackageConverter *)self consumeSandboxInputURLExtension:v16 outputURLExtension:v14 inputSandBoxToken:&v57 outputSandBoxToken:&v56];

  id v18 = [v12 lastPathComponent];
  v45 = [v15 URLByAppendingPathComponent:v18];

  char v55 = 0;
  id v19 = +[NSFileManager defaultManager];
  id v20 = [v12 path];
  LODWORD(v14) = [v19 fileExistsAtPath:v20 isDirectory:&v55];

  v21 = &scc_info_Enum_google_2fprotobuf_2ftype_2eproto[2];
  if (!v14)
  {
    id v26 = +[NSError errorWithDomain:NSURLErrorDomain code:-1100 userInfo:0];
    if (IWXPCPackageConverterCat_init_token != -1) {
      dispatch_once(&IWXPCPackageConverterCat_init_token, &stru_1001D3628);
    }
    id v27 = v17;
    v28 = IWXPCPackageConverterCat_log_t;
    if (os_log_type_enabled((os_log_t)IWXPCPackageConverterCat_log_t, OS_LOG_TYPE_ERROR))
    {
      sub_10015F23C((uint64_t)v12, v28);
      if (!v13) {
        goto LABEL_18;
      }
    }
    else if (!v13)
    {
LABEL_18:

      id v24 = 0;
      id v22 = 0;
      goto LABEL_52;
    }
    v13[2](v13, 0, v26);
    goto LABEL_18;
  }
  if (IWXPCPackageConverterCat_init_token != -1) {
    dispatch_once(&IWXPCPackageConverterCat_init_token, &stru_1001D35E8);
  }
  if (os_log_type_enabled((os_log_t)IWXPCPackageConverterCat_log_t, OS_LOG_TYPE_DEBUG)) {
    sub_10015F1D4();
  }
  id v54 = 0;
  id v22 = +[TSPPackageConverter newPackageConverterWithURL:v12 error:&v54];
  id v23 = v54;
  id v24 = v23;
  if (v22 || !v23)
  {
    if (v22)
    {
      if ([v22 isValid] && objc_msgSend(v22, "packageType") == (id)2)
      {
        id v29 = [(IWXPCPackageConverter *)self entriesToRemove];
        unsigned __int8 v30 = [v22 hasEntriesMatchingFilter:v29];

        v21 = scc_info_Enum_google_2fprotobuf_2ftype_2eproto + 8;
      }
      else
      {
        unsigned __int8 v30 = 0;
      }
      if (v55 || (v30 & 1) != 0)
      {
        if ([v22 isValid])
        {
          v38 = dispatch_get_global_queue(0, 0);
          v48[0] = _NSConcreteStackBlock;
          v48[1] = 3221225472;
          v48[2] = sub_10015ECA4;
          v48[3] = &unk_1001D36F0;
          v48[4] = self;
          uint64_t v51 = v57;
          uint64_t v52 = v56;
          id v49 = v45;
          v50 = v13;
          id v27 = [(IWXPCPackageConverter *)self convertWithConverter:v22 toSFFAtURL:v49 queue:v38 completion:v48];

          v32 = v49;
          goto LABEL_50;
        }
        goto LABEL_24;
      }
LABEL_30:
      [v17 becomeCurrentWithPendingUnitCount:1];
      if (IWXPCPackageConverterCat_init_token != -1) {
        dispatch_once(&IWXPCPackageConverterCat_init_token, &stru_1001D3648);
      }
      if (os_log_type_enabled(*((os_log_t *)v21 + 94), OS_LOG_TYPE_DEBUG)) {
        sub_10015F0B0();
      }
      v33 = +[NSFileManager defaultManager];
      id v53 = 0;
      unsigned int v34 = [v33 copyItemAtURL:v12 toURL:v45 error:&v53];
      id v35 = v53;

      if (v34)
      {
        if (IWXPCPackageConverterCat_init_token != -1) {
          dispatch_once(&IWXPCPackageConverterCat_init_token, &stru_1001D3668);
        }
        id v27 = v17;
        v36 = v45;
        if (os_log_type_enabled((os_log_t)IWXPCPackageConverterCat_log_t, OS_LOG_TYPE_DEBUG))
        {
          v36 = v45;
          sub_10015F048();
        }
      }
      else
      {
        if (TSUDefaultCat_init_token != -1) {
          dispatch_once(&TSUDefaultCat_init_token, &stru_1001D3688);
        }
        id v27 = v17;
        v37 = TSUDefaultCat_log_t;
        if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR))
        {
          log = v37;
          v40 = (objc_class *)objc_opt_class();
          v41 = NSStringFromClass(v40);
          v42 = [v35 domain];
          id v43 = [v35 code];
          *(_DWORD *)buf = 138413570;
          id v59 = v12;
          __int16 v60 = 2112;
          v61 = v45;
          __int16 v62 = 2114;
          v63 = v41;
          __int16 v64 = 2114;
          v65 = v42;
          __int16 v66 = 2048;
          id v67 = v43;
          __int16 v68 = 2112;
          id v69 = v35;
          _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error copying from \"%@\" to \"%@\". Error: errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", buf, 0x3Eu);
        }
        v36 = 0;
      }
      [v27 resignCurrent];
      [(IWXPCPackageConverter *)self releaseInputSandboxExtensionToken:v57 outputSandBoxToken:v56];
      if (v13) {
        ((void (**)(id, void *, void *))v13)[2](v13, v36, 0);
      }

      goto LABEL_52;
    }
  }
  else
  {
    if (IWXPCPackageConverterCat_init_token != -1) {
      dispatch_once(&IWXPCPackageConverterCat_init_token, &stru_1001D3608);
    }
    id v25 = IWXPCPackageConverterCat_log_t;
    if (os_log_type_enabled((os_log_t)IWXPCPackageConverterCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10015F118(v25, v24);
    }
    id v22 = 0;
  }
  if (!v55) {
    goto LABEL_30;
  }
LABEL_24:
  [(IWXPCPackageConverter *)self releaseInputSandboxExtensionToken:v57 outputSandBoxToken:v56];
  if (!v13)
  {
    id v27 = v17;
    goto LABEL_52;
  }
  v31 = dispatch_get_global_queue(0, 0);

  id v27 = v17;
  if (v31)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10015EE24;
    block[3] = &unk_1001C6900;
    v47 = v13;
    dispatch_async(v31, block);

    v32 = v47;
LABEL_50:

    goto LABEL_52;
  }
  v13[2](v13, 0, 0);
LABEL_52:

  return v27;
}

@end