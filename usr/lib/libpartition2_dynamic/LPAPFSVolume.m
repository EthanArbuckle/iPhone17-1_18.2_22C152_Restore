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
  v22[17] = *MEMORY[0x263EF8340];
  if ((id)objc_opt_class() == a1)
  {
    v21[0] = &unk_26C28AF68;
    id v20 = (id)[NSNumber numberWithInt:0];
    v22[0] = v20;
    v21[1] = &unk_26C28AF80;
    id v19 = (id)[NSNumber numberWithInt:1];
    v22[1] = v19;
    v21[2] = &unk_26C28AF98;
    id v18 = (id)[NSNumber numberWithInt:2];
    v22[2] = v18;
    v21[3] = &unk_26C28AFB0;
    id v17 = (id)[NSNumber numberWithInt:4];
    v22[3] = v17;
    v21[4] = &unk_26C28AFC8;
    id v16 = (id)[NSNumber numberWithInt:5];
    v22[4] = v16;
    v21[5] = &unk_26C28AFE0;
    id v15 = (id)[NSNumber numberWithInt:6];
    v22[5] = v15;
    v21[6] = &unk_26C28AFF8;
    id v14 = (id)[NSNumber numberWithInt:3];
    v22[6] = v14;
    v21[7] = &unk_26C28B010;
    id v2 = (id)[NSNumber numberWithInt:8];
    v22[7] = v2;
    v21[8] = &unk_26C28B028;
    id v3 = (id)[NSNumber numberWithInt:9];
    v22[8] = v3;
    v21[9] = &unk_26C28B040;
    id v4 = (id)[NSNumber numberWithInt:10];
    v22[9] = v4;
    v21[10] = &unk_26C28B058;
    id v5 = (id)[NSNumber numberWithInt:11];
    v22[10] = v5;
    v21[11] = &unk_26C28B070;
    id v6 = (id)[NSNumber numberWithInt:12];
    v22[11] = v6;
    v21[12] = &unk_26C28B088;
    id v7 = (id)[NSNumber numberWithInt:13];
    v22[12] = v7;
    v21[13] = &unk_26C28B0A0;
    id v8 = (id)[NSNumber numberWithInt:14];
    v22[13] = v8;
    v21[14] = &unk_26C28B0B8;
    id v9 = (id)[NSNumber numberWithInt:15];
    v22[14] = v9;
    v21[15] = &unk_26C28B0D0;
    id v10 = (id)[NSNumber numberWithInt:7];
    v22[15] = v10;
    v21[16] = &unk_26C28B0E8;
    id v11 = (id)[NSNumber numberWithInt:16];
    v22[16] = v11;
    id v12 = (id)[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:17];
    v13 = (void *)sRoleLookupTable;
    sRoleLookupTable = (uint64_t)v12;

    if (_is_running_in_ramdisk_onceToken != -1) {
      dispatch_once(&_is_running_in_ramdisk_onceToken, &__block_literal_global_219);
    }
    +[LPAPFSVolume _loadMountPointTableForMode:(_is_running_in_ramdisk_is_ramdisk & 1) == 0];
  }
}

+ (id)supportedContentTypes
{
  v6[1] = *MEMORY[0x263EF8340];
  if ((id)objc_opt_class() == a1)
  {
    v6[0] = LPAPFSVolumeMediaTypeUUID[0];
    id v3 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  }
  else
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___LPAPFSVolume;
    id v3 = [super supportedContentTypes];
  }

  return v3;
}

+ (void)_loadMountPointTableForMode:(int)a3
{
  id v3 = (int *)((char *)&kLPDefaultMountPointTable + 16 * a3);
  int v4 = *v3;
  uint64_t v5 = *((void *)v3 + 1);
  id v6 = (id)[MEMORY[0x263EFF9A0] dictionaryWithCapacity:*v3];
  if (v4 >= 1)
  {
    uint64_t v7 = v4;
    id v8 = (uint64_t *)(v5 + 8);
    do
    {
      uint64_t v9 = *((unsigned int *)v8 - 2);
      uint64_t v10 = *v8;
      v8 += 2;
      id v11 = (id)[NSString stringWithUTF8String:v10];
      id v12 = (id)[NSNumber numberWithInt:v9];
      [v6 setObject:v11 forKey:v12];

      --v7;
    }
    while (v7);
  }
  id v13 = (id)[NSDictionary dictionaryWithDictionary:v6];
  id v14 = (void *)sMountPointLookupTable;
  sMountPointLookupTable = (uint64_t)v13;
}

