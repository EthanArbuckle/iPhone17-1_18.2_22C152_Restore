@interface LPMedia
+ (BOOL)hasEmbeddedDeviceTypeRoot;
+ (NSArray)supportedContentTypes;
+ (NSDictionary)contentTypeToSubclassMap;
+ (id)allMedia;
+ (id)liveMediaForSnapshotAtPath:(id)a3;
+ (id)mediaForBSDNameOrDeviceNode:(id)a3;
+ (id)mediaForPath:(id)a3;
+ (id)mediaForPath:(id)a3 isSnapshot:(BOOL *)a4;
+ (id)mediaForPath:(id)a3 snapshotName:(id *)a4;
+ (id)mediaForUUID:(id)a3;
+ (id)mediaOfCorrectTypeGivenIOMedia:(unsigned int)a3;
+ (id)snapshotNameForMediaForPath:(id)a3;
+ (unsigned)_copyIOMediaForDiskWithPath:(id)a3;
+ (unsigned)_copyLiveFilesystemIOMediaForRootedSnapshot;
+ (void)waitForBlockStorage;
+ (void)waitForIOMediaWithDevNode:(id)a3;
- (BOOL)getBoolPropertyWithName:(id)a3;
- (BOOL)isEmbeddedDeviceTypeRoot;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInternal;
- (BOOL)isJournaled;
- (BOOL)isReadOnly;
- (BOOL)isWhole;
- (BOOL)setName:(id)a3 withError:(id *)a4;
- (LPMedia)initWithIOMediaObject:(unsigned int)a3;
- (id)BSDName;
- (id)_deviceCharacteristicStringForKey:(id)a3;
- (id)content;
- (id)description;
- (id)devNodePath;
- (id)deviceModel;
- (id)getPropertyWithName:(id)a3;
- (id)mediaUUID;
- (id)mountPoint;
- (id)name;
- (id)vendorName;
- (id)wholeMediaForMedia;
- (int)storageMedium;
- (unsigned)ioMedia;
- (void)dealloc;
- (void)setIoMedia:(unsigned int)a3;
@end

@implementation LPMedia

+ (NSArray)supportedContentTypes
{
  return (NSArray *)MEMORY[0x263EFFA68];
}

+ (BOOL)hasEmbeddedDeviceTypeRoot
{
  io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x263F0EC90], (CFDictionaryRef)&unk_26C28B128);
  io_service_t v3 = MatchingService;
  if (MatchingService) {
    IOObjectRelease(MatchingService);
  }
  return v3 != 0;
}

+ (id)allMedia
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = (id)[MEMORY[0x263EFF980] arrayWithCapacity:10];
  +[LPMedia waitForBlockStorage];
  io_iterator_t existing = 0;
  CFDictionaryRef v3 = IOServiceMatching("IOMedia");
  if (IOServiceGetMatchingServices(*MEMORY[0x263F0EC90], v3, &existing))
  {
    _os_log_pack_size();
    uint64_t v4 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v4 = 136315138;
    *(void *)(v4 + 4) = "+[LPMedia allMedia]";
    _LPLogPack(1);
    id v5 = (id)MEMORY[0x263EFFA68];
  }
  else
  {
    uint64_t v6 = IOIteratorNext(existing);
    if (v6)
    {
      uint64_t v7 = v6;
      do
      {
        id v8 = +[LPMedia mediaOfCorrectTypeGivenIOMedia:v7];
        if (v8) {
          [v2 addObject:v8];
        }
        IOObjectRelease(v7);

        uint64_t v7 = IOIteratorNext(existing);
      }
      while (v7);
    }
    if (existing) {
      IOObjectRelease(existing);
    }
    id v5 = (id)[MEMORY[0x263EFF8C0] arrayWithArray:v2];
  }

  return v5;
}

+ (id)mediaForPath:(id)a3
{
  return +[LPMedia mediaForPath:a3 snapshotName:0];
}

+ (id)mediaForPath:(id)a3 isSnapshot:(BOOL *)a4
{
  uint64_t v7 = 0;
  id v5 = (id)[a1 mediaForPath:a3 snapshotName:&v7];
  if (a4 && v5) {
    *a4 = v7 != 0;
  }

  return v5;
}

