@interface LPAPFSVolume
+ (id)defaultMountPointGivenRole:(int)a3;
+ (id)defaultVolumeNameGivenRole:(int)a3;
+ (id)supportedContentTypes;
+ (void)_loadMountPointTableForMode:(int)a3;
+ (void)initialize;
- (BOOL)createSnapshot:(id)a3 error:(id *)a4;
- (BOOL)deleteSnapshots:(id)a3 waitForDeletionFor:(double)a4 error:(id *)a5;
- (BOOL)deleteVolumeWithError:(id *)a3;
- (BOOL)eraseVolumeWithError:(id *)a3;
- (BOOL)isCaseSenstive;
- (BOOL)isEncrypted;
- (BOOL)isFilevaultEncrypted;
- (BOOL)isMounted;
- (BOOL)mountAtPath:(id)a3 error:(id *)a4;
- (BOOL)mountAtPath:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)mountWithError:(id *)a3;
- (BOOL)renameSnapshot:(id)a3 to:(id)a4 error:(id *)a5;
- (BOOL)revertToSnapshot:(id)a3 error:(id *)a4;
- (BOOL)revertToSnapshot:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)rootToSnapshot:(id)a3 error:(id *)a4;
- (BOOL)setRole:(int)a3 withError:(id *)a4;
- (BOOL)unmountAllWithError:(id *)a3;
- (BOOL)unmountWithError:(id *)a3;
- (BOOL)unmountWithOptions:(id)a3 error:(id *)a4;
- (id)_createTemporaryMountPointWithError:(id *)a3;
- (id)container;
- (id)mountAtTemporaryPathWithError:(id *)a3;
- (id)mountAtTemporaryPathWithOptions:(id)a3 error:(id *)a4;
- (id)pairedVolume;
- (id)snapshotInfoWithError:(id *)a3;
- (id)snapshotMountPoints;
- (id)snapshotsWithError:(id *)a3;
- (id)volumeGroupUUID;
- (int)role;
@end

@implementation LPAPFSVolume

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v37 = +[NSNumber numberWithInt:0];
    v38[0] = v37;
    v36 = +[NSNumber numberWithInt:0];
    v39[0] = v36;
    v35 = +[NSNumber numberWithInt:1];
    v38[1] = v35;
    v34 = +[NSNumber numberWithInt:1];
    v39[1] = v34;
    v33 = +[NSNumber numberWithInt:2];
    v38[2] = v33;
    v32 = +[NSNumber numberWithInt:2];
    v39[2] = v32;
    v31 = +[NSNumber numberWithInt:4];
    v38[3] = v31;
    v30 = +[NSNumber numberWithInt:4];
    v39[3] = v30;
    v29 = +[NSNumber numberWithInt:8];
    v38[4] = v29;
    v28 = +[NSNumber numberWithInt:5];
    v39[4] = v28;
    v27 = +[NSNumber numberWithInt:16];
    v38[5] = v27;
    v26 = +[NSNumber numberWithInt:6];
    v39[5] = v26;
    v25 = +[NSNumber numberWithInt:64];
    v38[6] = v25;
    v24 = +[NSNumber numberWithInt:3];
    v39[6] = v24;
    v23 = +[NSNumber numberWithInt:128];
    v38[7] = v23;
    v22 = +[NSNumber numberWithInt:8];
    v39[7] = v22;
    v21 = +[NSNumber numberWithInt:256];
    v38[8] = v21;
    v20 = +[NSNumber numberWithInt:9];
    v39[8] = v20;
    v19 = +[NSNumber numberWithInt:512];
    v38[9] = v19;
    v18 = +[NSNumber numberWithInt:10];
    v39[9] = v18;
    v17 = +[NSNumber numberWithInt:384];
    v38[10] = v17;
    v16 = +[NSNumber numberWithInt:11];
    v39[10] = v16;
    v15 = +[NSNumber numberWithInt:192];
    v38[11] = v15;
    v14 = +[NSNumber numberWithInt:12];
    v39[11] = v14;
    v2 = +[NSNumber numberWithInt:320];
    v38[12] = v2;
    v3 = +[NSNumber numberWithInt:13];
    v39[12] = v3;
    v4 = +[NSNumber numberWithInt:448];
    v38[13] = v4;
    v5 = +[NSNumber numberWithInt:14];
    v39[13] = v5;
    v6 = +[NSNumber numberWithInt:576];
    v38[14] = v6;
    v7 = +[NSNumber numberWithInt:15];
    v39[14] = v7;
    v8 = +[NSNumber numberWithInt:32];
    v38[15] = v8;
    v9 = +[NSNumber numberWithInt:7];
    v39[15] = v9;
    v10 = +[NSNumber numberWithInt:640];
    v38[16] = v10;
    v11 = +[NSNumber numberWithInt:16];
    v39[16] = v11;
    v12 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:17];
    v13 = (void *)sRoleLookupTable;
    sRoleLookupTable = (uint64_t)v12;

    if (_is_running_in_ramdisk_onceToken != -1) {
      dispatch_once(&_is_running_in_ramdisk_onceToken, &__block_literal_global_186);
    }
    +[LPAPFSVolume _loadMountPointTableForMode:(_is_running_in_ramdisk_is_ramdisk & 1) == 0];
  }
}

+ (id)supportedContentTypes
{
  if ((id)objc_opt_class() == a1)
  {
    v6 = LPAPFSVolumeMediaTypeUUID[0];
    v3 = +[NSArray arrayWithObjects:&v6 count:1];
  }
  else
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___LPAPFSVolume;
    v3 = (NSArray *)objc_msgSendSuper2(&v5, "supportedContentTypes");
  }
  return v3;
}

+ (void)_loadMountPointTableForMode:(int)a3
{
  v3 = (int *)((char *)&kLPDefaultMountPointTable + 16 * a3);
  int v4 = *v3;
  uint64_t v5 = *((void *)v3 + 1);
  v6 = +[NSMutableDictionary dictionaryWithCapacity:*v3];
  if (v4 >= 1)
  {
    uint64_t v7 = v4;
    v8 = (uint64_t *)(v5 + 8);
    do
    {
      uint64_t v9 = *((unsigned int *)v8 - 2);
      uint64_t v10 = *v8;
      v8 += 2;
      v11 = +[NSString stringWithUTF8String:v10];
      v12 = +[NSNumber numberWithInt:v9];
      [(NSMutableDictionary *)v6 setObject:v11 forKey:v12];

      --v7;
    }
    while (v7);
  }
  v13 = +[NSDictionary dictionaryWithDictionary:v6];
  v14 = (void *)sMountPointLookupTable;
  sMountPointLookupTable = (uint64_t)v13;
}

+ (id)defaultMountPointGivenRole:(int)a3
{
  v3 = (void *)sMountPointLookupTable;
  int v4 = +[NSNumber numberWithInt:*(void *)&a3];
  id v5 = [v3 objectForKey:v4];

  return v5;
}

