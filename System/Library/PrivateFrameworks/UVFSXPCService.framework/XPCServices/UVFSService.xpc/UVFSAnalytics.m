@interface UVFSAnalytics
+ (unsigned)getPartitionsParent:(unsigned int)a3;
- (NSMutableArray)partitions;
- (UVFSAnalytics)init;
- (UVFSDiskAnalytics)disk;
- (UVFSVolumeAnalytics)volume;
- (void)addVolumeProperties:(id)a3 volumeCount:(int)a4 isDCIM:(BOOL)a5 loadStatus:(int)a6 loadErrorReason:(id)a7;
- (void)discoverDiskProperties:(unsigned int)a3;
- (void)discoverPartitions:(unsigned int)a3;
- (void)discoverTopology:(id)a3;
- (void)logTopology;
- (void)sendEvent;
- (void)setDisk:(id)a3;
- (void)setPartitions:(id)a3;
- (void)setVolume:(id)a3;
@end

@implementation UVFSAnalytics

- (UVFSAnalytics)init
{
  v7.receiver = self;
  v7.super_class = (Class)UVFSAnalytics;
  v2 = [(UVFSAnalytics *)&v7 init];
  if (v2)
  {
    v3 = objc_alloc_init(UVFSDiskAnalytics);
    [(UVFSAnalytics *)v2 setDisk:v3];

    v4 = objc_alloc_init(UVFSVolumeAnalytics);
    [(UVFSAnalytics *)v2 setVolume:v4];

    v5 = +[NSMutableArray array];
    [(UVFSAnalytics *)v2 setPartitions:v5];
  }
  return v2;
}

- (void)logTopology
{
  v3 = [(UVFSAnalytics *)self volume];
  unsigned int v4 = [v3 volumeLoadStatus];
  if (v4 > 3) {
    CFStringRef v5 = @"Unknown";
  }
  else {
    CFStringRef v5 = off_1000386B0[v4];
  }
  CFStringRef v37 = v5;

  v36 = [(UVFSAnalytics *)self volume];
  v32 = [v36 fsTypeName];
  v35 = [(UVFSAnalytics *)self volume];
  id v30 = [v35 volumeCount];
  v34 = [(UVFSAnalytics *)self volume];
  unsigned int v29 = [v34 isDCIM];
  v33 = [(UVFSAnalytics *)self volume];
  v28 = [v33 volumeLoadErrorReason];
  v31 = [(UVFSAnalytics *)self disk];
  v6 = [v31 diskType];
  objc_super v7 = [(UVFSAnalytics *)self disk];
  id v8 = [v7 diskSize];
  v9 = [(UVFSAnalytics *)self disk];
  id v10 = [v9 diskBlockSize];
  v11 = [(UVFSAnalytics *)self disk];
  v12 = [v11 partitionTableType];
  v13 = [(UVFSAnalytics *)self partitions];
  v38 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Volume analytics of %@:\n  Count: %d\n  isDcim: %d\n  LoadStatus: %@\n  LoadErrorReason: %@\n  Disk analytics:\n    Type: %@\n    Size: %lu\n    BlockSize: %lu\n    Partition Table Type: %@\n    Partitions (%lu):\n", v32, v30, v29, v37, v28, v6, v8, v10, v12, [v13 count]);

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v14 = [(UVFSAnalytics *)self partitions];
  id v15 = [v14 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v40;
    v18 = &stru_100038E98;
    do
    {
      v19 = 0;
      v20 = v18;
      do
      {
        if (*(void *)v40 != v17) {
          objc_enumerationMutation(v14);
        }
        v21 = *(void **)(*((void *)&v39 + 1) + 8 * (void)v19);
        id v22 = [(__CFString *)v20 length];
        uint64_t v23 = [v21 getLogPartition];
        v24 = (void *)v23;
        if (v22) {
          +[NSString stringWithFormat:@"%@\n%@", v20, v23];
        }
        else {
        v18 = +[NSString stringWithFormat:@"%@", v23, v27];
        }

        v19 = (char *)v19 + 1;
        v20 = v18;
      }
      while (v16 != v19);
      id v16 = [v14 countByEnumeratingWithState:&v39 objects:v47 count:16];
    }
    while (v16);
  }
  else
  {
    v18 = &stru_100038E98;
  }

  v25 = +[NSString stringWithFormat:@"%@%@", v38, v18];

  v26 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v44 = "-[UVFSAnalytics logTopology]";
    __int16 v45 = 2112;
    v46 = v25;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
  }
}