+ (id)mediaForPath:(id)a3 snapshotName:(id *)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  bzero(&v42, 0x878uLL);
  id v7 = v6;
  if (statfs((const char *)[v7 fileSystemRepresentation], &v42))
  {
    int v8 = *__error();
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    uint64_t v9 = _os_log_pack_fill();
    v10 = strerror(v8);
    *(_DWORD *)uint64_t v9 = 136315906;
    *(void *)(v9 + 4) = "+[LPMedia mediaForPath:snapshotName:]";
    *(_WORD *)(v9 + 12) = 2112;
    *(void *)(v9 + 14) = v7;
    *(_WORD *)(v9 + 22) = 1024;
    *(_DWORD *)(v9 + 24) = v8;
    *(_WORD *)(v9 + 28) = 2080;
    *(void *)(v9 + 30) = v10;
    _LPLogPack(1);
    id v11 = 0;
LABEL_3:
    v12 = 0;
    goto LABEL_24;
  }
  uint64_t v13 = v42.f_fsid.val[0];
  v40[0] = @"IOProviderClass";
  v40[1] = @"IOPropertyMatch";
  v41[0] = @"IOMedia";
  v38[0] = @"BSD Major";
  id v14 = (id)[NSNumber numberWithInt:HIBYTE(v42.f_fsid.val[0])];
  v38[1] = @"BSD Minor";
  v39[0] = v14;
  id v15 = (id)[NSNumber numberWithInt:v13 & 0xFFFFFF];
  v39[1] = v15;
  id v16 = (id)[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:2];
  v41[1] = v16;
  id v11 = (id)[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];

  LODWORD(v14) = *MEMORY[0x263F0EC90];
  CFDictionaryRef v17 = (const __CFDictionary *)CFRetain(v11);
  uint64_t MatchingService = IOServiceGetMatchingService((mach_port_t)v14, v17);
  if (!MatchingService)
  {
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    uint64_t v22 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v22 = 136315650;
    *(void *)(v22 + 4) = "+[LPMedia mediaForPath:snapshotName:]";
    *(_WORD *)(v22 + 12) = 2112;
    *(void *)(v22 + 14) = v7;
    *(_WORD *)(v22 + 22) = 2048;
    *(void *)(v22 + 24) = v13;
    _LPLogPack(1);
    goto LABEL_3;
  }
  io_object_t v19 = MatchingService;
  id v20 = (id)[a1 mediaOfCorrectTypeGivenIOMedia:MatchingService];
  v12 = v20;
  if (a4 && v20)
  {
    if ((v42.f_flags & 0x40000000) == 0)
    {
      v21 = 0;
LABEL_22:
      id v31 = v21;
      *a4 = v31;

      goto LABEL_23;
    }
    v23 = strrchr(v42.f_mntfromname, 64);
    if (v23)
    {
      v21 = (void *)[[NSString alloc] initWithBytes:v42.f_mntfromname length:v23 - v42.f_mntfromname encoding:4];
      goto LABEL_20;
    }
    if (!IOObjectConformsTo(v19, "AppleAPFSSnapshot"))
    {
      v21 = 0;
      goto LABEL_20;
    }
    memset(v37, 0, 37);
    CFProperty = (void *)IORegistryEntryCreateCFProperty(v19, @"UUID", 0, 0);
    [CFProperty getCString:v37 maxLength:37 encoding:4];
    uint64_t v36 = 0;
    memset(v35, 0, sizeof(v35));
    uint64_t v34 = 2;
    if (uuid_parse((const char *)v37, v35))
    {
      _os_log_pack_size();
      MEMORY[0x270FA5388]();
      uint64_t v25 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v25 = 136315907;
      *(void *)(v25 + 4) = "+[LPMedia mediaForPath:snapshotName:]";
      *(_WORD *)(v25 + 12) = 2080;
      *(void *)(v25 + 14) = "AppleAPFSSnapshot";
      *(_WORD *)(v25 + 22) = 2081;
      *(void *)(v25 + 24) = "UUID";
      *(_WORD *)(v25 + 32) = 2113;
      *(void *)(v25 + 34) = CFProperty;
      _LPLogPack(1);
    }
    else
    {
      if (!fsctl(v42.f_mntonname, 0xC1204A43uLL, &v34, 0))
      {
        v21 = [NSString initWithBytes:&v35[24] length:strnlen((const char *)&v35[24], 0xFFuLL) encoding:4];
        goto LABEL_19;
      }
      _os_log_pack_size();
      v33[1] = v33;
      MEMORY[0x270FA5388]();
      uint64_t v26 = _os_log_pack_fill();
      int v27 = *__error();
      v28 = __error();
      v29 = strerror(*v28);
      *(_DWORD *)uint64_t v26 = 136315650;
      *(void *)(v26 + 4) = "+[LPMedia mediaForPath:snapshotName:]";
      *(_WORD *)(v26 + 12) = 1024;
      *(_DWORD *)(v26 + 14) = v27;
      *(_WORD *)(v26 + 18) = 2080;
      *(void *)(v26 + 20) = v29;
      _LPLogPack(1);
    }
    v21 = 0;
LABEL_19:

LABEL_20:
    if (![v21 length])
    {
      _os_log_pack_size();
      MEMORY[0x270FA5388]();
      uint64_t v30 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v30 = 136315395;
      *(void *)(v30 + 4) = "+[LPMedia mediaForPath:snapshotName:]";
      *(_WORD *)(v30 + 12) = 2113;
      *(void *)(v30 + 14) = v7;
      _LPLogPack(1);
    }
    goto LABEL_22;
  }
LABEL_23:
  IOObjectRelease(v19);
LABEL_24:

  return v12;
}

