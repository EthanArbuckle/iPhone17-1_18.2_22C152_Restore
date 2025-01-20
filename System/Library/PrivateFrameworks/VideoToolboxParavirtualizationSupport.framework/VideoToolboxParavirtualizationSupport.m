uint64_t VTParavirtualizationGuestSupportSetUpWithHandlers(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void block[7];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = sub_23F48C778;
  block[3] = &unk_265071528;
  block[4] = a1;
  block[5] = a2;
  block[6] = a3;
  if (qword_26AA7F420 != -1) {
    dispatch_once(&qword_26AA7F420, block);
  }
  return dword_26AA7F428;
}

uint64_t sub_23F48C778(const void **a1)
{
  qword_26AA7F430 = (uint64_t)_Block_copy(a1[4]);
  qword_26AA7F440 = (uint64_t)_Block_copy(a1[5]);
  qword_26AA7F438 = (uint64_t)_Block_copy(a1[6]);
  CFDictionaryRef v2 = IOServiceMatching("AppleVideoToolboxParavirtualizationDriver");
  io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x263F0EC88], v2);
  if (!MatchingService) {
    goto LABEL_9;
  }
  io_object_t v4 = MatchingService;
  IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0, (io_connect_t *)&dword_268C3E7F0);
  IOObjectRelease(v4);
  if (!dword_268C3E7F0
    || (dword_268C3E7F4 = IODataQueueAllocateNotificationPort()) == 0
    || (v5 = dispatch_queue_create("com.apple.videotoolbox.paravirtualization.host-to-guest", 0),
        (qword_268C3E7F8 = (uint64_t)v5) == 0)
    || (v6 = dispatch_source_create(MEMORY[0x263EF83C8], dword_268C3E7F4, 0, v5),
        (qword_268C3E800 = (uint64_t)v6) == 0))
  {
LABEL_9:
    uint64_t result = 4294948206;
LABEL_10:
    dword_26AA7F428 = result;
    return result;
  }
  dispatch_source_set_event_handler(v6, &unk_26F32BC98);
  dispatch_resume((dispatch_object_t)qword_268C3E800);
  uint64_t result = MEMORY[0x2455CBEA0](dword_268C3E7F0, 0, dword_268C3E7F4, 0);
  if (result) {
    goto LABEL_10;
  }
  uint64_t result = sub_23F48CA54(0x4000uLL);
  if (result) {
    goto LABEL_10;
  }
  return result;
}

uint64_t sub_23F48C8BC()
{
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  v1 = (mach_msg_header_t *)CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x263EFFB08], 92, 0);
  CFDictionaryRef v2 = v1;
  *(void *)&v1->msgh_bits = 0x5C00000000;
  mach_port_name_t v3 = dword_268C3E7F4;
  v1->msgh_remote_port = 0;
  v1->msgh_local_port = v3;
  v1->msgh_id = 0;
  for (mach_msg_size_t i = 92; mach_msg(v1, 117440518, 0, i, v3, 0, 0) == 268451844; mach_msg_size_t i = v5)
  {
    unsigned int v5 = (v2->msgh_size + 71) & 0xFFFFFFFC;
    v1 = (mach_msg_header_t *)CFAllocatorReallocate(v0, v2, v5, 0);
    CFDictionaryRef v2 = v1;
    v1->msgh_bits = 0;
    v1->msgh_size = v5;
    mach_port_name_t v3 = dword_268C3E7F4;
    v1->msgh_remote_port = 0;
    v1->msgh_local_port = v3;
    v1->msgh_id = 0;
  }
  CFAllocatorDeallocate(v0, v2);
  do
  {
    data = 0;
    uint64_t v11 = 0;
    IOReturn v6 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t *, void **))(qword_26AA7F430 + 16))(qword_26AA7F430, 0x4000, &v11, &data);
    if (!v6)
    {
      uint32_t dataSize = 0x4000;
      IOReturn v6 = IODataQueueDequeue((IODataQueueMemory *)qword_268C3E820, data, &dataSize);
      if (!v6) {
        IOReturn v6 = (*(uint64_t (**)(uint64_t, uint64_t, void))(qword_26AA7F440 + 16))(qword_26AA7F440, v11, dataSize);
      }
    }
    IOReturn v7 = v6;
    if (v11) {
      (*(void (**)(void))(qword_26AA7F438 + 16))();
    }
  }
  while (!v7);
  return IOConnectCallScalarMethod(dword_268C3E7F0, 4u, 0, 0, 0, 0);
}