+ (id)defaultMountPointGivenRole:(int)a3
{
  id v3 = (void *)sMountPointLookupTable;
  id v4 = (id)[NSNumber numberWithInt:*(void *)&a3];
  id v5 = (id)[v3 objectForKey:v4];

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
    *a4 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:v9 userInfo:0];
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
    id v10 = (id)[NSNumber numberWithInt:0];
    id v11 = (id)[v9 objectForKey:v10];
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
  uint64_t v7 = *MEMORY[0x263EF8340];
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
  if (MEMORY[0x210570C50]([(LPMedia *)self ioMedia], "IOService", 3, &iterator))
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
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = [(LPAPFSVolume *)self container];
  int v4 = [(LPAPFSVolume *)self role];
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
  id v7 = [(id)[v3 volumes:v15];
  id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
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
          id v12 = (id)[v11 volumeGroupUUID];
          int v13 = [v12 isEqualToString:v5];

          if (v13)
          {
            id v8 = v11;
            goto LABEL_15;
          }
        }
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
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
  v22[2] = *MEMORY[0x263EF8340];
  id v2 = [(LPMedia *)self devNodePath];
  if (v2)
  {
    id v3 = (id)[NSString stringWithFormat:@"@%@", v2];
    uint64_t v20 = 0;
    int v4 = getmntinfo_r_np(&v20, 0);
    id v5 = (id)[MEMORY[0x263EFF980] arrayWithCapacity:13];
    int v6 = (void *)MEMORY[0x210570EE0]();
    if (v4 >= 1)
    {
      long long v18 = v6;
      id v19 = v2;
      uint64_t v7 = 0;
      id v8 = 0;
      uint64_t v9 = 0;
      do
      {
        id v10 = (id)[NSString stringWithUTF8String:v20[v7].f_mntfromname, v18, v19];
        if ([v10 hasSuffix:v3])
        {
          id v11 = (id)[v10 substringToIndex:[v10 rangeOfString:@"@" options:4]];

          id v12 = (id)[NSString stringWithUTF8String:v20[v7].f_mntonname];
          v21[0] = LPAPFSVolumeSnapshotMountPointKeyName;
          v21[1] = LPAPFSVolumeSnapshotMountPointKeyMountPoint;
          v22[0] = v11;
          v22[1] = v12;
          id v13 = (id)[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
          [v5 addObject:v13];

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
    if ([v5 count]) {
      id v14 = v5;
    }
    else {
      id v14 = 0;
    }
    id v15 = v14;
  }
  else
  {
    _os_log_pack_size();
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315138;
    *(void *)(v16 + 4) = "-[LPAPFSVolume snapshotMountPoints]";
    _LPLogPack(1);
    id v15 = 0;
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
      *a3 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:v6 userInfo:0];
    }
    BOOL v7 = *__error() == 0;
  }
  else
  {
    if (a3) {
      *a3 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
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
    BOOL v6 = [(LPAPFSVolume *)self mountAtPath:v7 error:a3];
  }
  else
  {
    id v9 = [(LPAPFSVolume *)self mountAtTemporaryPathWithError:a3];
    BOOL v6 = v9 != 0;
  }
  return v6;
}

- (BOOL)mountAtPath:(id)a3 error:(id *)a4
{
  return [(LPAPFSVolume *)self mountAtPath:a3 options:0 error:a4];
}

- (id)_createTemporaryMountPointWithError:(id *)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (_is_running_in_ramdisk_onceToken != -1) {
    dispatch_once(&_is_running_in_ramdisk_onceToken, &__block_literal_global_219);
  }
  bzero(v8, 0x400uLL);
  __strlcpy_chk();
  if (mkdtemp(v8))
  {
    id v4 = (id)[NSString stringWithUTF8String:v8];
  }
  else
  {
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    uint64_t v5 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v5 = 136315138;
    *(void *)(v5 + 4) = v8;
    _LPLogPack(1);
    if (*a3)
    {
      id v6 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
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
  v79[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(LPMedia *)self devNodePath];
  if (v10)
  {
    id v11 = [(LPMedia *)self mountPoint];
    int v12 = [v11 isEqualToString:v8];
    if (!v9 && v12)
    {
      _os_log_pack_size();
      uint64_t v13 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v13 = 138412290;
      *(void *)(v13 + 4) = v8;
      _LPLogPack(2);
      BOOL v14 = 1;
LABEL_43:

      goto LABEL_44;
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
        goto LABEL_43;
      }
    }
    id v19 = v8;
    int v20 = mkpath_np((const char *)[v19 fileSystemRepresentation], 0x1FFu);
    id v68 = v11;
    if (v20 && v20 != 17)
    {
      if (a5)
      {
        v26 = (void *)MEMORY[0x263F087E8];
        uint64_t v27 = *MEMORY[0x263F08438];
        id v28 = v10;
        uint64_t v29 = v20;
        uint64_t v78 = *MEMORY[0x263F08068];
        v79[0] = v19;
        id v30 = (id)[NSDictionary dictionaryWithObjects:v79 forKeys:&v78 count:1];
        uint64_t v31 = v29;
        id v10 = v28;
        *a5 = (id)[v26 errorWithDomain:v27 code:v31 userInfo:v30];
      }
      _os_log_pack_size();
      uint64_t v32 = _os_log_pack_fill();
      id v33 = [(LPMedia *)self description];
      uint64_t v34 = [v33 UTF8String];
      uint64_t v35 = [v19 fileSystemRepresentation];
      *(_DWORD *)uint64_t v32 = 136380931;
      *(void *)(v32 + 4) = v34;
      *(_WORD *)(v32 + 12) = 2081;
      *(void *)(v32 + 14) = v35;

      _LPLogPack(1);
      BOOL v14 = 0;
      id v11 = v68;
      goto LABEL_43;
    }
    long long v74 = xmmword_264132118;
    long long v75 = unk_264132128;
    long long v76 = xmmword_264132138;
    uint64_t v77 = 0;
    long long v72 = xmmword_2641320F8;
    long long v73 = unk_264132108;
    id v21 = (id)[v9 objectForKeyedSubscript:LPAPFSVolumeMountOptionReadOnly];
    v22 = v21;
    v23 = (void *)MEMORY[0x263EFFA80];
    if (!v21) {
      id v21 = (id)MEMORY[0x263EFFA80];
    }
    id v24 = v21;

    v65 = v24;
    if ([v24 BOOLValue])
    {
      *((void *)&v72 + 1) = "-o";
      *(void *)&long long v73 = "rdonly";
      unsigned int v25 = 3;
    }
    else
    {
      unsigned int v25 = 1;
    }
    id v36 = (id)[v9 objectForKeyedSubscript:LPAPFSVolumeMountOptionNoBrowse];
    v37 = v36;
    if (!v36) {
      id v36 = (id)MEMORY[0x263EFFA88];
    }
    id v38 = v36;

    v64 = v38;
    if ([v38 BOOLValue])
    {
      *((void *)&v72 + v25) = "-o";
      unsigned int v39 = v25 + 1;
      v25 += 2;
      *((void *)&v72 + v39) = "nobrowse";
    }
    id v40 = (id)[v9 objectForKeyedSubscript:LPAPFSVolumeMountOptionNoFirmlinks];
    v41 = v40;
    if (!v40) {
      id v40 = v23;
    }
    id v42 = v40;

    v63 = v42;
    if ([v42 BOOLValue]) {
      *((void *)&v72 + v25++) = "-n";
    }
    id v67 = v8;
    id v43 = (id)[v9 objectForKeyedSubscript:LPAPFSVolumeMountOptionSnapshotName];
    uint64_t v60 = [v43 length];
    id v62 = v43;
    if (v60)
    {
      unsigned int v44 = v25 + 1;
      *((void *)&v72 + v25) = "-s";
      v25 += 2;
      *((void *)&v72 + v44) = [v43 fileSystemRepresentation];
    }
    id v66 = v10;
    id v45 = v10;
    *((void *)&v72 + v25) = [v45 fileSystemRepresentation];
    id v61 = v19;
    *((void *)&v72 + v25 + 1) = [v61 fileSystemRepresentation];
    uint64_t v46 = _execForLibpartition((const char **)&v72);
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
        uint64_t v46 = _execForLibpartition((const char **)&v72);
        if (v46 != 75) {
          break;
        }
      }
      while (v47++ < 2);
    }
    BOOL v14 = v46 == 0;
    if (v46)
    {
      id v8 = v67;
      id v11 = v68;
      if (a5)
      {
        id v50 = [NSString stringWithFormat:@"mount_apfs returned : %d", v46];
        v51 = (void *)MEMORY[0x263F087E8];
        uint64_t v69 = *MEMORY[0x263F08438];
        uint64_t v52 = *MEMORY[0x263F08320];
        v70[0] = *MEMORY[0x263F08338];
        v70[1] = v52;
        v71[0] = @"Mount failed";
        v71[1] = v50;
        id v53 = (id)[NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:2];
        *a5 = (id)[v51 errorWithDomain:v69 code:22 userInfo:v53];
      }
      _os_log_pack_size();
      uint64_t v54 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v54 = 138412546;
      *(void *)(v54 + 4) = v45;
      *(_WORD *)(v54 + 12) = 1024;
      *(_DWORD *)(v54 + 14) = v46;
      int v55 = 1;
    }
    else
    {
      id v8 = v67;
      id v11 = v68;
      if (v60)
      {
        _os_log_pack_size();
        uint64_t v57 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v57 = 138412803;
        *(void *)(v57 + 4) = v45;
        *(_WORD *)(v57 + 12) = 2113;
        v56 = v62;
        *(void *)(v57 + 14) = v62;
        *(_WORD *)(v57 + 22) = 2113;
        *(void *)(v57 + 24) = v61;
        _LPLogPack(2);
        id v10 = v66;
        goto LABEL_42;
      }
      _os_log_pack_size();
      uint64_t v59 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v59 = 138412547;
      *(void *)(v59 + 4) = v45;
      *(_WORD *)(v59 + 12) = 2113;
      *(void *)(v59 + 14) = v61;
      int v55 = 2;
    }
    _LPLogPack(v55);
    id v10 = v66;
    v56 = v62;
LABEL_42:

    goto LABEL_43;
  }
  if (a5) {
    *a5 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
  }
  _os_log_pack_size();
  uint64_t v15 = _os_log_pack_fill();
  id v16 = [(LPMedia *)self description];
  uint64_t v17 = [v16 UTF8String];
  *(_DWORD *)uint64_t v15 = 136315138;
  *(void *)(v15 + 4) = v17;

  _LPLogPack(1);
  BOOL v14 = 0;
LABEL_44:

  return v14;
}