+ (id)snapshotNameForMediaForPath:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v43 = 0;
  id v5 = (id)[a1 mediaForPath:v4 snapshotName:&v43];
  id v6 = v43;
  id v7 = v6;
  if (!v5)
  {
    _os_log_pack_size();
    uint64_t v9 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v9 = 136315395;
    *(void *)(v9 + 4) = "+[LPMedia snapshotNameForMediaForPath:]";
    *(_WORD *)(v9 + 12) = 2113;
    *(void *)(v9 + 14) = v4;
    _LPLogPack(1);
    id v8 = 0;
    goto LABEL_32;
  }
  if (v6)
  {
    id v8 = v6;
    goto LABEL_32;
  }
  id v10 = (id)[a1 liveMediaForSnapshotAtPath:@"/"];
  if (!v10 || ![v5 isEqual:v10]) {
    goto LABEL_10;
  }
  id v42 = 0;
  id v11 = (id)[a1 mediaForPath:@"/" snapshotName:&v42];
  id v8 = v42;

  if (!v11 || !v8)
  {

LABEL_10:
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v5;
      id v41 = 0;
      id v13 = (id)[v12 snapshotInfoWithError:&v41];
      id v14 = v41;
      id v15 = v14;
      if (v13)
      {
        id v35 = v14;
        id v33 = v12;
        id v34 = v10;
        id v36 = [(id)[MEMORY[0x263EFF980] arrayWithCapacity:[v13 count]];
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v32 = v13;
        id v16 = v13;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v37 objects:v44 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v38;
          while (2)
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v38 != v19) {
                objc_enumerationMutation(v16);
              }
              v21 = *(void **)(*((void *)&v37 + 1) + 8 * i);
              id v8 = (id)[v21 objectForKeyedSubscript:LPAPFSSnapshotPropertyKeyName[0]];
              id v22 = (id)[v21 objectForKeyedSubscript:LPAPFSSnapshotPropertyKeyMarkedForRoot[0]];
              if ([v22 BOOLValue])
              {

                id v10 = v34;
                id v12 = v33;
                id v13 = v32;
                v23 = v36;
                goto LABEL_29;
              }
              if ([v8 hasPrefix:@"com.apple.os.update-"]) {
                [v36 addObject:v21];
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v37 objects:v44 count:16];
            if (v18) {
              continue;
            }
            break;
          }
        }

        v23 = v36;
        if ([v36 count])
        {
          id v24 = (id)[v36 sortedArrayUsingComparator:&__block_literal_global_1];
          id v25 = (id)[v24 lastObject];
          id v8 = (id)[v25 objectForKeyedSubscript:LPAPFSSnapshotPropertyKeyName[0]];
        }
        else
        {
          _os_log_pack_size();
          uint64_t v30 = _os_log_pack_fill();
          *(_DWORD *)uint64_t v30 = 136315138;
          *(void *)(v30 + 4) = "+[LPMedia snapshotNameForMediaForPath:]";
          _LPLogPack(1);
          id v8 = 0;
        }
        id v10 = v34;
        id v12 = v33;
        id v13 = v32;
LABEL_29:

        id v15 = v35;
      }
      else
      {
        _os_log_pack_size();
        uint64_t v28 = _os_log_pack_fill();
        id v29 = (id)[v12 devNodePath];
        *(_DWORD *)uint64_t v28 = 136315650;
        *(void *)(v28 + 4) = "+[LPMedia snapshotNameForMediaForPath:]";
        *(_WORD *)(v28 + 12) = 2112;
        *(void *)(v28 + 14) = v29;
        *(_WORD *)(v28 + 22) = 2112;
        *(void *)(v28 + 24) = v15;

        _LPLogPack(1);
        id v8 = 0;
      }
    }
    else
    {
      _os_log_pack_size();
      uint64_t v26 = _os_log_pack_fill();
      id v27 = (id)[v5 devNodePath];
      *(_DWORD *)uint64_t v26 = 136315394;
      *(void *)(v26 + 4) = "+[LPMedia snapshotNameForMediaForPath:]";
      *(_WORD *)(v26 + 12) = 2112;
      *(void *)(v26 + 14) = v27;

      _LPLogPack(1);
      id v8 = 0;
    }
  }

LABEL_32:

  return v8;
}

uint64_t __39__LPMedia_snapshotNameForMediaForPath___block_invoke(int a1, void *a2, id a3)
{
  id v4 = LPAPFSSnapshotPropertyKeyXID[0];
  id v5 = a3;
  id v6 = (id)[a2 objectForKeyedSubscript:v4];
  id v7 = (id)[v5 objectForKeyedSubscript:LPAPFSSnapshotPropertyKeyXID[0]];

  uint64_t v8 = [v6 compare:v7];
  return v8;
}

