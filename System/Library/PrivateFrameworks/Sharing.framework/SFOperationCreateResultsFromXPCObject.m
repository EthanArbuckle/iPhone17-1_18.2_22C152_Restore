@interface SFOperationCreateResultsFromXPCObject
@end

@implementation SFOperationCreateResultsFromXPCObject

uint64_t ___SFOperationCreateResultsFromXPCObject_block_invoke(uint64_t a1, char *__s1, void *a3)
{
  if (!strcmp(__s1, "Operation"))
  {
    if (MEMORY[0x1A626D0F0](a3) == MEMORY[0x1E4F145F0])
    {
      CFAllocatorRef v10 = *(const __CFAllocator **)(a1 + 32);
      string_ptr = xpc_string_get_string_ptr(a3);
      CFStringRef v7 = CFStringCreateWithCString(v10, string_ptr, 0x8000100u);
      Internal = (const void *)_SFOperationCreateInternal(*(void *)(a1 + 32), @"Receiver", v7);
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 40), @"Receiver", Internal);
      if (Internal) {
        CFRelease(Internal);
      }
      if (v7) {
        goto LABEL_12;
      }
    }
  }
  else
  {
    CFStringRef v6 = CFStringCreateWithCString(0, __s1, 0x8000100u);
    if (v6)
    {
      CFStringRef v7 = v6;
      if (CFEqual(v6, @"Node") || CFEqual(v7, @"SenderNode"))
      {
        uint64_t v8 = _SFNodeCreateWithXPCObject(*(void *)(a1 + 32), a3);
        goto LABEL_6;
      }
      if (CFEqual(v7, @"FileIcon") || CFEqual(v7, @"SmallFileIcon"))
      {
        CFDataRef v14 = (const __CFData *)_CFXPCCreateCFObjectFromXPCObject();
        if (!v14) {
          goto LABEL_12;
        }
        CFDataRef v15 = v14;
        CFTypeID v16 = CFGetTypeID(v14);
        if (v16 == CFDataGetTypeID())
        {
          CGImageRef CGImageWithData = createCGImageWithData(v15);
LABEL_19:
          CFErrorRef v9 = CGImageWithData;
          goto LABEL_29;
        }
      }
      else
      {
        if (!CFEqual(v7, @"Error"))
        {
          uint64_t v8 = _CFXPCCreateCFObjectFromXPCObject();
LABEL_6:
          CFErrorRef v9 = (CFErrorRef)v8;
          if (!v8)
          {
LABEL_12:
            CFRelease(v7);
            return 1;
          }
LABEL_7:
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 40), v7, v9);
          CFRelease(v9);
          goto LABEL_12;
        }
        if (!xpc_dictionary_get_value(a3, "Domain")) {
          goto LABEL_12;
        }
        CFDataRef v18 = (const __CFData *)_CFXPCCreateCFObjectFromXPCObject();
        if (!v18) {
          goto LABEL_12;
        }
        CFDataRef v15 = v18;
        CFTypeID v19 = CFGetTypeID(v18);
        if (v19 == CFStringGetTypeID())
        {
          int64_t int64 = xpc_dictionary_get_int64(a3, "Code");
          if (!xpc_dictionary_get_value(a3, "UserInfo")
            || (CFDictionaryRef v21 = (const __CFDictionary *)_CFXPCCreateCFObjectFromXPCObject()) == 0)
          {
            CGImageRef CGImageWithData = CFErrorCreate(*(CFAllocatorRef *)(a1 + 32), (CFErrorDomain)v15, int64, 0);
            goto LABEL_19;
          }
          CFDictionaryRef v22 = v21;
          CFTypeID v23 = CFGetTypeID(v21);
          if (v23 == CFDictionaryGetTypeID()) {
            CFDictionaryRef v24 = v22;
          }
          else {
            CFDictionaryRef v24 = 0;
          }
          CFErrorRef v9 = CFErrorCreate(*(CFAllocatorRef *)(a1 + 32), (CFErrorDomain)v15, int64, v24);
          CFRelease(v22);
LABEL_29:
          CFRelease(v15);
          if (!v9) {
            goto LABEL_12;
          }
          goto LABEL_7;
        }
      }
      CFErrorRef v9 = 0;
      goto LABEL_29;
    }
  }
  return 1;
}

@end