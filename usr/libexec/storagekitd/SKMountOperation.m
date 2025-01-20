@interface SKMountOperation
+ (BOOL)mountWithDisk:(id)a3 options:(id)a4 error:(id *)a5;
+ (id)nilWithBlock:(id)a3 error:(id)a4;
+ (id)resolveWithPath:(id)a3 error:(id *)a4;
- (BOOL)authenticateOnInit;
- (BOOL)force;
- (BOOL)toOperateWithDisk:(id)a3;
- (BOOL)validateMountOptionsWithDisk:(id)a3 error:(id *)a4;
- (BOOL)validateMountPointWithConnection:(id)a3 error:(id *)a4;
- (NSSet)disksToMount;
- (NSString)mountPoint;
- (SKMountOperation)initWithDisk:(id)a3 options:(id)a4 connection:(id)a5 completionBlock:(id)a6;
- (id)copyMountURLWithDisk:(id)a3;
- (id)description;
- (id)filterEFIWithDisks:(id)a3;
- (id)newPerformOperation;
- (int64_t)defaultErrorCode;
- (unsigned)clientUID;
- (void)setAuthenticateOnInit:(BOOL)a3;
- (void)setMountPoint:(id)a3;
@end

@implementation SKMountOperation

+ (id)nilWithBlock:(id)a3 error:(id)a4
{
  if (a3) {
    (*((void (**)(id, id))a3 + 2))(a3, a4);
  }
  return 0;
}

+ (id)resolveWithPath:(id)a3 error:(id *)a4
{
  v5 = (const char *)[a3 UTF8String];
  if (v5)
  {
    if (realpath_DARWIN_EXTSN(v5, v10))
    {
      v6 = +[NSString stringWithUTF8String:v10];
      goto LABEL_7;
    }
    uint64_t v8 = *__error();
    CFStringRef v7 = @"Cannot resolve mount point";
  }
  else
  {
    CFStringRef v7 = @"Invalid mount point string";
    uint64_t v8 = 22;
  }
  v6 = +[SKError nilWithPOSIXCode:v8 debugDescription:v7 error:a4];
LABEL_7:

  return v6;
}