+ (id)defaultVolumeNameGivenRole:(int)a3
{
  uint64_t v3 = 0;
  while (sLegacyVolumeNameMapping[v3] != a3)
  {
    v3 += 4;
    if (v3 == 44)
    {
      id v4 = 0;
      goto LABEL_6;
    }
  }
  id v4 = *(id *)&sLegacyVolumeNameMapping[v3 + 2];
LABEL_6:
  return v4;
}

- (BOOL)setRole:(int)a3 withError:(id *)a4
{
  id v6 = [(LPMedia *)self BSDName];
  for (uint64_t i = 0; i != 34; i += 2)
  {
    if (sRoleEncodingMapping[i] == a3) {
      break;
    }
  }
  id v8 = v6;
  [v8 fileSystemRepresentation];
  int v9 = APFSVolumeRole();
  int v10 = v9;
  if (a4 && v9) {
    *a4 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v9 userInfo:0];
  }

  return v10 == 0;
}

- (int)role
{
  id v3 = [(LPMedia *)self BSDName];
  [v3 UTF8String];
  int v4 = APFSVolumeRole();

  if (v4)
  {
    _os_log_pack_size();
    uint64_t v5 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v5 = 136315394;
    *(void *)(v5 + 4) = "-[LPAPFSVolume role]";
    *(_WORD *)(v5 + 12) = 1024;
    *(_DWORD *)(v5 + 14) = v4;
    _LPLogPack(1);
  }
  else
  {
    int v9 = (void *)sRoleLookupTable;
    int v10 = +[NSNumber numberWithInt:0];
    id v11 = [v9 objectForKey:v10];
    int v8 = [v11 intValue];

    if (v8) {
      return v8;
    }
  }
  id v6 = [(LPMedia *)self name];
  uint64_t v7 = 0;
  while (![v6 isEqualToString:*(void *)&sLegacyVolumeNameMapping[v7 + 2]])
  {
    v7 += 4;
    if (v7 == 44)
    {
      int v8 = 0;
      goto LABEL_8;
    }
  }
  int v8 = sLegacyVolumeNameMapping[v7];
LABEL_8:

  return v8;
}

- (id)volumeGroupUUID
{
  id v2 = [(LPMedia *)self getStringPropertyWithName:@"VolGroupUUID"];
  id v3 = (const char *)[v2 UTF8String];
  memset(uu, 0, sizeof(uu));
  if (!v3 || uuid_parse(v3, uu) || uuid_is_null(uu)) {
    id v4 = 0;
  }
  else {
    id v4 = v2;
  }

  return v4;
}

- (id)container
{
  io_iterator_t iterator = 0;
  if (IORegistryEntryCreateIterator([(LPMedia *)self ioMedia], "IOService", 3u, &iterator))
  {
    id v2 = 0;
  }
  else
  {
    uint64_t v3 = IOIteratorNext(iterator);
    if (v3)
    {
      uint64_t v4 = v3;
      id v2 = 0;
      do
      {
        if (IOObjectConformsTo(v4, "AppleAPFSMedia"))
        {
          uint64_t v5 = [(LPMedia *)[LPAPFSContainer alloc] initWithIOMediaObject:v4];
          id v6 = v5;
          BOOL v7 = v5 != 0;
          if (v5)
          {
            int v8 = v5;

            id v2 = v8;
          }
        }
        else
        {
          BOOL v7 = 0;
        }
        IOObjectRelease(v4);
        uint64_t v4 = IOIteratorNext(iterator);
        if (v4) {
          BOOL v9 = !v7;
        }
        else {
          BOOL v9 = 0;
        }
      }
      while (v9);
    }
    else
    {
      id v2 = 0;
    }
    IOObjectRelease(iterator);
  }
  return v2;
}

- (BOOL)isCaseSenstive
{
  return [(LPMedia *)self getBoolPropertyWithName:@"CaseSensitive"];
}

- (BOOL)isEncrypted
{
  id v2 = [(LPMedia *)self devNodePath];
  [v2 fileSystemRepresentation];
  APFSVolumeGetVEKState();

  return 0;
}

- (BOOL)isFilevaultEncrypted
{
  id v2 = [(LPMedia *)self devNodePath];
  [v2 fileSystemRepresentation];
  APFSVolumeGetVEKState();

  return 0;
}

- (id)pairedVolume
{
  id v3 = [(LPAPFSVolume *)self container];
  unsigned int v4 = [(LPAPFSVolume *)self role];
  id v5 = [(LPAPFSVolume *)self volumeGroupUUID];
  long long v15 = 0u;
  long long v16 = 0u;
  if (v4 == 1) {
    int v6 = 3;
  }
  else {
    int v6 = 1;
  }
  long long v17 = 0uLL;
  long long v18 = 0uLL;
  id v7 = objc_msgSend(v3, "volumes", (void)v15);
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v11 role] == v6)
        {
          id v12 = [v11 volumeGroupUUID];
          unsigned int v13 = [v12 isEqualToString:v5];

          if (v13)
          {
            id v8 = v11;
            goto LABEL_15;
          }
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  return v8;
}

- (id)snapshotMountPoints
{
  id v2 = [(LPMedia *)self devNodePath];
  if (v2)
  {
    id v3 = +[NSString stringWithFormat:@"@%@", v2];
    v20 = 0;
    int v4 = getmntinfo_r_np(&v20, 0);
    id v5 = +[NSMutableArray arrayWithCapacity:13];
    if (v4 >= 1)
    {
      long long v18 = v6;
      id v19 = v2;
      uint64_t v7 = 0;
      id v8 = 0;
      uint64_t v9 = 0;
      do
      {
        int v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v20[v7].f_mntfromname, v18, v19);
        if ([(NSString *)v10 hasSuffix:v3])
        {
          id v11 = [(NSString *)v10 substringToIndex:[(NSString *)v10 rangeOfString:@"@" options:4]];

          id v12 = +[NSString stringWithUTF8String:v20[v7].f_mntonname];
          v21[0] = LPAPFSVolumeSnapshotMountPointKeyName[0];
          v21[1] = LPAPFSVolumeSnapshotMountPointKeyMountPoint[0];
          v22[0] = v11;
          v22[1] = v12;
          unsigned int v13 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
          [(NSMutableArray *)v5 addObject:v13];

          uint64_t v9 = v12;
          id v8 = v11;
        }

        ++v7;
      }
      while (v4 != v7);

      int v6 = v18;
      id v2 = v19;
    }
    if (v20) {
      free(v20);
    }
    if ([(NSMutableArray *)v5 count]) {
      v14 = v5;
    }
    else {
      v14 = 0;
    }
    long long v15 = v14;
  }
  else
  {
    _os_log_pack_size();
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315138;
    *(void *)(v16 + 4) = "-[LPAPFSVolume snapshotMountPoints]";
    _LPLogPack(1);
    long long v15 = 0;
  }

  return v15;
}

