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
  return (NSArray *)__NSArray0__;
}

+ (BOOL)hasEmbeddedDeviceTypeRoot
{
  v11[0] = @"IOProviderClass";
  v11[1] = @"IOPropertyMatch";
  v12[0] = @"IOBlockStorageDevice";
  CFStringRef v9 = @"EmbeddedDeviceTypeRoot";
  v2 = +[NSNumber numberWithBool:1];
  v10 = v2;
  v3 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v12[1] = v3;
  v4 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];

  CFDictionaryRef v5 = v4;
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v5);
  io_service_t v7 = MatchingService;
  if (MatchingService) {
    IOObjectRelease(MatchingService);
  }

  return v7 != 0;
}

+ (id)allMedia
{
  v2 = +[NSMutableArray arrayWithCapacity:10];
  +[LPMedia waitForBlockStorage];
  io_iterator_t existing = 0;
  CFDictionaryRef v3 = IOServiceMatching("IOMedia");
  if (IOServiceGetMatchingServices(kIOMasterPortDefault, v3, &existing))
  {
    _os_log_pack_size();
    uint64_t v4 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v4 = 136315138;
    *(void *)(v4 + 4) = "+[LPMedia allMedia]";
    _LPLogPack(1);
    CFDictionaryRef v5 = (NSArray *)__NSArray0__;
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
          [(NSMutableArray *)v2 addObject:v8];
        }
        IOObjectRelease(v7);

        uint64_t v7 = IOIteratorNext(existing);
      }
      while (v7);
    }
    if (existing) {
      IOObjectRelease(existing);
    }
    CFDictionaryRef v5 = +[NSArray arrayWithArray:v2];
  }
  CFStringRef v9 = v5;

  return v9;
}

+ (id)mediaForPath:(id)a3
{
  return +[LPMedia mediaForPath:a3 snapshotName:0];
}

+ (id)mediaForPath:(id)a3 isSnapshot:(BOOL *)a4
{
  uint64_t v7 = 0;
  id v5 = [a1 mediaForPath:a3 snapshotName:&v7];
  if (a4 && v5) {
    *a4 = v7 != 0;
  }
  return v5;
}

