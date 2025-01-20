@interface OSAWiredMemoryInfo
- (OSAWiredMemoryInfo)initWithZoneNames:(mach_zone_name *)a3 nameCount:(unsigned int)a4 zoneInfo:(mach_zone_info_data *)a5 zoneInfoCount:(unsigned int)a6 wiredInfo:(mach_memory_info *)a7 wiredInfoCount:(unsigned int)a8;
- (id)getCounterNameForSite:(unint64_t)a3;
- (id)getTagNameForSite:(unint64_t)a3;
- (id)vmRegionInfo;
- (id)zoneInfo;
- (void)dealloc;
@end

@implementation OSAWiredMemoryInfo

- (OSAWiredMemoryInfo)initWithZoneNames:(mach_zone_name *)a3 nameCount:(unsigned int)a4 zoneInfo:(mach_zone_info_data *)a5 zoneInfoCount:(unsigned int)a6 wiredInfo:(mach_memory_info *)a7 wiredInfoCount:(unsigned int)a8
{
  v15.receiver = self;
  v15.super_class = (Class)OSAWiredMemoryInfo;
  result = [(OSAWiredMemoryInfo *)&v15 init];
  if (result)
  {
    result->zone_names = a3;
    result->zone_names_count = a4;
    result->zone_info = a5;
    result->zone_info_count = a6;
    result->wired_info = a7;
    result->wired_info_count = a8;
  }
  return result;
}

- (void)dealloc
{
  self->zone_names = 0;
  self->zone_names_count = 0;
  self->zone_info = 0;
  self->zone_info_count = 0;
  self->wired_info = 0;
  self->wired_info_count = 0;
  v2.receiver = self;
  v2.super_class = (Class)OSAWiredMemoryInfo;
  [(OSAWiredMemoryInfo *)&v2 dealloc];
}

- (id)zoneInfo
{
  v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:self->zone_names_count];
  if (self->zone_names_count)
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      v7 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:9];
      v8 = [NSString stringWithUTF8String:&self->zone_names[v5]];
      [v7 setObject:v8 forKeyedSubscript:@"name"];

      v9 = [NSNumber numberWithUnsignedLongLong:self->zone_info[v4].mzi_count];
      [v7 setObject:v9 forKeyedSubscript:@"count"];

      v10 = [NSNumber numberWithUnsignedLongLong:self->zone_info[v4].mzi_max_size];
      [v7 setObject:v10 forKeyedSubscript:@"max_size"];

      v11 = [NSNumber numberWithUnsignedLongLong:self->zone_info[v4].mzi_elem_size];
      [v7 setObject:v11 forKeyedSubscript:@"elem_size"];

      v12 = [NSNumber numberWithUnsignedLongLong:self->zone_info[v4].mzi_alloc_size];
      [v7 setObject:v12 forKeyedSubscript:@"alloc_size"];

      v13 = [NSNumber numberWithUnsignedLongLong:self->zone_info[v4].mzi_sum_size];
      [v7 setObject:v13 forKeyedSubscript:@"sum_size"];

      v14 = [NSNumber numberWithUnsignedLongLong:self->zone_info[v4].mzi_exhaustible];
      [v7 setObject:v14 forKeyedSubscript:@"exhaustible"];

      objc_super v15 = [NSNumber numberWithUnsignedLongLong:self->zone_info[v4].mzi_collectable];
      [v7 setObject:v15 forKeyedSubscript:@"collectable"];

      v16 = &self->zone_info[v4];
      uint64_t mzi_cur_size = v16->mzi_cur_size;
      if (!mzi_cur_size) {
        uint64_t mzi_cur_size = v16->mzi_elem_size * v16->mzi_count;
      }
      v18 = [NSNumber numberWithUnsignedLongLong:mzi_cur_size];
      [v7 setObject:v18 forKeyedSubscript:@"size"];

      [v3 addObject:v7];
      ++v6;
      ++v5;
      ++v4;
    }
    while (v6 < self->zone_names_count);
  }
  return v3;
}

