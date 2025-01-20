@interface MIIPAPatcherManifest
+ (id)_arrayFromPlistRepresentation:(id)a3 key:(id)a4 sub:(id)a5 index:(unint64_t)a6 withError:(id *)a7;
+ (id)_manifestErrorForKey:(id)a3 sub:(id)a4 index:(int64_t)a5 expected:(id)a6 value:(id)a7;
+ (id)_manifestFromPlistRepresentationV1:(id)a3 withError:(id *)a4;
+ (id)_numberFromPlistRepresentation:(id)a3 key:(id)a4 sub:(id)a5 index:(unint64_t)a6 withError:(id *)a7;
+ (id)_stringFromPlistRepresentation:(id)a3 key:(id)a4 sub:(id)a5 index:(unint64_t)a6 withError:(id *)a7;
+ (id)_targetsFromPlistRepresentationV1:(id)a3 withError:(id *)a4;
+ (id)manifestFromFileURL:(id)a3 fmRead:(id)a4 withError:(id *)a5;
+ (id)manifestFromFileURL:(id)a3 withError:(id *)a4;
+ (id)manifestFromPlistRepresentation:(id)a3 withError:(id *)a4;
- (BOOL)writeToFileURL:(id)a3 withError:(id *)a4;
- (MIIPAPatcherManifest)initWithCommandLineArgs:(id)a3 targets:(id)a4 toolVersion:(id)a5 toolArch:(id)a6 toolBuiltWithSDKVersion:(id)a7 toolBuiltWithXcodeVersion:(id)a8 hostVersion:(id)a9;
- (MIIPAPatcherWriteable)fmWrite;
- (NSArray)commandLineArgs;
- (NSArray)targets;
- (NSNumber)manifestVersion;
- (NSString)hostVersion;
- (NSString)toolArch;
- (NSString)toolBuiltWithSDKVersion;
- (NSString)toolBuiltWithXcodeVersion;
- (NSString)toolVersion;
- (id)plistRepresentation;
- (void)setFmWrite:(id)a3;
@end

@implementation MIIPAPatcherManifest

- (MIIPAPatcherManifest)initWithCommandLineArgs:(id)a3 targets:(id)a4 toolVersion:(id)a5 toolArch:(id)a6 toolBuiltWithSDKVersion:(id)a7 toolBuiltWithXcodeVersion:(id)a8 hostVersion:(id)a9
{
  id v26 = a3;
  id v25 = a4;
  id v24 = a5;
  id v23 = a6;
  id v22 = a7;
  id v16 = a8;
  id v17 = a9;
  v27.receiver = self;
  v27.super_class = (Class)MIIPAPatcherManifest;
  v18 = [(MIIPAPatcherManifest *)&v27 init];
  if (v18)
  {
    uint64_t v19 = +[MIIPAPatcherFileManager defaultManager];
    fmWrite = v18->_fmWrite;
    v18->_fmWrite = (MIIPAPatcherWriteable *)v19;

    objc_storeStrong((id *)&v18->_manifestVersion, (id)qword_1000A5F70);
    objc_storeStrong((id *)&v18->_commandLineArgs, a3);
    objc_storeStrong((id *)&v18->_targets, a4);
    objc_storeStrong((id *)&v18->_toolVersion, a5);
    objc_storeStrong((id *)&v18->_toolArch, a6);
    objc_storeStrong((id *)&v18->_toolBuiltWithSDKVersion, a7);
    objc_storeStrong((id *)&v18->_toolBuiltWithXcodeVersion, a8);
    objc_storeStrong((id *)&v18->_hostVersion, a9);
  }

  return v18;
}

+ (id)manifestFromPlistRepresentation:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  id v7 = v6;
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  if (v8)
  {
    id v18 = 0;
    v9 = [a1 _manifestFromPlistRepresentationV1:v7 withError:&v18];
    id v10 = v18;
    if (!a4) {
      goto LABEL_10;
    }
  }
  else
  {
    v19[0] = NSLocalizedDescriptionKey;
    id v11 = objc_alloc((Class)NSString);
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    id v14 = [v11 initWithFormat:@"Invalid manifest, expected NSDictionary, got [%@]", v13];
    v20[0] = v14;
    v20[1] = &off_100096FA0;
    v19[1] = @"line";
    v19[2] = @"function";
    v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[MIIPAPatcherManifest manifestFromPlistRepresentation:withError:]");
    v20[2] = v15;
    id v16 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:3];
    id v10 = +[NSError errorWithDomain:@"com.apple.MIIPAPatcher" code:7 userInfo:v16];

    v9 = 0;
    if (!a4) {
      goto LABEL_10;
    }
  }
  if (!v9) {
    *a4 = v10;
  }