+ (id)mediaForPath:(id)a3 snapshotName:(id *)a4
{
  id v6 = a3;
  bzero(&v42, 0x878uLL);
  id v7 = v6;
  if (statfs((const char *)[v7 fileSystemRepresentation], &v42))
  {
    int v8 = *__error();
    _os_log_pack_size();
    __chkstk_darwin();
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
    v11 = 0;
LABEL_3:
    v12 = 0;
    goto LABEL_24;
  }
  uint64_t v13 = v42.f_fsid.val[0];
  v40[0] = @"IOProviderClass";
  v40[1] = @"IOPropertyMatch";
  v41[0] = @"IOMedia";
  v38[0] = @"BSD Major";
  v14 = +[NSNumber numberWithInt:HIBYTE(v42.f_fsid.val[0])];
  v38[1] = @"BSD Minor";
  v39[0] = v14;
  v15 = +[NSNumber numberWithInt:v13 & 0xFFFFFF];
  v39[1] = v15;
  v16 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:2];
  v41[1] = v16;
  v11 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];

  CFDictionaryRef v17 = (const __CFDictionary *)CFRetain(v11);
  uint64_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v17);
  if (!MatchingService)
  {
    _os_log_pack_size();
    __chkstk_darwin();
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
  id v20 = [a1 mediaOfCorrectTypeGivenIOMedia:MatchingService];
  v12 = v20;
  if (a4 && v20)
  {
    if ((v42.f_flags & 0x40000000) == 0)
    {
      id v21 = 0;
LABEL_22:
      id v31 = v21;
      *a4 = v31;

      goto LABEL_23;
    }
    v23 = strrchr(v42.f_mntfromname, 64);
    if (v23)
    {
      id v21 = [objc_alloc((Class)NSString) initWithBytes:v42.f_mntfromname length:v23 - v42.f_mntfromname encoding:4];
      goto LABEL_20;
    }
    if (!IOObjectConformsTo(v19, "AppleAPFSSnapshot"))
    {
      id v21 = 0;
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
      __chkstk_darwin();
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
        id v21 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", &v35[24], strnlen((const char *)&v35[24], 0xFFuLL), 4);
        goto LABEL_19;
      }
      _os_log_pack_size();
      v33[1] = v33;
      __chkstk_darwin();
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
    id v21 = 0;
LABEL_19:

LABEL_20:
    if (![v21 length])
    {
      _os_log_pack_size();
      __chkstk_darwin();
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
  id v4 = a3;
  id v43 = 0;
  id v5 = [a1 mediaForPath:v4 snapshotName:&v43];
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
  id v10 = [a1 liveMediaForSnapshotAtPath:@"/"];
  if (!v10 || ![v5 isEqual:v10]) {
    goto LABEL_10;
  }
  id v42 = 0;
  id v11 = [a1 mediaForPath:@"/" snapshotName:&v42];
  id v8 = v42;

  if (!v11 || !v8)
  {

LABEL_10:
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v5;
      id v41 = 0;
      id v13 = [v12 snapshotInfoWithError:&v41];
      id v14 = v41;
      v15 = v14;
      if (v13)
      {
        id v35 = v14;
        id v33 = v12;
        id v34 = v10;
        uint64_t v36 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v13 count]);
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v32 = v13;
        id v16 = v13;
        id v17 = [v16 countByEnumeratingWithState:&v37 objects:v44 count:16];
        if (v17)
        {
          id v18 = v17;
          uint64_t v19 = *(void *)v38;
          while (2)
          {
            for (i = 0; i != v18; i = (char *)i + 1)
            {
              if (*(void *)v38 != v19) {
                objc_enumerationMutation(v16);
              }
              id v21 = *(void **)(*((void *)&v37 + 1) + 8 * i);
              id v8 = [v21 objectForKeyedSubscript:LPAPFSSnapshotPropertyKeyName[0]];
              id v22 = [v21 objectForKeyedSubscript:LPAPFSSnapshotPropertyKeyMarkedForRoot[0]];
              if ([v22 BOOLValue])
              {

                id v10 = v34;
                id v12 = v33;
                id v13 = v32;
                v23 = v36;
                goto LABEL_29;
              }
              if ([v8 hasPrefix:@"com.apple.os.update-"]) {
                [(NSMutableArray *)v36 addObject:v21];
              }
            }
            id v18 = [v16 countByEnumeratingWithState:&v37 objects:v44 count:16];
            if (v18) {
              continue;
            }
            break;
          }
        }

        v23 = v36;
        if ([(NSMutableArray *)v36 count])
        {
          id v24 = [(NSMutableArray *)v36 sortedArrayUsingComparator:&__block_literal_global_8];
          id v25 = [v24 lastObject];
          id v8 = [v25 objectForKeyedSubscript:LPAPFSSnapshotPropertyKeyName[0]];
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

        v15 = v35;
      }
      else
      {
        _os_log_pack_size();
        uint64_t v28 = _os_log_pack_fill();
        id v29 = [v12 devNodePath];
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
      id v27 = [v5 devNodePath];
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

int64_t __39__LPMedia_snapshotNameForMediaForPath___block_invoke(id a1, NSDictionary *a2, NSDictionary *a3)
{
  id v4 = LPAPFSSnapshotPropertyKeyXID[0];
  id v5 = a3;
  id v6 = [(NSDictionary *)a2 objectForKeyedSubscript:v4];
  id v7 = [(NSDictionary *)v5 objectForKeyedSubscript:LPAPFSSnapshotPropertyKeyXID[0]];

  id v8 = [v6 compare:v7];
  return (int64_t)v8;
}

+ (id)liveMediaForSnapshotAtPath:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"/"] & 1) == 0)
  {
    id v8 = (__objc2_class *)a1;
LABEL_9:
    id v9 = [(__objc2_class *)v8 mediaForPath:v4];
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
    id v8 = LPMedia;
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
  id v3 = a3;
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(Mutable, @"IOProviderClass", @"IOMedia");
  CFDictionarySetValue(Mutable, @"UUID", v3);

  uint64_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, Mutable);
  if (MatchingService)
  {
    io_object_t v6 = MatchingService;
    id v7 = +[LPMedia mediaOfCorrectTypeGivenIOMedia:MatchingService];
    IOObjectRelease(v6);
  }
  else
  {
    id v7 = 0;
  }
  return v7;
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
        id v5 = [v4 substringFromIndex:5];
      }
      id v6 = v5;
      CFDictionaryRef v7 = IOBSDNameMatching(kIOMasterPortDefault, 0, (const char *)[v6 fileSystemRepresentation]);
      uint64_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v7);
      if (MatchingService)
      {
        io_object_t v9 = MatchingService;
        id v10 = +[LPMedia mediaOfCorrectTypeGivenIOMedia:MatchingService];
        IOObjectRelease(v9);
      }
      else
      {
        id v10 = 0;
      }
    }
    else
    {
      id v10 = 0;
      id v6 = v4;
    }
  }
  else
  {
    id v10 = 0;
    id v6 = 0;
  }

  return v10;
}