- (BOOL)isMounted
{
  id v3 = [(LPMedia *)self mountPoint];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(LPAPFSVolume *)self snapshotMountPoints];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (BOOL)eraseVolumeWithError:(id *)a3
{
  id v4 = [(LPMedia *)self mountPoint];
  id v5 = v4;
  if (v4)
  {
    int v6 = _lp2_delete_directory_contents((const char *)[v4 fileSystemRepresentation]);
    if (a3 && v6) {
      *a3 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v6 userInfo:0];
    }
    BOOL v7 = *__error() == 0;
  }
  else
  {
    if (a3) {
      *a3 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
    }
    _os_log_pack_size();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315138;
    *(void *)(v8 + 4) = "-[LPAPFSVolume eraseVolumeWithError:]";
    _LPLogPack(1);
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)mountWithError:(id *)a3
{
  id v5 = [(LPMedia *)self mountPoint];

  if (v5) {
    return 1;
  }
  id v7 = +[LPAPFSVolume defaultMountPointGivenRole:[(LPAPFSVolume *)self role]];
  if (v7
    && (id v8 = +[LPMedia mediaForPath:v7],
        v8,
        !v8))
  {
    unsigned __int8 v6 = [(LPAPFSVolume *)self mountAtPath:v7 error:a3];
  }
  else
  {
    id v9 = [(LPAPFSVolume *)self mountAtTemporaryPathWithError:a3];
    unsigned __int8 v6 = v9 != 0;
  }
  return v6;
}

- (BOOL)mountAtPath:(id)a3 error:(id *)a4
{
  return [(LPAPFSVolume *)self mountAtPath:a3 options:0 error:a4];
}

- (id)_createTemporaryMountPointWithError:(id *)a3
{
  if (_is_running_in_ramdisk_onceToken != -1) {
    dispatch_once(&_is_running_in_ramdisk_onceToken, &__block_literal_global_186);
  }
  bzero(v8, 0x400uLL);
  __strlcpy_chk();
  if (mkdtemp(v8))
  {
    id v4 = +[NSString stringWithUTF8String:v8];
  }
  else
  {
    _os_log_pack_size();
    __chkstk_darwin();
    uint64_t v5 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v5 = 136315138;
    *(void *)(v5 + 4) = v8;
    _LPLogPack(1);
    if (*a3)
    {
      unsigned __int8 v6 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:*__error() userInfo:0];
      id v4 = 0;
      *a3 = v6;
    }
    else
    {
      id v4 = 0;
    }
  }
  return v4;
}

- (id)mountAtTemporaryPathWithError:(id *)a3
{
  return [(LPAPFSVolume *)self mountAtTemporaryPathWithOptions:0 error:a3];
}

- (id)mountAtTemporaryPathWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(LPAPFSVolume *)self _createTemporaryMountPointWithError:a4];
  if (v7 && [(LPAPFSVolume *)self mountAtPath:v7 options:v6 error:a4]) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)mountAtPath:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(LPMedia *)self devNodePath];
  if (v10)
  {
    id v11 = [(LPMedia *)self mountPoint];
    unsigned int v12 = [v11 isEqualToString:v8];
    if (!v9 && v12)
    {
      _os_log_pack_size();
      uint64_t v13 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v13 = 138412290;
      *(void *)(v13 + 4) = v8;
      _LPLogPack(2);
      BOOL v14 = 1;
LABEL_46:

      goto LABEL_47;
    }
    if (v11)
    {
      _os_log_pack_size();
      uint64_t v18 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v18 = 138412546;
      *(void *)(v18 + 4) = v11;
      *(_WORD *)(v18 + 12) = 2112;
      *(void *)(v18 + 14) = v8;
      _LPLogPack(2);
      BOOL v14 = 0;
      if (![(LPAPFSVolume *)self unmountWithError:a5]) {
        goto LABEL_46;
      }
    }
    id v19 = v8;
    int v20 = mkpath_np((const char *)[v19 fileSystemRepresentation], 0x1FFu);
    id v66 = v11;
    if (v20 && v20 != 17)
    {
      if (a5)
      {
        id v24 = v10;
        uint64_t v25 = v20;
        NSErrorUserInfoKey v76 = NSFilePathErrorKey;
        id v77 = v19;
        v26 = +[NSDictionary dictionaryWithObjects:&v77 forKeys:&v76 count:1];
        uint64_t v27 = v25;
        id v10 = v24;
        *a5 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v27 userInfo:v26];
      }
      _os_log_pack_size();
      uint64_t v28 = _os_log_pack_fill();
      id v29 = [(LPMedia *)self description];
      id v30 = [v29 UTF8String];
      id v31 = [v19 fileSystemRepresentation];
      *(_DWORD *)uint64_t v28 = 136380931;
      *(void *)(v28 + 4) = v30;
      *(_WORD *)(v28 + 12) = 2081;
      *(void *)(v28 + 14) = v31;

      _LPLogPack(1);
      BOOL v14 = 0;
      goto LABEL_46;
    }
    long long v72 = xmmword_1000596F0;
    long long v73 = unk_100059700;
    long long v74 = xmmword_100059710;
    uint64_t v75 = 0;
    long long v70 = off_1000596D0;
    long long v71 = unk_1000596E0;
    id v21 = [v9 objectForKeyedSubscript:LPAPFSVolumeMountOptionReadOnly[0]];
    v22 = v21;
    if (v21) {
      v23 = (NSNumber *)v21;
    }
    else {
      v23 = +[NSNumber numberWithBool:0];
    }
    v32 = v23;

    if ([(NSNumber *)v32 BOOLValue])
    {
      *((void *)&v70 + 1) = "-o";
      *(void *)&long long v71 = "rdonly";
      unsigned int v33 = 3;
    }
    else
    {
      unsigned int v33 = 1;
    }
    id v34 = [v9 objectForKeyedSubscript:LPAPFSVolumeMountOptionNoBrowse[0]];
    v35 = v34;
    if (v34) {
      v36 = (NSNumber *)v34;
    }
    else {
      v36 = +[NSNumber numberWithBool:1];
    }
    v37 = v36;

    if ([(NSNumber *)v37 BOOLValue])
    {
      *((void *)&v70 + v33) = "-o";
      unsigned int v38 = v33 + 1;
      v33 += 2;
      *((void *)&v70 + v38) = "nobrowse";
    }
    v67 = v19;
    id v39 = [v9 objectForKeyedSubscript:LPAPFSVolumeMountOptionNoFirmlinks[0]];
    v40 = v39;
    if (v39) {
      v41 = (NSNumber *)v39;
    }
    else {
      v41 = +[NSNumber numberWithBool:0];
    }
    v42 = v41;

    if ([(NSNumber *)v42 BOOLValue]) {
      *((void *)&v70 + v33++) = "-n";
    }
    v63 = v37;
    v64 = v32;
    id v43 = [v9 objectForKeyedSubscript:LPAPFSVolumeMountOptionSnapshotName[0]];
    id v59 = [v43 length];
    v62 = v42;
    id v61 = v43;
    if (v59)
    {
      unsigned int v44 = v33 + 1;
      *((void *)&v70 + v33) = "-s";
      v33 += 2;
      *((void *)&v70 + v44) = [v43 fileSystemRepresentation];
    }
    id v65 = v10;
    id v45 = v10;
    *((void *)&v70 + v33) = [v45 fileSystemRepresentation];
    id v60 = v67;
    *((void *)&v70 + v33 + 1) = [v60 fileSystemRepresentation];
    uint64_t v46 = _execForLibpartition((const char **)&v70);
    if (v46 == 75)
    {
      _os_log_pack_size();
      unsigned int v47 = 0;
      do
      {
        uint64_t v48 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v48 = 138412802;
        *(void *)(v48 + 4) = v45;
        *(_WORD *)(v48 + 12) = 1024;
        *(_DWORD *)(v48 + 14) = 75;
        *(_WORD *)(v48 + 18) = 1024;
        *(_DWORD *)(v48 + 20) = v47;
        _LPLogPack(1);
        sleep(3u);
        uint64_t v46 = _execForLibpartition((const char **)&v70);
        if (v46 != 75) {
          break;
        }
      }
      while (v47++ < 2);
    }
    BOOL v14 = v46 == 0;
    if (v46)
    {
      id v11 = v66;
      if (a5)
      {
        v50 = +[NSString stringWithFormat:@"mount_apfs returned : %d", v46];
        v68[0] = NSLocalizedFailureReasonErrorKey;
        v68[1] = NSLocalizedDescriptionKey;
        v69[0] = @"Mount failed";
        v69[1] = v50;
        v51 = +[NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:2];
        *a5 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:v51];
      }
      _os_log_pack_size();
      uint64_t v52 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v52 = 138412546;
      *(void *)(v52 + 4) = v45;
      *(_WORD *)(v52 + 12) = 1024;
      *(_DWORD *)(v52 + 14) = v46;
      _LPLogPack(1);
      id v10 = v65;
      v53 = v64;
    }
    else
    {
      id v11 = v66;
      v53 = v64;
      if (v59)
      {
        _os_log_pack_size();
        uint64_t v56 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v56 = 138412803;
        *(void *)(v56 + 4) = v45;
        *(_WORD *)(v56 + 12) = 2113;
        v55 = v61;
        *(void *)(v56 + 14) = v61;
        *(_WORD *)(v56 + 22) = 2113;
        *(void *)(v56 + 24) = v60;
        _LPLogPack(2);
        id v10 = v65;
        v54 = v37;
        goto LABEL_45;
      }
      _os_log_pack_size();
      uint64_t v58 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v58 = 138412547;
      *(void *)(v58 + 4) = v45;
      *(_WORD *)(v58 + 12) = 2113;
      *(void *)(v58 + 14) = v60;
      _LPLogPack(2);
      id v10 = v65;
    }
    v54 = v63;
    v55 = v61;
