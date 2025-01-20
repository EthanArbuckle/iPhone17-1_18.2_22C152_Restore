@interface VMUTask
- (BOOL)addressIsInSharedCache:(unint64_t)a3;
- (BOOL)hasStartedWithErrorString:(const char *)a3;
- (BOOL)isCore;
- (BOOL)isExclave;
- (BOOL)isExclaveCore;
- (BOOL)isExclaveKit;
- (BOOL)isKernel;
- (BOOL)isTranslated;
- (BOOL)rangeIsInSharedCache:(_VMURange)a3;
- (BOOL)taskIsSelf;
- (NSString)coreFilePath;
- (VMUTask)initWithCorePath:(id)a3 originalBinaryPaths:(id)a4 error:(id *)a5;
- (VMUTask)initWithTask:(unsigned int)a3;
- (_CSTypeRef)createSymbolicatorWithFlags:(unsigned int)a3 andNotification:(id)a4;
- (_VMURange)taskDyldSharedCacheRange;
- (id)ioSurfaceDescriptions;
- (id)memoryCache;
- (id)processDescription;
- (int)pid;
- (uint64_t)ptrauthStripDataPointer:(uint64_t)result;
- (uint64_t)ptrauthStripFunctionPointer:(uint64_t)result;
- (unint64_t)exclaveType;
- (unint64_t)taskType;
- (unsigned)taskPort;
- (void)dealloc;
@end

@implementation VMUTask

- (BOOL)rangeIsInSharedCache:(_VMURange)a3
{
  return VMURangeContainsRange(self->_taskDyldSharedCacheRange.location, self->_taskDyldSharedCacheRange.length, a3.location, a3.length);
}

- (id)memoryCache
{
  return self->_taskMemory;
}

- (BOOL)isExclave
{
  return self->_exclaveType - 1 < 2;
}

- (unsigned)taskPort
{
  if (self->_taskType) {
    return 0;
  }
  else {
    return self->_liveTask;
  }
}

- (BOOL)isCore
{
  return self->_coreFilePath != 0;
}

- (VMUTask)initWithTask:(unsigned int)a3
{
  v14.receiver = self;
  v14.super_class = (Class)VMUTask;
  v4 = [(VMUTask *)&v14 init];
  v5 = v4;
  if (!v4) {
    goto LABEL_17;
  }
  v4->_taskType = 0;
  v4->_liveTask = a3;
  if (a3 + 1 >= 2)
  {
    if (mach_port_mod_refs(*MEMORY[0x1E4F14960], a3, 0, 1))
    {

      v5 = 0;
      goto LABEL_5;
    }
    v7 = [[VMUTaskMemoryCache alloc] initWithTask:v5->_liveTask];
    taskMemory = v5->_taskMemory;
    v5->_taskMemory = v7;

    int v15 = 0;
    uint64_t v9 = dyld_process_create_for_task();
    if (v9)
    {
      int v15 = 0;
      uint64_t v10 = dyld_process_snapshot_create_for_process();
      dyld_process_dispose();
      if (v10)
      {
        uint64_t shared_cache = dyld_process_snapshot_get_shared_cache();
        uint64_t v12 = shared_cache;
        if (shared_cache)
        {
          if (MEMORY[0x1AD0D95E0](shared_cache))
          {
            uint64_t v9 = 0;
            uint64_t v12 = 0;
          }
          else
          {
            uint64_t v9 = MEMORY[0x1AD0D95C0](v12);
            uint64_t v12 = MEMORY[0x1AD0D95D0](v12);
          }
        }
        else
        {
          uint64_t v9 = 0;
        }
        dyld_process_snapshot_dispose();
        goto LABEL_16;
      }
      uint64_t v9 = 0;
    }
    uint64_t v12 = 0;
LABEL_16:
    v5->_taskDyldSharedCacheRange.location = v9;
    v5->_taskDyldSharedCacheRange.length = v12;
    v5->_taskIsSelf = mach_task_is_self(v5->_liveTask) != 0;
LABEL_17:
    v5 = v5;
    v6 = v5;
    goto LABEL_18;
  }
LABEL_5:
  v6 = 0;
LABEL_18:

  return v6;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = *a1;
  v3[0] = 67109378;
  v3[1] = v2;
  __int16 v4 = 2080;
  v5 = mach_error_string(error_value);
  _os_log_error_impl(&dword_1A7CC9000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to deallocate target task port: %d (%s)\n", (uint8_t *)v3, 0x12u);
}

- (_CSTypeRef)createSymbolicatorWithFlags:(unsigned int)a3 andNotification:(id)a4
{
  unint64_t v4 = -[VMUTaskMemoryCache createSymbolicatorWithFlags:andNotification:]((uint64_t)self->_taskMemory, *(uint64_t *)&a3, a4);
  result._opaque_2 = v5;
  result._opaque_1 = v4;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processDescription, 0);
  objc_storeStrong((id *)&self->_taskMemory, 0);

  objc_storeStrong((id *)&self->_coreFilePath, 0);
}

