@interface MBRestoreFailuresManager
+ (id)sharedManager;
- (BOOL)recordRestoreFailure:(id)a3 persona:(id)a4 error:(id *)a5;
- (id)_iconDataForRestoreFailure:(id)a3 persona:(id)a4 error:(id *)a5;
- (id)restoreFailuresForDataClass:(id)a3 assetType:(id)a4 range:(_NSRange)a5;
- (unint64_t)countOfRestoreFailuresForDataclass:(id)a3 assetType:(id)a4;
@end

@implementation MBRestoreFailuresManager

+ (id)sharedManager
{
  if (qword_100482888 != -1) {
    dispatch_once(&qword_100482888, &stru_100417E30);
  }
  return (id)qword_100482880;
}

- (id)_iconDataForRestoreFailure:(id)a3 persona:(id)a4 error:(id *)a5
{
  uint64_t v20 = 0;
  id v7 = -[MBMobileInstallation userAppWithBundleID:placeholder:persona:error:](objc_alloc_init(MBMobileInstallation), "userAppWithBundleID:placeholder:persona:error:", [a3 identifier], 1, a4, &v20);
  if (!v7)
  {
    if (a5)
    {
      v15 = +[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", 1, v20, @"Could not lookup installation info for '%@'", [a3 identifier]);
LABEL_16:
      v18 = v15;
      id result = 0;
      *a5 = v18;
      return result;
    }
    return 0;
  }
  v8 = v7;
  if (!objc_msgSend(v7, "objectForKeyedSubscript:", objc_msgSend(a3, "identifier")))
  {
    if (!a5) {
      return 0;
    }
    id v19 = [a3 identifier];
    CFStringRef v16 = @"Could not find installation info for '%@'";
LABEL_12:
    uint64_t v17 = 4;
LABEL_15:
    v15 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", v17, v16, v19);
    goto LABEL_16;
  }
  id v9 = objc_msgSend(objc_msgSend(v8, "objectForKeyedSubscript:", objc_msgSend(a3, "identifier")), "objectForKeyedSubscript:", @"Path");
  if (!v9)
  {
    if (!a5) {
      return 0;
    }
    id v19 = [a3 identifier];
    CFStringRef v16 = @"Could not find bundle path information for '%@'";
    goto LABEL_12;
  }
  CFBundleRef v10 = CFBundleCreate(0, (CFURLRef)+[NSURL fileURLWithPath:v9]);
  if (v10)
  {
    CFBundleRef v11 = v10;
    v12 = (const void *)LICreateIconForBundle();
    v13 = (void *)LICreateCachedUncompressedDataFromImage();
    CFRelease(v12);
    CFRelease(v11);
    return v13;
  }
  if (a5)
  {
    id v19 = [a3 identifier];
    CFStringRef v16 = @"Could not load bundle for app '%@'";
    uint64_t v17 = 1;
    goto LABEL_15;
  }
  return 0;
}

- (BOOL)recordRestoreFailure:(id)a3 persona:(id)a4 error:(id *)a5
{
  if (![a3 identifier]) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBRestoreFailuresManager.m" lineNumber:77 description:@"identifier must not be nil"];
  }
  if (![a3 dataclass]) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBRestoreFailuresManager.m" lineNumber:78 description:@"dataclass must not be nil"];
  }
  if (!objc_msgSend(objc_msgSend(a3, "dataclass"), "isEqualToString:", @"Application")) {
    goto LABEL_10;
  }
  uint64_t v14 = 0;
  objc_msgSend(a3, "setIcon:", -[MBRestoreFailuresManager _iconDataForRestoreFailure:persona:error:](self, "_iconDataForRestoreFailure:persona:error:", a3, a4, &v14));
  id v10 = [a3 icon];
  if (!a5 || v10)
  {
    if (!v10) {
      return (char)v10;
    }
LABEL_10:
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1002A4C80;
    v13[3] = &unk_100417988;
    v13[4] = a3;
    MBPerformWithCache((uint64_t)v13);
    LOBYTE(v10) = 1;
    return (char)v10;
  }
  CFBundleRef v11 = +[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", 4, v14, @"Could not retrieve icon for asset '%@'", [a3 identifier]);
  LOBYTE(v10) = 0;
  *a5 = v11;
  return (char)v10;
}

- (id)restoreFailuresForDataClass:(id)a3 assetType:(id)a4 range:(_NSRange)a5
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3052000000;
  v12 = sub_1002A4D74;
  v13 = sub_1002A4D84;
  uint64_t v14 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002A4D90;
  v7[3] = &unk_100417E58;
  v7[4] = a3;
  v7[5] = a4;
  v7[6] = &v9;
  _NSRange v8 = a5;
  MBPerformWithCache((uint64_t)v7);
  v5 = (void *)v10[5];
  _Block_object_dispose(&v9, 8);
  return v5;
}

- (unint64_t)countOfRestoreFailuresForDataclass:(id)a3 assetType:(id)a4
{
  uint64_t v7 = 0;
  _NSRange v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1002A4E8C;
  v6[3] = &unk_100415ED0;
  v6[5] = a4;
  v6[6] = &v7;
  v6[4] = a3;
  MBPerformWithCache((uint64_t)v6);
  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

@end