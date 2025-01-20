@interface MSDHVolumeManager
+ (id)sharedInstance;
- (BOOL)checkFreeSpaceLeftInContainer:(id)a3 neededSpace:(unint64_t)a4;
- (BOOL)deleteAPFSVolume:(id)a3;
- (BOOL)deleteDemoVolume;
- (BOOL)manageSnapshot:(id)a3 forVolumeAt:(id)a4;
- (BOOL)mountAPFSVolume:(id)a3 atMountPoint:(id)a4 withAttributes:(id)a5;
- (BOOL)mountSnapshotAt:(id)a3 forVolumeAt:(id)a4;
- (BOOL)setupDemoVolume;
- (BOOL)unmountAPFSVolume:(id)a3;
- (BOOL)unmountSnapshotAt:(id)a3;
- (MSDHVolumeManager)init;
- (NSString)demoVolumeDev;
- (NSString)userHomePath;
- (id)createAPFSVolume:(id)a3 withSizeInMB:(unint64_t)a4 inContainer:(id)a5;
- (id)findAPFSVolumeMountPoint:(id)a3;
- (id)getAPFSBootContainerDeviceNode;
- (id)lookupAPFSVolumeDevByName:(id)a3;
- (void)setDemoVolumeDev:(id)a3;
- (void)waitForSnapshotDeletionOnVolume:(int)a3;
@end

@implementation MSDHVolumeManager

+ (id)sharedInstance
{
  if (qword_100057DE0 != -1) {
    dispatch_once(&qword_100057DE0, &stru_10004CDA8);
  }
  v2 = (void *)qword_100057DD8;

  return v2;
}

- (MSDHVolumeManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)MSDHVolumeManager;
  v2 = [(MSDHVolumeManager *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(MSDHVolumeManager *)v2 lookupAPFSVolumeDevByName:@"com.apple.mobilestoredemo.storage"];
    [(MSDHVolumeManager *)v3 setDemoVolumeDev:v4];
  }
  return v3;
}

- (BOOL)manageSnapshot:(id)a3 forVolumeAt:(id)a4
{
  id v6 = a3;
  uint64_t v7 = open((const char *)[a4 UTF8String], 0);
  if ((int)v7 > 0)
  {
    if ([v6 isEqualToString:@"RevertSnapshot"])
    {
      int v8 = fs_snapshot_revert(v7, "com.apple.snapshot.mobilestoredemo", 0);
      v9 = sub_100027250();
      v10 = v9;
      if (!v8)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v17) = 0;
          v11 = "Snapshot reverted.";
LABEL_21:
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v17, 2u);
          goto LABEL_22;
        }
        goto LABEL_22;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10002FAEC();
      }
    }
    else
    {
      if ([v6 isEqualToString:@"DeleteSnapshot"])
      {
        if (fs_snapshot_delete(v7, "com.apple.snapshot.mobilestoredemo", 0))
        {
          if (*__error() != 2)
          {
            v10 = sub_100027250();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
              sub_10002FB68();
            }
            goto LABEL_17;
          }
        }
        else
        {
          [(MSDHVolumeManager *)self waitForSnapshotDeletionOnVolume:v7];
        }
        v10 = sub_100027250();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v17) = 0;
          v11 = "Snapshot deleted.";
          goto LABEL_21;
        }
        goto LABEL_22;
      }
      if ([v6 isEqualToString:@"CreateSnapshot"])
      {
        int v12 = fs_snapshot_create(v7, "com.apple.snapshot.mobilestoredemo", 0);
        v13 = sub_100027250();
        v10 = v13;
        if (!v12)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v17) = 0;
            v11 = "Snapshot created.";
            goto LABEL_21;
          }
LABEL_22:
          BOOL v14 = 1;
          goto LABEL_23;
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_10002FBE4();
        }
      }
      else
      {
        v10 = sub_100027250();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v17 = 138543362;
          id v18 = v6;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Unknown snapshot operation: %{public}@", (uint8_t *)&v17, 0xCu);
        }
      }
    }
LABEL_17:
    BOOL v14 = 0;