- (SKMountOperation)initWithDisk:(id)a3 options:(id)a4 connection:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v51.receiver = self;
  v51.super_class = (Class)SKMountOperation;
  v13 = [(SKBaseDiskArbOperation *)&v51 initWithTarget:v10 options:a4 callbackBlock:v12];
  if (v13)
  {
    if (v11) {
      unsigned int v14 = [v11 uid];
    }
    else {
      unsigned int v14 = -1;
    }
    v13->_clientUID = v14;
    v16 = [(SKBaseDiskArbOperation *)v13 options];
    v17 = [v16 objectForKeyedSubscript:kSKAPFSDiskMountIgnoreGroup];
    v18 = [(SKBaseDiskArbOperation *)v13 disksForOperationWithTarget:v10 ignoreGroup:sub_100012340(v17)];

    uint64_t v19 = [(SKMountOperation *)v13 filterEFIWithDisks:v18];
    disksToMount = v13->_disksToMount;
    v13->_disksToMount = (NSSet *)v19;

    if (![(NSSet *)v13->_disksToMount count])
    {
      if ([(SKBaseDiskArbOperation *)v13 recursive] && ![(SKMountOperation *)v13 force])
      {
        v37 = sub_10000DD48();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v53 = "-[SKMountOperation initWithDisk:options:connection:completionBlock:]";
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%s: Nothing to mount on recursive mount, returning success", buf, 0xCu);
        }

        v15 = [(id)objc_opt_class() nilWithBlock:v12 error:0];
      }
      else
      {
        v27 = objc_opt_class();
        v28 = +[SKError errorWithCode:124 userInfo:0];
        v15 = [v27 nilWithBlock:v12 error:v28];
      }
      goto LABEL_34;
    }
    if ((id)[(NSSet *)v13->_disksToMount count] == (id)1)
    {
      id v21 = [(NSSet *)v13->_disksToMount anyObject];
      v22 = [v21 mountPoint];

      if (v22)
      {
        v23 = sub_10000DD48();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v53 = "-[SKMountOperation initWithDisk:options:connection:completionBlock:]";
          __int16 v54 = 2112;
          id v55 = v21;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s: %@ is already mounted, returning success", buf, 0x16u);
        }

        v24 = objc_opt_class();
        id v25 = v12;
        id v26 = 0;
        goto LABEL_31;
      }
    }
    id v50 = 0;
    unsigned __int8 v29 = [(SKMountOperation *)v13 validateMountOptionsWithDisk:v10 error:&v50];
    id v21 = v50;
    if (v29)
    {
      v30 = [(SKBaseDiskArbOperation *)v13 options];
      uint64_t v31 = kSKDiskMountOptionMountPoint;
      v32 = [v30 objectForKeyedSubscript:kSKDiskMountOptionMountPoint];

      if (!v32) {
        goto LABEL_28;
      }
      if ([(NSSet *)v13->_disksToMount count] >= 2)
      {
        v33 = sub_10000DD48();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v53 = "-[SKMountOperation initWithDisk:options:connection:completionBlock:]";
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%s: Multiple disks to mount, cannot specify mount point", buf, 0xCu);
        }

        v34 = objc_opt_class();
        NSErrorDomain v35 = NSPOSIXErrorDomain;
        uint64_t v36 = 22;
        goto LABEL_37;
      }
      v38 = objc_opt_class();
      v39 = [(SKBaseDiskArbOperation *)v13 options];
      v40 = [v39 objectForKeyedSubscript:v31];
      id v49 = v21;
      uint64_t v41 = [v38 resolveWithPath:v40 error:&v49];
      id v42 = v49;

      mountPoint = v13->_mountPoint;
      v13->_mountPoint = (NSString *)v41;

      if (!v13->_mountPoint)
      {
        v15 = [(id)objc_opt_class() nilWithBlock:v12 error:v42];
        id v21 = v42;
        goto LABEL_33;
      }
      id v48 = v42;
      unsigned __int8 v44 = [(SKMountOperation *)v13 validateMountPointWithConnection:v11 error:&v48];
      id v21 = v48;

      if (v44)
      {
LABEL_28:
        if (![(SKMountOperation *)v13 authenticateOnInit]
          || ([v11 authorizeRequestForRoot] & 1) != 0)
        {
          v45 = v13;
LABEL_32:
          v15 = v45;
LABEL_33:

LABEL_34:
          goto LABEL_35;
        }
        v34 = objc_opt_class();
        NSErrorDomain v35 = NSPOSIXErrorDomain;
        uint64_t v36 = 1;
LABEL_37:
        v47 = +[NSError errorWithDomain:v35 code:v36 userInfo:0];
        v15 = [v34 nilWithBlock:v12 error:v47];

        goto LABEL_33;
      }
    }
    v24 = objc_opt_class();
    id v25 = v12;
    id v26 = v21;
LABEL_31:
    v45 = [v24 nilWithBlock:v25 error:v26];
    goto LABEL_32;
  }
  v15 = 0;
LABEL_35:

  return v15;
}

- (id)filterEFIWithDisks:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableSet set];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v25;
    *(void *)&long long v8 = 136315906;
    long long v23 = v8;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v11);
        v13 = [v12 type:v23];
        unsigned int v14 = [v13 isEqualToString:kSKDiskTypeEFI];

        if (v14
          && [(SKMountOperation *)self clientUID]
          && (unsigned int v15 = -[SKMountOperation clientUID](self, "clientUID"), v15 != [v12 ownerUID]))
        {
          v16 = sub_10000DD48();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v17 = [(SKMountOperation *)self clientUID];
            [v12 diskIdentifier];
            uint64_t v19 = v18 = v6;
            unsigned int v20 = [v12 ownerUID];
            *(_DWORD *)buf = v23;
            unsigned __int8 v29 = "-[SKMountOperation filterEFIWithDisks:]";
            __int16 v30 = 1024;
            unsigned int v31 = v17;
            __int16 v32 = 2114;
            v33 = v19;
            __int16 v34 = 1024;
            unsigned int v35 = v20;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s: Client uid %d, skipping EFI partition %{public}@ owned by uid %d", buf, 0x22u);

            id v6 = v18;
          }
        }
        else
        {
          [v5 addObject:v12];
        }
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v21 = [v6 countByEnumeratingWithState:&v24 objects:v36 count:16];
      id v9 = v21;
    }
    while (v21);
  }

  return v5;
}