- (BOOL)unmountWithError:(id *)a3
{
  return [(LPAPFSVolume *)self unmountWithOptions:0 error:a3];
}

- (BOOL)unmountWithOptions:(id)a3 error:(id *)a4
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v58 = (id)[MEMORY[0x263EFF980] arrayWithCapacity:1];
  id v6 = (id)[v5 objectForKey:LPAPFSVolumeUnmountOptionAll];
  int v7 = [v6 BOOLValue];

  id v8 = (id)[v5 objectForKey:LPAPFSVolumeUnmountOptionSnapshotName];
  if (v8) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = v7 == 0;
  }
  id v61 = v5;
  v70 = self;
  if (v9)
  {
    id v28 = [(LPMedia *)self mountPoint];

    if (!v28) {
      goto LABEL_28;
    }
    id v29 = [(LPMedia *)self mountPoint];
    [v58 addObject:v29];
    id v30 = v29;
  }
  else
  {
    id v10 = [(LPAPFSVolume *)self snapshotMountPoints];
    id v11 = [(LPMedia *)self mountPoint];
    int v12 = v11;
    if (v10)
    {
      id v64 = v11;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      id v67 = v10;
      id v68 = v10;
      uint64_t v13 = [v68 countByEnumeratingWithState:&v76 objects:v81 count:16];
      BOOL v14 = v58;
      if (v13)
      {
        uint64_t v15 = v13;
        uint64_t v16 = *(void *)v77;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v77 != v16) {
              objc_enumerationMutation(v68);
            }
            uint64_t v18 = *(void **)(*((void *)&v76 + 1) + 8 * i);
            if (v7)
            {
              id v19 = (id)[v18 objectForKey:LPAPFSVolumeSnapshotMountPointKeyMountPoint];
              [v14 addObject:v19];
            }
            else
            {
              id v20 = (id)[v61 objectForKey:LPAPFSVolumeSnapshotMountPointKeyName];
              id v21 = (id)[v18 objectForKey:v20];
              id v22 = (id)[v61 objectForKey:LPAPFSVolumeUnmountOptionSnapshotName];
              int v23 = [v21 isEqualToString:v22];

              id v24 = v21;
              BOOL v14 = v58;

              unsigned int v25 = v20;
              self = v70;

              if (v23)
              {
                id v26 = (id)[v18 objectForKey:LPAPFSVolumeSnapshotMountPointKeyMountPoint];
                [v58 addObject:v26];

                if ((v7 & 1) == 0)
                {

                  id v5 = v61;
                  id v10 = v67;
                  int v12 = v64;
                  goto LABEL_26;
                }
              }
            }
          }
          uint64_t v15 = [v68 countByEnumeratingWithState:&v76 objects:v81 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }

      id v5 = v61;
      id v10 = v67;
      int v12 = v64;
    }
    if (v12) {
      int v27 = v7;
    }
    else {
      int v27 = 0;
    }
    if (v27 == 1) {
      [v58 addObject:v12];
    }