+ (id)liveMediaForSnapshotAtPath:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (([v4 isEqualToString:@"/"] & 1) == 0)
  {
    uint64_t v8 = (__objc2_class *)a1;
LABEL_9:
    id v9 = (id)[(__objc2_class *)v8 mediaForPath:v4];
    goto LABEL_18;
  }
  io_object_t v5 = +[LPMedia _copyIOMediaForDiskWithPath:v4];
  if (!v5)
  {
    if (![v4 isEqualToString:@"/"]
      || (uint64_t v10 = +[LPMedia _copyLiveFilesystemIOMediaForRootedSnapshot], !v10))
    {
      _os_log_pack_size();
      uint64_t v11 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v11 = 136315395;
      *(void *)(v11 + 4) = "+[LPMedia liveMediaForSnapshotAtPath:]";
      *(_WORD *)(v11 + 12) = 2113;
      *(void *)(v11 + 14) = v4;
      _LPLogPack(1);
      id v9 = 0;
      goto LABEL_18;
    }
    io_object_t v6 = v10;
    uint64_t v7 = v10;
    goto LABEL_13;
  }
  io_object_t v6 = v5;
  if (!IOObjectConformsTo(v5, "AppleAPFSSnapshot"))
  {
    _os_log_pack_size();
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315395;
    *(void *)(v12 + 4) = "+[LPMedia liveMediaForSnapshotAtPath:]";
    *(_WORD *)(v12 + 12) = 2113;
    *(void *)(v12 + 14) = v4;
    _LPLogPack(1);
    IOObjectRelease(v6);
    uint64_t v8 = LPMedia;
    goto LABEL_9;
  }
  io_registry_entry_t parent = 0;
  if (IORegistryEntryGetParentEntry(v6, "IOService", &parent)
    || !parent
    || !IOObjectConformsTo(parent, "AppleAPFSVolume"))
  {
    _os_log_pack_size();
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136315395;
    *(void *)(v13 + 4) = "+[LPMedia liveMediaForSnapshotAtPath:]";
    *(_WORD *)(v13 + 12) = 2113;
    *(void *)(v13 + 14) = v4;
    _LPLogPack(1);
    id v9 = 0;
    goto LABEL_17;
  }
  uint64_t v7 = parent;
LABEL_13:
  id v9 = +[LPMedia mediaOfCorrectTypeGivenIOMedia:v7];
LABEL_17:
  IOObjectRelease(v6);
LABEL_18:

  return v9;
}

+ (id)mediaForUUID:(id)a3
{
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  id v4 = a3;
  Mutable = CFDictionaryCreateMutable(v3, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionarySetValue(Mutable, @"IOProviderClass", @"IOMedia");
  CFDictionarySetValue(Mutable, @"UUID", v4);

  uint64_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x263F0EC90], Mutable);
  if (MatchingService)
  {
    io_object_t v7 = MatchingService;
    id v8 = +[LPMedia mediaOfCorrectTypeGivenIOMedia:MatchingService];
    IOObjectRelease(v7);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)mediaForBSDNameOrDeviceNode:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    if ([v3 length])
    {
      id v5 = v4;
      if ([v4 hasPrefix:@"/dev/"])
      {
        id v5 = (id)[v4 substringFromIndex:5];
      }
      mach_port_t v6 = *MEMORY[0x263F0EC90];
      id v7 = v5;
      CFDictionaryRef v8 = IOBSDNameMatching(v6, 0, (const char *)[v7 fileSystemRepresentation]);
      uint64_t MatchingService = IOServiceGetMatchingService(v6, v8);
      if (MatchingService)
      {
        io_object_t v10 = MatchingService;
        id v11 = +[LPMedia mediaOfCorrectTypeGivenIOMedia:MatchingService];
        IOObjectRelease(v10);
      }
      else
      {
        id v11 = 0;
      }
    }
    else
    {
      id v11 = 0;
      id v7 = v4;
    }
  }
  else
  {
    id v11 = 0;
    id v7 = 0;
  }

  return v11;
}

- (id)wholeMediaForMedia
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ([(LPMedia *)self isWhole])
  {
    id v3 = self;
  }
  else
  {
    io_iterator_t v14 = 0;
    if (MEMORY[0x210570C50]([(LPMedia *)self ioMedia], "IOService", 3, &v14))
    {
      _os_log_pack_size();
      uint64_t v4 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v4 = 136315138;
      *(void *)(v4 + 4) = "-[LPMedia wholeMediaForMedia]";
      _LPLogPack(1);
      id v3 = 0;
    }
    else
    {
      uint64_t v5 = IOIteratorNext(v14);
      if (v5)
      {
        uint64_t v6 = v5;
        id v3 = 0;
        do
        {
          if (IOObjectConformsTo(v6, "IOMedia")
            && (CFBooleanRef CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v6, @"Whole", 0, 0)) != 0)
          {
            CFBooleanRef v8 = CFProperty;
            CFTypeID v9 = CFGetTypeID(CFProperty);
            if (v9 == CFBooleanGetTypeID() && CFBooleanGetValue(v8))
            {
              io_object_t v10 = (LPMedia *)+[LPMedia mediaOfCorrectTypeGivenIOMedia:v6];

              int v11 = 1;
              id v3 = v10;
            }
            else
            {
              int v11 = 0;
            }
            CFRelease(v8);
          }
          else
          {
            int v11 = 0;
          }
          IOObjectRelease(v6);
          uint64_t v6 = IOIteratorNext(v14);
          if (v6) {
            BOOL v12 = v11 == 0;
          }
          else {
            BOOL v12 = 0;
          }
        }
        while (v12);
      }
      else
      {
        id v3 = 0;
      }
      IOObjectRelease(v14);
    }
  }

  return v3;
}

