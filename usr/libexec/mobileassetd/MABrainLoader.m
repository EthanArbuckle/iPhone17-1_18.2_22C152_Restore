@interface MABrainLoader
+ (id)sharedInstance;
- (BOOL)healthCheck:(id)a3;
- (BOOL)loadCryptex:(BOOL)a3 bundle:(id)a4 bundleName:(id)a5;
- (BOOL)loadTrustCache:(BOOL)a3 bundle:(id)a4 bundleName:(id)a5 needsUnlock:(BOOL *)a6;
- (BOOL)verify:(id)a3;
- (char)getTrainName;
- (int)run:(int)a3 argv:(char *)a4;
- (int)run:(int)a3 argv:(char *)a4 info:(id)a5 path:(const char *)a6;
- (void)loadHistory;
- (void)recordLaunch:(id)a3;
@end

@implementation MABrainLoader

+ (id)sharedInstance
{
  if (qword_1000105F8 != -1) {
    dispatch_once(&qword_1000105F8, &stru_10000C3A0);
  }
  return (id)qword_1000105F0;
}

- (BOOL)loadCryptex:(BOOL)a3 bundle:(id)a4 bundleName:(id)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  id v8 = a5;
  if (([v7 isPersonalized] & 1) == 0
    && ([v7 isGloballySigned] & 1) == 0
    && !v6)
  {
    id v9 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"MobileAssetBrain bundle %@ is not personalized, and unpersonalized brains are not allowed.", v8]);
    NSLog(@"[MAB] %s", [v9 UTF8String]);

    id v10 = 0;
LABEL_11:
    BOOL v14 = 0;
    goto LABEL_12;
  }
  if (v6) {
    CFStringRef v11 = @"MobileAssetBrain bundle %@ is personalized, but unpersonalized brains are also allowed.";
  }
  else {
    CFStringRef v11 = @"MobileAssetBrain bundle %@ is personalized.";
  }
  id v12 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v8));
  NSLog(@"[MAB] %s", [v12 UTF8String]);

  id v17 = 0;
  unsigned __int8 v13 = [v7 graft:&v17];
  id v10 = v17;
  if ((v13 & 1) == 0)
  {
    id v15 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"Error grafting MobileAssetBrain bundle %@: %@", v8, v10]);
    NSLog(@"[MAB] %s", [v15 UTF8String]);

    goto LABEL_11;
  }
  BOOL v14 = 1;
LABEL_12:

  return v14;
}

