@interface PVAppIdentityGenerator
- (BOOL)extractApplicationRecord:(id *)a3;
- (BOOL)validatePPQAppId:(id *)a3;
- (PVAppIdentityGenerator)initWithApplicationURL:(id)a3 ppqAppId:(id)a4;
- (id)generateDigest;
- (void)dealloc;
@end

@implementation PVAppIdentityGenerator

- (PVAppIdentityGenerator)initWithApplicationURL:(id)a3 ppqAppId:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PVAppIdentityGenerator;
  v9 = [(PVAppIdentityGenerator *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->applicationURL, a3);
    objc_storeStrong((id *)&v10->ppqAppId, a4);
    executableName = v10->executableName;
    v10->executableName = 0;

    executableURL = v10->executableURL;
    v10->executableURL = 0;
  }
  return v10;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PVAppIdentityGenerator;
  [(PVAppIdentityGenerator *)&v2 dealloc];
}

- (BOOL)extractApplicationRecord:(id *)a3
{
  id v5 = objc_alloc((Class)LSApplicationRecord);
  applicationURL = self->applicationURL;
  id v24 = 0;
  id v7 = [v5 initWithURL:applicationURL allowPlaceholder:0 error:&v24];
  id v8 = v24;
  if (v7)
  {
    v9 = [v7 infoDictionary];
    v10 = [v9 objectForKey:kCFBundleExecutableKey ofClass:objc_opt_class()];

    v11 = [v7 executableURL];
    v12 = isNSString(v10);

    if (v12) {
      BOOL v13 = v11 == 0;
    }
    else {
      BOOL v13 = 1;
    }
    if (v13)
    {
      +[NSError pvai_errorWithCode:-10200];
      id v8 = v14 = v8;
    }
    else
    {
      objc_storeStrong((id *)&self->executableName, v10);
      objc_storeStrong((id *)&self->executableURL, v11);
      v15 = _PVAppIdentityLogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        sub_100018EE4(v7);
      }

      v17 = _PVAppIdentityLogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        sub_100018E70();
      }

      v18 = _PVAppIdentityLogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        sub_100018DDC(v7);
      }

      v19 = _PVAppIdentityLogSystem();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        sub_100018D48(v7);
      }

      v20 = _PVAppIdentityLogSystem();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        sub_100018CB4(v7);
      }

      v21 = _PVAppIdentityLogSystem();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        sub_100018C30(v7);
      }

      v22 = _PVAppIdentityLogSystem();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        sub_100018BAC(v7);
      }

      objc_super v14 = _PVAppIdentityLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        sub_100018B38();
      }
    }
  }
  else
  {
    +[NSError pvai_wrappedError:-10200 error:v8];
    id v8 = v10 = v8;
  }

  if (a3 && v8) {
    *a3 = v8;
  }

  return v8 == 0;
}

- (BOOL)validatePPQAppId:(id *)a3
{
  v4 = isNSData(self->ppqAppId);

  if (v4)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = +[NSError pvai_errorWithCode:-10001];
    if (a3 && v5)
    {
      id v5 = v5;
      *a3 = v5;
    }
  }
  BOOL v6 = v5 == 0;

  return v6;
}

- (id)generateDigest
{
  v43 = 0;
  v44 = 0;
  v42 = 0;
  CFTypeRef v40 = 0;
  CFTypeRef cf = 0;
  id v38 = 0;
  CFTypeRef v39 = 0;
  [(PVAppIdentityGenerator *)self extractApplicationRecord:&v38];
  id v3 = v38;
  if (v3
    || (id v37 = 0,
        [(PVAppIdentityGenerator *)self validatePPQAppId:&v37],
        (id v3 = v37) != 0))
  {
    v4 = v3;
    id v5 = 0;
    v35 = 0;
LABEL_4:
    BOOL v6 = [PVAppIdentityDigest alloc];
    id v7 = +[NSNumber numberWithInt:2001];
    id v8 = [(PVAppIdentityDigest *)v6 initWithError:v4 version:v7];
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    BOOL v13 = 0;
    objc_super v14 = 0;
LABEL_5:

    v15 = v35;
    goto LABEL_6;
  }
  v15 = [(NSString *)self->executableName dataUsingEncoding:4];
  applicationURL = self->applicationURL;
  p_applicationURL = (uint64_t *)&self->applicationURL;
  uint64_t v34 = [(NSURL *)applicationURL URLByAppendingPathComponent:@"_CodeSignature/CodeResources" isDirectory:0];
  PVAppIdentityCore_GenerateDigests(p_applicationURL[1], (uint64_t)v15, *p_applicationURL, p_applicationURL[3], v34, -1, -1);
  if (!v20)
  {
    v35 = v15;
    CFTypeRef v21 = v44;
    CFTypeRef v22 = v43;
    CFTypeRef v23 = v42;
    CFTypeRef v31 = (id)v40;
    CFTypeRef v24 = (id)cf;
    v10 = (id)v39;
    v25 = [PVAppIdentityDigest alloc];
    v26 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2001, &v43, &v42, &v40, &cf, &v39);
    v9 = (void *)v21;
    CFTypeRef v27 = v21;
    objc_super v14 = (void *)v22;
    CFTypeRef v28 = v22;
    BOOL v13 = (void *)v23;
    CFTypeRef v29 = v23;
    v12 = (void *)v31;
    v11 = (void *)v24;
    id v8 = -[PVAppIdentityDigest initWithVersion:data0:data1:data2:data3:data4:data5:](v25, "initWithVersion:data0:data1:data2:data3:data4:data5:", v26, v27, v28, v29, v10);

    id v7 = [(PVAppIdentityDigest *)v8 asDictionary];
    id v36 = 0;
    v33 = +[NSJSONSerialization dataWithJSONObject:v7 options:3 error:&v36];
    id v32 = v36;
    v30 = _PVAppIdentityLogSystem();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      sub_100018F68(p_applicationURL, (uint64_t)v33, v30);
    }

    v4 = 0;
    id v5 = (void *)v34;
    goto LABEL_5;
  }
  v4 = +[NSError pvai_errorWithCode:](NSError, "pvai_errorWithCode:", v20, &v43, &v42, &v40, &cf, &v39);
  if (v4)
  {
    v35 = v15;
    id v5 = (void *)v34;
    goto LABEL_4;
  }
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  BOOL v13 = 0;
  objc_super v14 = 0;
  id v8 = 0;
  id v5 = (void *)v34;
LABEL_6:
  if (v44) {
    CFRelease(v44);
  }
  if (v43) {
    CFRelease(v43);
  }
  if (v42) {
    CFRelease(v42);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v40) {
    CFRelease(v40);
  }
  if (v39) {
    CFRelease(v39);
  }
  v16 = v8;

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->executableURL, 0);
  objc_storeStrong((id *)&self->executableName, 0);
  objc_storeStrong((id *)&self->ppqAppId, 0);

  objc_storeStrong((id *)&self->applicationURL, 0);
}

@end