LABEL_26:

    id v30 = v10;
  }

LABEL_28:
  if ([v58 count])
  {
    [v58 sortUsingComparator:&__block_literal_global];
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v59 = v58;
    uint64_t v62 = [v59 countByEnumeratingWithState:&v72 objects:v80 count:16];
    if (!v62)
    {
      BOOL v44 = 0;
      goto LABEL_67;
    }
    uint64_t v60 = *(void *)v73;
    uint64_t v63 = *MEMORY[0x263F08438];
    while (1)
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v73 != v60) {
          objc_enumerationMutation(v59);
        }
        uint64_t v69 = *(void **)(*((void *)&v72 + 1) + 8 * v31);
        uint64_t v65 = v31;
        if (v5)
        {
          id v32 = (id)[v5 objectForKey:LPAPFSVolumeUnmountOptionForce];
          int v33 = v32 != 0;

          int v34 = v33 << 19;
          id v35 = (id)[v5 objectForKey:LPAPFSVolumeUnmountOptionDoNotLock];

          if (v35)
          {
            char v71 = 1;
            if (fsctl((const char *)[v69 fileSystemRepresentation], 0x80014A22uLL, &v71, 0))
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
          id v42 = v69;
          if (!unmount((const char *)[v42 fileSystemRepresentation], v34)) {
            break;
          }
          uint64_t v43 = *__error();
          BOOL v44 = v43 == 22;
          id v45 = v70;
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
            if (v41 == 3 && v43 == 16 && [(LPAPFSVolume *)v70 role] != 12)
            {
              v34 |= 0x80000u;
              sleep(3u);
              _os_log_pack_size();
              uint64_t v47 = _os_log_pack_fill();
              id v48 = [(LPMedia *)v70 devNodePath];
              *(_DWORD *)uint64_t v47 = 138412546;
              *(void *)(v47 + 4) = v48;
              *(_WORD *)(v47 + 12) = 1024;
              *(_DWORD *)(v47 + 14) = 16;
              id v45 = v70;
              int v46 = 1;
              _LPLogPack(1);

              int v41 = 4;
              goto LABEL_57;
            }
            if (a4)
            {
              int v46 = 0;
              *a4 = (id)[MEMORY[0x263F087E8] errorWithDomain:v63 code:v43 userInfo:0];
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
            self = v70;
            goto LABEL_62;
          }
        }
        _os_log_pack_size();
        uint64_t v53 = _os_log_pack_fill();
        self = v70;
        id v54 = [(LPMedia *)v70 devNodePath];
        *(_DWORD *)uint64_t v53 = 138412547;
        *(void *)(v53 + 4) = v54;
        *(_WORD *)(v53 + 12) = 2113;
        *(void *)(v53 + 14) = v42;
        _LPLogPack(2);

        BOOL v44 = 1;
LABEL_62:
        uint64_t v31 = v65 + 1;
        id v5 = v61;
      }
      while (v65 + 1 != v62);
      uint64_t v62 = [v59 countByEnumeratingWithState:&v72 objects:v80 count:16];
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