- (LPMedia)initWithIOMediaObject:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v6.receiver = self;
  v6.super_class = (Class)LPMedia;
  uint64_t v4 = [(LPMedia *)&v6 init];
  if (v4)
  {
    IOObjectRetain(v3);
    [(LPMedia *)v4 setIoMedia:v3];
  }
  return v4;
}

- (void)dealloc
{
  if ([(LPMedia *)self ioMedia]) {
    IOObjectRelease([(LPMedia *)self ioMedia]);
  }
  v3.receiver = self;
  v3.super_class = (Class)LPMedia;
  [(LPMedia *)&v3 dealloc];
}

- (id)content
{
  return [(LPMedia *)self getStringPropertyWithName:@"Content"];
}

- (id)mediaUUID
{
  return [(LPMedia *)self getStringPropertyWithName:@"UUID"];
}

- (id)name
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = [(LPMedia *)self mountPoint];
  if (!v3
    || (bzero(v9, 0x40CuLL),
        v8[2] = 0,
        v8[0] = 5,
        v8[1] = 2147491840,
        getattrlist((const char *)[v3 fileSystemRepresentation], v8, v9, 0x40CuLL, 0) == -1))
  {
    long long v10 = 0u;
    memset(v9, 0, sizeof(v9));
    if (MEMORY[0x210570C60]([(LPMedia *)self ioMedia], v9))
    {
      id v6 = 0;
      goto LABEL_8;
    }
    HIBYTE(v10) = 0;
    uint64_t v4 = NSString;
    uint64_t v5 = (char *)v9;
  }
  else
  {
    uint64_t v4 = NSString;
    uint64_t v5 = (char *)v9 + SDWORD1(v9[0]) + 4;
  }
  id v6 = (id)[v4 stringWithCString:v5 encoding:4];
LABEL_8:

  return v6;
}

- (BOOL)setName:(id)a3 withError:(id *)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  bzero(v25, 0x408uLL);
  id v7 = [(LPMedia *)self mountPoint];
  CFBooleanRef v8 = (const char *)[v7 fileSystemRepresentation];

  if (!v8)
  {
    _os_log_pack_size();
    uint64_t v19 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v19 = 136315138;
    *(void *)(v19 + 4) = "-[LPMedia setName:withError:]";
    _LPLogPack(1);
    if (a4)
    {
      uint64_t v17 = (void *)MEMORY[0x263F087E8];
      uint64_t v18 = *MEMORY[0x263F08438];
      uint64_t v16 = 22;
      goto LABEL_7;
    }
LABEL_8:
    BOOL v20 = 0;
    goto LABEL_10;
  }
  uint64_t v24 = 0;
  long long v23 = xmmword_2104FB7B0;
  id v9 = v6;
  [v9 UTF8String];
  __strlcpy_chk();
  v25[0] = 8;
  v25[1] = strlen(v26) + 1;
  int v10 = setattrlist(v8, &v23, v25, 0x408uLL, 0);
  _os_log_pack_size();
  if (!v10)
  {
    uint64_t v21 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v21 = 136315395;
    *(void *)(v21 + 4) = "-[LPMedia setName:withError:]";
    *(_WORD *)(v21 + 12) = 2113;
    *(void *)(v21 + 14) = v9;
    _LPLogPack(3);
    BOOL v20 = 1;
    goto LABEL_10;
  }
  uint64_t v11 = _os_log_pack_fill();
  BOOL v12 = __error();
  uint64_t v13 = strerror(*v12);
  *(_DWORD *)uint64_t v11 = 136315394;
  *(void *)(v11 + 4) = "-[LPMedia setName:withError:]";
  *(_WORD *)(v11 + 12) = 2080;
  *(void *)(v11 + 14) = v13;
  _LPLogPack(1);
  if (!a4) {
    goto LABEL_8;
  }
  io_iterator_t v14 = (void *)MEMORY[0x263F087E8];
  uint64_t v15 = *MEMORY[0x263F08438];
  uint64_t v16 = *__error();
  uint64_t v17 = v14;
  uint64_t v18 = v15;
LABEL_7:
  BOOL v20 = 0;
  *a4 = (id)[v17 errorWithDomain:v18 code:v16 userInfo:0];
LABEL_10:

  return v20;
}

