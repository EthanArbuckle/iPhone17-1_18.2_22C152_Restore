@interface __MABuiltinBrainBundle__
+ (BOOL)destageCurrent:(id *)a3;
+ (BOOL)destageProposed:(id *)a3;
+ (BOOL)stageProposed:(id)a3 error:(id *)a4;
+ (id)currentTargetPath;
+ (id)proposedTargetPath;
+ (void)garbageCollect;
- (BOOL)graft:(id *)a3;
- (BOOL)hasValidCurrentBootOnlyTicket;
- (BOOL)isGloballySigned;
- (BOOL)isGrafted;
- (BOOL)isGraftedPath:(id)a3;
- (BOOL)isPersonalized;
- (BOOL)stageCurrent:(id *)a3;
- (BOOL)ungraft:(id *)a3;
- (NSDictionary)brainInfo;
- (NSString)brainPath;
- (NSString)bundleId;
- (NSString)bundlePath;
- (NSString)cryptexPath;
- (NSString)currentBootOnlyTicketPath;
- (NSString)graftPath;
- (NSString)primaryTicketPath;
- (NSString)rootHashPath;
- (NSString)ticketPath;
- (NSString)trustCachePath;
- (__MABuiltinBrainBundle__)initWithPath:(id)a3;
- (unsigned)graftdmgType;
@end

@implementation __MABuiltinBrainBundle__

+ (id)currentTargetPath
{
  return sub_10000505C(@".current");
}

+ (id)proposedTargetPath
{
  return sub_10000505C(@".proposed");
}

+ (BOOL)destageCurrent:(id *)a3
{
  v4 = objc_claimAutoreleasedReturnValue([@"/private/var/MobileSoftwareUpdate/MobileAsset/MobileAssetBrain" stringByAppendingPathComponent:@".current"]);
  v5 = objc_claimAutoreleasedReturnValue(+[__MABuiltinBrainBundle__ currentTargetPath]);

  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager]);
    unsigned __int8 v7 = [v6 removeItemAtPath:v4 error:a3];
  }
  else
  {
    unsigned __int8 v7 = 1;
  }

  return v7;
}

+ (BOOL)destageProposed:(id *)a3
{
  v4 = objc_claimAutoreleasedReturnValue([@"/private/var/MobileSoftwareUpdate/MobileAsset/MobileAssetBrain" stringByAppendingPathComponent:@".proposed"]);
  v5 = objc_claimAutoreleasedReturnValue(+[__MABuiltinBrainBundle__ proposedTargetPath]);

  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager]);
    unsigned __int8 v7 = [v6 removeItemAtPath:v4 error:a3];
  }
  else
  {
    unsigned __int8 v7 = 1;
  }

  return v7;
}

+ (BOOL)stageProposed:(id)a3 error:(id *)a4
{
  id v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue([@"/private/var/MobileSoftwareUpdate/MobileAsset/MobileAssetBrain" stringByAppendingPathComponent:@".proposed"]);
  v6 = objc_claimAutoreleasedReturnValue([v4 lastPathComponent]);
  char v7 = sub_1000045A0(v6, v5);

  if ((v7 & 1) == 0)
  {
    v8 = objc_claimAutoreleasedReturnValue([v4 lastPathComponent]);
    v9 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"Failed to write stagingName final path component(%@) to proposed path(%@)", v8, v5]);

    id v10 = v9;
    NSLog(@"[MAB] %s", [v10 UTF8String]);
  }
  return v7;
}

+ (void)garbageCollect
{
  v2 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager]);
  if ([v2 fileExistsAtPath:@"/private/var/MobileAsset/MobileAssetBrain"])
  {
    id v19 = 0;
    unsigned int v3 = [v2 removeItemAtPath:@"/private/var/MobileAsset/MobileAssetBrain" error:&v19];
    id v4 = v19;
    if (v3)
    {
      CFStringRef v5 = @"Successfully removed old MobileAssetBrain installation directory";
    }
    else
    {
      id v15 = v4;
      CFStringRef v5 = @"Error removing old MobileAssetBrain installation directory: %@";
    }
    id v6 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v15));
    NSLog(@"[MAB] %s", [v6 UTF8String]);
  }
  char v7 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:&off_10000D788]);
  id v8 = [v7 mutableCopy];

  v9 = objc_claimAutoreleasedReturnValue(+[__MABuiltinBrainBundle__ currentTargetPath]);
  id v10 = (__CFString *)objc_claimAutoreleasedReturnValue([v9 lastPathComponent]);

  if (v10)
  {
    [v8 addObject:v10];
    CFStringRef v11 = v10;
  }
  else
  {
    CFStringRef v11 = @"nil";
  }
  id v12 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"Performing MABrain garbage collection (current=%@)...", v11]);
  NSLog(@"[MAB] %s", [v12 UTF8String]);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100005628;
  v16[3] = &unk_10000C380;
  id v17 = v8;
  id v18 = v2;
  id v13 = v2;
  id v14 = v8;
  sub_1000047AC(@"/private/var/MobileSoftwareUpdate/MobileAsset/MobileAssetBrain", 0, v16);
}