- (id)vmRegionInfo
{
  id v28 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:self->wired_info_count];
  v3 = (void *)OSKextCopyLoadedKextInfo();
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __34__OSAWiredMemoryInfo_vmRegionInfo__block_invoke;
  v29[3] = &unk_1E5D204A0;
  v26 = v3;
  id v27 = v4;
  id v30 = v27;
  [v3 enumerateKeysAndObjectsUsingBlock:v29];
  CSSymbolicatorCreateWithMachKernel();
  if (self->wired_info_count)
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      v7 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:11];
      v8 = [NSNumber numberWithUnsignedLongLong:self->wired_info[v5].flags];
      [v7 setObject:v8 forKeyedSubscript:@"flags"];

      v9 = [NSNumber numberWithUnsignedLongLong:self->wired_info[v5].site];
      [v7 setObject:v9 forKeyedSubscript:@"site"];

      v10 = [NSNumber numberWithUnsignedLongLong:self->wired_info[v5].size];
      [v7 setObject:v10 forKeyedSubscript:@"size"];

      v11 = [NSNumber numberWithUnsignedLongLong:self->wired_info[v5].free];
      [v7 setObject:v11 forKeyedSubscript:@"free"];

      v12 = [NSNumber numberWithUnsignedLongLong:self->wired_info[v5].largest];
      [v7 setObject:v12 forKeyedSubscript:@"largest"];

      v13 = [NSNumber numberWithUnsignedLongLong:self->wired_info[v5].collectable_bytes];
      [v7 setObject:v13 forKeyedSubscript:@"collectable_bytes"];

      v14 = [NSNumber numberWithUnsignedLongLong:self->wired_info[v5].mapped];
      [v7 setObject:v14 forKeyedSubscript:@"mapped"];

      objc_super v15 = [NSNumber numberWithUnsignedLongLong:self->wired_info[v5].peak];
      [v7 setObject:v15 forKeyedSubscript:@"peak"];

      v16 = [NSNumber numberWithUnsignedShort:self->wired_info[v5].tag];
      [v7 setObject:v16 forKeyedSubscript:@"tag"];

      v17 = [NSNumber numberWithUnsignedShort:self->wired_info[v5].zone];
      [v7 setObject:v17 forKeyedSubscript:@"zone"];

      wired_info = self->wired_info;
      if ((wired_info[v5].flags & 0x400) != 0)
      {
        v20 = NSString;
        uint64_t name = (uint64_t)wired_info[v5].name;
      }
      else
      {
        switch(wired_info[v5].flags)
        {
          case 0u:
            uint64_t v19 = [(OSAWiredMemoryInfo *)self getTagNameForSite:wired_info[v5].site];
            goto LABEL_8;
          case 1u:
            v23 = [NSNumber numberWithUnsignedLongLong:wired_info[v5].site];
            v22 = [v27 objectForKeyedSubscript:v23];

            if (v22) {
              goto LABEL_9;
            }
            goto LABEL_10;
          case 2u:
            if (CSIsNull()) {
              goto LABEL_10;
            }
            CSSymbolicatorGetSymbolWithAddressAtTime();
            if (CSIsNull()) {
              goto LABEL_10;
            }
            uint64_t v24 = CSSymbolGetName();
            if (!v24) {
              goto LABEL_10;
            }
            uint64_t name = v24;
            v20 = NSString;
            break;
          case 3u:
            uint64_t v19 = [(OSAWiredMemoryInfo *)self getCounterNameForSite:wired_info[v5].site];
            goto LABEL_8;
          default:
            goto LABEL_10;
        }
      }
      uint64_t v19 = [v20 stringWithUTF8String:name];
LABEL_8:
      v22 = (void *)v19;
      if (v19)
      {
LABEL_9:
        [v7 setObject:v22 forKeyedSubscript:@"name"];
        [v28 addObject:v7];
      }
LABEL_10:

      ++v6;
      ++v5;
    }
    while (v6 < self->wired_info_count);
  }
  if ((CSIsNull() & 1) == 0) {
    CSRelease();
  }

  return v28;
}

void __34__OSAWiredMemoryInfo_vmRegionInfo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 objectForKeyedSubscript:@"OSBundleLoadTag"];
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
}

- (id)getTagNameForSite:(unint64_t)a3
{
  if ([&unk_1EFE25EE0 count] <= a3)
  {
    if (a3 == 255)
    {
      uint64_t v4 = @"VM_KERN_MEMORY_ANY";
    }
    else if (a3 == 256)
    {
      uint64_t v4 = @"VM_KERN_MEMORY_COUNT";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"VM_KERN_MEMORY_%lld", a3);
      uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v4 = [&unk_1EFE25EF8 objectAtIndexedSubscript:a3];
  }
  return v4;
}

- (id)getCounterNameForSite:(unint64_t)a3
{
  if ([&unk_1EFE25F10 count] <= a3) {
    objc_msgSend(NSString, "stringWithFormat:", @"VM_KERN_COUNT_%lld", a3);
  }
  else {
  uint64_t v4 = [&unk_1EFE25F28 objectAtIndexedSubscript:a3];
  }
  return v4;
}

@end