- (BOOL)toOperateWithDisk:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 role];
    if ([v4 isEqualToString:kSKDiskRoleVirtualMemory])
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      id v6 = [v3 role];
      if ([v6 isEqualToString:kSKDiskRoleBooter])
      {
        LOBYTE(v5) = 0;
      }
      else
      {
        id v7 = [v3 role];
        if ([v7 isEqualToString:kSKDiskRoleRecovery]) {
          LOBYTE(v5) = 0;
        }
        else {
          unsigned int v5 = [v3 isLocked] ^ 1;
        }
      }
    }
  }
  else
  {
    LOBYTE(v5) = 1;
  }

  return v5;
}

+ (BOOL)mountWithDisk:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [[SKMountOperation alloc] initWithDisk:v8 options:v7 connection:0 completionBlock:0];

  id v10 = [(SKMountOperation *)v9 newPerformOperation];
  id v11 = v10;
  if (a5) {
    *a5 = v10;
  }

  return v11 == 0;
}

- (id)copyMountURLWithDisk:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(SKMountOperation *)self mountPoint];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v4 isLiveFSAPFSDisk]) {
    goto LABEL_53;
  }
  id v6 = [v4 filesystem];
  if (v6)
  {
    id v7 = [v4 filesystem];
    if ([v7 isExtension])
    {
      id v8 = [v4 filesystem];
      id v9 = [v8 majorType];
      if ([v9 isEqualToString:@"apfs"])
      {
        if ([v4 isExternal])
        {
          id v10 = [v4 filesystem];
          id v11 = [v10 majorType];
          unsigned __int8 v12 = [v11 isEqualToString:@"apfs"];
        }
        else
        {
          unsigned __int8 v12 = 0;
        }
      }
      else
      {
        unsigned __int8 v12 = 1;
      }
    }
    else
    {
      unsigned __int8 v12 = 0;
    }
  }
  else
  {
    unsigned __int8 v12 = 0;
  }

  if (v5 || (v12 & 1) != 0)
  {
LABEL_51:
    if (v5)
    {
      __int16 v34 = +[NSURL fileURLWithPath:v5];
      goto LABEL_54;
    }
LABEL_53:
    __int16 v34 = 0;
    goto LABEL_54;
  }
  v13 = [v4 volumeName];
  if (v13)
  {
    CFStringRef v14 = [v4 volumeName];
  }
  else
  {
    CFStringRef v14 = @"untitled";
  }

  v37 = (__CFString *)v14;
  unsigned int v5 = +[NSString stringWithFormat:@"%@/%@", @"/private/var/mnt", v14];
  unsigned int v15 = +[NSFileManager defaultManager];
  if ([v15 fileExistsAtPath:v5])
  {
    uint64_t v16 = 2;
    while (v16 != 100)
    {
      unsigned int v17 = sub_10000DD48();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v43 = (uint64_t)v5;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Mountpoint %@ already exists, trying a different mountpoint", buf, 0xCu);
      }

      uint64_t v18 = +[NSString stringWithFormat:@"%@/%@_%d", @"/private/var/mnt", v37, v16];

      uint64_t v16 = (v16 + 1);
      unsigned int v5 = (void *)v18;
      if (([v15 fileExistsAtPath:v18] & 1) == 0) {
        goto LABEL_27;
      }
    }
    unsigned int v31 = +[SKBaseManager sharedManager];
    [v31 logEvent:@"com.apple.StorageKit.log.fault" eventPayloadBuilder:&stru_100048B60];

    __int16 v32 = sub_10000DD48();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v43 = (uint64_t)v4;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_FAULT, "Failed to find a free mountpoint for %@", buf, 0xCu);
    }

    goto LABEL_53;
  }
  uint64_t v18 = (uint64_t)v5;
