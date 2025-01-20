@interface AXSVideosPreferenceDomain
@end

@implementation AXSVideosPreferenceDomain

CFStringRef ___AXSVideosPreferenceDomain_block_invoke()
{
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  v1 = AXCPSharedResourcesDirectory();
  CFStringRef result = CFStringCreateWithFormat(v0, 0, @"%@/Library/Preferences/%@", v1, @"com.apple.videos");
  _AXSVideosPreferenceDomain_Domain = (uint64_t)result;
  return result;
}

@end