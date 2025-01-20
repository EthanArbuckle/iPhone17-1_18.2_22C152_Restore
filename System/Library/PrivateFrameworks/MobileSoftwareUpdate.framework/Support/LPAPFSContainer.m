@interface LPAPFSContainer
+ (id)allAPFSContainers;
+ (id)diagsContainer;
+ (id)supportedContentTypes;
- (id)addVolumeWithName:(id)a3 role:(int)a4 caseSensitive:(BOOL)a5 reserveSize:(int64_t)a6 quotaSize:(int64_t)a7 pairedVolume:(id)a8 error:(id *)a9;
- (id)physicalStores;
- (id)prebootVolume;
- (id)recoveryVolume;
- (id)updateVolume;
- (id)volumes;
- (id)volumesWithRole:(int)a3;
@end

@implementation LPAPFSContainer

+ (id)supportedContentTypes
{
  v4 = LPAPFSContainerMediaTypeUUID[0];
  v2 = +[NSArray arrayWithObjects:&v4 count:1];
  return v2;
}

+ (id)allAPFSContainers
{
  id v2 = +[LPMedia allMedia];
  v3 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v2 count]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          -[NSMutableArray addObject:](v3, "addObject:", v9, (void)v12);
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  v10 = +[NSArray arrayWithArray:v3];
  return v10;
}

+ (id)diagsContainer
{
  id v2 = +[LPPartitionMedia primaryMedia];
  v3 = v2;
  if (v2)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = [v2 children];
    id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v12;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v4);
          }
          v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v8, "role", (void)v11) == 1)
          {
            id v5 = [v8 container];
            goto LABEL_14;
          }
        }
        id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    _os_log_pack_size();
    uint64_t v9 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v9 = 136315138;
    *(void *)(v9 + 4) = "+[LPAPFSContainer diagsContainer]";
    _LPLogPack(1);
    id v5 = 0;
  }

  return v5;
}

