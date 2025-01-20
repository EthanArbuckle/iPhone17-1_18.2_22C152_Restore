@interface VMUTaskThreadStates
- (VMUTaskThreadStates)initWithPid:(int)a3 task:(unsigned int)a4;
- (VMUTaskThreadStates)initWithVMUTask:(id)a3;
- (unint64_t)stackPointerForThreadNum:(unsigned int)a3;
- (unsigned)threadCount;
- (unsigned)threadStateSize;
- (void)dealloc;
- (void)threadStateForThreadNum:(unsigned int)a3;
@end

@implementation VMUTaskThreadStates

- (unint64_t)stackPointerForThreadNum:(unsigned int)a3
{
  stackPointers = self->_stackPointers;
  if (stackPointers && self->_threadCount > a3) {
    return stackPointers[a3];
  }
  else {
    return 0;
  }
}

- (VMUTaskThreadStates)initWithVMUTask:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)VMUTaskThreadStates;
  v5 = [(VMUTaskThreadStates *)&v38 init];
  if (!v5) {
    goto LABEL_34;
  }
  mach_vm_address_t v37 = 0;
  unsigned int v36 = 0;
  v6 = [v4 memoryCache];
  uint64_t v7 = [v6 taskThreadsWithList:&v37 listCnt:&v36];

  if (v7)
  {
    uint64_t v8 = [v4 pid];
    v9 = mach_error_string(v7);
    NSLog(&cfstr_UnableToGather.isa, v8, v9, v7);
    goto LABEL_4;
  }
  size_t v11 = v36;
  v5->_unint64_t threadCount = v36;
  v5->_stackPointers = (unint64_t *)malloc_type_calloc(v11, 8uLL, 0x100004000313F17uLL);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v33 = 0u;
  memset(__src, 0, sizeof(__src));
  if (!v5->_threadCount)
  {
    mach_vm_deallocate(*MEMORY[0x1E4F14960], v37, 0);
    goto LABEL_34;
  }
  unint64_t v12 = 0;
  while (1)
  {
    v5->_size_t threadStateSize = 272;
    int v31 = 68;
    v13 = [v4 memoryCache];
    uint64_t v14 = [v13 threadGetState:*(unsigned int *)(v37 + 4 * v12) withFlavor:6 oldState:__src oldStateCnt:&v31];

    id v15 = v4;
    if ([v15 isExclave])
    {
      int v16 = HIDWORD(v35);
      if ((BYTE12(v35) & 1) == 0)
      {
        *(void *)&long long v35 = -[VMUTask ptrauthStripFunctionPointer:]((uint64_t)v15, v35);
        int v16 = HIDWORD(v35);
      }
      if ((v16 & 3) != 0)
      {
        if ((v16 & 1) == 0) {
          goto LABEL_18;
        }
      }
      else
      {
        *(void *)&long long v34 = -[VMUTask ptrauthStripFunctionPointer:]((uint64_t)v15, v34);
        int v16 = HIDWORD(v35);
        if ((BYTE12(v35) & 1) == 0)
        {
LABEL_18:
          *((void *)&v34 + 1) = -[VMUTask ptrauthStripFunctionPointer:]((uint64_t)v15, *((uint64_t *)&v34 + 1));
          int v16 = HIDWORD(v35);
          if (BYTE12(v35)) {
            goto LABEL_20;
          }
LABEL_19:
          *((void *)&v33 + 1) = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v15, *((uint64_t *)&v33 + 1));
          int v16 = HIDWORD(v35);
          goto LABEL_20;
        }
      }
      if ((v16 & 1) == 0) {
        goto LABEL_19;
      }
    }
    else
    {
      int v16 = HIDWORD(v35);
      uint64_t v17 = v34;
      if ((BYTE12(v35) & 3) == 0) {
        uint64_t v17 = v34;
      }
      *(void *)&long long v34 = v17;
    }
LABEL_20:
    HIDWORD(v35) = v16 & 0xFFFFFFF2 | 1;

    unint64_t v18 = *((void *)&v34 + 1);
    if (v14) {
      break;
    }
    threadStates = (char *)v5->_threadStates;
    if (!threadStates)
    {
      threadStates = (char *)malloc_type_calloc(v5->_threadCount, v5->_threadStateSize, 0xA118E699uLL);
      v5->_threadStates = threadStates;
    }
    v5->_stackPointers[v12] = v18;
    size_t threadStateSize = v5->_threadStateSize;
    if (threadStateSize) {
      memcpy(&threadStates[(threadStateSize * v12)], __src, threadStateSize);
    }
    ++v12;
    unint64_t threadCount = v5->_threadCount;
    if (v12 >= threadCount)
    {
      if (threadCount) {
        goto LABEL_27;
      }
LABEL_32:
      vm_map_t v26 = *MEMORY[0x1E4F14960];
      mach_vm_address_t v27 = v37;
      mach_vm_size_t v25 = 0;
      goto LABEL_33;
    }
  }
  uint64_t v28 = [v15 pid];
  v29 = mach_error_string(v14);
  NSLog(&cfstr_UnableToGetThr.isa, v12, v28, v29, v14);
  if (!v5->_threadCount) {
    goto LABEL_32;
  }
LABEL_27:
  unint64_t v22 = 0;
  v23 = (ipc_space_t *)MEMORY[0x1E4F14960];
  do
  {
    mach_port_deallocate(*v23, *(_DWORD *)(v37 + 4 * v22++));
    unint64_t v24 = v5->_threadCount;
  }
  while (v22 < v24);
  mach_vm_size_t v25 = 4 * v24;
  vm_map_t v26 = *v23;
  mach_vm_address_t v27 = v37;
LABEL_33:
  mach_vm_deallocate(v26, v27, v25);
  if (!v14)
  {
LABEL_34:
    v10 = v5;
    goto LABEL_35;
  }
LABEL_4:
  v10 = 0;
LABEL_35:

  return v10;
}

- (unsigned)threadCount
{
  return self->_threadCount;
}

- (void)dealloc
{
  stackPointers = self->_stackPointers;
  if (stackPointers) {
    free(stackPointers);
  }
  threadStates = self->_threadStates;
  if (threadStates) {
    free(threadStates);
  }
  v5.receiver = self;
  v5.super_class = (Class)VMUTaskThreadStates;
  [(VMUTaskThreadStates *)&v5 dealloc];
}

- (VMUTaskThreadStates)initWithPid:(int)a3 task:(unsigned int)a4
{
  objc_super v5 = [[VMUTask alloc] initWithTask:*(void *)&a4];
  v6 = [(VMUTaskThreadStates *)self initWithVMUTask:v5];

  return v6;
}

- (void)threadStateForThreadNum:(unsigned int)a3
{
  threadStates = (char *)self->_threadStates;
  if (threadStates && self->_threadCount > a3) {
    return &threadStates[self->_threadStateSize * a3];
  }
  else {
    return 0;
  }
}

- (unsigned)threadStateSize
{
  return self->_threadStateSize;
}

@end