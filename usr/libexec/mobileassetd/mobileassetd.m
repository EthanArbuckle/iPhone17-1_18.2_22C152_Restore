uint64_t sub_1000045A0(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const std::__fs::filesystem::path *v13;
  const std::__fs::filesystem::path *v14;
  std::error_code *v15;
  int v16;
  id v17;
  uint64_t v18;
  id v20;

  v3 = a1;
  v4 = a2;
  v5 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager]);
  if (v4)
  {
    if (v3)
    {
      v6 = objc_opt_class(NSDictionary);
      if ((objc_opt_isKindOfClass(v3, v6) & 1) != 0
        || (v7 = objc_opt_class(NSData), (objc_opt_isKindOfClass(v3, v7) & 1) != 0)
        || (v8 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v3, v8) & 1) != 0))
      {
        v9 = objc_claimAutoreleasedReturnValue([v4 stringByDeletingLastPathComponent]);
        v10 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID]);
        v11 = objc_claimAutoreleasedReturnValue([v10 UUIDString]);
        v12 = objc_claimAutoreleasedReturnValue([v9 stringByAppendingPathComponent:v11]);

        if ([v3 writeToFile:v12 atomically:0])
        {
          v13 = (const std::__fs::filesystem::path *)[v12 fileSystemRepresentation];
          v14 = (const std::__fs::filesystem::path *)[v4 fileSystemRepresentation];
          rename(v13, v14, v15);
          if (!v16)
          {
            v18 = 1;
            goto LABEL_16;
          }
        }
        NSLog(@"%s: Failed to write item to path %@", "safeAtomicWriteToPath", v4);
        if ([v5 fileExistsAtPath:v12 isDirectory:0])
        {
          v20 = 0;
          [v5 removeItemAtPath:v12 error:&v20];
          v17 = v20;
          v18 = (uint64_t)v17;
          if (!v17)
          {
LABEL_16:

            goto LABEL_17;
          }
          NSLog(@"%s: Atomic write to path failed and failed to remove temp path(%@): %@", "safeAtomicWriteToPath", v12, v17);
        }
        v18 = 0;
        goto LABEL_16;
      }
    }
    NSLog(@"Invalid data passed to %s", "safeAtomicWriteToPath");
  }
  else
  {
    NSLog(@"Invalid path passed to %s", "safeAtomicWriteToPath");
  }
  v18 = 0;
LABEL_17:

  return v18;
}

BOOL sub_1000047AC(void *a1, char a2, void *a3)
{
  id v5 = a1;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager]);
  v8 = objc_claimAutoreleasedReturnValue([v7 enumeratorAtPath:v5]);

  if (v8)
  {
    v10 = 0;
    while (1)
    {
      v11 = v10;
      v10 = objc_claimAutoreleasedReturnValue([v8 nextObject]);

      if (!v10) {
        break;
      }
      if ((a2 & 1) == 0) {
        [v8 skipDescendants];
      }
      if ((v6[2](v6, v10) & 1) == 0)
      {
        id v12 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"Caller canceled enumeration"]);
        NSLog(@"[MAB] %s", [v12 UTF8String]);

        break;
      }
    }
  }
  else
  {
    id v13 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"Could not create directory enumerator for %@", v5]);
    NSLog(@"[MAB] %s", [v13 UTF8String]);
  }
  return v8 != 0;
}

uint64_t sub_10000490C()
{
  uint64_t result = os_variant_has_internal_content("com.apple.mobileassetd");
  if (result) {
    return sub_100004F5C(@"MABrainAllowUnpersonalized", 0) != 0;
  }
  return result;
}

BOOL sub_100004944()
{
  if (!os_variant_has_internal_content("com.apple.mobileassetd")) {
    return 1;
  }
  char v3 = 0;
  unsigned int v0 = sub_100004F5C(@"MABrainAllowDownloaded", &v3);
  if (v3) {
    BOOL v1 = v0 == 0;
  }
  else {
    BOOL v1 = 0;
  }
  return !v1;
}

