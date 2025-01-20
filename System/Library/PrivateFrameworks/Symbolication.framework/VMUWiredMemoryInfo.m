@interface VMUWiredMemoryInfo
- (BOOL)sample;
- (VMUWiredMemoryInfo)init;
- (VMUWiredMemoryInfo)initWithZoneNames:(mach_zone_name *)a3 nameCount:(unsigned int)a4 zoneInfo:(mach_zone_info_data *)a5 zoneInfoCount:(unsigned int)a6 wiredInfo:(mach_memory_info *)a7 wiredInfoCount:(unsigned int)a8;
- (id)getCounterNameForSite:(unint64_t)a3;
- (id)getTagNameForSite:(unint64_t)a3;
- (id)vmRegionInfo;
- (id)zoneInfo;
- (void)dealloc;
- (void)resetMachInfo;
- (void)sample;
@end

@implementation VMUWiredMemoryInfo

- (VMUWiredMemoryInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)VMUWiredMemoryInfo;
  result = [(VMUWiredMemoryInfo *)&v3 init];
  if (result)
  {
    result->zone_names = 0;
    result->zone_names_count = 0;
    result->zone_info = 0;
    result->zone_info_count = 0;
    result->wired_info = 0;
    result->wired_info_count = 0;
    result->ownsMachInfo = 1;
  }
  return result;
}

- (VMUWiredMemoryInfo)initWithZoneNames:(mach_zone_name *)a3 nameCount:(unsigned int)a4 zoneInfo:(mach_zone_info_data *)a5 zoneInfoCount:(unsigned int)a6 wiredInfo:(mach_memory_info *)a7 wiredInfoCount:(unsigned int)a8
{
  v15.receiver = self;
  v15.super_class = (Class)VMUWiredMemoryInfo;
  result = [(VMUWiredMemoryInfo *)&v15 init];
  if (result)
  {
    result->zone_names = a3;
    result->zone_names_count = a4;
    result->zone_info = a5;
    result->zone_info_count = a6;
    result->wired_info = a7;
    result->wired_info_count = a8;
    result->ownsMachInfo = 0;
  }
  return result;
}

- (void)resetMachInfo
{
  if (self->ownsMachInfo)
  {
    objc_super v3 = (vm_map_t *)MEMORY[0x1E4F14960];
    mach_vm_deallocate(*MEMORY[0x1E4F14960], (mach_vm_address_t)self->zone_names, 8 * self->zone_names_count);
    mach_vm_deallocate(*v3, (mach_vm_address_t)self->zone_info, 8 * self->zone_info_count);
    mach_vm_deallocate(*v3, (mach_vm_address_t)self->wired_info, 8 * self->wired_info_count);
  }
  self->zone_names = 0;
  self->zone_names_count = 0;
  self->zone_info = 0;
  self->zone_info_count = 0;
  self->wired_info = 0;
  self->wired_info_count = 0;
  self->ownsMachInfo = 1;
}

- (void)dealloc
{
  [(VMUWiredMemoryInfo *)self resetMachInfo];
  v3.receiver = self;
  v3.super_class = (Class)VMUWiredMemoryInfo;
  [(VMUWiredMemoryInfo *)&v3 dealloc];
}

- (BOOL)sample
{
  kern_return_t v5;
  int v6;
  BOOL v7;

  v2 = self;
  p_zone_names = &self->zone_names;
  if (self->zone_names || self->zone_info || self->wired_info) {
    self = (VMUWiredMemoryInfo *)[(VMUWiredMemoryInfo *)self resetMachInfo];
  }
  mach_port_t v4 = MEMORY[0x1AD0D9890](self, a2);
  v5 = mach_memory_info(v4, p_zone_names, &v2->zone_names_count, &v2->zone_info, &v2->zone_info_count, &v2->wired_info, &v2->wired_info_count);
  v2->ownsMachInfo = 1;
  if (v5)
  {
    v6 = v5;
    v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v7)
    {
      -[VMUWiredMemoryInfo sample](v6);
LABEL_12:
      LOBYTE(v7) = 0;
    }
  }
  else if (v2->zone_names_count == v2->zone_info_count)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    [(VMUWiredMemoryInfo *)v2 resetMachInfo];
    v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v7)
    {
      -[VMUWiredMemoryInfo sample]();
      goto LABEL_12;
    }
  }
  return v7;
}

- (id)zoneInfo
{
  v23[9] = *MEMORY[0x1E4F143B8];
  id v17 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:self->zone_names_count];
  if (self->zone_names_count)
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
    unint64_t v5 = 0;
    unint64_t v6 = 0x1E4F28000uLL;
    do
    {
      v22[0] = @"name";
      uint64_t v7 = [NSString stringWithUTF8String:&self->zone_names[v4]];
      v23[0] = v7;
      v22[1] = @"count";
      v20 = [*(id *)(v6 + 3792) numberWithUnsignedLongLong:self->zone_info[v3].mzi_count];
      v23[1] = v20;
      v22[2] = @"max_size";
      v19 = [*(id *)(v6 + 3792) numberWithUnsignedLongLong:self->zone_info[v3].mzi_max_size];
      v23[2] = v19;
      v22[3] = @"elem_size";
      v18 = [*(id *)(v6 + 3792) numberWithUnsignedLongLong:self->zone_info[v3].mzi_elem_size];
      v23[3] = v18;
      v22[4] = @"alloc_size";
      v8 = [*(id *)(v6 + 3792) numberWithUnsignedLongLong:self->zone_info[v3].mzi_alloc_size];
      v23[4] = v8;
      v22[5] = @"sum_size";
      v9 = [*(id *)(v6 + 3792) numberWithUnsignedLongLong:self->zone_info[v3].mzi_sum_size];
      v23[5] = v9;
      v22[6] = @"exhaustible";
      v10 = [*(id *)(v6 + 3792) numberWithUnsignedLongLong:self->zone_info[v3].mzi_exhaustible];
      v23[6] = v10;
      v22[7] = @"collectable";
      v11 = [*(id *)(v6 + 3792) numberWithUnsignedLongLong:self->zone_info[v3].mzi_collectable];
      v23[7] = v11;
      v22[8] = @"size";
      v12 = &self->zone_info[v3];
      uint64_t mzi_cur_size = v12->mzi_cur_size;
      v21 = (void *)v7;
      if (!mzi_cur_size) {
        uint64_t mzi_cur_size = v12->mzi_elem_size * v12->mzi_count;
      }
      v14 = [*(id *)(v6 + 3792) numberWithUnsignedLongLong:mzi_cur_size];
      v23[8] = v14;
      objc_super v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:9];

      [v17 addObject:v15];
      ++v5;
      ++v4;
      ++v3;
      unint64_t v6 = 0x1E4F28000;
    }
    while (v5 < self->zone_names_count);
  }

  return v17;
}

