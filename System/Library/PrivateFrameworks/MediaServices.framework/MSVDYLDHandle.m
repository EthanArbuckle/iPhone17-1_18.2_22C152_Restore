@interface MSVDYLDHandle
@end

@implementation MSVDYLDHandle

void ___MSVDYLDHandle_block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CFDictionaryGetValue((CFDictionaryRef)__dlHandles, *(const void **)(a1 + 32));
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = dlopen((const char *)[*(id *)(a1 + 32) fileSystemRepresentation], 2);
    v2 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    if (v2)
    {
      v3 = (__CFDictionary *)__dlHandles;
      v4 = *(const void **)(a1 + 32);
      CFDictionarySetValue(v3, v4, v2);
    }
    else
    {
      uint64_t v5 = *(void *)(a1 + 32);
      v6 = dlerror();
      NSLog(&cfstr_CouldNotWeakLi.isa, v5, v6);
    }
  }
}

uint64_t ___MSVDYLDHandle_block_invoke()
{
  __dlHandles = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D048], 0);
  __handlesQueue = (uint64_t)dispatch_queue_create(0, 0);
  return MEMORY[0x1F41817F8]();
}

@end