- (__MABuiltinBrainBundle__)initWithPath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)__MABuiltinBrainBundle__;
  id v6 = [(__MABuiltinBrainBundle__ *)&v9 init];
  char v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bundlePath, a3);
  }

  return v7;
}

- (BOOL)isGrafted
{
  v2 = self;
  unsigned int v3 = objc_claimAutoreleasedReturnValue([(__MABuiltinBrainBundle__ *)self graftPath]);
  LOBYTE(v2) = [(__MABuiltinBrainBundle__ *)v2 isGraftedPath:v3];

  return (char)v2;
}

- (BOOL)isGraftedPath:(id)a3
{
  v5[0] = 0;
  v5[1] = 0;
  if (fsctl((const char *)objc_msgSend(a3, "fileSystemRepresentation", 0, 0), 0xC0104A66uLL, v5, 1u))
  {
    BOOL v3 = 1;
  }
  else
  {
    BOOL v3 = BYTE4(v5[0]) == 0;
  }
  return !v3;
}

- (BOOL)stageCurrent:(id *)a3
{
  id v4 = objc_claimAutoreleasedReturnValue([@"/private/var/MobileSoftwareUpdate/MobileAsset/MobileAssetBrain" stringByAppendingPathComponent:@".current"]);
  id v5 = objc_claimAutoreleasedReturnValue([(__MABuiltinBrainBundle__ *)self bundleId]);
  char v6 = sub_1000045A0(v5, v4);

  if ((v6 & 1) == 0)
  {
    char v7 = objc_claimAutoreleasedReturnValue([(__MABuiltinBrainBundle__ *)self bundleId]);
    id v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"Failed to mark bundle(%@) as current brain.", v7]);

    id v9 = v8;
    NSLog(@"[MAB] %s", [v9 UTF8String]);
  }
  return v6;
}

- (BOOL)graft:(id *)a3
{
  id v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary]);
  char v6 = objc_claimAutoreleasedReturnValue([(__MABuiltinBrainBundle__ *)self graftPath]);
  char v7 = objc_claimAutoreleasedReturnValue([(__MABuiltinBrainBundle__ *)self cryptexPath]);
  char v58 = 0;
  memset(&v57, 0, sizeof(v57));
  v56[0] = 0;
  v56[1] = 0;
  long long v99 = 0u;
  memset(v100, 0, sizeof(v100));
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v86 = 0u;
  long long v85 = 0u;
  long long v84 = 0u;
  long long v83 = 0u;
  long long v82 = 0u;
  long long v81 = 0u;
  long long v80 = 0u;
  long long v79 = 0u;
  long long v78 = 0u;
  long long v77 = 0u;
  long long v76 = 0u;
  long long v75 = 0u;
  long long v74 = 0u;
  long long v73 = 0u;
  long long v72 = 0u;
  long long v71 = 0u;
  long long v69 = xmmword_100009BE0;
  int v70 = -1;
  v67[0] = NSFileOwnerAccountID;
  v67[1] = NSFileGroupOwnerAccountID;
  v68[0] = &off_10000D730;
  v68[1] = &off_10000D730;
  v67[2] = NSFilePosixPermissions;
  v68[2] = &off_10000D748;
  id v8 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:3]);
  if (!v6)
  {
    NSErrorUserInfoKey v65 = NSDebugDescriptionErrorKey;
    id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"graftPath is nil"]);
    id v66 = v11;
    id v12 = &v66;
    id v13 = &v65;
LABEL_7:
    id v14 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:v12 forKeys:v13 count:1]);
    uint64_t v15 = 100;
    id v16 = v14;
LABEL_8:
    id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:@"MobileAssetBrainErrorDomain" code:v15 userInfo:v16]);

