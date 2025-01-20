@interface DMDSUManagerInstallTask_iOS
+ (id)_dmfDownloadErrorFromSUDownloadError:(id)a3;
+ (id)_dmfInstallErrorFromSUInstallError:(id)a3;
+ (id)_dmfStatusErrorFromSUStatusError:(id)a3;
+ (id)defaultProductKey;
- (BOOL)removeUpdateWithError:(id *)a3;
- (BOOL)startDownloadWithError:(id *)a3;
- (BOOL)startInstallWithError:(id *)a3;
- (DMDSUManagerInstallTask_iOS)init;
- (SUManagerClient)softwareUpdateServices;
- (id)availableUpdateWithVersion:(id)a3 useDelay:(BOOL)a4 error:(id *)a5;
- (id)currentStatusWithError:(id *)a3;
- (void)setSoftwareUpdateServices:(id)a3;
@end

@implementation DMDSUManagerInstallTask_iOS

+ (id)defaultProductKey
{
  return @"iOSUpdate";
}

+ (id)_dmfDownloadErrorFromSUDownloadError:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 domain];
    unsigned __int8 v6 = [v5 isEqualToString:SUErrorDomain];

    if (v6)
    {
      switch((unint64_t)[v4 code])
      {
        case 1uLL:
        case 7uLL:
        case 8uLL:
        case 9uLL:
        case 0xAuLL:
        case 0x1AuLL:
        case 0x1DuLL:
        case 0x1EuLL:
        case 0x21uLL:
        case 0x22uLL:
        case 0x23uLL:
        case 0x24uLL:
          NSErrorUserInfoKey v22 = NSUnderlyingErrorKey;
          v23 = v4;
          v7 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
          break;
        case 6uLL:
        case 0x2BuLL:
          NSErrorUserInfoKey v20 = NSUnderlyingErrorKey;
          v21 = v4;
          v7 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
          break;
        case 0xBuLL:
          NSErrorUserInfoKey v26 = NSUnderlyingErrorKey;
          v27 = v4;
          v7 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
          break;
        case 0xEuLL:
          NSErrorUserInfoKey v14 = NSUnderlyingErrorKey;
          v15 = v4;
          v7 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
          break;
        case 0xFuLL:
        case 0x18uLL:
          NSErrorUserInfoKey v18 = NSUnderlyingErrorKey;
          v19 = v4;
          v7 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
          break;
        case 0x14uLL:
          NSErrorUserInfoKey v16 = NSUnderlyingErrorKey;
          v17 = v4;
          v10 = &v17;
          v11 = &v16;
          goto LABEL_17;
        case 0x29uLL:
          NSErrorUserInfoKey v24 = NSUnderlyingErrorKey;
          v25 = v4;
          v7 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
          break;
        default:
          NSErrorUserInfoKey v12 = NSUnderlyingErrorKey;
          v13 = v4;
          v10 = &v13;
          v11 = &v12;
LABEL_17:
          v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v11 count:1];
          break;
      }
    }
    else
    {
      NSErrorUserInfoKey v28 = NSUnderlyingErrorKey;
      v29 = v4;
      v7 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    }
    v8 = DMFErrorWithCodeAndUserInfo();
  }
  else
  {
    v8 = DMFErrorWithCodeAndUserInfo();
  }

  return v8;
}

+ (id)_dmfInstallErrorFromSUInstallError:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 domain];
    unsigned __int8 v6 = [v5 isEqualToString:SUErrorDomain];

    if (v6)
    {
      id v7 = [v4 code];
      switch((unint64_t)v7)
      {
        case 3uLL:
        case 5uLL:
          NSErrorUserInfoKey v13 = NSUnderlyingErrorKey;
          NSErrorUserInfoKey v14 = v4;
          v8 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
          break;
        case 4uLL:
        case 7uLL:
        case 8uLL:
        case 9uLL:
        case 0xAuLL:
        case 0xCuLL:
        case 0xDuLL:
          goto LABEL_15;
        case 6uLL:
          goto LABEL_13;
        case 0xBuLL:
          NSErrorUserInfoKey v21 = NSUnderlyingErrorKey;
          NSErrorUserInfoKey v22 = v4;
          v8 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
          break;
        case 0xEuLL:
          NSErrorUserInfoKey v19 = NSUnderlyingErrorKey;
          NSErrorUserInfoKey v20 = v4;
          v8 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
          break;
        case 0xFuLL:
          goto LABEL_14;
        default:
          if (v7 == (id)24)
          {
LABEL_14:
            NSErrorUserInfoKey v15 = NSUnderlyingErrorKey;
            NSErrorUserInfoKey v16 = v4;
            v8 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
          }
          else if (v7 == (id)43)
          {
LABEL_13:
            NSErrorUserInfoKey v17 = NSUnderlyingErrorKey;
            NSErrorUserInfoKey v18 = v4;
            v8 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
          }
          else
          {
LABEL_15:
            NSErrorUserInfoKey v11 = NSUnderlyingErrorKey;
            NSErrorUserInfoKey v12 = v4;
            v8 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
          }
          break;
      }
    }
    else
    {
      NSErrorUserInfoKey v23 = NSUnderlyingErrorKey;
      NSErrorUserInfoKey v24 = v4;
      v8 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    }
    v9 = DMFErrorWithCodeAndUserInfo();
  }
  else
  {
    v9 = DMFErrorWithCodeAndUserInfo();
  }

  return v9;
}