- (id)BSDName
{
  return [(LPMedia *)self getStringPropertyWithName:@"BSD Name"];
}

- (id)devNodePath
{
  id v2 = [(LPMedia *)self BSDName];
  if (v2) {
    id v3 = (id)[NSString stringWithFormat:@"/dev/%@", v2];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)mountPoint
{
  id v2 = [(LPMedia *)self devNodePath];
  if (v2)
  {
    int v10 = 0;
    int v3 = getmntinfo_r_np(&v10, 2);
    if (v3 < 1)
    {
LABEL_6:
      id v8 = 0;
    }
    else
    {
      unint64_t v4 = 0;
      uint64_t v5 = 2168 * v3;
      while (1)
      {
        id v6 = (const char *)[v2 fileSystemRepresentation];
        id v7 = &v10[v4 / 0x878];
        if (!strcmp(v6, v10[v4 / 0x878].f_mntfromname)) {
          break;
        }
        v4 += 2168;
        if (v5 == v4) {
          goto LABEL_6;
        }
      }
      id v8 = (id)[NSString stringWithUTF8String:v7->f_mntonname];
    }
    if (v10) {
      free(v10);
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)vendorName
{
  return [(LPMedia *)self _deviceCharacteristicStringForKey:@"Vendor Name"];
}

- (id)deviceModel
{
  uint64_t v3 = 0;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  while (1)
  {
    uint64_t v5 = (void *)IORegistryEntrySearchCFProperty([(LPMedia *)self ioMedia], "IOService", off_2641321B0[v3], v4, 3u);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }

    if (++v3 == 4)
    {
      uint64_t v5 = 0;
      break;
    }
  }

  return v5;
}

- (int)storageMedium
{
  id v2 = [(LPMedia *)self _deviceCharacteristicStringForKey:@"Medium Type"];
  if ([v2 isEqualToString:@"Rotational"])
  {
    int v3 = 1;
  }
  else if ([v2 isEqualToString:@"Solid State"])
  {
    int v3 = 2;
  }
  else
  {
    int v3 = 0;
  }

  return v3;
}

- (BOOL)isWhole
{
  return [(LPMedia *)self getBoolPropertyWithName:@"Whole"];
}

- (BOOL)isInternal
{
  id v2 = (void *)IORegistryEntrySearchCFProperty([(LPMedia *)self ioMedia], "IOService", @"Protocol Characteristics", 0, 3u);
  id v3 = (id)[v2 objectForKeyedSubscript:@"Physical Interconnect Location"];
  char v4 = [v3 isEqualToString:@"Internal"];

  return v4;
}

- (BOOL)isEmbeddedDeviceTypeRoot
{
  id v2 = (void *)IORegistryEntrySearchCFProperty([(LPMedia *)self ioMedia], "IOService", @"EmbeddedDeviceTypeRoot", 0, 3u);
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isReadOnly
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  char v3 = (void *)MEMORY[0x210570EE0](self, a2);
  id v4 = [(LPMedia *)self mountPoint];
  if (v4)
  {
    bzero(&v9, 0x878uLL);
    id v5 = v4;
    if (!statfs((const char *)[v5 fileSystemRepresentation], &v9))
    {
      BOOL v7 = v9.f_flags & 1;
      goto LABEL_6;
    }
    _os_log_pack_size();
    uint64_t v6 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v6 = 136315394;
    *(void *)(v6 + 4) = "-[LPMedia isReadOnly]";
    *(_WORD *)(v6 + 12) = 2112;
    *(void *)(v6 + 14) = v5;
    _LPLogPack(1);
  }
  BOOL v7 = 0;
LABEL_6:

  return v7;
}

- (BOOL)isJournaled
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  char v3 = (void *)MEMORY[0x210570EE0](self, a2);
  id v4 = [(LPMedia *)self mountPoint];
  if (v4)
  {
    bzero(&v9, 0x878uLL);
    id v5 = v4;
    if (!statfs((const char *)[v5 fileSystemRepresentation], &v9))
    {
      int v7 = BYTE2(v9.f_flags) >> 7;
      goto LABEL_6;
    }
    _os_log_pack_size();
    uint64_t v6 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v6 = 136315394;
    *(void *)(v6 + 4) = "-[LPMedia isJournaled]";
    *(_WORD *)(v6 + 12) = 2112;
    *(void *)(v6 + 14) = v5;
    _LPLogPack(1);
  }
  LOBYTE(v7) = 0;
LABEL_6:

  return v7;
}

- (id)description
{
  id v3 = [(LPMedia *)self mountPoint];
  if (v3)
  {
    id v4 = NSString;
    id v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    int v7 = (NSString *)[(LPMedia *)self name];
    id v8 = (id)[v4 stringWithFormat:@"%@: %@, Mount: %@", v6, v7, v3];
  }
  else
  {
    uint64_t v6 = (NSString *)[(LPMedia *)self mediaUUID];
    statfs v9 = NSString;
    uint64_t v10 = (objc_class *)objc_opt_class();
    int v7 = NSStringFromClass(v10);
    id v11 = [(LPMedia *)self name];
    BOOL v12 = v11;
    if (v6) {
      uint64_t v13 = (void *)[v9 stringWithFormat:@"%@: %@, UUID: %@", v7, v11, v6];
    }
    else {
      uint64_t v13 = (void *)[v9 stringWithFormat:@"%@: %@", v7, v11, v15];
    }
    id v8 = v13;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    io_object_t v6 = [(LPMedia *)self ioMedia];
    io_object_t v7 = [v5 ioMedia];

    BOOL v8 = IOObjectIsEqualTo(v6, v7) == 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)_deviceCharacteristicStringForKey:(id)a3
{
  id v4 = a3;
  id v5 = (void *)IORegistryEntrySearchCFProperty([(LPMedia *)self ioMedia], "IOService", @"Device Characteristics", 0, 3u);
  objc_opt_class();
  id v6 = 0;
  if (objc_opt_isKindOfClass())
  {
    id v7 = (id)[v5 objectForKeyedSubscript:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v7;
    }
    else {
      id v6 = 0;
    }
  }

  return v6;
}

+ (unsigned)_copyIOMediaForDiskWithPath:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  bzero(&v14, 0x878uLL);
  if (statfs((const char *)[a3 fileSystemRepresentation], &v14))
  {
    int v4 = *__error();
    _os_log_pack_size();
    uint64_t v5 = _os_log_pack_fill();
    id v6 = strerror(v4);
    *(_DWORD *)uint64_t v5 = 136315650;
    *(void *)(v5 + 4) = "+[LPMedia _copyIOMediaForDiskWithPath:]";
    *(_WORD *)(v5 + 12) = 1024;
    *(_DWORD *)(v5 + 14) = v4;
    *(_WORD *)(v5 + 18) = 2080;
    *(void *)(v5 + 20) = v6;
    _LPLogPack(1);
    return 0;
  }
  else
  {
    id v8 = (id)[NSString stringWithUTF8String:v14.f_mntfromname];
    if ([v8 hasPrefix:@"/dev/"])
    {
      id v9 = (id)[v8 substringFromIndex:5];

      id v8 = v9;
    }
    mach_port_t v10 = *MEMORY[0x263F0EC90];
    id v11 = v8;
    CFDictionaryRef v12 = IOBSDNameMatching(v10, 0, (const char *)[v11 UTF8String]);
    io_service_t MatchingService = IOServiceGetMatchingService(v10, v12);
  }
  return MatchingService;
}

+ (unsigned)_copyLiveFilesystemIOMediaForRootedSnapshot
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  bzero(&v14, 0x878uLL);
  if (statfs("/", &v14))
  {
    int v2 = *__error();
    _os_log_pack_size();
    uint64_t v3 = _os_log_pack_fill();
    int v4 = strerror(v2);
    *(_DWORD *)uint64_t v3 = 136315650;
    *(void *)(v3 + 4) = "+[LPMedia _copyLiveFilesystemIOMediaForRootedSnapshot]";
    *(_WORD *)(v3 + 12) = 1024;
    *(_DWORD *)(v3 + 14) = v2;
    *(_WORD *)(v3 + 18) = 2080;
    *(void *)(v3 + 20) = v4;
    _LPLogPack(1);
    return 0;
  }
  else
  {
    id v6 = (id)[NSString stringWithUTF8String:v14.f_mntfromname];
    id v7 = (id)[v6 componentsSeparatedByString:@"@"];
    if ([v7 count] == 2
      && (id v8 = (id)[v7 objectAtIndexedSubscript:1],
          int v9 = [v8 hasPrefix:@"/dev/"],
          v8,
          v9))
    {
      id v10 = (id)[v7 objectAtIndexedSubscript:1];
      id v11 = (id)[v10 substringFromIndex:5];

      LODWORD(v10) = *MEMORY[0x263F0EC90];
      id v6 = v11;
      CFDictionaryRef v12 = IOBSDNameMatching((mach_port_t)v10, 0, (const char *)[v6 UTF8String]);
      io_service_t MatchingService = IOServiceGetMatchingService((mach_port_t)v10, v12);
    }
    else
    {
      io_service_t MatchingService = 0;
    }
  }
  return MatchingService;
}