- (VMUTask)initWithCorePath:(id)a3 originalBinaryPaths:(id)a4 error:(id *)a5
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v29.receiver = self;
  v29.super_class = (Class)VMUTask;
  id v10 = [(VMUTask *)&v29 init];
  if (v10)
  {
    uint64_t v28 = 0;
    if (!a5) {
      a5 = (id *)&v28;
    }
    uint64_t v11 = [v8 copy];
    uint64_t v12 = (void *)*((void *)v10 + 2);
    *((void *)v10 + 2) = v11;

    v13 = [[VMUTaskMemoryCache alloc] initWithCorePath:v8 originalBinaryPaths:v9 error:a5];
    objc_super v14 = (void *)*((void *)v10 + 6);
    *((void *)v10 + 6) = v13;

    uint64_t v15 = *((void *)v10 + 6);
    if (!v15) {
      goto LABEL_23;
    }
    if (-[VMUTaskMemoryCache isExclave](v15) || [*((id *)v10 + 6) isKernel])
    {
      *((void *)v10 + 4) = 0;
      *((void *)v10 + 5) = 0;
    }
    else if (-[VMUTaskMemoryCache getCoreDyldSharedCacheRange:](*((void *)v10 + 6), (_OWORD *)v10 + 2))
    {
      goto LABEL_23;
    }
    int v16 = [*((id *)v10 + 6) isKernel];
    uint64_t v17 = 1;
    if (v16) {
      uint64_t v17 = 2;
    }
    *((void *)v10 + 11) = v17;
    *((unsigned char *)v10 + 24) = 0;
    *((void *)v10 + 9) = -[VMUTaskMemoryCache exclaveType](*((void *)v10 + 6));
    if (*((void *)v10 + 11) == 2)
    {
      id v18 = *((id *)v10 + 6);
      uint64_t FlagsForNListOnlyData = CSSymbolicatorGetFlagsForNListOnlyData();
      -[VMUTaskMemoryCache createSymbolicatorWithFlags:andNotification:]((uint64_t)v18, FlagsForNListOnlyData, 0);
      CSSymbolicatorGetAOutSymbolOwner();
      CSSymbolOwnerGetSymbolWithMangledName();
      uint64_t Range = CSSymbolGetRange();
      CSRelease();
      if (Range)
      {
        v30 = 0;
        if (![v18 peekAtAddress:Range size:8 returnsBuf:&v30])
        {
          if (v30)
          {
            unint64_t v27 = 64 - *v30;
            if (!(-((*v30 > 0x40uLL) + 64) & 1 | HIDWORD(v27)))
            {
              uint64_t v22 = ~(-1 << v27);

              goto LABEL_18;
            }
          }
        }
      }
    }
    if (!-[VMUTaskMemoryCache getCoreFileAddressingMask:](*((void *)v10 + 6)))
    {
      uint64_t v22 = 0;
LABEL_18:
      *((void *)v10 + 10) = v22;
      goto LABEL_24;
    }
    if (*((void *)v10 + 11) == 2)
    {
      v21 = @"kernel";
    }
    else
    {
      if (!*((void *)v10 + 9)) {
        goto LABEL_24;
      }
      v21 = @"exclave";
    }
    v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v31 = *MEMORY[0x1E4F28568];
    v24 = [NSString stringWithFormat:@"Failed to get addressing mask for %@ core file.", v21];
    v32[0] = v24;
    v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    *a5 = [v23 errorWithDomain:@"VMUTask initialization" code:0 userInfo:v25];

LABEL_23:
    id v10 = 0;
  }
LABEL_24:

  return (VMUTask *)v10;
}

- (int)pid
{
  int v2 = [(VMUTask *)self processDescription];
  int v3 = [v2 pid];

  return v3;
}

- (BOOL)isTranslated
{
  int v2 = [(VMUTask *)self processDescription];
  char v3 = [v2 isTranslated];

  return v3;
}

- (_VMURange)taskDyldSharedCacheRange
{
  unint64_t length = self->_taskDyldSharedCacheRange.length;
  unint64_t location = self->_taskDyldSharedCacheRange.location;
  result.unint64_t length = length;
  result.unint64_t location = location;
  return result;
}

