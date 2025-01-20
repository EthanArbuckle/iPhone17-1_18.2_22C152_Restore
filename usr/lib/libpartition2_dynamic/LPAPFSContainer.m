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
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = LPAPFSContainerMediaTypeUUID[0];
  id v2 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return v2;
}

+ (id)allAPFSContainers
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = +[LPMedia allMedia];
  id v3 = [(id)[MEMORY[0x263EFF980] arrayWithCapacity:[v2 count]];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = (id)[MEMORY[0x263EFF8C0] arrayWithArray:v3];

  return v10;
}

+ (id)diagsContainer
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = +[LPPartitionMedia primaryMedia];
  id v3 = v2;
  if (v2)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = (id)[v2 children];
    id v5 = (id)[v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v4);
          }
          v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v8, "role", (void)v11) == 1)
          {
            id v5 = (id)[v8 container];
            goto LABEL_14;
          }
        }
        id v5 = (id)[v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
  id v18 = (id)[MEMORY[0x263EFF9A0] dictionaryWithCapacity:5];
  v49 = v16;
  if (!v17)
  {
    if (a9) {
      *a9 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
    }
    goto LABEL_12;
  }
  if (!v15)
  {
    if (a9) {
      *a9 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
    }
    goto LABEL_12;
  }
  if ((unint64_t)[v15 length] >= 0x80)
  {
    if (a9) {
      *a9 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
    }
LABEL_12:
    _os_log_pack_size();
    uint64_t v19 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v19 = 136315138;
    *(void *)(v19 + 4) = "-[LPAPFSContainer addVolumeWithName:role:caseSensitive:reserveSize:quotaSize:pairedVolume:error:]";
    _LPLogPack(1);
LABEL_13:
    id v20 = 0;
    goto LABEL_14;
  }
  if (v16)
  {
    id v22 = (id)[v16 BSDName];
    if (a4 != 1)
    {
      id v24 = v22;
      if (a9) {
        *a9 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
      }
      _os_log_pack_size();
      goto LABEL_46;
    }
    v48 = v22;
    if (([v22 hasPrefix:v17] & 1) == 0)
    {
      if (a9) {
        *a9 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
      }
      _os_log_pack_size();
      uint64_t v42 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v42 = 136315138;
      *(void *)(v42 + 4) = "-[LPAPFSContainer addVolumeWithName:role:caseSensitive:reserveSize:quotaSize:pairedVolume:error:]";
      goto LABEL_50;
    }
    uint64_t v23 = 1;
  }
  else
  {
    v48 = 0;
    if ((a4 - 1) > 0xF) {
      uint64_t v23 = 0;
    }
    else {
      uint64_t v23 = word_2104FB688[a4 - 1];
    }
  }
  [v18 setObject:v15 forKey:*MEMORY[0x263F20AF0]];
  id v25 = (id)[NSNumber numberWithUnsignedShort:v23];
  [v18 setObject:v25 forKey:*MEMORY[0x263F20B10]];

  if (MEMORY[0x263F20AF8]) {
    [v18 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F20AF8]];
  }
  if (v12) {
    [v18 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F20AD8]];
  }
  if (a6)
  {
    id v26 = (id)[NSNumber numberWithLongLong:a6];
    [v18 setObject:v26 forKey:*MEMORY[0x263F20B08]];
  }
  if (a7)
  {
    id v27 = (id)[NSNumber numberWithLongLong:a7];
    [v18 setObject:v27 forKey:*MEMORY[0x263F20B00]];
  }
  if (!v48) {
    goto LABEL_39;
  }
  v28 = (void *)MEMORY[0x263F20AE8];
  if (!MEMORY[0x263F20AE8])
  {
    id v24 = v48;
    _os_log_pack_size();
LABEL_46:
    uint64_t v40 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v40 = 136315138;
    *(void *)(v40 + 4) = "-[LPAPFSContainer addVolumeWithName:role:caseSensitive:reserveSize:quotaSize:pairedVolume:error:]";
    _LPLogPack(1);
    v41 = v24;
LABEL_52:

    goto LABEL_13;
  }
  id v29 = (id)[v48 substringFromIndex:4];
  id v30 = (id)[v29 componentsSeparatedByString:@"s"];
  if ((unint64_t)[v30 count] <= 1)
  {
    if (a9) {
      *a9 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
    }
    _os_log_pack_size();
    uint64_t v46 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v46 = 136315138;
    *(void *)(v46 + 4) = "-[LPAPFSContainer addVolumeWithName:role:caseSensitive:reserveSize:quotaSize:pairedVolume:error:]";
    _LPLogPack(1);

    goto LABEL_51;
  }
  v47 = v29;
  id v31 = (id)[v30 objectAtIndex:[v30 count] - 1];
  uint64_t v32 = [v31 intValue];

  id v33 = (id)[NSNumber numberWithInt:v32];
  [v18 setObject:v33 forKey:*v28];