uint64_t sub_100004998()
{
  uint64_t result = os_variant_has_internal_content("com.apple.mobileassetd");
  if (result) {
    return sub_100004F5C(@"MABrainAllowCrossBuildGroup", 0) != 0;
  }
  return result;
}

uint64_t sub_1000049D0()
{
  uint64_t result = os_variant_has_internal_content("com.apple.mobileassetd");
  if (result) {
    return sub_100004F5C(@"MABrainDisableHealthCheck", 0) != 0;
  }
  return result;
}

id sub_100004A08()
{
  unsigned int v0 = _NSGetMachExecuteHeader();
  memset(dst, 0, sizeof(dst));
  uint64_t ncmds = v0->ncmds;
  if (ncmds)
  {
    v2 = v0;
    uint64_t v3 = 0;
    uint64_t v4 = 32;
    while (1)
    {
      id v5 = (const unsigned __int8 *)v0 + v4;
      if (*(uint32_t *)((char *)&v0->magic + v4) == 27) {
        break;
      }
      v4 += *((unsigned int *)v5 + 1);
      if (ncmds == ++v3) {
        goto LABEL_9;
      }
    }
    uuid_copy(dst, v5 + 8);
    uint64_t v6 = v2->ncmds;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v3 = 0;
  }
  if (v3 == v6) {
LABEL_9:
  }
    uuid_clear(dst);
  memset(v10, 0, sizeof(v10));
  uuid_unparse_lower(dst, v10);
  v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:v10 encoding:1]);
  v8 = objc_claimAutoreleasedReturnValue([v7 stringByReplacingOccurrencesOfString:@"-" withString:&stru_10000C5D8]);

  return v8;
}

id sub_100004B1C()
{
  size_t size = 0;
  if (sysctlbyname("kern.bootsessionuuid", 0, &size, 0, 0))
  {
    uint64_t v0 = *__error();
    BOOL v1 = __error();
    uint64_t v13 = v0;
    v14 = strerror(*v1);
    CFStringRef v2 = @"Could not look up boot session UUID: %d (%s)";
LABEL_3:
    uint64_t v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v2, v13, v14);
LABEL_4:
    id v4 = objc_claimAutoreleasedReturnValue(v3);
    NSLog(@"[MAB] %s", [v4 UTF8String]);

    id v5 = 0;
    return v5;
  }
  if (!size)
  {
    uint64_t v3 = +[NSString stringWithFormat:@"Boot session UUID has an invalid length (%zu)", 0, v14];
    goto LABEL_4;
  }
  v7 = malloc_type_malloc(size, 0x3542D200uLL);
  if (!v7)
  {
    CFStringRef v2 = @"Could not allocate buffer to copy boot session UUID";
    goto LABEL_3;
  }
  v8 = v7;
  if (sysctlbyname("kern.bootsessionuuid", v7, &size, 0, 0))
  {
    uint64_t v9 = *__error();
    v10 = __error();
    v11 = +[NSString stringWithFormat:@"Could not copy boot session UUID: %d (%s)", v9, strerror(*v10)];
    id v12 = objc_claimAutoreleasedReturnValue(v11);
    NSLog(@"[MAB] %s", [v12 UTF8String]);

    id v5 = 0;
  }
  else
  {
    id v5 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:v8 encoding:4]);
  }
  free(v8);
  return v5;
}

uint64_t sub_100004CAC()
{
  v2[0] = kMKBUserSessionIDKey;
  v2[1] = @"ExtendedDeviceLockState";
  v3[0] = &off_10000D718;
  v3[1] = &__kCFBooleanTrue;
  unsigned int v0 = MKBGetDeviceLockState(+[NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:2]);
  return (v0 < 7) & (0x46u >> v0);
}

id sub_100004D4C()
{
  if (qword_1000105E8 != -1) {
    dispatch_once(&qword_1000105E8, &stru_10000C330);
  }
  return (id)qword_1000105E0;
}