LABEL_9:
    BOOL v10 = 0;
    goto LABEL_10;
  }
  if (!v7)
  {
    NSErrorUserInfoKey v63 = NSDebugDescriptionErrorKey;
    id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"cryptexPath is nil"]);
    id v64 = v11;
    id v12 = &v64;
    id v13 = &v63;
    goto LABEL_7;
  }
  if ([(__MABuiltinBrainBundle__ *)self isGraftedPath:v6])
  {
    id v9 = 0;
    BOOL v10 = 1;
    goto LABEL_13;
  }
  id v18 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager]);
  unsigned __int8 v19 = [v18 fileExistsAtPath:v6 isDirectory:&v58];

  v52 = v5;
  if ((v19 & 1) == 0)
  {
    v20 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager]);
    id v55 = 0;
    unsigned __int8 v21 = [v20 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:v8 error:&v55];
    id v9 = v55;

    if (v21)
    {
LABEL_18:
      id v5 = v52;
LABEL_19:
      id v22 = v6;
      if (lstat((const char *)[v22 fileSystemRepresentation], &v57))
      {
        id v23 = v22;
        id v24 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Could not lstat %s", [v23 fileSystemRepresentation]));
        NSLog(@"[MAB] %s", [v24 UTF8String]);

        id v5 = v52;
        v25 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:*__error() userInfo:0];
        id v14 = objc_claimAutoreleasedReturnValue(v25);

        v61[0] = NSDebugDescriptionErrorKey;
        v61[1] = NSUnderlyingErrorKey;
        v62[0] = @"lstat failed";
        v62[1] = v14;
        v61[2] = @"graftPath";
        v62[2] = v23;
        id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:3]);
        uint64_t v15 = 104;
        id v16 = v11;
        goto LABEL_8;
      }
      if ([(__MABuiltinBrainBundle__ *)self isPersonalized]
        || [(__MABuiltinBrainBundle__ *)self isGloballySigned])
      {
        id v50 = v22;
        id v26 = objc_claimAutoreleasedReturnValue([(__MABuiltinBrainBundle__ *)self cryptexPath]);
        int v27 = open((const char *)[v26 fileSystemRepresentation], 0);

        unsigned int v49 = v27;
        if (v27 < 0)
        {
          [v5 setObject:@"open()" forKeyedSubscript:@"syscall"];
          v39 = objc_claimAutoreleasedReturnValue([(__MABuiltinBrainBundle__ *)self cryptexPath]);
          [v5 setObject:v39 forKeyedSubscript:@"path"];

          id v22 = v50;
LABEL_43:
          id v51 = v7;
          id v41 = [v51 fileSystemRepresentation];
          id v42 = v22;
          id v43 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Could not graft %s to %s", v41, [v42 fileSystemRepresentation]));
          NSLog(@"[MAB] %s", [v43 UTF8String]);

          uint64_t v44 = *__error();
          if ([v52 count]) {
            v45 = v52;
          }
          else {
            v45 = 0;
          }
          v46 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:NSPOSIXErrorDomain code:v44 userInfo:v45]);

          v59[0] = NSDebugDescriptionErrorKey;
          v59[1] = NSUnderlyingErrorKey;
          v60[0] = @"graft failed";
          v60[1] = v46;
          v59[2] = @"cryptexPath";
          v59[3] = @"graftPath";
          v60[2] = v51;
          v60[3] = v42;
          id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:4]);
          id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:@"MobileAssetBrainErrorDomain" code:104 userInfo:v11]);

          id v5 = v52;
          goto LABEL_9;
        }
        id v28 = objc_claimAutoreleasedReturnValue([(__MABuiltinBrainBundle__ *)self ticketPath]);
        int v48 = open((const char *)[v28 fileSystemRepresentation], 0);
        if (v48 < 0)
        {
          [v5 setObject:@"open()" forKeyedSubscript:@"syscall"];
          [v5 setObject:v28 forKeyedSubscript:@"path"];
          int v33 = -1;
          int v32 = v27;
          id v22 = v50;
        }
        else
        {
          id v47 = v28;
          id v29 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"Found MA brain ticket: %@", v28]);
          NSLog(@"[MAB] %s", [v29 UTF8String]);

          id v30 = objc_claimAutoreleasedReturnValue([(__MABuiltinBrainBundle__ *)self rootHashPath]);
          int v31 = open((const char *)[v30 fileSystemRepresentation], 0);

          id v22 = v50;
          if (v31 < 0)
          {
            id v5 = v52;
            [v52 setObject:@"open()" forKeyedSubscript:@"syscall"];
            v40 = objc_claimAutoreleasedReturnValue([(__MABuiltinBrainBundle__ *)self rootHashPath]);
            [v52 setObject:v40 forKeyedSubscript:@"path"];

            int v33 = -1;
            int v32 = v49;
          }
          else
          {
            DWORD2(v69) = v48;
            int v70 = v31;
            *(void *)&long long v71 = 16;
            int v32 = v49;
            int v33 = graftdmg(v49, [v50 fileSystemRepresentation], -[__MABuiltinBrainBundle__ graftdmgType](self, "graftdmgType"), &v69);
            id v5 = v52;
            if (v33)
            {
              [v52 setObject:@"graftdmg()" forKeyedSubscript:@"syscall"];
              [v52 setObject:v47 forKeyedSubscript:@"path"];
            }
            close(v31);
          }
          close(v48);
          id v28 = v47;
        }
        close(v32);
      }
      else
      {
        v56[0] = v57.st_ino;
        int v33 = fsctl((const char *)[v7 fileSystemRepresentation], 0x80104A63uLL, v56, 0);
      }
      if (!v33)
      {
        id v11 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"Successfully grafted %@ onto %@", v7, v22]);
        NSLog(@"[MAB] %s", [v11 UTF8String]);
        BOOL v10 = 1;