- (id)addVolumeWithName:(id)a3 role:(int)a4 caseSensitive:(BOOL)a5 reserveSize:(int64_t)a6 quotaSize:(int64_t)a7 pairedVolume:(id)a8 error:(id *)a9
{
  BOOL v12 = a5;
  id v15 = a3;
  id v16 = a8;
  id v17 = [(LPMedia *)self BSDName];
  v51 = +[NSMutableDictionary dictionaryWithCapacity:5];
  if (!v17)
  {
    if (a9) {
      *a9 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
    }
    goto LABEL_12;
  }
  if (!v15)
  {
    if (a9) {
      *a9 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
    }
    goto LABEL_12;
  }
  if ((unint64_t)[v15 length] >= 0x80)
  {
    if (a9) {
      *a9 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
    }
LABEL_12:
    _os_log_pack_size();
    uint64_t v18 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v18 = 136315138;
    *(void *)(v18 + 4) = "-[LPAPFSContainer addVolumeWithName:role:caseSensitive:reserveSize:quotaSize:pairedVolume:error:]";
    _LPLogPack(1);
LABEL_13:
    id v19 = 0;
    goto LABEL_14;
  }
  if (v16)
  {
    id v21 = [v16 BSDName];
    if (a4 != 1)
    {
      id v23 = v21;
      if (a9) {
        *a9 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
      }
      _os_log_pack_size();
      uint64_t v24 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v24 = 136315138;
      *(void *)(v24 + 4) = "-[LPAPFSContainer addVolumeWithName:role:caseSensitive:reserveSize:quotaSize:pairedVolume:error:]";
      _LPLogPack(1);
      v25 = v23;
      goto LABEL_53;
    }
    v50 = v21;
    if (([v21 hasPrefix:v17] & 1) == 0)
    {
      if (a9) {
        *a9 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
      }
      _os_log_pack_size();
      uint64_t v42 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v42 = 136315138;
      *(void *)(v42 + 4) = "-[LPAPFSContainer addVolumeWithName:role:caseSensitive:reserveSize:quotaSize:pairedVolume:error:]";
      goto LABEL_51;
    }
    uint64_t v22 = 1;
  }
  else
  {
    v50 = 0;
    if ((a4 - 1) > 0xF) {
      uint64_t v22 = 0;
    }
    else {
      uint64_t v22 = word_100040FE8[a4 - 1];
    }
  }
  [(NSMutableDictionary *)v51 setObject:v15 forKey:kAPFSVolumeNameKey];
  v26 = +[NSNumber numberWithUnsignedShort:v22];
  [(NSMutableDictionary *)v51 setObject:v26 forKey:kAPFSVolumeRoleKey];

  if (&kAPFSVolumeNoAutomountAtCreateKey)
  {
    v27 = +[NSNumber numberWithBool:1];
    [(NSMutableDictionary *)v51 setObject:v27 forKey:kAPFSVolumeNoAutomountAtCreateKey];
  }
  if (v12)
  {
    v28 = +[NSNumber numberWithBool:1];
    [(NSMutableDictionary *)v51 setObject:v28 forKey:kAPFSVolumeCaseSensitiveKey];
  }
  if (a6)
  {
    v29 = +[NSNumber numberWithLongLong:a6];
    [(NSMutableDictionary *)v51 setObject:v29 forKey:kAPFSVolumeReserveSizeKey];
  }
  if (a7)
  {
    v30 = +[NSNumber numberWithLongLong:a7];
    [(NSMutableDictionary *)v51 setObject:v30 forKey:kAPFSVolumeQuotaSizeKey];
  }
  if (v50)
  {
    if (!&kAPFSVolumeGroupSiblingFSIndexKey)
    {
      _os_log_pack_size();
      uint64_t v41 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v41 = 136315138;
      *(void *)(v41 + 4) = "-[LPAPFSContainer addVolumeWithName:role:caseSensitive:reserveSize:quotaSize:pairedVolume:error:]";
      _LPLogPack(1);
      v25 = v50;
LABEL_53:

      goto LABEL_13;
    }
    id v31 = [v50 substringFromIndex:4];
    id v32 = [v31 componentsSeparatedByString:@"s"];
    if ((unint64_t)[v32 count] <= 1)
    {
      if (a9) {
        *a9 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
      }
      _os_log_pack_size();
      uint64_t v48 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v48 = 136315138;
      *(void *)(v48 + 4) = "-[LPAPFSContainer addVolumeWithName:role:caseSensitive:reserveSize:quotaSize:pairedVolume:error:]";
      _LPLogPack(1);

      goto LABEL_52;
    }
    id v33 = objc_msgSend(v32, "objectAtIndex:", (char *)objc_msgSend(v32, "count") - 1);
    v49 = v31;
    id v34 = [v33 intValue];

    v35 = +[NSNumber numberWithInt:v34];
    [(NSMutableDictionary *)v51 setObject:v35 forKey:kAPFSVolumeGroupSiblingFSIndexKey];
  }
  _os_log_pack_size();
  uint64_t v36 = _os_log_pack_fill();
  id v37 = v17;
  id v38 = [v37 fileSystemRepresentation];
  *(_DWORD *)uint64_t v36 = 136315650;
  *(void *)(v36 + 4) = "-[LPAPFSContainer addVolumeWithName:role:caseSensitive:reserveSize:quotaSize:pairedVolume:error:]";
  *(_WORD *)(v36 + 12) = 2080;
  *(void *)(v36 + 14) = v38;
  *(_WORD *)(v36 + 22) = 2112;
  *(void *)(v36 + 24) = v51;
  _LPLogPack(1);
  if (&_APFSVolumeCreateForMSU && a4 == 1)
  {
    _os_log_pack_size();
    uint64_t v39 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v39 = 136315138;
    *(void *)(v39 + 4) = "-[LPAPFSContainer addVolumeWithName:role:caseSensitive:reserveSize:quotaSize:pairedVolume:error:]";
    _LPLogPack(1);
    [v37 fileSystemRepresentation];
    int v40 = APFSVolumeCreateForMSU();
  }
  else
  {
    [v37 fileSystemRepresentation];
    int v40 = APFSVolumeCreate();
  }
  int v43 = v40;
  if (v40)
  {
    if (a9) {
      *a9 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v40 userInfo:0];
    }
    _os_log_pack_size();
    uint64_t v44 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v44 = 136315394;
    *(void *)(v44 + 4) = "-[LPAPFSContainer addVolumeWithName:role:caseSensitive:reserveSize:quotaSize:pairedVolume:error:]";
    *(_WORD *)(v44 + 12) = 1024;
    *(_DWORD *)(v44 + 14) = v43;
LABEL_51:
    _LPLogPack(1);
LABEL_52:
    v25 = v50;
    goto LABEL_53;
  }
  id v45 = [(NSMutableDictionary *)v51 objectForKey:kAPFSVolumeFSIndexKey];
  v46 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@s%d", v37, [v45 intValue] + 1);
  id v47 = [(LPMedia *)self BSDName];
  +[LPMedia waitForIOMediaWithDevNode:v47];

  id v19 = +[LPMedia mediaForBSDNameOrDeviceNode:v46];