LABEL_27:
  uint64_t v19 = sub_10000DD48();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v20 = [v4 diskIdentifier];
    *(_DWORD *)buf = 138412546;
    uint64_t v43 = (uint64_t)v20;
    __int16 v44 = 2112;
    uint64_t v45 = v18;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Mounting %@ to %@", buf, 0x16u);
  }
  id v21 = [v4 diskIdentifier];
  v22 = +[NSString stringWithFormat:@"/dev/%@", v21];

  id v39 = 0;
  long long v23 = [v15 attributesOfItemAtPath:v22 error:&v39];
  id v24 = v39;
  if (v23)
  {
    long long v25 = [v23 objectForKeyedSubscript:NSFileOwnerAccountID];
    uint64_t v36 = v22;
    if (sub_10001217C(v25) && [v25 unsignedLongValue])
    {
      long long v26 = sub_10000DD48();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v43 = (uint64_t)v25;
        __int16 v44 = 2112;
        uint64_t v45 = v18;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Setting owner %@ to mount point %@", buf, 0x16u);
      }

      NSFileAttributeKey v40 = NSFileOwnerAccountID;
      uint64_t v41 = v25;
      long long v27 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    }
    else
    {
      long long v27 = 0;
    }
    id v38 = v24;
    unsigned __int8 v28 = [v15 createDirectoryAtPath:v18 withIntermediateDirectories:1 attributes:v27 error:&v38];
    id v29 = v38;

    if (v28)
    {
      int v30 = 0;
    }
    else
    {
      v33 = sub_10000DD48();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v43 = v18;
        __int16 v44 = 2112;
        uint64_t v45 = (uint64_t)v29;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Failed creating mount point %@: %@", buf, 0x16u);
      }

      int v30 = 1;
    }
    v22 = v36;
  }
  else
  {
    long long v27 = sub_10000DD48();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v43 = (uint64_t)v22;
      __int16 v44 = 2112;
      uint64_t v45 = (uint64_t)v24;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed getting attributes for device path %@: %@", buf, 0x16u);
    }
    int v30 = 1;
    id v29 = v24;
  }

  if (!v30)
  {
    unsigned int v5 = (void *)v18;
    goto LABEL_51;
  }
  __int16 v34 = 0;
  unsigned int v5 = (void *)v18;
LABEL_54:

  return v34;
}

- (BOOL)validateMountOptionsWithDisk:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SKBaseDiskArbOperation *)self options];
  uint64_t v8 = [v7 objectForKeyedSubscript:kSKDiskMountOptionToolOptions];
  id v9 = (void *)v8;
  id v10 = &__NSArray0__struct;
  if (v8) {
    id v10 = (void *)v8;
  }
  id v11 = v10;

  if ((unint64_t)[v11 count] >= 0x40)
  {
    unsigned __int8 v12 = +[SKError failWithPOSIXCode:22 debugDescription:@"Too many mount options" error:a4];
    goto LABEL_24;
  }
  if (!-[SKMountOperation clientUID](self, "clientUID") || ![v11 count])
  {
LABEL_20:
    unsigned __int8 v12 = 1;
    goto LABEL_24;
  }
  uint64_t v13 = 0;
  while (1)
  {
    CFStringRef v14 = [v11 objectAtIndexedSubscript:v13];
    unsigned int v15 = [v14 lowercaseString];

    if ([v15 hasPrefix:@"-o="])
    {
      uint64_t v16 = 3;
    }
    else
    {
      if (![v15 hasPrefix:@"-o"]) {
        goto LABEL_13;
      }
      uint64_t v16 = 2;
    }
    uint64_t v17 = [v15 substringFromIndex:v16];

    unsigned int v15 = (void *)v17;
LABEL_13:
    if ([v15 isEqualToString:@"noowners"]
      && ([v6 isTrusted] & 1) != 0
      || [v15 isEqualToString:@"suid"]
      && ![v6 isTrusted]
      || [v15 isEqualToString:@"dev"]
      && ([v6 isTrusted] & 1) == 0)
    {
      break;
    }

    if (++v13 >= (unint64_t)[v11 count]) {
      goto LABEL_20;
    }
  }
  uint64_t v18 = sub_10000DD48();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v19 = [(SKMountOperation *)self clientUID];
    unsigned int v20 = [v6 diskIdentifier];
    int v22 = 136315906;
    long long v23 = "-[SKMountOperation validateMountOptionsWithDisk:error:]";
    __int16 v24 = 1024;
    unsigned int v25 = v19;
    __int16 v26 = 2112;
    long long v27 = v20;
    __int16 v28 = 2112;
    id v29 = v15;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s: Client %d asks to mount %@ with %@ option", (uint8_t *)&v22, 0x26u);
  }
  unsigned __int8 v12 = 1;
  [(SKMountOperation *)self setAuthenticateOnInit:1];

