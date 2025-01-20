@interface SKUnmountOperation
+ (BOOL)unmountWithDisk:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)_unmountWithDADisk:(id)a3;
- (BOOL)_unmountWithDisk:(id)a3 error:(id *)a4;
- (BOOL)unmountSnapshotsWithDisk:(id)a3 error:(id *)a4;
- (NSSet)disksToUnmount;
- (SKUnmountOperation)initWithDisk:(id)a3 options:(id)a4 withCompletionBlock:(id)a5;
- (id)description;
- (id)newPerformOperation;
- (int64_t)defaultErrorCode;
- (void)setDisksToUnmount:(id)a3;
@end

@implementation SKUnmountOperation

- (SKUnmountOperation)initWithDisk:(id)a3 options:(id)a4 withCompletionBlock:(id)a5
{
  id v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SKUnmountOperation;
  v9 = [(SKBaseDiskArbOperation *)&v18 initWithTarget:v8 options:a4 callbackBlock:a5];
  v10 = v9;
  if (v9)
  {
    v11 = [(SKBaseDiskArbOperation *)v9 options];
    v12 = [v11 objectForKeyedSubscript:kSKAPFSDiskUnmountIgnoreGroup];
    uint64_t v13 = [(SKBaseDiskArbOperation *)v10 disksForOperationWithTarget:v8 ignoreGroup:sub_100012340(v12)];
    disksToUnmount = v10->_disksToUnmount;
    v10->_disksToUnmount = (NSSet *)v13;

    if (![(SKBaseDiskArbOperation *)v10 recursive])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v8 isLiveFSAPFSDisk])
        {
          v15 = [(SKUnmountOperation *)v10 disksToUnmount];
          v16 = [v15 setByAddingObject:v8];
          [(SKUnmountOperation *)v10 setDisksToUnmount:v16];
        }
      }
    }
  }

  return v10;
}

+ (BOOL)unmountWithDisk:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v21 = v7;
  v9 = [[SKUnmountOperation alloc] initWithDisk:v7 options:v8 withCompletionBlock:0];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v10 = [(SKUnmountOperation *)v9 disksToUnmount];
  id v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v24;
    char v14 = 1;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        id v22 = 0;
        unsigned __int8 v17 = [(SKUnmountOperation *)v9 _unmountWithDisk:v16 error:&v22];
        id v18 = v22;
        v19 = v18;
        v14 &= v17;
        if ((v17 & 1) == 0)
        {
          if (a5)
          {
            char v14 = 0;
            if (!*a5) {
              *a5 = v18;
            }
          }
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v12);
  }
  else
  {
    char v14 = 1;
  }

  return v14;
}

- (BOOL)_unmountWithDADisk:(id)a3
{
  v4 = (__DADisk *)a3;
  v5 = [(SKBaseDiskArbOperation *)self options];
  v6 = [v5 objectForKeyedSubscript:kSKDiskUnmountOptionForce];
  if (sub_100012340(v6))
  {
    unsigned int v7 = 1;
  }
  else
  {
    id v8 = [(SKBaseDiskArbOperation *)self options];
    v9 = [v8 objectForKeyedSubscript:kSKAPFSDiskUnmountForce];
    unsigned int v7 = sub_100012340(v9);
  }
  v10 = sub_10000DD48();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    v15 = v4;
    __int16 v16 = 1024;
    unsigned int v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Calling DADiskUnmount for %@, force=%d", (uint8_t *)&v14, 0x12u);
  }

  if (v7) {
    DADiskUnmountOptions v11 = 0x80000;
  }
  else {
    DADiskUnmountOptions v11 = 0;
  }
  DADiskUnmount(v4, v11, (DADiskUnmountCallback)sub_100019AEC, self);
  BOOL v12 = [(SKBaseDiskArbOperation *)self completeDiskArbOp];

  return v12;
}