uint64_t sub_23F48CA54(uint64_t a1)
{
  input[1] = *MEMORY[0x263EF8340];
  input[0] = a1;
  uint64_t output = 0;
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  uint32_t outputCnt = 3;
  uint64_t result = IOConnectCallScalarMethod(dword_268C3E7F0, 0, input, 1u, &output, &outputCnt);
  if (!result)
  {
    if (outputCnt == 3)
    {
      uint64_t result = 0;
      qword_268C3E810 = output;
      qword_268C3E818 = v4;
      qword_268C3E820 = v5;
    }
    else
    {
      return 4294948206;
    }
  }
  return result;
}

uint64_t VTParavirtualizationGuestSupportRegisterGuestUUID(void *inputStruct)
{
  if (dword_268C3E7F0) {
    return IOConnectCallStructMethod(dword_268C3E7F0, 1u, inputStruct, 0x10uLL, 0, 0);
  }
  else {
    return 4294948206;
  }
}

uint64_t VTParavirtualizationGuestSupportDeregisterGuestUUID(void *inputStruct)
{
  if (dword_268C3E7F0) {
    return IOConnectCallStructMethod(dword_268C3E7F0, 2u, inputStruct, 0x10uLL, 0, 0);
  }
  else {
    return 4294948206;
  }
}

uint64_t VTParavirtualizationGuestSupportSendRawMessageToHost(uint64_t a1, uint64_t a2, IOSurfaceRef *a3, unint64_t a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v22 = 0u;
  long long v23 = 0u;
  *(_OWORD *)input = 0u;
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_268C3E808);
  if (dword_268C3E7F0)
  {
    if (a1 && a2)
    {
      unint64_t v8 = 0;
      v9 = (uint64_t *)(a1 + 8);
      uint64_t v10 = a2;
      while (*(v9 - 1))
      {
        uint64_t v11 = *v9;
        v9 += 2;
        v8 += v11;
        if (!--v10)
        {
          uint64_t v12 = 4294954394;
          if (a4 <= 5 && v8 >= 0x30)
          {
            if (v8 <= qword_268C3E810
              || (uint64_t v12 = sub_23F48CA54((v8 + *MEMORY[0x263EF8AF8] - 1) & -*MEMORY[0x263EF8AF8]), !v12))
            {
              v13 = (char *)qword_268C3E818;
              if (!qword_268C3E818) {
                goto LABEL_23;
              }
              v14 = (size_t *)(a1 + 8);
              do
              {
                size_t v15 = *v14;
                memcpy(v13, (const void *)*(v14 - 1), *v14);
                v13 += v15;
                v14 += 2;
                --a2;
              }
              while (a2);
              input[0] = v8;
              if (a3 && a4)
              {
                v16 = &input[1];
                do
                {
                  if (!*a3) {
                    break;
                  }
                  *v16++ = IOSurfaceGetID(*a3++);
                  --a4;
                }
                while (a4);
              }
              uint64_t v17 = IOConnectCallScalarMethod(dword_268C3E7F0, 3u, input, 6u, &output, &outputCnt);
              if (v17) {
                uint64_t v12 = v17;
              }
              else {
                uint64_t v12 = output;
              }
            }
          }
          goto LABEL_22;
        }
      }
    }
    uint64_t v12 = 4294954394;
  }
  else
  {
LABEL_23:
    uint64_t v12 = 4294948206;
  }
LABEL_22:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_268C3E808);
  return v12;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x270EE4290](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

void *__cdecl CFAllocatorReallocate(CFAllocatorRef allocator, void *ptr, CFIndex newsize, CFOptionFlags hint)
{
  return (void *)MEMORY[0x270EE42B0](allocator, ptr, newsize, hint);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x270EF3F38](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F40](*(void *)&connection, *(void *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectSetNotificationPort(io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return MEMORY[0x270EF3F78](*(void *)&connect, *(void *)&type, *(void *)&port, reference);
}

mach_port_t IODataQueueAllocateNotificationPort(void)
{
  return MEMORY[0x270EF3FD8]();
}

IOReturn IODataQueueDequeue(IODataQueueMemory *dataQueue, void *data, uint32_t *dataSize)
{
  return MEMORY[0x270EF3FE8](dataQueue, data, dataSize);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D68](buffer);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x270EDA190](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}