LABEL_14:

  return v19;
}

- (id)volumes
{
  id v3 = [(LPMedia *)self BSDName];
  +[LPMedia waitForIOMediaWithDevNode:v3];

  io_iterator_t iterator = 0;
  if (IORegistryEntryCreateIterator([(LPMedia *)self ioMedia], "IOService", 1u, &iterator))
  {
    _os_log_pack_size();
    *(_WORD *)_os_log_pack_fill() = 0;
    _LPLogPack(1);
    id v4 = (NSArray *)__NSArray0__;
  }
  else
  {
    uint64_t v9 = 0;
    v10 = &v9;
    uint64_t v11 = 0x3032000000;
    BOOL v12 = __Block_byref_object_copy__8;
    long long v13 = __Block_byref_object_dispose__8;
    long long v14 = 0;
    long long v14 = +[NSMutableArray arrayWithCapacity:8];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3254779904;
    v7[2] = __26__LPAPFSContainer_volumes__block_invoke;
    v7[3] = &__block_descriptor_44_e8_32r_e8_v12__0I8l;
    io_iterator_t v8 = iterator;
    v7[4] = &v9;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3254779904;
    v6[2] = __26__LPAPFSContainer_volumes__block_invoke_20;
    v6[3] = &__block_descriptor_40_e8_32r_e5_v8__0l;
    v6[4] = &v9;
    iterateSafely(iterator, 3, v7, v6);
    IOObjectRelease(iterator);
    id v4 = +[NSArray arrayWithArray:v10[5]];
    _Block_object_dispose(&v9, 8);
  }
  return v4;
}

void __26__LPAPFSContainer_volumes__block_invoke(uint64_t a1, uint64_t object)
{
  if (IOObjectConformsTo(object, "IOMedia"))
  {
    IORegistryIteratorExitEntry(*(_DWORD *)(a1 + 40));
    CFStringRef CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(object, @"Content", 0, 0);
    if (CFProperty)
    {
      CFStringRef v5 = CFProperty;
      CFTypeID v6 = CFGetTypeID(CFProperty);
      if (v6 == CFStringGetTypeID() && CFEqual(v5, LPAPFSVolumeMediaTypeUUID[0]))
      {
        uint64_t v7 = [(LPMedia *)[LPAPFSVolume alloc] initWithIOMediaObject:object];
        if (v7) {
          [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v7];
        }
      }
      CFRelease(v5);
    }
  }
}

id __26__LPAPFSContainer_volumes__block_invoke_20(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) removeAllObjects];
}