+ (id)_dmfStatusErrorFromSUStatusError:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    NSErrorUserInfoKey v8 = NSUnderlyingErrorKey;
    id v9 = v3;
    v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    unsigned __int8 v6 = DMFErrorWithCodeAndUserInfo();
  }
  else
  {
    unsigned __int8 v6 = DMFErrorWithCodeAndUserInfo();
  }

  return v6;
}

- (DMDSUManagerInstallTask_iOS)init
{
  v5.receiver = self;
  v5.super_class = (Class)DMDSUManagerInstallTask_iOS;
  v2 = [(DMDSUManagerInstallTask_iOS *)&v5 init];
  if (v2)
  {
    id v3 = [objc_alloc((Class)SUManagerClient) initWithDelegate:0 clientType:0];
    [(DMDSUManagerInstallTask_iOS *)v2 setSoftwareUpdateServices:v3];
  }
  return v2;
}

- (BOOL)removeUpdateWithError:(id *)a3
{
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v27 = 0;
  NSErrorUserInfoKey v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v24 = 0;
  v25[0] = &v24;
  v25[1] = 0x3032000000;
  v25[2] = sub_100073C68;
  v25[3] = sub_100073C78;
  id v26 = 0;
  unsigned __int8 v6 = [(DMDSUManagerInstallTask_iOS *)self softwareUpdateServices];
  NSErrorUserInfoKey v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  NSErrorUserInfoKey v19 = sub_100073C80;
  NSErrorUserInfoKey v20 = &unk_1000CAE40;
  NSErrorUserInfoKey v22 = &v27;
  NSErrorUserInfoKey v23 = &v24;
  id v7 = v5;
  NSErrorUserInfoKey v21 = v7;
  [v6 purgeDownload:&v17];

  dispatch_time_t v8 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    if (a3)
    {
      DMFErrorWithCodeAndUserInfo();
      BOOL v9 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    if (*((unsigned char *)v28 + 24))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_10008823C();
      }
    }
    else
    {
      uint64_t v10 = *(void *)(v25[0] + 40);
      BOOL v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
      if (v10)
      {
        if (v11) {
          sub_1000881B4((uint64_t)v25);
        }
        if (a3)
        {
          uint64_t v12 = *(void *)(v25[0] + 40);
          if (v12)
          {
            NSErrorUserInfoKey v31 = NSUnderlyingErrorKey;
            uint64_t v32 = v12;
            NSErrorUserInfoKey v13 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1, v17, v18, v19, v20);
            DMFErrorWithCodeAndUserInfo();
            id v14 = objc_claimAutoreleasedReturnValue();
            *a3 = v14;
          }
          else
          {
            DMFErrorWithCodeAndUserInfo();
            id v15 = objc_claimAutoreleasedReturnValue();
            *a3 = v15;
          }
        }
      }
      else
      {
        if (v11) {
          sub_10008816C();
        }
        if (a3)
        {
          DMFErrorWithCodeAndUserInfo();
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
    }
    BOOL v9 = *((unsigned char *)v28 + 24) != 0;
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v27, 8);

  return v9;
}