- (id)vmRegionInfo
{
  v32[11] = *MEMORY[0x1E4F143B8];
  id v23 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:self->wired_info_count];
  uint64_t v3 = (void *)OSKextCopyLoadedKextInfo();
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:[v3 count]];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __34__VMUWiredMemoryInfo_vmRegionInfo__block_invoke;
  v29[3] = &unk_1E5D249B0;
  v21 = v3;
  id v22 = v4;
  id v30 = v22;
  [v3 enumerateKeysAndObjectsUsingBlock:v29];
  CSSymbolicatorCreateWithMachKernel();
  if (self->wired_info_count)
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      wired_info = self->wired_info;
      if ((wired_info[v5].flags & 0x400) != 0)
      {
        v9 = NSString;
        uint64_t name = (uint64_t)wired_info[v5].name;
      }
      else
      {
        switch(wired_info[v5].flags)
        {
          case 0u:
            uint64_t v8 = [(VMUWiredMemoryInfo *)self getTagNameForSite:wired_info[v5].site];
            goto LABEL_8;
          case 1u:
            v18 = [NSNumber numberWithUnsignedLongLong:wired_info[v5].site];
            v11 = [v22 objectForKeyedSubscript:v18];

            if (v11) {
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
            v19 = NSString;
            uint64_t name = CSSymbolGetName();
            v9 = v19;
            break;
          case 3u:
            uint64_t v8 = [(VMUWiredMemoryInfo *)self getCounterNameForSite:wired_info[v5].site];
            goto LABEL_8;
          default:
            goto LABEL_10;
        }
      }
      uint64_t v8 = [v9 stringWithUTF8String:name];
LABEL_8:
      v11 = (void *)v8;
      if (v8)
      {
LABEL_9:
        v31[0] = @"flags";
        v28 = [NSNumber numberWithUnsignedLongLong:self->wired_info[v5].flags];
        v32[0] = v28;
        v31[1] = @"site";
        v27 = [NSNumber numberWithUnsignedLongLong:self->wired_info[v5].site];
        v32[1] = v27;
        v31[2] = @"size";
        v26 = [NSNumber numberWithUnsignedLongLong:self->wired_info[v5].size];
        v32[2] = v26;
        v31[3] = @"free";
        v25 = [NSNumber numberWithUnsignedLongLong:self->wired_info[v5].free];
        v32[3] = v25;
        v31[4] = @"largest";
        v24 = [NSNumber numberWithUnsignedLongLong:self->wired_info[v5].largest];
        v32[4] = v24;
        v31[5] = @"collectable_bytes";
        v12 = [NSNumber numberWithUnsignedLongLong:self->wired_info[v5].collectable_bytes];
        v32[5] = v12;
        v31[6] = @"mapped";
        v13 = [NSNumber numberWithUnsignedLongLong:self->wired_info[v5].mapped];
        v32[6] = v13;
        v31[7] = @"peak";
        v14 = [NSNumber numberWithUnsignedLongLong:self->wired_info[v5].peak];
        v32[7] = v14;
        v31[8] = @"tag";
        objc_super v15 = [NSNumber numberWithUnsignedShort:self->wired_info[v5].tag];
        v32[8] = v15;
        v31[9] = @"zone";
        v16 = [NSNumber numberWithUnsignedShort:self->wired_info[v5].zone];
        v31[10] = @"name";
        v32[9] = v16;
        v32[10] = v11;
        id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:11];

        [v23 addObject:v17];
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

  return v23;
}

void __34__VMUWiredMemoryInfo_vmRegionInfo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 objectForKeyedSubscript:@"OSBundleLoadTag"];
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
}

- (id)getTagNameForSite:(unint64_t)a3
{
  if ([&unk_1EFE40048 count] <= a3)
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
      [NSString stringWithFormat:@"VM_KERN_MEMORY_%lld", a3];
      uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v4 = [&unk_1EFE40060 objectAtIndexedSubscript:a3];
  }

  return v4;
}

- (id)getCounterNameForSite:(unint64_t)a3
{
  if ([&unk_1EFE40078 count] <= a3) {
    [NSString stringWithFormat:@"VM_KERN_COUNT_%lld", a3];
  }
  else {
  uint64_t v4 = [&unk_1EFE40090 objectAtIndexedSubscript:a3];
  }

  return v4;
}

- (void)sample
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_1A7CC9000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Insufficient permissions to call mach_memory_info: error code %d\n", (uint8_t *)v1, 8u);
}

@end