LABEL_24:
  return v12;
}

- (BOOL)validateMountPointWithConnection:(id)a3 error:(id *)a4
{
  id v7 = [(SKMountOperation *)self mountPoint];
  if (!sub_1000121D4(v7))
  {

    goto LABEL_10;
  }
  id v8 = [(SKMountOperation *)self mountPoint];
  id v9 = [v8 fileSystemRepresentation];

  if (!v9)
  {
LABEL_10:
    uint64_t v16 = sub_10000DD48();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = [(SKMountOperation *)self mountPoint];
      v35.st_dev = 138412290;
      *(void *)&v35.st_mode = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Invalid mount point %@", (uint8_t *)&v35, 0xCu);
    }
    uint64_t v15 = 22;
    return +[SKError failWithPOSIXCode:v15 error:a4];
  }
  if (!a3)
  {
    id v21 = sub_10000DD48();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v35.st_dev) = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Unknown audit token, denying use of mount point", (uint8_t *)&v35, 2u);
    }

    return +[SKError failWithSKErrorCode:102 error:a4];
  }
  if (![(SKMountOperation *)self clientUID]) {
    goto LABEL_20;
  }
  memset(&v35, 0, sizeof(v35));
  id v10 = [(SKMountOperation *)self mountPoint];
  int v11 = stat((const char *)[v10 fileSystemRepresentation], &v35);

  if (v11)
  {
    uint64_t v12 = *__error();
    uint64_t v13 = sub_10000DD48();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      CFStringRef v14 = [(SKMountOperation *)self mountPoint];
      int v27 = 136315650;
      __int16 v28 = "-[SKMountOperation validateMountPointWithConnection:error:]";
      __int16 v29 = 2112;
      int v30 = v14;
      __int16 v31 = 1024;
      unsigned int v32 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s: Stat failed on %@, errno %d", (uint8_t *)&v27, 0x1Cu);
    }
    uint64_t v15 = v12;
    return +[SKError failWithPOSIXCode:v15 error:a4];
  }
  unsigned int v22 = [(SKMountOperation *)self clientUID];
  if (v22 != v35.st_uid)
  {
    unsigned int v25 = sub_10000DD48();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v26 = [(SKMountOperation *)self mountPoint];
      int v27 = 136315906;
      __int16 v28 = "-[SKMountOperation validateMountPointWithConnection:error:]";
      __int16 v29 = 2112;
      int v30 = v26;
      __int16 v31 = 1024;
      unsigned int v32 = [(SKMountOperation *)self clientUID];
      __int16 v33 = 1024;
      uid_t st_uid = v35.st_uid;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s: Client is not the owner of %@. clientUID = %d, path_info.uid_t st_uid = %d, asking for permission", (uint8_t *)&v27, 0x22u);
    }
    BOOL v19 = 1;
    [(SKMountOperation *)self setAuthenticateOnInit:1];
  }
  else
  {
LABEL_20:
    long long v23 = sub_10000DD48();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v24 = [(SKMountOperation *)self mountPoint];
      v35.st_dev = 136315394;
      *(void *)&v35.st_mode = "-[SKMountOperation validateMountPointWithConnection:error:]";
      WORD2(v35.st_ino) = 2112;
      *(__darwin_ino64_t *)((char *)&v35.st_ino + 6) = (__darwin_ino64_t)v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s: Client is allowed to mount to %@", (uint8_t *)&v35, 0x16u);
    }
    return 1;
  }
  return v19;
}