- (BOOL)loadTrustCache:(BOOL)a3 bundle:(id)a4 bundleName:(id)a5 needsUnlock:(BOOL *)a6
{
  LODWORD(v8) = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isPersonalized])
  {
    CFStringRef v11 = objc_claimAutoreleasedReturnValue([v9 trustCachePath]);
    id v40 = 0;
    id v12 = objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:v11 options:0 error:&v40]);
    id v13 = v40;

    if (v13)
    {
      BOOL v14 = objc_claimAutoreleasedReturnValue([v9 trustCachePath]);
      id v15 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"Error loading trust cache at %@: %@", v14, v13]);

      id v16 = v15;
      NSLog(@"[MAB] %s", [v16 UTF8String]);
    }
    else
    {
      v19 = objc_claimAutoreleasedReturnValue([v9 ticketPath]);
      id v39 = 0;
      id v16 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:v19 options:0 error:&v39]);
      id v13 = v39;

      if (v13)
      {
        v20 = objc_claimAutoreleasedReturnValue([v9 ticketPath]);
        uint64_t v21 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"Error loading Cryptex1 ticket at %@: %@", v20, v13]);

        v22 = (void *)v21;
      }
      else
      {
        if ((unint64_t)[v12 length] >> 32) {
          int v23 = 0;
        }
        else {
          int v23 = [v12 length];
        }
        if ((unint64_t)[v16 length] >> 32) {
          int v24 = 0;
        }
        else {
          int v24 = [v16 length];
        }
        if (v12 && v23 && v16 && v24)
        {
          unsigned int v38 = [v9 hasValidCurrentBootOnlyTicket];
          id v25 = [v12 bytes];
          id v16 = v16;
          id v26 = [v16 bytes];
          if (v38) {
            char v27 = 24;
          }
          else {
            char v27 = 17;
          }
          int trust_cache = amfi_load_trust_cache(v27, (uint64_t)v25, v23, (uint64_t)v26, v24, 0, 0);
          v29 = __error();
          if (trust_cache)
          {
            uint64_t v30 = *v29;
            int v31 = sub_100004CAC();
            v32 = strerror(v30);
            if (v31)
            {
              id v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"Failed to load trust cache for MobileAssetBrain bundle %@ perhaps due to locked device state: errno=%d (%s)", v10, v30, v32]);
              NSLog(@"[MAB] %s", [v8 UTF8String]);

              LOBYTE(v8) = 0;
              *a6 = 1;
LABEL_28:

              goto LABEL_29;
            }
            id v36 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"Failed to load trust cache for MobileAssetBrain bundle %@: errno=%d (%s)", v10, v30, v32]);
            NSLog(@"[MAB] %s", [v36 UTF8String]);

            if (!v8) {
              goto LABEL_28;
            }
            v35 = +[NSString stringWithFormat:@"Proceeding because unpersonalized brains are allowed.", v37];
          }
          else
          {
            v35 = +[NSString stringWithFormat:@"Successfully loaded trust cache for MobileAssetBrain bundle %@", v10];
          }
          id v8 = objc_claimAutoreleasedReturnValue(v35);
          NSLog(@"[MAB] %s", [v8 UTF8String]);

          LOBYTE(v8) = 1;
          goto LABEL_28;
        }
        v22 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"Trust cache and/or ticket for MobileAssetBrain bundle %@ are invalid\ntrustCache=%@\nticket=%@", v10, v12, v16]);
      }
      id v33 = v22;
      NSLog(@"[MAB] %s", [v33 UTF8String]);
    }
    LOBYTE(v8) = 0;
    goto LABEL_28;
  }
  if (v8)
  {
    id v17 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"MobileAssetBrain bundle %@ is not personalized, but unpersonalized brains are allowed.", v10]);
    NSLog(@"[MAB] %s", [v17 UTF8String]);

    LOBYTE(v8) = 1;
  }
  else
  {
    id v18 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"MobileAssetBrain bundle %@ is not personalized, and unpersonalized brains are not allowed.", v10]);
    NSLog(@"[MAB] %s", [v18 UTF8String]);

    LOBYTE(v8) = 0;
  }
LABEL_29:

  return (char)v8;
}

- (void)loadHistory
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006EE8;
  block[3] = &unk_10000C3C8;
  block[4] = self;
  if (qword_100010600 != -1) {
    dispatch_once(&qword_100010600, block);
  }
}

- (BOOL)healthCheck:(id)a3
{
  v4 = objc_claimAutoreleasedReturnValue([a3 bundleId]);
  v5 = objc_claimAutoreleasedReturnValue([(NSMutableDictionary *)self->_history objectForKeyedSubscript:@"LaunchRecords"]);
  BOOL v6 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  if (v6)
  {
    id v7 = (char *)[v6 count];
    id v8 = objc_claimAutoreleasedReturnValue(+[NSDate date]);
    if (v7)
    {
      unint64_t v30 = (unint64_t)v7;
      int v31 = v4;
      id v9 = 0;
      unint64_t v10 = 0;
      CFStringRef v11 = v7 - 1;
      double v12 = 0.0;
      do
      {
        id v13 = v9;
        id v9 = (id)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:v11]);

        BOOL v14 = objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"LaunchDate"]);
        uint64_t v15 = objc_opt_class(NSDate);
        if (objc_opt_isKindOfClass(v14, v15))
        {
          [v8 timeIntervalSinceDate:v14];
          double v12 = v16;
          if (v16 <= 60.0) {
            ++v10;
          }
        }
        else
        {
          id v17 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"Invalid %@ field in launch record:\n%@", @"LaunchDate", v9]);
          NSLog(@"[MAB] %s", [v17 UTF8String]);
        }
        --v11;
      }
      while (v11 != (char *)-1);
      if (v10 >= 3)
      {
        v4 = v31;
        id v18 = +[NSString stringWithFormat:@"MobileAssetBrain bundle %@ has been relaunched %lu time%s in the last %0.1f seconds. This is unhealthy!", v31, v10, "s", 0x404E000000000000];
LABEL_25:
        int v23 = objc_claimAutoreleasedReturnValue(v18);
        BOOL v19 = 0;
        goto LABEL_26;
      }
      v4 = v31;
      if (v12 >= 3600.0)
      {
        double v20 = (double)v30 / v12;
        if (v20 >= 0.00111111111)
        {
          int v24 = "s";
          if (v20 * 3600.0 == 1.0) {
            int v24 = "";
          }
          id v18 = +[NSString stringWithFormat:@"MobileAssetBrain bundle %@ has been relaunched on average %0.1f time%s per hour. This is unhealthy!", v31, v20 * 3600.0, v24, v29];
          goto LABEL_25;
        }
      }
      if (v10)
      {
        uint64_t v21 = "s";
        if (v10 == 1) {
          uint64_t v21 = "";
        }
        v22 = +[NSString stringWithFormat:@"MobileAssetBrain bundle %@ has been relaunched %lu time%s in the last %0.1f seconds.", v31, v10, v21, 0x404E000000000000];
        goto LABEL_21;
      }
    }
    else
    {
      id v9 = 0;
    }
    v22 = +[NSString stringWithFormat:@"MobileAssetBrain bundle %@ appears to be healthy.", v4, v27, v28, v29];
