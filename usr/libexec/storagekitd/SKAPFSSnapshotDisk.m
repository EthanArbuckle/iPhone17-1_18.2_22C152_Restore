@interface SKAPFSSnapshotDisk
+ (BOOL)diskIsSnapshot:(id)a3;
+ (BOOL)isiOSRootSnapshotWithDiskDescription:(id)a3;
- (BOOL)_cacheInfo;
- (BOOL)_supportsRecaching;
@end

@implementation SKAPFSSnapshotDisk

+ (BOOL)diskIsSnapshot:(id)a3
{
  id v3 = a3;
  v4 = [[SKIOMedia alloc] initWithDADisk:v3];

  if (v4) {
    BOOL v5 = IOObjectConformsTo([(SKIOObject *)v4 ioObj], "AppleAPFSSnapshot") != 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_cacheInfo
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(SKAPFSSnapshotDisk *)v2 daDisk];
  v4 = +[SKDaemonManager sharedManager];
  BOOL v5 = (__DASession *)[v4 diskArbSession];

  CFDictionaryRef v6 = DADiskCopyDescription(v3);
  CFDictionaryRef v7 = v6;
  if (v6)
  {
    v8 = [(__CFDictionary *)v6 objectForKeyedSubscript:kDADiskDescriptionVolumePathKey];
    unsigned int v9 = [(id)objc_opt_class() isiOSRootSnapshotWithDiskDescription:v7];
    char v10 = v9;
    if (v9)
    {
      [(SKAPFSSnapshotDisk *)v2 setSealStatus:0];
      if (!v8)
      {
        v31 = +[SKBaseManager sharedManager];
        [v31 logEvent:@"com.apple.StorageKit.log.fault" eventPayloadBuilder:&stru_100048B40];

        v32 = sub_10000DD48();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
        {
          v63.f_bsize = 136315138;
          *(void *)&v63.f_iosize = "-[SKAPFSSnapshotDisk(Daemon) _cacheInfo]";
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_FAULT, "%s: Unmounted root snapshot", (uint8_t *)&v63, 0xCu);
        }
LABEL_25:

LABEL_45:
        DADiskRef v21 = 0;
LABEL_46:
        int v22 = 1;
LABEL_47:

        goto LABEL_48;
      }
      memset(&v63, 0, 512);
      v11 = v8;
      if (statfs((const char *)[v11 fileSystemRepresentation], &v63) == -1)
      {
        v38 = sub_10000DD48();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          int v39 = *__error();
          *(_DWORD *)buf = 136315650;
          v58 = "-[SKAPFSSnapshotDisk(Daemon) _cacheInfo]";
          __int16 v59 = 2112;
          v60 = v11;
          __int16 v61 = 1024;
          LODWORD(v62) = v39;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%s: statfs failed for %@, errno %d", buf, 0x1Cu);
        }

        goto LABEL_45;
      }
      v12 = +[NSString stringWithUTF8String:v63.f_mntfromname];
      v13 = [v12 componentsSeparatedByString:@"@/dev/"];
      if ([v13 count] != (id)2
        || ([v13 objectAtIndexedSubscript:1],
            v14 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v15 = [v14 hasPrefix:@"disk"],
            v14,
            (v15 & 1) == 0))
      {
        v37 = sub_10000DD48();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v58 = "-[SKAPFSSnapshotDisk(Daemon) _cacheInfo]";
          __int16 v59 = 2112;
          v60 = v12;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%s: Unexpected mntFromName for root disk: %@", buf, 0x16u);
        }

        goto LABEL_45;
      }
      v16 = [v13 objectAtIndexedSubscript:0];
      [(SKAPFSSnapshotDisk *)v2 setSnapshotName:v16];

      v17 = [v13 objectAtIndexedSubscript:1];
      v18 = [v17 stringByAppendingString:@":root_snapshot"];
      [(SKAPFSSnapshotDisk *)v2 setDiskIdentifier:v18];

      v19 = +[SKDaemonManager sharedManager];
      session = (__DASession *)[v19 diskArbSession];
      id v20 = v17;
      DADiskRef v21 = DADiskCreateFromBSDName(0, session, (const char *)[v20 UTF8String]);