LABEL_10:

        if (!a3) {
          goto LABEL_13;
        }
        goto LABEL_11;
      }
      goto LABEL_43;
    }
    goto LABEL_32;
  }
  if (v58)
  {
    id v9 = 0;
    goto LABEL_19;
  }
  v34 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager]);
  id v54 = 0;
  unsigned int v35 = [v34 removeItemAtPath:v6 error:&v54];
  id v9 = v54;

  if (!v35)
  {
LABEL_32:
    BOOL v10 = 0;
    goto LABEL_33;
  }
  v36 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager]);
  id v53 = v9;
  unsigned int v37 = [v36 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:v8 error:&v53];
  id v38 = v53;

  if (v37)
  {
    id v9 = v38;
    goto LABEL_18;
  }
  BOOL v10 = 0;
  id v9 = v38;
LABEL_33:
  id v5 = v52;
  if (!a3) {
    goto LABEL_13;
  }
LABEL_11:
  if (v9)
  {
    id v9 = v9;
    *a3 = v9;
  }
LABEL_13:

  return v10;
}

- (BOOL)ungraft:(id *)a3
{
  id v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary]);
  char v6 = objc_claimAutoreleasedReturnValue([(__MABuiltinBrainBundle__ *)self graftPath]);
  uint64_t v23 = 0;
  if (v6)
  {
    if ([(__MABuiltinBrainBundle__ *)self isGraftedPath:v6])
    {
      id v7 = v6;
      id v8 = (const char *)[v7 fileSystemRepresentation];
      if (&_ungraftdmg)
      {
        int v9 = ungraftdmg(v8, 0);
        CFStringRef v10 = @"ungraftdmg()";
      }
      else
      {
        int v9 = fsctl(v8, 0x80084A64uLL, &v23, 0);
        CFStringRef v10 = @"fsctl()";
      }
      if (v9)
      {
        id v15 = v7;
        id v16 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Could not ungraft %s", [v15 fileSystemRepresentation]));
        NSLog(@"[MAB] %s", [v16 UTF8String]);

        [v5 setObject:v10 forKeyedSubscript:@"syscall"];
        uint64_t v17 = *__error();
        if ([v5 count]) {
          id v18 = v5;
        }
        else {
          id v18 = 0;
        }
        id v12 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:NSPOSIXErrorDomain code:v17 userInfo:v18]);
        v24[0] = NSDebugDescriptionErrorKey;
        v24[1] = NSUnderlyingErrorKey;
        v25[0] = @"ungraft failed";
        v25[1] = v12;
        v24[2] = @"graftPath";
        v25[2] = v15;
        id v11 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:3]);
        uint64_t v13 = 105;
        id v14 = v11;
        goto LABEL_12;
      }
      id v21 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"Successfully ungrafted %@ from the file system using %@", v7, v10, v23]);
      NSLog(@"[MAB] %s", [v21 UTF8String]);
    }
    id v19 = 0;
    BOOL v20 = 1;
    goto LABEL_17;
  }
  NSErrorUserInfoKey v26 = NSDebugDescriptionErrorKey;
  id v11 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"graftPath is nil"]);
  int v27 = v11;
  id v12 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1]);
  uint64_t v13 = 100;
  id v14 = v12;
