@interface MSDDemoVolumeManager
+ (id)sharedInstance;
- (BOOL)mountAPFSVolume:(id)a3 atMountPoint:(id)a4 withAttributes:(id)a5;
- (BOOL)moveStagingToFinal:(id)a3;
- (NSString)userHomePath;
- (id)findAPFSVolumeMountPoint:(id)a3;
- (id)lookupAPFSVolumeDevByName:(id)a3;
- (void)mountDemoVolume;
- (void)moveDataFromShelterToFinal;
@end

@implementation MSDDemoVolumeManager

+ (id)sharedInstance
{
  if (qword_10000C748 != -1) {
    dispatch_once(&qword_10000C748, &stru_100008390);
  }
  v2 = (void *)qword_10000C740;

  return v2;
}

- (NSString)userHomePath
{
  return NSHomeDirectoryForUser(@"mobile");
}

- (void)mountDemoVolume
{
  v3 = +[MSDLogModel sharedInstance];
  [v3 logMessage:1, @"[INF]", @"Mounting demo volume with name '%@' at '%@'...", @"com.apple.mobilestoredemo.storage", @"/private/var/mnt/com.apple.mobilestoredemo.storage" prefix message];

  v4 = [(MSDDemoVolumeManager *)self lookupAPFSVolumeDevByName:@"com.apple.mobilestoredemo.storage"];
  if (!v4)
  {
    v7 = 0;
    goto LABEL_8;
  }
  uint64_t v5 = [(MSDDemoVolumeManager *)self findAPFSVolumeMountPoint:v4];
  if (v5)
  {
    v6 = (__CFString *)v5;
    v7 = 0;
  }
  else
  {
    v13[0] = NSFileOwnerAccountName;
    v13[1] = NSFileGroupOwnerAccountName;
    v14[0] = @"mobile";
    v14[1] = @"mobile";
    v13[2] = NSFilePosixPermissions;
    v8 = +[NSNumber numberWithShort:448];
    v14[2] = v8;
    v7 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];

    v6 = @"/private/var/mnt/com.apple.mobilestoredemo.storage";
    if (![(MSDDemoVolumeManager *)self mountAPFSVolume:v4 atMountPoint:@"/private/var/mnt/com.apple.mobilestoredemo.storage" withAttributes:v7])goto LABEL_8; {
  }
    }
  unsigned __int8 v9 = [(__CFString *)v6 isEqualToString:@"/private/var/mnt/com.apple.mobilestoredemo.storage"];
  v10 = +[MSDLogModel sharedInstance];
  v11 = v10;
  if (v9) {
    [v10 logMessage:1 prefix:@"[INF]" message:@"Demo volume successfully mounted!"];
  }
  else {
    [v10 logMessage:1, @"[INF]", @"Demo volume incorrectly mounted at %@", v6 prefix message];
  }

LABEL_8:
}