LABEL_21:
    int v23 = objc_claimAutoreleasedReturnValue(v22);
    BOOL v19 = 1;
LABEL_26:
    id v25 = v23;
    NSLog(@"[MAB] %s", [v25 UTF8String]);

    goto LABEL_27;
  }
  id v9 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"There are no launch records for MobileAssetBrain bundle %@", v4]);
  NSLog(@"[MAB] %s", [v9 UTF8String]);
  BOOL v19 = 1;
LABEL_27:

  return v19;
}

- (BOOL)verify:(id)a3
{
  id v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue([v4 bundleId]);
  BOOL v6 = objc_claimAutoreleasedReturnValue([v4 graftPath]);
  id v7 = objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:@"/System/Library/CoreServices/RestoreVersion.plist"]);

  id v8 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:v7]);
  id v27 = 0;
  id v9 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:v8 error:&v27]);
  id v10 = v27;

  if (v9)
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"RestoreLongVersion"]);
    double v12 = objc_claimAutoreleasedReturnValue(+[SUCoreDevice sharedDevice]);
    id v13 = objc_claimAutoreleasedReturnValue([v12 restoreVersion]);

    if (v11 && v13)
    {
      id v14 = [objc_alloc((Class)SUCoreRestoreVersion) initWithRestoreVersion:v11];
      id v15 = [objc_alloc((Class)SUCoreRestoreVersion) initWithRestoreVersion:v13];
      double v16 = v15;
      if (v14 && v15)
      {
        if (([v15 isComparable:v14] & 1) == 0 && (sub_100004998() & 1) == 0)
        {
          id v17 = [NSString stringWithFormat:@"MobileAssetBrain bundle %@ is from a different build group than the OS. (%ld -> %ld)", v5, [v16 buildGroup], objc_msgSend(v14, "buildGroup")];
          goto LABEL_26;
        }
        if ([v16 isComparable:v14])
        {
          if ([v16 compare:v14] == (id)1)
          {
            id v17 = +[NSString stringWithFormat:@"MobileAssetBrain bundle %@ is older than current OS: %@ < %@", v5, v11, v13];
            goto LABEL_26;
          }
        }
        else
        {
          id v26 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"MobileAssetBrain bundle %@ is from a different build group than the OS, but cross build group brains are allowed. (%ld -> %ld)", v5, [v16 buildGroup], [v14 buildGroup]));
          NSLog(@"[MAB] %s", [v26 UTF8String]);
        }
        if (sub_1000049D0())
        {
          id v21 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"MABrain health check is disabled."]);
          NSLog(@"[MAB] %s", [v21 UTF8String]);

          BOOL v18 = 1;
        }
        else
        {
          BOOL v18 = [(MABrainLoader *)self healthCheck:v4];
        }
        goto LABEL_28;
      }
      if (!v14)
      {
        id v19 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"MobileAssetBrain bundle %@ RestoreVersion string is invalid: %@", v5, v11]);
        NSLog(@"[MAB] %s", [v19 UTF8String]);
      }
      if (v16) {
        goto LABEL_27;
      }
      id v17 = +[NSString stringWithFormat:@"System RestoreVersion string is invalid: %@", v13, v24, v25];
LABEL_26:
      id v22 = objc_claimAutoreleasedReturnValue(v17);
      NSLog(@"[MAB] %s", [v22 UTF8String]);

LABEL_27:
      BOOL v18 = 0;
