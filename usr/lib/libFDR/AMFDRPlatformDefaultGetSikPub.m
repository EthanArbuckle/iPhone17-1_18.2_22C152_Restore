@interface AMFDRPlatformDefaultGetSikPub
@end

@implementation AMFDRPlatformDefaultGetSikPub

void ___AMFDRPlatformDefaultGetSikPub_block_invoke(uint64_t a1)
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  v3 = *(const void **)(a1 + 32);
  if (v3)
  {
    CFTypeID v4 = CFGetTypeID(v3);
    if (v4 == AMFDRGetTypeID()) {
      CFAllocatorRef v2 = CFGetAllocator(*(CFTypeRef *)(a1 + 32));
    }
  }
  CFStringRef v5 = (const __CFString *)AMFDRDeviceCopySikPub(v2);
  if (v5)
  {
    CFStringRef v6 = v5;
    _AMFDRPlatformDefaultGetSikPub_key = (uint64_t)AMFDRCreateInstanceString(v2, v5);
    CFRelease(v6);
  }
}

@end