- (void)moveDataFromShelterToFinal
{
  v3 = +[NSFileManager defaultManager];
  unsigned __int8 v11 = 0;
  if (![v3 fileExistsAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/DataShelter" isDirectory:&v11])goto LABEL_7; {
  int v4 = v11;
  }
  uint64_t v5 = +[MSDLogModel sharedInstance];
  v6 = v5;
  if (v4)
  {
    [v5 logMessage:1 prefix:@"[INF]" message:@"Moving files from data shelter folder..."];

    [(MSDDemoVolumeManager *)self moveStagingToFinal:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/DataShelter"];
  }
  else
  {
    [v5 logMessage:1, @"[INF]", @"%@ is not a folder.", @"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/DataShelter" prefix message];
  }
  if ([v3 fileExistsAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/DataShelter"])
  {
    id v10 = 0;
    unsigned __int8 v7 = [v3 removeItemAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/DataShelter" error:&v10];
    id v8 = v10;
    if ((v7 & 1) == 0)
    {
      unsigned __int8 v9 = +[MSDLogModel sharedInstance];
      [v9 logMessage:1, @"[INF]", @"Failed to remove data shelter folder with error - %@", v8 prefix message];
    }
  }
  else
  {
LABEL_7:
    id v8 = 0;
  }
}

- (id)lookupAPFSVolumeDevByName:(id)a3
{
  id v3 = a3;
  int v4 = v3;
  io_iterator_t existing = 0;
  memset(name, 0, sizeof(name));
  CFMutableDictionaryRef properties = 0;
  if (v3)
  {
    id v5 = v3;
    CFDictionaryRef v6 = IOServiceNameMatching((const char *)[v5 UTF8String]);
    uint64_t MatchingServices = IOServiceGetMatchingServices(kIOMasterPortDefault, v6, &existing);
    if (!MatchingServices)
    {
      io_object_t v8 = IOIteratorNext(existing);
      if (v8)
      {
        io_registry_entry_t v9 = v8;
        do
        {
          if (IOObjectConformsTo(v9, "AppleAPFSVolume"))
          {
            memset(name, 0, sizeof(name));
            if (IORegistryEntryGetName(v9, name)
              || IORegistryEntryCreateCFProperties(v9, &properties, kCFAllocatorDefault, 0))
            {
              goto LABEL_28;
            }
            if (!strncmp((const char *)[v5 UTF8String], name, 0x80uLL))
            {
              uint64_t v11 = CFDictionaryGetValue(properties, @"BSD Name");
              if (!v11) {
                goto LABEL_28;
              }
              uint64_t v12 = (void *)v11;
              id v10 = +[NSString stringWithFormat:@"/dev/%@", v11];
            }
            else
            {
              id v10 = 0;
            }
            CFRelease(properties);
          }
          else
          {
            id v10 = 0;
          }
          IOObjectRelease(v9);
          io_registry_entry_t v9 = IOIteratorNext(existing);
          if (v9) {
            BOOL v13 = v10 == 0;
          }
          else {
            BOOL v13 = 0;
          }
        }
        while (v13);
        IOObjectRelease(existing);
        if (v10)
        {
          v14 = +[MSDLogModel sharedInstance];
          [v14 logMessage:1, @"[INF]", @"APFS volume '%@' found as '%@'.", v5, v10 prefix message];
LABEL_22:

          goto LABEL_23;
        }
      }
      else
      {
        IOObjectRelease(existing);
        id v10 = 0;
      }
      v14 = +[MSDLogModel sharedInstance];
      [v14 logMessage:1, @"[INF]", @"APFS volume '%@' NOT found.", v5, v18 prefix message];
      goto LABEL_22;
    }
    uint64_t v16 = MatchingServices;
    v17 = +[MSDLogModel sharedInstance];
    [v17 logMessage:1 prefix:@"[INF]" message:@"Failed to scan IO Registry with error - %d" v16];
  }
  io_registry_entry_t v9 = 0;
LABEL_28:
  if (existing) {
    IOObjectRelease(existing);
  }
  if (v9) {
    IOObjectRelease(v9);
  }
  if (properties) {
    CFRelease(properties);
  }
  id v10 = 0;
LABEL_23:

  return v10;
}

- (id)findAPFSVolumeMountPoint:(id)a3
{
  id v3 = a3;
  v17 = 0;
  if (!v3) {
    goto LABEL_18;
  }
  int v4 = getmntinfo_r_np(&v17, 2);
  if (v4 < 1 || (id v5 = v17) == 0)
  {
    v14 = +[MSDLogModel sharedInstance];
    v15 = __error();
    [v14 logMessage:1 prefix:@"[INF]" message:@"Failed to get mounted filesystem info with error - %s", strerror(*v15)];

LABEL_18:
    io_registry_entry_t v9 = 0;
    goto LABEL_14;
  }
  unint64_t v6 = 0;
  uint64_t v7 = 2168 * v4;
  while (1)
  {
    if (!strncmp("apfs", v5[v6 / 0x878].f_fstypename, 0xFuLL))
    {
      io_object_t v8 = (const char *)[v3 UTF8String];
      id v5 = v17;
      if (!strncmp(v8, v17[v6 / 0x878].f_mntfromname, 0xFuLL)) {
        break;
      }
    }
    v6 += 2168;
    if (v7 == v6)
    {
      io_registry_entry_t v9 = 0;
      goto LABEL_13;
    }
  }
  memset(&v16, 0, sizeof(v16));
  uint64_t v10 = stat(v5[v6 / 0x878].f_mntonname, &v16);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = +[MSDLogModel sharedInstance];
    [v12 logMessage:1 prefix:@"[INF]" message:@"Mount point corrupted with error - %d", v11];

    io_registry_entry_t v9 = 0;
  }
  else
  {
    io_registry_entry_t v9 = +[NSString stringWithUTF8String:v17[v6 / 0x878].f_mntonname];
  }
  id v5 = v17;
LABEL_13:
  free(v5);
LABEL_14:

  return v9;
}

- (BOOL)mountAPFSVolume:(id)a3 atMountPoint:(id)a4 withAttributes:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = 0;
  BOOL v11 = 0;
  long long v46 = 0u;
  *(_OWORD *)v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v43 = 0u;
  long long v42 = 0u;
  long long v41 = 0u;
  long long v40 = 0u;
  long long v39 = 0u;
  long long v38 = 0u;
  long long v37 = 0u;
  long long v36 = 0u;
  long long v35 = 0u;
  long long v34 = 0u;
  long long v33 = 0u;
  long long v32 = 0u;
  long long v31 = 0u;
  long long v30 = 0u;
  long long v29 = 0u;
  long long v28 = 0u;
  memset(&v26, 0, sizeof(v26));
  id v12 = 0;
  if (v7 && v8)
  {
    uint64_t v10 = +[NSFileManager defaultManager];
    id v25 = 0;
    unsigned __int8 v13 = [v10 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:&v25];
    id v12 = v25;
    if (v13)
    {
      id v14 = v8;
      uint64_t v15 = stat((const char *)[v14 UTF8String], &v26);
      if (v15)
      {
        uint64_t v22 = v15;
        v20 = +[MSDLogModel sharedInstance];
        [v20 logMessage:1 prefix:@"[INF]" message:@"Failed to get file stat with error - %d", v22];
      }
      else
      {
        id v27 = [v7 UTF8String];
        WORD4(v28) = 1;
        *(void *)&v47[12] = *(void *)&v26.st_uid;
        LODWORD(v28) = 0x100000;
        id v16 = v14;
        if (mount("apfs", (const char *)[v16 UTF8String], 0x100000, &v27))
        {
          v20 = +[MSDLogModel sharedInstance];
          v23 = __error();
          [v20 logMessage:1 prefix:@"[INF]" message:@"Failed to mount APFS volume with error - %s", strerror(*v23)];
        }
        else
        {
          if (!v9)
          {
            BOOL v11 = 1;
            goto LABEL_10;
          }
          id v24 = v12;
          unsigned __int8 v17 = [v10 setAttributes:v9 ofItemAtPath:v16 error:&v24];
          id v18 = v24;

          if (v17)
          {
            BOOL v11 = 1;
            id v12 = v18;
            goto LABEL_10;
          }
          v20 = +[MSDLogModel sharedInstance];
          [v20 logMessage:1, @"[INF]", @"Failed to set file attributes on mount point - %@", v18 prefix message];
          id v12 = v18;
        }
      }
    }
    else
    {
      v20 = +[MSDLogModel sharedInstance];
      v21 = [v12 localizedDescription];
      [v20 logMessage:1, @"[INF]", @"Failed to create mount point at '%@' -  %@", v8, v21 prefix message];
    }
    BOOL v11 = 0;
  }
LABEL_10:

  return v11;
}

- (BOOL)moveStagingToFinal:(id)a3
{
  id v27 = a3;
  id v3 = +[NSFileManager defaultManager];
  if ([v3 fileExistsAtPath:@"/private/var/demo_backup/backup"])
  {
    [v3 enumeratorAtPath:v27];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = [v4 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v5)
    {
      id v6 = v5;
      id v24 = 0;
      id v25 = v4;
      uint64_t v7 = *(void *)v31;
      stat v26 = v3;
      uint64_t v23 = *(void *)v31;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v31 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          BOOL v11 = [v27 stringByAppendingPathComponent:v9];
          if ([v3 fileExistsAtPath:v11])
          {
            id v12 = [@"/private/var/demo_backup/backup" stringByAppendingPathComponent:v9];
            unsigned __int8 v13 = [v12 stringByDeletingLastPathComponent];
            if (([v3 fileExistsAtPath:v12] & 1) == 0
              && [v3 fileExistsAtPath:v13])
            {
              id v14 = +[MSDLogModel sharedInstance];
              [v14 logMessage:1, @"[INF]", @"Moving %@ to %@", v11, v12 prefix message];

              id v29 = v24;
              unsigned int v15 = [v3 moveItemAtPath:v11 toPath:v12 error:&v29];
              id v16 = v29;

              if (!v15)
              {
                v21 = +[MSDLogModel sharedInstance];
                uint64_t v22 = [v16 localizedDescription];
                [v21 logMessage:1, @"[INF]", @"Cannot move %@ to %@ with error - %@", v11, v12, v22 prefix message];

                BOOL v17 = 0;
                id v18 = v25;
                id v3 = v26;
                id v4 = v25;
                goto LABEL_19;
              }
              id v24 = v16;
              uint64_t v7 = v23;
            }

            id v4 = v25;
            id v3 = v26;
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v6) {
          continue;
        }
        break;
      }
      BOOL v17 = 1;
      id v18 = v4;
      id v16 = v24;
    }
    else
    {
      id v16 = 0;
      BOOL v17 = 1;
      id v18 = v4;
    }
    goto LABEL_19;
  }
  uint64_t v19 = +[MSDLogModel sharedInstance];
  BOOL v17 = 1;
  [(id)v19 logMessage:1, @"[INF]", @"Moving %@ to %@", v27, @"/private/var/demo_backup/backup" prefix message];

  id v28 = 0;
  LOBYTE(v19) = [v3 moveItemAtPath:v27 toPath:@"/private/var/demo_backup/backup" error:&v28];
  id v16 = v28;
  if ((v19 & 1) == 0)
  {
    id v4 = +[MSDLogModel sharedInstance];
    id v18 = [v16 localizedDescription];
    [v4 logMessage:1, @"[INF]", @"Could not move %@ to %@ with error - %@", v27, @"/private/var/demo_backup/backup", v18 prefix message];
    BOOL v17 = 0;
LABEL_19:
  }
  return v17;
}

@end