LABEL_28:

      goto LABEL_29;
    }
    if (v11)
    {
      if (v13)
      {
LABEL_14:
        BOOL v18 = 0;
LABEL_30:

        goto LABEL_31;
      }
    }
    else
    {
      id v20 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"MobileAssetBrain bundle %@ RestoreVersion string is nil", v5]);
      NSLog(@"[MAB] %s", [v20 UTF8String]);

      if (v13) {
        goto LABEL_14;
      }
    }
    id v14 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"System RestoreVersion string is nil"]);
    NSLog(@"[MAB] %s", [v14 UTF8String]);
    BOOL v18 = 0;
LABEL_29:

    goto LABEL_30;
  }
  id v11 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"MobileAssetBrain bundle %@ RestoreVersion.plist could not be loaded: %@", v5, v10]);
  NSLog(@"[MAB] %s", [v11 UTF8String]);
  BOOL v18 = 0;
LABEL_31:

  return v18;
}

- (void)recordLaunch:(id)a3
{
  id v4 = (__CFString *)a3;
  v5 = v4;
  BOOL v6 = @"built-in";
  if (v4) {
    BOOL v6 = v4;
  }
  id v7 = v6;
  id v8 = objc_claimAutoreleasedReturnValue([(NSMutableDictionary *)self->_history objectForKeyedSubscript:@"LaunchRecords"]);
  id v9 = [v8 mutableCopy];
  id v10 = v9;
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = objc_alloc_init((Class)NSMutableDictionary);
  }
  double v12 = v11;

  id v13 = objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v7]);
  id v14 = objc_alloc_init((Class)NSMutableArray);
  id v15 = objc_alloc_init((Class)NSMutableDictionary);
  double v16 = (char *)[v13 count];
  id v17 = v16;
  if ((unint64_t)v16 < 0x33)
  {
    BOOL v18 = 0;
  }
  else
  {
    BOOL v18 = v16 - 50;
    if (v5) {
      id v19 = +[NSString stringWithFormat:@"Only preserving the last %d launch records for MobileAssetBrain bundle %@", 50, v5];
    }
    else {
      id v19 = +[NSString stringWithFormat:@"Only preserving the last %d launch records for built-in MobileAssetBrain", 50, v34];
    }
    id v20 = objc_claimAutoreleasedReturnValue(v19);
    NSLog(@"[MAB] %s", [v20 UTF8String]);
  }
  if (v18 < v17)
  {
    do
    {
      id v21 = objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:v18]);
      [v14 addObject:v21];

      ++v18;
    }
    while (v17 != v18);
  }
  id v22 = objc_claimAutoreleasedReturnValue(+[NSDate date]);
  [v15 setObject:v22 forKeyedSubscript:@"LaunchDate"];

  int v23 = +[NSNumber numberWithInt:getpid()];
  uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
  [v15 setObject:v24 forKeyedSubscript:@"PID"];

  [v14 addObject:v15];
  [v12 setObject:v14 forKeyedSubscript:v7];
  [(NSMutableDictionary *)self->_history setObject:v12 forKeyedSubscript:@"LaunchRecords"];
  history = self->_history;
  id v36 = 0;
  id v26 = objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:history format:100 options:0 error:&v36]);
  id v27 = v36;
  uint64_t v28 = v27;
  if (v26)
  {
    id v35 = v27;
    unsigned int v29 = [v26 writeToFile:@"/private/var/run/com.apple.mobileassetd-MobileAssetBrain" options:0 error:&v35];
    id v30 = v35;

    if (v29) {
      int v31 = +[NSString stringWithFormat:@"Successfully updated launch history with new record:\n%@", v15];
    }
    else {
      int v31 = +[NSString stringWithFormat:@"Could not write launch history: %@", v30];
    }
    v32 = objc_claimAutoreleasedReturnValue(v31);
  }
  else
  {
    v32 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"Could not serialize launch history: %@", v27]);
    id v30 = v28;
  }
  id v33 = v32;
  NSLog(@"[MAB] %s", [v33 UTF8String]);
}