- (id)availableUpdateWithVersion:(id)a3 useDelay:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = sub_100073C68;
  v44 = sub_100073C78;
  id v45 = 0;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = sub_100073C68;
  v38 = sub_100073C78;
  id v39 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  uint64_t v10 = objc_opt_new();
  [v10 setIdentifier:@"com.apple.mdm"];
  [v10 setForced:1];
  [v10 setRequestedPMV:v8];
  [v10 setMDMUseDelayPeriod:v6];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    CFStringRef v11 = @"NO";
    if (v6) {
      CFStringRef v11 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v53 = v11;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "available-os-updates useDelay=%@", buf, 0xCu);
  }
  uint64_t v12 = [(DMDSUManagerInstallTask_iOS *)self softwareUpdateServices];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000741E0;
  v30[3] = &unk_1000CBDF8;
  uint64_t v32 = &v40;
  v33 = &v34;
  NSErrorUserInfoKey v13 = v9;
  NSErrorUserInfoKey v31 = v13;
  [v12 scanForUpdates:v10 withResult:v30];

  dispatch_time_t v14 = dispatch_time(0, 120000000000);
  if (dispatch_semaphore_wait(v13, v14))
  {
    if (a5)
    {
LABEL_7:
      DMFErrorWithCodeAndUserInfo();
      id v15 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if (v41[5])
  {
    id v16 = objc_alloc((Class)DMFOSUpdate);
    id v15 = [v16 initWithDescriptor:v41[5]];
    goto LABEL_22;
  }
  if (a5)
  {
    NSErrorUserInfoKey v17 = [(id)v35[5] domain];
    unsigned int v18 = [v17 isEqualToString:SUErrorDomain];

    NSErrorUserInfoKey v19 = (void *)v35[5];
    if (!v18)
    {
      if (!v19) {
        goto LABEL_7;
      }
      NSErrorUserInfoKey v46 = NSUnderlyingErrorKey;
      v47 = v19;
      NSErrorUserInfoKey v23 = +[NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
      DMFErrorWithCodeAndUserInfo();
      id v24 = objc_claimAutoreleasedReturnValue();
      *a5 = v24;

      goto LABEL_21;
    }
    if ([v19 code] == (id)3
      || [(id)v35[5] code] == (id)63
      || [(id)v35[5] code] == (id)55)
    {
      uint64_t v20 = v35[5];
      if (v20)
      {
        NSErrorUserInfoKey v50 = NSUnderlyingErrorKey;
        uint64_t v51 = v20;
        NSErrorUserInfoKey v21 = +[NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
        DMFErrorWithCodeAndUserInfo();
        id v22 = objc_claimAutoreleasedReturnValue();
        *a5 = v22;

        goto LABEL_21;
      }
    }
    else
    {
      uint64_t v27 = v35[5];
      if (v27)
      {
        NSErrorUserInfoKey v48 = NSUnderlyingErrorKey;
        uint64_t v49 = v27;
        NSErrorUserInfoKey v28 = +[NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
        DMFErrorWithCodeAndUserInfo();
        id v29 = objc_claimAutoreleasedReturnValue();
        *a5 = v29;

        goto LABEL_21;
      }
    }
    DMFErrorWithCodeAndUserInfo();
    id v25 = objc_claimAutoreleasedReturnValue();
    *a5 = v25;
  }
LABEL_21:
  id v15 = 0;
LABEL_22:

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);

  return v15;
}

- (BOOL)startDownloadWithError:(id *)a3
{
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v22 = 0;
  NSErrorUserInfoKey v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = sub_100073C68;
  id v26 = sub_100073C78;
  id v27 = 0;
  dispatch_semaphore_t v5 = objc_opt_new();
  [v5 setAutoDownload:0];
  [v5 setDownloadOnly:1];
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  id v7 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v8 = [v5 isAutoDownload];
    unsigned int v9 = [v5 isDownloadOnly];
    CFStringRef v10 = @"NO";
    if (v8) {
      CFStringRef v11 = @"YES";
    }
    else {
      CFStringRef v11 = @"NO";
    }
    if (v9) {
      CFStringRef v10 = @"YES";
    }
    *(_DWORD *)buf = 138543618;
    CFStringRef v33 = v11;
    __int16 v34 = 2114;
    CFStringRef v35 = v10;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "calling startDownloadWithMetadata:withResult:, autodownload is %{public}@, downloadOnly is %{public}@", buf, 0x16u);
  }

  uint64_t v12 = [(DMDSUManagerInstallTask_iOS *)self softwareUpdateServices];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100074578;
  v18[3] = &unk_1000CAE40;
  uint64_t v20 = &v28;
  NSErrorUserInfoKey v21 = &v22;
  NSErrorUserInfoKey v13 = v6;
  NSErrorUserInfoKey v19 = v13;
  [v12 startDownloadWithMetadata:v5 withResult:v18];

  dispatch_time_t v14 = dispatch_time(0, 30000000000);
  if (!dispatch_semaphore_wait(v13, v14))
  {
    if (*((unsigned char *)v29 + 24))
    {
      BOOL v16 = 1;
      goto LABEL_17;
    }
    if (a3)
    {
      id v15 = [(id)objc_opt_class() _dmfDownloadErrorFromSUDownloadError:v23[5]];
      goto LABEL_11;
    }
LABEL_16:
    BOOL v16 = 0;
    goto LABEL_17;
  }
  if (!a3) {
    goto LABEL_16;
  }
  id v15 = DMFErrorWithCodeAndUserInfo();
LABEL_11:
  BOOL v16 = 0;
  *a3 = v15;
LABEL_17:

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);
  return v16;
}