void sub_100004D8C(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.MobileAsset.preferencesDomain", 0);
  CFStringRef v2 = (void *)qword_1000105E0;
  qword_1000105E0 = (uint64_t)v1;
}

id sub_100004DB8(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = sub_100004F08;
    v22 = sub_100004F18;
    id v23 = 0;
    id v2 = sub_100004D4C();
    uint64_t v3 = objc_claimAutoreleasedReturnValue(v2);
    block = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    v14 = sub_100004F20;
    v15 = &unk_10000C358;
    id v4 = v1;
    id v16 = v4;
    v17 = &v18;
    dispatch_sync(v3, &block);

    id v5 = (void *)v19[5];
    if (v5)
    {
      id v6 = v5;
      v7 = (objc_class *)objc_opt_class(v6);
      v8 = NSStringFromClass(v7);
      uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    }
    id v10 = v5;

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void sub_100004EF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004F08(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100004F18(uint64_t a1)
{
}

void sub_100004F20(uint64_t a1)
{
  CFPropertyListRef v2 = CFPreferencesCopyAppValue(*(CFStringRef *)(a1 + 32), @"com.apple.MobileAsset");
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id sub_100004F5C(void *a1, unsigned char *a2)
{
  id v3 = sub_100004DB8(a1);
  id v4 = objc_claimAutoreleasedReturnValue(v3);
  if (v4)
  {
    uint64_t v5 = objc_opt_class(NSNumber);
    char isKindOfClass = objc_opt_isKindOfClass(v4, v5);
    char v7 = isKindOfClass ^ 1;
    char v8 = isKindOfClass & 1;
    if (!a2) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  char v8 = 0;
  char v7 = 1;
  if (a2) {
LABEL_3:
  }
    *a2 = v8;
LABEL_4:
  if (v7) {
    id v9 = 0;
  }
  else {
    id v9 = [v4 BOOLValue];
  }

  return v9;
}

id start(uint64_t a1, uint64_t a2)
{
  NSLog(@"Starting mobileassetd built Nov 17 2024 20:01:07");
  uint64_t v5 = objc_claimAutoreleasedReturnValue(+[MABrainLoader sharedInstance]);
  id v6 = [v5 run:a1 argv:a2];

  return v6;
}

id sub_10000505C(uint64_t a1)
{
  id v1 = objc_claimAutoreleasedReturnValue([@"/private/var/MobileSoftwareUpdate/MobileAsset/MobileAssetBrain" stringByAppendingPathComponent:a1]);
  CFPropertyListRef v2 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager]);
  unsigned int v3 = [v2 fileExistsAtPath:v1];

  if (!v3)
  {
    id v7 = 0;
    id v4 = 0;
    goto LABEL_5;
  }
  id v14 = 0;
  id v4 = objc_claimAutoreleasedReturnValue(+[NSString stringWithContentsOfFile:v1 encoding:4 error:&v14]);
  id v5 = v14;
  if (v5)
  {
    id v6 = v5;
    id v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"Error loading contents of %@: %@", v1, v5]);
    NSLog(@"[MAB] %s", [v7 UTF8String]);
LABEL_14:

    id v7 = 0;
    goto LABEL_15;
  }
  if (![v4 length])
  {
    id v12 = +[NSString stringWithFormat:@"Invalid target path at %@", v1];
LABEL_12:
    id v7 = objc_claimAutoreleasedReturnValue(v12);
    NSLog(@"[MAB] %s", [v7 UTF8String]);
    goto LABEL_13;
  }
  uint64_t v8 = objc_claimAutoreleasedReturnValue([@"/private/var/MobileSoftwareUpdate/MobileAsset/MobileAssetBrain" stringByAppendingPathComponent:v4]);
  if (!v8)
  {
    id v12 = +[NSString stringWithFormat:@"Allocating targetPath failed for target %@", v4];
    goto LABEL_12;
  }
  id v7 = (id)v8;
  id v9 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager]);
  unsigned __int8 v10 = [v9 fileExistsAtPath:v7];

  if ((v10 & 1) == 0)
  {
    id v11 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"%@ does not exist", v7]);
    NSLog(@"[MAB] %s", [v11 UTF8String]);