- (int)run:(int)a3 argv:(char *)a4 info:(id)a5 path:(const char *)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a5;
  id v12 = [v10 mutableCopy];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007D34;
  block[3] = &unk_10000C3F0;
  block[4] = self;
  id v13 = v10;
  id v28 = v13;
  if (qword_100010608 != -1) {
    dispatch_once(&qword_100010608, block);
  }
  id v14 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:a6]);
  [v12 setObject:v14 forKeyedSubscript:@"libmobileassetd-path"];

  [v12 setObject:&__kCFBooleanTrue forKeyedSubscript:@"allow-st-extractor-plugin"];
  id v15 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"Attempting to load MobileAssetBrain at %s", a6]);
  NSLog(@"[MAB] %s", [v15 UTF8String]);

  double v16 = dlopen(a6, 261);
  if (v16)
  {
    id v17 = v16;
    BOOL v18 = (uint64_t (*)(uint64_t, char **, uint64_t))dlsym(v16, "mobileassetd_main");
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:v12]);

      int v21 = v19(v8, a4, v20);
      id v13 = (id)v20;
    }
    else
    {
      uint64_t v24 = +[NSString stringWithFormat:@"Failed to find MobileAssetBrain entry point: %s", dlerror()];
      id v25 = objc_claimAutoreleasedReturnValue(v24);
      NSLog(@"[MAB] %s", [v25 UTF8String]);

      int v21 = 1;
    }
    dlclose(v17);
  }
  else
  {
    id v22 = +[NSString stringWithFormat:@"Failed to load MobileAssetBrain: %s", dlerror()];
    id v23 = objc_claimAutoreleasedReturnValue(v22);
    NSLog(@"[MAB] %s", [v23 UTF8String]);

    int v21 = 1;
  }

  return v21;
}

- (char)getTrainName
{
  if (qword_100010610 != -1) {
    dispatch_once(&qword_100010610, &stru_10000C410);
  }
  return (char *)qword_100010618;
}

- (int)run:(int)a3 argv:(char *)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v74 = 0;
  v75 = &v74;
  uint64_t v76 = 0x2020000000;
  uint64_t v77 = 0;
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x3032000000;
  v71 = sub_100008750;
  v72 = sub_100008760;
  id v73 = 0;
  id v6 = sub_100004A08();
  uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = (void *)v7;
  id v9 = @"<unknown>";
  if (v7) {
    id v9 = (__CFString *)v7;
  }
  id v10 = v9;

  __int16 v67 = 0;
  [(MABrainLoader *)self loadHistory];
  if (sub_100004944())
  {
    uint64_t v63 = 0;
    v64 = &v63;
    uint64_t v65 = 0x2020000000;
    char v66 = 0;
    id v11 = sub_100004B1C();
    id v12 = objc_claimAutoreleasedReturnValue(v11);
    char v13 = sub_10000490C();
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_100008768;
    v55[3] = &unk_10000C438;
    v59 = &v63;
    id v48 = v12;
    id v56 = v48;
    v57 = self;
    char v62 = v13;
    v60 = &v74;
    v58 = v10;
    v61 = &v68;
    id v14 = objc_retainBlock(v55);
    id v15 = objc_claimAutoreleasedReturnValue(+[__MABuiltinBrainBundle__ proposedTargetPath]);
    id v54 = 0;
    unsigned __int8 v16 = +[__MABuiltinBrainBundle__ destageProposed:&v54];
    id v17 = v54;
    if ((v16 & 1) == 0)
    {
      id v18 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"Error de-staging proposed MobileAssetBrain: %@", v17, v48, context]);
      NSLog(@"[MAB] %s", [v18 UTF8String]);
    }
    if (((unsigned int (*)(void *, const __CFString *, void *, char *))v14[2])(v14, @"Proposed", v15, (char *)&v67 + 1))
    {
      id v19 = [(id)v69[5] mutableCopy];
      [v19 setObject:&__kCFBooleanTrue forKeyedSubscript:@"commit"];
      id v20 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"Info dict for proposed brain is %@", v19]);
      NSLog(@"[MAB] %s", [v20 UTF8String]);

      [(MABrainLoader *)self run:v4 argv:a4 info:v19 path:v75[3]];
      goto LABEL_15;
    }
    if (HIBYTE(v67))
    {
      id v53 = v17;
      unsigned __int8 v21 = +[__MABuiltinBrainBundle__ stageProposed:v15 error:&v53];
      id v22 = v53;

      if ((v21 & 1) == 0)
      {
        id v23 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"Error re-staging proposed MobileAssetBrain for post unlock: %@", v22]);
        NSLog(@"[MAB] %s", [v23 UTF8String]);

        HIBYTE(v67) = 0;
      }
    }
    else
    {
      if (!*((unsigned char *)v64 + 24)) {
        goto LABEL_15;
      }
      uint64_t v24 = objc_claimAutoreleasedReturnValue([v15 lastPathComponent]);
      id v25 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"Proposed MobileAssetBrain bundle %@ requires a reboot", v24]);

      id v26 = v25;
      NSLog(@"[MAB] %s", [v26 UTF8String]);

      id v52 = v17;
      LOBYTE(v26) = +[__MABuiltinBrainBundle__ stageProposed:v15 error:&v52];
      id v22 = v52;

      if ((v26 & 1) == 0)
      {
        id v27 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"Error re-staging proposed MobileAssetBrain for post reboot: %@", v22]);
        NSLog(@"[MAB] %s", [v27 UTF8String]);
      }
    }
    id v17 = v22;