- (id)physicalStores
{
  id v3 = [(LPMedia *)self BSDName];
  +[LPMedia waitForIOMediaWithDevNode:v3];

  id v23 = +[NSMutableArray arrayWithCapacity:2];
  id v4 = [(LPMedia *)self mediaUUID];
  if (v4)
  {
    io_iterator_t existing = 0;
    CFStringRef v5 = +[NSMutableDictionary dictionaryWithCapacity:5];
    CFStringRef v26 = @"Content";
    v27 = LPAPFSPhysicalStoreMediaUUID[0];
    CFTypeID v6 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    [(NSMutableDictionary *)v5 setObject:v6 forKey:@"IOPropertyMatch"];

    CFDictionaryRef v7 = v5;
    if (IOServiceGetMatchingServices(kIOMasterPortDefault, v7, &existing))
    {
      _os_log_pack_size();
      __chkstk_darwin();
      uint64_t v8 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v8 = 136315138;
      *(void *)(v8 + 4) = "-[LPAPFSContainer physicalStores]";
      _LPLogPack(1);
      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v11 = IOIteratorNext(existing);
      if (v11)
      {
        uint64_t v12 = v11;
        do
        {
          io_iterator_t iterator = 0;
          if (!IORegistryEntryCreateIterator(v12, "IOService", 1u, &iterator))
          {
            io_object_t v13 = IOIteratorNext(iterator);
            if (v13)
            {
              io_object_t v14 = v13;
              do
              {
                BOOLean_t v15 = IOObjectConformsTo(v14, "IOMedia");
                if (v15)
                {
                  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v14, @"UUID", 0, 0);
                  if (CFProperty)
                  {
                    id v17 = CFProperty;
                    CFTypeID v18 = CFGetTypeID(CFProperty);
                    if (v18 == CFStringGetTypeID() && CFEqual(v17, v4))
                    {
                      id v19 = [(LPMedia *)[LPAPFSPhysicalStore alloc] initWithIOMediaObject:v12];
                      if (v19) {
                        [(NSMutableArray *)v23 addObject:v19];
                      }
                    }
                    CFRelease(v17);
                  }
                }
                IOObjectRelease(v14);
                io_object_t v14 = IOIteratorNext(iterator);
                if (v14) {
                  BOOL v20 = v15 == 0;
                }
                else {
                  BOOL v20 = 0;
                }
              }
              while (v20);
            }
            IOObjectRelease(iterator);
          }
          IOObjectRelease(v12);
          uint64_t v12 = IOIteratorNext(existing);
        }
        while (v12);
      }
      if (existing) {
        IOObjectRelease(existing);
      }
      uint64_t v9 = +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v23, v7);
      CFDictionaryRef v7 = v22;
    }
  }
  else
  {
    _os_log_pack_size();
    __chkstk_darwin();
    uint64_t v10 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = "-[LPAPFSContainer physicalStores]";
    _LPLogPack(1);
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)volumesWithRole:(int)a3
{
  id v4 = [(LPAPFSContainer *)self volumes];
  CFStringRef v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "role", (void)v14) == a3) {
          [(NSMutableArray *)v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  uint64_t v12 = +[NSArray arrayWithArray:v5];
  return v12;
}

- (id)prebootVolume
{
  id v2 = [(LPAPFSContainer *)self volumesWithRole:6];
  if ([v2 count] == (id)1)
  {
    id v3 = [v2 objectAtIndex:0];
  }
  else
  {
    if ((unint64_t)[v2 count] >= 2)
    {
      _os_log_pack_size();
      uint64_t v4 = _os_log_pack_fill();
      id v5 = [v2 description];
      *(_DWORD *)uint64_t v4 = 138477827;
      *(void *)(v4 + 4) = v5;
      _LPLogPack(1);
    }
    id v3 = 0;
  }

  return v3;
}

- (id)recoveryVolume
{
  id v2 = [(LPAPFSContainer *)self volumesWithRole:4];
  if ([v2 count] == (id)1)
  {
    id v3 = [v2 objectAtIndex:0];
  }
  else
  {
    if ((unint64_t)[v2 count] >= 2)
    {
      _os_log_pack_size();
      uint64_t v4 = _os_log_pack_fill();
      id v5 = [v2 description];
      *(_DWORD *)uint64_t v4 = 138477827;
      *(void *)(v4 + 4) = v5;
      _LPLogPack(1);
    }
    id v3 = 0;
  }

  return v3;
}

- (id)updateVolume
{
  id v2 = [(LPAPFSContainer *)self volumesWithRole:12];
  if ([v2 count] == (id)1)
  {
    id v3 = [v2 objectAtIndex:0];
  }
  else
  {
    if ((unint64_t)[v2 count] >= 2)
    {
      _os_log_pack_size();
      uint64_t v4 = _os_log_pack_fill();
      id v5 = [v2 description];
      *(_DWORD *)uint64_t v4 = 138477827;
      *(void *)(v4 + 4) = v5;
      _LPLogPack(1);
    }
    id v3 = 0;
  }

  return v3;
}

@end