- (BOOL)startInstallWithError:(id *)a3
{
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v18 = 0;
  NSErrorUserInfoKey v19 = &v18;
  uint64_t v20 = 0x3032000000;
  NSErrorUserInfoKey v21 = sub_100073C68;
  uint64_t v22 = sub_100073C78;
  id v23 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v28 = kSUInstallOptionRequireUpdate;
  dispatch_semaphore_t v6 = +[NSArray arrayWithObjects:&v28 count:1];
  id v7 = [(DMDSUManagerInstallTask_iOS *)self softwareUpdateServices];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100074878;
  v14[3] = &unk_1000CAE40;
  BOOL v16 = &v24;
  NSErrorUserInfoKey v17 = &v18;
  unsigned int v8 = v5;
  id v15 = v8;
  [v7 installUpdateWithOptions:v6 withResult:v14];

  dispatch_time_t v9 = dispatch_time(0, 30000000000);
  if (!dispatch_semaphore_wait(v8, v9))
  {
    if ([(id)v19[5] code] == (id)20)
    {
      uint64_t v12 = (void *)v19[5];
      v19[5] = 0;

      BOOL v11 = 1;
      *((unsigned char *)v25 + 24) = 1;
      goto LABEL_12;
    }
    if (*((unsigned char *)v25 + 24))
    {
      BOOL v11 = 1;
      goto LABEL_12;
    }
    if (a3)
    {
      id v10 = [(id)objc_opt_class() _dmfInstallErrorFromSUInstallError:v19[5]];
      goto LABEL_4;
    }
LABEL_11:
    BOOL v11 = 0;
    goto LABEL_12;
  }
  if (!a3) {
    goto LABEL_11;
  }
  DMFErrorWithCodeAndUserInfo();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_4:
  BOOL v11 = 0;
  *a3 = v10;
LABEL_12:

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);
  return v11;
}

- (id)currentStatusWithError:(id *)a3
{
  uint64_t v20 = 0;
  NSErrorUserInfoKey v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = sub_100073C68;
  uint64_t v24 = sub_100073C78;
  dispatch_semaphore_t v25 = dispatch_semaphore_create(0);
  uint64_t v17 = 0;
  v18[0] = &v17;
  v18[1] = 0x3032000000;
  v18[2] = sub_100073C68;
  v18[3] = sub_100073C78;
  id v19 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  dispatch_time_t v14 = sub_100073C68;
  id v15 = sub_100073C78;
  id v16 = (id)objc_opt_new();
  dispatch_semaphore_t v5 = [(DMDSUManagerInstallTask_iOS *)self softwareUpdateServices];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100074B9C;
  v10[3] = &unk_1000CBE20;
  v10[4] = &v11;
  v10[5] = &v17;
  v10[6] = &v20;
  [v5 downloadAndInstallState:v10];

  dispatch_time_t v6 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v21[5], v6))
  {
    if (a3)
    {
      id v7 = DMFErrorWithCodeAndUserInfo();
LABEL_8:
      id v8 = 0;
      *a3 = v7;
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (!*(void *)(v18[0] + 40))
  {
    id v8 = (id)v12[5];
    goto LABEL_12;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100088284((uint64_t)v18);
    if (a3) {
      goto LABEL_7;
    }
  }
  else if (a3)
  {
LABEL_7:
    id v7 = [(id)objc_opt_class() _dmfStatusErrorFromSUStatusError:*(void *)(v18[0] + 40)];
    goto LABEL_8;
  }
LABEL_11:
  id v8 = 0;
LABEL_12:
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

- (SUManagerClient)softwareUpdateServices
{
  return self->softwareUpdateServices;
}

- (void)setSoftwareUpdateServices:(id)a3
{
}

- (void).cxx_destruct
{
}

@end