LABEL_39:
  _os_log_pack_size();
  uint64_t v34 = _os_log_pack_fill();
  id v35 = v17;
  uint64_t v36 = [v35 fileSystemRepresentation];
  *(_DWORD *)uint64_t v34 = 136315650;
  *(void *)(v34 + 4) = "-[LPAPFSContainer addVolumeWithName:role:caseSensitive:reserveSize:quotaSize:pairedVolume:error:]";
  *(_WORD *)(v34 + 12) = 2080;
  *(void *)(v34 + 14) = v36;
  *(_WORD *)(v34 + 22) = 2112;
  *(void *)(v34 + 24) = v18;
  _LPLogPack(1);
  if (MEMORY[0x263F20A88] && a4 == 1)
  {
    _os_log_pack_size();
    uint64_t v37 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v37 = 136315138;
    *(void *)(v37 + 4) = "-[LPAPFSContainer addVolumeWithName:role:caseSensitive:reserveSize:quotaSize:pairedVolume:error:]";
    _LPLogPack(1);
    [v35 fileSystemRepresentation];
    int v38 = APFSVolumeCreateForMSU();
    if (v38)
    {
LABEL_42:
      if (a9) {
        *a9 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:v38 userInfo:0];
      }
      _os_log_pack_size();
      uint64_t v39 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v39 = 136315394;
      *(void *)(v39 + 4) = "-[LPAPFSContainer addVolumeWithName:role:caseSensitive:reserveSize:quotaSize:pairedVolume:error:]";
      *(_WORD *)(v39 + 12) = 1024;
      *(_DWORD *)(v39 + 14) = v38;
LABEL_50:
      _LPLogPack(1);
LABEL_51:
      v41 = v48;
      goto LABEL_52;
    }
  }
  else
  {
    [v35 fileSystemRepresentation];
    int v38 = APFSVolumeCreate();
    if (v38) {
      goto LABEL_42;
    }
  }
  id v43 = (id)[v18 objectForKey:*MEMORY[0x263F20AE0]];
  id v44 = (id)[NSString stringWithFormat:@"%@s%d", v35, [v43 intValue] + 1];
  id v45 = [(LPMedia *)self BSDName];
  +[LPMedia waitForIOMediaWithDevNode:v45];

  id v20 = +[LPMedia mediaForBSDNameOrDeviceNode:v44];
LABEL_14:

  return v20;
}

- (id)volumes
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [(LPMedia *)self BSDName];
  +[LPMedia waitForIOMediaWithDevNode:v3];

  io_object_t v15 = 0;
  if (MEMORY[0x210570C50]([(LPMedia *)self ioMedia], "IOService", 1, &v15))
  {
    _os_log_pack_size();
    *(_WORD *)_os_log_pack_fill() = 0;
    _LPLogPack(1);
    id v4 = (id)MEMORY[0x263EFFA68];
  }
  else
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x3032000000;
    BOOL v12 = __Block_byref_object_copy_;
    long long v13 = __Block_byref_object_dispose_;
    id v14 = 0;
    id v14 = (id)[MEMORY[0x263EFF980] arrayWithCapacity:8];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3254779904;
    v7[2] = __26__LPAPFSContainer_volumes__block_invoke;
    v7[3] = &__block_descriptor_44_e8_32r_e8_v12__0I8l;
    io_object_t v8 = v15;
    v7[4] = &v9;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3254779904;
    v6[2] = __26__LPAPFSContainer_volumes__block_invoke_20;
    v6[3] = &__block_descriptor_40_e8_32r_e5_v8__0l;
    v6[4] = &v9;
    iterateSafely(v15, 3, v7, v6);
    IOObjectRelease(v15);
    id v4 = (id)[MEMORY[0x263EFF8C0] arrayWithArray:v10[5]];
    _Block_object_dispose(&v9, 8);
  }

  return v4;
}