LABEL_45:

    goto LABEL_46;
  }
  if (a5) {
    *a5 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
  }
  _os_log_pack_size();
  uint64_t v15 = _os_log_pack_fill();
  id v16 = [(LPMedia *)self description];
  id v17 = [v16 UTF8String];
  *(_DWORD *)uint64_t v15 = 136315138;
  *(void *)(v15 + 4) = v17;

  _LPLogPack(1);
  BOOL v14 = 0;
LABEL_47:

  return v14;
}

- (BOOL)unmountWithError:(id *)a3
{
  return [(LPAPFSVolume *)self unmountWithOptions:0 error:a3];
}

- (BOOL)unmountWithOptions:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v58 = +[NSMutableArray arrayWithCapacity:1];
  id v6 = [v5 objectForKey:LPAPFSVolumeUnmountOptionAll[0]];
  unsigned int v7 = [v6 BOOLValue];

  id v8 = [v5 objectForKey:LPAPFSVolumeUnmountOptionSnapshotName[0]];
  if (v8) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = v7 == 0;
  }
  id v61 = v5;
  v69 = self;
  if (v9)
  {
    id v28 = [(LPMedia *)self mountPoint];

    if (!v28) {
      goto LABEL_28;
    }
    id v29 = [(LPMedia *)self mountPoint];
    [(NSMutableArray *)v58 addObject:v29];
    id v30 = v29;
  }
  else
  {
    id v10 = [(LPAPFSVolume *)self snapshotMountPoints];
    id v11 = [(LPMedia *)self mountPoint];
    unsigned int v12 = v11;
    if (v10)
    {
      id v63 = v11;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      id v66 = v10;
      id v67 = v10;
      id v13 = [v67 countByEnumeratingWithState:&v75 objects:v80 count:16];
      BOOL v14 = v58;
      if (v13)
      {
        id v15 = v13;
        uint64_t v16 = *(void *)v76;
        while (2)
        {
          for (uint64_t i = 0; i != v15; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v76 != v16) {
              objc_enumerationMutation(v67);
            }
            uint64_t v18 = *(void **)(*((void *)&v75 + 1) + 8 * i);
            if (v7)
            {
              id v19 = [v18 objectForKey:LPAPFSVolumeSnapshotMountPointKeyMountPoint[0]];
              [(NSMutableArray *)v14 addObject:v19];
            }
            else
            {
              id v20 = [v61 objectForKey:LPAPFSVolumeSnapshotMountPointKeyName[0]];
              id v21 = [v18 objectForKey:v20];
              id v22 = [v61 objectForKey:LPAPFSVolumeUnmountOptionSnapshotName[0]];
              unsigned int v23 = [v21 isEqualToString:v22];

              id v24 = v21;
              BOOL v14 = v58;

              uint64_t v25 = v20;
              self = v69;

              if (v23)
              {
                id v26 = [v18 objectForKey:LPAPFSVolumeSnapshotMountPointKeyMountPoint[0]];
                [(NSMutableArray *)v58 addObject:v26];

                if ((v7 & 1) == 0)
                {

                  id v5 = v61;
                  id v10 = v66;
                  unsigned int v12 = v63;
                  goto LABEL_26;
                }
              }
            }
          }
          id v15 = [v67 countByEnumeratingWithState:&v75 objects:v80 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }

      id v5 = v61;
      id v10 = v66;
      unsigned int v12 = v63;
    }
    if (v12) {
      unsigned int v27 = v7;
    }
    else {
      unsigned int v27 = 0;
    }
    if (v27 == 1) {
      [(NSMutableArray *)v58 addObject:v12];
    }
LABEL_26:

    id v30 = v10;
  }

LABEL_28:
  if ([(NSMutableArray *)v58 count])
  {
    [(NSMutableArray *)v58 sortUsingComparator:&__block_literal_global_6];
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v59 = v58;
    id v62 = [(NSMutableArray *)v59 countByEnumeratingWithState:&v71 objects:v79 count:16];
    if (!v62)
    {
      BOOL v44 = 0;
      goto LABEL_67;
    }
    uint64_t v60 = *(void *)v72;
    while (1)
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v72 != v60) {
          objc_enumerationMutation(v59);
        }
        v68 = *(void **)(*((void *)&v71 + 1) + 8 * v31);
        uint64_t v64 = v31;
        if (v5)
        {
          id v32 = [v5 objectForKey:LPAPFSVolumeUnmountOptionForce[0]];
          int v33 = v32 != 0;

          int v34 = v33 << 19;
          id v35 = [v5 objectForKey:LPAPFSVolumeUnmountOptionDoNotLock[0]];

          if (v35)
          {
            char v70 = 1;
            if (fsctl((const char *)[v68 fileSystemRepresentation], 0x80014A22uLL, &v70, 0))
            {
              if (*__error() == 17)
              {
                _os_log_pack_size();
                uint64_t v36 = _os_log_pack_fill();
                id v37 = [(LPMedia *)self devNodePath];
                *(_DWORD *)uint64_t v36 = 138412290;
                *(void *)(v36 + 4) = v37;
                int v38 = 2;
              }
              else
              {
                _os_log_pack_size();
                uint64_t v39 = _os_log_pack_fill();
                id v37 = [(LPMedia *)self devNodePath];
                int v40 = *__error();
                *(_DWORD *)uint64_t v39 = 138412546;
                *(void *)(v39 + 4) = v37;
                *(_WORD *)(v39 + 12) = 1024;
                *(_DWORD *)(v39 + 14) = v40;
                int v38 = 1;
              }
              _LPLogPack(v38);
            }
          }
        }
        else
        {
          int v34 = 0;
        }
        int v41 = 0;
        while (1)
        {
          id v42 = v68;
          if (!unmount((const char *)[v42 fileSystemRepresentation], v34)) {
            break;
          }
          uint64_t v43 = *__error();
          BOOL v44 = v43 == 22;
          id v45 = v69;
          if (v43 == 22)
          {
            _os_log_pack_size();
            *(_WORD *)_os_log_pack_fill() = 0;
            _LPLogPack(1);
          }
          else if (v41 < 3)
          {
            if (v43 == 35 || v43 == 16)
            {
              ++v41;
              sleep(3u);
              int v46 = 1;
              goto LABEL_57;
            }
          }
          else
          {
            if (v41 == 3 && v43 == 16 && [(LPAPFSVolume *)v69 role] != 12)
            {
              v34 |= 0x80000u;
              sleep(3u);
              _os_log_pack_size();
              uint64_t v47 = _os_log_pack_fill();
              id v48 = [(LPMedia *)v69 devNodePath];
              *(_DWORD *)uint64_t v47 = 138412546;
              *(void *)(v47 + 4) = v48;
              *(_WORD *)(v47 + 12) = 1024;
              *(_DWORD *)(v47 + 14) = 16;
              id v45 = v69;
              int v46 = 1;
              _LPLogPack(1);

              int v41 = 4;
              goto LABEL_57;
            }
            if (a4)
            {
              int v46 = 0;
              *a4 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v43 userInfo:0];
              goto LABEL_57;
            }
          }
          int v46 = 0;
LABEL_57:
          _os_log_pack_size();
          uint64_t v49 = _os_log_pack_fill();
          id v50 = [(LPMedia *)v45 devNodePath];
          v51 = v50;
          *(_DWORD *)uint64_t v49 = 138412802;
          uint64_t v52 = "no";
          if (v46) {
            uint64_t v52 = "yes";
          }
          *(void *)(v49 + 4) = v50;
          *(_WORD *)(v49 + 12) = 2080;
          *(void *)(v49 + 14) = v52;
          *(_WORD *)(v49 + 22) = 1024;
          *(_DWORD *)(v49 + 24) = v43;
          _LPLogPack(1);

          if ((v46 & 1) == 0)
          {
            self = v69;
            goto LABEL_62;
          }
        }
        _os_log_pack_size();
        uint64_t v53 = _os_log_pack_fill();
        self = v69;
        id v54 = [(LPMedia *)v69 devNodePath];
        *(_DWORD *)uint64_t v53 = 138412547;
        *(void *)(v53 + 4) = v54;
        *(_WORD *)(v53 + 12) = 2113;
        *(void *)(v53 + 14) = v42;
        _LPLogPack(2);

        BOOL v44 = 1;
