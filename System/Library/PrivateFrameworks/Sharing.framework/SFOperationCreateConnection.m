@interface SFOperationCreateConnection
@end

@implementation SFOperationCreateConnection

void ___SFOperationCreateConnection_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = MEMORY[0x1A626D0F0](a2);
  if (v4 == MEMORY[0x1E4F145A8])
  {
    if (a2 == (void *)MEMORY[0x1E4F14528])
    {
      v12 = framework_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v28[0]) = 0;
        _os_log_impl(&dword_1A5389000, v12, OS_LOG_TYPE_DEFAULT, "Connection to sharingd became invalid", (uint8_t *)v28, 2u);
      }
    }
    else
    {
      v9 = (void *)MEMORY[0x1E4F14520];
      v10 = framework_log();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
      if (a2 == v9)
      {
        if (v11) {
          ___SFOperationCreateConnection_block_invoke_cold_1(v10);
        }
        uint64_t v18 = *(void *)(a1 + 32);
        v19 = *(void **)(v18 + 184);
        *(void *)(v18 + 184) = 0;
        if (CFEqual(*(CFTypeRef *)(v18 + 48), @"Status")
          || CFEqual(*(CFTypeRef *)(v18 + 48), @"Listener")
          || CFEqual(*(CFTypeRef *)(v18 + 48), @"Controller")
          || CFEqual(*(CFTypeRef *)(v18 + 48), @"Information"))
        {
          SFOperationResume(v18);
        }
        else
        {
          CFAllocatorRef v20 = CFGetAllocator((CFTypeRef)v18);
          v21 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D530];
          v22 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
          Mutable = CFDictionaryCreateMutable(v20, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
          v24 = CFDictionaryCreateMutable(v20, 0, v21, v22);
          if (CFEqual(*(CFTypeRef *)(v18 + 48), @"Sender")
            || CFEqual(*(CFTypeRef *)(v18 + 48), @"Receiver"))
          {
            CFStringRef v25 = copyLocalizedStringForKey(@"Transfer Failed");
            if (v25)
            {
              CFStringRef v26 = v25;
              CFDictionarySetValue(v24, (const void *)*MEMORY[0x1E4F1D170], v25);
              CFRelease(v26);
            }
          }
          CFErrorRef v27 = CFErrorCreate(v20, @"SFOperation", -10, v24);
          CFDictionarySetValue(Mutable, @"Error", v27);
          _SFOperationNotifyClient(v18, 10, Mutable);
          if (Mutable) {
            CFRelease(Mutable);
          }
          CFRelease(v24);
          CFRelease(v27);
        }
        xpc_release(v19);
      }
      else if (v11)
      {
        ___SFOperationCreateConnection_block_invoke_cold_2(v10);
      }
    }
  }
  else if (v4 == MEMORY[0x1E4F14590])
  {
    context = xpc_connection_get_context(*(xpc_connection_t *)(a1 + 40));
    xpc_object_t value = xpc_dictionary_get_value(a2, "Results");
    if (value)
    {
      v7 = value;
      CFDictionaryRef v8 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 0x40000000;
      v28[2] = ___SFOperationCreateResultsFromXPCObject_block_invoke;
      v28[3] = &__block_descriptor_tmp_367;
      v28[4] = 0;
      v28[5] = v8;
      xpc_dictionary_apply(v7, v28);
    }
    else
    {
      CFDictionaryRef v8 = 0;
    }
    uint64_t uint64 = xpc_dictionary_get_uint64(a2, "Events");
    v14 = CFDictionaryGetValue(v8, @"Node");
    if (v14)
    {
      uint64_t v15 = (uint64_t)v14;
      v16 = SFOperationCopyProperty((uint64_t)context, @"Node");
      if (v16)
      {
        v17 = v16;
        _SFNodeUpdateCachedChildNode((uint64_t)v16, v15);
        CFRelease(v17);
      }
    }
    _SFOperationNotifyClient((uint64_t)context, uint64, v8);
    if (v8) {
      CFRelease(v8);
    }
  }
}

void ___SFOperationCreateConnection_block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A5389000, log, OS_LOG_TYPE_ERROR, "Lost connection to sharingd", v1, 2u);
}

void ___SFOperationCreateConnection_block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A5389000, log, OS_LOG_TYPE_ERROR, "Unknown XPC error", v1, 2u);
}

@end