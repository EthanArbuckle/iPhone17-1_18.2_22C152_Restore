__CFString *getEventDescription(void *a1)
{
  id v1;
  id v2;
  void *v3;
  __CFString *v4;
  uint64_t EventFlags;
  id v6;
  unint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __CFString *v15;
  __CFString *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, unsigned int *);
  void *v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t vars8;

  v1 = a1;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = (id)0xAAAAAAAAAAAAAAAALL;
  v29 = (id)objc_opt_new();
  v2 = objc_alloc_init(MEMORY[0x263F089D8]);
  v3 = [v1 children];
  v4 = @"Unknown";
  if (v1)
  {
    EventFlags = IOHIDEventGetEventFlags();
    v18 = MEMORY[0x263EF8330];
    v19 = 3221225472;
    v20 = __getEventDescription_block_invoke;
    v21 = &unk_264A04D40;
    v23 = &v24;
    v6 = v1;
    v22 = v6;
    [v6 enumerateFieldsWithBlock:&v18];
    if (v3)
    {
      for (i = 0; i < [v3 count]; ++i)
      {
        v8 = [v3 objectAtIndex:i];
        v9 = getEventDescription();
        [v2 appendString:v9];
      }
    }
    v10 = NSString;
    v11 = [v6 senderID];
    v12 = [v6 timestamp];
    v13 = [v6 type];
    [v6 type];
    v14 = [v10 stringWithFormat:@"SenderID:%llx Timestamp:%llu Type:%u TypeStr:%s Flags:%u %@ Children:{ %@ }, ", v11, v12, v13, IOHIDEventGetTypeString(), EventFlags, v25[5], v2, v18, v19, v20, v21];
    v15 = (__CFString *)v14;
    if (v14) {
      v16 = (__CFString *)v14;
    }
    else {
      v16 = @"Unknown";
    }
    v4 = v16;
  }
  else
  {
    v15 = @"Unknown";
  }

  _Block_object_dispose(&v24, 8);

  return v4;
}

void sub_22F3DC8F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t __getEventDescription_block_invoke(uint64_t result, unsigned int *a2)
{
  int v2 = a2[1] & 0x3F;
  if (v2 == 2)
  {
    v3 = *(void **)(*(void *)(*(void *)(result + 40) + 8) + 40);
    uint64_t v4 = *((void *)a2 + 1);
    [*(id *)(result + 32) doubleValueForField:*a2];
    return [v3 appendFormat:@"%s:%f ", v4, v5];
  }
  else if (v2 == 1)
  {
    return [*(id *)(*(void *)(*(void *)(result + 40) + 8) + 40) appendFormat:@"%s:%ld ", *((void *)a2 + 1), [*(id *)(result + 32) integerValueForField:*a2]];
  }
  return result;
}

uint64_t OSLogCopyFormattedString(const char *a1, void *a2)
{
  id v3 = a2;
  if (!strcmp(a1, "event"))
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F0EC40]) initWithData:v3];
    id v7 = objc_alloc(MEMORY[0x263F089B8]);
    v8 = getEventDescription(v4);
    uint64_t v6 = [v7 initWithString:v8];
  }
  else
  {
    uint64_t v4 = [NSString stringWithFormat:@"%@", v3];
    id v5 = objc_alloc(MEMORY[0x263F089B8]);
    if (!v4)
    {
      uint64_t v6 = [v5 initWithString:@"INVALID STRING"];
      goto LABEL_7;
    }
    uint64_t v6 = [v5 initWithString:v4];
  }

LABEL_7:
  return v6;
}

uint64_t IOHIDEventGetEventFlags()
{
  return MEMORY[0x270EF4330]();
}

uint64_t IOHIDEventGetTypeString()
{
  return MEMORY[0x270EF4390]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}