LABEL_62:
        uint64_t v31 = v64 + 1;
        id v5 = v61;
      }
      while ((id)(v64 + 1) != v62);
      id v62 = [(NSMutableArray *)v59 countByEnumeratingWithState:&v71 objects:v79 count:16];
      if (!v62)
      {
LABEL_67:

        goto LABEL_68;
      }
    }
  }
  _os_log_pack_size();
  uint64_t v55 = _os_log_pack_fill();
  id v56 = [(LPMedia *)self devNodePath];
  *(_DWORD *)uint64_t v55 = 138412290;
  *(void *)(v55 + 4) = v56;
  _LPLogPack(2);

  BOOL v44 = 1;
LABEL_68:

  return v44;
}

int64_t __41__LPAPFSVolume_unmountWithOptions_error___block_invoke(id a1, id a2, id a3)
{
  return -(uint64_t)[a2 compare:a3];
}

- (BOOL)unmountAllWithError:(id *)a3
{
  id v8 = LPAPFSVolumeUnmountOptionAll[0];
  id v5 = +[NSNumber numberWithBool:1];
  BOOL v9 = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  LOBYTE(a3) = [(LPAPFSVolume *)self unmountWithOptions:v6 error:a3];

  return (char)a3;
}

- (BOOL)deleteVolumeWithError:(id *)a3
{
  id v4 = [(LPMedia *)self devNodePath];
  if (v4)
  {
    _os_log_pack_size();
    uint64_t v5 = _os_log_pack_fill();
    *(void *)&long long v6 = 136315394;
    long long v19 = v6;
    *(_DWORD *)uint64_t v5 = 136315394;
    *(void *)(v5 + 4) = "-[LPAPFSVolume deleteVolumeWithError:]";
    *(_WORD *)(v5 + 12) = 2112;
    *(void *)(v5 + 14) = v4;
    _LPLogPack(2);
    [v4 fileSystemRepresentation];
    unsigned int v7 = APFSVolumeDelete();
    if (!v7)
    {
      BOOL v13 = 1;
      goto LABEL_18;
    }
    unsigned int v8 = v7;
    if (v7 >> 26 == 56)
    {
      _os_log_pack_size();
      uint64_t v9 = _os_log_pack_fill();
      uint64_t v10 = v8 & 0x3FFF;
      *(_DWORD *)uint64_t v9 = v19;
      *(void *)(v9 + 4) = "-[LPAPFSVolume deleteVolumeWithError:]";
      *(_WORD *)(v9 + 12) = 1024;
      *(_DWORD *)(v9 + 14) = v10;
      _LPLogPack(1);
      if (a3)
      {
        CFStringRef v11 = @"com.apple.IOKit";
LABEL_14:
        uint64_t v16 = v10;
LABEL_17:
        BOOL v13 = 0;
        *a3 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v11, v16, 0, v19);
        goto LABEL_18;
      }
    }
    else
    {
      unsigned int v14 = v7 & 0xFFFFC000;
      _os_log_pack_size();
      if (v14 == 49152)
      {
        uint64_t v15 = _os_log_pack_fill();
        uint64_t v10 = v8 & 0x3FFF;
        *(_DWORD *)uint64_t v15 = v19;
        *(void *)(v15 + 4) = "-[LPAPFSVolume deleteVolumeWithError:]";
        *(_WORD *)(v15 + 12) = 1024;
        *(_DWORD *)(v15 + 14) = v10;
        _LPLogPack(1);
        if (a3)
        {
          CFStringRef v11 = (const __CFString *)NSPOSIXErrorDomain;
          goto LABEL_14;
        }
      }
      else
      {
        uint64_t v17 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v17 = v19;
        *(void *)(v17 + 4) = "-[LPAPFSVolume deleteVolumeWithError:]";
        *(_WORD *)(v17 + 12) = 1024;
        *(_DWORD *)(v17 + 14) = v8;
        _LPLogPack(1);
        if (a3)
        {
          CFStringRef v11 = (const __CFString *)NSOSStatusErrorDomain;
          uint64_t v16 = (int)v8;
          goto LABEL_17;
        }
      }
    }
  }
  else
  {
    if (a3) {
      *a3 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
    }
    _os_log_pack_size();
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315138;
    *(void *)(v12 + 4) = "-[LPAPFSVolume deleteVolumeWithError:]";
    _LPLogPack(1);
  }
  BOOL v13 = 0;