uint64_t __41__LPAPFSVolume_unmountWithOptions_error___block_invoke(uint64_t a1, void *a2)
{
  return [-a2 compare:];
}

- (BOOL)unmountAllWithError:(id *)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v7 = LPAPFSVolumeUnmountOptionAll;
  v8[0] = MEMORY[0x263EFFA88];
  id v5 = (id)[NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  LOBYTE(a3) = [(LPAPFSVolume *)self unmountWithOptions:v5 error:a3];

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
    long long v20 = v6;
    *(_DWORD *)uint64_t v5 = 136315394;
    *(void *)(v5 + 4) = "-[LPAPFSVolume deleteVolumeWithError:]";
    *(_WORD *)(v5 + 12) = 2112;
    *(void *)(v5 + 14) = v4;
    _LPLogPack(2);
    [v4 fileSystemRepresentation];
    unsigned int v7 = APFSVolumeDelete();
    if (!v7)
    {
      BOOL v14 = 1;
      goto LABEL_18;
    }
    unsigned int v8 = v7;
    if (v7 >> 26 == 56)
    {
      _os_log_pack_size();
      uint64_t v9 = _os_log_pack_fill();
      uint64_t v10 = v8 & 0x3FFF;
      *(_DWORD *)uint64_t v9 = v20;
      *(void *)(v9 + 4) = "-[LPAPFSVolume deleteVolumeWithError:]";
      *(_WORD *)(v9 + 12) = 1024;
      *(_DWORD *)(v9 + 14) = v10;
      _LPLogPack(1);
      if (a3)
      {
        id v11 = (void *)MEMORY[0x263F087E8];
        int v12 = @"com.apple.IOKit";
LABEL_14:
        uint64_t v17 = v10;
LABEL_17:
        BOOL v14 = 0;
        *a3 = (id)[v11 errorWithDomain:v12 code:v17 userInfo:0];
        goto LABEL_18;
      }
    }
    else
    {
      unsigned int v15 = v7 & 0xFFFFC000;
      _os_log_pack_size();
      if (v15 == 49152)
      {
        uint64_t v16 = _os_log_pack_fill();
        uint64_t v10 = v8 & 0x3FFF;
        *(_DWORD *)uint64_t v16 = v20;
        *(void *)(v16 + 4) = "-[LPAPFSVolume deleteVolumeWithError:]";
        *(_WORD *)(v16 + 12) = 1024;
        *(_DWORD *)(v16 + 14) = v10;
        _LPLogPack(1);
        if (a3)
        {
          id v11 = (void *)MEMORY[0x263F087E8];
          int v12 = (__CFString *)*MEMORY[0x263F08438];
          goto LABEL_14;
        }
      }
      else
      {
        uint64_t v18 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v18 = v20;
        *(void *)(v18 + 4) = "-[LPAPFSVolume deleteVolumeWithError:]";
        *(_WORD *)(v18 + 12) = 1024;
        *(_DWORD *)(v18 + 14) = v8;
        _LPLogPack(1);
        if (a3)
        {
          id v11 = (void *)MEMORY[0x263F087E8];
          int v12 = (__CFString *)*MEMORY[0x263F08410];
          uint64_t v17 = (int)v8;
          goto LABEL_17;
        }
      }
    }
  }
  else
  {
    if (a3) {
      *a3 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
    }
    _os_log_pack_size();
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136315138;
    *(void *)(v13 + 4) = "-[LPAPFSVolume deleteVolumeWithError:]";
    _LPLogPack(1);
  }
  BOOL v14 = 0;