- (id)wholeMediaForMedia
{
  if ([(LPMedia *)self isWhole])
  {
    id v3 = self;
  }
  else
  {
    io_iterator_t iterator = 0;
    if (IORegistryEntryCreateIterator([(LPMedia *)self ioMedia], "IOService", 3u, &iterator))
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
      uint64_t v5 = IOIteratorNext(iterator);
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
              id v10 = (LPMedia *)+[LPMedia mediaOfCorrectTypeGivenIOMedia:v6];

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
          uint64_t v6 = IOIteratorNext(iterator);
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
      IOObjectRelease(iterator);
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
  id v3 = [(LPMedia *)self mountPoint];
  if (!v3
    || (bzero(name, 0x40CuLL),
        v7[2] = 0,
        v7[0] = 5,
        v7[1] = 2147491840,
        getattrlist((const char *)[v3 fileSystemRepresentation], v7, name, 0x40CuLL, 0) == -1))
  {
    memset(name, 0, sizeof(name));
    if (IORegistryEntryGetName([(LPMedia *)self ioMedia], name))
    {
      uint64_t v5 = 0;
      goto LABEL_8;
    }
    name[127] = 0;
    uint64_t v4 = name;
  }
  else
  {
    uint64_t v4 = &name[*(int *)&name[4] + 4];
  }
  uint64_t v5 = +[NSString stringWithCString:v4 encoding:4];
LABEL_8:

  return v5;
}

- (BOOL)setName:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  bzero(v22, 0x408uLL);
  id v7 = [(LPMedia *)self mountPoint];
  CFBooleanRef v8 = (const char *)[v7 fileSystemRepresentation];

  if (!v8)
  {
    _os_log_pack_size();
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315138;
    *(void *)(v16 + 4) = "-[LPMedia setName:withError:]";
    _LPLogPack(1);
    if (a4)
    {
      NSErrorDomain v15 = NSPOSIXErrorDomain;
      uint64_t v14 = 22;
      goto LABEL_7;
    }
LABEL_8:
    BOOL v17 = 0;
    goto LABEL_10;
  }
  uint64_t v21 = 0;
  long long v20 = xmmword_10004FF28;
  id v9 = v6;
  [v9 UTF8String];
  __strlcpy_chk();
  v22[0] = 8;
  v22[1] = strlen(v23) + 1;
  int v10 = setattrlist(v8, &v20, v22, 0x408uLL, 0);
  _os_log_pack_size();
  if (!v10)
  {
    uint64_t v18 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v18 = 136315395;
    *(void *)(v18 + 4) = "-[LPMedia setName:withError:]";
    *(_WORD *)(v18 + 12) = 2113;
    *(void *)(v18 + 14) = v9;
    _LPLogPack(3);
    BOOL v17 = 1;
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
  uint64_t v14 = *__error();
  NSErrorDomain v15 = NSPOSIXErrorDomain;
LABEL_7:
  BOOL v17 = 0;
  *a4 = +[NSError errorWithDomain:v15 code:v14 userInfo:0];
LABEL_10:

  return v17;
}

- (id)BSDName
{
  return [(LPMedia *)self getStringPropertyWithName:@"BSD Name"];
}

- (id)devNodePath
{
  id v2 = [(LPMedia *)self BSDName];
  if (v2) {
    id v3 = +[NSString stringWithFormat:@"/dev/%@", v2];
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
      CFBooleanRef v8 = 0;
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
      CFBooleanRef v8 = +[NSString stringWithUTF8String:v7->f_mntonname];
    }
    if (v10) {
      free(v10);
    }
  }
  else
  {
    CFBooleanRef v8 = 0;
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
  while (1)
  {
    unint64_t v4 = (void *)IORegistryEntrySearchCFProperty([(LPMedia *)self ioMedia], "IOService", *(__CFString **)((char *)&off_1000597E8 + v3), kCFAllocatorDefault, 3u);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }

    v3 += 8;
    if (v3 == 32)
    {
      unint64_t v4 = 0;
      break;
    }
  }
  return v4;
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
  id v3 = [v2 objectForKeyedSubscript:@"Physical Interconnect Location"];
  unsigned __int8 v4 = [v3 isEqualToString:@"Internal"];

  return v4;
}

