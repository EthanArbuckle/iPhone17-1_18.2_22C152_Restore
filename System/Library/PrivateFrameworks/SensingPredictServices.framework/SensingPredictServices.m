uint64_t SPXPCGetNextClientID()
{
  if (SPXPCGetNextClientID_sOnce != -1) {
    dispatch_once(&SPXPCGetNextClientID_sOnce, &__block_literal_global);
  }
  return atomic_fetch_add((atomic_uint *volatile)&SPXPCGetNextClientID_sNext, 1u) + 1;
}

uint64_t __SPXPCGetNextClientID_block_invoke()
{
  uint64_t result = RandomBytes();
  SPXPCGetNextClientID_sNext = (unsigned __int16)word_26A583EAA << 16;
  return result;
}

uint64_t LogPrintF()
{
  return MEMORY[0x270F243F8]();
}

uint64_t NSAppendPrintF()
{
  return MEMORY[0x270F24450]();
}

uint64_t NSAppendPrintF_safe()
{
  return MEMORY[0x270F24458]();
}

uint64_t NSDecodeSInt64RangedIfPresent()
{
  return MEMORY[0x270F24470]();
}

uint64_t NSErrorF()
{
  return MEMORY[0x270F24490]();
}

uint64_t RandomBytes()
{
  return MEMORY[0x270F24630]();
}

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x270F24858]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

uint64_t vproc_swap_string()
{
  return MEMORY[0x270EDBB10]();
}