LABEL_13:
    id v6 = 0;
    goto LABEL_14;
  }
LABEL_5:
  id v6 = 0;
LABEL_15:

  return v7;
}

uint64_t sub_100005628(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_claimAutoreleasedReturnValue([@"/private/var/MobileSoftwareUpdate/MobileAsset/MobileAssetBrain" stringByAppendingPathComponent:v3]);
  id v5 = [[__MABuiltinBrainBundle__ alloc] initWithPath:v4];
  if ([*(id *)(a1 + 32) containsObject:v3])
  {
    id v6 = +[NSString stringWithFormat:@"Preserving item %@", v3];
LABEL_5:
    id v7 = objc_claimAutoreleasedReturnValue(v6);
    NSLog(@"[MAB] %s", [v7 UTF8String]);
    goto LABEL_10;
  }
  if ([(__MABuiltinBrainBundle__ *)v5 isGrafted])
  {
    id v6 = +[NSString stringWithFormat:@"Preserving item %@ (still grafted)", v3];
    goto LABEL_5;
  }
  uint64_t v8 = *(void **)(a1 + 40);
  id v14 = 0;
  unsigned int v9 = [v8 removeItemAtPath:v4 error:&v14];
  id v7 = v14;
  if (v9) {
    unsigned __int8 v10 = +[NSString stringWithFormat:@"Successfully removed item %@", v3, v13];
  }
  else {
    unsigned __int8 v10 = +[NSString stringWithFormat:@"Error removing item %@: %@", v3, v7];
  }
  id v11 = objc_claimAutoreleasedReturnValue(v10);
  NSLog(@"[MAB] %s", [v11 UTF8String]);

LABEL_10:
  return 1;
}

void sub_1000068AC(id a1)
{
  id v1 = objc_alloc_init(MABrainLoader);
  CFPropertyListRef v2 = (void *)qword_1000105F0;
  qword_1000105F0 = (uint64_t)v1;
}

void sub_100006EE8(uint64_t a1)
{
  memset(&v17, 0, sizeof(v17));
  if (lstat((const char *)[@"/private/var/run/com.apple.mobileassetd-MobileAssetBrain" fileSystemRepresentation], &v17))
  {
    if (*__error() == 2)
    {
      CFStringRef v2 = @"mobileassetd has no launch history; possible first launch since boot.";
    }
    else
    {
      unsigned __int8 v10 = __error();
      v15 = strerror(*v10);
      CFStringRef v2 = @"Error reading mobileassetd launch history file metadata: %s";
    }
    goto LABEL_9;
  }
  if (v17.st_size > 0x10000)
  {
    CFStringRef v2 = @"mobileassetd launch history file is too large; disregarding.";
LABEL_9:
    id v3 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v2, v15));
    NSLog(@"[MAB] %s", [v3 UTF8String]);
    goto LABEL_10;
  }
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:@"/private/var/run/com.apple.mobileassetd-MobileAssetBrain"]);
  id v16 = 0;
  id v4 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:v3 error:&v16]);
  id v5 = v16;
  id v6 = [v4 mutableCopy];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(v7 + 8);
  *(void *)(v7 + 8) = v6;

  if (v5) {
    unsigned int v9 = +[NSString stringWithFormat:@"Could not load mobileassetd launch history: %@", v5];
  }
  else {
    unsigned int v9 = +[NSString stringWithFormat:@"mobileassetd launch history successfully loaded", v15];
  }
  id v14 = objc_claimAutoreleasedReturnValue(v9);
  NSLog(@"[MAB] %s", [v14 UTF8String]);

LABEL_10:
  if (!*(void *)(*(void *)(a1 + 32) + 8))
  {
    id v11 = objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(void **)(v12 + 8);
    *(void *)(v12 + 8) = v11;
  }
}