- (id)newPerformOperation
{
  memset(v100, 0, 512);
  id v3 = [(SKBaseDiskArbOperation *)self options];
  id v4 = [v3 objectForKeyedSubscript:kSKDiskMountOptionToolOptions];

  id v5 = [v4 count];
  group = dispatch_group_create();
  if (v5)
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      id v7 = [v4 objectAtIndexedSubscript:i];
      v100[(void)i] = v7;
    }
  }
  id v8 = objc_alloc((Class)NSMutableArray);
  id v9 = [(SKMountOperation *)self disksToMount];
  id v54 = [v8 initWithCapacity:[v9 count]];

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  obuint64_t j = [(SKMountOperation *)self disksToMount];
  id v10 = [obj countByEnumeratingWithState:&v63 objects:v99 count:16];
  id v49 = v4;
  if (!v10)
  {
    id v12 = 0;
    goto LABEL_41;
  }
  id v11 = v10;
  id v12 = 0;
  uint64_t v13 = *(void *)v64;
  CFStringRef v14 = (CFStringRef *)v100;
  if (!v5) {
    CFStringRef v14 = 0;
  }
  arguments = v14;
  uint64_t v53 = *(void *)v64;
  do
  {
    uint64_t v15 = 0;
    id v55 = v11;
    do
    {
      if (*(void *)v64 != v13) {
        objc_enumerationMutation(obj);
      }
      uint64_t v16 = *(void **)(*((void *)&v63 + 1) + 8 * (void)v15);
      uint64_t v17 = [v16 mountPoint];

      if (!v17)
      {
        BOOL v19 = +[NSString stringWithFormat:@"Mount of %@", v16, v49];
        [(SKBaseDiskArbOperation *)self setCurrentOperationName:v19];

        id v20 = [(SKMountOperation *)self copyMountURLWithDisk:v16];
        id v21 = [(id)objc_opt_class() getMountState:v16];
        if (!v21) {
          goto LABEL_18;
        }
        unsigned int v22 = [(SKBaseDiskArbOperation *)self options];
        long long v23 = [v22 objectForKeyedSubscript:kSKDiskMountOptionRestore];
        unsigned int v24 = sub_100012340(v23);

        uint64_t v13 = v53;
        if (v24)
        {
          unsigned int v25 = [v21 mountPoint];
          __int16 v26 = +[NSURL fileURLWithPath:v25];

          int v27 = [v26 path];
          unsigned __int8 v28 = [v27 hasPrefix:@"/Volumes"];

          id v50 = v12;
          if (v28) {
            CFURLRef v18 = 0;
          }
          else {
            CFURLRef v18 = v26;
          }

          __int16 v29 = [v21 mountFlags];
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
          long long v85 = 0u;
          long long v86 = 0u;
          long long v83 = 0u;
          long long v84 = 0u;
          long long v81 = 0u;
          long long v82 = 0u;
          long long v79 = 0u;
          long long v80 = 0u;
          long long v77 = 0u;
          long long v78 = 0u;
          long long v75 = 0u;
          long long v76 = 0u;
          long long v73 = 0u;
          long long v74 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          memset(buf, 0, sizeof(buf));
          id v30 = [v29 count];
          if ((unint64_t)v30 >= 0x3F) {
            uint64_t v31 = 63;
          }
          else {
            uint64_t v31 = (uint64_t)v30;
          }
          if (v31)
          {
            for (uint64_t j = 0; j != v31; ++j)
            {
              __int16 v33 = [v29 objectAtIndexedSubscript:j];
              __int16 v34 = (CFStringRef *)buf;
              buf[j] = v33;
            }
          }
          else
          {
            __int16 v34 = 0;
          }
          stat v35 = [v16 daDisk];
          DADiskMountWithArguments(v35, v18, 2u, (DADiskMountCallback)sub_100019AEC, self, v34);

          id v12 = v50;
          uint64_t v13 = v53;
        }
        else
        {
LABEL_18:
          __int16 v26 = [v16 daDisk];
          DADiskMountWithArguments((DADiskRef)v26, (CFURLRef)v20, 2u, (DADiskMountCallback)sub_100019AEC, self, arguments);
          CFURLRef v18 = (const __CFURL *)v20;
        }

        id v11 = v55;
        if (![(SKBaseDiskArbOperation *)self completeDiskArbOp])
        {
          if (v12)
          {
            if (v18) {
              goto LABEL_32;
            }
          }
          else
          {
            id v12 = [(SKBaseDiskArbOperation *)self newDAError];
            if (v18)
            {
LABEL_32:
              uint64_t v36 = [(__CFURL *)v18 path];
              [(SKBaseDiskArbOperation *)self removeWithMountPoint:v36];
            }
          }
        }
        [(id)objc_opt_class() clearMountState:v16];
        [v54 addObject:v16];

        goto LABEL_34;
      }
      sub_10000DD48();
      CFURLRef v18 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf[0]) = 136315394;
        *(void *)((char *)buf + 4) = "-[SKMountOperation newPerformOperation]";
        WORD2(buf[1]) = 2112;
        *(void *)((char *)&buf[1] + 6) = v16;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v18, OS_LOG_TYPE_DEFAULT, "%s: %@ is already mounted, skipping", (uint8_t *)buf, 0x16u);
      }