- (void)sendEvent
{
  v3 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v53 = "-[UVFSAnalytics sendEvent]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s:start", buf, 0xCu);
  }
  id v4 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:10];
  CFStringRef v5 = [(UVFSAnalytics *)self volume];
  v6 = [v5 fsTypeName];
  [v4 setValue:v6 forKey:@"FSTypeName"];

  objc_super v7 = [(UVFSAnalytics *)self volume];
  id v8 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v7 volumeCount]);
  [v4 setValue:v8 forKey:@"VolumeCount"];

  v9 = [(UVFSAnalytics *)self volume];
  id v10 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v9 isDCIM]);
  [v4 setValue:v10 forKey:@"isDCIM"];

  v11 = [(UVFSAnalytics *)self volume];
  unsigned int v12 = [v11 volumeLoadStatus];
  if (v12 > 3) {
    CFStringRef v13 = @"Unknown";
  }
  else {
    CFStringRef v13 = off_1000386B0[v12];
  }

  [v4 setValue:v13 forKey:@"LoadStatus"];
  v14 = [(UVFSAnalytics *)self volume];
  id v15 = [v14 volumeLoadErrorReason];
  [v4 setValue:v15 forKey:@"LoadErrorReason"];

  id v16 = [(UVFSAnalytics *)self disk];
  uint64_t v17 = [v16 diskType];
  [v4 setValue:v17 forKey:@"DiskType"];

  v18 = [(UVFSAnalytics *)self disk];
  v19 = [v18 partitionTableType];
  [v4 setValue:v19 forKey:@"PartitionTableType"];

  v20 = [(UVFSAnalytics *)self disk];
  id v21 = [v20 diskSize];

  if (v21)
  {
    id v22 = [(UVFSAnalytics *)self disk];
    uint64_t v23 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v22 diskSize]);
    [v4 setValue:v23 forKey:@"DiskSize"];
  }
  v24 = [(UVFSAnalytics *)self disk];
  id v25 = [v24 diskBlockSize];

  if (v25)
  {
    v26 = [(UVFSAnalytics *)self disk];
    uint64_t v27 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v26 diskBlockSize]);
    [v4 setValue:v27 forKey:@"BlockSize"];
  }
  v46 = v4;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = [(UVFSAnalytics *)self partitions];
  id v28 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v28)
  {
    id v29 = v28;
    id v30 = &stru_100038E98;
    uint64_t v31 = *(void *)v49;
    v32 = &stru_100038E98;
    do
    {
      v33 = 0;
      v34 = v30;
      v35 = v32;
      do
      {
        if (*(void *)v49 != v31) {
          objc_enumerationMutation(obj);
        }
        v36 = *(void **)(*((void *)&v48 + 1) + 8 * (void)v33);
        id v37 = [(__CFString *)v35 length];
        uint64_t v38 = [v36 partitionType];
        long long v39 = (void *)v38;
        if (v37) {
          +[NSString stringWithFormat:@"%@, %@", v35, v38];
        }
        else {
        v32 = +[NSString stringWithFormat:@"%@", v38, v45];
        }

        id v40 = [(__CFString *)v34 length];
        id v41 = [v36 partitionSize];
        if (v40)
        {
          id v45 = v41;
          +[NSString stringWithFormat:@"%@, %lu", v34];
        }
        else
        {
          +[NSString stringWithFormat:@"%lu", v41];
        }
        id v30 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v33 = (char *)v33 + 1;
        v34 = v30;
        v35 = v32;
      }
      while (v29 != v33);
      id v29 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
    }
    while (v29);
  }
  else
  {
    id v30 = &stru_100038E98;
    v32 = &stru_100038E98;
  }

  if ([(__CFString *)v32 length]) {
    [v46 setValue:v32 forKey:@"Partitions"];
  }
  if ([(__CFString *)v30 length]) {
    [v46 setValue:v30 forKey:@"PartitionSizes"];
  }
  long long v42 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v53 = "-[UVFSAnalytics sendEvent]";
    __int16 v54 = 2112;
    v55 = v46;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%s: Sending the following dictionary to CoreAnalytics: %@", buf, 0x16u);
  }
  id v43 = v46;
  AnalyticsSendEventLazy();
  v44 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v53 = "-[UVFSAnalytics sendEvent]";
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%s:finish", buf, 0xCu);
  }
}