void __26__LPAPFSContainer_volumes__block_invoke(uint64_t a1, uint64_t object)
{
  if (IOObjectConformsTo(object, "IOMedia"))
  {
    MEMORY[0x210570C90](*(unsigned int *)(a1 + 40));
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

uint64_t __26__LPAPFSContainer_volumes__block_invoke_20(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) removeAllObjects];
}

- (id)physicalStores
{
  v27[1] = *MEMORY[0x263EF8340];
  id v3 = [(LPMedia *)self BSDName];
  +[LPMedia waitForIOMediaWithDevNode:v3];

  id v23 = (id)[MEMORY[0x263EFF980] arrayWithCapacity:2];
  id v4 = [(LPMedia *)self mediaUUID];
  if (v4)
  {
    io_iterator_t existing = 0;
    id v5 = (id)[MEMORY[0x263EFF9A0] dictionaryWithCapacity:5];
    id v26 = @"Content";
    v27[0] = LPAPFSPhysicalStoreMediaUUID[0];
    id v6 = (id)[NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
    [v5 setObject:v6 forKey:@"IOPropertyMatch"];

    CFDictionaryRef v7 = (const __CFDictionary *)v5;
    if (IOServiceGetMatchingServices(*MEMORY[0x263F0EC90], v7, &existing))
    {
      _os_log_pack_size();
      MEMORY[0x270FA5388]();
      uint64_t v8 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v8 = 136315138;
      *(void *)(v8 + 4) = "-[LPAPFSContainer physicalStores]";
      _LPLogPack(1);
      id v9 = 0;
    }
    else
    {
      uint64_t v11 = IOIteratorNext(existing);
      if (v11)
      {
        uint64_t v12 = v11;
        do
        {
          io_iterator_t v24 = 0;
          if (!MEMORY[0x210570C50](v12, "IOService", 1, &v24))
          {
            io_object_t v13 = IOIteratorNext(v24);
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
                      uint64_t v19 = [(LPMedia *)[LPAPFSPhysicalStore alloc] initWithIOMediaObject:v12];
                      if (v19) {
                        [v23 addObject:v19];
                      }
                    }
                    CFRelease(v17);
                  }
                }
                IOObjectRelease(v14);
                io_object_t v14 = IOIteratorNext(v24);
                if (v14) {
                  BOOL v20 = v15 == 0;
                }
                else {
                  BOOL v20 = 0;
                }
              }
              while (v20);
            }
            IOObjectRelease(v24);
          }
          IOObjectRelease(v12);
          uint64_t v12 = IOIteratorNext(existing);
        }
        while (v12);
      }
      if (existing) {
        IOObjectRelease(existing);
      }
      id v9 = (id)[MEMORY[0x263EFF8C0] arrayWithArray:v23, v7];
      CFDictionaryRef v7 = v22;
    }
  }
  else
  {
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    uint64_t v10 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = "-[LPAPFSContainer physicalStores]";
    _LPLogPack(1);
    id v9 = 0;
  }

  return v9;
}

- (id)volumesWithRole:(int)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = [(LPAPFSContainer *)self volumes];
  id v5 = [(id)[MEMORY[0x263EFF980] arrayWithCapacity:[v4 count]];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "role", (void)v14) == a3) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v12 = (id)[MEMORY[0x263EFF8C0] arrayWithArray:v5];

  return v12;
}

- (id)prebootVolume
{
  id v2 = [(LPAPFSContainer *)self volumesWithRole:6];
  if ([v2 count] == 1)
  {
    id v3 = (id)[v2 objectAtIndex:0];
  }
  else
  {
    if ((unint64_t)[v2 count] >= 2)
    {
      _os_log_pack_size();
      uint64_t v4 = _os_log_pack_fill();
      id v5 = (id)[v2 description];
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
  if ([v2 count] == 1)
  {
    id v3 = (id)[v2 objectAtIndex:0];
  }
  else
  {
    if ((unint64_t)[v2 count] >= 2)
    {
      _os_log_pack_size();
      uint64_t v4 = _os_log_pack_fill();
      id v5 = (id)[v2 description];
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
  if ([v2 count] == 1)
  {
    id v3 = (id)[v2 objectAtIndex:0];
  }
  else
  {
    if ((unint64_t)[v2 count] >= 2)
    {
      _os_log_pack_size();
      uint64_t v4 = _os_log_pack_fill();
      id v5 = (id)[v2 description];
      *(_DWORD *)uint64_t v4 = 138477827;
      *(void *)(v4 + 4) = v5;
      _LPLogPack(1);
    }
    id v3 = 0;
  }

  return v3;
}

@end