- (BOOL)isEmbeddedDeviceTypeRoot
{
  id v2 = (void *)IORegistryEntrySearchCFProperty([(LPMedia *)self ioMedia], "IOService", @"EmbeddedDeviceTypeRoot", 0, 3u);
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isReadOnly
{
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
    id v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    uint64_t v6 = (NSString *)[(LPMedia *)self name];
    int v7 = +[NSString stringWithFormat:@"%@: %@, Mount: %@", v5, v6, v3];
  }
  else
  {
    id v5 = (NSString *)[(LPMedia *)self mediaUUID];
    CFBooleanRef v8 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v8);
    id v9 = [(LPMedia *)self name];
    int v10 = v9;
    if (v5) {
      uint64_t v11 = +[NSString stringWithFormat:@"%@: %@, UUID: %@", v6, v9, v5];
    }
    else {
      uint64_t v11 = +[NSString stringWithFormat:@"%@: %@", v6, v9, v13];
    }
    int v7 = v11;
  }
  return v7;
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
    id v7 = [v5 objectForKeyedSubscript:v4];
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
  bzero(&v13, 0x878uLL);
  if (statfs((const char *)[a3 fileSystemRepresentation], &v13))
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
    BOOL v8 = +[NSString stringWithUTF8String:v13.f_mntfromname];
    if ([(NSString *)v8 hasPrefix:@"/dev/"])
    {
      id v9 = [(NSString *)v8 substringFromIndex:5];

      BOOL v8 = v9;
    }
    int v10 = v8;
    CFDictionaryRef v11 = IOBSDNameMatching(kIOMasterPortDefault, 0, [(NSString *)v10 UTF8String]);
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v11);
  }
  return MatchingService;
}