- (unsigned)ioMedia
{
  return self->_ioMedia;
}

- (void)setIoMedia:(unsigned int)a3
{
  self->_ioMedia = a3;
}

+ (NSDictionary)contentTypeToSubclassMap
{
  if (contentTypeToSubclassMap_once != -1) {
    dispatch_once(&contentTypeToSubclassMap_once, &__block_literal_global_169);
  }
  int v2 = (void *)contentTypeToSubclassMap_sharedMap;

  return (NSDictionary *)v2;
}

void __44__LPMedia_Private__contentTypeToSubclassMap__block_invoke()
{
  v25[4] = *MEMORY[0x263EF8340];
  context = (void *)MEMORY[0x210570EE0]();
  id v0 = (id)[MEMORY[0x263EFF9A0] dictionary];
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  _DWORD v25[2] = objc_opt_class();
  v25[3] = objc_opt_class();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v1 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:4];
  uint64_t v2 = [v1 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v20;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v20 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = *(void **)(*((void *)&v19 + 1) + 8 * v5);
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        id v7 = (id)[v6 supportedContentTypes];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v16;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v16 != v10) {
                objc_enumerationMutation(v7);
              }
              [v0 setObject:v6 forKeyedSubscript:*(void *)(*((void *)&v15 + 1) + 8 * v11++)];
            }
            while (v9 != v11);
            uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v23 count:16];
          }
          while (v9);
        }

        ++v5;
      }
      while (v5 != v3);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v3);
  }

  uint64_t v12 = [v0 copy];
  uint64_t v13 = (void *)contentTypeToSubclassMap_sharedMap;
  contentTypeToSubclassMap_sharedMap = v12;
}