LABEL_18:

  return v14;
}

- (id)snapshotsWithError:(id *)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [(LPAPFSVolume *)self snapshotInfoWithError:a3];
  id v4 = (id)[MEMORY[0x263EFF980] arrayWithCapacity:10];
  if (v3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [(id)[*(id *)(*((void *)&v12 + 1) + 8 * i) objectForKey:LPAPFSSnapshotPropertyKeyName[0]] v12];
          if (v10) {
            [v4 addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }

  return v4;
}

- (id)snapshotInfoWithError:(id *)a3
{
  v44[256] = *MEMORY[0x263EF8340];
  id v5 = [(LPMedia *)self mountPoint];
  uint64_t v6 = v5;
  if (!v5)
  {
    if (a3) {
      *a3 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
    }
    _os_log_pack_size();
    uint64_t v33 = _os_log_pack_fill();
    id v34 = [(LPMedia *)self description];
    *(_DWORD *)uint64_t v33 = 136315395;
    *(void *)(v33 + 4) = "-[LPAPFSVolume snapshotInfoWithError:]";
    *(_WORD *)(v33 + 12) = 2113;
    *(void *)(v33 + 14) = v34;
    _LPLogPack(1);

    goto LABEL_43;
  }
  id v7 = v5;
  int v8 = open((const char *)[v7 fileSystemRepresentation], 0x100000);
  if (v8 < 0)
  {
    if (a3) {
      *a3 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
    }
    _os_log_pack_size();
    uint64_t v35 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v35 = 136315651;
    *(void *)(v35 + 4) = "-[LPAPFSVolume snapshotInfoWithError:]";
    *(_WORD *)(v35 + 12) = 2113;
    *(void *)(v35 + 14) = v7;
    *(_WORD *)(v35 + 22) = 1024;
    *(_DWORD *)(v35 + 24) = 0;
    _LPLogPack(1);
LABEL_43:
    id v32 = 0;
    goto LABEL_47;
  }
  int v9 = v8;
  int v38 = v6;
  id v39 = (id)[MEMORY[0x263EFF980] arrayWithCapacity:10];
  *(void *)&v43.volattr = 0;
  *(void *)&v43.fileattr = 0;
  bzero(v44, 0x800uLL);
  *(void *)&v43.bitmapcount = 0xA000002100000005;
  int v10 = fs_snapshot_list(v9, &v43, v44, 0x800uLL, 0);
  if (v10 >= 1)
  {
    id v11 = (unsigned int *)v44;
    int v40 = v9;
    do
    {
      do
      {
        BOOL v12 = __OFSUB__(v10--, 1);
        if (v10 < 0 != v12) {
          break;
        }
        long long v13 = (int *)(v11 + 6);
        unsigned int v14 = v11[1];
        uint64_t v42 = *v11;
        if ((v14 & 0x20000000) != 0)
        {
          int v17 = *v13;
          _os_log_pack_size();
          uint64_t v18 = _os_log_pack_fill();
          *(_DWORD *)uint64_t v18 = 136315394;
          *(void *)(v18 + 4) = "-[LPAPFSVolume snapshotInfoWithError:]";
          *(_WORD *)(v18 + 12) = 1024;
          *(_DWORD *)(v18 + 14) = v17;
          _LPLogPack(1);
        }
        else
        {
          if (v14)
          {
            id v19 = (char *)v13 + *v13;
            id v15 = (id)[NSString stringWithUTF8String:v19];
            if (!v15)
            {
              _os_log_pack_size();
              uint64_t v20 = _os_log_pack_fill();
              *(_DWORD *)uint64_t v20 = 136315395;
              *(void *)(v20 + 4) = "-[LPAPFSVolume snapshotInfoWithError:]";
              *(_WORD *)(v20 + 12) = 2081;
              *(void *)(v20 + 14) = v19;
              _LPLogPack(2);
            }
            long long v13 = (int *)(v11 + 8);
            unsigned int v16 = v11[1];
          }
          else
          {
            id v15 = 0;
            LOBYTE(v16) = v11[1];
          }
          int v41 = v15;
          if ((v16 & 0x20) != 0)
          {
            uint64_t v24 = *(void *)v13;
            id v23 = (id)[NSNumber numberWithUnsignedLongLong:*(void *)v13 & 0x3FFFFFFFFFFFFFFFLL];
            unsigned int v25 = (void *)MEMORY[0x263EFFA88];
            id v26 = (void *)MEMORY[0x263EFFA80];
            if ((v24 & 0x4000000000000000) != 0) {
              int v27 = (void *)MEMORY[0x263EFFA88];
            }
            else {
              int v27 = (void *)MEMORY[0x263EFFA80];
            }
            id v22 = v27;
            if (v24 < 0) {
              id v28 = v25;
            }
            else {
              id v28 = v26;
            }
            id v21 = v28;
          }
          else
          {
            id v21 = 0;
            id v22 = 0;
            id v23 = 0;
          }
          id v29 = (id)[MEMORY[0x263EFF9A0] dictionaryWithCapacity:4];
          id v30 = v29;
          if (v41) {
            [v29 setObject:v41 forKey:LPAPFSSnapshotPropertyKeyName[0]];
          }
          if (v23) {
            [v30 setObject:v23 forKey:LPAPFSSnapshotPropertyKeyXID[0]];
          }
          if (v22) {
            [v30 setObject:v22 forKey:LPAPFSSnapshotPropertyKeyMarkedForRevert];
          }
          if (v21) {
            [v30 setObject:v21 forKey:LPAPFSSnapshotPropertyKeyMarkedForRoot[0]];
          }
          if ([v30 count]) {
            [v39 addObject:v30];
          }

          int v9 = v40;
        }
        id v11 = (unsigned int *)((char *)v11 + v42);
      }
      while ((v14 & 0x20000000) == 0);
      id v11 = (unsigned int *)v44;
      int v10 = fs_snapshot_list(v9, &v43, v44, 0x800uLL, 0);
    }
    while (v10 > 0);
  }
  if (v10 < 0)
  {
    _os_log_pack_size();
    uint64_t v36 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v36 = 136315394;
    *(void *)(v36 + 4) = "-[LPAPFSVolume snapshotInfoWithError:]";
    *(_WORD *)(v36 + 12) = 1024;
    *(_DWORD *)(v36 + 14) = v10;
    _LPLogPack(1);
    close(v9);
    uint64_t v31 = v39;
    id v32 = 0;
    if (a3) {
      *a3 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:v10 userInfo:0];
    }
  }
  else
  {
    close(v9);
    uint64_t v31 = v39;
    id v32 = (id)[MEMORY[0x263EFF8C0] arrayWithArray:v39];
  }

  uint64_t v6 = v38;
LABEL_47:

  return v32;
}