LABEL_12:
  id v19 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:@"MobileAssetBrainErrorDomain" code:v13 userInfo:v14]);

  BOOL v20 = 0;
  if (a3 && v19)
  {
    id v19 = v19;
    BOOL v20 = 0;
    *a3 = v19;
  }
LABEL_17:

  return v20;
}

- (BOOL)isPersonalized
{
  BOOL v3 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager]);
  id v4 = objc_claimAutoreleasedReturnValue([(__MABuiltinBrainBundle__ *)self ticketPath]);
  unsigned __int8 v5 = [v3 fileExistsAtPath:v4];

  return v5;
}

- (BOOL)isGloballySigned
{
  return 0;
}

- (BOOL)hasValidCurrentBootOnlyTicket
{
  v2 = objc_claimAutoreleasedReturnValue([(__MABuiltinBrainBundle__ *)self currentBootOnlyTicketPath]);
  if (v2)
  {
    BOOL v3 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager]);
    unsigned __int8 v4 = [v3 fileExistsAtPath:v2];
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (NSString)bundleId
{
  return [(NSString *)self->_bundlePath lastPathComponent];
}

- (NSString)bundlePath
{
  return self->_bundlePath;
}

- (NSString)graftPath
{
  return [(NSString *)self->_bundlePath stringByAppendingPathComponent:@".graft"];
}

- (NSString)cryptexPath
{
  return [(NSString *)self->_bundlePath stringByAppendingPathComponent:@"MobileAssetBrain.cryptex"];
}

- (NSString)ticketPath
{
  if ([(__MABuiltinBrainBundle__ *)self hasValidCurrentBootOnlyTicket]) {
    BOOL v3 = objc_claimAutoreleasedReturnValue([(__MABuiltinBrainBundle__ *)self currentBootOnlyTicketPath]);
  }
  else {
    BOOL v3 = objc_claimAutoreleasedReturnValue([(__MABuiltinBrainBundle__ *)self primaryTicketPath]);
  }
  return (NSString *)v3;
}

- (NSString)primaryTicketPath
{
  return [(NSString *)self->_bundlePath stringByAppendingPathComponent:@"cryptex1ticket.der"];
}

- (NSString)currentBootOnlyTicketPath
{
  bundlePath = self->_bundlePath;
  id v3 = sub_100004B1C();
  unsigned __int8 v4 = objc_claimAutoreleasedReturnValue(v3);
  unsigned __int8 v5 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:@"cryptex1ticket.%@.der", v4]);
  char v6 = objc_claimAutoreleasedReturnValue([(NSString *)bundlePath stringByAppendingPathComponent:v5]);

  return (NSString *)v6;
}

- (unsigned)graftdmgType
{
  unsigned int v2 = [(__MABuiltinBrainBundle__ *)self hasValidCurrentBootOnlyTicket];
  if (v2) {
    CFStringRef v3 = @"Using GRAFTDMG_CRYPTEX_PDI_NONCE";
  }
  else {
    CFStringRef v3 = @"Using GRAFTDMG_CRYPTEX_BOOT";
  }
  if (v2) {
    unsigned int v4 = 6;
  }
  else {
    unsigned int v4 = 1;
  }
  id v5 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:v3]);
  NSLog(@"[MAB] %s", [v5 UTF8String]);

  return v4;
}

- (NSString)rootHashPath
{
  return [(NSString *)self->_bundlePath stringByAppendingPathComponent:@"mobileassetbrain_root_hash"];
}

- (NSString)trustCachePath
{
  return [(NSString *)self->_bundlePath stringByAppendingPathComponent:@"MobileAssetTrustCache"];
}

- (NSString)brainPath
{
  unsigned int v2 = objc_claimAutoreleasedReturnValue([(__MABuiltinBrainBundle__ *)self graftPath]);
  CFStringRef v3 = objc_claimAutoreleasedReturnValue([v2 stringByAppendingPathComponent:@"/usr/lib/libmobileassetd.dylib"]);

  return (NSString *)v3;
}

- (NSDictionary)brainInfo
{
  unsigned int v2 = objc_claimAutoreleasedReturnValue([(NSString *)self->_bundlePath stringByAppendingPathComponent:@"MobileAssetBrain.plist"]);
  CFStringRef v3 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:v2]);

  return (NSDictionary *)v3;
}

- (void).cxx_destruct
{
}

@end