LABEL_18:

  return v13;
}

- (id)snapshotsWithError:(id *)a3
{
  id v3 = [(LPAPFSVolume *)self snapshotInfoWithError:a3];
  id v4 = +[NSMutableArray arrayWithCapacity:10];
  if (v3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "objectForKey:", LPAPFSSnapshotPropertyKeyName[0], (void)v12);
          if (v10) {
            [(NSMutableArray *)v4 addObject:v10];
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  return v4;
}

- (id)snapshotInfoWithError:(id *)a3
{
  id v5 = [(LPMedia *)self mountPoint];
  id v6 = v5;
  if (!v5)
  {
    if (a3) {
      *a3 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
    }
    _os_log_pack_size();
    uint64_t v29 = _os_log_pack_fill();
    id v30 = [(LPMedia *)self description];
    *(_DWORD *)uint64_t v29 = 136315395;
    *(void *)(v29 + 4) = "-[LPAPFSVolume snapshotInfoWithError:]";
    *(_WORD *)(v29 + 12) = 2113;
    *(void *)(v29 + 14) = v30;
    _LPLogPack(1);

    goto LABEL_36;
  }
  id v7 = v5;
  int v8 = open((const char *)[v7 fileSystemRepresentation], 0x100000);
  if (v8 < 0)
  {
    if (a3) {
      *a3 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:*__error() userInfo:0];
    }
    _os_log_pack_size();
    uint64_t v31 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v31 = 136315651;
    *(void *)(v31 + 4) = "-[LPAPFSVolume snapshotInfoWithError:]";
    *(_WORD *)(v31 + 12) = 2113;
    *(void *)(v31 + 14) = v7;
    *(_WORD *)(v31 + 22) = 1024;
    *(_DWORD *)(v31 + 24) = 0;
    _LPLogPack(1);
LABEL_36:
    id v28 = 0;
    goto LABEL_40;
  }
  int v9 = v8;
  int v34 = a3;
  id v35 = v6;
  uint64_t v36 = +[NSMutableArray arrayWithCapacity:10];
  *(void *)&v38.volattr = 0;
  *(void *)&v38.fileattr = 0;
  bzero(v39, 0x800uLL);
  *(void *)&v38.bitmapcount = 0xA000002100000005;
  int v10 = fs_snapshot_list(v9, &v38, v39, 0x800uLL, 0);
  if (v10 >= 1)
  {
    CFStringRef v11 = (unsigned int *)v39;
    int v37 = v9;
    while (1)
    {
      while (1)
      {
        BOOL v12 = __OFSUB__(v10--, 1);
        if (v10 < 0 == v12) {
          break;
        }
LABEL_27:
        CFStringRef v11 = (unsigned int *)v39;
        int v10 = fs_snapshot_list(v9, &v38, v39, 0x800uLL, 0);
        if (v10 <= 0) {
          goto LABEL_28;
        }
      }
      long long v13 = (int *)(v11 + 6);
      uint64_t v14 = *v11;
      unsigned int v15 = v11[1];
      if ((v15 & 0x20000000) == 0) {
        break;
      }
      int v21 = *v13;
      _os_log_pack_size();
      uint64_t v22 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v22 = 136315394;
      *(void *)(v22 + 4) = "-[LPAPFSVolume snapshotInfoWithError:]";
      *(_WORD *)(v22 + 12) = 1024;
      *(_DWORD *)(v22 + 14) = v21;
      _LPLogPack(1);
LABEL_26:
      CFStringRef v11 = (unsigned int *)((char *)v11 + v14);
      if ((v15 & 0x20000000) != 0) {
        goto LABEL_27;
      }
    }
    if (v15)
    {
      unsigned int v23 = (char *)v13 + *v13;
      uint64_t v16 = +[NSString stringWithUTF8String:v23];
      if (!v16)
      {
        _os_log_pack_size();
        uint64_t v24 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v24 = 136315395;
        *(void *)(v24 + 4) = "-[LPAPFSVolume snapshotInfoWithError:]";
        *(_WORD *)(v24 + 12) = 2081;
        *(void *)(v24 + 14) = v23;
        _LPLogPack(2);
      }
      long long v13 = (int *)(v11 + 8);
      if ((v11[1] & 0x20) != 0) {
        goto LABEL_9;
      }
    }
    else
    {
      uint64_t v16 = 0;
      if ((v15 & 0x20) != 0)
      {
LABEL_9:
        unint64_t v17 = *(void *)v13;
        uint64_t v18 = +[NSNumber numberWithUnsignedLongLong:*(void *)v13 & 0x3FFFFFFFFFFFFFFFLL];
        long long v19 = +[NSNumber numberWithBool:(v17 >> 62) & 1];
        id v20 = +[NSNumber numberWithBool:v17 >> 63];
LABEL_15:
        uint64_t v25 = +[NSMutableDictionary dictionaryWithCapacity:4];
        id v26 = v25;
        if (v16) {
          [(NSMutableDictionary *)v25 setObject:v16 forKey:LPAPFSSnapshotPropertyKeyName[0]];
        }
        if (v18) {
          [(NSMutableDictionary *)v26 setObject:v18 forKey:LPAPFSSnapshotPropertyKeyXID[0]];
        }
        if (v19) {
          [(NSMutableDictionary *)v26 setObject:v19 forKey:LPAPFSSnapshotPropertyKeyMarkedForRevert];
        }
        if (v20) {
          [(NSMutableDictionary *)v26 setObject:v20 forKey:LPAPFSSnapshotPropertyKeyMarkedForRoot[0]];
        }
        if ([(NSMutableDictionary *)v26 count]) {
          [(NSMutableArray *)v36 addObject:v26];
        }

        int v9 = v37;
        goto LABEL_26;
      }
    }
    id v20 = 0;
    long long v19 = 0;
    uint64_t v18 = 0;
    goto LABEL_15;
  }
LABEL_28:
  if (v10 < 0)
  {
    _os_log_pack_size();
    uint64_t v32 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v32 = 136315394;
    *(void *)(v32 + 4) = "-[LPAPFSVolume snapshotInfoWithError:]";
    *(_WORD *)(v32 + 12) = 1024;
    *(_DWORD *)(v32 + 14) = v10;
    _LPLogPack(1);
    close(v9);
    unsigned int v27 = v36;
    id v28 = 0;
    if (v34) {
      id *v34 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v10 userInfo:0];
    }
  }
  else
  {
    close(v9);
    unsigned int v27 = v36;
    id v28 = +[NSArray arrayWithArray:v36];
  }

  id v6 = v35;