- (BOOL)createSnapshot:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(LPMedia *)self mountPoint];
  if (!v6 || ![v6 length])
  {
    if (a4) {
      *a4 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
    }
    goto LABEL_12;
  }
  if (!v7)
  {
    if (a4) {
      *a4 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
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
      *a4 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
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
      *a4 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:v13 userInfo:0];
    }
    _os_log_pack_size();
    uint64_t v14 = _os_log_pack_fill();
    id v15 = strerror(v13);
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
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = [(LPMedia *)self mountPoint];
  if (!v8)
  {
    if (a5) {
      *a5 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
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
      *a5 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
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
      *a5 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
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
  uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    id v29 = a5;
    id v28 = v9;
    int v15 = 0;
    char v30 = 0;
    uint64_t v16 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
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
      uint64_t v14 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v14);

    if (v29)
    {
      char v21 = v30;
      if (v15) {
        *id v29 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:v15 userInfo:0];
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
      *a5 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
    }
    goto LABEL_17;
  }
  if (!v9 || ![v9 length])
  {
    if (a5) {
      *a5 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
    }
    goto LABEL_17;
  }
  if (!v10)
  {
    if (a5) {
      *a5 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
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
      *a5 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
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
  int v14 = fs_snapshot_rename(v12, (const char *)[v8 fileSystemRepresentation], (const char *)[objc_retainAutorelease(v9) fileSystemRepresentation], 0);
  BOOL v15 = v14 == 0;
  if (v14)
  {
    int v16 = *__error();
    if (a5) {
      *a5 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:v16 userInfo:0];
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
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(LPMedia *)self mountPoint];
  if (!v8 || ![v8 length])
  {
    if (a5) {
      *a5 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
    }
    goto LABEL_13;
  }
  if (!v10)
  {
    if (a5) {
      *a5 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
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
      *a5 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
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
        *a5 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:v16 userInfo:0];
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
    id v19 = (id)[v9 objectForKeyedSubscript:LPAPFSVolumeRevertOptionSkipRemount];
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
        *a4 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
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
      *a4 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
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
      *a4 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:v15 userInfo:0];
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