- (BOOL)unmountSnapshotsWithDisk:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v31 = 0;
  int v6 = getmntinfo_r_np(&v31, 2);
  if (v6 < 0)
  {
    if (a4)
    {
      NSErrorUserInfoKey v38 = NSDebugDescriptionErrorKey;
      CFStringRef v39 = @"getmntinfo failed";
      v30 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
      +[SKError errorWithCode:userInfo:](SKError, "errorWithCode:userInfo:", 102);
      BOOL v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    unsigned int v7 = v6;
    long long v26 = a4;
    id v27 = v5;
    id v8 = [v5 diskIdentifier];
    v29 = +[NSString stringWithFormat:@"@/dev/%@", v8];

    if (v7)
    {
      uint64_t v9 = 0;
      BOOL v10 = 0;
      unint64_t v11 = v7;
      uint64_t v12 = 1112;
      uint64_t v13 = &APFSCancelContainerResize_ptr;
      while (1)
      {
        int v14 = +[NSString stringWithUTF8String:(char *)v31 + v12];
        if ([v14 hasSuffix:v29])
        {
          CFURLRef v15 = [v13[234] fileURLWithFileSystemRepresentation:(char *)v31 + v12 - 1024 isDirectory:1 relativeToURL:0];
          if (v15)
          {
            __int16 v16 = +[SKDaemonManager sharedManager];
            DADiskRef v17 = DADiskCreateFromVolumePath(kCFAllocatorDefault, (DASessionRef)[v16 diskArbSession], v15);

            if (v17)
            {
              id v18 = [(__CFURL *)v15 path];
              v19 = +[NSString stringWithFormat:@"Unmount of snapshot %@ from %@", v14, v18];
              [(SKBaseDiskArbOperation *)self setCurrentOperationName:v19];

              uint64_t v13 = &APFSCancelContainerResize_ptr;
              if (![(SKUnmountOperation *)self _unmountWithDADisk:v17])
              {
                long long v23 = sub_10000DD48();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                {
                  long long v25 = [(__CFURL *)v15 path];
                  *(_DWORD *)buf = 136315650;
                  v33 = "-[SKUnmountOperation unmountSnapshotsWithDisk:error:]";
                  __int16 v34 = 2112;
                  v35 = v14;
                  __int16 v36 = 2112;
                  v37 = v25;
                  _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s: Failed to unmount snapshot %@ from %@", buf, 0x20u);
                }
                id v5 = v27;
                if (v26) {
                  *long long v26 = [(SKBaseDiskArbOperation *)self newDAError];
                }
                free(v31);

                goto LABEL_20;
              }
            }
            else
            {
              v20 = sub_10000DD48();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                v21 = [(__CFURL *)v15 path];
                *(_DWORD *)buf = 136315394;
                v33 = "-[SKUnmountOperation unmountSnapshotsWithDisk:error:]";
                __int16 v34 = 2112;
                v35 = v21;
                _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s: Failed to create DADisk from %@", buf, 0x16u);

                uint64_t v13 = &APFSCancelContainerResize_ptr;
              }
            }
          }
        }
        BOOL v10 = ++v9 >= v11;
        v12 += 2168;
        if (v11 == v9) {
          goto LABEL_19;
        }
      }
    }
    BOOL v10 = 1;
LABEL_19:
    free(v31);
    id v5 = v27;
LABEL_20:
  }
  return v10;
}

- (BOOL)_unmountWithDisk:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned int v7 = [v6 mountPoint];
  id v8 = [v6 type];
  if ([v8 isEqualToString:kSKDiskTypeAPFSLV])
  {
    uint64_t v9 = [(SKBaseDiskArbOperation *)self options];
    BOOL v10 = [v9 objectForKeyedSubscript:kSKDiskMountOptionRecursive];
    unsigned int v11 = sub_100012340(v10);

    if (v11 && ![(SKUnmountOperation *)self unmountSnapshotsWithDisk:v6 error:a4]) {
      goto LABEL_17;
    }
    if (!v7) {
      goto LABEL_19;
    }
  }
  else
  {

    if (!v7)
    {
LABEL_19:
      BOOL v19 = 1;
      goto LABEL_20;
    }
  }
  [(id)objc_opt_class() storeMountState:v6];
  uint64_t v12 = [v6 type];
  if ([v12 isEqualToString:kSKDiskTypeAPFSLV]
    && [v6 isEncrypted]
    && ![v6 defaultEffaceable])
  {
    v21 = [(SKBaseDiskArbOperation *)self options];
    id v22 = [v21 objectForKey:kSKAPFSDiskUnmountDoNotLock];
    unsigned int v23 = [v22 BOOLValue];

    if (!v23) {
      goto LABEL_11;
    }
    char v24 = 1;
    if (!fsctl((const char *)[v7 fileSystemRepresentation], 0x80014A22uLL, &v24, 0))goto LABEL_11; {
    uint64_t v12 = sub_10000DD48();
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      long long v26 = "-[SKUnmountOperation _unmountWithDisk:error:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s: Failed to stash crypto key for APFS LV, remount may fail.", buf, 0xCu);
    }
  }