- (id)getPropertyWithName:(id)a3
{
  uint64_t v4 = (__CFString *)a3;
  CFBooleanRef CFProperty = (void *)IORegistryEntryCreateCFProperty([(LPMedia *)self ioMedia], v4, 0, 0);
  if (!CFProperty)
  {
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    uint64_t v6 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v6 = 136315394;
    *(void *)(v6 + 4) = "-[LPMedia(Private) getPropertyWithName:]";
    *(_WORD *)(v6 + 12) = 2112;
    *(void *)(v6 + 14) = v4;
    _LPLogPack(3);
  }

  return CFProperty;
}

- (BOOL)getBoolPropertyWithName:(id)a3
{
  id v3 = [(LPMedia *)self getPropertyWithName:a3];
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (id)mediaOfCorrectTypeGivenIOMedia:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  mach_timespec_t waitTime = (mach_timespec_t)5;
  if (IOServiceWaitQuiet(a3, &waitTime) == -536870186)
  {
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    *(_WORD *)_os_log_pack_fill() = 0;
    _LPLogPack(2);
  }
  CFBooleanRef CFProperty = (void *)IORegistryEntryCreateCFProperty(v3, @"Content", 0, 0);
  if (!CFProperty
    || (uint64_t v5 = +[LPMedia contentTypeToSubclassMap],
        uint64_t v6 = [(NSDictionary *)v5 objectForKeyedSubscript:CFProperty],
        v5,
        !v6))
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
  }
  id v7 = (void *)[[v6 alloc] initWithIOMediaObject:v3];

  return v7;
}

+ (void)waitForIOMediaWithDevNode:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = v3;
  if ([v3 hasPrefix:@"/dev/"])
  {
    id v4 = (id)[v3 substringFromIndex:5];
  }
  mach_port_t v5 = *MEMORY[0x263F0EC90];
  id v6 = v4;
  CFDictionaryRef v7 = IOBSDNameMatching(v5, 0, (const char *)[v6 fileSystemRepresentation]);
  io_service_t MatchingService = IOServiceGetMatchingService(v5, v7);
  if (MatchingService)
  {
    io_object_t v9 = MatchingService;
    mach_timespec_t waitTime = (mach_timespec_t)5;
    if (IOServiceWaitQuiet(MatchingService, &waitTime) == -536870186)
    {
      _os_log_pack_size();
      uint64_t v10 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v10 = 138412290;
      *(void *)(v10 + 4) = v6;
      _LPLogPack(1);
    }
    IOObjectRelease(v9);
  }
  else
  {
    _os_log_pack_size();
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 138412290;
    *(void *)(v11 + 4) = v6;
    _LPLogPack(1);
  }
}

+ (void)waitForBlockStorage
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  io_iterator_t existing = 0;
  CFDictionaryRef v2 = IOServiceMatching("IOBlockStorageDevice");
  if (!IOServiceGetMatchingServices(*MEMORY[0x263F0EC90], v2, &existing))
  {
    unsigned int v3 = 0;
    do
    {
      MEMORY[0x210570BF0](existing);
      mach_timespec_t waitTime = (mach_timespec_t)5;
      io_object_t v4 = IOIteratorNext(existing);
      if (v4)
      {
        io_service_t v5 = v4;
        char v6 = 0;
        do
        {
          v6 |= IOServiceWaitQuiet(v5, &waitTime) == -536870186;
          IOObjectRelease(v5);
          io_service_t v5 = IOIteratorNext(existing);
        }
        while (v5);
      }
      else
      {
        char v6 = 0;
      }
      if (IOIteratorIsValid(existing)) {
        BOOL v7 = 1;
      }
      else {
        BOOL v7 = v3 >= 4;
      }
      ++v3;
    }
    while (!v7);
    if (v6)
    {
      _os_log_pack_size();
      *(_WORD *)_os_log_pack_fill() = 0;
      _LPLogPack(2);
    }
    IOObjectRelease(existing);
  }
}

@end