void sub_100007D34(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"bundleId"]);
  [v1 recordLaunch:v2];
}

void sub_100007DBC(id a1)
{
  id v1 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"%s", "$SIDEBUILD_PARENT_TRAIN"]);
  if ([v1 isEqualToString:&stru_10000C5D8])
  {
  }
  else
  {
    id v2 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"%s", "$SIDEBUILD_PARENT_TRAIN"]);
    unsigned __int8 v3 = [v2 isEqualToString:@"$SIDEBUILD_PARENT_TRAIN"];

    if ((v3 & 1) == 0)
    {
      qword_100010618 = (uint64_t)"$SIDEBUILD_PARENT_TRAIN";
      return;
    }
  }
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"%s", "CrystalC"]);
  if ([v6 isEqualToString:&stru_10000C5D8])
  {
  }
  else
  {
    id v4 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"%s", "CrystalC"]);
    unsigned __int8 v5 = [v4 isEqualToString:@"$RC_RELEASE"];

    if ((v5 & 1) == 0) {
      qword_100010618 = (uint64_t)"CrystalC";
    }
  }
}

void sub_1000086CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

uint64_t sub_100008750(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100008760(uint64_t a1)
{
}

uint64_t sub_100008768(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  unsigned int v9 = v8;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  if (!v8)
  {
    id v10 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"%@ MobileAssetBrain not found", v7]);
    NSLog(@"[MAB] %s", [v10 UTF8String]);
LABEL_24:
    uint64_t v26 = 0;
    goto LABEL_25;
  }
  id v10 = (id)objc_claimAutoreleasedReturnValue([v8 lastPathComponent]);
  id v11 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"%@ MobileAssetBrain found in bundle %@", v7, v10]);
  NSLog(@"[MAB] %s", [v11 UTF8String]);

  uint64_t v12 = [[__MABuiltinBrainBundle__ alloc] initWithPath:v9];
  uint64_t v13 = v12;
  if (!v12)
  {
    id v17 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"Allocating bundle failed for %@", v9]);
    NSLog(@"[MAB] %s", [v17 UTF8String]);
LABEL_23:

    goto LABEL_24;
  }
  id v14 = objc_claimAutoreleasedReturnValue([(__MABuiltinBrainBundle__ *)v12 brainInfo]);
  v15 = v14;
  if (v14) {
    id v16 = v14;
  }
  else {
    id v16 = objc_alloc_init((Class)NSDictionary);
  }
  id v17 = v16;

  uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"boot-session-uuid"]);
  v19 = *(void **)(a1 + 32);
  if (v19 && v18 && [v19 isEqualToString:v18]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
    && ![(__MABuiltinBrainBundle__ *)v13 hasValidCurrentBootOnlyTicket])
  {
LABEL_22:

    goto LABEL_23;
  }
  if (![*(id *)(a1 + 40) loadCryptex:*(unsigned __int8 *)(a1 + 80) bundle:v13 bundleName:v10])
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
      goto LABEL_22;
    }
    CFStringRef v27 = @"MobileAssetBrain bundle/cryptex %@ could not be loaded";
LABEL_21:
    id v28 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v27, v10));
    NSLog(@"[MAB] %s", [v28 UTF8String]);

    goto LABEL_22;
  }
  if (![*(id *)(a1 + 40) verify:v13])
  {
    CFStringRef v27 = @"MobileAssetBrain bundle %@ could not be verified";
    goto LABEL_21;
  }
  if (![*(id *)(a1 + 40) loadTrustCache:*(unsigned __int8 *)(a1 + 80) bundle:v13 bundleName:v10 needsUnlock:a4])goto LABEL_22; {
  id v20 = objc_claimAutoreleasedReturnValue([(__MABuiltinBrainBundle__ *)v13 brainPath]);
  }
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v20 fileSystemRepresentation];

  id v21 = [v17 mutableCopy];
  [v21 setObject:v10 forKeyedSubscript:@"bundleId"];
  [v21 setObject:v9 forKeyedSubscript:@"bundlePath"];
  [v21 setObject:&off_10000D760 forKeyedSubscript:@"_CompatibilityVersion"];
  [v21 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"mobileassetd-uuid"];
  v22 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", [*(id *)(a1 + 40) getTrainName]));
  [v21 setObject:v22 forKeyedSubscript:@"mobileassetd-trainname"];

  [v21 removeObjectForKey:@"boot-session-uuid"];
  uint64_t v23 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:v21]);
  uint64_t v24 = *(void *)(*(void *)(a1 + 72) + 8);
  v25 = *(void **)(v24 + 40);
  *(void *)(v24 + 40) = v23;

  uint64_t v26 = 1;