LABEL_15:
    id v28 = objc_claimAutoreleasedReturnValue(+[__MABuiltinBrainBundle__ currentTargetPath]);

    if (((unsigned int (*)(void *, const __CFString *, void *, __int16 *))v14[2])(v14, @"Current", v28, &v67))
    {
      id v29 = [(id)v69[5] mutableCopy];
      id v30 = v29;
      if (HIBYTE(v67)) {
        [v29 setObject:&__kCFBooleanTrue forKeyedSubscript:@"relaunch-on-unlock"];
      }
      id v31 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"Info dict for current brain is %@", v30]);
      NSLog(@"[MAB] %s", [v31 UTF8String]);

      [(MABrainLoader *)self run:v4 argv:a4 info:v30 path:v75[3]];
    }
    else
    {
      if (!v28 || (_BYTE)v67) {
        goto LABEL_20;
      }
      v44 = objc_claimAutoreleasedReturnValue([v28 lastPathComponent]);
      uint64_t v45 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"Current MobileAssetBrain bundle %@ is no longer viable", v44]);

      id v46 = (id) v45;
      NSLog(@"[MAB] %s", [v46 UTF8String]);

      id v51 = v17;
      LOBYTE(v45) = +[__MABuiltinBrainBundle__ destageCurrent:&v51];
      id v47 = v51;

      if (v45)
      {
        id v17 = v47;
        goto LABEL_20;
      }
      id v30 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"Error de-staging current MobileAssetBrain: %@", v47]);
      NSLog(@"[MAB] %s", [v30 UTF8String]);
      id v17 = v47;
    }

LABEL_20:
    _Block_object_dispose(&v63, 8);
  }
  id v32 = [@"/usr/lib/libmobileassetd.dylib" fileSystemRepresentation];
  v75[3] = (uint64_t)v32;
  uint64_t v33 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"%s", [(MABrainLoader *)self getTrainName]]);
  uint64_t v34 = (void *)v33;
  if (v33)
  {
    v80[0] = @"built-in";
    v80[1] = @"_CompatibilityVersion";
    v81[0] = &__kCFBooleanTrue;
    v81[1] = &off_10000D760;
    v80[2] = @"mobileassetd-uuid";
    v80[3] = @"mobileassetd-trainname";
    v81[2] = v10;
    v81[3] = v33;
    uint64_t v35 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:v81 forKeys:v80 count:4]);
  }
  else
  {
    id v36 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"Unable to determine train name"]);
    NSLog(@"[MAB] %s", [v36 UTF8String]);

    v78[0] = @"built-in";
    v78[1] = @"_CompatibilityVersion";
    v79[0] = &__kCFBooleanTrue;
    v79[1] = &off_10000D760;
    v78[2] = @"mobileassetd-uuid";
    v79[2] = v10;
    uint64_t v35 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:v79 forKeys:v78 count:3]);
  }
  uint64_t v37 = (void *)v69[5];
  v69[5] = v35;

  id v38 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"Info dict for builtin brain is %@", v69[5]]);
  NSLog(@"[MAB] %s", [v38 UTF8String]);

  if (HIBYTE(v67) | v67)
  {
    id v39 = [(id)v69[5] mutableCopy];
    [v39 setObject:&__kCFBooleanTrue forKeyedSubscript:@"relaunch-on-unlock"];
    uint64_t v40 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:v39]);
    v41 = (void *)v69[5];
    v69[5] = v40;
  }
  int v42 = [(MABrainLoader *)self run:v4 argv:a4 info:v69[5] path:v75[3]];

  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v74, 8);
  return v42;
}

- (void).cxx_destruct
{
}

@end