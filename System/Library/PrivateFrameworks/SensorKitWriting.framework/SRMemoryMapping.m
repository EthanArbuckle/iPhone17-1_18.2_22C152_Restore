@interface SRMemoryMapping
+ (void)initialize;
- (BOOL)isValidWriteToDestinationAddress:(uint64_t)a3 withLength:(uint64_t)a4 bytes:;
- (id)initWithSize:(int)a3 protection:(int)a4 advice:(uint64_t)a5 offset:;
- (uint64_t)mapWithFileHandle:(uint64_t)result;
- (void)appendBytes:(size_t)a3 length:;
- (void)dealloc;
- (void)sync;
- (void)writeBytes:(uint64_t)a3 toOffset:(size_t)a4 length:;
@end

@implementation SRMemoryMapping

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    SRLogMemoryMapping = (uint64_t)os_log_create("com.apple.SensorKit", "SRMemoryMapping");
  }
}

- (id)initWithSize:(int)a3 protection:(int)a4 advice:(uint64_t)a5 offset:
{
  if (result)
  {
    v9.receiver = result;
    v9.super_class = (Class)SRMemoryMapping;
    result = objc_msgSendSuper2(&v9, sel_init);
    if (result)
    {
      *((void *)result + 6) = a2;
      *((_DWORD *)result + 2) = a3;
      *((_DWORD *)result + 3) = a4;
      *((void *)result + 4) = a5;
    }
  }
  return result;
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (self)
  {
    mappedAddress = self->_mappedAddress;
    if ((unint64_t)mappedAddress + 1 >= 2)
    {
      v4 = SRLogMemoryMapping;
      if (os_log_type_enabled((os_log_t)SRLogMemoryMapping, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        v11 = mappedAddress;
        _os_log_impl(&dword_25C11B000, v4, OS_LOG_TYPE_INFO, "Unmapping %{public}p", buf, 0xCu);
      }
      size_t pageAlignedSize = self->_pageAlignedSize;
      if (munmap(mappedAddress, pageAlignedSize))
      {
        v6 = SRLogMemoryMapping;
        if (os_log_type_enabled((os_log_t)SRLogMemoryMapping, OS_LOG_TYPE_INFO))
        {
          int v7 = *__error();
          *(_DWORD *)buf = 134349568;
          v11 = mappedAddress;
          __int16 v12 = 2048;
          size_t v13 = pageAlignedSize;
          __int16 v14 = 1026;
          int v15 = v7;
          _os_log_impl(&dword_25C11B000, v6, OS_LOG_TYPE_INFO, "Unable to unmap %{public}p size %zu because %{public, darwin.errno}d", buf, 0x1Cu);
          v6 = SRLogMemoryMapping;
        }
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        {
          int v8 = *__error();
          *(_DWORD *)buf = 134349568;
          v11 = mappedAddress;
          __int16 v12 = 2048;
          size_t v13 = pageAlignedSize;
          __int16 v14 = 1026;
          int v15 = v8;
          _os_log_fault_impl(&dword_25C11B000, v6, OS_LOG_TYPE_FAULT, "Unable to unmap %{public}p size %zu because %{public, darwin.errno}d", buf, 0x1Cu);
        }
        abort();
      }
      self->_mappedAddress = 0;
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)SRMemoryMapping;
  [(SRMemoryMapping *)&v9 dealloc];
}

- (uint64_t)mapWithFileHandle:(uint64_t)result
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (result)
  {
    uint64_t v3 = result;
    NSUInteger v4 = *(void *)(result + 32);
    off_t v5 = NSRoundDownToMultipleOfPageSize(v4);
    NSUInteger v6 = v4 - v5;
    size_t v7 = NSRoundUpToMultipleOfPageSize(*(void *)(v3 + 48) + v4 - v5);
    int v8 = (char *)mmap(0, v7, *(_DWORD *)(v3 + 8), 1, [a2 fileDescriptor], v5);
    if (v8 == (char *)-1)
    {
      __int16 v12 = SRLogMemoryMapping;
      result = os_log_type_enabled((os_log_t)SRLogMemoryMapping, OS_LOG_TYPE_FAULT);
      if (result)
      {
        int v13 = *__error();
        int v15 = 138543618;
        uint64_t v16 = a2;
        __int16 v17 = 1026;
        int v18 = v13;
        _os_log_fault_impl(&dword_25C11B000, v12, OS_LOG_TYPE_FAULT, "Unable to mmap storage file %{public}@ because %{public, darwin.errno}d", (uint8_t *)&v15, 0x12u);
        return 0;
      }
    }
    else
    {
      *(void *)(v3 + 56) = v7;
      *(void *)(v3 + 40) = v8;
      objc_super v9 = &v8[v6];
      *(void *)(v3 + 16) = &v8[v6];
      int v10 = *(_DWORD *)(v3 + 12);
      if (v10 != 2) {
        v9 += *(void *)(v3 + 48);
      }
      *(void *)(v3 + 24) = v9;
      if (madvise(v8, v7, v10) < 0)
      {
        v11 = SRLogMemoryMapping;
        if (os_log_type_enabled((os_log_t)SRLogMemoryMapping, OS_LOG_TYPE_FAULT))
        {
          int v14 = *__error();
          int v15 = 67240192;
          LODWORD(v16) = v14;
          _os_log_fault_impl(&dword_25C11B000, v11, OS_LOG_TYPE_FAULT, "Failed to madvise() because %{public, darwin.errno}d", (uint8_t *)&v15, 8u);
        }
      }
      return 1;
    }
  }
  return result;
}

- (void)sync
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (a1)
  {
    v2 = *(void **)(a1 + 40);
    if ((unint64_t)v2 + 1 >= 2)
    {
      uint64_t v5 = a1 + 16;
      uint64_t v3 = *(void *)(a1 + 16);
      uint64_t v4 = *(void *)(v5 + 8);
      if (v4 != v3)
      {
        if (msync(v2, v4 - v3, 16))
        {
          NSUInteger v6 = SRLogMemoryMapping;
          if (os_log_type_enabled((os_log_t)SRLogMemoryMapping, OS_LOG_TYPE_ERROR))
          {
            int v7 = *__error();
            v8[0] = 67240192;
            v8[1] = v7;
            _os_log_error_impl(&dword_25C11B000, v6, OS_LOG_TYPE_ERROR, "Failed to msync because %{public, darwin.errno}d", (uint8_t *)v8, 8u);
          }
        }
      }
    }
  }
}