LABEL_10:

  return v9;
}

+ (id)manifestFromFileURL:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v7 = +[MIIPAPatcherFileManager defaultManager];
  id v8 = [a1 manifestFromFileURL:v6 fmRead:v7 withError:a4];

  return v8;
}

+ (id)manifestFromFileURL:(id)a3 fmRead:(id)a4 withError:(id *)a5
{
  id v12 = 0;
  id v6 = [a4 plistRepresentationFromFileURL:a3 withError:&v12];
  id v7 = v12;
  if (v6)
  {
    id v11 = v7;
    id v8 = +[MIIPAPatcherManifest manifestFromPlistRepresentation:v6 withError:&v11];
    id v9 = v11;

    id v7 = v9;
    if (!a5) {
      goto LABEL_7;
    }
  }
  else
  {
    id v8 = 0;
    if (!a5) {
      goto LABEL_7;
    }
  }
  if (!v8) {
    *a5 = v7;
  }
LABEL_7:

  return v8;
}

- (id)plistRepresentation
{
  id v3 = objc_alloc((Class)NSMutableArray);
  v4 = [(MIIPAPatcherManifest *)self targets];
  id v5 = [v3 initWithCapacity:[v4 count]];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = [(MIIPAPatcherManifest *)self targets];
  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v22 + 1) + 8 * i) plistRepresentation];
        [v5 addObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v8);
  }

  v26[0] = @"version";
  id v12 = [(MIIPAPatcherManifest *)self manifestVersion];
  v27[0] = v12;
  v26[1] = @"commandLineArgs";
  v13 = [(MIIPAPatcherManifest *)self commandLineArgs];
  v27[1] = v13;
  v26[2] = @"targets";
  id v14 = [v5 copy];
  v27[2] = v14;
  v26[3] = @"toolVersion";
  v15 = [(MIIPAPatcherManifest *)self toolVersion];
  v27[3] = v15;
  v26[4] = @"toolArch";
  id v16 = [(MIIPAPatcherManifest *)self toolArch];
  v27[4] = v16;
  v26[5] = @"toolBuiltWithSDKVersion";
  id v17 = [(MIIPAPatcherManifest *)self toolBuiltWithSDKVersion];
  v27[5] = v17;
  v26[6] = @"toolBuiltWithXcodeVersion";
  id v18 = [(MIIPAPatcherManifest *)self toolBuiltWithXcodeVersion];
  v27[6] = v18;
  v26[7] = @"hostVersion";
  uint64_t v19 = [(MIIPAPatcherManifest *)self hostVersion];
  v27[7] = v19;
  v20 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:8];

  return v20;
}

- (BOOL)writeToFileURL:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v7 = [(MIIPAPatcherManifest *)self plistRepresentation];
  id v8 = [(MIIPAPatcherManifest *)self fmWrite];
  LOBYTE(a4) = [v8 writePlistRepresentation:v7 toFileURL:v6 mode:384 withError:a4];

  return (char)a4;
}

+ (id)_manifestErrorForKey:(id)a3 sub:(id)a4 index:(int64_t)a5 expected:(id)a6 value:(id)a7
{
  id v25 = a3;
  id v11 = (__CFString *)a4;
  id v12 = a6;
  id v13 = a7;
  id v14 = &stru_10008EEE8;
  if (v11) {
    v15 = v11;
  }
  else {
    v15 = &stru_10008EEE8;
  }
  id v16 = v15;
  if ((a5 & 0x8000000000000000) == 0)
  {
    id v14 = +[NSString stringWithFormat:@" at index %lu", a5];
  }
  v26[0] = NSLocalizedDescriptionKey;
  id v17 = objc_alloc((Class)NSString);
  id v18 = (objc_class *)objc_opt_class();
  uint64_t v19 = NSStringFromClass(v18);
  id v20 = [v17 initWithFormat:@"Invalid manifest %@key [%@]%@. Expected [%@], got [%@].", v16, v25, v14, v12, v19];
  v27[0] = v20;
  v27[1] = &off_100096FB8;
  v26[1] = @"line";
  v26[2] = @"function";
  v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[MIIPAPatcherManifest _manifestErrorForKey:sub:index:expected:value:]");
  v27[2] = v21;
  long long v22 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3];
  long long v23 = +[NSError errorWithDomain:@"com.apple.MIIPAPatcher" code:5 userInfo:v22];

  return v23;
}