LABEL_11:
  uint64_t v13 = +[NSString stringWithFormat:@"Unmount of %@", v6];
  [(SKBaseDiskArbOperation *)self setCurrentOperationName:v13];

  int v14 = [v6 daDisk];
  unsigned int v15 = [(SKUnmountOperation *)self _unmountWithDADisk:v14];

  if (v15)
  {
    [(SKBaseDiskArbOperation *)self removeWithMountPoint:v7];
    goto LABEL_19;
  }
  __int16 v16 = [v6 daDisk];
  CFDictionaryRef v17 = DADiskCopyDescription(v16);

  id v18 = [(__CFDictionary *)v17 objectForKeyedSubscript:kDADiskDescriptionVolumePathKey];

  if (!v18)
  {

    goto LABEL_19;
  }
  if (a4) {
    *a4 = [(SKBaseDiskArbOperation *)self newDAError];
  }

LABEL_17:
  BOOL v19 = 0;
LABEL_20:

  return v19;
}

- (id)newPerformOperation
{
  v3 = dispatch_group_create();
  if ([(SKBaseDiskArbOperation *)self recursive]
    || ([(SKUnmountOperation *)self disksToUnmount],
        v4 = objc_claimAutoreleasedReturnValue(),
        id v5 = [v4 count],
        v4,
        v5))
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v34 = 0u;
    long long v33 = 0u;
    id v6 = [(SKUnmountOperation *)self disksToUnmount];
    id v7 = [v6 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v7)
    {
      id v8 = v7;
      id v9 = 0;
      uint64_t v10 = *(void *)v34;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v34 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          id v32 = 0;
          unsigned __int8 v13 = [(SKUnmountOperation *)self _unmountWithDisk:v12 error:&v32];
          id v14 = v32;
          unsigned int v15 = v14;
          if ((v13 & 1) == 0 && !v9) {
            id v9 = v14;
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v8);
    }
    else
    {
      id v9 = 0;
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = [(SKUnmountOperation *)self disksToUnmount];
    id v16 = [obj countByEnumeratingWithState:&v28 objects:v37 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v29;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          v20 = v3;
          if (*(void *)v29 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void *)(*((void *)&v28 + 1) + 8 * (void)j);
          id v22 = dispatch_get_global_queue(0, 0);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10001B35C;
          block[3] = &unk_100048B88;
          block[4] = v21;
          v3 = v20;
          dispatch_group_async(v20, v22, block);
        }
        id v17 = [obj countByEnumeratingWithState:&v28 objects:v37 count:16];
      }
      while (v17);
    }

    dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
    id v23 = v9;
    char v24 = v23;
  }
  else
  {
    char v24 = +[SKError errorWithCode:119 userInfo:0];
    id v23 = 0;
  }

  return v24;
}

- (id)description
{
  v3 = [(SKUnmountOperation *)self disksToUnmount];
  v4 = [(SKBaseDiskArbOperation *)self options];
  id v5 = +[NSString stringWithFormat:@"Unmount Operation for %@ with %@", v3, v4];

  return v5;
}

- (int64_t)defaultErrorCode
{
  return 401;
}

- (NSSet)disksToUnmount
{
  return (NSSet *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDisksToUnmount:(id)a3
{
}

- (void).cxx_destruct
{
}

@end