LABEL_23:

    close(v7);
    goto LABEL_24;
  }
  v16 = sub_100027250();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_10002FA70();
  }

  BOOL v14 = 0;
LABEL_24:

  return v14;
}

- (BOOL)mountSnapshotAt:(id)a3 forVolumeAt:(id)a4
{
  id v5 = a3;
  int v6 = open((const char *)[a4 UTF8String], 0);
  if (v6 <= 0)
  {
    int v12 = sub_100027250();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10002FA70();
    }

    BOOL v8 = 0;
  }
  else
  {
    int v7 = fs_snapshot_mount(v6, (const char *)[v5 UTF8String], "com.apple.snapshot.mobilestoredemo", 0);
    BOOL v8 = v7 == 0;
    v9 = sub_100027250();
    v10 = v9;
    if (v7)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10002FC60();
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Snapshot mounted.", v13, 2u);
    }

    close(v6);
  }

  return v8;
}

- (BOOL)unmountSnapshotAt:(id)a3
{
  int v3 = unmount((const char *)[a3 UTF8String], 0x80000);
  v4 = sub_100027250();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10002FCDC();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Snapshot unmounted.", v7, 2u);
  }

  return v3 == 0;
}

- (BOOL)setupDemoVolume
{
  int v3 = [(MSDHVolumeManager *)self demoVolumeDev];

  if (!v3)
  {
    v4 = [(MSDHVolumeManager *)self getAPFSBootContainerDeviceNode];
    id v5 = [(MSDHVolumeManager *)self createAPFSVolume:@"com.apple.mobilestoredemo.storage" withSizeInMB:64 inContainer:v4];
    [(MSDHVolumeManager *)self setDemoVolumeDev:v5];

    int v6 = [(MSDHVolumeManager *)self demoVolumeDev];

    if (!v6) {
      goto LABEL_8;
    }
  }
  v16[0] = NSFileOwnerAccountName;
  v16[1] = NSFileGroupOwnerAccountName;
  v17[0] = @"mobile";
  v17[1] = @"mobile";
  v16[2] = NSFilePosixPermissions;
  int v7 = +[NSNumber numberWithShort:448];
  v17[2] = v7;
  int v6 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];

  BOOL v8 = [(MSDHVolumeManager *)self demoVolumeDev];
  unsigned int v9 = [(MSDHVolumeManager *)self mountAPFSVolume:v8 atMountPoint:@"/private/var/mnt/com.apple.mobilestoredemo.storage" withAttributes:v6];

  if (v9)
  {
    v10 = sub_100027250();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [(MSDHVolumeManager *)self demoVolumeDev];
      int v14 = 138543362;
      v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Demo volume '%{public}@' is created and mounted.", (uint8_t *)&v14, 0xCu);
    }
    BOOL v12 = 1;
  }
  else
  {
LABEL_8:
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)deleteDemoVolume
{
  int v3 = [(MSDHVolumeManager *)self demoVolumeDev];

  if (v3)
  {
    v4 = [(MSDHVolumeManager *)self demoVolumeDev];
    unsigned int v5 = [(MSDHVolumeManager *)self unmountAPFSVolume:v4];

    if (!v5) {
      return 0;
    }
    int v6 = [(MSDHVolumeManager *)self demoVolumeDev];
    unsigned int v7 = [(MSDHVolumeManager *)self deleteAPFSVolume:v6];

    if (!v7) {
      return 0;
    }
    [(MSDHVolumeManager *)self setDemoVolumeDev:0];
    BOOL v8 = sub_100027250();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = 0;
      unsigned int v9 = "Demo volume is unmounted and deleted.";
      v10 = (uint8_t *)&v12;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
    }
  }
  else
  {
    BOOL v8 = sub_100027250();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      unsigned int v9 = "Demo volume not found. Skip delete.";
      v10 = buf;
      goto LABEL_8;
    }
  }

  return 1;
}

- (NSString)userHomePath
{
  return NSHomeDirectoryForUser(@"mobile");
}

- (id)getAPFSBootContainerDeviceNode
{
  if (qword_100057DF0 != -1) {
    dispatch_once(&qword_100057DF0, &stru_10004CDC8);
  }
  v2 = (void *)qword_100057DE8;

  return v2;
}