+ (unsigned)getPartitionsParent:(unsigned int)a3
{
  kern_return_t CFProperties;
  const void *Value;
  io_object_t v8;
  BOOL v9;
  NSObject *v10;
  io_registry_entry_t parent;
  unsigned char buf[24];

  id v4 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "+[UVFSAnalytics getPartitionsParent:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s:start", buf, 0xCu);
  }
  parent = 0;
  BOOL v5 = 0;
  if (!IORegistryEntryGetParentEntry(a3, "IOService", &parent))
  {
    do
    {
      *(void *)buf = 0;
      CFProperties = IORegistryEntryCreateCFProperties(parent, (CFMutableDictionaryRef *)buf, 0, 0);
      Value = CFDictionaryGetValue(*(CFDictionaryRef *)buf, @"Content Mask");
      BOOL v5 = Value != 0;
      if (!Value)
      {
        id v8 = parent;
        CFProperties = IORegistryEntryGetParentEntry(parent, "IOService", &parent);
        if (v8) {
          IOObjectRelease(v8);
        }
      }
      CFRelease(*(CFTypeRef *)buf);
      if (CFProperties) {
        v9 = 0;
      }
      else {
        v9 = Value == 0;
      }
    }
    while (v9);
  }
  id v10 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "+[UVFSAnalytics getPartitionsParent:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s:finish", buf, 0xCu);
  }
  if (v5) {
    return parent;
  }
  else {
    return 0;
  }
}

- (void)discoverTopology:(id)a3
{
  id v4 = a3;
  BOOL v5 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    CFStringRef v13 = "-[UVFSAnalytics discoverTopology:]";
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s:start:bsdName:%@", buf, 0x16u);
  }
  io_iterator_t existing = 0;
  id v6 = v4;
  CFDictionaryRef v7 = IOBSDNameMatching(kIOMainPortDefault, 0, (const char *)[v6 UTF8String]);
  if (IOServiceGetMatchingServices(kIOMainPortDefault, v7, &existing))
  {
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100022180();
    }
  }
  else if (existing)
  {
    uint64_t v8 = IOIteratorNext(existing);
    if (v8)
    {
      uint64_t v9 = v8;
      [(UVFSAnalytics *)self discoverPartitions:v8];
      [(UVFSAnalytics *)self discoverDiskProperties:v9];
      IOObjectRelease(v9);
    }
    else if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10002210C();
    }
    IOObjectRelease(existing);
  }
  else if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100022098();
  }
  id v10 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    CFStringRef v13 = "-[UVFSAnalytics discoverTopology:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s:finish", buf, 0xCu);
  }
}

- (void)addVolumeProperties:(id)a3 volumeCount:(int)a4 isDCIM:(BOOL)a5 loadStatus:(int)a6 loadErrorReason:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  BOOL v9 = a5;
  uint64_t v10 = *(void *)&a4;
  id v12 = a3;
  id v13 = a7;
  __int16 v14 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 136315138;
    id v21 = "-[UVFSAnalytics addVolumeProperties:volumeCount:isDCIM:loadStatus:loadErrorReason:]";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s:start", (uint8_t *)&v20, 0xCu);
  }
  id v15 = [(UVFSAnalytics *)self volume];
  [v15 setFsTypeName:v12];

  id v16 = [(UVFSAnalytics *)self volume];
  [v16 setVolumeCount:v10];

  uint64_t v17 = [(UVFSAnalytics *)self volume];
  [v17 setIsDCIM:v9];

  v18 = [(UVFSAnalytics *)self volume];
  [v18 setVolumeLoadStatus:v8];

  v19 = [(UVFSAnalytics *)self volume];
  [v19 setVolumeLoadErrorReason:v13];
}

- (void)discoverPartitions:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  BOOL v5 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v45 = "-[UVFSAnalytics discoverPartitions:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s:start", buf, 0xCu);
  }
  io_registry_entry_t v6 = +[UVFSAnalytics getPartitionsParent:v3];
  if (v6)
  {
    io_object_t v7 = v6;
    io_iterator_t iterator = 0;
    if (IORegistryEntryGetChildIterator(v6, "IOService", &iterator))
    {
      uint64_t v8 = userfs_log_default;
      if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100022338(v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
    else
    {
      for (io_object_t i = IOIteratorNext(iterator); i; io_object_t i = IOIteratorNext(iterator))
      {
        *(void *)properties = 0;
        if (IORegistryEntryCreateCFProperties(i, (CFMutableDictionaryRef *)properties, 0, 0))
        {
          id v25 = userfs_log_default;
          if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
            sub_1000222F4(v40, &v41, v25);
          }
        }
        else
        {
          v26 = objc_alloc_init(UVFSPartitionAnalytics);
          Value = CFDictionaryGetValue(*(CFDictionaryRef *)properties, @"Content Hint");
          if (Value)
          {
            id v28 = +[NSString stringWithString:Value];
            [(UVFSPartitionAnalytics *)v26 setPartitionType:v28];
          }
          else
          {
            id v29 = userfs_log_default;
            if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
              sub_1000222B0(buf, &v45, v29);
            }
          }
          CFNumberRef v30 = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)properties, @"Size");
          if (v30)
          {
            uint64_t valuePtr = 0;
            CFNumberGetValue(v30, kCFNumberLongLongType, &valuePtr);
            uint64_t v31 = valuePtr;
            double v32 = log10((double)valuePtr);
            double v33 = __exp10(floor(v32));
            [(UVFSPartitionAnalytics *)v26 setPartitionSize:v31 / (uint64_t)v33 * (uint64_t)v33];
          }
          else
          {
            v34 = userfs_log_default;
            if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
              sub_10002226C(v42, &v43, v34);
            }
          }
          v35 = [(UVFSAnalytics *)self partitions];
          [v35 addObject:v26];

          CFRelease(*(CFTypeRef *)properties);
        }
      }
      if (iterator) {
        IOObjectRelease(iterator);
      }
    }
    IOObjectRelease(v7);
  }
  else
  {
    id v16 = userfs_log_default;
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000221F4(v16, v17, v18, v19, v20, v21, v22, v23);
    }
  }
  v36 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)properties = 136315138;
    *(void *)&properties[4] = "-[UVFSAnalytics discoverPartitions:]";
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%s:finish", properties, 0xCu);
  }
}