- (BOOL)isValidWriteToDestinationAddress:(uint64_t)a3 withLength:(uint64_t)a4 bytes:
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (result)
  {
    uint64_t v4 = result;
    result = 0;
    if (a4)
    {
      if ((*(_DWORD *)(v4 + 8) & 2) != 0)
      {
        if ((unint64_t)(*(void *)(v4 + 40) + 1) < 2) {
          return 0;
        }
        unint64_t v6 = *(void *)(v4 + 24);
        if (__CFADD__(v6, a3))
        {
          int v7 = SRLogMemoryMapping;
          result = os_log_type_enabled((os_log_t)SRLogMemoryMapping, OS_LOG_TYPE_ERROR);
          if (result)
          {
            int v10 = 134349056;
            uint64_t v11 = a3;
            _os_log_error_impl(&dword_25C11B000, v7, OS_LOG_TYPE_ERROR, "%{public}zu is too large to write", (uint8_t *)&v10, 0xCu);
            return 0;
          }
        }
        else
        {
          unint64_t v8 = *(void *)(v4 + 16);
          return v6 >= a2 && v8 <= a2;
        }
      }
    }
  }
  return result;
}

- (void)writeBytes:(uint64_t)a3 toOffset:(size_t)a4 length:
{
  if (result)
  {
    unint64_t v6 = (void *)(*((void *)result + 2) + a3);
    result = (void *)-[SRMemoryMapping isValidWriteToDestinationAddress:withLength:bytes:]((BOOL)result, (unint64_t)v6, a4, (uint64_t)a2);
    if (result)
    {
      return memcpy(v6, a2, a4);
    }
  }
  return result;
}

- (void)appendBytes:(size_t)a3 length:
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a1)
  {
    unint64_t v6 = (char *)a1[3];
    if (-[SRMemoryMapping isValidWriteToDestinationAddress:withLength:bytes:]((BOOL)a1, (unint64_t)v6, a3, (uint64_t)a2))
    {
      size_t v7 = a1[6] - a1[3] + a1[2];
      if (v7 >= a3)
      {
        a1[3] = &v6[a3];
        memcpy(v6, a2, a3);
      }
      else
      {
        unint64_t v8 = SRLogMemoryMapping;
        if (os_log_type_enabled((os_log_t)SRLogMemoryMapping, OS_LOG_TYPE_INFO))
        {
          int v9 = 134349312;
          size_t v10 = a3;
          __int16 v11 = 2050;
          size_t v12 = v7;
          _os_log_impl(&dword_25C11B000, v8, OS_LOG_TYPE_INFO, "More bytes requested %{public}zu than the capacity %{public}zu. Client should call -freeSpace: to avoid this", (uint8_t *)&v9, 0x16u);
        }
      }
    }
  }
}

@end