LABEL_25:

  return v26;
}

uint64_t amfi_load_trust_cache(char a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7)
{
  v8[0] = 0xAAAAAAAAAAAAAAAALL;
  int v10 = -1431655766;
  int v13 = -1431655766;
  LOBYTE(v8[0]) = a1;
  v8[1] = a2;
  int v9 = a3;
  uint64_t v11 = a4;
  int v12 = a5;
  uint64_t v14 = a6;
  int v16 = -1431655766;
  int v15 = a7;
  return __sandbox_ms("AMFI", 101, v8);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_brainInfo(void *a1, const char *a2, ...)
{
  return [a1 brainInfo];
}

id objc_msgSend_brainPath(void *a1, const char *a2, ...)
{
  return [a1 brainPath];
}

id objc_msgSend_buildGroup(void *a1, const char *a2, ...)
{
  return [a1 buildGroup];
}

id objc_msgSend_bundleId(void *a1, const char *a2, ...)
{
  return [a1 bundleId];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_cryptexPath(void *a1, const char *a2, ...)
{
  return [a1 cryptexPath];
}

id objc_msgSend_currentBootOnlyTicketPath(void *a1, const char *a2, ...)
{
  return [a1 currentBootOnlyTicketPath];
}

id objc_msgSend_currentTargetPath(void *a1, const char *a2, ...)
{
  return [a1 currentTargetPath];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_getTrainName(void *a1, const char *a2, ...)
{
  return [a1 getTrainName];
}

id objc_msgSend_graftPath(void *a1, const char *a2, ...)
{
  return [a1 graftPath];
}

id objc_msgSend_graftdmgType(void *a1, const char *a2, ...)
{
  return [a1 graftdmgType];
}

id objc_msgSend_hasValidCurrentBootOnlyTicket(void *a1, const char *a2, ...)
{
  return [a1 hasValidCurrentBootOnlyTicket];
}

id objc_msgSend_isGloballySigned(void *a1, const char *a2, ...)
{
  return [a1 isGloballySigned];
}

id objc_msgSend_isGrafted(void *a1, const char *a2, ...)
{
  return [a1 isGrafted];
}

id objc_msgSend_isPersonalized(void *a1, const char *a2, ...)
{
  return [a1 isPersonalized];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadHistory(void *a1, const char *a2, ...)
{
  return [a1 loadHistory];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_primaryTicketPath(void *a1, const char *a2, ...)
{
  return [a1 primaryTicketPath];
}

id objc_msgSend_proposedTargetPath(void *a1, const char *a2, ...)
{
  return [a1 proposedTargetPath];
}

id objc_msgSend_restoreVersion(void *a1, const char *a2, ...)
{
  return [a1 restoreVersion];
}

id objc_msgSend_rootHashPath(void *a1, const char *a2, ...)
{
  return [a1 rootHashPath];
}

id objc_msgSend_sharedDevice(void *a1, const char *a2, ...)
{
  return [a1 sharedDevice];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_skipDescendants(void *a1, const char *a2, ...)
{
  return [a1 skipDescendants];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_ticketPath(void *a1, const char *a2, ...)
{
  return [a1 ticketPath];
}

id objc_msgSend_trustCachePath(void *a1, const char *a2, ...)
{
  return [a1 trustCachePath];
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToFile:x0 options:x1 error:x2];
}