+ (unsigned)_copyLiveFilesystemIOMediaForRootedSnapshot
{
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
    id v6 = +[NSString stringWithUTF8String:v14.f_mntfromname];
    id v7 = [(NSString *)v6 componentsSeparatedByString:@"@"];
    if ((id)[(NSArray *)v7 count] == (id)2
      && (id v8 = [(NSArray *)v7 objectAtIndexedSubscript:1],
          unsigned int v9 = [v8 hasPrefix:@"/dev/"],
          v8,
          v9))
    {
      id v10 = [(NSArray *)v7 objectAtIndexedSubscript:1];
      id v11 = [v10 substringFromIndex:5];

      id v6 = (NSString *)v11;
      CFDictionaryRef v12 = IOBSDNameMatching(kIOMasterPortDefault, 0, [(NSString *)v6 UTF8String]);
      io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v12);
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
    dispatch_once(&contentTypeToSubclassMap_once, &__block_literal_global_164);
  }
  int v2 = (void *)contentTypeToSubclassMap_sharedMap;
  return (NSDictionary *)v2;
}

void __44__LPMedia_Private__contentTypeToSubclassMap__block_invoke(id a1)
{
  id v1 = +[NSMutableDictionary dictionary];
  v26[0] = objc_opt_class();
  v26[1] = objc_opt_class();
  v26[2] = objc_opt_class();
  v26[3] = objc_opt_class();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  int v2 = +[NSArray arrayWithObjects:v26 count:4];
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v21;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v6);
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v8 = [v7 supportedContentTypes];
        id v9 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v17;
          do
          {
            CFDictionaryRef v12 = 0;
            do
            {
              if (*(void *)v17 != v11) {
                objc_enumerationMutation(v8);
              }
              [v1 setObject:v7 forKeyedSubscript:*(void *)(*((void *)&v16 + 1) + 8 * (void)v12)];
              CFDictionaryRef v12 = (char *)v12 + 1;
            }
            while (v10 != v12);
            id v10 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }
          while (v10);
        }

        id v6 = (char *)v6 + 1;
      }
      while (v6 != v4);
      id v4 = [(NSArray *)v2 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v4);
  }

  id v13 = [v1 copy];
  statfs v14 = (void *)contentTypeToSubclassMap_sharedMap;
  contentTypeToSubclassMap_sharedMap = (uint64_t)v13;
}

- (id)getPropertyWithName:(id)a3
{
  id v4 = (__CFString *)a3;
  CFBooleanRef CFProperty = (void *)IORegistryEntryCreateCFProperty([(LPMedia *)self ioMedia], v4, 0, 0);
  if (!CFProperty)
  {
    _os_log_pack_size();
    __chkstk_darwin();
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
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

+ (id)mediaOfCorrectTypeGivenIOMedia:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  mach_timespec_t waitTime = (mach_timespec_t)5;
  if (IOServiceWaitQuiet(a3, &waitTime) == -536870186)
  {
    _os_log_pack_size();
    __chkstk_darwin();
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
  id v7 = [[v6 alloc] initWithIOMediaObject:v3];

  return v7;
}

+ (void)waitForIOMediaWithDevNode:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if ([v3 hasPrefix:@"/dev/"])
  {
    id v4 = [v3 substringFromIndex:5];
  }
  id v5 = v4;
  CFDictionaryRef v6 = IOBSDNameMatching(kIOMasterPortDefault, 0, (const char *)[v5 fileSystemRepresentation]);
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v6);
  if (MatchingService)
  {
    io_object_t v8 = MatchingService;
    mach_timespec_t waitTime = (mach_timespec_t)5;
    if (IOServiceWaitQuiet(MatchingService, &waitTime) == -536870186)
    {
      _os_log_pack_size();
      uint64_t v9 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v9 = 138412290;
      *(void *)(v9 + 4) = v5;
      _LPLogPack(1);
    }
    IOObjectRelease(v8);
  }
  else
  {
    _os_log_pack_size();
    uint64_t v10 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v10 = 138412290;
    *(void *)(v10 + 4) = v5;
    _LPLogPack(1);
  }
}

+ (void)waitForBlockStorage
{
  io_iterator_t existing = 0;
  CFDictionaryRef v2 = IOServiceMatching("IOBlockStorageDevice");
  if (!IOServiceGetMatchingServices(kIOMasterPortDefault, v2, &existing))
  {
    unsigned int v3 = 0;
    do
    {
      IOIteratorReset(existing);
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