LABEL_40:

  return v28;
}

- (BOOL)createSnapshot:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(LPMedia *)self mountPoint];
  if (!v6 || ![v6 length])
  {
    if (a4) {
      *a4 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
    }
    goto LABEL_12;
  }
  if (!v7)
  {
    if (a4) {
      *a4 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
    }
LABEL_12:
    _os_log_pack_size();
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315138;
    *(void *)(v16 + 4) = "-[LPAPFSVolume createSnapshot:error:]";
    _LPLogPack(1);
LABEL_13:
    BOOL v12 = 0;
    goto LABEL_14;
  }
  id v8 = v7;
  int v9 = open((const char *)[v8 fileSystemRepresentation], 0);
  if (v9 < 0)
  {
    if (a4) {
      *a4 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:*__error() userInfo:0];
    }
    _os_log_pack_size();
    uint64_t v18 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v18 = 136315395;
    *(void *)(v18 + 4) = "-[LPAPFSVolume createSnapshot:error:]";
    *(_WORD *)(v18 + 12) = 2113;
    *(void *)(v18 + 14) = v8;
    _LPLogPack(1);
    goto LABEL_13;
  }
  int v10 = v9;
  int v11 = fs_snapshot_create(v9, (const char *)[v6 fileSystemRepresentation], 0);
  BOOL v12 = v11 == 0;
  if (v11)
  {
    int v13 = *__error();
    if (a4) {
      *a4 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v13 userInfo:0];
    }
    _os_log_pack_size();
    uint64_t v14 = _os_log_pack_fill();
    unsigned int v15 = strerror(v13);
    *(_DWORD *)uint64_t v14 = 67109378;
    *(_DWORD *)(v14 + 4) = v13;
    *(_WORD *)(v14 + 8) = 2080;
    *(void *)(v14 + 10) = v15;
    _LPLogPack(1);
  }
  close(v10);
LABEL_14:

  return v12;
}

- (BOOL)deleteSnapshots:(id)a3 waitForDeletionFor:(double)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(LPMedia *)self mountPoint];
  if (!v8)
  {
    if (a5) {
      *a5 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
    }
    goto LABEL_25;
  }
  if (![v8 count])
  {
    BOOL v22 = 1;
    goto LABEL_27;
  }
  if (!v9)
  {
    if (a5) {
      *a5 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
    }
LABEL_25:
    _os_log_pack_size();
    uint64_t v23 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v23 = 136315138;
    *(void *)(v23 + 4) = "-[LPAPFSVolume deleteSnapshots:waitForDeletionFor:error:]";
LABEL_26:
    _LPLogPack(1);
    BOOL v22 = 0;
    goto LABEL_27;
  }
  int v10 = open((const char *)[v9 fileSystemRepresentation], 0);
  if (v10 < 0)
  {
    if (a5) {
      *a5 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:*__error() userInfo:0];
    }
    _os_log_pack_size();
    uint64_t v25 = _os_log_pack_fill();
    int v26 = *__error();
    *(_DWORD *)uint64_t v25 = 136315394;
    *(void *)(v25 + 4) = "-[LPAPFSVolume deleteSnapshots:waitForDeletionFor:error:]";
    *(_WORD *)(v25 + 12) = 1024;
    *(_DWORD *)(v25 + 14) = v26;
    goto LABEL_26;
  }
  int v11 = v10;
  long long v35 = 0u;
  long long v34 = 0u;
  long long v33 = 0u;
  long long v32 = 0u;
  id v12 = v8;
  id v13 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v29 = a5;
    id v28 = v9;
    int v15 = 0;
    char v30 = 0;
    uint64_t v16 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v14; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(v12);
        }
        id v18 = *(id *)(*((void *)&v32 + 1) + 8 * i);
        if (fs_snapshot_delete(v11, (const char *)[v18 fileSystemRepresentation], 0))
        {
          int v15 = *__error();
          _os_log_pack_size();
          uint64_t v19 = _os_log_pack_fill();
          int v20 = *__error();
          *(_DWORD *)uint64_t v19 = 136315651;
          *(void *)(v19 + 4) = "-[LPAPFSVolume deleteSnapshots:waitForDeletionFor:error:]";
          *(_WORD *)(v19 + 12) = 2113;
          *(void *)(v19 + 14) = v18;
          *(_WORD *)(v19 + 22) = 1024;
          *(_DWORD *)(v19 + 24) = v20;
          _LPLogPack(1);
        }
        else
        {
          char v30 = 1;
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v14);

    if (v29)
    {
      char v21 = v30;
      if (v15) {
        id *v29 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v15 userInfo:0];
      }
      id v9 = v28;
    }
    else
    {
      id v9 = v28;
      char v21 = v30;
    }
  }
  else
  {

    char v21 = 0;
  }
  if (a4 != 0.0)
  {
    v31[2] = 0;
    v31[1] = 0;
    v31[0] = 15;
    if (ffsctl(v11, 0x80184A24uLL, v31, 0))
    {
      _os_log_pack_size();
      uint64_t v27 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v27 = 136315138;
      *(void *)(v27 + 4) = "-[LPAPFSVolume deleteSnapshots:waitForDeletionFor:error:]";
      _LPLogPack(1);
    }
  }
  close(v11);
  BOOL v22 = v21 & 1;
LABEL_27:

  return v22;
}