LABEL_18:
      v28 = [(SKAPFSSnapshotDisk *)v2 diskIdentifier];
      BOOL v29 = v28 == 0;

      if (v29)
      {
        v40 = sub_10000DD48();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          v63.f_bsize = 136315138;
          *(void *)&v63.f_iosize = "-[SKAPFSSnapshotDisk(Daemon) _cacheInfo]";
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%s: No disk identifier for snapshot", (uint8_t *)&v63, 0xCu);
        }

        goto LABEL_46;
      }
      if (v21)
      {
        v56.receiver = v2;
        v56.super_class = (Class)SKAPFSSnapshotDisk;
        if (([(SKAPFSSnapshotDisk *)&v56 _cacheInfoForDADisk:v21] & 1) == 0)
        {
          v43 = sub_10000DD48();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            v63.f_bsize = 136315138;
            *(void *)&v63.f_iosize = "-[SKAPFSSnapshotDisk(Daemon) _cacheInfo]";
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%s: Failed to cache livefs data", (uint8_t *)&v63, 0xCu);
          }
          goto LABEL_70;
        }
        if (v10)
        {
          v30 = 0;
        }
        else
        {
          v44 = [(SKAPFSSnapshotDisk *)v2 mediaUUID];
          [(SKAPFSSnapshotDisk *)v2 setApfsUUID:v44];

          v30 = [(__CFDictionary *)v7 objectForKeyedSubscript:kDADiskDescriptionMediaUUIDKey];

          if (v30) {
            v45 = (__CFString *)CFUUIDCreateString(0, (CFUUIDRef)v30);
          }
          else {
            v45 = 0;
          }
          [(SKAPFSSnapshotDisk *)v2 setMediaUUID:v45];
          if (v30) {

          }
          v46 = [(SKAPFSSnapshotDisk *)v2 mediaUUID];
          BOOL v47 = v46 == 0;

          if (v47)
          {
            v43 = sub_10000DD48();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            {
              v53 = [(SKAPFSSnapshotDisk *)v2 diskIdentifier];
              v63.f_bsize = 136315650;
              *(void *)&v63.f_iosize = "-[SKAPFSSnapshotDisk(Daemon) _cacheInfo]";
              WORD2(v63.f_blocks) = 2114;
              *(uint64_t *)((char *)&v63.f_blocks + 6) = (uint64_t)v53;
              HIWORD(v63.f_bfree) = 2080;
              v63.f_bavail = (uint64_t)"AppleAPFSSnapshot";
              _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%s: IOMedia for %{public}@ doesn't conform to %s. It's missing a UUID.", (uint8_t *)&v63, 0x20u);
            }
            goto LABEL_70;
          }
        }
        if (v8)
        {
          v48 = [v8 path];
          [(SKAPFSSnapshotDisk *)v2 setMountPoint:v48];

          if (([(SKAPFSSnapshotDisk *)v2 isIOSRootSnapshot] & 1) == 0)
          {
            memset(&v63.f_bavail, 0, 264);
            *(void *)&v63.f_bsize = 2;
            *(CFUUIDBytes *)&v63.f_blocks = CFUUIDGetUUIDBytes((CFUUIDRef)v30);
            if (fsctl((const char *)[v8 fileSystemRepresentation], 0xC1204A43uLL, &v63, 0))
            {
              v43 = sub_10000DD48();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                id v49 = [(SKAPFSSnapshotDisk *)v2 mountPoint];
                v50 = [v49 fileSystemRepresentation];
                v51 = __error();
                v52 = strerror(*v51);
                *(_DWORD *)buf = 136315650;
                v58 = "-[SKAPFSSnapshotDisk(Daemon) _cacheInfo]";
                __int16 v59 = 2080;
                v60 = v50;
                __int16 v61 = 2080;
                v62 = v52;
                _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%s: Failed to fsctl(%s). %s", buf, 0x20u);
              }
LABEL_70:

              goto LABEL_46;
            }
            id v54 = [objc_alloc((Class)NSString) initWithBytes:&v63.f_files length:strnlen((const char *)&v63.f_files, 0xFFuLL) encoding:4];
            [(SKAPFSSnapshotDisk *)v2 setSnapshotName:v54];
          }
        }
        else
        {
          [(SKAPFSSnapshotDisk *)v2 setMountPoint:0];
          [(SKAPFSSnapshotDisk *)v2 setUsedSpace:0];
        }
        [(SKAPFSSnapshotDisk *)v2 setReserveSpace:0];
        [(SKAPFSSnapshotDisk *)v2 setQuotaSpace:0];
        [(SKAPFSSnapshotDisk *)v2 _cacheSpacesWithPurgeable:1];
        [(SKAPFSSnapshotDisk *)v2 setRole:kSKDiskRoleSnapshot];
        int v22 = 0;
        goto LABEL_47;
      }
      v32 = sub_10000DD48();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v63.f_bsize = 136315138;
        *(void *)&v63.f_iosize = "-[SKAPFSSnapshotDisk(Daemon) _cacheInfo]";
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%s: Failed to create DADiskRef for snapshot's parent", (uint8_t *)&v63, 0xCu);
      }
      goto LABEL_25;
    }
    v23 = [[SKIOMedia alloc] initWithDADisk:v3];
    v24 = v23;
    if (v23)
    {
      if (IOObjectConformsTo([(SKIOObject *)v23 ioObj], "AppleAPFSSnapshot"))
      {
        [(SKAPFSSnapshotDisk *)v2 setSealStatus:sub_10000359C(v24)];
        if (([(SKAPFSSnapshotDisk *)v2 isValid] & 1) == 0)
        {
          v25 = [(__CFDictionary *)v7 objectForKeyedSubscript:kDADiskDescriptionMediaBSDNameKey];
          [(SKAPFSSnapshotDisk *)v2 setDiskIdentifier:v25];
        }
        id v26 = [(SKIOObject *)v24 copyParent];
        v27 = v26;
        if (v26)
        {
          if (IOObjectConformsTo((io_object_t)[v26 ioObj], "AppleAPFSVolume"))
          {
            DADiskRef v21 = DADiskCreateFromIOMedia(kCFAllocatorDefault, v5, (io_service_t)[v27 ioObj]);

            goto LABEL_18;
          }
          v41 = sub_10000DD48();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            v63.f_bsize = 136315138;
            *(void *)&v63.f_iosize = "-[SKAPFSSnapshotDisk(Daemon) _cacheInfo]";
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%s: Snapshot IOMedia's parent is not an APFS volume", (uint8_t *)&v63, 0xCu);
          }
        }
        goto LABEL_45;
      }
      v33 = sub_10000DD48();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v63.f_bsize = 136315394;
        *(void *)&v63.f_iosize = "-[SKAPFSSnapshotDisk(Daemon) _cacheInfo]";
        WORD2(v63.f_blocks) = 2080;
        *(uint64_t *)((char *)&v63.f_blocks + 6) = (uint64_t)"AppleAPFSSnapshot";
        v34 = "%s: IOMedia doesn't conform to %s";
        v35 = v33;
        uint32_t v36 = 22;
        goto LABEL_36;
      }
    }
    else
    {
      v33 = sub_10000DD48();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v63.f_bsize = 136315138;
        *(void *)&v63.f_iosize = "-[SKAPFSSnapshotDisk(Daemon) _cacheInfo]";
        v34 = "%s: Failed to copy IOMedia for diskRef";
        v35 = v33;
        uint32_t v36 = 12;
LABEL_36:
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, v34, (uint8_t *)&v63, v36);
      }
    }

    goto LABEL_45;
  }
  v8 = sub_10000DD48();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v63.f_bsize = 136315138;
    *(void *)&v63.f_iosize = "-[SKAPFSSnapshotDisk(Daemon) _cacheInfo]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s: DADiskCopyDescription failed for snapshot", (uint8_t *)&v63, 0xCu);
  }
  int v22 = 1;
LABEL_48:

  objc_sync_exit(v2);
  return v22 == 0;
}

- (BOOL)_supportsRecaching
{
  return [(SKAPFSSnapshotDisk *)self isIOSRootSnapshot] ^ 1;
}

+ (BOOL)isiOSRootSnapshotWithDiskDescription:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:kDADiskDescriptionMediaKindKey];

  if (v4)
  {
    unsigned __int8 v5 = 0;
  }
  else
  {
    CFDictionaryRef v6 = [v3 objectForKeyedSubscript:kDADiskDescriptionVolumePathKey];
    CFDictionaryRef v7 = v6;
    if (v6)
    {
      v8 = [v6 absoluteString];
      unsigned __int8 v5 = [v8 isEqualToString:@"file:///"];
    }
    else
    {
      unsigned __int8 v5 = 0;
    }
  }
  return v5;
}

@end