- (BOOL)addressIsInSharedCache:(unint64_t)a3
{
  return a3 - self->_taskDyldSharedCacheRange.location < self->_taskDyldSharedCacheRange.length;
}

- (BOOL)hasStartedWithErrorString:(const char *)a3
{
  if (self->_taskType) {
    return 1;
  }
  else {
    return CSTaskHasStarted();
  }
}

- (BOOL)taskIsSelf
{
  return self->_taskIsSelf;
}

- (id)ioSurfaceDescriptions
{
  if (self->_taskType || !objc_opt_class())
  {
    id v2 = 0;
  }
  else
  {
    char v3 = [MEMORY[0x1E4F2EF80] surfaceDescriptions];
    unint64_t v4 = objc_opt_new();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __32__VMUTask_ioSurfaceDescriptions__block_invoke;
    v6[3] = &unk_1E5D24368;
    id v2 = v4;
    id v7 = v2;
    [v3 enumerateKeysAndObjectsUsingBlock:v6];
  }

  return v2;
}

void __32__VMUTask_ioSurfaceDescriptions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v18 = a2;
  id v4 = a3;
  v21 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v4;
  uint64_t v22 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v22)
  {
    uint64_t v20 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v24 = [v6 width];
        uint64_t v23 = [v6 height];
        id v7 = [VMUIOSurfaceDebugDescription alloc];
        uint64_t v8 = [v6 virtualAddress];
        uint64_t v9 = [v6 allocationSize];
        uint64_t v10 = [v6 surfaceID];
        uint64_t v11 = [v6 pixelFormat];
        uint64_t v12 = [v6 pixelFormatString];
        uint64_t v13 = [v6 dirtySize];
        uint64_t v14 = [v6 residentSize];
        uint64_t v15 = [v6 name];
        int v16 = [(VMUIOSurfaceDebugDescription *)v7 initWithVirtualAddress:v8 allocationSize:v9 surfaceID:v10 pixelFormat:v11 pixelFormatString:v12 width:v24 height:v23 dirtySize:v13 residentSize:v14 name:v15];

        [v21 addObject:v16];
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v22);
  }

  [*(id *)(a1 + 32) setObject:v21 forKey:v18];
}

- (id)processDescription
{
  if (!self->_processDescriptionInitialized)
  {
    self->_processDescriptionInitialized = 1;
    char v3 = [VMUProcessDescription alloc];
    id v4 = [(VMUTask *)self memoryCache];
    unint64_t v5 = [(VMUProcessDescription *)v3 initWithVMUTaskMemoryCache:v4 getBinariesList:1];
    processDescription = self->_processDescription;
    self->_processDescription = v5;
  }
  id v7 = self->_processDescription;

  return v7;
}

- (BOOL)isKernel
{
  return [(VMUTaskMemoryCache *)self->_taskMemory isKernel];
}

- (BOOL)isExclaveCore
{
  return self->_exclaveType == 1;
}

- (BOOL)isExclaveKit
{
  return self->_exclaveType == 2;
}

- (unint64_t)exclaveType
{
  return self->_exclaveType;
}

- (uint64_t)ptrauthStripDataPointer:(uint64_t)result
{
  if (result)
  {
    if (*(void *)(result + 72)) {
      return *(void *)(result + 80) & a2;
    }
    else {
      return a2;
    }
  }
  return result;
}

- (uint64_t)ptrauthStripFunctionPointer:(uint64_t)result
{
  if (result)
  {
    if (*(void *)(result + 72)) {
      return *(void *)(result + 80) & a2;
    }
    else {
      return a2;
    }
  }
  return result;
}

- (unint64_t)taskType
{
  return self->_taskType;
}

- (NSString)coreFilePath
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

void __VMUTask_enumerate_malloc_blocks_block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __VMUTask_enumerate_malloc_blocks_block_invoke_2;
  v8[3] = &unk_1E5D253A8;
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  id v9 = v5;
  uint64_t v10 = v6;
  int v13 = *(_DWORD *)(a1 + 56);
  uint64_t v11 = a2;
  uint64_t v12 = v7;
  VMUTask_foreach_malloc_zone(v5, v8);
}

uint64_t __VMUTask_enumerate_malloc_blocks_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t (**a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v11 = *a3;
  uint64_t v5 = [*(id *)(a1 + 32) taskPort];
  uint64_t v6 = *(unsigned int *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);

  return v11(v5, v7, v6, a2, v8, v9);
}

@end