- (BOOL)renameSnapshot:(id)a3 to:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(LPMedia *)self mountPoint];
  if (!v8 || ![v8 length])
  {
    if (a5) {
      *a5 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
    }
    goto LABEL_17;
  }
  if (!v9 || ![v9 length])
  {
    if (a5) {
      *a5 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
    }
    goto LABEL_17;
  }
  if (!v10)
  {
    if (a5) {
      *a5 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
    }
LABEL_17:
    _os_log_pack_size();
    uint64_t v19 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v19 = 136315138;
    *(void *)(v19 + 4) = "-[LPAPFSVolume renameSnapshot:to:error:]";
LABEL_18:
    _LPLogPack(1);
    BOOL v15 = 0;
    goto LABEL_19;
  }
  id v11 = v10;
  int v12 = open((const char *)[v11 fileSystemRepresentation], 0);
  if (v12 < 0)
  {
    if (a5) {
      *a5 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:*__error() userInfo:0];
    }
    _os_log_pack_size();
    uint64_t v21 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v21 = 136315395;
    *(void *)(v21 + 4) = "-[LPAPFSVolume renameSnapshot:to:error:]";
    *(_WORD *)(v21 + 12) = 2113;
    *(void *)(v21 + 14) = v11;
    goto LABEL_18;
  }
  int v13 = v12;
  int v14 = fs_snapshot_rename(v12, (const char *)[v8 fileSystemRepresentation], (const char *)objc_msgSend(objc_retainAutorelease(v9), "fileSystemRepresentation"), 0);
  BOOL v15 = v14 == 0;
  if (v14)
  {
    int v16 = *__error();
    if (a5) {
      *a5 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v16 userInfo:0];
    }
    _os_log_pack_size();
    uint64_t v17 = _os_log_pack_fill();
    id v18 = strerror(v16);
    *(_DWORD *)uint64_t v17 = 67109378;
    *(_DWORD *)(v17 + 4) = v16;
    *(_WORD *)(v17 + 8) = 2080;
    *(void *)(v17 + 10) = v18;
    _LPLogPack(1);
  }
  close(v13);
LABEL_19:

  return v15;
}

- (BOOL)revertToSnapshot:(id)a3 error:(id *)a4
{
  return [(LPAPFSVolume *)self revertToSnapshot:a3 options:0 error:a4];
}

- (BOOL)revertToSnapshot:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(LPMedia *)self mountPoint];
  if (!v8 || ![v8 length])
  {
    if (a5) {
      *a5 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
    }
    goto LABEL_13;
  }
  if (!v10)
  {
    if (a5) {
      *a5 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
    }
LABEL_13:
    _os_log_pack_size();
    uint64_t v21 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v21 = 136315138;
    *(void *)(v21 + 4) = "-[LPAPFSVolume revertToSnapshot:options:error:]";
    _LPLogPack(1);
    BOOL v15 = 0;
    goto LABEL_14;
  }
  id v11 = v10;
  int v12 = open((const char *)[v11 fileSystemRepresentation], 0);
  if (v12 < 0)
  {
    if (a5) {
      *a5 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:*__error() userInfo:0];
    }
    _os_log_pack_size();
    uint64_t v23 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v23 = 136315395;
    *(void *)(v23 + 4) = "-[LPAPFSVolume revertToSnapshot:options:error:]";
    *(_WORD *)(v23 + 12) = 2113;
    *(void *)(v23 + 14) = v11;
    BOOL v15 = 1;
    _LPLogPack(1);
  }
  else
  {
    int v13 = v12;
    int v14 = fs_snapshot_revert(v12, (const char *)[v8 fileSystemRepresentation], 0);
    BOOL v15 = v14 == 0;
    if (v14)
    {
      id v27 = v11;
      int v16 = *__error();
      if (a5) {
        *a5 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v16 userInfo:0];
      }
      _os_log_pack_size();
      v26[1] = v26;
      uint64_t v17 = _os_log_pack_fill();
      id v18 = strerror(v16);
      *(_DWORD *)uint64_t v17 = 67109378;
      *(_DWORD *)(v17 + 4) = v16;
      *(_WORD *)(v17 + 8) = 2080;
      *(void *)(v17 + 10) = v18;
      _LPLogPack(1);
      id v11 = v27;
    }
    close(v13);
    id v19 = [v9 objectForKeyedSubscript:LPAPFSVolumeRevertOptionSkipRemount[0]];
    if ([v19 BOOLValue])
    {
      _os_log_pack_size();
      uint64_t v20 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v20 = 136315394;
      *(void *)(v20 + 4) = "-[LPAPFSVolume revertToSnapshot:options:error:]";
      *(_WORD *)(v20 + 12) = 2112;
      *(void *)(v20 + 14) = v11;
      _LPLogPack(2);
    }
    else if ([(LPAPFSVolume *)self unmountWithError:a5] {
           && [(LPAPFSVolume *)self mountAtPath:v11 options:v9 error:a5])
    }
    {
      BOOL v15 = 1;
    }
    else
    {
      _os_log_pack_size();
      uint64_t v24 = _os_log_pack_fill();
      int v25 = *__error();
      *(_DWORD *)uint64_t v24 = 136315394;
      *(void *)(v24 + 4) = "-[LPAPFSVolume revertToSnapshot:options:error:]";
      *(_WORD *)(v24 + 12) = 1024;
      *(_DWORD *)(v24 + 14) = v25;
      _LPLogPack(1);
      BOOL v15 = 0;
    }
  }
LABEL_14:

  return v15;
}

- (BOOL)rootToSnapshot:(id)a3 error:(id *)a4
{
  id v6 = a3;
  _os_log_pack_size();
  uint64_t v7 = _os_log_pack_fill();
  *(_DWORD *)uint64_t v7 = 136315138;
  *(void *)(v7 + 4) = "-[LPAPFSVolume rootToSnapshot:error:]";
  _LPLogPack(3);
  id v8 = [(LPMedia *)self mountPoint];
  if (v6 && [v6 length])
  {
    [v6 fileSystemRepresentation];
    if (!v8)
    {
LABEL_4:
      if (a4) {
        *a4 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
      }
      uint64_t v9 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v9 = 136315138;
      *(void *)(v9 + 4) = "-[LPAPFSVolume rootToSnapshot:error:]";
LABEL_17:
      _LPLogPack(1);
      BOOL v14 = 0;
      goto LABEL_18;
    }
  }
  else if (!v8)
  {
    goto LABEL_4;
  }
  _os_log_pack_size();
  uint64_t v10 = _os_log_pack_fill();
  *(_DWORD *)uint64_t v10 = 136315395;
  *(void *)(v10 + 4) = "-[LPAPFSVolume rootToSnapshot:error:]";
  *(_WORD *)(v10 + 12) = 2113;
  *(void *)(v10 + 14) = v8;
  _LPLogPack(3);
  int v11 = open((const char *)[v8 fileSystemRepresentation], 0);
  if (v11 < 0)
  {
    if (a4) {
      *a4 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:*__error() userInfo:0];
    }
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315395;
    *(void *)(v17 + 4) = "-[LPAPFSVolume rootToSnapshot:error:]";
    *(_WORD *)(v17 + 12) = 2113;
    *(void *)(v17 + 14) = v8;
    goto LABEL_17;
  }
  int v12 = v11;
  int v13 = fs_snapshot_root();
  BOOL v14 = v13 == 0;
  if (v13)
  {
    int v15 = *__error();
    if (a4) {
      *a4 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v15 userInfo:0];
    }
    _os_log_pack_size();
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315394;
    *(void *)(v16 + 4) = "-[LPAPFSVolume rootToSnapshot:error:]";
    *(_WORD *)(v16 + 12) = 1024;
    *(_DWORD *)(v16 + 14) = v15;
    _LPLogPack(1);
  }
  close(v12);
LABEL_18:

  return v14;
}

@end