- (void)discoverDiskProperties:(unsigned int)a3
{
  BOOL v5 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[UVFSAnalytics discoverDiskProperties:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s:start", buf, 0xCu);
  }
  io_registry_entry_t parent = 0;
  if (IORegistryEntryGetParentEntry(a3, "IOService", &parent))
  {
    io_registry_entry_t v6 = userfs_log_default;
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100022608(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else
  {
    CFNumberRef v14 = (const __CFNumber *)IORegistryEntrySearchCFProperty(parent, "IOService", @"Size", kCFAllocatorDefault, 3u);
    if (v14)
    {
      CFNumberRef v15 = v14;
      *(void *)buf = 0;
      CFNumberGetValue(v14, kCFNumberLongLongType, buf);
      id v16 = [(UVFSAnalytics *)self disk];
      [v16 setDiskSize:*(void *)buf];

      CFRelease(v15);
    }
    else
    {
      uint64_t v17 = userfs_log_default;
      if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100022590(v17, v18, v19, v20, v21, v22, v23, v24);
      }
    }
    CFNumberRef v25 = (const __CFNumber *)IORegistryEntrySearchCFProperty(parent, "IOService", @"Preferred Block Size", kCFAllocatorDefault, 3u);
    if (v25)
    {
      CFNumberRef v26 = v25;
      *(void *)buf = 0;
      CFNumberGetValue(v25, kCFNumberLongLongType, buf);
      uint64_t v27 = [(UVFSAnalytics *)self disk];
      [v27 setDiskBlockSize:*(void *)buf];

      CFRelease(v26);
    }
    else
    {
      id v28 = userfs_log_default;
      if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100022518(v28, v29, v30, v31, v32, v33, v34, v35);
      }
    }
    CFDictionaryRef v36 = (const __CFDictionary *)IORegistryEntrySearchCFProperty(parent, "IOService", @"Protocol Characteristics", kCFAllocatorDefault, 3u);
    if (v36)
    {
      CFDictionaryRef v37 = v36;
      Value = CFDictionaryGetValue(v36, @"Physical Interconnect");
      if (Value)
      {
        long long v39 = Value;
        id v40 = [(UVFSAnalytics *)self disk];
        [v40 setDiskType:v39];
      }
      else
      {
        long long v49 = userfs_log_default;
        if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1000224A0(v49, v50, v51, v52, v53, v54, v55, v56);
        }
      }
      CFRelease(v37);
    }
    else
    {
      uint64_t v41 = userfs_log_default;
      if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100022428(v41, v42, v43, v44, v45, v46, v47, v48);
      }
    }
    CFTypeRef v57 = IORegistryEntrySearchCFProperty(parent, "IOService", @"Content Mask", kCFAllocatorDefault, 3u);
    if (v57)
    {
      v58 = v57;
      v59 = [(UVFSAnalytics *)self disk];
      [v59 setPartitionTableType:v58];

      CFRelease(v58);
    }
    else
    {
      v60 = userfs_log_default;
      if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000223B0(v60, v61, v62, v63, v64, v65, v66, v67);
      }
    }
    if (parent) {
      IOObjectRelease(parent);
    }
  }
  v68 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[UVFSAnalytics discoverDiskProperties:]";
    _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "%s:finish", buf, 0xCu);
  }
}

- (UVFSDiskAnalytics)disk
{
  return (UVFSDiskAnalytics *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDisk:(id)a3
{
}

- (UVFSVolumeAnalytics)volume
{
  return (UVFSVolumeAnalytics *)objc_getProperty(self, a2, 16, 1);
}

- (void)setVolume:(id)a3
{
}

- (NSMutableArray)partitions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPartitions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partitions, 0);
  objc_storeStrong((id *)&self->_volume, 0);

  objc_storeStrong((id *)&self->_disk, 0);
}

@end