- (id)createAPFSVolume:(id)a3 withSizeInMB:(unint64_t)a4 inContainer:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = +[NSMutableDictionary dictionary];
  v11 = 0;
  __int16 v12 = 0;
  if (v8 && v9)
  {
    if ([(MSDHVolumeManager *)self checkFreeSpaceLeftInContainer:v9 neededSpace:a4 << 20])
    {
      if (a4)
      {
        v13 = +[NSNumber numberWithUnsignedLongLong:a4 << 20];
        [v10 setObject:v13 forKey:kAPFSVolumeReserveSizeKey];
      }
      [v10 setObject:v8 forKey:kAPFSVolumeNameKey];
      id v14 = v9;
      [v14 UTF8String];
      if (APFSVolumeCreate())
      {
        v16 = sub_100027250();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_10002FF10();
        }
        v11 = 0;
        __int16 v12 = 0;
      }
      else
      {
        v15 = [v10 objectForKey:kAPFSVolumeFSIndexKey];
        __int16 v12 = v15;
        if (!v15 || ([v15 intValue] & 0x80000000) != 0)
        {
          v16 = sub_100027250();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            sub_10002FEDC();
          }
          v11 = 0;
        }
        else
        {
          v11 = [NSString stringWithFormat:@"%ss%d", [v14 UTF8String], objc_msgSend(v12, "intValue") + 1];
          v16 = sub_100027250();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v19 = v11;
            __int16 v20 = 2048;
            unint64_t v21 = a4;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "APFS volume '%{public}@' with size %llu MB is created.", buf, 0x16u);
          }
        }
      }
    }
    else
    {
      v11 = 0;
      __int16 v12 = 0;
    }
  }

  return v11;
}

- (BOOL)deleteAPFSVolume:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
    [v5 UTF8String];
    int v6 = APFSVolumeDelete();
    BOOL v7 = v6 == 0;
    id v8 = sub_100027250();
    id v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10002FF78();
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "APFS volume '%{public}@' deleted.", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)checkFreeSpaceLeftInContainer:(id)a3 neededSpace:(unint64_t)a4
{
  v7[0] = 0;
  v7[1] = 0;
  [a3 UTF8String];
  if (APFSContainerGetSpaceInfo())
  {
    int v6 = sub_100027250();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100030074();
    }
  }
  else
  {
    if (v7[0] > a4) {
      return 1;
    }
    int v6 = sub_100027250();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10002FFE0(v7, a4, v6);
    }
  }

  return 0;
}

- (id)lookupAPFSVolumeDevByName:(id)a3
{
  id v3 = a3;
  v4 = v3;
  io_iterator_t existing = 0;
  memset(name, 0, sizeof(name));
  CFMutableDictionaryRef properties = 0;
  if (v3)
  {
    id v5 = v3;
    CFDictionaryRef v6 = IOServiceNameMatching((const char *)[v5 UTF8String]);
    if (!IOServiceGetMatchingServices(kIOMasterPortDefault, v6, &existing))
    {
      io_object_t v7 = IOIteratorNext(existing);
      if (v7)
      {
        io_registry_entry_t v8 = v7;
        do
        {
          if (IOObjectConformsTo(v8, "AppleAPFSVolume"))
          {
            memset(name, 0, sizeof(name));
            if (IORegistryEntryGetName(v8, name)
              || IORegistryEntryCreateCFProperties(v8, &properties, kCFAllocatorDefault, 0))
            {
              goto LABEL_33;
            }
            if (!strncmp((const char *)[v5 UTF8String], name, 0x80uLL))
            {
              uint64_t v10 = CFDictionaryGetValue(properties, @"BSD Name");
              if (!v10) {
                goto LABEL_33;
              }
              int v11 = (void *)v10;
              id v9 = +[NSString stringWithFormat:@"/dev/%@", v10];
            }
            else
            {
              id v9 = 0;
            }
            CFRelease(properties);
          }
          else
          {
            id v9 = 0;
          }
          IOObjectRelease(v8);
          io_registry_entry_t v8 = IOIteratorNext(existing);
          if (v8) {
            BOOL v12 = v9 == 0;
          }
          else {
            BOOL v12 = 0;
          }
        }
        while (v12);
        IOObjectRelease(existing);
        if (v9)
        {
          v13 = sub_100027250();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            id v22 = v5;
            __int16 v23 = 2114;
            v24 = v9;
            id v14 = "APFS volume '%{public}@' found as '%{public}@'.";
            v15 = v13;
            uint32_t v16 = 22;
LABEL_24:
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
            goto LABEL_25;
          }
          goto LABEL_25;
        }
      }
      else
      {
        IOObjectRelease(existing);
        id v9 = 0;
      }
      v13 = sub_100027250();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v22 = v5;
        id v14 = "APFS volume '%{public}@' NOT found.";
        v15 = v13;
        uint32_t v16 = 12;
        goto LABEL_24;
      }
LABEL_25:

      goto LABEL_26;
    }
    id v18 = sub_100027250();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1000300DC();
    }
  }
  io_registry_entry_t v8 = 0;
