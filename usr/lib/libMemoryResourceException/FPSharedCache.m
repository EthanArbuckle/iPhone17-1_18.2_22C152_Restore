@interface FPSharedCache
+ (id)sharedCacheForDyldSnapshot:(dyld_process_snapshot_s *)a3;
- (BOOL)containsAddress:(unint64_t)a3;
- (NSUUID)uuid;
- (unint64_t)baseAddress;
- (unint64_t)mappedSize;
- (unint64_t)slide;
- (unsigned)alignment;
@end

@implementation FPSharedCache

+ (id)sharedCacheForDyldSnapshot:(dyld_process_snapshot_s *)a3
{
  v23[2] = *MEMORY[0x263EF8340];
  uint64_t shared_cache = dyld_process_snapshot_get_shared_cache();
  if (shared_cache && (uint64_t v4 = shared_cache, (MEMORY[0x223C326F0]() & 1) == 0))
  {
    v23[0] = 0;
    v23[1] = 0;
    dyld_shared_cache_copy_uuid();
    v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:v23];
    unint64_t v7 = MEMORY[0x223C326D0](v4);
    uint64_t v8 = MEMORY[0x223C326E0](v4);
    v9 = [NSNumber numberWithUnsignedLongLong:objc_msgSend(v6, "hash") ^ v7];
    os_unfair_lock_lock((os_unfair_lock_t)&unk_26AB223D0);
    v10 = sub_21E865FD8();
    v5 = [v10 objectForKeyedSubscript:v9];

    if (!v5)
    {
      uint64_t v18 = 0;
      v19 = &v18;
      uint64_t v20 = 0x2020000000;
      uint64_t v21 = 0;
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = sub_21E866030;
      v17[3] = &unk_2644CAF50;
      v17[4] = &v18;
      MEMORY[0x223C326B0](v4, v17);
      unint64_t v11 = v19[3];
      if (v7 < v11)
      {
        _os_assert_log();
        _os_crash();
        __break(1u);
      }
      if (v11) {
        unint64_t v12 = v7 - v11;
      }
      else {
        unint64_t v12 = 0;
      }
      v13 = sub_21E865FD8();
      v5 = [FPSharedCache alloc];
      id v14 = v6;
      if (v5)
      {
        v22.receiver = v5;
        v22.super_class = (Class)FPSharedCache;
        v15 = [super init];
        v5 = (FPSharedCache *)v15;
        if (v15)
        {
          objc_storeStrong(v15 + 2, v6);
          v5->_baseAddress = v7;
          v5->_mappedSize = v8;
          v5->_slide = v12;
          v5->_alignment = 4096;
        }
      }

      [v13 setObject:v5 forKeyedSubscript:v9];
      _Block_object_dispose(&v18, 8);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_26AB223D0);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)containsAddress:(unint64_t)a3
{
  unint64_t baseAddress = self->_baseAddress;
  return baseAddress <= a3 && self->_mappedSize + baseAddress > a3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (unint64_t)baseAddress
{
  return self->_baseAddress;
}

- (unint64_t)mappedSize
{
  return self->_mappedSize;
}

- (unint64_t)slide
{
  return self->_slide;
}

- (unsigned)alignment
{
  return self->_alignment;
}

- (void).cxx_destruct
{
}

@end