+ (id)_arrayFromPlistRepresentation:(id)a3 key:(id)a4 sub:(id)a5 index:(unint64_t)a6 withError:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = [a3 objectForKeyedSubscript:v12];
  objc_opt_class();
  id v15 = v14;
  if (objc_opt_isKindOfClass()) {
    id v16 = v15;
  }
  else {
    id v16 = 0;
  }

  if (a7 && !v16)
  {
    *a7 = [a1 _manifestErrorForKey:v12 sub:v13 index:a6 expected:@"NSArray" value:v15];
  }

  return v16;
}

+ (id)_stringFromPlistRepresentation:(id)a3 key:(id)a4 sub:(id)a5 index:(unint64_t)a6 withError:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = [a3 objectForKeyedSubscript:v12];
  objc_opt_class();
  id v15 = v14;
  if (objc_opt_isKindOfClass()) {
    id v16 = v15;
  }
  else {
    id v16 = 0;
  }

  if (a7 && !v16)
  {
    *a7 = [a1 _manifestErrorForKey:v12 sub:v13 index:a6 expected:@"NSString" value:v15];
  }

  return v16;
}

+ (id)_numberFromPlistRepresentation:(id)a3 key:(id)a4 sub:(id)a5 index:(unint64_t)a6 withError:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = [a3 objectForKeyedSubscript:v12];
  objc_opt_class();
  id v15 = v14;
  if (objc_opt_isKindOfClass()) {
    id v16 = v15;
  }
  else {
    id v16 = 0;
  }

  if (a7 && !v16)
  {
    *a7 = [a1 _manifestErrorForKey:v12 sub:v13 index:a6 expected:@"NSNumber" value:v15];
  }

  return v16;
}

+ (id)_manifestFromPlistRepresentationV1:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v31 = 0;
  id v7 = [a1 _numberFromPlistRepresentation:v6 key:@"version" sub:0 index:-1 withError:&v31];
  id v8 = v31;
  id v9 = v8;
  id obj = v7;
  if (v7)
  {
    id v20 = a4;
    id v30 = v8;
    id v10 = [a1 _arrayFromPlistRepresentation:v6 key:@"commandLineArgs" sub:0 index:-1 withError:&v30];
    id v11 = v30;

    if (!v10)
    {
      v21 = 0;
      id v12 = 0;
      id v14 = 0;
      id v15 = 0;
LABEL_15:
      id v13 = 0;
LABEL_16:
      id v7 = 0;
      goto LABEL_17;
    }
    objc_opt_class();
    if (sub_100014D8C(v10))
    {
      id v29 = v11;
      id v12 = [a1 _arrayFromPlistRepresentation:v6 key:@"targets" sub:0 index:-1 withError:&v29];
      id v9 = v29;

      if (v12)
      {
        id v28 = v9;
        id v13 = [a1 _targetsFromPlistRepresentationV1:v12 withError:&v28];
        id v11 = v28;

        if (!v13)
        {
          v21 = 0;
          id v14 = 0;
          id v15 = 0;
          goto LABEL_16;
        }
        id v27 = v11;
        id v14 = [a1 _stringFromPlistRepresentation:v6 key:@"toolVersion" sub:0 index:-1 withError:&v27];
        id v9 = v27;

        v21 = v13;
        if (v14)
        {
          id v26 = v9;
          id v15 = [a1 _stringFromPlistRepresentation:v6 key:@"toolArch" sub:0 index:-1 withError:&v26];
          id v11 = v26;

          if (v15)
          {
            id v25 = v11;
            id v13 = [a1 _stringFromPlistRepresentation:v6 key:@"toolBuiltWithSDKVersion" sub:0 index:-1 withError:&v25];
            id v9 = v25;

            if (v13)
            {
              id v24 = v9;
              id v7 = [a1 _stringFromPlistRepresentation:v6 key:@"toolBuiltWithXcodeVersion" sub:0 index:-1 withError:&v24];
              id v11 = v24;

              if (v7)
              {
                id v23 = v11;
                id v16 = [a1 _stringFromPlistRepresentation:v6 key:@"hostVersion" sub:0 index:-1 withError:&v23];
                id v9 = v23;

                if (v16)
                {
                  a4 = [[MIIPAPatcherManifest alloc] initWithCommandLineArgs:v10 targets:v21 toolVersion:v14 toolArch:v15 toolBuiltWithSDKVersion:v13 toolBuiltWithXcodeVersion:v7 hostVersion:v16];
                  objc_storeStrong(a4 + 2, obj);
                  goto LABEL_25;
                }
LABEL_23:
                a4 = v20;
                if (v20) {
                  goto LABEL_24;
                }
LABEL_13:
                id v16 = 0;
                goto LABEL_25;
              }
LABEL_17:
              id v9 = v11;
              goto LABEL_23;
            }
LABEL_22:
            id v7 = 0;
            goto LABEL_23;
          }
          goto LABEL_15;
        }
LABEL_21:
        id v15 = 0;
        id v13 = 0;
        goto LABEL_22;
      }
      v21 = 0;
    }
    else
    {
      id v17 = [v6 objectForKeyedSubscript:@"commandLineArgs"];
      id v9 = [a1 _manifestErrorForKey:@"commandLineArgs" sub:0 index:-1 expected:@"NSArray<NSString>" value:v17];

      v21 = 0;
      id v12 = 0;
    }
    id v14 = 0;
    goto LABEL_21;
  }
  id v10 = 0;
  v21 = 0;
  id v12 = 0;
  id v14 = 0;
  id v15 = 0;
  id v13 = 0;
  if (!a4) {
    goto LABEL_13;
  }