LABEL_33:
  if (existing) {
    IOObjectRelease(existing);
  }
  if (v8) {
    IOObjectRelease(v8);
  }
  if (properties) {
    CFRelease(properties);
  }
  id v9 = 0;
LABEL_26:

  return v9;
}

- (id)findAPFSVolumeMountPoint:(id)a3
{
  id v3 = a3;
  uint32_t v16 = 0;
  if (!v3)
  {
LABEL_22:
    id v9 = 0;
    goto LABEL_16;
  }
  int v4 = getmntinfo_r_np(&v16, 2);
  if (v4 < 1 || (id v5 = v16) == 0)
  {
    id v14 = sub_100027250();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100030144();
    }

    goto LABEL_22;
  }
  unint64_t v6 = 0;
  uint64_t v7 = 2168 * v4;
  while (1)
  {
    if (!strncmp("apfs", v5[v6 / 0x878].f_fstypename, 0xFuLL))
    {
      io_registry_entry_t v8 = (const char *)[v3 UTF8String];
      id v5 = v16;
      if (!strncmp(v8, v16[v6 / 0x878].f_mntfromname, 0xFuLL)) {
        break;
      }
    }
    v6 += 2168;
    if (v7 == v6)
    {
      id v9 = 0;
      goto LABEL_15;
    }
  }
  memset(&v15, 0, sizeof(v15));
  int v10 = stat(v5[v6 / 0x878].f_mntonname, &v15);
  if (v10)
  {
    int v11 = v10;
    BOOL v12 = sub_100027250();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Mount point corrupted. error - %d", buf, 8u);
    }

    id v9 = 0;
  }
  else
  {
    id v9 = +[NSString stringWithUTF8String:v16[v6 / 0x878].f_mntonname];
  }
  id v5 = v16;
LABEL_15:
  free(v5);
LABEL_16:

  return v9;
}