LABEL_34:

      uint64_t v15 = (char *)v15 + 1;
    }
    while (v15 != v11);
    id v37 = [obj countByEnumeratingWithState:&v63 objects:v99 count:16];
    id v11 = v37;
  }
  while (v37);
LABEL_41:
  objc_super v51 = v12;

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v38 = v54;
  id v39 = [v38 countByEnumeratingWithState:&v59 objects:v67 count:16];
  if (v39)
  {
    id v40 = v39;
    uint64_t v41 = *(void *)v60;
    do
    {
      for (k = 0; k != v40; k = (char *)k + 1)
      {
        if (*(void *)v60 != v41) {
          objc_enumerationMutation(v38);
        }
        uint64_t v43 = *(void *)(*((void *)&v59 + 1) + 8 * (void)k);
        __int16 v44 = dispatch_get_global_queue(0, 0);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000061D8;
        block[3] = &unk_100048B88;
        block[4] = v43;
        dispatch_group_async(group, v44, block);
      }
      id v40 = [v38 countByEnumeratingWithState:&v59 objects:v67 count:16];
    }
    while (v40);
  }

  dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  unsigned int v45 = [(SKBaseDiskArbOperation *)self recursive];
  v46 = v51;
  if (v45)
  {
    if ([v38 count]) {
      v46 = 0;
    }
    else {
      v46 = v51;
    }
  }
  id v47 = v46;

  return v47;
}

- (BOOL)force
{
  v2 = [(SKBaseDiskArbOperation *)self options];
  id v3 = [v2 objectForKeyedSubscript:kSKDiskMountOptionForce];
  unsigned __int8 v4 = sub_100012340(v3);

  return v4;
}

- (id)description
{
  id v3 = [(SKMountOperation *)self disksToMount];
  unsigned __int8 v4 = [(SKBaseDiskArbOperation *)self options];
  id v5 = +[NSString stringWithFormat:@"Mount Operation for %@ with %@", v3, v4];

  return v5;
}

- (int64_t)defaultErrorCode
{
  return 400;
}

- (BOOL)authenticateOnInit
{
  return self->_authenticateOnInit;
}

- (void)setAuthenticateOnInit:(BOOL)a3
{
  self->_authenticateOnInit = a3;
}

- (NSSet)disksToMount
{
  return self->_disksToMount;
}

- (unsigned)clientUID
{
  return self->_clientUID;
}

- (NSString)mountPoint
{
  return self->_mountPoint;
}

- (void)setMountPoint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mountPoint, 0);

  objc_storeStrong((id *)&self->_disksToMount, 0);
}

@end