LABEL_24:
  id v9 = v9;
  id v16 = 0;
  id v18 = a4;
  a4 = 0;
  id *v18 = v9;
LABEL_25:

  return a4;
}

+ (id)_targetsFromPlistRepresentationV1:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v7 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v6 count]];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v6;
  id v38 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
  id v8 = 0;
  if (!v38)
  {
LABEL_32:

    id v13 = [v7 copy];
    if (a4) {
      goto LABEL_37;
    }
    goto LABEL_39;
  }
  uint64_t v39 = *(void *)v48;
  uint64_t v40 = 0;
  uint64_t v33 = _kCFBundleShortVersionStringKey;
  id v31 = v7;
  id v37 = a1;
  id v29 = a4;
LABEL_3:
  id v9 = 0;
  while (1)
  {
    if (*(void *)v48 != v39) {
      objc_enumerationMutation(obj);
    }
    id v10 = *(void **)(*((void *)&v47 + 1) + 8 * (void)v9);
    objc_opt_class();
    id v11 = v10;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      uint64_t v12 = v40;
LABEL_35:
      uint64_t v27 = [a1 _manifestErrorForKey:@"targets" sub:@"target " index:v12 expected:@"NSDictionary" value:v11];

      id v13 = 0;
      id v8 = (id)v27;
      goto LABEL_36;
    }
    uint64_t v12 = v40;
    if (!v11) {
      goto LABEL_35;
    }
    id v46 = v8;
    id v13 = [a1 _stringFromPlistRepresentation:v11 key:kCFBundleVersionKey sub:@"target " index:v40 withError:&v46];
    id v14 = v46;

    if (!v13)
    {
      id v20 = 0;
      id v15 = 0;
      uint64_t v19 = 0;
      v21 = 0;
      int v22 = 0;
      int v35 = 1;
      id v8 = v14;
      id v23 = 0;
      goto LABEL_29;
    }
    id v45 = v14;
    id v15 = [a1 _stringFromPlistRepresentation:v11 key:v33 sub:@"target " index:v40 withError:&v45];
    id v8 = v45;

    if (!v15)
    {
      id v20 = 0;
      id v23 = 0;
      uint64_t v19 = 0;
      v21 = 0;
      int v22 = 0;
      int v35 = 1;
      goto LABEL_29;
    }
    id v34 = v13;
    id v44 = v8;
    uint64_t v16 = [a1 _stringFromPlistRepresentation:v11 key:kCFBundleIdentifierKey sub:@"target " index:v40 withError:&v44];
    id v17 = v44;

    v32 = (void *)v16;
    if (!v16)
    {
      id v20 = 0;
      uint64_t v19 = 0;
      v21 = 0;
      int v22 = 0;
      int v35 = 1;
      id v8 = v17;
      id v23 = 0;
LABEL_23:
      id v13 = v34;
      goto LABEL_29;
    }
    id v18 = [v11 objectForKeyedSubscript:@"UISupportedDevices"];

    if (!v18)
    {
      uint64_t v19 = 0;
      id v13 = v34;
      goto LABEL_19;
    }
    id v43 = v17;
    uint64_t v19 = [a1 _arrayFromPlistRepresentation:v11 key:@"UISupportedDevices" sub:0 index:v40 withError:&v43];
    id v8 = v43;

    if (!v19)
    {
      id v20 = 0;
      v21 = 0;
      int v22 = 0;
      int v35 = 1;
      id v23 = (void *)v16;
      goto LABEL_23;
    }
    objc_opt_class();
    id v13 = v34;
    if ((sub_100014D8C(v19) & 1) == 0)
    {
      uint64_t v26 = [v11 objectForKeyedSubscript:@"UISupportedDevices"];
      id v30 = [a1 _manifestErrorForKey:@"UISupportedDevices" sub:@"target " index:v40 expected:@"NSArray<NSString>" value:v26];

      id v25 = (void *)v26;
      id v20 = 0;
      v21 = 0;
      int v22 = 0;
      int v35 = 1;
      id v23 = v32;
      goto LABEL_26;
    }
    id v17 = v8;