- (BOOL)mountAPFSVolume:(id)a3 atMountPoint:(id)a4 withAttributes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = 0;
  id v12 = 0;
  long long v53 = 0u;
  memset(v54, 0, sizeof(v54));
  long long v51 = 0u;
  long long v52 = 0u;
  long long v50 = 0u;
  long long v49 = 0u;
  long long v48 = 0u;
  long long v47 = 0u;
  long long v46 = 0u;
  long long v45 = 0u;
  long long v44 = 0u;
  long long v43 = 0u;
  long long v42 = 0u;
  long long v41 = 0u;
  long long v40 = 0u;
  long long v39 = 0u;
  long long v38 = 0u;
  long long v37 = 0u;
  long long v36 = 0u;
  long long v35 = 0u;
  memset(&v29, 0, sizeof(v29));
  v13 = 0;
  if (v8 && v9)
  {
    id v14 = [(MSDHVolumeManager *)self findAPFSVolumeMountPoint:v8];

    if (v14)
    {
      v25 = sub_100027250();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_100030364();
      }
      id v12 = 0;
      v13 = 0;
    }
    else
    {
      v13 = +[NSFileManager defaultManager];
      id v28 = 0;
      unsigned __int8 v15 = [v13 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:&v28];
      id v12 = v28;
      if (v15)
      {
        id v16 = v9;
        if (stat((const char *)[v16 UTF8String], &v29))
        {
          v25 = sub_100027250();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            sub_100030250();
          }
        }
        else
        {
          id v34 = [v8 UTF8String];
          WORD4(v35) = 1;
          *(void *)&v54[3] = *(void *)&v29.st_uid;
          LODWORD(v35) = 0x100000;
          id v17 = v16;
          if (mount("apfs", (const char *)[v17 UTF8String], 0x100000, &v34))
          {
            unsigned int v18 = 3;
            do
            {
              v19 = sub_100027250();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                int v22 = *__error();
                *(_DWORD *)buf = 138543618;
                id v31 = v17;
                __int16 v32 = 1024;
                int v33 = v22;
                _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to mount APFS volume on %{public}@ - %{errno}d", buf, 0x12u);
              }

              if (*__error() != 2 || v18 < 2) {
                goto LABEL_31;
              }
              --v18;
              usleep(0x7A120u);
              unint64_t v21 = (const char *)[v17 UTF8String];
            }
            while (mount("apfs", v21, v35, &v34));
          }
          if (!v10)
          {
            BOOL v11 = 1;
            goto LABEL_32;
          }
          id v27 = v12;
          unsigned __int8 v23 = [v13 setAttributes:v10 ofItemAtPath:v17 error:&v27];
          id v24 = v27;

          if (v23)
          {
            BOOL v11 = 1;
            id v12 = v24;
            goto LABEL_32;
          }
          v25 = sub_100027250();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            sub_1000301C8(v24);
          }
          id v12 = v24;
        }
      }
      else
      {
        v25 = sub_100027250();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_1000302D0((uint64_t)v9, v12);
        }
      }
    }

LABEL_31:
    BOOL v11 = 0;
  }
LABEL_32:

  return v11;
}

- (BOOL)unmountAPFSVolume:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v10 = 0;
    id v7 = 0;
    id v8 = 0;
    BOOL v6 = 0;
    goto LABEL_11;
  }
  id v5 = [(MSDHVolumeManager *)self findAPFSVolumeMountPoint:v4];
  BOOL v6 = v5 == 0;
  if (!v5)
  {
    BOOL v11 = sub_100027250();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Volume is not mounted.", buf, 2u);
    }
    id v10 = 0;
    id v7 = 0;
    goto LABEL_9;
  }
  id v7 = v5;
  if (unmount((const char *)[v7 UTF8String], 0x80000))
  {
    BOOL v11 = sub_100027250();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10003042C();
    }
    id v10 = 0;
LABEL_9:
    id v8 = 0;
LABEL_10:

    goto LABEL_11;
  }
  id v8 = +[NSFileManager defaultManager];
  id v13 = 0;
  unsigned __int8 v9 = [v8 removeItemAtPath:v7 error:&v13];
  id v10 = v13;
  if ((v9 & 1) == 0)
  {
    BOOL v11 = sub_100027250();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100030398((uint64_t)v7, v10);
    }
    goto LABEL_10;
  }
  BOOL v6 = 1;
LABEL_11:

  return v6;
}

- (void)waitForSnapshotDeletionOnVolume:(int)a3
{
  v9[1] = 0;
  v9[2] = 0;
  v9[0] = 3;
  if (ffsctl(a3, 0x80184A24uLL, v9, 0) < 0)
  {
    int v3 = *__error();
    id v4 = sub_100027250();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3 == 35)
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        BOOL v6 = "Timed out waiting for snapshot deletion to finish.";
        id v7 = v4;
        uint32_t v8 = 2;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
    else if (v5)
    {
      *(_DWORD *)buf = 67240192;
      int v11 = v3;
      BOOL v6 = "Wait for snapshot deletion failed: %{public, errno}d";
      id v7 = v4;
      uint32_t v8 = 8;
      goto LABEL_7;
    }
  }
}

- (NSString)demoVolumeDev
{
  return self->_demoVolumeDev;
}

- (void)setDemoVolumeDev:(id)a3
{
}

- (void).cxx_destruct
{
}

@end