LABEL_19:
    id v42 = v17;
    v21 = [a1 _stringFromPlistRepresentation:v11 key:@"infoPlistHash" sub:@"target " index:v40 withError:&v42];
    id v8 = v42;

    if (!v21)
    {
      id v20 = 0;
      int v22 = 0;
      int v35 = 1;
      id v23 = v32;
      goto LABEL_29;
    }
    id v41 = v8;
    uint64_t v24 = [a1 _stringFromPlistRepresentation:v11 key:@"infoPlistHashAlgorithm" sub:@"target " index:v40 withError:&v41];
    id v30 = v41;

    id v25 = (void *)v24;
    id v23 = v32;
    if (!v25)
    {
      id v20 = 0;
      int v22 = 0;
      int v35 = 1;
      goto LABEL_28;
    }
    id v20 = [[MIIPAPatcherManifestTarget alloc] initWithCFBundleVersion:v13 cfBundleShortVersion:v15 bundleIdentifier:v32 uiSupportedDevices:v19 infoPlistHash:v21 infoPlistHashAlgorithm:v25];
    [v31 addObject:v20];
    int v35 = 0;
    ++v40;
    int v22 = 1;
LABEL_26:

LABEL_28:
    id v8 = v30;
LABEL_29:

    if (!v22) {
      break;
    }
    id v9 = (char *)v9 + 1;
    a1 = v37;
    if (v38 == v9)
    {
      a4 = v29;
      id v7 = v31;
      id v38 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
      if (v38) {
        goto LABEL_3;
      }
      goto LABEL_32;
    }
  }

  if (!v35)
  {
    id v7 = v31;
    goto LABEL_39;
  }
  id v13 = 0;
LABEL_36:
  a4 = v29;
  id v7 = v31;
  if (!v29) {
    goto LABEL_39;
  }
LABEL_37:
  if (!v13)
  {
    id v8 = v8;
    *a4 = v8;
  }
LABEL_39:

  return v13;
}

- (MIIPAPatcherWriteable)fmWrite
{
  return self->_fmWrite;
}

- (void)setFmWrite:(id)a3
{
}

- (NSNumber)manifestVersion
{
  return self->_manifestVersion;
}

- (NSArray)commandLineArgs
{
  return self->_commandLineArgs;
}

- (NSArray)targets
{
  return self->_targets;
}

- (NSString)toolVersion
{
  return self->_toolVersion;
}

- (NSString)toolArch
{
  return self->_toolArch;
}

- (NSString)toolBuiltWithSDKVersion
{
  return self->_toolBuiltWithSDKVersion;
}

- (NSString)toolBuiltWithXcodeVersion
{
  return self->_toolBuiltWithXcodeVersion;
}

- (NSString)hostVersion
{
  return self->_hostVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostVersion, 0);
  objc_storeStrong((id *)&self->_toolBuiltWithXcodeVersion, 0);
  objc_storeStrong((id *)&self->_toolBuiltWithSDKVersion, 0);
  objc_storeStrong((id *)&self->_toolArch, 0);
  objc_storeStrong((id *)&self->_toolVersion, 0);
  objc_storeStrong((id *)&self->_targets, 0);
  objc_storeStrong((id *)&self->_commandLineArgs, 0);
  objc_storeStrong((id *)&self->_manifestVersion, 0);

  objc_storeStrong((id *)&self->_fmWrite, 0);
}

@end